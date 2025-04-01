Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E386A19D8AC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743489009; cv=none; b=AqR0l+Zo87XnF7k1WEo5UrrCWiq4cVFcY9JYKAbtAGj2Uqy8RA+yP3wKgfnok4mvaQ2dJ0bKTVf2Zc8TmzCVjZ0IwkqTdaarGBKSvxf9jP5kzHWBXYoKX5+ZqWenxSpTbqbKuAdBrAUVIIOVwXFFY2bm/noPaVCoi9kqnSUlSgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743489009; c=relaxed/simple;
	bh=USbG23zlSAIqxxboVL2BnKC5smfMZAVgXPKkRSRld0I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qKr/DGMk9WiwyqY8BdS17ICm9sfH//uilPmveZBrnClkIqGOt7pObV3/YT0gdIGl3yNwdKNnWFZ/g8JEiAAZXLDMszLFtJVp1vGPVearaeWTSJa3he6Qr2bQxaUG0AC8HGKTG0OvKnykHohLQes4kZhxOJpdDsTcgc2GuJHLGBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vrfZ83L+; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vrfZ83L+"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22650077995so145537245ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743489007; x=1744093807; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OqYe84wc1n9dIq60dY5m/RZydOIHZgtl3uuNumZs698=;
        b=vrfZ83L+bowA2yITVR5dVK4I6h82FHlsI+bXSMt8kD4daHd75PRxzM2lIS1swuVn6S
         4vSlkm9PZC6HcGqdQKnfnpsB2eRCSZvkld2BKs4DzdKXjjWMlrkIpNnUuSkNOHH3TmX3
         2Q9kjdvBguEr+c/pwt1wnkZVpKA2RW5kX2IB4gS2CLQpzlHJ9MliaUZ+59ruf/1v8nw+
         Ie+Ny8io77YK/0S65ebp/TfBzYEa9TcCI5uBxZcBCymXMSrggCKMkkbGVw6mG3sGyQSX
         5OJ86LBJAlgZYwtYjpbLHUQsHpStQuPhX9fPsqaXsfSNVpAagLGkhxGLk2MSTtc5esI/
         7bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743489007; x=1744093807;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqYe84wc1n9dIq60dY5m/RZydOIHZgtl3uuNumZs698=;
        b=NmvbCSO0W0inFQ0IZ0KwvOdU/Kw2tj78QPSqVmZG9ms7kkTAqJQgLfTous+gSAcV3K
         Y0XOjdPrznyR3xKO7gPr8ydVBZls79u5yMhngAdtbPgk7Bg6KCYhoVNEjwliMkq83T3v
         Skg197FQjNUcDROtjUqJn7StO1+mHJ4V/b/WXa15Kld+RMJtLN7tOQkZL9bvIi3MsplZ
         wtndai4tWZ8GSmOFcv9ahW3ZrsuUG6HTXdWSX3Z619zzvwoVynEMhz+jjFG5TJdNYSUO
         OCsRrqwGjpomooLz+PqHPsusiMamFZR2c943qpCwYncXPf9jwMMpTlY40C93SKc5t1a3
         oxsg==
X-Forwarded-Encrypted: i=1; AJvYcCVwubkWe0bkA0T7OhGLUsXT/g+CcKdakgezmVkfGda3YwijYVSQM6ZAlAOVQHy5avVj8Sg03CT2nzqLxio=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2WGnIPxO/+Cle9LaxG8aaGKAZeoM6GQ/F1WOfzmM16JyDx2d9
	pByZl7dKFTR5au8gK4K2WEBtp4DOYR8K6D6oPoA8bl9wvFdv1JZOoj7yrrzMgm/6+OV7RN2P5FU
	mVDR/QTlXnm/72w==
X-Google-Smtp-Source: AGHT+IG/Msl15+/4rANvxgod1MVl7FV/C1o7eT1eyIP5SvPXayKelEHw73RaXYFBCSQvGe7nthOYn87oNf6fxWM=
X-Received: from pjl14.prod.google.com ([2002:a17:90b:2f8e:b0:2fa:26f0:c221])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f709:b0:224:7a4:b2a with SMTP id d9443c01a7336-2292f942aa8mr216978175ad.11.1743489007210;
 Mon, 31 Mar 2025 23:30:07 -0700 (PDT)
Date: Tue,  1 Apr 2025 06:22:38 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401062951.3180871-1-guanyulin@google.com>
Subject: [PATCH v10 0/4] Support system sleep with offloaded usb transfers
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, sumit.garg@kernel.org, kekrby@gmail.com, 
	jeff.johnson@oss.qualcomm.com, elder@kernel.org, quic_zijuhu@quicinc.com, 
	ben@decadent.org.uk
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Wesley Cheng and Mathias Nyman's USB offload design enables a co-processor
to handle some USB transfers, potentially allowing the system to sleep
(suspend-to-RAM) and save power. However, Linux's System Sleep model halts
the USB host controller when the main system isn't managing any USB
transfers. To address this, the proposal modifies the system to recognize
offloaded USB transfers and manage power accordingly. This way, offloaded
USB transfers could still happen during system sleep (Suspend-to-RAM).

This involves two key steps:
1. Transfer Status Tracking: Propose offload_usage and corresponding apis
drivers could track USB transfers on the co-processor, ensuring the
system is aware of any ongoing activity.
2. Power Management Adjustment:  Modifications to the USB driver stack
(xhci host controller driver, and USB device drivers) allow the system to
sleep (Suspend-to-RAM) without disrupting co-processor managed USB
transfers. This involves adding conditional checks to bypass some power
management operations in the System Sleep model.

patches depends on series "Introduce QC USB SND audio offloading support" 
https://lore.kernel.org/lkml/20250319005141.312805-1-quic_wcheng@quicinc.com/

changelog
----------
Changes in v10:
- Remove unnecessary operations in dwc3 driver.
- Introduce CONFIG_USB_XHCI_SIDEBAND_SUSPEND to enable/disable offloaded
  usb transfers during system Suspend-to-RAM.
- Modify the approach to detect offloaded USB transfers when the system
  resumes from Suspend-to-RAM.
- Mark sideband activity when sideband interrupters are created/removed.
- Cosmetics changes on coding style.

Changes in v9:
- Remove unnecessary white space change.

Changes in v8:
- Change the runtime pm api to correct the error handling flow.
- Not flushing endpoints of actively offloaded USB devices to avoid
  possible USB transfer conflicts.

Changes in v7:
- Remove counting mechanism in struct usb_hcd. The USB device's offload
  status will be solely recorded in each related struct usb_device.
- Utilizes `needs_remote_wakeup` attribute in struct usb_interface to
  control the suspend flow of USB interfaces and associated USB endpoints.
  This addresses the need to support interrupt transfers generated by
  offloaded USB devices while the system is suspended.
- Block any offload_usage change during USB device suspend period.

Changes in v6:
- Fix build errors when CONFIG_USB_XHCI_SIDEBAND is disabled.
- Explicitly specify the data structure of the drvdata refereced in
  dwc3_suspend(), dwc3_resume().
- Move the initialization of counters to the patches introducing them.

Changes in v5:
- Walk through the USB children in usb_sideband_check() to determine the
  sideband activity under the specific USB device. 
- Replace atomic_t by refcount_t.
- Reduce logs by using dev_dbg & remove __func__.

Changes in v4:
- Isolate the feature into USB driver stack.
- Integrate with series "Introduce QC USB SND audio offloading support"

Changes in v3:
- Integrate the feature with the pm core framework.

Changes in v2:
- Cosmetics changes on coding style.

[v3] PM / core: conditionally skip system pm in device/driver model
[v2] usb: host: enable suspend-to-RAM control in userspace
[v1] [RFC] usb: host: Allow userspace to control usb suspend flows
---

Guan-Yu Lin (4):
  usb: xhci-plat: separate dev_pm_ops for each pm_event
  usb: add apis for offload usage tracking
  xhci: sideband: add api to trace sideband usage
  usb: host: enable USB offload during system sleep

 drivers/usb/core/driver.c         | 141 ++++++++++++++++++++++++++++--
 drivers/usb/core/usb.c            |   1 +
 drivers/usb/host/Kconfig          |  11 +++
 drivers/usb/host/xhci-plat.c      |  42 ++++++++-
 drivers/usb/host/xhci-plat.h      |   1 +
 drivers/usb/host/xhci-sideband.c  |  43 +++++++++
 include/linux/usb.h               |  19 ++++
 include/linux/usb/xhci-sideband.h |   9 ++
 8 files changed, 257 insertions(+), 10 deletions(-)

-- 
2.49.0.472.ge94155a9ec-goog

