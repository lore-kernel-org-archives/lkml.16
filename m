Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com [209.85.219.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F0F2BCF43
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940961; cv=none; b=QZJlN5KqyosGpRAjv6nXEjuOkxqn9BCWJtdKQUokeEd/MAEgLiSLM4FpGiIAJ0zIen1Fx06j1woW6iPDJ+KU6iDOdel6eAbd8Xd2bh+f6ODze1hjCVQmqZ88MRlLY5K48pLMw1j0c15RAxkktDYTDxA5ce3TwsKDXljb9pq/I1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940961; c=relaxed/simple;
	bh=BR19mmn0q6nWHfwm8dA9+xsRACb9hw9V97AsFzShXkA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p3iDECat7/vKiijk5qips9uG8IqfMLXKLKuSPF7jE0rf+QqQbeoSG+XypjGuyD7T1Ki0+aA/A0NdJnPOmi/goMXnLVsmPVljZ0FU2kAQPJPU6ugf309R7G/eCF5kyZXIJwrdlsd8LoVZTEiPBef/myTI8jyAgpS0Aop8oTVoJKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u5uXBszg; arc=none smtp.client-ip=209.85.219.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u5uXBszg"
Received: by mail-qv1-f74.google.com with SMTP id 6a1803df08f44-6f8c461eea3so86783656d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747940959; x=1748545759; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VaF2Swsv5Zb3Xszex9sOMk6Juq7UEurFdjng9m7XVOo=;
        b=u5uXBszgpEEB8BfjLlgZItsOZTyR81j2FwhOFmuLXMtptJJYHTbT+MO73dqVMeEXXv
         u/2ZLaJwVhT4g6R1E9ssHFTkoWOdeFyDZX7bvLukO3jXx12mWsuvyAms25OSAqv2RNRY
         9NY7PjNNKxd2hHPH92ZZiseGQKpPZTCvdZ6FhTFD7QnZEwWyLh3OxSSPuh6iRYeKz7gi
         2ZVki7uZYSNUSPa3ECKqozR/dCpoc+G8GZwKt+iWHSf+clfVlSTc+fyzAYSYF3H+LxqI
         1ZSbnvQBu4GldwIBJ0ipfnxIsnpPqx3WwfBc38Kx30uFu4rtEKPGO5eVglzil9mgOzJf
         GM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940959; x=1748545759;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VaF2Swsv5Zb3Xszex9sOMk6Juq7UEurFdjng9m7XVOo=;
        b=b8C5+kZD3AL7Dewr3GICTGGpgqdzYDupkVqnzU/6st9abF98l67OWflZAdsmHTsI8Z
         FxzOEtZB2yabWQViy121+MlhbVaPKFR5zevqk2OaHaStHsXaDYSbVW+9edOsn9Hpw2Gf
         A/N3Dc0zky4Llxh4P3xFAVRj3NzLT68gOOpRdg5dAEPlF3M/xmTT9h0+O9IdLOqMCKKh
         0w3BAqdnYKuwAYPUaU3YcliWgFLOvoAXxRAxZj9S7vavT54QIa95WZ3X0gxub/GFL1Jv
         HDdCGCEVk6ElwlJcnZZ/KgG2RDj8bLvWRwp33cPLCV1bxKlIWDc5HxHhxllLR+pjGvnz
         28lw==
X-Forwarded-Encrypted: i=1; AJvYcCVibGG+2HIc7iNv/s7sCKgKnJyYFKU29oIE9EmDe5OCjmunXxqfvTC9lgpADY7nHIvcPTBuDNl6AASWg8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwszVtFYIdfV7zE8u52p0Yfxa3tiGPi7dB6A+9hcFFV2tN0v9Y8
	7LF5UoSn9n3VwLHxx6NUFjgCl1cvlVPQt6qOIwNUUiyfD/C+Pv/goMq+NLQ99C0rtwJ2wsff/ck
	p5jU4wg==
X-Google-Smtp-Source: AGHT+IFS1cJYHQ99pVpQzG4Bh8iQXl2IXVAgacqYwqJrITyvVk9vKAbskdcJt7WMm2d58m+HYeUADUAJbkU=
X-Received: from vkt12.prod.google.com ([2002:a05:6122:6b0c:b0:52c:5b16:39d0])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a0c:f113:0:b0:6f8:b4aa:2a4c
 with SMTP id 6a1803df08f44-6f8b4aa47f5mr236460976d6.14.1747940958756; Thu, 22
 May 2025 12:09:18 -0700 (PDT)
Date: Thu, 22 May 2025 19:09:11 +0000
In-Reply-To: <20250522190912.457583-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522190912.457583-1-royluo@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250522190912.457583-2-royluo@google.com>
Subject: [PATCH v1 1/2] usb: xhci: Skip xhci_reset in xhci_resume if xhci is
 being removed
From: Roy Luo <royluo@google.com>
To: royluo@google.com, mathias.nyman@intel.com, quic_ugoswami@quicinc.com, 
	Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, michal.pecio@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

xhci_reset() currently returns -ENODEV if XHCI_STATE_REMOVING is
set, without completing the xhci handshake, unless the reset completes
exceptionally quickly. This behavior causes a regression on Synopsys
DWC3 USB controllers with dual-role capabilities.

Specifically, when a DWC3 controller exits host mode and removes xhci
while a reset is still in progress, and then attempts to configure its
hardware for device mode, the ongoing, incomplete reset leads to
critical register access issues. All register reads return zero, not
just within the xHCI register space (which might be expected during a
reset), but across the entire DWC3 IP block.

This patch addresses the issue by preventing xhci_reset() from being
called in xhci_resume() and bailing out early in the reinit flow when
XHCI_STATE_REMOVING is set.

Cc: stable@vger.kernel.org
Fixes: 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state() helper")
Suggested-by: Mathias Nyman <mathias.nyman@intel.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/host/xhci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 90eb491267b5..244b12eafd95 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1084,7 +1084,10 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		xhci_dbg(xhci, "Stop HCD\n");
 		xhci_halt(xhci);
 		xhci_zero_64b_regs(xhci);
-		retval = xhci_reset(xhci, XHCI_RESET_LONG_USEC);
+		if (xhci->xhc_state & XHCI_STATE_REMOVING)
+			retval = -ENODEV;
+		else
+			retval = xhci_reset(xhci, XHCI_RESET_LONG_USEC);
 		spin_unlock_irq(&xhci->lock);
 		if (retval)
 			return retval;
-- 
2.49.0.1204.g71687c7c1d-goog

