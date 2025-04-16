Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9111F8753
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814992; cv=none; b=aRHbE31aFDcIwPYKP2hgDAuGVsq0u/HUskZovuVd9ajHgrGH5H2lB3zQ2KCoDUF6xrDxeccEFnU5lYKOab3eYDj7r5j8eczX0JXndBKFUyFeKLtuU2C0t77+Mvu3YJgqaa0PUDJsp57cqU//mnbIO9EW0+GNBHV9yVkxuvyxzK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814992; c=relaxed/simple;
	bh=BF+JAj2OOaQYBf1pV/aU5GDWs5SSoNcddA0RfvFTnYo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dGoI1P0SBmAS3EhQv9fZMkH5NaZUFXpJG92b8X7dOCqtWzcMpgr7bxS/b3JscAqiwT+J2NBvz8A+Cto3ZDCd64ZrHprHLlDZZcydVIRb6dwl+BwtT9nvYzAVWgccxbqGbH9y8LX7B4HiBvIB80Rv7MI9HUApqXcf51nSgwuiwws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uAVtuNV9; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uAVtuNV9"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-225ab228a37so60985835ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744814990; x=1745419790; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jpoAHz8CQifRQNDsLq9w1aYT2twGEmc33VKgu5HbVd4=;
        b=uAVtuNV90u42vXQatI0OcZSAgqes+VqY3kTKs0rsIPOGNfgVEkUC2JJTCY63wNpvxR
         6QbalZUGoQwLDhDzWflN45t8WWwie2BRi8O4ueyjUsSya9e9Wysz2xGeHlPs2sMNYoK+
         L28PD54C17IbfF5N2KhRejE00iJ0ZTUaxI6OrXhsdbI/BlmhKp3S0r/t7Tj256UXKL6/
         LJg93UMCpLjM89HYSzSn40Xm+jEW+b2DdOhDfuBnCdEj4B98n53vDlBkvG/iXeKOS6xm
         V6FRfcKhNLkx2zjOgMBth1RoYYQ/tr3c+p8Ye+EpNy8zsI31ZD2D5ZeBfRDsB1sgI00t
         JKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744814990; x=1745419790;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jpoAHz8CQifRQNDsLq9w1aYT2twGEmc33VKgu5HbVd4=;
        b=lVl+arrtvB3vJcMN0oCeM2Ol4g12rtJzZAO0wAN7Auh2tluKzrChE6qgKoJ24d4Kz4
         j3xiBY3u0r7g9zBWHBT21owshrvAcXY9ZyoHpZfA9+4HowUMVseXHfx4lKVNcwJSLyJj
         fTAEztDTaF6nvofsees+ofRiRerspV6QBljS4Wdbj463m+v4ZdKNUZd/ChU8ip1OTHtz
         ERiPPgnfp61ueBUczIX27K5st0AluTUcgns5zphBt65LjfJ5n3KB8eS5WVNp+2pb19WB
         PSVGgibcvjoEtMC0gP5Nz8zVh1UHAG6COctKj6ao3UC2eXFVGZyXZ4h59bZpjCAaWDRL
         pO0g==
X-Forwarded-Encrypted: i=1; AJvYcCUjqLDj10d/GYUVF0rA4fUchk78DBI0Db4DuOKFmIUJndRQ6mrYzjCQwnK/EF6udV+w20TPiyhdagk97GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXIQ4teVwNNM3ICnvCVD/vMH0quZBEiN8INkkLMmUiH95Z6Jfz
	LKOiXMEvJMIV9cVSy5r7CbiNi+JtWNiQMQf+4kjHoFqSqHogleDqz6NphknGPAMe6DOtfEXBt5Y
	byK/nohP5R/U35Q==
X-Google-Smtp-Source: AGHT+IHWFuvR6Ztz9iFG7HJ6rrbohaJudddMdBJrQPKvVdlWZLt0+eDvsLNfkM/8AlAMBx6OIgZF13ireeqRb9o=
X-Received: from plgw17.prod.google.com ([2002:a17:902:e891:b0:227:967c:4f38])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ef03:b0:223:3bf6:7e6a with SMTP id d9443c01a7336-22c358d9a54mr43379605ad.12.1744814989997;
 Wed, 16 Apr 2025 07:49:49 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:43:02 +0000
In-Reply-To: <20250416144917.16822-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416144917.16822-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416144917.16822-3-guanyulin@google.com>
Subject: [PATCH v12 2/4] usb: add apis for offload usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, sumit.garg@kernel.org, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com
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
 drivers/usb/core/driver.c | 109 ++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.c    |   1 +
 drivers/usb/host/Kconfig  |  11 ++++
 include/linux/usb.h       |  17 ++++++
 4 files changed, 138 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 460d4dde5994..76372690add0 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -2036,6 +2036,115 @@ int usb_disable_usb2_hardware_lpm(struct usb_device *udev)
 
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
+	udev->offload_usage++;
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
+	if (udev->offload_usage)
+		udev->offload_usage--;
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
+	return !!udev->offload_usage;
+}
+EXPORT_SYMBOL_GPL(usb_offload_check);
+
+#endif /* IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND) */
+
 const struct bus_type usb_bus_type = {
 	.name =		"usb",
 	.match =	usb_device_match,
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 118fa4c93a79..43efd9d939c0 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -670,6 +670,7 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
 	set_dev_node(&dev->dev, dev_to_node(bus->sysdev));
 	dev->state = USB_STATE_ATTACHED;
 	dev->lpm_disable_count = 1;
+	dev->offload_usage = 0;
 	atomic_set(&dev->urbnum, 0);
 
 	INIT_LIST_HEAD(&dev->ep0.urb_list);
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
index 1b2545b4363b..ec8d839e1e2b 100644
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
+	int offload_usage;
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
2.49.0.604.gff1f9ca942-goog

