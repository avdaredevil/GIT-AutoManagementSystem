<#
|==============================================================================>|
   Git-Hub Automatic Releaser by APoorv Verma [AP] on 4/22/2014
|==============================================================================>|
      $) Tracks changes and uploads latest versions of codes
      $) Auto-Creation and Hashing Rules in Place
      $) Keeps track of all code live, and allows for easy additions
      $) Very Efficient Code [O(1) Lookup Time]
      $) Highly Aware and First-Time Builder Git Initializer Method
      $) Automatically repairs broken [packages, config, hashes, files]
|==============================================================================>|
#>
param([Switch]$Rebuild, [Switch]$AcceptAll)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.0] To Make this program independent of AP-Core Engine
# ==================================================================================================================|
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gemlwLUFycmF5cyB7CnBhcmFtKCR4KQ0KDQogICAgaWYgKCR4LmNvdW50IC1sZSAxKSB7dGhyb3cgIltBUC1QeXRob25dIFppcCBhcmd1bWVudCAjMSBtdXN0IHN1cHBvcnQgaXRlcmF0aW9uIn0NCiAgICAkY250ID0gJHhbMF0uY291bnQNCiAgICAkeCB8ICUgeyRfLmNvdW50fSB8ICUge2lmICgkXyAtbHQgJGNudCkgeyRjbnQgPSAkX319DQogICAgJEFycmF5ID0gTmV3LU9iamVjdCBPYmplY3RbXVtdICRDbnQsJHguY291bnQNCiAgICAwLi4oJENudC0xKSB8ICUgew0KICAgICAgICAkaSA9ICRfDQogICAgICAgIDAuLigkeC5jb3VudC0xKSB8ICUgeyRBcnJheVskaV1bJF9dID0gJHhbJF9dWyRpXX0NCiAgICB9DQogICAgcmV0dXJuICRBcnJheQ0KfQoKZnVuY3Rpb24gSW52b2tlLVRlcm5hcnkgewpwYXJhbShbYm9vbF0kZGVjaWRlciwgW3NjcmlwdGJsb2NrXSRpZnRydWUsIFtzY3JpcHRibG9ja10kaWZmYWxzZSkNCg0KICAgIGlmICgkZGVjaWRlcikgeyAmJGlmdHJ1ZX0gZWxzZSB7ICYkaWZmYWxzZSB9DQp9CgpmdW5jdGlvbiBJbnB1dC1Qcm9tcHQgewpwYXJhbShbVmFsaWRhdGVOb3ROdWxsb3JFbXB0eSgpXVtTdHJpbmddJFByb21wdCA9ICJFbnRlciBUZXh0IDogIikNCg0KICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAkUHJvbXB0DQogICAgJFJlUmVnWCA9ICdbXlx4MDEtXHgwOFx4MTAtXHg4MF0rJyMnW15cd1wuXScgW9CQLdGP0IHRkV0NCiAgICAkVHJTdHJpbmcgPSAiIg0KICAgICRDdmlzID0gW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlDQogICAgW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlID0gJEZhbHNlDQogICAgJENvdW50ID0gMTskU2xlZXAgPSAwDQogICAgV2hpbGUgKCRUcnVlKSB7DQogICAgICAgIGlmICgkY291bnQgLWd0IDUwMCkgeyRTbGVlcCA9IDEwMH0NCiAgICAgICAgaWYgKCRIb3N0LlVJLlJhd1VJLktleUF2YWlsYWJsZSkgeyRTdG9yZSA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIkluY2x1ZGVLZXlVcCxOb0VjaG8iKTskQ291bnQ9MDskU2xlZXA9MH0gZWxzZSB7JENvdW50Kys7U3RhcnQtU2xlZXAgLW0gJFNsZWVwO2NvbnRpbnVlfQ0KICAgICAgICBpZiAoS2V5UHJlc3NlZCAifn5CYWNrU3BhY2V+fiIgJFN0b3JlKSB7aWYgKCRzdG9yZS5Db250cm9sS2V5U3RhdGUgLW1hdGNoICJjdHJsIikgeyRUclN0cmluZz0iIn0gZWxzZSB7JFRyU3RyaW5nID0gPzogKCRUclN0cmluZy5MZW5ndGggLWVxIDApeyIifXskVHJTdHJpbmcuc3Vic3RyaW5nKDAsJFRyU3RyaW5nLkxlbmd0aC0xKX19fQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+U3BhY2V+fiIgJFN0b3JlKSB7JFRyU3RyaW5nICs9ICIgIn0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+fkVzY2FwZX5+IiAkU3RvcmUpIHskVHJTdHJpbmc9IiI7YnJlYWt9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5FTlRFUn5+IiAkU3RvcmUpIHtXcml0ZS1Ib3N0ICIiO2JyZWFrfSBlbHNlIA0KICAgICAgICB7JFRyU3RyaW5nICs9ICRTdG9yZS5DaGFyYWN0ZXIgLXJlcGxhY2UgKCRSZVJlZ1gsJycpfQ0KICAgICAgICAkd3QgPSBbQ29uc29sZV06OkJ1ZmZlcldpZHRoIC0gJFByb21wdC5sZW5ndGggLSAxDQogICAgICAgIFtDb25zb2xlXTo6Q3Vyc29ybGVmdCA9ICRQcm9tcHQubGVuZ3RoDQogICAgICAgIGlmICgkd3QtJFRyU3RyaW5nLkxlbmd0aCAtbHQgMCkgew0KICAgICAgICAgICAgJHRiPSIiDQogICAgICAgICAgICAkdHQ9Ii4uLiIrJFRyU3RyaW5nLnN1YnN0cmluZygkVHJTdHJpbmcuTGVuZ3RoLSR3dCszKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgJHRiPSIgIiooJHd0LSRUclN0cmluZy5MZW5ndGgpDQogICAgICAgICAgICAkdHQ9JFRyU3RyaW5nDQogICAgICAgIH0NCiAgICAgICAgJGZjb2wgPSBbY29uc29sZV06OkZvcmVncm91bmRDb2xvcg0KICAgICAgICBXcml0ZS1ob3N0IC1ub25ld2xpbmUgLWYgJGZDb2wgJHR0JFRiDQogICAgfQ0KICAgIFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZSA9ICRDdmlzDQogICAgcmV0dXJuICRUUlN0cmluZw0KfQoKZnVuY3Rpb24gRmxhdHRlbiB7CnBhcmFtKFtvYmplY3RbXV0keCkNCmlmICgkWC5jb3VudCAtZXEgMSkge3JldHVybiAkeCB8ICUgeyRffX0gZWxzZSB7JHggfCAlIHtGbGF0dGVuICRffX19CgpmdW5jdGlvbiBHZXQtRmlsZUhhc2ggewpwYXJhbShbU3RyaW5nXSRGaWxlKQ0KDQogICAgaWYgKCEoVGVzdC1QYXRoIC10eXBlIGxlYWYgJEZpbGUpKSB7VGhyb3cgIkZpbGUgTm90IGZvdW5kIn0NCiAgICAkRmlsZSA9ICJ7MH0iIC1mIChSZXNvbHZlLVBhdGggJEZpbGUpDQogICAgJGEgPSBbU3lzdGVtLlNlY3VyaXR5LkNyeXB0b2dyYXBoeS5NRDVdOjpDcmVhdGUoKQ0KICAgICRIYXNoID0gJGEuQ29tcHV0ZUhhc2goW0lPLkZpbGVdOjpSZWFkQWxsQnl0ZXMoJEZpbGUpKSAtam9pbiAiOiINCiAgICAkYS5EaXNwb3NlKCkNCiAgICBSZXR1cm4gJEhhc2gNCn0KCmZ1bmN0aW9uIEFQLVJlcXVpcmUgewpwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW0FsaWFzKCJGdW5jdGlvbmFsaXR5IiwiTGlicmFyeSIpXVtTdHJpbmddJExpYiwgW1NjcmlwdEJsb2NrXSRPbkZhaWw9e30pDQoNCiAgICBbYm9vbF0kU3RhdCA9ICQoc3dpdGNoIC1yZWdleCAoJExpYi50cmltKCkpIHsNCiAgICAgICAgIkludGVybmV0IiAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1FcnJvckFjdGlvbiBTaWxlbnRseUNvbnRpbnVlfQ0KICAgICAgICAiZGVwOiguKikiICB7dHJ5IHsmICRNYXRjaGVzWzFdICIvZmpmZGpmZHMgLS1kc2phaGRocyAtZHNqYWRqIiAyPiRudWxsOyJTdWNjZXNzIn0gY2F0Y2gge319DQogICAgfSkNCiAgICBpZiAoISRTdGF0KSB7JE9uRmFpbC5JbnZva2UoKX0NCn0KCmZ1bmN0aW9uIFBhdXNlIHsKcGFyYW0oW1N0cmluZ10kUGF1c2VRID0gIlByZXNzIGFueSBrZXkgdG8gY29udGludWUgLiAuIC4gIikNCg0KICAgIFdyaXRlLUhvc3QgLW5vTmV3bGluZSAkUGF1c2VRDQogICAgJG51bGwgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJOb0VjaG8sIEluY2x1ZGVLZXl1cCIpDQogICAgV3JpdGUtSG9zdCAiIg0KfQoKZnVuY3Rpb24gV3JpdGUtQVAgewpwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kVGV4dCkNCg0KICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1tYXRjaCAiXltcK1wtXCFcKnhcPiBdKyQiKSB7cmV0dXJufQ0KICAgICRhY2MgID0gQCgoJysnLCcyJyksKCctJywnMTInKSwoJyEnLCcxNCcpLCgnKicsJzMnKSkNCiAgICAkdGIgICA9ICcnOyRmdW5jICAgPSAkZmFsc2UNCiAgICB3aGlsZSAoJFRleHQuY2hhcnMoMCkgLWVxICd4JykgeyRmdW5jID0gJHRydWU7ICRUZXh0ID0gJFRleHQuc3Vic3RyaW5nKDEpLnRyaW0oKX0NCiAgICB3aGlsZSAoJFRleHQuY2hhcnMoMCkgLWVxICc+JykgeyR0YiArPSAiICAgICI7ICRUZXh0ID0gJFRleHQuc3Vic3RyaW5nKDEpLnRyaW0oKX0NCiAgICAkU2lnbiA9ICRUZXh0LmNoYXJzKDApDQogICAgJFRleHQgPSAkVGV4dC5zdWJzdHJpbmcoMSkudHJpbSgpLnJlcGxhY2UoJy94XCcsJycpLnJlcGxhY2UoJ1suXScsJ1tDdXJyZW50IERpcmVjdG9yeV0nKQ0KICAgICR2ZXJzID0gJGZhbHNlDQogICAgZm9yZWFjaCAoJGFyIGluICRhY2MpIHtpZiAoJGFyWzBdIC1lcSAkc2lnbikgeyR2ZXJzID0gJHRydWU7ICRjbHIgPSAkYXJbMV07ICRTaWduID0gIlske1NpZ259XSAifX0NCiAgICBpZiAoISR2ZXJzKSB7VGhyb3cgIkluY29ycmVjdCBTaWduIFskU2lnbl0gUGFzc2VkISJ9DQogICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiRmdW5jIC1mICRjbHIgJHRiJFNpZ24kVGV4dA0KfQoKZnVuY3Rpb24gUHN3LVByb21wdCB7CnBhcmFtKFtBbGlhcygiUHJvbXB0IildW1N0cmluZ10kVGV4dCA9ICJFbnRlciBQYXNzd29yZCA6ICIsIFtTd2l0Y2hdJFNob3dNYXNrZWRQc3csIFtjaGFyXSRNYXNrPSLigKIiLCBbU3dpdGNoXSRGb3JjZVZhbGlkYXRpb24sIFtzY3JpcHRibG9ja10kVmFsaWRhdG9yPXszfSkNCg0KICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAkVGV4dA0KICAgICRSZVJlZ1ggPSAnW15ceDAxLVx4MDhceDEwLVx4ODBdKycjJ1teXHdcLl0nDQogICAgJFBzdyA9ICIiDQogICAgJEN2aXMgPSBbQ29uc29sZV06OkN1cnNvclZpc2libGUNCiAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkRmFsc2UNCiAgICBpZiAoISRTaG93TWFza2VkUHN3KSB7JFZhbGlkYXRvcj17M319DQogICAgJENvdW50ID0gMTskU2xlZXAgPSAwDQogICAgV2hpbGUgKCRUcnVlKSB7DQogICAgICAgIGlmICgkY291bnQgLWd0IDI1MCkgeyRTbGVlcCA9IDI1MH0NCiAgICAgICAgJFRlc3QgPSAmJFZhbGlkYXRvcg0KICAgICAgICBpZiAoJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlKSB7JFN0b3JlID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiSW5jbHVkZUtleVVwLE5vRWNobyIpOyRDb3VudD0wOyRTbGVlcD0wfSBlbHNlIHskQ291bnQrKztTdGFydC1TbGVlcCAtbSAkU2xlZXA7Y29udGludWV9DQogICAgICAgIGlmIChLZXlQcmVzc2VkICJ+fkJhY2tTcGFjZX5+IiAkU3RvcmUpIHtpZiAoJHN0b3JlLkNvbnRyb2xLZXlTdGF0ZSAtbWF0Y2ggImN0cmwiKSB7JFBzdz0iIn0gZWxzZSB7JFBzdyA9ID86ICgkUHN3Lkxlbmd0aCAtZXEgMCl7IiJ9eyRQc3cuc3Vic3RyaW5nKDAsJFBzdy5MZW5ndGgtMSl9fX0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+flNwYWNlfn4iICRTdG9yZSkgeyRQc3cgKz0gIiAifQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+RXNjYXBlfn4iICRTdG9yZSkgeyRwc3c9IiI7YnJlYWt9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5FTlRFUn5+IiAkU3RvcmUpIHtXcml0ZS1Ib3N0ICIiO2lmIChbaW50XSRUZXN0IC1uZSAzKSB7aWYgKCRUZXN0IC1vciAhJEZvcmNlVmFsaWRhdGlvbikge2JyZWFrfSBlbHNlIHtXcml0ZS1Ib3N0IC1mIFllbGxvdyAtTm9OZXdMaW5lICJNdXN0VHlwZSBpbiBhIHZhbGlkIFBhc3N3b3JkLi4uIjtzdGFydC1zbGVlcCAtcyAyO0NsZWFyLUxpbmU7W0NvbnNvbGVdOjpDdXJzb3JUb3AtPTF9fWVsc2V7YnJlYWt9fSBlbHNlIA0KICAgICAgICB7JFBzdyArPSAkU3RvcmUuQ2hhcmFjdGVyIC1yZXBsYWNlICgkUmVSZWdYLCcnKX0NCiAgICAgICAgaWYgKCRTaG93TWFza2VkUHN3KSB7DQogICAgICAgICAgICAkd3QgPSBbQ29uc29sZV06OkJ1ZmZlcldpZHRoIC0gJHRleHQubGVuZ3RoIC0gMQ0KICAgICAgICAgICAgJFRlc3QgPSAmJFZhbGlkYXRvcg0KICAgICAgICAgICAgW0NvbnNvbGVdOjpDdXJzb3JsZWZ0ID0gJHRleHQubGVuZ3RoDQogICAgICAgICAgICBpZiAoJHd0LSRQc3cuTGVuZ3RoIC1sdCAwKSB7JHRiPSIiOyR0dD0iJE1hc2siKigkd3QtMykrIi4uLiJ9IGVsc2UgeyR0Yj0iICIqKCR3dC0kUHN3Lkxlbmd0aCk7JHR0PSIkTWFzayIqJFBzdy5MZW5ndGh9DQogICAgICAgICAgICAkZmNvbCA9IFtjb25zb2xlXTo6Rm9yZWdyb3VuZENvbG9yDQogICAgICAgICAgICBpZiAoW2ludF0kVGVzdCAtbmUgMykgew0KICAgICAgICAgICAgICAgICRmQ29sID0gPzooJFRlc3QpIHsyfSB7InJlZCJ9DQogICAgICAgICAgICB9DQogICAgICAgICAgICBXcml0ZS1ob3N0IC1ub25ld2xpbmUgLWYgJGZDb2wgJHR0JHRiDQogICAgICAgIH0NCiAgICB9DQogICAgW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlID0gJEN2aXMNCiAgICByZXR1cm4gJHBzdw0KfQoKZnVuY3Rpb24gVGFiLVRleHQgewpwYXJhbShbU3RyaW5nXSRUZXh0LCBbaW50XSROdW1UYWJzPTEsIFtpbnRdJFRhYlNpemUgPSA0LCBbY2hhcl0kVGFiQ2hhciA9ICIgIikNCg0KICAgICRUYWIgPSAoIiRUYWJDaGFyIiokVGFiU2l6ZSkqJE51bVRhYnM7JGluZGV4PTANCiAgICAkV2luID0gW0NvbnNvbGVdOjpCdWZmZXJXaWR0aC0xOyRTdHIgPSAiIg0KICAgIGZvcmVhY2ggKCRjIGluICRUZXh0LlRvQ2hhckFycmF5KCkpIHsNCiAgICAgICAgaWYgKCEoJEluZGV4JSRXaW4pKSB7JFN0ciArPSAkVGFiOyRJbmRleCs9JFRhYi5MZW5ndGh9DQogICAgICAgICRTdHIgKz0gJGMNCiAgICAgICAgJGluZGV4KysNCiAgICB9DQogICAgcmV0dXJuICRTdHINCn0KCmZ1bmN0aW9uIEFzay1PRS1RU1ROIHsKcGFyYW0oJFEpDQoNCiAgICBMb2FkLUZvcm1zDQogICAgJEZvcm0uQ29udHJvbHMuRmluZCgiQW5zd2VyIiwkdHJ1ZSlbMF0udGV4dCA9ICIiDQogICAgJEZvcm0uQ29udHJvbHMuRmluZCgiUXVlc3Rpb24iLCR0cnVlKVswXS50ZXh0ID0gJFENCiAgICAkRm9ybS5TaG93RGlhbG9nKCkgfCBPdXQtTnVsbA0KICAgIHJldHVybiAkRm9ybS5Db250cm9scy5GaW5kKCJBbnN3ZXIiLCR0cnVlKVswXS50ZXh0DQp9CgpTZXQtQWxpYXMgPzogSW52b2tlLVRlcm5hcnk=")))
# ========================================END=OF=COMPILER===========================================================|
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
AP-Require "Internet" {Write-AP "!Need Internet To Function!";exit}
AP-Require "dep:git" {Write-AP "!Need Git Integrated To Function!";exit}
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$UserName = "avdaredevil@gmail.com"
$HashFile = "$PSHell\Git-Temp\Current-Versions.map"
$MapFile  = "$PSHell\Git-Temp\Git-Sources.map"
if ($Rebuild -and (Test-Path "$PSHell\Git-Temp\Current-Versions.map")) {Write-AP "!Rebuilding Git/AP Cache";del "$PSHell\Git-Temp\Current-Versions.map"}
"Git-Sources","Current-Versions" | ? {!(Test-Path -type Leaf "$PSHell\Git-Temp\$_.map")} | % {
    Write-AP "*Creating New [$_] File:"
    if ($_ -eq "Current-Versions") {
        "@ --------------------------------------------------------------------------|",
        "@    Version Tracking File for GitHub Projects in AP MGMT Console",
        "@ --------------------------------------------------------------------------|",
        "@  EXAMPLE:",
        "@  -------",
        "@   <FileName>|<HashOfSRCFile>",
        "@ --------------------------------------------------------------------------|" | Out-File -Encoding Default "$PSHell\Git-Temp\$_.map"
    } else {
        "@ --------------------------------------------------------------------------|",
        "@    Mapping File for GitHub Projects in AP MGMT Console",
        "@ --------------------------------------------------------------------------|",
        "@  EXAMPLE:",
        "@  -------",
        "@   [GitRemoteName]>[GitUser]/[GitRepo]|[Tool-Name]|[Srcs]->[TMPFolder]",
        "@ --------------------------------------------------------------------------|" | Out-File -Encoding Default "$PSHell\Git-Temp\$_.map"
    }
}
function Read-Maps {
    $index = 0;$Script:SrcMap = @{}
    [IO.File]::ReadAllLines($MapFile) | ? {$_[0] -ne "@"} | ? {$_ -match "(?<GitHub>[^\|]+)\|(?<Name>[^\|]+)\|(?<Sources>[^(\>)]+)\-\>(?<Dest>.*)"} | % {
        $Obj = @{"Name"  = $Matches.Name.trim()}
        $Obj.GitHub      = $Matches.GitHub.split(">").trim()
        $Obj.Sources     = $Matches.Sources.split(";").trim()
        $Obj.Dest        = $Matches.Dest.trim()
        $Obj.FLDR        = $Obj.Sources | % {"$(Split-Path $_)\"}
        $Obj.Sources     = $Obj.Sources | % {Split-Path $_ -leaf}
        $Script:Maps    += ,[PSCustomObject]$Obj
        $Obj.Sources | % {$Script:SrcMap += @{$_ = $index}}
        $index++
    }
}
function GIT-SELF-AWARE ([String]$Folder) {
    pushd $Folder;$T = [Console]::ForegroundColor
    $END = {[Console]::ForegroundColor = $t;popd}
    $Data = try {$Maps[$SrcMap.((ls *.ps1 | Get-Random).Name)]} catch {};if (!$Data) {Write-AP ">-Could Not get Data for this project, please add to MapFile.";$END.Invoke();return}
    if (!(Test-Path -type Container ".git")) {
        Write-AP ">*Initializing git for [$($Data.Name)]"
        $null = git init
    }
    if (git ls-remote "https://github.com/$($Data.GitHub[1])" 2>$null) {
        if (!(Test-Path "LICENSE") -or !(Test-Path "README.md")) {
            Write-AP ">*Issuing a pull request from [$($Data.GitHub[1])]"
            $Rand = Get-Random
            md "$Rand-Folder" | Out-Null;ls -File | % {mv $_ "$Rand-Folder"}
            $null = git pull -u "https://github.com/$($Data.GitHub[1]).git" master 2>$null
            ls "$Rand-Folder" | % {cp $_.FullName}; del -Recurse "$Rand-Folder"
        }
    }
    if (!(Test-Path -type Leaf "LICENSE")) {
        Write-AP ">*Issuing MIT LICENSE!"
        irm "https://raw.githubusercontent.com/avdaredevil/K9-BruteForcer/master/LICENSE" | Out-File -Encoding Default "LICENSE"
    }
    if (!(Test-Path -type Leaf "README.md")) {
        Write-AP ">*Creating a ReadMe!"
        [Console]::ForegroundColor = 3
        $Title = $Data.Name
        $Description = Ask-OE-QSTN "Enter a Description`n----------------------------------------"
        "$Title",("="*$Title.Length),"",$Description | Out-File -Encoding Default "README.md"
    }
    if (!(git ls-remote "https://github.com/$($Data.GitHub[1])" 2>$null)) {
        Write-AP ">*Creating a GIT Repo as [$($Data.GitHub[1])]"
#        -------------------------------
        if (!$Script:Psw) {$Script:Psw = Psw-Prompt -Text (Tab-Text "Enter your GitHub Password : " 3) -ShowMaskedPsw -Mask 5 -ForceValidation -Validator {$Psw.Length -gt 6};[Console]::cursortop--;Clear-Line}
        if (!$Script:Psw) {Write-AP ">>!Password Prompt Canceled";$END.Invoke();return}
        $IE = New-Object -com InternetExplorer.Application;$IE.visible=1
        $IE.Navigate("https://github.com/login");Load-Internet $IE
        if ($IE.Document.getElementById("login_field")) {
            $IE.Document.getElementById("login_field").value = $UserName;$IE.Document.getElementById("password").value = $Psw;$IE.Document.getElementsByName("commit").item(0).click();Load-Internet $IE
            if ($IE.Document.getElementById("password")) {Write-AP ">>-Invalid Password";$END.Invoke();Return}
        }
        $IE.Navigate2("https://github.com/new");Load-Internet $IE
        $IE.Document.getElementById("repository_name").value = Split-Path -leaf $Data.GitHub[1]
        $IE.Document.getElementById("repository_description").value = ?:(([IO.File]::ReadAllLines("$PWD\README.md") -join(";")) -match "==;(?<Data>.*)") {$Matches.Data.trim(";").replace(";",". ") -replace " {2,}"} {"Cool Project by Apoorv Verma [AP]"}
        $IE.Document.getElementsByTagName("button").item(1).click();Load-Internet $IE
        pause "Press enter when you're done making the repo . . ."
#        -------------------------------
        git add LICENSE,*.md 2>$null
        git commit -m "AP-GitHub Releaser Initialization Run"
        git remote add $Data.GitHub[0] "https://github.com/$($Data.GitHub[1]).git"
        git push -u $Data.GitHub[0] master
        Write-AP ">>+Done! You should go add a tagline for your project on GitHub."
        $END.invoke();return
    }
    if (!((git remote -v 2>$null) -match $Data.GitHub[0])) {Write-AP ">*Established Friendly-Name Connection for [$($Data.Name)]";git remote add $Data.GitHub[0] "https://github.com/$($Data.GitHub[1]).git"}
    if (!$AcceptAll) {[Console]::ForegroundColor = "Yellow";$inp = $(while ($True) {$a = (Input-Prompt (Tab-text "Are You Sure, you want to push your code up to GitHub : " 2)) -replace " +"," ";if ($a) {$a;break}})} else {$inp = "yes"}
    if ($Inp -match "y(a+h+|e\w+)|I am [^n]") {
        if (!$AcceptAll) {[Console]::CursorTop--;Clear-Line}
        [Console]::ForegroundColor = 3
        Write-AP ">*Pushing Code to GitHub"
        $null = git add . 2>$null
        if ((git status 2>$null) -match "nothing to commit") {Write-AP ">*No Changes needed.";$END.Invoke();return}
        $Message = Input-Prompt (Tab-Text "Enter a message to commit with : " 2);if (!$Message.trim()) {$Message = "Updated Code"}
        $null = git commit -a -m $Message 2>$null
        $Null = git push -u $Data.GitHub[0] master 2>$Null
        Write-AP ">+Success, Pushed Code up."
    } else {if ($Inp) {[Console]::CursorTop--};Clear-Line}
    $END.Invoke()
}
function Get-Folder-For ($name) {
    try {
        $Data = $Maps[$SrcMap.$Name]
        return (Zip-Arrays $Data.Sources,$Data.FLDR | ? {$_[0] -eq $Name})[1]
    } catch {}
}
function Write-Hashes {
    $Solved = @{};@($Hash.Keys) | % {$Solved.$_ = $False}
    $OLDData = [IO.File]::ReadAllLines($HashFile)
    $OLDData | % {
        if ($_[0] -ne "@") {
            $Dt = $_.split("|").trim()
            $Solved.($Dt[0]) = $True
            if ($Hash.($Dt[0]) -ne $Dt[1]) {"{0}|{1}" -f $DT[0],$Hash.($Dt[0])} else {$_}
        } else {$_}
    } | Out-File -Encoding Default $HashFile
    @($Solved.Keys) | ? {!$Solved.$_} | % {"{0}|{1}" -f $_,$Hash.$_} | Out-File -Encoding Default -Append $HashFile
}
function Read-Hashes {
    $Script:Hash = @{}
    [IO.File]::ReadAllLines($HashFile) | ? {$_[0] -ne "@"} | ? {$_ -match "(?<Key>[^\|]+)\|(?<Hash>\S+)"} | % {
        $Script:Hash += @{$Matches.Key = $Matches.Hash}
    }
}
$Changed = @()
Read-Maps
Read-Hashes
Flatten $Maps.Sources | % {
    $Fold = Get-Folder-For $_
    if (!$Hash.$_) {
        Write-AP "*Creating Hash Entry for [$_]";$Hash.$_ = Get-FileHash "$PShell\$FOLD$_";$Changed += ,$_
    }
    if (!(Test-Path -Type Container "$PSHell\Git-Temp\$($Maps[$SrcMap.$_].Dest)")) {
        Write-AP "*Creating Folder Structure for [$($Maps[$SrcMap.$_].Name)]"
        Md "$PSHell\Git-Temp\$($Maps[$SrcMap.$_].Dest)" | Out-Null
    }
    if (!(Test-Path -Type leaf "$PSHell\Git-Temp\$($Maps[$SrcMap.$_].Dest)\$_")) {
        Write-AP "*Indexing [$_] for git configurations"
        $Changed += ,$_
    }
}
$Changed += @($Hash.Keys) | ? {$Fold = Get-Folder-For $_;$Hash.$_ -ne (Get-FileHash "$PSHell\$Fold$_")}
$PKGs = @{}
foreach ($c in $Changed) {
    $Fold = Get-Folder-For $c
    if (!(Test-Path -type leaf "$PSHell\$Fold$c")) {Write-AP "-Source [$c] does not exist in <Home>$(if ($Fold) {'\'+$Fold}), skipped.";continue}
    $Map = $Maps[$SrcMap.$c];$PKGs.($Map.Name) = $Map.Dest;$NewHash = Get-FileHash "$PSHell\$Fold$c"
    Write-AP "+Copying Delta File for [$($Map.Dest)\$c] -> [$($NewHash.split(':')[0,1,2] -join ':')...$($NewHash.split(':')[-3,-2,-1] -join ':')]"
    AP-Compile $PSHell\$Fold$c "$PSHell\Git-Temp\$($Map.Dest)"
    $Hash.$c = $NewHash
}
@($PKGs.Keys) | % {
    Write-AP "*Running Self Aware Git Commands for [$_]"
    GIT-SELF-AWARE "$PSHell\Git-Temp\$($PKGs.$_)"
}
if ($Script:psw) {rv psw -scope Script}
Write-Hashes
