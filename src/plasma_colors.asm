plasmaColors:
{
pc1a:
	.fill $20, $0e
pc2:
	.fill $20, $06
	.fill $20, $06
pc3:
	.fill $20, $0e
	.fill $20, $0e
pc4:
	.fill $20, $06
	.fill $20, $06
pc1b:
	.fill $20, $0e
bg1:
	.byte $00
bg2:
	.byte $00
bg3:
	.byte $00
bg4:
	.byte $00
}

.marco(col1, col2, col3, col4, col5, col6, col7, col8){
	plasmaColors:
	{
		pc1a:
			.fill $20, col1
		pc2:
			.fill $20, col2
			.fill $20, col2
		pc3:
			.fill $20, col3
			.fill $20, col3
		pc4:
			.fill $20, col4
			.fill $20, col4
		pc1b:
			.fill $20, $col1
		bg1:
			.byte col5
		bg2:
			.byte col6
		bg3:
			.byte col7
		bg4:
			.byte col8
	}

}