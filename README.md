# Learning DevSecOps

__tommy teaches tommy__ (and anyone who wants to actually read this) common and new DevSecOps processes, tooling, systems, infrastructure, and setups to enable reliable, repeatable, and debuggable system configurations for software development and software runtimes.

I started with MS-DOS and Windows 3.x in the early 1990s as a kid on my family's computer, and I've been using and working with/on computers pretty consistently since then. I've worked-on or -with Intel, Apple, ARM, RISC, ASIC, Xilinx FPGA, TI DSPs, Nvidia (CUDA), PLCs, and Analog Devices ICs chipsets. I've worked-on or -with Microsoft DOS, Microsoft Windows, Apple OS X, Apple macOS, Apple iOS, Apple iPadOS, Linux, Ubuntu Linux, Debian, Raspbian, Pop OS!, Manjaro Linux, Arch Linux, Oracle Solaris, GNOME, KDE, Docker, Cloud Native Buildpack, Canonical Multipass (`cloud-init`), and various bootloader systems. I mainly have Google Cloud Platform (GCP) experience, but I also have a significant amount of Amazon Web Services (AWS) experience, and I've dabbled a bit in Azure (Microsoft's Cloud Platform). I have local and cloud-based experience with containerization (Dockerization) and orchestration, like Kubernetes, Minikube, GCP GKE, AWS EKS, AWS Fargate, and Docker Compose.

Professionally I've also directly done (or supported) SOC compliance & auditing, HITRUST certification & auditing, HIPAA compliance & auditing, company-specific Quality Management System (QMS) compliance & auditing, and US FDA Software as a Medical Device (SaaMD) 510(k) submissions, designs, implementations, compliance, and auditing.

I've worked as a Network Technician, I've helped reprogram Cash Registers, I've helped troubleshoot and implement Test Fixtures for complex electronics, and I've worked with various kinds of networking and integrations of physical & virtual systems.

I don't have any professional certifications, just my academic degrees.

So all that is to say: that's me ... and so you can take this stuff here with whatever size of grain of salt that you want. I'm just trying to keep a record of how to use and setup various things for DevOps and DevSecOps purposes, while also teaching myself, while also reminding myself in case I forget.

I would say that you probably don't wanna just copy-paste anything here into any critical system setup, and you're safest to assume that I forgot/missed something. So just be sure to be careful.

But otherwise, yeah, here it is: computer stuff for developers and for just generally running/setting-up systems ... 🤷‍♀️ let's see what I can figure out 🤓😄.

## Table of Contents

<!-- MarkdownTOC -->

- [Developer Setup](#developer-setup)
- [Repository Directory Tree](#repository-directory-tree)
- [License and Copyright](#license-and-copyright)
    - [Images, Documents, and Artworks](#images-documents-and-artworks)
- [References](#references)

<!-- /MarkdownTOC -->

<a id="developer-setup"></a>
## Developer Setup

Each directory should have a `README.md` that will explain the local developer setup and the tooling required for running/using the given examples.

All of the top-level subdirectories are disjoint from another, so there's no real common installation needed, though you will need to have a Unix shell environment and a Terminal Emulator for accessing your shell, in order to install tools/dependencies and run any scripts or tools.

<a id="repository-directory-tree"></a>
## Repository Directory Tree

- `.github/`
    - `workflows/`
    - `CONTRIBUTING`
- `canonical-multipass/`
    - _Examples of using Canonical's Multipass (local or Cloud-based Ubuntu Instances)._
- `cloud-init-validator/`
    - _A Docker-based Validator for `cloud-init` mainly for macOS where `cloud-init` isn't available directly._

<a id="license-and-copyright"></a>
## License and Copyright

See the `LICENSE` file.

<a id="images-documents-and-artworks"></a>
### Images, Documents, and Artworks

Unless otherwise specified, all imagery, documents, and artwork provided in this repository were created by Tommy P. Keane (👋 that's me), who retains all copyright per the licensing details in this repository.

<a id="references"></a>
## References

- Canonical Multipass: https://documentation.ubuntu.com/multipass/latest/
- Docker: ...
- `cloud-init` YAML Configuration Examples: https://cloudinit.readthedocs.io/en/latest/reference/examples.html
- https://www.sublimetext.com/ purchased and used for coding as a text editor (and lightweight IDE)
- https://www.sublimemerge.com/ purchased and used for interacting with Git as version control for this repository
