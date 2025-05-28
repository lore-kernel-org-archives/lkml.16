Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B05A286D6B;
	Wed, 28 May 2025 15:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748447580; cv=none; b=F0Q00WfpA4Y+qlpq86bELVnTA9ZiGp8z6SAkWldI9u51vpNDBga/X66HLzpJss/g8nCW7x+PHYCmcd3H13RoAb9cTFqn/jiBxAYMHuMvahPN3h1Ap/mnFcSoeBmTLQOpO5CvLOSrDM8ntsd01iWeI7yS1rwr5lISX6iiGO2CCjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748447580; c=relaxed/simple;
	bh=1WLKBRalGfzJfxaCyqcFXALyy6cN8+DK6NxLhvzWGBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=poV1s57foGRWOYLWtTfwQQD8G9gGUKRRxI2khLMo2x60gQl4Gn2ne3UQKk5xNQHJLo/DsuAxJiFhZgA6wsfwWDPYRx3wjuTfy3dCZXo7XD9mLBfoaeKnQSZw54bmvJWHVmroSc1aiWHsYovxkh+QOjN91UED2o7RgsoaVDKQYPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jeB7Tb2K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jeB7Tb2K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73740C4CEE3;
	Wed, 28 May 2025 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748447579;
	bh=1WLKBRalGfzJfxaCyqcFXALyy6cN8+DK6NxLhvzWGBY=;
	h=Date:From:To:Cc:Subject:From;
	b=jeB7Tb2KLM+gBEQxR2Es2GiYUnwA5PM1MvTfcFBFxRqmJBSmkbhABhqfPKac5BlAu
	 B1eD+0fxlh3nSDHnE0xtw53iG2pY4w4GENaA23btdy+1sdauyaEpcFga6tjCmS08dH
	 PJiRUGP2z938yiWAOaBsQiCE55Rd566rCOWma0EIEqRie4GoXIR+N6jJ0nRyyZOY0v
	 aJPOoAbOy73B8tDDXV/q8uzZW4timd0EkxKo2o5Q3xBKyStyU05Dq3UDwgry3/Cvqh
	 6TU75TRnq6jDo+kp7wageHTOpmwUazDxhgYVexvUYyMLmmvSvBNMmtOaQPQ0P5PawP
	 g7Li7UczLKgmg==
Date: Wed, 28 May 2025 10:52:57 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] Devicetree updates for v6.16
Message-ID: <20250528155257.GA4154719-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Linus,

Please pull DT updates for v6.16. There's a MAINTAINERS conflict in the 
VT8500 entry with several trees, and a conflict with the tty tree (take 
the tty tree change).

Rob


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-6.16

for you to fetch changes up to 89ab97de44fec8eecedd1d327d418c5781303c05:

  dt-bindings: timer: Add fsl,vf610-pit.yaml (2025-05-28 09:20:59 -0500)

----------------------------------------------------------------
Devicetree updates for v6.16:

DT Bindings:
- Convert all remaining interrupt-controller bindings to DT schema

- Convert Rockchip CDN-DP and Freescale TCON, M4IF, TigerP, LDB, PPC
  PMC, imx-drm, and ftm-quaddec to DT schema

- Add bindings for fsl,vf610-pit, fsl,ls1021a-wdt, sgx,vz89te,
  maxim,max30208, ti,lp8864, and fairphone,fp5-sndcard

- Add top-level constraints for renesas,vsp1 and renesas,fcp

- Add missing constraint in amlogic,pinctrl-a4 'group' nodes

- Adjust the allowed properties for dwc3-xilinx, sony,imx219,
  pci-iommu, and renesas,dsi

- Add EcoNet vendor prefix

- Fix the reserved-memory.yaml in fsl,qman-fqd

- Drop obsolete numa.txt and cpu-topology.txt which are schemas in
  dtschema now

- Drop Renesas RZ/N1S bindings

- Ensure Arm cpu nodes don't allow undocumented properties. Add all
  the properties which are in use and undocumented. Drop the Mediatek
  cpufreq binding which is not a binding, but just what DT properties
  the driver uses.

- Add compatibles for Renesas RZ/G3E and RZ/V2N Mali Bifrost GPU

- Update documentation on defining child nodes with separate schemas

- Add bindings to PSCI MAINTAINERS entry

DT core:
- Add new functions to simplify driver handling of 'memory-region'
  properties. Users to be added next cycle.

- Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()

- Add missing unlock on error in unittest_data_add()

----------------------------------------------------------------
Alexander Stein (1):
      media: dt-bindings: sony,imx219: Allow props from video-interface-devices

Alexander Sverdlin (1):
      dt-bindings: backlight: add TI LP8864/LP8866 LED-backlight drivers

Alexey Charkov (1):
      dt-bindings: interrupt-controller: via,vt8500-intc: Convert to YAML

Caleb James DeLisle (1):
      dt-bindings: vendor-prefixes: Add EcoNet

Chaoyi Chen (1):
      dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml

Dan Carpenter (1):
      of: unittest: Unlock on error in unittest_data_add()

Frank Li (8):
      dt-bindings: counter: Convert ftm-quaddec.txt to yaml format
      dt-bindings: interrupt-controller: Add missed fsl tzic controller
      dt-bindings: display: imx: convert fsl-imx-drm.txt to yaml format
      dt-bindings: display: imx: convert ldb.txt to yaml format
      dt-bindings: fsl: convert m4if.txt and tigerp.txt to yaml format
      dt-bindings: display: imx: convert fsl,tcon.txt to yaml format
      dt-bindings: watchdog: fsl-imx-wdt: add compatible string fsl,ls1021a-wdt
      dt-bindings: timer: Add fsl,vf610-pit.yaml

Geert Uytterhoeven (1):
      docs: dt: Update overlay file extension

Hugo Villeneuve (1):
      dt-bindings: display: bridge: renesas,dsi: allow properties from dsi-controller

J. Neuschäfer (1):
      dt-bindings: powerpc: Convert fsl/pmc.txt to YAML

Krzysztof Kozlowski (6):
      dt-bindings: writing-schema: Explain sub-nodes with additionalProperties:true
      dt-bindings: arm: psci: change labels to lower-case in example
      psci: MAINTAINERS: Include DT binding in the entry
      media: dt-bindings: renesas,fcp: add top-level constraints
      media: dt-bindings: renesas,vsp1: add top-level constraints
      dt-bindings: soundwire: qcom: Document v2.1.0 version of IP block

Lad Prabhakar (1):
      dt-bindings: gpu: mali-bifrost: Add compatible for RZ/V2N SoC

Luca Weiss (1):
      ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5 sound card

Neil Armstrong (1):
      dt-bindings: arm/cpus: allow up to 3 interconnects entries

Radhey Shyam Pandey (1):
      dt-bindings: usb: dwc3-xilinx: allow dma-coherent

Rob Herring (Arm) (56):
      dt-bindings: arm/cpus: Add schemas for "enable-method" dependencies
      dt-bindings: arm/cpus: Re-wrap 'description' entries
      dt-bindings: Reference opp-v1 schema in CPU schemas
      dt-bindings: arm/cpus: Add missing properties
      dt-bindings: arm/cpus: Add power-domains constraints
      dt-bindings: cpufreq: Drop redundant Mediatek binding
      dt-bindings: Remove obsolete cpu-topology.txt
      dt-bindings: Remove obsolete numa.txt
      dt-bindings: virtio: pci-iommu: Add ref to pci-device.yaml
      of: reserved_mem: Add functions to parse "memory-region"
      of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
      devres: Export devm_ioremap_resource_wc()
      dt-bindings: Move altr,msi-controller to interrupt-controller directory
      dt-bindings: interrupt-controller: Convert cnxt,cx92755-ic to DT schema
      dt-bindings: interrupt-controller: Convert brcm,bcm2835-armctrl-ic to DT schema
      dt-bindings: interrupt-controller: Convert marvell,orion-bridge-intc to DT schema
      dt-bindings: interrupt-controller: Convert arm,versatile-fpga-irq to DT schema
      dt-bindings: interrupt-controller: Convert faraday,ftintc010 to DT schema
      dt-bindings: interrupt-controller: Convert aspeed,ast2400-i2c-ic to DT schema
      dt-bindings: interrupt-controller: Convert aspeed,ast2xxx-scu-ic to DT schema
      dt-bindings: interrupt-controller: Convert ti,cp-intc to DT schema
      dt-bindings: interrupt-controller: Convert cdns,xtensa-{mx,pic} to DT schema
      dt-bindings: interrupt-controller: Convert chrp,open-pic to DT schema
      dt-bindings: interrupt-controller: Convert microchip,pic32mzda-evic to DT schema
      dt-bindings: interrupt-controller: Convert abilis,tb10x-ictl to DT schema
      dt-bindings: interrupt-controller: Convert al,alpine-msix to DT schema
      dt-bindings: interrupt-controller: Convert amazon,al-fic to DT schema
      dt-bindings: interrupt-controller: Convert arm,nvic to DT schema
      dt-bindings: interrupt-controller: Convert brcm,bcm6345-l1-intc to DT schema
      dt-bindings: interrupt-controller: Convert cirrus,ep7209-intc to DT schema
      dt-bindings: interrupt-controller: Convert csky,apb-intc to DT schema
      dt-bindings: interrupt-controller: Convert csky,mpintc to DT schema
      dt-bindings: interrupt-controller: Convert ezchip,nps400-ic to DT schema
      dt-bindings: interrupt-controller: Convert google,goldfish-pic to DT schema
      dt-bindings: interrupt-controller: Convert img,pdc-intc to DT schema
      dt-bindings: interrupt-controller: Convert jcore,aic to DT schema
      dt-bindings: interrupt-controller: Convert lsi,zevio-intc to DT schema
      dt-bindings: interrupt-controller: Convert marvell,armada-8k-pic to DT schema
      dt-bindings: interrupt-controller: Convert marvell,ap806-gicp to DT schema
      dt-bindings: interrupt-controller: Convert marvell,ap806-sei to DT schema
      dt-bindings: interrupt-controller: Convert marvell,cp110-icu to DT schema
      dt-bindings: interrupt-controller: Convert marvell,odmi-controller to DT schema
      dt-bindings: interrupt-controller: Convert qca,ar7100-cpu-intc to DT schema
      dt-bindings: interrupt-controller: Convert qca,ar7100-misc-intc to DT schema
      dt-bindings: interrupt-controller: Convert snps,arc700-intc to DT schema
      dt-bindings: interrupt-controller: Convert snps,archs-idu-intc to DT schema
      dt-bindings: interrupt-controller: Convert snps,archs-intc to DT schema
      dt-bindings: interrupt-controller: Convert snps,dw-apb-ictl to DT schema
      dt-bindings: interrupt-controller: Convert st,spear3xx-shirq to DT schema
      dt-bindings: interrupt-controller: Convert technologic,ts4800-irqc to DT schema
      dt-bindings: interrupt-controller: Convert ti,keystone-irq to DT schema
      dt-bindings: interrupt-controller: Convert ti,omap4-wugen-mpu to DT schema
      dt-bindings: interrupt-controller: Convert ti,omap-intc-irq to DT schema
      dt-bindings: soc: fsl,qman-fqd: Fix reserved-memory.yaml reference
      dt-bindings: pinctrl: amlogic,pinctrl-a4: Add missing constraint on allowed 'group' node properties
      dt-bindings: arm/cpus: Allow 2 power-domains entries

Rodrigo Gobbi (2):
      dt-bindings: trivial-devices: Add Maxim max30208
      dt-bindings: trivial-devices: Add VZ89TE to trivial

Tommaso Merciai (1):
      dt-bindings: gpu: mali-bifrost: Add compatible for RZ/G3E SoC

Wolfram Sang (1):
      dt-bindings: remove RZ/N1S bindings

 Documentation/devicetree/bindings/arm/cpus.yaml    | 234 +++++----
 .../bindings/arm/freescale/fsl,imx51-m4if.yaml     |  41 ++
 .../devicetree/bindings/arm/freescale/m4if.txt     |  12 -
 .../devicetree/bindings/arm/freescale/tigerp.txt   |  12 -
 Documentation/devicetree/bindings/arm/psci.yaml    |  30 +-
 .../bindings/counter/fsl,ftm-quaddec.yaml          |  36 ++
 .../devicetree/bindings/counter/ftm-quaddec.txt    |  18 -
 .../devicetree/bindings/cpu/cpu-topology.txt       | 553 ---------------------
 .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 ----------
 .../bindings/display/bridge/renesas,dsi.yaml       |  67 ++-
 .../devicetree/bindings/display/fsl,tcon.txt       |  17 -
 .../bindings/display/fsl,vf610-tcon.yaml           |  43 ++
 .../display/imx/fsl,imx-display-subsystem.yaml     |  36 ++
 .../display/imx/fsl,imx-parallel-display.yaml      |  74 +++
 .../bindings/display/imx/fsl,imx6q-ipu.yaml        |  97 ++++
 .../bindings/display/imx/fsl,imx6q-ldb.yaml        | 193 +++++++
 .../bindings/display/imx/fsl,imx6qp-pre.yaml       |  55 ++
 .../bindings/display/imx/fsl,imx6qp-prg.yaml       |  54 ++
 .../bindings/display/imx/fsl-imx-drm.txt           | 160 ------
 .../devicetree/bindings/display/imx/ldb.txt        | 146 ------
 .../bindings/display/rockchip/cdn-dp-rockchip.txt  |  74 ---
 .../display/rockchip/rockchip,rk3399-cdn-dp.yaml   | 170 +++++++
 .../devicetree/bindings/example-schema.yaml        |  15 +-
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |   4 +
 .../interrupt-controller/abilis,tb10x-ictl.txt     |  37 --
 .../interrupt-controller/abilis,tb10x-ictl.yaml    |  54 ++
 .../interrupt-controller/al,alpine-msix.txt        |  25 -
 .../interrupt-controller/al,alpine-msix.yaml       |  49 ++
 .../altr,msi-controller.yaml                       |   2 +-
 .../interrupt-controller/amazon,al-fic.txt         |  27 -
 .../interrupt-controller/amazon,al-fic.yaml        |  46 ++
 .../bindings/interrupt-controller/arm,nvic.txt     |  36 --
 .../bindings/interrupt-controller/arm,nvic.yaml    |  61 +++
 .../arm,versatile-fpga-irq.txt                     |  38 --
 .../arm,versatile-fpga-irq.yaml                    |  61 +++
 .../interrupt-controller/aspeed,ast2400-i2c-ic.txt |  25 -
 .../aspeed,ast2400-i2c-ic.yaml                     |  46 ++
 .../aspeed,ast2500-scu-ic.yaml                     |  48 ++
 .../interrupt-controller/aspeed,ast2xxx-scu-ic.txt |  23 -
 .../brcm,bcm2835-armctrl-ic.txt                    | 131 -----
 .../brcm,bcm2835-armctrl-ic.yaml                   | 162 ++++++
 .../interrupt-controller/brcm,bcm6345-l1-intc.txt  |  55 --
 .../interrupt-controller/brcm,bcm6345-l1-intc.yaml |  81 +++
 .../interrupt-controller/cdns,xtensa-mx.txt        |  18 -
 .../interrupt-controller/cdns,xtensa-pic.txt       |  25 -
 .../interrupt-controller/cdns,xtensa-pic.yaml      |  50 ++
 .../interrupt-controller/chrp,open-pic.yaml        |  63 +++
 .../interrupt-controller/cirrus,clps711x-intc.txt  |  41 --
 .../interrupt-controller/cirrus,ep7209-intc.yaml   |  71 +++
 .../interrupt-controller/cnxt,cx92755-ic.yaml      |  47 ++
 .../interrupt-controller/csky,apb-intc.txt         |  62 ---
 .../interrupt-controller/csky,apb-intc.yaml        |  54 ++
 .../bindings/interrupt-controller/csky,mpintc.txt  |  52 --
 .../bindings/interrupt-controller/csky,mpintc.yaml |  43 ++
 .../bindings/interrupt-controller/digicolor-ic.txt |  21 -
 .../interrupt-controller/ezchip,nps400-ic.txt      |  17 -
 .../interrupt-controller/ezchip,nps400-ic.yaml     |  34 ++
 .../interrupt-controller/faraday,ftintc010.txt     |  25 -
 .../interrupt-controller/faraday,ftintc010.yaml    |  51 ++
 .../bindings/interrupt-controller/fsl,tzic.yaml    |  48 ++
 .../interrupt-controller/google,goldfish-pic.txt   |  30 --
 .../interrupt-controller/google,goldfish-pic.yaml  |  47 ++
 .../bindings/interrupt-controller/img,pdc-intc.txt | 105 ----
 .../interrupt-controller/img,pdc-intc.yaml         |  79 +++
 .../bindings/interrupt-controller/jcore,aic.txt    |  26 -
 .../bindings/interrupt-controller/jcore,aic.yaml   |  43 ++
 .../interrupt-controller/lsi,zevio-intc.txt        |  18 -
 .../interrupt-controller/lsi,zevio-intc.yaml       |  43 ++
 .../interrupt-controller/marvell,ap806-gicp.yaml   |  50 ++
 .../interrupt-controller/marvell,ap806-sei.yaml    |  58 +++
 .../interrupt-controller/marvell,armada-8k-pic.txt |  25 -
 .../marvell,armada-8k-pic.yaml                     |  52 ++
 .../interrupt-controller/marvell,cp110-icu.yaml    |  98 ++++
 .../bindings/interrupt-controller/marvell,gicp.txt |  27 -
 .../bindings/interrupt-controller/marvell,icu.txt  | 112 -----
 .../marvell,odmi-controller.txt                    |  42 --
 .../marvell,odmi-controller.yaml                   |  54 ++
 .../marvell,orion-bridge-intc.yaml                 |  52 ++
 .../interrupt-controller/marvell,orion-intc.txt    |  48 --
 .../bindings/interrupt-controller/marvell,sei.txt  |  36 --
 .../interrupt-controller/microchip,pic32-evic.txt  |  67 ---
 .../microchip,pic32mzda-evic.yaml                  |  60 +++
 .../bindings/interrupt-controller/open-pic.txt     |  97 ----
 .../interrupt-controller/qca,ar7100-cpu-intc.yaml  |  61 +++
 .../interrupt-controller/qca,ar7100-misc-intc.yaml |  52 ++
 .../interrupt-controller/qca,ath79-cpu-intc.txt    |  44 --
 .../interrupt-controller/qca,ath79-misc-intc.txt   |  45 --
 .../interrupt-controller/snps,arc700-intc.txt      |  24 -
 .../interrupt-controller/snps,arc700-intc.yaml     |  42 ++
 .../interrupt-controller/snps,archs-idu-intc.txt   |  46 --
 .../interrupt-controller/snps,archs-idu-intc.yaml  |  48 ++
 .../interrupt-controller/snps,archs-intc.txt       |  22 -
 .../interrupt-controller/snps,archs-intc.yaml      |  48 ++
 .../interrupt-controller/snps,dw-apb-ictl.txt      |  43 --
 .../interrupt-controller/snps,dw-apb-ictl.yaml     |  64 +++
 .../interrupt-controller/st,spear300-shirq.yaml    |  67 +++
 .../interrupt-controller/st,spear3xx-shirq.txt     |  44 --
 .../technologic,ts4800-irqc.yaml                   |  49 ++
 .../interrupt-controller/technologic,ts4800.txt    |  14 -
 .../bindings/interrupt-controller/ti,cp-intc.txt   |  27 -
 .../bindings/interrupt-controller/ti,cp-intc.yaml  |  50 ++
 .../interrupt-controller/ti,keystone-irq.txt       |  36 --
 .../interrupt-controller/ti,keystone-irq.yaml      |  63 +++
 .../interrupt-controller/ti,omap-intc-irq.txt      |  28 --
 .../interrupt-controller/ti,omap-intc-irq.yaml     |  52 ++
 .../interrupt-controller/ti,omap2-intc.txt         |  27 -
 .../interrupt-controller/ti,omap4-wugen-mpu.txt    |  31 --
 .../interrupt-controller/ti,omap4-wugen-mpu.yaml   |  55 ++
 .../interrupt-controller/via,vt8500-intc.txt       |  16 -
 .../interrupt-controller/via,vt8500-intc.yaml      |  76 +++
 .../bindings/leds/backlight/ti,lp8864.yaml         |  80 +++
 .../devicetree/bindings/media/i2c/imx219.yaml      |   5 +-
 .../devicetree/bindings/media/renesas,fcp.yaml     |  25 +-
 .../devicetree/bindings/media/renesas,vsp1.yaml    |  24 +-
 .../bindings/mfd/aspeed,ast2x00-scu.yaml           |   9 +-
 Documentation/devicetree/bindings/mips/cpus.yaml   |   3 +-
 .../devicetree/bindings/net/can/nxp,sja1000.yaml   |   4 +-
 Documentation/devicetree/bindings/numa.txt         | 319 ------------
 Documentation/devicetree/bindings/opp/opp-v1.yaml  |  18 +-
 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |   1 +
 .../bindings/pinctrl/renesas,rzn1-pinctrl.yaml     |   4 +-
 .../devicetree/bindings/powerpc/fsl/pmc.txt        |  63 ---
 .../devicetree/bindings/powerpc/fsl/pmc.yaml       | 152 ++++++
 .../bindings/serial/snps-dw-apb-uart.yaml          |  12 +-
 .../devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml  |   4 +-
 .../devicetree/bindings/soc/qcom/qcom,saw2.yaml    |   3 +-
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   1 +
 .../bindings/soundwire/qcom,soundwire.yaml         |  19 +-
 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml   |   4 +-
 .../devicetree/bindings/timer/fsl,vf610-pit.yaml   |  54 ++
 .../devicetree/bindings/trivial-devices.yaml       |   4 +
 .../devicetree/bindings/usb/dwc3-xilinx.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 .../devicetree/bindings/virtio/pci-iommu.yaml      |  10 +-
 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  |   2 +
 .../devicetree/bindings/writing-schema.rst         |  11 +-
 Documentation/devicetree/overlay-notes.rst         |  12 +-
 .../zh_CN/devicetree/overlay-notes.rst             |  12 +-
 MAINTAINERS                                        |  18 +-
 drivers/of/device.c                                |  31 +-
 drivers/of/of_reserved_mem.c                       |  80 +++
 drivers/of/unittest.c                              |  10 +-
 include/linux/of_reserved_mem.h                    |  26 +
 lib/devres.c                                       |   1 +
 144 files changed, 4012 insertions(+), 3576 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,imx51-m4if.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/freescale/m4if.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/freescale/tigerp.txt
 create mode 100644 Documentation/devicetree/bindings/counter/fsl,ftm-quaddec.yaml
 delete mode 100644 Documentation/devicetree/bindings/counter/ftm-quaddec.txt
 delete mode 100644 Documentation/devicetree/bindings/cpu/cpu-topology.txt
 delete mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
 delete mode 100644 Documentation/devicetree/bindings/display/fsl,tcon.txt
 create mode 100644 Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-display-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-display.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6q-ipu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6qp-pre.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6qp-prg.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
 delete mode 100644 Documentation/devicetree/bindings/display/imx/ldb.txt
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/al,alpine-msix.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/al,alpine-msix.yaml
 rename Documentation/devicetree/bindings/{pci => interrupt-controller}/altr,msi-controller.yaml (94%)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/arm,nvic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2500-scu-ic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-mx.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/cirrus,clps711x-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/cirrus,ep7209-intc.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/faraday,ftintc010.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/faraday,ftintc010.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/img,pdc-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/img,pdc-intc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/jcore,aic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/jcore,aic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/lsi,zevio-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/lsi,zevio-intc.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,ap806-gicp.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,ap806-sei.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,cp110-icu.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,orion-bridge-intc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,orion-intc.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/microchip,pic32mzda-evic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/open-pic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-misc-intc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/qca,ath79-cpu-intc.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,arc700-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,arc700-intc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/st,spear300-shirq.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/st,spear3xx-shirq.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800-irqc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,cp-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,cp-intc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,omap-intc-irq.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,omap-intc-irq.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,omap2-intc.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
 delete mode 100644 Documentation/devicetree/bindings/numa.txt
 delete mode 100644 Documentation/devicetree/bindings/powerpc/fsl/pmc.txt
 create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
