Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3051E0E0A
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175768; cv=none; b=CRZneEBqamR2qFEFXi7YcPsXuHtnF+KYOgvDa1F3o5f5U2dMOowtdYBhq2aq9atvJ1Sh6iD6jRTP9j6MGRDOfyHci/SrkXLeRHkHYNaFGQJLcDHJy7ZkDEjfVbCQBloL0rfxgapiyhY8AXN4VQhUMHU63XJRLiCXkyss5jJmKEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175768; c=relaxed/simple;
	bh=aOpWphtbuLvsztEaAQKZujFyoXy+yK/m21B8DH7RIHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f1M9EVdTVrEXElVShlPlpM1wT++eNLwqSK7SQnOXPbhzQf7NEMe3uOG7VNiPzYB2gCZh1gfZF757hh3CZpqRw7lDIaBRvGuOfk6h+iGzzCD4VYRHZRiNQikDvAUqpGpTduzAsEPhJchPQVrp/OnlAFo+spkXwco6mTd+Av5FYGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzahqQf4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzahqQf4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2277C4CED1;
	Wed, 29 Jan 2025 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738175768;
	bh=aOpWphtbuLvsztEaAQKZujFyoXy+yK/m21B8DH7RIHg=;
	h=Date:From:To:Cc:Subject:From;
	b=KzahqQf4NCCNCZV36eYG09nTqECRxBnqKgv/2jhJAkvt4TONseP5xfCx1Pxkx/pve
	 SPE0TZf7NNF9IEPjQs2VcJZ7mUg6v9RuiLI0AKvhsOe3Mg+ZX421CM+j6psEj/E9Jh
	 u41lpcP+kElf+VO73R/FczGskfnx/CknS6fZtoESfz33sTmGqLx3cCse0Nyet6yevi
	 DWH1hrGZQZs3LGdUfpDX4/g1hrQKtqeZ9AYsEVIBmdLdkmzHh6mbCy/U52OXhccUua
	 fDknFWRc4+uyzQHxcXH83hY68khgrD1fSK23jK2fywn7SFf3ecUhMsnTttyPnOHpMM
	 csZwxO7nrwoCw==
Date: Thu, 30 Jan 2025 00:06:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: dmaengine updates for v6.14
Message-ID: <Z5p1FA7ISZy7+pli@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xeEH+rqYAFKkGcrc"
Content-Disposition: inline


--xeEH+rqYAFKkGcrc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Linus,

Please pull to receive dmaengine updates for v6.14 which includes a bunch
of new device support and updates to few drivers, biggest of them amd
ones. This is based on dmaengine fixes tag dmaengine-fix-6.13 already
pulled by you.

The following changes since commit 362f1bf98a3ecb5a2a4fcbdaa9718c8403beceb2:

  dmaengine: mv_xor: fix child node refcount handling in early exit (2024-1=
2-24 15:45:01 +0530)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dm=
aengine-6.14-rc1

for you to fetch changes up to 98d187a989036096feaa2fef1ec3b2240ecdeacf:

  dmaengine: idxd: Enable Function Level Reset (FLR) for halt (2024-12-24 1=
6:08:05 +0530)

----------------------------------------------------------------
dmaengine updates for v6.14

 New support:
  - TI J722S CSI BCDMA controller support
  - Intel idxd Panther Lake family platforms
  - Allwinner F1C100s suniv DMA
  - Qualcomm QCS615, QCS8300, SM8750, SA8775P GPI dma controller support
  - AMD ae4dma controller support and reorganisation of amd driver

 Updates:
  - Channel page support for Nvidia Tegra210 adma driver
  - Freescale support for S32G based platforms
  - Yamilfy atmel dma bindings

----------------------------------------------------------------
Basavaraj Natikar (6):
      dmaengine: Move AMD PTDMA driver to amd directory
      dmaengine: ae4dma: Add AMD ae4dma controller driver
      dmaengine: ptdma: Extend ptdma to support multi-channel and version
      dmaengine: ae4dma: Register AE4DMA using pt_dmaengine_register
      dmaengine: ptdma: Extend ptdma-debugfs to support multi-queue
      dmaengine: ae4dma: Register debugfs using ptdma_debugfs_setup

Charan Pedumuru (1):
      dt-bindings: dma: atmel: Convert to json schema

Christophe JAILLET (1):
      dmaengine: idxd: Remove a useless mutex

Colin Ian King (2):
      dmaengine: xilinx: xdma: remove redundant check on ret
      dmaengine: amd: qdma: make read-only arrays h2c_types and c2h_types s=
tatic const

Cs=F3k=E1s, Bence (1):
      dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA

David Lechner (2):
      dt-bindings: dma: adi,axi-dmac: convert to yaml schema
      dt-bindings: dma: adi,axi-dmac: deprecate adi,channels node

Dr. David Alan Gilbert (1):
      dmaengine: idxd: Remove unused idxd_(un)register_bus_type

Fenghua Yu (6):
      dmaengine: idxd: Add a new IAA device ID on Panther Lake family platf=
orms
      dmaengine: idxd: Add idxd_pci_probe_alloc() helper
      dmaengine: idxd: Binding and unbinding IDXD device and driver
      dmaengine: idxd: Add idxd_device_config_save() and idxd_device_config=
_restore() helpers
      dmaengine: idxd: Refactor halt handler
      dmaengine: idxd: Enable Function Level Reset (FLR) for halt

Javier Carrasco (1):
      dmaengine: mv_xor: switch to for_each_child_of_node_scoped()

Joe Hattori (2):
      dmaengine: ti: edma: make the loop condition simpler in edma_probe()
      dmaengine: ti: edma: fix OF node reference leaks in edma_driver

Jyothi Kumar Seerapu (1):
      dmaengine: qcom: gpi: Add GPI immediate DMA support for SPI protocol

Ken Sloat (1):
      dt-bindings: dma: st-stm32-dmamux: Add description for dma-cell values

Konrad Dybcio (1):
      dt-bindings: dma: qcom,gpi: Add SA8775P compatible

Kuninori Morimoto (1):
      dmaengine: sh: rcar-dmac: add comment for r8a779a0 compatible

Larisa Grigore (5):
      dmaengine: fsl-edma: select of_dma_xlate based on the dmamuxs presence
      dmaengine: fsl-edma: remove FSL_EDMA_DRV_SPLIT_REG check when parsing=
 muxbase
      dt-bindings: dma: fsl-edma: add nxp,s32g2-edma compatible string
      dmaengine: fsl-edma: add support for S32G based platforms
      dmaengine: fsl-edma: read/write multiple registers in cyclic transact=
ions

Marek Vasut (1):
      dmaengine: xilinx_dma: Configure parking registers only if parking en=
abled

Md Sadre Alam (1):
      dmaengine: qcom: bam_dma: Avoid writing unavailable register

Melody Olvera (1):
      dt-bindings: dma: qcom,gpi: Document the sm8750 GPI DMA engine

Mesih Kilinc (3):
      dma-engine: sun4i: Add a quirk to support different chips
      dma-engine: sun4i: Add has_reset option to quirk
      dma-engine: sun4i: Add support for Allwinner suniv F1C100s

Mohan Kumar D (2):
      dt-bindings: dma: Support channel page to nvidia,tegra210-adma
      dmaengine: tegra210-adma: Support channel page

Stefan Wahren (1):
      dmaengine: bcm2835-dma: Prevent suspend if DMA channel is busy

Vaishnav Achath (2):
      dt-bindings: dma: ti: k3-bcdma: Add J722S CSI BCDMA
      dmaengine: ti: k3-udma: Add support for J722S CSI BCDMA

Viken Dadhaniya (2):
      dt-bindings: dma: qcom,gpi: Add QCS615 compatible
      dt-bindings: dma: qcom,gpi: Add QCS8300 compatible

Vinod Koul (1):
      Merge branch 'fixes' into next

 .../devicetree/bindings/dma/adi,axi-dmac.txt       |  61 ---
 .../devicetree/bindings/dma/adi,axi-dmac.yaml      | 129 ++++++
 .../bindings/dma/allwinner,sun4i-a10-dma.yaml      |   4 +-
 .../devicetree/bindings/dma/atmel,sama5d4-dma.yaml |  79 ++++
 .../devicetree/bindings/dma/atmel-xdma.txt         |  54 ---
 .../devicetree/bindings/dma/fsl,edma.yaml          |  34 ++
 .../bindings/dma/nvidia,tegra210-adma.yaml         |  60 ++-
 .../devicetree/bindings/dma/qcom,gpi.yaml          |   4 +
 .../bindings/dma/stm32/st,stm32-dmamux.yaml        |  10 +
 .../devicetree/bindings/dma/ti/k3-bcdma.yaml       |   5 +-
 MAINTAINERS                                        |  10 +-
 drivers/dma/Kconfig                                |   6 +-
 drivers/dma/Makefile                               |   1 -
 drivers/dma/amd/Kconfig                            |  28 ++
 drivers/dma/amd/Makefile                           |   2 +
 drivers/dma/amd/ae4dma/Makefile                    |  10 +
 drivers/dma/amd/ae4dma/ae4dma-dev.c                | 157 +++++++
 drivers/dma/amd/ae4dma/ae4dma-pci.c                | 158 +++++++
 drivers/dma/amd/ae4dma/ae4dma.h                    | 100 +++++
 drivers/dma/{ =3D> amd}/ptdma/Makefile               |   0
 drivers/dma/{ =3D> amd}/ptdma/ptdma-debugfs.c        |  75 +++-
 drivers/dma/{ =3D> amd}/ptdma/ptdma-dev.c            |   0
 drivers/dma/{ =3D> amd}/ptdma/ptdma-dmaengine.c      | 226 +++++++++-
 drivers/dma/{ =3D> amd}/ptdma/ptdma-pci.c            |   0
 drivers/dma/{ =3D> amd}/ptdma/ptdma.h                |   4 +-
 drivers/dma/amd/qdma/qdma.c                        |  22 +-
 drivers/dma/bcm2835-dma.c                          |  22 +
 drivers/dma/fsl-edma-common.c                      |  36 +-
 drivers/dma/fsl-edma-common.h                      |   3 +
 drivers/dma/fsl-edma-main.c                        | 115 ++++-
 drivers/dma/idxd/cdev.c                            |   5 -
 drivers/dma/idxd/idxd.h                            |  15 +-
 drivers/dma/idxd/init.c                            | 481 +++++++++++++++++=
++--
 drivers/dma/idxd/irq.c                             |  85 ++--
 drivers/dma/idxd/registers.h                       |   1 +
 drivers/dma/idxd/sysfs.c                           |  10 -
 drivers/dma/mv_xor.c                               |   5 +-
 drivers/dma/ptdma/Kconfig                          |  13 -
 drivers/dma/qcom/bam_dma.c                         |  24 +-
 drivers/dma/qcom/gpi.c                             |  31 +-
 drivers/dma/sh/rcar-dmac.c                         |   4 +
 drivers/dma/sun4i-dma.c                            | 208 +++++++--
 drivers/dma/tegra210-adma.c                        |  86 +++-
 drivers/dma/ti/edma.c                              |   7 +-
 drivers/dma/ti/k3-udma.c                           |  16 +
 drivers/dma/xilinx/xdma.c                          |   8 +-
 drivers/dma/xilinx/xilinx_dma.c                    |  20 +-
 47 files changed, 2059 insertions(+), 375 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/dma/adi,axi-dmac.txt
 create mode 100644 Documentation/devicetree/bindings/dma/adi,axi-dmac.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/atmel,sama5d4-dma=
=2Eyaml
 delete mode 100644 Documentation/devicetree/bindings/dma/atmel-xdma.txt
 create mode 100644 drivers/dma/amd/ae4dma/Makefile
 create mode 100644 drivers/dma/amd/ae4dma/ae4dma-dev.c
 create mode 100644 drivers/dma/amd/ae4dma/ae4dma-pci.c
 create mode 100644 drivers/dma/amd/ae4dma/ae4dma.h
 rename drivers/dma/{ =3D> amd}/ptdma/Makefile (100%)
 rename drivers/dma/{ =3D> amd}/ptdma/ptdma-debugfs.c (52%)
 rename drivers/dma/{ =3D> amd}/ptdma/ptdma-dev.c (100%)
 rename drivers/dma/{ =3D> amd}/ptdma/ptdma-dmaengine.c (59%)
 rename drivers/dma/{ =3D> amd}/ptdma/ptdma-pci.c (100%)
 rename drivers/dma/{ =3D> amd}/ptdma/ptdma.h (99%)
 delete mode 100644 drivers/dma/ptdma/Kconfig

--=20
~Vinod

--xeEH+rqYAFKkGcrc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmeadRQACgkQfBQHDyUj
g0dn0BAAzsN1EH12GQqFUX+ecAuH/K6vfExWpQPMJgrYF2zeg3q8pBM1dgdZZiJJ
qL+NVVWFGdm/Bxdm/XTNJuo7xHFzDVNiwmFlLVy2bfatqMrn8fVG75YAe6y5FpED
EZ3EH6C2iXG7eEEmaRFL8yZh63J+vuL3XC55hnkCZy8yUhDT6GUB5AoYXqydLW6i
4JFtdbKWGNu8+MdbK33gEClZfPtlLkHBSk5ZzmJeWmAwAWTmhWBFFd6u+g5eqWu9
h9c6kOaoRhrgioJEDqEorZf45CASXqkSYTQbMbDnMw99QMHAHkgmvUDlGa/qbKYv
cjKGA6WOiRawFQZHaYjM8pq2M00sRGh2+ArDUAMjZdB55gdFBttbTq0tYlv5jSew
T+uJaRb1KNgOqfz2dA9gcE1VDp3880o3mi0dKM0VS1s5+Y0UBF46OXTDrrJQ5ZG5
IvL438yIj1PpElLrWTB3a6hN9fWv/JWrmq6SSm9gvXl1jQAZJSH4ApnzbgOMbBxK
JKi9n7UxB7HznwR9PZq0VKwoQzWNMeD3tkCVGsdZLFtONxAZtRUHzUnxo3Gmu+pm
61dIBy0QOGrVeDURHTq+wWybTlMw1OFJdERhnUiPlkvD1zKZXq3B2cMtvutRpz7I
pweDU5Fy2GtYbWOY6NrVpU4z7xZdgyr4F1OjF9DnoiShFQx50Gw=
=x/Ly
-----END PGP SIGNATURE-----

--xeEH+rqYAFKkGcrc--
