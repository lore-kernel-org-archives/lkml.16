Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4C61F1529;
	Fri, 31 Jan 2025 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341604; cv=none; b=mtHPGQ7dLvlgwQto59Lc9WYh61YrrlL9+dV5K1wUFqLGSb1I/o5tjHAg97PMsR25XiNOqIH5LNBBBE+SO0Y0I5qKvTsEKazt4opa3Vle9UxAlsvrKDH0yZ4GDg2TFJF7Ll6sxEthHuZtbimXfczpOuXetejAN04yLCCzyfL+3k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341604; c=relaxed/simple;
	bh=1BMGWoRMPguQcmdZmMAKa8mW+mK/0xFa042AO+EYMJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Elrl03plccKn1y9CPqlBKwbPNkQp2Gw54mLImeFfufMXiS11eHlW2kbk5Qk4Rqi8IHygLYL4G+q4cTWDgF16+3ZCTM5TbBhzrzFZn/Tex+OGofnhZ2QmwxV+P/Uv8d8w6tnONQjJ0WKrlFyyvDJx85DuEU3Ae0oKi+zd3fC1Eu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=amsujIN8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="amsujIN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F30C4CED1;
	Fri, 31 Jan 2025 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738341604;
	bh=1BMGWoRMPguQcmdZmMAKa8mW+mK/0xFa042AO+EYMJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=amsujIN8+Sf8nS5EYxUyC1YIyVc22yePuztD1ZoGnXHrAnSz3TB05LSkr+7cjoa5t
	 R+JrmCDmWB7qR46yokxeCqlXSHIMg0Gx5xeqdNWa3UAFmmAuYa2df3xQps1Twbcql6
	 nCxwkerH6FcKQZkYoO2wwDNkqSVqEYEcVOc/Ja00=
Date: Fri, 31 Jan 2025 17:40:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] WIP: drivers/base: Add virtual_device_create()
Message-ID: <2025013140-propeller-dirtiness-6cb4@gregkh>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025013159-shabby-professor-515b@gregkh>

On Fri, Jan 31, 2025 at 09:00:32AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Jan 30, 2025 at 04:28:26PM -0500, Lyude Paul wrote:
> > As Greg KH pointed out, we have a nice /sys/devices/virtual directory free
> > for the taking - but the vast majority of device drivers concerned with
> > virtual devices do not use this and instead misuse the platform device API.
> > 
> > To fix this, let's start by adding a simple function that can be used for
> > creating virtual devices - virtual_device_create().
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > 
> > ---
> > 
> > So, WIP obviously because I wrote this up in a few minutes - but this goes
> > off the idea that Danilo suggested to me off-list of coming up with a
> > simple API for handling virtual devices that's a little more obvious to
> > use. I wanted to get people's feedback and if we're happy with this idea,
> > I'm willing to go through and add some pointers to this function in various
> > platform API docs - along with porting over the C version of VKMS over to
> > this API.
> 
> This is a big better, but not quite.  Let me carve out some time today
> to knock something a bit nicer together...

Ok, here's a rough first-cut.  It builds, and boots, and I've converted
a driver to use the api to prove it works here.  I'll add a bunch more
documentation before turning it into a "real" patch, but this should
give you something to work off of.

I've run out of time for tonight (dinner is calling), but I think you
get the idea, right?  If you want to knock up a rust binding for this
api, it should almost be identical to the platform api you were trying
to use before, right?

thanks,

greg k-h

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
index 000000000000..6ade5dcbe2f3
--- /dev/null
+++ b/drivers/base/virtual.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+ * Copyright (c) 2025 Linux Foundation
+ */
+#include <linux/device/virtual.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include "base.h"
+
+/*
+ * Wrapper structure so we can hold the memory
+ * for the name string of the virtual device.
+ */
+struct virtual_object {
+	struct virtual_device virt_dev;
+	char name[];
+};
+
+static struct device virtual_bus = {
+	.init_name	= "virt_bus",
+};
+
+static int virtual_match(struct device *dev, const struct device_driver *drv)
+{
+	const struct virtual_driver *virt_drv = to_virtual_driver(drv);
+	const struct virtual_device *virt_dev = to_virtual_device(dev);
+
+	pr_info("%s: %s %s\n", __func__, virt_dev->name, virt_drv->name);
+
+	/* Match is simple, strcmp()! */
+	return (strcmp(virt_dev->name, virt_drv->name) == 0);
+}
+
+static int virtual_probe(struct device *dev)
+{
+	struct virtual_driver *virt_drv = to_virtual_driver(dev->driver);
+	struct virtual_device *virt_dev = to_virtual_device(dev);
+	int ret = 0;
+
+	if (virt_drv->probe)
+		ret = virt_drv->probe(virt_dev);
+
+	return ret;
+}
+
+static void virtual_remove(struct device *dev)
+{
+	struct virtual_driver *virt_drv = to_virtual_driver(dev->driver);
+	struct virtual_device *virt_dev = to_virtual_device(dev);
+
+	if (virt_drv->remove)
+		virt_drv->remove(virt_dev);
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
+	struct virtual_object *virt_obj = container_of(dev, struct virtual_object, virt_dev.dev);
+
+	kfree(virt_obj);
+}
+
+/**
+ * virtual_device_alloc - create a virtual device
+ * @name: name of the device we're adding
+ *
+ * Create a virtual device object which will be bound to any driver of the same name.
+ */
+struct virtual_device *virtual_device_alloc(const char *name)
+{
+	struct virtual_object *virt_obj;
+	struct virtual_device *virt_dev;
+
+	pr_info("%s: %s\n", __func__, name);
+
+	virt_obj = kzalloc(sizeof(*virt_obj) + strlen(name) + 1, GFP_KERNEL);
+	if (!virt_obj)
+		return NULL;
+
+	strcpy(virt_obj->name, name);
+	virt_dev = &virt_obj->virt_dev;
+	virt_dev->name = virt_obj->name;
+	device_initialize(&virt_dev->dev);
+	virt_dev->dev.release = virtual_device_release;
+
+	return virt_dev;
+}
+EXPORT_SYMBOL_GPL(virtual_device_alloc);
+
+int virtual_device_add(struct virtual_device *virt_dev)
+{
+	struct device *dev = &virt_dev->dev;
+
+	pr_info("%s: %s\n", __func__, virt_dev->name);
+
+	if (!dev->parent)
+		dev->parent = &virtual_bus;
+
+	dev_set_name(dev, "%s", virt_dev->name);
+	dev->bus = &virtual_bus_type;
+
+	return device_add(dev);
+}
+EXPORT_SYMBOL_GPL(virtual_device_add);
+
+/**
+ * virtual_device_del - remove a virtual device
+ * @virt_dev: virtual device to be removed
+ *
+ * This function must _only_ be externally called in error cases.  All other usage is a bug.
+ */
+void virtual_device_del(struct virtual_device *virt_dev)
+{
+	if (IS_ERR_OR_NULL(virt_dev))
+	    return;
+
+	device_del(&virt_dev->dev);
+}
+EXPORT_SYMBOL_GPL(virtual_device_del);
+
+/**
+ * virtual_device_put - destroy a platform device
+ * @virtual: virtual device to free
+ *
+ * Free all memory associated with a virtual device.  This function must
+ * _only_ be externally called in error cases.  All other usage is a bug.
+ */
+void virtual_device_put(struct virtual_device *virt_dev)
+{
+	if (IS_ERR_OR_NULL(virt_dev))
+	    return;
+
+	put_device(&virt_dev->dev);
+}
+EXPORT_SYMBOL_GPL(virtual_device_put);
+
+
+void virtual_device_unregister(struct virtual_device *virt_dev)
+{
+	virtual_device_del(virt_dev);
+	virtual_device_put(virt_dev);
+}
+EXPORT_SYMBOL_GPL(virtual_device_unregister);
+
+
+/**
+ * __virtual_driver_register - register a driver for virtual devices
+ * @virt_drv: virtual driver structure
+ * @owner: owning module/driver
+ */
+int __virtual_driver_register(struct virtual_driver *virt_drv, struct module *owner)
+{
+	struct device_driver *drv = &virt_drv->driver;
+
+	pr_info("%s: %s\n", __func__, virt_drv->name);
+
+	drv->owner = owner;
+	drv->name = virt_drv->name;
+	drv->bus = &virtual_bus_type;
+	drv->probe_type = PROBE_PREFER_ASYNCHRONOUS;
+
+	return driver_register(&virt_drv->driver);
+}
+EXPORT_SYMBOL_GPL(__virtual_driver_register);
+
+/**
+ * virtual_driver_unregister - unregister a driver for virtual devices
+ * @drv: virtual driver structure
+ */
+void virtual_driver_unregister(struct virtual_driver *virt_drv)
+{
+	driver_unregister(&virt_drv->driver);
+}
+EXPORT_SYMBOL_GPL(virtual_driver_unregister);
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
index 5b9b9e4e762d..652250455c6d 100644
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
@@ -56,36 +56,33 @@ static int dummy_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver dummy_regulator_driver = {
+static struct virtual_driver dummy_regulator_driver = {
+	.name		= "reg-dummy",
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
 	int ret;
 
-	dummy_pdev = platform_device_alloc("reg-dummy", -1);
-	if (!dummy_pdev) {
+	dummy_vdev = virtual_device_alloc("reg-dummy");
+	if (!dummy_vdev) {
 		pr_err("Failed to allocate dummy regulator device\n");
 		return;
 	}
 
-	ret = platform_device_add(dummy_pdev);
+	ret = virtual_device_add(dummy_vdev);
 	if (ret != 0) {
 		pr_err("Failed to register dummy regulator device: %d\n", ret);
-		platform_device_put(dummy_pdev);
+		virtual_device_put(dummy_vdev);
 		return;
 	}
 
-	ret = platform_driver_register(&dummy_regulator_driver);
+	ret = virtual_driver_register(&dummy_regulator_driver);
 	if (ret != 0) {
 		pr_err("Failed to register dummy regulator driver: %d\n", ret);
-		platform_device_unregister(dummy_pdev);
+		virtual_device_unregister(dummy_vdev);
 	}
 }
diff --git a/include/linux/device/virtual.h b/include/linux/device/virtual.h
new file mode 100644
index 000000000000..b646defe4a97
--- /dev/null
+++ b/include/linux/device/virtual.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+ * Copyright (c) 2025 Linux Foundation
+ */
+#ifndef _VIRTUAL_DEVICE_H
+#define _VIRTUAL_DEVICE_H_
+
+#include <linux/device.h>
+struct virtual_device {
+	struct device dev;
+	const char *name;
+
+};
+#define to_virtual_device(x) container_of_const((x), struct virtual_device, dev)
+
+struct virtual_driver {
+	struct device_driver driver;
+	const char *name;
+	int (*probe)(struct virtual_device *virt_dev);
+	void (*remove)(struct virtual_device *virt_dev);
+};
+#define to_virtual_driver(drv)	(container_of_const((drv), struct virtual_driver, driver))
+
+struct virtual_device *virtual_device_alloc(const char *name);
+int virtual_device_add(struct virtual_device *virt_dev);
+void virtual_device_del(struct virtual_device *virt_dev);
+void virtual_device_put(struct virtual_device *virt_dev);
+void virtual_device_unregister(struct virtual_device *virt_dev);
+
+#define virtual_driver_register(drv) __virtual_driver_register(drv, THIS_MODULE)
+int __virtual_driver_register(struct virtual_driver *virt_drv, struct module *module);
+void virtual_driver_unregister(struct virtual_driver *virt_drv);
+
+#endif /* _VIRTUAL_DEVICE_H_ */
-- 
2.48.1


