#!/usr/bin/env nextflow 

params.exit = 0
params.bytes = 268435456 // 256 MB
params.times = 1

process read_write {
  machineType 'bar'
  maxForks 1 
  input: val(x)
  """
  echo "Reading and writing $params.bytes bytes"
  dd if=/dev/zero of=/dev/null count=$params.bytes iflag=count_bytes
  exit $params.exit
  """
}

workflow {
  channel.of(1..params.times) | read_write
}
