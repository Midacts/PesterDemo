Function Bad-Function
{
	[CmdletBinding()]
	Param()

	# Generates the AI's gender
	Try
	{
		# Generates a random number
		Write-Verbose "Generating the AI's gender."
		$RandomNumber = Get-Random -Minimum 0 -Maximum 2

		# Picks the gender based on the random number
		Switch ( $RandomNumber )
		{
			0
			{
				$Gender = "Male"
			}

			1
			{
				$Gender = "Female"
			}
		}
	}
	Catch
	{
		Write-Error "$($_.Exception.Message)`nFailed to generate the new AI's gender." -ErrorAction "Stop"
	}

	# Generates the AI's name
	Try
	{
		# Generates a name that matches the specified gender
		Write-Verbose "Generating the AI's name."
		Do {
			$APIResult = Invoke-RestMethod -Method "Get" "http://uinames.com/api/?region=united` states"
		}
		Until ( $APIResult.Gender -eq $Gender )

		# Outputs the result
		$Name = "$($APIResult.Name) $($APIResult.Surname)"
	}
	Catch
	{
		Write-Error "$($_.Exception.Message)`nFailed to generate the new AI's name." -ErrorAction "Stop"
	}

	# Generates the AI's service
	Try
	{
		# Gets a random number
		Write-Verbose "Generating the AI's favorite Windows service."
		$Number = Get-Random -Minimum 0 -Maximum 120

		# Retrieves all the services
		Try
		{
			$Services = Get-WmiObject -Class "Win32_Service"
		}
		Catch
		{
			Write-Error "$($_.Exception.Message)`nFailed to find any services." -ErrorAction "Stop"
		}

		# Outputs the result
		$Service = $Services[$Number].DisplayName
	}
	Catch
	{
		Write-Error "$($_.Exception.Message)`nFailed to generate the new AI's location." -ErrorAction "Stop"
	}

	# Puts it all together
	$Result = "Hello, my name is $Name.`nMy favorite Window's service is $Service."
	Write-Verbose $Result

	# Outputs the results to a file
	$Result = Out-File -FilePath "C:\Temp\PesterDemo.txt"
}