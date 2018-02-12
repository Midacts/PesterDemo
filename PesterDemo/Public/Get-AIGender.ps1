Function Get-AIGender
{
	[CmdletBinding()]
	Param()

	# Generates a random number
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

	# Outputs the results
	Write-Output $Gender
}