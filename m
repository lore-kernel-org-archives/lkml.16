Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F751DF975
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678123; cv=none; b=ufuJmTgA30uq41P5nuCIZC5SimGrn9S3191B+6esAx5sZf6+ppRlSmXYlIdbd6Sq3q1wb6YQUQbyQG/HDL517WiU/TkS9Lh1Ik46S7kOjtrML/5PvjoWMehOwu3Ta1xQmh8hTfW9WbpGvXDQgdf0rLq+3sQT3V30AEuN7e6DHQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678123; c=relaxed/simple;
	bh=c/A55fIx11MxdVpvLdWlhNxgqd+FNKeSKE+b0rKyKps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CCkBM8k4IBDC8ptcw53DViiHtv4ND+brtVuXpErRAoCT9b4MO0Fgj69C5L+3HXP1Og6kDsGyundMt5qdZqPil6uQM17Q8/3ksKvtXle/rkN0Pb4e4taYe3UgfluDG+jmdgH9ndhvtkamt8ZQ8Uf4ZNJmUEO0/eRNANUSmNmdNds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuI0jKNh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuI0jKNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743678121; x=1775214121;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c/A55fIx11MxdVpvLdWlhNxgqd+FNKeSKE+b0rKyKps=;
  b=VuI0jKNheK+w/IRiVgVtejyBczLr2H/6UTg6UOd9IP5aFufzYzBevUUa
   vAd9BQYXS3zCPo6kEezLp2xzHzUN7ji7x8sSs+USHXwvO8R+KR8v1ut87
   b6epZ2F9B6JJBOd0/x3h9q6QbkypvjS7EYePtGq083UYYoHt083gqRP4t
   vSKjpv/EfRSUwBzIXA0wLUuXf5JE/1RDYImPybUzg5KJFSyPcqIQeR01W
   hzsEu4oKVQ3Z9LJG09kJpW1d37oarlpj7q6mlkEbgG2jbcsPq7VsP4RiE
   qulxiv3lBFKb6A2YOWLXQgF9RB9bdMAAKkG9N/IkaokhWZpprqdl/5xMU
   w==;
X-CSE-ConnectionGUID: mh4PSJ2vQlernoIoRRtqsg==
X-CSE-MsgGUID: WZB0tzXTQFqBey3Z1TG9kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="70446200"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="70446200"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 04:01:58 -0700
X-CSE-ConnectionGUID: zekwptUhQ1azRsBO8b9kNQ==
X-CSE-MsgGUID: TrutdP6USTSJBfT1UhBVQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="126930720"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa006.jf.intel.com with ESMTP; 03 Apr 2025 04:01:56 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: gregkh@linuxfoundation.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	lee@kernel.org,
	andriy.shevchenko@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] mfd: core: Support auxiliary device
Date: Thu,  3 Apr 2025 16:30:53 +0530
Message-Id: <20250403110053.1274521-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend MFD subsystem to support auxiliary child device. This is useful for
MFD usecases where parent device is on a discoverable bus and doesn't fit
into the platform device criteria. Current support is limited to just PCI
devices, but this can be further extended to support other types like USB
in the future.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---

I've been cooking this on my spare time during merge window. I'm not
very confident about this but thought I'd share it. It might be
controversial since I stole quite a bit from platform infrastructure,
so please consider this an RFC and let's discuss how to approach this.

More discussion at [*].
[*] https://lore.kernel.org/r/2025032609-query-limit-491b@gregkh

A few things that are still open,

1. Since we're doing it for PCI devices (Greg's recommendation), how do
   we force the existing ones to use their original platform path?

2. Should we allow auxiliary drivers to manage their own resources
   (MEM, IO, IRQ etc)?

 drivers/base/auxiliary.c      |  23 ++++++
 drivers/mfd/mfd-core.c        | 137 +++++++++++++++++++++++++++++++---
 include/linux/auxiliary_bus.h |   7 ++
 3 files changed, 156 insertions(+), 11 deletions(-)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index afa4df4c5a3f..16cfb615ac2b 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -335,6 +335,29 @@ int __auxiliary_device_add(struct auxiliary_device *auxdev, const char *modname)
 }
 EXPORT_SYMBOL_GPL(__auxiliary_device_add);
 
+/**
+ * auxiliary_get_resource - get a resource for a device
+ * @auxdev: auxiliary device
+ * @type: resource type
+ * @num: resource index
+ *
+ * Return: a pointer to the resource or NULL on failure.
+ */
+struct resource *auxiliary_get_resource(struct auxiliary_device *auxdev, unsigned int type,
+					unsigned int num)
+{
+	u32 i;
+
+	for (i = 0; i < auxdev->num_resources; i++) {
+		struct resource *r = &auxdev->resource[i];
+
+		if (type == resource_type(r) && num-- == 0)
+			return r;
+	}
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(auxiliary_get_resource);
+
 /**
  * __auxiliary_driver_register - register a driver for auxiliary bus devices
  * @auxdrv: auxiliary_driver structure
diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 76bd316a50af..414ef086ea1d 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -10,6 +10,8 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/pci.h>
 #include <linux/list.h>
 #include <linux/property.h>
 #include <linux/mfd/core.h>
@@ -29,8 +31,15 @@ struct mfd_of_node_entry {
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
@@ -136,10 +145,91 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 	return 0;
 }
 
-static int mfd_add_device(struct device *parent, int id,
-			  const struct mfd_cell *cell,
-			  struct resource *mem_base,
-			  int irq_base, struct irq_domain *domain)
+static void mfd_release_auxiliary_device(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	kfree(auxdev);
+}
+
+static int mfd_add_auxiliary_device(struct device *parent, int id, const struct mfd_cell *cell,
+				    struct resource *mem_base, int irq_base,
+				    struct irq_domain *domain)
+{
+	struct auxiliary_device *auxdev;
+	struct resource *res;
+	int r, ret = -ENOMEM;
+
+	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
+	if (!auxdev)
+		return ret;
+
+	res = kcalloc(cell->num_resources, sizeof(*res), GFP_KERNEL);
+	if (!res)
+		goto fail_alloc;
+
+	for (r = 0; r < cell->num_resources; r++) {
+		res[r].name = cell->resources[r].name;
+		res[r].flags = cell->resources[r].flags;
+
+		/* Find out base to use */
+		if ((cell->resources[r].flags & IORESOURCE_MEM) && mem_base) {
+			res[r].parent = mem_base;
+			res[r].start = mem_base->start +
+				cell->resources[r].start;
+			res[r].end = mem_base->start +
+				cell->resources[r].end;
+		} else if (cell->resources[r].flags & IORESOURCE_IRQ) {
+			if (domain) {
+				/* Unable to create mappings for IRQ ranges. */
+				WARN_ON(cell->resources[r].start !=
+					cell->resources[r].end);
+				res[r].start = res[r].end = irq_create_mapping(
+					domain, cell->resources[r].start);
+			} else {
+				res[r].start = irq_base +
+					cell->resources[r].start;
+				res[r].end   = irq_base +
+					cell->resources[r].end;
+			}
+		} else {
+			res[r].parent = cell->resources[r].parent;
+			res[r].start = cell->resources[r].start;
+			res[r].end   = cell->resources[r].end;
+		}
+	}
+
+	auxdev->name = cell->name;
+	auxdev->id = cell->id;
+	auxdev->resource = res;
+	auxdev->num_resources = cell->num_resources;
+	auxdev->dev.parent = parent;
+	auxdev->dev.type = &mfd_dev_type[MFD_AUX_DEV];
+	auxdev->dev.release = mfd_release_auxiliary_device;
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret)
+		goto fail_aux_init;
+
+	ret = auxiliary_device_add(auxdev);
+	if (ret)
+		goto fail_aux_add;
+
+	return 0;
+
+fail_aux_add:
+	/* auxdev will be freed with the put_device() and .release sequence */
+	auxiliary_device_uninit(auxdev);
+fail_aux_init:
+	kfree(res);
+fail_alloc:
+	kfree(auxdev);
+	return ret;
+}
+
+static int mfd_add_platform_device(struct device *parent, int id, const struct mfd_cell *cell,
+				   struct resource *mem_base, int irq_base,
+				   struct irq_domain *domain)
 {
 	struct resource *res;
 	struct platform_device *pdev;
@@ -168,7 +258,7 @@ static int mfd_add_device(struct device *parent, int id,
 		goto fail_device;
 
 	pdev->dev.parent = parent;
-	pdev->dev.type = &mfd_dev_type;
+	pdev->dev.type = &mfd_dev_type[MFD_PLAT_DEV];
 	pdev->dev.dma_mask = parent->dma_mask;
 	pdev->dev.dma_parms = parent->dma_parms;
 	pdev->dev.coherent_dma_mask = parent->coherent_dma_mask;
@@ -302,6 +392,15 @@ static int mfd_add_device(struct device *parent, int id,
 	return ret;
 }
 
+static int mfd_add_device(struct device *parent, int id, const struct mfd_cell *cells,
+			  struct resource *mem_base, int irq_base, struct irq_domain *domain)
+{
+	if (dev_is_pci(parent))
+		return mfd_add_auxiliary_device(parent, id, cells, mem_base, irq_base, domain);
+	else
+		return mfd_add_platform_device(parent, id, cells, mem_base, irq_base, domain);
+}
+
 /**
  * mfd_add_devices - register child devices
  *
@@ -340,16 +439,22 @@ int mfd_add_devices(struct device *parent, int id,
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
 
@@ -372,6 +477,16 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
 	return 0;
 }
 
+static int mfd_remove_devices_fn(struct device *dev, void *data)
+{
+	if (dev->type == &mfd_dev_type[MFD_AUX_DEV])
+		return mfd_remove_auxiliary_device(dev);
+	else if (dev->type == &mfd_dev_type[MFD_PLAT_DEV])
+		return mfd_remove_platform_device(dev, data);
+	else
+		return 0;
+}
+
 void mfd_remove_devices_late(struct device *parent)
 {
 	int level = MFD_DEP_LEVEL_HIGH;
diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
index 65dd7f154374..11c058e49a3c 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -148,6 +148,8 @@ struct auxiliary_device {
 		struct mutex lock; /* Synchronize irq sysfs creation */
 		bool irq_dir_exists;
 	} sysfs;
+	u32 num_resources;
+	struct resource	*resource;
 };
 
 /**
@@ -220,6 +222,8 @@ static inline const struct auxiliary_driver *to_auxiliary_drv(const struct devic
 int auxiliary_device_init(struct auxiliary_device *auxdev);
 int __auxiliary_device_add(struct auxiliary_device *auxdev, const char *modname);
 #define auxiliary_device_add(auxdev) __auxiliary_device_add(auxdev, KBUILD_MODNAME)
+struct resource *auxiliary_get_resource(struct auxiliary_device *auxdev, unsigned int type,
+					unsigned int num);
 
 #ifdef CONFIG_SYSFS
 int auxiliary_device_sysfs_irq_add(struct auxiliary_device *auxdev, int irq);
@@ -238,6 +242,9 @@ auxiliary_device_sysfs_irq_remove(struct auxiliary_device *auxdev, int irq) {}
 
 static inline void auxiliary_device_uninit(struct auxiliary_device *auxdev)
 {
+	if (auxdev->resource)
+		kfree(auxdev->resource);
+
 	mutex_destroy(&auxdev->sysfs.lock);
 	put_device(&auxdev->dev);
 }
-- 
2.34.1

