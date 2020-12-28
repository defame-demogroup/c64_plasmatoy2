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

/*
mix a + mix b = 2, so to reduce one, increase the other 
*/
.macro render_plasma_data(x_amp, y_amp, xa_freq,  xb_freq, ya_freq, yb_freq){
//, col1, col2, col3, col4, col5, col6, col7, col8){
    .align $100
    .for (var j=0; j<256;j++) {
        .var d = 128 * x_amp
        .var a = 1
        .var b = 1
        .if(xa_freq > 0){
            .eval a = sin(toRadians( 360/(256/xa_freq) * j))
        }
        .if(xb_freq > 0){
            .eval b = cos(toRadians( 360/(256/xb_freq) * j))
        }
        .var c = d + (d * a * b)
        .if(c > 255){
            .eval c = 255
        }
        .byte c
    }

    .align $100
    .for (var j=0; j<256;j++) {
        .var d = 128 * y_amp
        .var a = 1
        .var b = 1
        .if(ya_freq > 0){
            .eval a = sin(toRadians( 360/(256/ya_freq) * j))
        }
        .if(yb_freq > 0){
            .eval b = cos(toRadians( 360/(256/yb_freq) * j))
        }
        .var c = d + (d * a * b)
        .if(c > 255){
            .eval c = 255
        }
        .byte c
    }
    // .align $100
    // .fill $20, col1
    // .fill $40, col2
    // .fill $40, col3
    // .fill $40, col4
    // .fill $20, col1
    // .byte col1
    // .byte col2
    // .byte col3
    // .byte col4
    // .byte col5
    // .byte col6
    // .byte col7
    // .byte col8
}
