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
      58.0,
      100.0,
      963.0,
      764.0
    ],
    "boxes": [
      {
        "box": {
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            4251.724360942841,
            2462.069094657898,
            100.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1426.2414536476135,
            797.0,
            32.0,
            22.0
          ],
          "text": "print"
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
            1379.310417175293,
            1220.6897192001343,
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
            1379.310417175293,
            1175.8621306419373,
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
            1420.6897296905518,
            1117.2414379119873,
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
            1379.310417175293,
            1117.2414379119873,
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
            1193.1035108566284,
            1220.6897192001343,
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
            1193.1035108566284,
            1165.5173025131226,
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
            1233.441138267517,
            1106.8966097831726,
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
            1193.1035108566284,
            1106.8966097831726,
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
            1841.379406929016,
            589.6552033424377,
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
            1962.0690684318542,
            482.75864601135254,
            62.0,
            22.0
          ],
          "text": "zl iter 6"
        }
      },
      {
        "box": {
          "id": "obj-315",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1834.4828548431396,
            517.2414064407349,
            87.0787467956543,
            20.0
          ],
          "text": "第　　　小節"
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
            1924.1380319595337,
            382.7586407661438,
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
            2110.3449382781982,
            762.0690054893494,
            29.5,
            22.0
          ],
          "text": "* 1."
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
            1841.379406929016,
            803.4483180046082,
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
            2003.448380947113,
            713.7931408882141,
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
            1951.7242403030396,
            713.7931408882141,
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
            1903.4483757019043,
            713.7931408882141,
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
            1851.7242350578308,
            713.7931408882141,
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
            2120.689766407013,
            675.8621044158936,
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
            1841.379406929016,
            513.7931303977966,
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
            1944.827688217163,
            682.75865650177,
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
            1996.5518288612366,
            682.75865650177,
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
            1889.6552715301514,
            682.75865650177,
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
            1841.379406929016,
            682.75865650177,
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
            1924.1380319595337,
            431.03450536727905,
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
            1368.9655890464783,
            582.7586512565613,
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
            1489.6552505493164,
            479.3103699684143,
            62.0,
            22.0
          ],
          "text": "zl iter 6"
        }
      },
      {
        "box": {
          "id": "obj-289",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1362.0690369606018,
            513.7931303977966,
            87.0787467956543,
            20.0
          ],
          "text": "第　　　小節"
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
            1455.172490119934,
            375.86208868026733,
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
            1655.1725006103516,
            772.4138336181641,
            29.5,
            22.0
          ],
          "text": "* 1."
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
            1368.9655890464783,
            800.0000419616699,
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
            1534.4828391075134,
            706.8965888023376,
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
            1475.8621463775635,
            706.8965888023376,
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
            1431.0345578193665,
            706.8965888023376,
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
            1375.8621411323547,
            706.8965888023376,
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
            1665.5173287391663,
            689.6552085876465,
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
            1368.9655890464783,
            506.89657831192017,
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
            1472.4138703346252,
            675.8621044158936,
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
            1524.1380109786987,
            675.8621044158936,
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
            1417.2414536476135,
            675.8621044158936,
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
            1368.9655890464783,
            675.8621044158936,
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
            1455.172490119934,
            424.1379532814026,
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
            920.689703464508,
            534.482786655426,
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
            1037.931088924408,
            427.5862293243408,
            62.0,
            22.0
          ],
          "text": "zl iter 6"
        }
      },
      {
        "box": {
          "id": "obj-250",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            910.3448753356934,
            458.6207137107849,
            87.0787467956543,
            20.0
          ],
          "text": "第　　　小節"
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
            1000.0000524520874,
            320.6896719932556,
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
            1196.5517868995667,
            713.7931408882141,
            29.5,
            22.0
          ],
          "text": "* 1."
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
            920.689703464508,
            744.8276252746582,
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
            1082.758677482605,
            658.6207242012024,
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
            1027.5862607955933,
            658.6207242012024,
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
            975.8621201515198,
            658.6207242012024,
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
            927.5862555503845,
            658.6207242012024,
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
            1206.8966150283813,
            634.4827919006348,
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
            920.689703464508,
            458.6207137107849,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-270",
          "linecount": 4,
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1417.2414536476135,
            224.1379427909851,
            50.0,
            62.0
          ],
          "text": "param:sigma_pitch=1.0"
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
            1448.2759380340576,
            168.9655261039734,
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
            1968.9656205177307,
            1382.7586932182312,
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
            1844.8276829719543,
            1382.7586932182312,
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
            1958.620792388916,
            1337.9311046600342,
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
            1024.137984752655,
            620.6896877288818,
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
            1072.4138493537903,
            620.6896877288818,
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
            968.9655680656433,
            620.6896877288818,
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
            920.689703464508,
            620.6896877288818,
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
            1827.5863027572632,
            1337.9311046600342,
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
            1831.0345788002014,
            1251.7242035865784,
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
            1000.0000524520874,
            372.4138126373291,
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
            1386.2069692611694,
            286.2069115638733,
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
            1386.2069692611694,
            124.13793754577637,
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
            1465.5173182487488,
            1489.6552505493164,
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
            1434.4828338623047,
            1427.5862817764282,
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
            1434.4828338623047,
            1389.6552453041077,
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
            1434.4828338623047,
            1348.2759327888489,
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
            1434.4828338623047,
            1300.0000681877136,
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
            1003.4483284950256,
            1220.6897192001343,
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
            1003.4483284950256,
            1168.9655785560608,
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
            1044.8276410102844,
            1110.3448858261108,
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
            1003.4483284950256,
            1110.3448858261108,
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
            958.6207399368286,
            1393.103521347046,
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
            1182.7586827278137,
            1282.7586879730225,
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
          "linecount": 4,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1644.8276724815369,
            1503.4483547210693,
            401.0,
            107.0
          ],
          "text": "\nC — 候補分布の不確実性（エントロピー）\n\nσ — 候補分布の広がり（散らばり具合）\n"
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
            500.0000262260437,
            1058.6207451820374,
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
            534.482786655426,
            765.5172815322876,
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
            534.482786655426,
            727.586245059967,
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
            500.0000262260437,
            1134.4828181266785,
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
            500.0000262260437,
            989.6552243232727,
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
            500.0000262260437,
            948.2759118080139,
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
            500.0000262260437,
            906.8965992927551,
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
            620.6896877288818,
            765.5172815322876,
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
            500.0000262260437,
            641.3793439865112,
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
            500.0000262260437,
            813.7931461334229,
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
            662.0690002441406,
            765.5172815322876,
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
            555.1724429130554,
            1244.827651500702,
            138.0,
            22.0
          ],
          "text": "udpsend 127.0.0.1 8001"
        }
      },
      {
        "box": {
          "id": "obj-346",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "float"
          ],
          "patching_rect": [
            1193.1035108566284,
            782.7586617469788,
            35.0,
            22.0
          ],
          "text": "t b f"
        }
      },
      {
        "box": {
          "id": "obj-348",
          "maxclass": "newobj",
          "numinlets": 4,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "int",
            "int"
          ],
          "patching_rect": [
            1193.1035108566284,
            820.6896982192993,
            76.0,
            22.0
          ],
          "text": "pipe 0 0 0"
        }
      },
      {
        "box": {
          "id": "obj-353",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "float"
          ],
          "patching_rect": [
            1651.7242245674133,
            824.1379742622375,
            35.0,
            22.0
          ],
          "text": "t b f"
        }
      },
      {
        "box": {
          "id": "obj-355",
          "maxclass": "newobj",
          "numinlets": 4,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "int",
            "int"
          ],
          "patching_rect": [
            1651.7242245674133,
            865.5172867774963,
            76.0,
            22.0
          ],
          "text": "pipe 0 0 0"
        }
      },
      {
        "box": {
          "id": "obj-360",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "float"
          ],
          "patching_rect": [
            2113.7932143211365,
            820.6896982192993,
            35.0,
            22.0
          ],
          "text": "t b f"
        }
      },
      {
        "box": {
          "id": "obj-362",
          "maxclass": "newobj",
          "numinlets": 4,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "int",
            "int"
          ],
          "patching_rect": [
            2113.7932143211365,
            862.0690107345581,
            76.0,
            22.0
          ],
          "text": "pipe 0 0 0"
        }
      },
      {
        "box": {
          "id": "obj-378",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1062.0690212249756,
            758.6207294464111,
            120.0,
            20.0
          ],
          "text": "MIDI low ch 1"
        }
      },
      {
        "box": {
          "id": "obj-367",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1062.0690212249756,
            793.1034898757935,
            38.0,
            22.0
          ],
          "text": "ftom"
        }
      },
      {
        "box": {
          "id": "obj-368",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1062.0690212249756,
            827.5862503051758,
            45.0,
            22.0
          ],
          "text": "round"
        }
      },
      {
        "box": {
          "id": "obj-369",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1062.0690212249756,
            862.0690107345581,
            72.0,
            22.0
          ],
          "text": "clip 0 127"
        }
      },
      {
        "box": {
          "id": "obj-370",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1172.413854598999,
            862.0690107345581,
            72.0,
            22.0
          ],
          "text": "clip 1 127"
        }
      },
      {
        "box": {
          "id": "obj-371",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "int"
          ],
          "patching_rect": [
            1286.2069640159607,
            862.0690107345581,
            74.0,
            22.0
          ],
          "text": "maximum 1."
        }
      },
      {
        "box": {
          "id": "obj-372",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1286.2069640159607,
            893.1034951210022,
            45.0,
            22.0
          ],
          "text": "round"
        }
      },
      {
        "box": {
          "id": "obj-373",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "list"
          ],
          "patching_rect": [
            1124.1379899978638,
            934.482807636261,
            82.0,
            22.0
          ],
          "text": "pack 0 0 0"
        }
      },
      {
        "box": {
          "id": "obj-375",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "float"
          ],
          "patching_rect": [
            1124.1379899978638,
            1051.724193096161,
            106.0,
            22.0
          ],
          "text": "makenote 96 250"
        }
      },
      {
        "box": {
          "id": "obj-376",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 0,
          "patching_rect": [
            1124.1379899978638,
            1100.0000576972961,
            58.0,
            22.0
          ],
          "text": "noteout"
        }
      },
      {
        "box": {
          "id": "obj-377",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1230.1035108566284,
            1042.0,
            78.0,
            22.0
          ],
          "text": "loadmess 1"
        }
      },
      {
        "box": {
          "id": "obj-390",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1520.6897349357605,
            758.6207294464111,
            120.0,
            20.0
          ],
          "text": "MIDI mid ch 2"
        }
      },
      {
        "box": {
          "id": "obj-379",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1520.6897349357605,
            793.1034898757935,
            38.0,
            22.0
          ],
          "text": "ftom"
        }
      },
      {
        "box": {
          "id": "obj-380",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1520.6897349357605,
            827.5862503051758,
            45.0,
            22.0
          ],
          "text": "round"
        }
      },
      {
        "box": {
          "id": "obj-381",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1520.6897349357605,
            862.0690107345581,
            72.0,
            22.0
          ],
          "text": "clip 0 127"
        }
      },
      {
        "box": {
          "id": "obj-382",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1634.4828443527222,
            862.0690107345581,
            72.0,
            22.0
          ],
          "text": "clip 1 127"
        }
      },
      {
        "box": {
          "id": "obj-383",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "int"
          ],
          "patching_rect": [
            1744.8276777267456,
            862.0690107345581,
            74.0,
            22.0
          ],
          "text": "maximum 1."
        }
      },
      {
        "box": {
          "id": "obj-384",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1744.8276777267456,
            893.1034951210022,
            45.0,
            22.0
          ],
          "text": "round"
        }
      },
      {
        "box": {
          "id": "obj-385",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "list"
          ],
          "patching_rect": [
            1586.206979751587,
            934.482807636261,
            82.0,
            22.0
          ],
          "text": "pack 0 0 0"
        }
      },
      {
        "box": {
          "id": "obj-387",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "float"
          ],
          "patching_rect": [
            1586.206979751587,
            1051.724193096161,
            106.0,
            22.0
          ],
          "text": "makenote 96 250"
        }
      },
      {
        "box": {
          "id": "obj-388",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 0,
          "patching_rect": [
            1586.206979751587,
            1100.0000576972961,
            58.0,
            22.0
          ],
          "text": "noteout"
        }
      },
      {
        "box": {
          "id": "obj-389",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1682.7587089538574,
            1100.0000576972961,
            78.0,
            22.0
          ],
          "text": "loadmess 2"
        }
      },
      {
        "box": {
          "id": "obj-402",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1982.7587246894836,
            758.6207294464111,
            120.0,
            20.0
          ],
          "text": "MIDI high ch 3"
        }
      },
      {
        "box": {
          "id": "obj-391",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1982.7587246894836,
            793.1034898757935,
            38.0,
            22.0
          ],
          "text": "ftom"
        }
      },
      {
        "box": {
          "id": "obj-392",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1982.7587246894836,
            827.5862503051758,
            45.0,
            22.0
          ],
          "text": "round"
        }
      },
      {
        "box": {
          "id": "obj-393",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1982.7587246894836,
            862.0690107345581,
            72.0,
            22.0
          ],
          "text": "clip 0 127"
        }
      },
      {
        "box": {
          "id": "obj-394",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2093.103558063507,
            862.0690107345581,
            72.0,
            22.0
          ],
          "text": "clip 1 127"
        }
      },
      {
        "box": {
          "id": "obj-395",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "int"
          ],
          "patching_rect": [
            2206.8966674804688,
            862.0690107345581,
            74.0,
            22.0
          ],
          "text": "maximum 1."
        }
      },
      {
        "box": {
          "id": "obj-396",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2206.8966674804688,
            893.1034951210022,
            45.0,
            22.0
          ],
          "text": "round"
        }
      },
      {
        "box": {
          "id": "obj-397",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "list"
          ],
          "patching_rect": [
            2044.8276934623718,
            934.482807636261,
            82.0,
            22.0
          ],
          "text": "pack 0 0 0"
        }
      },
      {
        "box": {
          "id": "obj-399",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "float"
          ],
          "patching_rect": [
            2044.8276934623718,
            1051.724193096161,
            106.0,
            22.0
          ],
          "text": "makenote 96 250"
        }
      },
      {
        "box": {
          "id": "obj-400",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 0,
          "patching_rect": [
            2044.8276934623718,
            1100.0000576972961,
            58.0,
            22.0
          ],
          "text": "noteout"
        }
      },
      {
        "box": {
          "id": "obj-401",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2141.3794226646423,
            1100.0000576972961,
            78.0,
            22.0
          ],
          "text": "loadmess 3"
        }
      },
      {
        "box": {
          "id": "obj-403",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "list",
            "bang"
          ],
          "patching_rect": [
            2784.0,
            1164.0,
            48.0,
            22.0
          ],
          "text": "zl reg"
        }
      },
      {
        "box": {
          "id": "obj-404",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "list",
            "bang"
          ],
          "patching_rect": [
            3244.0,
            1164.0,
            48.0,
            22.0
          ],
          "text": "zl reg"
        }
      },
      {
        "box": {
          "id": "obj-405",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "list",
            "bang"
          ],
          "patching_rect": [
            2324.0,
            1164.0,
            48.0,
            22.0
          ],
          "text": "zl reg"
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
            523.1250262260437,
            838.9545371681452,
            536.5000262260437,
            838.9545371681452
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
            509.5000262260437,
            1163.596023869235,
            564.6724429130554,
            1163.596023869235
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
            509.5000262260437,
            718.5376328229904,
            543.982786655426,
            718.5376328229904
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
            1053.3311627388,
            565.6624751091003,
            1033.637984752655,
            565.6624751091003
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
          "order": 1,
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
            1022.5457979202271,
            562.6585688591003,
            978.4655680656433,
            562.6585688591003
          ],
          "order": 1,
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
            "obj-367",
            0
          ],
          "order": 0,
          "source": [
            "obj-248",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-370",
            0
          ],
          "order": 0,
          "source": [
            "obj-248",
            5
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
            1047.431088924408,
            490.6628484725952,
            930.189703464508,
            490.6628484725952
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
            "obj-371",
            0
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
            "obj-346",
            0
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
            1216.3966150283813,
            684.664385676384,
            1216.5517868995667,
            684.664385676384
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
            1216.3966150283813,
            691.5444441828877,
            940.689703464508,
            691.5444441828877
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
            1009.5000524520874,
            423.4677369594574,
            930.189703464508,
            423.4677369594574
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
            1395.7069692611694,
            156.06533467769623,
            1457.7759380340576,
            156.06533467769623
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
            1501.6070483207702,
            616.9959030151367,
            1481.9138703346252,
            616.9959030151367
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
          "order": 1,
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
            1470.8216835021972,
            613.9919967651367,
            1426.7414536476135,
            613.9919967651367
          ],
          "order": 1,
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
            "obj-379",
            0
          ],
          "order": 0,
          "source": [
            "obj-287",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-382",
            0
          ],
          "order": 0,
          "source": [
            "obj-287",
            5
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
            1499.1552505493164,
            541.9962763786316,
            1378.4655890464783,
            541.9962763786316
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
            "obj-383",
            0
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
            "obj-353",
            0
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
            1675.0173287391663,
            741.3311461210251,
            1675.1725006103516,
            741.3311461210251
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
            1675.0173287391663,
            742.877872088924,
            1388.9655890464783,
            742.877872088924
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
            1464.672490119934,
            474.8011648654938,
            1378.4655890464783,
            474.8011648654938
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
            1974.020866203308,
            620.9959030151367,
            1954.327688217163,
            620.9959030151367
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
          "order": 1,
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
            1943.235501384735,
            617.9919967651367,
            1899.1552715301514,
            617.9919967651367
          ],
          "order": 1,
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
            "obj-391",
            0
          ],
          "order": 0,
          "source": [
            "obj-313",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-394",
            0
          ],
          "order": 0,
          "source": [
            "obj-313",
            5
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
            1971.5690684318542,
            545.9962763786316,
            1850.879406929016,
            545.9962763786316
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
            "obj-395",
            0
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
            "obj-360",
            0
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
            2130.189766407013,
            730.4422043561935,
            2130.3449382781982,
            730.4422043561935
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
            2130.189766407013,
            746.877872088924,
            1861.379406929016,
            746.877872088924
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
            1933.6380319595337,
            478.8011648654938,
            1850.879406929016,
            478.8011648654938
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
            "obj-368",
            0
          ],
          "source": [
            "obj-367",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-369",
            0
          ],
          "source": [
            "obj-368",
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
            "obj-372",
            0
          ],
          "source": [
            "obj-371",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-376",
            1
          ],
          "source": [
            "obj-375",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-376",
            0
          ],
          "source": [
            "obj-375",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-376",
            2
          ],
          "source": [
            "obj-377",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-380",
            0
          ],
          "source": [
            "obj-379",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-381",
            0
          ],
          "source": [
            "obj-380",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-384",
            0
          ],
          "source": [
            "obj-383",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-388",
            1
          ],
          "source": [
            "obj-387",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-388",
            0
          ],
          "source": [
            "obj-387",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-388",
            2
          ],
          "source": [
            "obj-389",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-392",
            0
          ],
          "source": [
            "obj-391",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-393",
            0
          ],
          "source": [
            "obj-392",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-396",
            0
          ],
          "source": [
            "obj-395",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-400",
            1
          ],
          "source": [
            "obj-399",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-400",
            0
          ],
          "source": [
            "obj-399",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-400",
            2
          ],
          "source": [
            "obj-401",
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
            543.982786655426,
            801.920282959938,
            509.5000262260437,
            801.920282959938
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
            "obj-369",
            0
          ],
          "destination": [
            "obj-373",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-370",
            0
          ],
          "destination": [
            "obj-373",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-372",
            0
          ],
          "destination": [
            "obj-373",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-373",
            0
          ],
          "destination": [
            "obj-405",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-346",
            1
          ],
          "destination": [
            "obj-348",
            3
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-346",
            0
          ],
          "destination": [
            "obj-405",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-405",
            0
          ],
          "destination": [
            "obj-348",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-348",
            0
          ],
          "destination": [
            "obj-375",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-348",
            1
          ],
          "destination": [
            "obj-375",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-348",
            2
          ],
          "destination": [
            "obj-375",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-381",
            0
          ],
          "destination": [
            "obj-385",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-382",
            0
          ],
          "destination": [
            "obj-385",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-384",
            0
          ],
          "destination": [
            "obj-385",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-385",
            0
          ],
          "destination": [
            "obj-403",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-353",
            1
          ],
          "destination": [
            "obj-355",
            3
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-353",
            0
          ],
          "destination": [
            "obj-403",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-403",
            0
          ],
          "destination": [
            "obj-355",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-355",
            0
          ],
          "destination": [
            "obj-387",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-355",
            1
          ],
          "destination": [
            "obj-387",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-355",
            2
          ],
          "destination": [
            "obj-387",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-393",
            0
          ],
          "destination": [
            "obj-397",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-394",
            0
          ],
          "destination": [
            "obj-397",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-396",
            0
          ],
          "destination": [
            "obj-397",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-397",
            0
          ],
          "destination": [
            "obj-404",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-360",
            1
          ],
          "destination": [
            "obj-362",
            3
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-360",
            0
          ],
          "destination": [
            "obj-404",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-404",
            0
          ],
          "destination": [
            "obj-362",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-362",
            0
          ],
          "destination": [
            "obj-399",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-362",
            1
          ],
          "destination": [
            "obj-399",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-362",
            2
          ],
          "destination": [
            "obj-399",
            2
          ]
        }
      }
    ],
    "autosave": 0
  }
}
