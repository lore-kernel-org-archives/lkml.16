Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAE51E5B88
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743489031; cv=none; b=Lo6grVvVRZlP1RID6lU2ONI3W5sK5boSN1QhMmXcCcikQSpUPfkI+OCIL+bd+q8955EcU375b1WqDH1l8JF8y+whssYAT4ABr3ZN94I58Dm1+1k6veRRJDq9YV16RhHY7r/LsG+Z0y3HSpcn5EgUb2Vx4h4rzqmDVGVxrGQltEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743489031; c=relaxed/simple;
	bh=F/qmGUFeMu9XvOZI7bo6qPejjKCgMa/4Q+1+JmF0sio=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UfzUIA2htvl6+S7QB2/E2am4Kh8v91hqJLci3FhsHdf8jcrILmWiVWB1sQF0HVOy+Q9ulTCbQ/fznlfZx9FE8QQDQ6IKpMGjHY6PPmVtTZkOpL9RaIhJvSALhW6Amqb6y0pgOWxzqOPNb42uEb6w98J4EBlq3d5S9LMfyDvXQSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PL61WlRr; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PL61WlRr"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2241ae15dcbso123747175ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743489029; x=1744093829; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e/hhe8fHtkZGRjGoinV849CiQfAtFCFjSq4JrlJQc5o=;
        b=PL61WlRrBZ83k5vthPHOnDy5CRxNcTHEc83Z+zb/sYjaLZDwaKC/JI0MQNNow2tyui
         uYcAL6q96NOM+8wvzxcxq8OoTcLP6S93Kd2XyHiTw4YNmTD6hL+nphYZGmL2zv5vX6tq
         IXYilGI0To2P1gAavP+Lb2PfbZtMx8IXgxVmbQxUFiiseQXHinThxFSfaO876aRXwoLA
         hrs0p3baHpWpmrIcWG1KDhvX4F2KVjqRHB+MDw2/CfMa/Od/lVa1wdOGXlNFG80JD0Wt
         Ondy9h6iK/qe3ajS0xnWcqHZqulzUmAC8GFETEdwKV8EQ4AGXHHDxS0H52XZrflnaJMO
         YESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743489029; x=1744093829;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/hhe8fHtkZGRjGoinV849CiQfAtFCFjSq4JrlJQc5o=;
        b=JfQ3RyjPrdjLEXK7wX30RGl3hU4T07FJT/FupsKoZak/marnvzin46NQF2g8SoGEb2
         ix3clo/JP05+0UcOTk7Fl/UW7cFhB7497UiZwSzRx2LjVJ9lY6LkALE6lilYiQsXU6mS
         1TWn0v8dkbr+tStrGUoWkwWYuV49FHSjPCoASTW7xeYx+pj4I9vzveNe12swSQtBV+w5
         al26PQ5MfOIfrjuC9c9DNMyoJcdPJQsy7JH55cJGKgx5vdYZ3fCoiXe+XMqFtds8Tp5R
         ejJGkXyP7xvmm9Mo1o1lqDTo+Y+hTcThvSadv1vac8aYpT/R5Z/XvwTqJrEiNFasFp/g
         tu4w==
X-Forwarded-Encrypted: i=1; AJvYcCXG69izqp8hZxchF0JOasDJ1ejVtvrWwJulitxe822jAh+xDxEzNyIxVaBg34lEc/tzY3DW7aiWs7yr4Ek=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaB0YOEzzHtOxi+tOWVUgyNsMs9PTIpJARuDlmc5jpxA9pY6gW
	0EweE3rXJQ2tluwRYa2W8LzSH1BnkaVuKOvFp5AKVxGAHyWcjiVy9zjjFMh1RQTW2KDyp4vVGnQ
	rLGG/rBK+od/Wxw==
X-Google-Smtp-Source: AGHT+IH3sCEbiKXIhGq2v8KwoCB9c5CbhGko+7CXLOcauVYSMPBKmJVj1my29zrE/bSpoaO8NACdEeVe5spWsCE=
X-Received: from plbjj22.prod.google.com ([2002:a17:903:496:b0:225:8a27:cd41])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1cb:b0:223:f928:4553 with SMTP id d9443c01a7336-2292f9f7646mr224444685ad.44.1743489029111;
 Mon, 31 Mar 2025 23:30:29 -0700 (PDT)
Date: Tue,  1 Apr 2025 06:22:41 +0000
In-Reply-To: <20250401062951.3180871-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401062951.3180871-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401062951.3180871-4-guanyulin@google.com>
Subject: [PATCH v10 3/4] xhci: sideband: add api to trace sideband usage
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, sumit.garg@kernel.org, kekrby@gmail.com, 
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
2.49.0.472.ge94155a9ec-goog

