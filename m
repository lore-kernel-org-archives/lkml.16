Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB4D1E47B3;
	Fri,  6 Jun 2025 08:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199222; cv=none; b=cr3TWFKTyGlvdppdSUeDkvvbfq2b4tUyY6/SVCIYs02wrCH5753GAnuuQOMEAFFrhk4h6mE8VYOcBoJixcdPSAQEseovPlXa0Dorbztv5FovXN2LfUx7yBb+B4L+STqFecl+le+CYA7lx7U9cfmYNjD+nBjASjGGJa3gnAs/wdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199222; c=relaxed/simple;
	bh=GOu1g2rFi4HUQWGuvx8/hs3oNxAuoxhkWEDiumX1LUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NMW7++xuXn7HTZhCDH0HVoRFsv9gMgmkQZdTaledGaqnP555D+NJf+N7ga3urXLATcMOGXQpqTsq0LUt5G569VjbcvmcN+0jWmZpF1eZOB/hbLauZiPBeQoeMgF36WMCrPZByidAU1hSgb9WO/kelSOoBW82dRLbtKPR3ygbva8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=koV5WGBl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="koV5WGBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EEEC4CEEB;
	Fri,  6 Jun 2025 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749199222;
	bh=GOu1g2rFi4HUQWGuvx8/hs3oNxAuoxhkWEDiumX1LUc=;
	h=Date:From:To:Cc:Subject:From;
	b=koV5WGBlmBVe2yyjDGz4H1hLz6ZgPq11tBbhMf6IAHhP1nnsenAkUg3s9JDvOBgWF
	 AlAlvJcf2cZze5fct4Reh4cNyZSnXOzavtGE/a/Jv5vBb1zdFAyRE04pxOas5bojo+
	 LyLcvdo8sDywZC1XYFcu56zSqUMYRD+F923UTTzw=
Date: Fri, 6 Jun 2025 10:40:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB / Thunderbolt changes for 6.16-rc1
Message-ID: <aEKpczs8HIdTz2mB@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.16-rc1

for you to fetch changes up to 882826f58b2c48cafc7084a799207e76f2c74fe0:

  ALSA: usb-audio: qcom: fix USB_XHCI dependency (2025-05-23 14:38:50 +0200)

----------------------------------------------------------------
USB/Thunderbolt changes for 6.16-rc1

Here is the big set of USB and Thunderbolt changes for 6.16-rc1.
Included in here are the following:
  - USB offload support for audio devices.  I think this takes the
    record for the most number of patch series (30+) over the longest
    period of time (2+ years) to get merged properly.  Many props go to
    Wesley Cheng for seeing this effort through, they took a major
    out-of-tree hacked-up-monstrosity that was created by multiple
    vendors for their specific devices, got it all merged into a
    semi-coherent set of changes, and got all of the different major
    subsystems to agree on how this should be implemented both with
    changes to their code as well as userspace apis, AND wrangled the
    hardware companies into agreeing to go forward with this, despite
    making them all redo work they had already done in their private
    device trees.  This feature offers major power savings on embedded
    devices where a USB audio stream can continue to flow while the rest
    of the system is sleeping, something that devices running on battery
    power really care about.  There are still some more small tweaks
    left to be done here, and those patches are still out for review and
    arguing among the different hardware companies, but this is a major
    step forward and a great example of how to do upstream development
    well.
  - small number of thunderbolt fixes and updates, things seem to be
    slowing down here (famous last words...)
  - xhci refactors and reworking to try to handle some rough corner
    cases in some hardware implementations where things don't always
    work properly
  - typec driver updates
  - USB3 power management reworking and updates
  - Removal of some old and orphaned UDC gadget drivers that had not
    been used in a very long time, dropping over 11 thousand lines from
    the tree, always a nice thing, making up for the 12k lines added for
    the USB offload feature.
  - lots of little updates and fixes in different drivers

All of these have been in linux-next for over 2 weeks, the USB offload
logic has been in there for 8 weeks now, with no reported issues

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alan Borzeszkowski (7):
      thunderbolt: Expose usb4_port_index() to other modules
      thunderbolt: Add Thunderbolt/USB4 <-> USB3 match function
      usb: typec: Connect Type-C port with associated USB4 port
      thunderbolt: Introduce domain event message handler
      thunderbolt: Notify userspace about software CM tunneling events
      thunderbolt: Notify userspace about firmware CM tunneling events
      Documentation/admin-guide: Document Thunderbolt/USB4 tunneling events

Alan Stern (1):
      usb: ehci-fsl: Fix use of private data to avoid -Wflex-array-member-not-at-end warning

Aleksandrs Vinarskis (1):
      dt-bindings: usb: Add Parade PS8833 Type-C retimer variant

Alexey Charkov (1):
      dt-bindings: usb: generic-ehci: Add VIA/WonderMedia compatible

Amit Sunil Dhamne (1):
      usb: typec: tcpm/tcpci_maxim: Fix bounds check in process_rx()

Andy Shevchenko (1):
      usb: Add checks for snprintf() calls in usb_alloc_dev()

Arnd Bergmann (7):
      usb: dwc3: qcom: use modern PM macros
      ALSA: qc_audio_offload: rename dma/iova/va/cpu/phys variables
      ALSA: qc_audio_offload: avoid leaking xfer_buf allocation
      ALSA: qc_audio_offload: try to reduce address space confusion
      usb: misc: onboard_usb_dev: fix build warning for CONFIG_USB_ONBOARD_DEV_USB5744=n
      ASoC: qdsp6: fix compile-testing without CONFIG_OF
      ALSA: usb-audio: qcom: fix USB_XHCI dependency

Ben Hoff (1):
      usb: gadget: hid: allow dynamic interval configuration via configfs

Bjorn Andersson (7):
      usb: dwc3: qcom: Snapshot driver for backwards compatibilty
      dt-bindings: usb: Introduce qcom,snps-dwc3
      usb: dwc3: core: Expose core driver as library
      usb: dwc3: core: Don't touch resets and clocks
      usb: dwc3: qcom: Don't rely on drvdata during probe
      usb: dwc3: qcom: Transition to flattened model
      usb: dwc3: qcom: Use bulk clock API and devres

Chance Yang (1):
      usb: common: usb-conn-gpio: use a unique name for usb connector device

Charles Yeh (1):
      USB: serial: pl2303: add new chip PL2303GC-Q20 and PL2303GT-2AB

Chen Ni (5):
      usb: gadget: udc: renesas_usb3: remove unnecessary NULL check before phy_exit()
      usb: core: config: Use USB API functions rather than constants
      usb: dwc2: gadget: Use USB API functions rather than constants
      usb: gadget: epautoconf: Use USB API functions rather than constants
      usb: gadget: lpc32xx_udc: Use USB API functions rather than constants

Chen Yufeng (1):
      usb: potential integer overflow in usbg_make_tpg()

Chenyuan Yang (1):
      usb: acpi: Prevent null pointer dereference in usb_acpi_add_usb4_devlink()

Christophe JAILLET (1):
      ALSA: usb-audio: qcom: Fix an error handling path in qc_usb_audio_probe()

Cosmo Chou (1):
      usb: typec: tcpm: Use configured PD revision for negotiation

Dan Carpenter (3):
      ALSA: usb-audio: qcom: delete a stray tab
      ASoC: qcom: qdsp6: Set error code in q6usb_hw_params()
      usb: dwc3: qcom: Fix error handling in probe

Dave Penkler (2):
      usb: usbtmc: Fix read_stb function and get_stb ioctl
      usb: usbtmc: Fix timeout value in get_stb

Greg Kroah-Hartman (9):
      Merge 6.15-rc4 into usb-next
      Merge 6.15-rc6 into usb-next
      Merge tag 'thunderbolt-for-v6.15-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next
      Merge tag 'thunderbolt-for-v6.16-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next
      USB: serial: bus: fix const issue in usb_serial_device_match()
      Merge tag 'usb-serial-6.16-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next
      USB: gadget: fix up const issue with struct usb_function_instance
      USB: gadget: udc: fix const issue in gadget_match_driver()
      USB: typec: fix const issue in typec_match()

Gustavo A. R. Silva (1):
      usb: gadget: uvc: Avoid -Wflex-array-member-not-at-end warnings

Hans Zhang (1):
      xhci: Add missing parameter description to xhci_get_endpoint_index()

Hongyu Xie (1):
      usb: storage: Ignore UAS driver for SanDisk 3.2 Gen2 storage device

Ivaylo Ivanov (2):
      dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
      usb: dwc3: exynos: add support for Exynos2200 variant

J. Neuschäfer (2):
      dt-bindings: net: wireless: Add Realtek RTL8188ETV USB WiFi
      usb: misc: onboard_dev: Add Realtek RTL8188ETV WiFi (0bda:0179)

Jiayi Li (1):
      usb: quirks: Add NO_LPM quirk for SanDisk Extreme 55AE

Jihed Chaibi (1):
      usb: typec: tipd: fix typo in TPS_STATUS_HIGH_VOLAGE_WARNING macro

Johan Hovold (1):
      USB: serial: ti_usb_3410_5052: drop bogus read urb check

Jonathan Stroud (1):
      usb: misc: onboard_usb_dev: Fix usb5744 initialization sequence

Jos Wang (1):
      usb: typec: displayport: Receive DP Status Update NAK request exit dp altmode

Kees Cook (1):
      usb: gadget: g_ffs: Adjust f_ffs[0] allocation type

Krzysztof Kozlowski (4):
      usb: typec: tcpci: Fix wakeup source leaks on device unbind
      usb: typec: tipd: Fix wakeup source leaks on device unbind
      dt-bindings: usb: smsc,usb3503: Correct indentation and style in DTS example
      USB: host: omap: Do not enable by default during compile testing

Lad Prabhakar (4):
      usb: renesas_usbhs: Correct function references in comment
      usb: renesas_usbhs: Fix typo in comment
      usb: renesas_usbhs: Reorder clock handling and power management in probe
      dt-bindings: usb: renesas,usbhs: Add RZ/V2H(P) SoC support

Li Qiong (2):
      usb: cdns3: Remove the invalid comment
      usb: gadget: udc-xilinx: Remove the invalid comment

Luca Weiss (1):
      dt-bindings: usb: usb-switch: Allow data-lanes property in port

Madhu M (1):
      usb: typec: ucsi: Add the UCSI commands in debugfs

Mario Limonciello (2):
      thunderbolt: Use wake on connect and disconnect over suspend
      thunderbolt: Fix a logic error in wake on connect

Mathias Nyman (7):
      xhci: sideband: add initial api to register a secondary interrupter entity
      usb: hub: Block less in USB3 link power management LPM disable path
      usb: hub: verify device is configured in usb_device_may_initiate_lpm()
      usb: hub: Don't disable LPM completely if device initiated LPM fails
      usb: hub: reorder USB3 link power management enable requests
      usb: hub: Fail fast in USB3 link power management enable path
      usb: Flush altsetting 0 endpoints before reinitializating them after reset.

Matthias Schiffer (1):
      dt-bindings: usb: dwc3: Allow connector in USB controller node

Michael Grzeschik (7):
      usb: typec: mux: do not return on EOPNOTSUPP in {mux, switch}_set
      usb: typec: tcpm: allow to use sink in accessory mode
      usb: typec: tcpm: allow sink (ufp) to toggle into accessory mode debug
      usb: typec: tcpm: allow switching to mode accessory to mux properly
      usb: typec: tcpci: add regulator support
      usb: typec: mux: fsa4480: add regulator support
      usb: dwc2: also exit clock_gating when stopping udc while suspended

Michal Pecio (1):
      usb: xhci: Don't log transfer ring segment list on errors

Mike Looijmans (2):
      usb: misc: onboard_usb_dev: Add support for TI TUSB8044 hub
      dt-bindings: usb: ti,usb8041: Add binding for TI USB8044 hub controller

Niklas Neronin (20):
      usb: xhci: relocate pre-allocation initialization
      usb: xhci: move device slot enabling register write
      usb: xhci: move command ring pointer write
      usb: xhci: refactor xhci_set_cmd_ring_deq()
      usb: xhci: move DCBAA pointer write
      usb: xhci: move doorbell array pointer assignment
      usb: xhci: move enabling of USB 3 device notifications
      usb: xhci: remove error handling from xhci_add_interrupter()
      usb: xhci: move initialization of the primary interrupter
      usb: xhci: add individual allocation checks in xhci_mem_init()
      usb: xhci: cleanup xhci_mem_init()
      usb: xhci: set requested IMODI to the closest supported value
      usb: xhci: improve Interrupt Management register macros
      usb: xhci: guarantee that IMAN register is flushed
      usb: xhci: remove '0' write to write-1-to-clear register
      usb: xhci: rework Event Ring Segment Table Size mask
      usb: xhci: rework Event Ring Segment Table Address mask
      usb: xhci: cleanup IMOD register comments
      usb: xhci: rename 'irq_pending' to 'iman'
      usb: xhci: rename 'irq_control' to 'imod'

Pawel Laszczak (2):
      usb: cdnsp: Fix issue with detecting USB 3.2 speed
      usb: cdnsp: Fix issue with detecting command completion event

Pengyu Luo (2):
      usb: typec: ucsi: add Huawei Matebook E Go ucsi driver
      usb: typec: ucsi: huawei_gaokun: add error checking

Peter Korsgaard (1):
      usb: gadget: f_hid: wake up readers on disable/unbind

Pin-yen Lin (4):
      dt-bindings: usb: Introduce usb-hub.yaml
      dt-bindings: usb: Add binding for PS5511 hub controller
      dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
      usb: misc: onboard_usb_dev: Add Parade PS5511 hub support

Prashanth K (2):
      usb: gadget: u_serial: Implement remote wakeup capability
      usb: gadget: u_serial: Avoid double unlock of serial_port_lock

Pritam Manohar Sutar (2):
      dt-bindings: usb: samsung,exynos-dwc3: add dt-schema ExynosAutov920
      usb: dwc3-exynos: add support for ExynosAutov920

Qasim Ijaz (1):
      usb: typec: ucsi: fix Clang -Wsign-conversion warning

Quentin Schulz (1):
      dt-bindings: usb: usb-device: relax compatible pattern to a contains

RD Babiera (1):
      usb: typec: tcpm: move tcpm_queue_vdm_unlocked to asynchronous work

Rob Herring (Arm) (1):
      usb: Remove orphaned UDC drivers

Robert Hodaszi (1):
      usb: cdc-wdm: avoid setting WDM_READ for ZLP-s

Roy Luo (1):
      usb: dwc3: core: Avoid redundant system suspend/resume callbacks

Sergey Senozhatsky (1):
      thunderbolt: Do not double dequeue a configuration request

Thorsten Blum (1):
      USB: gadget: Replace deprecated strncpy() with strscpy()

Wesley Cheng (31):
      usb: host: xhci-mem: Cleanup pending secondary event ring events
      usb: host: xhci-mem: Allow for interrupter clients to choose specific index
      usb: host: xhci-plat: Set XHCI max interrupters if property is present
      usb: host: xhci: Notify xHCI sideband on transfer ring free
      usb: dwc3: Specify maximum number of XHCI interrupters
      ALSA: Add USB audio device jack type
      ALSA: usb-audio: Export USB SND APIs for modules
      ALSA: usb-audio: Check for support for requested audio format
      ALSA: usb-audio: Save UAC sample size information
      ALSA: usb-audio: Prevent starting of audio stream if in use
      ALSA: usb-audio: Introduce USB SND platform op callbacks
      ALSA: usb-audio: Allow for rediscovery of connected USB SND devices
      ASoC: Add SoC USB APIs for adding an USB backend
      ASoC: usb: Add PCM format check API for USB backend
      ASoC: usb: Create SOC USB SND jack kcontrol
      ASoC: usb: Fetch ASoC card and pcm device information
      ASoC: usb: Rediscover USB SND devices on USB port add
      ASoC: doc: Add documentation for SOC USB
      ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
      ASoC: dt-bindings: Update example for enabling USB offload on SM8250
      ASoC: qcom: qdsp6: Introduce USB AFE port to q6dsp
      ASoC: qcom: qdsp6: q6afe: Increase APR timeout
      ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6
      ASoC: qcom: qdsp6: Add headphone jack for offload connection status
      ASoC: qcom: qdsp6: Fetch USB offload mapped card and PCM device
      ALSA: usb-audio: qcom: Add USB QMI definitions
      ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
      ALSA: usb-audio: qcom: Don't allow USB offload path if PCM device is in use
      ALSA: usb-audio: qcom: Add USB offload route kcontrol
      ALSA: usb-audio: qcom: Notify USB audio devices on USB offload probing
      dt-bindings: usb: qcom,dwc3: Add SM8750 compatible

Xu Rao (1):
      usb: xhci: Add debugfs support for xHCI port bandwidth

Xu Yang (4):
      dt-bindings: usb: chipidea: Add i.MX95 compatible string 'fsl,imx95-usb'
      dt-bindings: usb: usbmisc-imx: add support for i.MX95 platform
      usb: chipidea: imx: add wakeup interrupt handling
      usb: chipidea: imx: add HSIO Block Control wakeup setting

Yue Haibing (1):
      usb: typec: ucsi: Fix unmet dependencies for UCSI_HUAWEI_GAOKUN

Zhang Lixu (1):
      MAINTAINERS: Update Intel LJCA maintainer

Zijun Hu (1):
      USB: core: Correct API usb_(enable|disable)_autosuspend() prototypes

 Documentation/admin-guide/thunderbolt.rst          |   33 +
 .../bindings/net/wireless/realtek,rtl8188e.yaml    |   50 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   15 +
 .../bindings/usb/chipidea,usb2-common.yaml         |    3 +
 .../devicetree/bindings/usb/chipidea,usb2-imx.yaml |   24 +-
 .../devicetree/bindings/usb/fsl,usbmisc.yaml       |   23 +-
 .../devicetree/bindings/usb/generic-ehci.yaml      |    1 +
 .../devicetree/bindings/usb/parade,ps5511.yaml     |  108 +
 .../devicetree/bindings/usb/parade,ps8830.yaml     |    7 +-
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   16 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  622 +++++
 .../devicetree/bindings/usb/realtek,rts5411.yaml   |   52 +-
 .../devicetree/bindings/usb/renesas,usbhs.yaml     |    7 +-
 .../bindings/usb/samsung,exynos-dwc3.yaml          |   30 +
 .../devicetree/bindings/usb/smsc,usb3503.yaml      |   84 +-
 .../devicetree/bindings/usb/snps,dwc3-common.yaml  |    6 +
 .../devicetree/bindings/usb/ti,usb8041.yaml        |    4 +-
 .../devicetree/bindings/usb/usb-device.yaml        |    3 +-
 Documentation/devicetree/bindings/usb/usb-hub.yaml |   84 +
 .../devicetree/bindings/usb/usb-switch.yaml        |   15 +-
 Documentation/sound/soc/index.rst                  |    1 +
 Documentation/sound/soc/usb.rst                    |  482 ++++
 MAINTAINERS                                        |    3 +-
 drivers/thunderbolt/ctl.c                          |    5 +
 drivers/thunderbolt/domain.c                       |    2 +-
 drivers/thunderbolt/icm.c                          |   36 +-
 drivers/thunderbolt/switch.c                       |    1 +
 drivers/thunderbolt/tb.c                           |   22 +-
 drivers/thunderbolt/tb.h                           |   14 +
 drivers/thunderbolt/tb_msgs.h                      |    1 +
 drivers/thunderbolt/tunnel.c                       |   92 +-
 drivers/thunderbolt/tunnel.h                       |   23 +
 drivers/thunderbolt/usb4.c                         |   18 +-
 drivers/thunderbolt/usb4_port.c                    |   56 +-
 drivers/usb/cdns3/cdns3-plat.c                     |    2 -
 drivers/usb/cdns3/cdnsp-gadget.c                   |   21 +-
 drivers/usb/cdns3/cdnsp-gadget.h                   |    4 +
 drivers/usb/chipidea/ci_hdrc_imx.c                 |   37 +
 drivers/usb/chipidea/usbmisc_imx.c                 |   77 +
 drivers/usb/class/cdc-wdm.c                        |   23 +-
 drivers/usb/class/usbtmc.c                         |   21 +-
 drivers/usb/common/usb-conn-gpio.c                 |   25 +-
 drivers/usb/core/config.c                          |    2 +-
 drivers/usb/core/hub.c                             |   90 +-
 drivers/usb/core/quirks.c                          |    3 +
 drivers/usb/core/usb-acpi.c                        |    2 +
 drivers/usb/core/usb.c                             |   14 +-
 drivers/usb/dwc2/gadget.c                          |    8 +-
 drivers/usb/dwc3/Makefile                          |    1 +
 drivers/usb/dwc3/core.c                            |  197 +-
 drivers/usb/dwc3/core.h                            |    2 +
 drivers/usb/dwc3/dwc3-exynos.c                     |   18 +
 drivers/usb/dwc3/dwc3-qcom-legacy.c                |  935 +++++++
 drivers/usb/dwc3/dwc3-qcom.c                       |  286 +-
 drivers/usb/dwc3/glue.h                            |   36 +
 drivers/usb/dwc3/host.c                            |    3 +
 drivers/usb/gadget/epautoconf.c                    |    2 +-
 drivers/usb/gadget/function/f_hid.c                |  138 +-
 drivers/usb/gadget/function/f_mass_storage.h       |    2 +-
 drivers/usb/gadget/function/f_serial.c             |    7 +
 drivers/usb/gadget/function/f_tcm.c                |    4 +-
 drivers/usb/gadget/function/u_hid.h                |    2 +
 drivers/usb/gadget/function/u_serial.c             |   50 +
 drivers/usb/gadget/function/uvc_configfs.h         |    4 +-
 drivers/usb/gadget/legacy/g_ffs.c                  |    2 +-
 drivers/usb/gadget/legacy/inode.c                  |    2 +-
 drivers/usb/gadget/udc/Kconfig                     |   44 -
 drivers/usb/gadget/udc/Makefile                    |    5 -
 drivers/usb/gadget/udc/core.c                      |    2 +-
 drivers/usb/gadget/udc/fusb300_udc.c               | 1516 -----------
 drivers/usb/gadget/udc/fusb300_udc.h               |  675 -----
 drivers/usb/gadget/udc/lpc32xx_udc.c               |    2 +-
 drivers/usb/gadget/udc/mv_u3d.h                    |  317 ---
 drivers/usb/gadget/udc/mv_u3d_core.c               | 2062 ---------------
 drivers/usb/gadget/udc/mv_udc.h                    |  309 ---
 drivers/usb/gadget/udc/mv_udc_core.c               | 2426 -----------------
 drivers/usb/gadget/udc/net2272.c                   | 2723 --------------------
 drivers/usb/gadget/udc/net2272.h                   |  584 -----
 drivers/usb/gadget/udc/renesas_usb3.c              |    6 +-
 drivers/usb/gadget/udc/udc-xilinx.c                |    2 -
 drivers/usb/host/Kconfig                           |   11 +-
 drivers/usb/host/Makefile                          |    4 +
 drivers/usb/host/ehci-fsl.c                        |   25 +-
 drivers/usb/host/xhci-caps.h                       |    4 +-
 drivers/usb/host/xhci-debugfs.c                    |  108 +
 drivers/usb/host/xhci-hub.c                        |    2 +-
 drivers/usb/host/xhci-mem.c                        |  249 +-
 drivers/usb/host/xhci-plat.c                       |    2 +
 drivers/usb/host/xhci-ring.c                       |   74 +-
 drivers/usb/host/xhci-sideband.c                   |  457 ++++
 drivers/usb/host/xhci.c                            |  209 +-
 drivers/usb/host/xhci.h                            |  110 +-
 drivers/usb/misc/onboard_usb_dev.c                 |  117 +-
 drivers/usb/misc/onboard_usb_dev.h                 |   19 +
 drivers/usb/phy/Kconfig                            |   12 -
 drivers/usb/phy/Makefile                           |    1 -
 drivers/usb/phy/phy-mv-usb.c                       |  881 -------
 drivers/usb/renesas_usbhs/common.c                 |   54 +-
 drivers/usb/serial/bus.c                           |    2 +-
 drivers/usb/serial/pl2303.c                        |    2 +
 drivers/usb/serial/ti_usb_3410_5052.c              |    5 -
 drivers/usb/storage/unusual_uas.h                  |    7 +
 drivers/usb/typec/altmodes/displayport.c           |    4 +
 drivers/usb/typec/bus.c                            |    2 +-
 drivers/usb/typec/mux.c                            |    4 +-
 drivers/usb/typec/mux/fsa4480.c                    |    5 +
 drivers/usb/typec/port-mapper.c                    |   23 +-
 drivers/usb/typec/tcpm/tcpci.c                     |    5 +
 drivers/usb/typec/tcpm/tcpci_maxim_core.c          |    8 +-
 drivers/usb/typec/tcpm/tcpm.c                      |  188 +-
 drivers/usb/typec/tipd/core.c                      |    2 +-
 drivers/usb/typec/tipd/tps6598x.h                  |    2 +-
 drivers/usb/typec/tipd/trace.h                     |    2 +-
 drivers/usb/typec/ucsi/Kconfig                     |   11 +
 drivers/usb/typec/ucsi/Makefile                    |    1 +
 drivers/usb/typec/ucsi/debugfs.c                   |    4 +
 drivers/usb/typec/ucsi/ucsi.h                      |    4 +-
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c        |  526 ++++
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h |    1 +
 include/linux/mod_devicetable.h                    |    2 +-
 include/linux/thunderbolt.h                        |   18 +
 include/linux/usb.h                                |    8 +-
 include/linux/usb/composite.h                      |    2 +-
 include/linux/usb/xhci-sideband.h                  |  102 +
 include/sound/jack.h                               |    4 +-
 include/sound/q6usboffload.h                       |   20 +
 include/sound/soc-usb.h                            |  138 +
 include/uapi/linux/input-event-codes.h             |    3 +-
 sound/core/jack.c                                  |    6 +-
 sound/soc/Kconfig                                  |   10 +
 sound/soc/Makefile                                 |    2 +
 sound/soc/qcom/Kconfig                             |   16 +
 sound/soc/qcom/Makefile                            |    2 +
 sound/soc/qcom/qdsp6/Makefile                      |    1 +
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |   60 +
 sound/soc/qcom/qdsp6/q6afe.c                       |  192 +-
 sound/soc/qcom/qdsp6/q6afe.h                       |   36 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c           |   23 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h           |    1 +
 sound/soc/qcom/qdsp6/q6routing.c                   |    9 +-
 sound/soc/qcom/qdsp6/q6usb.c                       |  421 +++
 sound/soc/qcom/sm8250.c                            |   24 +-
 sound/soc/qcom/usb_offload_utils.c                 |   56 +
 sound/soc/qcom/usb_offload_utils.h                 |   30 +
 sound/soc/soc-usb.c                                |  322 +++
 sound/usb/Kconfig                                  |   15 +
 sound/usb/Makefile                                 |    2 +-
 sound/usb/card.c                                   |  106 +
 sound/usb/card.h                                   |   17 +
 sound/usb/endpoint.c                               |    1 +
 sound/usb/format.c                                 |    1 +
 sound/usb/helper.c                                 |    1 +
 sound/usb/pcm.c                                    |  104 +-
 sound/usb/pcm.h                                    |   11 +
 sound/usb/qcom/Makefile                            |    4 +
 sound/usb/qcom/mixer_usb_offload.c                 |  155 ++
 sound/usb/qcom/mixer_usb_offload.h                 |   11 +
 sound/usb/qcom/qc_audio_offload.c                  | 2017 +++++++++++++++
 sound/usb/qcom/usb_audio_qmi_v01.c                 |  863 +++++++
 sound/usb/qcom/usb_audio_qmi_v01.h                 |  164 ++
 160 files changed, 10370 insertions(+), 12393 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/realtek,rtl8188e.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/parade,ps5511.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/usb-hub.yaml
 create mode 100644 Documentation/sound/soc/usb.rst
 create mode 100644 drivers/usb/dwc3/dwc3-qcom-legacy.c
 create mode 100644 drivers/usb/dwc3/glue.h
 delete mode 100644 drivers/usb/gadget/udc/fusb300_udc.c
 delete mode 100644 drivers/usb/gadget/udc/fusb300_udc.h
 delete mode 100644 drivers/usb/gadget/udc/mv_u3d.h
 delete mode 100644 drivers/usb/gadget/udc/mv_u3d_core.c
 delete mode 100644 drivers/usb/gadget/udc/mv_udc.h
 delete mode 100644 drivers/usb/gadget/udc/mv_udc_core.c
 delete mode 100644 drivers/usb/gadget/udc/net2272.c
 delete mode 100644 drivers/usb/gadget/udc/net2272.h
 create mode 100644 drivers/usb/host/xhci-sideband.c
 delete mode 100644 drivers/usb/phy/phy-mv-usb.c
 create mode 100644 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
 create mode 100644 include/linux/usb/xhci-sideband.h
 create mode 100644 include/sound/q6usboffload.h
 create mode 100644 include/sound/soc-usb.h
 create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
 create mode 100644 sound/soc/qcom/usb_offload_utils.c
 create mode 100644 sound/soc/qcom/usb_offload_utils.h
 create mode 100644 sound/soc/soc-usb.c
 create mode 100644 sound/usb/qcom/Makefile
 create mode 100644 sound/usb/qcom/mixer_usb_offload.c
 create mode 100644 sound/usb/qcom/mixer_usb_offload.h
 create mode 100644 sound/usb/qcom/qc_audio_offload.c
 create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.c
 create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.h
