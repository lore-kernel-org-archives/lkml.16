Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA08D18C930;
	Thu,  6 Feb 2025 17:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863535; cv=none; b=fwBUaOJSKNSxp1YzixRYNa5ap0bcux6eGQmx+eFx083ucKNrsI8jtHy3rH4LyziGCpNg+PC9sFyptsZ6t4WzRAH9paGWTQ0K1QwwEBheWTCVR+OZ8bXTE0rv4vaIYFJJMsNh1noDV1jGZFCINYOeJznDAVLaDdHq2aUJYYEXS1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863535; c=relaxed/simple;
	bh=znFtKvPPaYztgKTaWjJ3kM2Hx0muydkEblyg0lJ2Hfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeWeucFLp/GPXpn7gORqZjpWgmEHa9GL0+Heq9cOKxi1tyxIQ8e/MQsQppzvsg0DpP8zM/tl1zOPtGcaLi6ttTMIxwmeMxWn2QIhtW2cHy40vIKUvpOAWtvkdC+xTSun/lXlTq4PXcKkxy7Pc5STHC8Nxm4/1GhjLBhk/cBHCdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dYcy4OGX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dYcy4OGX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDE5C4CEE2;
	Thu,  6 Feb 2025 17:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738863534;
	bh=znFtKvPPaYztgKTaWjJ3kM2Hx0muydkEblyg0lJ2Hfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dYcy4OGXDPfFetlTFMy5Y1JemLitNDUcqt1nut090U6V1FtFhp7B2pZL4gcGM4pJS
	 H9FC4J6Jyt1/jtZ3qKq9k60dCrng3xwR/MCa4yNV2NVv1ueMunk0wppNFjbzzsUuin
	 QtzviK1Khzhav1mylel9LgoFgCIGg/WvMJ9XuRT4=
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
	rust-for-linux@vger.kernel.org,
	Mark Gross <markgross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 5/8] tlclk: convert to use faux_device
Date: Thu,  6 Feb 2025 18:38:19 +0100
Message-ID: <2025020624-catlike-delay-fbf5@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025020620-skedaddle-olympics-1735@gregkh>
References: <2025020620-skedaddle-olympics-1735@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=znFtKvPPaYztgKTaWjJ3kM2Hx0muydkEblyg0lJ2Hfc=; b=owGbwMvMwCRo6H6F97bub03G02pJDOlLPk90mZZVMi/b5+z3fVc/8ia9stt65c2Fd4zfY7zmz Y5ocLFa0RHLwiDIxCArpsjyZRvP0f0VhxS9DG1Pw8xhZQIZwsDFKQAT2cTCMN8pv3J1vPWzr+o5 laanN70o1inl9GRY0BZV+mbj2Yxzpuu3JJj31lRH7p6VDgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The tlclk driver does not need to create a platform device, it only did
so because it was simple to do that in order to get a place in sysfs to
hang some device-specific attributes.  Change it over to use the faux
device instead as this is NOT a real platform device, and it makes the
code even smaller than before.

Cc: Mark Gross <markgross@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 v3: new patch in the series.  For an example of the api working, does
     not have to be merged at this time, but I can take it if the
     maintainers give an ack.
 drivers/char/tlclk.c | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/char/tlclk.c b/drivers/char/tlclk.c
index 377bebf6c925..97f64de61bdd 100644
--- a/drivers/char/tlclk.c
+++ b/drivers/char/tlclk.c
@@ -42,7 +42,7 @@
 #include <linux/sysfs.h>
 #include <linux/device.h>
 #include <linux/miscdevice.h>
-#include <linux/platform_device.h>
+#include <linux/device/faux.h>
 #include <asm/io.h>		/* inb/outb */
 #include <linux/uaccess.h>
 
@@ -742,7 +742,7 @@ static ssize_t store_reset (struct device *d,
 
 static DEVICE_ATTR(reset, (S_IWUSR|S_IWGRP), NULL, store_reset);
 
-static struct attribute *tlclk_sysfs_entries[] = {
+static struct attribute *tlclk_attrs[] = {
 	&dev_attr_current_ref.attr,
 	&dev_attr_telclock_version.attr,
 	&dev_attr_alarms.attr,
@@ -766,13 +766,9 @@ static struct attribute *tlclk_sysfs_entries[] = {
 	&dev_attr_reset.attr,
 	NULL
 };
+ATTRIBUTE_GROUPS(tlclk);
 
-static const struct attribute_group tlclk_attribute_group = {
-	.name = NULL,		/* put in device directory */
-	.attrs = tlclk_sysfs_entries,
-};
-
-static struct platform_device *tlclk_device;
+static struct faux_device *tlclk_device;
 
 static int __init tlclk_init(void)
 {
@@ -817,24 +813,13 @@ static int __init tlclk_init(void)
 		goto out3;
 	}
 
-	tlclk_device = platform_device_register_simple("telco_clock",
-				-1, NULL, 0);
-	if (IS_ERR(tlclk_device)) {
-		printk(KERN_ERR "tlclk: platform_device_register failed.\n");
-		ret = PTR_ERR(tlclk_device);
+	tlclk_device = faux_device_create_with_groups("telco_clock", NULL, tlclk_groups);
+	if (!tlclk_device) {
+		ret = -ENODEV;
 		goto out4;
 	}
 
-	ret = sysfs_create_group(&tlclk_device->dev.kobj,
-			&tlclk_attribute_group);
-	if (ret) {
-		printk(KERN_ERR "tlclk: failed to create sysfs device attributes.\n");
-		goto out5;
-	}
-
 	return 0;
-out5:
-	platform_device_unregister(tlclk_device);
 out4:
 	misc_deregister(&tlclk_miscdev);
 out3:
@@ -848,8 +833,7 @@ static int __init tlclk_init(void)
 
 static void __exit tlclk_cleanup(void)
 {
-	sysfs_remove_group(&tlclk_device->dev.kobj, &tlclk_attribute_group);
-	platform_device_unregister(tlclk_device);
+	faux_device_destroy(tlclk_device);
 	misc_deregister(&tlclk_miscdev);
 	unregister_chrdev(tlclk_major, "telco_clock");
 
-- 
2.48.1

