#Hackercat for if you have an active internet connection.

Function Hackercat
{
	Add-type -AssemblyName System.Windows.Forms
	Start-Process "http://giphy.com/gifs/cat-hacker-webs-o0vwzuFwCGAFO/fullscreen" -WindowStyle Maximized
	Start-Sleep 1
	[System.Windows.Forms.SendKeys]::SendWait("{F11}")

	$voice = New-Object -ComObject SAPI.SPVoice
	$voice.Rate =0


	Function Invoke-Speech
	{
		param([Parameter(ValueFromPipeline=$true)][string] $say)

		process
		{
			$voice.Speak($say) | out-null;
		}
	}

	new-alias -name out-voice -value invoke-speech;
	start-sleep 2
	for ($i=1; $i -le 10; $i++ ) {
	    "You have been hacked! Please call your I A M!" | out-voice #Change this to whatever you want
	    "Hacker Cat Strikes Again!!!!!" | out-voice #Change this to whatever you want
	    }
}

Write-Host "Deploying Hackercat!"
Hackercat
