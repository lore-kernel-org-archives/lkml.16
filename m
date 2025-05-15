Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0619D29B237
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335168; cv=none; b=H2x27ZBhE8CcmTzQjJ/n0Kj0XEGia7oSnKyuMEsN5gu1SOh8Zx3Ze4UY0bjC9GrjHDhlCoh69SgK4FjoMqMtsOZMJKvKFKmol7Q3j6UZlMLZw92sGb8Glp8dxq+iq3e3gKHDALIrfpawSGy5xl48maYEnyh9Ma3yJNmzmTHPxqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335168; c=relaxed/simple;
	bh=0LjNKhbfmAib3/bCGGrxaNTDj6/FhN1QTzDXt9i+2Dg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WczgvTkEnFrCm/KjrzDbgE+QcRUW0vVpPX94QH8kg6ppn9VST1mzdbUb3tsCGQCfDTWsEftgG8BQeOBMxhKrXTqErp40g7antyxqFt/3+TVeFPKVomlWOsvb9rWUL9rjCJhyg9OmVi4778QskpFOFgSgDYwc0ycFoL0hVGjIomA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M37H/kvt; arc=none smtp.client-ip=209.85.222.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M37H/kvt"
Received: by mail-ua1-f73.google.com with SMTP id a1e0cc1a2514c-8738ca25ecbso172104241.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747335165; x=1747939965; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DWyXRAdP87qgljLxl+HMaPV4zDEKZVcFQ9p3OniQnHM=;
        b=M37H/kvt3HAzYxRy423MGjcicT9FxMy76qDD9tflwllQp1ur6qZIwOIs+p2hnYdtvL
         /o2PAOGLM1aSU8tBsctPeuJoP6Svs7wwJ4XGflNFLOQPpuHrG82MXffzYuGPjcNsPxRw
         SUrek7mTeAsfOA9JjCjPUjPnY8XeuHeABA2luMC8AzwjtaUdPBuGdLY2Bmbr0jX0UIvr
         F18s3C+D5V1+lI6FKVLOnmyb+sks5gAgyBR86o14311U+hfGNG/xtm58wI2h4Bagh3e+
         wXT78oA1D8XqUiZ38NS6dhflqUp4ELMYiSO4su7bc7xybvoBi0Q4sh1y8IJ/qFvA+up3
         GR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335165; x=1747939965;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DWyXRAdP87qgljLxl+HMaPV4zDEKZVcFQ9p3OniQnHM=;
        b=LkThW3PYYJJ1TkQda4D9fF4VWzPC4nsfEhwCCzKdytmyQRlqJGEZf7Wv5nYzwmnBi7
         g3NCyK8jUubT9jXm5FEUxFXwuwB4tfchy+dK6zgWMBJ7Jntalmy1T2amOK6yTCznNXSq
         1BX0eIwHMVEMhd9vH0p1R2ugZ/T+/dDqkZpFSJLKfItWSow3O1Lqyzee91ZvNRmQyKAe
         ggOe7h0uQkRCnDKRsEI+oOYfJ/Q7aOMTEsxp/pmg4sdG6qs55oMsP0tqsircqrFkxivZ
         VXlE8OGyOnsC2i+qkeOeBYg++eLLFtAyylDn+/donp2aNuaujO1b1Z9EdaijhiBCYsXx
         EyKw==
X-Forwarded-Encrypted: i=1; AJvYcCUnzWMBxs0aG4P7E7t9ifGaURTHsgO4mNpjGfYPWMKcOn3IPTgf2YZlmWyCyZg3IPccL41JTPnpJ7XAYx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvHm3xdruUk7OftdkyuzbBbQJKL3DxV6bvAMZKxdd8lpmJxOls
	q0s2xm2vB9qR9wyZ81C9n3u07NLcElXAdOUyXVeyT04N7iDC8NkyH1SU75RT6v2K1hUg2XON/nG
	l01OcDg==
X-Google-Smtp-Source: AGHT+IG22pOiWebGnpFU30OwudK3lZF8XV0VjtcFcbirfzEnZEJ1trZz38ISLvHcqDC7fMy1q+bzyq8op8g=
X-Received: from uabji15.prod.google.com ([2002:a05:6130:694f:b0:862:24ba:d6a3])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6102:a54:b0:4df:8259:e99
 with SMTP id ada2fe7eead31-4dfa6aa8d4emr1466532137.1.1747335164831; Thu, 15
 May 2025 11:52:44 -0700 (PDT)
Date: Thu, 15 May 2025 18:52:27 +0000
In-Reply-To: <20250515185227.1507363-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250515185227.1507363-1-royluo@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250515185227.1507363-3-royluo@google.com>
Subject: [PATCH v2 2/2] usb: dwc3: Force full reset on xhci removal
From: Roy Luo <royluo@google.com>
To: royluo@google.com, mathias.nyman@intel.com, quic_ugoswami@quicinc.com, 
	Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

During an xhci host controller reset (via `USBCMD.HCRST`), reading DWC3
registers can return zero instead of their actual values. This applies
not only to registers within the xhci memory space but also those in
the broader DWC3 IP block.

By default, the xhci driver doesn't wait for the reset handshake to
complete during teardown. This can cause problems when the DWC3 controller
is operating as a dual role device and is switching from host to device
mode, the invalid register read caused by ongoing HCRST could lead to
gadget mode startup failures and unintended register overwrites.

To mitigate this, enable xhci-full-reset-on-remove-quirk to ensure that
xhci_reset() completes its full reset handshake during xhci removal.

Cc: stable@vger.kernel.org
Fixes: 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state() helper")
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/dwc3/host.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index b48e108fc8fe..ea865898308f 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -126,7 +126,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[6];
+	struct property_entry	props[7];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -182,6 +182,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (DWC3_VER_IS_WITHIN(DWC3, ANY, 300A))
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
 
+	if (dwc->dr_mode == USB_DR_MODE_OTG)
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-full-reset-on-remove-quirk");
+
 	if (prop_idx) {
 		ret = device_create_managed_software_node(&xhci->dev, props, NULL);
 		if (ret) {
-- 
2.49.0.1112.g889b7c5bd8-goog

