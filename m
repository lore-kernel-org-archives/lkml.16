Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D2243AA9;
	Fri,  4 Jul 2025 14:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639206; cv=none; b=Dur6PmSlz3e+NliKmOHXP/M3Ch7mawh1QgFhnsQdYHZTXLdyObkqN3xcaWRAoTMpTFoW05v//mzHqoQrkf1ch4ZikhthHDPFE0GXcwL/abyJ1tyqm6XaBrN7Md5yzDbwopyESTS7gpPQX6LX9JMn3LO8G2gMXvRzqgLSO97lk+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639206; c=relaxed/simple;
	bh=6HSmrs2kw6xHOvIaiO9YVgVSQjMtUeaucvZf4I9HJfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GD1aQ0FKVlOiPUJ7i7TPOyU3ln1IrPJ/fDIFZXg3gkD3v9+OZqdFFV13UEkHTzyHplmh1WPY1ZIkmqtVm/2CiJv7tqid4vLqlMVOjm2zqFBe0P7vy05UZVcBCVo66ZpfK33E+NIo2G5vchm8rFQqUrrKenkbxhZArg7Sp8APiEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MVPIjO7C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MVPIjO7C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFBDC4CEE3;
	Fri,  4 Jul 2025 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751639204;
	bh=6HSmrs2kw6xHOvIaiO9YVgVSQjMtUeaucvZf4I9HJfg=;
	h=Date:From:To:Cc:Subject:From;
	b=MVPIjO7CiysakyUILrb0oSGRBNRRV+2shMwM4NjqxpnN/V7yIjQMCvbD2dNlch0UN
	 8birsadiylriBaqAM95FtvVK+nbFTatebw+9BBLPlnIIgNbs3xfqENdbjzenfM1kYR
	 1VysfBWKAuCUs6YsxWfQFyyH79FYMv+/NtngWnOU=
Date: Fri, 4 Jul 2025 16:26:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 6.16-rc5
Message-ID: <aGfkoTIQaoylP-Ul@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.16-rc5

for you to fetch changes up to 9bd9c8026341f75f25c53104eb7e656e357ca1a2:

  usb: hub: Fix flushing of delayed work used for post resume purposes (2025-06-30 15:36:00 +0200)

----------------------------------------------------------------
USB fixes for 6.16-rc5

Here are some USB driver fixes for 6.16-rc5.  I originally wanted this
to get into -rc4, but there were some regressions that had to be handled
first.  Now all looks good.  Included in here are the following fixes:
  - cdns3 driver fixes
  - xhci driver fixes
  - typec driver fixes
  - USB hub fixes (this is what took the longest to get right)
  - new USB driver quirks added
  - chipidea driver fixes

All of these have been in linux-next for a while and now we have no more
reported problems with them.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Andrei Kuchynski (1):
      usb: typec: displayport: Fix potential deadlock

Heikki Krogerus (1):
      usb: acpi: fix device link removal

Hongyu Xie (1):
      xhci: Disable stream for xHC controller with XHCI_BROKEN_STREAMS

Kuen-Han Tsai (3):
      usb: dwc3: Abort suspend on soft disconnect failure
      Revert "usb: gadget: u_serial: Add null pointer check in gs_start_io"
      usb: gadget: u_serial: Fix race condition in TTY wakeup

Mathias Nyman (4):
      usb: hub: fix detection of high tier USB3 devices behind suspended hubs
      usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm
      xhci: dbc: Flush queued requests before stopping dbc
      usb: hub: Fix flushing of delayed work used for post resume purposes

Oliver Neukum (1):
      Logitech C-270 even more broken

Pawel Laszczak (1):
      usb: cdnsp: Fix issue with CV Bad Descriptor test

Peter Chen (1):
      usb: cdnsp: do not disable slot for disabled slot

RD Babiera (2):
      usb: typec: tcpm: apply vbus before data bringup in tcpm_src_attach
      usb: typec: altmodes/displayport: do not index invalid pin_assignments

Raju Rangoju (1):
      usb: xhci: quirk for data loss in ISOC transfers

Roy Luo (2):
      usb: xhci: Skip xhci_reset in xhci_resume if xhci is being removed
      Revert "usb: xhci: Implement xhci_handshake_check_state() helper"

SCHNEIDER Johannes (1):
      usb: dwc3: gadget: Fix TRB reclaim logic for short transfers and ZLPs

Xu Yang (1):
      usb: chipidea: udc: disconnect/reconnect from host when do suspend/resume

Łukasz Bartosik (1):
      xhci: dbctty: disable ECHO flag by default

 drivers/usb/cdns3/cdnsp-debug.h          |  5 +++--
 drivers/usb/cdns3/cdnsp-ep0.c            | 18 ++++++++++++++---
 drivers/usb/cdns3/cdnsp-gadget.h         |  6 ++++++
 drivers/usb/cdns3/cdnsp-ring.c           |  7 +++++--
 drivers/usb/chipidea/udc.c               |  7 +++++++
 drivers/usb/core/hub.c                   | 31 +++++++++++++++++++++++++++++
 drivers/usb/core/hub.h                   |  1 +
 drivers/usb/core/quirks.c                |  3 ++-
 drivers/usb/core/usb-acpi.c              |  4 +++-
 drivers/usb/dwc3/core.c                  |  9 +++++++--
 drivers/usb/dwc3/gadget.c                | 24 ++++++++++------------
 drivers/usb/gadget/function/u_serial.c   | 12 ++++-------
 drivers/usb/host/xhci-dbgcap.c           |  4 ++++
 drivers/usb/host/xhci-dbgtty.c           |  1 +
 drivers/usb/host/xhci-mem.c              |  4 ++++
 drivers/usb/host/xhci-pci.c              | 25 +++++++++++++++++++++++
 drivers/usb/host/xhci-plat.c             |  3 ++-
 drivers/usb/host/xhci-ring.c             |  5 ++---
 drivers/usb/host/xhci.c                  | 31 +++++------------------------
 drivers/usb/host/xhci.h                  |  3 +--
 drivers/usb/typec/altmodes/displayport.c |  5 ++---
 drivers/usb/typec/tcpm/tcpm.c            | 34 ++++++++++++++++----------------
 include/linux/usb.h                      |  2 ++
 include/linux/usb/typec_dp.h             |  1 +
 24 files changed, 160 insertions(+), 85 deletions(-)
