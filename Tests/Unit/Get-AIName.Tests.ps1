Remove-Module -Name $env:BHProjectName -Force -ErrorAction "SilentlyContinue"
Import-Module -Name "$env:BHModulePath\$env:BHProjectName.psm1"

InModuleScope -ModuleName $env:BHProjectName {

	Describe "$env:BHProjectName - Get-AIName" {

		Context "Verifying the function succeeds" {

			Mock Invoke-RestMethod {
				[PSCustomObject]@{
					'Gender'	= 'Male'
					'Name'		= 'Ted'
					'Surname'	= 'Hope'
				}
			}

			It "The function succeeds" {
				Get-AIName -Gender "Male" | Should Be "Ted Hope"
			}

		}

	}

}