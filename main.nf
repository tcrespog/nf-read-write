#!/usr/bin/env nextflow 

params.exit = 0
params.forks = 1
params.times = 1
params.bytes = 268435456 // 256 MB
params.outfile = '/dev/null'

process read_write {
  machineType 'bar'
  maxForks params.forks
  input: val(x)
  """
  echo "Reading and writing $params.bytes bytes"
  dd if=/dev/zero of=$params.outfile count=$params.bytes iflag=count_bytes
  exit $params.exit
  """
}

workflow {
  channel.of(1..params.times) | read_write
}
