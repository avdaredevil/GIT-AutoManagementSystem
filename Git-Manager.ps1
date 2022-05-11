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
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gS2V5UHJlc3NlZENvZGUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bSW50XSRLZXksICRTdG9yZT0iXl5eIikNCg0KICAgIGlmICghJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlIC1hbmQgJFN0b3JlIC1lcSAiXl5eIikge1JldHVybiAkRmFsc2V9DQogICAgaWYgKCRTdG9yZSAtZXEgIl5eXiIpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIil9DQogICAgcmV0dXJuICgkS2V5IC1pbiAkU3RvcmUuVmlydHVhbEtleUNvZGUpDQp9CgpmdW5jdGlvbiBLZXlQcmVzc2VkIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ1tdXSRLZXksICRTdG9yZT0iXl5eIikNCg0KICAgIGlmICgkU3RvcmUgLWVxICJeXl4iIC1hbmQgJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlKSB7JFN0b3JlID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiSW5jbHVkZUtleVVwLE5vRWNobyIpfSBlbHNlIHtpZiAoJFN0b3JlIC1lcSAiXl5eIikge3JldHVybiAkRmFsc2V9fQ0KICAgICRBbnMgPSAkRmFsc2UNCiAgICAkS2V5IHwgJSB7DQogICAgICAgICRTT1VSQ0UgPSAkXw0KICAgICAgICB0cnkgew0KICAgICAgICAgICAgJEFucyA9ICRBbnMgLW9yIChLZXlQcmVzc2VkQ29kZSAkU09VUkNFICRTdG9yZSkNCiAgICAgICAgfSBjYXRjaCB7DQogICAgICAgICAgICBGb3JlYWNoICgkSyBpbiAkU09VUkNFKSB7DQogICAgICAgICAgICAgICAgW1N0cmluZ10kSyA9ICRLDQogICAgICAgICAgICAgICAgaWYgKCRLLmxlbmd0aCAtZ3QgNCAtYW5kICgkS1swLDEsLTEsLTJdIC1qb2luKCIiKSkgLWVxICJ+fn5+Iikgew0KICAgICAgICAgICAgICAgICAgICAkQW5zID0gJEFOUyAtb3IgKEtleVByZXNzZWRDb2RlIChLZXlUcmFuc2xhdGUoJEspKSAkU3RvcmUpDQogICAgICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICAgICAgJEFucyA9ICRBTlMgLW9yICgkSy5jaGFycygwKSAtaW4gJFN0b3JlLkNoYXJhY3RlcikNCiAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQogICAgcmV0dXJuICRBbnMNCn0KCmZ1bmN0aW9uIFdyaXRlLUFQIHsNCiAgICBbQ21kbGV0QmluZGluZygpXQ0KICAgIHBhcmFtKFtQYXJhbWV0ZXIoVmFsdWVGcm9tUGlwZWxpbmU9JHRydWUsIE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsW1N3aXRjaF0kTm9TaWduLFtTd2l0Y2hdJFBsYWluVGV4dCxbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JyxbU3dpdGNoXSRQYXNzVGhydSkNCiAgICBiZWdpbiB7JFRUID0gQCgpfQ0KICAgIFByb2Nlc3MgeyRUVCArPSAsJFRleHR9DQogICAgRU5EIHsNCiAgICAgICAgJEJsdWUgPSAkKGlmICgkV1JJVEVfQVBfTEVHQUNZX0NPTE9SUyl7M31lbHNleydCbHVlJ30pDQogICAgICAgIGlmICgkVFQuY291bnQgLWVxIDEpIHskVFQgPSAkVFRbMF19OyRUZXh0ID0gJFRUDQogICAgICAgIGlmICgkdGV4dC5jb3VudCAtZ3QgMSAtb3IgJHRleHQuR2V0VHlwZSgpLk5hbWUgLW1hdGNoICJcW1xdJCIpIHsNCiAgICAgICAgICAgIHJldHVybiAkVGV4dCB8ID8geyIkXyJ9IHwgJSB7DQogICAgICAgICAgICAgICAgV3JpdGUtQVAgJF8gLU5vU2lnbjokTm9TaWduIC1QbGFpblRleHQ6JFBsYWluVGV4dCAtQWxpZ24gJEFsaWduIC1QYXNzVGhydTokUGFzc1RocnUNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgICAgICBpZiAoISR0ZXh0IC1vciAkdGV4dCAtbm90bWF0Y2ggIl4oKD88Tk5MPngpfCg/PE5TPm5zPykpezAsMn0oPzx0Plw+KikoPzxzPlsrXC0hXCpcI1xAX10pKD88dz4uKikiKSB7cmV0dXJuICRUZXh0fQ0KICAgICAgICAkdGIgID0gIiAgICAiKiRNYXRjaGVzLnQubGVuZ3RoDQogICAgICAgICRDb2wgPSBAeycrJz0nMic7Jy0nPScxMic7JyEnPScxNCc7JyonPSRCbHVlOycjJz0nRGFya0dyYXknOydAJz0nR3JheSc7J18nPSd3aGl0ZSd9WygkU2lnbiA9ICRNYXRjaGVzLlMpXQ0KICAgICAgICBpZiAoISRDb2wpIHtUaHJvdyAiSW5jb3JyZWN0IFNpZ24gWyRTaWduXSBQYXNzZWQhIn0NCiAgICAgICAgJFNpZ24gPSAkKGlmICgkTm9TaWduIC1vciAkTWF0Y2hlcy5OUykgeyIifSBlbHNlIHsiWyRTaWduXSAifSkNCiAgICAgICAgQVAtUmVxdWlyZSAiZnVuY3Rpb246QWxpZ24tVGV4dCIge2Z1bmN0aW9uIEdsb2JhbDpBbGlnbi1UZXh0KCRhbGlnbiwkdGV4dCkgeyR0ZXh0fX0NCiAgICAgICAgJERhdGEgPSAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIjtpZiAoISREYXRhKSB7cmV0dXJufQ0KICAgICAgICAkRGF0YSA9IEFsaWduLVRleHQgLUFsaWduICRBbGlnbiAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIg0KICAgICAgICBpZiAoJFBsYWluVGV4dCkge3JldHVybiAkRGF0YX0NCiAgICAgICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiQoW2Jvb2xdJE1hdGNoZXMuTk5MKSAtZiAkQ29sICREYXRhDQogICAgICAgIGlmICgkUGFzc1RocnUpIHtyZXR1cm4gJERhdGF9DQogICAgfQ0KfQoKZnVuY3Rpb24gUHN3LVByb21wdCB7cGFyYW0oW0FsaWFzKCJQcm9tcHQiKV1bU3RyaW5nXSRUZXh0ID0gIkVudGVyIFBhc3N3b3JkIDogIiwgW1N3aXRjaF0kU2hvd01hc2tlZFBzdywgW2NoYXJdJE1hc2s9ODIyNiwgW1N3aXRjaF0kRm9yY2VWYWxpZGF0aW9uLCBbc2NyaXB0YmxvY2tdJFZhbGlkYXRvcj17M30pDQoNCiAgICBXcml0ZS1ob3N0IC1ub25ld2xpbmUgJFRleHQNCiAgICAkUmVSZWdYID0gJ1teXHgwMS1ceDA4XHgxMC1ceDgwXSsnIydbXlx3XC5dJw0KICAgICRQc3cgPSAiIg0KICAgICRpUG9zeCA9IFtDb25zb2xlXTo6Q3Vyc29yTGVmdA0KICAgICRpUG9zeSA9IFtDb25zb2xlXTo6Q3Vyc29yVG9wDQogICAgJEN2aXMgPSBbQ29uc29sZV06OkN1cnNvclZpc2libGUNCiAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkRmFsc2UNCiAgICBpZiAoISRTaG93TWFza2VkUHN3KSB7JFZhbGlkYXRvcj17M319DQogICAgJENvdW50ID0gMTskU2xlZXAgPSAwDQogICAgV2hpbGUgKCRUcnVlKSB7DQogICAgICAgIGlmICgkY291bnQgLWd0IDI1MCkgeyRTbGVlcCA9IDI1MH0NCiAgICAgICAgJFRlc3QgPSAmJFZhbGlkYXRvcg0KICAgICAgICBpZiAoJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlKSB7JFN0b3JlID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiSW5jbHVkZUtleURvd24sTm9FY2hvIik7JENvdW50PTA7JFNsZWVwPTB9IGVsc2UgeyRDb3VudCsrO1N0YXJ0LVNsZWVwIC1tICRTbGVlcDtjb250aW51ZX0NCiAgICAgICAgaWYgKEtleVByZXNzZWQgIn5+QmFja1NwYWNlfn4iICRTdG9yZSkge2lmICgkc3RvcmUuQ29udHJvbEtleVN0YXRlIC1tYXRjaCAiY3RybCIpIHskUHN3PSIifSBlbHNlIHskUHN3ID0gPzogKCRQc3cuTGVuZ3RoIC1lcSAwKXsiIn17JFBzdy5zdWJzdHJpbmcoMCwkUHN3Lkxlbmd0aC0xKX19fQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+U3BhY2V+fiIgJFN0b3JlKSB7JFBzdyArPSAiICJ9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5Fc2NhcGV+fiIgJFN0b3JlKSB7JHBzdz0iIjticmVha30NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+fkVOVEVSfn4iICRTdG9yZSkge1dyaXRlLUhvc3QgIiI7aWYgKFtpbnRdJFRlc3QgLW5lIDMpIHtpZiAoJFRlc3QgLW9yICEkRm9yY2VWYWxpZGF0aW9uKSB7YnJlYWt9IGVsc2Uge1dyaXRlLUhvc3QgLWYgWWVsbG93IC1Ob05ld0xpbmUgIk11c3QgVHlwZSBpbiBhIHZhbGlkIFBhc3N3b3JkLi4uIjtzdGFydC1zbGVlcCAtcyAyO0NsZWFyLUxpbmU7W0NvbnNvbGVdOjpDdXJzb3JUb3AtPTF9fWVsc2V7YnJlYWt9fSBlbHNlIA0KICAgICAgICB7JFBzdyArPSAkU3RvcmUuQ2hhcmFjdGVyIC1yZXBsYWNlICgkUmVSZWdYLCcnKX0NCiAgICAgICAgaWYgKCRTaG93TWFza2VkUHN3KSB7DQogICAgICAgICAgICAkd3QgPSBbQ29uc29sZV06OkJ1ZmZlcldpZHRoIC0gJGlQb3N4IC0gMQ0KICAgICAgICAgICAgJFRlc3QgPSAmJFZhbGlkYXRvcg0KICAgICAgICAgICAgW0NvbnNvbGVdOjpDdXJzb3JsZWZ0ID0gJGlQb3N4DQogICAgICAgICAgICBpZiAoJHd0IC0gJFBzdy5MZW5ndGggLWx0IDApIHskdGI9IiI7JHR0PSIkTWFzayIqKCR3dC0zKSsiLi4uIn0gZWxzZSB7JHRiPSIgIiooJHd0LSRQc3cuTGVuZ3RoKTskdHQ9IiRNYXNrIiokUHN3Lkxlbmd0aH0NCiAgICAgICAgICAgICRmY29sID0gW2NvbnNvbGVdOjpGb3JlZ3JvdW5kQ29sb3INCiAgICAgICAgICAgIGlmIChbaW50XSRUZXN0IC1uZSAzKSB7DQogICAgICAgICAgICAgICAgJGZDb2wgPSA/OigkVGVzdCkgezJ9IHsicmVkIn0NCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAtZiAkZkNvbCAkdHQkdGINCiAgICAgICAgfQ0KICAgIH0NCiAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkQ3Zpcw0KICAgIHJldHVybiAkcHN3DQp9CgpmdW5jdGlvbiBTdHJpcC1Db2xvckNvZGVzIHtwYXJhbSgkU3RyKQ0KDQogICAgJFN0ciB8ICUgeyRfIC1yZXBsYWNlICIkKFtyZWdleF06OmVzY2FwZSgiJChHZXQtRXNjYXBlKVsiKSlcZCsoXDtcZCspKm0iLCIifQ0KfQoKZnVuY3Rpb24gR2V0LVBhdGgge3BhcmFtKCRtYXRjaCwgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIikNCg0KICAgICRQdGggPSBbRW52aXJvbm1lbnRdOjpHZXRFbnZpcm9ubWVudFZhcmlhYmxlKCRQYXRoVmFyKQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgICRQYXRoU2VwID0gJChpZiAoJElzVW5peCkgeyI6In0gZWxzZSB7IjsifSkNCiAgICBpZiAoISRQdGgpIHtyZXR1cm4gQCgpfQ0KICAgIFNldC1QYXRoICRQdGggLVBhdGhWYXIgJFBhdGhWYXINCiAgICAkZCA9ICgkUHRoKS5zcGxpdCgkUGF0aFNlcCkNCiAgICBpZiAoJG1hdGNoKSB7JGQgLW1hdGNoICRtYXRjaH0gZWxzZSB7JGR9DQp9CgpmdW5jdGlvbiBMb2FkLUludGVybmV0IHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldJElFLCBbSW50XSRJbnRlcnZhbCA9IDUwKQ0KDQogICAgV2hpbGUgKCRJRS5CdXN5KSB7DQogICAgICAgIFN0YXJ0LVNsZWVwIC1tICRJbnRlcnZhbA0KICAgIH0NCn0KCmZ1bmN0aW9uIFRhYi1UZXh0IHtwYXJhbShbU3RyaW5nXSRUZXh0LCBbaW50XSROdW1UYWJzPTEsIFtpbnRdJFRhYlNpemUgPSA0LCBbY2hhcl0kVGFiQ2hhciA9ICIgIikNCg0KICAgICRUYWIgPSAoIiRUYWJDaGFyIiokVGFiU2l6ZSkqJE51bVRhYnM7JGluZGV4PTANCiAgICAkV2luID0gW0NvbnNvbGVdOjpCdWZmZXJXaWR0aC0xOyRTdHIgPSAiIg0KICAgIGZvcmVhY2ggKCRjIGluICRUZXh0LlRvQ2hhckFycmF5KCkpIHsNCiAgICAgICAgaWYgKCEoJEluZGV4JSRXaW4pKSB7JFN0ciArPSAkVGFiOyRJbmRleCs9JFRhYi5MZW5ndGh9DQogICAgICAgICRTdHIgKz0gJGMNCiAgICAgICAgJGluZGV4KysNCiAgICB9DQogICAgcmV0dXJuICRTdHINCn0KCmZ1bmN0aW9uIEdldC1XaGVyZSB7DQogICAgW0NtZGxldEJpbmRpbmcoRGVmYXVsdFBhcmFtZXRlclNldE5hbWU9Ik5vcm1hbCIpXQ0KICAgIHBhcmFtKA0KICAgICAgICBbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSwgUG9zaXRpb249MCldW3N0cmluZ10kRmlsZSwNCiAgICAgICAgW1N3aXRjaF0kQWxsLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J05vcm1hbCcpXVtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtTd2l0Y2hdJE1hbnVhbFNjYW4sDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtTd2l0Y2hdJERiZywNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIg0KICAgICkNCiAgICAkSXNWZXJib3NlID0gJERiZyAtb3IgJFBTQm91bmRQYXJhbWV0ZXJzLkNvbnRhaW5zS2V5KCdWZXJib3NlJykgLW9yICRQU0JvdW5kUGFyYW1ldGVycy5Db250YWluc0tleSgnRGVidWcnKQ0KICAgICRXaGVyZUJpbkV4aXN0cyA9IEdldC1Db21tYW5kICJ3aGVyZSIgLWVhIFNpbGVudGx5Q29udGludWUNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICBpZiAoJEZpbGUgLWVxICJ3aGVyZSIgLW9yICRGaWxlIC1lcSAid2hlcmUuZXhlIikge3JldHVybiAkV2hlcmVCaW5FeGlzdHN9DQogICAgaWYgKCRXaGVyZUJpbkV4aXN0cyAtYW5kICEkTWFudWFsU2Nhbikgew0KICAgICAgICAkT3V0PSRudWxsDQogICAgICAgIGlmICgkSXNVbml4KSB7DQogICAgICAgICAgICAkT3V0ID0gd2hpY2ggJGZpbGUgMj4kbnVsbA0KICAgICAgICB9IGVsc2UgeyRPdXQgPSB3aGVyZS5leGUgJGZpbGUgMj4kbnVsbH0NCiAgICAgICAgDQogICAgICAgIGlmICghJE91dCkge3JldHVybn0NCiAgICAgICAgaWYgKCRBbGwpIHtyZXR1cm4gJE91dH0NCiAgICAgICAgcmV0dXJuIEAoJE91dClbMF0NCiAgICB9DQogICAgZm9yZWFjaCAoJEZvbGRlciBpbiAoR2V0LVBhdGggLVBhdGhWYXIgJFBhdGhWYXIpKSB7DQogICAgICAgIGlmICgkSXNVbml4KSB7DQogICAgICAgICAgICAkTG9va3VwID0gIiRGb2xkZXIvJEZpbGUiDQogICAgICAgICAgICBpZiAoJElzVmVyYm9zZSkge1dyaXRlLUFQICIqQ2hlY2tpbmcgWyRMb29rdXBdIn0NCiAgICAgICAgICAgIGlmICghKFRlc3QtUGF0aCAtUGF0aFR5cGUgTGVhZiAkTG9va3VwKSkge2NvbnRpbnVlfQ0KICAgICAgICAgICAgUmVzb2x2ZS1QYXRoICRMb29rdXAgfCAlIFBhdGgNCiAgICAgICAgICAgIGlmICghJEFsbCkge3JldHVybn0NCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIGZvcmVhY2ggKCRFeHRlbnNpb24gaW4gKEdldC1QYXRoIC1QYXRoVmFyIFBBVEhFWFQpKSB7DQogICAgICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlJEV4dGVuc2lvbiINCiAgICAgICAgICAgICAgICBpZiAoJElzVmVyYm9zZSkge1dyaXRlLUFQICIqQ2hlY2tpbmcgWyRMb29rdXBdIn0NCiAgICAgICAgICAgICAgICBpZiAoIShUZXN0LVBhdGggLVBhdGhUeXBlIExlYWYgJExvb2t1cCkpIHtjb250aW51ZX0NCiAgICAgICAgICAgICAgICBSZXNvbHZlLVBhdGggJExvb2t1cCB8ICUgUGF0aA0KICAgICAgICAgICAgICAgIGlmICghJEFsbCkge3JldHVybn0NCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIEdldC1GaWxlSGFzaCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmddJEZpbGUpDQoNCiAgICBpZiAoIShUZXN0LVBhdGggLXR5cGUgbGVhZiAkRmlsZSkpIHtUaHJvdyAiW0dldC1GaWxlSGFzaF0gRmlsZSBbJEZpbGVdIE5vdCBmb3VuZCJ9DQogICAgJEZpbGUgPSAiezB9IiAtZiAoUmVzb2x2ZS1QYXRoICRGaWxlKQ0KICAgICRhID0gW1N5c3RlbS5TZWN1cml0eS5DcnlwdG9ncmFwaHkuTUQ1XTo6Q3JlYXRlKCkNCiAgICAkSGFzaCA9ICRhLkNvbXB1dGVIYXNoKFtJTy5GaWxlXTo6UmVhZEFsbEJ5dGVzKCRGaWxlKSkgLWpvaW4gIjoiDQogICAgJGEuRGlzcG9zZSgpDQogICAgUmV0dXJuICRIYXNoDQp9CgpmdW5jdGlvbiBBUC1Db252ZXJ0UGF0aCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmddJFBhdGgpDQoNCiAgICByZXR1cm4gJFBhdGggLXJlcGxhY2UgDQogICAgICAgICI8RGVwPiIsIjxMaWI+XERlcGVuZGVuY2llcyIgLXJlcGxhY2UgDQogICAgICAgICI8TGliPiIsIjxIb21lPlxBUC1MaWJyYXJpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPENvbXAob25lbnRzKT8+IiwiPEhvbWU+XEFQLUNvbXBvbmVudHMiIC1yZXBsYWNlIA0KICAgICAgICAiPEhvbWU+IiwkUFNIZWxsfQoKZnVuY3Rpb24gSW5wdXQtUHJvbXB0IHtwYXJhbShbVmFsaWRhdGVOb3ROdWxsb3JFbXB0eSgpXVtTdHJpbmddJFByb21wdCA9ICJFbnRlciBUZXh0IDogIikNCg0KICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAkUHJvbXB0DQogICAgJFJlUmVnWCA9ICdbXlx4MDEtXHgwOFx4MTAtXHg4MF0rJyMnW15cd1wuXScgW9CQLdGP0IHRkV0NCiAgICAkVHJTdHJpbmcgPSAiIg0KICAgICRpUG9zeCA9IFtDb25zb2xlXTo6Q3Vyc29yTGVmdA0KICAgICRpUG9zeSA9IFtDb25zb2xlXTo6Q3Vyc29yVG9wDQogICAgJEN2aXMgPSBbQ29uc29sZV06OkN1cnNvclZpc2libGUNCiAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkRmFsc2UNCiAgICAkQ291bnQgPSAxOyRTbGVlcCA9IDANCiAgICBXaGlsZSAoJFRydWUpIHsNCiAgICAgICAgaWYgKCRjb3VudCAtZ3QgNTAwKSB7JFNsZWVwID0gMTAwfQ0KICAgICAgICBpZiAoJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlKSB7JFN0b3JlID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiSW5jbHVkZUtleURvd24sTm9FY2hvIik7JENvdW50PTA7JFNsZWVwPTB9IGVsc2UgeyRDb3VudCsrO1N0YXJ0LVNsZWVwIC1tICRTbGVlcDtjb250aW51ZX0NCiAgICAgICAgaWYgKEtleVByZXNzZWQgIn5+QmFja1NwYWNlfn4iICRTdG9yZSkge2lmICgkc3RvcmUuQ29udHJvbEtleVN0YXRlIC1tYXRjaCAiY3RybCIpIHskVHJTdHJpbmc9IiJ9IGVsc2UgeyRUclN0cmluZyA9ID86ICgkVHJTdHJpbmcuTGVuZ3RoIC1lcSAwKXsiIn17JFRyU3RyaW5nLnN1YnN0cmluZygwLCRUclN0cmluZy5MZW5ndGgtMSl9fX0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+flNwYWNlfn4iICRTdG9yZSkgeyRUclN0cmluZyArPSAiICJ9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5Fc2NhcGV+fiIgJFN0b3JlKSB7JFRyU3RyaW5nPSIiO2JyZWFrfQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+RU5URVJ+fiIgJFN0b3JlKSB7V3JpdGUtSG9zdCAiIjticmVha30gZWxzZSANCiAgICAgICAgeyRUclN0cmluZyArPSAkU3RvcmUuQ2hhcmFjdGVyIC1yZXBsYWNlICgkUmVSZWdYLCcnKX0NCiAgICAgICAgJHd0ID0gW0NvbnNvbGVdOjpCdWZmZXJXaWR0aCAtICRpUG9zeCAtIDENCiAgICAgICAgW0NvbnNvbGVdOjpDdXJzb3JsZWZ0ID0gJGlQb3N4DQogICAgICAgIFtDb25zb2xlXTo6Q3Vyc29yVG9wID0gJGlQb3N5DQogICAgICAgIGlmICgkd3QtJFRyU3RyaW5nLkxlbmd0aCAtbHQgMCkgew0KICAgICAgICAgICAgJHRiPSIiDQogICAgICAgICAgICAkdHQ9Ii4uLiIrJFRyU3RyaW5nLnN1YnN0cmluZygkVHJTdHJpbmcuTGVuZ3RoLSR3dCszKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgJHRiPSIgIiooJHd0LSRUclN0cmluZy5MZW5ndGgpDQogICAgICAgICAgICAkdHQ9JFRyU3RyaW5nDQogICAgICAgIH0NCiAgICAgICAgJGZjb2wgPSBbY29uc29sZV06OkZvcmVncm91bmRDb2xvcg0KICAgICAgICBXcml0ZS1ob3N0IC1ub25ld2xpbmUgLWYgJGZDb2wgJHR0JFRiDQogICAgfQ0KICAgIFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZSA9ICRDdmlzDQogICAgcmV0dXJuICRUUlN0cmluZw0KfQoKZnVuY3Rpb24gQXNrLU9FLVFTVE4ge3BhcmFtKCRRKQ0KDQogICAgTG9hZC1Gb3Jtcw0KICAgICRGb3JtLkNvbnRyb2xzLkZpbmQoIkFuc3dlciIsJHRydWUpWzBdLnRleHQgPSAiIg0KICAgICRGb3JtLkNvbnRyb2xzLkZpbmQoIlF1ZXN0aW9uIiwkdHJ1ZSlbMF0udGV4dCA9ICRRDQogICAgJEZvcm0uU2hvd0RpYWxvZygpIHwgT3V0LU51bGwNCiAgICByZXR1cm4gJEZvcm0uQ29udHJvbHMuRmluZCgiQW5zd2VyIiwkdHJ1ZSlbMF0udGV4dA0KfQoKZnVuY3Rpb24gTG9hZC1Gb3JtcyB7DQogICAgaWYgKCRGb3JtKSB7cmV0dXJufQ0KICAgIEFkZC1UeXBlIC1Bc3NlbWJseU5hbWUgU3lzdGVtLldpbmRvd3MuRm9ybXMNCiAgICAkU2NyaXB0OkZvcm0gPSBOZXctT2JqZWN0IHN5c3RlbS5XaW5kb3dzLkZvcm1zLkZvcm0NCiAgICAkRm9ybS5UZXh0ID0gIkVudGVyIElucHV0IGZvciBRdWVzdGlvbiI7JEZvcm0uU2l6ZSA9ICI1ODgsIDM3MiINCiAgICAkTGFiZWwgPSBOZXctT2JqZWN0IFN5c3RlbS5XaW5kb3dzLkZvcm1zLkxhYmVsOyRUZXh0ID0gTmV3LU9iamVjdCBTeXN0ZW0uV2luZG93cy5Gb3Jtcy5UZXh0Qm94OyRCVE4gPSBOZXctT2JqZWN0IFN5c3RlbS5XaW5kb3dzLkZvcm1zLkJ1dHRvbjskQlROLk5hbWUgPSAiZXhpdHMiOyRCVE4uVGV4dCA9ICJTdWJtaXQiDQogICAgJExhYmVsLlNpemUgPSAiNTUxLCAxMjciOyRUZXh0LlNpemUgPSAiNTQ4LCAxNTkiOyRMYWJlbC5Gb3JlQ29sb3IgPSAiU25vdyI7JEJUTi5hZGRfY2xpY2soeyRGb3JtLkNsb3NlKCl9KTskQlROLkxvY2F0aW9uID0gIjI0MSwgMzA0IjskQlROLlNpemUgPSAiNzUsIDIzIg0KICAgICRMYWJlbC5Mb2NhdGlvbiA9ICI5LCA5IjskVGV4dC5Mb2NhdGlvbiA9ICI5LCAxMzkiOyRMYWJlbC5hZGRfY2xpY2soe1RvLUNsaXBib2FyZCAoJEZvcm0uQ29udHJvbHMuRmluZCgiUXVlc3Rpb24iLCR0cnVlKVswXS50ZXh0KX0pOyRUZXh0LmFkZF9jbGljayh7VG8tQ2xpcGJvYXJkICgkRm9ybS5Db250cm9scy5GaW5kKCJBbnN3ZXIiLCR0cnVlKVswXS50ZXh0KX0pDQogICAgJEZvcm0uTWluaW1pemVCb3ggPSAkRmFsc2U7JEZvcm0uTWF4aW1pemVCb3ggPSAkRmFsc2U7JEZvcm0uV2luZG93U3RhdGUgPSAiTm9ybWFsIg0KICAgICRGb3JtLlNob3dJblRhc2tiYXIgPSAkRmFsc2U7JEZvcm0uT3BhY2l0eSA9IDAuODskRm9ybS5TdGFydFBvc2l0aW9uID0gIkNlbnRlclNjcmVlbiI7JFRleHQuTWFyZ2luPSIzLCAzLCAzLCAzIg0KICAgICRGb3JtLkJhY2tDb2xvciA9ICJPcmFuZ2UiOyRGb3JtLkljb24gPSBbc3lzdGVtLmRyYXdpbmcuaWNvbl06OkV4dHJhY3RBc3NvY2lhdGVkSWNvbigiJFBTSE9NRVxwb3dlcnNoZWxsLmV4ZSIpDQogICAgJExhYmVsLkJhY2tDb2xvciA9ICJNYXJvb24iOyRUZXh0LkJhY2tDb2xvciA9ICJQYWxlR29sZGVucm9kIg0KICAgICRMYWJlbC5Gb250ID0gTmV3LU9iamVjdCBTeXN0ZW0uRHJhd2luZy5Gb250KCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsMTIuMjUsW1N5c3RlbS5EcmF3aW5nLkZvbnRTdHlsZV06OnJlZ3VsYXIpDQogICAgJFRleHQuRm9udCA9IE5ldy1PYmplY3QgU3lzdGVtLkRyYXdpbmcuRm9udCgiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLDExLFtTeXN0ZW0uRHJhd2luZy5Gb250U3R5bGVdOjpSZWd1bGFyKQ0KICAgICRMYWJlbC5UZXh0QWxpZ24gPSAiTWlkZGxlQ2VudGVyIjskQlROLm1hcmdpbj0iMywgMywgMywgMyI7JFRleHQuTXVsdGlMaW5lPSRUcnVlDQogICAgJGxhYmVsLk5hbWUgPSAiUXVlc3Rpb24iOyRUZXh0Lk5hbWUgPSAiQW5zd2VyIg0KICAgICRGb3JtLkNvbnRyb2xzLkFkZCgkTGFiZWwpOyRGb3JtLkNvbnRyb2xzLkFkZCgkVGV4dCk7JEZvcm0uQ29udHJvbHMuQWRkKCRCVE4pDQogICAgJEZvcm0uQWNjZXB0QnV0dG9uID0gJEJUTg0KfQoKZnVuY3Rpb24gQ2xlYXItTGluZSB7DQogICAgJE5tID0gW0NvbnNvbGVdOjpXaW5kb3dXaWR0aA0KICAgICR0ID0gW0NvbnNvbGVdOjpDdXJzb3JUb3A7W0NvbnNvbGVdOjpDdXJzb3JMZWZ0PTANCiAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmUgKCIgIiokTk0pDQogICAgW0NvbnNvbGVdOjpDdXJzb3JUb3A9JHQ7W0NvbnNvbGVdOjpDdXJzb3JMZWZ0PTANCn0KCmZ1bmN0aW9uIEFQLVJlcXVpcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bQWxpYXMoIkZ1bmN0aW9uYWxpdHkiLCJMaWJyYXJ5IildW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbCwgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICAkTG9hZE1vZHVsZSA9IHsNCiAgICAgICAgcGFyYW0oJEZpbGUsW2Jvb2xdJEltcG9ydCkNCiAgICAgICAgdHJ5IHtJbXBvcnQtTW9kdWxlICRGaWxlIC1lYSBzdG9wO3JldHVybiAxfSBjYXRjaCB7fQ0KICAgICAgICAkTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7JExGID0gIiRMaWJcJEZpbGUiDQogICAgICAgIFtzdHJpbmddJGYgPSBpZih0ZXN0LXBhdGggLXQgbGVhZiAkTEYpeyRMRn1lbHNlaWYodGVzdC1wYXRoIC10IGxlYWYgIiRMRi5kbGwiKXsiJExGLmRsbCJ9DQogICAgICAgIGlmICgkZiAtYW5kICRJbXBvcnQpIHtJbXBvcnQtTW9kdWxlICRmfQ0KICAgICAgICByZXR1cm4gJGYNCiAgICB9DQogICAgJFN0YXQgPSAkKHN3aXRjaCAtcmVnZXggKCRMaWIudHJpbSgpKSB7DQogICAgICAgICJeSW50ZXJuZXQiICAgICAgICAgICAgICAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5kZXA6KC4qKSIgICAgICAgICAgICAgICB7R2V0LVdoZXJlICRNYXRjaGVzWzFdfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKTooLiopIiAgICAgIHskTG9hZE1vZHVsZS5pbnZva2UoJE1hdGNoZXNbMl0sICR0cnVlKX0NCiAgICAgICAgIl4obGlifG1vZHVsZSlfdGVzdDooLiopIiB7JExvYWRNb2R1bGUuaW52b2tlKCRNYXRjaGVzWzJdKX0NCiAgICAgICAgIl5mdW5jdGlvbjooLiopIiAgICAgICAgICB7Z2NtICRNYXRjaGVzWzFdIC1lYSBTaWxlbnRseUNvbnRpbnVlfQ0KICAgICAgICAiXnN0cmljdF9mdW5jdGlvbjooLiopIiAgIHtUZXN0LVBhdGggIkZ1bmN0aW9uOlwkKCRNYXRjaGVzWzFdKSJ9DQogICAgICAgIGRlZmF1bHQge1dyaXRlLUFQICIhSW52YWxpZCBzZWxlY3RvciBwcm92aWRlZCBbJCgiJExpYiIuc3BsaXQoJzonKVswXSldIjt0aHJvdyAnQkFEX1NFTEVDVE9SJ30NCiAgICB9KQ0KICAgIGlmICghJFN0YXQgLWFuZCAkT25GYWlsKSB7JE9uRmFpbC5JbnZva2UoKX0NCiAgICBpZiAoJFBhc3NUaHJ1IC1vciAhJE9uRmFpbCkge3JldHVybiAkU3RhdH0NCn0KCmZ1bmN0aW9uIFRvLUNsaXBib2FyZCB7cGFyYW0oW1BhcmFtZXRlcihWYWx1ZUZyb21QaXBlbGluZT0kdHJ1ZSldJFRleHQpDQoNCiAgICBbU3RyaW5nXSRUZXh0ID0gJFRleHQgLWpvaW4gImBuIg0KICAgIGlmICghJFRleHQudHJpbSgpKSB7JFRleHQgPSAiICJ9DQogICAgQWRkLVR5cGUgLWFzIFN5c3RlbS5XaW5kb3dzLkZvcm1zDQogICAgW1N5c3RlbS5XaW5kb3dzLkZvcm1zLkNsaXBib2FyZF06OlNldFRleHQoJFRleHQpDQp9CgpmdW5jdGlvbiBHZXQtRXNjYXBlIHtbQ2hhcl0weDFifQoKZnVuY3Rpb24gQWxpZ24tVGV4dCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJykNCg0KICAgIGlmICgkVGV4dC5jb3VudCAtZ3QgMSkgew0KICAgICAgICAkYW5zID0gQCgpDQogICAgICAgIGZvcmVhY2ggKCRsbiBpbiAkVGV4dCkgeyRBbnMgKz0gQWxpZ24tVGV4dCAkbG4gJEFsaWdufQ0KICAgICAgICByZXR1cm4gKCRhbnMpDQogICAgfSBlbHNlIHsNCiAgICAgICAgJFdpblNpemUgPSBbY29uc29sZV06OkJ1ZmZlcldpZHRoDQogICAgICAgICRDbGVhblRleHRTaXplID0gKFN0cmlwLUNvbG9yQ29kZXMgKCIiKyRUZXh0KSkuTGVuZ3RoDQogICAgICAgIGlmICgkQ2xlYW5UZXh0U2l6ZSAtZ2UgJFdpblNpemUpIHsNCiAgICAgICAgICAgICRBcHBlbmRlciA9IEAoIiIpOw0KICAgICAgICAgICAgJGogPSAwDQogICAgICAgICAgICBmb3JlYWNoICgkcCBpbiAwLi4oJENsZWFuVGV4dFNpemUtMSkpew0KICAgICAgICAgICAgICAgIGlmICgoJHArMSklJHdpbnNpemUgLWVxIDApIHskaisrOyRBcHBlbmRlciArPSAiIn0NCiAgICAgICAgICAgICAgICAjICIiKyRqKyIgLSAiKyRwDQogICAgICAgICAgICAgICAgJEFwcGVuZGVyWyRqXSArPSAkVGV4dC5jaGFycygkcCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIHJldHVybiAoQWxpZ24tVGV4dCAkQXBwZW5kZXIgJEFsaWduKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgaWYgKCRBbGlnbiAtZXEgIkNlbnRlciIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIipbbWF0aF06OnRydW5jYXRlKCgkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZSkvMikrJFRleHQpDQogICAgICAgICAgICB9IGVsc2VpZiAoJEFsaWduIC1lcSAiUmlnaHQiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqKCRXaW5TaXplLSRDbGVhblRleHRTaXplLTEpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCRUZXh0KQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gS2V5VHJhbnNsYXRlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kS2V5KQ0KDQogICAgJEhhc2hLZXkgPSBAew0KICAgICAgICAifn5DdHJsQ35+Ij02Nw0KICAgICAgICAifn5TcGFjZX5+Ij0zMg0KICAgICAgICAifn5FU0NBUEV+fiI9MjcNCiAgICAgICAgIn5+RW50ZXJ+fiI9MTMNCiAgICAgICAgIn5+U2hpZnR+fiI9MTYNCiAgICAgICAgIn5+Q29udHJvbH5+Ij0xNw0KICAgICAgICAifn5BbHR+fiI9MTgNCiAgICAgICAgIn5+QmFja1NwYWNlfn4iPTgNCiAgICAgICAgIn5+RGVsZXRlfn4iPTQ2DQogICAgICAgICJ+fmYxfn4iPTExMg0KICAgICAgICAifn5mMn5+Ij0xMTMNCiAgICAgICAgIn5+ZjN+fiI9MTE0DQogICAgICAgICJ+fmY0fn4iPTExNQ0KICAgICAgICAifn5mNX5+Ij0xMTYNCiAgICAgICAgIn5+ZjZ+fiI9MTE3DQogICAgICAgICJ+fmY3fn4iPTExOA0KICAgICAgICAifn5mOH5+Ij0xMTkNCiAgICAgICAgIn5+Zjl+fiI9MTIwDQogICAgICAgICJ+fmYxMH5+Ij0xMjENCiAgICAgICAgIn5+ZjExfn4iPTEyMg0KICAgICAgICAifn5mMTJ+fiI9MTIzDQogICAgICAgICJ+fk11dGV+fiI9MTczDQogICAgICAgICJ+fkluc2VydH5+Ij00NQ0KICAgICAgICAifn5QYWdlVXB+fiI9MzMNCiAgICAgICAgIn5+UGFnZURvd25+fiI9MzQNCiAgICAgICAgIn5+RU5Efn4iPTM1DQogICAgICAgICJ+fkhPTUV+fiI9MzYNCiAgICAgICAgIn5+dGFifn4iPTkNCiAgICAgICAgIn5+Q2Fwc0xvY2t+fiI9MjANCiAgICAgICAgIn5+TnVtTG9ja35+Ij0xNDQNCiAgICAgICAgIn5+U2Nyb2xsTG9ja35+Ij0xNDUNCiAgICAgICAgIn5+V2luZG93c35+Ij05MQ0KICAgICAgICAifn5MZWZ0fn4iPTM3DQogICAgICAgICJ+flVwfn4iPTM4DQogICAgICAgICJ+flJpZ2h0fn4iPTM5DQogICAgICAgICJ+fkRvd25+fiI9NDANCiAgICAgICAgIn5+S1Awfn4iPTk2DQogICAgICAgICJ+fktQMX5+Ij05Nw0KICAgICAgICAifn5LUDJ+fiI9OTgNCiAgICAgICAgIn5+S1Azfn4iPTk5DQogICAgICAgICJ+fktQNH5+Ij0xMDANCiAgICAgICAgIn5+S1A1fn4iPTEwMQ0KICAgICAgICAifn5LUDZ+fiI9MTAyDQogICAgICAgICJ+fktQN35+Ij0xMDMNCiAgICAgICAgIn5+S1A4fn4iPTEwNA0KICAgICAgICAifn5LUDl+fiI9MTA1DQogICAgfQ0KICAgIGlmIChbaW50XSRDb252ZXJ0ID0gJEhhc2hLZXkuJEtleSkge3JldHVybiAkQ29udmVydH0NCiAgICBUaHJvdyAiSW52YWxpZCBTcGVjaWFsIEtleSBDb252ZXJzaW9uIg0KfQoKZnVuY3Rpb24gSW52b2tlLVRlcm5hcnkge3BhcmFtKFtib29sXSRkZWNpZGVyLCBbc2NyaXB0YmxvY2tdJGlmdHJ1ZSwgW3NjcmlwdGJsb2NrXSRpZmZhbHNlKQ0KDQogICAgaWYgKCRkZWNpZGVyKSB7ICYkaWZ0cnVlfSBlbHNlIHsgJiRpZmZhbHNlIH0NCn0KCmZ1bmN0aW9uIHBhdXNlIHtwYXJhbShbU3RyaW5nXSRQYXVzZVEgPSAiUHJlc3MgYW55IGtleSB0byBjb250aW51ZSAuIC4gLiAiKQ0KDQogICAgV3JpdGUtSG9zdCAtbm9OZXdsaW5lICRQYXVzZVENCiAgICAkbnVsbCA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIk5vRWNobywgSW5jbHVkZUtleURvd24iKQ0KICAgIFdyaXRlLUhvc3QgIiINCn0KClNldC1BbGlhcyA/OiBJbnZva2UtVGVybmFyeQ==")
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
