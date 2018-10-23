# fastai
FastAI experiments and tools

## Dockerfile changes
This dockerfile is a slight modification of the work by Kai Lichtenberg, in his awesome [toolbox](https://github.com/KaiLicht/DataScience_Toolbox/tree/master/dockerfiles/fast_ai).
Edited for v1, including install commands from [fastai v1](https://github.com/fastai/fastai/tree/release-1.0.11)

A point to note though for v1 due to many paths now going to /root/.fastai/ and /root/.torch/ inside the container, I have resorted to mounting volumes outside the container for persistence and disk space saving.

So you may have to use a bunch of volume mounts as follows according to you system mounts.

`docker run --rm -d --runtime=nvidia --ipc=host -v /local/.fastai/data/:/root/.fastai/data/  -v   /local/.torch/models/:/root/.torch/models/`

where /local/ is your mount path

Another point to note, since the library is different from course-v3, I ended up git cloning the course to separate folder so I can keep updating as more notebooks are released. to link that folder to your docker use another mount as in
`/local/course-v3/:/fastai/course-v3`
this way you would see the course materials in your workdir when jupyter notebook is running.

There may be more changes as the course proceeds for different paths like for weights etc, we will update if required.

For set up and docker build details follow @Kai 's toolbox in the link above.
