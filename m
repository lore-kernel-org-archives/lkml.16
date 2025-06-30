Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFE21A257D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266292; cv=none; b=QBqBZtqtn5jR6dy7qJZpeUxC3IPYl7pDqCYvcQqSZbYhrfA1cv/1mbTBgY37y+pXUT9Xi4ibT8bfioZJT348ADgsrW8wSnEmCT8DUrhunMjNxPyKC36kjfzqt66yffkXnTyy7ArFFsEh+XTRwKgnu7bSNyIPIyqxq5yQnULQkmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266292; c=relaxed/simple;
	bh=BzhPArKXxXWUVKdFkO1zizYe0sqW265TqdWuhet1Cy4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qh8EvQPfk7nX48sZzcL7/tvDRV1O3FgICI1eGmzUury68uahqlg1ANzaPtBHuKRf0586HJ8aoRUBEtl7GmDD9uGG4yalBSocGOyEtarBXQaIllN+aqzjsjX+KgpYPKzSM+diOair05Rr4mDXFzOJrzYP7tbHOfx3Ry8tOGSiVU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RRUMa0C2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cgf9UWkI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RRUMa0C2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cgf9UWkI"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751266288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sm6jHzdEvHenVHHRLowXCnjdqr4oxLjS3mo+byur4bc=;
	b=RRUMa0C24tQ/MofMeF/YCqAlIosDHVHlRjq559dBe77Fnzf72Ovu5Zg4dnLf+0izU0RJqM
	H6/QRfzHizkCK21RUbgeLTcsXhtxGwfg38iCTCRZgmT4/FUiVZwMj/Fnfqb0WpGA3pYfxk
	lG9GoavtJD8WfJI6gtcaqu6inrWofOV3o/kDNeamtngxd74l8kzsZoAdfVuUXogJOowHc0
	8EsvEBGvGytMNFprSpt9Sjntmzil8Mu2w3iacblHWuzcZh4lkjy9TPdS56mYaojIGPSJ5S
	WlgbtZwNBk0Af/7nb5DDsC/mje0kXRKO6jUSf0p/egw9gdIqPhVowCgpLICuGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751266288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sm6jHzdEvHenVHHRLowXCnjdqr4oxLjS3mo+byur4bc=;
	b=cgf9UWkIiIH8RHBZ6faWqtG9Pp/LGBN8BuE2ZQEYAXh/TzzNF/zcxXHWHuztEDPqkvdCrn
	oZAB3G2YQkWJ/UCA==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 1/1] um: virt-pci: Switch to msi_create_parent_irq_domain()
Date: Mon, 30 Jun 2025 08:51:16 +0200
Message-Id: <5f0bd8e877e7bfdfb1a7e99d6b126caf6a7eea48.1751266049.git.namcao@linutronix.de>
In-Reply-To: <cover.1751266049.git.namcao@linutronix.de>
References: <cover.1751266049.git.namcao@linutronix.de>
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
v2: Remove MSI_FLAG_PCI_MSI_MASK_PARENT to fix a NULL pointer deref
---
 arch/um/drivers/Kconfig    |  1 +
 arch/um/drivers/virt-pci.c | 45 +++++++++++++++++++-------------------
 2 files changed, 23 insertions(+), 23 deletions(-)

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
index 0fe207ca4b72e..557d93aea00a1 100644
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
@@ -400,21 +400,24 @@ static void um_pci_inner_domain_free(struct irq_domai=
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
@@ -559,17 +562,14 @@ static int __init um_pci_init(void)
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
@@ -611,7 +611,6 @@ device_initcall(um_pci_init);
=20
 static void __exit um_pci_exit(void)
 {
-	irq_domain_remove(um_pci_msi_domain);
 	irq_domain_remove(um_pci_inner_domain);
 	pci_free_resource_list(&bridge->windows);
 	pci_free_host_bridge(bridge);
--=20
2.39.5

