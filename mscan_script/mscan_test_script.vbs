Dim autoHelper1
set autoHelper1 = CreateObject("MscanHelper2.AutomationHelper1")

Dim sout
set sout = WScript.StdOut

if autoHelper1 is nothing then
	sout.Write "helper not found"
else
      sout.Write "helper initialized"  
  
      autoHelper1.ImageHeight = 2 ' UBound(frameData, 1) - LBound(frameData, 1) + 1          
      autoHelper1.ImageWidth  = 2 ' UBound(frameData, 2) - LBound(frameData, 2) + 1 
      Dim x
      x = autoHelper1.InitStreamData()

      sout.Write "further steps..."
end if

Dim y

WScript.Sleep(10000)
sout.Write "sendFrame..."
Do while True
y = autoHelper1.SendFrame(2)
WScript.Sleep(500)
Loop




