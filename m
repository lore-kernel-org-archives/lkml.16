Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D73C20E70F;
	Sun,  8 Jun 2025 23:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425624; cv=none; b=LYmETMBDzKw++d/P+arY7JIRVQ1s13tAVJWnu5nDQZp0vzuZ2mN+5ljk5FDHrU9PpYA7iYIZLWfxNPzewwmRgJO+mViGy9Vm7skqJs0s/g4t9FDF8GmGELwKfr8t9e2eftUZTfo2XtkNWT0ZjOKVhzXCka+uic7KavUQ5K+xvF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425624; c=relaxed/simple;
	bh=fdJpR3rWa/UemXi06y7bkqEwa2B8YYtR9GzbGqGYv+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YFOfwxmiavhdUktCr0jKIoJ1zWR49EhOnf7CyBxQvAz4QJGY+LZMZqO2K3S8PMMHUZ8GQ5bQCnMhQMf5LzBH6fzBEDULMEY4gznMHx2LSSLoaFtNYf/dHcjhKCaEcqKi7G3zZF1IwMmz2g1hMamwAe+iuSB5NfzvFWtbePp0A3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=tHXymT0w; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="tHXymT0w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=D097UiPOxZuavhBgTPj4Ae2cNRR5wuLKQGWNgI1WFz8=; b=tHXymT0wV7HGciSm
	iuRg0MfPLTWWC0KjWyvkZzAQZMKnhTI5MGdTNGcstLbbjhsWBc6en8YrnOjf6aw07mICuCO78DjSU
	5LC7v/d7yWOX7re3kgVWm7/DQ4uUC01yV6R2aOuVArekSwZE77jld2E6NXWPPHADAD9rjzg+XJssY
	IAe9UquXetLHEzNTIy7PZ2UGtLaur3n7sD1QELYE9z/OISXAmHF9H9ZxzzsAeMwZZE9S3iHoqvq/d
	k9/ujny1VIzkfLkzI5/VEMHxdO/0bHCxWaofeZkaZlxVFxlEPi2MF45jdM669FTF4WOLZUtnNNu0+
	j/UK0nOem/hwcN3xsg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uOPWG-008IvT-0N;
	Sun, 08 Jun 2025 23:33:40 +0000
From: linux@treblig.org
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/2] usb: gadget: Remove unused usb_remove_config
Date: Mon,  9 Jun 2025 00:33:38 +0100
Message-ID: <20250608233338.179894-3-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608233338.179894-1-linux@treblig.org>
References: <20250608233338.179894-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

usb_remove_config() was added in 2012's
commit Fixes: 51cce6fc155c ("usb: gadget: composite: Add
usb_remove_config")
but has remained unused.

I see there was a use in drivers/staging/cch that
was removed by
commit 515e6dd20b3f ("Staging: ccg: delete it from the tree")
but it had it's own copy of usb_remove_config()

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/usb/gadget/composite.c | 24 ------------------------
 include/linux/usb/composite.h  |  3 ---
 2 files changed, 27 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 8dbc132a505e..a0353a322704 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -1194,30 +1194,6 @@ static void remove_config(struct usb_composite_dev *cdev,
 	}
 }
 
-/**
- * usb_remove_config() - remove a configuration from a device.
- * @cdev: wraps the USB gadget
- * @config: the configuration
- *
- * Drivers must call usb_gadget_disconnect before calling this function
- * to disconnect the device from the host and make sure the host will not
- * try to enumerate the device while we are changing the config list.
- */
-void usb_remove_config(struct usb_composite_dev *cdev,
-		      struct usb_configuration *config)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&cdev->lock, flags);
-
-	if (cdev->config == config)
-		reset_config(cdev);
-
-	spin_unlock_irqrestore(&cdev->lock, flags);
-
-	remove_config(cdev, config);
-}
-
 /*-------------------------------------------------------------------------*/
 
 /* We support strings in multiple languages ... string descriptor zero
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index d8c4e9f73839..c18041fafa52 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -339,9 +339,6 @@ int usb_add_config(struct usb_composite_dev *,
 		struct usb_configuration *,
 		int (*)(struct usb_configuration *));
 
-void usb_remove_config(struct usb_composite_dev *,
-		struct usb_configuration *);
-
 /* predefined index for usb_composite_driver */
 enum {
 	USB_GADGET_MANUFACTURER_IDX	= 0,
-- 
2.49.0

