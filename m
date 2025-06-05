Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316861A00F0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749106385; cv=none; b=KAlw1FWzrMgy3yOY7nDSVYv2cz4Himo96cNP6EC4uCxDmxi/L553yluK9tZifVuD1zVLX988itQ58b9zdCujPTbKqOpGUMPoB4/iZkuzuZ1aG8Haj6Q9ZjQqhyFz8J7sEVyQtPydVrmt4MflT0PyVkozyp/owWr9EGnqdpP6b10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749106385; c=relaxed/simple;
	bh=vA8D3g3vJIvtt27o9aE9Vd7o6hUsfSfRZcwpsMs6PUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L0rC0htTW4b6Cip5va973j+1ztV+Z11lrPWCavmDCnP4ZrLiQf6YaoO0HPwZq7bmtldDbnt4uGT0EoX0AftNRMTAbbWDlT9MnoCc2EZ9f4mKKtKgoWsJQkTlQVX0tMff+VNZBzzl9f/TbKYb1aMnXi3XrYafSUWKcXILHUUHAOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JyoiJ74m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JyoiJ74m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287F8C4CEE7;
	Thu,  5 Jun 2025 06:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749106384;
	bh=vA8D3g3vJIvtt27o9aE9Vd7o6hUsfSfRZcwpsMs6PUM=;
	h=Date:From:To:Cc:Subject:From;
	b=JyoiJ74mDsUqco4MoQePxzTe0fLPkY+rRhbzDvWoXMd8i6CdW5QiUCkbdsO/d1lE2
	 tAGiHcbNonarbnOwFIOoRIksyOXnlm1MENJBnQ8QqfQG9dZ/82BSFFiPFfnTxP+Xkc
	 ByUCubkb7JgyfhmluSyeC4AyUNaYI1897rmcr/c59VIjIFBHG3Zr52vAMd+ssvwLyk
	 VNgGFXW+qInrgn6F3RD9rBxxqO7ZLatPXoMO1R54T+cG1eRSQVmBm15gv+UzXPjTg3
	 RafINg8K5At0534Cda+z8GpzEbBHv7Cm7UiS/pRv7xgg6cTye7FTZ8ORrO37mXHxrp
	 rNYQXGuC+nTEQ==
Date: Thu, 5 Jun 2025 12:23:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: dmaengine updates for v6.16
Message-ID: <aEE+za1ox/mlTs1D@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CVfQPmQrWZRrfKJW"
Content-Disposition: inline


--CVfQPmQrWZRrfKJW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull to receive a fairly small (compared to older requests) pull
request for dmaengine subsystem. This has a new ARM dmaengine driver and
couple of new device support and few driver changes.


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dm=
aengine-6.16-rc1

for you to fetch changes up to 3c018bf5a0ee3abe8d579d6a0dda616c3858d7b2:

  dmaengine: idxd: Remove unused pointer and macro (2025-05-14 16:00:30 +01=
00)

----------------------------------------------------------------
dmaengine updates for v6.16

 New support:
  - Renesas RZ/V2H(P) dma support for r9a09g057
  - Arm DMA-350 driver
  - Tegra Tegra264 ADMA support

 Updates:
  - AMD ptdma driver code removal and optimizations
  - Freescale edma error interrupt handler support

----------------------------------------------------------------
Ben Collins (1):
      fsldma: Set correct dma_mask based on hw capability

Devendra K Verma (1):
      dmaengine: dw-edma: Add HDMA NATIVE map check

Eder Zulian (3):
      dmaengine: ptdma: Remove unused pointer dma_cmd_cache
      dmaengine: ptdma: Remove dead code from pt_dmaengine_register()
      dmaengine: idxd: Remove unused pointer and macro

Fabrizio Castro (6):
      dt-bindings: dma: rz-dmac: Restrict properties for RZ/A1H
      dt-bindings: dma: rz-dmac: Document RZ/V2H(P) family of SoCs
      irqchip/renesas-rzv2h: Add rzv2h_icu_register_dma_req()
      dmaengine: sh: rz-dmac: Allow for multiple DMACs
      dmaengine: sh: rz-dmac: Add RZ/V2H(P) support
      arm64: dts: renesas: r9a09g057: Add DMAC nodes

Geert Uytterhoeven (1):
      dmaengine: ARM_DMA350 should depend on ARM/ARM64

Henry Martin (1):
      dmaengine: ti: Add NULL check in udma_probe()

Jie Hai (1):
      MAINTAINERS: Maintainer change for hisi_dma

Joy Zou (2):
      dt-bindings: dma: fsl-edma: increase maxItems of interrupts and inter=
rupt-names
      dmaegnine: fsl-edma: add edma error interrupt handler

Kaushal Kumar (1):
      dt-bindings: dma: qcom,bam: Document dma-coherent property

Nathan Lynch (1):
      Documentation: dmaengine: Correct reference to glReadPixels()

Robin Murphy (2):
      dt-bindings: dma: Add Arm DMA-350
      dmaengine: Add Arm DMA-350 driver

Sakari Ailus (1):
      dmaengine: at_xdmac: Use pm_runtime_put_noidle() with many usage_coun=
ts

Sheetal (2):
      dt-bindings: Document Tegra264 ADMA support
      dmaengine: tegra210-adma: Add Tegra264 support

Thomas Gessler (2):
      dmaengine: xilinx_dma: Set max segment size
      dmaengine: xilinx_dma: Set dma_device directions

Vinicius Costa Gomes (1):
      dmaengine: idxd: Narrow the restriction on BATCH to ver. 1 only

Yi Sun (1):
      dmaengine: idxd: Check availability of workqueue allocated by idxd wq=
 driver before using

 .../devicetree/bindings/dma/arm,dma-350.yaml       |  44 ++
 .../devicetree/bindings/dma/fsl,edma.yaml          |   4 +-
 .../bindings/dma/nvidia,tegra210-adma.yaml         |   2 +
 .../devicetree/bindings/dma/qcom,bam-dma.yaml      |   2 +
 .../devicetree/bindings/dma/renesas,rz-dmac.yaml   | 107 +++-
 Documentation/driver-api/dmaengine/provider.rst    |   4 +-
 MAINTAINERS                                        |   2 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 165 ++++++
 drivers/dma/Kconfig                                |   8 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/amd/ptdma/ptdma-dmaengine.c            |  23 +-
 drivers/dma/amd/ptdma/ptdma.h                      |   1 -
 drivers/dma/arm-dma350.c                           | 660 +++++++++++++++++=
++++
 drivers/dma/at_xdmac.c                             |   6 +-
 drivers/dma/dw-edma/dw-edma-pcie.c                 |   5 +-
 drivers/dma/fsl-edma-common.c                      |  30 +-
 drivers/dma/fsl-edma-common.h                      |  18 +
 drivers/dma/fsl-edma-main.c                        | 114 +++-
 drivers/dma/fsldma.c                               |  20 +-
 drivers/dma/fsldma.h                               |   1 +
 drivers/dma/idxd/cdev.c                            |  10 +-
 drivers/dma/idxd/idxd.h                            |   2 -
 drivers/dma/idxd/sysfs.c                           |   6 +-
 drivers/dma/sh/rz-dmac.c                           |  84 ++-
 drivers/dma/tegra210-adma.c                        | 185 +++++-
 drivers/dma/ti/k3-udma.c                           |   3 +-
 drivers/dma/xilinx/xilinx_dma.c                    |   4 +
 drivers/irqchip/irq-renesas-rzv2h.c                |  35 ++
 include/linux/irqchip/irq-renesas-rzv2h.h          |  23 +
 29 files changed, 1463 insertions(+), 106 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/arm,dma-350.yaml
 create mode 100644 drivers/dma/arm-dma350.c
 create mode 100644 include/linux/irqchip/irq-renesas-rzv2h.h

--=20
~Vinod

--CVfQPmQrWZRrfKJW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmhBPswACgkQfBQHDyUj
g0fy5A/+NHsVQrNtFbaicz9wsR8A7dbyFapw1f9LTp0bFmBArNxhsemu0Pymcf30
BCaXJO89hUd1uAborZjdIzH3gnSiWnQqS/dj2evXmOuR5iyia7faUi1ti3TgoH1C
h+cFbnVJwjVUzXR8fhlCANVmxnNw0PTQGXkc+9lWPLxTEzx+JOiEBdCI6DFxN7aX
W2p3HjvfkuairoCqvW4C3EF9MIwE5ImSOrmY5UUvTmkke9LaZJnz8Ib9KnwwJmgo
SHtVm3a9JRrFJDtPmGEEEy+jUGz3xKeO2I37G8l8PG9azV9JESQA1fiAv2nf6D55
pr++VCQ/wY3W5/yzpynHn/9YX8n+DIDIZ54Bidx8VV8KpnOZ3bbOEMA7WqAfIlvb
dK+QEHDHn3KP0hu/801Aw6h3JKoc9NgGEB9dEb+TauRfBJZRbyo/MNKNAPhipTML
bWw+cPL2gNcclOppRmo41XArwCr81xgWmwHW3u1bkUKChs4pcK/3BzE8IwHjVk1O
Y3fpEFWIBOdSAGP0R089sXhk7AyNcgLq+LmH5bVcrm5hFKirclmieTXjtj5nTQIY
tTGeddKVVgCntfow6pJag4lzKLLA5g2vAXOuHQMBnMEYM5bVtEfOzV4U9u9iN00M
TWFC9qKj3fhg7IoNhoP7UavIq8zbO3Ep/JULo8EJVciu8gCzlCA=
=ALqe
-----END PGP SIGNATURE-----

--CVfQPmQrWZRrfKJW--
