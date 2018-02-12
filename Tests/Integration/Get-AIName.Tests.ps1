Remove-Module -Name $env:BHProjectName -Force -ErrorAction "SilentlyContinue"
Import-Module -Name "$env:BHModulePath\$env:BHProjectName.psm1"

InModuleScope -ModuleName $env:BHProjectName {

	Describe "$env:BHProjectName - Get-AIName" {

		Context "Verifying the function succeeds - male" {

			It "The function succeeds" {
				Get-AIName -Gender "Male" | Should Match "^[A-Z][a-z]+\s[A-Z][a-z]+$"
			}

		}
		
		Context "Verifying the function succeeds - female" {

			It "The function succeeds" {
				Get-AIName -Gender "Female" | Should Match "^[A-Z][a-z]+\s[A-Z][a-z]+$"
			}

		}

	}

}