Remove-Module -Name $env:BHProjectName -Force -ErrorAction "SilentlyContinue"
Import-Module -Name "$env:BHModulePath\$env:BHProjectName.psm1"

InModuleScope -ModuleName $env:BHProjectName {

	Describe "$env:BHProjectName - Get-AIGender" {

		Context "Verifying the function succeeds" {

			It "generates male or female" {
				Get-AIGender | Should Match "Male|Female"
			}

		}

	}

}