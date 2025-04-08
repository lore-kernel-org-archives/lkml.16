Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC19B25F96C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 03:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744084754; cv=none; b=Va4oiRhewxiWvZ4qOYiKzWbuGMNOpPLFVvy/5E/e3q4CSg0XNXwOfUXAYvFrht+9MpjGdFO1wbGlVj/NGPecKfFebBIauDnX4zYTeZjQTreMCJZj4kM2yBXnTM2w52Qaohm82s/aVgC2FSj78W+arnUUKZ2JmFW4KK5BpuK8aL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744084754; c=relaxed/simple;
	bh=/wmwzEeZuyPe4wA2TVYRVkkTxWQx1D+8tMoAscunngA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pj4phv/QH7q671zMNx+6yvnH0kCFhhkUwxMs0Fy53VglAI3GLnPW8VpmQaa5bcITtU+hMVo0Js0j4y50cIKPlfJxuV07csmJZn6a76AbZzkxny0gbgkWmq6+ZNLgbWd9VAfh7RfSMdPAwnhO8Q67wYX//XvzvsxPIvR5MAKXmPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aVpXUwiQ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aVpXUwiQ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2240a96112fso77164545ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 20:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744084752; x=1744689552; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0tVzRCkzl6BKtBB0KhFs5d331UTfXX8A8KLdCOv4By0=;
        b=aVpXUwiQ792ThSF9NKIHXs95d1vJpdzdE3uQuiIFpN+RHGZQqNDG839ClV5kRwSyw5
         zWhBgNY0EDavd4/dbDTyN6bkWbTecQ/leJQxultyDyjajJUnh5dPZAC/hCwUQw0yIHOP
         ak+5vVwNfJ7oGfwCk4Uai5InULffUsHsXn8HyGErK9cA8gIm7S7jqwqQJSK3GAe3b2zA
         1FkaGhEQdNeV3bpltBN8/MtuM8wOlnengaNVKUBXXKUYXsXsQ6XZNFZ0PBx0wrQ5REzM
         J+Dudq9XhgKde/0cEBwmovVjOIFqiLwG+NxV9cg/cQrgZSwuYbTAO8t6rANhiWoqu97i
         DQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744084752; x=1744689552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0tVzRCkzl6BKtBB0KhFs5d331UTfXX8A8KLdCOv4By0=;
        b=icZXB8UqxWiL+Jj//YTZ6Nk3JlUHgt1d5q17qqZn8pa9yZyFNiKuwoPhO2DDOUj5zO
         kWMa9vqvKFR6VMXBJZWkuUiGFMu2IPnO+eToO7tyCsAd7wMUk1zxoSoHLc8NXJSb+y0d
         Zybcc+vCh4rXM0wOkgmtwqHSTOhJ3MpD1V+S3mouxeUJ3y5vHLUOTrpn1gtaGyotHiwj
         YORrut8w0jmW0ooCROxGx7AvFgaSyFKKZrrlz8ID3uJmy6I2XmdSrH9BE3kFTqJ2rnX5
         1JqAeBqmbqxyzItxxWa/VeO/BN43FGU+vfVas2SzVSrCcdx1YkG0MCu/n/zoEc7aWQ9J
         CWhg==
X-Forwarded-Encrypted: i=1; AJvYcCW4x6IHzvv1EPuWHpDg7k7UMc74BIXSaLucyB/j4TMb/OpZmAnCeeEOoW0jXIvPY3geZkITq5zjAY9oQPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpzpsmUosTEGDZyJszjLh5vWjBMhxInQjb46NLyJkDdpREeg01
	HVagdEirjiPYbVsVqyVA5Qyqx4fo0cewUSAqaX5qPY7rXFdo563N559KhRGvl7tQ8VrR2mxD1xT
	/D9sn4phGfCXx/w==
X-Google-Smtp-Source: AGHT+IH1fBzgv/Nf+REbL9Jf7WRAwyoUupvMjS7dwTTYCPMY9IV2BeRaIZrKEOX8zQS0505iQZfF+B5H7ASuAPg=
X-Received: from plpj21.prod.google.com ([2002:a17:903:3d95:b0:226:342c:5750])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d4c2:b0:21f:74ec:1ff0 with SMTP id d9443c01a7336-22a8a0a3892mr158530955ad.32.1744084751912;
 Mon, 07 Apr 2025 20:59:11 -0700 (PDT)
Date: Tue,  8 Apr 2025 03:57:23 +0000
In-Reply-To: <20250408035833.844821-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408035833.844821-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408035833.844821-4-guanyulin@google.com>
Subject: [PATCH v11 3/4] xhci: sideband: add api to trace sideband usage
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, gargaditya08@live.com, kekrby@gmail.com, 
	jeff.johnson@oss.qualcomm.com, elder@kernel.org, quic_zijuhu@quicinc.com, 
	ben@decadent.org.uk
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
 drivers/usb/host/xhci-sideband.c  | 43 +++++++++++++++++++++++++++++++
 include/linux/usb/xhci-sideband.h |  9 +++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index d49f9886dd84..67f31b0ec726 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -266,6 +266,31 @@ xhci_sideband_get_event_buffer(struct xhci_sideband *sb)
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
 
+#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
+/**
+ * xhci_sideband_check - check the existence of active sidebands
+ * @hcd: the host controller driver associated with the target host controller
+ *
+ * Allow other drivers, such as usb controller driver, to check if there are
+ * any sideband activity on the host controller. This information could be used
+ * for power management or other forms of resource management.
+ *
+ * Returns true on any active sideband existence, false otherwise.
+ */
+bool xhci_sideband_check(struct usb_hcd *hcd)
+{
+	struct usb_device *udev = hcd->self.root_hub;
+	bool active;
+
+	device_lock(&udev->dev);
+	active = usb_offload_check(udev);
+	device_unlock(&udev->dev);
+
+	return active;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_check);
+#endif /* IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND) */
+
 /**
  * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
  * @sb: sideband instance for this usb device
@@ -286,6 +311,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 				 bool ip_autoclear, u32 imod_interval, int intr_num)
 {
 	int ret = 0;
+	struct usb_device *udev;
 
 	if (!sb || !sb->xhci)
 		return -ENODEV;
@@ -304,6 +330,11 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 		goto out;
 	}
 
+	udev = sb->vdev->udev;
+	device_lock(&udev->dev);
+	ret = usb_offload_get(udev);
+	device_unlock(&udev->dev);
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
 
@@ -330,6 +363,16 @@ xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
 	xhci_remove_secondary_interrupter(xhci_to_hcd(sb->xhci), sb->ir);
 
 	sb->ir = NULL;
+	udev = sb->vdev->udev;
+
+	if (udev->state == USB_STATE_NOTATTACHED) {
+		usb_offload_put(udev);
+	} else {
+		device_lock(&udev->dev);
+		usb_offload_put(udev);
+		device_unlock(&udev->dev);
+	}
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
2.49.0.504.g3bcea36a83-goog

