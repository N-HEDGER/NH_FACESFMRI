 delete(instrfindall)
 s2 = serial('COM4');
 s2.BaudRate=57600;
 s2.DataBits=8;
 s2.StopBits=1; 
 s2.parity='none';
 s2.Terminator='LF';
 s2.Timeout=100;
