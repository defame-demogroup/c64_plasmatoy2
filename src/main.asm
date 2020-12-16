
/*
  $0801-$080d Basic Upstart Program
  $1000-$1c7f Music
  $2000-$27ff PLASMA CHARSET
  $3100-$32ff SPRITES
  $3300-$34fe SPRITE FONT DATA
  $4000-$40c8 Main Program
  $40c9-$486c SPRITE SCROLL
  $486d-$b1ff PLASMA CODE
  $b200-$be01 PLASMA_TABLES
  $be02-$be0d DATA PAYLOAD
  $be0e-$c014 Keyboard Scan Routine
  $c015-$c250 SPRITE CHAR PLOTTER
*/
.var offset1 = $4c
.var offset2 = $4d
.var offset3 = $4e

.segmentdef BASIC [modify="BasicUpstart", _start=$4000]
.segmentdef MAIN [start=$4000]
.segmentdef MUSIC [start=$1000]
.segmentdef PLASMA_CHARS [start=$2000]
.segmentdef SPRITES [start=$2800]
.segmentdef PLASMA_TABLES [start=$c000]
.segmentdef PLASMA_COLORS [start=$c200]
.segmentdef LOADING_SCREEN [start=$3400]
.segmentdef LOADER [start=$cc00]



.import source "macros.asm"

/*
Parameters
*/
.var scrollYOffset = 8
.var scrollFgColor = $40
.var scrollBgColor = $80
/*
ZEROPAGE
*/
.var scrollTextPointer = $c0
.var scrollBytePointer = $c1
.var scrollFontLo = $c2
.var scrollFontHi = $c3
.var bufA = $0400
.var mapA = %00011000
.var music = LoadSid("rsrc/Run-Mild.sid")

//todo: shrink this!
.macro shadow_zp(){
	ldx #$f0
!loop:
	lda $00,x
	sta $2a00,x
	lda $2b00,x
	sta $00,x
	inx
	cpx #$00
	bne !loop-
}

.macro unshadow_zp(){
	ldx #$f0
!loop:
	lda $00,x
	sta $2b00,x
	lda $2a00,x
	sta $00,x
	inx
	cpx #$00
	bne !loop-
}

.segment BASIC
.pc =$0801 "Basic Upstart Program"
//:BasicUpstart(start)

//---------------------------------------------------------
.segment MAIN
.pc = $4000 "Main Program"
start:
			.for(var i=0;i<8;i++){
				lda #($c4 + i)
				sta $0800-$08 + i
			}	
			jsr $cc00
			lda #$ff
			sta $d015
			lda #$01
			sta $d001
			sta $d003
			sta $d005
			sta $d007
			sta $d009
			sta $d00b
			sta $d00d
			sta $d00f
			lda #$00
			sta $d020
			sta $d021
			sta $d017
			sta $d01c
			lda #$ff
			sta $d01d
			lda #$ff
			sta $39ff
			lda #$01
			sta $d027
			sta $d028
			sta $d029
			sta $d02a
			sta $d02b
			sta $d02c
			sta $d02d
			sta $d02e			
			lda $dd00
			and #%11111100
			ora #%00000011 
			sta $dd00			
			lda #mapA
			sta $d018
			lda #$08
			sta $d016

			sei
			lda #%00110110	// Disable KERNAL and BASIC ROM and enable cass. motor
			sta $01
			jsr initPlasma
			shadow_zp()
			ldx #$00
			ldy #$00
			lda #$00
			jsr music.init
			unshadow_zp()
			//bank selection
			lda #$f0
			sta $d012
			lda #$81
			sta $d01a
			lda #%01011011
			sta $d011
			lda #<irq1
			sta $0314
			lda #>irq1
			sta $0315
			asl $d019
			lda #$7b
			sta $dc0d
			cli
			jsr funcDrawSettings
this:		
			jsr runPlasma 
			jsr funcKeys
			cmp #$00
			beq this
!next:		cmp #$01
			bne !next+
			jsr funcLoadFile
			jmp this
!next:		cmp #$02
			bne !next+
			jsr funcLoadFile
			jsr funcPostLoadPlasmaColor
!next:		
			jmp this


/*
draw loading screen
*/
funcLoadFile:
	ldx #$00
!loop:
	.for(var i=0;i<4;i++){
		sec
		lda bufA+(i*$100),x
		adc loading_overlay+(i*$100),x
		sta bufA+(i*$100),x
	}
	inx
	cpx #$00
	bne !loop-
	.for(var i=0;i<8;i++){
		lda #($c4 + i)
		sta $0800-$08 + i
	}
	ldx filename_a: #'0'
	ldy filename_b: #'1'
	lda address_hi: #$10
	sta $ff
	lda address_lo: #$00
	sta $fe
	jsr $cf00
	rts

funcPostLoadPlasmaColor:
	lda plasmaColors.bg1
	sta D_COL1
	sta $d021
	lda plasmaColors.bg2
	sta D_COL2
	sta $d022
	lda plasmaColors.bg3
	sta D_COL3
	sta $d023
	lda plasmaColors.bg4
	sta D_COL4
	sta $d024
	rts

funcSetPlasmaColor:
	lda D_COL1
	sta $d021
	lda D_COL2
	sta $d022
	lda D_COL3
	sta $d023
	lda D_COL4
	sta $d024
	lda D_COL5
	.for(var i=0;i<$20;i++){
		sta plasmaColors.pc1a + i
		sta plasmaColors.pc1b + i
	}
	lda D_COL6
	.for(var i=0;i<$40;i++){
		sta plasmaColors.pc2 + i
	}
	lda D_COL7
	.for(var i=0;i<$40;i++){
		sta plasmaColors.pc3 + i
	}
	lda D_COL7
	.for(var i=0;i<$40;i++){
		sta plasmaColors.pc4 + i
	}
	lda D_ZOOM
	sta offset1
	lda D_X
	sta offset2
	lda D_Y
	sta offset3	
	lda #$00 //return value
	rts

//---------------------------------------------------------
.import source "keyboard_handler.asm"
.import source "spritefade.asm"
.import source "spritescroller.asm"
.import source "Plasma.asm"
.import source "gui.input.keyboard_scan.asm"
.import source "spritechars.asm" 
//---------------------------------------------------------

irq1:  	
			asl $d019
			lda #%01011011
			sta $d011
!loop:
			lda $d012
			cmp #$fa
			bne !loop-
			lda #%01010011
			sta $d011

			lda #$ff
			sta $d015

			lda #$00
			sta $d01d
			.for(var i=0;i<8;i++){
				lda #$30 + (i*8*3)
				sta $d000 + (i*2)
			}
			lda #%00000000
			sta $d010
			jsr funcScrollSprite
			lda #$ff
			sta $d01d
			.for(var i=0;i<8;i++){
				lda #$10 + (i*16*3)
				sta $d000 + (i*2)
			}
			lda #%11100000
			sta $d010
			lda #$05
			sta $d027
			sta $d028
			sta $d029
			sta $d02a
			sta $d02b
			sta $d02c
			sta $d02d
			sta $d02e
			ldx #$00
			//todo: shadow zp for music
			shadow_zp()
			jsr music.play
			unshadow_zp()
			//todo: unshadow zp for music
			jsr funcScrollSpriteNewChar
			lda #$00
			sta $d015
			jsr funcFadeSprites
			jsr funcUpdateSpriteChars
			lda #$00
			sta $d017
			pla
			tay
			pla
			tax
			pla
			rti

funcUpdateSpriteChars:
	lda display_timer
	beq !skip+
	dec display_timer
	bne !skip+
	jsr funcResetSettings
!skip:
	rts

display_timer:
.byte $00

action_status:
.byte $00
/*
00=nothing
01=update colors
02=load from disk
*/

.pc=* "DATA PAYLOAD"
D_ZOOM:	.byte $01
D_X:	.byte $01
D_Y:	.byte $01
D_COL1:	.byte $08
D_COL2:	.byte $09
D_COL3:	.byte $0a
D_COL4:	.byte $0b
D_COL5:	.byte $0c
D_COL6:	.byte $0d
D_COL7:	.byte $0e
D_COL8:	.byte $0f
D_PRESET_MATH: .byte $00
D_PRESET_COLORS: .byte $00


MATH_PREFIX:
.text "0"
FILENAME:
.text "0123456789ABCDEF"
COLOR_PREFIX:
.text "1"



//Music	$1000-$2000
//---------------------------------------------------------
.segment MUSIC
.pc=music.location "Music"
.fill music.size, music.getData(i)

//Plasma Charset $2000-$2800
//---------------------------------------------------------
.segment PLASMA_CHARS
.pc = $2000 "PLASMA CHARSET"
.import source "PlasmaCharset.asm"

//Sprites and Sprite Charset $2800-$3000
//---------------------------------------------------------
.segment SPRITES
.pc=$2800
.align $100
.pc=* "SPRITE FONT DATA"
SPRFONT:
.import c64 "rsrc/delta.prg"
.pc=$3100 "SPRITES"
SPR:
.fill $40 * 8, $00

//Plasma Tables $2800-$3000
//---------------------------------------------------------
.segment PLASMA_TABLES
.import source "plasma_tables.asm"

.segment PLASMA_COLORS
.import source "plasma_colors.asm"

//LOADER $CC00
//---------------------------------------------------------
.segment LOADER
.pc=$cc00
.import c64 "rsrc/realloader.prg"

//LOADER SCREEN $3400
//---------------------------------------------------------
.segment LOADING_SCREEN
.import source "loading_screen.asm"
