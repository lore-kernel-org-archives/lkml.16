Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40C277022
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747225590; cv=none; b=Ghusfhb0JWBF8qo7DNq9CNmlGBMgTKt98bYq2KU58dmnBCdthzE6UP71UQUxOivUYofml6O++ekSuVqZCkroMUi4yGoKPWrcKtw1eJ5zrZmdDOEovGzwW1MXivfh4hq59DpHHEO6JKgHOFOt4gAl2bjtnfY1WZ9ZyzN52uQIjJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747225590; c=relaxed/simple;
	bh=tLUloUpo2WCG1fHm5KAQ4cVvj5x7S6Ccu+wBGNb++OQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KrLFTiz+kqLNRo83IPeckgtylsh4DHIM0o4arnynwkp8qvyCjLZBf+CVfZ1QsrRX0g7UMybJcWo0uZI+SpefKZ7+1asio2e825wAvb+7zhZftj/wgga0yxrtx9cJK7mTqJ19VhnNWuYQ/+wnhUBRHzOKuYfxwhy27Y9DGTxff+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XU7bDYtp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XU7bDYtp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747225588; x=1778761588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tLUloUpo2WCG1fHm5KAQ4cVvj5x7S6Ccu+wBGNb++OQ=;
  b=XU7bDYtpj6AnbnHloT9DT4ys9vmtnMRld1QhkuOs82iSbL04TQQ7fwzC
   UU+Imri0ut/GmgrOkwCHsybHoVtJhniymKhcb8rkGvd0bfbo7WTaWu5wL
   tfVnRV9ZDHXHq2ttUr3uGlltBG8z+herjFlMiECc5W3MgX9U0yevV+fne
   ZOYTVNVKJAjgpWaoeUxulIbSIR2rwk6MYoRbomHvm6d80NaopTravOIna
   DOc5bDSvikqiER3cq6pu+uS1ZasaWAdIRWk3UxLmpKId8Gd7I9DEmuiZz
   YemLNWzmqat5TxK2hKqsrhl2NwRfR6Lys6zuYK7uGg/mFq7h9AZAQ8lqR
   g==;
X-CSE-ConnectionGUID: DB28z25pQuavixuqid4ZdQ==
X-CSE-MsgGUID: 9LDfr7r9SqOr6Au/H2oOEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49098847"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49098847"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 05:26:28 -0700
X-CSE-ConnectionGUID: n4AnYIgeSPqVd/ksF3J46g==
X-CSE-MsgGUID: BbbOVRwXTfi1bE+fdj39IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="137946718"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2025 05:26:25 -0700
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
Subject: [PATCH v5 1/2] driver core: auxiliary bus: Introduce auxiliary device resource management
Date: Wed, 14 May 2025 17:54:31 +0530
Message-Id: <20250514122432.4019606-2-raag.jadav@intel.com>
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

With more and more drivers adopting to auxiliary bus infrastructure comes
the need for managing resources at auxiliary device level. This is useful
for cases where parent device shares variable number and type of resources
with auxiliary child device but doesn't require any active involvement in
managing them.

This reduces potential duplication of resource APIs that may be required by
parent device driver. With this in place parent driver will be responsible
for filling up respective resources and its count in auxiliary device
structure before registering it, so that the leaf drivers can utilize in
their probe function. Lifecycle of these resources will be as long as the
auxiliary device exists.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/base/auxiliary.c      | 145 ++++++++++++++++++++++++++++++++++
 include/linux/auxiliary_bus.h |  18 +++++
 2 files changed, 163 insertions(+)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index 95717d509ca9..86ae51ef50ff 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -9,6 +9,8 @@
 
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/ioport.h>
+#include <linux/irq.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/pm_domain.h>
@@ -384,6 +386,149 @@ int __auxiliary_driver_register(struct auxiliary_driver *auxdrv,
 }
 EXPORT_SYMBOL_GPL(__auxiliary_driver_register);
 
+/**
+ * auxiliary_get_resource - get a resource for auxiliary device
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
+#ifdef CONFIG_HAS_IOMEM
+/**
+ * devm_auxiliary_get_and_ioremap_resource - get resource and call devm_ioremap_resource()
+ *					     for auxiliary device
+ *
+ * @auxdev: auxiliary device to use both for memory resource lookup as well as
+ *	    resource management
+ * @index: resource index
+ * @res: optional output parameter to store a pointer to the obtained resource.
+ *
+ * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure.
+ */
+void __iomem *devm_auxiliary_get_and_ioremap_resource(struct auxiliary_device *auxdev,
+						      unsigned int index, struct resource **res)
+{
+	struct resource *r;
+
+	r = auxiliary_get_resource(auxdev, IORESOURCE_MEM, index);
+	if (res)
+		*res = r;
+	return devm_ioremap_resource(&auxdev->dev, r);
+}
+EXPORT_SYMBOL_GPL(devm_auxiliary_get_and_ioremap_resource);
+
+/**
+ * devm_auxiliary_ioremap_resource - call devm_ioremap_resource() for auxiliary device
+ *
+ * @auxdev: auxiliary device to use both for memory resource lookup as well as
+ *	    resource management
+ * @index: resource index
+ *
+ * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure.
+ */
+void __iomem *devm_auxiliary_ioremap_resource(struct auxiliary_device *auxdev, unsigned int index)
+{
+	return devm_auxiliary_get_and_ioremap_resource(auxdev, index, NULL);
+}
+EXPORT_SYMBOL_GPL(devm_auxiliary_ioremap_resource);
+#endif
+
+/**
+ * auxiliary_get_irq_optional - get an optional IRQ for auxiliary device
+ * @auxdev: auxiliary device
+ * @num: IRQ number index
+ *
+ * Gets an IRQ for a auxiliary device. Device drivers should check the return value
+ * for errors so as to not pass a negative integer value to the request_irq()
+ * APIs. This is the same as auxiliary_get_irq(), except that it does not print an
+ * error message if an IRQ can not be obtained.
+ *
+ * For example::
+ *
+ *		int irq = auxiliary_get_irq_optional(auxdev, 0);
+ *		if (irq < 0)
+ *			return irq;
+ *
+ * Return: non-zero IRQ number on success, negative error number on failure.
+ */
+int auxiliary_get_irq_optional(struct auxiliary_device *auxdev, unsigned int num)
+{
+	struct resource *r;
+	int ret = -ENXIO;
+
+	r = auxiliary_get_resource(auxdev, IORESOURCE_IRQ, num);
+	if (!r)
+		goto out;
+
+	/*
+	 * The resources may pass trigger flags to the irqs that need to be
+	 * set up. It so happens that the trigger flags for IORESOURCE_BITS
+	 * correspond 1-to-1 to the IRQF_TRIGGER* settings.
+	 */
+	if (r->flags & IORESOURCE_BITS) {
+		struct irq_data *irqd;
+
+		irqd = irq_get_irq_data(r->start);
+		if (!irqd)
+			goto out;
+		irqd_set_trigger_type(irqd, r->flags & IORESOURCE_BITS);
+	}
+
+	ret = r->start;
+	if (WARN(!ret, "0 is an invalid IRQ number\n"))
+		ret = -EINVAL;
+out:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(auxiliary_get_irq_optional);
+
+/**
+ * auxiliary_get_irq - get an IRQ for auxiliary device
+ * @auxdev: auxiliary device
+ * @num: IRQ number index
+ *
+ * Gets an IRQ for a auxiliary device and prints an error message if finding the IRQ
+ * fails. Device drivers should check the return value for errors so as to not pass
+ * a negative integer value to the request_irq() APIs.
+ *
+ * For example::
+ *
+ *		int irq = auxiliary_get_irq(auxdev, 0);
+ *		if (irq < 0)
+ *			return irq;
+ *
+ * Return: non-zero IRQ number on success, negative error number on failure.
+ */
+int auxiliary_get_irq(struct auxiliary_device *auxdev, unsigned int num)
+{
+	int ret;
+
+	ret = auxiliary_get_irq_optional(auxdev, num);
+	if (ret < 0)
+		return dev_err_probe(&auxdev->dev, ret, "IRQ index %u not found\n", num);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(auxiliary_get_irq);
+
 /**
  * auxiliary_driver_unregister - unregister a driver
  * @auxdrv: auxiliary_driver structure
diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
index 65dd7f154374..7d7e23313b63 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -11,6 +11,8 @@
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
 
+struct resource;
+
 /**
  * DOC: DEVICE_LIFESPAN
  *
@@ -148,6 +150,8 @@ struct auxiliary_device {
 		struct mutex lock; /* Synchronize irq sysfs creation */
 		bool irq_dir_exists;
 	} sysfs;
+	u32 num_resources;
+	struct resource	*resource;
 };
 
 /**
@@ -238,6 +242,9 @@ auxiliary_device_sysfs_irq_remove(struct auxiliary_device *auxdev, int irq) {}
 
 static inline void auxiliary_device_uninit(struct auxiliary_device *auxdev)
 {
+	if (auxdev->resource)
+		kfree(auxdev->resource);
+
 	mutex_destroy(&auxdev->sysfs.lock);
 	put_device(&auxdev->dev);
 }
@@ -269,4 +276,15 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv);
 #define module_auxiliary_driver(__auxiliary_driver) \
 	module_driver(__auxiliary_driver, auxiliary_driver_register, auxiliary_driver_unregister)
 
+struct resource *auxiliary_get_resource(struct auxiliary_device *auxdev, unsigned int type,
+					unsigned int num);
+int auxiliary_get_irq_optional(struct auxiliary_device *auxdev, unsigned int num);
+int auxiliary_get_irq(struct auxiliary_device *auxdev, unsigned int num);
+
+#ifdef CONFIG_HAS_IOMEM
+void __iomem *devm_auxiliary_get_and_ioremap_resource(struct auxiliary_device *auxdev,
+						      unsigned int index, struct resource **res);
+void __iomem *devm_auxiliary_ioremap_resource(struct auxiliary_device *auxdev, unsigned int index);
+#endif
+
 #endif /* _AUXILIARY_BUS_H_ */
-- 
2.34.1

