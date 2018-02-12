Remove-Module -Name $env:BHProjectName -Force -ErrorAction "SilentlyContinue"
Import-Module -Name "$env:BHModulePath\$env:BHProjectName.psm1"

InModuleScope -ModuleName $env:BHProjectName {

	Describe "$env:BHProjectName - Get-AIGender" {

		Context "Verifying the function succeeds - male" {

			Mock Get-Random { 0 }

			It "generates male" {
				Get-AIGender | Should Be "Male"
			}

		}
		
		Context "Verifying the function succeeds - female" {

			Mock Get-Random { 1 }

			It "generates female" {
				Get-AIGender | Should Be "Female"
			}

		}

	}

}