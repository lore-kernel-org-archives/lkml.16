Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8528319CCEC;
	Wed,  2 Apr 2025 20:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743624674; cv=none; b=WQqteeUU2HT/afBLuctqgutwtkUuwPnQPb29mIIQlC6YnD5GYmb3rD79Ak/lgCAtYmh+f7yaVyk1TznIYJNEcOmtMfY11Z1oDeh4WOahEfHmFmp8CNSEI+9D0RXXQGW6m6w6NOazpyxC1GFGWYiizfVdZeWpQKbYLYa50RvLBLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743624674; c=relaxed/simple;
	bh=o2Rjxq99fCIgVH7ALO7TVP3DMwtnwXVfRlyF9ke/XzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MYWzFsHaOnOq+pLcqdqvD31ocj9mr60RP8Q+notbi9SayB02Ax7yX+PdFi84hrecmo09k1R67sW7wesydMLkCny1bv7WzHOWENYWr7qdET/Oc3Y9Q4tvwYFz/fAhEpjlr0l3qOxM6EypKfesHExhkfefXVGrHCNP+D0z702qyOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NgDLnwMi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NgDLnwMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B992C4CEDD;
	Wed,  2 Apr 2025 20:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743624673;
	bh=o2Rjxq99fCIgVH7ALO7TVP3DMwtnwXVfRlyF9ke/XzI=;
	h=Date:From:To:Cc:Subject:From;
	b=NgDLnwMi8uPxUh7uRQjdQR/o+yr2WZKN1WffcfYZ1IvwnHQE8Nl9hZ57FR4vr7zgg
	 AVHvT5QpMmF9trDDW7/OdNGZxZ5e7X3RnRBl+DmqzLNwAnkllWCOvZNr9UUjSJum12
	 i5OfosEi4P56bVxfVnNDtAhGF5suP4ezp+ttUiWc=
Date: Wed, 2 Apr 2025 21:09:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB / Thunderbolt driver updates for 6.15-rc1
Message-ID: <Z-2ZiogJ5hSxivJd@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.15-rc1

for you to fetch changes up to ed492c95f13a7a27f1c0426b33c920ad343232c4:

  Merge tag 'usb-serial-6.15-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next (2025-03-22 12:32:15 -0700)

----------------------------------------------------------------
USB/Thunderbolt update for 6.15-rc1

Here is the big set of USB and Thunderbolt driver updates for 6.15-rc1.
Included in here are:
  - Thunderbolt driver and core api updates for new hardware and
    features
  - usb-storage const array cleanups
  - typec driver updates
  - dwc3 driver updates
  - xhci driver updates and bugfixes
  - small USB documentation updates
  - usb cdns3 driver updates
  - usb gadget driver updates
  - other small driver updates and fixes

All of these have been in linux-next for a while with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Abel Vesa (2):
      dt-bindings: usb: Add Parade PS8830 Type-C retimer bindings
      usb: typec: Add support for Parade PS8830 Type-C Retimer

Alan Borzeszkowski (1):
      thunderbolt: Make tb_tunnel_alloc_usb3() error paths consistent with the rest

Alexander Stein (1):
      usb: host: max3421-hcd: Add missing spi_device_id table

Andy Shevchenko (4):
      dt-bindings: usb: dwc3: Add a property to reserve endpoints
      usb: dwc3: gadget: Refactor loop to avoid NULL endpoints
      usb: dwc3: gadget: Add support for snps,reserved-endpoints property
      usb: dwc3: gadget: Avoid using reserved endpoints on Intel Merrifield

AngeloGioacchino Del Regno (1):
      dt-bindings: usb: richtek,rt1711h: Add missing vbus power supply

Benson Leung (2):
      usb: typec: thunderbolt: Fix loops that iterate TYPEC_PLUG_SOP_P and TYPEC_PLUG_SOP_PP
      usb: typec: thunderbolt: Remove IS_ERR check for plug

Catalin Popescu (3):
      dt-bindings: usb: microchip,usb2514: add support for vdda
      dt-bindings: usb: microchip,usb2514: add support for USB2512/USB2513
      usb: misc: onboard_dev: add vdda support for Microchip USB2514

Chenyuan Yang (1):
      usb: gadget: aspeed: Add NULL pointer check in ast_vhub_init_dev()

Christophe JAILLET (1):
      usb: musb: Constify struct musb_fifo_cfg

Dmitry Baryshkov (3):
      usb: typec: ucsi: return CCI and message from sync_control callback
      usb: typec: ucsi: ccg: move command quirks to ucsi_ccg_sync_control()
      usb: typec: ucsi: acpi: move LG Gram quirk to ucsi_gram_sync_control()

Dominique Martinet (2):
      usb: phy: mxs: silence EPROBE_DEFER error on boot
      usb: usb251xb: silence EPROBE_DEFER error on boot

Dr. David Alan Gilbert (1):
      usb: ulpi: Remove unused otg_ulpi_create

Greg Kroah-Hartman (4):
      Merge 6.14-rc3 into usb-next
      Merge v6.14-rc6 into usb-next
      Merge tag 'thunderbolt-for-v6.15-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next
      Merge tag 'usb-serial-6.15-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

Hans Verkuil (1):
      usb: gadget: uvc: drop vb2_ops_wait_prepare/finish

Igor Belwon (1):
      dt-bindings: usb: samsung,exynos-dwc3 Add exynos990 compatible

Jameson Thies (2):
      platform/chrome: add PD_EVENT_INIT bit definition
      usb: typec: ucsi: resume work after EC init

Johan Hovold (5):
      USB: serial: mos7840: drop unused defines
      usb: typec: ps883x: fix probe error handling
      usb: typec: ps883x: fix registration race
      usb: typec: ps883x: fix missing accessibility check
      usb: typec: ps883x: fix configuration error handling

Jonathan Neuschäfer (9):
      usb: storage: jumpshot: Use const for constant arrays
      usb: storage: transport: Use const for constant array
      usb: storage: alauda: Use const for card ID array
      usb: storage: datafab: Use const for constant arrays
      usb: storage: initializers: Use const for constant array
      usb: storage: realtek_cr: Use const for constant arrays
      usb: storage: sddr09: Use const for constant arrays
      usb: storage: sddr55: Use const for constant arrays
      usb: storage: shuttle_usbat: Use const for constant array

Kannappan R (1):
      USB: core: Add eUSB2 descriptor and parsing in USB core

Kaustabh Chakraborty (2):
      dt-bindings: usb: samsung,exynos-dwc3: add exynos7870 support
      usb: dwc3: exynos: add support for exynos7870

Kever Yang (1):
      dt-bindings: usb: dwc3: Add support for rk3562

Konrad Dybcio (1):
      dt-bindings: usb: qcom,dwc3: Synchronize minItems for interrupts and -names

Krzysztof Kozlowski (2):
      USB: dwc3: Use syscon_regmap_lookup_by_phandle_args
      dt-bindings: usb: usb-device: Replace free-form 'reg' with constraints

Madhu M (2):
      usb: typec: ucsi: Rename SET_UOM UCSI command to SET_CCOM
      usb: typec: ucsi: Enable UCSI commands in debugfs

Mario Limonciello (2):
      ucsi_ccg: Don't show failed to get FW build information error
      ucsi_ccg: Don't show non-functional attributes

Mathias Nyman (4):
      xhci: show correct U1 and U2 timeout values in debug messages
      xhci: Prevent early endpoint restart when handling STALL errors.
      xhci: Handle spurious events on Etron host isoc enpoints
      xhci: Avoid queuing redundant Stop Endpoint command for stalled endpoint

Michal Pecio (9):
      usb: xhci: Don't skip on Stopped - Length Invalid
      usb: xhci: Complete 'error mid TD' transfers when handling Missed Service
      usb: xhci: Fix isochronous Ring Underrun/Overrun event handling
      usb: xhci: Expedite skipping missed isoch TDs on modern HCs
      usb: xhci: Skip only one TD on Ring Underrun/Overrun
      usb: xhci: Apply the link chain quirk on NEC isoc endpoints
      usb: xhci: Unify duplicate inc_enq() code
      usb: xhci: Don't change the status of stalled TDs on failed Stop EP
      usb: xhci: Avoid Stop Endpoint retry loop if the endpoint seems Running

Mika Westerberg (3):
      MAINTAINERS: Use my kernel.org address for USB4/Thunderbolt work
      thunderbolt: Scan retimers after device router has been enumerated
      thunderbolt: Do not add non-active NVM if NVM upgrade is disabled for retimer

Niklas Neronin (5):
      usb: xhci: remove redundant update_ring_for_set_deq_completion() function
      usb: xhci: correct debug message page size calculation
      usb: xhci: set page size to the xHCI-supported size
      usb: xhci: refactor trb_in_td() to be static
      usb: xhci: move debug capabilities from trb_in_td() to handle_tx_event()

Rob Herring (Arm) (1):
      dt-bindings: usb: generic-xhci: Allow dma-coherent

Sebastian Reichel (1):
      usb: common: usb-conn-gpio: switch psy_cfg from of_node to fwnode

Stefan Eichenberger (1):
      usb: core: replace usb_sndaddr0pipe macro with usb_sndctrlpipe

Stefan Wahren (3):
      usb: dwc2: gadget: Introduce register restore flags
      usb: dwc2: Refactor backup/restore of registers
      usb: dwc2: Implement recovery after PM domain off

Suraj Patil (2):
      USB: docs: Fix typo in aspeed-lpc.yaml
      docs: Fix typo in usb/CREDITS

Thomas Weißschuh (2):
      usb: core: Don't use %pK through printk
      usb: dwc3: Don't use %pK through printk

Théo Lebrun (9):
      usb: host: xhci-plat: mvebu: use ->quirks instead of ->init_quirk() func
      usb: xhci: tegra: rename `runtime` boolean to `is_auto_runtime`
      usb: cdns3: rename hibernated argument of role->resume() to lost_power
      usb: cdns3: call cdns_power_is_lost() only once in cdns_resume()
      usb: cdns3-ti: move reg writes to separate function
      usb: cdns3-ti: run HW init at resume() if HW was reset
      usb: xhci: change xhci_resume() parameters to explicit the desired info
      usb: host: xhci-plat: allow upper layers to signal power loss
      usb: host: cdns3: forward lost power information to xhci

Xu Yang (1):
      usb: chipidea: imx: fix some typo

 .../devicetree/bindings/mfd/aspeed-lpc.yaml        |   2 +-
 .../devicetree/bindings/usb/generic-xhci.yaml      |   2 +
 .../devicetree/bindings/usb/microchip,usb2514.yaml |  35 +-
 .../devicetree/bindings/usb/parade,ps8830.yaml     | 140 +++++++
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   2 +
 .../devicetree/bindings/usb/richtek,rt1711h.yaml   |   3 +
 .../devicetree/bindings/usb/rockchip,dwc3.yaml     |  19 +
 .../bindings/usb/samsung,exynos-dwc3.yaml          |  44 +-
 .../devicetree/bindings/usb/snps,dwc3-common.yaml  |  11 +
 .../devicetree/bindings/usb/usb-device.yaml        |   6 +-
 .../driver-api/usb/writing_musb_glue_layer.rst     |   2 +-
 Documentation/usb/CREDITS                          |   2 +-
 MAINTAINERS                                        |   4 +-
 drivers/thunderbolt/retimer.c                      |   8 +-
 drivers/thunderbolt/tb.c                           |  16 +-
 drivers/thunderbolt/tunnel.c                       |  16 +-
 drivers/usb/cdns3/cdns3-gadget.c                   |   4 +-
 drivers/usb/cdns3/cdns3-ti.c                       | 107 +++--
 drivers/usb/cdns3/cdnsp-gadget.c                   |   2 +-
 drivers/usb/cdns3/core.c                           |   5 +-
 drivers/usb/cdns3/core.h                           |   2 +-
 drivers/usb/cdns3/host.c                           |  11 +
 drivers/usb/chipidea/usbmisc_imx.c                 |  10 +-
 drivers/usb/common/usb-conn-gpio.c                 |   2 +-
 drivers/usb/core/config.c                          |  51 ++-
 drivers/usb/core/hcd.c                             |   4 +-
 drivers/usb/core/hub.c                             |   4 +-
 drivers/usb/core/urb.c                             |   2 +-
 drivers/usb/dwc2/core.c                            |   1 +
 drivers/usb/dwc2/core.h                            |  23 +-
 drivers/usb/dwc2/gadget.c                          | 116 ++---
 drivers/usb/dwc2/hcd.c                             |  99 ++---
 drivers/usb/dwc2/platform.c                        |  38 ++
 drivers/usb/dwc3/dwc3-am62.c                       |  12 +-
 drivers/usb/dwc3/dwc3-exynos.c                     |   9 +
 drivers/usb/dwc3/dwc3-pci.c                        |  10 +
 drivers/usb/dwc3/dwc3-st.c                         |   2 +-
 drivers/usb/dwc3/gadget.c                          |  69 ++-
 drivers/usb/gadget/function/uvc_queue.c            |   2 -
 drivers/usb/gadget/udc/aspeed-vhub/dev.c           |   3 +
 drivers/usb/host/max3421-hcd.c                     |   7 +
 drivers/usb/host/xhci-histb.c                      |   2 +-
 drivers/usb/host/xhci-mem.c                        |  34 +-
 drivers/usb/host/xhci-mvebu.c                      |  10 -
 drivers/usb/host/xhci-mvebu.h                      |   6 -
 drivers/usb/host/xhci-pci.c                        |   8 +-
 drivers/usb/host/xhci-plat.c                       |  13 +-
 drivers/usb/host/xhci-plat.h                       |   1 +
 drivers/usb/host/xhci-ring.c                       | 422 ++++++++++---------
 drivers/usb/host/xhci-tegra.c                      |  10 +-
 drivers/usb/host/xhci.c                            |  41 +-
 drivers/usb/host/xhci.h                            |  30 +-
 drivers/usb/misc/onboard_usb_dev.h                 |   9 +-
 drivers/usb/misc/usb251xb.c                        |   6 +-
 drivers/usb/musb/jz4740.c                          |   4 +-
 drivers/usb/musb/mediatek.c                        |   2 +-
 drivers/usb/musb/mpfs.c                            |   2 +-
 drivers/usb/musb/musb_core.c                       |  14 +-
 drivers/usb/musb/sunxi.c                           |   4 +-
 drivers/usb/phy/phy-mxs-usb.c                      |   8 +-
 drivers/usb/phy/phy-ulpi.c                         |  23 -
 drivers/usb/serial/mos7840.c                       |  13 -
 drivers/usb/storage/alauda.c                       |   8 +-
 drivers/usb/storage/datafab.c                      |  14 +-
 drivers/usb/storage/initializers.c                 |   2 +-
 drivers/usb/storage/jumpshot.c                     |  10 +-
 drivers/usb/storage/realtek_cr.c                   |   6 +-
 drivers/usb/storage/sddr09.c                       |  14 +-
 drivers/usb/storage/sddr55.c                       |   4 +-
 drivers/usb/storage/shuttle_usbat.c                |   2 +-
 drivers/usb/storage/transport.c                    |   2 +-
 drivers/usb/typec/altmodes/thunderbolt.c           |  10 +-
 drivers/usb/typec/mux/Kconfig                      |  10 +
 drivers/usb/typec/mux/Makefile                     |   1 +
 drivers/usb/typec/mux/ps883x.c                     | 466 +++++++++++++++++++++
 drivers/usb/typec/ucsi/cros_ec_ucsi.c              |  22 +-
 drivers/usb/typec/ucsi/debugfs.c                   |   6 +-
 drivers/usb/typec/ucsi/trace.c                     |   2 +-
 drivers/usb/typec/ucsi/ucsi.c                      |  19 +-
 drivers/usb/typec/ucsi/ucsi.h                      |  10 +-
 drivers/usb/typec/ucsi/ucsi_acpi.c                 |  29 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |  97 +++--
 include/linux/platform_data/cros_ec_commands.h     |   1 +
 include/linux/usb.h                                |   8 +-
 include/linux/usb/musb.h                           |   2 +-
 include/linux/usb/ulpi.h                           |   9 -
 include/uapi/linux/usb/ch9.h                       |  15 +
 87 files changed, 1638 insertions(+), 700 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/parade,ps8830.yaml
 create mode 100644 drivers/usb/typec/mux/ps883x.c
