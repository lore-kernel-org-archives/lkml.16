Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92362701D7;
	Fri, 25 Apr 2025 13:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588952; cv=none; b=AMMM8l0evNZx40cX41frWyBQ6GzBq+LbaWDnJ0uJm6+FV5xq0tcxQbghTzYgLofxcE3wuGjQ9vYJxyECVg9U6Py7+BENHb2x3L1gTDrMmqN1peLESqGmirGcFWAUa1Bq5NtsxHAPFDsyR6EqMjRwqIa0RNw8KCYcps52A10lWk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588952; c=relaxed/simple;
	bh=FwuPWlq6Cw/29r+Y2VW5C7dzbjwD+MSu3wk62JqnBiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ET8qSkkWpx6biGRSRiuCx2JyUUmDZeFJ1LmF6zPQj1PNAK16h1BY+2jjNGWBuV7CI3SixR7ZMLagKb0i4kDZ8Xkcq/5RfZVwZEoz9+0MRtIP8rCuMkN/5QjHFwSTEoK1BCTKzVzsGKFfGA27xi2sd5U6JqWI73fT+Erw0GWEQKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=guztwcrq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="guztwcrq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE83FC4CEE4;
	Fri, 25 Apr 2025 13:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745588952;
	bh=FwuPWlq6Cw/29r+Y2VW5C7dzbjwD+MSu3wk62JqnBiQ=;
	h=Date:From:To:Cc:Subject:From;
	b=guztwcrq3C1RUzUhAnOThbNN+wPu9Zz7cCyo9SAk9gpfxApoSwd0DlAVUH4O/INtt
	 ytd7POSELEASGoVD3upYX6X9U3NbkHzUsdUq7K7XwOok8WBExVDMtyi93U0+UknsFV
	 uMRXUqu5lvTITbnDktE1YjxqICe5cw2RcsEnAq88=
Date: Fri, 25 Apr 2025 15:49:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 6.15-rc4
Message-ID: <aAuS1QXWLNwEf31j@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.15-rc4

for you to fetch changes up to 3dfc0445274252301dfcf3980d79acceea6409d1:

  MAINTAINERS: Assign maintainer for the port controller drivers (2025-04-25 13:31:31 +0200)

----------------------------------------------------------------
USB fixes for 6.15-rc4

Here are some small USB driver fixes and new device ids for 6.15-rc4.
Nothing major in here, just the normal set of issues that have cropped
up after -rc1:
  - new device ids for usb-serial drivers
  - new device quirks added
  - typec driver fixes
  - chipidea driver fixes
  - xhci driver fixes
  - wdm driver fixes
  - cdns3 driver fixes
  - MAINTAINERS file update

All of these, except for the MAINTAINERS file update, have been in
linux-next for a while with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Adam Xue (1):
      USB: serial: option: add Sierra Wireless EM9291

Andrei Kuchynski (2):
      usb: typec: class: Fix NULL pointer access
      usb: typec: class: Invalidate USB device pointers on partner unregistration

Craig Hesling (1):
      USB: serial: simple: add OWON HDS200 series oscilloscope support

Dan Carpenter (1):
      usb: typec: class: Unlocked on error in typec_register_partner()

Fedor Pchelkin (3):
      usb: chipidea: ci_hdrc_imx: fix usbmisc handling
      usb: chipidea: ci_hdrc_imx: fix call balance of regulator routines
      usb: chipidea: ci_hdrc_imx: implement usb_phy_init() error handling

Frode Isaksen (1):
      usb: dwc3: gadget: check that event count does not exceed event buffer length

Greg Kroah-Hartman (1):
      Merge tag 'usb-serial-6.15-rc3' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Heikki Krogerus (1):
      MAINTAINERS: Assign maintainer for the port controller drivers

Huacai Chen (1):
      USB: OHCI: Add quirk for LS7A OHCI controller (rev 0x02)

Mathias Nyman (3):
      Revert "xhci: Avoid queuing redundant Stop Endpoint command for stalled endpoint"
      Revert "xhci: Prevent early endpoint restart when handling STALL errors."
      xhci: Limit time spent with xHC interrupts disabled during bus resume

Miao Li (2):
      usb: quirks: add DELAY_INIT quirk for Silicon Motion Flash Drive
      usb: quirks: Add delay init quirk for SanDisk 3.2Gen1 Flash Drive

Michael Ehrenreich (1):
      USB: serial: ftdi_sio: add support for Abacus Electrics Optical Probe

Michal Pecio (2):
      usb: xhci: Fix Short Packet handling rework ignoring errors
      usb: xhci: Fix invalid pointer dereference in Etron workaround

Mike Looijmans (1):
      usb: dwc3: xilinx: Prevent spike in reset signal

Oliver Neukum (6):
      USB: storage: quirk for ADATA Portable HDD CH94
      USB: VLI disk crashes if LPM is used
      USB: wdm: handle IO errors in wdm_wwan_port_start
      USB: wdm: close race between wdm_open and wdm_wwan_port_stop
      USB: wdm: wdm_wwan_port_tx_complete mutex in atomic context
      USB: wdm: add annotation

Ralph Siemsen (1):
      usb: cdns3: Fix deadlock when using NCM gadget

 MAINTAINERS                            |  8 +++++--
 drivers/usb/cdns3/cdns3-gadget.c       |  2 ++
 drivers/usb/chipidea/ci_hdrc_imx.c     | 44 ++++++++++++++++++++++++----------
 drivers/usb/class/cdc-wdm.c            | 21 ++++++++++++----
 drivers/usb/core/quirks.c              |  9 +++++++
 drivers/usb/dwc3/dwc3-xilinx.c         |  4 +---
 drivers/usb/dwc3/gadget.c              |  6 +++++
 drivers/usb/host/ohci-pci.c            | 23 ++++++++++++++++++
 drivers/usb/host/xhci-hub.c            | 30 ++++++++++++-----------
 drivers/usb/host/xhci-ring.c           | 11 ++++-----
 drivers/usb/host/xhci.c                | 18 ++++----------
 drivers/usb/host/xhci.h                |  5 ++--
 drivers/usb/serial/ftdi_sio.c          |  2 ++
 drivers/usb/serial/ftdi_sio_ids.h      |  5 ++++
 drivers/usb/serial/option.c            |  3 +++
 drivers/usb/serial/usb-serial-simple.c |  7 ++++++
 drivers/usb/storage/unusual_uas.h      |  7 ++++++
 drivers/usb/typec/class.c              | 24 +++++++++++++++----
 drivers/usb/typec/class.h              |  1 +
 19 files changed, 167 insertions(+), 63 deletions(-)
