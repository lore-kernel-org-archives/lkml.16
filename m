Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758E925F975
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 03:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744084746; cv=none; b=slklhwGRN/NF7wWBcwacYJW398oLd5SMi884UU3DekKmoTPOR/ZRqHPKQa+OT1fVHE2GwiPt8IxQx+ljn/usN7+Gk46PQrRZ7Uro3R9Mxl82YWGoRxECz7pvbzlReHL3JqwGi+ZJzw+F9OVry/5lpfZw2fyS9CTlBRpbLkAp//8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744084746; c=relaxed/simple;
	bh=RibN4QgqE5xMPr1ZKGpoGt2oAOe0z8rhNV3swHrAWD4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T5uKUqNsp5qdjk1D/uu+K34yqxjpf6MhSDnfjCwIv9f4pxl7YrTY+Tk2ddRHCDLogLE6FlzAf2deboIJODFq5pdXtU4pNuPxBf89bYbJKfYTvPX40Z32RKXUnnwAfE25mDFCGbdYTDjKKseTq7xYA3MHG8Lj3iUjNtAL7YtS8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ndg/Y+65; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ndg/Y+65"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-73009f59215so6056410b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 20:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744084743; x=1744689543; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OO5iv9e72a70N1g2aLkVy/GCvTS8/7rBW6udCvn3pog=;
        b=ndg/Y+655A373DlehK3SyiDB6YyDYyjhyqhmcLgqyIiSSzEdaWHjQrz4gKZ8GWq+pt
         B/j9YmZ2696M5maXEChD641ahXGeZkjLtKY+5HX2B/cmSki6N3Ku/lmEgoiddevZ0Li3
         7pS4lfrJwzwKEP9FSzDhqpw64lb/F45X2Jb3KuP222jZ1JCETBWt4yc+H2TAht7Kco1F
         vy14JuMoXB26IYKCd1TwGSHk3++MkGTSsiDyBAz/L/LN9ysQ2qeYMqI0QJKqDOaOet+c
         YYqA3/S+foQHWKhrw5/QpD3jdb+fGHkpAkOQX1Dp4bCMMr/8Dvuqg14KyaQjnZYpjrAE
         tQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744084743; x=1744689543;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OO5iv9e72a70N1g2aLkVy/GCvTS8/7rBW6udCvn3pog=;
        b=V3yIHto4NSNYVeMGu6gRQc5krz8xYmNCRP8lQvfYhuMi1Hq7NOrccqlepgrvUTtGlx
         RPJ5OCfw9bskkgHPx04i4quGSouxu2kHA2P4ntIkqLXnUTyphQ1c2m+SBZU6MBNRkwXc
         fg5aCwuHBuNK0v7dLpUccZZrRhw52PHP+M1JHpghOjIQ+mLV0BIWgx4FZOyi9G01LrIY
         hAxRShiNrJVv9yezMtdzpOAnnY66eg1VXwUxgIe+MXQBnDq9Uq+WF5uaEQvBCLwYLejX
         NAQgxfWR606W+T6gaKmOCC8PLrIaTvhA7X2BOvKtm/VCZdtP3ZcMKrEgC3Mz9U84GsW+
         8pPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNj2gZnEywRWTWexYixoXuzsEp0FO16AVIPrtnE6s+bjcf2BR3F/cJqArLNAKvH21afoPjQrm/HUmOrzM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxeu6tgjBwdAVR+9+ImqxUQGeDM+qGj5XMPp0xOHbSlzq6TycMo
	JejrV63jjswD+ClPjlT6lZEbekpTuFIoODMuEnGC+9cSjDnVZxUkEkuzcyxocWYBUgq5HSC7ZW3
	K/YKReDABgoFoRg==
X-Google-Smtp-Source: AGHT+IGUPMma6QbD+bHi6ubi7iRVOcAyPx/zMonP4drQkTzULbSKaVeWg3usn+yY4sbZsviN5z3GuhS6W1ei9zc=
X-Received: from pgbgb3.prod.google.com ([2002:a05:6a02:4b43:b0:af9:1196:c39c])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c887:b0:1fd:f48b:f397 with SMTP id adf61e73a8af0-201080117demr23193480637.23.1744084743655;
 Mon, 07 Apr 2025 20:59:03 -0700 (PDT)
Date: Tue,  8 Apr 2025 03:57:22 +0000
In-Reply-To: <20250408035833.844821-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408035833.844821-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408035833.844821-3-guanyulin@google.com>
Subject: [PATCH v11 2/4] usb: add apis for offload usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, gargaditya08@live.com, kekrby@gmail.com, 
	jeff.johnson@oss.qualcomm.com, elder@kernel.org, quic_zijuhu@quicinc.com, 
	ben@decadent.org.uk
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce offload_usage and corresponding apis to track offload usage
on each USB device. Offload denotes that there is another co-processor
accessing the USB device via the same USB host controller. To optimize
power usage, it's essential to monitor whether the USB device is
actively used by other co-processor. This information is vital when
determining if a USB device can be safely suspended during system power
state transitions.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/core/driver.c | 108 ++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.c    |   1 +
 drivers/usb/host/Kconfig  |  11 ++++
 include/linux/usb.h       |  17 ++++++
 4 files changed, 137 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 460d4dde5994..316526a05250 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -2036,6 +2036,114 @@ int usb_disable_usb2_hardware_lpm(struct usb_device *udev)
 
 #endif /* CONFIG_PM */
 
+#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
+
+/**
+ * usb_offload_get - increment the offload_usage of a USB device
+ * @udev: the USB device to increment its offload_usage
+ *
+ * Incrementing the offload_usage of a usb_device indicates that offload is
+ * enabled on this usb_device; that is, another entity is actively handling USB
+ * transfers. This information allows the USB driver to adjust its power
+ * management policy based on offload activity.
+ *
+ * The caller must hold @udev's device lock.
+ *
+ * Return: 0 on success. A negative error code otherwise.
+ */
+int usb_offload_get(struct usb_device *udev)
+{
+	int ret;
+
+	if (udev->state == USB_STATE_NOTATTACHED ||
+			udev->state == USB_STATE_SUSPENDED)
+		return -EAGAIN;
+
+	/*
+	 * offload_usage could only be modified when the device is active, since
+	 * it will alter the suspend flow of the device.
+	 */
+	ret = usb_autoresume_device(udev);
+
+	if (ret < 0)
+		return ret;
+
+	refcount_inc(&udev->offload_usage);
+	usb_autosuspend_device(udev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_offload_get);
+
+/**
+ * usb_offload_put - drop the offload_usage of a USB device
+ * @udev: the USB device to drop its offload_usage
+ *
+ * The inverse operation of usb_offload_get, which drops the offload_usage of
+ * a USB device. This information allows the USB driver to adjust its power
+ * management policy based on offload activity.
+ *
+ * The caller must hold @udev's device lock.
+ *
+ * Return: 0 on success. A negative error code otherwise.
+ */
+int usb_offload_put(struct usb_device *udev)
+{
+	int ret;
+
+	if (udev->state == USB_STATE_NOTATTACHED ||
+			udev->state == USB_STATE_SUSPENDED)
+		return -EAGAIN;
+
+	/*
+	 * offload_usage could only be modified when the device is active, since
+	 * it will alter the suspend flow of the device.
+	 */
+	ret = usb_autoresume_device(udev);
+
+	if (ret < 0)
+		return ret;
+
+	/* Drop the count when it wasn't 0, ignore the operation otherwise. */
+	ret = refcount_add_not_zero(-1, &udev->offload_usage);
+	usb_autosuspend_device(udev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_offload_put);
+
+/**
+ * usb_offload_check - check offload activities on a USB device
+ * @udev: the USB device to check its offload activity.
+ *
+ * Check if there are any offload activity on the USB device right now. This
+ * information could be used for power management or other forms of resource
+ * management.
+ *
+ * The caller must hold @udev's device lock.
+ *
+ * Returns true on any offload activity, false otherwise.
+ */
+bool usb_offload_check(struct usb_device *udev)
+{
+	struct usb_device *child;
+	bool active;
+	int port1;
+
+	usb_hub_for_each_child(udev, port1, child) {
+		device_lock(&child->dev);
+		active = usb_offload_check(child);
+		device_unlock(&child->dev);
+		if (active)
+			return true;
+	}
+
+	return !!refcount_read(&udev->offload_usage);
+}
+EXPORT_SYMBOL_GPL(usb_offload_check);
+
+#endif /* IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND) */
+
 const struct bus_type usb_bus_type = {
 	.name =		"usb",
 	.match =	usb_device_match,
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 0b4685aad2d5..765987813630 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -671,6 +671,7 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
 	dev->state = USB_STATE_ATTACHED;
 	dev->lpm_disable_count = 1;
 	atomic_set(&dev->urbnum, 0);
+	refcount_set(&dev->offload_usage, 0);
 
 	INIT_LIST_HEAD(&dev->ep0.urb_list);
 	dev->ep0.desc.bLength = USB_DT_ENDPOINT_SIZE;
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 033a9a4b51fe..b564f46f1c87 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -113,6 +113,17 @@ config USB_XHCI_SIDEBAND
 	  xHCI USB endpoints directly, allowing CPU to sleep while playing
 	  audio.
 
+config USB_XHCI_SIDEBAND_SUSPEND
+	  bool "xHCI support for sideband during system suspend"
+	  depends on USB_XHCI_SIDEBAND
+	  depends on USB_XHCI_PLATFORM
+	  depends on SUSPEND
+	  help
+	    Say 'Y' to enable the support for the xHCI sideband capability
+	    after system suspended. In addition to USB_XHCI_SIDEBAND, this
+	    config allows endpoints and interrupters associated with the
+	    sideband function when system is suspended.
+
 config USB_XHCI_TEGRA
 	tristate "xHCI support for NVIDIA Tegra SoCs"
 	depends on PHY_TEGRA_XUSB
diff --git a/include/linux/usb.h b/include/linux/usb.h
index b46738701f8d..f3a4064c729c 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -647,6 +647,7 @@ struct usb3_lpm_parameters {
  *	parent->hub_delay + wHubDelay + tTPTransmissionDelay (40ns)
  *	Will be used as wValue for SetIsochDelay requests.
  * @use_generic_driver: ask driver core to reprobe using the generic driver.
+ * @offload_usage: number of offload activities happening on this usb device.
  *
  * Notes:
  * Usbcore drivers should not set usbdev->state directly.  Instead use
@@ -733,6 +734,8 @@ struct usb_device {
 
 	u16 hub_delay;
 	unsigned use_generic_driver:1;
+
+	refcount_t offload_usage;
 };
 
 #define to_usb_device(__dev)	container_of_const(__dev, struct usb_device, dev)
@@ -839,6 +842,20 @@ static inline void usb_mark_last_busy(struct usb_device *udev)
 { }
 #endif
 
+#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
+int usb_offload_get(struct usb_device *udev);
+int usb_offload_put(struct usb_device *udev);
+bool usb_offload_check(struct usb_device *udev);
+#else
+
+static inline int usb_offload_get(struct usb_device *udev)
+{ return 0; }
+static inline int usb_offload_put(struct usb_device *udev)
+{ return 0; }
+static inline bool usb_offload_check(struct usb_device *udev)
+{ return false; }
+#endif
+
 extern int usb_disable_lpm(struct usb_device *udev);
 extern void usb_enable_lpm(struct usb_device *udev);
 /* Same as above, but these functions lock/unlock the bandwidth_mutex. */
-- 
2.49.0.504.g3bcea36a83-goog

