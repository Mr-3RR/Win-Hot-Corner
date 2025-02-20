#Persistent
SetTimer, CheckMousePosition, 100
isTaskViewOpened := false ; Flag to track if Task View was already opened
return

CheckMousePosition:
CoordMode, Mouse, Screen
MouseGetPos, xpos, ypos

; Check if mouse is in the top-left corner
if (xpos <= 20 && ypos <= 20)
{
    ; Check if Task View is not opened yet
    if (!isTaskViewOpened)
    {
        ; Send Ctrl + Win + Tab to open Task View
        SendInput, ^{LWin down}{Tab}{LWin up}
        isTaskViewOpened := true ; Set flag to prevent repeat
    }
}
else
{
    ; Detect if Task View is closed (when the mouse leaves the top-left corner area)
    if (isTaskViewOpened)
    {
        ; Check if Task View has been closed by monitoring the active window title
        if !WinExist("ahk_class TaskViewWnd")
        {
            isTaskViewOpened := false ; Reset the flag to allow Task View to open again
        }
    }
}
return
