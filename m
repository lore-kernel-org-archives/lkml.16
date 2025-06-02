Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CDD17B402
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748888802; cv=none; b=eIeMstjtQX6qYAcrU+4sne2fnnej42uYQzaqxWJmTLotvqH3iZqxiAQjY5Y1MEeUspe9HlUCeik6YiYILsmn1MpQfb8JrAQsx1zmJjowBBhitI5VXXhOjiKNl/JKNIMeC5uIyiJ14VVRjvHkSbhs7HPSNYkaNEH2o3dbVVQ1cAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748888802; c=relaxed/simple;
	bh=0kJ2WRrP/CIxdNzwnMJMxwH/M4XiX0kPqYG+skLGwx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J3MfPWYJA1jfh6eF9id+V31qPfescP5hH5slRJV6Z+/Ij+foBbROZ9RhmVfij+XagX+7DcOzzDDhHXs+R0nYSxW66BINtsJKo947sTmenocsOZmOPwPFcew3Fx/nlspdidygnePvyHugktopl6HNzGwieXxtfjlAdXD/33553Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=sDZBrXrk; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="sDZBrXrk"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id D4E95240028
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:26:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1748888790; bh=0kJ2WRrP/CIxdNzwnMJMxwH/M4XiX0kPqYG+skLGwx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:From;
	b=sDZBrXrkwhjYUQAtZBla/ETKw+3nqv8/GGtM1IICEpOfXHI5VEHK24AVWJIE4/ukd
	 UxRqNKrxIozPMMsj8wnCjUwcZKnQIamaQFyiZkV/SIzsCybINecq3UQbpwcNRP0o24
	 orXTWXI+iLzV6144vAtSAuBU6IXPXXivQaGd5M3UDya3b6PbRDu93CbpGEjVgitQK4
	 opCA+uM6GHu+wECj8GAQwHSJjrSAETumP1ZQHuypnBWQCu7qSwnSDA5BFUA5lS2Y6M
	 jcVCdgh/w5iTs5/bZeU9YxSIt+jD85WznjgJseYyA3A8XjD7C/zcpr8zuBFI+A2CNp
	 EBRiOIz4TqnDw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bB2Nj5PdSz9rxR;
	Mon,  2 Jun 2025 20:26:29 +0200 (CEST)
From: Charalampos Mitrodimas <charmitro@posteo.net>
Date: Mon, 02 Jun 2025 18:26:17 +0000
Subject: [PATCH] usb: misc: apple-mfi-fastcharge: Make power supply names
 unique
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-apple-mfi-fastcharge-duplicate-sysfs-v1-1-5d84de34fac6@posteo.net>
X-B4-Tracking: v=1; b=H4sIAMjsPWgC/x2NQQqDQAwAvyI5G1jXKuJXioetJhpQu2y2pSL+v
 cHjwDBzglISUuiLExJ9ReW9G1RlAeMS9plQJmPwzjeudR5DjCvhxoIcNJuTzJk+cZUxZEI9lBU
 dcd21j5evuANLxUQsv3vzHK7rDwlAdCt2AAAA
X-Change-ID: 20250602-apple-mfi-fastcharge-duplicate-sysfs-0ef3864b21f8
To: Bastien Nocera <hadess@hadess.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Charalampos Mitrodimas <charmitro@posteo.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748888780; l=3417;
 i=charmitro@posteo.net; s=20250526; h=from:subject:message-id;
 bh=0kJ2WRrP/CIxdNzwnMJMxwH/M4XiX0kPqYG+skLGwx8=;
 b=1pF/mprj1Qox2fiDlRv8AmhHjDakDfBE0ewmUKN6MVze2/fPeTZen3GPaDphlbZ7baNuGvWcH
 ndneKFKcKZIDSd0cUk1AcVS4n5aCqMYhQgLlt7LdBBVdFw1rocG9Xcz
X-Developer-Key: i=charmitro@posteo.net; a=ed25519;
 pk=PNHEh5o1dcr5kfKoZhfwdsfm3CxVfRje7vFYKIW0Mp4=

When multiple Apple devices are connected concurrently, the
apple-mfi-fastcharge driver fails to probe the subsequent devices with
the following error:

    sysfs: cannot create duplicate filename '/class/power_supply/apple_mfi_fastcharge'
    apple-mfi-fastcharge 5-2.4.3.3: probe of 5-2.4.3.3 failed with error -17

This happens because the driver uses a fixed power supply name
("apple_mfi_fastcharge") for all devices, causing a sysfs name
conflict when a second device is connected.

Fix this by generating unique names using the USB bus and device
number (e.g., "apple_mfi_fastcharge_5-12"). This ensures each
connected device gets a unique power supply entry in sysfs.

The change requires storing a copy of the power_supply_desc structure
in the per-device mfi_device struct, since the name pointer needs to
remain valid for the lifetime of the power supply registration.

Fixes: 249fa8217b84 ("USB: Add driver to control USB fast charge for iOS devices")
Signed-off-by: Charalampos Mitrodimas <charmitro@posteo.net>
---
 drivers/usb/misc/apple-mfi-fastcharge.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
index ac8695195c13c8752076e4391ac81a9da3780c44..8e852f4b8262e6e8fcd33883be8c5696f19b9ee9 100644
--- a/drivers/usb/misc/apple-mfi-fastcharge.c
+++ b/drivers/usb/misc/apple-mfi-fastcharge.c
@@ -44,6 +44,7 @@ MODULE_DEVICE_TABLE(usb, mfi_fc_id_table);
 struct mfi_device {
 	struct usb_device *udev;
 	struct power_supply *battery;
+	struct power_supply_desc battery_desc;
 	int charge_type;
 };
 
@@ -178,6 +179,7 @@ static int mfi_fc_probe(struct usb_device *udev)
 {
 	struct power_supply_config battery_cfg = {};
 	struct mfi_device *mfi = NULL;
+	char *battery_name;
 	int err;
 
 	if (!mfi_fc_match(udev))
@@ -187,23 +189,38 @@ static int mfi_fc_probe(struct usb_device *udev)
 	if (!mfi)
 		return -ENOMEM;
 
+	battery_name = kasprintf(GFP_KERNEL, "apple_mfi_fastcharge_%d-%d",
+				 udev->bus->busnum, udev->devnum);
+	if (!battery_name) {
+		err = -ENOMEM;
+		goto err_free_mfi;
+	}
+
+	mfi->battery_desc = apple_mfi_fc_desc;
+	mfi->battery_desc.name = battery_name;
+
 	battery_cfg.drv_data = mfi;
 
 	mfi->charge_type = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
 	mfi->battery = power_supply_register(&udev->dev,
-						&apple_mfi_fc_desc,
+						&mfi->battery_desc,
 						&battery_cfg);
 	if (IS_ERR(mfi->battery)) {
 		dev_err(&udev->dev, "Can't register battery\n");
 		err = PTR_ERR(mfi->battery);
-		kfree(mfi);
-		return err;
+		goto err_free_name;
 	}
 
 	mfi->udev = usb_get_dev(udev);
 	dev_set_drvdata(&udev->dev, mfi);
 
 	return 0;
+
+err_free_name:
+	kfree(battery_name);
+err_free_mfi:
+	kfree(mfi);
+	return err;
 }
 
 static void mfi_fc_disconnect(struct usb_device *udev)
@@ -213,6 +230,7 @@ static void mfi_fc_disconnect(struct usb_device *udev)
 	mfi = dev_get_drvdata(&udev->dev);
 	if (mfi->battery)
 		power_supply_unregister(mfi->battery);
+	kfree(mfi->battery_desc.name);
 	dev_set_drvdata(&udev->dev, NULL);
 	usb_put_dev(mfi->udev);
 	kfree(mfi);

---
base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
change-id: 20250602-apple-mfi-fastcharge-duplicate-sysfs-0ef3864b21f8

Best regards,
-- 
Charalampos Mitrodimas <charmitro@posteo.net>

