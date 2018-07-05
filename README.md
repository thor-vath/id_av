# id_av
Identify processes related to AV on Windows systems.

Currently the workflow is:
1. run `tasklist` on the target system
1. copy-paste into a file on your local system
1. run `./id_av.sh sample_tasklist.txt` and cross your fingers. Replace `sample_tasklist.txt` with the output of `tasklist` from your compromised system.

If you don't clean up the output of your tasklist you'll probably get a few hits on the `System` and `System Idle Process`, it's alpha AF and may never be updated. ¯\\_(ツ)_/¯
