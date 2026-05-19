{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 1,
      "revision": 4,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      208.0,
      100.0,
      963.0,
      764.0
    ],
    "boxes": [
      {
        "box": {
          "addpoints": [
            0.0,
            0.0,
            0,
            90.1063829787237,
            1.0,
            0,
            364.35710719291234,
            1.0,
            0,
            480.27231315108895,
            0.0,
            0
          ],
          "classic_curve": 1,
          "id": "obj-180",
          "maxclass": "function",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "float",
            "",
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            3307.384222984314,
            1070.0,
            50.00000238418579,
            32.22222375869751
          ]
        }
      },
      {
        "box": {
          "addpoints": [
            0.0,
            0.0,
            0,
            90.1063829787237,
            1.0,
            0,
            364.35710719291234,
            1.0,
            0,
            473.6918729423302,
            0.0,
            0
          ],
          "classic_curve": 1,
          "id": "obj-179",
          "maxclass": "function",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "float",
            "",
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2852.0,
            1084.0,
            50.00000238418579,
            32.22222375869751
          ]
        }
      },
      {
        "box": {
          "addpoints": [
            0.0,
            0.0,
            0,
            118.42729427768718,
            1.0,
            0,
            578.9555559688145,
            1.0,
            0,
            912.2888783223455,
            0.984617856437112,
            0,
            964.9204555360609,
            0.0,
            0
          ],
          "classic_curve": 1,
          "id": "obj-176",
          "maxclass": "function",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "float",
            "",
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2396.6686005592346,
            1024.4444966316223,
            50.00000238418579,
            32.22222375869751
          ]
        }
      },
      {
        "box": {
          "id": "obj-142",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2578.4634120464325,
            1412.195155620575,
            152.0,
            22.0
          ],
          "text": "sprintf setcell %d %d val 1."
        }
      },
      {
        "box": {
          "id": "obj-143",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2578.4634120464325,
            1365.8536911010742,
            59.33762741088867,
            22.0
          ],
          "text": "pack i i"
        }
      },
      {
        "box": {
          "id": "obj-147",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            2617.487803220749,
            1307.3171043395996,
            29.5,
            22.0
          ],
          "text": "+ 6"
        }
      },
      {
        "box": {
          "id": "obj-150",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            2578.4634120464325,
            1307.3171043395996,
            29.5,
            22.0
          ],
          "text": "+ 6"
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2390.658529520035,
            1412.195155620575,
            152.0,
            22.0
          ],
          "text": "sprintf setcell %d %d val 1."
        }
      },
      {
        "box": {
          "id": "obj-77",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2390.658529520035,
            1356.0975933074951,
            59.33762741088867,
            22.0
          ],
          "text": "pack i i"
        }
      },
      {
        "box": {
          "id": "obj-79",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            2432.121945142746,
            1300.0000309944153,
            29.5,
            22.0
          ],
          "text": "+ 6"
        }
      },
      {
        "box": {
          "id": "obj-139",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            2390.658529520035,
            1300.0000309944153,
            29.5,
            22.0
          ],
          "text": "+ 6"
        }
      },
      {
        "box": {
          "id": "obj-313",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 6,
          "outlettype": [
            "float",
            "int",
            "int",
            "float",
            "float",
            "float"
          ],
          "patching_rect": [
            3041.384222984314,
            782.0,
            172.926824092865,
            22.0
          ],
          "text": "unpack f i i f f f"
        }
      },
      {
        "box": {
          "id": "obj-314",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            3161.384222984314,
            676.0,
            63.0,
            22.0
          ],
          "text": "zl group 6"
        }
      },
      {
        "box": {
          "id": "obj-315",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            3031.384222984314,
            710.0,
            87.0787467956543,
            20.0
          ],
          "text": "第　　　小節"
        }
      },
      {
        "box": {
          "id": "obj-316",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            3229.384222984314,
            1216.0,
            29.5,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-317",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            3317.384222984314,
            1120.0,
            95.78947710990906,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-319",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            3307.384222984314,
            994.0,
            127.0,
            22.0
          ],
          "text": "expr max(0.\\, $f1 - 10.)"
        }
      },
      {
        "box": {
          "id": "obj-320",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "float"
          ],
          "patching_rect": [
            3307.384222984314,
            1034.0,
            29.5,
            22.0
          ],
          "text": "t b f"
        }
      },
      {
        "box": {
          "id": "obj-321",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            3201.384222984314,
            624.0,
            43.0,
            22.0
          ],
          "text": "zlclear"
        }
      },
      {
        "box": {
          "id": "obj-322",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            3123.384222984314,
            574.0,
            29.5,
            22.0
          ],
          "text": "t l b"
        }
      },
      {
        "box": {
          "id": "obj-323",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            3307.384222984314,
            954.0,
            29.5,
            22.0
          ],
          "text": "* 1."
        }
      },
      {
        "box": {
          "id": "obj-324",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            3043.384222984314,
            1114.0,
            43.0,
            22.0
          ],
          "text": "cycle~"
        }
      },
      {
        "box": {
          "id": "obj-325",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            3043.384222984314,
            1050.0,
            45.0,
            22.0
          ],
          "text": "pipe 0."
        }
      },
      {
        "box": {
          "id": "obj-326",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            3041.384222984314,
            996.0,
            29.5,
            22.0
          ],
          "text": "* 1."
        }
      },
      {
        "box": {
          "id": "obj-327",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            3203.384222984314,
            904.0,
            27.6666761636734,
            20.0
          ],
          "text": "vel"
        }
      },
      {
        "box": {
          "id": "obj-328",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            3149.384222984314,
            904.0,
            31.833341538906097,
            20.0
          ],
          "text": "dur"
        }
      },
      {
        "box": {
          "id": "obj-329",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            3101.384222984314,
            904.0,
            34.000006914138794,
            20.0
          ],
          "text": "freq"
        }
      },
      {
        "box": {
          "id": "obj-330",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            3049.384222984314,
            904.0,
            39.166665732860565,
            20.0
          ],
          "text": "beat"
        }
      },
      {
        "box": {
          "id": "obj-331",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            3319.384222984314,
            868.0,
            99.0,
            22.0
          ],
          "text": "expr 60000. / $f1"
        }
      },
      {
        "box": {
          "id": "obj-332",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            3041.384222984314,
            704.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "format": 6,
          "id": "obj-333",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            3143.384222984314,
            874.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "format": 6,
          "id": "obj-334",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            3195.384222984314,
            874.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "format": 6,
          "id": "obj-335",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            3089.384222984314,
            874.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "format": 6,
          "id": "obj-336",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            3041.384222984314,
            874.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-337",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            3123.384222984314,
            622.0,
            55.0,
            22.0
          ],
          "text": "zl slice 1"
        }
      },
      {
        "box": {
          "id": "obj-287",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 6,
          "outlettype": [
            "float",
            "int",
            "int",
            "float",
            "float",
            "float"
          ],
          "patching_rect": [
            2568.0,
            776.0,
            172.926824092865,
            22.0
          ],
          "text": "unpack f i i f f f"
        }
      },
      {
        "box": {
          "id": "obj-288",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            2688.0,
            672.0,
            63.0,
            22.0
          ],
          "text": "zl group 6"
        }
      },
      {
        "box": {
          "id": "obj-289",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            2560.0,
            704.0,
            87.0787467956543,
            20.0
          ],
          "text": "第　　　小節"
        }
      },
      {
        "box": {
          "id": "obj-290",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            2754.0,
            1212.0,
            29.5,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-291",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            2862.0,
            1130.0,
            95.78947710990906,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-293",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2852.0,
            1004.0,
            127.0,
            22.0
          ],
          "text": "expr max(0.\\, $f1 - 10.)"
        }
      },
      {
        "box": {
          "id": "obj-294",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "float"
          ],
          "patching_rect": [
            2852.0,
            1044.0,
            29.5,
            22.0
          ],
          "text": "t b f"
        }
      },
      {
        "box": {
          "id": "obj-295",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2728.0,
            618.0,
            43.0,
            22.0
          ],
          "text": "zlclear"
        }
      },
      {
        "box": {
          "id": "obj-296",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            2652.0,
            568.0,
            29.5,
            22.0
          ],
          "text": "t l b"
        }
      },
      {
        "box": {
          "id": "obj-297",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            2852.0,
            964.0,
            29.5,
            22.0
          ],
          "text": "* 1."
        }
      },
      {
        "box": {
          "id": "obj-298",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            2572.0,
            1108.0,
            43.0,
            22.0
          ],
          "text": "cycle~"
        }
      },
      {
        "box": {
          "id": "obj-299",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2572.0,
            1044.0,
            45.0,
            22.0
          ],
          "text": "pipe 0."
        }
      },
      {
        "box": {
          "id": "obj-300",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            2568.0,
            992.0,
            29.5,
            22.0
          ],
          "text": "* 1."
        }
      },
      {
        "box": {
          "id": "obj-301",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            2732.0,
            898.0,
            27.6666761636734,
            20.0
          ],
          "text": "vel"
        }
      },
      {
        "box": {
          "id": "obj-302",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            2674.0,
            898.0,
            31.833341538906097,
            20.0
          ],
          "text": "dur"
        }
      },
      {
        "box": {
          "id": "obj-303",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            2628.0,
            898.0,
            34.000006914138794,
            20.0
          ],
          "text": "freq"
        }
      },
      {
        "box": {
          "id": "obj-304",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            2574.0,
            898.0,
            39.166665732860565,
            20.0
          ],
          "text": "beat"
        }
      },
      {
        "box": {
          "id": "obj-305",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2864.0,
            880.0,
            99.0,
            22.0
          ],
          "text": "expr 60000. / $f1"
        }
      },
      {
        "box": {
          "id": "obj-306",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2568.0,
            698.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "format": 6,
          "id": "obj-307",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2672.0,
            868.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "format": 6,
          "id": "obj-308",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2724.0,
            868.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "format": 6,
          "id": "obj-309",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2614.0,
            868.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "format": 6,
          "id": "obj-310",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2568.0,
            868.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-311",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            2652.0,
            616.0,
            55.0,
            22.0
          ],
          "text": "zl slice 1"
        }
      },
      {
        "box": {
          "id": "obj-248",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 6,
          "outlettype": [
            "float",
            "int",
            "int",
            "float",
            "float",
            "float"
          ],
          "patching_rect": [
            2119.999797821045,
            724.9999308586121,
            172.926824092865,
            22.0
          ],
          "text": "unpack f i i f f f"
        }
      },
      {
        "box": {
          "id": "obj-249",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            2234.9997868537903,
            617.499941110611,
            63.0,
            22.0
          ],
          "text": "zl group 6"
        }
      },
      {
        "box": {
          "id": "obj-250",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            2107.499799013138,
            649.9999380111694,
            87.0787467956543,
            20.0
          ],
          "text": "第　　　小節"
        }
      },
      {
        "box": {
          "id": "obj-251",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "patching_rect": [
            2758.0,
            1380.0,
            72.0,
            72.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-252",
          "maxclass": "gain~",
          "multichannelvariant": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            ""
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2758.0,
            1282.0,
            184.24589920043945,
            34.426228523254395
          ]
        }
      },
      {
        "box": {
          "id": "obj-253",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            2307.4997799396515,
            1157.4998896121979,
            29.5,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-254",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            2406.6686005592346,
            1072.4444966316223,
            34.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-256",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2396.6686005592346,
            944.4444966316223,
            127.0,
            22.0
          ],
          "text": "expr max(0.\\, $f1 - 10.)"
        }
      },
      {
        "box": {
          "id": "obj-257",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "float"
          ],
          "patching_rect": [
            2396.6686005592346,
            988.4444966316223,
            29.5,
            22.0
          ],
          "text": "t b f"
        }
      },
      {
        "box": {
          "id": "obj-258",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2279.999782562256,
            569.999945640564,
            43.0,
            22.0
          ],
          "text": "zlclear"
        }
      },
      {
        "box": {
          "id": "obj-259",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            2199.9997901916504,
            512.4999511241913,
            29.5,
            22.0
          ],
          "text": "t l b"
        }
      },
      {
        "box": {
          "id": "obj-260",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            2396.6686005592346,
            904.4444966316223,
            29.5,
            22.0
          ],
          "text": "* 1."
        }
      },
      {
        "box": {
          "id": "obj-261",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            2122.4997975826263,
            1057.499899148941,
            43.0,
            22.0
          ],
          "text": "cycle~"
        }
      },
      {
        "box": {
          "id": "obj-262",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2122.4997975826263,
            992.4999053478241,
            45.0,
            22.0
          ],
          "text": "pipe 0."
        }
      },
      {
        "box": {
          "id": "obj-263",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            2119.999797821045,
            937.4999105930328,
            29.5,
            22.0
          ],
          "text": "* 1."
        }
      },
      {
        "box": {
          "id": "obj-264",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            2282.4997823238373,
            849.9999189376831,
            27.6666761636734,
            20.0
          ],
          "text": "vel"
        }
      },
      {
        "box": {
          "id": "obj-265",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            2227.499787569046,
            849.9999189376831,
            31.833341538906097,
            20.0
          ],
          "text": "dur"
        }
      },
      {
        "box": {
          "id": "obj-266",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            2174.999792575836,
            849.9999189376831,
            34.000006914138794,
            20.0
          ],
          "text": "freq"
        }
      },
      {
        "box": {
          "id": "obj-267",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            2127.499797105789,
            849.9999189376831,
            39.166665732860565,
            20.0
          ],
          "text": "beat"
        }
      },
      {
        "box": {
          "id": "obj-268",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2406.6686005592346,
            824.4444966316223,
            99.0,
            22.0
          ],
          "text": "expr 60000. / $f1"
        }
      },
      {
        "box": {
          "id": "obj-269",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2119.999797821045,
            649.9999380111694,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-270",
          "linecount": 3,
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2615.0,
            414.0,
            50.0,
            49.0
          ],
          "text": "param:tempo=126.0"
        }
      },
      {
        "box": {
          "id": "obj-271",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "FullPacket"
          ],
          "patching_rect": [
            2645.0,
            362.0,
            71.0,
            22.0
          ],
          "text": "o.route /ack"
        }
      },
      {
        "box": {
          "fontsize": 30.0,
          "id": "obj-273",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            3166.0,
            1574.0,
            89.0,
            40.0
          ],
          "text": "σ"
        }
      },
      {
        "box": {
          "fontsize": 30.0,
          "id": "obj-274",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            3042.0,
            1574.0,
            59.0,
            40.0
          ],
          "text": "C"
        }
      },
      {
        "box": {
          "fontsize": 30.0,
          "format": 6,
          "id": "obj-276",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            3158.0,
            1528.0,
            106.0,
            42.0
          ]
        }
      },
      {
        "box": {
          "format": 6,
          "id": "obj-277",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2222.499788045883,
            812.4999225139618,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "format": 6,
          "id": "obj-278",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2269.99978351593,
            812.4999225139618,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "format": 6,
          "id": "obj-279",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2167.499793291092,
            812.4999225139618,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "format": 6,
          "id": "obj-280",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2119.999797821045,
            812.4999225139618,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "fontsize": 30.0,
          "format": 6,
          "id": "obj-281",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            3026.0,
            1528.0,
            106.0,
            42.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-282",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "float"
          ],
          "patching_rect": [
            3028.0,
            1442.0,
            148.33332979679108,
            22.0
          ],
          "text": "unpack f f"
        }
      },
      {
        "box": {
          "id": "obj-283",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            2199.9997901916504,
            562.4999463558197,
            55.0,
            22.0
          ],
          "text": "zl slice 1"
        }
      },
      {
        "box": {
          "id": "obj-284",
          "linecount": 2,
          "maxclass": "newobj",
          "numinlets": 14,
          "numoutlets": 14,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            2585.0,
            478.0,
            305.0,
            35.0
          ],
          "text": "route /grid /rgrid /seq /seq_low /seq_mid /seq_high /pdf /rpdf /pdf_low /pdf_high /stat /ack /tempo"
        }
      },
      {
        "box": {
          "id": "obj-285",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2585.0,
            314.0,
            97.0,
            22.0
          ],
          "text": "udpreceive 8000"
        }
      },
      {
        "box": {
          "id": "obj-136",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2663.0,
            1680.4878449440002,
            35.0,
            22.0
          ],
          "text": "clear"
        }
      },
      {
        "box": {
          "id": "obj-127",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            2633.7317066192627,
            1619.5122337341309,
            122.0,
            22.0
          ],
          "text": "jit.op @op * @val 0.9"
        }
      },
      {
        "box": {
          "id": "obj-125",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            2633.7317066192627,
            1580.4878425598145,
            187.0,
            22.0
          ],
          "text": "jit.matrix freq_grid 1 float32 13 13"
        }
      },
      {
        "box": {
          "id": "obj-123",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            2633.7317066192627,
            1539.0244269371033,
            63.0,
            22.0
          ],
          "text": "qmetro 50"
        }
      },
      {
        "box": {
          "id": "obj-104",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            2633.7317066192627,
            1490.2439379692078,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-88",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2202.853646993637,
            1412.195155620575,
            152.0,
            22.0
          ],
          "text": "sprintf setcell %d %d val 1."
        }
      },
      {
        "box": {
          "id": "obj-85",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2202.853646993637,
            1360.9756422042847,
            59.33762741088867,
            22.0
          ],
          "text": "pack i i"
        }
      },
      {
        "box": {
          "id": "obj-165",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            2241.8780381679535,
            1302.43905544281,
            29.5,
            22.0
          ],
          "text": "+ 6"
        }
      },
      {
        "box": {
          "id": "obj-164",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            2202.853646993637,
            1302.43905544281,
            29.5,
            22.0
          ],
          "text": "+ 6"
        }
      },
      {
        "box": {
          "id": "obj-159",
          "maxclass": "jit.pwindow",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            2156.0976123809814,
            1585.365891456604,
            341.6666634082794,
            320.2380921840668
          ],
          "sync": 1
        }
      },
      {
        "box": {
          "id": "obj-157",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            2380.9024317264557,
            1475.609791278839,
            187.0,
            22.0
          ],
          "text": "jit.matrix freq_grid 1 float32 13 13"
        }
      },
      {
        "box": {
          "fontsize": 18.0,
          "id": "obj-158",
          "linecount": 7,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            2844.384222984314,
            1695.121991634369,
            401.0,
            167.0
          ],
          "text": "beat — 小節内で鳴らし始める位置（拍）\n\nfreq — 鳴らす音の高さ（周波数Hz）\n\nC — 候補分布の不確実性（エントロピー）\n\nσ — 候補分布の広がり（散らばり具合）\n"
        }
      },
      {
        "box": {
          "id": "obj-76",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1698.0,
            1250.0,
            46.0,
            22.0
          ],
          "text": "pack i i"
        }
      },
      {
        "box": {
          "id": "obj-60",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            1734.0,
            958.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1734.0,
            918.0,
            69.0,
            22.0
          ],
          "text": "qmetro 100"
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "FullPacket"
          ],
          "patching_rect": [
            1698.0,
            1326.0,
            69.0,
            22.0
          ],
          "text": "o.pack /pull"
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "newobj",
          "numinlets": 5,
          "numoutlets": 4,
          "outlettype": [
            "int",
            "",
            "",
            "int"
          ],
          "patching_rect": [
            1698.0,
            1182.0,
            102.0,
            22.0
          ],
          "text": "counter 0 999999"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            1698.0,
            1140.0,
            36.0,
            22.0
          ],
          "text": "== 0."
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "int",
            "int"
          ],
          "patching_rect": [
            1698.0,
            1100.0,
            48.0,
            22.0
          ],
          "text": "change"
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            1820.0,
            958.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            1698.0,
            832.0,
            63.36585092544556,
            63.36585092544556
          ]
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 9,
          "outlettype": [
            "int",
            "int",
            "float",
            "float",
            "float",
            "",
            "int",
            "float",
            ""
          ],
          "patching_rect": [
            1698.0,
            1004.0,
            128.0,
            22.0
          ],
          "text": "transport @tempo 120"
        }
      },
      {
        "box": {
          "id": "obj-339",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1860.0,
            958.0,
            72.0,
            22.0
          ],
          "text": "tempo $1"
        }
      },
      {
        "box": {
          "id": "obj-1",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1752.0,
            1436.0,
            138.0,
            22.0
          ],
          "text": "udpsend 127.0.0.1 8001"
        }
      },
      {
        "box": {
          "id": "obj-340",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            2538.0,
            988.0,
            45.0,
            22.0
          ],
          "text": "pipe 0."
        }
      },
      {
        "box": {
          "id": "obj-341",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2458.0,
            1024.0,
            82.0,
            22.0
          ],
          "text": "setdomain $1"
        }
      },
      {
        "box": {
          "id": "obj-342",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            2992.0,
            1044.0,
            45.0,
            22.0
          ],
          "text": "pipe 0."
        }
      },
      {
        "box": {
          "id": "obj-343",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2912.0,
            1084.0,
            82.0,
            22.0
          ],
          "text": "setdomain $1"
        }
      },
      {
        "box": {
          "id": "obj-344",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            3448.0,
            1034.0,
            45.0,
            22.0
          ],
          "text": "pipe 0."
        }
      },
      {
        "box": {
          "id": "obj-345",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            3368.0,
            1070.0,
            82.0,
            22.0
          ],
          "text": "setdomain $1"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-11",
            0
          ],
          "source": [
            "obj-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-268",
            0
          ],
          "order": 2,
          "source": [
            "obj-10",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-305",
            0
          ],
          "order": 1,
          "source": [
            "obj-10",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-331",
            0
          ],
          "order": 0,
          "source": [
            "obj-10",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-76",
            1
          ],
          "midpoints": [
            1721.125,
            1030.6786253601313,
            1734.5,
            1030.6786253601313
          ],
          "source": [
            "obj-10",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-123",
            0
          ],
          "source": [
            "obj-104",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-12",
            0
          ],
          "source": [
            "obj-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-13",
            0
          ],
          "source": [
            "obj-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-125",
            0
          ],
          "source": [
            "obj-123",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-127",
            0
          ],
          "source": [
            "obj-125",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-157",
            0
          ],
          "source": [
            "obj-127",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-76",
            0
          ],
          "source": [
            "obj-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-157",
            0
          ],
          "source": [
            "obj-136",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-77",
            0
          ],
          "source": [
            "obj-139",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-157",
            0
          ],
          "source": [
            "obj-142",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-142",
            0
          ],
          "source": [
            "obj-143",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-143",
            1
          ],
          "source": [
            "obj-147",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-1",
            0
          ],
          "midpoints": [
            1707.5,
            1355.3201120612212,
            1761.5,
            1355.3201120612212
          ],
          "source": [
            "obj-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-143",
            0
          ],
          "source": [
            "obj-150",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-159",
            0
          ],
          "source": [
            "obj-157",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-85",
            0
          ],
          "source": [
            "obj-164",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-85",
            1
          ],
          "source": [
            "obj-165",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-254",
            0
          ],
          "source": [
            "obj-176",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-291",
            0
          ],
          "source": [
            "obj-179",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-317",
            0
          ],
          "source": [
            "obj-180",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-10",
            0
          ],
          "order": 1,
          "source": [
            "obj-23",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-37",
            0
          ],
          "midpoints": [
            1707.5,
            910.2617210149765,
            1743.5,
            910.2617210149765
          ],
          "order": 0,
          "source": [
            "obj-23",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-164",
            0
          ],
          "source": [
            "obj-248",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-165",
            0
          ],
          "source": [
            "obj-248",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-263",
            0
          ],
          "order": 0,
          "source": [
            "obj-248",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-277",
            0
          ],
          "midpoints": [
            2252.641257095337,
            757.3865633010864,
            2231.999788045883,
            757.3865633010864
          ],
          "source": [
            "obj-248",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-278",
            0
          ],
          "source": [
            "obj-248",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-279",
            0
          ],
          "midpoints": [
            2221.855892276764,
            754.3826570510864,
            2176.999793291092,
            754.3826570510864
          ],
          "source": [
            "obj-248",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-280",
            0
          ],
          "order": 1,
          "source": [
            "obj-248",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-248",
            0
          ],
          "midpoints": [
            2244.4997868537903,
            682.3869366645813,
            2129.499797821045,
            682.3869366645813
          ],
          "source": [
            "obj-249",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-10",
            1
          ],
          "source": [
            "obj-25",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-251",
            1
          ],
          "midpoints": [
            2767.5,
            1346.7641323804855,
            2820.5,
            1346.7641323804855
          ],
          "order": 0,
          "source": [
            "obj-252",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-251",
            0
          ],
          "midpoints": [
            2767.5,
            1346.7641323804855,
            2767.5,
            1346.7641323804855
          ],
          "order": 1,
          "source": [
            "obj-252",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-253",
            1
          ],
          "midpoints": [
            2416.1686005592346,
            1117.7497516870499,
            2327.4997799396515,
            1117.7497516870499
          ],
          "source": [
            "obj-254",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-176",
            0
          ],
          "source": [
            "obj-257",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-249",
            1
          ],
          "source": [
            "obj-258",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-258",
            0
          ],
          "midpoints": [
            2219.9997901916504,
            545.5881650447845,
            2289.499782562256,
            545.5881650447845
          ],
          "source": [
            "obj-259",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-283",
            0
          ],
          "source": [
            "obj-259",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-157",
            0
          ],
          "source": [
            "obj-26",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-256",
            0
          ],
          "midpoints": [
            2406.1686005592346,
            929.7503037452698,
            2406.1686005592346,
            929.7503037452698
          ],
          "source": [
            "obj-260",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-253",
            0
          ],
          "midpoints": [
            2131.9997975826263,
            1109.8550145626068,
            2316.9997799396515,
            1109.8550145626068
          ],
          "order": 1,
          "source": [
            "obj-261",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-261",
            0
          ],
          "source": [
            "obj-262",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-262",
            1
          ],
          "midpoints": [
            2129.499797821045,
            980.2426189184189,
            2157.9997975826263,
            980.2426189184189
          ],
          "source": [
            "obj-263",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-260",
            1
          ],
          "midpoints": [
            2416.1686005592346,
            876.38847386837,
            2416.6686005592346,
            876.38847386837
          ],
          "order": 0,
          "source": [
            "obj-268",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-263",
            1
          ],
          "midpoints": [
            2416.1686005592346,
            883.2685323748738,
            2139.999797821045,
            883.2685323748738
          ],
          "order": 1,
          "source": [
            "obj-268",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-270",
            1
          ],
          "source": [
            "obj-271",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-260",
            0
          ],
          "source": [
            "obj-277",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-262",
            0
          ],
          "midpoints": [
            2176.999793291092,
            882.896769083105,
            2131.9997975826263,
            882.896769083105
          ],
          "source": [
            "obj-279",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-276",
            0
          ],
          "source": [
            "obj-282",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-281",
            0
          ],
          "source": [
            "obj-282",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-249",
            0
          ],
          "source": [
            "obj-283",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-269",
            0
          ],
          "midpoints": [
            2209.4997901916504,
            615.1918251514435,
            2129.499797821045,
            615.1918251514435
          ],
          "source": [
            "obj-283",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-259",
            0
          ],
          "source": [
            "obj-284",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-282",
            0
          ],
          "source": [
            "obj-284",
            10
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-296",
            0
          ],
          "source": [
            "obj-284",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-322",
            0
          ],
          "source": [
            "obj-284",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-339",
            0
          ],
          "source": [
            "obj-284",
            12
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-271",
            0
          ],
          "midpoints": [
            2594.5,
            347.7894228696823,
            2654.5,
            347.7894228696823
          ],
          "order": 0,
          "source": [
            "obj-285",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-284",
            0
          ],
          "order": 1,
          "source": [
            "obj-285",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-139",
            0
          ],
          "source": [
            "obj-287",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-297",
            0
          ],
          "order": 0,
          "source": [
            "obj-287",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-300",
            0
          ],
          "order": 0,
          "source": [
            "obj-287",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-307",
            0
          ],
          "midpoints": [
            2700.641459274292,
            808.7199912071228,
            2681.5,
            808.7199912071228
          ],
          "order": 1,
          "source": [
            "obj-287",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-308",
            0
          ],
          "source": [
            "obj-287",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-309",
            0
          ],
          "midpoints": [
            2669.856094455719,
            805.7160849571228,
            2623.5,
            805.7160849571228
          ],
          "source": [
            "obj-287",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-310",
            0
          ],
          "order": 1,
          "source": [
            "obj-287",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-79",
            0
          ],
          "source": [
            "obj-287",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-287",
            0
          ],
          "midpoints": [
            2697.5,
            733.7203645706177,
            2577.5,
            733.7203645706177
          ],
          "source": [
            "obj-288",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-290",
            1
          ],
          "midpoints": [
            2871.5,
            1169.0831795930862,
            2774.0,
            1169.0831795930862
          ],
          "source": [
            "obj-291",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-179",
            0
          ],
          "source": [
            "obj-294",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-288",
            1
          ],
          "source": [
            "obj-295",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-295",
            0
          ],
          "midpoints": [
            2672.0,
            596.9215929508209,
            2737.5,
            596.9215929508209
          ],
          "source": [
            "obj-296",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-311",
            0
          ],
          "source": [
            "obj-296",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-293",
            0
          ],
          "midpoints": [
            2861.5,
            986.4170641899109,
            2861.5,
            986.4170641899109
          ],
          "source": [
            "obj-297",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-290",
            0
          ],
          "midpoints": [
            2581.5,
            1161.1884424686432,
            2763.5,
            1161.1884424686432
          ],
          "order": 1,
          "source": [
            "obj-298",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-298",
            0
          ],
          "source": [
            "obj-299",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-299",
            1
          ],
          "midpoints": [
            2577.5,
            1031.5760468244553,
            2607.5,
            1031.5760468244553
          ],
          "source": [
            "obj-300",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-297",
            1
          ],
          "midpoints": [
            2873.5,
            933.0552343130112,
            2872.0,
            933.0552343130112
          ],
          "order": 0,
          "source": [
            "obj-305",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-300",
            1
          ],
          "midpoints": [
            2873.5,
            934.6019602809101,
            2588.0,
            934.6019602809101
          ],
          "order": 1,
          "source": [
            "obj-305",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-299",
            0
          ],
          "midpoints": [
            2623.5,
            934.2301969891414,
            2581.5,
            934.2301969891414
          ],
          "source": [
            "obj-309",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-288",
            0
          ],
          "source": [
            "obj-311",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-306",
            0
          ],
          "midpoints": [
            2661.5,
            666.5252530574799,
            2577.5,
            666.5252530574799
          ],
          "source": [
            "obj-311",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-147",
            0
          ],
          "source": [
            "obj-313",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-150",
            0
          ],
          "source": [
            "obj-313",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-326",
            0
          ],
          "order": 0,
          "source": [
            "obj-313",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-333",
            0
          ],
          "midpoints": [
            3174.025682258606,
            812.7199912071228,
            3152.884222984314,
            812.7199912071228
          ],
          "source": [
            "obj-313",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-334",
            0
          ],
          "source": [
            "obj-313",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-335",
            0
          ],
          "midpoints": [
            3143.240317440033,
            809.7160849571228,
            3098.884222984314,
            809.7160849571228
          ],
          "source": [
            "obj-313",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-336",
            0
          ],
          "order": 1,
          "source": [
            "obj-313",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-313",
            0
          ],
          "midpoints": [
            3170.884222984314,
            737.7203645706177,
            3050.884222984314,
            737.7203645706177
          ],
          "source": [
            "obj-314",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-316",
            1
          ],
          "midpoints": [
            3326.884222984314,
            1173.0831795930862,
            3249.384222984314,
            1173.0831795930862
          ],
          "source": [
            "obj-317",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-180",
            0
          ],
          "source": [
            "obj-320",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-314",
            1
          ],
          "source": [
            "obj-321",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-321",
            0
          ],
          "midpoints": [
            3143.384222984314,
            600.9215929508209,
            3210.884222984314,
            600.9215929508209
          ],
          "source": [
            "obj-322",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-337",
            0
          ],
          "source": [
            "obj-322",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-319",
            0
          ],
          "midpoints": [
            3316.884222984314,
            975.5281224250793,
            3316.884222984314,
            975.5281224250793
          ],
          "source": [
            "obj-323",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-316",
            0
          ],
          "midpoints": [
            3052.884222984314,
            1165.1884424686432,
            3238.884222984314,
            1165.1884424686432
          ],
          "order": 0,
          "source": [
            "obj-324",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-324",
            0
          ],
          "source": [
            "obj-325",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-325",
            1
          ],
          "midpoints": [
            3050.884222984314,
            1035.5760468244553,
            3078.884222984314,
            1035.5760468244553
          ],
          "source": [
            "obj-326",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-323",
            1
          ],
          "midpoints": [
            3328.884222984314,
            922.1662925481796,
            3327.384222984314,
            922.1662925481796
          ],
          "order": 0,
          "source": [
            "obj-331",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-326",
            1
          ],
          "midpoints": [
            3328.884222984314,
            938.6019602809101,
            3061.384222984314,
            938.6019602809101
          ],
          "order": 1,
          "source": [
            "obj-331",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-323",
            0
          ],
          "source": [
            "obj-333",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-325",
            0
          ],
          "midpoints": [
            3098.884222984314,
            938.2301969891414,
            3052.884222984314,
            938.2301969891414
          ],
          "source": [
            "obj-335",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-314",
            0
          ],
          "source": [
            "obj-337",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-332",
            0
          ],
          "midpoints": [
            3132.884222984314,
            670.5252530574799,
            3050.884222984314,
            670.5252530574799
          ],
          "source": [
            "obj-337",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-10",
            0
          ],
          "source": [
            "obj-339",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-60",
            0
          ],
          "source": [
            "obj-37",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-10",
            0
          ],
          "midpoints": [
            1743.5,
            993.6443711519241,
            1707.5,
            993.6443711519241
          ],
          "source": [
            "obj-60",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-15",
            0
          ],
          "source": [
            "obj-76",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-26",
            0
          ],
          "source": [
            "obj-77",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-77",
            1
          ],
          "source": [
            "obj-79",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-88",
            0
          ],
          "source": [
            "obj-85",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-157",
            0
          ],
          "source": [
            "obj-88",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-256",
            0
          ],
          "destination": [
            "obj-340",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-263",
            0
          ],
          "destination": [
            "obj-340",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-340",
            0
          ],
          "destination": [
            "obj-257",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-257",
            1
          ],
          "destination": [
            "obj-341",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-341",
            0
          ],
          "destination": [
            "obj-176",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-253",
            0
          ],
          "destination": [
            "obj-252",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-293",
            0
          ],
          "destination": [
            "obj-342",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-300",
            0
          ],
          "destination": [
            "obj-342",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-342",
            0
          ],
          "destination": [
            "obj-294",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-294",
            1
          ],
          "destination": [
            "obj-343",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-343",
            0
          ],
          "destination": [
            "obj-179",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-290",
            0
          ],
          "destination": [
            "obj-252",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-319",
            0
          ],
          "destination": [
            "obj-344",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-326",
            0
          ],
          "destination": [
            "obj-344",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-344",
            0
          ],
          "destination": [
            "obj-320",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-320",
            1
          ],
          "destination": [
            "obj-345",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-345",
            0
          ],
          "destination": [
            "obj-180",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-316",
            0
          ],
          "destination": [
            "obj-252",
            0
          ]
        }
      }
    ],
    "autosave": 0
  }
}
