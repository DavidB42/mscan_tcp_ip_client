Dim autoHelper1
set autoHelper1 = CreateObject("MscanHelper2.AutomationHelper1")

Dim sout
set sout = WScript.StdOut

if autoHelper1 is nothing then
	sout.WriteLine "helper not found"
else
      sout.WriteLine "helper initialized"  
  
      autoHelper1.ImageHeight = 2 ' UBound(frameData, 1) - LBound(frameData, 1) + 1          
      autoHelper1.ImageWidth  = 2 ' UBound(frameData, 2) - LBound(frameData, 2) + 1 
      Dim x
      autoHelper1.InitStreamData()

end if

Dim y, counter
counter = 0

WScript.Sleep(10000)
Do while counter < 20
autoHelper1.SendFrame(2)
WScript.Sleep(500)
sout.WriteLine "send round: " & counter
counter = counter + 1
Loop

autoHelper1.EndStreamData()


