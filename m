Received: from mail-vk1-f202.google.com (mail-vk1-f202.google.com [209.85.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEDBE55B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747281757; cv=none; b=Ya547rj4C6cWEmJCC9g6g06iS7TL6FctMpIMcm7e27HplkBBwG+EGsksqaW0f7i5CAjUh2LNCSQQDxhNDFsGEPgKLFje+d1sd7Nz70s48TzY/vxwtMPZE5FFcAb2TlaXalgXGs0RQnetC3+UlH+pyShiNkFAIp7LXH81WntuhhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747281757; c=relaxed/simple;
	bh=35RyqXQeA7KWC5QOPkRVaxmTyklwSHLfq0BRuvBY2jw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=IhhUyY4Nye+99jWRFHlkUSjdZfEBQPtANJW3GIIIQ5IrEe1mxUw//Np31uBHh8/Y+TIvcyeBtc9GM+VcHQUnS2b5a9dQ7Z+QenwZaQHnr73WcNoei6cfSBG4qDOoTZcenKLOAoEmuCekprhEAw+eYVmn29b881N5RfyOIjmDTq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MnXvjXMU; arc=none smtp.client-ip=209.85.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MnXvjXMU"
Received: by mail-vk1-f202.google.com with SMTP id 71dfb90a1353d-5240516c312so91535e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747281754; x=1747886554; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7F3UVGrTtkYG0SSNHXNPOJ3LM1MwuA6O7PbUx1oz7HM=;
        b=MnXvjXMUdytokzcZjEItCLOeEjEQHGmMsVaknGsP8FzeBia2weOgSq7h+5I9dvhrGJ
         6D+F4g0kYbRegWst0Xl6s9By2xyMguqvDwflldwSJJXh/fGad0Y/9dR3uk1izsu+3ojY
         qs1YR0ogTdpjlYkBPK7Sa7LX6pma8UvCs3s9Eiypo6ZFLnbm9WXabAGowr83dfVX87+x
         XzZFU/sNavpzkb+LM4VfyfIhtsn9bVceCeW6sfQd+485F7jn+XDl3gOnP5X0WT4SWA4G
         o8oMM09QU8QbQYh1DPlZV+PP0Hd87cYvqU5o4N8Yx+PKpazP+Nd0iFkKmKquhRjm/q2f
         AsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747281754; x=1747886554;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7F3UVGrTtkYG0SSNHXNPOJ3LM1MwuA6O7PbUx1oz7HM=;
        b=edDMqW3LeGj5nwDjxGDljvxeGI0nOCtwYXgX/DBntyTCZWJuTN9perAMKgNFlOERwM
         X7jGOV9PF9BIMLPMlyGAL4MkobP1ULycen8NeV/BXxWAK1whslfkUb47lxqOnM0gy4kJ
         i73CLpCW6e1hNpNQtRAavYTvbYWwOWJzEYuIsTpyMseFrZcSzxKiz0VLtA4HVsLeONZU
         pP5kHt9bzw0A7rZVNsErWWyJLuelf3FHY6QbCpHYHYxlgGlV5hf3npCSTPcmx3Le0Ue1
         lu3CEH+YogtMTYjUGfqkBAlYh7VrAI3X4uXQk2QN156MsY7nC8SuBstYzG3PePljtFHy
         Ro6A==
X-Forwarded-Encrypted: i=1; AJvYcCUVcHO1LA/IkXMeVGcd106Lo6eAJWv2A+JoZB8o740XQ3MfI26qs053fLbB2FZvkfALpJ14ggP2k6QomIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhaLaPz624MSEPEfrZqyZyhJYPtIypqikbFOOJGQLlcFOryluo
	5Y/yECb0L74QajbyljVx8uqXM8u/vldf2TYR1BFMOzMAbPMmrWmKXGPuFjgHd86/CLK0LDXmia5
	b/Q==
X-Google-Smtp-Source: AGHT+IHWJWslfUxDlLQ2wuw9w6C28/+/uJc7nRCodhYkI60OOtBYXIpcguot0fbMLL3afGQbQIYk0XaowbI=
X-Received: from uabdb6.prod.google.com ([2002:a05:6130:2386:b0:871:d364:9800])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6102:2c0c:b0:4de:81a:7d42
 with SMTP id ada2fe7eead31-4df7dc8d136mr5289287137.1.1747281754453; Wed, 14
 May 2025 21:02:34 -0700 (PDT)
Date: Thu, 15 May 2025 04:02:07 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250515040207.1253690-1-royluo@google.com>
Subject: [PATCH v1 1/2] xhci: Add a quirk for full reset on removal
From: Roy Luo <royluo@google.com>
To: royluo@google.com, mathias.nyman@intel.com, quic_ugoswami@quicinc.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state()
helper") introduced an optimization to xhci_reset() during xhci removal,
allowing it to bail out early without waiting for the reset to complete.

This behavior can cause issues on SNPS DWC3 USB controller with dual-role
capability. When the DWC3 controller exits host mode and removes xhci
while a reset is still in progress, and then tries to configure its
hardware for device mode, the ongoing reset leads to register access
issues; specifically, all register reads returns 0. These issues extend
beyond the xhci register space (which is expected during a reset) and
affect the entire DWC3 IP block, causing the DWC3 device mode to
malfunction.

To address this, introduce the `XHCI_FULL_RESET_ON_REMOVE` quirk. When this
quirk is set, xhci_reset() always completes its reset handshake, ensuring
the controller is in a fully reset state before proceeding.

Fixes: 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state() helper")
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 drivers/usb/host/xhci.c      | 8 +++++++-
 drivers/usb/host/xhci.h      | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3155e3a842da..19c5c26a8e63 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -265,6 +265,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
 			xhci->quirks |= XHCI_SKIP_PHY_INIT;
 
+		if (device_property_read_bool(tmpdev, "xhci-full-reset-on-remove-quirk"))
+			xhci->quirks |= XHCI_FULL_RESET_ON_REMOVE;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 	}
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 90eb491267b5..4f091d618c01 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -198,6 +198,7 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
 	u32 command;
 	u32 state;
 	int ret;
+	unsigned int exit_state;
 
 	state = readl(&xhci->op_regs->status);
 
@@ -226,8 +227,13 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
 	if (xhci->quirks & XHCI_INTEL_HOST)
 		udelay(1000);
 
+	if (xhci->quirks & XHCI_FULL_RESET_ON_REMOVE)
+		exit_state = 0;
+	else
+		exit_state = XHCI_STATE_REMOVING;
+
 	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->command,
-				CMD_RESET, 0, timeout_us, XHCI_STATE_REMOVING);
+				CMD_RESET, 0, timeout_us, exit_state);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 242ab9fbc8ae..ac65af788298 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1637,6 +1637,7 @@ struct xhci_hcd {
 #define XHCI_WRITE_64_HI_LO	BIT_ULL(47)
 #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
 #define XHCI_ETRON_HOST	BIT_ULL(49)
+#define XHCI_FULL_RESET_ON_REMOVE	BIT_ULL(50)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;

base-commit: c94d59a126cb9a8d1f71e3e044363d654dcd7af8
-- 
2.49.0.1045.g170613ef41-goog

