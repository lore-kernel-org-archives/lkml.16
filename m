Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD282BD59E
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940966; cv=none; b=jgfKrN2nY9CO9gAa9q8veN/ftmQLDEv5ZF6BEhUFPUyIQNzq14oGUB6PTnfiGN5+9Q0MRb+eaa6x/yvT+yU3jamdaDgcdimqxiqqeCeZgopyUTX/02htnLFNGHAia+/MSAsu9MJU+Sl+6xpyUC4D1fHSMyVSe5AGXW9N2bGSH9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940966; c=relaxed/simple;
	bh=WO4yUAw+su70NbYhyuD4qnYOCPCFP3n4d0s5FXv6Zuw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B2nWYNlJWRCAkCBNy2G+jedrmJENH+Jfc7zFp6Tg01NlhngDz6Mc0xoA8KncJZXxYMtFbyHZh6xG9Nh7TtKVs3DaYrx0N2N0P6e31ExekA6USH/AVHJH2mCR1Nq2sJqeol+0woThQhgMH6hv3ICOTDZXYGJwU2jidgNcK8ubGzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s13bjxhY; arc=none smtp.client-ip=209.85.222.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s13bjxhY"
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-7c5b9333642so1021114385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747940963; x=1748545763; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Zf5c74izM5BGS8SL0XWGLm8rGTcUQnZ8yCeCPbSnhc=;
        b=s13bjxhYOeMltsFGaLlMMZgXZhbVYhjMJuOSjYfc8s9xNXtokS8YqSYaXsvKWAue34
         fbH0C4M+TXA18vLopSyXGjGqq42NIyqzrmJuu6t6uWvSW+Lxa3HO8/i5ZDntdMZzbEKJ
         OoDbkaMkQj4CWwXM0wQbCSJPNk7bPDE80loRAzETIErmQ1Wh5oihWkIqt/7pF6U3U0mJ
         reDV59tRwA8rT41ZVw23ASpumUh4fJ703W89SNwoLeDHC11mGEC/4Jj9qgwaN80WOl99
         gCxCOgmh5+/RK9Q1rW55irV9K1/5kFBTKHAm/40zjyC06ga20m3HIjXZVaf6S/JkT9x2
         H80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940963; x=1748545763;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Zf5c74izM5BGS8SL0XWGLm8rGTcUQnZ8yCeCPbSnhc=;
        b=JunuKPwMYf+B2f+BlgngZTx0XvSRklTJ17ip+GfebIBazuqaqKdm8TZbCf8BEaEmdy
         /uyj7iLeuRgyPhDA1GmOot/DoBx/TLDvDyyTyOU4lD3Yp2CNNRBbLU0wlkH+jRQLm4yU
         B9dqZ5/outpJzBLgJHUO4rHRaLkQ0ynKawCsfS0SkgivBXg9ngwkEQTBn0QeyM5bJEzq
         rsrwbLmAG7h0WjYPejKZ8B4a9WsiOdobDskBQTfzT9WiAcnekRwBTOHRQfSie3BvVT4v
         7AMNZ57739nkhbezdsUO1ruvFZ+CboD4XxLThCXAFB91Pwk9GVUnf9ZyxX5cU3UDucHZ
         dr/g==
X-Forwarded-Encrypted: i=1; AJvYcCWmS8tZayg9Ms66L1zDlRfhWsOKxgO5K+B3jo79yYSPwWNbtg37NpkhuTD/Qzro2EOsOc12pSKXZSTNcQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPDtpNJSDPidvImn8lHgSv+wYcRouq1mrOSIt3/XO8rI9oMAgB
	qf2c88MyCXKP2gf9weeNS9UPHQ5JBx+NLIR/AvcJtHU2ksW2XYciPcZK9K1YztklcLyiiFCWxqc
	0ujRkIw==
X-Google-Smtp-Source: AGHT+IGssf3horES+ZFWfYrsp2J0jNuYivC0L84W/Dzj2s2fpL61DJ6Zle4Xi1IXLbeenEp+WtiR64d7624=
X-Received: from qknqk16.prod.google.com ([2002:a05:620a:8890:b0:7ca:f59d:a84a])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:2994:b0:7cd:25:8a77
 with SMTP id af79cd13be357-7cee31cf967mr11408485a.9.1747940963104; Thu, 22
 May 2025 12:09:23 -0700 (PDT)
Date: Thu, 22 May 2025 19:09:12 +0000
In-Reply-To: <20250522190912.457583-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522190912.457583-1-royluo@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250522190912.457583-3-royluo@google.com>
Subject: [PATCH v1 2/2] Revert "usb: xhci: Implement xhci_handshake_check_state()
 helper"
From: Roy Luo <royluo@google.com>
To: royluo@google.com, mathias.nyman@intel.com, quic_ugoswami@quicinc.com, 
	Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, michal.pecio@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This reverts commit 6ccb83d6c4972ebe6ae49de5eba051de3638362c.

Commit 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state()
helper") was introduced to workaround watchdog timeout issues on some
platforms, allowing xhci_reset() to bail out early without waiting
for the reset to complete.

Skipping the xhci handshake during a reset is a dangerous move. The
xhci specification explicitly states that certain registers cannot
be accessed during reset in section 5.4.1 USB Command Register (USBCMD),
Host Controller Reset (HCRST) field:
"This bit is cleared to '0' by the Host Controller when the reset
process is complete. Software cannot terminate the reset process
early by writinga '0' to this bit and shall not write any xHC
Operational or Runtime registers until while HCRST is '1'."

This behavior causes a regression on SNPS DWC3 USB controller with
dual-role capability. When the DWC3 controller exits host mode and
removes xhci while a reset is still in progress, and then tries to
configure its hardware for device mode, the ongoing reset leads to
register access issues; specifically, all register reads returns 0.
These issues extend beyond the xhci register space (which is expected
during a reset) and affect the entire DWC3 IP block, causing the DWC3
device mode to malfunction.

Cc: stable@vger.kernel.org
Fixes: 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state() helper")
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/host/xhci-ring.c |  5 ++---
 drivers/usb/host/xhci.c      | 26 +-------------------------
 drivers/usb/host/xhci.h      |  2 --
 3 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 423bf3649570..b720e04ce7d8 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -518,9 +518,8 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
 	 * and try to recover a -ETIMEDOUT with a host controller reset.
 	 */
-	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->cmd_ring,
-			CMD_RING_RUNNING, 0, 5 * 1000 * 1000,
-			XHCI_STATE_REMOVING);
+	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
+			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
 	if (ret < 0) {
 		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
 		xhci_halt(xhci);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 244b12eafd95..cb9f35acb1f9 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -83,29 +83,6 @@ int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
 	return ret;
 }
 
-/*
- * xhci_handshake_check_state - same as xhci_handshake but takes an additional
- * exit_state parameter, and bails out with an error immediately when xhc_state
- * has exit_state flag set.
- */
-int xhci_handshake_check_state(struct xhci_hcd *xhci, void __iomem *ptr,
-		u32 mask, u32 done, int usec, unsigned int exit_state)
-{
-	u32	result;
-	int	ret;
-
-	ret = readl_poll_timeout_atomic(ptr, result,
-				(result & mask) == done ||
-				result == U32_MAX ||
-				xhci->xhc_state & exit_state,
-				1, usec);
-
-	if (result == U32_MAX || xhci->xhc_state & exit_state)
-		return -ENODEV;
-
-	return ret;
-}
-
 /*
  * Disable interrupts and begin the xHCI halting process.
  */
@@ -226,8 +203,7 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
 	if (xhci->quirks & XHCI_INTEL_HOST)
 		udelay(1000);
 
-	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->command,
-				CMD_RESET, 0, timeout_us, XHCI_STATE_REMOVING);
+	ret = xhci_handshake(&xhci->op_regs->command, CMD_RESET, 0, timeout_us);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 242ab9fbc8ae..5e698561b96d 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1855,8 +1855,6 @@ void xhci_remove_secondary_interrupter(struct usb_hcd
 /* xHCI host controller glue */
 typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
 int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us);
-int xhci_handshake_check_state(struct xhci_hcd *xhci, void __iomem *ptr,
-		u32 mask, u32 done, int usec, unsigned int exit_state);
 void xhci_quiesce(struct xhci_hcd *xhci);
 int xhci_halt(struct xhci_hcd *xhci);
 int xhci_start(struct xhci_hcd *xhci);
-- 
2.49.0.1204.g71687c7c1d-goog

