Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F31A2690F6
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748936312; cv=none; b=c04nenYhhl9/Udt//9glbr8YmIwk77jpkxqUl07Rpazpda1GpwqLzNJVBSqGthQbG3Hi+CD9G6VDdZfctd65qagx+sr/K5alj2R57WVNZqxUfv3vs3NePQrvAmSz/NMYo15KeLxTsorvwUG8UXMpzURJtK42mJsWhiRbibmIsNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748936312; c=relaxed/simple;
	bh=Z7Jhzk8dOH/rsvDUE+EcwZWpKseHrst7P5Ze2tKuim8=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=WcFTrYjTBT5YZJTtSv/BndoBZpvL0vxmhCsj8Ry/pjkLpYvOKSBJHnQCTY4CafpDCYlZW8wuXykgsOxsIeAuGeoZnyIP0hKwJ9Vd2Pwt1fGUVjDpW8BPgoEXUkQiuKqraNlw3IlM0QoxWheFfMPZfZbtJ1991IpjyXbQB3ydGhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtJEBFvx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtJEBFvx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053EBC4CEEF;
	Tue,  3 Jun 2025 07:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748936310;
	bh=Z7Jhzk8dOH/rsvDUE+EcwZWpKseHrst7P5Ze2tKuim8=;
	h=Date:From:To:cc:Subject:From;
	b=JtJEBFvxFmqVEDQ2u2u8SeWgPlRQ6hMgHIzcXl/BmfmRC/OsBewpgDvWEiNVGoBdv
	 xOy9AZ49Z/lRR+f7XXz/yXQb9SDYXQCya3QdwZ6MP5fHJeT64e5k8lhfvF8KOULtto
	 zpTe+YHswuUYpEerIH9U5ZXJ4Kh8pGrjEkK3LuMk7pqFc0L2b9+kUWkfjB7sI3EpNN
	 zn8CmucaedS9JtlLKOsuwBhWwv5l+hsMkHKWKcLRfdnZgfSn+LZJr8C3nBnntLOG5I
	 qrzn2EsMm6yE4N4kFlsrcwvJ78HhVh4AzoZB7A7s84McYDTFJQR6Lud7d/mq/6lCi3
	 mAXqe2Xp5Lk5g==
Date: Tue, 3 Jun 2025 09:38:27 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] HID queue for 6.16 merge window
Message-ID: <922s61r7-7ro6-o865-1o89-nr357r7rq70s@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Linus,

please pull from

  git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025060301

to receive HID subsystem queue for 6.16, namely:

=====
- support for Apple Magic Mouse 2 USB-C (Aditya Garg)
- power management improvement for multitouch devices (Werner Sembach)
- fix for ACPI initialization in intel-thc driver (Wentao Guan)
- adaptation of HID drivers to use new gpio_chip's line setter callbacks
  (Bartosz Golaszewski)
- fix potential OOB in usbhid_parse() (Terry Junge)
- make it possible to set hid_mouse_ignore_list dynamically (the same 
  way we handle other quirks) (Aditya Garg)
- other small assorted fixes and device ID additions
=====

Thanks!

----------------------------------------------------------------
Aditya Garg (2):
      HID: quirks: Add HID_QUIRK_IGNORE_MOUSE quirk
      HID: magicmouse: Apple Magic Mouse 2 USB-C support

Bartosz Golaszewski (6):
      HID: cp2112: destroy mutex on driver detach
      HID: cp2112: hold the lock for the entire direction_output() call
      HID: cp2112: use lock guards
      HID: cp2112: use new line value setter callbacks
      HID: mcp2200: use new line value setter callbacks
      HID: mcp2221: use new line value setter callbacks

Chen Ni (1):
      HID: corsair-void: Use to_delayed_work()

Colin Ian King (1):
      HID: intel-thc-hid: intel-thc: make read-only arrays static const

Geert Uytterhoeven (2):
      HID: HID_APPLETB_KBD should depend on X86
      HID: HID_APPLETB_BL should depend on X86

Lode Willems (1):
      HID: Kysona: Add periodic online check

TangDongxing (1):
      HID: hid-logitech: use sysfs_emit_at() instead of scnprintf()

Terry Junge (1):
      HID: usbhid: Eliminate recurrent out-of-bounds bug in usbhid_parse()

Thorsten Blum (1):
      HID: appletb-kbd: Use secs_to_jiffies() instead of msecs_to_jiffies()

Wentao Guan (1):
      HID: intel-thc-hid: intel-quicki2c: pass correct arguments to acpi_evaluate_object

Werner Sembach (2):
      HID: core: Add functions for HID drivers to react on first open and last close call
      HID: multitouch: Disable touchpad on firmware level while not in use

 drivers/hid/Kconfig                                |  2 +
 drivers/hid/hid-appletb-kbd.c                      |  9 ++-
 drivers/hid/hid-core.c                             |  9 ++-
 drivers/hid/hid-corsair-void.c                     |  4 +-
 drivers/hid/hid-cp2112.c                           | 66 ++++++++++---------
 drivers/hid/hid-hyperv.c                           |  4 +-
 drivers/hid/hid-ids.h                              |  1 +
 drivers/hid/hid-kysona.c                           | 46 +++++++++++++-
 drivers/hid/hid-lg4ff.c                            |  6 +-
 drivers/hid/hid-magicmouse.c                       | 74 +++++++++++++++-------
 drivers/hid/hid-mcp2200.c                          | 23 ++++---
 drivers/hid/hid-mcp2221.c                          | 10 +--
 drivers/hid/hid-multitouch.c                       | 12 ++++
 drivers/hid/hid-quirks.c                           |  5 +-
 .../intel-thc-hid/intel-quicki2c/pci-quicki2c.c    |  7 +-
 .../hid/intel-thc-hid/intel-thc/intel-thc-dev.c    |  4 +-
 drivers/hid/usbhid/hid-core.c                      | 25 ++++----
 drivers/usb/gadget/function/f_hid.c                | 12 ++--
 include/linux/hid.h                                |  9 ++-
 19 files changed, 217 insertions(+), 111 deletions(-)

-- 
Jiri Kosina
SUSE Labs

