Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35DC1FCFF8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814998; cv=none; b=l2aKFFSvHJKDXtOalIJPnkX6Gt2WgBPCqDDc0+P17k33sj7D4YrKmGJaRl3mYE5gfASADl299gmEhDtZ2gl8GfFNpSKO72nPEuGgXEWmmjzmpmrEs/wGjw0kNN1sq5ZIFOL6XMbUiV1gEpa4xueaFhiSXPYcoghGqZpLmK1MT+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814998; c=relaxed/simple;
	bh=T2vPsaEuwx8PfRvxsYfCewBk5NKPJPyBtTxI/ez7vEw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=InGnW5nUr4U0qmr15DXy+0uU6pGemEBWHVlgQ0Mbv8WS3xBXjnRlKaBg8SkauT1P4Z5VUTIzaBOU2eXK4f/l2B8bvwkzKy8928B92IxXgQXyxIzxH6bboyenspK5j1E4+XsjJvRBeUwpYKu1M9d3ZVbNCoVXPhvDljFR99FsKVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BzLzS4At; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BzLzS4At"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff798e8c3bso6432511a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744814995; x=1745419795; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=65zsaMyb5cxxAQpoirenuK9YWVfgo8pyw/N+IrnZdgQ=;
        b=BzLzS4AtaGPLDByfbKeP/tKel1qZXM1Vyl9xFzwEqe46ihj7P7hV+Y+x0iIYy0LyXX
         poadQvvKg/FUFLQNMsj8C9jx09jn0atgDHUmklFKrWqxNmxDlVjlQeGzPUgwdCnT9Xg1
         GAowvtUhazqB7/rEGmTtXtaO9tfXZ5KNV8SnRvmKgGQlQOrNPBAZ9USqwAshOZyV8lym
         YU+kTOgXJGIBve88rhPblitTWDdV6TEtr312eXIs/PUEYeAOelaoFJO+Acjr7wCle9xZ
         6cNA4XNORyzCshgLoQXzpOuGzZMFYUrOIeAyxXvJaCbpBLL6EYaqFz5HBjMlVps48d4w
         AM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744814995; x=1745419795;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65zsaMyb5cxxAQpoirenuK9YWVfgo8pyw/N+IrnZdgQ=;
        b=vk1RXrZXxf5UOA01ur5UFjy6RknQ9TAYNup/O9HuEKOzTGtr+V6bHztR2teejOVuk8
         Zxav14S23pZF4vvJjZQChw0v3+FADot4Ff8glN3e4nXEII0daVbBYygCWf5dd0S7a6yJ
         0h3JYNIkjSkE8g7nLP7uatG4Z9pAMVjZ22Q79OoPKrxOlOe9zRHM6nuu7bWJDnEaiK49
         dQWXuQfsr9g5RRsdTEkJh6nvIfjFXz3j/nCEcr8PgQfIhqIWiH2Pwpuqhja1cqT/l5kQ
         2hx40TwI/YUo06LSWsnDuZGCx8L+LcF9DBNgG7GLBWBpbR5tbaEiuNb2KGnHSjXwEpz0
         Y/ew==
X-Forwarded-Encrypted: i=1; AJvYcCWCnjehflBFf0ckVUlXoG+auDXv+3w5bJoOG9fQMN9iRDTBKU/RsA4hKg4Ga1kHxgRsXOQU4qFxDDgl27Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Z5CBbKMUFar9RNVn++DfZdMPvDAMLAhXexU8+fks0JwCJGTG
	AbXFsMBsd8n9Nz1iNpA/+7VjQ1OvzB2MOllKWmjpXJcZrow/idHcGNxq24nG/9J0DSTP+AhYgb/
	nPDW/JOpoAFN4uA==
X-Google-Smtp-Source: AGHT+IFkW15HV2K1v8lyXTXQkds0p5oOqdfhXN2k3Gs1ekSwRfK5md5o0PcHVRQg9zRBPcSgZDyaajTrWZEtTu8=
X-Received: from pjbqc16.prod.google.com ([2002:a17:90b:2890:b0:2ff:8471:8e53])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:570f:b0:2ea:3f34:f18f with SMTP id 98e67ed59e1d1-30863f2fb9dmr3051598a91.19.1744814994992;
 Wed, 16 Apr 2025 07:49:54 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:43:03 +0000
In-Reply-To: <20250416144917.16822-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416144917.16822-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416144917.16822-4-guanyulin@google.com>
Subject: [PATCH v12 3/4] xhci: sideband: add api to trace sideband usage
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, sumit.garg@kernel.org, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com
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
2.49.0.604.gff1f9ca942-goog

