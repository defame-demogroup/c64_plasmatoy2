.disk [filename="../plasmatoy2.d64", name="PLASMATOY V2", id="2021!" ] 
{
    [name="----------------", type="del<"                            ],
    [name="  PLASMA-TOY 2  ", type="prg<", segments="BASIC, MAIN, MUSIC, PLASMA_CHARS, SPRITES, PLASMA_DATA, LOADER, LOADING_SCREEN" ],
    [name="----------------", type="del<"                            ],
    [name="AA", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="BB", type="prg<", segments="PLASMA_DATA_BB" ],
    [name="CC", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="DD", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="EE", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="FF", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="GG", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="HH", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="II", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="JJ", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="KK", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="LL", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="MM", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="NN", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="OO", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="PP", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="QQ", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="----------------", type="del<"],
    [name=">DEFAME IN 2020<", type="del<"],
    [name="----------------", type="del<"]
}
.import source "main.asm"
.import source "plasma_data_aa.asm"
.import source "plasma_data_bb.asm"


/*
.segment PLASMA_TABLES2 [start=$c000]
render_plasma_tables(46,256,34,128)
.segment PLASMA_TABLES3 [start=$c000]
render_plasma_tables(5,64,7,64)
.segment PLASMA_TABLES4 [start=$c000]
render_plasma_tables(64,255,64,255)
.segment PLASMA_TABLES5 [start=$c000]
render_plasma_tables(32,128,16,128)
.segment PLASMA_TABLES6 [start=$c000]
render_plasma_tables(16,64,24,32)
.segment PLASMA_TABLES7 [start=$c000]
render_plasma_tables(36,255,24,128)
.segment PLASMA_TABLES8 [start=$c000]
render_plasma_tables(1,64,255,128)
.segment PLASMA_TABLES9 [start=$c000]
render_plasma_tables(255,255,255,255)
.segment PLASMA_TABLESa [start=$c000]
render_plasma_tables(127,127,127,127)
.segment PLASMA_TABLESb [start=$c000]
render_plasma_tables(8,128,9,128)
.segment PLASMA_TABLESc [start=$c000]
render_plasma_tables(25,127,29,128) //todo update this data
.segment PLASMA_TABLESd [start=$c000]
render_plasma_tables(25,64,14,128)
.segment PLASMA_TABLESe [start=$c000]
render_plasma_tables(25,64,14,128)
.segment PLASMA_TABLESf [start=$c000]
render_plasma_tables(25,64,14,128)

*/