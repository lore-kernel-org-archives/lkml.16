Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC941AAA1F
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 20:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748206433; cv=none; b=mwy975HKlob2fuSjjWeKmepYQ5OHVdoWx/2mLGfeXVRSUuWSXvXOZ25lzDTXm2juYrujmIcAEmqrFRxAiexGoz4per9bnrMLjxZdrQRVOzbbzY3nSbHXT3NqeiZEja05wzHHfA3K+ELRXbsNhZ4hRTAk7iyJOsXqtrfEjUHNh1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748206433; c=relaxed/simple;
	bh=VnfwoCW5pKIP3OcOHzve8C7t/yvnU+g/gPuX9CJ9zhI=;
	h=From:To:Cc:Subject:References:Message-ID:Content-Type:
	 MIME-Version:Date; b=nvUif/Q9+2eS1sFq8p518fSR2vdRW18lOzWhN/paa4lZr+bdfURm5hvn1aeHg4l55jJmvFWtAZ0htOj6/CSKFxOLVmHu4lASPYmO8jNCmSB378MZ/XkzoRu7UhlyHE4Q8mWGRa3Tou10QpaioaMbpUYQe0RznSr9vqQ11wcZPDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LrzTvqOX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1lAvR6BL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LrzTvqOX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1lAvR6BL"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748206421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=aGggXhmIZ7gMeBa7hg2fiY+EHINVPI8Uf6r6kMlUA6o=;
	b=LrzTvqOXw1vRjfWKUilns9UkJysoY886kW1kyESO/Yxbbh8GNldIx10hgoxhgWDYZFXo+R
	9tx75JdkaZJCWZx7pSb+EWnjvGJVDphNmGLU28W3lcqUg4GCXsgLkr7C1Tberm9Wtsv3Xs
	0PzqfqhzLIULiAPpMflyOIsXV9kRs9BiqrHjjK9doafVE/DoKM6pWVtM+G+wZK2j2/QLxq
	G2oXlUeoqlGLtdMOn3aTpNsd9yr7Px/5syi4RGNzPdRGQUxJb7TK8hmRKmH3W7NVzJ3xHB
	0nmZj8Y9nqMt9fxWx7lNM3q+Lr7KqXPNTg0uQp9efeZzznVvwno2jsrtLdxb2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748206421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=aGggXhmIZ7gMeBa7hg2fiY+EHINVPI8Uf6r6kMlUA6o=;
	b=1lAvR6BLo9aNEn/KlUY5kK15F/0Q2A6v0+ps/tIfE0KtulbWgDHOXVb4crFQLNnOFX5uBd
	EbFH/9xBCk7BmICg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] irq/cleanups for v6.16-rc1
References: <174820637262.238682.1985899398053030312.tglx@xen13>
Message-ID: <174820637636.238682.4962254861955790452.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 May 2025 22:53:40 +0200 (CEST)

Linus,

please pull the latest irq/cleanups branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-cleanups-202=
5-05-25

up to:  38c1e73fdeb3: irqdomain: Consolidate coding style


A set of cleanups for the generic interrupt subsystem:

  - Consolidate on one set of functions for the interrupt domain code to
    get rid of pointlessly duplicated code with only marginal different
    semantics.

  - Update the documentation accordingly and consolidate the coding style
    of the irqdomain header.

Note: This pulls in a commit (branch) from the PCI tree and the first
      commit or the tip irq/core branch (which already has been sent to
      you) to avoid merge conflicts.

Thanks,

	tglx

------------------>
Jiri Slaby (SUSE) (45):
      irqdomain: pci: Switch to of_fwnode_handle()
      irqchip: Switch to of_fwnode_handle()
      powerpc: Switch to of_fwnode_handle()
      x86/io_apic: Switch to of_fwnode_handle()
      irqdomain: Drop of_node_to_fwnode()
      irqdomain: Make irq_domain_create_hierarchy() an inline
      ARC: Switch to irq_domain_create_linear()
      ARM: Switch to irq_domain_create_*()
      bus: moxtet: Switch to irq_domain_create_simple()
      EDAC/altera: Switch to irq_domain_create_linear()
      gpio: Switch to irq_domain_create_*()
      gpu: Switch to irq_domain_create_linear()
      i2c: Switch to irq_domain_create_linear()
      iio: Switch to irq_domain_create_simple()
      irqchip: Switch to irq_domain_create_*()
      mailbox: qcom-ipcc: Switch to irq_domain_create_tree()
      memory: omap-gpmc: Switch to irq_domain_create_linear()
      mfd: Switch to irq_domain_create_*()
      MIPS: Switch to irq_domain_create_*()
      misc: hi6421-spmi-pmic: Switch to irq_domain_create_simple()
      net: Switch to irq_domain_create_*()
      nios2: Switch to irq_domain_create_linear()
      PCI: Switch to irq_domain_create_linear()
      pinctrl: Switch to irq_domain_create_*()
      powerpc: Switch to irq_domain_create_*()
      sh: Switch to irq_domain_create_*()
      soc: Switch to irq_domain_create_*()
      thermal: Switch to irq_domain_create_linear()
      powerpc: Switch irq_domain_add_nomap() to use fwnode
      irqdomain: Drop irq_domain_add_*() functions
      powerpc: Switch to irq_find_mapping()
      sh: Switch to irq_find_mapping()
      gpio: idt3243x: Switch to irq_find_mapping()
      gpu: ipu-v3: Switch to irq_find_mapping()
      irqchip/armada-370-xp: Switch to irq_find_mapping()
      pinctrl: keembay: Switch to irq_find_mapping()
      irqdomain: Drop irq_linear_revmap()
      irqdomain: Use irq_domain_instantiate()'s return value as initializers
      irqdomain: Make struct irq_domain_info variables const
      irqdomain: Improve kernel-docs of functions
      Documentation: irq/concepts: Add commas and reflow
      Documentation: irq/concepts: Minor improvements
      Documentation: irq-domain.rst: Simple improvements
      Documentation: irqdomain: Update it
      irqdomain: Fix kernel-doc and add it to Documentation

Thomas Gleixner (1):
      irqdomain: Consolidate coding style

Yixun Lan (1):
      irqdomain: Support three-cell scheme interrupts


 Documentation/core-api/genericirq.rst              |   2 -
 Documentation/core-api/irq/concepts.rst            |  27 +-
 Documentation/core-api/irq/irq-domain.rst          | 203 +++++----
 .../translations/zh_CN/core-api/irq/irq-domain.rst |   8 +-
 arch/arc/kernel/intc-arcv2.c                       |   2 +-
 arch/arc/kernel/intc-compact.c                     |   5 +-
 arch/arc/kernel/mcip.c                             |   3 +-
 arch/arm/common/sa1111.c                           |   6 +-
 arch/arm/mach-exynos/suspend.c                     |   5 +-
 arch/arm/mach-imx/avic.c                           |   4 +-
 arch/arm/mach-imx/gpc.c                            |   5 +-
 arch/arm/mach-imx/tzic.c                           |   4 +-
 arch/arm/mach-omap1/irq.c                          |   3 +-
 arch/arm/mach-omap2/omap-wakeupgen.c               |   5 +-
 arch/arm/mach-pxa/irq.c                            |   5 +-
 arch/arm/plat-orion/gpio.c                         |  12 +-
 arch/mips/ath25/ar2315.c                           |   4 +-
 arch/mips/ath25/ar5312.c                           |   4 +-
 arch/mips/cavium-octeon/octeon-irq.c               |  25 +-
 arch/mips/lantiq/irq.c                             |   2 +-
 arch/mips/pci/pci-ar2315.c                         |   4 +-
 arch/mips/pci/pci-rt3883.c                         |   7 +-
 arch/mips/ralink/irq.c                             |   2 +-
 arch/nios2/kernel/irq.c                            |   3 +-
 arch/powerpc/platforms/44x/uic.c                   |   7 +-
 arch/powerpc/platforms/512x/mpc5121_ads_cpld.c     |   3 +-
 arch/powerpc/platforms/52xx/media5200.c            |   2 +-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c          |   6 +-
 arch/powerpc/platforms/52xx/mpc52xx_pic.c          |   4 +-
 arch/powerpc/platforms/85xx/socrates_fpga_pic.c    |   4 +-
 arch/powerpc/platforms/8xx/cpm1-ic.c               |   5 +-
 arch/powerpc/platforms/8xx/pic.c                   |   5 +-
 arch/powerpc/platforms/embedded6xx/flipper-pic.c   |   7 +-
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c      |   7 +-
 arch/powerpc/platforms/powermac/pic.c              |   7 +-
 arch/powerpc/platforms/powermac/smp.c              |   2 +-
 arch/powerpc/platforms/powernv/opal-irqchip.c      |   3 +-
 arch/powerpc/platforms/powernv/pci-ioda.c          |   2 +-
 arch/powerpc/platforms/ps3/interrupt.c             |   2 +-
 arch/powerpc/platforms/pseries/msi.c               |   2 +-
 arch/powerpc/sysdev/cpm2_pic.c                     |   5 +-
 arch/powerpc/sysdev/ehv_pic.c                      |   7 +-
 arch/powerpc/sysdev/fsl_msi.c                      |   2 +-
 arch/powerpc/sysdev/ge/ge_pic.c                    |   7 +-
 arch/powerpc/sysdev/i8259.c                        |   4 +-
 arch/powerpc/sysdev/ipic.c                         |   7 +-
 arch/powerpc/sysdev/mpic.c                         |  10 +-
 arch/powerpc/sysdev/tsi108_pci.c                   |   4 +-
 arch/powerpc/sysdev/xive/common.c                  |   2 +-
 arch/sh/boards/mach-se/7343/irq.c                  |   7 +-
 arch/sh/boards/mach-se/7722/irq.c                  |   4 +-
 arch/sh/boards/mach-x3proto/gpio.c                 |   2 +-
 arch/x86/kernel/apic/io_apic.c                     |   2 +-
 drivers/bus/moxtet.c                               |   6 +-
 drivers/edac/altera_edac.c                         |   4 +-
 drivers/gpio/gpio-brcmstb.c                        |   2 +-
 drivers/gpio/gpio-davinci.c                        |   5 +-
 drivers/gpio/gpio-em.c                             |   5 +-
 drivers/gpio/gpio-grgpio.c                         |   2 +-
 drivers/gpio/gpio-idt3243x.c                       |   2 +-
 drivers/gpio/gpio-lpc18xx.c                        |   8 +-
 drivers/gpio/gpio-mvebu.c                          |   2 +-
 drivers/gpio/gpio-mxc.c                            |   2 +-
 drivers/gpio/gpio-mxs.c                            |   4 +-
 drivers/gpio/gpio-pxa.c                            |   6 +-
 drivers/gpio/gpio-rockchip.c                       |   2 +-
 drivers/gpio/gpio-sa1100.c                         |   2 +-
 drivers/gpio/gpio-sodaville.c                      |   2 +-
 drivers/gpio/gpio-tb10x.c                          |   2 +-
 drivers/gpio/gpio-twl4030.c                        |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   4 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   2 +-
 drivers/gpu/ipu-v3/ipu-common.c                    |   8 +-
 drivers/i2c/busses/i2c-cht-wc.c                    |   2 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c                |   6 +-
 drivers/iio/adc/stm32-adc-core.c                   |   7 +-
 drivers/irqchip/exynos-combiner.c                  |   2 +-
 drivers/irqchip/irq-al-fic.c                       |   2 +-
 drivers/irqchip/irq-alpine-msi.c                   |   7 +-
 drivers/irqchip/irq-apple-aic.c                    |   4 +-
 drivers/irqchip/irq-armada-370-xp.c                |  12 +-
 drivers/irqchip/irq-aspeed-i2c-ic.c                |   2 +-
 drivers/irqchip/irq-aspeed-intc.c                  |   2 +-
 drivers/irqchip/irq-aspeed-scu-ic.c                |   2 +-
 drivers/irqchip/irq-aspeed-vic.c                   |   4 +-
 drivers/irqchip/irq-ath79-misc.c                   |   4 +-
 drivers/irqchip/irq-atmel-aic-common.c             |   2 +-
 drivers/irqchip/irq-bcm2712-mip.c                  |   4 +-
 drivers/irqchip/irq-bcm2835.c                      |   2 +-
 drivers/irqchip/irq-bcm2836.c                      |   2 +-
 drivers/irqchip/irq-bcm6345-l1.c                   |   2 +-
 drivers/irqchip/irq-bcm7038-l1.c                   |   2 +-
 drivers/irqchip/irq-bcm7120-l2.c                   |   2 +-
 drivers/irqchip/irq-brcmstb-l2.c                   |   2 +-
 drivers/irqchip/irq-clps711x.c                     |   4 +-
 drivers/irqchip/irq-crossbar.c                     |   6 +-
 drivers/irqchip/irq-csky-apb-intc.c                |   2 +-
 drivers/irqchip/irq-csky-mpintc.c                  |   2 +-
 drivers/irqchip/irq-davinci-cp-intc.c              |   6 +-
 drivers/irqchip/irq-digicolor.c                    |   2 +-
 drivers/irqchip/irq-dw-apb-ictl.c                  |   2 +-
 drivers/irqchip/irq-ftintc010.c                    |   5 +-
 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c        |   2 +-
 drivers/irqchip/irq-gic-v3.c                       |   4 +-
 drivers/irqchip/irq-goldfish-pic.c                 |   7 +-
 drivers/irqchip/irq-hip04.c                        |   6 +-
 drivers/irqchip/irq-i8259.c                        |   4 +-
 drivers/irqchip/irq-idt3243x.c                     |   2 +-
 drivers/irqchip/irq-imgpdc.c                       |   2 +-
 drivers/irqchip/irq-imx-gpcv2.c                    |   4 +-
 drivers/irqchip/irq-imx-intmux.c                   |   2 +-
 drivers/irqchip/irq-imx-irqsteer.c                 |   2 +-
 drivers/irqchip/irq-ingenic-tcu.c                  |   4 +-
 drivers/irqchip/irq-ingenic.c                      |   4 +-
 drivers/irqchip/irq-ixp4xx.c                       |   2 +-
 drivers/irqchip/irq-jcore-aic.c                    |   5 +-
 drivers/irqchip/irq-keystone.c                     |   4 +-
 drivers/irqchip/irq-lan966x-oic.c                  |   2 +-
 drivers/irqchip/irq-loongarch-cpu.c                |   2 +-
 drivers/irqchip/irq-loongson-eiointc.c             |   2 +-
 drivers/irqchip/irq-loongson-htvec.c               |   2 +-
 drivers/irqchip/irq-loongson-liointc.c             |   2 +-
 drivers/irqchip/irq-loongson-pch-msi.c             |   2 +-
 drivers/irqchip/irq-loongson-pch-pic.c             |   2 +-
 drivers/irqchip/irq-lpc32xx.c                      |   4 +-
 drivers/irqchip/irq-ls-extirq.c                    |   4 +-
 drivers/irqchip/irq-ls-scfg-msi.c                  |  10 +-
 drivers/irqchip/irq-ls1x.c                         |   4 +-
 drivers/irqchip/irq-mchp-eic.c                     |   5 +-
 drivers/irqchip/irq-meson-gpio.c                   |   2 +-
 drivers/irqchip/irq-mips-cpu.c                     |  13 +-
 drivers/irqchip/irq-mips-gic.c                     |  15 +-
 drivers/irqchip/irq-mmp.c                          |  12 +-
 drivers/irqchip/irq-mscc-ocelot.c                  |   4 +-
 drivers/irqchip/irq-mst-intc.c                     |   4 +-
 drivers/irqchip/irq-mtk-cirq.c                     |   5 +-
 drivers/irqchip/irq-mtk-sysirq.c                   |   4 +-
 drivers/irqchip/irq-mvebu-pic.c                    |   4 +-
 drivers/irqchip/irq-mxs.c                          |   4 +-
 drivers/irqchip/irq-nvic.c                         |   2 +-
 drivers/irqchip/irq-omap-intc.c                    |   4 +-
 drivers/irqchip/irq-or1k-pic.c                     |   4 +-
 drivers/irqchip/irq-orion.c                        |   6 +-
 drivers/irqchip/irq-owl-sirq.c                     |   4 +-
 drivers/irqchip/irq-pic32-evic.c                   |   6 +-
 drivers/irqchip/irq-pruss-intc.c                   |   4 +-
 drivers/irqchip/irq-qcom-mpm.c                     |   2 +-
 drivers/irqchip/irq-realtek-rtl.c                  |   2 +-
 drivers/irqchip/irq-renesas-intc-irqpin.c          |   6 +-
 drivers/irqchip/irq-renesas-irqc.c                 |   4 +-
 drivers/irqchip/irq-renesas-rza1.c                 |   6 +-
 drivers/irqchip/irq-renesas-rzg2l.c                |   6 +-
 drivers/irqchip/irq-renesas-rzv2h.c                |   5 +-
 drivers/irqchip/irq-riscv-intc.c                   |   2 +-
 drivers/irqchip/irq-sa11x0.c                       |   2 +-
 drivers/irqchip/irq-sni-exiu.c                     |   6 +-
 drivers/irqchip/irq-sp7021-intc.c                  |   4 +-
 drivers/irqchip/irq-starfive-jh8100-intc.c         |   4 +-
 drivers/irqchip/irq-stm32-exti.c                   |   4 +-
 drivers/irqchip/irq-stm32mp-exti.c                 |   9 +-
 drivers/irqchip/irq-sun4i.c                        |   2 +-
 drivers/irqchip/irq-sun6i-r.c                      |   4 +-
 drivers/irqchip/irq-sunxi-nmi.c                    |   2 +-
 drivers/irqchip/irq-tb10x.c                        |   8 +-
 drivers/irqchip/irq-tegra.c                        |   5 +-
 drivers/irqchip/irq-ti-sci-inta.c                  |  10 +-
 drivers/irqchip/irq-ti-sci-intr.c                  |   7 +-
 drivers/irqchip/irq-ts4800.c                       |   2 +-
 drivers/irqchip/irq-uniphier-aidet.c               |   2 +-
 drivers/irqchip/irq-versatile-fpga.c               |   4 +-
 drivers/irqchip/irq-vf610-mscm-ir.c                |   6 +-
 drivers/irqchip/irq-vic.c                          |   5 +-
 drivers/irqchip/irq-wpcm450-aic.c                  |   2 +-
 drivers/irqchip/irq-xilinx-intc.c                  |   4 +-
 drivers/irqchip/irq-xtensa-mx.c                    |   5 +-
 drivers/irqchip/irq-xtensa-pic.c                   |   4 +-
 drivers/irqchip/irq-zevio.c                        |   4 +-
 drivers/irqchip/spear-shirq.c                      |   2 +-
 drivers/mailbox/qcom-ipcc.c                        |   4 +-
 drivers/memory/omap-gpmc.c                         |   6 +-
 drivers/mfd/88pm860x-core.c                        |   4 +-
 drivers/mfd/ab8500-core.c                          |   6 +-
 drivers/mfd/arizona-irq.c                          |   3 +-
 drivers/mfd/db8500-prcmu.c                         |   6 +-
 drivers/mfd/fsl-imx25-tsadc.c                      |   5 +-
 drivers/mfd/lp8788-irq.c                           |   2 +-
 drivers/mfd/max8925-core.c                         |   4 +-
 drivers/mfd/max8997-irq.c                          |   4 +-
 drivers/mfd/max8998-irq.c                          |   2 +-
 drivers/mfd/mt6358-irq.c                           |   6 +-
 drivers/mfd/mt6397-irq.c                           |   6 +-
 drivers/mfd/qcom-pm8xxx.c                          |   6 +-
 drivers/mfd/stmfx.c                                |   2 +-
 drivers/mfd/stmpe.c                                |   4 +-
 drivers/mfd/tc3589x.c                              |   6 +-
 drivers/mfd/tps65217.c                             |   2 +-
 drivers/mfd/tps6586x.c                             |   2 +-
 drivers/mfd/twl4030-irq.c                          |   4 +-
 drivers/mfd/twl6030-irq.c                          |   5 +-
 drivers/mfd/wm831x-irq.c                           |  15 +-
 drivers/mfd/wm8994-irq.c                           |   4 +-
 drivers/misc/hi6421v600-irq.c                      |   5 +-
 drivers/net/dsa/microchip/ksz_common.c             |   5 +-
 drivers/net/dsa/microchip/ksz_ptp.c                |   4 +-
 drivers/net/dsa/mv88e6xxx/chip.c                   |   2 +-
 drivers/net/dsa/mv88e6xxx/global2.c                |   6 +-
 drivers/net/dsa/qca/ar9331.c                       |   4 +-
 drivers/net/dsa/realtek/rtl8365mb.c                |   4 +-
 drivers/net/dsa/realtek/rtl8366rb.c                |   6 +-
 drivers/net/ethernet/wangxun/txgbe/txgbe_irq.c     |   4 +-
 drivers/net/usb/lan78xx.c                          |   9 +-
 drivers/pci/controller/dwc/pci-dra7xx.c            |   4 +-
 drivers/pci/controller/dwc/pci-keystone.c          |   2 +-
 drivers/pci/controller/dwc/pcie-amd-mdb.c          |   8 +-
 drivers/pci/controller/dwc/pcie-designware-host.c  |   2 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c      |   4 +-
 drivers/pci/controller/dwc/pcie-uniphier.c         |   2 +-
 .../pci/controller/mobiveil/pcie-mobiveil-host.c   |  11 +-
 drivers/pci/controller/pci-aardvark.c              |  14 +-
 drivers/pci/controller/pci-ftpci100.c              |   4 +-
 drivers/pci/controller/pci-mvebu.c                 |   6 +-
 drivers/pci/controller/pci-xgene-msi.c             |   2 +-
 drivers/pci/controller/pcie-altera-msi.c           |   4 +-
 drivers/pci/controller/pcie-altera.c               |   2 +-
 drivers/pci/controller/pcie-brcmstb.c              |   4 +-
 drivers/pci/controller/pcie-iproc-msi.c            |   6 +-
 drivers/pci/controller/pcie-mediatek-gen3.c        |   9 +-
 drivers/pci/controller/pcie-mediatek.c             |   6 +-
 drivers/pci/controller/pcie-rockchip-host.c        |   4 +-
 drivers/pci/controller/pcie-xilinx-cpm.c           |  10 +-
 drivers/pci/controller/pcie-xilinx-dma-pl.c        |  14 +-
 drivers/pci/controller/pcie-xilinx-nwl.c           |  11 +-
 drivers/pci/controller/pcie-xilinx.c               |   5 +-
 drivers/pci/controller/plda/pcie-plda-host.c       |  16 +-
 drivers/pinctrl/mediatek/mtk-eint.c                |   5 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |   2 +-
 drivers/pinctrl/pinctrl-keembay.c                  |   2 +-
 drivers/pinctrl/pinctrl-single.c                   |   9 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   7 +-
 drivers/sh/intc/irqdomain.c                        |   5 +-
 drivers/soc/dove/pmu.c                             |   4 +-
 drivers/soc/fsl/qe/qe_ic.c                         |   4 +-
 drivers/soc/qcom/smp2p.c                           |   2 +-
 drivers/soc/qcom/smsm.c                            |   2 +-
 drivers/soc/tegra/pmc.c                            |   5 +-
 drivers/thermal/qcom/lmh.c                         |   3 +-
 drivers/thermal/tegra/soctherm.c                   |   2 +-
 include/linux/gpio/driver.h                        |   5 +-
 include/linux/irqdomain.h                          | 490 ++++++++++---------=
--
 kernel/irq/irqdomain.c                             | 130 +++---
 250 files changed, 968 insertions(+), 1007 deletions(-)

diff --git a/Documentation/core-api/genericirq.rst b/Documentation/core-api/g=
enericirq.rst
index 25f94dfd66fa..582bde9bf5a9 100644
--- a/Documentation/core-api/genericirq.rst
+++ b/Documentation/core-api/genericirq.rst
@@ -410,8 +410,6 @@ which are used in the generic IRQ layer.
 .. kernel-doc:: include/linux/interrupt.h
    :internal:
=20
-.. kernel-doc:: include/linux/irqdomain.h
-
 Public Functions Provided
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
diff --git a/Documentation/core-api/irq/concepts.rst b/Documentation/core-api=
/irq/concepts.rst
index 4273806a606b..7c4564f3cbdf 100644
--- a/Documentation/core-api/irq/concepts.rst
+++ b/Documentation/core-api/irq/concepts.rst
@@ -2,23 +2,24 @@
 What is an IRQ?
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-An IRQ is an interrupt request from a device.
-Currently they can come in over a pin, or over a packet.
-Several devices may be connected to the same pin thus
-sharing an IRQ.
+An IRQ is an interrupt request from a device. Currently, they can come
+in over a pin, or over a packet. Several devices may be connected to
+the same pin thus sharing an IRQ. Such as on legacy PCI bus: All devices
+typically share 4 lanes/pins. Note that each device can request an
+interrupt on each of the lanes.
=20
 An IRQ number is a kernel identifier used to talk about a hardware
-interrupt source.  Typically this is an index into the global irq_desc
-array, but except for what linux/interrupt.h implements the details
-are architecture specific.
+interrupt source. Typically, this is an index into the global irq_desc
+array or sparse_irqs tree. But except for what linux/interrupt.h
+implements, the details are architecture specific.
=20
 An IRQ number is an enumeration of the possible interrupt sources on a
-machine.  Typically what is enumerated is the number of input pins on
-all of the interrupt controller in the system.  In the case of ISA
-what is enumerated are the 16 input pins on the two i8259 interrupt
-controllers.
+machine. Typically, what is enumerated is the number of input pins on
+all of the interrupt controllers in the system. In the case of ISA,
+what is enumerated are the 8 input pins on each of the two i8259
+interrupt controllers.
=20
 Architectures can assign additional meaning to the IRQ numbers, and
-are encouraged to in the case  where there is any manual configuration
-of the hardware involved.  The ISA IRQs are a classic example of
+are encouraged to in the case where there is any manual configuration
+of the hardware involved. The ISA IRQs are a classic example of
 assigning this kind of additional meaning.
diff --git a/Documentation/core-api/irq/irq-domain.rst b/Documentation/core-a=
pi/irq/irq-domain.rst
index f88a6ee67a35..a01c6ead1bc0 100644
--- a/Documentation/core-api/irq/irq-domain.rst
+++ b/Documentation/core-api/irq/irq-domain.rst
@@ -1,59 +1,77 @@
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-The irq_domain interrupt number mapping library
+The irq_domain Interrupt Number Mapping Library
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 The current design of the Linux kernel uses a single large number
-space where each separate IRQ source is assigned a different number.
-This is simple when there is only one interrupt controller, but in
-systems with multiple interrupt controllers the kernel must ensure
+space where each separate IRQ source is assigned a unique number.
+This is simple when there is only one interrupt controller. But in
+systems with multiple interrupt controllers, the kernel must ensure
 that each one gets assigned non-overlapping allocations of Linux
 IRQ numbers.
=20
 The number of interrupt controllers registered as unique irqchips
-show a rising tendency: for example subdrivers of different kinds
+shows a rising tendency. For example, subdrivers of different kinds
 such as GPIO controllers avoid reimplementing identical callback
 mechanisms as the IRQ core system by modelling their interrupt
-handlers as irqchips, i.e. in effect cascading interrupt controllers.
+handlers as irqchips. I.e. in effect cascading interrupt controllers.
=20
-Here the interrupt number loose all kind of correspondence to
-hardware interrupt numbers: whereas in the past, IRQ numbers could
-be chosen so they matched the hardware IRQ line into the root
-interrupt controller (i.e. the component actually fireing the
-interrupt line to the CPU) nowadays this number is just a number.
+So in the past, IRQ numbers could be chosen so that they match the
+hardware IRQ line into the root interrupt controller (i.e. the
+component actually firing the interrupt line to the CPU). Nowadays,
+this number is just a number and the number loose all kind of
+correspondence to hardware interrupt numbers.
=20
-For this reason we need a mechanism to separate controller-local
-interrupt numbers, called hardware irq's, from Linux IRQ numbers.
+For this reason, we need a mechanism to separate controller-local
+interrupt numbers, called hardware IRQs, from Linux IRQ numbers.
=20
 The irq_alloc_desc*() and irq_free_desc*() APIs provide allocation of
-irq numbers, but they don't provide any support for reverse mapping of
+IRQ numbers, but they don't provide any support for reverse mapping of
 the controller-local IRQ (hwirq) number into the Linux IRQ number
 space.
=20
-The irq_domain library adds mapping between hwirq and IRQ numbers on
-top of the irq_alloc_desc*() API.  An irq_domain to manage mapping is
-preferred over interrupt controller drivers open coding their own
+The irq_domain library adds a mapping between hwirq and IRQ numbers on
+top of the irq_alloc_desc*() API. An irq_domain to manage the mapping
+is preferred over interrupt controller drivers open coding their own
 reverse mapping scheme.
=20
-irq_domain also implements translation from an abstract irq_fwspec
-structure to hwirq numbers (Device Tree and ACPI GSI so far), and can
-be easily extended to support other IRQ topology data sources.
+irq_domain also implements a translation from an abstract struct
+irq_fwspec to hwirq numbers (Device Tree, non-DT firmware node, ACPI
+GSI, and software node so far), and can be easily extended to support
+other IRQ topology data sources. The implementation is performed
+without any extra platform support code.
=20
-irq_domain usage
+irq_domain Usage
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-An interrupt controller driver creates and registers an irq_domain by
-calling one of the irq_domain_add_*() or irq_domain_create_*() functions
-(each mapping method has a different allocator function, more on that later).
-The function will return a pointer to the irq_domain on success. The caller
-must provide the allocator function with an irq_domain_ops structure.
+struct irq_domain could be defined as an irq domain controller. That
+is, it handles the mapping between hardware and virtual interrupt
+numbers for a given interrupt domain. The domain structure is
+generally created by the PIC code for a given PIC instance (though a
+domain can cover more than one PIC if they have a flat number model).
+It is the domain callbacks that are responsible for setting the
+irq_chip on a given irq_desc after it has been mapped.
+
+The host code and data structures use a fwnode_handle pointer to
+identify the domain. In some cases, and in order to preserve source
+code compatibility, this fwnode pointer is "upgraded" to a DT
+device_node. For those firmware infrastructures that do not provide a
+unique identifier for an interrupt controller, the irq_domain code
+offers a fwnode allocator.
+
+An interrupt controller driver creates and registers a struct irq_domain
+by calling one of the irq_domain_create_*() functions (each mapping
+method has a different allocator function, more on that later). The
+function will return a pointer to the struct irq_domain on success. The
+caller must provide the allocator function with a struct irq_domain_ops
+pointer.
=20
 In most cases, the irq_domain will begin empty without any mappings
 between hwirq and IRQ numbers.  Mappings are added to the irq_domain
 by calling irq_create_mapping() which accepts the irq_domain and a
-hwirq number as arguments.  If a mapping for the hwirq doesn't already
-exist then it will allocate a new Linux irq_desc, associate it with
-the hwirq, and call the .map() callback so the driver can perform any
-required hardware setup.
+hwirq number as arguments. If a mapping for the hwirq doesn't already
+exist, irq_create_mapping() allocates a new Linux irq_desc, associates
+it with the hwirq, and calls the :c:member:`irq_domain_ops.map()`
+callback. In there, the driver can perform any required hardware
+setup.
=20
 Once a mapping has been established, it can be retrieved or used via a
 variety of methods:
@@ -63,8 +81,6 @@ variety of methods:
   mapping.
 - irq_find_mapping() returns a Linux IRQ number for a given domain and
   hwirq number, and 0 if there was no mapping
-- irq_linear_revmap() is now identical to irq_find_mapping(), and is
-  deprecated
 - generic_handle_domain_irq() handles an interrupt described by a
   domain and a hwirq number
=20
@@ -77,9 +93,10 @@ be allocated.
=20
 If the driver has the Linux IRQ number or the irq_data pointer, and
 needs to know the associated hwirq number (such as in the irq_chip
-callbacks) then it can be directly obtained from irq_data->hwirq.
+callbacks) then it can be directly obtained from
+:c:member:`irq_data.hwirq`.
=20
-Types of irq_domain mappings
+Types of irq_domain Mappings
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
=20
 There are several mechanisms available for reverse mapping from hwirq
@@ -92,7 +109,6 @@ Linear
=20
 ::
=20
-	irq_domain_add_linear()
 	irq_domain_create_linear()
=20
 The linear reverse map maintains a fixed size table indexed by the
@@ -105,19 +121,13 @@ map are fixed time lookup for IRQ numbers, and irq_desc=
s are only
 allocated for in-use IRQs.  The disadvantage is that the table must be
 as large as the largest possible hwirq number.
=20
-irq_domain_add_linear() and irq_domain_create_linear() are functionally
-equivalent, except for the first argument is different - the former
-accepts an Open Firmware specific 'struct device_node', while the latter
-accepts a more general abstraction 'struct fwnode_handle'.
-
-The majority of drivers should use the linear map.
+The majority of drivers should use the Linear map.
=20
 Tree
 ----
=20
 ::
=20
-	irq_domain_add_tree()
 	irq_domain_create_tree()
=20
 The irq_domain maintains a radix tree map from hwirq numbers to Linux
@@ -129,11 +139,6 @@ since it doesn't need to allocate a table as large as th=
e largest
 hwirq number.  The disadvantage is that hwirq to IRQ number lookup is
 dependent on how many entries are in the table.
=20
-irq_domain_add_tree() and irq_domain_create_tree() are functionally
-equivalent, except for the first argument is different - the former
-accepts an Open Firmware specific 'struct device_node', while the latter
-accepts a more general abstraction 'struct fwnode_handle'.
-
 Very few drivers should need this mapping.
=20
 No Map
@@ -141,7 +146,7 @@ No Map
=20
 ::
=20
-	irq_domain_add_nomap()
+	irq_domain_create_nomap()
=20
 The No Map mapping is to be used when the hwirq number is
 programmable in the hardware.  In this case it is best to program the
@@ -159,8 +164,6 @@ Legacy
=20
 ::
=20
-	irq_domain_add_simple()
-	irq_domain_add_legacy()
 	irq_domain_create_simple()
 	irq_domain_create_legacy()
=20
@@ -189,13 +192,13 @@ supported.  For example, ISA controllers would use the =
legacy map for
 mapping Linux IRQs 0-15 so that existing ISA drivers get the correct IRQ
 numbers.
=20
-Most users of legacy mappings should use irq_domain_add_simple() or
-irq_domain_create_simple() which will use a legacy domain only if an IRQ ran=
ge
-is supplied by the system and will otherwise use a linear domain mapping.
-The semantics of this call are such that if an IRQ range is specified then
-descriptors will be allocated on-the-fly for it, and if no range is
-specified it will fall through to irq_domain_add_linear() or
-irq_domain_create_linear() which means *no* irq descriptors will be allocate=
d.
+Most users of legacy mappings should use irq_domain_create_simple()
+which will use a legacy domain only if an IRQ range is supplied by the
+system and will otherwise use a linear domain mapping. The semantics of
+this call are such that if an IRQ range is specified then descriptors
+will be allocated on-the-fly for it, and if no range is specified it
+will fall through to irq_domain_create_linear() which means *no* irq
+descriptors will be allocated.
=20
 A typical use case for simple domains is where an irqchip provider
 is supporting both dynamic and static IRQ assignments.
@@ -206,13 +209,7 @@ that the driver using the simple domain call irq_create_=
mapping()
 before any irq_find_mapping() since the latter will actually work
 for the static IRQ assignment case.
=20
-irq_domain_add_simple() and irq_domain_create_simple() as well as
-irq_domain_add_legacy() and irq_domain_create_legacy() are functionally
-equivalent, except for the first argument is different - the former
-accepts an Open Firmware specific 'struct device_node', while the latter
-accepts a more general abstraction 'struct fwnode_handle'.
-
-Hierarchy IRQ domain
+Hierarchy IRQ Domain
 --------------------
=20
 On some architectures, there may be multiple interrupt controllers
@@ -253,20 +250,40 @@ There are four major interfaces to use hierarchy irq_do=
main:
 4) irq_domain_deactivate_irq(): deactivate interrupt controller hardware
    to stop delivering the interrupt.
=20
-Following changes are needed to support hierarchy irq_domain:
+The following is needed to support hierarchy irq_domain:
=20
-1) a new field 'parent' is added to struct irq_domain; it's used to
+1) The :c:member:`parent` field in struct irq_domain is used to
    maintain irq_domain hierarchy information.
-2) a new field 'parent_data' is added to struct irq_data; it's used to
-   build hierarchy irq_data to match hierarchy irq_domains. The irq_data
-   is used to store irq_domain pointer and hardware irq number.
-3) new callbacks are added to struct irq_domain_ops to support hierarchy
-   irq_domain operations.
-
-With support of hierarchy irq_domain and hierarchy irq_data ready, an
-irq_domain structure is built for each interrupt controller, and an
+2) The :c:member:`parent_data` field in struct irq_data is used to
+   build hierarchy irq_data to match hierarchy irq_domains. The
+   irq_data is used to store irq_domain pointer and hardware irq
+   number.
+3) The :c:member:`alloc()`, :c:member:`free()`, and other callbacks in
+   struct irq_domain_ops to support hierarchy irq_domain operations.
+
+With the support of hierarchy irq_domain and hierarchy irq_data ready,
+an irq_domain structure is built for each interrupt controller, and an
 irq_data structure is allocated for each irq_domain associated with an
-IRQ. Now we could go one step further to support stacked(hierarchy)
+IRQ.
+
+For an interrupt controller driver to support hierarchy irq_domain, it
+needs to:
+
+1) Implement irq_domain_ops.alloc() and irq_domain_ops.free()
+2) Optionally, implement irq_domain_ops.activate() and
+   irq_domain_ops.deactivate().
+3) Optionally, implement an irq_chip to manage the interrupt controller
+   hardware.
+4) There is no need to implement irq_domain_ops.map() and
+   irq_domain_ops.unmap(). They are unused with hierarchy irq_domain.
+
+Note the hierarchy irq_domain is in no way x86-specific, and is
+heavily used to support other architectures, such as ARM, ARM64 etc.
+
+Stacked irq_chip
+~~~~~~~~~~~~~~~~
+
+Now, we could go one step further to support stacked (hierarchy)
 irq_chip. That is, an irq_chip is associated with each irq_data along
 the hierarchy. A child irq_chip may implement a required action by
 itself or by cooperating with its parent irq_chip.
@@ -276,22 +293,28 @@ with the hardware managed by itself and may ask for ser=
vices from its
 parent irq_chip when needed. So we could achieve a much cleaner
 software architecture.
=20
-For an interrupt controller driver to support hierarchy irq_domain, it
-needs to:
-
-1) Implement irq_domain_ops.alloc and irq_domain_ops.free
-2) Optionally implement irq_domain_ops.activate and
-   irq_domain_ops.deactivate.
-3) Optionally implement an irq_chip to manage the interrupt controller
-   hardware.
-4) No need to implement irq_domain_ops.map and irq_domain_ops.unmap,
-   they are unused with hierarchy irq_domain.
-
-Hierarchy irq_domain is in no way x86 specific, and is heavily used to
-support other architectures, such as ARM, ARM64 etc.
-
 Debugging
 =3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Most of the internals of the IRQ subsystem are exposed in debugfs by
 turning CONFIG_GENERIC_IRQ_DEBUGFS on.
+
+Structures and Public Functions Provided
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+This chapter contains the autogenerated documentation of the structures
+and exported kernel API functions which are used for IRQ domains.
+
+.. kernel-doc:: include/linux/irqdomain.h
+
+.. kernel-doc:: kernel/irq/irqdomain.c
+   :export:
+
+Internal Functions Provided
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+
+This chapter contains the autogenerated documentation of the internal
+functions.
+
+.. kernel-doc:: kernel/irq/irqdomain.c
+   :internal:
diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst b/D=
ocumentation/translations/zh_CN/core-api/irq/irq-domain.rst
index 9174fce12c1b..4a2d3b27aa4d 100644
--- a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
+++ b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
@@ -60,8 +60,6 @@ irq_domain=E5=92=8C=E4=B8=80=E4=B8=AAhwirq=E5=8F=B7=E4=BD=
=9C=E4=B8=BA=E5=8F=82=E6=95=B0=E3=80=82 =E5=A6=82=E6=9E=9Chwirq=E7=9A=84=E6=
=98=A0=E5=B0=84=E8=BF=98=E4=B8=8D=E5=AD=98=E5=9C=A8=EF=BC=8C
=20
 - irq_find_mapping()=E8=BF=94=E5=9B=9E=E7=BB=99=E5=AE=9A=E5=9F=9F=E5=92=8Chw=
irq=E7=9A=84Linux IRQ=E5=8F=B7=EF=BC=8C=E5=A6=82=E6=9E=9C=E6=B2=A1=E6=9C=89=
=E6=98=A0=E5=B0=84=E5=88=99=E8=BF=94=E5=9B=9E0=E3=80=82
=20
-- irq_linear_revmap()=E7=8E=B0=E4=B8=8Eirq_find_mapping()=E7=9B=B8=E5=90=8C=
=EF=BC=8C=E5=B7=B2=E8=A2=AB=E5=BA=9F=E5=BC=83=E3=80=82
-
 - generic_handle_domain_irq()=E5=A4=84=E7=90=86=E4=B8=80=E4=B8=AA=E7=94=B1=
=E5=9F=9F=E5=92=8Chwirq=E5=8F=B7=E6=8F=8F=E8=BF=B0=E7=9A=84=E4=B8=AD=E6=96=AD=
=E3=80=82
=20
 =E8=AF=B7=E6=B3=A8=E6=84=8F=EF=BC=8Cirq=E5=9F=9F=E7=9A=84=E6=9F=A5=E6=89=BE=
=E5=BF=85=E9=A1=BB=E5=8F=91=E7=94=9F=E5=9C=A8=E4=B8=8ERCU=E8=AF=BB=E4=B8=B4=
=E7=95=8C=E5=8C=BA=E5=85=BC=E5=AE=B9=E7=9A=84=E4=B8=8A=E4=B8=8B=E6=96=87=E4=
=B8=AD=E3=80=82
@@ -83,7 +81,6 @@ irq_domain=E6=98=A0=E5=B0=84=E7=9A=84=E7=B1=BB=E5=9E=8B
=20
 ::
=20
-	irq_domain_add_linear()
 	irq_domain_create_linear()
=20
 =E7=BA=BF=E6=80=A7=E5=8F=8D=E5=90=91=E6=98=A0=E5=B0=84=E7=BB=B4=E6=8A=A4=E4=
=BA=86=E4=B8=80=E4=B8=AA=E5=9B=BA=E5=AE=9A=E5=A4=A7=E5=B0=8F=E7=9A=84=E8=A1=
=A8=EF=BC=8C=E8=AF=A5=E8=A1=A8=E4=BB=A5hwirq=E5=8F=B7=E4=B8=BA=E7=B4=A2=E5=BC=
=95=E3=80=82 =E5=BD=93=E4=B8=80=E4=B8=AAhwirq=E8=A2=AB=E6=98=A0=E5=B0=84
@@ -104,7 +101,6 @@ irq_domain_add_linear()=E5=92=8Cirq_domain_create_linear(=
)=E5=9C=A8=E5=8A=9F=E8=83=BD=E4=B8=8A=E6=98=AF=E7=AD=89=E4=BB=B7=E7=9A=84=EF=
=BC=8C
=20
 ::
=20
-	irq_domain_add_tree()
 	irq_domain_create_tree()
=20
 irq_domain=E7=BB=B4=E6=8A=A4=E7=9D=80=E4=BB=8Ehwirq=E5=8F=B7=E5=88=B0Linux I=
RQ=E7=9A=84radix=E7=9A=84=E6=A0=91=E7=8A=B6=E6=98=A0=E5=B0=84=E3=80=82 =E5=BD=
=93=E4=B8=80=E4=B8=AAhwirq=E8=A2=AB=E6=98=A0=E5=B0=84=E6=97=B6=EF=BC=8C
@@ -124,7 +120,7 @@ irq_domain_add_tree()=E5=92=8Cirq_domain_create_tree()=E5=
=9C=A8=E5=8A=9F=E8=83=BD=E4=B8=8A=E6=98=AF=E7=AD=89=E4=BB=B7=E7=9A=84=EF=BC=
=8C=E9=99=A4
=20
 ::
=20
-	irq_domain_add_nomap()
+	irq_domain_create_nomap()
=20
 =E5=BD=93=E7=A1=AC=E4=BB=B6=E4=B8=AD=E7=9A=84hwirq=E5=8F=B7=E6=98=AF=E5=8F=
=AF=E7=BC=96=E7=A8=8B=E7=9A=84=E6=97=B6=E5=80=99=EF=BC=8C=E5=B0=B1=E5=8F=AF=
=E4=BB=A5=E9=87=87=E7=94=A8=E6=97=A0=E6=98=A0=E5=B0=84=E7=B1=BB=E5=9E=8B=E3=
=80=82 =E5=9C=A8=E8=BF=99=E7=A7=8D=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E6=9C=
=80=E5=A5=BD=E5=B0=86
 Linux IRQ=E5=8F=B7=E7=BC=96=E5=85=A5=E7=A1=AC=E4=BB=B6=E6=9C=AC=E8=BA=AB=EF=
=BC=8C=E8=BF=99=E6=A0=B7=E5=B0=B1=E4=B8=8D=E9=9C=80=E8=A6=81=E6=98=A0=E5=B0=
=84=E4=BA=86=E3=80=82 =E8=B0=83=E7=94=A8irq_create_direct_mapping()
@@ -138,8 +134,6 @@ Linux IRQ=E5=8F=B7=E7=BC=96=E5=85=A5=E7=A1=AC=E4=BB=B6=E6=
=9C=AC=E8=BA=AB=EF=BC=8C=E8=BF=99=E6=A0=B7=E5=B0=B1=E4=B8=8D=E9=9C=80=E8=A6=
=81=E6=98=A0=E5=B0=84=E4=BA=86=E3=80=82 =E8=B0=83=E7=94=A8irq_create
=20
 ::
=20
-	irq_domain_add_simple()
-	irq_domain_add_legacy()
 	irq_domain_create_simple()
 	irq_domain_create_legacy()
=20
diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index fea29d9d18d6..809edc59af25 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -170,7 +170,7 @@ init_onchip_IRQ(struct device_node *intc, struct device_n=
ode *parent)
 	if (parent)
 		panic("DeviceTree incore intc not a root irq controller\n");
=20
-	root_domain =3D irq_domain_add_linear(intc, nr_cpu_irqs, &arcv2_irq_ops, NU=
LL);
+	root_domain =3D irq_domain_create_linear(of_fwnode_handle(intc), nr_cpu_irq=
s, &arcv2_irq_ops, NULL);
 	if (!root_domain)
 		panic("root irq domain not avail\n");
=20
diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index 1d2ff1c6a61b..1b159e9e0234 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -112,8 +112,9 @@ init_onchip_IRQ(struct device_node *intc, struct device_n=
ode *parent)
 	if (parent)
 		panic("DeviceTree incore intc not a root irq controller\n");
=20
-	root_domain =3D irq_domain_add_linear(intc, NR_CPU_IRQS,
-					    &arc_intc_domain_ops, NULL);
+	root_domain =3D irq_domain_create_linear(of_fwnode_handle(intc),
+					       NR_CPU_IRQS,
+					       &arc_intc_domain_ops, NULL);
 	if (!root_domain)
 		panic("root irq domain not avail\n");
=20
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index cdd370ec9280..02b28a9324f4 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -391,7 +391,8 @@ idu_of_init(struct device_node *intc, struct device_node =
*parent)
=20
 	pr_info("MCIP: IDU supports %u common irqs\n", nr_irqs);
=20
-	domain =3D irq_domain_add_linear(intc, nr_irqs, &idu_irq_ops, NULL);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(intc), nr_irqs,
+					  &idu_irq_ops, NULL);
=20
 	/* Parent interrupts (core-intc) are already mapped */
=20
diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index 9846f30990f7..02eda44a6faa 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -416,9 +416,9 @@ static int sa1111_setup_irq(struct sa1111 *sachip, unsign=
ed irq_base)
 	writel_relaxed(~0, irqbase + SA1111_INTSTATCLR0);
 	writel_relaxed(~0, irqbase + SA1111_INTSTATCLR1);
=20
-	sachip->irqdomain =3D irq_domain_add_linear(NULL, SA1111_IRQ_NR,
-						  &sa1111_irqdomain_ops,
-						  sachip);
+	sachip->irqdomain =3D irq_domain_create_linear(NULL, SA1111_IRQ_NR,
+						     &sa1111_irqdomain_ops,
+						     sachip);
 	if (!sachip->irqdomain) {
 		irq_free_descs(sachip->irq_base, SA1111_IRQ_NR);
 		return -ENOMEM;
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index cac4e82f6c82..150a1e56dcae 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -209,9 +209,8 @@ static int __init exynos_pmu_irq_init(struct device_node =
*node,
 		return -ENOMEM;
 	}
=20
-	domain =3D irq_domain_add_hierarchy(parent_domain, 0, 0,
-					  node, &exynos_pmu_domain_ops,
-					  NULL);
+	domain =3D irq_domain_create_hierarchy(parent_domain, 0, 0, of_fwnode_handl=
e(node),
+					     &exynos_pmu_domain_ops, NULL);
 	if (!domain) {
 		iounmap(pmu_base_addr);
 		pmu_base_addr =3D NULL;
diff --git a/arch/arm/mach-imx/avic.c b/arch/arm/mach-imx/avic.c
index cf6546ddc7a3..3067c06b4b8e 100644
--- a/arch/arm/mach-imx/avic.c
+++ b/arch/arm/mach-imx/avic.c
@@ -201,8 +201,8 @@ static void __init mxc_init_irq(void __iomem *irqbase)
 	WARN_ON(irq_base < 0);
=20
 	np =3D of_find_compatible_node(NULL, NULL, "fsl,avic");
-	domain =3D irq_domain_add_legacy(np, AVIC_NUM_IRQS, irq_base, 0,
-				       &irq_domain_simple_ops, NULL);
+	domain =3D irq_domain_create_legacy(of_fwnode_handle(np), AVIC_NUM_IRQS, ir=
q_base, 0,
+					  &irq_domain_simple_ops, NULL);
 	WARN_ON(!domain);
=20
 	for (i =3D 0; i < AVIC_NUM_IRQS / 32; i++, irq_base +=3D 32)
diff --git a/arch/arm/mach-imx/gpc.c b/arch/arm/mach-imx/gpc.c
index 5909088d5482..2e633569d2f8 100644
--- a/arch/arm/mach-imx/gpc.c
+++ b/arch/arm/mach-imx/gpc.c
@@ -245,9 +245,8 @@ static int __init imx_gpc_init(struct device_node *node,
 	if (WARN_ON(!gpc_base))
 	        return -ENOMEM;
=20
-	domain =3D irq_domain_add_hierarchy(parent_domain, 0, GPC_MAX_IRQS,
-					  node, &imx_gpc_domain_ops,
-					  NULL);
+	domain =3D irq_domain_create_hierarchy(parent_domain, 0, GPC_MAX_IRQS, of_f=
wnode_handle(node),
+					     &imx_gpc_domain_ops, NULL);
 	if (!domain) {
 		iounmap(gpc_base);
 		return -ENOMEM;
diff --git a/arch/arm/mach-imx/tzic.c b/arch/arm/mach-imx/tzic.c
index 8b3d98d288d9..50a5668e65d2 100644
--- a/arch/arm/mach-imx/tzic.c
+++ b/arch/arm/mach-imx/tzic.c
@@ -175,8 +175,8 @@ static int __init tzic_init_dt(struct device_node *np, st=
ruct device_node *p)
 	irq_base =3D irq_alloc_descs(-1, 0, TZIC_NUM_IRQS, numa_node_id());
 	WARN_ON(irq_base < 0);
=20
-	domain =3D irq_domain_add_legacy(np, TZIC_NUM_IRQS, irq_base, 0,
-				       &irq_domain_simple_ops, NULL);
+	domain =3D irq_domain_create_legacy(of_fwnode_handle(np), TZIC_NUM_IRQS, ir=
q_base, 0,
+					  &irq_domain_simple_ops, NULL);
 	WARN_ON(!domain);
=20
 	for (i =3D 0; i < 4; i++, irq_base +=3D 32)
diff --git a/arch/arm/mach-omap1/irq.c b/arch/arm/mach-omap1/irq.c
index 9b587ecebb1c..bb1bc060ecd8 100644
--- a/arch/arm/mach-omap1/irq.c
+++ b/arch/arm/mach-omap1/irq.c
@@ -220,8 +220,7 @@ void __init omap1_init_irq(void)
 	omap_l2_irq =3D irq_base;
 	omap_l2_irq -=3D NR_IRQS_LEGACY;
=20
-	domain =3D irq_domain_add_legacy(NULL, nr_irqs, irq_base, 0,
-				       &irq_domain_simple_ops, NULL);
+	domain =3D irq_domain_create_legacy(NULL, nr_irqs, irq_base, 0, &irq_domain=
_simple_ops, NULL);
=20
 	pr_info("Total of %lu interrupts in %i interrupt banks\n",
 		nr_irqs, irq_bank_count);
diff --git a/arch/arm/mach-omap2/omap-wakeupgen.c b/arch/arm/mach-omap2/omap-=
wakeupgen.c
index 6f0d6120c174..a66b1dc61571 100644
--- a/arch/arm/mach-omap2/omap-wakeupgen.c
+++ b/arch/arm/mach-omap2/omap-wakeupgen.c
@@ -585,9 +585,8 @@ static int __init wakeupgen_init(struct device_node *node,
 		wakeupgen_ops =3D &am43xx_wakeupgen_ops;
 	}
=20
-	domain =3D irq_domain_add_hierarchy(parent_domain, 0, max_irqs,
-					  node, &wakeupgen_domain_ops,
-					  NULL);
+	domain =3D irq_domain_create_hierarchy(parent_domain, 0, max_irqs, of_fwnod=
e_handle(node),
+					     &wakeupgen_domain_ops, NULL);
 	if (!domain) {
 		iounmap(wakeupgen_base);
 		return -ENOMEM;
diff --git a/arch/arm/mach-pxa/irq.c b/arch/arm/mach-pxa/irq.c
index d9cadd97748a..5bfce8aa4102 100644
--- a/arch/arm/mach-pxa/irq.c
+++ b/arch/arm/mach-pxa/irq.c
@@ -147,9 +147,8 @@ pxa_init_irq_common(struct device_node *node, int irq_nr,
 	int n;
=20
 	pxa_internal_irq_nr =3D irq_nr;
-	pxa_irq_domain =3D irq_domain_add_legacy(node, irq_nr,
-					       PXA_IRQ(0), 0,
-					       &pxa_irq_ops, NULL);
+	pxa_irq_domain =3D irq_domain_create_legacy(of_fwnode_handle(node), irq_nr,=
 PXA_IRQ(0), 0,
+						  &pxa_irq_ops, NULL);
 	if (!pxa_irq_domain)
 		panic("Unable to add PXA IRQ domain\n");
 	irq_set_default_domain(pxa_irq_domain);
diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index 595e9cb33c1d..a15f47450084 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -602,12 +602,12 @@ void __init orion_gpio_init(int gpio_base, int ngpio,
 			       IRQ_NOREQUEST, IRQ_LEVEL | IRQ_NOPROBE);
=20
 	/* Setup irq domain on top of the generic chip. */
-	ochip->domain =3D irq_domain_add_legacy(NULL,
-					      ochip->chip.ngpio,
-					      ochip->secondary_irq_base,
-					      ochip->secondary_irq_base,
-					      &irq_domain_simple_ops,
-					      ochip);
+	ochip->domain =3D irq_domain_create_legacy(NULL,
+						 ochip->chip.ngpio,
+						 ochip->secondary_irq_base,
+						 ochip->secondary_irq_base,
+						 &irq_domain_simple_ops,
+						 ochip);
 	if (!ochip->domain)
 		panic("%s: couldn't allocate irq domain (DT).\n",
 		      ochip->chip.label);
diff --git a/arch/mips/ath25/ar2315.c b/arch/mips/ath25/ar2315.c
index 8ccf167c167e..e8c38aaf46a2 100644
--- a/arch/mips/ath25/ar2315.c
+++ b/arch/mips/ath25/ar2315.c
@@ -149,8 +149,8 @@ void __init ar2315_arch_init_irq(void)
=20
 	ath25_irq_dispatch =3D ar2315_irq_dispatch;
=20
-	domain =3D irq_domain_add_linear(NULL, AR2315_MISC_IRQ_COUNT,
-				       &ar2315_misc_irq_domain_ops, NULL);
+	domain =3D irq_domain_create_linear(NULL, AR2315_MISC_IRQ_COUNT,
+					  &ar2315_misc_irq_domain_ops, NULL);
 	if (!domain)
 		panic("Failed to add IRQ domain");
=20
diff --git a/arch/mips/ath25/ar5312.c b/arch/mips/ath25/ar5312.c
index cfa103518113..4a1d874be766 100644
--- a/arch/mips/ath25/ar5312.c
+++ b/arch/mips/ath25/ar5312.c
@@ -143,8 +143,8 @@ void __init ar5312_arch_init_irq(void)
=20
 	ath25_irq_dispatch =3D ar5312_irq_dispatch;
=20
-	domain =3D irq_domain_add_linear(NULL, AR5312_MISC_IRQ_COUNT,
-				       &ar5312_misc_irq_domain_ops, NULL);
+	domain =3D irq_domain_create_linear(NULL, AR5312_MISC_IRQ_COUNT,
+					  &ar5312_misc_irq_domain_ops, NULL);
 	if (!domain)
 		panic("Failed to add IRQ domain");
=20
diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/o=
cteon-irq.c
index e6b4d9c0c169..5c3de175ef5b 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -1503,8 +1503,8 @@ static int __init octeon_irq_init_ciu(
 	/* Mips internal */
 	octeon_irq_init_core();
=20
-	ciu_domain =3D irq_domain_add_tree(
-		ciu_node, &octeon_irq_domain_ciu_ops, dd);
+	ciu_domain =3D irq_domain_create_tree(of_fwnode_handle(ciu_node), &octeon_i=
rq_domain_ciu_ops,
+					    dd);
 	irq_set_default_domain(ciu_domain);
=20
 	/* CIU_0 */
@@ -1637,8 +1637,8 @@ static int __init octeon_irq_init_gpio(
 	if (gpiod) {
 		/* gpio domain host_data is the base hwirq number. */
 		gpiod->base_hwirq =3D base_hwirq;
-		irq_domain_add_linear(
-			gpio_node, 16, &octeon_irq_domain_gpio_ops, gpiod);
+		irq_domain_create_linear(of_fwnode_handle(gpio_node), 16,
+					 &octeon_irq_domain_gpio_ops, gpiod);
 	} else {
 		pr_warn("Cannot allocate memory for GPIO irq_domain.\n");
 		return -ENOMEM;
@@ -2074,8 +2074,8 @@ static int __init octeon_irq_init_ciu2(
 	/* Mips internal */
 	octeon_irq_init_core();
=20
-	ciu_domain =3D irq_domain_add_tree(
-		ciu_node, &octeon_irq_domain_ciu2_ops, NULL);
+	ciu_domain =3D irq_domain_create_tree(of_fwnode_handle(ciu_node), &octeon_i=
rq_domain_ciu2_ops,
+					    NULL);
 	irq_set_default_domain(ciu_domain);
=20
 	/* CUI2 */
@@ -2331,11 +2331,12 @@ static int __init octeon_irq_init_cib(struct device_n=
ode *ciu_node,
 	}
 	host_data->max_bits =3D val;
=20
-	cib_domain =3D irq_domain_add_linear(ciu_node, host_data->max_bits,
-					   &octeon_irq_domain_cib_ops,
-					   host_data);
+	cib_domain =3D irq_domain_create_linear(of_fwnode_handle(ciu_node),
+					      host_data->max_bits,
+					      &octeon_irq_domain_cib_ops,
+					      host_data);
 	if (!cib_domain) {
-		pr_err("ERROR: Couldn't irq_domain_add_linear()\n");
+		pr_err("ERROR: Couldn't irq_domain_create_linear()\n");
 		return -ENOMEM;
 	}
=20
@@ -2918,8 +2919,8 @@ static int __init octeon_irq_init_ciu3(struct device_no=
de *ciu_node,
 	 * Initialize all domains to use the default domain. Specific major
 	 * blocks will overwrite the default domain as needed.
 	 */
-	domain =3D irq_domain_add_tree(ciu_node, &octeon_dflt_domain_ciu3_ops,
-				     ciu3_info);
+	domain =3D irq_domain_create_tree(of_fwnode_handle(ciu_node), &octeon_dflt_=
domain_ciu3_ops,
+					ciu3_info);
 	for (i =3D 0; i < MAX_CIU3_DOMAINS; i++)
 		ciu3_info->domain[i] =3D domain;
=20
diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index 8f208007b8e8..a112573b6e37 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -377,7 +377,7 @@ int __init icu_of_init(struct device_node *node, struct d=
evice_node *parent)
 	for (i =3D 0; i < MAX_IM; i++)
 		irq_set_chained_handler(i + 2, ltq_hw_irq_handler);
=20
-	ltq_domain =3D irq_domain_add_linear(node,
+	ltq_domain =3D irq_domain_create_linear(of_fwnode_handle(node),
 		(MAX_IM * INT_NUM_IM_OFFSET) + MIPS_CPU_IRQ_CASCADE,
 		&irq_domain_ops, 0);
=20
diff --git a/arch/mips/pci/pci-ar2315.c b/arch/mips/pci/pci-ar2315.c
index a925842ee125..17fa97ec6ffb 100644
--- a/arch/mips/pci/pci-ar2315.c
+++ b/arch/mips/pci/pci-ar2315.c
@@ -469,8 +469,8 @@ static int ar2315_pci_probe(struct platform_device *pdev)
 	if (err)
 		return err;
=20
-	apc->domain =3D irq_domain_add_linear(NULL, AR2315_PCI_IRQ_COUNT,
-					    &ar2315_pci_irq_domain_ops, apc);
+	apc->domain =3D irq_domain_create_linear(NULL, AR2315_PCI_IRQ_COUNT,
+					       &ar2315_pci_irq_domain_ops, apc);
 	if (!apc->domain) {
 		dev_err(dev, "failed to add IRQ domain\n");
 		return -ENOMEM;
diff --git a/arch/mips/pci/pci-rt3883.c b/arch/mips/pci/pci-rt3883.c
index 4ac68a534e4f..14454ece485d 100644
--- a/arch/mips/pci/pci-rt3883.c
+++ b/arch/mips/pci/pci-rt3883.c
@@ -208,9 +208,10 @@ static int rt3883_pci_irq_init(struct device *dev,
 	rt3883_pci_w32(rpc, 0, RT3883_PCI_REG_PCIENA);
=20
 	rpc->irq_domain =3D
-		irq_domain_add_linear(rpc->intc_of_node, RT3883_PCI_IRQ_COUNT,
-				      &rt3883_pci_irq_domain_ops,
-				      rpc);
+		irq_domain_create_linear(of_fwnode_handle(rpc->intc_of_node),
+					 RT3883_PCI_IRQ_COUNT,
+					 &rt3883_pci_irq_domain_ops,
+					 rpc);
 	if (!rpc->irq_domain) {
 		dev_err(dev, "unable to add IRQ domain\n");
 		return -ENODEV;
diff --git a/arch/mips/ralink/irq.c b/arch/mips/ralink/irq.c
index 46aef0a1b22a..af5bbbea949b 100644
--- a/arch/mips/ralink/irq.c
+++ b/arch/mips/ralink/irq.c
@@ -176,7 +176,7 @@ static int __init intc_of_init(struct device_node *node,
 	/* route all INTC interrupts to MIPS HW0 interrupt */
 	rt_intc_w32(0, INTC_REG_TYPE);
=20
-	domain =3D irq_domain_add_legacy(node, RALINK_INTC_IRQ_COUNT,
+	domain =3D irq_domain_create_legacy(of_fwnode_handle(node), RALINK_INTC_IRQ=
_COUNT,
 			RALINK_INTC_IRQ_BASE, 0, &irq_domain_ops, NULL);
 	if (!domain)
 		panic("Failed to add irqdomain");
diff --git a/arch/nios2/kernel/irq.c b/arch/nios2/kernel/irq.c
index 8fa280660051..73568d8e21e0 100644
--- a/arch/nios2/kernel/irq.c
+++ b/arch/nios2/kernel/irq.c
@@ -69,7 +69,8 @@ void __init init_IRQ(void)
=20
 	BUG_ON(!node);
=20
-	domain =3D irq_domain_add_linear(node, NIOS2_CPU_NR_IRQS, &irq_ops, NULL);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(node),
+					  NIOS2_CPU_NR_IRQS, &irq_ops, NULL);
 	BUG_ON(!domain);
=20
 	irq_set_default_domain(domain);
diff --git a/arch/powerpc/platforms/44x/uic.c b/arch/powerpc/platforms/44x/ui=
c.c
index 31f760c2ec5d..85daf841fd3f 100644
--- a/arch/powerpc/platforms/44x/uic.c
+++ b/arch/powerpc/platforms/44x/uic.c
@@ -254,8 +254,9 @@ static struct uic * __init uic_init_one(struct device_nod=
e *node)
 	}
 	uic->dcrbase =3D *dcrreg;
=20
-	uic->irqhost =3D irq_domain_add_linear(node, NR_UIC_INTS, &uic_host_ops,
-					     uic);
+	uic->irqhost =3D irq_domain_create_linear(of_fwnode_handle(node),
+						NR_UIC_INTS, &uic_host_ops,
+						uic);
 	if (! uic->irqhost)
 		return NULL; /* FIXME: panic? */
=20
@@ -327,5 +328,5 @@ unsigned int uic_get_irq(void)
 	msr =3D mfdcr(primary_uic->dcrbase + UIC_MSR);
 	src =3D 32 - ffs(msr);
=20
-	return irq_linear_revmap(primary_uic->irqhost, src);
+	return irq_find_mapping(primary_uic->irqhost, src);
 }
diff --git a/arch/powerpc/platforms/512x/mpc5121_ads_cpld.c b/arch/powerpc/pl=
atforms/512x/mpc5121_ads_cpld.c
index e995eb30bf09..2cf3c6237337 100644
--- a/arch/powerpc/platforms/512x/mpc5121_ads_cpld.c
+++ b/arch/powerpc/platforms/512x/mpc5121_ads_cpld.c
@@ -188,7 +188,8 @@ mpc5121_ads_cpld_pic_init(void)
=20
 	cpld_pic_node =3D of_node_get(np);
=20
-	cpld_pic_host =3D irq_domain_add_linear(np, 16, &cpld_pic_host_ops, NULL);
+	cpld_pic_host =3D irq_domain_create_linear(of_fwnode_handle(np), 16,
+						 &cpld_pic_host_ops, NULL);
 	if (!cpld_pic_host) {
 		printk(KERN_ERR "CPLD PIC: failed to allocate irq host!\n");
 		goto end;
diff --git a/arch/powerpc/platforms/52xx/media5200.c b/arch/powerpc/platforms=
/52xx/media5200.c
index 19626cd42406..bc7f83cfec1d 100644
--- a/arch/powerpc/platforms/52xx/media5200.c
+++ b/arch/powerpc/platforms/52xx/media5200.c
@@ -168,7 +168,7 @@ static void __init media5200_init_irq(void)
=20
 	spin_lock_init(&media5200_irq.lock);
=20
-	media5200_irq.irqhost =3D irq_domain_add_linear(fpga_np,
+	media5200_irq.irqhost =3D irq_domain_create_linear(of_fwnode_handle(fpga_np=
),
 			MEDIA5200_NUM_IRQS, &media5200_irq_ops, &media5200_irq);
 	if (!media5200_irq.irqhost)
 		goto out;
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platfor=
ms/52xx/mpc52xx_gpt.c
index 1ea591ec6083..3dbe5a5e5d1f 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -247,9 +247,9 @@ mpc52xx_gpt_irq_setup(struct mpc52xx_gpt_priv *gpt, struc=
t device_node *node)
 	if (!cascade_virq)
 		return;
=20
-	gpt->irqhost =3D irq_domain_add_linear(node, 1, &mpc52xx_gpt_irq_ops, gpt);
+	gpt->irqhost =3D irq_domain_create_linear(of_fwnode_handle(node), 1, &mpc52=
xx_gpt_irq_ops, gpt);
 	if (!gpt->irqhost) {
-		dev_err(gpt->dev, "irq_domain_add_linear() failed\n");
+		dev_err(gpt->dev, "irq_domain_create_linear() failed\n");
 		return;
 	}
=20
@@ -369,7 +369,7 @@ struct mpc52xx_gpt_priv *mpc52xx_gpt_from_irq(int irq)
 	mutex_lock(&mpc52xx_gpt_list_mutex);
 	list_for_each(pos, &mpc52xx_gpt_list) {
 		gpt =3D container_of(pos, struct mpc52xx_gpt_priv, list);
-		if (gpt->irqhost && irq =3D=3D irq_linear_revmap(gpt->irqhost, 0)) {
+		if (gpt->irqhost && irq =3D=3D irq_find_mapping(gpt->irqhost, 0)) {
 			mutex_unlock(&mpc52xx_gpt_list_mutex);
 			return gpt;
 		}
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pic.c b/arch/powerpc/platfor=
ms/52xx/mpc52xx_pic.c
index 43c881d31ca6..eb6a4e745c08 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_pic.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_pic.c
@@ -446,7 +446,7 @@ void __init mpc52xx_init_irq(void)
 	 * As last step, add an irq host to translate the real
 	 * hw irq information provided by the ofw to linux virq
 	 */
-	mpc52xx_irqhost =3D irq_domain_add_linear(picnode,
+	mpc52xx_irqhost =3D irq_domain_create_linear(of_fwnode_handle(picnode),
 	                                 MPC52xx_IRQ_HIGHTESTHWIRQ,
 	                                 &mpc52xx_irqhost_ops, NULL);
=20
@@ -515,5 +515,5 @@ unsigned int mpc52xx_get_irq(void)
 		return 0;
 	}
=20
-	return irq_linear_revmap(mpc52xx_irqhost, irq);
+	return irq_find_mapping(mpc52xx_irqhost, irq);
 }
diff --git a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c b/arch/powerpc/p=
latforms/85xx/socrates_fpga_pic.c
index 60e0b8947ce6..4b69fb321a68 100644
--- a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
+++ b/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
@@ -83,7 +83,7 @@ static inline unsigned int socrates_fpga_pic_get_irq(unsign=
ed int irq)
 		if (cause >> (i + 16))
 			break;
 	}
-	return irq_linear_revmap(socrates_fpga_pic_irq_host,
+	return irq_find_mapping(socrates_fpga_pic_irq_host,
 			(irq_hw_number_t)i);
 }
=20
@@ -278,7 +278,7 @@ void __init socrates_fpga_pic_init(struct device_node *pi=
c)
 	int i;
=20
 	/* Setup an irq_domain structure */
-	socrates_fpga_pic_irq_host =3D irq_domain_add_linear(pic,
+	socrates_fpga_pic_irq_host =3D irq_domain_create_linear(of_fwnode_handle(pi=
c),
 		    SOCRATES_FPGA_NUM_IRQS, &socrates_fpga_pic_host_ops, NULL);
 	if (socrates_fpga_pic_irq_host =3D=3D NULL) {
 		pr_err("FPGA PIC: Unable to allocate host\n");
diff --git a/arch/powerpc/platforms/8xx/cpm1-ic.c b/arch/powerpc/platforms/8x=
x/cpm1-ic.c
index a18fc7c99f83..a49d4a9ab3bc 100644
--- a/arch/powerpc/platforms/8xx/cpm1-ic.c
+++ b/arch/powerpc/platforms/8xx/cpm1-ic.c
@@ -59,7 +59,7 @@ static int cpm_get_irq(struct irq_desc *desc)
 	cpm_vec =3D in_be16(&data->reg->cpic_civr);
 	cpm_vec >>=3D 11;
=20
-	return irq_linear_revmap(data->host, cpm_vec);
+	return irq_find_mapping(data->host, cpm_vec);
 }
=20
 static void cpm_cascade(struct irq_desc *desc)
@@ -110,7 +110,8 @@ static int cpm_pic_probe(struct platform_device *pdev)
=20
 	out_be32(&data->reg->cpic_cimr, 0);
=20
-	data->host =3D irq_domain_add_linear(dev->of_node, 64, &cpm_pic_host_ops, d=
ata);
+	data->host =3D irq_domain_create_linear(of_fwnode_handle(dev->of_node),
+					      64, &cpm_pic_host_ops, data);
 	if (!data->host)
 		return -ENODEV;
=20
diff --git a/arch/powerpc/platforms/8xx/pic.c b/arch/powerpc/platforms/8xx/pi=
c.c
index ea6b0e523c60..933d6ab7f512 100644
--- a/arch/powerpc/platforms/8xx/pic.c
+++ b/arch/powerpc/platforms/8xx/pic.c
@@ -80,7 +80,7 @@ unsigned int mpc8xx_get_irq(void)
 	if (irq =3D=3D PIC_VEC_SPURRIOUS)
 		return 0;
=20
-        return irq_linear_revmap(mpc8xx_pic_host, irq);
+        return irq_find_mapping(mpc8xx_pic_host, irq);
=20
 }
=20
@@ -146,7 +146,8 @@ void __init mpc8xx_pic_init(void)
 	if (!siu_reg)
 		goto out;
=20
-	mpc8xx_pic_host =3D irq_domain_add_linear(np, 64, &mpc8xx_pic_host_ops, NUL=
L);
+	mpc8xx_pic_host =3D irq_domain_create_linear(of_fwnode_handle(np), 64,
+						   &mpc8xx_pic_host_ops, NULL);
 	if (!mpc8xx_pic_host)
 		printk(KERN_ERR "MPC8xx PIC: failed to allocate irq host!\n");
=20
diff --git a/arch/powerpc/platforms/embedded6xx/flipper-pic.c b/arch/powerpc/=
platforms/embedded6xx/flipper-pic.c
index 013d66304c31..91a8f0a7086e 100644
--- a/arch/powerpc/platforms/embedded6xx/flipper-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
@@ -149,8 +149,9 @@ static struct irq_domain * __init flipper_pic_init(struct=
 device_node *np)
=20
 	__flipper_quiesce(io_base);
=20
-	irq_domain =3D irq_domain_add_linear(np, FLIPPER_NR_IRQS,
-				  &flipper_irq_domain_ops, io_base);
+	irq_domain =3D irq_domain_create_linear(of_fwnode_handle(np),
+					      FLIPPER_NR_IRQS,
+					      &flipper_irq_domain_ops, io_base);
 	if (!irq_domain) {
 		pr_err("failed to allocate irq_domain\n");
 		return NULL;
@@ -172,7 +173,7 @@ unsigned int flipper_pic_get_irq(void)
 		return 0;	/* no more IRQs pending */
=20
 	irq =3D __ffs(irq_status);
-	return irq_linear_revmap(flipper_irq_host, irq);
+	return irq_find_mapping(flipper_irq_host, irq);
 }
=20
 /*
diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/pla=
tforms/embedded6xx/hlwd-pic.c
index 4d2d92de30af..b57e87b0b3ce 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
@@ -175,8 +175,9 @@ static struct irq_domain *__init hlwd_pic_init(struct dev=
ice_node *np)
=20
 	__hlwd_quiesce(io_base);
=20
-	irq_domain =3D irq_domain_add_linear(np, HLWD_NR_IRQS,
-					   &hlwd_irq_domain_ops, io_base);
+	irq_domain =3D irq_domain_create_linear(of_fwnode_handle(np),
+					      HLWD_NR_IRQS,
+					      &hlwd_irq_domain_ops, io_base);
 	if (!irq_domain) {
 		pr_err("failed to allocate irq_domain\n");
 		iounmap(io_base);
@@ -189,7 +190,7 @@ static struct irq_domain *__init hlwd_pic_init(struct dev=
ice_node *np)
 unsigned int hlwd_pic_get_irq(void)
 {
 	unsigned int hwirq =3D __hlwd_pic_get_irq(hlwd_irq_host);
-	return hwirq ? irq_linear_revmap(hlwd_irq_host, hwirq) : 0;
+	return hwirq ? irq_find_mapping(hlwd_irq_host, hwirq) : 0;
 }
=20
 /*
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/p=
owermac/pic.c
index 03a7c51f2645..c37783a03d25 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -250,7 +250,7 @@ static unsigned int pmac_pic_get_irq(void)
 	raw_spin_unlock_irqrestore(&pmac_pic_lock, flags);
 	if (unlikely(irq < 0))
 		return 0;
-	return irq_linear_revmap(pmac_pic_host, irq);
+	return irq_find_mapping(pmac_pic_host, irq);
 }
=20
 static int pmac_pic_host_match(struct irq_domain *h, struct device_node *nod=
e,
@@ -327,8 +327,9 @@ static void __init pmac_pic_probe_oldstyle(void)
 	/*
 	 * Allocate an irq host
 	 */
-	pmac_pic_host =3D irq_domain_add_linear(master, max_irqs,
-					      &pmac_pic_host_ops, NULL);
+	pmac_pic_host =3D irq_domain_create_linear(of_fwnode_handle(master),
+						 max_irqs,
+						 &pmac_pic_host_ops, NULL);
 	BUG_ON(pmac_pic_host =3D=3D NULL);
 	irq_set_default_domain(pmac_pic_host);
=20
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/p=
owermac/smp.c
index 09e7fe24fac1..88e92af8acf9 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -190,7 +190,7 @@ static int __init psurge_secondary_ipi_init(void)
 {
 	int rc =3D -ENOMEM;
=20
-	psurge_host =3D irq_domain_add_nomap(NULL, ~0, &psurge_host_ops, NULL);
+	psurge_host =3D irq_domain_create_nomap(NULL, ~0, &psurge_host_ops, NULL);
=20
 	if (psurge_host)
 		psurge_secondary_virq =3D irq_create_direct_mapping(psurge_host);
diff --git a/arch/powerpc/platforms/powernv/opal-irqchip.c b/arch/powerpc/pla=
tforms/powernv/opal-irqchip.c
index d92759c21fae..e180bd8e1400 100644
--- a/arch/powerpc/platforms/powernv/opal-irqchip.c
+++ b/arch/powerpc/platforms/powernv/opal-irqchip.c
@@ -191,7 +191,8 @@ int __init opal_event_init(void)
 	 * fall back to the legacy method (opal_event_request(...))
 	 * anyway. */
 	dn =3D of_find_compatible_node(NULL, NULL, "ibm,opal-event");
-	opal_event_irqchip.domain =3D irq_domain_add_linear(dn, MAX_NUM_EVENTS,
+	opal_event_irqchip.domain =3D irq_domain_create_linear(of_fwnode_handle(dn),
+				MAX_NUM_EVENTS,
 				&opal_event_domain_ops, &opal_event_irqchip);
 	of_node_put(dn);
 	if (!opal_event_irqchip.domain) {
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platfor=
ms/powernv/pci-ioda.c
index ae4b549b5ca0..d8ccf2c9b98a 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1897,7 +1897,7 @@ static int __init pnv_msi_allocate_domains(struct pci_c=
ontroller *hose, unsigned
 		return -ENOMEM;
 	}
=20
-	hose->msi_domain =3D pci_msi_create_irq_domain(of_node_to_fwnode(hose->dn),
+	hose->msi_domain =3D pci_msi_create_irq_domain(of_fwnode_handle(hose->dn),
 						     &pnv_msi_domain_info,
 						     hose->dev_domain);
 	if (!hose->msi_domain) {
diff --git a/arch/powerpc/platforms/ps3/interrupt.c b/arch/powerpc/platforms/=
ps3/interrupt.c
index 95e96bd61a20..a4ad4b49eef7 100644
--- a/arch/powerpc/platforms/ps3/interrupt.c
+++ b/arch/powerpc/platforms/ps3/interrupt.c
@@ -743,7 +743,7 @@ void __init ps3_init_IRQ(void)
 	unsigned cpu;
 	struct irq_domain *host;
=20
-	host =3D irq_domain_add_nomap(NULL, PS3_PLUG_MAX + 1, &ps3_host_ops, NULL);
+	host =3D irq_domain_create_nomap(NULL, PS3_PLUG_MAX + 1, &ps3_host_ops, NUL=
L);
 	irq_set_default_domain(host);
=20
 	for_each_possible_cpu(cpu) {
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/ps=
eries/msi.c
index f9d80111c322..5b191f70c088 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -628,7 +628,7 @@ static int __pseries_msi_allocate_domains(struct pci_cont=
roller *phb,
 		return -ENOMEM;
 	}
=20
-	phb->msi_domain =3D pci_msi_create_irq_domain(of_node_to_fwnode(phb->dn),
+	phb->msi_domain =3D pci_msi_create_irq_domain(of_fwnode_handle(phb->dn),
 						    &pseries_msi_domain_info,
 						    phb->dev_domain);
 	if (!phb->msi_domain) {
diff --git a/arch/powerpc/sysdev/cpm2_pic.c b/arch/powerpc/sysdev/cpm2_pic.c
index e14493685fe8..4a59ed1d62ce 100644
--- a/arch/powerpc/sysdev/cpm2_pic.c
+++ b/arch/powerpc/sysdev/cpm2_pic.c
@@ -207,7 +207,7 @@ unsigned int cpm2_get_irq(void)
=20
 	if (irq =3D=3D 0)
 		return(-1);
-	return irq_linear_revmap(cpm2_pic_host, irq);
+	return irq_find_mapping(cpm2_pic_host, irq);
 }
=20
 static int cpm2_pic_host_map(struct irq_domain *h, unsigned int virq,
@@ -259,7 +259,8 @@ void cpm2_pic_init(struct device_node *node)
 	out_be32(&cpm2_intctl->ic_scprrl, 0x05309770);
=20
 	/* create a legacy host */
-	cpm2_pic_host =3D irq_domain_add_linear(node, 64, &cpm2_pic_host_ops, NULL);
+	cpm2_pic_host =3D irq_domain_create_linear(of_fwnode_handle(node), 64,
+						 &cpm2_pic_host_ops, NULL);
 	if (cpm2_pic_host =3D=3D NULL) {
 		printk(KERN_ERR "CPM2 PIC: failed to allocate irq host!\n");
 		return;
diff --git a/arch/powerpc/sysdev/ehv_pic.c b/arch/powerpc/sysdev/ehv_pic.c
index fb502b72fca1..b6f9774038e1 100644
--- a/arch/powerpc/sysdev/ehv_pic.c
+++ b/arch/powerpc/sysdev/ehv_pic.c
@@ -175,7 +175,7 @@ unsigned int ehv_pic_get_irq(void)
 	 * this will also setup revmap[] in the slow path for the first
 	 * time, next calls will always use fast path by indexing revmap
 	 */
-	return irq_linear_revmap(global_ehv_pic->irqhost, irq);
+	return irq_find_mapping(global_ehv_pic->irqhost, irq);
 }
=20
 static int ehv_pic_host_match(struct irq_domain *h, struct device_node *node,
@@ -269,8 +269,9 @@ void __init ehv_pic_init(void)
 		return;
 	}
=20
-	ehv_pic->irqhost =3D irq_domain_add_linear(np, NR_EHV_PIC_INTS,
-						 &ehv_pic_host_ops, ehv_pic);
+	ehv_pic->irqhost =3D irq_domain_create_linear(of_fwnode_handle(np),
+						    NR_EHV_PIC_INTS,
+						    &ehv_pic_host_ops, ehv_pic);
 	if (!ehv_pic->irqhost) {
 		of_node_put(np);
 		kfree(ehv_pic);
diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 7b9a5ea9cad9..4fe8a7b1b288 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -412,7 +412,7 @@ static int fsl_of_msi_probe(struct platform_device *dev)
 	}
 	platform_set_drvdata(dev, msi);
=20
-	msi->irqhost =3D irq_domain_add_linear(dev->dev.of_node,
+	msi->irqhost =3D irq_domain_create_linear(of_fwnode_handle(dev->dev.of_node=
),
 				      NR_MSI_IRQS_MAX, &fsl_msi_host_ops, msi);
=20
 	if (msi->irqhost =3D=3D NULL) {
diff --git a/arch/powerpc/sysdev/ge/ge_pic.c b/arch/powerpc/sysdev/ge/ge_pic.c
index a6c424680c37..0bc3f0b36528 100644
--- a/arch/powerpc/sysdev/ge/ge_pic.c
+++ b/arch/powerpc/sysdev/ge/ge_pic.c
@@ -214,8 +214,9 @@ void __init gef_pic_init(struct device_node *np)
 	}
=20
 	/* Setup an irq_domain structure */
-	gef_pic_irq_host =3D irq_domain_add_linear(np, GEF_PIC_NUM_IRQS,
-					  &gef_pic_host_ops, NULL);
+	gef_pic_irq_host =3D irq_domain_create_linear(of_fwnode_handle(np),
+						    GEF_PIC_NUM_IRQS,
+						    &gef_pic_host_ops, NULL);
 	if (gef_pic_irq_host =3D=3D NULL)
 		return;
=20
@@ -244,7 +245,7 @@ unsigned int gef_pic_get_irq(void)
 			if (active & (0x1 << hwirq))
 				break;
 		}
-		virq =3D irq_linear_revmap(gef_pic_irq_host,
+		virq =3D irq_find_mapping(gef_pic_irq_host,
 			(irq_hw_number_t)hwirq);
 	}
=20
diff --git a/arch/powerpc/sysdev/i8259.c b/arch/powerpc/sysdev/i8259.c
index 06e391485da7..99bb2b916949 100644
--- a/arch/powerpc/sysdev/i8259.c
+++ b/arch/powerpc/sysdev/i8259.c
@@ -260,8 +260,8 @@ void i8259_init(struct device_node *node, unsigned long i=
ntack_addr)
 	raw_spin_unlock_irqrestore(&i8259_lock, flags);
=20
 	/* create a legacy host */
-	i8259_host =3D irq_domain_add_legacy(node, NR_IRQS_LEGACY, 0, 0,
-					   &i8259_host_ops, NULL);
+	i8259_host =3D irq_domain_create_legacy(of_fwnode_handle(node), NR_IRQS_LEG=
ACY, 0, 0,
+					      &i8259_host_ops, NULL);
 	if (i8259_host =3D=3D NULL) {
 		printk(KERN_ERR "i8259: failed to allocate irq host !\n");
 		return;
diff --git a/arch/powerpc/sysdev/ipic.c b/arch/powerpc/sysdev/ipic.c
index a35be0232978..70be2105865d 100644
--- a/arch/powerpc/sysdev/ipic.c
+++ b/arch/powerpc/sysdev/ipic.c
@@ -711,8 +711,9 @@ struct ipic * __init ipic_init(struct device_node *node, =
unsigned int flags)
 	if (ipic =3D=3D NULL)
 		return NULL;
=20
-	ipic->irqhost =3D irq_domain_add_linear(node, NR_IPIC_INTS,
-					      &ipic_host_ops, ipic);
+	ipic->irqhost =3D irq_domain_create_linear(of_fwnode_handle(node),
+						 NR_IPIC_INTS,
+						 &ipic_host_ops, ipic);
 	if (ipic->irqhost =3D=3D NULL) {
 		kfree(ipic);
 		return NULL;
@@ -800,7 +801,7 @@ unsigned int ipic_get_irq(void)
 	if (irq =3D=3D 0)    /* 0 --> no irq is pending */
 		return 0;
=20
-	return irq_linear_revmap(primary_ipic->irqhost, irq);
+	return irq_find_mapping(primary_ipic->irqhost, irq);
 }
=20
 #ifdef CONFIG_SUSPEND
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index 4afbab83a2e2..787a88efdb35 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1483,9 +1483,9 @@ struct mpic * __init mpic_alloc(struct device_node *nod=
e,
 	mpic->isu_shift =3D 1 + __ilog2(mpic->isu_size - 1);
 	mpic->isu_mask =3D (1 << mpic->isu_shift) - 1;
=20
-	mpic->irqhost =3D irq_domain_add_linear(mpic->node,
-				       intvec_top,
-				       &mpic_host_ops, mpic);
+	mpic->irqhost =3D irq_domain_create_linear(of_fwnode_handle(mpic->node),
+						 intvec_top,
+						 &mpic_host_ops, mpic);
=20
 	/*
 	 * FIXME: The code leaks the MPIC object and mappings here; this
@@ -1785,7 +1785,7 @@ static unsigned int _mpic_get_one_irq(struct mpic *mpic=
, int reg)
 		return 0;
 	}
=20
-	return irq_linear_revmap(mpic->irqhost, src);
+	return irq_find_mapping(mpic->irqhost, src);
 }
=20
 unsigned int mpic_get_one_irq(struct mpic *mpic)
@@ -1823,7 +1823,7 @@ unsigned int mpic_get_coreint_irq(void)
 		return 0;
 	}
=20
-	return irq_linear_revmap(mpic->irqhost, src);
+	return irq_find_mapping(mpic->irqhost, src);
 #else
 	return 0;
 #endif
diff --git a/arch/powerpc/sysdev/tsi108_pci.c b/arch/powerpc/sysdev/tsi108_pc=
i.c
index 0e42f7bad7db..07d0f6a83879 100644
--- a/arch/powerpc/sysdev/tsi108_pci.c
+++ b/arch/powerpc/sysdev/tsi108_pci.c
@@ -404,8 +404,8 @@ void __init tsi108_pci_int_init(struct device_node *node)
 {
 	DBG("Tsi108_pci_int_init: initializing PCI interrupts\n");
=20
-	pci_irq_host =3D irq_domain_add_legacy(node, NR_IRQS_LEGACY, 0, 0,
-					     &pci_irq_domain_ops, NULL);
+	pci_irq_host =3D irq_domain_create_legacy(of_fwnode_handle(node), NR_IRQS_L=
EGACY, 0, 0,
+						&pci_irq_domain_ops, NULL);
 	if (pci_irq_host =3D=3D NULL) {
 		printk(KERN_ERR "pci_irq_host: failed to allocate irq domain!\n");
 		return;
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/com=
mon.c
index dc2e61837396..f10592405024 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1464,7 +1464,7 @@ static const struct irq_domain_ops xive_irq_domain_ops =
=3D {
=20
 static void __init xive_init_host(struct device_node *np)
 {
-	xive_irq_domain =3D irq_domain_add_tree(np, &xive_irq_domain_ops, NULL);
+	xive_irq_domain =3D irq_domain_create_tree(of_fwnode_handle(np), &xive_irq_=
domain_ops, NULL);
 	if (WARN_ON(xive_irq_domain =3D=3D NULL))
 		return;
 	irq_set_default_domain(xive_irq_domain);
diff --git a/arch/sh/boards/mach-se/7343/irq.c b/arch/sh/boards/mach-se/7343/=
irq.c
index f9f3b14f70d5..730c01b225bd 100644
--- a/arch/sh/boards/mach-se/7343/irq.c
+++ b/arch/sh/boards/mach-se/7343/irq.c
@@ -47,8 +47,9 @@ static void __init se7343_domain_init(void)
 {
 	int i;
=20
-	se7343_irq_domain =3D irq_domain_add_linear(NULL, SE7343_FPGA_IRQ_NR,
-						  &irq_domain_simple_ops, NULL);
+	se7343_irq_domain =3D irq_domain_create_linear(NULL, SE7343_FPGA_IRQ_NR,
+						     &irq_domain_simple_ops,
+						     NULL);
 	if (unlikely(!se7343_irq_domain)) {
 		printk("Failed to get IRQ domain\n");
 		return;
@@ -70,7 +71,7 @@ static void __init se7343_gc_init(void)
 	struct irq_chip_type *ct;
 	unsigned int irq_base;
=20
-	irq_base =3D irq_linear_revmap(se7343_irq_domain, 0);
+	irq_base =3D irq_find_mapping(se7343_irq_domain, 0);
=20
 	gc =3D irq_alloc_generic_chip(DRV_NAME, 1, irq_base, se7343_irq_regs,
 				    handle_level_irq);
diff --git a/arch/sh/boards/mach-se/7722/irq.c b/arch/sh/boards/mach-se/7722/=
irq.c
index efa96edd47dc..49aa3a2b1b8f 100644
--- a/arch/sh/boards/mach-se/7722/irq.c
+++ b/arch/sh/boards/mach-se/7722/irq.c
@@ -46,7 +46,7 @@ static void __init se7722_domain_init(void)
 {
 	int i;
=20
-	se7722_irq_domain =3D irq_domain_add_linear(NULL, SE7722_FPGA_IRQ_NR,
+	se7722_irq_domain =3D irq_domain_create_linear(NULL, SE7722_FPGA_IRQ_NR,
 						  &irq_domain_simple_ops, NULL);
 	if (unlikely(!se7722_irq_domain)) {
 		printk("Failed to get IRQ domain\n");
@@ -69,7 +69,7 @@ static void __init se7722_gc_init(void)
 	struct irq_chip_type *ct;
 	unsigned int irq_base;
=20
-	irq_base =3D irq_linear_revmap(se7722_irq_domain, 0);
+	irq_base =3D irq_find_mapping(se7722_irq_domain, 0);
=20
 	gc =3D irq_alloc_generic_chip(DRV_NAME, 1, irq_base, se7722_irq_regs,
 				    handle_level_irq);
diff --git a/arch/sh/boards/mach-x3proto/gpio.c b/arch/sh/boards/mach-x3proto=
/gpio.c
index f82d3a6a844a..c13d51b29702 100644
--- a/arch/sh/boards/mach-x3proto/gpio.c
+++ b/arch/sh/boards/mach-x3proto/gpio.c
@@ -108,7 +108,7 @@ int __init x3proto_gpio_setup(void)
 	if (unlikely(ret))
 		goto err_gpio;
=20
-	x3proto_irq_domain =3D irq_domain_add_linear(NULL, NR_BASEBOARD_GPIOS,
+	x3proto_irq_domain =3D irq_domain_create_linear(NULL, NR_BASEBOARD_GPIOS,
 						   &x3proto_gpio_irq_ops, NULL);
 	if (unlikely(!x3proto_irq_domain))
 		goto err_irq;
diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index eebc360ed1bb..487992cb0836 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -2225,7 +2225,7 @@ static int mp_irqdomain_create(int ioapic)
=20
 	/* Handle device tree enumerated APICs proper */
 	if (cfg->dev) {
-		fn =3D of_node_to_fwnode(cfg->dev);
+		fn =3D of_fwnode_handle(cfg->dev);
 	} else {
 		fn =3D irq_domain_alloc_named_id_fwnode("IO-APIC", mpc_ioapic_id(ioapic));
 		if (!fn)
diff --git a/drivers/bus/moxtet.c b/drivers/bus/moxtet.c
index 1e57ebfb7622..6c3e5c5dae10 100644
--- a/drivers/bus/moxtet.c
+++ b/drivers/bus/moxtet.c
@@ -737,9 +737,9 @@ static int moxtet_irq_setup(struct moxtet *moxtet)
 {
 	int i, ret;
=20
-	moxtet->irq.domain =3D irq_domain_add_simple(moxtet->dev->of_node,
-						   MOXTET_NIRQS, 0,
-						   &moxtet_irq_domain, moxtet);
+	moxtet->irq.domain =3D irq_domain_create_simple(of_fwnode_handle(moxtet->de=
v->of_node),
+						      MOXTET_NIRQS, 0,
+						      &moxtet_irq_domain, moxtet);
 	if (moxtet->irq.domain =3D=3D NULL) {
 		dev_err(moxtet->dev, "Could not add IRQ domain\n");
 		return -ENOMEM;
diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 3e971f902363..47cea645fc91 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -2130,8 +2130,8 @@ static int altr_edac_a10_probe(struct platform_device *=
pdev)
 	edac->irq_chip.name =3D pdev->dev.of_node->name;
 	edac->irq_chip.irq_mask =3D a10_eccmgr_irq_mask;
 	edac->irq_chip.irq_unmask =3D a10_eccmgr_irq_unmask;
-	edac->domain =3D irq_domain_add_linear(pdev->dev.of_node, 64,
-					     &a10_eccmgr_ic_ops, edac);
+	edac->domain =3D irq_domain_create_linear(of_fwnode_handle(pdev->dev.of_nod=
e),
+						64, &a10_eccmgr_ic_ops, edac);
 	if (!edac->domain) {
 		dev_err(&pdev->dev, "Error adding IRQ domain\n");
 		return -ENOMEM;
diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index ca3472977431..e7671bcd5c07 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -437,7 +437,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device =
*pdev,
 	int err;
=20
 	priv->irq_domain =3D
-		irq_domain_add_linear(np, priv->num_gpios,
+		irq_domain_create_linear(of_fwnode_handle(np), priv->num_gpios,
 				      &brcmstb_gpio_irq_domain_ops,
 				      priv);
 	if (!priv->irq_domain) {
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 63fc7888c1d4..3c3b3ed46d9b 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -479,9 +479,8 @@ static int davinci_gpio_irq_setup(struct platform_device =
*pdev)
 			return irq;
 		}
=20
-		irq_domain =3D irq_domain_add_legacy(dev->of_node, ngpio, irq, 0,
-							&davinci_gpio_irq_ops,
-							chips);
+		irq_domain =3D irq_domain_create_legacy(of_fwnode_handle(dev->of_node), ng=
pio, irq, 0,
+						      &davinci_gpio_irq_ops, chips);
 		if (!irq_domain) {
 			dev_err(dev, "Couldn't register an IRQ domain\n");
 			return -ENODEV;
diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 6c862c572322..8d86f205f53e 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -323,8 +323,9 @@ static int em_gio_probe(struct platform_device *pdev)
 	irq_chip->irq_release_resources =3D em_gio_irq_relres;
 	irq_chip->flags	=3D IRQCHIP_SKIP_SET_WAKE | IRQCHIP_MASK_ON_SUSPEND;
=20
-	p->irq_domain =3D irq_domain_add_simple(dev->of_node, ngpios, 0,
-					      &em_gio_irq_domain_ops, p);
+	p->irq_domain =3D irq_domain_create_simple(of_fwnode_handle(dev->of_node),
+						 ngpios, 0,
+						 &em_gio_irq_domain_ops, p);
 	if (!p->irq_domain) {
 		dev_err(dev, "cannot initialize irq domain\n");
 		return -ENXIO;
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 30a0522ae735..641df8f2fd3d 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -397,7 +397,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 			return -EINVAL;
 		}
=20
-		priv->domain =3D irq_domain_add_linear(np, gc->ngpio,
+		priv->domain =3D irq_domain_create_linear(of_fwnode_handle(np), gc->ngpio,
 						     &grgpio_irq_domain_ops,
 						     priv);
 		if (!priv->domain) {
diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
index 00f547d26254..535f25514455 100644
--- a/drivers/gpio/gpio-idt3243x.c
+++ b/drivers/gpio/gpio-idt3243x.c
@@ -37,7 +37,7 @@ static void idt_gpio_dispatch(struct irq_desc *desc)
 	pending =3D readl(ctrl->pic + IDT_PIC_IRQ_PEND);
 	pending &=3D ~ctrl->mask_cache;
 	for_each_set_bit(bit, &pending, gc->ngpio) {
-		virq =3D irq_linear_revmap(gc->irq.domain, bit);
+		virq =3D irq_find_mapping(gc->irq.domain, bit);
 		if (virq)
 			generic_handle_irq(virq);
 	}
diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
index 2cf9fb4637a2..ae6182cce723 100644
--- a/drivers/gpio/gpio-lpc18xx.c
+++ b/drivers/gpio/gpio-lpc18xx.c
@@ -240,11 +240,9 @@ static int lpc18xx_gpio_pin_ic_probe(struct lpc18xx_gpio=
_chip *gc)
=20
 	raw_spin_lock_init(&ic->lock);
=20
-	ic->domain =3D irq_domain_add_hierarchy(parent_domain, 0,
-					      NR_LPC18XX_GPIO_PIN_IC_IRQS,
-					      dev->of_node,
-					      &lpc18xx_gpio_pin_ic_domain_ops,
-					      ic);
+	ic->domain =3D irq_domain_create_hierarchy(parent_domain, 0, NR_LPC18XX_GPI=
O_PIN_IC_IRQS,
+						 of_fwnode_handle(dev->of_node),
+						 &lpc18xx_gpio_pin_ic_domain_ops, ic);
 	if (!ic->domain) {
 		pr_err("unable to add irq domain\n");
 		ret =3D -ENODEV;
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 3604abcb6fec..4055596faef7 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1242,7 +1242,7 @@ static int mvebu_gpio_probe(struct platform_device *pde=
v)
 		return 0;
=20
 	mvchip->domain =3D
-	    irq_domain_add_linear(np, ngpios, &irq_generic_chip_ops, NULL);
+	    irq_domain_create_linear(of_fwnode_handle(np), ngpios, &irq_generic_chi=
p_ops, NULL);
 	if (!mvchip->domain) {
 		dev_err(&pdev->dev, "couldn't allocate irq domain %s (DT).\n",
 			mvchip->chip.label);
diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 619b6fb9d833..74bc8f06a97a 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -502,7 +502,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		goto out_bgio;
 	}
=20
-	port->domain =3D irq_domain_add_legacy(np, 32, irq_base, 0,
+	port->domain =3D irq_domain_create_legacy(of_fwnode_handle(np), 32, irq_bas=
e, 0,
 					     &irq_domain_simple_ops, NULL);
 	if (!port->domain) {
 		err =3D -ENODEV;
diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 024ad077e98d..b418fbccb26c 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -303,8 +303,8 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 		goto out_iounmap;
 	}
=20
-	port->domain =3D irq_domain_add_legacy(np, 32, irq_base, 0,
-					     &irq_domain_simple_ops, NULL);
+	port->domain =3D irq_domain_create_legacy(of_fwnode_handle(np), 32, irq_bas=
e, 0,
+						&irq_domain_simple_ops, NULL);
 	if (!port->domain) {
 		err =3D -ENODEV;
 		goto out_iounmap;
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 91cea97255fa..c3dfaed45c43 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -636,9 +636,9 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 	if (!pxa_last_gpio)
 		return -EINVAL;
=20
-	pchip->irqdomain =3D irq_domain_add_legacy(pdev->dev.of_node,
-						 pxa_last_gpio + 1, irq_base,
-						 0, &pxa_irq_domain_ops, pchip);
+	pchip->irqdomain =3D irq_domain_create_legacy(of_fwnode_handle(pdev->dev.of=
_node),
+						    pxa_last_gpio + 1, irq_base, 0,
+						    &pxa_irq_domain_ops, pchip);
 	if (!pchip->irqdomain)
 		return -ENOMEM;
=20
diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 01a3b3dac58b..c63352f2f1ec 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -521,7 +521,7 @@ static int rockchip_interrupts_register(struct rockchip_p=
in_bank *bank)
 	struct irq_chip_generic *gc;
 	int ret;
=20
-	bank->domain =3D irq_domain_add_linear(bank->of_node, 32,
+	bank->domain =3D irq_domain_create_linear(of_fwnode_handle(bank->of_node), =
32,
 					&irq_generic_chip_ops, NULL);
 	if (!bank->domain) {
 		dev_warn(bank->dev, "could not init irq domain for bank %s\n",
diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 242dad763ac4..3f3ee36bc3cb 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -319,7 +319,7 @@ void __init sa1100_init_gpio(void)
=20
 	gpiochip_add_data(&sa1100_gpio_chip.chip, NULL);
=20
-	sa1100_gpio_irqdomain =3D irq_domain_add_simple(NULL,
+	sa1100_gpio_irqdomain =3D irq_domain_create_simple(NULL,
 			28, IRQ_GPIO0,
 			&sa1100_gpio_irqdomain_ops, sgc);
=20
diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index c2a2c76c1652..6a3c4c625138 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -169,7 +169,7 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_d=
ata *sd,
 			IRQ_GC_INIT_MASK_CACHE, IRQ_NOREQUEST,
 			IRQ_LEVEL | IRQ_NOPROBE);
=20
-	sd->id =3D irq_domain_add_legacy(pdev->dev.of_node, SDV_NUM_PUB_GPIOS,
+	sd->id =3D irq_domain_create_legacy(of_fwnode_handle(pdev->dev.of_node), SD=
V_NUM_PUB_GPIOS,
 				sd->irq_base, 0, &irq_domain_sdv_ops, sd);
 	if (!sd->id)
 		return -ENODEV;
diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index b6335cde455f..8cf676fd0a0b 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -183,7 +183,7 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 		if (ret !=3D 0)
 			return ret;
=20
-		tb10x_gpio->domain =3D irq_domain_add_linear(np,
+		tb10x_gpio->domain =3D irq_domain_create_linear(of_fwnode_handle(np),
 						tb10x_gpio->gc.ngpio,
 						&irq_generic_chip_ops, NULL);
 		if (!tb10x_gpio->domain) {
diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index bcd692229c7c..0d17985a5fdc 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -502,7 +502,6 @@ static void gpio_twl4030_power_off_action(void *data)
 static int gpio_twl4030_probe(struct platform_device *pdev)
 {
 	struct twl4030_gpio_platform_data *pdata;
-	struct device_node *node =3D pdev->dev.of_node;
 	struct gpio_twl4030_priv *priv;
 	int ret, irq_base;
=20
@@ -524,8 +523,8 @@ static int gpio_twl4030_probe(struct platform_device *pde=
v)
 		return irq_base;
 	}
=20
-	irq_domain_add_legacy(node, TWL4030_GPIO_MAX, irq_base, 0,
-			      &irq_domain_simple_ops, NULL);
+	irq_domain_create_legacy(of_fwnode_handle(pdev->dev.of_node), TWL4030_GPIO_=
MAX, irq_base, 0,
+				 &irq_domain_simple_ops, NULL);
=20
 	ret =3D twl4030_sih_setup(&pdev->dev, TWL4030_MODULE_GPIO, irq_base);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/am=
dgpu/amdgpu_irq.c
index 19ce4da285e8..38e7043016e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -725,8 +725,8 @@ static const struct irq_domain_ops amdgpu_hw_irqdomain_op=
s =3D {
  */
 int amdgpu_irq_add_domain(struct amdgpu_device *adev)
 {
-	adev->irq.domain =3D irq_domain_add_linear(NULL, AMDGPU_MAX_IRQ_SRC_ID,
-						 &amdgpu_hw_irqdomain_ops, adev);
+	adev->irq.domain =3D irq_domain_create_linear(NULL, AMDGPU_MAX_IRQ_SRC_ID,
+						    &amdgpu_hw_irqdomain_ops, adev);
 	if (!adev->irq.domain) {
 		DRM_ERROR("GPU irq add domain failed\n");
 		return -ENODEV;
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402..9d006ee88a8a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -150,7 +150,7 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_=
mdss)
=20
 	dev =3D msm_mdss->dev;
=20
-	domain =3D irq_domain_add_linear(dev->of_node, 32,
+	domain =3D irq_domain_create_linear(of_fwnode_handle(dev->of_node), 32,
 			&msm_mdss_irqdomain_ops, msm_mdss);
 	if (!domain) {
 		dev_err(dev, "failed to add irq_domain\n");
diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index fa77e4e64f12..333f36e0a715 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -1008,7 +1008,7 @@ int ipu_map_irq(struct ipu_soc *ipu, int irq)
 {
 	int virq;
=20
-	virq =3D irq_linear_revmap(ipu->domain, irq);
+	virq =3D irq_find_mapping(ipu->domain, irq);
 	if (!virq)
 		virq =3D irq_create_mapping(ipu->domain, irq);
=20
@@ -1169,8 +1169,8 @@ static int ipu_irq_init(struct ipu_soc *ipu)
 	};
 	int ret, i;
=20
-	ipu->domain =3D irq_domain_add_linear(ipu->dev->of_node, IPU_NUM_IRQS,
-					    &irq_generic_chip_ops, ipu);
+	ipu->domain =3D irq_domain_create_linear(of_fwnode_handle(ipu->dev->of_node=
), IPU_NUM_IRQS,
+					       &irq_generic_chip_ops, ipu);
 	if (!ipu->domain) {
 		dev_err(ipu->dev, "failed to add irq domain\n");
 		return -ENODEV;
@@ -1219,7 +1219,7 @@ static void ipu_irq_exit(struct ipu_soc *ipu)
 	/* TODO: remove irq_domain_generic_chips */
=20
 	for (i =3D 0; i < IPU_NUM_IRQS; i++) {
-		irq =3D irq_linear_revmap(ipu->domain, i);
+		irq =3D irq_find_mapping(ipu->domain, i);
 		if (irq)
 			irq_dispose_mapping(irq);
 	}
diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index 26a36a65521e..606ac071cb80 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -467,7 +467,7 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_devi=
ce *pdev)
 		return ret;
=20
 	/* Alloc and register client IRQ */
-	adap->irq_domain =3D irq_domain_add_linear(NULL, 1, &irq_domain_simple_ops,=
 NULL);
+	adap->irq_domain =3D irq_domain_create_linear(NULL, 1, &irq_domain_simple_o=
ps, NULL);
 	if (!adap->irq_domain)
 		return -ENOMEM;
=20
diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-=
pca954x.c
index db95113a5b49..5bb26af0f532 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -442,9 +442,9 @@ static int pca954x_irq_setup(struct i2c_mux_core *muxc)
=20
 	raw_spin_lock_init(&data->lock);
=20
-	data->irq =3D irq_domain_add_linear(client->dev.of_node,
-					  data->chip->nchans,
-					  &irq_domain_simple_ops, data);
+	data->irq =3D irq_domain_create_linear(of_fwnode_handle(client->dev.of_node=
),
+					     data->chip->nchans,
+					     &irq_domain_simple_ops, data);
 	if (!data->irq)
 		return -ENODEV;
=20
diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-cor=
e.c
index 0914148d1a22..bd3458965bff 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -421,9 +421,10 @@ static int stm32_adc_irq_probe(struct platform_device *p=
dev,
 			return priv->irq[i];
 	}
=20
-	priv->domain =3D irq_domain_add_simple(np, STM32_ADC_MAX_ADCS, 0,
-					     &stm32_adc_domain_ops,
-					     priv);
+	priv->domain =3D irq_domain_create_simple(of_fwnode_handle(np),
+						STM32_ADC_MAX_ADCS, 0,
+						&stm32_adc_domain_ops,
+						priv);
 	if (!priv->domain) {
 		dev_err(&pdev->dev, "Failed to add irq domain\n");
 		return -ENOMEM;
diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combi=
ner.c
index 552aa04ff063..e7dfcf0cda43 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -180,7 +180,7 @@ static void __init combiner_init(void __iomem *combiner_b=
ase,
 	if (!combiner_data)
 		return;
=20
-	combiner_irq_domain =3D irq_domain_add_linear(np, nr_irq,
+	combiner_irq_domain =3D irq_domain_create_linear(of_fwnode_handle(np), nr_i=
rq,
 				&combiner_irq_domain_ops, combiner_data);
 	if (WARN_ON(!combiner_irq_domain)) {
 		pr_warn("%s: irq domain init failed\n", __func__);
diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index dfb761e86c9c..c980e822a10a 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -139,7 +139,7 @@ static int al_fic_register(struct device_node *node,
 	struct irq_chip_generic *gc;
 	int ret;
=20
-	fic->domain =3D irq_domain_add_linear(node,
+	fic->domain =3D irq_domain_create_linear(of_fwnode_handle(node),
 					    NR_FIC_IRQS,
 					    &irq_generic_chip_ops,
 					    fic);
diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-ms=
i.c
index a1430ab60a8a..a5289dc26dca 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -205,15 +205,14 @@ static int alpine_msix_init_domains(struct alpine_msix_=
data *priv,
 		return -ENXIO;
 	}
=20
-	middle_domain =3D irq_domain_add_hierarchy(gic_domain, 0, 0, NULL,
-						 &alpine_msix_middle_domain_ops,
-						 priv);
+	middle_domain =3D irq_domain_create_hierarchy(gic_domain, 0, 0, NULL,
+						    &alpine_msix_middle_domain_ops, priv);
 	if (!middle_domain) {
 		pr_err("Failed to create the MSIX middle domain\n");
 		return -ENOMEM;
 	}
=20
-	msi_domain =3D pci_msi_create_irq_domain(of_node_to_fwnode(node),
+	msi_domain =3D pci_msi_create_irq_domain(of_fwnode_handle(node),
 					       &alpine_msix_domain_info,
 					       middle_domain);
 	if (!msi_domain) {
diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 974dc088c853..032d66dceb8e 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -1014,7 +1014,7 @@ static int __init aic_of_ic_init(struct device_node *no=
de, struct device_node *p
=20
 	irqc->info.die_stride =3D off - start_off;
=20
-	irqc->hw_domain =3D irq_domain_create_tree(of_node_to_fwnode(node),
+	irqc->hw_domain =3D irq_domain_create_tree(of_fwnode_handle(node),
 						 &aic_irq_domain_ops, irqc);
 	if (WARN_ON(!irqc->hw_domain))
 		goto err_unmap;
@@ -1067,7 +1067,7 @@ static int __init aic_of_ic_init(struct device_node *no=
de, struct device_node *p
=20
 	if (is_kernel_in_hyp_mode()) {
 		struct irq_fwspec mi =3D {
-			.fwnode		=3D of_node_to_fwnode(node),
+			.fwnode		=3D of_fwnode_handle(node),
 			.param_count	=3D 3,
 			.param		=3D {
 				[0]	=3D AIC_FIQ, /* This is a lie */
diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada=
-370-xp.c
index 2aa6a51e05d0..67b672a78862 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -348,12 +348,12 @@ static int __init mpic_msi_init(struct mpic *mpic, stru=
ct device_node *node,
 		mpic->msi_doorbell_mask =3D PCI_MSI_FULL_DOORBELL_MASK;
 	}
=20
-	mpic->msi_inner_domain =3D irq_domain_add_linear(NULL, mpic->msi_doorbell_s=
ize,
+	mpic->msi_inner_domain =3D irq_domain_create_linear(NULL, mpic->msi_doorbel=
l_size,
 						       &mpic_msi_domain_ops, mpic);
 	if (!mpic->msi_inner_domain)
 		return -ENOMEM;
=20
-	mpic->msi_domain =3D pci_msi_create_irq_domain(of_node_to_fwnode(node), &mp=
ic_msi_domain_info,
+	mpic->msi_domain =3D pci_msi_create_irq_domain(of_fwnode_handle(node), &mpi=
c_msi_domain_info,
 						     mpic->msi_inner_domain);
 	if (!mpic->msi_domain) {
 		irq_domain_remove(mpic->msi_inner_domain);
@@ -492,7 +492,7 @@ static int __init mpic_ipi_init(struct mpic *mpic, struct=
 device_node *node)
 {
 	int base_ipi;
=20
-	mpic->ipi_domain =3D irq_domain_create_linear(of_node_to_fwnode(node), IPI_=
DOORBELL_NR,
+	mpic->ipi_domain =3D irq_domain_create_linear(of_fwnode_handle(node), IPI_D=
OORBELL_NR,
 						    &mpic_ipi_domain_ops, mpic);
 	if (WARN_ON(!mpic->ipi_domain))
 		return -ENOMEM;
@@ -546,7 +546,7 @@ static void mpic_reenable_percpu(struct mpic *mpic)
 {
 	/* Re-enable per-CPU interrupts that were enabled before suspend */
 	for (irq_hw_number_t i =3D 0; i < MPIC_PER_CPU_IRQS_NR; i++) {
-		unsigned int virq =3D irq_linear_revmap(mpic->domain, i);
+		unsigned int virq =3D irq_find_mapping(mpic->domain, i);
 		struct irq_data *d;
=20
 		if (!virq || !irq_percpu_is_enabled(virq))
@@ -740,7 +740,7 @@ static void mpic_resume(void)
=20
 	/* Re-enable interrupts */
 	for (irq_hw_number_t i =3D 0; i < mpic->domain->hwirq_max; i++) {
-		unsigned int virq =3D irq_linear_revmap(mpic->domain, i);
+		unsigned int virq =3D irq_find_mapping(mpic->domain, i);
 		struct irq_data *d;
=20
 		if (!virq)
@@ -861,7 +861,7 @@ static int __init mpic_of_init(struct device_node *node, =
struct device_node *par
 	if (!mpic_is_ipi_available(mpic))
 		nr_irqs =3D MPIC_PER_CPU_IRQS_NR;
=20
-	mpic->domain =3D irq_domain_add_linear(node, nr_irqs, &mpic_irq_ops, mpic);
+	mpic->domain =3D irq_domain_create_linear(of_fwnode_handle(node), nr_irqs, =
&mpic_irq_ops, mpic);
 	if (!mpic->domain) {
 		pr_err("%pOF: Unable to add IRQ domain\n", node);
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed=
-i2c-ic.c
index 9c9fc3e2967e..87c1feb999ff 100644
--- a/drivers/irqchip/irq-aspeed-i2c-ic.c
+++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
@@ -82,7 +82,7 @@ static int __init aspeed_i2c_ic_of_init(struct device_node =
*node,
 		goto err_iounmap;
 	}
=20
-	i2c_ic->irq_domain =3D irq_domain_add_linear(node, ASPEED_I2C_IC_NUM_BUS,
+	i2c_ic->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(node), ASP=
EED_I2C_IC_NUM_BUS,
 						   &aspeed_i2c_ic_irq_domain_ops,
 						   NULL);
 	if (!i2c_ic->irq_domain) {
diff --git a/drivers/irqchip/irq-aspeed-intc.c b/drivers/irqchip/irq-aspeed-i=
ntc.c
index bd3b759b4b2c..8330221799a0 100644
--- a/drivers/irqchip/irq-aspeed-intc.c
+++ b/drivers/irqchip/irq-aspeed-intc.c
@@ -102,7 +102,7 @@ static int __init aspeed_intc_ic_of_init(struct device_no=
de *node,
 	writel(0xffffffff, intc_ic->base + INTC_INT_STATUS_REG);
 	writel(0x0, intc_ic->base + INTC_INT_ENABLE_REG);
=20
-	intc_ic->irq_domain =3D irq_domain_add_linear(node, INTC_IRQS_PER_WORD,
+	intc_ic->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(node), IN=
TC_IRQS_PER_WORD,
 						    &aspeed_intc_ic_irq_domain_ops, intc_ic);
 	if (!intc_ic->irq_domain) {
 		ret =3D -ENOMEM;
diff --git a/drivers/irqchip/irq-aspeed-scu-ic.c b/drivers/irqchip/irq-aspeed=
-scu-ic.c
index 94a7223e95df..1c7045467c48 100644
--- a/drivers/irqchip/irq-aspeed-scu-ic.c
+++ b/drivers/irqchip/irq-aspeed-scu-ic.c
@@ -165,7 +165,7 @@ static int aspeed_scu_ic_of_init_common(struct aspeed_scu=
_ic *scu_ic,
 		goto err;
 	}
=20
-	scu_ic->irq_domain =3D irq_domain_add_linear(node, scu_ic->num_irqs,
+	scu_ic->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(node), scu=
_ic->num_irqs,
 						   &aspeed_scu_ic_domain_ops,
 						   scu_ic);
 	if (!scu_ic->irq_domain) {
diff --git a/drivers/irqchip/irq-aspeed-vic.c b/drivers/irqchip/irq-aspeed-vi=
c.c
index 62ccf2c0c414..9b665b5bb531 100644
--- a/drivers/irqchip/irq-aspeed-vic.c
+++ b/drivers/irqchip/irq-aspeed-vic.c
@@ -211,8 +211,8 @@ static int __init avic_of_init(struct device_node *node,
 	set_handle_irq(avic_handle_irq);
=20
 	/* Register our domain */
-	vic->dom =3D irq_domain_add_simple(node, NUM_IRQS, 0,
-					 &avic_dom_ops, vic);
+	vic->dom =3D irq_domain_create_simple(of_fwnode_handle(node), NUM_IRQS, 0,
+					    &avic_dom_ops, vic);
=20
 	return 0;
 }
diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-mis=
c.c
index 92f001a5ff8d..268cc18b781f 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -147,7 +147,7 @@ static int __init ath79_misc_intc_of_init(
 		return -ENOMEM;
 	}
=20
-	domain =3D irq_domain_add_linear(node, ATH79_MISC_IRQ_COUNT,
+	domain =3D irq_domain_create_linear(of_fwnode_handle(node), ATH79_MISC_IRQ_=
COUNT,
 				&misc_irq_domain_ops, base);
 	if (!domain) {
 		pr_err("Failed to add MISC irqdomain\n");
@@ -188,7 +188,7 @@ void __init ath79_misc_irq_init(void __iomem *regs, int i=
rq,
 	else
 		ath79_misc_irq_chip.irq_ack =3D ar724x_misc_irq_ack;
=20
-	domain =3D irq_domain_add_legacy(NULL, ATH79_MISC_IRQ_COUNT,
+	domain =3D irq_domain_create_legacy(NULL, ATH79_MISC_IRQ_COUNT,
 			irq_base, 0, &misc_irq_domain_ops, regs);
 	if (!domain)
 		panic("Failed to create MISC irqdomain");
diff --git a/drivers/irqchip/irq-atmel-aic-common.c b/drivers/irqchip/irq-atm=
el-aic-common.c
index 4525366d16d6..3cad30a40c19 100644
--- a/drivers/irqchip/irq-atmel-aic-common.c
+++ b/drivers/irqchip/irq-atmel-aic-common.c
@@ -228,7 +228,7 @@ struct irq_domain *__init aic_common_of_init(struct devic=
e_node *node,
 		goto err_iounmap;
 	}
=20
-	domain =3D irq_domain_add_linear(node, nchips * 32, ops, aic);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(node), nchips * 32, op=
s, aic);
 	if (!domain) {
 		ret =3D -ENOMEM;
 		goto err_free_aic;
diff --git a/drivers/irqchip/irq-bcm2712-mip.c b/drivers/irqchip/irq-bcm2712-=
mip.c
index 49a19db2d1e1..c546a063c8d8 100644
--- a/drivers/irqchip/irq-bcm2712-mip.c
+++ b/drivers/irqchip/irq-bcm2712-mip.c
@@ -173,8 +173,8 @@ static int mip_init_domains(struct mip_priv *mip, struct =
device_node *np)
 {
 	struct irq_domain *middle;
=20
-	middle =3D irq_domain_add_hierarchy(mip->parent, 0, mip->num_msis, np,
-					  &mip_middle_domain_ops, mip);
+	middle =3D irq_domain_create_hierarchy(mip->parent, 0, mip->num_msis, of_fw=
node_handle(np),
+					     &mip_middle_domain_ops, mip);
 	if (!middle)
 		return -ENOMEM;
=20
diff --git a/drivers/irqchip/irq-bcm2835.c b/drivers/irqchip/irq-bcm2835.c
index 6c20604c2242..1e384c870350 100644
--- a/drivers/irqchip/irq-bcm2835.c
+++ b/drivers/irqchip/irq-bcm2835.c
@@ -144,7 +144,7 @@ static int __init armctrl_of_init(struct device_node *nod=
e,
 	if (!base)
 		panic("%pOF: unable to map IC registers\n", node);
=20
-	intc.domain =3D irq_domain_add_linear(node, MAKE_HWIRQ(NR_BANKS, 0),
+	intc.domain =3D irq_domain_create_linear(of_fwnode_handle(node), MAKE_HWIRQ=
(NR_BANKS, 0),
 			&armctrl_ops, NULL);
 	if (!intc.domain)
 		panic("%pOF: unable to create IRQ domain\n", node);
diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836.c
index e366257684b5..fafd1f71348e 100644
--- a/drivers/irqchip/irq-bcm2836.c
+++ b/drivers/irqchip/irq-bcm2836.c
@@ -325,7 +325,7 @@ static int __init bcm2836_arm_irqchip_l1_intc_of_init(str=
uct device_node *node,
=20
 	bcm2835_init_local_timer_frequency();
=20
-	intc.domain =3D irq_domain_add_linear(node, LAST_IRQ + 1,
+	intc.domain =3D irq_domain_create_linear(of_fwnode_handle(node), LAST_IRQ +=
 1,
 					    &bcm2836_arm_irqchip_intc_ops,
 					    NULL);
 	if (!intc.domain)
diff --git a/drivers/irqchip/irq-bcm6345-l1.c b/drivers/irqchip/irq-bcm6345-l=
1.c
index 90daa274ef23..ca4e141c5bc2 100644
--- a/drivers/irqchip/irq-bcm6345-l1.c
+++ b/drivers/irqchip/irq-bcm6345-l1.c
@@ -316,7 +316,7 @@ static int __init bcm6345_l1_of_init(struct device_node *=
dn,
=20
 	raw_spin_lock_init(&intc->lock);
=20
-	intc->domain =3D irq_domain_add_linear(dn, IRQS_PER_WORD * intc->n_words,
+	intc->domain =3D irq_domain_create_linear(of_fwnode_handle(dn), IRQS_PER_WO=
RD * intc->n_words,
 					     &bcm6345_l1_domain_ops,
 					     intc);
 	if (!intc->domain) {
diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l=
1.c
index 36e71af054e9..04fac0cc857f 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -416,7 +416,7 @@ static int __init bcm7038_l1_of_init(struct device_node *=
dn,
 		}
 	}
=20
-	intc->domain =3D irq_domain_add_linear(dn, IRQS_PER_WORD * intc->n_words,
+	intc->domain =3D irq_domain_create_linear(of_fwnode_handle(dn), IRQS_PER_WO=
RD * intc->n_words,
 					     &bcm7038_l1_domain_ops,
 					     intc);
 	if (!intc->domain) {
diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l=
2.c
index 1e9dab6e0d86..8a7c088d2081 100644
--- a/drivers/irqchip/irq-bcm7120-l2.c
+++ b/drivers/irqchip/irq-bcm7120-l2.c
@@ -264,7 +264,7 @@ static int __init bcm7120_l2_intc_probe(struct device_nod=
e *dn,
 			goto out_free_l1_data;
 	}
=20
-	data->domain =3D irq_domain_add_linear(dn, IRQS_PER_WORD * data->n_words,
+	data->domain =3D irq_domain_create_linear(of_fwnode_handle(dn), IRQS_PER_WO=
RD * data->n_words,
 					     &irq_generic_chip_ops, NULL);
 	if (!data->domain) {
 		ret =3D -ENOMEM;
diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l=
2.c
index db4c9721fcf2..d15ca092742c 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -182,7 +182,7 @@ static int __init brcmstb_l2_intc_of_init(struct device_n=
ode *np,
 		goto out_unmap;
 	}
=20
-	data->domain =3D irq_domain_add_linear(np, 32,
+	data->domain =3D irq_domain_create_linear(of_fwnode_handle(np), 32,
 				&irq_generic_chip_ops, NULL);
 	if (!data->domain) {
 		ret =3D -ENOMEM;
diff --git a/drivers/irqchip/irq-clps711x.c b/drivers/irqchip/irq-clps711x.c
index 48c73c948ddf..c4b73ba2323b 100644
--- a/drivers/irqchip/irq-clps711x.c
+++ b/drivers/irqchip/irq-clps711x.c
@@ -184,8 +184,8 @@ static int __init _clps711x_intc_init(struct device_node =
*np,
 	clps711x_intc->ops.map =3D clps711x_intc_irq_map;
 	clps711x_intc->ops.xlate =3D irq_domain_xlate_onecell;
 	clps711x_intc->domain =3D
-		irq_domain_add_legacy(np, ARRAY_SIZE(clps711x_irqs),
-				      0, 0, &clps711x_intc->ops, NULL);
+		irq_domain_create_legacy(of_fwnode_handle(np), ARRAY_SIZE(clps711x_irqs), =
0, 0,
+					 &clps711x_intc->ops, NULL);
 	if (!clps711x_intc->domain) {
 		err =3D -ENOMEM;
 		goto out_irqfree;
diff --git a/drivers/irqchip/irq-crossbar.c b/drivers/irqchip/irq-crossbar.c
index a05a7501e107..66bb39e24a52 100644
--- a/drivers/irqchip/irq-crossbar.c
+++ b/drivers/irqchip/irq-crossbar.c
@@ -351,10 +351,8 @@ static int __init irqcrossbar_init(struct device_node *n=
ode,
 	if (err)
 		return err;
=20
-	domain =3D irq_domain_add_hierarchy(parent_domain, 0,
-					  cb->max_crossbar_sources,
-					  node, &crossbar_domain_ops,
-					  NULL);
+	domain =3D irq_domain_create_hierarchy(parent_domain, 0, cb->max_crossbar_s=
ources,
+					     of_fwnode_handle(node), &crossbar_domain_ops, NULL);
 	if (!domain) {
 		pr_err("%pOF: failed to allocated domain\n", node);
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-csky-apb-intc.c b/drivers/irqchip/irq-csky-a=
pb-intc.c
index 6710691e4c25..a970f4806f31 100644
--- a/drivers/irqchip/irq-csky-apb-intc.c
+++ b/drivers/irqchip/irq-csky-apb-intc.c
@@ -114,7 +114,7 @@ ck_intc_init_comm(struct device_node *node, struct device=
_node *parent)
 		return -EINVAL;
 	}
=20
-	root_domain =3D irq_domain_add_linear(node, nr_irq,
+	root_domain =3D irq_domain_create_linear(of_fwnode_handle(node), nr_irq,
 					    &irq_generic_chip_ops, NULL);
 	if (!root_domain) {
 		pr_err("C-SKY Intc irq_domain_add failed.\n");
diff --git a/drivers/irqchip/irq-csky-mpintc.c b/drivers/irqchip/irq-csky-mpi=
ntc.c
index 4aebd67d4f8f..1d1f5091f26f 100644
--- a/drivers/irqchip/irq-csky-mpintc.c
+++ b/drivers/irqchip/irq-csky-mpintc.c
@@ -255,7 +255,7 @@ csky_mpintc_init(struct device_node *node, struct device_=
node *parent)
 		writel_relaxed(BIT(0), INTCG_base + INTCG_ICTLR);
 	}
=20
-	root_domain =3D irq_domain_add_linear(node, nr_irq, &csky_irqdomain_ops,
+	root_domain =3D irq_domain_create_linear(of_fwnode_handle(node), nr_irq, &c=
sky_irqdomain_ops,
 					    NULL);
 	if (!root_domain)
 		return -ENXIO;
diff --git a/drivers/irqchip/irq-davinci-cp-intc.c b/drivers/irqchip/irq-davi=
nci-cp-intc.c
index d7948c55f542..00cdcc90f614 100644
--- a/drivers/irqchip/irq-davinci-cp-intc.c
+++ b/drivers/irqchip/irq-davinci-cp-intc.c
@@ -204,8 +204,10 @@ static int __init davinci_cp_intc_do_init(struct resourc=
e *res, unsigned int num
 		return irq_base;
 	}
=20
-	davinci_cp_intc_irq_domain =3D irq_domain_add_legacy(node, num_irqs, irq_ba=
se, 0,
-							   &davinci_cp_intc_irq_domain_ops, NULL);
+	davinci_cp_intc_irq_domain =3D irq_domain_create_legacy(of_fwnode_handle(no=
de), num_irqs,
+							      irq_base, 0,
+							      &davinci_cp_intc_irq_domain_ops,
+							      NULL);
=20
 	if (!davinci_cp_intc_irq_domain) {
 		pr_err("%s: unable to create an interrupt domain\n", __func__);
diff --git a/drivers/irqchip/irq-digicolor.c b/drivers/irqchip/irq-digicolor.c
index 3b0d78aac13b..eb5a8de82751 100644
--- a/drivers/irqchip/irq-digicolor.c
+++ b/drivers/irqchip/irq-digicolor.c
@@ -95,7 +95,7 @@ static int __init digicolor_of_init(struct device_node *nod=
e,
 	regmap_write(ucregs, UC_IRQ_CONTROL, 1);
=20
 	digicolor_irq_domain =3D
-		irq_domain_add_linear(node, 64, &irq_generic_chip_ops, NULL);
+		irq_domain_create_linear(of_fwnode_handle(node), 64, &irq_generic_chip_ops=
, NULL);
 	if (!digicolor_irq_domain) {
 		pr_err("%pOF: unable to create IRQ domain\n", node);
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-dw-apb-ictl.c b/drivers/irqchip/irq-dw-apb-i=
ctl.c
index d5c1c750c8d2..c8a6d62ccb47 100644
--- a/drivers/irqchip/irq-dw-apb-ictl.c
+++ b/drivers/irqchip/irq-dw-apb-ictl.c
@@ -173,7 +173,7 @@ static int __init dw_apb_ictl_init(struct device_node *np,
 	else
 		nrirqs =3D fls(readl_relaxed(iobase + APB_INT_ENABLE_L));
=20
-	domain =3D irq_domain_add_linear(np, nrirqs, domain_ops, NULL);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(np), nrirqs, domain_op=
s, NULL);
 	if (!domain) {
 		pr_err("%pOF: unable to add irq domain\n", np);
 		ret =3D -ENOMEM;
diff --git a/drivers/irqchip/irq-ftintc010.c b/drivers/irqchip/irq-ftintc010.c
index b91c358ea6db..a59a66d79da6 100644
--- a/drivers/irqchip/irq-ftintc010.c
+++ b/drivers/irqchip/irq-ftintc010.c
@@ -180,8 +180,9 @@ static int __init ft010_of_init_irq(struct device_node *n=
ode,
 	writel(0, FT010_IRQ_MASK(f->base));
 	writel(0, FT010_FIQ_MASK(f->base));
=20
-	f->domain =3D irq_domain_add_simple(node, FT010_NUM_IRQS, 0,
-					  &ft010_irqdomain_ops, f);
+	f->domain =3D irq_domain_create_simple(of_fwnode_handle(node),
+					     FT010_NUM_IRQS, 0,
+					     &ft010_irqdomain_ops, f);
 	set_handle_irq(ft010_irqchip_handle_irq);
=20
 	return 0;
diff --git a/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c b/drivers/irqchip/ir=
q-gic-v3-its-fsl-mc-msi.c
index 8e87fc35f8aa..11549d85f23b 100644
--- a/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
+++ b/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
@@ -152,7 +152,7 @@ static void __init its_fsl_mc_of_msi_init(void)
 		if (!of_property_read_bool(np, "msi-controller"))
 			continue;
=20
-		its_fsl_mc_msi_init_one(of_node_to_fwnode(np),
+		its_fsl_mc_msi_init_one(of_fwnode_handle(np),
 					np->full_name);
 	}
 }
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 270d7a4d85a6..efc791c43d44 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1826,7 +1826,7 @@ static int partition_domain_translate(struct irq_domain=
 *d,
=20
 	ppi_idx =3D __gic_get_ppi_index(ppi_intid);
 	ret =3D partition_translate_id(gic_data.ppi_descs[ppi_idx],
-				     of_node_to_fwnode(np));
+				     of_fwnode_handle(np));
 	if (ret < 0)
 		return ret;
=20
@@ -2192,7 +2192,7 @@ static void __init gic_populate_ppi_partitions(struct d=
evice_node *gic_node)
=20
 		part =3D &parts[part_idx];
=20
-		part->partition_id =3D of_node_to_fwnode(child_part);
+		part->partition_id =3D of_fwnode_handle(child_part);
=20
 		pr_info("GIC: PPI partition %pOFn[%d] { ",
 			child_part, part_idx);
diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfis=
h-pic.c
index 513f6edbbe95..a8b23b507ecd 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -101,10 +101,9 @@ static int __init goldfish_pic_of_init(struct device_nod=
e *of_node,
 	irq_setup_generic_chip(gc, IRQ_MSK(GFPIC_NR_IRQS), 0,
 			       IRQ_NOPROBE | IRQ_LEVEL, 0);
=20
-	gfpic->irq_domain =3D irq_domain_add_legacy(of_node, GFPIC_NR_IRQS,
-						  GFPIC_IRQ_BASE, 0,
-						  &goldfish_irq_domain_ops,
-						  NULL);
+	gfpic->irq_domain =3D irq_domain_create_legacy(of_fwnode_handle(of_node), G=
FPIC_NR_IRQS,
+						     GFPIC_IRQ_BASE, 0, &goldfish_irq_domain_ops,
+						     NULL);
 	if (!gfpic->irq_domain) {
 		pr_err("Failed to add irqdomain!\n");
 		ret =3D -ENOMEM;
diff --git a/drivers/irqchip/irq-hip04.c b/drivers/irqchip/irq-hip04.c
index 31c3f70a5d5e..b7958c5a1221 100644
--- a/drivers/irqchip/irq-hip04.c
+++ b/drivers/irqchip/irq-hip04.c
@@ -386,10 +386,8 @@ hip04_of_init(struct device_node *node, struct device_no=
de *parent)
 		return -EINVAL;
 	}
=20
-	hip04_data.domain =3D irq_domain_add_legacy(node, nr_irqs, irq_base,
-						  0,
-						  &hip04_irq_domain_ops,
-						  &hip04_data);
+	hip04_data.domain =3D irq_domain_create_legacy(of_fwnode_handle(node), nr_i=
rqs, irq_base, 0,
+						     &hip04_irq_domain_ops, &hip04_data);
 	if (WARN_ON(!hip04_data.domain))
 		return -EINVAL;
=20
diff --git a/drivers/irqchip/irq-i8259.c b/drivers/irqchip/irq-i8259.c
index 115bdcffab24..91b2f587119c 100644
--- a/drivers/irqchip/irq-i8259.c
+++ b/drivers/irqchip/irq-i8259.c
@@ -313,8 +313,8 @@ struct irq_domain * __init __init_i8259_irqs(struct devic=
e_node *node)
=20
 	init_8259A(0);
=20
-	domain =3D irq_domain_add_legacy(node, 16, I8259A_IRQ_BASE, 0,
-				       &i8259A_ops, NULL);
+	domain =3D irq_domain_create_legacy(of_fwnode_handle(node), 16, I8259A_IRQ_=
BASE, 0,
+					  &i8259A_ops, NULL);
 	if (!domain)
 		panic("Failed to add i8259 IRQ domain");
=20
diff --git a/drivers/irqchip/irq-idt3243x.c b/drivers/irqchip/irq-idt3243x.c
index 0732a0e9af62..f8324fb1fe8f 100644
--- a/drivers/irqchip/irq-idt3243x.c
+++ b/drivers/irqchip/irq-idt3243x.c
@@ -72,7 +72,7 @@ static int idt_pic_init(struct device_node *of_node, struct=
 device_node *parent)
 		goto out_unmap_irq;
 	}
=20
-	domain =3D irq_domain_add_linear(of_node, IDT_PIC_NR_IRQS,
+	domain =3D irq_domain_create_linear(of_fwnode_handle(of_node), IDT_PIC_NR_I=
RQS,
 				       &irq_generic_chip_ops, NULL);
 	if (!domain) {
 		pr_err("Failed to add irqdomain!\n");
diff --git a/drivers/irqchip/irq-imgpdc.c b/drivers/irqchip/irq-imgpdc.c
index 85f80bac0961..f0410d5d7315 100644
--- a/drivers/irqchip/irq-imgpdc.c
+++ b/drivers/irqchip/irq-imgpdc.c
@@ -372,7 +372,7 @@ static int pdc_intc_probe(struct platform_device *pdev)
 	priv->syswake_irq =3D irq;
=20
 	/* Set up an IRQ domain */
-	priv->domain =3D irq_domain_add_linear(node, 16, &irq_generic_chip_ops,
+	priv->domain =3D irq_domain_create_linear(of_fwnode_handle(node), 16, &irq_=
generic_chip_ops,
 					     priv);
 	if (unlikely(!priv->domain)) {
 		dev_err(&pdev->dev, "cannot add IRQ domain\n");
diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index 095ae8e3217e..b91f5c14b405 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -240,8 +240,8 @@ static int __init imx_gpcv2_irqchip_init(struct device_no=
de *node,
 		return -ENOMEM;
 	}
=20
-	domain =3D irq_domain_add_hierarchy(parent_domain, 0, GPC_MAX_IRQS,
-				node, &gpcv2_irqchip_data_domain_ops, cd);
+	domain =3D irq_domain_create_hierarchy(parent_domain, 0, GPC_MAX_IRQS,
+				of_fwnode_handle(node), &gpcv2_irqchip_data_domain_ops, cd);
 	if (!domain) {
 		iounmap(cd->gpc_base);
 		kfree(cd);
diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmu=
x.c
index 787543d07565..5f9b204d350b 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -254,7 +254,7 @@ static int imx_intmux_probe(struct platform_device *pdev)
 			goto out;
 		}
=20
-		domain =3D irq_domain_add_linear(np, 32, &imx_intmux_domain_ops,
+		domain =3D irq_domain_create_linear(of_fwnode_handle(np), 32, &imx_intmux_=
domain_ops,
 					       &data->irqchip_data[i]);
 		if (!domain) {
 			ret =3D -ENOMEM;
diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index afbfcce3b1e3..6dc9ac48fee5 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -212,7 +212,7 @@ static int imx_irqsteer_probe(struct platform_device *pde=
v)
 	/* steer all IRQs into configured channel */
 	writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
=20
-	data->domain =3D irq_domain_add_linear(np, data->reg_num * 32,
+	data->domain =3D irq_domain_create_linear(of_fwnode_handle(np), data->reg_n=
um * 32,
 					     &imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
diff --git a/drivers/irqchip/irq-ingenic-tcu.c b/drivers/irqchip/irq-ingenic-=
tcu.c
index 3363f83bd7e9..e43ff8935b82 100644
--- a/drivers/irqchip/irq-ingenic-tcu.c
+++ b/drivers/irqchip/irq-ingenic-tcu.c
@@ -114,8 +114,8 @@ static int __init ingenic_tcu_irq_init(struct device_node=
 *np,
=20
 	tcu->nb_parent_irqs =3D irqs;
=20
-	tcu->domain =3D irq_domain_add_linear(np, 32, &irq_generic_chip_ops,
-					    NULL);
+	tcu->domain =3D irq_domain_create_linear(of_fwnode_handle(np), 32, &irq_gen=
eric_chip_ops,
+					       NULL);
 	if (!tcu->domain) {
 		ret =3D -ENOMEM;
 		goto err_free_tcu;
diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index cee839ca627e..52393724f213 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -90,8 +90,8 @@ static int __init ingenic_intc_of_init(struct device_node *=
node,
 		goto out_unmap_irq;
 	}
=20
-	domain =3D irq_domain_add_linear(node, num_chips * 32,
-				       &irq_generic_chip_ops, NULL);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(node), num_chips * 32,
+					  &irq_generic_chip_ops, NULL);
 	if (!domain) {
 		err =3D -ENOMEM;
 		goto out_unmap_base;
diff --git a/drivers/irqchip/irq-ixp4xx.c b/drivers/irqchip/irq-ixp4xx.c
index f23b02f62a5c..a9a5a52b818a 100644
--- a/drivers/irqchip/irq-ixp4xx.c
+++ b/drivers/irqchip/irq-ixp4xx.c
@@ -261,7 +261,7 @@ static int __init ixp4xx_of_init_irq(struct device_node *=
np,
 		pr_crit("IXP4XX: could not ioremap interrupt controller\n");
 		return -ENODEV;
 	}
-	fwnode =3D of_node_to_fwnode(np);
+	fwnode =3D of_fwnode_handle(np);
=20
 	/* These chip variants have 64 interrupts */
 	is_356 =3D of_device_is_compatible(np, "intel,ixp43x-interrupt") ||
diff --git a/drivers/irqchip/irq-jcore-aic.c b/drivers/irqchip/irq-jcore-aic.c
index 1f613eb7b7f0..94c05cf974be 100644
--- a/drivers/irqchip/irq-jcore-aic.c
+++ b/drivers/irqchip/irq-jcore-aic.c
@@ -107,9 +107,8 @@ static int __init aic_irq_of_init(struct device_node *nod=
e,
 	if (ret < 0)
 		return ret;
=20
-	domain =3D irq_domain_add_legacy(node, dom_sz - min_irq, min_irq, min_irq,
-				       &jcore_aic_irqdomain_ops,
-				       &jcore_aic);
+	domain =3D irq_domain_create_legacy(of_fwnode_handle(node), dom_sz - min_ir=
q, min_irq,
+					  min_irq, &jcore_aic_irqdomain_ops, &jcore_aic);
 	if (!domain)
 		return -ENOMEM;
=20
diff --git a/drivers/irqchip/irq-keystone.c b/drivers/irqchip/irq-keystone.c
index 37e1a03fcbb4..c9e902b7bf48 100644
--- a/drivers/irqchip/irq-keystone.c
+++ b/drivers/irqchip/irq-keystone.c
@@ -157,8 +157,8 @@ static int keystone_irq_probe(struct platform_device *pde=
v)
 	kirq->chip.irq_mask	=3D keystone_irq_setmask;
 	kirq->chip.irq_unmask	=3D keystone_irq_unmask;
=20
-	kirq->irqd =3D irq_domain_add_linear(np, KEYSTONE_N_IRQ,
-					   &keystone_irq_ops, kirq);
+	kirq->irqd =3D irq_domain_create_linear(of_fwnode_handle(np), KEYSTONE_N_IR=
Q,
+					      &keystone_irq_ops, kirq);
 	if (!kirq->irqd) {
 		dev_err(dev, "IRQ domain registration failed\n");
 		return -ENODEV;
diff --git a/drivers/irqchip/irq-lan966x-oic.c b/drivers/irqchip/irq-lan966x-=
oic.c
index 41ac880e3b87..9445c3a6b1b0 100644
--- a/drivers/irqchip/irq-lan966x-oic.c
+++ b/drivers/irqchip/irq-lan966x-oic.c
@@ -224,7 +224,7 @@ static int lan966x_oic_probe(struct platform_device *pdev)
 		.exit		=3D lan966x_oic_chip_exit,
 	};
 	struct irq_domain_info d_info =3D {
-		.fwnode		=3D of_node_to_fwnode(pdev->dev.of_node),
+		.fwnode		=3D of_fwnode_handle(pdev->dev.of_node),
 		.domain_flags	=3D IRQ_DOMAIN_FLAG_DESTROY_GC,
 		.size		=3D LAN966X_OIC_NR_IRQ,
 		.hwirq_max	=3D LAN966X_OIC_NR_IRQ,
diff --git a/drivers/irqchip/irq-loongarch-cpu.c b/drivers/irqchip/irq-loonga=
rch-cpu.c
index e62dab4c97fc..950bc087e388 100644
--- a/drivers/irqchip/irq-loongarch-cpu.c
+++ b/drivers/irqchip/irq-loongarch-cpu.c
@@ -100,7 +100,7 @@ static const struct irq_domain_ops loongarch_cpu_intc_irq=
_domain_ops =3D {
 static int __init cpuintc_of_init(struct device_node *of_node,
 				struct device_node *parent)
 {
-	cpuintc_handle =3D of_node_to_fwnode(of_node);
+	cpuintc_handle =3D of_fwnode_handle(of_node);
=20
 	irq_domain =3D irq_domain_create_linear(cpuintc_handle, EXCCODE_INT_NUM,
 				&loongarch_cpu_intc_irq_domain_ops, NULL);
diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loo=
ngson-eiointc.c
index bb79e19dfb59..b2860eb2d32c 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -554,7 +554,7 @@ static int __init eiointc_of_init(struct device_node *of_=
node,
 		priv->vec_count =3D VEC_COUNT;
=20
 	priv->node =3D 0;
-	priv->domain_handle =3D of_node_to_fwnode(of_node);
+	priv->domain_handle =3D of_fwnode_handle(of_node);
=20
 	ret =3D eiointc_init(priv, parent_irq, 0);
 	if (ret < 0)
diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loong=
son-htvec.c
index 5da02c7ad0b3..d8558eb35044 100644
--- a/drivers/irqchip/irq-loongson-htvec.c
+++ b/drivers/irqchip/irq-loongson-htvec.c
@@ -248,7 +248,7 @@ static int htvec_of_init(struct device_node *node,
 	}
=20
 	err =3D htvec_init(res.start, resource_size(&res),
-			num_parents, parent_irq, of_node_to_fwnode(node));
+			num_parents, parent_irq, of_fwnode_handle(node));
 	if (err < 0)
 		return err;
=20
diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loo=
ngson-liointc.c
index 2b1bd4a96665..95cade56e0be 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -363,7 +363,7 @@ static int __init liointc_of_init(struct device_node *nod=
e,
 	}
=20
 	err =3D liointc_init(res.start, resource_size(&res),
-			revision, of_node_to_fwnode(node), node);
+			revision, of_fwnode_handle(node), node);
 	if (err < 0)
 		return err;
=20
diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loo=
ngson-pch-msi.c
index 9c62108b3ad5..c07876ae7b49 100644
--- a/drivers/irqchip/irq-loongson-pch-msi.c
+++ b/drivers/irqchip/irq-loongson-pch-msi.c
@@ -243,7 +243,7 @@ static int pch_msi_of_init(struct device_node *node, stru=
ct device_node *parent)
 		return -EINVAL;
 	}
=20
-	err =3D pch_msi_init(res.start, irq_base, irq_count, parent_domain, of_node=
_to_fwnode(node));
+	err =3D pch_msi_init(res.start, irq_base, irq_count, parent_domain, of_fwno=
de_handle(node));
 	if (err < 0)
 		return err;
=20
diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loo=
ngson-pch-pic.c
index 69efda35a8e7..62e6bf3a0611 100644
--- a/drivers/irqchip/irq-loongson-pch-pic.c
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -392,7 +392,7 @@ static int pch_pic_of_init(struct device_node *node,
 	}
=20
 	err =3D pch_pic_init(res.start, resource_size(&res), vec_base,
-				parent_domain, of_node_to_fwnode(node), 0);
+				parent_domain, of_fwnode_handle(node), 0);
 	if (err < 0)
 		return err;
=20
diff --git a/drivers/irqchip/irq-lpc32xx.c b/drivers/irqchip/irq-lpc32xx.c
index 4d70a857133f..14cca44baa14 100644
--- a/drivers/irqchip/irq-lpc32xx.c
+++ b/drivers/irqchip/irq-lpc32xx.c
@@ -210,8 +210,8 @@ static int __init lpc32xx_of_ic_init(struct device_node *=
node,
 		return -EINVAL;
 	}
=20
-	irqc->domain =3D irq_domain_add_linear(node, NR_LPC32XX_IC_IRQS,
-					     &lpc32xx_irq_domain_ops, irqc);
+	irqc->domain =3D irq_domain_create_linear(of_fwnode_handle(node), NR_LPC32X=
X_IC_IRQS,
+						&lpc32xx_irq_domain_ops, irqc);
 	if (!irqc->domain) {
 		pr_err("unable to add irq domain\n");
 		iounmap(irqc->base);
diff --git a/drivers/irqchip/irq-ls-extirq.c b/drivers/irqchip/irq-ls-extirq.c
index 139f26b0a6ef..50a7b38381b9 100644
--- a/drivers/irqchip/irq-ls-extirq.c
+++ b/drivers/irqchip/irq-ls-extirq.c
@@ -208,8 +208,8 @@ ls_extirq_of_init(struct device_node *node, struct device=
_node *parent)
 				      of_device_is_compatible(node, "fsl,ls1043a-extirq");
 	raw_spin_lock_init(&priv->lock);
=20
-	domain =3D irq_domain_add_hierarchy(parent_domain, 0, priv->nirq, node,
-					  &extirq_domain_ops, priv);
+	domain =3D irq_domain_create_hierarchy(parent_domain, 0, priv->nirq, of_fwn=
ode_handle(node),
+					     &extirq_domain_ops, priv);
 	if (!domain) {
 		ret =3D -ENOMEM;
 		goto err_add_hierarchy;
diff --git a/drivers/irqchip/irq-ls-scfg-msi.c b/drivers/irqchip/irq-ls-scfg-=
msi.c
index 3cb80796cc7c..84bc5e4b47cf 100644
--- a/drivers/irqchip/irq-ls-scfg-msi.c
+++ b/drivers/irqchip/irq-ls-scfg-msi.c
@@ -215,17 +215,17 @@ static void ls_scfg_msi_irq_handler(struct irq_desc *de=
sc)
 static int ls_scfg_msi_domains_init(struct ls_scfg_msi *msi_data)
 {
 	/* Initialize MSI domain parent */
-	msi_data->parent =3D irq_domain_add_linear(NULL,
-						 msi_data->irqs_num,
-						 &ls_scfg_msi_domain_ops,
-						 msi_data);
+	msi_data->parent =3D irq_domain_create_linear(NULL,
+						    msi_data->irqs_num,
+						    &ls_scfg_msi_domain_ops,
+						    msi_data);
 	if (!msi_data->parent) {
 		dev_err(&msi_data->pdev->dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
 	}
=20
 	msi_data->msi_domain =3D pci_msi_create_irq_domain(
-				of_node_to_fwnode(msi_data->pdev->dev.of_node),
+				of_fwnode_handle(msi_data->pdev->dev.of_node),
 				&ls_scfg_msi_domain_info,
 				msi_data->parent);
 	if (!msi_data->msi_domain) {
diff --git a/drivers/irqchip/irq-ls1x.c b/drivers/irqchip/irq-ls1x.c
index 77a3f7dfaaf0..589d32007fca 100644
--- a/drivers/irqchip/irq-ls1x.c
+++ b/drivers/irqchip/irq-ls1x.c
@@ -126,8 +126,8 @@ static int __init ls1x_intc_of_init(struct device_node *n=
ode,
 	}
=20
 	/* Set up an IRQ domain */
-	priv->domain =3D irq_domain_add_linear(node, 32, &irq_generic_chip_ops,
-					     NULL);
+	priv->domain =3D irq_domain_create_linear(of_fwnode_handle(node), 32, &irq_=
generic_chip_ops,
+						NULL);
 	if (!priv->domain) {
 		pr_err("ls1x-irq: cannot add IRQ domain\n");
 		err =3D -ENOMEM;
diff --git a/drivers/irqchip/irq-mchp-eic.c b/drivers/irqchip/irq-mchp-eic.c
index 5dcd94c000a2..516a3a0e359c 100644
--- a/drivers/irqchip/irq-mchp-eic.c
+++ b/drivers/irqchip/irq-mchp-eic.c
@@ -248,8 +248,9 @@ static int mchp_eic_init(struct device_node *node, struct=
 device_node *parent)
 		eic->irqs[i] =3D irq.args[1];
 	}
=20
-	eic->domain =3D irq_domain_add_hierarchy(parent_domain, 0, MCHP_EIC_NIRQ,
-					       node, &mchp_eic_domain_ops, eic);
+	eic->domain =3D irq_domain_create_hierarchy(parent_domain, 0, MCHP_EIC_NIRQ,
+						  of_fwnode_handle(node), &mchp_eic_domain_ops,
+						  eic);
 	if (!eic->domain) {
 		pr_err("%pOF: Failed to add domain\n", node);
 		ret =3D -ENODEV;
diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpi=
o.c
index 0a25536a5d07..7d177626d64b 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -607,7 +607,7 @@ static int meson_gpio_irq_of_init(struct device_node *nod=
e, struct device_node *
=20
 	domain =3D irq_domain_create_hierarchy(parent_domain, 0,
 					     ctl->params->nr_hwirq,
-					     of_node_to_fwnode(node),
+					     of_fwnode_handle(node),
 					     &meson_gpio_irq_domain_ops,
 					     ctl);
 	if (!domain) {
diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
index 0c7ae71a0af0..ac784ef3ed4b 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -238,11 +238,9 @@ static void mips_cpu_register_ipi_domain(struct device_n=
ode *of_node)
 	struct cpu_ipi_domain_state *ipi_domain_state;
=20
 	ipi_domain_state =3D kzalloc(sizeof(*ipi_domain_state), GFP_KERNEL);
-	ipi_domain =3D irq_domain_add_hierarchy(irq_domain,
-					      IRQ_DOMAIN_FLAG_IPI_SINGLE,
-					      2, of_node,
-					      &mips_cpu_ipi_chip_ops,
-					      ipi_domain_state);
+	ipi_domain =3D irq_domain_create_hierarchy(irq_domain, IRQ_DOMAIN_FLAG_IPI_=
SINGLE, 2,
+						 of_fwnode_handle(of_node),
+						 &mips_cpu_ipi_chip_ops, ipi_domain_state);
 	if (!ipi_domain)
 		panic("Failed to add MIPS CPU IPI domain");
 	irq_domain_update_bus_token(ipi_domain, DOMAIN_BUS_IPI);
@@ -260,9 +258,8 @@ static void __init __mips_cpu_irq_init(struct device_node=
 *of_node)
 	clear_c0_status(ST0_IM);
 	clear_c0_cause(CAUSEF_IP);
=20
-	irq_domain =3D irq_domain_add_legacy(of_node, 8, MIPS_CPU_IRQ_BASE, 0,
-					   &mips_cpu_intc_irq_domain_ops,
-					   NULL);
+	irq_domain =3D irq_domain_create_legacy(of_fwnode_handle(of_node), 8, MIPS_=
CPU_IRQ_BASE, 0,
+					      &mips_cpu_intc_irq_domain_ops, NULL);
 	if (!irq_domain)
 		panic("Failed to add irqdomain for MIPS CPU");
=20
diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index bca8053864b2..34e8d09c12a0 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -841,10 +841,10 @@ static int gic_register_ipi_domain(struct device_node *=
node)
 	struct irq_domain *gic_ipi_domain;
 	unsigned int v[2], num_ipis;
=20
-	gic_ipi_domain =3D irq_domain_add_hierarchy(gic_irq_domain,
-						  IRQ_DOMAIN_FLAG_IPI_PER_CPU,
-						  GIC_NUM_LOCAL_INTRS + gic_shared_intrs,
-						  node, &gic_ipi_domain_ops, NULL);
+	gic_ipi_domain =3D irq_domain_create_hierarchy(gic_irq_domain, IRQ_DOMAIN_F=
LAG_IPI_PER_CPU,
+						     GIC_NUM_LOCAL_INTRS + gic_shared_intrs,
+						     of_fwnode_handle(node), &gic_ipi_domain_ops,
+						     NULL);
 	if (!gic_ipi_domain) {
 		pr_err("Failed to add IPI domain");
 		return -ENXIO;
@@ -963,9 +963,10 @@ static int __init gic_of_init(struct device_node *node,
 					gic_irq_dispatch);
 	}
=20
-	gic_irq_domain =3D irq_domain_add_simple(node, GIC_NUM_LOCAL_INTRS +
-					       gic_shared_intrs, 0,
-					       &gic_irq_domain_ops, NULL);
+	gic_irq_domain =3D irq_domain_create_simple(of_fwnode_handle(node),
+						  GIC_NUM_LOCAL_INTRS +
+						  gic_shared_intrs, 0,
+						  &gic_irq_domain_ops, NULL);
 	if (!gic_irq_domain) {
 		pr_err("Failed to add IRQ domain");
 		return -ENXIO;
diff --git a/drivers/irqchip/irq-mmp.c b/drivers/irqchip/irq-mmp.c
index 25cf4f80e767..09e640430208 100644
--- a/drivers/irqchip/irq-mmp.c
+++ b/drivers/irqchip/irq-mmp.c
@@ -261,9 +261,9 @@ static int __init mmp_init_bases(struct device_node *node)
 	}
=20
 	icu_data[0].virq_base =3D 0;
-	icu_data[0].domain =3D irq_domain_add_linear(node, nr_irqs,
-						   &mmp_irq_domain_ops,
-						   &icu_data[0]);
+	icu_data[0].domain =3D irq_domain_create_linear(of_fwnode_handle(node), nr_=
irqs,
+						      &mmp_irq_domain_ops,
+						      &icu_data[0]);
 	for (irq =3D 0; irq < nr_irqs; irq++) {
 		ret =3D irq_create_mapping(icu_data[0].domain, irq);
 		if (!ret) {
@@ -391,9 +391,9 @@ static int __init mmp2_mux_of_init(struct device_node *no=
de,
 		return -EINVAL;
=20
 	icu_data[i].virq_base =3D 0;
-	icu_data[i].domain =3D irq_domain_add_linear(node, nr_irqs,
-						   &mmp_irq_domain_ops,
-						   &icu_data[i]);
+	icu_data[i].domain =3D irq_domain_create_linear(of_fwnode_handle(node), nr_=
irqs,
+						      &mmp_irq_domain_ops,
+						      &icu_data[i]);
 	for (irq =3D 0; irq < nr_irqs; irq++) {
 		ret =3D irq_create_mapping(icu_data[i].domain, irq);
 		if (!ret) {
diff --git a/drivers/irqchip/irq-mscc-ocelot.c b/drivers/irqchip/irq-mscc-oce=
lot.c
index 3dc745b14caf..7b3020f480d5 100644
--- a/drivers/irqchip/irq-mscc-ocelot.c
+++ b/drivers/irqchip/irq-mscc-ocelot.c
@@ -132,8 +132,8 @@ static int __init vcoreiii_irq_init(struct device_node *n=
ode,
 	if (!parent_irq)
 		return -EINVAL;
=20
-	domain =3D irq_domain_add_linear(node, p->n_irq,
-				       &irq_generic_chip_ops, NULL);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(node), p->n_irq,
+					  &irq_generic_chip_ops, NULL);
 	if (!domain) {
 		pr_err("%pOFn: unable to add irq domain\n", node);
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index f6133ae28155..9643cc3a77d7 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -273,8 +273,8 @@ static int __init mst_intc_of_init(struct device_node *dn,
 	raw_spin_lock_init(&cd->lock);
 	cd->irq_start =3D irq_start;
 	cd->nr_irqs =3D irq_end - irq_start + 1;
-	domain =3D irq_domain_add_hierarchy(domain_parent, 0, cd->nr_irqs, dn,
-					  &mst_intc_domain_ops, cd);
+	domain =3D irq_domain_create_hierarchy(domain_parent, 0, cd->nr_irqs, of_fw=
node_handle(dn),
+					     &mst_intc_domain_ops, cd);
 	if (!domain) {
 		iounmap(cd->base);
 		kfree(cd);
diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 76bc0283e3b9..de481ba340f8 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -336,9 +336,8 @@ static int __init mtk_cirq_of_init(struct device_node *no=
de,
 	cirq_data->offsets =3D match->data;
=20
 	irq_num =3D cirq_data->ext_irq_end - cirq_data->ext_irq_start + 1;
-	domain =3D irq_domain_add_hierarchy(domain_parent, 0,
-					  irq_num, node,
-					  &cirq_domain_ops, cirq_data);
+	domain =3D irq_domain_create_hierarchy(domain_parent, 0, irq_num, of_fwnode=
_handle(node),
+					     &cirq_domain_ops, cirq_data);
 	if (!domain) {
 		ret =3D -ENOMEM;
 		goto out_unmap;
diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysir=
q.c
index 586e52d5442b..6895e7096b27 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -207,8 +207,8 @@ static int __init mtk_sysirq_of_init(struct device_node *=
node,
 		chip_data->which_word[i] =3D word;
 	}
=20
-	domain =3D irq_domain_add_hierarchy(domain_parent, 0, intpol_num, node,
-					  &sysirq_domain_ops, chip_data);
+	domain =3D irq_domain_create_hierarchy(domain_parent, 0, intpol_num, of_fwn=
ode_handle(node),
+					     &sysirq_domain_ops, chip_data);
 	if (!domain) {
 		ret =3D -ENOMEM;
 		goto out_free_which_word;
diff --git a/drivers/irqchip/irq-mvebu-pic.c b/drivers/irqchip/irq-mvebu-pic.c
index 3888b7585981..8db638aa21d2 100644
--- a/drivers/irqchip/irq-mvebu-pic.c
+++ b/drivers/irqchip/irq-mvebu-pic.c
@@ -150,8 +150,8 @@ static int mvebu_pic_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
=20
-	pic->domain =3D irq_domain_add_linear(node, PIC_MAX_IRQS,
-					    &mvebu_pic_domain_ops, pic);
+	pic->domain =3D irq_domain_create_linear(of_fwnode_handle(node), PIC_MAX_IR=
QS,
+					       &mvebu_pic_domain_ops, pic);
 	if (!pic->domain) {
 		dev_err(&pdev->dev, "Failed to allocate irq domain\n");
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-mxs.c b/drivers/irqchip/irq-mxs.c
index d67b5da38982..0bb423dd5280 100644
--- a/drivers/irqchip/irq-mxs.c
+++ b/drivers/irqchip/irq-mxs.c
@@ -162,8 +162,8 @@ static const struct irq_domain_ops icoll_irq_domain_ops =
=3D {
 static void __init icoll_add_domain(struct device_node *np,
 			  int num)
 {
-	icoll_domain =3D irq_domain_add_linear(np, num,
-					     &icoll_irq_domain_ops, NULL);
+	icoll_domain =3D irq_domain_create_linear(of_fwnode_handle(np), num,
+						&icoll_irq_domain_ops, NULL);
=20
 	if (!icoll_domain)
 		panic("%pOF: unable to create irq domain", np);
diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
index ba6332b00a0a..76e11cac9631 100644
--- a/drivers/irqchip/irq-nvic.c
+++ b/drivers/irqchip/irq-nvic.c
@@ -90,7 +90,7 @@ static int __init nvic_of_init(struct device_node *node,
 		irqs =3D NVIC_MAX_IRQ;
=20
 	nvic_irq_domain =3D
-		irq_domain_add_linear(node, irqs, &nvic_irq_domain_ops, NULL);
+		irq_domain_create_linear(of_fwnode_handle(node), irqs, &nvic_irq_domain_op=
s, NULL);
=20
 	if (!nvic_irq_domain) {
 		pr_warn("Failed to allocate irq domain\n");
diff --git a/drivers/irqchip/irq-omap-intc.c b/drivers/irqchip/irq-omap-intc.c
index ad84a2f03368..16f00db570e7 100644
--- a/drivers/irqchip/irq-omap-intc.c
+++ b/drivers/irqchip/irq-omap-intc.c
@@ -248,7 +248,7 @@ static int __init omap_init_irq_of(struct device_node *no=
de)
 	if (WARN_ON(!omap_irq_base))
 		return -ENOMEM;
=20
-	domain =3D irq_domain_add_linear(node, omap_nr_irqs,
+	domain =3D irq_domain_create_linear(of_fwnode_handle(node), omap_nr_irqs,
 			&irq_generic_chip_ops, NULL);
=20
 	omap_irq_soft_reset();
@@ -274,7 +274,7 @@ static int __init omap_init_irq_legacy(u32 base, struct d=
evice_node *node)
 		irq_base =3D 0;
 	}
=20
-	domain =3D irq_domain_add_legacy(node, omap_nr_irqs, irq_base, 0,
+	domain =3D irq_domain_create_legacy(of_fwnode_handle(node), omap_nr_irqs, i=
rq_base, 0,
 			&irq_domain_simple_ops, NULL);
=20
 	omap_irq_soft_reset();
diff --git a/drivers/irqchip/irq-or1k-pic.c b/drivers/irqchip/irq-or1k-pic.c
index f289ccd95291..48126067c54b 100644
--- a/drivers/irqchip/irq-or1k-pic.c
+++ b/drivers/irqchip/irq-or1k-pic.c
@@ -144,8 +144,8 @@ static int __init or1k_pic_init(struct device_node *node,
 	/* Disable all interrupts until explicitly requested */
 	mtspr(SPR_PICMR, (0UL));
=20
-	root_domain =3D irq_domain_add_linear(node, 32, &or1k_irq_domain_ops,
-					    pic);
+	root_domain =3D irq_domain_create_linear(of_fwnode_handle(node), 32, &or1k_=
irq_domain_ops,
+					       pic);
=20
 	set_handle_irq(or1k_pic_handle_irq);
=20
diff --git a/drivers/irqchip/irq-orion.c b/drivers/irqchip/irq-orion.c
index 4e4e874e09a8..dddbc05917c0 100644
--- a/drivers/irqchip/irq-orion.c
+++ b/drivers/irqchip/irq-orion.c
@@ -59,7 +59,7 @@ static int __init orion_irq_init(struct device_node *np,
 	/* count number of irq chips by valid reg addresses */
 	num_chips =3D of_address_count(np);
=20
-	orion_irq_domain =3D irq_domain_add_linear(np,
+	orion_irq_domain =3D irq_domain_create_linear(of_fwnode_handle(np),
 				num_chips * ORION_IRQS_PER_CHIP,
 				&irq_generic_chip_ops, NULL);
 	if (!orion_irq_domain)
@@ -146,8 +146,8 @@ static int __init orion_bridge_irq_init(struct device_nod=
e *np,
 	/* get optional number of interrupts provided */
 	of_property_read_u32(np, "marvell,#interrupts", &nrirqs);
=20
-	domain =3D irq_domain_add_linear(np, nrirqs,
-				       &irq_generic_chip_ops, NULL);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(np), nrirqs,
+					  &irq_generic_chip_ops, NULL);
 	if (!domain) {
 		pr_err("%pOFn: unable to add irq domain\n", np);
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-owl-sirq.c b/drivers/irqchip/irq-owl-sirq.c
index 6e4127465094..3d93d21f6732 100644
--- a/drivers/irqchip/irq-owl-sirq.c
+++ b/drivers/irqchip/irq-owl-sirq.c
@@ -323,8 +323,8 @@ static int __init owl_sirq_init(const struct owl_sirq_par=
ams *params,
 		owl_sirq_clear_set_extctl(chip_data, 0, INTC_EXTCTL_CLK_SEL, i);
 	}
=20
-	domain =3D irq_domain_add_hierarchy(parent_domain, 0, NUM_SIRQ, node,
-					  &owl_sirq_domain_ops, chip_data);
+	domain =3D irq_domain_create_hierarchy(parent_domain, 0, NUM_SIRQ, of_fwnod=
e_handle(node),
+					     &owl_sirq_domain_ops, chip_data);
 	if (!domain) {
 		pr_err("%pOF: failed to add domain\n", node);
 		ret =3D -ENOMEM;
diff --git a/drivers/irqchip/irq-pic32-evic.c b/drivers/irqchip/irq-pic32-evi=
c.c
index b546b1036e12..5dfda8e8df10 100644
--- a/drivers/irqchip/irq-pic32-evic.c
+++ b/drivers/irqchip/irq-pic32-evic.c
@@ -227,9 +227,9 @@ static int __init pic32_of_init(struct device_node *node,
 		goto err_iounmap;
 	}
=20
-	evic_irq_domain =3D irq_domain_add_linear(node, nchips * 32,
-						&pic32_irq_domain_ops,
-						priv);
+	evic_irq_domain =3D irq_domain_create_linear(of_fwnode_handle(node), nchips=
 * 32,
+						   &pic32_irq_domain_ops,
+						   priv);
 	if (!evic_irq_domain) {
 		ret =3D -ENOMEM;
 		goto err_free_priv;
diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-int=
c.c
index bee01980b463..8f7c9dc45953 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -555,8 +555,8 @@ static int pruss_intc_probe(struct platform_device *pdev)
=20
 	mutex_init(&intc->lock);
=20
-	intc->domain =3D irq_domain_add_linear(dev->of_node, max_system_events,
-					     &pruss_intc_irq_domain_ops, intc);
+	intc->domain =3D irq_domain_create_linear(of_fwnode_handle(dev->of_node), m=
ax_system_events,
+						&pruss_intc_irq_domain_ops, intc);
 	if (!intc->domain)
 		return -ENOMEM;
=20
diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 7942d8eb3d00..00c770e367d0 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -447,7 +447,7 @@ static int qcom_mpm_init(struct device_node *np, struct d=
evice_node *parent)
=20
 	priv->domain =3D irq_domain_create_hierarchy(parent_domain,
 				IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP, pin_cnt,
-				of_node_to_fwnode(np), &qcom_mpm_ops, priv);
+				of_fwnode_handle(np), &qcom_mpm_ops, priv);
 	if (!priv->domain) {
 		dev_err(dev, "failed to create MPM domain\n");
 		ret =3D -ENOMEM;
diff --git a/drivers/irqchip/irq-realtek-rtl.c b/drivers/irqchip/irq-realtek-=
rtl.c
index 2a349082af81..942c1f8c363d 100644
--- a/drivers/irqchip/irq-realtek-rtl.c
+++ b/drivers/irqchip/irq-realtek-rtl.c
@@ -162,7 +162,7 @@ static int __init realtek_rtl_of_init(struct device_node =
*node, struct device_no
 	else if (!parent_irq)
 		return -ENODEV;
=20
-	domain =3D irq_domain_add_linear(node, RTL_ICTL_NUM_INPUTS, &irq_domain_ops=
, NULL);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(node), RTL_ICTL_NUM_IN=
PUTS, &irq_domain_ops, NULL);
 	if (!domain)
 		return -ENOMEM;
=20
diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/irq-=
renesas-intc-irqpin.c
index 954419f2460d..0959ed43b1a9 100644
--- a/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
@@ -513,8 +513,10 @@ static int intc_irqpin_probe(struct platform_device *pde=
v)
 	irq_chip->irq_set_wake =3D intc_irqpin_irq_set_wake;
 	irq_chip->flags	=3D IRQCHIP_MASK_ON_SUSPEND;
=20
-	p->irq_domain =3D irq_domain_add_simple(dev->of_node, nirqs, 0,
-					      &intc_irqpin_irq_domain_ops, p);
+	p->irq_domain =3D irq_domain_create_simple(of_fwnode_handle(dev->of_node),
+						 nirqs, 0,
+						 &intc_irqpin_irq_domain_ops,
+						 p);
 	if (!p->irq_domain) {
 		ret =3D -ENXIO;
 		dev_err(dev, "cannot initialize irq domain\n");
diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas=
-irqc.c
index cbce8ffc7de4..5c3196e5a437 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -168,8 +168,8 @@ static int irqc_probe(struct platform_device *pdev)
=20
 	p->cpu_int_base =3D p->iomem + IRQC_INT_CPU_BASE(0); /* SYS-SPI */
=20
-	p->irq_domain =3D irq_domain_add_linear(dev->of_node, p->number_of_irqs,
-					      &irq_generic_chip_ops, p);
+	p->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(dev->of_node), =
p->number_of_irqs,
+						 &irq_generic_chip_ops, p);
 	if (!p->irq_domain) {
 		ret =3D -ENXIO;
 		dev_err(dev, "cannot initialize irq domain\n");
diff --git a/drivers/irqchip/irq-renesas-rza1.c b/drivers/irqchip/irq-renesas=
-rza1.c
index d4e6a68889ec..0a9640ba0adb 100644
--- a/drivers/irqchip/irq-renesas-rza1.c
+++ b/drivers/irqchip/irq-renesas-rza1.c
@@ -231,9 +231,9 @@ static int rza1_irqc_probe(struct platform_device *pdev)
 	priv->chip.irq_set_type =3D rza1_irqc_set_type;
 	priv->chip.flags =3D IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE;
=20
-	priv->irq_domain =3D irq_domain_add_hierarchy(parent, 0, IRQC_NUM_IRQ,
-						    np, &rza1_irqc_domain_ops,
-						    priv);
+	priv->irq_domain =3D irq_domain_create_hierarchy(parent, 0, IRQC_NUM_IRQ,
+						       of_fwnode_handle(np), &rza1_irqc_domain_ops,
+						       priv);
 	if (!priv->irq_domain) {
 		dev_err(dev, "cannot initialize irq domain\n");
 		ret =3D -ENOMEM;
diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesa=
s-rzg2l.c
index 6a2e41f02446..1e861bd64f97 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -574,9 +574,9 @@ static int rzg2l_irqc_common_init(struct device_node *nod=
e, struct device_node *
=20
 	raw_spin_lock_init(&rzg2l_irqc_data->lock);
=20
-	irq_domain =3D irq_domain_add_hierarchy(parent_domain, 0, IRQC_NUM_IRQ,
-					      node, &rzg2l_irqc_domain_ops,
-					      rzg2l_irqc_data);
+	irq_domain =3D irq_domain_create_hierarchy(parent_domain, 0, IRQC_NUM_IRQ,
+						 of_fwnode_handle(node), &rzg2l_irqc_domain_ops,
+						 rzg2l_irqc_data);
 	if (!irq_domain) {
 		pm_runtime_put(dev);
 		return dev_err_probe(dev, -ENOMEM, "failed to add irq domain\n");
diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesa=
s-rzv2h.c
index 3d5b5fdf9bde..7a61d454a1a5 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -514,8 +514,9 @@ static int rzv2h_icu_init_common(struct device_node *node=
, struct device_node *p
=20
 	raw_spin_lock_init(&rzv2h_icu_data->lock);
=20
-	irq_domain =3D irq_domain_add_hierarchy(parent_domain, 0, ICU_NUM_IRQ, node,
-					      &rzv2h_icu_domain_ops, rzv2h_icu_data);
+	irq_domain =3D irq_domain_create_hierarchy(parent_domain, 0, ICU_NUM_IRQ,
+						 of_fwnode_handle(node), &rzv2h_icu_domain_ops,
+						 rzv2h_icu_data);
 	if (!irq_domain) {
 		dev_err(&pdev->dev, "failed to add irq domain\n");
 		ret =3D -ENOMEM;
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-int=
c.c
index f653c13de62b..e5805885394e 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -242,7 +242,7 @@ static int __init riscv_intc_init(struct device_node *nod=
e,
 		chip =3D &andes_intc_chip;
 	}
=20
-	return riscv_intc_init_common(of_node_to_fwnode(node), chip);
+	return riscv_intc_init_common(of_fwnode_handle(node), chip);
 }
=20
 IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
diff --git a/drivers/irqchip/irq-sa11x0.c b/drivers/irqchip/irq-sa11x0.c
index 9d0b80271949..d8d4dff16276 100644
--- a/drivers/irqchip/irq-sa11x0.c
+++ b/drivers/irqchip/irq-sa11x0.c
@@ -162,7 +162,7 @@ void __init sa11x0_init_irq_nodt(int irq_start, resource_=
size_t io_start)
 	 */
 	writel_relaxed(1, iobase + ICCR);
=20
-	sa1100_normal_irqdomain =3D irq_domain_add_simple(NULL,
+	sa1100_normal_irqdomain =3D irq_domain_create_simple(NULL,
 			32, irq_start,
 			&sa1100_normal_irqdomain_ops, NULL);
=20
diff --git a/drivers/irqchip/irq-sni-exiu.c b/drivers/irqchip/irq-sni-exiu.c
index c7db617e1a2f..0cad68aa8388 100644
--- a/drivers/irqchip/irq-sni-exiu.c
+++ b/drivers/irqchip/irq-sni-exiu.c
@@ -249,12 +249,12 @@ static int __init exiu_dt_init(struct device_node *node,
 		return -ENXIO;
 	}
=20
-	data =3D exiu_init(of_node_to_fwnode(node), &res);
+	data =3D exiu_init(of_fwnode_handle(node), &res);
 	if (IS_ERR(data))
 		return PTR_ERR(data);
=20
-	domain =3D irq_domain_add_hierarchy(parent_domain, 0, NUM_IRQS, node,
-					  &exiu_domain_ops, data);
+	domain =3D irq_domain_create_hierarchy(parent_domain, 0, NUM_IRQS, of_fwnod=
e_handle(node),
+					     &exiu_domain_ops, data);
 	if (!domain) {
 		pr_err("%pOF: failed to allocate domain\n", node);
 		goto out_unmap;
diff --git a/drivers/irqchip/irq-sp7021-intc.c b/drivers/irqchip/irq-sp7021-i=
ntc.c
index bed78d1def3d..2a6eda9ab62e 100644
--- a/drivers/irqchip/irq-sp7021-intc.c
+++ b/drivers/irqchip/irq-sp7021-intc.c
@@ -256,8 +256,8 @@ static int __init sp_intc_init_dt(struct device_node *nod=
e, struct device_node *
 		writel_relaxed(~0, REG_INTR_CLEAR + i * 4);
 	}
=20
-	sp_intc.domain =3D irq_domain_add_linear(node, SP_INTC_NR_IRQS,
-					       &sp_intc_dm_ops, &sp_intc);
+	sp_intc.domain =3D irq_domain_create_linear(of_fwnode_handle(node), SP_INTC=
_NR_IRQS,
+						  &sp_intc_dm_ops, &sp_intc);
 	if (!sp_intc.domain) {
 		ret =3D -ENOMEM;
 		goto out_unmap1;
diff --git a/drivers/irqchip/irq-starfive-jh8100-intc.c b/drivers/irqchip/irq=
-starfive-jh8100-intc.c
index 0f5837176e53..2460798ec158 100644
--- a/drivers/irqchip/irq-starfive-jh8100-intc.c
+++ b/drivers/irqchip/irq-starfive-jh8100-intc.c
@@ -158,8 +158,8 @@ static int __init starfive_intc_init(struct device_node *=
intc,
=20
 	raw_spin_lock_init(&irqc->lock);
=20
-	irqc->domain =3D irq_domain_add_linear(intc, STARFIVE_INTC_SRC_IRQ_NUM,
-					     &starfive_intc_domain_ops, irqc);
+	irqc->domain =3D irq_domain_create_linear(of_fwnode_handle(intc), STARFIVE_=
INTC_SRC_IRQ_NUM,
+						&starfive_intc_domain_ops, irqc);
 	if (!irqc->domain) {
 		pr_err("Unable to create IRQ domain\n");
 		ret =3D -EINVAL;
diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-ext=
i.c
index 7c6a0080c330..7cd34f9b0269 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -344,8 +344,8 @@ static int __init stm32_exti_init(const struct stm32_exti=
_drv_data *drv_data,
 	if (!host_data)
 		return -ENOMEM;
=20
-	domain =3D irq_domain_add_linear(node, drv_data->bank_nr * IRQS_PER_BANK,
-				       &irq_exti_domain_ops, NULL);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(node), drv_data->bank_=
nr * IRQS_PER_BANK,
+					  &irq_exti_domain_ops, NULL);
 	if (!domain) {
 		pr_err("%pOFn: Could not register interrupt domain.\n",
 		       node);
diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm32mp=
-exti.c
index cb83d6cc6113..c6b4407d05f9 100644
--- a/drivers/irqchip/irq-stm32mp-exti.c
+++ b/drivers/irqchip/irq-stm32mp-exti.c
@@ -531,7 +531,7 @@ static int stm32mp_exti_domain_alloc(struct irq_domain *d=
m,
 		if (ret)
 			return ret;
 		/* we only support one parent, so far */
-		if (of_node_to_fwnode(out_irq.np) !=3D dm->parent->fwnode)
+		if (of_fwnode_handle(out_irq.np) !=3D dm->parent->fwnode)
 			return -EINVAL;
=20
 		of_phandle_args_to_fwspec(out_irq.np, out_irq.args,
@@ -682,10 +682,9 @@ static int stm32mp_exti_probe(struct platform_device *pd=
ev)
 		return -EINVAL;
 	}
=20
-	domain =3D irq_domain_add_hierarchy(parent_domain, 0,
-					  drv_data->bank_nr * IRQS_PER_BANK,
-					  np, &stm32mp_exti_domain_ops,
-					  host_data);
+	domain =3D irq_domain_create_hierarchy(parent_domain, 0, drv_data->bank_nr =
* IRQS_PER_BANK,
+					     of_fwnode_handle(np), &stm32mp_exti_domain_ops,
+					     host_data);
=20
 	if (!domain) {
 		dev_err(dev, "Could not register exti domain\n");
diff --git a/drivers/irqchip/irq-sun4i.c b/drivers/irqchip/irq-sun4i.c
index dd506ebfdacb..9c2c9caeca2a 100644
--- a/drivers/irqchip/irq-sun4i.c
+++ b/drivers/irqchip/irq-sun4i.c
@@ -133,7 +133,7 @@ static int __init sun4i_of_init(struct device_node *node,
 	/* Configure the external interrupt source type */
 	writel(0x00, irq_ic_data->irq_base + SUN4I_IRQ_NMI_CTRL_REG);
=20
-	irq_ic_data->irq_domain =3D irq_domain_add_linear(node, 3 * 32,
+	irq_ic_data->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(node)=
, 3 * 32,
 						 &sun4i_irq_ops, NULL);
 	if (!irq_ic_data->irq_domain)
 		panic("%pOF: unable to create IRQ domain\n", node);
diff --git a/drivers/irqchip/irq-sun6i-r.c b/drivers/irqchip/irq-sun6i-r.c
index 99958d470d62..37d4b29763bc 100644
--- a/drivers/irqchip/irq-sun6i-r.c
+++ b/drivers/irqchip/irq-sun6i-r.c
@@ -338,8 +338,8 @@ static int __init sun6i_r_intc_init(struct device_node *n=
ode,
 		return PTR_ERR(base);
 	}
=20
-	domain =3D irq_domain_add_hierarchy(parent_domain, 0, 0, node,
-					  &sun6i_r_intc_domain_ops, NULL);
+	domain =3D irq_domain_create_hierarchy(parent_domain, 0, 0, of_fwnode_handl=
e(node),
+					     &sun6i_r_intc_domain_ops, NULL);
 	if (!domain) {
 		pr_err("%pOF: Failed to allocate domain\n", node);
 		iounmap(base);
diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index 01b0d8321728..f521341f50d9 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -159,7 +159,7 @@ static int __init sunxi_sc_nmi_irq_init(struct device_nod=
e *node,
 	struct irq_domain *domain;
 	int ret;
=20
-	domain =3D irq_domain_add_linear(node, 1, &irq_generic_chip_ops, NULL);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(node), 1, &irq_generic=
_chip_ops, NULL);
 	if (!domain) {
 		pr_err("Could not register interrupt domain.\n");
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-tb10x.c b/drivers/irqchip/irq-tb10x.c
index d59bfbe8c6d0..733dbda18a82 100644
--- a/drivers/irqchip/irq-tb10x.c
+++ b/drivers/irqchip/irq-tb10x.c
@@ -121,13 +121,13 @@ static int __init of_tb10x_init_irq(struct device_node =
*ictl,
 		goto ioremap_fail;
 	}
=20
-	domain =3D irq_domain_add_linear(ictl, AB_IRQCTL_MAXIRQ,
-					&irq_generic_chip_ops, NULL);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(ictl), AB_IRQCTL_MAXIR=
Q,
+					  &irq_generic_chip_ops, NULL);
 	if (!domain) {
 		ret =3D -ENOMEM;
 		pr_err("%pOFn: Could not register interrupt domain.\n",
 			ictl);
-		goto irq_domain_add_fail;
+		goto irq_domain_create_fail;
 	}
=20
 	ret =3D irq_alloc_domain_generic_chips(domain, AB_IRQCTL_MAXIRQ,
@@ -174,7 +174,7 @@ static int __init of_tb10x_init_irq(struct device_node *i=
ctl,
=20
 gc_alloc_fail:
 	irq_domain_remove(domain);
-irq_domain_add_fail:
+irq_domain_create_fail:
 	iounmap(reg_base);
 ioremap_fail:
 	release_mem_region(mem.start, resource_size(&mem));
diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index ad3e2c1b3c87..66cbb9f77ff3 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -330,9 +330,8 @@ static int __init tegra_ictlr_init(struct device_node *no=
de,
 	     node, num_ictlrs, soc->num_ictlrs);
=20
=20
-	domain =3D irq_domain_add_hierarchy(parent_domain, 0, num_ictlrs * 32,
-					  node, &tegra_ictlr_domain_ops,
-					  lic);
+	domain =3D irq_domain_create_hierarchy(parent_domain, 0, num_ictlrs * 32,
+					     of_fwnode_handle(node), &tegra_ictlr_domain_ops, lic);
 	if (!domain) {
 		pr_err("%pOF: failed to allocated domain\n", node);
 		err =3D -ENOMEM;
diff --git a/drivers/irqchip/irq-ti-sci-inta.c b/drivers/irqchip/irq-ti-sci-i=
nta.c
index a887efba262c..7de59238e6b0 100644
--- a/drivers/irqchip/irq-ti-sci-inta.c
+++ b/drivers/irqchip/irq-ti-sci-inta.c
@@ -233,7 +233,7 @@ static struct ti_sci_inta_vint_desc *ti_sci_inta_alloc_pa=
rent_irq(struct irq_dom
 	INIT_LIST_HEAD(&vint_desc->list);
=20
 	parent_node =3D of_irq_find_parent(dev_of_node(&inta->pdev->dev));
-	parent_fwspec.fwnode =3D of_node_to_fwnode(parent_node);
+	parent_fwspec.fwnode =3D of_fwnode_handle(parent_node);
=20
 	if (of_device_is_compatible(parent_node, "arm,gic-v3")) {
 		/* Parent is GIC */
@@ -701,15 +701,15 @@ static int ti_sci_inta_irq_domain_probe(struct platform=
_device *pdev)
 	if (ret)
 		return ret;
=20
-	domain =3D irq_domain_add_linear(dev_of_node(dev),
-				       ti_sci_get_num_resources(inta->vint),
-				       &ti_sci_inta_irq_domain_ops, inta);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(dev_of_node(dev)),
+					  ti_sci_get_num_resources(inta->vint),
+					  &ti_sci_inta_irq_domain_ops, inta);
 	if (!domain) {
 		dev_err(dev, "Failed to allocate IRQ domain\n");
 		return -ENOMEM;
 	}
=20
-	msi_domain =3D ti_sci_inta_msi_create_irq_domain(of_node_to_fwnode(node),
+	msi_domain =3D ti_sci_inta_msi_create_irq_domain(of_fwnode_handle(node),
 						&ti_sci_inta_msi_domain_info,
 						domain);
 	if (!msi_domain) {
diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-i=
ntr.c
index b49a73106c69..07fff5ae5ce0 100644
--- a/drivers/irqchip/irq-ti-sci-intr.c
+++ b/drivers/irqchip/irq-ti-sci-intr.c
@@ -149,7 +149,7 @@ static int ti_sci_intr_alloc_parent_irq(struct irq_domain=
 *domain,
 		goto err_irqs;
=20
 	parent_node =3D of_irq_find_parent(dev_of_node(intr->dev));
-	fwspec.fwnode =3D of_node_to_fwnode(parent_node);
+	fwspec.fwnode =3D of_fwnode_handle(parent_node);
=20
 	if (of_device_is_compatible(parent_node, "arm,gic-v3")) {
 		/* Parent is GIC */
@@ -274,8 +274,9 @@ static int ti_sci_intr_irq_domain_probe(struct platform_d=
evice *pdev)
 		return PTR_ERR(intr->out_irqs);
 	}
=20
-	domain =3D irq_domain_add_hierarchy(parent_domain, 0, 0, dev_of_node(dev),
-					  &ti_sci_intr_irq_domain_ops, intr);
+	domain =3D irq_domain_create_hierarchy(parent_domain, 0, 0,
+					     of_fwnode_handle(dev_of_node(dev)),
+					     &ti_sci_intr_irq_domain_ops, intr);
 	if (!domain) {
 		dev_err(dev, "Failed to allocate IRQ domain\n");
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-ts4800.c b/drivers/irqchip/irq-ts4800.c
index 960c343d5781..e625f4fb2bb8 100644
--- a/drivers/irqchip/irq-ts4800.c
+++ b/drivers/irqchip/irq-ts4800.c
@@ -125,7 +125,7 @@ static int ts4800_ic_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
=20
-	data->domain =3D irq_domain_add_linear(node, 8, &ts4800_ic_ops, data);
+	data->domain =3D irq_domain_create_linear(of_fwnode_handle(node), 8, &ts480=
0_ic_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "cannot add IRQ domain\n");
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-uniphier-aidet.c b/drivers/irqchip/irq-uniph=
ier-aidet.c
index 601f9343d5b3..6005c2d28dd9 100644
--- a/drivers/irqchip/irq-uniphier-aidet.c
+++ b/drivers/irqchip/irq-uniphier-aidet.c
@@ -188,7 +188,7 @@ static int uniphier_aidet_probe(struct platform_device *p=
dev)
 	priv->domain =3D irq_domain_create_hierarchy(
 					parent_domain, 0,
 					UNIPHIER_AIDET_NR_IRQS,
-					of_node_to_fwnode(dev->of_node),
+					of_fwnode_handle(dev->of_node),
 					&uniphier_aidet_domain_ops, priv);
 	if (!priv->domain)
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versa=
tile-fpga.c
index 0abc8934c2ee..034ce6afe170 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -176,8 +176,8 @@ static void __init fpga_irq_init(void __iomem *base, int =
parent_irq,
 						 f);
 	}
=20
-	f->domain =3D irq_domain_add_linear(node, fls(valid),
-					  &fpga_irqdomain_ops, f);
+	f->domain =3D irq_domain_create_linear(of_fwnode_handle(node), fls(valid),
+					     &fpga_irqdomain_ops, f);
=20
 	/* This will allocate all valid descriptors in the linear case */
 	for (i =3D 0; i < fls(valid); i++)
diff --git a/drivers/irqchip/irq-vf610-mscm-ir.c b/drivers/irqchip/irq-vf610-=
mscm-ir.c
index 2b9a8ba58e26..5d9c7503aa7f 100644
--- a/drivers/irqchip/irq-vf610-mscm-ir.c
+++ b/drivers/irqchip/irq-vf610-mscm-ir.c
@@ -209,9 +209,9 @@ static int __init vf610_mscm_ir_of_init(struct device_nod=
e *node,
 	regmap_read(mscm_cp_regmap, MSCM_CPxNUM, &cpuid);
 	mscm_ir_data->cpu_mask =3D 0x1 << cpuid;
=20
-	domain =3D irq_domain_add_hierarchy(domain_parent, 0,
-					  MSCM_IRSPRC_NUM, node,
-					  &mscm_irq_domain_ops, mscm_ir_data);
+	domain =3D irq_domain_create_hierarchy(domain_parent, 0, MSCM_IRSPRC_NUM,
+					     of_fwnode_handle(node), &mscm_irq_domain_ops,
+					     mscm_ir_data);
 	if (!domain) {
 		ret =3D -ENOMEM;
 		goto out_unmap;
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index ea93e7236c4a..2bcdf216a000 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -289,8 +289,9 @@ static void __init vic_register(void __iomem *base, unsig=
ned int parent_irq,
 						 vic_handle_irq_cascaded, v);
 	}
=20
-	v->domain =3D irq_domain_add_simple(node, fls(valid_sources), irq,
-					  &vic_irqdomain_ops, v);
+	v->domain =3D irq_domain_create_simple(of_fwnode_handle(node),
+					     fls(valid_sources), irq,
+					     &vic_irqdomain_ops, v);
 	/* create an IRQ mapping for each valid IRQ */
 	for (i =3D 0; i < fls(valid_sources); i++)
 		if (valid_sources & (1 << i))
diff --git a/drivers/irqchip/irq-wpcm450-aic.c b/drivers/irqchip/irq-wpcm450-=
aic.c
index 91df62a64cd9..a8ed4894d29e 100644
--- a/drivers/irqchip/irq-wpcm450-aic.c
+++ b/drivers/irqchip/irq-wpcm450-aic.c
@@ -154,7 +154,7 @@ static int __init wpcm450_aic_of_init(struct device_node =
*node,
=20
 	set_handle_irq(wpcm450_aic_handle_irq);
=20
-	aic->domain =3D irq_domain_add_linear(node, AIC_NUM_IRQS, &wpcm450_aic_ops,=
 aic);
+	aic->domain =3D irq_domain_create_linear(of_fwnode_handle(node), AIC_NUM_IR=
QS, &wpcm450_aic_ops, aic);
=20
 	return 0;
 }
diff --git a/drivers/irqchip/irq-xilinx-intc.c b/drivers/irqchip/irq-xilinx-i=
ntc.c
index 38727e9cc713..92dcb9fdcb25 100644
--- a/drivers/irqchip/irq-xilinx-intc.c
+++ b/drivers/irqchip/irq-xilinx-intc.c
@@ -212,8 +212,8 @@ static int __init xilinx_intc_of_init(struct device_node =
*intc,
 		xintc_write(irqc, MER, MER_HIE | MER_ME);
 	}
=20
-	irqc->root_domain =3D irq_domain_add_linear(intc, irqc->nr_irq,
-						  &xintc_irq_domain_ops, irqc);
+	irqc->root_domain =3D irq_domain_create_linear(of_fwnode_handle(intc), irqc=
->nr_irq,
+						     &xintc_irq_domain_ops, irqc);
 	if (!irqc->root_domain) {
 		pr_err("irq-xilinx: Unable to create IRQ domain\n");
 		ret =3D -EINVAL;
diff --git a/drivers/irqchip/irq-xtensa-mx.c b/drivers/irqchip/irq-xtensa-mx.c
index 9b441d180299..9fdacbd89a63 100644
--- a/drivers/irqchip/irq-xtensa-mx.c
+++ b/drivers/irqchip/irq-xtensa-mx.c
@@ -167,8 +167,7 @@ static void __init xtensa_mx_init_common(struct irq_domai=
n *root_domain)
 int __init xtensa_mx_init_legacy(struct device_node *interrupt_parent)
 {
 	struct irq_domain *root_domain =3D
-		irq_domain_add_legacy(NULL, NR_IRQS - 1, 1, 0,
-				&xtensa_mx_irq_domain_ops,
+		irq_domain_create_legacy(NULL, NR_IRQS - 1, 1, 0, &xtensa_mx_irq_domain_op=
s,
 				&xtensa_mx_irq_chip);
 	xtensa_mx_init_common(root_domain);
 	return 0;
@@ -178,7 +177,7 @@ static int __init xtensa_mx_init(struct device_node *np,
 		struct device_node *interrupt_parent)
 {
 	struct irq_domain *root_domain =3D
-		irq_domain_add_linear(np, NR_IRQS, &xtensa_mx_irq_domain_ops,
+		irq_domain_create_linear(of_fwnode_handle(np), NR_IRQS, &xtensa_mx_irq_dom=
ain_ops,
 				&xtensa_mx_irq_chip);
 	xtensa_mx_init_common(root_domain);
 	return 0;
diff --git a/drivers/irqchip/irq-xtensa-pic.c b/drivers/irqchip/irq-xtensa-pi=
c.c
index 9be7b7c5cd23..44e7be051a2e 100644
--- a/drivers/irqchip/irq-xtensa-pic.c
+++ b/drivers/irqchip/irq-xtensa-pic.c
@@ -85,7 +85,7 @@ static struct irq_chip xtensa_irq_chip =3D {
 int __init xtensa_pic_init_legacy(struct device_node *interrupt_parent)
 {
 	struct irq_domain *root_domain =3D
-		irq_domain_add_legacy(NULL, NR_IRQS - 1, 1, 0,
+		irq_domain_create_legacy(NULL, NR_IRQS - 1, 1, 0,
 				&xtensa_irq_domain_ops, &xtensa_irq_chip);
 	irq_set_default_domain(root_domain);
 	return 0;
@@ -95,7 +95,7 @@ static int __init xtensa_pic_init(struct device_node *np,
 		struct device_node *interrupt_parent)
 {
 	struct irq_domain *root_domain =3D
-		irq_domain_add_linear(np, NR_IRQS, &xtensa_irq_domain_ops,
+		irq_domain_create_linear(of_fwnode_handle(np), NR_IRQS, &xtensa_irq_domain=
_ops,
 				&xtensa_irq_chip);
 	irq_set_default_domain(root_domain);
 	return 0;
diff --git a/drivers/irqchip/irq-zevio.c b/drivers/irqchip/irq-zevio.c
index 7a72620fc478..22d46c246594 100644
--- a/drivers/irqchip/irq-zevio.c
+++ b/drivers/irqchip/irq-zevio.c
@@ -92,8 +92,8 @@ static int __init zevio_of_init(struct device_node *node,
 	zevio_init_irq_base(zevio_irq_io + IO_IRQ_BASE);
 	zevio_init_irq_base(zevio_irq_io + IO_FIQ_BASE);
=20
-	zevio_irq_domain =3D irq_domain_add_linear(node, MAX_INTRS,
-						 &irq_generic_chip_ops, NULL);
+	zevio_irq_domain =3D irq_domain_create_linear(of_fwnode_handle(node), MAX_I=
NTRS,
+						    &irq_generic_chip_ops, NULL);
 	BUG_ON(!zevio_irq_domain);
=20
 	ret =3D irq_alloc_domain_generic_chips(zevio_irq_domain, MAX_INTRS, 1,
diff --git a/drivers/irqchip/spear-shirq.c b/drivers/irqchip/spear-shirq.c
index 7c17a6f643ef..576e55569d77 100644
--- a/drivers/irqchip/spear-shirq.c
+++ b/drivers/irqchip/spear-shirq.c
@@ -239,7 +239,7 @@ static int __init shirq_init(struct spear_shirq **shirq_b=
locks, int block_nr,
 		goto err_unmap;
 	}
=20
-	shirq_domain =3D irq_domain_add_legacy(np, nr_irqs, virq_base, 0,
+	shirq_domain =3D irq_domain_create_legacy(of_fwnode_handle(np), nr_irqs, vi=
rq_base, 0,
 			&irq_domain_simple_ops, NULL);
 	if (WARN_ON(!shirq_domain)) {
 		pr_warn("%s: irq domain init failed\n", __func__);
diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 0b17a38ea6bf..ea44ffb5ce1a 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -312,8 +312,8 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 	if (!name)
 		return -ENOMEM;
=20
-	ipcc->irq_domain =3D irq_domain_add_tree(pdev->dev.of_node,
-					       &qcom_ipcc_irq_ops, ipcc);
+	ipcc->irq_domain =3D irq_domain_create_tree(of_fwnode_handle(pdev->dev.of_n=
ode),
+						  &qcom_ipcc_irq_ops, ipcc);
 	if (!ipcc->irq_domain)
 		return -ENOMEM;
=20
diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 53f1888cc84f..d5bf3243fe78 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -1455,10 +1455,8 @@ static int gpmc_setup_irq(struct gpmc_device *gpmc)
 	gpmc->irq_chip.irq_unmask =3D gpmc_irq_unmask;
 	gpmc->irq_chip.irq_set_type =3D gpmc_irq_set_type;
=20
-	gpmc_irq_domain =3D irq_domain_add_linear(gpmc->dev->of_node,
-						gpmc->nirqs,
-						&gpmc_irq_domain_ops,
-						gpmc);
+	gpmc_irq_domain =3D irq_domain_create_linear(of_fwnode_handle(gpmc->dev->of=
_node),
+						   gpmc->nirqs, &gpmc_irq_domain_ops, gpmc);
 	if (!gpmc_irq_domain) {
 		dev_err(gpmc->dev, "IRQ domain add failed\n");
 		return -ENODEV;
diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 8e68b64bd7f8..488e346047c1 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -624,8 +624,8 @@ static int device_irq_init(struct pm860x_chip *chip,
 		ret =3D -EBUSY;
 		goto out;
 	}
-	irq_domain_add_legacy(node, nr_irqs, chip->irq_base, 0,
-			      &pm860x_irq_domain_ops, chip);
+	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, chip->irq_base, 0,
+				 &pm860x_irq_domain_ops, chip);
 	chip->core_irq =3D i2c->irq;
 	if (!chip->core_irq)
 		goto out;
diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 15c95828b09a..049abcbd71ce 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -580,9 +580,9 @@ static int ab8500_irq_init(struct ab8500 *ab8500, struct =
device_node *np)
 		num_irqs =3D AB8500_NR_IRQS;
=20
 	/* If ->irq_base is zero this will give a linear mapping */
-	ab8500->domain =3D irq_domain_add_simple(ab8500->dev->of_node,
-					       num_irqs, 0,
-					       &ab8500_irq_ops, ab8500);
+	ab8500->domain =3D irq_domain_create_simple(of_fwnode_handle(ab8500->dev->o=
f_node),
+						  num_irqs, 0,
+						  &ab8500_irq_ops, ab8500);
=20
 	if (!ab8500->domain) {
 		dev_err(ab8500->dev, "Failed to create irqdomain\n");
diff --git a/drivers/mfd/arizona-irq.c b/drivers/mfd/arizona-irq.c
index d919ae9691e2..ac2139597fab 100644
--- a/drivers/mfd/arizona-irq.c
+++ b/drivers/mfd/arizona-irq.c
@@ -312,8 +312,7 @@ int arizona_irq_init(struct arizona *arizona)
 	flags |=3D arizona->pdata.irq_flags;
=20
 	/* Allocate a virtual IRQ domain to distribute to the regmap domains */
-	arizona->virq =3D irq_domain_add_linear(NULL, 2, &arizona_domain_ops,
-					      arizona);
+	arizona->virq =3D irq_domain_create_linear(NULL, 2, &arizona_domain_ops, ar=
izona);
 	if (!arizona->virq) {
 		dev_err(arizona->dev, "Failed to add core IRQ domain\n");
 		ret =3D -EINVAL;
diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index 5b3e355e78f6..21e68a382b11 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -2607,9 +2607,9 @@ static int db8500_irq_init(struct device_node *np)
 {
 	int i;
=20
-	db8500_irq_domain =3D irq_domain_add_simple(
-		np, NUM_PRCMU_WAKEUPS, 0,
-		&db8500_irq_ops, NULL);
+	db8500_irq_domain =3D irq_domain_create_simple(of_fwnode_handle(np),
+						     NUM_PRCMU_WAKEUPS, 0,
+						     &db8500_irq_ops, NULL);
=20
 	if (!db8500_irq_domain) {
 		pr_err("Failed to create irqdomain\n");
diff --git a/drivers/mfd/fsl-imx25-tsadc.c b/drivers/mfd/fsl-imx25-tsadc.c
index 6fe388da6fb6..d47152467951 100644
--- a/drivers/mfd/fsl-imx25-tsadc.c
+++ b/drivers/mfd/fsl-imx25-tsadc.c
@@ -65,15 +65,14 @@ static int mx25_tsadc_setup_irq(struct platform_device *p=
dev,
 				struct mx25_tsadc *tsadc)
 {
 	struct device *dev =3D &pdev->dev;
-	struct device_node *np =3D dev->of_node;
 	int irq;
=20
 	irq =3D platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
=20
-	tsadc->domain =3D irq_domain_add_simple(np, 2, 0, &mx25_tsadc_domain_ops,
-					      tsadc);
+	tsadc->domain =3D irq_domain_create_simple(of_fwnode_handle(dev->of_node), =
2, 0,
+						 &mx25_tsadc_domain_ops, tsadc);
 	if (!tsadc->domain) {
 		dev_err(dev, "Failed to add irq domain\n");
 		return -ENOMEM;
diff --git a/drivers/mfd/lp8788-irq.c b/drivers/mfd/lp8788-irq.c
index 39006297f3d2..ea0fdf7a4b6e 100644
--- a/drivers/mfd/lp8788-irq.c
+++ b/drivers/mfd/lp8788-irq.c
@@ -161,7 +161,7 @@ int lp8788_irq_init(struct lp8788 *lp, int irq)
 		return -ENOMEM;
=20
 	irqd->lp =3D lp;
-	irqd->domain =3D irq_domain_add_linear(lp->dev->of_node, LP8788_INT_MAX,
+	irqd->domain =3D irq_domain_create_linear(of_fwnode_handle(lp->dev->of_node=
), LP8788_INT_MAX,
 					&lp8788_domain_ops, irqd);
 	if (!irqd->domain) {
 		dev_err(lp->dev, "failed to add irq domain err\n");
diff --git a/drivers/mfd/max8925-core.c b/drivers/mfd/max8925-core.c
index 105d79b91493..78b16c67a5fc 100644
--- a/drivers/mfd/max8925-core.c
+++ b/drivers/mfd/max8925-core.c
@@ -682,8 +682,8 @@ static int max8925_irq_init(struct max8925_chip *chip, in=
t irq,
 		return -EBUSY;
 	}
=20
-	irq_domain_add_legacy(node, MAX8925_NR_IRQS, chip->irq_base, 0,
-			      &max8925_irq_domain_ops, chip);
+	irq_domain_create_legacy(of_fwnode_handle(node), MAX8925_NR_IRQS, chip->irq=
_base, 0,
+				 &max8925_irq_domain_ops, chip);
=20
 	/* request irq handler for pmic main irq*/
 	chip->core_irq =3D irq;
diff --git a/drivers/mfd/max8997-irq.c b/drivers/mfd/max8997-irq.c
index 92e348df03d1..cc87571c9af5 100644
--- a/drivers/mfd/max8997-irq.c
+++ b/drivers/mfd/max8997-irq.c
@@ -327,8 +327,8 @@ int max8997_irq_init(struct max8997_dev *max8997)
 					true : false;
 	}
=20
-	domain =3D irq_domain_add_linear(NULL, MAX8997_IRQ_NR,
-					&max8997_irq_domain_ops, max8997);
+	domain =3D irq_domain_create_linear(NULL, MAX8997_IRQ_NR,
+					  &max8997_irq_domain_ops, max8997);
 	if (!domain) {
 		dev_err(max8997->dev, "could not create irq domain\n");
 		return -ENODEV;
diff --git a/drivers/mfd/max8998-irq.c b/drivers/mfd/max8998-irq.c
index 83b6f510bc05..b0773fa6e07f 100644
--- a/drivers/mfd/max8998-irq.c
+++ b/drivers/mfd/max8998-irq.c
@@ -230,7 +230,7 @@ int max8998_irq_init(struct max8998_dev *max8998)
 	max8998_write_reg(max8998->i2c, MAX8998_REG_STATUSM1, 0xff);
 	max8998_write_reg(max8998->i2c, MAX8998_REG_STATUSM2, 0xff);
=20
-	domain =3D irq_domain_add_simple(NULL, MAX8998_IRQ_NR,
+	domain =3D irq_domain_create_simple(NULL, MAX8998_IRQ_NR,
 			max8998->irq_base, &max8998_irq_domain_ops, max8998);
 	if (!domain) {
 		dev_err(max8998->dev, "could not create irq domain\n");
diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
index 49830b526ee8..9f0bcc3ad7a1 100644
--- a/drivers/mfd/mt6358-irq.c
+++ b/drivers/mfd/mt6358-irq.c
@@ -272,9 +272,9 @@ int mt6358_irq_init(struct mt6397_chip *chip)
 				     irqd->pmic_ints[i].en_reg_shift * j, 0);
 	}
=20
-	chip->irq_domain =3D irq_domain_add_linear(chip->dev->of_node,
-						 irqd->num_pmic_irqs,
-						 &mt6358_irq_domain_ops, chip);
+	chip->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(chip->dev->o=
f_node),
+						    irqd->num_pmic_irqs,
+						    &mt6358_irq_domain_ops, chip);
 	if (!chip->irq_domain) {
 		dev_err(chip->dev, "Could not create IRQ domain\n");
 		return -ENODEV;
diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
index 1310665200ed..badc614b4345 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -216,10 +216,8 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 		regmap_write(chip->regmap, chip->int_con[2], 0x0);
=20
 	chip->pm_nb.notifier_call =3D mt6397_irq_pm_notifier;
-	chip->irq_domain =3D irq_domain_add_linear(chip->dev->of_node,
-						 MT6397_IRQ_NR,
-						 &mt6397_irq_domain_ops,
-						 chip);
+	chip->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(chip->dev->o=
f_node),
+						    MT6397_IRQ_NR, &mt6397_irq_domain_ops, chip);
 	if (!chip->irq_domain) {
 		dev_err(chip->dev, "could not create irq domain\n");
 		return -ENOMEM;
diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index f9ebdf5845b8..c96ea6fbede8 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -559,10 +559,8 @@ static int pm8xxx_probe(struct platform_device *pdev)
 	chip->pm_irq_data =3D data;
 	spin_lock_init(&chip->pm_irq_lock);
=20
-	chip->irqdomain =3D irq_domain_add_linear(pdev->dev.of_node,
-						data->num_irqs,
-						&pm8xxx_irq_domain_ops,
-						chip);
+	chip->irqdomain =3D irq_domain_create_linear(of_fwnode_handle(pdev->dev.of_=
node),
+						   data->num_irqs, &pm8xxx_irq_domain_ops, chip);
 	if (!chip->irqdomain)
 		return -ENODEV;
=20
diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index f391c2ccaa72..823b1d29389e 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -269,7 +269,7 @@ static int stmfx_irq_init(struct i2c_client *client)
 	u32 irqoutpin =3D 0, irqtrigger;
 	int ret;
=20
-	stmfx->irq_domain =3D irq_domain_add_simple(stmfx->dev->of_node,
+	stmfx->irq_domain =3D irq_domain_create_simple(of_fwnode_handle(stmfx->dev-=
>of_node),
 						  STMFX_REG_IRQ_SRC_MAX, 0,
 						  &stmfx_irq_ops, stmfx);
 	if (!stmfx->irq_domain) {
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 9c3cf58457a7..819d19dc9b4a 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1219,8 +1219,8 @@ static int stmpe_irq_init(struct stmpe *stmpe, struct d=
evice_node *np)
 	int base =3D 0;
 	int num_irqs =3D stmpe->variant->num_irqs;
=20
-	stmpe->domain =3D irq_domain_add_simple(np, num_irqs, base,
-					      &stmpe_irq_ops, stmpe);
+	stmpe->domain =3D irq_domain_create_simple(of_fwnode_handle(np), num_irqs,
+						 base, &stmpe_irq_ops, stmpe);
 	if (!stmpe->domain) {
 		dev_err(stmpe->dev, "Failed to create irqdomain\n");
 		return -ENOSYS;
diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
index ef953ee73145..2d4eb771e230 100644
--- a/drivers/mfd/tc3589x.c
+++ b/drivers/mfd/tc3589x.c
@@ -234,9 +234,9 @@ static const struct irq_domain_ops tc3589x_irq_ops =3D {
=20
 static int tc3589x_irq_init(struct tc3589x *tc3589x, struct device_node *np)
 {
-	tc3589x->domain =3D irq_domain_add_simple(
-		np, TC3589x_NR_INTERNAL_IRQS, 0,
-		&tc3589x_irq_ops, tc3589x);
+	tc3589x->domain =3D irq_domain_create_simple(of_fwnode_handle(np),
+						   TC3589x_NR_INTERNAL_IRQS, 0,
+						   &tc3589x_irq_ops, tc3589x);
=20
 	if (!tc3589x->domain) {
 		dev_err(tc3589x->dev, "Failed to create irqdomain\n");
diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
index 029ecc32f078..4e9669d327b4 100644
--- a/drivers/mfd/tps65217.c
+++ b/drivers/mfd/tps65217.c
@@ -158,7 +158,7 @@ static int tps65217_irq_init(struct tps65217 *tps, int ir=
q)
 	tps65217_set_bits(tps, TPS65217_REG_INT, TPS65217_INT_MASK,
 			  TPS65217_INT_MASK, TPS65217_PROTECT_NONE);
=20
-	tps->irq_domain =3D irq_domain_add_linear(tps->dev->of_node,
+	tps->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(tps->dev->of_=
node),
 		TPS65217_NUM_IRQ, &tps65217_irq_domain_ops, tps);
 	if (!tps->irq_domain) {
 		dev_err(tps->dev, "Could not create IRQ domain\n");
diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 82714899efb2..853c48286071 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -363,7 +363,7 @@ static int tps6586x_irq_init(struct tps6586x *tps6586x, i=
nt irq,
 		new_irq_base =3D 0;
 	}
=20
-	tps6586x->irq_domain =3D irq_domain_add_simple(tps6586x->dev->of_node,
+	tps6586x->irq_domain =3D irq_domain_create_simple(of_fwnode_handle(tps6586x=
->dev->of_node),
 				irq_num, new_irq_base, &tps6586x_domain_ops,
 				tps6586x);
 	if (!tps6586x->irq_domain) {
diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 87496c1cb8bc..232c2bfe8c18 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -691,8 +691,8 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 		return irq_base;
 	}
=20
-	irq_domain_add_legacy(node, nr_irqs, irq_base, 0,
-			      &irq_domain_simple_ops, NULL);
+	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, irq_base, 0,
+				 &irq_domain_simple_ops, NULL);
=20
 	irq_end =3D irq_base + TWL4030_CORE_NR_IRQS;
=20
diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
index 3c03681c124c..00b14cef1dfb 100644
--- a/drivers/mfd/twl6030-irq.c
+++ b/drivers/mfd/twl6030-irq.c
@@ -364,7 +364,6 @@ static const struct of_device_id twl6030_of_match[] __may=
be_unused =3D {
=20
 int twl6030_init_irq(struct device *dev, int irq_num)
 {
-	struct			device_node *node =3D dev->of_node;
 	int			nr_irqs;
 	int			status;
 	u8			mask[3];
@@ -412,8 +411,8 @@ int twl6030_init_irq(struct device *dev, int irq_num)
 	twl6030_irq->irq_mapping_tbl =3D of_id->data;
=20
 	twl6030_irq->irq_domain =3D
-		irq_domain_add_linear(node, nr_irqs,
-				      &twl6030_irq_domain_ops, twl6030_irq);
+		irq_domain_create_linear(of_fwnode_handle(dev->of_node), nr_irqs,
+					 &twl6030_irq_domain_ops, twl6030_irq);
 	if (!twl6030_irq->irq_domain) {
 		dev_err(dev, "Can't add irq_domain\n");
 		return -ENOMEM;
diff --git a/drivers/mfd/wm831x-irq.c b/drivers/mfd/wm831x-irq.c
index f1f58e3149ae..b3883fa5dd9f 100644
--- a/drivers/mfd/wm831x-irq.c
+++ b/drivers/mfd/wm831x-irq.c
@@ -587,16 +587,13 @@ int wm831x_irq_init(struct wm831x *wm831x, int irq)
 	}
=20
 	if (irq_base)
-		domain =3D irq_domain_add_legacy(wm831x->dev->of_node,
-					       ARRAY_SIZE(wm831x_irqs),
-					       irq_base, 0,
-					       &wm831x_irq_domain_ops,
-					       wm831x);
+		domain =3D irq_domain_create_legacy(of_fwnode_handle(wm831x->dev->of_node),
+						  ARRAY_SIZE(wm831x_irqs), irq_base, 0,
+						  &wm831x_irq_domain_ops, wm831x);
 	else
-		domain =3D irq_domain_add_linear(wm831x->dev->of_node,
-					       ARRAY_SIZE(wm831x_irqs),
-					       &wm831x_irq_domain_ops,
-					       wm831x);
+		domain =3D irq_domain_create_linear(of_fwnode_handle(wm831x->dev->of_node),
+						  ARRAY_SIZE(wm831x_irqs), &wm831x_irq_domain_ops,
+						  wm831x);
=20
 	if (!domain) {
 		dev_warn(wm831x->dev, "Failed to allocate IRQ domain\n");
diff --git a/drivers/mfd/wm8994-irq.c b/drivers/mfd/wm8994-irq.c
index 651a028bc519..1475b1ac6983 100644
--- a/drivers/mfd/wm8994-irq.c
+++ b/drivers/mfd/wm8994-irq.c
@@ -213,9 +213,7 @@ int wm8994_irq_init(struct wm8994 *wm8994)
 			return ret;
 		}
=20
-		wm8994->edge_irq =3D irq_domain_add_linear(NULL, 1,
-							 &wm8994_edge_irq_ops,
-							 wm8994);
+		wm8994->edge_irq =3D irq_domain_create_linear(NULL, 1, &wm8994_edge_irq_op=
s, wm8994);
=20
 		ret =3D regmap_add_irq_chip(wm8994->regmap,
 					  irq_create_mapping(wm8994->edge_irq,
diff --git a/drivers/misc/hi6421v600-irq.c b/drivers/misc/hi6421v600-irq.c
index 69ee4f39af2a..187c5bc91e31 100644
--- a/drivers/misc/hi6421v600-irq.c
+++ b/drivers/misc/hi6421v600-irq.c
@@ -254,8 +254,9 @@ static int hi6421v600_irq_probe(struct platform_device *p=
dev)
 	if (!priv->irqs)
 		return -ENOMEM;
=20
-	priv->domain =3D irq_domain_add_simple(np, PMIC_IRQ_LIST_MAX, 0,
-					     &hi6421v600_domain_ops, priv);
+	priv->domain =3D irq_domain_create_simple(of_fwnode_handle(np),
+						PMIC_IRQ_LIST_MAX, 0,
+						&hi6421v600_domain_ops, priv);
 	if (!priv->domain) {
 		dev_err(dev, "Failed to create IRQ domain\n");
 		return -ENODEV;
diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microch=
ip/ksz_common.c
index 89f0796894af..579ee504fed5 100644
--- a/drivers/net/dsa/microchip/ksz_common.c
+++ b/drivers/net/dsa/microchip/ksz_common.c
@@ -2697,8 +2697,9 @@ static int ksz_irq_common_setup(struct ksz_device *dev,=
 struct ksz_irq *kirq)
 	kirq->dev =3D dev;
 	kirq->masked =3D ~0;
=20
-	kirq->domain =3D irq_domain_add_simple(dev->dev->of_node, kirq->nirqs, 0,
-					     &ksz_irq_domain_ops, kirq);
+	kirq->domain =3D irq_domain_create_simple(of_fwnode_handle(dev->dev->of_nod=
e),
+						kirq->nirqs, 0,
+						&ksz_irq_domain_ops, kirq);
 	if (!kirq->domain)
 		return -ENOMEM;
=20
diff --git a/drivers/net/dsa/microchip/ksz_ptp.c b/drivers/net/dsa/microchip/=
ksz_ptp.c
index 22fb9ef4645c..992101e4bdee 100644
--- a/drivers/net/dsa/microchip/ksz_ptp.c
+++ b/drivers/net/dsa/microchip/ksz_ptp.c
@@ -1136,8 +1136,8 @@ int ksz_ptp_irq_setup(struct dsa_switch *ds, u8 p)
=20
 	init_completion(&port->tstamp_msg_comp);
=20
-	ptpirq->domain =3D irq_domain_add_linear(dev->dev->of_node, ptpirq->nirqs,
-					       &ksz_ptp_irq_domain_ops, ptpirq);
+	ptpirq->domain =3D irq_domain_create_linear(of_fwnode_handle(dev->dev->of_n=
ode),
+						  ptpirq->nirqs, &ksz_ptp_irq_domain_ops, ptpirq);
 	if (!ptpirq->domain)
 		return -ENOMEM;
=20
diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chi=
p.c
index 29a89ab4b789..dd616eb809ea 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -297,7 +297,7 @@ static int mv88e6xxx_g1_irq_setup_common(struct mv88e6xxx=
_chip *chip)
 	u16 reg, mask;
=20
 	chip->g1_irq.nirqs =3D chip->info->g1_irqs;
-	chip->g1_irq.domain =3D irq_domain_add_simple(
+	chip->g1_irq.domain =3D irq_domain_create_simple(
 		NULL, chip->g1_irq.nirqs, 0,
 		&mv88e6xxx_g1_irq_domain_ops, chip);
 	if (!chip->g1_irq.domain)
diff --git a/drivers/net/dsa/mv88e6xxx/global2.c b/drivers/net/dsa/mv88e6xxx/=
global2.c
index b2b5f6ba438f..aaf97c1e3167 100644
--- a/drivers/net/dsa/mv88e6xxx/global2.c
+++ b/drivers/net/dsa/mv88e6xxx/global2.c
@@ -1154,8 +1154,10 @@ int mv88e6xxx_g2_irq_setup(struct mv88e6xxx_chip *chip)
 	if (err)
 		return err;
=20
-	chip->g2_irq.domain =3D irq_domain_add_simple(
-		chip->dev->of_node, 16, 0, &mv88e6xxx_g2_irq_domain_ops, chip);
+	chip->g2_irq.domain =3D irq_domain_create_simple(of_fwnode_handle(chip->dev=
->of_node),
+						       16, 0,
+						       &mv88e6xxx_g2_irq_domain_ops,
+						       chip);
 	if (!chip->g2_irq.domain)
 		return -ENOMEM;
=20
diff --git a/drivers/net/dsa/qca/ar9331.c b/drivers/net/dsa/qca/ar9331.c
index e9f2c67bc15f..79a29676ca6f 100644
--- a/drivers/net/dsa/qca/ar9331.c
+++ b/drivers/net/dsa/qca/ar9331.c
@@ -821,8 +821,8 @@ static int ar9331_sw_irq_init(struct ar9331_sw_priv *priv)
 		return ret;
 	}
=20
-	priv->irqdomain =3D irq_domain_add_linear(np, 1, &ar9331_sw_irqdomain_ops,
-						priv);
+	priv->irqdomain =3D irq_domain_create_linear(of_fwnode_handle(np), 1,
+						   &ar9331_sw_irqdomain_ops, priv);
 	if (!priv->irqdomain) {
 		dev_err(dev, "failed to create IRQ domain\n");
 		return -EINVAL;
diff --git a/drivers/net/dsa/realtek/rtl8365mb.c b/drivers/net/dsa/realtek/rt=
l8365mb.c
index 7e96355c28bd..964a56ee16cc 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.c
+++ b/drivers/net/dsa/realtek/rtl8365mb.c
@@ -1719,8 +1719,8 @@ static int rtl8365mb_irq_setup(struct realtek_priv *pri=
v)
 		goto out_put_node;
 	}
=20
-	priv->irqdomain =3D irq_domain_add_linear(intc, priv->num_ports,
-						&rtl8365mb_irqdomain_ops, priv);
+	priv->irqdomain =3D irq_domain_create_linear(of_fwnode_handle(intc), priv->=
num_ports,
+						   &rtl8365mb_irqdomain_ops, priv);
 	if (!priv->irqdomain) {
 		dev_err(priv->dev, "failed to add irq domain\n");
 		ret =3D -ENOMEM;
diff --git a/drivers/net/dsa/realtek/rtl8366rb.c b/drivers/net/dsa/realtek/rt=
l8366rb.c
index f54771cab56d..8bdb52b5fdcb 100644
--- a/drivers/net/dsa/realtek/rtl8366rb.c
+++ b/drivers/net/dsa/realtek/rtl8366rb.c
@@ -550,10 +550,8 @@ static int rtl8366rb_setup_cascaded_irq(struct realtek_p=
riv *priv)
 		dev_err(priv->dev, "unable to request irq: %d\n", ret);
 		goto out_put_node;
 	}
-	priv->irqdomain =3D irq_domain_add_linear(intc,
-						RTL8366RB_NUM_INTERRUPT,
-						&rtl8366rb_irqdomain_ops,
-						priv);
+	priv->irqdomain =3D irq_domain_create_linear(of_fwnode_handle(intc), RTL836=
6RB_NUM_INTERRUPT,
+						   &rtl8366rb_irqdomain_ops, priv);
 	if (!priv->irqdomain) {
 		dev_err(priv->dev, "failed to create IRQ domain\n");
 		ret =3D -EINVAL;
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_irq.c b/drivers/net/eth=
ernet/wangxun/txgbe/txgbe_irq.c
index 8658a51ee810..f2c2bd257e39 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_irq.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_irq.c
@@ -184,8 +184,8 @@ int txgbe_setup_misc_irq(struct txgbe *txgbe)
 		goto skip_sp_irq;
=20
 	txgbe->misc.nirqs =3D 1;
-	txgbe->misc.domain =3D irq_domain_add_simple(NULL, txgbe->misc.nirqs, 0,
-						   &txgbe_misc_irq_domain_ops, txgbe);
+	txgbe->misc.domain =3D irq_domain_create_simple(NULL, txgbe->misc.nirqs, 0,
+						      &txgbe_misc_irq_domain_ops, txgbe);
 	if (!txgbe->misc.domain)
 		return -ENOMEM;
=20
diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index e4f1663b6204..3e8025a71fcb 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2456,14 +2456,11 @@ static struct irq_chip lan78xx_irqchip =3D {
=20
 static int lan78xx_setup_irq_domain(struct lan78xx_net *dev)
 {
-	struct device_node *of_node;
 	struct irq_domain *irqdomain;
 	unsigned int irqmap =3D 0;
 	u32 buf;
 	int ret =3D 0;
=20
-	of_node =3D dev->udev->dev.parent->of_node;
-
 	mutex_init(&dev->domain_data.irq_lock);
=20
 	ret =3D lan78xx_read_reg(dev, INT_EP_CTL, &buf);
@@ -2475,8 +2472,10 @@ static int lan78xx_setup_irq_domain(struct lan78xx_net=
 *dev)
 	dev->domain_data.irqchip =3D &lan78xx_irqchip;
 	dev->domain_data.irq_handler =3D handle_simple_irq;
=20
-	irqdomain =3D irq_domain_add_simple(of_node, MAX_INT_EP, 0,
-					  &chip_domain_ops, &dev->domain_data);
+	irqdomain =3D irq_domain_create_simple(of_fwnode_handle(dev->udev->dev.pare=
nt->of_node),
+					     MAX_INT_EP, 0,
+					     &chip_domain_ops,
+					     &dev->domain_data);
 	if (irqdomain) {
 		/* create mapping for PHY interrupt */
 		irqmap =3D irq_create_mapping(irqdomain, INT_EP_PHY);
diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller=
/dwc/pci-dra7xx.c
index 33d6bf460ffe..3219704aba0e 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -359,8 +359,8 @@ static int dra7xx_pcie_init_irq_domain(struct dw_pcie_rp =
*pp)
=20
 	irq_set_chained_handler_and_data(pp->irq, dra7xx_pcie_msi_irq_handler,
 					 pp);
-	dra7xx->irq_domain =3D irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX,
-						   &intx_domain_ops, pp);
+	dra7xx->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(pcie_intc_=
node),
+						      PCI_NUM_INTX, &intx_domain_ops, pp);
 	of_node_put(pcie_intc_node);
 	if (!dra7xx->irq_domain) {
 		dev_err(dev, "Failed to get a INTx IRQ domain\n");
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controll=
er/dwc/pci-keystone.c
index 76a37368ae4f..1385d9db7b32 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -761,7 +761,7 @@ static int ks_pcie_config_intx_irq(struct keystone_pcie *=
ks_pcie)
 						 ks_pcie);
 	}
=20
-	intx_irq_domain =3D irq_domain_add_linear(intc_np, PCI_NUM_INTX,
+	intx_irq_domain =3D irq_domain_create_linear(of_fwnode_handle(intc_np), PCI=
_NUM_INTX,
 					&ks_pcie_intx_irq_domain_ops, NULL);
 	if (!intx_irq_domain) {
 		dev_err(dev, "Failed to add irq domain for INTX irqs\n");
diff --git a/drivers/pci/controller/dwc/pcie-amd-mdb.c b/drivers/pci/controll=
er/dwc/pcie-amd-mdb.c
index 4eb2a4e8189d..9f7251a16d32 100644
--- a/drivers/pci/controller/dwc/pcie-amd-mdb.c
+++ b/drivers/pci/controller/dwc/pcie-amd-mdb.c
@@ -290,8 +290,8 @@ static int amd_mdb_pcie_init_irq_domains(struct amd_mdb_p=
cie *pcie,
 		return -ENODEV;
 	}
=20
-	pcie->mdb_domain =3D irq_domain_add_linear(pcie_intc_node, 32,
-						 &event_domain_ops, pcie);
+	pcie->mdb_domain =3D irq_domain_create_linear(of_fwnode_handle(pcie_intc_no=
de), 32,
+						    &event_domain_ops, pcie);
 	if (!pcie->mdb_domain) {
 		err =3D -ENOMEM;
 		dev_err(dev, "Failed to add MDB domain\n");
@@ -300,8 +300,8 @@ static int amd_mdb_pcie_init_irq_domains(struct amd_mdb_p=
cie *pcie,
=20
 	irq_domain_update_bus_token(pcie->mdb_domain, DOMAIN_BUS_NEXUS);
=20
-	pcie->intx_domain =3D irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX,
-						  &amd_intx_domain_ops, pcie);
+	pcie->intx_domain =3D irq_domain_create_linear(of_fwnode_handle(pcie_intc_n=
ode),
+						     PCI_NUM_INTX, &amd_intx_domain_ops, pcie);
 	if (!pcie->intx_domain) {
 		err =3D -ENOMEM;
 		dev_err(dev, "Failed to add INTx domain\n");
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/=
controller/dwc/pcie-designware-host.c
index ecc33f6789e3..d1cd48efad43 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -227,7 +227,7 @@ static const struct irq_domain_ops dw_pcie_msi_domain_ops=
 =3D {
 int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(pci->dev->of_node);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(pci->dev->of_node);
=20
 	pp->irq_domain =3D irq_domain_create_linear(fwnode, pp->num_vectors,
 					       &dw_pcie_msi_domain_ops, pp);
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/cont=
roller/dwc/pcie-dw-rockchip.c
index c624b7ebd118..678d510a261d 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -144,8 +144,8 @@ static int rockchip_pcie_init_irq_domain(struct rockchip_=
pcie *rockchip)
 		return -EINVAL;
 	}
=20
-	rockchip->irq_domain =3D irq_domain_add_linear(intc, PCI_NUM_INTX,
-						    &intx_domain_ops, rockchip);
+	rockchip->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(intc), P=
CI_NUM_INTX,
+							&intx_domain_ops, rockchip);
 	of_node_put(intc);
 	if (!rockchip->irq_domain) {
 		dev_err(dev, "failed to get a INTx IRQ domain\n");
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/control=
ler/dwc/pcie-uniphier.c
index 5757ca3803c9..43b28f826edd 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -279,7 +279,7 @@ static int uniphier_pcie_config_intx_irq(struct dw_pcie_r=
p *pp)
 		goto out_put_node;
 	}
=20
-	pcie->intx_irq_domain =3D irq_domain_add_linear(np_intc, PCI_NUM_INTX,
+	pcie->intx_irq_domain =3D irq_domain_create_linear(of_fwnode_handle(np_intc=
), PCI_NUM_INTX,
 						&uniphier_intx_domain_ops, pp);
 	if (!pcie->intx_irq_domain) {
 		dev_err(pci->dev, "Failed to get INTx domain\n");
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers/p=
ci/controller/mobiveil/pcie-mobiveil-host.c
index 0e088e74155d..a600f46ee3c3 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -435,12 +435,12 @@ static const struct irq_domain_ops msi_domain_ops =3D {
 static int mobiveil_allocate_msi_domains(struct mobiveil_pcie *pcie)
 {
 	struct device *dev =3D &pcie->pdev->dev;
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(dev->of_node);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(dev->of_node);
 	struct mobiveil_msi *msi =3D &pcie->rp.msi;
=20
 	mutex_init(&msi->lock);
-	msi->dev_domain =3D irq_domain_add_linear(NULL, msi->num_of_vectors,
-						&msi_domain_ops, pcie);
+	msi->dev_domain =3D irq_domain_create_linear(NULL, msi->num_of_vectors,
+						   &msi_domain_ops, pcie);
 	if (!msi->dev_domain) {
 		dev_err(dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
@@ -461,12 +461,11 @@ static int mobiveil_allocate_msi_domains(struct mobivei=
l_pcie *pcie)
 static int mobiveil_pcie_init_irq_domain(struct mobiveil_pcie *pcie)
 {
 	struct device *dev =3D &pcie->pdev->dev;
-	struct device_node *node =3D dev->of_node;
 	struct mobiveil_root_port *rp =3D &pcie->rp;
=20
 	/* setup INTx */
-	rp->intx_domain =3D irq_domain_add_linear(node, PCI_NUM_INTX,
-						&intx_domain_ops, pcie);
+	rp->intx_domain =3D irq_domain_create_linear(of_fwnode_handle(dev->of_node)=
, PCI_NUM_INTX,
+						   &intx_domain_ops, pcie);
=20
 	if (!rp->intx_domain) {
 		dev_err(dev, "Failed to get a INTx IRQ domain\n");
diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/p=
ci-aardvark.c
index a29796cce420..7bac64533b14 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -1456,9 +1456,8 @@ static int advk_pcie_init_msi_irq_domain(struct advk_pc=
ie *pcie)
 	raw_spin_lock_init(&pcie->msi_irq_lock);
 	mutex_init(&pcie->msi_used_lock);
=20
-	pcie->msi_inner_domain =3D
-		irq_domain_add_linear(NULL, MSI_IRQ_NUM,
-				      &advk_msi_domain_ops, pcie);
+	pcie->msi_inner_domain =3D irq_domain_create_linear(NULL, MSI_IRQ_NUM,
+							  &advk_msi_domain_ops, pcie);
 	if (!pcie->msi_inner_domain)
 		return -ENOMEM;
=20
@@ -1508,9 +1507,8 @@ static int advk_pcie_init_irq_domain(struct advk_pcie *=
pcie)
 	irq_chip->irq_mask =3D advk_pcie_irq_mask;
 	irq_chip->irq_unmask =3D advk_pcie_irq_unmask;
=20
-	pcie->irq_domain =3D
-		irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX,
-				      &advk_pcie_irq_domain_ops, pcie);
+	pcie->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(pcie_intc_no=
de), PCI_NUM_INTX,
+						    &advk_pcie_irq_domain_ops, pcie);
 	if (!pcie->irq_domain) {
 		dev_err(dev, "Failed to get a INTx IRQ domain\n");
 		ret =3D -ENOMEM;
@@ -1549,9 +1547,7 @@ static const struct irq_domain_ops advk_pcie_rp_irq_dom=
ain_ops =3D {
=20
 static int advk_pcie_init_rp_irq_domain(struct advk_pcie *pcie)
 {
-	pcie->rp_irq_domain =3D irq_domain_add_linear(NULL, 1,
-						    &advk_pcie_rp_irq_domain_ops,
-						    pcie);
+	pcie->rp_irq_domain =3D irq_domain_create_linear(NULL, 1, &advk_pcie_rp_irq=
_domain_ops, pcie);
 	if (!pcie->rp_irq_domain) {
 		dev_err(&pcie->pdev->dev, "Failed to add Root Port IRQ domain\n");
 		return -ENOMEM;
diff --git a/drivers/pci/controller/pci-ftpci100.c b/drivers/pci/controller/p=
ci-ftpci100.c
index ffdeed25e961..28e43831c0f1 100644
--- a/drivers/pci/controller/pci-ftpci100.c
+++ b/drivers/pci/controller/pci-ftpci100.c
@@ -345,8 +345,8 @@ static int faraday_pci_setup_cascaded_irq(struct faraday_=
pci *p)
 		return irq ?: -EINVAL;
 	}
=20
-	p->irqdomain =3D irq_domain_add_linear(intc, PCI_NUM_INTX,
-					     &faraday_pci_irqdomain_ops, p);
+	p->irqdomain =3D irq_domain_create_linear(of_fwnode_handle(intc), PCI_NUM_I=
NTX,
+						&faraday_pci_irqdomain_ops, p);
 	of_node_put(intc);
 	if (!p->irqdomain) {
 		dev_err(p->dev, "failed to create Gemini PCI IRQ domain\n");
diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-=
mvebu.c
index b0e3bce10aa4..60da24ba0a19 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1078,9 +1078,9 @@ static int mvebu_pcie_init_irq_domain(struct mvebu_pcie=
_port *port)
 		return -ENODEV;
 	}
=20
-	port->intx_irq_domain =3D irq_domain_add_linear(pcie_intc_node, PCI_NUM_INT=
X,
-						      &mvebu_pcie_intx_irq_domain_ops,
-						      port);
+	port->intx_irq_domain =3D irq_domain_create_linear(of_fwnode_handle(pcie_in=
tc_node),
+							 PCI_NUM_INTX,
+							 &mvebu_pcie_intx_irq_domain_ops, port);
 	of_node_put(pcie_intc_node);
 	if (!port->intx_irq_domain) {
 		dev_err(dev, "Failed to get INTx IRQ domain for %s\n", port->name);
diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/=
pci-xgene-msi.c
index 7bce327897c9..69a9c0a87639 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -247,7 +247,7 @@ static int xgene_allocate_domains(struct xgene_msi *msi)
 	if (!msi->inner_domain)
 		return -ENOMEM;
=20
-	msi->msi_domain =3D pci_msi_create_irq_domain(of_node_to_fwnode(msi->node),
+	msi->msi_domain =3D pci_msi_create_irq_domain(of_fwnode_handle(msi->node),
 						    &xgene_msi_domain_info,
 						    msi->inner_domain);
=20
diff --git a/drivers/pci/controller/pcie-altera-msi.c b/drivers/pci/controlle=
r/pcie-altera-msi.c
index e1cee3c0575f..a43f21eb8fbb 100644
--- a/drivers/pci/controller/pcie-altera-msi.c
+++ b/drivers/pci/controller/pcie-altera-msi.c
@@ -164,9 +164,9 @@ static const struct irq_domain_ops msi_domain_ops =3D {
=20
 static int altera_allocate_domains(struct altera_msi *msi)
 {
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(msi->pdev->dev.of_node);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(msi->pdev->dev.of_node);
=20
-	msi->inner_domain =3D irq_domain_add_linear(NULL, msi->num_of_vectors,
+	msi->inner_domain =3D irq_domain_create_linear(NULL, msi->num_of_vectors,
 					     &msi_domain_ops, msi);
 	if (!msi->inner_domain) {
 		dev_err(&msi->pdev->dev, "failed to create IRQ domain\n");
diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pc=
ie-altera.c
index 70409e71a18f..0fc77176a52e 100644
--- a/drivers/pci/controller/pcie-altera.c
+++ b/drivers/pci/controller/pcie-altera.c
@@ -855,7 +855,7 @@ static int altera_pcie_init_irq_domain(struct altera_pcie=
 *pcie)
 	struct device_node *node =3D dev->of_node;
=20
 	/* Setup INTx */
-	pcie->irq_domain =3D irq_domain_add_linear(node, PCI_NUM_INTX,
+	pcie->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(node), PCI_N=
UM_INTX,
 					&intx_domain_ops, pcie);
 	if (!pcie->irq_domain) {
 		dev_err(dev, "Failed to get a INTx IRQ domain\n");
diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/p=
cie-brcmstb.c
index e19628e13898..92887b394eb4 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -581,10 +581,10 @@ static const struct irq_domain_ops msi_domain_ops =3D {
=20
 static int brcm_allocate_domains(struct brcm_msi *msi)
 {
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(msi->np);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(msi->np);
 	struct device *dev =3D msi->dev;
=20
-	msi->inner_domain =3D irq_domain_add_linear(NULL, msi->nr, &msi_domain_ops,=
 msi);
+	msi->inner_domain =3D irq_domain_create_linear(NULL, msi->nr, &msi_domain_o=
ps, msi);
 	if (!msi->inner_domain) {
 		dev_err(dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
diff --git a/drivers/pci/controller/pcie-iproc-msi.c b/drivers/pci/controller=
/pcie-iproc-msi.c
index 649fcb449f34..d2cb4c4f821a 100644
--- a/drivers/pci/controller/pcie-iproc-msi.c
+++ b/drivers/pci/controller/pcie-iproc-msi.c
@@ -446,12 +446,12 @@ static void iproc_msi_disable(struct iproc_msi *msi)
 static int iproc_msi_alloc_domains(struct device_node *node,
 				   struct iproc_msi *msi)
 {
-	msi->inner_domain =3D irq_domain_add_linear(NULL, msi->nr_msi_vecs,
-						  &msi_domain_ops, msi);
+	msi->inner_domain =3D irq_domain_create_linear(NULL, msi->nr_msi_vecs,
+						     &msi_domain_ops, msi);
 	if (!msi->inner_domain)
 		return -ENOMEM;
=20
-	msi->msi_domain =3D pci_msi_create_irq_domain(of_node_to_fwnode(node),
+	msi->msi_domain =3D pci_msi_create_irq_domain(of_fwnode_handle(node),
 						    &iproc_msi_domain_info,
 						    msi->inner_domain);
 	if (!msi->msi_domain) {
diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/contro=
ller/pcie-mediatek-gen3.c
index 9d52504acae4..b55f5973414c 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -745,8 +745,8 @@ static int mtk_pcie_init_irq_domains(struct mtk_gen3_pcie=
 *pcie)
 		return -ENODEV;
 	}
=20
-	pcie->intx_domain =3D irq_domain_add_linear(intc_node, PCI_NUM_INTX,
-						  &intx_domain_ops, pcie);
+	pcie->intx_domain =3D irq_domain_create_linear(of_fwnode_handle(intc_node),=
 PCI_NUM_INTX,
+						     &intx_domain_ops, pcie);
 	if (!pcie->intx_domain) {
 		dev_err(dev, "failed to create INTx IRQ domain\n");
 		ret =3D -ENODEV;
@@ -756,8 +756,9 @@ static int mtk_pcie_init_irq_domains(struct mtk_gen3_pcie=
 *pcie)
 	/* Setup MSI */
 	mutex_init(&pcie->lock);
=20
-	pcie->msi_bottom_domain =3D irq_domain_add_linear(node, PCIE_MSI_IRQS_NUM,
-				  &mtk_msi_bottom_domain_ops, pcie);
+	pcie->msi_bottom_domain =3D irq_domain_create_linear(of_fwnode_handle(node),
+							   PCIE_MSI_IRQS_NUM,
+							   &mtk_msi_bottom_domain_ops, pcie);
 	if (!pcie->msi_bottom_domain) {
 		dev_err(dev, "failed to create MSI bottom domain\n");
 		ret =3D -ENODEV;
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/=
pcie-mediatek.c
index 811a8b4acd50..e1934aa06c8d 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -485,7 +485,7 @@ static struct msi_domain_info mtk_msi_domain_info =3D {
=20
 static int mtk_pcie_allocate_msi_domains(struct mtk_pcie_port *port)
 {
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(port->pcie->dev->of_node=
);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(port->pcie->dev->of_node);
=20
 	mutex_init(&port->lock);
=20
@@ -569,8 +569,8 @@ static int mtk_pcie_init_irq_domain(struct mtk_pcie_port =
*port,
 		return -ENODEV;
 	}
=20
-	port->irq_domain =3D irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX,
-						 &intx_domain_ops, port);
+	port->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(pcie_intc_no=
de), PCI_NUM_INTX,
+						    &intx_domain_ops, port);
 	of_node_put(pcie_intc_node);
 	if (!port->irq_domain) {
 		dev_err(dev, "failed to get INTx IRQ domain\n");
diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/contro=
ller/pcie-rockchip-host.c
index 6a46be17aa91..b9e7a8710cf0 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -693,8 +693,8 @@ static int rockchip_pcie_init_irq_domain(struct rockchip_=
pcie *rockchip)
 		return -EINVAL;
 	}
=20
-	rockchip->irq_domain =3D irq_domain_add_linear(intc, PCI_NUM_INTX,
-						    &intx_domain_ops, rockchip);
+	rockchip->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(intc), P=
CI_NUM_INTX,
+							&intx_domain_ops, rockchip);
 	of_node_put(intc);
 	if (!rockchip->irq_domain) {
 		dev_err(dev, "failed to get a INTx IRQ domain\n");
diff --git a/drivers/pci/controller/pcie-xilinx-cpm.c b/drivers/pci/controlle=
r/pcie-xilinx-cpm.c
index 13ca493d22bd..d38f27e20761 100644
--- a/drivers/pci/controller/pcie-xilinx-cpm.c
+++ b/drivers/pci/controller/pcie-xilinx-cpm.c
@@ -395,17 +395,15 @@ static int xilinx_cpm_pcie_init_irq_domain(struct xilin=
x_cpm_pcie *port)
 		return -EINVAL;
 	}
=20
-	port->cpm_domain =3D irq_domain_add_linear(pcie_intc_node, 32,
-						 &event_domain_ops,
-						 port);
+	port->cpm_domain =3D irq_domain_create_linear(of_fwnode_handle(pcie_intc_no=
de), 32,
+						    &event_domain_ops, port);
 	if (!port->cpm_domain)
 		goto out;
=20
 	irq_domain_update_bus_token(port->cpm_domain, DOMAIN_BUS_NEXUS);
=20
-	port->intx_domain =3D irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX,
-						  &intx_domain_ops,
-						  port);
+	port->intx_domain =3D irq_domain_create_linear(of_fwnode_handle(pcie_intc_n=
ode), PCI_NUM_INTX,
+						     &intx_domain_ops, port);
 	if (!port->intx_domain)
 		goto out;
=20
diff --git a/drivers/pci/controller/pcie-xilinx-dma-pl.c b/drivers/pci/contro=
ller/pcie-xilinx-dma-pl.c
index dd117f07fc95..dc9690a535e1 100644
--- a/drivers/pci/controller/pcie-xilinx-dma-pl.c
+++ b/drivers/pci/controller/pcie-xilinx-dma-pl.c
@@ -470,10 +470,10 @@ static int xilinx_pl_dma_pcie_init_msi_irq_domain(struc=
t pl_dma_pcie *port)
 	struct device *dev =3D port->dev;
 	struct xilinx_msi *msi =3D &port->msi;
 	int size =3D BITS_TO_LONGS(XILINX_NUM_MSI_IRQS) * sizeof(long);
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(port->dev->of_node);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(port->dev->of_node);
=20
-	msi->dev_domain =3D irq_domain_add_linear(NULL, XILINX_NUM_MSI_IRQS,
-						&dev_msi_domain_ops, port);
+	msi->dev_domain =3D irq_domain_create_linear(NULL, XILINX_NUM_MSI_IRQS,
+						   &dev_msi_domain_ops, port);
 	if (!msi->dev_domain)
 		goto out;
=20
@@ -585,15 +585,15 @@ static int xilinx_pl_dma_pcie_init_irq_domain(struct pl=
_dma_pcie *port)
 		return -EINVAL;
 	}
=20
-	port->pldma_domain =3D irq_domain_add_linear(pcie_intc_node, 32,
-						   &event_domain_ops, port);
+	port->pldma_domain =3D irq_domain_create_linear(of_fwnode_handle(pcie_intc_=
node), 32,
+						      &event_domain_ops, port);
 	if (!port->pldma_domain)
 		return -ENOMEM;
=20
 	irq_domain_update_bus_token(port->pldma_domain, DOMAIN_BUS_NEXUS);
=20
-	port->intx_domain =3D irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX,
-						  &intx_domain_ops, port);
+	port->intx_domain =3D irq_domain_create_linear(of_fwnode_handle(pcie_intc_n=
ode), PCI_NUM_INTX,
+						     &intx_domain_ops, port);
 	if (!port->intx_domain) {
 		dev_err(dev, "Failed to get a INTx IRQ domain\n");
 		return -ENOMEM;
diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controlle=
r/pcie-xilinx-nwl.c
index 8d6e2a89b067..c8b05477b719 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -495,11 +495,10 @@ static int nwl_pcie_init_msi_irq_domain(struct nwl_pcie=
 *pcie)
 {
 #ifdef CONFIG_PCI_MSI
 	struct device *dev =3D pcie->dev;
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(dev->of_node);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(dev->of_node);
 	struct nwl_msi *msi =3D &pcie->msi;
=20
-	msi->dev_domain =3D irq_domain_add_linear(NULL, INT_PCI_MSI_NR,
-						&dev_msi_domain_ops, pcie);
+	msi->dev_domain =3D irq_domain_create_linear(NULL, INT_PCI_MSI_NR, &dev_msi=
_domain_ops, pcie);
 	if (!msi->dev_domain) {
 		dev_err(dev, "failed to create dev IRQ domain\n");
 		return -ENOMEM;
@@ -582,10 +581,8 @@ static int nwl_pcie_init_irq_domain(struct nwl_pcie *pci=
e)
 		return -EINVAL;
 	}
=20
-	pcie->intx_irq_domain =3D irq_domain_add_linear(intc_node,
-						      PCI_NUM_INTX,
-						      &intx_domain_ops,
-						      pcie);
+	pcie->intx_irq_domain =3D irq_domain_create_linear(of_fwnode_handle(intc_no=
de), PCI_NUM_INTX,
+							 &intx_domain_ops, pcie);
 	of_node_put(intc_node);
 	if (!pcie->intx_irq_domain) {
 		dev_err(dev, "failed to create IRQ domain\n");
diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pc=
ie-xilinx.c
index 0b534f73a942..e36aa874bae9 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -461,9 +461,8 @@ static int xilinx_pcie_init_irq_domain(struct xilinx_pcie=
 *pcie)
 		return -ENODEV;
 	}
=20
-	pcie->leg_domain =3D irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX,
-						 &intx_domain_ops,
-						 pcie);
+	pcie->leg_domain =3D irq_domain_create_linear(of_fwnode_handle(pcie_intc_no=
de), PCI_NUM_INTX,
+						    &intx_domain_ops, pcie);
 	of_node_put(pcie_intc_node);
 	if (!pcie->leg_domain) {
 		dev_err(dev, "Failed to get a INTx IRQ domain\n");
diff --git a/drivers/pci/controller/plda/pcie-plda-host.c b/drivers/pci/contr=
oller/plda/pcie-plda-host.c
index 4153214ca410..3abedf723215 100644
--- a/drivers/pci/controller/plda/pcie-plda-host.c
+++ b/drivers/pci/controller/plda/pcie-plda-host.c
@@ -150,13 +150,12 @@ static struct msi_domain_info plda_msi_domain_info =3D {
 static int plda_allocate_msi_domains(struct plda_pcie_rp *port)
 {
 	struct device *dev =3D port->dev;
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(dev->of_node);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(dev->of_node);
 	struct plda_msi *msi =3D &port->msi;
=20
 	mutex_init(&port->msi.lock);
=20
-	msi->dev_domain =3D irq_domain_add_linear(NULL, msi->num_vectors,
-						&msi_domain_ops, port);
+	msi->dev_domain =3D irq_domain_create_linear(NULL, msi->num_vectors, &msi_d=
omain_ops, port);
 	if (!msi->dev_domain) {
 		dev_err(dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
@@ -393,10 +392,9 @@ static int plda_pcie_init_irq_domains(struct plda_pcie_r=
p *port)
 		return -EINVAL;
 	}
=20
-	port->event_domain =3D irq_domain_add_linear(pcie_intc_node,
-						   port->num_events,
-						   &plda_event_domain_ops,
-						   port);
+	port->event_domain =3D irq_domain_create_linear(of_fwnode_handle(pcie_intc_=
node),
+						      port->num_events, &plda_event_domain_ops,
+						      port);
 	if (!port->event_domain) {
 		dev_err(dev, "failed to get event domain\n");
 		of_node_put(pcie_intc_node);
@@ -405,8 +403,8 @@ static int plda_pcie_init_irq_domains(struct plda_pcie_rp=
 *port)
=20
 	irq_domain_update_bus_token(port->event_domain, DOMAIN_BUS_NEXUS);
=20
-	port->intx_domain =3D irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX,
-						  &intx_domain_ops, port);
+	port->intx_domain =3D irq_domain_create_linear(of_fwnode_handle(pcie_intc_n=
ode), PCI_NUM_INTX,
+						     &intx_domain_ops, port);
 	if (!port->intx_domain) {
 		dev_err(dev, "failed to get an INTx IRQ domain\n");
 		of_node_put(pcie_intc_node);
diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/m=
tk-eint.c
index ced4ee509b5b..8bbe2aa74861 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -565,9 +565,8 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 			goto err_eint;
 	}
=20
-	eint->domain =3D irq_domain_add_linear(eint->dev->of_node,
-					     eint->hw->ap_num,
-					     &irq_domain_simple_ops, NULL);
+	eint->domain =3D irq_domain_create_linear(of_fwnode_handle(eint->dev->of_no=
de),
+						eint->hw->ap_num, &irq_domain_simple_ops, NULL);
 	if (!eint->domain)
 		goto err_eint;
=20
diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at=
91-pio4.c
index 8b01d312305a..e57ac4ea91dd 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -1206,7 +1206,7 @@ static int atmel_pinctrl_probe(struct platform_device *=
pdev)
 		dev_dbg(dev, "bank %i: irq=3D%d\n", i, ret);
 	}
=20
-	atmel_pioctrl->irq_domain =3D irq_domain_add_linear(dev->of_node,
+	atmel_pioctrl->irq_domain =3D irq_domain_create_linear(of_fwnode_handle(dev=
->of_node),
 			atmel_pioctrl->gpio_chip->ngpio,
 			&irq_domain_simple_ops, NULL);
 	if (!atmel_pioctrl->irq_domain)
diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keem=
bay.c
index b693f4787044..0d7cc8280ea2 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1268,7 +1268,7 @@ static void keembay_gpio_irq_handler(struct irq_desc *d=
esc)
 	for_each_set_clump8(bit, clump, &reg, BITS_PER_TYPE(typeof(reg))) {
 		pin =3D clump & ~KEEMBAY_GPIO_IRQ_ENABLE;
 		val =3D keembay_read_pin(kpc->base0 + KEEMBAY_GPIO_DATA_IN, pin);
-		kmb_irq =3D irq_linear_revmap(gc->irq.domain, pin);
+		kmb_irq =3D irq_find_mapping(gc->irq.domain, pin);
=20
 		/* Checks if the interrupt is enabled */
 		if (val && (clump & KEEMBAY_GPIO_IRQ_ENABLE))
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-singl=
e.c
index 5be14dc979e2..5cda6201b60f 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1611,15 +1611,16 @@ static int pcs_irq_init_chained_handler(struct pcs_de=
vice *pcs,
=20
 	/*
 	 * We can use the register offset as the hardirq
-	 * number as irq_domain_add_simple maps them lazily.
+	 * number as irq_domain_create_simple maps them lazily.
 	 * This way we can easily support more than one
 	 * interrupt per function if needed.
 	 */
 	num_irqs =3D pcs->size;
=20
-	pcs->domain =3D irq_domain_add_simple(np, num_irqs, 0,
-					    &pcs_irqdomain_ops,
-					    pcs_soc);
+	pcs->domain =3D irq_domain_create_simple(of_fwnode_handle(np),
+					       num_irqs, 0,
+					       &pcs_irqdomain_ops,
+					       pcs_soc);
 	if (!pcs->domain) {
 		irq_set_chained_handler(pcs_soc->irq, NULL);
 		return -EINVAL;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pi=
nctrl-sunxi.c
index f1c5a991cf7b..bf8612d72daa 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1646,10 +1646,9 @@ int sunxi_pinctrl_init_with_flags(struct platform_devi=
ce *pdev,
 		}
 	}
=20
-	pctl->domain =3D irq_domain_add_linear(node,
-					     pctl->desc->irq_banks * IRQ_PER_BANK,
-					     &sunxi_pinctrl_irq_domain_ops,
-					     pctl);
+	pctl->domain =3D irq_domain_create_linear(of_fwnode_handle(node),
+						pctl->desc->irq_banks * IRQ_PER_BANK,
+						&sunxi_pinctrl_irq_domain_ops, pctl);
 	if (!pctl->domain) {
 		dev_err(&pdev->dev, "Couldn't register IRQ domain\n");
 		ret =3D -ENOMEM;
diff --git a/drivers/sh/intc/irqdomain.c b/drivers/sh/intc/irqdomain.c
index 3968f1c3c5c3..ed7a570ffdf2 100644
--- a/drivers/sh/intc/irqdomain.c
+++ b/drivers/sh/intc/irqdomain.c
@@ -59,10 +59,9 @@ void __init intc_irq_domain_init(struct intc_desc_int *d,
 	 * tree penalty for linear cases with non-zero hwirq bases.
 	 */
 	if (irq_base =3D=3D 0 && irq_end =3D=3D (irq_base + hw->nr_vectors - 1))
-		d->domain =3D irq_domain_add_linear(NULL, hw->nr_vectors,
-						  &intc_evt_ops, NULL);
+		d->domain =3D irq_domain_create_linear(NULL, hw->nr_vectors, &intc_evt_ops=
, NULL);
 	else
-		d->domain =3D irq_domain_add_tree(NULL, &intc_evt_ops, NULL);
+		d->domain =3D irq_domain_create_tree(NULL, &intc_evt_ops, NULL);
=20
 	BUG_ON(!d->domain);
 }
diff --git a/drivers/soc/dove/pmu.c b/drivers/soc/dove/pmu.c
index 6202dbcd20a8..cfc0efab27d7 100644
--- a/drivers/soc/dove/pmu.c
+++ b/drivers/soc/dove/pmu.c
@@ -274,8 +274,8 @@ static int __init dove_init_pmu_irq(struct pmu_data *pmu,=
 int irq)
 	writel(0, pmu->pmc_base + PMC_IRQ_MASK);
 	writel(0, pmu->pmc_base + PMC_IRQ_CAUSE);
=20
-	domain =3D irq_domain_add_linear(pmu->of_node, NR_PMU_IRQS,
-				       &irq_generic_chip_ops, NULL);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(pmu->of_node), NR_PMU_=
IRQS,
+					  &irq_generic_chip_ops, NULL);
 	if (!domain) {
 		pr_err("%s: unable to add irq domain\n", name);
 		return -ENOMEM;
diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 77bf0e83ffcc..e4b6ff2cc76b 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -446,8 +446,8 @@ static int qe_ic_init(struct platform_device *pdev)
 		high_handler =3D NULL;
 	}
=20
-	qe_ic->irqhost =3D irq_domain_add_linear(node, NR_QE_IC_INTS,
-					       &qe_ic_host_ops, qe_ic);
+	qe_ic->irqhost =3D irq_domain_create_linear(of_fwnode_handle(node), NR_QE_I=
C_INTS,
+						  &qe_ic_host_ops, qe_ic);
 	if (qe_ic->irqhost =3D=3D NULL) {
 		dev_err(dev, "failed to add irq domain\n");
 		return -ENODEV;
diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index a3e88ced328a..8c8878bc87f5 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -399,7 +399,7 @@ static int qcom_smp2p_inbound_entry(struct qcom_smp2p *sm=
p2p,
 				    struct smp2p_entry *entry,
 				    struct device_node *node)
 {
-	entry->domain =3D irq_domain_add_linear(node, 32, &smp2p_irq_ops, entry);
+	entry->domain =3D irq_domain_create_linear(of_fwnode_handle(node), 32, &smp=
2p_irq_ops, entry);
 	if (!entry->domain) {
 		dev_err(smp2p->dev, "failed to add irq_domain\n");
 		return -ENOMEM;
diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index e803ea342c97..021e9d1f61dc 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -456,7 +456,7 @@ static int smsm_inbound_entry(struct qcom_smsm *smsm,
 		return ret;
 	}
=20
-	entry->domain =3D irq_domain_add_linear(node, 32, &smsm_irq_ops, entry);
+	entry->domain =3D irq_domain_create_linear(of_fwnode_handle(node), 32, &sms=
m_irq_ops, entry);
 	if (!entry->domain) {
 		dev_err(smsm->dev, "failed to add irq_domain\n");
 		return -ENOMEM;
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 51b9d852bb6a..e0d67bfe955c 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2500,8 +2500,9 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
 	pmc->irq.irq_set_type =3D pmc->soc->irq_set_type;
 	pmc->irq.irq_set_wake =3D pmc->soc->irq_set_wake;
=20
-	pmc->domain =3D irq_domain_add_hierarchy(parent, 0, 96, pmc->dev->of_node,
-					       &tegra_pmc_irq_domain_ops, pmc);
+	pmc->domain =3D irq_domain_create_hierarchy(parent, 0, 96,
+						  of_fwnode_handle(pmc->dev->of_node),
+						  &tegra_pmc_irq_domain_ops, pmc);
 	if (!pmc->domain) {
 		dev_err(pmc->dev, "failed to allocate domain\n");
 		return -ENOMEM;
diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index d2d49264cf83..991d1573983d 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -209,7 +209,8 @@ static int lmh_probe(struct platform_device *pdev)
 	}
=20
 	lmh_data->irq =3D platform_get_irq(pdev, 0);
-	lmh_data->domain =3D irq_domain_add_linear(np, 1, &lmh_irq_ops, lmh_data);
+	lmh_data->domain =3D irq_domain_create_linear(of_fwnode_handle(np), 1, &lmh=
_irq_ops,
+						    lmh_data);
 	if (!lmh_data->domain) {
 		dev_err(dev, "Error adding irq_domain\n");
 		return -EINVAL;
diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/socther=
m.c
index 2c5ddf0db40c..926f1052e6de 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -1234,7 +1234,7 @@ static int soctherm_oc_int_init(struct device_node *np,=
 int num_irqs)
 	soc_irq_cdata.irq_chip.irq_set_type =3D soctherm_oc_irq_set_type;
 	soc_irq_cdata.irq_chip.irq_set_wake =3D NULL;
=20
-	soc_irq_cdata.domain =3D irq_domain_add_linear(np, num_irqs,
+	soc_irq_cdata.domain =3D irq_domain_create_linear(of_fwnode_handle(np), num=
_irqs,
 						     &soctherm_oc_domain_ops,
 						     &soc_irq_cdata);
=20
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4c0294a9104d..b53233051bee 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -287,8 +287,9 @@ struct gpio_irq_chip {
 	/**
 	 * @first:
 	 *
-	 * Required for static IRQ allocation. If set, irq_domain_add_simple()
-	 * will allocate and map all IRQs during initialization.
+	 * Required for static IRQ allocation. If set,
+	 * irq_domain_create_simple() will allocate and map all IRQs
+	 * during initialization.
 	 */
 	unsigned int first;
=20
diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index bb7111105296..2f6e4c9dd743 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -1,30 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * irq_domain - IRQ translation domains
+ * irq_domain - IRQ Translation Domains
  *
- * Translation infrastructure between hw and linux irq numbers.  This is
- * helpful for interrupt controllers to implement mapping between hardware
- * irq numbers and the Linux irq number space.
- *
- * irq_domains also have hooks for translating device tree or other
- * firmware interrupt representations into a hardware irq number that
- * can be mapped back to a Linux irq number without any extra platform
- * support code.
- *
- * Interrupt controller "domain" data structure. This could be defined as a
- * irq domain controller. That is, it handles the mapping between hardware
- * and virtual interrupt numbers for a given interrupt domain. The domain
- * structure is generally created by the PIC code for a given PIC instance
- * (though a domain can cover more than one PIC if they have a flat number
- * model). It's the domain callbacks that are responsible for setting the
- * irq_chip on a given irq_desc after it's been mapped.
- *
- * The host code and data structures use a fwnode_handle pointer to
- * identify the domain. In some cases, and in order to preserve source
- * code compatibility, this fwnode pointer is "upgraded" to a DT
- * device_node. For those firmware infrastructures that do not provide
- * a unique identifier for an interrupt controller, the irq_domain
- * code offers a fwnode allocator.
+ * See Documentation/core-api/irq/irq-domain.rst for the details.
  */
=20
 #ifndef _LINUX_IRQDOMAIN_H
@@ -61,9 +39,9 @@ struct msi_parent_ops;
  * pass a device-specific description of an interrupt.
  */
 struct irq_fwspec {
-	struct fwnode_handle *fwnode;
-	int param_count;
-	u32 param[IRQ_DOMAIN_IRQ_SPEC_PARAMS];
+	struct fwnode_handle	*fwnode;
+	int			param_count;
+	u32			param[IRQ_DOMAIN_IRQ_SPEC_PARAMS];
 };
=20
 /* Conversion function from of_phandle_args fields to fwspec  */
@@ -72,26 +50,26 @@ void of_phandle_args_to_fwspec(struct device_node *np, co=
nst u32 *args,
=20
 /**
  * struct irq_domain_ops - Methods for irq_domain objects
- * @match: Match an interrupt controller device node to a domain, returns
- *         1 on a match
- * @select: Match an interrupt controller fw specification. It is more gener=
ic
- *	    than @match as it receives a complete struct irq_fwspec. Therefore,
- *	    @select is preferred if provided. Returns 1 on a match.
- * @map: Create or update a mapping between a virtual irq number and a hw
- *       irq number. This is called only once for a given mapping.
- * @unmap: Dispose of such a mapping
- * @xlate: Given a device tree node and interrupt specifier, decode
- *         the hardware irq number and linux irq type value.
- * @alloc: Allocate @nr_irqs interrupts starting from @virq.
- * @free: Free @nr_irqs interrupts starting from @virq.
- * @activate: Activate one interrupt in HW (@irqd). If @reserve is set, only
- *	      reserve the vector. If unset, assign the vector (called from
- *	      request_irq()).
- * @deactivate: Disarm one interrupt (@irqd).
- * @translate: Given @fwspec, decode the hardware irq number (@out_hwirq) and
- *	       linux irq type value (@out_type). This is a generalised @xlate
- *	       (over struct irq_fwspec) and is preferred if provided.
- * @debug_show: For domains to show specific data for an interrupt in debugf=
s.
+ * @match:	Match an interrupt controller device node to a domain, returns
+ *		1 on a match
+ * @select:	Match an interrupt controller fw specification. It is more gener=
ic
+ *		than @match as it receives a complete struct irq_fwspec. Therefore,
+ *		@select is preferred if provided. Returns 1 on a match.
+ * @map:	Create or update a mapping between a virtual irq number and a hw
+ *		irq number. This is called only once for a given mapping.
+ * @unmap:	Dispose of such a mapping
+ * @xlate:	Given a device tree node and interrupt specifier, decode
+ *		the hardware irq number and linux irq type value.
+ * @alloc:	Allocate @nr_irqs interrupts starting from @virq.
+ * @free:	Free @nr_irqs interrupts starting from @virq.
+ * @activate:	Activate one interrupt in HW (@irqd). If @reserve is set, only
+ *		reserve the vector. If unset, assign the vector (called from
+ *		request_irq()).
+ * @deactivate:	Disarm one interrupt (@irqd).
+ * @translate:	Given @fwspec, decode the hardware irq number (@out_hwirq) and
+ *		linux irq type value (@out_type). This is a generalised @xlate
+ *		(over struct irq_fwspec) and is preferred if provided.
+ * @debug_show:	For domains to show specific data for an interrupt in debugf=
s.
  *
  * Functions below are provided by the driver and called whenever a new mapp=
ing
  * is created or an old mapping is disposed. The driver can then proceed to
@@ -99,29 +77,29 @@ void of_phandle_args_to_fwspec(struct device_node *np, co=
nst u32 *args,
  * to setup the irq_desc when returning from map().
  */
 struct irq_domain_ops {
-	int (*match)(struct irq_domain *d, struct device_node *node,
-		     enum irq_domain_bus_token bus_token);
-	int (*select)(struct irq_domain *d, struct irq_fwspec *fwspec,
-		      enum irq_domain_bus_token bus_token);
-	int (*map)(struct irq_domain *d, unsigned int virq, irq_hw_number_t hw);
-	void (*unmap)(struct irq_domain *d, unsigned int virq);
-	int (*xlate)(struct irq_domain *d, struct device_node *node,
-		     const u32 *intspec, unsigned int intsize,
-		     unsigned long *out_hwirq, unsigned int *out_type);
+	int	(*match)(struct irq_domain *d, struct device_node *node,
+			 enum irq_domain_bus_token bus_token);
+	int	(*select)(struct irq_domain *d, struct irq_fwspec *fwspec,
+			  enum irq_domain_bus_token bus_token);
+	int	(*map)(struct irq_domain *d, unsigned int virq, irq_hw_number_t hw);
+	void	(*unmap)(struct irq_domain *d, unsigned int virq);
+	int	(*xlate)(struct irq_domain *d, struct device_node *node,
+			 const u32 *intspec, unsigned int intsize,
+			 unsigned long *out_hwirq, unsigned int *out_type);
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
 	/* extended V2 interfaces to support hierarchy irq_domains */
-	int (*alloc)(struct irq_domain *d, unsigned int virq,
-		     unsigned int nr_irqs, void *arg);
-	void (*free)(struct irq_domain *d, unsigned int virq,
-		     unsigned int nr_irqs);
-	int (*activate)(struct irq_domain *d, struct irq_data *irqd, bool reserve);
-	void (*deactivate)(struct irq_domain *d, struct irq_data *irq_data);
-	int (*translate)(struct irq_domain *d, struct irq_fwspec *fwspec,
-			 unsigned long *out_hwirq, unsigned int *out_type);
+	int	(*alloc)(struct irq_domain *d, unsigned int virq,
+			 unsigned int nr_irqs, void *arg);
+	void	(*free)(struct irq_domain *d, unsigned int virq,
+			unsigned int nr_irqs);
+	int	(*activate)(struct irq_domain *d, struct irq_data *irqd, bool reserve);
+	void	(*deactivate)(struct irq_domain *d, struct irq_data *irq_data);
+	int	(*translate)(struct irq_domain *d, struct irq_fwspec *fwspec,
+			     unsigned long *out_hwirq, unsigned int *out_type);
 #endif
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
-	void (*debug_show)(struct seq_file *m, struct irq_domain *d,
-			   struct irq_data *irqd, int ind);
+	void	(*debug_show)(struct seq_file *m, struct irq_domain *d,
+			      struct irq_data *irqd, int ind);
 #endif
 };
=20
@@ -244,8 +222,7 @@ static inline struct device_node *irq_domain_get_of_node(=
struct irq_domain *d)
 	return to_of_node(d->fwnode);
 }
=20
-static inline void irq_domain_set_pm_device(struct irq_domain *d,
-					    struct device *dev)
+static inline void irq_domain_set_pm_device(struct irq_domain *d, struct dev=
ice *dev)
 {
 	if (d)
 		d->pm_dev =3D dev;
@@ -261,14 +238,12 @@ enum {
 	IRQCHIP_FWNODE_NAMED_ID,
 };
=20
-static inline
-struct fwnode_handle *irq_domain_alloc_named_fwnode(const char *name)
+static inline struct fwnode_handle *irq_domain_alloc_named_fwnode(const char=
 *name)
 {
 	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_NAMED, 0, name, NULL);
 }
=20
-static inline
-struct fwnode_handle *irq_domain_alloc_named_id_fwnode(const char *name, int=
 id)
+static inline struct fwnode_handle *irq_domain_alloc_named_id_fwnode(const c=
har *name, int id)
 {
 	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_NAMED_ID, id, name,
 					 NULL);
@@ -333,36 +308,19 @@ struct irq_domain *irq_domain_instantiate(const struct =
irq_domain_info *info);
 struct irq_domain *devm_irq_domain_instantiate(struct device *dev,
 					       const struct irq_domain_info *info);
=20
-struct irq_domain *irq_domain_create_simple(struct fwnode_handle *fwnode,
-					    unsigned int size,
-					    unsigned int first_irq,
-					    const struct irq_domain_ops *ops,
-					    void *host_data);
-struct irq_domain *irq_domain_add_legacy(struct device_node *of_node,
-					 unsigned int size,
-					 unsigned int first_irq,
-					 irq_hw_number_t first_hwirq,
-					 const struct irq_domain_ops *ops,
-					 void *host_data);
-struct irq_domain *irq_domain_create_legacy(struct fwnode_handle *fwnode,
-					    unsigned int size,
+struct irq_domain *irq_domain_create_simple(struct fwnode_handle *fwnode, un=
signed int size,
 					    unsigned int first_irq,
-					    irq_hw_number_t first_hwirq,
-					    const struct irq_domain_ops *ops,
-					    void *host_data);
+					    const struct irq_domain_ops *ops, void *host_data);
+struct irq_domain *irq_domain_create_legacy(struct fwnode_handle *fwnode, un=
signed int size,
+					    unsigned int first_irq, irq_hw_number_t first_hwirq,
+					    const struct irq_domain_ops *ops, void *host_data);
 struct irq_domain *irq_find_matching_fwspec(struct irq_fwspec *fwspec,
 					    enum irq_domain_bus_token bus_token);
 void irq_set_default_domain(struct irq_domain *domain);
 struct irq_domain *irq_get_default_domain(void);
-int irq_domain_alloc_descs(int virq, unsigned int nr_irqs,
-			   irq_hw_number_t hwirq, int node,
+int irq_domain_alloc_descs(int virq, unsigned int nr_irqs, irq_hw_number_t h=
wirq, int node,
 			   const struct irq_affinity_desc *affinity);
=20
-static inline struct fwnode_handle *of_node_to_fwnode(struct device_node *no=
de)
-{
-	return node ? &node->fwnode : NULL;
-}
-
 extern const struct fwnode_operations irqchip_fwnode_ops;
=20
 static inline bool is_fwnode_irqchip(const struct fwnode_handle *fwnode)
@@ -370,12 +328,10 @@ static inline bool is_fwnode_irqchip(const struct fwnod=
e_handle *fwnode)
 	return fwnode && fwnode->ops =3D=3D &irqchip_fwnode_ops;
 }
=20
-void irq_domain_update_bus_token(struct irq_domain *domain,
-				 enum irq_domain_bus_token bus_token);
+void irq_domain_update_bus_token(struct irq_domain *domain, enum irq_domain_=
bus_token bus_token);
=20
-static inline
-struct irq_domain *irq_find_matching_fwnode(struct fwnode_handle *fwnode,
-					    enum irq_domain_bus_token bus_token)
+static inline struct irq_domain *irq_find_matching_fwnode(struct fwnode_hand=
le *fwnode,
+							  enum irq_domain_bus_token bus_token)
 {
 	struct irq_fwspec fwspec =3D {
 		.fwnode =3D fwnode,
@@ -387,7 +343,7 @@ struct irq_domain *irq_find_matching_fwnode(struct fwnode=
_handle *fwnode,
 static inline struct irq_domain *irq_find_matching_host(struct device_node *=
node,
 							enum irq_domain_bus_token bus_token)
 {
-	return irq_find_matching_fwnode(of_node_to_fwnode(node), bus_token);
+	return irq_find_matching_fwnode(of_fwnode_handle(node), bus_token);
 }
=20
 static inline struct irq_domain *irq_find_host(struct device_node *node)
@@ -401,128 +357,92 @@ static inline struct irq_domain *irq_find_host(struct =
device_node *node)
 	return d;
 }
=20
-static inline struct irq_domain *irq_domain_add_simple(struct device_node *o=
f_node,
-						       unsigned int size,
-						       unsigned int first_irq,
-						       const struct irq_domain_ops *ops,
-						       void *host_data)
-{
-	return irq_domain_create_simple(of_node_to_fwnode(of_node), size, first_irq=
, ops, host_data);
-}
-
-/**
- * irq_domain_add_linear() - Allocate and register a linear revmap irq_domai=
n.
- * @of_node: pointer to interrupt controller's device tree node.
- * @size: Number of interrupts in the domain.
- * @ops: map/unmap domain callbacks
- * @host_data: Controller private data pointer
- */
-static inline struct irq_domain *irq_domain_add_linear(struct device_node *o=
f_node,
-					 unsigned int size,
-					 const struct irq_domain_ops *ops,
-					 void *host_data)
-{
-	struct irq_domain_info info =3D {
-		.fwnode		=3D of_node_to_fwnode(of_node),
-		.size		=3D size,
-		.hwirq_max	=3D size,
-		.ops		=3D ops,
-		.host_data	=3D host_data,
-	};
-	struct irq_domain *d;
-
-	d =3D irq_domain_instantiate(&info);
-	return IS_ERR(d) ? NULL : d;
-}
-
 #ifdef CONFIG_IRQ_DOMAIN_NOMAP
-static inline struct irq_domain *irq_domain_add_nomap(struct device_node *of=
_node,
-					 unsigned int max_irq,
-					 const struct irq_domain_ops *ops,
-					 void *host_data)
+static inline struct irq_domain *irq_domain_create_nomap(struct fwnode_handl=
e *fwnode,
+							 unsigned int max_irq,
+							 const struct irq_domain_ops *ops,
+							 void *host_data)
 {
-	struct irq_domain_info info =3D {
-		.fwnode		=3D of_node_to_fwnode(of_node),
+	const struct irq_domain_info info =3D {
+		.fwnode		=3D fwnode,
 		.hwirq_max	=3D max_irq,
 		.direct_max	=3D max_irq,
 		.ops		=3D ops,
 		.host_data	=3D host_data,
 	};
-	struct irq_domain *d;
+	struct irq_domain *d =3D irq_domain_instantiate(&info);
=20
-	d =3D irq_domain_instantiate(&info);
 	return IS_ERR(d) ? NULL : d;
 }
=20
 unsigned int irq_create_direct_mapping(struct irq_domain *domain);
 #endif
=20
-static inline struct irq_domain *irq_domain_add_tree(struct device_node *of_=
node,
-					 const struct irq_domain_ops *ops,
-					 void *host_data)
-{
-	struct irq_domain_info info =3D {
-		.fwnode		=3D of_node_to_fwnode(of_node),
-		.hwirq_max	=3D ~0U,
-		.ops		=3D ops,
-		.host_data	=3D host_data,
-	};
-	struct irq_domain *d;
-
-	d =3D irq_domain_instantiate(&info);
-	return IS_ERR(d) ? NULL : d;
-}
-
+/**
+ * irq_domain_create_linear - Allocate and register a linear revmap irq_doma=
in.
+ * @fwnode:	pointer to interrupt controller's FW node.
+ * @size:	Number of interrupts in the domain.
+ * @ops:	map/unmap domain callbacks
+ * @host_data:	Controller private data pointer
+ *
+ * Returns: Newly created irq_domain
+ */
 static inline struct irq_domain *irq_domain_create_linear(struct fwnode_hand=
le *fwnode,
-					 unsigned int size,
-					 const struct irq_domain_ops *ops,
-					 void *host_data)
+							  unsigned int size,
+							  const struct irq_domain_ops *ops,
+							  void *host_data)
 {
-	struct irq_domain_info info =3D {
+	const struct irq_domain_info info =3D {
 		.fwnode		=3D fwnode,
 		.size		=3D size,
 		.hwirq_max	=3D size,
 		.ops		=3D ops,
 		.host_data	=3D host_data,
 	};
-	struct irq_domain *d;
+	struct irq_domain *d =3D irq_domain_instantiate(&info);
=20
-	d =3D irq_domain_instantiate(&info);
 	return IS_ERR(d) ? NULL : d;
 }
=20
 static inline struct irq_domain *irq_domain_create_tree(struct fwnode_handle=
 *fwnode,
-					 const struct irq_domain_ops *ops,
-					 void *host_data)
+							const struct irq_domain_ops *ops,
+							void *host_data)
 {
-	struct irq_domain_info info =3D {
+	const struct irq_domain_info info =3D {
 		.fwnode		=3D fwnode,
 		.hwirq_max	=3D ~0,
 		.ops		=3D ops,
 		.host_data	=3D host_data,
 	};
-	struct irq_domain *d;
+	struct irq_domain *d =3D irq_domain_instantiate(&info);
=20
-	d =3D irq_domain_instantiate(&info);
 	return IS_ERR(d) ? NULL : d;
 }
=20
 void irq_domain_remove(struct irq_domain *domain);
=20
-int irq_domain_associate(struct irq_domain *domain, unsigned int irq,
-			 irq_hw_number_t hwirq);
-void irq_domain_associate_many(struct irq_domain *domain,
-			       unsigned int irq_base,
+int irq_domain_associate(struct irq_domain *domain, unsigned int irq, irq_hw=
_number_t hwirq);
+void irq_domain_associate_many(struct irq_domain *domain, unsigned int irq_b=
ase,
 			       irq_hw_number_t hwirq_base, int count);
=20
-unsigned int irq_create_mapping_affinity(struct irq_domain *domain,
-					 irq_hw_number_t hwirq,
+unsigned int irq_create_mapping_affinity(struct irq_domain *domain, irq_hw_n=
umber_t hwirq,
 					 const struct irq_affinity_desc *affinity);
 unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec);
 void irq_dispose_mapping(unsigned int virq);
=20
-static inline unsigned int irq_create_mapping(struct irq_domain *domain,
-					      irq_hw_number_t hwirq)
+/**
+ * irq_create_mapping - Map a hardware interrupt into linux irq space
+ * @domain:	domain owning this hardware interrupt or NULL for default domain
+ * @hwirq:	hardware irq number in that domain space
+ *
+ * Only one mapping per hardware interrupt is permitted.
+ *
+ * If the sense/trigger is to be specified, set_irq_type() should be called
+ * on the number returned from that call.
+ *
+ * Returns: Linux irq number or 0 on error
+ */
+static inline unsigned int irq_create_mapping(struct irq_domain *domain, irq=
_hw_number_t hwirq)
 {
 	return irq_create_mapping_affinity(domain, hwirq, NULL);
 }
@@ -531,6 +451,13 @@ struct irq_desc *__irq_resolve_mapping(struct irq_domain=
 *domain,
 				       irq_hw_number_t hwirq,
 				       unsigned int *irq);
=20
+/**
+ * irq_resolve_mapping - Find a linux irq from a hw irq number.
+ * @domain:	domain owning this hardware interrupt
+ * @hwirq:	hardware irq number in that domain space
+ *
+ * Returns: Interrupt descriptor
+ */
 static inline struct irq_desc *irq_resolve_mapping(struct irq_domain *domain,
 						   irq_hw_number_t hwirq)
 {
@@ -539,8 +466,10 @@ static inline struct irq_desc *irq_resolve_mapping(struc=
t irq_domain *domain,
=20
 /**
  * irq_find_mapping() - Find a linux irq from a hw irq number.
- * @domain: domain owning this hardware interrupt
- * @hwirq: hardware irq number in that domain space
+ * @domain:	domain owning this hardware interrupt
+ * @hwirq:	hardware irq number in that domain space
+ *
+ * Returns: Linux irq number or 0 if not found
  */
 static inline unsigned int irq_find_mapping(struct irq_domain *domain,
 					    irq_hw_number_t hwirq)
@@ -553,107 +482,115 @@ static inline unsigned int irq_find_mapping(struct ir=
q_domain *domain,
 	return 0;
 }
=20
-static inline unsigned int irq_linear_revmap(struct irq_domain *domain,
-					     irq_hw_number_t hwirq)
-{
-	return irq_find_mapping(domain, hwirq);
-}
-
 extern const struct irq_domain_ops irq_domain_simple_ops;
=20
 /* stock xlate functions */
 int irq_domain_xlate_onecell(struct irq_domain *d, struct device_node *ctrlr,
-			const u32 *intspec, unsigned int intsize,
-			irq_hw_number_t *out_hwirq, unsigned int *out_type);
+			     const u32 *intspec, unsigned int intsize,
+			     irq_hw_number_t *out_hwirq, unsigned int *out_type);
 int irq_domain_xlate_twocell(struct irq_domain *d, struct device_node *ctrlr,
-			const u32 *intspec, unsigned int intsize,
-			irq_hw_number_t *out_hwirq, unsigned int *out_type);
+			     const u32 *intspec, unsigned int intsize,
+			     irq_hw_number_t *out_hwirq, unsigned int *out_type);
 int irq_domain_xlate_onetwocell(struct irq_domain *d, struct device_node *ct=
rlr,
-			const u32 *intspec, unsigned int intsize,
-			irq_hw_number_t *out_hwirq, unsigned int *out_type);
-
-int irq_domain_translate_twocell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type);
-
-int irq_domain_translate_onecell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type);
+				const u32 *intspec, unsigned int intsize,
+				irq_hw_number_t *out_hwirq, unsigned int *out_type);
+int irq_domain_xlate_twothreecell(struct irq_domain *d, struct device_node *=
ctrlr,
+				  const u32 *intspec, unsigned int intsize,
+				  irq_hw_number_t *out_hwirq, unsigned int *out_type);
+
+int irq_domain_translate_onecell(struct irq_domain *d, struct irq_fwspec *fw=
spec,
+				 unsigned long *out_hwirq, unsigned int *out_type);
+int irq_domain_translate_twocell(struct irq_domain *d, struct irq_fwspec *fw=
spec,
+				 unsigned long *out_hwirq, unsigned int *out_type);
+int irq_domain_translate_twothreecell(struct irq_domain *d, struct irq_fwspe=
c *fwspec,
+				      unsigned long *out_hwirq, unsigned int *out_type);
=20
 /* IPI functions */
 int irq_reserve_ipi(struct irq_domain *domain, const struct cpumask *dest);
 int irq_destroy_ipi(unsigned int irq, const struct cpumask *dest);
=20
 /* V2 interfaces to support hierarchy IRQ domains. */
-struct irq_data *irq_domain_get_irq_data(struct irq_domain *domain,
-					 unsigned int virq);
-void irq_domain_set_info(struct irq_domain *domain, unsigned int virq,
-			 irq_hw_number_t hwirq,
-			 const struct irq_chip *chip,
-			 void *chip_data, irq_flow_handler_t handler,
+struct irq_data *irq_domain_get_irq_data(struct irq_domain *domain, unsigned=
 int virq);
+void irq_domain_set_info(struct irq_domain *domain, unsigned int virq, irq_h=
w_number_t hwirq,
+			 const struct irq_chip *chip, void *chip_data, irq_flow_handler_t handler,
 			 void *handler_data, const char *handler_name);
 void irq_domain_reset_irq_data(struct irq_data *irq_data);
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
-struct irq_domain *irq_domain_create_hierarchy(struct irq_domain *parent,
-					       unsigned int flags,
-					       unsigned int size,
-					       struct fwnode_handle *fwnode,
-					       const struct irq_domain_ops *ops,
-					       void *host_data);
-
-static inline struct irq_domain *irq_domain_add_hierarchy(struct irq_domain =
*parent,
-					    unsigned int flags,
-					    unsigned int size,
-					    struct device_node *node,
-					    const struct irq_domain_ops *ops,
-					    void *host_data)
-{
-	return irq_domain_create_hierarchy(parent, flags, size,
-					   of_node_to_fwnode(node),
-					   ops, host_data);
-}
-
-int __irq_domain_alloc_irqs(struct irq_domain *domain, int irq_base,
-			    unsigned int nr_irqs, int node, void *arg,
-			    bool realloc,
+/**
+ * irq_domain_create_hierarchy - Add a irqdomain into the hierarchy
+ * @parent:	Parent irq domain to associate with the new domain
+ * @flags:	Irq domain flags associated to the domain
+ * @size:	Size of the domain. See below
+ * @fwnode:	Optional fwnode of the interrupt controller
+ * @ops:	Pointer to the interrupt domain callbacks
+ * @host_data:	Controller private data pointer
+ *
+ * If @size is 0 a tree domain is created, otherwise a linear domain.
+ *
+ * If successful the parent is associated to the new domain and the
+ * domain flags are set.
+ *
+ * Returns: A pointer to IRQ domain, or %NULL on failure.
+ */
+static inline struct irq_domain *irq_domain_create_hierarchy(struct irq_doma=
in *parent,
+							     unsigned int flags, unsigned int size,
+							     struct fwnode_handle *fwnode,
+							     const struct irq_domain_ops *ops,
+							     void *host_data)
+{
+	const struct irq_domain_info info =3D {
+		.fwnode		=3D fwnode,
+		.size		=3D size,
+		.hwirq_max	=3D size ? : ~0U,
+		.ops		=3D ops,
+		.host_data	=3D host_data,
+		.domain_flags	=3D flags,
+		.parent		=3D parent,
+	};
+	struct irq_domain *d =3D irq_domain_instantiate(&info);
+
+	return IS_ERR(d) ? NULL : d;
+}
+
+int __irq_domain_alloc_irqs(struct irq_domain *domain, int irq_base, unsigne=
d int nr_irqs,
+			    int node, void *arg, bool realloc,
 			    const struct irq_affinity_desc *affinity);
 void irq_domain_free_irqs(unsigned int virq, unsigned int nr_irqs);
 int irq_domain_activate_irq(struct irq_data *irq_data, bool early);
 void irq_domain_deactivate_irq(struct irq_data *irq_data);
=20
-static inline int irq_domain_alloc_irqs(struct irq_domain *domain,
-			unsigned int nr_irqs, int node, void *arg)
+/**
+ * irq_domain_alloc_irqs - Allocate IRQs from domain
+ * @domain:	domain to allocate from
+ * @nr_irqs:	number of IRQs to allocate
+ * @node:	NUMA node id for memory allocation
+ * @arg:	domain specific argument
+ *
+ * See __irq_domain_alloc_irqs()' documentation.
+ */
+static inline int irq_domain_alloc_irqs(struct irq_domain *domain, unsigned =
int nr_irqs,
+					int node, void *arg)
 {
-	return __irq_domain_alloc_irqs(domain, -1, nr_irqs, node, arg, false,
-				       NULL);
+	return __irq_domain_alloc_irqs(domain, -1, nr_irqs, node, arg, false, NULL);
 }
=20
-int irq_domain_set_hwirq_and_chip(struct irq_domain *domain,
-				  unsigned int virq,
-				  irq_hw_number_t hwirq,
-				  const struct irq_chip *chip,
+int irq_domain_set_hwirq_and_chip(struct irq_domain *domain, unsigned int vi=
rq,
+				  irq_hw_number_t hwirq, const struct irq_chip *chip,
 				  void *chip_data);
-void irq_domain_free_irqs_common(struct irq_domain *domain,
-				 unsigned int virq,
+void irq_domain_free_irqs_common(struct irq_domain *domain, unsigned int vir=
q,
 				 unsigned int nr_irqs);
-void irq_domain_free_irqs_top(struct irq_domain *domain,
-			      unsigned int virq, unsigned int nr_irqs);
+void irq_domain_free_irqs_top(struct irq_domain *domain, unsigned int virq, =
unsigned int nr_irqs);
=20
 int irq_domain_push_irq(struct irq_domain *domain, int virq, void *arg);
 int irq_domain_pop_irq(struct irq_domain *domain, int virq);
=20
-int irq_domain_alloc_irqs_parent(struct irq_domain *domain,
-				 unsigned int irq_base,
+int irq_domain_alloc_irqs_parent(struct irq_domain *domain, unsigned int irq=
_base,
 				 unsigned int nr_irqs, void *arg);
=20
-void irq_domain_free_irqs_parent(struct irq_domain *domain,
-				 unsigned int irq_base,
+void irq_domain_free_irqs_parent(struct irq_domain *domain, unsigned int irq=
_base,
 				 unsigned int nr_irqs);
=20
-int irq_domain_disconnect_hierarchy(struct irq_domain *domain,
-					   unsigned int virq);
+int irq_domain_disconnect_hierarchy(struct irq_domain *domain, unsigned int =
virq);
=20
 static inline bool irq_domain_is_hierarchy(struct irq_domain *domain)
 {
@@ -662,8 +599,7 @@ static inline bool irq_domain_is_hierarchy(struct irq_dom=
ain *domain)
=20
 static inline bool irq_domain_is_ipi(struct irq_domain *domain)
 {
-	return domain->flags &
-		(IRQ_DOMAIN_FLAG_IPI_PER_CPU | IRQ_DOMAIN_FLAG_IPI_SINGLE);
+	return domain->flags & (IRQ_DOMAIN_FLAG_IPI_PER_CPU | IRQ_DOMAIN_FLAG_IPI_S=
INGLE);
 }
=20
 static inline bool irq_domain_is_ipi_per_cpu(struct irq_domain *domain)
@@ -692,14 +628,13 @@ static inline bool irq_domain_is_msi_device(struct irq_=
domain *domain)
 }
=20
 #else	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
-static inline int irq_domain_alloc_irqs(struct irq_domain *domain,
-			unsigned int nr_irqs, int node, void *arg)
+static inline int irq_domain_alloc_irqs(struct irq_domain *domain, unsigned =
int nr_irqs,
+					int node, void *arg)
 {
 	return -1;
 }
=20
-static inline void irq_domain_free_irqs(unsigned int virq,
-					unsigned int nr_irqs) { }
+static inline void irq_domain_free_irqs(unsigned int virq, unsigned int nr_i=
rqs) { }
=20
 static inline bool irq_domain_is_hierarchy(struct irq_domain *domain)
 {
@@ -739,8 +674,7 @@ static inline bool irq_domain_is_msi_device(struct irq_do=
main *domain)
 #endif	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
=20
 #ifdef CONFIG_GENERIC_MSI_IRQ
-int msi_device_domain_alloc_wired(struct irq_domain *domain, unsigned int hw=
irq,
-				  unsigned int type);
+int msi_device_domain_alloc_wired(struct irq_domain *domain, unsigned int hw=
irq, unsigned int type);
 void msi_device_domain_free_wired(struct irq_domain *domain, unsigned int vi=
rq);
 #else
 static inline int msi_device_domain_alloc_wired(struct irq_domain *domain, u=
nsigned int hwirq,
@@ -755,10 +689,50 @@ static inline void msi_device_domain_free_wired(struct =
irq_domain *domain, unsig
 }
 #endif
=20
+/* Deprecated functions. Will be removed in the merge window */
+static inline struct fwnode_handle *of_node_to_fwnode(struct device_node *no=
de)
+{
+	return node ? &node->fwnode : NULL;
+}
+
+static inline struct irq_domain *irq_domain_add_tree(struct device_node *of_=
node,
+						     const struct irq_domain_ops *ops,
+						     void *host_data)
+{
+	struct irq_domain_info info =3D {
+		.fwnode		=3D of_fwnode_handle(of_node),
+		.hwirq_max	=3D ~0U,
+		.ops		=3D ops,
+		.host_data	=3D host_data,
+	};
+	struct irq_domain *d;
+
+	d =3D irq_domain_instantiate(&info);
+	return IS_ERR(d) ? NULL : d;
+}
+
+static inline struct irq_domain *irq_domain_add_linear(struct device_node *o=
f_node,
+						       unsigned int size,
+						       const struct irq_domain_ops *ops,
+						       void *host_data)
+{
+	struct irq_domain_info info =3D {
+		.fwnode		=3D of_fwnode_handle(of_node),
+		.size		=3D size,
+		.hwirq_max	=3D size,
+		.ops		=3D ops,
+		.host_data	=3D host_data,
+	};
+	struct irq_domain *d;
+
+	d =3D irq_domain_instantiate(&info);
+	return IS_ERR(d) ? NULL : d;
+}
+
 #else /* CONFIG_IRQ_DOMAIN */
 static inline void irq_dispose_mapping(unsigned int virq) { }
-static inline struct irq_domain *irq_find_matching_fwnode(
-	struct fwnode_handle *fwnode, enum irq_domain_bus_token bus_token)
+static inline struct irq_domain *irq_find_matching_fwnode(struct fwnode_hand=
le *fwnode,
+							  enum irq_domain_bus_token bus_token)
 {
 	return NULL;
 }
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 9d5c8651492d..c8b6de09047b 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -480,33 +480,6 @@ struct irq_domain *irq_domain_create_simple(struct fwnod=
e_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(irq_domain_create_simple);
=20
-/**
- * irq_domain_add_legacy() - Allocate and register a legacy revmap irq_domai=
n.
- * @of_node: pointer to interrupt controller's device tree node.
- * @size: total number of irqs in legacy mapping
- * @first_irq: first number of irq block assigned to the domain
- * @first_hwirq: first hwirq number to use for the translation. Should norma=
lly
- *               be '0', but a positive integer can be used if the effective
- *               hwirqs numbering does not begin at zero.
- * @ops: map/unmap domain callbacks
- * @host_data: Controller private data pointer
- *
- * Note: the map() callback will be called before this function returns
- * for all legacy interrupts except 0 (which is always the invalid irq for
- * a legacy controller).
- */
-struct irq_domain *irq_domain_add_legacy(struct device_node *of_node,
-					 unsigned int size,
-					 unsigned int first_irq,
-					 irq_hw_number_t first_hwirq,
-					 const struct irq_domain_ops *ops,
-					 void *host_data)
-{
-	return irq_domain_create_legacy(of_node_to_fwnode(of_node), size,
-					first_irq, first_hwirq, ops, host_data);
-}
-EXPORT_SYMBOL_GPL(irq_domain_add_legacy);
-
 struct irq_domain *irq_domain_create_legacy(struct fwnode_handle *fwnode,
 					 unsigned int size,
 					 unsigned int first_irq,
@@ -885,7 +858,7 @@ void of_phandle_args_to_fwspec(struct device_node *np, co=
nst u32 *args,
 {
 	int i;
=20
-	fwspec->fwnode =3D of_node_to_fwnode(np);
+	fwspec->fwnode =3D of_fwnode_handle(np);
 	fwspec->param_count =3D count;
=20
 	for (i =3D 0; i < count; i++)
@@ -1132,6 +1105,31 @@ int irq_domain_xlate_twocell(struct irq_domain *d, str=
uct device_node *ctrlr,
 }
 EXPORT_SYMBOL_GPL(irq_domain_xlate_twocell);
=20
+/**
+ * irq_domain_xlate_twothreecell() - Generic xlate for direct two or three c=
ell bindings
+ * @d:		Interrupt domain involved in the translation
+ * @ctrlr:	The device tree node for the device whose interrupt is translated
+ * @intspec:	The interrupt specifier data from the device tree
+ * @intsize:	The number of entries in @intspec
+ * @out_hwirq:	Pointer to storage for the hardware interrupt number
+ * @out_type:	Pointer to storage for the interrupt type
+ *
+ * Device Tree interrupt specifier translation function for two or three
+ * cell bindings, where the cell values map directly to the hardware
+ * interrupt number and the type specifier.
+ */
+int irq_domain_xlate_twothreecell(struct irq_domain *d, struct device_node *=
ctrlr,
+				  const u32 *intspec, unsigned int intsize,
+				  irq_hw_number_t *out_hwirq, unsigned int *out_type)
+{
+	struct irq_fwspec fwspec;
+
+	of_phandle_args_to_fwspec(ctrlr, intspec, intsize, &fwspec);
+
+	return irq_domain_translate_twothreecell(d, &fwspec, out_hwirq, out_type);
+}
+EXPORT_SYMBOL_GPL(irq_domain_xlate_twothreecell);
+
 /**
  * irq_domain_xlate_onetwocell() - Generic xlate for one or two cell bindings
  * @d:		Interrupt domain involved in the translation
@@ -1216,6 +1214,37 @@ int irq_domain_translate_twocell(struct irq_domain *d,
 }
 EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);
=20
+/**
+ * irq_domain_translate_twothreecell() - Generic translate for direct two or=
 three cell
+ * bindings
+ * @d:		Interrupt domain involved in the translation
+ * @fwspec:	The firmware interrupt specifier to translate
+ * @out_hwirq:	Pointer to storage for the hardware interrupt number
+ * @out_type:	Pointer to storage for the interrupt type
+ *
+ * Firmware interrupt specifier translation function for two or three cell
+ * specifications, where the parameter values map directly to the hardware
+ * interrupt number and the type specifier.
+ */
+int irq_domain_translate_twothreecell(struct irq_domain *d, struct irq_fwspe=
c *fwspec,
+				      unsigned long *out_hwirq, unsigned int *out_type)
+{
+	if (fwspec->param_count =3D=3D 2) {
+		*out_hwirq =3D fwspec->param[0];
+		*out_type =3D fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	}
+
+	if (fwspec->param_count =3D=3D 3) {
+		*out_hwirq =3D fwspec->param[1];
+		*out_type =3D fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(irq_domain_translate_twothreecell);
+
 int irq_domain_alloc_descs(int virq, unsigned int cnt, irq_hw_number_t hwirq,
 			   int node, const struct irq_affinity_desc *affinity)
 {
@@ -1252,47 +1281,6 @@ void irq_domain_reset_irq_data(struct irq_data *irq_da=
ta)
 EXPORT_SYMBOL_GPL(irq_domain_reset_irq_data);
=20
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
-/**
- * irq_domain_create_hierarchy - Add a irqdomain into the hierarchy
- * @parent:	Parent irq domain to associate with the new domain
- * @flags:	Irq domain flags associated to the domain
- * @size:	Size of the domain. See below
- * @fwnode:	Optional fwnode of the interrupt controller
- * @ops:	Pointer to the interrupt domain callbacks
- * @host_data:	Controller private data pointer
- *
- * If @size is 0 a tree domain is created, otherwise a linear domain.
- *
- * If successful the parent is associated to the new domain and the
- * domain flags are set.
- * Returns pointer to IRQ domain, or NULL on failure.
- */
-struct irq_domain *irq_domain_create_hierarchy(struct irq_domain *parent,
-					    unsigned int flags,
-					    unsigned int size,
-					    struct fwnode_handle *fwnode,
-					    const struct irq_domain_ops *ops,
-					    void *host_data)
-{
-	struct irq_domain_info info =3D {
-		.fwnode		=3D fwnode,
-		.size		=3D size,
-		.hwirq_max	=3D size,
-		.ops		=3D ops,
-		.host_data	=3D host_data,
-		.domain_flags	=3D flags,
-		.parent		=3D parent,
-	};
-	struct irq_domain *d;
-
-	if (!info.size)
-		info.hwirq_max =3D ~0U;
-
-	d =3D irq_domain_instantiate(&info);
-	return IS_ERR(d) ? NULL : d;
-}
-EXPORT_SYMBOL_GPL(irq_domain_create_hierarchy);
-
 static void irq_domain_insert_irq(int virq)
 {
 	struct irq_data *data;
@@ -2008,7 +1996,7 @@ static void irq_domain_check_hierarchy(struct irq_domai=
n *domain)
 		domain->flags |=3D IRQ_DOMAIN_FLAG_HIERARCHY;
 }
 #else	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
-/**
+/*
  * irq_domain_get_irq_data - Get irq_data associated with @virq and @domain
  * @domain:	domain to match
  * @virq:	IRQ number to get irq_data
@@ -2022,7 +2010,7 @@ struct irq_data *irq_domain_get_irq_data(struct irq_dom=
ain *domain,
 }
 EXPORT_SYMBOL_GPL(irq_domain_get_irq_data);
=20
-/**
+/*
  * irq_domain_set_info - Set the complete data for a @virq in @domain
  * @domain:		Interrupt domain to match
  * @virq:		IRQ number

