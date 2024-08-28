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
      $) Supports wildcard scanning and nested compilations
|==============================================================================>|
#>
[CmdLetBinding(DefaultParameterSetName="None")]
param([parameter(ParameterSetName="R",Position=0)][Switch]$Rebuild, [Switch]$AcceptAll,[parameter(ParameterSetName="R",Position=1)][Alias("Msg")]$Message)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler 1.6 (APC: 1.2) To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
$Script:AP_Console = @{version=[version]'1.2'; isShim = $true}
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")     [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gS2V5VHJhbnNsYXRlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kS2V5KQoNCiAgICAkSGFzaEtleSA9IEB7DQogICAgICAgICJ+fkN0cmxDfn4iPTY3DQogICAgICAgICJ+flNwYWNlfn4iPTMyDQogICAgICAgICJ+fkVTQ0FQRX5+Ij0yNw0KICAgICAgICAifn5FbnRlcn5+Ij0xMw0KICAgICAgICAifn5TaGlmdH5+Ij0xNg0KICAgICAgICAifn5Db250cm9sfn4iPTE3DQogICAgICAgICJ+fkFsdH5+Ij0xOA0KICAgICAgICAifn5CYWNrU3BhY2V+fiI9OA0KICAgICAgICAifn5EZWxldGV+fiI9NDYNCiAgICAgICAgIn5+ZjF+fiI9MTEyDQogICAgICAgICJ+fmYyfn4iPTExMw0KICAgICAgICAifn5mM35+Ij0xMTQNCiAgICAgICAgIn5+ZjR+fiI9MTE1DQogICAgICAgICJ+fmY1fn4iPTExNg0KICAgICAgICAifn5mNn5+Ij0xMTcNCiAgICAgICAgIn5+Zjd+fiI9MTE4DQogICAgICAgICJ+fmY4fn4iPTExOQ0KICAgICAgICAifn5mOX5+Ij0xMjANCiAgICAgICAgIn5+ZjEwfn4iPTEyMQ0KICAgICAgICAifn5mMTF+fiI9MTIyDQogICAgICAgICJ+fmYxMn5+Ij0xMjMNCiAgICAgICAgIn5+TXV0ZX5+Ij0xNzMNCiAgICAgICAgIn5+SW5zZXJ0fn4iPTQ1DQogICAgICAgICJ+flBhZ2VVcH5+Ij0zMw0KICAgICAgICAifn5QYWdlRG93bn5+Ij0zNA0KICAgICAgICAifn5FTkR+fiI9MzUNCiAgICAgICAgIn5+SE9NRX5+Ij0zNg0KICAgICAgICAifn50YWJ+fiI9OQ0KICAgICAgICAifn5DYXBzTG9ja35+Ij0yMA0KICAgICAgICAifn5OdW1Mb2Nrfn4iPTE0NA0KICAgICAgICAifn5TY3JvbGxMb2Nrfn4iPTE0NQ0KICAgICAgICAifn5XaW5kb3dzfn4iPTkxDQogICAgICAgICJ+fkxlZnR+fiI9MzcNCiAgICAgICAgIn5+VXB+fiI9MzgNCiAgICAgICAgIn5+UmlnaHR+fiI9MzkNCiAgICAgICAgIn5+RG93bn5+Ij00MA0KICAgICAgICAifn5LUDB+fiI9OTYNCiAgICAgICAgIn5+S1Axfn4iPTk3DQogICAgICAgICJ+fktQMn5+Ij05OA0KICAgICAgICAifn5LUDN+fiI9OTkNCiAgICAgICAgIn5+S1A0fn4iPTEwMA0KICAgICAgICAifn5LUDV+fiI9MTAxDQogICAgICAgICJ+fktQNn5+Ij0xMDINCiAgICAgICAgIn5+S1A3fn4iPTEwMw0KICAgICAgICAifn5LUDh+fiI9MTA0DQogICAgICAgICJ+fktQOX5+Ij0xMDUNCiAgICB9DQogICAgaWYgKFtpbnRdJENvbnZlcnQgPSAkSGFzaEtleS4kS2V5KSB7cmV0dXJuICRDb252ZXJ0fQ0KICAgIFRocm93ICJJbnZhbGlkIFNwZWNpYWwgS2V5IENvbnZlcnNpb24iDQp9CgpmdW5jdGlvbiBQc3ctUHJvbXB0IHtwYXJhbShbQWxpYXMoIlByb21wdCIpXVtTdHJpbmddJFRleHQgPSAiRW50ZXIgUGFzc3dvcmQgOiAiLCBbU3dpdGNoXSRTaG93TWFza2VkUHN3LCBbY2hhcl0kTWFzaz04MjI2LCBbU3dpdGNoXSRGb3JjZVZhbGlkYXRpb24sIFtzY3JpcHRibG9ja10kVmFsaWRhdG9yPXszfSkKDQogICAgV3JpdGUtaG9zdCAtbm9uZXdsaW5lICRUZXh0DQogICAgJFJlUmVnWCA9ICdbXlx4MDEtXHgwOFx4MTAtXHg4MF0rJyMnW15cd1wuXScNCiAgICAkUHN3ID0gIiINCiAgICAkaVBvc3ggPSBbQ29uc29sZV06OkN1cnNvckxlZnQNCiAgICAkaVBvc3kgPSBbQ29uc29sZV06OkN1cnNvclRvcA0KICAgIHRyeSB7JEN2aXMgPSBbQ29uc29sZV06OkN1cnNvclZpc2libGV9IGNhdGNoIHskQ3ZpcyA9ICRUcnVlfQ0KICAgIFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZSA9ICRGYWxzZQ0KICAgIGlmICghJFNob3dNYXNrZWRQc3cpIHskVmFsaWRhdG9yPXszfX0NCiAgICAkQ291bnQgPSAxOyRTbGVlcCA9IDANCiAgICBXaGlsZSAoJFRydWUpIHsNCiAgICAgICAgaWYgKCRjb3VudCAtZ3QgMjUwKSB7JFNsZWVwID0gMjUwfQ0KICAgICAgICAkVGVzdCA9ICYkVmFsaWRhdG9yDQogICAgICAgIGlmICgkSG9zdC5VSS5SYXdVSS5LZXlBdmFpbGFibGUpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5RG93bixOb0VjaG8iKTskQ291bnQ9MDskU2xlZXA9MH0gZWxzZSB7JENvdW50Kys7U3RhcnQtU2xlZXAgLW0gJFNsZWVwO2NvbnRpbnVlfQ0KICAgICAgICBpZiAoS2V5UHJlc3NlZCAifn5CYWNrU3BhY2V+fiIgJFN0b3JlKSB7aWYgKCRzdG9yZS5Db250cm9sS2V5U3RhdGUgLW1hdGNoICJjdHJsIikgeyRQc3c9IiJ9IGVsc2UgeyRQc3cgPSA/OiAoJFBzdy5MZW5ndGggLWVxIDApeyIifXskUHN3LnN1YnN0cmluZygwLCRQc3cuTGVuZ3RoLTEpfX19DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5TcGFjZX5+IiAkU3RvcmUpIHskUHN3ICs9ICIgIn0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+fkVzY2FwZX5+IiAkU3RvcmUpIHskcHN3PSIiO2JyZWFrfQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+RU5URVJ+fiIgJFN0b3JlKSB7V3JpdGUtSG9zdCAiIjtpZiAoW2ludF0kVGVzdCAtbmUgMykge2lmICgkVGVzdCAtb3IgISRGb3JjZVZhbGlkYXRpb24pIHticmVha30gZWxzZSB7V3JpdGUtSG9zdCAtZiBZZWxsb3cgLU5vTmV3TGluZSAiTXVzdCBUeXBlIGluIGEgdmFsaWQgUGFzc3dvcmQuLi4iO3N0YXJ0LXNsZWVwIC1zIDI7Q2xlYXItTGluZTtbQ29uc29sZV06OkN1cnNvclRvcC09MX19ZWxzZXticmVha319IGVsc2UgDQogICAgICAgIHskUHN3ICs9ICRTdG9yZS5DaGFyYWN0ZXIgLXJlcGxhY2UgKCRSZVJlZ1gsJycpfQ0KICAgICAgICBpZiAoJFNob3dNYXNrZWRQc3cpIHsNCiAgICAgICAgICAgICR3dCA9IFtDb25zb2xlXTo6QnVmZmVyV2lkdGggLSAkaVBvc3ggLSAxDQogICAgICAgICAgICAkVGVzdCA9ICYkVmFsaWRhdG9yDQogICAgICAgICAgICBbQ29uc29sZV06OkN1cnNvcmxlZnQgPSAkaVBvc3gNCiAgICAgICAgICAgIGlmICgkd3QgLSAkUHN3Lkxlbmd0aCAtbHQgMCkgeyR0Yj0iIjskdHQ9IiRNYXNrIiooJHd0LTMpKyIuLi4ifSBlbHNlIHskdGI9IiAiKigkd3QtJFBzdy5MZW5ndGgpOyR0dD0iJE1hc2siKiRQc3cuTGVuZ3RofQ0KICAgICAgICAgICAgJGZjb2wgPSBbY29uc29sZV06OkZvcmVncm91bmRDb2xvcg0KICAgICAgICAgICAgaWYgKFtpbnRdJFRlc3QgLW5lIDMpIHsNCiAgICAgICAgICAgICAgICAkZkNvbCA9ID86KCRUZXN0KSB7Mn0geyJyZWQifQ0KICAgICAgICAgICAgfQ0KICAgICAgICAgICAgV3JpdGUtaG9zdCAtbm9uZXdsaW5lIC1mICRmQ29sICR0dCR0Yg0KICAgICAgICB9DQogICAgfQ0KICAgIHRyeSB7W0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlID0gJEN2aXN9IGNhdGNoIHt9DQogICAgcmV0dXJuICRwc3cNCn0KCmZ1bmN0aW9uIExvYWQtSW50ZXJuZXQge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV0kSUUsIFtJbnRdJEludGVydmFsID0gNTApCg0KICAgIFdoaWxlICgkSUUuQnVzeSkgew0KICAgICAgICBTdGFydC1TbGVlcCAtbSAkSW50ZXJ2YWwNCiAgICB9DQp9CgpmdW5jdGlvbiBHZXQtRmlsZUhhc2gge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRGaWxlKQoNCiAgICBpZiAoIShUZXN0LVBhdGggLXR5cGUgbGVhZiAkRmlsZSkpIHtUaHJvdyAiW0dldC1GaWxlSGFzaF0gRmlsZSBbJEZpbGVdIE5vdCBmb3VuZCJ9DQogICAgJEZpbGUgPSAiezB9IiAtZiAoUmVzb2x2ZS1QYXRoICRGaWxlKQ0KICAgICRhID0gW1N5c3RlbS5TZWN1cml0eS5DcnlwdG9ncmFwaHkuTUQ1XTo6Q3JlYXRlKCkNCiAgICAkSGFzaCA9ICRhLkNvbXB1dGVIYXNoKFtJTy5GaWxlXTo6UmVhZEFsbEJ5dGVzKCRGaWxlKSkgLWpvaW4gIjoiDQogICAgJGEuRGlzcG9zZSgpDQogICAgUmV0dXJuICRIYXNoDQp9CgpmdW5jdGlvbiBLZXlQcmVzc2VkQ29kZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtJbnRdJEtleSwgJFN0b3JlPSJeXl4iKQoNCiAgICBpZiAoISRIb3N0LlVJLlJhd1VJLktleUF2YWlsYWJsZSAtYW5kICRTdG9yZSAtZXEgIl5eXiIpIHtSZXR1cm4gJEZhbHNlfQ0KICAgIGlmICgkU3RvcmUgLWVxICJeXl4iKSB7JFN0b3JlID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiSW5jbHVkZUtleVVwLE5vRWNobyIpfQ0KICAgIHJldHVybiAoJEtleSAtaW4gJFN0b3JlLlZpcnR1YWxLZXlDb2RlKQ0KfQoKZnVuY3Rpb24gVGVzdC1BZG1pbmlzdHJhdG9yIHsNCiAgICBpZiAoJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCIpIHsNCiAgICAgICAgaWYgKCQod2hvYW1pKSAtZXEgInJvb3QiKSB7DQogICAgICAgICAgICByZXR1cm4gJHRydWUNCiAgICAgICAgfQ0KICAgICAgICBlbHNlIHsNCiAgICAgICAgICAgIHJldHVybiAkZmFsc2UNCiAgICAgICAgfQ0KICAgIH0NCiAgICAjIFdpbmRvd3MNCiAgICAoTmV3LU9iamVjdCBTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c1ByaW5jaXBhbCAoW1NlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzSWRlbnRpdHldOjpHZXRDdXJyZW50KCkpKS5Jc0luUm9sZShbU2VjdXJpdHkuUHJpbmNpcGFsLldpbmRvd3NCdWlsdGluUm9sZV06OkFkbWluaXN0cmF0b3IpDQp9CgpmdW5jdGlvbiBMb2FkLUZvcm1zIHsNCiAgICBpZiAoJEZvcm0pIHtyZXR1cm59DQogICAgQWRkLVR5cGUgLUFzc2VtYmx5TmFtZSBTeXN0ZW0uV2luZG93cy5Gb3Jtcw0KICAgICRTY3JpcHQ6Rm9ybSA9IE5ldy1PYmplY3Qgc3lzdGVtLldpbmRvd3MuRm9ybXMuRm9ybQ0KICAgICRGb3JtLlRleHQgPSAiRW50ZXIgSW5wdXQgZm9yIFF1ZXN0aW9uIjskRm9ybS5TaXplID0gIjU4OCwgMzcyIg0KICAgICRMYWJlbCA9IE5ldy1PYmplY3QgU3lzdGVtLldpbmRvd3MuRm9ybXMuTGFiZWw7JFRleHQgPSBOZXctT2JqZWN0IFN5c3RlbS5XaW5kb3dzLkZvcm1zLlRleHRCb3g7JEJUTiA9IE5ldy1PYmplY3QgU3lzdGVtLldpbmRvd3MuRm9ybXMuQnV0dG9uOyRCVE4uTmFtZSA9ICJleGl0cyI7JEJUTi5UZXh0ID0gIlN1Ym1pdCINCiAgICAkTGFiZWwuU2l6ZSA9ICI1NTEsIDEyNyI7JFRleHQuU2l6ZSA9ICI1NDgsIDE1OSI7JExhYmVsLkZvcmVDb2xvciA9ICJTbm93IjskQlROLmFkZF9jbGljayh7JEZvcm0uQ2xvc2UoKX0pOyRCVE4uTG9jYXRpb24gPSAiMjQxLCAzMDQiOyRCVE4uU2l6ZSA9ICI3NSwgMjMiDQogICAgJExhYmVsLkxvY2F0aW9uID0gIjksIDkiOyRUZXh0LkxvY2F0aW9uID0gIjksIDEzOSI7JExhYmVsLmFkZF9jbGljayh7VG8tQ2xpcGJvYXJkICgkRm9ybS5Db250cm9scy5GaW5kKCJRdWVzdGlvbiIsJHRydWUpWzBdLnRleHQpfSk7JFRleHQuYWRkX2NsaWNrKHtUby1DbGlwYm9hcmQgKCRGb3JtLkNvbnRyb2xzLkZpbmQoIkFuc3dlciIsJHRydWUpWzBdLnRleHQpfSkNCiAgICAkRm9ybS5NaW5pbWl6ZUJveCA9ICRGYWxzZTskRm9ybS5NYXhpbWl6ZUJveCA9ICRGYWxzZTskRm9ybS5XaW5kb3dTdGF0ZSA9ICJOb3JtYWwiDQogICAgJEZvcm0uU2hvd0luVGFza2JhciA9ICRGYWxzZTskRm9ybS5PcGFjaXR5ID0gMC44OyRGb3JtLlN0YXJ0UG9zaXRpb24gPSAiQ2VudGVyU2NyZWVuIjskVGV4dC5NYXJnaW49IjMsIDMsIDMsIDMiDQogICAgJEZvcm0uQmFja0NvbG9yID0gIk9yYW5nZSI7JEZvcm0uSWNvbiA9IFtzeXN0ZW0uZHJhd2luZy5pY29uXTo6RXh0cmFjdEFzc29jaWF0ZWRJY29uKCIkUFNIT01FXHBvd2Vyc2hlbGwuZXhlIikNCiAgICAkTGFiZWwuQmFja0NvbG9yID0gIk1hcm9vbiI7JFRleHQuQmFja0NvbG9yID0gIlBhbGVHb2xkZW5yb2QiDQogICAgJExhYmVsLkZvbnQgPSBOZXctT2JqZWN0IFN5c3RlbS5EcmF3aW5nLkZvbnQoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwxMi4yNSxbU3lzdGVtLkRyYXdpbmcuRm9udFN0eWxlXTo6cmVndWxhcikNCiAgICAkVGV4dC5Gb250ID0gTmV3LU9iamVjdCBTeXN0ZW0uRHJhd2luZy5Gb250KCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsMTEsW1N5c3RlbS5EcmF3aW5nLkZvbnRTdHlsZV06OlJlZ3VsYXIpDQogICAgJExhYmVsLlRleHRBbGlnbiA9ICJNaWRkbGVDZW50ZXIiOyRCVE4ubWFyZ2luPSIzLCAzLCAzLCAzIjskVGV4dC5NdWx0aUxpbmU9JFRydWUNCiAgICAkbGFiZWwuTmFtZSA9ICJRdWVzdGlvbiI7JFRleHQuTmFtZSA9ICJBbnN3ZXIiDQogICAgJEZvcm0uQ29udHJvbHMuQWRkKCRMYWJlbCk7JEZvcm0uQ29udHJvbHMuQWRkKCRUZXh0KTskRm9ybS5Db250cm9scy5BZGQoJEJUTikNCiAgICAkRm9ybS5BY2NlcHRCdXR0b24gPSAkQlRODQp9CgpmdW5jdGlvbiBXcml0ZS1BUEwgew0KICAgIFtDbWRsZXRCaW5kaW5nKCldDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoVmFsdWVGcm9tUGlwZWxpbmU9JHRydWUsIE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsDQogICAgICAgIFtBbGlhcygnTlMnKV1bU3dpdGNoXSROb1NpZ24sDQogICAgICAgIFtBbGlhcygnTk5MJywnTkwnKV1bU3dpdGNoXSROb05ld0xpbmUsDQogICAgICAgIFtTd2l0Y2hdJFBhc3NUaHJ1DQogICAgKQ0KICAgIGJlZ2luIHskVFQgPSBAKCl9DQogICAgcHJvY2VzcyB7JFRleHQgfCAlIHskVFQgKz0gLCRffX0NCiAgICBlbmQgew0KICAgICAgICBmb3IgKCRpPTA7JGkgLWx0ICRUVC5jb3VudDskaSsrKSB7DQogICAgICAgICAgICBbc3RyaW5nXSRDaHVuayA9ICRUVFskaV0NCiAgICAgICAgICAgICRTaWduUmd4ID0gIltcK1wtXCFcKlwjXEBfXD5dIg0KICAgICAgICAgICAgJENodW5rID0gJENodW5rIC1yZXBsYWNlICJebj94P24/KCRTaWduUmd4KSIsJyQxJw0KICAgICAgICAgICAgaWYgKCRDaHVuayAtbm90bWF0Y2ggIl4kU2lnblJneC4qIikgeyRDaHVuayA9ICJfJENodW5rIn0gIyBVc2UgZGVmYXVsdCBhcyB3aGl0ZQ0KICAgICAgICAgICAgJFByZWZpeENvZGUgPSAkaSAtZXEgMCA/ICJ4JCgkTm9TaWduID8gJ24nIDogJycpIiA6ICRpIC1uZSAoJFRULkNvdW50IC0gMSkgPyAibngiIDogIm4kKCROb05ld0xpbmUgPyAneCcgOiAnJykiDQogICAgICAgICAgICBpZiAoJFRULkNvdW50IC1lcSAxKSB7JFByZWZpeENvZGUgPSAiJCgkTm9TaWduID8gJ24nIDogJycpJCgkTm9OZXdMaW5lID8gJ3gnIDogJycpIn0NCiAgICAgICAgICAgIFdyaXRlLUFQICIkUHJlZml4Q29kZSRDaHVuayIgLVBhc3NUaHJ1OiRQYXNzVGhydQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gQXNrLU9FLVFTVE4ge3BhcmFtKCRRKQoNCiAgICBMb2FkLUZvcm1zDQogICAgJEZvcm0uQ29udHJvbHMuRmluZCgiQW5zd2VyIiwkdHJ1ZSlbMF0udGV4dCA9ICIiDQogICAgJEZvcm0uQ29udHJvbHMuRmluZCgiUXVlc3Rpb24iLCR0cnVlKVswXS50ZXh0ID0gJFENCiAgICAkRm9ybS5TaG93RGlhbG9nKCkgfCBPdXQtTnVsbA0KICAgIHJldHVybiAkRm9ybS5Db250cm9scy5GaW5kKCJBbnN3ZXIiLCR0cnVlKVswXS50ZXh0DQp9CgpmdW5jdGlvbiBHZXQtUGF0aCB7cGFyYW0oJG1hdGNoLCBbc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiKQoNCiAgICAkUHRoID0gW0Vudmlyb25tZW50XTo6R2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhcikNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICAkUGF0aFNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiOiJ9IGVsc2UgeyI7In0pDQogICAgaWYgKCEkUHRoKSB7cmV0dXJuIEAoKX0NCiAgICBTZXQtUGF0aCAkUHRoIC1QYXRoVmFyICRQYXRoVmFyDQogICAgJGQgPSAoJFB0aCkuc3BsaXQoJFBhdGhTZXApDQogICAgaWYgKCRtYXRjaCkgeyRkIC1tYXRjaCAkbWF0Y2h9IGVsc2UgeyRkfQ0KfQoKZnVuY3Rpb24gQ2xlYXItTGluZSB7DQogICAgJE5tID0gW0NvbnNvbGVdOjpXaW5kb3dXaWR0aA0KICAgICR0ID0gW0NvbnNvbGVdOjpDdXJzb3JUb3A7W0NvbnNvbGVdOjpDdXJzb3JMZWZ0PTANCiAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmUgKCIgIiokTk0pDQogICAgW0NvbnNvbGVdOjpDdXJzb3JUb3A9JHQ7W0NvbnNvbGVdOjpDdXJzb3JMZWZ0PTANCn0KCmZ1bmN0aW9uIEFQLVJlcXVpcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bQWxpYXMoIkZ1bmN0aW9uYWxpdHkiLCJMaWJyYXJ5IildW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbCwgW1N3aXRjaF0kUGFzc1RocnUpCg0KICAgICRMb2FkTW9kdWxlID0gew0KICAgICAgICBwYXJhbSgkRmlsZSxbYm9vbF0kSW1wb3J0KQ0KICAgICAgICB0cnkge0ltcG9ydC1Nb2R1bGUgJEZpbGUgLWVhIHN0b3A7cmV0dXJuIDF9IGNhdGNoIHt9DQogICAgICAgICRMaWI9QVAtQ29udmVydFBhdGggIjxMSUI+IjskTEYgPSAiJExpYlwkRmlsZSINCiAgICAgICAgW3N0cmluZ10kZiA9IGlmKHRlc3QtcGF0aCAtdCBsZWFmICRMRil7JExGfWVsc2VpZih0ZXN0LXBhdGggLXQgbGVhZiAiJExGLmRsbCIpeyIkTEYuZGxsIn0NCiAgICAgICAgaWYgKCRmIC1hbmQgJEltcG9ydCkge0ltcG9ydC1Nb2R1bGUgJGZ9DQogICAgICAgIHJldHVybiAkZg0KICAgIH0NCiAgICAkU3RhdCA9ICQoc3dpdGNoIC1yZWdleCAoJExpYi50cmltKCkpIHsNCiAgICAgICAgIl5JbnRlcm5ldCQiICAgICAgICAgICAgICAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5vczood2lufGxpbnV4fHVuaXgpJCIgICAgeyRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4IjtpZiAoJE1hdGNoZXNbMV0gLWVxICJ3aW4iKSB7ISRJc1VuaXh9IGVsc2UgeyRJc1VuaXh9fQ0KICAgICAgICAiXmFkbWluJCIgICAgICAgICAgICAgICAgICB7VGVzdC1BZG1pbmlzdHJhdG9yfQ0KICAgICAgICAiXmRlcDooLiopJCIgICAgICAgICAgICAgICB7R2V0LVdoZXJlICRNYXRjaGVzWzFdfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKTooLiopJCIgICAgICB7JExvYWRNb2R1bGUuaW52b2tlKCRNYXRjaGVzWzJdLCAkdHJ1ZSl9DQogICAgICAgICJeKGxpYnxtb2R1bGUpX3Rlc3Q6KC4qKSQiIHskTG9hZE1vZHVsZS5pbnZva2UoJE1hdGNoZXNbMl0pfQ0KICAgICAgICAiXmZ1bmN0aW9uOiguKikkIiAgICAgICAgICB7Z2NtICRNYXRjaGVzWzFdIC1lYSBTaWxlbnRseUNvbnRpbnVlfQ0KICAgICAgICAiXnN0cmljdF9mdW5jdGlvbjooLiopJCIgICB7VGVzdC1QYXRoICJGdW5jdGlvbjpcJCgkTWF0Y2hlc1sxXSkifQ0KICAgICAgICBkZWZhdWx0IHtXcml0ZS1BUCAiIUludmFsaWQgc2VsZWN0b3IgcHJvdmlkZWQgWyQoIiRMaWIiLnNwbGl0KCc6JylbMF0pXSI7dGhyb3cgJ0JBRF9TRUxFQ1RPUid9DQogICAgfSkNCiAgICBpZiAoISRTdGF0IC1hbmQgJE9uRmFpbCkgeyRPbkZhaWwuSW52b2tlKCl9DQogICAgaWYgKCRQYXNzVGhydSAtb3IgISRPbkZhaWwpIHtyZXR1cm4gJFN0YXR9DQp9CgpmdW5jdGlvbiBHZXQtRXNjYXBlIHtbQ2hhcl0weDFifQoKZnVuY3Rpb24gVG8tQ2xpcGJvYXJkIHtwYXJhbShbUGFyYW1ldGVyKFZhbHVlRnJvbVBpcGVsaW5lPSR0cnVlKV0kVGV4dCkKDQogICAgW1N0cmluZ10kVGV4dCA9ICRUZXh0IC1qb2luICJgbiINCiAgICBpZiAoISRUZXh0LnRyaW0oKSkgeyRUZXh0ID0gIiAifQ0KICAgIFNldC1DbGlwYm9hcmQgJFRleHQNCiAgICAjIEFkZC1UeXBlIC1hcyBTeXN0ZW0uV2luZG93cy5Gb3Jtcw0KICAgICMgW1N5c3RlbS5XaW5kb3dzLkZvcm1zLkNsaXBib2FyZF06OlNldFRleHQoJFRleHQpDQp9CgpmdW5jdGlvbiBTdHJpcC1Db2xvckNvZGVzIHtwYXJhbSgkU3RyKQoNCiAgICAkU3RyIHwgJSB7JF8gLXJlcGxhY2UgIiQoW3JlZ2V4XTo6ZXNjYXBlKCIkKEdldC1Fc2NhcGUpWyIpKVxkKyhcO1xkKykqbSIsIiJ9DQp9CgpmdW5jdGlvbiBBUC1Db252ZXJ0UGF0aCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmddJFBhdGgpCg0KICAgICRQYXRoU2VwID0gW0lPLlBhdGhdOjpEaXJlY3RvcnlTZXBhcmF0b3JDaGFyDQogICAgcmV0dXJuICRQYXRoIC1yZXBsYWNlIA0KICAgICAgICAiPERlcD4iLCI8TGliPiR7UGF0aFNlcH1EZXBlbmRlbmNpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPExpYj4iLCI8SG9tZT4ke1BhdGhTZXB9QVAtTGlicmFyaWVzIiAtcmVwbGFjZSANCiAgICAgICAgIjxDb21wKG9uZW50cyk/PiIsIjxIb21lPiR7UGF0aFNlcH1BUC1Db21wb25lbnRzIiAtcmVwbGFjZSANCiAgICAgICAgIjxIb21lPiIsJFBTSGVsbH0KCmZ1bmN0aW9uIFNldC1QYXRoIHsNCiAgICBbY21kbGV0YmluZGluZygpXQ0KICAgIHBhcmFtKA0KICAgICAgICBbUGFyYW1ldGVyKE1hbmRhdG9yeSA9ICR0cnVlLCBWYWx1ZUZyb21QaXBlbGluZSA9ICR0cnVlKV1bc3RyaW5nW11dJFBhdGgsDQogICAgICAgIFtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCINCiAgICApDQogICAgYmVnaW4gew0KICAgICAgICBbc3RyaW5nW11dJEZpbmFsUGF0aA0KICAgIH0NCiAgICBwcm9jZXNzIHsNCiAgICAgICAgJFBhdGggfCAlIHsNCiAgICAgICAgICAgICRGaW5hbFBhdGggKz0gJF8NCiAgICAgICAgfQ0KICAgIH0NCiAgICBlbmQgew0KICAgICAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICAgICAgJFBhdGhTZXAgPSAkKGlmICgkSXNVbml4KSB7IjoifSBlbHNlIHsiOyJ9KQ0KICAgICAgICAkUHRoID0gJEZpbmFsUGF0aCAtam9pbiAkUGF0aFNlcA0KICAgICAgICAkUHRoID0gKCRQdGggLXJlcGxhY2UoIiRQYXRoU2VwKyIsICRQYXRoU2VwKSAtcmVwbGFjZSgiXFwkUGF0aFNlcHxcXCQiLCAkUGF0aFNlcCkpLnRyaW0oJFBhdGhTZXApDQogICAgICAgICRQdGggPSAoKCRQdGgpLnNwbGl0KCRQYXRoU2VwKSB8IHNlbGVjdCAtdW5pcXVlKSAtam9pbiAkUGF0aFNlcA0KICAgICAgICBbRW52aXJvbm1lbnRdOjpTZXRFbnZpcm9ubWVudFZhcmlhYmxlKCRQYXRoVmFyLCAkUHRoKQ0KICAgIH0NCn0KCmZ1bmN0aW9uIEludm9rZS1UZXJuYXJ5IHtwYXJhbShbYm9vbF0kZGVjaWRlciwgW3NjcmlwdGJsb2NrXSRpZnRydWUsIFtzY3JpcHRibG9ja10kaWZmYWxzZSkKDQogICAgaWYgKCRkZWNpZGVyKSB7ICYkaWZ0cnVlfSBlbHNlIHsgJiRpZmZhbHNlIH0NCn0KCmZ1bmN0aW9uIEFsaWduLVRleHQge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nW11dJFRleHQsIFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0NlbnRlcicpCg0KICAgIGlmICgkVGV4dC5jb3VudCAtZ3QgMSkgew0KICAgICAgICAkYW5zID0gQCgpDQogICAgICAgIGZvcmVhY2ggKCRsbiBpbiAkVGV4dCkgeyRBbnMgKz0gQWxpZ24tVGV4dCAkbG4gJEFsaWdufQ0KICAgICAgICByZXR1cm4gKCRhbnMpDQogICAgfSBlbHNlIHsNCiAgICAgICAgJFdpblNpemUgPSBbY29uc29sZV06OkJ1ZmZlcldpZHRoDQogICAgICAgICRDbGVhblRleHRTaXplID0gKFN0cmlwLUNvbG9yQ29kZXMgKCIiKyRUZXh0KSkuTGVuZ3RoDQogICAgICAgIGlmICgkQ2xlYW5UZXh0U2l6ZSAtZ2UgJFdpblNpemUpIHsNCiAgICAgICAgICAgICRBcHBlbmRlciA9IEAoIiIpOw0KICAgICAgICAgICAgJGogPSAwDQogICAgICAgICAgICBmb3JlYWNoICgkcCBpbiAwLi4oJENsZWFuVGV4dFNpemUtMSkpew0KICAgICAgICAgICAgICAgIGlmICgoJHArMSklJHdpbnNpemUgLWVxIDApIHskaisrOyRBcHBlbmRlciArPSAiIn0NCiAgICAgICAgICAgICAgICAjICIiKyRqKyIgLSAiKyRwDQogICAgICAgICAgICAgICAgJEFwcGVuZGVyWyRqXSArPSAkVGV4dC5jaGFycygkcCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIHJldHVybiAoQWxpZ24tVGV4dCAkQXBwZW5kZXIgJEFsaWduKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgaWYgKCRBbGlnbiAtZXEgIkNlbnRlciIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIipbbWF0aF06OnRydW5jYXRlKCgkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZSkvMikrJFRleHQpDQogICAgICAgICAgICB9IGVsc2VpZiAoJEFsaWduIC1lcSAiUmlnaHQiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqKCRXaW5TaXplLSRDbGVhblRleHRTaXplLTEpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCRUZXh0KQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gR2V0LVdoZXJlIHsNCiAgICBbQ21kbGV0QmluZGluZyhEZWZhdWx0UGFyYW1ldGVyU2V0TmFtZT0iTm9ybWFsIildDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSR0cnVlLCBQb3NpdGlvbj0wKV1bc3RyaW5nXSRGaWxlLA0KICAgICAgICBbU3dpdGNoXSRBbGwsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nTm9ybWFsJyldW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kTWFudWFsU2NhbiwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kRGJnLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiDQogICAgKQ0KICAgICRJc1ZlcmJvc2UgPSAkRGJnIC1vciAkUFNCb3VuZFBhcmFtZXRlcnMuQ29udGFpbnNLZXkoJ1ZlcmJvc2UnKSAtb3IgJFBTQm91bmRQYXJhbWV0ZXJzLkNvbnRhaW5zS2V5KCdEZWJ1ZycpDQogICAgJFdoZXJlQmluRXhpc3RzID0gR2V0LUNvbW1hbmQgIndoZXJlIiAtZWEgU2lsZW50bHlDb250aW51ZQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgIGlmICgkRmlsZSAtZXEgIndoZXJlIiAtb3IgJEZpbGUgLWVxICJ3aGVyZS5leGUiKSB7cmV0dXJuICRXaGVyZUJpbkV4aXN0c30NCiAgICBpZiAoJFdoZXJlQmluRXhpc3RzIC1hbmQgISRNYW51YWxTY2FuKSB7DQogICAgICAgICRPdXQ9JG51bGwNCiAgICAgICAgaWYgKCRJc1VuaXgpIHsNCiAgICAgICAgICAgICRPdXQgPSB3aGljaCAkZmlsZSAyPiRudWxsDQogICAgICAgIH0gZWxzZSB7JE91dCA9IHdoZXJlLmV4ZSAkZmlsZSAyPiRudWxsfQ0KICAgICAgICANCiAgICAgICAgaWYgKCEkT3V0KSB7cmV0dXJufQ0KICAgICAgICBpZiAoJEFsbCkge3JldHVybiAkT3V0fQ0KICAgICAgICByZXR1cm4gQCgkT3V0KVswXQ0KICAgIH0NCiAgICBmb3JlYWNoICgkRm9sZGVyIGluIChHZXQtUGF0aCAtUGF0aFZhciAkUGF0aFZhcikpIHsNCiAgICAgICAgaWYgKCRJc1VuaXgpIHsNCiAgICAgICAgICAgICRMb29rdXAgPSAiJEZvbGRlci8kRmlsZSINCiAgICAgICAgICAgIGlmICgkSXNWZXJib3NlKSB7V3JpdGUtQVAgIipDaGVja2luZyBbJExvb2t1cF0ifQ0KICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9DQogICAgICAgICAgICBSZXNvbHZlLVBhdGggJExvb2t1cCB8ICUgUGF0aA0KICAgICAgICAgICAgaWYgKCEkQWxsKSB7cmV0dXJufQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgZm9yZWFjaCAoJEV4dGVuc2lvbiBpbiAoR2V0LVBhdGggLVBhdGhWYXIgUEFUSEVYVCkpIHsNCiAgICAgICAgICAgICAgICAkTG9va3VwID0gIiRGb2xkZXIvJEZpbGUkRXh0ZW5zaW9uIg0KICAgICAgICAgICAgICAgIGlmICgkSXNWZXJib3NlKSB7V3JpdGUtQVAgIipDaGVja2luZyBbJExvb2t1cF0ifQ0KICAgICAgICAgICAgICAgIGlmICghKFRlc3QtUGF0aCAtUGF0aFR5cGUgTGVhZiAkTG9va3VwKSkge2NvbnRpbnVlfQ0KICAgICAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoDQogICAgICAgICAgICAgICAgaWYgKCEkQWxsKSB7cmV0dXJufQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gS2V5UHJlc3NlZCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kS2V5LCAkU3RvcmUgPSAiXl5eIikKDQogICAgaWYgKCRTdG9yZSAtZXEgIl5eXiIgLWFuZCAkSG9zdC5VSS5SYXdVSS5LZXlBdmFpbGFibGUpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIil9IGVsc2Uge2lmICgkU3RvcmUgLWVxICJeXl4iKSB7cmV0dXJuICRGYWxzZX19DQogICAgJEFucyA9ICRGYWxzZQ0KICAgICRLZXkgfCAlIHsNCiAgICAgICAgJFNPVVJDRSA9ICRfDQogICAgICAgIHRyeSB7DQogICAgICAgICAgICAkQW5zID0gJEFucyAtb3IgKEtleVByZXNzZWRDb2RlICRTT1VSQ0UgJFN0b3JlKQ0KICAgICAgICB9IGNhdGNoIHsNCiAgICAgICAgICAgIEZvcmVhY2ggKCRLIGluICRTT1VSQ0UpIHsNCiAgICAgICAgICAgICAgICBbU3RyaW5nXSRLID0gJEsNCiAgICAgICAgICAgICAgICBpZiAoJEsubGVuZ3RoIC1ndCA0IC1hbmQgKCRLWzAsMSwtMSwtMl0gLWpvaW4oIiIpKSAtZXEgIn5+fn4iKSB7DQogICAgICAgICAgICAgICAgICAgICRBbnMgPSAkQU5TIC1vciAoS2V5UHJlc3NlZENvZGUgKEtleVRyYW5zbGF0ZSgkSykpICRTdG9yZSkNCiAgICAgICAgICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgICAgICAgICAkQW5zID0gJEFOUyAtb3IgKCRLLmNoYXJzKDApIC1pbiAkU3RvcmUuQ2hhcmFjdGVyKQ0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCiAgICByZXR1cm4gJEFucw0KfQoKZnVuY3Rpb24gcGF1c2Uge3BhcmFtKFtTdHJpbmddJFBhdXNlUSA9ICJQcmVzcyBhbnkga2V5IHRvIGNvbnRpbnVlIC4gLiAuICIpCg0KICAgIFdyaXRlLUhvc3QgLW5vTmV3bGluZSAkUGF1c2VRDQogICAgJG51bGwgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJOb0VjaG8sIEluY2x1ZGVLZXlEb3duIikNCiAgICBXcml0ZS1Ib3N0ICIiDQp9CgpmdW5jdGlvbiBJbnB1dC1Qcm9tcHQge3BhcmFtKFtTdHJpbmddJFByb21wdCA9ICJFbnRlciBUZXh0IDogIikKDQogICAgV3JpdGUtaG9zdCAtbm9uZXdsaW5lICRQcm9tcHQNCiAgICAkUmVSZWdYID0gJ1teXHgwMS1ceDA4XHgxMC1ceDgwXSsnIydbXlx3XC5dJyBb0JAt0Y/QgdGRXQ0KICAgICRUclN0cmluZyA9ICIiDQogICAgJGlQb3N4ID0gW0NvbnNvbGVdOjpDdXJzb3JMZWZ0DQogICAgJGlQb3N5ID0gW0NvbnNvbGVdOjpDdXJzb3JUb3ANCiAgICB0cnkgew0KICAgICAgICAkQ3ZpcyA9IFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZQ0KICAgICAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkRmFsc2UNCiAgICB9IGNhdGNoIHskQ3ZpcyA9ICRUcnVlfQ0KICAgICRDb3VudCA9IDE7JFNsZWVwID0gMA0KICAgIFdoaWxlICgkVHJ1ZSkgew0KICAgICAgICBpZiAoJGNvdW50IC1ndCA1MDApIHskU2xlZXAgPSAxMDB9DQogICAgICAgIGlmICgkSG9zdC5VSS5SYXdVSS5LZXlBdmFpbGFibGUpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5RG93bixOb0VjaG8iKTskQ291bnQ9MDskU2xlZXA9MH0gZWxzZSB7JENvdW50Kys7U3RhcnQtU2xlZXAgLW0gJFNsZWVwO2NvbnRpbnVlfQ0KICAgICAgICBpZiAoS2V5UHJlc3NlZCAifn5CYWNrU3BhY2V+fiIgJFN0b3JlKSB7aWYgKCRzdG9yZS5Db250cm9sS2V5U3RhdGUgLW1hdGNoICJjdHJsIikgeyRUclN0cmluZz0iIn0gZWxzZSB7JFRyU3RyaW5nID0gPzogKCRUclN0cmluZy5MZW5ndGggLWVxIDApeyIifXskVHJTdHJpbmcuc3Vic3RyaW5nKDAsJFRyU3RyaW5nLkxlbmd0aC0xKX19fQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+U3BhY2V+fiIgJFN0b3JlKSB7JFRyU3RyaW5nICs9ICIgIn0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+fkVzY2FwZX5+IiAkU3RvcmUpIHskVHJTdHJpbmc9IiI7YnJlYWt9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5FTlRFUn5+IiAkU3RvcmUpIHtXcml0ZS1Ib3N0ICIiO2JyZWFrfSBlbHNlIA0KICAgICAgICB7JFRyU3RyaW5nICs9ICRTdG9yZS5DaGFyYWN0ZXIgLXJlcGxhY2UgKCRSZVJlZ1gsJycpfQ0KICAgICAgICAkd3QgPSBbQ29uc29sZV06OkJ1ZmZlcldpZHRoIC0gJGlQb3N4IC0gMQ0KICAgICAgICBbQ29uc29sZV06OkN1cnNvcmxlZnQgPSAkaVBvc3gNCiAgICAgICAgW0NvbnNvbGVdOjpDdXJzb3JUb3AgPSAkaVBvc3kNCiAgICAgICAgaWYgKCR3dC0kVHJTdHJpbmcuTGVuZ3RoIC1sdCAwKSB7DQogICAgICAgICAgICAkdGI9IiINCiAgICAgICAgICAgICR0dD0iLi4uIiskVHJTdHJpbmcuc3Vic3RyaW5nKCRUclN0cmluZy5MZW5ndGgtJHd0KzMpDQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAkdGI9IiAiKigkd3QtJFRyU3RyaW5nLkxlbmd0aCkNCiAgICAgICAgICAgICR0dD0kVHJTdHJpbmcNCiAgICAgICAgfQ0KICAgICAgICBXcml0ZS1ob3N0IC1ub25ld2xpbmUgJHR0JFRiDQogICAgfQ0KICAgIHRyeSB7W0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlID0gJEN2aXN9IGNhdGNoIHt9DQogICAgcmV0dXJuICRUUlN0cmluZw0KfQoKZnVuY3Rpb24gV3JpdGUtQVAgew0KICAgIFtDbWRsZXRCaW5kaW5nKCldDQogICAgcGFyYW0oW1BhcmFtZXRlcihWYWx1ZUZyb21QaXBlbGluZT0kdHJ1ZSwgTWFuZGF0b3J5PSRUcnVlKV0kVGV4dCxbU3dpdGNoXSROb1NpZ24sW1N3aXRjaF0kUGxhaW5UZXh0LFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0xlZnQnLFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KICAgIGJlZ2luIHskVFQgPSBAKCl9DQogICAgUHJvY2VzcyB7JFRUICs9ICwkVGV4dH0NCiAgICBFTkQgew0KICAgICAgICAkQmx1ZSA9ICQoaWYgKCRXUklURV9BUF9MRUdBQ1lfQ09MT1JTKXszfWVsc2V7J0JsdWUnfSkNCiAgICAgICAgaWYgKCRUVC5jb3VudCAtZXEgMSkgeyRUVCA9ICRUVFswXX07JFRleHQgPSAkVFQNCiAgICAgICAgaWYgKCR0ZXh0LmNvdW50IC1ndCAxIC1vciAkdGV4dC5HZXRUeXBlKCkuTmFtZSAtbWF0Y2ggIlxbXF0kIikgew0KICAgICAgICAgICAgcmV0dXJuICRUZXh0IHwgPyB7IiRfIn0gfCAlIHsNCiAgICAgICAgICAgICAgICBXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ24gLVBhc3NUaHJ1OiRQYXNzVGhydQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+W1wrXC1cIVwqXCNcQF9dKSg/PHc+LiopIikge3JldHVybiAkVGV4dH0NCiAgICAgICAgJHRiICA9ICIgICAgIiokTWF0Y2hlcy50Lmxlbmd0aA0KICAgICAgICAkQ29sID0gQHsnKyc9JzInOyctJz0nMTInOychJz0nMTQnOycqJz0kQmx1ZTsnIyc9J0RhcmtHcmF5JzsnQCc9J0dyYXknOydfJz0nd2hpdGUnfVsoJFNpZ24gPSAkTWF0Y2hlcy5TKV0NCiAgICAgICAgaWYgKCEkQ29sKSB7VGhyb3cgIkluY29ycmVjdCBTaWduIFskU2lnbl0gUGFzc2VkISJ9DQogICAgICAgICRTaWduID0gJChpZiAoJE5vU2lnbiAtb3IgJE1hdGNoZXMuTlMpIHsiIn0gZWxzZSB7IlskU2lnbl0gIn0pDQogICAgICAgICREYXRhID0gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSI7aWYgKCEkRGF0YSkge3JldHVybn0NCiAgICAgICAgaWYgKEFQLVJlcXVpcmUgImZ1bmN0aW9uOkFsaWduLVRleHQiIC1wYSkgew0KICAgICAgICAgICAgJERhdGEgPSBBbGlnbi1UZXh0IC1BbGlnbiAkQWxpZ24gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSINCiAgICAgICAgfQ0KICAgICAgICBpZiAoJFBsYWluVGV4dCkge3JldHVybiAkRGF0YX0NCiAgICAgICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiQoW2Jvb2xdJE1hdGNoZXMuTk5MKSAtZiAkQ29sICREYXRhDQogICAgICAgIGlmICgkUGFzc1RocnUpIHtyZXR1cm4gJERhdGF9DQogICAgfQ0KfQoKZnVuY3Rpb24gVGFiLVRleHQge3BhcmFtKFtTdHJpbmddJFRleHQsIFtpbnRdJE51bVRhYnM9MSwgW2ludF0kVGFiU2l6ZSA9IDQsIFtjaGFyXSRUYWJDaGFyID0gIiAiKQoNCiAgICAkVGFiID0gKCIkVGFiQ2hhciIqJFRhYlNpemUpKiROdW1UYWJzOyRpbmRleD0wDQogICAgJFdpbiA9IFtDb25zb2xlXTo6QnVmZmVyV2lkdGgtMTskU3RyID0gIiINCiAgICBmb3JlYWNoICgkYyBpbiAkVGV4dC5Ub0NoYXJBcnJheSgpKSB7DQogICAgICAgIGlmICghKCRJbmRleCUkV2luKSkgeyRTdHIgKz0gJFRhYjskSW5kZXgrPSRUYWIuTGVuZ3RofQ0KICAgICAgICAkU3RyICs9ICRjDQogICAgICAgICRpbmRleCsrDQogICAgfQ0KICAgIHJldHVybiAkU3RyDQp9CgpTZXQtQWxpYXMgPzogSW52b2tlLVRlcm5hcnk=")
# ========================================END=OF=COMPILER===========================================================|
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
AP-Require "Internet" {Write-AP "!Need Internet To Function!";exit 1}
AP-Require "dep:git" {Write-AP "!Need Git Integrated To Function!";exit 1}
if (AP-Require "function:Load-GitIdentity") {
    Load-GitIdentity personal # Super personal to me, but needed :/
}
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$script:STACK_BKP = Backup-LocationStack
Push-Location $PSHell
$UserName = "avdaredevil@gmail.com"
$GitTemp = "$PSHell/$($isWindows ? '' : '.')Git-Temp"
$HashFile = "$GitTemp/Current-Versions.map"
$MapFile  = "$GitTemp/Git-Sources.map"
$PKGs = @{}

if (!(Test-Path "$GitTemp")) {
    md "$GitTemp" >$null
    if ($IsWindows) {attrib +h "$GitTemp"}
}
if ($Rebuild -and (Test-Path $HashFile)) {Write-AP "!Rebuilding Git/AP Cache";del $HashFile}
"Git-Sources","Current-Versions" | ? {!(Test-Path -type Leaf "$GitTemp/$_.map")} | % {
    Write-AP "*Creating New [$_] File:"
    if ($_ -eq "Current-Versions") {
        "@ --------------------------------------------------------------------------|",
        "@    Version Tracking File for GitHub Projects in AP MGMT Console",
        "@ --------------------------------------------------------------------------|",
        "@  EXAMPLE:",
        "@  -------",
        "@   <FileName>|<HashOfSRCFile>",
        "@ --------------------------------------------------------------------------|" | Out-File -Encoding Default "$GitTemp/$_.map"
    } else {
        "@ --------------------------------------------------------------------------|",
        "@    Mapping File for GitHub Projects in AP MGMT Console",
        "@ --------------------------------------------------------------------------|",
        "@  EXAMPLE:",
        "@  -------",
        "@   [GitUser]/[GitRepo]|[Tool-Name]|[Src1;Src2;...]",
        "@ --------------------------------------------------------------------------|" | Out-File -Encoding Default "$GitTemp/$_.map"
    }
}
function QUIT ([int]$Code = 0) {
    if ($Script:psw) {Remove-Variable psw -scope Script}
    if (AP-Require "function:Load-GitIdentity") {Load-GitIdentity} # Reset the git identity, again super personal to me, but needed :/
    Restore-LocationStack $script:STACK_BKP
    exit $Code
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
            if (!(Test-Path $FullPath)) {Write-AP "!Missing Source File: $_ for $($Obj.Name)";Quit 2}
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
    if (!$f) {Write-APL ">-Could Not find a file to match this to a project. Check if compiler failed, or you didn't list sources in MapFile?";$END.Invoke();return}
    $Data = try {$Maps[$SrcMap[$f]]} catch {};if (!$Data) {Write-APL ">-Could Not get Data for this project using file [","!$f","-], please add to MapFile.";$END.Invoke();return}
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
        $RemoteBranch = git remote show origin | ? {$_ -match "HEAD branch"} | % {$_ -replace ".*: ",""}
        $out = "|==========Pull===================`n"
        $out += git pull origin $RemoteBranch 2>&1
        $out += "|==========ADD===================`n"
        $out += git add . 2>&1
        $out += "|==========Commit================`n"
        $Out += git commit -a -m $MSG 2>&1
        $out += "|==========Push==================`n"
        $Out += git push --set-upstream origin $RemoteBranch 2>&1
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
    return Join-Path $GitTemp $Entry.Dest $File
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
    $NewFold = "$GitTemp/$($Entry.Dest)"
    $NewPath = Get-Destination $Entry $File
    if (!(Test-Path -Type Container "$NewFold")) {
        Write-AP "*Creating Folder Structure for [$($Entry.Name)]"
        mkdir "$GitTemp/$($Entry.Dest)" | Out-Null
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
    GIT-SELF-AWARE "$GitTemp/$($PKGs.$_)"
}
Write-Hashes
QUIT
