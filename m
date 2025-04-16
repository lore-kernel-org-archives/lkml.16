Received: from mail-lf1-f73.google.com (mail-lf1-f73.google.com [209.85.167.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4E9221567
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797926; cv=none; b=hmOuNHL2MzasvR/v7PIc7peu8Xa0ZiYYdxHcghtvRwsoi7HRfVDSHtbv2FMI/kRxWgf/UeF6pLciHCX5YmVjAusIa/ZXJMIcfkCgmRYozuUHXnX3bUrkSHXsMkNdbuzh2TCIz20dsjMp04VcHBz/2XzWLG/VGhDVtbsy7l7GF+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797926; c=relaxed/simple;
	bh=ekrhzQaSw2MdohNpnsoV/92s5r4SyiWALxJ6dOI0hMk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eLq/rDAdgodrYE8i6Pn3TUkzfrtE5J46k1aWEK8QIXNjoWWCwTQgqSYnVxu9zuZwB5tLDtdZrWScRHYS3uvRlki2WRRD6whbZ9RhKF3hRH+i6XnePIY+VVBuvY5qNB3ZM6Qx2JHcAHDaquiCVb7u/cV/DjLrB759Eeyju0+oZ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1FOGb9ZW; arc=none smtp.client-ip=209.85.167.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1FOGb9ZW"
Received: by mail-lf1-f73.google.com with SMTP id 2adb3069b0e04-549b3bf4664so3020922e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 03:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744797922; x=1745402722; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b6XUAiTBKyTClUnsPpBxFxcE1W6gZkKjCwkz0Nr+Oww=;
        b=1FOGb9ZWNJKeG1tCg9s4b0fDUkd5GPDj/qQJow8hchcmm/qx9oag1L4SQYzHMyuaVw
         qpw67dZylFelW4k3CaT+X98traLfhcWLiSVmZOl1c0FoEJ+ZT5wqMdUUWv43J0WOpqrc
         Le/NPWdlEHDkCPbttyrPJHtu9EMdRq/fzIjqS73AWSklyPznS+3t4c2t8tBvRoKT0HGV
         pShGNrnrIoxqN8Rl5YNyB6lIcKVEnep13Yeii3yBfTMBva+Yf2AIvDnidNr4tpxBChJf
         28QT7qZ+F6RLhD5pNZ3/n/ug6iDSyn2YIcZmPMmfZhS/AvUHE5JJE68UvaU1NSyDBruZ
         iC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744797922; x=1745402722;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b6XUAiTBKyTClUnsPpBxFxcE1W6gZkKjCwkz0Nr+Oww=;
        b=jevrPlkir5ugwa7I27eMR57O8lishtg7EpkWWkPubC9RnRttcv1XBR7FgT99PatXhy
         vBszVhsXNw1VaP0h5qvg4IdoSpw8JEV59tad9otHgXe5no9zF5wXfHAMdA83F10mZmR2
         byHlkvtVETenZra6Y/cv360JEiOprTWnb11hyAdWZWc32Wr1W1AdlHyChILLWfKmYa07
         uCbniayyGBZXRzvNTV2jX81EcmjfgqV1JQdifSBBUFxmJlbYT3XDYQ+n8qSggJzy+AYt
         bu7W1XifbJFLm5U5GB/lqPL5l2v/9wWPjKX4CXMwH2UQbZlCXfkT1gLhtBLjbmczWARF
         xW6g==
X-Forwarded-Encrypted: i=1; AJvYcCX5mNaLHD2sa3ZiHfR13d6hfzipYThk5Hhlt686Geo/8UH2ol2u7X7bf6YlQA0xPUxm7heoDfjDLnFcGW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YytTEw/zlJ11HEfXD/LYoZiIzzeiZQU1k6YYsnc4GWPkz7YyItx
	hlN4kBJQeIZ6/LRk/DvBdOSboV2q+eSFUMs1Qm2ALy5Oir00HY/OOOSxHq7iga2SXQcGjWYoZXT
	WgA==
X-Google-Smtp-Source: AGHT+IGRljwotQdVRaKKCETZgGbDJXMaM7jHiVXaeRigV9PLjGdO8DYST6DDfxjAYmdpf16UqNIiKulduZA=
X-Received: from lfbfj5.prod.google.com ([2002:a05:6512:2585:b0:54d:63e1:a4d5])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:3f28:b0:549:8db6:b2dd
 with SMTP id 2adb3069b0e04-54d64aa9d6emr368670e87.31.1744797922481; Wed, 16
 Apr 2025 03:05:22 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:05:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416100515.2131853-1-khtsai@google.com>
Subject: [PATCH v4] usb: dwc3: Abort suspend on soft disconnect failure
From: Kuen-Han Tsai <khtsai@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When dwc3_gadget_soft_disconnect() fails, dwc3_suspend_common() keeps
going with the suspend, resulting in a period where the power domain is
off, but the gadget driver remains connected.  Within this time frame,
invoking vbus_event_work() will cause an error as it attempts to access
DWC3 registers for endpoint disabling after the power domain has been
completely shut down.

Abort the suspend sequence when dwc3_gadget_suspend() cannot halt the
controller and proceeds with a soft connect.

Fixes: 9f8a67b65a49 ("usb: dwc3: gadget: fix gadget suspend/resume")
CC: stable@vger.kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---

Kernel panic - not syncing: Asynchronous SError Interrupt
Workqueue: events vbus_event_work
Call trace:
 dump_backtrace+0xf4/0x118
 show_stack+0x18/0x24
 dump_stack_lvl+0x60/0x7c
 dump_stack+0x18/0x3c
 panic+0x16c/0x390
 nmi_panic+0xa4/0xa8
 arm64_serror_panic+0x6c/0x94
 do_serror+0xc4/0xd0
 el1h_64_error_handler+0x34/0x48
 el1h_64_error+0x68/0x6c
 readl+0x4c/0x8c
 __dwc3_gadget_ep_disable+0x48/0x230
 dwc3_gadget_ep_disable+0x50/0xc0
 usb_ep_disable+0x44/0xe4
 ffs_func_eps_disable+0x64/0xc8
 ffs_func_set_alt+0x74/0x368
 ffs_func_disable+0x18/0x28
 composite_disconnect+0x90/0xec
 configfs_composite_disconnect+0x64/0x88
 usb_gadget_disconnect_locked+0xc0/0x168
 vbus_event_work+0x3c/0x58
 process_one_work+0x1e4/0x43c
 worker_thread+0x25c/0x430
 kthread+0x104/0x1d4
 ret_from_fork+0x10/0x20

---
Changelog:

v4:
- correct the mistake where semicolon was forgotten
- return -EAGAIN upon dwc3_gadget_suspend() failure

v3:
- change the Fixes tag

v2:
- move declarations in separate lines
- add the Fixes tag

---
 drivers/usb/dwc3/core.c   |  9 +++++++--
 drivers/usb/dwc3/gadget.c | 22 +++++++++-------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 66a08b527165..f36bc933c55b 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2388,6 +2388,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 {
 	u32 reg;
 	int i;
+	int ret;

 	if (!pm_runtime_suspended(dwc->dev) && !PMSG_IS_AUTO(msg)) {
 		dwc->susphy_state = (dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0)) &
@@ -2406,7 +2407,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 	case DWC3_GCTL_PRTCAP_DEVICE:
 		if (pm_runtime_suspended(dwc->dev))
 			break;
-		dwc3_gadget_suspend(dwc);
+		ret = dwc3_gadget_suspend(dwc);
+		if (ret)
+			return ret;
 		synchronize_irq(dwc->irq_gadget);
 		dwc3_core_exit(dwc);
 		break;
@@ -2441,7 +2444,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 			break;

 		if (dwc->current_otg_role == DWC3_OTG_ROLE_DEVICE) {
-			dwc3_gadget_suspend(dwc);
+			ret = dwc3_gadget_suspend(dwc);
+			if (ret)
+				return ret;
 			synchronize_irq(dwc->irq_gadget);
 		}

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 89a4dc8ebf94..630fd5f0ce97 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4776,26 +4776,22 @@ int dwc3_gadget_suspend(struct dwc3 *dwc)
 	int ret;

 	ret = dwc3_gadget_soft_disconnect(dwc);
-	if (ret)
-		goto err;
-
-	spin_lock_irqsave(&dwc->lock, flags);
-	if (dwc->gadget_driver)
-		dwc3_disconnect_gadget(dwc);
-	spin_unlock_irqrestore(&dwc->lock, flags);
-
-	return 0;
-
-err:
 	/*
 	 * Attempt to reset the controller's state. Likely no
 	 * communication can be established until the host
 	 * performs a port reset.
 	 */
-	if (dwc->softconnect)
+	if (ret && dwc->softconnect) {
 		dwc3_gadget_soft_connect(dwc);
+		return -EAGAIN;
+	}

-	return ret;
+	spin_lock_irqsave(&dwc->lock, flags);
+	if (dwc->gadget_driver)
+		dwc3_disconnect_gadget(dwc);
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	return 0;
 }

 int dwc3_gadget_resume(struct dwc3 *dwc)
--
2.49.0.604.gff1f9ca942-goog

