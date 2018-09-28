#CommentFlag //
// Recreating a german MacOS keyboard layout for Windows

ScriptEnabled := true

// Flag to mark whether a Mac or Windows keyboard is used
MacKeyboard := false

LShift & RShift::
ScriptEnabled := !ScriptEnabled
if (ScriptEnabled) {
	MsgBox, Mac layout enabled.
} else {
	MsgBox, Mac layout disabled.
}
return

RShift & Enter::
if (ScriptEnabled) {
	MacKeyboard := !MacKeyboard
	if (MacKeyboard) {
		MsgBox, Mac keyboard is ON.
	} else {
		MsgBox, Mac keyboard is OFF.
	}
}
return

// ----------------------------------------------------------------
// Mac keyboard
// ----------------------------------------------------------------

// Browser-specific stuff
#If ScriptEnabled and MacKeyboard and (WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe firefox.exe"))
#l::SendInput ^l
#w::SendInput ^w
#t::SendInput ^t
#+t::SendInput ^+t
#r::SendInput ^r
#+r::SendInput ^+r
#!i::SendInput ^+i
#!u::SendInput ^u
#If

// Generic hotkeys
#If ScriptEnabled and MacKeyboard
RAlt::LAlt
// Keys for < and ^ are seemingly switched on Mac keyboard
<::^
^::<

// CMD-Space
#Space::
KeyWait LWin
KeyWait Space
SendInput, {LWin down}
SendInput, {LWin up}
return

// CMD-Tab
LWin & Tab::AltTab
// unfortunately, it is not possible to have three keys reverse AltTab in AHK, leaving it out for now

// Standard combinations using CMD
// Cut, copy, paste, select
#x::SendInput ^x
#c::SendInput ^c
#v::SendInput ^v
#a::SendInput ^a

// Search
#f::SendInput ^f

// Save
#s::SendInput ^s

// Undo, redo
#z::SendInput ^z
#+z::SendInput ^+z

// Print
#p::SendInput ^p

// Close window
#q::SendInput !{F4}

// Text navigation
// CMD/CMD+Shift + Left/Right
#Left::
SendInput {Home}
return

#Right::
SendInput {End}
return

#+Left::
SendInput +{Home}
return

#+Right::
SendInput +{End}
return

// Alt/Alt+Shift + Left/Right
!Left::
SendInput ^{Left}
return

!Right::
SendInput ^{Right}
return

!+Left::
SendInput ^+{Left}
return

!+Right::
SendInput ^+{Right}
return

// Alt-modified keys, top to bottom
!<::SendInput {U+201E}
!1::SendInput {U+A1}
!2::SendInput {U+201C}
!3::SendInput {U+B6}
!4::SendInput {U+A2}
!5::SendInput {U+5B}
!6::SendInput {U+5D}
!7::SendInput {U+7C}
!8::SendInput {U+7B}
!9::SendInput {U+7D}
!0::SendInput {U+2260}
!ß::SendInput {U+BF}
!´::SendInput {U+27}

!q::SendInput {U+AB}
!w::SendInput {U+2211}
!e::SendInput {U+20AC}
!r::SendInput {U+AE}
!t::SendInput {U+2020}
!z::SendInput {U+3A9}
!u::SendInput {U+A8}
!i::SendInput {U+2044}
!o::SendInput {U+F8}
!p::SendInput {U+3C0}
!ü::SendInput {U+2022}
!+::SendInput {U+B1}

!a::SendInput {U+E5}
!s::SendInput {U+201A}
!d::SendInput {U+2202}
!f::SendInput {U+192}
!g::SendInput {U+A9}
!h::SendInput {U+AA}
!j::SendInput {U+BA}
!k::SendInput {U+2206}
!l::SendInput {U+40}
!ö::SendInput {U+153}
!ä::SendInput {U+E6}
!#::SendInput {U+2018}

!^::SendInput {U+2264}
!y::SendInput {U+A5}
!x::SendInput {U+2248}
!c::SendInput {U+E7}
!v::SendInput {U+221A}
!b::SendInput {U+222B}
!n::SendInput {U+7E}
!m::SendInput {U+B5}
!,::SendInput {U+221E}
!.::SendInput {U+2026}
!-::SendInput {U+2013}

// Alt-Shift modified keys, top to bottom
!+<::SendInput {U+201C}
!+1::SendInput {U+AC}
!+2::SendInput {U+201D}
!+3::SendInput {U+23}
!+4::SendInput {U+A3}
!+5::SendInput {U+FB01}
!+6::SendInput {U+5E}
!+7::SendInput {U+5C}
!+8::SendInput {U+2DC}
!+9::SendInput {U+B7}
!+0::SendInput {U+AF}
!+ß::SendInput {U+2D9}
!+´::SendInput {U+2DA}

!+q::SendInput {U+BB}
!+w::SendInput {U+201E}
!+e::SendInput {U+2030}
!+r::SendInput {U+B8}
!+t::SendInput {U+2DD}
!+z::SendInput {U+2C7}
!+u::SendInput {U+C1}
!+i::SendInput {U+DB}
!+o::SendInput {U+D8}
!+p::SendInput {U+220F}
!+ü::SendInput {U+B0}

!+a::SendInput {U+C5}
!+s::SendInput {U+CD}
!+d::SendInput {U+2122}
!+f::SendInput {U+CF}
!+g::SendInput {U+CC}
!+h::SendInput {U+D3}
!+j::SendInput {U+131}
!+k::SendInput {U+2C6}
!+l::SendInput {U+FB02}
!+ö::SendInput {U+152}
!+ä::SendInput {U+C6}
!+#::SendInput {U+2019}

!+^::SendInput {U+2265}
!+y::SendInput {U+2021}
!+x::SendInput {U+D9}
!+c::SendInput {U+C7}
!+v::SendInput {U+25CA}
!+b::SendInput {U+2039}
!+n::SendInput {U+203A}
!+m::SendInput {U+2D8}
!+,::SendInput {U+2DB}
!+.::SendInput {U+F7}
!+-::SendInput {U+2014}

#If

// ----------------------------------------------------------------
// Windows keyboard
// ----------------------------------------------------------------

// Browser-specific stuff
#If ScriptEnabled and !MacKeyboard and (WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe firefox.exe"))
!l::SendInput ^l
^!l::SendInput ^l
!w::SendInput ^w
!t::SendInput ^t
!+t::SendInput ^+t
!r::SendInput ^r
!+r::SendInput ^+r
#!i::SendInput ^+i
#!u::SendInput ^u
#If

// Generic hotkeys
#If ScriptEnabled and !MacKeyboard
// Using right CTRL as secondary "Alt"/"Windows"
RCtrl::LWin

// CMD-Space
!Space::
KeyWait Alt
SendInput, {LWin down}
SendInput, {LWin up}
return

// Open explorer via CMD+E
!e::SendInput #e

// Standard combinations using CMD
// Cut, copy, paste, select
!x::SendInput ^x
!c::SendInput ^c
!v::SendInput ^v
!a::SendInput ^a

// Search
!f::SendInput ^f

// Save
!s::SendInput ^s

// Undo, redo
!z::SendInput ^z
!+z::SendInput ^+z

// Print
!p::SendInput ^p

// Close window
!q::SendInput !{F4}

// Text navigation
// CMD/CMD+Shift + Left/Right
!Left::
SendInput {Home}
return

!Right::
SendInput {End}
return

!+Left::
SendInput +{Home}
return

!+Right::
SendInput +{End}
return

// Alt/Alt+Shift + Left/Right
#Left::
SendInput ^{Left}
return

#Right::
SendInput ^{Right}
return

#+Left::
SendInput ^+{Left}
return

#+Right::
SendInput ^+{Right}
return

// Alt-modified keys, top to bottom
#^::SendInput {U+201E}
#1::SendInput {U+A1}
#2::SendInput {U+201C}
#3::SendInput {U+B6}
#4::SendInput {U+A2}
#5::SendInput {U+5B}
#6::SendInput {U+5D}
#7::SendInput {U+7C}
#8::SendInput {U+7B}
#9::SendInput {U+7D}
#0::SendInput {U+2260}
#ß::SendInput {U+BF}
#´::SendInput {U+27}

#q::SendInput {U+AB}
#w::SendInput {U+2211}
#e::SendInput {U+20AC}
#r::SendInput {U+AE}
#t::SendInput {U+2020}
#z::SendInput {U+3A9}
#u::SendInput {U+A8}
#i::SendInput {U+2044}
#o::SendInput {U+F8}
#p::SendInput {U+3C0}
#ü::SendInput {U+2022}
#+::SendInput {U+B1}

#a::SendInput {U+E5}
#s::SendInput {U+201A}
#d::SendInput {U+2202}
#f::SendInput {U+192}
#g::SendInput {U+A9}
#h::SendInput {U+AA}
#j::SendInput {U+BA}
#k::SendInput {U+2206}
#l::SendInput {U+40}
#ö::SendInput {U+153}
#ä::SendInput {U+E6}
##::SendInput {U+2018}

#<::SendInput {U+2264}
#y::SendInput {U+A5}
#x::SendInput {U+2248}
#c::SendInput {U+E7}
#v::SendInput {U+221A}
#b::SendInput {U+222B}
#n::SendInput {U+7E}
#m::SendInput {U+B5}
#,::SendInput {U+221E}
#.::SendInput {U+2026}
#-::SendInput {U+2013}

// Alt-Shift modified keys, top to bottom
#+^::SendInput {U+201C}
#+1::SendInput {U+AC}
#+2::SendInput {U+201D}
#+3::SendInput {U+23}
#+4::SendInput {U+A3}
#+5::SendInput {U+FB01}
#+6::SendInput {U+5E}
#+7::SendInput {U+5C}
#+8::SendInput {U+2DC}
#+9::SendInput {U+B7}
#+0::SendInput {U+AF}
#+ß::SendInput {U+2D9}
#+´::SendInput {U+2DA}

#+q::SendInput {U+BB}
#+w::SendInput {U+201E}
#+e::SendInput {U+2030}
#+r::SendInput {U+B8}
#+t::SendInput {U+2DD}
#+z::SendInput {U+2C7}
#+u::SendInput {U+C1}
#+i::SendInput {U+DB}
#+o::SendInput {U+D8}
#+p::SendInput {U+220F}
#+ü::SendInput {U+B0}

#+a::SendInput {U+C5}
#+s::SendInput {U+CD}
#+d::SendInput {U+2122}
#+f::SendInput {U+CF}
#+g::SendInput {U+CC}
#+h::SendInput {U+D3}
#+j::SendInput {U+131}
#+k::SendInput {U+2C6}
#+l::SendInput {U+FB02}
#+ö::SendInput {U+152}
#+ä::SendInput {U+C6}
#+#::SendInput {U+2019}

#+<::SendInput {U+2265}
#+y::SendInput {U+2021}
#+x::SendInput {U+D9}
#+c::SendInput {U+C7}
#+v::SendInput {U+25CA}
#+b::SendInput {U+2039}
#+n::SendInput {U+203A}
#+m::SendInput {U+2D8}
#+,::SendInput {U+2DB}
#+.::SendInput {U+F7}
#+-::SendInput {U+2014}

#If