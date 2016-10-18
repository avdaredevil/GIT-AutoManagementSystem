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
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gSW5wdXQtUHJvbXB0IHtwYXJhbShbVmFsaWRhdGVOb3ROdWxsb3JFbXB0eSgpXVtTdHJpbmddJFByb21wdCA9ICJFbnRlciBUZXh0IDogIikNCg0KICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAkUHJvbXB0DQogICAgJFJlUmVnWCA9ICdbXlx4MDEtXHgwOFx4MTAtXHg4MF0rJyMnW15cd1wuXScgW9CQLdGP0IHRkV0NCiAgICAkVHJTdHJpbmcgPSAiIg0KICAgICRpUG9zeCA9IFtDb25zb2xlXTo6Q3Vyc29yTGVmdA0KICAgICRpUG9zeSA9IFtDb25zb2xlXTo6Q3Vyc29yVG9wDQogICAgJEN2aXMgPSBbQ29uc29sZV06OkN1cnNvclZpc2libGUNCiAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkRmFsc2UNCiAgICAkQ291bnQgPSAxOyRTbGVlcCA9IDANCiAgICBXaGlsZSAoJFRydWUpIHsNCiAgICAgICAgaWYgKCRjb3VudCAtZ3QgNTAwKSB7JFNsZWVwID0gMTAwfQ0KICAgICAgICBpZiAoJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlKSB7JFN0b3JlID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiSW5jbHVkZUtleURvd24sTm9FY2hvIik7JENvdW50PTA7JFNsZWVwPTB9IGVsc2UgeyRDb3VudCsrO1N0YXJ0LVNsZWVwIC1tICRTbGVlcDtjb250aW51ZX0NCiAgICAgICAgaWYgKEtleVByZXNzZWQgIn5+QmFja1NwYWNlfn4iICRTdG9yZSkge2lmICgkc3RvcmUuQ29udHJvbEtleVN0YXRlIC1tYXRjaCAiY3RybCIpIHskVHJTdHJpbmc9IiJ9IGVsc2UgeyRUclN0cmluZyA9ID86ICgkVHJTdHJpbmcuTGVuZ3RoIC1lcSAwKXsiIn17JFRyU3RyaW5nLnN1YnN0cmluZygwLCRUclN0cmluZy5MZW5ndGgtMSl9fX0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+flNwYWNlfn4iICRTdG9yZSkgeyRUclN0cmluZyArPSAiICJ9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5Fc2NhcGV+fiIgJFN0b3JlKSB7JFRyU3RyaW5nPSIiO2JyZWFrfQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+RU5URVJ+fiIgJFN0b3JlKSB7V3JpdGUtSG9zdCAiIjticmVha30gZWxzZSANCiAgICAgICAgeyRUclN0cmluZyArPSAkU3RvcmUuQ2hhcmFjdGVyIC1yZXBsYWNlICgkUmVSZWdYLCcnKX0NCiAgICAgICAgJHd0ID0gW0NvbnNvbGVdOjpCdWZmZXJXaWR0aCAtICRQcm9tcHQubGVuZ3RoIC0gMQ0KICAgICAgICBbQ29uc29sZV06OkN1cnNvcmxlZnQgPSAkaVBvc3gNCiAgICAgICAgW0NvbnNvbGVdOjpDdXJzb3JUb3AgPSAkaVBvc3kNCiAgICAgICAgaWYgKCR3dC0kVHJTdHJpbmcuTGVuZ3RoIC1sdCAwKSB7DQogICAgICAgICAgICAkdGI9IiINCiAgICAgICAgICAgICR0dD0iLi4uIiskVHJTdHJpbmcuc3Vic3RyaW5nKCRUclN0cmluZy5MZW5ndGgtJHd0KzMpDQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAkdGI9IiAiKigkd3QtJFRyU3RyaW5nLkxlbmd0aCkNCiAgICAgICAgICAgICR0dD0kVHJTdHJpbmcNCiAgICAgICAgfQ0KICAgICAgICAkZmNvbCA9IFtjb25zb2xlXTo6Rm9yZWdyb3VuZENvbG9yDQogICAgICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAtZiAkZkNvbCAkdHQkVGINCiAgICB9DQogICAgW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlID0gJEN2aXMNCiAgICByZXR1cm4gJFRSU3RyaW5nDQp9CgpmdW5jdGlvbiBQcm9jZXNzLVRyYW5zcGFyZW5jeSB7cGFyYW0oW0FsaWFzKCJUcmFuc3BhcmVuY3kiLCJJbnZpc2liaWxpdHkiLCJpIiwidCIpXVtWYWxpZGF0ZVJhbmdlKDAsMTAwKV1baW50XSRUcmFucz0wLCBbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldJFByb2Nlc3MpDQoNCiAgICBpZiAoJFByb2Nlc3MgLW1hdGNoICJcLmV4ZSQiKSB7JFByb2Nlc3MgPSAkUHJvY2Vzcy5yZXBsYWNlKCIuZXhlIiwiIil9DQogICAgVHJ5IHsNCiAgICAgICAgaWYgKCRQcm9jZXNzLm5hbWUpIHskUHJvYyA9ICRQcm9jZXNzLm5hbWV9IGVsc2UgeyRQcm9jID0gKEdldC1Qcm9jZXNzICRQcm9jZXNzIC1FcnJvckFjdGlvbiBTdG9wKVswXS5uYW1lfQ0KICAgIH0gY2F0Y2ggew0KICAgICAgICBpZiAoW0ludF06OlRyeVBhcnNlKCRQcm9jZXNzLCBbcmVmXTMpKSB7JFByb2MgPSAoKEdldC1Qcm9jZXNzIHwgPyB7JF8uSUQgLWVxICRQcm9jZXNzfSlbMF0pLm5hbWV9DQogICAgfQ0KICAgIGlmICgkUHJvYyAtbm90TWF0Y2ggIlwuZXhlJCIpIHskUHJvYyA9ICIkUHJvYy5leGUifQ0KICAgIG5pcmNtZCB3aW4gdHJhbnMgcHJvY2VzcyAiJFByb2MiICgoMTAwLSRUcmFucykqMjU1LzEwMCkgfCBPdXQtTnVsbA0KfQoKZnVuY3Rpb24gSW52b2tlLVRlcm5hcnkge3BhcmFtKFtib29sXSRkZWNpZGVyLCBbc2NyaXB0YmxvY2tdJGlmdHJ1ZSwgW3NjcmlwdGJsb2NrXSRpZmZhbHNlKQ0KDQogICAgaWYgKCRkZWNpZGVyKSB7ICYkaWZ0cnVlfSBlbHNlIHsgJiRpZmZhbHNlIH0NCn0KCmZ1bmN0aW9uIEFQLVJlcXVpcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bQWxpYXMoIkZ1bmN0aW9uYWxpdHkiLCJMaWJyYXJ5IildW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbD17fSwgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICBbYm9vbF0kU3RhdCA9ICQoc3dpdGNoIC1yZWdleCAoJExpYi50cmltKCkpIHsNCiAgICAgICAgIl5JbnRlcm5ldCIgIHt0ZXN0LWNvbm5lY3Rpb24gZ29vZ2xlLmNvbSAtQ291bnQgMSAtUXVpZXR9DQogICAgICAgICJeZGVwOiguKikiICB7aWYgKCRNYXRjaGVzWzFdIC1uZSAid2hlcmUiKXtBUC1SZXF1aXJlICJkZXA6d2hlcmUiIHskTU9ERT0yfX1lbHNleyRNT0RFPTJ9O2lmICgkTU9ERS0yKXtHZXQtV2hlcmUgJE1hdGNoZXNbMV19ZWxzZXt0cnl7JiAkTWF0Y2hlc1sxXSAiL2ZqZmRqZmRzIC0tZHNqYWhkaHMgLWRzamFkaiIgMj4kbnVsbDsic3VjYyJ9Y2F0Y2h7fX19DQogICAgICAgICJebGliOiguKikiICB7JEZpbGU9JE1hdGNoZXNbMV07JExpYj1BUC1Db252ZXJ0UGF0aCAiPExJQj4iOyh0ZXN0LXBhdGggLXQgbGVhZiAiJExpYlwkRmlsZSIpIC1vciAodGVzdC1wYXRoIC10IGxlYWYgIiRMaWJcJEZpbGUuZGxsIil9DQogICAgICAgICJeZnVuY3Rpb246KC4qKSIgIHtnY20gJE1hdGNoZXNbMV0gLWVhIFNpbGVudGx5Q29udGludWV9DQogICAgICAgICJec3RyaWN0X2Z1bmN0aW9uOiguKikiICB7VGVzdC1QYXRoICJGdW5jdGlvbjpcJCgkTWF0Y2hlc1sxXSkifQ0KICAgIH0pDQogICAgaWYgKCEkU3RhdCkgeyRPbkZhaWwuSW52b2tlKCl9DQogICAgaWYgKCRQYXNzVGhydSkge3JldHVybiAkU3RhdH0NCn0KCmZ1bmN0aW9uIFRhYi1UZXh0IHtwYXJhbShbU3RyaW5nXSRUZXh0LCBbaW50XSROdW1UYWJzPTEsIFtpbnRdJFRhYlNpemUgPSA0LCBbY2hhcl0kVGFiQ2hhciA9ICIgIikNCg0KICAgICRUYWIgPSAoIiRUYWJDaGFyIiokVGFiU2l6ZSkqJE51bVRhYnM7JGluZGV4PTANCiAgICAkV2luID0gW0NvbnNvbGVdOjpCdWZmZXJXaWR0aC0xOyRTdHIgPSAiIg0KICAgIGZvcmVhY2ggKCRjIGluICRUZXh0LlRvQ2hhckFycmF5KCkpIHsNCiAgICAgICAgaWYgKCEoJEluZGV4JSRXaW4pKSB7JFN0ciArPSAkVGFiOyRJbmRleCs9JFRhYi5MZW5ndGh9DQogICAgICAgICRTdHIgKz0gJGMNCiAgICAgICAgJGluZGV4KysNCiAgICB9DQogICAgcmV0dXJuICRTdHINCn0KCmZ1bmN0aW9uIFdyaXRlLUFQIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsIFtTd2l0Y2hdJE5vU2lnbiwgW1N3aXRjaF0kUGxhaW5UZXh0LCBbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JywgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICBpZiAoJHRleHQuY291bnQgLWd0IDEgLW9yICR0ZXh0LkdldFR5cGUoKS5OYW1lIC1tYXRjaCAiXFtcXSQiKSB7cmV0dXJuICRUZXh0IHw/eyIkXyJ9fCAlIHtXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ259fQ0KICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+WytcLSFcKlwjXSkoPzx3Pi4qKSIpIHtyZXR1cm4gJFRleHR9DQogICAgJHRiICA9ICIgICAgIiokTWF0Y2hlcy50Lmxlbmd0aDsNCiAgICAkQ29sID0gQHsnKyc9JzInOyctJz0nMTInOychJz0nMTQnOycqJz0nMyc7JyMnPSdEYXJrR3JheSd9WygkU2lnbiA9ICRNYXRjaGVzLlMpXQ0KICAgIGlmICghJENvbCkge1Rocm93ICJJbmNvcnJlY3QgU2lnbiBbJFNpZ25dIFBhc3NlZCEifQ0KICAgICRTaWduID0gJChpZiAoJE5vU2lnbiAtb3IgJE1hdGNoZXMuTlMpIHsiIn0gZWxzZSB7IlskU2lnbl0gIn0pDQogICAgQVAtUmVxdWlyZSAiZnVuY3Rpb246QWxpZ24tVGV4dCIge2Z1bmN0aW9uIEdsb2JhbDpBbGlnbi1UZXh0KCRhbGlnbiwkdGV4dCkgeyR0ZXh0fX0NCiAgICAkRGF0YSA9ICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiO2lmICghJERhdGEpIHtyZXR1cm59DQogICAgJERhdGEgPSBBbGlnbi1UZXh0IC1BbGlnbiAkQWxpZ24gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSINCiAgICBpZiAoJFBsYWluVGV4dCkge3JldHVybiAkRGF0YX0NCiAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmU6JChbYm9vbF0kTWF0Y2hlcy5OTkwpIC1mICRDb2wgJERhdGENCiAgICBpZiAoJFBhc3NUaHJ1KSB7JERhdGF9DQp9CgpmdW5jdGlvbiBaaXAtQXJyYXlzIHtwYXJhbSgkeCkNCg0KICAgIGlmICgkeC5jb3VudCAtbGUgMSkge3Rocm93ICJbQVAtUHl0aG9uXSBaaXAgYXJndW1lbnQgIzEgbXVzdCBzdXBwb3J0IGl0ZXJhdGlvbiJ9DQogICAgJGNudCA9ICR4WzBdLmNvdW50DQogICAgJHggfCA/IHskXy5jb3VudCAtbHQgJGNudH0gfCAlIHskY250ID0gJF99DQogICAgJEFycmF5ID0gTmV3LU9iamVjdCBPYmplY3RbXVtdICRDbnQsJHguY291bnQNCiAgICAwLi4oJENudC0xKSB8ICUgew0KICAgICAgICAkaSA9ICRfDQogICAgICAgIDAuLigkeC5jb3VudC0xKSB8ICUgeyRBcnJheVskaV1bJF9dID0gQChAKCR4KVskX10pWyRpXX0NCiAgICB9DQogICAgcmV0dXJuICRBcnJheQ0KfQoKZnVuY3Rpb24gQ2xlYXItTGluZSB7DQogICAgJE5tID0gW0NvbnNvbGVdOjpXaW5kb3dXaWR0aA0KICAgICR0ID0gW0NvbnNvbGVdOjpDdXJzb3JUb3A7W0NvbnNvbGVdOjpDdXJzb3JMZWZ0PTANCiAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmUgKCIgIiokTk0pDQogICAgW0NvbnNvbGVdOjpDdXJzb3JUb3A9JHQ7W0NvbnNvbGVdOjpDdXJzb3JMZWZ0PTANCn0KCmZ1bmN0aW9uIFBzdy1Qcm9tcHQge3BhcmFtKFtBbGlhcygiUHJvbXB0IildW1N0cmluZ10kVGV4dCA9ICJFbnRlciBQYXNzd29yZCA6ICIsIFtTd2l0Y2hdJFNob3dNYXNrZWRQc3csIFtjaGFyXSRNYXNrPSLigKIiLCBbU3dpdGNoXSRGb3JjZVZhbGlkYXRpb24sIFtzY3JpcHRibG9ja10kVmFsaWRhdG9yPXszfSkNCg0KICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAkVGV4dA0KICAgICRSZVJlZ1ggPSAnW15ceDAxLVx4MDhceDEwLVx4ODBdKycjJ1teXHdcLl0nDQogICAgJFBzdyA9ICIiDQogICAgJEN2aXMgPSBbQ29uc29sZV06OkN1cnNvclZpc2libGUNCiAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkRmFsc2UNCiAgICBpZiAoISRTaG93TWFza2VkUHN3KSB7JFZhbGlkYXRvcj17M319DQogICAgJENvdW50ID0gMTskU2xlZXAgPSAwDQogICAgV2hpbGUgKCRUcnVlKSB7DQogICAgICAgIGlmICgkY291bnQgLWd0IDI1MCkgeyRTbGVlcCA9IDI1MH0NCiAgICAgICAgJFRlc3QgPSAmJFZhbGlkYXRvcg0KICAgICAgICBpZiAoJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlKSB7JFN0b3JlID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiSW5jbHVkZUtleURvd24sTm9FY2hvIik7JENvdW50PTA7JFNsZWVwPTB9IGVsc2UgeyRDb3VudCsrO1N0YXJ0LVNsZWVwIC1tICRTbGVlcDtjb250aW51ZX0NCiAgICAgICAgaWYgKEtleVByZXNzZWQgIn5+QmFja1NwYWNlfn4iICRTdG9yZSkge2lmICgkc3RvcmUuQ29udHJvbEtleVN0YXRlIC1tYXRjaCAiY3RybCIpIHskUHN3PSIifSBlbHNlIHskUHN3ID0gPzogKCRQc3cuTGVuZ3RoIC1lcSAwKXsiIn17JFBzdy5zdWJzdHJpbmcoMCwkUHN3Lkxlbmd0aC0xKX19fQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+U3BhY2V+fiIgJFN0b3JlKSB7JFBzdyArPSAiICJ9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5Fc2NhcGV+fiIgJFN0b3JlKSB7JHBzdz0iIjticmVha30NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+fkVOVEVSfn4iICRTdG9yZSkge1dyaXRlLUhvc3QgIiI7aWYgKFtpbnRdJFRlc3QgLW5lIDMpIHtpZiAoJFRlc3QgLW9yICEkRm9yY2VWYWxpZGF0aW9uKSB7YnJlYWt9IGVsc2Uge1dyaXRlLUhvc3QgLWYgWWVsbG93IC1Ob05ld0xpbmUgIk11c3RUeXBlIGluIGEgdmFsaWQgUGFzc3dvcmQuLi4iO3N0YXJ0LXNsZWVwIC1zIDI7Q2xlYXItTGluZTtbQ29uc29sZV06OkN1cnNvclRvcC09MX19ZWxzZXticmVha319IGVsc2UgDQogICAgICAgIHskUHN3ICs9ICRTdG9yZS5DaGFyYWN0ZXIgLXJlcGxhY2UgKCRSZVJlZ1gsJycpfQ0KICAgICAgICBpZiAoJFNob3dNYXNrZWRQc3cpIHsNCiAgICAgICAgICAgICR3dCA9IFtDb25zb2xlXTo6QnVmZmVyV2lkdGggLSAkdGV4dC5sZW5ndGggLSAxDQogICAgICAgICAgICAkVGVzdCA9ICYkVmFsaWRhdG9yDQogICAgICAgICAgICBbQ29uc29sZV06OkN1cnNvcmxlZnQgPSAkdGV4dC5sZW5ndGgNCiAgICAgICAgICAgIGlmICgkd3QtJFBzdy5MZW5ndGggLWx0IDApIHskdGI9IiI7JHR0PSIkTWFzayIqKCR3dC0zKSsiLi4uIn0gZWxzZSB7JHRiPSIgIiooJHd0LSRQc3cuTGVuZ3RoKTskdHQ9IiRNYXNrIiokUHN3Lkxlbmd0aH0NCiAgICAgICAgICAgICRmY29sID0gW2NvbnNvbGVdOjpGb3JlZ3JvdW5kQ29sb3INCiAgICAgICAgICAgIGlmIChbaW50XSRUZXN0IC1uZSAzKSB7DQogICAgICAgICAgICAgICAgJGZDb2wgPSA/OigkVGVzdCkgezJ9IHsicmVkIn0NCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAtZiAkZkNvbCAkdHQkdGINCiAgICAgICAgfQ0KICAgIH0NCiAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkQ3Zpcw0KICAgIHJldHVybiAkcHN3DQp9CgpmdW5jdGlvbiBHZXQtRmlsZUhhc2gge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRGaWxlKQ0KDQogICAgaWYgKCEoVGVzdC1QYXRoIC10eXBlIGxlYWYgJEZpbGUpKSB7VGhyb3cgIltHZXQtRmlsZUhhc2hdIEZpbGUgWyRGaWxlXSBOb3QgZm91bmQifQ0KICAgICRGaWxlID0gInswfSIgLWYgKFJlc29sdmUtUGF0aCAkRmlsZSkNCiAgICAkYSA9IFtTeXN0ZW0uU2VjdXJpdHkuQ3J5cHRvZ3JhcGh5Lk1ENV06OkNyZWF0ZSgpDQogICAgJEhhc2ggPSAkYS5Db21wdXRlSGFzaChbSU8uRmlsZV06OlJlYWRBbGxCeXRlcygkRmlsZSkpIC1qb2luICI6Ig0KICAgICRhLkRpc3Bvc2UoKQ0KICAgIFJldHVybiAkSGFzaA0KfQoKZnVuY3Rpb24gQXNrLU9FLVFTVE4ge3BhcmFtKCRRKQ0KDQogICAgTG9hZC1Gb3Jtcw0KICAgICRGb3JtLkNvbnRyb2xzLkZpbmQoIkFuc3dlciIsJHRydWUpWzBdLnRleHQgPSAiIg0KICAgICRGb3JtLkNvbnRyb2xzLkZpbmQoIlF1ZXN0aW9uIiwkdHJ1ZSlbMF0udGV4dCA9ICRRDQogICAgJEZvcm0uU2hvd0RpYWxvZygpIHwgT3V0LU51bGwNCiAgICByZXR1cm4gJEZvcm0uQ29udHJvbHMuRmluZCgiQW5zd2VyIiwkdHJ1ZSlbMF0udGV4dA0KfQoKZnVuY3Rpb24gR2V0LVdoZXJlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSldW3N0cmluZ10kRmlsZSwgW1N3aXRjaF0kQWxsKQ0KDQogICAgQVAtUmVxdWlyZSAiZGVwOndoZXJlIiB7dGhyb3cgIk5lZWQgU3lzMzJcd2hlcmUgdG8gd29yayEiO3JldHVybn0NCiAgICAkT3V0ID0gd2hlcmUuZXhlICRmaWxlIDI+JG51bGwNCiAgICBpZiAoISRPdXQpIHtyZXR1cm59DQogICAgaWYgKCRBbGwpIHtyZXR1cm4gJE91dH0NCiAgICByZXR1cm4gQCgkT3V0KVswXQ0KfQoKZnVuY3Rpb24gUGF1c2Uge3BhcmFtKFtTdHJpbmddJFBhdXNlUSA9ICJQcmVzcyBhbnkga2V5IHRvIGNvbnRpbnVlIC4gLiAuICIpDQoNCiAgICBXcml0ZS1Ib3N0IC1ub05ld2xpbmUgJFBhdXNlUQ0KICAgICRudWxsID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiTm9FY2hvLCBJbmNsdWRlS2V5RG93biIpDQogICAgV3JpdGUtSG9zdCAiIg0KfQoKZnVuY3Rpb24gTG9hZC1JbnRlcm5ldCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXSRJRSwgW0ludF0kSW50ZXJ2YWwgPSA1MCkNCg0KICAgIFdoaWxlICgkSUUuQnVzeSkgew0KICAgICAgICBTdGFydC1TbGVlcCAtbSAkSW50ZXJ2YWwNCiAgICB9DQp9CgpmdW5jdGlvbiBGbGF0dGVuIHtwYXJhbShbb2JqZWN0W11dJHgpDQppZiAoJFguY291bnQgLWVxIDEpIHtyZXR1cm4gJHggfCAlIHskX319IGVsc2UgeyR4IHwgJSB7RmxhdHRlbiAkX319fQoKU2V0LUFsaWFzIGludiBQcm9jZXNzLVRyYW5zcGFyZW5jeQpTZXQtQWxpYXMgPzogSW52b2tlLVRlcm5hcnk=")))
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
    $f = (ls *.* -ex "readme.md" | ? {$_.name -notmatch "^\."} | Get-Random).Name
    $Data = try {$Maps[$SrcMap[$f]]} catch {};if (!$Data) {Write-AP ">-Could Not get Data for this project, please add to MapFile.";$END.Invoke();return}
    if (!(Test-Path -type Container ".git")) {
        Write-AP ">*Initializing git for [$($Data.Name)]"
        $null = git init
    }
    if (git ls-remote "https://github.com/$($Data.GitHub[1])" 2>$null) {
        if (!(Test-Path "LICENSE") -or !(Test-Path "README.md")) {
            Write-AP ">*Issuing a pull request from [$($Data.GitHub[1])]"
            $Rand = Get-Random
            md "$Rand-Folder" | Out-Null;ls | ? name -ne $Rand-Folder | % {mv $_ "$Rand-Folder"}
            $a = git pull "https://github.com/$($Data.GitHub[1]).git" master 2>&1
            if ($a -match "failed|rejected|error") {$a}
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
        git remote add $Data.GitHub[0] "https://github.com/$($Data.GitHub[1]).git"
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
