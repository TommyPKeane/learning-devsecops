# Local macOS `cloud-init` Validator with Docker

On macOS you can install Docker and Canonical Multipass, and modern Linux systems can use `cloud-init` as way to provision the setup of the Operating System for a temporary, permanent, or ephemeral VM.

`cloud-init` is often used to customize on top of a Machine Image (MI) in Cloud Service Providers like Amazon Web Services (AWS), Google Cloud Platform (GCP), and Microsoft Azure.

This directory provides the scripting and README (this file 👋) documentation to explain how to setup your macOS System to build the Docker Image and then use the custom helper script(s) provided here to validate your `cloud-init` files.

> 🤷‍♀️ I'm just figuring most of this out through practical efforts and semi-over-educated-guess-and-check, so there may be better or easier ways to do this, but I use macOS personally and professionally, and after like half a day (total) of searching and testing, this seemed to be the easiest and best way to get a local validation running for `cloud-init`. I avoided just using a validation website, and I didn't wanna go all through setting-up a full Linux environment because it's a bit of a Catch-22 situation, since the other `canonical-multipass/` directory in this repo is where I'm trying to use `cloud-init` to setup a local Ubuntu instance.
>
> This worked for me and after an initial vague error, I finally figured out that you need a starting line in your YAML file of `#cloud-config` and then I got through that confusingly vague error and finally was able to see other actual errors with clearer messages. So since this worked for me so well, and I'll keep using it, I'm moving it here to this separate directory in case anyone wants to run it themselves in macOS. I presume this would also work on Windows, but you may also just be able to install `cloud-init` through Windows Subsystem for Linux (WSL). And on Linux, you should be able to just install `cloud-init` and use it directly.

<!-- MarkdownTOC -->

- [How are we Validating?](#how-are-we-validating)
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


<a id="license-and-copyright"></a>
## License and Copyright

See the `LICENSE` file in the parent directory.


<a id="references"></a>
## References

- https://cloudinit.readthedocs.io/en/latest/reference/cli.html
