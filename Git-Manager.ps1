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
[CmdLetBinding(DefaultParameterSetName="None")]
param([parameter(ParameterSetName="R",Position=0)][Switch]$Rebuild, [Switch]$AcceptAll,[parameter(ParameterSetName="R",Position=1)][Alias("Msg")]$Message)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.3] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")

    [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))
}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gQWxpZ24tVGV4dCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJykNCg0KICAgIGlmICgkVGV4dC5jb3VudCAtZ3QgMSkgew0KICAgICAgICAkYW5zID0gQCgpDQogICAgICAgIGZvcmVhY2ggKCRsbiBpbiAkVGV4dCkgeyRBbnMgKz0gQWxpZ24tVGV4dCAkbG4gJEFsaWdufQ0KICAgICAgICByZXR1cm4gKCRhbnMpDQogICAgfSBlbHNlIHsNCiAgICAgICAgJFdpblNpemUgPSBbY29uc29sZV06OkJ1ZmZlcldpZHRoDQogICAgICAgICRDbGVhblRleHRTaXplID0gKFN0cmlwLUNvbG9yQ29kZXMgKCIiKyRUZXh0KSkuTGVuZ3RoDQogICAgICAgIGlmICgkQ2xlYW5UZXh0U2l6ZSAtZ2UgJFdpblNpemUpIHsNCiAgICAgICAgICAgICRBcHBlbmRlciA9IEAoIiIpOw0KICAgICAgICAgICAgJGogPSAwDQogICAgICAgICAgICBmb3JlYWNoICgkcCBpbiAwLi4oJENsZWFuVGV4dFNpemUtMSkpew0KICAgICAgICAgICAgICAgIGlmICgoJHArMSklJHdpbnNpemUgLWVxIDApIHskaisrOyRBcHBlbmRlciArPSAiIn0NCiAgICAgICAgICAgICAgICAjICIiKyRqKyIgLSAiKyRwDQogICAgICAgICAgICAgICAgJEFwcGVuZGVyWyRqXSArPSAkVGV4dC5jaGFycygkcCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIHJldHVybiAoQWxpZ24tVGV4dCAkQXBwZW5kZXIgJEFsaWduKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgaWYgKCRBbGlnbiAtZXEgIkNlbnRlciIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIipbbWF0aF06OnRydW5jYXRlKCgkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZSkvMikrJFRleHQpDQogICAgICAgICAgICB9IGVsc2VpZiAoJEFsaWduIC1lcSAiUmlnaHQiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqKCRXaW5TaXplLSRDbGVhblRleHRTaXplLTEpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCRUZXh0KQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gVG8tQ2xpcGJvYXJkIHtwYXJhbShbUGFyYW1ldGVyKFZhbHVlRnJvbVBpcGVsaW5lPSR0cnVlKV0kVGV4dCkNCg0KICAgIFtTdHJpbmddJFRleHQgPSAkVGV4dCAtam9pbiAiYG4iDQogICAgaWYgKCEkVGV4dC50cmltKCkpIHskVGV4dCA9ICIgIn0NCiAgICBBZGQtVHlwZSAtYXMgU3lzdGVtLldpbmRvd3MuRm9ybXMNCiAgICBbU3lzdGVtLldpbmRvd3MuRm9ybXMuQ2xpcGJvYXJkXTo6U2V0VGV4dCgkVGV4dCkNCn0KCmZ1bmN0aW9uIEdldC1QYXRoIHtwYXJhbSgkbWF0Y2gsIFtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCIpDQoNCiAgICAkUHRoID0gW0Vudmlyb25tZW50XTo6R2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhcikNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICAkUGF0aFNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiOiJ9IGVsc2UgeyI7In0pDQogICAgaWYgKCEkUHRoKSB7cmV0dXJuIEAoKX0NCiAgICBTZXQtUGF0aCAkUHRoIC1QYXRoVmFyICRQYXRoVmFyDQogICAgJGQgPSAoJFB0aCkuc3BsaXQoJFBhdGhTZXApDQogICAgaWYgKCRtYXRjaCkgeyRkIC1tYXRjaCAkbWF0Y2h9IGVsc2UgeyRkfQ0KfQoKZnVuY3Rpb24gS2V5UHJlc3NlZENvZGUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bSW50XSRLZXksICRTdG9yZT0iXl5eIikNCg0KICAgIGlmICghJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlIC1hbmQgJFN0b3JlIC1lcSAiXl5eIikge1JldHVybiAkRmFsc2V9DQogICAgaWYgKCRTdG9yZSAtZXEgIl5eXiIpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIil9DQogICAgcmV0dXJuICgkS2V5IC1pbiAkU3RvcmUuVmlydHVhbEtleUNvZGUpDQp9CgpmdW5jdGlvbiBLZXlQcmVzc2VkIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ1tdXSRLZXksICRTdG9yZT0iXl5eIikNCg0KICAgIGlmICgkU3RvcmUgLWVxICJeXl4iIC1hbmQgJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlKSB7JFN0b3JlID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiSW5jbHVkZUtleVVwLE5vRWNobyIpfSBlbHNlIHtpZiAoJFN0b3JlIC1lcSAiXl5eIikge3JldHVybiAkRmFsc2V9fQ0KICAgICRBbnMgPSAkRmFsc2UNCiAgICAkS2V5IHwgJSB7DQogICAgICAgICRTT1VSQ0UgPSAkXw0KICAgICAgICB0cnkgew0KICAgICAgICAgICAgJEFucyA9ICRBbnMgLW9yIChLZXlQcmVzc2VkQ29kZSAkU09VUkNFICRTdG9yZSkNCiAgICAgICAgfSBjYXRjaCB7DQogICAgICAgICAgICBGb3JlYWNoICgkSyBpbiAkU09VUkNFKSB7DQogICAgICAgICAgICAgICAgW1N0cmluZ10kSyA9ICRLDQogICAgICAgICAgICAgICAgaWYgKCRLLmxlbmd0aCAtZ3QgNCAtYW5kICgkS1swLDEsLTEsLTJdIC1qb2luKCIiKSkgLWVxICJ+fn5+Iikgew0KICAgICAgICAgICAgICAgICAgICAkQW5zID0gJEFOUyAtb3IgKEtleVByZXNzZWRDb2RlIChLZXlUcmFuc2xhdGUoJEspKSAkU3RvcmUpDQogICAgICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICAgICAgJEFucyA9ICRBTlMgLW9yICgkSy5jaGFycygwKSAtaW4gJFN0b3JlLkNoYXJhY3RlcikNCiAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQogICAgcmV0dXJuICRBbnMNCn0KCmZ1bmN0aW9uIEFQLVJlcXVpcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bQWxpYXMoIkZ1bmN0aW9uYWxpdHkiLCJMaWJyYXJ5IildW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbCwgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICAkTG9hZE1vZHVsZSA9IHsNCiAgICAgICAgcGFyYW0oJEZpbGUsW2Jvb2xdJEltcG9ydCkNCiAgICAgICAgdHJ5IHtJbXBvcnQtTW9kdWxlICRGaWxlIC1lYSBzdG9wO3JldHVybiAxfSBjYXRjaCB7fQ0KICAgICAgICAkTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7JExGID0gIiRMaWJcJEZpbGUiDQogICAgICAgIFtzdHJpbmddJGYgPSBpZih0ZXN0LXBhdGggLXQgbGVhZiAkTEYpeyRMRn1lbHNlaWYodGVzdC1wYXRoIC10IGxlYWYgIiRMRi5kbGwiKXsiJExGLmRsbCJ9DQogICAgICAgIGlmICgkZiAtYW5kICRJbXBvcnQpIHtJbXBvcnQtTW9kdWxlICRmfQ0KICAgICAgICByZXR1cm4gJGYNCiAgICB9DQogICAgJFN0YXQgPSAkKHN3aXRjaCAtcmVnZXggKCRMaWIudHJpbSgpKSB7DQogICAgICAgICJeSW50ZXJuZXQiICAgICAgICAgICAgICAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5kZXA6KC4qKSIgICAgICAgICAgICAgICB7R2V0LVdoZXJlICRNYXRjaGVzWzFdfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKTooLiopIiAgICAgIHskTG9hZE1vZHVsZS5pbnZva2UoJE1hdGNoZXNbMl0sICR0cnVlKX0NCiAgICAgICAgIl4obGlifG1vZHVsZSlfdGVzdDooLiopIiB7JExvYWRNb2R1bGUuaW52b2tlKCRNYXRjaGVzWzJdKX0NCiAgICAgICAgIl5mdW5jdGlvbjooLiopIiAgICAgICAgICB7Z2NtICRNYXRjaGVzWzFdIC1lYSBTaWxlbnRseUNvbnRpbnVlfQ0KICAgICAgICAiXnN0cmljdF9mdW5jdGlvbjooLiopIiAgIHtUZXN0LVBhdGggIkZ1bmN0aW9uOlwkKCRNYXRjaGVzWzFdKSJ9DQogICAgICAgIGRlZmF1bHQge1dyaXRlLUFQICIhSW52YWxpZCBzZWxlY3RvciBwcm92aWRlZCBbJCgiJExpYiIuc3BsaXQoJzonKVswXSldIjt0aHJvdyAnQkFEX1NFTEVDVE9SJ30NCiAgICB9KQ0KICAgIGlmICghJFN0YXQgLWFuZCAkT25GYWlsKSB7JE9uRmFpbC5JbnZva2UoKX0NCiAgICBpZiAoJFBhc3NUaHJ1IC1vciAhJE9uRmFpbCkge3JldHVybiAkU3RhdH0NCn0KCmZ1bmN0aW9uIFBzdy1Qcm9tcHQge3BhcmFtKFtBbGlhcygiUHJvbXB0IildW1N0cmluZ10kVGV4dCA9ICJFbnRlciBQYXNzd29yZCA6ICIsIFtTd2l0Y2hdJFNob3dNYXNrZWRQc3csIFtjaGFyXSRNYXNrPTgyMjYsIFtTd2l0Y2hdJEZvcmNlVmFsaWRhdGlvbiwgW3NjcmlwdGJsb2NrXSRWYWxpZGF0b3I9ezN9KQ0KDQogICAgV3JpdGUtaG9zdCAtbm9uZXdsaW5lICRUZXh0DQogICAgJFJlUmVnWCA9ICdbXlx4MDEtXHgwOFx4MTAtXHg4MF0rJyMnW15cd1wuXScNCiAgICAkUHN3ID0gIiINCiAgICAkaVBvc3ggPSBbQ29uc29sZV06OkN1cnNvckxlZnQNCiAgICAkaVBvc3kgPSBbQ29uc29sZV06OkN1cnNvclRvcA0KICAgICRDdmlzID0gW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlDQogICAgW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlID0gJEZhbHNlDQogICAgaWYgKCEkU2hvd01hc2tlZFBzdykgeyRWYWxpZGF0b3I9ezN9fQ0KICAgICRDb3VudCA9IDE7JFNsZWVwID0gMA0KICAgIFdoaWxlICgkVHJ1ZSkgew0KICAgICAgICBpZiAoJGNvdW50IC1ndCAyNTApIHskU2xlZXAgPSAyNTB9DQogICAgICAgICRUZXN0ID0gJiRWYWxpZGF0b3INCiAgICAgICAgaWYgKCRIb3N0LlVJLlJhd1VJLktleUF2YWlsYWJsZSkgeyRTdG9yZSA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIkluY2x1ZGVLZXlEb3duLE5vRWNobyIpOyRDb3VudD0wOyRTbGVlcD0wfSBlbHNlIHskQ291bnQrKztTdGFydC1TbGVlcCAtbSAkU2xlZXA7Y29udGludWV9DQogICAgICAgIGlmIChLZXlQcmVzc2VkICJ+fkJhY2tTcGFjZX5+IiAkU3RvcmUpIHtpZiAoJHN0b3JlLkNvbnRyb2xLZXlTdGF0ZSAtbWF0Y2ggImN0cmwiKSB7JFBzdz0iIn0gZWxzZSB7JFBzdyA9ID86ICgkUHN3Lkxlbmd0aCAtZXEgMCl7IiJ9eyRQc3cuc3Vic3RyaW5nKDAsJFBzdy5MZW5ndGgtMSl9fX0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+flNwYWNlfn4iICRTdG9yZSkgeyRQc3cgKz0gIiAifQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+RXNjYXBlfn4iICRTdG9yZSkgeyRwc3c9IiI7YnJlYWt9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5FTlRFUn5+IiAkU3RvcmUpIHtXcml0ZS1Ib3N0ICIiO2lmIChbaW50XSRUZXN0IC1uZSAzKSB7aWYgKCRUZXN0IC1vciAhJEZvcmNlVmFsaWRhdGlvbikge2JyZWFrfSBlbHNlIHtXcml0ZS1Ib3N0IC1mIFllbGxvdyAtTm9OZXdMaW5lICJNdXN0IFR5cGUgaW4gYSB2YWxpZCBQYXNzd29yZC4uLiI7c3RhcnQtc2xlZXAgLXMgMjtDbGVhci1MaW5lO1tDb25zb2xlXTo6Q3Vyc29yVG9wLT0xfX1lbHNle2JyZWFrfX0gZWxzZSANCiAgICAgICAgeyRQc3cgKz0gJFN0b3JlLkNoYXJhY3RlciAtcmVwbGFjZSAoJFJlUmVnWCwnJyl9DQogICAgICAgIGlmICgkU2hvd01hc2tlZFBzdykgew0KICAgICAgICAgICAgJHd0ID0gW0NvbnNvbGVdOjpCdWZmZXJXaWR0aCAtICRpUG9zeCAtIDENCiAgICAgICAgICAgICRUZXN0ID0gJiRWYWxpZGF0b3INCiAgICAgICAgICAgIFtDb25zb2xlXTo6Q3Vyc29ybGVmdCA9ICRpUG9zeA0KICAgICAgICAgICAgaWYgKCR3dCAtICRQc3cuTGVuZ3RoIC1sdCAwKSB7JHRiPSIiOyR0dD0iJE1hc2siKigkd3QtMykrIi4uLiJ9IGVsc2UgeyR0Yj0iICIqKCR3dC0kUHN3Lkxlbmd0aCk7JHR0PSIkTWFzayIqJFBzdy5MZW5ndGh9DQogICAgICAgICAgICAkZmNvbCA9IFtjb25zb2xlXTo6Rm9yZWdyb3VuZENvbG9yDQogICAgICAgICAgICBpZiAoW2ludF0kVGVzdCAtbmUgMykgew0KICAgICAgICAgICAgICAgICRmQ29sID0gPzooJFRlc3QpIHsyfSB7InJlZCJ9DQogICAgICAgICAgICB9DQogICAgICAgICAgICBXcml0ZS1ob3N0IC1ub25ld2xpbmUgLWYgJGZDb2wgJHR0JHRiDQogICAgICAgIH0NCiAgICB9DQogICAgW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlID0gJEN2aXMNCiAgICByZXR1cm4gJHBzdw0KfQoKZnVuY3Rpb24gSW52b2tlLVRlcm5hcnkge3BhcmFtKFtib29sXSRkZWNpZGVyLCBbc2NyaXB0YmxvY2tdJGlmdHJ1ZSwgW3NjcmlwdGJsb2NrXSRpZmZhbHNlKQ0KDQogICAgaWYgKCRkZWNpZGVyKSB7ICYkaWZ0cnVlfSBlbHNlIHsgJiRpZmZhbHNlIH0NCn0KCmZ1bmN0aW9uIEdldC1Fc2NhcGUge1tDaGFyXTB4MWJ9CgpmdW5jdGlvbiBTdHJpcC1Db2xvckNvZGVzIHtwYXJhbSgkU3RyKQ0KDQogICAgJFN0ciB8ICUgeyRfIC1yZXBsYWNlICIkKFtyZWdleF06OmVzY2FwZSgiJChHZXQtRXNjYXBlKVsiKSlcZCsoXDtcZCspKm0iLCIifQ0KfQoKZnVuY3Rpb24gV3JpdGUtQVAgew0KICAgIFtDbWRsZXRCaW5kaW5nKCldDQogICAgcGFyYW0oW1BhcmFtZXRlcihWYWx1ZUZyb21QaXBlbGluZT0kdHJ1ZSwgTWFuZGF0b3J5PSRUcnVlKV0kVGV4dCxbU3dpdGNoXSROb1NpZ24sW1N3aXRjaF0kUGxhaW5UZXh0LFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0xlZnQnLFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KICAgIGJlZ2luIHskVFQgPSBAKCl9DQogICAgUHJvY2VzcyB7JFRUICs9ICwkVGV4dH0NCiAgICBFTkQgew0KICAgICAgICAkQmx1ZSA9ICQoaWYgKCRXUklURV9BUF9MRUdBQ1lfQ09MT1JTKXszfWVsc2V7J0JsdWUnfSkNCiAgICAgICAgaWYgKCRUVC5jb3VudCAtZXEgMSkgeyRUVCA9ICRUVFswXX07JFRleHQgPSAkVFQNCiAgICAgICAgaWYgKCR0ZXh0LmNvdW50IC1ndCAxIC1vciAkdGV4dC5HZXRUeXBlKCkuTmFtZSAtbWF0Y2ggIlxbXF0kIikgew0KICAgICAgICAgICAgcmV0dXJuICRUZXh0IHwgPyB7IiRfIn0gfCAlIHsNCiAgICAgICAgICAgICAgICBXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ24gLVBhc3NUaHJ1OiRQYXNzVGhydQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+WytcLSFcKlwjXEBfXSkoPzx3Pi4qKSIpIHtyZXR1cm4gJFRleHR9DQogICAgICAgICR0YiAgPSAiICAgICIqJE1hdGNoZXMudC5sZW5ndGgNCiAgICAgICAgJENvbCA9IEB7JysnPScyJzsnLSc9JzEyJzsnISc9JzE0JzsnKic9JEJsdWU7JyMnPSdEYXJrR3JheSc7J0AnPSdHcmF5JzsnXyc9J3doaXRlJ31bKCRTaWduID0gJE1hdGNoZXMuUyldDQogICAgICAgIGlmICghJENvbCkge1Rocm93ICJJbmNvcnJlY3QgU2lnbiBbJFNpZ25dIFBhc3NlZCEifQ0KICAgICAgICAkU2lnbiA9ICQoaWYgKCROb1NpZ24gLW9yICRNYXRjaGVzLk5TKSB7IiJ9IGVsc2UgeyJbJFNpZ25dICJ9KQ0KICAgICAgICBBUC1SZXF1aXJlICJmdW5jdGlvbjpBbGlnbi1UZXh0IiB7ZnVuY3Rpb24gR2xvYmFsOkFsaWduLVRleHQoJGFsaWduLCR0ZXh0KSB7JHRleHR9fQ0KICAgICAgICAkRGF0YSA9ICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiO2lmICghJERhdGEpIHtyZXR1cm59DQogICAgICAgICREYXRhID0gQWxpZ24tVGV4dCAtQWxpZ24gJEFsaWduICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiDQogICAgICAgIGlmICgkUGxhaW5UZXh0KSB7cmV0dXJuICREYXRhfQ0KICAgICAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmU6JChbYm9vbF0kTWF0Y2hlcy5OTkwpIC1mICRDb2wgJERhdGENCiAgICAgICAgaWYgKCRQYXNzVGhydSkge3JldHVybiAkRGF0YX0NCiAgICB9DQp9CgpmdW5jdGlvbiBJbnB1dC1Qcm9tcHQge3BhcmFtKFtWYWxpZGF0ZU5vdE51bGxvckVtcHR5KCldW1N0cmluZ10kUHJvbXB0ID0gIkVudGVyIFRleHQgOiAiKQ0KDQogICAgV3JpdGUtaG9zdCAtbm9uZXdsaW5lICRQcm9tcHQNCiAgICAkUmVSZWdYID0gJ1teXHgwMS1ceDA4XHgxMC1ceDgwXSsnIydbXlx3XC5dJyBb0JAt0Y/QgdGRXQ0KICAgICRUclN0cmluZyA9ICIiDQogICAgJGlQb3N4ID0gW0NvbnNvbGVdOjpDdXJzb3JMZWZ0DQogICAgJGlQb3N5ID0gW0NvbnNvbGVdOjpDdXJzb3JUb3ANCiAgICAkQ3ZpcyA9IFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZQ0KICAgIFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZSA9ICRGYWxzZQ0KICAgICRDb3VudCA9IDE7JFNsZWVwID0gMA0KICAgIFdoaWxlICgkVHJ1ZSkgew0KICAgICAgICBpZiAoJGNvdW50IC1ndCA1MDApIHskU2xlZXAgPSAxMDB9DQogICAgICAgIGlmICgkSG9zdC5VSS5SYXdVSS5LZXlBdmFpbGFibGUpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5RG93bixOb0VjaG8iKTskQ291bnQ9MDskU2xlZXA9MH0gZWxzZSB7JENvdW50Kys7U3RhcnQtU2xlZXAgLW0gJFNsZWVwO2NvbnRpbnVlfQ0KICAgICAgICBpZiAoS2V5UHJlc3NlZCAifn5CYWNrU3BhY2V+fiIgJFN0b3JlKSB7aWYgKCRzdG9yZS5Db250cm9sS2V5U3RhdGUgLW1hdGNoICJjdHJsIikgeyRUclN0cmluZz0iIn0gZWxzZSB7JFRyU3RyaW5nID0gPzogKCRUclN0cmluZy5MZW5ndGggLWVxIDApeyIifXskVHJTdHJpbmcuc3Vic3RyaW5nKDAsJFRyU3RyaW5nLkxlbmd0aC0xKX19fQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+U3BhY2V+fiIgJFN0b3JlKSB7JFRyU3RyaW5nICs9ICIgIn0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+fkVzY2FwZX5+IiAkU3RvcmUpIHskVHJTdHJpbmc9IiI7YnJlYWt9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5FTlRFUn5+IiAkU3RvcmUpIHtXcml0ZS1Ib3N0ICIiO2JyZWFrfSBlbHNlIA0KICAgICAgICB7JFRyU3RyaW5nICs9ICRTdG9yZS5DaGFyYWN0ZXIgLXJlcGxhY2UgKCRSZVJlZ1gsJycpfQ0KICAgICAgICAkd3QgPSBbQ29uc29sZV06OkJ1ZmZlcldpZHRoIC0gJGlQb3N4IC0gMQ0KICAgICAgICBbQ29uc29sZV06OkN1cnNvcmxlZnQgPSAkaVBvc3gNCiAgICAgICAgW0NvbnNvbGVdOjpDdXJzb3JUb3AgPSAkaVBvc3kNCiAgICAgICAgaWYgKCR3dC0kVHJTdHJpbmcuTGVuZ3RoIC1sdCAwKSB7DQogICAgICAgICAgICAkdGI9IiINCiAgICAgICAgICAgICR0dD0iLi4uIiskVHJTdHJpbmcuc3Vic3RyaW5nKCRUclN0cmluZy5MZW5ndGgtJHd0KzMpDQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAkdGI9IiAiKigkd3QtJFRyU3RyaW5nLkxlbmd0aCkNCiAgICAgICAgICAgICR0dD0kVHJTdHJpbmcNCiAgICAgICAgfQ0KICAgICAgICAkZmNvbCA9IFtjb25zb2xlXTo6Rm9yZWdyb3VuZENvbG9yDQogICAgICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAtZiAkZkNvbCAkdHQkVGINCiAgICB9DQogICAgW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlID0gJEN2aXMNCiAgICByZXR1cm4gJFRSU3RyaW5nDQp9CgpmdW5jdGlvbiBLZXlUcmFuc2xhdGUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRLZXkpDQoNCiAgICAkSGFzaEtleSA9IEB7DQogICAgICAgICJ+fkN0cmxDfn4iPTY3DQogICAgICAgICJ+flNwYWNlfn4iPTMyDQogICAgICAgICJ+fkVTQ0FQRX5+Ij0yNw0KICAgICAgICAifn5FbnRlcn5+Ij0xMw0KICAgICAgICAifn5TaGlmdH5+Ij0xNg0KICAgICAgICAifn5Db250cm9sfn4iPTE3DQogICAgICAgICJ+fkFsdH5+Ij0xOA0KICAgICAgICAifn5CYWNrU3BhY2V+fiI9OA0KICAgICAgICAifn5EZWxldGV+fiI9NDYNCiAgICAgICAgIn5+ZjF+fiI9MTEyDQogICAgICAgICJ+fmYyfn4iPTExMw0KICAgICAgICAifn5mM35+Ij0xMTQNCiAgICAgICAgIn5+ZjR+fiI9MTE1DQogICAgICAgICJ+fmY1fn4iPTExNg0KICAgICAgICAifn5mNn5+Ij0xMTcNCiAgICAgICAgIn5+Zjd+fiI9MTE4DQogICAgICAgICJ+fmY4fn4iPTExOQ0KICAgICAgICAifn5mOX5+Ij0xMjANCiAgICAgICAgIn5+ZjEwfn4iPTEyMQ0KICAgICAgICAifn5mMTF+fiI9MTIyDQogICAgICAgICJ+fmYxMn5+Ij0xMjMNCiAgICAgICAgIn5+TXV0ZX5+Ij0xNzMNCiAgICAgICAgIn5+SW5zZXJ0fn4iPTQ1DQogICAgICAgICJ+flBhZ2VVcH5+Ij0zMw0KICAgICAgICAifn5QYWdlRG93bn5+Ij0zNA0KICAgICAgICAifn5FTkR+fiI9MzUNCiAgICAgICAgIn5+SE9NRX5+Ij0zNg0KICAgICAgICAifn50YWJ+fiI9OQ0KICAgICAgICAifn5DYXBzTG9ja35+Ij0yMA0KICAgICAgICAifn5OdW1Mb2Nrfn4iPTE0NA0KICAgICAgICAifn5TY3JvbGxMb2Nrfn4iPTE0NQ0KICAgICAgICAifn5XaW5kb3dzfn4iPTkxDQogICAgICAgICJ+fkxlZnR+fiI9MzcNCiAgICAgICAgIn5+VXB+fiI9MzgNCiAgICAgICAgIn5+UmlnaHR+fiI9MzkNCiAgICAgICAgIn5+RG93bn5+Ij00MA0KICAgICAgICAifn5LUDB+fiI9OTYNCiAgICAgICAgIn5+S1Axfn4iPTk3DQogICAgICAgICJ+fktQMn5+Ij05OA0KICAgICAgICAifn5LUDN+fiI9OTkNCiAgICAgICAgIn5+S1A0fn4iPTEwMA0KICAgICAgICAifn5LUDV+fiI9MTAxDQogICAgICAgICJ+fktQNn5+Ij0xMDINCiAgICAgICAgIn5+S1A3fn4iPTEwMw0KICAgICAgICAifn5LUDh+fiI9MTA0DQogICAgICAgICJ+fktQOX5+Ij0xMDUNCiAgICB9DQogICAgaWYgKFtpbnRdJENvbnZlcnQgPSAkSGFzaEtleS4kS2V5KSB7cmV0dXJuICRDb252ZXJ0fQ0KICAgIFRocm93ICJJbnZhbGlkIFNwZWNpYWwgS2V5IENvbnZlcnNpb24iDQp9CgpmdW5jdGlvbiBHZXQtRmlsZUhhc2gge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRGaWxlKQ0KDQogICAgaWYgKCEoVGVzdC1QYXRoIC10eXBlIGxlYWYgJEZpbGUpKSB7VGhyb3cgIltHZXQtRmlsZUhhc2hdIEZpbGUgWyRGaWxlXSBOb3QgZm91bmQifQ0KICAgICRGaWxlID0gInswfSIgLWYgKFJlc29sdmUtUGF0aCAkRmlsZSkNCiAgICAkYSA9IFtTeXN0ZW0uU2VjdXJpdHkuQ3J5cHRvZ3JhcGh5Lk1ENV06OkNyZWF0ZSgpDQogICAgJEhhc2ggPSAkYS5Db21wdXRlSGFzaChbSU8uRmlsZV06OlJlYWRBbGxCeXRlcygkRmlsZSkpIC1qb2luICI6Ig0KICAgICRhLkRpc3Bvc2UoKQ0KICAgIFJldHVybiAkSGFzaA0KfQoKZnVuY3Rpb24gcGF1c2Uge3BhcmFtKFtTdHJpbmddJFBhdXNlUSA9ICJQcmVzcyBhbnkga2V5IHRvIGNvbnRpbnVlIC4gLiAuICIpDQoNCiAgICBXcml0ZS1Ib3N0IC1ub05ld2xpbmUgJFBhdXNlUQ0KICAgICRudWxsID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiTm9FY2hvLCBJbmNsdWRlS2V5RG93biIpDQogICAgV3JpdGUtSG9zdCAiIg0KfQoKZnVuY3Rpb24gTG9hZC1JbnRlcm5ldCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXSRJRSwgW0ludF0kSW50ZXJ2YWwgPSA1MCkNCg0KICAgIFdoaWxlICgkSUUuQnVzeSkgew0KICAgICAgICBTdGFydC1TbGVlcCAtbSAkSW50ZXJ2YWwNCiAgICB9DQp9CgpmdW5jdGlvbiBHZXQtV2hlcmUgew0KICAgIFtDbWRsZXRCaW5kaW5nKERlZmF1bHRQYXJhbWV0ZXJTZXROYW1lPSJOb3JtYWwiKV0NCiAgICBwYXJhbSgNCiAgICAgICAgW1BhcmFtZXRlcihNYW5kYXRvcnk9JHRydWUsIFBvc2l0aW9uPTApXVtzdHJpbmddJEZpbGUsDQogICAgICAgIFtTd2l0Y2hdJEFsbCwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdOb3JtYWwnKV1bUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bU3dpdGNoXSRNYW51YWxTY2FuLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bU3dpdGNoXSREYmcsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCINCiAgICApDQogICAgJElzVmVyYm9zZSA9ICREYmcgLW9yICRQU0JvdW5kUGFyYW1ldGVycy5Db250YWluc0tleSgnVmVyYm9zZScpIC1vciAkUFNCb3VuZFBhcmFtZXRlcnMuQ29udGFpbnNLZXkoJ0RlYnVnJykNCiAgICAkV2hlcmVCaW5FeGlzdHMgPSBHZXQtQ29tbWFuZCAid2hlcmUiIC1lYSBTaWxlbnRseUNvbnRpbnVlDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgaWYgKCRGaWxlIC1lcSAid2hlcmUiIC1vciAkRmlsZSAtZXEgIndoZXJlLmV4ZSIpIHtyZXR1cm4gJFdoZXJlQmluRXhpc3RzfQ0KICAgIGlmICgkV2hlcmVCaW5FeGlzdHMgLWFuZCAhJE1hbnVhbFNjYW4pIHsNCiAgICAgICAgJE91dD0kbnVsbA0KICAgICAgICBpZiAoJElzVW5peCkgew0KICAgICAgICAgICAgJE91dCA9IHdoaWNoICRmaWxlIDI+JG51bGwNCiAgICAgICAgfSBlbHNlIHskT3V0ID0gd2hlcmUuZXhlICRmaWxlIDI+JG51bGx9DQogICAgICAgIA0KICAgICAgICBpZiAoISRPdXQpIHtyZXR1cm59DQogICAgICAgIGlmICgkQWxsKSB7cmV0dXJuICRPdXR9DQogICAgICAgIHJldHVybiBAKCRPdXQpWzBdDQogICAgfQ0KICAgIGZvcmVhY2ggKCRGb2xkZXIgaW4gKEdldC1QYXRoIC1QYXRoVmFyICRQYXRoVmFyKSkgew0KICAgICAgICBpZiAoJElzVW5peCkgew0KICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlIg0KICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICBpZiAoIShUZXN0LVBhdGggLVBhdGhUeXBlIExlYWYgJExvb2t1cCkpIHtjb250aW51ZX0NCiAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoDQogICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBmb3JlYWNoICgkRXh0ZW5zaW9uIGluIChHZXQtUGF0aCAtUGF0aFZhciBQQVRIRVhUKSkgew0KICAgICAgICAgICAgICAgICRMb29rdXAgPSAiJEZvbGRlci8kRmlsZSRFeHRlbnNpb24iDQogICAgICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9DQogICAgICAgICAgICAgICAgUmVzb2x2ZS1QYXRoICRMb29rdXAgfCAlIFBhdGgNCiAgICAgICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQp9CgpmdW5jdGlvbiBBUC1Db252ZXJ0UGF0aCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmddJFBhdGgpDQoNCiAgICByZXR1cm4gJFBhdGggLXJlcGxhY2UgDQogICAgICAgICI8RGVwPiIsIjxMaWI+XERlcGVuZGVuY2llcyIgLXJlcGxhY2UgDQogICAgICAgICI8TGliPiIsIjxIb21lPlxBUC1MaWJyYXJpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPENvbXAob25lbnRzKT8+IiwiPEhvbWU+XEFQLUNvbXBvbmVudHMiIC1yZXBsYWNlIA0KICAgICAgICAiPEhvbWU+IiwkUFNIZWxsfQoKZnVuY3Rpb24gVGFiLVRleHQge3BhcmFtKFtTdHJpbmddJFRleHQsIFtpbnRdJE51bVRhYnM9MSwgW2ludF0kVGFiU2l6ZSA9IDQsIFtjaGFyXSRUYWJDaGFyID0gIiAiKQ0KDQogICAgJFRhYiA9ICgiJFRhYkNoYXIiKiRUYWJTaXplKSokTnVtVGFiczskaW5kZXg9MA0KICAgICRXaW4gPSBbQ29uc29sZV06OkJ1ZmZlcldpZHRoLTE7JFN0ciA9ICIiDQogICAgZm9yZWFjaCAoJGMgaW4gJFRleHQuVG9DaGFyQXJyYXkoKSkgew0KICAgICAgICBpZiAoISgkSW5kZXglJFdpbikpIHskU3RyICs9ICRUYWI7JEluZGV4Kz0kVGFiLkxlbmd0aH0NCiAgICAgICAgJFN0ciArPSAkYw0KICAgICAgICAkaW5kZXgrKw0KICAgIH0NCiAgICByZXR1cm4gJFN0cg0KfQoKZnVuY3Rpb24gQ2xlYXItTGluZSB7DQogICAgJE5tID0gW0NvbnNvbGVdOjpXaW5kb3dXaWR0aA0KICAgICR0ID0gW0NvbnNvbGVdOjpDdXJzb3JUb3A7W0NvbnNvbGVdOjpDdXJzb3JMZWZ0PTANCiAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmUgKCIgIiokTk0pDQogICAgW0NvbnNvbGVdOjpDdXJzb3JUb3A9JHQ7W0NvbnNvbGVdOjpDdXJzb3JMZWZ0PTANCn0KCmZ1bmN0aW9uIExvYWQtRm9ybXMgew0KICAgIGlmICgkRm9ybSkge3JldHVybn0NCiAgICBBZGQtVHlwZSAtQXNzZW1ibHlOYW1lIFN5c3RlbS5XaW5kb3dzLkZvcm1zDQogICAgJFNjcmlwdDpGb3JtID0gTmV3LU9iamVjdCBzeXN0ZW0uV2luZG93cy5Gb3Jtcy5Gb3JtDQogICAgJEZvcm0uVGV4dCA9ICJFbnRlciBJbnB1dCBmb3IgUXVlc3Rpb24iOyRGb3JtLlNpemUgPSAiNTg4LCAzNzIiDQogICAgJExhYmVsID0gTmV3LU9iamVjdCBTeXN0ZW0uV2luZG93cy5Gb3Jtcy5MYWJlbDskVGV4dCA9IE5ldy1PYmplY3QgU3lzdGVtLldpbmRvd3MuRm9ybXMuVGV4dEJveDskQlROID0gTmV3LU9iamVjdCBTeXN0ZW0uV2luZG93cy5Gb3Jtcy5CdXR0b247JEJUTi5OYW1lID0gImV4aXRzIjskQlROLlRleHQgPSAiU3VibWl0Ig0KICAgICRMYWJlbC5TaXplID0gIjU1MSwgMTI3IjskVGV4dC5TaXplID0gIjU0OCwgMTU5IjskTGFiZWwuRm9yZUNvbG9yID0gIlNub3ciOyRCVE4uYWRkX2NsaWNrKHskRm9ybS5DbG9zZSgpfSk7JEJUTi5Mb2NhdGlvbiA9ICIyNDEsIDMwNCI7JEJUTi5TaXplID0gIjc1LCAyMyINCiAgICAkTGFiZWwuTG9jYXRpb24gPSAiOSwgOSI7JFRleHQuTG9jYXRpb24gPSAiOSwgMTM5IjskTGFiZWwuYWRkX2NsaWNrKHtUby1DbGlwYm9hcmQgKCRGb3JtLkNvbnRyb2xzLkZpbmQoIlF1ZXN0aW9uIiwkdHJ1ZSlbMF0udGV4dCl9KTskVGV4dC5hZGRfY2xpY2soe1RvLUNsaXBib2FyZCAoJEZvcm0uQ29udHJvbHMuRmluZCgiQW5zd2VyIiwkdHJ1ZSlbMF0udGV4dCl9KQ0KICAgICRGb3JtLk1pbmltaXplQm94ID0gJEZhbHNlOyRGb3JtLk1heGltaXplQm94ID0gJEZhbHNlOyRGb3JtLldpbmRvd1N0YXRlID0gIk5vcm1hbCINCiAgICAkRm9ybS5TaG93SW5UYXNrYmFyID0gJEZhbHNlOyRGb3JtLk9wYWNpdHkgPSAwLjg7JEZvcm0uU3RhcnRQb3NpdGlvbiA9ICJDZW50ZXJTY3JlZW4iOyRUZXh0Lk1hcmdpbj0iMywgMywgMywgMyINCiAgICAkRm9ybS5CYWNrQ29sb3IgPSAiT3JhbmdlIjskRm9ybS5JY29uID0gW3N5c3RlbS5kcmF3aW5nLmljb25dOjpFeHRyYWN0QXNzb2NpYXRlZEljb24oIiRQU0hPTUVccG93ZXJzaGVsbC5leGUiKQ0KICAgICRMYWJlbC5CYWNrQ29sb3IgPSAiTWFyb29uIjskVGV4dC5CYWNrQ29sb3IgPSAiUGFsZUdvbGRlbnJvZCINCiAgICAkTGFiZWwuRm9udCA9IE5ldy1PYmplY3QgU3lzdGVtLkRyYXdpbmcuRm9udCgiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLDEyLjI1LFtTeXN0ZW0uRHJhd2luZy5Gb250U3R5bGVdOjpyZWd1bGFyKQ0KICAgICRUZXh0LkZvbnQgPSBOZXctT2JqZWN0IFN5c3RlbS5EcmF3aW5nLkZvbnQoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwxMSxbU3lzdGVtLkRyYXdpbmcuRm9udFN0eWxlXTo6UmVndWxhcikNCiAgICAkTGFiZWwuVGV4dEFsaWduID0gIk1pZGRsZUNlbnRlciI7JEJUTi5tYXJnaW49IjMsIDMsIDMsIDMiOyRUZXh0Lk11bHRpTGluZT0kVHJ1ZQ0KICAgICRsYWJlbC5OYW1lID0gIlF1ZXN0aW9uIjskVGV4dC5OYW1lID0gIkFuc3dlciINCiAgICAkRm9ybS5Db250cm9scy5BZGQoJExhYmVsKTskRm9ybS5Db250cm9scy5BZGQoJFRleHQpOyRGb3JtLkNvbnRyb2xzLkFkZCgkQlROKQ0KICAgICRGb3JtLkFjY2VwdEJ1dHRvbiA9ICRCVE4NCn0KCmZ1bmN0aW9uIEFzay1PRS1RU1ROIHtwYXJhbSgkUSkNCg0KICAgIExvYWQtRm9ybXMNCiAgICAkRm9ybS5Db250cm9scy5GaW5kKCJBbnN3ZXIiLCR0cnVlKVswXS50ZXh0ID0gIiINCiAgICAkRm9ybS5Db250cm9scy5GaW5kKCJRdWVzdGlvbiIsJHRydWUpWzBdLnRleHQgPSAkUQ0KICAgICRGb3JtLlNob3dEaWFsb2coKSB8IE91dC1OdWxsDQogICAgcmV0dXJuICRGb3JtLkNvbnRyb2xzLkZpbmQoIkFuc3dlciIsJHRydWUpWzBdLnRleHQNCn0KClNldC1BbGlhcyA/OiBJbnZva2UtVGVybmFyeQ==")
# ========================================END=OF=COMPILER===========================================================|

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
AP-Require "Internet" {Write-AP "!Need Internet To Function!";exit}
AP-Require "dep:git" {Write-AP "!Need Git Integrated To Function!";exit}
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Set-Location $PSHell
$UserName = "avdaredevil@gmail.com"
$HashFile = "$PSHell\Git-Temp\Current-Versions.map"
$MapFile  = "$PSHell\Git-Temp\Git-Sources.map"
$PKGs = @{}

if (!(Test-Path "$PSHell\Git-Temp")) {md "$PSHell\Git-Temp" >$null;attrib +h "$PSHell\Git-Temp"}
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
        "@   [GitUser]/[GitRepo]|[Tool-Name]|[Src1;Src2;...]",
        "@ --------------------------------------------------------------------------|" | Out-File -Encoding Default "$PSHell\Git-Temp\$_.map"
    }
}
function Read-Maps {
    $index = 0;$Script:SrcMap = @{}
    [IO.File]::ReadAllLines($MapFile) | ? {$_[0] -ne "@"} | ? {$_ -match "^(?<GitHub>[^\|]+)\|(?<Name>[^\|]+)\|(?<Sources>.+)$"} | % {
        $Obj = @{"Name"  = $Matches.Name.trim()}
        $Obj.GitHub      = $Matches.GitHub.trim()
        $Obj.Dest        = $Matches.Github -replace "/","-"
        $Obj.ToCopy      = $Matches.Sources.split(";").trim()
        $Obj.Sources     = $Obj.ToCopy | % {
            $Root = Resolve-Path $PSHell
            $FullPath = Join-Path $Root $_
            if (!(Test-Path $FullPath)) {Write-AP "!Missing Source File: $_ for $($Obj.Name)";exit}
            if (Test-Path -PathType Leaf $FullPath) {return $_}
            Get-ChildItem -R -File $FullPath | % {$_.FullName -replace "$([Regex]::escape($Root))[\\\/]", ""}
        } | % {$_}
        $Script:Maps += ,[PSCustomObject]$Obj
        $Obj.Sources | % {$Script:SrcMap += @{$_ = $index}}
        $index++
    }
}
function GIT-SELF-AWARE ([String]$Folder) {
    Push-Location $Folder;$T = [Console]::ForegroundColor
    $END = {[Console]::ForegroundColor = $t;Pop-Location}
    $f = (Get-ChildItem *.* -ex "readme.md",".gitignore" | ? {$_.name -notmatch "^\."} | Get-Random).Name
    $Data = try {$Maps[$SrcMap[$f]]} catch {};if (!$Data) {Write-AP ">-Could Not get Data for this project, please add to MapFile.";$END.Invoke();return}
    if (!(Test-Path -type Container ".git")) {
        Write-AP ">*Initializing git for [$($Data.Name)]"
        $null = git init
    }
    $Repo = $Data.GitHub
    $RepoAddr = "git@github.com:$Repo.git"
    $HTTPRepoAddr = "https://github.com/$Repo.git"
    if (git ls-remote $HTTPRepoAddr 2>$null) {
        if (!(Test-Path "LICENSE") -or !(Test-Path "README.md")) {
            Write-AP ">*Issuing a pull request from [$($Data.GitHub)]"
            Remove-Item -Force -Recurse tt -ea SilentlyContinue
            $a = git clone $RepoAddr tt 2>&1
            if (!$?) {
                Write-AP ">!Could not fetch files from [$($Data.GitHub)]"
                $a | % {Write-AP ">>#$_"}
                return throw "EndInvoke"
            }
            Remove-Item .git -re -fo
            ls tt -Force | % {mv $_.FullName . -ea SilentlyContinue}

            Remove-Item -Force -Recurse tt -ea SilentlyContinue
            if ($a -match "failed|rejected|error") {$a}
        }
    }
    if (!(Test-Path -type Leaf "LICENSE")) {
        Write-AP ">*Issuing MIT LICENSE!"
        Invoke-RestMethod "https://raw.githubusercontent.com/avdaredevil/K9-BruteForcer/master/LICENSE" | Out-File -Encoding Default "LICENSE"
    }
    if (!(Test-Path -type Leaf "README.md")) {
        Write-AP ">*Creating a ReadMe!"
        [Console]::ForegroundColor = 3
        $Title = $Data.Name
        $Description = Ask-OE-QSTN "Enter a Description`n----------------------------------------"
        "$Title",("="*$Title.Length),"",$Description | Out-File -Encoding Default "README.md"
    }
    if (!(git ls-remote $HTTPRepoAddr 2>$null)) {
        Write-AP ">*Creating a GIT Repo as [$($Data.GitHub)]"
        # -------------------------------
        if (!$Script:Psw) {$Script:Psw = Psw-Prompt -Text (Tab-Text "Enter your GitHub Password : " 3) -ShowMaskedPsw -Mask 5 -ForceValidation -Validator {$Psw.Length -gt 6};[Console]::cursortop--;Clear-Line}
        if (!$Script:Psw) {Write-AP ">>!Password Prompt Canceled";$END.Invoke();return}
        $IE = New-Object -com InternetExplorer.Application;$IE.visible=1
        $IE.Navigate("https://github.com/login");Load-Internet $IE
        if ($IE.Document.getElementById("login_field")) {
            $IE.Document.getElementById("login_field").value = $UserName;$IE.Document.getElementById("password").value = $Psw;$IE.Document.getElementsByName("commit").item(0).click();sleep 1;Load-Internet $IE
            if ($IE.Document.getElementById("password")) {Write-AP ">>-Invalid Password";$END.Invoke();Return}
        }
        $IE.Navigate2("https://github.com/new");Load-Internet $IE
        $IE.Document.getElementById("repository_name").value = Split-Path -leaf $Data.GitHub
        $IE.Document.getElementById("repository_description").value = ?:(([IO.File]::ReadAllLines("$PWD\README.md") -join(";")) -match "==;(?<Data>.*)") {$Matches.Data.trim(";").replace(";",". ") -replace " {2,}"} {"Cool Project by Apoorv Verma [AP]"}
        $IE.Document.getElementsByTagName("button").item(1).click();Load-Internet $IE
        pause "Press enter when you're done making the repo . . ."
        # -------------------------------
        git add LICENSE,*.md 2>$null
        git commit -m "AP-GitHub Releaser Initialization Run"
        git remote add origin $RepoAddr
        git push --set-upstream origin master
        Write-AP ">>+Done! You should go add a tagline for your project on GitHub."
        $END.invoke();return
    }
    if (!((git remote -v 2>$null) -match "origin")) {
        Write-AP ">*Established Friendly-Name Connection for [$($Data.Name)]"
        git remote add origin "git@github.com:$($Data.GitHub).git"
    }
    if (!$AcceptAll) {[Console]::ForegroundColor = "Yellow";$inp = $(while ($True) {$a = (Input-Prompt (Tab-text "Are You Sure, you want to push your code up to GitHub : " 2)) -replace " +"," ";if ($a) {$a;break}})} else {$inp = "yes"}
    if ($Inp -match "y(a+h+|e\w+)|I am [^n]") {
        if (!$AcceptAll) {[Console]::CursorTop--;Clear-Line}
        [Console]::ForegroundColor = 3
        Write-AP ">*Pushing Code to GitHub"
        $null = git add . 2>$null
        $stat = git status 2>$null | Out-String
        if ($stat -match "nothing to commit" -and $stat -notmatch "ahead of") {Write-AP ">*No Changes needed.";$END.Invoke();return}
        if ($stat -match "ahead of") {Write-AP ">>!Seems to have code that has not yet been pushed, will include those commits"}
        $MSG = $Message
        if (!$MSG) {$MSG = Input-Prompt (Tab-Text "Enter a message to commit with : " 2);if (!$MSG.trim()) {$MSG = "Updated Code"}}
        $out = "|==========Pull===================`n"
        $out += git pull origin master 2>&1
        $out += "|==========ADD===================`n"
        $out += git add . 2>&1
        $out += "|==========Commit================`n"
        $Out += git commit -a -m $MSG 2>&1
        $out += "|==========Push==================`n"
        $Out += git push --set-upstream origin master 2>&1
        Write-AP $(if ($Out -notmatch "failed|rejected|conflict") {">+Success, Pushed Code up."} else {$Out})
    } else {if ($Inp) {[Console]::CursorTop--};Clear-Line}
    $END.Invoke()
}
function Write-Hashes {
    $Solved = @{}
    @($Hash.Keys) | % {$Solved.$_ = $False}
    $OLDData = [IO.File]::ReadAllLines($HashFile)
    $OLDData | % {
        if ($_[0] -eq "@") {return $_}
        $Name,$Hsh = $_.split("|").trim()
        $Solved.$Name = $True
        return "{0}|{1}" -f $Name,$Hash.$Name
    } | Out-File -Encoding Default $HashFile
    @($Solved.Keys) | ? {!$Solved.$_} | % {"{0}|{1}" -f $_,$Hash.$_} | Out-File -Encoding Default -Append $HashFile
}
function Read-Hashes {
    $Script:Hash = @{}
    [IO.File]::ReadAllLines($HashFile) | ? {$_[0] -ne "@"} | ? {$_ -match "(?<Key>[^\|]+)\|(?<Hash>\S+)"} | % {
        $Script:Hash += @{$Matches.Key = $Matches.Hash}
    }
}
function Get-Destination ($Entry, $File) {
    return Join-Path $PSHell "Git-Temp" $Entry.Dest $File
}
function Get-CachedHashLocation ($Entry, $File) {
    return "$($Entry.Name)@$($File)"
}
function Handle-Change ($Entry, $File) {
    $PKGs.($Entry.Name) = $Entry.Dest
    $CurrentPath = Join-Path $PSHell $File
    $NewPath = Get-Destination $Entry (Split-Path $File)
    $NewHash = Get-FileHash $CurrentPath

    Write-AP "+Copying Delta File for [$($Entry.Dest)\$File] -> [$($NewHash.split(':')[0,1,2] -join ':')...$($NewHash.split(':')[-3,-2,-1] -join ':')]"
    New-Item -ItemType Directory -ea SilentlyContinue $NewPath | Out-Null
    AP-Compile $CurrentPath $NewPath
    $Hash.(Get-CachedHashLocation $Entry $File) = $NewHash
}
Read-Maps
Read-Hashes
$Global:MM = $Script:Maps
foreach ($Entry in $Script:Maps) {
    $NewFold = "$PSHell\Git-Temp\$($Entry.Dest)"
    $NewPath = Get-Destination $Entry $File
    if (!(Test-Path -Type Container "$NewFold")) {
        Write-AP "*Creating Folder Structure for [$($Entry.Name)]"
        mkdir "$PSHell\Git-Temp\$($Entry.Dest)" | Out-Null
    }
    foreach ($FileOrFolder in $Entry.ToCopy) {
        if (Test-Path -type leaf $FileOrFolder) {continue} # Don't copy files
        if (Test-Path -type Container $NewFold) {continue} # Don't copy folders if they already exist
        Copy-Item $FileOrFolder $NewFold -Force -Recurse
    }
    foreach ($File in $Entry.Sources) {
        $CurrentPath = Join-Path $PSHell $File
        $NewPath = Join-Path $NewFold $File
        $CurrentHash = Get-FileHash "$CurrentPath" -ea SilentlyContinue
        $OldHash = $Hash.(Get-CachedHashLocation $Entry $File)

        if (!$OldHash) {
            Write-AP "*Creating Hash Entry for [$File]"
            Handle-Change $Entry $File
            continue
        }
        if (!(Test-Path -Type leaf $NewPath)) {
            Write-AP "*Indexing [$File] for git configurations"
            Handle-Change $Entry $File
            continue
        }
        if ($OldHash -ne $CurrentHash) {
            Write-AP "*Detected hash mismatch [$File]"
            Handle-Change $Entry $File
        }
    }
}

@($PKGs.Keys) | % {
    Write-AP "*Running Self Aware Git Commands for [$_]"
    GIT-SELF-AWARE "$PSHell\Git-Temp\$($PKGs.$_)"
}
if ($Script:psw) {Remove-Variable psw -scope Script}
Write-Hashes
