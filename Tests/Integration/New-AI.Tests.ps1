Remove-Module -Name $env:BHProjectName -Force -ErrorAction "SilentlyContinue"
Import-Module -Name "$env:BHModulePath\$env:BHProjectName.psm1"

InModuleScope -ModuleName $env:BHProjectName {

	Describe "$env:BHProjectName - New-AI" {

		$Temp = (Get-ChildItem -Path "env:Temp").Value

		Context "Verifying the function succeeds" {

			$Results = New-AI -Verbose

			It "Contains a name" {
				$Results.Name | Should Match "^[A-Z][a-z]+\s[A-Z][a-z]+$"
			}

			It "Contains a gender" {
				$Results.Gender | Should Match "Male|Female"
			}

			It "Contains a service" {
				$Results.Service | Should Not BeNullOrEmpty
			}
			
			It "Outputs a file" {
				Test-Path -Path "$Temp\PesterDemo.txt" | Should Be True
			}

			It "File contains the correct output" {
				$File = Get-Content -Path "$Temp\PesterDemo.txt"
				$File[0] | Should Match "Hello, my name is [A-Z][a-z]+\s[A-Z][a-z]+\."
				$File[1] | Should Match "My favorite Window's service is *"
			}

		}

		# Removes the teh PesterDemo.txt file
		Remove-Item -Path "$Temp\PesterDemo.txt"

	}

}