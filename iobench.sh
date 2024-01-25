#!/bin/bash
# Set terminal colors
YELLOW='\033[1;33m'
WHITE='\033[1;37m' 
NC='\033[0m' 

# Set default values
direct=1
size="1G"
numjobs=3
iodepth=32

help_message() {
  echo "Usage: $0 [-d direct] [-s size] [-n numjobs] [-i iodepth] [-h]"
  echo "  -d: Enable direct I/O (0 for disable)"
  echo "  -s: Specify size (default is 1GB)"
  echo "  -n: Specify number of jobs (default is 3)"
  echo "  -i: Specify iodepth (default is 32)"
  echo "  -h: Display help message"
  exit 1
}

while getopts "d:s:n:i:h" opt; do
  case $opt in
    d)
      direct=$OPTARG
      ;;
    s)
      size=$OPTARG
      ;;
    n)
      numjobs=$OPTARG
      ;;
    i)
      iodepth=$OPTARG
      ;;
    h)
      help_message
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      help_message
      ;;
  esac
done

echo -e "${YELLOW}Hostname: ${NC}$(hostname)"

## Seq Write tests
echo -e "${YELLOW}Seq Write benchmarking: size=$size,direct=$direct,numjobs=$numjobs,iodepth=$iodepth"
echo -e " ${WHITE}BS=1M  ${NC}$(fio --name=write --ioengine=libaio --rw=write --group_reporting --bs=1M --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=128K${NC}$(fio --name=write --ioengine=libaio --rw=write --group_reporting --bs=128K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=64K ${NC}$(fio --name=write --ioengine=libaio --rw=write --group_reporting --bs=64K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=32K ${NC}$(fio --name=write --ioengine=libaio --rw=write --group_reporting --bs=32K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=16K ${NC}$(fio --name=write --ioengine=libaio --rw=write --group_reporting --bs=16K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=4K  ${NC}$(fio --name=write --ioengine=libaio --rw=write --group_reporting --bs=4K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"

## Seq Read tests
echo -e "${YELLOW}Seq Read benchmarking: size=$size,direct=$direct,numjobs=$numjobs,iodepth=$iodepth"
echo -e " ${WHITE}BS=1M  ${NC}$(fio --name=read --ioengine=libaio --rw=read --group_reporting --bs=1M --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=128K${NC}$(fio --name=read --ioengine=libaio --rw=read --group_reporting --bs=128K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=64K ${NC}$(fio --name=read --ioengine=libaio --rw=read --group_reporting --bs=64K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=32K ${NC}$(fio --name=read --ioengine=libaio --rw=read --group_reporting --bs=32K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=16K ${NC}$(fio --name=read --ioengine=libaio --rw=read --group_reporting --bs=16K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=4K  ${NC}$(fio --name=read --ioengine=libaio --rw=read --group_reporting --bs=4K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"

## Rand Write tests
echo -e "${YELLOW}Rand Write benchmarking: size=$size,direct=$direct,numjobs=$numjobs,iodepth=$iodepth"
echo -e " ${WHITE}BS=1M  ${NC}$(fio --name=randwrite --ioengine=libaio --rw=randwrite --group_reporting --bs=1M --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=128K${NC}$(fio --name=randwrite --ioengine=libaio --rw=randwrite --group_reporting --bs=128K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=64K ${NC}$(fio --name=randwrite --ioengine=libaio --rw=randwrite --group_reporting --bs=64K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=32K ${NC}$(fio --name=randwrite --ioengine=libaio --rw=randwrite --group_reporting --bs=32K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=16K ${NC}$(fio --name=randwrite --ioengine=libaio --rw=randwrite --group_reporting --bs=16K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=4K  ${NC}$(fio --name=randwrite --ioengine=libaio --rw=randwrite --group_reporting --bs=4K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"

## Rand Read tests
echo -e "${YELLOW}Rand Read benchmarking: size=$size,direct=$direct,numjobs=$numjobs,iodepth=$iodepth"
echo -e " ${WHITE}BS=1M  ${NC}$(fio --name=randread --ioengine=libaio --rw=randread --group_reporting --bs=1M --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=128K${NC}$(fio --name=randread --ioengine=libaio --rw=randread --group_reporting --bs=128K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=64K ${NC}$(fio --name=randread --ioengine=libaio --rw=randread --group_reporting --bs=64K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=32K ${NC}$(fio --name=randread --ioengine=libaio --rw=randread --group_reporting --bs=32K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=16K ${NC}$(fio --name=randread --ioengine=libaio --rw=randread --group_reporting --bs=16K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"
echo -e " ${WHITE}BS=4K  ${NC}$(fio --name=randread --ioengine=libaio --rw=randread --group_reporting --bs=4K --direct=$direct --group_reporting --size=$size --numjobs=$numjobs --iodepth=$iodepth --thread | grep ", BW=")"

## Clean leftovers
rm read.*.*
rm write.*.*
rm randread.*.*
rm randwrite.*.*
