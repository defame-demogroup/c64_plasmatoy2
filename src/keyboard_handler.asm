funcKeys:
	jsr ReadKeyboard
	bcs !NoValidInput+
	jmp !skip+
!NoValidInput:
	lda #$00
	sta LAST_EVENT
	sta LAST_EVENT + 1
	sta LAST_EVENT + 2
	rts
!skip:
	cpx LAST_EVENT
	bne !skip+
	cpy LAST_EVENT + 1
	bne !skip+
	cmp LAST_EVENT + 2
	bne !skip+
	rts
!skip:
	stx LAST_EVENT
	sty LAST_EVENT + 1
	sta LAST_EVENT + 2
	cmp #$ff
	beq NoNewAphanumericKey
	cpy #$00
	bne !modifier+
	cmp #$31
	beq !c1+
	cmp #$32
	beq !c2+
	cmp #$33
	beq !c3+
	cmp #$34
	beq !c4+
	cmp #$35
	beq !c5+
	cmp #$36
	beq !c6+
	cmp #$37
	beq !c7+
	cmp #$38
	beq !c8+
	clc
	cmp #$01
	bcs !in_range+
	rts
!in_range:
	clc
	cmp #$1b
	bcc !in_range+
	rts
!in_range:
	jmp !load_preset+


	rts
!modifier:
	cmp #$31
	beq !c1n+
	cmp #$32
	beq !c2n+
	cmp #$33
	beq !c3n+
	cmp #$34
	beq !c4n+
	cmp #$35
	beq !c5n+
	cmp #$36
	beq !c6n+
	cmp #$37
	beq !c7n+
	cmp #$38
	beq !c8n+
	rts
NoNewAphanumericKey:
	cpx #$10
	beq !f1+
	cpx #$20
	beq !f3+
	cpx #$40
	beq !f5+
	rts
!f1:jmp !f1+
!f3:jmp !f3+
!f5:jmp !f5+
!c1:jmp !c1+
!c2:jmp !c2+
!c3:jmp !c3+
!c4:jmp !c4+
!c5:jmp !c5+
!c6:jmp !c6+
!c7:jmp !c7+
!c8:jmp !c8+
!c1n:jmp !c1n+
!c2n:jmp !c2n+
!c3n:jmp !c3n+
!c4n:jmp !c4n+
!c5n:jmp !c5n+
!c6n:jmp !c6n+
!c7n:jmp !c7n+
!c8n:jmp !c8n+

/*
F1/F2 ZOOM
*/
!f1:
	cpy #$10
	beq !f2+
	inc D_ZOOM
	lda D_ZOOM
	cmp #$10
	bne !skip+
	lda #$0f
	sta D_ZOOM
!skip:
	ldx #<LABEL4
	ldy #>LABEL4
	jsr funcUpdateSettings
	lda D_ZOOM
	jsr funcDrawValue
	dec display_timer
	lda #$00
	rts
!f2:
	dec D_ZOOM
	lda D_ZOOM
	cmp #$ff
	bne !skip+
	lda #$00
	sta D_ZOOM
!skip:
	ldx #<LABEL4
	ldy #>LABEL4
	jsr funcUpdateSettings
	lda D_ZOOM
	jsr funcDrawValue
	dec display_timer
	lda #$00
	rts

/*
F3/F4 X-RESOLUTION
*/
!f3:
	cpy #$10
	beq !f4+
	inc D_X
	lda D_X
	cmp #$10
	bne !skip+
	lda #$0f
	sta D_X
!skip:
	ldx #<LABEL5
	ldy #>LABEL5
	jsr funcUpdateSettings
	lda D_X
	jsr funcDrawValue
	dec display_timer
	lda #$00
	rts
!f4:
	dec D_X
	lda D_X
	cmp #$ff
	bne !skip+
	lda #$00
	sta D_X
!skip:
	ldx #<LABEL5
	ldy #>LABEL5
	jsr funcUpdateSettings
	lda D_X
	jsr funcDrawValue
	dec display_timer
	lda #$00
	rts

/*
F5/F6 Y-RESOLUTION
*/
!f5:
	cpy #$10
	beq !f6+
	inc D_Y
	lda D_Y
	cmp #$10
	bne !skip+
	lda #$0f
	sta D_Y
!skip:
	ldx #<LABEL6
	ldy #>LABEL6
	jsr funcUpdateSettings
	lda D_Y
	jsr funcDrawValue
	dec display_timer
	lda #$00
	rts
!f6:
	dec D_Y
	lda D_Y
	cmp #$ff
	bne !skip+
	lda #$00
	sta D_Y
!skip:
	ldx #<LABEL6
	ldy #>LABEL6
	jsr funcUpdateSettings
	lda D_Y
	jsr funcDrawValue
	dec display_timer
	lda #$00
	rts


//----
!c1:
	inc D_COL1
	lda D_COL1
	cmp #$10
	bne !skip+
	lda #$0f
	sta D_COL1
!skip:
	ldx #<LABEL7
	ldy #>LABEL7
	jsr funcUpdateSettings
	lda D_COL1
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor
!c1n:
	dec D_COL1
	lda D_COL1
	cmp #$ff
	bne !skip+
	lda #$00
	sta D_COL1
!skip:
	ldx #<LABEL7
	ldy #>LABEL7
	jsr funcUpdateSettings
	lda D_COL1
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor

//----
!c2:
	inc D_COL2
	lda D_COL2
	cmp #$10
	bne !skip+
	lda #$0f
	sta D_COL2
!skip:
	ldx #<LABEL8
	ldy #>LABEL8
	jsr funcUpdateSettings
	lda D_COL2
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor
!c2n:
	dec D_COL2
	lda D_COL2
	cmp #$ff
	bne !skip+
	lda #$00
	sta D_COL2
!skip:
	ldx #<LABEL8
	ldy #>LABEL8
	jsr funcUpdateSettings
	lda D_COL2
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor

//----
!c3:
	inc D_COL3
	lda D_COL3
	cmp #$10
	bne !skip+
	lda #$0f
	sta D_COL3
!skip:
	ldx #<LABEL9
	ldy #>LABEL9
	jsr funcUpdateSettings
	lda D_COL3
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor
!c3n:
	dec D_COL3
	lda D_COL3
	cmp #$ff
	bne !skip+
	lda #$00
	sta D_COL3
!skip:
	ldx #<LABEL9
	ldy #>LABEL9
	jsr funcUpdateSettings
	lda D_COL3
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor

//----
!c4:
	inc D_COL4
	lda D_COL4
	cmp #$10
	bne !skip+
	lda #$0f
	sta D_COL4
!skip:
	ldx #<LABELA
	ldy #>LABELA
	jsr funcUpdateSettings
	lda D_COL4
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor
!c4n:
	dec D_COL4
	lda D_COL4
	cmp #$ff
	bne !skip+
	lda #$00
	sta D_COL4
!skip:
	ldx #<LABELA
	ldy #>LABELA
	jsr funcUpdateSettings
	lda D_COL4
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor

//----
!c5:
	inc D_COL5
	lda D_COL5
	cmp #$10
	bne !skip+
	lda #$0f
	sta D_COL5
!skip:
	ldx #<LABELB
	ldy #>LABELB
	jsr funcUpdateSettings
	lda D_COL5
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor
!c5n:
	dec D_COL5
	lda D_COL5
	cmp #$ff
	bne !skip+
	lda #$00
	sta D_COL5
!skip:
	ldx #<LABELB
	ldy #>LABELB
	jsr funcUpdateSettings
	lda D_COL5
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor

//----
!c6:
	inc D_COL6
	lda D_COL6
	cmp #$10
	bne !skip+
	lda #$0f
	sta D_COL6
!skip:
	ldx #<LABELC
	ldy #>LABELC
	jsr funcUpdateSettings
	lda D_COL6
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor
!c6n:
	dec D_COL6
	lda D_COL6
	cmp #$ff
	bne !skip+
	lda #$00
	sta D_COL6
!skip:
	ldx #<LABELC
	ldy #>LABELC
	jsr funcUpdateSettings
	lda D_COL6
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor

//----
!c7:
	inc D_COL7
	lda D_COL7
	cmp #$10
	bne !skip+
	lda #$0f
	sta D_COL7
!skip:
	ldx #<LABELD
	ldy #>LABELD
	jsr funcUpdateSettings
	lda D_COL7
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor
!c7n:
	dec D_COL7
	lda D_COL7
	cmp #$ff
	bne !skip+
	lda #$00
	sta D_COL7
!skip:
	ldx #<LABELD
	ldy #>LABELD
	jsr funcUpdateSettings
	lda D_COL7
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor

//----
!c8:
	inc D_COL8
	lda D_COL8
	cmp #$10
	bne !skip+
	lda #$0f
	sta D_COL8
!skip:
	ldx #<LABELE
	ldy #>LABELE
	jsr funcUpdateSettings
	lda D_COL8
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor
!c8n:
	dec D_COL8
	lda D_COL8
	cmp #$ff
	bne !skip+
	lda #$00
	sta D_COL8
!skip:
	ldx #<LABELE
	ldy #>LABELE
	jsr funcUpdateSettings
	lda D_COL8
	jsr funcDrawValue
	dec display_timer
	jmp funcSetPlasmaColor

//----
!load_preset:
	sta filename_a
	sta filename_b
	sta tmp_val
	ldx #<LABELF
	ldy #>LABELF
	jsr funcUpdateSettings
	lda tmp_val: #$00
	ldx #$02
	ldy #$01
	jsr funcDrawCharOnSprite
	dec display_timer
	lda #>plasmaSine
	sta address_hi
	lda #<plasmaSine
	sta address_lo
	lda #$02 //set pure loading flag 
	rts

LAST_EVENT:
.byte $00, $00, $00
