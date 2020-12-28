.disk [filename="../plasmatoy2.d64", name="PLASMATOY V2", id="2021!" ] 
{
    [name="----------------", type="del<"                            ],
    [name="  PLASMA-TOY 2  ", type="prg<", segments="BASIC, MAIN, MUSIC, PLASMA_CHARS, SPRITES, PLASMA_DATA, LOADER, LOADING_SCREEN" ],
    [name="----------------", type="del<"                            ],
    [name="AA", type="prg<", segments="PLASMA_DATA_AA" ],
    [name="BB", type="prg<", segments="PLASMA_DATA_BB" ],
    [name="CC", type="prg<", segments="PLASMA_DATA_CC" ],
    [name="DD", type="prg<", segments="PLASMA_DATA_DD" ],
    [name="EE", type="prg<", segments="PLASMA_DATA_EE" ],
    [name="FF", type="prg<", segments="PLASMA_DATA_FF" ],
    [name="GG", type="prg<", segments="PLASMA_DATA_GG" ],
    [name="HH", type="prg<", segments="PLASMA_DATA_HH" ],
    [name="II", type="prg<", segments="PLASMA_DATA_II" ],
    [name="JJ", type="prg<", segments="PLASMA_DATA_JJ" ],
    [name="KK", type="prg<", segments="PLASMA_DATA_KK" ],
    [name="LL", type="prg<", segments="PLASMA_DATA_LL" ],
    [name="MM", type="prg<", segments="PLASMA_DATA_MM" ],
    [name="NN", type="prg<", segments="PLASMA_DATA_NN" ],
    [name="OO", type="prg<", segments="PLASMA_DATA_OO" ],
    [name="PP", type="prg<", segments="PLASMA_DATA_PP" ],
    [name="QQ", type="prg<", segments="PLASMA_DATA_QQ" ],
    [name="RR", type="prg<", segments="PLASMA_DATA_RR" ],
    [name="SS", type="prg<", segments="PLASMA_DATA_SS" ],
    [name="TT", type="prg<", segments="PLASMA_DATA_TT" ],
    [name="UU", type="prg<", segments="PLASMA_DATA_UU" ],
    [name="VV", type="prg<", segments="PLASMA_DATA_VV" ],
    [name="WW", type="prg<", segments="PLASMA_DATA_WW" ],
    [name="XX", type="prg<", segments="PLASMA_DATA_XX" ],
    [name="YY", type="prg<", segments="PLASMA_DATA_YY" ],
    [name="ZZ", type="prg<", segments="PLASMA_DATA_ZZ" ],
    [name="----------------", type="del<"],
    [name=">DEFAME IN 2020<", type="del<"],
    [name="----------------", type="del<"]
}
.import source "main.asm"
//render_plasma_data(x_amp, y_amp, xa_freq,  xb_freq, ya_freq, yb_freq)
.segment PLASMA_DATA_AA [start=$c000]
render_plasma_data(0.25,0.25,1,0,0,1)
.segment PLASMA_DATA_BB [start=$c000]
render_plasma_data(0.5,0.25,1,1,0,1)
.segment PLASMA_DATA_CC [start=$c000]
render_plasma_data(0.5,0.5,1,2,0,1)
.segment PLASMA_DATA_DD [start=$c000]
render_plasma_data(0.25,0.25,1,3,6,1) 
.segment PLASMA_DATA_EE [start=$c000]
render_plasma_data(0.25,0.5,1,2,2,1) 
.segment PLASMA_DATA_FF [start=$c000]
render_plasma_data(0.5,0.5,1,1,1,1) 
.segment PLASMA_DATA_GG [start=$c000]
render_plasma_data(0.75,0.01,2,1,1,2) 
.segment PLASMA_DATA_HH [start=$c000]
render_plasma_data(1,0.5,1,0,3,1)
.segment PLASMA_DATA_II [start=$c000]
render_plasma_data(0.25,0.75,0,1,1,0)
.segment PLASMA_DATA_JJ [start=$c000]
render_plasma_data(0.4,0.5,1,2,3,1)
.segment PLASMA_DATA_KK [start=$c000]
render_plasma_data(0.25,0.15,7,2,1,0)
.segment PLASMA_DATA_LL [start=$c000]
render_plasma_data(1,0.75,1,0,0,1)
.segment PLASMA_DATA_MM [start=$c000]
render_plasma_data(0.25,1,1,0,1,1) 
.segment PLASMA_DATA_NN [start=$c000]
render_plasma_data(0.5, 1,1,0,2,1)
.segment PLASMA_DATA_OO [start=$c000]
render_plasma_data(0.5, 0.5,1,2,254,1)
.segment PLASMA_DATA_PP [start=$c000]
render_plasma_data(0.5, 0.5, 1,128,0,1)
.segment PLASMA_DATA_QQ [start=$c000]
render_plasma_data(0.25, 0.25, 1,3,3,1)
.segment PLASMA_DATA_RR [start=$c000]
render_plasma_data(0.1, 0.1, 1,10,0,1)
.segment PLASMA_DATA_SS [start=$c000]
render_plasma_data(0.75, 0.25, 1,0,0,1)
.segment PLASMA_DATA_TT [start=$c000]
render_plasma_data(1, 0.25, 0,1,1,0)
.segment PLASMA_DATA_UU [start=$c000]
render_plasma_data(0.25, 0.4, 5,4,3,2)
.segment PLASMA_DATA_VV [start=$c000]
render_plasma_data(0.5, 0.5, 1,0,2,1)
.segment PLASMA_DATA_WW [start=$c000]
render_plasma_data(0.6, 0.5, 1,2,4,1)
.segment PLASMA_DATA_XX [start=$c000]
render_plasma_data(0.25, 0.3, 1,255,1,255)
.segment PLASMA_DATA_YY [start=$c000]
render_plasma_data(0.25, 0.4, 1,2,2,1)
.segment PLASMA_DATA_ZZ [start=$c000]
render_plasma_data(0.5, 0.5, 1,3,2,1)


