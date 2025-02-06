Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A85C17799F;
	Thu,  6 Feb 2025 17:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863513; cv=none; b=It/XvO9TDOxbRB6DmsHGPzQnXtORvux+yKG3aT9RVLmKvYCpN6aI1LgQ1b8tIWZhlqJCiMKDFl4WOuMyfTzD2e2ko+lWOAA0EjbO0zFw2L3uoSj5d9GA+aHevJGKBYd1CJqyHQmOhGOek1mfACvBBodNuSHCE3akj+M1ACqCKWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863513; c=relaxed/simple;
	bh=PYE4odxFCn9Cp6DmDp7y4h8+WxTuRZL6jNDmpTNbLf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNRQSfaLKvjUtQytUNvxR7DQJSXHtx6swbJwB4RlFFf8+a8Eyg+BF3/fD3eHKE402rp/T4k3WlnuFuWsJnv7GaPVo8RJYu6k9UTBv4ZCvuvSw6nvwDS2I/hoDixKfsQNjOTUle3dSbObvBO5c0pH23GM4QFQWeh3EeYsiUvmrK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tPqJO0fl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tPqJO0fl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FDFC4CEDD;
	Thu,  6 Feb 2025 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738863512;
	bh=PYE4odxFCn9Cp6DmDp7y4h8+WxTuRZL6jNDmpTNbLf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tPqJO0flOowdQQZK7i/G6SW3uWKZdkyWKThvlFY8ywJNakPhoW6ItaKOrUcaOp3+u
	 LMP1fhGDEWxNvJqRcq2zeT9ww+c6Mx1J+iDHi+dG+YZ4z0hr4hC3/YEYLrG+nSBsuX
	 7ADqbShWQK5powgEDji07t0xhCa1s2iOQVaWaKHI=
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
Subject: [PATCH v3 1/8] driver core: add a faux bus for use when a simple device/bus is needed
Date: Thu,  6 Feb 2025 18:38:15 +0100
Message-ID: <2025020623-chemo-amends-102a@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025020620-skedaddle-olympics-1735@gregkh>
References: <2025020620-skedaddle-olympics-1735@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13332; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=PYE4odxFCn9Cp6DmDp7y4h8+WxTuRZL6jNDmpTNbLf4=; b=owGbwMvMwCRo6H6F97bub03G02pJDOlLPvd3brwiqv8xulCuPOdTqLtOB1PkyolhRq8vnPd4P MHuXMWUjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZiI702GedpHOpuTr7IzR5xc U1r4RPyVyof6ewwLunx1tm4XlHlc1XR1jmNa3LQSTYZVAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Many drivers abuse the platform driver/bus system as it provides a
simple way to create and bind a device to a driver-specific set of
probe/release functions.  Instead of doing that, and wasting all of the
memory associated with a platform device, here is a "faux" bus that
can be used instead.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v3: - loads of documentation updates and rewrites
    - added to the documentation build
    - removed name[] array as it's no longer needed
    - added faux_device_create_with_groups()
    - added functions to get/set devdata
    - renamed faux_driver_ops -> faux_device_ops
    - made faux_device_ops a const *
    - minor cleanups
    - tested it, again.

v2: - renamed bus and root device to just "faux" thanks to Thomas
    - removed the one-driver-per-device and now just have one driver
      entirely thanks to Danilo
    - kerneldoc fixups and additions and string handling bounds checks
      thanks to Andy
    - coding style fix thanks to Jonathan
    - tested that the destroy path actually works
 Documentation/driver-api/infrastructure.rst |   6 +
 drivers/base/Makefile                       |   2 +-
 drivers/base/base.h                         |   1 +
 drivers/base/faux.c                         | 228 ++++++++++++++++++++
 drivers/base/init.c                         |   1 +
 include/linux/device/faux.h                 |  65 ++++++
 6 files changed, 302 insertions(+), 1 deletion(-)
 create mode 100644 drivers/base/faux.c
 create mode 100644 include/linux/device/faux.h

diff --git a/Documentation/driver-api/infrastructure.rst b/Documentation/driver-api/infrastructure.rst
index 3d52dfdfa9fd..35e36fee4238 100644
--- a/Documentation/driver-api/infrastructure.rst
+++ b/Documentation/driver-api/infrastructure.rst
@@ -41,6 +41,12 @@ Device Drivers Base
 .. kernel-doc:: drivers/base/class.c
    :export:
 
+.. kernel-doc:: include/linux/device/faux.h
+   :internal:
+
+.. kernel-doc:: drivers/base/faux.c
+   :export:
+
 .. kernel-doc:: drivers/base/node.c
    :internal:
 
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
index 000000000000..27879ae78f53
--- /dev/null
+++ b/drivers/base/faux.c
@@ -0,0 +1,228 @@
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
+#define MAX_FAUX_NAME_SIZE	256	/* Max size of a faux_device name */
+
+/*
+ * Internal wrapper structure so we can hold a pointer to the
+ * faux_device_ops for this device.
+ */
+struct faux_object {
+	struct faux_device faux_dev;
+	const struct faux_device_ops *faux_ops;
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
+	const struct faux_device_ops *faux_ops = faux_obj->faux_ops;
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
+	const struct faux_device_ops *faux_ops = faux_obj->faux_ops;
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
+ * faux_device_create_with_groups - create and register with the driver
+ *		core a faux device and populate the device with an initial
+ *		set of sysfs attributes
+ * @name:	The name of the device we are adding, must be unique for
+ *		all faux devices.
+ * @faux_ops:	struct faux_device_ops that the new device will call back
+ *		into, can be NULL.
+ * @groups:	The set of sysfs attributes that will be created for this
+ *		device when it is registered with the driver core.
+ *
+ * Create a new faux device and register it in the driver core properly.
+ * If present, callbacks in @faux_ops will be called with the device that
+ * for the caller to do something with at the proper time given the
+ * device's lifecycle.
+ *
+ * Note, when this function is called, the functions specified in struct
+ * faux_ops can be called before the function returns, so be prepared for
+ * everything to be properly initialized before that point in time.
+ *
+ * Return:
+ * * NULL if an error happened with creating the device
+ * * pointer to a valid struct faux_device that is registered with sysfs
+ */
+struct faux_device *faux_device_create_with_groups(const char *name,
+						   const struct faux_device_ops *faux_ops,
+						   const struct attribute_group **groups)
+{
+	struct device *dev;
+	struct faux_object *faux_obj;
+	struct faux_device *faux_dev;
+	int name_size;
+	int ret;
+
+	name_size = strlen(name);
+	if (name_size > MAX_FAUX_NAME_SIZE)
+		return NULL;
+
+	faux_obj = kzalloc(sizeof(*faux_obj) + name_size + 1, GFP_KERNEL);
+	if (!faux_obj)
+		return NULL;
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
+	dev->groups = groups;
+	dev_set_name(dev, "%s", name);
+
+	ret = device_add(dev);
+	if (ret) {
+		pr_err("%s: device_add for faux device '%s' failed with %d\n",
+		       __func__, name, ret);
+		put_device(dev);
+		return NULL;
+	}
+
+	return faux_dev;
+}
+EXPORT_SYMBOL_GPL(faux_device_create_with_groups);
+
+/**
+ * faux_device_create - create and register with the driver core a faux device
+ * @name:	name of the device we are adding, must be unique for all
+ *		faux devices.
+ * @faux_ops:	struct faux_device_ops that the new device will call back
+ *		into, can be NULL.
+ *
+ * Create a new faux device and register it in the driver core properly.
+ * If present, callbacks in @faux_ops will be called with the device that
+ * for the caller to do something with at the proper time given the
+ * device's lifecycle.
+ *
+ * Note, when this function is called, the functions specified in struct
+ * faux_ops can be called before the function returns, so be prepared for
+ * everything to be properly initialized before that point in time.
+ *
+ * Return:
+ * * NULL if an error happened with creating the device
+ * * pointer to a valid struct faux_device that is registered with sysfs
+ */
+struct faux_device *faux_device_create(const char *name,
+				       const struct faux_device_ops *faux_ops)
+{
+	return faux_device_create_with_groups(name, faux_ops, NULL);
+}
+EXPORT_SYMBOL_GPL(faux_device_create);
+
+/**
+ * faux_device_destroy - destroy a faux device
+ * @faux_dev:	faux device to destroy
+ *
+ * Unregisters and cleans up a device that was created with a call to
+ * faux_device_create()
+ */
+void faux_device_destroy(struct faux_device *faux_dev)
+{
+	struct device *dev = &faux_dev->dev;
+
+	if (!faux_dev)
+		return;
+
+	device_del(dev);
+
+	/* The final put_device() will clean up the memory we allocated for this device. */
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
index 000000000000..f74cfd2843f1
--- /dev/null
+++ b/include/linux/device/faux.h
@@ -0,0 +1,65 @@
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
+/**
+ * struct faux_device - a "faux" device
+ * @dev:	internal struct device of the object
+ *
+ * A simple faux device that can be created/destroyed.  To be used when a
+ * driver only needs to have a device to "hang" something off.  This can be
+ * used for downloading firmware or other basic tasks.  Use this instead of
+ * a struct platform_device if the device has no resources assigned to
+ * it at all.
+ */
+struct faux_device {
+	struct device dev;
+};
+#define to_faux_device(x) container_of_const((x), struct faux_device, dev)
+
+/**
+ * struct faux_device_ops - a set of callbacks for a struct faux_device
+ * @probe:	called when a faux device is probed by the driver core
+ *		before the device is fully bound to the internal faux bus
+ *		code.  If probe succeeds, return 0, otherwise return a
+ *		negative error number to stop the probe sequence from
+ *		succeeding.
+ * @remove:	called when a faux device is removed from the system
+ *
+ * Both @probe and @remove are optional, if not needed, set to NULL.
+ */
+struct faux_device_ops {
+	int (*probe)(struct faux_device *faux_dev);
+	void (*remove)(struct faux_device *faux_dev);
+};
+
+struct faux_device *faux_device_create(const char *name, const struct faux_device_ops *faux_ops);
+struct faux_device *faux_device_create_with_groups(const char *name,
+						   const struct faux_device_ops *faux_ops,
+						   const struct attribute_group **groups);
+void faux_device_destroy(struct faux_device *faux_dev);
+
+static inline void *faux_device_get_drvdata(const struct faux_device *faux_dev)
+{
+	return dev_get_drvdata(&faux_dev->dev);
+}
+
+static inline void faux_device_set_drvdata(struct faux_device *faux_dev, void *data)
+{
+	dev_set_drvdata(&faux_dev->dev, data);
+}
+
+#endif /* _FAUX_DEVICE_H_ */
-- 
2.48.1

