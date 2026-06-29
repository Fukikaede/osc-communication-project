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
        "rect": [ 240.0, 136.0, 884.0, 764.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1783.0, 656.4117531776428, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1244.4444637298584, 142.85714507102966, 120.0, 20.0 ],
                    "text": "MIDI high ch 3"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "dial",
                    "min": 1.0,
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2686.0, 656.0, 40.0, 40.0 ],
                    "size": 16.0
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-3",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2686.0, 703.0, 53.0, 23.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4251.724360942841, 2462.069094657898, 100.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-142",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1138.4616470336914, 1503.0770664215088, 152.0, 22.0 ],
                    "text": "sprintf setcell %d %d val 1."
                }
            },
            {
                "box": {
                    "id": "obj-143",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1138.4616470336914, 1456.9232158660889, 59.33762741088867, 22.0 ],
                    "text": "pack i i"
                }
            },
            {
                "box": {
                    "id": "obj-147",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1176.923189163208, 1407.6924419403076, 29.5, 22.0 ],
                    "text": "+ 6"
                }
            },
            {
                "box": {
                    "id": "obj-150",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1136.9231853485107, 1407.6924419403076, 29.5, 22.0 ],
                    "text": "+ 6"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 970.769323348999, 1572.3078422546387, 152.0, 22.0 ],
                    "text": "sprintf setcell %d %d val 1."
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 970.769323348999, 1518.4616832733154, 59.33762741088867, 22.0 ],
                    "text": "pack i i"
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1010.7693271636963, 1460.0001392364502, 29.5, 22.0 ],
                    "text": "+ 6"
                }
            },
            {
                "box": {
                    "id": "obj-139",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 970.769323348999, 1460.0001392364502, 29.5, 22.0 ],
                    "text": "+ 6"
                }
            },
            {
                "box": {
                    "id": "obj-313",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "float", "int", "int", "float", "float", "float" ],
                    "patching_rect": [ 1663.2352623939514, 676.4705753326416, 172.926824092865, 22.0 ],
                    "text": "unpack f i i f f f"
                }
            },
            {
                "box": {
                    "id": "obj-314",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1783.823495388031, 569.1176362037659, 62.0, 22.0 ],
                    "text": "zl iter 6"
                }
            },
            {
                "box": {
                    "id": "obj-315",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1656.6667456626892, 601.1111397743225, 87.0787467956543, 20.0 ],
                    "text": "第　　　小節"
                }
            },
            {
                "box": {
                    "id": "obj-322",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 1745.5882019996643, 469.1176381111145, 29.5, 22.0 ],
                    "text": "t l b"
                }
            },
            {
                "box": {
                    "id": "obj-326",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1663.2352623939514, 889.7058653831482, 29.5, 22.0 ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-327",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1827.0, 808.4117531776428, 27.6666761636734, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1379.9206455945969, 230.1587337255478, 27.6666761636734, 20.0 ],
                    "text": "vel"
                }
            },
            {
                "box": {
                    "id": "obj-328",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1774.0, 808.4117531776428, 31.833341538906097, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1325.9523907899857, 230.1587337255478, 31.833341538906097, 20.0 ],
                    "text": "dur"
                }
            },
            {
                "box": {
                    "id": "obj-329",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1724.0, 808.4117531776428, 34.000006914138794, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1276.7460408210754, 230.1587337255478, 34.000006914138794, 20.0 ],
                    "text": "freq"
                }
            },
            {
                "box": {
                    "id": "obj-330",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1674.0, 808.4117531776428, 39.166665732860565, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1225.952389240265, 230.1587337255478, 39.166665732860565, 20.0 ],
                    "text": "beat"
                }
            },
            {
                "box": {
                    "id": "obj-331",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1692.6470265388489, 851.4705719947815, 99.0, 22.0 ],
                    "text": "expr 60000. / $f1"
                }
            },
            {
                "box": {
                    "id": "obj-332",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1663.2352623939514, 599.9999885559082, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-333",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1766.0, 778.4117531776428, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1318.015882730484, 200.00000309944153, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-334",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1817.0, 778.4117531776428, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1368.8095343112946, 200.00000309944153, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-335",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1712.0, 778.4117531776428, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1264.0476279258728, 200.00000309944153, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-336",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1663.0, 778.4117531776428, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1214.8412779569626, 200.00000309944153, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-337",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1745.5882019996643, 517.6470489501953, 55.0, 22.0 ],
                    "text": "zl slice 1"
                }
            },
            {
                "box": {
                    "id": "obj-287",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "float", "int", "int", "float", "float", "float" ],
                    "patching_rect": [ 1364.8641753196716, 673.5293989181519, 172.926824092865, 22.0 ],
                    "text": "unpack f i i f f f"
                }
            },
            {
                "box": {
                    "id": "obj-288",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1485.4524083137512, 569.1176362037659, 62.0, 22.0 ],
                    "text": "zl iter 6"
                }
            },
            {
                "box": {
                    "id": "obj-289",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1357.7778425216675, 598.0588121414185, 87.0787467956543, 20.0 ],
                    "text": "第　　　小節"
                }
            },
            {
                "box": {
                    "id": "obj-296",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 1451.6288795471191, 466.17646169662476, 29.5, 22.0 ],
                    "text": "t l b"
                }
            },
            {
                "box": {
                    "id": "obj-300",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1364.8641753196716, 889.7058653831482, 29.5, 22.0 ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-301",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1531.0, 807.4117531776428, 27.6666761636734, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1152.3809702396393, 233.33333694934845, 27.6666761636734, 20.0 ],
                    "text": "vel"
                }
            },
            {
                "box": {
                    "id": "obj-302",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1472.0, 807.4117531776428, 31.833341538906097, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1093.650810599327, 233.33333694934845, 31.833341538906097, 20.0 ],
                    "text": "dur"
                }
            },
            {
                "box": {
                    "id": "obj-303",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1426.0, 807.4117531776428, 34.000006914138794, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1047.6190638542175, 233.33333694934845, 34.000006914138794, 20.0 ],
                    "text": "freq"
                }
            },
            {
                "box": {
                    "id": "obj-304",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1372.0, 807.4117531776428, 39.166665732860565, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 993.6508090496063, 233.33333694934845, 39.166665732860565, 20.0 ],
                    "text": "beat"
                }
            },
            {
                "box": {
                    "id": "obj-305",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1394.1288834810257, 845.588219165802, 99.0, 22.0 ],
                    "text": "expr 60000. / $f1"
                }
            },
            {
                "box": {
                    "id": "obj-306",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1364.8641753196716, 597.0588121414185, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-307",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1469.0, 775.4117531776428, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1090.4762073755264, 201.58730471134186, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-308",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1520.0, 775.4117531776428, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1141.269858956337, 201.58730471134186, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-309",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1414.0, 775.4117531776428, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1034.920650959015, 201.58730471134186, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-310",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1364.0, 775.4117531776428, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 985.7143009901047, 201.58730471134186, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-311",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1451.6288795471191, 514.7058725357056, 55.0, 22.0 ],
                    "text": "zl slice 1"
                }
            },
            {
                "box": {
                    "id": "obj-248",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "float", "int", "int", "float", "float", "float" ],
                    "patching_rect": [ 1102.9411554336548, 669.1176342964172, 172.926824092865, 22.0 ],
                    "text": "unpack f i i f f f"
                }
            },
            {
                "box": {
                    "id": "obj-249",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1220.5882120132446, 561.7646951675415, 62.0, 22.0 ],
                    "text": "zl iter 6"
                }
            },
            {
                "box": {
                    "id": "obj-250",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1086.6667184829712, 599.4117531776428, 95.08196449279785, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1019.0, 88.88889026641846, 95.0, 20.0 ],
                    "text": "第　　　　小節"
                }
            },
            {
                "box": {
                    "id": "obj-259",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 1182.352918624878, 454.41175603866577, 29.5, 22.0 ],
                    "text": "t l b"
                }
            },
            {
                "box": {
                    "id": "obj-263",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1102.9411554336548, 879.4117479324341, 29.5, 22.0 ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-264",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1266.0, 802.4117531776428, 27.6666761636734, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 912.6984268426895, 238.09524178504944, 27.6666761636734, 20.0 ],
                    "text": "vel"
                }
            },
            {
                "box": {
                    "id": "obj-265",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1211.0, 802.4117531776428, 31.833341538906097, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 857.142870426178, 238.09524178504944, 31.833341538906097, 20.0 ],
                    "text": "dur"
                }
            },
            {
                "box": {
                    "id": "obj-266",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1158.0, 802.4117531776428, 34.000006914138794, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 804.7619172334671, 238.09524178504944, 34.000006914138794, 20.0 ],
                    "text": "freq"
                }
            },
            {
                "box": {
                    "id": "obj-267",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1111.0, 802.4117531776428, 39.166665732860565, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 757.1428688764572, 238.09524178504944, 39.166665732860565, 20.0 ],
                    "text": "beat"
                }
            },
            {
                "box": {
                    "id": "obj-268",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1644.117615699768, 174.13794374465942, 99.0, 22.0 ],
                    "text": "expr 60000. / $f1"
                }
            },
            {
                "box": {
                    "id": "obj-269",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1103.0, 598.4117531776428, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1034.920650959015, 87.30158865451813, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-270",
                    "linecount": 4,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1417.2414536476135, 224.1379427909851, 50.0, 62.0 ],
                    "text": "param:sigma_pitch=1.0"
                }
            },
            {
                "box": {
                    "id": "obj-271",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "FullPacket" ],
                    "patching_rect": [ 1448.2759380340576, 168.9655261039734, 71.0, 22.0 ],
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
                    "patching_rect": [ 1926.0, 1130.4117531776428, 89.0, 40.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1034.5476348400116, 363.33335065841675, 89.0, 40.0 ],
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
                    "patching_rect": [ 1801.0, 1130.4117531776428, 59.0, 40.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 908.9920732975006, 363.33335065841675, 59.0, 40.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1915.0, 1085.4117531776428, 106.0, 42.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1023.4365231990814, 318.88890409469604, 106.0, 42.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-277",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1207.0, 764.4117531776428, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 853.9682672023773, 200.00000309944153, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-278",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1255.0, 764.4117531776428, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 901.5873155593872, 200.00000309944153, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-279",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1151.0, 764.4117531776428, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 798.4127107858658, 200.00000309944153, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-280",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1103.0, 764.4117531776428, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 749.2063608169556, 200.00000309944153, 50.0, 22.0 ]
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1784.0, 1085.4117531776428, 106.0, 42.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 891.2142946720123, 318.88890409469604, 106.0, 42.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-282",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "float" ],
                    "patching_rect": [ 1787.0, 999.4117531776428, 148.33332979679108, 22.0 ],
                    "text": "unpack f f"
                }
            },
            {
                "box": {
                    "id": "obj-283",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1182.352918624878, 505.8823432922363, 55.0, 22.0 ],
                    "text": "zl slice 1"
                }
            },
            {
                "box": {
                    "id": "obj-284",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 15,
                    "numoutlets": 15,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 1386.2069692611694, 289.94117069244385, 335.0, 35.0 ],
                    "text": "route /grid /rgrid /seq /seq_low /seq_mid /seq_high /pdf /rpdf /pdf_low /pdf_high /stat /ack /tempo /chord"
                }
            },
            {
                "box": {
                    "id": "obj-285",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1386.2069692611694, 124.13793754577637, 97.0, 22.0 ],
                    "text": "udpreceive 8000"
                }
            },
            {
                "box": {
                    "id": "obj-136",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1204.61549949646, 1780.0001697540283, 35.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "obj-127",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 1173.8462657928467, 1716.923240661621, 122.0, 22.0 ],
                    "text": "jit.op @op * @val 0.9"
                }
            },
            {
                "box": {
                    "id": "obj-125",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 1173.8462657928467, 1680.0001602172852, 187.0, 22.0 ],
                    "text": "jit.matrix freq_grid 1 float32 13 13"
                }
            },
            {
                "box": {
                    "id": "obj-123",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1173.8462657928467, 1638.4616947174072, 63.0, 22.0 ],
                    "text": "qmetro 50"
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1173.8462657928467, 1590.7693824768066, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-88",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 780.0000743865967, 1572.3078422546387, 152.0, 22.0 ],
                    "text": "sprintf setcell %d %d val 1."
                }
            },
            {
                "box": {
                    "id": "obj-85",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 780.0000743865967, 1521.5386066436768, 59.33762741088867, 22.0 ],
                    "text": "pack i i"
                }
            },
            {
                "box": {
                    "id": "obj-165",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 821.5385398864746, 1463.0770626068115, 29.5, 22.0 ],
                    "text": "+ 6"
                }
            },
            {
                "box": {
                    "id": "obj-164",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 780.0000743865967, 1463.0770626068115, 29.5, 22.0 ],
                    "text": "+ 6"
                }
            },
            {
                "box": {
                    "id": "obj-159",
                    "maxclass": "jit.pwindow",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 736.9231472015381, 1746.1540126800537, 341.6666634082794, 320.2380921840668 ],
                    "sync": 1
                }
            },
            {
                "box": {
                    "id": "obj-157",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 960.0000915527344, 1635.384771347046, 187.0, 22.0 ],
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
                    "patching_rect": [ 1686.1540069580078, 1178.4616508483887, 401.0, 107.0 ],
                    "text": "\nC — 候補分布の不確実性（エントロピー）\n\nσ — 候補分布の広がり（散らばり具合）\n"
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1169.5753030776978, 302.94117069244385, 46.0, 22.0 ],
                    "text": "pack i i"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1209.2811846733093, 154.41176176071167, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1209.2811846733093, 116.17646837234497, 76.0, 22.0 ],
                    "text": "qmetro 2000"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "FullPacket" ],
                    "patching_rect": [ 1169.5753030776978, 355.8823461532593, 69.0, 22.0 ],
                    "text": "o.pack /pull"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "int", "", "", "int" ],
                    "patching_rect": [ 1169.5753030776978, 251.4705834388733, 102.0, 22.0 ],
                    "text": "counter 0 999999"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1278.3988304138184, 164.70587921142578, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1174.0, 39.41175317764282, 63.36585092544556, 63.36585092544556 ],
                    "presentation": 1,
                    "presentation_rect": [ 547.6190561056137, 88.88889026641846, 63.36585092544556, 63.36585092544556 ]
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 9,
                    "outlettype": [ "int", "int", "float", "float", "float", "", "int", "float", "" ],
                    "patching_rect": [ 1173.9870676994324, 202.94117259979248, 128.0, 22.0 ],
                    "text": "transport @tempo 120"
                }
            },
            {
                "box": {
                    "id": "obj-339",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1289.7058577537537, 129.41176223754883, 72.0, 22.0 ],
                    "text": "tempo $1"
                }
            },
            {
                "box": {
                    "id": "obj-431",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1229.8694195747375, 302.94117069244385, 78.0, 22.0 ],
                    "text": "loadmess 4"
                }
            },
            {
                "box": {
                    "id": "obj-432",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1644.117615699768, 224.1379427909851, 33.0, 22.0 ],
                    "text": "* 4."
                }
            },
            {
                "box": {
                    "id": "obj-433",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1644.117615699768, 116.17646837234497, 92.0, 22.0 ],
                    "text": "loadmess 120"
                }
            },
            {
                "box": {
                    "id": "obj-434",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1934.0, 416.0, 170.0, 20.0 ],
                    "text": "Pitch lattice visualizer"
                }
            },
            {
                "box": {
                    "filename": "lattice_visualizer.js",
                    "id": "obj-435",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1935.0, 493.4117531776428, 430.0, 340.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-436",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1932.0, 304.0, 76.0, 22.0 ],
                    "text": "prepend grid"
                }
            },
            {
                "box": {
                    "id": "obj-437",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1932.0, 345.0, 100.0, 22.0 ],
                    "text": "prepend seq_low"
                }
            },
            {
                "box": {
                    "id": "obj-438",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2032.0, 345.0, 101.0, 22.0 ],
                    "text": "prepend seq_mid"
                }
            },
            {
                "box": {
                    "id": "obj-439",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2135.0, 345.0, 105.0, 22.0 ],
                    "text": "prepend seq_high"
                }
            },
            {
                "box": {
                    "id": "obj-440",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1934.0, 386.0, 99.0, 22.0 ],
                    "text": "prepend pdf_mid"
                }
            },
            {
                "box": {
                    "id": "obj-441",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2034.0, 386.0, 97.0, 22.0 ],
                    "text": "prepend pdf_low"
                }
            },
            {
                "box": {
                    "id": "obj-442",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2134.0, 386.0, 102.0, 22.0 ],
                    "text": "prepend pdf_high"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1169.5753030776978, 407.35293340682983, 138.0, 22.0 ],
                    "text": "udpsend 127.0.0.1 8001"
                }
            },
            {
                "box": {
                    "id": "obj-378",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1201.0, 645.4117531776428, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 777.7777898311615, 142.85714507102966, 120.0, 20.0 ],
                    "text": "MIDI low ch 1"
                }
            },
            {
                "box": {
                    "id": "obj-390",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1461.0, 653.4117531776428, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1019.0476348400116, 142.85714507102966, 120.0, 20.0 ],
                    "text": "MIDI mid ch 2"
                }
            },
            {
                "box": {
                    "id": "obj-262",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1102.9411554336548, 983.8235106468201, 45.0, 22.0 ],
                    "text": "pipe 0."
                }
            },
            {
                "box": {
                    "id": "obj-425",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1163.2352719306946, 933.8235116004944, 30.0, 22.0 ],
                    "text": "f"
                }
            },
            {
                "box": {
                    "id": "obj-426",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "float" ],
                    "patching_rect": [ 1102.9411554336548, 933.8235116004944, 40.0, 22.0 ],
                    "text": "t b f"
                }
            },
            {
                "box": {
                    "id": "obj-261",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1102.9411554336548, 1048.5293917655945, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "id": "obj-299",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1364.8641753196716, 1016.1764512062073, 45.0, 22.0 ],
                    "text": "pipe 0."
                }
            },
            {
                "box": {
                    "id": "obj-427",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1364.8641753196716, 983.8235106468201, 30.0, 22.0 ],
                    "text": "f"
                }
            },
            {
                "box": {
                    "id": "obj-428",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "float" ],
                    "patching_rect": [ 1364.8641753196716, 944.1176290512085, 44.98589754104614, 22.0 ],
                    "text": "t b f"
                }
            },
            {
                "box": {
                    "id": "obj-298",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1364.8641753196716, 1058.8235092163086, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "id": "obj-325",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1663.2352623939514, 1016.1764512062073, 45.0, 22.0 ],
                    "text": "pipe 0."
                }
            },
            {
                "box": {
                    "id": "obj-429",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1663.2352623939514, 980.8823342323303, 30.0, 22.0 ],
                    "text": "f"
                }
            },
            {
                "box": {
                    "id": "obj-430",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "float" ],
                    "patching_rect": [ 1663.2352623939514, 944.1176290512085, 45.0, 22.0 ],
                    "text": "t b f"
                }
            },
            {
                "box": {
                    "id": "obj-324",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1663.2352623939514, 1058.8235092163086, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "id": "obj-252",
                    "maxclass": "gain~",
                    "multichannelvariant": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1369.0, 1110.4117531776428, 184.24589920043945, 34.426228523254395 ],
                    "presentation": 1,
                    "presentation_rect": [ 543.3019815683365, 197.80952727794647, 184.24589920043945, 34.426228523254395 ]
                }
            },
            {
                "box": {
                    "id": "obj-251",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 1369.0, 1199.4117531776428, 72.0, 72.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 543.3019815683365, 279.365083694458, 72.0, 72.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-406",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2380.0, 350.0, 140.0, 20.0 ],
                    "text": "bar chord MIDI ch 4"
                }
            },
            {
                "box": {
                    "id": "obj-407",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 2380.0, 386.0, 55.0, 22.0 ],
                    "text": "zl slice 1"
                }
            },
            {
                "box": {
                    "id": "obj-408",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "float", "float", "float", "float", "float" ],
                    "patching_rect": [ 2380.0, 432.0, 132.0, 22.0 ],
                    "text": "unpack f f f f f"
                }
            },
            {
                "box": {
                    "id": "obj-409",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2380.0, 484.0, 38.0, 22.0 ],
                    "text": "ftom"
                }
            },
            {
                "box": {
                    "id": "obj-412",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2470.0, 484.0, 38.0, 22.0 ],
                    "text": "ftom"
                }
            },
            {
                "box": {
                    "id": "obj-415",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2560.0, 484.0, 38.0, 22.0 ],
                    "text": "ftom"
                }
            },
            {
                "box": {
                    "id": "obj-410",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2380.0, 518.0, 45.0, 22.0 ],
                    "text": "round"
                }
            },
            {
                "box": {
                    "id": "obj-413",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2470.0, 518.0, 45.0, 22.0 ],
                    "text": "round"
                }
            },
            {
                "box": {
                    "id": "obj-416",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2560.0, 518.0, 45.0, 22.0 ],
                    "text": "round"
                }
            },
            {
                "box": {
                    "id": "obj-411",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2380.0, 552.0, 72.0, 22.0 ],
                    "text": "clip 0 127"
                }
            },
            {
                "box": {
                    "id": "obj-414",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2470.0, 552.0, 72.0, 22.0 ],
                    "text": "clip 0 127"
                }
            },
            {
                "box": {
                    "id": "obj-417",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2560.0, 552.0, 72.0, 22.0 ],
                    "text": "clip 0 127"
                }
            },
            {
                "box": {
                    "id": "obj-418",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2650.0, 518.0, 45.0, 22.0 ],
                    "text": "round"
                }
            },
            {
                "box": {
                    "id": "obj-419",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2740.0, 552.0, 72.0, 22.0 ],
                    "text": "clip 1 127"
                }
            },
            {
                "box": {
                    "id": "obj-420",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "float", "float" ],
                    "patching_rect": [ 2380.0, 632.0, 108.0, 22.0 ],
                    "text": "makenote 80 4000"
                }
            },
            {
                "box": {
                    "id": "obj-421",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "float", "float" ],
                    "patching_rect": [ 2508.0, 632.0, 108.0, 22.0 ],
                    "text": "makenote 80 4000"
                }
            },
            {
                "box": {
                    "id": "obj-422",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "float", "float" ],
                    "patching_rect": [ 2636.0, 632.0, 108.0, 22.0 ],
                    "text": "makenote 80 4000"
                }
            },
            {
                "box": {
                    "id": "obj-423",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 2508.0, 718.0, 58.0, 22.0 ],
                    "text": "noteout"
                }
            },
            {
                "box": {
                    "id": "obj-424",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2596.0, 695.0, 78.0, 22.0 ],
                    "text": "loadmess 4"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-123", 0 ],
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-125", 0 ],
                    "source": [ "obj-123", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-127", 0 ],
                    "source": [ "obj-125", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-157", 0 ],
                    "source": [ "obj-127", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-157", 0 ],
                    "source": [ "obj-136", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "source": [ "obj-139", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-157", 0 ],
                    "source": [ "obj-142", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-142", 0 ],
                    "source": [ "obj-143", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-143", 1 ],
                    "source": [ "obj-147", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-143", 0 ],
                    "source": [ "obj-150", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-159", 0 ],
                    "source": [ "obj-157", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-85", 0 ],
                    "source": [ "obj-164", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-85", 1 ],
                    "source": [ "obj-165", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "order": 1,
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "midpoints": [ 1183.5, 106.77293860912323, 1218.7811846733093, 106.77293860912323 ],
                    "order": 0,
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-164", 0 ],
                    "source": [ "obj-248", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-165", 0 ],
                    "source": [ "obj-248", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-263", 0 ],
                    "order": 1,
                    "source": [ "obj-248", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-277", 0 ],
                    "midpoints": [ 1235.5826147079467, 714.2035856246948, 1216.5, 714.2035856246948 ],
                    "source": [ "obj-248", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-278", 0 ],
                    "source": [ "obj-248", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-279", 0 ],
                    "midpoints": [ 1204.7972498893737, 714.0395231246948, 1160.5, 714.0395231246948 ],
                    "order": 1,
                    "source": [ "obj-248", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-280", 0 ],
                    "order": 0,
                    "source": [ "obj-248", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-425", 1 ],
                    "order": 0,
                    "source": [ "obj-248", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-248", 0 ],
                    "midpoints": [ 1230.0882120132446, 625.1922402381897, 1112.4411554336548, 625.1922402381897 ],
                    "source": [ "obj-249", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 1 ],
                    "order": 3,
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-268", 0 ],
                    "order": 1,
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-305", 0 ],
                    "order": 2,
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-331", 0 ],
                    "order": 0,
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-251", 1 ],
                    "order": 0,
                    "source": [ "obj-252", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-251", 0 ],
                    "order": 1,
                    "source": [ "obj-252", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-283", 0 ],
                    "source": [ "obj-259", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-157", 0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-252", 0 ],
                    "source": [ "obj-261", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-261", 0 ],
                    "source": [ "obj-262", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-426", 0 ],
                    "source": [ "obj-263", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-263", 1 ],
                    "midpoints": [ 1653.617615699768, 691.5444441828877, 1122.9411554336548, 691.5444441828877 ],
                    "order": 1,
                    "source": [ "obj-268", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-432", 0 ],
                    "order": 0,
                    "source": [ "obj-268", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-270", 1 ],
                    "source": [ "obj-271", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-276", 0 ],
                    "source": [ "obj-282", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-281", 0 ],
                    "source": [ "obj-282", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-249", 0 ],
                    "source": [ "obj-283", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-269", 0 ],
                    "midpoints": [ 1191.852918624878, 557.9971287250519, 1112.5, 557.9971287250519 ],
                    "source": [ "obj-283", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-259", 0 ],
                    "order": 1,
                    "source": [ "obj-284", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-268", 0 ],
                    "order": 1,
                    "source": [ "obj-284", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-282", 0 ],
                    "source": [ "obj-284", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-296", 0 ],
                    "order": 1,
                    "source": [ "obj-284", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-305", 0 ],
                    "order": 2,
                    "source": [ "obj-284", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-322", 0 ],
                    "order": 1,
                    "source": [ "obj-284", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-331", 0 ],
                    "order": 0,
                    "source": [ "obj-284", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-339", 0 ],
                    "order": 3,
                    "source": [ "obj-284", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-436", 0 ],
                    "source": [ "obj-284", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-437", 0 ],
                    "order": 0,
                    "source": [ "obj-284", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-438", 0 ],
                    "order": 0,
                    "source": [ "obj-284", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-439", 0 ],
                    "order": 0,
                    "source": [ "obj-284", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-440", 0 ],
                    "source": [ "obj-284", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-441", 0 ],
                    "source": [ "obj-284", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-442", 0 ],
                    "source": [ "obj-284", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-271", 0 ],
                    "midpoints": [ 1395.7069692611694, 156.06533467769623, 1457.7759380340576, 156.06533467769623 ],
                    "order": 0,
                    "source": [ "obj-285", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-284", 0 ],
                    "order": 1,
                    "source": [ "obj-285", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-139", 0 ],
                    "source": [ "obj-287", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-300", 0 ],
                    "order": 0,
                    "source": [ "obj-287", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-307", 0 ],
                    "midpoints": [ 1497.5056345939636, 713.1983184814453, 1478.5, 713.1983184814453 ],
                    "source": [ "obj-287", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-308", 0 ],
                    "source": [ "obj-287", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-309", 0 ],
                    "midpoints": [ 1466.7202697753905, 717.6436309814453, 1423.5, 717.6436309814453 ],
                    "order": 0,
                    "source": [ "obj-287", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-310", 0 ],
                    "order": 1,
                    "source": [ "obj-287", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-427", 1 ],
                    "midpoints": [ 1466.7202697753905, 762.8235092163086, 1466.9409799505956, 762.8235092163086, 1466.9409799505956, 978.8235092163086, 1385.3641753196716, 978.8235092163086 ],
                    "order": 1,
                    "source": [ "obj-287", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 0 ],
                    "source": [ "obj-287", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-287", 0 ],
                    "midpoints": [ 1494.9524083137512, 632.8197855949402, 1374.3641753196716, 632.8197855949402 ],
                    "source": [ "obj-288", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-311", 0 ],
                    "source": [ "obj-296", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-252", 0 ],
                    "source": [ "obj-298", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-298", 0 ],
                    "source": [ "obj-299", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-423", 2 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-428", 0 ],
                    "source": [ "obj-300", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-300", 1 ],
                    "source": [ "obj-305", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-288", 0 ],
                    "source": [ "obj-311", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-306", 0 ],
                    "midpoints": [ 1461.1288795471191, 565.6246740818024, 1374.3641753196716, 565.6246740818024 ],
                    "source": [ "obj-311", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-147", 0 ],
                    "source": [ "obj-313", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-150", 0 ],
                    "source": [ "obj-313", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-326", 0 ],
                    "order": 0,
                    "source": [ "obj-313", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-333", 0 ],
                    "midpoints": [ 1795.8767216682434, 730.7494316101074, 1775.5, 730.7494316101074 ],
                    "source": [ "obj-313", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-334", 0 ],
                    "source": [ "obj-313", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-335", 0 ],
                    "midpoints": [ 1765.0913568496703, 720.5267753601074, 1721.5, 720.5267753601074 ],
                    "order": 0,
                    "source": [ "obj-313", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-336", 0 ],
                    "order": 1,
                    "source": [ "obj-313", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-429", 1 ],
                    "order": 1,
                    "source": [ "obj-313", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-313", 0 ],
                    "midpoints": [ 1793.323495388031, 632.3552737236023, 1672.7352623939514, 632.3552737236023 ],
                    "source": [ "obj-314", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-337", 0 ],
                    "source": [ "obj-322", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-252", 0 ],
                    "source": [ "obj-324", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-324", 0 ],
                    "source": [ "obj-325", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-430", 0 ],
                    "source": [ "obj-326", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-326", 1 ],
                    "source": [ "obj-331", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-314", 0 ],
                    "source": [ "obj-337", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-332", 0 ],
                    "midpoints": [ 1755.0882019996643, 565.1601622104645, 1672.7352623939514, 565.1601622104645 ],
                    "source": [ "obj-337", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "midpoints": [ 1299.2058577537537, 153.0, 1245.0, 153.0, 1245.0, 189.0, 1183.4870676994324, 189.0 ],
                    "source": [ "obj-339", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-408", 0 ],
                    "source": [ "obj-407", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-409", 0 ],
                    "source": [ "obj-408", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-412", 0 ],
                    "source": [ "obj-408", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-415", 0 ],
                    "source": [ "obj-408", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-418", 0 ],
                    "source": [ "obj-408", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-419", 0 ],
                    "source": [ "obj-408", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-410", 0 ],
                    "source": [ "obj-409", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-411", 0 ],
                    "source": [ "obj-410", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-420", 0 ],
                    "source": [ "obj-411", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-413", 0 ],
                    "source": [ "obj-412", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-414", 0 ],
                    "source": [ "obj-413", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-421", 0 ],
                    "source": [ "obj-414", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-416", 0 ],
                    "source": [ "obj-415", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-417", 0 ],
                    "source": [ "obj-416", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-422", 0 ],
                    "source": [ "obj-417", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-420", 2 ],
                    "order": 2,
                    "source": [ "obj-418", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-421", 2 ],
                    "order": 1,
                    "source": [ "obj-418", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-422", 2 ],
                    "order": 0,
                    "source": [ "obj-418", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-420", 1 ],
                    "order": 2,
                    "source": [ "obj-419", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-421", 1 ],
                    "order": 1,
                    "source": [ "obj-419", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-422", 1 ],
                    "order": 0,
                    "source": [ "obj-419", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-423", 1 ],
                    "source": [ "obj-420", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-423", 0 ],
                    "source": [ "obj-420", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-423", 1 ],
                    "source": [ "obj-421", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-423", 0 ],
                    "source": [ "obj-421", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-423", 1 ],
                    "source": [ "obj-422", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-423", 0 ],
                    "source": [ "obj-422", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-423", 2 ],
                    "source": [ "obj-424", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-262", 0 ],
                    "source": [ "obj-425", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-262", 1 ],
                    "source": [ "obj-426", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-425", 0 ],
                    "source": [ "obj-426", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-299", 0 ],
                    "source": [ "obj-427", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-299", 1 ],
                    "source": [ "obj-428", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-427", 0 ],
                    "source": [ "obj-428", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-325", 0 ],
                    "source": [ "obj-429", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-325", 1 ],
                    "source": [ "obj-430", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-429", 0 ],
                    "source": [ "obj-430", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-432", 1 ],
                    "order": 0,
                    "source": [ "obj-431", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 1 ],
                    "order": 1,
                    "source": [ "obj-431", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 1 ],
                    "source": [ "obj-432", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-268", 0 ],
                    "order": 1,
                    "source": [ "obj-433", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-305", 0 ],
                    "order": 2,
                    "source": [ "obj-433", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-331", 0 ],
                    "order": 0,
                    "source": [ "obj-433", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-435", 0 ],
                    "source": [ "obj-436", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-435", 0 ],
                    "source": [ "obj-437", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-435", 0 ],
                    "source": [ "obj-438", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-435", 0 ],
                    "source": [ "obj-439", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-435", 0 ],
                    "source": [ "obj-440", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-435", 0 ],
                    "source": [ "obj-441", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-435", 0 ],
                    "source": [ "obj-442", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "midpoints": [ 1218.7811846733093, 189.0, 1183.4870676994324, 189.0 ],
                    "order": 0,
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "midpoints": [ 1218.7811846733093, 189.0, 1158.0, 189.0, 1158.0, 237.0, 1179.0753030776978, 237.0 ],
                    "order": 1,
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "source": [ "obj-77", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 1 ],
                    "source": [ "obj-79", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-88", 0 ],
                    "source": [ "obj-85", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-157", 0 ],
                    "source": [ "obj-88", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}