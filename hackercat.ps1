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
Function Invoke-Hackercat
{
    Add-type -AssemblyName System.Windows.Forms
    start-process "http://giphy.com/gifs/cat-hacker-webs-o0vwzuFwCGAFO/fullscreen" -WindowStyle Maximized
#    Start-BitsTransfer -Source "http://ENTER_IP_HERE/hax.html" -Destination "hax.html"
#    Start-BitsTransfer -Source "http://ENTER_IP_HERE/meow.gif" -Destination "meow.gif"
    start-process "hax.html" -WindowStyle Maximized
    start-sleep 1
    [System.Windows.Forms.SendKeys]::SendWait("{F11}")

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
    "You have been hacked! Please call your I A M!" | out-voice
    "Hacker Cat Strikes Again!!!!!" | out-voice
    }

}

Invoke-Hackercat
