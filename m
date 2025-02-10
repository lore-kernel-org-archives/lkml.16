Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2CA1B87E4
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175015; cv=none; b=jYNDcl6KxUVvsWEsEVmCtSpHkCLZDusjFfesz3yeKSrvSYW7sfui4czH+k/GMgvrxXIT7xVxL6pSiPZBhHRfClGUW4X0WS4xMfniuAoVlxuzKOZl+Q3S7vPoHUppHPRoqasPB3Gy4JTokrkJDj7L3WFlJ7g95sjy2G89PUh/UJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175015; c=relaxed/simple;
	bh=KX7xfLEjv0lnM/MON0ngBJgBQpWsyI+USLV0lN/n/Y8=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=ajg7MI8X/l+kF6rTHWQOy70fVvUaPNduiZLPbhvwS9XdqwBQi8Jf/nAeUDNaIgp0A3HWwBzWpbIGx/zNikRIMtPfygjwwJMDzAcoErATOWF4g3potOF6FwufOmejXJ6GrTdXfSySIFU2L+Dd6FqLlZSL0xHdThs25kpp1A0ib4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kewhC9UC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kewhC9UC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBAFC4CED1;
	Mon, 10 Feb 2025 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739175014;
	bh=KX7xfLEjv0lnM/MON0ngBJgBQpWsyI+USLV0lN/n/Y8=;
	h=Date:From:To:cc:Subject:From;
	b=kewhC9UCGlHNCTACXTyACVCz19amkMAMGjjMOTrkpMh9F1fLukOPB5345+lMmQEZu
	 c1YqyZnB+wyQBUdJ8DgpKSkii25ocC7AhXN8LoIKTXNxRnivIkxZ4re2xwgliDEnrz
	 QB0s3xikdnFeCPDfK7YvLqowZNYOMFR4Uzu+Y9P5Tj+HS1E+Qe0E1/QC8lvN+MF8V6
	 AwVxMpSxf6xeuU/Kyx1E2FaIWzisyO3DJh6oT+EYOybZjg43i/KTIevWFRjZlxR8yU
	 kfZDjkhxOqwQo8JjCGkFTl8Aptw+nalW6ni0wSTgBBfC0KP7bzRwOmi9upz8jZAMGe
	 RvT0nvlgLDrUw==
Date: Mon, 10 Feb 2025 09:10:11 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Subject: [GIT PULL] HID fixes for 6.14
Message-ID: <p38o7633-64s6-8os0-p7or-2n96o2n97qq6@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Linus,

please pull from

  git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025021001

to receive HID subsystem fixes, namely:

=====
- build/dependency fixes for hid-lenovo and hid-intel-thc (Arnd Bergmann)
- functional fixes for hid-corsair-void (Stuart Hayhurst)
- workqueue handling and ordering fix for hid-steam (Vicki Pfau)
- Gamepad mode vs. Lizard mode fix for hid-steam (Vicki Pfau)
- OOB read fix for hid-thrustmaster (Tulio Fernandes)
- fix for very long timeout on certain firmware in intel-ish-hid (Zhang 
  Lixu)
- other assorted small code fixes and device ID additions
=====

Thanks.

----------------------------------------------------------------
Alex Henrie (1):
      HID: apple: fix up the F6 key on the Omoton KB066 keyboard

Arnd Bergmann (2):
      HID: lenovo: select CONFIG_ACPI_PLATFORM_PROFILE
      HID: intel-thc: fix CONFIG_HID dependency

Charles Han (2):
      HID: winwing: Add NULL check in winwing_init_led()
      HID: multitouch: Add NULL check in mt_input_configured

Chia-Lin Kao (AceLan) (1):
      HID: ignore non-functional sensor in HP 5MP Camera

Daniel Brackenbury (1):
      HID: topre: Fix n-key rollover on Realforce R3S TKL boards

Ievgen Vovk (1):
      HID: hid-apple: Apple Magic Keyboard a3203 USB-C support

Jinghao Jia (2):
      samples/hid: remove unnecessary -I flags from libbpf EXTRA_CFLAGS
      samples/hid: fix broken vmlinux path for VMLINUX_BTF

Stuart Hayhurst (2):
      HID: corsair-void: Add missing delayed work cancel for headset status
      HID: corsair-void: Initialise memory for psy_cfg

Tulio Fernandes (1):
      HID: hid-thrustmaster: fix stack-out-of-bounds read in usb_check_int_endpoints()

Vicki Pfau (3):
      HID: hid-steam: Fix issues with disabling both gamepad mode and lizard mode
      HID: hid-steam: Move hidraw input (un)registering to work
      HID: hid-steam: Don't use cancel_delayed_work_sync in IRQ context

Zhang Lixu (3):
      HID: intel-ish-hid: fix the length of MNG_SYNC_FW_CLOCK in doorbell
      HID: intel-ish-hid: Send clock sync message immediately after reset
      HID: intel-ish-hid: ipc: Add Panther Lake PCI device IDs

 drivers/hid/Kconfig                         | 15 ++++++----
 drivers/hid/amd-sfh-hid/Kconfig             |  1 -
 drivers/hid/hid-apple.c                     |  8 +++++
 drivers/hid/hid-corsair-void.c              |  3 +-
 drivers/hid/hid-ids.h                       |  3 ++
 drivers/hid/hid-lenovo.c                    |  7 +----
 drivers/hid/hid-multitouch.c                |  5 +++-
 drivers/hid/hid-quirks.c                    |  1 +
 drivers/hid/hid-steam.c                     | 46 ++++++++++++++++++++++-------
 drivers/hid/hid-thrustmaster.c              |  2 +-
 drivers/hid/hid-topre.c                     |  7 +++++
 drivers/hid/hid-winwing.c                   |  2 ++
 drivers/hid/i2c-hid/Kconfig                 |  2 +-
 drivers/hid/intel-ish-hid/Kconfig           |  1 -
 drivers/hid/intel-ish-hid/ipc/hw-ish.h      |  2 ++
 drivers/hid/intel-ish-hid/ipc/ipc.c         | 15 ++++++----
 drivers/hid/intel-ish-hid/ipc/pci-ish.c     |  7 +++++
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h |  2 ++
 drivers/hid/intel-thc-hid/Kconfig           |  1 -
 drivers/hid/surface-hid/Kconfig             |  2 --
 drivers/hid/usbhid/Kconfig                  |  3 +-
 net/bluetooth/hidp/Kconfig                  |  3 +-
 samples/hid/Makefile                        | 13 ++++----
 23 files changed, 104 insertions(+), 47 deletions(-)

-- 
Jiri Kosina
SUSE Labs

