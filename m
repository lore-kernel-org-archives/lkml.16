Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAC619D8AC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743489038; cv=none; b=iSuTvuAh0cK6LHb5vc5eqzftyUXi/1m1TkgWuqZhJioFP/zXzjjcIQG4TK3eV1T8GFLnQISTFJ2dnB5CUb9HXrY9ilXzoL73XdeOna03v9Gej53NMLP5JHJE4EMwKfr89OHic1cEb7aYzw1nU4UH2ZN6fdxluZqSx/lAvC4+9dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743489038; c=relaxed/simple;
	bh=J/M6ym/3HaB2IbGY1t1wGYKVKwUFdldUw+cz1/kEueA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CiguxD9kafk01pAxNjJmoC+5gDv2pWEvZEeiZit6Sitkln2FBR0hwGjdeF4y9fH85HBz0hdJsv1p/hmfiwsQ5rxEno+CxIr6qXtqvwJXqxU9IGcuXcJn3id5xd/Th+8TlKtZvYkExT00A8dNyvlRl2cf3QweyOtlN9c4Y07xRnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZsQMq8Yw; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZsQMq8Yw"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so9510721a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743489036; x=1744093836; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jiFiSExmIpswe63JqhLJ7F3T/vXcNa8/l4kRqI6BHnI=;
        b=ZsQMq8YwldqdPww2aNNCtLvgl8PDT8tmJiIUQ1Y+v5kcO5/3+yiDquHKfU9TvvSrIS
         9o+MpZnuwTdxFExXq4WShoHwDscjDk+56zIorLOk4BAgedSwI/tgBgcif/j838Wij1Fb
         kHXKjkoPnsLLc50iQ+3dHPdbuN0NI1riP4wKYltSI1eDh3cZbXwmefwu0boPugjN8eNI
         t+7bRq5wrVYlBe3sobaRgbWy0zFEgsxDRnXXzXvoHwptMQnbJxlES8r9DNpAUJHUGzRz
         93NuCAz6qkf0lPlJ6DebT0ribC8VkiFRFfdvFt3A8Tv6cPCE5GmTLy78pH0u5gK0LERD
         Z1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743489036; x=1744093836;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jiFiSExmIpswe63JqhLJ7F3T/vXcNa8/l4kRqI6BHnI=;
        b=NcNS6ATfTE6QOTmFxVv2joBW/nLmQEWp5Upz3brofiqoAkWYVzafUeeE/O9zeuaIcO
         C/wphG9/wbL6cXFRFxVG3l4m4meeuoxBgnEDb7cgxG/00lhuMJg7y+wfnIE1JzT9tZYY
         xjMZSfMTnXDvN85pBaZqhuTMP2XAsHvwtHOitcSBQE+e4HZoJ7hechKKT6qkp6Xid2dZ
         q/8P5ZEE/fqeOJ7B/yVAj16nGt2ElWBdKdS9N8pDz60oiunNQdOutbRp+qHWITuiHiAm
         wDPLLQfu6icWH9aHiwYsryBn0qPDiAup+71EAor2UWKf+JT3f1ykxBCRxLwB34BluJ7h
         DOVw==
X-Forwarded-Encrypted: i=1; AJvYcCVsH/6BvOeDka7DWWrlxIXw0v4XmxXtDa1Re1GMLTPd+o907OCBV2+k0o2REMPEKUbAVQK6N97oLUO/DsE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv7fXJbIbGoAkYh+h9PX+Gi4XOSAqhIATrfzezOmLCQSxnjLqr
	TgpD9gjurVi/pTTeaOAHgEBsdwZznZbO9azfnvCDNe9tpYEryFJPiWolk1hO3a5Jabi0/ZEPT0R
	hpQzITpmwBQo4lw==
X-Google-Smtp-Source: AGHT+IGxI/ecbNMCBfYfN5C+BPG5kYRSq6a1FOzanRyj9Idz2E8lANjOYdUW6OJTmUG8JPe4h77qtxE+xQa7zhg=
X-Received: from pgbg26.prod.google.com ([2002:a63:521a:0:b0:aee:900e:e3d6])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3953:b0:1f6:6539:e026 with SMTP id adf61e73a8af0-2009f5fe141mr16978771637.15.1743489035752;
 Mon, 31 Mar 2025 23:30:35 -0700 (PDT)
Date: Tue,  1 Apr 2025 06:22:42 +0000
In-Reply-To: <20250401062951.3180871-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401062951.3180871-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401062951.3180871-5-guanyulin@google.com>
Subject: [PATCH v10 4/4] usb: host: enable USB offload during system sleep
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, sumit.garg@kernel.org, kekrby@gmail.com, 
	jeff.johnson@oss.qualcomm.com, elder@kernel.org, quic_zijuhu@quicinc.com, 
	ben@decadent.org.uk
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Sharing a USB controller with another entity via xhci-sideband driver
creates power management complexities. To prevent the USB controller
from being inadvertently deactivated while in use by the other entity, a
usage-count based mechanism is implemented. This allows the system to
manage power effectively, ensuring the controller remains available
whenever needed.
In order to maintain full functionality of an offloaded USB devices,
several changes are made within the suspend flow of such devices:
- skip usb_suspend_device() so that the port/hub are still active for
  USB transfers via offloaded path.
- not suspending the endpoints which are used by USB interfaces marked
  with needs_remote_wakeup. Namely, skip usb_suspend_interface() and
  usb_hcd_flush_endpoint() on associated USB interfaces. This reserves a
  pending interrupt urb during system suspend for handling the interrupt
  transfer, which is necessary since remote wakeup doesn't apply in the
  offloaded USB devices when controller is still active.
- not flushing the endpoints of actively offloaded USB devices. Given
  that the USB devices is used by another entity, unilaterally flush the
  endpoint might lead to unexpected behavior on another entity.
- not suspending the xhci controller. This is done by skipping the
  suspend/resume callbacks in the xhci platform driver.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/core/driver.c    | 33 +++++++++++++++++++++++++++------
 drivers/usb/host/xhci-plat.c | 19 +++++++++++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 include/linux/usb.h          |  2 ++
 4 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 2ba033bf7e4e..678106e1c520 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1420,11 +1420,20 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 			udev->state == USB_STATE_SUSPENDED)
 		goto done;
 
+	if (msg.event == PM_EVENT_SUSPEND && usb_offload_check(udev)) {
+		dev_dbg(&udev->dev, "device offload active, skip suspend.\n");
+		udev->offload_at_suspend = 1;
+	}
+
 	/* Suspend all the interfaces and then udev itself */
 	if (udev->actconfig) {
 		n = udev->actconfig->desc.bNumInterfaces;
 		for (i = n - 1; i >= 0; --i) {
 			intf = udev->actconfig->interface[i];
+			if (udev->offload_at_suspend && intf->needs_remote_wakeup) {
+				dev_dbg(&intf->dev, "active interface on offloaded devices\n");
+				continue;
+			}
 			status = usb_suspend_interface(udev, intf, msg);
 
 			/* Ignore errors during system sleep transitions */
@@ -1435,7 +1444,8 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 		}
 	}
 	if (status == 0) {
-		status = usb_suspend_device(udev, msg);
+		if (!udev->offload_at_suspend)
+			status = usb_suspend_device(udev, msg);
 
 		/*
 		 * Ignore errors from non-root-hub devices during
@@ -1480,9 +1490,11 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 	 */
 	} else {
 		udev->can_submit = 0;
-		for (i = 0; i < 16; ++i) {
-			usb_hcd_flush_endpoint(udev, udev->ep_out[i]);
-			usb_hcd_flush_endpoint(udev, udev->ep_in[i]);
+		if (!udev->offload_at_suspend) {
+			for (i = 0; i < 16; ++i) {
+				usb_hcd_flush_endpoint(udev, udev->ep_out[i]);
+				usb_hcd_flush_endpoint(udev, udev->ep_in[i]);
+			}
 		}
 	}
 
@@ -1524,17 +1536,26 @@ static int usb_resume_both(struct usb_device *udev, pm_message_t msg)
 	udev->can_submit = 1;
 
 	/* Resume the device */
-	if (udev->state == USB_STATE_SUSPENDED || udev->reset_resume)
-		status = usb_resume_device(udev, msg);
+	if (udev->state == USB_STATE_SUSPENDED || udev->reset_resume) {
+		if (!udev->offload_at_suspend)
+			status = usb_resume_device(udev, msg);
+		else
+			dev_dbg(&udev->dev, "device offload active, skip resume.\n");
+	}
 
 	/* Resume the interfaces */
 	if (status == 0 && udev->actconfig) {
 		for (i = 0; i < udev->actconfig->desc.bNumInterfaces; i++) {
 			intf = udev->actconfig->interface[i];
+			if (udev->offload_at_suspend) {
+				dev_dbg(&intf->dev, "active interface on offloaded devices\n");
+				continue;
+			}
 			usb_resume_interface(udev, intf, msg,
 					udev->reset_resume);
 		}
 	}
+	udev->offload_at_suspend = 0;
 	usb_mark_last_busy(udev);
 
  done:
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 9843d3ad5cf4..598f1b974347 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -20,6 +20,7 @@
 #include <linux/acpi.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
+#include <linux/usb/xhci-sideband.h>
 
 #include "xhci.h"
 #include "xhci-plat.h"
@@ -483,6 +484,15 @@ static int xhci_plat_suspend_common(struct device *dev)
 
 static int xhci_plat_suspend(struct device *dev)
 {
+	struct usb_hcd	*hcd = dev_get_drvdata(dev);
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+
+	if (xhci_sideband_check(hcd)) {
+		priv->sideband_at_suspend = 1;
+		dev_dbg(dev, "sideband instance active, skip suspend.\n");
+		return 0;
+	}
+
 	return xhci_plat_suspend_common(dev);
 }
 
@@ -535,6 +545,15 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 
 static int xhci_plat_resume(struct device *dev)
 {
+	struct usb_hcd	*hcd = dev_get_drvdata(dev);
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+
+	if (priv->sideband_at_suspend) {
+		priv->sideband_at_suspend = 0;
+		dev_dbg(dev, "sideband instance active, skip resume.\n");
+		return 0;
+	}
+
 	return xhci_plat_resume_common(dev, false);
 }
 
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index fe4f95e690fa..cd07b22adc60 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -15,6 +15,7 @@ struct usb_hcd;
 struct xhci_plat_priv {
 	const char *firmware_name;
 	unsigned long long quirks;
+	unsigned sideband_at_suspend:1;
 	bool power_lost;
 	void (*plat_start)(struct usb_hcd *);
 	int (*init_quirk)(struct usb_hcd *);
diff --git a/include/linux/usb.h b/include/linux/usb.h
index f3a4064c729c..bc3a84870907 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -648,6 +648,7 @@ struct usb3_lpm_parameters {
  *	Will be used as wValue for SetIsochDelay requests.
  * @use_generic_driver: ask driver core to reprobe using the generic driver.
  * @offload_usage: number of offload activities happening on this usb device.
+ * @offload_at_suspend: offload activities during suspend is enabled.
  *
  * Notes:
  * Usbcore drivers should not set usbdev->state directly.  Instead use
@@ -736,6 +737,7 @@ struct usb_device {
 	unsigned use_generic_driver:1;
 
 	refcount_t offload_usage;
+	unsigned offload_at_suspend:1;
 };
 
 #define to_usb_device(__dev)	container_of_const(__dev, struct usb_device, dev)
-- 
2.49.0.472.ge94155a9ec-goog

