Received: from mail-lj1-f201.google.com (mail-lj1-f201.google.com [209.85.208.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4842628D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743082363; cv=none; b=aBeWvTO7BlAO6zh4INl5YQ4bKHduhiHEfj5GHvkyMdiyPyBC1Io18lEKMo8FQR0fbnQ1wawRlgAJgaF1HquyARf5bHsFMu/h1qM7fsCDW+xHRJ9AR+OmkJ0iQj0ALoyS5qz1GPmGuupLeO87Wa1om5AxfMkFHUmBnv+X58nzETM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743082363; c=relaxed/simple;
	bh=7q1uNEuHmGla+JuXXowEZSgbCDACVTPaRgrYod3ebQs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=e3N3nSgYFTtcfrEa3SqLaEtvxvYlPHQw+czxjseGOnGTFQ1htaY70GdtEjd1UM2BysrUneZgIAzgpLwlNKAtiKyIU7DZVd+EY9b11M+O6fw1y2i1wAJ8ONANjuPyZnN7eqaIatXDI7TCo1cN1W6Eg/BdTx9oU8th3aRZ1YNCjmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rvp3bB+6; arc=none smtp.client-ip=209.85.208.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rvp3bB+6"
Received: by mail-lj1-f201.google.com with SMTP id 38308e7fff4ca-30bfd1faeeaso5008181fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743082359; x=1743687159; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rvLl2g0pnUQZ5mu1E/NbAEL3ldOZpuU0L7idYoO3luM=;
        b=rvp3bB+6hiCwWHeSIY/c8wlcNQyKt9+w2o4GYHbqSC31a+Efor7LKKl0VeeZCkQChb
         cG0PO3s4Wc1Be/ZvVQPw7RSVTDjDnF4GRoooRL+Sw2kNoHII+uB038Aib7D0HKDy77lI
         kYeIpqS7g7l1836kAl26fSybVmwCDyjuaZh9eNdfTe8QoauC6DSizqcX/Y5C8VLTVXVw
         /VplaJmgA9yySu9PFzXCJWotV725ehYt/hf7nBTvk2EdzWDW5xODMgEDl5qrQ0/b/InP
         cc1XbgZa4+iNnMGSf+/rfA3Ox0psc4696P3q8Wj2/u513S7zSXWypx19fVUb8D25/5Ya
         i1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743082359; x=1743687159;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvLl2g0pnUQZ5mu1E/NbAEL3ldOZpuU0L7idYoO3luM=;
        b=P1CeRQAGRXcNjEy/BvDgjq3qqNDL3A8T4axDPMlbwNoSYfHXTxXBuaVeM+FBVBg2RU
         VXFamNVg1YN8S9SpPqnzSWMf4PG9KTdOUDThtihMXF0dlpOKFNw9CgfVmpG+gc7Ej37T
         +12q3NuPbXR550chXjKl11bzFgZ7k2uN4fd5IMeffPKSJ8sRN7mKLmrfUQkdt+xplQCJ
         V4oZdMzTkllsVEtH2fZr8LoQkMMTtV9uJSc+Sigohq9nUJCa+QnxwDc1IWqXHtfLQE/O
         Mwa1BNBpUl1PekoJvubuuETttrUIxoN1VRbv4eiDPftlWVK6gov7T3hmYo7OoBmgqQn9
         hdWw==
X-Forwarded-Encrypted: i=1; AJvYcCXyK+Gw3d/bQ3iRpvdfje68Eg9LuhcwdY+LzQqQV4BerYG19Et4sTRiW2xaGXq2E2MUMXuKOOkSD6aqSYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+AkPMBp3WkmkBcaCu8XDRw5bdK/+JIctm1908osATutTSKXGA
	OATcXExDAM9P8Fb+B3cfZdsxQq7PzuNquK8rpf5ei27dXRk75/MGG3sw5/nfQf20DJa/IzsfrTW
	18g==
X-Google-Smtp-Source: AGHT+IFXYSDIEk3Zsgjrs9FwwLIjl1mfB6QZ/QmjE9jGOtRqznw9rbjqy8/6pPUL/MehEfDA3PcxvIpF8jc=
X-Received: from ljql15.prod.google.com ([2002:a2e:a80f:0:b0:302:40ef:439c])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:19a4:b0:30b:c9cb:47e5
 with SMTP id 38308e7fff4ca-30dc5decb94mr14870791fa.8.1743082359318; Thu, 27
 Mar 2025 06:32:39 -0700 (PDT)
Date: Thu, 27 Mar 2025 21:32:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250327133233.2566528-1-khtsai@google.com>
Subject: [PATCH v3] usb: dwc3: Abort suspend on soft disconnect failure
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
index 66a08b527165..1cf1996ae1fb 100644
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
+			return ret
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
index 89a4dc8ebf94..316c1589618e 100644
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
+		return ret;
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
2.49.0.472.ge94155a9ec-goog

