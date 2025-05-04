#!/usr/bin/env nextflow 

params.exit = 0
params.data = "256M"
params.times = 1

process read_write {
  machineType 'bar'
  maxForks 1 
  input: val(x)
  """
  echo "Reading and writing $params.data"
  dd if=/dev/zero of=/dev/null bs=$params.data count=1
  exit $params.exit
  """
}

workflow {
  channel.of(1..params.times) | read_write
}
