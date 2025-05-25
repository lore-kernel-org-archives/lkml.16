Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5991ADC7E
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 20:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748206428; cv=none; b=TttP6O8HyRDDiaC20sRUfbDGwoOdwn32ySOs13FxA7/yc6ju9Xw1Vn62XXd6AykmFp5Ae6FYYjbwlYeADJ1CQZLvGyNBdWTOahW3JqKa7d+Sbcdc7iAPbjcU7Kunig/PVu6+kflkzsqYkd3rYFmNWrKG35UCoKEji8fdAfA7xwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748206428; c=relaxed/simple;
	bh=87Y9UtE1bV0NznMoJYUdEzGExRkwtxvQR4K0CzPR56M=;
	h=From:To:Cc:Subject:References:Message-ID:Content-Type:
	 MIME-Version:Date; b=JRHt1RYSQ7byRTjFZDq/S578SdAki1owqJq53Uo2/N4eZe73Mh85Ip0yo6W24LesjV3/ENTdl0wV6SOERM5XSgZaXkEJmJwTzYHc6WvE/AsgMXlKv334ltccU8+cy7ZOYmLNXtLCrYgzSC1JTz/be5t3jx/1dCwcaHdFp2cxR6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zpLYGdK/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SvYUbYXW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zpLYGdK/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SvYUbYXW"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748206423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=SZmMBAe8QPFBI9mhG+0i95R9Kt9c0yNsb397kGWF1jQ=;
	b=zpLYGdK/rW6Jtz0SU6eGfqBzXiUNQvTtGt5GsXxtq4Hg00ffh9c6CcL3zrhYzv9FakUC+D
	sDlZGuhgjWJGHuNNGX89x4ZP51F/Y2hMvP3yv309dgv8gIXFlfn/fgiRfYkbf38qyqQLn1
	4ldbrxmZV9ueX/aY3OIT2BB9qKd9n93wzWBqET18pY09fvmY1v4VsIUuMBnZ3UsRnDalky
	SdhSgWpLNeWj+AnIOY8n08qKE0IBQoQro/r7k/IZk4VCFplhxaAML2A37dEZD4onCHWLxc
	xr47JUa1ILjgLrGMp0l5pAZfi5+x7tRdmeiuXLJ4b1UcoXnqMWmiW40SO8ozJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748206423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=SZmMBAe8QPFBI9mhG+0i95R9Kt9c0yNsb397kGWF1jQ=;
	b=SvYUbYXW7kos0uIef3ejM04ghxXItoNgEXFyrnn6fmlW7n4+MW/TG+pKI548HU3IAStYWb
	xNd0vsElVAp1NUCw==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] irq/drivers for v6.16-rc1
References: <174820637262.238682.1985899398053030312.tglx@xen13>
Message-ID: <174820637812.238682.1039624619620049695.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 May 2025 22:53:42 +0200 (CEST)

Linus,

please pull the latest irq/drivers branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-drivers-2025=
-05-25

up to:  3e402acd5c4f: irqchip/irq-pruss-intc: Simplify chained interrupt hand=
ler setup


Update for interrupt chip drivers:

  - Convert the generic interrupt chip to lock guards to remove copy &
    pasta boilerplate code and gotos.

  - A new driver fot the interrupt controller in the EcoNet EN751221 MIPS SoC.

  - Extend the SG2042-MSI driver to support the new SG2044 SoC

  - Updates and cleanups for the (ancient) VT8500 driver

  - Improve the scalability of the ARM GICV4.1 ITS driver by utilizing node
    local copies a VM's interrupt translation table when possible. This
    results in a 12% reduction of VM IPI latency in certain workloads.

  - The usual cleanups and improvements all over the place

Thanks,

	tglx

------------------>
Alexey Charkov (5):
      irqchip/irq-vt8500: Split up ack/mask functions
      irqchip/irq-vt8500: Drop redundant copy of the device node pointer
      irqchip/irq-vt8500: Don't require 8 interrupts from a chained controller
      irqchip/irq-vt8500: Use a dedicated chained handler function
      irqchip/irq-vt8500: Use fewer global variables and add error handling

Caleb James DeLisle (2):
      dt-bindings: interrupt-controller: Add EcoNet EN751221 INTC
      irqchip: Add EcoNet EN751221 INTC

Chen Ni (1):
      irqchip/irq-pruss-intc: Simplify chained interrupt handler setup

Geert Uytterhoeven (1):
      genirq/generic-chip: Fix incorrect lock guard conversions

Inochi Amaoto (5):
      dt-bindings: interrupt-controller: Add Sophgo SG2044 MSI controller
      irqchip/sg2042-msi: Rename functions and data structures to be SG2042 a=
gnostic
      irqchip/sg2042-msi: Introduce configurable chipinfo for SG2042
      irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller
      irqchip/sg2042-msi: Fix wrong type cast in sg2044_msi_irq_ack()

Jiri Slaby (SUSE) (2):
      irqchip/irq-vt8500: Switch to irq_domain_create_*()
      irqchip/econet-en751221: Switch to of_fwnode_handle()

Nianyao Tang (1):
      irqchip/gic-v4.1: Use local 4_1 ITS to generate VSGI

Thomas Gleixner (8):
      genirq/generic-chip: Make locking unconditional
      genirq/generic-chip: Convert core code to lock guards
      soc: dove: Convert generic irqchip locking to guard()
      ARM: orion/gpio:: Convert generic irqchip locking to guard()
      gpio: mvebu: Convert generic irqchip locking to guard()
      irqchip: Convert generic irqchip locking to guards
      genirq/generic-chip: Remove unused lock wrappers
      irqchip/econet-en751221: Switch to irq_domain_create_linear()


 .../interrupt-controller/econet,en751221-intc.yaml |  78 ++++++
 .../interrupt-controller/sophgo,sg2042-msi.yaml    |   4 +-
 arch/arm/plat-orion/gpio.c                         |   6 +-
 drivers/gpio/gpio-mvebu.c                          |  15 +-
 drivers/irqchip/Kconfig                            |   5 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-al-fic.c                       |  18 +-
 drivers/irqchip/irq-atmel-aic.c                    |  19 +-
 drivers/irqchip/irq-atmel-aic5.c                   |  28 +-
 drivers/irqchip/irq-bcm7120-l2.c                   |  22 +-
 drivers/irqchip/irq-brcmstb-l2.c                   |   8 +-
 drivers/irqchip/irq-csky-apb-intc.c                |   3 +-
 drivers/irqchip/irq-dw-apb-ictl.c                  |   3 +-
 drivers/irqchip/irq-econet-en751221.c              | 310 +++++++++++++++++++=
++
 drivers/irqchip/irq-gic-v3-its.c                   |   6 +-
 drivers/irqchip/irq-ingenic-tcu.c                  |   9 +-
 drivers/irqchip/irq-lan966x-oic.c                  |  18 +-
 drivers/irqchip/irq-loongson-liointc.c             |   9 +-
 drivers/irqchip/irq-mscc-ocelot.c                  |   3 +-
 drivers/irqchip/irq-pruss-intc.c                   |   3 +-
 drivers/irqchip/irq-sg2042-msi.c                   | 152 +++++++---
 drivers/irqchip/irq-stm32-exti.c                   |  21 +-
 drivers/irqchip/irq-sunxi-nmi.c                    |   9 +-
 drivers/irqchip/irq-tb10x.c                        |  13 +-
 drivers/irqchip/irq-vt8500.c                       | 153 +++++-----
 drivers/soc/dove/pmu.c                             |   3 +-
 include/linux/irq.h                                |  25 --
 kernel/irq/generic-chip.c                          |  47 ++--
 28 files changed, 679 insertions(+), 312 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ec=
onet,en751221-intc.yaml
 create mode 100644 drivers/irqchip/irq-econet-en751221.c

diff --git a/Documentation/devicetree/bindings/interrupt-controller/econet,en=
751221-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/eco=
net,en751221-intc.yaml
new file mode 100644
index 000000000000..5536319c49c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-=
intc.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/econet,en751221-intc=
.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet EN751221 Interrupt Controller
+
+maintainers:
+  - Caleb James DeLisle <cjd@cjdns.fr>
+
+description:
+  The EcoNet EN751221 Interrupt Controller is a simple interrupt controller
+  designed for the MIPS 34Kc MT SMP processor with 2 VPEs. Each interrupt can
+  be routed to either VPE but not both, so to support per-CPU interrupts, a
+  secondary IRQ number is allocated to control masking/unmasking on VPE#1. F=
or
+  lack of a better term we call these "shadow interrupts". The assignment of
+  shadow interrupts is defined by the SoC integrator when wiring the interru=
pt
+  lines, so they are configurable in the device tree.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: econet,en751221-intc
+
+  reg:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt line connecting this controller to its parent.
+
+  econet,shadow-interrupts:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description:
+      An array of interrupt number pairs where each pair represents a shadow
+      interrupt relationship. The first number in each pair is the primary I=
RQ,
+      and the second is its shadow IRQ used for VPE#1 control. For example,
+      <8 3> means IRQ 8 is shadowed by IRQ 3, so IRQ 3 cannot be mapped, but
+      when VPE#1 requests IRQ 8, it will manipulate the IRQ 3 mask bit.
+    minItems: 1
+    maxItems: 20
+    items:
+      items:
+        - description: primary per-CPU IRQ
+        - description: shadow IRQ number
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@1fb40000 {
+        compatible =3D "econet,en751221-intc";
+        reg =3D <0x1fb40000 0x100>;
+
+        interrupt-controller;
+        #interrupt-cells =3D <1>;
+
+        interrupt-parent =3D <&cpuintc>;
+        interrupts =3D <2>;
+
+        econet,shadow-interrupts =3D <7 2>, <8 3>, <13 12>, <30 29>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg=
2042-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo=
,sg2042-msi.yaml
index e1ffd55fa7bf..f6b8b1d92f79 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-ms=
i.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-ms=
i.yaml
@@ -18,7 +18,9 @@ allOf:
=20
 properties:
   compatible:
-    const: sophgo,sg2042-msi
+    enum:
+      - sophgo,sg2042-msi
+      - sophgo,sg2044-msi
=20
   reg:
     items:
diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index 595e9cb33c1d..47d411d80a94 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -496,11 +496,10 @@ static void orion_gpio_unmask_irq(struct irq_data *d)
 	u32 reg_val;
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	reg_val =3D irq_reg_readl(gc, ct->regs.mask);
 	reg_val |=3D mask;
 	irq_reg_writel(gc, reg_val, ct->regs.mask);
-	irq_gc_unlock(gc);
 }
=20
 static void orion_gpio_mask_irq(struct irq_data *d)
@@ -510,11 +509,10 @@ static void orion_gpio_mask_irq(struct irq_data *d)
 	u32 mask =3D d->mask;
 	u32 reg_val;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	reg_val =3D irq_reg_readl(gc, ct->regs.mask);
 	reg_val &=3D ~mask;
 	irq_reg_writel(gc, reg_val, ct->regs.mask);
-	irq_gc_unlock(gc);
 }
=20
 void __init orion_gpio_init(int gpio_base, int ngpio,
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 3604abcb6fec..2581fbbfbad3 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -408,9 +408,8 @@ static void mvebu_gpio_irq_ack(struct irq_data *d)
 	struct mvebu_gpio_chip *mvchip =3D gc->private;
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	mvebu_gpio_write_edge_cause(mvchip, ~mask);
-	irq_gc_unlock(gc);
 }
=20
 static void mvebu_gpio_edge_irq_mask(struct irq_data *d)
@@ -420,10 +419,9 @@ static void mvebu_gpio_edge_irq_mask(struct irq_data *d)
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	ct->mask_cache_priv &=3D ~mask;
 	mvebu_gpio_write_edge_mask(mvchip, ct->mask_cache_priv);
-	irq_gc_unlock(gc);
 }
=20
 static void mvebu_gpio_edge_irq_unmask(struct irq_data *d)
@@ -433,11 +431,10 @@ static void mvebu_gpio_edge_irq_unmask(struct irq_data =
*d)
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	mvebu_gpio_write_edge_cause(mvchip, ~mask);
 	ct->mask_cache_priv |=3D mask;
 	mvebu_gpio_write_edge_mask(mvchip, ct->mask_cache_priv);
-	irq_gc_unlock(gc);
 }
=20
 static void mvebu_gpio_level_irq_mask(struct irq_data *d)
@@ -447,10 +444,9 @@ static void mvebu_gpio_level_irq_mask(struct irq_data *d)
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	ct->mask_cache_priv &=3D ~mask;
 	mvebu_gpio_write_level_mask(mvchip, ct->mask_cache_priv);
-	irq_gc_unlock(gc);
 }
=20
 static void mvebu_gpio_level_irq_unmask(struct irq_data *d)
@@ -460,10 +456,9 @@ static void mvebu_gpio_level_irq_unmask(struct irq_data =
*d)
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	ct->mask_cache_priv |=3D mask;
 	mvebu_gpio_write_level_mask(mvchip, ct->mask_cache_priv);
-	irq_gc_unlock(gc);
 }
=20
 /***************************************************************************=
**
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index cec05e443083..4b438708cdd6 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -166,6 +166,11 @@ config DW_APB_ICTL
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN_HIERARCHY
=20
+config ECONET_EN751221_INTC
+	bool
+	select GENERIC_IRQ_CHIP
+	select IRQ_DOMAIN
+
 config FARADAY_FTINTC010
 	bool
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 365bcea9a61f..23ca4959e6ce 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_ARCH_BCM2835)		+=3D irq-bcm2836.o
 obj-$(CONFIG_ARCH_ACTIONS)		+=3D irq-owl-sirq.o
 obj-$(CONFIG_DAVINCI_CP_INTC)		+=3D irq-davinci-cp-intc.o
 obj-$(CONFIG_EXYNOS_IRQ_COMBINER)	+=3D exynos-combiner.o
+obj-$(CONFIG_ECONET_EN751221_INTC)	+=3D irq-econet-en751221.o
 obj-$(CONFIG_FARADAY_FTINTC010)		+=3D irq-ftintc010.o
 obj-$(CONFIG_ARCH_HIP04)		+=3D irq-hip04.o
 obj-$(CONFIG_ARCH_LPC32XX)		+=3D irq-lpc32xx.o
diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index dfb761e86c9c..7308b8dadecc 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -65,15 +65,13 @@ static int al_fic_irq_set_type(struct irq_data *data, uns=
igned int flow_type)
 	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
 	struct al_fic *fic =3D gc->private;
 	enum al_fic_state new_state;
-	int ret =3D 0;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
=20
 	if (((flow_type & IRQ_TYPE_SENSE_MASK) !=3D IRQ_TYPE_LEVEL_HIGH) &&
 	    ((flow_type & IRQ_TYPE_SENSE_MASK) !=3D IRQ_TYPE_EDGE_RISING)) {
 		pr_debug("fic doesn't support flow type %d\n", flow_type);
-		ret =3D -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
=20
 	new_state =3D (flow_type & IRQ_TYPE_LEVEL_HIGH) ?
@@ -91,16 +89,10 @@ static int al_fic_irq_set_type(struct irq_data *data, uns=
igned int flow_type)
 	if (fic->state =3D=3D AL_FIC_UNCONFIGURED) {
 		al_fic_set_trigger(fic, gc, new_state);
 	} else if (fic->state !=3D new_state) {
-		pr_debug("fic %s state already configured to %d\n",
-			 fic->name, fic->state);
-		ret =3D -EINVAL;
-		goto err;
+		pr_debug("fic %s state already configured to %d\n", fic->name, fic->state);
+		return -EINVAL;
 	}
-
-err:
-	irq_gc_unlock(gc);
-
-	return ret;
+	return 0;
 }
=20
 static void al_fic_irq_handler(struct irq_desc *desc)
diff --git a/drivers/irqchip/irq-atmel-aic.c b/drivers/irqchip/irq-atmel-aic.c
index 3839ad79ad31..03aeed39a4d2 100644
--- a/drivers/irqchip/irq-atmel-aic.c
+++ b/drivers/irqchip/irq-atmel-aic.c
@@ -78,9 +78,8 @@ static int aic_retrigger(struct irq_data *d)
 	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
=20
 	/* Enable interrupt on AIC5 */
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	irq_reg_writel(gc, d->mask, AT91_AIC_ISCR);
-	irq_gc_unlock(gc);
=20
 	return 1;
 }
@@ -106,30 +105,27 @@ static void aic_suspend(struct irq_data *d)
 {
 	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	irq_reg_writel(gc, gc->mask_cache, AT91_AIC_IDCR);
 	irq_reg_writel(gc, gc->wake_active, AT91_AIC_IECR);
-	irq_gc_unlock(gc);
 }
=20
 static void aic_resume(struct irq_data *d)
 {
 	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	irq_reg_writel(gc, gc->wake_active, AT91_AIC_IDCR);
 	irq_reg_writel(gc, gc->mask_cache, AT91_AIC_IECR);
-	irq_gc_unlock(gc);
 }
=20
 static void aic_pm_shutdown(struct irq_data *d)
 {
 	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	irq_reg_writel(gc, 0xffffffff, AT91_AIC_IDCR);
 	irq_reg_writel(gc, 0xffffffff, AT91_AIC_ICCR);
-	irq_gc_unlock(gc);
 }
 #else
 #define aic_suspend		NULL
@@ -175,10 +171,8 @@ static int aic_irq_domain_xlate(struct irq_domain *d,
 {
 	struct irq_domain_chip_generic *dgc =3D d->gc;
 	struct irq_chip_generic *gc;
-	unsigned long flags;
 	unsigned smr;
-	int idx;
-	int ret;
+	int idx, ret;
=20
 	if (!dgc)
 		return -EINVAL;
@@ -194,11 +188,10 @@ static int aic_irq_domain_xlate(struct irq_domain *d,
=20
 	gc =3D dgc->gc[idx];
=20
-	irq_gc_lock_irqsave(gc, flags);
+	guard(raw_spinlock_irq)(&gc->lock);
 	smr =3D irq_reg_readl(gc, AT91_AIC_SMR(*out_hwirq));
 	aic_common_set_priority(intspec[2], &smr);
 	irq_reg_writel(gc, smr, AT91_AIC_SMR(*out_hwirq));
-	irq_gc_unlock_irqrestore(gc, flags);
=20
 	return ret;
 }
diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic=
5.c
index e98c2875af9e..60b00d2c3d7a 100644
--- a/drivers/irqchip/irq-atmel-aic5.c
+++ b/drivers/irqchip/irq-atmel-aic5.c
@@ -92,11 +92,10 @@ static void aic5_mask(struct irq_data *d)
 	 * Disable interrupt on AIC5. We always take the lock of the
 	 * first irq chip as all chips share the same registers.
 	 */
-	irq_gc_lock(bgc);
+	guard(raw_spinlock)(&bgc->lock);
 	irq_reg_writel(gc, d->hwirq, AT91_AIC5_SSR);
 	irq_reg_writel(gc, 1, AT91_AIC5_IDCR);
 	gc->mask_cache &=3D ~d->mask;
-	irq_gc_unlock(bgc);
 }
=20
 static void aic5_unmask(struct irq_data *d)
@@ -109,11 +108,10 @@ static void aic5_unmask(struct irq_data *d)
 	 * Enable interrupt on AIC5. We always take the lock of the
 	 * first irq chip as all chips share the same registers.
 	 */
-	irq_gc_lock(bgc);
+	guard(raw_spinlock)(&bgc->lock);
 	irq_reg_writel(gc, d->hwirq, AT91_AIC5_SSR);
 	irq_reg_writel(gc, 1, AT91_AIC5_IECR);
 	gc->mask_cache |=3D d->mask;
-	irq_gc_unlock(bgc);
 }
=20
 static int aic5_retrigger(struct irq_data *d)
@@ -122,11 +120,9 @@ static int aic5_retrigger(struct irq_data *d)
 	struct irq_chip_generic *bgc =3D irq_get_domain_generic_chip(domain, 0);
=20
 	/* Enable interrupt on AIC5 */
-	irq_gc_lock(bgc);
+	guard(raw_spinlock)(&bgc->lock);
 	irq_reg_writel(bgc, d->hwirq, AT91_AIC5_SSR);
 	irq_reg_writel(bgc, 1, AT91_AIC5_ISCR);
-	irq_gc_unlock(bgc);
-
 	return 1;
 }
=20
@@ -137,14 +133,12 @@ static int aic5_set_type(struct irq_data *d, unsigned t=
ype)
 	unsigned int smr;
 	int ret;
=20
-	irq_gc_lock(bgc);
+	guard(raw_spinlock)(&bgc->lock);
 	irq_reg_writel(bgc, d->hwirq, AT91_AIC5_SSR);
 	smr =3D irq_reg_readl(bgc, AT91_AIC5_SMR);
 	ret =3D aic_common_set_type(d, type, &smr);
 	if (!ret)
 		irq_reg_writel(bgc, smr, AT91_AIC5_SMR);
-	irq_gc_unlock(bgc);
-
 	return ret;
 }
=20
@@ -166,7 +160,7 @@ static void aic5_suspend(struct irq_data *d)
 			smr_cache[i] =3D irq_reg_readl(bgc, AT91_AIC5_SMR);
 		}
=20
-	irq_gc_lock(bgc);
+	guard(raw_spinlock)(&bgc->lock);
 	for (i =3D 0; i < dgc->irqs_per_chip; i++) {
 		mask =3D 1 << i;
 		if ((mask & gc->mask_cache) =3D=3D (mask & gc->wake_active))
@@ -178,7 +172,6 @@ static void aic5_suspend(struct irq_data *d)
 		else
 			irq_reg_writel(bgc, 1, AT91_AIC5_IDCR);
 	}
-	irq_gc_unlock(bgc);
 }
=20
 static void aic5_resume(struct irq_data *d)
@@ -190,7 +183,7 @@ static void aic5_resume(struct irq_data *d)
 	int i;
 	u32 mask;
=20
-	irq_gc_lock(bgc);
+	guard(raw_spinlock)(&bgc->lock);
=20
 	if (smr_cache) {
 		irq_reg_writel(bgc, 0xffffffff, AT91_AIC5_SPU);
@@ -214,7 +207,6 @@ static void aic5_resume(struct irq_data *d)
 		else
 			irq_reg_writel(bgc, 1, AT91_AIC5_IDCR);
 	}
-	irq_gc_unlock(bgc);
 }
=20
 static void aic5_pm_shutdown(struct irq_data *d)
@@ -225,13 +217,12 @@ static void aic5_pm_shutdown(struct irq_data *d)
 	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
 	int i;
=20
-	irq_gc_lock(bgc);
+	guard(raw_spinlock)(&bgc->lock);
 	for (i =3D 0; i < dgc->irqs_per_chip; i++) {
 		irq_reg_writel(bgc, i + gc->irq_base, AT91_AIC5_SSR);
 		irq_reg_writel(bgc, 1, AT91_AIC5_IDCR);
 		irq_reg_writel(bgc, 1, AT91_AIC5_ICCR);
 	}
-	irq_gc_unlock(bgc);
 }
 #else
 #define aic5_suspend		NULL
@@ -277,7 +268,6 @@ static int aic5_irq_domain_xlate(struct irq_domain *d,
 				 unsigned int *out_type)
 {
 	struct irq_chip_generic *bgc =3D irq_get_domain_generic_chip(d, 0);
-	unsigned long flags;
 	unsigned smr;
 	int ret;
=20
@@ -289,13 +279,11 @@ static int aic5_irq_domain_xlate(struct irq_domain *d,
 	if (ret)
 		return ret;
=20
-	irq_gc_lock_irqsave(bgc, flags);
+	guard(raw_spinlock_irq)(&bgc->lock);
 	irq_reg_writel(bgc, *out_hwirq, AT91_AIC5_SSR);
 	smr =3D irq_reg_readl(bgc, AT91_AIC5_SMR);
 	aic_common_set_priority(intspec[2], &smr);
 	irq_reg_writel(bgc, smr, AT91_AIC5_SMR);
-	irq_gc_unlock_irqrestore(bgc, flags);
-
 	return ret;
 }
=20
diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l=
2.c
index 1e9dab6e0d86..90909f8c6e84 100644
--- a/drivers/irqchip/irq-bcm7120-l2.c
+++ b/drivers/irqchip/irq-bcm7120-l2.c
@@ -63,16 +63,15 @@ static void bcm7120_l2_intc_irq_handle(struct irq_desc *d=
esc)
=20
 	for (idx =3D 0; idx < b->n_words; idx++) {
 		int base =3D idx * IRQS_PER_WORD;
-		struct irq_chip_generic *gc =3D
-			irq_get_domain_generic_chip(b->domain, base);
+		struct irq_chip_generic *gc;
 		unsigned long pending;
 		int hwirq;
=20
-		irq_gc_lock(gc);
-		pending =3D irq_reg_readl(gc, b->stat_offset[idx]) &
-					    gc->mask_cache &
-					    data->irq_map_mask[idx];
-		irq_gc_unlock(gc);
+		gc =3D irq_get_domain_generic_chip(b->domain, base);
+		scoped_guard (raw_spinlock, &gc->lock) {
+			pending =3D irq_reg_readl(gc, b->stat_offset[idx]) & gc->mask_cache &
+				data->irq_map_mask[idx];
+		}
=20
 		for_each_set_bit(hwirq, &pending, IRQS_PER_WORD)
 			generic_handle_domain_irq(b->domain, base + hwirq);
@@ -86,11 +85,9 @@ static void bcm7120_l2_intc_suspend(struct irq_chip_generi=
c *gc)
 	struct bcm7120_l2_intc_data *b =3D gc->private;
 	struct irq_chip_type *ct =3D gc->chip_types;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	if (b->can_wake)
-		irq_reg_writel(gc, gc->mask_cache | gc->wake_active,
-			       ct->regs.mask);
-	irq_gc_unlock(gc);
+		irq_reg_writel(gc, gc->mask_cache | gc->wake_active, ct->regs.mask);
 }
=20
 static void bcm7120_l2_intc_resume(struct irq_chip_generic *gc)
@@ -98,9 +95,8 @@ static void bcm7120_l2_intc_resume(struct irq_chip_generic =
*gc)
 	struct irq_chip_type *ct =3D gc->chip_types;
=20
 	/* Restore the saved mask */
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	irq_reg_writel(gc, gc->mask_cache, ct->regs.mask);
-	irq_gc_unlock(gc);
 }
=20
 static int bcm7120_l2_intc_init_one(struct device_node *dn,
diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l=
2.c
index db4c9721fcf2..aa4e1232fd62 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -97,9 +97,8 @@ static void __brcmstb_l2_intc_suspend(struct irq_data *d, b=
ool save)
 	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	struct brcmstb_l2_intc_data *b =3D gc->private;
-	unsigned long flags;
=20
-	irq_gc_lock_irqsave(gc, flags);
+	guard(raw_spinlock_irqsave)(&gc->lock);
 	/* Save the current mask */
 	if (save)
 		b->saved_mask =3D irq_reg_readl(gc, ct->regs.mask);
@@ -109,7 +108,6 @@ static void __brcmstb_l2_intc_suspend(struct irq_data *d,=
 bool save)
 		irq_reg_writel(gc, ~gc->wake_active, ct->regs.disable);
 		irq_reg_writel(gc, gc->wake_active, ct->regs.enable);
 	}
-	irq_gc_unlock_irqrestore(gc, flags);
 }
=20
 static void brcmstb_l2_intc_shutdown(struct irq_data *d)
@@ -127,9 +125,8 @@ static void brcmstb_l2_intc_resume(struct irq_data *d)
 	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	struct brcmstb_l2_intc_data *b =3D gc->private;
-	unsigned long flags;
=20
-	irq_gc_lock_irqsave(gc, flags);
+	guard(raw_spinlock_irqsave)(&gc->lock);
 	if (ct->chip.irq_ack) {
 		/* Clear unmasked non-wakeup interrupts */
 		irq_reg_writel(gc, ~b->saved_mask & ~gc->wake_active,
@@ -139,7 +136,6 @@ static void brcmstb_l2_intc_resume(struct irq_data *d)
 	/* Restore the saved mask */
 	irq_reg_writel(gc, b->saved_mask, ct->regs.disable);
 	irq_reg_writel(gc, ~b->saved_mask, ct->regs.enable);
-	irq_gc_unlock_irqrestore(gc, flags);
 }
=20
 static int __init brcmstb_l2_intc_of_init(struct device_node *np,
diff --git a/drivers/irqchip/irq-csky-apb-intc.c b/drivers/irqchip/irq-csky-a=
pb-intc.c
index 6710691e4c25..6e17186db1cb 100644
--- a/drivers/irqchip/irq-csky-apb-intc.c
+++ b/drivers/irqchip/irq-csky-apb-intc.c
@@ -50,11 +50,10 @@ static void irq_ck_mask_set_bit(struct irq_data *d)
 	unsigned long ifr =3D ct->regs.mask - 8;
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	*ct->mask_cache |=3D mask;
 	irq_reg_writel(gc, *ct->mask_cache, ct->regs.mask);
 	irq_reg_writel(gc, irq_reg_readl(gc, ifr) & ~mask, ifr);
-	irq_gc_unlock(gc);
 }
=20
 static void __init ck_set_gc(struct device_node *node, void __iomem *reg_bas=
e,
diff --git a/drivers/irqchip/irq-dw-apb-ictl.c b/drivers/irqchip/irq-dw-apb-i=
ctl.c
index d5c1c750c8d2..6874ec82f6da 100644
--- a/drivers/irqchip/irq-dw-apb-ictl.c
+++ b/drivers/irqchip/irq-dw-apb-ictl.c
@@ -101,10 +101,9 @@ static void dw_apb_ictl_resume(struct irq_data *d)
 	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	writel_relaxed(~0, gc->reg_base + ct->regs.enable);
 	writel_relaxed(*ct->mask_cache, gc->reg_base + ct->regs.mask);
-	irq_gc_unlock(gc);
 }
 #else
 #define dw_apb_ictl_resume	NULL
diff --git a/drivers/irqchip/irq-econet-en751221.c b/drivers/irqchip/irq-econ=
et-en751221.c
new file mode 100644
index 000000000000..d83d5eb12795
--- /dev/null
+++ b/drivers/irqchip/irq-econet-en751221.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * EN751221 Interrupt Controller Driver.
+ *
+ * The EcoNet EN751221 Interrupt Controller is a simple interrupt controller
+ * designed for the MIPS 34Kc MT SMP processor with 2 VPEs. Each interrupt c=
an
+ * be routed to either VPE but not both, so to support per-CPU interrupts, a
+ * secondary IRQ number is allocated to control masking/unmasking on VPE#1. =
In
+ * this driver, these are called "shadow interrupts". The assignment of shad=
ow
+ * interrupts is defined by the SoC integrator when wiring the interrupt lin=
es,
+ * so they are configurable in the device tree.
+ *
+ * If an interrupt (say 30) needs per-CPU capability, the SoC integrator
+ * allocates another IRQ number (say 29) to be its shadow. The device tree
+ * reflects this by adding the pair <30 29> to the "econet,shadow-interrupts"
+ * property.
+ *
+ * When VPE#1 requests IRQ 30, the driver manipulates the mask bit for IRQ 2=
9,
+ * telling the hardware to mask VPE#1's view of IRQ 30.
+ *
+ * Copyright (C) 2025 Caleb James DeLisle <cjd@cjdns.fr>
+ */
+
+#include <linux/cleanup.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+
+#define IRQ_COUNT		40
+
+#define NOT_PERCPU		0xff
+#define IS_SHADOW		0xfe
+
+#define REG_MASK0		0x04
+#define REG_MASK1		0x50
+#define REG_PENDING0		0x08
+#define REG_PENDING1		0x54
+
+/**
+ * @membase: Base address of the interrupt controller registers
+ * @interrupt_shadows: Array of all interrupts, for each value,
+ *	- NOT_PERCPU: This interrupt is not per-cpu, so it has no shadow
+ *	- IS_SHADOW: This interrupt is a shadow of another per-cpu interrupt
+ *	- else: This is a per-cpu interrupt whose shadow is the value
+ */
+static struct {
+	void __iomem	*membase;
+	u8		interrupt_shadows[IRQ_COUNT];
+} econet_intc __ro_after_init;
+
+static DEFINE_RAW_SPINLOCK(irq_lock);
+
+/* IRQs must be disabled */
+static void econet_wreg(u32 reg, u32 val, u32 mask)
+{
+	u32 v;
+
+	guard(raw_spinlock)(&irq_lock);
+
+	v =3D ioread32(econet_intc.membase + reg);
+	v &=3D ~mask;
+	v |=3D val & mask;
+	iowrite32(v, econet_intc.membase + reg);
+}
+
+/* IRQs must be disabled */
+static void econet_chmask(u32 hwirq, bool unmask)
+{
+	u32 reg, mask;
+	u8 shadow;
+
+	/*
+	 * If the IRQ is a shadow, it should never be manipulated directly.
+	 * It should only be masked/unmasked as a result of the "real" per-cpu
+	 * irq being manipulated by a thread running on VPE#1.
+	 * If it is per-cpu (has a shadow), and we're on VPE#1, the shadow is what =
we mask.
+	 * This is single processor only, so smp_processor_id() never exceeds 1.
+	 */
+	shadow =3D econet_intc.interrupt_shadows[hwirq];
+	if (WARN_ON_ONCE(shadow =3D=3D IS_SHADOW))
+		return;
+	else if (shadow !=3D NOT_PERCPU && smp_processor_id() =3D=3D 1)
+		hwirq =3D shadow;
+
+	if (hwirq >=3D 32) {
+		reg =3D REG_MASK1;
+		mask =3D BIT(hwirq - 32);
+	} else {
+		reg =3D REG_MASK0;
+		mask =3D BIT(hwirq);
+	}
+
+	econet_wreg(reg, unmask ? mask : 0, mask);
+}
+
+/* IRQs must be disabled */
+static void econet_intc_mask(struct irq_data *d)
+{
+	econet_chmask(d->hwirq, false);
+}
+
+/* IRQs must be disabled */
+static void econet_intc_unmask(struct irq_data *d)
+{
+	econet_chmask(d->hwirq, true);
+}
+
+static void econet_mask_all(void)
+{
+	/* IRQs are generally disabled during init, but guarding here makes it non-=
obligatory. */
+	guard(irqsave)();
+	econet_wreg(REG_MASK0, 0, ~0);
+	econet_wreg(REG_MASK1, 0, ~0);
+}
+
+static void econet_intc_handle_pending(struct irq_domain *d, u32 pending, u3=
2 offset)
+{
+	int hwirq;
+
+	while (pending) {
+		hwirq =3D fls(pending) - 1;
+		generic_handle_domain_irq(d, hwirq + offset);
+		pending &=3D ~BIT(hwirq);
+	}
+}
+
+static void econet_intc_from_parent(struct irq_desc *desc)
+{
+	struct irq_chip *chip =3D irq_desc_get_chip(desc);
+	struct irq_domain *domain;
+	u32 pending0, pending1;
+
+	chained_irq_enter(chip, desc);
+
+	pending0 =3D ioread32(econet_intc.membase + REG_PENDING0);
+	pending1 =3D ioread32(econet_intc.membase + REG_PENDING1);
+
+	if (unlikely(!(pending0 | pending1))) {
+		spurious_interrupt();
+	} else {
+		domain =3D irq_desc_get_handler_data(desc);
+		econet_intc_handle_pending(domain, pending0, 0);
+		econet_intc_handle_pending(domain, pending1, 32);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static const struct irq_chip econet_irq_chip;
+
+static int econet_intc_map(struct irq_domain *d, u32 irq, irq_hw_number_t hw=
irq)
+{
+	int ret;
+
+	if (hwirq >=3D IRQ_COUNT) {
+		pr_err("%s: hwirq %lu out of range\n", __func__, hwirq);
+		return -EINVAL;
+	} else if (econet_intc.interrupt_shadows[hwirq] =3D=3D IS_SHADOW) {
+		pr_err("%s: can't map hwirq %lu, it is a shadow interrupt\n", __func__, hw=
irq);
+		return -EINVAL;
+	}
+
+	if (econet_intc.interrupt_shadows[hwirq] =3D=3D NOT_PERCPU) {
+		irq_set_chip_and_handler(irq, &econet_irq_chip, handle_level_irq);
+	} else {
+		irq_set_chip_and_handler(irq, &econet_irq_chip, handle_percpu_devid_irq);
+		ret =3D irq_set_percpu_devid(irq);
+		if (ret)
+			pr_warn("%s: Failed irq_set_percpu_devid for %u: %d\n", d->name, irq, ret=
);
+	}
+
+	irq_set_chip_data(irq, NULL);
+	return 0;
+}
+
+static const struct irq_chip econet_irq_chip =3D {
+	.name		=3D "en751221-intc",
+	.irq_unmask	=3D econet_intc_unmask,
+	.irq_mask	=3D econet_intc_mask,
+	.irq_mask_ack	=3D econet_intc_mask,
+};
+
+static const struct irq_domain_ops econet_domain_ops =3D {
+	.xlate	=3D irq_domain_xlate_onecell,
+	.map	=3D econet_intc_map
+};
+
+static int __init get_shadow_interrupts(struct device_node *node)
+{
+	const char *field =3D "econet,shadow-interrupts";
+	int num_shadows;
+
+	num_shadows =3D of_property_count_u32_elems(node, field);
+
+	memset(econet_intc.interrupt_shadows, NOT_PERCPU,
+	       sizeof(econet_intc.interrupt_shadows));
+
+	if (num_shadows <=3D 0) {
+		return 0;
+	} else if (num_shadows % 2) {
+		pr_err("%pOF: %s count is odd, ignoring\n", node, field);
+		return 0;
+	}
+
+	u32 *shadows __free(kfree) =3D kmalloc_array(num_shadows, sizeof(u32), GFP_=
KERNEL);
+	if (!shadows)
+		return -ENOMEM;
+
+	if (of_property_read_u32_array(node, field, shadows, num_shadows)) {
+		pr_err("%pOF: Failed to read %s\n", node, field);
+		return -EINVAL;
+	}
+
+	for (int i =3D 0; i < num_shadows; i +=3D 2) {
+		u32 shadow =3D shadows[i + 1];
+		u32 target =3D shadows[i];
+
+		if (shadow > IRQ_COUNT) {
+			pr_err("%pOF: %s[%d] shadow(%d) out of range\n",
+			       node, field, i + 1, shadow);
+			continue;
+		}
+
+		if (target >=3D IRQ_COUNT) {
+			pr_err("%pOF: %s[%d] target(%d) out of range\n", node, field, i, target);
+			continue;
+		}
+
+		if (econet_intc.interrupt_shadows[target] !=3D NOT_PERCPU) {
+			pr_err("%pOF: %s[%d] target(%d) already has a shadow\n",
+			       node, field, i, target);
+			continue;
+		}
+
+		if (econet_intc.interrupt_shadows[shadow] !=3D NOT_PERCPU) {
+			pr_err("%pOF: %s[%d] shadow(%d) already has a target\n",
+			       node, field, i + 1, shadow);
+			continue;
+		}
+
+		econet_intc.interrupt_shadows[target] =3D shadow;
+		econet_intc.interrupt_shadows[shadow] =3D IS_SHADOW;
+	}
+
+	return 0;
+}
+
+static int __init econet_intc_of_init(struct device_node *node, struct devic=
e_node *parent)
+{
+	struct irq_domain *domain;
+	struct resource res;
+	int ret, irq;
+
+	ret =3D get_shadow_interrupts(node);
+	if (ret)
+		return ret;
+
+	irq =3D irq_of_parse_and_map(node, 0);
+	if (!irq) {
+		pr_err("%pOF: DT: Failed to get IRQ from 'interrupts'\n", node);
+		return -EINVAL;
+	}
+
+	if (of_address_to_resource(node, 0, &res)) {
+		pr_err("%pOF: DT: Failed to get 'reg'\n", node);
+		ret =3D -EINVAL;
+		goto err_dispose_mapping;
+	}
+
+	if (!request_mem_region(res.start, resource_size(&res), res.name)) {
+		pr_err("%pOF: Failed to request memory\n", node);
+		ret =3D -EBUSY;
+		goto err_dispose_mapping;
+	}
+
+	econet_intc.membase =3D ioremap(res.start, resource_size(&res));
+	if (!econet_intc.membase) {
+		pr_err("%pOF: Failed to remap membase\n", node);
+		ret =3D -ENOMEM;
+		goto err_release;
+	}
+
+	econet_mask_all();
+
+	domain =3D irq_domain_create_linear(of_fwnode_handle(node), IRQ_COUNT,
+					  &econet_domain_ops, NULL);
+	if (!domain) {
+		pr_err("%pOF: Failed to add irqdomain\n", node);
+		ret =3D -ENOMEM;
+		goto err_unmap;
+	}
+
+	irq_set_chained_handler_and_data(irq, econet_intc_from_parent, domain);
+
+	return 0;
+
+err_unmap:
+	iounmap(econet_intc.membase);
+err_release:
+	release_mem_region(res.start, resource_size(&res));
+err_dispose_mapping:
+	irq_dispose_mapping(irq);
+	return ret;
+}
+
+IRQCHIP_DECLARE(econet_en751221_intc, "econet,en751221-intc", econet_intc_of=
_init);
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-it=
s.c
index 0115ad6c8259..81a44ce7619f 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -125,6 +125,8 @@ struct its_node {
 	int			vlpi_redist_offset;
 };
=20
+static DEFINE_PER_CPU(struct its_node *, local_4_1_its);
+
 #define is_v4(its)		(!!((its)->typer & GITS_TYPER_VLPIS))
 #define is_v4_1(its)		(!!((its)->typer & GITS_TYPER_VMAPP))
 #define device_ids(its)		(FIELD_GET(GITS_TYPER_DEVBITS, (its)->typer) + 1)
@@ -2778,6 +2780,7 @@ static u64 inherit_vpe_l1_table_from_its(void)
 		}
 		val |=3D FIELD_PREP(GICR_VPROPBASER_4_1_SIZE, GITS_BASER_NR_PAGES(baser) -=
 1);
=20
+		*this_cpu_ptr(&local_4_1_its) =3D its;
 		return val;
 	}
=20
@@ -2815,6 +2818,7 @@ static u64 inherit_vpe_l1_table_from_rd(cpumask_t **mas=
k)
 		gic_data_rdist()->vpe_l1_base =3D gic_data_rdist_cpu(cpu)->vpe_l1_base;
 		*mask =3D gic_data_rdist_cpu(cpu)->vpe_table_mask;
=20
+		*this_cpu_ptr(&local_4_1_its) =3D *per_cpu_ptr(&local_4_1_its, cpu);
 		return val;
 	}
=20
@@ -4180,7 +4184,7 @@ static struct irq_chip its_vpe_irq_chip =3D {
=20
 static struct its_node *find_4_1_its(void)
 {
-	static struct its_node *its =3D NULL;
+	struct its_node *its =3D *this_cpu_ptr(&local_4_1_its);
=20
 	if (!its) {
 		list_for_each_entry(its, &its_nodes, entry) {
diff --git a/drivers/irqchip/irq-ingenic-tcu.c b/drivers/irqchip/irq-ingenic-=
tcu.c
index 3363f83bd7e9..945fd57bcc73 100644
--- a/drivers/irqchip/irq-ingenic-tcu.c
+++ b/drivers/irqchip/irq-ingenic-tcu.c
@@ -52,11 +52,10 @@ static void ingenic_tcu_gc_unmask_enable_reg(struct irq_d=
ata *d)
 	struct regmap *map =3D gc->private;
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	regmap_write(map, ct->regs.ack, mask);
 	regmap_write(map, ct->regs.enable, mask);
 	*ct->mask_cache |=3D mask;
-	irq_gc_unlock(gc);
 }
=20
 static void ingenic_tcu_gc_mask_disable_reg(struct irq_data *d)
@@ -66,10 +65,9 @@ static void ingenic_tcu_gc_mask_disable_reg(struct irq_dat=
a *d)
 	struct regmap *map =3D gc->private;
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	regmap_write(map, ct->regs.disable, mask);
 	*ct->mask_cache &=3D ~mask;
-	irq_gc_unlock(gc);
 }
=20
 static void ingenic_tcu_gc_mask_disable_reg_and_ack(struct irq_data *d)
@@ -79,10 +77,9 @@ static void ingenic_tcu_gc_mask_disable_reg_and_ack(struct=
 irq_data *d)
 	struct regmap *map =3D gc->private;
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	regmap_write(map, ct->regs.ack, mask);
 	regmap_write(map, ct->regs.disable, mask);
-	irq_gc_unlock(gc);
 }
=20
 static int __init ingenic_tcu_irq_init(struct device_node *np,
diff --git a/drivers/irqchip/irq-lan966x-oic.c b/drivers/irqchip/irq-lan966x-=
oic.c
index 41ac880e3b87..f77bd2a2e5e5 100644
--- a/drivers/irqchip/irq-lan966x-oic.c
+++ b/drivers/irqchip/irq-lan966x-oic.c
@@ -71,14 +71,12 @@ static unsigned int lan966x_oic_irq_startup(struct irq_da=
ta *data)
 	struct lan966x_oic_chip_regs *chip_regs =3D gc->private;
 	u32 map;
=20
-	irq_gc_lock(gc);
-
-	/* Map the source interrupt to the destination */
-	map =3D irq_reg_readl(gc, chip_regs->reg_off_map);
-	map |=3D data->mask;
-	irq_reg_writel(gc, map, chip_regs->reg_off_map);
-
-	irq_gc_unlock(gc);
+	scoped_guard (raw_spinlock, &gc->lock) {
+		/* Map the source interrupt to the destination */
+		map =3D irq_reg_readl(gc, chip_regs->reg_off_map);
+		map |=3D data->mask;
+		irq_reg_writel(gc, map, chip_regs->reg_off_map);
+	}
=20
 	ct->chip.irq_ack(data);
 	ct->chip.irq_unmask(data);
@@ -95,14 +93,12 @@ static void lan966x_oic_irq_shutdown(struct irq_data *dat=
a)
=20
 	ct->chip.irq_mask(data);
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
=20
 	/* Unmap the interrupt */
 	map =3D irq_reg_readl(gc, chip_regs->reg_off_map);
 	map &=3D ~data->mask;
 	irq_reg_writel(gc, map, chip_regs->reg_off_map);
-
-	irq_gc_unlock(gc);
 }
=20
 static int lan966x_oic_irq_set_type(struct irq_data *data,
diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loo=
ngson-liointc.c
index 2b1bd4a96665..61c0b479bfe5 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -116,9 +116,8 @@ static int liointc_set_type(struct irq_data *data, unsign=
ed int type)
 {
 	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
 	u32 mask =3D data->mask;
-	unsigned long flags;
=20
-	irq_gc_lock_irqsave(gc, flags);
+	guard(raw_spinlock)(&gc->lock);
 	switch (type) {
 	case IRQ_TYPE_LEVEL_HIGH:
 		liointc_set_bit(gc, LIOINTC_REG_INTC_EDGE, mask, false);
@@ -137,10 +136,8 @@ static int liointc_set_type(struct irq_data *data, unsig=
ned int type)
 		liointc_set_bit(gc, LIOINTC_REG_INTC_POL, mask, true);
 		break;
 	default:
-		irq_gc_unlock_irqrestore(gc, flags);
 		return -EINVAL;
 	}
-	irq_gc_unlock_irqrestore(gc, flags);
=20
 	irqd_set_trigger_type(data, type);
 	return 0;
@@ -157,10 +154,9 @@ static void liointc_suspend(struct irq_chip_generic *gc)
 static void liointc_resume(struct irq_chip_generic *gc)
 {
 	struct liointc_priv *priv =3D gc->private;
-	unsigned long flags;
 	int i;
=20
-	irq_gc_lock_irqsave(gc, flags);
+	guard(raw_spinlock_irqsave)(&gc->lock);
 	/* Disable all at first */
 	writel(0xffffffff, gc->reg_base + LIOINTC_REG_INTC_DISABLE);
 	/* Restore map cache */
@@ -170,7 +166,6 @@ static void liointc_resume(struct irq_chip_generic *gc)
 	writel(priv->int_edge, gc->reg_base + LIOINTC_REG_INTC_EDGE);
 	/* Restore mask cache */
 	writel(gc->mask_cache, gc->reg_base + LIOINTC_REG_INTC_ENABLE);
-	irq_gc_unlock_irqrestore(gc, flags);
 }
=20
 static int parent_irq[LIOINTC_NUM_PARENT];
diff --git a/drivers/irqchip/irq-mscc-ocelot.c b/drivers/irqchip/irq-mscc-oce=
lot.c
index 3dc745b14caf..d69c5f112a7e 100644
--- a/drivers/irqchip/irq-mscc-ocelot.c
+++ b/drivers/irqchip/irq-mscc-ocelot.c
@@ -83,7 +83,7 @@ static void ocelot_irq_unmask(struct irq_data *data)
 	unsigned int mask =3D data->mask;
 	u32 val;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	/*
 	 * Clear sticky bits for edge mode interrupts.
 	 * Serval has only one trigger register replication, but the adjacent
@@ -97,7 +97,6 @@ static void ocelot_irq_unmask(struct irq_data *data)
=20
 	*ct->mask_cache &=3D ~mask;
 	irq_reg_writel(gc, mask, p->reg_off_ena_set);
-	irq_gc_unlock(gc);
 }
=20
 static void ocelot_irq_handler(struct irq_desc *desc)
diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-int=
c.c
index bee01980b463..af7684758049 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -581,8 +581,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
 		host_data->intc =3D intc;
 		host_data->host_irq =3D i;
=20
-		irq_set_handler_data(irq, host_data);
-		irq_set_chained_handler(irq, pruss_intc_irq_handler);
+		irq_set_chained_handler_and_data(irq, pruss_intc_irq_handler, host_data);
 	}
=20
 	return 0;
diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-ms=
i.c
index ee682e87eb8b..a3e2a26d8495 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -19,21 +19,36 @@
=20
 #include "irq-msi-lib.h"
=20
-#define SG2042_MAX_MSI_VECTOR	32
+struct sg204x_msi_chip_info {
+	const struct irq_chip		*irqchip;
+	const struct msi_parent_ops	*parent_ops;
+};
+
+/**
+ * struct sg204x_msi_chipdata - chip data for the SG204x MSI IRQ controller
+ * @reg_clr:		clear reg, see TRM, 10.1.33, GP_INTR0_CLR
+ * @doorbell_addr:	see TRM, 10.1.32, GP_INTR0_SET
+ * @irq_first:		First vectors number that MSIs starts
+ * @num_irqs:		Number of vectors for MSIs
+ * @msi_map:		mapping for allocated MSI vectors.
+ * @msi_map_lock:	Lock for msi_map
+ * @chip_info:		chip specific infomations
+ */
+struct sg204x_msi_chipdata {
+	void __iomem				*reg_clr;
=20
-struct sg2042_msi_chipdata {
-	void __iomem	*reg_clr;	// clear reg, see TRM, 10.1.33, GP_INTR0_CLR
+	phys_addr_t				doorbell_addr;
=20
-	phys_addr_t	doorbell_addr;	// see TRM, 10.1.32, GP_INTR0_SET
+	u32					irq_first;
+	u32					num_irqs;
=20
-	u32		irq_first;	// The vector number that MSIs starts
-	u32		num_irqs;	// The number of vectors for MSIs
+	unsigned long				*msi_map;
+	struct mutex				msi_map_lock;
=20
-	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
-	struct mutex	msi_map_lock;	// lock for msi_map
+	const struct sg204x_msi_chip_info	*chip_info;
 };
=20
-static int sg2042_msi_allocate_hwirq(struct sg2042_msi_chipdata *data, int n=
um_req)
+static int sg204x_msi_allocate_hwirq(struct sg204x_msi_chipdata *data, int n=
um_req)
 {
 	int first;
=20
@@ -43,7 +58,7 @@ static int sg2042_msi_allocate_hwirq(struct sg2042_msi_chip=
data *data, int num_r
 	return first >=3D 0 ? first : -ENOSPC;
 }
=20
-static void sg2042_msi_free_hwirq(struct sg2042_msi_chipdata *data, int hwir=
q, int num_req)
+static void sg204x_msi_free_hwirq(struct sg204x_msi_chipdata *data, int hwir=
q, int num_req)
 {
 	guard(mutex)(&data->msi_map_lock);
 	bitmap_release_region(data->msi_map, hwirq, get_count_order(num_req));
@@ -51,7 +66,7 @@ static void sg2042_msi_free_hwirq(struct sg2042_msi_chipdat=
a *data, int hwirq, i
=20
 static void sg2042_msi_irq_ack(struct irq_data *d)
 {
-	struct sg2042_msi_chipdata *data  =3D irq_data_get_irq_chip_data(d);
+	struct sg204x_msi_chipdata *data  =3D irq_data_get_irq_chip_data(d);
 	int bit_off =3D d->hwirq;
=20
 	writel(1 << bit_off, data->reg_clr);
@@ -61,7 +76,7 @@ static void sg2042_msi_irq_ack(struct irq_data *d)
=20
 static void sg2042_msi_irq_compose_msi_msg(struct irq_data *d, struct msi_ms=
g *msg)
 {
-	struct sg2042_msi_chipdata *data =3D irq_data_get_irq_chip_data(d);
+	struct sg204x_msi_chipdata *data =3D irq_data_get_irq_chip_data(d);
=20
 	msg->address_hi =3D upper_32_bits(data->doorbell_addr);
 	msg->address_lo =3D lower_32_bits(data->doorbell_addr);
@@ -79,9 +94,38 @@ static const struct irq_chip sg2042_msi_middle_irq_chip =
=3D {
 	.irq_compose_msi_msg	=3D sg2042_msi_irq_compose_msi_msg,
 };
=20
-static int sg2042_msi_parent_domain_alloc(struct irq_domain *domain, unsigne=
d int virq, int hwirq)
+static void sg2044_msi_irq_ack(struct irq_data *d)
+{
+	struct sg204x_msi_chipdata *data =3D irq_data_get_irq_chip_data(d);
+
+	writel(0, (u32 __iomem *)data->reg_clr + d->hwirq);
+	irq_chip_ack_parent(d);
+}
+
+static void sg2044_msi_irq_compose_msi_msg(struct irq_data *d, struct msi_ms=
g *msg)
+{
+	struct sg204x_msi_chipdata *data =3D irq_data_get_irq_chip_data(d);
+	phys_addr_t doorbell =3D data->doorbell_addr + 4 * (d->hwirq / 32);
+
+	msg->address_lo =3D lower_32_bits(doorbell);
+	msg->address_hi =3D upper_32_bits(doorbell);
+	msg->data =3D d->hwirq % 32;
+}
+
+static struct irq_chip sg2044_msi_middle_irq_chip =3D {
+	.name			=3D "SG2044 MSI",
+	.irq_ack		=3D sg2044_msi_irq_ack,
+	.irq_mask		=3D irq_chip_mask_parent,
+	.irq_unmask		=3D irq_chip_unmask_parent,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	=3D irq_chip_set_affinity_parent,
+#endif
+	.irq_compose_msi_msg	=3D sg2044_msi_irq_compose_msi_msg,
+};
+
+static int sg204x_msi_parent_domain_alloc(struct irq_domain *domain, unsigne=
d int virq, int hwirq)
 {
-	struct sg2042_msi_chipdata *data =3D domain->host_data;
+	struct sg204x_msi_chipdata *data =3D domain->host_data;
 	struct irq_fwspec fwspec;
 	struct irq_data *d;
 	int ret;
@@ -99,47 +143,45 @@ static int sg2042_msi_parent_domain_alloc(struct irq_dom=
ain *domain, unsigned in
 	return d->chip->irq_set_type(d, IRQ_TYPE_EDGE_RISING);
 }
=20
-static int sg2042_msi_middle_domain_alloc(struct irq_domain *domain, unsigne=
d int virq,
+static int sg204x_msi_middle_domain_alloc(struct irq_domain *domain, unsigne=
d int virq,
 					  unsigned int nr_irqs, void *args)
 {
-	struct sg2042_msi_chipdata *data =3D domain->host_data;
+	struct sg204x_msi_chipdata *data =3D domain->host_data;
 	int hwirq, err, i;
=20
-	hwirq =3D sg2042_msi_allocate_hwirq(data, nr_irqs);
+	hwirq =3D sg204x_msi_allocate_hwirq(data, nr_irqs);
 	if (hwirq < 0)
 		return hwirq;
=20
 	for (i =3D 0; i < nr_irqs; i++) {
-		err =3D sg2042_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
+		err =3D sg204x_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
 		if (err)
 			goto err_hwirq;
=20
 		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
-					      &sg2042_msi_middle_irq_chip, data);
+					      data->chip_info->irqchip, data);
 	}
-
 	return 0;
=20
 err_hwirq:
-	sg2042_msi_free_hwirq(data, hwirq, nr_irqs);
+	sg204x_msi_free_hwirq(data, hwirq, nr_irqs);
 	irq_domain_free_irqs_parent(domain, virq, i);
-
 	return err;
 }
=20
-static void sg2042_msi_middle_domain_free(struct irq_domain *domain, unsigne=
d int virq,
+static void sg204x_msi_middle_domain_free(struct irq_domain *domain, unsigne=
d int virq,
 					  unsigned int nr_irqs)
 {
 	struct irq_data *d =3D irq_domain_get_irq_data(domain, virq);
-	struct sg2042_msi_chipdata *data =3D irq_data_get_irq_chip_data(d);
+	struct sg204x_msi_chipdata *data =3D irq_data_get_irq_chip_data(d);
=20
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
-	sg2042_msi_free_hwirq(data, d->hwirq, nr_irqs);
+	sg204x_msi_free_hwirq(data, d->hwirq, nr_irqs);
 }
=20
-static const struct irq_domain_ops sg2042_msi_middle_domain_ops =3D {
-	.alloc	=3D sg2042_msi_middle_domain_alloc,
-	.free	=3D sg2042_msi_middle_domain_free,
+static const struct irq_domain_ops sg204x_msi_middle_domain_ops =3D {
+	.alloc	=3D sg204x_msi_middle_domain_alloc,
+	.free	=3D sg204x_msi_middle_domain_free,
 	.select	=3D msi_lib_irq_domain_select,
 };
=20
@@ -157,14 +199,30 @@ static const struct msi_parent_ops sg2042_msi_parent_op=
s =3D {
 	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
=20
-static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
+#define SG2044_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS |	\
+				   MSI_FLAG_USE_DEF_CHIP_OPS)
+
+#define SG2044_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK |	\
+				    MSI_FLAG_PCI_MSIX)
+
+static const struct msi_parent_ops sg2044_msi_parent_ops =3D {
+	.required_flags		=3D SG2044_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D SG2044_MSI_FLAGS_SUPPORTED,
+	.chip_flags		=3D MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
+	.bus_select_mask	=3D MATCH_PCI_MSI,
+	.bus_select_token	=3D DOMAIN_BUS_NEXUS,
+	.prefix			=3D "SG2044-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
+};
+
+static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
 				   struct irq_domain *plic_domain, struct device *dev)
 {
 	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
 	struct irq_domain *middle_domain;
=20
 	middle_domain =3D irq_domain_create_hierarchy(plic_domain, 0, data->num_irq=
s, fwnode,
-						    &sg2042_msi_middle_domain_ops, data);
+						    &sg204x_msi_middle_domain_ops, data);
 	if (!middle_domain) {
 		pr_err("Failed to create the MSI middle domain\n");
 		return -ENOMEM;
@@ -173,24 +231,29 @@ static int sg2042_msi_init_domains(struct sg2042_msi_ch=
ipdata *data,
 	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
=20
 	middle_domain->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
-	middle_domain->msi_parent_ops =3D &sg2042_msi_parent_ops;
-
+	middle_domain->msi_parent_ops =3D data->chip_info->parent_ops;
 	return 0;
 }
=20
 static int sg2042_msi_probe(struct platform_device *pdev)
 {
 	struct fwnode_reference_args args =3D { };
-	struct sg2042_msi_chipdata *data;
+	struct sg204x_msi_chipdata *data;
 	struct device *dev =3D &pdev->dev;
 	struct irq_domain *plic_domain;
 	struct resource *res;
 	int ret;
=20
-	data =3D devm_kzalloc(dev, sizeof(struct sg2042_msi_chipdata), GFP_KERNEL);
+	data =3D devm_kzalloc(dev, sizeof(struct sg204x_msi_chipdata), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
=20
+	data->chip_info =3D device_get_match_data(&pdev->dev);
+	if (!data->chip_info) {
+		dev_err(&pdev->dev, "Failed to get irqchip\n");
+		return -EINVAL;
+	}
+
 	data->reg_clr =3D devm_platform_ioremap_resource_byname(pdev, "clr");
 	if (IS_ERR(data->reg_clr)) {
 		dev_err(dev, "Failed to map clear register\n");
@@ -231,11 +294,28 @@ static int sg2042_msi_probe(struct platform_device *pde=
v)
=20
 	mutex_init(&data->msi_map_lock);
=20
-	return sg2042_msi_init_domains(data, plic_domain, dev);
+	data->msi_map =3D devm_bitmap_zalloc(&pdev->dev, data->num_irqs, GFP_KERNEL=
);
+	if (!data->msi_map) {
+		dev_err(&pdev->dev, "Unable to allocate msi mapping\n");
+		return -ENOMEM;
+	}
+
+	return sg204x_msi_init_domains(data, plic_domain, dev);
 }
=20
+static const struct sg204x_msi_chip_info sg2042_chip_info =3D {
+	.irqchip	=3D &sg2042_msi_middle_irq_chip,
+	.parent_ops	=3D &sg2042_msi_parent_ops,
+};
+
+static const struct sg204x_msi_chip_info sg2044_chip_info =3D {
+	.irqchip	=3D &sg2044_msi_middle_irq_chip,
+	.parent_ops	=3D &sg2044_msi_parent_ops,
+};
+
 static const struct of_device_id sg2042_msi_of_match[] =3D {
-	{ .compatible	=3D "sophgo,sg2042-msi" },
+	{ .compatible	=3D "sophgo,sg2042-msi", .data	=3D &sg2042_chip_info },
+	{ .compatible	=3D "sophgo,sg2044-msi", .data	=3D &sg2044_chip_info },
 	{ }
 };
=20
diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-ext=
i.c
index 7c6a0080c330..477046d4db0f 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -169,22 +169,18 @@ static int stm32_irq_set_type(struct irq_data *d, unsig=
ned int type)
 	u32 rtsr, ftsr;
 	int err;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
=20
 	rtsr =3D irq_reg_readl(gc, stm32_bank->rtsr_ofst);
 	ftsr =3D irq_reg_readl(gc, stm32_bank->ftsr_ofst);
=20
 	err =3D stm32_exti_set_type(d, type, &rtsr, &ftsr);
 	if (err)
-		goto unlock;
+		return err;
=20
 	irq_reg_writel(gc, rtsr, stm32_bank->rtsr_ofst);
 	irq_reg_writel(gc, ftsr, stm32_bank->ftsr_ofst);
-
-unlock:
-	irq_gc_unlock(gc);
-
-	return err;
+	return 0;
 }
=20
 static void stm32_chip_suspend(struct stm32_exti_chip_data *chip_data,
@@ -217,18 +213,16 @@ static void stm32_irq_suspend(struct irq_chip_generic *=
gc)
 {
 	struct stm32_exti_chip_data *chip_data =3D gc->private;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	stm32_chip_suspend(chip_data, gc->wake_active);
-	irq_gc_unlock(gc);
 }
=20
 static void stm32_irq_resume(struct irq_chip_generic *gc)
 {
 	struct stm32_exti_chip_data *chip_data =3D gc->private;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	stm32_chip_resume(chip_data, gc->mask_cache);
-	irq_gc_unlock(gc);
 }
=20
 static int stm32_exti_alloc(struct irq_domain *d, unsigned int virq,
@@ -265,11 +259,8 @@ static void stm32_irq_ack(struct irq_data *d)
 	struct stm32_exti_chip_data *chip_data =3D gc->private;
 	const struct stm32_exti_bank *stm32_bank =3D chip_data->reg_bank;
=20
-	irq_gc_lock(gc);
-
+	guard(raw_spinlock)(&gc->lock);
 	irq_reg_writel(gc, d->mask, stm32_bank->rpr_ofst);
-
-	irq_gc_unlock(gc);
 }
=20
 static struct
diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index 01b0d8321728..4c977ac10ddc 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -111,7 +111,7 @@ static int sunxi_sc_nmi_set_type(struct irq_data *data, u=
nsigned int flow_type)
 	unsigned int src_type;
 	unsigned int i;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
=20
 	switch (flow_type & IRQF_TRIGGER_MASK) {
 	case IRQ_TYPE_EDGE_FALLING:
@@ -128,9 +128,7 @@ static int sunxi_sc_nmi_set_type(struct irq_data *data, u=
nsigned int flow_type)
 		src_type =3D SUNXI_SRC_TYPE_LEVEL_LOW;
 		break;
 	default:
-		irq_gc_unlock(gc);
-		pr_err("Cannot assign multiple trigger modes to IRQ %d.\n",
-			data->irq);
+		pr_err("Cannot assign multiple trigger modes to IRQ %d.\n", data->irq);
 		return -EBADR;
 	}
=20
@@ -145,9 +143,6 @@ static int sunxi_sc_nmi_set_type(struct irq_data *data, u=
nsigned int flow_type)
 	src_type_reg &=3D ~SUNXI_NMI_SRC_TYPE_MASK;
 	src_type_reg |=3D src_type;
 	sunxi_sc_nmi_write(gc, ctrl_off, src_type_reg);
-
-	irq_gc_unlock(gc);
-
 	return IRQ_SET_MASK_OK;
 }
=20
diff --git a/drivers/irqchip/irq-tb10x.c b/drivers/irqchip/irq-tb10x.c
index d59bfbe8c6d0..aa80944695e6 100644
--- a/drivers/irqchip/irq-tb10x.c
+++ b/drivers/irqchip/irq-tb10x.c
@@ -41,11 +41,9 @@ static inline u32 ab_irqctl_readreg(struct irq_chip_generi=
c *gc, u32 reg)
 static int tb10x_irq_set_type(struct irq_data *data, unsigned int flow_type)
 {
 	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
-	uint32_t im, mod, pol;
+	uint32_t mod, pol, im =3D data->mask;
=20
-	im =3D data->mask;
-
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
=20
 	mod =3D ab_irqctl_readreg(gc, AB_IRQCTL_SRC_MODE) | im;
 	pol =3D ab_irqctl_readreg(gc, AB_IRQCTL_SRC_POLARITY) | im;
@@ -67,9 +65,7 @@ static int tb10x_irq_set_type(struct irq_data *data, unsign=
ed int flow_type)
 	case IRQ_TYPE_EDGE_RISING:
 		break;
 	default:
-		irq_gc_unlock(gc);
-		pr_err("%s: Cannot assign multiple trigger modes to IRQ %d.\n",
-			__func__, data->irq);
+		pr_err("%s: Cannot assign multiple trigger modes to IRQ %d.\n",	__func__, =
data->irq);
 		return -EBADR;
 	}
=20
@@ -79,9 +75,6 @@ static int tb10x_irq_set_type(struct irq_data *data, unsign=
ed int flow_type)
 	ab_irqctl_writereg(gc, AB_IRQCTL_SRC_MODE, mod);
 	ab_irqctl_writereg(gc, AB_IRQCTL_SRC_POLARITY, pol);
 	ab_irqctl_writereg(gc, AB_IRQCTL_INT_STATUS, im);
-
-	irq_gc_unlock(gc);
-
 	return IRQ_SET_MASK_OK;
 }
=20
diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index e17dd3a8c2d5..3b742590aec8 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
@@ -63,29 +64,28 @@ struct vt8500_irq_data {
 	struct irq_domain	*domain;	/* Domain for this controller */
 };
=20
-/* Global variable for accessing io-mem addresses */
-static struct vt8500_irq_data intc[VT8500_INTC_MAX];
-static u32 active_cnt =3D 0;
+/* Primary interrupt controller data */
+static struct vt8500_irq_data *primary_intc;
=20
-static void vt8500_irq_mask(struct irq_data *d)
+static void vt8500_irq_ack(struct irq_data *d)
 {
 	struct vt8500_irq_data *priv =3D d->domain->host_data;
 	void __iomem *base =3D priv->base;
 	void __iomem *stat_reg =3D base + VT8500_ICIS + (d->hwirq < 32 ? 0 : 4);
-	u8 edge, dctr;
-	u32 status;
+	u32 status =3D (1 << (d->hwirq & 0x1f));
=20
-	edge =3D readb(base + VT8500_ICDC + d->hwirq) & VT8500_EDGE;
-	if (edge) {
-		status =3D readl(stat_reg);
+	writel(status, stat_reg);
+}
=20
-		status |=3D (1 << (d->hwirq & 0x1f));
-		writel(status, stat_reg);
-	} else {
-		dctr =3D readb(base + VT8500_ICDC + d->hwirq);
-		dctr &=3D ~VT8500_INT_ENABLE;
-		writeb(dctr, base + VT8500_ICDC + d->hwirq);
-	}
+static void vt8500_irq_mask(struct irq_data *d)
+{
+	struct vt8500_irq_data *priv =3D d->domain->host_data;
+	void __iomem *base =3D priv->base;
+	u8 dctr;
+
+	dctr =3D readb(base + VT8500_ICDC + d->hwirq);
+	dctr &=3D ~VT8500_INT_ENABLE;
+	writeb(dctr, base + VT8500_ICDC + d->hwirq);
 }
=20
 static void vt8500_irq_unmask(struct irq_data *d)
@@ -130,11 +130,11 @@ static int vt8500_irq_set_type(struct irq_data *d, unsi=
gned int flow_type)
 }
=20
 static struct irq_chip vt8500_irq_chip =3D {
-	.name =3D "vt8500",
-	.irq_ack =3D vt8500_irq_mask,
-	.irq_mask =3D vt8500_irq_mask,
-	.irq_unmask =3D vt8500_irq_unmask,
-	.irq_set_type =3D vt8500_irq_set_type,
+	.name		=3D "vt8500",
+	.irq_ack	=3D vt8500_irq_ack,
+	.irq_mask	=3D vt8500_irq_mask,
+	.irq_unmask	=3D vt8500_irq_unmask,
+	.irq_set_type	=3D vt8500_irq_set_type,
 };
=20
 static void __init vt8500_init_irq_hw(void __iomem *base)
@@ -163,82 +163,89 @@ static const struct irq_domain_ops vt8500_irq_domain_op=
s =3D {
 	.xlate =3D irq_domain_xlate_onecell,
 };
=20
+static inline void vt8500_handle_irq_common(struct vt8500_irq_data *intc)
+{
+	unsigned long irqnr =3D readl_relaxed(intc->base) & 0x3F;
+	unsigned long stat;
+
+	/*
+	 * Highest Priority register default =3D 63, so check that this
+	 * is a real interrupt by checking the status register
+	 */
+	if (irqnr =3D=3D 63) {
+		stat =3D readl_relaxed(intc->base + VT8500_ICIS + 4);
+		if (!(stat & BIT(31)))
+			return;
+	}
+
+	generic_handle_domain_irq(intc->domain, irqnr);
+}
+
 static void __exception_irq_entry vt8500_handle_irq(struct pt_regs *regs)
 {
-	u32 stat, i;
-	int irqnr;
-	void __iomem *base;
-
-	/* Loop through each active controller */
-	for (i=3D0; i<active_cnt; i++) {
-		base =3D intc[i].base;
-		irqnr =3D readl_relaxed(base) & 0x3F;
-		/*
-		  Highest Priority register default =3D 63, so check that this
-		  is a real interrupt by checking the status register
-		*/
-		if (irqnr =3D=3D 63) {
-			stat =3D readl_relaxed(base + VT8500_ICIS + 4);
-			if (!(stat & BIT(31)))
-				continue;
-		}
+	vt8500_handle_irq_common(primary_intc);
+}
=20
-		generic_handle_domain_irq(intc[i].domain, irqnr);
-	}
+static void vt8500_handle_irq_chained(struct irq_desc *desc)
+{
+	struct irq_domain *d =3D irq_desc_get_handler_data(desc);
+	struct irq_chip *chip =3D irq_desc_get_chip(desc);
+	struct vt8500_irq_data *intc =3D d->host_data;
+
+	chained_irq_enter(chip, desc);
+	vt8500_handle_irq_common(intc);
+	chained_irq_exit(chip, desc);
 }
=20
 static int __init vt8500_irq_init(struct device_node *node,
 				  struct device_node *parent)
 {
-	int irq, i;
-	struct device_node *np =3D node;
+	struct vt8500_irq_data *intc;
+	int irq, i, ret =3D 0;
=20
-	if (active_cnt =3D=3D VT8500_INTC_MAX) {
-		pr_err("%s: Interrupt controllers > VT8500_INTC_MAX\n",
-								__func__);
-		goto out;
-	}
+	intc =3D kzalloc(sizeof(*intc), GFP_KERNEL);
+	if (!intc)
+		return -ENOMEM;
=20
-	intc[active_cnt].base =3D of_iomap(np, 0);
-	intc[active_cnt].domain =3D irq_domain_add_linear(node, 64,
-			&vt8500_irq_domain_ops,	&intc[active_cnt]);
-
-	if (!intc[active_cnt].base) {
+	intc->base =3D of_iomap(node, 0);
+	if (!intc->base) {
 		pr_err("%s: Unable to map IO memory\n", __func__);
-		goto out;
+		ret =3D -ENOMEM;
+		goto err_free;
 	}
=20
-	if (!intc[active_cnt].domain) {
+	intc->domain =3D irq_domain_create_linear(of_fwnode_handle(node), 64,
+						&vt8500_irq_domain_ops, intc);
+	if (!intc->domain) {
 		pr_err("%s: Unable to add irq domain!\n", __func__);
-		goto out;
+		ret =3D -ENOMEM;
+		goto err_unmap;
 	}
=20
-	set_handle_irq(vt8500_handle_irq);
-
-	vt8500_init_irq_hw(intc[active_cnt].base);
+	vt8500_init_irq_hw(intc->base);
=20
 	pr_info("vt8500-irq: Added interrupt controller\n");
=20
-	active_cnt++;
-
-	/* check if this is a slaved controller */
-	if (of_irq_count(np) !=3D 0) {
-		/* check that we have the correct number of interrupts */
-		if (of_irq_count(np) !=3D 8) {
-			pr_err("%s: Incorrect IRQ map for slaved controller\n",
-					__func__);
-			return -EINVAL;
-		}
-
-		for (i =3D 0; i < 8; i++) {
-			irq =3D irq_of_parse_and_map(np, i);
-			enable_irq(irq);
+	/* check if this is a chained controller */
+	if (of_irq_count(node) !=3D 0) {
+		for (i =3D 0; i < of_irq_count(node); i++) {
+			irq =3D irq_of_parse_and_map(node, i);
+			irq_set_chained_handler_and_data(irq, vt8500_handle_irq_chained,
+							 intc);
 		}
=20
 		pr_info("vt8500-irq: Enabled slave->parent interrupts\n");
+	} else {
+		primary_intc =3D intc;
+		set_handle_irq(vt8500_handle_irq);
 	}
-out:
 	return 0;
+
+err_unmap:
+	iounmap(intc->base);
+err_free:
+	kfree(intc);
+	return ret;
 }
=20
 IRQCHIP_DECLARE(vt8500_irq, "via,vt8500-intc", vt8500_irq_init);
diff --git a/drivers/soc/dove/pmu.c b/drivers/soc/dove/pmu.c
index 6202dbcd20a8..795802bb3e7d 100644
--- a/drivers/soc/dove/pmu.c
+++ b/drivers/soc/dove/pmu.c
@@ -257,10 +257,9 @@ static void pmu_irq_handler(struct irq_desc *desc)
 	 * So, let's structure the code so that the window is as small as
 	 * possible.
 	 */
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	done &=3D readl_relaxed(base + PMC_IRQ_CAUSE);
 	writel_relaxed(done, base + PMC_IRQ_CAUSE);
-	irq_gc_unlock(gc);
 }
=20
 static int __init dove_init_pmu_irq(struct pmu_data *pmu, int irq)
diff --git a/include/linux/irq.h b/include/linux/irq.h
index dd5df1e2d032..d896d3a471ec 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1222,31 +1222,6 @@ static inline struct irq_chip_type *irq_data_get_chip_=
type(struct irq_data *d)
=20
 #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
=20
-#ifdef CONFIG_SMP
-static inline void irq_gc_lock(struct irq_chip_generic *gc)
-{
-	raw_spin_lock(&gc->lock);
-}
-
-static inline void irq_gc_unlock(struct irq_chip_generic *gc)
-{
-	raw_spin_unlock(&gc->lock);
-}
-#else
-static inline void irq_gc_lock(struct irq_chip_generic *gc) { }
-static inline void irq_gc_unlock(struct irq_chip_generic *gc) { }
-#endif
-
-/*
- * The irqsave variants are for usage in non interrupt code. Do not use
- * them in irq_chip callbacks. Use irq_gc_lock() instead.
- */
-#define irq_gc_lock_irqsave(gc, flags)	\
-	raw_spin_lock_irqsave(&(gc)->lock, flags)
-
-#define irq_gc_unlock_irqrestore(gc, flags)	\
-	raw_spin_unlock_irqrestore(&(gc)->lock, flags)
-
 static inline void irq_reg_writel(struct irq_chip_generic *gc,
 				  u32 val, int reg_offset)
 {
diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index c4a8bca5f2b0..bf59e37d650a 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -40,10 +40,9 @@ void irq_gc_mask_disable_reg(struct irq_data *d)
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	irq_reg_writel(gc, mask, ct->regs.disable);
 	*ct->mask_cache &=3D ~mask;
-	irq_gc_unlock(gc);
 }
 EXPORT_SYMBOL_GPL(irq_gc_mask_disable_reg);
=20
@@ -60,10 +59,9 @@ void irq_gc_mask_set_bit(struct irq_data *d)
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	*ct->mask_cache |=3D mask;
 	irq_reg_writel(gc, *ct->mask_cache, ct->regs.mask);
-	irq_gc_unlock(gc);
 }
 EXPORT_SYMBOL_GPL(irq_gc_mask_set_bit);
=20
@@ -80,10 +78,9 @@ void irq_gc_mask_clr_bit(struct irq_data *d)
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	*ct->mask_cache &=3D ~mask;
 	irq_reg_writel(gc, *ct->mask_cache, ct->regs.mask);
-	irq_gc_unlock(gc);
 }
 EXPORT_SYMBOL_GPL(irq_gc_mask_clr_bit);
=20
@@ -100,10 +97,9 @@ void irq_gc_unmask_enable_reg(struct irq_data *d)
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	irq_reg_writel(gc, mask, ct->regs.enable);
 	*ct->mask_cache |=3D mask;
-	irq_gc_unlock(gc);
 }
 EXPORT_SYMBOL_GPL(irq_gc_unmask_enable_reg);
=20
@@ -117,9 +113,8 @@ void irq_gc_ack_set_bit(struct irq_data *d)
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	irq_reg_writel(gc, mask, ct->regs.ack);
-	irq_gc_unlock(gc);
 }
 EXPORT_SYMBOL_GPL(irq_gc_ack_set_bit);
=20
@@ -133,9 +128,8 @@ void irq_gc_ack_clr_bit(struct irq_data *d)
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	u32 mask =3D ~d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	irq_reg_writel(gc, mask, ct->regs.ack);
-	irq_gc_unlock(gc);
 }
=20
 /**
@@ -156,11 +150,10 @@ void irq_gc_mask_disable_and_ack_set(struct irq_data *d)
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	irq_reg_writel(gc, mask, ct->regs.disable);
 	*ct->mask_cache &=3D ~mask;
 	irq_reg_writel(gc, mask, ct->regs.ack);
-	irq_gc_unlock(gc);
 }
 EXPORT_SYMBOL_GPL(irq_gc_mask_disable_and_ack_set);
=20
@@ -174,9 +167,8 @@ void irq_gc_eoi(struct irq_data *d)
 	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
 	u32 mask =3D d->mask;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	irq_reg_writel(gc, mask, ct->regs.eoi);
-	irq_gc_unlock(gc);
 }
=20
 /**
@@ -196,12 +188,11 @@ int irq_gc_set_wake(struct irq_data *d, unsigned int on)
 	if (!(mask & gc->wake_enabled))
 		return -EINVAL;
=20
-	irq_gc_lock(gc);
+	guard(raw_spinlock)(&gc->lock);
 	if (on)
 		gc->wake_active |=3D mask;
 	else
 		gc->wake_active &=3D ~mask;
-	irq_gc_unlock(gc);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(irq_gc_set_wake);
@@ -288,7 +279,6 @@ int irq_domain_alloc_generic_chips(struct irq_domain *d,
 {
 	struct irq_domain_chip_generic *dgc;
 	struct irq_chip_generic *gc;
-	unsigned long flags;
 	int numchips, i;
 	size_t dgc_sz;
 	size_t gc_sz;
@@ -340,9 +330,8 @@ int irq_domain_alloc_generic_chips(struct irq_domain *d,
 				goto err;
 		}
=20
-		raw_spin_lock_irqsave(&gc_lock, flags);
-		list_add_tail(&gc->list, &gc_list);
-		raw_spin_unlock_irqrestore(&gc_lock, flags);
+		scoped_guard (raw_spinlock_irqsave, &gc_lock)
+			list_add_tail(&gc->list, &gc_list);
 		/* Calc pointer to the next generic chip */
 		tmp +=3D gc_sz;
 	}
@@ -459,7 +448,6 @@ int irq_map_generic_chip(struct irq_domain *d, unsigned i=
nt virq,
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
 	struct irq_chip *chip;
-	unsigned long flags;
 	int idx;
=20
 	gc =3D __irq_get_domain_generic_chip(d, hw_irq);
@@ -479,9 +467,8 @@ int irq_map_generic_chip(struct irq_domain *d, unsigned i=
nt virq,
=20
 	/* We only init the cache for the first mapping of a generic chip */
 	if (!gc->installed) {
-		raw_spin_lock_irqsave(&gc->lock, flags);
+		guard(raw_spinlock_irqsave)(&gc->lock);
 		irq_gc_init_mask_cache(gc, dgc->gc_flags);
-		raw_spin_unlock_irqrestore(&gc->lock, flags);
 	}
=20
 	/* Mark the interrupt as installed */
@@ -548,9 +535,8 @@ void irq_setup_generic_chip(struct irq_chip_generic *gc, =
u32 msk,
 	struct irq_chip *chip =3D &ct->chip;
 	unsigned int i;
=20
-	raw_spin_lock(&gc_lock);
-	list_add_tail(&gc->list, &gc_list);
-	raw_spin_unlock(&gc_lock);
+	scoped_guard (raw_spinlock, &gc_lock)
+		list_add_tail(&gc->list, &gc_list);
=20
 	irq_gc_init_mask_cache(gc, flags);
=20
@@ -616,9 +602,8 @@ void irq_remove_generic_chip(struct irq_chip_generic *gc,=
 u32 msk,
 {
 	unsigned int i, virq;
=20
-	raw_spin_lock(&gc_lock);
-	list_del(&gc->list);
-	raw_spin_unlock(&gc_lock);
+	scoped_guard (raw_spinlock, &gc_lock)
+		list_del(&gc->list);
=20
 	for (i =3D 0; msk; msk >>=3D 1, i++) {
 		if (!(msk & 0x01))

