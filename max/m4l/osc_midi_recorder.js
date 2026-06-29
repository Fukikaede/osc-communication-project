autowatch = 1;
inlets = 1;
outlets = 3;

/*
 * OSC MIDI Recorder for Max for Live
 *
 * Python から 8002 番ポートに送られる /seq_low, /seq_mid, /seq_high, /pad を受け取り、
 * Ableton Live の Session View MIDI clip に声部別 note と pad note として書き込む。
 * 採用した take は duplicate_clip_to_arrangement で Arrangement View にコピーできる。
 *
 * 受信 payload:
 *   /seq_<voice> bar_id beat i j freq_hz dur_beat vel ...
 *
 * Live API に書き込む note:
 *   pitch      : freq_hz を 12 平均律の MIDI note number に丸めた値
 *   start_time : 記録開始 bar からの beat 位置
 *   duration   : Python 生成イベントの dur_beat
 *   velocity   : Python 生成イベントの vel
 */

var baseTrackIndex = 0;
var useCurrentTrack = 0;
var voiceTracks = {
    high: 1,
    mid: 2,
    low: 3,
    pad: 4
};
var voiceOrder = ["high", "mid", "low", "pad"];
var slotIndex = 0;
var clipLengthBeats = 16.0;
var beatsPerBar = 4.0;
var recording = 0;
var startBar = null;
var receivedBars = 0;
var addedNotes = 0;
var arrangementBeat = 0.0;

post("[OSC_MIDI_Recorder] script loaded: /Users/kaede/Codex/osc-communication-project/max/m4l/osc_midi_recorder.js\n");

function init() {
    ensureAllVoiceClips();
    status();
}

function track(v) {
    setBaseTrack(v);
}

function base_track(v) {
    setBaseTrack(v);
}

function setBaseTrack(v) {
    baseTrackIndex = Math.max(0, parseInt(v, 10) || 0);
    useCurrentTrack = 0;
    voiceTracks.high = baseTrackIndex + 1;
    voiceTracks.mid = baseTrackIndex + 2;
    voiceTracks.low = baseTrackIndex + 3;
    voiceTracks.pad = baseTrackIndex + 4;
    status();
}

function current_track(v) {
    useCurrentTrack = parseInt(v, 10) ? 1 : 0;
    if (useCurrentTrack) {
        var currentTrack = currentDeviceTrackApi();
        if (validApi(currentTrack)) {
            baseTrackIndex = trackIndexFromPath(currentTrack.unquotedpath);
            voiceTracks.high = baseTrackIndex + 1;
            voiceTracks.mid = baseTrackIndex + 2;
            voiceTracks.low = baseTrackIndex + 3;
            voiceTracks.pad = baseTrackIndex + 4;
        }
    }
    status();
}

function use_current_track(v) {
    current_track(v);
}

function slot(v) {
    slotIndex = Math.max(0, parseInt(v, 10) || 0);
    status();
}

function length(v) {
    var n = parseFloat(v);
    if (!isFinite(n) || n <= 0) {
        return;
    }
    clipLengthBeats = n;
    setAllClipLengths(clipLengthBeats);
    status();
}

function bars(v) {
    var n = parseFloat(v);
    if (!isFinite(n) || n <= 0) {
        return;
    }
    length(n * beatsPerBar);
}

function bpb(v) {
    var n = parseFloat(v);
    if (!isFinite(n) || n <= 0) {
        return;
    }
    beatsPerBar = n;
    status();
}

function record(v) {
    recording = parseInt(v, 10) ? 1 : 0;
    if (recording) {
        startBar = null;
        ensureAllVoiceClips();
        say("record:on");
    } else {
        say("record:off");
    }
}

function new_take() {
    recreate();
    recording = 1;
    outlet(2, recording);
    say("new take: record:on");
}

function stop_take() {
    recording = 0;
    outlet(2, recording);
    say("take stopped");
}

function arrangement_start(v) {
    var n = parseFloat(v);
    if (!isFinite(n) || n < 0) {
        return;
    }
    arrangementBeat = n;
    status();
}

function arrange_start(v) {
    arrangement_start(v);
}

function arrangement_pos(v) {
    arrangement_start(v);
}

function reset_arrangement() {
    arrangementBeat = 0.0;
    say("arrangement position reset: " + arrangementBeat);
}

function commit_arrangement() {
    recording = 0;
    outlet(2, recording);

    var targetBeat = arrangementBeat;
    var committed = 0;
    for (var i = 0; i < voiceOrder.length; i += 1) {
        var voice = voiceOrder[i];
        var clip = ensureVoiceClip(voice);
        var trackApi = voiceTrackApi(voice);
        if (!clip || !validApi(trackApi)) {
            say("error: cannot commit " + voice + " clip to arrangement");
            continue;
        }
        try {
            trackApi.call("duplicate_clip_to_arrangement", liveObjectArg(clip), targetBeat);
            committed += 1;
        } catch (e) {
            say("error: duplicate_clip_to_arrangement failed for " + voice + ": " + e);
        }
    }

    if (committed > 0) {
        arrangementBeat += clipLengthBeats;
        back_to_arrangement();
        say(
            "committed " + committed +
            " clips to arrangement at beat " + targetBeat +
            "; next=" + arrangementBeat
        );
    } else {
        say("error: no clips committed to arrangement");
    }
    status();
}

function commit() {
    commit_arrangement();
}

function back_to_arrangement() {
    for (var i = 0; i < voiceOrder.length; i += 1) {
        var trackApi = voiceTrackApi(voiceOrder[i]);
        if (validApi(trackApi)) {
            trackApi.set("back_to_arranger", 0);
        }
    }
    say("voice tracks returned to arrangement playback");
}

function reset_start() {
    startBar = null;
    receivedBars = 0;
    say("start bar reset");
}

function clear() {
    for (var i = 0; i < voiceOrder.length; i += 1) {
        var voice = voiceOrder[i];
        var clip = ensureVoiceClip(voice);
        if (!clip) {
            continue;
        }
        var currentLength = getNumber(clip.get("length"), clipLengthBeats);
        clip.call("remove_notes_extended", 0, 128, 0, Math.max(currentLength, clipLengthBeats));
    }
    addedNotes = 0;
    startBar = null;
    receivedBars = 0;
    say("voice clip notes cleared");
}

function recreate() {
    for (var i = 0; i < voiceOrder.length; i += 1) {
        var voice = voiceOrder[i];
        var slot = voiceClipSlotApi(voice);
        if (!validApi(slot)) {
            say("error: invalid " + voice + " clip slot at track " + voiceTracks[voice]);
            continue;
        }
        if (getNumber(slot.get("has_clip"), 0) != 0) {
            slot.call("delete_clip");
        }
        slot.call("create_clip", clipLengthBeats);
        var clip = clipApi(slot);
        if (validApi(clip)) {
            setClipLength(clip, clipLengthBeats);
        }
    }
    addedNotes = 0;
    startBar = null;
    receivedBars = 0;
    say("voice clips recreated");
}

function test_note() {
    var testPitches = {
        high: 72,
        mid: 60,
        low: 48,
        pad: 36
    };
    var n = 0;
    for (var i = 0; i < voiceOrder.length; i += 1) {
        var voice = voiceOrder[i];
        var clip = ensureVoiceClip(voice);
        if (!clip) {
            continue;
        }
        clip.call("add_new_notes", { notes: [
            {
                pitch: testPitches[voice],
                start_time: 0,
                duration: 1,
                velocity: 100,
                mute: 0
            }
        ] });
        n += 1;
    }
    addedNotes += n;
    outlet(1, addedNotes);
    say("test notes added: " + n);
}

function status() {
    say(
        "base_track=" + baseTrackIndex +
        " high=" + voiceTracks.high +
        " mid=" + voiceTracks.mid +
        " low=" + voiceTracks.low +
        " pad=" + voiceTracks.pad +
        " slot=" + slotIndex +
        " length_beats=" + clipLengthBeats +
        " bpb=" + beatsPerBar +
        " arrangement_beat=" + arrangementBeat +
        " recording=" + recording +
        " notes=" + addedNotes
    );
}

function seq_low() {
    handleSeq("low", arrayfromargs(arguments));
}

function seq_mid() {
    handleSeq("mid", arrayfromargs(arguments));
}

function seq_high() {
    handleSeq("high", arrayfromargs(arguments));
}

function pad() {
    handlePad(arrayfromargs(arguments));
}

function list() {
    handleSeq("mid", arrayfromargs(arguments));
}

function anything() {
    var args = arrayfromargs(arguments);
    if (messagename == "/seq_low" || messagename == "seq_low") {
        handleSeq("low", args);
    } else if (messagename == "/seq_mid" || messagename == "seq_mid") {
        handleSeq("mid", args);
    } else if (messagename == "/seq_high" || messagename == "seq_high") {
        handleSeq("high", args);
    } else if (messagename == "/pad" || messagename == "pad") {
        handlePad(args);
    }
}

function handleSeq(voice, args) {
    if (!recording) {
        return;
    }
    if (args.length < 7) {
        say("ignored: short /seq_mid payload");
        return;
    }

    var barId = parseInt(args[0], 10);
    if (!isFinite(barId)) {
        say("ignored: invalid bar id");
        return;
    }
    if (startBar === null) {
        startBar = barId;
    }

    var notes = [];
    for (var i = 1; i + 5 < args.length; i += 6) {
        var beat = parseFloat(args[i]);
        var freq = parseFloat(args[i + 3]);
        var dur = parseFloat(args[i + 4]);
        var vel = parseFloat(args[i + 5]);

        if (!isFinite(beat) || !isFinite(freq) || !isFinite(dur) || !isFinite(vel)) {
            continue;
        }
        if (freq <= 0 || dur <= 0) {
            continue;
        }

        var start = (barId - startBar) * beatsPerBar + beat;
        if (start < 0 || start >= clipLengthBeats) {
            continue;
        }

        var pitch = freqToMidi(freq);
        var duration = Math.min(dur, clipLengthBeats - start);
        if (duration <= 0) {
            continue;
        }

        notes.push({
            pitch: pitch,
            start_time: start,
            duration: duration,
            velocity: clamp(vel, 1, 127),
            mute: 0
        });
    }

    if (notes.length == 0) {
        return;
    }

    var clip = ensureVoiceClip(voice);
    if (!clip) {
        return;
    }
    clip.call("add_new_notes", { notes: notes });
    receivedBars += 1;
    addedNotes += notes.length;
    outlet(1, addedNotes);
}

function handlePad(args) {
    if (!recording) {
        return;
    }
    if (args.length < 4) {
        say("ignored: short /pad payload");
        return;
    }

    var barId = parseInt(args[0], 10);
    var rootFreq = parseFloat(args[1]);
    var durBeats = parseFloat(args[2]);
    var vel = parseFloat(args[3]);

    if (!isFinite(barId) || !isFinite(rootFreq) || !isFinite(durBeats) || !isFinite(vel)) {
        say("ignored: invalid /pad payload");
        return;
    }
    if (rootFreq <= 0 || durBeats <= 0) {
        return;
    }
    if (startBar === null) {
        startBar = barId;
    }

    var start = (barId - startBar) * beatsPerBar;
    if (start < 0 || start >= clipLengthBeats) {
        return;
    }

    var rootPitch = freqToMidi(rootFreq);
    var duration = Math.min(durBeats, clipLengthBeats - start);
    var velocity = clamp(vel, 1, 127);
    var pitches = [
        rootPitch,
        clamp(rootPitch + 7, 0, 127),
        clamp(rootPitch + 12, 0, 127)
    ];
    var notes = [];
    for (var i = 0; i < pitches.length; i += 1) {
        notes.push({
            pitch: pitches[i],
            start_time: start,
            duration: duration,
            velocity: velocity,
            mute: 0
        });
    }

    var clip = ensureVoiceClip("pad");
    if (!clip) {
        return;
    }
    clip.call("add_new_notes", { notes: notes });
    addedNotes += notes.length;
    outlet(1, addedNotes);
}

function ensureAllVoiceClips() {
    var ok = 1;
    for (var i = 0; i < voiceOrder.length; i += 1) {
        if (!ensureVoiceClip(voiceOrder[i])) {
            ok = 0;
        }
    }
    return ok;
}

function ensureVoiceClip(voice) {
    var slot = voiceClipSlotApi(voice);
    if (!validApi(slot)) {
        say("error: invalid " + voice + " track/slot. track=" + voiceTracks[voice] + " slot=" + slotIndex);
        return null;
    }
    if (getNumber(slot.get("has_clip"), 0) == 0) {
        slot.call("create_clip", clipLengthBeats);
    }
    var clip = clipApi(slot);
    if (!validApi(clip)) {
        say("error: invalid clip. The target track must be MIDI.");
        return null;
    }
    setClipLength(clip, clipLengthBeats);
    return clip;
}

function voiceClipSlotApi(voice) {
    return clipSlotApiForTrack(voiceTracks[voice]);
}

function voiceTrackApi(voice) {
    return trackApiForTrack(voiceTracks[voice]);
}

function trackApiForTrack(trackIndex) {
    var resolved = resolvedTrackIndex(trackIndex);
    if (resolved < 0) {
        return null;
    }
    return new LiveAPI("live_set tracks " + resolved);
}

function clipSlotApiForTrack(trackIndex) {
    var resolved = resolvedTrackIndex(trackIndex);
    if (resolved < 0) {
        return null;
    }
    return new LiveAPI("live_set tracks " + resolved + " clip_slots " + slotIndex);
}

function resolvedTrackIndex(trackIndex) {
    if (useCurrentTrack) {
        var track = currentDeviceTrackApi();
        if (!validApi(track)) {
            return -1;
        }
        var currentTrackIndex = trackIndexFromPath(track.unquotedpath);
        var relativeIndex = trackIndex - baseTrackIndex;
        return currentTrackIndex + relativeIndex;
    }
    return trackIndex;
}

function debug_paths() {
    reportApi("live_set");
    reportApi("this_device");
    reportApi("this_device canonical_parent");
    for (var i = 0; i < voiceOrder.length; i += 1) {
        var voice = voiceOrder[i];
        reportApi("live_set tracks " + voiceTracks[voice]);
        reportApi("live_set tracks " + voiceTracks[voice] + " clip_slots " + slotIndex);
    }
}

function reportApi(path) {
    var api = new LiveAPI(path);
    say("path " + path + " -> id=" + api.id + " type=" + api.type + " path=" + api.unquotedpath);
}

function clipApi(slot) {
    return new LiveAPI(slot.unquotedpath + " clip");
}

function currentDeviceTrackApi() {
    return new LiveAPI("this_device canonical_parent");
}

function trackIndexFromPath(path) {
    var m = String(path).match(/live_set tracks (\d+)/);
    if (m) {
        return parseInt(m[1], 10);
    }
    return baseTrackIndex;
}

function setAllClipLengths(len) {
    for (var i = 0; i < voiceOrder.length; i += 1) {
        var clip = ensureVoiceClip(voiceOrder[i]);
        if (clip) {
            setClipLength(clip, len);
        }
    }
}

function setClipLength(clip, len) {
    clip.set("start_marker", 0);
    clip.set("end_marker", len);
    clip.set("loop_start", 0);
    clip.set("loop_end", len);
}

function freqToMidi(freq) {
    return Math.round(clamp(69 + 12 * (Math.log(freq / 440.0) / Math.log(2)), 0, 127));
}

function clamp(v, lo, hi) {
    return Math.max(lo, Math.min(hi, v));
}

function validApi(api) {
    return api && api.id != 0;
}

function liveObjectArg(api) {
    var id = String(api.id);
    if (id.indexOf("id ") == 0) {
        return id;
    }
    return "id " + id;
}

function getNumber(v, fallback) {
    if (v instanceof Array) {
        v = v[0];
    }
    var n = Number(v);
    return isFinite(n) ? n : fallback;
}

function say(msg) {
    outlet(0, msg);
    post("[OSC_MIDI_Recorder] " + msg + "\n");
}
