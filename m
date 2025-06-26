Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308A515278E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750976136; cv=none; b=DXLMZs4kl45HpJyv/e1TDVtrWCj0k4LKGPr6dU5amhyhBWJKOuYDIbjdeKcPk7F+29z9WQrGXWGt3A+5/Bl92L5b5OTr+OVVFnXFp3fY2BbmWRHZs6zVbjixr1iNhJFrTISECKTYDg3wVCQQor9/b3XfAyB6Ppaht/QHYmkVkKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750976136; c=relaxed/simple;
	bh=9/WMYwYLlEeqFuoZQ4J4Yd1XfADAN6Jxe9RxIhwAQPo=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=iqP2phyifGxlIY8uSKzEtB7kgGAuh+3dOA4jsiWZlmG2g1GgOGR3TFaW4Lph6ImqSHE/3WESXPqavx5UF1oeYF4vzjGTbgvoC8lA2lfoUxpYW4fZbAwhB0xnuJSsSY34zQ0rKY7pGBrURyvxp9kQdYaKUqtFjpYIEv387ZnQKU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfVfAT8S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfVfAT8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2F6C4CEEB;
	Thu, 26 Jun 2025 22:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750976135;
	bh=9/WMYwYLlEeqFuoZQ4J4Yd1XfADAN6Jxe9RxIhwAQPo=;
	h=Date:From:To:cc:Subject:From;
	b=YfVfAT8SZZ31vkSXUmja/2Yqzs772fpFs+qpn3ZsH5Ye9Ln0QZ22d1La8pIXvV65C
	 L7QcTSrKFf5Js12ggia03zmuIC7PWpLhJmxXHg68UC7LGfxT7vPvHx54Q3Crm3fSGE
	 BqA1jSEBCT8pngaYh/WN/qkK3Xvjxxmq6P+ht/qMsEwLlbATiAbVagjmA/cb4O+v8o
	 qC05le+G1jabutTls7exIf3IDUugdg9Uvj27Q8j99ePgBziyUVS0e56xKndLmrDcDU
	 FxhVpBA6gX8+8w7rpWIIH9mWhKfBGMy3JHxSHmKogNN5/jVY86uV+hfQf8syYe315t
	 8La3euSKgLwpw==
Date: Fri, 27 Jun 2025 00:15:30 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Subject: [GIT PULL] HID fixes
Message-ID: <87p88249-s198-rq33-77p1-17qnr911436o@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Linus,

please pull from

  git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025062701

to receive fixes for HID subsystem; namely:

=====
- fix for stalls during suspend/resume cycles with hid-nintendo (Daniel 
  J. Ogorchock)
- memory leak and reference count fixes in hid-wacom and in-appletb-kdb 
  (Qasim Ijaz)
- race condition (leading to kernel crash) fix during device removal in 
  hid-wacom (Thomas Zeitlhofer)
- fix for missed interrupt in intel-thc-hid (Intel-thc-hid:)
- support for a bunch of new device IDs
=====

Thanks.

----------------------------------------------------------------
Akira Inoue (1):
      HID: lenovo: Add support for ThinkPad X1 Tablet Thin Keyboard Gen2

Chia-Lin Kao (AceLan) (1):
      HID: quirks: Add quirk for 2 Chicony Electronics HP 5MP Cameras

Daniel J. Ogorchock (1):
      HID: nintendo: avoid bluetooth suspend/resume stalls

Even Xu (1):
      HID: Intel-thc-hid: Intel-quicki2c: Enhance QuickI2C reset flow

Iusico Maxim (1):
      HID: lenovo: Restrict F7/9/11 mode to compact keyboards only

Mario Limonciello (1):
      HID: input: lower message severity of 'No inputs registered, leaving' to debug

Qasim Ijaz (4):
      HID: wacom: fix memory leak on kobject creation failure
      HID: wacom: fix memory leak on sysfs attribute creation failure
      HID: wacom: fix kobject reference count leak
      HID: appletb-kbd: fix "appletb_backlight" backlight device reference counting

Thomas Zeitlhofer (1):
      HID: wacom: fix crash in wacom_aes_battery_handler()

Zhang Heng (1):
      HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY

Zhang Lixu (2):
      hid: intel-ish-hid: Use PCI_DEVICE_DATA() macro for ISH device table
      HID: intel-ish-hid: ipc: Add Wildcat Lake PCI device ID

 drivers/hid/hid-appletb-kbd.c                      |  5 +++
 drivers/hid/hid-ids.h                              |  6 ++++
 drivers/hid/hid-input.c                            |  2 +-
 drivers/hid/hid-lenovo.c                           | 19 ++++++++---
 drivers/hid/hid-multitouch.c                       |  8 ++++-
 drivers/hid/hid-nintendo.c                         | 38 ++++++++++++++++++++--
 drivers/hid/hid-quirks.c                           |  3 ++
 drivers/hid/intel-ish-hid/ipc/hw-ish.h             |  1 +
 drivers/hid/intel-ish-hid/ipc/pci-ish.c            | 12 +++++--
 .../intel-quicki2c/quicki2c-protocol.c             | 26 ++++++++++++++-
 drivers/hid/wacom_sys.c                            |  7 +++-
 11 files changed, 114 insertions(+), 13 deletions(-)

-- 
Jiri Kosina
SUSE Labs

