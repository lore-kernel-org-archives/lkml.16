Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6597A20969D;
	Tue,  4 Feb 2025 11:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667377; cv=none; b=oswkgzjmKoNCuPI6gReF8m0glgK+yWESXI4hR6r4/qWTrtvUVWJbAWOUG/nQV/UuTveWJD0shZyfj2nfr0kVeAXdt7jpvbGrzZ4+Rv+EFFvSgHE26qvBds7TTeOImhT8VBEL4sVlYh7iU8MGXLtKTryO28mu2MKGxOoedpnFEBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667377; c=relaxed/simple;
	bh=M9fF2yZwbhd2NgZD12wwwug3mQYv6nfiLMXhmY+0PZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ohc2GhBXcv9WRd0QUb4aenYQH3tsapn0AVwJdm+OLTLPWynhLdoTK4ZCXsdwQr/9LYFGtXsk8BHzdaJfh7hUKKwORWnw9XUDoYnyP4HBBLXi9X9OQPnp7XvwItZDU3RI5nzVYY+XAm8nC+JcuXXnfRCEsnRoSGUlnm1CEW75Vjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jQGewVxX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jQGewVxX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA3EC4CEDF;
	Tue,  4 Feb 2025 11:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738667376;
	bh=M9fF2yZwbhd2NgZD12wwwug3mQYv6nfiLMXhmY+0PZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jQGewVxXP5zGIq9J4mWul5stjA+03hkSDPUfXtSbFQhhTob7G0YvSfAOk7gHkdgWO
	 vZ5TIYJSBnMUh8W78n7TaBXfGXxvNEPpKJ4jHTDNkyUfbWj5Kvwc1Y/GfOeRd1rTxV
	 871Nraww1cItAEf86WF6WzYfscfnf4diz8nD5k/o=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
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
	linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 1/5] driver core: add a faux bus for use when a simple device/bus is needed
Date: Tue,  4 Feb 2025 12:09:13 +0100
Message-ID: <2025020424-retrain-recharger-407c@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025020421-poster-moisture-534b@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9456; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=M9fF2yZwbhd2NgZD12wwwug3mQYv6nfiLMXhmY+0PZM=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkLv6ZEOAp9z+1lPl69Y3lznNPtvMlbP36wm1xlYlWTH s6ol7ewI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACYixc6woKOtImWf2sqlzRYH G69X7a9SXRobwbBg2X+2F4n7v7AumTF5bbV9hi/bJ6VoAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Many drivers abuse the platform driver/bus system as it provides a
simple way to create and bind a device to a driver-specific set of
probe/release functions.  Instead of doing that, and wasting all of the
memory associated with a platform device, here is a "faux" bus that
can be used instead.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 v2: - renamed bus and root device to just "faux" thanks to Thomas
     - removed the one-driver-per-device and now just have one driver
       entirely thanks to Danilo
     - kerneldoc fixups and additions and string handling bounds checks
       hanks to Andy
     - coding style fix thanks to Jonathan
     - tested that the destroy path actually works

 drivers/base/Makefile       |   2 +-
 drivers/base/base.h         |   1 +
 drivers/base/faux.c         | 196 ++++++++++++++++++++++++++++++++++++
 drivers/base/init.c         |   1 +
 include/linux/device/faux.h |  31 ++++++
 5 files changed, 230 insertions(+), 1 deletion(-)
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
index 000000000000..9b28643afc45
--- /dev/null
+++ b/drivers/base/faux.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+ * Copyright (c) 2025 The Linux Foundation
+ *
+ * A "simple" faux bus that allows devices to be created and added
+ * automatically to it.  This is to be used whenever you need to create a
+ * device that is not associated with any "real" system resources, and do
+ * not want to have to deal with a bus/driver binding logic.  It is
+ * intended to be very simple, with only a create and a destroy function
+ * available.
+ */
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/container_of.h>
+#include <linux/device/faux.h>
+#include "base.h"
+
+#define MAX_NAME_SIZE	256	/* Max size of a faux_device name */
+
+/*
+ * Internal wrapper structure so we can hold the memory
+ * for the driver and the name string of the faux device.
+ */
+struct faux_object {
+	struct faux_device faux_dev;
+	const struct faux_driver_ops *faux_ops;
+	char name[];
+};
+#define to_faux_object(dev) container_of_const(dev, struct faux_object, faux_dev.dev)
+
+static struct device faux_bus_root = {
+	.init_name	= "faux",
+};
+
+static int faux_match(struct device *dev, const struct device_driver *drv)
+{
+	/* Match always succeeds, we only have one driver */
+	return 1;
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
+	.name		= "faux",
+	.match		= faux_match,
+	.probe		= faux_probe,
+	.remove		= faux_remove,
+};
+
+static struct device_driver faux_driver = {
+	.name		= "faux_driver",
+	.bus		= &faux_bus_type,
+	.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
+};
+
+static void faux_device_release(struct device *dev)
+{
+	struct faux_object *faux_obj = to_faux_object(dev);
+
+	kfree(faux_obj);
+}
+
+/**
+ * faux_device_create - create and register a faux device and driver
+ * @name: name of the device and driver we are adding
+ * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
+ *
+ * Create a new faux device and driver, both with the same name, and
+ * register them in the driver core properly.  The probe() callback of
+ * @faux_ops will be called with the new device that is created for the
+ * caller to do something with.
+ *
+ * Note, when this function is called, the functions specified in struct
+ * faux_ops will be called before the function returns, so be prepared for
+ * everything to be properly initialized before that point in time.
+ *
+ * Return:
+ * * NULL if an error happened with creating the device
+ * * pointer to a valid struct faux_device that is registered with sysfs
+ */
+struct faux_device *faux_device_create(const char *name, struct faux_driver_ops *faux_ops)
+{
+	struct device *dev;
+	struct faux_object *faux_obj;
+	struct faux_device *faux_dev;
+	int name_size;
+	int ret;
+
+	name_size = strlen(name);
+	if (name_size > MAX_NAME_SIZE)
+		return NULL;
+
+	faux_obj = kzalloc(sizeof(*faux_obj) + name_size + 1, GFP_KERNEL);
+	if (!faux_obj)
+		return NULL;
+
+	/* Save off the name of the object into local memory */
+	memcpy(faux_obj->name, name, name_size);
+
+	/* Save off the callbacks so we can use them in the future */
+	faux_obj->faux_ops = faux_ops;
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
+EXPORT_SYMBOL_GPL(faux_device_create);
+
+/**
+ * faux_device_destroy - destroy a faux device
+ * @faux_dev: faux device to destroy
+ *
+ * Unregister and free all memory associated with a faux device that was
+ * previously created with a call to faux_device_create().
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
+	int ret;
+
+	ret = device_register(&faux_bus_root);
+	if (ret) {
+		put_device(&faux_bus_root);
+		return ret;
+	}
+
+	ret = bus_register(&faux_bus_type);
+	if (ret)
+		goto error_bus;
+
+	ret = driver_register(&faux_driver);
+	if (ret)
+		goto error_driver;
+
+	return ret;
+
+error_driver:
+	bus_unregister(&faux_bus_type);
+
+error_bus:
+	device_unregister(&faux_bus_root);
+	return ret;
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
index 000000000000..2c8ae5bd7ae8
--- /dev/null
+++ b/include/linux/device/faux.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+ * Copyright (c) 2025 The Linux Foundation
+ *
+ * A "simple" faux bus that allows devices to be created and added
+ * automatically to it.  This is to be used whenever you need to create a
+ * device that is not associated with any "real" system resources, and do
+ * not want to have to deal with a bus/driver binding logic.  It is
+ * intended to be very simple, with only a create and a destroy function
+ * available.
+ */
+#ifndef _FAUX_DEVICE_H_
+#define _FAUX_DEVICE_H_
+
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
+struct faux_device *faux_device_create(const char *name, struct faux_driver_ops *faux_ops);
+void faux_device_destroy(struct faux_device *faux_dev);
+
+#endif /* _FAUX_DEVICE_H_ */
-- 
2.48.1

