Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFE21B0439
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 20:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748206431; cv=none; b=o/SD1Dh+mck16aZco7xFTnX8R/Y5A0DaWXkSD5omLIeAWjwUySiQ2yk+d51gPrKFgeDwK09moJc8oSkeKUA1K2yecyEovBF7sGrMoYeNrZOO26v1mBbRxbx3Bxnh9EukvWdZiXpie7WxS9tJEN4DVvawp0V3+jldQa13WZ31eS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748206431; c=relaxed/simple;
	bh=bJyIqbmPGHdaSpO1YegnxbuFwa5qsE2E0M/C1ttOZDA=;
	h=From:To:Cc:Subject:References:Message-ID:Content-Type:
	 MIME-Version:Date; b=BQfIgNMA7eB7WwaeM6x0XaWyNWO+RM4zXhmS+lfJHImSQIz6p+Ee5/Smn5wFRNPfwBrH21qhlVhE41UHLsLwd9F/6tMcBvwItX7M59Hq+r8W+eTE1mlL79XSbYRsXqGQA/7XMWGGckEjY11zMuOblNPasLevkX8BywwTspYtmmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fGb3ezyc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jtaHbE6Z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fGb3ezyc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jtaHbE6Z"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748206424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=D6B/ZQOfZhK3JXtmKqJry5QKnzMkhDd4OCKPg4N3y4Q=;
	b=fGb3ezycvaqgCeHNeslmvSjcAyLM8GVO2Po8Tj66VCZKaaGvOWijPPlDM5P/Hd6k3jKgBN
	Tw1D9K7Xmz08lv/O8D63q/AbP9A8UNCZfP636T/l9XpZuIo36PiBxLgNpI6AkkU7W9VAlT
	WWZ5N5UePUEYFKuEgOu+lCVeuRhrXk4gEisjRi6tykOVQlRdh0pMQ4vemLPGKqXGarD3MQ
	RdkzEWksYD7RlMjPQBpjtGFh5mCoJ8VnkwJHKGiAbIbfpWxnftJEeIX5e0qAYOc1V10rlT
	4IK+6QBzYw+qChAYoLowppwOJYeAyG48SR8ssii7ybg4dYGlpf87aIVFaZDKQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748206424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=D6B/ZQOfZhK3JXtmKqJry5QKnzMkhDd4OCKPg4N3y4Q=;
	b=jtaHbE6Z5G97Vd9qYRTsqcWRvqy9mZeteRnL/8qOxKK93Pdw35m4WKS2TO0L6uRr32YsXB
	TNsLk6xiJEQYSbAA==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] irq/msi for v6.16-rc1
References: <174820637262.238682.1985899398053030312.tglx@xen13>
Message-ID: <174820637979.238682.4349646136552270664.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 May 2025 22:53:43 +0200 (CEST)

Linus,

please pull the latest irq/msi branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-msi-2025-05-=
25

up to:  4e7bca76e3fe: PCI/MSI: Use bool for MSI enable state tracking


Updates for the MSI subsystem (core code and PCI):

  - Switch the MSI decriptor locking to lock guards

  - Replace a broken and naive implementation of PCI/MSI-X control word
    updates in the PCI/TPH driver with a properly serialized variant in the
    PCI/MSI core code.

  - Remove the MSI descriptor abuse in the SCCI/UFS/QCOM driver by
    replacing the direct access to the MSI descriptors with the proper API
    function calls. People will never understand that APIs exist for a
    reason...

  - Provide core infrastructre for the upcoming PCI endpoint library
    extensions. Currently limited to ARM GICv3+, but in theory extensible
    to other architectures.

  - Provide a MSI domain::teardown() callback, which allows drivers to undo
    the effects of the prepare() callback.

  - Move the MSI domain::prepare() callback invocation to domain creation
    time to avoid redundant (and in case of ARM/GIC-V3-ITS confusing)
    invocations on every allocation.

    In combination with the new teardown callback this removes some ugly
    hacks in the GIC-V3-ITS driver, which pretended to work around the
    short comings of the core code so far. With this update the code is
    correct by design and implementation.

  - Make the irqchip MSI library globally available, provide a MSI parent
    domain creation helper and convert a bunch of (PCI/)MSI drivers over to
    the modern MSI parent mechanism. This is the first step to get rid of
    at least one incarnation of the three PCI/MSI management schemes.

  - The usual small cleanups and improvements

Thanks,

	tglx

------------------>
Frank Li (5):
      platform-msi: Add msi_remove_device_irq_domain() in platform_device_msi=
_free_irqs_all()
      irqdomain: Add IRQ_DOMAIN_FLAG_MSI_IMMUTABLE and irq_domain_is_msi_immu=
table()
      irqchip/gic-v3-its: Set IRQ_DOMAIN_FLAG_MSI_IMMUTABLE for ITS
      dt-bindings: PCI: pci-ep: Add support for iommu-map and msi-map
      irqchip/gic-v3-its: Add support for device tree msi-map and msi-mask

Hans Zhang (1):
      PCI/MSI: Use bool for MSI enable state tracking

Jiri Slaby (SUSE) (1):
      irqdomain: pci: Switch to of_fwnode_handle()

Marc Zyngier (13):
      genirq/msi: Add .msi_teardown() callback as the reverse of .msi_prepare=
()
      irqchip/gic-v3-its: Implement .msi_teardown() callback
      genirq/msi: Move prepare() call to per-device allocation
      genirq/msi: Engage the .msi_teardown() callback on domain removal
      irqchip/gic-v3-its: Use allocation size from the prepare call
      irqchip: Make irq-msi-lib.h globally available
      genirq/msi: Add helper for creating MSI-parent irq domains
      irqchip/gic: Convert to msi_create_parent_irq_domain() helper
      irqchip/mvebu: Convert to msi_create_parent_irq_domain() helper
      irqchip/msi-lib: Honour the MSI_FLAG_NO_AFFINITY flag
      PCI: apple: Convert to MSI parent infrastructure
      PCI: xgene: Convert to MSI parent infrastructure
      PCI: tegra: Convert to MSI parent infrastructure

Thomas Gleixner (14):
      cleanup: Provide retain_and_null_ptr()
      genirq/msi: Use lock guards for MSI descriptor locking
      soc: ti: ti_sci_inta_msi: Switch MSI descriptor locking to guard()
      NTB/msi: Switch MSI descriptor locking to lock guard()
      PCI/MSI: Use guard(msi_desc_lock) where applicable
      PCI/MSI: Set pci_dev:: Msi_enabled late
      PCI/MSI: Use __free() for affinity masks
      PCI/MSI: Switch msi_capability_init() to guard(msi_desc_lock)
      PCI/MSI: Switch msix_capability_init() to guard(msi_desc_lock)
      PCI: hv: Switch MSI descriptor locking to guard()
      PCI/MSI: Provide a sane mechanism for TPH
      PCI/TPH: Replace the broken MSI-X control word update
      scsi: ufs: qcom: Remove the MSI descriptor abuse
      genirq/msi: Rename msi_[un]lock_descs()


 Documentation/devicetree/bindings/pci/pci-ep.yaml  |  68 ++++++++
 drivers/base/platform-msi.c                        |   1 +
 drivers/irqchip/irq-bcm2712-mip.c                  |   2 +-
 drivers/irqchip/irq-gic-v2m.c                      |  18 +-
 drivers/irqchip/irq-gic-v3-its-msi-parent.c        |  39 ++---
 drivers/irqchip/irq-gic-v3-its.c                   |  70 ++++----
 drivers/irqchip/irq-gic-v3-mbi.c                   |  18 +-
 drivers/irqchip/irq-imx-mu-msi.c                   |   2 +-
 drivers/irqchip/irq-loongarch-avec.c               |   2 +-
 drivers/irqchip/irq-loongson-pch-msi.c             |   2 +-
 drivers/irqchip/irq-msi-lib.c                      |   9 +-
 drivers/irqchip/irq-mvebu-gicp.c                   |  26 ++-
 drivers/irqchip/irq-mvebu-icu.c                    |   2 +-
 drivers/irqchip/irq-mvebu-odmi.c                   |  27 ++-
 drivers/irqchip/irq-mvebu-sei.c                    |  24 +--
 drivers/irqchip/irq-riscv-imsic-platform.c         |   2 +-
 drivers/irqchip/irq-sg2042-msi.c                   |   2 +-
 drivers/ntb/msi.c                                  |  22 +--
 drivers/pci/controller/Kconfig                     |   3 +
 drivers/pci/controller/dwc/pcie-designware-host.c  |   2 +-
 .../pci/controller/mobiveil/pcie-mobiveil-host.c   |   2 +-
 drivers/pci/controller/pci-hyperv.c                |  14 +-
 drivers/pci/controller/pci-tegra.c                 |  63 ++-----
 drivers/pci/controller/pci-xgene-msi.c             |  53 +++---
 drivers/pci/controller/pcie-altera-msi.c           |   2 +-
 drivers/pci/controller/pcie-apple.c                |  69 +++-----
 drivers/pci/controller/pcie-brcmstb.c              |   2 +-
 drivers/pci/controller/pcie-iproc-msi.c            |   2 +-
 drivers/pci/controller/pcie-mediatek.c             |   2 +-
 drivers/pci/controller/pcie-xilinx-dma-pl.c        |   2 +-
 drivers/pci/controller/pcie-xilinx-nwl.c           |   2 +-
 drivers/pci/controller/plda/pcie-plda-host.c       |   2 +-
 drivers/pci/msi/api.c                              |   8 +-
 drivers/pci/msi/msi.c                              | 179 ++++++++++++-------
 drivers/pci/msi/msi.h                              |   2 +-
 drivers/pci/pci.h                                  |   9 +
 drivers/pci/tph.c                                  |  44 +----
 drivers/soc/ti/ti_sci_inta_msi.c                   |  10 +-
 drivers/ufs/host/ufs-qcom.c                        |  85 +++++----
 include/linux/cleanup.h                            |  19 ++
 {drivers =3D> include/linux}/irqchip/irq-msi-lib.h   |   6 +-
 include/linux/irqdomain.h                          |   9 +
 include/linux/msi.h                                |  23 ++-
 include/linux/pci.h                                |   4 +-
 kernel/irq/msi.c                                   | 192 ++++++++++++-------=
--
 45 files changed, 616 insertions(+), 530 deletions(-)
 rename {drivers =3D> include/linux}/irqchip/irq-msi-lib.h (84%)

diff --git a/Documentation/devicetree/bindings/pci/pci-ep.yaml b/Documentatio=
n/devicetree/bindings/pci/pci-ep.yaml
index f75000e3093d..214caa4ec3d5 100644
--- a/Documentation/devicetree/bindings/pci/pci-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/pci-ep.yaml
@@ -17,6 +17,24 @@ properties:
   $nodename:
     pattern: "^pcie-ep@"
=20
+  iommu-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: Device ID (see msi-map) base
+          maximum: 0x7ffff
+        - description: phandle to IOMMU
+        - description: IOMMU specifier base (currently always 1 cell)
+        - description: Number of Device IDs
+          maximum: 0x80000
+
+  iommu-map-mask:
+    description:
+      A mask to be applied to each Device ID prior to being mapped to an
+      IOMMU specifier per the iommu-map property.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 0x7ffff
+
   max-functions:
     description: Maximum number of functions that can be configured
     $ref: /schemas/types.yaml#/definitions/uint8
@@ -35,6 +53,56 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 1, 2, 3, 4 ]
=20
+  msi-map:
+    description: |
+      Maps a Device ID to an MSI and associated MSI specifier data.
+
+      A PCI Endpoint (EP) can use MSI as a doorbell function. This is achiev=
ed by
+      mapping the MSI controller's address into PCI BAR<n>. The PCI Root Com=
plex
+      can write to this BAR<n>, triggering the EP to generate IRQ. This noti=
fies
+      the EP-side driver of an event, eliminating the need for the driver to
+      continuously poll for status changes.
+
+      However, the EP cannot rely on Requester ID (RID) because the RID is
+      determined by the PCI topology of the host system. Since the EP may be
+      connected to different PCI hosts, the RID can vary between systems and=
 is
+      therefore not a reliable identifier.
+
+      Each EP can support up to 8 physical functions and up to 65,536 virtual
+      functions. To uniquely identify each child device, a device ID is defi=
ned
+      as
+         - Bits [2:0] for the function number (func)
+         - Bits [18:3] for the virtual function index (vfunc)
+
+      The resulting device ID is computed as:
+
+        (func & 0x7) | (vfunc << 3)
+
+      The property is an arbitrary number of tuples of
+      (device-id-base, msi, msi-base,length).
+
+      Any Device ID id in the interval [id-base, id-base + length) is
+      associated with the listed MSI, with the MSI specifier
+      (id - id-base + msi-base).
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: The Device ID base matched by the entry
+          maximum: 0x7ffff
+        - description: phandle to msi-controller node
+        - description: (optional) The msi-specifier produced for the first
+            Device ID matched by the entry. Currently, msi-specifier is 0 or
+            1 cells.
+        - description: The length of consecutive Device IDs following the
+            Device ID base
+          maximum: 0x80000
+
+  msi-map-mask:
+    description: A mask to be applied to each Device ID prior to being
+      mapped to an msi-specifier per the msi-map property.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 0x7ffff
+
   num-lanes:
     description: maximum number of lanes
     $ref: /schemas/types.yaml#/definitions/uint32
diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index 0e60dd650b5e..70db08f3ac6f 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -95,5 +95,6 @@ EXPORT_SYMBOL_GPL(platform_device_msi_init_and_alloc_irqs);
 void platform_device_msi_free_irqs_all(struct device *dev)
 {
 	msi_domain_free_irqs_all(dev, MSI_DEFAULT_DOMAIN);
+	msi_remove_device_irq_domain(dev, MSI_DEFAULT_DOMAIN);
 }
 EXPORT_SYMBOL_GPL(platform_device_msi_free_irqs_all);
diff --git a/drivers/irqchip/irq-bcm2712-mip.c b/drivers/irqchip/irq-bcm2712-=
mip.c
index 49a19db2d1e1..f04a42b16cca 100644
--- a/drivers/irqchip/irq-bcm2712-mip.c
+++ b/drivers/irqchip/irq-bcm2712-mip.c
@@ -11,7 +11,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
=20
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
=20
 #define MIP_INT_RAISE		0x00
 #define MIP_INT_CLEAR		0x10
diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index c69894861866..102f1711673e 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -26,7 +26,7 @@
 #include <linux/irqchip/arm-gic.h>
 #include <linux/irqchip/arm-gic-common.h>
=20
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
=20
 /*
 * MSI_TYPER:
@@ -261,23 +261,23 @@ static struct msi_parent_ops gicv2m_msi_parent_ops =3D {
=20
 static __init int gicv2m_allocate_domains(struct irq_domain *parent)
 {
-	struct irq_domain *inner_domain;
+	struct irq_domain_info info =3D {
+		.ops		=3D &gicv2m_domain_ops,
+		.parent		=3D parent,
+	};
 	struct v2m_data *v2m;
=20
 	v2m =3D list_first_entry_or_null(&v2m_nodes, struct v2m_data, entry);
 	if (!v2m)
 		return 0;
=20
-	inner_domain =3D irq_domain_create_hierarchy(parent, 0, 0, v2m->fwnode,
-						   &gicv2m_domain_ops, v2m);
-	if (!inner_domain) {
+	info.host_data =3D v2m;
+	info.fwnode =3D v2m->fwnode;
+
+	if (!msi_create_parent_irq_domain(&info, &gicv2m_msi_parent_ops)) {
 		pr_err("Failed to create GICv2m domain\n");
 		return -ENOMEM;
 	}
-
-	irq_domain_update_bus_token(inner_domain, DOMAIN_BUS_NEXUS);
-	inner_domain->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
-	inner_domain->msi_parent_ops =3D &gicv2m_msi_parent_ops;
 	return 0;
 }
=20
diff --git a/drivers/irqchip/irq-gic-v3-its-msi-parent.c b/drivers/irqchip/ir=
q-gic-v3-its-msi-parent.c
index bdb04c808148..d039ec541940 100644
--- a/drivers/irqchip/irq-gic-v3-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
@@ -8,7 +8,7 @@
 #include <linux/pci.h>
=20
 #include "irq-gic-common.h"
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
=20
 #define ITS_MSI_FLAGS_REQUIRED  (MSI_FLAG_USE_DEF_DOM_OPS |	\
 				 MSI_FLAG_USE_DEF_CHIP_OPS |	\
@@ -67,17 +67,6 @@ static int its_pci_msi_prepare(struct irq_domain *domain, =
struct device *dev,
 	/* ITS specific DeviceID, as the core ITS ignores dev. */
 	info->scratchpad[0].ul =3D pci_msi_domain_get_msi_rid(domain->parent, pdev);
=20
-	/*
-	 * @domain->msi_domain_info->hwsize contains the size of the
-	 * MSI[-X] domain, but vector allocation happens one by one. This
-	 * needs some thought when MSI comes into play as the size of MSI
-	 * might be unknown at domain creation time and therefore set to
-	 * MSI_MAX_INDEX.
-	 */
-	msi_info =3D msi_get_domain_info(domain);
-	if (msi_info->hwsize > nvec)
-		nvec =3D msi_info->hwsize;
-
 	/*
 	 * Always allocate a power of 2, and special case device 0 for
 	 * broken systems where the DevID is not wired (and all devices
@@ -118,6 +107,14 @@ static int of_pmsi_get_dev_id(struct irq_domain *domain,=
 struct device *dev,
 		index++;
 	} while (!ret);
=20
+	if (ret) {
+		struct device_node *np =3D NULL;
+
+		ret =3D of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &np, d=
ev_id);
+		if (np)
+			of_node_put(np);
+	}
+
 	return ret;
 }
=20
@@ -143,14 +140,6 @@ static int its_pmsi_prepare(struct irq_domain *domain, s=
truct device *dev,
 	/* ITS specific DeviceID, as the core ITS ignores dev. */
 	info->scratchpad[0].ul =3D dev_id;
=20
-	/*
-	 * @domain->msi_domain_info->hwsize contains the size of the device
-	 * domain, but vector allocation happens one by one.
-	 */
-	msi_info =3D msi_get_domain_info(domain);
-	if (msi_info->hwsize > nvec)
-		nvec =3D msi_info->hwsize;
-
 	/* Allocate at least 32 MSIs, and always as a power of 2 */
 	nvec =3D max_t(int, 32, roundup_pow_of_two(nvec));
=20
@@ -159,6 +148,14 @@ static int its_pmsi_prepare(struct irq_domain *domain, s=
truct device *dev,
 					  dev, nvec, info);
 }
=20
+static void its_msi_teardown(struct irq_domain *domain, msi_alloc_info_t *in=
fo)
+{
+	struct msi_domain_info *msi_info;
+
+	msi_info =3D msi_get_domain_info(domain->parent);
+	msi_info->ops->msi_teardown(domain->parent, info);
+}
+
 static bool its_init_dev_msi_info(struct device *dev, struct irq_domain *dom=
ain,
 				  struct irq_domain *real_parent, struct msi_domain_info *info)
 {
@@ -182,6 +179,7 @@ static bool its_init_dev_msi_info(struct device *dev, str=
uct irq_domain *domain,
 		 * %MSI_MAX_INDEX.
 		 */
 		info->ops->msi_prepare =3D its_pci_msi_prepare;
+		info->ops->msi_teardown =3D its_msi_teardown;
 		break;
 	case DOMAIN_BUS_DEVICE_MSI:
 	case DOMAIN_BUS_WIRED_TO_MSI:
@@ -190,6 +188,7 @@ static bool its_init_dev_msi_info(struct device *dev, str=
uct irq_domain *domain,
 		 * size is also known at domain creation time.
 		 */
 		info->ops->msi_prepare =3D its_pmsi_prepare;
+		info->ops->msi_teardown =3D its_msi_teardown;
 		break;
 	default:
 		/* Confused. How did the lib return true? */
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-it=
s.c
index 0115ad6c8259..57ecf5b5155f 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -41,7 +41,7 @@
 #include <asm/exception.h>
=20
 #include "irq-gic-common.h"
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
=20
 #define ITS_FLAGS_CMDQ_NEEDS_FLUSHING		(1ULL << 0)
 #define ITS_FLAGS_WORKAROUND_CAVIUM_22375	(1ULL << 1)
@@ -3620,8 +3620,33 @@ static int its_msi_prepare(struct irq_domain *domain, =
struct device *dev,
 	return err;
 }
=20
+static void its_msi_teardown(struct irq_domain *domain, msi_alloc_info_t *in=
fo)
+{
+	struct its_device *its_dev =3D info->scratchpad[0].ptr;
+
+	guard(mutex)(&its_dev->its->dev_alloc_lock);
+
+	/* If the device is shared, keep everything around */
+	if (its_dev->shared)
+		return;
+
+	/* LPIs should have been already unmapped at this stage */
+	if (WARN_ON_ONCE(!bitmap_empty(its_dev->event_map.lpi_map,
+				       its_dev->event_map.nr_lpis)))
+		return;
+
+	its_lpi_free(its_dev->event_map.lpi_map,
+		     its_dev->event_map.lpi_base,
+		     its_dev->event_map.nr_lpis);
+
+	/* Unmap device/itt, and get rid of the tracking */
+	its_send_mapd(its_dev, 0);
+	its_free_device(its_dev);
+}
+
 static struct msi_domain_ops its_msi_domain_ops =3D {
 	.msi_prepare	=3D its_msi_prepare,
+	.msi_teardown	=3D its_msi_teardown,
 };
=20
 static int its_irq_gic_domain_alloc(struct irq_domain *domain,
@@ -3722,7 +3747,6 @@ static void its_irq_domain_free(struct irq_domain *doma=
in, unsigned int virq,
 {
 	struct irq_data *d =3D irq_domain_get_irq_data(domain, virq);
 	struct its_device *its_dev =3D irq_data_get_irq_chip_data(d);
-	struct its_node *its =3D its_dev->its;
 	int i;
=20
 	bitmap_release_region(its_dev->event_map.lpi_map,
@@ -3736,26 +3760,6 @@ static void its_irq_domain_free(struct irq_domain *dom=
ain, unsigned int virq,
 		irq_domain_reset_irq_data(data);
 	}
=20
-	mutex_lock(&its->dev_alloc_lock);
-
-	/*
-	 * If all interrupts have been freed, start mopping the
-	 * floor. This is conditioned on the device not being shared.
-	 */
-	if (!its_dev->shared &&
-	    bitmap_empty(its_dev->event_map.lpi_map,
-			 its_dev->event_map.nr_lpis)) {
-		its_lpi_free(its_dev->event_map.lpi_map,
-			     its_dev->event_map.lpi_base,
-			     its_dev->event_map.nr_lpis);
-
-		/* Unmap device/itt */
-		its_send_mapd(its_dev, 0);
-		its_free_device(its_dev);
-	}
-
-	mutex_unlock(&its->dev_alloc_lock);
-
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
=20
@@ -5118,7 +5122,12 @@ static void __init __iomem *its_map_one(struct resourc=
e *res, int *err)
=20
 static int its_init_domain(struct its_node *its)
 {
-	struct irq_domain *inner_domain;
+	struct irq_domain_info dom_info =3D {
+		.fwnode		=3D its->fwnode_handle,
+		.ops		=3D &its_domain_ops,
+		.domain_flags	=3D its->msi_domain_flags,
+		.parent		=3D its_parent,
+	};
 	struct msi_domain_info *info;
=20
 	info =3D kzalloc(sizeof(*info), GFP_KERNEL);
@@ -5127,21 +5136,12 @@ static int its_init_domain(struct its_node *its)
=20
 	info->ops =3D &its_msi_domain_ops;
 	info->data =3D its;
+	dom_info.host_data =3D info;
=20
-	inner_domain =3D irq_domain_create_hierarchy(its_parent,
-						   its->msi_domain_flags, 0,
-						   its->fwnode_handle, &its_domain_ops,
-						   info);
-	if (!inner_domain) {
+	if (!msi_create_parent_irq_domain(&dom_info, &gic_v3_its_msi_parent_ops)) {
 		kfree(info);
 		return -ENOMEM;
 	}
-
-	irq_domain_update_bus_token(inner_domain, DOMAIN_BUS_NEXUS);
-
-	inner_domain->msi_parent_ops =3D &gic_v3_its_msi_parent_ops;
-	inner_domain->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
-
 	return 0;
 }
=20
@@ -5518,7 +5518,7 @@ static struct its_node __init *its_node_init(struct res=
ource *res,
 	its->base =3D its_base;
 	its->phys_base =3D res->start;
 	its->get_msi_base =3D its_irq_get_msi_base;
-	its->msi_domain_flags =3D IRQ_DOMAIN_FLAG_ISOLATED_MSI;
+	its->msi_domain_flags =3D IRQ_DOMAIN_FLAG_ISOLATED_MSI | IRQ_DOMAIN_FLAG_MS=
I_IMMUTABLE;
=20
 	its->numa_node =3D numa_node;
 	its->fwnode_handle =3D handle;
diff --git a/drivers/irqchip/irq-gic-v3-mbi.c b/drivers/irqchip/irq-gic-v3-mb=
i.c
index 34e9ca77a8c3..6a4afd1066dd 100644
--- a/drivers/irqchip/irq-gic-v3-mbi.c
+++ b/drivers/irqchip/irq-gic-v3-mbi.c
@@ -18,7 +18,7 @@
=20
 #include <linux/irqchip/arm-gic-v3.h>
=20
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
=20
 struct mbi_range {
 	u32			spi_start;
@@ -206,17 +206,13 @@ static const struct msi_parent_ops gic_v3_mbi_msi_paren=
t_ops =3D {
=20
 static int mbi_allocate_domain(struct irq_domain *parent)
 {
-	struct irq_domain *nexus_domain;
+	struct irq_domain_info info =3D {
+		.fwnode		=3D parent->fwnode,
+		.ops		=3D &mbi_domain_ops,
+		.parent		=3D parent,
+	};
=20
-	nexus_domain =3D irq_domain_create_hierarchy(parent, 0, 0, parent->fwnode,
-						   &mbi_domain_ops, NULL);
-	if (!nexus_domain)
-		return -ENOMEM;
-
-	irq_domain_update_bus_token(nexus_domain, DOMAIN_BUS_NEXUS);
-	nexus_domain->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
-	nexus_domain->msi_parent_ops =3D &gic_v3_mbi_msi_parent_ops;
-	return 0;
+	return msi_create_parent_irq_domain(&info, &gic_v3_mbi_msi_parent_ops) ? 0 =
: -ENOMEM;
 }
=20
 int __init mbi_init(struct fwnode_handle *fwnode, struct irq_domain *parent)
diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-ms=
i.c
index 69aacdfc8bef..137da1927d14 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -24,7 +24,7 @@
 #include <linux/pm_domain.h>
 #include <linux/spinlock.h>
=20
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
=20
 #define IMX_MU_CHANS            4
=20
diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loong=
arch-avec.c
index 80e55955a29f..bf52dc8345f5 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -18,7 +18,7 @@
 #include <asm/loongarch.h>
 #include <asm/setup.h>
=20
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 #include "irq-loongson.h"
=20
 #define VECTORS_PER_REG		64
diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loo=
ngson-pch-msi.c
index 9c62108b3ad5..fb690c7cbcaa 100644
--- a/drivers/irqchip/irq-loongson-pch-msi.c
+++ b/drivers/irqchip/irq-loongson-pch-msi.c
@@ -15,7 +15,7 @@
 #include <linux/pci.h>
 #include <linux/slab.h>
=20
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 #include "irq-loongson.h"
=20
 static int nr_pics;
diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 51464c6257f3..246c30205af4 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -4,7 +4,7 @@
=20
 #include <linux/export.h>
=20
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
=20
 /**
  * msi_lib_init_dev_msi_info - Domain info setup for MSI domains
@@ -105,8 +105,13 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struc=
t irq_domain *domain,
 	 * MSI message into the hardware which is the whole purpose of the
 	 * device MSI domain aside of mask/unmask which is provided e.g. by
 	 * PCI/MSI device domains.
+	 *
+	 * The exception to the rule is when the underlying domain
+	 * tells you that affinity is not a thing -- for example when
+	 * everything is muxed behind a single interrupt.
 	 */
-	chip->irq_set_affinity =3D msi_domain_set_affinity;
+	if (!chip->irq_set_affinity && !(info->flags & MSI_FLAG_NO_AFFINITY))
+		chip->irq_set_affinity =3D msi_domain_set_affinity;
 	return true;
 }
 EXPORT_SYMBOL_GPL(msi_lib_init_dev_msi_info);
diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gic=
p.c
index d67f93f6d750..9cd3c6cc7143 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -17,7 +17,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
=20
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
=20
 #include <dt-bindings/interrupt-controller/arm-gic.h>
=20
@@ -170,9 +170,12 @@ static const struct msi_parent_ops gicp_msi_parent_ops =
=3D {
=20
 static int mvebu_gicp_probe(struct platform_device *pdev)
 {
-	struct irq_domain *inner_domain, *parent_domain;
 	struct device_node *node =3D pdev->dev.of_node;
 	struct device_node *irq_parent_dn;
+	struct irq_domain_info info =3D {
+		.fwnode	=3D of_fwnode_handle(node),
+		.ops	=3D &gicp_domain_ops,
+	};
 	struct mvebu_gicp *gicp;
 	int ret, i;
=20
@@ -217,30 +220,23 @@ static int mvebu_gicp_probe(struct platform_device *pde=
v)
 	if (!gicp->spi_bitmap)
 		return -ENOMEM;
=20
+	info.size =3D gicp->spi_cnt;
+	info.host_data =3D gicp;
+
 	irq_parent_dn =3D of_irq_find_parent(node);
 	if (!irq_parent_dn) {
 		dev_err(&pdev->dev, "failed to find parent IRQ node\n");
 		return -ENODEV;
 	}
=20
-	parent_domain =3D irq_find_host(irq_parent_dn);
+	info.parent =3D irq_find_host(irq_parent_dn);
 	of_node_put(irq_parent_dn);
-	if (!parent_domain) {
+	if (!info.parent) {
 		dev_err(&pdev->dev, "failed to find parent IRQ domain\n");
 		return -ENODEV;
 	}
=20
-	inner_domain =3D irq_domain_create_hierarchy(parent_domain, 0,
-						   gicp->spi_cnt,
-						   of_node_to_fwnode(node),
-						   &gicp_domain_ops, gicp);
-	if (!inner_domain)
-		return -ENOMEM;
-
-	irq_domain_update_bus_token(inner_domain, DOMAIN_BUS_GENERIC_MSI);
-	inner_domain->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
-	inner_domain->msi_parent_ops =3D &gicp_msi_parent_ops;
-	return 0;
+	return msi_create_parent_irq_domain(&info, &gicp_msi_parent_ops) ? 0 : -ENO=
MEM;
 }
=20
 static const struct of_device_id mvebu_gicp_of_match[] =3D {
diff --git a/drivers/irqchip/irq-mvebu-icu.c b/drivers/irqchip/irq-mvebu-icu.c
index 4eebed39880a..db5dbc6e88b0 100644
--- a/drivers/irqchip/irq-mvebu-icu.c
+++ b/drivers/irqchip/irq-mvebu-icu.c
@@ -20,7 +20,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
=20
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
=20
 #include <dt-bindings/interrupt-controller/mvebu-icu.h>
=20
diff --git a/drivers/irqchip/irq-mvebu-odmi.c b/drivers/irqchip/irq-mvebu-odm=
i.c
index 28f7e81df94f..46256b9abd66 100644
--- a/drivers/irqchip/irq-mvebu-odmi.c
+++ b/drivers/irqchip/irq-mvebu-odmi.c
@@ -18,7 +18,7 @@
 #include <linux/of_address.h>
 #include <linux/slab.h>
=20
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
=20
 #include <dt-bindings/interrupt-controller/arm-gic.h>
=20
@@ -167,7 +167,12 @@ static const struct msi_parent_ops odmi_msi_parent_ops =
=3D {
 static int __init mvebu_odmi_init(struct device_node *node,
 				  struct device_node *parent)
 {
-	struct irq_domain *parent_domain, *inner_domain;
+	struct irq_domain_info info =3D {
+		.fwnode	=3D of_fwnode_handle(node),
+		.ops	=3D &odmi_domain_ops,
+		.size	=3D odmis_count * NODMIS_PER_FRAME,
+		.parent	=3D irq_find_host(parent),
+	};
 	int ret, i;
=20
 	if (of_property_read_u32(node, "marvell,odmi-frames", &odmis_count))
@@ -203,22 +208,10 @@ static int __init mvebu_odmi_init(struct device_node *n=
ode,
 		}
 	}
=20
-	parent_domain =3D irq_find_host(parent);
+	if (msi_create_parent_irq_domain(&info, &odmi_msi_parent_ops))
+		return 0;
=20
-	inner_domain =3D irq_domain_create_hierarchy(parent_domain, 0,
-						   odmis_count * NODMIS_PER_FRAME,
-						   of_node_to_fwnode(node),
-						   &odmi_domain_ops, NULL);
-	if (!inner_domain) {
-		ret =3D -ENOMEM;
-		goto err_unmap;
-	}
-
-	irq_domain_update_bus_token(inner_domain, DOMAIN_BUS_GENERIC_MSI);
-	inner_domain->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
-	inner_domain->msi_parent_ops =3D &odmi_msi_parent_ops;
-
-	return 0;
+	ret =3D -ENOMEM;
=20
 err_unmap:
 	for (i =3D 0; i < odmis_count; i++) {
diff --git a/drivers/irqchip/irq-mvebu-sei.c b/drivers/irqchip/irq-mvebu-sei.c
index ebd4a9014e8d..5822ea864765 100644
--- a/drivers/irqchip/irq-mvebu-sei.c
+++ b/drivers/irqchip/irq-mvebu-sei.c
@@ -14,7 +14,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
=20
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
=20
 /* Cause register */
 #define GICP_SECR(idx)		(0x0  + ((idx) * 0x4))
@@ -366,6 +366,10 @@ static const struct msi_parent_ops sei_msi_parent_ops =
=3D {
 static int mvebu_sei_probe(struct platform_device *pdev)
 {
 	struct device_node *node =3D pdev->dev.of_node;
+	struct irq_domain_info info =3D {
+		.fwnode	=3D of_fwnode_handle(node),
+		.ops	=3D &mvebu_sei_cp_domain_ops,
+	};
 	struct mvebu_sei *sei;
 	u32 parent_irq;
 	int ret;
@@ -402,7 +406,7 @@ static int mvebu_sei_probe(struct platform_device *pdev)
 	}
=20
 	/* Create the root SEI domain */
-	sei->sei_domain =3D irq_domain_create_linear(of_node_to_fwnode(node),
+	sei->sei_domain =3D irq_domain_create_linear(of_fwnode_handle(node),
 						   (sei->caps->ap_range.size +
 						    sei->caps->cp_range.size),
 						   &mvebu_sei_domain_ops,
@@ -418,7 +422,7 @@ static int mvebu_sei_probe(struct platform_device *pdev)
 	/* Create the 'wired' domain */
 	sei->ap_domain =3D irq_domain_create_hierarchy(sei->sei_domain, 0,
 						     sei->caps->ap_range.size,
-						     of_node_to_fwnode(node),
+						     of_fwnode_handle(node),
 						     &mvebu_sei_ap_domain_ops,
 						     sei);
 	if (!sei->ap_domain) {
@@ -430,21 +434,17 @@ static int mvebu_sei_probe(struct platform_device *pdev)
 	irq_domain_update_bus_token(sei->ap_domain, DOMAIN_BUS_WIRED);
=20
 	/* Create the 'MSI' domain */
-	sei->cp_domain =3D irq_domain_create_hierarchy(sei->sei_domain, 0,
-						     sei->caps->cp_range.size,
-						     of_node_to_fwnode(node),
-						     &mvebu_sei_cp_domain_ops,
-						     sei);
+	info.size =3D sei->caps->cp_range.size;
+	info.host_data =3D sei;
+	info.parent =3D sei->sei_domain;
+
+	sei->cp_domain =3D msi_create_parent_irq_domain(&info, &sei_msi_parent_ops);
 	if (!sei->cp_domain) {
 		pr_err("Failed to create CPs IRQ domain\n");
 		ret =3D -ENOMEM;
 		goto remove_ap_domain;
 	}
=20
-	irq_domain_update_bus_token(sei->cp_domain, DOMAIN_BUS_GENERIC_MSI);
-	sei->cp_domain->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
-	sei->cp_domain->msi_parent_ops =3D &sei_msi_parent_ops;
-
 	mvebu_sei_reset(sei);
=20
 	irq_set_chained_handler_and_data(parent_irq, mvebu_sei_handle_cascade_irq, =
sei);
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq=
-riscv-imsic-platform.c
index b8ae67c25b37..1b9fbfce9581 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -20,7 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/smp.h>
=20
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 #include "irq-riscv-imsic-state.h"
=20
 static bool imsic_cpu_page_phys(unsigned int cpu, unsigned int guest_index,
diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-ms=
i.c
index ee682e87eb8b..d641f3a5eee9 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -17,7 +17,7 @@
 #include <linux/property.h>
 #include <linux/slab.h>
=20
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
=20
 #define SG2042_MAX_MSI_VECTOR	32
=20
diff --git a/drivers/ntb/msi.c b/drivers/ntb/msi.c
index 6295e55ef85e..368f6d894bba 100644
--- a/drivers/ntb/msi.c
+++ b/drivers/ntb/msi.c
@@ -106,10 +106,10 @@ int ntb_msi_setup_mws(struct ntb_dev *ntb)
 	if (!ntb->msi)
 		return -EINVAL;
=20
-	msi_lock_descs(&ntb->pdev->dev);
-	desc =3D msi_first_desc(&ntb->pdev->dev, MSI_DESC_ASSOCIATED);
-	addr =3D desc->msg.address_lo + ((uint64_t)desc->msg.address_hi << 32);
-	msi_unlock_descs(&ntb->pdev->dev);
+	scoped_guard (msi_descs_lock, &ntb->pdev->dev) {
+		desc =3D msi_first_desc(&ntb->pdev->dev, MSI_DESC_ASSOCIATED);
+		addr =3D desc->msg.address_lo + ((uint64_t)desc->msg.address_hi << 32);
+	}
=20
 	for (peer =3D 0; peer < ntb_peer_port_count(ntb); peer++) {
 		peer_widx =3D ntb_peer_highest_mw_idx(ntb, peer);
@@ -289,7 +289,7 @@ int ntbm_msi_request_threaded_irq(struct ntb_dev *ntb, ir=
q_handler_t handler,
 	if (!ntb->msi)
 		return -EINVAL;
=20
-	msi_lock_descs(dev);
+	guard(msi_descs_lock)(dev);
 	msi_for_each_desc(entry, dev, MSI_DESC_ASSOCIATED) {
 		if (irq_has_action(entry->irq))
 			continue;
@@ -307,17 +307,11 @@ int ntbm_msi_request_threaded_irq(struct ntb_dev *ntb, =
irq_handler_t handler,
 		ret =3D ntbm_msi_setup_callback(ntb, entry, msi_desc);
 		if (ret) {
 			devm_free_irq(&ntb->dev, entry->irq, dev_id);
-			goto unlock;
+			return ret;
 		}
-
-		ret =3D entry->irq;
-		goto unlock;
+		return entry->irq;
 	}
-	ret =3D -ENODEV;
-
-unlock:
-	msi_unlock_descs(dev);
-	return ret;
+	return -ENODEV;
 }
 EXPORT_SYMBOL(ntbm_msi_request_threaded_irq);
=20
diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 9800b7681054..eb3cc28d43f8 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -40,6 +40,7 @@ config PCIE_APPLE
 	depends on OF
 	depends on PCI_MSI
 	select PCI_HOST_COMMON
+	select IRQ_MSI_LIB
 	help
 	  Say Y here if you want to enable PCIe controller support on Apple
 	  system-on-chips, like the Apple M1. This is required for the USB
@@ -227,6 +228,7 @@ config PCI_TEGRA
 	bool "NVIDIA Tegra PCIe controller"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on PCI_MSI
+	select IRQ_MSI_LIB
 	help
 	  Say Y here if you want support for the PCIe host controller found
 	  on NVIDIA Tegra SoCs.
@@ -303,6 +305,7 @@ config PCI_XGENE_MSI
 	bool "X-Gene v1 PCIe MSI feature"
 	depends on PCI_XGENE
 	depends on PCI_MSI
+	select IRQ_MSI_LIB
 	default y
 	help
 	  Say Y here if you want PCIe MSI support for the APM X-Gene v1 SoC.
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
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers/p=
ci/controller/mobiveil/pcie-mobiveil-host.c
index 0e088e74155d..6628eed9d26e 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -435,7 +435,7 @@ static const struct irq_domain_ops msi_domain_ops =3D {
 static int mobiveil_allocate_msi_domains(struct mobiveil_pcie *pcie)
 {
 	struct device *dev =3D &pcie->pdev->dev;
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(dev->of_node);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(dev->of_node);
 	struct mobiveil_msi *msi =3D &pcie->rp.msi;
=20
 	mutex_init(&msi->lock);
diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci=
-hyperv.c
index ac27bda5ba26..e1eaa24559a2 100644
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -3975,24 +3975,18 @@ static int hv_pci_restore_msi_msg(struct pci_dev *pde=
v, void *arg)
 {
 	struct irq_data *irq_data;
 	struct msi_desc *entry;
-	int ret =3D 0;
=20
 	if (!pdev->msi_enabled && !pdev->msix_enabled)
 		return 0;
=20
-	msi_lock_descs(&pdev->dev);
+	guard(msi_descs_lock)(&pdev->dev);
 	msi_for_each_desc(entry, &pdev->dev, MSI_DESC_ASSOCIATED) {
 		irq_data =3D irq_get_irq_data(entry->irq);
-		if (WARN_ON_ONCE(!irq_data)) {
-			ret =3D -EINVAL;
-			break;
-		}
-
+		if (WARN_ON_ONCE(!irq_data))
+			return -EINVAL;
 		hv_compose_msi_msg(irq_data, &entry->msg);
 	}
-	msi_unlock_descs(&pdev->dev);
-
-	return ret;
+	return 0;
 }
=20
 /*
diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-=
tegra.c
index d2f88997283a..467ddc701adc 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -22,6 +22,7 @@
 #include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -1547,7 +1548,7 @@ static void tegra_pcie_msi_irq(struct irq_desc *desc)
 			unsigned int index =3D i * 32 + offset;
 			int ret;
=20
-			ret =3D generic_handle_domain_irq(msi->domain->parent, index);
+			ret =3D generic_handle_domain_irq(msi->domain, index);
 			if (ret) {
 				/*
 				 * that's weird who triggered this?
@@ -1565,30 +1566,6 @@ static void tegra_pcie_msi_irq(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
=20
-static void tegra_msi_top_irq_ack(struct irq_data *d)
-{
-	irq_chip_ack_parent(d);
-}
-
-static void tegra_msi_top_irq_mask(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void tegra_msi_top_irq_unmask(struct irq_data *d)
-{
-	pci_msi_unmask_irq(d);
-	irq_chip_unmask_parent(d);
-}
-
-static struct irq_chip tegra_msi_top_chip =3D {
-	.name		=3D "Tegra PCIe MSI",
-	.irq_ack	=3D tegra_msi_top_irq_ack,
-	.irq_mask	=3D tegra_msi_top_irq_mask,
-	.irq_unmask	=3D tegra_msi_top_irq_unmask,
-};
-
 static void tegra_msi_irq_ack(struct irq_data *d)
 {
 	struct tegra_msi *msi =3D irq_data_get_irq_chip_data(d);
@@ -1690,42 +1667,40 @@ static const struct irq_domain_ops tegra_msi_domain_o=
ps =3D {
 	.free =3D tegra_msi_domain_free,
 };
=20
-static struct msi_domain_info tegra_msi_info =3D {
-	.flags	=3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_NO_AFFINITY | MSI_FLAG_PCI_MSIX,
-	.chip	=3D &tegra_msi_top_chip,
+static const struct msi_parent_ops tegra_msi_parent_ops =3D {
+	.supported_flags	=3D (MSI_GENERIC_FLAGS_MASK	|
+				   MSI_FLAG_PCI_MSIX),
+	.required_flags		=3D (MSI_FLAG_USE_DEF_DOM_OPS	|
+				   MSI_FLAG_USE_DEF_CHIP_OPS	|
+				   MSI_FLAG_PCI_MSI_MASK_PARENT	|
+				   MSI_FLAG_NO_AFFINITY),
+	.chip_flags		=3D MSI_CHIP_FLAG_SET_ACK,
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
=20
 static int tegra_allocate_domains(struct tegra_msi *msi)
 {
 	struct tegra_pcie *pcie =3D msi_to_pcie(msi);
 	struct fwnode_handle *fwnode =3D dev_fwnode(pcie->dev);
-	struct irq_domain *parent;
-
-	parent =3D irq_domain_create_linear(fwnode, INT_PCI_MSI_NR,
-					  &tegra_msi_domain_ops, msi);
-	if (!parent) {
-		dev_err(pcie->dev, "failed to create IRQ domain\n");
-		return -ENOMEM;
-	}
-	irq_domain_update_bus_token(parent, DOMAIN_BUS_NEXUS);
+	struct irq_domain_info info =3D {
+		.fwnode		=3D fwnode,
+		.ops		=3D &tegra_msi_domain_ops,
+		.size		=3D INT_PCI_MSI_NR,
+		.host_data	=3D msi,
+	};
=20
-	msi->domain =3D pci_msi_create_irq_domain(fwnode, &tegra_msi_info, parent);
+	msi->domain =3D msi_create_parent_irq_domain(&info, &tegra_msi_parent_ops);
 	if (!msi->domain) {
 		dev_err(pcie->dev, "failed to create MSI domain\n");
-		irq_domain_remove(parent);
 		return -ENOMEM;
 	}
-
 	return 0;
 }
=20
 static void tegra_free_domains(struct tegra_msi *msi)
 {
-	struct irq_domain *parent =3D msi->domain->parent;
-
 	irq_domain_remove(msi->domain);
-	irq_domain_remove(parent);
 }
=20
 static int tegra_pcie_msi_setup(struct tegra_pcie *pcie)
diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/=
pci-xgene-msi.c
index 7bce327897c9..b05ec8b0bb93 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/of_pci.h>
@@ -32,7 +33,6 @@ struct xgene_msi_group {
 struct xgene_msi {
 	struct device_node	*node;
 	struct irq_domain	*inner_domain;
-	struct irq_domain	*msi_domain;
 	u64			msi_addr;
 	void __iomem		*msi_regs;
 	unsigned long		*bitmap;
@@ -44,20 +44,6 @@ struct xgene_msi {
 /* Global data */
 static struct xgene_msi xgene_msi_ctrl;
=20
-static struct irq_chip xgene_msi_top_irq_chip =3D {
-	.name		=3D "X-Gene1 MSI",
-	.irq_enable	=3D pci_msi_unmask_irq,
-	.irq_disable	=3D pci_msi_mask_irq,
-	.irq_mask	=3D pci_msi_mask_irq,
-	.irq_unmask	=3D pci_msi_unmask_irq,
-};
-
-static struct  msi_domain_info xgene_msi_domain_info =3D {
-	.flags	=3D (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_PCI_MSIX),
-	.chip	=3D &xgene_msi_top_irq_chip,
-};
-
 /*
  * X-Gene v1 has 16 groups of MSI termination registers MSInIRx, where
  * n is group number (0..F), x is index of registers in each group (0..7)
@@ -235,34 +221,35 @@ static void xgene_irq_domain_free(struct irq_domain *do=
main,
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
=20
-static const struct irq_domain_ops msi_domain_ops =3D {
+static const struct irq_domain_ops xgene_msi_domain_ops =3D {
 	.alloc  =3D xgene_irq_domain_alloc,
 	.free   =3D xgene_irq_domain_free,
 };
=20
+static const struct msi_parent_ops xgene_msi_parent_ops =3D {
+	.supported_flags	=3D (MSI_GENERIC_FLAGS_MASK	|
+				   MSI_FLAG_PCI_MSIX),
+	.required_flags		=3D (MSI_FLAG_USE_DEF_DOM_OPS	|
+				   MSI_FLAG_USE_DEF_CHIP_OPS),
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
+};
+
 static int xgene_allocate_domains(struct xgene_msi *msi)
 {
-	msi->inner_domain =3D irq_domain_add_linear(NULL, NR_MSI_VEC,
-						  &msi_domain_ops, msi);
-	if (!msi->inner_domain)
-		return -ENOMEM;
-
-	msi->msi_domain =3D pci_msi_create_irq_domain(of_node_to_fwnode(msi->node),
-						    &xgene_msi_domain_info,
-						    msi->inner_domain);
-
-	if (!msi->msi_domain) {
-		irq_domain_remove(msi->inner_domain);
-		return -ENOMEM;
-	}
-
-	return 0;
+	struct irq_domain_info info =3D {
+		.fwnode		=3D of_fwnode_handle(msi->node),
+		.ops		=3D &xgene_msi_domain_ops,
+		.size		=3D NR_MSI_VEC,
+		.host_data	=3D msi,
+	};
+
+	msi->inner_domain =3D msi_create_parent_irq_domain(&info, &xgene_msi_parent=
_ops);
+	return msi->inner_domain ? 0 : -ENOMEM;
 }
=20
 static void xgene_free_domains(struct xgene_msi *msi)
 {
-	if (msi->msi_domain)
-		irq_domain_remove(msi->msi_domain);
 	if (msi->inner_domain)
 		irq_domain_remove(msi->inner_domain);
 }
diff --git a/drivers/pci/controller/pcie-altera-msi.c b/drivers/pci/controlle=
r/pcie-altera-msi.c
index e1cee3c0575f..5fb3a2e0017e 100644
--- a/drivers/pci/controller/pcie-altera-msi.c
+++ b/drivers/pci/controller/pcie-altera-msi.c
@@ -164,7 +164,7 @@ static const struct irq_domain_ops msi_domain_ops =3D {
=20
 static int altera_allocate_domains(struct altera_msi *msi)
 {
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(msi->pdev->dev.of_node);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(msi->pdev->dev.of_node);
=20
 	msi->inner_domain =3D irq_domain_add_linear(NULL, msi->num_of_vectors,
 					     &msi_domain_ops, msi);
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pci=
e-apple.c
index 18e11b9a7f46..3d412a931774 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -22,6 +22,7 @@
 #include <linux/kernel.h>
 #include <linux/iopoll.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -133,7 +134,6 @@ struct apple_pcie {
 	struct mutex		lock;
 	struct device		*dev;
 	void __iomem            *base;
-	struct irq_domain	*domain;
 	unsigned long		*bitmap;
 	struct list_head	ports;
 	struct completion	event;
@@ -162,27 +162,6 @@ static void rmw_clear(u32 clr, void __iomem *addr)
 	writel_relaxed(readl_relaxed(addr) & ~clr, addr);
 }
=20
-static void apple_msi_top_irq_mask(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void apple_msi_top_irq_unmask(struct irq_data *d)
-{
-	pci_msi_unmask_irq(d);
-	irq_chip_unmask_parent(d);
-}
-
-static struct irq_chip apple_msi_top_chip =3D {
-	.name			=3D "PCIe MSI",
-	.irq_mask		=3D apple_msi_top_irq_mask,
-	.irq_unmask		=3D apple_msi_top_irq_unmask,
-	.irq_eoi		=3D irq_chip_eoi_parent,
-	.irq_set_affinity	=3D irq_chip_set_affinity_parent,
-	.irq_set_type		=3D irq_chip_set_type_parent,
-};
-
 static void apple_msi_compose_msg(struct irq_data *data, struct msi_msg *msg)
 {
 	msg->address_hi =3D upper_32_bits(DOORBELL_ADDR);
@@ -226,8 +205,7 @@ static int apple_msi_domain_alloc(struct irq_domain *doma=
in, unsigned int virq,
=20
 	for (i =3D 0; i < nr_irqs; i++) {
 		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
-					      &apple_msi_bottom_chip,
-					      domain->host_data);
+					      &apple_msi_bottom_chip, pcie);
 	}
=20
 	return 0;
@@ -251,12 +229,6 @@ static const struct irq_domain_ops apple_msi_domain_ops =
=3D {
 	.free	=3D apple_msi_domain_free,
 };
=20
-static struct msi_domain_info apple_msi_info =3D {
-	.flags	=3D (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		   MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX),
-	.chip	=3D &apple_msi_top_chip,
-};
-
 static void apple_port_irq_mask(struct irq_data *data)
 {
 	struct apple_pcie_port *port =3D irq_data_get_irq_chip_data(data);
@@ -595,11 +567,28 @@ static int apple_pcie_setup_port(struct apple_pcie *pci=
e,
 	return 0;
 }
=20
+static const struct msi_parent_ops apple_msi_parent_ops =3D {
+	.supported_flags	=3D (MSI_GENERIC_FLAGS_MASK	|
+				   MSI_FLAG_PCI_MSIX		|
+				   MSI_FLAG_MULTI_PCI_MSI),
+	.required_flags		=3D (MSI_FLAG_USE_DEF_DOM_OPS	|
+				   MSI_FLAG_USE_DEF_CHIP_OPS	|
+				   MSI_FLAG_PCI_MSI_MASK_PARENT),
+	.chip_flags		=3D MSI_CHIP_FLAG_SET_EOI,
+	.bus_select_token	=3D DOMAIN_BUS_PCI_MSI,
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
+};
+
 static int apple_msi_init(struct apple_pcie *pcie)
 {
 	struct fwnode_handle *fwnode =3D dev_fwnode(pcie->dev);
+	struct irq_domain_info info =3D {
+		.fwnode		=3D fwnode,
+		.ops		=3D &apple_msi_domain_ops,
+		.size		=3D pcie->nvecs,
+		.host_data	=3D pcie,
+	};
 	struct of_phandle_args args =3D {};
-	struct irq_domain *parent;
 	int ret;
=20
 	ret =3D of_parse_phandle_with_args(to_of_node(fwnode), "msi-ranges",
@@ -619,28 +608,16 @@ static int apple_msi_init(struct apple_pcie *pcie)
 	if (!pcie->bitmap)
 		return -ENOMEM;
=20
-	parent =3D irq_find_matching_fwspec(&pcie->fwspec, DOMAIN_BUS_WIRED);
-	if (!parent) {
+	info.parent =3D irq_find_matching_fwspec(&pcie->fwspec, DOMAIN_BUS_WIRED);
+	if (!info.parent) {
 		dev_err(pcie->dev, "failed to find parent domain\n");
 		return -ENXIO;
 	}
=20
-	parent =3D irq_domain_create_hierarchy(parent, 0, pcie->nvecs, fwnode,
-					     &apple_msi_domain_ops, pcie);
-	if (!parent) {
+	if (!msi_create_parent_irq_domain(&info, &apple_msi_parent_ops)) {
 		dev_err(pcie->dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
 	}
-	irq_domain_update_bus_token(parent, DOMAIN_BUS_NEXUS);
-
-	pcie->domain =3D pci_msi_create_irq_domain(fwnode, &apple_msi_info,
-						 parent);
-	if (!pcie->domain) {
-		dev_err(pcie->dev, "failed to create MSI domain\n");
-		irq_domain_remove(parent);
-		return -ENOMEM;
-	}
-
 	return 0;
 }
=20
diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/p=
cie-brcmstb.c
index e19628e13898..924a81e073c0 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -581,7 +581,7 @@ static const struct irq_domain_ops msi_domain_ops =3D {
=20
 static int brcm_allocate_domains(struct brcm_msi *msi)
 {
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(msi->np);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(msi->np);
 	struct device *dev =3D msi->dev;
=20
 	msi->inner_domain =3D irq_domain_add_linear(NULL, msi->nr, &msi_domain_ops,=
 msi);
diff --git a/drivers/pci/controller/pcie-iproc-msi.c b/drivers/pci/controller=
/pcie-iproc-msi.c
index 649fcb449f34..804b3a5787c5 100644
--- a/drivers/pci/controller/pcie-iproc-msi.c
+++ b/drivers/pci/controller/pcie-iproc-msi.c
@@ -451,7 +451,7 @@ static int iproc_msi_alloc_domains(struct device_node *no=
de,
 	if (!msi->inner_domain)
 		return -ENOMEM;
=20
-	msi->msi_domain =3D pci_msi_create_irq_domain(of_node_to_fwnode(node),
+	msi->msi_domain =3D pci_msi_create_irq_domain(of_fwnode_handle(node),
 						    &iproc_msi_domain_info,
 						    msi->inner_domain);
 	if (!msi->msi_domain) {
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/=
pcie-mediatek.c
index 811a8b4acd50..efcc4a7c17be 100644
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
diff --git a/drivers/pci/controller/pcie-xilinx-dma-pl.c b/drivers/pci/contro=
ller/pcie-xilinx-dma-pl.c
index dd117f07fc95..71cf13ae51c7 100644
--- a/drivers/pci/controller/pcie-xilinx-dma-pl.c
+++ b/drivers/pci/controller/pcie-xilinx-dma-pl.c
@@ -470,7 +470,7 @@ static int xilinx_pl_dma_pcie_init_msi_irq_domain(struct =
pl_dma_pcie *port)
 	struct device *dev =3D port->dev;
 	struct xilinx_msi *msi =3D &port->msi;
 	int size =3D BITS_TO_LONGS(XILINX_NUM_MSI_IRQS) * sizeof(long);
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(port->dev->of_node);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(port->dev->of_node);
=20
 	msi->dev_domain =3D irq_domain_add_linear(NULL, XILINX_NUM_MSI_IRQS,
 						&dev_msi_domain_ops, port);
diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controlle=
r/pcie-xilinx-nwl.c
index 8d6e2a89b067..9cf8a96f7bc4 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -495,7 +495,7 @@ static int nwl_pcie_init_msi_irq_domain(struct nwl_pcie *=
pcie)
 {
 #ifdef CONFIG_PCI_MSI
 	struct device *dev =3D pcie->dev;
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(dev->of_node);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(dev->of_node);
 	struct nwl_msi *msi =3D &pcie->msi;
=20
 	msi->dev_domain =3D irq_domain_add_linear(NULL, INT_PCI_MSI_NR,
diff --git a/drivers/pci/controller/plda/pcie-plda-host.c b/drivers/pci/contr=
oller/plda/pcie-plda-host.c
index 4153214ca410..4c7a9fa311e3 100644
--- a/drivers/pci/controller/plda/pcie-plda-host.c
+++ b/drivers/pci/controller/plda/pcie-plda-host.c
@@ -150,7 +150,7 @@ static struct msi_domain_info plda_msi_domain_info =3D {
 static int plda_allocate_msi_domains(struct plda_pcie_rp *port)
 {
 	struct device *dev =3D port->dev;
-	struct fwnode_handle *fwnode =3D of_node_to_fwnode(dev->of_node);
+	struct fwnode_handle *fwnode =3D of_fwnode_handle(dev->of_node);
 	struct plda_msi *msi =3D &port->msi;
=20
 	mutex_init(&port->msi.lock);
diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index 17ec6332cb1d..818d55fbad0d 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -53,10 +53,9 @@ void pci_disable_msi(struct pci_dev *dev)
 	if (!pci_msi_enabled() || !dev || !dev->msi_enabled)
 		return;
=20
-	msi_lock_descs(&dev->dev);
+	guard(msi_descs_lock)(&dev->dev);
 	pci_msi_shutdown(dev);
 	pci_free_msi_irqs(dev);
-	msi_unlock_descs(&dev->dev);
 }
 EXPORT_SYMBOL(pci_disable_msi);
=20
@@ -196,10 +195,9 @@ void pci_disable_msix(struct pci_dev *dev)
 	if (!pci_msi_enabled() || !dev || !dev->msix_enabled)
 		return;
=20
-	msi_lock_descs(&dev->dev);
+	guard(msi_descs_lock)(&dev->dev);
 	pci_msix_shutdown(dev);
 	pci_free_msi_irqs(dev);
-	msi_unlock_descs(&dev->dev);
 }
 EXPORT_SYMBOL(pci_disable_msix);
=20
@@ -401,7 +399,7 @@ EXPORT_SYMBOL_GPL(pci_restore_msi_state);
  * Return: true if MSI has not been globally disabled through ACPI FADT,
  * PCI bridge quirks, or the "pci=3Dnomsi" kernel command-line option.
  */
-int pci_msi_enabled(void)
+bool pci_msi_enabled(void)
 {
 	return pci_msi_enable;
 }
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 6569ba3577fe..80ac764daaab 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -15,7 +15,7 @@
 #include "../pci.h"
 #include "msi.h"
=20
-int pci_msi_enable =3D 1;
+bool pci_msi_enable =3D true;
=20
 /**
  * pci_msi_supported - check whether MSI may be enabled on a device
@@ -335,43 +335,13 @@ static int msi_verify_entries(struct pci_dev *dev)
 	return !entry ? 0 : -EIO;
 }
=20
-/**
- * msi_capability_init - configure device's MSI capability structure
- * @dev: pointer to the pci_dev data structure of MSI device function
- * @nvec: number of interrupts to allocate
- * @affd: description of automatic IRQ affinity assignments (may be %NULL)
- *
- * Setup the MSI capability structure of the device with the requested
- * number of interrupts.  A return value of zero indicates the successful
- * setup of an entry with the new MSI IRQ.  A negative return value indicates
- * an error, and a positive return value indicates the number of interrupts
- * which could have been allocated.
- */
-static int msi_capability_init(struct pci_dev *dev, int nvec,
-			       struct irq_affinity *affd)
+static int __msi_capability_init(struct pci_dev *dev, int nvec, struct irq_a=
ffinity_desc *masks)
 {
-	struct irq_affinity_desc *masks =3D NULL;
+	int ret =3D msi_setup_msi_desc(dev, nvec, masks);
 	struct msi_desc *entry, desc;
-	int ret;
=20
-	/* Reject multi-MSI early on irq domain enabled architectures */
-	if (nvec > 1 && !pci_msi_domain_supports(dev, MSI_FLAG_MULTI_PCI_MSI, ALLOW=
_LEGACY))
-		return 1;
-
-	/*
-	 * Disable MSI during setup in the hardware, but mark it enabled
-	 * so that setup code can evaluate it.
-	 */
-	pci_msi_set_enable(dev, 0);
-	dev->msi_enabled =3D 1;
-
-	if (affd)
-		masks =3D irq_create_affinity_masks(nvec, affd);
-
-	msi_lock_descs(&dev->dev);
-	ret =3D msi_setup_msi_desc(dev, nvec, masks);
 	if (ret)
-		goto fail;
+		return ret;
=20
 	/* All MSIs are unmasked by default; mask them all */
 	entry =3D msi_first_desc(&dev->dev, MSI_DESC_ALL);
@@ -393,24 +363,51 @@ static int msi_capability_init(struct pci_dev *dev, int=
 nvec,
 		goto err;
=20
 	/* Set MSI enabled bits	*/
+	dev->msi_enabled =3D 1;
 	pci_intx_for_msi(dev, 0);
 	pci_msi_set_enable(dev, 1);
=20
 	pcibios_free_irq(dev);
 	dev->irq =3D entry->irq;
-	goto unlock;
-
+	return 0;
 err:
 	pci_msi_unmask(&desc, msi_multi_mask(&desc));
 	pci_free_msi_irqs(dev);
-fail:
-	dev->msi_enabled =3D 0;
-unlock:
-	msi_unlock_descs(&dev->dev);
-	kfree(masks);
 	return ret;
 }
=20
+/**
+ * msi_capability_init - configure device's MSI capability structure
+ * @dev: pointer to the pci_dev data structure of MSI device function
+ * @nvec: number of interrupts to allocate
+ * @affd: description of automatic IRQ affinity assignments (may be %NULL)
+ *
+ * Setup the MSI capability structure of the device with the requested
+ * number of interrupts.  A return value of zero indicates the successful
+ * setup of an entry with the new MSI IRQ.  A negative return value indicates
+ * an error, and a positive return value indicates the number of interrupts
+ * which could have been allocated.
+ */
+static int msi_capability_init(struct pci_dev *dev, int nvec,
+			       struct irq_affinity *affd)
+{
+	/* Reject multi-MSI early on irq domain enabled architectures */
+	if (nvec > 1 && !pci_msi_domain_supports(dev, MSI_FLAG_MULTI_PCI_MSI, ALLOW=
_LEGACY))
+		return 1;
+
+	/*
+	 * Disable MSI during setup in the hardware, but mark it enabled
+	 * so that setup code can evaluate it.
+	 */
+	pci_msi_set_enable(dev, 0);
+
+	struct irq_affinity_desc *masks __free(kfree) =3D
+		affd ? irq_create_affinity_masks(nvec, affd) : NULL;
+
+	guard(msi_descs_lock)(&dev->dev);
+	return __msi_capability_init(dev, nvec, masks);
+}
+
 int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
 			   struct irq_affinity *affd)
 {
@@ -663,38 +660,39 @@ static void msix_mask_all(void __iomem *base, int tsize)
 		writel(ctrl, base + PCI_MSIX_ENTRY_VECTOR_CTRL);
 }
=20
-static int msix_setup_interrupts(struct pci_dev *dev, struct msix_entry *ent=
ries,
-				 int nvec, struct irq_affinity *affd)
-{
-	struct irq_affinity_desc *masks =3D NULL;
-	int ret;
+DEFINE_FREE(free_msi_irqs, struct pci_dev *, if (_T) pci_free_msi_irqs(_T));
=20
-	if (affd)
-		masks =3D irq_create_affinity_masks(nvec, affd);
+static int __msix_setup_interrupts(struct pci_dev *__dev, struct msix_entry =
*entries,
+				   int nvec, struct irq_affinity_desc *masks)
+{
+	struct pci_dev *dev __free(free_msi_irqs) =3D __dev;
=20
-	msi_lock_descs(&dev->dev);
-	ret =3D msix_setup_msi_descs(dev, entries, nvec, masks);
+	int ret =3D msix_setup_msi_descs(dev, entries, nvec, masks);
 	if (ret)
-		goto out_free;
+		return ret;
=20
 	ret =3D pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
 	if (ret)
-		goto out_free;
+		return ret;
=20
 	/* Check if all MSI entries honor device restrictions */
 	ret =3D msi_verify_entries(dev);
 	if (ret)
-		goto out_free;
+		return ret;
=20
 	msix_update_entries(dev, entries);
-	goto out_unlock;
+	retain_and_null_ptr(dev);
+	return 0;
+}
=20
-out_free:
-	pci_free_msi_irqs(dev);
-out_unlock:
-	msi_unlock_descs(&dev->dev);
-	kfree(masks);
-	return ret;
+static int msix_setup_interrupts(struct pci_dev *dev, struct msix_entry *ent=
ries,
+				 int nvec, struct irq_affinity *affd)
+{
+	struct irq_affinity_desc *masks __free(kfree) =3D
+		affd ? irq_create_affinity_masks(nvec, affd) : NULL;
+
+	guard(msi_descs_lock)(&dev->dev);
+	return __msix_setup_interrupts(dev, entries, nvec, masks);
 }
=20
 /**
@@ -870,13 +868,13 @@ void __pci_restore_msix_state(struct pci_dev *dev)
=20
 	write_msg =3D arch_restore_msi_irqs(dev);
=20
-	msi_lock_descs(&dev->dev);
-	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
-		if (write_msg)
-			__pci_write_msi_msg(entry, &entry->msg);
-		pci_msix_write_vector_ctrl(entry, entry->pci.msix_ctrl);
+	scoped_guard (msi_descs_lock, &dev->dev) {
+		msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
+			if (write_msg)
+				__pci_write_msi_msg(entry, &entry->msg);
+			pci_msix_write_vector_ctrl(entry, entry->pci.msix_ctrl);
+		}
 	}
-	msi_unlock_descs(&dev->dev);
=20
 	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
 }
@@ -915,6 +913,53 @@ void pci_free_msi_irqs(struct pci_dev *dev)
 	}
 }
=20
+#ifdef CONFIG_PCIE_TPH
+/**
+ * pci_msix_write_tph_tag - Update the TPH tag for a given MSI-X vector
+ * @pdev:	The PCIe device to update
+ * @index:	The MSI-X index to update
+ * @tag:	The tag to write
+ *
+ * Returns: 0 on success, error code on failure
+ */
+int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigned int index, u16 tag)
+{
+	struct msi_desc *msi_desc;
+	struct irq_desc *irq_desc;
+	unsigned int virq;
+
+	if (!pdev->msix_enabled)
+		return -ENXIO;
+
+	guard(msi_descs_lock)(&pdev->dev);
+	virq =3D msi_get_virq(&pdev->dev, index);
+	if (!virq)
+		return -ENXIO;
+	/*
+	 * This is a horrible hack, but short of implementing a PCI
+	 * specific interrupt chip callback and a huge pile of
+	 * infrastructure, this is the minor nuissance. It provides the
+	 * protection against concurrent operations on this entry and keeps
+	 * the control word cache in sync.
+	 */
+	irq_desc =3D irq_to_desc(virq);
+	if (!irq_desc)
+		return -ENXIO;
+
+	guard(raw_spinlock_irq)(&irq_desc->lock);
+	msi_desc =3D irq_data_get_msi_desc(&irq_desc->irq_data);
+	if (!msi_desc || msi_desc->pci.msi_attrib.is_virtual)
+		return -ENXIO;
+
+	msi_desc->pci.msix_ctrl &=3D ~PCI_MSIX_ENTRY_CTRL_ST;
+	msi_desc->pci.msix_ctrl |=3D FIELD_PREP(PCI_MSIX_ENTRY_CTRL_ST, tag);
+	pci_msix_write_vector_ctrl(msi_desc, msi_desc->pci.msix_ctrl);
+	/* Flush the write */
+	readl(pci_msix_desc_addr(msi_desc));
+	return 0;
+}
+#endif
+
 /* Misc. infrastructure */
=20
 struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc)
@@ -925,5 +970,5 @@ EXPORT_SYMBOL(msi_desc_to_pci_dev);
=20
 void pci_no_msi(void)
 {
-	pci_msi_enable =3D 0;
+	pci_msi_enable =3D false;
 }
diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
index ee53cf079f4e..fc70b601e942 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -87,7 +87,7 @@ static inline __attribute_const__ u32 msi_multi_mask(struct=
 msi_desc *desc)
 void msix_prepare_msi_desc(struct pci_dev *dev, struct msi_desc *desc);
=20
 /* Subsystem variables */
-extern int pci_msi_enable;
+extern bool pci_msi_enable;
=20
 /* MSI internal functions invoked from the public APIs */
 void pci_msi_shutdown(struct pci_dev *dev);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index b81e99cd4b62..39f368d2f26d 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1064,6 +1064,15 @@ int pcim_request_region_exclusive(struct pci_dev *pdev=
, int bar,
 				  const char *name);
 void pcim_release_region(struct pci_dev *pdev, int bar);
=20
+#ifdef CONFIG_PCI_MSI
+int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigned int index, u16 tag=
);
+#else
+static inline int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigned int =
index, u16 tag)
+{
+	return -ENODEV;
+}
+#endif
+
 /*
  * Config Address for PCI Configuration Mechanism #1
  *
diff --git a/drivers/pci/tph.c b/drivers/pci/tph.c
index 07de59ca2ebf..77fce5e1b830 100644
--- a/drivers/pci/tph.c
+++ b/drivers/pci/tph.c
@@ -204,48 +204,6 @@ static u8 get_rp_completer_type(struct pci_dev *pdev)
 	return FIELD_GET(PCI_EXP_DEVCAP2_TPH_COMP_MASK, reg);
 }
=20
-/* Write ST to MSI-X vector control reg - Return 0 if OK, otherwise -errno */
-static int write_tag_to_msix(struct pci_dev *pdev, int msix_idx, u16 tag)
-{
-#ifdef CONFIG_PCI_MSI
-	struct msi_desc *msi_desc =3D NULL;
-	void __iomem *vec_ctrl;
-	u32 val;
-	int err =3D 0;
-
-	msi_lock_descs(&pdev->dev);
-
-	/* Find the msi_desc entry with matching msix_idx */
-	msi_for_each_desc(msi_desc, &pdev->dev, MSI_DESC_ASSOCIATED) {
-		if (msi_desc->msi_index =3D=3D msix_idx)
-			break;
-	}
-
-	if (!msi_desc) {
-		err =3D -ENXIO;
-		goto err_out;
-	}
-
-	/* Get the vector control register (offset 0xc) pointed by msix_idx */
-	vec_ctrl =3D pdev->msix_base + msix_idx * PCI_MSIX_ENTRY_SIZE;
-	vec_ctrl +=3D PCI_MSIX_ENTRY_VECTOR_CTRL;
-
-	val =3D readl(vec_ctrl);
-	val &=3D ~PCI_MSIX_ENTRY_CTRL_ST;
-	val |=3D FIELD_PREP(PCI_MSIX_ENTRY_CTRL_ST, tag);
-	writel(val, vec_ctrl);
-
-	/* Read back to flush the update */
-	val =3D readl(vec_ctrl);
-
-err_out:
-	msi_unlock_descs(&pdev->dev);
-	return err;
-#else
-	return -ENODEV;
-#endif
-}
-
 /* Write tag to ST table - Return 0 if OK, otherwise -errno */
 static int write_tag_to_st_table(struct pci_dev *pdev, int index, u16 tag)
 {
@@ -346,7 +304,7 @@ int pcie_tph_set_st_entry(struct pci_dev *pdev, unsigned =
int index, u16 tag)
=20
 	switch (loc) {
 	case PCI_TPH_LOC_MSIX:
-		err =3D write_tag_to_msix(pdev, index, tag);
+		err =3D pci_msix_write_tph_tag(pdev, index, tag);
 		break;
 	case PCI_TPH_LOC_CAP:
 		err =3D write_tag_to_st_table(pdev, index, tag);
diff --git a/drivers/soc/ti/ti_sci_inta_msi.c b/drivers/soc/ti/ti_sci_inta_ms=
i.c
index c36364522157..193266f5e3f9 100644
--- a/drivers/soc/ti/ti_sci_inta_msi.c
+++ b/drivers/soc/ti/ti_sci_inta_msi.c
@@ -103,19 +103,15 @@ int ti_sci_inta_msi_domain_alloc_irqs(struct device *de=
v,
 	if (ret)
 		return ret;
=20
-	msi_lock_descs(dev);
+	guard(msi_descs_lock)(dev);
 	nvec =3D ti_sci_inta_msi_alloc_descs(dev, res);
-	if (nvec <=3D 0) {
-		ret =3D nvec;
-		goto unlock;
-	}
+	if (nvec <=3D 0)
+		return nvec;
=20
 	/* Use alloc ALL as it's unclear whether there are gaps in the indices */
 	ret =3D msi_domain_alloc_irqs_all_locked(dev, MSI_DEFAULT_DOMAIN, nvec);
 	if (ret)
 		dev_err(dev, "Failed to allocate IRQs %d\n", ret);
-unlock:
-	msi_unlock_descs(dev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(ti_sci_inta_msi_domain_alloc_irqs);
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 1b37449fbffc..4c05b2dbe231 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1806,25 +1806,38 @@ static void ufs_qcom_write_msi_msg(struct msi_desc *d=
esc, struct msi_msg *msg)
 	ufshcd_mcq_config_esi(hba, msg);
 }
=20
+struct ufs_qcom_irq {
+	unsigned int		irq;
+	unsigned int		idx;
+	struct ufs_hba		*hba;
+};
+
 static irqreturn_t ufs_qcom_mcq_esi_handler(int irq, void *data)
 {
-	struct msi_desc *desc =3D data;
-	struct device *dev =3D msi_desc_to_dev(desc);
-	struct ufs_hba *hba =3D dev_get_drvdata(dev);
-	u32 id =3D desc->msi_index;
-	struct ufs_hw_queue *hwq =3D &hba->uhq[id];
+	struct ufs_qcom_irq *qi =3D data;
+	struct ufs_hba *hba =3D qi->hba;
+	struct ufs_hw_queue *hwq =3D &hba->uhq[qi->idx];
=20
-	ufshcd_mcq_write_cqis(hba, 0x1, id);
+	ufshcd_mcq_write_cqis(hba, 0x1, qi->idx);
 	ufshcd_mcq_poll_cqe_lock(hba, hwq);
=20
 	return IRQ_HANDLED;
 }
=20
+static void ufs_qcom_irq_free(struct ufs_qcom_irq *uqi)
+{
+	for (struct ufs_qcom_irq *q =3D uqi; q->irq; q++)
+		devm_free_irq(q->hba->dev, q->irq, q->hba);
+
+	platform_device_msi_free_irqs_all(uqi->hba->dev);
+	devm_kfree(uqi->hba->dev, uqi);
+}
+
+DEFINE_FREE(ufs_qcom_irq, struct ufs_qcom_irq *, if (_T) ufs_qcom_irq_free(_=
T))
+
 static int ufs_qcom_config_esi(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host =3D ufshcd_get_variant(hba);
-	struct msi_desc *desc;
-	struct msi_desc *failed_desc =3D NULL;
 	int nr_irqs, ret;
=20
 	if (host->esi_enabled)
@@ -1835,6 +1848,14 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 	 * 2. Poll queues do not need ESI.
 	 */
 	nr_irqs =3D hba->nr_hw_queues - hba->nr_queues[HCTX_TYPE_POLL];
+
+	struct ufs_qcom_irq *qi __free(ufs_qcom_irq) =3D
+		devm_kcalloc(hba->dev, nr_irqs, sizeof(*qi), GFP_KERNEL);
+	if (!qi)
+		return -ENOMEM;
+	/* Preset so __free() has a pointer to hba in all error paths */
+	qi[0].hba =3D hba;
+
 	ret =3D platform_device_msi_init_and_alloc_irqs(hba->dev, nr_irqs,
 						      ufs_qcom_write_msi_msg);
 	if (ret) {
@@ -1842,41 +1863,31 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 		return ret;
 	}
=20
-	msi_lock_descs(hba->dev);
-	msi_for_each_desc(desc, hba->dev, MSI_DESC_ALL) {
-		ret =3D devm_request_irq(hba->dev, desc->irq,
-				       ufs_qcom_mcq_esi_handler,
-				       IRQF_SHARED, "qcom-mcq-esi", desc);
+	for (int idx =3D 0; idx < nr_irqs; idx++) {
+		qi[idx].irq =3D msi_get_virq(hba->dev, idx);
+		qi[idx].idx =3D idx;
+		qi[idx].hba =3D hba;
+
+		ret =3D devm_request_irq(hba->dev, qi[idx].irq, ufs_qcom_mcq_esi_handler,
+				       IRQF_SHARED, "qcom-mcq-esi", qi + idx);
 		if (ret) {
 			dev_err(hba->dev, "%s: Fail to request IRQ for %d, err =3D %d\n",
-				__func__, desc->irq, ret);
-			failed_desc =3D desc;
-			break;
+				__func__, qi[idx].irq, ret);
+			qi[idx].irq =3D 0;
+			return ret;
 		}
 	}
-	msi_unlock_descs(hba->dev);
=20
-	if (ret) {
-		/* Rewind */
-		msi_lock_descs(hba->dev);
-		msi_for_each_desc(desc, hba->dev, MSI_DESC_ALL) {
-			if (desc =3D=3D failed_desc)
-				break;
-			devm_free_irq(hba->dev, desc->irq, hba);
-		}
-		msi_unlock_descs(hba->dev);
-		platform_device_msi_free_irqs_all(hba->dev);
-	} else {
-		if (host->hw_ver.major =3D=3D 6 && host->hw_ver.minor =3D=3D 0 &&
-		    host->hw_ver.step =3D=3D 0)
-			ufshcd_rmwl(hba, ESI_VEC_MASK,
-				    FIELD_PREP(ESI_VEC_MASK, MAX_ESI_VEC - 1),
-				    REG_UFS_CFG3);
-		ufshcd_mcq_enable_esi(hba);
-		host->esi_enabled =3D true;
-	}
+	retain_and_null_ptr(qi);
=20
-	return ret;
+	if (host->hw_ver.major =3D=3D 6 && host->hw_ver.minor =3D=3D 0 &&
+	    host->hw_ver.step =3D=3D 0) {
+		ufshcd_rmwl(hba, ESI_VEC_MASK, FIELD_PREP(ESI_VEC_MASK, MAX_ESI_VEC - 1),
+			    REG_UFS_CFG3);
+	}
+	ufshcd_mcq_enable_esi(hba);
+	host->esi_enabled =3D true;
+	return 0;
 }
=20
 static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long fr=
eq)
diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index 7e57047e1564..7093e1d08af0 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -216,6 +216,25 @@ const volatile void * __must_check_fn(const volatile voi=
d *val)
=20
 #define return_ptr(p)	return no_free_ptr(p)
=20
+/*
+ * Only for situations where an allocation is handed in to another function
+ * and consumed by that function on success.
+ *
+ *	struct foo *f __free(kfree) =3D kzalloc(sizeof(*f), GFP_KERNEL);
+ *
+ *	setup(f);
+ *	if (some_condition)
+ *		return -EINVAL;
+ *	....
+ *	ret =3D bar(f);
+ *	if (!ret)
+ *		retain_and_null_ptr(f);
+ *	return ret;
+ *
+ * After retain_and_null_ptr(f) the variable f is NULL and cannot be
+ * dereferenced anymore.
+ */
+#define retain_and_null_ptr(p)		((void)__get_and_null(p, NULL))
=20
 /*
  * DEFINE_CLASS(name, type, exit, init, init_args...):
diff --git a/drivers/irqchip/irq-msi-lib.h b/include/linux/irqchip/irq-msi-li=
b.h
similarity index 84%
rename from drivers/irqchip/irq-msi-lib.h
rename to include/linux/irqchip/irq-msi-lib.h
index 681ceabb7bc7..dd8d1d138544 100644
--- a/drivers/irqchip/irq-msi-lib.h
+++ b/include/linux/irqchip/irq-msi-lib.h
@@ -2,8 +2,8 @@
 // Copyright (C) 2022 Linutronix GmbH
 // Copyright (C) 2022 Intel
=20
-#ifndef _DRIVERS_IRQCHIP_IRQ_MSI_LIB_H
-#define _DRIVERS_IRQCHIP_IRQ_MSI_LIB_H
+#ifndef _IRQCHIP_IRQ_MSI_LIB_H
+#define _IRQCHIP_IRQ_MSI_LIB_H
=20
 #include <linux/bits.h>
 #include <linux/irqdomain.h>
@@ -24,4 +24,4 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct i=
rq_domain *domain,
 			       struct irq_domain *real_parent,
 			       struct msi_domain_info *info);
=20
-#endif /* _DRIVERS_IRQCHIP_IRQ_MSI_LIB_H */
+#endif /* _IRQCHIP_IRQ_MSI_LIB_H */
diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index bb7111105296..13cbacd1b5dc 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -231,6 +231,9 @@ enum {
 	/* Irq domain must destroy generic chips when removed */
 	IRQ_DOMAIN_FLAG_DESTROY_GC	=3D (1 << 10),
=20
+	/* Address and data pair is mutable when irq_set_affinity() */
+	IRQ_DOMAIN_FLAG_MSI_IMMUTABLE	=3D (1 << 11),
+
 	/*
 	 * Flags starting from IRQ_DOMAIN_FLAG_NONCORE are reserved
 	 * for implementation specific purposes and ignored by the
@@ -281,6 +284,8 @@ static inline struct fwnode_handle *irq_domain_alloc_fwno=
de(phys_addr_t *pa)
=20
 void irq_domain_free_fwnode(struct fwnode_handle *fwnode);
=20
+DEFINE_FREE(irq_domain_free_fwnode, struct fwnode_handle *, if (_T) irq_doma=
in_free_fwnode(_T))
+
 struct irq_domain_chip_generic_info;
=20
 /**
@@ -691,6 +696,10 @@ static inline bool irq_domain_is_msi_device(struct irq_d=
omain *domain)
 	return domain->flags & IRQ_DOMAIN_FLAG_MSI_DEVICE;
 }
=20
+static inline bool irq_domain_is_msi_immutable(struct irq_domain *domain)
+{
+	return domain->flags & IRQ_DOMAIN_FLAG_MSI_IMMUTABLE;
+}
 #else	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
 static inline int irq_domain_alloc_irqs(struct irq_domain *domain,
 			unsigned int nr_irqs, int node, void *arg)
diff --git a/include/linux/msi.h b/include/linux/msi.h
index 86e42742fd0f..6863540f4b71 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -229,8 +229,11 @@ struct msi_dev_domain {
=20
 int msi_setup_device_data(struct device *dev);
=20
-void msi_lock_descs(struct device *dev);
-void msi_unlock_descs(struct device *dev);
+void __msi_lock_descs(struct device *dev);
+void __msi_unlock_descs(struct device *dev);
+
+DEFINE_LOCK_GUARD_1(msi_descs_lock, struct device, __msi_lock_descs(_T->lock=
),
+		    __msi_unlock_descs(_T->lock));
=20
 struct msi_desc *msi_domain_first_desc(struct device *dev, unsigned int domi=
d,
 				       enum msi_desc_filter filter);
@@ -420,6 +423,7 @@ struct msi_domain_info;
  * @msi_init:		Domain specific init function for MSI interrupts
  * @msi_free:		Domain specific function to free a MSI interrupts
  * @msi_prepare:	Prepare the allocation of the interrupts in the domain
+ * @msi_teardown:	Reverse the effects of @msi_prepare
  * @prepare_desc:	Optional function to prepare the allocated MSI descriptor
  *			in the domain
  * @set_desc:		Set the msi descriptor for an interrupt
@@ -435,8 +439,9 @@ struct msi_domain_info;
  * @get_hwirq, @msi_init and @msi_free are callbacks used by the underlying
  * irqdomain.
  *
- * @msi_check, @msi_prepare, @prepare_desc and @set_desc are callbacks used =
by the
- * msi_domain_alloc/free_irqs*() variants.
+ * @msi_check, @msi_prepare, @msi_teardown, @prepare_desc and
+ * @set_desc are callbacks used by the msi_domain_alloc/free_irqs*()
+ * variants.
  *
  * @domain_alloc_irqs, @domain_free_irqs can be used to override the
  * default allocation/free functions (__msi_domain_alloc/free_irqs). This
@@ -458,6 +463,8 @@ struct msi_domain_ops {
 	int		(*msi_prepare)(struct irq_domain *domain,
 				       struct device *dev, int nvec,
 				       msi_alloc_info_t *arg);
+	void		(*msi_teardown)(struct irq_domain *domain,
+					msi_alloc_info_t *arg);
 	void		(*prepare_desc)(struct irq_domain *domain, msi_alloc_info_t *arg,
 					struct msi_desc *desc);
 	void		(*set_desc)(msi_alloc_info_t *arg,
@@ -486,6 +493,7 @@ struct msi_domain_ops {
  * @handler:		Optional: associated interrupt flow handler
  * @handler_data:	Optional: associated interrupt flow handler data
  * @handler_name:	Optional: associated interrupt flow handler name
+ * @alloc_data:		Optional: associated interrupt allocation data
  * @data:		Optional: domain specific data
  */
 struct msi_domain_info {
@@ -498,6 +506,7 @@ struct msi_domain_info {
 	irq_flow_handler_t		handler;
 	void				*handler_data;
 	const char			*handler_name;
+	msi_alloc_info_t		*alloc_data;
 	void				*data;
 };
=20
@@ -507,12 +516,14 @@ struct msi_domain_info {
  * @chip:	Interrupt chip for this domain
  * @ops:	MSI domain ops
  * @info:	MSI domain info data
+ * @alloc_info:	MSI domain allocation data (architecture specific)
  */
 struct msi_domain_template {
 	char			name[48];
 	struct irq_chip		chip;
 	struct msi_domain_ops	ops;
 	struct msi_domain_info	info;
+	msi_alloc_info_t	alloc_info;
 };
=20
 /*
@@ -625,6 +636,10 @@ struct irq_domain *msi_create_irq_domain(struct fwnode_h=
andle *fwnode,
 					 struct msi_domain_info *info,
 					 struct irq_domain *parent);
=20
+struct irq_domain_info;
+struct irq_domain *msi_create_parent_irq_domain(struct irq_domain_info *info,
+						const struct msi_parent_ops *msi_parent_ops);
+
 bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
 				  const struct msi_domain_template *template,
 				  unsigned int hwsize, void *domain_data,
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 0e8e3fd77e96..f5e908a56498 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1669,7 +1669,7 @@ void pci_disable_msi(struct pci_dev *dev);
 int pci_msix_vec_count(struct pci_dev *dev);
 void pci_disable_msix(struct pci_dev *dev);
 void pci_restore_msi_state(struct pci_dev *dev);
-int pci_msi_enabled(void);
+bool pci_msi_enabled(void);
 int pci_enable_msi(struct pci_dev *dev);
 int pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries,
 			  int minvec, int maxvec);
@@ -1702,7 +1702,7 @@ static inline void pci_disable_msi(struct pci_dev *dev)=
 { }
 static inline int pci_msix_vec_count(struct pci_dev *dev) { return -ENOSYS; }
 static inline void pci_disable_msix(struct pci_dev *dev) { }
 static inline void pci_restore_msi_state(struct pci_dev *dev) { }
-static inline int pci_msi_enabled(void) { return 0; }
+static inline bool pci_msi_enabled(void) { return false; }
 static inline int pci_enable_msi(struct pci_dev *dev)
 { return -ENOSYS; }
 static inline int pci_enable_msix_range(struct pci_dev *dev,
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 5c8d43cdb0a3..4830b7575e0a 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -59,7 +59,8 @@ struct msi_ctrl {
 static void msi_domain_free_locked(struct device *dev, struct msi_ctrl *ctrl=
);
 static unsigned int msi_domain_get_hwsize(struct device *dev, unsigned int d=
omid);
 static inline int msi_sysfs_create_group(struct device *dev);
-
+static int msi_domain_prepare_irqs(struct irq_domain *domain, struct device =
*dev,
+				   int nvec, msi_alloc_info_t *arg);
=20
 /**
  * msi_alloc_desc - Allocate an initialized msi_desc
@@ -343,26 +344,30 @@ int msi_setup_device_data(struct device *dev)
 }
=20
 /**
- * msi_lock_descs - Lock the MSI descriptor storage of a device
+ * __msi_lock_descs - Lock the MSI descriptor storage of a device
  * @dev:	Device to operate on
+ *
+ * Internal function for guard(msi_descs_lock). Don't use in code.
  */
-void msi_lock_descs(struct device *dev)
+void __msi_lock_descs(struct device *dev)
 {
 	mutex_lock(&dev->msi.data->mutex);
 }
-EXPORT_SYMBOL_GPL(msi_lock_descs);
+EXPORT_SYMBOL_GPL(__msi_lock_descs);
=20
 /**
- * msi_unlock_descs - Unlock the MSI descriptor storage of a device
+ * __msi_unlock_descs - Unlock the MSI descriptor storage of a device
  * @dev:	Device to operate on
+ *
+ * Internal function for guard(msi_descs_lock). Don't use in code.
  */
-void msi_unlock_descs(struct device *dev)
+void __msi_unlock_descs(struct device *dev)
 {
 	/* Invalidate the index which was cached by the iterator */
 	dev->msi.data->__iter_idx =3D MSI_XA_MAX_INDEX;
 	mutex_unlock(&dev->msi.data->mutex);
 }
-EXPORT_SYMBOL_GPL(msi_unlock_descs);
+EXPORT_SYMBOL_GPL(__msi_unlock_descs);
=20
 static struct msi_desc *msi_find_desc(struct msi_device_data *md, unsigned i=
nt domid,
 				      enum msi_desc_filter filter)
@@ -448,7 +453,6 @@ EXPORT_SYMBOL_GPL(msi_next_desc);
 unsigned int msi_domain_get_virq(struct device *dev, unsigned int domid, uns=
igned int index)
 {
 	struct msi_desc *desc;
-	unsigned int ret =3D 0;
 	bool pcimsi =3D false;
 	struct xarray *xa;
=20
@@ -462,7 +466,7 @@ unsigned int msi_domain_get_virq(struct device *dev, unsi=
gned int domid, unsigne
 	if (dev_is_pci(dev) && domid =3D=3D MSI_DEFAULT_DOMAIN)
 		pcimsi =3D to_pci_dev(dev)->msi_enabled;
=20
-	msi_lock_descs(dev);
+	guard(msi_descs_lock)(dev);
 	xa =3D &dev->msi.data->__domains[domid].store;
 	desc =3D xa_load(xa, pcimsi ? 0 : index);
 	if (desc && desc->irq) {
@@ -471,16 +475,12 @@ unsigned int msi_domain_get_virq(struct device *dev, un=
signed int domid, unsigne
 		 * PCI-MSIX and platform MSI use a descriptor per
 		 * interrupt.
 		 */
-		if (pcimsi) {
-			if (index < desc->nvec_used)
-				ret =3D desc->irq + index;
-		} else {
-			ret =3D desc->irq;
-		}
+		if (!pcimsi)
+			return desc->irq;
+		if (index < desc->nvec_used)
+			return desc->irq + index;
 	}
-
-	msi_unlock_descs(dev);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(msi_domain_get_virq);
=20
@@ -796,6 +796,10 @@ static int msi_domain_ops_prepare(struct irq_domain *dom=
ain, struct device *dev,
 	return 0;
 }
=20
+static void msi_domain_ops_teardown(struct irq_domain *domain, msi_alloc_inf=
o_t *arg)
+{
+}
+
 static void msi_domain_ops_set_desc(msi_alloc_info_t *arg,
 				    struct msi_desc *desc)
 {
@@ -821,6 +825,7 @@ static struct msi_domain_ops msi_domain_ops_default =3D {
 	.get_hwirq		=3D msi_domain_ops_get_hwirq,
 	.msi_init		=3D msi_domain_ops_init,
 	.msi_prepare		=3D msi_domain_ops_prepare,
+	.msi_teardown		=3D msi_domain_ops_teardown,
 	.set_desc		=3D msi_domain_ops_set_desc,
 };
=20
@@ -842,6 +847,8 @@ static void msi_domain_update_dom_ops(struct msi_domain_i=
nfo *info)
 		ops->msi_init =3D msi_domain_ops_default.msi_init;
 	if (ops->msi_prepare =3D=3D NULL)
 		ops->msi_prepare =3D msi_domain_ops_default.msi_prepare;
+	if (ops->msi_teardown =3D=3D NULL)
+		ops->msi_teardown =3D msi_domain_ops_default.msi_teardown;
 	if (ops->set_desc =3D=3D NULL)
 		ops->set_desc =3D msi_domain_ops_default.set_desc;
 }
@@ -904,6 +911,32 @@ struct irq_domain *msi_create_irq_domain(struct fwnode_h=
andle *fwnode,
 	return __msi_create_irq_domain(fwnode, info, 0, parent);
 }
=20
+/**
+ * msi_create_parent_irq_domain - Create an MSI-parent interrupt domain
+ * @info:		MSI irqdomain creation info
+ * @msi_parent_ops:	MSI parent callbacks and configuration
+ *
+ * Return: pointer to the created &struct irq_domain or %NULL on failure
+ */
+struct irq_domain *msi_create_parent_irq_domain(struct irq_domain_info *info,
+						const struct msi_parent_ops *msi_parent_ops)
+{
+	struct irq_domain *d;
+
+	info->hwirq_max		=3D max(info->hwirq_max, info->size);
+	info->size		=3D info->hwirq_max;
+	info->domain_flags	|=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
+	info->bus_token		=3D msi_parent_ops->bus_select_token;
+
+	d =3D irq_domain_instantiate(info);
+	if (IS_ERR(d))
+		return NULL;
+
+	d->msi_parent_ops =3D msi_parent_ops;
+	return d;
+}
+EXPORT_SYMBOL_GPL(msi_create_parent_irq_domain);
+
 /**
  * msi_parent_init_dev_msi_info - Delegate initialization of device MSI info=
 down
  *				  in the domain hierarchy
@@ -998,9 +1031,8 @@ bool msi_create_device_irq_domain(struct device *dev, un=
signed int domid,
 				  void *chip_data)
 {
 	struct irq_domain *domain, *parent =3D dev->msi.domain;
-	struct fwnode_handle *fwnode, *fwnalloced =3D NULL;
-	struct msi_domain_template *bundle;
 	const struct msi_parent_ops *pops;
+	struct fwnode_handle *fwnode;
=20
 	if (!irq_domain_is_msi_parent(parent))
 		return false;
@@ -1008,7 +1040,8 @@ bool msi_create_device_irq_domain(struct device *dev, u=
nsigned int domid,
 	if (domid >=3D MSI_MAX_DEVICE_IRQDOMAINS)
 		return false;
=20
-	bundle =3D kmemdup(template, sizeof(*bundle), GFP_KERNEL);
+	struct msi_domain_template *bundle __free(kfree) =3D
+		kmemdup(template, sizeof(*bundle), GFP_KERNEL);
 	if (!bundle)
 		return false;
=20
@@ -1017,6 +1050,7 @@ bool msi_create_device_irq_domain(struct device *dev, u=
nsigned int domid,
 	bundle->info.ops =3D &bundle->ops;
 	bundle->info.data =3D domain_data;
 	bundle->info.chip_data =3D chip_data;
+	bundle->info.alloc_data =3D &bundle->alloc_info;
=20
 	pops =3D parent->msi_parent_ops;
 	snprintf(bundle->name, sizeof(bundle->name), "%s%s-%s",
@@ -1031,41 +1065,43 @@ bool msi_create_device_irq_domain(struct device *dev,=
 unsigned int domid,
 	 * node as they are not guaranteed to have a fwnode. They are never
 	 * looked up and always handled in the context of the device.
 	 */
-	if (bundle->info.flags & MSI_FLAG_USE_DEV_FWNODE)
-		fwnode =3D dev->fwnode;
+	struct fwnode_handle *fwnode_alloced __free(irq_domain_free_fwnode) =3D NUL=
L;
+
+	if (!(bundle->info.flags & MSI_FLAG_USE_DEV_FWNODE))
+		fwnode =3D fwnode_alloced =3D irq_domain_alloc_named_fwnode(bundle->name);
 	else
-		fwnode =3D fwnalloced =3D irq_domain_alloc_named_fwnode(bundle->name);
+		fwnode =3D dev->fwnode;
=20
 	if (!fwnode)
-		goto free_bundle;
+		return false;
=20
 	if (msi_setup_device_data(dev))
-		goto free_fwnode;
-
-	msi_lock_descs(dev);
+		return false;
=20
+	guard(msi_descs_lock)(dev);
 	if (WARN_ON_ONCE(msi_get_device_domain(dev, domid)))
-		goto fail;
+		return false;
=20
 	if (!pops->init_dev_msi_info(dev, parent, parent, &bundle->info))
-		goto fail;
+		return false;
=20
 	domain =3D __msi_create_irq_domain(fwnode, &bundle->info, IRQ_DOMAIN_FLAG_M=
SI_DEVICE, parent);
 	if (!domain)
-		goto fail;
+		return false;
=20
 	domain->dev =3D dev;
 	dev->msi.data->__domains[domid].domain =3D domain;
-	msi_unlock_descs(dev);
-	return true;
=20
-fail:
-	msi_unlock_descs(dev);
-free_fwnode:
-	irq_domain_free_fwnode(fwnalloced);
-free_bundle:
-	kfree(bundle);
-	return false;
+	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {
+		dev->msi.data->__domains[domid].domain =3D NULL;
+		irq_domain_remove(domain);
+		return false;
+	}
+
+	/* @bundle and @fwnode_alloced are now in use. Prevent cleanup */
+	retain_and_null_ptr(bundle);
+	retain_and_null_ptr(fwnode_alloced);
+	return true;
 }
=20
 /**
@@ -1079,23 +1115,21 @@ void msi_remove_device_irq_domain(struct device *dev,=
 unsigned int domid)
 	struct msi_domain_info *info;
 	struct irq_domain *domain;
=20
-	msi_lock_descs(dev);
-
+	guard(msi_descs_lock)(dev);
 	domain =3D msi_get_device_domain(dev, domid);
-
 	if (!domain || !irq_domain_is_msi_device(domain))
-		goto unlock;
+		return;
=20
 	dev->msi.data->__domains[domid].domain =3D NULL;
 	info =3D domain->host_data;
+
+	info->ops->msi_teardown(domain, info->alloc_data);
+
 	if (irq_domain_is_msi_device(domain))
 		fwnode =3D domain->fwnode;
 	irq_domain_remove(domain);
 	irq_domain_free_fwnode(fwnode);
 	kfree(container_of(info, struct msi_domain_template, info));
-
-unlock:
-	msi_unlock_descs(dev);
 }
=20
 /**
@@ -1111,16 +1145,14 @@ bool msi_match_device_irq_domain(struct device *dev, =
unsigned int domid,
 {
 	struct msi_domain_info *info;
 	struct irq_domain *domain;
-	bool ret =3D false;
=20
-	msi_lock_descs(dev);
+	guard(msi_descs_lock)(dev);
 	domain =3D msi_get_device_domain(dev, domid);
 	if (domain && irq_domain_is_msi_device(domain)) {
 		info =3D domain->host_data;
-		ret =3D info->bus_token =3D=3D bus_token;
+		return info->bus_token =3D=3D bus_token;
 	}
-	msi_unlock_descs(dev);
-	return ret;
+	return false;
 }
=20
 static int msi_domain_prepare_irqs(struct irq_domain *domain, struct device =
*dev,
@@ -1238,6 +1270,24 @@ static int msi_init_virq(struct irq_domain *domain, in=
t virq, unsigned int vflag
 	return 0;
 }
=20
+static int populate_alloc_info(struct irq_domain *domain, struct device *dev,
+			       unsigned int nirqs, msi_alloc_info_t *arg)
+{
+	struct msi_domain_info *info =3D domain->host_data;
+
+	/*
+	 * If the caller has provided a template alloc info, use that. Once
+	 * all users of msi_create_irq_domain() have been eliminated, this
+	 * should be the only source of allocation information, and the
+	 * prepare call below should be finally removed.
+	 */
+	if (!info->alloc_data)
+		return msi_domain_prepare_irqs(domain, dev, nirqs, arg);
+
+	*arg =3D *info->alloc_data;
+	return 0;
+}
+
 static int __msi_domain_alloc_irqs(struct device *dev, struct irq_domain *do=
main,
 				   struct msi_ctrl *ctrl)
 {
@@ -1250,7 +1300,7 @@ static int __msi_domain_alloc_irqs(struct device *dev, =
struct irq_domain *domain
 	unsigned long idx;
 	int i, ret, virq;
=20
-	ret =3D msi_domain_prepare_irqs(domain, dev, ctrl->nirqs, &arg);
+	ret =3D populate_alloc_info(domain, dev, ctrl->nirqs, &arg);
 	if (ret)
 		return ret;
=20
@@ -1391,12 +1441,9 @@ int msi_domain_alloc_irqs_range_locked(struct device *=
dev, unsigned int domid,
 int msi_domain_alloc_irqs_range(struct device *dev, unsigned int domid,
 				unsigned int first, unsigned int last)
 {
-	int ret;
=20
-	msi_lock_descs(dev);
-	ret =3D msi_domain_alloc_irqs_range_locked(dev, domid, first, last);
-	msi_unlock_descs(dev);
-	return ret;
+	guard(msi_descs_lock)(dev);
+	return msi_domain_alloc_irqs_range_locked(dev, domid, first, last);
 }
 EXPORT_SYMBOL_GPL(msi_domain_alloc_irqs_range);
=20
@@ -1500,12 +1547,8 @@ struct msi_map msi_domain_alloc_irq_at(struct device *=
dev, unsigned int domid, u
 				       const struct irq_affinity_desc *affdesc,
 				       union msi_instance_cookie *icookie)
 {
-	struct msi_map map;
-
-	msi_lock_descs(dev);
-	map =3D __msi_domain_alloc_irq_at(dev, domid, index, affdesc, icookie);
-	msi_unlock_descs(dev);
-	return map;
+	guard(msi_descs_lock)(dev);
+	return __msi_domain_alloc_irq_at(dev, domid, index, affdesc, icookie);
 }
=20
 /**
@@ -1542,13 +1585,11 @@ int msi_device_domain_alloc_wired(struct irq_domain *=
domain, unsigned int hwirq,
=20
 	icookie.value =3D ((u64)type << 32) | hwirq;
=20
-	msi_lock_descs(dev);
+	guard(msi_descs_lock)(dev);
 	if (WARN_ON_ONCE(msi_get_device_domain(dev, domid) !=3D domain))
 		map.index =3D -EINVAL;
 	else
 		map =3D __msi_domain_alloc_irq_at(dev, domid, MSI_ANY_INDEX, NULL, &icooki=
e);
-	msi_unlock_descs(dev);
-
 	return map.index >=3D 0 ? map.virq : map.index;
 }
=20
@@ -1641,9 +1682,8 @@ void msi_domain_free_irqs_range_locked(struct device *d=
ev, unsigned int domid,
 void msi_domain_free_irqs_range(struct device *dev, unsigned int domid,
 				unsigned int first, unsigned int last)
 {
-	msi_lock_descs(dev);
+	guard(msi_descs_lock)(dev);
 	msi_domain_free_irqs_range_locked(dev, domid, first, last);
-	msi_unlock_descs(dev);
 }
 EXPORT_SYMBOL_GPL(msi_domain_free_irqs_all);
=20
@@ -1673,9 +1713,8 @@ void msi_domain_free_irqs_all_locked(struct device *dev=
, unsigned int domid)
  */
 void msi_domain_free_irqs_all(struct device *dev, unsigned int domid)
 {
-	msi_lock_descs(dev);
+	guard(msi_descs_lock)(dev);
 	msi_domain_free_irqs_all_locked(dev, domid);
-	msi_unlock_descs(dev);
 }
=20
 /**
@@ -1694,12 +1733,11 @@ void msi_device_domain_free_wired(struct irq_domain *=
domain, unsigned int virq)
 	if (WARN_ON_ONCE(!dev || !desc || domain->bus_token !=3D DOMAIN_BUS_WIRED_T=
O_MSI))
 		return;
=20
-	msi_lock_descs(dev);
-	if (!WARN_ON_ONCE(msi_get_device_domain(dev, MSI_DEFAULT_DOMAIN) !=3D domai=
n)) {
-		msi_domain_free_irqs_range_locked(dev, MSI_DEFAULT_DOMAIN, desc->msi_index,
-						  desc->msi_index);
-	}
-	msi_unlock_descs(dev);
+	guard(msi_descs_lock)(dev);
+	if (WARN_ON_ONCE(msi_get_device_domain(dev, MSI_DEFAULT_DOMAIN) !=3D domain=
))
+		return;
+	msi_domain_free_irqs_range_locked(dev, MSI_DEFAULT_DOMAIN, desc->msi_index,
+					  desc->msi_index);
 }
=20
 /**

