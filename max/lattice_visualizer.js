autowatch = 1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var gridState = {
    imin: -6,
    imax: 6,
    jmin: -6,
    jmax: 6,
    nx: 13,
    ny: 13
};

var pdfState = {
    low: { values: [], max: 0 },
    mid: { values: [], max: 0 },
    high: { values: [], max: 0 }
};

var flashes = [];
var maxFlashes = 160;
var flashMs = 1500;
var freqMin = 110.0;
var freqMax = 1760.0;
var viewMode = "surface";

var colors = {
    low: [0.18, 0.78, 0.52],
    mid: [0.22, 0.48, 0.96],
    high: [1.0, 0.56, 0.22],
    inactive: [0.24, 0.26, 0.29],
    grid: [0.20, 0.22, 0.25],
    range: [0.66, 0.69, 0.74],
    plane: [0.82, 0.86, 0.92],
    text: [0.78, 0.80, 0.84],
    bg: [0.055, 0.06, 0.07]
};

var drawTask = new Task(tick, this);
drawTask.interval = 50;
drawTask.repeat();

function notifydeleted() {
    drawTask.cancel();
}

function bang() {
    tick();
}

function clear() {
    flashes = [];
    pdfState.low = { values: [], max: 0 };
    pdfState.mid = { values: [], max: 0 };
    pdfState.high = { values: [], max: 0 };
    redraw();
}

function surface() {
    viewMode = "surface";
    redraw();
}

function lattice() {
    viewMode = "lattice";
    redraw();
}

function mode(v) {
    var name = String(v || "").toLowerCase();
    if (name == "surface" || name == "entropy" || name == "3d") {
        surface();
    } else if (name == "lattice" || name == "flat" || name == "2d") {
        lattice();
    }
}

function grid() {
    var a = arrayfromargs(arguments);
    if (a.length < 6) {
        return;
    }
    gridState.imin = parseInt(a[0], 10);
    gridState.imax = parseInt(a[1], 10);
    gridState.jmin = parseInt(a[2], 10);
    gridState.jmax = parseInt(a[3], 10);
    gridState.nx = Math.max(1, parseInt(a[4], 10));
    gridState.ny = Math.max(1, parseInt(a[5], 10));
    redraw();
}

function pdf_low() {
    setPdf("low", arrayfromargs(arguments));
}

function pdf_mid() {
    setPdf("mid", arrayfromargs(arguments));
}

function pdf_high() {
    setPdf("high", arrayfromargs(arguments));
}

function seq_low() {
    addSeq("low", arrayfromargs(arguments));
}

function seq_mid() {
    addSeq("mid", arrayfromargs(arguments));
}

function seq_high() {
    addSeq("high", arrayfromargs(arguments));
}

function setPdf(voice, args) {
    if (args.length < 5) {
        return;
    }

    var imin = parseInt(args[0], 10);
    var imax = parseInt(args[1], 10);
    var jmin = parseInt(args[2], 10);
    var jmax = parseInt(args[3], 10);
    var nx = Math.max(1, imax - imin + 1);
    var ny = Math.max(1, jmax - jmin + 1);

    gridState.imin = imin;
    gridState.imax = imax;
    gridState.jmin = jmin;
    gridState.jmax = jmax;
    gridState.nx = nx;
    gridState.ny = ny;

    var values = [];
    var maxValue = 0;
    for (var k = 4; k < args.length; k++) {
        var v = Math.max(0, parseFloat(args[k]));
        values.push(v);
        if (v > maxValue) {
            maxValue = v;
        }
    }

    pdfState[voice] = { values: values, max: maxValue };
    redraw();
}

function addSeq(voice, args) {
    if (args.length < 7) {
        return;
    }

    var now = timeNow();
    var bar = parseInt(args[0], 10);
    for (var k = 1; k + 5 < args.length; k += 6) {
        flashes.push({
            voice: voice,
            bar: bar,
            beat: parseFloat(args[k]),
            i: parseInt(args[k + 1], 10),
            j: parseInt(args[k + 2], 10),
            freq: parseFloat(args[k + 3]),
            dur: parseFloat(args[k + 4]),
            vel: parseFloat(args[k + 5]),
            time: now
        });
    }

    while (flashes.length > maxFlashes) {
        flashes.shift();
    }
    redraw();
}

function tick() {
    pruneFlashes();
    redraw();
}

function pruneFlashes() {
    var now = timeNow();
    var kept = [];
    for (var k = 0; k < flashes.length; k++) {
        if (now - flashes[k].time <= flashMs) {
            kept.push(flashes[k]);
        }
    }
    flashes = kept;
}

function paint() {
    var size = getSize();
    var w = Math.max(120, size[0]);
    var h = Math.max(120, size[1]);

    fillRect(0, 0, w, h, colors.bg, 1);

    var marginL = 42;
    var marginR = 18;
    var marginT = 30;
    var marginB = 36;
    var plot = {
        x: marginL,
        y: marginT,
        w: Math.max(20, w - marginL - marginR),
        h: Math.max(20, h - marginT - marginB)
    };

    if (viewMode == "surface") {
        drawSurfaceView(w, h, plot);
        return;
    }

    drawTitle(w);
    drawRangeTiles(plot);
    drawGrid(plot);
    drawProbabilities(plot);
    drawPoints(plot);
    drawFlashes(plot);
    drawLegend(w, h);
}

function drawTitle(w) {
    mgraphics.set_source_rgba(colors.text[0], colors.text[1], colors.text[2], 0.9);
    mgraphics.select_font_face("Arial");
    mgraphics.set_font_size(11);
    mgraphics.move_to(12, 18);
    mgraphics.show_text("2^i * 3^j pitch lattice");

    mgraphics.set_source_rgba(colors.text[0], colors.text[1], colors.text[2], 0.55);
    mgraphics.move_to(Math.max(170, w - 92), 18);
    mgraphics.show_text("active voices");
}

function drawSurfaceView(w, h, plot) {
    var entropy = entropyOfSurface();

    drawSurfaceTitle(w, entropy);
    drawSurfaceFrame(plot);
    drawSurfaceGround(plot);
    drawAudibleRangeMesh(plot);
    drawEntropyPlane(plot, entropy);
    drawSurfaceWire(plot);
    drawSurfacePoints(plot);
    drawSurfaceFlashes(plot);
    drawSurfaceAxes(plot);
    drawLegend(w, h);
}

function drawSurfaceTitle(w, entropy) {
    mgraphics.set_source_rgba(colors.text[0], colors.text[1], colors.text[2], 0.9);
    mgraphics.select_font_face("Arial");
    mgraphics.set_font_size(11);
    mgraphics.move_to(12, 18);
    mgraphics.show_text("entropy probability surface");

    mgraphics.set_source_rgba(colors.text[0], colors.text[1], colors.text[2], 0.6);
    mgraphics.move_to(Math.max(160, w - 90), 18);
    mgraphics.show_text("H " + entropy.toFixed(2));
}

function drawSurfaceFrame(plot) {
    var base = surfaceCorners(0, plot);
    var top = surfaceCorners(1, plot);

    polygon(base, colors.range, 0.045, 0.22);
    polygon(top, colors.range, 0.018, 0.18);

    for (var k = 0; k < 4; k++) {
        line(base[k].x, base[k].y, top[k].x, top[k].y, colors.range, 0.16);
    }
}

function drawSurfaceGround(plot) {
    var i;
    var j;
    var p1;
    var p2;

    mgraphics.set_line_width(1);
    for (i = gridState.imin; i <= gridState.imax; i++) {
        p1 = surfacePoint(i, gridState.jmin, 0, plot);
        p2 = surfacePoint(i, gridState.jmax, 0, plot);
        line(p1.x, p1.y, p2.x, p2.y, colors.grid, 0.28);
    }

    for (j = gridState.jmin; j <= gridState.jmax; j++) {
        p1 = surfacePoint(gridState.imin, j, 0, plot);
        p2 = surfacePoint(gridState.imax, j, 0, plot);
        line(p1.x, p1.y, p2.x, p2.y, colors.grid, 0.28);
    }
}

function drawAudibleRangeMesh(plot) {
    var i;
    var j;
    var p1;
    var p2;

    mgraphics.set_line_width(1.1);
    for (i = gridState.imin; i < gridState.imax; i++) {
        for (j = gridState.jmin; j <= gridState.jmax; j++) {
            if (!isAudibleCoord(i, j) || !isAudibleCoord(i + 1, j)) {
                continue;
            }
            p1 = surfacePoint(i, j, 0, plot);
            p2 = surfacePoint(i + 1, j, 0, plot);
            line(p1.x, p1.y, p2.x, p2.y, colors.range, 0.26);

            p1 = surfacePoint(i, j, 1, plot);
            p2 = surfacePoint(i + 1, j, 1, plot);
            line(p1.x, p1.y, p2.x, p2.y, colors.range, 0.10);
        }
    }

    for (j = gridState.jmin; j < gridState.jmax; j++) {
        for (i = gridState.imin; i <= gridState.imax; i++) {
            if (!isAudibleCoord(i, j) || !isAudibleCoord(i, j + 1)) {
                continue;
            }
            p1 = surfacePoint(i, j, 0, plot);
            p2 = surfacePoint(i, j + 1, 0, plot);
            line(p1.x, p1.y, p2.x, p2.y, colors.range, 0.26);

            p1 = surfacePoint(i, j, 1, plot);
            p2 = surfacePoint(i, j + 1, 1, plot);
            line(p1.x, p1.y, p2.x, p2.y, colors.range, 0.10);
        }
    }
}

function drawEntropyPlane(plot, entropy) {
    var z = clamp01(entropy);
    var pts = surfaceCorners(z, plot);
    var label = pts[1];

    polygon(pts, colors.plane, 0.075, 0.42);

    mgraphics.set_source_rgba(colors.plane[0], colors.plane[1], colors.plane[2], 0.7);
    mgraphics.set_font_size(9);
    mgraphics.move_to(label.x + 6, label.y + 3);
    mgraphics.show_text("H plane");
}

function drawSurfaceWire(plot) {
    var i;
    var j;
    var p1;
    var p2;
    var z1;
    var z2;
    var col;
    var alpha;

    mgraphics.set_line_width(1.2);
    for (i = gridState.imin; i <= gridState.imax; i++) {
        for (j = gridState.jmin; j < gridState.jmax; j++) {
            if (!isAudibleCoord(i, j) || !isAudibleCoord(i, j + 1)) {
                continue;
            }
            z1 = surfaceHeight(i, j);
            z2 = surfaceHeight(i, j + 1);
            p1 = surfacePoint(i, j, z1, plot);
            p2 = surfacePoint(i, j + 1, z2, plot);
            col = colors[dominantVoice(i, z1 >= z2 ? j : j + 1)];
            alpha = 0.08 + 0.68 * Math.max(z1, z2);
            line(p1.x, p1.y, p2.x, p2.y, col, alpha);
        }
    }

    for (j = gridState.jmin; j <= gridState.jmax; j++) {
        for (i = gridState.imin; i < gridState.imax; i++) {
            if (!isAudibleCoord(i, j) || !isAudibleCoord(i + 1, j)) {
                continue;
            }
            z1 = surfaceHeight(i, j);
            z2 = surfaceHeight(i + 1, j);
            p1 = surfacePoint(i, j, z1, plot);
            p2 = surfacePoint(i + 1, j, z2, plot);
            col = colors[dominantVoice(z1 >= z2 ? i : i + 1, j)];
            alpha = 0.08 + 0.68 * Math.max(z1, z2);
            line(p1.x, p1.y, p2.x, p2.y, col, alpha);
        }
    }
}

function drawSurfacePoints(plot) {
    var i;
    var j;
    var z;
    var top;
    var base;
    var col;
    var radius;

    for (i = gridState.imin; i <= gridState.imax; i++) {
        for (j = gridState.jmin; j <= gridState.jmax; j++) {
            if (!isAudibleFreq(freqFor(i, j))) {
                continue;
            }

            z = surfaceHeight(i, j);
            top = surfacePoint(i, j, z, plot);
            base = surfacePoint(i, j, 0, plot);
            col = colors[dominantVoice(i, j)];
            radius = 2.4 + 5.6 * z;

            line(base.x, base.y, top.x, top.y, col, 0.12 + 0.32 * z);
            circle(base.x, base.y, 2.2, col, 0.30, true);
            circle(top.x, top.y, radius, col, 0.34 + 0.54 * z, true);
            if (z > 0.04) {
                circle(top.x, top.y, radius + 3.2, col, 0.16 + 0.24 * z, false);
            }
        }
    }
}

function drawSurfaceFlashes(plot) {
    var now = timeNow();
    var flash;
    var age;
    var life;
    var z;
    var p;
    var col;
    var radius;

    for (var k = 0; k < flashes.length; k++) {
        flash = flashes[k];
        age = now - flash.time;
        life = 1 - age / flashMs;
        if (life <= 0) {
            continue;
        }

        z = Math.max(0.12, surfaceHeight(flash.i, flash.j));
        p = surfacePoint(flash.i, flash.j, z + 0.06 * life, plot);
        col = colors[flash.voice];
        radius = 5 + 12 * life;

        circle(p.x, p.y, radius, col, 0.18 * life, true);
        circle(p.x, p.y, radius * 0.48, col, 0.85 * life, false);
        circle(p.x, p.y, 3.0, col, 0.95 * life, true);
    }
}

function drawSurfaceAxes(plot) {
    var o = surfacePoint(gridState.imin, gridState.jmin, 0, plot);
    var ax = surfacePoint(gridState.imax, gridState.jmin, 0, plot);
    var ay = surfacePoint(gridState.imin, gridState.jmax, 0, plot);
    var az = surfacePoint(gridState.imin, gridState.jmin, 1, plot);

    mgraphics.set_line_width(1.5);
    line(o.x, o.y, ax.x, ax.y, colors.text, 0.45);
    line(o.x, o.y, ay.x, ay.y, colors.text, 0.45);
    line(o.x, o.y, az.x, az.y, colors.text, 0.45);

    mgraphics.set_source_rgba(colors.text[0], colors.text[1], colors.text[2], 0.68);
    mgraphics.set_font_size(10);
    mgraphics.move_to(ax.x + 5, ax.y + 4);
    mgraphics.show_text("x2");
    mgraphics.move_to(ay.x + 5, ay.y + 4);
    mgraphics.show_text("x3");
    mgraphics.move_to(az.x + 4, az.y - 3);
    mgraphics.show_text("pdf");
}

function drawRangeTiles(plot) {
    var cellW = plot.w / Math.max(1, gridState.nx - 1);
    var cellH = plot.h / Math.max(1, gridState.ny - 1);
    var tileW = Math.max(3, cellW * 0.86);
    var tileH = Math.max(3, cellH * 0.86);
    var i;
    var j;
    var p;
    var freq;
    var col;
    var alpha;

    for (i = gridState.imin; i <= gridState.imax; i++) {
        for (j = gridState.jmin; j <= gridState.jmax; j++) {
            p = pointFor(i, j, plot);
            freq = freqFor(i, j);
            col = colors[foldedVoiceForFreq(freq)];
            alpha = isAudibleFreq(freq) ? 0.12 : 0.055;
            fillRect(p.x - tileW * 0.5, p.y - tileH * 0.5, tileW, tileH, col, alpha);
        }
    }
}

function drawGrid(plot) {
    var i;
    var j;
    var p1;
    var p2;

    mgraphics.set_line_width(1);
    for (i = gridState.imin; i <= gridState.imax; i++) {
        p1 = pointFor(i, gridState.jmin, plot);
        p2 = pointFor(i, gridState.jmax, plot);
        line(p1.x, p1.y, p2.x, p2.y, colors.grid, 0.45);
    }

    for (j = gridState.jmin; j <= gridState.jmax; j++) {
        p1 = pointFor(gridState.imin, j, plot);
        p2 = pointFor(gridState.imax, j, plot);
        line(p1.x, p1.y, p2.x, p2.y, colors.grid, 0.45);
    }

    mgraphics.set_source_rgba(colors.text[0], colors.text[1], colors.text[2], 0.65);
    mgraphics.set_font_size(10);
    mgraphics.move_to(plot.x + plot.w - 24, plot.y + plot.h + 22);
    mgraphics.show_text("i");
    mgraphics.move_to(plot.x - 22, plot.y + 10);
    mgraphics.show_text("j");

    mgraphics.set_font_size(8);
    for (i = gridState.imin; i <= gridState.imax; i += 3) {
        p1 = pointFor(i, gridState.jmin, plot);
        mgraphics.move_to(p1.x - 7, plot.y + plot.h + 12);
        mgraphics.show_text(String(i));
    }
    for (j = gridState.jmin; j <= gridState.jmax; j += 3) {
        p1 = pointFor(gridState.imin, j, plot);
        mgraphics.move_to(plot.x - 26, p1.y + 3);
        mgraphics.show_text(String(j));
    }
}

function drawProbabilities(plot) {
    var voices = ["low", "mid", "high"];
    var i;
    var j;
    var voice;
    var p;
    var value;
    var norm;
    var col;
    var radius;
    var alpha;

    for (var v = 0; v < voices.length; v++) {
        voice = voices[v];
        if (pdfState[voice].max <= 0) {
            continue;
        }

        for (i = gridState.imin; i <= gridState.imax; i++) {
            for (j = gridState.jmin; j <= gridState.jmax; j++) {
                value = pdfAt(voice, i, j);
                if (value <= 0) {
                    continue;
                }
                norm = value / pdfState[voice].max;
                if (norm < 0.015) {
                    continue;
                }
                p = pointFor(i, j, plot);
                col = colors[voice];
                radius = 5 + 18 * Math.sqrt(norm);
                alpha = 0.05 + 0.22 * norm;
                circle(p.x, p.y, radius, col, alpha, true);
            }
        }
    }
}

function drawPoints(plot) {
    var i;
    var j;
    var p;
    var freq;
    var col;
    var alpha;
    var radius;
    var inRange;

    for (i = gridState.imin; i <= gridState.imax; i++) {
        for (j = gridState.jmin; j <= gridState.jmax; j++) {
            p = pointFor(i, j, plot);
            freq = freqFor(i, j);
            inRange = isAudibleFreq(freq);
            col = colors[foldedVoiceForFreq(freq)];
            alpha = inRange ? 0.9 : 0.34;
            radius = inRange ? 3.8 : 2.8;
            circle(p.x, p.y, radius, col, alpha, true);
            if (!inRange) {
                circle(p.x, p.y, radius + 1.6, col, 0.18, false);
            }
        }
    }
}

function drawFlashes(plot) {
    var now = timeNow();
    var flash;
    var age;
    var life;
    var col;
    var p;
    var radius;
    var alpha;

    for (var k = 0; k < flashes.length; k++) {
        flash = flashes[k];
        age = now - flash.time;
        life = 1 - age / flashMs;
        if (life <= 0) {
            continue;
        }

        p = pointFor(flash.i, flash.j, plot);
        col = colors[flash.voice];
        radius = 6 + 12 * life + Math.min(7, Math.max(0, flash.vel - 64) / 9);
        alpha = 0.18 + 0.78 * life;

        circle(p.x, p.y, radius, col, alpha * 0.22, true);
        circle(p.x, p.y, radius * 0.55, col, alpha, false);
        circle(p.x, p.y, 3.2, col, Math.min(1, alpha), true);
    }
}

function drawLegend(w, h) {
    var x = Math.max(128, w - 100);
    var y = h - 18;
    legendItem(x, y, "low", colors.low);
    legendItem(x + 34, y, "mid", colors.mid);
    legendItem(x + 68, y, "high", colors.high);
}

function legendItem(x, y, label, col) {
    circle(x, y - 4, 3.5, col, 0.9, true);
    mgraphics.set_source_rgba(colors.text[0], colors.text[1], colors.text[2], 0.7);
    mgraphics.set_font_size(8);
    mgraphics.move_to(x + 6, y - 1);
    mgraphics.show_text(label);
}

function surfaceCorners(z, plot) {
    return [
        surfacePoint(gridState.imin, gridState.jmin, z, plot),
        surfacePoint(gridState.imax, gridState.jmin, z, plot),
        surfacePoint(gridState.imax, gridState.jmax, z, plot),
        surfacePoint(gridState.imin, gridState.jmax, z, plot)
    ];
}

function surfacePoint(i, j, z, plot) {
    var ix = 0;
    var jy = 0;
    if (gridState.imax !== gridState.imin) {
        ix = (i - gridState.imin) / (gridState.imax - gridState.imin) - 0.5;
    }
    if (gridState.jmax !== gridState.jmin) {
        jy = (j - gridState.jmin) / (gridState.jmax - gridState.jmin) - 0.5;
    }

    var cx = plot.x + plot.w * 0.5;
    var cy = plot.y + plot.h * 0.70;
    return {
        x: cx + (ix - jy) * plot.w * 0.46,
        y: cy + (ix + jy) * plot.h * 0.23 - z * plot.h * 0.52
    };
}

function surfaceHeight(i, j) {
    var maxValue = maxCombinedPdf();
    if (maxValue <= 0) {
        return 0;
    }
    return Math.pow(Math.max(0, combinedPdfAt(i, j)) / maxValue, 0.58);
}

function combinedPdfAt(i, j) {
    return pdfAt("low", i, j) + pdfAt("mid", i, j) + pdfAt("high", i, j);
}

function maxCombinedPdf() {
    var m = 0;
    var i;
    var j;
    for (i = gridState.imin; i <= gridState.imax; i++) {
        for (j = gridState.jmin; j <= gridState.jmax; j++) {
            m = Math.max(m, combinedPdfAt(i, j));
        }
    }
    return m;
}

function dominantVoice(i, j) {
    var low = pdfAt("low", i, j);
    var mid = pdfAt("mid", i, j);
    var high = pdfAt("high", i, j);
    if (low <= 0 && mid <= 0 && high <= 0) {
        return foldedVoiceForFreq(freqFor(i, j));
    }
    if (low >= mid && low >= high) {
        return "low";
    }
    if (mid >= high) {
        return "mid";
    }
    return "high";
}

function entropyOfSurface() {
    var values = [];
    var total = 0;
    var i;
    var j;
    var value;

    for (i = gridState.imin; i <= gridState.imax; i++) {
        for (j = gridState.jmin; j <= gridState.jmax; j++) {
            if (!isAudibleFreq(freqFor(i, j))) {
                continue;
            }
            value = combinedPdfAt(i, j);
            if (value > 0) {
                values.push(value);
                total += value;
            }
        }
    }

    if (total <= 0 || values.length <= 1) {
        return 0;
    }

    var h = 0;
    for (var k = 0; k < values.length; k++) {
        var p = values[k] / total;
        h -= p * Math.log(p);
    }
    return h / Math.log(values.length);
}

function pointFor(i, j, plot) {
    var ix = 0;
    var iy = 0;
    if (gridState.imax !== gridState.imin) {
        ix = (i - gridState.imin) / (gridState.imax - gridState.imin);
    }
    if (gridState.jmax !== gridState.jmin) {
        iy = (j - gridState.jmin) / (gridState.jmax - gridState.jmin);
    }
    return {
        x: plot.x + ix * plot.w,
        y: plot.y + plot.h - iy * plot.h
    };
}

function pdfAt(voice, i, j) {
    var ix = i - gridState.imin;
    var iy = j - gridState.jmin;
    var idx = ix * gridState.ny + iy;
    if (idx < 0 || idx >= pdfState[voice].values.length) {
        return 0;
    }
    return pdfState[voice].values[idx];
}

function freqFor(i, j) {
    return 440.0 * Math.pow(2.0, i) * Math.pow(3.0, j);
}

function isAudibleCoord(i, j) {
    return isAudibleFreq(freqFor(i, j));
}

function isAudibleFreq(freq) {
    return freq >= freqMin && freq <= freqMax;
}

function foldedVoiceForFreq(freq) {
    var f = freq;
    while (f < freqMin) {
        f *= 2.0;
    }
    while (f >= 880.0) {
        f *= 0.5;
    }
    if (f < 220.0) {
        return "low";
    }
    if (f < 440.0) {
        return "mid";
    }
    return "high";
}

function line(x1, y1, x2, y2, col, alpha) {
    mgraphics.set_source_rgba(col[0], col[1], col[2], alpha);
    mgraphics.move_to(x1, y1);
    mgraphics.line_to(x2, y2);
    mgraphics.stroke();
}

function circle(x, y, r, col, alpha, fill) {
    mgraphics.set_source_rgba(col[0], col[1], col[2], alpha);
    mgraphics.arc(x, y, r, 0, Math.PI * 2);
    if (fill) {
        mgraphics.fill();
    } else {
        mgraphics.set_line_width(1.5);
        mgraphics.stroke();
    }
}

function fillRect(x, y, w, h, col, alpha) {
    mgraphics.set_source_rgba(col[0], col[1], col[2], alpha);
    mgraphics.rectangle(x, y, w, h);
    mgraphics.fill();
}

function polygon(points, col, fillAlpha, strokeAlpha) {
    if (!points || points.length < 3) {
        return;
    }

    if (fillAlpha > 0) {
        pathPolygon(points);
        mgraphics.set_source_rgba(col[0], col[1], col[2], fillAlpha);
        mgraphics.fill();
    }

    if (strokeAlpha > 0) {
        pathPolygon(points);
        mgraphics.set_source_rgba(col[0], col[1], col[2], strokeAlpha);
        mgraphics.set_line_width(1.2);
        mgraphics.stroke();
    }
}

function pathPolygon(points) {
    mgraphics.move_to(points[0].x, points[0].y);
    for (var k = 1; k < points.length; k++) {
        mgraphics.line_to(points[k].x, points[k].y);
    }
    mgraphics.close_path();
}

function clamp01(v) {
    return Math.max(0, Math.min(1, v));
}

function getSize() {
    var r = box.rect;
    return [r[2] - r[0], r[3] - r[1]];
}

function timeNow() {
    return new Date().getTime();
}

function redraw() {
    if (mgraphics.redraw) {
        mgraphics.redraw();
    } else if (typeof refresh === "function") {
        refresh();
    }
}
