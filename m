Received: from mail-vs1-f74.google.com (mail-vs1-f74.google.com [209.85.217.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15612857DE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335156; cv=none; b=pPEfTh8Itt+4ZXRWxs8wB7GkPKnLtr5tZ8K16hYYQIUdwPUS8PgE/dFNZ956DwCtWUDE4SrfR/ArqbwOv3suucuuMWFb39KKxZf2YEbkG9wjnJje8pAfZMX0tl2Yk71ptWfQi95Y+zXx43YxI3lVdYppWm6dT3jHueBNJBWh6OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335156; c=relaxed/simple;
	bh=sKMJGihBmpII/w+js3KdZcePn/LGEXqD5iscBvkIyJE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=jlTFoWX2/gfYIkJedTqNO/HtH200m5P/aWqet80YMZrx4k8fQq05p978+80xFHiPbph8nfSySSfH8B0pZvXMzqyIbipKXIPpYMk4NLCRwCFs4gS6Qhllu0rBKkCZvRRGKlLIToy2G7ATup9QCAwJauW3dYBoJBqMDZyH9ljEx7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xHkC8cC1; arc=none smtp.client-ip=209.85.217.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xHkC8cC1"
Received: by mail-vs1-f74.google.com with SMTP id ada2fe7eead31-4e02acfe226so2458137.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747335153; x=1747939953; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=92kkN3rcD7ugEBZ84mgx5x5x7yIhjDBrfnl0tHxne2I=;
        b=xHkC8cC1R74NOIKfFvmrYkeoreI3XHc5LJkSIK7HFhencuZajMVRZeUGLfHa9ilGg9
         RfvVcfz658kysa1MpaFMB375YopklnoLd0fdk39lBK0Piy9FQ16X3WHGAqCG8XHdHW4R
         /w1SYzLxLyUolfrFO8aFwKH2aPdp33JdhmxZQMrYt9qa6cz0A5HN/tvPyRzoD7nDGeQl
         tls5niKCdE8UDdk7UXXW9Rqaz1RXLvEt43Flo4/ePa61JdrnAWM0Jj5ptf88mAzO6tLZ
         HcHrX9el/elzW6TTGVrUlx3NaGTIlqhhMNIbIlgMeGqIvt8ra0bXgZJFFrG1EMQC9xW/
         kzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335153; x=1747939953;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92kkN3rcD7ugEBZ84mgx5x5x7yIhjDBrfnl0tHxne2I=;
        b=loFISKRiUwLeRAAa2wQpglTl2PMfuUUoXVOLW5JnmaSmbtcYYYKAn+Tbkg5k+tG53G
         AWhVC1fBrAMQmDqdF7neS8qjUzo+HsqkCbilnaKvn/tynP5GCtAX0nBqPIKILyMaSPXI
         EHKT9ptRpL5FyOB51TR+ATos/gvq+C/NFp1eEG7KFZk1d5+NDcHgfQI5FWeWT5HNhrPF
         gqZJ0WZDhIzFqyTbYk0HcGPr1S8gqBdaLpsS+00TZPAFL5BfTsQwAxyrINFYx2I4Q+kc
         yRJ3kE+azUsdr49PVnM3M+ZllKWt9ybLE9o5cd2S7rZVYv+Lwgg7Zsewz9bc5GAqvpF1
         IKrw==
X-Forwarded-Encrypted: i=1; AJvYcCXuSIndi3mikddNq6xqxwyXaGYaAb2xV7p9NyRPhuOtAFl4BeSzCS/JPH55WwVmgeTjjf2EaeVSJikAvsM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+u47cfqSgUkwn/yp9NpsiAraBSurd6szS5Z7VI2kk1RpnLciM
	zGNpxR8fzS4+JYOaqEdydWAVHEUEih3yusFQWchBGjTWg+b5tPm2rd3G7qaXI4iHtYkh6lu0kam
	uxR5pxg==
X-Google-Smtp-Source: AGHT+IHxQt9s00s+i0yvc4i2P0f4q23V/d30FD5wIEnG18w9Bg2BCrgnSjVJNGR3lIVX0Ad1GMq21oh4Tfg=
X-Received: from vsbkb27.prod.google.com ([2002:a05:6102:809b:b0:4be:52ac:23ad])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6102:1628:b0:4da:e6e9:e008
 with SMTP id ada2fe7eead31-4dfa6aa8bdemr1406746137.4.1747335153630; Thu, 15
 May 2025 11:52:33 -0700 (PDT)
Date: Thu, 15 May 2025 18:52:25 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250515185227.1507363-1-royluo@google.com>
Subject: [PATCH v2 0/2] Introduce XHCI_FULL_RESET_ON_REMOVE quirk for DWC3
From: Roy Luo <royluo@google.com>
To: royluo@google.com, mathias.nyman@intel.com, quic_ugoswami@quicinc.com, 
	Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
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

To fix this, introduce XHCI_FULL_RESET_ON_REMOVE quirk andd enable it on
DWC3. This ensures xhci_reset() completes its full handshake before
proceeding.

---
Changes in v2:
- no code change
- add Fixes tag and cc stable kernel
Link to v1: https://lore.kernel.org/r/20250515040207.1253690-1-royluo@google.com/
---

Roy Luo (2):
  xhci: Add a quirk for full reset on removal
  usb: dwc3: Force full reset on xhci removal

 drivers/usb/dwc3/host.c      | 5 ++++-
 drivers/usb/host/xhci-plat.c | 3 +++
 drivers/usb/host/xhci.c      | 8 +++++++-
 drivers/usb/host/xhci.h      | 1 +
 4 files changed, 15 insertions(+), 2 deletions(-)


base-commit: c94d59a126cb9a8d1f71e3e044363d654dcd7af8
-- 
2.49.0.1112.g889b7c5bd8-goog

