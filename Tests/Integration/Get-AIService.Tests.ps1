Remove-Module -Name $env:BHProjectName -Force -ErrorAction "SilentlyContinue"
Import-Module -Name "$env:BHModulePath\$env:BHProjectName.psm1"

InModuleScope -ModuleName $env:BHProjectName {

	Describe "$env:BHProjectName - Get-AIService" {

		Context "Verifying the function succeeds" {

			It "The function succeeds" {
				Get-AIService | Should Not BeNullOrEmpty
			}

		}

	}

}