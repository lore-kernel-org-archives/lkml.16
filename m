Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8F81A9B5D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 03:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744084726; cv=none; b=KOXqwN/AqgFI4a0upmq60ZxHqdmWNGSj/znuCEcmXLJ83JY3Dwk05OEto0fH3+zPXRM0LLQEt1E5nx6r+k8qw2Dlgl3j4KLuq//W+qpuzott6DkUdM3VDQNnZ8QKkiu1JkzViugFsHD6PxkVn1UWA+lPwFX8dyjz5PoHL2BwlTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744084726; c=relaxed/simple;
	bh=ff21elfV9WA+EUmjRXQ6LjjPkPIloNxwbagFWMRCcVs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bR1Vuq1fnG70tEGK8t2Z+MlM03jk8ZVjR4GA0JVL6VwFNUtRlji64XNJ6HxkUhVFt46BiE8WWiHOelghrCco4hTpx/A5BsOilItkRYtb5HC+271ZI3hBKUehNez7+ePf7ZsW3XbVxvygCI203LQ+EQ1uKAkVWXhTvha994cnMeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pgU1ytqm; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pgU1ytqm"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7398d70abbfso7236819b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 20:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744084725; x=1744689525; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1ih90bRJrRPnQchSa8rLYGcIPpTSXKq7O+MPB3UPJao=;
        b=pgU1ytqm93JmDutVjwWz64bYTkFfdRI2/GzFRwAEtZCM3Iz65Zr0/mLZcnErLD65c1
         aYp8LMCJac+5i1jUMj3xyAM1lSuf/zM0+mtsJ7zSfD2gXrDc38v+aoKoNKRQqvB+jXJe
         t9g2eiYv1FWSLNgsUcxLkV5VfAyjWjGdxoRfLCS9OoERE97O1aDNSAgPO95YOzhegqfm
         VC8XR7B6GpmFg6k5WM027k8wHbuiKk0h0qnWwIndQWDPRV1hYdsbuNZgghI0hbi4zEku
         xwAfErAaIa1c8W/SWZqPGtQZBgBSkE/2VPXF37a2dJE/fdUkf14BLsIW0kzGg7M9v9Yp
         YVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744084725; x=1744689525;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ih90bRJrRPnQchSa8rLYGcIPpTSXKq7O+MPB3UPJao=;
        b=HkXsoIXkku9hFX45ZBmItEFaUiUmVBjhsVsfhy5DZFPuZ/Xxm6vT9t7XXgjzpZ/EAc
         uOFAtk29fvFquFVZERrWe/RSe0An1k1e5t1GEHG5fEbgzsKwFy+yckL62lpoCvOu1OOt
         zWlDN72v0dwuOVHgM0nD0A6254j0kDDW+YiBHudJIwxr00bBwf7wkqrueoH1Q0motiA7
         YQPnqG//Bbi+1SZlRQAsgueg/+WpZvTKO1OX8K6ZXmW05fVkTX5FR9UeSIL1FqJ3rlE7
         rV1cXa8vNdWcJDiUrVbnlzgAFaw6c7pSaWT+4H8Y9dj1Po4KHuGGfmtNTOvI+gGucC/S
         +kLg==
X-Forwarded-Encrypted: i=1; AJvYcCVcR9hFNPctNOObAhX9kHh/DxfUA5WK+FE/SkDn2Rka4iOzWuKAq3GVewzEiD2tdkpUv2qle4tE0X7Tv6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVgbBfXG5bWUSBJX6cu37x3P1dmwZkhcE4F/XuVlMLi6Ho6D7K
	zhjACUYfZJFiBt48AEFc311++peYPvK7T9l5PU9jinnirG0XyEAU2mYi2MjMYN878Hm8URVAcxH
	SgAtBbKTC8kYa1g==
X-Google-Smtp-Source: AGHT+IESLoGE0zurjIsH+6CNJvPTjGEW4knHJgJPB9SvGABLu5g7MSpd6P4iir6utsdKHsLSfE099TqWqvObGrY=
X-Received: from pgjh14.prod.google.com ([2002:a63:df4e:0:b0:af8:cf0d:14cd])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:338b:b0:1f5:8d30:a4e3 with SMTP id adf61e73a8af0-20113d28462mr15446433637.28.1744084724651;
 Mon, 07 Apr 2025 20:58:44 -0700 (PDT)
Date: Tue,  8 Apr 2025 03:57:20 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408035833.844821-1-guanyulin@google.com>
Subject: [PATCH v11 0/4] Support system sleep with offloaded usb transfers
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, gargaditya08@live.com, kekrby@gmail.com, 
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
Changes in v11:
- Use USB subsystem wrappers in usb_offload_get()/usb_offload_put().
- Refine logics and add comment in usb_suspend_both()/usb_resume_both().

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

*** BLURB HERE ***

Guan-Yu Lin (4):
  usb: xhci-plat: separate dev_pm_ops for each pm_event
  usb: add apis for offload usage tracking
  xhci: sideband: add api to trace sideband usage
  usb: host: enable USB offload during system sleep

 drivers/usb/core/driver.c         | 151 ++++++++++++++++++++++++++++--
 drivers/usb/core/usb.c            |   1 +
 drivers/usb/host/Kconfig          |  11 +++
 drivers/usb/host/xhci-plat.c      |  42 ++++++++-
 drivers/usb/host/xhci-plat.h      |   1 +
 drivers/usb/host/xhci-sideband.c  |  43 +++++++++
 include/linux/usb.h               |  19 ++++
 include/linux/usb/xhci-sideband.h |   9 ++
 8 files changed, 267 insertions(+), 10 deletions(-)

-- 
2.49.0.504.g3bcea36a83-goog

