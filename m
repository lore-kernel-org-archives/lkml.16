Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A172A1D798E;
	Mon,  3 Feb 2025 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575660; cv=none; b=ZO3jYAqAspfs2uLkZV9I0daHtoVy1tLK602QjjS68nOdNsuTbXSZQVvGkKQ7T1XQHQ4dSL6TwuEeBuRG7Lwgo0mTS5+MSht/jcMx6vBgOIp4V6yRvgzfIJMcpuuH8xBmD0giRAUZsOvmLepNW6gbWGD8LYLxbpu7q36b8SLypdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575660; c=relaxed/simple;
	bh=UyQmEsHoLVzndHypkF2fihIxgTuwozaSc+YaRMR9C5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKW9XCBYj4NXhUPM4JlubNrJsYD6BW3yTnp7ov9JtB4TcxD3y9LAbzPUqBOXf3G13+k5cx8bjlUbjbCPVcOU8lFTYjsFs7hBnqiJ6Yx19mBN+wqb3PlhTiwYinWn0gxuqfaue9sbJ+tcVzQKghekEg6mTekksxAJt+VbQD4YqEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JO8tFkFo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JO8tFkFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11A3C4CED2;
	Mon,  3 Feb 2025 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738575660;
	bh=UyQmEsHoLVzndHypkF2fihIxgTuwozaSc+YaRMR9C5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JO8tFkFoltckoCWR0i/MP2gJgojQZsW10u9DIgoSV6SUSz+GKLegTxlGt4da9WVMj
	 Dt54qb+SNahpf9QeO85rskjEZbbXyl64+kkag6Es28TrSxnDbW2uuhNuJsdaV9O0iq
	 c4ap05rPiWDyB6t008hJwtu/19APO/vIpNEfYZAU=
Date: Mon, 3 Feb 2025 10:39:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
Subject: [RFC] driver core: add a virtual bus for use when a simple
 device/bus is needed
Message-ID: <2025020306-overhang-glider-7d42@gregkh>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
 <2025013140-propeller-dirtiness-6cb4@gregkh>
 <Z50ZuzrDn-GQWOuP@cassiopeiae>
 <2025020106-avert-senorita-4181@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020106-avert-senorita-4181@gregkh>

On Sat, Feb 01, 2025 at 09:00:00AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Jan 31, 2025 at 07:43:07PM +0100, Danilo Krummrich wrote:
> > On Fri, Jan 31, 2025 at 05:40:01PM +0100, Greg Kroah-Hartman wrote:
> > > On Fri, Jan 31, 2025 at 09:00:32AM +0100, Greg Kroah-Hartman wrote:
> > > > On Thu, Jan 30, 2025 at 04:28:26PM -0500, Lyude Paul wrote:
> > > > > As Greg KH pointed out, we have a nice /sys/devices/virtual directory free
> > > > > for the taking - but the vast majority of device drivers concerned with
> > > > > virtual devices do not use this and instead misuse the platform device API.
> > > > > 
> > > > > To fix this, let's start by adding a simple function that can be used for
> > > > > creating virtual devices - virtual_device_create().
> > > > > 
> > > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > > 
> > > > > ---
> > > > > 
> > > > > So, WIP obviously because I wrote this up in a few minutes - but this goes
> > > > > off the idea that Danilo suggested to me off-list of coming up with a
> > > > > simple API for handling virtual devices that's a little more obvious to
> > > > > use. I wanted to get people's feedback and if we're happy with this idea,
> > > > > I'm willing to go through and add some pointers to this function in various
> > > > > platform API docs - along with porting over the C version of VKMS over to
> > > > > this API.
> > > > 
> > > > This is a big better, but not quite.  Let me carve out some time today
> > > > to knock something a bit nicer together...
> > > 
> > > Ok, here's a rough first-cut.  It builds, and boots, and I've converted
> > > a driver to use the api to prove it works here.  I'll add a bunch more
> > > documentation before turning it into a "real" patch, but this should
> > > give you something to work off of.
> > > 
> > > I've run out of time for tonight (dinner is calling), but I think you
> > > get the idea, right?  If you want to knock up a rust binding for this
> > > api, it should almost be identical to the platform api you were trying
> > > to use before, right?
> > 
> > Yes, additionally, since this can't use the existing platform abstractions any
> > more, we need the bus abstraction for the virtual bus, i.e. the corresponding
> > driver::RegistrationOps implementation, module_virtual_driver macro, etc. Should
> > be a little less than 200 lines of code.
> 
> I hope so as the original C code for this is less than 200 lines of code :)
> 
> I wonder what it would look like to do a "real" bus in rust, maybe I'll
> try that someday, but for now, I want this to be used by C code...
> 
> > Other than in C, in Rust we don't need the "artificial" match between a virtual
> > device and a virtual driver to have automatic cleanup through things like
> > devm_kzalloc().
> 
> What artificial match?  Ah, you mean they would both be in the same
> "object"?
> 
> > But I guess we want it for consistency and to have the corresponding sysfs
> > entries and uevents. OOC, are there any other reasons?
> 
> I don't really understand the objection here.  Oooh, you want the C code
> to both create/manage the driver AND the device at the same time?  Hey I
> like that, it would make the interface to it even simpler!  Let me go
> try that, and see if it is what you are thinking of here...

Ok, here is a "simpler" version of the last patch in this series.  It
provides only 2 functions, a create and destroy.  Is this ok from a
rust-binding-point-of-view, or do you need more intermediate steps (and
if so, why?)

In my limited testing here, it works, but I haven't tested the destroy
paths to verify it yet, and there's still some debugging prints in here,
but it should give you all a good idea of what I'm thinking of.

comments?

thanks,

greg k-h

----------------


From 4c7aa0f9f0f7d25c962b70a11bad48d418b9490a Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 31 Jan 2025 15:01:32 +0100
Subject: [PATCH] driver core: add a virtual bus for use when a simple
 device/bus is needed

Many drivers abuse the platform driver/bus system as it provides a
simple way to create and bind a device to a driver-specific set of
probe/release functions.  Instead of doing that, and wasting all of the
memory associated with a platform device, here is a "virtual" bus that
can be used instead.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/Makefile          |   2 +-
 drivers/base/base.h            |   1 +
 drivers/base/init.c            |   1 +
 drivers/base/virtual.c         | 196 +++++++++++++++++++++++++++++++++
 drivers/regulator/dummy.c      |  35 ++----
 include/linux/device/virtual.h |  32 ++++++
 6 files changed, 239 insertions(+), 28 deletions(-)
 create mode 100644 drivers/base/virtual.c
 create mode 100644 include/linux/device/virtual.h

diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 7fb21768ca36..13eec7a1a9db 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -6,7 +6,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
 			   cpu.o firmware.o init.o map.o devres.o \
 			   attribute_container.o transport_class.o \
 			   topology.o container.o property.o cacheinfo.o \
-			   swnode.o
+			   swnode.o virtual.o
 obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
 obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
 obj-y			+= power/
diff --git a/drivers/base/base.h b/drivers/base/base.h
index 8cf04a557bdb..1eb68e416ee1 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -137,6 +137,7 @@ int hypervisor_init(void);
 static inline int hypervisor_init(void) { return 0; }
 #endif
 int platform_bus_init(void);
+int virtual_bus_init(void);
 void cpu_dev_init(void);
 void container_dev_init(void);
 #ifdef CONFIG_AUXILIARY_BUS
diff --git a/drivers/base/init.c b/drivers/base/init.c
index c4954835128c..58c98a156220 100644
--- a/drivers/base/init.c
+++ b/drivers/base/init.c
@@ -35,6 +35,7 @@ void __init driver_init(void)
 	of_core_init();
 	platform_bus_init();
 	auxiliary_bus_init();
+	virtual_bus_init();
 	memory_dev_init();
 	node_dev_init();
 	cpu_dev_init();
diff --git a/drivers/base/virtual.c b/drivers/base/virtual.c
new file mode 100644
index 000000000000..b05db4618d5c
--- /dev/null
+++ b/drivers/base/virtual.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+ * Copyright (c) 2025 The Linux Foundation
+ *
+ * A "simple" virtual bus that allows devices to be created and added
+ * automatically to it.  Whenever you need a device that is not "real",
+ * use this interface instead of even thinking of using a platform device.
+ *
+ */
+#include <linux/device/virtual.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include "base.h"
+
+/*
+ * Internal rapper structure so we can hold the memory
+ * for the driver and the name string of the virtual device.
+ */
+struct virtual_object {
+	struct virtual_device virt_dev;
+	struct device_driver driver;
+	const struct virtual_driver_ops *virt_ops;
+	char name[];
+};
+#define to_virtual_object(x) container_of_const(dev, struct virtual_object, virt_dev.dev);
+
+static struct device virtual_bus = {
+	.init_name	= "virt_bus",
+};
+
+static int virtual_match(struct device *dev, const struct device_driver *drv)
+{
+	struct virtual_object *virt_obj = to_virtual_object(dev);
+
+	dev_info(dev, "%s: driver: %s\n", __func__, drv->name);
+
+	/* Match is simple, strcmp()! */
+	return (strcmp(virt_obj->name, drv->name) == 0);
+}
+
+static int virtual_probe(struct device *dev)
+{
+	struct virtual_object *virt_obj = to_virtual_object(dev);
+	struct virtual_device *virt_dev = &virt_obj->virt_dev;
+	const struct virtual_driver_ops *virt_ops = virt_obj->virt_ops;
+	int ret = 0;
+
+	dev_info(dev, "%s\n", __func__);
+
+	if (virt_ops->probe)
+		ret = virt_ops->probe(virt_dev);
+
+	return ret;
+}
+
+static void virtual_remove(struct device *dev)
+{
+	struct virtual_object *virt_obj = to_virtual_object(dev);
+	struct virtual_device *virt_dev = &virt_obj->virt_dev;
+	const struct virtual_driver_ops *virt_ops = virt_obj->virt_ops;
+
+	dev_info(dev, "%s\n", __func__);
+
+	if (virt_ops->remove)
+		virt_ops->remove(virt_dev);
+}
+
+static const struct bus_type virtual_bus_type = {
+	.name		= "virtual",
+	.match		= virtual_match,
+	.probe		= virtual_probe,
+	.remove		= virtual_remove,
+};
+
+static void virtual_device_release(struct device *dev)
+{
+	struct virtual_object *virt_obj = to_virtual_object(dev);
+	struct device_driver *drv = &virt_obj->driver;
+
+	/*
+	 * Now that the device is going away, it has been unbound from the
+	 * driver we created for it, so it is safe to unregister the driver from
+	 * the system.
+	 */
+	driver_unregister(drv);
+
+	kfree(virt_obj);
+}
+
+/**
+ * __virtual_device_create - create and register a virtual device and driver
+ * @virt_ops: struct virtual_driver_ops that the new device will call back into
+ * @name: name of the device and driver we are adding
+ * @owner: module owner of the device/driver
+ *
+ * Create a new virtual device and driver, both with the same name, and register
+ * them in the driver core properly.  The probe() callback of @virt_ops will be
+ * called with the new device that is created for the caller to do something
+ * with.
+ */
+struct virtual_device *__virtual_device_create(struct virtual_driver_ops *virt_ops,
+					       const char *name, struct module *owner)
+{
+	struct device_driver *drv;
+	struct device *dev;
+	struct virtual_object *virt_obj;
+	struct virtual_device *virt_dev;
+	int ret;
+
+	pr_info("%s: %s\n", __func__, name);
+
+	virt_obj = kzalloc(sizeof(*virt_obj) + strlen(name) + 1, GFP_KERNEL);
+	if (!virt_obj)
+		return NULL;
+
+	/* Save off the name of the object into local memory */
+	strcpy(virt_obj->name, name);
+
+	/* Initialize the driver portion and register it with the driver core */
+	virt_obj->virt_ops = virt_ops;
+	drv = &virt_obj->driver;
+
+	drv->owner = owner;
+	drv->name = virt_obj->name;
+	drv->bus = &virtual_bus_type;
+	drv->probe_type = PROBE_PREFER_ASYNCHRONOUS;
+
+	ret = driver_register(drv);
+	if (ret) {
+		pr_err("%s: driver_register for %s virtual driver failed with %d\n",
+		       __func__, name, ret);
+		kfree(virt_obj);
+		return NULL;
+	}
+
+	/* Initialize the device portion and register it with the driver core */
+	virt_dev = &virt_obj->virt_dev;
+	dev = &virt_dev->dev;
+
+	device_initialize(dev);
+	dev->release = virtual_device_release;
+	dev->parent = &virtual_bus;
+	dev->bus = &virtual_bus_type;
+	dev_set_name(dev, "%s", name);
+
+	ret = device_add(dev);
+	if (ret) {
+		pr_err("%s: device_add for %s virtual device failed with %d\n",
+		       __func__, name, ret);
+		put_device(dev);
+		return NULL;
+	}
+
+	return virt_dev;
+}
+EXPORT_SYMBOL_GPL(__virtual_device_create);
+
+/**
+ * virtual_device_destroy - destroy a virtual device
+ * @virt_dev: virtual device to destroy
+ *
+ * Unregister and free all memory associated with a virtual device.
+ */
+void virtual_device_destroy(struct virtual_device *virt_dev)
+{
+	struct device *dev = &virt_dev->dev;
+
+	if (IS_ERR_OR_NULL(virt_dev))
+		return;
+
+	device_del(dev);
+
+	/* The final put_device() will clean up the driver we created for this device. */
+	put_device(dev);
+}
+EXPORT_SYMBOL_GPL(virtual_device_destroy);
+
+int __init virtual_bus_init(void)
+{
+	int error;
+
+	error = device_register(&virtual_bus);
+	if (error) {
+		put_device(&virtual_bus);
+		return error;
+	}
+
+	error =  bus_register(&virtual_bus_type);
+	if (error)
+		device_unregister(&virtual_bus);
+
+	return error;
+}
diff --git a/drivers/regulator/dummy.c b/drivers/regulator/dummy.c
index 5b9b9e4e762d..875c36a66971 100644
--- a/drivers/regulator/dummy.c
+++ b/drivers/regulator/dummy.c
@@ -13,7 +13,7 @@
 
 #include <linux/err.h>
 #include <linux/export.h>
-#include <linux/platform_device.h>
+#include <linux/device/virtual.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 
@@ -37,15 +37,15 @@ static const struct regulator_desc dummy_desc = {
 	.ops = &dummy_ops,
 };
 
-static int dummy_regulator_probe(struct platform_device *pdev)
+static int dummy_regulator_probe(struct virtual_device *vdev)
 {
 	struct regulator_config config = { };
 	int ret;
 
-	config.dev = &pdev->dev;
+	config.dev = &vdev->dev;
 	config.init_data = &dummy_initdata;
 
-	dummy_regulator_rdev = devm_regulator_register(&pdev->dev, &dummy_desc,
+	dummy_regulator_rdev = devm_regulator_register(&vdev->dev, &dummy_desc,
 						       &config);
 	if (IS_ERR(dummy_regulator_rdev)) {
 		ret = PTR_ERR(dummy_regulator_rdev);
@@ -56,36 +56,17 @@ static int dummy_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver dummy_regulator_driver = {
+struct virtual_driver_ops dummy_regulator_driver = {
 	.probe		= dummy_regulator_probe,
-	.driver		= {
-		.name		= "reg-dummy",
-		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
-	},
 };
 
-static struct platform_device *dummy_pdev;
+static struct virtual_device *dummy_vdev;
 
 void __init regulator_dummy_init(void)
 {
-	int ret;
-
-	dummy_pdev = platform_device_alloc("reg-dummy", -1);
-	if (!dummy_pdev) {
+	dummy_vdev = virtual_device_create(&dummy_regulator_driver, "reg-dummy");
+	if (!dummy_vdev) {
 		pr_err("Failed to allocate dummy regulator device\n");
 		return;
 	}
-
-	ret = platform_device_add(dummy_pdev);
-	if (ret != 0) {
-		pr_err("Failed to register dummy regulator device: %d\n", ret);
-		platform_device_put(dummy_pdev);
-		return;
-	}
-
-	ret = platform_driver_register(&dummy_regulator_driver);
-	if (ret != 0) {
-		pr_err("Failed to register dummy regulator driver: %d\n", ret);
-		platform_device_unregister(dummy_pdev);
-	}
 }
diff --git a/include/linux/device/virtual.h b/include/linux/device/virtual.h
new file mode 100644
index 000000000000..cfd1c6ab541d
--- /dev/null
+++ b/include/linux/device/virtual.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+ * Copyright (c) 2025 The Linux Foundation
+ *
+ * A "simple" virtual bus that allows devices to be created and added
+ * automatically to it.  Whenever you need a device that is not "real",
+ * use this interface instead of even thinking of using a platform device.
+ *
+ */
+#ifndef _VIRTUAL_DEVICE_H_
+#define _VIRTUAL_DEVICE_H_
+
+#include <linux/module.h>
+#include <linux/device.h>
+
+struct virtual_device {
+	struct device dev;
+};
+#define to_virtual_device(x) container_of_const((x), struct virtual_device, dev)
+
+struct virtual_driver_ops {
+	int (*probe)(struct virtual_device *virt_dev);
+	void (*remove)(struct virtual_device *virt_dev);
+};
+
+#define virtual_device_create(virt_ops, name) __virtual_device_create(virt_ops, name, THIS_MODULE)
+struct virtual_device *__virtual_device_create(struct virtual_driver_ops *virt_ops,
+					       const char *name, struct module *module);
+void virtual_device_destroy(struct virtual_device *virt_dev);
+
+#endif /* _VIRTUAL_DEVICE_H_ */
-- 
2.48.1

