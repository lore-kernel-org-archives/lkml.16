Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E6F1FFC62
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815002; cv=none; b=Jav+RMjQ5x8Q5stliAJPPfgg6+V/B/7zrsROEkfIY/grGMyZ8TPXP4KLUpOfyXLG1B1JNDalpADfn5WcmyYVjONU98UDUHJwjW8jJ8OXVaWDoC+Ni70D53zwjkeH4OkZUx0HngliUsOhzVHJt1e8gvKJtmq7EhcKGelQU9L2xaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815002; c=relaxed/simple;
	bh=vamw0maEHaBukVhssMS+S6Gwg15K722frOBUN1+Eaec=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uvVXeISwPslAoMJCSfsuWZMJG9/T3Jporjw4humGld+kA6yOogxNQ3yGPZ5EI2q7/r2++aoMbieFbJmgn8HVc6VuFYkHz0km+9o8LRmcIBiG6mQmdMZgdg6BH17Ct5Jf64B9VhH45TsXWra1/tBSIdOLFHTH9BiRfk1Cy8jArpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ubkYjl5e; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ubkYjl5e"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736fff82264so721876b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744815000; x=1745419800; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7zUjS2x82QyAbbEFyP3zEMnOERceY+liurHl5RmB4q8=;
        b=ubkYjl5edCinKiSiDEnXN6QiG+Yed71AtQM9UQ7dsL8HN0BVwDTLe5ZjFkrTC4kOkK
         gD4VJjJfFxH0ymSUyxBTY+rybGRIeo/k7yfE8KX2OZfhlHNBH9QpsJQdAe5G1KsbL/Mi
         3yxpDfyWVWq/iYmwyZLdlaZHqej8mBho8NROfWX5jj61o6D3+Hqgxo3n6EOlxzGHyLgc
         LWBiYe+wbJjjQV71NlfJ2eX6I+GqGyKPCPYm6vIBmyHztuFrnrozHcaV4LRrM/ey5jPn
         z111ymyLwG/XOYvJpPCReNKYClk/QXIAHloCEE15z0S5vSaE9D1rkVJtsS7fLkmQbmUY
         kagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815000; x=1745419800;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zUjS2x82QyAbbEFyP3zEMnOERceY+liurHl5RmB4q8=;
        b=I4BqJVSBAO248ieSqQ/DAXsl3xAWjQDPIqs9SQ9mPCKWiU2s+TgkugwWPqlTHdHsmO
         V74e2TUU2evS4qyL4EBQ7EzZ5NzYxqeKXpUrV0rqXrLj4+ekAOmAcxBEX2r7mo7RaJNZ
         5XEz6vwYajSe8k1mGPaoHPDkEB5ru7Lvjv3YnLGp5Pt9MvC5oZOh6uSvVfOziQxuwi9N
         6EgRmjs6Ch3anHlem/+aAQ0B5zi9BhJAiirnmf97s6da26eTvmAgGDUeUI7SfnefaW28
         CKFwFOPB0SNc51Hrkwtt4B52rVqSc8RBYe7LcpSC4AwcTNloFPuzAhKOJXOqHLlI+KwI
         dDCg==
X-Forwarded-Encrypted: i=1; AJvYcCVLA2ERk1cs6rL6K8j90sJo9pcyGtAJxu+QzjF+ZyQk7MHPcds5MGCRJKSu37BJMNp278P7okyAJloxshk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi7CvI0xBGh+STW79Z3L6gcjh/OwDYuE45dEPqapasikiQfGjL
	B5mBfEB+x/Vf58B6cGYN0KWAsKLSD3iKF5oN1ysZ3/z8RpUEglDaHHP6yNipiIjDfGoUqc23Pbo
	JxoXtnQDLXJHlKw==
X-Google-Smtp-Source: AGHT+IHO9p0R6vx/xasgcNdYKoGnU97x1A00K9+39lodTTl67acuMpglei7UlMT7MGYETEDcubAg3m4QWvN/Hg4=
X-Received: from pfih17.prod.google.com ([2002:a05:6a00:2191:b0:736:a134:94ad])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3a96:b0:736:aea8:c9b7 with SMTP id d2e1a72fcca58-73c26d17aa0mr3050071b3a.2.1744815000385;
 Wed, 16 Apr 2025 07:50:00 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:43:04 +0000
In-Reply-To: <20250416144917.16822-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416144917.16822-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416144917.16822-5-guanyulin@google.com>
Subject: [PATCH v12 4/4] usb: host: enable USB offload during system sleep
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, sumit.garg@kernel.org, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com
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
 drivers/usb/core/driver.c    | 50 +++++++++++++++++++++++++++++++-----
 drivers/usb/host/xhci-plat.c | 19 ++++++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 include/linux/usb.h          |  7 ++---
 4 files changed, 68 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 76372690add0..6c3eb8fb6310 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1420,11 +1420,28 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 			udev->state == USB_STATE_SUSPENDED)
 		goto done;
 
+	if (msg.event == PM_EVENT_SUSPEND && usb_offload_check(udev)) {
+		dev_dbg(&udev->dev, "device offloaded, skip suspend.\n");
+		udev->offload_at_suspend = 1;
+	}
+
 	/* Suspend all the interfaces and then udev itself */
 	if (udev->actconfig) {
 		n = udev->actconfig->desc.bNumInterfaces;
 		for (i = n - 1; i >= 0; --i) {
 			intf = udev->actconfig->interface[i];
+			/*
+			 * Don't suspend interfaces with remote wakeup while
+			 * the controller is active. This preserves pending
+			 * interrupt urbs, allowing interrupt events to be
+			 * handled during system suspend.
+			 */
+			if (udev->offload_at_suspend &&
+			    intf->needs_remote_wakeup) {
+				dev_dbg(&intf->dev,
+					"device offloaded, skip suspend.\n");
+				continue;
+			}
 			status = usb_suspend_interface(udev, intf, msg);
 
 			/* Ignore errors during system sleep transitions */
@@ -1435,7 +1452,8 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 		}
 	}
 	if (status == 0) {
-		status = usb_suspend_device(udev, msg);
+		if (!udev->offload_at_suspend)
+			status = usb_suspend_device(udev, msg);
 
 		/*
 		 * Ignore errors from non-root-hub devices during
@@ -1480,9 +1498,11 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
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
 
@@ -1524,17 +1544,35 @@ static int usb_resume_both(struct usb_device *udev, pm_message_t msg)
 	udev->can_submit = 1;
 
 	/* Resume the device */
-	if (udev->state == USB_STATE_SUSPENDED || udev->reset_resume)
-		status = usb_resume_device(udev, msg);
+	if (udev->state == USB_STATE_SUSPENDED || udev->reset_resume) {
+		if (!udev->offload_at_suspend)
+			status = usb_resume_device(udev, msg);
+		else
+			dev_dbg(&udev->dev,
+				"device offloaded, skip resume.\n");
+	}
 
 	/* Resume the interfaces */
 	if (status == 0 && udev->actconfig) {
 		for (i = 0; i < udev->actconfig->desc.bNumInterfaces; i++) {
 			intf = udev->actconfig->interface[i];
+			/*
+			 * Interfaces with remote wakeup aren't suspended
+			 * while the controller is active. This preserves
+			 * pending interrupt urbs, allowing interrupt events
+			 * to be handled during system suspend.
+			 */
+			if (udev->offload_at_suspend &&
+			    intf->needs_remote_wakeup) {
+				dev_dbg(&intf->dev,
+					"device offloaded, skip resume.\n");
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
index ec8d839e1e2b..f5bca317fa4c 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -635,6 +635,8 @@ struct usb3_lpm_parameters {
  * @do_remote_wakeup:  remote wakeup should be enabled
  * @reset_resume: needs reset instead of resume
  * @port_is_suspended: the upstream port is suspended (L2 or U3)
+ * @offload_at_suspend: offload activities during suspend is enabled.
+ * @offload_usage: number of offload activities happening on this usb device.
  * @slot_id: Slot ID assigned by xHCI
  * @l1_params: best effor service latency for USB2 L1 LPM state, and L1 timeout.
  * @u1_params: exit latencies for USB3 U1 LPM state, and hub-initiated timeout.
@@ -647,7 +649,6 @@ struct usb3_lpm_parameters {
  *	parent->hub_delay + wHubDelay + tTPTransmissionDelay (40ns)
  *	Will be used as wValue for SetIsochDelay requests.
  * @use_generic_driver: ask driver core to reprobe using the generic driver.
- * @offload_usage: number of offload activities happening on this usb device.
  *
  * Notes:
  * Usbcore drivers should not set usbdev->state directly.  Instead use
@@ -724,6 +725,8 @@ struct usb_device {
 	unsigned do_remote_wakeup:1;
 	unsigned reset_resume:1;
 	unsigned port_is_suspended:1;
+	unsigned offload_at_suspend:1;
+	int offload_usage;
 	enum usb_link_tunnel_mode tunnel_mode;
 
 	int slot_id;
@@ -734,8 +737,6 @@ struct usb_device {
 
 	u16 hub_delay;
 	unsigned use_generic_driver:1;
-
-	int offload_usage;
 };
 
 #define to_usb_device(__dev)	container_of_const(__dev, struct usb_device, dev)
-- 
2.49.0.604.gff1f9ca942-goog

