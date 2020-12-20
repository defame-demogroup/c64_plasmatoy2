.macro LoadMCSpritesFromPicture( filename, bgcolor, color0, color1, color2 ) {

    .var picture  = LoadPicture( filename, List().add(bgcolor, color0, color1, color2) )
    .var xsprites = floor( picture.width  / [ 3 * 8 ] )
    .var ysprites = floor( picture.height / 21 )

    .for (var ysprite = 0; ysprite < ysprites; ysprite++) {
        .for (var xsprite = 0; xsprite < xsprites; xsprite++) {
            .for (var i = 0; i < [3 * 21]; i++) {
                .byte picture.getMulticolorByte(
                    [[xsprite * 3]  + mod(i, 3)],
                    [[ysprite * 21] + floor(i / 3)]
                )
            }
            .byte 0
        }
    }
}

.macro LoadHiresCharsFromPicture(filename, numberOfChars , bgcolor, color0) {
	.var charsetPic = LoadPicture(filename, List().add(bgcolor, color0))
	.for ( var x = 0 ; x < numberOfChars ; x++) {
		.for( var y = 0; y < 8; y++) {
			.byte charsetPic.getSinglecolorByte(x,y)
		}
	}
}

.macro toBytes( items ) {
	.for (var i = 0 ; i < items.size() ; i++) {
		.byte items.get(i)
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

.macro render_plasma_colors(col1, col2, col3, col4, col5, col6, col7, col8){
		pc1a:
			.fill $20, col1
		pc2:
			.fill $40, col2
		pc3:
			.fill $40, col3
		pc4:
			.fill $40, col4
		pc1b:
			.fill $20, col1
		bg1:
			.byte col5
		bg2:
			.byte col6
		bg3:
			.byte col7
		bg4:
			.byte col8
}