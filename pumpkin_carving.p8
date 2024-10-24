pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- pumpkin carving
-- by wyatt richard

#include main.lua
__gfx__
00000000000000000000000000000000000000000000000003330000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000033330000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000333330000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000003333b3330000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000003353b3330000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000353b3330000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000353b3330000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000353b3330000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000353b3330000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000003533bbb3000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000003533333b000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000035bb333b000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000003553b333b000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000003333bbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000033553bbb3b00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000003353553333bb0000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000003335533533333bbbb0000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000003335533533333bbbb0000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000033333334333333444949999900000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000009aaaaa44449433333444994999999999999000000000000000000000000000000000000000000000000000000000
000000000000000000000000009999999999a4444a4444944333334949444aaa9449499999990000000000000000000000000000000000000000000000000000
000000000000000000000009999994444a4a4444444444a4444433494a944444aa99944499999000000000000000000000000000000000000000000000000000
000000000000000000009999994444449aa44444444449a4444443494aa444444a9a994444499990000000000000000000000000000000000000000000000000
000000000000000000949994444444499a444444444449a94444434494aa44444444aa4444444499000000000000000000000000000000000000000000000000
0000000000000009999499aa44444449aa444444444449a944444444944a444444444aa444444449900000000000000000000000000000000000000000000000
000000000000999999999aa444444499444444444444499944444444444a4444444444aa99944444999000000000000000000000000000000000000000000000
000000000009994444994a444444449494444444444449a444444444494a444444444444a9994444449900000000000000000000000000000000000000000000
00000000009999444494a4444444449494444444444449a444444444499a44444444444499994444444900000000000000000000000000000000000000000000
0000000009994444999444444444449494444444444449a444444444449aa444444444444aa99444494999000000000000000000000000000000000000000000
0000000009994444999444444444449494444444444449a444444444449aa444444444444aa99444494999000000000000000000000000000000000000000000
000000009aa94444994944444444449494444444444449a4444444444499a444444444444aaa4944494499900000000000000000000000000000000000000000
000000099a944449449444444444449a44444444444449a4444444444499a44444444444444aa994494444900000000000000000000000000000000000000000
00000000aa444449449444444444449a44444444444449a44444444444499444444444444449a494494444990000000000000000000000000000000000000000
000000099444449499444444444444aa4444444444444949444444444444a444444444444444a494499444990000000000000000000000000000000000000000
000009999444449a99444444444449a49444444444444949444444444444a444444444444444aa44449944499900000000000000000000000000000000000000
000009999444449a99444444444449a49444444444444949444444444444a444444444444444aa44449944499900000000000000000000000000000000000000
000099994444444a44444444444449a49444444444444949444444444444aaa44444444444444994444444449900000000000000000000000000000000000000
000009994444994a44444444444449a494444444444449494444444444449aa44444444444444a94444444449990000000000000000000000000000000000000
00009994444499aa4444444444444aa494444444444449494444444444449aa44444444444444a94444444444490000000000000000000000000000000000000
000094444449aaa94444444444444a4444444444444449494444444444444aa44444444444444aa9444444444499000000000000000000000000000000000000
000094444449aaa94444444444444a4444444444444449494444444444444aa44444444444444aa9444444444499000000000000000000000000000000000000
00099444444944a44444444444444a4444444444444449994444444444444aa94444444444444499444444444499900000000000000000000000000000000000
00094444444944a44444444444444944444444444444499444444444444449999444444444444499444444444449900000000000000000000000000000000000
000a9444449944a44444444444444944444444444444499444444444444449949444444444444499444444444449900000000000000000000000000000000000
009a94444494aa444444444444499949444444444444499444444444444444499944444444444499944444444449900000000000000000000000000000000000
009944444494aa444444444444499449444444444444499444444444444444494944444444444494944444444444900000000000000000000000000000000000
099944444499aa444444444444499449444444444444494444444444444444494944444444444494944444444444900000000000000000000000000000000000
09444444449944444444444444499449444444444444494444444444444444499444444444444499944444444444990000000000000000000000000000000000
09444444449944444444444444499449444444444444494444444444444444499944444444444449944444444444999000000000000000000000000000000000
09a44444449944444444444444499449444444444444494a4444444444444449aa44444444444449994444444444499000000000000000000000000000000000
9a4444444499444444444444444994a944444444444449a444444444444444494a44444444444449494444444444499000000000000000000000000000000000
9a4444444494444444444444444994a944444944444444a444444444444444494a44444444444449494444444444499000000000000000000000000000000000
9a4444444494444444444444444994a944444944444444a444444444444444494a44444444444449494444444444499000000000000000000000000000000000
9a444444449444944444444444499aa944444944444444aa94444444444444494a44444444444449494444444444499900000000000000000000000000000000
aa444444449a99944444444444499a94444449444444449a94444444444444449a94444444444449494444444444499000000000000000000000000000000000
a9444444449a99444444444444499a94444449944444449a94444444444444449a94444444444449494444444444494900000000000000000000000000000000
a4444444449a99444444444444499a94444444944444449a94444444444444449494444444444449444444444444444900000000000000000000000000000000
a4444444449a99444444444444499a94444444444444449494444444444444449444444444444449944444444444449000000000000000000000000000000000
a4444444449a99444444444444499a944444444444444494944444444444444494a4444444444449994444444444449000000000000000000000000000000000
a4444444449a99444444444444499a94444444444444449a444444444444444494a4444444444449994444444444449000000000000000000000000000000000
a4444444449499444444444444499a944444444444444499444444444444444494a4444444444449994444444444449000000000000000000000000000000000
a4444444449499444444444444499a944444444444444499444444444444444494a4444444444449994444444444449000000000000000000000000000000000
a4444444449499444444444444499a944444444444444499444444444444444499a4444444444449994444444444449000000000000000000000000000000000
a4444444449499444444444444499a944444444444444499444444444444444499a4444444444449994444444444449000000000000000000000000000000000
944444444494994444444444444994a4444444444444449944444444444444499aa4444444444449494444444444449000000000000000000000000000000000
944444444494994444444444444994a4444444444444449944444444444444494a44444444444449944444444444499000000000000000000000000000000000
94444444449a44944444444444499494444444444444449944444444444444499944444444444449944444444444499000000000000000000000000000000000
94444444444a44944444444444499494444444444444449994444444444444499944444444444449944444444444490000000000000000000000000000000000
94444444444a44944444444444499494444444444444449494444444994444494944444444444449444444444444490000000000000000000000000000000000
94444444444a99944444444444499949444444444444449494444444944444494944444444444449449444444444490000000000000000000000000000000000
094444444444aa944444444444444949444444444444449494444444944444494944444444444449449444444444900000000000000000000000000000000000
094444444444aa994444444444444999444444444444449494444444944444499944444444444449499444444444900000000000000000000000000000000000
094444444444aa994444444444444949444444444444449994444444994444499a44444444444449494444444444900000000000000000000000000000000000
099444444444aaa99944444444444949444444444444449944444444494444494a44444444444499494444444449000000000000000000000000000000000000
099444444444aaa99944444444444949444444444444449944444444494444494a44444444444499494444444449000000000000000000000000000000000000
00944444444444944444444444444494944444444444449449994449944444494a44444444444494494444444494000000000000000000000000000000000000
00944444444444999944444444444494494444444444444949994444444444494a44444444444494494444449990000000000000000000000000000000000000
000944444444444999444444444444944a4444444444444949994444444444494a44444444444494494444444490000000000000000000000000000000000000
000994444444444a99444444444444994a944444444444494999444444444449a944444444444494444444449990000000000000000000000000000000000000
0000944444444449aa944444444444494a9444444444444949994444444449994944444444444994444444449990000000000000000000000000000000000000
0000999444444444aaa444444444444994a444444444444949994444444449949944444444444949444444499900000000000000000000000000000000000000
000099944444444499a944444444444494a944444444449949994444444449949444444444444949444444990000000000000000000000000000000000000000
000099944444444444a9944444444444994a44444444449449994444444449949444444444449999444499900000000000000000000000000000000000000000
000009994444444444499944444444444944a44444444494499944444444999a4444444444449944444499900000000000000000000000000000000000000000
000000099444444444499994444444444494994444444494499944444444944a4444444444499944444999900000000000000000000000000000000000000000
0000000009444444444499994444444444999994444444949444444444449aaa4444444444499944499900000000000000000000000000000000000000000000
0000000009444444444499994444444444999994444444949444444444449aaa4444444444499944499900000000000000000000000000000000000000000000
0000000000999944444449999444444444499494444444949444444444499aa94444444449999444999000000000000000000000000000000000000000000000
00000000000099994444449999444444444494499444449494444444444999944444444999999449900000000000000000000000000000000000000000000000
00000000000099994444449999444444444494499444449494444444444999944444444999999449900000000000000000000000000000000000000000000000
0000000000000000994444444aa99444444499444944449494444444449994444444499949944999000000000000000000000000000000000000000000000000
00000000000000009999999999a99944444449944494449494444444449444444449994999999900000000000000000000000000000000000000000000000000
00000000000000000000009999999994444444999494499444444444499444449999999999900000000000000000000000000000000000000000000000000000
00000000000000000000000000999999999999999999999999999444494444499999990000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000009999999999999900000999999999990000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000099000000000000999900000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000005060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000015160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000022232425262728290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000303132333435363738393a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000404142434445464748494a4b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000505152535455565758595a5b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000606162636465666768696a6b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000707172737475767778797a7b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000808182838485868788898a8b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000909192939495969798999a9b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000a0a1a2a3a4a5a6a7a8a9aaab000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000b1b2b3b4b5b6b7b8b9ba00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00030000006500065000650026500265004640066400763008620096200961009610096100a6100a6100b6100b6100a6200a62009630096400865007660066700665005650036500365002650016500065000650
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
002000001885000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
