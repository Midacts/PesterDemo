Function Get-AIService
{
	[CmdletBinding()]
	Param()

	# Gets a random number
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
	Write-Output $Services[$Number].DisplayName
}