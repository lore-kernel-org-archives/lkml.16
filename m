Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4C11A5BB5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743936389; cv=none; b=P5uVgylQm0joUwnYcaIBUlGphqToVNKLJVw7XY//wbPd7UZWT4VYXkdcrI96jfGVOabydjMJ7Unzq22OJ21OTpquZeAt8Iy0SgNZylyzhOuJTBKRVXjj/e14NhrBJR98mfNIaxQWXSzKXnHt/jPOl1TCVpDxs4ziq0hSTtEgpLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743936389; c=relaxed/simple;
	bh=mGMk6bOhI7CMmJOYmX0ZDsIfY4Sp0WdyjXav2Mc9RsY=;
	h=From:To:Cc:Subject:Message-ID:Content-Type:MIME-Version:Date; b=Z5NH/sSEeK7OOkRjHWyKglHvKJX1OyrBh73MmsFu3oyn5ud4HVv/aat5ZXfKELReIfWUBAXzZSPd22CdcYD7yRgVc3p1eF03vfHur8q7GADqXnMutNM5QzOgrjhcNGTezbHdGNDN8damFGDlT/ZWgeHKh+5KF4+sQ24lyiXFBJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kA3bo5AS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Al/7vsoR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kA3bo5AS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Al/7vsoR"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743936385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1572ckvGu5qVDzx74VZMVtlvRmBbQGawnbFqMF4OWjQ=;
	b=kA3bo5AS56D+PhWJQCSxhBx7tUklK93zRlyItEVaq7Bc9kZIVF0lQM7J9kkQiYHOoj+UZZ
	T47luHWVVttBRLhGG6SyiDs1THu0HKCh6DR7gRNaC62dT0oYK5Lxe5CdPhGEMqqgkHHmDb
	2YV2FXZcAU4k12rg7HcoGRoi89dIH7YLApEhnl966hTYWMbqgTOebv3AzSxR/uqHpUiBdS
	FaUgPXxYp6cWCiRyOIJJTKUOmSvR6xN2xt59j0hluj7PPWZiaquIBFBVF+l6s5aXq+edKt
	2PszeuwBOhdsxqjC5mxTII3PdsPEQagAnXTSunOECwUQEYQUQkCPVl5P6o/eJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743936385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1572ckvGu5qVDzx74VZMVtlvRmBbQGawnbFqMF4OWjQ=;
	b=Al/7vsoRWSLwgpSeq3S8Tno23igXPGwGiPK4ht5QPiFr+izXGSimCacFZsONBucij+ID1n
	8SaMCRagN0kvEkAg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] irq/urgent for 6.15-rc1
Message-ID: <174393636520.2344834.9509649399595861197.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun,  6 Apr 2025 12:46:24 +0200 (CEST)

Linus,

please pull the latest irq/urgent branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-=
04-06

up to:  9b305678c55d: genirq/migration: Use irqd_get_parent_data() in irq_for=
ce_complete_move()


A set of updates for the interrupt subsystem:

  1) A treewide cleanup for the irq_domain code, which makes the naming
     consistent and gets rid of the original oddity of naming domains
     'host'.

     This is a trivial mechanical change and is done late to ensure that
     all instances have been catched and new code merged post rc1 wont
     reintroduce new instances.

  2) A trivial consistency fix in the migration code

     The recent introduction of irq_force_complete_move() in the core
     code, causes a problem for the nostalgia crowd who maintains ia64 out
     of tree.

     The code assumes that hierarchical interrupt domains are enabled and
     dereferences irq_data::parent_data unconditionally. That works in mainli=
ne
     because both architectures which enable that code have hierarchical doma=
ins
     enabled. Though it breaks the ia64 build, which enables the functionalit=
y,
     but does not have hierarchical domains.
   =20
     While it's not really a problem for mainline today, this
     unconditional dereference is inconsistent and trivially fixable by
     using the existing helper function irqd_get_parent_data(), which has
     the appropriate #ifdeffery in place.

Thanks,

	tglx

------------------>
Jiri Slaby (SUSE) (3):
      irqdomain: Rename irq_set_default_host() to irq_set_default_domain()
      irqdomain: Rename irq_get_default_host() to irq_get_default_domain()
      irqdomain: Stop using 'host' for domain

Thomas Gleixner (1):
      genirq/migration: Use irqd_get_parent_data() in irq_force_complete_move=
()


 arch/arc/kernel/intc-arcv2.c                     |  2 +-
 arch/arc/kernel/intc-compact.c                   |  2 +-
 arch/arm/mach-pxa/irq.c                          |  2 +-
 arch/mips/cavium-octeon/octeon-irq.c             |  6 +++---
 arch/mips/pci/pci-xtalk-bridge.c                 |  2 +-
 arch/mips/sgi-ip27/ip27-irq.c                    |  2 +-
 arch/mips/sgi-ip30/ip30-irq.c                    |  2 +-
 arch/nios2/kernel/irq.c                          |  2 +-
 arch/powerpc/kvm/book3s_hv.c                     |  2 +-
 arch/powerpc/kvm/book3s_xive.c                   |  2 +-
 arch/powerpc/platforms/44x/uic.c                 |  2 +-
 arch/powerpc/platforms/52xx/mpc52xx_pic.c        |  2 +-
 arch/powerpc/platforms/amigaone/setup.c          |  2 +-
 arch/powerpc/platforms/chrp/setup.c              |  2 +-
 arch/powerpc/platforms/embedded6xx/flipper-pic.c |  2 +-
 arch/powerpc/platforms/pasemi/setup.c            |  2 +-
 arch/powerpc/platforms/powermac/pic.c            |  2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c        |  2 +-
 arch/powerpc/platforms/ps3/interrupt.c           |  2 +-
 arch/powerpc/platforms/pseries/msi.c             |  2 +-
 arch/powerpc/sysdev/ehv_pic.c                    |  2 +-
 arch/powerpc/sysdev/ipic.c                       |  2 +-
 arch/powerpc/sysdev/mpic.c                       |  2 +-
 arch/powerpc/sysdev/xics/xics-common.c           |  2 +-
 arch/powerpc/sysdev/xive/common.c                |  2 +-
 arch/x86/kernel/apic/vector.c                    |  2 +-
 drivers/irqchip/irq-armada-370-xp.c              |  6 +++---
 drivers/irqchip/irq-clps711x.c                   |  2 +-
 drivers/irqchip/irq-imx-gpcv2.c                  |  2 +-
 drivers/irqchip/irq-pic32-evic.c                 |  2 +-
 drivers/irqchip/irq-xilinx-intc.c                |  2 +-
 drivers/irqchip/irq-xtensa-mx.c                  |  2 +-
 drivers/irqchip/irq-xtensa-pic.c                 |  4 ++--
 include/linux/irqdomain.h                        | 16 ++++++++--------
 kernel/irq/irqdomain.c                           | 14 +++++++-------
 kernel/irq/migration.c                           |  2 +-
 36 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index f324f0e3341a..fea29d9d18d6 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -178,7 +178,7 @@ init_onchip_IRQ(struct device_node *intc, struct device_n=
ode *parent)
 	 * Needed for primary domain lookup to succeed
 	 * This is a primary irqchip, and can never have a parent
 	 */
-	irq_set_default_host(root_domain);
+	irq_set_default_domain(root_domain);
=20
 #ifdef CONFIG_SMP
 	irq_create_mapping(root_domain, IPI_IRQ);
diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index 6885e422870e..1d2ff1c6a61b 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -121,7 +121,7 @@ init_onchip_IRQ(struct device_node *intc, struct device_n=
ode *parent)
 	 * Needed for primary domain lookup to succeed
 	 * This is a primary irqchip, and can never have a parent
 	 */
-	irq_set_default_host(root_domain);
+	irq_set_default_domain(root_domain);
=20
 	return 0;
 }
diff --git a/arch/arm/mach-pxa/irq.c b/arch/arm/mach-pxa/irq.c
index a9ef71008147..d9cadd97748a 100644
--- a/arch/arm/mach-pxa/irq.c
+++ b/arch/arm/mach-pxa/irq.c
@@ -152,7 +152,7 @@ pxa_init_irq_common(struct device_node *node, int irq_nr,
 					       &pxa_irq_ops, NULL);
 	if (!pxa_irq_domain)
 		panic("Unable to add PXA IRQ domain\n");
-	irq_set_default_host(pxa_irq_domain);
+	irq_set_default_domain(pxa_irq_domain);
=20
 	for (n =3D 0; n < irq_nr; n +=3D 32) {
 		void __iomem *base =3D irq_base(n >> 5);
diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/o=
cteon-irq.c
index 8425a6b38aa2..e6b4d9c0c169 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -1505,7 +1505,7 @@ static int __init octeon_irq_init_ciu(
=20
 	ciu_domain =3D irq_domain_add_tree(
 		ciu_node, &octeon_irq_domain_ciu_ops, dd);
-	irq_set_default_host(ciu_domain);
+	irq_set_default_domain(ciu_domain);
=20
 	/* CIU_0 */
 	for (i =3D 0; i < 16; i++) {
@@ -2076,7 +2076,7 @@ static int __init octeon_irq_init_ciu2(
=20
 	ciu_domain =3D irq_domain_add_tree(
 		ciu_node, &octeon_irq_domain_ciu2_ops, NULL);
-	irq_set_default_host(ciu_domain);
+	irq_set_default_domain(ciu_domain);
=20
 	/* CUI2 */
 	for (i =3D 0; i < 64; i++) {
@@ -2929,7 +2929,7 @@ static int __init octeon_irq_init_ciu3(struct device_no=
de *ciu_node,
 		/* Only do per CPU things if it is the CIU of the boot node. */
 		octeon_irq_ciu3_alloc_resources(ciu3_info);
 		if (node =3D=3D 0)
-			irq_set_default_host(domain);
+			irq_set_default_domain(domain);
=20
 		octeon_irq_use_ip4 =3D false;
 		/* Enable the CIU lines */
diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridg=
e.c
index dae856fb3e5b..e00c38620d14 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -620,7 +620,7 @@ static int bridge_probe(struct platform_device *pdev)
 	if (bridge_get_partnum(virt_to_phys((void *)bd->bridge_addr), partnum))
 		return -EPROBE_DEFER; /* not available yet */
=20
-	parent =3D irq_get_default_host();
+	parent =3D irq_get_default_domain();
 	if (!parent)
 		return -ENODEV;
 	fn =3D irq_domain_alloc_named_fwnode("BRIDGE");
diff --git a/arch/mips/sgi-ip27/ip27-irq.c b/arch/mips/sgi-ip27/ip27-irq.c
index 00e63e9ef61d..288d4d17eddd 100644
--- a/arch/mips/sgi-ip27/ip27-irq.c
+++ b/arch/mips/sgi-ip27/ip27-irq.c
@@ -297,7 +297,7 @@ void __init arch_init_irq(void)
 	if (WARN_ON(domain =3D=3D NULL))
 		return;
=20
-	irq_set_default_host(domain);
+	irq_set_default_domain(domain);
=20
 	irq_set_percpu_devid(IP27_HUB_PEND0_IRQ);
 	irq_set_chained_handler_and_data(IP27_HUB_PEND0_IRQ, ip27_do_irq_mask0,
diff --git a/arch/mips/sgi-ip30/ip30-irq.c b/arch/mips/sgi-ip30/ip30-irq.c
index 423c32cb66ed..9fb905e2cf14 100644
--- a/arch/mips/sgi-ip30/ip30-irq.c
+++ b/arch/mips/sgi-ip30/ip30-irq.c
@@ -313,7 +313,7 @@ void __init arch_init_irq(void)
 	if (!domain)
 		return;
=20
-	irq_set_default_host(domain);
+	irq_set_default_domain(domain);
=20
 	irq_set_percpu_devid(IP30_HEART_L0_IRQ);
 	irq_set_chained_handler_and_data(IP30_HEART_L0_IRQ, ip30_normal_irq,
diff --git a/arch/nios2/kernel/irq.c b/arch/nios2/kernel/irq.c
index 6b7890e5f7af..8fa280660051 100644
--- a/arch/nios2/kernel/irq.c
+++ b/arch/nios2/kernel/irq.c
@@ -72,7 +72,7 @@ void __init init_IRQ(void)
 	domain =3D irq_domain_add_linear(node, NIOS2_CPU_NR_IRQS, &irq_ops, NULL);
 	BUG_ON(!domain);
=20
-	irq_set_default_host(domain);
+	irq_set_default_domain(domain);
 	of_node_put(node);
 	/* Load the initial ienable value */
 	ienable =3D RDCTL(CTL_IENABLE);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 86bff159c51e..19f4d298dd17 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -6041,7 +6041,7 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm, int=
 host_irq, int guest_gsi)
 	 * the underlying calls, which will EOI the interrupt in real
 	 * mode, need an HW IRQ number mapped in the XICS IRQ domain.
 	 */
-	host_data =3D irq_domain_get_irq_data(irq_get_default_host(), host_irq);
+	host_data =3D irq_domain_get_irq_data(irq_get_default_domain(), host_irq);
 	irq_map->r_hwirq =3D (unsigned int)irqd_to_hwirq(host_data);
=20
 	if (i =3D=3D pimap->n_mapped)
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 1362c672387e..1302b5ac5672 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -1555,7 +1555,7 @@ int kvmppc_xive_set_mapped(struct kvm *kvm, unsigned lo=
ng guest_irq,
 	struct kvmppc_xive_src_block *sb;
 	struct kvmppc_xive_irq_state *state;
 	struct irq_data *host_data =3D
-		irq_domain_get_irq_data(irq_get_default_host(), host_irq);
+		irq_domain_get_irq_data(irq_get_default_domain(), host_irq);
 	unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(host_data);
 	u16 idx;
 	u8 prio;
diff --git a/arch/powerpc/platforms/44x/uic.c b/arch/powerpc/platforms/44x/ui=
c.c
index 8b03ae4cb3f6..31f760c2ec5d 100644
--- a/arch/powerpc/platforms/44x/uic.c
+++ b/arch/powerpc/platforms/44x/uic.c
@@ -291,7 +291,7 @@ void __init uic_init_tree(void)
 	if (!primary_uic)
 		panic("Unable to initialize primary UIC %pOF\n", np);
=20
-	irq_set_default_host(primary_uic->irqhost);
+	irq_set_default_domain(primary_uic->irqhost);
 	of_node_put(np);
=20
 	/* The scan again for cascaded UICs */
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pic.c b/arch/powerpc/platfor=
ms/52xx/mpc52xx_pic.c
index 1e0a5e9644dc..43c881d31ca6 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_pic.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_pic.c
@@ -453,7 +453,7 @@ void __init mpc52xx_init_irq(void)
 	if (!mpc52xx_irqhost)
 		panic(__FILE__ ": Cannot allocate the IRQ host\n");
=20
-	irq_set_default_host(mpc52xx_irqhost);
+	irq_set_default_domain(mpc52xx_irqhost);
=20
 	pr_info("MPC52xx PIC is up and running!\n");
 }
diff --git a/arch/powerpc/platforms/amigaone/setup.c b/arch/powerpc/platforms=
/amigaone/setup.c
index 2c8dc0886912..33f852a7625f 100644
--- a/arch/powerpc/platforms/amigaone/setup.c
+++ b/arch/powerpc/platforms/amigaone/setup.c
@@ -109,7 +109,7 @@ static void __init amigaone_init_IRQ(void)
=20
 	i8259_init(pic, int_ack);
 	ppc_md.get_irq =3D i8259_irq;
-	irq_set_default_host(i8259_get_host());
+	irq_set_default_domain(i8259_get_host());
 }
=20
 static int __init request_isa_regions(void)
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chr=
p/setup.c
index 36ee3a5056a1..c1bfa4c3444c 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -486,7 +486,7 @@ static void __init chrp_find_8259(void)
 	i8259_init(pic, chrp_int_ack);
 	if (ppc_md.get_irq =3D=3D NULL) {
 		ppc_md.get_irq =3D i8259_irq;
-		irq_set_default_host(i8259_get_host());
+		irq_set_default_domain(i8259_get_host());
 	}
 	if (chrp_mpic !=3D NULL) {
 		cascade_irq =3D irq_of_parse_and_map(pic, 0);
diff --git a/arch/powerpc/platforms/embedded6xx/flipper-pic.c b/arch/powerpc/=
platforms/embedded6xx/flipper-pic.c
index 4d9200bdba78..013d66304c31 100644
--- a/arch/powerpc/platforms/embedded6xx/flipper-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
@@ -190,7 +190,7 @@ void __init flipper_pic_probe(void)
 	flipper_irq_host =3D flipper_pic_init(np);
 	BUG_ON(!flipper_irq_host);
=20
-	irq_set_default_host(flipper_irq_host);
+	irq_set_default_domain(flipper_irq_host);
=20
 	of_node_put(np);
 }
diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/p=
asemi/setup.c
index 0761d98e5be3..d03b41336901 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -228,7 +228,7 @@ static void __init nemo_init_IRQ(struct mpic *mpic)
 	irq_set_chained_handler(gpio_virq, sb600_8259_cascade);
 	mpic_unmask_irq(irq_get_irq_data(gpio_virq));
=20
-	irq_set_default_host(mpic->irqhost);
+	irq_set_default_domain(mpic->irqhost);
 }
=20
 #else
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/p=
owermac/pic.c
index 2202bf77c7a3..03a7c51f2645 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -330,7 +330,7 @@ static void __init pmac_pic_probe_oldstyle(void)
 	pmac_pic_host =3D irq_domain_add_linear(master, max_irqs,
 					      &pmac_pic_host_ops, NULL);
 	BUG_ON(pmac_pic_host =3D=3D NULL);
-	irq_set_default_host(pmac_pic_host);
+	irq_set_default_domain(pmac_pic_host);
=20
 	/* Get addresses of first controller if we have a node for it */
 	BUG_ON(of_address_to_resource(master, 0, &r));
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platfor=
ms/powernv/pci-ioda.c
index d2a8e0287811..ae4b549b5ca0 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1881,7 +1881,7 @@ static const struct irq_domain_ops pnv_irq_domain_ops =
=3D {
 static int __init pnv_msi_allocate_domains(struct pci_controller *hose, unsi=
gned int count)
 {
 	struct pnv_phb *phb =3D hose->private_data;
-	struct irq_domain *parent =3D irq_get_default_host();
+	struct irq_domain *parent =3D irq_get_default_domain();
=20
 	hose->fwnode =3D irq_domain_alloc_named_id_fwnode("PNV-MSI", phb->opal_id);
 	if (!hose->fwnode)
diff --git a/arch/powerpc/platforms/ps3/interrupt.c b/arch/powerpc/platforms/=
ps3/interrupt.c
index af3fe9f04f24..95e96bd61a20 100644
--- a/arch/powerpc/platforms/ps3/interrupt.c
+++ b/arch/powerpc/platforms/ps3/interrupt.c
@@ -744,7 +744,7 @@ void __init ps3_init_IRQ(void)
 	struct irq_domain *host;
=20
 	host =3D irq_domain_add_nomap(NULL, PS3_PLUG_MAX + 1, &ps3_host_ops, NULL);
-	irq_set_default_host(host);
+	irq_set_default_domain(host);
=20
 	for_each_possible_cpu(cpu) {
 		struct ps3_private *pd =3D &per_cpu(ps3_private, cpu);
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/ps=
eries/msi.c
index fdc2f7f38dc9..f9d80111c322 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -611,7 +611,7 @@ static const struct irq_domain_ops pseries_irq_domain_ops=
 =3D {
 static int __pseries_msi_allocate_domains(struct pci_controller *phb,
 					  unsigned int count)
 {
-	struct irq_domain *parent =3D irq_get_default_host();
+	struct irq_domain *parent =3D irq_get_default_domain();
=20
 	phb->fwnode =3D irq_domain_alloc_named_id_fwnode("pSeries-MSI",
 						       phb->global_number);
diff --git a/arch/powerpc/sysdev/ehv_pic.c b/arch/powerpc/sysdev/ehv_pic.c
index 040827671d21..fb502b72fca1 100644
--- a/arch/powerpc/sysdev/ehv_pic.c
+++ b/arch/powerpc/sysdev/ehv_pic.c
@@ -291,5 +291,5 @@ void __init ehv_pic_init(void)
 	ehv_pic->coreint_flag =3D of_property_read_bool(np, "has-external-proxy");
=20
 	global_ehv_pic =3D ehv_pic;
-	irq_set_default_host(global_ehv_pic->irqhost);
+	irq_set_default_domain(global_ehv_pic->irqhost);
 }
diff --git a/arch/powerpc/sysdev/ipic.c b/arch/powerpc/sysdev/ipic.c
index 037b04bf9a9f..a35be0232978 100644
--- a/arch/powerpc/sysdev/ipic.c
+++ b/arch/powerpc/sysdev/ipic.c
@@ -757,7 +757,7 @@ struct ipic * __init ipic_init(struct device_node *node, =
unsigned int flags)
 	ipic_write(ipic->regs, IPIC_SEMSR, temp);
=20
 	primary_ipic =3D ipic;
-	irq_set_default_host(primary_ipic->irqhost);
+	irq_set_default_domain(primary_ipic->irqhost);
=20
 	ipic_write(ipic->regs, IPIC_SIMSR_H, 0);
 	ipic_write(ipic->regs, IPIC_SIMSR_L, 0);
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index d94cf36b0f65..4afbab83a2e2 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1520,7 +1520,7 @@ struct mpic * __init mpic_alloc(struct device_node *nod=
e,
=20
 	if (!(mpic->flags & MPIC_SECONDARY)) {
 		mpic_primary =3D mpic;
-		irq_set_default_host(mpic->irqhost);
+		irq_set_default_domain(mpic->irqhost);
 	}
=20
 	return mpic;
diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev/xic=
s/xics-common.c
index d3a4156e8788..c3fa539a9898 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -472,7 +472,7 @@ static int __init xics_allocate_domain(void)
 		return -ENOMEM;
 	}
=20
-	irq_set_default_host(xics_host);
+	irq_set_default_domain(xics_host);
 	return 0;
 }
=20
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/com=
mon.c
index a6c388bdf5d0..dc2e61837396 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1467,7 +1467,7 @@ static void __init xive_init_host(struct device_node *n=
p)
 	xive_irq_domain =3D irq_domain_add_tree(np, &xive_irq_domain_ops, NULL);
 	if (WARN_ON(xive_irq_domain =3D=3D NULL))
 		return;
-	irq_set_default_host(xive_irq_domain);
+	irq_set_default_domain(xive_irq_domain);
 }
=20
 static void xive_cleanup_cpu_queues(unsigned int cpu, struct xive_cpu *xc)
diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
index 72fa4bb78f0a..fee42a73d64a 100644
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -799,7 +799,7 @@ int __init arch_early_irq_init(void)
 	x86_vector_domain =3D irq_domain_create_tree(fn, &x86_vector_domain_ops,
 						   NULL);
 	BUG_ON(x86_vector_domain =3D=3D NULL);
-	irq_set_default_host(x86_vector_domain);
+	irq_set_default_domain(x86_vector_domain);
=20
 	BUG_ON(!alloc_cpumask_var(&vector_searchmask, GFP_KERNEL));
=20
diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada=
-370-xp.c
index d7c5ef248474..2aa6a51e05d0 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -564,7 +564,7 @@ static void mpic_reenable_percpu(struct mpic *mpic)
=20
 static int mpic_starting_cpu(unsigned int cpu)
 {
-	struct mpic *mpic =3D irq_get_default_host()->host_data;
+	struct mpic *mpic =3D irq_get_default_domain()->host_data;
=20
 	mpic_perf_init(mpic);
 	mpic_smp_cpu_init(mpic);
@@ -700,7 +700,7 @@ static void mpic_handle_cascade_irq(struct irq_desc *desc)
=20
 static void __exception_irq_entry mpic_handle_irq(struct pt_regs *regs)
 {
-	struct mpic *mpic =3D irq_get_default_host()->host_data;
+	struct mpic *mpic =3D irq_get_default_domain()->host_data;
 	irq_hw_number_t i;
 	u32 irqstat;
=20
@@ -880,7 +880,7 @@ static int __init mpic_of_init(struct device_node *node, =
struct device_node *par
 	}
=20
 	if (mpic_is_ipi_available(mpic)) {
-		irq_set_default_host(mpic->domain);
+		irq_set_default_domain(mpic->domain);
 		set_handle_irq(mpic_handle_irq);
 #ifdef CONFIG_SMP
 		err =3D mpic_ipi_init(mpic, node);
diff --git a/drivers/irqchip/irq-clps711x.c b/drivers/irqchip/irq-clps711x.c
index 806ebb1de201..48c73c948ddf 100644
--- a/drivers/irqchip/irq-clps711x.c
+++ b/drivers/irqchip/irq-clps711x.c
@@ -191,7 +191,7 @@ static int __init _clps711x_intc_init(struct device_node =
*np,
 		goto out_irqfree;
 	}
=20
-	irq_set_default_host(clps711x_intc->domain);
+	irq_set_default_domain(clps711x_intc->domain);
 	set_handle_irq(clps711x_irqh);
=20
 #ifdef CONFIG_FIQ
diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index 8a0e82067924..095ae8e3217e 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -247,7 +247,7 @@ static int __init imx_gpcv2_irqchip_init(struct device_no=
de *node,
 		kfree(cd);
 		return -ENOMEM;
 	}
-	irq_set_default_host(domain);
+	irq_set_default_domain(domain);
=20
 	/* Initially mask all interrupts */
 	for (i =3D 0; i < IMR_NUM; i++) {
diff --git a/drivers/irqchip/irq-pic32-evic.c b/drivers/irqchip/irq-pic32-evi=
c.c
index eb6ca516a166..b546b1036e12 100644
--- a/drivers/irqchip/irq-pic32-evic.c
+++ b/drivers/irqchip/irq-pic32-evic.c
@@ -291,7 +291,7 @@ static int __init pic32_of_init(struct device_node *node,
 		gc->private =3D &priv[i];
 	}
=20
-	irq_set_default_host(evic_irq_domain);
+	irq_set_default_domain(evic_irq_domain);
=20
 	/*
 	 * External interrupts have software configurable edge polarity. These
diff --git a/drivers/irqchip/irq-xilinx-intc.c b/drivers/irqchip/irq-xilinx-i=
ntc.c
index 7e08714d507f..38727e9cc713 100644
--- a/drivers/irqchip/irq-xilinx-intc.c
+++ b/drivers/irqchip/irq-xilinx-intc.c
@@ -233,7 +233,7 @@ static int __init xilinx_intc_of_init(struct device_node =
*intc,
 		}
 	} else {
 		primary_intc =3D irqc;
-		irq_set_default_host(primary_intc->root_domain);
+		irq_set_default_domain(primary_intc->root_domain);
 		set_handle_irq(xil_intc_handle_irq);
 	}
=20
diff --git a/drivers/irqchip/irq-xtensa-mx.c b/drivers/irqchip/irq-xtensa-mx.c
index 7f314e58f3ce..9b441d180299 100644
--- a/drivers/irqchip/irq-xtensa-mx.c
+++ b/drivers/irqchip/irq-xtensa-mx.c
@@ -156,7 +156,7 @@ static void __init xtensa_mx_init_common(struct irq_domai=
n *root_domain)
 {
 	unsigned int i;
=20
-	irq_set_default_host(root_domain);
+	irq_set_default_domain(root_domain);
 	secondary_init_irq();
=20
 	/* Initialize default IRQ routing to CPU 0 */
diff --git a/drivers/irqchip/irq-xtensa-pic.c b/drivers/irqchip/irq-xtensa-pi=
c.c
index f9d6fce4da33..9be7b7c5cd23 100644
--- a/drivers/irqchip/irq-xtensa-pic.c
+++ b/drivers/irqchip/irq-xtensa-pic.c
@@ -87,7 +87,7 @@ int __init xtensa_pic_init_legacy(struct device_node *inter=
rupt_parent)
 	struct irq_domain *root_domain =3D
 		irq_domain_add_legacy(NULL, NR_IRQS - 1, 1, 0,
 				&xtensa_irq_domain_ops, &xtensa_irq_chip);
-	irq_set_default_host(root_domain);
+	irq_set_default_domain(root_domain);
 	return 0;
 }
=20
@@ -97,7 +97,7 @@ static int __init xtensa_pic_init(struct device_node *np,
 	struct irq_domain *root_domain =3D
 		irq_domain_add_linear(np, NR_IRQS, &xtensa_irq_domain_ops,
 				&xtensa_irq_chip);
-	irq_set_default_host(root_domain);
+	irq_set_default_domain(root_domain);
 	return 0;
 }
 IRQCHIP_DECLARE(xtensa_irq_chip, "cdns,xtensa-pic", xtensa_pic_init);
diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 33ff41eef8f7..bb7111105296 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -72,7 +72,7 @@ void of_phandle_args_to_fwspec(struct device_node *np, cons=
t u32 *args,
=20
 /**
  * struct irq_domain_ops - Methods for irq_domain objects
- * @match: Match an interrupt controller device node to a host, returns
+ * @match: Match an interrupt controller device node to a domain, returns
  *         1 on a match
  * @select: Match an interrupt controller fw specification. It is more gener=
ic
  *	    than @match as it receives a complete struct irq_fwspec. Therefore,
@@ -352,8 +352,8 @@ struct irq_domain *irq_domain_create_legacy(struct fwnode=
_handle *fwnode,
 					    void *host_data);
 struct irq_domain *irq_find_matching_fwspec(struct irq_fwspec *fwspec,
 					    enum irq_domain_bus_token bus_token);
-void irq_set_default_host(struct irq_domain *host);
-struct irq_domain *irq_get_default_host(void);
+void irq_set_default_domain(struct irq_domain *domain);
+struct irq_domain *irq_get_default_domain(void);
 int irq_domain_alloc_descs(int virq, unsigned int nr_irqs,
 			   irq_hw_number_t hwirq, int node,
 			   const struct irq_affinity_desc *affinity);
@@ -454,7 +454,7 @@ static inline struct irq_domain *irq_domain_add_nomap(str=
uct device_node *of_nod
 	return IS_ERR(d) ? NULL : d;
 }
=20
-unsigned int irq_create_direct_mapping(struct irq_domain *host);
+unsigned int irq_create_direct_mapping(struct irq_domain *domain);
 #endif
=20
 static inline struct irq_domain *irq_domain_add_tree(struct device_node *of_=
node,
@@ -507,7 +507,7 @@ static inline struct irq_domain *irq_domain_create_tree(s=
truct fwnode_handle *fw
 	return IS_ERR(d) ? NULL : d;
 }
=20
-void irq_domain_remove(struct irq_domain *host);
+void irq_domain_remove(struct irq_domain *domain);
=20
 int irq_domain_associate(struct irq_domain *domain, unsigned int irq,
 			 irq_hw_number_t hwirq);
@@ -515,16 +515,16 @@ void irq_domain_associate_many(struct irq_domain *domai=
n,
 			       unsigned int irq_base,
 			       irq_hw_number_t hwirq_base, int count);
=20
-unsigned int irq_create_mapping_affinity(struct irq_domain *host,
+unsigned int irq_create_mapping_affinity(struct irq_domain *domain,
 					 irq_hw_number_t hwirq,
 					 const struct irq_affinity_desc *affinity);
 unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec);
 void irq_dispose_mapping(unsigned int virq);
=20
-static inline unsigned int irq_create_mapping(struct irq_domain *host,
+static inline unsigned int irq_create_mapping(struct irq_domain *domain,
 					      irq_hw_number_t hwirq)
 {
-	return irq_create_mapping_affinity(host, hwirq, NULL);
+	return irq_create_mapping_affinity(domain, hwirq, NULL);
 }
=20
 struct irq_desc *__irq_resolve_mapping(struct irq_domain *domain,
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 2861f89880af..9d5c8651492d 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -398,7 +398,7 @@ void irq_domain_remove(struct irq_domain *domain)
 	 * If the going away domain is the default one, reset it.
 	 */
 	if (unlikely(irq_default_domain =3D=3D domain))
-		irq_set_default_host(NULL);
+		irq_set_default_domain(NULL);
=20
 	mutex_unlock(&irq_domain_mutex);
=20
@@ -573,7 +573,7 @@ struct irq_domain *irq_find_matching_fwspec(struct irq_fw=
spec *fwspec,
 EXPORT_SYMBOL_GPL(irq_find_matching_fwspec);
=20
 /**
- * irq_set_default_host() - Set a "default" irq domain
+ * irq_set_default_domain() - Set a "default" irq domain
  * @domain: default domain pointer
  *
  * For convenience, it's possible to set a "default" domain that will be used
@@ -581,16 +581,16 @@ EXPORT_SYMBOL_GPL(irq_find_matching_fwspec);
  * platforms that want to manipulate a few hard coded interrupt numbers that
  * aren't properly represented in the device-tree.
  */
-void irq_set_default_host(struct irq_domain *domain)
+void irq_set_default_domain(struct irq_domain *domain)
 {
 	pr_debug("Default domain set to @0x%p\n", domain);
=20
 	irq_default_domain =3D domain;
 }
-EXPORT_SYMBOL_GPL(irq_set_default_host);
+EXPORT_SYMBOL_GPL(irq_set_default_domain);
=20
 /**
- * irq_get_default_host() - Retrieve the "default" irq domain
+ * irq_get_default_domain() - Retrieve the "default" irq domain
  *
  * Returns: the default domain, if any.
  *
@@ -598,11 +598,11 @@ EXPORT_SYMBOL_GPL(irq_set_default_host);
  * systems that cannot implement a firmware->fwnode mapping (which
  * both DT and ACPI provide).
  */
-struct irq_domain *irq_get_default_host(void)
+struct irq_domain *irq_get_default_domain(void)
 {
 	return irq_default_domain;
 }
-EXPORT_SYMBOL_GPL(irq_get_default_host);
+EXPORT_SYMBOL_GPL(irq_get_default_domain);
=20
 static bool irq_domain_is_nomap(struct irq_domain *domain)
 {
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index 147cabb4c077..f2b2929986ff 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -37,7 +37,7 @@ bool irq_fixup_move_pending(struct irq_desc *desc, bool for=
ce_clear)
=20
 void irq_force_complete_move(struct irq_desc *desc)
 {
-	for (struct irq_data *d =3D irq_desc_get_irq_data(desc); d; d =3D d->parent=
_data) {
+	for (struct irq_data *d =3D irq_desc_get_irq_data(desc); d; d =3D irqd_get_=
parent_data(d)) {
 		if (d->chip && d->chip->irq_force_complete_move) {
 			d->chip->irq_force_complete_move(d);
 			return;

