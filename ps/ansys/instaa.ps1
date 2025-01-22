new-psdrive -name a -root \\ss.jpan.in\ps6 -psprovider filesystem -persist -credential guest
a:
cd a:\ansys\24r2win
set-executionpolicy bypass -scope process -force
.\install.ps1
