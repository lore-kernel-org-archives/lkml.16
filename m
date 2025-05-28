Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E9327585D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423362; cv=none; b=XMxHs3ndE6XPnGUJPf63QCU3h8hKB0wF5vA/R26ALtUD4LSp5yDtctNUlMJkbuWj9Pc39ciMPsIk9QAAsuY2dpa/G2yC+Luw+yZnjHJRE/EYRocVW/WShTZX2I/MmdpMeefodDdH0zbolv0NnlzRPXTpJa+nuqfkP7YopUVEFaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423362; c=relaxed/simple;
	bh=hrgpN3OwJeQNAYG/6uuNH84rejxPQEHYyomN3p5Ed0o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jC7ZLJ5W/hu/FJpXEU8lAEMys8Uoar2Fs9JF06x60rM83e2nYUgrJ/6zFNN2by7ej+NhB/SAGwyKXofszL5MVrgGGj/bcsFVK2aZPn+HzR/9BH3+nFulUZ3xH7JYs4OK1mbRBj4YfAMvoqWnJSvfQrfa5j3M/qE3D1QiYkswys0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IoV0hxOj; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IoV0hxOj"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7370e73f690so5186461b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748423359; x=1749028159; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dsGGKROW/GfgKslG2eM9ME7ceuz0kmeKtOiEDD5cNB4=;
        b=IoV0hxOj0EfCBRp+I5YysGUdLXakuPeysacfEsj9yErV+8mUd3N6EOQMLppzaThAAL
         2zs2FqlYx8dmFLUnxDx+XxsrpwZPbBfS0nsgDKFmRh57ayuz7Y3pY9/PNlUO0bwADMPt
         VYA/x+U1uLAasXHpbR3qnrXlOlLpf7ZSUmViLFTmY8Jnj65OII5uidGrw4oWgJfL+3uM
         UvaoxHzmHMg3SsxQJReSA7oFlz9Cej1Nm1hIgA0gpZQsqlyH1EQ11F9acSi8YKlrJ1Ce
         WQG6KHV2H87EjnuAwO8xjLuFtcWx2Y+kT0qAZ6SSBS2oJu5aHD55zqh2/pWz6ESymANr
         THYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748423359; x=1749028159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dsGGKROW/GfgKslG2eM9ME7ceuz0kmeKtOiEDD5cNB4=;
        b=ptbYRQM/jpX4nfO2O1JhV7Z1cvWe6n8Bb8Bmj8kwJli0QfszVC5vvmOcNaQaVThwBA
         77qJybWIrnyyxh+PU+tJCIwSwQqg8bAbf7S0v3GlPrKn7irH0oIk8qQwSdbPqmeAW1CH
         /QP1xdReyNFChxBJCBUlE6lPX0/ub17BnJ0Qs7Xnyx2z1gULhhpv+lhrw505J3iqrjkf
         q/pHs8skN41j9MdVHz+ctKl/AAxsW1NQpLkqVYdbU7A0MJVh4obsKewm/2j+/SPzYJaa
         IQ8xvUzvgLzoyTSYHqGO1Bzn8QpQg66PxdhMqwYb1qmLdjt0+8z/0fTgJR2H2XNGQL1F
         nKrA==
X-Forwarded-Encrypted: i=1; AJvYcCXhY0AIjc6SdlQVHLdFhaPCkmTMD1lWEqzN9xQOmiyyZngeVNYQWzm/wKZmI4FTR3TspxqPt6DR0pFUQkc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6GylprkuL0HZAUpxBur/Jt9MzE10YUZts1I6g2MohmT0Gx04l
	v8cMZu2c7zy7uYyzsBBFC+0Y+ZYrzoH8JoozLAoan8KUmQC/LKc2gEyCH3K8KHRWx10e4a0HHI2
	D8Lf/QyzFrZcAsgR2kw==
X-Google-Smtp-Source: AGHT+IH0sOshcv2Eg/mtamrUvZLDqjNwkwxbBChcNpFlLYKw4WlgSYYlucjEvYWbAKYNpPLOtqR7MqHtvhlo92Y=
X-Received: from pgfe7.prod.google.com ([2002:a63:aa07:0:b0:b2c:3c0e:f01c])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:b85:b0:1f5:70d8:6a98 with SMTP id adf61e73a8af0-2188bf2ac76mr26106597637.0.1748423359626;
 Wed, 28 May 2025 02:09:19 -0700 (PDT)
Date: Wed, 28 May 2025 09:04:08 +0000
In-Reply-To: <20250528090849.2095085-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250528090849.2095085-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250528090849.2095085-4-guanyulin@google.com>
Subject: [PATCH v13 3/4] xhci: sideband: add api to trace sideband usage
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org
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
 drivers/usb/host/xhci-sideband.c  | 38 +++++++++++++++++++++++++++++++
 include/linux/usb/xhci-sideband.h |  9 ++++++++
 2 files changed, 47 insertions(+)

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
2.49.0.1164.gab81da1b16-goog

