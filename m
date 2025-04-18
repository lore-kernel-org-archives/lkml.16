Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4475678F3B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744979750; cv=none; b=DQyV32SAqWYcspSzLvxXRz6a9WwpVxnlTv4zMb14UmLTN4pCuX9Rb7pkb/7u4CIRrTTUk1Yd1w80lye6rh9k+FI4hznMum1t1g8RLN2XwbsmmucSop1GPszAr8eloqanF3nonz9rdIxxFOQHvcVSA1W2xAupuPbGMhpm1wXcRH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744979750; c=relaxed/simple;
	bh=Ri+MFqoimvVwoyn+O8wjRhQJH8YuG78xibiFhwSj/vo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sgLU/8qXLaLCKNy1S8bR4tcea3gdV1b5lMzvyFfdc0C9O9JQt6Ny651aaWoSPTzxS96yd4xT7d0zoqm9vwP4RtVwBK/J6RpHpj2WD6z8wJchyMj2GMrYzNe3+5gc4R1MHRTTBXkryt7hUH6XfssuZ2veiCuAMEUTPF5lW4O7CJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iozACYlE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iozACYlE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744979748; x=1776515748;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ri+MFqoimvVwoyn+O8wjRhQJH8YuG78xibiFhwSj/vo=;
  b=iozACYlEqYJxDwZFhrx7CwGOLZaPs64OpoFhw4rGbeGyYFgHEmY/s1IO
   AhFa/XkooZToaq3eIFShntsBLFsvtMjnmcWBdR3OmUbnIsuYGIhxGAjBm
   kJ/p5QqLKc2oFAedOM7KbN9mfEbs6GtaGHpbAgaevTw9J1+0XIBAh1RRZ
   Osx2Cy7xtSq/HqUDjWsY1mhnK7f33puR4qn1OXJpjgx/jm1+UPUJdqoR3
   woLZCs3f5DmP+1SYwKl0aajNBddTrgpO/N/o+uZJICDqMZkC6sWxK0gp7
   O+oadope4l0H1h5+SmDr2CVJ6V4A22D8JqD6NDrIkCdM+rtwNRDAa0535
   g==;
X-CSE-ConnectionGUID: uiw1kFcJR0i7XRJnQ5E8XQ==
X-CSE-MsgGUID: rIRCa1cKQSi8YWw0rt9x8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50406376"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="50406376"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 05:35:48 -0700
X-CSE-ConnectionGUID: JQF4jjTlQP6QkeC0KWmr4w==
X-CSE-MsgGUID: lu6XsW9ZQH+eTJ4dUx7CrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="131123144"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa007.fm.intel.com with ESMTP; 18 Apr 2025 05:35:44 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: gregkh@linuxfoundation.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	lee@kernel.org,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	heikki.krogerus@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3] mfd: core: Support auxiliary device
Date: Fri, 18 Apr 2025 18:04:33 +0530
Message-Id: <20250418123433.2586383-1-raag.jadav@intel.com>
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

v3: Fix device_type ABI breakage (Andy)
    Aesthetic adjustments (Andy)

PS: I'm leaning towards leaving the ioremap or regmap complexity out of
MFD core and think that we should enforce child devices to not overlap.

If there's a need to handle common register access by parent device, then
I think it warrants its own driver which adds auxiliary devices along with
a custom interface to communicate with them without involving MFD core.

 drivers/mfd/Kconfig      |   1 +
 drivers/mfd/mfd-core.c   | 123 ++++++++++++++++++++++++++++++++++++---
 include/linux/mfd/aux.h  |  30 ++++++++++
 include/linux/mfd/core.h |   3 +
 4 files changed, 149 insertions(+), 8 deletions(-)
 create mode 100644 include/linux/mfd/aux.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 93773201a517..8c8e6797307c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -8,6 +8,7 @@ menu "Multifunction device drivers"
 
 config MFD_CORE
 	tristate
+	select AUXILIARY_BUS
 	select IRQ_DOMAIN
 	default n
 
diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 76bd316a50af..fc6a34a045be 100644
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
@@ -136,10 +139,87 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
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
+	auxdev->dev.type = &mfd_dev_type;
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
@@ -302,6 +382,16 @@ static int mfd_add_device(struct device *parent, int id,
 	return ret;
 }
 
+static int mfd_add_device(struct device *parent, int id, const struct mfd_cell *cells,
+			  struct resource *mem_base, int irq_base, struct irq_domain *domain)
+{
+	/* TODO: Convert the platform device abusers and remove this flag */
+	if (dev_is_pci(parent) && id == MFD_AUX_TYPE)
+		return mfd_add_auxiliary_device(parent, id, cells, mem_base, irq_base, domain);
+
+	return mfd_add_platform_device(parent, id, cells, mem_base, irq_base, domain);
+}
+
 /**
  * mfd_add_devices - register child devices
  *
@@ -340,16 +430,22 @@ int mfd_add_devices(struct device *parent, int id,
 }
 EXPORT_SYMBOL(mfd_add_devices);
 
-static int mfd_remove_devices_fn(struct device *dev, void *data)
+static int mfd_remove_auxiliary_device(struct device *dev, void *data)
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
 
@@ -372,6 +468,17 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
 	return 0;
 }
 
+static int mfd_remove_devices_fn(struct device *dev, void *data)
+{
+	if (dev->type != &mfd_dev_type)
+		return 0;
+
+	if (dev->bus == &platform_bus_type)
+		return mfd_remove_platform_device(dev, data);
+
+	return mfd_remove_auxiliary_device(dev, data);
+}
+
 void mfd_remove_devices_late(struct device *parent)
 {
 	int level = MFD_DEP_LEVEL_HIGH;
diff --git a/include/linux/mfd/aux.h b/include/linux/mfd/aux.h
new file mode 100644
index 000000000000..826a0a05e9e9
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
+#include <linux/container_of.h>
+#include <linux/ioport.h>
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
+#define auxiliary_dev_to_mfd_aux_dev(auxiliary_dev) \
+	container_of(auxiliary_dev, struct mfd_aux_device, auxdev)
+
+#endif
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index faeea7abd688..96f6ff98a111 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -12,6 +12,9 @@
 
 #include <linux/platform_device.h>
 
+/* TODO: Convert the platform device abusers and remove this flag */
+#define MFD_AUX_TYPE	BIT(31)
+
 #define MFD_RES_SIZE(arr) (sizeof(arr) / sizeof(struct resource))
 
 #define MFD_CELL_ALL(_name, _res, _pdata, _pdsize, _id, _compat, _of_reg, _use_of_reg, _match) \
-- 
2.34.1

