Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6265E2620C3;
	Thu,  8 May 2025 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695561; cv=none; b=kvbUO5OQ2BZxJyX/T7cellg5sKthP3HV7AwQIgYK67AsSiA6P7QUpGjoVipspkYfef2fyf6OTsNl/108AXg36eLu8T7uxgSfjIXyNowD/ZgEC3qkcebZ2CCsI1Yt1LHD/TR5yOzMEe9lN7LOmHyEioYp9HSZQvzxFQPK0FdebzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695561; c=relaxed/simple;
	bh=aDQXPBJSPq71YXXDTtay6Yhgp8F4K1QARGRgNJzflMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=chvYQ9zFOYTztvvtxAB1UGqOUyQZXVkKszWPQHtIB1Fw7hRShOXMaEeLMhNB2msdSGJ/dccHEA76ueAQAO4mt1fKDhUHXXlVKcCPyjWSttwo8VI78d5YQihKcZBA5qpoLVOz9piew5FTBF0bRonBRqBA4CiTLFDlEBUfZ+MNetU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SECkIoGG; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SECkIoGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=H5
	pPk+fdJ+X2PXEfq/s9Mg1uzV+PQF3TnFhi+eQ2RFI=; b=SECkIoGG13WCIXqM+f
	lrU4zBU7zZEV1vbAEgbOATR4VuQVLQUH5nDvl2CwGopjOuaAlbRcKzD0MEw2EBCO
	0H5Xgsa9U9QY/j8JNWeY7xB+sHBWoGDoei3hvXFU8mJYoFhC5meqqcHkLacgNk43
	HhpwOUPQuxU4yE+pSNxu2XW3g=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnkrxXdRxoTLzdCA--.3706S4;
	Thu, 08 May 2025 17:11:56 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	markgross@kernel.org,
	arnd@arndb.de,
	eric.piel@tremplin-utc.net,
	valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH 2/2] usbip: convert to use faux_device
Date: Thu,  8 May 2025 17:11:48 +0800
Message-Id: <2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1746662386.git.zhouzongmin@kylinos.cn>
References: <cover.1746662386.git.zhouzongmin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDnkrxXdRxoTLzdCA--.3706S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3tFWxtF17ur17KrWrXFyDAwb_yoW8Wr13uo
	Z3JFyfXr1rGr1xu3y8Jan7tFsxZa1DuwsYkrZYyF4DCFZ3Zw1Ygry7GF1Yg3W5ur13KF1D
	tw1ft3s5XF1xJrZ7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxjXHDUUUU
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/1tbi7gxHq2gcc6g0qwAAs+

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

The vhci driver does not need to create a platform device,
it only did so because it was simple to do that in order to
get a place in sysfs to hang some device-specific attributes.
Now the faux device interface is more appropriate,change it
over to use the faux bus instead.

Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 drivers/usb/usbip/vhci.h             |  4 +-
 drivers/usb/usbip/vhci_hcd.c         | 82 +++++++++++-----------------
 drivers/usb/usbip/vhci_sysfs.c       | 68 +++++++++++------------
 tools/usb/usbip/libsrc/vhci_driver.h |  2 +-
 4 files changed, 69 insertions(+), 87 deletions(-)

diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
index 5659dce1526e..a73070a3f450 100644
--- a/drivers/usb/usbip/vhci.h
+++ b/drivers/usb/usbip/vhci.h
@@ -93,7 +93,7 @@ enum hub_speed {
 struct vhci {
 	spinlock_t lock;
 
-	struct platform_device *pdev;
+	struct faux_device *fdev;
 
 	struct vhci_hcd *vhci_hcd_hs;
 	struct vhci_hcd *vhci_hcd_ss;
@@ -141,7 +141,7 @@ static inline __u32 port_to_rhport(__u32 port)
 	return port % VHCI_HC_PORTS;
 }
 
-static inline int port_to_pdev_nr(__u32 port)
+static inline int port_to_fdev_nr(__u32 port)
 {
 	return port / VHCI_PORTS;
 }
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index e70fba9f55d6..e0e9d7f2b3c8 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -9,7 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/device/faux.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 
@@ -1143,7 +1143,7 @@ static int hcd_name_to_id(const char *name)
 
 static int vhci_setup(struct usb_hcd *hcd)
 {
-	struct vhci *vhci = *((void **)dev_get_platdata(hcd->self.controller));
+	struct vhci *vhci = dev_get_platdata(hcd->self.controller);
 
 	if (usb_hcd_is_primary_hcd(hcd)) {
 		vhci->vhci_hcd_hs = hcd_to_vhci_hcd(hcd);
@@ -1257,7 +1257,7 @@ static int vhci_get_frame_number(struct usb_hcd *hcd)
 /* FIXME: suspend/resume */
 static int vhci_bus_suspend(struct usb_hcd *hcd)
 {
-	struct vhci *vhci = *((void **)dev_get_platdata(hcd->self.controller));
+	struct vhci *vhci = dev_get_platdata(hcd->self.controller);
 	unsigned long flags;
 
 	dev_dbg(&hcd->self.root_hub->dev, "%s\n", __func__);
@@ -1271,7 +1271,7 @@ static int vhci_bus_suspend(struct usb_hcd *hcd)
 
 static int vhci_bus_resume(struct usb_hcd *hcd)
 {
-	struct vhci *vhci = *((void **)dev_get_platdata(hcd->self.controller));
+	struct vhci *vhci = dev_get_platdata(hcd->self.controller);
 	int rc = 0;
 	unsigned long flags;
 
@@ -1336,20 +1336,19 @@ static const struct hc_driver vhci_hc_driver = {
 	.free_streams	= vhci_free_streams,
 };
 
-static int vhci_hcd_probe(struct platform_device *pdev)
+static int vhci_hcd_probe(struct faux_device *fdev)
 {
-	struct vhci             *vhci = *((void **)dev_get_platdata(&pdev->dev));
+	struct vhci             *vhci = dev_get_platdata(&fdev->dev);
 	struct usb_hcd		*hcd_hs;
 	struct usb_hcd		*hcd_ss;
 	int			ret;
 
-	usbip_dbg_vhci_hc("name %s id %d\n", pdev->name, pdev->id);
 
 	/*
 	 * Allocate and initialize hcd.
 	 * Our private data is also allocated automatically.
 	 */
-	hcd_hs = usb_create_hcd(&vhci_hc_driver, &pdev->dev, dev_name(&pdev->dev));
+	hcd_hs = usb_create_hcd(&vhci_hc_driver, &fdev->dev, dev_name(&fdev->dev));
 	if (!hcd_hs) {
 		pr_err("create primary hcd failed\n");
 		return -ENOMEM;
@@ -1366,8 +1365,8 @@ static int vhci_hcd_probe(struct platform_device *pdev)
 		goto put_usb2_hcd;
 	}
 
-	hcd_ss = usb_create_shared_hcd(&vhci_hc_driver, &pdev->dev,
-				       dev_name(&pdev->dev), hcd_hs);
+	hcd_ss = usb_create_shared_hcd(&vhci_hc_driver, &fdev->dev,
+				       dev_name(&fdev->dev), hcd_hs);
 	if (!hcd_ss) {
 		ret = -ENOMEM;
 		pr_err("create shared hcd failed\n");
@@ -1394,9 +1393,9 @@ static int vhci_hcd_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void vhci_hcd_remove(struct platform_device *pdev)
+static void vhci_hcd_remove(struct faux_device *fdev)
 {
-	struct vhci *vhci = *((void **)dev_get_platdata(&pdev->dev));
+	struct vhci *vhci = dev_get_platdata(&fdev->dev);
 
 	/*
 	 * Disconnects the root hub,
@@ -1416,7 +1415,7 @@ static void vhci_hcd_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM
 
 /* what should happen for USB/IP under suspend/resume? */
-static int vhci_hcd_suspend(struct platform_device *pdev, pm_message_t state)
+static int vhci_hcd_suspend(struct faux_device *fdev, pm_message_t state)
 {
 	struct usb_hcd *hcd;
 	struct vhci *vhci;
@@ -1425,13 +1424,13 @@ static int vhci_hcd_suspend(struct platform_device *pdev, pm_message_t state)
 	int ret = 0;
 	unsigned long flags;
 
-	dev_dbg(&pdev->dev, "%s\n", __func__);
+	dev_dbg(&fdev->dev, "%s\n", __func__);
 
-	hcd = platform_get_drvdata(pdev);
+	hcd = faux_device_get_drvdata(fdev);
 	if (!hcd)
 		return 0;
 
-	vhci = *((void **)dev_get_platdata(hcd->self.controller));
+	vhci = dev_get_platdata(hcd->self.controller);
 
 	spin_lock_irqsave(&vhci->lock, flags);
 
@@ -1448,25 +1447,25 @@ static int vhci_hcd_suspend(struct platform_device *pdev, pm_message_t state)
 	spin_unlock_irqrestore(&vhci->lock, flags);
 
 	if (connected > 0) {
-		dev_info(&pdev->dev,
+		dev_info(&fdev->dev,
 			 "We have %d active connection%s. Do not suspend.\n",
 			 connected, str_plural(connected));
 		ret =  -EBUSY;
 	} else {
-		dev_info(&pdev->dev, "suspend vhci_hcd");
+		dev_info(&fdev->dev, "suspend vhci_hcd");
 		clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
 	}
 
 	return ret;
 }
 
-static int vhci_hcd_resume(struct platform_device *pdev)
+static int vhci_hcd_resume(struct faux_device *fdev)
 {
 	struct usb_hcd *hcd;
 
-	dev_dbg(&pdev->dev, "%s\n", __func__);
+	dev_dbg(&fdev->dev, "%s\n", __func__);
 
-	hcd = platform_get_drvdata(pdev);
+	hcd = faux_device_get_drvdata(fdev);
 	if (!hcd)
 		return 0;
 	set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
@@ -1482,25 +1481,19 @@ static int vhci_hcd_resume(struct platform_device *pdev)
 
 #endif
 
-static struct platform_driver vhci_driver = {
+static struct faux_device_ops vhci_driver = {
 	.probe	= vhci_hcd_probe,
 	.remove = vhci_hcd_remove,
-	.suspend = vhci_hcd_suspend,
-	.resume	= vhci_hcd_resume,
-	.driver	= {
-		.name = driver_name,
-	},
 };
 
-static void del_platform_devices(void)
+static void del_faux_devices(void)
 {
 	int i;
 
 	for (i = 0; i < vhci_num_controllers; i++) {
-		platform_device_unregister(vhcis[i].pdev);
-		vhcis[i].pdev = NULL;
+		faux_device_destroy(vhcis[i].fdev);
+		vhcis[i].fdev = NULL;
 	}
-	sysfs_remove_link(&platform_bus.kobj, driver_name);
 }
 
 static int __init vhci_hcd_init(void)
@@ -1517,24 +1510,16 @@ static int __init vhci_hcd_init(void)
 	if (vhcis == NULL)
 		return -ENOMEM;
 
-	ret = platform_driver_register(&vhci_driver);
-	if (ret)
-		goto err_driver_register;
-
 	for (i = 0; i < vhci_num_controllers; i++) {
 		void *vhci = &vhcis[i];
-		struct platform_device_info pdevinfo = {
-			.name = driver_name,
-			.id = i,
-			.data = &vhci,
-			.size_data = sizeof(void *),
-		};
-
-		vhcis[i].pdev = platform_device_register_full(&pdevinfo);
-		ret = PTR_ERR_OR_ZERO(vhcis[i].pdev);
-		if (ret < 0) {
+		char vhci_name[16];
+
+		snprintf(vhci_name, 16, "%s.%d", driver_name, i);
+
+		vhcis[i].fdev = faux_device_create_with_groups(vhci_name, NULL, &vhci_driver, NULL, vhci);
+		if (!vhcis[i].fdev) {
 			while (i--)
-				platform_device_unregister(vhcis[i].pdev);
+				faux_device_destroy(vhcis[i].fdev);
 			goto err_add_hcd;
 		}
 	}
@@ -1542,16 +1527,13 @@ static int __init vhci_hcd_init(void)
 	return 0;
 
 err_add_hcd:
-	platform_driver_unregister(&vhci_driver);
-err_driver_register:
 	kfree(vhcis);
 	return ret;
 }
 
 static void __exit vhci_hcd_exit(void)
 {
-	del_platform_devices();
-	platform_driver_unregister(&vhci_driver);
+	del_faux_devices();
 	kfree(vhcis);
 }
 
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index d5865460e82d..d1e6b239399f 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -7,7 +7,7 @@
 #include <linux/kthread.h>
 #include <linux/file.h>
 #include <linux/net.h>
-#include <linux/platform_device.h>
+#include <linux/device/faux.h>
 #include <linux/slab.h>
 
 /* Hardening for Spectre-v1 */
@@ -28,7 +28,7 @@
  *
  * Output includes socket fd instead of socket pointer address to avoid
  * leaking kernel memory address in:
- *	/sys/devices/platform/vhci_hcd.0/status and in debug output.
+ *	/sys/devices/faux/vhci_hcd.0/status and in debug output.
  * The socket pointer address is not used at the moment and it was made
  * visible as a convenient way to find IP address from socket pointer
  * address by looking up /proc/net/{tcp,tcp6}. As this opens a security
@@ -60,9 +60,9 @@ static void port_show_vhci(char **out, int hub, int port, struct vhci_device *vd
 }
 
 /* Sysfs entry to show port status */
-static ssize_t status_show_vhci(int pdev_nr, char *out)
+static ssize_t status_show_vhci(int fdev_nr, char *out)
 {
-	struct platform_device *pdev = vhcis[pdev_nr].pdev;
+	struct faux_device *fdev = vhcis[fdev_nr].fdev;
 	struct vhci *vhci;
 	struct usb_hcd *hcd;
 	struct vhci_hcd *vhci_hcd;
@@ -70,12 +70,12 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
 	int i;
 	unsigned long flags;
 
-	if (!pdev || !out) {
+	if (!fdev || !out) {
 		usbip_dbg_vhci_sysfs("show status error\n");
 		return 0;
 	}
 
-	hcd = platform_get_drvdata(pdev);
+	hcd = faux_device_get_drvdata(fdev);
 	vhci_hcd = hcd_to_vhci_hcd(hcd);
 	vhci = vhci_hcd->vhci;
 
@@ -86,7 +86,7 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
 
 		spin_lock(&vdev->ud.lock);
 		port_show_vhci(&out, HUB_SPEED_HIGH,
-			       pdev_nr * VHCI_PORTS + i, vdev);
+			       fdev_nr * VHCI_PORTS + i, vdev);
 		spin_unlock(&vdev->ud.lock);
 	}
 
@@ -95,7 +95,7 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
 
 		spin_lock(&vdev->ud.lock);
 		port_show_vhci(&out, HUB_SPEED_SUPER,
-			       pdev_nr * VHCI_PORTS + VHCI_HC_PORTS + i, vdev);
+			       fdev_nr * VHCI_PORTS + VHCI_HC_PORTS + i, vdev);
 		spin_unlock(&vdev->ud.lock);
 	}
 
@@ -104,14 +104,14 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
 	return out - s;
 }
 
-static ssize_t status_show_not_ready(int pdev_nr, char *out)
+static ssize_t status_show_not_ready(int fdev_nr, char *out)
 {
 	char *s = out;
 	int i = 0;
 
 	for (i = 0; i < VHCI_HC_PORTS; i++) {
 		out += sprintf(out, "hs  %04u %03u ",
-				    (pdev_nr * VHCI_PORTS) + i,
+				    (fdev_nr * VHCI_PORTS) + i,
 				    VDEV_ST_NOTASSIGNED);
 		out += sprintf(out, "000 00000000 0000000000000000 0-0");
 		out += sprintf(out, "\n");
@@ -119,7 +119,7 @@ static ssize_t status_show_not_ready(int pdev_nr, char *out)
 
 	for (i = 0; i < VHCI_HC_PORTS; i++) {
 		out += sprintf(out, "ss  %04u %03u ",
-				    (pdev_nr * VHCI_PORTS) + VHCI_HC_PORTS + i,
+				    (fdev_nr * VHCI_PORTS) + VHCI_HC_PORTS + i,
 				    VDEV_ST_NOTASSIGNED);
 		out += sprintf(out, "000 00000000 0000000000000000 0-0");
 		out += sprintf(out, "\n");
@@ -148,16 +148,16 @@ static ssize_t status_show(struct device *dev,
 			   struct device_attribute *attr, char *out)
 {
 	char *s = out;
-	int pdev_nr;
+	int fdev_nr;
 
 	out += sprintf(out,
 		       "hub port sta spd dev      sockfd local_busid\n");
 
-	pdev_nr = status_name_to_id(attr->attr.name);
-	if (pdev_nr < 0)
-		out += status_show_not_ready(pdev_nr, out);
+	fdev_nr = status_name_to_id(attr->attr.name);
+	if (fdev_nr < 0)
+		out += status_show_not_ready(fdev_nr, out);
 	else
-		out += status_show_vhci(pdev_nr, out);
+		out += status_show_vhci(fdev_nr, out);
 
 	return out - s;
 }
@@ -213,13 +213,13 @@ static int vhci_port_disconnect(struct vhci_hcd *vhci_hcd, __u32 rhport)
 	return 0;
 }
 
-static int valid_port(__u32 *pdev_nr, __u32 *rhport)
+static int valid_port(__u32 *fdev_nr, __u32 *rhport)
 {
-	if (*pdev_nr >= vhci_num_controllers) {
-		pr_err("pdev %u\n", *pdev_nr);
+	if (*fdev_nr >= vhci_num_controllers) {
+		pr_err("fdev %u\n", *fdev_nr);
 		return 0;
 	}
-	*pdev_nr = array_index_nospec(*pdev_nr, vhci_num_controllers);
+	*fdev_nr = array_index_nospec(*fdev_nr, vhci_num_controllers);
 
 	if (*rhport >= VHCI_HC_PORTS) {
 		pr_err("rhport %u\n", *rhport);
@@ -233,7 +233,7 @@ static int valid_port(__u32 *pdev_nr, __u32 *rhport)
 static ssize_t detach_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
-	__u32 port = 0, pdev_nr = 0, rhport = 0;
+	__u32 port = 0, fdev_nr = 0, rhport = 0;
 	struct usb_hcd *hcd;
 	struct vhci_hcd *vhci_hcd;
 	int ret;
@@ -241,13 +241,13 @@ static ssize_t detach_store(struct device *dev, struct device_attribute *attr,
 	if (kstrtoint(buf, 10, &port) < 0)
 		return -EINVAL;
 
-	pdev_nr = port_to_pdev_nr(port);
+	fdev_nr = port_to_fdev_nr(port);
 	rhport = port_to_rhport(port);
 
-	if (!valid_port(&pdev_nr, &rhport))
+	if (!valid_port(&fdev_nr, &rhport))
 		return -EINVAL;
 
-	hcd = platform_get_drvdata(vhcis[pdev_nr].pdev);
+	hcd = faux_device_get_drvdata(vhcis[fdev_nr].fdev);
 	if (hcd == NULL) {
 		dev_err(dev, "port is not ready %u\n", port);
 		return -EAGAIN;
@@ -270,10 +270,10 @@ static ssize_t detach_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_WO(detach);
 
-static int valid_args(__u32 *pdev_nr, __u32 *rhport,
+static int valid_args(__u32 *fdev_nr, __u32 *rhport,
 		      enum usb_device_speed speed)
 {
-	if (!valid_port(pdev_nr, rhport)) {
+	if (!valid_port(fdev_nr, rhport)) {
 		return 0;
 	}
 
@@ -311,7 +311,7 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 {
 	struct socket *socket;
 	int sockfd = 0;
-	__u32 port = 0, pdev_nr = 0, rhport = 0, devid = 0, speed = 0;
+	__u32 port = 0, fdev_nr = 0, rhport = 0, devid = 0, speed = 0;
 	struct usb_hcd *hcd;
 	struct vhci_hcd *vhci_hcd;
 	struct vhci_device *vdev;
@@ -329,19 +329,19 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 	 */
 	if (sscanf(buf, "%u %u %u %u", &port, &sockfd, &devid, &speed) != 4)
 		return -EINVAL;
-	pdev_nr = port_to_pdev_nr(port);
+	fdev_nr = port_to_fdev_nr(port);
 	rhport = port_to_rhport(port);
 
-	usbip_dbg_vhci_sysfs("port(%u) pdev(%d) rhport(%u)\n",
-			     port, pdev_nr, rhport);
+	usbip_dbg_vhci_sysfs("port(%u) fdev(%d) rhport(%u)\n",
+			     port, fdev_nr, rhport);
 	usbip_dbg_vhci_sysfs("sockfd(%u) devid(%u) speed(%u)\n",
 			     sockfd, devid, speed);
 
 	/* check received parameters */
-	if (!valid_args(&pdev_nr, &rhport, speed))
+	if (!valid_args(&fdev_nr, &rhport, speed))
 		return -EINVAL;
 
-	hcd = platform_get_drvdata(vhcis[pdev_nr].pdev);
+	hcd = faux_device_get_drvdata(vhcis[fdev_nr].fdev);
 	if (hcd == NULL) {
 		dev_err(dev, "port %d is not ready\n", port);
 		return -EAGAIN;
@@ -413,8 +413,8 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 		goto unlock_mutex;
 	}
 
-	dev_info(dev, "pdev(%u) rhport(%u) sockfd(%d)\n",
-		 pdev_nr, rhport, sockfd);
+	dev_info(dev, "fdev(%u) rhport(%u) sockfd(%d)\n",
+		 fdev_nr, rhport, sockfd);
 	dev_info(dev, "devid(%u) speed(%u) speed_str(%s)\n",
 		 devid, speed, usb_speed_string(speed));
 
diff --git a/tools/usb/usbip/libsrc/vhci_driver.h b/tools/usb/usbip/libsrc/vhci_driver.h
index 6c9aca216705..20918e74de59 100644
--- a/tools/usb/usbip/libsrc/vhci_driver.h
+++ b/tools/usb/usbip/libsrc/vhci_driver.h
@@ -11,7 +11,7 @@
 
 #include "usbip_common.h"
 
-#define USBIP_VHCI_BUS_TYPE "platform"
+#define USBIP_VHCI_BUS_TYPE "faux"
 #define USBIP_VHCI_DEVICE_NAME "vhci_hcd.0"
 
 enum hub_speed {
-- 
2.25.1

