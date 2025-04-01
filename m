Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9261D63F7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743489018; cv=none; b=fitb71EN9kI8iV7K0/w/eTsKnR2+HSB0rv5mt8GSEv9mbGknsTz7f1baYvp4M0VI/3aCBw3kQ+YiRt+YAdobY03TM7/BswsBqmk6VqtBzAoBkydgEpZ5a/hESC9X8BK5gbC2gnDau4s3XKeAvyNiU0qjvmQrcTBvDeU+WY+dSw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743489018; c=relaxed/simple;
	bh=GC8luflfFudrWld/AM+Ewt6IdxJJ4dn/4qVZvzzuEV4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ota3ENYtBz4rgirW/SR1FHKHqBYfj5l+65isi22JLcQ1wanl6SzvTNkxtQzioK61m3fpmzo/N4EM1/wcF9gbZLJMDfs5Q/VhZJxjMormjeIiX3OvwNvRH+mwZwxJIGl6zx1AXgDS4FzucV9Av7jPQDunMc4j/Jvq/isybVL0GHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GjjG+jin; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GjjG+jin"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-227ed471999so84130655ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743489015; x=1744093815; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G82tJsCWDISryXifn89lTAl+ld89TBbEQgTjv+aZOMU=;
        b=GjjG+jinxfMRctJUnlY1gN0XBeWH4LR2Cvvk6oBRE4CYO36dgXlbVrZqWXbwhrOXlX
         VeQSryjuIgLyFabAMKo6GVGfduXD1yOP338C4B2KMNPS4XEvp0cfzUdnFhxuv1fLfJcn
         Xflw1awjOUHzN4OQnLx9qo7yagta0KiFVAHoH0s5YDTYFYmlhTnVVDsSbU5OQkyuXi6S
         J5LxvhFiLDHHS0bdabyju8JgoFZ0W3eZMkUQ5is7RWTySTLBig8dqXc+byeoOe+YCM6H
         wQbSkEuRT5vDQt+SKlxGifVd9sZCtN1q+NzwHAND/q6kmQnz8PWlwv/UvuP9jD/OT//h
         70Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743489015; x=1744093815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G82tJsCWDISryXifn89lTAl+ld89TBbEQgTjv+aZOMU=;
        b=U2Ub8K5RZV7eOnWWOa9tL7r6xeOnTfed+246W3qAepUtt00+BgVIwTPbhua+6YcueN
         clBe2pDJRx5Z++58cSGnXoeyGVrDjoMEXjhqMfBZO7yW6BRbtKfYDk5a0+O24ThGiECI
         8arIwlBpi+oxMLqI4lMaHHn7Z253/0PydcpLSC8rwhO9M08uyBsLb+DrcrNDQMEA8R5/
         /uNafl6cvskuuJGyhoZGnIAkHzE4tYCOfPU5GQS27L83MKNO90OZZFcir+Di1C5Dt72X
         MUIuYNegvZ+DtE37J/l9/DijdW0hYA6fn4Dk1YkUzV9RwcN0fFoZNB2hqtEE0xHQKEij
         C+sg==
X-Forwarded-Encrypted: i=1; AJvYcCW3zMMDpZltBbwUwblswqkzr3apBm8MVemlDmk7oOp/FJLD9Us7HVdoa/rzELCcsSlZpZoo+Lu6Yl96ltI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhgBOEhRh5/V6CEPqbiF/RPQ9HlkAvSdvPquJTkfv6Gz5as5n6
	VvCmEQVAU02KCV8zRaH3MiaOeM3JCHAxizpXQ/7WxE3aeFfV7XEGKcvRhVHIuuNV+z3rz6JM9RJ
	AY0TMHDHQH62VaQ==
X-Google-Smtp-Source: AGHT+IGDn4p5Vlq4+h8UmJK0+M+KvQbP0/FDSg7s54pu1Ji+HBQ1kRiqrn+pptQTrbAOX27/AgCloGelERbtwkE=
X-Received: from plbm1.prod.google.com ([2002:a17:902:d181:b0:223:2747:3d22])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e892:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-2295be92d96mr24970385ad.23.1743489015611;
 Mon, 31 Mar 2025 23:30:15 -0700 (PDT)
Date: Tue,  1 Apr 2025 06:22:39 +0000
In-Reply-To: <20250401062951.3180871-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401062951.3180871-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401062951.3180871-2-guanyulin@google.com>
Subject: [PATCH v10 1/4] usb: xhci-plat: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, sumit.garg@kernel.org, kekrby@gmail.com, 
	jeff.johnson@oss.qualcomm.com, elder@kernel.org, quic_zijuhu@quicinc.com, 
	ben@decadent.org.uk
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Separate dev_pm_ops for different power events such as suspend, thaw,
and hibernation. This is crucial when xhci-plat driver needs to adapt
its behavior based on different power state changes.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/host/xhci-plat.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6dab142e7278..9843d3ad5cf4 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -453,7 +453,7 @@ void xhci_plat_remove(struct platform_device *dev)
 }
 EXPORT_SYMBOL_GPL(xhci_plat_remove);
 
-static int xhci_plat_suspend(struct device *dev)
+static int xhci_plat_suspend_common(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
@@ -481,6 +481,16 @@ static int xhci_plat_suspend(struct device *dev)
 	return 0;
 }
 
+static int xhci_plat_suspend(struct device *dev)
+{
+	return xhci_plat_suspend_common(dev);
+}
+
+static int xhci_plat_freeze(struct device *dev)
+{
+	return xhci_plat_suspend_common(dev);
+}
+
 static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
@@ -528,6 +538,11 @@ static int xhci_plat_resume(struct device *dev)
 	return xhci_plat_resume_common(dev, false);
 }
 
+static int xhci_plat_thaw(struct device *dev)
+{
+	return xhci_plat_resume_common(dev, false);
+}
+
 static int xhci_plat_restore(struct device *dev)
 {
 	return xhci_plat_resume_common(dev, true);
@@ -557,9 +572,9 @@ static int __maybe_unused xhci_plat_runtime_resume(struct device *dev)
 const struct dev_pm_ops xhci_plat_pm_ops = {
 	.suspend = pm_sleep_ptr(xhci_plat_suspend),
 	.resume = pm_sleep_ptr(xhci_plat_resume),
-	.freeze = pm_sleep_ptr(xhci_plat_suspend),
-	.thaw = pm_sleep_ptr(xhci_plat_resume),
-	.poweroff = pm_sleep_ptr(xhci_plat_suspend),
+	.freeze = pm_sleep_ptr(xhci_plat_freeze),
+	.thaw = pm_sleep_ptr(xhci_plat_thaw),
+	.poweroff = pm_sleep_ptr(xhci_plat_freeze),
 	.restore = pm_sleep_ptr(xhci_plat_restore),
 
 	SET_RUNTIME_PM_OPS(xhci_plat_runtime_suspend,
-- 
2.49.0.472.ge94155a9ec-goog

