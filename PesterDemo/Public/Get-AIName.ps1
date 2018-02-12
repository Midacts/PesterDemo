Function Get-AIName
{
	[CmdletBinding()]
	Param(
		[Parameter(Mandatory = $True)]
		[String]$Gender
	)

	# Generates a name that matches the specified gender
	Do {
		$Result = Invoke-RestMethod -Method "Get" -Uri "http://uinames.com/api/?region=united` states"
	}
	Until ( $Result.Gender -eq $Gender )

	# Outputs the result
	Write-Output "$($Result.Name) $($Result.Surname)"
}