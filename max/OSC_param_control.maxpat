{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 0,
      "revision": 5,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      120.0,
      120.0,
      1080.0,
      880.0
    ],
    "gridsize": [
      15.0,
      15.0
    ],
    "boxes": [
      {
        "box": {
          "id": "obj-1",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            20.0,
            680.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "OSC Param Control (ODOT) - parameter control + preset scenes (no auto pull)"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            60.0,
            170.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "udpsend 127.0.0.1 8001"
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "patching_rect": [
            220.0,
            60.0,
            100.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "udpreceive 8000"
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "newobj",
          "patching_rect": [
            220.0,
            95.0,
            650.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 13,
          "text": "o.route /ack /grid /rgrid /stat /seq /seq_low /seq_mid /seq_high /pdf /rpdf /pdf_low /pdf_high"
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "newobj",
          "patching_rect": [
            220.0,
            130.0,
            70.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "print ack"
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "patching_rect": [
            300.0,
            130.0,
            70.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "print stat"
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "patching_rect": [
            380.0,
            130.0,
            150.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "print unmatched_from_py"
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "button",
          "patching_rect": [
            30.0,
            100.0,
            24.0,
            24.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "newobj",
          "patching_rect": [
            60.0,
            100.0,
            80.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /hello"
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "button",
          "patching_rect": [
            30.0,
            130.0,
            24.0,
            24.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "newobj",
          "patching_rect": [
            60.0,
            130.0,
            100.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /grid_now"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            165.0,
            360.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "Manual /pull test only (use OSC_communication.maxpat for continuous pull)"
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "button",
          "patching_rect": [
            30.0,
            190.0,
            24.0,
            24.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "patching_rect": [
            60.0,
            190.0,
            100.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "counter 0 999999"
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "number",
          "patching_rect": [
            170.0,
            190.0,
            60.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "varname": "beats_per_bar"
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "newobj",
          "patching_rect": [
            240.0,
            190.0,
            85.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "loadmess 4"
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "patching_rect": [
            60.0,
            220.0,
            50.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "text": "pack i i"
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "newobj",
          "patching_rect": [
            120.0,
            220.0,
            80.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /pull"
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "comment",
          "patching_rect": [
            430.0,
            165.0,
            220.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "Scene Presets (click to recall)"
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "preset",
          "patching_rect": [
            430.0,
            190.0,
            150.0,
            40.0
          ],
          "numinlets": 1,
          "numoutlets": 5,
          "outlettype": [
            "preset",
            "int",
            "preset",
            "int",
            ""
          ],
          "preset_data": [
            {
              "number": 1,
              "data": [
                5,
                "obj-24",
                "number",
                "float",
                0.75,
                5,
                "obj-28",
                "number",
                "float",
                1.0,
                5,
                "obj-32",
                "number",
                "float",
                0.1,
                5,
                "obj-36",
                "number",
                "float",
                0.18,
                5,
                "obj-40",
                "number",
                "float",
                0.7,
                5,
                "obj-44",
                "number",
                "float",
                0.9,
                5,
                "obj-48",
                "number",
                "float",
                260.0,
                5,
                "obj-52",
                "number",
                "float",
                300.0,
                5,
                "obj-56",
                "number",
                "int",
                88,
                5,
                "obj-60",
                "number",
                "int",
                1,
                5,
                "obj-64",
                "number",
                "int",
                16,
                5,
                "obj-68",
                "number",
                "int",
                42
              ]
            },
            {
              "number": 2,
              "data": [
                5,
                "obj-24",
                "number",
                "float",
                0.45,
                5,
                "obj-28",
                "number",
                "float",
                1.0,
                5,
                "obj-32",
                "number",
                "float",
                0.0,
                5,
                "obj-36",
                "number",
                "float",
                0.1,
                5,
                "obj-40",
                "number",
                "float",
                0.92,
                5,
                "obj-44",
                "number",
                "float",
                0.55,
                5,
                "obj-48",
                "number",
                "float",
                300.0,
                5,
                "obj-52",
                "number",
                "float",
                360.0,
                5,
                "obj-56",
                "number",
                "int",
                80,
                5,
                "obj-60",
                "number",
                "int",
                1,
                5,
                "obj-64",
                "number",
                "int",
                16,
                5,
                "obj-68",
                "number",
                "int",
                77
              ]
            },
            {
              "number": 3,
              "data": [
                5,
                "obj-24",
                "number",
                "float",
                1.35,
                5,
                "obj-28",
                "number",
                "float",
                1.0,
                5,
                "obj-32",
                "number",
                "float",
                -0.35,
                5,
                "obj-36",
                "number",
                "float",
                0.35,
                5,
                "obj-40",
                "number",
                "float",
                0.35,
                5,
                "obj-44",
                "number",
                "float",
                1.4,
                5,
                "obj-48",
                "number",
                "float",
                180.0,
                5,
                "obj-52",
                "number",
                "float",
                220.0,
                5,
                "obj-56",
                "number",
                "int",
                96,
                5,
                "obj-60",
                "number",
                "int",
                1,
                5,
                "obj-64",
                "number",
                "int",
                16,
                5,
                "obj-68",
                "number",
                "int",
                101
              ]
            },
            {
              "number": 4,
              "data": [
                5,
                "obj-24",
                "number",
                "float",
                2.2,
                5,
                "obj-28",
                "number",
                "float",
                1.0,
                5,
                "obj-32",
                "number",
                "float",
                0.55,
                5,
                "obj-36",
                "number",
                "float",
                0.62,
                5,
                "obj-40",
                "number",
                "float",
                0.15,
                5,
                "obj-44",
                "number",
                "float",
                2.2,
                5,
                "obj-48",
                "number",
                "float",
                80.0,
                5,
                "obj-52",
                "number",
                "float",
                120.0,
                5,
                "obj-56",
                "number",
                "int",
                105,
                5,
                "obj-60",
                "number",
                "int",
                0,
                5,
                "obj-64",
                "number",
                "int",
                16,
                5,
                "obj-68",
                "number",
                "int",
                777
              ]
            },
            {
              "number": 5,
              "data": [
                5,
                "obj-24",
                "number",
                "float",
                0.2,
                5,
                "obj-28",
                "number",
                "float",
                1.0,
                5,
                "obj-32",
                "number",
                "float",
                0.0,
                5,
                "obj-36",
                "number",
                "float",
                0.05,
                5,
                "obj-40",
                "number",
                "float",
                0.85,
                5,
                "obj-44",
                "number",
                "float",
                0.7,
                5,
                "obj-48",
                "number",
                "float",
                350.0,
                5,
                "obj-52",
                "number",
                "float",
                420.0,
                5,
                "obj-56",
                "number",
                "int",
                70,
                5,
                "obj-60",
                "number",
                "int",
                1,
                5,
                "obj-64",
                "number",
                "int",
                16,
                5,
                "obj-68",
                "number",
                "int",
                42
              ]
            }
          ]
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "comment",
          "patching_rect": [
            590.0,
            188.0,
            320.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "1 Balanced  2 Harmonic  3 Tense"
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "comment",
          "patching_rect": [
            590.0,
            208.0,
            320.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "4 Chaotic   5 Clean Drone-ish"
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            280.0,
            180.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "sigma_pitch"
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "flonum",
          "patching_rect": [
            220.0,
            280.0,
            70.0,
            22.0
          ],
          "format": 6,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "varname": "sigma_pitch"
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "newobj",
          "patching_rect": [
            300.0,
            280.0,
            85.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "loadmess 1.0"
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            280.0,
            250.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /param/sigma_pitch"
        }
      },
      {
        "box": {
          "id": "obj-27",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            310.0,
            180.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "sigma_rhythm"
        }
      },
      {
        "box": {
          "id": "obj-28",
          "maxclass": "flonum",
          "patching_rect": [
            220.0,
            310.0,
            70.0,
            22.0
          ],
          "format": 6,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "varname": "sigma_rhythm"
        }
      },
      {
        "box": {
          "id": "obj-29",
          "maxclass": "newobj",
          "patching_rect": [
            300.0,
            310.0,
            85.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "loadmess 1.0"
        }
      },
      {
        "box": {
          "id": "obj-30",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            310.0,
            250.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /param/sigma_rhythm"
        }
      },
      {
        "box": {
          "id": "obj-31",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            340.0,
            180.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "rho"
        }
      },
      {
        "box": {
          "id": "obj-32",
          "maxclass": "flonum",
          "patching_rect": [
            220.0,
            340.0,
            70.0,
            22.0
          ],
          "format": 6,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "varname": "rho"
        }
      },
      {
        "box": {
          "id": "obj-33",
          "maxclass": "newobj",
          "patching_rect": [
            300.0,
            340.0,
            85.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "loadmess 0.0"
        }
      },
      {
        "box": {
          "id": "obj-34",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            340.0,
            250.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /param/rho"
        }
      },
      {
        "box": {
          "id": "obj-35",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            370.0,
            180.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "rhythm_disrupt_max"
        }
      },
      {
        "box": {
          "id": "obj-36",
          "maxclass": "flonum",
          "patching_rect": [
            220.0,
            370.0,
            70.0,
            22.0
          ],
          "format": 6,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "varname": "rhythm_disrupt_max"
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "newobj",
          "patching_rect": [
            300.0,
            370.0,
            85.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "loadmess 0.35"
        }
      },
      {
        "box": {
          "id": "obj-38",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            370.0,
            250.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /param/rhythm_disrupt_max"
        }
      },
      {
        "box": {
          "id": "obj-39",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            400.0,
            180.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "harmony_strength"
        }
      },
      {
        "box": {
          "id": "obj-40",
          "maxclass": "flonum",
          "patching_rect": [
            220.0,
            400.0,
            70.0,
            22.0
          ],
          "format": 6,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "varname": "harmony_strength"
        }
      },
      {
        "box": {
          "id": "obj-41",
          "maxclass": "newobj",
          "patching_rect": [
            300.0,
            400.0,
            85.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "loadmess 0.6"
        }
      },
      {
        "box": {
          "id": "obj-42",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            400.0,
            250.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /param/harmony_strength"
        }
      },
      {
        "box": {
          "id": "obj-43",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            430.0,
            180.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "tau"
        }
      },
      {
        "box": {
          "id": "obj-44",
          "maxclass": "flonum",
          "patching_rect": [
            220.0,
            430.0,
            70.0,
            22.0
          ],
          "format": 6,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "varname": "tau"
        }
      },
      {
        "box": {
          "id": "obj-45",
          "maxclass": "newobj",
          "patching_rect": [
            300.0,
            430.0,
            85.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "loadmess 1.0"
        }
      },
      {
        "box": {
          "id": "obj-46",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            430.0,
            250.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /param/tau"
        }
      },
      {
        "box": {
          "id": "obj-47",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            460.0,
            180.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "min_spacing_cents_mid"
        }
      },
      {
        "box": {
          "id": "obj-48",
          "maxclass": "flonum",
          "patching_rect": [
            220.0,
            460.0,
            70.0,
            22.0
          ],
          "format": 6,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "varname": "min_spacing_cents_mid"
        }
      },
      {
        "box": {
          "id": "obj-49",
          "maxclass": "newobj",
          "patching_rect": [
            300.0,
            460.0,
            85.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "loadmess 260.0"
        }
      },
      {
        "box": {
          "id": "obj-50",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            460.0,
            250.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /param/min_spacing_cents_mid"
        }
      },
      {
        "box": {
          "id": "obj-51",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            490.0,
            180.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "min_spacing_cents_high"
        }
      },
      {
        "box": {
          "id": "obj-52",
          "maxclass": "flonum",
          "patching_rect": [
            220.0,
            490.0,
            70.0,
            22.0
          ],
          "format": 6,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "varname": "min_spacing_cents_high"
        }
      },
      {
        "box": {
          "id": "obj-53",
          "maxclass": "newobj",
          "patching_rect": [
            300.0,
            490.0,
            85.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "loadmess 260.0"
        }
      },
      {
        "box": {
          "id": "obj-54",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            490.0,
            250.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /param/min_spacing_cents_high"
        }
      },
      {
        "box": {
          "id": "obj-55",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            520.0,
            180.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "vel"
        }
      },
      {
        "box": {
          "id": "obj-56",
          "maxclass": "number",
          "patching_rect": [
            220.0,
            520.0,
            70.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "varname": "vel"
        }
      },
      {
        "box": {
          "id": "obj-57",
          "maxclass": "newobj",
          "patching_rect": [
            300.0,
            520.0,
            85.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "loadmess 96"
        }
      },
      {
        "box": {
          "id": "obj-58",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            520.0,
            250.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /param/vel"
        }
      },
      {
        "box": {
          "id": "obj-59",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            550.0,
            180.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "send_pdf"
        }
      },
      {
        "box": {
          "id": "obj-60",
          "maxclass": "number",
          "patching_rect": [
            220.0,
            550.0,
            70.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "varname": "send_pdf"
        }
      },
      {
        "box": {
          "id": "obj-61",
          "maxclass": "newobj",
          "patching_rect": [
            300.0,
            550.0,
            85.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "loadmess 1"
        }
      },
      {
        "box": {
          "id": "obj-62",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            550.0,
            250.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /param/send_pdf"
        }
      },
      {
        "box": {
          "id": "obj-63",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            580.0,
            180.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "max_events_per_bar"
        }
      },
      {
        "box": {
          "id": "obj-64",
          "maxclass": "number",
          "patching_rect": [
            220.0,
            580.0,
            70.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "varname": "max_events_per_bar"
        }
      },
      {
        "box": {
          "id": "obj-65",
          "maxclass": "newobj",
          "patching_rect": [
            300.0,
            580.0,
            85.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "loadmess 16"
        }
      },
      {
        "box": {
          "id": "obj-66",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            580.0,
            250.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /param/max_events_per_bar"
        }
      },
      {
        "box": {
          "id": "obj-67",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            610.0,
            180.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "seed_base"
        }
      },
      {
        "box": {
          "id": "obj-68",
          "maxclass": "number",
          "patching_rect": [
            220.0,
            610.0,
            70.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "varname": "seed_base"
        }
      },
      {
        "box": {
          "id": "obj-69",
          "maxclass": "newobj",
          "patching_rect": [
            300.0,
            610.0,
            85.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "loadmess 42"
        }
      },
      {
        "box": {
          "id": "obj-70",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            610.0,
            250.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "text": "o.pack /param/seed_base"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "obj-3",
            0
          ],
          "destination": [
            "obj-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-4",
            0
          ],
          "destination": [
            "obj-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-4",
            3
          ],
          "destination": [
            "obj-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-4",
            12
          ],
          "destination": [
            "obj-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-8",
            0
          ],
          "destination": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-9",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-10",
            0
          ],
          "destination": [
            "obj-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-11",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-13",
            0
          ],
          "destination": [
            "obj-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-14",
            0
          ],
          "destination": [
            "obj-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-15",
            0
          ],
          "destination": [
            "obj-17",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            0
          ],
          "destination": [
            "obj-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-18",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-16",
            0
          ],
          "destination": [
            "obj-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-25",
            0
          ],
          "destination": [
            "obj-24",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-24",
            0
          ],
          "destination": [
            "obj-26",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-26",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-29",
            0
          ],
          "destination": [
            "obj-28",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-28",
            0
          ],
          "destination": [
            "obj-30",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-30",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-33",
            0
          ],
          "destination": [
            "obj-32",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-32",
            0
          ],
          "destination": [
            "obj-34",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-34",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-37",
            0
          ],
          "destination": [
            "obj-36",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-36",
            0
          ],
          "destination": [
            "obj-38",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-38",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-41",
            0
          ],
          "destination": [
            "obj-40",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-40",
            0
          ],
          "destination": [
            "obj-42",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-42",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-45",
            0
          ],
          "destination": [
            "obj-44",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-44",
            0
          ],
          "destination": [
            "obj-46",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-46",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-49",
            0
          ],
          "destination": [
            "obj-48",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-48",
            0
          ],
          "destination": [
            "obj-50",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-50",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-53",
            0
          ],
          "destination": [
            "obj-52",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-52",
            0
          ],
          "destination": [
            "obj-54",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-54",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-57",
            0
          ],
          "destination": [
            "obj-56",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-56",
            0
          ],
          "destination": [
            "obj-58",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-58",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-61",
            0
          ],
          "destination": [
            "obj-60",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-60",
            0
          ],
          "destination": [
            "obj-62",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-62",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-65",
            0
          ],
          "destination": [
            "obj-64",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-64",
            0
          ],
          "destination": [
            "obj-66",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-66",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-69",
            0
          ],
          "destination": [
            "obj-68",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-68",
            0
          ],
          "destination": [
            "obj-70",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-70",
            0
          ],
          "destination": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-24",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-28",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-32",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-36",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-40",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-44",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-48",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-52",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-56",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-60",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-64",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-68",
            0
          ]
        }
      }
    ]
  }
}