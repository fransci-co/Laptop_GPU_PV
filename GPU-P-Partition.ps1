$vm = "GPUP-01"
$instance_name = "\\?\PCasdasd23646sasf47SYS_3sdasd3412asdasd71cfee&01234125400421521325e-43bf-24251-das1249}\ASDASDASDV"


Add-VMGpuPartitionAdapter -VMName $vm -InstancePath $instance_name 
Set-VMGpuPartitionAdapter -VMName $vm -MinPartitionVRAM 80000000 -MaxPartitionVRAM 100000000 -OptimalPartitionVRAM 100000000 -MinPartitionEncode 80000000 -MaxPartitionEncode 100000000 -OptimalPartitionEncode 100000000 -MinPartitionDecode 80000000 -MaxPartitionDecode 100000000 -OptimalPartitionDecode 100000000 -MinPartitionCompute 80000000 -MaxPartitionCompute 100000000 -OptimalPartitionCompute 100000000

Set-VM -GuestControlledCacheTypes $true -VMName $vm
Set-VM -LowMemoryMappedIoSpace 1Gb -VMName $vm
Set-VM –HighMemoryMappedIoSpace 32GB –VMName $vm

