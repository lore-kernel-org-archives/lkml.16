Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7CC28E5EC;
	Wed, 23 Apr 2025 15:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420794; cv=none; b=NfyAMpVTjt/jTCRJz1Th9GHbnDn6OIPtNbTMff2tW/C+4nmtJ15B3FkzBk2LBqsKqBziLvj2HtNRIR88w0zplMCM9mZ4lYsUg0NEzuNwEZ1WpkHNGZpxm6Ha5Y0Ru8JSrEUaJszG7pyfSlbtK+MRRT9N5aF7Ph0koetgzWF2m84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420794; c=relaxed/simple;
	bh=dnUfZfy4SbfOanqTrD95ug3i8Q/GGLV+FT4TvY9Q8QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBccdtorBjITyX2aY5CD1UNQMQUQCMtLgQ67f0kNqBUqUqCXB9PDixRoieu+Bj/m6IYshTjG6XUc4z+2AX76rXij3VojtrFzxmxqfkDdD2FssziVfiYci0SlNbVecrhUxSnIa+KYAdZqcid7lA1sgce28DVwx/ypmBik9VElPbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKMwItCK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKMwItCK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E4AC4CEE2;
	Wed, 23 Apr 2025 15:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745420794;
	bh=dnUfZfy4SbfOanqTrD95ug3i8Q/GGLV+FT4TvY9Q8QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OKMwItCKAkaxJQZbpiM6Gzi7Jew9HrDMTseSZPPy5i/fqn4K0u6m9hqjXMGCVxELF
	 Q8AL7wVF45soHbT4WnW2sYk+kMbSUWz+9bjkybM2YZvLlkJaW8/D+SuidStQ2Lip2G
	 ZkbJTYX2x4nVcmCy/poZ3PSQcg/xKS5JDzJUc42woCT5CEPT0V1txmDsm+j3Lp6OtU
	 UM3zU5fRSXUCYHCl9FAlRuV+K2AC6sKgNUxlUXAIfrfwLj/Vdcsitond324HQRCVjz
	 mutRPqyGb65eAqBU67HpQapBju53q7ZVaYnDTmAgcZprZouW51OFufX1eF0cOdpj53
	 gbibELIFbrw7Q==
Date: Wed, 23 Apr 2025 16:06:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Jacek Luczak <difrost.kernel@gmail.com>
Cc: regressions@lists.linux.dev, linux-sound@vger.kernel.org,
	venkataprasad.potturu@amd.com, LKML <linux-kernel@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [REGRESSION] Resume from suspend broken in 6.15-rc due to ACP
 changes.
Message-ID: <99dce57f-8947-4c7a-abeb-2e27afdd0d65@sirena.org.uk>
References: <CADDYkjR0JG_JTQeQMAvUJvtb9RxFH6_LzV2Fr_1cnqPTgV_Z8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6a1h689nxIoRIfcI"
Content-Disposition: inline
In-Reply-To: <CADDYkjR0JG_JTQeQMAvUJvtb9RxFH6_LzV2Fr_1cnqPTgV_Z8w@mail.gmail.com>
X-Cookie: If you have to hate, hate gently.


--6a1h689nxIoRIfcI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 01:20:33PM +0200, Jacek Luczak wrote:
> Hi,
>=20
> On my ASUS Vivobook S16 (and on similar ASUS HW - see [1]) on resume
> from suspend system dies (no logs available) soon after GPU completes
> resume - I can see the login screen, only power cycle left.

Are there any updates on this from the AMD side?  As things stand my
inclination is to revert the bulk of the changes to the driver from the
past merge window, I don't really know anything about this hardware
specifically and "dies without logs" is obviously giving few hints.
None of the skipped commits looks immediately suspect, there's doubtless
some unintended change in there.

Adding Mario and leaving the context for his benefit.

> I've managed to bisect this as close as possible to following commits:
> - [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: Refactor
> acp70 platform resource structure
> - [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: Remove white=
 line
> - [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: Move
> spin_lock and list initialization to acp-pci driver
> - [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: Remove
> redundant acp_dev_data structure
> - [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: Add new
> interrupt handle callbacks in acp_common_hw_ops
>=20
> Attached lspci and bisection log.
>=20
> Regards,
> -jacek
>=20
> [1] https://bbs.archlinux.org/viewtopic.php?id=3D304816

> git bisect start
> # status: waiting for both good and bad commits
> # good: [ed92bc5264c4357d4fca292c769ea9967cd3d3b6] ASoC: codecs: wm0010: =
Fix error handling path in wm0010_spi_probe()
> git bisect good ed92bc5264c4357d4fca292c769ea9967cd3d3b6
> # status: waiting for bad commit, 1 good commit known
> # bad: [47c4f9b1722fd883c9745d7877cb212e41dd2715] Tidy up ASoC control ge=
t and put handlers
> git bisect bad 47c4f9b1722fd883c9745d7877cb212e41dd2715
> # good: [74da545ec6a8b41de96b4c350bb59dfe45c0d822] ASoC: codec: madera: u=
se inclusive language for SND_SOC_DAIFMT_CBx_CFx
> git bisect good 74da545ec6a8b41de96b4c350bb59dfe45c0d822
> # bad: [a935b3f981809272d2649ad9c27a751685137846] ASoC: SOF: ipc4-topolog=
y: Allocate ref_params on stack
> git bisect bad a935b3f981809272d2649ad9c27a751685137846
> # good: [24056de9976dfc33801d2574c1672d91f840277a] ASoC: codecs: Update d=
evice_id tables for Realtek
> git bisect good 24056de9976dfc33801d2574c1672d91f840277a
> # good: [a1462fb8b5dd1018e3477a6861822d75c6a59449] ASoC: Intel: boards: u=
pdates for 6.15
> git bisect good a1462fb8b5dd1018e3477a6861822d75c6a59449
> # skip: [8a7e7a03e3c53cd9abbbf233899cc2e05b2c6ec0] ASoC: SOF: Intel: Add =
support for ACE3+ mic privacy
> git bisect skip 8a7e7a03e3c53cd9abbbf233899cc2e05b2c6ec0
> # skip: [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: Add ne=
w interrupt handle callbacks in acp_common_hw_ops
> git bisect skip aaf7a668bb3814f084f9f6f673567f6aa316632f
> # good: [c6141ba0110f98266106699aca071fed025c3d64] ASoC: Merge up fixes
> git bisect good c6141ba0110f98266106699aca071fed025c3d64
> # skip: [ad5a0970f86d82e39ebd06d45a1f7aa48a1316f8] ASoC: cs35l41: check t=
he return value from spi_setup()
> git bisect skip ad5a0970f86d82e39ebd06d45a1f7aa48a1316f8
> # good: [269b844239149a9bbaba66518db99ebb06554a15] ASoC: dapm: Fix change=
s to DECLARE_ADAU17X1_DSP_MUX_CTRL
> git bisect good 269b844239149a9bbaba66518db99ebb06554a15
> # skip: [89be3c15a58b2ccf31e969223c8ac93ca8932d81] ASoC: qcom: sm8250: ex=
plicitly set format in sm8250_be_hw_params_fixup()
> git bisect skip 89be3c15a58b2ccf31e969223c8ac93ca8932d81
> # bad: [02e1cf7a352a3ba5f768849f2b4fcaaaa19f89e3] ASoC: amd: acp: Fix for=
 enabling DMIC on acp platforms via _DSD entry
> git bisect bad 02e1cf7a352a3ba5f768849f2b4fcaaaa19f89e3
> # good: [7a2ff0510c51462c0a979f5006d375a2b23d46e9] ASoC: soc-pcm: reuse d=
pcm_state_string()
> git bisect good 7a2ff0510c51462c0a979f5006d375a2b23d46e9
> # good: [a8fed0bddf8fa239fc71dc5c035d2e078c597369] ASoC: dt-bindings: add=
 regulator support to dmic codec
> git bisect good a8fed0bddf8fa239fc71dc5c035d2e078c597369
> # bad: [ee7ab0fd540877fceb3d51f87016e6531d86406f] ASoC: amd: acp: Refacto=
r rembrant platform resource structure
> git bisect bad ee7ab0fd540877fceb3d51f87016e6531d86406f
> # good: [0d2d276f53ea3ba1686619cde503d9748f58a834] ASoC: SOF: Intel: lnl/=
ptl: Only set dsp_ops which differs from MTL
> git bisect good 0d2d276f53ea3ba1686619cde503d9748f58a834
> # good: [8aeb7d2c3fc315e629d252cd601598a5af74bbb0] ASoC: SOF: Intel: Crea=
te ptl.c as placeholder for Panther Lake features
> git bisect good 8aeb7d2c3fc315e629d252cd601598a5af74bbb0
> # skip: [ac5b4a24f16f2f56b5cc5092969930b867274edc] ASoC: Intel: soc-acpi-=
intel-ptl-match: Add cs42l43 support
> git bisect skip ac5b4a24f16f2f56b5cc5092969930b867274edc
> # skip: [8ae746fe51041484e52eba99bed15a444c7d4372] ASoC: amd: acp: Implem=
ent acp_common_hw_ops support for acp platforms
> git bisect skip 8ae746fe51041484e52eba99bed15a444c7d4372
> # good: [0978e8207b61ac6d51280e5d28ccfff75d653363] ASoC: SOF: Intel: hda-=
mlink: Add support for mic privacy in VS SHIM registers
> git bisect good 0978e8207b61ac6d51280e5d28ccfff75d653363
> # good: [4a43c3241ec3465a501825ecaf051e5a1d85a60b] ASoC: SOF: Intel: ptl:=
 Add support for mic privacy
> git bisect good 4a43c3241ec3465a501825ecaf051e5a1d85a60b
> # skip: [1ec3f1dc215d4b3d3679ecdc4a549d4e82b3a609] ASoC: dmic: add regula=
tor support
> git bisect skip 1ec3f1dc215d4b3d3679ecdc4a549d4e82b3a609
> # good: [e2cda461765692757cd5c3b1fc80bd260ffe1394] ASoC: amd: acp: Refact=
or dmic-codec platform device creation
> git bisect good e2cda461765692757cd5c3b1fc80bd260ffe1394
> # skip: [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: Move s=
pin_lock and list initialization to acp-pci driver
> git bisect skip a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90
> # bad: [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: Refacto=
r acp70 platform resource structure
> git bisect bad f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0
> # good: [6e60db74b69c29b528c8d10d86108f78f2995dcb] ASoC: amd: acp: Refact=
or acp machine select
> git bisect good 6e60db74b69c29b528c8d10d86108f78f2995dcb
> # skip: [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: Remove=
 redundant acp_dev_data structure
> git bisect skip e3933683b25e2cc94485da4909e3338e1a177b39
> # skip: [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: Remove=
 white line
> git bisect skip c8b5f251f0e53edab220ac4edf444120815fed3c
> # only skipped commits left to test
> # possible first bad commit: [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] A=
SoC: amd: acp: Refactor acp70 platform resource structure
> # possible first bad commit: [c8b5f251f0e53edab220ac4edf444120815fed3c] A=
SoC: amd: acp: Remove white line
> # possible first bad commit: [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] A=
SoC: amd: acp: Move spin_lock and list initialization to acp-pci driver
> # possible first bad commit: [e3933683b25e2cc94485da4909e3338e1a177b39] A=
SoC: amd: acp: Remove redundant acp_dev_data structure
> # possible first bad commit: [aaf7a668bb3814f084f9f6f673567f6aa316632f] A=
SoC: amd: acp: Add new interrupt handle callbacks in acp_common_hw_ops

> 00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/Stri=
x Halo Root Complex [1022:1507]
> 00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo=
 IOMMU [1022:1508]
> 00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/Stri=
x Halo Dummy Host Bridge [1022:1509]
> 00:01.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/Strix=
 Halo PCIe USB4 Bridge [1022:150a]
> 00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/Stri=
x Halo Dummy Host Bridge [1022:1509]
> 00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/Strix=
 Halo GPP Bridge [1022:150b]
> 00:02.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/Strix=
 Halo GPP Bridge [1022:150b]
> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/Stri=
x Halo Dummy Host Bridge [1022:1509]
> 00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/Stri=
x Halo Dummy Host Bridge [1022:1509]
> 00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/Strix=
 Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
> 00:08.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/Strix=
 Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
> 00:08.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/Strix=
 Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
> 00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus Contro=
ller [1022:790b] (rev 71)
> 00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH LPC Bri=
dge [1022:790e] (rev 51)
> 00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data=
 Fabric; Function 0 [1022:16f8]
> 00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data=
 Fabric; Function 1 [1022:16f9]
> 00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data=
 Fabric; Function 2 [1022:16fa]
> 00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data=
 Fabric; Function 3 [1022:16fb]
> 00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data=
 Fabric; Function 4 [1022:16fc]
> 00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data=
 Fabric; Function 5 [1022:16fd]
> 00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data=
 Fabric; Function 6 [1022:16fe]
> 00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data=
 Fabric; Function 7 [1022:16ff]
> 61:00.0 Non-Volatile memory controller [0108]: Micron Technology Inc 2400=
 NVMe SSD (DRAM-less) [1344:5413] (rev 03)
> 62:00.0 Network controller [0280]: MEDIATEK Corp. MT7922 802.11ax PCI Exp=
ress Wireless Network Adapter [14c3:0616]
> 63:00.0 Display controller [0380]: Advanced Micro Devices, Inc. [AMD/ATI]=
 Strix [Radeon 880M / 890M] [1002:150e] (rev c1)
> 63:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Rembr=
andt Radeon High Definition Audio Controller [1002:1640]
> 63:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD] =
Strix/Krackan/Strix Halo CCP/ASP [1022:17e0]
> 63:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device =
[1022:151e]
> 63:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD] =
ACP/ACP3X/ACP6x Audio Coprocessor [1022:15e2] (rev 70)
> 63:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family 17=
h/19h/1ah HD Audio Controller [1022:15e3]
> 64:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc=
=2E [AMD] Strix/Strix Halo PCIe Dummy Function [1022:150d]
> 64:00.1 Signal processing controller [1180]: Advanced Micro Devices, Inc.=
 [AMD] Strix/Krackan/Strix Halo Neural Processing Unit [1022:17f0] (rev 10)
> 65:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device =
[1022:151f]
> 65:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device =
[1022:151a]
> 65:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device =
[1022:151b]
> 65:00.5 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device =
[1022:151c]

--6a1h689nxIoRIfcI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgJAfQACgkQJNaLcl1U
h9D9Hgf/TYhaPzJb0HCNumDdXKTO8CERdxcAmZodwzitd1qcdzEsX1mzbWLn5uDh
Tg8t052c1hEZCHXwtNdaSPWsDjZeKDa6gpgZXnz11jLwiYAo0ls6n2v72e8SttmF
TNwPRehGo5QdTVccfjLR3GABPLjiSSCogpkoOSp+1+ZO+ee34RnNBBXlth2JR8SN
91hlWn7dOhvZ7SfQHNfvmdKtq4ENWqgiZ8dP1LvXVxl4B5yDyiX+gqAYll9roT2l
JHOpymdO9tb+3RrDx7J56yKuz+PoCMOvAkKr4JHvoqdpIeGESf9w5sswpuZu6NcT
j7aGo8iEhPGqiRQ8AGMV7qFwT8v8aQ==
=Secz
-----END PGP SIGNATURE-----

--6a1h689nxIoRIfcI--
