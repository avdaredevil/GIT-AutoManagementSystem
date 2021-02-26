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
#    The Following Code was added by AP-Compiler Version [1.2] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gSW5wdXQtUHJvbXB0IHtwYXJhbShbVmFsaWRhdGVOb3ROdWxsb3JFbXB0eSgpXVtTdHJpbmddJFByb21wdCA9ICJFbnRlciBUZXh0IDogIikNCg0KICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAkUHJvbXB0DQogICAgJFJlUmVnWCA9ICdbXlx4MDEtXHgwOFx4MTAtXHg4MF0rJyMnW15cd1wuXScgW9CQLdGP0IHRkV0NCiAgICAkVHJTdHJpbmcgPSAiIg0KICAgICRpUG9zeCA9IFtDb25zb2xlXTo6Q3Vyc29yTGVmdA0KICAgICRpUG9zeSA9IFtDb25zb2xlXTo6Q3Vyc29yVG9wDQogICAgJEN2aXMgPSBbQ29uc29sZV06OkN1cnNvclZpc2libGUNCiAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkRmFsc2UNCiAgICAkQ291bnQgPSAxOyRTbGVlcCA9IDANCiAgICBXaGlsZSAoJFRydWUpIHsNCiAgICAgICAgaWYgKCRjb3VudCAtZ3QgNTAwKSB7JFNsZWVwID0gMTAwfQ0KICAgICAgICBpZiAoJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlKSB7JFN0b3JlID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiSW5jbHVkZUtleURvd24sTm9FY2hvIik7JENvdW50PTA7JFNsZWVwPTB9IGVsc2UgeyRDb3VudCsrO1N0YXJ0LVNsZWVwIC1tICRTbGVlcDtjb250aW51ZX0NCiAgICAgICAgaWYgKEtleVByZXNzZWQgIn5+QmFja1NwYWNlfn4iICRTdG9yZSkge2lmICgkc3RvcmUuQ29udHJvbEtleVN0YXRlIC1tYXRjaCAiY3RybCIpIHskVHJTdHJpbmc9IiJ9IGVsc2UgeyRUclN0cmluZyA9ID86ICgkVHJTdHJpbmcuTGVuZ3RoIC1lcSAwKXsiIn17JFRyU3RyaW5nLnN1YnN0cmluZygwLCRUclN0cmluZy5MZW5ndGgtMSl9fX0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+flNwYWNlfn4iICRTdG9yZSkgeyRUclN0cmluZyArPSAiICJ9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5Fc2NhcGV+fiIgJFN0b3JlKSB7JFRyU3RyaW5nPSIiO2JyZWFrfQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+RU5URVJ+fiIgJFN0b3JlKSB7V3JpdGUtSG9zdCAiIjticmVha30gZWxzZSANCiAgICAgICAgeyRUclN0cmluZyArPSAkU3RvcmUuQ2hhcmFjdGVyIC1yZXBsYWNlICgkUmVSZWdYLCcnKX0NCiAgICAgICAgJHd0ID0gW0NvbnNvbGVdOjpCdWZmZXJXaWR0aCAtICRpUG9zeCAtIDENCiAgICAgICAgW0NvbnNvbGVdOjpDdXJzb3JsZWZ0ID0gJGlQb3N4DQogICAgICAgIFtDb25zb2xlXTo6Q3Vyc29yVG9wID0gJGlQb3N5DQogICAgICAgIGlmICgkd3QtJFRyU3RyaW5nLkxlbmd0aCAtbHQgMCkgew0KICAgICAgICAgICAgJHRiPSIiDQogICAgICAgICAgICAkdHQ9Ii4uLiIrJFRyU3RyaW5nLnN1YnN0cmluZygkVHJTdHJpbmcuTGVuZ3RoLSR3dCszKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgJHRiPSIgIiooJHd0LSRUclN0cmluZy5MZW5ndGgpDQogICAgICAgICAgICAkdHQ9JFRyU3RyaW5nDQogICAgICAgIH0NCiAgICAgICAgJGZjb2wgPSBbY29uc29sZV06OkZvcmVncm91bmRDb2xvcg0KICAgICAgICBXcml0ZS1ob3N0IC1ub25ld2xpbmUgLWYgJGZDb2wgJHR0JFRiDQogICAgfQ0KICAgIFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZSA9ICRDdmlzDQogICAgcmV0dXJuICRUUlN0cmluZw0KfQoKZnVuY3Rpb24gUHJvY2Vzcy1UcmFuc3BhcmVuY3kge3BhcmFtKFtBbGlhcygiVHJhbnNwYXJlbmN5IiwiSW52aXNpYmlsaXR5IiwiaSIsInQiKV1bVmFsaWRhdGVSYW5nZSgwLDEwMCldW2ludF0kVHJhbnM9MCwgW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXSRQcm9jZXNzKQ0KDQogICAgaWYgKCRQcm9jZXNzIC1tYXRjaCAiXC5leGUkIikgeyRQcm9jZXNzID0gJFByb2Nlc3MucmVwbGFjZSgiLmV4ZSIsIiIpfQ0KICAgIFRyeSB7DQogICAgICAgIGlmICgkUHJvY2Vzcy5uYW1lKSB7JFByb2MgPSAkUHJvY2Vzcy5uYW1lfSBlbHNlIHskUHJvYyA9IChHZXQtUHJvY2VzcyAkUHJvY2VzcyAtRXJyb3JBY3Rpb24gU3RvcClbMF0ubmFtZX0NCiAgICB9IGNhdGNoIHsNCiAgICAgICAgaWYgKFtJbnRdOjpUcnlQYXJzZSgkUHJvY2VzcywgW3JlZl0zKSkgeyRQcm9jID0gKChHZXQtUHJvY2VzcyB8ID8geyRfLklEIC1lcSAkUHJvY2Vzc30pWzBdKS5uYW1lfQ0KICAgIH0NCiAgICBpZiAoJFByb2MgLW5vdE1hdGNoICJcLmV4ZSQiKSB7JFByb2MgPSAiJFByb2MuZXhlIn0NCiAgICBuaXJjbWQgd2luIHRyYW5zIHByb2Nlc3MgIiRQcm9jIiAoKDEwMC0kVHJhbnMpKjI1NS8xMDApIHwgT3V0LU51bGwNCn0KCmZ1bmN0aW9uIEFQLVJlcXVpcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bQWxpYXMoIkZ1bmN0aW9uYWxpdHkiLCJMaWJyYXJ5IildW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbD17fSwgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICAkTG9hZE1vZHVsZSA9IHsNCiAgICAgICAgcGFyYW0oJEZpbGUsW2Jvb2xdJEltcG9ydCkNCiAgICAgICAgdHJ5IHtJbXBvcnQtTW9kdWxlICRGaWxlIC1lYSBzdG9wO3JldHVybiAxfSBjYXRjaCB7fQ0KICAgICAgICAkTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7JExGID0gIiRMaWJcJEZpbGUiDQogICAgICAgIFtzdHJpbmddJGYgPSBpZih0ZXN0LXBhdGggLXQgbGVhZiAkTEYpeyRMRn1lbHNlaWYodGVzdC1wYXRoIC10IGxlYWYgIiRMRi5kbGwiKXsiJExGLmRsbCJ9DQogICAgICAgIGlmICgkZiAtYW5kICRJbXBvcnQpIHtJbXBvcnQtTW9kdWxlICRmfQ0KICAgICAgICByZXR1cm4gJGYNCiAgICB9DQogICAgJFN0YXQgPSAkKHN3aXRjaCAtcmVnZXggKCRMaWIudHJpbSgpKSB7DQogICAgICAgICJeSW50ZXJuZXQiICAgICAgICAgICAgICAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5kZXA6KC4qKSIgICAgICAgICAgICAgICB7aWYgKCRNYXRjaGVzWzFdIC1uZSAid2hlcmUiKXtBUC1SZXF1aXJlICJkZXA6d2hlcmUiIHskTU9ERT0yfX1lbHNleyRNT0RFPTJ9O2lmICgkTU9ERS0yKXtHZXQtV2hlcmUgJE1hdGNoZXNbMV19ZWxzZXt0cnl7JiAkTWF0Y2hlc1sxXSAiL2ZqZmRqZmRzIC0tZHNqYWhkaHMgLWRzamFkaiIgMj4kbnVsbDsic3VjYyJ9Y2F0Y2h7fX19DQogICAgICAgICJeKGxpYnxtb2R1bGUpOiguKikiICAgICAgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSwgJHRydWUpfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKV90ZXN0OiguKikiIHskTG9hZE1vZHVsZS5pbnZva2UoJE1hdGNoZXNbMl0pfQ0KICAgICAgICAiXmZ1bmN0aW9uOiguKikiICAgICAgICAgIHtnY20gJE1hdGNoZXNbMV0gLWVhIFNpbGVudGx5Q29udGludWV9DQogICAgICAgICJec3RyaWN0X2Z1bmN0aW9uOiguKikiICAge1Rlc3QtUGF0aCAiRnVuY3Rpb246XCQoJE1hdGNoZXNbMV0pIn0NCiAgICAgICAgZGVmYXVsdCB7V3JpdGUtQVAgIiFJbnZhbGlkIHNlbGVjdG9yIHByb3ZpZGVkIFskKCIkTGliIi5zcGxpdCgnOicpWzBdKV0iO3Rocm93ICdCQURfU0VMRUNUT1InfQ0KICAgIH0pDQogICAgaWYgKCEkU3RhdCkgeyRPbkZhaWwuSW52b2tlKCl9DQogICAgaWYgKCRQYXNzVGhydSkge3JldHVybiAkU3RhdH0NCn0KCmZ1bmN0aW9uIEdldC1Db2xvciB7DQogICAgPCMgIC5EZXNjcmlwdGlvbg0KICAgICAgICBGZXRjaGVzIGJhc2ljIGNvbG9ycyB1c2luZyB0aGUgVW5pY29kZSBFc2NhcGUgc2VxdWVuY2VzDQogICAgIz4NCiAgICBwYXJhbSAoDQogICAgICAgIFtWYWxpZGF0ZVNldCgNCiAgICAgICAgICAgICdyJywncmVzZXQnLCdkJywnZGltJywncycsJ3N0cmlrZScsJ3UnLCd1bmRlcmxpbmUnLCdiJywnYm9sZCcsJ2knLCdpdGFsaWMnLA0KICAgICAgICAgICAgJ0JsYWNrJywnRGFya0JsdWUnLCdEYXJrR3JlZW4nLCdEYXJrQ3lhbicsJ0RhcmtSZWQnLCdEYXJrTWFnZW50YScsJ0RhcmtZZWxsb3cnLCdHcmF5JywnRGFya0dyYXknLCdCbHVlJywnR3JlZW4nLCdDeWFuJywnUmVkJywnTWFnZW50YScsJ1llbGxvdycsJ1doaXRlJywNCiAgICAgICAgICAgICdiZy5CbGFjaycsJ2JnLkRhcmtCbHVlJywnYmcuRGFya0dyZWVuJywnYmcuRGFya0N5YW4nLCdiZy5EYXJrUmVkJywnYmcuRGFya01hZ2VudGEnLCdiZy5EYXJrWWVsbG93JywnYmcuR3JheScsJ2JnLkRhcmtHcmF5JywnYmcuQmx1ZScsJ2JnLkdyZWVuJywnYmcuQ3lhbicsJ2JnLlJlZCcsJ2JnLk1hZ2VudGEnLCdiZy5ZZWxsb3cnLCdiZy5XaGl0ZScNCiAgICAgICAgKV1bU3RyaW5nW11dJENvZGUsDQogICAgICAgIFtBbGlhcygnYmcnKV1bU3dpdGNoXSRCYWNrZ3JvdW5kLA0KICAgICAgICBbU3dpdGNoXSRDb2RlU3RyaW5nDQogICAgKQ0KICAgICRBbGlhc1RhYmxlID0gQHt1ID0gJ3VuZGVybGluZSc7YiA9ICdib2xkJztpID0gJ2l0YWxpYyc7ciA9ICdyZXNldCc7cyA9ICdzdHJpa2UnO2QgPSAnZGltJ30NCiAgICBpZiAoISRHbG9iYWw6QVBfQ09MT1JfVEFCTEUpIHsNCiAgICAgICAgJFRCTCA9ICRHbG9iYWw6QVBfQ09MT1JfVEFCTEUgPSBAe3Jlc2V0ID0gMDtib2xkID0gMTtkaW0gPSAyO2l0YWxpYyA9IDM7dW5kZXJsaW5lID0gNDtzdHJpa2UgPSA5fQ0KICAgICAgICAwLDEgfCAlIHsNCiAgICAgICAgICAgICRCZ0luZGV4ID0gJF8NCiAgICAgICAgICAgIDAsMSB8ICUgew0KICAgICAgICAgICAgICAgICRTcGNJbmRleCA9ICRfDQogICAgICAgICAgICAgICAgJGkgPSAwDQogICAgICAgICAgICAgICAgJ0JsYWNrLlR8UmVkfEdyZWVufFllbGxvd3xCbHVlfE1hZ2VudGF8Q3lhbnxXaGl0ZScuc3BsaXQoJ3wnKSB8ICUgew0KICAgICAgICAgICAgICAgICAgICAkSW5jciA9ICRCZ0luZGV4ICogMTANCiAgICAgICAgICAgICAgICAgICAgJENvbE5hbWUgPSAoKCcnLCdiZy4nKVskQmdJbmRleF0pKygoJ0RhcmsnLCcnKVskU3BjSW5kZXhdKSskXw0KICAgICAgICAgICAgICAgICAgICAkQ29sU3BhY2UgPSAoMzAsIDkwKVskU3BjSW5kZXhdICsgJEluY3INCiAgICAgICAgICAgICAgICAgICAgJFRCTC4kQ29sTmFtZSA9ICRDb2xTcGFjZSsoJGkrKykNCiAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICAgICAgQHtEYXJrR3JheSA9ICdCbGFjay5UJztCbGFjayA9ICdEYXJrQmxhY2suVCc7R3JheSA9ICdEYXJrV2hpdGUnfS5HZXRFbnVtZXJhdG9yKCkgfCAlIHsNCiAgICAgICAgICAgICRUQkwuKCRfLktleSkgPSAkVEJMLigkXy5WYWx1ZSkNCiAgICAgICAgICAgICRUQkwuKCdiZy4nKyRfLktleSkgPSAkVEJMLignYmcuJyskXy5WYWx1ZSkNCiAgICAgICAgICAgICRUQkwucmVtb3ZlKCRfLlZhbHVlKQ0KICAgICAgICAgICAgJFRCTC5yZW1vdmUoJ2JnLicrJF8uVmFsdWUpDQogICAgICAgIH0NCiAgICB9DQogICAgJENvZGVzID0gKCRDb2RlKyRBcmdzIHwgJSB7DQogICAgICAgICRHbG9iYWw6QVBfQ09MT1JfVEFCTEUuKEpTLU9SICRBbGlhc1RhYmxlLiRfICRfKQ0KICAgIH0pIC1qb2luICc7Jw0KICAgIGlmICgkQ29kZVN0cmluZykge3JldHVybiAkQ29kZXN9DQogICAgcmV0dXJuICIkKEdldC1Fc2NhcGUpWyR7Q29kZXN9bSINCn0KCmZ1bmN0aW9uIFRhYi1UZXh0IHtwYXJhbShbU3RyaW5nXSRUZXh0LCBbaW50XSROdW1UYWJzPTEsIFtpbnRdJFRhYlNpemUgPSA0LCBbY2hhcl0kVGFiQ2hhciA9ICIgIikNCg0KICAgICRUYWIgPSAoIiRUYWJDaGFyIiokVGFiU2l6ZSkqJE51bVRhYnM7JGluZGV4PTANCiAgICAkV2luID0gW0NvbnNvbGVdOjpCdWZmZXJXaWR0aC0xOyRTdHIgPSAiIg0KICAgIGZvcmVhY2ggKCRjIGluICRUZXh0LlRvQ2hhckFycmF5KCkpIHsNCiAgICAgICAgaWYgKCEoJEluZGV4JSRXaW4pKSB7JFN0ciArPSAkVGFiOyRJbmRleCs9JFRhYi5MZW5ndGh9DQogICAgICAgICRTdHIgKz0gJGMNCiAgICAgICAgJGluZGV4KysNCiAgICB9DQogICAgcmV0dXJuICRTdHINCn0KCmZ1bmN0aW9uIFdyaXRlLUFQIHsNCiAgICBbQ21kbGV0QmluZGluZygpXQ0KICAgIHBhcmFtKFtQYXJhbWV0ZXIoVmFsdWVGcm9tUGlwZWxpbmU9JHRydWUsIE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsW1N3aXRjaF0kTm9TaWduLFtTd2l0Y2hdJFBsYWluVGV4dCxbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JyxbU3dpdGNoXSRQYXNzVGhydSkNCiAgICBiZWdpbiB7JFRUID0gQCgpfQ0KICAgIFByb2Nlc3MgeyRUVCArPSAsJFRleHR9DQogICAgRU5EIHsNCiAgICAgICAgJEJsdWUgPSAkKGlmICgkV1JJVEVfQVBfTEVHQUNZX0NPTE9SUyl7M31lbHNleydCbHVlJ30pDQogICAgICAgIGlmICgkVFQuY291bnQgLWVxIDEpIHskVFQgPSAkVFRbMF19OyRUZXh0ID0gJFRUDQogICAgICAgIGlmICgkdGV4dC5jb3VudCAtZ3QgMSAtb3IgJHRleHQuR2V0VHlwZSgpLk5hbWUgLW1hdGNoICJcW1xdJCIpIHtyZXR1cm4gJFRleHQgfD97IiRfIn18ICUge1dyaXRlLUFQICRfIC1Ob1NpZ246JE5vU2lnbiAtUGxhaW5UZXh0OiRQbGFpblRleHQgLUFsaWduICRBbGlnbn19DQogICAgICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+WytcLSFcKlwjXEBfXSkoPzx3Pi4qKSIpIHtyZXR1cm4gJFRleHR9DQogICAgICAgICR0YiAgPSAiICAgICIqJE1hdGNoZXMudC5sZW5ndGg7DQogICAgICAgICRDb2wgPSBAeycrJz0nMic7Jy0nPScxMic7JyEnPScxNCc7JyonPSRCbHVlOycjJz0nRGFya0dyYXknOydAJz0nR3JheSc7J18nPSd3aGl0ZSd9WygkU2lnbiA9ICRNYXRjaGVzLlMpXQ0KICAgICAgICBpZiAoISRDb2wpIHtUaHJvdyAiSW5jb3JyZWN0IFNpZ24gWyRTaWduXSBQYXNzZWQhIn0NCiAgICAgICAgJFNpZ24gPSAkKGlmICgkTm9TaWduIC1vciAkTWF0Y2hlcy5OUykgeyIifSBlbHNlIHsiWyRTaWduXSAifSkNCiAgICAgICAgQVAtUmVxdWlyZSAiZnVuY3Rpb246QWxpZ24tVGV4dCIge2Z1bmN0aW9uIEdsb2JhbDpBbGlnbi1UZXh0KCRhbGlnbiwkdGV4dCkgeyR0ZXh0fX0NCiAgICAgICAgJERhdGEgPSAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIjtpZiAoISREYXRhKSB7cmV0dXJufQ0KICAgICAgICAkRGF0YSA9IEFsaWduLVRleHQgLUFsaWduICRBbGlnbiAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIg0KICAgICAgICBpZiAoJFBsYWluVGV4dCkge3JldHVybiAkRGF0YX0NCiAgICAgICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiQoW2Jvb2xdJE1hdGNoZXMuTk5MKSAtZiAkQ29sICREYXRhDQogICAgICAgIGlmICgkUGFzc1RocnUpIHskRGF0YX0NCiAgICB9DQp9CgpmdW5jdGlvbiBaaXAtQXJyYXlzIHtwYXJhbSgkeCkNCg0KICAgIGlmICgkeC5jb3VudCAtbGUgMSkge3Rocm93ICJbQVAtUHl0aG9uXSBaaXAgYXJndW1lbnQgIzEgbXVzdCBzdXBwb3J0IGl0ZXJhdGlvbiJ9DQogICAgJGNudCA9ICR4WzBdLmNvdW50DQogICAgJHggfCA/IHskXy5jb3VudCAtbHQgJGNudH0gfCAlIHskY250ID0gJF99DQogICAgJEFycmF5ID0gTmV3LU9iamVjdCBPYmplY3RbXVtdICRDbnQsJHguY291bnQNCiAgICAwLi4oJENudC0xKSB8ICUgew0KICAgICAgICAkaSA9ICRfDQogICAgICAgIDAuLigkeC5jb3VudC0xKSB8ICUgeyRBcnJheVskaV1bJF9dID0gQChAKCR4KVskX10pWyRpXX0NCiAgICB9DQogICAgcmV0dXJuICRBcnJheQ0KfQoKZnVuY3Rpb24gQ2xlYXItTGluZSB7DQogICAgJE5tID0gW0NvbnNvbGVdOjpXaW5kb3dXaWR0aA0KICAgICR0ID0gW0NvbnNvbGVdOjpDdXJzb3JUb3A7W0NvbnNvbGVdOjpDdXJzb3JMZWZ0PTANCiAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmUgKCIgIiokTk0pDQogICAgW0NvbnNvbGVdOjpDdXJzb3JUb3A9JHQ7W0NvbnNvbGVdOjpDdXJzb3JMZWZ0PTANCn0KCmZ1bmN0aW9uIFBzdy1Qcm9tcHQge3BhcmFtKFtBbGlhcygiUHJvbXB0IildW1N0cmluZ10kVGV4dCA9ICJFbnRlciBQYXNzd29yZCA6ICIsIFtTd2l0Y2hdJFNob3dNYXNrZWRQc3csIFtjaGFyXSRNYXNrPTgyMjYsIFtTd2l0Y2hdJEZvcmNlVmFsaWRhdGlvbiwgW3NjcmlwdGJsb2NrXSRWYWxpZGF0b3I9ezN9KQ0KDQogICAgV3JpdGUtaG9zdCAtbm9uZXdsaW5lICRUZXh0DQogICAgJFJlUmVnWCA9ICdbXlx4MDEtXHgwOFx4MTAtXHg4MF0rJyMnW15cd1wuXScNCiAgICAkUHN3ID0gIiINCiAgICAkaVBvc3ggPSBbQ29uc29sZV06OkN1cnNvckxlZnQNCiAgICAkaVBvc3kgPSBbQ29uc29sZV06OkN1cnNvclRvcA0KICAgICRDdmlzID0gW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlDQogICAgW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlID0gJEZhbHNlDQogICAgaWYgKCEkU2hvd01hc2tlZFBzdykgeyRWYWxpZGF0b3I9ezN9fQ0KICAgICRDb3VudCA9IDE7JFNsZWVwID0gMA0KICAgIFdoaWxlICgkVHJ1ZSkgew0KICAgICAgICBpZiAoJGNvdW50IC1ndCAyNTApIHskU2xlZXAgPSAyNTB9DQogICAgICAgICRUZXN0ID0gJiRWYWxpZGF0b3INCiAgICAgICAgaWYgKCRIb3N0LlVJLlJhd1VJLktleUF2YWlsYWJsZSkgeyRTdG9yZSA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIkluY2x1ZGVLZXlEb3duLE5vRWNobyIpOyRDb3VudD0wOyRTbGVlcD0wfSBlbHNlIHskQ291bnQrKztTdGFydC1TbGVlcCAtbSAkU2xlZXA7Y29udGludWV9DQogICAgICAgIGlmIChLZXlQcmVzc2VkICJ+fkJhY2tTcGFjZX5+IiAkU3RvcmUpIHtpZiAoJHN0b3JlLkNvbnRyb2xLZXlTdGF0ZSAtbWF0Y2ggImN0cmwiKSB7JFBzdz0iIn0gZWxzZSB7JFBzdyA9ID86ICgkUHN3Lkxlbmd0aCAtZXEgMCl7IiJ9eyRQc3cuc3Vic3RyaW5nKDAsJFBzdy5MZW5ndGgtMSl9fX0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+flNwYWNlfn4iICRTdG9yZSkgeyRQc3cgKz0gIiAifQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+RXNjYXBlfn4iICRTdG9yZSkgeyRwc3c9IiI7YnJlYWt9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5FTlRFUn5+IiAkU3RvcmUpIHtXcml0ZS1Ib3N0ICIiO2lmIChbaW50XSRUZXN0IC1uZSAzKSB7aWYgKCRUZXN0IC1vciAhJEZvcmNlVmFsaWRhdGlvbikge2JyZWFrfSBlbHNlIHtXcml0ZS1Ib3N0IC1mIFllbGxvdyAtTm9OZXdMaW5lICJNdXN0IFR5cGUgaW4gYSB2YWxpZCBQYXNzd29yZC4uLiI7c3RhcnQtc2xlZXAgLXMgMjtDbGVhci1MaW5lO1tDb25zb2xlXTo6Q3Vyc29yVG9wLT0xfX1lbHNle2JyZWFrfX0gZWxzZSANCiAgICAgICAgeyRQc3cgKz0gJFN0b3JlLkNoYXJhY3RlciAtcmVwbGFjZSAoJFJlUmVnWCwnJyl9DQogICAgICAgIGlmICgkU2hvd01hc2tlZFBzdykgew0KICAgICAgICAgICAgJHd0ID0gW0NvbnNvbGVdOjpCdWZmZXJXaWR0aCAtICRpUG9zeCAtIDENCiAgICAgICAgICAgICRUZXN0ID0gJiRWYWxpZGF0b3INCiAgICAgICAgICAgIFtDb25zb2xlXTo6Q3Vyc29ybGVmdCA9ICRpUG9zeA0KICAgICAgICAgICAgaWYgKCR3dCAtICRQc3cuTGVuZ3RoIC1sdCAwKSB7JHRiPSIiOyR0dD0iJE1hc2siKigkd3QtMykrIi4uLiJ9IGVsc2UgeyR0Yj0iICIqKCR3dC0kUHN3Lkxlbmd0aCk7JHR0PSIkTWFzayIqJFBzdy5MZW5ndGh9DQogICAgICAgICAgICAkZmNvbCA9IFtjb25zb2xlXTo6Rm9yZWdyb3VuZENvbG9yDQogICAgICAgICAgICBpZiAoW2ludF0kVGVzdCAtbmUgMykgew0KICAgICAgICAgICAgICAgICRmQ29sID0gPzooJFRlc3QpIHsyfSB7InJlZCJ9DQogICAgICAgICAgICB9DQogICAgICAgICAgICBXcml0ZS1ob3N0IC1ub25ld2xpbmUgLWYgJGZDb2wgJHR0JHRiDQogICAgICAgIH0NCiAgICB9DQogICAgW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlID0gJEN2aXMNCiAgICByZXR1cm4gJHBzdw0KfQoKZnVuY3Rpb24gR2V0LUZpbGVIYXNoIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kRmlsZSkNCg0KICAgIGlmICghKFRlc3QtUGF0aCAtdHlwZSBsZWFmICRGaWxlKSkge1Rocm93ICJbR2V0LUZpbGVIYXNoXSBGaWxlIFskRmlsZV0gTm90IGZvdW5kIn0NCiAgICAkRmlsZSA9ICJ7MH0iIC1mIChSZXNvbHZlLVBhdGggJEZpbGUpDQogICAgJGEgPSBbU3lzdGVtLlNlY3VyaXR5LkNyeXB0b2dyYXBoeS5NRDVdOjpDcmVhdGUoKQ0KICAgICRIYXNoID0gJGEuQ29tcHV0ZUhhc2goW0lPLkZpbGVdOjpSZWFkQWxsQnl0ZXMoJEZpbGUpKSAtam9pbiAiOiINCiAgICAkYS5EaXNwb3NlKCkNCiAgICBSZXR1cm4gJEhhc2gNCn0KCmZ1bmN0aW9uIEFzay1PRS1RU1ROIHtwYXJhbSgkUSkNCg0KICAgIExvYWQtRm9ybXMNCiAgICAkRm9ybS5Db250cm9scy5GaW5kKCJBbnN3ZXIiLCR0cnVlKVswXS50ZXh0ID0gIiINCiAgICAkRm9ybS5Db250cm9scy5GaW5kKCJRdWVzdGlvbiIsJHRydWUpWzBdLnRleHQgPSAkUQ0KICAgICRGb3JtLlNob3dEaWFsb2coKSB8IE91dC1OdWxsDQogICAgcmV0dXJuICRGb3JtLkNvbnRyb2xzLkZpbmQoIkFuc3dlciIsJHRydWUpWzBdLnRleHQNCn0KCmZ1bmN0aW9uIEdldC1Fc2NhcGUge1tDaGFyXTB4MWJ9CgpmdW5jdGlvbiBHZXQtV2hlcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSR0cnVlKV1bc3RyaW5nXSRGaWxlLCBbU3dpdGNoXSRBbGwpDQoNCiAgICBBUC1SZXF1aXJlICJkZXA6d2hlcmUiIHt0aHJvdyAiTmVlZCBTeXMzMlx3aGVyZSB0byB3b3JrISI7cmV0dXJufQ0KICAgICRPdXQ9JG51bGwNCiAgICBpZiAoJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCIpIHsNCiAgICAgICAgJE91dCA9IHdoaWNoICRmaWxlIDI+JG51bGwNCiAgICB9IGVsc2UgeyRPdXQgPSB3aGVyZS5leGUgJGZpbGUgMj4kbnVsbH0NCiAgICANCiAgICBpZiAoISRPdXQpIHtyZXR1cm59DQogICAgaWYgKCRBbGwpIHtyZXR1cm4gJE91dH0NCiAgICByZXR1cm4gQCgkT3V0KVswXQ0KfQoKZnVuY3Rpb24gSW52b2tlLVRlcm5hcnkge3BhcmFtKFtib29sXSRkZWNpZGVyLCBbc2NyaXB0YmxvY2tdJGlmdHJ1ZSwgW3NjcmlwdGJsb2NrXSRpZmZhbHNlKQ0KDQogICAgaWYgKCRkZWNpZGVyKSB7ICYkaWZ0cnVlfSBlbHNlIHsgJiRpZmZhbHNlIH0NCn0KCmZ1bmN0aW9uIFBhdXNlIHtwYXJhbShbU3RyaW5nXSRQYXVzZVEgPSAiUHJlc3MgYW55IGtleSB0byBjb250aW51ZSAuIC4gLiAiKQ0KDQogICAgV3JpdGUtSG9zdCAtbm9OZXdsaW5lICRQYXVzZVENCiAgICAkbnVsbCA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIk5vRWNobywgSW5jbHVkZUtleURvd24iKQ0KICAgIFdyaXRlLUhvc3QgIiINCn0KCmZ1bmN0aW9uIExvYWQtSW50ZXJuZXQge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV0kSUUsIFtJbnRdJEludGVydmFsID0gNTApDQoNCiAgICBXaGlsZSAoJElFLkJ1c3kpIHsNCiAgICAgICAgU3RhcnQtU2xlZXAgLW0gJEludGVydmFsDQogICAgfQ0KfQoKZnVuY3Rpb24gRmxhdHRlbiB7cGFyYW0oW29iamVjdFtdXSR4KQ0KaWYgKCRYLmNvdW50IC1lcSAxKSB7cmV0dXJuICR4IHwgJSB7JF99fSBlbHNlIHskeCB8ICUge0ZsYXR0ZW4gJF99fX0KClNldC1BbGlhcyA/OiBJbnZva2UtVGVybmFyeQpTZXQtQWxpYXMgaW52IFByb2Nlc3MtVHJhbnNwYXJlbmN5ClNldC1BbGlhcyBjb2wgR2V0LUNvbG9yClNldC1BbGlhcyBlc2MgR2V0LUVzY2FwZQ==")))
# ========================================END=OF=COMPILER===========================================================|

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
AP-Require "Internet" {Write-AP "!Need Internet To Function!";exit}
AP-Require "dep:git" {Write-AP "!Need Git Integrated To Function!";exit}
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$UserName = "avdaredevil@gmail.com"
$HashFile = "$PSHell\Git-Temp\Current-Versions.map"
$MapFile  = "$PSHell\Git-Temp\Git-Sources.map"
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
        "@   [GitRemoteName]>[GitUser]/[GitRepo]|[Tool-Name]|[Src1;Src2;...]->[TMPFolder]",
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
    $f = (ls *.* -ex "readme.md" | ? {$_.name -notmatch "^\."} | Get-Random).Name
    $Data = try {$Maps[$SrcMap[$f]]} catch {};if (!$Data) {Write-AP ">-Could Not get Data for this project, please add to MapFile.";$END.Invoke();return}
    if (!(Test-Path -type Container ".git")) {
        Write-AP ">*Initializing git for [$($Data.Name)]"
        $null = git init
    }
    $Repo = $Data.GitHub[1]
    $RepoAddr = "git@github.com:$Repo.git"
    $HTTPRepoAddr = "https://github.com/$Repo.git"
    if (git ls-remote $HTTPRepoAddr 2>$null) {
        if (!(Test-Path "LICENSE") -or !(Test-Path "README.md")) {
            Write-AP ">*Issuing a pull request from [$($Data.GitHub[1])]"
            rm -Force -Recurse tt -ea SilentlyContinue
            $a = git clone $HTTPRepoAddr tt 2>&1
            rm .git -re -fo
            ls tt -Force | % {mv $_.FullName . -ea SilentlyContinue}

            rm -Force -Recurse tt -ea SilentlyContinue
            if ($a -match "failed|rejected|error") {$a}
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
    if (!(git ls-remote $HTTPRepoAddr 2>$null)) {
        Write-AP ">*Creating a GIT Repo as [$($Data.GitHub[1])]"
#        -------------------------------
        if (!$Script:Psw) {$Script:Psw = Psw-Prompt -Text (Tab-Text "Enter your GitHub Password : " 3) -ShowMaskedPsw -Mask 5 -ForceValidation -Validator {$Psw.Length -gt 6};[Console]::cursortop--;Clear-Line}
        if (!$Script:Psw) {Write-AP ">>!Password Prompt Canceled";$END.Invoke();return}
        $IE = New-Object -com InternetExplorer.Application;$IE.visible=1
        $IE.Navigate("https://github.com/login");Load-Internet $IE
        if ($IE.Document.getElementById("login_field")) {
            $IE.Document.getElementById("login_field").value = $UserName;$IE.Document.getElementById("password").value = $Psw;$IE.Document.getElementsByName("commit").item(0).click();sleep 1;Load-Internet $IE
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
        git remote add $Data.GitHub[0] $RepoAddr
        git push --set-upstream $Data.GitHub[0] master
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
        $stat = git status 2>$null | Out-String
        if ($stat -match "nothing to commit" -and $stat -notmatch "ahead of") {Write-AP ">*No Changes needed.";$END.Invoke();return}
        if ($stat -match "ahead of") {Write-AP ">>!Seems to have code that has not yet been pushed, will include those commits"}
        $MSG = $Message
        if (!$MSG) {$MSG = Input-Prompt (Tab-Text "Enter a message to commit with : " 2);if (!$MSG.trim()) {$MSG = "Updated Code"}}
        $out = "|==========Pull===================`n"
        $out += git pull $Data.GitHub[0] master 2>&1
        $out += "|==========ADD===================`n"
        $out += git add . 2>&1
        $out += "|==========Commit================`n"
        $Out += git commit -a -m $MSG 2>&1
        $out += "|==========Push==================`n"
        $Out += git push --set-upstream $Data.GitHub[0] master 2>&1
        Write-AP $(if ($Out -notmatch "failed|rejected|conflict") {">+Success, Pushed Code up."} else {$Out})
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
    $Fold = Get-Folder-For $_;$NewFold = "$PSHell\Git-Temp\$($Maps[$SrcMap.$_].Dest)"
    $CurrentPath = "$PShell\$FOLD$_"
    if (!(Test-Path -Type Container "$NewFold")) {
        Write-AP "*Creating Folder Structure for [$($Maps[$SrcMap.$_].Name)]"
        Md "$PSHell\Git-Temp\$($Maps[$SrcMap.$_].Dest)" | Out-Null
    }
    if (Test-Path -type container $CurrentPath) {cp $CurrentPath $NewFold -Force -Recurse}
    elseif (!$Hash.$_) {
        Write-AP "*Creating Hash Entry for [$FOLD$_]";$Hash.$_ = Get-FileHash "$CurrentPath";$Changed += ,$_
    }
    if (!(Test-Path -Type leaf "$NewFold\$_")) {
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
