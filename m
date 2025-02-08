Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518A61119A
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 03:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738985494; cv=none; b=D/Y513qf1Sab+J7LHD3JSOlXcoJUT+pjW5K17Uc3Grc8HZyuiPhSsR1xROhPlkMeVwQDlYvorc2Ub6QIrowNQc8I6aPMsIF/wXennOoN8kol6+TTWlqJRzxU2b/Bts73VUcAvEZ65b5YdGuvFQdB93NGHS+mwAXDEDLjtQxfjko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738985494; c=relaxed/simple;
	bh=+sardm/LolQw6ziPvWfFf1wd1dVDkIErwNJaVuBhKCI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FPBb3jHieIv12nXuQ9uJIrQm9MVppJPTb4x8t7/+570i43LXMvxJEu07YHvRto41KUmTeL2EOkdg2PPssFfTccY2BY9BE6SUJZ+3fjCfU9WKaHAmT//9kuRMZg0Nv1tTHutp/uzh9NxIgZyOro9Qm4hapg63wA7bB315KxGNwfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LJFz7KrD; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LJFz7KrD"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fa166cf656so4364327a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 19:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738985492; x=1739590292; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p0gZ2q9HM3rX07kpmvYyR39VyXsdRnL4CUz3gU+Woqc=;
        b=LJFz7KrDHsIKgE1KF5CTCVOYMs+coq4m0/ipl0e6pW7LQ5n6CX5+40/KgcCubxkXm3
         o94Q9oPCMQYLHH3a9NPJ1hTK6ZxI1wQIyavXF3Fv8LQxJGlwLwaBV9p7bgxfYS9kTeI9
         s14fgdWz8kX9U6R7cYZenisjEB/wRDRODQ5CCgeJUPGxpCqtuPirEo4n51djQcK8UEtb
         IFiT4Zk3vbUW39kEGzWFR9pov6wBVCNcqMqesMC1VRNo2VQV6ixvvUpOH0929BVuFMR6
         52os5NztoupKNjWx3tpVkD1xezoWWz3zou9zgCdxl4cT1AhCPHvJgmBnlamDUrpNwR8S
         kvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738985492; x=1739590292;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0gZ2q9HM3rX07kpmvYyR39VyXsdRnL4CUz3gU+Woqc=;
        b=vII4z8swsvESIKRYcdiOJTUUVB6o44QdVigaxbMXmfflO4RdnPF5Ml+LI5n+fzhlyD
         Y9lWa7lAE598d9CINK9Y4gPvexDj/vzs6rpXHFkbapGAE05450QLElAozVCmm0Yokveg
         A/re375mukQd0hIPj8Zc53Ez9D/6T5rUpptOnivNThGtiXWQBLptb3s9wBfziBqC/GCy
         nNyGaQLFIz8PKV9e+0N8WF5Y1O7DaUZhVyUa3uNggWYPTd96/spVT0YkvZY87dHS/0cL
         MJZBBmuCNbjDNhaaD5qlEkHDTMyD3BsS08ubqKmzByLgpUomCD48+8cdYfGlsY6ZsyBW
         tRSw==
X-Forwarded-Encrypted: i=1; AJvYcCXtJehmerAg6Z3BzPf8Ts+vs7+BKM7ZnQ3cIJMlpU/Fh6JGqjj0R+b0U9TRG29tC/aLeUDT+Lxx8u9kGl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcDnJvdlBTVPZMdK5rHcs22WjScbjgHg8jlUrIRXt7RAAhb0iF
	37DH9PCtYIOV/DLk1qf0zM41ULoZeKO8tcw2T7GXoudp6yem97bH58reQIb7GyM8wopoAwbzvOu
	jvA==
X-Google-Smtp-Source: AGHT+IHF6JQH1xgZnqdPNtMVklKecXq5Aajik4oseZpvmg90/Ega/bv/OBxCXP5JoMVF9e7hXVZw8+bCgNQ=
X-Received: from pjbsp15.prod.google.com ([2002:a17:90b:52cf:b0:2ee:53fe:d0fc])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d8c:b0:2f9:9ddd:689b
 with SMTP id 98e67ed59e1d1-2fa242e75eamr7097462a91.22.1738985492599; Fri, 07
 Feb 2025 19:31:32 -0800 (PST)
Date: Sat,  8 Feb 2025 03:31:29 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250208033129.3524423-1-badhri@google.com>
Subject: [PATCH v2] usb: dwc3: gadget: Prevent irq storm when TH re-executes
From: Badhri Jagan Sridharan <badhri@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	felipe.balbi@linux.intel.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jameswei@google.com, Badhri Jagan Sridharan <badhri@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

While commit d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events in
event cache") makes sure that top half(TH) does not end up overwriting the
cached events before processing them when the TH gets invoked more than one
time, returning IRQ_HANDLED results in occasional irq storm where the TH
hogs the CPU. The irq storm can be prevented by clearing the flag before
event handler busy is cleared. Default enable interrupt moderation in all
versions which support them.

ftrace event stub during dwc3 irq storm:
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000866: irq_handler_exit: irq=14 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000872: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000874: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000881: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000883: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000889: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000892: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000898: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000901: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000907: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000909: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000915: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000918: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000924: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000927: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000933: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000935: irq_handler_exit: irq=504 ret=handled
    ....

Cc: stable@kernel.org
Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Fixes: d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events in event cache")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/dwc3/core.c   |  2 +-
 drivers/usb/dwc3/gadget.c | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index dfa1b5fe48dc..6df971ef7285 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1835,7 +1835,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->tx_thr_num_pkt_prd = tx_thr_num_pkt_prd;
 	dwc->tx_max_burst_prd = tx_max_burst_prd;
 
-	dwc->imod_interval = 0;
+	dwc->imod_interval = 1;
 
 	dwc->tx_fifo_resize_max_num = tx_fifo_resize_max_num;
 }
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index d27af65eb08a..fad115113d28 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4467,14 +4467,18 @@ static irqreturn_t dwc3_process_event_buf(struct dwc3_event_buffer *evt)
 	dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
 		    DWC3_GEVNTSIZ_SIZE(evt->length));
 
+	evt->flags &= ~DWC3_EVENT_PENDING;
+	/*
+	 * Add an explicit write memory barrier to make sure that the update of
+	 * clearing DWC3_EVENT_PENDING is observed in dwc3_check_event_buf()
+	 */
+	wmb();
+
 	if (dwc->imod_interval) {
 		dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), DWC3_GEVNTCOUNT_EHB);
 		dwc3_writel(dwc->regs, DWC3_DEV_IMOD(0), dwc->imod_interval);
 	}
 
-	/* Keep the clearing of DWC3_EVENT_PENDING at the end */
-	evt->flags &= ~DWC3_EVENT_PENDING;
-
 	return ret;
 }
 

base-commit: 9682c35ff6ecd76d9462d4749b8b413d3e8e605e
-- 
2.48.1.502.g6dc24dfdaf-goog

