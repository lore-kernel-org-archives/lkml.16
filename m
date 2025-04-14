Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1917326AAA1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626212; cv=none; b=uqknBSDtywGkAJdPo01DViKgDA6x28CLBIzRclgoRpPQbinEan28hzVnELUxI+l2ZuW5798G3P2Dw0kGjJsX6Gl2oQclqXtd17FyjqFphe2UW0lmUVHxf+Ja1zLV1Hhwq3XXSXbdGsOTJ0ABD+ZyjFtolX+EmWsHRc/0s/RUIeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626212; c=relaxed/simple;
	bh=rcPLH1vmWffpWzVoFNIxMg0fHBIX6NY/QBIzoPzqw/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=haCqZgH1Vplv450qNZmksm3Ylj4vdEKW8IglW7tVAxca4PFMDhlSoogpx5rpsyAJ+7U0Cvv8XIe9kLDCNyc+osLwf+YyYV7CvU9S7a2bPufpQPi3IqEdEKTnCD+9aA2IK2WNr3mudGJ6TchVDiJPrabCWrT8w845Pgglfu5GyXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfV6nwQP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfV6nwQP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFE3C4CEEB;
	Mon, 14 Apr 2025 10:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626212;
	bh=rcPLH1vmWffpWzVoFNIxMg0fHBIX6NY/QBIzoPzqw/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jfV6nwQPdmQxsw0X6Pq+loFYx84GFLq1ZOc2pV8JcVUSYrdLoMoT/2mCrJxFNeKDc
	 x9WCLx5WSh3UMLxu1nPjLB4QZUEsRbNpogZxbv3eChRCN2aXo5X9JpKR4G8yWL0MuR
	 9qskFJ7Ne83YrMXbe0RBj4s9oJsetPY5qYfaRtHxImYGG+/5o7GgB8UEslXyj1shkr
	 cNNdD/1dBd9Ai1JH3s2gh992ATI9QeJ4XkmhSMvoXGzae1otm4PLwDbYBz4w7whlZe
	 aQdvR5Pt9pGE5QLExbGPRbIFqzOKqm0jOCWaPde5lpsRXy6neOitCGv0950w5Q2JMN
	 W2D/lG4A/HJxA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 10/17] treewide, timers: Rename mod_timer() => timer_mod()
Date: Mon, 14 Apr 2025 12:22:44 +0200
Message-ID: <20250414102301.332225-11-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414102301.332225-1-mingo@kernel.org>
References: <20250414102301.332225-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move this API to the canonical timer_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 .../RCU/Design/Requirements/Requirements.rst       |  2 +-
 Documentation/RCU/rcu_dereference.rst              |  2 +-
 Documentation/core-api/local_ops.rst               |  4 +-
 Documentation/scsi/ChangeLog.lpfc                  |  6 +--
 .../translations/zh_CN/core-api/local_ops.rst      |  4 +-
 arch/alpha/kernel/srmcons.c                        |  4 +-
 arch/arm/mach-pxa/sharpsl_pm.c                     |  6 +--
 arch/mips/sgi-ip22/ip22-reset.c                    |  2 +-
 arch/mips/sgi-ip32/ip32-reset.c                    |  2 +-
 arch/powerpc/kvm/booke.c                           |  2 +-
 arch/powerpc/platforms/cell/spufs/sched.c          |  8 +--
 arch/s390/kernel/lgr.c                             |  2 +-
 arch/s390/kernel/time.c                            |  6 +--
 arch/s390/kernel/topology.c                        |  4 +-
 arch/s390/lib/test_unwind.c                        |  2 +-
 arch/s390/mm/cmm.c                                 |  2 +-
 arch/sh/boards/mach-highlander/psw.c               |  2 +-
 arch/sh/boards/mach-landisk/psw.c                  |  2 +-
 arch/sh/drivers/heartbeat.c                        |  4 +-
 arch/sparc/kernel/viohs.c                          |  2 +-
 arch/um/drivers/vector_kern.c                      |  2 +-
 arch/x86/kernel/apic/vector.c                      |  2 +-
 arch/x86/kernel/cpu/mce/core.c                     |  2 +-
 arch/x86/kvm/xen.c                                 |  2 +-
 arch/xtensa/platforms/iss/console.c                |  4 +-
 arch/xtensa/platforms/iss/network.c                |  4 +-
 arch/xtensa/platforms/xt2000/setup.c               |  4 +-
 block/blk-iolatency.c                              |  2 +-
 block/blk-mq.c                                     |  2 +-
 block/blk-stat.h                                   |  4 +-
 block/blk-throttle.c                               |  2 +-
 block/blk-timeout.c                                |  2 +-
 drivers/accel/qaic/qaic_timesync.c                 |  8 +--
 drivers/accessibility/speakup/main.c               |  4 +-
 drivers/accessibility/speakup/synth.c              |  2 +-
 drivers/ata/libahci.c                              |  4 +-
 drivers/atm/idt77105.c                             |  4 +-
 drivers/atm/idt77252.c                             | 12 ++---
 drivers/atm/iphase.c                               |  2 +-
 drivers/atm/lanai.c                                |  2 +-
 drivers/atm/nicstar.c                              |  2 +-
 drivers/atm/suni.c                                 |  2 +-
 drivers/auxdisplay/line-display.c                  |  2 +-
 drivers/auxdisplay/panel.c                         |  2 +-
 drivers/base/power/main.c                          |  2 +-
 drivers/base/power/wakeup.c                        |  2 +-
 drivers/block/amiflop.c                            |  6 +--
 drivers/block/aoe/aoemain.c                        |  2 +-
 drivers/block/ataflop.c                            | 14 +++---
 drivers/block/drbd/drbd_main.c                     |  2 +-
 drivers/block/drbd/drbd_nl.c                       |  4 +-
 drivers/block/drbd/drbd_receiver.c                 |  2 +-
 drivers/block/drbd/drbd_req.c                      |  2 +-
 drivers/block/drbd/drbd_state.c                    |  4 +-
 drivers/block/drbd/drbd_worker.c                   |  6 +--
 drivers/block/sunvdc.c                             |  2 +-
 drivers/bluetooth/bluecard_cs.c                    |  4 +-
 drivers/bluetooth/btnxpuart.c                      |  2 +-
 drivers/bluetooth/hci_bcsp.c                       |  2 +-
 drivers/bluetooth/hci_h5.c                         |  8 +--
 drivers/bluetooth/hci_qca.c                        |  8 +--
 drivers/bus/mhi/host/pci_generic.c                 | 10 ++--
 drivers/char/dtlk.c                                |  2 +-
 drivers/char/hangcheck-timer.c                     |  4 +-
 drivers/char/ipmi/ipmi_msghandler.c                |  6 +--
 drivers/char/ipmi/ipmi_si_intf.c                   |  2 +-
 drivers/char/ipmi/ipmi_ssif.c                      | 10 ++--
 drivers/char/ipmi/kcs_bmc_aspeed.c                 |  4 +-
 drivers/char/ipmi/ssif_bmc.c                       |  2 +-
 drivers/char/nwbutton.c                            |  2 +-
 drivers/char/tlclk.c                               |  2 +-
 drivers/char/tpm/tpm-dev-common.c                  |  4 +-
 drivers/comedi/drivers/comedi_test.c               |  4 +-
 drivers/comedi/drivers/das16.c                     |  2 +-
 drivers/cpufreq/powernv-cpufreq.c                  |  2 +-
 drivers/crypto/axis/artpec6_crypto.c               |  2 +-
 drivers/dma-buf/st-dma-fence.c                     |  2 +-
 drivers/dma/imx-dma.c                              |  2 +-
 drivers/dma/ioat/dma.c                             | 12 ++---
 drivers/firewire/core-transaction.c                |  2 +-
 drivers/firmware/psci/psci_checker.c               |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |  2 +-
 drivers/gpu/drm/bridge/tda998x_drv.c               |  2 +-
 drivers/gpu/drm/drm_vblank.c                       |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  4 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  4 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |  4 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |  2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |  2 +-
 drivers/gpu/drm/i915/i915_sw_fence.c               |  2 +-
 drivers/gpu/drm/i915/i915_utils.c                  |  2 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |  2 +-
 drivers/gpu/drm/i915/selftests/lib_sw_fence.c      |  2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |  2 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |  2 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |  2 +-
 drivers/gpu/drm/vgem/vgem_fence.c                  |  2 +-
 drivers/hid/hid-apple.c                            |  4 +-
 drivers/hid/hid-appleir.c                          |  4 +-
 drivers/hid/hid-appletb-kbd.c                      |  6 +--
 drivers/hid/hid-letsketch.c                        |  2 +-
 drivers/hid/hid-magicmouse.c                       |  4 +-
 drivers/hid/hid-multitouch.c                       |  2 +-
 drivers/hid/hid-nvidia-shield.c                    |  2 +-
 drivers/hid/hid-prodikeys.c                        |  2 +-
 drivers/hid/hid-sony.c                             |  4 +-
 drivers/hid/hid-uclogic-core.c                     |  2 +-
 drivers/hid/hid-wiimote-core.c                     |  6 +--
 drivers/hid/usbhid/hid-core.c                      |  2 +-
 drivers/hid/wacom_wac.c                            |  2 +-
 drivers/hsi/clients/ssi_protocol.c                 | 14 +++---
 drivers/hte/hte-tegra194-test.c                    |  4 +-
 drivers/hwmon/pwm-fan.c                            |  4 +-
 drivers/i2c/busses/i2c-img-scb.c                   |  6 +--
 drivers/iio/common/ssp_sensors/ssp_dev.c           |  4 +-
 drivers/infiniband/hw/hfi1/aspm.c                  |  2 +-
 drivers/infiniband/hw/hfi1/chip.c                  |  8 +--
 drivers/infiniband/hw/hfi1/driver.c                |  2 +-
 drivers/infiniband/hw/hfi1/mad.c                   |  2 +-
 drivers/infiniband/hw/hfi1/sdma.c                  |  2 +-
 drivers/infiniband/hw/hfi1/tid_rdma.c              |  4 +-
 drivers/infiniband/hw/hfi1/verbs.c                 |  4 +-
 drivers/infiniband/hw/irdma/utils.c                |  4 +-
 drivers/infiniband/hw/mlx5/mr.c                    |  2 +-
 drivers/infiniband/hw/mthca/mthca_catas.c          |  2 +-
 drivers/infiniband/hw/qib/qib_driver.c             |  4 +-
 drivers/infiniband/hw/qib/qib_iba6120.c            |  8 +--
 drivers/infiniband/hw/qib/qib_iba7220.c            |  2 +-
 drivers/infiniband/hw/qib/qib_iba7322.c            |  2 +-
 drivers/infiniband/hw/qib/qib_init.c               |  6 +--
 drivers/infiniband/hw/qib/qib_intr.c               |  2 +-
 drivers/infiniband/hw/qib/qib_mad.c                |  2 +-
 drivers/infiniband/hw/qib/qib_sd7220.c             |  6 +--
 drivers/infiniband/hw/qib/qib_tx.c                 |  6 +--
 drivers/infiniband/hw/qib/qib_verbs.c              |  4 +-
 drivers/infiniband/sw/rxe/rxe_comp.c               |  4 +-
 drivers/infiniband/sw/rxe/rxe_req.c                |  2 +-
 drivers/input/ff-memless.c                         |  2 +-
 drivers/input/gameport/gameport.c                  |  4 +-
 drivers/input/input.c                              |  4 +-
 drivers/input/joystick/db9.c                       |  4 +-
 drivers/input/joystick/gamecon.c                   |  4 +-
 drivers/input/joystick/n64joy.c                    |  4 +-
 drivers/input/joystick/turbografx.c                |  4 +-
 drivers/input/keyboard/imx_keypad.c                |  6 +--
 drivers/input/keyboard/locomokbd.c                 |  2 +-
 drivers/input/keyboard/omap-keypad.c               |  2 +-
 drivers/input/keyboard/snvs_pwrkey.c               |  4 +-
 drivers/input/keyboard/tegra-kbc.c                 |  4 +-
 drivers/input/misc/nxp-bbnsm-pwrkey.c              |  4 +-
 drivers/input/mouse/alps.c                         |  2 +-
 drivers/input/mouse/byd.c                          |  2 +-
 drivers/input/serio/hil_mlc.c                      |  6 +--
 drivers/input/serio/hp_sdc.c                       |  2 +-
 drivers/input/touchscreen/ad7877.c                 |  2 +-
 drivers/input/touchscreen/ad7879.c                 |  2 +-
 drivers/input/touchscreen/bu21029_ts.c             |  2 +-
 drivers/input/touchscreen/exc3000.c                |  2 +-
 drivers/input/touchscreen/sx8654.c                 |  2 +-
 drivers/input/touchscreen/tsc200x-core.c           |  2 +-
 drivers/iommu/dma-iommu.c                          |  2 +-
 drivers/isdn/mISDN/l1oip_core.c                    |  4 +-
 drivers/leds/flash/leds-rt8515.c                   |  2 +-
 drivers/leds/flash/leds-sgm3140.c                  |  2 +-
 drivers/leds/led-core.c                            |  4 +-
 drivers/leds/trigger/ledtrig-activity.c            |  2 +-
 drivers/leds/trigger/ledtrig-heartbeat.c           |  2 +-
 drivers/leds/trigger/ledtrig-pattern.c             |  2 +-
 drivers/leds/trigger/ledtrig-transient.c           |  2 +-
 drivers/macintosh/smu.c                            |  2 +-
 drivers/mailbox/mailbox-altera.c                   |  4 +-
 drivers/md/dm-integrity.c                          |  2 +-
 drivers/md/dm-mpath.c                              |  2 +-
 drivers/md/dm-vdo/dedupe.c                         |  2 +-
 drivers/md/dm-writecache.c                         |  6 +--
 drivers/md/md.c                                    |  4 +-
 drivers/media/common/saa7146/saa7146_vbi.c         |  2 +-
 drivers/media/common/saa7146/saa7146_video.c       |  2 +-
 drivers/media/i2c/tc358743.c                       |  2 +-
 drivers/media/i2c/tvaudio.c                        |  4 +-
 drivers/media/pci/bt8xx/bttv-input.c               |  4 +-
 drivers/media/pci/bt8xx/bttv-risc.c                |  2 +-
 drivers/media/pci/cx18/cx18-mailbox.c              |  2 +-
 drivers/media/pci/cx18/cx18-streams.c              |  2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c |  2 +-
 drivers/media/pci/saa7134/saa7134-input.c          |  2 +-
 drivers/media/pci/saa7134/saa7134-ts.c             |  2 +-
 drivers/media/pci/saa7134/saa7134-vbi.c            |  2 +-
 drivers/media/pci/saa7134/saa7134-video.c          |  2 +-
 drivers/media/pci/tw686x/tw686x-audio.c            |  2 +-
 drivers/media/pci/tw686x/tw686x-core.c             |  2 +-
 drivers/media/pci/tw686x/tw686x-video.c            |  2 +-
 drivers/media/rc/ene_ir.c                          |  2 +-
 drivers/media/rc/igorplugusb.c                     |  2 +-
 drivers/media/rc/img-ir/img-ir-hw.c                |  4 +-
 drivers/media/rc/img-ir/img-ir-raw.c               |  2 +-
 drivers/media/rc/imon.c                            |  2 +-
 drivers/media/rc/ir-mce_kbd-decoder.c              |  2 +-
 drivers/media/rc/rc-ir-raw.c                       |  4 +-
 drivers/media/rc/rc-main.c                         |  8 +--
 drivers/media/rc/serial_ir.c                       |  2 +-
 drivers/media/usb/au0828/au0828-dvb.c              |  2 +-
 drivers/media/usb/au0828/au0828-video.c            | 16 +++---
 drivers/media/usb/s2255/s2255drv.c                 |  2 +-
 drivers/memory/tegra/tegra210-emc-core.c           |  8 +--
 drivers/memstick/core/ms_block.c                   |  2 +-
 drivers/memstick/host/jmb38x_ms.c                  |  2 +-
 drivers/memstick/host/r592.c                       |  2 +-
 drivers/memstick/host/tifm_ms.c                    |  2 +-
 drivers/misc/bcm-vk/bcm_vk_tty.c                   |  4 +-
 drivers/mmc/core/host.c                            |  2 +-
 drivers/mmc/host/atmel-mci.c                       |  6 +--
 drivers/mmc/host/dw_mmc.c                          |  6 +--
 drivers/mmc/host/jz4740_mmc.c                      |  4 +-
 drivers/mmc/host/meson-mx-sdio.c                   |  2 +-
 drivers/mmc/host/mvsdio.c                          |  2 +-
 drivers/mmc/host/mxcmmc.c                          |  2 +-
 drivers/mmc/host/omap.c                            |  6 +--
 drivers/mmc/host/sdhci.c                           |  4 +-
 drivers/mmc/host/tifm_sd.c                         |  2 +-
 drivers/mmc/host/via-sdmmc.c                       |  2 +-
 drivers/mmc/host/vub300.c                          | 12 ++---
 drivers/mmc/host/wbsd.c                            |  2 +-
 drivers/most/most_usb.c                            |  2 +-
 drivers/mtd/sm_ftl.c                               |  2 +-
 drivers/net/arcnet/arcnet.c                        |  4 +-
 drivers/net/can/grcan.c                            |  2 +-
 drivers/net/can/kvaser_pciefd.c                    |  6 +--
 drivers/net/can/sja1000/peak_pcmcia.c              |  4 +-
 drivers/net/can/usb/peak_usb/pcan_usb.c            |  2 +-
 drivers/net/dsa/mv88e6xxx/phy.c                    |  2 +-
 drivers/net/dsa/sja1105/sja1105_ptp.c              |  2 +-
 drivers/net/ethernet/3com/3c515.c                  |  2 +-
 drivers/net/ethernet/3com/3c589_cs.c               |  2 +-
 drivers/net/ethernet/3com/3c59x.c                  |  8 +--
 drivers/net/ethernet/8390/axnet_cs.c               |  2 +-
 drivers/net/ethernet/8390/pcnet_cs.c               |  2 +-
 drivers/net/ethernet/agere/et131x.c                |  2 +-
 drivers/net/ethernet/amazon/ena/ena_netdev.c       |  6 +--
 drivers/net/ethernet/amd/a2065.c                   |  2 +-
 drivers/net/ethernet/amd/amd8111e.c                |  4 +-
 drivers/net/ethernet/amd/declance.c                |  2 +-
 drivers/net/ethernet/amd/pcnet32.c                 |  4 +-
 drivers/net/ethernet/amd/pds_core/main.c           |  6 +--
 drivers/net/ethernet/amd/sunlance.c                |  2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-dev.c           |  2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c           |  6 +--
 drivers/net/ethernet/aquantia/atlantic/aq_nic.c    |  6 +--
 drivers/net/ethernet/atheros/ag71xx.c              |  2 +-
 drivers/net/ethernet/atheros/atlx/atl1.c           |  2 +-
 drivers/net/ethernet/atheros/atlx/atl2.c           |  6 +--
 drivers/net/ethernet/broadcom/b44.c                |  4 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.c       |  2 +-
 drivers/net/ethernet/broadcom/bnx2.c               |  8 +--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c    |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c   |  2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |  4 +-
 drivers/net/ethernet/brocade/bna/bfa_ioc.c         | 20 ++++----
 drivers/net/ethernet/brocade/bna/bnad.c            | 10 ++--
 drivers/net/ethernet/chelsio/cxgb/sge.c            | 10 ++--
 drivers/net/ethernet/chelsio/cxgb3/sge.c           |  8 +--
 .../net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c   |  4 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c           |  8 +--
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c         |  8 +--
 drivers/net/ethernet/cisco/enic/enic_clsf.c        |  2 +-
 drivers/net/ethernet/cisco/enic/enic_clsf.h        |  2 +-
 drivers/net/ethernet/cisco/enic/enic_main.c        |  4 +-
 drivers/net/ethernet/dec/tulip/21142.c             |  4 +-
 drivers/net/ethernet/dec/tulip/de2104x.c           |  8 +--
 drivers/net/ethernet/dec/tulip/interrupt.c         |  6 +--
 drivers/net/ethernet/dec/tulip/pnic.c              |  2 +-
 drivers/net/ethernet/dec/tulip/pnic2.c             |  2 +-
 drivers/net/ethernet/dec/tulip/timer.c             | 10 ++--
 drivers/net/ethernet/dec/tulip/winbond-840.c       |  2 +-
 drivers/net/ethernet/google/gve/gve_ethtool.c      |  2 +-
 drivers/net/ethernet/google/gve/gve_main.c         |  4 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c      |  4 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |  4 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |  2 +-
 drivers/net/ethernet/intel/e100.c                  |  6 +--
 drivers/net/ethernet/intel/e1000e/netdev.c         | 12 ++---
 drivers/net/ethernet/intel/fm10k/fm10k_pci.c       |  6 +--
 drivers/net/ethernet/intel/i40e/i40e_main.c        |  8 +--
 drivers/net/ethernet/intel/ice/ice_main.c          | 12 ++---
 drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c |  2 +-
 drivers/net/ethernet/intel/igb/igb_main.c          | 14 +++---
 drivers/net/ethernet/intel/igbvf/netdev.c          |  8 +--
 drivers/net/ethernet/intel/igc/igc_main.c          | 14 +++---
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c      |  4 +-
 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c  |  4 +-
 drivers/net/ethernet/korina.c                      |  4 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c         |  4 +-
 drivers/net/ethernet/marvell/skge.c                |  6 +--
 drivers/net/ethernet/marvell/sky2.c                |  4 +-
 drivers/net/ethernet/mellanox/mlx4/catas.c         |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/health.c   |  2 +-
 drivers/net/ethernet/myricom/myri10ge/myri10ge.c   |  2 +-
 drivers/net/ethernet/natsemi/natsemi.c             |  8 +--
 drivers/net/ethernet/natsemi/ns83820.c             |  4 +-
 drivers/net/ethernet/neterion/s2io.c               |  4 +-
 .../net/ethernet/netronome/nfp/nfp_net_common.c    |  2 +-
 drivers/net/ethernet/nvidia/forcedeth.c            | 28 +++++------
 .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   |  4 +-
 drivers/net/ethernet/pasemi/pasemi_mac.c           |  6 +--
 .../net/ethernet/pensando/ionic/ionic_bus_pci.c    |  4 +-
 drivers/net/ethernet/pensando/ionic/ionic_dev.c    |  2 +-
 drivers/net/ethernet/pensando/ionic/ionic_lif.c    |  2 +-
 drivers/net/ethernet/qlogic/qla3xxx.c              |  6 +--
 drivers/net/ethernet/realtek/atp.c                 |  2 +-
 drivers/net/ethernet/rocker/rocker_ofdpa.c         |  6 +--
 drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c    |  6 +--
 drivers/net/ethernet/sfc/falcon/efx.c              |  2 +-
 drivers/net/ethernet/sfc/falcon/falcon.c           |  2 +-
 drivers/net/ethernet/sfc/mcdi.c                    |  4 +-
 drivers/net/ethernet/sfc/rx_common.c               |  2 +-
 drivers/net/ethernet/sfc/siena/mcdi.c              |  4 +-
 drivers/net/ethernet/sfc/siena/rx_common.c         |  2 +-
 drivers/net/ethernet/sis/sis190.c                  |  4 +-
 drivers/net/ethernet/smsc/smc91c92_cs.c            |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c   |  4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  2 +-
 drivers/net/ethernet/sun/cassini.c                 | 10 ++--
 drivers/net/ethernet/sun/sungem.c                  |  6 +--
 drivers/net/ethernet/sun/sunvnet_common.c          |  6 +--
 drivers/net/ethernet/synopsys/dwc-xlgmac-hw.c      |  2 +-
 drivers/net/ethernet/ti/tlan.c                     |  2 +-
 drivers/net/ethernet/tundra/tsi108_eth.c           |  4 +-
 drivers/net/hamradio/6pack.c                       |  8 +--
 drivers/net/ntb_netdev.c                           |  4 +-
 drivers/net/phy/phylink.c                          |  6 +--
 drivers/net/slip/slip.c                            | 12 ++---
 drivers/net/tun.c                                  |  6 +--
 drivers/net/usb/catc.c                             |  4 +-
 drivers/net/usb/lan78xx.c                          |  8 +--
 drivers/net/usb/usbnet.c                           |  4 +-
 drivers/net/vxlan/vxlan_core.c                     |  6 +--
 drivers/net/wan/hdlc_ppp.c                         |  6 +--
 drivers/net/wireguard/timers.c                     |  2 +-
 drivers/net/wireless/ath/ar5523/ar5523.c           |  4 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c           |  4 +-
 drivers/net/wireless/ath/ath10k/pci.c              |  4 +-
 drivers/net/wireless/ath/ath10k/sdio.c             |  2 +-
 drivers/net/wireless/ath/ath10k/snoc.c             |  2 +-
 drivers/net/wireless/ath/ath11k/ce.c               |  4 +-
 drivers/net/wireless/ath/ath11k/dp.c               |  4 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c            |  6 +--
 drivers/net/wireless/ath/ath11k/dp_tx.c            |  2 +-
 drivers/net/wireless/ath/ath11k/mac.c              |  2 +-
 drivers/net/wireless/ath/ath12k/ce.c               |  4 +-
 drivers/net/wireless/ath/ath12k/dp.c               |  2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |  2 +-
 drivers/net/wireless/ath/ath6kl/cfg80211.c         |  2 +-
 drivers/net/wireless/ath/ath6kl/recovery.c         |  8 +--
 drivers/net/wireless/ath/ath6kl/txrx.c             |  4 +-
 drivers/net/wireless/ath/ath6kl/wmi.c              |  2 +-
 drivers/net/wireless/ath/ath9k/channel.c           |  8 +--
 drivers/net/wireless/ath/ath9k/gpio.c              |  6 +--
 drivers/net/wireless/ath/ath9k/htc_drv_main.c      |  6 +--
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c      |  2 +-
 drivers/net/wireless/ath/ath9k/link.c              |  4 +-
 drivers/net/wireless/ath/ath9k/main.c              |  2 +-
 drivers/net/wireless/ath/wcn36xx/dxe.c             |  2 +-
 drivers/net/wireless/ath/wil6210/cfg80211.c        |  6 +--
 drivers/net/wireless/ath/wil6210/p2p.c             |  4 +-
 drivers/net/wireless/atmel/at76c50x-usb.c          |  4 +-
 .../wireless/broadcom/brcm80211/brcmfmac/btcoex.c  |  6 +--
 .../broadcom/brcm80211/brcmfmac/cfg80211.c         |  2 +-
 .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    |  4 +-
 .../wireless/broadcom/brcm80211/brcmfmac/sdio.c    |  4 +-
 drivers/net/wireless/intel/iwlegacy/3945-rs.c      |  4 +-
 drivers/net/wireless/intel/iwlegacy/4965-mac.c     |  2 +-
 drivers/net/wireless/intel/iwlegacy/common.c       |  4 +-
 drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c   |  2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/main.c      |  4 +-
 drivers/net/wireless/intel/iwlwifi/dvm/rx.c        |  2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/tt.c        |  6 +--
 drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c   |  4 +-
 drivers/net/wireless/intel/iwlwifi/mld/agg.c       |  4 +-
 drivers/net/wireless/intel/iwlwifi/mvm/sta.c       |  4 +-
 drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c  |  4 +-
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c       |  8 +--
 drivers/net/wireless/marvell/libertas/cmd.c        |  2 +-
 drivers/net/wireless/marvell/libertas/if_usb.c     |  2 +-
 drivers/net/wireless/marvell/libertas/main.c       |  2 +-
 drivers/net/wireless/marvell/libertas_tf/cmd.c     |  2 +-
 drivers/net/wireless/marvell/libertas_tf/if_usb.c  |  2 +-
 .../net/wireless/marvell/mwifiex/11n_rxreorder.c   |  2 +-
 drivers/net/wireless/marvell/mwifiex/cmdevt.c      |  2 +-
 drivers/net/wireless/marvell/mwifiex/main.c        |  2 +-
 drivers/net/wireless/marvell/mwifiex/tdls.c        |  4 +-
 drivers/net/wireless/marvell/mwifiex/usb.c         |  6 +--
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c    |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/main.c   |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c    |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c    |  2 +-
 drivers/net/wireless/microchip/wilc1000/cfg80211.c |  2 +-
 drivers/net/wireless/microchip/wilc1000/hif.c      |  8 +--
 drivers/net/wireless/purelifi/plfxlc/usb.c         |  4 +-
 drivers/net/wireless/realtek/rtlwifi/base.c        |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/dm.c    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/hw.c    |  6 +--
 .../net/wireless/realtek/rtlwifi/rtl8192ee/hw.c    |  6 +--
 .../net/wireless/realtek/rtlwifi/rtl8723be/hw.c    |  6 +--
 .../net/wireless/realtek/rtlwifi/rtl8821ae/hw.c    |  6 +--
 drivers/net/wireless/realtek/rtw88/tx.c            |  2 +-
 drivers/net/wireless/st/cw1200/pm.c                |  2 +-
 drivers/net/wireless/st/cw1200/queue.c             |  4 +-
 drivers/net/wireless/st/cw1200/sta.c               |  2 +-
 drivers/net/wireless/ti/wlcore/main.c              |  2 +-
 drivers/net/wireless/ti/wlcore/tx.c                |  2 +-
 drivers/net/xen-netback/netback.c                  |  2 +-
 drivers/net/xen-netfront.c                         |  2 +-
 drivers/nfc/nfcmrvl/fw_dnld.c                      |  2 +-
 drivers/nfc/pn533/pn533.c                          |  4 +-
 drivers/nfc/pn533/uart.c                           |  2 +-
 drivers/nfc/st-nci/ndlc.c                          |  8 +--
 drivers/nfc/st-nci/se.c                            |  8 +--
 drivers/nfc/st21nfca/core.c                        |  2 +-
 drivers/nfc/st21nfca/se.c                          |  6 +--
 drivers/nvme/host/multipath.c                      |  2 +-
 drivers/parport/ieee1284.c                         |  2 +-
 drivers/pcmcia/bcm63xx_pcmcia.c                    |  4 +-
 drivers/pcmcia/electra_cf.c                        |  2 +-
 drivers/pcmcia/omap_cf.c                           |  4 +-
 drivers/pcmcia/pd6729.c                            |  4 +-
 drivers/pcmcia/soc_common.c                        |  2 +-
 drivers/pcmcia/yenta_socket.c                      |  2 +-
 drivers/platform/mellanox/mlxbf-tmfifo.c           |  4 +-
 drivers/platform/x86/intel_ips.c                   |  2 +-
 drivers/platform/x86/sony-laptop.c                 |  4 +-
 drivers/pps/clients/pps-ktimer.c                   |  4 +-
 drivers/pps/generators/pps_gen-dummy.c             |  2 +-
 drivers/ptp/ptp_ocp.c                              |  4 +-
 drivers/s390/block/dasd.c                          |  4 +-
 drivers/s390/char/con3270.c                        |  2 +-
 drivers/s390/char/sclp.c                           |  4 +-
 drivers/s390/char/sclp_con.c                       |  2 +-
 drivers/s390/char/sclp_tty.c                       |  2 +-
 drivers/s390/char/tape_std.c                       |  2 +-
 drivers/s390/cio/device.c                          |  4 +-
 drivers/s390/cio/device_fsm.c                      |  2 +-
 drivers/s390/cio/eadm_sch.c                        |  2 +-
 drivers/s390/crypto/ap_bus.c                       |  4 +-
 drivers/s390/crypto/ap_queue.c                     |  4 +-
 drivers/scsi/arcmsr/arcmsr_hba.c                   | 10 ++--
 drivers/scsi/arm/fas216.c                          |  4 +-
 drivers/scsi/be2iscsi/be_main.c                    |  6 +--
 drivers/scsi/bfa/bfad.c                            |  4 +-
 drivers/scsi/bnx2fc/bnx2fc_tgt.c                   |  4 +-
 drivers/scsi/csiostor/csio_hw.c                    |  2 +-
 drivers/scsi/csiostor/csio_mb.c                    |  2 +-
 drivers/scsi/cxgbi/cxgb3i/cxgb3i.c                 |  2 +-
 drivers/scsi/cxgbi/cxgb4i/cxgb4i.c                 |  2 +-
 drivers/scsi/elx/efct/efct_xport.c                 |  2 +-
 drivers/scsi/elx/libefc/efc_els.c                  |  2 +-
 drivers/scsi/elx/libefc/efc_fabric.c               |  2 +-
 drivers/scsi/fcoe/fcoe_ctlr.c                      | 12 ++---
 drivers/scsi/fcoe/fcoe_transport.c                 |  2 +-
 drivers/scsi/fnic/fdls_disc.c                      | 10 ++--
 drivers/scsi/fnic/fip.c                            | 22 ++++----
 drivers/scsi/fnic/fnic_main.c                      |  4 +-
 drivers/scsi/hisi_sas/hisi_sas_v1_hw.c             |  2 +-
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c             |  6 +--
 drivers/scsi/ibmvscsi/ibmvfc.c                     |  2 +-
 drivers/scsi/isci/isci.h                           |  2 +-
 drivers/scsi/libfc/fc_fcp.c                        |  2 +-
 drivers/scsi/libiscsi.c                            |  6 +--
 drivers/scsi/lpfc/lpfc_els.c                       | 14 +++---
 drivers/scsi/lpfc/lpfc_hbadisc.c                   |  2 +-
 drivers/scsi/lpfc/lpfc_init.c                      | 18 +++----
 drivers/scsi/lpfc/lpfc_nportdisc.c                 | 14 +++---
 drivers/scsi/lpfc/lpfc_scsi.c                      |  2 +-
 drivers/scsi/lpfc/lpfc_sli.c                       | 20 ++++----
 drivers/scsi/lpfc/lpfc_vmid.c                      |  2 +-
 drivers/scsi/megaraid/megaraid_sas_base.c          |  2 +-
 drivers/scsi/qla1280.c                             |  2 +-
 drivers/scsi/qla2xxx/qla_os.c                      |  2 +-
 drivers/scsi/qla4xxx/ql4_os.c                      |  4 +-
 drivers/scsi/smartpqi/smartpqi_init.c              |  2 +-
 .../staging/gpib/agilent_82357a/agilent_82357a.c   |  4 +-
 drivers/staging/gpib/common/gpib_os.c              |  6 +--
 drivers/staging/gpib/common/iblib.c                |  2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c          |  4 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c        |  4 +-
 drivers/staging/media/imx/imx-media-csi.c          |  4 +-
 .../rtl8723bs/include/osdep_service_linux.h        |  2 +-
 drivers/target/iscsi/iscsi_target_erl0.c           |  2 +-
 drivers/target/iscsi/iscsi_target_erl1.c           |  4 +-
 drivers/target/iscsi/iscsi_target_util.c           |  8 +--
 drivers/target/target_core_user.c                  |  4 +-
 drivers/tty/ipwireless/hardware.c                  |  2 +-
 drivers/tty/mips_ejtag_fdc.c                       |  2 +-
 drivers/tty/moxa.c                                 |  4 +-
 drivers/tty/n_gsm.c                                | 24 ++++-----
 drivers/tty/serial/8250/8250_aspeed_vuart.c        |  4 +-
 drivers/tty/serial/8250/8250_core.c                |  8 +--
 drivers/tty/serial/altera_uart.c                   |  4 +-
 drivers/tty/serial/amba-pl011.c                    |  6 +--
 drivers/tty/serial/atmel_serial.c                  |  6 +--
 drivers/tty/serial/fsl_lpuart.c                    |  4 +-
 drivers/tty/serial/imx.c                           |  4 +-
 drivers/tty/serial/liteuart.c                      |  4 +-
 drivers/tty/serial/max3100.c                       |  4 +-
 drivers/tty/serial/mux.c                           |  4 +-
 drivers/tty/serial/sa1100.c                        |  4 +-
 drivers/tty/serial/sccnxp.c                        |  4 +-
 drivers/tty/serial/sh-sci.c                        |  2 +-
 drivers/tty/synclink_gt.c                          |  4 +-
 drivers/tty/sysrq.c                                |  2 +-
 drivers/tty/vt/keyboard.c                          |  2 +-
 drivers/tty/vt/vt.c                                |  8 +--
 drivers/usb/atm/cxacru.c                           |  2 +-
 drivers/usb/atm/speedtch.c                         |  8 +--
 drivers/usb/atm/usbatm.c                           |  4 +-
 drivers/usb/core/hcd.c                             |  8 +--
 drivers/usb/core/hub.c                             |  2 +-
 drivers/usb/dwc2/core_intr.c                       |  2 +-
 drivers/usb/dwc2/hcd.c                             |  4 +-
 drivers/usb/dwc2/hcd_queue.c                       |  2 +-
 drivers/usb/fotg210/fotg210-hcd.c                  |  4 +-
 drivers/usb/gadget/legacy/zero.c                   |  2 +-
 drivers/usb/gadget/udc/at91_udc.c                  |  4 +-
 drivers/usb/gadget/udc/dummy_hcd.c                 |  2 +-
 drivers/usb/gadget/udc/m66592-udc.c                |  8 +--
 drivers/usb/gadget/udc/omap_udc.c                  |  4 +-
 drivers/usb/gadget/udc/pxa25x_udc.h                |  2 +-
 drivers/usb/gadget/udc/r8a66597-udc.c              |  8 +--
 drivers/usb/gadget/udc/snps_udc_core.c             | 12 ++---
 drivers/usb/host/ehci-hcd.c                        |  2 +-
 drivers/usb/host/ehci-hub.c                        |  4 +-
 drivers/usb/host/ehci-platform.c                   |  4 +-
 drivers/usb/host/isp116x-hcd.c                     |  2 +-
 drivers/usb/host/ohci-hcd.c                        |  4 +-
 drivers/usb/host/oxu210hp-hcd.c                    |  6 +--
 drivers/usb/host/r8a66597-hcd.c                    |  8 +--
 drivers/usb/host/sl811-hcd.c                       |  4 +-
 drivers/usb/host/uhci-hcd.c                        |  4 +-
 drivers/usb/host/uhci-hub.c                        |  2 +-
 drivers/usb/host/uhci-q.c                          |  4 +-
 drivers/usb/host/xen-hcd.c                         |  2 +-
 drivers/usb/host/xhci-hub.c                        |  2 +-
 drivers/usb/host/xhci-ring.c                       |  2 +-
 drivers/usb/host/xhci.c                            |  2 +-
 drivers/usb/isp1760/isp1760-hcd.c                  |  2 +-
 drivers/usb/isp1760/isp1760-udc.c                  |  4 +-
 drivers/usb/misc/usbtest.c                         |  2 +-
 drivers/usb/musb/da8xx.c                           | 10 ++--
 drivers/usb/musb/mpfs.c                            | 10 ++--
 drivers/usb/musb/musb_core.c                       |  4 +-
 drivers/usb/musb/musb_dsps.c                       |  2 +-
 drivers/usb/musb/musb_virthub.c                    |  2 +-
 drivers/usb/musb/tusb6010.c                        |  2 +-
 drivers/usb/serial/garmin_gps.c                    |  2 +-
 drivers/usb/serial/mos7840.c                       |  4 +-
 drivers/usb/storage/realtek_cr.c                   |  2 +-
 drivers/usb/usbip/vudc_transfer.c                  |  4 +-
 drivers/video/fbdev/aty/radeon_backlight.c         |  4 +-
 drivers/video/fbdev/aty/radeon_base.c              |  4 +-
 drivers/video/fbdev/omap/hwa742.c                  |  2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c         |  2 +-
 drivers/video/fbdev/pxa3xx-gcu.c                   |  2 +-
 drivers/virt/vboxguest/vboxguest_core.c            |  4 +-
 drivers/watchdog/alim7101_wdt.c                    |  4 +-
 drivers/watchdog/at91sam9_wdt.c                    |  4 +-
 drivers/watchdog/bcm47xx_wdt.c                     |  2 +-
 drivers/watchdog/lpc18xx_wdt.c                     |  2 +-
 drivers/watchdog/machzwd.c                         |  4 +-
 drivers/watchdog/mixcomwd.c                        |  4 +-
 drivers/watchdog/mtx-1_wdt.c                       |  4 +-
 drivers/watchdog/pcwd.c                            |  4 +-
 drivers/watchdog/pika_wdt.c                        |  4 +-
 drivers/watchdog/rdc321x_wdt.c                     |  4 +-
 drivers/watchdog/sbc60xxwdt.c                      |  4 +-
 drivers/watchdog/sc520_wdt.c                       |  4 +-
 drivers/watchdog/shwdt.c                           |  4 +-
 drivers/watchdog/via_wdt.c                         |  6 +--
 drivers/watchdog/w83877f_wdt.c                     |  4 +-
 fs/afs/server.c                                    |  2 +-
 fs/bcachefs/clock.c                                |  2 +-
 fs/btrfs/zstd.c                                    |  4 +-
 fs/dlm/lock.c                                      |  4 +-
 fs/ext4/super.c                                    |  6 +--
 fs/lockd/svclock.c                                 |  2 +-
 fs/ocfs2/cluster/tcp.c                             |  2 +-
 fs/pstore/platform.c                               |  2 +-
 include/linux/timer.h                              |  4 +-
 include/net/cfg80211.h                             |  4 +-
 include/rdma/rdmavt_qp.h                           |  2 +-
 kernel/events/uprobes.c                            |  2 +-
 kernel/irq/spurious.c                              |  4 +-
 kernel/kcsan/kcsan_test.c                          |  2 +-
 kernel/rcu/rcutorture.c                            |  2 +-
 kernel/rcu/tasks.h                                 |  4 +-
 kernel/rcu/tree_nocb.h                             |  6 +--
 kernel/sched/psi.c                                 |  2 +-
 kernel/time/timer.c                                | 16 +++---
 kernel/workqueue.c                                 | 14 +++---
 lib/test_ref_tracker.c                             |  2 +-
 mm/page-writeback.c                                |  6 +--
 net/802/garp.c                                     |  2 +-
 net/802/mrp.c                                      |  4 +-
 net/appletalk/aarp.c                               |  8 +--
 net/atm/clip.c                                     |  4 +-
 net/atm/lec.c                                      |  2 +-
 net/ax25/ax25_ds_timer.c                           |  2 +-
 net/ax25/ax25_timer.c                              | 10 ++--
 net/batman-adv/tp_meter.c                          |  4 +-
 net/bluetooth/hidp/core.c                          |  2 +-
 net/bluetooth/rfcomm/core.c                        |  4 +-
 net/bridge/br_mdb.c                                | 14 +++---
 net/bridge/br_multicast.c                          | 58 +++++++++++-----------
 net/bridge/br_multicast_eht.c                      |  6 +--
 net/bridge/br_stp.c                                | 16 +++---
 net/bridge/br_stp_if.c                             |  4 +-
 net/bridge/br_stp_timer.c                          |  6 +--
 net/can/af_can.c                                   |  2 +-
 net/can/proc.c                                     |  2 +-
 net/core/drop_monitor.c                            |  4 +-
 net/core/gen_estimator.c                           |  4 +-
 net/core/neighbour.c                               |  8 +--
 net/core/sock.c                                    |  2 +-
 net/hsr/hsr_device.c                               | 12 ++---
 net/hsr/hsr_framereg.c                             |  4 +-
 net/ipv4/igmp.c                                    |  6 +--
 net/ipv4/inet_connection_sock.c                    |  4 +-
 net/ipv4/inet_fragment.c                           |  2 +-
 net/ipv4/inet_timewait_sock.c                      |  4 +-
 net/ipv4/ip_fragment.c                             |  2 +-
 net/ipv4/ipmr.c                                    |  6 +--
 net/ipv4/tcp.c                                     |  4 +-
 net/ipv6/addrconf.c                                |  2 +-
 net/ipv6/ip6_fib.c                                 |  8 +--
 net/ipv6/ip6_flowlabel.c                           |  4 +-
 net/ipv6/ip6mr.c                                   |  4 +-
 net/llc/llc_c_ac.c                                 | 12 ++---
 net/mac80211/agg-rx.c                              |  4 +-
 net/mac80211/agg-tx.c                              |  6 +--
 net/mac80211/ibss.c                                |  6 +--
 net/mac80211/led.c                                 |  4 +-
 net/mac80211/mesh.c                                |  4 +-
 net/mac80211/mesh_hwmp.c                           |  4 +-
 net/mac80211/mesh_plink.c                          |  4 +-
 net/mac80211/mlme.c                                | 18 +++----
 net/mac80211/ocb.c                                 |  2 +-
 net/mac80211/offchannel.c                          |  2 +-
 net/mac80211/rx.c                                  |  6 +--
 net/mac80211/sta_info.c                            |  2 +-
 net/mac80211/status.c                              |  4 +-
 net/mac80211/tx.c                                  |  4 +-
 net/mac80211/util.c                                |  2 +-
 net/mctp/af_mctp.c                                 |  2 +-
 net/ncsi/ncsi-cmd.c                                |  2 +-
 net/ncsi/ncsi-manage.c                             |  4 +-
 net/netfilter/ipset/ip_set_bitmap_gen.h            |  2 +-
 net/netfilter/ipset/ip_set_list_set.c              |  2 +-
 net/netfilter/ipvs/ip_vs_conn.c                    |  2 +-
 net/netfilter/ipvs/ip_vs_ctl.c                     |  4 +-
 net/netfilter/ipvs/ip_vs_lblc.c                    |  4 +-
 net/netfilter/ipvs/ip_vs_lblcr.c                   |  4 +-
 net/netfilter/xt_IDLETIMER.c                       | 12 ++---
 net/netfilter/xt_LED.c                             |  2 +-
 net/netrom/nr_loopback.c                           |  4 +-
 net/nfc/core.c                                     |  6 +--
 net/nfc/hci/core.c                                 |  2 +-
 net/nfc/hci/llc_shdlc.c                            |  8 +--
 net/nfc/llcp_commands.c                            |  2 +-
 net/nfc/llcp_core.c                                |  6 +--
 net/nfc/nci/core.c                                 |  4 +-
 net/packet/af_packet.c                             |  2 +-
 net/rose/rose_loopback.c                           |  4 +-
 net/sched/cls_flow.c                               |  4 +-
 net/sched/sch_fq_pie.c                             |  4 +-
 net/sched/sch_generic.c                            |  4 +-
 net/sched/sch_pie.c                                |  4 +-
 net/sched/sch_red.c                                |  4 +-
 net/sched/sch_sfq.c                                |  4 +-
 net/sctp/associola.c                               |  2 +-
 net/sctp/input.c                                   |  2 +-
 net/sctp/output.c                                  |  2 +-
 net/sctp/outqueue.c                                |  2 +-
 net/sctp/protocol.c                                |  4 +-
 net/sctp/sm_sideeffect.c                           | 16 +++---
 net/sctp/transport.c                               | 12 ++---
 net/sunrpc/svc_xprt.c                              |  6 +--
 net/sunrpc/xprt.c                                  |  4 +-
 net/tipc/discover.c                                | 10 ++--
 net/tipc/monitor.c                                 |  4 +-
 net/tipc/node.c                                    |  6 +--
 net/tipc/subscr.c                                  |  2 +-
 net/wireless/core.c                                |  2 +-
 net/x25/x25_link.c                                 |  2 +-
 net/x25/x25_timer.c                                | 10 ++--
 net/xfrm/xfrm_policy.c                             | 10 ++--
 net/xfrm/xfrm_replay.c                             |  6 +--
 net/xfrm/xfrm_state.c                              |  2 +-
 samples/connector/cn_test.c                        |  4 +-
 samples/ftrace/sample-trace-array.c                |  2 +-
 security/keys/gc.c                                 |  2 +-
 sound/core/timer.c                                 |  2 +-
 sound/drivers/aloop.c                              |  2 +-
 sound/drivers/dummy.c                              |  2 +-
 sound/drivers/mpu401/mpu401_uart.c                 |  4 +-
 sound/drivers/mtpav.c                              |  4 +-
 sound/drivers/opl3/opl3_midi.c                     |  4 +-
 sound/drivers/pcmtest.c                            |  4 +-
 sound/drivers/serial-u16550.c                      |  2 +-
 sound/i2c/other/ak4117.c                           |  4 +-
 sound/isa/sb/emu8000_pcm.c                         |  4 +-
 sound/isa/sb/sb8_midi.c                            |  4 +-
 sound/isa/wavefront/wavefront_midi.c               |  4 +-
 sound/pci/asihpi/asihpi.c                          |  2 +-
 sound/pci/ctxfi/cttimer.c                          |  4 +-
 sound/pci/echoaudio/midi.c                         |  2 +-
 sound/pci/korg1212/korg1212.c                      |  4 +-
 sound/pci/rme9652/hdsp.c                           |  4 +-
 sound/pci/rme9652/hdspm.c                          |  4 +-
 sound/sh/aica.c                                    |  6 +--
 sound/soc/codecs/rt5645.c                          |  2 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |  2 +-
 sound/soc/ti/ams-delta.c                           |  2 +-
 sound/synth/emux/emux_synth.c                      |  4 +-
 sound/usb/midi.c                                   |  4 +-
 731 files changed, 1506 insertions(+), 1506 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index 6125e7068d2c..0f96e8ad02b6 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -1857,7 +1857,7 @@ The Linux kernel has loadable modules, and these modules can also be
 unloaded. After a given module has been unloaded, any attempt to call
 one of its functions results in a segmentation fault. The module-unload
 functions must therefore cancel any delayed calls to loadable-module
-functions, for example, any outstanding mod_timer() must be dealt
+functions, for example, any outstanding timer_mod() must be dealt
 with via timer_shutdown_sync() or similar.
 
 Unfortunately, there is no way to cancel an RCU callback; once you
diff --git a/Documentation/RCU/rcu_dereference.rst b/Documentation/RCU/rcu_dereference.rst
index 2524dcdadde2..83d716b00236 100644
--- a/Documentation/RCU/rcu_dereference.rst
+++ b/Documentation/RCU/rcu_dereference.rst
@@ -171,7 +171,7 @@ readers working properly:
 		-	During some prior acquisition of the lock that
 			we now hold.
 
-		-	Before mod_timer() time for a timer handler.
+		-	Before timer_mod() time for a timer handler.
 
 		There are many other possibilities involving the Linux
 		kernel's wide array of primitives that cause code to
diff --git a/Documentation/core-api/local_ops.rst b/Documentation/core-api/local_ops.rst
index 0b42ceaaf3c4..1d7792648f47 100644
--- a/Documentation/core-api/local_ops.rst
+++ b/Documentation/core-api/local_ops.rst
@@ -177,14 +177,14 @@ Here is a sample module which implements a basic per cpu counter using
                     printk("Read : CPU %d, count %ld\n", cpu,
                             local_read(&per_cpu(counters, cpu)));
             }
-            mod_timer(&test_timer, jiffies + 1000);
+            timer_mod(&test_timer, jiffies + 1000);
     }
 
     static int __init test_init(void)
     {
             /* initialize the timer that will increment the counter */
             timer_setup(&test_timer, do_test_timer, 0);
-            mod_timer(&test_timer, jiffies + 1);
+            timer_mod(&test_timer, jiffies + 1);
 
             return 0;
     }
diff --git a/Documentation/scsi/ChangeLog.lpfc b/Documentation/scsi/ChangeLog.lpfc
index 801895f3a284..e0d5f5258900 100644
--- a/Documentation/scsi/ChangeLog.lpfc
+++ b/Documentation/scsi/ChangeLog.lpfc
@@ -104,7 +104,7 @@ Changes from 20050215 to 20050223
 	  equivalents instead of dma_set_mask and also modify condition
 	  clause to actually exit on error condition.
 	* Restart els timeout handler only if txcmplq_cnt. On submission,
-	  mod_timer the els_tmofunc.  This prevents the worker thread from
+	  timer_mod the els_tmofunc.  This prevents the worker thread from
 	  waking up the els_tmo handler un-necessarily.  The thread was
 	  being woken up even when there were no pending els commands.
 	* Added new typedefs for abort and reset functions.
@@ -796,7 +796,7 @@ Changes from 20040908 to 20040920
 	* Remove unnecessary lpfc_brd_no.  Ensure brd_no assignment is
 	  unique.
 	* Removed unused MAX_FCP_LUN.
-	* Use mod_timer instead of timer_add for fdmi in lpfc_ct.c.
+	* Use timer_mod instead of timer_add for fdmi in lpfc_ct.c.
 	* Fixed misc discovery problems.
 	* Move stopping timers till just before lpfc_mem_free() call.
 	* Fix up NameServer reglogin error path.
@@ -888,7 +888,7 @@ Changes from 20040810 to 20040823
 
 	* Changed version number to 8.0.10
 	* Additional timer changes as per Arjan / Christoph's comments.
-	* Used mod_timer() instead of del_timer_sync() where appropriate.
+	* Used timer_mod() instead of del_timer_sync() where appropriate.
 	* Fixed a use after free case (panic on 2.6.8.1 with
 	  CONFIG_DEBUG_SLAB set).
 	* Fix compile warning in lpfc_fcp.c.
diff --git a/Documentation/translations/zh_CN/core-api/local_ops.rst b/Documentation/translations/zh_CN/core-api/local_ops.rst
index eb5423f60f17..f8e91b5970d3 100644
--- a/Documentation/translations/zh_CN/core-api/local_ops.rst
+++ b/Documentation/translations/zh_CN/core-api/local_ops.rst
@@ -171,14 +171,14 @@ UP之间没有不同的行为，在你的架构的 ``local.h`` 中包括 ``asm-g
                     printk("Read : CPU %d, count %ld\n", cpu,
                             local_read(&per_cpu(counters, cpu)));
             }
-            mod_timer(&test_timer, jiffies + 1000);
+            timer_mod(&test_timer, jiffies + 1000);
     }
 
     static int __init test_init(void)
     {
             /* initialize the timer that will increment the counter */
             timer_setup(&test_timer, do_test_timer, 0);
-            mod_timer(&test_timer, jiffies + 1);
+            timer_mod(&test_timer, jiffies + 1);
 
             return 0;
     }
diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
index 3ea472b698cd..f28bb2d7943a 100644
--- a/arch/alpha/kernel/srmcons.c
+++ b/arch/alpha/kernel/srmcons.c
@@ -83,7 +83,7 @@ srmcons_receive_chars(struct timer_list *t)
 
 	spin_lock(&port->lock);
 	if (port->tty)
-		mod_timer(&srmconsp->timer, jiffies + incr);
+		timer_mod(&srmconsp->timer, jiffies + incr);
 	spin_unlock(&port->lock);
 
 	local_irq_restore(flags);
@@ -158,7 +158,7 @@ srmcons_open(struct tty_struct *tty, struct file *filp)
 		tty->driver_data = srmconsp;
 		tty->port = port;
 		port->tty = tty; /* XXX proper refcounting */
-		mod_timer(&srmconsp->timer, jiffies + 10);
+		timer_mod(&srmconsp->timer, jiffies + 10);
 	}
 
 	spin_unlock_irqrestore(&port->lock, flags);
diff --git a/arch/arm/mach-pxa/sharpsl_pm.c b/arch/arm/mach-pxa/sharpsl_pm.c
index 71b282b146d0..dce6ef6b69df 100644
--- a/arch/arm/mach-pxa/sharpsl_pm.c
+++ b/arch/arm/mach-pxa/sharpsl_pm.c
@@ -351,7 +351,7 @@ static irqreturn_t sharpsl_ac_isr(int irq, void *dev_id)
 {
 	/* Delay the event slightly to debounce */
 	/* Must be a smaller delay than the chrg_full_isr below */
-	mod_timer(&sharpsl_pm.ac_timer, jiffies + msecs_to_jiffies(250));
+	timer_mod(&sharpsl_pm.ac_timer, jiffies + msecs_to_jiffies(250));
 
 	return IRQ_HANDLED;
 }
@@ -388,7 +388,7 @@ static irqreturn_t sharpsl_chrg_full_isr(int irq, void *dev_id)
 		return IRQ_HANDLED;
 
 	/* delay until after any ac interrupt */
-	mod_timer(&sharpsl_pm.chrg_full_timer, jiffies + msecs_to_jiffies(500));
+	timer_mod(&sharpsl_pm.chrg_full_timer, jiffies + msecs_to_jiffies(500));
 
 	return IRQ_HANDLED;
 }
@@ -883,7 +883,7 @@ static int sharpsl_pm_probe(struct platform_device *pdev)
 	suspend_set_ops(&sharpsl_pm_ops);
 #endif
 
-	mod_timer(&sharpsl_pm.ac_timer, jiffies + msecs_to_jiffies(250));
+	timer_mod(&sharpsl_pm.ac_timer, jiffies + msecs_to_jiffies(250));
 
 	return 0;
 }
diff --git a/arch/mips/sgi-ip22/ip22-reset.c b/arch/mips/sgi-ip22/ip22-reset.c
index 32b0f9f1d877..bd9e0f077f42 100644
--- a/arch/mips/sgi-ip22/ip22-reset.c
+++ b/arch/mips/sgi-ip22/ip22-reset.c
@@ -93,7 +93,7 @@ static void blink_timeout(struct timer_list *unused)
 	sgi_ioc_reset ^= (SGIOC_RESET_LC0OFF|SGIOC_RESET_LC1OFF);
 	sgioc->reset = sgi_ioc_reset;
 
-	mod_timer(&blink_timer, jiffies + blink_timer_timeout);
+	timer_mod(&blink_timer, jiffies + blink_timer_timeout);
 }
 
 static void debounce(struct timer_list *unused)
diff --git a/arch/mips/sgi-ip32/ip32-reset.c b/arch/mips/sgi-ip32/ip32-reset.c
index ef778499ebd3..fd611a85fdb7 100644
--- a/arch/mips/sgi-ip32/ip32-reset.c
+++ b/arch/mips/sgi-ip32/ip32-reset.c
@@ -79,7 +79,7 @@ static void blink_timeout(struct timer_list *unused)
 {
 	unsigned long led = mace->perif.ctrl.misc ^ MACEISA_LED_RED;
 	mace->perif.ctrl.misc = led;
-	mod_timer(&blink_timer, jiffies + blink_timer_timeout);
+	timer_mod(&blink_timer, jiffies + blink_timer_timeout);
 }
 
 static void ip32_machine_halt(void)
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index e56f78b4760a..5322a9dea19d 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -620,7 +620,7 @@ static void arm_next_watchdog(struct kvm_vcpu *vcpu)
 	 * then do not run the watchdog timer as this can break timer APIs.
 	 */
 	if (nr_jiffies < NEXT_TIMER_MAX_DELTA)
-		mod_timer(&vcpu->arch.wdt_timer, jiffies + nr_jiffies);
+		timer_mod(&vcpu->arch.wdt_timer, jiffies + nr_jiffies);
 	else
 		timer_delete(&vcpu->arch.wdt_timer);
 	spin_unlock_irqrestore(&vcpu->arch.wdt_lock, flags);
diff --git a/arch/powerpc/platforms/cell/spufs/sched.c b/arch/powerpc/platforms/cell/spufs/sched.c
index 8e7ed010bfde..9e3232f1e9c1 100644
--- a/arch/powerpc/platforms/cell/spufs/sched.c
+++ b/arch/powerpc/platforms/cell/spufs/sched.c
@@ -491,7 +491,7 @@ static void __spu_add_to_rq(struct spu_context *ctx)
 		list_add_tail(&ctx->rq, &spu_prio->runq[ctx->prio]);
 		set_bit(ctx->prio, spu_prio->bitmap);
 		if (!spu_prio->nr_waiting++)
-			mod_timer(&spusched_timer, jiffies + SPUSCHED_TICK);
+			timer_mod(&spusched_timer, jiffies + SPUSCHED_TICK);
 	}
 }
 
@@ -975,13 +975,13 @@ static void spu_calc_load(void)
 
 static void spusched_wake(struct timer_list *unused)
 {
-	mod_timer(&spusched_timer, jiffies + SPUSCHED_TICK);
+	timer_mod(&spusched_timer, jiffies + SPUSCHED_TICK);
 	wake_up_process(spusched_task);
 }
 
 static void spuloadavg_wake(struct timer_list *unused)
 {
-	mod_timer(&spuloadavg_timer, jiffies + LOAD_FREQ);
+	timer_mod(&spuloadavg_timer, jiffies + LOAD_FREQ);
 	spu_calc_load();
 }
 
@@ -1101,7 +1101,7 @@ int __init spu_sched_init(void)
 		goto out_free_spu_prio;
 	}
 
-	mod_timer(&spuloadavg_timer, 0);
+	timer_mod(&spuloadavg_timer, 0);
 
 	entry = proc_create_single("spu_loadavg", 0, NULL, show_spu_loadavg);
 	if (!entry)
diff --git a/arch/s390/kernel/lgr.c b/arch/s390/kernel/lgr.c
index 6d1ffca5f798..3a26005c306f 100644
--- a/arch/s390/kernel/lgr.c
+++ b/arch/s390/kernel/lgr.c
@@ -166,7 +166,7 @@ static struct timer_list lgr_timer;
  */
 static void lgr_timer_set(void)
 {
-	mod_timer(&lgr_timer, jiffies + secs_to_jiffies(LGR_TIMER_INTERVAL_SECS));
+	timer_mod(&lgr_timer, jiffies + secs_to_jiffies(LGR_TIMER_INTERVAL_SECS));
 }
 
 /*
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index fed17d407a44..945024a20b8b 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -657,12 +657,12 @@ static void stp_check_leap(void)
 		if (ret < 0)
 			pr_err("failed to set leap second flags\n");
 		/* arm Timer to clear leap second flags */
-		mod_timer(&stp_timer, jiffies + secs_to_jiffies(14400));
+		timer_mod(&stp_timer, jiffies + secs_to_jiffies(14400));
 	} else {
 		/* The day the leap second is scheduled for hasn't been reached. Retry
 		 * in one hour.
 		 */
-		mod_timer(&stp_timer, jiffies + secs_to_jiffies(3600));
+		timer_mod(&stp_timer, jiffies + secs_to_jiffies(3600));
 	}
 }
 
@@ -706,7 +706,7 @@ static void stp_work_fn(struct work_struct *work)
 		 * There is a usable clock but the synchronization failed.
 		 * Retry after a second.
 		 */
-		mod_timer(&stp_timer, jiffies + msecs_to_jiffies(MSEC_PER_SEC));
+		timer_mod(&stp_timer, jiffies + msecs_to_jiffies(MSEC_PER_SEC));
 	else if (stp_info.lu)
 		stp_check_leap();
 
diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
index 3df048e190b1..8d78092d599e 100644
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -370,9 +370,9 @@ static atomic_t topology_poll = ATOMIC_INIT(0);
 static void set_topology_timer(void)
 {
 	if (atomic_add_unless(&topology_poll, -1, 0))
-		mod_timer(&topology_timer, jiffies + msecs_to_jiffies(100));
+		timer_mod(&topology_timer, jiffies + msecs_to_jiffies(100));
 	else
-		mod_timer(&topology_timer, jiffies + secs_to_jiffies(60));
+		timer_mod(&topology_timer, jiffies + secs_to_jiffies(60));
 }
 
 void topology_expect_change(void)
diff --git a/arch/s390/lib/test_unwind.c b/arch/s390/lib/test_unwind.c
index 6e42100875e7..5d0fe922d787 100644
--- a/arch/s390/lib/test_unwind.c
+++ b/arch/s390/lib/test_unwind.c
@@ -391,7 +391,7 @@ static int test_unwind_irq(struct unwindme *u)
 	unwindme = u;
 	init_completion(&u->task_ready);
 	timer_setup(&unwind_timer, unwindme_timer_fn, 0);
-	mod_timer(&unwind_timer, jiffies + 1);
+	timer_mod(&unwind_timer, jiffies + 1);
 	wait_for_completion(&u->task_ready);
 	return u->ret;
 }
diff --git a/arch/s390/mm/cmm.c b/arch/s390/mm/cmm.c
index e2a6eb92420f..139ca17dfb77 100644
--- a/arch/s390/mm/cmm.c
+++ b/arch/s390/mm/cmm.c
@@ -204,7 +204,7 @@ static void cmm_set_timer(void)
 			timer_delete(&cmm_timer);
 		return;
 	}
-	mod_timer(&cmm_timer, jiffies + secs_to_jiffies(cmm_timeout_seconds));
+	timer_mod(&cmm_timer, jiffies + secs_to_jiffies(cmm_timeout_seconds));
 }
 
 static void cmm_timer_fn(struct timer_list *unused)
diff --git a/arch/sh/boards/mach-highlander/psw.c b/arch/sh/boards/mach-highlander/psw.c
index d445c54f74e4..754b157360ff 100644
--- a/arch/sh/boards/mach-highlander/psw.c
+++ b/arch/sh/boards/mach-highlander/psw.c
@@ -34,7 +34,7 @@ static irqreturn_t psw_irq_handler(int irq, void *arg)
 	if (mask & (1 << psw_info->bit)) {
 		psw->state = !!(mask & (1 << psw_info->bit));
 		if (psw->state)	/* debounce */
-			mod_timer(&psw->debounce, jiffies + 50);
+			timer_mod(&psw->debounce, jiffies + 50);
 
 		ret = 1;
 	}
diff --git a/arch/sh/boards/mach-landisk/psw.c b/arch/sh/boards/mach-landisk/psw.c
index e171d9af48f3..61e87aadd08f 100644
--- a/arch/sh/boards/mach-landisk/psw.c
+++ b/arch/sh/boards/mach-landisk/psw.c
@@ -33,7 +33,7 @@ static irqreturn_t psw_irq_handler(int irq, void *arg)
 	/* Figure out who raised it */
 	if (sw_value & (1 << psw_info->bit)) {
 		psw->state = 1;
-		mod_timer(&psw->debounce, jiffies + 50);
+		timer_mod(&psw->debounce, jiffies + 50);
 		ret = 1;
 	}
 
diff --git a/arch/sh/drivers/heartbeat.c b/arch/sh/drivers/heartbeat.c
index 42103038a7d0..aab03af72c5a 100644
--- a/arch/sh/drivers/heartbeat.c
+++ b/arch/sh/drivers/heartbeat.c
@@ -67,7 +67,7 @@ static void heartbeat_timer(struct timer_list *t)
 	if ((bit == 0) || (bit == (hd->nr_bits)-1))
 		up = -up;
 
-	mod_timer(&hd->timer, jiffies + (110 - ((300 << FSHIFT) /
+	timer_mod(&hd->timer, jiffies + (110 - ((300 << FSHIFT) /
 			((avenrun[0] / 5) + (3 << FSHIFT)))));
 }
 
@@ -133,7 +133,7 @@ static int heartbeat_drv_probe(struct platform_device *pdev)
 	timer_setup(&hd->timer, heartbeat_timer, 0);
 	platform_set_drvdata(pdev, hd);
 
-	return mod_timer(&hd->timer, jiffies + 1);
+	return timer_mod(&hd->timer, jiffies + 1);
 }
 
 static struct platform_driver heartbeat_driver = {
diff --git a/arch/sparc/kernel/viohs.c b/arch/sparc/kernel/viohs.c
index 8fb2e7ca5015..3db3f1f077f2 100644
--- a/arch/sparc/kernel/viohs.c
+++ b/arch/sparc/kernel/viohs.c
@@ -795,7 +795,7 @@ void vio_port_up(struct vio_driver_state *vio)
 		unsigned long expires = jiffies + HZ;
 
 		expires = round_jiffies(expires);
-		mod_timer(&vio->timer, expires);
+		timer_mod(&vio->timer, expires);
 	}
 
 	spin_unlock_irqrestore(&vio->lock, flags);
diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index abaf9fdb8ab2..d8f36422bddc 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -1063,7 +1063,7 @@ static int vector_net_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	queue_depth = vector_enqueue(vp->tx_queue, skb);
 
 	if (queue_depth < vp->tx_queue->max_depth && netdev_xmit_more()) {
-		mod_timer(&vp->tl, vp->coalesce);
+		timer_mod(&vp->tl, vp->coalesce);
 		return NETDEV_TX_OK;
 	} else {
 		queue_depth = vector_send(vp->tx_queue);
diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
index ad8b79b0d0d9..7d8dce0cb486 100644
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -1070,7 +1070,7 @@ static void __vector_cleanup(struct vector_cleanup *cl, bool check_irr)
 	 * in __vector_schedule_cleanup() race free against the rearm here.
 	 */
 	if (rearm)
-		mod_timer(&cl->timer, jiffies + 1);
+		timer_mod(&cl->timer, jiffies + 1);
 }
 
 static void vector_cleanup_callback(struct timer_list *tmr)
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index f6fd71b64b66..16b4aaccf1bc 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1728,7 +1728,7 @@ static void __start_timer(struct timer_list *t, unsigned long interval)
 	local_irq_save(flags);
 
 	if (!timer_pending(t) || time_before(when, t->expires))
-		mod_timer(t, round_jiffies(when));
+		timer_mod(t, round_jiffies(when));
 
 	local_irq_restore(flags);
 }
diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index a1c9559944a3..e539fc93e657 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -1547,7 +1547,7 @@ static bool kvm_xen_schedop_poll(struct kvm_vcpu *vcpu, bool longmode,
 		kvm_set_mp_state(vcpu, KVM_MP_STATE_HALTED);
 
 		if (sched_poll.timeout)
-			mod_timer(&vcpu->arch.xen.poll_timer,
+			timer_mod(&vcpu->arch.xen.poll_timer,
 				  jiffies + nsecs_to_jiffies(sched_poll.timeout));
 
 		kvm_vcpu_halt(vcpu);
diff --git a/arch/xtensa/platforms/iss/console.c b/arch/xtensa/platforms/iss/console.c
index 8b95221375a8..3dcbe6261049 100644
--- a/arch/xtensa/platforms/iss/console.c
+++ b/arch/xtensa/platforms/iss/console.c
@@ -40,7 +40,7 @@ static DEFINE_TIMER(serial_timer, rs_poll);
 static int rs_open(struct tty_struct *tty, struct file * filp)
 {
 	if (tty->count == 1)
-		mod_timer(&serial_timer, jiffies + SERIAL_TIMER_VALUE);
+		timer_mod(&serial_timer, jiffies + SERIAL_TIMER_VALUE);
 
 	return 0;
 }
@@ -78,7 +78,7 @@ static void rs_poll(struct timer_list *unused)
 	if (i)
 		tty_flip_buffer_push(port);
 	if (rd)
-		mod_timer(&serial_timer, jiffies + SERIAL_TIMER_VALUE);
+		timer_mod(&serial_timer, jiffies + SERIAL_TIMER_VALUE);
 }
 
 static unsigned int rs_write_room(struct tty_struct *tty)
diff --git a/arch/xtensa/platforms/iss/network.c b/arch/xtensa/platforms/iss/network.c
index f0a63b2f85cc..1f41e5423c55 100644
--- a/arch/xtensa/platforms/iss/network.c
+++ b/arch/xtensa/platforms/iss/network.c
@@ -341,7 +341,7 @@ static void iss_net_timer(struct timer_list *t)
 	struct iss_net_private *lp = timer_container_of(lp, t, timer);
 
 	iss_net_poll(lp);
-	mod_timer(&lp->timer, jiffies + lp->timer_val);
+	timer_mod(&lp->timer, jiffies + lp->timer_val);
 }
 
 
@@ -365,7 +365,7 @@ static int iss_net_open(struct net_device *dev)
 
 	timer_setup(&lp->timer, iss_net_timer, 0);
 	lp->timer_val = ISS_NET_TIMER_VALUE;
-	mod_timer(&lp->timer, jiffies + lp->timer_val);
+	timer_mod(&lp->timer, jiffies + lp->timer_val);
 
 	return err;
 }
diff --git a/arch/xtensa/platforms/xt2000/setup.c b/arch/xtensa/platforms/xt2000/setup.c
index 258e01a51fd8..6e88aeed95d4 100644
--- a/arch/xtensa/platforms/xt2000/setup.c
+++ b/arch/xtensa/platforms/xt2000/setup.c
@@ -81,7 +81,7 @@ static void xt2000_heartbeat(struct timer_list *unused)
 
 	led_print(7, i ? "." : " ");
 	i ^= 1;
-	mod_timer(&heartbeat_timer, jiffies + HZ / 2);
+	timer_mod(&heartbeat_timer, jiffies + HZ / 2);
 }
 
 //#define RS_TABLE_SIZE 2
@@ -139,7 +139,7 @@ static int __init xt2000_setup_devinit(void)
 {
 	platform_device_register(&xt2000_serial8250_device);
 	platform_device_register(&xt2000_sonic_device);
-	mod_timer(&heartbeat_timer, jiffies + HZ / 2);
+	timer_mod(&heartbeat_timer, jiffies + HZ / 2);
 	register_restart_handler(&xt2000_restart_block);
 	register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
 				 SYS_OFF_PRIO_DEFAULT,
diff --git a/block/blk-iolatency.c b/block/blk-iolatency.c
index 61d183028a5c..937d3f583dfe 100644
--- a/block/blk-iolatency.c
+++ b/block/blk-iolatency.c
@@ -482,7 +482,7 @@ static void blkcg_iolatency_throttle(struct rq_qos *rqos, struct bio *bio)
 		blkg = blkg->parent;
 	}
 	if (!timer_pending(&blkiolat->timer))
-		mod_timer(&blkiolat->timer, jiffies + HZ);
+		timer_mod(&blkiolat->timer, jiffies + HZ);
 }
 
 static void iolatency_record_time(struct iolatency_grp *iolat,
diff --git a/block/blk-mq.c b/block/blk-mq.c
index c2697db59109..ce8cf7ada492 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -1740,7 +1740,7 @@ static void blk_mq_timeout_work(struct work_struct *work)
 	}
 
 	if (expired.next != 0) {
-		mod_timer(&q->timeout, expired.next);
+		timer_mod(&q->timeout, expired.next);
 	} else {
 		/*
 		 * Request timeouts are handled as a forward rolling timer. If
diff --git a/block/blk-stat.h b/block/blk-stat.h
index 9e05bf18d1be..e0660c4e0d31 100644
--- a/block/blk-stat.h
+++ b/block/blk-stat.h
@@ -143,7 +143,7 @@ static inline bool blk_stat_is_active(struct blk_stat_callback *cb)
 static inline void blk_stat_activate_nsecs(struct blk_stat_callback *cb,
 					   u64 nsecs)
 {
-	mod_timer(&cb->timer, jiffies + nsecs_to_jiffies(nsecs));
+	timer_mod(&cb->timer, jiffies + nsecs_to_jiffies(nsecs));
 }
 
 static inline void blk_stat_deactivate(struct blk_stat_callback *cb)
@@ -162,7 +162,7 @@ static inline void blk_stat_deactivate(struct blk_stat_callback *cb)
 static inline void blk_stat_activate_msecs(struct blk_stat_callback *cb,
 					   unsigned int msecs)
 {
-	mod_timer(&cb->timer, jiffies + msecs_to_jiffies(msecs));
+	timer_mod(&cb->timer, jiffies + msecs_to_jiffies(msecs));
 }
 
 void blk_rq_stat_add(struct blk_rq_stat *, u64);
diff --git a/block/blk-throttle.c b/block/blk-throttle.c
index 13c5943b535e..f81897f3c6c5 100644
--- a/block/blk-throttle.c
+++ b/block/blk-throttle.c
@@ -431,7 +431,7 @@ static void throtl_schedule_pending_timer(struct throtl_service_queue *sq,
 	 */
 	if (time_after(expires, max_expire))
 		expires = max_expire;
-	mod_timer(&sq->pending_timer, expires);
+	timer_mod(&sq->pending_timer, expires);
 	throtl_log(sq, "schedule timer. delay=%lu jiffies=%lu",
 		   expires - jiffies, jiffies);
 }
diff --git a/block/blk-timeout.c b/block/blk-timeout.c
index 1b8de0417fc1..da9084faaad0 100644
--- a/block/blk-timeout.c
+++ b/block/blk-timeout.c
@@ -161,7 +161,7 @@ void blk_add_timer(struct request *req)
 		 * will be X + something.
 		 */
 		if (!timer_pending(&q->timeout) || (diff >= HZ / 2))
-			mod_timer(&q->timeout, expiry);
+			timer_mod(&q->timeout, expiry);
 	}
 
 }
diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_timesync.c
index 1b59c51ea44a..b65917e52b9b 100644
--- a/drivers/accel/qaic/qaic_timesync.c
+++ b/drivers/accel/qaic/qaic_timesync.c
@@ -140,7 +140,7 @@ static void qaic_timesync_timer(struct timer_list *t)
 
 	if (atomic_read(&mqtsdev->buff_in_use)) {
 		dev_dbg(mqtsdev->dev, "%s buffer not free, schedule next cycle\n", __func__);
-		goto mod_timer;
+		goto timer_mod;
 	}
 	atomic_set(&mqtsdev->buff_in_use, 1);
 
@@ -165,10 +165,10 @@ static void qaic_timesync_timer(struct timer_list *t)
 		atomic_set(&mqtsdev->buff_in_use, 0);
 	}
 
-mod_timer:
-	ret = mod_timer(t, jiffies + msecs_to_jiffies(timesync_delay_ms));
+timer_mod:
+	ret = timer_mod(t, jiffies + msecs_to_jiffies(timesync_delay_ms));
 	if (ret)
-		dev_err(mqtsdev->dev, "%s mod_timer error:%d\n", __func__, ret);
+		dev_err(mqtsdev->dev, "%s timer_mod error:%d\n", __func__, ret);
 }
 
 static int qaic_timesync_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
diff --git a/drivers/accessibility/speakup/main.c b/drivers/accessibility/speakup/main.c
index e68cf1d83787..7d9049777958 100644
--- a/drivers/accessibility/speakup/main.c
+++ b/drivers/accessibility/speakup/main.c
@@ -1441,7 +1441,7 @@ static void start_read_all_timer(struct vc_data *vc, enum read_all_command comma
 	cursor_con = vc->vc_num;
 	read_all_key = command;
 	cursor_timeout = spk_get_var(CURSOR_TIME);
-	mod_timer(&cursor_timer,
+	timer_mod(&cursor_timer,
 		  jiffies + msecs_to_jiffies(cursor_timeout->u.n.value));
 }
 
@@ -1565,7 +1565,7 @@ static void do_handle_cursor(struct vc_data *vc, u_char value, char up_flag)
 	if (cursor_track == CT_Highlight)
 		reset_highlight_buffers(vc);
 	cursor_timeout = spk_get_var(CURSOR_TIME);
-	mod_timer(&cursor_timer,
+	timer_mod(&cursor_timer,
 		  jiffies + msecs_to_jiffies(cursor_timeout->u.n.value));
 	spin_unlock_irqrestore(&speakup_info.spinlock, flags);
 }
diff --git a/drivers/accessibility/speakup/synth.c b/drivers/accessibility/speakup/synth.c
index d8addbf3ad0d..1a47c8cd0a4b 100644
--- a/drivers/accessibility/speakup/synth.c
+++ b/drivers/accessibility/speakup/synth.c
@@ -187,7 +187,7 @@ void synth_start(void)
 	}
 	trigger_time = spk_get_var(TRIGGER);
 	if (!timer_pending(&thread_timer))
-		mod_timer(&thread_timer, jiffies +
+		timer_mod(&thread_timer, jiffies +
 			msecs_to_jiffies(trigger_time->u.n.value));
 }
 
diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index 4e9c82f36df1..f4719eae4db2 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -1029,7 +1029,7 @@ static void ahci_sw_activity(struct ata_link *link)
 
 	emp->activity++;
 	if (!timer_pending(&emp->timer))
-		mod_timer(&emp->timer, jiffies + msecs_to_jiffies(10));
+		timer_mod(&emp->timer, jiffies + msecs_to_jiffies(10));
 }
 
 static void ahci_sw_activity_blink(struct timer_list *t)
@@ -1065,7 +1065,7 @@ static void ahci_sw_activity_blink(struct timer_list *t)
 
 		/* toggle state */
 		led_message |= (activity_led_state << 16);
-		mod_timer(&emp->timer, jiffies + msecs_to_jiffies(100));
+		timer_mod(&emp->timer, jiffies + msecs_to_jiffies(100));
 	} else {
 		/* switch to idle */
 		led_message &= ~EM_MSG_LED_VALUE_ACTIVITY;
diff --git a/drivers/atm/idt77105.c b/drivers/atm/idt77105.c
index 2dd628debe11..fe5b7f7fd16e 100644
--- a/drivers/atm/idt77105.c
+++ b/drivers/atm/idt77105.c
@@ -97,7 +97,7 @@ static void idt77105_stats_timer_func(struct timer_list *unused)
                 stats->rx_cells += get_counter(dev, IDT77105_CTRSEL_RCC);
                 stats->rx_hec_errors += get_counter(dev, IDT77105_CTRSEL_RHEC);
 	}
-        if (!start_timer) mod_timer(&stats_timer,jiffies+IDT77105_STATS_TIMER_PERIOD);
+        if (!start_timer) timer_mod(&stats_timer,jiffies+IDT77105_STATS_TIMER_PERIOD);
 }
 
 
@@ -135,7 +135,7 @@ static void idt77105_restart_timer_func(struct timer_list *unused)
 	            PUT( walk->old_mcr ,MCR);
                 }
 	}
-        if (!start_timer) mod_timer(&restart_timer,jiffies+IDT77105_RESTART_TIMER_PERIOD);
+        if (!start_timer) timer_mod(&restart_timer,jiffies+IDT77105_RESTART_TIMER_PERIOD);
 }
 
 
diff --git a/drivers/atm/idt77252.c b/drivers/atm/idt77252.c
index c7c0cd9ca86a..8fb7071e8a56 100644
--- a/drivers/atm/idt77252.c
+++ b/drivers/atm/idt77252.c
@@ -1547,7 +1547,7 @@ tst_timer(struct timer_list *t)
 
 		pc = readl(SAR_REG_NOW) >> 2;
 		if ((pc ^ idle) & ~(card->tst_size - 1)) {
-			mod_timer(&card->tst_timer, jiffies + 1);
+			timer_mod(&card->tst_timer, jiffies + 1);
 			goto out;
 		}
 
@@ -1584,7 +1584,7 @@ tst_timer(struct timer_list *t)
 		write_sram(card, jump, TSTE_OPC_NULL);
 		set_bit(TST_SWITCH_WAIT, &card->tst_state);
 
-		mod_timer(&card->tst_timer, jiffies + 1);
+		timer_mod(&card->tst_timer, jiffies + 1);
 	}
 
 out:
@@ -1663,7 +1663,7 @@ fill_tst(struct idt77252_dev *card, struct vc_map *vc, int n, unsigned int opc)
 
 	set_bit(TST_SWITCH_PENDING, &card->tst_state);
 	if (!timer_pending(&card->tst_timer))
-		mod_timer(&card->tst_timer, jiffies + 1);
+		timer_mod(&card->tst_timer, jiffies + 1);
 
 	spin_unlock_irqrestore(&card->tst_lock, flags);
 	return res;
@@ -1706,7 +1706,7 @@ clear_tst(struct idt77252_dev *card, struct vc_map *vc)
 
 	set_bit(TST_SWITCH_PENDING, &card->tst_state);
 	if (!timer_pending(&card->tst_timer))
-		mod_timer(&card->tst_timer, jiffies + 1);
+		timer_mod(&card->tst_timer, jiffies + 1);
 
 	spin_unlock_irqrestore(&card->tst_lock, flags);
 	return res;
@@ -1726,7 +1726,7 @@ change_tst(struct idt77252_dev *card, struct vc_map *vc,
 
 	set_bit(TST_SWITCH_PENDING, &card->tst_state);
 	if (!timer_pending(&card->tst_timer))
-		mod_timer(&card->tst_timer, jiffies + 1);
+		timer_mod(&card->tst_timer, jiffies + 1);
 
 	spin_unlock_irqrestore(&card->tst_lock, flags);
 	return res;
@@ -2124,7 +2124,7 @@ idt77252_init_est(struct vc_map *vc, int pcr)
 	est->interval = 2;		/* XXX: make this configurable */
 	est->ewma_log = 2;		/* XXX: make this configurable */
 	timer_setup(&est->timer, idt77252_est_timer, 0);
-	mod_timer(&est->timer, jiffies + ((HZ / 4) << est->interval));
+	timer_mod(&est->timer, jiffies + ((HZ / 4) << est->interval));
 
 	return est;
 }
diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c
index 246ec28aca4f..9cd4c7841254 100644
--- a/drivers/atm/iphase.c
+++ b/drivers/atm/iphase.c
@@ -2463,7 +2463,7 @@ static void ia_led_timer(struct timer_list *unused) {
               }
            }
         }
-	mod_timer(&ia_timer, jiffies + HZ / 4);
+	timer_mod(&ia_timer, jiffies + HZ / 4);
  	return;
 }
 
diff --git a/drivers/atm/lanai.c b/drivers/atm/lanai.c
index d8ac6fade09a..17ace42e7c4e 100644
--- a/drivers/atm/lanai.c
+++ b/drivers/atm/lanai.c
@@ -1780,7 +1780,7 @@ static void lanai_timed_poll(struct timer_list *t)
 
 	get_statistics(lanai);
 #endif /* !DEBUG_RW */
-	mod_timer(&lanai->timer, jiffies + LANAI_POLL_PERIOD);
+	timer_mod(&lanai->timer, jiffies + LANAI_POLL_PERIOD);
 }
 
 static inline void lanai_timed_poll_start(struct lanai_dev *lanai)
diff --git a/drivers/atm/nicstar.c b/drivers/atm/nicstar.c
index 028bb868180b..303c9c83c52a 100644
--- a/drivers/atm/nicstar.c
+++ b/drivers/atm/nicstar.c
@@ -2719,7 +2719,7 @@ static void ns_poll(struct timer_list *unused)
 		writel(stat_w, card->membase + STAT);
 		spin_unlock_irqrestore(&card->int_lock, flags);
 	}
-	mod_timer(&ns_timer, jiffies + NS_POLL_PERIOD);
+	timer_mod(&ns_timer, jiffies + NS_POLL_PERIOD);
 	PRINTK("nicstar: Leaving ns_poll().\n");
 }
 
diff --git a/drivers/atm/suni.c b/drivers/atm/suni.c
index 899bab8b3c43..8996e764696e 100644
--- a/drivers/atm/suni.c
+++ b/drivers/atm/suni.c
@@ -85,7 +85,7 @@ static void suni_hz(struct timer_list *timer)
 		    ((GET(TACP_TCC) & 0xff) << 8) |
 		    ((GET(TACP_TCCM) & 7) << 16));
 	}
-	if (timer) mod_timer(&poll_timer,jiffies+HZ);
+	if (timer) timer_mod(&poll_timer,jiffies+HZ);
 }
 
 
diff --git a/drivers/auxdisplay/line-display.c b/drivers/auxdisplay/line-display.c
index 8590a4cd21e0..dde3678400d8 100644
--- a/drivers/auxdisplay/line-display.c
+++ b/drivers/auxdisplay/line-display.c
@@ -63,7 +63,7 @@ static void linedisp_scroll(struct timer_list *t)
 
 	/* rearm the timer */
 	if (linedisp->message_len > num_chars && linedisp->scroll_rate)
-		mod_timer(&linedisp->timer, jiffies + linedisp->scroll_rate);
+		timer_mod(&linedisp->timer, jiffies + linedisp->scroll_rate);
 }
 
 /**
diff --git a/drivers/auxdisplay/panel.c b/drivers/auxdisplay/panel.c
index ccfd0b06ed6c..5a60d010890c 100644
--- a/drivers/auxdisplay/panel.c
+++ b/drivers/auxdisplay/panel.c
@@ -1350,7 +1350,7 @@ static void panel_scan_timer(struct timer_list *unused)
 	if (keypressed && lcd.enabled && lcd.initialized)
 		charlcd_poke(lcd.charlcd);
 
-	mod_timer(&scan_timer, jiffies + INPUT_POLL_TIME);
+	timer_mod(&scan_timer, jiffies + INPUT_POLL_TIME);
 }
 
 static void init_scan_timer(void)
diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index c47b246dbf87..5d840dce3a23 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -529,7 +529,7 @@ static void dpm_watchdog_handler(struct timer_list *t)
 	show_stack(wd->tsk, NULL, KERN_WARNING);
 
 	wd->fatal = true;
-	mod_timer(timer, jiffies + HZ * time_left);
+	timer_mod(timer, jiffies + HZ * time_left);
 }
 
 /**
diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
index e6306e1996eb..3ab1299c7a20 100644
--- a/drivers/base/power/wakeup.c
+++ b/drivers/base/power/wakeup.c
@@ -812,7 +812,7 @@ void pm_wakeup_ws_event(struct wakeup_source *ws, unsigned int msec, bool hard)
 		expires = 1;
 
 	if (!ws->timer_expires || time_after(expires, ws->timer_expires)) {
-		mod_timer(&ws->timer, expires);
+		timer_mod(&ws->timer, expires);
 		ws->timer_expires = expires;
 	}
 
diff --git a/drivers/block/amiflop.c b/drivers/block/amiflop.c
index 5e7060874912..e9c7c5967b6a 100644
--- a/drivers/block/amiflop.c
+++ b/drivers/block/amiflop.c
@@ -464,7 +464,7 @@ static int fd_motor_on(int nr)
 		fd_select(nr);
 
 		reinit_completion(&motor_on_completion);
-		mod_timer(&motor_on_timer, jiffies + HZ/2);
+		timer_mod(&motor_on_timer, jiffies + HZ/2);
 
 		on_attempts = 10;
 		wait_for_completion(&motor_on_completion);
@@ -509,7 +509,7 @@ static void floppy_off (unsigned int nr)
 	int drive;
 
 	drive = nr & 3;
-	mod_timer(motor_off_timer + drive, jiffies + 3*HZ);
+	timer_mod(motor_off_timer + drive, jiffies + 3*HZ);
 }
 
 static int fd_calibrate(int drive)
@@ -1495,7 +1495,7 @@ static blk_status_t amiflop_rw_cur_segment(struct amiga_floppy_struct *floppy,
 			 */
 			floppy->dirty = 1;
 		        /* reset the timer */
-			mod_timer (flush_track_timer + drive, jiffies + 1);
+			timer_mod (flush_track_timer + drive, jiffies + 1);
 		}
 	}
 
diff --git a/drivers/block/aoe/aoemain.c b/drivers/block/aoe/aoemain.c
index cdf6e4041bb9..8200715d8cee 100644
--- a/drivers/block/aoe/aoemain.c
+++ b/drivers/block/aoe/aoemain.c
@@ -20,7 +20,7 @@ struct workqueue_struct *aoe_wq;
 
 static void discover_timer(struct timer_list *t)
 {
-	mod_timer(t, jiffies + HZ * 60); /* one minute */
+	timer_mod(t, jiffies + HZ * 60); /* one minute */
 
 	aoecmd_cfg(0xffff, 0xff);
 }
diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
index 7fe14266c12c..6ceba4113f0d 100644
--- a/drivers/block/ataflop.c
+++ b/drivers/block/ataflop.c
@@ -478,18 +478,18 @@ static void fd_end_request_cur(blk_status_t err)
 
 static inline void start_motor_off_timer(void)
 {
-	mod_timer(&motor_off_timer, jiffies + FD_MOTOR_OFF_DELAY);
+	timer_mod(&motor_off_timer, jiffies + FD_MOTOR_OFF_DELAY);
 	MotorOffTrys = 0;
 }
 
 static inline void start_check_change_timer( void )
 {
-	mod_timer(&fd_timer, jiffies + CHECK_CHANGE_DELAY);
+	timer_mod(&fd_timer, jiffies + CHECK_CHANGE_DELAY);
 }
 
 static inline void start_timeout(void)
 {
-	mod_timer(&timeout_timer, jiffies + FLOPPY_TIMEOUT);
+	timer_mod(&timeout_timer, jiffies + FLOPPY_TIMEOUT);
 }
 
 static inline void stop_timeout(void)
@@ -598,7 +598,7 @@ static void fd_motor_off_timer(struct timer_list *unused)
 	 * at least until a disk is inserted). So we'll test only twice
 	 * per second from then on...
 	 */
-	mod_timer(&motor_off_timer,
+	timer_mod(&motor_off_timer,
 		  jiffies + (MotorOffTrys++ < FD_MOTOR_OFF_MAXTRY ? HZ/20 : HZ/2));
 }
 
@@ -1067,7 +1067,7 @@ static void fd_rwsec( void )
 		 * recognise that it isn't present :-(
 		 */
 		MultReadInProgress = 1;
-		mod_timer(&readtrack_timer,
+		timer_mod(&readtrack_timer,
 			  /* 1 rot. + 5 rot.s if motor was off  */
 			  jiffies + HZ/5 + (old_motoron ? 0 : HZ));
 	}
@@ -1128,7 +1128,7 @@ static void fd_readtrack_check(struct timer_list *unused)
 		/* not yet finished, wait another tenth rotation */
 		local_irq_restore(flags);
 		DPRINT(("fd_readtrack_check(): not yet finished\n"));
-		mod_timer(&readtrack_timer, jiffies + HZ/5/10);
+		timer_mod(&readtrack_timer, jiffies + HZ/5/10);
 	}
 }
 
@@ -1405,7 +1405,7 @@ static void finish_fdc_done( int dummy )
 		/* If the check for a disk change is done too early after this
 		 * last seek command, the WP bit still reads wrong :-((
 		 */
-		mod_timer(&fd_timer, jiffies + 5);
+		timer_mod(&fd_timer, jiffies + 5);
 	else
 		start_check_change_timer();
 	start_motor_off_timer();
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 64f301f1cc63..074b3b6ce719 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -3307,7 +3307,7 @@ int drbd_md_read(struct drbd_device *device, struct drbd_backing_dev *bdev)
 void drbd_md_mark_dirty(struct drbd_device *device)
 {
 	if (!test_and_set_bit(MD_DIRTY, &device->flags))
-		mod_timer(&device->md_sync_timer, jiffies + 5*HZ);
+		timer_mod(&device->md_sync_timer, jiffies + 5*HZ);
 }
 
 void drbd_uuid_move_history(struct drbd_device *device) __must_hold(local)
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index e09930c2b226..dc66860b4f32 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1610,7 +1610,7 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 
 	kvfree_rcu_mightsleep(old_disk_conf);
 	kfree(old_plan);
-	mod_timer(&device->request_timer, jiffies + HZ);
+	timer_mod(&device->request_timer, jiffies + HZ);
 	goto success;
 
 fail_unlock:
@@ -2098,7 +2098,7 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 	if (rv < SS_SUCCESS)
 		goto force_diskless_dec;
 
-	mod_timer(&device->request_timer, jiffies + HZ);
+	timer_mod(&device->request_timer, jiffies + HZ);
 
 	if (device->state.role == R_PRIMARY)
 		device->ldev->md.uuid[UI_CURRENT] |=  (u64)1;
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index fbda55ba253e..b647989ce0cb 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -908,7 +908,7 @@ int drbd_connected(struct drbd_peer_device *peer_device)
 	clear_bit(USE_DEGR_WFC_T, &device->flags);
 	clear_bit(RESIZE_PENDING, &device->flags);
 	atomic_set(&device->ap_in_flight, 0);
-	mod_timer(&device->request_timer, jiffies + HZ); /* just start it here. */
+	timer_mod(&device->request_timer, jiffies + HZ); /* just start it here. */
 	return err;
 }
 
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 915cbb2e4cca..3aab298ef4b5 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -1785,5 +1785,5 @@ void request_timer_fn(struct timer_list *t)
 	nt = time_before(ent, dt) ? ent : dt;
 out:
 	spin_unlock_irq(&device->resource->req_lock);
-	mod_timer(&device->request_timer, nt);
+	timer_mod(&device->request_timer, nt);
 }
diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
index c2b6c4d9729d..1cb756fc227e 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -1375,7 +1375,7 @@ _drbd_set_state(struct drbd_device *device, union drbd_state ns,
 		device->rs_paused += (long)jiffies
 				  -(long)device->rs_mark_time[device->rs_last_mark];
 		if (ns.conn == C_SYNC_TARGET)
-			mod_timer(&device->resync_timer, jiffies);
+			timer_mod(&device->resync_timer, jiffies);
 	}
 
 	if ((os.conn == C_SYNC_TARGET  || os.conn == C_SYNC_SOURCE) &&
@@ -1405,7 +1405,7 @@ _drbd_set_state(struct drbd_device *device, union drbd_state ns,
 		if (ns.conn == C_VERIFY_S) {
 			drbd_info(device, "Starting Online Verify from sector %llu\n",
 					(unsigned long long)device->ov_position);
-			mod_timer(&device->resync_timer, jiffies);
+			timer_mod(&device->resync_timer, jiffies);
 		}
 	}
 
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 1d61328582e2..5b7d81ef58a6 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -757,7 +757,7 @@ static int make_resync_request(struct drbd_peer_device *const peer_device, int c
 
  requeue:
 	device->rs_in_flight += (i << (BM_BLOCK_SHIFT - 9));
-	mod_timer(&device->resync_timer, jiffies + SLEEP_TIME);
+	timer_mod(&device->resync_timer, jiffies + SLEEP_TIME);
 	put_ldev(device);
 	return 0;
 }
@@ -811,7 +811,7 @@ static int make_ov_request(struct drbd_peer_device *peer_device, int cancel)
  requeue:
 	device->rs_in_flight += (i << (BM_BLOCK_SHIFT - 9));
 	if (i == 0 || !stop_sector_reached)
-		mod_timer(&device->resync_timer, jiffies + SLEEP_TIME);
+		timer_mod(&device->resync_timer, jiffies + SLEEP_TIME);
 	return 1;
 }
 
@@ -1906,7 +1906,7 @@ void drbd_start_resync(struct drbd_device *device, enum drbd_conns side)
 		 * the timer triggers.
 		 * No matter, that is handled in resync_timer_fn() */
 		if (ns.conn == C_SYNC_TARGET)
-			mod_timer(&device->resync_timer, jiffies);
+			timer_mod(&device->resync_timer, jiffies);
 
 		drbd_md_sync(device);
 	}
diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
index b5727dea15bd..3c775ddf071a 100644
--- a/drivers/block/sunvdc.c
+++ b/drivers/block/sunvdc.c
@@ -1189,7 +1189,7 @@ static void vdc_ldc_reset(struct vdc_port *port)
 	if (port->ldc_timeout)
 		mod_delayed_work(system_wq, &port->ldc_reset_timer_work,
 			  round_jiffies(jiffies + HZ * port->ldc_timeout));
-	mod_timer(&port->vio.timer, round_jiffies(jiffies + HZ));
+	timer_mod(&port->vio.timer, round_jiffies(jiffies + HZ));
 	return;
 
 err_free_ldc:
diff --git a/drivers/bluetooth/bluecard_cs.c b/drivers/bluetooth/bluecard_cs.c
index 1e3a56e9b139..50f768920f25 100644
--- a/drivers/bluetooth/bluecard_cs.c
+++ b/drivers/bluetooth/bluecard_cs.c
@@ -164,7 +164,7 @@ static void bluecard_activity_led_timeout(struct timer_list *t)
 	if (test_bit(CARD_ACTIVITY, &(info->hw_state))) {
 		/* leave LED in inactive state for HZ/10 for blink effect */
 		clear_bit(CARD_ACTIVITY, &(info->hw_state));
-		mod_timer(&(info->timer), jiffies + HZ / 10);
+		timer_mod(&(info->timer), jiffies + HZ / 10);
 	}
 
 	/* Disable activity LED, enable power LED */
@@ -191,7 +191,7 @@ static void bluecard_enable_activity_led(struct bluecard_info *info)
 	}
 
 	/* Stop the LED after HZ/10 */
-	mod_timer(&(info->timer), jiffies + HZ / 10);
+	timer_mod(&(info->timer), jiffies + HZ / 10);
 }
 
 
diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index e35ac3e83828..76a1540cdb14 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -393,7 +393,7 @@ static void ps_start_timer(struct btnxpuart_dev *nxpdev)
 		return;
 
 	if (psdata->cur_psmode == PS_MODE_ENABLE)
-		mod_timer(&psdata->ps_timer, jiffies + msecs_to_jiffies(psdata->h2c_ps_interval));
+		timer_mod(&psdata->ps_timer, jiffies + msecs_to_jiffies(psdata->h2c_ps_interval));
 
 	if (psdata->ps_state == PS_STATE_AWAKE && psdata->ps_cmd == PS_CMD_ENTER_PS)
 		cancel_work_sync(&psdata->work);
diff --git a/drivers/bluetooth/hci_bcsp.c b/drivers/bluetooth/hci_bcsp.c
index 664d82d1e613..1f2fa4efa3ec 100644
--- a/drivers/bluetooth/hci_bcsp.c
+++ b/drivers/bluetooth/hci_bcsp.c
@@ -309,7 +309,7 @@ static struct sk_buff *bcsp_dequeue(struct hci_uart *hu)
 						hci_skb_pkt_type(skb));
 			if (nskb) {
 				__skb_queue_tail(&bcsp->unack, skb);
-				mod_timer(&bcsp->tbcsp, jiffies + HZ / 4);
+				timer_mod(&bcsp->tbcsp, jiffies + HZ / 4);
 				spin_unlock_irqrestore(&bcsp->unack.lock, flags);
 				return nskb;
 			} else {
diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index d0d4420c1a0f..7c8123dee962 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -165,7 +165,7 @@ static void h5_timed_event(struct timer_list *t)
 	}
 
 	if (h5->state != H5_ACTIVE) {
-		mod_timer(&h5->timer, jiffies + H5_SYNC_TIMEOUT);
+		timer_mod(&h5->timer, jiffies + H5_SYNC_TIMEOUT);
 		goto wakeup;
 	}
 
@@ -245,7 +245,7 @@ static int h5_open(struct hci_uart *hu)
 
 	/* Send initial sync request */
 	h5_link_control(hu, sync, sizeof(sync));
-	mod_timer(&h5->timer, jiffies + H5_SYNC_TIMEOUT);
+	timer_mod(&h5->timer, jiffies + H5_SYNC_TIMEOUT);
 
 	return 0;
 }
@@ -752,7 +752,7 @@ static struct sk_buff *h5_dequeue(struct hci_uart *hu)
 		h5->sleep = H5_WAKING_UP;
 		BT_DBG("Sending wakeup request");
 
-		mod_timer(&h5->timer, jiffies + HZ / 100);
+		timer_mod(&h5->timer, jiffies + HZ / 100);
 		return h5_prepare_pkt(hu, HCI_3WIRE_LINK_PKT, wakeup_req, 2);
 	}
 
@@ -780,7 +780,7 @@ static struct sk_buff *h5_dequeue(struct hci_uart *hu)
 				      skb->data, skb->len);
 		if (nskb) {
 			__skb_queue_tail(&h5->unack, skb);
-			mod_timer(&h5->timer, jiffies + H5_ACK_TIMEOUT);
+			timer_mod(&h5->timer, jiffies + H5_ACK_TIMEOUT);
 			spin_unlock_irqrestore(&h5->unack.lock, flags);
 			return nskb;
 		}
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 0a4c84536640..d55756ebbc39 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -408,7 +408,7 @@ static void qca_wq_awake_device(struct work_struct *work)
 
 	/* Start retransmit timer */
 	retrans_delay = msecs_to_jiffies(qca->wake_retrans);
-	mod_timer(&qca->wake_retrans_timer, jiffies + retrans_delay);
+	timer_mod(&qca->wake_retrans_timer, jiffies + retrans_delay);
 
 	spin_unlock_irqrestore(&qca->hci_ibs_lock, flags);
 
@@ -534,7 +534,7 @@ static void hci_ibs_wake_retrans_timeout(struct timer_list *t)
 		}
 		qca->ibs_sent_wakes++;
 		retrans_delay = msecs_to_jiffies(qca->wake_retrans);
-		mod_timer(&qca->wake_retrans_timer, jiffies + retrans_delay);
+		timer_mod(&qca->wake_retrans_timer, jiffies + retrans_delay);
 		break;
 
 	case HCI_IBS_TX_ASLEEP:
@@ -869,7 +869,7 @@ static void device_woke_up(struct hci_uart *hu)
 		/* Switch timers and change state to HCI_IBS_TX_AWAKE */
 		timer_delete(&qca->wake_retrans_timer);
 		idle_delay = msecs_to_jiffies(qca->tx_idle_delay);
-		mod_timer(&qca->tx_idle_timer, jiffies + idle_delay);
+		timer_mod(&qca->tx_idle_timer, jiffies + idle_delay);
 		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
 		break;
 
@@ -926,7 +926,7 @@ static int qca_enqueue(struct hci_uart *hu, struct sk_buff *skb)
 		BT_DBG("Device awake, sending normally");
 		skb_queue_tail(&qca->txq, skb);
 		idle_delay = msecs_to_jiffies(qca->tx_idle_delay);
-		mod_timer(&qca->tx_idle_timer, jiffies + idle_delay);
+		timer_mod(&qca->tx_idle_timer, jiffies + idle_delay);
 		break;
 
 	case HCI_IBS_TX_ASLEEP:
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 663c9aa83c21..073411978862 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1123,7 +1123,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 	dev_dbg(&pdev->dev, "Recovery completed\n");
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
-	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+	timer_mod(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 	return;
 
 err_unprepare:
@@ -1150,7 +1150,7 @@ static void health_check(struct timer_list *t)
 	}
 
 	/* reschedule in two seconds */
-	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+	timer_mod(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 }
 
 static int mhi_pci_generic_edl_trigger(struct mhi_controller *mhi_cntrl)
@@ -1268,7 +1268,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
 
 	/* start health check */
-	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+	timer_mod(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
 	/* Only allow runtime-suspend if PME capable (for wakeup) */
 	if (pci_pme_capable(pdev, PCI_D3hot)) {
@@ -1366,7 +1366,7 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
 	}
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
-	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+	timer_mod(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 }
 
 static pci_ers_result_t mhi_pci_error_detected(struct pci_dev *pdev,
@@ -1482,7 +1482,7 @@ static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
 	}
 
 	/* Resume health check */
-	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+	timer_mod(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
 	/* It can be a remote wakeup (no mhi runtime_get), update access time */
 	pm_runtime_mark_last_busy(dev);
diff --git a/drivers/char/dtlk.c b/drivers/char/dtlk.c
index 16618079298a..29769da8f484 100644
--- a/drivers/char/dtlk.c
+++ b/drivers/char/dtlk.c
@@ -254,7 +254,7 @@ static __poll_t dtlk_poll(struct file *file, poll_table * wait)
 
 	/* There won't be any interrupts, so we set a timer instead. */
 	expires = jiffies + 3*HZ / 100;
-	mod_timer(&dtlk_timer, expires);
+	timer_mod(&dtlk_timer, expires);
 
 	return mask;
 }
diff --git a/drivers/char/hangcheck-timer.c b/drivers/char/hangcheck-timer.c
index 497fc167cb8c..1a0775adb29c 100644
--- a/drivers/char/hangcheck-timer.c
+++ b/drivers/char/hangcheck-timer.c
@@ -145,7 +145,7 @@ static void hangcheck_fire(struct timer_list *unused)
 	printk("Hangcheck: called %Ld ns since last time (%Ld ns overshoot)\n",
 			tsc_diff, tsc_diff - hangcheck_tick*TIMER_FREQ);
 #endif
-	mod_timer(&hangcheck_ticktock, jiffies + (hangcheck_tick*HZ));
+	timer_mod(&hangcheck_ticktock, jiffies + (hangcheck_tick*HZ));
 	hangcheck_tsc = ktime_get_ns();
 }
 
@@ -159,7 +159,7 @@ static int __init hangcheck_init(void)
 	hangcheck_tsc_margin *= TIMER_FREQ;
 
 	hangcheck_tsc = ktime_get_ns();
-	mod_timer(&hangcheck_ticktock, jiffies + (hangcheck_tick*HZ));
+	timer_mod(&hangcheck_ticktock, jiffies + (hangcheck_tick*HZ));
 
 	return 0;
 }
diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 3ba9d7e9a6c7..4d57e56428c2 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -5109,14 +5109,14 @@ static void ipmi_timeout(struct timer_list *unused)
 	srcu_read_unlock(&ipmi_interfaces_srcu, index);
 
 	if (need_timer)
-		mod_timer(&ipmi_timer, jiffies + IPMI_TIMEOUT_JIFFIES);
+		timer_mod(&ipmi_timer, jiffies + IPMI_TIMEOUT_JIFFIES);
 }
 
 static void need_waiter(struct ipmi_smi *intf)
 {
 	/* Racy, but worst case we start the timer twice. */
 	if (!timer_pending(&ipmi_timer))
-		mod_timer(&ipmi_timer, jiffies + IPMI_TIMEOUT_JIFFIES);
+		timer_mod(&ipmi_timer, jiffies + IPMI_TIMEOUT_JIFFIES);
 }
 
 static atomic_t smi_msg_inuse_count = ATOMIC_INIT(0);
@@ -5490,7 +5490,7 @@ static int ipmi_init_msghandler(void)
 	}
 
 	timer_setup(&ipmi_timer, ipmi_timeout, 0);
-	mod_timer(&ipmi_timer, jiffies + IPMI_TIMEOUT_JIFFIES);
+	timer_mod(&ipmi_timer, jiffies + IPMI_TIMEOUT_JIFFIES);
 
 	atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
 
diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 548effc12b2b..b05b938f6651 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -344,7 +344,7 @@ static void smi_mod_timer(struct smi_info *smi_info, unsigned long new_val)
 	if (!smi_info->timer_can_start)
 		return;
 	smi_info->last_timeout_jiffies = jiffies;
-	mod_timer(&smi_info->si_timer, new_val);
+	timer_mod(&smi_info->si_timer, new_val);
 	smi_info->timer_running = true;
 }
 
diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
index fa726e620e55..615d7d0e1106 100644
--- a/drivers/char/ipmi/ipmi_ssif.c
+++ b/drivers/char/ipmi/ipmi_ssif.c
@@ -573,7 +573,7 @@ static void watch_timeout(struct timer_list *t)
 
 	flags = ipmi_ssif_lock_cond(ssif_info, &oflags);
 	if (ssif_info->watch_timeout) {
-		mod_timer(&ssif_info->watch_timer,
+		timer_mod(&ssif_info->watch_timer,
 			  jiffies + ssif_info->watch_timeout);
 		if (IS_SSIF_IDLE(ssif_info)) {
 			start_flag_fetch(ssif_info, flags); /* Releases lock */
@@ -628,7 +628,7 @@ static void msg_done_handler(struct ssif_info *ssif_info, int result,
 			flags = ipmi_ssif_lock_cond(ssif_info, &oflags);
 			ssif_info->waiting_alert = true;
 			if (!ssif_info->stopping)
-				mod_timer(&ssif_info->retry_timer,
+				timer_mod(&ssif_info->retry_timer,
 					  jiffies + SSIF_MSG_JIFFIES);
 			ipmi_ssif_unlock_cond(ssif_info, flags);
 			return;
@@ -918,7 +918,7 @@ static void msg_written_handler(struct ssif_info *ssif_info, int result,
 			 * then redo the send.
 			 */
 			ssif_info->do_resend = true;
-			mod_timer(&ssif_info->retry_timer,
+			timer_mod(&ssif_info->retry_timer,
 				  jiffies + SSIF_REQ_RETRY_JIFFIES);
 			return;
 		}
@@ -984,7 +984,7 @@ static void msg_written_handler(struct ssif_info *ssif_info, int result,
 			ssif_info->waiting_alert = true;
 			ssif_info->retries_left = SSIF_RECV_RETRIES;
 			if (!ssif_info->stopping)
-				mod_timer(&ssif_info->retry_timer,
+				timer_mod(&ssif_info->retry_timer,
 					  jiffies + SSIF_MSG_PART_JIFFIES);
 			ipmi_ssif_unlock_cond(ssif_info, flags);
 		}
@@ -1138,7 +1138,7 @@ static void ssif_set_need_watch(void *send_info, unsigned int watch_mask)
 	if (timeout != ssif_info->watch_timeout) {
 		ssif_info->watch_timeout = timeout;
 		if (ssif_info->watch_timeout)
-			mod_timer(&ssif_info->watch_timer,
+			timer_mod(&ssif_info->watch_timer,
 				  jiffies + ssif_info->watch_timeout);
 	}
 	ipmi_ssif_unlock_cond(ssif_info, flags);
diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index a13a3470c17a..aa4a3dff4941 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -393,7 +393,7 @@ static void aspeed_kcs_check_obe(struct timer_list *timer)
 
 	str = aspeed_kcs_inb(&priv->kcs_bmc, priv->kcs_bmc.ioreg.str);
 	if (str & KCS_BMC_STR_OBF) {
-		mod_timer(timer, jiffies + OBE_POLL_PERIOD);
+		timer_mod(timer, jiffies + OBE_POLL_PERIOD);
 		spin_unlock_irqrestore(&priv->obe.lock, flags);
 		return;
 	}
@@ -426,7 +426,7 @@ static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask,
 						      &priv->kcs_bmc, priv->kcs_bmc.ioreg.str);
 			/* Time for the slow path? */
 			if (rc == -ETIMEDOUT)
-				mod_timer(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
+				timer_mod(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
 		} else {
 			timer_delete(&priv->obe.timer);
 		}
diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
index b7654efcf2c3..77e164339915 100644
--- a/drivers/char/ipmi/ssif_bmc.c
+++ b/drivers/char/ipmi/ssif_bmc.c
@@ -331,7 +331,7 @@ static void handle_request(struct ssif_bmc_ctx *ssif_bmc)
 		timer_setup(&ssif_bmc->response_timer, response_timeout, 0);
 		ssif_bmc->response_timer_inited = true;
 	}
-	mod_timer(&ssif_bmc->response_timer, jiffies + msecs_to_jiffies(RESPONSE_TIMEOUT));
+	timer_mod(&ssif_bmc->response_timer, jiffies + msecs_to_jiffies(RESPONSE_TIMEOUT));
 }
 
 static void calculate_response_part_pec(struct ssif_part_buffer *part)
diff --git a/drivers/char/nwbutton.c b/drivers/char/nwbutton.c
index 92cee5717237..1cb585515a6b 100644
--- a/drivers/char/nwbutton.c
+++ b/drivers/char/nwbutton.c
@@ -150,7 +150,7 @@ static void button_sequence_finished(struct timer_list *unused)
 static irqreturn_t button_handler (int irq, void *dev_id)
 {
 	button_press_count++;
-	mod_timer(&button_timer, jiffies + bdelay);
+	timer_mod(&button_timer, jiffies + bdelay);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/char/tlclk.c b/drivers/char/tlclk.c
index b381ea7e85d2..2782168ec578 100644
--- a/drivers/char/tlclk.c
+++ b/drivers/char/tlclk.c
@@ -910,7 +910,7 @@ static irqreturn_t tlclk_interrupt(int irq, void *dev_id)
 		/* TIMEOUT in ~10ms */
 		switchover_timer.expires = jiffies + msecs_to_jiffies(10);
 		tlclk_timer_data = inb(TLCLK_REG1);
-		mod_timer(&switchover_timer, switchover_timer.expires);
+		timer_mod(&switchover_timer, switchover_timer.expires);
 	} else {
 		got_event = 1;
 		wake_up(&wq);
diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-dev-common.c
index f2a5e09257dd..d5d7d7bde5a2 100644
--- a/drivers/char/tpm/tpm-dev-common.c
+++ b/drivers/char/tpm/tpm-dev-common.c
@@ -82,7 +82,7 @@ static void tpm_dev_async_work(struct work_struct *work)
 	 */
 	if (ret != 0) {
 		priv->response_length = ret;
-		mod_timer(&priv->user_read_timer, jiffies + (120 * HZ));
+		timer_mod(&priv->user_read_timer, jiffies + (120 * HZ));
 	}
 out:
 	mutex_unlock(&priv->buffer_mutex);
@@ -231,7 +231,7 @@ ssize_t tpm_common_write(struct file *file, const char __user *buf,
 
 	if (ret > 0) {
 		priv->response_length = ret;
-		mod_timer(&priv->user_read_timer, jiffies + (120 * HZ));
+		timer_mod(&priv->user_read_timer, jiffies + (120 * HZ));
 		ret = size;
 	}
 out:
diff --git a/drivers/comedi/drivers/comedi_test.c b/drivers/comedi/drivers/comedi_test.c
index b15cb3d62e26..041279fc3646 100644
--- a/drivers/comedi/drivers/comedi_test.c
+++ b/drivers/comedi/drivers/comedi_test.c
@@ -240,7 +240,7 @@ static void waveform_ai_timer(struct timer_list *t)
 			time_increment = 1;
 		spin_lock(&dev->spinlock);
 		if (devpriv->ai_timer_enable) {
-			mod_timer(&devpriv->ai_timer,
+			timer_mod(&devpriv->ai_timer,
 				  jiffies + usecs_to_jiffies(time_increment));
 		}
 		spin_unlock(&dev->spinlock);
@@ -509,7 +509,7 @@ static void waveform_ao_timer(struct timer_list *t)
 
 		spin_lock(&dev->spinlock);
 		if (devpriv->ao_timer_enable) {
-			mod_timer(&devpriv->ao_timer,
+			timer_mod(&devpriv->ao_timer,
 				  jiffies + usecs_to_jiffies(time_inc));
 		}
 		spin_unlock(&dev->spinlock);
diff --git a/drivers/comedi/drivers/das16.c b/drivers/comedi/drivers/das16.c
index 5e0866d5d1d6..94b4befcf21c 100644
--- a/drivers/comedi/drivers/das16.c
+++ b/drivers/comedi/drivers/das16.c
@@ -525,7 +525,7 @@ static void das16_timer_interrupt(struct timer_list *t)
 
 	spin_lock_irqsave(&dev->spinlock, flags);
 	if (devpriv->timer_running)
-		mod_timer(&devpriv->timer, jiffies + timer_period());
+		timer_mod(&devpriv->timer, jiffies + timer_period());
 	spin_unlock_irqrestore(&dev->spinlock, flags);
 }
 
diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index cf10804eef73..a9f09b805192 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -653,7 +653,7 @@ static inline void  queue_gpstate_timer(struct global_pstate_info *gpstates)
 	else
 		timer_interval = GPSTATE_TIMER_INTERVAL;
 
-	mod_timer(&gpstates->timer, jiffies + msecs_to_jiffies(timer_interval));
+	timer_mod(&gpstates->timer, jiffies + msecs_to_jiffies(timer_interval));
 }
 
 /**
diff --git a/drivers/crypto/axis/artpec6_crypto.c b/drivers/crypto/axis/artpec6_crypto.c
index 75ee065da1ec..cb58b56f0ab2 100644
--- a/drivers/crypto/axis/artpec6_crypto.c
+++ b/drivers/crypto/axis/artpec6_crypto.c
@@ -2065,7 +2065,7 @@ static void artpec6_crypto_process_queue(struct artpec6_crypto *ac,
 	 * no noticeable negative effect if we timeout spuriously.
 	 */
 	if (ac->pending_count)
-		mod_timer(&ac->timer, jiffies + msecs_to_jiffies(100));
+		timer_mod(&ac->timer, jiffies + msecs_to_jiffies(100));
 	else
 		timer_delete(&ac->timer);
 }
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 50b3d28eff47..0a4fe4c87c50 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -398,7 +398,7 @@ static int test_wait_timeout(void *arg)
 		goto err_free;
 	}
 
-	mod_timer(&wt.timer, jiffies + 1);
+	timer_mod(&wt.timer, jiffies + 1);
 
 	if (dma_fence_wait_timeout(wt.f, false, 2) == -ETIME) {
 		if (timer_pending(&wt.timer)) {
diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index d4a7e8eaf901..4b57df3bf9fd 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -433,7 +433,7 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 				/* FIXME: The timeout should probably be
 				 * configurable
 				 */
-				mod_timer(&imxdmac->watchdog,
+				timer_mod(&imxdmac->watchdog,
 					jiffies + msecs_to_jiffies(500));
 
 				tmp |= CCR_CEN | CCR_RPT | CCR_ACRPT;
diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
index f5f5f221db42..aba1193a91fb 100644
--- a/drivers/dma/ioat/dma.c
+++ b/drivers/dma/ioat/dma.c
@@ -251,7 +251,7 @@ static void __ioat_restart_chan(struct ioatdma_chan *ioat_chan)
 	/* set the tail to be re-issued */
 	ioat_chan->issued = ioat_chan->tail;
 	ioat_chan->dmacount = 0;
-	mod_timer(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);
+	timer_mod(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);
 
 	dev_dbg(to_dev(ioat_chan),
 		"%s: head: %#x tail: %#x issued: %#x count: %#x\n",
@@ -317,7 +317,7 @@ static dma_cookie_t ioat_tx_submit_unlock(struct dma_async_tx_descriptor *tx)
 	dev_dbg(to_dev(ioat_chan), "%s: cookie: %d\n", __func__, cookie);
 
 	if (!test_and_set_bit(IOAT_CHAN_ACTIVE, &ioat_chan->state))
-		mod_timer(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);
+		timer_mod(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);
 
 	/* make descriptor updates visible before advancing ioat->head,
 	 * this is purposefully not smp_wmb() since we are also
@@ -488,7 +488,7 @@ int ioat_check_space_lock(struct ioatdma_chan *ioat_chan, int num_descs)
 	 */
 	if (time_is_before_jiffies(ioat_chan->timer.expires)
 	    && timer_pending(&ioat_chan->timer)) {
-		mod_timer(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);
+		timer_mod(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);
 		ioat_timer_event(&ioat_chan->timer);
 	}
 
@@ -548,7 +548,7 @@ static bool ioat_cleanup_preamble(struct ioatdma_chan *ioat_chan,
 		return false;
 
 	clear_bit(IOAT_COMPLETION_ACK, &ioat_chan->state);
-	mod_timer(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);
+	timer_mod(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);
 
 	return true;
 }
@@ -874,7 +874,7 @@ static void ioat_eh(struct ioatdma_chan *ioat_chan)
 static void check_active(struct ioatdma_chan *ioat_chan)
 {
 	if (ioat_ring_active(ioat_chan)) {
-		mod_timer(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);
+		timer_mod(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);
 		return;
 	}
 
@@ -978,7 +978,7 @@ void ioat_timer_event(struct timer_list *t)
 	}
 
 	set_bit(IOAT_COMPLETION_ACK, &ioat_chan->state);
-	mod_timer(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);
+	timer_mod(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);
 unlock_out:
 	spin_unlock_bh(&ioat_chan->cleanup_lock);
 }
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index ea2ad71c1a5d..feddc7023c98 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -141,7 +141,7 @@ static void start_split_transaction_timeout(struct fw_transaction *t,
 		return;
 
 	t->is_split_transaction = true;
-	mod_timer(&t->split_timeout_timer,
+	timer_mod(&t->split_timeout_timer,
 		  jiffies + card->split_timeout_jiffies);
 }
 
diff --git a/drivers/firmware/psci/psci_checker.c b/drivers/firmware/psci/psci_checker.c
index b662b7e28b80..66026728c73a 100644
--- a/drivers/firmware/psci/psci_checker.c
+++ b/drivers/firmware/psci/psci_checker.c
@@ -309,7 +309,7 @@ static int suspend_test_thread(void *arg)
 			 * suspend_cpu() takes care of switching to a broadcast
 			 * tick, so the timer will still wake us up.
 			 */
-			mod_timer(&wakeup_timer, jiffies +
+			timer_mod(&wakeup_timer, jiffies +
 				  usecs_to_jiffies(state->target_residency));
 
 			/* IRQs must be disabled during suspend operations. */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 44f5319166bf..e76574469a4d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -253,7 +253,7 @@ int amdgpu_fence_emit_polling(struct amdgpu_ring *ring, uint32_t *s,
  */
 static void amdgpu_fence_schedule_fallback(struct amdgpu_ring *ring)
 {
-	mod_timer(&ring->fence_drv.fallback_timer,
+	timer_mod(&ring->fence_drv.fallback_timer,
 		  jiffies + AMDGPU_FENCE_JIFFIES_TIMEOUT);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
index f847d18f3b4a..8195001fe665 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
@@ -130,7 +130,7 @@ static void amdgpu_mux_resubmit_chunks(struct amdgpu_ring_mux *mux)
 
 static void amdgpu_ring_mux_schedule_resubmit(struct amdgpu_ring_mux *mux)
 {
-	mod_timer(&mux->resubmit_timer, jiffies + AMDGPU_MUX_RESUBMIT_JIFFIES_TIMEOUT);
+	timer_mod(&mux->resubmit_timer, jiffies + AMDGPU_MUX_RESUBMIT_JIFFIES_TIMEOUT);
 }
 
 static void amdgpu_mux_resubmit_fallback(struct timer_list *t)
diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
index 28a4e843e425..4b8b118f01e6 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -761,7 +761,7 @@ static void tda998x_edid_delay_done(struct timer_list *t)
 static void tda998x_edid_delay_start(struct tda998x_priv *priv)
 {
 	priv->edid_delay_active = true;
-	mod_timer(&priv->edid_delay_timer, jiffies + HZ/10);
+	timer_mod(&priv->edid_delay_timer, jiffies + HZ/10);
 }
 
 static int tda998x_edid_delay_wait(struct tda998x_priv *priv)
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index dac121faa2e0..4e64aeb0cec6 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1254,7 +1254,7 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 		else if (vblank_offdelay < 0)
 			vblank_disable_fn(&vblank->disable_timer);
 		else if (!vblank->config.disable_immediate)
-			mod_timer(&vblank->disable_timer,
+			timer_mod(&vblank->disable_timer,
 				  jiffies + ((vblank_offdelay * HZ) / 1000));
 	}
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index a6c88eea4ef6..adb1d56c5ae2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -98,7 +98,7 @@ static int vidi_enable_vblank(struct exynos_drm_crtc *crtc)
 	if (ctx->suspended)
 		return -EPERM;
 
-	mod_timer(&ctx->timer,
+	timer_mod(&ctx->timer,
 		jiffies + msecs_to_jiffies(VIDI_REFRESH_TIME) - 1);
 
 	return 0;
@@ -162,7 +162,7 @@ static void vidi_fake_vblank_timer(struct timer_list *t)
 	struct vidi_context *ctx = timer_container_of(ctx, t, timer);
 
 	if (drm_crtc_handle_vblank(&ctx->crtc->base))
-		mod_timer(&ctx->timer,
+		timer_mod(&ctx->timer,
 			jiffies + msecs_to_jiffies(VIDI_REFRESH_TIME) - 1);
 }
 
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 6982cb13de12..31d2b04b0b91 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -250,7 +250,7 @@ static int gud_usb_bulk(struct gud_device *gdrm, size_t len)
 		return ret;
 
 	timer_setup_on_stack(&ctx.timer, gud_usb_bulk_timeout, 0);
-	mod_timer(&ctx.timer, jiffies + msecs_to_jiffies(3000));
+	timer_mod(&ctx.timer, jiffies + msecs_to_jiffies(3000));
 
 	usb_sg_wait(&ctx.sgr);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index f8226a11dd7c..4820f503f9d7 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -146,7 +146,7 @@ static void rps_timer(struct timer_list *t)
 			rps->last_adj = 0;
 		}
 
-		mod_timer(&rps->timer,
+		timer_mod(&rps->timer,
 			  jiffies + msecs_to_jiffies(rps->pm_interval));
 		rps->pm_interval = min(rps->pm_interval * 2, BUSY_MAX_EI);
 	}
@@ -156,7 +156,7 @@ static void rps_start_timer(struct intel_rps *rps)
 {
 	rps->pm_timestamp = ktime_sub(ktime_get(), rps->pm_timestamp);
 	rps->pm_interval = 1;
-	mod_timer(&rps->timer, jiffies + 1);
+	timer_mod(&rps->timer, jiffies + 1);
 }
 
 static void rps_stop_timer(struct intel_rps *rps)
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index 79741f043f03..f9fab3160dbd 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -125,7 +125,7 @@ static void hw_delay_complete(struct timer_list *t)
 	 */
 	while ((request = first_request(engine))) {
 		if (request->mock.delay) {
-			mod_timer(&engine->hw_delay,
+			timer_mod(&engine->hw_delay,
 				  jiffies + request->mock.delay);
 			break;
 		}
@@ -245,7 +245,7 @@ static void mock_submit_request(struct i915_request *request)
 	list_add_tail(&request->mock.link, &engine->hw_queue);
 	if (list_is_first(&request->mock.link, &engine->hw_queue)) {
 		if (request->mock.delay)
-			mod_timer(&engine->hw_delay,
+			timer_mod(&engine->hw_delay,
 				  jiffies + request->mock.delay);
 		else
 			advance(request);
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 0454eb1814bb..2860656c61c8 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -2493,7 +2493,7 @@ static int live_suppress_self_preempt(void *arg)
 		}
 
 		/* Keep postponing the timer to avoid premature slicing */
-		mod_timer(&engine->execlists.timer, jiffies + HZ);
+		timer_mod(&engine->execlists.timer, jiffies + HZ);
 		for (depth = 0; depth < 8; depth++) {
 			rq_b = spinner_create_request(&b.spin,
 						      b.ctx, engine,
diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index 0f6589260e33..8b1261bfdd4f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -640,7 +640,7 @@ static int live_emit_pte_full_ring(void *arg)
 				    I915_EMIT_PTE_NUM_DWORDS * sizeof(u32)));
 
 	timer_setup_on_stack(&st.timer, spinner_kill, 0);
-	mod_timer(&st.timer, jiffies + 2 * HZ);
+	timer_mod(&st.timer, jiffies + 2 * HZ);
 
 	/*
 	 * This should wait for the spinner to be killed, otherwise we should go
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index dadc7641e574..56367b22f524 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -517,7 +517,7 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 
 		timer_setup(&timer->timer,
 			    timer_i915_sw_fence_wake, TIMER_IRQSAFE);
-		mod_timer(&timer->timer, round_jiffies_up(jiffies + timeout));
+		timer_mod(&timer->timer, round_jiffies_up(jiffies + timeout));
 
 		func = dma_i915_sw_fence_wake_timer;
 	}
diff --git a/drivers/gpu/drm/i915/i915_utils.c b/drivers/gpu/drm/i915/i915_utils.c
index b60c28fbd207..f5d8f6e2318b 100644
--- a/drivers/gpu/drm/i915/i915_utils.c
+++ b/drivers/gpu/drm/i915/i915_utils.c
@@ -74,7 +74,7 @@ void set_timer_ms(struct timer_list *t, unsigned long timeout)
 	barrier();
 
 	/* Keep t->expires = 0 reserved to indicate a canceled timer. */
-	mod_timer(t, jiffies + timeout ?: 1);
+	timer_mod(t, jiffies + timeout ?: 1);
 }
 
 bool i915_vtd_active(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 51561b190b93..555b8eaee58b 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -187,7 +187,7 @@ void intel_wakeref_auto(struct intel_wakeref_auto *wf, unsigned long timeout)
 	 * callback and so need to cancel the local inc by running the
 	 * elided callback to keep the wf->count balanced.
 	 */
-	if (mod_timer(&wf->timer, jiffies + timeout))
+	if (timer_mod(&wf->timer, jiffies + timeout))
 		wakeref_auto_timeout(&wf->timer);
 }
 
diff --git a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
index 47703716c9f2..7b32188f6572 100644
--- a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
+++ b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
@@ -67,7 +67,7 @@ void timed_fence_init(struct timed_fence *tf, unsigned long expires)
 	timer_setup_on_stack(&tf->timer, timed_fence_wake, 0);
 
 	if (time_after(expires, jiffies))
-		mod_timer(&tf->timer, expires);
+		timer_mod(&tf->timer, expires);
 	else
 		i915_sw_fence_commit(&tf->fence);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 9b3b27b4d480..7ef99f83531a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1995,7 +1995,7 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 			       sizeof(mtk_dp->info.audio_cur_cfg));
 
 			mtk_dp->need_debounce = false;
-			mod_timer(&mtk_dp->debounce_timer,
+			timer_mod(&mtk_dp->debounce_timer,
 				  jiffies + msecs_to_jiffies(100) - 1);
 		}
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 58a86c84e5a8..f80b1eaddf1c 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -155,7 +155,7 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
 	a5xx_gpu->next_ring = ring;
 
 	/* Start a timer to catch a stuck preemption */
-	mod_timer(&a5xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
+	timer_mod(&a5xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
 
 	/* Set the preemption state to triggered */
 	set_preempt_state(a5xx_gpu, PREEMPT_TRIGGERED);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 502453dfcff2..cdc865cd2fb3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -312,7 +312,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	a6xx_gpu->next_ring = ring;
 
 	/* Start a timer to catch a stuck preemption */
-	mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
+	timer_mod(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
 
 	/* Enable or disable postamble as needed */
 	sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 51844072bfed..40ffb62c0d30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2126,7 +2126,7 @@ void dpu_encoder_start_frame_done_timer(struct drm_encoder *drm_enc)
 			drm_mode_vrefresh(&drm_enc->crtc->state->adjusted_mode);
 
 	atomic_set(&dpu_enc->frame_done_timeout_ms, timeout_ms);
-	mod_timer(&dpu_enc->frame_done_timer,
+	timer_mod(&dpu_enc->frame_done_timer,
 			jiffies + msecs_to_jiffies(timeout_ms));
 
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 197871fdf508..d5208fedb03c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -500,7 +500,7 @@ static void fault_worker(struct kthread_work *work)
 static void hangcheck_timer_reset(struct msm_gpu *gpu)
 {
 	struct msm_drm_private *priv = gpu->dev->dev_private;
-	mod_timer(&gpu->hangcheck_timer,
+	timer_mod(&gpu->hangcheck_timer,
 			round_jiffies_up(jiffies + msecs_to_jiffies(priv->hangcheck_period)));
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 9b9cc593790c..29bc2bc0c0f5 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3160,7 +3160,7 @@ static void dsi_update_screen_dispc(struct dsi_data *dsi)
 		dsi_vc_send_bta(dsi, vc);
 
 #ifdef DSI_CATCH_MISSING_TE
-		mod_timer(&dsi->te_timer, jiffies + msecs_to_jiffies(250));
+		timer_mod(&dsi->te_timer, jiffies + msecs_to_jiffies(250));
 #endif
 	}
 }
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index 3042d0f7a117..60f8c3f52619 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -196,7 +196,7 @@ static int threaded_ttm_bo_reserve(void *arg)
 	timer_setup_on_stack(&s_timer.timer, &signal_for_ttm_bo_reserve, 0);
 	s_timer.ctx = &ctx;
 
-	mod_timer(&s_timer.timer, msecs_to_jiffies(100));
+	timer_mod(&s_timer.timer, msecs_to_jiffies(100));
 
 	err = ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
 
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 4aaa587be3a5..ff067811d05a 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -526,7 +526,7 @@ static void vc4_bo_cache_free_old(struct drm_device *dev)
 		struct vc4_bo *bo = list_last_entry(&vc4->bo_cache.time_list,
 						    struct vc4_bo, unref_head);
 		if (time_before(expire_time, bo->free_time)) {
-			mod_timer(&vc4->bo_cache.time_timer,
+			timer_mod(&vc4->bo_cache.time_timer,
 				  round_jiffies_up(jiffies +
 						   msecs_to_jiffies(1000)));
 			return;
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 255e5817618e..9519d2c999d2 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -42,7 +42,7 @@ vc4_queue_hangcheck(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	mod_timer(&vc4->hangcheck.timer,
+	timer_mod(&vc4->hangcheck.timer,
 		  round_jiffies_up(jiffies + msecs_to_jiffies(100)));
 }
 
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index 145ea549fc0a..1cdd1f19c07e 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -97,7 +97,7 @@ static struct dma_fence *vgem_fence_create(struct vgem_file *vfile,
 	timer_setup(&fence->timer, vgem_fence_timeout, 0);
 
 	/* We force the fence to expire within 10s to prevent driver hangs */
-	mod_timer(&fence->timer, jiffies + VGEM_FENCE_TIMEOUT);
+	timer_mod(&fence->timer, jiffies + VGEM_FENCE_TIMEOUT);
 
 	return &fence->base;
 }
diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 0639b1f43d88..be1f7618c7b6 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -618,7 +618,7 @@ static void apple_battery_timer_tick(struct timer_list *t)
 	struct hid_device *hdev = asc->hdev;
 
 	if (apple_fetch_battery(hdev) == 0) {
-		mod_timer(&asc->battery_timer,
+		timer_mod(&asc->battery_timer,
 			  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
 	}
 }
@@ -934,7 +934,7 @@ static int apple_probe(struct hid_device *hdev,
 	}
 
 	timer_setup(&asc->battery_timer, apple_battery_timer_tick, 0);
-	mod_timer(&asc->battery_timer,
+	timer_mod(&asc->battery_timer,
 		  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
 	apple_fetch_battery(hdev);
 
diff --git a/drivers/hid/hid-appleir.c b/drivers/hid/hid-appleir.c
index 5e8ced7bc05a..d8851c80b0ae 100644
--- a/drivers/hid/hid-appleir.c
+++ b/drivers/hid/hid-appleir.c
@@ -217,7 +217,7 @@ static int appleir_raw_event(struct hid_device *hid, struct hid_report *report,
 			 * the test above, or here set a timer which pulls
 			 * them up after 1/8 s
 			 */
-			mod_timer(&appleir->key_up_timer, jiffies + HZ / 8);
+			timer_mod(&appleir->key_up_timer, jiffies + HZ / 8);
 			appleir->prev_key_idx = 0;
 		} else
 			/* Remember key for next packet */
@@ -234,7 +234,7 @@ static int appleir_raw_event(struct hid_device *hid, struct hid_report *report,
 		 * Remote doesn't do key up, either pull them up, in the test
 		 * above, or here set a timer which pulls them up after 1/8 s
 		 */
-		mod_timer(&appleir->key_up_timer, jiffies + HZ / 8);
+		timer_mod(&appleir->key_up_timer, jiffies + HZ / 8);
 		goto out;
 	}
 
diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index b32776ceac0a..8eda00070da6 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -172,7 +172,7 @@ static void appletb_inactivity_timer(struct timer_list *t)
 		if (!kbd->has_dimmed) {
 			backlight_device_set_brightness(kbd->backlight_dev, 1);
 			kbd->has_dimmed = true;
-			mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_idle_timeout * 1000));
+			timer_mod(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_idle_timeout * 1000));
 		} else if (!kbd->has_turned_off) {
 			backlight_device_set_brightness(kbd->backlight_dev, 0);
 			kbd->has_turned_off = true;
@@ -188,7 +188,7 @@ static void reset_inactivity_timer(struct appletb_kbd *kbd)
 			kbd->has_dimmed = false;
 			kbd->has_turned_off = false;
 		}
-		mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_dim_timeout * 1000));
+		timer_mod(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_dim_timeout * 1000));
 	}
 }
 
@@ -407,7 +407,7 @@ static int appletb_kbd_probe(struct hid_device *hdev, const struct hid_device_id
 	} else {
 		backlight_device_set_brightness(kbd->backlight_dev, 2);
 		timer_setup(&kbd->inactivity_timer, appletb_inactivity_timer, 0);
-		mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_dim_timeout * 1000));
+		timer_mod(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_dim_timeout * 1000));
 	}
 
 	kbd->inp_handler.event = appletb_kbd_inp_event;
diff --git a/drivers/hid/hid-letsketch.c b/drivers/hid/hid-letsketch.c
index 4df42c5b6e88..8e47405dec91 100644
--- a/drivers/hid/hid-letsketch.c
+++ b/drivers/hid/hid-letsketch.c
@@ -190,7 +190,7 @@ static int letsketch_raw_event(struct hid_device *hdev,
 		 * There is no out of range event, so use a timer for this
 		 * when in range we get an event approx. every 8 ms.
 		 */
-		mod_timer(&data->inrange_timer, jiffies + msecs_to_jiffies(100));
+		timer_mod(&data->inrange_timer, jiffies + msecs_to_jiffies(100));
 		break;
 	case 0xe0: /* Pad data */
 		input = data->input_tablet_pad;
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 4c6a0ef64e0d..dff8dc363285 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -813,7 +813,7 @@ static void magicmouse_battery_timer_tick(struct timer_list *t)
 	struct hid_device *hdev = msc->hdev;
 
 	if (magicmouse_fetch_battery(hdev) == 0) {
-		mod_timer(&msc->battery_timer,
+		timer_mod(&msc->battery_timer,
 			  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
 	}
 }
@@ -851,7 +851,7 @@ static int magicmouse_probe(struct hid_device *hdev,
 	}
 
 	timer_setup(&msc->battery_timer, magicmouse_battery_timer_tick, 0);
-	mod_timer(&msc->battery_timer,
+	timer_mod(&msc->battery_timer,
 		  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
 	magicmouse_fetch_battery(hdev);
 
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 3d6dee383b6f..7faa7f2d464c 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1296,7 +1296,7 @@ static void mt_touch_report(struct hid_device *hid,
 	 */
 	if (app->quirks & MT_QUIRK_STICKY_FINGERS) {
 		if (test_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags))
-			mod_timer(&td->release_timer,
+			timer_mod(&td->release_timer,
 				  jiffies + msecs_to_jiffies(100));
 		else
 			timer_delete(&td->release_timer);
diff --git a/drivers/hid/hid-nvidia-shield.c b/drivers/hid/hid-nvidia-shield.c
index b0c40a245bf8..43e27b35def8 100644
--- a/drivers/hid/hid-nvidia-shield.c
+++ b/drivers/hid/hid-nvidia-shield.c
@@ -537,7 +537,7 @@ static void thunderstrike_psy_stats_timer_handler(struct timer_list *timer)
 
 	thunderstrike_request_psy_stats(ts);
 	/* Query battery statistics from device every five minutes */
-	mod_timer(timer, jiffies + 300 * HZ);
+	timer_mod(timer, jiffies + 300 * HZ);
 }
 
 static void
diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
index 74bddb2c3e82..d347e0ade0f9 100644
--- a/drivers/hid/hid-prodikeys.c
+++ b/drivers/hid/hid-prodikeys.c
@@ -354,7 +354,7 @@ static int pcmidi_handle_report3(struct pcmidi_snd *pm, u8 *data, int size)
 						pms->velocity = velocity;
 						pms->in_use = 1;
 
-						mod_timer(&pms->timer,
+						timer_mod(&pms->timer,
 							jiffies +
 					msecs_to_jiffies(pm->midi_sustain));
 						return 1;
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index b966e4044238..540da765c6ee 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -539,7 +539,7 @@ static void ghl_magic_poke_cb(struct urb *urb)
 	if (urb->status < 0)
 		hid_err(sc->hdev, "URB transfer failed : %d", urb->status);
 
-	mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
+	timer_mod(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
 }
 
 static void ghl_magic_poke(struct timer_list *t)
@@ -2146,7 +2146,7 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		}
 
 		timer_setup(&sc->ghl_poke_timer, ghl_magic_poke, 0);
-		mod_timer(&sc->ghl_poke_timer,
+		timer_mod(&sc->ghl_poke_timer,
 			  jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
 	}
 
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index 435c52cecf69..7e04f5101887 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -324,7 +324,7 @@ static int uclogic_raw_event_pen(struct uclogic_drvdata *drvdata,
 		/* Set in-range bit */
 		data[1] |= 0x40;
 		/* (Re-)start in-range timeout */
-		mod_timer(&drvdata->inrange_timer,
+		timer_mod(&drvdata->inrange_timer,
 				jiffies + msecs_to_jiffies(100));
 	}
 	/* If we report tilt and Y direction is flipped */
diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 5b5fc460a4c5..f258843f6f3c 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -900,7 +900,7 @@ static void wiimote_init_detect(struct wiimote_data *wdata)
 	spin_lock_irq(&wdata->state.lock);
 	if (!(wdata->state.flags & WIIPROTO_FLAG_BUILTIN_MP) &&
 	    !(wdata->state.flags & WIIPROTO_FLAG_NO_MP))
-		mod_timer(&wdata->timer, jiffies + HZ * 4);
+		timer_mod(&wdata->timer, jiffies + HZ * 4);
 	spin_unlock_irq(&wdata->state.lock);
 }
 
@@ -930,7 +930,7 @@ static void wiimote_init_poll_mp(struct wiimote_data *wdata)
 		wiimote_mp_unload(wdata);
 	}
 
-	mod_timer(&wdata->timer, jiffies + HZ * 4);
+	timer_mod(&wdata->timer, jiffies + HZ * 4);
 }
 
 /*
@@ -1176,7 +1176,7 @@ static void wiimote_init_hotplug(struct wiimote_data *wdata)
 		/* reschedule MP hotplug timer */
 		if (!(flags & WIIPROTO_FLAG_BUILTIN_MP) &&
 		    !(flags & WIIPROTO_FLAG_NO_MP))
-			mod_timer(&wdata->timer, jiffies + HZ * 4);
+			timer_mod(&wdata->timer, jiffies + HZ * 4);
 	}
 
 	spin_lock_irq(&wdata->state.lock);
diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index be325495c132..53464700088d 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -176,7 +176,7 @@ static void hid_io_error(struct hid_device *hid)
 		}
 	}
 
-	mod_timer(&usbhid->io_retry,
+	timer_mod(&usbhid->io_retry,
 			jiffies + msecs_to_jiffies(usbhid->retry_delay));
 done:
 	spin_unlock_irqrestore(&usbhid->lock, flags);
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 955b39d22524..98033ca97f15 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2416,7 +2416,7 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
 		value = field->logical_maximum - value;
 		break;
 	case HID_DG_INRANGE:
-		mod_timer(&wacom->idleprox_timer, jiffies + msecs_to_jiffies(100));
+		timer_mod(&wacom->idleprox_timer, jiffies + msecs_to_jiffies(100));
 		wacom_wac->hid_data.inrange_state = value;
 		if (!(features->quirks & WACOM_QUIRK_SENSE))
 			wacom_wac->hid_data.sense_state = value;
diff --git a/drivers/hsi/clients/ssi_protocol.c b/drivers/hsi/clients/ssi_protocol.c
index d10a01f3eb9e..e3c18362938e 100644
--- a/drivers/hsi/clients/ssi_protocol.c
+++ b/drivers/hsi/clients/ssi_protocol.c
@@ -291,9 +291,9 @@ static void ssip_set_rxstate(struct ssi_protocol *ssi, unsigned int state)
 			break;
 		fallthrough;
 	case RECEIVING:
-		mod_timer(&ssi->keep_alive, jiffies +
+		timer_mod(&ssi->keep_alive, jiffies +
 						msecs_to_jiffies(SSIP_KATOUT));
-		mod_timer(&ssi->rx_wd, jiffies + msecs_to_jiffies(SSIP_WDTOUT));
+		timer_mod(&ssi->rx_wd, jiffies + msecs_to_jiffies(SSIP_WDTOUT));
 		break;
 	default:
 		break;
@@ -313,9 +313,9 @@ static void ssip_set_txstate(struct ssi_protocol *ssi, unsigned int state)
 	case WAIT4READY:
 	case SENDING:
 	case SENDING_SWBREAK:
-		mod_timer(&ssi->keep_alive,
+		timer_mod(&ssi->keep_alive,
 				jiffies + msecs_to_jiffies(SSIP_KATOUT));
-		mod_timer(&ssi->tx_wd, jiffies + msecs_to_jiffies(SSIP_WDTOUT));
+		timer_mod(&ssi->tx_wd, jiffies + msecs_to_jiffies(SSIP_WDTOUT));
 		break;
 	default:
 		break;
@@ -474,7 +474,7 @@ static void ssip_keep_alive(struct timer_list *t)
 			spin_unlock(&ssi->lock);
 			return;
 		}
-	mod_timer(&ssi->keep_alive, jiffies + msecs_to_jiffies(SSIP_KATOUT));
+	timer_mod(&ssi->keep_alive, jiffies + msecs_to_jiffies(SSIP_KATOUT));
 	spin_unlock(&ssi->lock);
 }
 
@@ -679,7 +679,7 @@ static void ssip_rx_bootinforeq(struct hsi_client *cl, u32 cmd)
 
 		spin_lock_bh(&ssi->lock);
 		/* Start boot handshake watchdog */
-		mod_timer(&ssi->tx_wd, jiffies + msecs_to_jiffies(SSIP_WDTOUT));
+		timer_mod(&ssi->tx_wd, jiffies + msecs_to_jiffies(SSIP_WDTOUT));
 		spin_unlock_bh(&ssi->lock);
 		dev_dbg(&cl->device, "Send BOOTINFO_RESP\n");
 		if (SSIP_DATA_VERSION(cmd) != SSIP_LOCAL_VERID)
@@ -705,7 +705,7 @@ static void ssip_rx_bootinforesp(struct hsi_client *cl, u32 cmd)
 	spin_lock_bh(&ssi->lock);
 	if (ssi->main_state != ACTIVE)
 		/* Use tx_wd as a boot watchdog in non ACTIVE state */
-		mod_timer(&ssi->tx_wd, jiffies + msecs_to_jiffies(SSIP_WDTOUT));
+		timer_mod(&ssi->tx_wd, jiffies + msecs_to_jiffies(SSIP_WDTOUT));
 	else
 		dev_dbg(&cl->device, "boot info resp ignored M(%d)\n",
 							ssi->main_state);
diff --git a/drivers/hte/hte-tegra194-test.c b/drivers/hte/hte-tegra194-test.c
index 94e931f45305..ff412b2716fc 100644
--- a/drivers/hte/hte-tegra194-test.c
+++ b/drivers/hte/hte-tegra194-test.c
@@ -82,7 +82,7 @@ static void gpio_timer_cb(struct timer_list *t)
 	(void)t;
 
 	gpiod_set_value(hte.gpio_out, !gpiod_get_value(hte.gpio_out));
-	mod_timer(&hte.timer, jiffies + msecs_to_jiffies(8000));
+	timer_mod(&hte.timer, jiffies + msecs_to_jiffies(8000));
 }
 
 static irqreturn_t tegra_hte_test_gpio_isr(int irq, void *data)
@@ -195,7 +195,7 @@ static int tegra_hte_test_probe(struct platform_device *pdev)
 	}
 
 	timer_setup(&hte.timer, gpio_timer_cb, 0);
-	mod_timer(&hte.timer, jiffies + msecs_to_jiffies(5000));
+	timer_mod(&hte.timer, jiffies + msecs_to_jiffies(5000));
 
 	return 0;
 
diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 0c03bbadaddb..42a7a5cf057f 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -96,7 +96,7 @@ static void sample_timer(struct timer_list *t)
 		ctx->sample_start = ktime_get();
 	}
 
-	mod_timer(&ctx->rpm_timer, jiffies + HZ);
+	timer_mod(&ctx->rpm_timer, jiffies + HZ);
 }
 
 static void pwm_fan_enable_mode_2_state(int enable_mode,
@@ -643,7 +643,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	if (ctx->tach_count > 0) {
 		ctx->sample_start = ktime_get();
-		mod_timer(&ctx->rpm_timer, jiffies + HZ);
+		timer_mod(&ctx->rpm_timer, jiffies + HZ);
 
 		channels[1] = &ctx->fan_channel;
 	}
diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 3278707bb885..20232a4f1d67 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -595,7 +595,7 @@ static void img_i2c_read(struct img_i2c *i2c)
 	img_i2c_writel(i2c, SCB_READ_ADDR_REG, i2c->msg.addr);
 	img_i2c_writel(i2c, SCB_READ_COUNT_REG, i2c->msg.len);
 
-	mod_timer(&i2c->check_timer, jiffies + msecs_to_jiffies(1));
+	timer_mod(&i2c->check_timer, jiffies + msecs_to_jiffies(1));
 }
 
 /* Start a write transaction in automatic mode */
@@ -608,7 +608,7 @@ static void img_i2c_write(struct img_i2c *i2c)
 	img_i2c_writel(i2c, SCB_WRITE_ADDR_REG, i2c->msg.addr);
 	img_i2c_writel(i2c, SCB_WRITE_COUNT_REG, i2c->msg.len);
 
-	mod_timer(&i2c->check_timer, jiffies + msecs_to_jiffies(1));
+	timer_mod(&i2c->check_timer, jiffies + msecs_to_jiffies(1));
 	img_i2c_write_fifo(i2c);
 
 	/* img_i2c_write_fifo() may modify int_enable */
@@ -876,7 +876,7 @@ static unsigned int img_i2c_auto(struct img_i2c *i2c,
 		i2c->int_enable &= ~INT_SLAVE_EVENT;
 	}
 
-	mod_timer(&i2c->check_timer, jiffies + msecs_to_jiffies(1));
+	timer_mod(&i2c->check_timer, jiffies + msecs_to_jiffies(1));
 
 	if (int_status & INT_STOP_DETECTED) {
 		/* Drain remaining data in FIFO and complete transaction */
diff --git a/drivers/iio/common/ssp_sensors/ssp_dev.c b/drivers/iio/common/ssp_sensors/ssp_dev.c
index a6ffb64a1187..bc0708c2b26e 100644
--- a/drivers/iio/common/ssp_sensors/ssp_dev.c
+++ b/drivers/iio/common/ssp_sensors/ssp_dev.c
@@ -180,12 +180,12 @@ static void ssp_wdt_timer_func(struct timer_list *t)
 	    data->com_fail_cnt > SSP_LIMIT_RESET_CNT)
 		queue_work(system_power_efficient_wq, &data->work_wdt);
 _mod:
-	mod_timer(&data->wdt_timer, jiffies + msecs_to_jiffies(SSP_WDT_TIME));
+	timer_mod(&data->wdt_timer, jiffies + msecs_to_jiffies(SSP_WDT_TIME));
 }
 
 static void ssp_enable_wdt_timer(struct ssp_data *data)
 {
-	mod_timer(&data->wdt_timer, jiffies + msecs_to_jiffies(SSP_WDT_TIME));
+	timer_mod(&data->wdt_timer, jiffies + msecs_to_jiffies(SSP_WDT_TIME));
 }
 
 static void ssp_disable_wdt_timer(struct ssp_data *data)
diff --git a/drivers/infiniband/hw/hfi1/aspm.c b/drivers/infiniband/hw/hfi1/aspm.c
index 79990d09522b..1f77d80f3e89 100644
--- a/drivers/infiniband/hw/hfi1/aspm.c
+++ b/drivers/infiniband/hw/hfi1/aspm.c
@@ -158,7 +158,7 @@ void __aspm_ctx_disable(struct hfi1_ctxtdata *rcd)
 	}
 
 	if (restart_timer) {
-		mod_timer(&rcd->aspm_timer,
+		timer_mod(&rcd->aspm_timer,
 			  jiffies + msecs_to_jiffies(ASPM_TIMER_MS));
 		rcd->aspm_ts_timer_sched = now;
 	}
diff --git a/drivers/infiniband/hw/hfi1/chip.c b/drivers/infiniband/hw/hfi1/chip.c
index a5eb009a0db7..a4f41487252c 100644
--- a/drivers/infiniband/hw/hfi1/chip.c
+++ b/drivers/infiniband/hw/hfi1/chip.c
@@ -5562,7 +5562,7 @@ static void update_rcverr_timer(struct timer_list *t)
 	}
 	dd->rcv_ovfl_cnt = (u32)cur_ovfl_cnt;
 
-	mod_timer(&dd->rcverr_timer, jiffies + HZ * RCVERR_CHECK_TIME);
+	timer_mod(&dd->rcverr_timer, jiffies + HZ * RCVERR_CHECK_TIME);
 }
 
 static int init_rcverr(struct hfi1_devdata *dd)
@@ -5570,7 +5570,7 @@ static int init_rcverr(struct hfi1_devdata *dd)
 	timer_setup(&dd->rcverr_timer, update_rcverr_timer, 0);
 	/* Assume the hardware counter has been reset */
 	dd->rcv_ovfl_cnt = 0;
-	return mod_timer(&dd->rcverr_timer, jiffies + HZ * RCVERR_CHECK_TIME);
+	return timer_mod(&dd->rcverr_timer, jiffies + HZ * RCVERR_CHECK_TIME);
 }
 
 static void free_rcverr(struct hfi1_devdata *dd)
@@ -12590,7 +12590,7 @@ static void update_synth_timer(struct timer_list *t)
 	struct hfi1_devdata *dd = timer_container_of(dd, t, synth_stats_timer);
 
 	queue_work(dd->update_cntr_wq, &dd->update_cntr_work);
-	mod_timer(&dd->synth_stats_timer, jiffies + HZ * SYNTH_CNT_TIME);
+	timer_mod(&dd->synth_stats_timer, jiffies + HZ * SYNTH_CNT_TIME);
 }
 
 #define C_MAX_NAME 16 /* 15 chars + one for /0 */
@@ -12833,7 +12833,7 @@ static int init_cntrs(struct hfi1_devdata *dd)
 
 	INIT_WORK(&dd->update_cntr_work, do_update_synth_timer);
 
-	mod_timer(&dd->synth_stats_timer, jiffies + HZ * SYNTH_CNT_TIME);
+	timer_mod(&dd->synth_stats_timer, jiffies + HZ * SYNTH_CNT_TIME);
 	return 0;
 bail:
 	free_cntrs(dd);
diff --git a/drivers/infiniband/hw/hfi1/driver.c b/drivers/infiniband/hw/hfi1/driver.c
index 2d12278ec96a..d8979b959188 100644
--- a/drivers/infiniband/hw/hfi1/driver.c
+++ b/drivers/infiniband/hw/hfi1/driver.c
@@ -1332,7 +1332,7 @@ static void run_led_override(struct timer_list *t)
 	/* Set up for next phase */
 	ppd->led_override_phase = !ppd->led_override_phase;
 
-	mod_timer(&ppd->led_override_timer, jiffies + timeout);
+	timer_mod(&ppd->led_override_timer, jiffies + timeout);
 }
 
 /*
diff --git a/drivers/infiniband/hw/hfi1/mad.c b/drivers/infiniband/hw/hfi1/mad.c
index 961fa07116f0..66d67bbbd8f4 100644
--- a/drivers/infiniband/hw/hfi1/mad.c
+++ b/drivers/infiniband/hw/hfi1/mad.c
@@ -172,7 +172,7 @@ static struct trap_node *check_and_add_trap(struct hfi1_ibport *ibp,
 		 */
 		timeout = (RVT_TRAP_TIMEOUT *
 			   (1UL << ibp->rvp.subnet_timeout)) / 1000;
-		mod_timer(&ibp->rvp.trap_timer,
+		timer_mod(&ibp->rvp.trap_timer,
 			  jiffies + usecs_to_jiffies(timeout));
 		node = list_first_entry(&trap_list->list, struct trap_node,
 					list);
diff --git a/drivers/infiniband/hw/hfi1/sdma.c b/drivers/infiniband/hw/hfi1/sdma.c
index 24c0704544a5..9a335f149e03 100644
--- a/drivers/infiniband/hw/hfi1/sdma.c
+++ b/drivers/infiniband/hw/hfi1/sdma.c
@@ -460,7 +460,7 @@ static void sdma_err_progress_check_schedule(struct sdma_engine *sde)
 		dd_dev_err(sde->dd,
 			   "SDMA engine %d - check scheduled\n",
 				sde->this_idx);
-		mod_timer(&sde->err_progress_check_timer, jiffies + 10);
+		timer_mod(&sde->err_progress_check_timer, jiffies + 10);
 	}
 }
 
diff --git a/drivers/infiniband/hw/hfi1/tid_rdma.c b/drivers/infiniband/hw/hfi1/tid_rdma.c
index 73a600aea617..ef66645180d3 100644
--- a/drivers/infiniband/hw/hfi1/tid_rdma.c
+++ b/drivers/infiniband/hw/hfi1/tid_rdma.c
@@ -3954,7 +3954,7 @@ static void hfi1_mod_tid_reap_timer(struct rvt_qp *qp)
 
 	lockdep_assert_held(&qp->s_lock);
 	qpriv->s_flags |= HFI1_R_TID_RSC_TIMER;
-	mod_timer(&qpriv->s_tid_timer, jiffies +
+	timer_mod(&qpriv->s_tid_timer, jiffies +
 		  qpriv->tid_timer_timeout_jiffies);
 }
 
@@ -4770,7 +4770,7 @@ static void hfi1_mod_tid_retry_timer(struct rvt_qp *qp)
 
 	lockdep_assert_held(&qp->s_lock);
 	priv->s_flags |= HFI1_S_TID_RETRY_TIMER;
-	mod_timer(&priv->s_tid_retry_timer, jiffies +
+	timer_mod(&priv->s_tid_retry_timer, jiffies +
 		  priv->tid_retry_timeout_jiffies + rdi->busy_jiffies);
 }
 
diff --git a/drivers/infiniband/hw/hfi1/verbs.c b/drivers/infiniband/hw/hfi1/verbs.c
index 3cbbfccdd8cd..72801e7fb225 100644
--- a/drivers/infiniband/hw/hfi1/verbs.c
+++ b/drivers/infiniband/hw/hfi1/verbs.c
@@ -570,7 +570,7 @@ static void mem_timer(struct timer_list *t)
 		priv->s_iowait.lock = NULL;
 		/* refcount held until actual wake up */
 		if (!list_empty(list))
-			mod_timer(&dev->mem_timer, jiffies + 1);
+			timer_mod(&dev->mem_timer, jiffies + 1);
 	}
 	write_sequnlock_irqrestore(&dev->iowait_lock, flags);
 
@@ -615,7 +615,7 @@ void hfi1_wait_kmem(struct rvt_qp *qp)
 
 	if (list_empty(&priv->s_iowait.list)) {
 		if (list_empty(&dev->memwait))
-			mod_timer(&dev->mem_timer, jiffies + 1);
+			timer_mod(&dev->mem_timer, jiffies + 1);
 		qp->s_flags |= RVT_S_WAIT_KMEM;
 		list_add_tail(&priv->s_iowait.list, &dev->memwait);
 		priv->s_iowait.lock = &dev->iowait_lock;
diff --git a/drivers/infiniband/hw/irdma/utils.c b/drivers/infiniband/hw/irdma/utils.c
index 32e775e07afb..b394a37d5a2e 100644
--- a/drivers/infiniband/hw/irdma/utils.c
+++ b/drivers/infiniband/hw/irdma/utils.c
@@ -1545,7 +1545,7 @@ static void irdma_hw_stats_timeout(struct timer_list *t)
 	else
 		irdma_cqp_gather_stats_gen1(sc_vsi->dev, sc_vsi->pestat);
 
-	mod_timer(&pf_devstat->stats_timer,
+	timer_mod(&pf_devstat->stats_timer,
 		  jiffies + msecs_to_jiffies(STATS_TIMER_DELAY));
 }
 
@@ -1558,7 +1558,7 @@ void irdma_hw_stats_start_timer(struct irdma_sc_vsi *vsi)
 	struct irdma_vsi_pestat *devstat = vsi->pestat;
 
 	timer_setup(&devstat->stats_timer, irdma_hw_stats_timeout, 0);
-	mod_timer(&devstat->stats_timer,
+	timer_mod(&devstat->stats_timer,
 		  jiffies + msecs_to_jiffies(STATS_TIMER_DELAY));
 }
 
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 2747b160d199..08a80f8abe99 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -205,7 +205,7 @@ static void create_mkey_callback(int status, struct mlx5_async_work *context)
 		ent->pending--;
 		WRITE_ONCE(dev->fill_delay, 1);
 		spin_unlock_irqrestore(&ent->mkeys_queue.lock, flags);
-		mod_timer(&dev->delay_timer, jiffies + HZ);
+		timer_mod(&dev->delay_timer, jiffies + HZ);
 		return;
 	}
 
diff --git a/drivers/infiniband/hw/mthca/mthca_catas.c b/drivers/infiniband/hw/mthca/mthca_catas.c
index 4331aa00c6a7..1ab5b29999df 100644
--- a/drivers/infiniband/hw/mthca/mthca_catas.c
+++ b/drivers/infiniband/hw/mthca/mthca_catas.c
@@ -141,7 +141,7 @@ static void poll_catas(struct timer_list *t)
 			return;
 		}
 
-	mod_timer(&dev->catas_err.timer,
+	timer_mod(&dev->catas_err.timer,
 		  round_jiffies(jiffies + MTHCA_CATAS_POLL_INTERVAL));
 }
 
diff --git a/drivers/infiniband/hw/qib/qib_driver.c b/drivers/infiniband/hw/qib/qib_driver.c
index c3cdf14d32e0..d53c7f727e06 100644
--- a/drivers/infiniband/hw/qib/qib_driver.c
+++ b/drivers/infiniband/hw/qib/qib_driver.c
@@ -678,7 +678,7 @@ static void qib_run_led_override(struct timer_list *t)
 	 * it fire one more time after they turn it off to simplify
 	 */
 	if (ppd->led_override_vals[0] || ppd->led_override_vals[1])
-		mod_timer(&ppd->led_override_timer, jiffies + timeoff);
+		timer_mod(&ppd->led_override_timer, jiffies + timeoff);
 }
 
 void qib_set_led_override(struct qib_pportdata *ppd, unsigned int val)
@@ -716,7 +716,7 @@ void qib_set_led_override(struct qib_pportdata *ppd, unsigned int val)
 		timer_add(&ppd->led_override_timer);
 	} else {
 		if (ppd->led_override_vals[0] || ppd->led_override_vals[1])
-			mod_timer(&ppd->led_override_timer, jiffies + 1);
+			timer_mod(&ppd->led_override_timer, jiffies + 1);
 		atomic_dec(&ppd->led_override_timer_active);
 	}
 }
diff --git a/drivers/infiniband/hw/qib/qib_iba6120.c b/drivers/infiniband/hw/qib/qib_iba6120.c
index bb9d089fac7a..17c229b8876c 100644
--- a/drivers/infiniband/hw/qib/qib_iba6120.c
+++ b/drivers/infiniband/hw/qib/qib_iba6120.c
@@ -2642,7 +2642,7 @@ static void qib_get_6120_faststats(struct timer_list *t)
 
 	qib_chk_6120_errormask(dd);
 done:
-	mod_timer(&dd->stats_timer, jiffies + HZ * ACTIVITY_TIMER);
+	timer_mod(&dd->stats_timer, jiffies + HZ * ACTIVITY_TIMER);
 }
 
 /* no interrupt fallback for these chips */
@@ -2915,7 +2915,7 @@ static void pma_6120_timer(struct timer_list *t)
 		cs->pma_sample_status = IB_PMA_SAMPLE_STATUS_RUNNING;
 		qib_snapshot_counters(ppd, &cs->sword, &cs->rword,
 				      &cs->spkts, &cs->rpkts, &cs->xmit_wait);
-		mod_timer(&cs->pma_timer,
+		timer_mod(&cs->pma_timer,
 		      jiffies + usecs_to_jiffies(ibp->rvp.pma_sample_interval));
 	} else if (cs->pma_sample_status == IB_PMA_SAMPLE_STATUS_RUNNING) {
 		u64 ta, tb, tc, td, te;
@@ -2942,12 +2942,12 @@ static void qib_set_cntr_6120_sample(struct qib_pportdata *ppd, u32 intv,
 
 	if (start && intv) {
 		cs->pma_sample_status = IB_PMA_SAMPLE_STATUS_STARTED;
-		mod_timer(&cs->pma_timer, jiffies + usecs_to_jiffies(start));
+		timer_mod(&cs->pma_timer, jiffies + usecs_to_jiffies(start));
 	} else if (intv) {
 		cs->pma_sample_status = IB_PMA_SAMPLE_STATUS_RUNNING;
 		qib_snapshot_counters(ppd, &cs->sword, &cs->rword,
 				      &cs->spkts, &cs->rpkts, &cs->xmit_wait);
-		mod_timer(&cs->pma_timer, jiffies + usecs_to_jiffies(intv));
+		timer_mod(&cs->pma_timer, jiffies + usecs_to_jiffies(intv));
 	} else {
 		cs->pma_sample_status = IB_PMA_SAMPLE_STATUS_DONE;
 		cs->sword = 0;
diff --git a/drivers/infiniband/hw/qib/qib_iba7220.c b/drivers/infiniband/hw/qib/qib_iba7220.c
index 2731185dad97..e7de3eb75c8e 100644
--- a/drivers/infiniband/hw/qib/qib_iba7220.c
+++ b/drivers/infiniband/hw/qib/qib_iba7220.c
@@ -3265,7 +3265,7 @@ static void qib_get_7220_faststats(struct timer_list *t)
 	dd->traffic_wds += traffic_wds;
 	spin_unlock_irqrestore(&dd->eep_st_lock, flags);
 done:
-	mod_timer(&dd->stats_timer, jiffies + HZ * ACTIVITY_TIMER);
+	timer_mod(&dd->stats_timer, jiffies + HZ * ACTIVITY_TIMER);
 }
 
 /*
diff --git a/drivers/infiniband/hw/qib/qib_iba7322.c b/drivers/infiniband/hw/qib/qib_iba7322.c
index f5beacbd2c46..3ad2e2ad4361 100644
--- a/drivers/infiniband/hw/qib/qib_iba7322.c
+++ b/drivers/infiniband/hw/qib/qib_iba7322.c
@@ -5128,7 +5128,7 @@ static void qib_get_7322_faststats(struct timer_list *t)
 			force_h1(ppd);
 		}
 	}
-	mod_timer(&dd->stats_timer, jiffies + HZ * ACTIVITY_TIMER);
+	timer_mod(&dd->stats_timer, jiffies + HZ * ACTIVITY_TIMER);
 }
 
 /*
diff --git a/drivers/infiniband/hw/qib/qib_init.c b/drivers/infiniband/hw/qib/qib_init.c
index 1c45814f5646..a5578725649b 100644
--- a/drivers/infiniband/hw/qib/qib_init.c
+++ b/drivers/infiniband/hw/qib/qib_init.c
@@ -509,7 +509,7 @@ static void verify_interrupt(struct timer_list *t)
 			dev_err(&dd->pcidev->dev,
 				"No interrupts detected, not usable.\n");
 		else /* re-arm the timer to see if fallback works */
-			mod_timer(&dd->intrchk_timer, jiffies + HZ/2);
+			timer_mod(&dd->intrchk_timer, jiffies + HZ/2);
 	}
 }
 
@@ -757,9 +757,9 @@ int qib_init(struct qib_devdata *dd, int reinit)
 		 * Setup to verify we get an interrupt, and fallback
 		 * to an alternate if necessary and possible.
 		 */
-		mod_timer(&dd->intrchk_timer, jiffies + HZ/2);
+		timer_mod(&dd->intrchk_timer, jiffies + HZ/2);
 		/* start stats retrieval timer */
-		mod_timer(&dd->stats_timer, jiffies + HZ * ACTIVITY_TIMER);
+		timer_mod(&dd->stats_timer, jiffies + HZ * ACTIVITY_TIMER);
 	}
 
 	/* if ret is non-zero, we probably should do some cleanup here... */
diff --git a/drivers/infiniband/hw/qib/qib_intr.c b/drivers/infiniband/hw/qib/qib_intr.c
index 008cb4b7bd83..7305217fff5d 100644
--- a/drivers/infiniband/hw/qib/qib_intr.c
+++ b/drivers/infiniband/hw/qib/qib_intr.c
@@ -133,7 +133,7 @@ void qib_handle_e_ibstatuschanged(struct qib_pportdata *ppd, u64 ibcs)
 			}
 			spin_unlock_irqrestore(&ppd->lflags_lock, flags);
 			/* start a 75msec timer to clear symbol errors */
-			mod_timer(&ppd->symerr_clear_timer,
+			timer_mod(&ppd->symerr_clear_timer,
 				  msecs_to_jiffies(75));
 		} else if (ltstate == IB_PHYSPORTSTATE_LINKUP &&
 			   !(ppd->lflags & QIBL_LINKACTIVE)) {
diff --git a/drivers/infiniband/hw/qib/qib_mad.c b/drivers/infiniband/hw/qib/qib_mad.c
index a8d909afa4e6..b1af407517db 100644
--- a/drivers/infiniband/hw/qib/qib_mad.c
+++ b/drivers/infiniband/hw/qib/qib_mad.c
@@ -2417,7 +2417,7 @@ static void xmit_wait_timer_func(struct timer_list *t)
 	dd->f_set_cntr_sample(ppd, QIB_CONG_TIMER_PSINTERVAL, 0x0);
 done:
 	spin_unlock_irqrestore(&ppd->ibport_data.rvp.lock, flags);
-	mod_timer(&ppd->cong_stats.timer, jiffies + HZ);
+	timer_mod(&ppd->cong_stats.timer, jiffies + HZ);
 }
 
 void qib_notify_create_mad_agent(struct rvt_dev_info *rdi, int port_idx)
diff --git a/drivers/infiniband/hw/qib/qib_sd7220.c b/drivers/infiniband/hw/qib/qib_sd7220.c
index 58cccc6c94e6..6bae29d2fe84 100644
--- a/drivers/infiniband/hw/qib/qib_sd7220.c
+++ b/drivers/infiniband/hw/qib/qib_sd7220.c
@@ -1410,7 +1410,7 @@ static void qib_run_relock(struct timer_list *t)
 		cs->relock_interval = timeoff;
 	} else
 		timeoff = HZ;
-	mod_timer(&cs->relock_timer, jiffies + timeoff);
+	timer_mod(&cs->relock_timer, jiffies + timeoff);
 }
 
 void set_7220_relock_poll(struct qib_devdata *dd, int ibup)
@@ -1421,7 +1421,7 @@ void set_7220_relock_poll(struct qib_devdata *dd, int ibup)
 		/* We are now up, relax timer to 1 second interval */
 		if (cs->relock_timer_active) {
 			cs->relock_interval = HZ;
-			mod_timer(&cs->relock_timer, jiffies + HZ);
+			timer_mod(&cs->relock_timer, jiffies + HZ);
 		}
 	} else {
 		/* Transition to down, (re-)set timer to short interval. */
@@ -1439,7 +1439,7 @@ void set_7220_relock_poll(struct qib_devdata *dd, int ibup)
 			timer_add(&cs->relock_timer);
 		} else {
 			cs->relock_interval = timeout;
-			mod_timer(&cs->relock_timer, jiffies + timeout);
+			timer_mod(&cs->relock_timer, jiffies + timeout);
 		}
 	}
 }
diff --git a/drivers/infiniband/hw/qib/qib_tx.c b/drivers/infiniband/hw/qib/qib_tx.c
index bac1bd975fb0..89edea8b3c9d 100644
--- a/drivers/infiniband/hw/qib/qib_tx.c
+++ b/drivers/infiniband/hw/qib/qib_tx.c
@@ -522,13 +522,13 @@ void qib_hol_down(struct qib_pportdata *ppd)
 /*
  * Link is at INIT.
  * We start the HoL timer so we can detect stuck packets blocking SMP replies.
- * Timer may already be running, so use mod_timer, not timer_add.
+ * Timer may already be running, so use timer_mod, not timer_add.
  */
 void qib_hol_init(struct qib_pportdata *ppd)
 {
 	if (ppd->hol_state != QIB_HOL_INIT) {
 		ppd->hol_state = QIB_HOL_INIT;
-		mod_timer(&ppd->hol_timer,
+		timer_mod(&ppd->hol_timer,
 			  jiffies + msecs_to_jiffies(qib_hol_timeout_ms));
 	}
 }
@@ -560,7 +560,7 @@ void qib_hol_event(struct timer_list *t)
 		 * SMP replies.
 		 */
 		qib_hol_down(ppd);
-		mod_timer(&ppd->hol_timer,
+		timer_mod(&ppd->hol_timer,
 			  jiffies + msecs_to_jiffies(qib_hol_timeout_ms));
 	}
 }
diff --git a/drivers/infiniband/hw/qib/qib_verbs.c b/drivers/infiniband/hw/qib/qib_verbs.c
index bab657f93084..ce0bec788172 100644
--- a/drivers/infiniband/hw/qib/qib_verbs.c
+++ b/drivers/infiniband/hw/qib/qib_verbs.c
@@ -374,7 +374,7 @@ static void mem_timer(struct timer_list *t)
 		list_del_init(&priv->iowait);
 		rvt_get_qp(qp);
 		if (!list_empty(list))
-			mod_timer(&dev->mem_timer, jiffies + 1);
+			timer_mod(&dev->mem_timer, jiffies + 1);
 	}
 	spin_unlock_irqrestore(&dev->rdi.pending_lock, flags);
 
@@ -754,7 +754,7 @@ static int wait_kmem(struct qib_ibdev *dev, struct rvt_qp *qp)
 		spin_lock(&dev->rdi.pending_lock);
 		if (list_empty(&priv->iowait)) {
 			if (list_empty(&dev->memwait))
-				mod_timer(&dev->mem_timer, jiffies + 1);
+				timer_mod(&dev->mem_timer, jiffies + 1);
 			qp->s_flags |= RVT_S_WAIT_KMEM;
 			list_add_tail(&priv->iowait, &dev->memwait);
 		}
diff --git a/drivers/infiniband/sw/rxe/rxe_comp.c b/drivers/infiniband/sw/rxe/rxe_comp.c
index a5b2b62f596b..b34a114b07db 100644
--- a/drivers/infiniband/sw/rxe/rxe_comp.c
+++ b/drivers/infiniband/sw/rxe/rxe_comp.c
@@ -629,7 +629,7 @@ static void reset_retry_timer(struct rxe_qp *qp)
 		spin_lock_irqsave(&qp->state_lock, flags);
 		if (qp_state(qp) >= IB_QPS_RTS &&
 		    psn_compare(qp->req.psn, qp->comp.psn) > 0)
-			mod_timer(&qp->retrans_timer,
+			timer_mod(&qp->retrans_timer,
 				  jiffies + qp->qp_timeout_jiffies);
 		spin_unlock_irqrestore(&qp->state_lock, flags);
 	}
@@ -808,7 +808,7 @@ int rxe_completer(struct rxe_qp *qp)
 				qp->req.wait_for_rnr_timer = 1;
 				rxe_dbg_qp(qp, "set rnr nak timer\n");
 				// TODO who protects from destroy_qp??
-				mod_timer(&qp->rnr_nak_timer,
+				timer_mod(&qp->rnr_nak_timer,
 					  jiffies + rnrnak_jiffies(aeth_syn(pkt)
 						& ~AETH_TYPE_MASK));
 				goto exit;
diff --git a/drivers/infiniband/sw/rxe/rxe_req.c b/drivers/infiniband/sw/rxe/rxe_req.c
index 373b03f223be..8e70a5c5b346 100644
--- a/drivers/infiniband/sw/rxe/rxe_req.c
+++ b/drivers/infiniband/sw/rxe/rxe_req.c
@@ -586,7 +586,7 @@ static void update_state(struct rxe_qp *qp, struct rxe_pkt_info *pkt)
 	qp->need_req_skb = 0;
 
 	if (qp->qp_timeout_jiffies && !timer_pending(&qp->retrans_timer))
-		mod_timer(&qp->retrans_timer,
+		timer_mod(&qp->retrans_timer,
 			  jiffies + qp->qp_timeout_jiffies);
 }
 
diff --git a/drivers/input/ff-memless.c b/drivers/input/ff-memless.c
index 91636479ee3c..70f5b4040f17 100644
--- a/drivers/input/ff-memless.c
+++ b/drivers/input/ff-memless.c
@@ -139,7 +139,7 @@ static void ml_schedule_timer(struct ml_device *ml)
 		timer_delete(&ml->timer);
 	} else {
 		pr_debug("timer set\n");
-		mod_timer(&ml->timer, earliest);
+		timer_mod(&ml->timer, earliest);
 	}
 }
 
diff --git a/drivers/input/gameport/gameport.c b/drivers/input/gameport/gameport.c
index a419315b436d..ce72f2c57797 100644
--- a/drivers/input/gameport/gameport.c
+++ b/drivers/input/gameport/gameport.c
@@ -179,7 +179,7 @@ void gameport_start_polling(struct gameport *gameport)
 	if (!gameport->poll_cnt++) {
 		BUG_ON(!gameport->poll_handler);
 		BUG_ON(!gameport->poll_interval);
-		mod_timer(&gameport->poll_timer, jiffies + msecs_to_jiffies(gameport->poll_interval));
+		timer_mod(&gameport->poll_timer, jiffies + msecs_to_jiffies(gameport->poll_interval));
 	}
 
 	spin_unlock(&gameport->timer_lock);
@@ -203,7 +203,7 @@ static void gameport_run_poll_handler(struct timer_list *t)
 
 	gameport->poll_handler(gameport);
 	if (gameport->poll_cnt)
-		mod_timer(&gameport->poll_timer, jiffies + msecs_to_jiffies(gameport->poll_interval));
+		timer_mod(&gameport->poll_timer, jiffies + msecs_to_jiffies(gameport->poll_interval));
 }
 
 /*
diff --git a/drivers/input/input.c b/drivers/input/input.c
index 44887e51e049..56a9f1e6ce51 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -89,7 +89,7 @@ static void input_start_autorepeat(struct input_dev *dev, int code)
 	    dev->rep[REP_PERIOD] && dev->rep[REP_DELAY] &&
 	    dev->timer.function) {
 		dev->repeat_key = code;
-		mod_timer(&dev->timer,
+		timer_mod(&dev->timer,
 			  jiffies + msecs_to_jiffies(dev->rep[REP_DELAY]));
 	}
 }
@@ -2262,7 +2262,7 @@ static void input_repeat_key(struct timer_list *t)
 		input_handle_event(dev, EV_SYN, SYN_REPORT, 1);
 
 		if (dev->rep[REP_PERIOD])
-			mod_timer(&dev->timer, jiffies +
+			timer_mod(&dev->timer, jiffies +
 					msecs_to_jiffies(dev->rep[REP_PERIOD]));
 	}
 }
diff --git a/drivers/input/joystick/db9.c b/drivers/input/joystick/db9.c
index d5c67a927404..a6fb4c9f3dd1 100644
--- a/drivers/input/joystick/db9.c
+++ b/drivers/input/joystick/db9.c
@@ -498,7 +498,7 @@ static void db9_timer(struct timer_list *t)
 
 	input_sync(dev);
 
-	mod_timer(&db9->timer, jiffies + DB9_REFRESH_TIME);
+	timer_mod(&db9->timer, jiffies + DB9_REFRESH_TIME);
 }
 
 static int db9_open(struct input_dev *dev)
@@ -514,7 +514,7 @@ static int db9_open(struct input_dev *dev)
 				parport_data_reverse(port);
 				parport_write_control(port, DB9_NORMAL);
 			}
-			mod_timer(&db9->timer, jiffies + DB9_REFRESH_TIME);
+			timer_mod(&db9->timer, jiffies + DB9_REFRESH_TIME);
 		}
 
 		return 0;
diff --git a/drivers/input/joystick/gamecon.c b/drivers/input/joystick/gamecon.c
index ae95cb3d0ae9..0cf48bc35a16 100644
--- a/drivers/input/joystick/gamecon.c
+++ b/drivers/input/joystick/gamecon.c
@@ -759,7 +759,7 @@ static void gc_timer(struct timer_list *t)
 	if (gc->pad_count[GC_PSX] || gc->pad_count[GC_DDR])
 		gc_psx_process_packet(gc);
 
-	mod_timer(&gc->timer, jiffies + GC_REFRESH_TIME);
+	timer_mod(&gc->timer, jiffies + GC_REFRESH_TIME);
 }
 
 static int gc_open(struct input_dev *dev)
@@ -770,7 +770,7 @@ static int gc_open(struct input_dev *dev)
 		if (!gc->used++) {
 			parport_claim(gc->pd);
 			parport_write_control(gc->pd->port, 0x04);
-			mod_timer(&gc->timer, jiffies + GC_REFRESH_TIME);
+			timer_mod(&gc->timer, jiffies + GC_REFRESH_TIME);
 		}
 
 		return 0;
diff --git a/drivers/input/joystick/n64joy.c b/drivers/input/joystick/n64joy.c
index 94d2f4e96fe6..b75f19f638db 100644
--- a/drivers/input/joystick/n64joy.c
+++ b/drivers/input/joystick/n64joy.c
@@ -185,7 +185,7 @@ static void n64joy_poll(struct timer_list *t)
 		input_sync(dev);
 	}
 
-	mod_timer(&priv->timer, jiffies + msecs_to_jiffies(16));
+	timer_mod(&priv->timer, jiffies + msecs_to_jiffies(16));
 }
 
 static int n64joy_open(struct input_dev *dev)
@@ -199,7 +199,7 @@ static int n64joy_open(struct input_dev *dev)
 			 * if the poll point slightly changes.
 			 */
 			timer_setup(&priv->timer, n64joy_poll, 0);
-			mod_timer(&priv->timer, jiffies + msecs_to_jiffies(16));
+			timer_mod(&priv->timer, jiffies + msecs_to_jiffies(16));
 		}
 
 		priv->n64joy_opened++;
diff --git a/drivers/input/joystick/turbografx.c b/drivers/input/joystick/turbografx.c
index 5f69aef01791..1a761596bf14 100644
--- a/drivers/input/joystick/turbografx.c
+++ b/drivers/input/joystick/turbografx.c
@@ -97,7 +97,7 @@ static void tgfx_timer(struct timer_list *t)
 			input_sync(dev);
 		}
 
-	mod_timer(&tgfx->timer, jiffies + TGFX_REFRESH_TIME);
+	timer_mod(&tgfx->timer, jiffies + TGFX_REFRESH_TIME);
 }
 
 static int tgfx_open(struct input_dev *dev)
@@ -108,7 +108,7 @@ static int tgfx_open(struct input_dev *dev)
 		if (!tgfx->used++) {
 			parport_claim(tgfx->pd);
 			parport_write_control(tgfx->pd->port, 0x04);
-			mod_timer(&tgfx->timer, jiffies + TGFX_REFRESH_TIME);
+			timer_mod(&tgfx->timer, jiffies + TGFX_REFRESH_TIME);
 		}
 
 		return 0;
diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
index 69e511a8a605..d92246d11dcc 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -223,7 +223,7 @@ static void imx_keypad_check_for_events(struct timer_list *t)
 	 * in the near future.
 	 */
 	if (keypad->stable_count < IMX_KEYPAD_SCANS_FOR_STABILITY) {
-		mod_timer(&keypad->check_matrix_timer,
+		timer_mod(&keypad->check_matrix_timer,
 			  jiffies + msecs_to_jiffies(10));
 		return;
 	}
@@ -271,7 +271,7 @@ static void imx_keypad_check_for_events(struct timer_list *t)
 		 * the KRI interrupt to react quickly to key release
 		 * event.
 		 */
-		mod_timer(&keypad->check_matrix_timer,
+		timer_mod(&keypad->check_matrix_timer,
 			  jiffies + msecs_to_jiffies(60));
 
 		reg_val = readw(keypad->mmio_base + KPSR);
@@ -303,7 +303,7 @@ static irqreturn_t imx_keypad_irq_handler(int irq, void *dev_id)
 		keypad->stable_count = 0;
 
 		/* Schedule the scanning procedure near in the future */
-		mod_timer(&keypad->check_matrix_timer,
+		timer_mod(&keypad->check_matrix_timer,
 			  jiffies + msecs_to_jiffies(2));
 	}
 
diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
index 58d4f2096cf9..0ffe67f587a8 100644
--- a/drivers/input/keyboard/locomokbd.c
+++ b/drivers/input/keyboard/locomokbd.c
@@ -163,7 +163,7 @@ static void locomokbd_scankeyboard(struct locomokbd *locomokbd)
 
 	/* if any keys are pressed, enable the timer */
 	if (num_pressed)
-		mod_timer(&locomokbd->timer, jiffies + SCAN_INTERVAL);
+		timer_mod(&locomokbd->timer, jiffies + SCAN_INTERVAL);
 	else
 		locomokbd->count_cancel = 0;
 }
diff --git a/drivers/input/keyboard/omap-keypad.c b/drivers/input/keyboard/omap-keypad.c
index 9e13f3f70a81..42e7793a65e4 100644
--- a/drivers/input/keyboard/omap-keypad.c
+++ b/drivers/input/keyboard/omap-keypad.c
@@ -130,7 +130,7 @@ static void omap_kp_tasklet(unsigned long data)
 	if (key_down) {
 		/* some key is pressed - keep irq disabled and use timer
 		 * to poll the keypad */
-		mod_timer(&omap_kp_data->timer, jiffies + HZ / 20);
+		timer_mod(&omap_kp_data->timer, jiffies + HZ / 20);
 	} else {
 		/* enable interrupts */
 		omap_writew(0, OMAP1_MPUIO_BASE + OMAP_MPUIO_KBD_MASKIT);
diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index 08a8fbfc43d5..136d7f02edb5 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -61,7 +61,7 @@ static void imx_imx_snvs_check_for_events(struct timer_list *t)
 
 	/* repeat check if pressed long */
 	if (state) {
-		mod_timer(&pdata->check_timer,
+		timer_mod(&pdata->check_timer,
 			  jiffies + msecs_to_jiffies(REPEAT_INTERVAL));
 	}
 }
@@ -89,7 +89,7 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 			input_sync(input);
 			pm_relax(input->dev.parent);
 		} else {
-			mod_timer(&pdata->check_timer,
+			timer_mod(&pdata->check_timer,
 			          jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
 		}
 	}
diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
index bc1c80a456f2..304027d3837b 100644
--- a/drivers/input/keyboard/tegra-kbc.c
+++ b/drivers/input/keyboard/tegra-kbc.c
@@ -257,7 +257,7 @@ static void tegra_kbc_keypress_timer(struct timer_list *t)
 		 * for the repoll delay.
 		 */
 		dly = (val == 1) ? kbc->repoll_dly : 1;
-		mod_timer(&kbc->timer, jiffies + msecs_to_jiffies(dly));
+		timer_mod(&kbc->timer, jiffies + msecs_to_jiffies(dly));
 	} else {
 		/* Release any pressed keys and exit the polling loop */
 		for (i = 0; i < kbc->num_pressed_keys; i++)
@@ -291,7 +291,7 @@ static irqreturn_t tegra_kbc_isr(int irq, void *args)
 		 * the polling loop in tegra_kbc_keypress_timer.
 		 */
 		tegra_kbc_set_fifo_interrupt(kbc, false);
-		mod_timer(&kbc->timer, jiffies + kbc->cp_dly_jiffies);
+		timer_mod(&kbc->timer, jiffies + kbc->cp_dly_jiffies);
 	} else if (val & KBC_INT_KEYPRESS_INT_STATUS) {
 		/* We can be here only through system resume path */
 		kbc->keypress_caused_wake = true;
diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
index 0c7b8f8ef4a5..727be14f3283 100644
--- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
+++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
@@ -63,7 +63,7 @@ static void bbnsm_pwrkey_check_for_events(struct timer_list *t)
 
 	/* repeat check if pressed long */
 	if (state)
-		mod_timer(&bbnsm->check_timer,
+		timer_mod(&bbnsm->check_timer,
 			  jiffies + msecs_to_jiffies(REPEAT_INTERVAL));
 }
 
@@ -92,7 +92,7 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
 		bbnsm->suspended = false;
 	}
 
-	mod_timer(&bbnsm->check_timer,
+	timer_mod(&bbnsm->check_timer,
 		   jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
 
 	/* clear PWR OFF */
diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index be734d65ea72..8e61b2dab545 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -1515,7 +1515,7 @@ static psmouse_ret_t alps_handle_interleaved_ps2(struct psmouse *psmouse)
 		 * psmouse core times out itself. 20 ms should be enough
 		 * to decide if we are getting more data or not.
 		 */
-		mod_timer(&priv->timer, jiffies + msecs_to_jiffies(20));
+		timer_mod(&priv->timer, jiffies + msecs_to_jiffies(20));
 		return PSMOUSE_GOOD_DATA;
 	}
 
diff --git a/drivers/input/mouse/byd.c b/drivers/input/mouse/byd.c
index 71aa23dd7d8d..19bbc1c35ae2 100644
--- a/drivers/input/mouse/byd.c
+++ b/drivers/input/mouse/byd.c
@@ -329,7 +329,7 @@ static psmouse_ret_t byd_process_byte(struct psmouse *psmouse)
 	/* Reset time since last touch. */
 	if (priv->touch) {
 		priv->last_touch_time = jiffies;
-		mod_timer(&priv->timer, jiffies + BYD_TOUCH_TIMEOUT);
+		timer_mod(&priv->timer, jiffies + BYD_TOUCH_TIMEOUT);
 	}
 
 	return PSMOUSE_FULL_PACKET;
diff --git a/drivers/input/serio/hil_mlc.c b/drivers/input/serio/hil_mlc.c
index 94e8bcbbf94d..d64835858263 100644
--- a/drivers/input/serio/hil_mlc.c
+++ b/drivers/input/serio/hil_mlc.c
@@ -745,7 +745,7 @@ static int hilse_donode(hil_mlc *mlc)
 
 		if (time_after(now, mlc->instart + mlc->intimeout))
 			 goto sched;
-		mod_timer(&hil_mlcs_kicker, mlc->instart + mlc->intimeout);
+		timer_mod(&hil_mlcs_kicker, mlc->instart + mlc->intimeout);
 		break;
 	sched:
 		tasklet_schedule(&hil_mlcs_tasklet);
@@ -799,7 +799,7 @@ static void hil_mlcs_timer(struct timer_list *unused)
 	tasklet_schedule(&hil_mlcs_tasklet);
 	/* Re-insert the periodic task. */
 	if (!timer_pending(&hil_mlcs_kicker))
-		mod_timer(&hil_mlcs_kicker, jiffies + HZ);
+		timer_mod(&hil_mlcs_kicker, jiffies + HZ);
 }
 
 /******************** user/kernel context functions **********************/
@@ -1008,7 +1008,7 @@ int hil_mlc_unregister(hil_mlc *mlc)
 static int __init hil_mlc_init(void)
 {
 	timer_setup(&hil_mlcs_kicker, &hil_mlcs_timer, 0);
-	mod_timer(&hil_mlcs_kicker, jiffies + HZ);
+	timer_mod(&hil_mlcs_kicker, jiffies + HZ);
 
 	tasklet_enable(&hil_mlcs_tasklet);
 
diff --git a/drivers/input/serio/hp_sdc.c b/drivers/input/serio/hp_sdc.c
index 05f6d96e0aa3..b2620d4571c7 100644
--- a/drivers/input/serio/hp_sdc.c
+++ b/drivers/input/serio/hp_sdc.c
@@ -795,7 +795,7 @@ static void hp_sdc_kicker(struct timer_list *unused)
 {
 	tasklet_schedule(&hp_sdc.task);
 	/* Re-insert the periodic task. */
-	mod_timer(&hp_sdc.kicker, jiffies + HZ);
+	timer_mod(&hp_sdc.kicker, jiffies + HZ);
 }
 
 /************************** Module Initialization ***************************/
diff --git a/drivers/input/touchscreen/ad7877.c b/drivers/input/touchscreen/ad7877.c
index c9aa1847265a..d29dbe9276a7 100644
--- a/drivers/input/touchscreen/ad7877.c
+++ b/drivers/input/touchscreen/ad7877.c
@@ -398,7 +398,7 @@ static irqreturn_t ad7877_irq(int irq, void *handle)
 	spin_lock_irqsave(&ts->lock, flags);
 	error = ad7877_process_data(ts);
 	if (!error)
-		mod_timer(&ts->timer, jiffies + TS_PEN_UP_TIMEOUT);
+		timer_mod(&ts->timer, jiffies + TS_PEN_UP_TIMEOUT);
 	spin_unlock_irqrestore(&ts->lock, flags);
 
 out:
diff --git a/drivers/input/touchscreen/ad7879.c b/drivers/input/touchscreen/ad7879.c
index f9db5cefb25b..9b6917345d41 100644
--- a/drivers/input/touchscreen/ad7879.c
+++ b/drivers/input/touchscreen/ad7879.c
@@ -253,7 +253,7 @@ static irqreturn_t ad7879_irq(int irq, void *handle)
 		dev_err_ratelimited(ts->dev, "failed to read %#02x: %d\n",
 				    AD7879_REG_XPLUS, error);
 	else if (!ad7879_report(ts))
-		mod_timer(&ts->timer, jiffies + TS_PEN_UP_TIMEOUT);
+		timer_mod(&ts->timer, jiffies + TS_PEN_UP_TIMEOUT);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
index 1f1157dd3be5..8b8721fb09d3 100644
--- a/drivers/input/touchscreen/bu21029_ts.c
+++ b/drivers/input/touchscreen/bu21029_ts.c
@@ -234,7 +234,7 @@ static irqreturn_t bu21029_touch_soft_irq(int irq, void *data)
 	bu21029_touch_report(bu21029, buf);
 
 	/* reset timer for pen up detection */
-	mod_timer(&bu21029->timer,
+	timer_mod(&bu21029->timer,
 		  jiffies + msecs_to_jiffies(PEN_UP_TIMEOUT_MS));
 
 out:
diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 28da7ba55a4b..884609455bcd 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -113,7 +113,7 @@ static void exc3000_timer(struct timer_list *t)
 
 static inline void exc3000_schedule_timer(struct exc3000_data *data)
 {
-	mod_timer(&data->timer, jiffies + msecs_to_jiffies(EXC3000_TIMEOUT_MS));
+	timer_mod(&data->timer, jiffies + msecs_to_jiffies(EXC3000_TIMEOUT_MS));
 }
 
 static void exc3000_shutdown_timer(void *timer)
diff --git a/drivers/input/touchscreen/sx8654.c b/drivers/input/touchscreen/sx8654.c
index 5fa47a1a6fdc..8002311f8d40 100644
--- a/drivers/input/touchscreen/sx8654.c
+++ b/drivers/input/touchscreen/sx8654.c
@@ -183,7 +183,7 @@ static irqreturn_t sx8650_irq(int irq, void *handle)
 	input_sync(ts->input);
 	dev_dbg(dev, "point(%4d,%4d)\n", x, y);
 
-	mod_timer(&ts->timer, jiffies + SX8650_PENIRQ_TIMEOUT);
+	timer_mod(&ts->timer, jiffies + SX8650_PENIRQ_TIMEOUT);
 	spin_unlock_irqrestore(&ts->lock, flags);
 
 	return IRQ_HANDLED;
diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchscreen/tsc200x-core.c
index 82d7d1cf5010..8517745e1871 100644
--- a/drivers/input/touchscreen/tsc200x-core.c
+++ b/drivers/input/touchscreen/tsc200x-core.c
@@ -183,7 +183,7 @@ static irqreturn_t tsc200x_irq_thread(int irq, void *_ts)
 
 	scoped_guard(spinlock_irqsave, &ts->lock) {
 		tsc200x_update_pen_state(ts, tsdata.x, tsdata.y, pressure);
-		mod_timer(&ts->penup_timer,
+		timer_mod(&ts->penup_timer,
 			  jiffies + msecs_to_jiffies(TSC200X_PENUP_TIME_MS));
 	}
 
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index d4352f13c172..86f8983a4db6 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -238,7 +238,7 @@ static void queue_iova(struct iommu_dma_cookie *cookie,
 	/* Avoid false sharing as much as possible. */
 	if (!atomic_read(&cookie->fq_timer_on) &&
 	    !atomic_xchg(&cookie->fq_timer_on, 1))
-		mod_timer(&cookie->fq_timer,
+		timer_mod(&cookie->fq_timer,
 			  jiffies + msecs_to_jiffies(cookie->options.fq_timeout));
 }
 
diff --git a/drivers/isdn/mISDN/l1oip_core.c b/drivers/isdn/mISDN/l1oip_core.c
index 76da7c5b4049..d0d281a8ab1c 100644
--- a/drivers/isdn/mISDN/l1oip_core.c
+++ b/drivers/isdn/mISDN/l1oip_core.c
@@ -277,7 +277,7 @@ l1oip_socket_send(struct l1oip *hc, u8 localcodec, u8 channel, u32 chanmask,
 
 	/* restart timer */
 	if (time_before(hc->keep_tl.expires, jiffies + 5 * HZ) && !hc->shutdown)
-		mod_timer(&hc->keep_tl, jiffies + L1OIP_KEEPALIVE * HZ);
+		timer_mod(&hc->keep_tl, jiffies + L1OIP_KEEPALIVE * HZ);
 	else
 		hc->keep_tl.expires = jiffies + L1OIP_KEEPALIVE * HZ;
 
@@ -606,7 +606,7 @@ l1oip_socket_parse(struct l1oip *hc, struct sockaddr_in *sin, u8 *buf, int len)
 	     !hc->timeout_on) &&
 	    !hc->shutdown) {
 		hc->timeout_on = 1;
-		mod_timer(&hc->timeout_tl, jiffies + L1OIP_TIMEOUT * HZ);
+		timer_mod(&hc->timeout_tl, jiffies + L1OIP_TIMEOUT * HZ);
 	} else /* only adjust timer */
 		hc->timeout_tl.expires = jiffies + L1OIP_TIMEOUT * HZ;
 
diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
index 6af0d2c7fc56..70b0e721854a 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -124,7 +124,7 @@ static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
 		/* Enable LED flash mode and set brightness */
 		rt8515_gpio_brightness_commit(rt->enable_flash, brightness);
 		/* Set timeout */
-		mod_timer(&rt->powerdown_timer,
+		timer_mod(&rt->powerdown_timer,
 			  jiffies + usecs_to_jiffies(timeout->val));
 	} else {
 		timer_delete_sync(&rt->powerdown_timer);
diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index 3e83200675f2..78d49c36569c 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -52,7 +52,7 @@ static int sgm3140_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
 		}
 		gpiod_set_value_cansleep(priv->flash_gpio, 1);
 		gpiod_set_value_cansleep(priv->enable_gpio, 1);
-		mod_timer(&priv->powerdown_timer,
+		timer_mod(&priv->powerdown_timer,
 			  jiffies + usecs_to_jiffies(priv->timeout));
 	} else {
 		timer_delete_sync(&priv->powerdown_timer);
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index bd451c77ce4d..33eb2313c0a0 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -116,7 +116,7 @@ static void led_timer_function(struct timer_list *t)
 		}
 	}
 
-	mod_timer(&led_cdev->blink_timer, jiffies + msecs_to_jiffies(delay));
+	timer_mod(&led_cdev->blink_timer, jiffies + msecs_to_jiffies(delay));
 }
 
 static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
@@ -213,7 +213,7 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
 	}
 
 	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
-	mod_timer(&led_cdev->blink_timer, jiffies + 1);
+	timer_mod(&led_cdev->blink_timer, jiffies + 1);
 }
 
 
diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigger/ledtrig-activity.c
index 1bccaef5eddf..b220e234aa2a 100644
--- a/drivers/leds/trigger/ledtrig-activity.c
+++ b/drivers/leds/trigger/ledtrig-activity.c
@@ -148,7 +148,7 @@ static void led_activity_function(struct timer_list *t)
 		activity_data->time_left = delay;
 
 	delay = min_t(int, activity_data->time_left, 100);
-	mod_timer(&activity_data->timer, jiffies + msecs_to_jiffies(delay));
+	timer_mod(&activity_data->timer, jiffies + msecs_to_jiffies(delay));
 }
 
 static ssize_t led_invert_show(struct device *dev,
diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
index 40eb61b6d54e..bc4b9f27abc1 100644
--- a/drivers/leds/trigger/ledtrig-heartbeat.c
+++ b/drivers/leds/trigger/ledtrig-heartbeat.c
@@ -88,7 +88,7 @@ static void led_heartbeat_function(struct timer_list *t)
 	}
 
 	led_set_brightness_nosleep(led_cdev, brightness);
-	mod_timer(&heartbeat_data->timer, jiffies + delay);
+	timer_mod(&heartbeat_data->timer, jiffies + delay);
 }
 
 static ssize_t led_invert_show(struct device *dev,
diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
index 1aac5e087242..9192f9d4eb52 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -103,7 +103,7 @@ static void pattern_trig_timer_restart(struct pattern_trig_data *data,
 	if (data->type == PATTERN_TYPE_HR)
 		hrtimer_forward_now(&data->hrtimer, ms_to_ktime(interval));
 	else
-		mod_timer(&data->timer, jiffies + msecs_to_jiffies(interval));
+		timer_mod(&data->timer, jiffies + msecs_to_jiffies(interval));
 }
 
 static void pattern_trig_timer_common_function(struct pattern_trig_data *data)
diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
index 20f1351464b1..9b4fb5caf42f 100644
--- a/drivers/leds/trigger/ledtrig-transient.c
+++ b/drivers/leds/trigger/ledtrig-transient.c
@@ -80,7 +80,7 @@ static ssize_t transient_activate_store(struct device *dev,
 		led_set_brightness_nosleep(led_cdev, transient_data->state);
 		transient_data->restore_state =
 		    (transient_data->state == LED_FULL) ? LED_OFF : LED_FULL;
-		mod_timer(&transient_data->timer,
+		timer_mod(&transient_data->timer,
 			  jiffies + msecs_to_jiffies(transient_data->duration));
 	}
 
diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
index a1534cc6c641..6346f1562202 100644
--- a/drivers/macintosh/smu.c
+++ b/drivers/macintosh/smu.c
@@ -792,7 +792,7 @@ static void smu_i2c_low_completion(struct smu_cmd *scmd, void *misc)
 			smu_i2c_retry(NULL);
 			return;
 		}
-		mod_timer(&smu->i2c_timer, jiffies + msecs_to_jiffies(5));
+		timer_mod(&smu->i2c_timer, jiffies + msecs_to_jiffies(5));
 		return;
 	}
 
diff --git a/drivers/mailbox/mailbox-altera.c b/drivers/mailbox/mailbox-altera.c
index 17278c2571d3..6c1734032ddf 100644
--- a/drivers/mailbox/mailbox-altera.c
+++ b/drivers/mailbox/mailbox-altera.c
@@ -134,7 +134,7 @@ static void altera_mbox_poll_rx(struct timer_list *t)
 
 	altera_mbox_rx_data(mbox->chan);
 
-	mod_timer(&mbox->rxpoll_timer,
+	timer_mod(&mbox->rxpoll_timer,
 		  jiffies + msecs_to_jiffies(MBOX_POLLING_MS));
 }
 
@@ -197,7 +197,7 @@ static int altera_mbox_startup_receiver(struct mbox_chan *chan)
 	/* Setup polling timer */
 	mbox->chan = chan;
 	timer_setup(&mbox->rxpoll_timer, altera_mbox_poll_rx, 0);
-	mod_timer(&mbox->rxpoll_timer,
+	timer_mod(&mbox->rxpoll_timer,
 		  jiffies + msecs_to_jiffies(MBOX_POLLING_MS));
 
 	return 0;
diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index e90cfcef96f4..f61571238df2 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -1549,7 +1549,7 @@ static void autocommit_fn(struct timer_list *t)
 static void schedule_autocommit(struct dm_integrity_c *ic)
 {
 	if (!timer_pending(&ic->autocommit_timer))
-		mod_timer(&ic->autocommit_timer, jiffies + ic->autocommit_jiffies);
+		timer_mod(&ic->autocommit_timer, jiffies + ic->autocommit_jiffies);
 }
 
 static void submit_flush_bio(struct dm_integrity_c *ic, struct dm_integrity_io *dio)
diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index ff55a5e4f5c9..356771634ef3 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -808,7 +808,7 @@ static void enable_nopath_timeout(struct multipath *m)
 	if (queue_if_no_path_timeout > 0 &&
 	    atomic_read(&m->nr_valid_paths) == 0 &&
 	    test_bit(MPATHF_QUEUE_IF_NO_PATH, &m->flags)) {
-		mod_timer(&m->nopath_timer,
+		timer_mod(&m->nopath_timer,
 			  jiffies + queue_if_no_path_timeout);
 	}
 }
diff --git a/drivers/md/dm-vdo/dedupe.c b/drivers/md/dm-vdo/dedupe.c
index 4d983092a152..4499e6686b70 100644
--- a/drivers/md/dm-vdo/dedupe.c
+++ b/drivers/md/dm-vdo/dedupe.c
@@ -2140,7 +2140,7 @@ static void start_expiration_timer(struct dedupe_context *context)
 
 	end_time = max(start_time + vdo_dedupe_index_timeout_jiffies,
 		       jiffies + vdo_dedupe_index_min_timer_jiffies);
-	mod_timer(&context->zone->timer, end_time);
+	timer_mod(&context->zone->timer, end_time);
 }
 
 /**
diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index a428e1cacf07..6c30614ed5d0 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -710,7 +710,7 @@ static void writecache_max_age_timer(struct timer_list *t)
 
 	if (!dm_suspended(wc->ti) && !writecache_has_error(wc)) {
 		queue_work(wc->writeback_wq, &wc->writeback_work);
-		mod_timer(&wc->max_age_timer, jiffies + wc->max_age / MAX_AGE_DIV);
+		timer_mod(&wc->max_age_timer, jiffies + wc->max_age / MAX_AGE_DIV);
 	}
 }
 
@@ -875,7 +875,7 @@ static void writecache_autocommit_timer(struct timer_list *t)
 static void writecache_schedule_autocommit(struct dm_writecache *wc)
 {
 	if (!timer_pending(&wc->autocommit_timer))
-		mod_timer(&wc->autocommit_timer, jiffies + wc->autocommit_jiffies);
+		timer_mod(&wc->autocommit_timer, jiffies + wc->autocommit_jiffies);
 }
 
 static void writecache_discard(struct dm_writecache *wc, sector_t start, sector_t end)
@@ -1104,7 +1104,7 @@ static void writecache_resume(struct dm_target *ti)
 	writecache_verify_watermark(wc);
 
 	if (wc->max_age != MAX_AGE_UNSPECIFIED)
-		mod_timer(&wc->max_age_timer, jiffies + wc->max_age / MAX_AGE_DIV);
+		timer_mod(&wc->max_age_timer, jiffies + wc->max_age / MAX_AGE_DIV);
 
 	wc_unlock(wc);
 }
diff --git a/drivers/md/md.c b/drivers/md/md.c
index b4a845e29f28..351f5896acd8 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -3856,7 +3856,7 @@ safe_delay_store(struct mddev *mddev, const char *cbuf, size_t len)
 			new_delay = 1;
 		mddev->safemode_delay = new_delay;
 		if (new_delay < old_delay || old_delay == 0)
-			mod_timer(&mddev->safemode_timer, jiffies+1);
+			timer_mod(&mddev->safemode_timer, jiffies+1);
 	}
 	return len;
 }
@@ -8710,7 +8710,7 @@ void md_write_end(struct mddev *mddev)
 		/* The roundup() ensures this only performs locking once
 		 * every ->safemode_delay jiffies
 		 */
-		mod_timer(&mddev->safemode_timer,
+		timer_mod(&mddev->safemode_timer,
 			  roundup(jiffies, mddev->safemode_delay) +
 			  mddev->safemode_delay);
 }
diff --git a/drivers/media/common/saa7146/saa7146_vbi.c b/drivers/media/common/saa7146/saa7146_vbi.c
index 1ffcc025d1a4..efd3dfdcefdf 100644
--- a/drivers/media/common/saa7146/saa7146_vbi.c
+++ b/drivers/media/common/saa7146/saa7146_vbi.c
@@ -211,7 +211,7 @@ static int buffer_activate(struct saa7146_dev *dev,
 	DEB_VBI("dev:%p, buf:%p, next:%p\n", dev, buf, next);
 	saa7146_set_vbi_capture(dev,buf,next);
 
-	mod_timer(&vv->vbi_dmaq.timeout, jiffies+BUFFER_TIMEOUT);
+	timer_mod(&vv->vbi_dmaq.timeout, jiffies+BUFFER_TIMEOUT);
 	return 0;
 }
 
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 733e18001d0d..2ce6e3f3a759 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -542,7 +542,7 @@ static int buffer_activate (struct saa7146_dev *dev,
 
 	saa7146_set_capture(dev,buf,next);
 
-	mod_timer(&vv->video_dmaq.timeout, jiffies+BUFFER_TIMEOUT);
+	timer_mod(&vv->video_dmaq.timeout, jiffies+BUFFER_TIMEOUT);
 	return 0;
 }
 
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 4281f47f217b..f1608e62a63a 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1510,7 +1510,7 @@ static void tc358743_irq_poll_timer(struct timer_list *t)
 	 * otherwise we will miss CEC messages.
 	 */
 	msecs = state->cec_adap ? POLL_INTERVAL_CEC_MS : POLL_INTERVAL_MS;
-	mod_timer(&state->timer, jiffies + msecs_to_jiffies(msecs));
+	timer_mod(&state->timer, jiffies + msecs_to_jiffies(msecs));
 }
 
 static void tc358743_work_i2c_poll(struct work_struct *work)
diff --git a/drivers/media/i2c/tvaudio.c b/drivers/media/i2c/tvaudio.c
index 6267e9ad39c0..7c7995635b17 100644
--- a/drivers/media/i2c/tvaudio.c
+++ b/drivers/media/i2c/tvaudio.c
@@ -383,7 +383,7 @@ static int chip_thread(void *data)
 		desc->setaudmode(chip, selected);
 
 		/* schedule next check */
-		mod_timer(&chip->wt, jiffies+msecs_to_jiffies(2000));
+		timer_mod(&chip->wt, jiffies+msecs_to_jiffies(2000));
 	}
 
 	v4l2_dbg(1, debug, sd, "thread exiting\n");
@@ -1882,7 +1882,7 @@ static int tvaudio_s_frequency(struct v4l2_subdev *sd, const struct v4l2_frequen
 	if (chip->thread) {
 		desc->setaudmode(chip, V4L2_TUNER_MODE_MONO);
 		chip->prevmode = -1; /* reset previous mode */
-		mod_timer(&chip->wt, jiffies+msecs_to_jiffies(2000));
+		timer_mod(&chip->wt, jiffies+msecs_to_jiffies(2000));
 	}
 	return 0;
 }
diff --git a/drivers/media/pci/bt8xx/bttv-input.c b/drivers/media/pci/bt8xx/bttv-input.c
index cbb80a0b491e..90f54f2d9cf1 100644
--- a/drivers/media/pci/bt8xx/bttv-input.c
+++ b/drivers/media/pci/bt8xx/bttv-input.c
@@ -133,7 +133,7 @@ static void bttv_input_timer(struct timer_list *t)
 		ir_enltv_handle_key(btv);
 	else
 		ir_handle_key(btv);
-	mod_timer(&ir->timer, jiffies + msecs_to_jiffies(ir->polling));
+	timer_mod(&ir->timer, jiffies + msecs_to_jiffies(ir->polling));
 }
 
 /*
@@ -276,7 +276,7 @@ static int bttv_rc5_irq(struct bttv *btv)
 		ir->base_time = tv;
 		ir->last_bit = 0;
 
-		mod_timer(&ir->timer, current_jiffies + msecs_to_jiffies(30));
+		timer_mod(&ir->timer, current_jiffies + msecs_to_jiffies(30));
 	}
 
 	/* toggle GPIO pin 4 to reset the irq */
diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index 79581cd7bd59..45bdd5a8a425 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -374,7 +374,7 @@ static void bttv_set_risc_status(struct bttv *btv)
 static void bttv_set_irq_timer(struct bttv *btv)
 {
 	if (btv->curr.frame_irq || btv->loop_irq || btv->cvbi)
-		mod_timer(&btv->timeout, jiffies + BTTV_TIMEOUT);
+		timer_mod(&btv->timeout, jiffies + BTTV_TIMEOUT);
 	else
 		timer_delete(&btv->timeout);
 }
diff --git a/drivers/media/pci/cx18/cx18-mailbox.c b/drivers/media/pci/cx18/cx18-mailbox.c
index a6457c23d18c..1e22f6c8b940 100644
--- a/drivers/media/pci/cx18/cx18-mailbox.c
+++ b/drivers/media/pci/cx18/cx18-mailbox.c
@@ -195,7 +195,7 @@ static void cx18_mdl_send_to_vb2(struct cx18_stream *s, struct cx18_mdl *mdl)
 		vb2_buffer_done(&vb_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 	}
 
-	mod_timer(&s->vb_timeout, msecs_to_jiffies(2000) + jiffies);
+	timer_mod(&s->vb_timeout, msecs_to_jiffies(2000) + jiffies);
 
 out:
 	spin_unlock(&s->vb_lock);
diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index 42d6f7b90ede..d191fc0e5e22 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -200,7 +200,7 @@ static int cx18_start_streaming(struct vb2_queue *vq, unsigned int count)
 	rc = cx18_start_capture(fh2id(owner));
 	if (!rc) {
 		/* Establish a buffer timeout */
-		mod_timer(&s->vb_timeout, msecs_to_jiffies(2000) + jiffies);
+		timer_mod(&s->vb_timeout, msecs_to_jiffies(2000) + jiffies);
 		return 0;
 	}
 
diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
index 9f2ac33cffa7..f64cd5e4fd09 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -330,7 +330,7 @@ static void netup_unidvb_buf_queue(struct vb2_buffer *vb)
 	spin_lock_irqsave(&dma->lock, flags);
 	list_add_tail(&buf->list, &dma->free_buffers);
 	spin_unlock_irqrestore(&dma->lock, flags);
-	mod_timer(&dma->timeout, jiffies + msecs_to_jiffies(1000));
+	timer_mod(&dma->timeout, jiffies + msecs_to_jiffies(1000));
 }
 
 static int netup_unidvb_start_streaming(struct vb2_queue *q, unsigned int count)
diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
index a0bf76e3f8af..88f80fe7c688 100644
--- a/drivers/media/pci/saa7134/saa7134-input.c
+++ b/drivers/media/pci/saa7134/saa7134-input.c
@@ -435,7 +435,7 @@ static void saa7134_input_timer(struct timer_list *t)
 	struct saa7134_dev *dev = ir->dev->priv;
 
 	build_key(dev);
-	mod_timer(&ir->timer, jiffies + msecs_to_jiffies(ir->polling));
+	timer_mod(&ir->timer, jiffies + msecs_to_jiffies(ir->polling));
 }
 
 int saa7134_ir_open(struct rc_dev *rc)
diff --git a/drivers/media/pci/saa7134/saa7134-ts.c b/drivers/media/pci/saa7134/saa7134-ts.c
index 1b44033067c5..06ba7cad74e3 100644
--- a/drivers/media/pci/saa7134/saa7134-ts.c
+++ b/drivers/media/pci/saa7134/saa7134-ts.c
@@ -56,7 +56,7 @@ static int buffer_activate(struct saa7134_dev *dev,
 	/* start DMA */
 	saa7134_set_dmabits(dev);
 
-	mod_timer(&dev->ts_q.timeout, jiffies+TS_BUFFER_TIMEOUT);
+	timer_mod(&dev->ts_q.timeout, jiffies+TS_BUFFER_TIMEOUT);
 
 	if (!dev->ts_started)
 		saa7134_ts_start(dev);
diff --git a/drivers/media/pci/saa7134/saa7134-vbi.c b/drivers/media/pci/saa7134/saa7134-vbi.c
index 28bf77449bdb..b97142cc777e 100644
--- a/drivers/media/pci/saa7134/saa7134-vbi.c
+++ b/drivers/media/pci/saa7134/saa7134-vbi.c
@@ -97,7 +97,7 @@ static int buffer_activate(struct saa7134_dev *dev,
 
 	/* start DMA */
 	saa7134_set_dmabits(dev);
-	mod_timer(&dmaq->timeout, jiffies + BUFFER_TIMEOUT);
+	timer_mod(&dmaq->timeout, jiffies + BUFFER_TIMEOUT);
 
 	return 0;
 }
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index c88939bce56b..1421b95ba166 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -708,7 +708,7 @@ static int buffer_activate(struct saa7134_dev *dev,
 
 	/* start DMA */
 	saa7134_set_dmabits(dev);
-	mod_timer(&dmaq->timeout, jiffies + BUFFER_TIMEOUT);
+	timer_mod(&dmaq->timeout, jiffies + BUFFER_TIMEOUT);
 	return 0;
 }
 
diff --git a/drivers/media/pci/tw686x/tw686x-audio.c b/drivers/media/pci/tw686x/tw686x-audio.c
index 1ae3845b6743..4dfdb58f641a 100644
--- a/drivers/media/pci/tw686x/tw686x-audio.c
+++ b/drivers/media/pci/tw686x/tw686x-audio.c
@@ -224,7 +224,7 @@ static int tw686x_pcm_trigger(struct snd_pcm_substream *ss, int cmd)
 				AUDIO_CHANNEL_OFFSET + ac->ch);
 			spin_unlock_irqrestore(&dev->lock, flags);
 
-			mod_timer(&dev->dma_delay_timer,
+			timer_mod(&dev->dma_delay_timer,
 				  jiffies + msecs_to_jiffies(100));
 		} else {
 			err = -EIO;
diff --git a/drivers/media/pci/tw686x/tw686x-core.c b/drivers/media/pci/tw686x/tw686x-core.c
index f39e0e34deb6..9eb3cfa03ebd 100644
--- a/drivers/media/pci/tw686x/tw686x-core.c
+++ b/drivers/media/pci/tw686x/tw686x-core.c
@@ -214,7 +214,7 @@ static irqreturn_t tw686x_irq(int irq, void *dev_id)
 		spin_lock_irqsave(&dev->lock, flags);
 		tw686x_reset_channels(dev, reset_ch);
 		spin_unlock_irqrestore(&dev->lock, flags);
-		mod_timer(&dev->dma_delay_timer,
+		timer_mod(&dev->dma_delay_timer,
 			  jiffies + msecs_to_jiffies(100));
 	}
 
diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 785dd797d921..010ec4e057c7 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -531,7 +531,7 @@ static int tw686x_start_streaming(struct vb2_queue *vq, unsigned int count)
 	tw686x_enable_channel(dev, vc->ch);
 	spin_unlock_irqrestore(&dev->lock, flags);
 
-	mod_timer(&dev->dma_delay_timer, jiffies + msecs_to_jiffies(100));
+	timer_mod(&dev->dma_delay_timer, jiffies + msecs_to_jiffies(100));
 
 	return 0;
 
diff --git a/drivers/media/rc/ene_ir.c b/drivers/media/rc/ene_ir.c
index d6c54a3bccc2..b07f7e61a56c 100644
--- a/drivers/media/rc/ene_ir.c
+++ b/drivers/media/rc/ene_ir.c
@@ -653,7 +653,7 @@ static void ene_tx_sample(struct ene_device *dev)
 exit:
 	/* simulate TX done interrupt */
 	if (txsim)
-		mod_timer(&dev->tx_sim_timer, jiffies + HZ / 500);
+		timer_mod(&dev->tx_sim_timer, jiffies + HZ / 500);
 }
 
 /* timer to simulate tx done interrupt */
diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index e034c93d57cf..2f687f800050 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -104,7 +104,7 @@ static void igorplugusb_callback(struct urb *urb)
 					urb->actual_length > HEADERLEN)
 			igorplugusb_irdata(ir, urb->actual_length);
 		else /* request IR */
-			mod_timer(&ir->timer, jiffies + msecs_to_jiffies(50));
+			timer_mod(&ir->timer, jiffies + msecs_to_jiffies(50));
 		break;
 	case -EPROTO:
 	case -ECONNRESET:
diff --git a/drivers/media/rc/img-ir/img-ir-hw.c b/drivers/media/rc/img-ir/img-ir-hw.c
index 426b3f21cbad..2c67fea98e70 100644
--- a/drivers/media/rc/img-ir/img-ir-hw.c
+++ b/drivers/media/rc/img-ir/img-ir-hw.c
@@ -857,7 +857,7 @@ static void img_ir_handle_data(struct img_ir_priv *priv, u32 len, u64 raw)
 
 		/* update timer, but allowing for 1/8th tolerance */
 		interval = dec->repeat + (dec->repeat >> 3);
-		mod_timer(&hw->end_timer,
+		timer_mod(&hw->end_timer,
 			  jiffies + msecs_to_jiffies(interval));
 	}
 }
@@ -983,7 +983,7 @@ void img_ir_isr_hw(struct img_ir_priv *priv, u32 irq_status)
 			     hw->quirk_suspend_irq & IMG_IR_IRQ_EDGE);
 
 		/* Timer activated to re-enable the protocol. */
-		mod_timer(&hw->suspend_timer,
+		timer_mod(&hw->suspend_timer,
 			  jiffies + msecs_to_jiffies(5));
 		return;
 	}
diff --git a/drivers/media/rc/img-ir/img-ir-raw.c b/drivers/media/rc/img-ir/img-ir-raw.c
index 92fb7b555a0f..410e95bb6b09 100644
--- a/drivers/media/rc/img-ir/img-ir-raw.c
+++ b/drivers/media/rc/img-ir/img-ir-raw.c
@@ -54,7 +54,7 @@ void img_ir_isr_raw(struct img_ir_priv *priv, u32 irq_status)
 	img_ir_refresh_raw(priv, irq_status);
 
 	/* start / push back the echo timer */
-	mod_timer(&raw->timer, jiffies + msecs_to_jiffies(ECHO_TIMEOUT_MS));
+	timer_mod(&raw->timer, jiffies + msecs_to_jiffies(ECHO_TIMEOUT_MS));
 }
 
 /*
diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index f5221b018808..78dba6745250 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -1375,7 +1375,7 @@ static bool imon_mouse_event(struct imon_context *ictx,
 
 static void imon_touch_event(struct imon_context *ictx, unsigned char *buf)
 {
-	mod_timer(&ictx->ttimer, jiffies + TOUCH_TIMEOUT);
+	timer_mod(&ictx->ttimer, jiffies + TOUCH_TIMEOUT);
 	ictx->touch_x = (buf[0] << 4) | (buf[1] >> 4);
 	ictx->touch_y = 0xfff - ((buf[2] << 4) | (buf[1] & 0xf));
 	input_report_abs(ictx->touch, ABS_X, ictx->touch_x);
diff --git a/drivers/media/rc/ir-mce_kbd-decoder.c b/drivers/media/rc/ir-mce_kbd-decoder.c
index f19da3231cc4..2c0ff4ccb6a2 100644
--- a/drivers/media/rc/ir-mce_kbd-decoder.c
+++ b/drivers/media/rc/ir-mce_kbd-decoder.c
@@ -322,7 +322,7 @@ static int ir_mce_kbd_decode(struct rc_dev *dev, struct ir_raw_event ev)
 			if (scancode) {
 				delay = usecs_to_jiffies(dev->timeout) +
 					msecs_to_jiffies(100);
-				mod_timer(&data->rx_timeout, jiffies + delay);
+				timer_mod(&data->rx_timeout, jiffies + delay);
 			} else {
 				timer_delete(&data->rx_timeout);
 			}
diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index 7f4a17efc985..d250cd08493a 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -143,7 +143,7 @@ int ir_raw_event_store_with_timeout(struct rc_dev *dev, struct ir_raw_event *ev)
 	if (!timer_pending(&dev->raw->edge_handle) ||
 	    time_after(dev->raw->edge_handle.expires,
 		       jiffies + msecs_to_jiffies(15))) {
-		mod_timer(&dev->raw->edge_handle,
+		timer_mod(&dev->raw->edge_handle,
 			  jiffies + msecs_to_jiffies(15));
 	}
 	spin_unlock(&dev->raw->edge_spinlock);
@@ -567,7 +567,7 @@ static void ir_raw_edge_handle(struct timer_list *t)
 
 		ir_raw_event_store(dev, &ev);
 	} else {
-		mod_timer(&dev->raw->edge_handle,
+		timer_mod(&dev->raw->edge_handle,
 			  jiffies + usecs_to_jiffies(dev->timeout -
 						     ktime_to_us(interval)));
 	}
diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index b9bf5cdcde4a..9bd267690f9b 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -712,7 +712,7 @@ static void ir_timer_repeat(struct timer_list *t)
 		input_event(input, EV_KEY, dev->last_keycode, 2);
 		input_sync(input);
 		if (input->rep[REP_PERIOD])
-			mod_timer(&dev->timer_repeat, jiffies +
+			timer_mod(&dev->timer_repeat, jiffies +
 				  msecs_to_jiffies(input->rep[REP_PERIOD]));
 	}
 	spin_unlock_irqrestore(&dev->keylock, flags);
@@ -759,7 +759,7 @@ void rc_repeat(struct rc_dev *dev)
 
 	if (dev->keypressed) {
 		dev->keyup_jiffies = jiffies + timeout;
-		mod_timer(&dev->timer_keyup, dev->keyup_jiffies);
+		timer_mod(&dev->timer_keyup, dev->keyup_jiffies);
 	}
 
 	spin_unlock_irqrestore(&dev->keylock, flags);
@@ -828,7 +828,7 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
 	    dev->input_dev->rep[REP_PERIOD] &&
 	    !dev->input_dev->rep[REP_DELAY]) {
 		input_event(dev->input_dev, EV_KEY, keycode, 2);
-		mod_timer(&dev->timer_repeat, jiffies +
+		timer_mod(&dev->timer_repeat, jiffies +
 			  msecs_to_jiffies(dev->input_dev->rep[REP_PERIOD]));
 	}
 
@@ -858,7 +858,7 @@ void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u64 scancode,
 	if (dev->keypressed) {
 		dev->keyup_jiffies = jiffies + usecs_to_jiffies(dev->timeout) +
 			msecs_to_jiffies(repeat_period(protocol));
-		mod_timer(&dev->timer_keyup, dev->keyup_jiffies);
+		timer_mod(&dev->timer_keyup, dev->keyup_jiffies);
 	}
 	spin_unlock_irqrestore(&dev->keylock, flags);
 }
diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
index 992fff82b524..cb5e23d161e1 100644
--- a/drivers/media/rc/serial_ir.c
+++ b/drivers/media/rc/serial_ir.c
@@ -385,7 +385,7 @@ static irqreturn_t serial_ir_irq_handler(int i, void *blah)
 		}
 	} while (!(sinp(UART_IIR) & UART_IIR_NO_INT)); /* still pending ? */
 
-	mod_timer(&serial_ir.timeout_timer,
+	timer_mod(&serial_ir.timeout_timer,
 		  jiffies + usecs_to_jiffies(serial_ir.rcdev->timeout));
 
 	ir_raw_event_handle(serial_ir.rcdev);
diff --git a/drivers/media/usb/au0828/au0828-dvb.c b/drivers/media/usb/au0828/au0828-dvb.c
index 5d0447ff7d06..0f2ff73c878e 100644
--- a/drivers/media/usb/au0828/au0828-dvb.c
+++ b/drivers/media/usb/au0828/au0828-dvb.c
@@ -245,7 +245,7 @@ static int start_urb_transfer(struct au0828_dev *dev)
 	dev->urb_streaming = true;
 
 	/* If we don't valid data within 1 second, restart stream */
-	mod_timer(&dev->bulk_timeout, jiffies + (HZ));
+	timer_mod(&dev->bulk_timeout, jiffies + (HZ));
 	dev->bulk_timeout_running = 1;
 
 	return 0;
diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index e5dff969ed57..53eb91183e49 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -573,10 +573,10 @@ static inline int au0828_isoc_copy(struct au0828_dev *dev, struct urb *urb)
 				/* As long as isoc traffic is arriving, keep
 				   resetting the timer */
 				if (dev->vid_timeout_running)
-					mod_timer(&dev->vid_timeout,
+					timer_mod(&dev->vid_timeout,
 						  jiffies + (HZ / 10));
 				if (dev->vbi_timeout_running)
-					mod_timer(&dev->vbi_timeout,
+					timer_mod(&dev->vbi_timeout,
 						  jiffies + (HZ / 10));
 			}
 
@@ -833,10 +833,10 @@ int au0828_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
 
 		if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 			dev->vid_timeout_running = 1;
-			mod_timer(&dev->vid_timeout, jiffies + (HZ / 10));
+			timer_mod(&dev->vid_timeout, jiffies + (HZ / 10));
 		} else if (vq->type == V4L2_BUF_TYPE_VBI_CAPTURE) {
 			dev->vbi_timeout_running = 1;
-			mod_timer(&dev->vbi_timeout, jiffies + (HZ / 10));
+			timer_mod(&dev->vbi_timeout, jiffies + (HZ / 10));
 		}
 	}
 	dev->streaming_users++;
@@ -965,7 +965,7 @@ static void au0828_vid_buffer_timeout(struct timer_list *t)
 	get_next_buf(dma_q, &buf);
 
 	if (dev->vid_timeout_running == 1)
-		mod_timer(&dev->vid_timeout, jiffies + (HZ / 10));
+		timer_mod(&dev->vid_timeout, jiffies + (HZ / 10));
 
 	spin_unlock_irqrestore(&dev->slock, flags);
 }
@@ -989,7 +989,7 @@ static void au0828_vbi_buffer_timeout(struct timer_list *t)
 	vbi_get_next_buf(dma_q, &buf);
 
 	if (dev->vbi_timeout_running == 1)
-		mod_timer(&dev->vbi_timeout, jiffies + (HZ / 10));
+		timer_mod(&dev->vbi_timeout, jiffies + (HZ / 10));
 	spin_unlock_irqrestore(&dev->slock, flags);
 }
 
@@ -1711,9 +1711,9 @@ void au0828_v4l2_resume(struct au0828_dev *dev)
 	}
 
 	if (dev->vid_timeout_running)
-		mod_timer(&dev->vid_timeout, jiffies + (HZ / 10));
+		timer_mod(&dev->vid_timeout, jiffies + (HZ / 10));
 	if (dev->vbi_timeout_running)
-		mod_timer(&dev->vbi_timeout, jiffies + (HZ / 10));
+		timer_mod(&dev->vbi_timeout, jiffies + (HZ / 10));
 
 	/* If we were doing ac97 instead of i2s, it would go here...*/
 	au0828_i2s_init(dev);
diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 8332f2c5aed7..7f29fdcf2c76 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -2191,7 +2191,7 @@ static void s2255_fwload_start(struct s2255_dev *dev)
 			  dev->fw_data->pfw_data,
 			  CHUNK_SIZE, s2255_fwchunk_complete,
 			  dev->fw_data);
-	mod_timer(&dev->timer, jiffies + HZ);
+	timer_mod(&dev->timer, jiffies + HZ);
 }
 
 /* standard usb probe function */
diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index f12be641959a..ae00a0fd5935 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -571,13 +571,13 @@ static void tegra210_emc_train(struct timer_list *timer)
 
 	spin_unlock_irqrestore(&emc->lock, flags);
 
-	mod_timer(&emc->training,
+	timer_mod(&emc->training,
 		  jiffies + msecs_to_jiffies(emc->training_interval));
 }
 
 static void tegra210_emc_training_start(struct tegra210_emc *emc)
 {
-	mod_timer(&emc->training,
+	timer_mod(&emc->training,
 		  jiffies + msecs_to_jiffies(emc->training_interval));
 }
 
@@ -659,7 +659,7 @@ static void tegra210_emc_poll_refresh(struct timer_list *timer)
 		unsigned int interval = emc->refresh_poll_interval;
 		unsigned int timeout = msecs_to_jiffies(interval);
 
-		mod_timer(&emc->refresh_timer, jiffies + timeout);
+		timer_mod(&emc->refresh_timer, jiffies + timeout);
 	}
 }
 
@@ -673,7 +673,7 @@ static void tegra210_emc_poll_refresh_start(struct tegra210_emc *emc)
 {
 	atomic_set(&emc->refresh_poll, 1);
 
-	mod_timer(&emc->refresh_timer,
+	timer_mod(&emc->refresh_timer,
 		  jiffies + msecs_to_jiffies(emc->refresh_poll_interval));
 }
 
diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index d34892782f6e..002002cd217e 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1628,7 +1628,7 @@ static int msb_cache_write(struct msb_data *msb, int lba,
 
 	if (msb->cache_block_lba  == MS_BLOCK_INVALID) {
 		msb->cache_block_lba  = lba;
-		mod_timer(&msb->cache_flush_timer,
+		timer_mod(&msb->cache_flush_timer,
 			jiffies + msecs_to_jiffies(cache_flush_timeout));
 	}
 
diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x_ms.c
index cddddb3a5a27..fea13120a0a2 100644
--- a/drivers/memstick/host/jmb38x_ms.c
+++ b/drivers/memstick/host/jmb38x_ms.c
@@ -452,7 +452,7 @@ static int jmb38x_ms_issue_cmd(struct memstick_host *msh)
 		}
 	}
 
-	mod_timer(&host->timer, jiffies + host->timeout_jiffies);
+	timer_mod(&host->timer, jiffies + host->timeout_jiffies);
 	writel(HOST_CONTROL_LED | readl(host->addr + HOST_CONTROL),
 	       host->addr + HOST_CONTROL);
 	host->req->error = 0;
diff --git a/drivers/memstick/host/r592.c b/drivers/memstick/host/r592.c
index 605b2265536f..2a4cfbb4b479 100644
--- a/drivers/memstick/host/r592.c
+++ b/drivers/memstick/host/r592.c
@@ -651,7 +651,7 @@ static irqreturn_t r592_irq(int irq, void *data)
 
 		message("IRQ: card %s", card_was_added ? "added" : "removed");
 
-		mod_timer(&dev->detect_timer,
+		timer_mod(&dev->detect_timer,
 			jiffies + msecs_to_jiffies(card_was_added ? 500 : 50));
 	}
 
diff --git a/drivers/memstick/host/tifm_ms.c b/drivers/memstick/host/tifm_ms.c
index db7f3a088fb0..3c0e1832c804 100644
--- a/drivers/memstick/host/tifm_ms.c
+++ b/drivers/memstick/host/tifm_ms.c
@@ -308,7 +308,7 @@ static int tifm_ms_issue_cmd(struct tifm_ms *host)
 		       sock->addr + SOCK_DMA_FIFO_INT_ENABLE_SET);
 	}
 
-	mod_timer(&host->timer, jiffies + host->timeout_jiffies);
+	timer_mod(&host->timer, jiffies + host->timeout_jiffies);
 	writel(TIFM_CTRL_LED | readl(sock->addr + SOCK_CONTROL),
 	       sock->addr + SOCK_CONTROL);
 	host->req->error = 0;
diff --git a/drivers/misc/bcm-vk/bcm_vk_tty.c b/drivers/misc/bcm-vk/bcm_vk_tty.c
index e6c42b772e96..7fd00da74590 100644
--- a/drivers/misc/bcm-vk/bcm_vk_tty.c
+++ b/drivers/misc/bcm-vk/bcm_vk_tty.c
@@ -46,7 +46,7 @@ static void bcm_vk_tty_poll(struct timer_list *t)
 	struct bcm_vk *vk = timer_container_of(vk, t, serial_timer);
 
 	queue_work(vk->tty_wq_thread, &vk->tty_wq_work);
-	mod_timer(&vk->serial_timer, jiffies + SERIAL_TIMER_VALUE);
+	timer_mod(&vk->serial_timer, jiffies + SERIAL_TIMER_VALUE);
 }
 
 irqreturn_t bcm_vk_tty_irqhandler(int irq, void *dev_id)
@@ -162,7 +162,7 @@ static int bcm_vk_tty_open(struct tty_struct *tty, struct file *file)
 
 	if (tty->count == 1 && !vktty->irq_enabled) {
 		timer_setup(&vk->serial_timer, bcm_vk_tty_poll, 0);
-		mod_timer(&vk->serial_timer, jiffies + SERIAL_TIMER_VALUE);
+		timer_mod(&vk->serial_timer, jiffies + SERIAL_TIMER_VALUE);
 	}
 	return 0;
 }
diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index f14671ea5716..f975cf83860a 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -111,7 +111,7 @@ void mmc_retune_enable(struct mmc_host *host)
 {
 	host->can_retune = 1;
 	if (host->retune_period)
-		mod_timer(&host->retune_timer,
+		timer_mod(&host->retune_timer,
 			  jiffies + host->retune_period * HZ);
 }
 
diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index 2179ea085e84..bf13a17b3bc4 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -847,7 +847,7 @@ static void atmci_send_command(struct atmel_mci *host,
 	atmci_writel(host, ATMCI_ARGR, cmd->arg);
 	atmci_writel(host, ATMCI_CMDR, cmd_flags);
 
-	mod_timer(&host->timer, jiffies + msecs_to_jiffies(timeout_ms));
+	timer_mod(&host->timer, jiffies + msecs_to_jiffies(timeout_ms));
 }
 
 static void atmci_send_stop_cmd(struct atmel_mci *host, struct mmc_data *data)
@@ -2229,11 +2229,11 @@ static irqreturn_t atmci_detect_interrupt(int irq, void *dev_id)
 
 	/*
 	 * Disable interrupts until the pin has stabilized and check
-	 * the state then. Use mod_timer() since we may be in the
+	 * the state then. Use timer_mod() since we may be in the
 	 * middle of the timer routine when this interrupt triggers.
 	 */
 	disable_irq_nosync(irq);
-	mod_timer(&slot->detect_timer, jiffies + msecs_to_jiffies(20));
+	timer_mod(&slot->detect_timer, jiffies + msecs_to_jiffies(20));
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index a291c57893c9..0c8597316671 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -389,7 +389,7 @@ static inline void dw_mci_set_cto(struct dw_mci *host)
 	 */
 	spin_lock_irqsave(&host->irq_lock, irqflags);
 	if (!test_bit(EVENT_CMD_COMPLETE, &host->pending_events))
-		mod_timer(&host->cto_timer,
+		timer_mod(&host->cto_timer,
 			jiffies + msecs_to_jiffies(cto_ms) + 1);
 	spin_unlock_irqrestore(&host->irq_lock, irqflags);
 }
@@ -1366,7 +1366,7 @@ static void __dw_mci_start_request(struct dw_mci *host,
 		 */
 		spin_lock_irqsave(&host->irq_lock, irqflags);
 		if (!test_bit(EVENT_CMD_COMPLETE, &host->pending_events))
-			mod_timer(&host->cmd11_timer,
+			timer_mod(&host->cmd11_timer,
 				jiffies + msecs_to_jiffies(500) + 1);
 		spin_unlock_irqrestore(&host->irq_lock, irqflags);
 	}
@@ -2026,7 +2026,7 @@ static void dw_mci_set_drto(struct dw_mci *host)
 
 	spin_lock_irqsave(&host->irq_lock, irqflags);
 	if (!test_bit(EVENT_DATA_COMPLETE, &host->pending_events))
-		mod_timer(&host->dto_timer,
+		timer_mod(&host->dto_timer,
 			  jiffies + msecs_to_jiffies(drto_ms));
 	spin_unlock_irqrestore(&host->irq_lock, irqflags);
 }
diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index 740bcdf92be0..3d671fafecdd 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -479,7 +479,7 @@ static unsigned int jz4740_mmc_poll_irq(struct jz4740_mmc_host *host,
 
 	if (timeout == 0) {
 		set_bit(0, &host->waiting);
-		mod_timer(&host->timeout_timer,
+		timer_mod(&host->timeout_timer,
 			  jiffies + msecs_to_jiffies(JZ_MMC_REQ_TIMEOUT_MS));
 		jz4740_mmc_set_irq_enabled(host, irq, true);
 		return true;
@@ -931,7 +931,7 @@ static void jz4740_mmc_request(struct mmc_host *mmc, struct mmc_request *req)
 
 	host->state = JZ4740_MMC_STATE_READ_RESPONSE;
 	set_bit(0, &host->waiting);
-	mod_timer(&host->timeout_timer,
+	timer_mod(&host->timeout_timer,
 		  jiffies + msecs_to_jiffies(JZ_MMC_REQ_TIMEOUT_MS));
 	jz4740_mmc_send_command(host, req->cmd);
 }
diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 939f4337bc55..d2a93baf23c7 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -237,7 +237,7 @@ static void meson_mx_mmc_start_cmd(struct mmc_host *mmc,
 
 	spin_unlock_irqrestore(&host->irq_lock, irqflags);
 
-	mod_timer(&host->cmd_timeout, jiffies + timeout);
+	timer_mod(&host->cmd_timeout, jiffies + timeout);
 }
 
 static void meson_mx_mmc_request_done(struct meson_mx_mmc_host *host)
diff --git a/drivers/mmc/host/mvsdio.c b/drivers/mmc/host/mvsdio.c
index 101f36de7b63..3109b204ebe9 100644
--- a/drivers/mmc/host/mvsdio.c
+++ b/drivers/mmc/host/mvsdio.c
@@ -233,7 +233,7 @@ static void mvsd_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	mvsd_write(MVSD_ERR_INTR_EN, 0xffff);
 
 	timeout = cmd->busy_timeout ? cmd->busy_timeout : 5000;
-	mod_timer(&host->timer, jiffies + msecs_to_jiffies(timeout));
+	timer_mod(&host->timer, jiffies + msecs_to_jiffies(timeout));
 
 	spin_unlock_irqrestore(&host->lock, flags);
 }
diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index e588e24256cc..b5d6cf300fe3 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -339,7 +339,7 @@ static int mxcmci_setup_data(struct mxcmci_host *host, struct mmc_data *data)
 	dmaengine_submit(host->desc);
 	dma_async_issue_pending(host->dma);
 
-	mod_timer(&host->watchdog, jiffies + msecs_to_jiffies(MXCMCI_TIMEOUT_MS));
+	timer_mod(&host->watchdog, jiffies + msecs_to_jiffies(MXCMCI_TIMEOUT_MS));
 
 	return 0;
 }
diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 8bc0c4ea2211..c9ce18936d68 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -271,7 +271,7 @@ static void mmc_omap_release_slot(struct mmc_omap_slot *slot, int clk_enabled)
 
 	if (clk_enabled)
 		/* Keeps clock running for at least 8 cycles on valid freq */
-		mod_timer(&host->clk_timer, jiffies  + HZ/10);
+		timer_mod(&host->clk_timer, jiffies  + HZ/10);
 	else {
 		timer_delete(&host->clk_timer);
 		mmc_omap_fclk_offdelay(slot);
@@ -394,7 +394,7 @@ mmc_omap_start_command(struct mmc_omap_host *host, struct mmc_command *cmd)
 	if (host->data && !(host->data->flags & MMC_DATA_WRITE))
 		cmdreg |= 1 << 15;
 
-	mod_timer(&host->cmd_abort_timer, jiffies + HZ/2);
+	timer_mod(&host->cmd_abort_timer, jiffies + HZ/2);
 
 	OMAP_MMC_WRITE(host, CTO, 200);
 	OMAP_MMC_WRITE(host, ARGL, cmd->arg & 0xffff);
@@ -899,7 +899,7 @@ static void mmc_omap_cover_bh_handler(struct work_struct *t)
 	if (slot->mmc->card == NULL)
 		return;
 
-	mod_timer(&slot->cover_timer,
+	timer_mod(&slot->cover_timer,
 		  jiffies + msecs_to_jiffies(OMAP_MMC_COVER_POLL_DELAY));
 }
 
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index c6f972636356..a9bfad4e3e4a 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -508,9 +508,9 @@ void sdhci_mod_timer(struct sdhci_host *host, struct mmc_request *mrq,
 		     unsigned long timeout)
 {
 	if (sdhci_data_line_cmd(mrq->cmd))
-		mod_timer(&host->data_timer, timeout);
+		timer_mod(&host->data_timer, timeout);
 	else
-		mod_timer(&host->timer, timeout);
+		timer_mod(&host->timer, timeout);
 }
 EXPORT_SYMBOL_GPL(sdhci_mod_timer);
 
diff --git a/drivers/mmc/host/tifm_sd.c b/drivers/mmc/host/tifm_sd.c
index 5e5ec92f80e6..317550b69088 100644
--- a/drivers/mmc/host/tifm_sd.c
+++ b/drivers/mmc/host/tifm_sd.c
@@ -712,7 +712,7 @@ static void tifm_sd_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	}
 
 	host->req = mrq;
-	mod_timer(&host->timer, jiffies + host->timeout_jiffies);
+	timer_mod(&host->timer, jiffies + host->timeout_jiffies);
 	writel(TIFM_CTRL_LED | readl(sock->addr + SOCK_CONTROL),
 	       sock->addr + SOCK_CONTROL);
 	tifm_sd_exec(host, mrq->cmd);
diff --git a/drivers/mmc/host/via-sdmmc.c b/drivers/mmc/host/via-sdmmc.c
index 9903966c2f54..0f74f9e73533 100644
--- a/drivers/mmc/host/via-sdmmc.c
+++ b/drivers/mmc/host/via-sdmmc.c
@@ -563,7 +563,7 @@ static void via_sdc_send_command(struct via_crdr_mmc_host *host,
 	host->cmd = cmd;
 
 	timeout_ms = cmd->busy_timeout ? cmd->busy_timeout : VIA_CMD_TIMEOUT_MS;
-	mod_timer(&host->timer, jiffies + msecs_to_jiffies(timeout_ms));
+	timer_mod(&host->timer, jiffies + msecs_to_jiffies(timeout_ms));
 
 	/*Command index*/
 	cmdctrl = cmd->opcode << 8;
diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index e4dff077d136..9f1a8561b269 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -655,7 +655,7 @@ static void __do_poll(struct vub300_mmc_host *vub300)
 {
 	/* cmd_mutex is held by vub300_pollwork_thread */
 	unsigned long commretval;
-	mod_timer(&vub300->inactivity_timer, jiffies + HZ);
+	timer_mod(&vub300->inactivity_timer, jiffies + HZ);
 	init_completion(&vub300->irqpoll_complete);
 	send_irqpoll(vub300);
 	commretval = wait_for_completion_timeout(&vub300->irqpoll_complete,
@@ -694,7 +694,7 @@ static void vub300_pollwork_thread(struct work_struct *work)
 		} else if (vub300->irqs_queued) {
 			vub300->irqs_queued -= 1;
 			mmc_signal_sdio_irq(vub300->mmc);
-			mod_timer(&vub300->inactivity_timer, jiffies + HZ);
+			timer_mod(&vub300->inactivity_timer, jiffies + HZ);
 			mutex_unlock(&vub300->irq_mutex);
 		} else { /* NOT vub300->irqs_queued */
 			mutex_unlock(&vub300->irq_mutex);
@@ -733,7 +733,7 @@ static void vub300_deadwork_thread(struct work_struct *work)
 	} else {
 		check_vub300_port_status(vub300);
 	}
-	mod_timer(&vub300->inactivity_timer, jiffies + HZ);
+	timer_mod(&vub300->inactivity_timer, jiffies + HZ);
 	mutex_unlock(&vub300->cmd_mutex);
 	kref_put(&vub300->kref, vub300_delete);
 }
@@ -745,10 +745,10 @@ static void vub300_inactivity_timer_expired(struct timer_list *t)
 	if (!vub300->interface) {
 		kref_put(&vub300->kref, vub300_delete);
 	} else if (vub300->cmd) {
-		mod_timer(&vub300->inactivity_timer, jiffies + HZ);
+		timer_mod(&vub300->inactivity_timer, jiffies + HZ);
 	} else {
 		vub300_queue_dead_work(vub300);
-		mod_timer(&vub300->inactivity_timer, jiffies + HZ);
+		timer_mod(&vub300->inactivity_timer, jiffies + HZ);
 	}
 }
 
@@ -1928,7 +1928,7 @@ static void vub300_mmc_request(struct mmc_host *mmc, struct mmc_request *req)
 		}
 		kref_get(&vub300->kref);
 		mutex_lock(&vub300->cmd_mutex);
-		mod_timer(&vub300->inactivity_timer, jiffies + HZ);
+		timer_mod(&vub300->inactivity_timer, jiffies + HZ);
 		/*
 		 * for performance we have to return immediately
 		 * if the requested data has been offloaded
diff --git a/drivers/mmc/host/wbsd.c b/drivers/mmc/host/wbsd.c
index 2ae787d966de..1503057e83f5 100644
--- a/drivers/mmc/host/wbsd.c
+++ b/drivers/mmc/host/wbsd.c
@@ -893,7 +893,7 @@ static void wbsd_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 			 * We cannot resume card detection immediately
 			 * because of capacitance and delays in the chip.
 			 */
-			mod_timer(&host->ignore_timer, jiffies + HZ / 100);
+			timer_mod(&host->ignore_timer, jiffies + HZ / 100);
 		}
 	}
 	wbsd_write_index(host, WBSD_IDX_SETUP, setup);
diff --git a/drivers/most/most_usb.c b/drivers/most/most_usb.c
index f59a93b65ffb..6a1fc2dd5085 100644
--- a/drivers/most/most_usb.c
+++ b/drivers/most/most_usb.c
@@ -655,7 +655,7 @@ static void hdm_request_netinfo(struct most_interface *iface, int channel,
 		return;
 
 	mdev->link_stat_timer.expires = jiffies + HZ;
-	mod_timer(&mdev->link_stat_timer, mdev->link_stat_timer.expires);
+	timer_mod(&mdev->link_stat_timer, mdev->link_stat_timer.expires);
 }
 
 /**
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index abc7b186353f..bdd91e7cfcc1 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -1089,7 +1089,7 @@ static int sm_write(struct mtd_blktrans_dev *dev,
 
 	sm_cache_put(ftl, buf, boffset);
 unlock:
-	mod_timer(&ftl->timer, jiffies + msecs_to_jiffies(cache_timeout));
+	timer_mod(&ftl->timer, jiffies + msecs_to_jiffies(cache_timeout));
 	mutex_unlock(&ftl->mutex);
 	return error;
 }
diff --git a/drivers/net/arcnet/arcnet.c b/drivers/net/arcnet/arcnet.c
index 882972604c82..b57c26beca4e 100644
--- a/drivers/net/arcnet/arcnet.c
+++ b/drivers/net/arcnet/arcnet.c
@@ -599,7 +599,7 @@ int arcnet_open(struct net_device *dev)
 
 	netif_carrier_off(dev);
 	netif_start_queue(dev);
-	mod_timer(&lp->timer, jiffies + msecs_to_jiffies(1000));
+	timer_mod(&lp->timer, jiffies + msecs_to_jiffies(1000));
 
 	arcnet_led_event(dev, ARCNET_LED_EVENT_OPEN);
 	return 0;
@@ -1038,7 +1038,7 @@ irqreturn_t arcnet_interrupt(int irq, void *dev_id)
 				netif_carrier_off(dev);
 				netdev_info(dev, "link down\n");
 			}
-			mod_timer(&lp->timer, jiffies + msecs_to_jiffies(1000));
+			timer_mod(&lp->timer, jiffies + msecs_to_jiffies(1000));
 
 			arcnet_led_event(dev, ARCNET_LED_EVENT_RECON);
 			/* MYRECON bit is at bit 7 of diagstatus */
diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
index c5784d9779ef..c0ebea037362 100644
--- a/drivers/net/can/grcan.c
+++ b/drivers/net/can/grcan.c
@@ -891,7 +891,7 @@ static inline void grcan_reset_timer(struct timer_list *timer, __u32 bitrate)
 {
 	u32 wait_jiffies = usecs_to_jiffies(grcan_ongoing_wait_usecs(bitrate));
 
-	mod_timer(timer, jiffies + wait_jiffies);
+	timer_mod(timer, jiffies + wait_jiffies);
 }
 
 /* Disable channels and schedule a running reset */
diff --git a/drivers/net/can/kvaser_pciefd.c b/drivers/net/can/kvaser_pciefd.c
index ccb12b0bc9ac..bda42da8696f 100644
--- a/drivers/net/can/kvaser_pciefd.c
+++ b/drivers/net/can/kvaser_pciefd.c
@@ -1361,7 +1361,7 @@ static int kvaser_pciefd_handle_error_packet(struct kvaser_pciefd *pcie,
 		/* Do not report more errors, until bec_poll_timer expires */
 		kvaser_pciefd_disable_err_gen(can);
 	/* Start polling the error counters */
-	mod_timer(&can->bec_poll_timer, KVASER_PCIEFD_BEC_POLL_FREQ);
+	timer_mod(&can->bec_poll_timer, KVASER_PCIEFD_BEC_POLL_FREQ);
 
 	return 0;
 }
@@ -1399,7 +1399,7 @@ static int kvaser_pciefd_handle_status_resp(struct kvaser_pciefd_can *can,
 	can->bec.rxerr = bec.rxerr;
 	/* Check if we need to poll the error counters */
 	if (bec.txerr || bec.rxerr)
-		mod_timer(&can->bec_poll_timer, KVASER_PCIEFD_BEC_POLL_FREQ);
+		timer_mod(&can->bec_poll_timer, KVASER_PCIEFD_BEC_POLL_FREQ);
 
 	return ret;
 }
@@ -1448,7 +1448,7 @@ static int kvaser_pciefd_handle_status_packet(struct kvaser_pciefd *pcie,
 		kvaser_pciefd_handle_status_resp(can, p);
 		if (can->can.state != CAN_STATE_BUS_OFF &&
 		    can->can.state != CAN_STATE_ERROR_ACTIVE) {
-			mod_timer(&can->bec_poll_timer, KVASER_PCIEFD_BEC_POLL_FREQ);
+			timer_mod(&can->bec_poll_timer, KVASER_PCIEFD_BEC_POLL_FREQ);
 		}
 	} else if (p->header[0] & KVASER_PCIEFD_SPACK_RMCD &&
 		   !(status & KVASER_PCIEFD_KCAN_STAT_BUS_OFF_MASK)) {
diff --git a/drivers/net/can/sja1000/peak_pcmcia.c b/drivers/net/can/sja1000/peak_pcmcia.c
index ce18e9e56059..4e622c2ed8c4 100644
--- a/drivers/net/can/sja1000/peak_pcmcia.c
+++ b/drivers/net/can/sja1000/peak_pcmcia.c
@@ -159,7 +159,7 @@ static void pcan_set_leds(struct pcan_pccard *card, u8 mask, u8 state);
 static void pcan_start_led_timer(struct pcan_pccard *card)
 {
 	if (!timer_pending(&card->led_timer))
-		mod_timer(&card->led_timer, jiffies + HZ);
+		timer_mod(&card->led_timer, jiffies + HZ);
 }
 
 /*
@@ -413,7 +413,7 @@ static void pcan_led_timer(struct timer_list *t)
 
 	/* restart timer (except if no more configured channels) */
 	if (up_count)
-		mod_timer(&card->led_timer, jiffies + HZ);
+		timer_mod(&card->led_timer, jiffies + HZ);
 }
 
 /*
diff --git a/drivers/net/can/usb/peak_usb/pcan_usb.c b/drivers/net/can/usb/peak_usb/pcan_usb.c
index 6b293a9056c2..dfa9b26c1240 100644
--- a/drivers/net/can/usb/peak_usb/pcan_usb.c
+++ b/drivers/net/can/usb/peak_usb/pcan_usb.c
@@ -334,7 +334,7 @@ static void pcan_usb_restart_pending(struct urb *urb)
 	struct pcan_usb *pdev = urb->context;
 
 	/* the PCAN-USB needs time to restart */
-	mod_timer(&pdev->restart_timer,
+	timer_mod(&pdev->restart_timer,
 			jiffies + msecs_to_jiffies(PCAN_USB_STARTUP_TIMEOUT));
 
 	/* can delete usb resources */
diff --git a/drivers/net/dsa/mv88e6xxx/phy.c b/drivers/net/dsa/mv88e6xxx/phy.c
index 4e7827ee684a..62bd19858c21 100644
--- a/drivers/net/dsa/mv88e6xxx/phy.c
+++ b/drivers/net/dsa/mv88e6xxx/phy.c
@@ -216,7 +216,7 @@ static int mv88e6xxx_phy_ppu_access_get(struct mv88e6xxx_chip *chip)
 static void mv88e6xxx_phy_ppu_access_put(struct mv88e6xxx_chip *chip)
 {
 	/* Schedule a timer to re-enable the PHY polling unit. */
-	mod_timer(&chip->ppu_timer, jiffies + msecs_to_jiffies(10));
+	timer_mod(&chip->ppu_timer, jiffies + msecs_to_jiffies(10));
 	mutex_unlock(&chip->ppu_mutex);
 }
 
diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
index 198e787e8560..ad42bda863a1 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.c
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
@@ -681,7 +681,7 @@ static void sja1105_ptp_extts_setup_timer(struct sja1105_ptp_data *ptp_data)
 	unsigned long expires = ((jiffies / SJA1105_EXTTS_INTERVAL) + 1) *
 				SJA1105_EXTTS_INTERVAL;
 
-	mod_timer(&ptp_data->extts_timer, expires);
+	timer_mod(&ptp_data->extts_timer, expires);
 }
 
 static void sja1105_ptp_extts_timer(struct timer_list *t)
diff --git a/drivers/net/ethernet/3com/3c515.c b/drivers/net/ethernet/3com/3c515.c
index 843035fbf7fe..7067a9f3576c 100644
--- a/drivers/net/ethernet/3com/3c515.c
+++ b/drivers/net/ethernet/3com/3c515.c
@@ -762,7 +762,7 @@ static int corkscrew_open(struct net_device *dev)
 	}
 
 	if (armtimer)
-		mod_timer(&vp->timer, jiffies + media_tbl[dev->if_port].wait);
+		timer_mod(&vp->timer, jiffies + media_tbl[dev->if_port].wait);
 
 	if (corkscrew_debug > 1) {
 		EL3WINDOW(4);
diff --git a/drivers/net/ethernet/3com/3c589_cs.c b/drivers/net/ethernet/3com/3c589_cs.c
index 77b8430787f9..0d917b8c5331 100644
--- a/drivers/net/ethernet/3com/3c589_cs.c
+++ b/drivers/net/ethernet/3com/3c589_cs.c
@@ -525,7 +525,7 @@ static int el3_open(struct net_device *dev)
 
 	tc589_reset(dev);
 	timer_setup(&lp->media, media_check, 0);
-	mod_timer(&lp->media, jiffies + HZ);
+	timer_mod(&lp->media, jiffies + HZ);
 
 	dev_dbg(&link->dev, "%s: opened, status %4.4x.\n",
 	  dev->name, inw(dev->base_addr + EL3_STATUS));
diff --git a/drivers/net/ethernet/3com/3c59x.c b/drivers/net/ethernet/3com/3c59x.c
index 8c9cc97efd4e..a4ed4fdeb248 100644
--- a/drivers/net/ethernet/3com/3c59x.c
+++ b/drivers/net/ethernet/3com/3c59x.c
@@ -1594,7 +1594,7 @@ vortex_up(struct net_device *dev)
 	}
 
 	timer_setup(&vp->timer, vortex_timer, 0);
-	mod_timer(&vp->timer, RUN_AT(media_tbl[dev->if_port].wait));
+	timer_mod(&vp->timer, RUN_AT(media_tbl[dev->if_port].wait));
 
 	if (vortex_debug > 1)
 		pr_debug("%s: Initial media type %s.\n",
@@ -1874,7 +1874,7 @@ vortex_timer(struct timer_list *t)
 	  pr_debug("%s: Media selection timer finished, %s.\n",
 			 dev->name, media_tbl[dev->if_port].name);
 
-	mod_timer(&vp->timer, RUN_AT(next_tick));
+	timer_mod(&vp->timer, RUN_AT(next_tick));
 	if (vp->deferred)
 		iowrite16(FakeIntr, ioaddr + EL3_CMD);
 }
@@ -2344,7 +2344,7 @@ _vortex_interrupt(int irq, struct net_device *dev)
 				iowrite16(AckIntr | (vp->deferred & 0x7ff), ioaddr + EL3_CMD);
 			} while ((status = ioread16(ioaddr + EL3_CMD)) & IntLatch);
 			/* The timer will reenable interrupts. */
-			mod_timer(&vp->timer, jiffies + 1*HZ);
+			timer_mod(&vp->timer, jiffies + 1*HZ);
 			break;
 		}
 		/* Acknowledge the IRQ. */
@@ -2480,7 +2480,7 @@ _boomerang_interrupt(int irq, struct net_device *dev)
 				iowrite16(AckIntr | (vp->deferred & 0x7ff), ioaddr + EL3_CMD);
 			} while ((status = ioread16(ioaddr + EL3_CMD)) & IntLatch);
 			/* The timer will reenable interrupts. */
-			mod_timer(&vp->timer, jiffies + 1*HZ);
+			timer_mod(&vp->timer, jiffies + 1*HZ);
 			break;
 		}
 		/* Acknowledge the IRQ. */
diff --git a/drivers/net/ethernet/8390/axnet_cs.c b/drivers/net/ethernet/8390/axnet_cs.c
index 80ccea96887b..cc3ff92ec169 100644
--- a/drivers/net/ethernet/8390/axnet_cs.c
+++ b/drivers/net/ethernet/8390/axnet_cs.c
@@ -485,7 +485,7 @@ static int axnet_open(struct net_device *dev)
 
     info->link_status = 0x00;
     timer_setup(&info->watchdog, ei_watchdog, 0);
-    mod_timer(&info->watchdog, jiffies + HZ);
+    timer_mod(&info->watchdog, jiffies + HZ);
 
     return ax_open(dev);
 } /* axnet_open */
diff --git a/drivers/net/ethernet/8390/pcnet_cs.c b/drivers/net/ethernet/8390/pcnet_cs.c
index 07ae1cc347a1..ae0123d3c070 100644
--- a/drivers/net/ethernet/8390/pcnet_cs.c
+++ b/drivers/net/ethernet/8390/pcnet_cs.c
@@ -928,7 +928,7 @@ static int pcnet_open(struct net_device *dev)
     info->phy_id = info->eth_phy;
     info->link_status = 0x00;
     timer_setup(&info->watchdog, ei_watchdog, 0);
-    mod_timer(&info->watchdog, jiffies + HZ);
+    timer_mod(&info->watchdog, jiffies + HZ);
 
     return ei_open(dev);
 } /* pcnet_open */
diff --git a/drivers/net/ethernet/agere/et131x.c b/drivers/net/ethernet/agere/et131x.c
index 5b0274f64318..95ce01eaa76a 100644
--- a/drivers/net/ethernet/agere/et131x.c
+++ b/drivers/net/ethernet/agere/et131x.c
@@ -3106,7 +3106,7 @@ static void et131x_error_timer_handler(struct timer_list *t)
 	}
 
 	/* This is a periodic timer, so reschedule */
-	mod_timer(&adapter->error_timer, jiffies +
+	timer_mod(&adapter->error_timer, jiffies +
 		  msecs_to_jiffies(TX_ERROR_PERIOD));
 }
 
diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
index e4177c7bfa88..1c07c895a690 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -3332,7 +3332,7 @@ static int ena_restore_device(struct ena_adapter *adapter)
 	if (test_bit(ENA_FLAG_LINK_UP, &adapter->flags))
 		netif_carrier_on(adapter->netdev);
 
-	mod_timer(&adapter->timer_service, round_jiffies(jiffies + HZ));
+	timer_mod(&adapter->timer_service, round_jiffies(jiffies + HZ));
 	adapter->last_keep_alive_jiffies = jiffies;
 
 	return rc;
@@ -3695,7 +3695,7 @@ static void ena_timer_service(struct timer_list *t)
 	}
 
 	/* Reset the timer */
-	mod_timer(&adapter->timer_service, round_jiffies(jiffies + HZ));
+	timer_mod(&adapter->timer_service, round_jiffies(jiffies + HZ));
 }
 
 static u32 ena_calc_max_io_queue_num(struct pci_dev *pdev,
@@ -4042,7 +4042,7 @@ static int ena_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	ena_update_hints(adapter, &get_feat_ctx.hw_hints);
 
 	timer_setup(&adapter->timer_service, ena_timer_service, 0);
-	mod_timer(&adapter->timer_service, round_jiffies(jiffies + HZ));
+	timer_mod(&adapter->timer_service, round_jiffies(jiffies + HZ));
 
 	dev_info(&pdev->dev,
 		 "%s found at mem %lx, mac addr %pM\n",
diff --git a/drivers/net/ethernet/amd/a2065.c b/drivers/net/ethernet/amd/a2065.c
index ce9445425045..21e48970e7ec 100644
--- a/drivers/net/ethernet/amd/a2065.c
+++ b/drivers/net/ethernet/amd/a2065.c
@@ -612,7 +612,7 @@ static void lance_set_multicast(struct net_device *dev)
 		return;
 
 	if (lp->tx_old != lp->tx_new) {
-		mod_timer(&lp->multicast_timer, jiffies + 4);
+		timer_mod(&lp->multicast_timer, jiffies + 4);
 		netif_wake_queue(dev);
 		return;
 	}
diff --git a/drivers/net/ethernet/amd/amd8111e.c b/drivers/net/ethernet/amd/amd8111e.c
index 4077a96847b0..a0a40432afac 100644
--- a/drivers/net/ethernet/amd/amd8111e.c
+++ b/drivers/net/ethernet/amd/amd8111e.c
@@ -1632,7 +1632,7 @@ static int __maybe_unused amd8111e_resume(struct device *dev_d)
 	amd8111e_restart(dev);
 	/* Restart ipg timer */
 	if (lp->options & OPTION_DYN_IPG_ENABLE)
-		mod_timer(&lp->ipg_data.ipg_timer,
+		timer_mod(&lp->ipg_data.ipg_timer,
 				jiffies + IPG_CONVERGE_JIFFIES);
 	spin_unlock_irq(&lp->lock);
 
@@ -1694,7 +1694,7 @@ static void amd8111e_config_ipg(struct timer_list *t)
 		writew((u32)tmp_ipg, mmio + IPG);
 		writew((u32)(tmp_ipg - IFS1_DELTA), mmio + IFS1);
 	}
-	mod_timer(&lp->ipg_data.ipg_timer, jiffies + IPG_CONVERGE_JIFFIES);
+	timer_mod(&lp->ipg_data.ipg_timer, jiffies + IPG_CONVERGE_JIFFIES);
 	return;
 
 }
diff --git a/drivers/net/ethernet/amd/declance.c b/drivers/net/ethernet/amd/declance.c
index 8d05a0c5f2d5..ef551bba7e24 100644
--- a/drivers/net/ethernet/amd/declance.c
+++ b/drivers/net/ethernet/amd/declance.c
@@ -979,7 +979,7 @@ static void lance_set_multicast(struct net_device *dev)
 		return;
 
 	if (lp->tx_old != lp->tx_new) {
-		mod_timer(&lp->multicast_timer, jiffies + 4 * HZ/100);
+		timer_mod(&lp->multicast_timer, jiffies + 4 * HZ/100);
 		netif_wake_queue(dev);
 		return;
 	}
diff --git a/drivers/net/ethernet/amd/pcnet32.c b/drivers/net/ethernet/amd/pcnet32.c
index 9eaefa0f5e80..014001acb33d 100644
--- a/drivers/net/ethernet/amd/pcnet32.c
+++ b/drivers/net/ethernet/amd/pcnet32.c
@@ -2285,7 +2285,7 @@ static int pcnet32_open(struct net_device *dev)
 	if (lp->chip_version >= PCNET32_79C970A) {
 		/* Print the link status and start the watchdog */
 		pcnet32_check_media(dev, 1);
-		mod_timer(&lp->watchdog_timer, PCNET32_WATCHDOG_TIMEOUT);
+		timer_mod(&lp->watchdog_timer, PCNET32_WATCHDOG_TIMEOUT);
 	}
 
 	i = 0;
@@ -2914,7 +2914,7 @@ static void pcnet32_watchdog(struct timer_list *t)
 	pcnet32_check_media(dev, 0);
 	spin_unlock_irqrestore(&lp->lock, flags);
 
-	mod_timer(&lp->watchdog_timer, round_jiffies(PCNET32_WATCHDOG_TIMEOUT));
+	timer_mod(&lp->watchdog_timer, round_jiffies(PCNET32_WATCHDOG_TIMEOUT));
 }
 
 static int __maybe_unused pcnet32_pm_suspend(struct device *device_d)
diff --git a/drivers/net/ethernet/amd/pds_core/main.c b/drivers/net/ethernet/amd/pds_core/main.c
index 9b81e1c260c2..3fa8d1479c4e 100644
--- a/drivers/net/ethernet/amd/pds_core/main.c
+++ b/drivers/net/ethernet/amd/pds_core/main.c
@@ -26,7 +26,7 @@ static void pdsc_wdtimer_cb(struct timer_list *t)
 	struct pdsc *pdsc = timer_container_of(pdsc, t, wdtimer);
 
 	dev_dbg(pdsc->dev, "%s: jiffies %ld\n", __func__, jiffies);
-	mod_timer(&pdsc->wdtimer,
+	timer_mod(&pdsc->wdtimer,
 		  round_jiffies(jiffies + pdsc->wdtimer_period));
 
 	queue_work(pdsc->wq, &pdsc->health_work);
@@ -293,7 +293,7 @@ static int pdsc_init_pf(struct pdsc *pdsc)
 	devl_unlock(dl);
 
 	/* Lastly, start the health check timer */
-	mod_timer(&pdsc->wdtimer, round_jiffies(jiffies + pdsc->wdtimer_period));
+	timer_mod(&pdsc->wdtimer, round_jiffies(jiffies + pdsc->wdtimer_period));
 
 	return 0;
 
@@ -475,7 +475,7 @@ static void pdsc_restart_health_thread(struct pdsc *pdsc)
 		return;
 
 	timer_setup(&pdsc->wdtimer, pdsc_wdtimer_cb, 0);
-	mod_timer(&pdsc->wdtimer, jiffies + 1);
+	timer_mod(&pdsc->wdtimer, jiffies + 1);
 }
 
 static void pdsc_reset_prepare(struct pci_dev *pdev)
diff --git a/drivers/net/ethernet/amd/sunlance.c b/drivers/net/ethernet/amd/sunlance.c
index 0b273327f5a6..6087d11ecbdf 100644
--- a/drivers/net/ethernet/amd/sunlance.c
+++ b/drivers/net/ethernet/amd/sunlance.c
@@ -1211,7 +1211,7 @@ static void lance_set_multicast(struct net_device *dev)
 		return;
 
 	if (lp->tx_old != lp->tx_new) {
-		mod_timer(&lp->multicast_timer, jiffies + 4);
+		timer_mod(&lp->multicast_timer, jiffies + 4);
 		netif_wake_queue(dev);
 		return;
 	}
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-dev.c b/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
index f393228d41c7..31e51b5d4e32 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
@@ -1713,7 +1713,7 @@ static void xgbe_tx_start_xmit(struct xgbe_channel *channel,
 	/* Start the Tx timer */
 	if (pdata->tx_usecs && !channel->tx_timer_active) {
 		channel->tx_timer_active = 1;
-		mod_timer(&channel->tx_timer,
+		timer_mod(&channel->tx_timer,
 			  jiffies + usecs_to_jiffies(pdata->tx_usecs));
 	}
 
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-drv.c b/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
index 91f19eb286cd..97a87068a210 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
@@ -687,7 +687,7 @@ static void xgbe_service_timer(struct timer_list *t)
 
 	queue_work(pdata->dev_workqueue, &pdata->service_work);
 
-	mod_timer(&pdata->service_timer, jiffies + HZ);
+	timer_mod(&pdata->service_timer, jiffies + HZ);
 
 	if (!pdata->tx_usecs)
 		return;
@@ -697,7 +697,7 @@ static void xgbe_service_timer(struct timer_list *t)
 		if (!channel->tx_ring || channel->tx_timer_active)
 			break;
 		channel->tx_timer_active = 1;
-		mod_timer(&channel->tx_timer,
+		timer_mod(&channel->tx_timer,
 			  jiffies + usecs_to_jiffies(pdata->tx_usecs));
 	}
 }
@@ -720,7 +720,7 @@ static void xgbe_init_timers(struct xgbe_prv_data *pdata)
 
 static void xgbe_start_timers(struct xgbe_prv_data *pdata)
 {
-	mod_timer(&pdata->service_timer, jiffies + HZ);
+	timer_mod(&pdata->service_timer, jiffies + HZ);
 }
 
 static void xgbe_stop_timers(struct xgbe_prv_data *pdata)
diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c b/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
index 99b124e40bdc..627fab31fce5 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
@@ -256,7 +256,7 @@ static void aq_nic_service_timer_cb(struct timer_list *t)
 {
 	struct aq_nic_s *self = timer_container_of(self, t, service_timer);
 
-	mod_timer(&self->service_timer,
+	timer_mod(&self->service_timer,
 		  jiffies + AQ_CFG_SERVICE_TIMER_INTERVAL);
 
 	aq_ndev_schedule_work(&self->service_task);
@@ -270,7 +270,7 @@ static void aq_nic_polling_timer_cb(struct timer_list *t)
 	for (i = 0U; self->aq_vecs > i; ++i)
 		aq_vec_isr(i, (void *)self->aq_vec[i]);
 
-	mod_timer(&self->polling_timer, jiffies +
+	timer_mod(&self->polling_timer, jiffies +
 		  AQ_CFG_POLLING_TIMER_INTERVAL);
 }
 
@@ -517,7 +517,7 @@ int aq_nic_start(struct aq_nic_s *self)
 
 	if (cfg->is_polling) {
 		timer_setup(&self->polling_timer, aq_nic_polling_timer_cb, 0);
-		mod_timer(&self->polling_timer, jiffies +
+		timer_mod(&self->polling_timer, jiffies +
 			  AQ_CFG_POLLING_TIMER_INTERVAL);
 	} else {
 		for (i = 0U; self->aq_vecs > i; ++i) {
diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index d8e6f23e1432..626ef76df18d 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1718,7 +1718,7 @@ static int ag71xx_poll(struct napi_struct *napi, int limit)
 oom:
 	netif_err(ag, rx_err, ndev, "out of memory\n");
 
-	mod_timer(&ag->oom_timer, jiffies + AG71XX_OOM_REFILL);
+	timer_mod(&ag->oom_timer, jiffies + AG71XX_OOM_REFILL);
 	napi_complete(napi);
 	return 0;
 }
diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
index 6ad73d93a247..5e382f97a40f 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -1380,7 +1380,7 @@ static u32 atl1_check_link(struct atl1_adapter *adapter)
 	/* auto-neg, insert timer to re-config phy */
 	if (!adapter->phy_timer_pending) {
 		adapter->phy_timer_pending = true;
-		mod_timer(&adapter->phy_config_timer,
+		timer_mod(&adapter->phy_config_timer,
 			  round_jiffies(jiffies + 3 * HZ));
 	}
 
diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index b46a6a0fc7e4..e9d045bfc3f6 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -717,7 +717,7 @@ static int atl2_open(struct net_device *netdev)
 
 	clear_bit(__ATL2_DOWN, &adapter->flags);
 
-	mod_timer(&adapter->watchdog_timer, round_jiffies(jiffies + 4*HZ));
+	timer_mod(&adapter->watchdog_timer, round_jiffies(jiffies + 4*HZ));
 
 	val = ATL2_READ_REG(&adapter->hw, REG_MASTER_CTRL);
 	ATL2_WRITE_REG(&adapter->hw, REG_MASTER_CTRL,
@@ -1024,7 +1024,7 @@ static void atl2_watchdog(struct timer_list *t)
 		adapter->netdev->stats.rx_over_errors += drop_rxd + drop_rxs;
 
 		/* Reset the timer */
-		mod_timer(&adapter->watchdog_timer,
+		timer_mod(&adapter->watchdog_timer,
 			  round_jiffies(jiffies + 4 * HZ));
 	}
 }
@@ -1226,7 +1226,7 @@ static int atl2_check_link(struct atl2_adapter *adapter)
 	 * (if interval smaller than 5 seconds, something strange) */
 	if (!test_bit(__ATL2_DOWN, &adapter->flags)) {
 		if (!test_and_set_bit(0, &adapter->cfg_phy))
-			mod_timer(&adapter->phy_config_timer,
+			timer_mod(&adapter->phy_config_timer,
 				  round_jiffies(jiffies + 5 * HZ));
 	}
 
diff --git a/drivers/net/ethernet/broadcom/b44.c b/drivers/net/ethernet/broadcom/b44.c
index 3db6bc4e30f5..4ed9ec3f2d9d 100644
--- a/drivers/net/ethernet/broadcom/b44.c
+++ b/drivers/net/ethernet/broadcom/b44.c
@@ -585,7 +585,7 @@ static void b44_timer(struct timer_list *t)
 
 	spin_unlock_irq(&bp->lock);
 
-	mod_timer(&bp->timer, round_jiffies(jiffies + HZ));
+	timer_mod(&bp->timer, round_jiffies(jiffies + HZ));
 }
 
 static void b44_tx(struct b44 *bp)
@@ -2535,7 +2535,7 @@ static int b44_resume(struct ssb_device *sdev)
 	b44_enable_ints(bp);
 	netif_wake_queue(dev);
 
-	mod_timer(&bp->timer, jiffies + 1);
+	timer_mod(&bp->timer, jiffies + 1);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
index 986cc73f328f..f33f283d8f88 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -2309,7 +2309,7 @@ static int bcm_enetsw_open(struct net_device *dev)
 
 	/* start phy polling timer */
 	timer_setup(&priv->swphy_poll, swphy_poll_timer, 0);
-	mod_timer(&priv->swphy_poll, jiffies);
+	timer_mod(&priv->swphy_poll, jiffies);
 	return 0;
 
 out:
diff --git a/drivers/net/ethernet/broadcom/bnx2.c b/drivers/net/ethernet/broadcom/bnx2.c
index cb1011f6fd30..e8e990cf2096 100644
--- a/drivers/net/ethernet/broadcom/bnx2.c
+++ b/drivers/net/ethernet/broadcom/bnx2.c
@@ -1859,7 +1859,7 @@ __acquires(&bp->phy_lock)
 		 */
 		bp->current_interval = BNX2_SERDES_AN_TIMEOUT;
 		bp->serdes_an_pending = 1;
-		mod_timer(&bp->timer, jiffies + bp->current_interval);
+		timer_mod(&bp->timer, jiffies + bp->current_interval);
 	} else {
 		bnx2_resolve_flow_ctrl(bp);
 		bnx2_set_mac_link(bp);
@@ -6193,7 +6193,7 @@ bnx2_timer(struct timer_list *t)
 	}
 
 bnx2_restart_timer:
-	mod_timer(&bp->timer, jiffies + bp->current_interval);
+	timer_mod(&bp->timer, jiffies + bp->current_interval);
 }
 
 static int
@@ -6374,7 +6374,7 @@ bnx2_open(struct net_device *dev)
 	if (rc)
 		goto open_err;
 
-	mod_timer(&bp->timer, jiffies + bp->current_interval);
+	timer_mod(&bp->timer, jiffies + bp->current_interval);
 
 	atomic_set(&bp->intr_sem, 0);
 
@@ -7168,7 +7168,7 @@ bnx2_nway_reset(struct net_device *dev)
 
 		bp->current_interval = BNX2_SERDES_AN_TIMEOUT;
 		bp->serdes_an_pending = 1;
-		mod_timer(&bp->timer, jiffies + bp->current_interval);
+		timer_mod(&bp->timer, jiffies + bp->current_interval);
 	}
 
 	bnx2_read_phy(bp, bp->mii_bmcr, &bmcr);
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
index e59530357e2c..282dbd854d8c 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
@@ -2895,7 +2895,7 @@ int bnx2x_nic_load(struct bnx2x *bp, int load_mode)
 		bnx2x__link_status_update(bp);
 
 	/* start the timer */
-	mod_timer(&bp->timer, jiffies + bp->current_interval);
+	timer_mod(&bp->timer, jiffies + bp->current_interval);
 
 	if (CNIC_ENABLED(bp))
 		bnx2x_load_cnic(bp);
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index c9a1a1d504c0..c53b6a9d2781 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -5818,7 +5818,7 @@ static void bnx2x_timer(struct timer_list *t)
 	if (IS_VF(bp))
 		bnx2x_timer_sriov(bp);
 
-	mod_timer(&bp->timer, jiffies + bp->current_interval);
+	timer_mod(&bp->timer, jiffies + bp->current_interval);
 }
 
 /* end of Statistics */
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index f181c72df902..f553e8e6ba5f 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -12788,7 +12788,7 @@ static int __bnxt_open_nic(struct bnxt *bp, bool irq_re_init, bool link_re_init)
 	bnxt_enable_int(bp);
 	/* Enable TX queues */
 	bnxt_tx_enable(bp);
-	mod_timer(&bp->timer, jiffies + bp->current_interval);
+	timer_mod(&bp->timer, jiffies + bp->current_interval);
 	/* Poll link status and check for SFP+ module status */
 	mutex_lock(&bp->link_lock);
 	bnxt_get_port_module_status(bp);
@@ -13989,7 +13989,7 @@ static void bnxt_timer(struct timer_list *t)
 		bnxt_queue_sp_work(bp, BNXT_RING_COAL_NOW_SP_EVENT);
 
 bnxt_restart_timer:
-	mod_timer(&bp->timer, jiffies + bp->current_interval);
+	timer_mod(&bp->timer, jiffies + bp->current_interval);
 }
 
 static void bnxt_lock_sp(struct bnxt *bp)
diff --git a/drivers/net/ethernet/brocade/bna/bfa_ioc.c b/drivers/net/ethernet/brocade/bna/bfa_ioc.c
index 92c7639d1fc7..d6a555a18d33 100644
--- a/drivers/net/ethernet/brocade/bna/bfa_ioc.c
+++ b/drivers/net/ethernet/brocade/bna/bfa_ioc.c
@@ -303,7 +303,7 @@ bfa_ioc_sm_enabling(struct bfa_ioc *ioc, enum ioc_event event)
 static void
 bfa_ioc_sm_getattr_entry(struct bfa_ioc *ioc)
 {
-	mod_timer(&ioc->ioc_timer, jiffies +
+	timer_mod(&ioc->ioc_timer, jiffies +
 		msecs_to_jiffies(BFA_IOC_TOV));
 	bfa_ioc_send_getattr(ioc);
 }
@@ -604,7 +604,7 @@ bfa_iocpf_sm_fwcheck(struct bfa_iocpf *iocpf, enum iocpf_event event)
 			} else {
 				bfa_ioc_firmware_unlock(ioc);
 				bfa_nw_ioc_hw_sem_release(ioc);
-				mod_timer(&ioc->sem_timer, jiffies +
+				timer_mod(&ioc->sem_timer, jiffies +
 					msecs_to_jiffies(BFA_IOC_HWSEM_TOV));
 			}
 		} else {
@@ -643,7 +643,7 @@ bfa_iocpf_sm_mismatch_entry(struct bfa_iocpf *iocpf)
 		bfa_ioc_pf_fwmismatch(iocpf->ioc);
 
 	iocpf->fw_mismatch_notified = true;
-	mod_timer(&(iocpf->ioc)->iocpf_timer, jiffies +
+	timer_mod(&(iocpf->ioc)->iocpf_timer, jiffies +
 		msecs_to_jiffies(BFA_IOC_TOV));
 }
 
@@ -694,7 +694,7 @@ bfa_iocpf_sm_semwait(struct bfa_iocpf *iocpf, enum iocpf_event event)
 			bfa_fsm_set_state(iocpf, bfa_iocpf_sm_hwinit);
 		} else {
 			bfa_nw_ioc_hw_sem_release(ioc);
-			mod_timer(&ioc->sem_timer, jiffies +
+			timer_mod(&ioc->sem_timer, jiffies +
 				msecs_to_jiffies(BFA_IOC_HWSEM_TOV));
 		}
 		break;
@@ -755,7 +755,7 @@ bfa_iocpf_sm_hwinit(struct bfa_iocpf *iocpf, enum iocpf_event event)
 static void
 bfa_iocpf_sm_enabling_entry(struct bfa_iocpf *iocpf)
 {
-	mod_timer(&(iocpf->ioc)->iocpf_timer, jiffies +
+	timer_mod(&(iocpf->ioc)->iocpf_timer, jiffies +
 		msecs_to_jiffies(BFA_IOC_TOV));
 	/**
 	 * Enable Interrupts before sending fw IOC ENABLE cmd.
@@ -831,7 +831,7 @@ bfa_iocpf_sm_ready(struct bfa_iocpf *iocpf, enum iocpf_event event)
 static void
 bfa_iocpf_sm_disabling_entry(struct bfa_iocpf *iocpf)
 {
-	mod_timer(&(iocpf->ioc)->iocpf_timer, jiffies +
+	timer_mod(&(iocpf->ioc)->iocpf_timer, jiffies +
 		msecs_to_jiffies(BFA_IOC_TOV));
 	bfa_ioc_send_disable(iocpf->ioc);
 }
@@ -1197,7 +1197,7 @@ bfa_ioc_hw_sem_get(struct bfa_ioc *ioc)
 		return;
 	}
 
-	mod_timer(&ioc->sem_timer, jiffies +
+	timer_mod(&ioc->sem_timer, jiffies +
 		msecs_to_jiffies(BFA_IOC_HWSEM_TOV));
 }
 
@@ -1967,7 +1967,7 @@ bfa_nw_ioc_hb_check(struct bfa_ioc *ioc)
 	}
 
 	bfa_ioc_mbox_poll(ioc);
-	mod_timer(&ioc->hb_timer, jiffies +
+	timer_mod(&ioc->hb_timer, jiffies +
 		msecs_to_jiffies(BFA_IOC_HB_TOV));
 }
 
@@ -1975,7 +1975,7 @@ static void
 bfa_ioc_hb_monitor(struct bfa_ioc *ioc)
 {
 	ioc->hb_count = readl(ioc->ioc_regs.heartbeat);
-	mod_timer(&ioc->hb_timer, jiffies +
+	timer_mod(&ioc->hb_timer, jiffies +
 		msecs_to_jiffies(BFA_IOC_HB_TOV));
 }
 
@@ -3011,7 +3011,7 @@ bfa_ioc_poll_fwinit(struct bfa_ioc *ioc)
 		bfa_fsm_send_event(&ioc->iocpf, IOCPF_E_TIMEOUT);
 	} else {
 		ioc->iocpf.poll_time += BFA_IOC_POLL_TOV;
-		mod_timer(&ioc->iocpf_timer, jiffies +
+		timer_mod(&ioc->iocpf_timer, jiffies +
 			msecs_to_jiffies(BFA_IOC_POLL_TOV));
 	}
 }
diff --git a/drivers/net/ethernet/brocade/bna/bnad.c b/drivers/net/ethernet/brocade/bna/bnad.c
index 93e8fd762769..a1986e558f5e 100644
--- a/drivers/net/ethernet/brocade/bna/bnad.c
+++ b/drivers/net/ethernet/brocade/bna/bnad.c
@@ -1284,7 +1284,7 @@ bnad_cb_stats_get(struct bnad *bnad, enum bna_cb_status status,
 		!test_bit(BNAD_RF_STATS_TIMER_RUNNING, &bnad->run_flags))
 		return;
 
-	mod_timer(&bnad->stats_timer,
+	timer_mod(&bnad->stats_timer,
 		  jiffies + msecs_to_jiffies(BNAD_STATS_TIMER_FREQ));
 }
 
@@ -1736,7 +1736,7 @@ bnad_iocpf_sem_timeout(struct timer_list *t)
  *	0       1 = test_bit
  *	1			clear_bit
  *	2			del_timer_sync
- *	3	mod_timer
+ *	3	timer_mod
  */
 
 /* b) Dynamic Interrupt Moderation Timer */
@@ -1767,7 +1767,7 @@ bnad_dim_timeout(struct timer_list *t)
 
 	/* Check for BNAD_CF_DIM_ENABLED, does not eliminate a race */
 	if (test_bit(BNAD_RF_DIM_TIMER_RUNNING, &bnad->run_flags))
-		mod_timer(&bnad->dim_timer,
+		timer_mod(&bnad->dim_timer,
 			  jiffies + msecs_to_jiffies(BNAD_DIM_TIMER_FREQ));
 	spin_unlock_irqrestore(&bnad->bna_lock, flags);
 }
@@ -1799,7 +1799,7 @@ bnad_dim_timer_start(struct bnad *bnad)
 	    !test_bit(BNAD_RF_DIM_TIMER_RUNNING, &bnad->run_flags)) {
 		timer_setup(&bnad->dim_timer, bnad_dim_timeout, 0);
 		set_bit(BNAD_RF_DIM_TIMER_RUNNING, &bnad->run_flags);
-		mod_timer(&bnad->dim_timer,
+		timer_mod(&bnad->dim_timer,
 			  jiffies + msecs_to_jiffies(BNAD_DIM_TIMER_FREQ));
 	}
 }
@@ -1816,7 +1816,7 @@ bnad_stats_timer_start(struct bnad *bnad)
 	spin_lock_irqsave(&bnad->bna_lock, flags);
 	if (!test_and_set_bit(BNAD_RF_STATS_TIMER_RUNNING, &bnad->run_flags)) {
 		timer_setup(&bnad->stats_timer, bnad_stats_timeout, 0);
-		mod_timer(&bnad->stats_timer,
+		timer_mod(&bnad->stats_timer,
 			  jiffies + msecs_to_jiffies(BNAD_STATS_TIMER_FREQ));
 	}
 	spin_unlock_irqrestore(&bnad->bna_lock, flags);
diff --git a/drivers/net/ethernet/chelsio/cxgb/sge.c b/drivers/net/ethernet/chelsio/cxgb/sge.c
index 5f354cf62cdd..a1ae01596c4d 100644
--- a/drivers/net/ethernet/chelsio/cxgb/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb/sge.c
@@ -1936,7 +1936,7 @@ static void sge_tx_reclaim_cb(struct timer_list *t)
 		}
 		spin_unlock(&q->lock);
 	}
-	mod_timer(&sge->tx_reclaim_timer, jiffies + TX_RECLAIM_PERIOD);
+	timer_mod(&sge->tx_reclaim_timer, jiffies + TX_RECLAIM_PERIOD);
 }
 
 /*
@@ -2006,10 +2006,10 @@ void t1_sge_start(struct sge *sge)
 	doorbell_pio(sge->adapter, F_FL0_ENABLE | F_FL1_ENABLE);
 	readl(sge->adapter->regs + A_SG_CONTROL); /* flush */
 
-	mod_timer(&sge->tx_reclaim_timer, jiffies + TX_RECLAIM_PERIOD);
+	timer_mod(&sge->tx_reclaim_timer, jiffies + TX_RECLAIM_PERIOD);
 
 	if (is_T2(sge->adapter))
-		mod_timer(&sge->espibug_timer, jiffies + sge->espibug_timeout);
+		timer_mod(&sge->espibug_timer, jiffies + sge->espibug_timeout);
 }
 
 /*
@@ -2055,7 +2055,7 @@ static void espibug_workaround_t204(struct timer_list *t)
 			t1_sge_tx(skb, adapter, 0, adapter->port[i].dev);
 		}
 	}
-	mod_timer(&sge->espibug_timer, jiffies + sge->espibug_timeout);
+	timer_mod(&sge->espibug_timer, jiffies + sge->espibug_timeout);
 }
 
 static void espibug_workaround(struct timer_list *t)
@@ -2087,7 +2087,7 @@ static void espibug_workaround(struct timer_list *t)
 	                t1_sge_tx(skb, adapter, 0, adapter->port[0].dev);
 	        }
 	}
-	mod_timer(&sge->espibug_timer, jiffies + sge->espibug_timeout);
+	timer_mod(&sge->espibug_timer, jiffies + sge->espibug_timeout);
 }
 
 /*
diff --git a/drivers/net/ethernet/chelsio/cxgb3/sge.c b/drivers/net/ethernet/chelsio/cxgb3/sge.c
index b59735d0e065..6dbf0889fabe 100644
--- a/drivers/net/ethernet/chelsio/cxgb3/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/sge.c
@@ -2927,7 +2927,7 @@ static void sge_timer_tx(struct timer_list *t)
 	next_period = TX_RECLAIM_PERIOD >>
                       (max(tbd[TXQ_ETH], tbd[TXQ_OFLD]) /
                       TX_RECLAIM_TIMER_CHUNK);
-	mod_timer(&qs->tx_reclaim_timer, jiffies + next_period);
+	timer_mod(&qs->tx_reclaim_timer, jiffies + next_period);
 }
 
 /**
@@ -2984,7 +2984,7 @@ static void sge_timer_rx(struct timer_list *t)
 unlock:
 	spin_unlock_irq(lock);
 out:
-	mod_timer(&qs->rx_reclaim_timer, jiffies + RX_RECLAIM_PERIOD);
+	timer_mod(&qs->rx_reclaim_timer, jiffies + RX_RECLAIM_PERIOD);
 }
 
 /**
@@ -3200,11 +3200,11 @@ void t3_start_sge_timers(struct adapter *adap)
 		struct sge_qset *q = &adap->sge.qs[i];
 
 		if (q->tx_reclaim_timer.function)
-			mod_timer(&q->tx_reclaim_timer,
+			timer_mod(&q->tx_reclaim_timer,
 				  jiffies + TX_RECLAIM_PERIOD);
 
 		if (q->rx_reclaim_timer.function)
-			mod_timer(&q->rx_reclaim_timer,
+			timer_mod(&q->rx_reclaim_timer,
 				  jiffies + RX_RECLAIM_PERIOD);
 	}
 }
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
index 0765d000eaef..eaf96ee960c7 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
@@ -1046,7 +1046,7 @@ static void ch_flower_stats_handler(struct work_struct *work)
 
 	} while (flower_entry == ERR_PTR(-EAGAIN));
 	rhashtable_walk_exit(&iter);
-	mod_timer(&adap->flower_stats_timer, jiffies + STATS_CHECK_PERIOD);
+	timer_mod(&adap->flower_stats_timer, jiffies + STATS_CHECK_PERIOD);
 }
 
 static void ch_flower_stats_cb(struct timer_list *t)
@@ -1123,7 +1123,7 @@ int cxgb4_init_tc_flower(struct adapter *adap)
 
 	INIT_WORK(&adap->flower_stats_work, ch_flower_stats_handler);
 	timer_setup(&adap->flower_stats_timer, ch_flower_stats_cb, 0);
-	mod_timer(&adap->flower_stats_timer, jiffies + STATS_CHECK_PERIOD);
+	timer_mod(&adap->flower_stats_timer, jiffies + STATS_CHECK_PERIOD);
 	adap->tc_flower_initialized = true;
 	return 0;
 }
diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index ecd53235dc9d..9153c39b0f3d 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -4263,7 +4263,7 @@ static void sge_rx_timer_cb(struct timer_list *t)
 	t4_idma_monitor(adap, &s->idma_monitor, HZ, RX_QCHECK_PERIOD);
 
 done:
-	mod_timer(&s->rx_timer, jiffies + RX_QCHECK_PERIOD);
+	timer_mod(&s->rx_timer, jiffies + RX_QCHECK_PERIOD);
 }
 
 static void sge_tx_timer_cb(struct timer_list *t)
@@ -4321,7 +4321,7 @@ static void sge_tx_timer_cb(struct timer_list *t)
 		period = TX_QCHECK_PERIOD;
 	}
 
-	mod_timer(&s->tx_timer, jiffies + period);
+	timer_mod(&s->tx_timer, jiffies + period);
 }
 
 /**
@@ -4978,8 +4978,8 @@ void t4_free_sge_resources(struct adapter *adap)
 void t4_sge_start(struct adapter *adap)
 {
 	adap->sge.ethtxq_rover = 0;
-	mod_timer(&adap->sge.rx_timer, jiffies + RX_QCHECK_PERIOD);
-	mod_timer(&adap->sge.tx_timer, jiffies + TX_QCHECK_PERIOD);
+	timer_mod(&adap->sge.rx_timer, jiffies + RX_QCHECK_PERIOD);
+	timer_mod(&adap->sge.tx_timer, jiffies + TX_QCHECK_PERIOD);
 }
 
 /**
diff --git a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
index 4e6ecb9c8dcc..47b901016adc 100644
--- a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
@@ -2105,7 +2105,7 @@ static void sge_rx_timer_cb(struct timer_list *t)
 	/*
 	 * Reschedule the next scan for starving Free Lists ...
 	 */
-	mod_timer(&s->rx_timer, jiffies + RX_QCHECK_PERIOD);
+	timer_mod(&s->rx_timer, jiffies + RX_QCHECK_PERIOD);
 }
 
 /**
@@ -2156,7 +2156,7 @@ static void sge_tx_timer_cb(struct timer_list *t)
 	 * near future to continue where we left off.  Otherwise the next timer
 	 * will be at its normal interval.
 	 */
-	mod_timer(&s->tx_timer, jiffies + (budget ? TX_QCHECK_PERIOD : 2));
+	timer_mod(&s->tx_timer, jiffies + (budget ? TX_QCHECK_PERIOD : 2));
 }
 
 /**
@@ -2592,8 +2592,8 @@ void t4vf_free_sge_resources(struct adapter *adapter)
 void t4vf_sge_start(struct adapter *adapter)
 {
 	adapter->sge.ethtxq_rover = 0;
-	mod_timer(&adapter->sge.rx_timer, jiffies + RX_QCHECK_PERIOD);
-	mod_timer(&adapter->sge.tx_timer, jiffies + TX_QCHECK_PERIOD);
+	timer_mod(&adapter->sge.rx_timer, jiffies + RX_QCHECK_PERIOD);
+	timer_mod(&adapter->sge.tx_timer, jiffies + TX_QCHECK_PERIOD);
 }
 
 /**
diff --git a/drivers/net/ethernet/cisco/enic/enic_clsf.c b/drivers/net/ethernet/cisco/enic/enic_clsf.c
index 837f954873ee..7f0be15161b3 100644
--- a/drivers/net/ethernet/cisco/enic/enic_clsf.c
+++ b/drivers/net/ethernet/cisco/enic/enic_clsf.c
@@ -150,7 +150,7 @@ void enic_flow_may_expire(struct timer_list *t)
 		}
 	}
 	spin_unlock_bh(&enic->rfs_h.lock);
-	mod_timer(&enic->rfs_h.rfs_may_expire, jiffies + HZ/4);
+	timer_mod(&enic->rfs_h.rfs_may_expire, jiffies + HZ/4);
 }
 
 static struct enic_rfs_fltr_node *htbl_key_search(struct hlist_head *h,
diff --git a/drivers/net/ethernet/cisco/enic/enic_clsf.h b/drivers/net/ethernet/cisco/enic/enic_clsf.h
index 5f5284102fb0..b4620ea19301 100644
--- a/drivers/net/ethernet/cisco/enic/enic_clsf.h
+++ b/drivers/net/ethernet/cisco/enic/enic_clsf.h
@@ -21,7 +21,7 @@ void enic_flow_may_expire(struct timer_list *t);
 static inline void enic_rfs_timer_start(struct enic *enic)
 {
 	timer_setup(&enic->rfs_h.rfs_may_expire, enic_flow_may_expire, 0);
-	mod_timer(&enic->rfs_h.rfs_may_expire, jiffies + HZ/4);
+	timer_mod(&enic->rfs_h.rfs_may_expire, jiffies + HZ/4);
 }
 
 static inline void enic_rfs_timer_stop(struct enic *enic)
diff --git a/drivers/net/ethernet/cisco/enic/enic_main.c b/drivers/net/ethernet/cisco/enic/enic_main.c
index 8f933bdd1c81..d77108d102ab 100644
--- a/drivers/net/ethernet/cisco/enic/enic_main.c
+++ b/drivers/net/ethernet/cisco/enic/enic_main.c
@@ -1514,7 +1514,7 @@ static void enic_notify_timer(struct timer_list *t)
 
 	enic_notify_check(enic);
 
-	mod_timer(&enic->notify_timer,
+	timer_mod(&enic->notify_timer,
 		round_jiffies(jiffies + ENIC_NOTIFY_TIMER_PERIOD));
 }
 
@@ -1667,7 +1667,7 @@ static void enic_notify_timer_start(struct enic *enic)
 {
 	switch (vnic_dev_get_intr_mode(enic->vdev)) {
 	case VNIC_DEV_INTR_MODE_MSI:
-		mod_timer(&enic->notify_timer, jiffies);
+		timer_mod(&enic->notify_timer, jiffies);
 		break;
 	default:
 		/* Using intr for notification for INTx/MSI-X */
diff --git a/drivers/net/ethernet/dec/tulip/21142.c b/drivers/net/ethernet/dec/tulip/21142.c
index 09c2682ae07c..67ee17456c5b 100644
--- a/drivers/net/ethernet/dec/tulip/21142.c
+++ b/drivers/net/ethernet/dec/tulip/21142.c
@@ -101,10 +101,10 @@ void t21142_media_task(struct work_struct *work)
 		next_tick = 3*HZ;
 	}
 
-	/* mod_timer synchronizes us with potential timer_add calls
+	/* timer_mod synchronizes us with potential timer_add calls
 	 * from interrupts.
 	 */
-	mod_timer(&tp->timer, RUN_AT(next_tick));
+	timer_mod(&tp->timer, RUN_AT(next_tick));
 }
 
 
diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index 0bc15c31023a..b5decae426c3 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -1166,7 +1166,7 @@ static void de_media_interrupt (struct de_private *de, u32 status)
 			de_start_rxtx(de);
 		}
 		de_link_up(de);
-		mod_timer(&de->media_timer, jiffies + DE_TIMER_LINK);
+		timer_mod(&de->media_timer, jiffies + DE_TIMER_LINK);
 		return;
 	}
 
@@ -1175,7 +1175,7 @@ static void de_media_interrupt (struct de_private *de, u32 status)
 	if (netif_carrier_ok(de->dev) && de->media_type != DE_MEDIA_AUI &&
 	    de->media_type != DE_MEDIA_BNC) {
 		de_link_down(de);
-		mod_timer(&de->media_timer, jiffies + DE_TIMER_NO_LINK);
+		timer_mod(&de->media_timer, jiffies + DE_TIMER_NO_LINK);
 	}
 }
 
@@ -1410,7 +1410,7 @@ static int de_open (struct net_device *dev)
 	}
 
 	netif_start_queue(dev);
-	mod_timer(&de->media_timer, jiffies + DE_TIMER_NO_LINK);
+	timer_mod(&de->media_timer, jiffies + DE_TIMER_NO_LINK);
 
 	return 0;
 
@@ -1589,7 +1589,7 @@ static int __de_set_link_ksettings(struct de_private *de,
 		return 0; /* nothing to change */
 
 	de_link_down(de);
-	mod_timer(&de->media_timer, jiffies + DE_TIMER_NO_LINK);
+	timer_mod(&de->media_timer, jiffies + DE_TIMER_NO_LINK);
 	de_stop_rxtx(de);
 
 	de->media_type = new_media;
diff --git a/drivers/net/ethernet/dec/tulip/interrupt.c b/drivers/net/ethernet/dec/tulip/interrupt.c
index 0a12cb9b3ba7..caaa7cf5c930 100644
--- a/drivers/net/ethernet/dec/tulip/interrupt.c
+++ b/drivers/net/ethernet/dec/tulip/interrupt.c
@@ -352,7 +352,7 @@ int tulip_poll(struct napi_struct *napi, int budget)
  oom:    /* Executed with RX ints disabled */
 
          /* Start timer, stop polling, but do not enable rx interrupts. */
-         mod_timer(&tp->oom_timer, jiffies+1);
+         timer_mod(&tp->oom_timer, jiffies+1);
 
          /* Think: timer_pending() was an explicit signature of bug.
           * Timer can be pending now but fired and completed
@@ -750,7 +750,7 @@ irqreturn_t tulip_interrupt(int irq, void *dev_instance)
                         } else if (tp->chip_id == LC82C168) {
 				/* the LC82C168 doesn't have a hw timer.*/
 				iowrite32(0x00, ioaddr + CSR7);
-				mod_timer(&tp->timer, RUN_AT(HZ/50));
+				timer_mod(&tp->timer, RUN_AT(HZ/50));
 			} else {
                           /* Mask all interrupting sources, set timer to
 				re-enable. */
@@ -793,7 +793,7 @@ irqreturn_t tulip_interrupt(int irq, void *dev_instance)
 				 tp->nir, tp->cur_rx, tp->ttimer, rx);
 		if (tp->chip_id == LC82C168) {
 			iowrite32(0x00, ioaddr + CSR7);
-			mod_timer(&tp->timer, RUN_AT(HZ/50));
+			timer_mod(&tp->timer, RUN_AT(HZ/50));
 		} else {
 			if (tp->ttimer == 0 || (ioread32(ioaddr + CSR11) & 0xffff) == 0) {
 				if (tulip_debug > 1)
diff --git a/drivers/net/ethernet/dec/tulip/pnic.c b/drivers/net/ethernet/dec/tulip/pnic.c
index 1de5ed967070..bdc434f73c67 100644
--- a/drivers/net/ethernet/dec/tulip/pnic.c
+++ b/drivers/net/ethernet/dec/tulip/pnic.c
@@ -158,7 +158,7 @@ void pnic_timer(struct timer_list *t)
 		}
 	}
 too_good_connection:
-	mod_timer(&tp->timer, RUN_AT(next_tick));
+	timer_mod(&tp->timer, RUN_AT(next_tick));
 	if(!ioread32(ioaddr + CSR7)) {
 		if (tulip_debug > 1)
 			dev_info(&dev->dev, "sw timer wakeup\n");
diff --git a/drivers/net/ethernet/dec/tulip/pnic2.c b/drivers/net/ethernet/dec/tulip/pnic2.c
index 181a2612f00a..a4fcd8ff59bd 100644
--- a/drivers/net/ethernet/dec/tulip/pnic2.c
+++ b/drivers/net/ethernet/dec/tulip/pnic2.c
@@ -88,7 +88,7 @@ void pnic2_timer(struct timer_list *t)
 			 ioread32(ioaddr + CSR12));
 
 	if (next_tick) {
-		mod_timer(&tp->timer, RUN_AT(next_tick));
+		timer_mod(&tp->timer, RUN_AT(next_tick));
 	}
 }
 
diff --git a/drivers/net/ethernet/dec/tulip/timer.c b/drivers/net/ethernet/dec/tulip/timer.c
index 88d771c24d74..92699f7b74b7 100644
--- a/drivers/net/ethernet/dec/tulip/timer.c
+++ b/drivers/net/ethernet/dec/tulip/timer.c
@@ -130,10 +130,10 @@ void tulip_media_task(struct work_struct *work)
 	}
 	spin_unlock_irqrestore(&tp->lock, flags);
 
-	/* mod_timer synchronizes us with potential timer_add calls
+	/* timer_mod synchronizes us with potential timer_add calls
 	 * from interrupts.
 	 */
-	mod_timer(&tp->timer, RUN_AT(next_tick));
+	timer_mod(&tp->timer, RUN_AT(next_tick));
 }
 
 
@@ -149,7 +149,7 @@ void mxic_timer(struct timer_list *t)
 			 ioread32(ioaddr + CSR12));
 	}
 	if (next_tick) {
-		mod_timer(&tp->timer, RUN_AT(next_tick));
+		timer_mod(&tp->timer, RUN_AT(next_tick));
 	}
 }
 
@@ -164,13 +164,13 @@ void comet_timer(struct timer_list *t)
 		netdev_dbg(dev, "Comet link status %04x partner capability %04x\n",
 			   tulip_mdio_read(dev, tp->phys[0], 1),
 			   tulip_mdio_read(dev, tp->phys[0], 5));
-	/* mod_timer synchronizes us with potential timer_add calls
+	/* timer_mod synchronizes us with potential timer_add calls
 	 * from interrupts.
 	 */
 	if (tulip_check_duplex(dev) < 0)
 		{ netif_carrier_off(dev); }
 	else
 		{ netif_carrier_on(dev); }
-	mod_timer(&tp->timer, RUN_AT(next_tick));
+	timer_mod(&tp->timer, RUN_AT(next_tick));
 }
 
diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ethernet/dec/tulip/winbond-840.c
index 4f988135e0b0..69be2b4dba3f 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -1607,7 +1607,7 @@ static int __maybe_unused w840_resume(struct device *dev_d)
 
 		netif_wake_queue(dev);
 
-		mod_timer(&np->timer, jiffies + 1*HZ);
+		timer_mod(&np->timer, jiffies + 1*HZ);
 	} else {
 		netif_device_attach(dev);
 	}
diff --git a/drivers/net/ethernet/google/gve/gve_ethtool.c b/drivers/net/ethernet/google/gve/gve_ethtool.c
index eae1a7595a69..5a2f3bb188aa 100644
--- a/drivers/net/ethernet/google/gve/gve_ethtool.c
+++ b/drivers/net/ethernet/google/gve/gve_ethtool.c
@@ -691,7 +691,7 @@ static int gve_set_priv_flags(struct net_device *netdev, u32 flags)
 	priv->ethtool_flags = new_flags;
 	/* start report-stats timer when user turns report stats on. */
 	if (flags & BIT(0)) {
-		mod_timer(&priv->stats_report_timer,
+		timer_mod(&priv->stats_report_timer,
 			  round_jiffies(jiffies +
 					msecs_to_jiffies(priv->stats_report_timer_period)));
 	}
diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 27f34dfa0390..19cb9b2daf70 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -270,7 +270,7 @@ static void gve_stats_report_timer(struct timer_list *t)
 {
 	struct gve_priv *priv = timer_container_of(priv, t, stats_report_timer);
 
-	mod_timer(&priv->stats_report_timer,
+	timer_mod(&priv->stats_report_timer,
 		  round_jiffies(jiffies +
 		  msecs_to_jiffies(priv->stats_report_timer_period)));
 	gve_stats_report_schedule(priv);
@@ -1345,7 +1345,7 @@ static int gve_queues_start(struct gve_priv *priv,
 	gve_set_device_rings_ok(priv);
 
 	if (gve_get_report_stats(priv))
-		mod_timer(&priv->stats_report_timer,
+		timer_mod(&priv->stats_report_timer,
 			  round_jiffies(jiffies +
 				msecs_to_jiffies(priv->stats_report_timer_period)));
 
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_enet.c b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
index e905f10b894e..5860d0856fd9 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
@@ -1376,7 +1376,7 @@ static int hns_nic_net_up(struct net_device *ndev)
 		phy_start(ndev->phydev);
 
 	clear_bit(NIC_STATE_DOWN, &priv->state);
-	(void)mod_timer(&priv->service_timer, jiffies + SERVICE_TIMER_HZ);
+	(void)timer_mod(&priv->service_timer, jiffies + SERVICE_TIMER_HZ);
 
 	return 0;
 
@@ -2077,7 +2077,7 @@ static void hns_nic_service_timer(struct timer_list *t)
 {
 	struct hns_nic_priv *priv = timer_container_of(priv, t, service_timer);
 
-	(void)mod_timer(&priv->service_timer, jiffies + SERVICE_TIMER_HZ);
+	(void)timer_mod(&priv->service_timer, jiffies + SERVICE_TIMER_HZ);
 
 	hns_nic_task_schedule(priv);
 }
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index a7de67699a01..2bcdc7384239 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -4458,7 +4458,7 @@ static void hclge_reset_event(struct pci_dev *pdev, struct hnae3_handle *handle)
 
 	if (time_before(jiffies, (hdev->last_reset_time +
 				  HCLGE_RESET_INTERVAL))) {
-		mod_timer(&hdev->reset_timer, jiffies + HCLGE_RESET_INTERVAL);
+		timer_mod(&hdev->reset_timer, jiffies + HCLGE_RESET_INTERVAL);
 		return;
 	}
 
@@ -11902,7 +11902,7 @@ static int hclge_init_ae_dev(struct hnae3_ae_dev *ae_dev)
 		reset_level = hclge_get_reset_level(ae_dev,
 						    &ae_dev->hw_err_reset_req);
 		hclge_set_def_reset_request(ae_dev, reset_level);
-		mod_timer(&hdev->reset_timer, jiffies + HCLGE_RESET_INTERVAL);
+		timer_mod(&hdev->reset_timer, jiffies + HCLGE_RESET_INTERVAL);
 	}
 
 	hclge_init_rxd_adv_layout(hdev);
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
index 5b02fe91f073..9dbc41ac2463 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
@@ -2066,7 +2066,7 @@ static irqreturn_t hclgevf_misc_irq_handle(int irq, void *data)
 
 	switch (event_cause) {
 	case HCLGEVF_VECTOR0_EVENT_RST:
-		mod_timer(&hdev->reset_timer,
+		timer_mod(&hdev->reset_timer,
 			  jiffies + msecs_to_jiffies(HCLGEVF_RESET_DELAY));
 		break;
 	case HCLGEVF_VECTOR0_EVENT_MBX:
diff --git a/drivers/net/ethernet/intel/e100.c b/drivers/net/ethernet/intel/e100.c
index 5c56c1edd492..352fc21b3e06 100644
--- a/drivers/net/ethernet/intel/e100.c
+++ b/drivers/net/ethernet/intel/e100.c
@@ -1727,7 +1727,7 @@ static void e100_watchdog(struct timer_list *t)
 	else
 		nic->flags &= ~ich_10h_workaround;
 
-	mod_timer(&nic->watchdog,
+	timer_mod(&nic->watchdog,
 		  round_jiffies(jiffies + E100_WATCHDOG_PERIOD));
 }
 
@@ -2281,7 +2281,7 @@ static int e100_up(struct nic *nic)
 		goto err_clean_cbs;
 	e100_set_multicast_list(nic->netdev);
 	e100_start_receiver(nic, NULL);
-	mod_timer(&nic->watchdog, jiffies);
+	timer_mod(&nic->watchdog, jiffies);
 	if ((err = request_irq(nic->pdev->irq, e100_intr, IRQF_SHARED,
 		nic->netdev->name, nic->netdev)))
 		goto err_no_irq;
@@ -3152,7 +3152,7 @@ static void e100_io_resume(struct pci_dev *pdev)
 	netif_device_attach(netdev);
 	if (netif_running(netdev)) {
 		e100_open(netdev);
-		mod_timer(&nic->watchdog, jiffies);
+		timer_mod(&nic->watchdog, jiffies);
 	}
 }
 
diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index b6a39f691581..6a13e90ab761 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -1778,7 +1778,7 @@ static irqreturn_t e1000_intr_msi(int __always_unused irq, void *data)
 		}
 		/* guard against interrupt when we're going down */
 		if (!test_bit(__E1000_DOWN, &adapter->state))
-			mod_timer(&adapter->watchdog_timer, jiffies + 1);
+			timer_mod(&adapter->watchdog_timer, jiffies + 1);
 	}
 
 	/* Reset on uncorrectable ECC error */
@@ -1857,7 +1857,7 @@ static irqreturn_t e1000_intr(int __always_unused irq, void *data)
 		}
 		/* guard against interrupt when we're going down */
 		if (!test_bit(__E1000_DOWN, &adapter->state))
-			mod_timer(&adapter->watchdog_timer, jiffies + 1);
+			timer_mod(&adapter->watchdog_timer, jiffies + 1);
 	}
 
 	/* Reset on uncorrectable ECC error */
@@ -1901,7 +1901,7 @@ static irqreturn_t e1000_msix_other(int __always_unused irq, void *data)
 		hw->mac.get_link_status = true;
 		/* guard against interrupt when we're going down */
 		if (!test_bit(__E1000_DOWN, &adapter->state))
-			mod_timer(&adapter->watchdog_timer, jiffies + 1);
+			timer_mod(&adapter->watchdog_timer, jiffies + 1);
 	}
 
 	if (!test_bit(__E1000_DOWN, &adapter->state))
@@ -5308,7 +5308,7 @@ static void e1000_watchdog_task(struct work_struct *work)
 			netif_carrier_on(netdev);
 
 			if (!test_bit(__E1000_DOWN, &adapter->state))
-				mod_timer(&adapter->phy_info_timer,
+				timer_mod(&adapter->phy_info_timer,
 					  round_jiffies(jiffies + 2 * HZ));
 		}
 	} else {
@@ -5320,7 +5320,7 @@ static void e1000_watchdog_task(struct work_struct *work)
 			netif_carrier_off(netdev);
 			netif_stop_queue(netdev);
 			if (!test_bit(__E1000_DOWN, &adapter->state))
-				mod_timer(&adapter->phy_info_timer,
+				timer_mod(&adapter->phy_info_timer,
 					  round_jiffies(jiffies + 2 * HZ));
 
 			/* 8000ES2LAN requires a Rx packet buffer work-around
@@ -5416,7 +5416,7 @@ static void e1000_watchdog_task(struct work_struct *work)
 
 	/* Reset the timer */
 	if (!test_bit(__E1000_DOWN, &adapter->state))
-		mod_timer(&adapter->watchdog_timer,
+		timer_mod(&adapter->watchdog_timer,
 			  round_jiffies(jiffies + 2 * HZ));
 }
 
diff --git a/drivers/net/ethernet/intel/fm10k/fm10k_pci.c b/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
index 3b821a31c4e0..c4bac2169ef8 100644
--- a/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
+++ b/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
@@ -203,7 +203,7 @@ static void fm10k_service_timer(struct timer_list *t)
 						   service_timer);
 
 	/* Reset the timer */
-	mod_timer(&interface->service_timer, (HZ * 2) + jiffies);
+	timer_mod(&interface->service_timer, (HZ * 2) + jiffies);
 
 	fm10k_service_event_schedule(interface);
 }
@@ -1863,7 +1863,7 @@ void fm10k_up(struct fm10k_intfc *interface)
 
 	/* kick off the service timer now */
 	hw->mac.get_host_state = true;
-	mod_timer(&interface->service_timer, jiffies);
+	timer_mod(&interface->service_timer, jiffies);
 }
 
 static void fm10k_napi_disable_all(struct fm10k_intfc *interface)
@@ -2196,7 +2196,7 @@ static int fm10k_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	INIT_DELAYED_WORK(&interface->macvlan_task, fm10k_macvlan_task);
 
 	/* kick off service timer now, even when interface is down */
-	mod_timer(&interface->service_timer, (HZ * 2) + jiffies);
+	timer_mod(&interface->service_timer, (HZ * 2) + jiffies);
 
 	/* print warning for non-optimal configurations */
 	pcie_print_link_status(interface->pdev);
diff --git a/drivers/net/ethernet/intel/i40e/i40e_main.c b/drivers/net/ethernet/intel/i40e/i40e_main.c
index f1c9e575703e..aa486d7e6da7 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_main.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_main.c
@@ -11414,7 +11414,7 @@ static void i40e_service_timer(struct timer_list *t)
 {
 	struct i40e_pf *pf = timer_container_of(pf, t, service_timer);
 
-	mod_timer(&pf->service_timer,
+	timer_mod(&pf->service_timer,
 		  round_jiffies(jiffies + pf->service_timer_period));
 	i40e_service_event_schedule(pf);
 }
@@ -15528,7 +15528,7 @@ static int i40e_init_recovery_mode(struct i40e_pf *pf, struct i40e_hw *hw)
 	i40e_send_version(pf);
 
 	/* since everything's happy, start the service_task timer */
-	mod_timer(&pf->service_timer,
+	timer_mod(&pf->service_timer,
 		  round_jiffies(jiffies + pf->service_timer_period));
 
 	return 0;
@@ -16042,7 +16042,7 @@ static int i40e_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	i40e_send_version(pf);
 
 	/* since everything's happy, start the service_task timer */
-	mod_timer(&pf->service_timer,
+	timer_mod(&pf->service_timer,
 		  round_jiffies(jiffies + pf->service_timer_period));
 
 	/* add this PF to client device list and launch a client service task */
@@ -16450,7 +16450,7 @@ static int i40e_io_resume(struct i40e_pf *pf)
 	clear_bit(__I40E_SUSPENDED, pf->state);
 
 	/* Restart the service task */
-	mod_timer(&pf->service_timer,
+	timer_mod(&pf->service_timer,
 		  round_jiffies(jiffies + pf->service_timer_period));
 
 	return 0;
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index 10930146e45d..13f7482ef724 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -1745,7 +1745,7 @@ static void ice_service_timer(struct timer_list *t)
 {
 	struct ice_pf *pf = timer_container_of(pf, t, serv_tmr);
 
-	mod_timer(&pf->serv_tmr, round_jiffies(pf->serv_tmr_period + jiffies));
+	timer_mod(&pf->serv_tmr, round_jiffies(pf->serv_tmr_period + jiffies));
 	ice_service_task_schedule(pf);
 }
 
@@ -2373,7 +2373,7 @@ static void ice_service_task_recovery_mode(struct work_struct *work)
 
 	ice_service_task_complete(pf);
 
-	mod_timer(&pf->serv_tmr, jiffies + msecs_to_jiffies(100));
+	timer_mod(&pf->serv_tmr, jiffies + msecs_to_jiffies(100));
 }
 
 /**
@@ -2466,7 +2466,7 @@ static void ice_service_task(struct work_struct *work)
 	    test_bit(ICE_FD_VF_FLUSH_CTX, pf->state) ||
 	    test_bit(ICE_SIDEBANDQ_EVENT_PENDING, pf->state) ||
 	    test_bit(ICE_ADMINQ_EVENT_PENDING, pf->state))
-		mod_timer(&pf->serv_tmr, jiffies);
+		timer_mod(&pf->serv_tmr, jiffies);
 }
 
 /**
@@ -5074,7 +5074,7 @@ static int ice_init(struct ice_pf *pf)
 	clear_bit(ICE_SERVICE_DIS, pf->state);
 
 	/* since everything is good, start the service timer */
-	mod_timer(&pf->serv_tmr, round_jiffies(jiffies + pf->serv_tmr_period));
+	timer_mod(&pf->serv_tmr, round_jiffies(jiffies + pf->serv_tmr_period));
 
 	return 0;
 
@@ -5698,7 +5698,7 @@ static int ice_resume(struct device *dev)
 	ice_service_task_restart(pf);
 
 	/* Restart the service task */
-	mod_timer(&pf->serv_tmr, round_jiffies(jiffies + pf->serv_tmr_period));
+	timer_mod(&pf->serv_tmr, round_jiffies(jiffies + pf->serv_tmr_period));
 
 	return 0;
 }
@@ -5797,7 +5797,7 @@ static void ice_pci_err_resume(struct pci_dev *pdev)
 
 	ice_do_reset(pf, ICE_RESET_PFR);
 	ice_service_task_restart(pf);
-	mod_timer(&pf->serv_tmr, round_jiffies(jiffies + pf->serv_tmr_period));
+	timer_mod(&pf->serv_tmr, round_jiffies(jiffies + pf->serv_tmr_period));
 }
 
 /**
diff --git a/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c b/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c
index 05fea471de90..3df578b13528 100644
--- a/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c
+++ b/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c
@@ -1900,7 +1900,7 @@ ice_vc_fdir_set_irq_ctx(struct ice_vf *vf, struct virtchnl_fdir_fltr_conf *conf,
 	ctx->stat = ICE_FDIR_CTX_READY;
 	timer_setup(&ctx->rx_tmr, ice_vf_fdir_timer, 0);
 
-	mod_timer(&ctx->rx_tmr, round_jiffies(msecs_to_jiffies(10) + jiffies));
+	timer_mod(&ctx->rx_tmr, round_jiffies(msecs_to_jiffies(10) + jiffies));
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
index 8f3506984ca8..ee58d6e86397 100644
--- a/drivers/net/ethernet/intel/igb/igb_main.c
+++ b/drivers/net/ethernet/intel/igb/igb_main.c
@@ -5648,7 +5648,7 @@ static void igb_watchdog_task(struct work_struct *work)
 
 			/* link state has changed, schedule phy info update */
 			if (!test_bit(__IGB_DOWN, &adapter->state))
-				mod_timer(&adapter->phy_info_timer,
+				timer_mod(&adapter->phy_info_timer,
 					  round_jiffies(jiffies + 2 * HZ));
 		}
 	} else {
@@ -5671,7 +5671,7 @@ static void igb_watchdog_task(struct work_struct *work)
 
 			/* link state has changed, schedule phy info update */
 			if (!test_bit(__IGB_DOWN, &adapter->state))
-				mod_timer(&adapter->phy_info_timer,
+				timer_mod(&adapter->phy_info_timer,
 					  round_jiffies(jiffies + 2 * HZ));
 
 			/* link is down, time to check for alternate media */
@@ -5745,10 +5745,10 @@ static void igb_watchdog_task(struct work_struct *work)
 	/* Reset the timer */
 	if (!test_bit(__IGB_DOWN, &adapter->state)) {
 		if (adapter->flags & IGB_FLAG_NEED_LINK_UPDATE)
-			mod_timer(&adapter->watchdog_timer,
+			timer_mod(&adapter->watchdog_timer,
 				  round_jiffies(jiffies +  HZ));
 		else
-			mod_timer(&adapter->watchdog_timer,
+			timer_mod(&adapter->watchdog_timer,
 				  round_jiffies(jiffies + 2 * HZ));
 	}
 }
@@ -7073,7 +7073,7 @@ static irqreturn_t igb_msix_other(int irq, void *data)
 		hw->mac.get_link_status = 1;
 		/* guard against interrupt when we're going down */
 		if (!test_bit(__IGB_DOWN, &adapter->state))
-			mod_timer(&adapter->watchdog_timer, jiffies + 1);
+			timer_mod(&adapter->watchdog_timer, jiffies + 1);
 	}
 
 	if (icr & E1000_ICR_TS)
@@ -8146,7 +8146,7 @@ static irqreturn_t igb_intr_msi(int irq, void *data)
 	if (icr & (E1000_ICR_RXSEQ | E1000_ICR_LSC)) {
 		hw->mac.get_link_status = 1;
 		if (!test_bit(__IGB_DOWN, &adapter->state))
-			mod_timer(&adapter->watchdog_timer, jiffies + 1);
+			timer_mod(&adapter->watchdog_timer, jiffies + 1);
 	}
 
 	if (icr & E1000_ICR_TS)
@@ -8192,7 +8192,7 @@ static irqreturn_t igb_intr(int irq, void *data)
 		hw->mac.get_link_status = 1;
 		/* guard against interrupt when we're going down */
 		if (!test_bit(__IGB_DOWN, &adapter->state))
-			mod_timer(&adapter->watchdog_timer, jiffies + 1);
+			timer_mod(&adapter->watchdog_timer, jiffies + 1);
 	}
 
 	if (icr & E1000_ICR_TS)
diff --git a/drivers/net/ethernet/intel/igbvf/netdev.c b/drivers/net/ethernet/intel/igbvf/netdev.c
index 92c8bfb15c3e..66da2619abae 100644
--- a/drivers/net/ethernet/intel/igbvf/netdev.c
+++ b/drivers/net/ethernet/intel/igbvf/netdev.c
@@ -859,7 +859,7 @@ static irqreturn_t igbvf_msix_other(int irq, void *data)
 
 	hw->mac.get_link_status = 1;
 	if (!test_bit(__IGBVF_DOWN, &adapter->state))
-		mod_timer(&adapter->watchdog_timer, jiffies + 1);
+		timer_mod(&adapter->watchdog_timer, jiffies + 1);
 
 	ew32(EIMS, adapter->eims_other);
 
@@ -1557,7 +1557,7 @@ int igbvf_up(struct igbvf_adapter *adapter)
 
 	/* start the watchdog */
 	hw->mac.get_link_status = 1;
-	mod_timer(&adapter->watchdog_timer, jiffies + 1);
+	timer_mod(&adapter->watchdog_timer, jiffies + 1);
 
 	return 0;
 }
@@ -1745,7 +1745,7 @@ static int igbvf_open(struct net_device *netdev)
 
 	/* start the watchdog */
 	hw->mac.get_link_status = 1;
-	mod_timer(&adapter->watchdog_timer, jiffies + 1);
+	timer_mod(&adapter->watchdog_timer, jiffies + 1);
 
 	return 0;
 
@@ -1961,7 +1961,7 @@ static void igbvf_watchdog_task(struct work_struct *work)
 
 	/* Reset the timer */
 	if (!test_bit(__IGBVF_DOWN, &adapter->state))
-		mod_timer(&adapter->watchdog_timer,
+		timer_mod(&adapter->watchdog_timer,
 			  round_jiffies(jiffies + (2 * HZ)));
 }
 
diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 283df6b04a47..1712a87e54e5 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -5584,7 +5584,7 @@ static irqreturn_t igc_msix_other(int irq, void *data)
 		hw->mac.get_link_status = true;
 		/* guard against interrupt when we're going down */
 		if (!test_bit(__IGC_DOWN, &adapter->state))
-			mod_timer(&adapter->watchdog_timer, jiffies + 1);
+			timer_mod(&adapter->watchdog_timer, jiffies + 1);
 	}
 
 	if (icr & IGC_ICR_TS)
@@ -5858,7 +5858,7 @@ static void igc_watchdog_task(struct work_struct *work)
 
 			/* link state has changed, schedule phy info update */
 			if (!test_bit(__IGC_DOWN, &adapter->state))
-				mod_timer(&adapter->phy_info_timer,
+				timer_mod(&adapter->phy_info_timer,
 					  round_jiffies(jiffies + 2 * HZ));
 		}
 	} else {
@@ -5872,7 +5872,7 @@ static void igc_watchdog_task(struct work_struct *work)
 
 			/* link state has changed, schedule phy info update */
 			if (!test_bit(__IGC_DOWN, &adapter->state))
-				mod_timer(&adapter->phy_info_timer,
+				timer_mod(&adapter->phy_info_timer,
 					  round_jiffies(jiffies + 2 * HZ));
 
 			pm_schedule_suspend(netdev->dev.parent,
@@ -5939,10 +5939,10 @@ static void igc_watchdog_task(struct work_struct *work)
 	/* Reset the timer */
 	if (!test_bit(__IGC_DOWN, &adapter->state)) {
 		if (adapter->flags & IGC_FLAG_NEED_LINK_UPDATE)
-			mod_timer(&adapter->watchdog_timer,
+			timer_mod(&adapter->watchdog_timer,
 				  round_jiffies(jiffies +  HZ));
 		else
-			mod_timer(&adapter->watchdog_timer,
+			timer_mod(&adapter->watchdog_timer,
 				  round_jiffies(jiffies + 2 * HZ));
 	}
 }
@@ -5973,7 +5973,7 @@ static irqreturn_t igc_intr_msi(int irq, void *data)
 	if (icr & (IGC_ICR_RXSEQ | IGC_ICR_LSC)) {
 		hw->mac.get_link_status = true;
 		if (!test_bit(__IGC_DOWN, &adapter->state))
-			mod_timer(&adapter->watchdog_timer, jiffies + 1);
+			timer_mod(&adapter->watchdog_timer, jiffies + 1);
 	}
 
 	if (icr & IGC_ICR_TS)
@@ -6019,7 +6019,7 @@ static irqreturn_t igc_intr(int irq, void *data)
 		hw->mac.get_link_status = true;
 		/* guard against interrupt when we're going down */
 		if (!test_bit(__IGC_DOWN, &adapter->state))
-			mod_timer(&adapter->watchdog_timer, jiffies + 1);
+			timer_mod(&adapter->watchdog_timer, jiffies + 1);
 	}
 
 	if (icr & IGC_ICR_TS)
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index cd53199cf768..9e336933671a 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -6080,7 +6080,7 @@ static void ixgbe_up_complete(struct ixgbe_adapter *adapter)
 	 * link up interrupt but shouldn't be a problem */
 	adapter->flags |= IXGBE_FLAG_NEED_LINK_UPDATE;
 	adapter->link_check_timeout = jiffies;
-	mod_timer(&adapter->service_timer, jiffies);
+	timer_mod(&adapter->service_timer, jiffies);
 
 	ixgbe_clear_vf_stats_counters(adapter);
 	/* Set PF Reset Done bit so PF/VF Mail Ops can work */
@@ -8319,7 +8319,7 @@ static void ixgbe_service_timer(struct timer_list *t)
 		next_event_offset = HZ * 2;
 
 	/* Reset the timer */
-	mod_timer(&adapter->service_timer, next_event_offset + jiffies);
+	timer_mod(&adapter->service_timer, next_event_offset + jiffies);
 
 	ixgbe_service_event_schedule(adapter);
 }
diff --git a/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c b/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c
index 5f71cd7c11a7..ab2d3e248909 100644
--- a/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c
+++ b/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c
@@ -2341,7 +2341,7 @@ static void ixgbevf_up_complete(struct ixgbevf_adapter *adapter)
 	ixgbevf_init_last_counter_stats(adapter);
 
 	hw->mac.get_link_status = 1;
-	mod_timer(&adapter->service_timer, jiffies);
+	timer_mod(&adapter->service_timer, jiffies);
 }
 
 void ixgbevf_up(struct ixgbevf_adapter *adapter)
@@ -3180,7 +3180,7 @@ static void ixgbevf_service_timer(struct timer_list *t)
 						     service_timer);
 
 	/* Reset the timer */
-	mod_timer(&adapter->service_timer, (HZ * 2) + jiffies);
+	timer_mod(&adapter->service_timer, (HZ * 2) + jiffies);
 
 	ixgbevf_service_event_schedule(adapter);
 }
diff --git a/drivers/net/ethernet/korina.c b/drivers/net/ethernet/korina.c
index b80014ef6539..8bb0ffd86e88 100644
--- a/drivers/net/ethernet/korina.c
+++ b/drivers/net/ethernet/korina.c
@@ -904,7 +904,7 @@ static void korina_poll_media(struct timer_list *t)
 	struct net_device *dev = lp->dev;
 
 	korina_check_media(dev, 0);
-	mod_timer(&lp->media_check_timer, jiffies + HZ);
+	timer_mod(&lp->media_check_timer, jiffies + HZ);
 }
 
 static void korina_set_carrier(struct mii_if_info *mii)
@@ -1223,7 +1223,7 @@ static int korina_open(struct net_device *dev)
 		goto err_free_rx_irq;
 	}
 
-	mod_timer(&lp->media_check_timer, jiffies + 1);
+	timer_mod(&lp->media_check_timer, jiffies + 1);
 out:
 	return ret;
 
diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index a056094f02ee..333135649520 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -1335,7 +1335,7 @@ static void mib_counters_timer_wrapper(struct timer_list *t)
 {
 	struct mv643xx_eth_private *mp = timer_container_of(mp, t, mib_counters_timer);
 	mib_counters_update(mp);
-	mod_timer(&mp->mib_counters_timer, jiffies + 30 * HZ);
+	timer_mod(&mp->mib_counters_timer, jiffies + 30 * HZ);
 }
 
 
@@ -2296,7 +2296,7 @@ static int mv643xx_eth_poll(struct napi_struct *napi, int budget)
 
 	if (work_done < budget) {
 		if (mp->oom)
-			mod_timer(&mp->rx_oom, jiffies + (HZ / 10));
+			timer_mod(&mp->rx_oom, jiffies + (HZ / 10));
 		napi_complete_done(napi, work_done);
 		wrlp(mp, INT_MASK, mp->int_mask);
 	}
diff --git a/drivers/net/ethernet/marvell/skge.c b/drivers/net/ethernet/marvell/skge.c
index 05349a0b2db1..b0c6f3cc6fde 100644
--- a/drivers/net/ethernet/marvell/skge.c
+++ b/drivers/net/ethernet/marvell/skge.c
@@ -1416,7 +1416,7 @@ static void xm_phy_init(struct skge_port *skge)
 	xm_phy_write(hw, port, PHY_XMAC_CTRL, ctrl);
 
 	/* Poll PHY for status changes */
-	mod_timer(&skge->link_timer, jiffies + LINK_HZ);
+	timer_mod(&skge->link_timer, jiffies + LINK_HZ);
 }
 
 static int xm_check_link(struct net_device *dev)
@@ -1523,7 +1523,7 @@ static void xm_link_timer(struct timer_list *t)
 		xm_read16(hw, port, XM_ISRC);
 	} else {
 link_down:
-		mod_timer(&skge->link_timer,
+		timer_mod(&skge->link_timer,
 			  round_jiffies(jiffies + LINK_HZ));
 	}
 	spin_unlock_irqrestore(&hw->phy_lock, flags);
@@ -1774,7 +1774,7 @@ static void genesis_mac_intr(struct skge_hw *hw, int port)
 
 	if (hw->phy_type == SK_PHY_XMAC && (status & XM_IS_INP_ASS)) {
 		xm_link_down(hw, port);
-		mod_timer(&skge->link_timer, jiffies + 1);
+		timer_mod(&skge->link_timer, jiffies + 1);
 	}
 
 	if (status & XM_IS_TXF_UR) {
diff --git a/drivers/net/ethernet/marvell/sky2.c b/drivers/net/ethernet/marvell/sky2.c
index 3831f533b9db..2ba60c1bfa3a 100644
--- a/drivers/net/ethernet/marvell/sky2.c
+++ b/drivers/net/ethernet/marvell/sky2.c
@@ -2189,7 +2189,7 @@ static void sky2_link_up(struct sky2_port *sky2)
 
 	netif_carrier_on(sky2->netdev);
 
-	mod_timer(&hw->watchdog_timer, jiffies + 1);
+	timer_mod(&hw->watchdog_timer, jiffies + 1);
 
 	/* Turn on link LED */
 	sky2_write8(hw, SK_REG(port, LNK_LED_REG),
@@ -2988,7 +2988,7 @@ static void sky2_watchdog(struct timer_list *t)
 			return;
 	}
 
-	mod_timer(&hw->watchdog_timer, round_jiffies(jiffies + HZ));
+	timer_mod(&hw->watchdog_timer, round_jiffies(jiffies + HZ));
 }
 
 /* Hardware/software error handling */
diff --git a/drivers/net/ethernet/mellanox/mlx4/catas.c b/drivers/net/ethernet/mellanox/mlx4/catas.c
index 38a9c51c7f43..4d062d7308b7 100644
--- a/drivers/net/ethernet/mellanox/mlx4/catas.c
+++ b/drivers/net/ethernet/mellanox/mlx4/catas.c
@@ -256,7 +256,7 @@ static void poll_catas(struct timer_list *t)
 		goto internal_err;
 	}
 
-	mod_timer(&priv->catas_err.timer,
+	timer_mod(&priv->catas_err.timer,
 		  round_jiffies(jiffies + MLX4_CATAS_POLL_INTERVAL));
 	return;
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c b/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
index 75b3a1561f92..0c44247c417c 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
@@ -296,7 +296,7 @@ static void poll_sync_reset(struct timer_list *t)
 		return;
 	}
 
-	mod_timer(&fw_reset->timer, round_jiffies(jiffies + MLX5_RESET_POLL_INTERVAL));
+	timer_mod(&fw_reset->timer, round_jiffies(jiffies + MLX5_RESET_POLL_INTERVAL));
 }
 
 static void mlx5_start_sync_reset_poll(struct mlx5_core_dev *dev)
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/health.c b/drivers/net/ethernet/mellanox/mlx5/core/health.c
index c2a7fe22367e..108f57f2d098 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/health.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/health.c
@@ -822,7 +822,7 @@ static void poll_health(struct timer_list *t)
 	}
 
 out:
-	mod_timer(&health->timer, get_next_poll_jiffies(dev));
+	timer_mod(&health->timer, get_next_poll_jiffies(dev));
 }
 
 void mlx5_start_health_poll(struct mlx5_core_dev *dev)
diff --git a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
index 5639306c525d..a2bd598e40fe 100644
--- a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
+++ b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
@@ -3519,7 +3519,7 @@ static void myri10ge_watchdog_timer(struct timer_list *t)
 		schedule_work(&mgp->watchdog_work);
 	} else {
 		/* rearm timer */
-		mod_timer(&mgp->watchdog_timer,
+		timer_mod(&mgp->watchdog_timer,
 			  jiffies + myri10ge_watchdog_timeout * HZ);
 	}
 }
diff --git a/drivers/net/ethernet/natsemi/natsemi.c b/drivers/net/ethernet/natsemi/natsemi.c
index 5d838369607f..3e6bc6b40636 100644
--- a/drivers/net/ethernet/natsemi/natsemi.c
+++ b/drivers/net/ethernet/natsemi/natsemi.c
@@ -1850,9 +1850,9 @@ static void netdev_timer(struct timer_list *t)
 	}
 
 	if (next_tick > 1)
-		mod_timer(&np->timer, round_jiffies(jiffies + next_tick));
+		timer_mod(&np->timer, round_jiffies(jiffies + next_tick));
 	else
-		mod_timer(&np->timer, jiffies + next_tick);
+		timer_mod(&np->timer, jiffies + next_tick);
 }
 
 static void dump_ring(struct net_device *dev)
@@ -2386,7 +2386,7 @@ static void netdev_rx(struct net_device *dev, int *work_done, int work_to_do)
 
 	/* Restart Rx engine if stopped. */
 	if (np->oom)
-		mod_timer(&np->timer, jiffies + 1);
+		timer_mod(&np->timer, jiffies + 1);
 	else
 		writel(RxOn, ioaddr + ChipCmd);
 }
@@ -3345,7 +3345,7 @@ static int __maybe_unused natsemi_resume(struct device *dev_d)
 		spin_unlock_irq(&np->lock);
 		enable_irq(irq);
 
-		mod_timer(&np->timer, round_jiffies(jiffies + 1*HZ));
+		timer_mod(&np->timer, round_jiffies(jiffies + 1*HZ));
 	}
 	netif_device_attach(dev);
 out:
diff --git a/drivers/net/ethernet/natsemi/ns83820.c b/drivers/net/ethernet/natsemi/ns83820.c
index 56d5464222d9..702c55c74fa1 100644
--- a/drivers/net/ethernet/natsemi/ns83820.c
+++ b/drivers/net/ethernet/natsemi/ns83820.c
@@ -1605,7 +1605,7 @@ static void ns83820_tx_watch(struct timer_list *t)
 		ns83820_tx_timeout(ndev, UINT_MAX);
 	}
 
-	mod_timer(&dev->tx_watchdog, jiffies + 2*HZ);
+	timer_mod(&dev->tx_watchdog, jiffies + 2*HZ);
 }
 
 static int ns83820_open(struct net_device *ndev)
@@ -1638,7 +1638,7 @@ static int ns83820_open(struct net_device *ndev)
 	writel(desc, dev->base + TXDP);
 
 	timer_setup(&dev->tx_watchdog, ns83820_tx_watch, 0);
-	mod_timer(&dev->tx_watchdog, jiffies + 2*HZ);
+	timer_mod(&dev->tx_watchdog, jiffies + 2*HZ);
 
 	netif_start_queue(ndev);	/* FIXME: wait for phy to come up */
 
diff --git a/drivers/net/ethernet/neterion/s2io.c b/drivers/net/ethernet/neterion/s2io.c
index 27443e346f9f..e5fa16e3f09a 100644
--- a/drivers/net/ethernet/neterion/s2io.c
+++ b/drivers/net/ethernet/neterion/s2io.c
@@ -4199,7 +4199,7 @@ s2io_alarm_handle(struct timer_list *t)
 	struct net_device *dev = sp->dev;
 
 	s2io_handle_errors(dev);
-	mod_timer(&sp->alarm_timer, jiffies + HZ / 2);
+	timer_mod(&sp->alarm_timer, jiffies + HZ / 2);
 }
 
 static irqreturn_t s2io_msix_ring_handle(int irq, void *dev_id)
@@ -7174,7 +7174,7 @@ static int s2io_card_up(struct s2io_nic *sp)
 	}
 
 	timer_setup(&sp->alarm_timer, s2io_alarm_handle, 0);
-	mod_timer(&sp->alarm_timer, jiffies + HZ / 2);
+	timer_mod(&sp->alarm_timer, jiffies + HZ / 2);
 
 	set_bit(__S2IO_STATE_CARD_UP, &sp->state);
 
diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
index 75bdf75c2dec..b152d7707fde 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
@@ -99,7 +99,7 @@ static void nfp_net_reconfig_start_async(struct nfp_net *nn, u32 update)
 	nfp_net_reconfig_start(nn, update);
 
 	nn->reconfig_timer_active = true;
-	mod_timer(&nn->reconfig_timer, jiffies + NFP_NET_POLL_TIMEOUT * HZ);
+	timer_mod(&nn->reconfig_timer, jiffies + NFP_NET_POLL_TIMEOUT * HZ);
 }
 
 static bool nfp_net_reconfig_check_done(struct nfp_net *nn, bool last_check)
diff --git a/drivers/net/ethernet/nvidia/forcedeth.c b/drivers/net/ethernet/nvidia/forcedeth.c
index 19aa1f1538aa..19c405c01758 100644
--- a/drivers/net/ethernet/nvidia/forcedeth.c
+++ b/drivers/net/ethernet/nvidia/forcedeth.c
@@ -3113,7 +3113,7 @@ static int nv_change_mtu(struct net_device *dev, int new_mtu)
 		set_bufsize(dev);
 		if (nv_init_ring(dev)) {
 			if (!np->in_shutdown)
-				mod_timer(&np->oom_kick, jiffies + OOM_REFILL);
+				timer_mod(&np->oom_kick, jiffies + OOM_REFILL);
 		}
 		/* reinit nic view of the rx queue */
 		writel(np->rx_buf_sz, base + NvRegOffloadConfig);
@@ -3747,7 +3747,7 @@ static irqreturn_t nv_nic_irq_tx(int foo, void *data)
 
 			if (!np->in_shutdown) {
 				np->nic_poll_irq |= NVREG_IRQ_TX_ALL;
-				mod_timer(&np->nic_poll, jiffies + POLL_WAIT);
+				timer_mod(&np->nic_poll, jiffies + POLL_WAIT);
 			}
 			spin_unlock_irqrestore(&np->lock, flags);
 			netdev_dbg(dev, "%s: too many iterations (%d)\n",
@@ -3792,7 +3792,7 @@ static int nv_napi_poll(struct napi_struct *napi, int budget)
 	if (retcode) {
 		spin_lock_irqsave(&np->lock, flags);
 		if (!np->in_shutdown)
-			mod_timer(&np->oom_kick, jiffies + OOM_REFILL);
+			timer_mod(&np->oom_kick, jiffies + OOM_REFILL);
 		spin_unlock_irqrestore(&np->lock, flags);
 	}
 
@@ -3814,7 +3814,7 @@ static int nv_napi_poll(struct napi_struct *napi, int budget)
 		if (!np->in_shutdown) {
 			np->nic_poll_irq = np->irqmask;
 			np->recover_error = 1;
-			mod_timer(&np->nic_poll, jiffies + POLL_WAIT);
+			timer_mod(&np->nic_poll, jiffies + POLL_WAIT);
 		}
 		spin_unlock_irqrestore(&np->lock, flags);
 		napi_complete(napi);
@@ -3851,7 +3851,7 @@ static irqreturn_t nv_nic_irq_rx(int foo, void *data)
 			if (unlikely(nv_alloc_rx_optimized(dev))) {
 				spin_lock_irqsave(&np->lock, flags);
 				if (!np->in_shutdown)
-					mod_timer(&np->oom_kick, jiffies + OOM_REFILL);
+					timer_mod(&np->oom_kick, jiffies + OOM_REFILL);
 				spin_unlock_irqrestore(&np->lock, flags);
 			}
 		}
@@ -3864,7 +3864,7 @@ static irqreturn_t nv_nic_irq_rx(int foo, void *data)
 
 			if (!np->in_shutdown) {
 				np->nic_poll_irq |= NVREG_IRQ_RX_ALL;
-				mod_timer(&np->nic_poll, jiffies + POLL_WAIT);
+				timer_mod(&np->nic_poll, jiffies + POLL_WAIT);
 			}
 			spin_unlock_irqrestore(&np->lock, flags);
 			netdev_dbg(dev, "%s: too many iterations (%d)\n",
@@ -3917,7 +3917,7 @@ static irqreturn_t nv_nic_irq_other(int foo, void *data)
 			if (!np->in_shutdown) {
 				np->nic_poll_irq |= NVREG_IRQ_OTHER;
 				np->recover_error = 1;
-				mod_timer(&np->nic_poll, jiffies + POLL_WAIT);
+				timer_mod(&np->nic_poll, jiffies + POLL_WAIT);
 			}
 			spin_unlock_irqrestore(&np->lock, flags);
 			break;
@@ -3930,7 +3930,7 @@ static irqreturn_t nv_nic_irq_other(int foo, void *data)
 
 			if (!np->in_shutdown) {
 				np->nic_poll_irq |= NVREG_IRQ_OTHER;
-				mod_timer(&np->nic_poll, jiffies + POLL_WAIT);
+				timer_mod(&np->nic_poll, jiffies + POLL_WAIT);
 			}
 			spin_unlock_irqrestore(&np->lock, flags);
 			netdev_dbg(dev, "%s: too many iterations (%d)\n",
@@ -4195,7 +4195,7 @@ static void nv_do_nic_poll(struct timer_list *t)
 			set_bufsize(dev);
 			if (nv_init_ring(dev)) {
 				if (!np->in_shutdown)
-					mod_timer(&np->oom_kick, jiffies + OOM_REFILL);
+					timer_mod(&np->oom_kick, jiffies + OOM_REFILL);
 			}
 			/* reinit nic view of the rx queue */
 			writel(np->rx_buf_sz, base + NvRegOffloadConfig);
@@ -4270,7 +4270,7 @@ static void nv_do_stats_poll(struct timer_list *t)
 	}
 
 	if (!np->in_shutdown)
-		mod_timer(&np->stats_poll,
+		timer_mod(&np->stats_poll,
 			round_jiffies(jiffies + STATS_INTERVAL));
 }
 
@@ -4753,7 +4753,7 @@ static int nv_set_ringparam(struct net_device *dev,
 		set_bufsize(dev);
 		if (nv_init_ring(dev)) {
 			if (!np->in_shutdown)
-				mod_timer(&np->oom_kick, jiffies + OOM_REFILL);
+				timer_mod(&np->oom_kick, jiffies + OOM_REFILL);
 		}
 
 		/* reinit nic view of the queues */
@@ -5307,7 +5307,7 @@ static void nv_self_test(struct net_device *dev, struct ethtool_test *test, u64
 			set_bufsize(dev);
 			if (nv_init_ring(dev)) {
 				if (!np->in_shutdown)
-					mod_timer(&np->oom_kick, jiffies + OOM_REFILL);
+					timer_mod(&np->oom_kick, jiffies + OOM_REFILL);
 			}
 			/* reinit nic view of the rx queue */
 			writel(np->rx_buf_sz, base + NvRegOffloadConfig);
@@ -5590,11 +5590,11 @@ static int nv_open(struct net_device *dev)
 		netif_carrier_off(dev);
 	}
 	if (oom)
-		mod_timer(&np->oom_kick, jiffies + OOM_REFILL);
+		timer_mod(&np->oom_kick, jiffies + OOM_REFILL);
 
 	/* start statistics timer */
 	if (np->driver_data & (DEV_HAS_STATISTICS_V1|DEV_HAS_STATISTICS_V2|DEV_HAS_STATISTICS_V3))
-		mod_timer(&np->stats_poll,
+		timer_mod(&np->stats_poll,
 			round_jiffies(jiffies + STATS_INTERVAL));
 
 	spin_unlock_irq(&np->lock);
diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index 3f2739a479b0..b22abf76bd6a 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -1049,7 +1049,7 @@ static void pch_gbe_watchdog(struct timer_list *t)
 		netif_carrier_off(netdev);
 		netif_stop_queue(netdev);
 	}
-	mod_timer(&adapter->watchdog_timer,
+	timer_mod(&adapter->watchdog_timer,
 		  round_jiffies(jiffies + PCH_GBE_WATCHDOG_PERIOD));
 }
 
@@ -1884,7 +1884,7 @@ int pch_gbe_up(struct pch_gbe_adapter *adapter)
 	pch_gbe_enable_dma_rx(&adapter->hw);
 	pch_gbe_enable_mac_rx(&adapter->hw);
 
-	mod_timer(&adapter->watchdog_timer, jiffies);
+	timer_mod(&adapter->watchdog_timer, jiffies);
 
 	napi_enable(&adapter->napi);
 	pch_gbe_irq_enable(adapter);
diff --git a/drivers/net/ethernet/pasemi/pasemi_mac.c b/drivers/net/ethernet/pasemi/pasemi_mac.c
index 4e00175533e9..381d3637f90f 100644
--- a/drivers/net/ethernet/pasemi/pasemi_mac.c
+++ b/drivers/net/ethernet/pasemi/pasemi_mac.c
@@ -939,7 +939,7 @@ static void pasemi_mac_tx_timer(struct timer_list *t)
 
 	pasemi_mac_clean_tx(txring);
 
-	mod_timer(&txring->clean_timer, jiffies + TX_CLEAN_INTERVAL);
+	timer_mod(&txring->clean_timer, jiffies + TX_CLEAN_INTERVAL);
 
 	pasemi_mac_restart_tx_intr(mac);
 }
@@ -961,7 +961,7 @@ static irqreturn_t pasemi_mac_tx_intr(int irq, void *data)
 	if (*chan->status & PAS_STATUS_ERROR)
 		reg |= PAS_IOB_DMA_TXCH_RESET_DINTC;
 
-	mod_timer(&txring->clean_timer, jiffies + (TX_CLEAN_INTERVAL)*2);
+	timer_mod(&txring->clean_timer, jiffies + (TX_CLEAN_INTERVAL)*2);
 
 	napi_schedule(&mac->napi);
 
@@ -1193,7 +1193,7 @@ static int pasemi_mac_open(struct net_device *dev)
 		phy_start(dev->phydev);
 
 	timer_setup(&mac->tx->clean_timer, pasemi_mac_tx_timer, 0);
-	mod_timer(&mac->tx->clean_timer, jiffies + HZ);
+	timer_mod(&mac->tx->clean_timer, jiffies + HZ);
 
 	return 0;
 
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
index 4c377bdc62c8..05e45162dae6 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
@@ -375,7 +375,7 @@ static int ionic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err_out_deregister_devlink;
 	}
 
-	mod_timer(&ionic->watchdog_timer,
+	timer_mod(&ionic->watchdog_timer,
 		  round_jiffies(jiffies + ionic->watchdog_period));
 	ionic_queue_doorbell_check(ionic, IONIC_NAPI_DEADLINE);
 
@@ -474,7 +474,7 @@ static void ionic_reset_done(struct pci_dev *pdev)
 	if (err)
 		goto err_out;
 
-	mod_timer(&ionic->watchdog_timer, jiffies + 1);
+	timer_mod(&ionic->watchdog_timer, jiffies + 1);
 
 err_out:
 	dev_dbg(ionic->dev, "%s: device recovery %s\n",
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_dev.c b/drivers/net/ethernet/pensando/ionic/ionic_dev.c
index 18b9c8a810ae..93c389dfd054 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_dev.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_dev.c
@@ -18,7 +18,7 @@ static void ionic_watchdog_cb(struct timer_list *t)
 	struct ionic_deferred_work *work;
 	int hb;
 
-	mod_timer(&ionic->watchdog_timer,
+	timer_mod(&ionic->watchdog_timer,
 		  round_jiffies(jiffies + ionic->watchdog_period));
 
 	if (!lif)
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.c b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
index 7707a9e53c43..abb09be28f03 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_lif.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
@@ -117,7 +117,7 @@ static void ionic_lif_deferred_work(struct work_struct *work)
 				 * if the FW is already back rather than
 				 * waiting another whole cycle
 				 */
-				mod_timer(&lif->ionic->watchdog_timer, jiffies + 1);
+				timer_mod(&lif->ionic->watchdog_timer, jiffies + 1);
 			}
 			break;
 		default:
diff --git a/drivers/net/ethernet/qlogic/qla3xxx.c b/drivers/net/ethernet/qlogic/qla3xxx.c
index aee4e63b4b82..05c258a4a08f 100644
--- a/drivers/net/ethernet/qlogic/qla3xxx.c
+++ b/drivers/net/ethernet/qlogic/qla3xxx.c
@@ -1532,7 +1532,7 @@ static void ql_link_state_machine_work(struct work_struct *work)
 		spin_unlock_irqrestore(&qdev->hw_lock, hw_flags);
 
 		/* Restart timer on 2 second interval. */
-		mod_timer(&qdev->adapter_timer, jiffies + HZ * 1);
+		timer_mod(&qdev->adapter_timer, jiffies + HZ * 1);
 
 		return;
 	}
@@ -1573,7 +1573,7 @@ static void ql_link_state_machine_work(struct work_struct *work)
 	spin_unlock_irqrestore(&qdev->hw_lock, hw_flags);
 
 	/* Restart timer on 2 second interval. */
-	mod_timer(&qdev->adapter_timer, jiffies + HZ * 1);
+	timer_mod(&qdev->adapter_timer, jiffies + HZ * 1);
 }
 
 /*
@@ -3500,7 +3500,7 @@ static int ql_adapter_up(struct ql3_adapter *qdev)
 
 	set_bit(QL_ADAPTER_UP, &qdev->flags);
 
-	mod_timer(&qdev->adapter_timer, jiffies + HZ * 1);
+	timer_mod(&qdev->adapter_timer, jiffies + HZ * 1);
 
 	napi_enable(&qdev->napi);
 	ql_enable_interrupts(qdev);
diff --git a/drivers/net/ethernet/realtek/atp.c b/drivers/net/ethernet/realtek/atp.c
index ac389394c139..eb6adf59d207 100644
--- a/drivers/net/ethernet/realtek/atp.c
+++ b/drivers/net/ethernet/realtek/atp.c
@@ -694,7 +694,7 @@ static irqreturn_t atp_interrupt(int irq, void *dev_instance)
 		for (i = 0; i < 6; i++)
 			write_reg_byte(ioaddr, PAR0 + i, dev->dev_addr[i]);
 #if 0 && defined(TIMED_CHECKER)
-		mod_timer(&lp->timer, jiffies + TIMED_CHECKER);
+		timer_mod(&lp->timer, jiffies + TIMED_CHECKER);
 #endif
 	}
 
diff --git a/drivers/net/ethernet/rocker/rocker_ofdpa.c b/drivers/net/ethernet/rocker/rocker_ofdpa.c
index c7170b21c445..cb09f2cbc0b0 100644
--- a/drivers/net/ethernet/rocker/rocker_ofdpa.c
+++ b/drivers/net/ethernet/rocker/rocker_ofdpa.c
@@ -2012,7 +2012,7 @@ static void ofdpa_fdb_cleanup(struct timer_list *t)
 
 	spin_unlock_irqrestore(&ofdpa->fdb_tbl_lock, lock_flags);
 
-	mod_timer(&ofdpa->fdb_cleanup_timer, round_jiffies_up(next_timer));
+	timer_mod(&ofdpa->fdb_cleanup_timer, round_jiffies_up(next_timer));
 }
 
 static int ofdpa_port_router_mac(struct ofdpa_port *ofdpa_port,
@@ -2366,7 +2366,7 @@ static int ofdpa_init(struct rocker *rocker)
 	spin_lock_init(&ofdpa->neigh_tbl_lock);
 
 	timer_setup(&ofdpa->fdb_cleanup_timer, ofdpa_fdb_cleanup, 0);
-	mod_timer(&ofdpa->fdb_cleanup_timer, jiffies);
+	timer_mod(&ofdpa->fdb_cleanup_timer, jiffies);
 
 	ofdpa->ageing_time = BR_DEFAULT_AGEING_TIME;
 
@@ -2525,7 +2525,7 @@ ofdpa_port_attr_bridge_ageing_time_set(struct rocker_port *rocker_port,
 	ofdpa_port->ageing_time = clock_t_to_jiffies(ageing_time);
 	if (ofdpa_port->ageing_time < ofdpa->ageing_time)
 		ofdpa->ageing_time = ofdpa_port->ageing_time;
-	mod_timer(&ofdpa_port->ofdpa->fdb_cleanup_timer, jiffies);
+	timer_mod(&ofdpa_port->ofdpa->fdb_cleanup_timer, jiffies);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c b/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
index cbbec53e9957..cb1bf9849987 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
@@ -107,7 +107,7 @@ static void sxgbe_eee_ctrl_timer(struct timer_list *t)
 	struct sxgbe_priv_data *priv = timer_container_of(priv, t, eee_ctrl_timer);
 
 	sxgbe_enable_eee_mode(priv);
-	mod_timer(&priv->eee_ctrl_timer, SXGBE_LPI_TIMER(eee_timer));
+	timer_mod(&priv->eee_ctrl_timer, SXGBE_LPI_TIMER(eee_timer));
 }
 
 /**
@@ -804,7 +804,7 @@ static void sxgbe_tx_all_clean(struct sxgbe_priv_data * const priv)
 
 	if ((priv->eee_enabled) && (!priv->tx_path_in_lpi_mode)) {
 		sxgbe_enable_eee_mode(priv);
-		mod_timer(&priv->eee_ctrl_timer, SXGBE_LPI_TIMER(eee_timer));
+		timer_mod(&priv->eee_ctrl_timer, SXGBE_LPI_TIMER(eee_timer));
 	}
 }
 
@@ -1386,7 +1386,7 @@ static netdev_tx_t sxgbe_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (tqueue->tx_count_frames > tqueue->tx_coal_frames) {
 		priv->hw->desc->clear_tx_ic(tx_desc);
 		priv->xstats.tx_reset_ic_bit++;
-		mod_timer(&tqueue->txtimer,
+		timer_mod(&tqueue->txtimer,
 			  SXGBE_COAL_TIMER(tqueue->tx_coal_timer));
 	} else {
 		tqueue->tx_count_frames = 0;
diff --git a/drivers/net/ethernet/sfc/falcon/efx.c b/drivers/net/ethernet/sfc/falcon/efx.c
index b07f7e4e2877..3be48b9cd0c3 100644
--- a/drivers/net/ethernet/sfc/falcon/efx.c
+++ b/drivers/net/ethernet/sfc/falcon/efx.c
@@ -862,7 +862,7 @@ ef4_realloc_channels(struct ef4_nic *efx, u32 rxq_entries, u32 txq_entries)
 
 void ef4_schedule_slow_fill(struct ef4_rx_queue *rx_queue)
 {
-	mod_timer(&rx_queue->slow_fill, jiffies + msecs_to_jiffies(100));
+	timer_mod(&rx_queue->slow_fill, jiffies + msecs_to_jiffies(100));
 }
 
 static const struct ef4_channel_type ef4_default_channel_type = {
diff --git a/drivers/net/ethernet/sfc/falcon/falcon.c b/drivers/net/ethernet/sfc/falcon/falcon.c
index 182a393ef6bc..6efed6c278c8 100644
--- a/drivers/net/ethernet/sfc/falcon/falcon.c
+++ b/drivers/net/ethernet/sfc/falcon/falcon.c
@@ -1429,7 +1429,7 @@ static void falcon_stats_request(struct ef4_nic *efx)
 			     efx->stats_buffer.dma_addr);
 	ef4_writeo(efx, &reg, FR_AB_MAC_STAT_DMA);
 
-	mod_timer(&nic_data->stats_timer, round_jiffies_up(jiffies + HZ / 2));
+	timer_mod(&nic_data->stats_timer, round_jiffies_up(jiffies + HZ / 2));
 }
 
 static void falcon_stats_complete(struct ef4_nic *efx)
diff --git a/drivers/net/ethernet/sfc/mcdi.c b/drivers/net/ethernet/sfc/mcdi.c
index 5e9b8def5e42..dbc7ec5cd866 100644
--- a/drivers/net/ethernet/sfc/mcdi.c
+++ b/drivers/net/ethernet/sfc/mcdi.c
@@ -476,7 +476,7 @@ static void efx_mcdi_release(struct efx_mcdi_iface *mcdi)
 			efx_mcdi_send_request(efx, async->cmd,
 					      (const efx_dword_t *)(async + 1),
 					      async->inlen);
-			mod_timer(&mcdi->async_timer,
+			timer_mod(&mcdi->async_timer,
 				  jiffies + MCDI_RPC_TIMEOUT);
 		}
 		spin_unlock_bh(&mcdi->async_lock);
@@ -1009,7 +1009,7 @@ static int _efx_mcdi_rpc_async(struct efx_nic *efx, unsigned int cmd,
 		if (mcdi->async_list.next == &async->list &&
 		    efx_mcdi_acquire_async(mcdi)) {
 			efx_mcdi_send_request(efx, cmd, inbuf, inlen);
-			mod_timer(&mcdi->async_timer,
+			timer_mod(&mcdi->async_timer,
 				  jiffies + MCDI_RPC_TIMEOUT);
 		}
 	} else {
diff --git a/drivers/net/ethernet/sfc/rx_common.c b/drivers/net/ethernet/sfc/rx_common.c
index d28957288413..3817d110e3b4 100644
--- a/drivers/net/ethernet/sfc/rx_common.c
+++ b/drivers/net/ethernet/sfc/rx_common.c
@@ -361,7 +361,7 @@ void efx_rx_slow_fill(struct timer_list *t)
 
 void efx_schedule_slow_fill(struct efx_rx_queue *rx_queue)
 {
-	mod_timer(&rx_queue->slow_fill, jiffies + msecs_to_jiffies(10));
+	timer_mod(&rx_queue->slow_fill, jiffies + msecs_to_jiffies(10));
 }
 
 /* efx_init_rx_buffers - create EFX_RX_BATCH page-based RX buffers
diff --git a/drivers/net/ethernet/sfc/siena/mcdi.c b/drivers/net/ethernet/sfc/siena/mcdi.c
index c8f0fb43e285..af1a402de0b3 100644
--- a/drivers/net/ethernet/sfc/siena/mcdi.c
+++ b/drivers/net/ethernet/sfc/siena/mcdi.c
@@ -480,7 +480,7 @@ static void efx_mcdi_release(struct efx_mcdi_iface *mcdi)
 			efx_mcdi_send_request(efx, async->cmd,
 					      (const efx_dword_t *)(async + 1),
 					      async->inlen);
-			mod_timer(&mcdi->async_timer,
+			timer_mod(&mcdi->async_timer,
 				  jiffies + MCDI_RPC_TIMEOUT);
 		}
 		spin_unlock_bh(&mcdi->async_lock);
@@ -1013,7 +1013,7 @@ static int _efx_mcdi_rpc_async(struct efx_nic *efx, unsigned int cmd,
 		if (mcdi->async_list.next == &async->list &&
 		    efx_mcdi_acquire_async(mcdi)) {
 			efx_mcdi_send_request(efx, cmd, inbuf, inlen);
-			mod_timer(&mcdi->async_timer,
+			timer_mod(&mcdi->async_timer,
 				  jiffies + MCDI_RPC_TIMEOUT);
 		}
 	} else {
diff --git a/drivers/net/ethernet/sfc/siena/rx_common.c b/drivers/net/ethernet/sfc/siena/rx_common.c
index 9f97f590c2fb..1007cc0b59ed 100644
--- a/drivers/net/ethernet/sfc/siena/rx_common.c
+++ b/drivers/net/ethernet/sfc/siena/rx_common.c
@@ -358,7 +358,7 @@ void efx_siena_rx_slow_fill(struct timer_list *t)
 
 static void efx_schedule_slow_fill(struct efx_rx_queue *rx_queue)
 {
-	mod_timer(&rx_queue->slow_fill, jiffies + msecs_to_jiffies(10));
+	timer_mod(&rx_queue->slow_fill, jiffies + msecs_to_jiffies(10));
 }
 
 /* efx_init_rx_buffers - create EFX_RX_BATCH page-based RX buffers
diff --git a/drivers/net/ethernet/sis/sis190.c b/drivers/net/ethernet/sis/sis190.c
index c157aeea2f57..b488fa309665 100644
--- a/drivers/net/ethernet/sis/sis190.c
+++ b/drivers/net/ethernet/sis/sis190.c
@@ -930,7 +930,7 @@ static void sis190_phy_task(struct work_struct *work)
 	val = mdio_read(ioaddr, phy_id, MII_BMCR);
 	if (val & BMCR_RESET) {
 		// FIXME: needlessly high ?  -- FR 02/07/2005
-		mod_timer(&tp->timer, jiffies + HZ/10);
+		timer_mod(&tp->timer, jiffies + HZ/10);
 		goto out_unlock;
 	}
 
@@ -1015,7 +1015,7 @@ static void sis190_phy_task(struct work_struct *work)
 		tp->link_status = LNK_ON;
 	} else if (!(val & BMSR_LSTATUS) && tp->link_status != LNK_AUTONEG)
 		tp->link_status = LNK_OFF;
-	mod_timer(&tp->timer, jiffies + SIS190_PHY_TIMEOUT);
+	timer_mod(&tp->timer, jiffies + SIS190_PHY_TIMEOUT);
 
 out_unlock:
 	rtnl_unlock();
diff --git a/drivers/net/ethernet/smsc/smc91c92_cs.c b/drivers/net/ethernet/smsc/smc91c92_cs.c
index bf57a5b4647a..ce880556a900 100644
--- a/drivers/net/ethernet/smsc/smc91c92_cs.c
+++ b/drivers/net/ethernet/smsc/smc91c92_cs.c
@@ -1074,7 +1074,7 @@ static int smc_open(struct net_device *dev)
 
     smc_reset(dev);
     timer_setup(&smc->media, media_check, 0);
-    mod_timer(&smc->media, jiffies + HZ);
+    timer_mod(&smc->media, jiffies + HZ);
 
     return 0;
 } /* smc_open */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 6babf2f2fcd3..2b9274bbe2a2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -204,7 +204,7 @@ static void stmmac_fpe_verify_timer(struct timer_list *t)
 	}
 
 	if (rearm) {
-		mod_timer(&fpe_cfg->verify_timer,
+		timer_mod(&fpe_cfg->verify_timer,
 			  jiffies + msecs_to_jiffies(fpe_cfg->verify_time));
 	}
 
@@ -218,7 +218,7 @@ static void stmmac_fpe_verify_timer_arm(struct stmmac_fpe_cfg *fpe_cfg)
 	    fpe_cfg->status != ETHTOOL_MM_VERIFY_STATUS_FAILED &&
 	    fpe_cfg->status != ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED) {
 		timer_setup(&fpe_cfg->verify_timer, stmmac_fpe_verify_timer, 0);
-		mod_timer(&fpe_cfg->verify_timer, jiffies);
+		timer_mod(&fpe_cfg->verify_timer, jiffies);
 	}
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f173a7689331..83ad68896b86 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -438,7 +438,7 @@ static bool stmmac_eee_tx_busy(struct stmmac_priv *priv)
 
 static void stmmac_restart_sw_lpi_timer(struct stmmac_priv *priv)
 {
-	mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(priv->tx_lpi_timer));
+	timer_mod(&priv->eee_ctrl_timer, STMMAC_LPI_T(priv->tx_lpi_timer));
 }
 
 /**
diff --git a/drivers/net/ethernet/sun/cassini.c b/drivers/net/ethernet/sun/cassini.c
index acfb523214b9..4f78dc4c03c4 100644
--- a/drivers/net/ethernet/sun/cassini.c
+++ b/drivers/net/ethernet/sun/cassini.c
@@ -726,7 +726,7 @@ static void cas_begin_auto_negotiation(struct cas *cp,
 		atomic_inc(&cp->reset_task_pending_all);
 		schedule_work(&cp->reset_task);
 		cp->timer_ticks = 0;
-		mod_timer(&cp->link_timer, jiffies + CAS_LINK_TIMEOUT);
+		timer_mod(&cp->link_timer, jiffies + CAS_LINK_TIMEOUT);
 		return;
 	}
 #endif
@@ -763,7 +763,7 @@ static void cas_begin_auto_negotiation(struct cas *cp,
 	}
 
 	cp->timer_ticks = 0;
-	mod_timer(&cp->link_timer, jiffies + CAS_LINK_TIMEOUT);
+	timer_mod(&cp->link_timer, jiffies + CAS_LINK_TIMEOUT);
 }
 
 /* Must be invoked under cp->lock. */
@@ -2187,7 +2187,7 @@ static int cas_post_rxds_ringN(struct cas *cp, int ring, int num)
 				 */
 				cp->cas_flags |= CAS_FLAG_RXD_POST(ring);
 				if (!timer_pending(&cp->link_timer))
-					mod_timer(&cp->link_timer, jiffies +
+					timer_mod(&cp->link_timer, jiffies +
 						  CAS_LINK_FAST_TIMEOUT);
 				cp->rx_old[ring]  = entry;
 				cp->rx_last[ring] = num ? num - released : 0;
@@ -4065,7 +4065,7 @@ static void cas_link_timer(struct timer_list *t)
 			if ((mask & rmask) == 0)
 				continue;
 
-			/* post_rxds will do a mod_timer */
+			/* post_rxds will do a timer_mod */
 			if (cas_post_rxds_ringN(cp, i, cp->rx_last[i]) < 0) {
 				pending = 1;
 				continue;
@@ -4136,7 +4136,7 @@ static void cas_link_timer(struct timer_list *t)
 	}
 
 	if (!pending)
-		mod_timer(&cp->link_timer, jiffies + CAS_LINK_TIMEOUT);
+		timer_mod(&cp->link_timer, jiffies + CAS_LINK_TIMEOUT);
 	cas_unlock_tx(cp);
 	spin_unlock_irqrestore(&cp->lock, flags);
 }
diff --git a/drivers/net/ethernet/sun/sungem.c b/drivers/net/ethernet/sun/sungem.c
index 8e69d917d827..f5548eabcd77 100644
--- a/drivers/net/ethernet/sun/sungem.c
+++ b/drivers/net/ethernet/sun/sungem.c
@@ -1318,7 +1318,7 @@ static void gem_begin_auto_negotiation(struct gem *gp,
 
 non_mii:
 	gp->timer_ticks = 0;
-	mod_timer(&gp->link_timer, jiffies + ((12 * HZ) / 10));
+	timer_mod(&gp->link_timer, jiffies + ((12 * HZ) / 10));
 }
 
 /* A link-up condition has occurred, initialize and enable the
@@ -1549,7 +1549,7 @@ static void gem_link_timer(struct timer_list *t)
 		return;
 	}
 restart:
-	mod_timer(&gp->link_timer, jiffies + ((12 * HZ) / 10));
+	timer_mod(&gp->link_timer, jiffies + ((12 * HZ) / 10));
 }
 
 static void gem_clean_rings(struct gem *gp)
@@ -2252,7 +2252,7 @@ static void gem_reset_task(struct work_struct *work)
 	if (gp->lstate != link_up)
 		gem_begin_auto_negotiation(gp, NULL);
 	else
-		mod_timer(&gp->link_timer, jiffies + ((12 * HZ) / 10));
+		timer_mod(&gp->link_timer, jiffies + ((12 * HZ) / 10));
 
 	rtnl_unlock();
 }
diff --git a/drivers/net/ethernet/sun/sunvnet_common.c b/drivers/net/ethernet/sun/sunvnet_common.c
index 0212853c9430..87474e61fc92 100644
--- a/drivers/net/ethernet/sun/sunvnet_common.c
+++ b/drivers/net/ethernet/sun/sunvnet_common.c
@@ -1055,7 +1055,7 @@ void sunvnet_clean_timer_expire_common(struct timer_list *t)
 	vnet_free_skbs(freeskbs);
 
 	if (pending)
-		(void)mod_timer(&port->clean_timer,
+		(void)timer_mod(&port->clean_timer,
 				jiffies + VNET_CLEAN_TIMEOUT);
 	 else
 		timer_delete(&port->clean_timer);
@@ -1501,7 +1501,7 @@ sunvnet_start_xmit_common(struct sk_buff *skb, struct net_device *dev,
 			netif_tx_wake_queue(txq);
 	}
 
-	(void)mod_timer(&port->clean_timer, jiffies + VNET_CLEAN_TIMEOUT);
+	(void)timer_mod(&port->clean_timer, jiffies + VNET_CLEAN_TIMEOUT);
 	rcu_read_unlock();
 
 	vnet_free_skbs(freeskbs);
@@ -1510,7 +1510,7 @@ sunvnet_start_xmit_common(struct sk_buff *skb, struct net_device *dev,
 
 out_dropped:
 	if (pending)
-		(void)mod_timer(&port->clean_timer,
+		(void)timer_mod(&port->clean_timer,
 				jiffies + VNET_CLEAN_TIMEOUT);
 	else if (port)
 		timer_delete(&port->clean_timer);
diff --git a/drivers/net/ethernet/synopsys/dwc-xlgmac-hw.c b/drivers/net/ethernet/synopsys/dwc-xlgmac-hw.c
index 76eb7db80f13..8d6a19a27c00 100644
--- a/drivers/net/ethernet/synopsys/dwc-xlgmac-hw.c
+++ b/drivers/net/ethernet/synopsys/dwc-xlgmac-hw.c
@@ -692,7 +692,7 @@ static void xlgmac_tx_start_xmit(struct xlgmac_channel *channel,
 	/* Start the Tx timer */
 	if (pdata->tx_usecs && !channel->tx_timer_active) {
 		channel->tx_timer_active = 1;
-		mod_timer(&channel->tx_timer,
+		timer_mod(&channel->tx_timer,
 			  jiffies + usecs_to_jiffies(pdata->tx_usecs));
 	}
 
diff --git a/drivers/net/ethernet/ti/tlan.c b/drivers/net/ethernet/ti/tlan.c
index fb7a23dead36..f4cf5dd077a2 100644
--- a/drivers/net/ethernet/ti/tlan.c
+++ b/drivers/net/ethernet/ti/tlan.c
@@ -262,7 +262,7 @@ tlan_set_timer(struct net_device *dev, u32 ticks, u32 type)
 
 	priv->timer_set_at = jiffies;
 	priv->timer_type = type;
-	mod_timer(&priv->timer, jiffies + ticks);
+	timer_mod(&priv->timer, jiffies + ticks);
 
 }
 
diff --git a/drivers/net/ethernet/tundra/tsi108_eth.c b/drivers/net/ethernet/tundra/tsi108_eth.c
index 7e0b3d694ac0..1fc84b55c063 100644
--- a/drivers/net/ethernet/tundra/tsi108_eth.c
+++ b/drivers/net/ethernet/tundra/tsi108_eth.c
@@ -1354,7 +1354,7 @@ static int tsi108_open(struct net_device *dev)
 	napi_enable(&data->napi);
 
 	timer_setup(&data->timer, tsi108_timed_checker, 0);
-	mod_timer(&data->timer, jiffies + 1);
+	timer_mod(&data->timer, jiffies + 1);
 
 	tsi108_restart_rx(data, dev);
 
@@ -1657,7 +1657,7 @@ static void tsi108_timed_checker(struct timer_list *t)
 
 	tsi108_check_phy(dev);
 	tsi108_check_rxring(dev);
-	mod_timer(&data->timer, jiffies + CHECK_PHY_INTERVAL);
+	timer_mod(&data->timer, jiffies + CHECK_PHY_INTERVAL);
 }
 
 static void tsi108_ether_remove(struct platform_device *pdev)
diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index c5e5423e1863..5a09f3c20912 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -150,7 +150,7 @@ static void sp_xmit_on_air(struct timer_list *t)
 		sp->tty->ops->write(sp->tty, &sp->led_state, 1);
 		sp->status2 = 0;
 	} else
-		mod_timer(&sp->tx_t, jiffies + ((when + 1) * HZ) / 100);
+		timer_mod(&sp->tx_t, jiffies + ((when + 1) * HZ) / 100);
 }
 
 /* ----> 6pack timer interrupt handler and friends. <---- */
@@ -513,7 +513,7 @@ static void resync_tnc(struct timer_list *t)
 
 
 	/* Start resync timer again -- the TNC might be still absent */
-	mod_timer(&sp->resync_t, jiffies + SIXP_RESYNC_TIMEOUT);
+	timer_mod(&sp->resync_t, jiffies + SIXP_RESYNC_TIMEOUT);
 }
 
 static inline int tnc_init(struct sixpack *sp)
@@ -524,7 +524,7 @@ static inline int tnc_init(struct sixpack *sp)
 
 	sp->tty->ops->write(sp->tty, &inbyte, 1);
 
-	mod_timer(&sp->resync_t, jiffies + SIXP_RESYNC_TIMEOUT);
+	timer_mod(&sp->resync_t, jiffies + SIXP_RESYNC_TIMEOUT);
 
 	return 0;
 }
@@ -871,7 +871,7 @@ static void decode_prio_command(struct sixpack *sp, u8 cmd)
            so the resync timer can be reset. */
 
 	if (sp->tnc_state == TNC_IN_SYNC)
-		mod_timer(&sp->resync_t, jiffies + SIXP_INIT_RESYNC_TIMEOUT);
+		timer_mod(&sp->resync_t, jiffies + SIXP_INIT_RESYNC_TIMEOUT);
 
 	sp->status1 = cmd & SIXP_PRIO_DATA_MASK;
 }
diff --git a/drivers/net/ntb_netdev.c b/drivers/net/ntb_netdev.c
index fbeae05817e9..d4a9dfa2ceae 100644
--- a/drivers/net/ntb_netdev.c
+++ b/drivers/net/ntb_netdev.c
@@ -155,7 +155,7 @@ static int __ntb_netdev_maybe_stop_tx(struct net_device *netdev,
 	smp_mb();
 
 	if (likely(ntb_transport_tx_free_entry(qp) < size)) {
-		mod_timer(&dev->tx_timer, jiffies + usecs_to_jiffies(tx_time));
+		timer_mod(&dev->tx_timer, jiffies + usecs_to_jiffies(tx_time));
 		return -EBUSY;
 	}
 
@@ -233,7 +233,7 @@ static void ntb_netdev_tx_timer(struct timer_list *t)
 	struct net_device *ndev = dev->ndev;
 
 	if (ntb_transport_tx_free_entry(dev->qp) < tx_stop) {
-		mod_timer(&dev->tx_timer, jiffies + usecs_to_jiffies(tx_time));
+		timer_mod(&dev->tx_timer, jiffies + usecs_to_jiffies(tx_time));
 	} else {
 		/* Make sure anybody stopping the queue after this sees the new
 		 * value of ntb_transport_tx_free_entry()
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b68369e2342b..7e9d682bc9df 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -958,7 +958,7 @@ static void phylink_pcs_poll_stop(struct phylink *pl)
 static void phylink_pcs_poll_start(struct phylink *pl)
 {
 	if (pl->pcs && pl->pcs->poll && pl->cfg_link_an_mode == MLO_AN_INBAND)
-		mod_timer(&pl->link_poll, jiffies + HZ);
+		timer_mod(&pl->link_poll, jiffies + HZ);
 }
 
 int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs)
@@ -1706,7 +1706,7 @@ static void phylink_fixed_poll(struct timer_list *t)
 {
 	struct phylink *pl = container_of(t, struct phylink, link_poll);
 
-	mod_timer(t, jiffies + HZ);
+	timer_mod(t, jiffies + HZ);
 
 	phylink_run_resolve(pl);
 }
@@ -2420,7 +2420,7 @@ void phylink_start(struct phylink *pl)
 		poll |= pl->config->poll_fixed_state;
 
 	if (poll)
-		mod_timer(&pl->link_poll, jiffies + HZ);
+		timer_mod(&pl->link_poll, jiffies + HZ);
 	if (pl->phydev)
 		phy_start(pl->phydev);
 	if (pl->sfp_bus)
diff --git a/drivers/net/slip/slip.c b/drivers/net/slip/slip.c
index 1a2950f95221..488ffd4dd0b6 100644
--- a/drivers/net/slip/slip.c
+++ b/drivers/net/slip/slip.c
@@ -1133,7 +1133,7 @@ static int slip_ioctl(struct tty_struct *tty, unsigned int cmd,
 		}
 		sl->keepalive = (u8)tmp;
 		if (sl->keepalive != 0) {
-			mod_timer(&sl->keepalive_timer,
+			timer_mod(&sl->keepalive_timer,
 					jiffies + sl->keepalive * HZ);
 			set_bit(SLF_KEEPTEST, &sl->flags);
 		} else
@@ -1158,7 +1158,7 @@ static int slip_ioctl(struct tty_struct *tty, unsigned int cmd,
 		}
 		sl->outfill = (u8)tmp;
 		if (sl->outfill != 0) {
-			mod_timer(&sl->outfill_timer,
+			timer_mod(&sl->outfill_timer,
 						jiffies + sl->outfill * HZ);
 			set_bit(SLF_OUTWAIT, &sl->flags);
 		} else
@@ -1213,7 +1213,7 @@ static int sl_siocdevprivate(struct net_device *dev, struct ifreq *rq,
 		if (sl->keepalive != 0) {
 			sl->keepalive_timer.expires =
 						jiffies + sl->keepalive * HZ;
-			mod_timer(&sl->keepalive_timer,
+			timer_mod(&sl->keepalive_timer,
 						jiffies + sl->keepalive * HZ);
 			set_bit(SLF_KEEPTEST, &sl->flags);
 		} else
@@ -1231,7 +1231,7 @@ static int sl_siocdevprivate(struct net_device *dev, struct ifreq *rq,
 		}
 		sl->outfill = (u8)*p;
 		if (sl->outfill != 0) {
-			mod_timer(&sl->outfill_timer,
+			timer_mod(&sl->outfill_timer,
 						jiffies + sl->outfill * HZ);
 			set_bit(SLF_OUTWAIT, &sl->flags);
 		} else
@@ -1401,7 +1401,7 @@ static void sl_outfill(struct timer_list *t)
 		} else
 			set_bit(SLF_OUTWAIT, &sl->flags);
 
-		mod_timer(&sl->outfill_timer, jiffies+sl->outfill*HZ);
+		timer_mod(&sl->outfill_timer, jiffies+sl->outfill*HZ);
 	}
 out:
 	spin_unlock(&sl->lock);
@@ -1430,7 +1430,7 @@ static void sl_keepalive(struct timer_list *t)
 		} else
 			set_bit(SLF_KEEPTEST, &sl->flags);
 
-		mod_timer(&sl->keepalive_timer, jiffies+sl->keepalive*HZ);
+		timer_mod(&sl->keepalive_timer, jiffies+sl->keepalive*HZ);
 	}
 out:
 	spin_unlock(&sl->lock);
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index afd3c4a8c3ea..57b6792f25d7 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -403,7 +403,7 @@ static void tun_flow_cleanup(struct timer_list *t)
 	}
 
 	if (count)
-		mod_timer(&tun->flow_gc_timer, round_jiffies_up(next_timer));
+		timer_mod(&tun->flow_gc_timer, round_jiffies_up(next_timer));
 	spin_unlock(&tun->lock);
 }
 
@@ -434,7 +434,7 @@ static void tun_flow_update(struct tun_struct *tun, u32 rxhash,
 			tun_flow_create(tun, head, rxhash, queue_index);
 
 		if (!timer_pending(&tun->flow_gc_timer))
-			mod_timer(&tun->flow_gc_timer,
+			timer_mod(&tun->flow_gc_timer,
 				  round_jiffies_up(jiffies + delay));
 		spin_unlock_bh(&tun->lock);
 	}
@@ -1289,7 +1289,7 @@ static void tun_flow_init(struct tun_struct *tun)
 
 	tun->ageing_time = TUN_FLOW_EXPIRE;
 	timer_setup(&tun->flow_gc_timer, tun_flow_cleanup, 0);
-	mod_timer(&tun->flow_gc_timer,
+	timer_mod(&tun->flow_gc_timer,
 		  round_jiffies_up(jiffies + tun->ageing_time));
 }
 
diff --git a/drivers/net/usb/catc.c b/drivers/net/usb/catc.c
index 6759388692f8..0193e0f028af 100644
--- a/drivers/net/usb/catc.c
+++ b/drivers/net/usb/catc.c
@@ -608,7 +608,7 @@ static void catc_stats_timer(struct timer_list *t)
 	for (i = 0; i < 8; i++)
 		catc_get_reg_async(catc, EthStats + 7 - i, catc_stats_done);
 
-	mod_timer(&catc->timer, jiffies + STATS_UPDATE);
+	timer_mod(&catc->timer, jiffies + STATS_UPDATE);
 }
 
 /*
@@ -726,7 +726,7 @@ static int catc_open(struct net_device *netdev)
 	netif_start_queue(netdev);
 
 	if (!catc->is_f5u011)
-		mod_timer(&catc->timer, jiffies + STATS_UPDATE);
+		timer_mod(&catc->timer, jiffies + STATS_UPDATE);
 
 	return 0;
 }
diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 7377188fb476..fc6fce01d204 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1717,7 +1717,7 @@ static int lan78xx_link_reset(struct lan78xx_net *dev)
 
 		if (!timer_pending(&dev->stat_monitor)) {
 			dev->delta = 1;
-			mod_timer(&dev->stat_monitor,
+			timer_mod(&dev->stat_monitor,
 				  jiffies + STAT_UPDATE_TIMER);
 		}
 
@@ -4148,7 +4148,7 @@ static int lan78xx_bh(struct lan78xx_net *dev, int budget)
 		/* reset update timer delta */
 		if (timer_pending(&dev->stat_monitor) && (dev->delta != 1)) {
 			dev->delta = 1;
-			mod_timer(&dev->stat_monitor,
+			timer_mod(&dev->stat_monitor,
 				  jiffies + STAT_UPDATE_TIMER);
 		}
 
@@ -4271,7 +4271,7 @@ static void lan78xx_delayedwork(struct work_struct *work)
 
 		clear_bit(EVENT_STAT_UPDATE, &dev->flags);
 
-		mod_timer(&dev->stat_monitor,
+		timer_mod(&dev->stat_monitor,
 			  jiffies + (STAT_UPDATE_TIMER * dev->delta));
 
 		dev->delta = min((dev->delta * 2), 50);
@@ -5090,7 +5090,7 @@ static int lan78xx_resume(struct usb_interface *intf)
 
 		if (!timer_pending(&dev->stat_monitor)) {
 			dev->delta = 1;
-			mod_timer(&dev->stat_monitor,
+			timer_mod(&dev->stat_monitor,
 				  jiffies + STAT_UPDATE_TIMER);
 		}
 
diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index c04e715a4c2a..8c0806316d87 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -640,7 +640,7 @@ static void rx_complete (struct urb *urb)
 	case -EILSEQ:
 		dev->net->stats.rx_errors++;
 		if (!timer_pending (&dev->delay)) {
-			mod_timer (&dev->delay, jiffies + THROTTLE_JIFFIES);
+			timer_mod (&dev->delay, jiffies + THROTTLE_JIFFIES);
 			netif_dbg(dev, link, dev->net,
 				  "rx throttle %d\n", urb_status);
 		}
@@ -1300,7 +1300,7 @@ static void tx_complete (struct urb *urb)
 		case -EILSEQ:
 			usb_mark_last_busy(dev->udev);
 			if (!timer_pending (&dev->delay)) {
-				mod_timer (&dev->delay,
+				timer_mod (&dev->delay,
 					jiffies + THROTTLE_JIFFIES);
 				netif_dbg(dev, link, dev->net,
 					  "tx throttle %d\n", urb->status);
diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index 2cd67b3b7975..9e760bf7f6bf 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -2870,7 +2870,7 @@ static void vxlan_cleanup(struct timer_list *t)
 		spin_unlock(&vxlan->hash_lock[h]);
 	}
 
-	mod_timer(&vxlan->age_timer, next_timer);
+	timer_mod(&vxlan->age_timer, next_timer);
 }
 
 static void vxlan_vs_del_dev(struct vxlan_dev *vxlan)
@@ -2971,7 +2971,7 @@ static int vxlan_open(struct net_device *dev)
 	}
 
 	if (vxlan->cfg.age_interval)
-		mod_timer(&vxlan->age_timer, jiffies + FDB_AGE_INTERVAL);
+		timer_mod(&vxlan->age_timer, jiffies + FDB_AGE_INTERVAL);
 
 	return ret;
 }
@@ -4501,7 +4501,7 @@ static int vxlan_changelink(struct net_device *dev, struct nlattr *tb[],
 		err = vxlan_multicast_leave(vxlan);
 
 	if (conf.age_interval != vxlan->cfg.age_interval)
-		mod_timer(&vxlan->age_timer, jiffies);
+		timer_mod(&vxlan->age_timer, jiffies);
 
 	netdev_adjacent_change_commit(dst->remote_dev, lowerdev, dev);
 	if (lowerdev && lowerdev != dst->remote_dev)
diff --git a/drivers/net/wan/hdlc_ppp.c b/drivers/net/wan/hdlc_ppp.c
index 7889fe51f346..9d025a02ff73 100644
--- a/drivers/net/wan/hdlc_ppp.c
+++ b/drivers/net/wan/hdlc_ppp.c
@@ -316,7 +316,7 @@ static void ppp_cp_event(struct net_device *dev, u16 pid, u16 event, u8 code,
 
 	proto->state = action & STATE_MASK;
 	if (action & (SCR | STR)) /* set Configure-Req/Terminate-Req timer */
-		mod_timer(&proto->timer, proto->timeout =
+		timer_mod(&proto->timer, proto->timeout =
 			  jiffies + ppp->req_timeout * HZ);
 	if (action & ZRC)
 		proto->restart_counter = 0;
@@ -345,7 +345,7 @@ static void ppp_cp_event(struct net_device *dev, u16 pid, u16 event, u8 code,
 			ppp_cp_event(dev, PID_IPCP, START, 0, 0, 0, NULL);
 			ppp_cp_event(dev, PID_IPV6CP, START, 0, 0, 0, NULL);
 			ppp->last_pong = jiffies;
-			mod_timer(&proto->timer, proto->timeout =
+			timer_mod(&proto->timer, proto->timeout =
 				  jiffies + ppp->keepalive_interval * HZ);
 		}
 	}
@@ -566,7 +566,7 @@ static void ppp_timer(struct timer_list *t)
 	unsigned long flags;
 
 	spin_lock_irqsave(&ppp->lock, flags);
-	/* mod_timer could be called after we entered this function but
+	/* timer_mod could be called after we entered this function but
 	 * before we got the lock.
 	 */
 	if (timer_pending(&proto->timer)) {
diff --git a/drivers/net/wireguard/timers.c b/drivers/net/wireguard/timers.c
index 3061e20fcc22..fe373486d955 100644
--- a/drivers/net/wireguard/timers.c
+++ b/drivers/net/wireguard/timers.c
@@ -34,7 +34,7 @@ static inline void mod_peer_timer(struct wg_peer *peer,
 	rcu_read_lock_bh();
 	if (likely(netif_running(peer->device->dev) &&
 		   !READ_ONCE(peer->is_dead)))
-		mod_timer(timer, expires);
+		timer_mod(timer, expires);
 	rcu_read_unlock_bh();
 }
 
diff --git a/drivers/net/wireless/ath/ar5523/ar5523.c b/drivers/net/wireless/ath/ar5523/ar5523.c
index 343c9de2749c..545b9ff09462 100644
--- a/drivers/net/wireless/ath/ar5523/ar5523.c
+++ b/drivers/net/wireless/ath/ar5523/ar5523.c
@@ -138,7 +138,7 @@ static void ar5523_cmd_rx_cb(struct urb *urb)
 		if (!test_bit(AR5523_HW_UP, &ar->flags))
 			ar5523_dbg(ar, "Unexpected WDCMSG_SEND_COMPLETE\n");
 		else {
-			mod_timer(&ar->tx_wd_timer,
+			timer_mod(&ar->tx_wd_timer,
 				  jiffies + AR5523_TX_WD_TIMEOUT);
 			ar5523_data_tx_pkt_put(ar);
 
@@ -870,7 +870,7 @@ static void ar5523_tx_work_locked(struct ar5523 *ar)
 		spin_lock_irqsave(&ar->tx_data_list_lock, flags);
 		list_add_tail(&data->list, &ar->tx_queue_submitted);
 		spin_unlock_irqrestore(&ar->tx_data_list_lock, flags);
-		mod_timer(&ar->tx_wd_timer, jiffies + AR5523_TX_WD_TIMEOUT);
+		timer_mod(&ar->tx_wd_timer, jiffies + AR5523_TX_WD_TIMEOUT);
 		atomic_inc(&ar->tx_nr_pending);
 
 		ar5523_dbg(ar, "TX Frame (%d pending)\n",
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 47829b109192..fe0428acdad5 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -246,10 +246,10 @@ static void ath10k_htt_rx_msdu_buff_replenish(struct ath10k_htt *htt)
 		 * As long as enough buffers are left in the ring for
 		 * another A-MPDU rx, no special recovery is needed.
 		 */
-		mod_timer(&htt->rx_ring.refill_retry_timer, jiffies +
+		timer_mod(&htt->rx_ring.refill_retry_timer, jiffies +
 			  msecs_to_jiffies(HTT_RX_RING_REFILL_RETRY_MS));
 	} else if (num_deficit > 0) {
-		mod_timer(&htt->rx_ring.refill_retry_timer, jiffies +
+		timer_mod(&htt->rx_ring.refill_retry_timer, jiffies +
 			  msecs_to_jiffies(HTT_RX_RING_REFILL_RESCHED_MS));
 	}
 	spin_unlock_bh(&htt->rx_ring.lock);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index c88fb71af708..57e4233be777 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -582,7 +582,7 @@ static void ath10k_pci_sleep(struct ath10k *ar)
 
 	ar_pci->ps_wake_refcount--;
 
-	mod_timer(&ar_pci->ps_timer, jiffies +
+	timer_mod(&ar_pci->ps_timer, jiffies +
 		  msecs_to_jiffies(ATH10K_PCI_SLEEP_GRACE_PERIOD_MSEC));
 
 skip:
@@ -825,7 +825,7 @@ static void ath10k_pci_rx_post_pipe(struct ath10k_pci_pipe *pipe)
 			if (ret == -ENOSPC)
 				break;
 			ath10k_warn(ar, "failed to post pci rx buf: %d\n", ret);
-			mod_timer(&ar_pci->rx_post_retry, jiffies +
+			timer_mod(&ar_pci->rx_post_retry, jiffies +
 				  ATH10K_PCI_RX_POST_RETRY_MS);
 			break;
 		}
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 1d77971652fa..f0e51b483458 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1470,7 +1470,7 @@ static void ath10k_sdio_write_async_work(struct work_struct *work)
 		if (req->address >= mbox_info->htc_addr &&
 		    ar_sdio->mbox_state == SDIO_MBOX_SLEEP_STATE) {
 			ath10k_sdio_set_mbox_sleep(ar, false);
-			mod_timer(&ar_sdio->sleep_timer, jiffies +
+			timer_mod(&ar_sdio->sleep_timer, jiffies +
 				  msecs_to_jiffies(ATH10K_MIN_SLEEP_INACTIVITY_TIME_MS));
 		}
 
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 522f7384c362..1ce0ae8f59a6 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -550,7 +550,7 @@ static void ath10k_snoc_rx_post_pipe(struct ath10k_snoc_pipe *pipe)
 			if (ret == -ENOSPC)
 				break;
 			ath10k_warn(ar, "failed to post rx buf: %d\n", ret);
-			mod_timer(&ar_snoc->rx_post_retry, jiffies +
+			timer_mod(&ar_snoc->rx_post_retry, jiffies +
 				  ATH10K_SNOC_RX_POST_RETRY_MS);
 			break;
 		}
diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index be1aebe48d1a..41474183dfbc 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -451,7 +451,7 @@ static void ath11k_ce_recv_process_cb(struct ath11k_ce_pipe *pipe)
 	if (ret && ret != -ENOSPC) {
 		ath11k_warn(ab, "failed to post rx buf to pipe: %d err: %d\n",
 			    pipe->pipe_num, ret);
-		mod_timer(&ab->rx_replenish_retry,
+		timer_mod(&ab->rx_replenish_retry,
 			  jiffies + ATH11K_CE_RX_POST_RETRY_JIFFIES);
 	}
 }
@@ -897,7 +897,7 @@ void ath11k_ce_rx_post_buf(struct ath11k_base *ab)
 
 			ath11k_warn(ab, "failed to post rx buf to pipe: %d err: %d\n",
 				    i, ret);
-			mod_timer(&ab->rx_replenish_retry,
+			timer_mod(&ab->rx_replenish_retry,
 				  jiffies + ATH11K_CE_RX_POST_RETRY_JIFFIES);
 
 			return;
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 7295020c7806..8e72a7d6498b 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -1131,7 +1131,7 @@ static void ath11k_dp_shadow_timer_handler(struct timer_list *t)
 	 */
 	if (update_timer->timer_tx_num != update_timer->tx_num) {
 		update_timer->timer_tx_num = update_timer->tx_num;
-		mod_timer(&update_timer->timer, jiffies +
+		timer_mod(&update_timer->timer, jiffies +
 		  msecs_to_jiffies(update_timer->interval));
 	} else {
 		update_timer->started = false;
@@ -1157,7 +1157,7 @@ void ath11k_dp_shadow_start_timer(struct ath11k_base *ab,
 
 	update_timer->started = true;
 	update_timer->timer_tx_num = update_timer->tx_num;
-	mod_timer(&update_timer->timer, jiffies +
+	timer_mod(&update_timer->timer, jiffies +
 		  msecs_to_jiffies(update_timer->interval));
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index cb2fc5a257c3..ee97911df24c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -314,7 +314,7 @@ static void ath11k_dp_service_mon_ring(struct timer_list *t)
 	for (i = 0; i < ab->hw_params.num_rxdma_per_pdev; i++)
 		ath11k_dp_rx_process_mon_rings(ab, i, NULL, DP_MON_SERVICE_BUDGET);
 
-	mod_timer(&ab->mon_reap_timer, jiffies +
+	timer_mod(&ab->mon_reap_timer, jiffies +
 		  msecs_to_jiffies(ATH11K_MON_TIMER_INTERVAL));
 }
 
@@ -3704,7 +3704,7 @@ static int ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
 
 	if (!rx_tid->last_frag_no ||
 	    rx_tid->rx_frag_bitmap != GENMASK(rx_tid->last_frag_no, 0)) {
-		mod_timer(&rx_tid->frag_timer, jiffies +
+		timer_mod(&rx_tid->frag_timer, jiffies +
 					       ATH11K_DP_RX_FRAGMENT_TIMEOUT_MS);
 		goto out_unlock;
 	}
@@ -5770,7 +5770,7 @@ int ath11k_dp_rx_pdev_mon_detach(struct ath11k *ar)
 int ath11k_dp_rx_pktlog_start(struct ath11k_base *ab)
 {
 	/* start reap timer */
-	mod_timer(&ab->mon_reap_timer,
+	timer_mod(&ab->mon_reap_timer,
 		  jiffies + msecs_to_jiffies(ATH11K_MON_TIMER_INTERVAL));
 
 	return 0;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 8522c67baabf..4e89ad0a87aa 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -1259,7 +1259,7 @@ int ath11k_dp_tx_htt_monitor_mode_ring_config(struct ath11k *ar, bool reset)
 	}
 
 	if (!ar->ab->hw_params.rxdma1_enable)
-		mod_timer(&ar->ab->mon_reap_timer, jiffies +
+		timer_mod(&ar->ab->mon_reap_timer, jiffies +
 			  msecs_to_jiffies(ATH11K_MON_TIMER_INTERVAL));
 
 	return ret;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 97816916abac..5f0e75589f28 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6174,7 +6174,7 @@ static int ath11k_mac_config_mon_status_default(struct ath11k *ar, bool enable)
 	}
 
 	if (enable && !ar->ab->hw_params.rxdma1_enable)
-		mod_timer(&ar->ab->mon_reap_timer, jiffies +
+		timer_mod(&ar->ab->mon_reap_timer, jiffies +
 			  msecs_to_jiffies(ATH11K_MON_TIMER_INTERVAL));
 
 	return ret;
diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index 45acc6fbf828..135af2fb7554 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -401,7 +401,7 @@ static void ath12k_ce_recv_process_cb(struct ath12k_ce_pipe *pipe)
 	if (ret && ret != -ENOSPC) {
 		ath12k_warn(ab, "failed to post rx buf to pipe: %d err: %d\n",
 			    pipe->pipe_num, ret);
-		mod_timer(&ab->rx_replenish_retry,
+		timer_mod(&ab->rx_replenish_retry,
 			  jiffies + ATH12K_CE_RX_POST_RETRY_JIFFIES);
 	}
 }
@@ -769,7 +769,7 @@ void ath12k_ce_rx_post_buf(struct ath12k_base *ab)
 
 			ath12k_warn(ab, "failed to post rx buf to pipe: %d err: %d\n",
 				    i, ret);
-			mod_timer(&ab->rx_replenish_retry,
+			timer_mod(&ab->rx_replenish_retry,
 				  jiffies + ATH12K_CE_RX_POST_RETRY_JIFFIES);
 
 			return;
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index d7077f8153e1..cb54573ff183 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1033,7 +1033,7 @@ static void ath12k_dp_service_mon_ring(struct timer_list *t)
 		ath12k_dp_mon_process_ring(ab, i, NULL, DP_MON_SERVICE_BUDGET,
 					   ATH12K_DP_RX_MONITOR_MODE);
 
-	mod_timer(&ab->mon_reap_timer, jiffies +
+	timer_mod(&ab->mon_reap_timer, jiffies +
 		  msecs_to_jiffies(ATH12K_MON_TIMER_INTERVAL));
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 51237c7ed9d8..54115483cde9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -3445,7 +3445,7 @@ static int ath12k_dp_rx_frag_h_mpdu(struct ath12k *ar,
 
 	if (!rx_tid->last_frag_no ||
 	    rx_tid->rx_frag_bitmap != GENMASK(rx_tid->last_frag_no, 0)) {
-		mod_timer(&rx_tid->frag_timer, jiffies +
+		timer_mod(&rx_tid->frag_timer, jiffies +
 					       ATH12K_DP_RX_FRAGMENT_TIMEOUT_MS);
 		goto out_unlock;
 	}
diff --git a/drivers/net/wireless/ath/ath6kl/cfg80211.c b/drivers/net/wireless/ath/ath6kl/cfg80211.c
index 8c2e8081112e..b04354281cc0 100644
--- a/drivers/net/wireless/ath/ath6kl/cfg80211.c
+++ b/drivers/net/wireless/ath/ath6kl/cfg80211.c
@@ -665,7 +665,7 @@ static int ath6kl_cfg80211_connect(struct wiphy *wiphy, struct net_device *dev,
 	if ((!(ar->connect_ctrl_flags & CONNECT_DO_WPA_OFFLOAD)) &&
 	    ((vif->auth_mode == WPA_PSK_AUTH) ||
 	     (vif->auth_mode == WPA2_PSK_AUTH))) {
-		mod_timer(&vif->disconnect_timer,
+		timer_mod(&vif->disconnect_timer,
 			  jiffies + msecs_to_jiffies(DISCON_TIMER_INTVAL));
 	}
 
diff --git a/drivers/net/wireless/ath/ath6kl/recovery.c b/drivers/net/wireless/ath/ath6kl/recovery.c
index 43186c193df1..11cd935e5134 100644
--- a/drivers/net/wireless/ath/ath6kl/recovery.c
+++ b/drivers/net/wireless/ath/ath6kl/recovery.c
@@ -35,7 +35,7 @@ static void ath6kl_recovery_work(struct work_struct *work)
 	ar->fw_recovery.err_reason = 0;
 
 	if (ar->fw_recovery.hb_poll)
-		mod_timer(&ar->fw_recovery.hb_timer, jiffies +
+		timer_mod(&ar->fw_recovery.hb_timer, jiffies +
 			  msecs_to_jiffies(ar->fw_recovery.hb_poll));
 }
 
@@ -91,7 +91,7 @@ static void ath6kl_recovery_hb_timer(struct timer_list *t)
 		ath6kl_warn("Failed to send hb challenge request, err:%d\n",
 			    err);
 
-	mod_timer(&ar->fw_recovery.hb_timer, jiffies +
+	timer_mod(&ar->fw_recovery.hb_timer, jiffies +
 		  msecs_to_jiffies(ar->fw_recovery.hb_poll));
 }
 
@@ -108,7 +108,7 @@ void ath6kl_recovery_init(struct ath6kl *ar)
 		    TIMER_DEFERRABLE);
 
 	if (ar->fw_recovery.hb_poll)
-		mod_timer(&ar->fw_recovery.hb_timer, jiffies +
+		timer_mod(&ar->fw_recovery.hb_timer, jiffies +
 			  msecs_to_jiffies(ar->fw_recovery.hb_poll));
 }
 
@@ -154,6 +154,6 @@ void ath6kl_recovery_resume(struct ath6kl *ar)
 	ar->fw_recovery.hb_pending = false;
 	ar->fw_recovery.seq_num = 0;
 	ar->fw_recovery.hb_misscnt = 0;
-	mod_timer(&ar->fw_recovery.hb_timer,
+	timer_mod(&ar->fw_recovery.hb_timer,
 		  jiffies + msecs_to_jiffies(ar->fw_recovery.hb_poll));
 }
diff --git a/drivers/net/wireless/ath/ath6kl/txrx.c b/drivers/net/wireless/ath/ath6kl/txrx.c
index 87dc2237c3ee..ebda8274c156 100644
--- a/drivers/net/wireless/ath/ath6kl/txrx.c
+++ b/drivers/net/wireless/ath/ath6kl/txrx.c
@@ -1218,7 +1218,7 @@ static bool aggr_process_recv_frm(struct aggr_info_conn *agg_conn, u8 tid,
 			 * forever.
 			 */
 			agg_conn->timer_scheduled = true;
-			mod_timer(&agg_conn->timer,
+			timer_mod(&agg_conn->timer,
 				  (jiffies + (HZ * AGGR_RX_TIMEOUT) / 1000));
 			rxtid->timer_mon = true;
 			break;
@@ -1665,7 +1665,7 @@ static void aggr_timeout(struct timer_list *t)
 	}
 
 	if (aggr_conn->timer_scheduled)
-		mod_timer(&aggr_conn->timer,
+		timer_mod(&aggr_conn->timer,
 			  jiffies + msecs_to_jiffies(AGGR_RX_TIMEOUT));
 }
 
diff --git a/drivers/net/wireless/ath/ath6kl/wmi.c b/drivers/net/wireless/ath/ath6kl/wmi.c
index 84317afe4651..1c2527811255 100644
--- a/drivers/net/wireless/ath/ath6kl/wmi.c
+++ b/drivers/net/wireless/ath/ath6kl/wmi.c
@@ -1159,7 +1159,7 @@ static int ath6kl_wmi_bssinfo_event_rx(struct wmi *wmi, u8 *datap, int len,
 	 */
 	if (test_bit(SCHED_SCANNING, &vif->flags) &&
 	    !timer_pending(&vif->sched_scan_timer)) {
-		mod_timer(&vif->sched_scan_timer, jiffies +
+		timer_mod(&vif->sched_scan_timer, jiffies +
 			  msecs_to_jiffies(ATH6KL_SCHED_SCAN_RESULT_DELAY));
 	}
 
diff --git a/drivers/net/wireless/ath/ath9k/channel.c b/drivers/net/wireless/ath/ath9k/channel.c
index 121e51ce1bc0..33e47caa00a3 100644
--- a/drivers/net/wireless/ath/ath9k/channel.c
+++ b/drivers/net/wireless/ath/ath9k/channel.c
@@ -374,7 +374,7 @@ static void ath_chanctx_setup_timer(struct ath_softc *sc, u32 tsf_time)
 	ath9k_hw_gen_timer_start(ah, sc->p2p_ps_timer, tsf_time, 1000000);
 	tsf_time -= ath9k_hw_gettsf32(ah);
 	timeout = msecs_to_jiffies(tsf_time / 1000) + 1;
-	mod_timer(&sc->sched.timer, jiffies + timeout);
+	timer_mod(&sc->sched.timer, jiffies + timeout);
 
 	ath_dbg(common, CHAN_CTX,
 		"Setup chanctx timer with timeout: %d (%d) ms\n",
@@ -1035,7 +1035,7 @@ static void ath_scan_channel_start(struct ath_softc *sc)
 		"Moving offchannel state to ATH_OFFCHANNEL_PROBE_WAIT\n");
 
 	sc->offchannel.state = ATH_OFFCHANNEL_PROBE_WAIT;
-	mod_timer(&sc->offchannel.timer, jiffies + sc->offchannel.duration);
+	timer_mod(&sc->offchannel.timer, jiffies + sc->offchannel.duration);
 }
 
 static void ath_chanctx_timer(struct timer_list *t)
@@ -1072,7 +1072,7 @@ static void ath_offchannel_timer(struct timer_list *t)
 
 			sc->offchannel.state = ATH_OFFCHANNEL_SUSPEND;
 			ath_chanctx_switch(sc, ctx, NULL);
-			mod_timer(&sc->offchannel.timer, jiffies + HZ / 10);
+			timer_mod(&sc->offchannel.timer, jiffies + HZ / 10);
 			break;
 		}
 		fallthrough;
@@ -1210,7 +1210,7 @@ static void ath_offchannel_channel_change(struct ath_softc *sc)
 			break;
 
 		sc->offchannel.state = ATH_OFFCHANNEL_ROC_WAIT;
-		mod_timer(&sc->offchannel.timer,
+		timer_mod(&sc->offchannel.timer,
 			  jiffies + sc->offchannel.duration);
 		ieee80211_ready_on_channel(sc->hw);
 		break;
diff --git a/drivers/net/wireless/ath/ath9k/gpio.c b/drivers/net/wireless/ath/ath9k/gpio.c
index 8b9bde7135d4..9967ce6aad5a 100644
--- a/drivers/net/wireless/ath/ath9k/gpio.c
+++ b/drivers/net/wireless/ath/ath9k/gpio.c
@@ -238,13 +238,13 @@ static void ath_btcoex_period_timer(struct timer_list *t)
 	spin_unlock_bh(&btcoex->btcoex_lock);
 
 	if (btcoex->btcoex_period != btcoex->btcoex_no_stomp)
-		mod_timer(&btcoex->no_stomp_timer,
+		timer_mod(&btcoex->no_stomp_timer,
 			 jiffies + msecs_to_jiffies(timer_period));
 
 	ath9k_ps_restore(sc);
 
 skip_hw_wakeup:
-	mod_timer(&btcoex->period_timer,
+	timer_mod(&btcoex->period_timer,
 		  jiffies + msecs_to_jiffies(btcoex->btcoex_period));
 }
 
@@ -312,7 +312,7 @@ void ath9k_btcoex_timer_resume(struct ath_softc *sc)
 	clear_bit(BT_OP_PRIORITY_DETECTED, &btcoex->op_flags);
 	clear_bit(BT_OP_SCAN, &btcoex->op_flags);
 
-	mod_timer(&btcoex->period_timer, jiffies);
+	timer_mod(&btcoex->period_timer, jiffies);
 }
 
 /*
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index 19600018e562..a1e9cdbeb0b2 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -230,7 +230,7 @@ void ath9k_htc_reset(struct ath9k_htc_priv *priv)
 	ath9k_htc_vif_reconfig(priv);
 	ieee80211_wake_queues(priv->hw);
 
-	mod_timer(&priv->tx.cleanup_timer,
+	timer_mod(&priv->tx.cleanup_timer,
 		  jiffies + msecs_to_jiffies(ATH9K_HTC_TX_CLEANUP_INTERVAL));
 
 	ath9k_htc_ps_restore(priv);
@@ -308,7 +308,7 @@ static int ath9k_htc_set_channel(struct ath9k_htc_priv *priv,
 	    !(hw->conf.flags & IEEE80211_CONF_OFFCHANNEL))
 		ath9k_htc_vif_reconfig(priv);
 
-	mod_timer(&priv->tx.cleanup_timer,
+	timer_mod(&priv->tx.cleanup_timer,
 		  jiffies + msecs_to_jiffies(ATH9K_HTC_TX_CLEANUP_INTERVAL));
 
 	/* perform spectral scan if requested. */
@@ -963,7 +963,7 @@ static int ath9k_htc_start(struct ieee80211_hw *hw)
 
 	ieee80211_wake_queues(hw);
 
-	mod_timer(&priv->tx.cleanup_timer,
+	timer_mod(&priv->tx.cleanup_timer,
 		  jiffies + msecs_to_jiffies(ATH9K_HTC_TX_CLEANUP_INTERVAL));
 
 	ath9k_htc_start_btcoex(priv);
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
index 320dfbc64eab..aa7688ce241c 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
@@ -801,7 +801,7 @@ void ath9k_htc_tx_cleanup_timer(struct timer_list *t)
 	/* Wake TX queues if needed */
 	ath9k_htc_check_wake_queues(priv);
 
-	mod_timer(&priv->tx.cleanup_timer,
+	timer_mod(&priv->tx.cleanup_timer,
 		  jiffies + msecs_to_jiffies(ATH9K_HTC_TX_CLEANUP_INTERVAL));
 }
 
diff --git a/drivers/net/wireless/ath/ath9k/link.c b/drivers/net/wireless/ath/ath9k/link.c
index 5d7e3ddb6dbc..5a0cb2096075 100644
--- a/drivers/net/wireless/ath/ath9k/link.c
+++ b/drivers/net/wireless/ath/ath9k/link.c
@@ -434,7 +434,7 @@ void ath_ani_calibrate(struct timer_list *t)
 	if (!common->ani.caldone)
 		cal_interval = min(cal_interval, (u32)short_cal_interval);
 
-	mod_timer(&common->ani.timer, jiffies + msecs_to_jiffies(cal_interval));
+	timer_mod(&common->ani.timer, jiffies + msecs_to_jiffies(cal_interval));
 
 	if (ar9003_is_paprd_enabled(ah) && ah->caldata) {
 		if (!test_bit(PAPRD_DONE, &ah->caldata->cal_flags)) {
@@ -463,7 +463,7 @@ void ath_start_ani(struct ath_softc *sc)
 	common->ani.checkani_timer = timestamp;
 
 	ath_dbg(common, ANI, "Starting ANI\n");
-	mod_timer(&common->ani.timer,
+	timer_mod(&common->ani.timer,
 		  jiffies + msecs_to_jiffies((u32)ah->config.ani_poll_interval));
 }
 
diff --git a/drivers/net/wireless/ath/ath9k/main.c b/drivers/net/wireless/ath/ath9k/main.c
index c56f4f3b8990..0dafd75b0eca 100644
--- a/drivers/net/wireless/ath/ath9k/main.c
+++ b/drivers/net/wireless/ath/ath9k/main.c
@@ -154,7 +154,7 @@ void ath9k_ps_restore(struct ath_softc *sc)
 		goto unlock;
 
 	if (sc->ps_idle) {
-		mod_timer(&sc->sleep_timer, jiffies + HZ / 10);
+		timer_mod(&sc->sleep_timer, jiffies + HZ / 10);
 		goto unlock;
 	}
 
diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireless/ath/wcn36xx/dxe.c
index 0f4df5585fd9..18ae3ba63aab 100644
--- a/drivers/net/wireless/ath/wcn36xx/dxe.c
+++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
@@ -429,7 +429,7 @@ static void reap_tx_dxes(struct wcn36xx *wcn, struct wcn36xx_dxe_ch *ch)
 					if (WARN_ON(wcn->tx_ack_skb))
 						ieee80211_free_txskb(wcn->hw, wcn->tx_ack_skb);
 					wcn->tx_ack_skb = ctl->skb; /* Tracking ref */
-					mod_timer(&wcn->tx_ack_timer, jiffies + HZ / 10);
+					timer_mod(&wcn->tx_ack_timer, jiffies + HZ / 10);
 					spin_unlock(&wcn->dxe_lock);
 				}
 				/* do not free, ownership transferred to mac80211 status cb */
diff --git a/drivers/net/wireless/ath/wil6210/cfg80211.c b/drivers/net/wireless/ath/wil6210/cfg80211.c
index 5473c01cbe66..0d360b2a6698 100644
--- a/drivers/net/wireless/ath/wil6210/cfg80211.c
+++ b/drivers/net/wireless/ath/wil6210/cfg80211.c
@@ -973,7 +973,7 @@ static int wil_cfg80211_scan(struct wiphy *wiphy,
 	}
 
 	vif->scan_request = request;
-	mod_timer(&vif->scan_timer, jiffies + WIL6210_SCAN_TO);
+	timer_mod(&vif->scan_timer, jiffies + WIL6210_SCAN_TO);
 
 	cmd->scan_type = WMI_ACTIVE_SCAN;
 	cmd->num_channels = 0;
@@ -1172,7 +1172,7 @@ static int wil_ft_connect(struct wiphy *wiphy,
 	rc = wmi_send(wil, WMI_FT_AUTH_CMDID, vif->mid,
 		      &auth_cmd, sizeof(auth_cmd));
 	if (rc == 0)
-		mod_timer(&vif->connect_timer,
+		timer_mod(&vif->connect_timer,
 			  jiffies + msecs_to_jiffies(5000));
 	else
 		clear_bit(wil_vif_ft_roam, vif->status);
@@ -1369,7 +1369,7 @@ static int wil_cfg80211_connect(struct wiphy *wiphy,
 			wil6210_bus_request(wil, WIL_MAX_BUS_REQUEST_KBPS);
 		vif->bss = bss;
 		/* Connect can take lots of time */
-		mod_timer(&vif->connect_timer,
+		timer_mod(&vif->connect_timer,
 			  jiffies + msecs_to_jiffies(5000));
 	} else {
 		clear_bit(wil_vif_fwconnecting, vif->status);
diff --git a/drivers/net/wireless/ath/wil6210/p2p.c b/drivers/net/wireless/ath/wil6210/p2p.c
index f20caf1a3905..a99c571eceef 100644
--- a/drivers/net/wireless/ath/wil6210/p2p.c
+++ b/drivers/net/wireless/ath/wil6210/p2p.c
@@ -40,7 +40,7 @@ static int wil_p2p_start_listen(struct wil6210_vif *vif)
 	}
 
 	INIT_WORK(&p2p->discovery_expired_work, wil_p2p_listen_expired);
-	mod_timer(&p2p->discovery_timer,
+	timer_mod(&p2p->discovery_timer,
 		  jiffies + msecs_to_jiffies(p2p->listen_duration));
 out_stop:
 	if (rc)
@@ -111,7 +111,7 @@ int wil_p2p_search(struct wil6210_vif *vif,
 
 	p2p->discovery_started = 1;
 	INIT_WORK(&p2p->discovery_expired_work, wil_p2p_search_expired);
-	mod_timer(&p2p->discovery_timer,
+	timer_mod(&p2p->discovery_timer,
 		  jiffies + msecs_to_jiffies(P2P_SEARCH_DURATION_MS));
 
 out_stop:
diff --git a/drivers/net/wireless/atmel/at76c50x-usb.c b/drivers/net/wireless/atmel/at76c50x-usb.c
index 4f01189b7c4b..cd27e15bba4b 100644
--- a/drivers/net/wireless/atmel/at76c50x-usb.c
+++ b/drivers/net/wireless/atmel/at76c50x-usb.c
@@ -524,7 +524,7 @@ static void at76_ledtrig_tx_timerfunc(struct timer_list *unused)
 	if (tx_lastactivity != tx_activity) {
 		tx_lastactivity = tx_activity;
 		led_trigger_event(ledtrig_tx, LED_FULL);
-		mod_timer(&ledtrig_tx_timer, jiffies + HZ / 4);
+		timer_mod(&ledtrig_tx_timer, jiffies + HZ / 4);
 	} else
 		led_trigger_event(ledtrig_tx, LED_OFF);
 }
@@ -533,7 +533,7 @@ static void at76_ledtrig_tx_activity(void)
 {
 	tx_activity++;
 	if (!timer_pending(&ledtrig_tx_timer))
-		mod_timer(&ledtrig_tx_timer, jiffies + HZ / 4);
+		timer_mod(&ledtrig_tx_timer, jiffies + HZ / 4);
 }
 
 static int at76_remap(struct usb_device *udev)
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/btcoex.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/btcoex.c
index 34c7e04f8444..90267b044db3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/btcoex.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/btcoex.c
@@ -300,10 +300,10 @@ static void brcmf_btcoex_handler(struct work_struct *work)
 		brcmf_dbg(INFO, "DHCP started\n");
 		btci->bt_state = BRCMF_BT_DHCP_OPPR_WIN;
 		if (btci->timeout < BRCMF_BTCOEX_OPPR_WIN_TIME) {
-			mod_timer(&btci->timer, btci->timer.expires);
+			timer_mod(&btci->timer, btci->timer.expires);
 		} else {
 			btci->timeout -= BRCMF_BTCOEX_OPPR_WIN_TIME;
-			mod_timer(&btci->timer,
+			timer_mod(&btci->timer,
 				  jiffies + BRCMF_BTCOEX_OPPR_WIN_TIME);
 		}
 		btci->timer_on = true;
@@ -321,7 +321,7 @@ static void brcmf_btcoex_handler(struct work_struct *work)
 		brcmf_btcoex_boost_wifi(btci, true);
 
 		btci->bt_state = BRCMF_BT_DHCP_FLAG_FORCE_TIMEOUT;
-		mod_timer(&btci->timer, jiffies + btci->timeout);
+		timer_mod(&btci->timer, jiffies + btci->timeout);
 		btci->timer_on = true;
 		break;
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index d98323342c69..ab34a3fbd395 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -1569,7 +1569,7 @@ brcmf_cfg80211_scan(struct wiphy *wiphy, struct cfg80211_scan_request *request)
 		goto scan_out;
 
 	/* Arm scan timeout timer */
-	mod_timer(&cfg->escan_timeout,
+	timer_mod(&cfg->escan_timeout,
 		  jiffies + msecs_to_jiffies(BRCMF_ESCAN_TIMER_INTERVAL_MS));
 
 	return 0;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 82b526b476f0..f3fcd889e2cc 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -2321,7 +2321,7 @@ brcmf_pcie_fwcon_timer(struct brcmf_pciedev_info *devinfo, bool active)
 		devinfo->console_active = true;
 	} else {
 		/* Reschedule the timer */
-		mod_timer(&devinfo->timer, jiffies + devinfo->console_interval);
+		timer_mod(&devinfo->timer, jiffies + devinfo->console_interval);
 	}
 }
 
@@ -2336,7 +2336,7 @@ brcmf_pcie_fwcon(struct timer_list *t)
 	brcmf_pcie_bus_console_read(devinfo, false);
 
 	/* Reschedule the timer if console interval is not zero */
-	mod_timer(&devinfo->timer, jiffies + devinfo->console_interval);
+	timer_mod(&devinfo->timer, jiffies + devinfo->console_interval);
 }
 
 static int brcmf_pcie_console_interval_get(void *data, u64 *val)
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index bd2e602fd027..11855fb224c7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -4127,7 +4127,7 @@ brcmf_sdio_watchdog(struct timer_list *t)
 		complete(&bus->watchdog_wait);
 		/* Reschedule the watchdog */
 		if (bus->wd_active)
-			mod_timer(&bus->timer,
+			timer_mod(&bus->timer,
 				  jiffies + BRCMF_WD_POLL);
 	}
 }
@@ -4630,7 +4630,7 @@ void brcmf_sdio_wd_timer(struct brcmf_sdio *bus, bool active)
 			bus->wd_active = true;
 		} else {
 			/* Re arm the timer, at last watchdog period */
-			mod_timer(&bus->timer, jiffies + BRCMF_WD_POLL);
+			timer_mod(&bus->timer, jiffies + BRCMF_WD_POLL);
 		}
 	}
 }
diff --git a/drivers/net/wireless/intel/iwlegacy/3945-rs.c b/drivers/net/wireless/intel/iwlegacy/3945-rs.c
index 229c36116b60..4347c651feb6 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945-rs.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945-rs.c
@@ -211,7 +211,7 @@ il3945_bg_rate_scale_flush(struct timer_list *t)
 		D_RATE("new flush period: %d msec ave %d\n", duration,
 		       packet_count);
 
-		mod_timer(&rs_sta->rate_scale_flush,
+		timer_mod(&rs_sta->rate_scale_flush,
 			  jiffies + rs_sta->flush_time);
 
 		rs_sta->last_partial_flush = jiffies;
@@ -511,7 +511,7 @@ il3945_rs_tx_status(void *il_rate, struct ieee80211_supported_band *sband,
 
 		rs_sta->last_partial_flush = jiffies;
 		rs_sta->flush_pending = 1;
-		mod_timer(&rs_sta->rate_scale_flush,
+		timer_mod(&rs_sta->rate_scale_flush,
 			  jiffies + rs_sta->flush_time);
 	}
 
diff --git a/drivers/net/wireless/intel/iwlegacy/4965-mac.c b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
index 8e58e97a148f..31f41cabe6ba 100644
--- a/drivers/net/wireless/intel/iwlegacy/4965-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
@@ -1381,7 +1381,7 @@ il4965_hdl_stats(struct il_priv *il, struct il_rx_buf *rxb)
 	 * Reschedule the stats timer to occur in recalib_seconds to ensure
 	 * we get a thermal update even if the uCode doesn't give us one
 	 */
-	mod_timer(&il->stats_periodic,
+	timer_mod(&il->stats_periodic,
 		  jiffies + msecs_to_jiffies(recalib_seconds * 1000));
 
 	if (unlikely(!test_bit(S_SCANNING, &il->status)) &&
diff --git a/drivers/net/wireless/intel/iwlegacy/common.c b/drivers/net/wireless/intel/iwlegacy/common.c
index 9a86688aea67..384e16ae68f7 100644
--- a/drivers/net/wireless/intel/iwlegacy/common.c
+++ b/drivers/net/wireless/intel/iwlegacy/common.c
@@ -4828,7 +4828,7 @@ il_bg_watchdog(struct timer_list *t)
 			return;
 	}
 
-	mod_timer(&il->watchdog,
+	timer_mod(&il->watchdog,
 		  jiffies + msecs_to_jiffies(IL_WD_TICK(timeout)));
 }
 EXPORT_SYMBOL(il_bg_watchdog);
@@ -4839,7 +4839,7 @@ il_setup_watchdog(struct il_priv *il)
 	unsigned int timeout = il->cfg->wd_timeout;
 
 	if (timeout)
-		mod_timer(&il->watchdog,
+		timer_mod(&il->watchdog,
 			  jiffies + msecs_to_jiffies(IL_WD_TICK(timeout)));
 	else
 		timer_delete(&il->watchdog);
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c b/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c
index 2ed4b6e798ab..75aeef6372c7 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c
@@ -1866,7 +1866,7 @@ static ssize_t iwl_dbgfs_ucode_tracing_write(struct file *file,
 		priv->event_log.ucode_trace = true;
 		if (iwl_is_alive(priv)) {
 			/* start collecting data now */
-			mod_timer(&priv->ucode_trace, jiffies);
+			timer_mod(&priv->ucode_trace, jiffies);
 		}
 	} else {
 		priv->event_log.ucode_trace = false;
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/main.c b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
index 9360a730c0b5..290edf329c4c 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/main.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
@@ -545,7 +545,7 @@ static void iwl_bg_ucode_trace(struct timer_list *t)
 	if (priv->event_log.ucode_trace) {
 		iwl_continuous_event_trace(priv);
 		/* Reschedule the timer to occur in UCODE_TRACE_PERIOD */
-		mod_timer(&priv->ucode_trace,
+		timer_mod(&priv->ucode_trace,
 			 jiffies + msecs_to_jiffies(UCODE_TRACE_PERIOD));
 	}
 }
@@ -776,7 +776,7 @@ int iwl_alive_start(struct iwl_priv *priv)
 
 	if (priv->event_log.ucode_trace) {
 		/* start collecting data now */
-		mod_timer(&priv->ucode_trace, jiffies);
+		timer_mod(&priv->ucode_trace, jiffies);
 	}
 
 	/* download priority table before any calibration request */
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/rx.c b/drivers/net/wireless/intel/iwlwifi/dvm/rx.c
index 7f67e602940c..aa7b34a451c1 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/rx.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/rx.c
@@ -428,7 +428,7 @@ static void iwlagn_rx_statistics(struct iwl_priv *priv,
 	 * reg_recalib_period seconds to ensure we get a
 	 * thermal update even if the uCode doesn't give
 	 * us one */
-	mod_timer(&priv->statistics_periodic, jiffies +
+	timer_mod(&priv->statistics_periodic, jiffies +
 		  msecs_to_jiffies(reg_recalib_period * 1000));
 
 	if (unlikely(!test_bit(STATUS_SCANNING, &priv->status)) &&
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/tt.c b/drivers/net/wireless/intel/iwlwifi/dvm/tt.c
index 612be73761b5..61906ac76202 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/tt.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/tt.c
@@ -162,7 +162,7 @@ static void iwl_tt_check_exit_ct_kill(struct timer_list *t)
 		 * CT_KILL_EXIT_DURATION seconds to ensure we get a
 		 * thermal update */
 		IWL_DEBUG_TEMP(priv, "schedule ct_kill exit timer\n");
-		mod_timer(&priv->thermal_throttle.ct_kill_exit_tm,
+		timer_mod(&priv->thermal_throttle.ct_kill_exit_tm,
 			  jiffies + CT_KILL_EXIT_DURATION * HZ);
 	}
 }
@@ -176,7 +176,7 @@ static void iwl_perform_ct_kill_task(struct iwl_priv *priv,
 			ieee80211_stop_queues(priv->hw);
 		IWL_DEBUG_TEMP(priv,
 				"Schedule 5 seconds CT_KILL Timer\n");
-		mod_timer(&priv->thermal_throttle.ct_kill_exit_tm,
+		timer_mod(&priv->thermal_throttle.ct_kill_exit_tm,
 			  jiffies + CT_KILL_EXIT_DURATION * HZ);
 	} else {
 		IWL_DEBUG_TEMP(priv, "Wake all queues\n");
@@ -210,7 +210,7 @@ static void iwl_prepare_ct_kill_task(struct iwl_priv *priv)
 	/* make request to retrieve statistics information */
 	iwl_send_statistics_request(priv, 0, false);
 	/* Reschedule the ct_kill wait timer */
-	mod_timer(&priv->thermal_throttle.ct_kill_waiting_tm,
+	timer_mod(&priv->thermal_throttle.ct_kill_waiting_tm,
 		 jiffies + msecs_to_jiffies(CT_KILL_WAITING_DURATION));
 }
 
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
index 4bb6e11d74ba..703708449429 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
@@ -963,7 +963,7 @@ static void iwl_dbg_tlv_periodic_trig_handler(struct timer_list *t)
 		if (!occur)
 			return;
 
-		mod_timer(t, jiffies + msecs_to_jiffies(collect_interval));
+		timer_mod(t, jiffies + msecs_to_jiffies(collect_interval));
 	}
 }
 
@@ -1018,7 +1018,7 @@ static void iwl_dbg_tlv_set_periodic_trigs(struct iwl_fw_runtime *fwrt)
 
 		IWL_DEBUG_FW(fwrt, "WRT: Enabling periodic trigger\n");
 
-		mod_timer(&timer_node->timer,
+		timer_mod(&timer_node->timer,
 			  jiffies + msecs_to_jiffies(collect_interval));
 	}
 }
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/agg.c b/drivers/net/wireless/intel/iwlwifi/mld/agg.c
index 301959bb269f..1918672bb4ec 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/agg.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/agg.c
@@ -335,7 +335,7 @@ static void iwl_mld_rx_agg_session_expired(struct timer_list *t)
 	timeout = ba_data->last_rx_timestamp +
 		  TU_TO_JIFFIES(ba_data->timeout * 2);
 	if (time_is_after_jiffies(timeout)) {
-		mod_timer(&ba_data->session_timer, timeout);
+		timer_mod(&ba_data->session_timer, timeout);
 		goto unlock;
 	}
 
@@ -564,7 +564,7 @@ int iwl_mld_ampdu_rx_start(struct iwl_mld *mld, struct ieee80211_sta *sta,
 	timer_setup(&baid_data->session_timer, iwl_mld_rx_agg_session_expired,
 		    0);
 	if (timeout)
-		mod_timer(&baid_data->session_timer,
+		timer_mod(&baid_data->session_timer,
 			  TU_TO_EXP_TIME(timeout * 2));
 
 	IWL_DEBUG_HT(mld, "STA mask=0x%x (tid=%d) is assigned to BAID %d\n",
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/sta.c b/drivers/net/wireless/intel/iwlwifi/mvm/sta.c
index 728df20bf990..547ab66b537c 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/sta.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/sta.c
@@ -273,7 +273,7 @@ static void iwl_mvm_rx_agg_session_expired(struct timer_list *t)
 
 	timeout = ba_data->last_rx + TU_TO_JIFFIES(ba_data->timeout * 2);
 	if (time_is_after_jiffies(timeout)) {
-		mod_timer(&ba_data->session_timer, timeout);
+		timer_mod(&ba_data->session_timer, timeout);
 		goto unlock;
 	}
 
@@ -2975,7 +2975,7 @@ int iwl_mvm_sta_rx_agg(struct iwl_mvm *mvm, struct ieee80211_sta *sta,
 
 		mvm_sta->tid_to_baid[tid] = baid;
 		if (timeout)
-			mod_timer(&baid_data->session_timer,
+			timer_mod(&baid_data->session_timer,
 				  TU_TO_EXP_TIME(timeout * 2));
 
 		iwl_mvm_init_reorder_buffer(mvm, baid_data, ssn);
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c b/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c
index 71227fd3dac0..12a98c509489 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c
@@ -803,7 +803,7 @@ int iwl_txq_gen2_tx(struct iwl_trans *trans, struct sk_buff *skb,
 
 	/* start timer if queue currently empty */
 	if (txq->read_ptr == txq->write_ptr && txq->wd_timeout)
-		mod_timer(&txq->stuck_timer, jiffies + txq->wd_timeout);
+		timer_mod(&txq->stuck_timer, jiffies + txq->wd_timeout);
 
 	/* Tell device the write index *just past* this latest filled TFD */
 	txq->write_ptr = iwl_txq_inc_wrap(trans, txq->write_ptr);
@@ -1425,7 +1425,7 @@ int iwl_pcie_gen2_enqueue_hcmd(struct iwl_trans *trans,
 
 	/* start timer if queue currently empty */
 	if (txq->read_ptr == txq->write_ptr && txq->wd_timeout)
-		mod_timer(&txq->stuck_timer, jiffies + txq->wd_timeout);
+		timer_mod(&txq->stuck_timer, jiffies + txq->wd_timeout);
 
 	spin_lock(&trans_pcie->reg_lock);
 	/* Increment and update queue's write index */
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/tx.c b/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
index 25bf2efb785c..60eb87dacc7d 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
@@ -1056,7 +1056,7 @@ static void iwl_txq_progress(struct iwl_txq *txq)
 	if (txq->read_ptr == txq->write_ptr)
 		timer_delete(&txq->stuck_timer);
 	else
-		mod_timer(&txq->stuck_timer, jiffies + txq->wd_timeout);
+		timer_mod(&txq->stuck_timer, jiffies + txq->wd_timeout);
 }
 
 static inline bool iwl_txq_used(const struct iwl_txq *q, int i,
@@ -1593,7 +1593,7 @@ int iwl_pcie_enqueue_hcmd(struct iwl_trans *trans,
 
 	/* start timer if queue currently empty */
 	if (txq->read_ptr == txq->write_ptr && txq->wd_timeout)
-		mod_timer(&txq->stuck_timer, jiffies + txq->wd_timeout);
+		timer_mod(&txq->stuck_timer, jiffies + txq->wd_timeout);
 
 	ret = iwl_pcie_set_cmd_in_flight(trans, cmd);
 	if (ret < 0) {
@@ -2284,7 +2284,7 @@ int iwl_trans_pcie_tx(struct iwl_trans *trans, struct sk_buff *skb,
 		 * wake up.
 		 */
 		if (!txq->frozen)
-			mod_timer(&txq->stuck_timer,
+			timer_mod(&txq->stuck_timer,
 				  jiffies + txq->wd_timeout);
 		else
 			txq->frozen_expiry_remainder = txq->wd_timeout;
@@ -2537,7 +2537,7 @@ void iwl_pcie_freeze_txq_timer(struct iwl_trans *trans,
 		 * Wake a non-empty queue -> arm timer with the
 		 * remainder before it froze
 		 */
-		mod_timer(&txq->stuck_timer,
+		timer_mod(&txq->stuck_timer,
 			  now + txq->frozen_expiry_remainder);
 
 next_queue:
diff --git a/drivers/net/wireless/marvell/libertas/cmd.c b/drivers/net/wireless/marvell/libertas/cmd.c
index 21fde876bb0d..ac333c652d6e 100644
--- a/drivers/net/wireless/marvell/libertas/cmd.c
+++ b/drivers/net/wireless/marvell/libertas/cmd.c
@@ -907,7 +907,7 @@ static void lbs_submit_command(struct lbs_private *priv,
 		lbs_complete_command(priv, cmdnode, 0);
 	} else {
 		/* Setup the timer after transmit command */
-		mod_timer(&priv->command_timer, jiffies + timeo);
+		timer_mod(&priv->command_timer, jiffies + timeo);
 	}
 }
 
diff --git a/drivers/net/wireless/marvell/libertas/if_usb.c b/drivers/net/wireless/marvell/libertas/if_usb.c
index b3c4040257a6..7e448d8acd70 100644
--- a/drivers/net/wireless/marvell/libertas/if_usb.c
+++ b/drivers/net/wireless/marvell/libertas/if_usb.c
@@ -580,7 +580,7 @@ static void if_usb_receive_fwload(struct urb *urb)
 	kfree_skb(skb);
 
 	/* Give device 5s to either write firmware to its RAM or eeprom */
-	mod_timer(&cardp->fw_timeout, jiffies + (HZ*5));
+	timer_mod(&cardp->fw_timeout, jiffies + (HZ*5));
 
 	if (cardp->fwfinalblk) {
 		cardp->fwdnldover = 1;
diff --git a/drivers/net/wireless/marvell/libertas/main.c b/drivers/net/wireless/marvell/libertas/main.c
index 01a79452c400..c69159087b20 100644
--- a/drivers/net/wireless/marvell/libertas/main.c
+++ b/drivers/net/wireless/marvell/libertas/main.c
@@ -577,7 +577,7 @@ static int lbs_thread(void *data)
 				lbs_deb_tx("host_to_card failed %d\n", ret);
 				priv->dnld_sent = DNLD_RES_RECEIVED;
 			} else {
-				mod_timer(&priv->tx_lockup_timer,
+				timer_mod(&priv->tx_lockup_timer,
 					  jiffies + (HZ * 5));
 			}
 			priv->tx_pending_len = 0;
diff --git a/drivers/net/wireless/marvell/libertas_tf/cmd.c b/drivers/net/wireless/marvell/libertas_tf/cmd.c
index 7fc1bdb6c458..fc035dbcacbe 100644
--- a/drivers/net/wireless/marvell/libertas_tf/cmd.c
+++ b/drivers/net/wireless/marvell/libertas_tf/cmd.c
@@ -263,7 +263,7 @@ static void lbtf_submit_command(struct lbtf_private *priv,
 	}
 
 	/* Setup the timer after transmit command */
-	mod_timer(&priv->command_timer, jiffies + timeo);
+	timer_mod(&priv->command_timer, jiffies + timeo);
 
 	lbtf_deb_leave(LBTF_DEB_HOST);
 }
diff --git a/drivers/net/wireless/marvell/libertas_tf/if_usb.c b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
index 5662a244f82a..1e12eb1aa582 100644
--- a/drivers/net/wireless/marvell/libertas_tf/if_usb.c
+++ b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
@@ -560,7 +560,7 @@ static void if_usb_receive_fwload(struct urb *urb)
 	kfree_skb(skb);
 
 	/* reschedule timer for 200ms hence */
-	mod_timer(&cardp->fw_timeout, jiffies + (HZ/5));
+	timer_mod(&cardp->fw_timeout, jiffies + (HZ/5));
 
 	if (cardp->fwfinalblk) {
 		cardp->fwdnldover = 1;
diff --git a/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c b/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
index 354c5ce66045..a348e4d2ba15 100644
--- a/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
+++ b/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
@@ -416,7 +416,7 @@ mwifiex_11n_rxreorder_timer_restart(struct mwifiex_rx_reorder_tbl *tbl)
 	else
 		min_flush_time = MIN_FLUSH_TIMER_MS;
 
-	mod_timer(&tbl->timer_context.timer,
+	timer_mod(&tbl->timer_context.timer,
 		  jiffies + msecs_to_jiffies(min_flush_time * tbl->win_size));
 
 	tbl->timer_context.timer_is_set = true;
diff --git a/drivers/net/wireless/marvell/mwifiex/cmdevt.c b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
index 062b739db1cb..81ec92e6d1fd 100644
--- a/drivers/net/wireless/marvell/mwifiex/cmdevt.c
+++ b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
@@ -279,7 +279,7 @@ static int mwifiex_dnld_cmd_to_fw(struct mwifiex_private *priv,
 	 * command might not have command response.
 	 */
 	if (cmd_code != HostCmd_CMD_FW_DUMP_EVENT)
-		mod_timer(&adapter->cmd_timer,
+		timer_mod(&adapter->cmd_timer,
 			  jiffies + msecs_to_jiffies(MWIFIEX_TIMER_10S));
 
 	/* Clear BSS_NO_BITS from HostCmd */
diff --git a/drivers/net/wireless/marvell/mwifiex/main.c b/drivers/net/wireless/marvell/mwifiex/main.c
index 0e1f53940401..72805c9e6224 100644
--- a/drivers/net/wireless/marvell/mwifiex/main.c
+++ b/drivers/net/wireless/marvell/mwifiex/main.c
@@ -299,7 +299,7 @@ int mwifiex_main_process(struct mwifiex_adapter *adapter)
 		     !mwifiex_bypass_txlist_empty(adapter) ||
 		     !mwifiex_wmm_lists_empty(adapter))) {
 			adapter->pm_wakeup_fw_try = true;
-			mod_timer(&adapter->wakeup_timer, jiffies + (HZ*3));
+			timer_mod(&adapter->wakeup_timer, jiffies + (HZ*3));
 			adapter->if_ops.wakeup(adapter);
 			continue;
 		}
diff --git a/drivers/net/wireless/marvell/mwifiex/tdls.c b/drivers/net/wireless/marvell/mwifiex/tdls.c
index 80121401111e..32bd06b99947 100644
--- a/drivers/net/wireless/marvell/mwifiex/tdls.c
+++ b/drivers/net/wireless/marvell/mwifiex/tdls.c
@@ -1472,7 +1472,7 @@ void mwifiex_check_auto_tdls(struct timer_list *t)
 	}
 	spin_unlock_bh(&priv->auto_tdls_lock);
 
-	mod_timer(&priv->auto_tdls_timer,
+	timer_mod(&priv->auto_tdls_timer,
 		  jiffies + msecs_to_jiffies(MWIFIEX_TIMER_10S));
 }
 
@@ -1480,7 +1480,7 @@ void mwifiex_setup_auto_tdls_timer(struct mwifiex_private *priv)
 {
 	timer_setup(&priv->auto_tdls_timer, mwifiex_check_auto_tdls, 0);
 	priv->auto_tdls_timer_active = true;
-	mod_timer(&priv->auto_tdls_timer,
+	timer_mod(&priv->auto_tdls_timer,
 		  jiffies + msecs_to_jiffies(MWIFIEX_TIMER_10S));
 }
 
diff --git a/drivers/net/wireless/marvell/mwifiex/usb.c b/drivers/net/wireless/marvell/mwifiex/usb.c
index 947ecb0a7b40..8dc0c74f3ba9 100644
--- a/drivers/net/wireless/marvell/mwifiex/usb.c
+++ b/drivers/net/wireless/marvell/mwifiex/usb.c
@@ -1047,7 +1047,7 @@ static int mwifiex_usb_aggr_tx_data(struct mwifiex_adapter *adapter, u8 ep,
 					MWIFIEX_USB_TX_AGGR_TMO_MIN;
 			timeout =
 				port->tx_aggr.timer_cnxt.hold_tmo_msecs;
-			mod_timer(&port->tx_aggr.timer_cnxt.hold_timer,
+			timer_mod(&port->tx_aggr.timer_cnxt.hold_timer,
 				  jiffies + msecs_to_jiffies(timeout));
 			port->tx_aggr.timer_cnxt.is_hold_timer_set = true;
 		} else {
@@ -1056,7 +1056,7 @@ static int mwifiex_usb_aggr_tx_data(struct mwifiex_adapter *adapter, u8 ep,
 				/* Dyanmic fit timeout */
 				timeout =
 				++port->tx_aggr.timer_cnxt.hold_tmo_msecs;
-				mod_timer(&port->tx_aggr.timer_cnxt.hold_timer,
+				timer_mod(&port->tx_aggr.timer_cnxt.hold_timer,
 					  jiffies + msecs_to_jiffies(timeout));
 			}
 		}
@@ -1111,7 +1111,7 @@ static int mwifiex_usb_aggr_tx_data(struct mwifiex_adapter *adapter, u8 ep,
 			port->tx_aggr.timer_cnxt.hold_tmo_msecs =
 					MWIFIEX_USB_TX_AGGR_TMO_MIN;
 			timeout = port->tx_aggr.timer_cnxt.hold_tmo_msecs;
-			mod_timer(&port->tx_aggr.timer_cnxt.hold_timer,
+			timer_mod(&port->tx_aggr.timer_cnxt.hold_timer,
 				  jiffies + msecs_to_jiffies(timeout));
 			port->tx_aggr.timer_cnxt.is_hold_timer_set = true;
 		}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index b8fcd4eb3fbb..1e4ba8449f61 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -486,7 +486,7 @@ mt7615_mcu_roc_event(struct mt7615_dev *dev, struct sk_buff *skb)
 	wake_up(&phy->roc_wait);
 
 	duration = le32_to_cpu(event->max_interval);
-	mod_timer(&phy->roc_timer,
+	timer_mod(&phy->roc_timer,
 		  round_jiffies_up(jiffies + msecs_to_jiffies(duration)));
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 37b73be38b71..b0eaef2974bf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1491,7 +1491,7 @@ static void mt7921_channel_switch_rx_beacon(struct ieee80211_hw *hw,
 	if (cfg80211_chandef_identical(&chsw->chandef,
 				       &dev->new_ctx->def) &&
 				       chsw->count) {
-		mod_timer(&mvif->csa_timer,
+		timer_mod(&mvif->csa_timer,
 			  TU_TO_EXP_TIME(beacon_interval * chsw->count));
 	}
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 86bd33b916a9..cc085b63b4c3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -158,7 +158,7 @@ mt7921_mcu_uni_roc_event(struct mt792x_dev *dev, struct sk_buff *skb)
 	dev->phy.roc_grant = true;
 	wake_up(&dev->phy.roc_wait);
 	duration = le32_to_cpu(grant->max_interval);
-	mod_timer(&dev->phy.roc_timer,
+	timer_mod(&dev->phy.roc_timer,
 		  jiffies + msecs_to_jiffies(duration));
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index e61da76b2097..78f14e724813 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -336,7 +336,7 @@ static void mt7925_mcu_roc_handle_grant(struct mt792x_dev *dev,
 	dev->phy.roc_grant = true;
 	wake_up(&dev->phy.roc_wait);
 	duration = le32_to_cpu(grant->max_interval);
-	mod_timer(&dev->phy.roc_timer,
+	timer_mod(&dev->phy.roc_timer,
 		  jiffies + msecs_to_jiffies(duration));
 }
 
diff --git a/drivers/net/wireless/microchip/wilc1000/cfg80211.c b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
index e7aa0f991923..c6e0b804b759 100644
--- a/drivers/net/wireless/microchip/wilc1000/cfg80211.c
+++ b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
@@ -1138,7 +1138,7 @@ static int remain_on_channel(struct wiphy *wiphy,
 	priv->remain_on_ch_params.listen_duration = duration;
 
 	cfg80211_ready_on_channel(wdev, *cookie, chan, duration, GFP_KERNEL);
-	mod_timer(&vif->hif_drv->remain_on_ch_timer,
+	timer_mod(&vif->hif_drv->remain_on_ch_timer,
 		  jiffies + msecs_to_jiffies(duration + 1000));
 
 	return ret;
diff --git a/drivers/net/wireless/microchip/wilc1000/hif.c b/drivers/net/wireless/microchip/wilc1000/hif.c
index a5a2a6ef6dea..49f311a0f512 100644
--- a/drivers/net/wireless/microchip/wilc1000/hif.c
+++ b/drivers/net/wireless/microchip/wilc1000/hif.c
@@ -260,7 +260,7 @@ int wilc_scan(struct wilc_vif *vif, u8 scan_source,
 	}
 
 	hif_drv->scan_timer_vif = vif;
-	mod_timer(&hif_drv->scan_timer,
+	timer_mod(&hif_drv->scan_timer,
 		  jiffies + msecs_to_jiffies(scan_timeout));
 
 error:
@@ -1335,7 +1335,7 @@ int wilc_set_join_req(struct wilc_vif *vif, u8 *bssid, const u8 *ies,
 		goto free_ies;
 
 	hif_drv->connect_timer_vif = vif;
-	mod_timer(&hif_drv->connect_timer,
+	timer_mod(&hif_drv->connect_timer,
 		  jiffies + msecs_to_jiffies(WILC_HIF_CONNECT_TIMEOUT_MS));
 
 	return 0;
@@ -1507,7 +1507,7 @@ static void get_periodic_rssi(struct timer_list *t)
 	if (vif->hif_drv->hif_state == HOST_IF_CONNECTED)
 		wilc_get_stats_async(vif, &vif->periodic_stat);
 
-	mod_timer(&vif->periodic_rssi, jiffies + msecs_to_jiffies(5000));
+	timer_mod(&vif->periodic_rssi, jiffies + msecs_to_jiffies(5000));
 }
 
 int wilc_init(struct net_device *dev, struct host_if_drv **hif_drv_handler)
@@ -1524,7 +1524,7 @@ int wilc_init(struct net_device *dev, struct host_if_drv **hif_drv_handler)
 	vif->hif_drv = hif_drv;
 
 	timer_setup(&vif->periodic_rssi, get_periodic_rssi, 0);
-	mod_timer(&vif->periodic_rssi, jiffies + msecs_to_jiffies(5000));
+	timer_mod(&vif->periodic_rssi, jiffies + msecs_to_jiffies(5000));
 
 	timer_setup(&hif_drv->scan_timer, timer_scan_cb, 0);
 	timer_setup(&hif_drv->connect_timer, timer_connect_cb, 0);
diff --git a/drivers/net/wireless/purelifi/plfxlc/usb.c b/drivers/net/wireless/purelifi/plfxlc/usb.c
index 89e6c5dddcc5..386435d9dbf9 100644
--- a/drivers/net/wireless/purelifi/plfxlc/usb.c
+++ b/drivers/net/wireless/purelifi/plfxlc/usb.c
@@ -551,7 +551,7 @@ static void slif_data_plane_sap_timer_callb(struct timer_list *t)
 	plfxlc_send_packet_from_data_queue(usb);
 	timer_setup(&usb->tx.tx_retry_timer,
 		    slif_data_plane_sap_timer_callb, 0);
-	mod_timer(&usb->tx.tx_retry_timer, jiffies + TX_RETRY_BACKOFF_JIFF);
+	timer_mod(&usb->tx.tx_retry_timer, jiffies + TX_RETRY_BACKOFF_JIFF);
 }
 
 static void sta_queue_cleanup_timer_callb(struct timer_list *t)
@@ -572,7 +572,7 @@ static void sta_queue_cleanup_timer_callb(struct timer_list *t)
 	}
 	timer_setup(&usb->sta_queue_cleanup,
 		    sta_queue_cleanup_timer_callb, 0);
-	mod_timer(&usb->sta_queue_cleanup, jiffies + STA_QUEUE_CLEANUP_JIFF);
+	timer_mod(&usb->sta_queue_cleanup, jiffies + STA_QUEUE_CLEANUP_JIFF);
 }
 
 static int probe(struct usb_interface *intf,
diff --git a/drivers/net/wireless/realtek/rtlwifi/base.c b/drivers/net/wireless/realtek/rtlwifi/base.c
index 1b7a795841d3..d4d42983e54a 100644
--- a/drivers/net/wireless/realtek/rtlwifi/base.c
+++ b/drivers/net/wireless/realtek/rtlwifi/base.c
@@ -2225,7 +2225,7 @@ void rtl_watch_dog_timer_callback(struct timer_list *t)
 	queue_delayed_work(rtlpriv->works.rtl_wq,
 			   &rtlpriv->works.watchdog_wq, 0);
 
-	mod_timer(&rtlpriv->works.watchdog_timer,
+	timer_mod(&rtlpriv->works.watchdog_timer,
 		  jiffies + MSECS(RTL_WATCH_DOG_TIME));
 }
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c
index ef279f5005fd..20a002dd0312 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c
@@ -1676,7 +1676,7 @@ static void rtl88e_dm_fast_ant_training(struct ieee80211_hw *hw)
 		rtl_set_bbreg(hw, DM_REG_TXAGC_A_1_MCS32_11N, BIT(16), 1);
 		rtl_set_bbreg(hw, DM_REG_IGI_A_11N, BIT(7), 1);
 
-		mod_timer(&rtlpriv->works.fast_antenna_training_timer,
+		timer_mod(&rtlpriv->works.fast_antenna_training_timer,
 			  jiffies + MSECS(RTL_WATCH_DOG_TIME));
 	}
 }
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
index 516be255afcc..42f1168362e9 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
@@ -153,7 +153,7 @@ static void _rtl88ee_set_fw_clock_on(struct ieee80211_hw *hw,
 		rtlhal->fw_clk_change_in_progress = false;
 		spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 		if (schedule_timer) {
-			mod_timer(&rtlpriv->works.fw_clockoff_timer,
+			timer_mod(&rtlpriv->works.fw_clockoff_timer,
 				  jiffies + MSECS(10));
 		}
 
@@ -194,7 +194,7 @@ static void _rtl88ee_set_fw_clock_off(struct ieee80211_hw *hw,
 	}
 
 	if (schedule_timer) {
-		mod_timer(&rtlpriv->works.fw_clockoff_timer,
+		timer_mod(&rtlpriv->works.fw_clockoff_timer,
 			  jiffies + MSECS(10));
 		return;
 	}
@@ -214,7 +214,7 @@ static void _rtl88ee_set_fw_clock_off(struct ieee80211_hw *hw,
 			spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 		} else {
 			spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
-			mod_timer(&rtlpriv->works.fw_clockoff_timer,
+			timer_mod(&rtlpriv->works.fw_clockoff_timer,
 				  jiffies + MSECS(10));
 		}
 	}
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/hw.c
index d4da5cdc8414..e6184cd2cc73 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/hw.c
@@ -129,7 +129,7 @@ static void _rtl92ee_set_fw_clock_on(struct ieee80211_hw *hw,
 		rtlhal->fw_clk_change_in_progress = false;
 		spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 		if (b_schedule_timer) {
-			mod_timer(&rtlpriv->works.fw_clockoff_timer,
+			timer_mod(&rtlpriv->works.fw_clockoff_timer,
 				  jiffies + MSECS(10));
 		}
 	} else  {
@@ -169,7 +169,7 @@ static void _rtl92ee_set_fw_clock_off(struct ieee80211_hw *hw, u8 rpwm_val)
 	}
 
 	if (b_schedule_timer) {
-		mod_timer(&rtlpriv->works.fw_clockoff_timer,
+		timer_mod(&rtlpriv->works.fw_clockoff_timer,
 			  jiffies + MSECS(10));
 		return;
 	}
@@ -188,7 +188,7 @@ static void _rtl92ee_set_fw_clock_off(struct ieee80211_hw *hw, u8 rpwm_val)
 			spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 		} else {
 			spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
-			mod_timer(&rtlpriv->works.fw_clockoff_timer,
+			timer_mod(&rtlpriv->works.fw_clockoff_timer,
 				  jiffies + MSECS(10));
 		}
 	}
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c
index bcfc53af4c1a..698d613e87ee 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c
@@ -159,7 +159,7 @@ static void _rtl8723be_set_fw_clock_on(struct ieee80211_hw *hw, u8 rpwm_val,
 		rtlhal->fw_clk_change_in_progress = false;
 		spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 		if (b_schedule_timer)
-			mod_timer(&rtlpriv->works.fw_clockoff_timer,
+			timer_mod(&rtlpriv->works.fw_clockoff_timer,
 				  jiffies + MSECS(10));
 	} else  {
 		spin_lock_bh(&rtlpriv->locks.fw_ps_lock);
@@ -197,7 +197,7 @@ static void _rtl8723be_set_fw_clock_off(struct ieee80211_hw *hw, u8 rpwm_val)
 	}
 
 	if (b_schedule_timer) {
-		mod_timer(&rtlpriv->works.fw_clockoff_timer,
+		timer_mod(&rtlpriv->works.fw_clockoff_timer,
 			  jiffies + MSECS(10));
 		return;
 	}
@@ -216,7 +216,7 @@ static void _rtl8723be_set_fw_clock_off(struct ieee80211_hw *hw, u8 rpwm_val)
 			spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 		} else {
 			spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
-			mod_timer(&rtlpriv->works.fw_clockoff_timer,
+			timer_mod(&rtlpriv->works.fw_clockoff_timer,
 				  jiffies + MSECS(10));
 		}
 	}
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c
index f4b232f038a9..6bca3206ff12 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c
@@ -156,7 +156,7 @@ static void _rtl8821ae_set_fw_clock_on(struct ieee80211_hw *hw,
 		rtlhal->fw_clk_change_in_progress = false;
 		spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 		if (b_schedule_timer)
-			mod_timer(&rtlpriv->works.fw_clockoff_timer,
+			timer_mod(&rtlpriv->works.fw_clockoff_timer,
 				  jiffies + MSECS(10));
 	} else  {
 		spin_lock_bh(&rtlpriv->locks.fw_ps_lock);
@@ -195,7 +195,7 @@ static void _rtl8821ae_set_fw_clock_off(struct ieee80211_hw *hw,
 	}
 
 	if (b_schedule_timer) {
-		mod_timer(&rtlpriv->works.fw_clockoff_timer,
+		timer_mod(&rtlpriv->works.fw_clockoff_timer,
 			  jiffies + MSECS(10));
 		return;
 	}
@@ -215,7 +215,7 @@ static void _rtl8821ae_set_fw_clock_off(struct ieee80211_hw *hw,
 			spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
 		} else {
 			spin_unlock_bh(&rtlpriv->locks.fw_ps_lock);
-			mod_timer(&rtlpriv->works.fw_clockoff_timer,
+			timer_mod(&rtlpriv->works.fw_clockoff_timer,
 				  jiffies + MSECS(10));
 		}
 	}
diff --git a/drivers/net/wireless/realtek/rtw88/tx.c b/drivers/net/wireless/realtek/rtw88/tx.c
index d21bd5330a38..c5d0e39cf54a 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.c
+++ b/drivers/net/wireless/realtek/rtw88/tx.c
@@ -206,7 +206,7 @@ void rtw_tx_report_enqueue(struct rtw_dev *rtwdev, struct sk_buff *skb, u8 sn)
 	__skb_queue_tail(&tx_report->queue, skb);
 	spin_unlock_irqrestore(&tx_report->q_lock, flags);
 
-	mod_timer(&tx_report->purge_timer, jiffies + RTW_TX_PROBE_TIMEOUT);
+	timer_mod(&tx_report->purge_timer, jiffies + RTW_TX_PROBE_TIMEOUT);
 }
 EXPORT_SYMBOL(rtw_tx_report_enqueue);
 
diff --git a/drivers/net/wireless/st/cw1200/pm.c b/drivers/net/wireless/st/cw1200/pm.c
index 2002e3f9fe45..76c501f6f2dd 100644
--- a/drivers/net/wireless/st/cw1200/pm.c
+++ b/drivers/net/wireless/st/cw1200/pm.c
@@ -115,7 +115,7 @@ void cw1200_pm_stay_awake(struct cw1200_pm_state *pm,
 	spin_lock_bh(&pm->lock);
 	cur_tmo = pm->stay_awake.expires - jiffies;
 	if (!timer_pending(&pm->stay_awake) || cur_tmo < (long)tmo)
-		mod_timer(&pm->stay_awake, jiffies + tmo);
+		timer_mod(&pm->stay_awake, jiffies + tmo);
 	spin_unlock_bh(&pm->lock);
 }
 
diff --git a/drivers/net/wireless/st/cw1200/queue.c b/drivers/net/wireless/st/cw1200/queue.c
index a933e2c7dc2c..df717cef4b56 100644
--- a/drivers/net/wireless/st/cw1200/queue.c
+++ b/drivers/net/wireless/st/cw1200/queue.c
@@ -122,7 +122,7 @@ static void __cw1200_queue_gc(struct cw1200_queue *queue,
 				__cw1200_queue_unlock(queue);
 		} else if (item) {
 			unsigned long tmo = item->queue_timestamp + queue->ttl;
-			mod_timer(&queue->gc, tmo);
+			timer_mod(&queue->gc, tmo);
 			cw1200_pm_stay_awake(&stats->priv->pm_state,
 					     tmo - jiffies);
 		}
@@ -319,7 +319,7 @@ int cw1200_queue_put(struct cw1200_queue *queue,
 		    (queue->capacity - (num_present_cpus() - 1))) {
 			queue->overfull = true;
 			__cw1200_queue_lock(queue);
-			mod_timer(&queue->gc, jiffies);
+			timer_mod(&queue->gc, jiffies);
 		}
 	} else {
 		ret = -ENOENT;
diff --git a/drivers/net/wireless/st/cw1200/sta.c b/drivers/net/wireless/st/cw1200/sta.c
index e633b77a8f20..0db11c6e8007 100644
--- a/drivers/net/wireless/st/cw1200/sta.c
+++ b/drivers/net/wireless/st/cw1200/sta.c
@@ -2091,7 +2091,7 @@ void cw1200_multicast_start_work(struct work_struct *work)
 		wsm_lock_tx(priv);
 		cw1200_set_tim_impl(priv, true);
 		priv->aid0_bit_set = true;
-		mod_timer(&priv->mcast_timeout, jiffies + tmo);
+		timer_mod(&priv->mcast_timeout, jiffies + tmo);
 		wsm_unlock_tx(priv);
 	}
 }
diff --git a/drivers/net/wireless/ti/wlcore/main.c b/drivers/net/wireless/ti/wlcore/main.c
index 88cab6699d58..6e6647e039e4 100644
--- a/drivers/net/wireless/ti/wlcore/main.c
+++ b/drivers/net/wireless/ti/wlcore/main.c
@@ -150,7 +150,7 @@ static void wl1271_rx_streaming_enable_work(struct work_struct *work)
 		goto out_sleep;
 
 	/* stop it after some time of inactivity */
-	mod_timer(&wlvif->rx_streaming_timer,
+	timer_mod(&wlvif->rx_streaming_timer,
 		  jiffies + msecs_to_jiffies(wl->conf.rx_streaming.duration));
 
 out_sleep:
diff --git a/drivers/net/wireless/ti/wlcore/tx.c b/drivers/net/wireless/ti/wlcore/tx.c
index 464587d16ab2..61690088f1db 100644
--- a/drivers/net/wireless/ti/wlcore/tx.c
+++ b/drivers/net/wireless/ti/wlcore/tx.c
@@ -727,7 +727,7 @@ void wl12xx_rearm_rx_streaming(struct wl1271 *wl, unsigned long *active_hlids)
 			ieee80211_queue_work(wl->hw,
 					     &wlvif->rx_streaming_enable_work);
 
-		mod_timer(&wlvif->rx_streaming_timer,
+		timer_mod(&wlvif->rx_streaming_timer,
 			  jiffies + msecs_to_jiffies(timeout));
 	}
 }
diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 563397ba7d69..c67d22f20fc1 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -827,7 +827,7 @@ static bool tx_credit_exceeded(struct xenvif_queue *queue, unsigned size)
 
 	/* Still too big to send right now? Set a callback. */
 	if (size > queue->remaining_credit) {
-		mod_timer(&queue->credit_timeout,
+		timer_mod(&queue->credit_timeout,
 			  next_credit);
 		queue->credit_window_start = next_credit;
 		queue->rate_limited = true;
diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 01bf49bba4da..07f99fc98378 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -348,7 +348,7 @@ static void xennet_alloc_rx_buffers(struct netfront_queue *queue)
 	 */
 	if (req_prod - queue->rx.rsp_cons < NET_RX_SLOTS_MIN ||
 	    unlikely(err)) {
-		mod_timer(&queue->rx_refill_timer, jiffies + (HZ/10));
+		timer_mod(&queue->rx_refill_timer, jiffies + (HZ/10));
 		return;
 	}
 
diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
index 9992177b08b2..bd1ab574f603 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.c
+++ b/drivers/nfc/nfcmrvl/fw_dnld.c
@@ -528,7 +528,7 @@ int nfcmrvl_fw_dnld_start(struct nci_dev *ndev, const char *firmware_name)
 
 	/* Configure a timer for timeout */
 	timer_setup(&priv->fw_dnld.timer, fw_dnld_timeout, 0);
-	mod_timer(&priv->fw_dnld.timer,
+	timer_mod(&priv->fw_dnld.timer,
 		  jiffies + msecs_to_jiffies(FW_DNLD_TIMEOUT));
 
 	/* Ronfigure HI to be sure that it is the bootrom values */
diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index 14661249c690..0a51e9a8a28b 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1622,7 +1622,7 @@ static void pn533_wq_poll(struct work_struct *work)
 		return;
 
 	if (cur_mod->len == 0 && dev->poll_mod_count > 1)
-		mod_timer(&dev->listen_timer, jiffies + PN533_LISTEN_TIME * HZ);
+		timer_mod(&dev->listen_timer, jiffies + PN533_LISTEN_TIME * HZ);
 }
 
 static int pn533_start_poll(struct nfc_dev *nfc_dev,
@@ -1740,7 +1740,7 @@ static int pn533_start_poll(struct nfc_dev *nfc_dev,
 
 	/* Start listen timer */
 	if (!rc && cur_mod->len == 0 && dev->poll_mod_count > 1)
-		mod_timer(&dev->listen_timer, jiffies + PN533_LISTEN_TIME * HZ);
+		timer_mod(&dev->listen_timer, jiffies + PN533_LISTEN_TIME * HZ);
 
 	return rc;
 }
diff --git a/drivers/nfc/pn533/uart.c b/drivers/nfc/pn533/uart.c
index a081bce61c29..4110d8003e3b 100644
--- a/drivers/nfc/pn533/uart.c
+++ b/drivers/nfc/pn533/uart.c
@@ -72,7 +72,7 @@ static int pn532_uart_send_frame(struct pn533 *dev,
 	if (err < 0)
 		return err;
 
-	mod_timer(&pn532->cmd_timeout, HZ / 40 + jiffies);
+	timer_mod(&pn532->cmd_timeout, HZ / 40 + jiffies);
 	return 0;
 }
 
diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index be4808859cfa..65fac03fd64d 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -110,11 +110,11 @@ static void llt_ndlc_send_queue(struct llt_ndlc *ndlc)
 
 		/* start timer t1 for ndlc aknowledge */
 		ndlc->t1_active = true;
-		mod_timer(&ndlc->t1_timer, time_sent +
+		timer_mod(&ndlc->t1_timer, time_sent +
 			msecs_to_jiffies(NDLC_TIMER_T1));
 		/* start timer t2 for chip availability */
 		ndlc->t2_active = true;
-		mod_timer(&ndlc->t2_timer, time_sent +
+		timer_mod(&ndlc->t2_timer, time_sent +
 			msecs_to_jiffies(NDLC_TIMER_T2));
 	}
 }
@@ -172,13 +172,13 @@ static void llt_ndlc_rcv_queue(struct llt_ndlc *ndlc)
 				/* start timer t1 for ndlc aknowledge */
 				time_sent = jiffies;
 				ndlc->t1_active = true;
-				mod_timer(&ndlc->t1_timer, time_sent +
+				timer_mod(&ndlc->t1_timer, time_sent +
 					msecs_to_jiffies(NDLC_TIMER_T1));
 				break;
 			case PCB_SYNC_WAIT:
 				time_sent = jiffies;
 				ndlc->t1_active = true;
-				mod_timer(&ndlc->t1_timer, time_sent +
+				timer_mod(&ndlc->t1_timer, time_sent +
 					  msecs_to_jiffies(NDLC_TIMER_T1_WAIT));
 				break;
 			default:
diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index ff5c3d56b337..7c83f3a4ca46 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -261,7 +261,7 @@ static void st_nci_hci_admin_event_received(struct nci_dev *ndev,
 				info->se_info.se_active = false;
 				complete(&info->se_info.req_completion);
 			} else {
-				mod_timer(&info->se_info.se_active_timer,
+				timer_mod(&info->se_info.se_active_timer,
 				      jiffies +
 				      msecs_to_jiffies(ST_NCI_SE_TO_PIPES));
 			}
@@ -288,7 +288,7 @@ static int st_nci_hci_apdu_reader_event_received(struct nci_dev *ndev,
 				 skb->data, skb->len, 0);
 	break;
 	case ST_NCI_EVT_WTX_REQUEST:
-		mod_timer(&info->se_info.bwi_timer, jiffies +
+		timer_mod(&info->se_info.bwi_timer, jiffies +
 			  msecs_to_jiffies(info->se_info.wt_timeout));
 	break;
 	default:
@@ -455,7 +455,7 @@ static int st_nci_control_se(struct nci_dev *ndev, u8 se_idx,
 	if (r != NCI_STATUS_OK)
 		return r;
 
-	mod_timer(&info->se_info.se_active_timer, jiffies +
+	timer_mod(&info->se_info.se_active_timer, jiffies +
 		msecs_to_jiffies(ST_NCI_SE_TO_HOT_PLUG));
 	info->se_info.se_active = true;
 
@@ -665,7 +665,7 @@ int st_nci_se_io(struct nci_dev *ndev, u32 se_idx,
 	case ST_NCI_ESE_HOST_ID:
 		info->se_info.cb = cb;
 		info->se_info.cb_context = cb_context;
-		mod_timer(&info->se_info.bwi_timer, jiffies +
+		timer_mod(&info->se_info.bwi_timer, jiffies +
 			  msecs_to_jiffies(info->se_info.wt_timeout));
 		info->se_info.bwi_active = true;
 		return nci_hci_send_event(ndev, ST_NCI_APDU_READER_GATE,
diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index bec6f607c32c..022f40e4415a 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -868,7 +868,7 @@ static int st21nfca_admin_event_received(struct nfc_hci_dev *hdev, u8 event,
 				info->se_info.se_active = false;
 				complete(&info->se_info.req_completion);
 			} else {
-				mod_timer(&info->se_info.se_active_timer,
+				timer_mod(&info->se_info.se_active_timer,
 					jiffies +
 					msecs_to_jiffies(ST21NFCA_SE_TO_PIPES));
 			}
diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
index 0a21bc515141..30bc86e15163 100644
--- a/drivers/nfc/st21nfca/se.c
+++ b/drivers/nfc/st21nfca/se.c
@@ -122,7 +122,7 @@ static int st21nfca_hci_control_se(struct nfc_hci_dev *hdev, u32 se_idx,
 	if (r < 0)
 		return r;
 
-	mod_timer(&info->se_info.se_active_timer, jiffies +
+	timer_mod(&info->se_info.se_active_timer, jiffies +
 		msecs_to_jiffies(ST21NFCA_SE_TO_HOT_PLUG));
 	info->se_info.se_active = true;
 
@@ -229,7 +229,7 @@ int st21nfca_hci_se_io(struct nfc_hci_dev *hdev, u32 se_idx,
 	case ST21NFCA_ESE_HOST_ID:
 		info->se_info.cb = cb;
 		info->se_info.cb_context = cb_context;
-		mod_timer(&info->se_info.bwi_timer, jiffies +
+		timer_mod(&info->se_info.bwi_timer, jiffies +
 			  msecs_to_jiffies(info->se_info.wt_timeout));
 		info->se_info.bwi_active = true;
 		return nfc_hci_send_event(hdev, ST21NFCA_APDU_READER_GATE,
@@ -392,7 +392,7 @@ int st21nfca_apdu_reader_event_received(struct nfc_hci_dev *hdev,
 			skb->data, skb->len, 0);
 		break;
 	case ST21NFCA_EVT_WTX_REQUEST:
-		mod_timer(&info->se_info.bwi_timer, jiffies +
+		timer_mod(&info->se_info.bwi_timer, jiffies +
 				msecs_to_jiffies(info->se_info.wt_timeout));
 		break;
 	default:
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 7b8eaefb322d..9a0df22ad7ab 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -858,7 +858,7 @@ static int nvme_read_ana_log(struct nvme_ctrl *ctrl)
 	 * or AEN processing overhead.
 	 */
 	if (nr_change_groups)
-		mod_timer(&ctrl->anatt_timer, ctrl->anatt * HZ * 2 + jiffies);
+		timer_mod(&ctrl->anatt_timer, ctrl->anatt * HZ * 2 + jiffies);
 	else
 		timer_delete_sync(&ctrl->anatt_timer);
 out_unlock:
diff --git a/drivers/parport/ieee1284.c b/drivers/parport/ieee1284.c
index 4035010249cd..5fa5f3b7131f 100644
--- a/drivers/parport/ieee1284.c
+++ b/drivers/parport/ieee1284.c
@@ -71,7 +71,7 @@ int parport_wait_event (struct parport *port, signed long timeout)
 		return 1;
 
 	timer_setup(&port->timer, timeout_waiting_on_port, 0);
-	mod_timer(&port->timer, jiffies + timeout);
+	timer_mod(&port->timer, jiffies + timeout);
 	ret = down_interruptible (&port->physport->ieee1284.irq);
 	if (!timer_delete_sync(&port->timer) && !ret)
 		/* Timed out. */
diff --git a/drivers/pcmcia/bcm63xx_pcmcia.c b/drivers/pcmcia/bcm63xx_pcmcia.c
index d3baed444646..06279928810f 100644
--- a/drivers/pcmcia/bcm63xx_pcmcia.c
+++ b/drivers/pcmcia/bcm63xx_pcmcia.c
@@ -283,7 +283,7 @@ static void bcm63xx_pcmcia_poll(struct timer_list *t)
 	if (events)
 		pcmcia_parse_events(&skt->socket, events);
 
-	mod_timer(&skt->timer,
+	timer_mod(&skt->timer,
 		  jiffies + msecs_to_jiffies(BCM63XX_PCMCIA_POLL_RATE));
 }
 
@@ -420,7 +420,7 @@ static int bcm63xx_drv_pcmcia_probe(struct platform_device *pdev)
 		goto err;
 
 	/* start polling socket */
-	mod_timer(&skt->timer,
+	timer_mod(&skt->timer,
 		  jiffies + msecs_to_jiffies(BCM63XX_PCMCIA_POLL_RATE));
 
 	platform_set_drvdata(pdev, skt);
diff --git a/drivers/pcmcia/electra_cf.c b/drivers/pcmcia/electra_cf.c
index 2530079d38f4..56a657239fc8 100644
--- a/drivers/pcmcia/electra_cf.c
+++ b/drivers/pcmcia/electra_cf.c
@@ -77,7 +77,7 @@ static void electra_cf_timer(struct timer_list *t)
 	}
 
 	if (cf->active)
-		mod_timer(&cf->timer, jiffies + POLL_INTERVAL);
+		timer_mod(&cf->timer, jiffies + POLL_INTERVAL);
 }
 
 static irqreturn_t electra_cf_irq(int irq, void *_cf)
diff --git a/drivers/pcmcia/omap_cf.c b/drivers/pcmcia/omap_cf.c
index 1b1dff56ec7b..872f17d7143c 100644
--- a/drivers/pcmcia/omap_cf.c
+++ b/drivers/pcmcia/omap_cf.c
@@ -88,7 +88,7 @@ static void omap_cf_timer(struct timer_list *t)
 	}
 
 	if (cf->active)
-		mod_timer(&cf->timer, jiffies + POLL_INTERVAL);
+		timer_mod(&cf->timer, jiffies + POLL_INTERVAL);
 }
 
 /* This irq handler prevents "irqNNN: nobody cared" messages as drivers
@@ -278,7 +278,7 @@ static int __init omap_cf_probe(struct platform_device *pdev)
 		goto fail2;
 
 	cf->active = 1;
-	mod_timer(&cf->timer, jiffies + POLL_INTERVAL);
+	timer_mod(&cf->timer, jiffies + POLL_INTERVAL);
 	return 0;
 
 fail2:
diff --git a/drivers/pcmcia/pd6729.c b/drivers/pcmcia/pd6729.c
index 5261badcd903..a4704d94d68f 100644
--- a/drivers/pcmcia/pd6729.c
+++ b/drivers/pcmcia/pd6729.c
@@ -239,7 +239,7 @@ static void pd6729_interrupt_wrapper(struct timer_list *t)
 	struct pd6729_socket *socket = timer_container_of(socket, t, poll_timer);
 
 	pd6729_interrupt(0, (void *)socket);
-	mod_timer(&socket->poll_timer, jiffies + HZ);
+	timer_mod(&socket->poll_timer, jiffies + HZ);
 }
 
 static int pd6729_get_status(struct pcmcia_socket *sock, u_int *value)
@@ -708,7 +708,7 @@ static int pd6729_pci_probe(struct pci_dev *dev,
 	} else {
 		/* poll Card status change */
 		timer_setup(&socket->poll_timer, pd6729_interrupt_wrapper, 0);
-		mod_timer(&socket->poll_timer, jiffies + HZ);
+		timer_mod(&socket->poll_timer, jiffies + HZ);
 	}
 
 	for (i = 0; i < MAX_SOCKETS; i++) {
diff --git a/drivers/pcmcia/soc_common.c b/drivers/pcmcia/soc_common.c
index 87aa3f667117..e27c79002484 100644
--- a/drivers/pcmcia/soc_common.c
+++ b/drivers/pcmcia/soc_common.c
@@ -463,7 +463,7 @@ static void soc_common_pcmcia_poll_event(struct timer_list *t)
 	struct soc_pcmcia_socket *skt = timer_container_of(skt, t, poll_timer);
 	debug(skt, 4, "polling for events\n");
 
-	mod_timer(&skt->poll_timer, jiffies + SOC_PCMCIA_POLL_PERIOD);
+	timer_mod(&skt->poll_timer, jiffies + SOC_PCMCIA_POLL_PERIOD);
 
 	soc_common_check_status(skt);
 }
diff --git a/drivers/pcmcia/yenta_socket.c b/drivers/pcmcia/yenta_socket.c
index f0145938cae2..e7d9b1edf505 100644
--- a/drivers/pcmcia/yenta_socket.c
+++ b/drivers/pcmcia/yenta_socket.c
@@ -1249,7 +1249,7 @@ static int yenta_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		/* No IRQ or request_irq failed. Poll */
 		socket->cb_irq = 0; /* But zero is a valid IRQ number. */
 		timer_setup(&socket->poll_timer, yenta_interrupt_wrapper, 0);
-		mod_timer(&socket->poll_timer, jiffies + HZ);
+		timer_mod(&socket->poll_timer, jiffies + HZ);
 		dev_info(&dev->dev,
 			 "no PCI IRQ, CardBus support disabled for this socket.\n");
 		dev_info(&dev->dev,
diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index aae99adb29eb..6c3cb2e58a57 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -446,7 +446,7 @@ static void mlxbf_tmfifo_timer(struct timer_list *t)
 	if (rx || tx)
 		schedule_work(&fifo->work);
 
-	mod_timer(&fifo->timer, jiffies + MLXBF_TMFIFO_TIMER_INTERVAL);
+	timer_mod(&fifo->timer, jiffies + MLXBF_TMFIFO_TIMER_INTERVAL);
 }
 
 /* Copy one console packet into the output buffer. */
@@ -1417,7 +1417,7 @@ static int mlxbf_tmfifo_probe(struct platform_device *pdev)
 	if (rc)
 		goto fail;
 
-	mod_timer(&fifo->timer, jiffies + MLXBF_TMFIFO_TIMER_INTERVAL);
+	timer_mod(&fifo->timer, jiffies + MLXBF_TMFIFO_TIMER_INTERVAL);
 
 	/* Make all updates visible before setting the 'is_ready' flag. */
 	virtio_mb(false);
diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 84d7ea34481d..a4e7af419386 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1099,7 +1099,7 @@ static int ips_monitor(void *data)
 		expire = jiffies + msecs_to_jiffies(IPS_SAMPLE_PERIOD);
 
 		__set_current_state(TASK_INTERRUPTIBLE);
-		mod_timer(&ips->timer, expire);
+		timer_mod(&ips->timer, expire);
 		schedule();
 
 		/* Calculate actual sample period for power averaging */
diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index b52390fbd743..040798920189 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -364,7 +364,7 @@ static void do_sony_laptop_release_key(struct timer_list *unused)
 
 	/* If there is something in the fifo schedule next release. */
 	if (kfifo_len(&sony_laptop_input.fifo) != 0)
-		mod_timer(&sony_laptop_input.release_key_timer,
+		timer_mod(&sony_laptop_input.release_key_timer,
 			  jiffies + msecs_to_jiffies(10));
 
 	spin_unlock_irqrestore(&sony_laptop_input.fifo_lock, flags);
@@ -430,7 +430,7 @@ static void sony_laptop_report_input_event(u8 event)
 		kfifo_in_locked(&sony_laptop_input.fifo,
 				(unsigned char *)&kp, sizeof(kp),
 				&sony_laptop_input.fifo_lock);
-		mod_timer(&sony_laptop_input.release_key_timer,
+		timer_mod(&sony_laptop_input.release_key_timer,
 			  jiffies + msecs_to_jiffies(10));
 	} else
 		dprintk("unknown input event %.2x\n", event);
diff --git a/drivers/pps/clients/pps-ktimer.c b/drivers/pps/clients/pps-ktimer.c
index 121bd29d863d..88561c48f1ea 100644
--- a/drivers/pps/clients/pps-ktimer.c
+++ b/drivers/pps/clients/pps-ktimer.c
@@ -34,7 +34,7 @@ static void pps_ktimer_event(struct timer_list *unused)
 
 	pps_event(pps, &ts, PPS_CAPTUREASSERT, NULL);
 
-	mod_timer(&ktimer, jiffies + HZ);
+	timer_mod(&ktimer, jiffies + HZ);
 }
 
 /*
@@ -72,7 +72,7 @@ static int __init pps_ktimer_init(void)
 	}
 
 	timer_setup(&ktimer, pps_ktimer_event, 0);
-	mod_timer(&ktimer, jiffies + HZ);
+	timer_mod(&ktimer, jiffies + HZ);
 
 	dev_dbg(&pps->dev, "ktimer PPS source registered\n");
 
diff --git a/drivers/pps/generators/pps_gen-dummy.c b/drivers/pps/generators/pps_gen-dummy.c
index 547fa7fe29f4..1133748ae779 100644
--- a/drivers/pps/generators/pps_gen-dummy.c
+++ b/drivers/pps/generators/pps_gen-dummy.c
@@ -50,7 +50,7 @@ static int pps_gen_dummy_get_time(struct pps_gen_device *pps_gen,
 static int pps_gen_dummy_enable(struct pps_gen_device *pps_gen, bool enable)
 {
 	if (enable)
-		mod_timer(&ktimer, jiffies + get_random_delay());
+		timer_mod(&ktimer, jiffies + get_random_delay());
 	else
 		timer_delete_sync(&ktimer);
 
diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index eed47dcaa3de..99ede52de4fc 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1552,7 +1552,7 @@ ptp_ocp_watchdog(struct timer_list *t)
 			ptp_ocp_utc_distribute(bp, utc_offset);
 	}
 
-	mod_timer(&bp->watchdog, jiffies + HZ);
+	timer_mod(&bp->watchdog, jiffies + HZ);
 }
 
 static void
@@ -1614,7 +1614,7 @@ ptp_ocp_init_clock(struct ptp_ocp *bp, struct ptp_ocp_servo_conf *servo_conf)
 	/* If there is a clock supervisor, then enable the watchdog */
 	if (bp->pps_to_clk) {
 		timer_setup(&bp->watchdog, ptp_ocp_watchdog, 0);
-		mod_timer(&bp->watchdog, jiffies + HZ);
+		timer_mod(&bp->watchdog, jiffies + HZ);
 	}
 
 	return 0;
diff --git a/drivers/s390/block/dasd.c b/drivers/s390/block/dasd.c
index b16efecfde4b..59b364804725 100644
--- a/drivers/s390/block/dasd.c
+++ b/drivers/s390/block/dasd.c
@@ -1509,7 +1509,7 @@ void dasd_device_set_timer(struct dasd_device *device, int expires)
 	if (expires == 0)
 		timer_delete(&device->timer);
 	else
-		mod_timer(&device->timer, jiffies + expires);
+		timer_mod(&device->timer, jiffies + expires);
 }
 EXPORT_SYMBOL(dasd_device_set_timer);
 
@@ -2694,7 +2694,7 @@ void dasd_block_set_timer(struct dasd_block *block, int expires)
 	if (expires == 0)
 		timer_delete(&block->timer);
 	else
-		mod_timer(&block->timer, jiffies + expires);
+		timer_mod(&block->timer, jiffies + expires);
 }
 EXPORT_SYMBOL(dasd_block_set_timer);
 
diff --git a/drivers/s390/char/con3270.c b/drivers/s390/char/con3270.c
index 78893459c59c..be1ecb2b3ab5 100644
--- a/drivers/s390/char/con3270.c
+++ b/drivers/s390/char/con3270.c
@@ -140,7 +140,7 @@ struct tty3270 {
  */
 static void tty3270_set_timer(struct tty3270 *tp, int expires)
 {
-	mod_timer(&tp->timer, jiffies + expires);
+	timer_mod(&tp->timer, jiffies + expires);
 }
 
 static int tty3270_tty_rows(struct tty3270 *tp)
diff --git a/drivers/s390/char/sclp.c b/drivers/s390/char/sclp.c
index f50a28ee6451..f85d6edb64cd 100644
--- a/drivers/s390/char/sclp.c
+++ b/drivers/s390/char/sclp.c
@@ -374,7 +374,7 @@ static void sclp_req_queue_timeout(struct timer_list *unused)
 	spin_lock_irqsave(&sclp_lock, flags);
 	expires_next = __sclp_req_queue_find_next_timeout();
 	if (expires_next)
-		mod_timer(&sclp_queue_timer, expires_next);
+		timer_mod(&sclp_queue_timer, expires_next);
 	spin_unlock_irqrestore(&sclp_lock, flags);
 }
 
@@ -506,7 +506,7 @@ sclp_add_request(struct sclp_req *req)
 		req->queue_expires = jiffies + req->queue_timeout * HZ;
 		if (!timer_pending(&sclp_queue_timer) ||
 		    time_after(sclp_queue_timer.expires, req->queue_expires))
-			mod_timer(&sclp_queue_timer, req->queue_expires);
+			timer_mod(&sclp_queue_timer, req->queue_expires);
 	} else
 		req->queue_expires = 0;
 	/* Start if request is first in list */
diff --git a/drivers/s390/char/sclp_con.c b/drivers/s390/char/sclp_con.c
index d8544c485808..bc4d80a37cc8 100644
--- a/drivers/s390/char/sclp_con.c
+++ b/drivers/s390/char/sclp_con.c
@@ -207,7 +207,7 @@ sclp_console_write(struct console *console, const char *message,
 	/* Setup timer to output current console buffer after 1/10 second */
 	if (sclp_conbuf != NULL && sclp_chars_in_buffer(sclp_conbuf) != 0 &&
 	    !timer_pending(&sclp_con_timer)) {
-		mod_timer(&sclp_con_timer, jiffies + HZ / 10);
+		timer_mod(&sclp_con_timer, jiffies + HZ / 10);
 	}
 	spin_unlock_irqrestore(&sclp_con_lock, flags);
 }
diff --git a/drivers/s390/char/sclp_tty.c b/drivers/s390/char/sclp_tty.c
index 0a92d08830e7..2198294a59d6 100644
--- a/drivers/s390/char/sclp_tty.c
+++ b/drivers/s390/char/sclp_tty.c
@@ -217,7 +217,7 @@ static int sclp_tty_write_string(const u8 *str, int count, int may_fail)
 	/* Setup timer to output current console buffer after 1/10 second */
 	if (sclp_ttybuf && sclp_chars_in_buffer(sclp_ttybuf) &&
 	    !timer_pending(&sclp_tty_timer)) {
-		mod_timer(&sclp_tty_timer, jiffies + HZ / 10);
+		timer_mod(&sclp_tty_timer, jiffies + HZ / 10);
 	}
 	spin_unlock_irqrestore(&sclp_tty_lock, flags);
 out:
diff --git a/drivers/s390/char/tape_std.c b/drivers/s390/char/tape_std.c
index ef5d34168a01..f4371e0a125b 100644
--- a/drivers/s390/char/tape_std.c
+++ b/drivers/s390/char/tape_std.c
@@ -69,7 +69,7 @@ tape_std_assign(struct tape_device *device)
 	 * So we set up a timeout for this call.
 	 */
 	timer_setup(&request->timer, tape_std_assign_timeout, 0);
-	mod_timer(&request->timer, jiffies + msecs_to_jiffies(2000));
+	timer_mod(&request->timer, jiffies + msecs_to_jiffies(2000));
 
 	rc = tape_do_io_interruptible(device, request);
 
diff --git a/drivers/s390/cio/device.c b/drivers/s390/cio/device.c
index fb2c07cb4d3d..62cdd7b087f8 100644
--- a/drivers/s390/cio/device.c
+++ b/drivers/s390/cio/device.c
@@ -1284,7 +1284,7 @@ static void recovery_work_func(struct work_struct *unused)
 		if (!timer_pending(&recovery_timer)) {
 			if (recovery_phase < ARRAY_SIZE(recovery_delay) - 1)
 				recovery_phase++;
-			mod_timer(&recovery_timer, jiffies +
+			timer_mod(&recovery_timer, jiffies +
 				  recovery_delay[recovery_phase] * HZ);
 		}
 		spin_unlock_irq(&recovery_lock);
@@ -1311,7 +1311,7 @@ void ccw_device_schedule_recovery(void)
 	spin_lock_irqsave(&recovery_lock, flags);
 	if (!timer_pending(&recovery_timer) || (recovery_phase != 0)) {
 		recovery_phase = 0;
-		mod_timer(&recovery_timer, jiffies + recovery_delay[0] * HZ);
+		timer_mod(&recovery_timer, jiffies + recovery_delay[0] * HZ);
 	}
 	spin_unlock_irqrestore(&recovery_lock, flags);
 }
diff --git a/drivers/s390/cio/device_fsm.c b/drivers/s390/cio/device_fsm.c
index e849d3271b0e..e29ddd74504f 100644
--- a/drivers/s390/cio/device_fsm.c
+++ b/drivers/s390/cio/device_fsm.c
@@ -117,7 +117,7 @@ ccw_device_set_timeout(struct ccw_device *cdev, int expires)
 	if (expires == 0)
 		timer_delete(&cdev->private->timer);
 	else
-		mod_timer(&cdev->private->timer, jiffies + expires);
+		timer_mod(&cdev->private->timer, jiffies + expires);
 }
 
 int
diff --git a/drivers/s390/cio/eadm_sch.c b/drivers/s390/cio/eadm_sch.c
index 37ea30be710c..c8889294773b 100644
--- a/drivers/s390/cio/eadm_sch.c
+++ b/drivers/s390/cio/eadm_sch.c
@@ -116,7 +116,7 @@ static void eadm_subchannel_set_timeout(struct subchannel *sch, int expires)
 	if (expires == 0)
 		timer_delete(&private->timer);
 	else
-		mod_timer(&private->timer, jiffies + expires);
+		timer_mod(&private->timer, jiffies + expires);
 }
 
 static void eadm_subchannel_irq(struct subchannel *sch)
diff --git a/drivers/s390/crypto/ap_bus.c b/drivers/s390/crypto/ap_bus.c
index 09b9fe81b070..0dc43c4a1dfc 100644
--- a/drivers/s390/crypto/ap_bus.c
+++ b/drivers/s390/crypto/ap_bus.c
@@ -1288,7 +1288,7 @@ static ssize_t config_time_store(const struct bus_type *bus,
 	if (sscanf(buf, "%d\n", &time) != 1 || time < 5 || time > 120)
 		return -EINVAL;
 	ap_scan_bus_time = time;
-	mod_timer(&ap_scan_bus_timer, jiffies + ap_scan_bus_time * HZ);
+	timer_mod(&ap_scan_bus_timer, jiffies + ap_scan_bus_time * HZ);
 	return count;
 }
 
@@ -2262,7 +2262,7 @@ static bool ap_scan_bus(void)
 
 	ap_check_bindings_complete();
 
-	mod_timer(&ap_scan_bus_timer, jiffies + ap_scan_bus_time * HZ);
+	timer_mod(&ap_scan_bus_timer, jiffies + ap_scan_bus_time * HZ);
 
 	pr_debug("< config_changed=%d\n", config_changed);
 
diff --git a/drivers/s390/crypto/ap_queue.c b/drivers/s390/crypto/ap_queue.c
index 4088fda07197..f70ad97ea5e6 100644
--- a/drivers/s390/crypto/ap_queue.c
+++ b/drivers/s390/crypto/ap_queue.c
@@ -147,7 +147,7 @@ static struct ap_queue_status ap_sm_recv(struct ap_queue *aq)
 		if (!status.queue_empty && !aq->queue_count)
 			aq->queue_count++;
 		if (aq->queue_count > 0)
-			mod_timer(&aq->timeout,
+			timer_mod(&aq->timeout,
 				  jiffies + aq->request_timeout);
 		list_for_each_entry(ap_msg, &aq->pendingq, list) {
 			if (ap_msg->psmid != aq->reply->psmid)
@@ -264,7 +264,7 @@ static enum ap_sm_wait ap_sm_write(struct ap_queue *aq)
 	case AP_RESPONSE_NORMAL:
 		aq->queue_count = max_t(int, 1, aq->queue_count + 1);
 		if (aq->queue_count == 1)
-			mod_timer(&aq->timeout, jiffies + aq->request_timeout);
+			timer_mod(&aq->timeout, jiffies + aq->request_timeout);
 		list_move_tail(&ap_msg->list, &aq->pendingq);
 		aq->requestq_count--;
 		aq->pendingq_count++;
diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index 154d971e5b50..48ce4ba44bc7 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -4022,7 +4022,7 @@ static void arcmsr_set_iop_datetime(struct timer_list *t)
 		next_time = ARCMSR_HOURS;
 	else
 		next_time = ARCMSR_MINUTES;
-	mod_timer(&pacb->refresh_timer, jiffies + msecs_to_jiffies(next_time));
+	timer_mod(&pacb->refresh_timer, jiffies + msecs_to_jiffies(next_time));
 }
 
 static int arcmsr_iop_confirm(struct AdapterControlBlock *acb)
@@ -4265,7 +4265,7 @@ static void arcmsr_request_device_map(struct timer_list *t)
 {
 	struct AdapterControlBlock *acb = timer_container_of(acb, t, eternal_timer);
 	if (acb->acb_flags & (ACB_F_MSG_GET_CONFIG | ACB_F_BUS_RESET | ACB_F_ABORT)) {
-		mod_timer(&acb->eternal_timer, jiffies + msecs_to_jiffies(6 * HZ));
+		timer_mod(&acb->eternal_timer, jiffies + msecs_to_jiffies(6 * HZ));
 	} else {
 		acb->fw_flag = FW_NORMAL;
 		switch (acb->adapter_type) {
@@ -4314,7 +4314,7 @@ static void arcmsr_request_device_map(struct timer_list *t)
 		}
 		acb->acb_flags |= ACB_F_MSG_GET_CONFIG;
 nxt6s:
-		mod_timer(&acb->eternal_timer, jiffies + msecs_to_jiffies(6 * HZ));
+		timer_mod(&acb->eternal_timer, jiffies + msecs_to_jiffies(6 * HZ));
 	}
 }
 
@@ -4704,7 +4704,7 @@ static int arcmsr_bus_reset(struct scsi_cmnd *cmd)
 		}
 		arcmsr_iop_init(acb);
 		acb->fw_flag = FW_NORMAL;
-		mod_timer(&acb->eternal_timer, jiffies +
+		timer_mod(&acb->eternal_timer, jiffies +
 			msecs_to_jiffies(6 * HZ));
 		acb->acb_flags &= ~ACB_F_BUS_RESET;
 		rtn = SUCCESS;
@@ -4712,7 +4712,7 @@ static int arcmsr_bus_reset(struct scsi_cmnd *cmd)
 	} else {
 		acb->acb_flags &= ~ACB_F_BUS_RESET;
 		acb->fw_flag = FW_NORMAL;
-		mod_timer(&acb->eternal_timer, jiffies +
+		timer_mod(&acb->eternal_timer, jiffies +
 			msecs_to_jiffies(6 * HZ));
 		rtn = SUCCESS;
 	}
diff --git a/drivers/scsi/arm/fas216.c b/drivers/scsi/arm/fas216.c
index b1a749ab18f8..9e535ff23153 100644
--- a/drivers/scsi/arm/fas216.c
+++ b/drivers/scsi/arm/fas216.c
@@ -2524,7 +2524,7 @@ int fas216_eh_device_reset(struct scsi_cmnd *SCpnt)
 		if (info->scsi.phase == PHASE_IDLE)
 			fas216_kick(info);
 
-		mod_timer(&info->eh_timer, jiffies + 30 * HZ);
+		timer_mod(&info->eh_timer, jiffies + 30 * HZ);
 		spin_unlock_irqrestore(&info->host_lock, flags);
 
 		/*
@@ -2615,7 +2615,7 @@ int fas216_eh_bus_reset(struct scsi_cmnd *SCpnt)
 	 */
 	fas216_cmd(info, CMD_RESETSCSI);
 
-	mod_timer(&info->eh_timer, jiffies + HZ);
+	timer_mod(&info->eh_timer, jiffies + HZ);
 	spin_unlock_irqrestore(&info->host_lock, flags);
 
 	/*
diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
index dc88bc46dcc0..df0110fe2b86 100644
--- a/drivers/scsi/be2iscsi/be_main.c
+++ b/drivers/scsi/be2iscsi/be_main.c
@@ -5273,7 +5273,7 @@ static void beiscsi_hw_health_check(struct timer_list *t)
 		phba->hw_check.function = beiscsi_hw_tpe_check;
 	}
 
-	mod_timer(&phba->hw_check,
+	timer_mod(&phba->hw_check,
 		  jiffies + msecs_to_jiffies(BEISCSI_UE_DETECT_INTERVAL));
 }
 
@@ -5359,7 +5359,7 @@ static int beiscsi_enable_port(struct beiscsi_hba *phba)
 	 * Always reinit to do health check first.
 	 */
 	phba->hw_check.function = beiscsi_hw_health_check;
-	mod_timer(&phba->hw_check,
+	timer_mod(&phba->hw_check,
 		  jiffies + msecs_to_jiffies(BEISCSI_UE_DETECT_INTERVAL));
 	return 0;
 
@@ -5699,7 +5699,7 @@ static int beiscsi_dev_probe(struct pci_dev *pcidev,
 	 * and eventually fail the probe.
 	 */
 	timer_setup(&phba->hw_check, beiscsi_hw_health_check, 0);
-	mod_timer(&phba->hw_check,
+	timer_mod(&phba->hw_check,
 		  jiffies + msecs_to_jiffies(BEISCSI_UE_DETECT_INTERVAL));
 	beiscsi_log(phba, KERN_INFO, BEISCSI_LOG_INIT,
 		    "\n\n\n BM_%d : SUCCESS - DRIVER LOADED\n\n\n");
diff --git a/drivers/scsi/bfa/bfad.c b/drivers/scsi/bfa/bfad.c
index 0768f086451b..ff66f21c0ff7 100644
--- a/drivers/scsi/bfa/bfad.c
+++ b/drivers/scsi/bfa/bfad.c
@@ -703,7 +703,7 @@ bfad_bfa_tmo(struct timer_list *t)
 		spin_unlock_irqrestore(&bfad->bfad_lock, flags);
 	}
 
-	mod_timer(&bfad->hal_tmo,
+	timer_mod(&bfad->hal_tmo,
 		  jiffies + msecs_to_jiffies(BFA_TIMER_FREQ));
 }
 
@@ -712,7 +712,7 @@ bfad_init_timer(struct bfad_s *bfad)
 {
 	timer_setup(&bfad->hal_tmo, bfad_bfa_tmo, 0);
 
-	mod_timer(&bfad->hal_tmo,
+	timer_mod(&bfad->hal_tmo,
 		  jiffies + msecs_to_jiffies(BFA_TIMER_FREQ));
 }
 
diff --git a/drivers/scsi/bnx2fc/bnx2fc_tgt.c b/drivers/scsi/bnx2fc/bnx2fc_tgt.c
index 77dcdfc412b1..429d4f350766 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_tgt.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_tgt.c
@@ -66,7 +66,7 @@ static void bnx2fc_ofld_timer(struct timer_list *t)
 static void bnx2fc_ofld_wait(struct bnx2fc_rport *tgt)
 {
 	timer_setup(&tgt->ofld_timer, bnx2fc_ofld_timer, 0);
-	mod_timer(&tgt->ofld_timer, jiffies + BNX2FC_FW_TIMEOUT);
+	timer_mod(&tgt->ofld_timer, jiffies + BNX2FC_FW_TIMEOUT);
 
 	wait_event_interruptible(tgt->ofld_wait,
 				 (test_bit(
@@ -276,7 +276,7 @@ void bnx2fc_flush_active_ios(struct bnx2fc_rport *tgt)
 static void bnx2fc_upld_wait(struct bnx2fc_rport *tgt)
 {
 	timer_setup(&tgt->upld_timer, bnx2fc_upld_timer, 0);
-	mod_timer(&tgt->upld_timer, jiffies + BNX2FC_FW_TIMEOUT);
+	timer_mod(&tgt->upld_timer, jiffies + BNX2FC_FW_TIMEOUT);
 	wait_event_interruptible(tgt->upld_wait,
 				 (test_bit(
 				  BNX2FC_FLAG_UPLD_REQ_COMPL,
diff --git a/drivers/scsi/csiostor/csio_hw.c b/drivers/scsi/csiostor/csio_hw.c
index 7aa418ebfe01..131277419aab 100644
--- a/drivers/scsi/csiostor/csio_hw.c
+++ b/drivers/scsi/csiostor/csio_hw.c
@@ -4135,7 +4135,7 @@ csio_mgmt_tmo_handler(struct timer_list *t)
 
 	/* If retry queue is not empty, re-arm timer */
 	if (!list_empty(&mgmtm->active_q))
-		mod_timer(&mgmtm->mgmt_timer,
+		timer_mod(&mgmtm->mgmt_timer,
 			  jiffies + msecs_to_jiffies(ECM_MIN_TMO));
 	spin_unlock_irq(&mgmtm->hw->lock);
 }
diff --git a/drivers/scsi/csiostor/csio_mb.c b/drivers/scsi/csiostor/csio_mb.c
index c7b4c464f6b8..b8dd7a38e389 100644
--- a/drivers/scsi/csiostor/csio_mb.c
+++ b/drivers/scsi/csiostor/csio_mb.c
@@ -1276,7 +1276,7 @@ csio_mb_issue(struct csio_hw *hw, struct csio_mb *mbp)
 	/* Start completion timers in non-immediate modes and notify FW */
 	if (mbp->mb_cbfn != NULL) {
 		mbm->mcurrent = mbp;
-		mod_timer(&mbm->timer, jiffies + msecs_to_jiffies(mbp->tmo));
+		timer_mod(&mbm->timer, jiffies + msecs_to_jiffies(mbp->tmo));
 		csio_wr_reg32(hw, MBMSGVALID_F | MBINTREQ_F |
 			      MBOWNER_V(CSIO_MBOWNER_FW), ctl_reg);
 	} else
diff --git a/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c b/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
index 69de9657f7cb..43cc6e22daa3 100644
--- a/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
+++ b/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
@@ -588,7 +588,7 @@ static int do_act_open_rpl(struct t3cdev *tdev, struct sk_buff *skb, void *ctx)
 	if (rpl->status == CPL_ERR_CONN_EXIST &&
 	    csk->retry_timer.function != act_open_retry_timer) {
 		csk->retry_timer.function = act_open_retry_timer;
-		mod_timer(&csk->retry_timer, jiffies + HZ / 2);
+		timer_mod(&csk->retry_timer, jiffies + HZ / 2);
 	} else
 		cxgbi_sock_fail_act_open(csk,
 				act_open_rpl_status_to_errno(rpl->status));
diff --git a/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c b/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c
index 42676627c3af..f5a27d130d77 100644
--- a/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c
+++ b/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c
@@ -1078,7 +1078,7 @@ static void do_act_open_rpl(struct cxgbi_device *cdev, struct sk_buff *skb)
 	if (status == CPL_ERR_CONN_EXIST &&
 	    csk->retry_timer.function != csk_act_open_retry_timer) {
 		csk->retry_timer.function = csk_act_open_retry_timer;
-		mod_timer(&csk->retry_timer, jiffies + HZ / 2);
+		timer_mod(&csk->retry_timer, jiffies + HZ / 2);
 	} else
 		cxgbi_sock_fail_act_open(csk,
 					act_open_rpl_status_to_errno(status));
diff --git a/drivers/scsi/elx/efct/efct_xport.c b/drivers/scsi/elx/efct/efct_xport.c
index dfe05fab7b42..247bfc19f439 100644
--- a/drivers/scsi/elx/efct/efct_xport.c
+++ b/drivers/scsi/elx/efct/efct_xport.c
@@ -206,7 +206,7 @@ efct_xport_config_stats_timer(struct efct *efct)
 
 	timer_setup(&xport->stats_timer,
 		    &efct_xport_stats_timer_cb, 0);
-	mod_timer(&xport->stats_timer,
+	timer_mod(&xport->stats_timer,
 		  jiffies + msecs_to_jiffies(timeout));
 }
 
diff --git a/drivers/scsi/elx/libefc/efc_els.c b/drivers/scsi/elx/libefc/efc_els.c
index 1786cee08729..db2a1ce3df40 100644
--- a/drivers/scsi/elx/libefc/efc_els.c
+++ b/drivers/scsi/elx/libefc/efc_els.c
@@ -209,7 +209,7 @@ efc_els_req_cb(void *arg, u32 length, int status, u32 ext_status)
 				      "LS_RJT Logical Busy, delay and retry\n");
 			timer_setup(&els->delay_timer,
 				    efc_els_delay_timer_cb, 0);
-			mod_timer(&els->delay_timer,
+			timer_mod(&els->delay_timer,
 				  jiffies + msecs_to_jiffies(5000));
 			break;
 		default:
diff --git a/drivers/scsi/elx/libefc/efc_fabric.c b/drivers/scsi/elx/libefc/efc_fabric.c
index 4ed9f46ded65..0599bce2475b 100644
--- a/drivers/scsi/elx/libefc/efc_fabric.c
+++ b/drivers/scsi/elx/libefc/efc_fabric.c
@@ -920,7 +920,7 @@ __efc_ns_gidpt_delay(struct efc_sm_ctx *ctx,
 
 		timer_setup(&node->gidpt_delay_timer, &gidpt_delay_timer_cb,
 			    0);
-		mod_timer(&node->gidpt_delay_timer,
+		timer_mod(&node->gidpt_delay_timer,
 			  jiffies + msecs_to_jiffies(delay_msec));
 
 		break;
diff --git a/drivers/scsi/fcoe/fcoe_ctlr.c b/drivers/scsi/fcoe/fcoe_ctlr.c
index 8e4241c295e3..a88c16cc5fb2 100644
--- a/drivers/scsi/fcoe/fcoe_ctlr.c
+++ b/drivers/scsi/fcoe/fcoe_ctlr.c
@@ -1072,7 +1072,7 @@ static void fcoe_ctlr_recv_adv(struct fcoe_ctlr *fip, struct sk_buff *skb)
 			fip->ctlr_ka_time -= fcf->fka_period;
 			fip->ctlr_ka_time += new.fka_period;
 			if (time_before(fip->ctlr_ka_time, fip->timer.expires))
-				mod_timer(&fip->timer, fip->ctlr_ka_time);
+				timer_mod(&fip->timer, fip->ctlr_ka_time);
 		}
 		fcf->fka_period = new.fka_period;
 		memcpy(fcf->fcf_mac, new.fcf_mac, ETH_ALEN);
@@ -1119,7 +1119,7 @@ static void fcoe_ctlr_recv_adv(struct fcoe_ctlr *fip, struct sk_buff *skb)
 			msecs_to_jiffies(FCOE_CTLR_START_DELAY);
 		if (!timer_pending(&fip->timer) ||
 		    time_before(fip->sel_time, fip->timer.expires))
-			mod_timer(&fip->timer, fip->sel_time);
+			timer_mod(&fip->timer, fip->sel_time);
 	}
 
 out:
@@ -1650,7 +1650,7 @@ static struct fcoe_fcf *fcoe_ctlr_select(struct fcoe_ctlr *fip)
 			msecs_to_jiffies(FIP_VN_KA_PERIOD);
 		fip->ctlr_ka_time = jiffies + best->fka_period;
 		if (time_before(fip->ctlr_ka_time, fip->timer.expires))
-			mod_timer(&fip->timer, fip->ctlr_ka_time);
+			timer_mod(&fip->timer, fip->ctlr_ka_time);
 	}
 	return best;
 }
@@ -1840,7 +1840,7 @@ static void fcoe_ctlr_timer_work(struct work_struct *work)
 			next_timer = fip->port_ka_time;
 	}
 	if (!list_empty(&fip->fcfs))
-		mod_timer(&fip->timer, next_timer);
+		timer_mod(&fip->timer, next_timer);
 	mutex_unlock(&fip->ctlr_mutex);
 
 	if (reset) {
@@ -2236,7 +2236,7 @@ static void fcoe_ctlr_vn_restart(struct fcoe_ctlr *fip)
 		wait = get_random_u32_below(FIP_VN_PROBE_WAIT);
 	} else
 		wait = FIP_VN_RLIM_INT;
-	mod_timer(&fip->timer, jiffies + msecs_to_jiffies(wait));
+	timer_mod(&fip->timer, jiffies + msecs_to_jiffies(wait));
 	fcoe_ctlr_set_state(fip, FIP_ST_VNMP_START);
 }
 
@@ -3136,7 +3136,7 @@ static void fcoe_ctlr_vn_timeout(struct fcoe_ctlr *fip)
 		WARN(1, "unexpected state %d\n", fip->state);
 		goto unlock;
 	}
-	mod_timer(&fip->timer, next_time);
+	timer_mod(&fip->timer, next_time);
 unlock:
 	mutex_unlock(&fip->ctlr_mutex);
 
diff --git a/drivers/scsi/fcoe/fcoe_transport.c b/drivers/scsi/fcoe/fcoe_transport.c
index 2f478426f16e..dd964b0d6e50 100644
--- a/drivers/scsi/fcoe/fcoe_transport.c
+++ b/drivers/scsi/fcoe/fcoe_transport.c
@@ -430,7 +430,7 @@ void fcoe_check_wait_queue(struct fc_lport *lport, struct sk_buff *skb)
 	if (port->fcoe_pending_queue.qlen < port->min_queue_depth)
 		lport->qfull = 0;
 	if (port->fcoe_pending_queue.qlen && !timer_pending(&port->timer))
-		mod_timer(&port->timer, jiffies + 2);
+		timer_mod(&port->timer, jiffies + 2);
 	port->fcoe_pending_queue_active = 0;
 out:
 	if (port->fcoe_pending_queue.qlen > port->max_queue_depth)
diff --git a/drivers/scsi/fnic/fdls_disc.c b/drivers/scsi/fnic/fdls_disc.c
index ab5c0cf142ee..51f74255121c 100644
--- a/drivers/scsi/fnic/fdls_disc.c
+++ b/drivers/scsi/fnic/fdls_disc.c
@@ -427,7 +427,7 @@ fdls_start_fabric_timer(struct fnic_iport_s *iport, int timeout)
 		iport->fabric.retry_counter++;
 
 	fabric_tov = jiffies + msecs_to_jiffies(timeout);
-	mod_timer(&iport->fabric.retry_timer, round_jiffies(fabric_tov));
+	timer_mod(&iport->fabric.retry_timer, round_jiffies(fabric_tov));
 	iport->fabric.timer_pending = 1;
 	FNIC_FCS_DBG(KERN_INFO, fnic->host, fnic->fnic_num,
 				 "fabric timer is %d ", timeout);
@@ -452,7 +452,7 @@ fdls_start_tport_timer(struct fnic_iport_s *iport,
 		tport->retry_counter++;
 
 	fabric_tov = jiffies + msecs_to_jiffies(timeout);
-	mod_timer(&tport->retry_timer, round_jiffies(fabric_tov));
+	timer_mod(&tport->retry_timer, round_jiffies(fabric_tov));
 	tport->timer_pending = 1;
 }
 
@@ -805,7 +805,7 @@ static void fdls_send_fdmi_abts(struct fnic_iport_s *iport)
 	}
 
 	fdmi_tov = jiffies + msecs_to_jiffies(2 * iport->e_d_tov);
-	mod_timer(&iport->fabric.fdmi_timer, round_jiffies(fdmi_tov));
+	timer_mod(&iport->fabric.fdmi_timer, round_jiffies(fdmi_tov));
 	iport->fabric.fdmi_pending |= FDLS_FDMI_ABORT_PENDING;
 }
 
@@ -957,7 +957,7 @@ static void fdls_send_fdmi_plogi(struct fnic_iport_s *iport)
 
 err_out:
 	fdmi_tov = jiffies + msecs_to_jiffies(2 * iport->e_d_tov);
-	mod_timer(&iport->fabric.fdmi_timer, round_jiffies(fdmi_tov));
+	timer_mod(&iport->fabric.fdmi_timer, round_jiffies(fdmi_tov));
 	iport->fabric.fdmi_pending = FDLS_FDMI_PLOGI_PENDING;
 }
 
@@ -3630,7 +3630,7 @@ static void fdls_process_fdmi_plogi_rsp(struct fnic_iport_s *iport,
 			fdls_fdmi_register_hba(iport);
 			fdls_fdmi_register_pa(iport);
 			fdmi_tov = jiffies + msecs_to_jiffies(5000);
-			mod_timer(&iport->fabric.fdmi_timer,
+			timer_mod(&iport->fabric.fdmi_timer,
 				  round_jiffies(fdmi_tov));
 			break;
 		case ELS_LS_RJT:
diff --git a/drivers/scsi/fnic/fip.c b/drivers/scsi/fnic/fip.c
index becdcabafd8c..2a3d93a91e22 100644
--- a/drivers/scsi/fnic/fip.c
+++ b/drivers/scsi/fnic/fip.c
@@ -86,7 +86,7 @@ void fnic_fcoe_send_vlan_req(struct fnic *fnic)
 	fnic_send_fip_frame(iport, frame, frame_size);
 
 	vlan_tov = jiffies + msecs_to_jiffies(FCOE_CTLR_FIPVLAN_TOV);
-	mod_timer(&fnic->retry_fip_timer, round_jiffies(vlan_tov));
+	timer_mod(&fnic->retry_fip_timer, round_jiffies(vlan_tov));
 	FNIC_FIP_DBG(KERN_INFO, fnic->host, fnic->fnic_num,
 		     "fip timer set\n");
 }
@@ -229,7 +229,7 @@ void fnic_fcoe_start_fcf_discovery(struct fnic *fnic)
 	iport->fip.state = FDLS_FIP_FCF_DISCOVERY_STARTED;
 
 	fcs_tov = jiffies + msecs_to_jiffies(FCOE_CTLR_FCS_TOV);
-	mod_timer(&fnic->retry_fip_timer, round_jiffies(fcs_tov));
+	timer_mod(&fnic->retry_fip_timer, round_jiffies(fcs_tov));
 }
 
 /**
@@ -315,7 +315,7 @@ void fnic_fcoe_fip_discovery_resp(struct fnic *fnic, struct fip_header *fiph)
 					    + 3
 					    *
 					    msecs_to_jiffies(iport->selected_fcf.fka_adv_period);
-					mod_timer(&fnic->fcs_ka_timer,
+					timer_mod(&fnic->fcs_ka_timer,
 						  round_jiffies(fcs_ka_tov));
 				} else {
 					if (timer_pending(&fnic->fcs_ka_timer))
@@ -328,14 +328,14 @@ void fnic_fcoe_fip_discovery_resp(struct fnic *fnic, struct fip_header *fiph)
 						 jiffies +
 						 msecs_to_jiffies(
 							 iport->selected_fcf.fka_adv_period);
-						mod_timer(&fnic->enode_ka_timer,
+						timer_mod(&fnic->enode_ka_timer,
 							  round_jiffies(tov));
 
 						tov =
 						    jiffies +
 						    msecs_to_jiffies
 						    (FIP_VN_KA_PERIOD);
-						mod_timer(&fnic->vn_ka_timer,
+						timer_mod(&fnic->vn_ka_timer,
 							  round_jiffies(tov));
 					}
 				}
@@ -434,7 +434,7 @@ void fnic_fcoe_start_flogi(struct fnic *fnic)
 
 	iport->fip.state = FDLS_FIP_FLOGI_STARTED;
 	flogi_tov = jiffies + msecs_to_jiffies(fnic->config.flogi_timeout);
-	mod_timer(&fnic->retry_fip_timer, round_jiffies(flogi_tov));
+	timer_mod(&fnic->retry_fip_timer, round_jiffies(flogi_tov));
 }
 
 /**
@@ -539,13 +539,13 @@ void fnic_fcoe_process_flogi_resp(struct fnic *fnic, struct fip_header *fiph)
 				tov = jiffies
 				    +
 				    msecs_to_jiffies(iport->selected_fcf.fka_adv_period);
-				mod_timer(&fnic->enode_ka_timer,
+				timer_mod(&fnic->enode_ka_timer,
 					  round_jiffies(tov));
 
 				tov =
 				    jiffies +
 				    msecs_to_jiffies(FIP_VN_KA_PERIOD);
-				mod_timer(&fnic->vn_ka_timer,
+				timer_mod(&fnic->vn_ka_timer,
 					  round_jiffies(tov));
 
 			}
@@ -750,7 +750,7 @@ void fnic_work_on_fip_timer(struct work_struct *work)
 				    + 3
 				    *
 				    msecs_to_jiffies(iport->selected_fcf.fka_adv_period);
-				mod_timer(&fnic->fcs_ka_timer,
+				timer_mod(&fnic->fcs_ka_timer,
 					  round_jiffies(fcf_tov));
 			}
 		} else {
@@ -833,7 +833,7 @@ void fnic_handle_enode_ka_timer(struct timer_list *t)
 	fnic_send_fip_frame(iport, frame, frame_size);
 	enode_ka_tov = jiffies
 	    + msecs_to_jiffies(iport->selected_fcf.fka_adv_period);
-	mod_timer(&fnic->enode_ka_timer, round_jiffies(enode_ka_tov));
+	timer_mod(&fnic->enode_ka_timer, round_jiffies(enode_ka_tov));
 }
 
 /**
@@ -891,7 +891,7 @@ void fnic_handle_vn_ka_timer(struct timer_list *t)
 		     "Handle vnport KA timer\n");
 	fnic_send_fip_frame(iport, frame, frame_size);
 	vn_ka_tov = jiffies + msecs_to_jiffies(FIP_VN_KA_PERIOD);
-	mod_timer(&fnic->vn_ka_timer, round_jiffies(vn_ka_tov));
+	timer_mod(&fnic->vn_ka_timer, round_jiffies(vn_ka_tov));
 }
 
 /**
diff --git a/drivers/scsi/fnic/fnic_main.c b/drivers/scsi/fnic/fnic_main.c
index 4cc4077ea53c..96ae8b5f58f1 100644
--- a/drivers/scsi/fnic/fnic_main.c
+++ b/drivers/scsi/fnic/fnic_main.c
@@ -449,7 +449,7 @@ static void fnic_notify_timer(struct timer_list *t)
 	struct fnic *fnic = timer_container_of(fnic, t, notify_timer);
 
 	fnic_handle_link_event(fnic);
-	mod_timer(&fnic->notify_timer,
+	timer_mod(&fnic->notify_timer,
 		  round_jiffies(jiffies + FNIC_NOTIFY_TIMER_PERIOD));
 }
 
@@ -461,7 +461,7 @@ static void fnic_notify_timer_start(struct fnic *fnic)
 		 * Schedule first timeout immediately. The driver is
 		 * initiatialized and ready to look for link up notification
 		 */
-		mod_timer(&fnic->notify_timer, jiffies);
+		timer_mod(&fnic->notify_timer, jiffies);
 		break;
 	default:
 		/* Using intr for notification for INTx/MSI-X */
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
index a92679060ad3..794e525182b1 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
@@ -815,7 +815,7 @@ static void phys_init_v1_hw(struct hisi_hba *hisi_hba)
 	}
 
 	timer_setup(timer, start_phys_v1_hw, 0);
-	mod_timer(timer, jiffies + HZ);
+	timer_mod(timer, jiffies + HZ);
 }
 
 static void sl_notify_ssp_v1_hw(struct hisi_hba *hisi_hba, int phy_no)
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
index 945c2d52d10c..8ab4a858bb97 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
@@ -1344,7 +1344,7 @@ static void link_timeout_enable_link(struct timer_list *t)
 	}
 
 	hisi_hba->timer.function = link_timeout_disable_link;
-	mod_timer(&hisi_hba->timer, jiffies + msecs_to_jiffies(900));
+	timer_mod(&hisi_hba->timer, jiffies + msecs_to_jiffies(900));
 }
 
 static void link_timeout_disable_link(struct timer_list *t)
@@ -1365,7 +1365,7 @@ static void link_timeout_disable_link(struct timer_list *t)
 	}
 
 	hisi_hba->timer.function = link_timeout_enable_link;
-	mod_timer(&hisi_hba->timer, jiffies + msecs_to_jiffies(100));
+	timer_mod(&hisi_hba->timer, jiffies + msecs_to_jiffies(100));
 }
 
 static void set_link_timer_quirk(struct hisi_hba *hisi_hba)
@@ -2622,7 +2622,7 @@ static void prep_abort_v2_hw(struct hisi_hba *hisi_hba,
 	/* setup the quirk timer */
 	timer_setup(timer, hisi_sas_internal_abort_quirk_timeout, 0);
 	/* Set the timeout to 10ms less than internal abort timeout */
-	mod_timer(timer, jiffies + msecs_to_jiffies(100));
+	timer_mod(timer, jiffies + msecs_to_jiffies(100));
 
 	/* dw0 */
 	hdr->dw0 = cpu_to_le32((5 << CMD_HDR_CMD_OFF) | /*abort*/
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 40d226e8bb2e..f819563e7c93 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -4732,7 +4732,7 @@ static void ibmvfc_tgt_adisc(struct ibmvfc_target *tgt)
 	mad->fc_iu.payload[6] = cpu_to_be32(be64_to_cpu(vhost->login_buf->resp.scsi_id) & 0x00ffffff);
 
 	if (timer_pending(&tgt->timer))
-		mod_timer(&tgt->timer, jiffies + (IBMVFC_ADISC_TIMEOUT * HZ));
+		timer_mod(&tgt->timer, jiffies + (IBMVFC_ADISC_TIMEOUT * HZ));
 	else {
 		tgt->timer.expires = jiffies + (IBMVFC_ADISC_TIMEOUT * HZ);
 		timer_add(&tgt->timer);
diff --git a/drivers/scsi/isci/isci.h b/drivers/scsi/isci/isci.h
index d827e49c1d55..faa9083d1b17 100644
--- a/drivers/scsi/isci/isci.h
+++ b/drivers/scsi/isci/isci.h
@@ -500,7 +500,7 @@ void sci_init_timer(struct sci_timer *tmr, void (*fn)(struct timer_list *t))
 static inline void sci_mod_timer(struct sci_timer *tmr, unsigned long msec)
 {
 	tmr->cancel = false;
-	mod_timer(&tmr->timer, jiffies + msecs_to_jiffies(msec));
+	timer_mod(&tmr->timer, jiffies + msecs_to_jiffies(msec));
 }
 
 static inline void sci_del_timer(struct sci_timer *tmr)
diff --git a/drivers/scsi/libfc/fc_fcp.c b/drivers/scsi/libfc/fc_fcp.c
index 16d0f02af1e4..28cb655550df 100644
--- a/drivers/scsi/libfc/fc_fcp.c
+++ b/drivers/scsi/libfc/fc_fcp.c
@@ -237,7 +237,7 @@ static inline void fc_fcp_unlock_pkt(struct fc_fcp_pkt *fsp)
 static void fc_fcp_timer_set(struct fc_fcp_pkt *fsp, unsigned long delay)
 {
 	if (!(fsp->state & FC_SRB_COMPL)) {
-		mod_timer(&fsp->timer, jiffies + delay);
+		timer_mod(&fsp->timer, jiffies + delay);
 		fsp->timer_delay = delay;
 	}
 }
diff --git a/drivers/scsi/libiscsi.c b/drivers/scsi/libiscsi.c
index bd15c749228d..1f3c61700dd7 100644
--- a/drivers/scsi/libiscsi.c
+++ b/drivers/scsi/libiscsi.c
@@ -1081,7 +1081,7 @@ static int iscsi_nop_out_rsp(struct iscsi_task *task,
 				   data, datalen))
 			rc = ISCSI_ERR_CONN_FAILED;
 	} else
-		mod_timer(&conn->transport_timer, jiffies + conn->recv_timeout);
+		timer_mod(&conn->transport_timer, jiffies + conn->recv_timeout);
 	iscsi_complete_task(task, ISCSI_TASK_COMPLETED);
 	return rc;
 }
@@ -2277,7 +2277,7 @@ static void iscsi_check_transport_timeouts(struct timer_list *t)
 		next_timeout = last_recv + recv_timeout;
 
 	ISCSI_DBG_CONN(conn, "Setting next tmo %lu\n", next_timeout);
-	mod_timer(&conn->transport_timer, next_timeout);
+	timer_mod(&conn->transport_timer, next_timeout);
 done:
 	spin_unlock(&session->frwd_lock);
 }
@@ -3322,7 +3322,7 @@ int iscsi_conn_start(struct iscsi_cls_conn *cls_conn)
 	conn->last_recv = jiffies;
 	conn->last_ping = jiffies;
 	if (conn->recv_timeout && conn->ping_timeout)
-		mod_timer(&conn->transport_timer,
+		timer_mod(&conn->transport_timer,
 			  jiffies + (conn->recv_timeout * HZ));
 
 	switch(conn->stop_stage) {
diff --git a/drivers/scsi/lpfc/lpfc_els.c b/drivers/scsi/lpfc/lpfc_els.c
index 83eec96f1043..5b61c7ffb836 100644
--- a/drivers/scsi/lpfc/lpfc_els.c
+++ b/drivers/scsi/lpfc/lpfc_els.c
@@ -4972,7 +4972,7 @@ lpfc_els_retry(struct lpfc_hba *phba, struct lpfc_iocbq *cmdiocb,
 			ndlp->nlp_retry = cmdiocb->retry;
 
 			/* delay is specified in milliseconds */
-			mod_timer(&ndlp->nlp_delayfunc,
+			timer_mod(&ndlp->nlp_delayfunc,
 				jiffies + msecs_to_jiffies(delay));
 			set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 
@@ -8044,7 +8044,7 @@ lpfc_els_rcv_rscn(struct lpfc_vport *vport, struct lpfc_iocbq *cmdiocb,
 			/* Restart disctmo if its already running */
 			if (test_bit(FC_DISC_TMO, &vport->fc_flag)) {
 				tmo = ((phba->fc_ratov * 3) + 3);
-				mod_timer(&vport->fc_disctmo,
+				timer_mod(&vport->fc_disctmo,
 					  jiffies + secs_to_jiffies(tmo));
 			}
 			return 0;
@@ -8079,7 +8079,7 @@ lpfc_els_rcv_rscn(struct lpfc_vport *vport, struct lpfc_iocbq *cmdiocb,
 		/* Restart disctmo if its already running */
 		if (test_bit(FC_DISC_TMO, &vport->fc_flag)) {
 			tmo = ((phba->fc_ratov * 3) + 3);
-			mod_timer(&vport->fc_disctmo,
+			timer_mod(&vport->fc_disctmo,
 				  jiffies + secs_to_jiffies(tmo));
 		}
 		if ((rscn_cnt < FC_MAX_HOLD_RSCN) &&
@@ -9509,7 +9509,7 @@ lpfc_els_timeout_handler(struct lpfc_vport *vport)
 
 	if (!list_empty(&pring->txcmplq))
 		if (!test_bit(FC_UNLOADING, &phba->pport->load_flag))
-			mod_timer(&vport->els_tmofunc,
+			timer_mod(&vport->els_tmofunc,
 				  jiffies + secs_to_jiffies(timeout));
 }
 
@@ -10895,7 +10895,7 @@ lpfc_do_scr_ns_plogi(struct lpfc_hba *phba, struct lpfc_vport *vport)
 		lpfc_printf_vlog(vport, KERN_ERR, LOG_TRACE_EVENT,
 				 "3334 Delay fc port discovery for %d secs\n",
 				 phba->fc_ratov);
-		mod_timer(&vport->delayed_disc_tmo,
+		timer_mod(&vport->delayed_disc_tmo,
 			jiffies + secs_to_jiffies(phba->fc_ratov));
 		return;
 	}
@@ -11153,7 +11153,7 @@ lpfc_retry_pport_discovery(struct lpfc_hba *phba)
 	if (!ndlp)
 		return;
 
-	mod_timer(&ndlp->nlp_delayfunc, jiffies + secs_to_jiffies(1));
+	timer_mod(&ndlp->nlp_delayfunc, jiffies + secs_to_jiffies(1));
 	set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 	ndlp->nlp_last_elscmd = ELS_CMD_FLOGI;
 	phba->pport->port_state = LPFC_FLOGI;
@@ -11698,7 +11698,7 @@ lpfc_block_fabric_iocbs(struct lpfc_hba *phba)
 	blocked = test_and_set_bit(FABRIC_COMANDS_BLOCKED, &phba->bit_flags);
 	/* Start a timer to unblock fabric iocbs after 100ms */
 	if (!blocked)
-		mod_timer(&phba->fabric_block_timer,
+		timer_mod(&phba->fabric_block_timer,
 			  jiffies + msecs_to_jiffies(100));
 
 	return;
diff --git a/drivers/scsi/lpfc/lpfc_hbadisc.c b/drivers/scsi/lpfc/lpfc_hbadisc.c
index 2eaf46be8bb7..20d388268a12 100644
--- a/drivers/scsi/lpfc/lpfc_hbadisc.c
+++ b/drivers/scsi/lpfc/lpfc_hbadisc.c
@@ -4979,7 +4979,7 @@ lpfc_set_disctmo(struct lpfc_vport *vport)
 			tmo, vport->port_state, vport->fc_flag);
 	}
 
-	mod_timer(&vport->fc_disctmo, jiffies + secs_to_jiffies(tmo));
+	timer_mod(&vport->fc_disctmo, jiffies + secs_to_jiffies(tmo));
 	set_bit(FC_DISC_TMO, &vport->fc_flag);
 
 	/* Start Discovery Timer state <hba_state> */
diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 68e6ba085b2b..3064ef4e332f 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -594,16 +594,16 @@ lpfc_config_port_post(struct lpfc_hba *phba)
 
 	/* Set up ring-0 (ELS) timer */
 	timeout = phba->fc_ratov * 2;
-	mod_timer(&vport->els_tmofunc,
+	timer_mod(&vport->els_tmofunc,
 		  jiffies + secs_to_jiffies(timeout));
 	/* Set up heart beat (HB) timer */
-	mod_timer(&phba->hb_tmofunc,
+	timer_mod(&phba->hb_tmofunc,
 		  jiffies + secs_to_jiffies(LPFC_HB_MBOX_INTERVAL));
 	clear_bit(HBA_HBEAT_INP, &phba->hba_flag);
 	clear_bit(HBA_HBEAT_TMO, &phba->hba_flag);
 	phba->last_completion_time = jiffies;
 	/* Set up error attention (ERATT) polling timer */
-	mod_timer(&phba->eratt_poll,
+	timer_mod(&phba->eratt_poll,
 		  jiffies + secs_to_jiffies(phba->eratt_poll_interval));
 
 	if (test_bit(LINK_DISABLED, &phba->hba_flag)) {
@@ -1265,7 +1265,7 @@ lpfc_hb_mbox_cmpl(struct lpfc_hba * phba, LPFC_MBOXQ_t * pmboxq)
 	if (!test_bit(FC_OFFLINE_MODE, &phba->pport->fc_flag) &&
 	    !(phba->link_state == LPFC_HBA_ERROR) &&
 	    !test_bit(FC_UNLOADING, &phba->pport->load_flag))
-		mod_timer(&phba->hb_tmofunc,
+		timer_mod(&phba->hb_tmofunc,
 			  jiffies +
 			  secs_to_jiffies(LPFC_HB_MBOX_INTERVAL));
 	return;
@@ -1615,7 +1615,7 @@ lpfc_hb_timeout_handler(struct lpfc_hba *phba)
 		tmo = (1000 * LPFC_HB_MBOX_INTERVAL);
 	}
 out:
-	mod_timer(&phba->hb_tmofunc, jiffies + msecs_to_jiffies(tmo));
+	timer_mod(&phba->hb_tmofunc, jiffies + msecs_to_jiffies(tmo));
 }
 
 /**
@@ -5106,7 +5106,7 @@ lpfc_fcf_redisc_wait_start_timer(struct lpfc_hba *phba)
 	unsigned long fcf_redisc_wait_tmo =
 		(jiffies + msecs_to_jiffies(LPFC_FCF_REDISCOVER_WAIT_TMO));
 	/* Start fcf rediscovery wait period timer */
-	mod_timer(&phba->fcf.redisc_wait, fcf_redisc_wait_tmo);
+	timer_mod(&phba->fcf.redisc_wait, fcf_redisc_wait_tmo);
 	spin_lock_irq(&phba->hbalock);
 	/* Allow action to new fcf asynchronous event */
 	phba->fcf.fcf_flag &= ~(FCF_AVAILABLE | FCF_SCAN_DONE);
@@ -5179,7 +5179,7 @@ lpfc_vmid_poll(struct timer_list *t)
 		lpfc_worker_wake_up(phba);
 
 	/* restart the timer for the next iteration */
-	mod_timer(&phba->inactive_vmid_poll,
+	timer_mod(&phba->inactive_vmid_poll,
 		  jiffies + secs_to_jiffies(LPFC_VMID_TIMER));
 }
 
@@ -6908,7 +6908,7 @@ lpfc_sli4_async_fip_evt(struct lpfc_hba *phba,
 			 * If there are other active VLinks present,
 			 * re-instantiate the Vlink using FDISC.
 			 */
-			mod_timer(&ndlp->nlp_delayfunc,
+			timer_mod(&ndlp->nlp_delayfunc,
 				  jiffies + secs_to_jiffies(1));
 			set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 			ndlp->nlp_last_elscmd = ELS_CMD_FDISC;
@@ -12781,7 +12781,7 @@ static void lpfc_cpuhp_add(struct lpfc_hba *phba)
 	rcu_read_lock();
 
 	if (!list_empty(&phba->poll_list))
-		mod_timer(&phba->cpuhp_poll_timer,
+		timer_mod(&phba->cpuhp_poll_timer,
 			  jiffies + msecs_to_jiffies(LPFC_POLL_HB));
 
 	rcu_read_unlock();
diff --git a/drivers/scsi/lpfc/lpfc_nportdisc.c b/drivers/scsi/lpfc/lpfc_nportdisc.c
index a596b80d03d4..4a5724aee928 100644
--- a/drivers/scsi/lpfc/lpfc_nportdisc.c
+++ b/drivers/scsi/lpfc/lpfc_nportdisc.c
@@ -816,7 +816,7 @@ lpfc_rcv_padisc(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp,
 	lpfc_els_rsp_reject(vport, stat.un.lsRjtError, cmdiocb, ndlp, NULL);
 
 	/* 1 sec timeout */
-	mod_timer(&ndlp->nlp_delayfunc, jiffies + msecs_to_jiffies(1000));
+	timer_mod(&ndlp->nlp_delayfunc, jiffies + msecs_to_jiffies(1000));
 
 	set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 	ndlp->nlp_last_elscmd = ELS_CMD_PLOGI;
@@ -887,7 +887,7 @@ lpfc_rcv_logo(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp,
 			 * If there are other active VLinks present,
 			 * re-instantiate the Vlink using FDISC.
 			 */
-			mod_timer(&ndlp->nlp_delayfunc,
+			timer_mod(&ndlp->nlp_delayfunc,
 				  jiffies + msecs_to_jiffies(1000));
 			set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 			ndlp->nlp_last_elscmd = ELS_CMD_FDISC;
@@ -910,7 +910,7 @@ lpfc_rcv_logo(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp,
 		      test_bit(FC_PT2PT, &vport->fc_flag))) ||
 		    (ndlp->nlp_state >= NLP_STE_ADISC_ISSUE ||
 		     ndlp->nlp_state <= NLP_STE_PRLI_ISSUE)) {
-			mod_timer(&ndlp->nlp_delayfunc,
+			timer_mod(&ndlp->nlp_delayfunc,
 				  jiffies + secs_to_jiffies(1));
 			set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 			ndlp->nlp_last_elscmd = ELS_CMD_PLOGI;
@@ -1337,7 +1337,7 @@ lpfc_rcv_els_plogi_issue(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp,
 	}
 
 	/* Put ndlp in npr state set plogi timer for 1 sec */
-	mod_timer(&ndlp->nlp_delayfunc, jiffies + secs_to_jiffies(1));
+	timer_mod(&ndlp->nlp_delayfunc, jiffies + secs_to_jiffies(1));
 	set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 	ndlp->nlp_last_elscmd = ELS_CMD_PLOGI;
 	ndlp->nlp_prev_state = NLP_STE_PLOGI_ISSUE;
@@ -1718,7 +1718,7 @@ lpfc_cmpl_adisc_adisc_issue(struct lpfc_vport *vport,
 	if ((ulp_status) ||
 	    (!lpfc_check_adisc(vport, ndlp, &ap->nodeName, &ap->portName))) {
 		/* 1 sec timeout */
-		mod_timer(&ndlp->nlp_delayfunc,
+		timer_mod(&ndlp->nlp_delayfunc,
 			  jiffies + msecs_to_jiffies(1000));
 		set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 		ndlp->nlp_last_elscmd = ELS_CMD_PLOGI;
@@ -1940,7 +1940,7 @@ lpfc_cmpl_reglogin_reglogin_issue(struct lpfc_vport *vport,
 		}
 
 		/* Put ndlp in npr state set plogi timer for 1 sec */
-		mod_timer(&ndlp->nlp_delayfunc,
+		timer_mod(&ndlp->nlp_delayfunc,
 			  jiffies + secs_to_jiffies(1));
 		set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 		ndlp->nlp_last_elscmd = ELS_CMD_PLOGI;
@@ -2749,7 +2749,7 @@ lpfc_rcv_prlo_npr_node(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp,
 	lpfc_els_rsp_acc(vport, ELS_CMD_ACC, cmdiocb, ndlp, NULL);
 
 	if (!test_bit(NLP_DELAY_TMO, &ndlp->nlp_flag)) {
-		mod_timer(&ndlp->nlp_delayfunc,
+		timer_mod(&ndlp->nlp_delayfunc,
 			  jiffies + secs_to_jiffies(1));
 		set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 		clear_bit(NLP_NPR_ADISC, &ndlp->nlp_flag);
diff --git a/drivers/scsi/lpfc/lpfc_scsi.c b/drivers/scsi/lpfc/lpfc_scsi.c
index 8acb744febcd..9de89e9547de 100644
--- a/drivers/scsi/lpfc/lpfc_scsi.c
+++ b/drivers/scsi/lpfc/lpfc_scsi.c
@@ -5166,7 +5166,7 @@ static __inline__ void lpfc_poll_rearm_timer(struct lpfc_hba * phba)
 		(jiffies + msecs_to_jiffies(phba->cfg_poll_tmo));
 
 	if (!list_empty(&phba->sli.sli3_ring[LPFC_FCP_RING].txcmplq))
-		mod_timer(&phba->fcp_poll_timer,
+		timer_mod(&phba->fcp_poll_timer,
 			  poll_tmo_expires);
 }
 
diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index b694fe1bf714..31a8b4ead10e 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -1037,7 +1037,7 @@ lpfc_handle_rrq_active(struct lpfc_hba *phba)
 	spin_unlock_irqrestore(&phba->rrq_list_lock, iflags);
 	if ((!list_empty(&phba->active_rrq_list)) &&
 	    (!test_bit(FC_UNLOADING, &phba->pport->load_flag)))
-		mod_timer(&phba->rrq_tmr, next_time);
+		timer_mod(&phba->rrq_tmr, next_time);
 	list_for_each_entry_safe(rrq, nextrrq, &send_rrq, list) {
 		list_del(&rrq->list);
 		if (!rrq->send_rrq) {
@@ -1734,7 +1734,7 @@ lpfc_sli_ringtxcmpl_put(struct lpfc_hba *phba, struct lpfc_sli_ring *pring,
 	   (ulp_command != CMD_CLOSE_XRI_CN)) {
 		BUG_ON(!piocb->vport);
 		if (!test_bit(FC_UNLOADING, &piocb->vport->load_flag))
-			mod_timer(&piocb->vport->els_tmofunc,
+			timer_mod(&piocb->vport->els_tmofunc,
 				  jiffies + secs_to_jiffies(phba->fc_ratov << 1));
 	}
 
@@ -3955,7 +3955,7 @@ void lpfc_poll_eratt(struct timer_list *t)
 		lpfc_worker_wake_up(phba);
 	else
 		/* Restart the timer for next eratt poll */
-		mod_timer(&phba->eratt_poll,
+		timer_mod(&phba->eratt_poll,
 			  jiffies + secs_to_jiffies(phba->eratt_poll_interval));
 	return;
 }
@@ -9006,11 +9006,11 @@ lpfc_sli4_hba_setup(struct lpfc_hba *phba)
 	phba->fcf.current_rec.flag = 0;
 
 	/* Start the ELS watchdog timer */
-	mod_timer(&vport->els_tmofunc,
+	timer_mod(&vport->els_tmofunc,
 			jiffies + secs_to_jiffies(phba->fc_ratov * 2));
 
 	/* Start heart beat timer */
-	mod_timer(&phba->hb_tmofunc,
+	timer_mod(&phba->hb_tmofunc,
 		  jiffies + secs_to_jiffies(LPFC_HB_MBOX_INTERVAL));
 	clear_bit(HBA_HBEAT_INP, &phba->hba_flag);
 	clear_bit(HBA_HBEAT_TMO, &phba->hba_flag);
@@ -9025,7 +9025,7 @@ lpfc_sli4_hba_setup(struct lpfc_hba *phba)
 	lpfc_init_idle_stat_hb(phba);
 
 	/* Start error attention (ERATT) polling timer */
-	mod_timer(&phba->eratt_poll,
+	timer_mod(&phba->eratt_poll,
 		  jiffies + secs_to_jiffies(phba->eratt_poll_interval));
 
 	/*
@@ -9504,7 +9504,7 @@ lpfc_sli_issue_mbox_s3(struct lpfc_hba *phba, LPFC_MBOXQ_t *pmbox,
 		}
 		/* timeout active mbox command */
 		timeout = secs_to_jiffies(lpfc_mbox_tmo_val(phba, pmbox));
-		mod_timer(&psli->mbox_tmo, jiffies + timeout);
+		timer_mod(&psli->mbox_tmo, jiffies + timeout);
 	}
 
 	/* Mailbox cmd <cmd> issue */
@@ -10224,7 +10224,7 @@ lpfc_sli4_post_async_mbox(struct lpfc_hba *phba)
 	mbx_cmnd = bf_get(lpfc_mqe_command, mqe);
 
 	/* Start timer for the mbox_tmo and log some mailbox post messages */
-	mod_timer(&psli->mbox_tmo, (jiffies +
+	timer_mod(&psli->mbox_tmo, (jiffies +
 		  secs_to_jiffies(lpfc_mbox_tmo_val(phba, mboxq))));
 
 	lpfc_printf_log(phba, KERN_INFO, LOG_MBOX | LOG_SLI,
@@ -15659,7 +15659,7 @@ void lpfc_sli4_poll_hbtimer(struct timer_list *t)
 	list_for_each_entry_rcu(eq, &phba->poll_list, _poll_list)
 		lpfc_sli4_poll_eq(eq);
 	if (!list_empty(&phba->poll_list))
-		mod_timer(&phba->cpuhp_poll_timer,
+		timer_mod(&phba->cpuhp_poll_timer,
 			  jiffies + msecs_to_jiffies(LPFC_POLL_HB));
 
 	rcu_read_unlock();
@@ -15671,7 +15671,7 @@ static inline void lpfc_sli4_add_to_poll_list(struct lpfc_queue *eq)
 
 	/* kickstart slowpath processing if needed */
 	if (list_empty(&phba->poll_list))
-		mod_timer(&phba->cpuhp_poll_timer,
+		timer_mod(&phba->cpuhp_poll_timer,
 			  jiffies + msecs_to_jiffies(LPFC_POLL_HB));
 
 	list_add_rcu(&eq->_poll_list, &phba->poll_list);
diff --git a/drivers/scsi/lpfc/lpfc_vmid.c b/drivers/scsi/lpfc/lpfc_vmid.c
index 14dbfe954e42..966f3ebda33a 100644
--- a/drivers/scsi/lpfc/lpfc_vmid.c
+++ b/drivers/scsi/lpfc/lpfc_vmid.c
@@ -276,7 +276,7 @@ int lpfc_vmid_get_appid(struct lpfc_vport *vport, char *uuid,
 
 		/* finally, enable the idle timer once */
 		if (!(vport->phba->pport->vmid_flag & LPFC_VMID_TIMER_ENBLD)) {
-			mod_timer(&vport->phba->inactive_vmid_poll,
+			timer_mod(&vport->phba->inactive_vmid_poll,
 				  jiffies +
 				  secs_to_jiffies(LPFC_VMID_TIMER));
 			vport->phba->pport->vmid_flag |= LPFC_VMID_TIMER_ENBLD;
diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
index 3e1a19b199cd..d7794bb4fa83 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -2727,7 +2727,7 @@ static void megasas_sriov_heartbeat_handler(struct timer_list *t)
 	    instance->hb_host_mem->HB.driverCounter) {
 		instance->hb_host_mem->HB.driverCounter =
 			instance->hb_host_mem->HB.fwCounter;
-		mod_timer(&instance->sriov_heartbeat_timer,
+		timer_mod(&instance->sriov_heartbeat_timer,
 			  jiffies + MEGASAS_SRIOV_HEARTBEAT_INTERVAL_VF);
 	} else {
 		dev_warn(&instance->pdev->dev, "SR-IOV: Heartbeat never "
diff --git a/drivers/scsi/qla1280.c b/drivers/scsi/qla1280.c
index 6af018f1ca22..d57178478872 100644
--- a/drivers/scsi/qla1280.c
+++ b/drivers/scsi/qla1280.c
@@ -2447,7 +2447,7 @@ qla1280_mailbox_command(struct scsi_qla_host *ha, uint8_t mr, uint16_t *mb)
 
 	/* set up a timer just in case we're really jammed */
 	timer_setup(&ha->mailbox_timer, qla1280_mailbox_timeout, 0);
-	mod_timer(&ha->mailbox_timer, jiffies + 20 * HZ);
+	timer_mod(&ha->mailbox_timer, jiffies + 20 * HZ);
 
 	spin_unlock_irq(ha->host->host_lock);
 	WRT_REG_WORD(&reg->host_cmd, HC_SET_HOST_INT);
diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index 5482320ac18b..724f76103c70 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -395,7 +395,7 @@ qla2x00_restart_timer(scsi_qla_host_t *vha, unsigned long interval)
 		return;
 	}
 
-	mod_timer(&vha->timer, jiffies + interval * HZ);
+	timer_mod(&vha->timer, jiffies + interval * HZ);
 }
 
 static __inline__ void
diff --git a/drivers/scsi/qla4xxx/ql4_os.c b/drivers/scsi/qla4xxx/ql4_os.c
index 94205369321a..7fc946d7ce47 100644
--- a/drivers/scsi/qla4xxx/ql4_os.c
+++ b/drivers/scsi/qla4xxx/ql4_os.c
@@ -4561,7 +4561,7 @@ static void qla4xxx_timer(struct timer_list *t)
 	 * skip any processing and reschedule the timer
 	 */
 	if (test_bit(AF_EEH_BUSY, &ha->flags)) {
-		mod_timer(&ha->timer, jiffies + HZ);
+		timer_mod(&ha->timer, jiffies + HZ);
 		return;
 	}
 
@@ -4607,7 +4607,7 @@ static void qla4xxx_timer(struct timer_list *t)
 	}
 
 	/* Reschedule timer thread to call us back in one second */
-	mod_timer(&ha->timer, jiffies + HZ);
+	timer_mod(&ha->timer, jiffies + HZ);
 
 	DEBUG2(ha->seconds_since_last_intr++);
 }
diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index e1912f5f8528..a1c0dfcba979 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -3832,7 +3832,7 @@ static void pqi_heartbeat_timer_handler(struct timer_list *t)
 	}
 
 	ctrl_info->previous_heartbeat_count = heartbeat_count;
-	mod_timer(&ctrl_info->heartbeat_timer,
+	timer_mod(&ctrl_info->heartbeat_timer,
 		jiffies + PQI_HEARTBEAT_TIMER_INTERVAL);
 }
 
diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index c4f49e20d5f3..622212afad1f 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -80,7 +80,7 @@ static int agilent_82357a_send_bulk_msg(struct agilent_82357a_priv *a_priv, void
 			  &agilent_82357a_bulk_complete, context);
 
 	if (timeout_msecs)
-		mod_timer(&a_priv->bulk_timer, jiffies + msecs_to_jiffies(timeout_msecs));
+		timer_mod(&a_priv->bulk_timer, jiffies + msecs_to_jiffies(timeout_msecs));
 
 	retval = usb_submit_urb(a_priv->bulk_urb, GFP_KERNEL);
 	if (retval) {
@@ -148,7 +148,7 @@ static int agilent_82357a_receive_bulk_msg(struct agilent_82357a_priv *a_priv, v
 			  &agilent_82357a_bulk_complete, context);
 
 	if (timeout_msecs)
-		mod_timer(&a_priv->bulk_timer, jiffies + msecs_to_jiffies(timeout_msecs));
+		timer_mod(&a_priv->bulk_timer, jiffies + msecs_to_jiffies(timeout_msecs));
 
 	retval = usb_submit_urb(a_priv->bulk_urb, GFP_KERNEL);
 	if (retval) {
diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index e6693046d262..c27bcc592df3 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -101,7 +101,7 @@ void os_start_timer(struct gpib_board *board, unsigned int usec_timeout)
 	if (usec_timeout > 0) {
 		board->timer.function = watchdog_timeout;
 		/* set number of ticks */
-		mod_timer(&board->timer, jiffies + usec_to_jiffies(usec_timeout));
+		timer_mod(&board->timer, jiffies + usec_to_jiffies(usec_timeout));
 	}
 }
 
@@ -137,7 +137,7 @@ static void pseudo_irq_handler(struct timer_list *t)
 		pr_err("gpib: bug! pseudo_irq.handler is NULL\n");
 
 	if (atomic_read(&pseudo_irq->active))
-		mod_timer(&pseudo_irq->timer, jiffies + pseudo_irq_period());
+		timer_mod(&pseudo_irq->timer, jiffies + pseudo_irq_period());
 }
 
 int gpib_request_pseudo_irq(struct gpib_board *board, irqreturn_t (*handler)(int, void *))
@@ -153,7 +153,7 @@ int gpib_request_pseudo_irq(struct gpib_board *board, irqreturn_t (*handler)(int
 
 	atomic_set(&board->pseudo_irq.active, 1);
 
-	mod_timer(&board->pseudo_irq.timer, jiffies + pseudo_irq_period());
+	timer_mod(&board->pseudo_irq.timer, jiffies + pseudo_irq_period());
 
 	return 0;
 }
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index f8c762012d54..5d9ef387edbb 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -605,7 +605,7 @@ static void start_wait_timer(struct wait_info *winfo)
 	winfo->timed_out = 0;
 
 	if (winfo->usec_timeout > 0)
-		mod_timer(&winfo->timer, jiffies + usec_to_jiffies(winfo->usec_timeout));
+		timer_mod(&winfo->timer, jiffies + usec_to_jiffies(winfo->usec_timeout));
 }
 
 static void remove_wait_timer(struct wait_info *winfo)
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index ff0931e1ce01..7f55a26c44ee 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -132,7 +132,7 @@ static int ni_usb_nonblocking_send_bulk_msg(struct ni_usb_priv *ni_priv, void *d
 			  &ni_usb_bulk_complete, context);
 
 	if (timeout_msecs)
-		mod_timer(&ni_priv->bulk_timer, jiffies + msecs_to_jiffies(timeout_msecs));
+		timer_mod(&ni_priv->bulk_timer, jiffies + msecs_to_jiffies(timeout_msecs));
 
 	retval = usb_submit_urb(ni_priv->bulk_urb, GFP_KERNEL);
 	if (retval) {
@@ -218,7 +218,7 @@ static int ni_usb_nonblocking_receive_bulk_msg(struct ni_usb_priv *ni_priv,
 			  &ni_usb_bulk_complete, context);
 
 	if (timeout_msecs)
-		mod_timer(&ni_priv->bulk_timer, jiffies + msecs_to_jiffies(timeout_msecs));
+		timer_mod(&ni_priv->bulk_timer, jiffies + msecs_to_jiffies(timeout_msecs));
 
 	retval = usb_submit_urb(ni_priv->bulk_urb, GFP_KERNEL);
 	if (retval) {
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 77360bfe081a..6e6880b8dcf8 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -258,7 +258,7 @@ static irqreturn_t prp_eof_interrupt(int irq, void *dev_id)
 	priv->ipu_buf_num ^= 1;
 
 	/* bump the EOF timeout timer */
-	mod_timer(&priv->eof_timeout_timer,
+	timer_mod(&priv->eof_timeout_timer,
 		  jiffies + msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 
 unlock:
@@ -729,7 +729,7 @@ static int prp_start(struct prp_priv *priv)
 	}
 
 	/* start the EOF timeout timer */
-	mod_timer(&priv->eof_timeout_timer,
+	timer_mod(&priv->eof_timeout_timer,
 		  jiffies + msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 
 	return 0;
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index a7cd3ef95fc3..daad856dffb7 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -323,7 +323,7 @@ static irqreturn_t csi_idmac_eof_interrupt(int irq, void *dev_id)
 	priv->ipu_buf_num ^= 1;
 
 	/* bump the EOF timeout timer */
-	mod_timer(&priv->eof_timeout_timer,
+	timer_mod(&priv->eof_timeout_timer,
 		  jiffies + msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 
 unlock:
@@ -650,7 +650,7 @@ static int csi_idmac_start(struct csi_priv *priv)
 	}
 
 	/* start the EOF timeout timer */
-	mod_timer(&priv->eof_timeout_timer,
+	timer_mod(&priv->eof_timeout_timer,
 		  jiffies + msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 
 	return 0;
diff --git a/drivers/staging/rtl8723bs/include/osdep_service_linux.h b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
index 2ec54f9e180c..ef0b36ef52af 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service_linux.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
@@ -55,7 +55,7 @@ static inline struct list_head	*get_list_head(struct __queue	*queue)
 
 static inline void _set_timer(struct timer_list *ptimer, u32 delay_time)
 {
-	mod_timer(ptimer, (jiffies + (delay_time * HZ / 1000)));
+	timer_mod(ptimer, (jiffies + (delay_time * HZ / 1000)));
 }
 
 static inline void _init_workitem(struct work_struct *pwork, void *pfunc, void *cntx)
diff --git a/drivers/target/iscsi/iscsi_target_erl0.c b/drivers/target/iscsi/iscsi_target_erl0.c
index e11b84c6abe2..b31a2c8331f9 100644
--- a/drivers/target/iscsi/iscsi_target_erl0.c
+++ b/drivers/target/iscsi/iscsi_target_erl0.c
@@ -790,7 +790,7 @@ void iscsit_start_time2retain_handler(struct iscsit_session *sess)
 
 	sess->time2retain_timer_flags &= ~ISCSI_TF_STOP;
 	sess->time2retain_timer_flags |= ISCSI_TF_RUNNING;
-	mod_timer(&sess->time2retain_timer,
+	timer_mod(&sess->time2retain_timer,
 		  jiffies + sess->sess_ops->DefaultTime2Retain * HZ);
 }
 
diff --git a/drivers/target/iscsi/iscsi_target_erl1.c b/drivers/target/iscsi/iscsi_target_erl1.c
index d8ca06e697d6..29f8740c7df9 100644
--- a/drivers/target/iscsi/iscsi_target_erl1.c
+++ b/drivers/target/iscsi/iscsi_target_erl1.c
@@ -1190,7 +1190,7 @@ void iscsit_mod_dataout_timer(struct iscsit_cmd *cmd)
 		return;
 	}
 
-	mod_timer(&cmd->dataout_timer,
+	timer_mod(&cmd->dataout_timer,
 		(get_jiffies_64() + na->dataout_timeout * HZ));
 	pr_debug("Updated DataOUT timer for ITT: 0x%08x",
 			cmd->init_task_tag);
@@ -1214,7 +1214,7 @@ void iscsit_start_dataout_timer(
 
 	cmd->dataout_timer_flags &= ~ISCSI_TF_STOP;
 	cmd->dataout_timer_flags |= ISCSI_TF_RUNNING;
-	mod_timer(&cmd->dataout_timer, jiffies + na->dataout_timeout * HZ);
+	timer_mod(&cmd->dataout_timer, jiffies + na->dataout_timeout * HZ);
 }
 
 void iscsit_stop_dataout_timer(struct iscsit_cmd *cmd)
diff --git a/drivers/target/iscsi/iscsi_target_util.c b/drivers/target/iscsi/iscsi_target_util.c
index a607366f9d2a..627a5819579c 100644
--- a/drivers/target/iscsi/iscsi_target_util.c
+++ b/drivers/target/iscsi/iscsi_target_util.c
@@ -886,7 +886,7 @@ void iscsit_mod_nopin_response_timer(struct iscsit_conn *conn)
 		return;
 	}
 
-	mod_timer(&conn->nopin_response_timer,
+	timer_mod(&conn->nopin_response_timer,
 		(get_jiffies_64() + na->nopin_response_timeout * HZ));
 	spin_unlock_bh(&conn->nopin_timer_lock);
 }
@@ -904,7 +904,7 @@ void iscsit_start_nopin_response_timer(struct iscsit_conn *conn)
 
 	conn->nopin_response_timer_flags &= ~ISCSI_TF_STOP;
 	conn->nopin_response_timer_flags |= ISCSI_TF_RUNNING;
-	mod_timer(&conn->nopin_response_timer,
+	timer_mod(&conn->nopin_response_timer,
 		  jiffies + na->nopin_response_timeout * HZ);
 
 	pr_debug("Started NOPIN Response Timer on CID: %d to %u"
@@ -966,7 +966,7 @@ void __iscsit_start_nopin_timer(struct iscsit_conn *conn)
 
 	conn->nopin_timer_flags &= ~ISCSI_TF_STOP;
 	conn->nopin_timer_flags |= ISCSI_TF_RUNNING;
-	mod_timer(&conn->nopin_timer, jiffies + na->nopin_timeout * HZ);
+	timer_mod(&conn->nopin_timer, jiffies + na->nopin_timeout * HZ);
 
 	pr_debug("Started NOPIN Timer on CID: %d at %u second"
 		" interval\n", conn->cid, na->nopin_timeout);
@@ -1021,7 +1021,7 @@ void iscsit_start_login_timer(struct iscsit_conn *conn, struct task_struct *kthr
 	pr_debug("Login timer started\n");
 
 	conn->login_kworker = kthr;
-	mod_timer(&conn->login_timer, jiffies + TA_LOGIN_TIMEOUT * HZ);
+	timer_mod(&conn->login_timer, jiffies + TA_LOGIN_TIMEOUT * HZ);
 }
 
 int iscsit_set_login_timer_kworker(struct iscsit_conn *conn, struct task_struct *kthr)
diff --git a/drivers/target/target_core_user.c b/drivers/target/target_core_user.c
index 3fd963612775..355a768e3f81 100644
--- a/drivers/target/target_core_user.c
+++ b/drivers/target/target_core_user.c
@@ -920,7 +920,7 @@ static void tcmu_setup_cmd_timer(struct tcmu_cmd *tcmu_cmd, unsigned int tmo,
 
 	tcmu_cmd->deadline = round_jiffies_up(jiffies + msecs_to_jiffies(tmo));
 	if (!timer_pending(timer))
-		mod_timer(timer, tcmu_cmd->deadline);
+		timer_mod(timer, tcmu_cmd->deadline);
 
 	pr_debug("Timeout set up for cmd %p, dev = %s, tmo = %lu\n", tcmu_cmd,
 		 tcmu_cmd->tcmu_dev->name, tmo / MSEC_PER_SEC);
@@ -1230,7 +1230,7 @@ static void tcmu_set_next_deadline(struct list_head *queue,
 
 	if (!list_empty(queue)) {
 		cmd = list_first_entry(queue, struct tcmu_cmd, queue_entry);
-		mod_timer(timer, cmd->deadline);
+		timer_mod(timer, cmd->deadline);
 	} else
 		timer_delete(timer);
 }
diff --git a/drivers/tty/ipwireless/hardware.c b/drivers/tty/ipwireless/hardware.c
index e18848267be4..4babc829ccdd 100644
--- a/drivers/tty/ipwireless/hardware.c
+++ b/drivers/tty/ipwireless/hardware.c
@@ -1706,7 +1706,7 @@ static void ipwireless_setup_timer(struct timer_list *t)
 			tasklet_schedule(&hw->tasklet);
 		}
 
-		mod_timer(&hw->setup_timer,
+		timer_mod(&hw->setup_timer,
 			jiffies + msecs_to_jiffies(TL_SETUP_VERSION_QRY_TMO));
 	}
 }
diff --git a/drivers/tty/mips_ejtag_fdc.c b/drivers/tty/mips_ejtag_fdc.c
index 6f2d3cf4f7cf..f5ec2b8e258d 100644
--- a/drivers/tty/mips_ejtag_fdc.c
+++ b/drivers/tty/mips_ejtag_fdc.c
@@ -687,7 +687,7 @@ static void mips_ejtag_fdc_tty_timer(struct timer_list *t)
 
 	mips_ejtag_fdc_handle(priv);
 	if (!priv->removing)
-		mod_timer(&priv->poll_timer, jiffies + FDC_TTY_POLL);
+		timer_mod(&priv->poll_timer, jiffies + FDC_TTY_POLL);
 }
 
 /* TTY Port operations */
diff --git a/drivers/tty/moxa.c b/drivers/tty/moxa.c
index 329b30fac8fc..0bc14ef6f97a 100644
--- a/drivers/tty/moxa.c
+++ b/drivers/tty/moxa.c
@@ -1005,7 +1005,7 @@ static int moxa_init_board(struct moxa_board_conf *brd, struct device *dev)
 	spin_lock_bh(&moxa_lock);
 	brd->ready = 1;
 	if (!timer_pending(&moxaTimer))
-		mod_timer(&moxaTimer, jiffies + HZ / 50);
+		timer_mod(&moxaTimer, jiffies + HZ / 50);
 	spin_unlock_bh(&moxa_lock);
 
 	first_idx = (brd - moxa_boards) * MAX_PORTS_PER_BOARD;
@@ -1524,7 +1524,7 @@ static void moxa_poll(struct timer_list *unused)
 	moxaLowWaterChk = 0;
 
 	if (served)
-		mod_timer(&moxaTimer, jiffies + HZ / 50);
+		timer_mod(&moxaTimer, jiffies + HZ / 50);
 	spin_unlock(&moxa_lock);
 }
 
diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
index 7fc535452c0b..ebba5439cdb9 100644
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -1142,7 +1142,7 @@ static void __gsm_data_queue(struct gsm_dlci *dlci, struct gsm_msg *msg)
 	gsm->tx_bytes += msg->len;
 
 	gsmld_write_trigger(gsm);
-	mod_timer(&gsm->kick_timer, jiffies + 10 * gsm->t1 * HZ / 100);
+	timer_mod(&gsm->kick_timer, jiffies + 10 * gsm->t1 * HZ / 100);
 }
 
 /**
@@ -1778,7 +1778,7 @@ static void gsm_control_negotiation(struct gsm_mux *gsm, unsigned int cr,
 		/* Proceed with link setup by sending SABM before UA */
 		dlci->state = DLCI_OPENING;
 		gsm_command(gsm, dlci->addr, SABM|PF);
-		mod_timer(&dlci->t1, jiffies + gsm->t1 * HZ / 100);
+		timer_mod(&dlci->t1, jiffies + gsm->t1 * HZ / 100);
 	} else {
 		if (debug & DBG_ERRORS)
 			pr_info("%s PN in invalid state\n", __func__);
@@ -1955,7 +1955,7 @@ static void gsm_control_response(struct gsm_mux *gsm, unsigned int command,
 	} else if (command == CMD_TEST && clen == 1 && *data == gsm->ka_num) {
 		gsm->ka_retries = -1; /* trigger new keep-alive message */
 		if (dlci && !dlci->dead)
-			mod_timer(&gsm->ka_timer, jiffies + gsm->keep_alive * HZ / 100);
+			timer_mod(&gsm->ka_timer, jiffies + gsm->keep_alive * HZ / 100);
 	}
 	spin_unlock_irqrestore(&gsm->control_lock, flags);
 }
@@ -1996,7 +1996,7 @@ static void gsm_control_keep_alive(struct timer_list *t)
 		}
 		gsm_control_command(gsm, CMD_TEST, &gsm->ka_num,
 				    sizeof(gsm->ka_num));
-		mod_timer(&gsm->ka_timer,
+		timer_mod(&gsm->ka_timer,
 			  jiffies + gsm->t2 * HZ / 100);
 	}
 	spin_unlock_irqrestore(&gsm->control_lock, flags);
@@ -2044,7 +2044,7 @@ static void gsm_control_retransmit(struct timer_list *t)
 		}
 		gsm->cretries--;
 		gsm_control_transmit(gsm, ctrl);
-		mod_timer(&gsm->t2_timer, jiffies + gsm->t2 * HZ / 100);
+		timer_mod(&gsm->t2_timer, jiffies + gsm->t2 * HZ / 100);
 	}
 	spin_unlock_irqrestore(&gsm->control_lock, flags);
 }
@@ -2087,7 +2087,7 @@ static struct gsm_control *gsm_control_send(struct gsm_mux *gsm,
 	else
 		gsm->cretries = gsm->n2;
 
-	mod_timer(&gsm->t2_timer, jiffies + gsm->t2 * HZ / 100);
+	timer_mod(&gsm->t2_timer, jiffies + gsm->t2 * HZ / 100);
 	gsm_control_transmit(gsm, ctrl);
 	spin_unlock_irqrestore(&gsm->control_lock, flags);
 	return ctrl;
@@ -2179,7 +2179,7 @@ static void gsm_dlci_open(struct gsm_dlci *dlci)
 		/* Start keep-alive control */
 		gsm->ka_num = 0;
 		gsm->ka_retries = -1;
-		mod_timer(&gsm->ka_timer,
+		timer_mod(&gsm->ka_timer,
 			  jiffies + gsm->keep_alive * HZ / 100);
 	}
 	gsm_dlci_data_kick(dlci);
@@ -2236,7 +2236,7 @@ static void gsm_dlci_t1(struct timer_list *t)
 	case DLCI_CONFIGURE:
 		if (dlci->retries && gsm_dlci_negotiate(dlci) == 0) {
 			dlci->retries--;
-			mod_timer(&dlci->t1, jiffies + gsm->t1 * HZ / 100);
+			timer_mod(&dlci->t1, jiffies + gsm->t1 * HZ / 100);
 		} else {
 			gsm->open_error++;
 			gsm_dlci_begin_close(dlci); /* prevent half open link */
@@ -2255,7 +2255,7 @@ static void gsm_dlci_t1(struct timer_list *t)
 				gsm_command(dlci->gsm, dlci->addr, SABM|PF);
 			}
 
-			mod_timer(&dlci->t1, jiffies + gsm->t1 * HZ / 100);
+			timer_mod(&dlci->t1, jiffies + gsm->t1 * HZ / 100);
 		} else {
 			gsm->open_error++;
 			gsm_dlci_begin_close(dlci); /* prevent half open link */
@@ -2266,7 +2266,7 @@ static void gsm_dlci_t1(struct timer_list *t)
 		if (dlci->retries) {
 			dlci->retries--;
 			gsm_command(dlci->gsm, dlci->addr, DISC|PF);
-			mod_timer(&dlci->t1, jiffies + gsm->t1 * HZ / 100);
+			timer_mod(&dlci->t1, jiffies + gsm->t1 * HZ / 100);
 		} else
 			gsm_dlci_close(dlci);
 		break;
@@ -2322,7 +2322,7 @@ static void gsm_dlci_begin_open(struct gsm_dlci *dlci)
 				return;
 			}
 		}
-		mod_timer(&dlci->t1, jiffies + gsm->t1 * HZ / 100);
+		timer_mod(&dlci->t1, jiffies + gsm->t1 * HZ / 100);
 		break;
 	default:
 		break;
@@ -2386,7 +2386,7 @@ static void gsm_dlci_begin_close(struct gsm_dlci *dlci)
 	dlci->retries = gsm->n2;
 	dlci->state = DLCI_CLOSING;
 	gsm_command(dlci->gsm, dlci->addr, DISC|PF);
-	mod_timer(&dlci->t1, jiffies + gsm->t1 * HZ / 100);
+	timer_mod(&dlci->t1, jiffies + gsm->t1 * HZ / 100);
 	wake_up_interruptible(&gsm->event);
 }
 
diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 8c25ef774566..01140359dbb4 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -308,7 +308,7 @@ static void aspeed_vuart_unthrottle_exp(struct timer_list *timer)
 	struct uart_8250_port *up = vuart->port;
 
 	if (!tty_buffer_space_avail(&up->port.state->port)) {
-		mod_timer(&vuart->unthrottle_timer,
+		timer_mod(&vuart->unthrottle_timer,
 			  jiffies + unthrottle_timeout);
 		return;
 	}
@@ -352,7 +352,7 @@ static int aspeed_vuart_handle_irq(struct uart_port *port)
 			__aspeed_vuart_set_throttle(up, true);
 
 			if (!timer_pending(&vuart->unthrottle_timer))
-				mod_timer(&vuart->unthrottle_timer,
+				timer_mod(&vuart->unthrottle_timer,
 					  jiffies + unthrottle_timeout);
 
 		} else {
diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index a7e09fa7df94..7702e2449f7f 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -209,7 +209,7 @@ static void serial8250_timeout(struct timer_list *t)
 	struct uart_8250_port *up = timer_container_of(up, t, timer);
 
 	up->port.handle_irq(&up->port);
-	mod_timer(&up->timer, jiffies + uart_poll_timeout(&up->port));
+	timer_mod(&up->timer, jiffies + uart_poll_timeout(&up->port));
 }
 
 static void serial8250_backup_timeout(struct timer_list *t)
@@ -255,7 +255,7 @@ static void serial8250_backup_timeout(struct timer_list *t)
 	uart_port_unlock_irqrestore(&up->port, flags);
 
 	/* Standard timer interval plus 0.2s to keep the port running */
-	mod_timer(&up->timer,
+	timer_mod(&up->timer,
 		jiffies + uart_poll_timeout(&up->port) + HZ / 5);
 }
 
@@ -271,7 +271,7 @@ static void univ8250_setup_timer(struct uart_8250_port *up)
 		pr_debug("%s - using backup timer\n", port->name);
 
 		up->timer.function = serial8250_backup_timeout;
-		mod_timer(&up->timer, jiffies +
+		timer_mod(&up->timer, jiffies +
 			  uart_poll_timeout(port) + HZ / 5);
 	}
 
@@ -281,7 +281,7 @@ static void univ8250_setup_timer(struct uart_8250_port *up)
 	 * driver used to do this with IRQ0.
 	 */
 	if (!port->irq)
-		mod_timer(&up->timer, jiffies + uart_poll_timeout(port));
+		timer_mod(&up->timer, jiffies + uart_poll_timeout(port));
 }
 
 static int univ8250_setup_irq(struct uart_8250_port *up)
diff --git a/drivers/tty/serial/altera_uart.c b/drivers/tty/serial/altera_uart.c
index 837991dc4db9..e0a7fdb19a96 100644
--- a/drivers/tty/serial/altera_uart.c
+++ b/drivers/tty/serial/altera_uart.c
@@ -279,7 +279,7 @@ static void altera_uart_timer(struct timer_list *t)
 	struct uart_port *port = &pp->port;
 
 	altera_uart_interrupt(0, port);
-	mod_timer(&pp->tmr, jiffies + uart_poll_timeout(port));
+	timer_mod(&pp->tmr, jiffies + uart_poll_timeout(port));
 }
 
 static void altera_uart_config_port(struct uart_port *port, int flags)
@@ -299,7 +299,7 @@ static int altera_uart_startup(struct uart_port *port)
 
 	if (!port->irq) {
 		timer_setup(&pp->tmr, altera_uart_timer, 0);
-		mod_timer(&pp->tmr, jiffies + uart_poll_timeout(port));
+		timer_mod(&pp->tmr, jiffies + uart_poll_timeout(port));
 	} else {
 		int ret;
 
diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 6b870db7230d..711604f7e1e0 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -1086,7 +1086,7 @@ static void pl011_dma_rx_poll(struct timer_list *t)
 		dmaengine_terminate_all(rxchan);
 		timer_delete(&uap->dmarx.timer);
 	} else {
-		mod_timer(&uap->dmarx.timer,
+		timer_mod(&uap->dmarx.timer,
 			  jiffies + msecs_to_jiffies(uap->dmarx.poll_rate));
 	}
 }
@@ -1157,7 +1157,7 @@ static void pl011_dma_startup(struct uart_amba_port *uap)
 				"could not trigger initial RX DMA job, fall back to interrupt mode\n");
 		if (uap->dmarx.poll_rate) {
 			timer_setup(&uap->dmarx.timer, pl011_dma_rx_poll, 0);
-			mod_timer(&uap->dmarx.timer,
+			timer_mod(&uap->dmarx.timer,
 				  jiffies + msecs_to_jiffies(uap->dmarx.poll_rate));
 			uap->dmarx.last_residue = PL011_DMA_BUFFER_SIZE;
 			uap->dmarx.last_jiffies = jiffies;
@@ -1478,7 +1478,7 @@ __acquires(&uap->port.lock)
 			if (uap->dmarx.poll_rate) {
 				uap->dmarx.last_jiffies = jiffies;
 				uap->dmarx.last_residue	= PL011_DMA_BUFFER_SIZE;
-				mod_timer(&uap->dmarx.timer,
+				timer_mod(&uap->dmarx.timer,
 					  jiffies + msecs_to_jiffies(uap->dmarx.poll_rate));
 			}
 #endif
diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 3b4fb5f8a1d1..c460fe7347cf 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -1272,7 +1272,7 @@ static void atmel_uart_timer_callback(struct timer_list *t)
 
 	if (!atomic_read(&atmel_port->tasklet_shutdown)) {
 		tasklet_schedule(&atmel_port->tasklet_rx);
-		mod_timer(&atmel_port->uart_timer,
+		timer_mod(&atmel_port->uart_timer,
 			  jiffies + uart_poll_timeout(port));
 	}
 }
@@ -1943,7 +1943,7 @@ static int atmel_startup(struct uart_port *port)
 	if (atmel_use_pdc_rx(port)) {
 		/* set UART timeout */
 		if (!atmel_port->has_hw_timer) {
-			mod_timer(&atmel_port->uart_timer,
+			timer_mod(&atmel_port->uart_timer,
 					jiffies + uart_poll_timeout(port));
 		/* set USART timeout */
 		} else {
@@ -1959,7 +1959,7 @@ static int atmel_startup(struct uart_port *port)
 	} else if (atmel_use_dma_rx(port)) {
 		/* set UART timeout */
 		if (!atmel_port->has_hw_timer) {
-			mod_timer(&atmel_port->uart_timer,
+			timer_mod(&atmel_port->uart_timer,
 					jiffies + uart_poll_timeout(port));
 		/* set USART timeout */
 		} else {
diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index 549b355cd8d2..4c5973961788 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -1241,7 +1241,7 @@ static void lpuart_copy_rx_to_tty(struct lpuart_port *sport)
 
 	tty_flip_buffer_push(port);
 	if (!sport->dma_idle_int)
-		mod_timer(&sport->lpuart_timer, jiffies + sport->dma_rx_timeout);
+		timer_mod(&sport->lpuart_timer, jiffies + sport->dma_rx_timeout);
 }
 
 static void lpuart_dma_rx_complete(void *arg)
@@ -1325,7 +1325,7 @@ static void lpuart_timer_func(struct timer_list *t)
 	if ((count != 0) && (sport->last_residue == state.residue))
 		lpuart_copy_rx_to_tty(sport);
 	else
-		mod_timer(&sport->lpuart_timer,
+		timer_mod(&sport->lpuart_timer,
 			  jiffies + sport->dma_rx_timeout);
 
 	if (uart_port_trylock_irqsave(&sport->port, &flags)) {
diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index bd02ee898f5d..bca37f204c96 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -523,7 +523,7 @@ static void imx_uart_enable_ms(struct uart_port *port)
 {
 	struct imx_port *sport = to_imx_port(port);
 
-	mod_timer(&sport->timer, jiffies);
+	timer_mod(&sport->timer, jiffies);
 
 	mctrl_gpio_enable_ms(sport->gpios);
 }
@@ -1173,7 +1173,7 @@ static void imx_uart_timeout(struct timer_list *t)
 		imx_uart_mctrl_check(sport);
 		uart_port_unlock_irqrestore(&sport->port, flags);
 
-		mod_timer(&sport->timer, jiffies + MCTRL_TIMEOUT);
+		timer_mod(&sport->timer, jiffies + MCTRL_TIMEOUT);
 	}
 }
 
diff --git a/drivers/tty/serial/liteuart.c b/drivers/tty/serial/liteuart.c
index 6429e8f11f36..81b632fe1224 100644
--- a/drivers/tty/serial/liteuart.c
+++ b/drivers/tty/serial/liteuart.c
@@ -156,7 +156,7 @@ static void liteuart_timer(struct timer_list *t)
 	struct uart_port *port = &uart->port;
 
 	liteuart_interrupt(0, port);
-	mod_timer(&uart->timer, jiffies + uart_poll_timeout(port));
+	timer_mod(&uart->timer, jiffies + uart_poll_timeout(port));
 }
 
 static unsigned int liteuart_tx_empty(struct uart_port *port)
@@ -202,7 +202,7 @@ static int liteuart_startup(struct uart_port *port)
 
 	if (!port->irq) {
 		timer_setup(&uart->timer, liteuart_timer, 0);
-		mod_timer(&uart->timer, jiffies + uart_poll_timeout(port));
+		timer_mod(&uart->timer, jiffies + uart_poll_timeout(port));
 	}
 
 	return 0;
diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index 52ab244c2515..2b452789d0df 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -311,7 +311,7 @@ static void max3100_timeout(struct timer_list *t)
 	struct max3100_port *s = timer_container_of(s, t, timer);
 
 	max3100_dowork(s);
-	mod_timer(&s->timer, jiffies + uart_poll_timeout(&s->port));
+	timer_mod(&s->timer, jiffies + uart_poll_timeout(&s->port));
 }
 
 static irqreturn_t max3100_irq(int irqno, void *dev_id)
@@ -328,7 +328,7 @@ static void max3100_enable_ms(struct uart_port *port)
 {
 	struct max3100_port *s = to_max3100_port(port);
 
-	mod_timer(&s->timer, jiffies);
+	timer_mod(&s->timer, jiffies);
 	dev_dbg(&s->spi->dev, "%s\n", __func__);
 }
 
diff --git a/drivers/tty/serial/mux.c b/drivers/tty/serial/mux.c
index b417faead20f..23e1134f7b74 100644
--- a/drivers/tty/serial/mux.c
+++ b/drivers/tty/serial/mux.c
@@ -360,7 +360,7 @@ static void mux_poll(struct timer_list *unused)
 		mux_write(&mux_ports[i].port);
 	}
 
-	mod_timer(&mux_timer, jiffies + MUX_POLL_DELAY);
+	timer_mod(&mux_timer, jiffies + MUX_POLL_DELAY);
 }
 
 
@@ -544,7 +544,7 @@ static int __init mux_init(void)
 	if(port_cnt > 0) {
 		/* Start the Mux timer */
 		timer_setup(&mux_timer, mux_poll, 0);
-		mod_timer(&mux_timer, jiffies + MUX_POLL_DELAY);
+		timer_mod(&mux_timer, jiffies + MUX_POLL_DELAY);
 
 #ifdef CONFIG_SERIAL_MUX_CONSOLE
 	        register_console(&mux_console);
diff --git a/drivers/tty/serial/sa1100.c b/drivers/tty/serial/sa1100.c
index 72b1bb76415c..02013f3104d5 100644
--- a/drivers/tty/serial/sa1100.c
+++ b/drivers/tty/serial/sa1100.c
@@ -119,7 +119,7 @@ static void sa1100_timeout(struct timer_list *t)
 		sa1100_mctrl_check(sport);
 		uart_port_unlock_irqrestore(&sport->port, flags);
 
-		mod_timer(&sport->timer, jiffies + MCTRL_TIMEOUT);
+		timer_mod(&sport->timer, jiffies + MCTRL_TIMEOUT);
 	}
 }
 
@@ -172,7 +172,7 @@ static void sa1100_enable_ms(struct uart_port *port)
 	struct sa1100_port *sport =
 		container_of(port, struct sa1100_port, port);
 
-	mod_timer(&sport->timer, jiffies);
+	timer_mod(&sport->timer, jiffies);
 
 	mctrl_gpio_enable_ms(sport->gpios);
 }
diff --git a/drivers/tty/serial/sccnxp.c b/drivers/tty/serial/sccnxp.c
index 4ceca11ce600..4d01ea194da3 100644
--- a/drivers/tty/serial/sccnxp.c
+++ b/drivers/tty/serial/sccnxp.c
@@ -507,7 +507,7 @@ static void sccnxp_timer(struct timer_list *t)
 	sccnxp_handle_events(s);
 	spin_unlock_irqrestore(&s->lock, flags);
 
-	mod_timer(&s->timer, jiffies + usecs_to_jiffies(s->pdata.poll_time_us));
+	timer_mod(&s->timer, jiffies + usecs_to_jiffies(s->pdata.poll_time_us));
 }
 
 static irqreturn_t sccnxp_ist(int irq, void *dev_id)
@@ -1012,7 +1012,7 @@ static int sccnxp_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Unable to reguest IRQ %i\n", s->irq);
 	} else {
 		timer_setup(&s->timer, sccnxp_timer, 0);
-		mod_timer(&s->timer, jiffies +
+		timer_mod(&s->timer, jiffies +
 			  usecs_to_jiffies(s->pdata.poll_time_us));
 		return 0;
 	}
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 791e59a4e4ea..3b5d235686ae 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1827,7 +1827,7 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 		if (!scif_rtrg_enabled(port))
 			scif_set_rtrg(port, s->rx_trigger);
 
-		mod_timer(&s->rx_fifo_timer, jiffies + DIV_ROUND_UP(
+		timer_mod(&s->rx_fifo_timer, jiffies + DIV_ROUND_UP(
 			  s->rx_frame * HZ * s->rx_fifo_timeout, 1000000));
 	}
 
diff --git a/drivers/tty/synclink_gt.c b/drivers/tty/synclink_gt.c
index 3865b10d2d43..6d5992b96af5 100644
--- a/drivers/tty/synclink_gt.c
+++ b/drivers/tty/synclink_gt.c
@@ -742,7 +742,7 @@ static void update_tx_timer(struct slgt_info *info)
 	 */
 	if (info->params.mode == MGSL_MODE_HDLC) {
 		int timeout  = (tbuf_bytes(info) * 7) + 1000;
-		mod_timer(&info->tx_timer, jiffies + msecs_to_jiffies(timeout));
+		timer_mod(&info->tx_timer, jiffies + msecs_to_jiffies(timeout));
 	}
 }
 
@@ -1800,7 +1800,7 @@ static void rx_async(struct slgt_info *info)
 		if (i < count) {
 			/* receive buffer not completed */
 			info->rbuf_index += i;
-			mod_timer(&info->rx_timer, jiffies + 1);
+			timer_mod(&info->rx_timer, jiffies + 1);
 			break;
 		}
 
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index a52d77ca5314..8ff6be11dfdb 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -725,7 +725,7 @@ static void sysrq_handle_reset_request(struct sysrq_state *state)
 		__handle_sysrq(sysrq_xlate[KEY_B], false);
 
 	if (sysrq_reset_downtime_ms)
-		mod_timer(&state->keyreset_timer,
+		timer_mod(&state->keyreset_timer,
 			jiffies + msecs_to_jiffies(sysrq_reset_downtime_ms));
 	else
 		sysrq_do_reset(&state->keyreset_timer);
diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
index ae92e6a50a65..acb72c5d89b8 100644
--- a/drivers/tty/vt/keyboard.c
+++ b/drivers/tty/vt/keyboard.c
@@ -280,7 +280,7 @@ void kd_mksound(unsigned int hz, unsigned int ticks)
 	input_handler_for_each_handle(&kbd_handler, &hz, kd_sound_helper);
 
 	if (hz && ticks)
-		mod_timer(&kd_mksound_timer, jiffies + ticks);
+		timer_mod(&kd_mksound_timer, jiffies + ticks);
 }
 EXPORT_SYMBOL(kd_mksound);
 
diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index f5642b3038e4..36724bba0ed0 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -3651,7 +3651,7 @@ static int __init con_init(void)
 
 	if (blankinterval) {
 		blank_state = blank_normal_wait;
-		mod_timer(&console_timer, jiffies + (blankinterval * HZ));
+		timer_mod(&console_timer, jiffies + (blankinterval * HZ));
 	}
 
 	for (currcons = 0; currcons < MIN_NR_CONSOLES; currcons++) {
@@ -4517,7 +4517,7 @@ void do_blank_screen(int entering_gfx)
 
 	if (vesa_off_interval && vesa_blank_mode) {
 		blank_state = blank_vesa_wait;
-		mod_timer(&console_timer, jiffies + vesa_off_interval);
+		timer_mod(&console_timer, jiffies + vesa_off_interval);
 	}
 	vt_event_post(VT_EVENT_BLANK, vc->vc_num, vc->vc_num);
 }
@@ -4553,7 +4553,7 @@ void do_unblank_screen(int leaving_gfx)
 		return; /* but leave console_blanked != 0 */
 
 	if (blankinterval) {
-		mod_timer(&console_timer, jiffies + (blankinterval * HZ));
+		timer_mod(&console_timer, jiffies + (blankinterval * HZ));
 		blank_state = blank_normal_wait;
 	}
 
@@ -4614,7 +4614,7 @@ void poke_blanked_console(void)
 	if (console_blanked)
 		unblank_screen();
 	else if (blankinterval) {
-		mod_timer(&console_timer, jiffies + (blankinterval * HZ));
+		timer_mod(&console_timer, jiffies + (blankinterval * HZ));
 		blank_state = blank_normal_wait;
 	}
 }
diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index c23023465dfc..2006a580061d 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -595,7 +595,7 @@ static int cxacru_start_wait_urb(struct urb *urb, struct completion *done,
 	};
 
 	timer_setup_on_stack(&timer.timer, cxacru_timeout_kill, 0);
-	mod_timer(&timer.timer, jiffies + msecs_to_jiffies(CMD_TIMEOUT));
+	timer_mod(&timer.timer, jiffies + msecs_to_jiffies(CMD_TIMEOUT));
 	wait_for_completion(done);
 	timer_delete_sync(&timer.timer);
 	destroy_timer_on_stack(&timer.timer);
diff --git a/drivers/usb/atm/speedtch.c b/drivers/usb/atm/speedtch.c
index 2f379479d8c4..110aeb903139 100644
--- a/drivers/usb/atm/speedtch.c
+++ b/drivers/usb/atm/speedtch.c
@@ -566,7 +566,7 @@ static void speedtch_status_poll(struct timer_list *t)
 
 	/* The following check is racy, but the race is harmless */
 	if (instance->poll_delay < MAX_POLL_DELAY)
-		mod_timer(&instance->status_check_timer, jiffies + msecs_to_jiffies(instance->poll_delay));
+		timer_mod(&instance->status_check_timer, jiffies + msecs_to_jiffies(instance->poll_delay));
 	else
 		atm_warn(instance->usbatm, "Too many failures - disabling line status polling\n");
 }
@@ -586,7 +586,7 @@ static void speedtch_resubmit_int(struct timer_list *t)
 			schedule_work(&instance->status_check_work);
 		else {
 			atm_dbg(instance->usbatm, "%s: usb_submit_urb failed with result %d\n", __func__, ret);
-			mod_timer(&instance->resubmit_timer, jiffies + msecs_to_jiffies(RESUBMIT_DELAY));
+			timer_mod(&instance->resubmit_timer, jiffies + msecs_to_jiffies(RESUBMIT_DELAY));
 		}
 	}
 }
@@ -641,7 +641,7 @@ static void speedtch_handle_int(struct urb *int_urb)
 fail:
 	int_urb = instance->int_urb;
 	if (int_urb)
-		mod_timer(&instance->resubmit_timer, jiffies + msecs_to_jiffies(RESUBMIT_DELAY));
+		timer_mod(&instance->resubmit_timer, jiffies + msecs_to_jiffies(RESUBMIT_DELAY));
 }
 
 static int speedtch_atm_start(struct usbatm_data *usbatm, struct atm_dev *atm_dev)
@@ -676,7 +676,7 @@ static int speedtch_atm_start(struct usbatm_data *usbatm, struct atm_dev *atm_de
 	}
 
 	/* Start status polling */
-	mod_timer(&instance->status_check_timer, jiffies + msecs_to_jiffies(1000));
+	timer_mod(&instance->status_check_timer, jiffies + msecs_to_jiffies(1000));
 
 	return 0;
 }
diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index 5f3ad9a99d9e..949fb8875c5d 100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -234,7 +234,7 @@ static int usbatm_submit_urb(struct urb *urb)
 		spin_unlock_irq(&channel->lock);
 
 		/* make sure the channel doesn't stall */
-		mod_timer(&channel->delay, jiffies + msecs_to_jiffies(THROTTLE_MSECS));
+		timer_mod(&channel->delay, jiffies + msecs_to_jiffies(THROTTLE_MSECS));
 	}
 
 	return ret;
@@ -267,7 +267,7 @@ static void usbatm_complete(struct urb *urb)
 			atm_warn(channel->usbatm, "%s: urb 0x%p failed (%d)!\n",
 				__func__, urb, status);
 		/* throttle processing in case of an error */
-		mod_timer(&channel->delay, jiffies + msecs_to_jiffies(THROTTLE_MSECS));
+		timer_mod(&channel->delay, jiffies + msecs_to_jiffies(THROTTLE_MSECS));
 	} else
 		tasklet_schedule(&channel->tasklet);
 }
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index c22de97432a0..35296acb1a87 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -768,7 +768,7 @@ void usb_hcd_poll_rh_status(struct usb_hcd *hcd)
 	 * fire at the same time to give the CPU a break in between */
 	if (hcd->uses_new_polling ? HCD_POLL_RH(hcd) :
 			(length == 0 && hcd->status_urb != NULL))
-		mod_timer (&hcd->rh_timer, (jiffies/(HZ/4) + 1) * (HZ/4));
+		timer_mod (&hcd->rh_timer, (jiffies/(HZ/4) + 1) * (HZ/4));
 }
 EXPORT_SYMBOL_GPL(usb_hcd_poll_rh_status);
 
@@ -802,11 +802,11 @@ static int rh_queue_status (struct usb_hcd *hcd, struct urb *urb)
 	hcd->status_urb = urb;
 	urb->hcpriv = hcd;	/* indicate it's queued */
 	if (!hcd->uses_new_polling)
-		mod_timer(&hcd->rh_timer, (jiffies/(HZ/4) + 1) * (HZ/4));
+		timer_mod(&hcd->rh_timer, (jiffies/(HZ/4) + 1) * (HZ/4));
 
 	/* If a status change has already occurred, report it ASAP */
 	else if (HCD_POLL_PENDING(hcd))
-		mod_timer(&hcd->rh_timer, jiffies);
+		timer_mod(&hcd->rh_timer, jiffies);
 	retval = 0;
  done:
 	spin_unlock_irqrestore (&hcd_root_hub_lock, flags);
@@ -2432,7 +2432,7 @@ int usb_bus_start_enum(struct usb_bus *bus, unsigned port_num)
 	 * it may issue others, until at least 50 msecs have passed.
 	 */
 	if (status == 0)
-		mod_timer(&hcd->rh_timer, jiffies + msecs_to_jiffies(10));
+		timer_mod(&hcd->rh_timer, jiffies + msecs_to_jiffies(10));
 	return status;
 }
 EXPORT_SYMBOL_GPL(usb_bus_start_enum);
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 340c23509d07..19990eaaa75b 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -689,7 +689,7 @@ static void hub_resubmit_irq_urb(struct usb_hub *hub)
 	if (status && status != -ENODEV && status != -EPERM &&
 	    status != -ESHUTDOWN) {
 		dev_err(hub->intfdev, "resubmit --> %d\n", status);
-		mod_timer(&hub->irq_urb_retry, jiffies + HZ);
+		timer_mod(&hub->irq_urb_retry, jiffies + HZ);
 	}
 
 	spin_unlock_irqrestore(&hub->irq_urb_lock, flags);
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 7d3e641806f8..fadf761d5c28 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -478,7 +478,7 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
 			if (hsotg->reset_phy_on_wake)
 				dwc2_host_schedule_phy_reset(hsotg);
 
-			mod_timer(&hsotg->wkp_timer,
+			timer_mod(&hsotg->wkp_timer,
 				  jiffies + msecs_to_jiffies(71));
 		} else {
 			/* Change to L0 state */
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 30eb8506617c..9583dc4abb1e 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5896,7 +5896,7 @@ int dwc2_host_exit_partial_power_down(struct dwc2_hsotg *hsotg,
 		/* Connect hcd. */
 		dwc2_hcd_connect(hsotg);
 
-		mod_timer(&hsotg->wkp_timer,
+		timer_mod(&hsotg->wkp_timer,
 			  jiffies + msecs_to_jiffies(71));
 	}
 
@@ -5989,7 +5989,7 @@ void dwc2_host_exit_clock_gating(struct dwc2_hsotg *hsotg, int rem_wakeup)
 		hsotg->bus_suspended = false;
 		hsotg->lx_state = DWC2_L0;
 	} else {
-		mod_timer(&hsotg->wkp_timer,
+		timer_mod(&hsotg->wkp_timer,
 			  jiffies + msecs_to_jiffies(71));
 	}
 }
diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index 904fe0632b34..6c0f196f7348 100644
--- a/drivers/usb/dwc2/hcd_queue.c
+++ b/drivers/usb/dwc2/hcd_queue.c
@@ -1370,7 +1370,7 @@ static void dwc2_deschedule_periodic(struct dwc2_hsotg *hsotg,
 	 * passed (otherwise if the jiffy counter might tick right after we
 	 * read it and we'll get no delay).
 	 */
-	did_modify = mod_timer(&qh->unreserve_timer,
+	did_modify = timer_mod(&qh->unreserve_timer,
 			       jiffies + DWC2_UNRESERVE_DELAY + 1);
 	WARN_ON(did_modify);
 	qh->unreserve_pending = 1;
diff --git a/drivers/usb/fotg210/fotg210-hcd.c b/drivers/usb/fotg210/fotg210-hcd.c
index 64c4965a160f..79dde808da05 100644
--- a/drivers/usb/fotg210/fotg210-hcd.c
+++ b/drivers/usb/fotg210/fotg210-hcd.c
@@ -1566,7 +1566,7 @@ static int fotg210_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				fotg210->reset_done[wIndex] = jiffies
 						+ msecs_to_jiffies(20);
 				/* check the port again */
-				mod_timer(&fotg210_to_hcd(fotg210)->rh_timer,
+				timer_mod(&fotg210_to_hcd(fotg210)->rh_timer,
 						fotg210->reset_done[wIndex]);
 			}
 
@@ -5205,7 +5205,7 @@ static irqreturn_t fotg210_irq(struct usb_hcd *hcd)
 			fotg210->reset_done[0] = jiffies + msecs_to_jiffies(25);
 			set_bit(0, &fotg210->resuming_ports);
 			fotg210_dbg(fotg210, "port 1 remote wakeup\n");
-			mod_timer(&hcd->rh_timer, fotg210->reset_done[0]);
+			timer_mod(&hcd->rh_timer, fotg210->reset_done[0]);
 		}
 	}
 
diff --git a/drivers/usb/gadget/legacy/zero.c b/drivers/usb/gadget/legacy/zero.c
index a05785bdeb30..bce1934fb453 100644
--- a/drivers/usb/gadget/legacy/zero.c
+++ b/drivers/usb/gadget/legacy/zero.c
@@ -181,7 +181,7 @@ static void zero_suspend(struct usb_composite_dev *cdev)
 			(autoresume_step_ms > max_autoresume * 1000))
 				autoresume_step_ms = autoresume * 1000;
 
-		mod_timer(&autoresume_timer, jiffies +
+		timer_mod(&autoresume_timer, jiffies +
 			msecs_to_jiffies(autoresume_step_ms));
 		DBG(cdev, "suspend, wakeup in %d milliseconds\n",
 			autoresume_step_ms);
diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index 42b94d858e37..a1e69efcddb0 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -1536,7 +1536,7 @@ static void at91_vbus_timer_work(struct work_struct *work)
 	at91_vbus_update(udc, gpiod_get_value_cansleep(udc->board.vbus_pin));
 
 	if (!timer_pending(&udc->vbus_timer))
-		mod_timer(&udc->vbus_timer, jiffies + VBUS_POLL_TIMEOUT);
+		timer_mod(&udc->vbus_timer, jiffies + VBUS_POLL_TIMEOUT);
 }
 
 static void at91_vbus_timer(struct timer_list *t)
@@ -1889,7 +1889,7 @@ static int at91udc_probe(struct platform_device *pdev)
 		if (udc->board.vbus_polled) {
 			INIT_WORK(&udc->vbus_timer_work, at91_vbus_timer_work);
 			timer_setup(&udc->vbus_timer, at91_vbus_timer, 0);
-			mod_timer(&udc->vbus_timer,
+			timer_mod(&udc->vbus_timer,
 				  jiffies + VBUS_POLL_TIMEOUT);
 		} else {
 			retval = devm_request_irq(dev,
diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 59e0e4f551dd..de50a226ba3b 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -871,7 +871,7 @@ static int dummy_wakeup(struct usb_gadget *_gadget)
 	/* hub notices our request, issues downstream resume, etc */
 	dum_hcd->resuming = 1;
 	dum_hcd->re_timeout = jiffies + msecs_to_jiffies(20);
-	mod_timer(&dummy_hcd_to_hcd(dum_hcd)->rh_timer, dum_hcd->re_timeout);
+	timer_mod(&dummy_hcd_to_hcd(dum_hcd)->rh_timer, dum_hcd->re_timeout);
 	return 0;
 }
 
diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index 715791737499..644f93462de9 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1234,7 +1234,7 @@ static irqreturn_t m66592_irq(int irq, void *_m66592)
 					& M66592_VBSTS;
 			m66592->scount = M66592_MAX_SAMPLING;
 
-			mod_timer(&m66592->timer,
+			timer_mod(&m66592->timer,
 					jiffies + msecs_to_jiffies(50));
 		}
 		if (intsts0 & M66592_DVSQ)
@@ -1282,13 +1282,13 @@ static void m66592_timer(struct timer_list *t)
 				else
 					m66592_usb_disconnect(m66592);
 			} else {
-				mod_timer(&m66592->timer,
+				timer_mod(&m66592->timer,
 					jiffies + msecs_to_jiffies(50));
 			}
 		} else {
 			m66592->scount = M66592_MAX_SAMPLING;
 			m66592->old_vbus = tmp;
-			mod_timer(&m66592->timer,
+			timer_mod(&m66592->timer,
 					jiffies + msecs_to_jiffies(50));
 		}
 	}
@@ -1463,7 +1463,7 @@ static int m66592_udc_start(struct usb_gadget *g,
 		m66592->old_vbus = m66592_read(m66592,
 					 M66592_INTSTS0) & M66592_VBSTS;
 		m66592->scount = M66592_MAX_SAMPLING;
-		mod_timer(&m66592->timer, jiffies + msecs_to_jiffies(50));
+		timer_mod(&m66592->timer, jiffies + msecs_to_jiffies(50));
 	}
 
 	return 0;
diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index 062bf2b57d2e..1b172e9be675 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -1883,7 +1883,7 @@ static void pio_out_timer(struct timer_list *t)
 		} else
 			deselect_ep();
 	}
-	mod_timer(&ep->timer, PIO_OUT_TIMEOUT);
+	timer_mod(&ep->timer, PIO_OUT_TIMEOUT);
 	spin_unlock_irqrestore(&ep->udc->lock, flags);
 }
 
@@ -1934,7 +1934,7 @@ static irqreturn_t omap_udc_pio_irq(int irq, void *_dev)
 			omap_writew(UDC_SET_FIFO_EN, UDC_CTRL);
 			ep->ackwait = 1 + ep->double_buf;
 		}
-		mod_timer(&ep->timer, PIO_OUT_TIMEOUT);
+		timer_mod(&ep->timer, PIO_OUT_TIMEOUT);
 	}
 
 	/* then IN transfers */
diff --git a/drivers/usb/gadget/udc/pxa25x_udc.h b/drivers/usb/gadget/udc/pxa25x_udc.h
index 6ab6047edc83..6bf534f8245c 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.h
+++ b/drivers/usb/gadget/udc/pxa25x_udc.h
@@ -107,7 +107,7 @@ struct pxa25x_udc {
 						suspended : 1,
 						active : 1;
 
-#define start_watchdog(dev) mod_timer(&dev->timer, jiffies + (HZ/200))
+#define start_watchdog(dev) timer_mod(&dev->timer, jiffies + (HZ/200))
 	struct timer_list			timer;
 
 	struct device				*dev;
diff --git a/drivers/usb/gadget/udc/r8a66597-udc.c b/drivers/usb/gadget/udc/r8a66597-udc.c
index e5c2630e3711..4aa631fa66c3 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.c
+++ b/drivers/usb/gadget/udc/r8a66597-udc.c
@@ -1491,7 +1491,7 @@ static irqreturn_t r8a66597_irq(int irq, void *_r8a66597)
 					& VBSTS;
 			r8a66597->scount = R8A66597_MAX_SAMPLING;
 
-			mod_timer(&r8a66597->timer,
+			timer_mod(&r8a66597->timer,
 					jiffies + msecs_to_jiffies(50));
 		}
 		if (intsts0 & DVSQ)
@@ -1532,13 +1532,13 @@ static void r8a66597_timer(struct timer_list *t)
 				else
 					r8a66597_usb_disconnect(r8a66597);
 			} else {
-				mod_timer(&r8a66597->timer,
+				timer_mod(&r8a66597->timer,
 					jiffies + msecs_to_jiffies(50));
 			}
 		} else {
 			r8a66597->scount = R8A66597_MAX_SAMPLING;
 			r8a66597->old_vbus = tmp;
-			mod_timer(&r8a66597->timer,
+			timer_mod(&r8a66597->timer,
 					jiffies + msecs_to_jiffies(50));
 		}
 	}
@@ -1742,7 +1742,7 @@ static int r8a66597_start(struct usb_gadget *gadget,
 		r8a66597->old_vbus = r8a66597_read(r8a66597,
 					 INTSTS0) & VBSTS;
 		r8a66597->scount = R8A66597_MAX_SAMPLING;
-		mod_timer(&r8a66597->timer, jiffies + msecs_to_jiffies(50));
+		timer_mod(&r8a66597->timer, jiffies + msecs_to_jiffies(50));
 	}
 
 	return 0;
diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
index e993b3011fce..0d2893f64118 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -1035,7 +1035,7 @@ static void udc_set_rde(struct udc *dev)
 	/* stop RDE timer */
 	if (timer_pending(&udc_timer)) {
 		set_rde = 0;
-		mod_timer(&udc_timer, jiffies - 1);
+		timer_mod(&udc_timer, jiffies - 1);
 	}
 	/* set RDE */
 	tmp = readl(&dev->regs->ctl);
@@ -1137,7 +1137,7 @@ udc_queue(struct usb_ep *usbep, struct usb_request *usbreq, gfp_t gfp)
 				/* stop RDE timer */
 				if (timer_pending(&udc_timer)) {
 					set_rde = 0;
-					mod_timer(&udc_timer, jiffies - 1);
+					timer_mod(&udc_timer, jiffies - 1);
 				}
 				/* clear RDE */
 				tmp = readl(&dev->regs->ctl);
@@ -1463,11 +1463,11 @@ void udc_basic_init(struct udc *dev)
 	/* stop RDE timer */
 	if (timer_pending(&udc_timer)) {
 		set_rde = 0;
-		mod_timer(&udc_timer, jiffies - 1);
+		timer_mod(&udc_timer, jiffies - 1);
 	}
 	/* stop poll stall timer */
 	if (timer_pending(&udc_pollstall_timer))
-		mod_timer(&udc_pollstall_timer, jiffies - 1);
+		timer_mod(&udc_pollstall_timer, jiffies - 1);
 	/* disable DMA */
 	tmp = readl(&dev->regs->ctl);
 	tmp &= AMD_UNMASK_BIT(UDC_DEVCTL_RDE);
@@ -1882,11 +1882,11 @@ static void activate_control_endpoints(struct udc *dev)
 		/* stop RDE timer */
 		if (timer_pending(&udc_timer)) {
 			set_rde = 0;
-			mod_timer(&udc_timer, jiffies - 1);
+			timer_mod(&udc_timer, jiffies - 1);
 		}
 		/* stop pollstall timer */
 		if (timer_pending(&udc_pollstall_timer))
-			mod_timer(&udc_pollstall_timer, jiffies - 1);
+			timer_mod(&udc_pollstall_timer, jiffies - 1);
 		/* enable DMA */
 		tmp = readl(&dev->regs->ctl);
 		tmp |= AMD_BIT(UDC_DEVCTL_MODE)
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 6d1d190c914d..a135d1ea6097 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -832,7 +832,7 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
 			set_bit(i, &ehci->resuming_ports);
 			ehci_dbg (ehci, "port %d remote wakeup\n", i + 1);
 			usb_hcd_start_port_resume(&hcd->self, i);
-			mod_timer(&hcd->rh_timer, ehci->reset_done[i]);
+			timer_mod(&hcd->rh_timer, ehci->reset_done[i]);
 		}
 	}
 
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index 1aee392e8492..900beda5855a 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -686,7 +686,7 @@ ehci_hub_status_data (struct usb_hcd *hcd, char *buf)
 
 	/* If a resume is in progress, make sure it can finish */
 	if (ehci->resuming_ports)
-		mod_timer(&hcd->rh_timer, jiffies + msecs_to_jiffies(25));
+		timer_mod(&hcd->rh_timer, jiffies + msecs_to_jiffies(25));
 
 	spin_unlock_irqrestore (&ehci->lock, flags);
 	return status ? retval : 0;
@@ -913,7 +913,7 @@ int ehci_hub_control(
 				usb_hcd_start_port_resume(&hcd->self, wIndex);
 				set_bit(wIndex, &ehci->resuming_ports);
 				/* check the port again */
-				mod_timer(&ehci_to_hcd(ehci)->rh_timer,
+				timer_mod(&ehci_to_hcd(ehci)->rh_timer,
 						ehci->reset_done[wIndex]);
 			}
 
diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index 4f69c7231515..e967d6599735 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -212,14 +212,14 @@ static void quirk_poll_timer(struct timer_list *t)
 		schedule_delayed_work(&priv->poll_work, msecs_to_jiffies(5));
 	}
 
-	mod_timer(&priv->poll_timer, jiffies + HZ);
+	timer_mod(&priv->poll_timer, jiffies + HZ);
 }
 
 static void quirk_poll_init(struct ehci_platform_priv *priv)
 {
 	INIT_DELAYED_WORK(&priv->poll_work, quirk_poll_work);
 	timer_setup(&priv->poll_timer, quirk_poll_timer, 0);
-	mod_timer(&priv->poll_timer, jiffies + HZ);
+	timer_mod(&priv->poll_timer, jiffies + HZ);
 }
 
 static void quirk_poll_end(struct ehci_platform_priv *priv)
diff --git a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
index 71c22c4bd163..e5af484c4de0 100644
--- a/drivers/usb/host/isp116x-hcd.c
+++ b/drivers/usb/host/isp116x-hcd.c
@@ -620,7 +620,7 @@ static irqreturn_t isp116x_irq(struct usb_hcd *hcd)
 			/* When root hub or any of its ports is going
 			   to come out of suspend, it may take more
 			   than 10ms for status bits to stabilize. */
-			mod_timer(&hcd->rh_timer, jiffies
+			timer_mod(&hcd->rh_timer, jiffies
 				  + msecs_to_jiffies(20) + 1);
 		if (intstat & HCINT_RD) {
 			DBG("---- remote wakeup\n");
diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index 5c662f8e7896..6b31f199363f 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -235,7 +235,7 @@ static int ohci_urb_enqueue (
 				list_empty(&ohci->eds_in_use) &&
 				!(ohci->flags & OHCI_QUIRK_QEMU)) {
 			ohci->prev_frame_no = ohci_frame_no(ohci);
-			mod_timer(&ohci->io_watchdog,
+			timer_mod(&ohci->io_watchdog,
 					jiffies + IO_WATCHDOG_DELAY);
 		}
 		list_add(&ed->in_use_list, &ohci->eds_in_use);
@@ -861,7 +861,7 @@ static void io_watchdog_func(struct timer_list *t)
 			ohci->prev_wdh_cnt = ohci->wdh_cnt;
 			ohci->prev_donehead = ohci_readl(ohci,
 					&ohci->regs->donehead);
-			mod_timer(&ohci->io_watchdog,
+			timer_mod(&ohci->io_watchdog,
 					jiffies + IO_WATCHDOG_DELAY);
 		}
 	}
diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index 6b7c73eff081..a54b4a22cc32 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -700,7 +700,7 @@ static inline void timer_action(struct oxu_hcd *oxu,
 				&& t > oxu->watchdog.expires
 				&& timer_pending(&oxu->watchdog))
 			return;
-		mod_timer(&oxu->watchdog, t);
+		timer_mod(&oxu->watchdog, t);
 	}
 }
 
@@ -2899,7 +2899,7 @@ static irqreturn_t oxu210_hcd_irq(struct usb_hcd *hcd)
 			oxu->reset_done[i] = jiffies +
 				msecs_to_jiffies(USB_RESUME_TIMEOUT);
 			oxu_dbg(oxu, "port %d remote wakeup\n", i + 1);
-			mod_timer(&hcd->rh_timer, oxu->reset_done[i]);
+			timer_mod(&hcd->rh_timer, oxu->reset_done[i]);
 		}
 	}
 
@@ -3654,7 +3654,7 @@ static int oxu_hub_control(struct usb_hcd *hcd, u16 typeReq,
 				oxu->reset_done[wIndex] = jiffies
 						+ msecs_to_jiffies(20);
 				/* check the port again */
-				mod_timer(&oxu_to_hcd(oxu)->rh_timer,
+				timer_mod(&oxu_to_hcd(oxu)->rh_timer,
 						oxu->reset_done[wIndex]);
 			}
 
diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index 8b71f45ef985..39f9d018a829 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -986,7 +986,7 @@ static void pipe_irq_disable(struct r8a66597 *r8a66597, u16 pipenum)
 
 static void r8a66597_root_hub_start_polling(struct r8a66597 *r8a66597)
 {
-	mod_timer(&r8a66597->rh_timer,
+	timer_mod(&r8a66597->rh_timer,
 			jiffies + msecs_to_jiffies(R8A66597_RH_POLL_TIME));
 }
 
@@ -1258,7 +1258,7 @@ static void set_td_timer(struct r8a66597 *r8a66597, struct r8a66597_td *td)
 			break;
 		}
 
-		mod_timer(&r8a66597->timers[td->pipenum].td,
+		timer_mod(&r8a66597->timers[td->pipenum].td,
 			  jiffies + msecs_to_jiffies(time));
 	}
 }
@@ -1928,7 +1928,7 @@ static int r8a66597_urb_enqueue(struct usb_hcd *hcd,
 	if (request) {
 		if (td->pipe->info.timer_interval) {
 			r8a66597->interval_map |= 1 << td->pipenum;
-			mod_timer(&r8a66597->timers[td->pipenum].interval,
+			timer_mod(&r8a66597->timers[td->pipenum].interval,
 				  jiffies + msecs_to_jiffies(
 					td->pipe->info.timer_interval));
 		} else {
@@ -2220,7 +2220,7 @@ static int r8a66597_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 			r8a66597_mdfy(r8a66597, USBRST, USBRST | UACT,
 				      get_dvstctr_reg(port));
-			mod_timer(&r8a66597->rh_timer,
+			timer_mod(&r8a66597->rh_timer,
 				  jiffies + msecs_to_jiffies(50));
 			}
 			break;
diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index ea3cab99c5d4..ae697980b3c7 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1262,7 +1262,7 @@ sl811h_hub_control(
 			sl811->ctrl1 |= SL11H_CTL1MASK_K;
 			sl811_write(sl811, SL11H_CTLREG1, sl811->ctrl1);
 
-			mod_timer(&sl811->timer, jiffies
+			timer_mod(&sl811->timer, jiffies
 					+ msecs_to_jiffies(USB_RESUME_TIMEOUT));
 			break;
 		case USB_PORT_FEAT_POWER:
@@ -1325,7 +1325,7 @@ sl811h_hub_control(
 			sl811->ctrl1 = SL11H_CTL1MASK_SE0;
 			sl811_write(sl811, SL11H_CTLREG1, sl811->ctrl1);
 			sl811->port1 |= USB_PORT_STAT_RESET;
-			mod_timer(&sl811->timer, jiffies
+			timer_mod(&sl811->timer, jiffies
 					+ msecs_to_jiffies(50));
 			break;
 		default:
diff --git a/drivers/usb/host/uhci-hcd.c b/drivers/usb/host/uhci-hcd.c
index 14e6dfef16c6..2e86294bf2e7 100644
--- a/drivers/usb/host/uhci-hcd.c
+++ b/drivers/usb/host/uhci-hcd.c
@@ -444,7 +444,7 @@ __acquires(uhci->lock)
 	start_rh(uhci);
 
 	/* Restart root hub polling */
-	mod_timer(&uhci_to_hcd(uhci)->rh_timer, jiffies);
+	timer_mod(&uhci_to_hcd(uhci)->rh_timer, jiffies);
 }
 
 static irqreturn_t uhci_irq(struct usb_hcd *hcd)
@@ -488,7 +488,7 @@ static irqreturn_t uhci_irq(struct usb_hcd *hcd)
 
 				/* Force a callback in case there are
 				 * pending unlinks */
-				mod_timer(&hcd->rh_timer, jiffies);
+				timer_mod(&hcd->rh_timer, jiffies);
 			}
 		}
 	}
diff --git a/drivers/usb/host/uhci-hub.c b/drivers/usb/host/uhci-hub.c
index 47106dd8ca7c..fb218fc129c6 100644
--- a/drivers/usb/host/uhci-hub.c
+++ b/drivers/usb/host/uhci-hub.c
@@ -173,7 +173,7 @@ static void uhci_check_ports(struct uhci_hcd *uhci)
 
 				/* Make sure we see the port again
 				 * after the resuming period is over. */
-				mod_timer(&uhci_to_hcd(uhci)->rh_timer,
+				timer_mod(&uhci_to_hcd(uhci)->rh_timer,
 						uhci->ports_timeout);
 			} else if (time_after_eq(jiffies,
 						uhci->ports_timeout)) {
diff --git a/drivers/usb/host/uhci-q.c b/drivers/usb/host/uhci-q.c
index 9480d4ff0111..77b0594855dd 100644
--- a/drivers/usb/host/uhci-q.c
+++ b/drivers/usb/host/uhci-q.c
@@ -29,7 +29,7 @@
 static void uhci_set_next_interrupt(struct uhci_hcd *uhci)
 {
 	if (uhci->is_stopped)
-		mod_timer(&uhci_to_hcd(uhci)->rh_timer, jiffies);
+		timer_mod(&uhci_to_hcd(uhci)->rh_timer, jiffies);
 	uhci->term_td->status |= cpu_to_hc32(uhci, TD_CTRL_IOC);
 }
 
@@ -1783,7 +1783,7 @@ static void uhci_scan_schedule(struct uhci_hcd *uhci)
 	if (uhci->fsbr_is_on && !uhci->fsbr_is_wanted &&
 			!uhci->fsbr_expiring) {
 		uhci->fsbr_expiring = 1;
-		mod_timer(&uhci->fsbr_timer, jiffies + FSBR_OFF_DELAY);
+		timer_mod(&uhci->fsbr_timer, jiffies + FSBR_OFF_DELAY);
 	}
 
 	if (list_empty(&uhci->skel_unlink_qh->node))
diff --git a/drivers/usb/host/xen-hcd.c b/drivers/usb/host/xen-hcd.c
index 1c2a95fe41e5..6194db180aab 100644
--- a/drivers/usb/host/xen-hcd.c
+++ b/drivers/usb/host/xen-hcd.c
@@ -138,7 +138,7 @@ static void xenhcd_timer_action(struct xenhcd_info *info,
 			t = XENHCD_SCAN_JIFFIES;
 			break;
 		}
-		mod_timer(&info->watchdog, t + jiffies);
+		timer_mod(&info->watchdog, t + jiffies);
 	}
 }
 
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index c0f226584a40..4576ee1b9201 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -971,7 +971,7 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 
 			set_bit(wIndex, &bus_state->resuming_ports);
 			port->resume_timestamp = timeout;
-			mod_timer(&hcd->rh_timer, timeout);
+			timer_mod(&hcd->rh_timer, timeout);
 			usb_hcd_start_port_resume(&hcd->self, wIndex);
 		}
 	/* Has resume been signalled for USB_RESUME_TIME yet? */
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5d64c297721c..7fb793afa333 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2072,7 +2072,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 			 * usb device auto-resume latency around ~40ms.
 			 */
 			set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
-			mod_timer(&hcd->rh_timer,
+			timer_mod(&hcd->rh_timer,
 				  port->resume_timestamp);
 			usb_hcd_start_port_resume(&hcd->self, hcd_portnum);
 			bogus_port_status = true;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 172b2ab79557..e22b27a684c7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -401,7 +401,7 @@ static void compliance_mode_recovery(struct timer_list *t)
 	}
 
 	if (xhci->port_status_u0 != ((1 << rhub->num_ports) - 1))
-		mod_timer(&xhci->comp_mode_recovery_timer,
+		timer_mod(&xhci->comp_mode_recovery_timer,
 			jiffies + msecs_to_jiffies(COMP_MODE_RCVRY_MSECS));
 }
 
diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 4803052a9098..0980c3381bac 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -2303,7 +2303,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 				priv->reset_done = jiffies
 						+ msecs_to_jiffies(20);
 				/* check the port again */
-				mod_timer(&hcd->rh_timer, priv->reset_done);
+				timer_mod(&hcd->rh_timer, priv->reset_done);
 			}
 
 			/* resume completed? */
diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
index 65ac91d0595a..18635b9127a1 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -1127,7 +1127,7 @@ static const struct usb_ep_ops isp1760_ep_ops = {
 static void isp1760_udc_connect(struct isp1760_udc *udc)
 {
 	usb_gadget_set_state(&udc->gadget, USB_STATE_POWERED);
-	mod_timer(&udc->vbus_timer, jiffies + ISP1760_VBUS_POLL_INTERVAL);
+	timer_mod(&udc->vbus_timer, jiffies + ISP1760_VBUS_POLL_INTERVAL);
 }
 
 /* Called with the UDC spinlock held. */
@@ -1431,7 +1431,7 @@ static void isp1760_udc_vbus_poll(struct timer_list *t)
 	if (!(isp1760_udc_is_set(udc, DC_VBUSSTAT)))
 		isp1760_udc_disconnect(udc);
 	else if (udc->gadget.state >= USB_STATE_POWERED)
-		mod_timer(&udc->vbus_timer,
+		timer_mod(&udc->vbus_timer,
 			  jiffies + ISP1760_VBUS_POLL_INTERVAL);
 
 	spin_unlock_irqrestore(&udc->lock, flags);
diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 63dba8e344f7..2cf7bad70f39 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -623,7 +623,7 @@ static int perform_sglist(
 
 		if (retval)
 			break;
-		mod_timer(&timeout.timer, jiffies +
+		timer_mod(&timeout.timer, jiffies +
 				msecs_to_jiffies(SIMPLE_IO_TIMEOUT));
 		usb_sg_wait(req);
 		if (!timer_delete_sync(&timeout.timer))
diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index 65ab223a2939..054311b0ebe5 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -159,7 +159,7 @@ static void otg_timer(struct timer_list *t)
 		 * VBUSERR got reported during enumeration" cases.
 		 */
 		if (devctl & MUSB_DEVCTL_VBUS) {
-			mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
+			timer_mod(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
 			break;
 		}
 		musb->xceiv->otg->state = OTG_STATE_A_WAIT_VRISE;
@@ -182,7 +182,7 @@ static void otg_timer(struct timer_list *t)
 		musb_writeb(mregs, MUSB_DEVCTL, devctl | MUSB_DEVCTL_SESSION);
 		devctl = musb_readb(mregs, MUSB_DEVCTL);
 		if (devctl & MUSB_DEVCTL_BDEVICE)
-			mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
+			timer_mod(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
 		else
 			musb->xceiv->otg->state = OTG_STATE_A_IDLE;
 		break;
@@ -218,7 +218,7 @@ static void __maybe_unused da8xx_musb_try_idle(struct musb *musb, unsigned long
 	dev_dbg(musb->controller, "%s inactive, starting idle timer for %u ms\n",
 		usb_otg_state_string(musb->xceiv->otg->state),
 		jiffies_to_msecs(timeout - jiffies));
-	mod_timer(&musb->dev_timer, timeout);
+	timer_mod(&musb->dev_timer, timeout);
 }
 
 static int da8xx_babble_recover(struct musb *musb)
@@ -284,7 +284,7 @@ static irqreturn_t da8xx_musb_interrupt(int irq, void *hci)
 			 */
 			musb->int_usb &= ~MUSB_INTR_VBUSERROR;
 			musb->xceiv->otg->state = OTG_STATE_A_WAIT_VFALL;
-			mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
+			timer_mod(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
 			WARNING("VBUS error workaround (delay coming)\n");
 		} else if (drvvbus) {
 			MUSB_HST_MODE(musb);
@@ -324,7 +324,7 @@ static irqreturn_t da8xx_musb_interrupt(int irq, void *hci)
 
 	/* Poll for ID change */
 	if (musb->xceiv->otg->state == OTG_STATE_B_IDLE)
-		mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
+		timer_mod(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
 
 	spin_unlock_irqrestore(&musb->lock, flags);
 
diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 3e96893bba4a..1a8024a8afce 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -114,7 +114,7 @@ static void otg_timer(struct timer_list *t)
 		if (devctl & MUSB_DEVCTL_BDEVICE) {
 			musb->xceiv->otg->state = OTG_STATE_B_IDLE;
 			MUSB_DEV_MODE(musb);
-			mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
+			timer_mod(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
 		} else {
 			musb->xceiv->otg->state = OTG_STATE_A_IDLE;
 			MUSB_HST_MODE(musb);
@@ -122,7 +122,7 @@ static void otg_timer(struct timer_list *t)
 		break;
 	case OTG_STATE_A_WAIT_VFALL:
 		if (devctl & MUSB_DEVCTL_VBUS) {
-			mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
+			timer_mod(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
 			break;
 		}
 		musb->xceiv->otg->state = OTG_STATE_A_WAIT_VRISE;
@@ -143,7 +143,7 @@ static void otg_timer(struct timer_list *t)
 		musb_writeb(mregs, MUSB_DEVCTL, devctl | MUSB_DEVCTL_SESSION);
 		devctl = musb_readb(mregs, MUSB_DEVCTL);
 		if (devctl & MUSB_DEVCTL_BDEVICE)
-			mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
+			timer_mod(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
 		else
 			musb->xceiv->otg->state = OTG_STATE_A_IDLE;
 		break;
@@ -179,7 +179,7 @@ static void __maybe_unused mpfs_musb_try_idle(struct musb *musb, unsigned long t
 	dev_dbg(musb->controller, "%s inactive, starting idle timer for %u ms\n",
 		usb_otg_state_string(musb->xceiv->otg->state),
 		jiffies_to_msecs(timeout - jiffies));
-	mod_timer(&musb->dev_timer, timeout);
+	timer_mod(&musb->dev_timer, timeout);
 }
 
 static irqreturn_t mpfs_musb_interrupt(int irq, void *__hci)
@@ -203,7 +203,7 @@ static irqreturn_t mpfs_musb_interrupt(int irq, void *__hci)
 
 	/* Poll for ID change */
 	if (musb->xceiv->otg->state == OTG_STATE_B_IDLE)
-		mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
+		timer_mod(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
 
 	spin_unlock_irqrestore(&musb->lock, flags);
 
diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index c7234b236971..657383f35ca5 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -857,7 +857,7 @@ static void musb_handle_intr_suspend(struct musb *musb, u8 devctl)
 		if (musb->is_active) {
 			musb_set_state(musb, OTG_STATE_B_WAIT_ACON);
 			musb_dbg(musb, "HNP: Setting timer for b_ase0_brst");
-			mod_timer(&musb->otg_timer, jiffies
+			timer_mod(&musb->otg_timer, jiffies
 				+ msecs_to_jiffies(
 						OTG_TIME_B_ASE0_BRST));
 		}
@@ -1011,7 +1011,7 @@ static void musb_handle_intr_reset(struct musb *musb)
 			musb_dbg(musb, "HNP: in %s, %d msec timeout",
 				 musb_otg_state_string(musb),
 				TA_WAIT_BCON(musb));
-			mod_timer(&musb->otg_timer, jiffies
+			timer_mod(&musb->otg_timer, jiffies
 				+ msecs_to_jiffies(TA_WAIT_BCON(musb)));
 			break;
 		case OTG_STATE_A_PERIPHERAL:
diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index 12f587ab8511..32a4e3256046 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -141,7 +141,7 @@ static void dsps_mod_timer(struct dsps_glue *glue, int wait_ms)
 	else
 		wait = msecs_to_jiffies(wait_ms);
 
-	mod_timer(&musb->dev_timer, jiffies + wait);
+	timer_mod(&musb->dev_timer, jiffies + wait);
 }
 
 /*
diff --git a/drivers/usb/musb/musb_virthub.c b/drivers/usb/musb/musb_virthub.c
index ce6f25a9650b..816b12df4d28 100644
--- a/drivers/usb/musb/musb_virthub.c
+++ b/drivers/usb/musb/musb_virthub.c
@@ -90,7 +90,7 @@ int musb_port_suspend(struct musb *musb, bool do_suspend)
 			musb->is_active = musb->xceiv &&
 				musb->xceiv->otg->host->b_hnp_enable;
 			if (musb->is_active)
-				mod_timer(&musb->otg_timer, jiffies
+				timer_mod(&musb->otg_timer, jiffies
 					+ msecs_to_jiffies(
 						OTG_TIME_A_AIDL_BDIS));
 			musb_platform_try_idle(musb, 0);
diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index 1d9571f24a56..8ca77eb783cc 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -543,7 +543,7 @@ static void tusb_musb_try_idle(struct musb *musb, unsigned long timeout)
 	dev_dbg(musb->controller, "%s inactive, for idle timer for %lu ms\n",
 		usb_otg_state_string(musb->xceiv->otg->state),
 		(unsigned long)jiffies_to_msecs(timeout - jiffies));
-	mod_timer(&musb->dev_timer, timeout);
+	timer_mod(&musb->dev_timer, timeout);
 }
 
 /* ticks of 60 MHz clock */
diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index bd73857ab46f..711de522095f 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -1301,7 +1301,7 @@ static int garmin_flush_queue(struct garmin_data *garmin_data_p)
 		if (pkt != NULL) {
 			send_to_tty(garmin_data_p->port, pkt->data, pkt->size);
 			kfree(pkt);
-			mod_timer(&garmin_data_p->timer, (1)+jiffies);
+			timer_mod(&garmin_data_p->timer, (1)+jiffies);
 
 		} else {
 			spin_lock_irqsave(&garmin_data_p->lock, flags);
diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 9e9aca271c0a..0d80f8dc90b4 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -387,7 +387,7 @@ static void mos7840_led_off(struct timer_list *t)
 
 	/* Turn off LED */
 	mos7840_set_led_async(mcs, 0x0300, MODEM_CONTROL_REGISTER);
-	mod_timer(&mcs->led_timer2,
+	timer_mod(&mcs->led_timer2,
 				jiffies + msecs_to_jiffies(LED_OFF_MS));
 }
 
@@ -406,7 +406,7 @@ static void mos7840_led_activity(struct usb_serial_port *port)
 		return;
 
 	mos7840_set_led_async(mos7840_port, 0x0301, MODEM_CONTROL_REGISTER);
-	mod_timer(&mos7840_port->led_timer1,
+	timer_mod(&mos7840_port->led_timer1,
 				jiffies + msecs_to_jiffies(LED_ON_MS));
 }
 
diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
index 3075097f33bc..632e05dd7f62 100644
--- a/drivers/usb/storage/realtek_cr.c
+++ b/drivers/usb/storage/realtek_cr.c
@@ -749,7 +749,7 @@ static void rts51x_modi_suspend_timer(struct rts51x_chip *chip)
 	usb_stor_dbg(us, "state:%d\n", rts51x_get_stat(chip));
 
 	chip->timer_expires = jiffies + msecs_to_jiffies(1000*ss_delay);
-	mod_timer(&chip->rts51x_suspend_timer, chip->timer_expires);
+	timer_mod(&chip->rts51x_suspend_timer, chip->timer_expires);
 }
 
 static void rts51x_suspend_timer_fn(struct timer_list *t)
diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc_transfer.c
index a4f02ea3e3ef..c6db17e72f32 100644
--- a/drivers/usb/usbip/vudc_transfer.c
+++ b/drivers/usb/usbip/vudc_transfer.c
@@ -435,7 +435,7 @@ static void v_timer(struct timer_list *t)
 	if (list_empty(&udc->urb_queue))
 		timer->state = VUDC_TR_IDLE;
 	else
-		mod_timer(&timer->timer,
+		timer_mod(&timer->timer,
 			  timer->frame_start + msecs_to_jiffies(1));
 
 	spin_unlock_irqrestore(&udc->lock, flags);
@@ -482,7 +482,7 @@ void v_kick_timer(struct vudc *udc, unsigned long time)
 		fallthrough;
 	case VUDC_TR_STOPPED:
 		/* we may want to kick timer to unqueue urbs */
-		mod_timer(&t->timer, time);
+		timer_mod(&t->timer, time);
 	}
 }
 
diff --git a/drivers/video/fbdev/aty/radeon_backlight.c b/drivers/video/fbdev/aty/radeon_backlight.c
index bf764c92bcf1..ad7ea2512753 100644
--- a/drivers/video/fbdev/aty/radeon_backlight.c
+++ b/drivers/video/fbdev/aty/radeon_backlight.c
@@ -76,7 +76,7 @@ static int radeon_bl_update_status(struct backlight_device *bd)
 			lvds_gen_cntl |= LVDS_ON;
 			lvds_gen_cntl |= (rinfo->init_state.lvds_gen_cntl & LVDS_BL_MOD_EN);
 			rinfo->pending_lvds_gen_cntl = lvds_gen_cntl;
-			mod_timer(&rinfo->lvds_timer,
+			timer_mod(&rinfo->lvds_timer,
 				  jiffies + msecs_to_jiffies(rinfo->panel_info.pwr_delay));
 		} else {
 			lvds_gen_cntl &= ~LVDS_BL_MOD_LEVEL_MASK;
@@ -105,7 +105,7 @@ static int radeon_bl_update_status(struct backlight_device *bd)
 		OUTREG(LVDS_GEN_CNTL, lvds_gen_cntl);
 		lvds_gen_cntl &= ~(LVDS_DIGON);
 		rinfo->pending_lvds_gen_cntl = lvds_gen_cntl;
-		mod_timer(&rinfo->lvds_timer,
+		timer_mod(&rinfo->lvds_timer,
 			  jiffies + msecs_to_jiffies(rinfo->panel_info.pwr_delay));
 		if (rinfo->is_mobility || rinfo->is_IGP)
 			OUTPLL(PIXCLKS_CNTL, tmpPixclksCntl);
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index 0eef8c6b98c8..fb518aefe570 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -1102,7 +1102,7 @@ int radeon_screen_blank(struct radeonfb_info *rinfo, int blank, int mode_switch)
 				}
 				else {
 					rinfo->pending_lvds_gen_cntl = target_val;
-					mod_timer(&rinfo->lvds_timer,
+					timer_mod(&rinfo->lvds_timer,
 					   jiffies +
 					   msecs_to_jiffies(rinfo->panel_info.pwr_delay));
 				}
@@ -1128,7 +1128,7 @@ int radeon_screen_blank(struct radeonfb_info *rinfo, int blank, int mode_switch)
 			OUTREG(LVDS_GEN_CNTL, val);
 			val &= ~LVDS_DIGON;
 			rinfo->pending_lvds_gen_cntl = val;
-			mod_timer(&rinfo->lvds_timer,
+			timer_mod(&rinfo->lvds_timer,
 				  jiffies +
 				  msecs_to_jiffies(rinfo->panel_info.pwr_delay));
 			rinfo->init_state.lvds_gen_cntl &= ~LVDS_STATE_MASK;
diff --git a/drivers/video/fbdev/omap/hwa742.c b/drivers/video/fbdev/omap/hwa742.c
index 64e76e1f5388..8759abfd501c 100644
--- a/drivers/video/fbdev/omap/hwa742.c
+++ b/drivers/video/fbdev/omap/hwa742.c
@@ -466,7 +466,7 @@ static void create_req_list(struct omapfb_update_window *win,
 static void auto_update_complete(void *data)
 {
 	if (!hwa742.stop_auto_update)
-		mod_timer(&hwa742.auto_update_timer,
+		timer_mod(&hwa742.auto_update_timer,
 			  jiffies + HWA742_AUTO_UPDATE_TIME);
 }
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index 370e8623754e..2c0f933932c8 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -3977,7 +3977,7 @@ static void dsi_update_screen_dispc(struct platform_device *dsidev)
 		dsi_vc_send_bta(dsidev, channel);
 
 #ifdef DSI_CATCH_MISSING_TE
-		mod_timer(&dsi->te_timer, jiffies + msecs_to_jiffies(250));
+		timer_mod(&dsi->te_timer, jiffies + msecs_to_jiffies(250));
 #endif
 	}
 }
diff --git a/drivers/video/fbdev/pxa3xx-gcu.c b/drivers/video/fbdev/pxa3xx-gcu.c
index 4a78b387b343..675955bdf7db 100644
--- a/drivers/video/fbdev/pxa3xx-gcu.c
+++ b/drivers/video/fbdev/pxa3xx-gcu.c
@@ -510,7 +510,7 @@ static void pxa3xx_gcu_debug_timedout(struct timer_list *unused)
 
 	QERROR("Timer DUMP");
 
-	mod_timer(&pxa3xx_gcu_debug_timer, jiffies + 5 * HZ);
+	timer_mod(&pxa3xx_gcu_debug_timer, jiffies + 5 * HZ);
 }
 
 static void pxa3xx_gcu_init_debug_timer(struct pxa3xx_gcu_priv *priv)
diff --git a/drivers/virt/vboxguest/vboxguest_core.c b/drivers/virt/vboxguest/vboxguest_core.c
index b177a534b6a4..8b36255a0697 100644
--- a/drivers/virt/vboxguest/vboxguest_core.c
+++ b/drivers/virt/vboxguest/vboxguest_core.c
@@ -422,7 +422,7 @@ static void vbg_heartbeat_timer(struct timer_list *t)
 	struct vbg_dev *gdev = timer_container_of(gdev, t, heartbeat_timer);
 
 	vbg_req_perform(gdev, gdev->guest_heartbeat_req);
-	mod_timer(&gdev->heartbeat_timer,
+	timer_mod(&gdev->heartbeat_timer,
 		  msecs_to_jiffies(gdev->heartbeat_interval_ms));
 }
 
@@ -483,7 +483,7 @@ static int vbg_heartbeat_init(struct vbg_dev *gdev)
 
 	vbg_info("%s: Setting up heartbeat to trigger every %d milliseconds\n",
 		 __func__, gdev->heartbeat_interval_ms);
-	mod_timer(&gdev->heartbeat_timer, 0);
+	timer_mod(&gdev->heartbeat_timer, 0);
 
 	return 0;
 }
diff --git a/drivers/watchdog/alim7101_wdt.c b/drivers/watchdog/alim7101_wdt.c
index 03a559b41f5b..5636ef5de235 100644
--- a/drivers/watchdog/alim7101_wdt.c
+++ b/drivers/watchdog/alim7101_wdt.c
@@ -114,7 +114,7 @@ static void wdt_timer_ping(struct timer_list *unused)
 		pr_warn("Heartbeat lost! Will not ping the watchdog\n");
 	}
 	/* Re-set the timer interval */
-	mod_timer(&timer, jiffies + WDT_INTERVAL);
+	timer_mod(&timer, jiffies + WDT_INTERVAL);
 }
 
 /*
@@ -158,7 +158,7 @@ static void wdt_startup(void)
 	wdt_change(WDT_ENABLE);
 
 	/* Start the timer */
-	mod_timer(&timer, jiffies + WDT_INTERVAL);
+	timer_mod(&timer, jiffies + WDT_INTERVAL);
 
 	pr_info("Watchdog timer is now enabled\n");
 }
diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
index aba66b8e9d03..45c4c030f393 100644
--- a/drivers/watchdog/at91sam9_wdt.c
+++ b/drivers/watchdog/at91sam9_wdt.c
@@ -123,7 +123,7 @@ static void at91_ping(struct timer_list *t)
 	if (time_before(jiffies, wdt->next_heartbeat) ||
 	    !watchdog_active(&wdt->wdd)) {
 		at91_wdt_reset(wdt);
-		mod_timer(&wdt->timer, jiffies + wdt->heartbeat);
+		timer_mod(&wdt->timer, jiffies + wdt->heartbeat);
 	} else {
 		pr_crit("I will reset your machine !\n");
 	}
@@ -227,7 +227,7 @@ static int at91_wdt_init(struct platform_device *pdev, struct at91wdt *wdt)
 	 *  - waiting for heartbeat time might lead to a watchdog timeout
 	 *    reset
 	 */
-	mod_timer(&wdt->timer, jiffies + min_heartbeat);
+	timer_mod(&wdt->timer, jiffies + min_heartbeat);
 
 	/* Try to set timeout from device tree first */
 	if (watchdog_init_timeout(&wdt->wdd, 0, dev))
diff --git a/drivers/watchdog/bcm47xx_wdt.c b/drivers/watchdog/bcm47xx_wdt.c
index e13ec0975bef..2d7b8410749d 100644
--- a/drivers/watchdog/bcm47xx_wdt.c
+++ b/drivers/watchdog/bcm47xx_wdt.c
@@ -110,7 +110,7 @@ static void bcm47xx_wdt_soft_timer_tick(struct timer_list *t)
 
 	if (!atomic_dec_and_test(&wdt->soft_ticks)) {
 		wdt->timer_set_ms(wdt, next_tick);
-		mod_timer(&wdt->soft_timer, jiffies + HZ);
+		timer_mod(&wdt->soft_timer, jiffies + HZ);
 	} else {
 		pr_crit("Watchdog will fire soon!!!\n");
 	}
diff --git a/drivers/watchdog/lpc18xx_wdt.c b/drivers/watchdog/lpc18xx_wdt.c
index f89739e4627b..fc4068e4efa3 100644
--- a/drivers/watchdog/lpc18xx_wdt.c
+++ b/drivers/watchdog/lpc18xx_wdt.c
@@ -83,7 +83,7 @@ static void lpc18xx_wdt_timer_feed(struct timer_list *t)
 	lpc18xx_wdt_feed(wdt_dev);
 
 	/* Use safe value (1/2 of real timeout) */
-	mod_timer(&lpc18xx_wdt->timer, jiffies +
+	timer_mod(&lpc18xx_wdt->timer, jiffies +
 		  msecs_to_jiffies((wdt_dev->timeout * MSEC_PER_SEC) / 2));
 }
 
diff --git a/drivers/watchdog/machzwd.c b/drivers/watchdog/machzwd.c
index 0ae8e5bc10ae..e71e76284f6f 100644
--- a/drivers/watchdog/machzwd.c
+++ b/drivers/watchdog/machzwd.c
@@ -221,7 +221,7 @@ static void zf_timer_on(void)
 	next_heartbeat = jiffies + ZF_USER_TIMEO;
 
 	/* start the timer for internal ping */
-	mod_timer(&zf_timer, jiffies + ZF_HW_TIMEO);
+	timer_mod(&zf_timer, jiffies + ZF_HW_TIMEO);
 
 	/* start watchdog timer */
 	ctrl_reg = zf_get_control();
@@ -257,7 +257,7 @@ static void zf_ping(struct timer_list *unused)
 		zf_set_control(ctrl_reg);
 		spin_unlock_irqrestore(&zf_port_lock, flags);
 
-		mod_timer(&zf_timer, jiffies + ZF_HW_TIMEO);
+		timer_mod(&zf_timer, jiffies + ZF_HW_TIMEO);
 	} else
 		pr_crit("I will reset your machine\n");
 }
diff --git a/drivers/watchdog/mixcomwd.c b/drivers/watchdog/mixcomwd.c
index 1ecd5c48a005..f2e55b16a803 100644
--- a/drivers/watchdog/mixcomwd.c
+++ b/drivers/watchdog/mixcomwd.c
@@ -118,7 +118,7 @@ static void mixcomwd_ping(void)
 static void mixcomwd_timerfun(struct timer_list *unused)
 {
 	mixcomwd_ping();
-	mod_timer(&mixcomwd_timer, jiffies + 5 * HZ);
+	timer_mod(&mixcomwd_timer, jiffies + 5 * HZ);
 }
 
 /*
@@ -156,7 +156,7 @@ static int mixcomwd_release(struct inode *inode, struct file *file)
 			return -EBUSY;
 		}
 		mixcomwd_timer_alive = 1;
-		mod_timer(&mixcomwd_timer, jiffies + 5 * HZ);
+		timer_mod(&mixcomwd_timer, jiffies + 5 * HZ);
 	} else
 		pr_crit("WDT device closed unexpectedly.  WDT will not stop!\n");
 
diff --git a/drivers/watchdog/mtx-1_wdt.c b/drivers/watchdog/mtx-1_wdt.c
index f75426cfa425..128405419d69 100644
--- a/drivers/watchdog/mtx-1_wdt.c
+++ b/drivers/watchdog/mtx-1_wdt.c
@@ -68,7 +68,7 @@ static void mtx1_wdt_trigger(struct timer_list *unused)
 	gpiod_set_value(mtx1_wdt_device.gpiod, mtx1_wdt_device.gstate);
 
 	if (mtx1_wdt_device.queue && ticks)
-		mod_timer(&mtx1_wdt_device.timer, jiffies + MTX1_WDT_INTERVAL);
+		timer_mod(&mtx1_wdt_device.timer, jiffies + MTX1_WDT_INTERVAL);
 	else
 		complete(&mtx1_wdt_device.stop);
 	spin_unlock(&mtx1_wdt_device.lock);
@@ -89,7 +89,7 @@ static void mtx1_wdt_start(void)
 		mtx1_wdt_device.queue = 1;
 		mtx1_wdt_device.gstate = 1;
 		gpiod_set_value(mtx1_wdt_device.gpiod, 1);
-		mod_timer(&mtx1_wdt_device.timer, jiffies + MTX1_WDT_INTERVAL);
+		timer_mod(&mtx1_wdt_device.timer, jiffies + MTX1_WDT_INTERVAL);
 	}
 	mtx1_wdt_device.running++;
 	spin_unlock_irqrestore(&mtx1_wdt_device.lock, flags);
diff --git a/drivers/watchdog/pcwd.c b/drivers/watchdog/pcwd.c
index d4ea7d6ccd6a..36fe760cfcba 100644
--- a/drivers/watchdog/pcwd.c
+++ b/drivers/watchdog/pcwd.c
@@ -391,7 +391,7 @@ static void pcwd_timer_ping(struct timer_list *unused)
 		}
 
 		/* Re-set the timer interval */
-		mod_timer(&pcwd_private.timer, jiffies + WDT_INTERVAL);
+		timer_mod(&pcwd_private.timer, jiffies + WDT_INTERVAL);
 
 		spin_unlock(&pcwd_private.io_lock);
 	} else {
@@ -406,7 +406,7 @@ static int pcwd_start(void)
 	pcwd_private.next_heartbeat = jiffies + (heartbeat * HZ);
 
 	/* Start the timer */
-	mod_timer(&pcwd_private.timer, jiffies + WDT_INTERVAL);
+	timer_mod(&pcwd_private.timer, jiffies + WDT_INTERVAL);
 
 	/* Enable the port */
 	if (pcwd_private.revision == PCWD_REVISION_C) {
diff --git a/drivers/watchdog/pika_wdt.c b/drivers/watchdog/pika_wdt.c
index 87b8988d2520..b16b0cfbc3a0 100644
--- a/drivers/watchdog/pika_wdt.c
+++ b/drivers/watchdog/pika_wdt.c
@@ -91,7 +91,7 @@ static void pikawdt_ping(struct timer_list *unused)
 	if (time_before(jiffies, pikawdt_private.next_heartbeat) ||
 			(!nowayout && !pikawdt_private.open)) {
 		pikawdt_reset();
-		mod_timer(&pikawdt_private.timer, jiffies + WDT_TIMEOUT);
+		timer_mod(&pikawdt_private.timer, jiffies + WDT_TIMEOUT);
 	} else
 		pr_crit("I will reset your machine !\n");
 }
@@ -105,7 +105,7 @@ static void pikawdt_keepalive(void)
 static void pikawdt_start(void)
 {
 	pikawdt_keepalive();
-	mod_timer(&pikawdt_private.timer, jiffies + WDT_TIMEOUT);
+	timer_mod(&pikawdt_private.timer, jiffies + WDT_TIMEOUT);
 }
 
 /*
diff --git a/drivers/watchdog/rdc321x_wdt.c b/drivers/watchdog/rdc321x_wdt.c
index 8955177072fa..e1b6247230c2 100644
--- a/drivers/watchdog/rdc321x_wdt.c
+++ b/drivers/watchdog/rdc321x_wdt.c
@@ -72,7 +72,7 @@ static void rdc321x_wdt_trigger(struct timer_list *unused)
 
 	/* requeue?? */
 	if (rdc321x_wdt_device.queue && ticks)
-		mod_timer(&rdc321x_wdt_device.timer,
+		timer_mod(&rdc321x_wdt_device.timer,
 				jiffies + RDC_WDT_INTERVAL);
 	else {
 		/* ticks doesn't matter anyway */
@@ -104,7 +104,7 @@ static void rdc321x_wdt_start(void)
 					RDC_WDT_EN | RDC_WDT_CNT);
 		spin_unlock_irqrestore(&rdc321x_wdt_device.lock, flags);
 
-		mod_timer(&rdc321x_wdt_device.timer,
+		timer_mod(&rdc321x_wdt_device.timer,
 				jiffies + RDC_WDT_INTERVAL);
 	}
 
diff --git a/drivers/watchdog/sbc60xxwdt.c b/drivers/watchdog/sbc60xxwdt.c
index 03eaf48c8f0f..4fee31f51802 100644
--- a/drivers/watchdog/sbc60xxwdt.c
+++ b/drivers/watchdog/sbc60xxwdt.c
@@ -125,7 +125,7 @@ static void wdt_timer_ping(struct timer_list *unused)
 		/* Ping the WDT by reading from wdt_start */
 		inb_p(wdt_start);
 		/* Re-set the timer interval */
-		mod_timer(&timer, jiffies + WDT_INTERVAL);
+		timer_mod(&timer, jiffies + WDT_INTERVAL);
 	} else
 		pr_warn("Heartbeat lost! Will not ping the watchdog\n");
 }
@@ -139,7 +139,7 @@ static void wdt_startup(void)
 	next_heartbeat = jiffies + (timeout * HZ);
 
 	/* Start the timer */
-	mod_timer(&timer, jiffies + WDT_INTERVAL);
+	timer_mod(&timer, jiffies + WDT_INTERVAL);
 	pr_info("Watchdog timer is now enabled\n");
 }
 
diff --git a/drivers/watchdog/sc520_wdt.c b/drivers/watchdog/sc520_wdt.c
index 005f62e4a4fb..9f7b745ff532 100644
--- a/drivers/watchdog/sc520_wdt.c
+++ b/drivers/watchdog/sc520_wdt.c
@@ -143,7 +143,7 @@ static void wdt_timer_ping(struct timer_list *unused)
 		spin_unlock(&wdt_spinlock);
 
 		/* Re-set the timer interval */
-		mod_timer(&timer, jiffies + WDT_INTERVAL);
+		timer_mod(&timer, jiffies + WDT_INTERVAL);
 	} else
 		pr_warn("Heartbeat lost! Will not ping the watchdog\n");
 }
@@ -174,7 +174,7 @@ static int wdt_startup(void)
 	next_heartbeat = jiffies + (timeout * HZ);
 
 	/* Start the timer */
-	mod_timer(&timer, jiffies + WDT_INTERVAL);
+	timer_mod(&timer, jiffies + WDT_INTERVAL);
 
 	/* Start the watchdog */
 	wdt_config(WDT_ENB | WDT_WRST_ENB | WDT_EXP_SEL_04);
diff --git a/drivers/watchdog/shwdt.c b/drivers/watchdog/shwdt.c
index 719f100aae60..f397f18c4c9a 100644
--- a/drivers/watchdog/shwdt.c
+++ b/drivers/watchdog/shwdt.c
@@ -90,7 +90,7 @@ static int sh_wdt_start(struct watchdog_device *wdt_dev)
 	spin_lock_irqsave(&wdt->lock, flags);
 
 	next_heartbeat = jiffies + (heartbeat * HZ);
-	mod_timer(&wdt->timer, next_ping_period(clock_division_ratio));
+	timer_mod(&wdt->timer, next_ping_period(clock_division_ratio));
 
 	csr = sh_wdt_read_csr();
 	csr |= WTCSR_WT | clock_division_ratio;
@@ -186,7 +186,7 @@ static void sh_wdt_ping(struct timer_list *t)
 
 		sh_wdt_write_cnt(0);
 
-		mod_timer(&wdt->timer, next_ping_period(clock_division_ratio));
+		timer_mod(&wdt->timer, next_ping_period(clock_division_ratio));
 	} else
 		dev_warn(wdt->dev, "Heartbeat lost! Will not ping "
 		         "the watchdog\n");
diff --git a/drivers/watchdog/via_wdt.c b/drivers/watchdog/via_wdt.c
index d647923d68fe..f34b224ff982 100644
--- a/drivers/watchdog/via_wdt.c
+++ b/drivers/watchdog/via_wdt.c
@@ -93,7 +93,7 @@ static void wdt_timer_tick(struct timer_list *unused)
 	if (time_before(jiffies, next_heartbeat) ||
 	   (!watchdog_active(&wdt_dev))) {
 		wdt_reset();
-		mod_timer(&timer, jiffies + WDT_HEARTBEAT);
+		timer_mod(&timer, jiffies + WDT_HEARTBEAT);
 	} else
 		pr_crit("I will reboot your machine !\n");
 }
@@ -112,7 +112,7 @@ static int wdt_start(struct watchdog_device *wdd)
 	writel(wdd->timeout, wdt_mem + VIA_WDT_COUNT);
 	writel(ctl | VIA_WDT_RUNNING | VIA_WDT_TRIGGER, wdt_mem);
 	wdt_ping(wdd);
-	mod_timer(&timer, jiffies + WDT_HEARTBEAT);
+	timer_mod(&timer, jiffies + WDT_HEARTBEAT);
 	return 0;
 }
 
@@ -216,7 +216,7 @@ static int wdt_probe(struct pci_dev *pdev,
 		goto err_out_iounmap;
 
 	/* start triggering, in case of watchdog already enabled by BIOS */
-	mod_timer(&timer, jiffies + WDT_HEARTBEAT);
+	timer_mod(&timer, jiffies + WDT_HEARTBEAT);
 	return 0;
 
 err_out_iounmap:
diff --git a/drivers/watchdog/w83877f_wdt.c b/drivers/watchdog/w83877f_wdt.c
index 53db59ef774b..6edc495ac1ca 100644
--- a/drivers/watchdog/w83877f_wdt.c
+++ b/drivers/watchdog/w83877f_wdt.c
@@ -117,7 +117,7 @@ static void wdt_timer_ping(struct timer_list *unused)
 		inb_p(WDT_PING);
 
 		/* Re-set the timer interval */
-		mod_timer(&timer, jiffies + WDT_INTERVAL);
+		timer_mod(&timer, jiffies + WDT_INTERVAL);
 
 		spin_unlock(&wdt_spinlock);
 
@@ -156,7 +156,7 @@ static void wdt_startup(void)
 	next_heartbeat = jiffies + (timeout * HZ);
 
 	/* Start the timer */
-	mod_timer(&timer, jiffies + WDT_INTERVAL);
+	timer_mod(&timer, jiffies + WDT_INTERVAL);
 
 	wdt_change(WDT_ENABLE);
 
diff --git a/fs/afs/server.c b/fs/afs/server.c
index 8755f2703815..033116dbbff7 100644
--- a/fs/afs/server.c
+++ b/fs/afs/server.c
@@ -286,7 +286,7 @@ struct afs_server *afs_lookup_server(struct afs_cell *cell, struct key *key,
  */
 static void afs_set_server_timer(struct afs_server *server, unsigned int delay_secs)
 {
-	mod_timer(&server->timer, jiffies + delay_secs * HZ);
+	timer_mod(&server->timer, jiffies + delay_secs * HZ);
 }
 
 /*
diff --git a/fs/bcachefs/clock.c b/fs/bcachefs/clock.c
index d6dd12d74d4f..1db45b9714ca 100644
--- a/fs/bcachefs/clock.c
+++ b/fs/bcachefs/clock.c
@@ -106,7 +106,7 @@ void bch2_kthread_io_clock_wait(struct io_clock *clock,
 	timer_setup_on_stack(&wait.cpu_timer, io_clock_cpu_timeout, 0);
 
 	if (cpu_timeout != MAX_SCHEDULE_TIMEOUT)
-		mod_timer(&wait.cpu_timer, cpu_timeout + jiffies);
+		timer_mod(&wait.cpu_timer, cpu_timeout + jiffies);
 
 	do {
 		set_current_state(TASK_INTERRUPTIBLE);
diff --git a/fs/btrfs/zstd.c b/fs/btrfs/zstd.c
index 3541efa765c7..85ca879849c2 100644
--- a/fs/btrfs/zstd.c
+++ b/fs/btrfs/zstd.c
@@ -147,7 +147,7 @@ static void zstd_reclaim_timer_fn(struct timer_list *timer)
 	}
 
 	if (!list_empty(&wsm.lru_list))
-		mod_timer(&wsm.timer, jiffies + ZSTD_BTRFS_RECLAIM_JIFFIES);
+		timer_mod(&wsm.timer, jiffies + ZSTD_BTRFS_RECLAIM_JIFFIES);
 
 	spin_unlock(&wsm.lock);
 }
@@ -334,7 +334,7 @@ void zstd_put_workspace(struct list_head *ws)
 			workspace->last_used = jiffies;
 			list_add(&workspace->lru_list, &wsm.lru_list);
 			if (!timer_pending(&wsm.timer))
-				mod_timer(&wsm.timer,
+				timer_mod(&wsm.timer,
 					  jiffies + ZSTD_BTRFS_RECLAIM_JIFFIES);
 		}
 	}
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 6dd3a524cd35..e4d9cd63ec7c 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -393,7 +393,7 @@ void dlm_put_rsb(struct dlm_rsb *r)
 static void enable_scan_timer(struct dlm_ls *ls, unsigned long jiffies)
 {
 	if (!dlm_locking_stopped(ls))
-		mod_timer(&ls->ls_scan_timer, jiffies);
+		timer_mod(&ls->ls_scan_timer, jiffies);
 }
 
 /* This function tries to resume the timer callback if a rsb
@@ -499,7 +499,7 @@ static void add_scan(struct dlm_ls *ls, struct dlm_rsb *r)
 }
 
 /* if we hit contention we do in 250 ms a retry to trylock.
- * if there is any other mod_timer in between we don't care
+ * if there is any other timer_mod in between we don't care
  * about that it expires earlier again this is only for the
  * unlikely case nothing happened in this time.
  */
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index c16419e8f5ef..b10b44378f20 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -3670,7 +3670,7 @@ static void print_daily_error_info(struct timer_list *t)
 			       le64_to_cpu(es->s_last_error_block));
 		printk(KERN_CONT "\n");
 	}
-	mod_timer(&sbi->s_err_report, jiffies + 24*60*60*HZ);  /* Once a day */
+	timer_mod(&sbi->s_err_report, jiffies + 24*60*60*HZ);  /* Once a day */
 }
 
 /* Find next suitable group and run ext4_init_inode_table */
@@ -5628,7 +5628,7 @@ static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
 	}
 
 	if (es->s_error_count)
-		mod_timer(&sbi->s_err_report, jiffies + 300*HZ); /* 5 minutes */
+		timer_mod(&sbi->s_err_report, jiffies + 300*HZ); /* 5 minutes */
 
 	/* Enable message ratelimiting. Default is 10 messages per 5 secs. */
 	ratelimit_state_init(&sbi->s_err_ratelimit_state, 5 * HZ, 10);
@@ -6177,7 +6177,7 @@ static void ext4_update_super(struct super_block *sb)
 		 * started already
 		 */
 		if (!es->s_error_count)
-			mod_timer(&sbi->s_err_report, jiffies + 24*60*60*HZ);
+			timer_mod(&sbi->s_err_report, jiffies + 24*60*60*HZ);
 		le32_add_cpu(&es->s_error_count, sbi->s_add_error_count);
 		sbi->s_add_error_count = 0;
 	}
diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
index c1315df4b350..063d0b1d9b34 100644
--- a/fs/lockd/svclock.c
+++ b/fs/lockd/svclock.c
@@ -1062,5 +1062,5 @@ nlmsvc_retry_blocked(struct svc_rqst *rqstp)
 	spin_unlock(&nlm_blocked_lock);
 
 	if (timeout < MAX_SCHEDULE_TIMEOUT)
-		mod_timer(&nlmsvc_retry, jiffies + timeout);
+		timer_mod(&nlmsvc_retry, jiffies + timeout);
 }
diff --git a/fs/ocfs2/cluster/tcp.c b/fs/ocfs2/cluster/tcp.c
index 8247d34994a9..44aa45e03a01 100644
--- a/fs/ocfs2/cluster/tcp.c
+++ b/fs/ocfs2/cluster/tcp.c
@@ -1520,7 +1520,7 @@ static void o2net_sc_reset_idle_timer(struct o2net_sock_container *sc)
 	o2net_sc_queue_delayed_work(sc, &sc->sc_keepalive_work,
 		      msecs_to_jiffies(o2net_keepalive_delay()));
 	o2net_set_sock_timer(sc);
-	mod_timer(&sc->sc_idle_timeout,
+	timer_mod(&sc->sc_idle_timeout,
 	       jiffies + msecs_to_jiffies(o2net_idle_timeout()));
 }
 
diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index f8b9c9c73997..e376f69d489f 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -144,7 +144,7 @@ static void pstore_timer_kick(void)
 	if (pstore_update_ms < 0)
 		return;
 
-	mod_timer(&pstore_timer, jiffies + msecs_to_jiffies(pstore_update_ms));
+	timer_mod(&pstore_timer, jiffies + msecs_to_jiffies(pstore_update_ms));
 }
 
 static bool pstore_cannot_block_path(enum kmsg_dump_reason reason)
diff --git a/include/linux/timer.h b/include/linux/timer.h
index cc6903ba363f..b3d2ab87c248 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -38,7 +38,7 @@
  *
  * @TIMER_PINNED: A pinned timer will always expire on the CPU on which the
  * timer was enqueued. When a particular CPU is required, timer_add_on()
- * has to be used. Enqueue via mod_timer() and timer_add() is always done
+ * has to be used. Enqueue via timer_mod() and timer_add() is always done
  * on the local CPU.
  */
 #define TIMER_CPUMASK		0x0003FFFF
@@ -148,7 +148,7 @@ static inline int timer_pending(const struct timer_list * timer)
 }
 
 extern void timer_add_on(struct timer_list *timer, int cpu);
-extern int mod_timer(struct timer_list *timer, unsigned long expires);
+extern int timer_mod(struct timer_list *timer, unsigned long expires);
 extern int timer_mod_pending(struct timer_list *timer, unsigned long expires);
 extern int timer_reduce(struct timer_list *timer, unsigned long expires);
 
diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index efbd79c67be2..57a1e333d609 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -6207,7 +6207,7 @@ void wiphy_delayed_work_flush(struct wiphy *wiphy,
  *
  * How wiphy_delayed_work_queue() works is by setting a timer which
  * when it expires calls wiphy_work_queue() to queue the wiphy work.
- * Because wiphy_delayed_work_queue() uses mod_timer(), if it is
+ * Because wiphy_delayed_work_queue() uses timer_mod(), if it is
  * called twice and the second call happens before the first call
  * deadline, the work will rescheduled for the second deadline and
  * won't run before that.
@@ -6220,7 +6220,7 @@ void wiphy_delayed_work_flush(struct wiphy *wiphy,
  *
  *      CPU0                                CPU1
  * wiphy_delayed_work_queue(wk)
- *  mod_timer(wk->timer)
+ *  timer_mod(wk->timer)
  *                                     wiphy_delayed_work_pending(wk) -> true
  *
  * [...]
diff --git a/include/rdma/rdmavt_qp.h b/include/rdma/rdmavt_qp.h
index d67892944193..13723f4449c0 100644
--- a/include/rdma/rdmavt_qp.h
+++ b/include/rdma/rdmavt_qp.h
@@ -729,7 +729,7 @@ static inline void rvt_mod_retry_timer_ext(struct rvt_qp *qp, u8 shift)
 	lockdep_assert_held(&qp->s_lock);
 	qp->s_flags |= RVT_S_TIMER;
 	/* 4.096 usec. * (1 << qp->timeout) */
-	mod_timer(&qp->s_timer, jiffies + rdi->busy_jiffies +
+	timer_mod(&qp->s_timer, jiffies + rdi->busy_jiffies +
 		  (qp->timeout_jiffies << shift));
 }
 
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 8d783b5882b6..9aec992bde12 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -2277,7 +2277,7 @@ static void prepare_uretprobe(struct uprobe *uprobe, struct pt_regs *regs,
 	ri->next = utask->return_instances;
 	rcu_assign_pointer(utask->return_instances, ri);
 
-	mod_timer(&utask->ri_timer, jiffies + RI_TIMER_PERIOD);
+	timer_mod(&utask->ri_timer, jiffies + RI_TIMER_PERIOD);
 
 	return;
 free:
diff --git a/kernel/irq/spurious.c b/kernel/irq/spurious.c
index 02b2daf07441..e7e19ae3e1f9 100644
--- a/kernel/irq/spurious.c
+++ b/kernel/irq/spurious.c
@@ -168,7 +168,7 @@ static void poll_spurious_irqs(struct timer_list *unused)
 	}
 out:
 	atomic_dec(&irq_poll_active);
-	mod_timer(&poll_spurious_irq_timer,
+	timer_mod(&poll_spurious_irq_timer,
 		  jiffies + POLL_SPURIOUS_IRQ_INTERVAL);
 }
 
@@ -425,7 +425,7 @@ void note_interrupt(struct irq_desc *desc, irqreturn_t action_ret)
 		desc->depth++;
 		irq_disable(desc);
 
-		mod_timer(&poll_spurious_irq_timer,
+		timer_mod(&poll_spurious_irq_timer,
 			  jiffies + POLL_SPURIOUS_IRQ_INTERVAL);
 	}
 	desc->irqs_unhandled = 0;
diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
index 6ce73cceaf53..ef4ea881ba96 100644
--- a/kernel/kcsan/kcsan_test.c
+++ b/kernel/kcsan/kcsan_test.c
@@ -1490,7 +1490,7 @@ static int access_thread(void *arg)
 		might_sleep();
 
 		if (!timer_pending(&timer))
-			mod_timer(&timer, jiffies + 1);
+			timer_mod(&timer, jiffies + 1);
 		else {
 			/* Iterate through all kernels. */
 			idx = cnt++ % ARRAY_SIZE(access_kernels);
diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 4fa7772be183..d630df4372ec 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -2311,7 +2311,7 @@ rcu_torture_reader(void *arg)
 	do {
 		if (irqreader && cur_ops->irq_capable) {
 			if (!timer_pending(&t))
-				mod_timer(&t, jiffies + 1);
+				timer_mod(&t, jiffies + 1);
 		}
 		if (!rcu_torture_one_read(&rand, myid) && !torture_must_stop())
 			schedule_timeout_interruptible(HZ);
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index d72399187d6d..3f21549a48e6 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -324,7 +324,7 @@ static void call_rcu_tasks_generic_timer(struct timer_list *tlp)
 		if (!rtpcp->urgent_gp)
 			rtpcp->urgent_gp = 1;
 		needwake = true;
-		mod_timer(&rtpcp->lazy_timer, rcu_tasks_lazy_time(rtp));
+		timer_mod(&rtpcp->lazy_timer, rcu_tasks_lazy_time(rtp));
 	}
 	raw_spin_unlock_irqrestore_rcu_node(rtpcp, flags);
 	if (needwake)
@@ -380,7 +380,7 @@ static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_t func,
 		   (rcu_segcblist_n_cbs(&rtpcp->cblist) == rcu_task_lazy_lim);
 	if (havekthread && !needwake && !timer_pending(&rtpcp->lazy_timer)) {
 		if (rtp->lazy_jiffies)
-			mod_timer(&rtpcp->lazy_timer, rcu_tasks_lazy_time(rtp));
+			timer_mod(&rtpcp->lazy_timer, rcu_tasks_lazy_time(rtp));
 		else
 			needwake = rcu_segcblist_empty(&rtpcp->cblist);
 	}
diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
index 3fffd29e1f99..83b04e5070c3 100644
--- a/kernel/rcu/tree_nocb.h
+++ b/kernel/rcu/tree_nocb.h
@@ -277,14 +277,14 @@ static void wake_nocb_gp_defer(struct rcu_data *rdp, int waketype,
 	 */
 	if (waketype == RCU_NOCB_WAKE_LAZY &&
 	    rdp->nocb_defer_wakeup == RCU_NOCB_WAKE_NOT) {
-		mod_timer(&rdp_gp->nocb_timer, jiffies + rcu_get_jiffies_lazy_flush());
+		timer_mod(&rdp_gp->nocb_timer, jiffies + rcu_get_jiffies_lazy_flush());
 		WRITE_ONCE(rdp_gp->nocb_defer_wakeup, waketype);
 	} else if (waketype == RCU_NOCB_WAKE_BYPASS) {
-		mod_timer(&rdp_gp->nocb_timer, jiffies + 2);
+		timer_mod(&rdp_gp->nocb_timer, jiffies + 2);
 		WRITE_ONCE(rdp_gp->nocb_defer_wakeup, waketype);
 	} else {
 		if (rdp_gp->nocb_defer_wakeup < RCU_NOCB_WAKE)
-			mod_timer(&rdp_gp->nocb_timer, jiffies + 1);
+			timer_mod(&rdp_gp->nocb_timer, jiffies + 1);
 		if (rdp_gp->nocb_defer_wakeup < waketype)
 			WRITE_ONCE(rdp_gp->nocb_defer_wakeup, waketype);
 	}
diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index ad04a5c3162a..75f1eadef249 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -621,7 +621,7 @@ static void psi_schedule_rtpoll_work(struct psi_group *group, unsigned long dela
 	 * psi_task_change (hotpath) which can't use locks
 	 */
 	if (likely(task))
-		mod_timer(&group->rtpoll_timer, jiffies + delay);
+		timer_mod(&group->rtpoll_timer, jiffies + delay);
 	else
 		atomic_set(&group->rtpoll_scheduled, 0);
 
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index c86cb7ca85f2..c5f5d9fc854f 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1188,7 +1188,7 @@ __mod_timer(struct timer_list *timer, unsigned long expires, unsigned int option
  * @timer:	The pending timer to be modified
  * @expires:	New absolute timeout in jiffies
  *
- * timer_mod_pending() is the same for pending timers as mod_timer(), but
+ * timer_mod_pending() is the same for pending timers as timer_mod(), but
  * will not activate inactive timers.
  *
  * If @timer->function == NULL then the start operation is silently
@@ -1206,20 +1206,20 @@ int timer_mod_pending(struct timer_list *timer, unsigned long expires)
 EXPORT_SYMBOL(timer_mod_pending);
 
 /**
- * mod_timer - Modify a timer's timeout
+ * timer_mod - Modify a timer's timeout
  * @timer:	The timer to be modified
  * @expires:	New absolute timeout in jiffies
  *
- * mod_timer(timer, expires) is equivalent to:
+ * timer_mod(timer, expires) is equivalent to:
  *
  *     timer_delete(timer); timer->expires = expires; timer_add(timer);
  *
- * mod_timer() is more efficient than the above open coded sequence. In
+ * timer_mod() is more efficient than the above open coded sequence. In
  * case that the timer is inactive, the timer_delete() part is a NOP. The
  * timer is in any case activated with the new expiry time @expires.
  *
  * Note that if there are multiple unserialized concurrent users of the
- * same timer, then mod_timer() is the only safe way to modify the timeout,
+ * same timer, then timer_mod() is the only safe way to modify the timeout,
  * since timer_add() cannot modify an already running timer.
  *
  * If @timer->function == NULL then the start operation is silently
@@ -1232,18 +1232,18 @@ EXPORT_SYMBOL(timer_mod_pending);
  *	  the timer was active and not modified because @expires did
  *	  not change the effective expiry time
  */
-int mod_timer(struct timer_list *timer, unsigned long expires)
+int timer_mod(struct timer_list *timer, unsigned long expires)
 {
 	return __mod_timer(timer, expires, 0);
 }
-EXPORT_SYMBOL(mod_timer);
+EXPORT_SYMBOL(timer_mod);
 
 /**
  * timer_reduce - Modify a timer's timeout if it would reduce the timeout
  * @timer:	The timer to be modified
  * @expires:	New absolute timeout in jiffies
  *
- * timer_reduce() is very similar to mod_timer(), except that it will only
+ * timer_reduce() is very similar to timer_mod(), except that it will only
  * modify an enqueued timer if that would reduce the expiration time. If
  * @timer is not enqueued it starts the timer.
  *
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index ae4cbd1b2add..e4860d6ea594 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -1047,7 +1047,7 @@ static void worker_enter_idle(struct worker *worker)
 	list_add(&worker->entry, &pool->idle_list);
 
 	if (too_many_workers(pool) && !timer_pending(&pool->idle_timer))
-		mod_timer(&pool->idle_timer, jiffies + IDLE_WORKER_TIMEOUT);
+		timer_mod(&pool->idle_timer, jiffies + IDLE_WORKER_TIMEOUT);
 
 	/* Sanity check nr_running. */
 	WARN_ON_ONCE(pool->nr_workers == pool->nr_idle && pool->nr_running);
@@ -2927,7 +2927,7 @@ static void idle_worker_timeout(struct timer_list *t)
 		do_cull = !time_before(jiffies, expires);
 
 		if (!do_cull)
-			mod_timer(&pool->idle_timer, expires);
+			timer_mod(&pool->idle_timer, expires);
 	}
 	raw_spin_unlock_irq(&pool->lock);
 
@@ -2968,7 +2968,7 @@ static void idle_cull_fn(struct work_struct *work)
 		expires = worker->last_active + IDLE_WORKER_TIMEOUT;
 
 		if (time_before(jiffies, expires)) {
-			mod_timer(&pool->idle_timer, expires);
+			timer_mod(&pool->idle_timer, expires);
 			break;
 		}
 
@@ -3028,7 +3028,7 @@ static void pool_mayday_timeout(struct timer_list *t)
 	raw_spin_unlock(&wq_mayday_lock);
 	raw_spin_unlock_irq(&pool->lock);
 
-	mod_timer(&pool->mayday_timer, jiffies + MAYDAY_INTERVAL);
+	timer_mod(&pool->mayday_timer, jiffies + MAYDAY_INTERVAL);
 }
 
 /**
@@ -3057,7 +3057,7 @@ __acquires(&pool->lock)
 	raw_spin_unlock_irq(&pool->lock);
 
 	/* if we don't make progress in MAYDAY_INITIAL_TIMEOUT, call for help */
-	mod_timer(&pool->mayday_timer, jiffies + MAYDAY_INITIAL_TIMEOUT);
+	timer_mod(&pool->mayday_timer, jiffies + MAYDAY_INITIAL_TIMEOUT);
 
 	while (true) {
 		if (create_worker(pool) || !need_to_create_worker(pool))
@@ -7615,7 +7615,7 @@ static void wq_watchdog_timer_fn(struct timer_list *unused)
 		panic_on_wq_watchdog();
 
 	wq_watchdog_reset_touched();
-	mod_timer(&wq_watchdog_timer, jiffies + thresh);
+	timer_mod(&wq_watchdog_timer, jiffies + thresh);
 }
 
 notrace void wq_watchdog_touch(int cpu)
@@ -7642,7 +7642,7 @@ static void wq_watchdog_set_thresh(unsigned long thresh)
 	if (thresh) {
 		wq_watchdog_thresh = thresh;
 		wq_watchdog_reset_touched();
-		mod_timer(&wq_watchdog_timer, jiffies + thresh * HZ);
+		timer_mod(&wq_watchdog_timer, jiffies + thresh * HZ);
 	}
 }
 
diff --git a/lib/test_ref_tracker.c b/lib/test_ref_tracker.c
index b983ceb12afc..174ec7b8d330 100644
--- a/lib/test_ref_tracker.c
+++ b/lib/test_ref_tracker.c
@@ -67,7 +67,7 @@ static int __init test_ref_tracker_init(void)
 	ref_tracker_dir_init(&ref_dir, 100, "selftest");
 
 	timer_setup(&test_ref_tracker_timer, test_ref_tracker_timer_func, 0);
-	mod_timer(&test_ref_tracker_timer, jiffies + 1);
+	timer_mod(&test_ref_tracker_timer, jiffies + 1);
 
 	alloctest_ref_tracker_alloc1(&ref_dir, &tracker[1]);
 	alloctest_ref_tracker_alloc2(&ref_dir, &tracker[2]);
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 96c12e7cf77e..f0d543661bc9 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -569,7 +569,7 @@ static void wb_domain_writeout_add(struct wb_domain *dom,
 		 * roughly the same.
 		 */
 		dom->period_time = wp_next_time(jiffies);
-		mod_timer(&dom->period_timer, dom->period_time);
+		timer_mod(&dom->period_timer, dom->period_time);
 	}
 }
 
@@ -614,7 +614,7 @@ static void writeout_period(struct timer_list *t)
 	if (fprop_new_period(&dom->completions, miss_periods + 1)) {
 		dom->period_time = wp_next_time(dom->period_time +
 				miss_periods * VM_COMPLETIONS_PERIOD_LEN);
-		mod_timer(&dom->period_timer, dom->period_time);
+		timer_mod(&dom->period_timer, dom->period_time);
 	} else {
 		/*
 		 * Aging has zeroed all fractions. Stop wasting CPU on period
@@ -2214,7 +2214,7 @@ void laptop_mode_timer_fn(struct timer_list *t)
  */
 void laptop_io_completion(struct backing_dev_info *info)
 {
-	mod_timer(&info->laptop_mode_wb_timer, jiffies + laptop_mode);
+	timer_mod(&info->laptop_mode_wb_timer, jiffies + laptop_mode);
 }
 
 /*
diff --git a/net/802/garp.c b/net/802/garp.c
index 2d1ffc4d9462..9161ecb70019 100644
--- a/net/802/garp.c
+++ b/net/802/garp.c
@@ -409,7 +409,7 @@ static void garp_join_timer_arm(struct garp_applicant *app)
 	unsigned long delay;
 
 	delay = get_random_u32_below(msecs_to_jiffies(garp_join_time));
-	mod_timer(&app->join_timer, jiffies + delay);
+	timer_mod(&app->join_timer, jiffies + delay);
 }
 
 static void garp_join_timer(struct timer_list *t)
diff --git a/net/802/mrp.c b/net/802/mrp.c
index 23a88305f900..5822ff1f9195 100644
--- a/net/802/mrp.c
+++ b/net/802/mrp.c
@@ -594,7 +594,7 @@ static void mrp_join_timer_arm(struct mrp_applicant *app)
 	unsigned long delay;
 
 	delay = get_random_u32_below(msecs_to_jiffies(mrp_join_time));
-	mod_timer(&app->join_timer, jiffies + delay);
+	timer_mod(&app->join_timer, jiffies + delay);
 }
 
 static void mrp_join_timer(struct timer_list *t)
@@ -615,7 +615,7 @@ static void mrp_join_timer(struct timer_list *t)
 
 static void mrp_periodic_timer_arm(struct mrp_applicant *app)
 {
-	mod_timer(&app->periodic_timer,
+	timer_mod(&app->periodic_timer,
 		  jiffies + msecs_to_jiffies(mrp_periodic_time));
 }
 
diff --git a/net/appletalk/aarp.c b/net/appletalk/aarp.c
index 43d9bca10b73..e6343d578c6c 100644
--- a/net/appletalk/aarp.c
+++ b/net/appletalk/aarp.c
@@ -318,7 +318,7 @@ static void aarp_expire_timeout(struct timer_list *unused)
 	}
 
 	write_unlock_bh(&aarp_lock);
-	mod_timer(&aarp_timer, jiffies +
+	timer_mod(&aarp_timer, jiffies +
 			       (unresolved_count ? sysctl_aarp_tick_time :
 				sysctl_aarp_expiry_time));
 }
@@ -622,7 +622,7 @@ int aarp_send_ddp(struct net_device *dev, struct sk_buff *skb,
 	 */
 
 	if (unresolved_count == 1)
-		mod_timer(&aarp_timer, jiffies + sysctl_aarp_tick_time);
+		timer_mod(&aarp_timer, jiffies + sysctl_aarp_tick_time);
 
 	/* Now finally, it is safe to drop the lock. */
 out_unlock:
@@ -757,7 +757,7 @@ static int aarp_rcv(struct sk_buff *skb, struct net_device *dev,
 		ether_addr_copy(a->hwaddr, ea->hw_src);
 		__aarp_resolved(&unresolved[hash], a, hash);
 		if (!unresolved_count)
-			mod_timer(&aarp_timer,
+			timer_mod(&aarp_timer,
 				  jiffies + sysctl_aarp_expiry_time);
 		break;
 
@@ -807,7 +807,7 @@ static int aarp_rcv(struct sk_buff *skb, struct net_device *dev,
 			 */
 			if (a) {
 				a->expires_at = jiffies - 1;
-				mod_timer(&aarp_timer, jiffies +
+				timer_mod(&aarp_timer, jiffies +
 					  sysctl_aarp_tick_time);
 			}
 		}
diff --git a/net/atm/clip.c b/net/atm/clip.c
index 61b5b700817d..add1418ff16b 100644
--- a/net/atm/clip.c
+++ b/net/atm/clip.c
@@ -158,7 +158,7 @@ static void idle_timer_check(struct timer_list *unused)
 {
 	write_lock(&arp_tbl.lock);
 	__neigh_for_each_release(&arp_tbl, neigh_check_cb);
-	mod_timer(&idle_timer, jiffies + CLIP_CHECK_INTERVAL * HZ);
+	timer_mod(&idle_timer, jiffies + CLIP_CHECK_INTERVAL * HZ);
 	write_unlock(&arp_tbl.lock);
 }
 
@@ -638,7 +638,7 @@ static int atm_init_atmarp(struct atm_vcc *vcc)
 		return -EADDRINUSE;
 	}
 
-	mod_timer(&idle_timer, jiffies + CLIP_CHECK_INTERVAL * HZ);
+	timer_mod(&idle_timer, jiffies + CLIP_CHECK_INTERVAL * HZ);
 
 	atmarpd = vcc;
 	set_bit(ATM_VF_META, &vcc->flags);
diff --git a/net/atm/lec.c b/net/atm/lec.c
index ca452b2982c2..d19d3970ee36 100644
--- a/net/atm/lec.c
+++ b/net/atm/lec.c
@@ -1564,7 +1564,7 @@ static void lec_arp_expire_arp(struct timer_list *t)
 					     entry->mac_addr, NULL, NULL);
 			entry->no_tries++;
 		}
-		mod_timer(&entry->timer, jiffies + (1 * HZ));
+		timer_mod(&entry->timer, jiffies + (1 * HZ));
 	}
 }
 
diff --git a/net/ax25/ax25_ds_timer.c b/net/ax25/ax25_ds_timer.c
index 0c9e7775aa54..41136f4f883b 100644
--- a/net/ax25/ax25_ds_timer.c
+++ b/net/ax25/ax25_ds_timer.c
@@ -54,7 +54,7 @@ void ax25_ds_set_timer(ax25_dev *ax25_dev)
 
 	ax25_dev->dama.slave_timeout =
 		msecs_to_jiffies(ax25_dev->values[AX25_VALUES_DS_TIMEOUT]) / 10;
-	mod_timer(&ax25_dev->dama.slave_timer, jiffies + HZ);
+	timer_mod(&ax25_dev->dama.slave_timer, jiffies + HZ);
 }
 
 /*
diff --git a/net/ax25/ax25_timer.c b/net/ax25/ax25_timer.c
index a69bfbc8b679..9e404c8032e5 100644
--- a/net/ax25/ax25_timer.c
+++ b/net/ax25/ax25_timer.c
@@ -47,23 +47,23 @@ void ax25_setup_timers(ax25_cb *ax25)
 
 void ax25_start_heartbeat(ax25_cb *ax25)
 {
-	mod_timer(&ax25->timer, jiffies + 5 * HZ);
+	timer_mod(&ax25->timer, jiffies + 5 * HZ);
 }
 
 void ax25_start_t1timer(ax25_cb *ax25)
 {
-	mod_timer(&ax25->t1timer, jiffies + ax25->t1);
+	timer_mod(&ax25->t1timer, jiffies + ax25->t1);
 }
 
 void ax25_start_t2timer(ax25_cb *ax25)
 {
-	mod_timer(&ax25->t2timer, jiffies + ax25->t2);
+	timer_mod(&ax25->t2timer, jiffies + ax25->t2);
 }
 
 void ax25_start_t3timer(ax25_cb *ax25)
 {
 	if (ax25->t3 > 0)
-		mod_timer(&ax25->t3timer, jiffies + ax25->t3);
+		timer_mod(&ax25->t3timer, jiffies + ax25->t3);
 	else
 		timer_delete(&ax25->t3timer);
 }
@@ -71,7 +71,7 @@ void ax25_start_t3timer(ax25_cb *ax25)
 void ax25_start_idletimer(ax25_cb *ax25)
 {
 	if (ax25->idle > 0)
-		mod_timer(&ax25->idletimer, jiffies + ax25->idle);
+		timer_mod(&ax25->idletimer, jiffies + ax25->idle);
 	else
 		timer_delete(&ax25->idletimer);
 }
diff --git a/net/batman-adv/tp_meter.c b/net/batman-adv/tp_meter.c
index 350b149e48be..1b415a8d9664 100644
--- a/net/batman-adv/tp_meter.c
+++ b/net/batman-adv/tp_meter.c
@@ -472,7 +472,7 @@ static void batadv_tp_reset_sender_timer(struct batadv_tp_vars *tp_vars)
 		/* timer ref will be dropped in batadv_tp_sender_cleanup */
 		return;
 
-	mod_timer(&tp_vars->timer, jiffies + msecs_to_jiffies(tp_vars->rto));
+	timer_mod(&tp_vars->timer, jiffies + msecs_to_jiffies(tp_vars->rto));
 }
 
 /**
@@ -1090,7 +1090,7 @@ void batadv_tp_stop(struct batadv_priv *bat_priv, const u8 *dst,
  */
 static void batadv_tp_reset_receiver_timer(struct batadv_tp_vars *tp_vars)
 {
-	mod_timer(&tp_vars->timer,
+	timer_mod(&tp_vars->timer,
 		  jiffies + msecs_to_jiffies(BATADV_TP_RECV_TIMEOUT));
 }
 
diff --git a/net/bluetooth/hidp/core.c b/net/bluetooth/hidp/core.c
index 6724adce615b..3475e4b4c9b0 100644
--- a/net/bluetooth/hidp/core.c
+++ b/net/bluetooth/hidp/core.c
@@ -427,7 +427,7 @@ static void hidp_idle_timeout(struct timer_list *t)
 static void hidp_set_timer(struct hidp_session *session)
 {
 	if (session->idle_to > 0)
-		mod_timer(&session->timer, jiffies + HZ * session->idle_to);
+		timer_mod(&session->timer, jiffies + HZ * session->idle_to);
 }
 
 static void hidp_del_timer(struct hidp_session *session)
diff --git a/net/bluetooth/rfcomm/core.c b/net/bluetooth/rfcomm/core.c
index 3b8f39618d65..420213530cb5 100644
--- a/net/bluetooth/rfcomm/core.c
+++ b/net/bluetooth/rfcomm/core.c
@@ -247,7 +247,7 @@ static void rfcomm_session_set_timer(struct rfcomm_session *s, long timeout)
 {
 	BT_DBG("session %p state %ld timeout %ld", s, s->state, timeout);
 
-	mod_timer(&s->timer, jiffies + timeout);
+	timer_mod(&s->timer, jiffies + timeout);
 }
 
 static void rfcomm_session_clear_timer(struct rfcomm_session *s)
@@ -273,7 +273,7 @@ static void rfcomm_dlc_set_timer(struct rfcomm_dlc *d, long timeout)
 {
 	BT_DBG("dlc %p state %ld timeout %ld", d, d->state, timeout);
 
-	if (!mod_timer(&d->timer, jiffies + timeout))
+	if (!timer_mod(&d->timer, jiffies + timeout))
 		rfcomm_dlc_hold(d);
 }
 
diff --git a/net/bridge/br_mdb.c b/net/bridge/br_mdb.c
index 722203b98ff7..029062ffa0e2 100644
--- a/net/bridge/br_mdb.c
+++ b/net/bridge/br_mdb.c
@@ -729,7 +729,7 @@ static int br_mdb_replace_group_sg(const struct br_mdb_config *cfg,
 	pg->flags = flags;
 	pg->rt_protocol = cfg->rt_protocol;
 	if (!(flags & MDB_PG_FLAGS_PERMANENT) && !cfg->src_entry)
-		mod_timer(&pg->timer,
+		timer_mod(&pg->timer,
 			  now + brmctx->multicast_membership_interval);
 	else
 		timer_delete(&pg->timer);
@@ -771,7 +771,7 @@ static int br_mdb_add_group_sg(const struct br_mdb_config *cfg,
 
 	rcu_assign_pointer(*pp, p);
 	if (!(flags & MDB_PG_FLAGS_PERMANENT) && !cfg->src_entry)
-		mod_timer(&p->timer,
+		timer_mod(&p->timer,
 			  now + brmctx->multicast_membership_interval);
 	br_mdb_notify(cfg->br->dev, mp, p, RTM_NEWMDB);
 
@@ -851,7 +851,7 @@ static int br_mdb_add_group_src(const struct br_mdb_config *cfg,
 
 	if (cfg->filter_mode == MCAST_INCLUDE &&
 	    cfg->entry->state == MDB_TEMPORARY)
-		mod_timer(&ent->timer, now + br_multicast_gmi(brmctx));
+		timer_mod(&ent->timer, now + br_multicast_gmi(brmctx));
 	else
 		timer_delete(&ent->timer);
 
@@ -950,7 +950,7 @@ static int br_mdb_replace_group_star_g(const struct br_mdb_config *cfg,
 	pg->rt_protocol = cfg->rt_protocol;
 	if (!(flags & MDB_PG_FLAGS_PERMANENT) &&
 	    cfg->filter_mode == MCAST_EXCLUDE)
-		mod_timer(&pg->timer,
+		timer_mod(&pg->timer,
 			  now + brmctx->multicast_membership_interval);
 	else
 		timer_delete(&pg->timer);
@@ -1002,7 +1002,7 @@ static int br_mdb_add_group_star_g(const struct br_mdb_config *cfg,
 	rcu_assign_pointer(*pp, p);
 	if (!(flags & MDB_PG_FLAGS_PERMANENT) &&
 	    cfg->filter_mode == MCAST_EXCLUDE)
-		mod_timer(&p->timer,
+		timer_mod(&p->timer,
 			  now + brmctx->multicast_membership_interval);
 	br_mdb_notify(cfg->br->dev, mp, p, RTM_NEWMDB);
 	/* If we are adding a new EXCLUDE port group (*, G), it needs to be
@@ -1358,7 +1358,7 @@ static int __br_mdb_del(const struct br_mdb_config *cfg)
 		err = 0;
 		br_mdb_notify(br->dev, mp, NULL, RTM_DELMDB);
 		if (!mp->ports && netif_running(br->dev))
-			mod_timer(&mp->timer, jiffies);
+			timer_mod(&mp->timer, jiffies);
 		goto unlock;
 	}
 
@@ -1473,7 +1473,7 @@ static void br_mdb_flush_host(struct net_bridge *br,
 
 	br_multicast_host_leave(mp, true);
 	if (!mp->ports && netif_running(br->dev))
-		mod_timer(&mp->timer, jiffies);
+		timer_mod(&mp->timer, jiffies);
 }
 
 static void br_mdb_flush_pgs(struct net_bridge *br,
diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index bf7e52b2bb13..9a99815f0abc 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -827,7 +827,7 @@ void br_multicast_del_pg(struct net_bridge_mdb_entry *mp,
 	queue_work(system_long_wq, &br->mcast_gc_work);
 
 	if (!mp->ports && !mp->host_joined && netif_running(br->dev))
-		mod_timer(&mp->timer, jiffies);
+		timer_mod(&mp->timer, jiffies);
 }
 
 static void br_multicast_find_del_pg(struct net_bridge *br,
@@ -1485,7 +1485,7 @@ void br_multicast_host_join(const struct net_bridge_mcast *brmctx,
 	if (br_group_is_l2(&mp->addr))
 		return;
 
-	mod_timer(&mp->timer, jiffies + brmctx->multicast_membership_interval);
+	timer_mod(&mp->timer, jiffies + brmctx->multicast_membership_interval);
 }
 
 void br_multicast_host_leave(struct net_bridge_mdb_entry *mp, bool notify)
@@ -1548,7 +1548,7 @@ __br_multicast_add_group(struct net_bridge_mcast *brmctx,
 
 found:
 	if (igmpv2_mldv1)
-		mod_timer(&p->timer,
+		timer_mod(&p->timer,
 			  now + brmctx->multicast_membership_interval);
 
 out:
@@ -1892,7 +1892,7 @@ static void br_multicast_send_query(struct net_bridge_mcast *brmctx,
 	time += own_query->startup_sent < brmctx->multicast_startup_query_count ?
 		brmctx->multicast_startup_query_interval :
 		brmctx->multicast_query_interval;
-	mod_timer(&own_query->timer, time);
+	timer_mod(&own_query->timer, time);
 }
 
 static void
@@ -1974,7 +1974,7 @@ static void br_multicast_port_group_rexmit(struct timer_list *t)
 				  &pg->key.addr, true, 0, &need_rexmit);
 
 	if (pg->grp_query_rexmit_cnt || need_rexmit)
-		mod_timer(&pg->rexmit_timer, jiffies +
+		timer_mod(&pg->rexmit_timer, jiffies +
 					     brmctx->multicast_last_member_interval);
 out:
 	spin_unlock(&br->multicast_lock);
@@ -2063,7 +2063,7 @@ static void br_multicast_enable(struct bridge_mcast_own_query *query)
 
 	if (timer_delete_sync_try(&query->timer) >= 0 ||
 	    timer_delete(&query->timer))
-		mod_timer(&query->timer, jiffies);
+		timer_mod(&query->timer, jiffies);
 }
 
 static void __br_multicast_enable_port_ctx(struct net_bridge_mcast_port *pmctx)
@@ -2162,7 +2162,7 @@ static int __grp_src_delete_marked(struct net_bridge_port_group *pg)
 static void __grp_src_mod_timer(struct net_bridge_group_src *src,
 				unsigned long expires)
 {
-	mod_timer(&src->timer, expires);
+	timer_mod(&src->timer, expires);
 	br_multicast_fwd_src_handle(src);
 }
 
@@ -2210,7 +2210,7 @@ static void __grp_src_query_marked_and_rexmit(struct net_bridge_mcast *brmctx,
 	lmi = now + brmctx->multicast_last_member_interval;
 	if (!timer_pending(&pg->rexmit_timer) ||
 	    time_after(pg->rexmit_timer.expires, lmi))
-		mod_timer(&pg->rexmit_timer, lmi);
+		timer_mod(&pg->rexmit_timer, lmi);
 }
 
 static void __grp_send_query_and_rexmit(struct net_bridge_mcast *brmctx,
@@ -2239,13 +2239,13 @@ static void __grp_send_query_and_rexmit(struct net_bridge_mcast *brmctx,
 					  &pg->key.addr, false, 0, NULL);
 		if (!timer_pending(&pg->rexmit_timer) ||
 		    time_after(pg->rexmit_timer.expires, lmi))
-			mod_timer(&pg->rexmit_timer, lmi);
+			timer_mod(&pg->rexmit_timer, lmi);
 	}
 
 	if (pg->filter_mode == MCAST_EXCLUDE &&
 	    (!timer_pending(&pg->timer) ||
 	     time_after(pg->timer.expires, now + br_multicast_lmqt(brmctx))))
-		mod_timer(&pg->timer, now + br_multicast_lmqt(brmctx));
+		timer_mod(&pg->timer, now + br_multicast_lmqt(brmctx));
 }
 
 /* State          Msg type      New state                Actions
@@ -2390,7 +2390,7 @@ static bool br_multicast_isexc(const struct net_bridge_mcast *brmctx,
 	}
 
 	pg->filter_mode = MCAST_EXCLUDE;
-	mod_timer(&pg->timer, jiffies + br_multicast_gmi(brmctx));
+	timer_mod(&pg->timer, jiffies + br_multicast_gmi(brmctx));
 
 	return changed;
 }
@@ -2642,7 +2642,7 @@ static bool br_multicast_toex(struct net_bridge_mcast *brmctx,
 	}
 
 	pg->filter_mode = MCAST_EXCLUDE;
-	mod_timer(&pg->timer, jiffies + br_multicast_gmi(brmctx));
+	timer_mod(&pg->timer, jiffies + br_multicast_gmi(brmctx));
 
 	return changed;
 }
@@ -3200,9 +3200,9 @@ br_multicast_update_query_timer(struct net_bridge_mcast *brmctx,
 				unsigned long max_delay)
 {
 	if (!timer_pending(&query->timer))
-		mod_timer(&query->delay_timer, jiffies + max_delay);
+		timer_mod(&query->delay_timer, jiffies + max_delay);
 
-	mod_timer(&query->timer, jiffies + brmctx->multicast_querier_interval);
+	timer_mod(&query->timer, jiffies + brmctx->multicast_querier_interval);
 }
 
 static void br_port_mc_router_state_change(struct net_bridge_port *p,
@@ -3343,7 +3343,7 @@ static void br_multicast_mark_router(struct net_bridge_mcast *brmctx,
 			if (!br_ip4_multicast_is_router(brmctx) &&
 			    !br_ip6_multicast_is_router(brmctx))
 				br_mc_router_state_change(brmctx->br, true);
-			mod_timer(timer, now + brmctx->multicast_querier_interval);
+			timer_mod(timer, now + brmctx->multicast_querier_interval);
 		}
 		return;
 	}
@@ -3353,7 +3353,7 @@ static void br_multicast_mark_router(struct net_bridge_mcast *brmctx,
 		return;
 
 	br_multicast_add_router(brmctx, pmctx, rlist, mc_router_list);
-	mod_timer(timer, now + brmctx->multicast_querier_interval);
+	timer_mod(timer, now + brmctx->multicast_querier_interval);
 }
 
 static void br_ip4_multicast_mark_router(struct net_bridge_mcast *brmctx,
@@ -3481,7 +3481,7 @@ static void br_ip4_multicast_query(struct net_bridge_mcast *brmctx,
 	    (timer_pending(&mp->timer) ?
 	     time_after(mp->timer.expires, now + max_delay) :
 	     timer_delete_sync_try(&mp->timer) >= 0))
-		mod_timer(&mp->timer, now + max_delay);
+		timer_mod(&mp->timer, now + max_delay);
 
 	for (pp = &mp->ports;
 	     (p = mlock_dereference(*pp, brmctx->br)) != NULL;
@@ -3491,7 +3491,7 @@ static void br_ip4_multicast_query(struct net_bridge_mcast *brmctx,
 		    timer_delete_sync_try(&p->timer) >= 0 &&
 		    (brmctx->multicast_igmp_version == 2 ||
 		     p->filter_mode == MCAST_EXCLUDE))
-			mod_timer(&p->timer, now + max_delay);
+			timer_mod(&p->timer, now + max_delay);
 	}
 
 out:
@@ -3570,7 +3570,7 @@ static int br_ip6_multicast_query(struct net_bridge_mcast *brmctx,
 	    (timer_pending(&mp->timer) ?
 	     time_after(mp->timer.expires, now + max_delay) :
 	     timer_delete_sync_try(&mp->timer) >= 0))
-		mod_timer(&mp->timer, now + max_delay);
+		timer_mod(&mp->timer, now + max_delay);
 
 	for (pp = &mp->ports;
 	     (p = mlock_dereference(*pp, brmctx->br)) != NULL;
@@ -3580,7 +3580,7 @@ static int br_ip6_multicast_query(struct net_bridge_mcast *brmctx,
 		    timer_delete_sync_try(&p->timer) >= 0 &&
 		    (brmctx->multicast_mld_version == 1 ||
 		     p->filter_mode == MCAST_EXCLUDE))
-			mod_timer(&p->timer, now + max_delay);
+			timer_mod(&p->timer, now + max_delay);
 	}
 
 out:
@@ -3638,7 +3638,7 @@ br_multicast_leave_group(struct net_bridge_mcast *brmctx,
 		time = jiffies + brmctx->multicast_last_member_count *
 				 brmctx->multicast_last_member_interval;
 
-		mod_timer(&own_query->timer, time);
+		timer_mod(&own_query->timer, time);
 
 		for (p = mlock_dereference(mp->ports, brmctx->br);
 		     p != NULL && pmctx != NULL;
@@ -3650,7 +3650,7 @@ br_multicast_leave_group(struct net_bridge_mcast *brmctx,
 			    (timer_pending(&p->timer) ?
 			     time_after(p->timer.expires, time) :
 			     timer_delete_sync_try(&p->timer) >= 0)) {
-				mod_timer(&p->timer, time);
+				timer_mod(&p->timer, time);
 			}
 
 			break;
@@ -3666,7 +3666,7 @@ br_multicast_leave_group(struct net_bridge_mcast *brmctx,
 		    (timer_pending(&mp->timer) ?
 		     time_after(mp->timer.expires, time) :
 		     timer_delete_sync_try(&mp->timer) >= 0)) {
-			mod_timer(&mp->timer, time);
+			timer_mod(&mp->timer, time);
 		}
 
 		goto out;
@@ -3682,7 +3682,7 @@ br_multicast_leave_group(struct net_bridge_mcast *brmctx,
 		    (timer_pending(&p->timer) ?
 		     time_after(p->timer.expires, time) :
 		     timer_delete_sync_try(&p->timer) >= 0)) {
-			mod_timer(&p->timer, time);
+			timer_mod(&p->timer, time);
 		}
 
 		break;
@@ -4162,7 +4162,7 @@ static void __br_multicast_open_query(struct net_bridge *br,
 	if (!br_opt_get(br, BROPT_MULTICAST_ENABLED))
 		return;
 
-	mod_timer(&query->timer, jiffies);
+	timer_mod(&query->timer, jiffies);
 }
 
 static void __br_multicast_open(struct net_bridge_mcast *brmctx)
@@ -4441,10 +4441,10 @@ int br_multicast_set_port_router(struct net_bridge_mcast_port *pmctx,
 	if (pmctx->multicast_router == val) {
 		/* Refresh the temp router port timer */
 		if (pmctx->multicast_router == MDB_RTR_TYPE_TEMP) {
-			mod_timer(&pmctx->ip4_mc_router_timer,
+			timer_mod(&pmctx->ip4_mc_router_timer,
 				  now + brmctx->multicast_querier_interval);
 #if IS_ENABLED(CONFIG_IPV6)
-			mod_timer(&pmctx->ip6_mc_router_timer,
+			timer_mod(&pmctx->ip6_mc_router_timer,
 				  now + brmctx->multicast_querier_interval);
 #endif
 		}
@@ -4649,14 +4649,14 @@ int br_multicast_set_querier(struct net_bridge_mcast *brmctx, unsigned long val)
 	max_delay = brmctx->multicast_query_response_interval;
 
 	if (!timer_pending(&brmctx->ip4_other_query.timer))
-		mod_timer(&brmctx->ip4_other_query.delay_timer,
+		timer_mod(&brmctx->ip4_other_query.delay_timer,
 			  jiffies + max_delay);
 
 	br_multicast_start_querier(brmctx, &brmctx->ip4_own_query);
 
 #if IS_ENABLED(CONFIG_IPV6)
 	if (!timer_pending(&brmctx->ip6_other_query.timer))
-		mod_timer(&brmctx->ip6_other_query.delay_timer,
+		timer_mod(&brmctx->ip6_other_query.delay_timer,
 			  jiffies + max_delay);
 
 	br_multicast_start_querier(brmctx, &brmctx->ip6_own_query);
diff --git a/net/bridge/br_multicast_eht.c b/net/bridge/br_multicast_eht.c
index 46c117615f04..1ca3b3d3cada 100644
--- a/net/bridge/br_multicast_eht.c
+++ b/net/bridge/br_multicast_eht.c
@@ -444,8 +444,8 @@ static void br_multicast_create_eht_set_entry(const struct net_bridge_mcast *brm
 	if (!set_h)
 		goto fail_set_entry;
 
-	mod_timer(&set_h->timer, jiffies + br_multicast_gmi(brmctx));
-	mod_timer(&eht_set->timer, jiffies + br_multicast_gmi(brmctx));
+	timer_mod(&set_h->timer, jiffies + br_multicast_gmi(brmctx));
+	timer_mod(&eht_set->timer, jiffies + br_multicast_gmi(brmctx));
 
 	return;
 
@@ -653,7 +653,7 @@ static bool __eht_inc_exc(const struct net_bridge_mcast *brmctx,
 							      &eht_src_addr);
 			if (!eht_set)
 				continue;
-			mod_timer(&eht_set->timer, jiffies + br_multicast_lmqt(brmctx));
+			timer_mod(&eht_set->timer, jiffies + br_multicast_lmqt(brmctx));
 		}
 	}
 
diff --git a/net/bridge/br_stp.c b/net/bridge/br_stp.c
index 024210f95468..c46dcbfea337 100644
--- a/net/bridge/br_stp.c
+++ b/net/bridge/br_stp.c
@@ -160,7 +160,7 @@ static void br_root_port_block(const struct net_bridge *br,
 	br_ifinfo_notify(RTM_NEWLINK, NULL, p);
 
 	if (br->forward_delay > 0)
-		mod_timer(&p->forward_delay_timer, jiffies + br->forward_delay);
+		timer_mod(&p->forward_delay_timer, jiffies + br->forward_delay);
 }
 
 /* called under bridge lock */
@@ -202,7 +202,7 @@ void br_become_root_bridge(struct net_bridge *br)
 
 	if (br->dev->flags & IFF_UP) {
 		br_config_bpdu_generation(br);
-		mod_timer(&br->hello_timer, jiffies + br->hello_time);
+		timer_mod(&br->hello_timer, jiffies + br->hello_time);
 	}
 }
 
@@ -242,7 +242,7 @@ void br_transmit_config(struct net_bridge_port *p)
 		p->topology_change_ack = 0;
 		p->config_pending = 0;
 		if (p->br->stp_enabled == BR_KERNEL_STP)
-			mod_timer(&p->hold_timer,
+			timer_mod(&p->hold_timer,
 				  round_jiffies(jiffies + BR_HOLD_TIME));
 	}
 }
@@ -257,7 +257,7 @@ static void br_record_config_information(struct net_bridge_port *p,
 	p->designated_port = bpdu->port_id;
 	p->designated_age = jiffies - bpdu->message_age;
 
-	mod_timer(&p->message_age_timer, jiffies
+	timer_mod(&p->message_age_timer, jiffies
 		  + (bpdu->max_age - bpdu->message_age));
 }
 
@@ -379,11 +379,11 @@ void br_topology_change_detection(struct net_bridge *br)
 
 	if (isroot) {
 		__br_set_topology_change(br, 1);
-		mod_timer(&br->topology_change_timer, jiffies
+		timer_mod(&br->topology_change_timer, jiffies
 			  + br->bridge_forward_delay + br->bridge_max_age);
 	} else if (!br->topology_change_detected) {
 		br_transmit_tcn(br);
-		mod_timer(&br->tcn_timer, jiffies + br->bridge_hello_time);
+		timer_mod(&br->tcn_timer, jiffies + br->bridge_hello_time);
 	}
 
 	br->topology_change_detected = 1;
@@ -463,7 +463,7 @@ static void br_make_forwarding(struct net_bridge_port *p)
 	br_ifinfo_notify(RTM_NEWLINK, NULL, p);
 
 	if (br->forward_delay != 0)
-		mod_timer(&p->forward_delay_timer, jiffies + br->forward_delay);
+		timer_mod(&p->forward_delay_timer, jiffies + br->forward_delay);
 }
 
 /* called under bridge lock */
@@ -538,7 +538,7 @@ void br_received_config_bpdu(struct net_bridge_port *p,
 				timer_delete(&br->topology_change_timer);
 				br_transmit_tcn(br);
 
-				mod_timer(&br->tcn_timer,
+				timer_mod(&br->tcn_timer,
 					  jiffies + br->bridge_hello_time);
 			}
 		}
diff --git a/net/bridge/br_stp_if.c b/net/bridge/br_stp_if.c
index c20a41bf253b..a2198fdceb2c 100644
--- a/net/bridge/br_stp_if.c
+++ b/net/bridge/br_stp_if.c
@@ -52,7 +52,7 @@ void br_stp_enable_bridge(struct net_bridge *br)
 
 	spin_lock_bh(&br->lock);
 	if (br->stp_enabled == BR_KERNEL_STP)
-		mod_timer(&br->hello_timer, jiffies + br->hello_time);
+		timer_mod(&br->hello_timer, jiffies + br->hello_time);
 	mod_delayed_work(system_long_wq, &br->gc_work, HZ / 10);
 
 	br_config_bpdu_generation(br);
@@ -171,7 +171,7 @@ static void br_stp_start(struct net_bridge *br)
 
 		/* To start timers on any ports left in blocking */
 		if (br->dev->flags & IFF_UP)
-			mod_timer(&br->hello_timer, jiffies + br->hello_time);
+			timer_mod(&br->hello_timer, jiffies + br->hello_time);
 		br_port_state_selection(br);
 	}
 
diff --git a/net/bridge/br_stp_timer.c b/net/bridge/br_stp_timer.c
index 8e283779a4cc..965801cbcf86 100644
--- a/net/bridge/br_stp_timer.c
+++ b/net/bridge/br_stp_timer.c
@@ -37,7 +37,7 @@ static void br_hello_timer_expired(struct timer_list *t)
 		br_config_bpdu_generation(br);
 
 		if (br->stp_enabled == BR_KERNEL_STP)
-			mod_timer(&br->hello_timer,
+			timer_mod(&br->hello_timer,
 				  round_jiffies(jiffies + br->hello_time));
 	}
 	spin_unlock(&br->lock);
@@ -86,7 +86,7 @@ static void br_forward_delay_timer_expired(struct timer_list *t)
 	spin_lock(&br->lock);
 	if (p->state == BR_STATE_LISTENING) {
 		br_set_state(p, BR_STATE_LEARNING);
-		mod_timer(&p->forward_delay_timer,
+		timer_mod(&p->forward_delay_timer,
 			  jiffies + br->forward_delay);
 	} else if (p->state == BR_STATE_LEARNING) {
 		br_set_state(p, BR_STATE_FORWARDING);
@@ -109,7 +109,7 @@ static void br_tcn_timer_expired(struct timer_list *t)
 	if (!br_is_root_bridge(br) && (br->dev->flags & IFF_UP)) {
 		br_transmit_tcn(br);
 
-		mod_timer(&br->tcn_timer, jiffies + br->bridge_hello_time);
+		timer_mod(&br->tcn_timer, jiffies + br->bridge_hello_time);
 	}
 	spin_unlock(&br->lock);
 }
diff --git a/net/can/af_can.c b/net/can/af_can.c
index 4aab7033c933..678ccf4bb3c2 100644
--- a/net/can/af_can.c
+++ b/net/can/af_can.c
@@ -803,7 +803,7 @@ static int can_pernet_init(struct net *net)
 		if (stats_timer) {
 			timer_setup(&net->can.stattimer, can_stat_update,
 				    0);
-			mod_timer(&net->can.stattimer,
+			timer_mod(&net->can.stattimer,
 				  round_jiffies(jiffies + HZ));
 		}
 		net->can.pkg_stats->jiffies_init = jiffies;
diff --git a/net/can/proc.c b/net/can/proc.c
index 0938bf7dd646..181c85c6242a 100644
--- a/net/can/proc.c
+++ b/net/can/proc.c
@@ -178,7 +178,7 @@ void can_stat_update(struct timer_list *t)
 	atomic_long_set(&pkg_stats->matches_delta, 0);
 
 	/* restart timer (one second) */
-	mod_timer(&net->can.stattimer, round_jiffies(jiffies + HZ));
+	timer_mod(&net->can.stattimer, round_jiffies(jiffies + HZ));
 }
 
 /*
diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
index 046764ec42de..8073966148d6 100644
--- a/net/core/drop_monitor.c
+++ b/net/core/drop_monitor.c
@@ -167,7 +167,7 @@ static struct sk_buff *reset_per_cpu_data(struct per_cpu_dm_data *data)
 	goto out;
 
 err:
-	mod_timer(&data->send_timer, jiffies + HZ / 10);
+	timer_mod(&data->send_timer, jiffies + HZ / 10);
 out:
 	raw_spin_lock_irqsave(&data->lock, flags);
 	swap(data->skb, skb);
@@ -313,7 +313,7 @@ net_dm_hw_reset_per_cpu_data(struct per_cpu_dm_data *hw_data)
 		 * allocation in 1/10 second. Otherwise, the probe function
 		 * will constantly bail out.
 		 */
-		mod_timer(&hw_data->send_timer, jiffies + HZ / 10);
+		timer_mod(&hw_data->send_timer, jiffies + HZ / 10);
 	}
 
 	raw_spin_lock_irqsave(&hw_data->lock, flags);
diff --git a/net/core/gen_estimator.c b/net/core/gen_estimator.c
index 7d426a8e29f3..170ca0cc681a 100644
--- a/net/core/gen_estimator.c
+++ b/net/core/gen_estimator.c
@@ -104,7 +104,7 @@ static void est_timer(struct timer_list *t)
 		/* Ouch... timer was delayed. */
 		est->next_jiffies = jiffies + 1;
 	}
-	mod_timer(&est->timer, est->next_jiffies);
+	timer_mod(&est->timer, est->next_jiffies);
 }
 
 /**
@@ -184,7 +184,7 @@ int gen_new_estimator(struct gnet_stats_basic_sync *bstats,
 
 	est->next_jiffies = jiffies + ((HZ/4) << intvl_log);
 	timer_setup(&est->timer, est_timer, 0);
-	mod_timer(&est->timer, est->next_jiffies);
+	timer_mod(&est->timer, est->next_jiffies);
 
 	rcu_assign_pointer(*rate_est, est);
 	if (lock)
diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index fed79161f41f..392ca515433d 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -299,7 +299,7 @@ static void neigh_add_timer(struct neighbour *n, unsigned long when)
 		n->confirmed = mint;
 	if (time_before(n->used, n->confirmed))
 		n->used = n->confirmed;
-	if (unlikely(mod_timer(&n->timer, when))) {
+	if (unlikely(timer_mod(&n->timer, when))) {
 		printk("NEIGH: BUG, double timer add, state is %x\n",
 		       n->nud_state);
 		dump_stack();
@@ -1099,7 +1099,7 @@ static void neigh_timer_handler(struct timer_list *t)
 	if (neigh->nud_state & NUD_IN_TIMER) {
 		if (time_before(next, jiffies + HZ/100))
 			next = jiffies + HZ/100;
-		if (!mod_timer(&neigh->timer, next))
+		if (!timer_mod(&neigh->timer, next))
 			neigh_hold(neigh);
 	}
 	if (neigh->nud_state & (NUD_INCOMPLETE | NUD_PROBE)) {
@@ -1599,7 +1599,7 @@ static void neigh_proxy_process(struct timer_list *t)
 	}
 	timer_delete(&tbl->proxy_timer);
 	if (sched_next)
-		mod_timer(&tbl->proxy_timer, jiffies + sched_next);
+		timer_mod(&tbl->proxy_timer, jiffies + sched_next);
 	spin_unlock(&tbl->proxy_queue.lock);
 }
 
@@ -1636,7 +1636,7 @@ void pneigh_enqueue(struct neigh_table *tbl, struct neigh_parms *p,
 	dev_hold(skb->dev);
 	__skb_queue_tail(&tbl->proxy_queue, skb);
 	p->qlen++;
-	mod_timer(&tbl->proxy_timer, sched_next);
+	timer_mod(&tbl->proxy_timer, sched_next);
 	spin_unlock(&tbl->proxy_queue.lock);
 }
 EXPORT_SYMBOL(pneigh_enqueue);
diff --git a/net/core/sock.c b/net/core/sock.c
index e54449c9ab0b..f694cf024d4e 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -3596,7 +3596,7 @@ EXPORT_SYMBOL(sk_send_sigurg);
 void sk_reset_timer(struct sock *sk, struct timer_list* timer,
 		    unsigned long expires)
 {
-	if (!mod_timer(timer, expires))
+	if (!timer_mod(timer, expires))
 		sock_hold(sk);
 }
 EXPORT_SYMBOL(sk_reset_timer);
diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index 523b60efd639..bdb31e4a20f1 100644
--- a/net/hsr/hsr_device.c
+++ b/net/hsr/hsr_device.c
@@ -70,12 +70,12 @@ static void hsr_check_announce(struct net_device *hsr_dev)
 		/* Enable announce timer and start sending supervisory frames */
 		if (!timer_pending(&hsr->announce_timer)) {
 			hsr->announce_count = 0;
-			mod_timer(&hsr->announce_timer, jiffies +
+			timer_mod(&hsr->announce_timer, jiffies +
 				  msecs_to_jiffies(HSR_ANNOUNCE_INTERVAL));
 		}
 
 		if (hsr->redbox && !timer_pending(&hsr->announce_proxy_timer))
-			mod_timer(&hsr->announce_proxy_timer, jiffies +
+			timer_mod(&hsr->announce_proxy_timer, jiffies +
 				  msecs_to_jiffies(HSR_ANNOUNCE_INTERVAL) / 2);
 	} else {
 		/* Deactivate the announce timer  */
@@ -415,7 +415,7 @@ static void hsr_announce(struct timer_list *t)
 	hsr->proto_ops->send_sv_frame(master, &interval, master->dev->dev_addr);
 
 	if (is_admin_up(master->dev))
-		mod_timer(&hsr->announce_timer, jiffies + interval);
+		timer_mod(&hsr->announce_timer, jiffies + interval);
 
 	rcu_read_unlock();
 }
@@ -448,7 +448,7 @@ static void hsr_proxy_announce(struct timer_list *t)
 		if (!interval)
 			interval = msecs_to_jiffies(HSR_ANNOUNCE_INTERVAL);
 
-		mod_timer(&hsr->announce_proxy_timer, jiffies + interval);
+		timer_mod(&hsr->announce_proxy_timer, jiffies + interval);
 	}
 
 done:
@@ -768,12 +768,12 @@ int hsr_dev_finalize(struct net_device *hsr_dev, struct net_device *slave[2],
 
 		hsr->redbox = true;
 		ether_addr_copy(hsr->macaddress_redbox, interlink->dev_addr);
-		mod_timer(&hsr->prune_proxy_timer,
+		timer_mod(&hsr->prune_proxy_timer,
 			  jiffies + msecs_to_jiffies(PRUNE_PROXY_PERIOD));
 	}
 
 	hsr_debugfs_init(hsr, hsr_dev);
-	mod_timer(&hsr->prune_timer, jiffies + msecs_to_jiffies(PRUNE_PERIOD));
+	timer_mod(&hsr->prune_timer, jiffies + msecs_to_jiffies(PRUNE_PERIOD));
 
 	return 0;
 
diff --git a/net/hsr/hsr_framereg.c b/net/hsr/hsr_framereg.c
index 3a2a2fa7a0a3..e56b35ca1839 100644
--- a/net/hsr/hsr_framereg.c
+++ b/net/hsr/hsr_framereg.c
@@ -679,7 +679,7 @@ void hsr_prune_nodes(struct timer_list *t)
 	spin_unlock_bh(&hsr->list_lock);
 
 	/* Restart timer */
-	mod_timer(&hsr->prune_timer,
+	timer_mod(&hsr->prune_timer,
 		  jiffies + msecs_to_jiffies(PRUNE_PERIOD));
 }
 
@@ -714,7 +714,7 @@ void hsr_prune_proxy_nodes(struct timer_list *t)
 	spin_unlock_bh(&hsr->list_lock);
 
 	/* Restart timer */
-	mod_timer(&hsr->prune_proxy_timer,
+	timer_mod(&hsr->prune_proxy_timer,
 		  jiffies + msecs_to_jiffies(PRUNE_PROXY_PERIOD));
 }
 
diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
index ab1084be3ce7..354a3b8c7226 100644
--- a/net/ipv4/igmp.c
+++ b/net/ipv4/igmp.c
@@ -220,7 +220,7 @@ static void igmp_start_timer(struct ip_mc_list *im, int max_delay)
 
 	im->tm_running = 1;
 	if (refcount_inc_not_zero(&im->refcnt)) {
-		if (mod_timer(&im->timer, jiffies + tv + 2))
+		if (timer_mod(&im->timer, jiffies + tv + 2))
 			ip_ma_put(im);
 	}
 }
@@ -235,7 +235,7 @@ static void igmp_gq_start_timer(struct in_device *in_dev)
 		return;
 
 	in_dev->mr_gq_running = 1;
-	if (!mod_timer(&in_dev->mr_gq_timer, exp))
+	if (!timer_mod(&in_dev->mr_gq_timer, exp))
 		in_dev_hold(in_dev);
 }
 
@@ -243,7 +243,7 @@ static void igmp_ifc_start_timer(struct in_device *in_dev, int delay)
 {
 	int tv = get_random_u32_below(delay);
 
-	if (!mod_timer(&in_dev->mr_ifc_timer, jiffies+tv+2))
+	if (!timer_mod(&in_dev->mr_ifc_timer, jiffies+tv+2))
 		in_dev_hold(in_dev);
 }
 
diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index c437a1c2c6ac..7b09658a52c1 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -1143,7 +1143,7 @@ static void reqsk_timer_handler(struct timer_list *t)
 	     inet_rsk(req)->acked)) {
 		if (req->num_timeout++ == 0)
 			atomic_dec(&queue->young);
-		mod_timer(&req->rsk_timer, jiffies + reqsk_timeout(req, TCP_RTO_MAX));
+		timer_mod(&req->rsk_timer, jiffies + reqsk_timeout(req, TCP_RTO_MAX));
 
 		if (!nreq)
 			return;
@@ -1190,7 +1190,7 @@ static bool reqsk_queue_hash_req(struct request_sock *req,
 
 	/* The timer needs to be setup after a successful insertion. */
 	timer_setup(&req->rsk_timer, reqsk_timer_handler, TIMER_PINNED);
-	mod_timer(&req->rsk_timer, jiffies + timeout);
+	timer_mod(&req->rsk_timer, jiffies + timeout);
 
 	/* before letting lookups find us, make sure all req fields
 	 * are committed to memory and refcnt initialized.
diff --git a/net/ipv4/inet_fragment.c b/net/ipv4/inet_fragment.c
index 470ab17ceb51..f28fed049f92 100644
--- a/net/ipv4/inet_fragment.c
+++ b/net/ipv4/inet_fragment.c
@@ -345,7 +345,7 @@ static struct inet_frag_queue *inet_frag_create(struct fqdir *fqdir,
 		*prev = ERR_PTR(-ENOMEM);
 		return NULL;
 	}
-	mod_timer(&q->timer, jiffies + fqdir->timeout);
+	timer_mod(&q->timer, jiffies + fqdir->timeout);
 
 	*prev = rhashtable_lookup_get_insert_key(&fqdir->rhashtable, &q->key,
 						 &q->node, f->rhash_params);
diff --git a/net/ipv4/inet_timewait_sock.c b/net/ipv4/inet_timewait_sock.c
index 663a4a915a54..1a9c31ee31ca 100644
--- a/net/ipv4/inet_timewait_sock.c
+++ b/net/ipv4/inet_timewait_sock.c
@@ -255,7 +255,7 @@ void inet_twsk_deschedule_put(struct inet_timewait_sock *tw)
 	 * 1) cpu x sets twsk refcount to 3
 	 * 2) cpu y bumps refcount to 4
 	 * 3) cpu y calls inet_twsk_deschedule_put() and shuts timer down
-	 * 4) cpu x tries to start timer, but mod_timer is a noop post-shutdown
+	 * 4) cpu x tries to start timer, but timer_mod is a noop post-shutdown
 	 * -> timer refcount is never decremented.
 	 */
 	spin_lock(lock);
@@ -300,7 +300,7 @@ void __inet_twsk_schedule(struct inet_timewait_sock *tw, int timeo, bool rearm)
 
 		__NET_INC_STATS(twsk_net(tw), kill ? LINUX_MIB_TIMEWAITKILLED :
 						     LINUX_MIB_TIMEWAITED);
-		BUG_ON(mod_timer(&tw->tw_timer, jiffies + timeo));
+		BUG_ON(timer_mod(&tw->tw_timer, jiffies + timeo));
 		refcount_inc(&tw->tw_dr->tw_refcount);
 	} else {
 		timer_mod_pending(&tw->tw_timer, jiffies + timeo);
diff --git a/net/ipv4/ip_fragment.c b/net/ipv4/ip_fragment.c
index 64b3fb3208af..a2ebdca25ae4 100644
--- a/net/ipv4/ip_fragment.c
+++ b/net/ipv4/ip_fragment.c
@@ -242,7 +242,7 @@ static int ip_frag_reinit(struct ipq *qp)
 {
 	unsigned int sum_truesize = 0;
 
-	if (!mod_timer(&qp->q.timer, jiffies + qp->q.fqdir->timeout)) {
+	if (!timer_mod(&qp->q.timer, jiffies + qp->q.fqdir->timeout)) {
 		refcount_inc(&qp->q.refcnt);
 		return -ETIMEDOUT;
 	}
diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index 5f1c7adf6680..bcf41da0bb10 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -781,7 +781,7 @@ static void ipmr_expire_process(struct timer_list *t)
 	unsigned long now;
 
 	if (!spin_trylock(&mfc_unres_lock)) {
-		mod_timer(&mrt->ipmr_expire_timer, jiffies+HZ/10);
+		timer_mod(&mrt->ipmr_expire_timer, jiffies+HZ/10);
 		return;
 	}
 
@@ -805,7 +805,7 @@ static void ipmr_expire_process(struct timer_list *t)
 	}
 
 	if (!list_empty(&mrt->mfc_unres_queue))
-		mod_timer(&mrt->ipmr_expire_timer, jiffies + expires);
+		timer_mod(&mrt->ipmr_expire_timer, jiffies + expires);
 
 out:
 	spin_unlock(&mfc_unres_lock);
@@ -1177,7 +1177,7 @@ static int ipmr_cache_unresolved(struct mr_table *mrt, vifi_t vifi,
 		mroute_netlink_event(mrt, c, RTM_NEWROUTE);
 
 		if (atomic_read(&mrt->cache_resolve_queue_len) == 1)
-			mod_timer(&mrt->ipmr_expire_timer,
+			timer_mod(&mrt->ipmr_expire_timer,
 				  c->_c.mfc_un.unres.expires);
 	}
 
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 6edc441b3702..1869b8525571 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -3039,7 +3039,7 @@ static struct timer_list tcp_orphan_timer;
 static void tcp_orphan_update(struct timer_list *unused)
 {
 	WRITE_ONCE(tcp_orphan_cache, tcp_orphan_count_sum());
-	mod_timer(&tcp_orphan_timer, jiffies + TCP_ORPHAN_TIMER_PERIOD);
+	timer_mod(&tcp_orphan_timer, jiffies + TCP_ORPHAN_TIMER_PERIOD);
 }
 
 static bool tcp_too_many_orphans(int shift)
@@ -5128,7 +5128,7 @@ void __init tcp_init(void)
 	percpu_counter_init(&tcp_sockets_allocated, 0, GFP_KERNEL);
 
 	timer_setup(&tcp_orphan_timer, tcp_orphan_update, TIMER_DEFERRABLE);
-	mod_timer(&tcp_orphan_timer, jiffies + TCP_ORPHAN_TIMER_PERIOD);
+	timer_mod(&tcp_orphan_timer, jiffies + TCP_ORPHAN_TIMER_PERIOD);
 
 	inet_hashinfo2_init(&tcp_hashinfo, "tcp_listen_portaddr_hash",
 			    thash_entries, 21,  /* one slot per 2 MB*/
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 39cfe7a8c2bc..278ec87b5b54 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -326,7 +326,7 @@ static void addrconf_del_dad_work(struct inet6_ifaddr *ifp)
 static void addrconf_mod_rs_timer(struct inet6_dev *idev,
 				  unsigned long when)
 {
-	if (!mod_timer(&idev->rs_timer, jiffies + when))
+	if (!timer_mod(&idev->rs_timer, jiffies + when))
 		in6_dev_hold(idev);
 }
 
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index 5216b8b6314a..0ec008408ee6 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -1333,14 +1333,14 @@ static void fib6_start_gc(struct net *net, struct fib6_info *rt)
 {
 	if (!timer_pending(&net->ipv6.ip6_fib_timer) &&
 	    (rt->fib6_flags & RTF_EXPIRES))
-		mod_timer(&net->ipv6.ip6_fib_timer,
+		timer_mod(&net->ipv6.ip6_fib_timer,
 			  jiffies + net->ipv6.sysctl.ip6_rt_gc_interval);
 }
 
 void fib6_force_start_gc(struct net *net)
 {
 	if (!timer_pending(&net->ipv6.ip6_fib_timer))
-		mod_timer(&net->ipv6.ip6_fib_timer,
+		timer_mod(&net->ipv6.ip6_fib_timer,
 			  jiffies + net->ipv6.sysctl.ip6_rt_gc_interval);
 }
 
@@ -2367,7 +2367,7 @@ void fib6_run_gc(unsigned long expires, struct net *net, bool force)
 	if (force) {
 		spin_lock_bh(&net->ipv6.fib6_gc_lock);
 	} else if (!spin_trylock_bh(&net->ipv6.fib6_gc_lock)) {
-		mod_timer(&net->ipv6.ip6_fib_timer, jiffies + HZ);
+		timer_mod(&net->ipv6.ip6_fib_timer, jiffies + HZ);
 		return;
 	}
 	gc_args.timeout = expires ? (int)expires :
@@ -2379,7 +2379,7 @@ void fib6_run_gc(unsigned long expires, struct net *net, bool force)
 	net->ipv6.ip6_rt_last_gc = now;
 
 	if (gc_args.more)
-		mod_timer(&net->ipv6.ip6_fib_timer,
+		timer_mod(&net->ipv6.ip6_fib_timer,
 			  round_jiffies(now
 					+ net->ipv6.sysctl.ip6_rt_gc_interval));
 	else
diff --git a/net/ipv6/ip6_flowlabel.c b/net/ipv6/ip6_flowlabel.c
index a3ff575798dd..272dbeb30eb9 100644
--- a/net/ipv6/ip6_flowlabel.c
+++ b/net/ipv6/ip6_flowlabel.c
@@ -140,7 +140,7 @@ static void fl_release(struct ip6_flowlabel *fl)
 		}
 		if (!timer_pending(&ip6_fl_gc_timer) ||
 		    time_after(ip6_fl_gc_timer.expires, ttd))
-			mod_timer(&ip6_fl_gc_timer, ttd);
+			timer_mod(&ip6_fl_gc_timer, ttd);
 	}
 	spin_unlock_bh(&ip6_fl_lock);
 }
@@ -180,7 +180,7 @@ static void ip6_fl_gc(struct timer_list *unused)
 	if (!sched && atomic_read(&fl_size))
 		sched = now + FL_MAX_LINGER;
 	if (sched) {
-		mod_timer(&ip6_fl_gc_timer, sched);
+		timer_mod(&ip6_fl_gc_timer, sched);
 	}
 	spin_unlock(&ip6_fl_lock);
 }
diff --git a/net/ipv6/ip6mr.c b/net/ipv6/ip6mr.c
index 93eff77c621a..b99622044c3c 100644
--- a/net/ipv6/ip6mr.c
+++ b/net/ipv6/ip6mr.c
@@ -844,7 +844,7 @@ static void ipmr_do_expire_process(struct mr_table *mrt)
 	}
 
 	if (!list_empty(&mrt->mfc_unres_queue))
-		mod_timer(&mrt->ipmr_expire_timer, jiffies + expires);
+		timer_mod(&mrt->ipmr_expire_timer, jiffies + expires);
 }
 
 static void ipmr_expire_process(struct timer_list *t)
@@ -852,7 +852,7 @@ static void ipmr_expire_process(struct timer_list *t)
 	struct mr_table *mrt = timer_container_of(mrt, t, ipmr_expire_timer);
 
 	if (!spin_trylock(&mfc_unres_lock)) {
-		mod_timer(&mrt->ipmr_expire_timer, jiffies + 1);
+		timer_mod(&mrt->ipmr_expire_timer, jiffies + 1);
 		return;
 	}
 
diff --git a/net/llc/llc_c_ac.c b/net/llc/llc_c_ac.c
index 8be393ccfc22..384d6bce2cac 100644
--- a/net/llc/llc_c_ac.c
+++ b/net/llc/llc_c_ac.c
@@ -612,7 +612,7 @@ int llc_conn_ac_set_remote_busy(struct sock *sk, struct sk_buff *skb)
 
 	if (!llc->remote_busy_flag) {
 		llc->remote_busy_flag = 1;
-		mod_timer(&llc->busy_state_timer.timer,
+		timer_mod(&llc->busy_state_timer.timer,
 			 jiffies + llc->busy_state_timer.expire);
 	}
 	return 0;
@@ -845,7 +845,7 @@ int llc_conn_ac_start_p_timer(struct sock *sk, struct sk_buff *skb)
 	struct llc_sock *llc = llc_sk(sk);
 
 	llc_conn_set_p_flag(sk, 1);
-	mod_timer(&llc->pf_cycle_timer.timer,
+	timer_mod(&llc->pf_cycle_timer.timer,
 		  jiffies + llc->pf_cycle_timer.expire);
 	return 0;
 }
@@ -1123,7 +1123,7 @@ int llc_conn_ac_start_ack_timer(struct sock *sk, struct sk_buff *skb)
 {
 	struct llc_sock *llc = llc_sk(sk);
 
-	mod_timer(&llc->ack_timer.timer, jiffies + llc->ack_timer.expire);
+	timer_mod(&llc->ack_timer.timer, jiffies + llc->ack_timer.expire);
 	return 0;
 }
 
@@ -1131,7 +1131,7 @@ int llc_conn_ac_start_rej_timer(struct sock *sk, struct sk_buff *skb)
 {
 	struct llc_sock *llc = llc_sk(sk);
 
-	mod_timer(&llc->rej_sent_timer.timer,
+	timer_mod(&llc->rej_sent_timer.timer,
 		  jiffies + llc->rej_sent_timer.expire);
 	return 0;
 }
@@ -1142,7 +1142,7 @@ int llc_conn_ac_start_ack_tmr_if_not_running(struct sock *sk,
 	struct llc_sock *llc = llc_sk(sk);
 
 	if (!timer_pending(&llc->ack_timer.timer))
-		mod_timer(&llc->ack_timer.timer,
+		timer_mod(&llc->ack_timer.timer,
 			  jiffies + llc->ack_timer.expire);
 	return 0;
 }
@@ -1190,7 +1190,7 @@ int llc_conn_ac_upd_nr_received(struct sock *sk, struct sk_buff *skb)
 			llc_conn_ac_data_confirm(sk, skb);
 		}
 		if (unacked)
-			mod_timer(&llc->ack_timer.timer,
+			timer_mod(&llc->ack_timer.timer,
 				  jiffies + llc->ack_timer.expire);
 	} else if (llc->failed_data_req) {
 		u8 f_bit;
diff --git a/net/mac80211/agg-rx.c b/net/mac80211/agg-rx.c
index e1d9e02f752b..db4e60239e5c 100644
--- a/net/mac80211/agg-rx.c
+++ b/net/mac80211/agg-rx.c
@@ -150,7 +150,7 @@ static void sta_rx_agg_session_timer_expired(struct timer_list *t)
 
 	timeout = tid_rx->last_rx + TU_TO_JIFFIES(tid_rx->timeout);
 	if (time_is_after_jiffies(timeout)) {
-		mod_timer(&tid_rx->session_timer, timeout);
+		timer_mod(&tid_rx->session_timer, timeout);
 		return;
 	}
 
@@ -444,7 +444,7 @@ void __ieee80211_start_rx_ba_session(struct sta_info *sta,
 	rcu_assign_pointer(sta->ampdu_mlme.tid_rx[tid], tid_agg_rx);
 
 	if (timeout) {
-		mod_timer(&tid_agg_rx->session_timer, TU_TO_EXP_TIME(timeout));
+		timer_mod(&tid_agg_rx->session_timer, TU_TO_EXP_TIME(timeout));
 		tid_agg_rx->last_rx = jiffies;
 	}
 
diff --git a/net/mac80211/agg-tx.c b/net/mac80211/agg-tx.c
index a99b3868fea7..068de82f2c76 100644
--- a/net/mac80211/agg-tx.c
+++ b/net/mac80211/agg-tx.c
@@ -455,7 +455,7 @@ static void ieee80211_send_addba_with_timeout(struct sta_info *sta,
 	lockdep_assert_wiphy(sta->local->hw.wiphy);
 
 	/* activate the timer for the recipient's addBA response */
-	mod_timer(&tid_tx->addba_resp_timer, jiffies + ADDBA_RESP_INTERVAL);
+	timer_mod(&tid_tx->addba_resp_timer, jiffies + ADDBA_RESP_INTERVAL);
 	ht_dbg(sdata, "activated addBA response timer on %pM tid %d\n",
 	       sta->sta.addr, tid);
 
@@ -585,7 +585,7 @@ static void sta_tx_agg_session_timer_expired(struct timer_list *t)
 
 	timeout = tid_tx->last_tx + TU_TO_JIFFIES(tid_tx->timeout);
 	if (time_is_after_jiffies(timeout)) {
-		mod_timer(&tid_tx->session_timer, timeout);
+		timer_mod(&tid_tx->session_timer, timeout);
 		return;
 	}
 
@@ -1046,7 +1046,7 @@ void ieee80211_process_addba_resp(struct ieee80211_local *local,
 			le16_to_cpu(mgmt->u.action.u.addba_resp.timeout);
 
 		if (tid_tx->timeout) {
-			mod_timer(&tid_tx->session_timer,
+			timer_mod(&tid_tx->session_timer,
 				  TU_TO_EXP_TIME(tid_tx->timeout));
 			tid_tx->last_tx = jiffies;
 		}
diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index 86ef9a858eb4..f30c3b754171 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -370,7 +370,7 @@ static void __ieee80211_sta_join_ibss(struct ieee80211_sub_if_data *sdata,
 	ieee80211_bss_info_change_notify(sdata, bss_change);
 
 	ifibss->state = IEEE80211_IBSS_MLME_JOINED;
-	mod_timer(&ifibss->timer,
+	timer_mod(&ifibss->timer,
 		  round_jiffies(jiffies + IEEE80211_IBSS_MERGE_INTERVAL));
 
 	bss_meta.chan = chan;
@@ -1270,7 +1270,7 @@ static void ieee80211_sta_merge_ibss(struct ieee80211_sub_if_data *sdata)
 
 	lockdep_assert_wiphy(sdata->local->hw.wiphy);
 
-	mod_timer(&ifibss->timer,
+	timer_mod(&ifibss->timer,
 		  round_jiffies(jiffies + IEEE80211_IBSS_MERGE_INTERVAL));
 
 	ieee80211_ibss_sta_expire(sdata);
@@ -1484,7 +1484,7 @@ static void ieee80211_sta_find_ibss(struct ieee80211_sub_if_data *sdata)
 			       IEEE80211_IBSS_JOIN_TIMEOUT))
 			ieee80211_sta_create_ibss(sdata);
 
-		mod_timer(&ifibss->timer,
+		timer_mod(&ifibss->timer,
 			  round_jiffies(jiffies + interval));
 	}
 }
diff --git a/net/mac80211/led.c b/net/mac80211/led.c
index 2e10136b3e70..08348bbffbc1 100644
--- a/net/mac80211/led.c
+++ b/net/mac80211/led.c
@@ -265,7 +265,7 @@ static void tpt_trig_timer(struct timer_list *t)
 	if (!tpt_trig->running)
 		return;
 
-	mod_timer(&tpt_trig->timer, round_jiffies(jiffies + HZ));
+	timer_mod(&tpt_trig->timer, round_jiffies(jiffies + HZ));
 
 	tpt = tpt_trig_traffic(local, tpt_trig);
 
@@ -331,7 +331,7 @@ static void ieee80211_start_tpt_led_trig(struct ieee80211_local *local)
 	tpt_trig->running = true;
 
 	tpt_trig_timer(&tpt_trig->timer);
-	mod_timer(&tpt_trig->timer, round_jiffies(jiffies + HZ));
+	timer_mod(&tpt_trig->timer, round_jiffies(jiffies + HZ));
 }
 
 static void ieee80211_stop_tpt_led_trig(struct ieee80211_local *local)
diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index b17f5b75d699..7c9556c249d6 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -922,7 +922,7 @@ static void ieee80211_mesh_housekeeping(struct ieee80211_sub_if_data *sdata)
 
 	mesh_fast_tx_gc(sdata);
 
-	mod_timer(&ifmsh->housekeeping_timer,
+	timer_mod(&ifmsh->housekeeping_timer,
 		  round_jiffies(jiffies +
 				IEEE80211_MESH_HOUSEKEEPING_INTERVAL));
 }
@@ -939,7 +939,7 @@ static void ieee80211_mesh_rootpath(struct ieee80211_sub_if_data *sdata)
 	else
 		interval = ifmsh->mshcfg.dot11MeshHWMProotInterval;
 
-	mod_timer(&ifmsh->mesh_path_root_timer,
+	timer_mod(&ifmsh->mesh_path_root_timer,
 		  round_jiffies(TU_TO_EXP_TIME(interval)));
 }
 
diff --git a/net/mac80211/mesh_hwmp.c b/net/mac80211/mesh_hwmp.c
index 2666ee263731..7f191efa4588 100644
--- a/net/mac80211/mesh_hwmp.c
+++ b/net/mac80211/mesh_hwmp.c
@@ -1043,7 +1043,7 @@ static void mesh_queue_preq(struct mesh_path *mpath, u8 flags)
 		ifmsh->last_preq = jiffies - min_preq_int_jiff(sdata) - 1;
 		wiphy_work_queue(sdata->local->hw.wiphy, &sdata->work);
 	} else
-		mod_timer(&ifmsh->mesh_path_timer, ifmsh->last_preq +
+		timer_mod(&ifmsh->mesh_path_timer, ifmsh->last_preq +
 						min_preq_int_jiff(sdata));
 }
 
@@ -1132,7 +1132,7 @@ void mesh_path_start_discovery(struct ieee80211_sub_if_data *sdata)
 
 	spin_lock_bh(&mpath->state_lock);
 	if (!(mpath->flags & MESH_PATH_DELETED))
-		mod_timer(&mpath->timer, jiffies + mpath->discovery_timeout);
+		timer_mod(&mpath->timer, jiffies + mpath->discovery_timeout);
 	spin_unlock_bh(&mpath->state_lock);
 
 enddiscovery:
diff --git a/net/mac80211/mesh_plink.c b/net/mac80211/mesh_plink.c
index 4fe05d640953..c86c86e2c58f 100644
--- a/net/mac80211/mesh_plink.c
+++ b/net/mac80211/mesh_plink.c
@@ -17,7 +17,7 @@
 #define PLINK_GET_LLID(p) (p + 2)
 #define PLINK_GET_PLID(p) (p + 4)
 
-#define mod_plink_timer(s, t) (mod_timer(&s->mesh->plink_timer, \
+#define mod_plink_timer(s, t) (timer_mod(&s->mesh->plink_timer, \
 				jiffies + msecs_to_jiffies(t)))
 
 enum plink_event {
@@ -750,7 +750,7 @@ void mesh_plink_timer(struct timer_list *t)
 static inline void mesh_plink_timer_set(struct sta_info *sta, u32 timeout)
 {
 	sta->mesh->plink_timeout = timeout;
-	mod_timer(&sta->mesh->plink_timer, jiffies + msecs_to_jiffies(timeout));
+	timer_mod(&sta->mesh->plink_timer, jiffies + msecs_to_jiffies(timeout));
 }
 
 static bool llid_in_use(struct ieee80211_sub_if_data *sdata,
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 04f29c89bfb6..c5eb6cb0ee8c 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -112,7 +112,7 @@ static void run_again(struct ieee80211_sub_if_data *sdata,
 
 	if (!timer_pending(&sdata->u.mgd.timer) ||
 	    time_before(timeout, sdata->u.mgd.timer.expires))
-		mod_timer(&sdata->u.mgd.timer, timeout);
+		timer_mod(&sdata->u.mgd.timer, timeout);
 }
 
 void ieee80211_sta_reset_beacon_monitor(struct ieee80211_sub_if_data *sdata)
@@ -123,7 +123,7 @@ void ieee80211_sta_reset_beacon_monitor(struct ieee80211_sub_if_data *sdata)
 	if (ieee80211_hw_check(&sdata->local->hw, CONNECTION_MONITOR))
 		return;
 
-	mod_timer(&sdata->u.mgd.bcn_mon_timer,
+	timer_mod(&sdata->u.mgd.bcn_mon_timer,
 		  round_jiffies_up(jiffies + sdata->u.mgd.beacon_timeout));
 }
 
@@ -140,7 +140,7 @@ void ieee80211_sta_reset_conn_monitor(struct ieee80211_sub_if_data *sdata)
 	if (ieee80211_hw_check(&sdata->local->hw, CONNECTION_MONITOR))
 		return;
 
-	mod_timer(&ifmgd->conn_mon_timer,
+	timer_mod(&ifmgd->conn_mon_timer,
 		  round_jiffies_up(jiffies + IEEE80211_CONNECTION_IDLE_TIME));
 }
 
@@ -3170,7 +3170,7 @@ static void ieee80211_enable_ps(struct ieee80211_local *local,
 
 	if (conf->dynamic_ps_timeout > 0 &&
 	    !ieee80211_hw_check(&local->hw, SUPPORTS_DYNAMIC_PS)) {
-		mod_timer(&local->dynamic_ps_timer, jiffies +
+		timer_mod(&local->dynamic_ps_timer, jiffies +
 			  msecs_to_jiffies(conf->dynamic_ps_timeout));
 	} else {
 		if (ieee80211_hw_check(&local->hw, PS_NULLFUNC_STACK))
@@ -3334,7 +3334,7 @@ void ieee80211_dynamic_ps_enable_work(struct wiphy *wiphy,
 	if (local->hw.conf.dynamic_ps_timeout > 0) {
 		/* don't enter PS if TX frames are pending */
 		if (drv_tx_frames_pending(local)) {
-			mod_timer(&local->dynamic_ps_timer, jiffies +
+			timer_mod(&local->dynamic_ps_timer, jiffies +
 				  msecs_to_jiffies(
 				  local->hw.conf.dynamic_ps_timeout));
 			return;
@@ -3350,7 +3350,7 @@ void ieee80211_dynamic_ps_enable_work(struct wiphy *wiphy,
 			if (local->queue_stop_reasons[q]) {
 				spin_unlock_irqrestore(&local->queue_stop_reason_lock,
 						       flags);
-				mod_timer(&local->dynamic_ps_timer, jiffies +
+				timer_mod(&local->dynamic_ps_timer, jiffies +
 					  msecs_to_jiffies(
 					  local->hw.conf.dynamic_ps_timeout));
 				return;
@@ -3362,7 +3362,7 @@ void ieee80211_dynamic_ps_enable_work(struct wiphy *wiphy,
 	if (ieee80211_hw_check(&local->hw, PS_NULLFUNC_STACK) &&
 	    !(ifmgd->flags & IEEE80211_STA_NULLFUNC_ACKED)) {
 		if (drv_tx_frames_pending(local)) {
-			mod_timer(&local->dynamic_ps_timer, jiffies +
+			timer_mod(&local->dynamic_ps_timer, jiffies +
 				  msecs_to_jiffies(
 				  local->hw.conf.dynamic_ps_timeout));
 		} else {
@@ -4193,7 +4193,7 @@ static void ieee80211_reset_ap_probe(struct ieee80211_sub_if_data *sdata)
 	 */
 	ieee80211_sta_reset_beacon_monitor(sdata);
 
-	mod_timer(&ifmgd->conn_mon_timer,
+	timer_mod(&ifmgd->conn_mon_timer,
 		  round_jiffies_up(jiffies +
 				   IEEE80211_CONNECTION_IDLE_TIME));
 }
@@ -8434,7 +8434,7 @@ static void ieee80211_sta_conn_mon_timer(struct timer_list *t)
 	 * the later date, but do not actually probe at this time.
 	 */
 	if (time_is_after_jiffies(timeout)) {
-		mod_timer(&ifmgd->conn_mon_timer, round_jiffies_up(timeout));
+		timer_mod(&ifmgd->conn_mon_timer, round_jiffies_up(timeout));
 		return;
 	}
 
diff --git a/net/mac80211/ocb.c b/net/mac80211/ocb.c
index a5d4358f122a..ca9953743670 100644
--- a/net/mac80211/ocb.c
+++ b/net/mac80211/ocb.c
@@ -112,7 +112,7 @@ static void ieee80211_ocb_housekeeping(struct ieee80211_sub_if_data *sdata)
 
 	ieee80211_sta_expire(sdata, IEEE80211_OCB_PEER_INACTIVITY_LIMIT);
 
-	mod_timer(&ifocb->housekeeping_timer,
+	timer_mod(&ifocb->housekeeping_timer,
 		  round_jiffies(jiffies + IEEE80211_OCB_HOUSEKEEPING_INTERVAL));
 }
 
diff --git a/net/mac80211/offchannel.c b/net/mac80211/offchannel.c
index 2b9abc27462e..4c6ee78003b9 100644
--- a/net/mac80211/offchannel.c
+++ b/net/mac80211/offchannel.c
@@ -72,7 +72,7 @@ static void ieee80211_offchannel_ps_disable(struct ieee80211_sub_if_data *sdata)
 		 * the buffered packets (if any).
 		 */
 		ieee80211_send_nullfunc(local, sdata, false);
-		mod_timer(&local->dynamic_ps_timer, jiffies +
+		timer_mod(&local->dynamic_ps_timer, jiffies +
 			  msecs_to_jiffies(local->hw.conf.dynamic_ps_timeout));
 	}
 
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 09beb65d6108..6eb19d8e68e9 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -1238,7 +1238,7 @@ static void ieee80211_sta_reorder_release(struct ieee80211_sub_if_data *sdata,
  set_release_timer:
 
 		if (!tid_agg_rx->removed)
-			mod_timer(&tid_agg_rx->reorder_timer,
+			timer_mod(&tid_agg_rx->reorder_timer,
 				  tid_agg_rx->reorder_time[j] + 1 +
 				  HT_RX_REORDER_BUF_TIMEOUT);
 	} else {
@@ -3236,7 +3236,7 @@ ieee80211_rx_h_data(struct ieee80211_rx_data *rx)
 		    ((struct ethhdr *)rx->skb->data)->h_dest) &&
 	    (!local->scanning &&
 	     !test_bit(SDATA_STATE_OFFCHANNEL, &sdata->state)))
-		mod_timer(&local->dynamic_ps_timer, jiffies +
+		timer_mod(&local->dynamic_ps_timer, jiffies +
 			  msecs_to_jiffies(local->hw.conf.dynamic_ps_timeout));
 
 	ieee80211_deliver_skb(rx);
@@ -3290,7 +3290,7 @@ ieee80211_rx_h_ctrl(struct ieee80211_rx_data *rx, struct sk_buff_head *frames)
 
 		/* reset session timer */
 		if (tid_agg_rx->timeout)
-			mod_timer(&tid_agg_rx->session_timer,
+			timer_mod(&tid_agg_rx->session_timer,
 				  TU_TO_EXP_TIME(tid_agg_rx->timeout));
 
 		spin_lock(&tid_agg_rx->reorder_lock);
diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index 02de319b45db..c55fb324df77 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -1565,7 +1565,7 @@ static void sta_info_cleanup(struct timer_list *t)
 	if (!timer_needed)
 		return;
 
-	mod_timer(&local->sta_cleanup,
+	timer_mod(&local->sta_cleanup,
 		  round_jiffies(jiffies + STA_INFO_CLEANUP_INTERVAL));
 }
 
diff --git a/net/mac80211/status.c b/net/mac80211/status.c
index b17b3cc7fb90..170949770eb6 100644
--- a/net/mac80211/status.c
+++ b/net/mac80211/status.c
@@ -148,7 +148,7 @@ static void ieee80211_handle_filtered_frame(struct ieee80211_local *local,
 		sta_info_recalc_tim(sta);
 
 		if (!timer_pending(&local->sta_cleanup))
-			mod_timer(&local->sta_cleanup,
+			timer_mod(&local->sta_cleanup,
 				  round_jiffies(jiffies +
 						STA_INFO_CLEANUP_INTERVAL));
 		return;
@@ -1079,7 +1079,7 @@ static void __ieee80211_tx_status(struct ieee80211_hw *hw,
 		if (info->flags & IEEE80211_TX_STAT_ACK)
 			local->ps_sdata->u.mgd.flags |=
 					IEEE80211_STA_NULLFUNC_ACKED;
-		mod_timer(&local->dynamic_ps_timer,
+		timer_mod(&local->dynamic_ps_timer,
 			  jiffies + msecs_to_jiffies(10));
 	}
 
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 20179db88c4a..6449993c5bed 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -267,7 +267,7 @@ ieee80211_tx_h_dynamic_ps(struct ieee80211_tx_data *tx)
 	if (!ifmgd->associated)
 		return TX_CONTINUE;
 
-	mod_timer(&local->dynamic_ps_timer, jiffies +
+	timer_mod(&local->dynamic_ps_timer, jiffies +
 		  msecs_to_jiffies(local->hw.conf.dynamic_ps_timeout));
 
 	return TX_CONTINUE;
@@ -523,7 +523,7 @@ ieee80211_tx_h_unicast_ps_buf(struct ieee80211_tx_data *tx)
 		spin_unlock(&sta->ps_lock);
 
 		if (!timer_pending(&local->sta_cleanup))
-			mod_timer(&local->sta_cleanup,
+			timer_mod(&local->sta_cleanup,
 				  round_jiffies(jiffies +
 						STA_INFO_CLEANUP_INTERVAL));
 
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index dec6e16b8c7d..dba2a85a67ab 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -2234,7 +2234,7 @@ int ieee80211_reconfig(struct ieee80211_local *local)
 			ieee80211_sta_restart(sdata);
 	}
 
-	mod_timer(&local->sta_cleanup, jiffies + 1);
+	timer_mod(&local->sta_cleanup, jiffies + 1);
 #else
 	WARN_ON(1);
 #endif
diff --git a/net/mctp/af_mctp.c b/net/mctp/af_mctp.c
index dd895617defd..763e28c1ae5f 100644
--- a/net/mctp/af_mctp.c
+++ b/net/mctp/af_mctp.c
@@ -609,7 +609,7 @@ static void mctp_sk_expire_keys(struct timer_list *timer)
 	spin_unlock_irqrestore(&net->mctp.keys_lock, flags);
 
 	if (next_expiry_valid)
-		mod_timer(timer, next_expiry);
+		timer_mod(timer, next_expiry);
 }
 
 static int mctp_sk_init(struct sock *sk)
diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index b3ff37a181d7..e87cc6dbb314 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -394,7 +394,7 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
 	 * connection a 1 second delay should be sufficient.
 	 */
 	nr->enabled = true;
-	mod_timer(&nr->timer, jiffies + 1 * HZ);
+	timer_mod(&nr->timer, jiffies + 1 * HZ);
 
 	/* Send NCSI packet */
 	skb_get(nr->cmd);
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 446e4e3b9553..a3ae351f5995 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -161,7 +161,7 @@ static void ncsi_channel_monitor(struct timer_list *t)
 	spin_lock_irqsave(&nc->lock, flags);
 	nc->monitor.state++;
 	spin_unlock_irqrestore(&nc->lock, flags);
-	mod_timer(&nc->monitor.timer, jiffies + HZ);
+	timer_mod(&nc->monitor.timer, jiffies + HZ);
 }
 
 void ncsi_start_channel_monitor(struct ncsi_channel *nc)
@@ -174,7 +174,7 @@ void ncsi_start_channel_monitor(struct ncsi_channel *nc)
 	nc->monitor.state = NCSI_CHANNEL_MONITOR_START;
 	spin_unlock_irqrestore(&nc->lock, flags);
 
-	mod_timer(&nc->monitor.timer, jiffies + HZ);
+	timer_mod(&nc->monitor.timer, jiffies + HZ);
 }
 
 void ncsi_stop_channel_monitor(struct ncsi_channel *nc)
diff --git a/net/netfilter/ipset/ip_set_bitmap_gen.h b/net/netfilter/ipset/ip_set_bitmap_gen.h
index b6be18037f30..b1e5bf4a771b 100644
--- a/net/netfilter/ipset/ip_set_bitmap_gen.h
+++ b/net/netfilter/ipset/ip_set_bitmap_gen.h
@@ -41,7 +41,7 @@ mtype_gc_init(struct ip_set *set, void (*gc)(struct timer_list *t))
 	struct mtype *map = set->data;
 
 	timer_setup(&map->gc, gc, 0);
-	mod_timer(&map->gc, jiffies + IPSET_GC_PERIOD(set->timeout) * HZ);
+	timer_mod(&map->gc, jiffies + IPSET_GC_PERIOD(set->timeout) * HZ);
 }
 
 static void
diff --git a/net/netfilter/ipset/ip_set_list_set.c b/net/netfilter/ipset/ip_set_list_set.c
index dc45021a784a..d0259d9ff723 100644
--- a/net/netfilter/ipset/ip_set_list_set.c
+++ b/net/netfilter/ipset/ip_set_list_set.c
@@ -588,7 +588,7 @@ list_set_gc_init(struct ip_set *set, void (*gc)(struct timer_list *t))
 	struct list_set *map = set->data;
 
 	timer_setup(&map->gc, gc, 0);
-	mod_timer(&map->gc, jiffies + IPSET_GC_PERIOD(set->timeout) * HZ);
+	timer_mod(&map->gc, jiffies + IPSET_GC_PERIOD(set->timeout) * HZ);
 }
 
 /* Create list:set type of sets */
diff --git a/net/netfilter/ipvs/ip_vs_conn.c b/net/netfilter/ipvs/ip_vs_conn.c
index 6e13e8dba00b..0804f2fdf8c0 100644
--- a/net/netfilter/ipvs/ip_vs_conn.c
+++ b/net/netfilter/ipvs/ip_vs_conn.c
@@ -469,7 +469,7 @@ static void __ip_vs_conn_put_timer(struct ip_vs_conn *cp)
 {
 	unsigned long t = (cp->flags & IP_VS_CONN_F_ONE_PACKET) ?
 		0 : cp->timeout;
-	mod_timer(&cp->timer, jiffies+t);
+	timer_mod(&cp->timer, jiffies+t);
 
 	__ip_vs_conn_put(cp);
 }
diff --git a/net/netfilter/ipvs/ip_vs_ctl.c b/net/netfilter/ipvs/ip_vs_ctl.c
index fdc8ef0a0db2..0ef1a0a9745e 100644
--- a/net/netfilter/ipvs/ip_vs_ctl.c
+++ b/net/netfilter/ipvs/ip_vs_ctl.c
@@ -1254,7 +1254,7 @@ static void __ip_vs_del_dest(struct netns_ipvs *ipvs, struct ip_vs_dest *dest,
 		      IP_VS_DBG_ADDR(dest->af, &dest->addr), ntohs(dest->port),
 		      refcount_read(&dest->refcnt));
 	if (list_empty(&ipvs->dest_trash) && !cleanup)
-		mod_timer(&ipvs->dest_trash_timer,
+		timer_mod(&ipvs->dest_trash_timer,
 			  jiffies + (IP_VS_DEST_TRASH_PERIOD >> 1));
 	/* dest lives in trash with reference */
 	list_add(&dest->t_list, &ipvs->dest_trash);
@@ -1355,7 +1355,7 @@ static void ip_vs_dest_trash_expire(struct timer_list *t)
 		ip_vs_dest_free(dest);
 	}
 	if (!list_empty(&ipvs->dest_trash))
-		mod_timer(&ipvs->dest_trash_timer,
+		timer_mod(&ipvs->dest_trash_timer,
 			  jiffies + (IP_VS_DEST_TRASH_PERIOD >> 1));
 	spin_unlock(&ipvs->dest_trash_lock);
 }
diff --git a/net/netfilter/ipvs/ip_vs_lblc.c b/net/netfilter/ipvs/ip_vs_lblc.c
index f15377c4c5df..97922fa88459 100644
--- a/net/netfilter/ipvs/ip_vs_lblc.c
+++ b/net/netfilter/ipvs/ip_vs_lblc.c
@@ -335,7 +335,7 @@ static void ip_vs_lblc_check_expire(struct timer_list *t)
 	tbl->rover = j;
 
   out:
-	mod_timer(&tbl->periodic_timer, jiffies + CHECK_EXPIRE_INTERVAL);
+	timer_mod(&tbl->periodic_timer, jiffies + CHECK_EXPIRE_INTERVAL);
 }
 
 
@@ -372,7 +372,7 @@ static int ip_vs_lblc_init_svc(struct ip_vs_service *svc)
 	 *    Hook periodic timer for garbage collection
 	 */
 	timer_setup(&tbl->periodic_timer, ip_vs_lblc_check_expire, 0);
-	mod_timer(&tbl->periodic_timer, jiffies + CHECK_EXPIRE_INTERVAL);
+	timer_mod(&tbl->periodic_timer, jiffies + CHECK_EXPIRE_INTERVAL);
 
 	return 0;
 }
diff --git a/net/netfilter/ipvs/ip_vs_lblcr.c b/net/netfilter/ipvs/ip_vs_lblcr.c
index 7efaf82090fd..b4a168098bc2 100644
--- a/net/netfilter/ipvs/ip_vs_lblcr.c
+++ b/net/netfilter/ipvs/ip_vs_lblcr.c
@@ -499,7 +499,7 @@ static void ip_vs_lblcr_check_expire(struct timer_list *t)
 	tbl->rover = j;
 
   out:
-	mod_timer(&tbl->periodic_timer, jiffies+CHECK_EXPIRE_INTERVAL);
+	timer_mod(&tbl->periodic_timer, jiffies+CHECK_EXPIRE_INTERVAL);
 }
 
 static int ip_vs_lblcr_init_svc(struct ip_vs_service *svc)
@@ -535,7 +535,7 @@ static int ip_vs_lblcr_init_svc(struct ip_vs_service *svc)
 	 *    Hook periodic timer for garbage collection
 	 */
 	timer_setup(&tbl->periodic_timer, ip_vs_lblcr_check_expire, 0);
-	mod_timer(&tbl->periodic_timer, jiffies + CHECK_EXPIRE_INTERVAL);
+	timer_mod(&tbl->periodic_timer, jiffies + CHECK_EXPIRE_INTERVAL);
 
 	return 0;
 }
diff --git a/net/netfilter/xt_IDLETIMER.c b/net/netfilter/xt_IDLETIMER.c
index 7f20e517da62..2b0cbaac00e2 100644
--- a/net/netfilter/xt_IDLETIMER.c
+++ b/net/netfilter/xt_IDLETIMER.c
@@ -167,7 +167,7 @@ static int idletimer_tg_create(struct idletimer_tg_info *info)
 
 	INIT_WORK(&info->timer->work, idletimer_tg_work);
 
-	mod_timer(&info->timer->timer,
+	timer_mod(&info->timer->timer,
 		  msecs_to_jiffies(info->timeout * 1000) + jiffies);
 
 	return 0;
@@ -228,7 +228,7 @@ static int idletimer_tg_create_v1(struct idletimer_tg_info_v1 *info)
 		alarm_start_relative(&info->timer->alarm, tout);
 	} else {
 		timer_setup(&info->timer->timer, idletimer_tg_expired, 0);
-		mod_timer(&info->timer->timer,
+		timer_mod(&info->timer->timer,
 				msecs_to_jiffies(info->timeout * 1000) + jiffies);
 	}
 
@@ -253,7 +253,7 @@ static unsigned int idletimer_tg_target(struct sk_buff *skb,
 	pr_debug("resetting timer %s, timeout period %u\n",
 		 info->label, info->timeout);
 
-	mod_timer(&info->timer->timer,
+	timer_mod(&info->timer->timer,
 		  msecs_to_jiffies(info->timeout * 1000) + jiffies);
 
 	return XT_CONTINUE;
@@ -274,7 +274,7 @@ static unsigned int idletimer_tg_target_v1(struct sk_buff *skb,
 		ktime_t tout = ktime_set(info->timeout, 0);
 		alarm_start_relative(&info->timer->alarm, tout);
 	} else {
-		mod_timer(&info->timer->timer,
+		timer_mod(&info->timer->timer,
 				msecs_to_jiffies(info->timeout * 1000) + jiffies);
 	}
 
@@ -319,7 +319,7 @@ static int idletimer_tg_checkentry(const struct xt_tgchk_param *par)
 	info->timer = __idletimer_tg_find_by_label(info->label);
 	if (info->timer) {
 		info->timer->refcnt++;
-		mod_timer(&info->timer->timer,
+		timer_mod(&info->timer->timer,
 			  msecs_to_jiffies(info->timeout * 1000) + jiffies);
 
 		pr_debug("increased refcnt of timer %s to %u\n",
@@ -381,7 +381,7 @@ static int idletimer_tg_checkentry_v1(const struct xt_tgchk_param *par)
 				alarm_start_relative(&info->timer->alarm, tout);
 			}
 		} else {
-				mod_timer(&info->timer->timer,
+				timer_mod(&info->timer->timer,
 					msecs_to_jiffies(info->timeout * 1000) + jiffies);
 		}
 		pr_debug("increased refcnt of timer %s to %u\n",
diff --git a/net/netfilter/xt_LED.c b/net/netfilter/xt_LED.c
index 3dd733b293fe..69e628d9b186 100644
--- a/net/netfilter/xt_LED.c
+++ b/net/netfilter/xt_LED.c
@@ -57,7 +57,7 @@ led_tg(struct sk_buff *skb, const struct xt_action_param *par)
 
 	/* If there's a positive delay, start/update the timer */
 	if (ledinfo->delay > 0) {
-		mod_timer(&ledinternal->timer,
+		timer_mod(&ledinternal->timer,
 			  jiffies + msecs_to_jiffies(ledinfo->delay));
 
 	/* Otherwise if there was no delay given, blink as fast as possible */
diff --git a/net/netrom/nr_loopback.c b/net/netrom/nr_loopback.c
index 7a9d765b30c0..b3d4d892c265 100644
--- a/net/netrom/nr_loopback.c
+++ b/net/netrom/nr_loopback.c
@@ -38,7 +38,7 @@ int nr_loopback_queue(struct sk_buff *skb)
 		skb_queue_tail(&loopback_queue, skbn);
 
 		if (!nr_loopback_running())
-			mod_timer(&loopback_timer, jiffies + 10);
+			timer_mod(&loopback_timer, jiffies + 10);
 	}
 
 	kfree_skb(skb);
@@ -62,7 +62,7 @@ static void nr_loopback_timer(struct timer_list *unused)
 		dev_put(dev);
 
 		if (!skb_queue_empty(&loopback_queue) && !nr_loopback_running())
-			mod_timer(&loopback_timer, jiffies + 10);
+			timer_mod(&loopback_timer, jiffies + 10);
 	}
 }
 
diff --git a/net/nfc/core.c b/net/nfc/core.c
index ae1c842f9c64..8009b40569a5 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -423,7 +423,7 @@ int nfc_activate_target(struct nfc_dev *dev, u32 target_idx, u32 protocol)
 		dev->rf_mode = NFC_RF_INITIATOR;
 
 		if (dev->ops->check_presence && !dev->shutting_down)
-			mod_timer(&dev->check_pres_timer, jiffies +
+			timer_mod(&dev->check_pres_timer, jiffies +
 				  msecs_to_jiffies(NFC_CHECK_PRES_FREQ_MS));
 	}
 
@@ -515,7 +515,7 @@ int nfc_data_exchange(struct nfc_dev *dev, u32 target_idx, struct sk_buff *skb,
 					     cb_context);
 
 		if (!rc && dev->ops->check_presence && !dev->shutting_down)
-			mod_timer(&dev->check_pres_timer, jiffies +
+			timer_mod(&dev->check_pres_timer, jiffies +
 				  msecs_to_jiffies(NFC_CHECK_PRES_FREQ_MS));
 	} else if (dev->rf_mode == NFC_RF_TARGET && dev->ops->tm_send != NULL) {
 		rc = dev->ops->tm_send(dev, skb);
@@ -1000,7 +1000,7 @@ static void nfc_check_pres_work(struct work_struct *work)
 		}
 
 		if (!dev->shutting_down)
-			mod_timer(&dev->check_pres_timer, jiffies +
+			timer_mod(&dev->check_pres_timer, jiffies +
 				  msecs_to_jiffies(NFC_CHECK_PRES_FREQ_MS));
 	}
 
diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index 8618d57c23da..0794c4f9ed3b 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -116,7 +116,7 @@ static void nfc_hci_msg_tx_work(struct work_struct *work)
 	}
 
 	hdev->cmd_pending_msg = msg;
-	mod_timer(&hdev->cmd_timer, jiffies +
+	timer_mod(&hdev->cmd_timer, jiffies +
 		  msecs_to_jiffies(hdev->cmd_pending_msg->completion_delay));
 
 exit:
diff --git a/net/nfc/hci/llc_shdlc.c b/net/nfc/hci/llc_shdlc.c
index 4fc37894860c..8d3fbacb1974 100644
--- a/net/nfc/hci/llc_shdlc.c
+++ b/net/nfc/hci/llc_shdlc.c
@@ -206,7 +206,7 @@ static void llc_shdlc_reset_t2(struct llc_shdlc *shdlc, int y_nr)
 	} else {
 		skb = skb_peek(&shdlc->ack_pending_q);
 
-		mod_timer(&shdlc->t2_timer, *(unsigned long *)skb->cb +
+		timer_mod(&shdlc->t2_timer, *(unsigned long *)skb->cb +
 			  msecs_to_jiffies(SHDLC_T2_VALUE_MS));
 		shdlc->t2_active = true;
 
@@ -236,7 +236,7 @@ static void llc_shdlc_rcv_i_frame(struct llc_shdlc *shdlc,
 
 	if (!shdlc->t1_active) {
 		shdlc->t1_active = true;
-		mod_timer(&shdlc->t1_timer, jiffies +
+		timer_mod(&shdlc->t1_timer, jiffies +
 			  msecs_to_jiffies(SHDLC_T1_VALUE_MS(shdlc->w)));
 		pr_debug("(re)Start T1(send ack)\n");
 	}
@@ -555,7 +555,7 @@ static void llc_shdlc_handle_send_queue(struct llc_shdlc *shdlc)
 
 		if (shdlc->t2_active == false) {
 			shdlc->t2_active = true;
-			mod_timer(&shdlc->t2_timer, time_sent +
+			timer_mod(&shdlc->t2_timer, time_sent +
 				  msecs_to_jiffies(SHDLC_T2_VALUE_MS));
 			pr_debug("Started T2 (retransmit)\n");
 		}
@@ -613,7 +613,7 @@ static void llc_shdlc_sm_work(struct work_struct *work)
 		if (r < 0) {
 			llc_shdlc_connect_complete(shdlc, r);
 		} else {
-			mod_timer(&shdlc->connect_timer, jiffies +
+			timer_mod(&shdlc->connect_timer, jiffies +
 				  msecs_to_jiffies(SHDLC_CONNECT_VALUE_MS));
 
 			shdlc->state = SHDLC_NEGOTIATING;
diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index e2680a3bef79..009889c19054 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -590,7 +590,7 @@ int nfc_llcp_send_snl_sdreq(struct nfc_llcp_local *local,
 	mutex_lock(&local->sdreq_lock);
 
 	if (hlist_empty(&local->pending_sdreqs))
-		mod_timer(&local->sdreq_timer,
+		timer_mod(&local->sdreq_timer,
 			  jiffies + msecs_to_jiffies(3 * local->remote_lto));
 
 	hlist_for_each_entry_safe(sdreq, n, tlv_list, node) {
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 73282f5f6d83..81d224d18765 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -275,7 +275,7 @@ static void nfc_llcp_sdreq_timeout_work(struct work_struct *work)
 	}
 
 	if (!hlist_empty(&local->pending_sdreqs))
-		mod_timer(&local->sdreq_timer,
+		timer_mod(&local->sdreq_timer,
 			  jiffies + msecs_to_jiffies(3 * local->remote_lto));
 
 	mutex_unlock(&local->sdreq_lock);
@@ -807,7 +807,7 @@ static void nfc_llcp_tx_work(struct work_struct *work)
 	}
 
 out:
-	mod_timer(&local->link_timer,
+	timer_mod(&local->link_timer,
 		  jiffies + msecs_to_jiffies(2 * local->remote_lto));
 }
 
@@ -1606,7 +1606,7 @@ void nfc_llcp_mac_is_up(struct nfc_dev *dev, u32 target_idx,
 
 		schedule_work(&local->tx_work);
 	} else {
-		mod_timer(&local->link_timer,
+		timer_mod(&local->link_timer,
 			  jiffies + msecs_to_jiffies(local->remote_lto));
 	}
 
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index fc921cd2cdff..5d5291a488f6 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -1520,7 +1520,7 @@ static void nci_tx_work(struct work_struct *work)
 
 		nci_send_frame(ndev, skb);
 
-		mod_timer(&ndev->data_timer,
+		timer_mod(&ndev->data_timer,
 			  jiffies + msecs_to_jiffies(NCI_DATA_TIMEOUT));
 		kcov_remote_stop();
 	}
@@ -1604,7 +1604,7 @@ static void nci_cmd_work(struct work_struct *work)
 
 		nci_send_frame(ndev, skb);
 
-		mod_timer(&ndev->cmd_timer,
+		timer_mod(&ndev->cmd_timer,
 			  jiffies + msecs_to_jiffies(NCI_CMD_TIMEOUT));
 		kcov_remote_stop();
 	}
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index bafc1ee7ccfa..a590af9fda20 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -691,7 +691,7 @@ static void init_prb_bdqc(struct packet_sock *po,
  */
 static void _prb_refresh_rx_retire_blk_timer(struct tpacket_kbdq_core *pkc)
 {
-	mod_timer(&pkc->retire_blk_timer,
+	timer_mod(&pkc->retire_blk_timer,
 			jiffies + pkc->tov_in_jiffies);
 	pkc->last_kactive_blk_num = pkc->kactive_blk_num;
 }
diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index b538e39b3df5..393a485ba137 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -53,7 +53,7 @@ int rose_loopback_queue(struct sk_buff *skb, struct rose_neigh *neigh)
 
 static void rose_set_loopback_timer(void)
 {
-	mod_timer(&loopback_timer, jiffies + 10);
+	timer_mod(&loopback_timer, jiffies + 10);
 }
 
 static void rose_loopback_timer(struct timer_list *unused)
@@ -117,7 +117,7 @@ static void rose_loopback_timer(struct timer_list *unused)
 		}
 	}
 	if (!skb_queue_empty(&loopback_queue))
-		mod_timer(&loopback_timer, jiffies + 1);
+		timer_mod(&loopback_timer, jiffies + 1);
 }
 
 void __exit rose_loopback_clear(void)
diff --git a/net/sched/cls_flow.c b/net/sched/cls_flow.c
index 5693b41b093f..437ca8165db0 100644
--- a/net/sched/cls_flow.c
+++ b/net/sched/cls_flow.c
@@ -349,7 +349,7 @@ static void flow_perturbation(struct timer_list *t)
 
 	get_random_bytes(&f->hashrnd, 4);
 	if (f->perturb_period)
-		mod_timer(&f->perturb_timer, jiffies + f->perturb_period);
+		timer_mod(&f->perturb_timer, jiffies + f->perturb_period);
 }
 
 static const struct nla_policy flow_policy[TCA_FLOW_MAX + 1] = {
@@ -543,7 +543,7 @@ static int flow_change(struct net *net, struct sk_buff *in_skb,
 
 	fnew->perturb_period = perturb_period;
 	if (perturb_period)
-		mod_timer(&fnew->perturb_timer, jiffies + perturb_period);
+		timer_mod(&fnew->perturb_timer, jiffies + perturb_period);
 
 	if (!*arg)
 		list_add_tail_rcu(&fnew->list, &head->filters);
diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index 98f8765ec5d4..aa7b95470aeb 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -410,7 +410,7 @@ static void fq_pie_timer(struct timer_list *t)
 		next = tupdate;
 	}
 	if (tupdate)
-		mod_timer(&q->adapt_timer, jiffies + next);
+		timer_mod(&q->adapt_timer, jiffies + next);
 	spin_unlock(root_lock);
 	rcu_read_unlock();
 }
@@ -459,7 +459,7 @@ static int fq_pie_init(struct Qdisc *sch, struct nlattr *opt,
 		pie_vars_init(&flow->vars);
 	}
 
-	mod_timer(&q->adapt_timer, jiffies + HZ / 2);
+	timer_mod(&q->adapt_timer, jiffies + HZ / 2);
 
 	return 0;
 
diff --git a/net/sched/sch_generic.c b/net/sched/sch_generic.c
index a78945a7073a..f45c6401e70b 100644
--- a/net/sched/sch_generic.c
+++ b/net/sched/sch_generic.c
@@ -539,7 +539,7 @@ static void dev_watchdog(struct timer_list *t)
 				dev->netdev_ops->ndo_tx_timeout(dev, i);
 				netif_unfreeze_queues(dev);
 			}
-			if (!mod_timer(&dev->watchdog_timer,
+			if (!timer_mod(&dev->watchdog_timer,
 				       round_jiffies(oldest_start +
 						     dev->watchdog_timeo)))
 				release = false;
@@ -557,7 +557,7 @@ void netdev_watchdog_up(struct net_device *dev)
 		return;
 	if (dev->watchdog_timeo <= 0)
 		dev->watchdog_timeo = 5*HZ;
-	if (!mod_timer(&dev->watchdog_timer,
+	if (!timer_mod(&dev->watchdog_timer,
 		       round_jiffies(jiffies + dev->watchdog_timeo)))
 		netdev_hold(dev, &dev->watchdog_dev_tracker,
 			    GFP_ATOMIC);
diff --git a/net/sched/sch_pie.c b/net/sched/sch_pie.c
index d5caa6d5cd5b..27c2257c0dec 100644
--- a/net/sched/sch_pie.c
+++ b/net/sched/sch_pie.c
@@ -435,7 +435,7 @@ static void pie_timer(struct timer_list *t)
 
 	/* reset the timer to fire after 'tupdate'. tupdate is in jiffies. */
 	if (q->params.tupdate)
-		mod_timer(&q->adapt_timer, jiffies + q->params.tupdate);
+		timer_mod(&q->adapt_timer, jiffies + q->params.tupdate);
 	spin_unlock(root_lock);
 	rcu_read_unlock();
 }
@@ -459,7 +459,7 @@ static int pie_init(struct Qdisc *sch, struct nlattr *opt,
 			return err;
 	}
 
-	mod_timer(&q->adapt_timer, jiffies + HZ / 2);
+	timer_mod(&q->adapt_timer, jiffies + HZ / 2);
 	return 0;
 }
 
diff --git a/net/sched/sch_red.c b/net/sched/sch_red.c
index 339d70b4a4c5..a26487cd4bfc 100644
--- a/net/sched/sch_red.c
+++ b/net/sched/sch_red.c
@@ -299,7 +299,7 @@ static int __red_change(struct Qdisc *sch, struct nlattr **tb,
 
 	timer_delete(&q->adapt_timer);
 	if (ctl->flags & TC_RED_ADAPTATIVE)
-		mod_timer(&q->adapt_timer, jiffies + HZ/2);
+		timer_mod(&q->adapt_timer, jiffies + HZ/2);
 
 	if (!q->qdisc->q.qlen)
 		red_start_of_idle_period(&q->vars);
@@ -329,7 +329,7 @@ static inline void red_adaptative_timer(struct timer_list *t)
 	root_lock = qdisc_lock(qdisc_root_sleeping(sch));
 	spin_lock(root_lock);
 	red_adaptative_algo(&q->parms, &q->vars);
-	mod_timer(&q->adapt_timer, jiffies + HZ/2);
+	timer_mod(&q->adapt_timer, jiffies + HZ/2);
 	spin_unlock(root_lock);
 	rcu_read_unlock();
 }
diff --git a/net/sched/sch_sfq.c b/net/sched/sch_sfq.c
index a8081492d671..ff15b69b633f 100644
--- a/net/sched/sch_sfq.c
+++ b/net/sched/sch_sfq.c
@@ -617,7 +617,7 @@ static void sfq_perturbation(struct timer_list *t)
 	 */
 	period = READ_ONCE(q->perturb_period);
 	if (period)
-		mod_timer(&q->perturb_timer, jiffies + period);
+		timer_mod(&q->perturb_timer, jiffies + period);
 	rcu_read_unlock();
 }
 
@@ -732,7 +732,7 @@ static int sfq_change(struct Qdisc *sch, struct nlattr *opt,
 
 	timer_delete(&q->perturb_timer);
 	if (q->perturb_period) {
-		mod_timer(&q->perturb_timer, jiffies + q->perturb_period);
+		timer_mod(&q->perturb_timer, jiffies + q->perturb_period);
 		get_random_bytes(&q->perturbation, sizeof(q->perturbation));
 	}
 	sch_tree_unlock(sch);
diff --git a/net/sctp/associola.c b/net/sctp/associola.c
index 760152e751c7..36228d4d6086 100644
--- a/net/sctp/associola.c
+++ b/net/sctp/associola.c
@@ -564,7 +564,7 @@ void sctp_assoc_rm_peer(struct sctp_association *asoc,
 		 * retransmitted.
 		 */
 		if (!timer_pending(&active->T3_rtx_timer))
-			if (!mod_timer(&active->T3_rtx_timer,
+			if (!timer_mod(&active->T3_rtx_timer,
 					jiffies + active->rto))
 				sctp_transport_hold(active);
 	}
diff --git a/net/sctp/input.c b/net/sctp/input.c
index 0c0d2757f6f8..7a8a42dbac2e 100644
--- a/net/sctp/input.c
+++ b/net/sctp/input.c
@@ -436,7 +436,7 @@ void sctp_icmp_proto_unreachable(struct sock *sk,
 		if (timer_pending(&t->proto_unreach_timer))
 			return;
 		else {
-			if (!mod_timer(&t->proto_unreach_timer,
+			if (!timer_mod(&t->proto_unreach_timer,
 						jiffies + (HZ/20)))
 				sctp_transport_hold(t);
 		}
diff --git a/net/sctp/output.c b/net/sctp/output.c
index 23e96305cad7..1e40dc92bb73 100644
--- a/net/sctp/output.c
+++ b/net/sctp/output.c
@@ -633,7 +633,7 @@ int sctp_packet_transmit(struct sctp_packet *packet, gfp_t gfp)
 		unsigned long timeout =
 			asoc->timeouts[SCTP_EVENT_TIMEOUT_AUTOCLOSE];
 
-		if (!mod_timer(timer, jiffies + timeout))
+		if (!timer_mod(timer, jiffies + timeout))
 			sctp_association_hold(asoc);
 	}
 
diff --git a/net/sctp/outqueue.c b/net/sctp/outqueue.c
index f6b8c13dafa4..6d1e30f95a50 100644
--- a/net/sctp/outqueue.c
+++ b/net/sctp/outqueue.c
@@ -1690,7 +1690,7 @@ static void sctp_check_transmitted(struct sctp_outq *q,
 			if (timer_delete(&transport->T3_rtx_timer))
 				sctp_transport_put(transport);
 		} else if (restart_timer) {
-			if (!mod_timer(&transport->T3_rtx_timer,
+			if (!timer_mod(&transport->T3_rtx_timer,
 				       jiffies + transport->rto))
 				sctp_transport_hold(transport);
 		}
diff --git a/net/sctp/protocol.c b/net/sctp/protocol.c
index f402f90eb6b6..f4fdfbbfa458 100644
--- a/net/sctp/protocol.c
+++ b/net/sctp/protocol.c
@@ -663,7 +663,7 @@ static void sctp_addr_wq_timeout_handler(struct timer_list *t)
 
 				timeo_val = jiffies;
 				timeo_val += msecs_to_jiffies(SCTP_ADDRESS_TICK_DELAY);
-				mod_timer(&net->sctp.addr_wq_timer, timeo_val);
+				timer_mod(&net->sctp.addr_wq_timer, timeo_val);
 				break;
 			}
 		}
@@ -783,7 +783,7 @@ void sctp_addr_wq_mgmt(struct net *net, struct sctp_sockaddr_entry *addr, int cm
 	if (!timer_pending(&net->sctp.addr_wq_timer)) {
 		timeo_val = jiffies;
 		timeo_val += msecs_to_jiffies(SCTP_ADDRESS_TICK_DELAY);
-		mod_timer(&net->sctp.addr_wq_timer, timeo_val);
+		timer_mod(&net->sctp.addr_wq_timer, timeo_val);
 	}
 	spin_unlock_bh(&net->sctp.addr_wq_lock);
 }
diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
index d16c244fc451..77ce098df7bf 100644
--- a/net/sctp/sm_sideeffect.c
+++ b/net/sctp/sm_sideeffect.c
@@ -244,7 +244,7 @@ void sctp_generate_t3_rtx_event(struct timer_list *t)
 		pr_debug("%s: sock is busy\n", __func__);
 
 		/* Try again later.  */
-		if (!mod_timer(&transport->T3_rtx_timer, jiffies + (HZ/20)))
+		if (!timer_mod(&transport->T3_rtx_timer, jiffies + (HZ/20)))
 			sctp_transport_hold(transport);
 		goto out_unlock;
 	}
@@ -280,7 +280,7 @@ static void sctp_generate_timeout_event(struct sctp_association *asoc,
 			 timeout_type);
 
 		/* Try again later.  */
-		if (!mod_timer(&asoc->timers[timeout_type], jiffies + (HZ/20)))
+		if (!timer_mod(&asoc->timers[timeout_type], jiffies + (HZ/20)))
 			sctp_association_hold(asoc);
 		goto out_unlock;
 	}
@@ -373,7 +373,7 @@ void sctp_generate_heartbeat_event(struct timer_list *t)
 		pr_debug("%s: sock is busy\n", __func__);
 
 		/* Try again later.  */
-		if (!mod_timer(&transport->hb_timer, jiffies + (HZ/20)))
+		if (!timer_mod(&transport->hb_timer, jiffies + (HZ/20)))
 			sctp_transport_hold(transport);
 		goto out_unlock;
 	}
@@ -383,7 +383,7 @@ void sctp_generate_heartbeat_event(struct timer_list *t)
 	timeout = sctp_transport_timeout(transport);
 	if (elapsed < timeout) {
 		elapsed = timeout - elapsed;
-		if (!mod_timer(&transport->hb_timer, jiffies + elapsed))
+		if (!timer_mod(&transport->hb_timer, jiffies + elapsed))
 			sctp_transport_hold(transport);
 		goto out_unlock;
 	}
@@ -417,7 +417,7 @@ void sctp_generate_proto_unreach_event(struct timer_list *t)
 		pr_debug("%s: sock is busy\n", __func__);
 
 		/* Try again later.  */
-		if (!mod_timer(&transport->proto_unreach_timer,
+		if (!timer_mod(&transport->proto_unreach_timer,
 				jiffies + (HZ/20)))
 			sctp_transport_hold(transport);
 		goto out_unlock;
@@ -453,7 +453,7 @@ void sctp_generate_reconf_event(struct timer_list *t)
 		pr_debug("%s: sock is busy\n", __func__);
 
 		/* Try again later.  */
-		if (!mod_timer(&transport->reconf_timer, jiffies + (HZ / 20)))
+		if (!timer_mod(&transport->reconf_timer, jiffies + (HZ / 20)))
 			sctp_transport_hold(transport);
 		goto out_unlock;
 	}
@@ -489,7 +489,7 @@ void sctp_generate_probe_event(struct timer_list *t)
 		pr_debug("%s: sock is busy\n", __func__);
 
 		/* Try again later.  */
-		if (!mod_timer(&transport->probe_timer, jiffies + (HZ / 20)))
+		if (!timer_mod(&transport->probe_timer, jiffies + (HZ / 20)))
 			sctp_transport_hold(transport);
 		goto out_unlock;
 	}
@@ -1551,7 +1551,7 @@ static int sctp_cmd_interpreter(enum sctp_event_type event_type,
 		case SCTP_CMD_TIMER_RESTART:
 			timer = &asoc->timers[cmd->obj.to];
 			timeout = asoc->timeouts[cmd->obj.to];
-			if (!mod_timer(timer, jiffies + timeout))
+			if (!timer_mod(timer, jiffies + timeout))
 				sctp_association_hold(asoc);
 			break;
 
diff --git a/net/sctp/transport.c b/net/sctp/transport.c
index 6946c1462793..1fa755fab02c 100644
--- a/net/sctp/transport.c
+++ b/net/sctp/transport.c
@@ -187,7 +187,7 @@ void sctp_transport_reset_t3_rtx(struct sctp_transport *transport)
 	 */
 
 	if (!timer_pending(&transport->T3_rtx_timer))
-		if (!mod_timer(&transport->T3_rtx_timer,
+		if (!timer_mod(&transport->T3_rtx_timer,
 			       jiffies + transport->rto))
 			sctp_transport_hold(transport);
 }
@@ -198,7 +198,7 @@ void sctp_transport_reset_hb_timer(struct sctp_transport *transport)
 
 	/* When a data chunk is sent, reset the heartbeat interval.  */
 	expires = jiffies + sctp_transport_timeout(transport);
-	if (!mod_timer(&transport->hb_timer,
+	if (!timer_mod(&transport->hb_timer,
 		       expires + get_random_u32_below(transport->rto)))
 		sctp_transport_hold(transport);
 }
@@ -206,21 +206,21 @@ void sctp_transport_reset_hb_timer(struct sctp_transport *transport)
 void sctp_transport_reset_reconf_timer(struct sctp_transport *transport)
 {
 	if (!timer_pending(&transport->reconf_timer))
-		if (!mod_timer(&transport->reconf_timer,
+		if (!timer_mod(&transport->reconf_timer,
 			       jiffies + transport->rto))
 			sctp_transport_hold(transport);
 }
 
 void sctp_transport_reset_probe_timer(struct sctp_transport *transport)
 {
-	if (!mod_timer(&transport->probe_timer,
+	if (!timer_mod(&transport->probe_timer,
 		       jiffies + transport->probe_interval))
 		sctp_transport_hold(transport);
 }
 
 void sctp_transport_reset_raise_timer(struct sctp_transport *transport)
 {
-	if (!mod_timer(&transport->probe_timer,
+	if (!timer_mod(&transport->probe_timer,
 		       jiffies + transport->probe_interval * 30))
 		sctp_transport_hold(transport);
 }
@@ -836,7 +836,7 @@ void sctp_transport_immediate_rtx(struct sctp_transport *t)
 
 	sctp_retransmit(&t->asoc->outqueue, t, SCTP_RTXR_T3_RTX);
 	if (!timer_pending(&t->T3_rtx_timer)) {
-		if (!mod_timer(&t->T3_rtx_timer, jiffies + t->rto))
+		if (!timer_mod(&t->T3_rtx_timer, jiffies + t->rto))
 			sctp_transport_hold(t);
 	}
 }
diff --git a/net/sunrpc/svc_xprt.c b/net/sunrpc/svc_xprt.c
index 144fdc4cd322..6829ff25058f 100644
--- a/net/sunrpc/svc_xprt.c
+++ b/net/sunrpc/svc_xprt.c
@@ -760,7 +760,7 @@ static void svc_add_new_temp_xprt(struct svc_serv *serv, struct svc_xprt *newxpt
 	if (serv->sv_temptimer.function == NULL) {
 		/* setup timer to age temp transports */
 		serv->sv_temptimer.function = svc_age_temp_xprts;
-		mod_timer(&serv->sv_temptimer,
+		timer_mod(&serv->sv_temptimer,
 			  jiffies + svc_conn_age_period * HZ);
 	}
 	spin_unlock_bh(&serv->sv_lock);
@@ -938,7 +938,7 @@ static void svc_age_temp_xprts(struct timer_list *t)
 	if (!spin_trylock_bh(&serv->sv_lock)) {
 		/* busy, try again 1 sec later */
 		dprintk("svc_age_temp_xprts: busy\n");
-		mod_timer(&serv->sv_temptimer, jiffies + HZ);
+		timer_mod(&serv->sv_temptimer, jiffies + HZ);
 		return;
 	}
 
@@ -961,7 +961,7 @@ static void svc_age_temp_xprts(struct timer_list *t)
 	}
 	spin_unlock_bh(&serv->sv_lock);
 
-	mod_timer(&serv->sv_temptimer, jiffies + svc_conn_age_period * HZ);
+	timer_mod(&serv->sv_temptimer, jiffies + svc_conn_age_period * HZ);
 }
 
 /* Close temporary transports whose xpt_local matches server_addr immediately
diff --git a/net/sunrpc/xprt.c b/net/sunrpc/xprt.c
index 002380569762..35f4b7eb3955 100644
--- a/net/sunrpc/xprt.c
+++ b/net/sunrpc/xprt.c
@@ -848,7 +848,7 @@ xprt_schedule_autodisconnect(struct rpc_xprt *xprt)
 {
 	xprt->last_used = jiffies;
 	if (RB_EMPTY_ROOT(&xprt->recv_queue) && xprt_has_timer(xprt))
-		mod_timer(&xprt->timer, xprt->last_used + xprt->idle_timeout);
+		timer_mod(&xprt->timer, xprt->last_used + xprt->idle_timeout);
 }
 
 static void
@@ -2134,7 +2134,7 @@ static void xprt_destroy(struct rpc_xprt *xprt)
 
 	/*
 	 * xprt_schedule_autodisconnect() can run after XPRT_LOCKED
-	 * is cleared.  We use ->transport_lock to ensure the mod_timer()
+	 * is cleared.  We use ->transport_lock to ensure the timer_mod()
 	 * can only run *before* del_time_sync(), never after.
 	 */
 	spin_lock(&xprt->transport_lock);
diff --git a/net/tipc/discover.c b/net/tipc/discover.c
index 775fd4f3f072..c8182ef47612 100644
--- a/net/tipc/discover.c
+++ b/net/tipc/discover.c
@@ -279,7 +279,7 @@ void tipc_disc_remove_dest(struct tipc_discoverer *d)
 	intv = d->timer_intv;
 	if (!num && (intv == TIPC_DISC_INACTIVE || intv > TIPC_DISC_FAST))  {
 		d->timer_intv = TIPC_DISC_INIT;
-		mod_timer(&d->timer, jiffies + d->timer_intv);
+		timer_mod(&d->timer, jiffies + d->timer_intv);
 	}
 	spin_unlock_bh(&d->lock);
 }
@@ -309,7 +309,7 @@ static void tipc_disc_timeout(struct timer_list *t)
 
 	/* Did we just leave trial period ? */
 	if (!time_before(jiffies, tn->addr_trial_end) && !tipc_own_addr(net)) {
-		mod_timer(&d->timer, jiffies + TIPC_DISC_INIT);
+		timer_mod(&d->timer, jiffies + TIPC_DISC_INIT);
 		spin_unlock_bh(&d->lock);
 		schedule_work(&tn->work);
 		return;
@@ -328,7 +328,7 @@ static void tipc_disc_timeout(struct timer_list *t)
 		msg_set_prevnode(buf_msg(d->skb), tn->trial_addr);
 	}
 
-	mod_timer(&d->timer, jiffies + d->timer_intv);
+	timer_mod(&d->timer, jiffies + d->timer_intv);
 	memcpy(&maddr, &d->dest, sizeof(maddr));
 	skb = skb_clone(d->skb, GFP_ATOMIC);
 	bearer_id = d->bearer_id;
@@ -376,7 +376,7 @@ int tipc_disc_create(struct net *net, struct tipc_bearer *b,
 	d->timer_intv = TIPC_DISC_INIT;
 	spin_lock_init(&d->lock);
 	timer_setup(&d->timer, tipc_disc_timeout, 0);
-	mod_timer(&d->timer, jiffies + d->timer_intv);
+	timer_mod(&d->timer, jiffies + d->timer_intv);
 	b->disc = d;
 	*skb = skb_clone(d->skb, GFP_ATOMIC);
 	return 0;
@@ -412,7 +412,7 @@ void tipc_disc_reset(struct net *net, struct tipc_bearer *b)
 	d->num_nodes = 0;
 	d->timer_intv = TIPC_DISC_INIT;
 	memcpy(&maddr, &d->dest, sizeof(maddr));
-	mod_timer(&d->timer, jiffies + d->timer_intv);
+	timer_mod(&d->timer, jiffies + d->timer_intv);
 	skb = skb_clone(d->skb, GFP_ATOMIC);
 	spin_unlock_bh(&d->lock);
 	if (skb)
diff --git a/net/tipc/monitor.c b/net/tipc/monitor.c
index 2f266a064663..ef85aba043ee 100644
--- a/net/tipc/monitor.c
+++ b/net/tipc/monitor.c
@@ -641,7 +641,7 @@ static void mon_timeout(struct timer_list *t)
 		mon_assign_roles(mon, self);
 	}
 	write_unlock_bh(&mon->lock);
-	mod_timer(&mon->timer, jiffies + mon->timer_intv);
+	timer_mod(&mon->timer, jiffies + mon->timer_intv);
 }
 
 int tipc_mon_create(struct net *net, int bearer_id)
@@ -675,7 +675,7 @@ int tipc_mon_create(struct net *net, int bearer_id)
 	INIT_LIST_HEAD(&self->list);
 	timer_setup(&mon->timer, mon_timeout, 0);
 	mon->timer_intv = msecs_to_jiffies(MON_TIMEOUT + (tn->random & 0xffff));
-	mod_timer(&mon->timer, jiffies + mon->timer_intv);
+	timer_mod(&mon->timer, jiffies + mon->timer_intv);
 	return 0;
 }
 
diff --git a/net/tipc/node.c b/net/tipc/node.c
index 32afc0bdfd0c..49cfe22a2e6b 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -590,7 +590,7 @@ struct tipc_node *tipc_node_create(struct net *net, u32 addr, u8 *peer_id,
 	/* Start a slow timer anyway, crypto needs it */
 	n->keepalive_intv = 10000;
 	intv = jiffies + msecs_to_jiffies(n->keepalive_intv);
-	if (!mod_timer(&n->timer, intv))
+	if (!timer_mod(&n->timer, intv))
 		tipc_node_get(n);
 	hlist_add_head_rcu(&n->hash, &tn->node_htable[tipc_hashfn(addr)]);
 	list_for_each_entry_rcu(temp_node, &tn->node_list, list) {
@@ -842,7 +842,7 @@ static void tipc_node_timeout(struct timer_list *t)
 		if (rc & TIPC_LINK_DOWN_EVT)
 			tipc_node_link_down(n, bearer_id, false);
 	}
-	mod_timer(&n->timer, jiffies + msecs_to_jiffies(n->keepalive_intv));
+	timer_mod(&n->timer, jiffies + msecs_to_jiffies(n->keepalive_intv));
 }
 
 /**
@@ -1298,7 +1298,7 @@ void tipc_node_check_dest(struct net *net, u32 addr,
 		tipc_node_calculate_timer(n, l);
 		if (n->link_cnt == 1) {
 			intv = jiffies + msecs_to_jiffies(n->keepalive_intv);
-			if (!mod_timer(&n->timer, intv))
+			if (!timer_mod(&n->timer, intv))
 				tipc_node_get(n);
 		}
 	}
diff --git a/net/tipc/subscr.c b/net/tipc/subscr.c
index f8490d94e323..d364c87b2533 100644
--- a/net/tipc/subscr.c
+++ b/net/tipc/subscr.c
@@ -169,7 +169,7 @@ struct tipc_subscription *tipc_sub_subscribe(struct net *net,
 	timer_setup(&sub->timer, tipc_sub_timeout, 0);
 	timeout = tipc_sub_read(&sub->evt.s, timeout);
 	if (timeout != TIPC_WAIT_FOREVER)
-		mod_timer(&sub->timer, jiffies + msecs_to_jiffies(timeout));
+		timer_mod(&sub->timer, jiffies + msecs_to_jiffies(timeout));
 	return sub;
 }
 
diff --git a/net/wireless/core.c b/net/wireless/core.c
index 5c3c72df0591..2f17deae8ae4 100644
--- a/net/wireless/core.c
+++ b/net/wireless/core.c
@@ -1728,7 +1728,7 @@ void wiphy_delayed_work_queue(struct wiphy *wiphy,
 	}
 
 	dwork->wiphy = wiphy;
-	mod_timer(&dwork->timer, jiffies + delay);
+	timer_mod(&dwork->timer, jiffies + delay);
 }
 EXPORT_SYMBOL_GPL(wiphy_delayed_work_queue);
 
diff --git a/net/x25/x25_link.c b/net/x25/x25_link.c
index 4608aa5b4f31..f1855563db23 100644
--- a/net/x25/x25_link.c
+++ b/net/x25/x25_link.c
@@ -41,7 +41,7 @@ static void x25_transmit_restart_request(struct x25_neigh *nb);
  */
 static inline void x25_start_t20timer(struct x25_neigh *nb)
 {
-	mod_timer(&nb->t20timer, jiffies + nb->t20);
+	timer_mod(&nb->t20timer, jiffies + nb->t20);
 }
 
 static void x25_t20timer_expiry(struct timer_list *t)
diff --git a/net/x25/x25_timer.c b/net/x25/x25_timer.c
index 2ec63a1f4c6d..895627a77938 100644
--- a/net/x25/x25_timer.c
+++ b/net/x25/x25_timer.c
@@ -36,7 +36,7 @@ void x25_init_timers(struct sock *sk)
 
 void x25_start_heartbeat(struct sock *sk)
 {
-	mod_timer(&sk->sk_timer, jiffies + 5 * HZ);
+	timer_mod(&sk->sk_timer, jiffies + 5 * HZ);
 }
 
 void x25_stop_heartbeat(struct sock *sk)
@@ -48,28 +48,28 @@ void x25_start_t2timer(struct sock *sk)
 {
 	struct x25_sock *x25 = x25_sk(sk);
 
-	mod_timer(&x25->timer, jiffies + x25->t2);
+	timer_mod(&x25->timer, jiffies + x25->t2);
 }
 
 void x25_start_t21timer(struct sock *sk)
 {
 	struct x25_sock *x25 = x25_sk(sk);
 
-	mod_timer(&x25->timer, jiffies + x25->t21);
+	timer_mod(&x25->timer, jiffies + x25->t21);
 }
 
 void x25_start_t22timer(struct sock *sk)
 {
 	struct x25_sock *x25 = x25_sk(sk);
 
-	mod_timer(&x25->timer, jiffies + x25->t22);
+	timer_mod(&x25->timer, jiffies + x25->t22);
 }
 
 void x25_start_t23timer(struct sock *sk)
 {
 	struct x25_sock *x25 = x25_sk(sk);
 
-	mod_timer(&x25->timer, jiffies + x25->t23);
+	timer_mod(&x25->timer, jiffies + x25->t23);
 }
 
 void x25_stop_timer(struct sock *sk)
diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index 59d0bd5e80ec..d67da0ee44a4 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -406,7 +406,7 @@ static void xfrm_policy_timer(struct timer_list *t)
 	if (warn)
 		km_policy_expired(xp, dir, 0, 0);
 	if (next != TIME64_MAX &&
-	    !mod_timer(&xp->timer, jiffies + make_jiffies(next)))
+	    !timer_mod(&xp->timer, jiffies + make_jiffies(next)))
 		xfrm_pol_hold(xp);
 
 out:
@@ -1478,7 +1478,7 @@ static void xfrm_policy_requeue(struct xfrm_policy *old,
 	spin_lock_bh(&pq->hold_queue.lock);
 	skb_queue_splice(&list, &pq->hold_queue);
 	pq->timeout = XFRM_QUEUE_TMO_MIN;
-	if (!mod_timer(&pq->hold_timer, jiffies))
+	if (!timer_mod(&pq->hold_timer, jiffies))
 		xfrm_pol_hold(new);
 	spin_unlock_bh(&pq->hold_queue.lock);
 }
@@ -1609,7 +1609,7 @@ int xfrm_policy_insert(int dir, struct xfrm_policy *policy, int excl)
 	hlist_add_head(&policy->byidx, net->xfrm.policy_byidx+idx_hash(net, policy->index));
 	policy->curlft.add_time = ktime_get_real_seconds();
 	policy->curlft.use_time = 0;
-	if (!mod_timer(&policy->timer, jiffies + HZ))
+	if (!timer_mod(&policy->timer, jiffies + HZ))
 		xfrm_pol_hold(policy);
 	spin_unlock_bh(&net->xfrm.xfrm_policy_lock);
 
@@ -2930,7 +2930,7 @@ static void xfrm_policy_queue_process(struct timer_list *t)
 			goto purge_queue;
 
 		pq->timeout = pq->timeout << 1;
-		if (!mod_timer(&pq->hold_timer, jiffies + pq->timeout))
+		if (!timer_mod(&pq->hold_timer, jiffies + pq->timeout))
 			xfrm_pol_hold(pol);
 		goto out;
 	}
@@ -3011,7 +3011,7 @@ static int xdst_queue_output(struct net *net, struct sock *sk, struct sk_buff *s
 	}
 
 	__skb_queue_tail(&pq->hold_queue, skb);
-	if (!mod_timer(&pq->hold_timer, sched_next))
+	if (!timer_mod(&pq->hold_timer, sched_next))
 		xfrm_pol_hold(pol);
 
 	spin_unlock_bh(&pq->hold_queue.lock);
diff --git a/net/xfrm/xfrm_replay.c b/net/xfrm/xfrm_replay.c
index dbdf8a39dffe..737574b55a87 100644
--- a/net/xfrm/xfrm_replay.c
+++ b/net/xfrm/xfrm_replay.c
@@ -91,7 +91,7 @@ void xfrm_replay_notify(struct xfrm_state *x, int event)
 	km_state_notify(x, &c);
 
 	if (x->replay_maxage &&
-	    !mod_timer(&x->rtimer, jiffies + x->replay_maxage))
+	    !timer_mod(&x->rtimer, jiffies + x->replay_maxage))
 		x->xflags &= ~XFRM_TIME_DEFER;
 }
 
@@ -349,7 +349,7 @@ static void xfrm_replay_notify_bmp(struct xfrm_state *x, int event)
 	km_state_notify(x, &c);
 
 	if (x->replay_maxage &&
-	    !mod_timer(&x->rtimer, jiffies + x->replay_maxage))
+	    !timer_mod(&x->rtimer, jiffies + x->replay_maxage))
 		x->xflags &= ~XFRM_TIME_DEFER;
 }
 
@@ -415,7 +415,7 @@ static void xfrm_replay_notify_esn(struct xfrm_state *x, int event)
 	km_state_notify(x, &c);
 
 	if (x->replay_maxage &&
-	    !mod_timer(&x->rtimer, jiffies + x->replay_maxage))
+	    !timer_mod(&x->rtimer, jiffies + x->replay_maxage))
 		x->xflags &= ~XFRM_TIME_DEFER;
 }
 
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 767ec3681de4..19a62ad5ee4e 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -1747,7 +1747,7 @@ static void __xfrm_state_insert(struct xfrm_state *x)
 
 	hrtimer_start(&x->mtimer, ktime_set(1, 0), HRTIMER_MODE_REL_SOFT);
 	if (x->replay_maxage)
-		mod_timer(&x->rtimer, jiffies + x->replay_maxage);
+		timer_mod(&x->rtimer, jiffies + x->replay_maxage);
 
 	net->xfrm.state_num++;
 
diff --git a/samples/connector/cn_test.c b/samples/connector/cn_test.c
index 73d50b4aebb6..2f20e1feb5c7 100644
--- a/samples/connector/cn_test.c
+++ b/samples/connector/cn_test.c
@@ -138,7 +138,7 @@ static void cn_test_timer_func(struct timer_list *unused)
 
 	cn_test_timer_counter++;
 
-	mod_timer(&cn_test_timer, jiffies + msecs_to_jiffies(1000));
+	timer_mod(&cn_test_timer, jiffies + msecs_to_jiffies(1000));
 }
 
 static int cn_test_init(void)
@@ -156,7 +156,7 @@ static int cn_test_init(void)
 	}
 
 	timer_setup(&cn_test_timer, cn_test_timer_func, 0);
-	mod_timer(&cn_test_timer, jiffies + msecs_to_jiffies(1000));
+	timer_mod(&cn_test_timer, jiffies + msecs_to_jiffies(1000));
 
 	pr_info("initialized with id={%u.%u}\n",
 		cn_test_id.idx, cn_test_id.val);
diff --git a/samples/ftrace/sample-trace-array.c b/samples/ftrace/sample-trace-array.c
index 0e0e0628cead..5620399aea10 100644
--- a/samples/ftrace/sample-trace-array.c
+++ b/samples/ftrace/sample-trace-array.c
@@ -77,7 +77,7 @@ static int simple_thread(void *arg)
 	 *
 	 */
 	timer_add(&mytimer);
-	mod_timer(&mytimer, jiffies+delay);
+	timer_mod(&mytimer, jiffies+delay);
 
 	while (!kthread_should_stop())
 		simple_thread_func(count++);
diff --git a/security/keys/gc.c b/security/keys/gc.c
index f27223ea4578..e7d77194ea32 100644
--- a/security/keys/gc.c
+++ b/security/keys/gc.c
@@ -62,7 +62,7 @@ void key_schedule_gc(time64_t gc_at)
 		kdebug("DEFERRED");
 		key_gc_next_run = gc_at;
 		expires = jiffies + (gc_at - now) * HZ;
-		mod_timer(&key_gc_timer, expires);
+		timer_mod(&key_gc_timer, expires);
 	}
 }
 
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 5bf5bddfd82a..7885583e5737 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1142,7 +1142,7 @@ static int snd_timer_s_start(struct snd_timer * timer)
 		priv->correction = 0;
 	}
 	priv->last_expires = njiff;
-	mod_timer(&priv->tlist, njiff);
+	timer_mod(&priv->tlist, njiff);
 	return 0;
 }
 
diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 6c318a5903ab..b5d41bad0952 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -224,7 +224,7 @@ static int loopback_jiffies_timer_start(struct loopback_pcm *dpcm)
 	}
 	tick = dpcm->period_size_frac - dpcm->irq_pos;
 	tick = DIV_ROUND_UP(tick, dpcm->pcm_bps);
-	mod_timer(&dpcm->timer, jiffies + tick);
+	timer_mod(&dpcm->timer, jiffies + tick);
 
 	return 0;
 }
diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 783fe3a22bc9..dc191a26920e 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -242,7 +242,7 @@ struct dummy_systimer_pcm {
 
 static void dummy_systimer_rearm(struct dummy_systimer_pcm *dpcm)
 {
-	mod_timer(&dpcm->timer, jiffies +
+	timer_mod(&dpcm->timer, jiffies +
 		DIV_ROUND_UP(dpcm->frac_period_rest, dpcm->rate));
 }
 
diff --git a/sound/drivers/mpu401/mpu401_uart.c b/sound/drivers/mpu401/mpu401_uart.c
index 670f8ba92c08..e4d9a9f22342 100644
--- a/sound/drivers/mpu401/mpu401_uart.c
+++ b/sound/drivers/mpu401/mpu401_uart.c
@@ -162,7 +162,7 @@ static void snd_mpu401_uart_timer(struct timer_list *t)
 
 	spin_lock_irqsave(&mpu->timer_lock, flags);
 	/*mpu->mode |= MPU401_MODE_TIMER;*/
-	mod_timer(&mpu->timer,  1 + jiffies);
+	timer_mod(&mpu->timer,  1 + jiffies);
 	spin_unlock_irqrestore(&mpu->timer_lock, flags);
 	if (mpu->rmidi)
 		_snd_mpu401_uart_interrupt(mpu);
@@ -178,7 +178,7 @@ static void snd_mpu401_uart_add_timer (struct snd_mpu401 *mpu, int input)
 	spin_lock_irqsave (&mpu->timer_lock, flags);
 	if (mpu->timer_invoked == 0) {
 		timer_setup(&mpu->timer, snd_mpu401_uart_timer, 0);
-		mod_timer(&mpu->timer, 1 + jiffies);
+		timer_mod(&mpu->timer, 1 + jiffies);
 	} 
 	mpu->timer_invoked |= input ? MPU401_MODE_INPUT_TIMER :
 		MPU401_MODE_OUTPUT_TIMER;
diff --git a/sound/drivers/mtpav.c b/sound/drivers/mtpav.c
index 851f34e2cdd0..c7297cf18194 100644
--- a/sound/drivers/mtpav.c
+++ b/sound/drivers/mtpav.c
@@ -393,7 +393,7 @@ static void snd_mtpav_output_timer(struct timer_list *t)
 
 	spin_lock_irqsave(&chip->spinlock, flags);
 	/* reprogram timer */
-	mod_timer(&chip->timer, 1 + jiffies);
+	timer_mod(&chip->timer, 1 + jiffies);
 	/* process each port */
 	for (p = 0; p <= chip->num_ports * 2 + MTPAV_PIDX_BROADCAST; p++) {
 		struct mtpav_port *portp = &chip->ports[p];
@@ -406,7 +406,7 @@ static void snd_mtpav_output_timer(struct timer_list *t)
 /* spinlock held! */
 static void snd_mtpav_add_output_timer(struct mtpav *chip)
 {
-	mod_timer(&chip->timer, 1 + jiffies);
+	timer_mod(&chip->timer, 1 + jiffies);
 }
 
 /* spinlock held! */
diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
index de7449cb6515..e7bdb418e2e3 100644
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -253,7 +253,7 @@ void snd_opl3_timer_func(struct timer_list *t)
 
 	spin_lock_irqsave(&opl3->sys_timer_lock, flags);
 	if (again)
-		mod_timer(&opl3->tlist, jiffies + 1);	/* invoke again */
+		timer_mod(&opl3->tlist, jiffies + 1);	/* invoke again */
 	else
 		opl3->sys_timer_status = 0;
 	spin_unlock_irqrestore(&opl3->sys_timer_lock, flags);
@@ -267,7 +267,7 @@ static void snd_opl3_start_timer(struct snd_opl3 *opl3)
 	unsigned long flags;
 	spin_lock_irqsave(&opl3->sys_timer_lock, flags);
 	if (! opl3->sys_timer_status) {
-		mod_timer(&opl3->tlist, jiffies + 1);
+		timer_mod(&opl3->tlist, jiffies + 1);
 		opl3->sys_timer_status = 1;
 	}
 	spin_unlock_irqrestore(&opl3->sys_timer_lock, flags);
diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 39f1e1fe4c44..da68ba907de1 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -365,7 +365,7 @@ static void timer_timeout(struct timer_list *data)
 	}
 
 	if (!v_iter->suspend)
-		mod_timer(&v_iter->timer_instance, jiffies + TIMER_INTERVAL + inject_delay);
+		timer_mod(&v_iter->timer_instance, jiffies + TIMER_INTERVAL + inject_delay);
 }
 
 static int snd_pcmtst_pcm_open(struct snd_pcm_substream *substream)
@@ -413,7 +413,7 @@ static inline void reset_buf_iterator(struct pcmtst_buf_iter *v_iter)
 static inline void start_pcmtest_timer(struct pcmtst_buf_iter *v_iter)
 {
 	v_iter->suspend = false;
-	mod_timer(&v_iter->timer_instance, jiffies + TIMER_INTERVAL);
+	timer_mod(&v_iter->timer_instance, jiffies + TIMER_INTERVAL);
 }
 
 static int snd_pcmtst_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
diff --git a/sound/drivers/serial-u16550.c b/sound/drivers/serial-u16550.c
index 6d0656fcd574..b98682cd26a8 100644
--- a/sound/drivers/serial-u16550.c
+++ b/sound/drivers/serial-u16550.c
@@ -158,7 +158,7 @@ static inline void snd_uart16550_add_timer(struct snd_uart16550 *uart)
 {
 	if (!uart->timer_running) {
 		/* timer 38600bps * 10bit * 16byte */
-		mod_timer(&uart->buffer_timer, jiffies + (HZ + 255) / 256);
+		timer_mod(&uart->buffer_timer, jiffies + (HZ + 255) / 256);
 		uart->timer_running = 1;
 	}
 }
diff --git a/sound/i2c/other/ak4117.c b/sound/i2c/other/ak4117.c
index cd380db195ef..4f0b87914d89 100644
--- a/sound/i2c/other/ak4117.c
+++ b/sound/i2c/other/ak4117.c
@@ -112,7 +112,7 @@ void snd_ak4117_reinit(struct ak4117 *chip)
 	/* release powerdown, everything is initialized now */
 	reg_write(chip, AK4117_REG_PWRDN, old | AK4117_RST | AK4117_PWN);
 	chip->init = 0;
-	mod_timer(&chip->timer, 1 + jiffies);
+	timer_mod(&chip->timer, 1 + jiffies);
 }
 
 static unsigned int external_rate(unsigned char rcs1)
@@ -509,7 +509,7 @@ static void snd_ak4117_timer(struct timer_list *t)
 	if (chip->init)
 		return;
 	snd_ak4117_check_rate_and_errors(chip, 0);
-	mod_timer(&chip->timer, 1 + jiffies);
+	timer_mod(&chip->timer, 1 + jiffies);
 }
 
 EXPORT_SYMBOL(snd_ak4117_create);
diff --git a/sound/isa/sb/emu8000_pcm.c b/sound/isa/sb/emu8000_pcm.c
index 215bbcd0360e..60e39870bdf4 100644
--- a/sound/isa/sb/emu8000_pcm.c
+++ b/sound/isa/sb/emu8000_pcm.c
@@ -196,7 +196,7 @@ static void emu8k_pcm_timer_func(struct timer_list *t)
 	rec->last_ptr = ptr;
 
 	/* reprogram timer */
-	mod_timer(&rec->timer, jiffies + 1);
+	timer_mod(&rec->timer, jiffies + 1);
 
 	/* update period */
 	if (rec->period_pos >= (int)rec->period_size) {
@@ -345,7 +345,7 @@ static void start_voice(struct snd_emu8k_pcm *rec, int ch)
 	/* start timer */
 	spin_lock_irqsave(&rec->timer_lock, flags);
 	if (! rec->timer_running) {
-		mod_timer(&rec->timer, jiffies + 1);
+		timer_mod(&rec->timer, jiffies + 1);
 		rec->timer_running = 1;
 	}
 	spin_unlock_irqrestore(&rec->timer_lock, flags);
diff --git a/sound/isa/sb/sb8_midi.c b/sound/isa/sb/sb8_midi.c
index 25caf23273bc..9401c90f4aec 100644
--- a/sound/isa/sb/sb8_midi.c
+++ b/sound/isa/sb/sb8_midi.c
@@ -204,7 +204,7 @@ static void snd_sb8dsp_midi_output_timer(struct timer_list *t)
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->open_lock, flags);
-	mod_timer(&chip->midi_timer, 1 + jiffies);
+	timer_mod(&chip->midi_timer, 1 + jiffies);
 	spin_unlock_irqrestore(&chip->open_lock, flags);	
 	snd_sb8dsp_midi_output_write(substream);
 }
@@ -218,7 +218,7 @@ static void snd_sb8dsp_midi_output_trigger(struct snd_rawmidi_substream *substre
 	spin_lock_irqsave(&chip->open_lock, flags);
 	if (up) {
 		if (!(chip->open & SB_OPEN_MIDI_OUTPUT_TRIGGER)) {
-			mod_timer(&chip->midi_timer, 1 + jiffies);
+			timer_mod(&chip->midi_timer, 1 + jiffies);
 			chip->open |= SB_OPEN_MIDI_OUTPUT_TRIGGER;
 		}
 	} else {
diff --git a/sound/isa/wavefront/wavefront_midi.c b/sound/isa/wavefront/wavefront_midi.c
index 494b21be665c..0146a18226bc 100644
--- a/sound/isa/wavefront/wavefront_midi.c
+++ b/sound/isa/wavefront/wavefront_midi.c
@@ -357,7 +357,7 @@ static void snd_wavefront_midi_output_timer(struct timer_list *t)
 	unsigned long flags;
 	
 	spin_lock_irqsave (&midi->virtual, flags);
-	mod_timer(&midi->timer, 1 + jiffies);
+	timer_mod(&midi->timer, 1 + jiffies);
 	spin_unlock_irqrestore (&midi->virtual, flags);
 	snd_wavefront_midi_output_write(card);
 }
@@ -387,7 +387,7 @@ static void snd_wavefront_midi_output_trigger(struct snd_rawmidi_substream *subs
 				timer_setup(&midi->timer,
 					    snd_wavefront_midi_output_timer,
 					    0);
-				mod_timer(&midi->timer, 1 + jiffies);
+				timer_mod(&midi->timer, 1 + jiffies);
 			}
 			midi->istimer++;
 			midi->mode[mpu] |= MPU401_MODE_OUTPUT_TRIGGER;
diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 3fba8f3a90ec..6c4139cbb440 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -508,7 +508,7 @@ static void snd_card_asihpi_pcm_timer_start(struct snd_pcm_substream *
 	expiry = HZ / 200;
 
 	expiry = max(expiry, 1); /* don't let it be zero! */
-	mod_timer(&dpcm->timer, jiffies + expiry);
+	timer_mod(&dpcm->timer, jiffies + expiry);
 	dpcm->respawn_timer = 1;
 }
 
diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
index fa6867adb42b..47571889fc8b 100644
--- a/sound/pci/ctxfi/cttimer.c
+++ b/sound/pci/ctxfi/cttimer.c
@@ -84,7 +84,7 @@ static void ct_systimer_callback(struct timer_list *t)
 		   * HZ + (runtime->rate - 1)) / runtime->rate + HZ * 5 / 1000;
 	spin_lock_irqsave(&ti->lock, flags);
 	if (ti->running)
-		mod_timer(&ti->timer, jiffies + interval);
+		timer_mod(&ti->timer, jiffies + interval);
 	spin_unlock_irqrestore(&ti->lock, flags);
 }
 
@@ -100,7 +100,7 @@ static void ct_systimer_start(struct ct_timer_instance *ti)
 
 	spin_lock_irqsave(&ti->lock, flags);
 	ti->running = 1;
-	mod_timer(&ti->timer,
+	timer_mod(&ti->timer,
 		  jiffies + (runtime->period_size * HZ +
 			     (runtime->rate - 1)) / runtime->rate);
 	spin_unlock_irqrestore(&ti->lock, flags);
diff --git a/sound/pci/echoaudio/midi.c b/sound/pci/echoaudio/midi.c
index c3f3c9129561..c4d2ca269ec8 100644
--- a/sound/pci/echoaudio/midi.c
+++ b/sound/pci/echoaudio/midi.c
@@ -238,7 +238,7 @@ static void snd_echo_midi_output_write(struct timer_list *t)
 		/* The timer will expire slightly after the data has been
 		   sent */
 		time = (sent << 3) / 25 + 1;	/* 8/25=0.32ms to send a byte */
-		mod_timer(&chip->timer, jiffies + (time * HZ + 999) / 1000);
+		timer_mod(&chip->timer, jiffies + (time * HZ + 999) / 1000);
 		dev_dbg(chip->card->dev,
 			"Timer armed(%d)\n", ((time * HZ + 999) / 1000));
 	}
diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index aef44a88d545..6db44cf776b6 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -569,7 +569,7 @@ static void snd_korg1212_SendStop(struct snd_korg1212 *korg1212)
 		korg1212->sharedBufferPtr->cardCommand = 0xffffffff;
 		/* program the timer */
 		korg1212->stop_pending_cnt = HZ;
-		mod_timer(&korg1212->timer, jiffies + 1);
+		timer_mod(&korg1212->timer, jiffies + 1);
 	}
 }
 
@@ -600,7 +600,7 @@ static void snd_korg1212_timer_func(struct timer_list *t)
 	} else {
 		if (--korg1212->stop_pending_cnt > 0) {
 			/* reprogram timer */
-			mod_timer(&korg1212->timer, jiffies + 1);
+			timer_mod(&korg1212->timer, jiffies + 1);
 		} else {
 			dev_dbg(korg1212->card->dev, "korg1212_timer_func timeout\n");
 			korg1212->sharedBufferPtr->cardCommand = 0;
diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index e4b059000def..a78e2ad6d0c5 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -1406,7 +1406,7 @@ static void snd_hdsp_midi_output_timer(struct timer_list *t)
 	*/
 
 	if (hmidi->istimer)
-		mod_timer(&hmidi->timer, 1 + jiffies);
+		timer_mod(&hmidi->timer, 1 + jiffies);
 
 	spin_unlock_irqrestore (&hmidi->lock, flags);
 }
@@ -1422,7 +1422,7 @@ static void snd_hdsp_midi_output_trigger(struct snd_rawmidi_substream *substream
 		if (!hmidi->istimer) {
 			timer_setup(&hmidi->timer, snd_hdsp_midi_output_timer,
 				    0);
-			mod_timer(&hmidi->timer, 1 + jiffies);
+			timer_mod(&hmidi->timer, 1 + jiffies);
 			hmidi->istimer++;
 		}
 	} else {
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index bcf068e95fda..3751570c8d69 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -1956,7 +1956,7 @@ static void snd_hdspm_midi_output_timer(struct timer_list *t)
 	*/
 
 	if (hmidi->istimer)
-		mod_timer(&hmidi->timer, 1 + jiffies);
+		timer_mod(&hmidi->timer, 1 + jiffies);
 
 	spin_unlock_irqrestore (&hmidi->lock, flags);
 }
@@ -1973,7 +1973,7 @@ snd_hdspm_midi_output_trigger(struct snd_rawmidi_substream *substream, int up)
 		if (!hmidi->istimer) {
 			timer_setup(&hmidi->timer,
 				    snd_hdspm_midi_output_timer, 0);
-			mod_timer(&hmidi->timer, 1 + jiffies);
+			timer_mod(&hmidi->timer, 1 + jiffies);
 			hmidi->istimer++;
 		}
 	} else {
diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index b0f8f1d083e0..6b41c70e550d 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -278,7 +278,7 @@ static void run_spu_dma(struct work_struct *work)
 		if (unlikely(dreamcastcard->clicks >= AICA_PERIOD_NUMBER))
 			dreamcastcard->clicks %= AICA_PERIOD_NUMBER;
 		if (snd_pcm_running(dreamcastcard->substream))
-			mod_timer(&dreamcastcard->timer, jiffies + 1);
+			timer_mod(&dreamcastcard->timer, jiffies + 1);
 	}
 }
 
@@ -302,7 +302,7 @@ static void aica_period_elapsed(struct timer_list *t)
 	    AICA_PERIOD_SIZE;
 	if (play_period == dreamcastcard->current_period) {
 		/* reschedule the timer */
-		mod_timer(&(dreamcastcard->timer), jiffies + 1);
+		timer_mod(&(dreamcastcard->timer), jiffies + 1);
 		return;
 	}
 	if (runtime->channels > 1)
@@ -318,7 +318,7 @@ static void spu_begin_dma(struct snd_pcm_substream *substream)
 	dreamcastcard = substream->pcm->private_data;
 	/*get the queue to do the work */
 	schedule_work(&(dreamcastcard->spu_dma_work));
-	mod_timer(&dreamcastcard->timer, jiffies + 4);
+	timer_mod(&dreamcastcard->timer, jiffies + 4);
 }
 
 static int snd_aicapcm_pcm_open(struct snd_pcm_substream
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 7d1d8773c76d..4900f326c53d 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3397,7 +3397,7 @@ static void rt5645_jack_detect_work(struct work_struct *work)
 		if (btn_type == 0)/* button release */
 			report =  rt5645->jack_type;
 		else {
-			mod_timer(&rt5645->btn_check_timer,
+			timer_mod(&rt5645->btn_check_timer,
 				msecs_to_jiffies(100));
 		}
 	} else {
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index ea445a6191ed..5571a92c0daa 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -583,7 +583,7 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 			int time_msec;
 
 			time_msec = (int)(runtime->period_size * 1000 / runtime->rate);
-			mod_timer(timer, jiffies + msecs_to_jiffies(time_msec));
+			timer_mod(timer, jiffies + msecs_to_jiffies(time_msec));
 		}
 	}
 
diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 9b8cb80ec81a..c9b36f09eca1 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -374,7 +374,7 @@ static void cx81801_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
 		/* Complete modem response received, apply config to codec */
 
 		spin_lock_bh(&ams_delta_lock);
-		mod_timer(&cx81801_timer, jiffies + msecs_to_jiffies(150));
+		timer_mod(&cx81801_timer, jiffies + msecs_to_jiffies(150));
 		apply = !ams_delta_muted && !cx81801_cmd_pending;
 		cx81801_cmd_pending = 1;
 		spin_unlock_bh(&ams_delta_lock);
diff --git a/sound/synth/emux/emux_synth.c b/sound/synth/emux/emux_synth.c
index cff6aba9bfc3..c6562c386ba1 100644
--- a/sound/synth/emux/emux_synth.c
+++ b/sound/synth/emux/emux_synth.c
@@ -172,7 +172,7 @@ snd_emux_note_off(void *p, int note, int vel, struct snd_midi_channel *chan)
 				 */
 				vp->state = SNDRV_EMUX_ST_PENDING;
 				if (! emu->timer_active) {
-					mod_timer(&emu->tlist, jiffies + 1);
+					timer_mod(&emu->tlist, jiffies + 1);
 					emu->timer_active = 1;
 				}
 			} else
@@ -208,7 +208,7 @@ void snd_emux_timer_callback(struct timer_list *t)
 		}
 	}
 	if (do_again) {
-		mod_timer(&emu->tlist, jiffies + 1);
+		timer_mod(&emu->tlist, jiffies + 1);
 		emu->timer_active = 1;
 	} else
 		emu->timer_active = 0;
diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index a231b3f51f90..a0c49be32df6 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -249,7 +249,7 @@ static void snd_usbmidi_in_urb_complete(struct urb *urb)
 		if (err < 0) {
 			if (err != -ENODEV) {
 				ep->error_resubmit = 1;
-				mod_timer(&ep->umidi->error_timer,
+				timer_mod(&ep->umidi->error_timer,
 					  jiffies + ERROR_DELAY_JIFFIES);
 			}
 			return;
@@ -279,7 +279,7 @@ static void snd_usbmidi_out_urb_complete(struct urb *urb)
 		int err = snd_usbmidi_urb_error(urb);
 		if (err < 0) {
 			if (err != -ENODEV)
-				mod_timer(&ep->umidi->error_timer,
+				timer_mod(&ep->umidi->error_timer,
 					  jiffies + ERROR_DELAY_JIFFIES);
 			return;
 		}
-- 
2.45.2

