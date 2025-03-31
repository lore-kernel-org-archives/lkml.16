Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0D41C862F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406637; cv=none; b=KnX3rlQq6DDjCaspPqQqiw5TtFm7b4Per8X9Fmv75EyHkN6152zEBPVSq+bdPEpaeauTkWQn4NPGjyustPFBePlLs+Dv4gjJ99sBQLnSaO5BzRx4PV6H+vKZ9a/iyCBuVqkAtDnwTaabPS1V21zntIP4n+JKIjSLlq+kbWkFA38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406637; c=relaxed/simple;
	bh=r/vrKKAIfEqMW0QfG5nZo7nwRmTSFazNa8fQwhQ6V6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kC2KpUiisvGGNZKvLq0luq3fg53HpvuoyN4FjTuo8l8WCRqXbkfi2HtAU9uUhdmqCaMfV8uMQMUizcW4GApRbnjydnyLvAK8JgrabRo/GXsbUnTM5cP7QCVITgH+8DijWLAF1Du53wV/y4EudbT5BhshdWlOI0mMV5RW0xNEKx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eyq8gCNk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eyq8gCNk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC025C4CEE5;
	Mon, 31 Mar 2025 07:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743406635;
	bh=r/vrKKAIfEqMW0QfG5nZo7nwRmTSFazNa8fQwhQ6V6w=;
	h=Date:From:To:Cc:Subject:From;
	b=Eyq8gCNkGzCyyUDhgghhIKdXeQYuR7rpiS49DDiPHkiqSPXvNx2eHdzV3kJk1aWyr
	 2elLWdhHEDHtH8ErGdB0VUuFqJBTupMrmsdcDyIcvjcGlLbnLd91WtVAelfIP/l74P
	 GnrJoEEGy1d1Po5nlG3tvuP+Vw+MMHUNDPbQfuwzM7ketknn253Y5rd1dvtds6Z1Bx
	 46BdnPq/+8dX2R8w35+HA3bhfSUxAVqHTPdF92g4C+MA157kJd/eub9s2AUnVoOD8e
	 TWgUgqVzx0312c5GiefcbKB/a+FpByh/Y+Aso6cFug4uFTmjg8F4R+vc4FzT0uiNcP
	 ZZyKXjKhfia1g==
Date: Mon, 31 Mar 2025 13:07:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]:  Dmaengine subystem updates for 6.15
Message-ID: <Z+pGJypbmzkaVhfz@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wOpT71mZ8CsTrvB+"
Content-Disposition: inline


--wOpT71mZ8CsTrvB+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull to receive dmaengine subsystem updates for this cycle
consisting of a new driver (Microchip) along with couple of yaml binding
conversions, core api updates and bunch of driver updates etc


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dm=
aengine-6.15-rc1

for you to fetch changes up to 6565439894570a07b00dba0b739729fe6b56fba4:

  dmaengine: ptdma: Utilize the AE4DMA engine's multi-queue functionality (=
2025-03-11 02:33:27 +0530)

----------------------------------------------------------------
dmaengine updates for v6.15

 New support:
  - Microchip sama7d65 dma controller
  - Yaml conversion of atmel dma binding and Freescale Elo DMA Controller
    binding

 Core:
  - Remove device_prep_dma_imm_data() API as users are removed
  - Reduce scope of some less frequently used DMA request channel APIs with
    aim to cleanup these in future

 Updates:
  - Drop Fenghua Yu from idxd maintainers, as he changed jobs
  - AMD ptdma support for multiqueue and ae4dma deprecated PCI IDs removal

----------------------------------------------------------------
Andy Shevchenko (5):
      dmaengine: Replace dma_request_slave_channel() by dma_request_chan()
      dmaengine: Use dma_request_channel() instead of __dma_request_channel=
()
      dmaengine: Add a comment on why it's okay when kasprintf() fails
      dmaengine: Unify checks in dma_request_chan()
      dmaengine: dw: Switch to LATE_SIMPLE_DEV_PM_OPS()

Arnd Bergmann (1):
      dmaengine: img-mdc: remove incorrect of_match_ptr annotation

Basavaraj Natikar (3):
      dmaengine: ae4dma: Remove deprecated PCI IDs
      dmaengine: ae4dma: Use the MSI count and its corresponding IRQ number
      dmaengine: ptdma: Utilize the AE4DMA engine's multi-queue functionali=
ty

Dan Carpenter (1):
      dmaengine: idxd: Delete unnecessary NULL check

Durai Manickam KR (1):
      dt-bindings: dma: convert atmel-dma.txt to YAML

Fenghua Yu (1):
      MAINTAINERS: Change maintainer for IDXD

Frank Li (2):
      dt-bindings: dma: fsl,edma: Add i.MX94 support
      dt-bindings: dma: fsl-mxs-dma: Add compatible string for i.MX8 chips

Inochi Amaoto (1):
      dt-bindings: dma: snps,dw-axi-dmac: Allow devices to be marked as non=
coherent

J. Neusch=E4fer (1):
      dt-bindings: dma: Convert fsl,elo*-dma to YAML

Krzysztof Kozlowski (2):
      dmaengine: Use str_enable_disable-like helpers
      dmaengine: pxa: Enable compile test

Matthew Majewski (1):
      dmaengine: ti: edma: support sw triggered chans in of_edma_xlate()

Nathan Lynch (1):
      dmaengine: Remove device_prep_dma_imm_data from struct dma_device

Peng Fan (2):
      dmaengine: fsl-edma: cleanup chan after dma_async_device_unregister
      dmaengine: fsl-edma: free irq correctly in remove path

Roger Quadros (1):
      dmaengine: ti: k3-udma-glue: Drop skip_fdq argument from k3_udma_glue=
_reset_rx_chn

Ryan Wanner (1):
      dt-bindings: dma: atmel: add microchip,sama7d65-dma

Siddharth Vadapalli (1):
      dmaengine: ti: k3-udma: Enable second resource range for BCDMA and PK=
TDMA

Stefan Wahren (2):
      dmaengine: fsl-edma: Add missing newlines to log messages
      dmaengine: bcm2835-dma: fix warning when CONFIG_PM=3Dn

Thorsten Blum (1):
      dmaengine: Fix typo in comment

Vinicius Costa Gomes (1):
      dmaengine: dmatest: Fix dmatest waiting less when interrupted

 .../bindings/dma/atmel,at91sam9g45-dma.yaml        |  68 +++++++
 .../devicetree/bindings/dma/atmel,sama5d4-dma.yaml |   3 +
 .../devicetree/bindings/dma/atmel-dma.txt          |  42 -----
 .../devicetree/bindings/dma/fsl,edma.yaml          |   8 +
 .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 137 ++++++++++++++
 .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 125 +++++++++++++
 .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 132 +++++++++++++
 .../devicetree/bindings/dma/fsl,mxs-dma.yaml       |   6 +
 .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml  |   2 +
 .../devicetree/bindings/misc/atmel-ssc.txt         |   2 +-
 .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 -----------------=
----
 MAINTAINERS                                        |   4 +-
 drivers/dma/Kconfig                                |   2 +-
 drivers/dma/amd/ae4dma/ae4dma-pci.c                |   6 +-
 drivers/dma/amd/ae4dma/ae4dma.h                    |   2 +
 drivers/dma/amd/ptdma/ptdma-dmaengine.c            |  90 ++++++++-
 drivers/dma/bcm2835-dma.c                          |   2 +-
 drivers/dma/dmaengine.c                            |  16 +-
 drivers/dma/dmatest.c                              |   6 +-
 drivers/dma/dw-edma/dw-edma-core.c                 |   6 +-
 drivers/dma/dw/pci.c                               |   8 +-
 drivers/dma/dw/platform.c                          |   8 +-
 drivers/dma/fsl-edma-main.c                        |  18 +-
 drivers/dma/idxd/init.c                            |   3 +-
 drivers/dma/img-mdc-dma.c                          |   2 +-
 drivers/dma/imx-dma.c                              |   3 +-
 drivers/dma/imx-sdma.c                             |   5 +-
 drivers/dma/pxa_dma.c                              |   4 +-
 drivers/dma/sh/shdma-base.c                        |   2 +-
 drivers/dma/sun6i-dma.c                            |   3 +-
 drivers/dma/ti/edma.c                              |  11 +-
 drivers/dma/ti/k3-udma-glue.c                      |  15 +-
 drivers/dma/ti/k3-udma.c                           |  36 ++++
 drivers/dma/xilinx/xilinx_dma.c                    |   3 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c           |   4 +-
 drivers/net/ethernet/ti/icssg/icssg_common.c       |   2 +-
 include/linux/dma/k3-udma-glue.h                   |   3 +-
 include/linux/dmaengine.h                          |  10 +-
 38 files changed, 683 insertions(+), 320 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/atmel,at91sam9g45=
-dma.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/atmel-dma.txt
 create mode 100644 Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/fsl,elo3-dma.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/fsl,eloplus-dma.y=
aml
 delete mode 100644 Documentation/devicetree/bindings/powerpc/fsl/dma.txt



--=20
~Vinod

--wOpT71mZ8CsTrvB+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmfqRicACgkQfBQHDyUj
g0cugw//VVi1C8mqAovfcOtQDQ1p4yU/iVweT6ssoxCIeu9FMRI+heK5vbEi3RgI
Q4y5bsCH7PbABRKzLat4RUGUU2uFHjR4jp3eG4/JPsF+G6Si+8QH2lPHUHiANctP
A8GgVKEjAHHP0Z/VUFPxE1S/YbnrqSeZQoC3ypWsI9hei0eckFo6ixJ3MyXYXRlD
BWMIPE2pVu14enbavcrI0sL+SYf7k6i6PGoiE4MCa17qgl7o3tPNVvV6cXPHRBYG
2X8P5Azmb/bRH/jP77LCKZ+k7ZZZTmUH67SdDs77tFbVWeBLFlLm9ljt9SJOxKLp
wpkLU8QemS5VKzgyg4Jrl4c64xOejAq8OoW5qqIg8G69yrU0XHVhqJlWV1c7jnha
ctlmCBMSFqzGfzVv7Php1VSGH39lXnjGAY/ac7aDtDhaxVisJAYP0V57WmJIIGdu
2TnzIApqW76rAukwW8II8pgBLCtZpp5NpUtBjU+DjyhJ8p4tNd+WD17pta0REW8f
WmVIzu/dpnhHMtQXx6qZBwVxZFqiTaGwX6MboW9+B7b7E3pLO9zsG4rxNOMBfnM0
gVrddy05wV20DNKNXHFgRN70HXskcz+eJh6Tp0UXo3ujoOTkf/yJ3/9shOI5vqbW
eS+oR5pDQulGI7eMS228+r5g03VyIRC999fDTCSm8ep2DJbyTXU=
=/LMM
-----END PGP SIGNATURE-----

--wOpT71mZ8CsTrvB+--
