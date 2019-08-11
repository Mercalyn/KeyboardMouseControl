SetBatchLines, -1 ; script run as fast as allowed
setEnabled := true ; setEnabled true means the macro is active
shiftAmount := 119
normalAmount := 10

loop {
	if(setEnabled){
		; get mouse
		MouseGetPos, xpos, ypos
		
		; these guys allow simultaneous presses of two different keys
		rightAmount := xpos
		downAmount := ypos
		
		; Left
		if(GetKeyState("Left", "P")){
			rightAmount := xpos - normalAmount
			
			; shift
			if(GetKeyState("Shift", "P")){
				rightAmount := xpos - shiftAmount
			}
		}
		
		; Right
		if(GetKeyState("Right", "P")){
			rightAmount := xpos + normalAmount
			
			; shift
			if(GetKeyState("Shift", "P")){
				rightAmount := xpos + shiftAmount
			}
		}
		
		; Up
		if(GetKeyState("Up", "P")){
			downAmount := ypos - normalAmount
			
			; shift
			if(GetKeyState("Shift", "P")){
				downAmount := ypos - shiftAmount
			}
		}
		
		; Down
		if(GetKeyState("Down", "P")){
			downAmount := ypos + normalAmount
			
			; shift
			if(GetKeyState("Shift", "P")){
				downAmount := ypos + shiftAmount
			}
		}
		
		; actual mouse moves
		MouseMove, %rightAmount%, %downAmount%
		;msgbox, %xpos% . %rightAmount% . %setEnabled%
		
		
		; RClick
		if(GetKeyState("NumpadDot", "P")){
			send, {RButton}
		}
		
		; LClick
		if(GetKeyState("Numpad0", "P")){
			send, {LButton}
		}
		
		
		; disabling setEnabled
		if(GetKeyState("NumpadDiv", "P")){
			setEnabled := false
		}
	}
	else{
		; re-enabling setEnabled
		if(GetKeyState("NumpadMult", "P")){
			setEnabled := true
		}
	}
	
	; this amount of universal loop sleep doesnt seem too low
	sleep, 10
}

NumpadSub::exitapp

