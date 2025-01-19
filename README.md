# Laptop_GPU_PV

GPU Partitioning on windows laptop for VMs w/ Windows Hyper-V 

A compilation of information on how to do GPU Paravirtualization on windows laptop using Windows Hyper-V.

Based on Craft Computing tutorial video https://www.youtube.com/watch?v=XLLcc29EZ_8&t=707s&ab_channel=CraftComputing with some adaptations from different sources . Follow the video and pay attention to the differences described bellow on step 7. and 8. 


# Requirements 

Windows 10 Pro or Windows 11 Pro/ Enterprise (Required for HyperV) 
Updated GPU Drivers


## 1. Installation Instructions 

Install HyperV (Turn Windows Features On or Off)
	
 	- Configure virtual switch for External Network
	- Disable Enhanced Sessions
	
## 2. Verify GPU Compatibility
	
 	- Check with Powershell: Get-VMPartitionableGPU

## 3. Create New VM:
	
 	- Gen 2
	- 4GB Ram 
	- 120GB HDD (or how much you want to alocate)

## 4. VM Settings:
	
 	- 8 CPU Cores 
	- Disable Checkpoints

## 5. Start VM + Install Windows using ISO file

## 6. Driver Installation 

File Transfers
	
	- HOST - C:\Windows\System32\DriverStore\FileRepository\nv_dispi.inf_amd64_[UUID]
	- GUEST - - To C:\Windows\System32\HostDriverStore\FileRepository\nv_dispi.inf_amd64_[UUID] (You will have to create C:\Windows\System32\HostDriverStore\FileRepository)
 
	- HOST - C:\Windows\System32\nv*.* (Every file that begins with nv)
	- GUEST - C:\Windows\System32\

**NOTE on Laptop**  - The name of the drivers will be different, Device Manager > Your Graphics Card > Properties > Driver > Driver Details > Scroll all the way down, that's the folder you need.


- GPU Partition -

## 7. Run PowerShell ISE as Administrator

Open GPU-P-Partition.ps1
	
 	- Set $vm = [VM-NAME]
 	- Set-ExecutionPolicy Unrestricted
 	- Set $instance_name = [Instance_name] (Only for Laptop)
	- Run Script with Play button

**NOTE on Laptop**  - Use "Get-VMHostPartitionableGPU" in powershell to get the details of Partitionable GPU in your laptop

Then cross-check the "Name" of the GPU via Device Manager>DisplayAdapter>GPU>Properties>Events with that of Names that came as Output in Powershell

Take the said name from the Output in Powershell and substitute on the GPU-P-Partition.ps1 script in this repository on $instance_name = "said name"

This will allocated your desired GPU to VM in Hyper-V


## 8. Start VM

Check to see if driver is loaded on VM device manager 


- PostInstall Steps  (Original Intended for gaming, no need otherwise)

Install Parsec from Parsec.app
Install VBCable Audio Device Emulator
Install USB Monitor Virtual Driver
Install Riva Tuner from: https://www.guru3d.com/files-details/rtss-rivatuner-statistics-server-download.html
    - Recommend limiting VM to 60 FPS
    - Adjust frame limits for Host and VM. Don't forget to tweak game settings.

Connect to the VM via Parsec and GAME ON!





(Props to the unsung hero reddit user Own_Pizza_5547 & youtube commentator EnzeMK)

