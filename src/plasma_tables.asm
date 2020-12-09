.segment PLASMA_TABLES
plasmaSine:
{
    .var amplitude = 46
    .var frequency = 256
    table:
    .for (var j=0; j<256;j++) { 	
        .if (round(amplitude+amplitude * sin(toRadians( 360/frequency * j))) > 255) {
            .byte 255
        } else {
            .byte amplitude+amplitude * sin(toRadians( 360/frequency * j))		
        }	
    }
}  

plasmaCos:
{
    .var amplitude = 34
    .var frequency = 128
    table:
    .for (var j=0; j<256;j++) { 	
        .if (round(amplitude+amplitude * cos(toRadians( 360/frequency * j))) > 255) {
            .byte 255
        } else {
            .byte amplitude+amplitude * cos(toRadians( 360/frequency * j))
        }	
    }
}

.macro render_plasma_tables(sin_amp, sin_freq, cos_amp, cos_freq){
    plasmaSine:
    {
        .var amplitude = sin_amp
        .var frequency = sin_freq
        table:
        .for (var j=0; j<256;j++) { 	
            .if (round(amplitude+amplitude * sin(toRadians( 360/frequency * j))) > 255) {
                .byte 255
            } else {
                .byte amplitude+amplitude * sin(toRadians( 360/frequency * j))		
            }	
        }
    }  

    plasmaCos:
    {
        .var amplitude = cos_amp
        .var frequency = cos_freq
        table:
        .for (var j=0; j<256;j++) { 	
            .if (round(amplitude+amplitude * cos(toRadians( 360/frequency * j))) > 255) {
                .byte 255
            } else {
                .byte amplitude+amplitude * cos(toRadians( 360/frequency * j))
            }	
        }
    }
}

.segment PLASMA_TABLES1 [start=$c000]
render_plasma_tables(25,64,14,128)
.segment PLASMA_TABLES2 [start=$c000]
render_plasma_tables(46,255,34,128)
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
