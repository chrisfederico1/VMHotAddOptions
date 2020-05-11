function set-hotaddoptions {
<#
	.SYNOPSIS
    Verifies and Sets Hot Add CPU and Hot Add Memory
    
	.DESCRIPTION
    This Advanced function verifies and sets hot add options for CPU and Memory
	.Example
    set-hotaddoptions -Name MyVM  
    
    .Notes
	NAME: set-hotaddoptions.ps1
    AUTHOR: Chris Federico  
	LASTEDIT: 05/11/2020
	VERSION: 1.0
	KEYWORDS: VMware, vSphere, vm, Memory, CPU
   
 #>

 # Parameters
    [CmdletBinding()]
    param
        (
            [Parameter(Mandatory=$true,ValueFromPipeline)]
            [string]$Name
        )


Begin {

    # Clear Screen
    Clear-host

    # Add start-transact here
   # Start-Transcript -path .\hotaddoptionslogging.txt 

}

Process {

    write-host "INFO: Verifying HotAdd options for VM $Name"

    # Check to see if options are set
    $result = (get-vm $Name | select-object ExtensionData).ExtensionData.config | Select-object Name, MemoryHotAddEnabled, CpuHotAddEnabled

    $result

}

End {
 
 # Stop Logging    
#Stop-Transcript

}

}