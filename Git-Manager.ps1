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
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gSW5wdXQtUHJvbXB0IHtwYXJhbShbVmFsaWRhdGVOb3ROdWxsb3JFbXB0eSgpXVtTdHJpbmddJFByb21wdCA9ICJFbnRlciBUZXh0IDogIikNCg0KICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAkUHJvbXB0DQogICAgJFJlUmVnWCA9ICdbXlx4MDEtXHgwOFx4MTAtXHg4MF0rJyMnW15cd1wuXScgW9CQLdGP0IHRkV0NCiAgICAkVHJTdHJpbmcgPSAiIg0KICAgICRDdmlzID0gW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlDQogICAgW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlID0gJEZhbHNlDQogICAgJENvdW50ID0gMTskU2xlZXAgPSAwDQogICAgV2hpbGUgKCRUcnVlKSB7DQogICAgICAgIGlmICgkY291bnQgLWd0IDUwMCkgeyRTbGVlcCA9IDEwMH0NCiAgICAgICAgaWYgKCRIb3N0LlVJLlJhd1VJLktleUF2YWlsYWJsZSkgeyRTdG9yZSA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIkluY2x1ZGVLZXlVcCxOb0VjaG8iKTskQ291bnQ9MDskU2xlZXA9MH0gZWxzZSB7JENvdW50Kys7U3RhcnQtU2xlZXAgLW0gJFNsZWVwO2NvbnRpbnVlfQ0KICAgICAgICBpZiAoS2V5UHJlc3NlZCAifn5CYWNrU3BhY2V+fiIgJFN0b3JlKSB7aWYgKCRzdG9yZS5Db250cm9sS2V5U3RhdGUgLW1hdGNoICJjdHJsIikgeyRUclN0cmluZz0iIn0gZWxzZSB7JFRyU3RyaW5nID0gPzogKCRUclN0cmluZy5MZW5ndGggLWVxIDApeyIifXskVHJTdHJpbmcuc3Vic3RyaW5nKDAsJFRyU3RyaW5nLkxlbmd0aC0xKX19fQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+U3BhY2V+fiIgJFN0b3JlKSB7JFRyU3RyaW5nICs9ICIgIn0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+fkVzY2FwZX5+IiAkU3RvcmUpIHskVHJTdHJpbmc9IiI7YnJlYWt9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5FTlRFUn5+IiAkU3RvcmUpIHtXcml0ZS1Ib3N0ICIiO2JyZWFrfSBlbHNlIA0KICAgICAgICB7JFRyU3RyaW5nICs9ICRTdG9yZS5DaGFyYWN0ZXIgLXJlcGxhY2UgKCRSZVJlZ1gsJycpfQ0KICAgICAgICAkd3QgPSBbQ29uc29sZV06OkJ1ZmZlcldpZHRoIC0gJFByb21wdC5sZW5ndGggLSAxDQogICAgICAgIFtDb25zb2xlXTo6Q3Vyc29ybGVmdCA9ICRQcm9tcHQubGVuZ3RoDQogICAgICAgIGlmICgkd3QtJFRyU3RyaW5nLkxlbmd0aCAtbHQgMCkgew0KICAgICAgICAgICAgJHRiPSIiDQogICAgICAgICAgICAkdHQ9Ii4uLiIrJFRyU3RyaW5nLnN1YnN0cmluZygkVHJTdHJpbmcuTGVuZ3RoLSR3dCszKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgJHRiPSIgIiooJHd0LSRUclN0cmluZy5MZW5ndGgpDQogICAgICAgICAgICAkdHQ9JFRyU3RyaW5nDQogICAgICAgIH0NCiAgICAgICAgJGZjb2wgPSBbY29uc29sZV06OkZvcmVncm91bmRDb2xvcg0KICAgICAgICBXcml0ZS1ob3N0IC1ub25ld2xpbmUgLWYgJGZDb2wgJHR0JFRiDQogICAgfQ0KICAgIFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZSA9ICRDdmlzDQogICAgcmV0dXJuICRUUlN0cmluZw0KfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bU3RyaW5nXSRMaWIsIFtTY3JpcHRCbG9ja10kT25GYWlsPXt9LCBbU3dpdGNoXSRQYXNzdGhydSkNCg0KICAgIFtib29sXSRTdGF0ID0gJChzd2l0Y2ggLXJlZ2V4ICgkTGliLnRyaW0oKSkgew0KICAgICAgICAiXkludGVybmV0IiAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5kZXA6KC4qKSIgIHtpZiAoJE1hdGNoZXNbMV0gLW5lICJ3aGVyZSIpe0FQLVJlcXVpcmUgImRlcDp3aGVyZSIgeyRNT0RFPTJ9fWVsc2V7JE1PREU9Mn07aWYgKCRNT0RFLTIpe0dldC1XaGVyZSAkTWF0Y2hlc1sxXX1lbHNle3RyeXsmICRNYXRjaGVzWzFdICIvZmpmZGpmZHMgLS1kc2phaGRocyAtZHNqYWRqIiAyPiRudWxsOyJzdWNjIn1jYXRjaHt9fX0NCiAgICAgICAgIl5mdW5jdGlvbjooLiopIiAge2djbSAkTWF0Y2hlc1sxXSAtZWEgU2lsZW50bHlDb250aW51ZX0NCiAgICAgICAgIl5zdHJpY3RfZnVuY3Rpb246KC4qKSIgIHtUZXN0LVBhdGggIkZ1bmN0aW9uOlwkKCRNYXRjaGVzWzFdKSJ9DQogICAgfSkNCiAgICBpZiAoISRTdGF0KSB7JE9uRmFpbC5JbnZva2UoKX0NCiAgICBpZiAoJFBhc3N0aHJ1KSB7cmV0dXJuICRTdGF0fQ0KfQoKZnVuY3Rpb24gVGFiLVRleHQge3BhcmFtKFtTdHJpbmddJFRleHQsIFtpbnRdJE51bVRhYnM9MSwgW2ludF0kVGFiU2l6ZSA9IDQsIFtjaGFyXSRUYWJDaGFyID0gIiAiKQ0KDQogICAgJFRhYiA9ICgiJFRhYkNoYXIiKiRUYWJTaXplKSokTnVtVGFiczskaW5kZXg9MA0KICAgICRXaW4gPSBbQ29uc29sZV06OkJ1ZmZlcldpZHRoLTE7JFN0ciA9ICIiDQogICAgZm9yZWFjaCAoJGMgaW4gJFRleHQuVG9DaGFyQXJyYXkoKSkgew0KICAgICAgICBpZiAoISgkSW5kZXglJFdpbikpIHskU3RyICs9ICRUYWI7JEluZGV4Kz0kVGFiLkxlbmd0aH0NCiAgICAgICAgJFN0ciArPSAkYw0KICAgICAgICAkaW5kZXgrKw0KICAgIH0NCiAgICByZXR1cm4gJFN0cg0KfQoKZnVuY3Rpb24gV3JpdGUtQVAge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRUZXh0LCBbU3dpdGNoXSROb1NpZ24sIFtTd2l0Y2hdJFBsYWluVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nTGVmdCcpDQoNCiAgICBpZiAoISR0ZXh0IC1vciAkdGV4dCAtbWF0Y2ggIl5bXCtcLVwhXCp4XD4gXSskIikge3JldHVybn0NCiAgICAkYWNjICA9IEAoKCcrJywnMicpLCgnLScsJzEyJyksKCchJywnMTQnKSwoJyonLCczJykpDQogICAgJHRiICAgPSAnJzskZnVuYyAgID0gJGZhbHNlDQogICAgd2hpbGUgKCRUZXh0LmNoYXJzKDApIC1lcSAneCcpIHskZnVuYyA9ICR0cnVlOyAkVGV4dCA9ICRUZXh0LnN1YnN0cmluZygxKS50cmltKCl9DQogICAgd2hpbGUgKCRUZXh0LmNoYXJzKDApIC1lcSAnPicpIHskdGIgKz0gIiAgICAiOyAkVGV4dCA9ICRUZXh0LnN1YnN0cmluZygxKS50cmltKCl9DQogICAgJFNpZ24gPSAkVGV4dC5jaGFycygwKQ0KICAgICRUZXh0ID0gJFRleHQuc3Vic3RyaW5nKDEpLnRyaW0oKS5yZXBsYWNlKCcveFwnLCcnKS5yZXBsYWNlKCdbLl0nLCdbQ3VycmVudCBEaXJlY3RvcnldJykNCiAgICAkdmVycyA9ICRmYWxzZQ0KICAgIGZvcmVhY2ggKCRhciBpbiAkYWNjKSB7aWYgKCRhclswXSAtZXEgJHNpZ24pIHskdmVycyA9ICR0cnVlOyAkY2xyID0gJGFyWzFdOyAkU2lnbiA9ICJbJHtTaWdufV0gIn19DQogICAgaWYgKCEkdmVycykge1Rocm93ICJJbmNvcnJlY3QgU2lnbiBbJFNpZ25dIFBhc3NlZCEifQ0KICAgIEFQLVJlcXVpcmUgImZ1bmN0aW9uOkFsaWduLVRleHQiIHtmdW5jdGlvbiBBbGlnbi1UZXh0KCRhbGlnbiwkdGV4dCkgeyR0ZXh0fX0NCiAgICAkRGF0YSA9IEFsaWduLVRleHQgLUFsaWduICRBbGlnbiAkdGIkKGlmICghJE5vU2lnbikgeyRTaWdufSkkVGV4dA0KICAgIGlmICgkUGxhaW5UZXh0KSB7cmV0dXJuICREYXRhfQ0KICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZTokZnVuYyAtZiAkY2xyICREYXRhDQp9CgpmdW5jdGlvbiBaaXAtQXJyYXlzIHtwYXJhbSgkeCkNCg0KICAgIGlmICgkeC5jb3VudCAtbGUgMSkge3Rocm93ICJbQVAtUHl0aG9uXSBaaXAgYXJndW1lbnQgIzEgbXVzdCBzdXBwb3J0IGl0ZXJhdGlvbiJ9DQogICAgJGNudCA9ICR4WzBdLmNvdW50DQogICAgJHggfCA/IHskXy5jb3VudCAtbHQgJGNudH0gfCAlIHskY250ID0gJF99DQogICAgJEFycmF5ID0gTmV3LU9iamVjdCBPYmplY3RbXVtdICRDbnQsJHguY291bnQNCiAgICAwLi4oJENudC0xKSB8ICUgew0KICAgICAgICAkaSA9ICRfDQogICAgICAgIDAuLigkeC5jb3VudC0xKSB8ICUgeyRBcnJheVskaV1bJF9dID0gQChAKCR4KVskX10pWyRpXX0NCiAgICB9DQogICAgcmV0dXJuICRBcnJheQ0KfQoKZnVuY3Rpb24gQ2xlYXItTGluZSB7DQogICAgJE5tID0gJEhvc3QuVUkuUmF3VUkuV2luZG93U2l6ZS5XaWR0aC0xDQogICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lICIkKCgiYGIiKiROTSkrKCIgIiokTk0pKygiYGIiKiROTSkpIg0KfQoKZnVuY3Rpb24gUHN3LVByb21wdCB7cGFyYW0oW0FsaWFzKCJQcm9tcHQiKV1bU3RyaW5nXSRUZXh0ID0gIkVudGVyIFBhc3N3b3JkIDogIiwgW1N3aXRjaF0kU2hvd01hc2tlZFBzdywgW2NoYXJdJE1hc2s9IuKAoiIsIFtTd2l0Y2hdJEZvcmNlVmFsaWRhdGlvbiwgW3NjcmlwdGJsb2NrXSRWYWxpZGF0b3I9ezN9KQ0KDQogICAgV3JpdGUtaG9zdCAtbm9uZXdsaW5lICRUZXh0DQogICAgJFJlUmVnWCA9ICdbXlx4MDEtXHgwOFx4MTAtXHg4MF0rJyMnW15cd1wuXScNCiAgICAkUHN3ID0gIiINCiAgICAkQ3ZpcyA9IFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZQ0KICAgIFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZSA9ICRGYWxzZQ0KICAgIGlmICghJFNob3dNYXNrZWRQc3cpIHskVmFsaWRhdG9yPXszfX0NCiAgICAkQ291bnQgPSAxOyRTbGVlcCA9IDANCiAgICBXaGlsZSAoJFRydWUpIHsNCiAgICAgICAgaWYgKCRjb3VudCAtZ3QgMjUwKSB7JFNsZWVwID0gMjUwfQ0KICAgICAgICAkVGVzdCA9ICYkVmFsaWRhdG9yDQogICAgICAgIGlmICgkSG9zdC5VSS5SYXdVSS5LZXlBdmFpbGFibGUpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIik7JENvdW50PTA7JFNsZWVwPTB9IGVsc2UgeyRDb3VudCsrO1N0YXJ0LVNsZWVwIC1tICRTbGVlcDtjb250aW51ZX0NCiAgICAgICAgaWYgKEtleVByZXNzZWQgIn5+QmFja1NwYWNlfn4iICRTdG9yZSkge2lmICgkc3RvcmUuQ29udHJvbEtleVN0YXRlIC1tYXRjaCAiY3RybCIpIHskUHN3PSIifSBlbHNlIHskUHN3ID0gPzogKCRQc3cuTGVuZ3RoIC1lcSAwKXsiIn17JFBzdy5zdWJzdHJpbmcoMCwkUHN3Lkxlbmd0aC0xKX19fQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+U3BhY2V+fiIgJFN0b3JlKSB7JFBzdyArPSAiICJ9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5Fc2NhcGV+fiIgJFN0b3JlKSB7JHBzdz0iIjticmVha30NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+fkVOVEVSfn4iICRTdG9yZSkge1dyaXRlLUhvc3QgIiI7aWYgKFtpbnRdJFRlc3QgLW5lIDMpIHtpZiAoJFRlc3QgLW9yICEkRm9yY2VWYWxpZGF0aW9uKSB7YnJlYWt9IGVsc2Uge1dyaXRlLUhvc3QgLWYgWWVsbG93IC1Ob05ld0xpbmUgIk11c3RUeXBlIGluIGEgdmFsaWQgUGFzc3dvcmQuLi4iO3N0YXJ0LXNsZWVwIC1zIDI7Q2xlYXItTGluZTtbQ29uc29sZV06OkN1cnNvclRvcC09MX19ZWxzZXticmVha319IGVsc2UgDQogICAgICAgIHskUHN3ICs9ICRTdG9yZS5DaGFyYWN0ZXIgLXJlcGxhY2UgKCRSZVJlZ1gsJycpfQ0KICAgICAgICBpZiAoJFNob3dNYXNrZWRQc3cpIHsNCiAgICAgICAgICAgICR3dCA9IFtDb25zb2xlXTo6QnVmZmVyV2lkdGggLSAkdGV4dC5sZW5ndGggLSAxDQogICAgICAgICAgICAkVGVzdCA9ICYkVmFsaWRhdG9yDQogICAgICAgICAgICBbQ29uc29sZV06OkN1cnNvcmxlZnQgPSAkdGV4dC5sZW5ndGgNCiAgICAgICAgICAgIGlmICgkd3QtJFBzdy5MZW5ndGggLWx0IDApIHskdGI9IiI7JHR0PSIkTWFzayIqKCR3dC0zKSsiLi4uIn0gZWxzZSB7JHRiPSIgIiooJHd0LSRQc3cuTGVuZ3RoKTskdHQ9IiRNYXNrIiokUHN3Lkxlbmd0aH0NCiAgICAgICAgICAgICRmY29sID0gW2NvbnNvbGVdOjpGb3JlZ3JvdW5kQ29sb3INCiAgICAgICAgICAgIGlmIChbaW50XSRUZXN0IC1uZSAzKSB7DQogICAgICAgICAgICAgICAgJGZDb2wgPSA/OigkVGVzdCkgezJ9IHsicmVkIn0NCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAtZiAkZkNvbCAkdHQkdGINCiAgICAgICAgfQ0KICAgIH0NCiAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkQ3Zpcw0KICAgIHJldHVybiAkcHN3DQp9CgpmdW5jdGlvbiBHZXQtRmlsZUhhc2gge3BhcmFtKFtTdHJpbmddJEZpbGUpDQoNCiAgICBpZiAoIShUZXN0LVBhdGggLXR5cGUgbGVhZiAkRmlsZSkpIHtUaHJvdyAiW0dldC1GaWxlSGFzaF0gRmlsZSBOb3QgZm91bmQifQ0KICAgICRGaWxlID0gInswfSIgLWYgKFJlc29sdmUtUGF0aCAkRmlsZSkNCiAgICAkYSA9IFtTeXN0ZW0uU2VjdXJpdHkuQ3J5cHRvZ3JhcGh5Lk1ENV06OkNyZWF0ZSgpDQogICAgJEhhc2ggPSAkYS5Db21wdXRlSGFzaChbSU8uRmlsZV06OlJlYWRBbGxCeXRlcygkRmlsZSkpIC1qb2luICI6Ig0KICAgICRhLkRpc3Bvc2UoKQ0KICAgIFJldHVybiAkSGFzaA0KfQoKZnVuY3Rpb24gQXNrLU9FLVFTVE4ge3BhcmFtKCRRKQ0KDQogICAgTG9hZC1Gb3Jtcw0KICAgICRGb3JtLkNvbnRyb2xzLkZpbmQoIkFuc3dlciIsJHRydWUpWzBdLnRleHQgPSAiIg0KICAgICRGb3JtLkNvbnRyb2xzLkZpbmQoIlF1ZXN0aW9uIiwkdHJ1ZSlbMF0udGV4dCA9ICRRDQogICAgJEZvcm0uU2hvd0RpYWxvZygpIHwgT3V0LU51bGwNCiAgICByZXR1cm4gJEZvcm0uQ29udHJvbHMuRmluZCgiQW5zd2VyIiwkdHJ1ZSlbMF0udGV4dA0KfQoKZnVuY3Rpb24gUGF1c2Uge3BhcmFtKFtTdHJpbmddJFBhdXNlUSA9ICJQcmVzcyBhbnkga2V5IHRvIGNvbnRpbnVlIC4gLiAuICIpDQoNCiAgICBXcml0ZS1Ib3N0IC1ub05ld2xpbmUgJFBhdXNlUQ0KICAgICRudWxsID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiTm9FY2hvLCBJbmNsdWRlS2V5dXAiKQ0KICAgIFdyaXRlLUhvc3QgIiINCn0KCmZ1bmN0aW9uIExvYWQtSW50ZXJuZXQge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV0kSUUsIFtJbnRdJEludGVydmFsID0gNTApDQoNCiAgICBXaGlsZSAoJElFLkJ1c3kpIHsNCiAgICAgICAgU3RhcnQtU2xlZXAgLW0gJEludGVydmFsDQogICAgfQ0KfQoKZnVuY3Rpb24gRmxhdHRlbiB7cGFyYW0oW29iamVjdFtdXSR4KQ0KaWYgKCRYLmNvdW50IC1lcSAxKSB7cmV0dXJuICR4IHwgJSB7JF99fSBlbHNlIHskeCB8ICUge0ZsYXR0ZW4gJF99fX0KCmZ1bmN0aW9uIEFQLVJlcXVpcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bQWxpYXMoIkZ1bmN0aW9uYWxpdHkiLCJMaWJyYXJ5IildW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbD17fSwgW1N3aXRjaF0kUGFzc3RocnUpDQoNCiAgICBbYm9vbF0kU3RhdCA9ICQoc3dpdGNoIC1yZWdleCAoJExpYi50cmltKCkpIHsNCiAgICAgICAgIl5JbnRlcm5ldCIgIHt0ZXN0LWNvbm5lY3Rpb24gZ29vZ2xlLmNvbSAtQ291bnQgMSAtUXVpZXR9DQogICAgICAgICJeZGVwOiguKikiICB7aWYgKCRNYXRjaGVzWzFdIC1uZSAid2hlcmUiKXtBUC1SZXF1aXJlICJkZXA6d2hlcmUiIHskTU9ERT0yfX1lbHNleyRNT0RFPTJ9O2lmICgkTU9ERS0yKXtHZXQtV2hlcmUgJE1hdGNoZXNbMV19ZWxzZXt0cnl7JiAkTWF0Y2hlc1sxXSAiL2ZqZmRqZmRzIC0tZHNqYWhkaHMgLWRzamFkaiIgMj4kbnVsbDsic3VjYyJ9Y2F0Y2h7fX19DQogICAgICAgICJeZnVuY3Rpb246KC4qKSIgIHtnY20gJE1hdGNoZXNbMV0gLWVhIFNpbGVudGx5Q29udGludWV9DQogICAgICAgICJec3RyaWN0X2Z1bmN0aW9uOiguKikiICB7VGVzdC1QYXRoICJGdW5jdGlvbjpcJCgkTWF0Y2hlc1sxXSkifQ0KICAgIH0pDQogICAgaWYgKCEkU3RhdCkgeyRPbkZhaWwuSW52b2tlKCl9DQogICAgaWYgKCRQYXNzdGhydSkge3JldHVybiAkU3RhdH0NCn0K")))
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
    $Data = try {$Maps[$SrcMap.((ls *.* -ex "readme.md" | Get-Random).Name)]} catch {};if (!$Data) {Write-AP ">-Could Not get Data for this project, please add to MapFile.";$END.Invoke();return}
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
        Write-AP "*Creating Hash Entry for [$FOLD$_]";$Hash.$_ = Get-FileHash "$PShell\$FOLD$_";$Changed += ,$_
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
