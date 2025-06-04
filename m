Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A758428C2AC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025530; cv=none; b=RmtQcuFuo7bfRWVXdl3bcZa6w+ACoQztWdYiKEgPb9sPh2X8hVh7HJLk7BqrO6pfA13S+L2aVa8OC8eS5Z5txo4si4z9ENcGiO2VR49ONmgEgGN8fyF//H5XglseLjNMqYIh5BhW7LlOVkZQcdzNPzS4cwiv4+6m6gmXyMGiin8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025530; c=relaxed/simple;
	bh=LqCjgT0o86qpz1bAfVx/xUUv0oZr65BY+HYAir72dNQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qbEAV/CND/UQ0laMJMBItgH5rWiYf14FFrI0lOBYz8g9kqWLMUNwCZ+HJKqPs0RbR423sNxq3q6e6f0EMB78fPiPALhSYsLYr9dlPNIcWQdJ4Fxp9Ph5jsAK2ukV1EcEIOPgxiYCwOASOeaAh75W+KmpSciVk6H44Njt+EV9UQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ptZIDVdf; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ptZIDVdf"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30ea0e890ccso6367088a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749025528; x=1749630328; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vr9BR5zFeEkJuH9gfqHRpAFxp+Is7OurxJ3CD5N0N2g=;
        b=ptZIDVdfRgsgGARt90NEW8rAx5bbNt61BFn9UkZ4vrJlOGUIJShQVUNUirT8BpKGiL
         budvSdC80P3MsApNJykRQUO+RkO08r8yXLCZ1kxs9uXfNMheTSjHsWhHKgwq3woHfmMv
         2q5Hrw/5w7ah964zMj5R5pN82m23pOBh2sPuHivn5rU8w/CbJYq8eu6lysGxrMOSeusd
         yYJjSHPR0uw+5DgPoJCQY94HFCl3HqBryt9dOH6eePPCwoqHb98PlQf/T1Inlklj954p
         WbSsr01QOmqABUnI+Y1iie4YfLMO0mPJgZMI5xMeYIJ5sZiKi6CXTTle0hE8EPf/lD4k
         ytSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025528; x=1749630328;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vr9BR5zFeEkJuH9gfqHRpAFxp+Is7OurxJ3CD5N0N2g=;
        b=gfe6/7MkspuijePFInzWhkOgnmGHK+3a4tnKV+zSfj4Bm77Q/9QuVGwtaaZg2WAArH
         v8jcm0zCixHjO59WyoQi0uL6lh3xOrV31ESsF6KvEwcSyuynEuOBGK0wpBAlbE4/cX7/
         ZgJ0XmPbs80M+Q28oEZchHcG1+VNja8AVRalss9LzG21Ho67ugzdg85mIzu32+11c4oj
         MlJ76NERSRuot4+IwHVMy/6ffTiFLfZqP6Am7fgqowEE7NHK5FAWLOCfyqYcmO0hx8s3
         TwmFQPj0a1QDtBJhTOT8E6cXALYQU6D3dden7Q51X8x2V0WYlWwMxG6a7wYZ8H7l20b5
         iIYg==
X-Forwarded-Encrypted: i=1; AJvYcCXLRCxfHnsA/o8228hiKHC3IdQlvu2KItB/AvZHTxnORFjvk04p+vFXKyZg0aInh6LLZULELM6U6N43M9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNsBUpAgWGpVLzhAXAWwpM9Hm0DUPV1Oc2UwMjaG+Ow3H0FmgO
	FVzp+rtaKLx+VE7kroApidtwZUBbp03ehihCCZTNTdvachFIod4hZMX53XEv8xuIl79N8iJPB1l
	1gZ4eWdp6/aOzvp0D6w==
X-Google-Smtp-Source: AGHT+IHvWo1hnryqNLx7asfo8xGvTcYhV1b2+9enCYyP41vg0S5xWofxTjdyel4IF4lGoSrUsedQdrBouszQOsA=
X-Received: from pjbnb5.prod.google.com ([2002:a17:90b:35c5:b0:312:1900:72e2])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:278f:b0:311:b0ec:1360 with SMTP id 98e67ed59e1d1-3130cd680a6mr3008711a91.29.1749025528036;
 Wed, 04 Jun 2025 01:25:28 -0700 (PDT)
Date: Wed,  4 Jun 2025 08:23:09 +0000
In-Reply-To: <20250604082449.2029156-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604082449.2029156-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250604082449.2029156-4-guanyulin@google.com>
Subject: [PATCH v14 3/4] xhci: sideband: add api to trace sideband usage
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	sumit.garg@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

The existing sideband driver only registers sidebands without tracking
their active usage. To address this, sideband will now record its active
usage when it creates/removes interrupters. In addition, a new api is
introduced to provide a means for other dirvers to fetch sideband
activity information on a USB host controller.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/host/Kconfig          | 11 +++++++++
 drivers/usb/host/xhci-sideband.c  | 38 +++++++++++++++++++++++++++++++
 include/linux/usb/xhci-sideband.h |  9 ++++++++
 3 files changed, 58 insertions(+)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 109100cc77a3..49b9cdc11298 100644
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
diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index d49f9886dd84..15d72c23c0e0 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -266,6 +266,33 @@ xhci_sideband_get_event_buffer(struct xhci_sideband *sb)
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
 
+#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
+/**
+ * xhci_sideband_check - check the existence of active sidebands
+ * @hcd: the host controller driver associated with the target host controller
+ *
+ * Allow other drivers, such as usb controller driver, to check if there are
+ * any sideband activity on the host controller. This information could be used
+ * for power management or other forms of resource management. The caller should
+ * ensure downstream usb devices are all either suspended or marked as
+ * "offload_at_suspend" to ensure the correctness of the return value.
+ *
+ * Returns true on any active sideband existence, false otherwise.
+ */
+bool xhci_sideband_check(struct usb_hcd *hcd)
+{
+	struct usb_device *udev = hcd->self.root_hub;
+	bool active;
+
+	usb_lock_device(udev);
+	active = usb_offload_check(udev);
+	usb_unlock_device(udev);
+
+	return active;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_check);
+#endif /* IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND) */
+
 /**
  * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
  * @sb: sideband instance for this usb device
@@ -286,6 +313,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 				 bool ip_autoclear, u32 imod_interval, int intr_num)
 {
 	int ret = 0;
+	struct usb_device *udev;
 
 	if (!sb || !sb->xhci)
 		return -ENODEV;
@@ -304,6 +332,9 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 		goto out;
 	}
 
+	udev = sb->vdev->udev;
+	ret = usb_offload_get(udev);
+
 	sb->ir->ip_autoclear = ip_autoclear;
 
 out:
@@ -323,6 +354,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
 void
 xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
 {
+	struct usb_device *udev;
+
 	if (!sb || !sb->ir)
 		return;
 
@@ -330,6 +363,11 @@ xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
 	xhci_remove_secondary_interrupter(xhci_to_hcd(sb->xhci), sb->ir);
 
 	sb->ir = NULL;
+	udev = sb->vdev->udev;
+
+	if (udev->state != USB_STATE_NOTATTACHED)
+		usb_offload_put(udev);
+
 	mutex_unlock(&sb->mutex);
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_remove_interrupter);
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 45288c392f6e..5174cc5afc98 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -11,6 +11,7 @@
 
 #include <linux/scatterlist.h>
 #include <linux/usb.h>
+#include <linux/usb/hcd.h>
 
 #define	EP_CTX_PER_DEV		31	/* FIXME defined twice, from xhci.h */
 
@@ -83,6 +84,14 @@ xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
 				  struct usb_host_endpoint *host_ep);
 struct sg_table *
 xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
+
+#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
+bool xhci_sideband_check(struct usb_hcd *hcd);
+#else
+static inline bool xhci_sideband_check(struct usb_hcd *hcd)
+{ return false; }
+#endif /* IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND) */
+
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 				 bool ip_autoclear, u32 imod_interval, int intr_num);
-- 
2.49.0.1204.g71687c7c1d-goog

