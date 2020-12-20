plasmaSine:
{
    .var amplitude = 46
    .var frequency = 256
    table:
    .for (var j=0; j<256;j++) {
        .var o = amplitude+amplitude * sin(toRadians( 360/frequency * j))
        .if (o > 255) {
            .eval o = 255
        }
        .byte o
    }
}  

plasmaCos:
{
    .var amplitude = 34
    .var frequency = 128
    table:
    .for (var j=0; j<256;j++) {
        .var o = amplitude+amplitude * cos(toRadians( 360/frequency * j))
        .if (o > 255) {
            .eval o = 255
        }
        .byte o		
    }
}

plasmaColors:
{
pc1a:
	.fill $20, $0f
pc2:
	.fill $20, $06
	.fill $20, $06
pc3:
	.fill $20, $0e
	.fill $20, $0e
pc4:
	.fill $20, $04
	.fill $20, $04
pc1b:
	.fill $20, $0f
bg1:
	.byte $0a
bg2:
	.byte $0b
bg3:
	.byte $0c
bg4:
	.byte $0d
}

