.pc=* "SPRITE SCROLL"
.var spriteyoff=12

CHRBUF:
.fill $08, $00
CHRCNT:
.byte $00

funcScrollSprite:
	.for(var y=1;y<7;y++){
		asl CHRBUF + y
		.for(var i=7;i>=0;i--){
			.for(var x=2;x>=0;x--){
				rol $3100 + (i * $40) + ((y+spriteyoff) * 3) + x
			}
		}
	}
	ldx CHRCNT
	inx
	stx CHRCNT
	rts

funcScrollSpriteNewChar:
	ldx CHRCNT
	cpx #$08
	beq !newChar+
	rts
!newChar:
	lda #$00
	sta CHRCNT
	lda #$00
	sta ScrollOffsetHi
	lda scrollptr: SCROLLTEXT
	sta endprt
	cmp #$ff //end marker
	bne !skip+
	lda #$20 //space char
!skip:
	asl 
	rol ScrollOffsetHi
	asl
	rol ScrollOffsetHi
	asl
	rol ScrollOffsetHi
	sta scrollFontLo
	clc
	lda ScrollOffsetHi: #$00
	adc #>SPRFONT
	sta scrollFontHi
	ldy #$00
	ldx #$00
!loop:
	lda (scrollFontLo),y
	sta CHRBUF,x
	inx
	iny
	cpy #$07
	bne !loop-
	inc scrollptr
	bne !skip+
	inc scrollptr + 1
!skip:
	lda endprt: #$00
	cmp #$ff
	bne !skip+
	lda #>SCROLLTEXT
	sta scrollptr + 1
	lda #<SCROLLTEXT
	sta scrollptr
!skip:
	rts

SCROLLTEXT:
.text "welcome back! after a couple of years its time for version 2 of plasmatoy..."
.text " f1/f2 to change the zoom, f3/f4 to change x speed, f5/f6 to change y speed -"
.text " use number keys 1-8 to change plasma colors - use letters a-z to load plasma presets. "
.text " credits: code started by zig and voltage of defame during syntax party 2020. "
.text " and continued over the following weeks when zig had a minute or"
.text " needed to hide from too much human contact during christmas."
.text " music is 'run mild' by coax of topaz beerline. one of my all time favorite songs... "
.text " ...if you would like to swap, send an email to: joe@pixolut.com ...virtual stamps back."
.text "... aussie greets need to go out to these legends: "
.text "chrome, "
.text "disaster area, "
.text "digital access, "
.text "cygnus oz, "
.text "duck and chicken, "
.text "ikon visual, "
.text "jimage, "
.text "the force, "
.text "desire, "
.text "0f.digital, "
.text "aday, "
.text "onslaught, "
.text " ...and the international greets on behalf of the rest of the defame crew..."
.text "abyss connection, "
.text "amnesty, "
.text "artstate, "
.text "arise, "
.text "arsenic, "
.text "atlantis, "
.text "artline designs, "
.text "bonzai, "
.text "booze, "
.text "camelot, "
.text "censor, "
.text "chorus, "
.text "cosine, "
.text "crest, "
.text "dekadence, "
.text "digital excess, "
.text "delysid, "
.text "elysium, "
.text "excess, "
.text "extend, "
.text "exon, "
.text "fairlight, "
.text "focus, "
.text "fossil, "
.text "genesis-project, "
.text "hitmen, "
.text "hack n' trade, "
.text "hoaxers, "
.text "hokuto force, "
.text "laxity, "
.text "lepsi developments, "
.text "level 64, "
.text "maniacs of noise, "
.text "multistyle labs, "
.text "mayday, "
.text "noice, "
.text "nah kolor, "
.text "nostalgia, "
.text "offence, "
.text "origo dreamline, "
.text "oxyron, "
.text "padua, "
.text "panda design, "
.text "pegboard nerds, "
.text "plush, "
.text "prosonix, "
.text "resource, "
.text "role, "
.text "samar, "
.text "shape, "
.text "success + trc, "
.text "svenonacid, "
.text "the dreams, "
.text "the solution, "
.text "triad, "
.text "trsi, "
.text "vibrants, "
.text "vision, "
.text "viruz, "
.text "wrath, "
.text "x-ample ...    "
.text " thats a wrap!                              "
.byte $ff
