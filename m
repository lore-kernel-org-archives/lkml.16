Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4293325F79F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 03:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744084761; cv=none; b=jup5FH/7rmnIuhiW7OCvMt11zkZ4CZwSeEdDTMxJ/1aFvdjcLSfrlgY+JomOQG/MOfS5JML+wyd9EPi5CZC4KSnjewIEFaFU2f+C2brUAD9tdaWjeffeyvl0xTv0KYVf7nhaBI7fycvsFNQjmAM10HGzES6aWBD216cniBwdrQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744084761; c=relaxed/simple;
	bh=N8IOtk+KCPgxRChOUScSPuKKtNbqdNsY+7biU5NAWu4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jhaM/JbuIJUXWn794ciHZl5ZtJIs+NvrN0izOlHT9mfz31H7Kt+gCJWhiVhMSMT48geGjcAtTACjDhbM9U11k1WRuTRjvFnnU9ezlcLzLfOMXL9blCkHAVUQaKkhGeg2hpmKKccxQ9pNUTc1+HVabwJofVqqp/FCc6XLDKmtEAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=na+nb6SM; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="na+nb6SM"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so5728461a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 20:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744084759; x=1744689559; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nq70c9PTBvJCLyTf24I/PKmrwX82PnQf7xrAJUmbXKs=;
        b=na+nb6SM0/ELWpUfjfd9txm89NircMZKoA+XG5isy8CY4Dxs9HrLI9fiBYTbMR9PGO
         36skXpVG1eRrpcjnkePBi+rhSmHJLiiX0bHeAA63t3AeQX4j/cSpXcjjEa/+oWGiV/PS
         9q0NHCMCYnGcHucVgObwrV2nAXyT+s+MhPUMSbo/Zrdc63qOix/db9j+9YBep5UqRAAc
         Tg7OTLcdAqE4k6vz5AV0EOMYucwK3FAU7uoqCUD5q0bIM9CBMdCHx04nz+nWR7UvaErB
         FdWmpvXID/jQ2qVSFjMcrK2m8WL2vRAHb8R/ysyqfjcarrWVpnka/DKXNu48Bx9CPiSE
         fG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744084759; x=1744689559;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nq70c9PTBvJCLyTf24I/PKmrwX82PnQf7xrAJUmbXKs=;
        b=dHiqlmRAL3Bxo+NWjBoImfSakQcer/vplcrT6GJx68jFTNtmnA3W29+OvogFxLZPPi
         6YApngCB7UN8Y50WvhW7zugBfUllOFQgYOXY2fZPw8JTgkejHf1Fb05SZ3IwbhmLqe+T
         PJGEi/qwW8+YCYzFQ/oTb/8qg1qD/C2gBEqRWxicemM0oRQ8rC+hrOeaFyZo+emQBDim
         jqacTt2ou9E1MdOue1z1I4gWa26K2VDYMxLRthApTKDRLDSk+2xglbCNOdqBJK5sX5Dc
         EOvnsJzUqXe56SbLGesgfzzC2GLoSWh7VNaeMvS8vPvfPBj19wFZhEyUruopsu/O2I+8
         GZaw==
X-Forwarded-Encrypted: i=1; AJvYcCW48TW6rdk3M0n9jLL3mi46Iog8zqc4U+I6HiylJQ8mmWLX4MzVWY2WHLvSk9YWNKJkGNGsz7pt3fP4XSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx68TU3zK5lX9lTQQv5vsDJbGKDYK8jvaJX//jrb1UEsecwTpAN
	YoQr71K5S79cWDmUbdZrIH9dIzCqOvLm9eQ726z4zE/B/XwgwM2Qj+hSWzHcRmp6ovfnJgWGg1Y
	GuLtFENdXl1S/8A==
X-Google-Smtp-Source: AGHT+IHmogGzsX9mjrOUn8Ny9K7H71dH/B3u0x+6YXO76QczAeRH2Kkvav8Kmqt4tB1Azg8tSHIMnIZYgppN084=
X-Received: from pgjc18.prod.google.com ([2002:a63:d152:0:b0:af3:27c:5603])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:2592:b0:1f5:8678:183d with SMTP id adf61e73a8af0-2010460355fmr27010355637.14.1744084759643;
 Mon, 07 Apr 2025 20:59:19 -0700 (PDT)
Date: Tue,  8 Apr 2025 03:57:24 +0000
In-Reply-To: <20250408035833.844821-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408035833.844821-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408035833.844821-5-guanyulin@google.com>
Subject: [PATCH v11 4/4] usb: host: enable USB offload during system sleep
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, gargaditya08@live.com, kekrby@gmail.com, 
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
 drivers/usb/core/driver.c    | 43 +++++++++++++++++++++++++++++++-----
 drivers/usb/host/xhci-plat.c | 19 ++++++++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 include/linux/usb.h          |  2 ++
 4 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 316526a05250..59b33e5e9a87 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1420,11 +1420,25 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
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
+			/*
+			 * Don't suspend interfaces with remote wakeup while the controller is
+			 * active. This preserves pending interrupt urbs, allowing interrupt
+			 * events to be handled during system suspend.
+			 */
+			if (udev->offload_at_suspend && intf->needs_remote_wakeup) {
+				dev_dbg(&intf->dev, "active interface on offloaded devices\n");
+				continue;
+			}
 			status = usb_suspend_interface(udev, intf, msg);
 
 			/* Ignore errors during system sleep transitions */
@@ -1435,7 +1449,8 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 		}
 	}
 	if (status == 0) {
-		status = usb_suspend_device(udev, msg);
+		if (!udev->offload_at_suspend)
+			status = usb_suspend_device(udev, msg);
 
 		/*
 		 * Ignore errors from non-root-hub devices during
@@ -1480,9 +1495,11 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
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
 
@@ -1524,17 +1541,31 @@ static int usb_resume_both(struct usb_device *udev, pm_message_t msg)
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
+			/*
+			 * Interfaces with remote wakeup aren't suspended while the controller is
+			 * active. This preserves pending interrupt urbs, allowing interrupt
+			 * events to be handled during system suspend.
+			 */
+			if (udev->offload_at_suspend && intf->needs_remote_wakeup) {
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
2.49.0.504.g3bcea36a83-goog

