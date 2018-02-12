Remove-Module -Name $env:BHProjectName -Force -ErrorAction "SilentlyContinue"
Import-Module -Name "$env:BHModulePath\$env:BHProjectName.psm1"

InModuleScope -ModuleName $env:BHProjectName {

	Describe "$env:BHProjectName - Get-AIService" {

		Context "Verifying the function succeeds" {

			Mock Get-Random { 0 }
			Mock Get-WmiObject {
				[PSCustomObject]@{
					'DisplayName' = 'Test DisplayName'
				}
			}

			It "The function succeeds" {
				Get-AIService | Should Be "Test DisplayName"
			}

		}

	}

}