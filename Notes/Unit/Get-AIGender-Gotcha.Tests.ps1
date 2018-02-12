Remove-Module -Name $env:BHProjectName -Force -ErrorAction "SilentlyContinue"
Import-Module -Name "$env:BHModulePath\$env:BHProjectName.psm1"

Describe "$env:BHProjectName - Get-AIGender" {

	Context "Verifying the function succeeds - male" {

		Mock Get-Random { 0 }

		It "generates male" {
			Get-AIGender | Should Be "Male"
		}

	}

}