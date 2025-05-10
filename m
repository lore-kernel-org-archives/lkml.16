Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CA02222D2;
	Sat, 10 May 2025 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746885248; cv=none; b=ZHatcJlz3LfSICnqOk/5Pkiv1OVHF72o1YPcQSdMUnaSwDhItWK9LYR6xAkjVbKQ0UZwAAs2QlES1X//OGdpSBNrbac5z3MYgz9MjXe6ih+izq+KMpi9RVtD4lLPuWOEz7Ixv/04OqQJv8V1WsMqs7wvlqi3pqPwhzF0tiFFZfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746885248; c=relaxed/simple;
	bh=6ea29RnEcGDdJm3zwVPchFi9hgzrk7540s+zE+aYxiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y+MM0RI5rvv0jiopoMWN/lWR61I/y+62Jh78ngw20+wuoII7pZkEMIudueC62GcMJ1Lc07G3yYycrHz5F0b5OhtiUkyIRmHBj6+FSuHSbbwE3bc+3EMxVj0tWYJBRbXbYmlmTtlnGqEt/UIyfpISm0KoVS0cymzHQHvPH5owjwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hs2sSZdz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hs2sSZdz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B00C4CEE2;
	Sat, 10 May 2025 13:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746885247;
	bh=6ea29RnEcGDdJm3zwVPchFi9hgzrk7540s+zE+aYxiU=;
	h=Date:From:To:Cc:Subject:From;
	b=hs2sSZdzHDa1T5JLjUGYDLOPmlBo4CI43bHpFaLV1Z4yjLIOigywd+RDSkni4ZzLI
	 903DXmwi8JvvVOSb+ikfSYY1oBOS7m2gWYhoBCGMdiKZ2P7Hk4WUtGViO0Hv4yL3LD
	 RiGX9GFJ4yN8cnkRmgnrR/SIHPXuEgLwzdo51sx8=
Date: Sat, 10 May 2025 15:54:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 6.15-rc6
Message-ID: <aB9afOnb3zQRbIPs@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.15-rc6

for you to fetch changes up to cab63934c33b12c0d1e9f4da7450928057f2c142:

  xhci: dbc: Avoid event polling busyloop if pending rx transfers are inactive. (2025-05-05 16:30:45 +0200)

----------------------------------------------------------------
USB fixes for 6.15-rc6

Here are some small USB driver fixes for 6.15-rc6.  Included in here
are:
  - typec driver fixes
  - usbtmc ioctl fixes
  - xhci driver fixes
  - cdnsp driver fixes
  - some gadget driver fixes

Nothing really major, just all little stuff that people have reported
being issues.  All of these have been in linux-next this week with no
reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alexey Charkov (1):
      usb: uhci-platform: Make the clock really optional

Andrei Kuchynski (2):
      usb: typec: ucsi: displayport: Fix deadlock
      usb: typec: ucsi: displayport: Fix NULL pointer access

Dave Penkler (3):
      usb: usbtmc: Fix erroneous get_stb ioctl error returns
      usb: usbtmc: Fix erroneous wait_srq ioctl return
      usb: usbtmc: Fix erroneous generic_read ioctl return

Jim Lin (1):
      usb: host: tegra: Prevent host controller crash when OTG port is used

Lukasz Czechowski (1):
      usb: misc: onboard_usb_dev: fix support for Cypress HX3 hubs

Mathias Nyman (1):
      xhci: dbc: Avoid event polling busyloop if pending rx transfers are inactive.

Michal Pecio (1):
      usb: xhci: Don't trust the EP Context cycle bit when moving HW dequeue

Oliver Neukum (1):
      USB: usbtmc: use interruptible sleep in usbtmc_read

Pawel Laszczak (2):
      usb: cdnsp: Fix issue with resuming from L1
      usb: cdnsp: fix L1 resume issue for RTL_REVISION_NEW_LPM version

Prashanth K (3):
      usb: gadget: f_ecm: Add get_status callback
      usb: gadget: Use get_status callback to set remote wakeup capability
      usb: dwc3: gadget: Make gadget_wakeup asynchronous

RD Babiera (1):
      usb: typec: tcpm: delay SNK_TRY_WAIT_DEBOUNCE to SRC_TRYWAIT transition

Wayne Chang (1):
      usb: gadget: tegra-xudc: ACK ST_RC after clearing CTRL_RUN

 drivers/usb/cdns3/cdnsp-gadget.c     | 31 +++++++++++++++++++
 drivers/usb/cdns3/cdnsp-gadget.h     |  6 ++++
 drivers/usb/cdns3/cdnsp-pci.c        | 12 ++++++--
 drivers/usb/cdns3/cdnsp-ring.c       |  3 +-
 drivers/usb/cdns3/core.h             |  3 ++
 drivers/usb/class/usbtmc.c           | 59 +++++++++++++++++++++--------------
 drivers/usb/dwc3/core.h              |  4 +++
 drivers/usb/dwc3/gadget.c            | 60 ++++++++++++++----------------------
 drivers/usb/gadget/composite.c       | 12 +++-----
 drivers/usb/gadget/function/f_ecm.c  |  7 +++++
 drivers/usb/gadget/udc/tegra-xudc.c  |  4 +++
 drivers/usb/host/uhci-platform.c     |  2 +-
 drivers/usb/host/xhci-dbgcap.c       | 19 ++++++++++--
 drivers/usb/host/xhci-dbgcap.h       |  3 ++
 drivers/usb/host/xhci-ring.c         | 19 ++++++------
 drivers/usb/host/xhci-tegra.c        |  3 ++
 drivers/usb/misc/onboard_usb_dev.c   | 10 ++++--
 drivers/usb/typec/tcpm/tcpm.c        |  2 +-
 drivers/usb/typec/ucsi/displayport.c | 21 ++++++++-----
 drivers/usb/typec/ucsi/ucsi.c        | 34 ++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h        |  2 ++
 21 files changed, 221 insertions(+), 95 deletions(-)
