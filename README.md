# zwid

Utilities for embedding CoSWID tags in EFI binaries - written on Zig

Introduction
------------

Software Identification (SWID) tags provide an extensible XML-based structure to
identify and describe individual software components, patches, and installation
bundles. SWID tag representations can be too large for devices with network and
storage constraints.

CoSWID supports a similar set of semantics and features as SWID tags, as well
as new semantics that allow us to describe additional types of information, all
in a more memory efficient format.

We wanted to write up some text recommending a particular tool to be integrated
into the tianocore build process, but they all are not exactly awesome:

 * The [official tool from NIST](https://github.com/usnistgov/swid-tools) is a
   huge Java codebase that hasn't been updated for some time and doesn't work
   with any versions than Java 9 and that's been end-of-support since 2018.

 * A [go & rust implementation](https://github.com/platform-system-interface/sbom) exists for [coreboot](https://coreboot.org/) utilities.

Installing
----------

Requires: [zig v0.10.0](https://ziglang.org/download)

**Commands:**

```bash
$> zig build run -D{Options: debug|release-fast|release-safe|release-small} -- path/firmware.bin
```
