Received: from forward204d.mail.yandex.net (forward204d.mail.yandex.net [178.154.239.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890DC2BF003
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750093318; cv=none; b=gscYXbQ6f/q2d3FPM7FjfHRfzYsyVN5sOOu9ElLSEbcL7TXjUaB5aHLgdWmXvCD09jIxlV/s2kWhPOFZt2Qw9GQgRXtQsewscykjZ/2DTtvLnOaujqAnPK9aK+dVoXnrqFF6WY4SuEuSTpoO0GTUT0Be2QwQoLuzs6A8asHjjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750093318; c=relaxed/simple;
	bh=5xo+lbfsF6lcxheFO8vmhn4dX7FCjyvGLBuW5F5a+6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vy/4335D9UuOJtfRQOm4mxeIW7x9Yu8X+4zLHROKUpJIOzayAlkzVaxTFmO9JZebkTEe+PmPUavN5Lz+mw/EwNYOb8p+EWaDpByRBwV3bUcjiMlu7vQ1GOtwuEnfa6nEUVjuLQ/lKTTi4zwa1c8FgIlE4moKd3FzzwEzUG/w5GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=aVYXxVjd; arc=none smtp.client-ip=178.154.239.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="aVYXxVjd"
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d101])
	by forward204d.mail.yandex.net (Yandex) with ESMTPS id 8E6AD642B9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 19:54:07 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:c90:0:640:54cb:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id 4595D607AC;
	Mon, 16 Jun 2025 19:54:00 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id xrOLVM1LmKo0-rC3grap6;
	Mon, 16 Jun 2025 19:53:59 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1750092839; bh=HOjXKunqiFf9YRo7/zUDhfXWsdfuamqJ41+BQhAZcp4=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=aVYXxVjdqZ12b0mRbsEnLZLc1B5pltFFTuKXrsohZxjjLDmQh9g6LZPyZLajyKaig
	 bs6TMEnAnnRVEjy0ZDU3YmSmQs/F2TJXz2r8TU+hALrGYJY7HaSznm1UJws3FZ7rED
	 NH748ESfWnY297uvLmc4DapbPttLk8u7pqXXixV4=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] most: core, usb: fix generic device management
Date: Mon, 16 Jun 2025 19:53:21 +0300
Message-ID: <20250616165321.4130714-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzkaller reports [1, 2] refcount and use-after-free errors for
the generic 'struct device' data used here and there. An overall
usage of the generic device is somewhat confusing because the
same device instance is shared between 'struct most_dev' and
'struct most_interface' instances and as a parent of the device
embedded into 'struct most_dci_obj' instance pointed from the
former. This patch hopefully fixes both of the known issues
assumes the following:

1. Direct 'mdev->iface.dev = &mdev->dev' assignment performed in
   'hdm_probe()' is wrong and 'get_device()' should be used to
   not break an internal reference counting.
2. To use 'get_device()' in the code above, an underlying device
   should be properly initialized with 'device_initialize()'. So
   'most_register_interface()' should use 'device_add()' rather
   than 'device_register()'.
3. In 'hdm_disconnect()', 'put_device(&mdev->dci->dev)' is wrong
   because it's done from 'device_unregister(&mdev->dci->dev)'
   called from the above.

[1] https://syzkaller.appspot.com/bug?extid=d175ca7205b4f18390b1
[2] https://syzkaller.appspot.com/bug?extid=916742d5d24f6c254761

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/most/core.c     |  2 +-
 drivers/most/most_usb.c | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/most/core.c b/drivers/most/core.c
index a635d5082ebb..10951171e72d 100644
--- a/drivers/most/core.c
+++ b/drivers/most/core.c
@@ -1304,7 +1304,7 @@ int most_register_interface(struct most_interface *iface)
 	iface->dev->bus = &mostbus;
 	iface->dev->groups = interface_attr_groups;
 	dev_set_drvdata(iface->dev, iface);
-	if (device_register(iface->dev)) {
+	if (device_add(iface->dev)) {
 		dev_err(iface->dev, "Failed to register interface device\n");
 		kfree(iface->p);
 		put_device(iface->dev);
diff --git a/drivers/most/most_usb.c b/drivers/most/most_usb.c
index cf5be9c449a5..3ee7abd15a09 100644
--- a/drivers/most/most_usb.c
+++ b/drivers/most/most_usb.c
@@ -973,8 +973,13 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
 	mdev->usb_device = usb_dev;
 	mdev->link_stat_timer.expires = jiffies + (2 * HZ);
 
+	device_initialize(&mdev->dev);
+	mdev->dev.init_name = mdev->description;
+	mdev->dev.parent = &interface->dev;
+	mdev->dev.release = release_mdev;
+
 	mdev->iface.mod = hdm_usb_fops.owner;
-	mdev->iface.dev = &mdev->dev;
+	mdev->iface.dev = get_device(&mdev->dev);
 	mdev->iface.driver_dev = &interface->dev;
 	mdev->iface.interface = ITYPE_USB;
 	mdev->iface.configure = hdm_configure_channel;
@@ -993,9 +998,6 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
 		 usb_dev->config->desc.bConfigurationValue,
 		 usb_iface_desc->desc.bInterfaceNumber);
 
-	mdev->dev.init_name = mdev->description;
-	mdev->dev.parent = &interface->dev;
-	mdev->dev.release = release_mdev;
 	mdev->conf = kcalloc(num_endpoints, sizeof(*mdev->conf), GFP_KERNEL);
 	if (!mdev->conf)
 		goto err_free_mdev;
@@ -1126,7 +1128,6 @@ static void hdm_disconnect(struct usb_interface *interface)
 	kfree(mdev->cap);
 	kfree(mdev->conf);
 	kfree(mdev->ep_address);
-	put_device(&mdev->dci->dev);
 	put_device(&mdev->dev);
 }
 
-- 
2.49.0

