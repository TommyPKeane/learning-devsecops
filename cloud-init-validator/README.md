# Local macOS `cloud-init` Validator with Docker

On macOS you can install Docker and Canonical Multipass, and modern Linux systems can use `cloud-init` as way to provision the setup of the Operating System for a temporary, permanent, or ephemeral VM.

`cloud-init` is often used to customize on top of a Machine Image (MI) in Cloud Service Providers like Amazon Web Services (AWS), Google Cloud Platform (GCP), and Microsoft Azure.

This directory provides the scripting and README (this file 👋) documentation to explain how to setup your macOS System to build the Docker Image and then use the custom helper script(s) provided here to validate your `cloud-init` files.

> 🤷‍♀️ I'm just figuring most of this out through practical efforts and semi-over-educated-guess-and-check, so there may be better or easier ways to do this, but I use macOS personally and professionally, and after like half a day (total) of searching and testing, this seemed to be the easiest and best way to get a local validation running for `cloud-init`. I avoided just using a validation website, and I didn't wanna go all through setting-up a full Linux environment because it's a bit of a Catch-22 situation, since the other `canonical-multipass/` directory in this repo is where I'm trying to use `cloud-init` to setup a local Ubuntu instance.
>
> This worked for me and after an initial vague error, I finally figured out that you need a starting line in your YAML file of `#cloud-config` and then I got through that confusingly vague error and finally was able to see other actual errors with clearer messages. So since this worked for me so well, and I'll keep using it, I'm moving it here to this separate directory in case anyone wants to run it themselves in macOS. I presume this would also work on Windows, but you may also just be able to install `cloud-init` through Windows Subsystem for Linux (WSL). And on Linux, you should be able to just install `cloud-init` and use it directly.

<!-- MarkdownTOC -->

- [How are we Validating?](#how-are-we-validating)
- [macOS Setup](#macos-setup)
	- [Build Local Docker Image for the Validator Runtime](#build-local-docker-image-for-the-validator-runtime)
	- [Debug the Docker Image](#debug-the-docker-image)
- [Validate a `cloud-init` YAML Configuration File](#validate-a-cloud-init-yaml-configuration-file)
- [License and Copyright](#license-and-copyright)
- [References](#references)

<!-- /MarkdownTOC -->


<a id="how-are-we-validating"></a>
## How are we Validating?

I'm a bit new to this, and it seems to be pretty actively being in development, so this may change over time, but currently if you dig through the `bash` script and the Docker Image setup in the Dockerfile, you'll see that basically all we're doing is:

```bash
cloud-init schema --annotate -c ${PATH_TO_CLOUD_INIT_YAML}
```

Where you'd replace `${PATH_TO_CLOUD_INIT_YAML}` with the path to the YAML file, or you could preface the above with actually using that variable as:

```bash
PATH_TO_CLOUD_INIT_YAML="..."; cloud-init schema --annotate -c "${PATH_TO_CLOUD_INIT_YAML}"
```

And you can just put the Path in the `"..."`.

More details on the `cloud-init schema` sub-command can be found in the official documentation: https://cloudinit.readthedocs.io/en/latest/reference/cli.html#schema


<a id="macos-setup"></a>
## macOS Setup

We are starting from  the assumption that you have `brew` setup and installed, so if you need more details on that for macOS or how to setup and use `bash`, you can see more details and documentation (including some automated setup scripts) in our [`example-bash-configuration` Repository](https://github.com/TommyPKeane/example-bash-configuration).

1. `brew install docker`
1. `brew install docker-buildx`
1. `brew install colima`
1. `colima start`

The above should install the Docker tooling, the Docker `buildx` updated builder, and then Colima as the Docker socket emulation to tie the Docker Engine daemon service to the runtime socket.

You can see more about Colima here: https://github.com/abiosoft/colima -- it also supports `containerd` and Incus, not just Docker.

For now, we're using Docker only because  I was most familiar with it and I got this working, so we're just documenting this first to make sure everything's captured here and is working before maybe looking at `containerd` and see if that runs easier/better or aligns to more preferable FOSS licensing.

<a id="build-local-docker-image-for-the-validator-runtime"></a>
### Build Local Docker Image for the Validator Runtime

Once you've done the above and have the tooling working (which you can check by running `docker images` and you should see an empty table output, or a table of Images you've already downloaded/built), then we need to build the Docker Image so that we have it locally.

> 👻 This Docker Image isn't being published to the Docker Hub, it's just very simple and it should be a quick build, and this also leaves it open for more customization -- and also I'm not really interested to publish it to the Docker Hub and I'm assuming that there will someday soonish be support for `cloud-init` validation on macOS more natively, which would make this not really useful.

To build the image, we have a helper script so you just run:

```bash
./build-cloud-init-validator.sh
```

And then you should run `docker images` and see an output like this:

```bash
❯ docker images
REPOSITORY             TAG       IMAGE ID       CREATED      SIZE
cloud-init-validator   latest    0a68d2086351   7 days ago   546MB
```

Now you have the tooling setup.

<a id="debug-the-docker-image"></a>
### Debug the Docker Image

To get this all working initially, we took a typical approach of running an interactive `bash` shell from an ephemeral Docker Container based-on the Docker Image. This lets us start a Docker Container from the Image, "jump" into its `bash` environment, and look around and run commands. This can be really helpful if you want to figure out where things are mounted or what tools are available, or not available, and it lets you basically prototype the Container runtime in a more interfactive way. You just have to remember to keep notes of what you're doing because you don't wanna figure stuff out, leave the Container with `CTRL` + `D` and then realize you forgot everything -- which has definitely totally probably definitely never happened to me ever, for sure.

So to make it convenient to jump into the Docker Container and test stuff out, you can run the script with the debug flag like:

```bash
./validate-cloud-init.sh DEBUG
```

or

```bash
./validate-cloud-init.sh "DEBUG"
```

If you look inside the validator script you'll see how we check for this string particularly, and then we'll do a `readonly` bind-mount of the current directory to the Container and start a `bash` shell.

So if you have a local YAML config for `cloud-init` that you put in this directory (or a sub-directory), you should be able to find those and see them mounted by running:

```bash
ls -alF ./test_configs/
```


<a id="validate-a-cloud-init-yaml-configuration-file"></a>
## Validate a `cloud-init` YAML Configuration File

Once you have the Docker Image built and available on your system by checking with `docker images`, where you see an output like this:

```bash
❯ docker images
REPOSITORY             TAG       IMAGE ID       CREATED      SIZE
cloud-init-validator   latest    0a68d2086351   7 days ago   546MB
```

Then you can run the validation by creating an ephemeral container as:

```bash
./validate-cloud-init.sh ../canonical-multipass/example-2510-bash.yml
```

That should show you exact line errors, and then you can refer back to the `cloud-init` Documentation to troubleshoot and move ahead.

Once you have a valid configuration, if it's for Ubuntu, then you can use the `canonical-multipass/` sibling-directory to start a new Instance based-on your now validated `cloud-init` YAML config 😄🎉


<a id="license-and-copyright"></a>
## License and Copyright

See the `LICENSE` file in the parent directory.


<a id="references"></a>
## References

- https://cloudinit.readthedocs.io/en/latest/reference/cli.html
