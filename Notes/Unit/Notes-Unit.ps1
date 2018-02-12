##################
## GET-AIGENDER ##
##################
# Had to add in "InModuleScope" to get `Get-Random` to work
Invoke-Pester -Path ".\Notes\Unit\Get-AIGender-Gotcha.Tests.ps1" -CodeCoverage ".\PesterDemo\Public\Get-AIGender.ps1"

# This test just hits the male switch
Invoke-Pester -Path ".\Notes\Unit\Get-AIGender-P1.Tests.ps1" -CodeCoverage ".\PesterDemo\Public\Get-AIGender.ps1"

# This test gets 100% CC adding in the female switch
Invoke-Pester -Path ".\Notes\Unit\Get-AIGender-P2.Tests.ps1" -CodeCoverage ".\PesterDemo\Public\Get-AIGender.ps1"



################
## GET-AINAME ##
################
# Only 1 tests for 100%
Invoke-Pester -Path ".\Tests\Unit\Get-AIName.Tests.ps1" -CodeCoverage ".\PesterDemo\Public\Get-AIName.ps1"



###################
## GET-AISERVICE ##
###################
# 1 Pass
Invoke-Pester -Path ".\Notes\Unit\Get-AIService-P1.Tests.ps1" -CodeCoverage ".\PesterDemo\Public\Get-AIService.ps1"

# 1 Pass + 1 Fail
Invoke-Pester -Path ".\Notes\Unit\Get-AIService-P2.Tests.ps1" -CodeCoverage ".\PesterDemo\Public\Get-AIService.ps1"



############
## NEW-AI ##
############
# 1 Pass
Invoke-Pester -Path ".\Notes\Unit\New-AI-P1.Tests.ps1" -CodeCoverage ".\PesterDemo\Public\New-AI.ps1"

# 1 Pass 1 Fail
Invoke-Pester -Path ".\Notes\Unit\New-AI-P2.Tests.ps1" -CodeCoverage ".\PesterDemo\Public\New-AI.ps1"

# 1 Pass 2 Fails
Invoke-Pester -Path ".\Notes\Unit\New-AI-P3.Tests.ps1" -CodeCoverage ".\PesterDemo\Public\New-AI.ps1"

# 1 Pass 3 Fails
Invoke-Pester -Path ".\Notes\Unit\New-AI-P4.Tests.ps1" -CodeCoverage ".\PesterDemo\Public\New-AI.ps1"

# 1 Pass 4 Fails
Invoke-Pester -Path ".\Notes\Unit\New-AI-P5.Tests.ps1" -CodeCoverage ".\PesterDemo\Public\New-AI.ps1"




####################
## ALL UNIT TESTS ##
####################
Invoke-Pester -Path ".\Tests\Unit\" -CodeCoverage (Get-ChildItem -Path ".\PesterDemo\Public" -File -Recurse -Include "*.ps1")
