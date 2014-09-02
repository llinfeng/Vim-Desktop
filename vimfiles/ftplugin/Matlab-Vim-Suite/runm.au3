; AutoIt v3 script to run a matlab m-file from an external text editor
; Version 4.0, 14 August 2011
; Friedrich Huebler, fhuebler@gmail.com, www.huebler.info

; Declare variables
Global $ini, $matlabpath, $matlabwin, $matlabcmd, $mfile, $clippause, $winpause, $keypause

; File locations
; Path to INI file
$ini = @ScriptDir & "\runm.ini"
; Path to matlab executable
$matlabpath = IniRead($ini, "matlab", "matlabpath", "C:\Program Files\MATLAB\R2014a\bin\matlab.exe")
; Title of matlab window
$matlabwin = IniRead($ini, "matlab", "matlabwin", "MATLAB R2014a")

; Keyboard shortcut for matlab command window
$matlabcmd = IniRead($ini, "matlab", "matlabcmd", "^)")

; Path to m-file that is passed to AutoIt
; Edit line to match editor used, if necessary
$mfile = $CmdLine[1]

; Delays
; Pause after copying of matlab commands to clipboard
$clippause = IniRead($ini, "Delays", "clippause", "100")
; Pause between window-related operations
$winpause = IniRead($ini, "Delays", "winpause", "200")
; Pause between keystrokes sent to matlab
$keypause = IniRead($ini, "Delays", "keypause", "1")

; Set WinWaitDelay and SendKeyDelay to speed up or slow down script
Opt("WinWaitDelay", $winpause)
Opt("SendKeyDelay", $keypause)

; If more than one matlab window is open, the window that was most recently active will be matched
Opt("WinTitleMatchMode", 2)

; Check if matlab is already open, start matlab if not
If WinExists($matlabwin) Then
  WinActivate($matlabwin)
  WinWaitActive($matlabwin)
  ; Activate matlab command window and select text (if any)
  Send($matlabcmd)
  Send("^a")
  ; Run saved m-file
  ; Double quotes around $dofile needed in case path contains blanks
  ;ClipPut("run " & '(' & ' '  & $mfile& ' ')')
  ClipPut("run " & "('" & $mfile & "')" )
  
  ; TODO: I may need to change this. 
  ; Pause avoids problem with clipboard, may be AutoIt or Windows bug
  Sleep($clippause)
  Send("^v" & "{Enter}")
Else
  Run($matlabpath)
  WinWaitActive($matlabwin)
  ; Activate matlab command window
  Send($matlabcmd)
  ; Run saved m-file
  ; Double quotes around $dofile needed in case path contains blanks

  ClipPut("run " & "('" & $mfile & "')" )
  ; TODO: I may need to change this. 

  ; Pause avoids problem with clipboard, may be AutoIt or Windows bug
  Sleep($clippause)
  Send("^v" & "{Enter}")
EndIf

; End of script
