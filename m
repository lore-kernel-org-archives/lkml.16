Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9FD2236FB;
	Mon, 10 Feb 2025 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190661; cv=none; b=vFfbmspAxtd0p7tAHC7FJotubP7Eux7ZtRdx9YefkD6enghY0TsfM1lS3VdFb704oLA6oH152ob8wIPzaysOitq/4mfBMwvQfhnkw6oeh3OJpf69humYOc5Teq2eMsEu4x7Lu+tgLshP10/vrhtxMrPg21za+y2KyvXpQ5UwqJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190661; c=relaxed/simple;
	bh=ew0+zBCqG1VA/ogP8aDyNuoDhVj+tmIkdQxU3JOrNls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMXAtNqWoXmVktWJTkzZscmIFleVnUyl+EdZ/9vjer5s7rNuooJB5WlyKaIB4jGDgeRk1uUHCGYI/RC5Ng9tpzb1JYak6/lJwQtOvPVtrkmeRBgqnl0+a9iOMId35twJYHc7swxqTqnQ8mTECzGbjMTZRfRT2lu27W12QDXph+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i84t7Kf6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i84t7Kf6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B12AC4CED1;
	Mon, 10 Feb 2025 12:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739190660;
	bh=ew0+zBCqG1VA/ogP8aDyNuoDhVj+tmIkdQxU3JOrNls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i84t7Kf6mo4TCDWH+7GvXBe08t7X9wIWLXtSs3loTCxyhgkQsegO6oGVlCqEy0Wro
	 G736Bkj73rI6yQXMPN2OmCFLfRADSJYljJ28Wq4XfRRqzJ0Q2WGjjwBCrMaFZzgDHV
	 1TARz2WeEGim2KPo0lCFbhZtiWDbX1P774uVJ8es=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
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
Subject: [PATCH v4 6/9] tlclk: convert to use faux_device
Date: Mon, 10 Feb 2025 13:30:30 +0100
Message-ID: <2025021028-askew-smashing-4ff9@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025021023-sandstorm-precise-9f5d@gregkh>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3123; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=ew0+zBCqG1VA/ogP8aDyNuoDhVj+tmIkdQxU3JOrNls=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkrP6aordk8u1Bz3ry7X/4H1GaeWS91/+Fjs4Z5peerX 5++oX1qb0csC4MgE4OsmCLLl208R/dXHFL0MrQ9DTOHlQlkCAMXpwBMZMI7hnl6M19v/8m+4v6s R2XiUTZJb/8dO9/EsGC1+pXqw/PnuCjrPuoyslTQ/fprzwcA
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
v4: - api tweaked due to parent pointer added to faux_device create
      function.
 v3: new patch in the series.  For an example of the api working, does
     not have to be merged at this time, but I can take it if the
     maintainers give an ack.
 drivers/char/tlclk.c | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/char/tlclk.c b/drivers/char/tlclk.c
index 377bebf6c925..6c1d94eda5a2 100644
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
+	tlclk_device = faux_device_create_with_groups("telco_clock", NULL, NULL, tlclk_groups);
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

