Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6FA19E97A;
	Thu,  6 Feb 2025 17:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863538; cv=none; b=SiAjeVHAYobo6eBqiEXqOl0p5HOa0HllWusiqSzF3xeIg+uRYF/gCxZhIk+eqEC4W8N7C6zPZvIBzgWQQUGqdQhgXmvTeCRMzD1Jj/0VDRLZcsdoB+8c03LsWWAY31Q2Z4tq73KLB0uglTw4OVD5jOcFbeFtoVRkiHpxyCCUnbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863538; c=relaxed/simple;
	bh=uG1jf8UBn71oaqEMlnsxCTDPrcr10ptV8dGDvLun9mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlidHvrFG8mPBrN9G73Torb8vYBf28UrLRHxLaeg0VRfSSFIzfjJFtwD8r0nIFFbOKoliUcZVTAEld8HbqBMQtDf7wrEJCH1YxzVgSFM/euZohx60xRuwPraTOPq7fNfdRSVeBwuIq/zCmCfsdrrtAFs5UI8apXWWnIjEfOydvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MFnF6Wvc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MFnF6Wvc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE16C4CEDD;
	Thu,  6 Feb 2025 17:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738863537;
	bh=uG1jf8UBn71oaqEMlnsxCTDPrcr10ptV8dGDvLun9mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MFnF6WvcYLRm0OXGEw4Y9RyVbKE9gK+K5ewx2k82C348mXw9mAZ1Gv5q1eWpx2SPa
	 XWWXseLnfDO8GeLx3cCf2NJXFYuFPh9L6UXxncbcsz+ATXROffgwZeQKhcGlDBvqBX
	 qpNtOMToM5TysLZMV7n0GZtY4PX7eT+Q1rLB0thg=
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
	Eric Piel <eric.piel@tremplin-utc.net>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 6/8] misc: lis3lv02d: convert to use faux_device
Date: Thu,  6 Feb 2025 18:38:20 +0100
Message-ID: <2025020625-uncrown-equation-ceb5@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025020620-skedaddle-olympics-1735@gregkh>
References: <2025020620-skedaddle-olympics-1735@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4142; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=uG1jf8UBn71oaqEMlnsxCTDPrcr10ptV8dGDvLun9mw=; b=owGbwMvMwCRo6H6F97bub03G02pJDOlLPk+0U2a6nlPc8O1Ut9bm/o9vP398f62d10FHR1LM+ FHXnu6VHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCR7xEM8x16l+vcuHLr+Z1l BV3e/k/0DnvsXMwwVzRVSbIh9ox5YtAsCwMuVxvOvwq3AA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The lis3lv02d driver does not need to create a platform device, it only
did so because it was simple to do that in order to get a place in sysfs
to hang some device-specific attributes.  Change it over to use the faux
device instead as this is NOT a real platform device, and it makes the
code even smaller than before.

Cc: Eric Piel <eric.piel@tremplin-utc.net>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 v3: new patch in the series.  For an example of the api working, does
     not have to be merged at this time, but I can take it if the
     maintainers give an ack.
 drivers/misc/lis3lv02d/lis3lv02d.c | 26 ++++++++++----------------
 drivers/misc/lis3lv02d/lis3lv02d.h |  4 ++--
 2 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/misc/lis3lv02d/lis3lv02d.c b/drivers/misc/lis3lv02d/lis3lv02d.c
index 4233dc4cc7d6..3db54b6673c9 100644
--- a/drivers/misc/lis3lv02d/lis3lv02d.c
+++ b/drivers/misc/lis3lv02d/lis3lv02d.c
@@ -14,7 +14,6 @@
 #include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/types.h>
-#include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/input.h>
 #include <linux/delay.h>
@@ -230,7 +229,7 @@ static int lis3lv02d_get_pwron_wait(struct lis3lv02d *lis3)
 			return 0;
 		}
 
-		dev_err(&lis3->pdev->dev, "Error unknown odrs-index: %d\n", odr_idx);
+		dev_err(&lis3->fdev->dev, "Error unknown odrs-index: %d\n", odr_idx);
 		return -ENXIO;
 	}
 
@@ -694,7 +693,7 @@ int lis3lv02d_joystick_enable(struct lis3lv02d *lis3)
 	input_dev->phys       = DRIVER_NAME "/input0";
 	input_dev->id.bustype = BUS_HOST;
 	input_dev->id.vendor  = 0;
-	input_dev->dev.parent = &lis3->pdev->dev;
+	input_dev->dev.parent = &lis3->fdev->dev;
 
 	input_dev->open = lis3lv02d_joystick_open;
 	input_dev->close = lis3lv02d_joystick_close;
@@ -855,32 +854,27 @@ static DEVICE_ATTR(position, S_IRUGO, lis3lv02d_position_show, NULL);
 static DEVICE_ATTR(rate, S_IRUGO | S_IWUSR, lis3lv02d_rate_show,
 					    lis3lv02d_rate_set);
 
-static struct attribute *lis3lv02d_attributes[] = {
+static struct attribute *lis3lv02d_attrs[] = {
 	&dev_attr_selftest.attr,
 	&dev_attr_position.attr,
 	&dev_attr_rate.attr,
 	NULL
 };
-
-static const struct attribute_group lis3lv02d_attribute_group = {
-	.attrs = lis3lv02d_attributes
-};
-
+ATTRIBUTE_GROUPS(lis3lv02d);
 
 static int lis3lv02d_add_fs(struct lis3lv02d *lis3)
 {
-	lis3->pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
-	if (IS_ERR(lis3->pdev))
-		return PTR_ERR(lis3->pdev);
+	lis3->fdev = faux_device_create_with_groups(DRIVER_NAME, NULL, lis3lv02d_groups);
+	if (!lis3->fdev)
+		return -ENODEV;
 
-	platform_set_drvdata(lis3->pdev, lis3);
-	return sysfs_create_group(&lis3->pdev->dev.kobj, &lis3lv02d_attribute_group);
+	faux_device_set_drvdata(lis3->fdev, lis3);
+	return 0;
 }
 
 void lis3lv02d_remove_fs(struct lis3lv02d *lis3)
 {
-	sysfs_remove_group(&lis3->pdev->dev.kobj, &lis3lv02d_attribute_group);
-	platform_device_unregister(lis3->pdev);
+	faux_device_destroy(lis3->fdev);
 	if (lis3->pm_dev) {
 		/* Barrier after the sysfs remove */
 		pm_runtime_barrier(lis3->pm_dev);
diff --git a/drivers/misc/lis3lv02d/lis3lv02d.h b/drivers/misc/lis3lv02d/lis3lv02d.h
index 195bd2fd2eb5..989a49e57554 100644
--- a/drivers/misc/lis3lv02d/lis3lv02d.h
+++ b/drivers/misc/lis3lv02d/lis3lv02d.h
@@ -5,7 +5,7 @@
  *  Copyright (C) 2007-2008 Yan Burman
  *  Copyright (C) 2008-2009 Eric Piel
  */
-#include <linux/platform_device.h>
+#include <linux/device/faux.h>
 #include <linux/input.h>
 #include <linux/regulator/consumer.h>
 #include <linux/miscdevice.h>
@@ -282,7 +282,7 @@ struct lis3lv02d {
 					*/
 
 	struct input_dev	*idev;     /* input device */
-	struct platform_device	*pdev;     /* platform device */
+	struct faux_device	*fdev;     /* faux device */
 	struct regulator_bulk_data regulators[2];
 	atomic_t		count;     /* interrupt count after last read */
 	union axis_conversion	ac;        /* hw -> logical axis */
-- 
2.48.1

