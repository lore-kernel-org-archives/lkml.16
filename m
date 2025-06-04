Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C582C28C03F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025524; cv=none; b=VvNtGGHG6sKfvJx+8JMNDPlyEFUCXFlFucmNW2aHGY0O1/Ag/Qcwdb67SsOfQxOdoVer6Tb1ByFWghTjNyeNbxr5O+367xfXv6BsbrxVLAP9oT5ux1mYibnU6XJk13pK0m7yXoJt5UNJDbycq9THHNumOr6fQs8FVtc+1F6Auvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025524; c=relaxed/simple;
	bh=Cvi+qX7V3yh4py8CpZwCPartnmTTJXgQ4sjZDl9R9/A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aBLar7T0VVxDJO4I0WY/A+SnzbOIcdJ4b0Ihnz3xY4Pnxi4rJD5uvkegS30guLFe0uubtOgJQoQjUE4jmv1zP1G8VpZmG2jusleu3uxHay0xW2qUKcUE3C8a4wKcbR0rlzvhHjGsNgqwJlFadVpLJyeriFSOOnQX+APjGbfK5YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Ci6ILWt; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Ci6ILWt"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311c5d9307eso7539298a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749025522; x=1749630322; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SOf8xK1w9I70ecjXO2yVBy3evGt+tsMF73h7OsoKTPA=;
        b=2Ci6ILWtqbf7roXcMWUJEP2a1c64O9DeWB+x4crePr3RdzbRUcHv00WD4RwEQwZS2V
         dOz4zHcPb/jJXie7xaAVXUieeXhw1K3iW7Fg2tIyXojQzlVCsvFphzcoYxqpZDC6sQuZ
         WvGZ2jszpD2sSpQUw3BPp/hMF8bN6z897o2ALFZES0BlH0Aq6sqewlr9uu51hnUXXhxd
         E/g0LufzNgQA3aj/qjiT/3h+Gt3H6KAEkw/kqdPVbmEVgDvoBrtT27HVMAUkVAU5CCAC
         uku8aZBtZLiLnXlq6U/jcs0sIHUmK3QMbibai9aopH2qmOfE1/ub9OAJWW/URfpyZvnY
         PlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025522; x=1749630322;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SOf8xK1w9I70ecjXO2yVBy3evGt+tsMF73h7OsoKTPA=;
        b=K9kjk0nxWJ+xa1hjwWaRRZo97syCxerUN20rVJv5CH0L2n6/KvUDKpMe3jAb4kwCh6
         duvnPUBBnFY0PU6qPgsg8rtOccGiZNUm5DZO5CULOPqrCFuSPXzmkQp8OrUvOWYnLLE8
         2Pm7d73pPuglfVH7blHNa+Z4B5Yil4oo+cFHoPY0TByD6ClTK5asN9IwHz8LdidhfHnX
         VjASI9mVYfPHCRXdmnanGBvJlVffgEpH0qKghp98AHGcTuFmRc6hhWmWsQcMSfy1Ibc2
         w/Tce+MrJAvZoKW+xsaUSaY7aKs6ZnPWj4uanJnTEVcMA1y4OpIhpL+XNX1nsW1P/d3p
         2zaA==
X-Forwarded-Encrypted: i=1; AJvYcCUX9qQAfBV1faH0Ff94HoLgvJUExNwuZA+O3i6tZR7y6jG+40EEphl8cbWmlDCUXuEozjp8FYD3IPUp4Nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUjiY8rL1FbkHCBE6qp+n7Y9ltkIw8ge+w72YFHEw0m0eSYwpN
	yFM1QQXzokmbM7CNFRYQm2hAm0ylNofFETrW0k/QBJvK0rYgJgDoeESy4KQpPWw6OpBmInaFlgz
	ss/CmsA7b0pRjqryB7g==
X-Google-Smtp-Source: AGHT+IFa4wqPiZhy7ZpMV4W/HCewzpBEiKsh+nqcdFS4jdQgSaYy4I/p61WPgjisw4AoVzrQvLtPz+fYIbMzXVI=
X-Received: from pjbnd4.prod.google.com ([2002:a17:90b:4cc4:b0:312:f31a:af55])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2642:b0:311:df4b:4b91 with SMTP id 98e67ed59e1d1-3130ccf6f5cmr3245598a91.7.1749025522075;
 Wed, 04 Jun 2025 01:25:22 -0700 (PDT)
Date: Wed,  4 Jun 2025 08:23:08 +0000
In-Reply-To: <20250604082449.2029156-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604082449.2029156-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250604082449.2029156-3-guanyulin@google.com>
Subject: [PATCH v14 2/4] usb: offload: add apis for offload usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	sumit.garg@kernel.org
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
 drivers/usb/core/Kconfig   |  10 +++
 drivers/usb/core/Makefile  |   1 +
 drivers/usb/core/offload.c | 136 +++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.c     |   1 +
 include/linux/usb.h        |  18 +++++
 5 files changed, 166 insertions(+)
 create mode 100644 drivers/usb/core/offload.c

diff --git a/drivers/usb/core/Kconfig b/drivers/usb/core/Kconfig
index 58e3ca7e4793..d5d38657f929 100644
--- a/drivers/usb/core/Kconfig
+++ b/drivers/usb/core/Kconfig
@@ -143,3 +143,13 @@ config USB_DEFAULT_AUTHORIZATION_MODE
 	  ACPI selecting value 2 is analogous to selecting value 0.
 
 	  If unsure, keep the default value.
+
+config USB_OFFLOAD
+	bool "Enable USB offload feature"
+	depends on USB
+	depends on USB_XHCI_SIDEBAND_SUSPEND
+	help
+	  Offload denotes that there is another co-processor accessing the
+	  USB device via the same USB host controller, creating the
+	  "offloaded USB transfers". Say Y to allow offloaded USB
+	  transfers during system sleep (Suspend-to-RAM).
diff --git a/drivers/usb/core/Makefile b/drivers/usb/core/Makefile
index ac006abd13b3..df26c2885dd8 100644
--- a/drivers/usb/core/Makefile
+++ b/drivers/usb/core/Makefile
@@ -9,6 +9,7 @@ usbcore-y += devio.o notify.o generic.o quirks.o devices.o
 usbcore-y += phy.o port.o
 
 usbcore-$(CONFIG_OF)		+= of.o
+usbcore-$(CONFIG_USB_OFFLOAD)		+= offload.o
 usbcore-$(CONFIG_USB_PCI)		+= hcd-pci.o
 usbcore-$(CONFIG_ACPI)		+= usb-acpi.o
 
diff --git a/drivers/usb/core/offload.c b/drivers/usb/core/offload.c
new file mode 100644
index 000000000000..7c699f1b8d2b
--- /dev/null
+++ b/drivers/usb/core/offload.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * offload.c - USB offload related functions
+ *
+ * Copyright (c) 2025, Google LLC.
+ *
+ * Author: Guan-Yu Lin
+ */
+
+#include <linux/usb.h>
+
+#include "usb.h"
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
+ * Return: 0 on success. A negative error code otherwise.
+ */
+int usb_offload_get(struct usb_device *udev)
+{
+	int ret;
+
+	usb_lock_device(udev);
+	if (udev->state == USB_STATE_NOTATTACHED) {
+		usb_unlock_device(udev);
+		return -ENODEV;
+	}
+
+	if (udev->state == USB_STATE_SUSPENDED ||
+		   udev->offload_at_suspend) {
+		usb_unlock_device(udev);
+		return -EBUSY;
+	}
+
+	/*
+	 * offload_usage could only be modified when the device is active, since
+	 * it will alter the suspend flow of the device.
+	 */
+	ret = usb_autoresume_device(udev);
+	if (ret < 0) {
+		usb_unlock_device(udev);
+		return ret;
+	}
+
+	udev->offload_usage++;
+	usb_autosuspend_device(udev);
+	usb_unlock_device(udev);
+
+	return ret;
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
+ * Return: 0 on success. A negative error code otherwise.
+ */
+int usb_offload_put(struct usb_device *udev)
+{
+	int ret;
+
+	usb_lock_device(udev);
+	if (udev->state == USB_STATE_NOTATTACHED) {
+		usb_unlock_device(udev);
+		return -ENODEV;
+	}
+
+	if (udev->state == USB_STATE_SUSPENDED ||
+		   udev->offload_at_suspend) {
+		usb_unlock_device(udev);
+		return -EBUSY;
+	}
+
+	/*
+	 * offload_usage could only be modified when the device is active, since
+	 * it will alter the suspend flow of the device.
+	 */
+	ret = usb_autoresume_device(udev);
+	if (ret < 0) {
+		usb_unlock_device(udev);
+		return ret;
+	}
+
+	/* Drop the count when it wasn't 0, ignore the operation otherwise. */
+	if (udev->offload_usage)
+		udev->offload_usage--;
+	usb_autosuspend_device(udev);
+	usb_unlock_device(udev);
+
+	return ret;
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
+ * The caller must hold @udev's device lock. In addition, the caller should
+ * ensure downstream usb devices are all either suspended or marked as
+ * "offload_at_suspend" to ensure the correctness of the return value.
+ *
+ * Returns true on any offload activity, false otherwise.
+ */
+bool usb_offload_check(struct usb_device *udev) __must_hold(&udev->dev->mutex)
+{
+	struct usb_device *child;
+	bool active;
+	int port1;
+
+	usb_hub_for_each_child(udev, port1, child) {
+		usb_lock_device(child);
+		active = usb_offload_check(child);
+		usb_unlock_device(child);
+		if (active)
+			return true;
+	}
+
+	return !!udev->offload_usage;
+}
+EXPORT_SYMBOL_GPL(usb_offload_check);
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
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 1b2545b4363b..86922f1233ef 100644
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
@@ -723,6 +725,8 @@ struct usb_device {
 	unsigned do_remote_wakeup:1;
 	unsigned reset_resume:1;
 	unsigned port_is_suspended:1;
+	unsigned offload_at_suspend:1;
+	int offload_usage;
 	enum usb_link_tunnel_mode tunnel_mode;
 
 	int slot_id;
@@ -839,6 +843,20 @@ static inline void usb_mark_last_busy(struct usb_device *udev)
 { }
 #endif
 
+#if IS_ENABLED(CONFIG_USB_OFFLOAD)
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
2.49.0.1204.g71687c7c1d-goog

