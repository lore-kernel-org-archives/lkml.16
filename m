Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C5422A4EA
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747225593; cv=none; b=dOX86rStH2fveu6IkpvAP93irERE3tZQaTzFiDj1EqzxQqHfbmXayG9dTZRol/lBMKZdyH0WjyDhHzwZsLXHKogeg8l9XKzUnJlqRk3/9czAqVouuvK4PbnT0hxWqMeL95pk8SHCT5x0ggKd5hbQarmrANSvEVq54463A5mKk88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747225593; c=relaxed/simple;
	bh=QM3FL+BY//hfpGJznOviWt6mq1QiVU6+56YTt5XPeTk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nkXw22LLYFQcbGpRS3Be9B466Mx5+8Ni9lfvCe4qKW4HpB470Z7XOwt3Tryvqdmpw/OHf0zgcD1zB0jIjxHNQ+L/kOy28Nkq47PoVPgNuxYW+ynkf7IUjfSUsacMqDTlHMlYMjIiT6gaBV3XXJtE3q8RBOtCFahGxKxoI/EomGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVPBBlK5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVPBBlK5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747225591; x=1778761591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QM3FL+BY//hfpGJznOviWt6mq1QiVU6+56YTt5XPeTk=;
  b=iVPBBlK5MiD2c5ftrN6cV1K9QicwrGFs8xhr+HbX3bT0ilRGGrQvWzDp
   IhNc9MLI70MLCo7jQuv+MacFJTDGGnwlFrMUIQsCm4gOusUGSEwOLq9Ei
   7mWkar20lT04YDtmAh6whOAaYA+U2CP8xuy9fUkhcfdC2BQfjRfHOA6Ls
   Kv+bh2lmy5Y9wdnSscc0CeARjQHuI16rW6MKkfqmvr9Zk8FV4/KSU531T
   2V6PjTIST88oWaISmqsyAz5cwSCcz2YxWjSUNAjYtw2J3aHVnv8ZnxTDQ
   oONS7liebHDtp6X2hzAdXg2IN0oH3yNAYzzLpvkDcBMVXkSyygg5DOOiN
   g==;
X-CSE-ConnectionGUID: 59u1n/xQS0m5uNXzqCH5Ow==
X-CSE-MsgGUID: tnXucWhoRAi2Ec/KL3GdjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49098856"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49098856"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 05:26:31 -0700
X-CSE-ConnectionGUID: jE/BIcWJTemMXBVFD1anYQ==
X-CSE-MsgGUID: x02M7RV8S5KB14IZZg2Nnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="137946729"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2025 05:26:28 -0700
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
Subject: [PATCH v5 2/2] mfd: core: Support auxiliary device
Date: Wed, 14 May 2025 17:54:32 +0530
Message-Id: <20250514122432.4019606-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514122432.4019606-1-raag.jadav@intel.com>
References: <20250514122432.4019606-1-raag.jadav@intel.com>
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
independent child devices without abusing the platform device.

Current support is limited to just PCI type MFDs, but this can be further
extended to support other types like USB in the future.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/mfd/Kconfig      |   2 +-
 drivers/mfd/mfd-core.c   | 185 +++++++++++++++++++++++++++++----------
 include/linux/mfd/core.h |   3 +
 3 files changed, 142 insertions(+), 48 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 93773201a517..4c71a3f962c9 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -8,8 +8,8 @@ menu "Multifunction device drivers"
 
 config MFD_CORE
 	tristate
+	select AUXILIARY_BUS
 	select IRQ_DOMAIN
-	default n
 
 config MFD_CS5535
 	tristate "AMD CS5535 and CS5536 southbridge core functions"
diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 76bd316a50af..174925bb7bf6 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -10,9 +10,11 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/list.h>
 #include <linux/property.h>
 #include <linux/mfd/core.h>
+#include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/module.h>
@@ -136,10 +138,108 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 	return 0;
 }
 
-static int mfd_add_device(struct device *parent, int id,
-			  const struct mfd_cell *cell,
-			  struct resource *mem_base,
-			  int irq_base, struct irq_domain *domain)
+static int mfd_fill_device_resources(struct device *dev, const struct mfd_cell *cell,
+				     struct resource *mem_base, int irq_base,
+				     struct irq_domain *domain, struct resource *res)
+{
+	int r, ret;
+
+	for (r = 0; r < cell->num_resources; r++) {
+		res[r].name  = cell->resources[r].name;
+		res[r].flags = cell->resources[r].flags;
+
+		/* Find out base to use */
+		if ((cell->resources[r].flags & IORESOURCE_MEM) && mem_base) {
+			res[r].parent = mem_base;
+			res[r].start  = mem_base->start + cell->resources[r].start;
+			res[r].end    = mem_base->start + cell->resources[r].end;
+		} else if (cell->resources[r].flags & IORESOURCE_IRQ) {
+			if (domain) {
+				/* Unable to create mappings for IRQ ranges. */
+				WARN_ON(cell->resources[r].start != cell->resources[r].end);
+				res[r].start = res[r].end = irq_create_mapping(domain,
+						cell->resources[r].start);
+			} else {
+				res[r].start = irq_base + cell->resources[r].start;
+				res[r].end   = irq_base + cell->resources[r].end;
+			}
+		} else {
+			res[r].parent = cell->resources[r].parent;
+			res[r].start  = cell->resources[r].start;
+			res[r].end    = cell->resources[r].end;
+		}
+
+		if (!cell->ignore_resource_conflicts) {
+			if (has_acpi_companion(dev)) {
+				ret = acpi_check_resource_conflict(&res[r]);
+				if (ret)
+					return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static void mfd_release_auxiliary_device(struct device *dev)
+{
+	kfree(to_auxiliary_dev(dev));
+}
+
+static int mfd_add_auxiliary_device(struct device *parent, int id, const struct mfd_cell *cell,
+				    struct resource *mem_base, int irq_base,
+				    struct irq_domain *domain)
+{
+	struct auxiliary_device *auxdev;
+	struct resource *res;
+	int ret = -ENOMEM;
+
+	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
+	if (!auxdev)
+		return ret;
+
+	res = kcalloc(cell->num_resources, sizeof(*res), GFP_KERNEL);
+	if (!res)
+		goto fail_alloc_res;
+
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
+	ret = mfd_fill_device_resources(&auxdev->dev, cell, mem_base, irq_base, domain, res);
+	if (ret)
+		goto fail_aux_add;
+
+	auxdev->resource = res;
+	auxdev->num_resources = cell->num_resources;
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
+	kfree(res);
+fail_alloc_res:
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
@@ -148,7 +248,6 @@ static int mfd_add_device(struct device *parent, int id,
 	bool disabled = false;
 	int ret = -ENOMEM;
 	int platform_id;
-	int r;
 
 	if (id == PLATFORM_DEVID_AUTO)
 		platform_id = id;
@@ -227,44 +326,9 @@ static int mfd_add_device(struct device *parent, int id,
 			goto fail_of_entry;
 	}
 
-	for (r = 0; r < cell->num_resources; r++) {
-		res[r].name = cell->resources[r].name;
-		res[r].flags = cell->resources[r].flags;
-
-		/* Find out base to use */
-		if ((cell->resources[r].flags & IORESOURCE_MEM) && mem_base) {
-			res[r].parent = mem_base;
-			res[r].start = mem_base->start +
-				cell->resources[r].start;
-			res[r].end = mem_base->start +
-				cell->resources[r].end;
-		} else if (cell->resources[r].flags & IORESOURCE_IRQ) {
-			if (domain) {
-				/* Unable to create mappings for IRQ ranges. */
-				WARN_ON(cell->resources[r].start !=
-					cell->resources[r].end);
-				res[r].start = res[r].end = irq_create_mapping(
-					domain, cell->resources[r].start);
-			} else {
-				res[r].start = irq_base +
-					cell->resources[r].start;
-				res[r].end   = irq_base +
-					cell->resources[r].end;
-			}
-		} else {
-			res[r].parent = cell->resources[r].parent;
-			res[r].start = cell->resources[r].start;
-			res[r].end   = cell->resources[r].end;
-		}
-
-		if (!cell->ignore_resource_conflicts) {
-			if (has_acpi_companion(&pdev->dev)) {
-				ret = acpi_check_resource_conflict(&res[r]);
-				if (ret)
-					goto fail_res_conflict;
-			}
-		}
-	}
+	ret = mfd_fill_device_resources(&pdev->dev, cell, mem_base, irq_base, domain, res);
+	if (ret)
+		goto fail_res_conflict;
 
 	ret = platform_device_add_resources(pdev, res, cell->num_resources);
 	if (ret)
@@ -302,6 +366,16 @@ static int mfd_add_device(struct device *parent, int id,
 	return ret;
 }
 
+static int mfd_add_device(struct device *parent, int id, const struct mfd_cell *cells,
+			  struct resource *mem_base, int irq_base, struct irq_domain *domain)
+{
+	/* TODO: Convert platform device abusers and remove this flag */
+	if (dev_is_pci(parent) && id == MAUX_TYPE)
+		return mfd_add_auxiliary_device(parent, id, cells, mem_base, irq_base, domain);
+
+	return mfd_add_platform_device(parent, id, cells, mem_base, irq_base, domain);
+}
+
 /**
  * mfd_add_devices - register child devices
  *
@@ -340,16 +414,22 @@ int mfd_add_devices(struct device *parent, int id,
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
 
@@ -372,6 +452,17 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
 	return 0;
 }
 
+static int mfd_remove_devices_fn(struct device *dev, void *data)
+{
+	if (dev->type != &mfd_dev_type)
+		return 0;
+
+	if (dev_is_platform(dev))
+		return mfd_remove_platform_device(dev, data);
+
+	return mfd_remove_auxiliary_device(dev, data);
+}
+
 void mfd_remove_devices_late(struct device *parent)
 {
 	int level = MFD_DEP_LEVEL_HIGH;
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index faeea7abd688..85ca273b3873 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -12,6 +12,9 @@
 
 #include <linux/platform_device.h>
 
+/* TODO: Convert platform device abusers and remove this flag */
+#define MAUX_TYPE	INT_MIN
+
 #define MFD_RES_SIZE(arr) (sizeof(arr) / sizeof(struct resource))
 
 #define MFD_CELL_ALL(_name, _res, _pdata, _pdsize, _id, _compat, _of_reg, _use_of_reg, _match) \
-- 
2.34.1

