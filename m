Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9C21A9B5D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 03:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744084737; cv=none; b=Vd0MzIofHueQDzjhDpTVqJqtQoQF4mlKxY7ommIILXy1JlpHb0AZ3piu81xuIpatxjELfk6zlqcs9Zf/YDgFedu/51i3HgRpYIvBFvNGwWKW6UgBGfJREF2WD0nFx0z+zG25p8Yxy9wEkhxFZAcRtEzBV/kxq337U0p3goWuTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744084737; c=relaxed/simple;
	bh=bc9X/p13qI/cu7A28+rZtnN5F0QHAdqaRJS2ANaTxSo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qhi/FvELJc0JjFoTu8qPkOAfxBO56ynf1ZYNgstGf+lfMVGvPvohXS/EUP7PL7s0XhhlzDubty1FYXlBRXbY6AAs8ODyNR0gJ16dp2foRflVKTVTA4CGgiyXcoOdgUdI7dG/OQLCzOGRFcCK/6arCIYQk3NZY++WmY8vFILwqZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q6Lik4L8; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q6Lik4L8"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7377139d8b1so3692163b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 20:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744084735; x=1744689535; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wLvCKTSXk2lVXCQdG+iI6ItCMd6CTfWDVCsxzhUvfs0=;
        b=q6Lik4L8V0jZpkh6kQv/+qZ0HhPSDtcVXA6CWSSm7X5xix+sY4CSHVfqHkJoKFNfTp
         SIGU/XMRv45K/AgwjTPyzHKaeWc2VxM2ul+Udj/CE+UhQoPME5jFTATrGHkBllOBCiO2
         GY06Y6zdCxHUmTTv7jv2D5wj9HLSXJYj0MJiLeyqpGgtqpf5Gj4oTgB3qIiJxY/R8aPu
         gBtrj1JkCd7E2xxEjnr+qb9zdQYSY/StM7mWd77xInbkz/Wwz4jlhPAOTu0HU0tRZcgS
         ZxrGInxhuYVieJ76x//vOUTtCFnNCXnsgdapn2XxFJhGxDT4fcc8RrmJik5rn50lngVc
         Simg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744084735; x=1744689535;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLvCKTSXk2lVXCQdG+iI6ItCMd6CTfWDVCsxzhUvfs0=;
        b=IIIVzKETSM40pOsiL9KqWiy3T3aEzXSic7wGxYser0K12Voz5qqAz4e8FFzSgMlJuX
         XpJodrllQSPo4akQt8kQIxqx/TuDRl/9sycRWf7k3v3kMj1HNcQf9ncWrZBE8PjSEx1X
         pR1QosLFhaSIwe2XSbbAfF65VU1z4rNmtdQNBEMv6YH7A92Yl+07PV1prt/waU6Co69L
         1K7oVp9MCgaV4z7+60loqTmYTDPaK/7fnkmtr0XyskXuQyt4VJsoUSM3G6YraSQR1oDV
         Q2GbHfNNebbo9yHtDo+Jt3c23p3wFbi0Vf+ujbL2R8ifp2SJ5KLtabx7gwdDGThk5OPy
         MNSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTxC/B07EFUCjnycjNg8Z8ZNI8X7zVSsTnmjhigony2q724F69Wkg4DSsebpl4pazeZhFUS1NcWY7Hz6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJzSc89Ef2+S2mB1ti7Zoha61V+IwWvAhh9vl4BaHNkE6wwWCE
	LAAIUN5LIKty7hRZZiH5zBDmQ8R6DsK4duqQw0Afk0rfyuCDAOVJP6wXWoKPoavz4tftAFd0Njx
	gXFHQB/tmQmYd4w==
X-Google-Smtp-Source: AGHT+IHtjkaCNKIXog8qjPTh5DJlz+7q6dPhwrkdBsvaX6WQmzp25JZs3q6u6Lj7sZiM+2iVmIdtFNadooCrMJw=
X-Received: from pgaa38.prod.google.com ([2002:a63:1a26:0:b0:af2:3c1d:c04a])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c887:b0:1f5:57d0:7014 with SMTP id adf61e73a8af0-2010801c97fmr20370794637.25.1744084735440;
 Mon, 07 Apr 2025 20:58:55 -0700 (PDT)
Date: Tue,  8 Apr 2025 03:57:21 +0000
In-Reply-To: <20250408035833.844821-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408035833.844821-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408035833.844821-2-guanyulin@google.com>
Subject: [PATCH v11 1/4] usb: xhci-plat: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, gargaditya08@live.com, kekrby@gmail.com, 
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
2.49.0.504.g3bcea36a83-goog

