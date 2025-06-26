Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA6C38FB9
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949250; cv=none; b=XHLK9rYFSViKZE8qH5a5Hso8yiy/mZettHNpPFABgp2dYGo4WVHgrzsgiktYkkCE1H/pXkgyQ/9SaaySjbwI1AzZ5fbOEU7jKlJFYCiVedjIG78XlqYa/lmY8x1dMwSTBPFUkwBPmBsxT7Fr8FyEmv9iN5wvexWID2oM73Ee3XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949250; c=relaxed/simple;
	bh=9A8rDRB5JAKxiyQxkp7YY/08gjlR/5OKGAY/Lf8Px8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fAt3tvEGh5HYZ/nJSbkXfxl/AOIoebePZcYb5ZJl3CipqNGARApth/87DYnlohsxdVJ6VEgpx6KujDVXhmJ/7FR9sxoj3/YpxzwkjkcEx3LpAlEP3jt41QfeAHT4D9gY9c4UcWD43cl71lmzA3jRWvLPrgToo6i5dnfMgk0W810=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jDQ+2u2k; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5F8sRWmr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jDQ+2u2k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5F8sRWmr"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDxIO++GY8FMjy6mSWV6N8CwPnRb12rhzEwqT7d5d8I=;
	b=jDQ+2u2kIwJN2GJG1eu5PbEWUEkReN/NKeOSHg+fH+c+zSfuEYyWkINBtPOqfZ2SWS7ugJ
	wu0vV/vs9nlwp+aCsx+WlbzoizPIX3Vo9Wyt7JdprpF1zhEyQPCDDm5vJz75UMs+VlNhKs
	1h3TfoOn+uODe15AkYHGtso4blcXAy9Iqxsga/pG19wJrCQG2ORZ1Sg2pnG3Vnfy4eQPzO
	p6As4WI/0y0SMO5hFaUxw50dRz8do4v++8Gpegzjpnp0IWblCPSxrVSQZphhxdJIwcwOXn
	3b4q80yPrKw1GR6ABr2F+Jl6LMptdLSQoLbYMt9yx8zDDlB8MVaHy1MYbslMTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDxIO++GY8FMjy6mSWV6N8CwPnRb12rhzEwqT7d5d8I=;
	b=5F8sRWmrYgmfVkFSr3uM7oWPe9lJqW8By1M6Cvcuwg4wg3dYAMVHPB/lPSGjlJ5ram2QsP
	CvnjPzoGa0Kq+uDQ==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 1/1] um: virt-pci: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:47:15 +0200
Message-Id: <b911c2f15c031354850eee277a773832890c3c17.1750947651.git.namcao@linutronix.de>
In-Reply-To: <cover.1750947651.git.namcao@linutronix.de>
References: <cover.1750947651.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Move away from the legacy MSI domain setup, switch to use
msi_create_parent_irq_domain().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/um/drivers/Kconfig    |  1 +
 arch/um/drivers/virt-pci.c | 46 +++++++++++++++++++-------------------
 2 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/arch/um/drivers/Kconfig b/arch/um/drivers/Kconfig
index 34085bfc6d416..6a0354ca032fb 100644
--- a/arch/um/drivers/Kconfig
+++ b/arch/um/drivers/Kconfig
@@ -160,6 +160,7 @@ config UML_RTC
 config UML_PCI
 	bool
 	select FORCE_PCI
+	select IRQ_MSI_LIB
 	select UML_IOMEM_EMULATION
 	select UML_DMA_EMULATION
 	select PCI_MSI
diff --git a/arch/um/drivers/virt-pci.c b/arch/um/drivers/virt-pci.c
index 0fe207ca4b72e..e51a9357934da 100644
--- a/arch/um/drivers/virt-pci.c
+++ b/arch/um/drivers/virt-pci.c
@@ -7,6 +7,7 @@
 #include <linux/pci.h>
 #include <linux/logic_iomem.h>
 #include <linux/of_platform.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/msi.h>
 #include <linux/unaligned.h>
@@ -29,7 +30,6 @@ static struct um_pci_device *um_pci_platform_device;
 static struct um_pci_device_reg um_pci_devices[MAX_DEVICES];
 static struct fwnode_handle *um_pci_fwnode;
 static struct irq_domain *um_pci_inner_domain;
-static struct irq_domain *um_pci_msi_domain;
 static unsigned long um_pci_msi_used[BITS_TO_LONGS(MAX_MSI_VECTORS)];
=20
 static unsigned long um_pci_cfgspace_read(void *priv, unsigned int offset,
@@ -400,21 +400,25 @@ static void um_pci_inner_domain_free(struct irq_domai=
n *domain,
 }
=20
 static const struct irq_domain_ops um_pci_inner_domain_ops =3D {
+	.select =3D msi_lib_irq_domain_select,
 	.alloc =3D um_pci_inner_domain_alloc,
 	.free =3D um_pci_inner_domain_free,
 };
=20
-static struct irq_chip um_pci_msi_irq_chip =3D {
-	.name =3D "UM virtual PCIe MSI",
-	.irq_mask =3D pci_msi_mask_irq,
-	.irq_unmask =3D pci_msi_unmask_irq,
-};
-
-static struct msi_domain_info um_pci_msi_domain_info =3D {
-	.flags	=3D MSI_FLAG_USE_DEF_DOM_OPS |
-		  MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_PCI_MSIX,
-	.chip	=3D &um_pci_msi_irq_chip,
+#define UM_PCI_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS		| \
+				   MSI_FLAG_USE_DEF_CHIP_OPS		| \
+				   MSI_FLAG_PCI_MSI_MASK_PARENT		| \
+				   MSI_FLAG_NO_AFFINITY)
+#define UM_PCI_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK		| \
+				    MSI_FLAG_PCI_MSIX)
+
+static const struct msi_parent_ops um_pci_msi_parent_ops =3D {
+	.required_flags		=3D UM_PCI_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D UM_PCI_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	=3D DOMAIN_BUS_NEXUS,
+	.bus_select_mask	=3D MATCH_PCI_MSI,
+	.prefix			=3D "UM-virtual-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
=20
 static struct resource busn_resource =3D {
@@ -559,17 +563,14 @@ static int __init um_pci_init(void)
 		goto free;
 	}
=20
-	um_pci_inner_domain =3D irq_domain_create_linear(um_pci_fwnode, MAX_MSI_V=
ECTORS,
-						       &um_pci_inner_domain_ops, NULL);
-	if (!um_pci_inner_domain) {
-		err =3D -ENOMEM;
-		goto free;
-	}
+	struct irq_domain_info info =3D {
+		.fwnode		=3D um_pci_fwnode,
+		.ops		=3D &um_pci_inner_domain_ops,
+		.size		=3D MAX_MSI_VECTORS,
+	};
=20
-	um_pci_msi_domain =3D pci_msi_create_irq_domain(um_pci_fwnode,
-						      &um_pci_msi_domain_info,
-						      um_pci_inner_domain);
-	if (!um_pci_msi_domain) {
+	um_pci_inner_domain =3D msi_create_parent_irq_domain(&info, &um_pci_msi_p=
arent_ops);
+	if (!um_pci_inner_domain) {
 		err =3D -ENOMEM;
 		goto free;
 	}
@@ -611,7 +612,6 @@ device_initcall(um_pci_init);
=20
 static void __exit um_pci_exit(void)
 {
-	irq_domain_remove(um_pci_msi_domain);
 	irq_domain_remove(um_pci_inner_domain);
 	pci_free_resource_list(&bridge->windows);
 	pci_free_host_bridge(bridge);
--=20
2.39.5

