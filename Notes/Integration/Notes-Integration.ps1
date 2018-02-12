##################
## GET-AIGENDER ##
##################
# Makes sure it outputs male or female
Invoke-Pester -Path ".\Tests\Integration\Get-AIGender.Tests.ps1"



################
## GET-AINAME ##
################
# Makes sure it works for both male and female
Invoke-Pester -Path ".\Tests\Integration\Get-AIName.Tests.ps1"



###################
## GET-AISERVICE ##
###################
# Makes sure it grabs a Windows service
Invoke-Pester -Path ".\Tests\Integration\Get-AIService.Tests.ps1"



############
## NEW-AI ##
############
# Creates the AI
Invoke-Pester -Path ".\Tests\Integration\New-AI.Tests.ps1"


###############
## ALL TESTS ##
###############
####################
## ALL UNIT TESTS ##
####################
Invoke-Pester -Path ".\Tests\" -CodeCoverage (Get-ChildItem -Path ".\PesterDemo\Public" -File -Recurse -Include "*.ps1")
