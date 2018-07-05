# id_av
Identify processes related to AV on Windows systems.

Currently the workflow is:
1. run `tasklist` on the target system
1. copy-paste into a file on your local system
1. edit the id_av.sh script to point to the file containing your tasklist dump
1. run `./id_av.sh` and cross your fingers.

You'll probably get a few hits on the `System` and `System Idle Process`, it's alpha AF. ¯\_(ツ)_/¯
