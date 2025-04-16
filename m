Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE1A195FE8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814974; cv=none; b=F5uc6TSlUe8SGASvS8gXkXcBp3rhPK1IaDXmed1JUUggodd+0BxYeQcTite0EBun+HeG47pAd0Nj+MdPcnGeS34uNJYv1USDQ74V2V2kxJl/Nn1IJKWDrLeByg8M/5hVih5eQCJOLwYrNgVtAmqhORNIU2VVjkeezoCYfxOVq2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814974; c=relaxed/simple;
	bh=3cOKE8sRUfFSyrV9+eNxsnuM/NKtu8uXRgLx3GE4e4U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KPAjQIHyO8A3AdP1Ibd8RxuwtrYt0LeqFzWHwYb0I82v1MXqR58mfcznOxhmnCWeeY0DEr+3ni9nuHshMd+bjFuhi6NtaqAzYOMmjcjtB9szE2Yhg29PL2Ns34rjbujYSfgqRqt3JDMl5VHTvr60kiq41IbsvYvjd8xCjvSSCGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sABae74q; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sABae74q"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff6af1e264so9963658a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744814972; x=1745419772; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JLrc6T57KmbpRTsg5u0INlsAuDmuAXHmMHSOIm17IfY=;
        b=sABae74quqIMtDBwQlQUgX5a9f/2ivhTliW4ZF7u0FzPXhWmU7XoMpMs3H3sVa2+Z9
         UQvz4QfSoFH/0tlOMRk2R4/Fzd8FGJpaD4jSHoTU+rpQFyxzGY8AuBekkcTcXtDyhSG9
         Zev09677X8ljTkfyhmdmNuFzVOGGf2ccpTpDwIKEEU33JLztnfj1jTXPWgpZuO5fv+me
         78WxM5ehFLcslMO9fmHdqYkSqcGiiQ7wOEBl5ILif4nhR0qMpDVmFBCfLEJmxLE5fu4a
         6ABqc/Y4eOkKdZU0pDLNvW0tKmxGBZNQVM0aMA1zb1Ud+AsyDSIRWHTFpkxP4cNGoS9X
         Tzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744814972; x=1745419772;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JLrc6T57KmbpRTsg5u0INlsAuDmuAXHmMHSOIm17IfY=;
        b=aosaO2fkkquM1Y0LwGDROVblLXZUzncjWTnf4hDDrw06iz0TAC6bctC0nD6W9+Zc4/
         bz61qdgIa2f4BFRCRP77K23XcDJjKB8IPeQHDThYYzlzYu033qtU4l7YYnRU9CMOQGv+
         rFopq/Flb8eNUubnGLsm7HDYunCLvoEleCyyl+V/hjxxC/Bu0nm7NDg/zybEmUeQDDsy
         jyUqxiCUaCtnD8tQKUB0Yvwkc1ZSsGxd8p8vTd9r8kR94Awa4PKLzN8o6DyKpiH/KD5v
         zVOKRIep91oBlqGrAVruwA9Fu7n64+U/f3mn3al16f4q1PThN2MbjhGFulCtVfMFkLEj
         5Lkg==
X-Forwarded-Encrypted: i=1; AJvYcCVED3uFYUUZEqefIhjIAJCnJ3qH1Mvo1zlNLBhBj5Y0ECtYR1S7ljcCHNham84z4BwtYkU9yBoJHsW0SpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzquJdOLLGq7s7tmQWlhbjPHtCI9pYaUt+CcBnev6IyZxVLPO0M
	5xUiSDra/PlsdV45M7/ih+TwGbrX/yCtnN6TLAdAoMpPbc/kELGmA6Tql28xqQIUUa+roh4S/AL
	APH3WfXFvZbjARg==
X-Google-Smtp-Source: AGHT+IFLfOBlgAuxIguIThuokxRVTC2YdyQS8JCkdFIyfgJ9wBRcn0kqIi6auYBa5ndPGehzBDctjzcdIpvplq4=
X-Received: from pjbcz8.prod.google.com ([2002:a17:90a:d448:b0:2fa:b84:b308])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:53d0:b0:2ff:64c3:3bd4 with SMTP id 98e67ed59e1d1-30864179791mr2704392a91.31.1744814972507;
 Wed, 16 Apr 2025 07:49:32 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:43:00 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416144917.16822-1-guanyulin@google.com>
Subject: [PATCH v12 0/4] Support system sleep with offloaded usb transfers
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, sumit.garg@kernel.org, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com
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

changelog
----------
Changes in v12:
- Rebase on TOT.
- Cosmetics changes on coding style.

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
  usb: xhci-plat: separate dev_pm_ops for each pm_event
  usb: add apis for offload usage tracking
  xhci: sideband: add api to trace sideband usage
  usb: host: enable USB offload during system sleep

 drivers/usb/core/driver.c         | 159 ++++++++++++++++++++++++++++--
 drivers/usb/core/usb.c            |   1 +
 drivers/usb/host/Kconfig          |  11 +++
 drivers/usb/host/xhci-plat.c      |  42 +++++++-
 drivers/usb/host/xhci-plat.h      |   1 +
 drivers/usb/host/xhci-sideband.c  |  43 ++++++++
 include/linux/usb.h               |  18 ++++
 include/linux/usb/xhci-sideband.h |   9 ++
 8 files changed, 274 insertions(+), 10 deletions(-)

-- 
2.49.0.604.gff1f9ca942-goog

