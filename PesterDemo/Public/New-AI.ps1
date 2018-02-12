Function New-AI
{
	[CmdletBinding()]
	Param()

	# Generates the AI's gender
	Try
	{
		Write-Verbose "Generating the AI's gender."
		$Gender = Get-AIGender
	}
	Catch
	{
		Write-Error "$($_.Exception.Message)`nFailed to generate the new AI's gender." -ErrorAction "Stop"
	}

	# Generates the AI's name
	Try
	{
		Write-Verbose "Generating the AI's name."
		$Name = Get-AIName -Gender $Gender
	}
	Catch
	{
		Write-Error "$($_.Exception.Message)`nFailed to generate the new AI's name." -ErrorAction "Stop"
	}

	# Generates the AI's service
	Try
	{
		Write-Verbose "Generating the AI's favorite Windows service."
		$Service = Get-AIService
	}
	Catch
	{
		Write-Error "$($_.Exception.Message)`nFailed to generate the new AI's service." -ErrorAction "Stop"
	}

	# Puts the results together
	Try
	{
		# Builds the results
		$Result = "Hello, my name is $Name.`nMy favorite Window's service is $Service."
		Write-Verbose $Result

		# Outputs the results to a file
		$Temp = (Get-ChildItem -Path "env:\Temp").Value
		$Result | Out-File -FilePath "$Temp\PesterDemo.txt"
	}
	Catch
	{
		Write-Error "$($_.Exception.Message)`nFailed to output the new AI's results to a file." -ErrorAction "Stop"
	}

	# Outputs the results as a PSCustomObject
	[PSCustomObject]@{
		'Name'		= $Name
		'Gender'	= $Gender
		'Service'	= $Service
	}
}