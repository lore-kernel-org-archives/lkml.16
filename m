Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2E81D63F7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743489026; cv=none; b=kg+edYVUgW6RXKN7Q3zd41W27bUZWEtZzcHSfl6bHVIpnT4m2N/7hc+cQBZgX0qsykH0aJp+4l0RP+9Ug+7il2bY2x8JkVqp6ZTRWcXLNl0QZieQTze6qpX4d3CBet2S3CxlNH+7/ApEf635vj59YZJJy1GZofL32Q8IlWWIKf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743489026; c=relaxed/simple;
	bh=5hdFmL1/8j9W1i3kFN4YbzKflh7LQHd2tn0lFrzBHvY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ABh91B4V1zksCO2UcHKqYBEV016eThoEWq0mO0MNcQ+BzDT53dgf2qyFTEzSji4Kbr5cT0hZLEQfda/HUC98UhMuI1jCqQdi8ID1jrsJuD9LNnAjhdZ91cd5c2Lueyvq4vK6hcAqNDEf+pPt4Olo4esh3/Q1i135MYaLrr4ijqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vXMSfI3Z; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vXMSfI3Z"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-225429696a9so153653835ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743489024; x=1744093824; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=shtc6AwyPtBq3F/4afp3Rbwjl/RBBLfuWy8M0AyJIsI=;
        b=vXMSfI3Zr8pAnGexBfqDT3WgzdIM7xqC6p07wQnazQIVogoIywKTP3ciA4G1aEB6L9
         AdNudlBTtzNpwdllZVYS4NQBGPHtQQFIsyevbzXPoD08YxGNdCAuBKyp2udyDHMf78Hq
         zu8zSfOzcpckW/vxu3Vw8f+8iY3pR4M8YHtpGw9SPJnpfMOsGkJfvFVybk/6n7SpwheS
         M0K//VkGmAS+V66u/o4A7b0KTtejMACXkcPMesE3oRKypARnKpxrH9qd1d8iN7Vl/Z7V
         0nTIOIULCosYElBeUTOtKKjgMrsUjZLS9RtFqBzNYaq4348wieAT8qIis3l83rOZ36TT
         xhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743489024; x=1744093824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shtc6AwyPtBq3F/4afp3Rbwjl/RBBLfuWy8M0AyJIsI=;
        b=Mr8wb6VYhCcJVul49zzTaH+TEOZBG0p9UasdxfiO004z0Tz2liNOmbv2paBgm6s2jF
         v0CnC9N+j5CeAhlzWZUAFbsOe9XdPTRNcBiTRnSYJ2jvIhuoYb2/9ARW5z2S7j+EMLad
         3eMvo2CR4ieMaQZWpFo/vNHVBs5bN7znlkGK0Zkj2YEh2AF+HhcHm2DmiovwxBvD27A2
         Hn5bDRzg/PP5+OxnZj8HsFcVdpt1RZNnS04YMhA5yBLsZP2q2TWoIvVNQZCALHkWSN22
         +8AHf5WwVibCe7++RRqB9wWHrbsvGzRyh3LTcLLCUOk+6tYA2K72f5yu0JqsC68/A/cI
         dlmg==
X-Forwarded-Encrypted: i=1; AJvYcCXIvvGing0MTxMDwC2icTL+HXulbVg7BHBnXtOdCQwVVYsWXnORBkbSyyCswwZ/4aNAzbY2AiU6VetBy2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZTd2sSySOyU7UYRvDxMiju0lzAO0JwafVDCP7tkbIHab6+FGE
	zCeZqYwvpUGGNBnE6i/2DHflgXS8+fQMz3fzFZ26qK0joRNM6mz3Y+vtiRV0dqfadGlmknC3q/V
	HZHsZH1NiBx23vw==
X-Google-Smtp-Source: AGHT+IGcgZP316ToZ6krrKxx/ciI2kwrOMpIi/D+Dv/ZNnJAaMCHXUEldZscoIBJ06qbnxpc2R0mw6b56uMLyQQ=
X-Received: from pjbpq11.prod.google.com ([2002:a17:90b:3d8b:b0:2fa:1803:2f9f])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ea0a:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-2292f9f981amr192115765ad.46.1743489023775;
 Mon, 31 Mar 2025 23:30:23 -0700 (PDT)
Date: Tue,  1 Apr 2025 06:22:40 +0000
In-Reply-To: <20250401062951.3180871-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401062951.3180871-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401062951.3180871-3-guanyulin@google.com>
Subject: [PATCH v10 2/4] usb: add apis for offload usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, sumit.garg@kernel.org, kekrby@gmail.com, 
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
index 460d4dde5994..2ba033bf7e4e 100644
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
+	ret = pm_runtime_resume_and_get(&udev->dev);
+
+	if (ret < 0)
+		return ret;
+
+	refcount_inc(&udev->offload_usage);
+	pm_runtime_put_sync(&udev->dev);
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
+	ret = pm_runtime_resume_and_get(&udev->dev);
+
+	if (ret < 0)
+		return ret;
+
+	/* Drop the count when it wasn't 0, ignore the operation otherwise. */
+	ret = refcount_add_not_zero(-1, &udev->offload_usage);
+	pm_runtime_put_sync(&udev->dev);
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
2.49.0.472.ge94155a9ec-goog

