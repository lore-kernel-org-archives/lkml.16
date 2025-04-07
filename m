Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E767A1A8F93
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012015; cv=none; b=tRwAyefSSAioOwezPZv3QZ9komySdbIKM2bGWyOfyCQymxBdUgY+5rVML7beq40Ets352qUizHaNfVO0y2GI0tv8RiLux8X+zxnCUXsfjiBHcAY+vXIswSf0kraqYeULp0ttrrOS5ZkahYr18tCxy9f4JNPqjjQqPnaOUaaml9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012015; c=relaxed/simple;
	bh=D4+08A2fR3nzlDy7mOVuY1xaZjNLOm/j7uyfFXibono=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QgTJ1qtKyNSx6TPwWJZ1cOQwvMaWqXNaLw3st0BLUOGMQDRuXpKJAaEhMu9fWCpZKJhycGHkoIFptnBBwCimL3taAGbFiFMmhG3F9slACySYdSRg79+smZcd0D8SE2uBhPxtpc8e6Kkvv1eRC/xBMi/r9CseQ+bIV4Y26M0viTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuuU4vH3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuuU4vH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744012013; x=1775548013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D4+08A2fR3nzlDy7mOVuY1xaZjNLOm/j7uyfFXibono=;
  b=OuuU4vH3Nz5Q6cM7A/9+fMegZvewC54YOxip5wvyJ3MTYikN4pZmejE2
   +OlLYjIQK+NKAJBMjpmF5+HcHqUHO0qvVA3eQLogYqutIIc+Ju4NGBoAz
   wxOI14Ns3oDgez8h9NoLrDtlHQiVMVo0deEmiY567n7VxfW/krKYtcrKS
   mM9G++ATV3ilow+0xZZ8UWhcB6cKxicAhDVEV4xUIsg7Wap4oa5e0jjX9
   +pl9MkR+5L1PBLar8QhS1dNv+BrVxEqin5lj+TU/l/SSPT5pKMlA/be19
   3X90yOljlXMFWQgP9yndF1APB/9ra6AphXAQ63D11ii0QGSrWqDzpJAq7
   w==;
X-CSE-ConnectionGUID: Cjf76VbNSDKBjnf1Vo3M+Q==
X-CSE-MsgGUID: WWvXZFPXTB66lPGCdP5bcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49034928"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="49034928"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 00:46:52 -0700
X-CSE-ConnectionGUID: F3kE76roR0KGLpiiWcZtvw==
X-CSE-MsgGUID: BUB6Q2VUTwGCsl3y28Ua1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132845723"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa004.jf.intel.com with ESMTP; 07 Apr 2025 00:46:50 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: gregkh@linuxfoundation.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	lee@kernel.org,
	andriy.shevchenko@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] mfd: core: Support auxiliary device
Date: Mon,  7 Apr 2025 13:16:14 +0530
Message-Id: <20250407074614.1665575-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend MFD subsystem to support auxiliary child device. This is useful
for MFD usecases where parent device is on a discoverable bus and doesn't
fit into the platform device criteria. Purpose of this implementation is
to provide discoverable MFDs just enough infrastructure to register
independent child devices with their own memory and interrupt resources
without abusing the platform device.

Current support is limited to just PCI type MFDs, but this can be further
extended to support other types like USB in the future.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---

v2: Introduce a shared struct mfd_aux_device
    Introduce MFD_AUX_TYPE flag for auxiliary device opt-in

PS: I'm leaning towards not doing any of the ioremap or regmap on MFD
side and think that we should enforce child devices to not overlap.

If there's a need to handle common register access by parent device,
then I think it warrants its own driver which adds auxiliary devices
along with a custom interface to communicate with them, and MFD on
AUX is not the right solution for it.

Open to feedback/suggestions if it's still worth pursuing here.

 drivers/mfd/mfd-core.c   | 135 +++++++++++++++++++++++++++++++++++----
 include/linux/mfd/aux.h  |  30 +++++++++
 include/linux/mfd/core.h |   3 +
 3 files changed, 157 insertions(+), 11 deletions(-)
 create mode 100644 include/linux/mfd/aux.h

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 76bd316a50af..f38b5da6637e 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -10,8 +10,11 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/pci.h>
 #include <linux/list.h>
 #include <linux/property.h>
+#include <linux/mfd/aux.h>
 #include <linux/mfd/core.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
@@ -29,8 +32,15 @@ struct mfd_of_node_entry {
 	struct device_node *np;
 };
 
-static const struct device_type mfd_dev_type = {
-	.name	= "mfd_device",
+enum mfd_dev {
+	MFD_AUX_DEV,
+	MFD_PLAT_DEV,
+	MFD_MAX_DEV
+};
+
+static const struct device_type mfd_dev_type[MFD_MAX_DEV] = {
+	[MFD_AUX_DEV]	= { .name = "mfd_auxiliary_device" },
+	[MFD_PLAT_DEV]	= { .name = "mfd_platform_device" },
 };
 
 #if IS_ENABLED(CONFIG_ACPI)
@@ -136,10 +146,87 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 	return 0;
 }
 
-static int mfd_add_device(struct device *parent, int id,
-			  const struct mfd_cell *cell,
-			  struct resource *mem_base,
-			  int irq_base, struct irq_domain *domain)
+static void mfd_release_auxiliary_device(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct mfd_aux_device *mfd_aux = auxiliary_dev_to_mfd_aux_dev(auxdev);
+
+	kfree(mfd_aux);
+}
+
+static int mfd_add_auxiliary_device(struct device *parent, int id, const struct mfd_cell *cell,
+				    struct resource *mem_base, int irq_base,
+				    struct irq_domain *domain)
+{
+	struct mfd_aux_device *mfd_aux;
+	struct auxiliary_device *auxdev;
+	int r, ret;
+
+	mfd_aux = kzalloc(sizeof(*mfd_aux), GFP_KERNEL);
+	if (!mfd_aux)
+		return -ENOMEM;
+
+	for (r = 0; r < cell->num_resources; r++) {
+		/* Find out base to use */
+		if ((cell->resources[r].flags & IORESOURCE_MEM) && mem_base) {
+			mfd_aux->mem.name = cell->resources[r].name;
+			mfd_aux->mem.flags = cell->resources[r].flags;
+
+			mfd_aux->mem.parent = mem_base;
+			mfd_aux->mem.start = mem_base->start + cell->resources[r].start;
+			mfd_aux->mem.end = mem_base->start + cell->resources[r].end;
+		} else if (cell->resources[r].flags & IORESOURCE_IRQ) {
+			mfd_aux->irq.name = cell->resources[r].name;
+			mfd_aux->irq.flags = cell->resources[r].flags;
+
+			if (domain) {
+				/* Unable to create mappings for IRQ ranges */
+				WARN_ON(cell->resources[r].start != cell->resources[r].end);
+				mfd_aux->irq.start = mfd_aux->irq.end = irq_create_mapping(
+						domain, cell->resources[r].start);
+			} else {
+				mfd_aux->irq.start = irq_base + cell->resources[r].start;
+				mfd_aux->irq.end = irq_base + cell->resources[r].end;
+			}
+		} else {
+			mfd_aux->ext.name = cell->resources[r].name;
+			mfd_aux->ext.flags = cell->resources[r].flags;
+			mfd_aux->ext.parent = cell->resources[r].parent;
+			mfd_aux->ext.start = cell->resources[r].start;
+			mfd_aux->ext.end = cell->resources[r].end;
+		}
+	}
+
+	auxdev = &mfd_aux->auxdev;
+	auxdev->name = cell->name;
+	/* Use parent id for discoverable devices */
+	auxdev->id = dev_is_pci(parent) ? pci_dev_id(to_pci_dev(parent)) : cell->id;
+
+	auxdev->dev.parent = parent;
+	auxdev->dev.type = &mfd_dev_type[MFD_AUX_DEV];
+	auxdev->dev.release = mfd_release_auxiliary_device;
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret)
+		goto fail_aux_init;
+
+	ret = __auxiliary_device_add(auxdev, parent->driver->name);
+	if (ret)
+		goto fail_aux_add;
+
+	return 0;
+
+fail_aux_add:
+	/* auxdev will be freed with the put_device() and .release sequence */
+	auxiliary_device_uninit(auxdev);
+fail_aux_init:
+	kfree(mfd_aux);
+	return ret;
+}
+
+static int mfd_add_platform_device(struct device *parent, int id, const struct mfd_cell *cell,
+				   struct resource *mem_base, int irq_base,
+				   struct irq_domain *domain)
 {
 	struct resource *res;
 	struct platform_device *pdev;
@@ -168,7 +255,7 @@ static int mfd_add_device(struct device *parent, int id,
 		goto fail_device;
 
 	pdev->dev.parent = parent;
-	pdev->dev.type = &mfd_dev_type;
+	pdev->dev.type = &mfd_dev_type[MFD_PLAT_DEV];
 	pdev->dev.dma_mask = parent->dma_mask;
 	pdev->dev.dma_parms = parent->dma_parms;
 	pdev->dev.coherent_dma_mask = parent->coherent_dma_mask;
@@ -302,6 +389,16 @@ static int mfd_add_device(struct device *parent, int id,
 	return ret;
 }
 
+static int mfd_add_device(struct device *parent, int id, const struct mfd_cell *cells,
+			  struct resource *mem_base, int irq_base, struct irq_domain *domain)
+{
+	/* TODO: Convert the platform device abusers and remove this flag */
+	if (dev_is_pci(parent) && id == MFD_AUX_TYPE)
+		return mfd_add_auxiliary_device(parent, id, cells, mem_base, irq_base, domain);
+	else
+		return mfd_add_platform_device(parent, id, cells, mem_base, irq_base, domain);
+}
+
 /**
  * mfd_add_devices - register child devices
  *
@@ -340,16 +437,22 @@ int mfd_add_devices(struct device *parent, int id,
 }
 EXPORT_SYMBOL(mfd_add_devices);
 
-static int mfd_remove_devices_fn(struct device *dev, void *data)
+static int mfd_remove_auxiliary_device(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	auxiliary_device_delete(auxdev);
+	auxiliary_device_uninit(auxdev);
+	return 0;
+}
+
+static int mfd_remove_platform_device(struct device *dev, void *data)
 {
 	struct platform_device *pdev;
 	const struct mfd_cell *cell;
 	struct mfd_of_node_entry *of_entry, *tmp;
 	int *level = data;
 
-	if (dev->type != &mfd_dev_type)
-		return 0;
-
 	pdev = to_platform_device(dev);
 	cell = mfd_get_cell(pdev);
 
@@ -372,6 +475,16 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
 	return 0;
 }
 
+static int mfd_remove_devices_fn(struct device *dev, void *data)
+{
+	if (dev->type == &mfd_dev_type[MFD_AUX_DEV])
+		return mfd_remove_auxiliary_device(dev);
+	else if (dev->type == &mfd_dev_type[MFD_PLAT_DEV])
+		return mfd_remove_platform_device(dev, data);
+
+	return 0;
+}
+
 void mfd_remove_devices_late(struct device *parent)
 {
 	int level = MFD_DEP_LEVEL_HIGH;
diff --git a/include/linux/mfd/aux.h b/include/linux/mfd/aux.h
new file mode 100644
index 000000000000..ebc385203184
--- /dev/null
+++ b/include/linux/mfd/aux.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * MFD auxiliary device
+ *
+ * Copyright (c) 2025 Raag Jadav <raag.jadav@intel.com>
+ */
+
+#ifndef MFD_AUX_H
+#define MFD_AUX_H
+
+#include <linux/auxiliary_bus.h>
+#include <linux/ioport.h>
+#include <linux/types.h>
+
+#define auxiliary_dev_to_mfd_aux_dev(auxiliary_dev) \
+	container_of(auxiliary_dev, struct mfd_aux_device, auxdev)
+
+/*
+ * Common structure between MFD parent and auxiliary child device.
+ * To be used by leaf drivers to access child device resources.
+ */
+struct mfd_aux_device {
+	struct auxiliary_device auxdev;
+	struct resource	mem;
+	struct resource	irq;
+	/* Place holder for other types */
+	struct resource	ext;
+};
+
+#endif
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index faeea7abd688..ab516fc750e0 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -12,6 +12,9 @@
 
 #include <linux/platform_device.h>
 
+/* TODO: Convert the platform device abusers and remove this flag */
+#define MFD_AUX_TYPE	INT_MIN
+
 #define MFD_RES_SIZE(arr) (sizeof(arr) / sizeof(struct resource))
 
 #define MFD_CELL_ALL(_name, _res, _pdata, _pdsize, _id, _compat, _of_reg, _use_of_reg, _match) \
-- 
2.34.1

