#!/bin/bash
ver=$1
bashfile=$2
echo 'alias ansys="/ansys_inc/v'$ver'/ansys/bin/launcher'$ver'"'>>$bashfile
echo 'alias icemcfd="/ansys_inc/v'$ver'/icemcfd/linux64_amd/bin/icemcfd"'>>$bashfile
echo 'alias fluent="/ansys_inc/v'$ver'/fluent/bin/fluent"'>>$bashfile
echo 'alias wb="/ansys_inc/v'$ver'/Framework/bin/Linux64/runwb2"'>>$bashfile
echo 'alias chemkin="/ansys_inc/v'$ver'/reaction/chemkinpro.linuxx8664/bin/run_chemkin.sh"'>>$bashfile
echo 'alias energico="/ansys_inc/v'$ver'/reaction/chemkinpro.linuxx8664/bin/run_energico.sh"'>>$bashfile
echo 'alias rdwb="/ansys_inc/v'$ver'/reaction/chemkinpro.linuxx8664/bin/run_rdworkbench.sh"'>>$bashfile

