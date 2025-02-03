Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAA420A5DE;
	Mon,  3 Feb 2025 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592736; cv=none; b=Ud52NpYU5OmljIhp5druQALc8Hi/UocfFkdOb3y0BdORwxyNTmCWOYa4uw/3YrDn7iRi2zXTZ2EhXX282d+By3DcLV71IyUUb9jIaDnPwUj/oF1WoQi+Lz3xMpSTPDukByVnRkowXSCvPVOFPcsdmSRNBxBNMJ2DTSyxNeSvGVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592736; c=relaxed/simple;
	bh=+nmWW1bZ6UVBEYR5zkaQ0IEV8ri+eM8vDjtD4wRg5i4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/RKLAsv+ADvHSJxQa5w1cqXaE2dlysGdajOb838NO6Nnx6AKKtnPJQiJ4FiM4ZFZ6T60KSM4/P2q2YK9WXij3Jtyxf2piMz8c+8e840KD+14EAJKwKt9YrCeE0rHig018lbQ+6zM/LDrSCk+7adZBLPrAOmUSBTf7cR+SHXsCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fc2BwV3I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fc2BwV3I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8401EC4CEE3;
	Mon,  3 Feb 2025 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738592736;
	bh=+nmWW1bZ6UVBEYR5zkaQ0IEV8ri+eM8vDjtD4wRg5i4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fc2BwV3ItPgbMwUt1lzN5YfUPbXowxuV59LxB110WhX01ofrPGo+P71Rp2ubbz98C
	 Ul4m6tYtyFTTi1ps5Q6AOTIrUfFQUN684Tr7hJM0mTr0z5H22xPCcyOb7hsI43ko4a
	 8auXMwRYv2tITXtNpFAFuHZBGFMMPfBlnCeZ7OKc=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/3] driver core: add a faux bus for use when a simple device/bus is needed
Date: Mon,  3 Feb 2025 15:25:17 +0100
Message-ID: <2025020326-backer-vendetta-7094@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025020324-thermal-quilt-1bae@gregkh>
References: <2025020324-thermal-quilt-1bae@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8853; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=+nmWW1bZ6UVBEYR5zkaQ0IEV8ri+eM8vDjtD4wRg5i4=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkLLl5L2ymdfGXanmuzamZeEA1RPLn/1teph96vzOEM7 N2XuMEztyOWhUGQiUFWTJHlyzaeo/srDil6GdqehpnDygQyhIGLUwAmopzCMFeq8m/2vQUe6upu mj9K65YE/bY+IMswP0epWaOuSKxspWDzJbcHsk+zGzYlAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Many drivers abuse the platform driver/bus system as it provides a
simple way to create and bind a device to a driver-specific set of
probe/release functions.  Instead of doing that, and wasting all of the
memory associated with a platform device, here is a "faux" bus that
can be used instead.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/Makefile       |   2 +-
 drivers/base/base.h         |   1 +
 drivers/base/faux.c         | 189 ++++++++++++++++++++++++++++++++++++
 drivers/base/init.c         |   1 +
 include/linux/device/faux.h |  33 +++++++
 5 files changed, 225 insertions(+), 1 deletion(-)
 create mode 100644 drivers/base/faux.c
 create mode 100644 include/linux/device/faux.h

diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 7fb21768ca36..8074a10183dc 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -6,7 +6,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
 			   cpu.o firmware.o init.o map.o devres.o \
 			   attribute_container.o transport_class.o \
 			   topology.o container.o property.o cacheinfo.o \
-			   swnode.o
+			   swnode.o faux.o
 obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
 obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
 obj-y			+= power/
diff --git a/drivers/base/base.h b/drivers/base/base.h
index 8cf04a557bdb..0042e4774b0c 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -137,6 +137,7 @@ int hypervisor_init(void);
 static inline int hypervisor_init(void) { return 0; }
 #endif
 int platform_bus_init(void);
+int faux_bus_init(void);
 void cpu_dev_init(void);
 void container_dev_init(void);
 #ifdef CONFIG_AUXILIARY_BUS
diff --git a/drivers/base/faux.c b/drivers/base/faux.c
new file mode 100644
index 000000000000..0eba89a5cd57
--- /dev/null
+++ b/drivers/base/faux.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+ * Copyright (c) 2025 The Linux Foundation
+ *
+ * A "simple" faux bus that allows devices to be created and added
+ * automatically to it.  Whenever you need a device that is not "real",
+ * use this interface instead of even thinking of using a platform device.
+ *
+ */
+#include <linux/device/faux.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include "base.h"
+
+/*
+ * Internal wrapper structure so we can hold the memory
+ * for the driver and the name string of the faux device.
+ */
+struct faux_object {
+	struct faux_device faux_dev;
+	struct device_driver driver;
+	const struct faux_driver_ops *faux_ops;
+	char name[];
+};
+#define to_faux_object(x) container_of_const(dev, struct faux_object, faux_dev.dev);
+
+static struct device faux_bus_root = {
+	.init_name	= "faux_bus",
+};
+
+static int faux_match(struct device *dev, const struct device_driver *drv)
+{
+	struct faux_object *faux_obj = to_faux_object(dev);
+
+	/* Match is simple, strcmp()! */
+	return (strcmp(faux_obj->name, drv->name) == 0);
+}
+
+static int faux_probe(struct device *dev)
+{
+	struct faux_object *faux_obj = to_faux_object(dev);
+	struct faux_device *faux_dev = &faux_obj->faux_dev;
+	const struct faux_driver_ops *faux_ops = faux_obj->faux_ops;
+	int ret = 0;
+
+	if (faux_ops && faux_ops->probe)
+		ret = faux_ops->probe(faux_dev);
+
+	return ret;
+}
+
+static void faux_remove(struct device *dev)
+{
+	struct faux_object *faux_obj = to_faux_object(dev);
+	struct faux_device *faux_dev = &faux_obj->faux_dev;
+	const struct faux_driver_ops *faux_ops = faux_obj->faux_ops;
+
+	if (faux_ops && faux_ops->remove)
+		faux_ops->remove(faux_dev);
+}
+
+static const struct bus_type faux_bus_type = {
+	.name		= "faux_bus",
+	.match		= faux_match,
+	.probe		= faux_probe,
+	.remove		= faux_remove,
+};
+
+static void faux_device_release(struct device *dev)
+{
+	struct faux_object *faux_obj = to_faux_object(dev);
+	struct device_driver *drv = &faux_obj->driver;
+
+	/*
+	 * Now that the device is going away, it has been unbound from the
+	 * driver we created for it, so it is safe to unregister the driver from
+	 * the system.
+	 */
+	driver_unregister(drv);
+
+	kfree(faux_obj);
+}
+
+/**
+ * __faux_device_create - create and register a faux device and driver
+ * @name: name of the device and driver we are adding
+ * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
+ * @owner: module owner of the device/driver
+ *
+ * Create a new faux device and driver, both with the same name, and register
+ * them in the driver core properly.  The probe() callback of @faux_ops will be
+ * called with the new device that is created for the caller to do something
+ * with.
+ */
+struct faux_device *__faux_device_create(const char *name,
+					       struct faux_driver_ops *faux_ops,
+					       struct module *owner)
+{
+	struct device_driver *drv;
+	struct device *dev;
+	struct faux_object *faux_obj;
+	struct faux_device *faux_dev;
+	int ret;
+
+	faux_obj = kzalloc(sizeof(*faux_obj) + strlen(name) + 1, GFP_KERNEL);
+	if (!faux_obj)
+		return NULL;
+
+	/* Save off the name of the object into local memory */
+	strcpy(faux_obj->name, name);
+
+	/* Initialize the driver portion and register it with the driver core */
+	faux_obj->faux_ops = faux_ops;
+	drv = &faux_obj->driver;
+
+	drv->owner = owner;
+	drv->name = faux_obj->name;
+	drv->bus = &faux_bus_type;
+	drv->probe_type = PROBE_PREFER_ASYNCHRONOUS;
+
+	ret = driver_register(drv);
+	if (ret) {
+		pr_err("%s: driver_register for %s faux driver failed with %d\n",
+		       __func__, name, ret);
+		kfree(faux_obj);
+		return NULL;
+	}
+
+	/* Initialize the device portion and register it with the driver core */
+	faux_dev = &faux_obj->faux_dev;
+	dev = &faux_dev->dev;
+
+	device_initialize(dev);
+	dev->release = faux_device_release;
+	dev->parent = &faux_bus_root;
+	dev->bus = &faux_bus_type;
+	dev_set_name(dev, "%s", name);
+
+	ret = device_add(dev);
+	if (ret) {
+		pr_err("%s: device_add for %s faux device failed with %d\n",
+		       __func__, name, ret);
+		put_device(dev);
+		return NULL;
+	}
+
+	return faux_dev;
+}
+EXPORT_SYMBOL_GPL(__faux_device_create);
+
+/**
+ * faux_device_destroy - destroy a faux device
+ * @faux_dev: faux device to destroy
+ *
+ * Unregister and free all memory associated with a faux device.
+ */
+void faux_device_destroy(struct faux_device *faux_dev)
+{
+	struct device *dev = &faux_dev->dev;
+
+	if (IS_ERR_OR_NULL(faux_dev))
+		return;
+
+	device_del(dev);
+
+	/* The final put_device() will clean up the driver we created for this device. */
+	put_device(dev);
+}
+EXPORT_SYMBOL_GPL(faux_device_destroy);
+
+int __init faux_bus_init(void)
+{
+	int error;
+
+	error = device_register(&faux_bus_root);
+	if (error) {
+		put_device(&faux_bus_root);
+		return error;
+	}
+
+	error =  bus_register(&faux_bus_type);
+	if (error)
+		device_unregister(&faux_bus_root);
+
+	return error;
+}
diff --git a/drivers/base/init.c b/drivers/base/init.c
index c4954835128c..9d2b06d65dfc 100644
--- a/drivers/base/init.c
+++ b/drivers/base/init.c
@@ -32,6 +32,7 @@ void __init driver_init(void)
 	/* These are also core pieces, but must come after the
 	 * core core pieces.
 	 */
+	faux_bus_init();
 	of_core_init();
 	platform_bus_init();
 	auxiliary_bus_init();
diff --git a/include/linux/device/faux.h b/include/linux/device/faux.h
new file mode 100644
index 000000000000..b1a51fbb6f39
--- /dev/null
+++ b/include/linux/device/faux.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+ * Copyright (c) 2025 The Linux Foundation
+ *
+ * A "simple" faux bus that allows devices to be created and added
+ * automatically to it.  Whenever you need a device that is not "real",
+ * use this interface instead of even thinking of using a platform device.
+ *
+ */
+#ifndef _FAUX_DEVICE_H_
+#define _FAUX_DEVICE_H_
+
+#include <linux/module.h>
+#include <linux/device.h>
+
+struct faux_device {
+	struct device dev;
+};
+#define to_faux_device(x) container_of_const((x), struct faux_device, dev)
+
+struct faux_driver_ops {
+	int (*probe)(struct faux_device *faux_dev);
+	void (*remove)(struct faux_device *faux_dev);
+};
+
+#define faux_device_create(name, faux_ops) __faux_device_create(name, faux_ops, THIS_MODULE)
+struct faux_device *__faux_device_create(const char *name,
+					       struct faux_driver_ops *faux_ops,
+					       struct module *module);
+void faux_device_destroy(struct faux_device *faux_dev);
+
+#endif /* _FAUX_DEVICE_H_ */
-- 
2.48.1

