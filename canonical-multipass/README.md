# Canonical Multipass

Multipass is a new tooling provided by Canonical (the maintainers of the Ubnutu operating system) for running local Ubuntu instances like Docker containers, but simplified, and manageable with `cloud-init`.

On macOS (where most of this was developed and tested) this relies on QEMU for system virtualization.

From their own [documentation](https://documentation.ubuntu.com/multipass/latest/):

> Multipass is a tool to generate cloud-style Ubuntu VMs quickly on Linux, macOS and Windows. It provides a simple but powerful CLI that enables you to quickly access an Ubuntu command line or create your own local mini-cloud.
>
> Local development and testing can be challenging, but Multipass simplifies these processes by automating setup and teardown. Multipass has a growing library of images that you can use to launch purpose-built VMs or custom VMs you’ve configured yourself through its powerful cloud-init interface.
>
> Developers can use Multipass to prototype cloud deployments and to create fresh, customised Linux dev environments on any machine. Multipass is the quickest way for Mac and Windows users to get an Ubuntu command line on their systems. You can also use it as a sandbox to try new things without affecting your host machine or requiring a dual boot.

## Table of Contents

<!-- MarkdownTOC -->

- [Developer Setup on macOS](#developer-setup-on-macos)
- [macOS Use Cases](#macos-use-cases)
    - [Simple Ubuntu Image with `bash` User Setup](#simple-ubuntu-image-with-bash-user-setup)
- [References](#references)

<!-- /MarkdownTOC -->

<a id="developer-setup-on-macos"></a>
## Developer Setup on macOS

1. Make surey you have `brew` installed and setup, along with a Terminal Emulator like [iTerm2](https://iterm2.com/) or [Ghostty](https://ghostty.org/) -- if you need more details on how to do this, you can see my own setup notes here: https://github.com/TommyPKeane/example-bash-configuration
    1. Remember to periodically update `brew`:
        ```bash
        brew upgrade
        ```
    1. And then be sure to upgrade any installed "casks" (packages/tools):
        ```bash
        brew upgrade
        ```
1. Install QEMU:
    ```bash
    brew install qemu
    ```
1. Download the macOS `.pkg` installer for Multipass: https://canonical.com/multipass/install
1. Install Multipass by running `.pkg` installer
1. Open the `Multipass.app` after installation to confirm it worked
1. Go to your terminal and run the help command to confirm that the `multipass` CLI executable is installed and working:
    ```bash
    multipass --help
    ```
1. If you see the help message explaining all the arguments and subcommands, then you're done with the initial setup! 🎉

<a id="macos-use-cases"></a>
## macOS Use Cases

These sections cover some use-cases of Canonical's Multipass on macOS by creating, configuring, managing, and running various Ubuntu instances. For the purpose of this being relatively generic, I'm not gonna go into all kinds of various alternatives, but mainly just focus on a single example for each use-case. So like if there's an example here shown running Python stuff, you could probably use it as an example of how to do a similar setup for Rust, C++, TypeScript, or whatever language you wanna develop in.

<a id="simple-ubuntu-image-with-bash-user-setup"></a>
### Simple Ubuntu Image with `bash` User Setup



<a id="references"></a>
## References

- https://documentation.ubuntu.com/multipass/latest/
