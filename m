Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596B326A0CF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626201; cv=none; b=FMjPdWOW19TQvA/vYnzfHoQYY5YM0iOrarYelZBgig5A4Dgk2rn3WVlBHO3SQMuTD09DGUiu+QwdfHgWvKdaSuzkrTlcXi4AZXXjO8bX9WoD1tI+2ocWWJE+VhIEHCijJeySWmrqvzWlQlckoacI3MCAMcveL1OHEyR8l+Av3oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626201; c=relaxed/simple;
	bh=5Osb1ZYuWca06OtCkohxNGQOULvc3PxokeJ6wny0ecU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TzVu/dk/UYwma5Sd+uMXAxODg4ueYNCAoVNyzzxRPvLK251SuPvqgTnQ62GkUa80/fUHWQZYHrfRe5T2A1LbgYhJqrKUN6IGm0jBeAn4O+5226kaaCfhaPuJ4wQ7G1cwFO1SwhYNXU0et3U7sEe0xid2XSgMmbGR1vSd7hNouNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPaQ/CFT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPaQ/CFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8347C4CEEB;
	Mon, 14 Apr 2025 10:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626200;
	bh=5Osb1ZYuWca06OtCkohxNGQOULvc3PxokeJ6wny0ecU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KPaQ/CFTtkoqfJGigb3MK3S2G+vu7MlOEqGTBWaTHFn2DHWO6/g/FxKAXl0apyzbG
	 WJUvX0rd5nlIvv1cxqZNJxQ2D6AIpEO/MwVfL+igd3qM6ty4mQOEEQnWNdccMp+xYj
	 +jw3ZqxNVikdCYiC1yerRN41n1r5GLuPN++5d3O3ylvYVOiX/ut+arVjY8mmI33Urd
	 TztzBoQpy8JQOZK0bqHEJhfebQzQTU7ARz8XXZWEzjrNHO+Fv7de2oCQw2kW2r3dty
	 NU6muDopm44d66oaRGG5WAbkwa3dXmdJtCqBpV+Qe8Bdy0rAFF1rW7ETkbC4L+1PPe
	 2sxzH8yg0o92w==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 05/17] treewide, timers: Rename from_timer() => timer_container_of()
Date: Mon, 14 Apr 2025 12:22:39 +0200
Message-ID: <20250414102301.332225-6-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414102301.332225-1-mingo@kernel.org>
References: <20250414102301.332225-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move this API to the canonical timer_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/alpha/kernel/srmcons.c                        |  2 +-
 arch/powerpc/kvm/booke.c                           |  2 +-
 arch/powerpc/platforms/powermac/low_i2c.c          |  2 +-
 arch/sh/drivers/heartbeat.c                        |  2 +-
 arch/sh/drivers/pci/common.c                       |  4 ++--
 arch/sh/drivers/push-switch.c                      |  2 +-
 arch/sparc/kernel/viohs.c                          |  2 +-
 arch/um/drivers/vector_kern.c                      |  2 +-
 arch/x86/kvm/xen.c                                 |  2 +-
 arch/xtensa/platforms/iss/network.c                |  2 +-
 block/blk-core.c                                   |  2 +-
 block/blk-iolatency.c                              |  2 +-
 block/blk-stat.c                                   |  2 +-
 block/blk-throttle.c                               |  2 +-
 block/kyber-iosched.c                              |  2 +-
 drivers/accel/qaic/qaic_timesync.c                 |  2 +-
 drivers/acpi/apei/ghes.c                           |  2 +-
 drivers/ata/libahci.c                              |  2 +-
 drivers/ata/libata-eh.c                            |  2 +-
 drivers/atm/idt77252.c                             |  4 ++--
 drivers/atm/lanai.c                                |  2 +-
 drivers/auxdisplay/line-display.c                  |  2 +-
 drivers/base/power/main.c                          |  2 +-
 drivers/base/power/wakeup.c                        |  2 +-
 drivers/block/aoe/aoecmd.c                         |  2 +-
 drivers/block/aoe/aoedev.c                         |  2 +-
 drivers/block/drbd/drbd_main.c                     |  2 +-
 drivers/block/drbd/drbd_req.c                      |  2 +-
 drivers/block/drbd/drbd_worker.c                   |  4 ++--
 drivers/block/swim3.c                              |  8 +++----
 drivers/bluetooth/bluecard_cs.c                    |  2 +-
 drivers/bluetooth/btnxpuart.c                      |  2 +-
 drivers/bluetooth/hci_bcsp.c                       |  2 +-
 drivers/bluetooth/hci_h5.c                         |  2 +-
 drivers/bluetooth/hci_qca.c                        |  4 ++--
 drivers/bus/mhi/host/pci_generic.c                 |  2 +-
 drivers/char/hw_random/xgene-rng.c                 |  2 +-
 drivers/char/ipmi/bt-bmc.c                         |  2 +-
 drivers/char/ipmi/ipmi_si_intf.c                   |  2 +-
 drivers/char/ipmi/ipmi_ssif.c                      |  4 ++--
 drivers/char/ipmi/ssif_bmc.c                       |  2 +-
 drivers/char/tpm/tpm-dev-common.c                  |  2 +-
 drivers/comedi/drivers/comedi_test.c               |  4 ++--
 drivers/comedi/drivers/das16.c                     |  2 +-
 drivers/comedi/drivers/jr3_pci.c                   |  2 +-
 drivers/cpufreq/powernv-cpufreq.c                  |  2 +-
 drivers/crypto/axis/artpec6_crypto.c               |  2 +-
 drivers/dma-buf/st-dma-fence.c                     |  2 +-
 drivers/dma/imx-dma.c                              |  2 +-
 drivers/dma/ioat/dma.c                             |  2 +-
 drivers/firewire/core-transaction.c                |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |  2 +-
 drivers/gpu/drm/bridge/tda998x_drv.c               |  2 +-
 drivers/gpu/drm/drm_vblank.c                       |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  2 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  2 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |  2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |  2 +-
 drivers/gpu/drm/i915/i915_sw_fence.c               |  2 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |  2 +-
 drivers/gpu/drm/i915/selftests/lib_sw_fence.c      |  2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |  2 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |  2 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |  2 +-
 drivers/gpu/drm/vgem/vgem_fence.c                  |  2 +-
 drivers/greybus/operation.c                        |  2 +-
 drivers/hid/hid-apple.c                            |  2 +-
 drivers/hid/hid-appleir.c                          |  2 +-
 drivers/hid/hid-appletb-kbd.c                      |  2 +-
 drivers/hid/hid-letsketch.c                        |  2 +-
 drivers/hid/hid-magicmouse.c                       |  2 +-
 drivers/hid/hid-multitouch.c                       |  2 +-
 drivers/hid/hid-prodikeys.c                        |  2 +-
 drivers/hid/hid-sony.c                             |  2 +-
 drivers/hid/hid-uclogic-core.c                     |  2 +-
 drivers/hid/hid-wiimote-core.c                     |  2 +-
 drivers/hid/usbhid/hid-core.c                      |  2 +-
 drivers/hid/wacom_wac.c                            |  2 +-
 drivers/hsi/clients/ssi_protocol.c                 |  6 ++---
 drivers/hwmon/npcm750-pwm-fan.c                    |  2 +-
 drivers/hwmon/pwm-fan.c                            |  2 +-
 drivers/i2c/busses/i2c-img-scb.c                   |  2 +-
 drivers/iio/common/ssp_sensors/ssp_dev.c           |  2 +-
 drivers/infiniband/hw/cxgb4/cm.c                   |  2 +-
 drivers/infiniband/hw/hfi1/aspm.c                  |  2 +-
 drivers/infiniband/hw/hfi1/chip.c                  |  4 ++--
 drivers/infiniband/hw/hfi1/driver.c                |  2 +-
 drivers/infiniband/hw/hfi1/mad.c                   |  2 +-
 drivers/infiniband/hw/hfi1/sdma.c                  |  2 +-
 drivers/infiniband/hw/hfi1/tid_rdma.c              |  4 ++--
 drivers/infiniband/hw/hfi1/verbs.c                 |  2 +-
 drivers/infiniband/hw/irdma/cm.c                   |  2 +-
 drivers/infiniband/hw/irdma/utils.c                |  4 ++--
 drivers/infiniband/hw/mlx5/mr.c                    |  2 +-
 drivers/infiniband/hw/mthca/mthca_catas.c          |  2 +-
 drivers/infiniband/hw/qib/qib_driver.c             |  2 +-
 drivers/infiniband/hw/qib/qib_iba6120.c            |  4 ++--
 drivers/infiniband/hw/qib/qib_iba7220.c            |  4 ++--
 drivers/infiniband/hw/qib/qib_iba7322.c            |  4 ++--
 drivers/infiniband/hw/qib/qib_init.c               |  2 +-
 drivers/infiniband/hw/qib/qib_intr.c               |  2 +-
 drivers/infiniband/hw/qib/qib_mad.c                |  2 +-
 drivers/infiniband/hw/qib/qib_sd7220.c             |  2 +-
 drivers/infiniband/hw/qib/qib_tx.c                 |  2 +-
 drivers/infiniband/hw/qib/qib_verbs.c              |  2 +-
 drivers/infiniband/sw/rdmavt/qp.c                  |  2 +-
 drivers/infiniband/sw/rxe/rxe_comp.c               |  2 +-
 drivers/infiniband/sw/rxe/rxe_req.c                |  2 +-
 drivers/input/ff-memless.c                         |  2 +-
 drivers/input/gameport/gameport.c                  |  2 +-
 drivers/input/input.c                              |  2 +-
 drivers/input/joystick/db9.c                       |  2 +-
 drivers/input/joystick/gamecon.c                   |  2 +-
 drivers/input/joystick/turbografx.c                |  2 +-
 drivers/input/keyboard/imx_keypad.c                |  2 +-
 drivers/input/keyboard/locomokbd.c                 |  2 +-
 drivers/input/keyboard/snvs_pwrkey.c               |  2 +-
 drivers/input/keyboard/tegra-kbc.c                 |  2 +-
 drivers/input/misc/nxp-bbnsm-pwrkey.c              |  2 +-
 drivers/input/mouse/alps.c                         |  2 +-
 drivers/input/mouse/byd.c                          |  2 +-
 drivers/input/touchscreen/ad7877.c                 |  2 +-
 drivers/input/touchscreen/ad7879.c                 |  2 +-
 drivers/input/touchscreen/bu21029_ts.c             |  2 +-
 drivers/input/touchscreen/exc3000.c                |  2 +-
 drivers/input/touchscreen/sx8654.c                 |  2 +-
 drivers/input/touchscreen/tsc200x-core.c           |  2 +-
 drivers/iommu/dma-iommu.c                          |  2 +-
 drivers/isdn/hardware/mISDN/hfcpci.c               |  2 +-
 drivers/isdn/hardware/mISDN/mISDNipac.c            |  2 +-
 drivers/isdn/hardware/mISDN/mISDNisar.c            |  2 +-
 drivers/isdn/hardware/mISDN/w6692.c                |  2 +-
 drivers/isdn/mISDN/dsp_tones.c                     |  2 +-
 drivers/isdn/mISDN/fsm.c                           |  2 +-
 drivers/isdn/mISDN/l1oip_core.c                    |  4 ++--
 drivers/isdn/mISDN/timerdev.c                      |  2 +-
 drivers/leds/flash/leds-rt8515.c                   |  2 +-
 drivers/leds/flash/leds-sgm3140.c                  |  2 +-
 drivers/leds/led-core.c                            |  2 +-
 drivers/leds/trigger/ledtrig-activity.c            |  2 +-
 drivers/leds/trigger/ledtrig-heartbeat.c           |  2 +-
 drivers/leds/trigger/ledtrig-pattern.c             |  2 +-
 drivers/leds/trigger/ledtrig-transient.c           |  2 +-
 drivers/mailbox/mailbox-altera.c                   |  2 +-
 drivers/md/bcache/stats.c                          |  2 +-
 drivers/md/dm-delay.c                              |  2 +-
 drivers/md/dm-integrity.c                          |  2 +-
 drivers/md/dm-mpath.c                              |  2 +-
 drivers/md/dm-raid1.c                              |  2 +-
 drivers/md/dm-vdo/dedupe.c                         |  2 +-
 drivers/md/dm-writecache.c                         |  4 ++--
 drivers/md/md.c                                    |  2 +-
 drivers/media/common/saa7146/saa7146_fops.c        |  2 +-
 drivers/media/common/saa7146/saa7146_vbi.c         |  2 +-
 drivers/media/dvb-core/dmxdev.c                    |  2 +-
 drivers/media/i2c/tc358743.c                       |  2 +-
 drivers/media/i2c/tvaudio.c                        |  2 +-
 drivers/media/pci/bt8xx/bttv-driver.c              |  2 +-
 drivers/media/pci/bt8xx/bttv-input.c               |  4 ++--
 drivers/media/pci/cx18/cx18-fileops.c              |  2 +-
 drivers/media/pci/ivtv/ivtv-irq.c                  |  2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c |  2 +-
 drivers/media/pci/saa7134/saa7134-core.c           |  2 +-
 drivers/media/pci/saa7134/saa7134-input.c          |  2 +-
 drivers/media/pci/tw686x/tw686x-core.c             |  2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |  2 +-
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |  2 +-
 drivers/media/radio/radio-cadet.c                  |  2 +-
 drivers/media/rc/ene_ir.c                          |  2 +-
 drivers/media/rc/igorplugusb.c                     |  2 +-
 drivers/media/rc/img-ir/img-ir-hw.c                |  4 ++--
 drivers/media/rc/img-ir/img-ir-raw.c               |  2 +-
 drivers/media/rc/imon.c                            |  2 +-
 drivers/media/rc/ir-mce_kbd-decoder.c              |  2 +-
 drivers/media/rc/rc-ir-raw.c                       |  2 +-
 drivers/media/rc/rc-main.c                         |  4 ++--
 drivers/media/usb/au0828/au0828-dvb.c              |  2 +-
 drivers/media/usb/au0828/au0828-video.c            |  4 ++--
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            | 10 ++++----
 drivers/media/usb/s2255/s2255drv.c                 |  2 +-
 drivers/memory/tegra/tegra210-emc-core.c           |  4 ++--
 drivers/memstick/core/ms_block.c                   |  2 +-
 drivers/memstick/host/jmb38x_ms.c                  |  2 +-
 drivers/memstick/host/r592.c                       |  2 +-
 drivers/memstick/host/tifm_ms.c                    |  2 +-
 drivers/misc/bcm-vk/bcm_vk_tty.c                   |  2 +-
 drivers/misc/cardreader/rtsx_usb.c                 |  2 +-
 drivers/misc/sgi-xp/xpc_main.c                     |  2 +-
 drivers/misc/sgi-xp/xpc_partition.c                |  4 ++--
 drivers/mmc/core/host.c                            |  2 +-
 drivers/mmc/host/atmel-mci.c                       |  4 ++--
 drivers/mmc/host/dw_mmc.c                          |  6 ++---
 drivers/mmc/host/jz4740_mmc.c                      |  2 +-
 drivers/mmc/host/meson-mx-sdio.c                   |  2 +-
 drivers/mmc/host/mvsdio.c                          |  2 +-
 drivers/mmc/host/mxcmmc.c                          |  2 +-
 drivers/mmc/host/omap.c                            |  6 ++---
 drivers/mmc/host/sdhci.c                           |  4 ++--
 drivers/mmc/host/tifm_sd.c                         |  2 +-
 drivers/mmc/host/via-sdmmc.c                       |  2 +-
 drivers/mmc/host/vub300.c                          |  4 ++--
 drivers/mmc/host/wbsd.c                            |  2 +-
 drivers/most/most_usb.c                            |  2 +-
 drivers/mtd/sm_ftl.c                               |  2 +-
 drivers/net/arcnet/arcnet.c                        |  2 +-
 drivers/net/can/grcan.c                            |  4 ++--
 drivers/net/can/kvaser_pciefd.c                    |  2 +-
 drivers/net/can/sja1000/peak_pcmcia.c              |  2 +-
 drivers/net/can/usb/peak_usb/pcan_usb.c            |  2 +-
 drivers/net/dsa/mv88e6xxx/phy.c                    |  2 +-
 drivers/net/eql.c                                  |  2 +-
 drivers/net/ethernet/3com/3c515.c                  |  2 +-
 drivers/net/ethernet/3com/3c574_cs.c               |  2 +-
 drivers/net/ethernet/3com/3c589_cs.c               |  2 +-
 drivers/net/ethernet/3com/3c59x.c                  |  2 +-
 drivers/net/ethernet/8390/axnet_cs.c               |  2 +-
 drivers/net/ethernet/8390/pcnet_cs.c               |  2 +-
 drivers/net/ethernet/agere/et131x.c                |  2 +-
 drivers/net/ethernet/amazon/ena/ena_netdev.c       |  2 +-
 drivers/net/ethernet/amd/a2065.c                   |  2 +-
 drivers/net/ethernet/amd/amd8111e.c                |  2 +-
 drivers/net/ethernet/amd/declance.c                |  2 +-
 drivers/net/ethernet/amd/pcnet32.c                 |  2 +-
 drivers/net/ethernet/amd/pds_core/main.c           |  2 +-
 drivers/net/ethernet/amd/sunlance.c                |  2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c           |  4 ++--
 drivers/net/ethernet/apple/bmac.c                  |  2 +-
 drivers/net/ethernet/apple/mace.c                  |  2 +-
 drivers/net/ethernet/aquantia/atlantic/aq_nic.c    |  4 ++--
 drivers/net/ethernet/atheros/ag71xx.c              |  2 +-
 drivers/net/ethernet/atheros/atl1c/atl1c_main.c    |  2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_main.c    |  2 +-
 drivers/net/ethernet/atheros/atlx/atl1.c           |  2 +-
 drivers/net/ethernet/atheros/atlx/atl2.c           |  4 ++--
 drivers/net/ethernet/broadcom/b44.c                |  2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.c       |  4 ++--
 drivers/net/ethernet/broadcom/bnx2.c               |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c   |  2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |  2 +-
 drivers/net/ethernet/broadcom/tg3.c                |  2 +-
 drivers/net/ethernet/brocade/bna/bnad.c            | 12 +++++-----
 drivers/net/ethernet/chelsio/cxgb/sge.c            |  6 ++---
 drivers/net/ethernet/chelsio/cxgb3/sge.c           |  4 ++--
 .../net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c   |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c           |  4 ++--
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c         |  4 ++--
 drivers/net/ethernet/cisco/enic/enic_clsf.c        |  2 +-
 drivers/net/ethernet/cisco/enic/enic_main.c        |  2 +-
 drivers/net/ethernet/dec/tulip/de2104x.c           |  4 ++--
 drivers/net/ethernet/dec/tulip/dmfe.c              |  2 +-
 drivers/net/ethernet/dec/tulip/interrupt.c         |  2 +-
 drivers/net/ethernet/dec/tulip/pnic.c              |  2 +-
 drivers/net/ethernet/dec/tulip/pnic2.c             |  2 +-
 drivers/net/ethernet/dec/tulip/timer.c             |  4 ++--
 drivers/net/ethernet/dec/tulip/tulip_core.c        |  2 +-
 drivers/net/ethernet/dec/tulip/uli526x.c           |  2 +-
 drivers/net/ethernet/dec/tulip/winbond-840.c       |  2 +-
 drivers/net/ethernet/dlink/dl2k.c                  |  2 +-
 drivers/net/ethernet/fealnx.c                      |  4 ++--
 drivers/net/ethernet/google/gve/gve_main.c         |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c      |  2 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |  2 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |  2 +-
 drivers/net/ethernet/intel/e100.c                  |  2 +-
 drivers/net/ethernet/intel/e1000e/netdev.c         |  4 ++--
 drivers/net/ethernet/intel/fm10k/fm10k_pci.c       |  2 +-
 drivers/net/ethernet/intel/i40e/i40e_main.c        |  2 +-
 drivers/net/ethernet/intel/ice/ice_main.c          |  2 +-
 drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c |  2 +-
 drivers/net/ethernet/intel/igb/igb_main.c          |  4 ++--
 drivers/net/ethernet/intel/igbvf/netdev.c          |  2 +-
 drivers/net/ethernet/intel/igc/igc_main.c          |  4 ++--
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c      |  2 +-
 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c  |  2 +-
 drivers/net/ethernet/korina.c                      |  2 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c         |  4 ++--
 drivers/net/ethernet/marvell/pxa168_eth.c          |  2 +-
 drivers/net/ethernet/marvell/skge.c                |  2 +-
 drivers/net/ethernet/marvell/sky2.c                |  2 +-
 drivers/net/ethernet/mellanox/mlx4/catas.c         |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/health.c   |  2 +-
 drivers/net/ethernet/micrel/ksz884x.c              |  4 ++--
 drivers/net/ethernet/myricom/myri10ge/myri10ge.c   |  2 +-
 drivers/net/ethernet/natsemi/natsemi.c             |  2 +-
 drivers/net/ethernet/natsemi/ns83820.c             |  2 +-
 drivers/net/ethernet/neterion/s2io.c               |  2 +-
 .../net/ethernet/netronome/nfp/nfp_net_common.c    |  2 +-
 drivers/net/ethernet/nvidia/forcedeth.c            |  6 ++---
 .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   |  2 +-
 drivers/net/ethernet/packetengines/hamachi.c       |  2 +-
 drivers/net/ethernet/packetengines/yellowfin.c     |  2 +-
 drivers/net/ethernet/pasemi/pasemi_mac.c           |  2 +-
 drivers/net/ethernet/pensando/ionic/ionic_dev.c    |  2 +-
 drivers/net/ethernet/qlogic/qla3xxx.c              |  2 +-
 drivers/net/ethernet/realtek/atp.c                 |  2 +-
 drivers/net/ethernet/rocker/rocker_ofdpa.c         |  2 +-
 drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c    |  4 ++--
 drivers/net/ethernet/seeq/ether3.c                 |  2 +-
 drivers/net/ethernet/sfc/falcon/falcon.c           |  2 +-
 drivers/net/ethernet/sfc/falcon/rx.c               |  2 +-
 drivers/net/ethernet/sfc/mcdi.c                    |  2 +-
 drivers/net/ethernet/sfc/rx_common.c               |  2 +-
 drivers/net/ethernet/sfc/siena/mcdi.c              |  2 +-
 drivers/net/ethernet/sfc/siena/rx_common.c         |  2 +-
 drivers/net/ethernet/sgi/ioc3-eth.c                |  2 +-
 drivers/net/ethernet/sis/sis190.c                  |  2 +-
 drivers/net/ethernet/sis/sis900.c                  |  2 +-
 drivers/net/ethernet/smsc/epic100.c                |  2 +-
 drivers/net/ethernet/smsc/smc91c92_cs.c            |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  2 +-
 drivers/net/ethernet/sun/cassini.c                 |  2 +-
 drivers/net/ethernet/sun/niu.c                     |  2 +-
 drivers/net/ethernet/sun/sunbmac.c                 |  2 +-
 drivers/net/ethernet/sun/sungem.c                  |  2 +-
 drivers/net/ethernet/sun/sunhme.c                  |  2 +-
 drivers/net/ethernet/sun/sunvnet_common.c          |  2 +-
 drivers/net/ethernet/synopsys/dwc-xlgmac-net.c     |  2 +-
 drivers/net/ethernet/ti/cpsw_ale.c                 |  2 +-
 drivers/net/ethernet/ti/netcp_ethss.c              |  2 +-
 drivers/net/ethernet/ti/tlan.c                     |  4 ++--
 drivers/net/ethernet/tundra/tsi108_eth.c           |  2 +-
 drivers/net/fddi/defza.c                           |  2 +-
 drivers/net/hamradio/6pack.c                       |  4 ++--
 drivers/net/hamradio/scc.c                         | 14 +++++------
 drivers/net/hippi/rrunner.c                        |  2 +-
 drivers/net/ntb_netdev.c                           |  2 +-
 drivers/net/slip/slip.c                            |  4 ++--
 drivers/net/tun.c                                  |  2 +-
 drivers/net/usb/catc.c                             |  2 +-
 drivers/net/usb/lan78xx.c                          |  2 +-
 drivers/net/usb/sierra_net.c                       |  2 +-
 drivers/net/usb/usbnet.c                           |  2 +-
 drivers/net/vxlan/vxlan_core.c                     |  2 +-
 drivers/net/wan/hdlc_cisco.c                       |  2 +-
 drivers/net/wan/hdlc_fr.c                          |  2 +-
 drivers/net/wan/hdlc_ppp.c                         |  2 +-
 drivers/net/wireguard/timers.c                     | 10 ++++----
 drivers/net/wireless/ath/ar5523/ar5523.c           |  2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c           |  2 +-
 drivers/net/wireless/ath/ath10k/pci.c              |  4 ++--
 drivers/net/wireless/ath/ath10k/sdio.c             |  2 +-
 drivers/net/wireless/ath/ath10k/snoc.c             |  2 +-
 drivers/net/wireless/ath/ath11k/ce.c               |  2 +-
 drivers/net/wireless/ath/ath11k/dp.c               |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c            |  4 ++--
 drivers/net/wireless/ath/ath12k/ce.c               |  2 +-
 drivers/net/wireless/ath/ath12k/dp.c               |  2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |  2 +-
 drivers/net/wireless/ath/ath6kl/main.c             |  2 +-
 drivers/net/wireless/ath/ath6kl/recovery.c         |  2 +-
 drivers/net/wireless/ath/ath6kl/txrx.c             |  2 +-
 drivers/net/wireless/ath/ath6kl/wmi.c              |  2 +-
 drivers/net/wireless/ath/ath9k/channel.c           |  4 ++--
 drivers/net/wireless/ath/ath9k/gpio.c              |  4 ++--
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c      |  2 +-
 drivers/net/wireless/ath/ath9k/link.c              |  2 +-
 drivers/net/wireless/ath/ath9k/main.c              |  2 +-
 drivers/net/wireless/ath/wcn36xx/dxe.c             |  2 +-
 drivers/net/wireless/ath/wil6210/netdev.c          |  6 ++---
 .../wireless/broadcom/brcm80211/brcmfmac/btcoex.c  |  2 +-
 .../broadcom/brcm80211/brcmfmac/cfg80211.c         |  2 +-
 .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    |  2 +-
 .../wireless/broadcom/brcm80211/brcmfmac/sdio.c    |  2 +-
 drivers/net/wireless/intel/ipw2x00/libipw_crypto.c |  2 +-
 drivers/net/wireless/intel/iwlegacy/3945-rs.c      |  2 +-
 drivers/net/wireless/intel/iwlegacy/4965-mac.c     |  2 +-
 drivers/net/wireless/intel/iwlegacy/common.c       |  2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/main.c      |  4 ++--
 drivers/net/wireless/intel/iwlwifi/dvm/tt.c        |  4 ++--
 drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c   |  2 +-
 drivers/net/wireless/intel/iwlwifi/mld/agg.c       |  2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/sta.c       |  2 +-
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c       |  2 +-
 drivers/net/wireless/marvell/libertas/if_usb.c     |  2 +-
 drivers/net/wireless/marvell/libertas/main.c       |  4 ++--
 drivers/net/wireless/marvell/libertas_tf/if_usb.c  |  2 +-
 drivers/net/wireless/marvell/libertas_tf/main.c    |  2 +-
 .../net/wireless/marvell/mwifiex/11n_rxreorder.c   |  2 +-
 drivers/net/wireless/marvell/mwifiex/cmdevt.c      |  2 +-
 drivers/net/wireless/marvell/mwifiex/init.c        |  2 +-
 drivers/net/wireless/marvell/mwifiex/tdls.c        |  2 +-
 drivers/net/wireless/marvell/mwifiex/usb.c         |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/main.c   |  2 +-
 drivers/net/wireless/mediatek/mt76/mt792x_core.c   |  4 ++--
 drivers/net/wireless/microchip/wilc1000/hif.c      |  8 +++----
 drivers/net/wireless/purelifi/plfxlc/usb.c         |  4 ++--
 drivers/net/wireless/realtek/rtlwifi/base.c        |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/dm.c    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/hw.c    |  2 +-
 drivers/net/wireless/realtek/rtw88/tx.c            |  2 +-
 drivers/net/wireless/rsi/rsi_91x_hal.c             |  2 +-
 drivers/net/wireless/rsi/rsi_91x_mac80211.c        |  2 +-
 drivers/net/wireless/st/cw1200/queue.c             |  2 +-
 drivers/net/wireless/st/cw1200/sta.c               |  2 +-
 drivers/net/wireless/ti/wlcore/main.c              |  2 +-
 drivers/net/xen-netback/netback.c                  |  2 +-
 drivers/net/xen-netfront.c                         |  2 +-
 drivers/nfc/nfcmrvl/fw_dnld.c                      |  2 +-
 drivers/nfc/pn533/pn533.c                          |  2 +-
 drivers/nfc/pn533/uart.c                           |  2 +-
 drivers/nfc/st-nci/ndlc.c                          |  4 ++--
 drivers/nfc/st-nci/se.c                            |  4 ++--
 drivers/nfc/st21nfca/se.c                          |  4 ++--
 drivers/nvme/host/multipath.c                      |  2 +-
 drivers/parport/ieee1284.c                         |  2 +-
 drivers/pci/hotplug/cpqphp_ctrl.c                  |  2 +-
 drivers/pci/hotplug/shpchp_hpc.c                   |  2 +-
 drivers/pcmcia/bcm63xx_pcmcia.c                    |  2 +-
 drivers/pcmcia/electra_cf.c                        |  2 +-
 drivers/pcmcia/omap_cf.c                           |  2 +-
 drivers/pcmcia/pd6729.c                            |  2 +-
 drivers/pcmcia/soc_common.c                        |  2 +-
 drivers/pcmcia/yenta_socket.c                      |  2 +-
 drivers/platform/x86/intel_ips.c                   |  2 +-
 drivers/pps/clients/pps-gpio.c                     |  2 +-
 drivers/ptp/ptp_ocp.c                              |  2 +-
 drivers/rtc/dev.c                                  |  2 +-
 drivers/rtc/rtc-test.c                             |  2 +-
 drivers/s390/block/dasd.c                          |  4 ++--
 drivers/s390/char/con3215.c                        |  2 +-
 drivers/s390/char/con3270.c                        |  2 +-
 drivers/s390/char/tape_core.c                      |  2 +-
 drivers/s390/char/tape_std.c                       |  2 +-
 drivers/s390/cio/device_fsm.c                      |  2 +-
 drivers/s390/cio/eadm_sch.c                        |  2 +-
 drivers/s390/crypto/ap_bus.c                       |  2 +-
 drivers/s390/net/fsm.c                             |  2 +-
 drivers/s390/net/qeth_core_main.c                  |  2 +-
 drivers/s390/scsi/zfcp_erp.c                       |  4 ++--
 drivers/s390/scsi/zfcp_fsf.c                       |  2 +-
 drivers/s390/scsi/zfcp_qdio.c                      |  2 +-
 drivers/scsi/aic7xxx/aic79xx_core.c                |  2 +-
 drivers/scsi/aic94xx/aic94xx_scb.c                 |  2 +-
 drivers/scsi/aic94xx/aic94xx_tmf.c                 |  4 ++--
 drivers/scsi/arcmsr/arcmsr_hba.c                   |  4 ++--
 drivers/scsi/arm/fas216.c                          |  2 +-
 drivers/scsi/be2iscsi/be_main.c                    |  4 ++--
 drivers/scsi/bfa/bfad.c                            |  2 +-
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c                  |  2 +-
 drivers/scsi/bnx2fc/bnx2fc_tgt.c                   |  4 ++--
 drivers/scsi/bnx2i/bnx2i_hwi.c                     |  2 +-
 drivers/scsi/csiostor/csio_hw.c                    |  4 ++--
 drivers/scsi/cxgbi/cxgb3i/cxgb3i.c                 |  2 +-
 drivers/scsi/cxgbi/cxgb4i/cxgb4i.c                 |  2 +-
 drivers/scsi/dc395x.c                              |  2 +-
 drivers/scsi/elx/efct/efct_xport.c                 |  2 +-
 drivers/scsi/elx/libefc/efc_els.c                  |  2 +-
 drivers/scsi/elx/libefc/efc_fabric.c               |  2 +-
 drivers/scsi/esas2r/esas2r_main.c                  |  2 +-
 drivers/scsi/fcoe/fcoe_ctlr.c                      |  2 +-
 drivers/scsi/fcoe/fcoe_transport.c                 |  2 +-
 drivers/scsi/fnic/fdls_disc.c                      |  6 ++---
 drivers/scsi/fnic/fip.c                            |  8 +++----
 drivers/scsi/fnic/fnic_main.c                      |  2 +-
 drivers/scsi/hisi_sas/hisi_sas_main.c              |  2 +-
 drivers/scsi/hisi_sas/hisi_sas_v1_hw.c             |  2 +-
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c             |  6 ++---
 drivers/scsi/ibmvscsi/ibmvfc.c                     |  4 ++--
 drivers/scsi/ibmvscsi/ibmvscsi.c                   |  2 +-
 drivers/scsi/ipr.c                                 |  8 +++----
 drivers/scsi/isci/host.c                           |  6 ++---
 drivers/scsi/isci/phy.c                            |  2 +-
 drivers/scsi/isci/port.c                           |  2 +-
 drivers/scsi/isci/port_config.c                    |  4 ++--
 drivers/scsi/libfc/fc_fcp.c                        |  4 ++--
 drivers/scsi/libiscsi.c                            |  4 ++--
 drivers/scsi/libsas/sas_scsi_host.c                |  2 +-
 drivers/scsi/lpfc/lpfc_ct.c                        |  2 +-
 drivers/scsi/lpfc/lpfc_els.c                       |  6 ++---
 drivers/scsi/lpfc/lpfc_hbadisc.c                   |  2 +-
 drivers/scsi/lpfc/lpfc_init.c                      |  8 +++----
 drivers/scsi/lpfc/lpfc_scsi.c                      |  2 +-
 drivers/scsi/lpfc/lpfc_sli.c                       |  6 ++---
 drivers/scsi/megaraid/megaraid_mbox.c              |  2 +-
 drivers/scsi/megaraid/megaraid_mm.c                |  2 +-
 drivers/scsi/megaraid/megaraid_sas_base.c          |  2 +-
 drivers/scsi/mvsas/mv_sas.c                        |  2 +-
 drivers/scsi/ncr53c8xx.c                           |  2 +-
 drivers/scsi/pmcraid.c                             |  6 ++---
 drivers/scsi/qla1280.c                             |  2 +-
 drivers/scsi/qla2xxx/qla_edif.c                    |  2 +-
 drivers/scsi/qla2xxx/qla_init.c                    |  2 +-
 drivers/scsi/qla2xxx/qla_os.c                      |  2 +-
 drivers/scsi/qla4xxx/ql4_os.c                      |  2 +-
 drivers/scsi/smartpqi/smartpqi_init.c              |  2 +-
 drivers/scsi/sym53c8xx_2/sym_glue.c                |  2 +-
 .../staging/gpib/agilent_82357a/agilent_82357a.c   |  2 +-
 drivers/staging/gpib/common/gpib_os.c              |  4 ++--
 drivers/staging/gpib/common/iblib.c                |  2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c          |  2 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c        |  2 +-
 drivers/staging/media/imx/imx-media-csi.c          |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c           |  8 +++----
 drivers/staging/rtl8723bs/core/rtw_mlme.c          |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c      |  8 +++----
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c       |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c          |  4 ++--
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h   |  2 +-
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c      |  4 ++--
 drivers/target/iscsi/iscsi_target_erl0.c           |  2 +-
 drivers/target/iscsi/iscsi_target_erl1.c           |  2 +-
 drivers/target/iscsi/iscsi_target_util.c           |  6 ++---
 drivers/target/target_core_user.c                  |  4 ++--
 drivers/tty/ipwireless/hardware.c                  |  2 +-
 drivers/tty/mips_ejtag_fdc.c                       |  2 +-
 drivers/tty/n_gsm.c                                |  8 +++----
 drivers/tty/serial/8250/8250_aspeed_vuart.c        |  2 +-
 drivers/tty/serial/8250/8250_core.c                |  4 ++--
 drivers/tty/serial/altera_uart.c                   |  2 +-
 drivers/tty/serial/amba-pl011.c                    |  2 +-
 drivers/tty/serial/atmel_serial.c                  |  2 +-
 drivers/tty/serial/fsl_lpuart.c                    |  2 +-
 drivers/tty/serial/imx.c                           |  2 +-
 drivers/tty/serial/liteuart.c                      |  2 +-
 drivers/tty/serial/max3100.c                       |  2 +-
 drivers/tty/serial/sa1100.c                        |  2 +-
 drivers/tty/serial/sccnxp.c                        |  2 +-
 drivers/tty/serial/sh-sci.c                        |  2 +-
 drivers/tty/synclink_gt.c                          |  4 ++--
 drivers/tty/sysrq.c                                |  2 +-
 drivers/tty/vcc.c                                  |  4 ++--
 drivers/usb/atm/cxacru.c                           |  2 +-
 drivers/usb/atm/speedtch.c                         |  4 ++--
 drivers/usb/atm/usbatm.c                           |  2 +-
 drivers/usb/core/hcd.c                             |  2 +-
 drivers/usb/core/hub.c                             |  2 +-
 drivers/usb/dwc2/hcd.c                             |  2 +-
 drivers/usb/dwc2/hcd_queue.c                       |  2 +-
 drivers/usb/gadget/udc/at91_udc.c                  |  2 +-
 drivers/usb/gadget/udc/dummy_hcd.c                 |  2 +-
 drivers/usb/gadget/udc/m66592-udc.c                |  2 +-
 drivers/usb/gadget/udc/omap_udc.c                  |  2 +-
 drivers/usb/gadget/udc/pxa25x_udc.c                |  2 +-
 drivers/usb/gadget/udc/r8a66597-udc.c              |  2 +-
 drivers/usb/host/ehci-platform.c                   |  2 +-
 drivers/usb/host/ohci-hcd.c                        |  2 +-
 drivers/usb/host/oxu210hp-hcd.c                    |  2 +-
 drivers/usb/host/r8a66597-hcd.c                    |  6 ++---
 drivers/usb/host/sl811-hcd.c                       |  2 +-
 drivers/usb/host/uhci-q.c                          |  2 +-
 drivers/usb/host/xen-hcd.c                         |  2 +-
 drivers/usb/host/xhci.c                            |  2 +-
 drivers/usb/isp1760/isp1760-udc.c                  |  2 +-
 drivers/usb/misc/usbtest.c                         |  2 +-
 drivers/usb/musb/da8xx.c                           |  2 +-
 drivers/usb/musb/mpfs.c                            |  2 +-
 drivers/usb/musb/musb_core.c                       |  2 +-
 drivers/usb/musb/musb_dsps.c                       |  2 +-
 drivers/usb/musb/tusb6010.c                        |  2 +-
 drivers/usb/phy/phy-mv-usb.c                       |  2 +-
 drivers/usb/serial/garmin_gps.c                    |  2 +-
 drivers/usb/serial/mos7840.c                       |  4 ++--
 drivers/usb/storage/realtek_cr.c                   |  2 +-
 drivers/usb/usbip/vudc_transfer.c                  |  2 +-
 drivers/video/fbdev/aty/radeon_base.c              |  2 +-
 drivers/virt/vboxguest/vboxguest_core.c            |  2 +-
 drivers/watchdog/at91sam9_wdt.c                    |  2 +-
 drivers/watchdog/bcm47xx_wdt.c                     |  2 +-
 drivers/watchdog/lpc18xx_wdt.c                     |  2 +-
 drivers/watchdog/shwdt.c                           |  2 +-
 fs/dlm/lock.c                                      |  2 +-
 fs/ext4/super.c                                    |  2 +-
 fs/jbd2/journal.c                                  |  2 +-
 fs/nilfs2/segment.c                                |  2 +-
 fs/ocfs2/cluster/tcp.c                             |  2 +-
 include/linux/timer.h                              |  2 +-
 kernel/kthread.c                                   |  2 +-
 kernel/rcu/tasks.h                                 |  2 +-
 kernel/rcu/tree_nocb.h                             |  2 +-
 kernel/sched/psi.c                                 |  2 +-
 kernel/time/sleep_timeout.c                        |  2 +-
 kernel/workqueue.c                                 |  6 ++---
 mm/page-writeback.c                                |  4 ++--
 net/802/garp.c                                     |  2 +-
 net/802/mrp.c                                      |  4 ++--
 net/appletalk/ddp.c                                |  2 +-
 net/atm/lec.c                                      |  4 ++--
 net/ax25/af_ax25.c                                 |  2 +-
 net/ax25/ax25_ds_timer.c                           |  2 +-
 net/ax25/ax25_timer.c                              | 10 ++++----
 net/batman-adv/tp_meter.c                          |  4 ++--
 net/bluetooth/hidp/core.c                          |  2 +-
 net/bluetooth/rfcomm/core.c                        |  4 ++--
 net/bridge/br_multicast.c                          | 28 +++++++++++-----------
 net/bridge/br_multicast_eht.c                      |  4 ++--
 net/bridge/br_stp_timer.c                          | 12 +++++-----
 net/can/proc.c                                     |  2 +-
 net/core/drop_monitor.c                            |  2 +-
 net/core/gen_estimator.c                           |  2 +-
 net/core/neighbour.c                               |  4 ++--
 net/dccp/ccids/ccid2.c                             |  2 +-
 net/dccp/ccids/ccid3.c                             |  2 +-
 net/dccp/timer.c                                   |  8 +++----
 net/hsr/hsr_device.c                               |  4 ++--
 net/hsr/hsr_framereg.c                             |  4 ++--
 net/ieee802154/6lowpan/reassembly.c                |  2 +-
 net/ipv4/igmp.c                                    |  6 ++---
 net/ipv4/inet_connection_sock.c                    |  6 ++---
 net/ipv4/inet_timewait_sock.c                      |  2 +-
 net/ipv4/ip_fragment.c                             |  2 +-
 net/ipv4/ipmr.c                                    |  2 +-
 net/ipv4/tcp_timer.c                               |  6 ++---
 net/ipv6/addrconf.c                                |  2 +-
 net/ipv6/ip6_fib.c                                 |  2 +-
 net/ipv6/ip6mr.c                                   |  2 +-
 net/ipv6/netfilter/nf_conntrack_reasm.c            |  2 +-
 net/ipv6/reassembly.c                              |  2 +-
 net/lapb/lapb_timer.c                              |  4 ++--
 net/llc/llc_c_ac.c                                 |  8 +++----
 net/mac80211/agg-rx.c                              |  4 ++--
 net/mac80211/agg-tx.c                              |  4 ++--
 net/mac80211/ibss.c                                |  2 +-
 net/mac80211/led.c                                 |  2 +-
 net/mac80211/mesh.c                                |  6 ++---
 net/mac80211/mesh_hwmp.c                           |  2 +-
 net/mac80211/mesh_plink.c                          |  2 +-
 net/mac80211/mlme.c                                |  8 +++----
 net/mac80211/ocb.c                                 |  2 +-
 net/mac80211/sta_info.c                            |  2 +-
 net/mptcp/pm.c                                     |  2 +-
 net/mptcp/protocol.c                               |  4 ++--
 net/ncsi/ncsi-manage.c                             |  4 ++--
 net/netfilter/ipset/ip_set_bitmap_gen.h            |  2 +-
 net/netfilter/ipset/ip_set_list_set.c              |  2 +-
 net/netfilter/ipvs/ip_vs_conn.c                    |  2 +-
 net/netfilter/ipvs/ip_vs_ctl.c                     |  2 +-
 net/netfilter/ipvs/ip_vs_lblc.c                    |  2 +-
 net/netfilter/ipvs/ip_vs_lblcr.c                   |  2 +-
 net/netfilter/nf_conntrack_expect.c                |  2 +-
 net/netfilter/nfnetlink_log.c                      |  2 +-
 net/netfilter/xt_IDLETIMER.c                       |  2 +-
 net/netfilter/xt_LED.c                             |  2 +-
 net/netrom/af_netrom.c                             |  2 +-
 net/netrom/nr_timer.c                              | 10 ++++----
 net/nfc/core.c                                     |  2 +-
 net/nfc/hci/core.c                                 |  2 +-
 net/nfc/hci/llc_shdlc.c                            |  6 ++---
 net/nfc/llcp_core.c                                |  4 ++--
 net/nfc/nci/core.c                                 |  4 ++--
 net/packet/af_packet.c                             |  2 +-
 net/rose/af_rose.c                                 |  2 +-
 net/rose/rose_link.c                               |  2 +-
 net/rose/rose_timer.c                              |  6 ++---
 net/rxrpc/call_object.c                            |  2 +-
 net/sched/cls_flow.c                               |  2 +-
 net/sched/sch_fq_pie.c                             |  2 +-
 net/sched/sch_generic.c                            |  2 +-
 net/sched/sch_pie.c                                |  2 +-
 net/sched/sch_red.c                                |  2 +-
 net/sched/sch_sfq.c                                |  2 +-
 net/sctp/protocol.c                                |  2 +-
 net/sctp/sm_sideeffect.c                           | 24 +++++++++----------
 net/sunrpc/svc_xprt.c                              |  2 +-
 net/sunrpc/xprt.c                                  |  2 +-
 net/tipc/discover.c                                |  2 +-
 net/tipc/monitor.c                                 |  2 +-
 net/tipc/node.c                                    |  2 +-
 net/tipc/socket.c                                  |  2 +-
 net/tipc/subscr.c                                  |  2 +-
 net/wireless/core.c                                |  2 +-
 net/x25/af_x25.c                                   |  2 +-
 net/x25/x25_link.c                                 |  2 +-
 net/x25/x25_timer.c                                |  4 ++--
 net/xfrm/xfrm_policy.c                             |  4 ++--
 net/xfrm/xfrm_state.c                              |  2 +-
 sound/core/timer.c                                 |  2 +-
 sound/drivers/aloop.c                              |  2 +-
 sound/drivers/dummy.c                              |  2 +-
 sound/drivers/mpu401/mpu401_uart.c                 |  2 +-
 sound/drivers/mtpav.c                              |  2 +-
 sound/drivers/opl3/opl3_midi.c                     |  2 +-
 sound/drivers/pcmtest.c                            |  2 +-
 sound/drivers/serial-u16550.c                      |  2 +-
 sound/i2c/other/ak4117.c                           |  2 +-
 sound/isa/sb/emu8000_pcm.c                         |  2 +-
 sound/isa/sb/sb8_midi.c                            |  2 +-
 sound/isa/wavefront/wavefront_midi.c               |  2 +-
 sound/pci/asihpi/asihpi.c                          |  2 +-
 sound/pci/ctxfi/cttimer.c                          |  2 +-
 sound/pci/echoaudio/midi.c                         |  2 +-
 sound/pci/korg1212/korg1212.c                      |  2 +-
 sound/pci/rme9652/hdsp.c                           |  2 +-
 sound/pci/rme9652/hdspm.c                          |  2 +-
 sound/sh/aica.c                                    |  2 +-
 sound/soc/codecs/rt5645.c                          |  2 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |  2 +-
 sound/synth/emux/emux_synth.c                      |  2 +-
 sound/usb/midi.c                                   |  2 +-
 tools/sched_ext/scx_qmap.bpf.c                     |  4 ++--
 698 files changed, 925 insertions(+), 925 deletions(-)

diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
index a89ce84371f9..3ea472b698cd 100644
--- a/arch/alpha/kernel/srmcons.c
+++ b/arch/alpha/kernel/srmcons.c
@@ -69,7 +69,7 @@ srmcons_do_receive_chars(struct tty_port *port)
 static void
 srmcons_receive_chars(struct timer_list *t)
 {
-	struct srmcons_private *srmconsp = from_timer(srmconsp, t, timer);
+	struct srmcons_private *srmconsp = timer_container_of(srmconsp, t, timer);
 	struct tty_port *port = &srmconsp->port;
 	unsigned long flags;
 	int incr = 10;
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 6a4805968966..e56f78b4760a 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -628,7 +628,7 @@ static void arm_next_watchdog(struct kvm_vcpu *vcpu)
 
 static void kvmppc_watchdog_func(struct timer_list *t)
 {
-	struct kvm_vcpu *vcpu = from_timer(vcpu, t, arch.wdt_timer);
+	struct kvm_vcpu *vcpu = timer_container_of(vcpu, t, arch.wdt_timer);
 	u32 tsr, new_tsr;
 	int final;
 
diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index a0ae58636e10..4fda05aa83ba 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -359,7 +359,7 @@ static irqreturn_t kw_i2c_irq(int irq, void *dev_id)
 
 static void kw_i2c_timeout(struct timer_list *t)
 {
-	struct pmac_i2c_host_kw *host = from_timer(host, t, timeout_timer);
+	struct pmac_i2c_host_kw *host = timer_container_of(host, t, timeout_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&host->lock, flags);
diff --git a/arch/sh/drivers/heartbeat.c b/arch/sh/drivers/heartbeat.c
index 24391b444b28..42103038a7d0 100644
--- a/arch/sh/drivers/heartbeat.c
+++ b/arch/sh/drivers/heartbeat.c
@@ -58,7 +58,7 @@ static inline void heartbeat_toggle_bit(struct heartbeat_data *hd,
 
 static void heartbeat_timer(struct timer_list *t)
 {
-	struct heartbeat_data *hd = from_timer(hd, t, timer);
+	struct heartbeat_data *hd = timer_container_of(hd, t, timer);
 	static unsigned bit = 0, up = 1;
 
 	heartbeat_toggle_bit(hd, bit, hd->flags & HEARTBEAT_INVERTED);
diff --git a/arch/sh/drivers/pci/common.c b/arch/sh/drivers/pci/common.c
index 5442475d132e..9633b6147a05 100644
--- a/arch/sh/drivers/pci/common.c
+++ b/arch/sh/drivers/pci/common.c
@@ -88,7 +88,7 @@ int __init pci_is_66mhz_capable(struct pci_channel *hose,
 
 static void pcibios_enable_err(struct timer_list *t)
 {
-	struct pci_channel *hose = from_timer(hose, t, err_timer);
+	struct pci_channel *hose = timer_container_of(hose, t, err_timer);
 
 	timer_delete(&hose->err_timer);
 	printk(KERN_DEBUG "PCI: re-enabling error IRQ.\n");
@@ -97,7 +97,7 @@ static void pcibios_enable_err(struct timer_list *t)
 
 static void pcibios_enable_serr(struct timer_list *t)
 {
-	struct pci_channel *hose = from_timer(hose, t, serr_timer);
+	struct pci_channel *hose = timer_container_of(hose, t, serr_timer);
 
 	timer_delete(&hose->serr_timer);
 	printk(KERN_DEBUG "PCI: re-enabling system error IRQ.\n");
diff --git a/arch/sh/drivers/push-switch.c b/arch/sh/drivers/push-switch.c
index 2b51ad9d5586..443cc6fd26a8 100644
--- a/arch/sh/drivers/push-switch.c
+++ b/arch/sh/drivers/push-switch.c
@@ -25,7 +25,7 @@ static DEVICE_ATTR_RO(switch);
 
 static void switch_timer(struct timer_list *t)
 {
-	struct push_switch *psw = from_timer(psw, t, debounce);
+	struct push_switch *psw = timer_container_of(psw, t, debounce);
 
 	schedule_work(&psw->work);
 }
diff --git a/arch/sparc/kernel/viohs.c b/arch/sparc/kernel/viohs.c
index e27afd233bf5..8fb2e7ca5015 100644
--- a/arch/sparc/kernel/viohs.c
+++ b/arch/sparc/kernel/viohs.c
@@ -804,7 +804,7 @@ EXPORT_SYMBOL(vio_port_up);
 
 static void vio_port_timer(struct timer_list *t)
 {
-	struct vio_driver_state *vio = from_timer(vio, t, timer);
+	struct vio_driver_state *vio = timer_container_of(vio, t, timer);
 
 	vio_port_up(vio);
 }
diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index b97bb52dd562..570a14f9f995 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -1533,7 +1533,7 @@ static const struct net_device_ops vector_netdev_ops = {
 
 static void vector_timer_expire(struct timer_list *t)
 {
-	struct vector_private *vp = from_timer(vp, t, tl);
+	struct vector_private *vp = timer_container_of(vp, t, tl);
 
 	vp->estats.tx_kicks++;
 	napi_schedule(&vp->napi);
diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 38b33cdd4232..a1c9559944a3 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -1571,7 +1571,7 @@ static bool kvm_xen_schedop_poll(struct kvm_vcpu *vcpu, bool longmode,
 
 static void cancel_evtchn_poll(struct timer_list *t)
 {
-	struct kvm_vcpu *vcpu = from_timer(vcpu, t, arch.xen.poll_timer);
+	struct kvm_vcpu *vcpu = timer_container_of(vcpu, t, arch.xen.poll_timer);
 
 	kvm_make_request(KVM_REQ_UNBLOCK, vcpu);
 	kvm_vcpu_kick(vcpu);
diff --git a/arch/xtensa/platforms/iss/network.c b/arch/xtensa/platforms/iss/network.c
index c6d8c62695e1..f0a63b2f85cc 100644
--- a/arch/xtensa/platforms/iss/network.c
+++ b/arch/xtensa/platforms/iss/network.c
@@ -338,7 +338,7 @@ static int iss_net_poll(struct iss_net_private *lp)
 
 static void iss_net_timer(struct timer_list *t)
 {
-	struct iss_net_private *lp = from_timer(lp, t, timer);
+	struct iss_net_private *lp = timer_container_of(lp, t, timer);
 
 	iss_net_poll(lp);
 	mod_timer(&lp->timer, jiffies + lp->timer_val);
diff --git a/block/blk-core.c b/block/blk-core.c
index e8cc270a453f..bec4cbce504d 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -381,7 +381,7 @@ static void blk_queue_usage_counter_release(struct percpu_ref *ref)
 
 static void blk_rq_timed_out_timer(struct timer_list *t)
 {
-	struct request_queue *q = from_timer(q, t, timeout);
+	struct request_queue *q = timer_container_of(q, t, timeout);
 
 	kblockd_schedule_work(&q->timeout_work);
 }
diff --git a/block/blk-iolatency.c b/block/blk-iolatency.c
index 42c1e0b9a68f..61d183028a5c 100644
--- a/block/blk-iolatency.c
+++ b/block/blk-iolatency.c
@@ -658,7 +658,7 @@ static const struct rq_qos_ops blkcg_iolatency_ops = {
 
 static void blkiolatency_timer_fn(struct timer_list *t)
 {
-	struct blk_iolatency *blkiolat = from_timer(blkiolat, t, timer);
+	struct blk_iolatency *blkiolat = timer_container_of(blkiolat, t, timer);
 	struct blkcg_gq *blkg;
 	struct cgroup_subsys_state *pos_css;
 	u64 now = blk_time_get_ns();
diff --git a/block/blk-stat.c b/block/blk-stat.c
index 46449da856f8..682a8ddb1173 100644
--- a/block/blk-stat.c
+++ b/block/blk-stat.c
@@ -76,7 +76,7 @@ void blk_stat_add(struct request *rq, u64 now)
 
 static void blk_stat_timer_fn(struct timer_list *t)
 {
-	struct blk_stat_callback *cb = from_timer(cb, t, timer);
+	struct blk_stat_callback *cb = timer_container_of(cb, t, timer);
 	unsigned int bucket;
 	int cpu;
 
diff --git a/block/blk-throttle.c b/block/blk-throttle.c
index d6dd2e047874..13c5943b535e 100644
--- a/block/blk-throttle.c
+++ b/block/blk-throttle.c
@@ -1013,7 +1013,7 @@ static int throtl_select_dispatch(struct throtl_service_queue *parent_sq)
  */
 static void throtl_pending_timer_fn(struct timer_list *t)
 {
-	struct throtl_service_queue *sq = from_timer(sq, t, pending_timer);
+	struct throtl_service_queue *sq = timer_container_of(sq, t, pending_timer);
 	struct throtl_grp *tg = sq_to_tg(sq);
 	struct throtl_data *td = sq_to_td(sq);
 	struct throtl_service_queue *parent_sq;
diff --git a/block/kyber-iosched.c b/block/kyber-iosched.c
index 0f0f8452609a..4dba8405bd01 100644
--- a/block/kyber-iosched.c
+++ b/block/kyber-iosched.c
@@ -276,7 +276,7 @@ static void kyber_resize_domain(struct kyber_queue_data *kqd,
 
 static void kyber_timer_fn(struct timer_list *t)
 {
-	struct kyber_queue_data *kqd = from_timer(kqd, t, timer);
+	struct kyber_queue_data *kqd = timer_container_of(kqd, t, timer);
 	unsigned int sched_domain;
 	int cpu;
 	bool bad = false;
diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_timesync.c
index 972833fabcfc..3fac540f8e03 100644
--- a/drivers/accel/qaic/qaic_timesync.c
+++ b/drivers/accel/qaic/qaic_timesync.c
@@ -129,7 +129,7 @@ static void qaic_timesync_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_resu
 
 static void qaic_timesync_timer(struct timer_list *t)
 {
-	struct mqts_dev *mqtsdev = from_timer(mqtsdev, t, timer);
+	struct mqts_dev *mqtsdev = timer_container_of(mqtsdev, t, timer);
 	struct qts_host_time_sync_msg_data *sync_msg;
 	u64 device_qtimer_us;
 	u64 device_qtimer;
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 289e365f84b2..f5e6400bfbfb 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -1138,7 +1138,7 @@ static void ghes_add_timer(struct ghes *ghes)
 
 static void ghes_poll_func(struct timer_list *t)
 {
-	struct ghes *ghes = from_timer(ghes, t, timer);
+	struct ghes *ghes = timer_container_of(ghes, t, timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&ghes_notify_lock_irq, flags);
diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index 22afa4ff860d..4e9c82f36df1 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -1034,7 +1034,7 @@ static void ahci_sw_activity(struct ata_link *link)
 
 static void ahci_sw_activity_blink(struct timer_list *t)
 {
-	struct ahci_em_priv *emp = from_timer(emp, t, timer);
+	struct ahci_em_priv *emp = timer_container_of(emp, t, timer);
 	struct ata_link *link = emp->link;
 	struct ata_port *ap = link->ap;
 
diff --git a/drivers/ata/libata-eh.c b/drivers/ata/libata-eh.c
index b990c1ee0b12..883d33db7972 100644
--- a/drivers/ata/libata-eh.c
+++ b/drivers/ata/libata-eh.c
@@ -860,7 +860,7 @@ static unsigned int ata_eh_nr_in_flight(struct ata_port *ap)
 
 void ata_eh_fastdrain_timerfn(struct timer_list *t)
 {
-	struct ata_port *ap = from_timer(ap, t, fastdrain_timer);
+	struct ata_port *ap = timer_container_of(ap, t, fastdrain_timer);
 	unsigned long flags;
 	unsigned int cnt;
 
diff --git a/drivers/atm/idt77252.c b/drivers/atm/idt77252.c
index a876024d8a05..1206ab764ba9 100644
--- a/drivers/atm/idt77252.c
+++ b/drivers/atm/idt77252.c
@@ -1531,7 +1531,7 @@ idt77252_tx(struct idt77252_dev *card)
 static void
 tst_timer(struct timer_list *t)
 {
-	struct idt77252_dev *card = from_timer(card, t, tst_timer);
+	struct idt77252_dev *card = timer_container_of(card, t, tst_timer);
 	unsigned long base, idle, jump;
 	unsigned long flags;
 	u32 pc;
@@ -2070,7 +2070,7 @@ idt77252_rate_logindex(struct idt77252_dev *card, int pcr)
 static void
 idt77252_est_timer(struct timer_list *t)
 {
-	struct rate_estimator *est = from_timer(est, t, timer);
+	struct rate_estimator *est = timer_container_of(est, t, timer);
 	struct vc_map *vc = est->vc;
 	struct idt77252_dev *card = vc->card;
 	unsigned long flags;
diff --git a/drivers/atm/lanai.c b/drivers/atm/lanai.c
index 00fe25b5b6a3..2a1fe3080712 100644
--- a/drivers/atm/lanai.c
+++ b/drivers/atm/lanai.c
@@ -1758,7 +1758,7 @@ static void iter_dequeue(struct lanai_dev *lanai, vci_t vci)
 
 static void lanai_timed_poll(struct timer_list *t)
 {
-	struct lanai_dev *lanai = from_timer(lanai, t, timer);
+	struct lanai_dev *lanai = timer_container_of(lanai, t, timer);
 #ifndef DEBUG_RW
 	unsigned long flags;
 #ifdef USE_POWERDOWN
diff --git a/drivers/auxdisplay/line-display.c b/drivers/auxdisplay/line-display.c
index b6808c4f89b6..8590a4cd21e0 100644
--- a/drivers/auxdisplay/line-display.c
+++ b/drivers/auxdisplay/line-display.c
@@ -40,7 +40,7 @@
  */
 static void linedisp_scroll(struct timer_list *t)
 {
-	struct linedisp *linedisp = from_timer(linedisp, t, timer);
+	struct linedisp *linedisp = timer_container_of(linedisp, t, timer);
 	unsigned int i, ch = linedisp->scroll_pos;
 	unsigned int num_chars = linedisp->num_chars;
 
diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index c8b0a9e29ed8..318d4a4efbea 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -512,7 +512,7 @@ struct dpm_watchdog {
  */
 static void dpm_watchdog_handler(struct timer_list *t)
 {
-	struct dpm_watchdog *wd = from_timer(wd, t, timer);
+	struct dpm_watchdog *wd = timer_container_of(wd, t, timer);
 	struct timer_list *timer = &wd->timer;
 	unsigned int time_left;
 
diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
index 63bf914a4d44..e6306e1996eb 100644
--- a/drivers/base/power/wakeup.c
+++ b/drivers/base/power/wakeup.c
@@ -763,7 +763,7 @@ EXPORT_SYMBOL_GPL(pm_relax);
  */
 static void pm_wakeup_timer_fn(struct timer_list *t)
 {
-	struct wakeup_source *ws = from_timer(ws, t, timer);
+	struct wakeup_source *ws = timer_container_of(ws, t, timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&ws->lock, flags);
diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
index 92b06d1de4cc..50cc90f6ab35 100644
--- a/drivers/block/aoe/aoecmd.c
+++ b/drivers/block/aoe/aoecmd.c
@@ -745,7 +745,7 @@ rexmit_timer(struct timer_list *timer)
 	int utgts;	/* number of aoetgt descriptors (not slots) */
 	int since;
 
-	d = from_timer(d, timer, timer);
+	d = timer_container_of(d, timer, timer);
 
 	spin_lock_irqsave(&d->lock, flags);
 
diff --git a/drivers/block/aoe/aoedev.c b/drivers/block/aoe/aoedev.c
index 141b2a0e03f2..bba05f0c5bbd 100644
--- a/drivers/block/aoe/aoedev.c
+++ b/drivers/block/aoe/aoedev.c
@@ -149,7 +149,7 @@ dummy_timer(struct timer_list *t)
 {
 	struct aoedev *d;
 
-	d = from_timer(d, t, timer);
+	d = timer_container_of(d, t, timer);
 	if (d->flags & DEVFL_TKILL)
 		return;
 	d->timer.expires = jiffies + HZ;
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index ced2cc5f46f2..64f301f1cc63 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -3591,7 +3591,7 @@ int drbd_md_test_flag(struct drbd_backing_dev *bdev, int flag)
 
 static void md_sync_timer_fn(struct timer_list *t)
 {
-	struct drbd_device *device = from_timer(device, t, md_sync_timer);
+	struct drbd_device *device = timer_container_of(device, t, md_sync_timer);
 	drbd_device_post_work(device, MD_SYNC);
 }
 
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 380e6584a4ee..915cbb2e4cca 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -1699,7 +1699,7 @@ static bool net_timeout_reached(struct drbd_request *net_req,
 
 void request_timer_fn(struct timer_list *t)
 {
-	struct drbd_device *device = from_timer(device, t, request_timer);
+	struct drbd_device *device = timer_container_of(device, t, request_timer);
 	struct drbd_connection *connection = first_peer_device(device)->connection;
 	struct drbd_request *req_read, *req_write, *req_peer; /* oldest request */
 	struct net_conf *nc;
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 4352a50fbb3f..50ee616c6c5d 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -442,7 +442,7 @@ int w_resync_timer(struct drbd_work *w, int cancel)
 
 void resync_timer_fn(struct timer_list *t)
 {
-	struct drbd_device *device = from_timer(device, t, resync_timer);
+	struct drbd_device *device = timer_container_of(device, t, resync_timer);
 
 	drbd_queue_work_if_unqueued(
 		&first_peer_device(device)->connection->sender_work,
@@ -1698,7 +1698,7 @@ void drbd_rs_controller_reset(struct drbd_peer_device *peer_device)
 
 void start_resync_timer_fn(struct timer_list *t)
 {
-	struct drbd_device *device = from_timer(device, t, start_resync_timer);
+	struct drbd_device *device = timer_container_of(device, t, start_resync_timer);
 	drbd_device_post_work(device, RS_START);
 }
 
diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
index ee6cade70222..01f7aef3fcfb 100644
--- a/drivers/block/swim3.c
+++ b/drivers/block/swim3.c
@@ -555,7 +555,7 @@ static void act(struct floppy_state *fs)
 
 static void scan_timeout(struct timer_list *t)
 {
-	struct floppy_state *fs = from_timer(fs, t, timeout);
+	struct floppy_state *fs = timer_container_of(fs, t, timeout);
 	struct swim3 __iomem *sw = fs->swim3;
 	unsigned long flags;
 
@@ -579,7 +579,7 @@ static void scan_timeout(struct timer_list *t)
 
 static void seek_timeout(struct timer_list *t)
 {
-	struct floppy_state *fs = from_timer(fs, t, timeout);
+	struct floppy_state *fs = timer_container_of(fs, t, timeout);
 	struct swim3 __iomem *sw = fs->swim3;
 	unsigned long flags;
 
@@ -598,7 +598,7 @@ static void seek_timeout(struct timer_list *t)
 
 static void settle_timeout(struct timer_list *t)
 {
-	struct floppy_state *fs = from_timer(fs, t, timeout);
+	struct floppy_state *fs = timer_container_of(fs, t, timeout);
 	struct swim3 __iomem *sw = fs->swim3;
 	unsigned long flags;
 
@@ -627,7 +627,7 @@ static void settle_timeout(struct timer_list *t)
 
 static void xfer_timeout(struct timer_list *t)
 {
-	struct floppy_state *fs = from_timer(fs, t, timeout);
+	struct floppy_state *fs = timer_container_of(fs, t, timeout);
 	struct swim3 __iomem *sw = fs->swim3;
 	struct dbdma_regs __iomem *dr = fs->dma;
 	unsigned long flags;
diff --git a/drivers/bluetooth/bluecard_cs.c b/drivers/bluetooth/bluecard_cs.c
index 1c7f89e134b3..1e3a56e9b139 100644
--- a/drivers/bluetooth/bluecard_cs.c
+++ b/drivers/bluetooth/bluecard_cs.c
@@ -158,7 +158,7 @@ static void bluecard_detach(struct pcmcia_device *p_dev);
 
 static void bluecard_activity_led_timeout(struct timer_list *t)
 {
-	struct bluecard_info *info = from_timer(info, t, timer);
+	struct bluecard_info *info = timer_container_of(info, t, timer);
 	unsigned int iobase = info->p_dev->resource[0]->start;
 
 	if (test_bit(CARD_ACTIVITY, &(info->hw_state))) {
diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index 5091dea762a0..e35ac3e83828 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -464,7 +464,7 @@ static void ps_work_func(struct work_struct *work)
 
 static void ps_timeout_func(struct timer_list *t)
 {
-	struct ps_data *data = from_timer(data, t, ps_timer);
+	struct ps_data *data = timer_container_of(data, t, ps_timer);
 	struct hci_dev *hdev = data->hdev;
 	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
 
diff --git a/drivers/bluetooth/hci_bcsp.c b/drivers/bluetooth/hci_bcsp.c
index 610d0e3c36d4..664d82d1e613 100644
--- a/drivers/bluetooth/hci_bcsp.c
+++ b/drivers/bluetooth/hci_bcsp.c
@@ -688,7 +688,7 @@ static int bcsp_recv(struct hci_uart *hu, const void *data, int count)
 	/* Arrange to retransmit all messages in the relq. */
 static void bcsp_timed_event(struct timer_list *t)
 {
-	struct bcsp_struct *bcsp = from_timer(bcsp, t, tbcsp);
+	struct bcsp_struct *bcsp = timer_container_of(bcsp, t, tbcsp);
 	struct hci_uart *hu = bcsp->hu;
 	struct sk_buff *skb;
 	unsigned long flags;
diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index edafa228bf83..d0d4420c1a0f 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -149,7 +149,7 @@ static void h5_timed_event(struct timer_list *t)
 {
 	const unsigned char sync_req[] = { 0x01, 0x7e };
 	unsigned char conf_req[3] = { 0x03, 0xfc };
-	struct h5 *h5 = from_timer(h5, t, timer);
+	struct h5 *h5 = timer_container_of(h5, t, timer);
 	struct hci_uart *hu = h5->hu;
 	struct sk_buff *skb;
 	unsigned long flags;
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e00590ba24fd..0a4c84536640 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -474,7 +474,7 @@ static void qca_wq_serial_tx_clock_vote_off(struct work_struct *work)
 
 static void hci_ibs_tx_idle_timeout(struct timer_list *t)
 {
-	struct qca_data *qca = from_timer(qca, t, tx_idle_timer);
+	struct qca_data *qca = timer_container_of(qca, t, tx_idle_timer);
 	struct hci_uart *hu = qca->hu;
 	unsigned long flags;
 
@@ -507,7 +507,7 @@ static void hci_ibs_tx_idle_timeout(struct timer_list *t)
 
 static void hci_ibs_wake_retrans_timeout(struct timer_list *t)
 {
-	struct qca_data *qca = from_timer(qca, t, wake_retrans_timer);
+	struct qca_data *qca = timer_container_of(qca, t, wake_retrans_timer);
 	struct hci_uart *hu = qca->hu;
 	unsigned long flags, retrans_delay;
 	bool retransmit = false;
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 03aa88795209..663c9aa83c21 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1136,7 +1136,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 
 static void health_check(struct timer_list *t)
 {
-	struct mhi_pci_device *mhi_pdev = from_timer(mhi_pdev, t, health_check_timer);
+	struct mhi_pci_device *mhi_pdev = timer_container_of(mhi_pdev, t, health_check_timer);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
 	if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
diff --git a/drivers/char/hw_random/xgene-rng.c b/drivers/char/hw_random/xgene-rng.c
index a1a751074f7e..709a36507145 100644
--- a/drivers/char/hw_random/xgene-rng.c
+++ b/drivers/char/hw_random/xgene-rng.c
@@ -88,7 +88,7 @@ struct xgene_rng_dev {
 
 static void xgene_rng_expired_timer(struct timer_list *t)
 {
-	struct xgene_rng_dev *ctx = from_timer(ctx, t, failure_timer);
+	struct xgene_rng_dev *ctx = timer_container_of(ctx, t, failure_timer);
 
 	/* Clear failure counter as timer expired */
 	disable_irq(ctx->irq);
diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index 77146b5c762b..a179d4797011 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -347,7 +347,7 @@ static const struct file_operations bt_bmc_fops = {
 
 static void poll_timer(struct timer_list *t)
 {
-	struct bt_bmc *bt_bmc = from_timer(bt_bmc, t, poll_timer);
+	struct bt_bmc *bt_bmc = timer_container_of(bt_bmc, t, poll_timer);
 
 	bt_bmc->poll_timer.expires += msecs_to_jiffies(500);
 	wake_up(&bt_bmc->queue);
diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 12b0b77eb1cc..548effc12b2b 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -1072,7 +1072,7 @@ static void set_need_watch(void *send_info, unsigned int watch_mask)
 
 static void smi_timeout(struct timer_list *t)
 {
-	struct smi_info   *smi_info = from_timer(smi_info, t, si_timer);
+	struct smi_info   *smi_info = timer_container_of(smi_info, t, si_timer);
 	enum si_sm_result smi_result;
 	unsigned long     flags;
 	unsigned long     jiffies_now;
diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
index 0b45b07dec22..fa726e620e55 100644
--- a/drivers/char/ipmi/ipmi_ssif.c
+++ b/drivers/char/ipmi/ipmi_ssif.c
@@ -541,7 +541,7 @@ static void start_resend(struct ssif_info *ssif_info);
 
 static void retry_timeout(struct timer_list *t)
 {
-	struct ssif_info *ssif_info = from_timer(ssif_info, t, retry_timer);
+	struct ssif_info *ssif_info = timer_container_of(ssif_info, t, retry_timer);
 	unsigned long oflags, *flags;
 	bool waiting, resend;
 
@@ -565,7 +565,7 @@ static void retry_timeout(struct timer_list *t)
 
 static void watch_timeout(struct timer_list *t)
 {
-	struct ssif_info *ssif_info = from_timer(ssif_info, t, watch_timer);
+	struct ssif_info *ssif_info = timer_container_of(ssif_info, t, watch_timer);
 	unsigned long oflags, *flags;
 
 	if (ssif_info->stopping)
diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
index e4bd74585d4d..b7654efcf2c3 100644
--- a/drivers/char/ipmi/ssif_bmc.c
+++ b/drivers/char/ipmi/ssif_bmc.c
@@ -297,7 +297,7 @@ static void complete_response(struct ssif_bmc_ctx *ssif_bmc)
 
 static void response_timeout(struct timer_list *t)
 {
-	struct ssif_bmc_ctx *ssif_bmc = from_timer(ssif_bmc, t, response_timer);
+	struct ssif_bmc_ctx *ssif_bmc = timer_container_of(ssif_bmc, t, response_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&ssif_bmc->lock, flags);
diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-dev-common.c
index 11deaf538e87..f2a5e09257dd 100644
--- a/drivers/char/tpm/tpm-dev-common.c
+++ b/drivers/char/tpm/tpm-dev-common.c
@@ -91,7 +91,7 @@ static void tpm_dev_async_work(struct work_struct *work)
 
 static void user_reader_timeout(struct timer_list *t)
 {
-	struct file_priv *priv = from_timer(priv, t, user_read_timer);
+	struct file_priv *priv = timer_container_of(priv, t, user_read_timer);
 
 	pr_warn("TPM user space timeout is deprecated (pid=%d)\n",
 		task_tgid_nr(current));
diff --git a/drivers/comedi/drivers/comedi_test.c b/drivers/comedi/drivers/comedi_test.c
index da17d891f0e5..71124b694bf3 100644
--- a/drivers/comedi/drivers/comedi_test.c
+++ b/drivers/comedi/drivers/comedi_test.c
@@ -197,7 +197,7 @@ static unsigned short fake_waveform(struct comedi_device *dev,
  */
 static void waveform_ai_timer(struct timer_list *t)
 {
-	struct waveform_private *devpriv = from_timer(devpriv, t, ai_timer);
+	struct waveform_private *devpriv = timer_container_of(devpriv, t, ai_timer);
 	struct comedi_device *dev = devpriv->dev;
 	struct comedi_subdevice *s = dev->read_subdev;
 	struct comedi_async *async = s->async;
@@ -444,7 +444,7 @@ static int waveform_ai_insn_read(struct comedi_device *dev,
  */
 static void waveform_ao_timer(struct timer_list *t)
 {
-	struct waveform_private *devpriv = from_timer(devpriv, t, ao_timer);
+	struct waveform_private *devpriv = timer_container_of(devpriv, t, ao_timer);
 	struct comedi_device *dev = devpriv->dev;
 	struct comedi_subdevice *s = dev->write_subdev;
 	struct comedi_async *async = s->async;
diff --git a/drivers/comedi/drivers/das16.c b/drivers/comedi/drivers/das16.c
index f5ca6c0d4d0c..a2588b35e156 100644
--- a/drivers/comedi/drivers/das16.c
+++ b/drivers/comedi/drivers/das16.c
@@ -517,7 +517,7 @@ static void das16_interrupt(struct comedi_device *dev)
 
 static void das16_timer_interrupt(struct timer_list *t)
 {
-	struct das16_private_struct *devpriv = from_timer(devpriv, t, timer);
+	struct das16_private_struct *devpriv = timer_container_of(devpriv, t, timer);
 	struct comedi_device *dev = devpriv->dev;
 	unsigned long flags;
 
diff --git a/drivers/comedi/drivers/jr3_pci.c b/drivers/comedi/drivers/jr3_pci.c
index cdc842b32bab..18a23d6625f6 100644
--- a/drivers/comedi/drivers/jr3_pci.c
+++ b/drivers/comedi/drivers/jr3_pci.c
@@ -562,7 +562,7 @@ jr3_pci_poll_subdevice(struct comedi_subdevice *s)
 
 static void jr3_pci_poll_dev(struct timer_list *t)
 {
-	struct jr3_pci_dev_private *devpriv = from_timer(devpriv, t, timer);
+	struct jr3_pci_dev_private *devpriv = timer_container_of(devpriv, t, timer);
 	struct comedi_device *dev = devpriv->dev;
 	struct jr3_pci_subdev_private *spriv;
 	struct comedi_subdevice *s;
diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index afe5abf89d33..1de7226db377 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -667,7 +667,7 @@ static inline void  queue_gpstate_timer(struct global_pstate_info *gpstates)
  */
 static void gpstate_timer_handler(struct timer_list *t)
 {
-	struct global_pstate_info *gpstates = from_timer(gpstates, t, timer);
+	struct global_pstate_info *gpstates = timer_container_of(gpstates, t, timer);
 	struct cpufreq_policy *policy = gpstates->policy;
 	int gpstate_idx, lpstate_idx;
 	unsigned long val;
diff --git a/drivers/crypto/axis/artpec6_crypto.c b/drivers/crypto/axis/artpec6_crypto.c
index f8d50bd227a6..75ee065da1ec 100644
--- a/drivers/crypto/axis/artpec6_crypto.c
+++ b/drivers/crypto/axis/artpec6_crypto.c
@@ -2072,7 +2072,7 @@ static void artpec6_crypto_process_queue(struct artpec6_crypto *ac,
 
 static void artpec6_crypto_timeout(struct timer_list *t)
 {
-	struct artpec6_crypto *ac = from_timer(ac, t, timer);
+	struct artpec6_crypto *ac = timer_container_of(ac, t, timer);
 
 	dev_info_ratelimited(artpec6_crypto_dev, "timeout\n");
 
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 9f80a45498f0..50b3d28eff47 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -375,7 +375,7 @@ struct wait_timer {
 
 static void wait_timer(struct timer_list *timer)
 {
-	struct wait_timer *wt = from_timer(wt, timer, timer);
+	struct wait_timer *wt = timer_container_of(wt, timer, timer);
 
 	dma_fence_signal(wt->f);
 }
diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index b96cc0a83872..d4a7e8eaf901 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -337,7 +337,7 @@ static void imxdma_disable_hw(struct imxdma_channel *imxdmac)
 
 static void imxdma_watchdog(struct timer_list *t)
 {
-	struct imxdma_channel *imxdmac = from_timer(imxdmac, t, watchdog);
+	struct imxdma_channel *imxdmac = timer_container_of(imxdmac, t, watchdog);
 	struct imxdma_engine *imxdma = imxdmac->imxdma;
 	int channel = imxdmac->channel;
 
diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
index 06a813cc7641..d29f1b55ba8b 100644
--- a/drivers/dma/ioat/dma.c
+++ b/drivers/dma/ioat/dma.c
@@ -901,7 +901,7 @@ static void ioat_reboot_chan(struct ioatdma_chan *ioat_chan)
 
 void ioat_timer_event(struct timer_list *t)
 {
-	struct ioatdma_chan *ioat_chan = from_timer(ioat_chan, t, timer);
+	struct ioatdma_chan *ioat_chan = timer_container_of(ioat_chan, t, timer);
 	dma_addr_t phys_complete;
 	u64 status;
 
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index b0f9ef6ac6df..ea2ad71c1a5d 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -114,7 +114,7 @@ EXPORT_SYMBOL(fw_cancel_transaction);
 
 static void split_transaction_timeout_callback(struct timer_list *timer)
 {
-	struct fw_transaction *t = from_timer(t, timer, split_timeout_timer);
+	struct fw_transaction *t = timer_container_of(t, timer, split_timeout_timer);
 	struct fw_card *card = t->card;
 
 	scoped_guard(spinlock_irqsave, &card->lock) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 5f5c00ace96b..44f5319166bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -322,7 +322,7 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
  */
 static void amdgpu_fence_fallback(struct timer_list *t)
 {
-	struct amdgpu_ring *ring = from_timer(ring, t,
+	struct amdgpu_ring *ring = timer_container_of(ring, t,
 					      fence_drv.fallback_timer);
 
 	if (amdgpu_fence_process(ring))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
index 03ed14663107..f847d18f3b4a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
@@ -135,7 +135,7 @@ static void amdgpu_ring_mux_schedule_resubmit(struct amdgpu_ring_mux *mux)
 
 static void amdgpu_mux_resubmit_fallback(struct timer_list *t)
 {
-	struct amdgpu_ring_mux *mux = from_timer(mux, t, resubmit_timer);
+	struct amdgpu_ring_mux *mux = timer_container_of(mux, t, resubmit_timer);
 
 	if (!spin_trylock(&mux->lock)) {
 		amdgpu_ring_mux_schedule_resubmit(mux);
diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
index 20658258fb51..28a4e843e425 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -751,7 +751,7 @@ tda998x_reset(struct tda998x_priv *priv)
  */
 static void tda998x_edid_delay_done(struct timer_list *t)
 {
-	struct tda998x_priv *priv = from_timer(priv, t, edid_delay_timer);
+	struct tda998x_priv *priv = timer_container_of(priv, t, edid_delay_timer);
 
 	priv->edid_delay_active = false;
 	wake_up(&priv->edid_delay_waitq);
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 78958ddf8485..dac121faa2e0 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -487,7 +487,7 @@ void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
 
 static void vblank_disable_fn(struct timer_list *t)
 {
-	struct drm_vblank_crtc *vblank = from_timer(vblank, t, disable_timer);
+	struct drm_vblank_crtc *vblank = timer_container_of(vblank, t, disable_timer);
 	struct drm_device *dev = vblank->dev;
 	unsigned int pipe = vblank->pipe;
 	unsigned long irqflags;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 08cf79a62025..a6c88eea4ef6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -159,7 +159,7 @@ static const struct exynos_drm_crtc_ops vidi_crtc_ops = {
 
 static void vidi_fake_vblank_timer(struct timer_list *t)
 {
-	struct vidi_context *ctx = from_timer(ctx, t, timer);
+	struct vidi_context *ctx = timer_container_of(ctx, t, timer);
 
 	if (drm_crtc_handle_vblank(&ctx->crtc->base))
 		mod_timer(&ctx->timer,
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 77cfcf37ddd2..6982cb13de12 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -234,7 +234,7 @@ struct gud_usb_bulk_context {
 
 static void gud_usb_bulk_timeout(struct timer_list *t)
 {
-	struct gud_usb_bulk_context *ctx = from_timer(ctx, t, timer);
+	struct gud_usb_bulk_context *ctx = timer_container_of(ctx, t, timer);
 
 	usb_sg_cancel(&ctx->sgr);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 64e9317f58fb..f8226a11dd7c 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -74,7 +74,7 @@ static void set(struct intel_uncore *uncore, i915_reg_t reg, u32 val)
 
 static void rps_timer(struct timer_list *t)
 {
-	struct intel_rps *rps = from_timer(rps, t, timer);
+	struct intel_rps *rps = timer_container_of(rps, t, timer);
 	struct intel_gt *gt = rps_to_gt(rps);
 	struct intel_engine_cs *engine;
 	ktime_t dt, last, timestamp;
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index 64315b714743..79741f043f03 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -108,7 +108,7 @@ static void advance(struct i915_request *request)
 
 static void hw_delay_complete(struct timer_list *t)
 {
-	struct mock_engine *engine = from_timer(engine, t, hw_delay);
+	struct mock_engine *engine = timer_container_of(engine, t, hw_delay);
 	struct i915_request *request;
 	unsigned long flags;
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index 401bee030dbc..0f6589260e33 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -537,7 +537,7 @@ struct spinner_timer {
 
 static void spinner_kill(struct timer_list *timer)
 {
-	struct spinner_timer *st = from_timer(st, timer, timer);
+	struct spinner_timer *st = timer_container_of(st, timer, timer);
 
 	igt_spinner_end(&st->spin);
 	pr_info("%s\n", __func__);
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 1d4cc91c0e40..dadc7641e574 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -427,7 +427,7 @@ static void dma_i915_sw_fence_wake(struct dma_fence *dma,
 
 static void timer_i915_sw_fence_wake(struct timer_list *t)
 {
-	struct i915_sw_dma_fence_cb_timer *cb = from_timer(cb, t, timer);
+	struct i915_sw_dma_fence_cb_timer *cb = timer_container_of(cb, t, timer);
 	struct i915_sw_fence *fence;
 
 	fence = xchg(&cb->base.fence, NULL);
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 07e81be4d392..51561b190b93 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -135,7 +135,7 @@ int intel_wakeref_wait_for_idle(struct intel_wakeref *wf)
 
 static void wakeref_auto_timeout(struct timer_list *t)
 {
-	struct intel_wakeref_auto *wf = from_timer(wf, t, timer);
+	struct intel_wakeref_auto *wf = timer_container_of(wf, t, timer);
 	intel_wakeref_t wakeref;
 	unsigned long flags;
 
diff --git a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
index d5ecc68155da..47703716c9f2 100644
--- a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
+++ b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
@@ -55,7 +55,7 @@ void onstack_fence_fini(struct i915_sw_fence *fence)
 
 static void timed_fence_wake(struct timer_list *t)
 {
-	struct timed_fence *tf = from_timer(tf, t, timer);
+	struct timed_fence *tf = timer_container_of(tf, t, timer);
 
 	i915_sw_fence_commit(&tf->fence);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index fed3307d3374..9b3b27b4d480 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2568,7 +2568,7 @@ static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 
 static void mtk_dp_debounce_timer(struct timer_list *t)
 {
-	struct mtk_dp *mtk_dp = from_timer(mtk_dp, t, debounce_timer);
+	struct mtk_dp *mtk_dp = timer_container_of(mtk_dp, t, debounce_timer);
 
 	mtk_dp->need_debounce = true;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 36f72c43eae8..58a86c84e5a8 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -79,7 +79,7 @@ static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
 
 static void a5xx_preempt_timer(struct timer_list *t)
 {
-	struct a5xx_gpu *a5xx_gpu = from_timer(a5xx_gpu, t, preempt_timer);
+	struct a5xx_gpu *a5xx_gpu = timer_container_of(a5xx_gpu, t, preempt_timer);
 	struct msm_gpu *gpu = &a5xx_gpu->base.base;
 	struct drm_device *dev = gpu->dev;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 9b5e27d2373c..502453dfcff2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -87,7 +87,7 @@ static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
 
 static void a6xx_preempt_timer(struct timer_list *t)
 {
-	struct a6xx_gpu *a6xx_gpu = from_timer(a6xx_gpu, t, preempt_timer);
+	struct a6xx_gpu *a6xx_gpu = timer_container_of(a6xx_gpu, t, preempt_timer);
 	struct msm_gpu *gpu = &a6xx_gpu->base.base;
 	struct drm_device *dev = gpu->dev;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8610bbf2b87c..51844072bfed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2684,7 +2684,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 
 static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 {
-	struct dpu_encoder_virt *dpu_enc = from_timer(dpu_enc, t,
+	struct dpu_encoder_virt *dpu_enc = timer_container_of(dpu_enc, t,
 			frame_done_timer);
 	struct drm_encoder *drm_enc = &dpu_enc->base;
 	u32 event;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c380d9d9f5af..197871fdf508 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -521,7 +521,7 @@ static bool made_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 
 static void hangcheck_handler(struct timer_list *t)
 {
-	struct msm_gpu *gpu = from_timer(gpu, t, hangcheck_timer);
+	struct msm_gpu *gpu = timer_container_of(gpu, t, hangcheck_timer);
 	struct drm_device *dev = gpu->dev;
 	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
 	uint32_t fence = ring->memptrs->fence;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index f8f20d2f6174..3042d0f7a117 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -175,7 +175,7 @@ struct signal_timer {
 
 static void signal_for_ttm_bo_reserve(struct timer_list *t)
 {
-	struct signal_timer *s_timer = from_timer(s_timer, t, timer);
+	struct signal_timer *s_timer = timer_container_of(s_timer, t, timer);
 	struct task_struct *task = s_timer->ctx->task;
 
 	do_send_sig_info(SIGTERM, SEND_SIG_PRIV, task, PIDTYPE_PID);
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 7125773889f1..4aaa587be3a5 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -679,7 +679,7 @@ void vc4_bo_dec_usecnt(struct vc4_bo *bo)
 
 static void vc4_bo_cache_time_timer(struct timer_list *t)
 {
-	struct vc4_dev *vc4 = from_timer(vc4, t, bo_cache.time_timer);
+	struct vc4_dev *vc4 = timer_container_of(vc4, t, bo_cache.time_timer);
 
 	schedule_work(&vc4->bo_cache.time_work);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 8125f87edc60..255e5817618e 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -326,7 +326,7 @@ vc4_reset_work(struct work_struct *work)
 static void
 vc4_hangcheck_elapsed(struct timer_list *t)
 {
-	struct vc4_dev *vc4 = from_timer(vc4, t, hangcheck.timer);
+	struct vc4_dev *vc4 = timer_container_of(vc4, t, hangcheck.timer);
 	struct drm_device *dev = &vc4->base;
 	uint32_t ct0ca, ct1ca;
 	unsigned long irqflags;
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index 37bb1fb58cf9..145ea549fc0a 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -76,7 +76,7 @@ static const struct dma_fence_ops vgem_fence_ops = {
 
 static void vgem_fence_timeout(struct timer_list *t)
 {
-	struct vgem_fence *fence = from_timer(fence, t, timer);
+	struct vgem_fence *fence = timer_container_of(fence, t, timer);
 
 	dma_fence_signal(&fence->base);
 }
diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index f6beeebf974c..6d02ab77e32d 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -295,7 +295,7 @@ static void gb_operation_work(struct work_struct *work)
 
 static void gb_operation_timeout(struct timer_list *t)
 {
-	struct gb_operation *operation = from_timer(operation, t, timer);
+	struct gb_operation *operation = timer_container_of(operation, t, timer);
 
 	if (gb_operation_result_set(operation, -ETIMEDOUT)) {
 		/*
diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index ed34f5cd5a91..0639b1f43d88 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -614,7 +614,7 @@ static int apple_fetch_battery(struct hid_device *hdev)
 
 static void apple_battery_timer_tick(struct timer_list *t)
 {
-	struct apple_sc *asc = from_timer(asc, t, battery_timer);
+	struct apple_sc *asc = timer_container_of(asc, t, battery_timer);
 	struct hid_device *hdev = asc->hdev;
 
 	if (apple_fetch_battery(hdev) == 0) {
diff --git a/drivers/hid/hid-appleir.c b/drivers/hid/hid-appleir.c
index bb7db9ae41c2..5e8ced7bc05a 100644
--- a/drivers/hid/hid-appleir.c
+++ b/drivers/hid/hid-appleir.c
@@ -167,7 +167,7 @@ static void battery_flat(struct appleir *appleir)
 
 static void key_up_tick(struct timer_list *t)
 {
-	struct appleir *appleir = from_timer(appleir, t, key_up_timer);
+	struct appleir *appleir = timer_container_of(appleir, t, key_up_timer);
 	struct hid_device *hid = appleir->hid;
 	unsigned long flags;
 
diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index 029ccbaa1d12..b32776ceac0a 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -166,7 +166,7 @@ static int appletb_tb_key_to_slot(unsigned int code)
 
 static void appletb_inactivity_timer(struct timer_list *t)
 {
-	struct appletb_kbd *kbd = from_timer(kbd, t, inactivity_timer);
+	struct appletb_kbd *kbd = timer_container_of(kbd, t, inactivity_timer);
 
 	if (kbd->backlight_dev && appletb_tb_autodim) {
 		if (!kbd->has_dimmed) {
diff --git a/drivers/hid/hid-letsketch.c b/drivers/hid/hid-letsketch.c
index 8602c63ed9c6..4df42c5b6e88 100644
--- a/drivers/hid/hid-letsketch.c
+++ b/drivers/hid/hid-letsketch.c
@@ -155,7 +155,7 @@ static int letsketch_setup_input_tablet_pad(struct letsketch_data *data)
 
 static void letsketch_inrange_timeout(struct timer_list *t)
 {
-	struct letsketch_data *data = from_timer(data, t, inrange_timer);
+	struct letsketch_data *data = timer_container_of(data, t, inrange_timer);
 	struct input_dev *input = data->input_tablet;
 
 	input_report_key(input, BTN_TOOL_PEN, 0);
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index adfa329e917b..4c6a0ef64e0d 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -809,7 +809,7 @@ static int magicmouse_fetch_battery(struct hid_device *hdev)
 
 static void magicmouse_battery_timer_tick(struct timer_list *t)
 {
-	struct magicmouse_sc *msc = from_timer(msc, t, battery_timer);
+	struct magicmouse_sc *msc = timer_container_of(msc, t, battery_timer);
 	struct hid_device *hdev = msc->hdev;
 
 	if (magicmouse_fetch_battery(hdev) == 0) {
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 7ac8e16e6158..3d6dee383b6f 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1745,7 +1745,7 @@ static void mt_release_contacts(struct hid_device *hid)
 
 static void mt_expired_timeout(struct timer_list *t)
 {
-	struct mt_device *td = from_timer(td, t, release_timer);
+	struct mt_device *td = timer_container_of(td, t, release_timer);
 	struct hid_device *hdev = td->hdev;
 
 	/*
diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
index c6b922c2adba..74bddb2c3e82 100644
--- a/drivers/hid/hid-prodikeys.c
+++ b/drivers/hid/hid-prodikeys.c
@@ -227,7 +227,7 @@ static void pcmidi_send_note(struct pcmidi_snd *pm,
 
 static void pcmidi_sustained_note_release(struct timer_list *t)
 {
-	struct pcmidi_sustain *pms = from_timer(pms, t, timer);
+	struct pcmidi_sustain *pms = timer_container_of(pms, t, timer);
 
 	pcmidi_send_note(pms->pm, pms->status, pms->note, pms->velocity);
 	pms->in_use = 0;
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index a2be652b7bbd..b966e4044238 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -545,7 +545,7 @@ static void ghl_magic_poke_cb(struct urb *urb)
 static void ghl_magic_poke(struct timer_list *t)
 {
 	int ret;
-	struct sony_sc *sc = from_timer(sc, t, ghl_poke_timer);
+	struct sony_sc *sc = timer_container_of(sc, t, ghl_poke_timer);
 
 	ret = usb_submit_urb(sc->ghl_urb, GFP_ATOMIC);
 	if (ret < 0)
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index a367df6ea01f..435c52cecf69 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -32,7 +32,7 @@
  */
 static void uclogic_inrange_timeout(struct timer_list *t)
 {
-	struct uclogic_drvdata *drvdata = from_timer(drvdata, t,
+	struct uclogic_drvdata *drvdata = timer_container_of(drvdata, t,
 							inrange_timer);
 	struct input_dev *input = drvdata->pen_input;
 
diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 8080083121d3..5b5fc460a4c5 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -1240,7 +1240,7 @@ static void wiimote_schedule(struct wiimote_data *wdata)
 
 static void wiimote_init_timeout(struct timer_list *t)
 {
-	struct wiimote_data *wdata = from_timer(wdata, t, timer);
+	struct wiimote_data *wdata = timer_container_of(wdata, t, timer);
 
 	wiimote_schedule(wdata);
 }
diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 7d9297fad90e..be325495c132 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -106,7 +106,7 @@ static int hid_start_in(struct hid_device *hid)
 /* I/O retry timer routine */
 static void hid_retry_timeout(struct timer_list *t)
 {
-	struct usbhid_device *usbhid = from_timer(usbhid, t, io_retry);
+	struct usbhid_device *usbhid = timer_container_of(usbhid, t, io_retry);
 	struct hid_device *hid = usbhid->hid;
 
 	dev_dbg(&usbhid->intf->dev, "retrying intr urb\n");
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 5107a676e24f..955b39d22524 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -63,7 +63,7 @@ static void wacom_force_proxout(struct wacom_wac *wacom_wac)
 
 void wacom_idleprox_timeout(struct timer_list *list)
 {
-	struct wacom *wacom = from_timer(wacom, list, idleprox_timer);
+	struct wacom *wacom = timer_container_of(wacom, list, idleprox_timer);
 	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
 
 	if (!wacom_wac->hid_data.sense_state) {
diff --git a/drivers/hsi/clients/ssi_protocol.c b/drivers/hsi/clients/ssi_protocol.c
index cbc5e72857de..d10a01f3eb9e 100644
--- a/drivers/hsi/clients/ssi_protocol.c
+++ b/drivers/hsi/clients/ssi_protocol.c
@@ -453,7 +453,7 @@ static void ssip_error(struct hsi_client *cl)
 
 static void ssip_keep_alive(struct timer_list *t)
 {
-	struct ssi_protocol *ssi = from_timer(ssi, t, keep_alive);
+	struct ssi_protocol *ssi = timer_container_of(ssi, t, keep_alive);
 	struct hsi_client *cl = ssi->cl;
 
 	dev_dbg(&cl->device, "Keep alive kick in: m(%d) r(%d) s(%d)\n",
@@ -480,7 +480,7 @@ static void ssip_keep_alive(struct timer_list *t)
 
 static void ssip_rx_wd(struct timer_list *t)
 {
-	struct ssi_protocol *ssi = from_timer(ssi, t, rx_wd);
+	struct ssi_protocol *ssi = timer_container_of(ssi, t, rx_wd);
 	struct hsi_client *cl = ssi->cl;
 
 	dev_err(&cl->device, "Watchdog triggered\n");
@@ -489,7 +489,7 @@ static void ssip_rx_wd(struct timer_list *t)
 
 static void ssip_tx_wd(struct timer_list *t)
 {
-	struct ssi_protocol *ssi = from_timer(ssi, t, tx_wd);
+	struct ssi_protocol *ssi = timer_container_of(ssi, t, tx_wd);
 	struct hsi_client *cl = ssi->cl;
 
 	dev_err(&cl->device, "Watchdog triggered\n");
diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index db3b551828eb..802c73def428 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -331,7 +331,7 @@ static void npcm7xx_fan_polling(struct timer_list *t)
 	struct npcm7xx_pwm_fan_data *data;
 	int i;
 
-	data = from_timer(data, t, fan_timer);
+	data = timer_container_of(data, t, fan_timer);
 
 	/*
 	 * Polling two module per one round,
diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index d506a5e7e033..0c03bbadaddb 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -78,7 +78,7 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
 
 static void sample_timer(struct timer_list *t)
 {
-	struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
+	struct pwm_fan_ctx *ctx = timer_container_of(ctx, t, rpm_timer);
 	unsigned int delta = ktime_ms_delta(ktime_get(), ctx->sample_start);
 	int i;
 
diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 5d8b82ae6fd6..3278707bb885 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -831,7 +831,7 @@ static unsigned int img_i2c_atomic(struct img_i2c *i2c,
  */
 static void img_i2c_check_timer(struct timer_list *t)
 {
-	struct img_i2c *i2c = from_timer(i2c, t, check_timer);
+	struct img_i2c *i2c = timer_container_of(i2c, t, check_timer);
 	unsigned long flags;
 	unsigned int line_status;
 
diff --git a/drivers/iio/common/ssp_sensors/ssp_dev.c b/drivers/iio/common/ssp_sensors/ssp_dev.c
index 22ea10eb48ae..a6ffb64a1187 100644
--- a/drivers/iio/common/ssp_sensors/ssp_dev.c
+++ b/drivers/iio/common/ssp_sensors/ssp_dev.c
@@ -167,7 +167,7 @@ static void ssp_wdt_work_func(struct work_struct *work)
 
 static void ssp_wdt_timer_func(struct timer_list *t)
 {
-	struct ssp_data *data = from_timer(data, t, wdt_timer);
+	struct ssp_data *data = timer_container_of(data, t, wdt_timer);
 
 	switch (data->fw_dl_state) {
 	case SSP_FW_DL_STATE_FAIL:
diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/cm.c
index e02721a9e288..b3b45c49077d 100644
--- a/drivers/infiniband/hw/cxgb4/cm.c
+++ b/drivers/infiniband/hw/cxgb4/cm.c
@@ -4327,7 +4327,7 @@ static DECLARE_WORK(skb_work, process_work);
 
 static void ep_timeout(struct timer_list *t)
 {
-	struct c4iw_ep *ep = from_timer(ep, t, timer);
+	struct c4iw_ep *ep = timer_container_of(ep, t, timer);
 	int kickit = 0;
 
 	spin_lock(&timeout_lock);
diff --git a/drivers/infiniband/hw/hfi1/aspm.c b/drivers/infiniband/hw/hfi1/aspm.c
index 9b508eaf441d..79990d09522b 100644
--- a/drivers/infiniband/hw/hfi1/aspm.c
+++ b/drivers/infiniband/hw/hfi1/aspm.c
@@ -169,7 +169,7 @@ void __aspm_ctx_disable(struct hfi1_ctxtdata *rcd)
 /* Timer function for re-enabling ASPM in the absence of interrupt activity */
 static  void aspm_ctx_timer_function(struct timer_list *t)
 {
-	struct hfi1_ctxtdata *rcd = from_timer(rcd, t, aspm_timer);
+	struct hfi1_ctxtdata *rcd = timer_container_of(rcd, t, aspm_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&rcd->aspm_lock, flags);
diff --git a/drivers/infiniband/hw/hfi1/chip.c b/drivers/infiniband/hw/hfi1/chip.c
index e908f529335d..0781ab756d44 100644
--- a/drivers/infiniband/hw/hfi1/chip.c
+++ b/drivers/infiniband/hw/hfi1/chip.c
@@ -5548,7 +5548,7 @@ static void handle_cce_err(struct hfi1_devdata *dd, u32 unused, u64 reg)
 #define RCVERR_CHECK_TIME 10
 static void update_rcverr_timer(struct timer_list *t)
 {
-	struct hfi1_devdata *dd = from_timer(dd, t, rcverr_timer);
+	struct hfi1_devdata *dd = timer_container_of(dd, t, rcverr_timer);
 	struct hfi1_pportdata *ppd = dd->pport;
 	u32 cur_ovfl_cnt = read_dev_cntr(dd, C_RCV_OVF, CNTR_INVALID_VL);
 
@@ -12587,7 +12587,7 @@ static void do_update_synth_timer(struct work_struct *work)
 
 static void update_synth_timer(struct timer_list *t)
 {
-	struct hfi1_devdata *dd = from_timer(dd, t, synth_stats_timer);
+	struct hfi1_devdata *dd = timer_container_of(dd, t, synth_stats_timer);
 
 	queue_work(dd->update_cntr_wq, &dd->update_cntr_work);
 	mod_timer(&dd->synth_stats_timer, jiffies + HZ * SYNTH_CNT_TIME);
diff --git a/drivers/infiniband/hw/hfi1/driver.c b/drivers/infiniband/hw/hfi1/driver.c
index 3da90f2eb8e7..96bffa9e8dc7 100644
--- a/drivers/infiniband/hw/hfi1/driver.c
+++ b/drivers/infiniband/hw/hfi1/driver.c
@@ -1315,7 +1315,7 @@ void shutdown_led_override(struct hfi1_pportdata *ppd)
 
 static void run_led_override(struct timer_list *t)
 {
-	struct hfi1_pportdata *ppd = from_timer(ppd, t, led_override_timer);
+	struct hfi1_pportdata *ppd = timer_container_of(ppd, t, led_override_timer);
 	struct hfi1_devdata *dd = ppd->dd;
 	unsigned long timeout;
 	int phase_idx;
diff --git a/drivers/infiniband/hw/hfi1/mad.c b/drivers/infiniband/hw/hfi1/mad.c
index b39f63ce6dfc..961fa07116f0 100644
--- a/drivers/infiniband/hw/hfi1/mad.c
+++ b/drivers/infiniband/hw/hfi1/mad.c
@@ -369,7 +369,7 @@ static void send_trap(struct hfi1_ibport *ibp, struct trap_node *trap)
 
 void hfi1_handle_trap_timer(struct timer_list *t)
 {
-	struct hfi1_ibport *ibp = from_timer(ibp, t, rvp.trap_timer);
+	struct hfi1_ibport *ibp = timer_container_of(ibp, t, rvp.trap_timer);
 	struct trap_node *trap = NULL;
 	unsigned long flags;
 	int i;
diff --git a/drivers/infiniband/hw/hfi1/sdma.c b/drivers/infiniband/hw/hfi1/sdma.c
index 0d2b39b7c8b5..24c0704544a5 100644
--- a/drivers/infiniband/hw/hfi1/sdma.c
+++ b/drivers/infiniband/hw/hfi1/sdma.c
@@ -467,7 +467,7 @@ static void sdma_err_progress_check_schedule(struct sdma_engine *sde)
 static void sdma_err_progress_check(struct timer_list *t)
 {
 	unsigned index;
-	struct sdma_engine *sde = from_timer(sde, t, err_progress_check_timer);
+	struct sdma_engine *sde = timer_container_of(sde, t, err_progress_check_timer);
 
 	dd_dev_err(sde->dd, "SDE progress check event\n");
 	for (index = 0; index < sde->dd->num_sdma; index++) {
diff --git a/drivers/infiniband/hw/hfi1/tid_rdma.c b/drivers/infiniband/hw/hfi1/tid_rdma.c
index 78bf4a48c035..948b5883e9dd 100644
--- a/drivers/infiniband/hw/hfi1/tid_rdma.c
+++ b/drivers/infiniband/hw/hfi1/tid_rdma.c
@@ -3981,7 +3981,7 @@ void hfi1_del_tid_reap_timer(struct rvt_qp *qp)
 
 static void hfi1_tid_timeout(struct timer_list *t)
 {
-	struct hfi1_qp_priv *qpriv = from_timer(qpriv, t, s_tid_timer);
+	struct hfi1_qp_priv *qpriv = timer_container_of(qpriv, t, s_tid_timer);
 	struct rvt_qp *qp = qpriv->owner;
 	struct rvt_dev_info *rdi = ib_to_rvt(qp->ibqp.device);
 	unsigned long flags;
@@ -4797,7 +4797,7 @@ void hfi1_del_tid_retry_timer(struct rvt_qp *qp)
 
 static void hfi1_tid_retry_timeout(struct timer_list *t)
 {
-	struct hfi1_qp_priv *priv = from_timer(priv, t, s_tid_retry_timer);
+	struct hfi1_qp_priv *priv = timer_container_of(priv, t, s_tid_retry_timer);
 	struct rvt_qp *qp = priv->owner;
 	struct rvt_swqe *wqe;
 	unsigned long flags;
diff --git a/drivers/infiniband/hw/hfi1/verbs.c b/drivers/infiniband/hw/hfi1/verbs.c
index 49e0f79b950c..3cbbfccdd8cd 100644
--- a/drivers/infiniband/hw/hfi1/verbs.c
+++ b/drivers/infiniband/hw/hfi1/verbs.c
@@ -554,7 +554,7 @@ void hfi1_16B_rcv(struct hfi1_packet *packet)
  */
 static void mem_timer(struct timer_list *t)
 {
-	struct hfi1_ibdev *dev = from_timer(dev, t, mem_timer);
+	struct hfi1_ibdev *dev = timer_container_of(dev, t, mem_timer);
 	struct list_head *list = &dev->memwait;
 	struct rvt_qp *qp = NULL;
 	struct iowait *wait;
diff --git a/drivers/infiniband/hw/irdma/cm.c b/drivers/infiniband/hw/irdma/cm.c
index 23207f13ac1b..2a6d705bd471 100644
--- a/drivers/infiniband/hw/irdma/cm.c
+++ b/drivers/infiniband/hw/irdma/cm.c
@@ -1263,7 +1263,7 @@ static void irdma_cm_timer_tick(struct timer_list *t)
 	struct irdma_timer_entry *send_entry, *close_entry;
 	struct list_head *list_core_temp;
 	struct list_head *list_node;
-	struct irdma_cm_core *cm_core = from_timer(cm_core, t, tcp_timer);
+	struct irdma_cm_core *cm_core = timer_container_of(cm_core, t, tcp_timer);
 	struct irdma_sc_vsi *vsi;
 	u32 settimer = 0;
 	unsigned long timetosend;
diff --git a/drivers/infiniband/hw/irdma/utils.c b/drivers/infiniband/hw/irdma/utils.c
index d66b4f7a84ec..b510ef747399 100644
--- a/drivers/infiniband/hw/irdma/utils.c
+++ b/drivers/infiniband/hw/irdma/utils.c
@@ -930,7 +930,7 @@ void irdma_terminate_done(struct irdma_sc_qp *qp, int timeout_occurred)
 
 static void irdma_terminate_timeout(struct timer_list *t)
 {
-	struct irdma_qp *iwqp = from_timer(iwqp, t, terminate_timer);
+	struct irdma_qp *iwqp = timer_container_of(iwqp, t, terminate_timer);
 	struct irdma_sc_qp *qp = &iwqp->sc_qp;
 
 	irdma_terminate_done(qp, 1);
@@ -1537,7 +1537,7 @@ int irdma_puda_get_tcpip_info(struct irdma_puda_cmpl_info *info,
 static void irdma_hw_stats_timeout(struct timer_list *t)
 {
 	struct irdma_vsi_pestat *pf_devstat =
-		from_timer(pf_devstat, t, stats_timer);
+		timer_container_of(pf_devstat, t, stats_timer);
 	struct irdma_sc_vsi *sc_vsi = pf_devstat->vsi;
 
 	if (sc_vsi->dev->hw_attrs.uk_attrs.hw_rev >= IRDMA_GEN_2)
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 5fbebafc8774..2747b160d199 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -838,7 +838,7 @@ static void mlx5_mkey_cache_debugfs_init(struct mlx5_ib_dev *dev)
 
 static void delay_time_func(struct timer_list *t)
 {
-	struct mlx5_ib_dev *dev = from_timer(dev, t, delay_timer);
+	struct mlx5_ib_dev *dev = timer_container_of(dev, t, delay_timer);
 
 	WRITE_ONCE(dev->fill_delay, 0);
 }
diff --git a/drivers/infiniband/hw/mthca/mthca_catas.c b/drivers/infiniband/hw/mthca/mthca_catas.c
index 6eabef9aa211..f1d79968c985 100644
--- a/drivers/infiniband/hw/mthca/mthca_catas.c
+++ b/drivers/infiniband/hw/mthca/mthca_catas.c
@@ -132,7 +132,7 @@ static void handle_catas(struct mthca_dev *dev)
 
 static void poll_catas(struct timer_list *t)
 {
-	struct mthca_dev *dev = from_timer(dev, t, catas_err.timer);
+	struct mthca_dev *dev = timer_container_of(dev, t, catas_err.timer);
 	int i;
 
 	for (i = 0; i < dev->catas_err.size; ++i)
diff --git a/drivers/infiniband/hw/qib/qib_driver.c b/drivers/infiniband/hw/qib/qib_driver.c
index bdd724add147..9c478ab9238b 100644
--- a/drivers/infiniband/hw/qib/qib_driver.c
+++ b/drivers/infiniband/hw/qib/qib_driver.c
@@ -659,7 +659,7 @@ int qib_set_lid(struct qib_pportdata *ppd, u32 lid, u8 lmc)
 
 static void qib_run_led_override(struct timer_list *t)
 {
-	struct qib_pportdata *ppd = from_timer(ppd, t,
+	struct qib_pportdata *ppd = timer_container_of(ppd, t,
 						    led_override_timer);
 	struct qib_devdata *dd = ppd->dd;
 	int timeoff;
diff --git a/drivers/infiniband/hw/qib/qib_iba6120.c b/drivers/infiniband/hw/qib/qib_iba6120.c
index 277769fa9745..2640d283eee6 100644
--- a/drivers/infiniband/hw/qib/qib_iba6120.c
+++ b/drivers/infiniband/hw/qib/qib_iba6120.c
@@ -2615,7 +2615,7 @@ static void qib_chk_6120_errormask(struct qib_devdata *dd)
  */
 static void qib_get_6120_faststats(struct timer_list *t)
 {
-	struct qib_devdata *dd = from_timer(dd, t, stats_timer);
+	struct qib_devdata *dd = timer_container_of(dd, t, stats_timer);
 	struct qib_pportdata *ppd = dd->pport;
 	unsigned long flags;
 	u64 traffic_wds;
@@ -2905,7 +2905,7 @@ static int qib_6120_set_loopback(struct qib_pportdata *ppd, const char *what)
 
 static void pma_6120_timer(struct timer_list *t)
 {
-	struct qib_chip_specific *cs = from_timer(cs, t, pma_timer);
+	struct qib_chip_specific *cs = timer_container_of(cs, t, pma_timer);
 	struct qib_pportdata *ppd = cs->ppd;
 	struct qib_ibport *ibp = &ppd->ibport_data;
 	unsigned long flags;
diff --git a/drivers/infiniband/hw/qib/qib_iba7220.c b/drivers/infiniband/hw/qib/qib_iba7220.c
index 302c0d19f57d..0b7399d3f46e 100644
--- a/drivers/infiniband/hw/qib/qib_iba7220.c
+++ b/drivers/infiniband/hw/qib/qib_iba7220.c
@@ -1044,7 +1044,7 @@ static int qib_decode_7220_err(struct qib_devdata *dd, char *buf, size_t blen,
 
 static void reenable_7220_chase(struct timer_list *t)
 {
-	struct qib_chippport_specific *cpspec = from_timer(cpspec, t,
+	struct qib_chippport_specific *cpspec = timer_container_of(cpspec, t,
 							 chase_timer);
 	struct qib_pportdata *ppd = &cpspec->pportdata;
 
@@ -3240,7 +3240,7 @@ static u32 qib_read_7220portcntrs(struct qib_devdata *dd, loff_t pos, u32 port,
  */
 static void qib_get_7220_faststats(struct timer_list *t)
 {
-	struct qib_devdata *dd = from_timer(dd, t, stats_timer);
+	struct qib_devdata *dd = timer_container_of(dd, t, stats_timer);
 	struct qib_pportdata *ppd = dd->pport;
 	unsigned long flags;
 	u64 traffic_wds;
diff --git a/drivers/infiniband/hw/qib/qib_iba7322.c b/drivers/infiniband/hw/qib/qib_iba7322.c
index 7b4bf06c3b38..71258d17dbe8 100644
--- a/drivers/infiniband/hw/qib/qib_iba7322.c
+++ b/drivers/infiniband/hw/qib/qib_iba7322.c
@@ -1721,7 +1721,7 @@ static void qib_error_tasklet(struct tasklet_struct *t)
 
 static void reenable_chase(struct timer_list *t)
 {
-	struct qib_chippport_specific *cp = from_timer(cp, t, chase_timer);
+	struct qib_chippport_specific *cp = timer_container_of(cp, t, chase_timer);
 	struct qib_pportdata *ppd = cp->ppd;
 
 	ppd->cpspec->chase_timer.expires = 0;
@@ -5084,7 +5084,7 @@ static u32 qib_read_7322portcntrs(struct qib_devdata *dd, loff_t pos, u32 port,
  */
 static void qib_get_7322_faststats(struct timer_list *t)
 {
-	struct qib_devdata *dd = from_timer(dd, t, stats_timer);
+	struct qib_devdata *dd = timer_container_of(dd, t, stats_timer);
 	struct qib_pportdata *ppd;
 	unsigned long flags;
 	u64 traffic_wds;
diff --git a/drivers/infiniband/hw/qib/qib_init.c b/drivers/infiniband/hw/qib/qib_init.c
index 33c23adec101..1c45814f5646 100644
--- a/drivers/infiniband/hw/qib/qib_init.c
+++ b/drivers/infiniband/hw/qib/qib_init.c
@@ -493,7 +493,7 @@ static void enable_chip(struct qib_devdata *dd)
 
 static void verify_interrupt(struct timer_list *t)
 {
-	struct qib_devdata *dd = from_timer(dd, t, intrchk_timer);
+	struct qib_devdata *dd = timer_container_of(dd, t, intrchk_timer);
 	u64 int_counter;
 
 	if (!dd)
diff --git a/drivers/infiniband/hw/qib/qib_intr.c b/drivers/infiniband/hw/qib/qib_intr.c
index 85c3187d796d..008cb4b7bd83 100644
--- a/drivers/infiniband/hw/qib/qib_intr.c
+++ b/drivers/infiniband/hw/qib/qib_intr.c
@@ -172,7 +172,7 @@ void qib_handle_e_ibstatuschanged(struct qib_pportdata *ppd, u64 ibcs)
 
 void qib_clear_symerror_on_linkup(struct timer_list *t)
 {
-	struct qib_pportdata *ppd = from_timer(ppd, t, symerr_clear_timer);
+	struct qib_pportdata *ppd = timer_container_of(ppd, t, symerr_clear_timer);
 
 	if (ppd->lflags & QIBL_LINKACTIVE)
 		return;
diff --git a/drivers/infiniband/hw/qib/qib_mad.c b/drivers/infiniband/hw/qib/qib_mad.c
index 568deb77ab4d..b4b39c6ee134 100644
--- a/drivers/infiniband/hw/qib/qib_mad.c
+++ b/drivers/infiniband/hw/qib/qib_mad.c
@@ -2398,7 +2398,7 @@ int qib_process_mad(struct ib_device *ibdev, int mad_flags, u32 port,
 
 static void xmit_wait_timer_func(struct timer_list *t)
 {
-	struct qib_pportdata *ppd = from_timer(ppd, t, cong_stats.timer);
+	struct qib_pportdata *ppd = timer_container_of(ppd, t, cong_stats.timer);
 	struct qib_devdata *dd = dd_from_ppd(ppd);
 	unsigned long flags;
 	u8 status;
diff --git a/drivers/infiniband/hw/qib/qib_sd7220.c b/drivers/infiniband/hw/qib/qib_sd7220.c
index c4ee120ac7fb..40bc0a34273e 100644
--- a/drivers/infiniband/hw/qib/qib_sd7220.c
+++ b/drivers/infiniband/hw/qib/qib_sd7220.c
@@ -1385,7 +1385,7 @@ MODULE_PARM_DESC(relock_by_timer, "Allow relock attempt if link not up");
 
 static void qib_run_relock(struct timer_list *t)
 {
-	struct qib_chip_specific *cs = from_timer(cs, t, relock_timer);
+	struct qib_chip_specific *cs = timer_container_of(cs, t, relock_timer);
 	struct qib_devdata *dd = cs->dd;
 	struct qib_pportdata *ppd = dd->pport;
 	int timeoff;
diff --git a/drivers/infiniband/hw/qib/qib_tx.c b/drivers/infiniband/hw/qib/qib_tx.c
index 1325110237cd..397928c80f7c 100644
--- a/drivers/infiniband/hw/qib/qib_tx.c
+++ b/drivers/infiniband/hw/qib/qib_tx.c
@@ -548,7 +548,7 @@ void qib_hol_up(struct qib_pportdata *ppd)
  */
 void qib_hol_event(struct timer_list *t)
 {
-	struct qib_pportdata *ppd = from_timer(ppd, t, hol_timer);
+	struct qib_pportdata *ppd = timer_container_of(ppd, t, hol_timer);
 
 	/* If hardware error, etc, skip. */
 	if (!(ppd->dd->flags & QIB_INITTED))
diff --git a/drivers/infiniband/hw/qib/qib_verbs.c b/drivers/infiniband/hw/qib/qib_verbs.c
index 9832567a8bb8..bab657f93084 100644
--- a/drivers/infiniband/hw/qib/qib_verbs.c
+++ b/drivers/infiniband/hw/qib/qib_verbs.c
@@ -361,7 +361,7 @@ void qib_ib_rcv(struct qib_ctxtdata *rcd, void *rhdr, void *data, u32 tlen)
  */
 static void mem_timer(struct timer_list *t)
 {
-	struct qib_ibdev *dev = from_timer(dev, t, mem_timer);
+	struct qib_ibdev *dev = timer_container_of(dev, t, mem_timer);
 	struct list_head *list = &dev->memwait;
 	struct rvt_qp *qp = NULL;
 	struct qib_qp_priv *priv = NULL;
diff --git a/drivers/infiniband/sw/rdmavt/qp.c b/drivers/infiniband/sw/rdmavt/qp.c
index 583debe4b9a2..e825e2ef7966 100644
--- a/drivers/infiniband/sw/rdmavt/qp.c
+++ b/drivers/infiniband/sw/rdmavt/qp.c
@@ -2585,7 +2585,7 @@ EXPORT_SYMBOL(rvt_del_timers_sync);
  */
 static void rvt_rc_timeout(struct timer_list *t)
 {
-	struct rvt_qp *qp = from_timer(qp, t, s_timer);
+	struct rvt_qp *qp = timer_container_of(qp, t, s_timer);
 	struct rvt_dev_info *rdi = ib_to_rvt(qp->ibqp.device);
 	unsigned long flags;
 
diff --git a/drivers/infiniband/sw/rxe/rxe_comp.c b/drivers/infiniband/sw/rxe/rxe_comp.c
index d48af2180745..a5b2b62f596b 100644
--- a/drivers/infiniband/sw/rxe/rxe_comp.c
+++ b/drivers/infiniband/sw/rxe/rxe_comp.c
@@ -114,7 +114,7 @@ static enum ib_wc_opcode wr_to_wc_opcode(enum ib_wr_opcode opcode)
 
 void retransmit_timer(struct timer_list *t)
 {
-	struct rxe_qp *qp = from_timer(qp, t, retrans_timer);
+	struct rxe_qp *qp = timer_container_of(qp, t, retrans_timer);
 	unsigned long flags;
 
 	rxe_dbg_qp(qp, "retransmit timer fired\n");
diff --git a/drivers/infiniband/sw/rxe/rxe_req.c b/drivers/infiniband/sw/rxe/rxe_req.c
index 9d0392df8a92..373b03f223be 100644
--- a/drivers/infiniband/sw/rxe/rxe_req.c
+++ b/drivers/infiniband/sw/rxe/rxe_req.c
@@ -97,7 +97,7 @@ static void req_retry(struct rxe_qp *qp)
 
 void rnr_nak_timer(struct timer_list *t)
 {
-	struct rxe_qp *qp = from_timer(qp, t, rnr_nak_timer);
+	struct rxe_qp *qp = timer_container_of(qp, t, rnr_nak_timer);
 	unsigned long flags;
 
 	rxe_dbg_qp(qp, "nak timer fired\n");
diff --git a/drivers/input/ff-memless.c b/drivers/input/ff-memless.c
index 009822fa61b8..91636479ee3c 100644
--- a/drivers/input/ff-memless.c
+++ b/drivers/input/ff-memless.c
@@ -399,7 +399,7 @@ static void ml_play_effects(struct ml_device *ml)
 
 static void ml_effect_timer(struct timer_list *t)
 {
-	struct ml_device *ml = from_timer(ml, t, timer);
+	struct ml_device *ml = timer_container_of(ml, t, timer);
 	struct input_dev *dev = ml->dev;
 
 	pr_debug("timer: updating effects\n");
diff --git a/drivers/input/gameport/gameport.c b/drivers/input/gameport/gameport.c
index ae51f108bfae..a419315b436d 100644
--- a/drivers/input/gameport/gameport.c
+++ b/drivers/input/gameport/gameport.c
@@ -199,7 +199,7 @@ EXPORT_SYMBOL(gameport_stop_polling);
 
 static void gameport_run_poll_handler(struct timer_list *t)
 {
-	struct gameport *gameport = from_timer(gameport, t, poll_timer);
+	struct gameport *gameport = timer_container_of(gameport, t, poll_timer);
 
 	gameport->poll_handler(gameport);
 	if (gameport->poll_cnt)
diff --git a/drivers/input/input.c b/drivers/input/input.c
index ec4346f20efd..44887e51e049 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -2249,7 +2249,7 @@ static void devm_input_device_unregister(struct device *dev, void *res)
  */
 static void input_repeat_key(struct timer_list *t)
 {
-	struct input_dev *dev = from_timer(dev, t, timer);
+	struct input_dev *dev = timer_container_of(dev, t, timer);
 
 	guard(spinlock_irqsave)(&dev->event_lock);
 
diff --git a/drivers/input/joystick/db9.c b/drivers/input/joystick/db9.c
index d7a253835889..d5c67a927404 100644
--- a/drivers/input/joystick/db9.c
+++ b/drivers/input/joystick/db9.c
@@ -351,7 +351,7 @@ static int db9_saturn(int mode, struct parport *port, struct input_dev *devs[])
 
 static void db9_timer(struct timer_list *t)
 {
-	struct db9 *db9 = from_timer(db9, t, timer);
+	struct db9 *db9 = timer_container_of(db9, t, timer);
 	struct parport *port = db9->pd->port;
 	struct input_dev *dev = db9->dev[0];
 	struct input_dev *dev2 = db9->dev[1];
diff --git a/drivers/input/joystick/gamecon.c b/drivers/input/joystick/gamecon.c
index 9fc629ad58b8..ae95cb3d0ae9 100644
--- a/drivers/input/joystick/gamecon.c
+++ b/drivers/input/joystick/gamecon.c
@@ -726,7 +726,7 @@ static void gc_psx_process_packet(struct gc *gc)
 
 static void gc_timer(struct timer_list *t)
 {
-	struct gc *gc = from_timer(gc, t, timer);
+	struct gc *gc = timer_container_of(gc, t, timer);
 
 /*
  * N64 pads - must be read first, any read confuses them for 200 us
diff --git a/drivers/input/joystick/turbografx.c b/drivers/input/joystick/turbografx.c
index aa3e7d471b96..5f69aef01791 100644
--- a/drivers/input/joystick/turbografx.c
+++ b/drivers/input/joystick/turbografx.c
@@ -72,7 +72,7 @@ static struct tgfx {
 
 static void tgfx_timer(struct timer_list *t)
 {
-	struct tgfx *tgfx = from_timer(tgfx, t, timer);
+	struct tgfx *tgfx = timer_container_of(tgfx, t, timer);
 	struct input_dev *dev;
 	int data1, data2, i;
 
diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
index 3cd47fa44efc..69e511a8a605 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -183,7 +183,7 @@ static void imx_keypad_fire_events(struct imx_keypad *keypad,
  */
 static void imx_keypad_check_for_events(struct timer_list *t)
 {
-	struct imx_keypad *keypad = from_timer(keypad, t, check_matrix_timer);
+	struct imx_keypad *keypad = timer_container_of(keypad, t, check_matrix_timer);
 	unsigned short matrix_volatile_state[MAX_MATRIX_KEY_COLS];
 	unsigned short reg_val;
 	bool state_changed, is_zero_matrix;
diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
index c501a93a4417..58d4f2096cf9 100644
--- a/drivers/input/keyboard/locomokbd.c
+++ b/drivers/input/keyboard/locomokbd.c
@@ -194,7 +194,7 @@ static irqreturn_t locomokbd_interrupt(int irq, void *dev_id)
  */
 static void locomokbd_timer_callback(struct timer_list *t)
 {
-	struct locomokbd *locomokbd = from_timer(locomokbd, t, timer);
+	struct locomokbd *locomokbd = timer_container_of(locomokbd, t, timer);
 
 	locomokbd_scankeyboard(locomokbd);
 }
diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index bbf409dda89f..08a8fbfc43d5 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -44,7 +44,7 @@ struct pwrkey_drv_data {
 
 static void imx_imx_snvs_check_for_events(struct timer_list *t)
 {
-	struct pwrkey_drv_data *pdata = from_timer(pdata, t, check_timer);
+	struct pwrkey_drv_data *pdata = timer_container_of(pdata, t, check_timer);
 	struct input_dev *input = pdata->input;
 	u32 state;
 
diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
index 32a676f0de53..bc1c80a456f2 100644
--- a/drivers/input/keyboard/tegra-kbc.c
+++ b/drivers/input/keyboard/tegra-kbc.c
@@ -240,7 +240,7 @@ static void tegra_kbc_set_fifo_interrupt(struct tegra_kbc *kbc, bool enable)
 
 static void tegra_kbc_keypress_timer(struct timer_list *t)
 {
-	struct tegra_kbc *kbc = from_timer(kbc, t, timer);
+	struct tegra_kbc *kbc = timer_container_of(kbc, t, timer);
 	u32 val;
 	unsigned int i;
 
diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
index 7ba8d166d68c..0c7b8f8ef4a5 100644
--- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
+++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
@@ -45,7 +45,7 @@ struct bbnsm_pwrkey {
 
 static void bbnsm_pwrkey_check_for_events(struct timer_list *t)
 {
-	struct bbnsm_pwrkey *bbnsm = from_timer(bbnsm, t, check_timer);
+	struct bbnsm_pwrkey *bbnsm = timer_container_of(bbnsm, t, check_timer);
 	struct input_dev *input = bbnsm->input;
 	u32 state;
 
diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 0bd7b09b0aa3..be734d65ea72 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -1582,7 +1582,7 @@ static psmouse_ret_t alps_handle_interleaved_ps2(struct psmouse *psmouse)
 
 static void alps_flush_packet(struct timer_list *t)
 {
-	struct alps_data *priv = from_timer(priv, t, timer);
+	struct alps_data *priv = timer_container_of(priv, t, timer);
 	struct psmouse *psmouse = priv->psmouse;
 
 	guard(serio_pause_rx)(psmouse->ps2dev.serio);
diff --git a/drivers/input/mouse/byd.c b/drivers/input/mouse/byd.c
index 4ee084e00a7c..71aa23dd7d8d 100644
--- a/drivers/input/mouse/byd.c
+++ b/drivers/input/mouse/byd.c
@@ -251,7 +251,7 @@ static void byd_report_input(struct psmouse *psmouse)
 
 static void byd_clear_touch(struct timer_list *t)
 {
-	struct byd_data *priv = from_timer(priv, t, timer);
+	struct byd_data *priv = timer_container_of(priv, t, timer);
 	struct psmouse *psmouse = priv->psmouse;
 
 	guard(serio_pause_rx)(psmouse->ps2dev.serio);
diff --git a/drivers/input/touchscreen/ad7877.c b/drivers/input/touchscreen/ad7877.c
index 8d8392ce7005..c9aa1847265a 100644
--- a/drivers/input/touchscreen/ad7877.c
+++ b/drivers/input/touchscreen/ad7877.c
@@ -375,7 +375,7 @@ static inline void ad7877_ts_event_release(struct ad7877 *ts)
 
 static void ad7877_timer(struct timer_list *t)
 {
-	struct ad7877 *ts = from_timer(ts, t, timer);
+	struct ad7877 *ts = timer_container_of(ts, t, timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&ts->lock, flags);
diff --git a/drivers/input/touchscreen/ad7879.c b/drivers/input/touchscreen/ad7879.c
index f661e199b63c..f9db5cefb25b 100644
--- a/drivers/input/touchscreen/ad7879.c
+++ b/drivers/input/touchscreen/ad7879.c
@@ -237,7 +237,7 @@ static void ad7879_ts_event_release(struct ad7879 *ts)
 
 static void ad7879_timer(struct timer_list *t)
 {
-	struct ad7879 *ts = from_timer(ts, t, timer);
+	struct ad7879 *ts = timer_container_of(ts, t, timer);
 
 	ad7879_ts_event_release(ts);
 }
diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
index 3c997fba7048..1f1157dd3be5 100644
--- a/drivers/input/touchscreen/bu21029_ts.c
+++ b/drivers/input/touchscreen/bu21029_ts.c
@@ -209,7 +209,7 @@ static void bu21029_touch_report(struct bu21029_ts_data *bu21029, const u8 *buf)
 
 static void bu21029_touch_release(struct timer_list *t)
 {
-	struct bu21029_ts_data *bu21029 = from_timer(bu21029, t, timer);
+	struct bu21029_ts_data *bu21029 = timer_container_of(bu21029, t, timer);
 
 	input_report_abs(bu21029->in_dev, ABS_PRESSURE, 0);
 	input_report_key(bu21029->in_dev, BTN_TOUCH, 0);
diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 9a5977d8cad2..28da7ba55a4b 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -105,7 +105,7 @@ static void exc3000_report_slots(struct input_dev *input,
 
 static void exc3000_timer(struct timer_list *t)
 {
-	struct exc3000_data *data = from_timer(data, t, timer);
+	struct exc3000_data *data = timer_container_of(data, t, timer);
 
 	input_mt_sync_frame(data->input);
 	input_sync(data->input);
diff --git a/drivers/input/touchscreen/sx8654.c b/drivers/input/touchscreen/sx8654.c
index e59b8d0ed19e..5fa47a1a6fdc 100644
--- a/drivers/input/touchscreen/sx8654.c
+++ b/drivers/input/touchscreen/sx8654.c
@@ -116,7 +116,7 @@ static inline void sx865x_penrelease(struct sx8654 *ts)
 
 static void sx865x_penrelease_timer_handler(struct timer_list *t)
 {
-	struct sx8654 *ts = from_timer(ts, t, timer);
+	struct sx8654 *ts = timer_container_of(ts, t, timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&ts->lock, flags);
diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchscreen/tsc200x-core.c
index 252a93753ee5..82d7d1cf5010 100644
--- a/drivers/input/touchscreen/tsc200x-core.c
+++ b/drivers/input/touchscreen/tsc200x-core.c
@@ -194,7 +194,7 @@ static irqreturn_t tsc200x_irq_thread(int irq, void *_ts)
 
 static void tsc200x_penup_timer(struct timer_list *t)
 {
-	struct tsc200x *ts = from_timer(ts, t, penup_timer);
+	struct tsc200x *ts = timer_container_of(ts, t, penup_timer);
 
 	guard(spinlock_irqsave)(&ts->lock);
 	tsc200x_update_pen_state(ts, 0, 0, 0);
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index a775e4dbe06f..d4352f13c172 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -176,7 +176,7 @@ static void fq_flush_iotlb(struct iommu_dma_cookie *cookie)
 
 static void fq_flush_timeout(struct timer_list *t)
 {
-	struct iommu_dma_cookie *cookie = from_timer(cookie, t, fq_timer);
+	struct iommu_dma_cookie *cookie = timer_container_of(cookie, t, fq_timer);
 	int cpu;
 
 	atomic_set(&cookie->fq_timer_on, 0);
diff --git a/drivers/isdn/hardware/mISDN/hfcpci.c b/drivers/isdn/hardware/mISDN/hfcpci.c
index e3870d942699..2b05722d4dbe 100644
--- a/drivers/isdn/hardware/mISDN/hfcpci.c
+++ b/drivers/isdn/hardware/mISDN/hfcpci.c
@@ -291,7 +291,7 @@ reset_hfcpci(struct hfc_pci *hc)
 static void
 hfcpci_Timer(struct timer_list *t)
 {
-	struct hfc_pci *hc = from_timer(hc, t, hw.timer);
+	struct hfc_pci *hc = timer_container_of(hc, t, hw.timer);
 	hc->hw.timer.expires = jiffies + 75;
 	/* WD RESET */
 /*
diff --git a/drivers/isdn/hardware/mISDN/mISDNipac.c b/drivers/isdn/hardware/mISDN/mISDNipac.c
index 165a63994f04..a34ea6058960 100644
--- a/drivers/isdn/hardware/mISDN/mISDNipac.c
+++ b/drivers/isdn/hardware/mISDN/mISDNipac.c
@@ -713,7 +713,7 @@ isac_release(struct isac_hw *isac)
 static void
 dbusy_timer_handler(struct timer_list *t)
 {
-	struct isac_hw *isac = from_timer(isac, t, dch.timer);
+	struct isac_hw *isac = timer_container_of(isac, t, dch.timer);
 	int rbch, star;
 	u_long flags;
 
diff --git a/drivers/isdn/hardware/mISDN/mISDNisar.c b/drivers/isdn/hardware/mISDN/mISDNisar.c
index e48f89cbecf8..dace91ba412b 100644
--- a/drivers/isdn/hardware/mISDN/mISDNisar.c
+++ b/drivers/isdn/hardware/mISDN/mISDNisar.c
@@ -1135,7 +1135,7 @@ EXPORT_SYMBOL(mISDNisar_irq);
 static void
 ftimer_handler(struct timer_list *t)
 {
-	struct isar_ch *ch = from_timer(ch, t, ftimer);
+	struct isar_ch *ch = timer_container_of(ch, t, ftimer);
 
 	pr_debug("%s: ftimer flags %lx\n", ch->is->name, ch->bch.Flags);
 	test_and_clear_bit(FLG_FTI_RUN, &ch->bch.Flags);
diff --git a/drivers/isdn/hardware/mISDN/w6692.c b/drivers/isdn/hardware/mISDN/w6692.c
index da933f4bdf4e..168fc345dcdc 100644
--- a/drivers/isdn/hardware/mISDN/w6692.c
+++ b/drivers/isdn/hardware/mISDN/w6692.c
@@ -802,7 +802,7 @@ w6692_irq(int intno, void *dev_id)
 static void
 dbusy_timer_handler(struct timer_list *t)
 {
-	struct dchannel *dch = from_timer(dch, t, timer);
+	struct dchannel *dch = timer_container_of(dch, t, timer);
 	struct w6692_hw	*card = dch->hw;
 	int		rbch, star;
 	u_long		flags;
diff --git a/drivers/isdn/mISDN/dsp_tones.c b/drivers/isdn/mISDN/dsp_tones.c
index 456b313bfa76..fa7813ae8d97 100644
--- a/drivers/isdn/mISDN/dsp_tones.c
+++ b/drivers/isdn/mISDN/dsp_tones.c
@@ -459,7 +459,7 @@ dsp_tone_hw_message(struct dsp *dsp, u8 *sample, int len)
 void
 dsp_tone_timeout(struct timer_list *t)
 {
-	struct dsp *dsp = from_timer(dsp, t, tone.tl);
+	struct dsp *dsp = timer_container_of(dsp, t, tone.tl);
 	struct dsp_tone *tone = &dsp->tone;
 	struct pattern *pat = (struct pattern *)tone->pattern;
 	int index = tone->index;
diff --git a/drivers/isdn/mISDN/fsm.c b/drivers/isdn/mISDN/fsm.c
index 5ed0a6110687..825b686496d2 100644
--- a/drivers/isdn/mISDN/fsm.c
+++ b/drivers/isdn/mISDN/fsm.c
@@ -95,7 +95,7 @@ EXPORT_SYMBOL(mISDN_FsmChangeState);
 static void
 FsmExpireTimer(struct timer_list *t)
 {
-	struct FsmTimer *ft = from_timer(ft, t, tl);
+	struct FsmTimer *ft = timer_container_of(ft, t, tl);
 #if FSM_TIMER_DEBUG
 	if (ft->fi->debug)
 		ft->fi->printdebug(ft->fi, "FsmExpireTimer %lx", (long) ft);
diff --git a/drivers/isdn/mISDN/l1oip_core.c b/drivers/isdn/mISDN/l1oip_core.c
index a5ad88a960d0..16226a280c02 100644
--- a/drivers/isdn/mISDN/l1oip_core.c
+++ b/drivers/isdn/mISDN/l1oip_core.c
@@ -822,7 +822,7 @@ l1oip_send_bh(struct work_struct *work)
 static void
 l1oip_keepalive(struct timer_list *t)
 {
-	struct l1oip *hc = from_timer(hc, t, keep_tl);
+	struct l1oip *hc = timer_container_of(hc, t, keep_tl);
 
 	schedule_work(&hc->workq);
 }
@@ -830,7 +830,7 @@ l1oip_keepalive(struct timer_list *t)
 static void
 l1oip_timeout(struct timer_list *t)
 {
-	struct l1oip			*hc = from_timer(hc, t,
+	struct l1oip			*hc = timer_container_of(hc, t,
 								  timeout_tl);
 	struct dchannel		*dch = hc->chan[hc->d_idx].dch;
 
diff --git a/drivers/isdn/mISDN/timerdev.c b/drivers/isdn/mISDN/timerdev.c
index 7cfa8c61dba0..df98144a9539 100644
--- a/drivers/isdn/mISDN/timerdev.c
+++ b/drivers/isdn/mISDN/timerdev.c
@@ -155,7 +155,7 @@ mISDN_poll(struct file *filep, poll_table *wait)
 static void
 dev_expire_timer(struct timer_list *t)
 {
-	struct mISDNtimer *timer = from_timer(timer, t, tl);
+	struct mISDNtimer *timer = timer_container_of(timer, t, tl);
 	u_long			flags;
 
 	spin_lock_irqsave(&timer->dev->lock, flags);
diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
index 32ba397a33d2..6af0d2c7fc56 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -165,7 +165,7 @@ static const struct led_flash_ops rt8515_flash_ops = {
 
 static void rt8515_powerdown_timer(struct timer_list *t)
 {
-	struct rt8515 *rt = from_timer(rt, t, powerdown_timer);
+	struct rt8515 *rt = timer_container_of(rt, t, powerdown_timer);
 
 	/* Turn the LED off */
 	rt8515_gpio_led_off(rt);
diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index 48fb8a9ec703..3e83200675f2 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -135,7 +135,7 @@ static int sgm3140_brightness_set(struct led_classdev *led_cdev,
 
 static void sgm3140_powerdown_timer(struct timer_list *t)
 {
-	struct sgm3140 *priv = from_timer(priv, t, powerdown_timer);
+	struct sgm3140 *priv = timer_container_of(priv, t, powerdown_timer);
 
 	gpiod_set_value(priv->enable_gpio, 0);
 	gpiod_set_value(priv->flash_gpio, 0);
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 907fc703e0c5..bd451c77ce4d 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -64,7 +64,7 @@ static int __led_set_brightness_blocking(struct led_classdev *led_cdev, unsigned
 
 static void led_timer_function(struct timer_list *t)
 {
-	struct led_classdev *led_cdev = from_timer(led_cdev, t, blink_timer);
+	struct led_classdev *led_cdev = timer_container_of(led_cdev, t, blink_timer);
 	unsigned long brightness;
 	unsigned long delay;
 
diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigger/ledtrig-activity.c
index b3ee33aed36e..1bccaef5eddf 100644
--- a/drivers/leds/trigger/ledtrig-activity.c
+++ b/drivers/leds/trigger/ledtrig-activity.c
@@ -32,7 +32,7 @@ struct activity_data {
 
 static void led_activity_function(struct timer_list *t)
 {
-	struct activity_data *activity_data = from_timer(activity_data, t,
+	struct activity_data *activity_data = timer_container_of(activity_data, t,
 							 timer);
 	struct led_classdev *led_cdev = activity_data->led_cdev;
 	unsigned int target;
diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
index 393b3ae832f4..40eb61b6d54e 100644
--- a/drivers/leds/trigger/ledtrig-heartbeat.c
+++ b/drivers/leds/trigger/ledtrig-heartbeat.c
@@ -33,7 +33,7 @@ struct heartbeat_trig_data {
 static void led_heartbeat_function(struct timer_list *t)
 {
 	struct heartbeat_trig_data *heartbeat_data =
-		from_timer(heartbeat_data, t, timer);
+		timer_container_of(heartbeat_data, t, timer);
 	struct led_classdev *led_cdev;
 	unsigned long brightness = LED_OFF;
 	unsigned long delay = 0;
diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
index 06d052957d37..9af3c18f14f4 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -150,7 +150,7 @@ static void pattern_trig_timer_common_function(struct pattern_trig_data *data)
 
 static void pattern_trig_timer_function(struct timer_list *t)
 {
-	struct pattern_trig_data *data = from_timer(data, t, timer);
+	struct pattern_trig_data *data = timer_container_of(data, t, timer);
 
 	return pattern_trig_timer_common_function(data);
 }
diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
index e103c7ed830b..20f1351464b1 100644
--- a/drivers/leds/trigger/ledtrig-transient.c
+++ b/drivers/leds/trigger/ledtrig-transient.c
@@ -32,7 +32,7 @@ struct transient_trig_data {
 static void transient_timer_function(struct timer_list *t)
 {
 	struct transient_trig_data *transient_data =
-		from_timer(transient_data, t, timer);
+		timer_container_of(transient_data, t, timer);
 	struct led_classdev *led_cdev = transient_data->led_cdev;
 
 	transient_data->activate = 0;
diff --git a/drivers/mailbox/mailbox-altera.c b/drivers/mailbox/mailbox-altera.c
index 748128661892..17278c2571d3 100644
--- a/drivers/mailbox/mailbox-altera.c
+++ b/drivers/mailbox/mailbox-altera.c
@@ -130,7 +130,7 @@ static void altera_mbox_rx_data(struct mbox_chan *chan)
 
 static void altera_mbox_poll_rx(struct timer_list *t)
 {
-	struct altera_mbox *mbox = from_timer(mbox, t, rxpoll_timer);
+	struct altera_mbox *mbox = timer_container_of(mbox, t, rxpoll_timer);
 
 	altera_mbox_rx_data(mbox->chan);
 
diff --git a/drivers/md/bcache/stats.c b/drivers/md/bcache/stats.c
index d39dec34b7a3..0056106495a7 100644
--- a/drivers/md/bcache/stats.c
+++ b/drivers/md/bcache/stats.c
@@ -149,7 +149,7 @@ static void scale_stats(struct cache_stats *stats, unsigned long rescale_at)
 
 static void scale_accounting(struct timer_list *t)
 {
-	struct cache_accounting *acc = from_timer(acc, t, timer);
+	struct cache_accounting *acc = timer_container_of(acc, t, timer);
 
 #define move_stat(name) do {						\
 	unsigned int t = atomic_xchg(&acc->collector.name, 0);		\
diff --git a/drivers/md/dm-delay.c b/drivers/md/dm-delay.c
index d4cf0ac2a7aa..6f4367944584 100644
--- a/drivers/md/dm-delay.c
+++ b/drivers/md/dm-delay.c
@@ -52,7 +52,7 @@ struct dm_delay_info {
 
 static void handle_delayed_timer(struct timer_list *t)
 {
-	struct delay_c *dc = from_timer(dc, t, delay_timer);
+	struct delay_c *dc = timer_container_of(dc, t, delay_timer);
 
 	queue_work(dc->kdelayd_wq, &dc->flush_expired_bios);
 }
diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 2a283feb3319..e90cfcef96f4 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -1540,7 +1540,7 @@ static void sleep_on_endio_wait(struct dm_integrity_c *ic)
 
 static void autocommit_fn(struct timer_list *t)
 {
-	struct dm_integrity_c *ic = from_timer(ic, t, autocommit_timer);
+	struct dm_integrity_c *ic = timer_container_of(ic, t, autocommit_timer);
 
 	if (likely(!dm_integrity_failed(ic)))
 		queue_work(ic->commit_wq, &ic->commit_work);
diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index 6c98f4ae5ea9..ff55a5e4f5c9 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -787,7 +787,7 @@ static int queue_if_no_path(struct multipath *m, bool f_queue_if_no_path,
  */
 static void queue_if_no_path_timeout_work(struct timer_list *t)
 {
-	struct multipath *m = from_timer(m, t, nopath_timer);
+	struct multipath *m = timer_container_of(m, t, nopath_timer);
 
 	DMWARN("queue_if_no_path timeout on %s, failing queued IO",
 	       dm_table_device_name(m->ti->table));
diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
index 9e615b4f1f5e..d2b73e7bc9cd 100644
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@ -103,7 +103,7 @@ static void wakeup_mirrord(void *context)
 
 static void delayed_wake_fn(struct timer_list *t)
 {
-	struct mirror_set *ms = from_timer(ms, t, timer);
+	struct mirror_set *ms = timer_container_of(ms, t, timer);
 
 	clear_bit(0, &ms->timer_pending);
 	wakeup_mirrord(ms);
diff --git a/drivers/md/dm-vdo/dedupe.c b/drivers/md/dm-vdo/dedupe.c
index 3c58b941e067..4d983092a152 100644
--- a/drivers/md/dm-vdo/dedupe.c
+++ b/drivers/md/dm-vdo/dedupe.c
@@ -2337,7 +2337,7 @@ static void timeout_index_operations_callback(struct vdo_completion *completion)
 
 static void timeout_index_operations(struct timer_list *t)
 {
-	struct hash_zone *zone = from_timer(zone, t, timer);
+	struct hash_zone *zone = timer_container_of(zone, t, timer);
 
 	if (change_timer_state(zone, DEDUPE_QUERY_TIMER_RUNNING,
 			       DEDUPE_QUERY_TIMER_FIRED))
diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index d6a04a57472d..a428e1cacf07 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -706,7 +706,7 @@ static inline void writecache_verify_watermark(struct dm_writecache *wc)
 
 static void writecache_max_age_timer(struct timer_list *t)
 {
-	struct dm_writecache *wc = from_timer(wc, t, max_age_timer);
+	struct dm_writecache *wc = timer_container_of(wc, t, max_age_timer);
 
 	if (!dm_suspended(wc->ti) && !writecache_has_error(wc)) {
 		queue_work(wc->writeback_wq, &wc->writeback_work);
@@ -866,7 +866,7 @@ static void writecache_flush_work(struct work_struct *work)
 
 static void writecache_autocommit_timer(struct timer_list *t)
 {
-	struct dm_writecache *wc = from_timer(wc, t, autocommit_timer);
+	struct dm_writecache *wc = timer_container_of(wc, t, autocommit_timer);
 
 	if (!writecache_has_error(wc))
 		queue_work(wc->writeback_wq, &wc->flush_work);
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 9daa78c5fe33..b4a845e29f28 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5995,7 +5995,7 @@ static int add_named_array(const char *val, const struct kernel_param *kp)
 
 static void md_safemode_timeout(struct timer_list *t)
 {
-	struct mddev *mddev = from_timer(mddev, t, safemode_timer);
+	struct mddev *mddev = timer_container_of(mddev, t, safemode_timer);
 
 	mddev->safemode = 1;
 	if (mddev->external)
diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index 2952678cce45..9d0362a75ecd 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -153,7 +153,7 @@ void saa7146_buffer_next(struct saa7146_dev *dev,
 
 void saa7146_buffer_timeout(struct timer_list *t)
 {
-	struct saa7146_dmaqueue *q = from_timer(q, t, timeout);
+	struct saa7146_dmaqueue *q = timer_container_of(q, t, timeout);
 	struct saa7146_dev *dev = q->dev;
 	unsigned long flags;
 
diff --git a/drivers/media/common/saa7146/saa7146_vbi.c b/drivers/media/common/saa7146/saa7146_vbi.c
index 6c324a683be9..1ffcc025d1a4 100644
--- a/drivers/media/common/saa7146/saa7146_vbi.c
+++ b/drivers/media/common/saa7146/saa7146_vbi.c
@@ -330,7 +330,7 @@ static void vbi_stop(struct saa7146_dev *dev)
 
 static void vbi_read_timeout(struct timer_list *t)
 {
-	struct saa7146_vv *vv = from_timer(vv, t, vbi_read_timeout);
+	struct saa7146_vv *vv = timer_container_of(vv, t, vbi_read_timeout);
 	struct saa7146_dev *dev = vv->vbi_dmaq.dev;
 
 	DEB_VBI("dev:%p\n", dev);
diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 1e985f943944..8fb5989ec31a 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -352,7 +352,7 @@ static int dvb_dmxdev_set_buffer_size(struct dmxdev_filter *dmxdevfilter,
 
 static void dvb_dmxdev_filter_timeout(struct timer_list *t)
 {
-	struct dmxdev_filter *dmxdevfilter = from_timer(dmxdevfilter, t, timer);
+	struct dmxdev_filter *dmxdevfilter = timer_container_of(dmxdevfilter, t, timer);
 
 	dmxdevfilter->buffer.error = -ETIMEDOUT;
 	spin_lock_irq(&dmxdevfilter->dev->lock);
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 2d5f42f11158..88027cbc3e61 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1501,7 +1501,7 @@ static irqreturn_t tc358743_irq_handler(int irq, void *dev_id)
 
 static void tc358743_irq_poll_timer(struct timer_list *t)
 {
-	struct tc358743_state *state = from_timer(state, t, timer);
+	struct tc358743_state *state = timer_container_of(state, t, timer);
 	unsigned int msecs;
 
 	schedule_work(&state->work_i2c_poll);
diff --git a/drivers/media/i2c/tvaudio.c b/drivers/media/i2c/tvaudio.c
index 42115118a0bd..6267e9ad39c0 100644
--- a/drivers/media/i2c/tvaudio.c
+++ b/drivers/media/i2c/tvaudio.c
@@ -318,7 +318,7 @@ static int chip_cmd(struct CHIPSTATE *chip, char *name, audiocmd *cmd)
 
 static void chip_thread_wake(struct timer_list *t)
 {
-	struct CHIPSTATE *chip = from_timer(chip, t, wt);
+	struct CHIPSTATE *chip = timer_container_of(chip, t, wt);
 	wake_up_process(chip->thread);
 }
 
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 377a7e7f0499..9ce67f515843 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -2798,7 +2798,7 @@ bttv_irq_wakeup_vbi(struct bttv *btv, struct bttv_buffer *wakeup,
 
 static void bttv_irq_timeout(struct timer_list *t)
 {
-	struct bttv *btv = from_timer(btv, t, timeout);
+	struct bttv *btv = timer_container_of(btv, t, timeout);
 	struct bttv_buffer_set old,new;
 	struct bttv_buffer *ovbi;
 	struct bttv_buffer *item;
diff --git a/drivers/media/pci/bt8xx/bttv-input.c b/drivers/media/pci/bt8xx/bttv-input.c
index 9eb7a5356b4c..84aa269248fd 100644
--- a/drivers/media/pci/bt8xx/bttv-input.c
+++ b/drivers/media/pci/bt8xx/bttv-input.c
@@ -126,7 +126,7 @@ void bttv_input_irq(struct bttv *btv)
 
 static void bttv_input_timer(struct timer_list *t)
 {
-	struct bttv_ir *ir = from_timer(ir, t, timer);
+	struct bttv_ir *ir = timer_container_of(ir, t, timer);
 	struct bttv *btv = ir->btv;
 
 	if (btv->c.type == BTTV_BOARD_ENLTV_FM_2)
@@ -182,7 +182,7 @@ static u32 bttv_rc5_decode(unsigned int code)
 
 static void bttv_rc5_timer_end(struct timer_list *t)
 {
-	struct bttv_ir *ir = from_timer(ir, t, timer);
+	struct bttv_ir *ir = timer_container_of(ir, t, timer);
 	ktime_t tv;
 	u32 gap, rc5, scancode;
 	u8 toggle, command, system;
diff --git a/drivers/media/pci/cx18/cx18-fileops.c b/drivers/media/pci/cx18/cx18-fileops.c
index 7e742733391b..315577d71d95 100644
--- a/drivers/media/pci/cx18/cx18-fileops.c
+++ b/drivers/media/pci/cx18/cx18-fileops.c
@@ -628,7 +628,7 @@ __poll_t cx18_v4l2_enc_poll(struct file *filp, poll_table *wait)
 
 void cx18_vb_timeout(struct timer_list *t)
 {
-	struct cx18_stream *s = from_timer(s, t, vb_timeout);
+	struct cx18_stream *s = timer_container_of(s, t, vb_timeout);
 
 	/*
 	 * Return all of the buffers in error state, so the vbi/vid inode
diff --git a/drivers/media/pci/ivtv/ivtv-irq.c b/drivers/media/pci/ivtv/ivtv-irq.c
index b3b670b6ef70..748c14e87963 100644
--- a/drivers/media/pci/ivtv/ivtv-irq.c
+++ b/drivers/media/pci/ivtv/ivtv-irq.c
@@ -1064,7 +1064,7 @@ irqreturn_t ivtv_irq_handler(int irq, void *dev_id)
 
 void ivtv_unfinished_dma(struct timer_list *t)
 {
-	struct ivtv *itv = from_timer(itv, t, dma_timer);
+	struct ivtv *itv = timer_container_of(itv, t, dma_timer);
 
 	if (!test_bit(IVTV_F_I_DMA, &itv->i_flags))
 		return;
diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
index 16338d13d9c8..9f2ac33cffa7 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -637,7 +637,7 @@ static void netup_unidvb_queue_cleanup(struct netup_dma *dma)
 
 static void netup_unidvb_dma_timeout(struct timer_list *t)
 {
-	struct netup_dma *dma = from_timer(dma, t, timeout);
+	struct netup_dma *dma = timer_container_of(dma, t, timeout);
 	struct netup_unidvb_dev *ndev = dma->ndev;
 
 	dev_dbg(&ndev->pci_dev->dev, "%s()\n", __func__);
diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index 84295bdb8ce4..537aa65acdc8 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -328,7 +328,7 @@ void saa7134_buffer_next(struct saa7134_dev *dev,
 
 void saa7134_buffer_timeout(struct timer_list *t)
 {
-	struct saa7134_dmaqueue *q = from_timer(q, t, timeout);
+	struct saa7134_dmaqueue *q = timer_container_of(q, t, timeout);
 	struct saa7134_dev *dev = q->dev;
 	unsigned long flags;
 
diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
index d7d97c7d4a2b..468dbe8d552f 100644
--- a/drivers/media/pci/saa7134/saa7134-input.c
+++ b/drivers/media/pci/saa7134/saa7134-input.c
@@ -431,7 +431,7 @@ void saa7134_input_irq(struct saa7134_dev *dev)
 
 static void saa7134_input_timer(struct timer_list *t)
 {
-	struct saa7134_card_ir *ir = from_timer(ir, t, timer);
+	struct saa7134_card_ir *ir = timer_container_of(ir, t, timer);
 	struct saa7134_dev *dev = ir->dev->priv;
 
 	build_key(dev);
diff --git a/drivers/media/pci/tw686x/tw686x-core.c b/drivers/media/pci/tw686x/tw686x-core.c
index 80bd268926cc..f39e0e34deb6 100644
--- a/drivers/media/pci/tw686x/tw686x-core.c
+++ b/drivers/media/pci/tw686x/tw686x-core.c
@@ -125,7 +125,7 @@ void tw686x_enable_channel(struct tw686x_dev *dev, unsigned int channel)
  */
 static void tw686x_dma_delay(struct timer_list *t)
 {
-	struct tw686x_dev *dev = from_timer(dev, t, dma_delay_timer);
+	struct tw686x_dev *dev = timer_container_of(dev, t, dma_delay_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->lock, flags);
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index c8e0ee383af3..e571042023e5 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -143,7 +143,7 @@ void s5p_mfc_cleanup_queue(struct list_head *lh, struct vb2_queue *vq)
 
 static void s5p_mfc_watchdog(struct timer_list *t)
 {
-	struct s5p_mfc_dev *dev = from_timer(dev, t, watchdog_timer);
+	struct s5p_mfc_dev *dev = timer_container_of(dev, t, watchdog_timer);
 
 	if (test_bit(0, &dev->hw_lock))
 		atomic_inc(&dev->watchdog_cnt);
diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index 87a817dda4a9..602c37cbe177 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -62,7 +62,7 @@ static int load_c8sectpfe_fw(struct c8sectpfei *fei);
 
 static void c8sectpfe_timer_interrupt(struct timer_list *t)
 {
-	struct c8sectpfei *fei = from_timer(fei, t, timer);
+	struct c8sectpfei *fei = timer_container_of(fei, t, timer);
 	struct channel_info *channel;
 	int chan_num;
 
diff --git a/drivers/media/radio/radio-cadet.c b/drivers/media/radio/radio-cadet.c
index 2ddf1dfa0522..5110754e1a31 100644
--- a/drivers/media/radio/radio-cadet.c
+++ b/drivers/media/radio/radio-cadet.c
@@ -284,7 +284,7 @@ static bool cadet_has_rds_data(struct cadet *dev)
 
 static void cadet_handler(struct timer_list *t)
 {
-	struct cadet *dev = from_timer(dev, t, readtimer);
+	struct cadet *dev = timer_container_of(dev, t, readtimer);
 
 	/* Service the RDS fifo */
 	if (mutex_trylock(&dev->lock)) {
diff --git a/drivers/media/rc/ene_ir.c b/drivers/media/rc/ene_ir.c
index 9435cba3f4d9..d6c54a3bccc2 100644
--- a/drivers/media/rc/ene_ir.c
+++ b/drivers/media/rc/ene_ir.c
@@ -659,7 +659,7 @@ static void ene_tx_sample(struct ene_device *dev)
 /* timer to simulate tx done interrupt */
 static void ene_tx_irqsim(struct timer_list *t)
 {
-	struct ene_device *dev = from_timer(dev, t, tx_sim_timer);
+	struct ene_device *dev = timer_container_of(dev, t, tx_sim_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->hw_lock, flags);
diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index bfe86588c69b..e034c93d57cf 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -131,7 +131,7 @@ static void igorplugusb_cmd(struct igorplugusb *ir, int cmd)
 
 static void igorplugusb_timer(struct timer_list *t)
 {
-	struct igorplugusb *ir = from_timer(ir, t, timer);
+	struct igorplugusb *ir = timer_container_of(ir, t, timer);
 
 	igorplugusb_cmd(ir, GET_INFRACODE);
 }
diff --git a/drivers/media/rc/img-ir/img-ir-hw.c b/drivers/media/rc/img-ir/img-ir-hw.c
index da89ddf771c3..426b3f21cbad 100644
--- a/drivers/media/rc/img-ir/img-ir-hw.c
+++ b/drivers/media/rc/img-ir/img-ir-hw.c
@@ -865,7 +865,7 @@ static void img_ir_handle_data(struct img_ir_priv *priv, u32 len, u64 raw)
 /* timer function to end waiting for repeat. */
 static void img_ir_end_timer(struct timer_list *t)
 {
-	struct img_ir_priv *priv = from_timer(priv, t, hw.end_timer);
+	struct img_ir_priv *priv = timer_container_of(priv, t, hw.end_timer);
 
 	spin_lock_irq(&priv->lock);
 	img_ir_end_repeat(priv);
@@ -879,7 +879,7 @@ static void img_ir_end_timer(struct timer_list *t)
  */
 static void img_ir_suspend_timer(struct timer_list *t)
 {
-	struct img_ir_priv *priv = from_timer(priv, t, hw.suspend_timer);
+	struct img_ir_priv *priv = timer_container_of(priv, t, hw.suspend_timer);
 
 	spin_lock_irq(&priv->lock);
 	/*
diff --git a/drivers/media/rc/img-ir/img-ir-raw.c b/drivers/media/rc/img-ir/img-ir-raw.c
index 669f3309e237..92fb7b555a0f 100644
--- a/drivers/media/rc/img-ir/img-ir-raw.c
+++ b/drivers/media/rc/img-ir/img-ir-raw.c
@@ -65,7 +65,7 @@ void img_ir_isr_raw(struct img_ir_priv *priv, u32 irq_status)
  */
 static void img_ir_echo_timer(struct timer_list *t)
 {
-	struct img_ir_priv *priv = from_timer(priv, t, raw.timer);
+	struct img_ir_priv *priv = timer_container_of(priv, t, raw.timer);
 
 	spin_lock_irq(&priv->lock);
 
diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index cb6f36ebe5c8..f5221b018808 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -1091,7 +1091,7 @@ static void usb_tx_callback(struct urb *urb)
  */
 static void imon_touch_display_timeout(struct timer_list *t)
 {
-	struct imon_context *ictx = from_timer(ictx, t, ttimer);
+	struct imon_context *ictx = timer_container_of(ictx, t, ttimer);
 
 	if (ictx->display_type != IMON_DISPLAY_TYPE_VGA)
 		return;
diff --git a/drivers/media/rc/ir-mce_kbd-decoder.c b/drivers/media/rc/ir-mce_kbd-decoder.c
index 817030fb50c9..f19da3231cc4 100644
--- a/drivers/media/rc/ir-mce_kbd-decoder.c
+++ b/drivers/media/rc/ir-mce_kbd-decoder.c
@@ -109,7 +109,7 @@ static unsigned char kbd_keycodes[256] = {
 
 static void mce_kbd_rx_timeout(struct timer_list *t)
 {
-	struct ir_raw_event_ctrl *raw = from_timer(raw, t, mce_kbd.rx_timeout);
+	struct ir_raw_event_ctrl *raw = timer_container_of(raw, t, mce_kbd.rx_timeout);
 	unsigned char maskcode;
 	unsigned long flags;
 	int i;
diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index aa4ac43c66fa..7f4a17efc985 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -552,7 +552,7 @@ EXPORT_SYMBOL(ir_raw_encode_scancode);
  */
 static void ir_raw_edge_handle(struct timer_list *t)
 {
-	struct ir_raw_event_ctrl *raw = from_timer(raw, t, edge_handle);
+	struct ir_raw_event_ctrl *raw = timer_container_of(raw, t, edge_handle);
 	struct rc_dev *dev = raw->dev;
 	unsigned long flags;
 	ktime_t interval;
diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index e46358fb8ac0..b9bf5cdcde4a 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -674,7 +674,7 @@ EXPORT_SYMBOL_GPL(rc_keyup);
  */
 static void ir_timer_keyup(struct timer_list *t)
 {
-	struct rc_dev *dev = from_timer(dev, t, timer_keyup);
+	struct rc_dev *dev = timer_container_of(dev, t, timer_keyup);
 	unsigned long flags;
 
 	/*
@@ -703,7 +703,7 @@ static void ir_timer_keyup(struct timer_list *t)
  */
 static void ir_timer_repeat(struct timer_list *t)
 {
-	struct rc_dev *dev = from_timer(dev, t, timer_repeat);
+	struct rc_dev *dev = timer_container_of(dev, t, timer_repeat);
 	struct input_dev *input = dev->input_dev;
 	unsigned long flags;
 
diff --git a/drivers/media/usb/au0828/au0828-dvb.c b/drivers/media/usb/au0828/au0828-dvb.c
index 3666f4452d11..5d0447ff7d06 100644
--- a/drivers/media/usb/au0828/au0828-dvb.c
+++ b/drivers/media/usb/au0828/au0828-dvb.c
@@ -97,7 +97,7 @@ static void au0828_restart_dvb_streaming(struct work_struct *work);
 
 static void au0828_bulk_timeout(struct timer_list *t)
 {
-	struct au0828_dev *dev = from_timer(dev, t, bulk_timeout);
+	struct au0828_dev *dev = timer_container_of(dev, t, bulk_timeout);
 
 	dprintk(1, "%s called\n", __func__);
 	dev->bulk_timeout_running = 0;
diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index 33d1fad0f7b8..e5dff969ed57 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -948,7 +948,7 @@ int au0828_analog_unregister(struct au0828_dev *dev)
    such as tvtime from hanging) */
 static void au0828_vid_buffer_timeout(struct timer_list *t)
 {
-	struct au0828_dev *dev = from_timer(dev, t, vid_timeout);
+	struct au0828_dev *dev = timer_container_of(dev, t, vid_timeout);
 	struct au0828_dmaqueue *dma_q = &dev->vidq;
 	struct au0828_buffer *buf;
 	unsigned char *vid_data;
@@ -972,7 +972,7 @@ static void au0828_vid_buffer_timeout(struct timer_list *t)
 
 static void au0828_vbi_buffer_timeout(struct timer_list *t)
 {
-	struct au0828_dev *dev = from_timer(dev, t, vbi_timeout);
+	struct au0828_dev *dev = timer_container_of(dev, t, vbi_timeout);
 	struct au0828_dmaqueue *dma_q = &dev->vbiq;
 	struct au0828_buffer *buf;
 	unsigned char *vbi_data;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 9a583eeaa329..9ae5eee5ed62 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -3562,7 +3562,7 @@ struct hdw_timer {
 
 static void pvr2_ctl_timeout(struct timer_list *t)
 {
-	struct hdw_timer *timer = from_timer(timer, t, timer);
+	struct hdw_timer *timer = timer_container_of(timer, t, timer);
 	struct pvr2_hdw *hdw = timer->hdw;
 
 	if (hdw->ctl_write_pend_flag || hdw->ctl_read_pend_flag) {
@@ -4421,7 +4421,7 @@ static int state_eval_encoder_run(struct pvr2_hdw *hdw)
 /* Timeout function for quiescent timer. */
 static void pvr2_hdw_quiescent_timeout(struct timer_list *t)
 {
-	struct pvr2_hdw *hdw = from_timer(hdw, t, quiescent_timer);
+	struct pvr2_hdw *hdw = timer_container_of(hdw, t, quiescent_timer);
 	hdw->state_decoder_quiescent = !0;
 	trace_stbit("state_decoder_quiescent",hdw->state_decoder_quiescent);
 	hdw->state_stale = !0;
@@ -4432,7 +4432,7 @@ static void pvr2_hdw_quiescent_timeout(struct timer_list *t)
 /* Timeout function for decoder stabilization timer. */
 static void pvr2_hdw_decoder_stabilization_timeout(struct timer_list *t)
 {
-	struct pvr2_hdw *hdw = from_timer(hdw, t, decoder_stabilization_timer);
+	struct pvr2_hdw *hdw = timer_container_of(hdw, t, decoder_stabilization_timer);
 	hdw->state_decoder_ready = !0;
 	trace_stbit("state_decoder_ready", hdw->state_decoder_ready);
 	hdw->state_stale = !0;
@@ -4443,7 +4443,7 @@ static void pvr2_hdw_decoder_stabilization_timeout(struct timer_list *t)
 /* Timeout function for encoder wait timer. */
 static void pvr2_hdw_encoder_wait_timeout(struct timer_list *t)
 {
-	struct pvr2_hdw *hdw = from_timer(hdw, t, encoder_wait_timer);
+	struct pvr2_hdw *hdw = timer_container_of(hdw, t, encoder_wait_timer);
 	hdw->state_encoder_waitok = !0;
 	trace_stbit("state_encoder_waitok",hdw->state_encoder_waitok);
 	hdw->state_stale = !0;
@@ -4454,7 +4454,7 @@ static void pvr2_hdw_encoder_wait_timeout(struct timer_list *t)
 /* Timeout function for encoder run timer. */
 static void pvr2_hdw_encoder_run_timeout(struct timer_list *t)
 {
-	struct pvr2_hdw *hdw = from_timer(hdw, t, encoder_run_timer);
+	struct pvr2_hdw *hdw = timer_container_of(hdw, t, encoder_run_timer);
 	if (!hdw->state_encoder_runok) {
 		hdw->state_encoder_runok = !0;
 		trace_stbit("state_encoder_runok",hdw->state_encoder_runok);
diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 899a7a67e2ba..8332f2c5aed7 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -471,7 +471,7 @@ static void s2255_reset_dsppower(struct s2255_dev *dev)
  */
 static void s2255_timer(struct timer_list *t)
 {
-	struct s2255_dev *dev = from_timer(dev, t, timer);
+	struct s2255_dev *dev = timer_container_of(dev, t, timer);
 	struct s2255_fw *data = dev->fw_data;
 	if (usb_submit_urb(data->fw_urb, GFP_ATOMIC) < 0) {
 		pr_err("s2255: can't submit urb\n");
diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index e63f62690571..f12be641959a 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -558,7 +558,7 @@ tegra210_emc_table_register_offsets = {
 
 static void tegra210_emc_train(struct timer_list *timer)
 {
-	struct tegra210_emc *emc = from_timer(emc, timer, training);
+	struct tegra210_emc *emc = timer_container_of(emc, timer, training);
 	unsigned long flags;
 
 	if (!emc->last)
@@ -614,7 +614,7 @@ static unsigned int tegra210_emc_get_temperature(struct tegra210_emc *emc)
 
 static void tegra210_emc_poll_refresh(struct timer_list *timer)
 {
-	struct tegra210_emc *emc = from_timer(emc, timer, refresh_timer);
+	struct tegra210_emc *emc = timer_container_of(emc, timer, refresh_timer);
 	unsigned int temperature;
 
 	if (!emc->debugfs.temperature)
diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 7dc2c9987982..d34892782f6e 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1498,7 +1498,7 @@ static int msb_ftl_scan(struct msb_data *msb)
 
 static void msb_cache_flush_timer(struct timer_list *t)
 {
-	struct msb_data *msb = from_timer(msb, t, cache_flush_timer);
+	struct msb_data *msb = timer_container_of(msb, t, cache_flush_timer);
 
 	msb->need_flush_cache = true;
 	queue_work(msb->io_queue, &msb->io_work);
diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x_ms.c
index a5a9bb3f16be..cddddb3a5a27 100644
--- a/drivers/memstick/host/jmb38x_ms.c
+++ b/drivers/memstick/host/jmb38x_ms.c
@@ -590,7 +590,7 @@ static irqreturn_t jmb38x_ms_isr(int irq, void *dev_id)
 
 static void jmb38x_ms_abort(struct timer_list *t)
 {
-	struct jmb38x_ms_host *host = from_timer(host, t, timer);
+	struct jmb38x_ms_host *host = timer_container_of(host, t, timer);
 	struct memstick_host *msh = host->msh;
 	unsigned long flags;
 
diff --git a/drivers/memstick/host/r592.c b/drivers/memstick/host/r592.c
index 488ef8eecb26..605b2265536f 100644
--- a/drivers/memstick/host/r592.c
+++ b/drivers/memstick/host/r592.c
@@ -614,7 +614,7 @@ static void r592_update_card_detect(struct r592_device *dev)
 /* Timer routine that fires 1 second after last card detection event, */
 static void r592_detect_timer(struct timer_list *t)
 {
-	struct r592_device *dev = from_timer(dev, t, detect_timer);
+	struct r592_device *dev = timer_container_of(dev, t, detect_timer);
 	r592_update_card_detect(dev);
 	memstick_detect_change(dev->host);
 }
diff --git a/drivers/memstick/host/tifm_ms.c b/drivers/memstick/host/tifm_ms.c
index 676348eee015..db7f3a088fb0 100644
--- a/drivers/memstick/host/tifm_ms.c
+++ b/drivers/memstick/host/tifm_ms.c
@@ -535,7 +535,7 @@ static int tifm_ms_set_param(struct memstick_host *msh,
 
 static void tifm_ms_abort(struct timer_list *t)
 {
-	struct tifm_ms *host = from_timer(host, t, timer);
+	struct tifm_ms *host = timer_container_of(host, t, timer);
 
 	dev_dbg(&host->dev->dev, "status %x\n",
 		readl(host->dev->addr + SOCK_MS_STATUS));
diff --git a/drivers/misc/bcm-vk/bcm_vk_tty.c b/drivers/misc/bcm-vk/bcm_vk_tty.c
index 44a2dd80054d..e6c42b772e96 100644
--- a/drivers/misc/bcm-vk/bcm_vk_tty.c
+++ b/drivers/misc/bcm-vk/bcm_vk_tty.c
@@ -43,7 +43,7 @@ struct bcm_vk_tty_chan {
 
 static void bcm_vk_tty_poll(struct timer_list *t)
 {
-	struct bcm_vk *vk = from_timer(vk, t, serial_timer);
+	struct bcm_vk *vk = timer_container_of(vk, t, serial_timer);
 
 	queue_work(vk->tty_wq_thread, &vk->tty_wq_work);
 	mod_timer(&vk->serial_timer, jiffies + SERIAL_TIMER_VALUE);
diff --git a/drivers/misc/cardreader/rtsx_usb.c b/drivers/misc/cardreader/rtsx_usb.c
index 7314c8d9ae75..148107a4547c 100644
--- a/drivers/misc/cardreader/rtsx_usb.c
+++ b/drivers/misc/cardreader/rtsx_usb.c
@@ -31,7 +31,7 @@ static const struct mfd_cell rtsx_usb_cells[] = {
 
 static void rtsx_usb_sg_timed_out(struct timer_list *t)
 {
-	struct rtsx_ucr *ucr = from_timer(ucr, t, sg_timer);
+	struct rtsx_ucr *ucr = timer_container_of(ucr, t, sg_timer);
 
 	dev_dbg(&ucr->pusb_intf->dev, "%s: sg transfer timed out", __func__);
 	usb_sg_cancel(&ucr->current_sg);
diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
index 697a008c14d3..ef34483ee8e2 100644
--- a/drivers/misc/sgi-xp/xpc_main.c
+++ b/drivers/misc/sgi-xp/xpc_main.c
@@ -164,7 +164,7 @@ struct xpc_arch_operations xpc_arch_ops;
 static void
 xpc_timeout_partition_disengage(struct timer_list *t)
 {
-	struct xpc_partition *part = from_timer(part, t, disengage_timer);
+	struct xpc_partition *part = timer_container_of(part, t, disengage_timer);
 
 	DBUG_ON(time_is_after_jiffies(part->disengage_timeout));
 
diff --git a/drivers/misc/sgi-xp/xpc_partition.c b/drivers/misc/sgi-xp/xpc_partition.c
index d0467010558c..f983885d57e9 100644
--- a/drivers/misc/sgi-xp/xpc_partition.c
+++ b/drivers/misc/sgi-xp/xpc_partition.c
@@ -263,7 +263,7 @@ xpc_get_remote_rp(int nasid, unsigned long *discovered_nasids,
  * to us, we really only need to wait for the other side to disengage from us.
  */
 static int __xpc_partition_disengaged(struct xpc_partition *part,
-				      bool from_timer)
+				      bool timer_container_of)
 {
 	short partid = XPC_PARTID(part);
 	int disengaged;
@@ -290,7 +290,7 @@ static int __xpc_partition_disengaged(struct xpc_partition *part,
 		part->disengage_timeout = 0;
 
 		/* Cancel the timer function if not called from it */
-		if (!from_timer)
+		if (!timer_container_of)
 			timer_delete_sync(&part->disengage_timer);
 
 		DBUG_ON(part->act_state != XPC_P_AS_DEACTIVATING &&
diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index dacb5bd9bb71..f14671ea5716 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -212,7 +212,7 @@ int mmc_retune(struct mmc_host *host)
 
 static void mmc_retune_timer(struct timer_list *t)
 {
-	struct mmc_host *host = from_timer(host, t, retune_timer);
+	struct mmc_host *host = timer_container_of(host, t, retune_timer);
 
 	mmc_retune_needed(host);
 }
diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index 14e981b834b6..2179ea085e84 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -714,7 +714,7 @@ static inline unsigned int atmci_convert_chksize(struct atmel_mci *host,
 
 static void atmci_timeout_timer(struct timer_list *t)
 {
-	struct atmel_mci *host = from_timer(host, t, timer);
+	struct atmel_mci *host = timer_container_of(host, t, timer);
 	struct device *dev = host->dev;
 
 	dev_dbg(dev, "software timeout\n");
@@ -1652,7 +1652,7 @@ static void atmci_command_complete(struct atmel_mci *host,
 
 static void atmci_detect_change(struct timer_list *t)
 {
-	struct atmel_mci_slot	*slot = from_timer(slot, t, detect_timer);
+	struct atmel_mci_slot	*slot = timer_container_of(slot, t, detect_timer);
 	bool			present;
 	bool			present_old;
 
diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 578290015e5b..a291c57893c9 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -3179,7 +3179,7 @@ static void dw_mci_init_dma(struct dw_mci *host)
 
 static void dw_mci_cmd11_timer(struct timer_list *t)
 {
-	struct dw_mci *host = from_timer(host, t, cmd11_timer);
+	struct dw_mci *host = timer_container_of(host, t, cmd11_timer);
 
 	if (host->state != STATE_SENDING_CMD11) {
 		dev_warn(host->dev, "Unexpected CMD11 timeout\n");
@@ -3193,7 +3193,7 @@ static void dw_mci_cmd11_timer(struct timer_list *t)
 
 static void dw_mci_cto_timer(struct timer_list *t)
 {
-	struct dw_mci *host = from_timer(host, t, cto_timer);
+	struct dw_mci *host = timer_container_of(host, t, cto_timer);
 	unsigned long irqflags;
 	u32 pending;
 
@@ -3248,7 +3248,7 @@ static void dw_mci_cto_timer(struct timer_list *t)
 
 static void dw_mci_dto_timer(struct timer_list *t)
 {
-	struct dw_mci *host = from_timer(host, t, dto_timer);
+	struct dw_mci *host = timer_container_of(host, t, dto_timer);
 	unsigned long irqflags;
 	u32 pending;
 
diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index bd1662e275d4..740bcdf92be0 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -641,7 +641,7 @@ static bool jz4740_mmc_read_data(struct jz4740_mmc_host *host,
 
 static void jz4740_mmc_timeout(struct timer_list *t)
 {
-	struct jz4740_mmc_host *host = from_timer(host, t, timeout_timer);
+	struct jz4740_mmc_host *host = timer_container_of(host, t, timeout_timer);
 
 	if (!test_and_clear_bit(0, &host->waiting))
 		return;
diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index e0ae5a0c9670..939f4337bc55 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -467,7 +467,7 @@ static irqreturn_t meson_mx_mmc_irq_thread(int irq, void *irq_data)
 
 static void meson_mx_mmc_timeout(struct timer_list *t)
 {
-	struct meson_mx_mmc_host *host = from_timer(host, t, cmd_timeout);
+	struct meson_mx_mmc_host *host = timer_container_of(host, t, cmd_timeout);
 	unsigned long irqflags;
 	u32 irqc;
 
diff --git a/drivers/mmc/host/mvsdio.c b/drivers/mmc/host/mvsdio.c
index 912ffacbad88..101f36de7b63 100644
--- a/drivers/mmc/host/mvsdio.c
+++ b/drivers/mmc/host/mvsdio.c
@@ -509,7 +509,7 @@ static irqreturn_t mvsd_irq(int irq, void *dev)
 
 static void mvsd_timeout_timer(struct timer_list *t)
 {
-	struct mvsd_host *host = from_timer(host, t, timer);
+	struct mvsd_host *host = timer_container_of(host, t, timer);
 	void __iomem *iobase = host->base;
 	struct mmc_request *mrq;
 	unsigned long flags;
diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index 95d8d40a06a8..e588e24256cc 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -955,7 +955,7 @@ static bool filter(struct dma_chan *chan, void *param)
 
 static void mxcmci_watchdog(struct timer_list *t)
 {
-	struct mxcmci_host *host = from_timer(host, t, watchdog);
+	struct mxcmci_host *host = timer_container_of(host, t, watchdog);
 	struct mmc_request *req = host->req;
 	unsigned int stat = mxcmci_readl(host, MMC_REG_STATUS);
 
diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index c50617d03709..8bc0c4ea2211 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -639,7 +639,7 @@ static void mmc_omap_abort_command(struct work_struct *work)
 static void
 mmc_omap_cmd_timer(struct timer_list *t)
 {
-	struct mmc_omap_host *host = from_timer(host, t, cmd_abort_timer);
+	struct mmc_omap_host *host = timer_container_of(host, t, cmd_abort_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&host->slot_lock, flags);
@@ -655,7 +655,7 @@ mmc_omap_cmd_timer(struct timer_list *t)
 static void
 mmc_omap_clk_timer(struct timer_list *t)
 {
-	struct mmc_omap_host *host = from_timer(host, t, clk_timer);
+	struct mmc_omap_host *host = timer_container_of(host, t, clk_timer);
 
 	mmc_omap_fclk_enable(host, 0);
 }
@@ -879,7 +879,7 @@ void omap_mmc_notify_cover_event(struct device *dev, int num, int is_closed)
 
 static void mmc_omap_cover_timer(struct timer_list *t)
 {
-	struct mmc_omap_slot *slot = from_timer(slot, t, cover_timer);
+	struct mmc_omap_slot *slot = timer_container_of(slot, t, cover_timer);
 	queue_work(system_bh_wq, &slot->cover_bh_work);
 }
 
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 5f78be7ae16d..c6f972636356 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -3245,7 +3245,7 @@ static void sdhci_timeout_timer(struct timer_list *t)
 	struct sdhci_host *host;
 	unsigned long flags;
 
-	host = from_timer(host, t, timer);
+	host = timer_container_of(host, t, timer);
 
 	spin_lock_irqsave(&host->lock, flags);
 
@@ -3267,7 +3267,7 @@ static void sdhci_timeout_data_timer(struct timer_list *t)
 	struct sdhci_host *host;
 	unsigned long flags;
 
-	host = from_timer(host, t, data_timer);
+	host = timer_container_of(host, t, data_timer);
 
 	spin_lock_irqsave(&host->lock, flags);
 
diff --git a/drivers/mmc/host/tifm_sd.c b/drivers/mmc/host/tifm_sd.c
index 713223f2d377..5e5ec92f80e6 100644
--- a/drivers/mmc/host/tifm_sd.c
+++ b/drivers/mmc/host/tifm_sd.c
@@ -777,7 +777,7 @@ static void tifm_sd_end_cmd(struct work_struct *t)
 
 static void tifm_sd_abort(struct timer_list *t)
 {
-	struct tifm_sd *host = from_timer(host, t, timer);
+	struct tifm_sd *host = timer_container_of(host, t, timer);
 
 	pr_err("%s : card failed to respond for a long period of time "
 	       "(%x, %x)\n",
diff --git a/drivers/mmc/host/via-sdmmc.c b/drivers/mmc/host/via-sdmmc.c
index 909d80a02824..9903966c2f54 100644
--- a/drivers/mmc/host/via-sdmmc.c
+++ b/drivers/mmc/host/via-sdmmc.c
@@ -937,7 +937,7 @@ static void via_sdc_timeout(struct timer_list *t)
 	struct via_crdr_mmc_host *sdhost;
 	unsigned long flags;
 
-	sdhost = from_timer(sdhost, t, timer);
+	sdhost = timer_container_of(sdhost, t, timer);
 
 	spin_lock_irqsave(&sdhost->lock, flags);
 
diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index dd71e5b8e1a5..fdf5d23b1427 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -740,7 +740,7 @@ static void vub300_deadwork_thread(struct work_struct *work)
 
 static void vub300_inactivity_timer_expired(struct timer_list *t)
 {				/* softirq */
-	struct vub300_mmc_host *vub300 = from_timer(vub300, t,
+	struct vub300_mmc_host *vub300 = timer_container_of(vub300, t,
 						    inactivity_timer);
 	if (!vub300->interface) {
 		kref_put(&vub300->kref, vub300_delete);
@@ -1180,7 +1180,7 @@ static void send_command(struct vub300_mmc_host *vub300)
  */
 static void vub300_sg_timed_out(struct timer_list *t)
 {
-	struct vub300_mmc_host *vub300 = from_timer(vub300, t,
+	struct vub300_mmc_host *vub300 = timer_container_of(vub300, t,
 						    sg_transfer_timer);
 	vub300->usb_timed_out = 1;
 	usb_sg_cancel(&vub300->sg_request);
diff --git a/drivers/mmc/host/wbsd.c b/drivers/mmc/host/wbsd.c
index d5974b355a5a..2ae787d966de 100644
--- a/drivers/mmc/host/wbsd.c
+++ b/drivers/mmc/host/wbsd.c
@@ -947,7 +947,7 @@ static const struct mmc_host_ops wbsd_ops = {
 
 static void wbsd_reset_ignore(struct timer_list *t)
 {
-	struct wbsd_host *host = from_timer(host, t, ignore_timer);
+	struct wbsd_host *host = timer_container_of(host, t, ignore_timer);
 
 	BUG_ON(host == NULL);
 
diff --git a/drivers/most/most_usb.c b/drivers/most/most_usb.c
index 2199ba821922..cf5be9c449a5 100644
--- a/drivers/most/most_usb.c
+++ b/drivers/most/most_usb.c
@@ -667,7 +667,7 @@ static void hdm_request_netinfo(struct most_interface *iface, int channel,
  */
 static void link_stat_timer_handler(struct timer_list *t)
 {
-	struct most_dev *mdev = from_timer(mdev, t, link_stat_timer);
+	struct most_dev *mdev = timer_container_of(mdev, t, link_stat_timer);
 
 	schedule_work(&mdev->poll_work_obj);
 	mdev->link_stat_timer.expires = jiffies + (2 * HZ);
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index d28d4f1790f5..abc7b186353f 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -993,7 +993,7 @@ static int sm_cache_flush(struct sm_ftl *ftl)
 /* flush timer, runs a second after last write */
 static void sm_cache_flush_timer(struct timer_list *t)
 {
-	struct sm_ftl *ftl = from_timer(ftl, t, timer);
+	struct sm_ftl *ftl = timer_container_of(ftl, t, timer);
 	queue_work(cache_flush_workqueue, &ftl->flush_work);
 }
 
diff --git a/drivers/net/arcnet/arcnet.c b/drivers/net/arcnet/arcnet.c
index 602e6e1adf00..882972604c82 100644
--- a/drivers/net/arcnet/arcnet.c
+++ b/drivers/net/arcnet/arcnet.c
@@ -382,7 +382,7 @@ static void arcdev_setup(struct net_device *dev)
 
 static void arcnet_timer(struct timer_list *t)
 {
-	struct arcnet_local *lp = from_timer(lp, t, timer);
+	struct arcnet_local *lp = timer_container_of(lp, t, timer);
 	struct net_device *dev = lp->dev;
 
 	spin_lock_irq(&lp->lock);
diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
index adf3970f070f..c5784d9779ef 100644
--- a/drivers/net/can/grcan.c
+++ b/drivers/net/can/grcan.c
@@ -806,7 +806,7 @@ static irqreturn_t grcan_interrupt(int irq, void *dev_id)
  */
 static void grcan_running_reset(struct timer_list *t)
 {
-	struct grcan_priv *priv = from_timer(priv, t, rr_timer);
+	struct grcan_priv *priv = timer_container_of(priv, t, rr_timer);
 	struct net_device *dev = priv->dev;
 	struct grcan_registers __iomem *regs = priv->regs;
 	unsigned long flags;
@@ -897,7 +897,7 @@ static inline void grcan_reset_timer(struct timer_list *timer, __u32 bitrate)
 /* Disable channels and schedule a running reset */
 static void grcan_initiate_running_reset(struct timer_list *t)
 {
-	struct grcan_priv *priv = from_timer(priv, t, hang_timer);
+	struct grcan_priv *priv = timer_container_of(priv, t, hang_timer);
 	struct net_device *dev = priv->dev;
 	struct grcan_registers __iomem *regs = priv->regs;
 	unsigned long flags;
diff --git a/drivers/net/can/kvaser_pciefd.c b/drivers/net/can/kvaser_pciefd.c
index cf0d51805272..ccb12b0bc9ac 100644
--- a/drivers/net/can/kvaser_pciefd.c
+++ b/drivers/net/can/kvaser_pciefd.c
@@ -930,7 +930,7 @@ static int kvaser_pciefd_get_berr_counter(const struct net_device *ndev,
 
 static void kvaser_pciefd_bec_poll_timer(struct timer_list *data)
 {
-	struct kvaser_pciefd_can *can = from_timer(can, data, bec_poll_timer);
+	struct kvaser_pciefd_can *can = timer_container_of(can, data, bec_poll_timer);
 
 	kvaser_pciefd_enable_err_gen(can);
 	kvaser_pciefd_request_status(can);
diff --git a/drivers/net/can/sja1000/peak_pcmcia.c b/drivers/net/can/sja1000/peak_pcmcia.c
index 6c7b1c58f85f..ce18e9e56059 100644
--- a/drivers/net/can/sja1000/peak_pcmcia.c
+++ b/drivers/net/can/sja1000/peak_pcmcia.c
@@ -374,7 +374,7 @@ static inline void pcan_set_can_power(struct pcan_pccard *card, int onoff)
  */
 static void pcan_led_timer(struct timer_list *t)
 {
-	struct pcan_pccard *card = from_timer(card, t, led_timer);
+	struct pcan_pccard *card = timer_container_of(card, t, led_timer);
 	struct net_device *netdev;
 	int i, up_count = 0;
 	u8 ccr;
diff --git a/drivers/net/can/usb/peak_usb/pcan_usb.c b/drivers/net/can/usb/peak_usb/pcan_usb.c
index c75df1755b3b..6b293a9056c2 100644
--- a/drivers/net/can/usb/peak_usb/pcan_usb.c
+++ b/drivers/net/can/usb/peak_usb/pcan_usb.c
@@ -319,7 +319,7 @@ static int pcan_usb_write_mode(struct peak_usb_device *dev, u8 onoff)
  */
 static void pcan_usb_restart(struct timer_list *t)
 {
-	struct pcan_usb *pdev = from_timer(pdev, t, restart_timer);
+	struct pcan_usb *pdev = timer_container_of(pdev, t, restart_timer);
 	struct peak_usb_device *dev = &pdev->dev;
 
 	/* notify candev and netdev */
diff --git a/drivers/net/dsa/mv88e6xxx/phy.c b/drivers/net/dsa/mv88e6xxx/phy.c
index b6d249eb64e7..4e7827ee684a 100644
--- a/drivers/net/dsa/mv88e6xxx/phy.c
+++ b/drivers/net/dsa/mv88e6xxx/phy.c
@@ -182,7 +182,7 @@ static void mv88e6xxx_phy_ppu_reenable_work(struct work_struct *ugly)
 
 static void mv88e6xxx_phy_ppu_reenable_timer(struct timer_list *t)
 {
-	struct mv88e6xxx_chip *chip = from_timer(chip, t, ppu_timer);
+	struct mv88e6xxx_chip *chip = timer_container_of(chip, t, ppu_timer);
 
 	schedule_work(&chip->ppu_work);
 }
diff --git a/drivers/net/eql.c b/drivers/net/eql.c
index 5889759b8d83..9ba10efd3794 100644
--- a/drivers/net/eql.c
+++ b/drivers/net/eql.c
@@ -143,7 +143,7 @@ static void eql_kill_one_slave(slave_queue_t *queue, slave_t *slave);
 
 static void eql_timer(struct timer_list *t)
 {
-	equalizer_t *eql = from_timer(eql, t, timer);
+	equalizer_t *eql = timer_container_of(eql, t, timer);
 	struct list_head *this, *tmp, *head;
 
 	spin_lock(&eql->queue.lock);
diff --git a/drivers/net/ethernet/3com/3c515.c b/drivers/net/ethernet/3com/3c515.c
index 8ba2ed87fe7c..ecdea58e6a21 100644
--- a/drivers/net/ethernet/3com/3c515.c
+++ b/drivers/net/ethernet/3com/3c515.c
@@ -859,7 +859,7 @@ static int corkscrew_open(struct net_device *dev)
 static void corkscrew_timer(struct timer_list *t)
 {
 #ifdef AUTOMEDIA
-	struct corkscrew_private *vp = from_timer(vp, t, timer);
+	struct corkscrew_private *vp = timer_container_of(vp, t, timer);
 	struct net_device *dev = vp->our_dev;
 	int ioaddr = dev->base_addr;
 	unsigned long flags;
diff --git a/drivers/net/ethernet/3com/3c574_cs.c b/drivers/net/ethernet/3com/3c574_cs.c
index b295d528a237..1f2070497a75 100644
--- a/drivers/net/ethernet/3com/3c574_cs.c
+++ b/drivers/net/ethernet/3com/3c574_cs.c
@@ -858,7 +858,7 @@ static irqreturn_t el3_interrupt(int irq, void *dev_id)
 */
 static void media_check(struct timer_list *t)
 {
-	struct el3_private *lp = from_timer(lp, t, media);
+	struct el3_private *lp = timer_container_of(lp, t, media);
 	struct net_device *dev = lp->p_dev->priv;
 	unsigned int ioaddr = dev->base_addr;
 	unsigned long flags;
diff --git a/drivers/net/ethernet/3com/3c589_cs.c b/drivers/net/ethernet/3com/3c589_cs.c
index ff331a3bde73..ea49be43b8c3 100644
--- a/drivers/net/ethernet/3com/3c589_cs.c
+++ b/drivers/net/ethernet/3com/3c589_cs.c
@@ -685,7 +685,7 @@ static irqreturn_t el3_interrupt(int irq, void *dev_id)
 
 static void media_check(struct timer_list *t)
 {
-	struct el3_private *lp = from_timer(lp, t, media);
+	struct el3_private *lp = timer_container_of(lp, t, media);
 	struct net_device *dev = lp->p_dev->priv;
 	unsigned int ioaddr = dev->base_addr;
 	u16 media, errs;
diff --git a/drivers/net/ethernet/3com/3c59x.c b/drivers/net/ethernet/3com/3c59x.c
index 1a10f5dbc4d7..8c9cc97efd4e 100644
--- a/drivers/net/ethernet/3com/3c59x.c
+++ b/drivers/net/ethernet/3com/3c59x.c
@@ -1783,7 +1783,7 @@ vortex_open(struct net_device *dev)
 static void
 vortex_timer(struct timer_list *t)
 {
-	struct vortex_private *vp = from_timer(vp, t, timer);
+	struct vortex_private *vp = timer_container_of(vp, t, timer);
 	struct net_device *dev = vp->mii.dev;
 	void __iomem *ioaddr = vp->ioaddr;
 	int next_tick = 60*HZ;
diff --git a/drivers/net/ethernet/8390/axnet_cs.c b/drivers/net/ethernet/8390/axnet_cs.c
index e5be5044e1d4..7c8213011b5c 100644
--- a/drivers/net/ethernet/8390/axnet_cs.c
+++ b/drivers/net/ethernet/8390/axnet_cs.c
@@ -550,7 +550,7 @@ static irqreturn_t ei_irq_wrapper(int irq, void *dev_id)
 
 static void ei_watchdog(struct timer_list *t)
 {
-    struct axnet_dev *info = from_timer(info, t, watchdog);
+    struct axnet_dev *info = timer_container_of(info, t, watchdog);
     struct net_device *dev = info->p_dev->priv;
     unsigned int nic_base = dev->base_addr;
     unsigned int mii_addr = nic_base + AXNET_MII_EEP;
diff --git a/drivers/net/ethernet/8390/pcnet_cs.c b/drivers/net/ethernet/8390/pcnet_cs.c
index a326f25dda09..19f9c5db3f3b 100644
--- a/drivers/net/ethernet/8390/pcnet_cs.c
+++ b/drivers/net/ethernet/8390/pcnet_cs.c
@@ -1018,7 +1018,7 @@ static irqreturn_t ei_irq_wrapper(int irq, void *dev_id)
 
 static void ei_watchdog(struct timer_list *t)
 {
-    struct pcnet_dev *info = from_timer(info, t, watchdog);
+    struct pcnet_dev *info = timer_container_of(info, t, watchdog);
     struct net_device *dev = info->p_dev->priv;
     unsigned int nic_base = dev->base_addr;
     unsigned int mii_addr = nic_base + DLINK_GPIO;
diff --git a/drivers/net/ethernet/agere/et131x.c b/drivers/net/ethernet/agere/et131x.c
index b398adacda91..12def2cddc55 100644
--- a/drivers/net/ethernet/agere/et131x.c
+++ b/drivers/net/ethernet/agere/et131x.c
@@ -3076,7 +3076,7 @@ static int et131x_pci_init(struct et131x_adapter *adapter,
  */
 static void et131x_error_timer_handler(struct timer_list *t)
 {
-	struct et131x_adapter *adapter = from_timer(adapter, t, error_timer);
+	struct et131x_adapter *adapter = timer_container_of(adapter, t, error_timer);
 	struct phy_device *phydev = adapter->netdev->phydev;
 
 	if (et1310_in_phy_coma(adapter)) {
diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
index 897720fdf5d8..e4177c7bfa88 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -3667,7 +3667,7 @@ static void ena_update_host_info(struct ena_admin_host_info *host_info,
 
 static void ena_timer_service(struct timer_list *t)
 {
-	struct ena_adapter *adapter = from_timer(adapter, t, timer_service);
+	struct ena_adapter *adapter = timer_container_of(adapter, t, timer_service);
 	u8 *debug_area = adapter->ena_dev->host_attr.debug_area_virt_addr;
 	struct ena_admin_host_info *host_info =
 		adapter->ena_dev->host_attr.host_info;
diff --git a/drivers/net/ethernet/amd/a2065.c b/drivers/net/ethernet/amd/a2065.c
index b923ad9e1581..ce9445425045 100644
--- a/drivers/net/ethernet/amd/a2065.c
+++ b/drivers/net/ethernet/amd/a2065.c
@@ -636,7 +636,7 @@ static void lance_set_multicast(struct net_device *dev)
 
 static void lance_set_multicast_retry(struct timer_list *t)
 {
-	struct lance_private *lp = from_timer(lp, t, multicast_timer);
+	struct lance_private *lp = timer_container_of(lp, t, multicast_timer);
 
 	lance_set_multicast(lp->dev);
 }
diff --git a/drivers/net/ethernet/amd/amd8111e.c b/drivers/net/ethernet/amd/amd8111e.c
index 86522e8574cb..f9a936ac6731 100644
--- a/drivers/net/ethernet/amd/amd8111e.c
+++ b/drivers/net/ethernet/amd/amd8111e.c
@@ -1641,7 +1641,7 @@ static int __maybe_unused amd8111e_resume(struct device *dev_d)
 
 static void amd8111e_config_ipg(struct timer_list *t)
 {
-	struct amd8111e_priv *lp = from_timer(lp, t, ipg_data.ipg_timer);
+	struct amd8111e_priv *lp = timer_container_of(lp, t, ipg_data.ipg_timer);
 	struct ipg_info *ipg_data = &lp->ipg_data;
 	void __iomem *mmio = lp->mmio;
 	unsigned int prev_col_cnt = ipg_data->col_cnt;
diff --git a/drivers/net/ethernet/amd/declance.c b/drivers/net/ethernet/amd/declance.c
index b072ca5930fc..8d05a0c5f2d5 100644
--- a/drivers/net/ethernet/amd/declance.c
+++ b/drivers/net/ethernet/amd/declance.c
@@ -1004,7 +1004,7 @@ static void lance_set_multicast(struct net_device *dev)
 
 static void lance_set_multicast_retry(struct timer_list *t)
 {
-	struct lance_private *lp = from_timer(lp, t, multicast_timer);
+	struct lance_private *lp = timer_container_of(lp, t, multicast_timer);
 	struct net_device *dev = lp->dev;
 
 	lance_set_multicast(dev);
diff --git a/drivers/net/ethernet/amd/pcnet32.c b/drivers/net/ethernet/amd/pcnet32.c
index e5adafecc686..9eaefa0f5e80 100644
--- a/drivers/net/ethernet/amd/pcnet32.c
+++ b/drivers/net/ethernet/amd/pcnet32.c
@@ -2905,7 +2905,7 @@ static void pcnet32_check_media(struct net_device *dev, int verbose)
 
 static void pcnet32_watchdog(struct timer_list *t)
 {
-	struct pcnet32_private *lp = from_timer(lp, t, watchdog_timer);
+	struct pcnet32_private *lp = timer_container_of(lp, t, watchdog_timer);
 	struct net_device *dev = lp->dev;
 	unsigned long flags;
 
diff --git a/drivers/net/ethernet/amd/pds_core/main.c b/drivers/net/ethernet/amd/pds_core/main.c
index 4843f9249a31..9b81e1c260c2 100644
--- a/drivers/net/ethernet/amd/pds_core/main.c
+++ b/drivers/net/ethernet/amd/pds_core/main.c
@@ -23,7 +23,7 @@ MODULE_DEVICE_TABLE(pci, pdsc_id_table);
 
 static void pdsc_wdtimer_cb(struct timer_list *t)
 {
-	struct pdsc *pdsc = from_timer(pdsc, t, wdtimer);
+	struct pdsc *pdsc = timer_container_of(pdsc, t, wdtimer);
 
 	dev_dbg(pdsc->dev, "%s: jiffies %ld\n", __func__, jiffies);
 	mod_timer(&pdsc->wdtimer,
diff --git a/drivers/net/ethernet/amd/sunlance.c b/drivers/net/ethernet/amd/sunlance.c
index 3cd31855a5f6..0b273327f5a6 100644
--- a/drivers/net/ethernet/amd/sunlance.c
+++ b/drivers/net/ethernet/amd/sunlance.c
@@ -1246,7 +1246,7 @@ static void lance_set_multicast(struct net_device *dev)
 
 static void lance_set_multicast_retry(struct timer_list *t)
 {
-	struct lance_private *lp = from_timer(lp, t, multicast_timer);
+	struct lance_private *lp = timer_container_of(lp, t, multicast_timer);
 	struct net_device *dev = lp->dev;
 
 	lance_set_multicast(dev);
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-drv.c b/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
index d84a310dfcd4..91f19eb286cd 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
@@ -643,7 +643,7 @@ static irqreturn_t xgbe_dma_isr(int irq, void *data)
 
 static void xgbe_tx_timer(struct timer_list *t)
 {
-	struct xgbe_channel *channel = from_timer(channel, t, tx_timer);
+	struct xgbe_channel *channel = timer_container_of(channel, t, tx_timer);
 	struct xgbe_prv_data *pdata = channel->pdata;
 	struct napi_struct *napi;
 
@@ -681,7 +681,7 @@ static void xgbe_service(struct work_struct *work)
 
 static void xgbe_service_timer(struct timer_list *t)
 {
-	struct xgbe_prv_data *pdata = from_timer(pdata, t, service_timer);
+	struct xgbe_prv_data *pdata = timer_container_of(pdata, t, service_timer);
 	struct xgbe_channel *channel;
 	unsigned int i;
 
diff --git a/drivers/net/ethernet/apple/bmac.c b/drivers/net/ethernet/apple/bmac.c
index b9fdd61f1fdb..afaebc58d986 100644
--- a/drivers/net/ethernet/apple/bmac.c
+++ b/drivers/net/ethernet/apple/bmac.c
@@ -1466,7 +1466,7 @@ bmac_output(struct sk_buff *skb, struct net_device *dev)
 
 static void bmac_tx_timeout(struct timer_list *t)
 {
-	struct bmac_data *bp = from_timer(bp, t, tx_timeout);
+	struct bmac_data *bp = timer_container_of(bp, t, tx_timeout);
 	struct net_device *dev = macio_get_drvdata(bp->mdev);
 	volatile struct dbdma_regs __iomem *td = bp->tx_dma;
 	volatile struct dbdma_regs __iomem *rd = bp->rx_dma;
diff --git a/drivers/net/ethernet/apple/mace.c b/drivers/net/ethernet/apple/mace.c
index 1fed112f4e68..af26905e44e3 100644
--- a/drivers/net/ethernet/apple/mace.c
+++ b/drivers/net/ethernet/apple/mace.c
@@ -805,7 +805,7 @@ static irqreturn_t mace_interrupt(int irq, void *dev_id)
 
 static void mace_tx_timeout(struct timer_list *t)
 {
-    struct mace_data *mp = from_timer(mp, t, tx_timeout);
+    struct mace_data *mp = timer_container_of(mp, t, tx_timeout);
     struct net_device *dev = macio_get_drvdata(mp->mdev);
     volatile struct mace __iomem *mb = mp->mace;
     volatile struct dbdma_regs __iomem *td = mp->tx_dma;
diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c b/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
index bf3aa46887a1..99b124e40bdc 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
@@ -254,7 +254,7 @@ static void aq_nic_service_task(struct work_struct *work)
 
 static void aq_nic_service_timer_cb(struct timer_list *t)
 {
-	struct aq_nic_s *self = from_timer(self, t, service_timer);
+	struct aq_nic_s *self = timer_container_of(self, t, service_timer);
 
 	mod_timer(&self->service_timer,
 		  jiffies + AQ_CFG_SERVICE_TIMER_INTERVAL);
@@ -264,7 +264,7 @@ static void aq_nic_service_timer_cb(struct timer_list *t)
 
 static void aq_nic_polling_timer_cb(struct timer_list *t)
 {
-	struct aq_nic_s *self = from_timer(self, t, polling_timer);
+	struct aq_nic_s *self = timer_container_of(self, t, polling_timer);
 	unsigned int i = 0U;
 
 	for (i = 0U; self->aq_vecs > i; ++i)
diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index 67b654889cae..d8e6f23e1432 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1563,7 +1563,7 @@ static netdev_tx_t ag71xx_hard_start_xmit(struct sk_buff *skb,
 
 static void ag71xx_oom_timer_handler(struct timer_list *t)
 {
-	struct ag71xx *ag = from_timer(ag, t, oom_timer);
+	struct ag71xx *ag = timer_container_of(ag, t, oom_timer);
 
 	napi_schedule(&ag->napi);
 }
diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
index 82137f9deae9..19ef52ff6fe3 100644
--- a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
+++ b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
@@ -231,7 +231,7 @@ static u32 atl1c_wait_until_idle(struct atl1c_hw *hw, u32 modu_ctrl)
  */
 static void atl1c_phy_config(struct timer_list *t)
 {
-	struct atl1c_adapter *adapter = from_timer(adapter, t,
+	struct atl1c_adapter *adapter = timer_container_of(adapter, t,
 						   phy_config_timer);
 	struct atl1c_hw *hw = &adapter->hw;
 	unsigned long flags;
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c b/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
index f664a0edbc49..11c26e82f471 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
@@ -115,7 +115,7 @@ static inline void atl1e_irq_reset(struct atl1e_adapter *adapter)
  */
 static void atl1e_phy_config(struct timer_list *t)
 {
-	struct atl1e_adapter *adapter = from_timer(adapter, t,
+	struct atl1e_adapter *adapter = timer_container_of(adapter, t,
 						   phy_config_timer);
 	struct atl1e_hw *hw = &adapter->hw;
 	unsigned long flags;
diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
index 38cd84b7677c..6ad73d93a247 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -2556,7 +2556,7 @@ static irqreturn_t atl1_intr(int irq, void *data)
  */
 static void atl1_phy_config(struct timer_list *t)
 {
-	struct atl1_adapter *adapter = from_timer(adapter, t,
+	struct atl1_adapter *adapter = timer_container_of(adapter, t,
 						  phy_config_timer);
 	struct atl1_hw *hw = &adapter->hw;
 	unsigned long flags;
diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index 88f65f8cf4d3..b46a6a0fc7e4 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -1010,7 +1010,7 @@ static void atl2_tx_timeout(struct net_device *netdev, unsigned int txqueue)
  */
 static void atl2_watchdog(struct timer_list *t)
 {
-	struct atl2_adapter *adapter = from_timer(adapter, t, watchdog_timer);
+	struct atl2_adapter *adapter = timer_container_of(adapter, t, watchdog_timer);
 
 	if (!test_bit(__ATL2_DOWN, &adapter->flags)) {
 		u32 drop_rxd, drop_rxs;
@@ -1035,7 +1035,7 @@ static void atl2_watchdog(struct timer_list *t)
  */
 static void atl2_phy_config(struct timer_list *t)
 {
-	struct atl2_adapter *adapter = from_timer(adapter, t,
+	struct atl2_adapter *adapter = timer_container_of(adapter, t,
 						  phy_config_timer);
 	struct atl2_hw *hw = &adapter->hw;
 	unsigned long flags;
diff --git a/drivers/net/ethernet/broadcom/b44.c b/drivers/net/ethernet/broadcom/b44.c
index c91884373429..8267417b3750 100644
--- a/drivers/net/ethernet/broadcom/b44.c
+++ b/drivers/net/ethernet/broadcom/b44.c
@@ -575,7 +575,7 @@ static void b44_check_phy(struct b44 *bp)
 
 static void b44_timer(struct timer_list *t)
 {
-	struct b44 *bp = from_timer(bp, t, timer);
+	struct b44 *bp = timer_container_of(bp, t, timer);
 
 	spin_lock_irq(&bp->lock);
 
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
index 19611bdd86e6..92204fea1f08 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -286,7 +286,7 @@ static int bcm_enet_refill_rx(struct net_device *dev, bool napi_mode)
  */
 static void bcm_enet_refill_rx_timer(struct timer_list *t)
 {
-	struct bcm_enet_priv *priv = from_timer(priv, t, rx_timeout);
+	struct bcm_enet_priv *priv = timer_container_of(priv, t, rx_timeout);
 	struct net_device *dev = priv->net_dev;
 
 	spin_lock(&priv->rx_lock);
@@ -2001,7 +2001,7 @@ static inline int bcm_enet_port_is_rgmii(int portid)
  */
 static void swphy_poll_timer(struct timer_list *t)
 {
-	struct bcm_enet_priv *priv = from_timer(priv, t, swphy_poll);
+	struct bcm_enet_priv *priv = timer_container_of(priv, t, swphy_poll);
 	unsigned int i;
 
 	for (i = 0; i < priv->num_ports; i++) {
diff --git a/drivers/net/ethernet/broadcom/bnx2.c b/drivers/net/ethernet/broadcom/bnx2.c
index ec0c9584f3bb..cb1011f6fd30 100644
--- a/drivers/net/ethernet/broadcom/bnx2.c
+++ b/drivers/net/ethernet/broadcom/bnx2.c
@@ -6163,7 +6163,7 @@ bnx2_5708_serdes_timer(struct bnx2 *bp)
 static void
 bnx2_timer(struct timer_list *t)
 {
-	struct bnx2 *bp = from_timer(bp, t, timer);
+	struct bnx2 *bp = timer_container_of(bp, t, timer);
 
 	if (!netif_running(bp->dev))
 		return;
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index f522ca8ff66b..c9a1a1d504c0 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -5783,7 +5783,7 @@ void bnx2x_drv_pulse(struct bnx2x *bp)
 
 static void bnx2x_timer(struct timer_list *t)
 {
-	struct bnx2x *bp = from_timer(bp, t, timer);
+	struct bnx2x *bp = timer_container_of(bp, t, timer);
 
 	if (!netif_running(bp->dev))
 		return;
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 8725e1e13908..f181c72df902 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -13950,7 +13950,7 @@ static void bnxt_fw_health_check(struct bnxt *bp)
 
 static void bnxt_timer(struct timer_list *t)
 {
-	struct bnxt *bp = from_timer(bp, t, timer);
+	struct bnxt *bp = timer_container_of(bp, t, timer);
 	struct net_device *dev = bp->dev;
 
 	if (!netif_running(dev) || !test_bit(BNXT_STATE_OPEN, &bp->state))
diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index d1f541af4e3b..abbf81f06aa0 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -11081,7 +11081,7 @@ static void tg3_chk_missed_msi(struct tg3 *tp)
 
 static void tg3_timer(struct timer_list *t)
 {
-	struct tg3 *tp = from_timer(tp, t, timer);
+	struct tg3 *tp = timer_container_of(tp, t, timer);
 
 	spin_lock(&tp->lock);
 
diff --git a/drivers/net/ethernet/brocade/bna/bnad.c b/drivers/net/ethernet/brocade/bna/bnad.c
index a03eff3d4425..93e8fd762769 100644
--- a/drivers/net/ethernet/brocade/bna/bnad.c
+++ b/drivers/net/ethernet/brocade/bna/bnad.c
@@ -1688,7 +1688,7 @@ bnad_rx_res_alloc(struct bnad *bnad, struct bna_res_info *res_info,
 static void
 bnad_ioc_timeout(struct timer_list *t)
 {
-	struct bnad *bnad = from_timer(bnad, t, bna.ioceth.ioc.ioc_timer);
+	struct bnad *bnad = timer_container_of(bnad, t, bna.ioceth.ioc.ioc_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&bnad->bna_lock, flags);
@@ -1699,7 +1699,7 @@ bnad_ioc_timeout(struct timer_list *t)
 static void
 bnad_ioc_hb_check(struct timer_list *t)
 {
-	struct bnad *bnad = from_timer(bnad, t, bna.ioceth.ioc.hb_timer);
+	struct bnad *bnad = timer_container_of(bnad, t, bna.ioceth.ioc.hb_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&bnad->bna_lock, flags);
@@ -1710,7 +1710,7 @@ bnad_ioc_hb_check(struct timer_list *t)
 static void
 bnad_iocpf_timeout(struct timer_list *t)
 {
-	struct bnad *bnad = from_timer(bnad, t, bna.ioceth.ioc.iocpf_timer);
+	struct bnad *bnad = timer_container_of(bnad, t, bna.ioceth.ioc.iocpf_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&bnad->bna_lock, flags);
@@ -1721,7 +1721,7 @@ bnad_iocpf_timeout(struct timer_list *t)
 static void
 bnad_iocpf_sem_timeout(struct timer_list *t)
 {
-	struct bnad *bnad = from_timer(bnad, t, bna.ioceth.ioc.sem_timer);
+	struct bnad *bnad = timer_container_of(bnad, t, bna.ioceth.ioc.sem_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&bnad->bna_lock, flags);
@@ -1743,7 +1743,7 @@ bnad_iocpf_sem_timeout(struct timer_list *t)
 static void
 bnad_dim_timeout(struct timer_list *t)
 {
-	struct bnad *bnad = from_timer(bnad, t, dim_timer);
+	struct bnad *bnad = timer_container_of(bnad, t, dim_timer);
 	struct bnad_rx_info *rx_info;
 	struct bnad_rx_ctrl *rx_ctrl;
 	int i, j;
@@ -1776,7 +1776,7 @@ bnad_dim_timeout(struct timer_list *t)
 static void
 bnad_stats_timeout(struct timer_list *t)
 {
-	struct bnad *bnad = from_timer(bnad, t, stats_timer);
+	struct bnad *bnad = timer_container_of(bnad, t, stats_timer);
 	unsigned long flags;
 
 	if (!netif_running(bnad->netdev) ||
diff --git a/drivers/net/ethernet/chelsio/cxgb/sge.c b/drivers/net/ethernet/chelsio/cxgb/sge.c
index a10923c7e25c..5f354cf62cdd 100644
--- a/drivers/net/ethernet/chelsio/cxgb/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb/sge.c
@@ -1922,7 +1922,7 @@ netdev_tx_t t1_start_xmit(struct sk_buff *skb, struct net_device *dev)
 static void sge_tx_reclaim_cb(struct timer_list *t)
 {
 	int i;
-	struct sge *sge = from_timer(sge, t, tx_reclaim_timer);
+	struct sge *sge = timer_container_of(sge, t, tx_reclaim_timer);
 
 	for (i = 0; i < SGE_CMDQ_N; ++i) {
 		struct cmdQ *q = &sge->cmdQ[i];
@@ -2017,7 +2017,7 @@ void t1_sge_start(struct sge *sge)
  */
 static void espibug_workaround_t204(struct timer_list *t)
 {
-	struct sge *sge = from_timer(sge, t, espibug_timer);
+	struct sge *sge = timer_container_of(sge, t, espibug_timer);
 	struct adapter *adapter = sge->adapter;
 	unsigned int nports = adapter->params.nports;
 	u32 seop[MAX_NPORTS];
@@ -2060,7 +2060,7 @@ static void espibug_workaround_t204(struct timer_list *t)
 
 static void espibug_workaround(struct timer_list *t)
 {
-	struct sge *sge = from_timer(sge, t, espibug_timer);
+	struct sge *sge = timer_container_of(sge, t, espibug_timer);
 	struct adapter *adapter = sge->adapter;
 
 	if (netif_running(adapter->port[0].dev)) {
diff --git a/drivers/net/ethernet/chelsio/cxgb3/sge.c b/drivers/net/ethernet/chelsio/cxgb3/sge.c
index bd5c3b3fa5e3..b59735d0e065 100644
--- a/drivers/net/ethernet/chelsio/cxgb3/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/sge.c
@@ -2906,7 +2906,7 @@ void t3_sge_err_intr_handler(struct adapter *adapter)
  */
 static void sge_timer_tx(struct timer_list *t)
 {
-	struct sge_qset *qs = from_timer(qs, t, tx_reclaim_timer);
+	struct sge_qset *qs = timer_container_of(qs, t, tx_reclaim_timer);
 	struct port_info *pi = netdev_priv(qs->netdev);
 	struct adapter *adap = pi->adapter;
 	unsigned int tbd[SGE_TXQ_PER_SET] = {0, 0};
@@ -2947,7 +2947,7 @@ static void sge_timer_tx(struct timer_list *t)
 static void sge_timer_rx(struct timer_list *t)
 {
 	spinlock_t *lock;
-	struct sge_qset *qs = from_timer(qs, t, rx_reclaim_timer);
+	struct sge_qset *qs = timer_container_of(qs, t, rx_reclaim_timer);
 	struct port_info *pi = netdev_priv(qs->netdev);
 	struct adapter *adap = pi->adapter;
 	u32 status;
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
index 69d045d769c4..0765d000eaef 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
@@ -1051,7 +1051,7 @@ static void ch_flower_stats_handler(struct work_struct *work)
 
 static void ch_flower_stats_cb(struct timer_list *t)
 {
-	struct adapter *adap = from_timer(adap, t, flower_stats_timer);
+	struct adapter *adap = timer_container_of(adap, t, flower_stats_timer);
 
 	schedule_work(&adap->flower_stats_work);
 }
diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index f991a28a71c3..ecd53235dc9d 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -4233,7 +4233,7 @@ static void sge_rx_timer_cb(struct timer_list *t)
 {
 	unsigned long m;
 	unsigned int i;
-	struct adapter *adap = from_timer(adap, t, sge.rx_timer);
+	struct adapter *adap = timer_container_of(adap, t, sge.rx_timer);
 	struct sge *s = &adap->sge;
 
 	for (i = 0; i < BITS_TO_LONGS(s->egr_sz); i++)
@@ -4268,7 +4268,7 @@ static void sge_rx_timer_cb(struct timer_list *t)
 
 static void sge_tx_timer_cb(struct timer_list *t)
 {
-	struct adapter *adap = from_timer(adap, t, sge.tx_timer);
+	struct adapter *adap = timer_container_of(adap, t, sge.tx_timer);
 	struct sge *s = &adap->sge;
 	unsigned long m, period;
 	unsigned int i, budget;
diff --git a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
index f42af01f4114..4e6ecb9c8dcc 100644
--- a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
@@ -2062,7 +2062,7 @@ irq_handler_t t4vf_intr_handler(struct adapter *adapter)
  */
 static void sge_rx_timer_cb(struct timer_list *t)
 {
-	struct adapter *adapter = from_timer(adapter, t, sge.rx_timer);
+	struct adapter *adapter = timer_container_of(adapter, t, sge.rx_timer);
 	struct sge *s = &adapter->sge;
 	unsigned int i;
 
@@ -2121,7 +2121,7 @@ static void sge_rx_timer_cb(struct timer_list *t)
  */
 static void sge_tx_timer_cb(struct timer_list *t)
 {
-	struct adapter *adapter = from_timer(adapter, t, sge.tx_timer);
+	struct adapter *adapter = timer_container_of(adapter, t, sge.tx_timer);
 	struct sge *s = &adapter->sge;
 	unsigned int i, budget;
 
diff --git a/drivers/net/ethernet/cisco/enic/enic_clsf.c b/drivers/net/ethernet/cisco/enic/enic_clsf.c
index 9900993b6aea..837f954873ee 100644
--- a/drivers/net/ethernet/cisco/enic/enic_clsf.c
+++ b/drivers/net/ethernet/cisco/enic/enic_clsf.c
@@ -125,7 +125,7 @@ struct enic_rfs_fltr_node *htbl_fltr_search(struct enic *enic, u16 fltr_id)
 #ifdef CONFIG_RFS_ACCEL
 void enic_flow_may_expire(struct timer_list *t)
 {
-	struct enic *enic = from_timer(enic, t, rfs_h.rfs_may_expire);
+	struct enic *enic = timer_container_of(enic, t, rfs_h.rfs_may_expire);
 	bool res;
 	int j;
 
diff --git a/drivers/net/ethernet/cisco/enic/enic_main.c b/drivers/net/ethernet/cisco/enic/enic_main.c
index c753c35b26eb..8f933bdd1c81 100644
--- a/drivers/net/ethernet/cisco/enic/enic_main.c
+++ b/drivers/net/ethernet/cisco/enic/enic_main.c
@@ -1510,7 +1510,7 @@ static int enic_poll_msix_rq(struct napi_struct *napi, int budget)
 
 static void enic_notify_timer(struct timer_list *t)
 {
-	struct enic *enic = from_timer(enic, t, notify_timer);
+	struct enic *enic = timer_container_of(enic, t, notify_timer);
 
 	enic_notify_check(enic);
 
diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index f9339d0772b5..f9504f340c4a 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -963,7 +963,7 @@ static void de_next_media (struct de_private *de, const u32 *media,
 
 static void de21040_media_timer (struct timer_list *t)
 {
-	struct de_private *de = from_timer(de, t, media_timer);
+	struct de_private *de = timer_container_of(de, t, media_timer);
 	struct net_device *dev = de->dev;
 	u32 status = dr32(SIAStatus);
 	unsigned int carrier;
@@ -1044,7 +1044,7 @@ static unsigned int de_ok_to_advertise (struct de_private *de, u32 new_media)
 
 static void de21041_media_timer (struct timer_list *t)
 {
-	struct de_private *de = from_timer(de, t, media_timer);
+	struct de_private *de = timer_container_of(de, t, media_timer);
 	struct net_device *dev = de->dev;
 	u32 status = dr32(SIAStatus);
 	unsigned int carrier;
diff --git a/drivers/net/ethernet/dec/tulip/dmfe.c b/drivers/net/ethernet/dec/tulip/dmfe.c
index ae34b95ed676..2d3bd343b6e6 100644
--- a/drivers/net/ethernet/dec/tulip/dmfe.c
+++ b/drivers/net/ethernet/dec/tulip/dmfe.c
@@ -1115,7 +1115,7 @@ static const struct ethtool_ops netdev_ethtool_ops = {
 
 static void dmfe_timer(struct timer_list *t)
 {
-	struct dmfe_board_info *db = from_timer(db, t, timer);
+	struct dmfe_board_info *db = timer_container_of(db, t, timer);
 	struct net_device *dev = pci_get_drvdata(db->pdev);
 	void __iomem *ioaddr = db->ioaddr;
 	u32 tmp_cr8;
diff --git a/drivers/net/ethernet/dec/tulip/interrupt.c b/drivers/net/ethernet/dec/tulip/interrupt.c
index 2d926a26fbb9..0a12cb9b3ba7 100644
--- a/drivers/net/ethernet/dec/tulip/interrupt.c
+++ b/drivers/net/ethernet/dec/tulip/interrupt.c
@@ -104,7 +104,7 @@ int tulip_refill_rx(struct net_device *dev)
 
 void oom_timer(struct timer_list *t)
 {
-	struct tulip_private *tp = from_timer(tp, t, oom_timer);
+	struct tulip_private *tp = timer_container_of(tp, t, oom_timer);
 
 	napi_schedule(&tp->napi);
 }
diff --git a/drivers/net/ethernet/dec/tulip/pnic.c b/drivers/net/ethernet/dec/tulip/pnic.c
index 653bde48ef44..1de5ed967070 100644
--- a/drivers/net/ethernet/dec/tulip/pnic.c
+++ b/drivers/net/ethernet/dec/tulip/pnic.c
@@ -86,7 +86,7 @@ void pnic_lnk_change(struct net_device *dev, int csr5)
 
 void pnic_timer(struct timer_list *t)
 {
-	struct tulip_private *tp = from_timer(tp, t, timer);
+	struct tulip_private *tp = timer_container_of(tp, t, timer);
 	struct net_device *dev = tp->dev;
 	void __iomem *ioaddr = tp->base_addr;
 	int next_tick = 60*HZ;
diff --git a/drivers/net/ethernet/dec/tulip/pnic2.c b/drivers/net/ethernet/dec/tulip/pnic2.c
index 2e3bdc0fcdc0..39c410bf224e 100644
--- a/drivers/net/ethernet/dec/tulip/pnic2.c
+++ b/drivers/net/ethernet/dec/tulip/pnic2.c
@@ -78,7 +78,7 @@
 
 void pnic2_timer(struct timer_list *t)
 {
-	struct tulip_private *tp = from_timer(tp, t, timer);
+	struct tulip_private *tp = timer_container_of(tp, t, timer);
 	struct net_device *dev = tp->dev;
 	void __iomem *ioaddr = tp->base_addr;
 	int next_tick = 60*HZ;
diff --git a/drivers/net/ethernet/dec/tulip/timer.c b/drivers/net/ethernet/dec/tulip/timer.c
index 642e9dfc5451..ca0c509b601c 100644
--- a/drivers/net/ethernet/dec/tulip/timer.c
+++ b/drivers/net/ethernet/dec/tulip/timer.c
@@ -139,7 +139,7 @@ void tulip_media_task(struct work_struct *work)
 
 void mxic_timer(struct timer_list *t)
 {
-	struct tulip_private *tp = from_timer(tp, t, timer);
+	struct tulip_private *tp = timer_container_of(tp, t, timer);
 	struct net_device *dev = tp->dev;
 	void __iomem *ioaddr = tp->base_addr;
 	int next_tick = 60*HZ;
@@ -156,7 +156,7 @@ void mxic_timer(struct timer_list *t)
 
 void comet_timer(struct timer_list *t)
 {
-	struct tulip_private *tp = from_timer(tp, t, timer);
+	struct tulip_private *tp = timer_container_of(tp, t, timer);
 	struct net_device *dev = tp->dev;
 	int next_tick = 2*HZ;
 
diff --git a/drivers/net/ethernet/dec/tulip/tulip_core.c b/drivers/net/ethernet/dec/tulip/tulip_core.c
index c8c53121557f..cd3da0e9a183 100644
--- a/drivers/net/ethernet/dec/tulip/tulip_core.c
+++ b/drivers/net/ethernet/dec/tulip/tulip_core.c
@@ -114,7 +114,7 @@ int tulip_debug = 1;
 
 static void tulip_timer(struct timer_list *t)
 {
-	struct tulip_private *tp = from_timer(tp, t, timer);
+	struct tulip_private *tp = timer_container_of(tp, t, timer);
 	struct net_device *dev = tp->dev;
 
 	if (netif_running(dev))
diff --git a/drivers/net/ethernet/dec/tulip/uli526x.c b/drivers/net/ethernet/dec/tulip/uli526x.c
index 3f1bd670700b..6e4d8d31aba9 100644
--- a/drivers/net/ethernet/dec/tulip/uli526x.c
+++ b/drivers/net/ethernet/dec/tulip/uli526x.c
@@ -1014,7 +1014,7 @@ static const struct ethtool_ops netdev_ethtool_ops = {
 
 static void uli526x_timer(struct timer_list *t)
 {
-	struct uli526x_board_info *db = from_timer(db, t, timer);
+	struct uli526x_board_info *db = timer_container_of(db, t, timer);
 	struct net_device *dev = pci_get_drvdata(db->pdev);
 	struct uli_phy_ops *phy = &db->phy;
 	void __iomem *ioaddr = db->ioaddr;
diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ethernet/dec/tulip/winbond-840.c
index 5930cdec6f2f..ded7d1855e0f 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -763,7 +763,7 @@ static inline void update_csr6(struct net_device *dev, int new)
 
 static void netdev_timer(struct timer_list *t)
 {
-	struct netdev_private *np = from_timer(np, t, timer);
+	struct netdev_private *np = timer_container_of(np, t, timer);
 	struct net_device *dev = pci_get_drvdata(np->pci_dev);
 	void __iomem *ioaddr = np->base_addr;
 
diff --git a/drivers/net/ethernet/dlink/dl2k.c b/drivers/net/ethernet/dlink/dl2k.c
index d88fbecdab4b..dc1ff862e04b 100644
--- a/drivers/net/ethernet/dlink/dl2k.c
+++ b/drivers/net/ethernet/dlink/dl2k.c
@@ -648,7 +648,7 @@ static int rio_open(struct net_device *dev)
 static void
 rio_timer (struct timer_list *t)
 {
-	struct netdev_private *np = from_timer(np, t, timer);
+	struct netdev_private *np = timer_container_of(np, t, timer);
 	struct net_device *dev = pci_get_drvdata(np->pdev);
 	unsigned int entry;
 	int next_tick = 1*HZ;
diff --git a/drivers/net/ethernet/fealnx.c b/drivers/net/ethernet/fealnx.c
index 670b68201376..6ac8547ef9b8 100644
--- a/drivers/net/ethernet/fealnx.c
+++ b/drivers/net/ethernet/fealnx.c
@@ -1074,7 +1074,7 @@ static void allocate_rx_buffers(struct net_device *dev)
 
 static void netdev_timer(struct timer_list *t)
 {
-	struct netdev_private *np = from_timer(np, t, timer);
+	struct netdev_private *np = timer_container_of(np, t, timer);
 	struct net_device *dev = np->mii.dev;
 	void __iomem *ioaddr = np->mem;
 	int old_crvalue = np->crvalue;
@@ -1163,7 +1163,7 @@ static void enable_rxtx(struct net_device *dev)
 
 static void reset_timer(struct timer_list *t)
 {
-	struct netdev_private *np = from_timer(np, t, reset_timer);
+	struct netdev_private *np = timer_container_of(np, t, reset_timer);
 	struct net_device *dev = np->mii.dev;
 	unsigned long flags;
 
diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index c3791cf23c87..27f34dfa0390 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -268,7 +268,7 @@ static void gve_stats_report_schedule(struct gve_priv *priv)
 
 static void gve_stats_report_timer(struct timer_list *t)
 {
-	struct gve_priv *priv = from_timer(priv, t, stats_report_timer);
+	struct gve_priv *priv = timer_container_of(priv, t, stats_report_timer);
 
 	mod_timer(&priv->stats_report_timer,
 		  round_jiffies(jiffies +
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_enet.c b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
index d98f8d3ce7c8..e905f10b894e 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
@@ -2075,7 +2075,7 @@ static void hns_nic_task_schedule(struct hns_nic_priv *priv)
 
 static void hns_nic_service_timer(struct timer_list *t)
 {
-	struct hns_nic_priv *priv = from_timer(priv, t, service_timer);
+	struct hns_nic_priv *priv = timer_container_of(priv, t, service_timer);
 
 	(void)mod_timer(&priv->service_timer, jiffies + SERVICE_TIMER_HZ);
 
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 3e28a08934ab..a7de67699a01 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -4503,7 +4503,7 @@ static void hclge_set_def_reset_request(struct hnae3_ae_dev *ae_dev,
 
 static void hclge_reset_timer(struct timer_list *t)
 {
-	struct hclge_dev *hdev = from_timer(hdev, t, reset_timer);
+	struct hclge_dev *hdev = timer_container_of(hdev, t, reset_timer);
 
 	/* if default_reset_request has no value, it means that this reset
 	 * request has already be handled, so just return here
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
index 9ba767740a04..5b02fe91f073 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
@@ -2045,7 +2045,7 @@ static enum hclgevf_evt_cause hclgevf_check_evt_cause(struct hclgevf_dev *hdev,
 
 static void hclgevf_reset_timer(struct timer_list *t)
 {
-	struct hclgevf_dev *hdev = from_timer(hdev, t, reset_timer);
+	struct hclgevf_dev *hdev = timer_container_of(hdev, t, reset_timer);
 
 	hclgevf_clear_event_cause(hdev, HCLGEVF_VECTOR0_EVENT_RST);
 	hclgevf_reset_task_schedule(hdev);
diff --git a/drivers/net/ethernet/intel/e100.c b/drivers/net/ethernet/intel/e100.c
index c0ead54ea186..5c56c1edd492 100644
--- a/drivers/net/ethernet/intel/e100.c
+++ b/drivers/net/ethernet/intel/e100.c
@@ -1682,7 +1682,7 @@ static void e100_adjust_adaptive_ifs(struct nic *nic, int speed, int duplex)
 
 static void e100_watchdog(struct timer_list *t)
 {
-	struct nic *nic = from_timer(nic, t, watchdog);
+	struct nic *nic = timer_container_of(nic, t, watchdog);
 	struct ethtool_cmd cmd = { .cmd = ETHTOOL_GSET };
 	u32 speed;
 
diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 8ebcb6a7d608..b6a39f691581 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -4839,7 +4839,7 @@ static void e1000e_update_phy_task(struct work_struct *work)
  **/
 static void e1000_update_phy_info(struct timer_list *t)
 {
-	struct e1000_adapter *adapter = from_timer(adapter, t, phy_info_timer);
+	struct e1000_adapter *adapter = timer_container_of(adapter, t, phy_info_timer);
 
 	if (test_bit(__E1000_DOWN, &adapter->state))
 		return;
@@ -5175,7 +5175,7 @@ static void e1000e_check_82574_phy_workaround(struct e1000_adapter *adapter)
  **/
 static void e1000_watchdog(struct timer_list *t)
 {
-	struct e1000_adapter *adapter = from_timer(adapter, t, watchdog_timer);
+	struct e1000_adapter *adapter = timer_container_of(adapter, t, watchdog_timer);
 
 	/* Do the rest outside of interrupt context */
 	schedule_work(&adapter->watchdog_task);
diff --git a/drivers/net/ethernet/intel/fm10k/fm10k_pci.c b/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
index 21267ab603ef..3b821a31c4e0 100644
--- a/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
+++ b/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
@@ -199,7 +199,7 @@ static void fm10k_start_service_event(struct fm10k_intfc *interface)
  **/
 static void fm10k_service_timer(struct timer_list *t)
 {
-	struct fm10k_intfc *interface = from_timer(interface, t,
+	struct fm10k_intfc *interface = timer_container_of(interface, t,
 						   service_timer);
 
 	/* Reset the timer */
diff --git a/drivers/net/ethernet/intel/i40e/i40e_main.c b/drivers/net/ethernet/intel/i40e/i40e_main.c
index 120d68654e3f..f1c9e575703e 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_main.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_main.c
@@ -11412,7 +11412,7 @@ static void i40e_service_task(struct work_struct *work)
  **/
 static void i40e_service_timer(struct timer_list *t)
 {
-	struct i40e_pf *pf = from_timer(pf, t, service_timer);
+	struct i40e_pf *pf = timer_container_of(pf, t, service_timer);
 
 	mod_timer(&pf->service_timer,
 		  round_jiffies(jiffies + pf->service_timer_period));
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index d390157b59fe..10930146e45d 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -1743,7 +1743,7 @@ static void ice_service_task_restart(struct ice_pf *pf)
  */
 static void ice_service_timer(struct timer_list *t)
 {
-	struct ice_pf *pf = from_timer(pf, t, serv_tmr);
+	struct ice_pf *pf = timer_container_of(pf, t, serv_tmr);
 
 	mod_timer(&pf->serv_tmr, round_jiffies(pf->serv_tmr_period + jiffies));
 	ice_service_task_schedule(pf);
diff --git a/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c b/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c
index 7752920d7a8e..05fea471de90 100644
--- a/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c
+++ b/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c
@@ -1450,7 +1450,7 @@ static int ice_vc_fdir_write_fltr(struct ice_vf *vf,
  */
 static void ice_vf_fdir_timer(struct timer_list *t)
 {
-	struct ice_vf_fdir_ctx *ctx_irq = from_timer(ctx_irq, t, rx_tmr);
+	struct ice_vf_fdir_ctx *ctx_irq = timer_container_of(ctx_irq, t, rx_tmr);
 	struct ice_vf_fdir_ctx *ctx_done;
 	struct ice_vf_fdir *fdir;
 	unsigned long flags;
diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
index c646c71915f0..8f3506984ca8 100644
--- a/drivers/net/ethernet/intel/igb/igb_main.c
+++ b/drivers/net/ethernet/intel/igb/igb_main.c
@@ -5436,7 +5436,7 @@ static void igb_spoof_check(struct igb_adapter *adapter)
  */
 static void igb_update_phy_info(struct timer_list *t)
 {
-	struct igb_adapter *adapter = from_timer(adapter, t, phy_info_timer);
+	struct igb_adapter *adapter = timer_container_of(adapter, t, phy_info_timer);
 	igb_get_phy_info(&adapter->hw);
 }
 
@@ -5526,7 +5526,7 @@ static void igb_check_lvmmc(struct igb_adapter *adapter)
  **/
 static void igb_watchdog(struct timer_list *t)
 {
-	struct igb_adapter *adapter = from_timer(adapter, t, watchdog_timer);
+	struct igb_adapter *adapter = timer_container_of(adapter, t, watchdog_timer);
 	/* Do the rest outside of interrupt context */
 	schedule_work(&adapter->watchdog_task);
 }
diff --git a/drivers/net/ethernet/intel/igbvf/netdev.c b/drivers/net/ethernet/intel/igbvf/netdev.c
index beb01248600f..92c8bfb15c3e 100644
--- a/drivers/net/ethernet/intel/igbvf/netdev.c
+++ b/drivers/net/ethernet/intel/igbvf/netdev.c
@@ -1900,7 +1900,7 @@ static bool igbvf_has_link(struct igbvf_adapter *adapter)
  **/
 static void igbvf_watchdog(struct timer_list *t)
 {
-	struct igbvf_adapter *adapter = from_timer(adapter, t, watchdog_timer);
+	struct igbvf_adapter *adapter = timer_container_of(adapter, t, watchdog_timer);
 
 	/* Do the rest outside of interrupt context */
 	schedule_work(&adapter->watchdog_task);
diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index f1330379e6bb..283df6b04a47 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -5710,7 +5710,7 @@ static void igc_clear_interrupt_scheme(struct igc_adapter *adapter)
  */
 static void igc_update_phy_info(struct timer_list *t)
 {
-	struct igc_adapter *adapter = from_timer(adapter, t, phy_info_timer);
+	struct igc_adapter *adapter = timer_container_of(adapter, t, phy_info_timer);
 
 	igc_get_phy_info(&adapter->hw);
 }
@@ -5752,7 +5752,7 @@ bool igc_has_link(struct igc_adapter *adapter)
  */
 static void igc_watchdog(struct timer_list *t)
 {
-	struct igc_adapter *adapter = from_timer(adapter, t, watchdog_timer);
+	struct igc_adapter *adapter = timer_container_of(adapter, t, watchdog_timer);
 	/* Do the rest outside of interrupt context */
 	schedule_work(&adapter->watchdog_task);
 }
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index a2718218963e..cd53199cf768 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -8309,7 +8309,7 @@ static void ixgbe_sfp_link_config_subtask(struct ixgbe_adapter *adapter)
  **/
 static void ixgbe_service_timer(struct timer_list *t)
 {
-	struct ixgbe_adapter *adapter = from_timer(adapter, t, service_timer);
+	struct ixgbe_adapter *adapter = timer_container_of(adapter, t, service_timer);
 	unsigned long next_event_offset;
 
 	/* poll faster when waiting for link */
diff --git a/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c b/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c
index a217c5c04804..5f71cd7c11a7 100644
--- a/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c
+++ b/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c
@@ -3176,7 +3176,7 @@ void ixgbevf_update_stats(struct ixgbevf_adapter *adapter)
  **/
 static void ixgbevf_service_timer(struct timer_list *t)
 {
-	struct ixgbevf_adapter *adapter = from_timer(adapter, t,
+	struct ixgbevf_adapter *adapter = timer_container_of(adapter, t,
 						     service_timer);
 
 	/* Reset the timer */
diff --git a/drivers/net/ethernet/korina.c b/drivers/net/ethernet/korina.c
index 1e2ac1a5f099..b80014ef6539 100644
--- a/drivers/net/ethernet/korina.c
+++ b/drivers/net/ethernet/korina.c
@@ -900,7 +900,7 @@ static void korina_check_media(struct net_device *dev, unsigned int init_media)
 
 static void korina_poll_media(struct timer_list *t)
 {
-	struct korina_private *lp = from_timer(lp, t, media_check_timer);
+	struct korina_private *lp = timer_container_of(lp, t, media_check_timer);
 	struct net_device *dev = lp->dev;
 
 	korina_check_media(dev, 0);
diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index 8cc888bf6094..5006696eb93d 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -1333,7 +1333,7 @@ static void mib_counters_update(struct mv643xx_eth_private *mp)
 
 static void mib_counters_timer_wrapper(struct timer_list *t)
 {
-	struct mv643xx_eth_private *mp = from_timer(mp, t, mib_counters_timer);
+	struct mv643xx_eth_private *mp = timer_container_of(mp, t, mib_counters_timer);
 	mib_counters_update(mp);
 	mod_timer(&mp->mib_counters_timer, jiffies + 30 * HZ);
 }
@@ -2306,7 +2306,7 @@ static int mv643xx_eth_poll(struct napi_struct *napi, int budget)
 
 static inline void oom_timer_wrapper(struct timer_list *t)
 {
-	struct mv643xx_eth_private *mp = from_timer(mp, t, rx_oom);
+	struct mv643xx_eth_private *mp = timer_container_of(mp, t, rx_oom);
 
 	napi_schedule(&mp->napi);
 }
diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet/marvell/pxa168_eth.c
index 72c1967768f4..e4cfdc8bc055 100644
--- a/drivers/net/ethernet/marvell/pxa168_eth.c
+++ b/drivers/net/ethernet/marvell/pxa168_eth.c
@@ -353,7 +353,7 @@ static void rxq_refill(struct net_device *dev)
 
 static inline void rxq_refill_timer_wrapper(struct timer_list *t)
 {
-	struct pxa168_eth_private *pep = from_timer(pep, t, timeout);
+	struct pxa168_eth_private *pep = timer_container_of(pep, t, timeout);
 	napi_schedule(&pep->napi);
 }
 
diff --git a/drivers/net/ethernet/marvell/skge.c b/drivers/net/ethernet/marvell/skge.c
index b2081d6e34f0..05349a0b2db1 100644
--- a/drivers/net/ethernet/marvell/skge.c
+++ b/drivers/net/ethernet/marvell/skge.c
@@ -1494,7 +1494,7 @@ static int xm_check_link(struct net_device *dev)
  */
 static void xm_link_timer(struct timer_list *t)
 {
-	struct skge_port *skge = from_timer(skge, t, link_timer);
+	struct skge_port *skge = timer_container_of(skge, t, link_timer);
 	struct net_device *dev = skge->netdev;
 	struct skge_hw *hw = skge->hw;
 	int port = skge->port;
diff --git a/drivers/net/ethernet/marvell/sky2.c b/drivers/net/ethernet/marvell/sky2.c
index e2a9aae8bc9b..3831f533b9db 100644
--- a/drivers/net/ethernet/marvell/sky2.c
+++ b/drivers/net/ethernet/marvell/sky2.c
@@ -2961,7 +2961,7 @@ static int sky2_rx_hung(struct net_device *dev)
 
 static void sky2_watchdog(struct timer_list *t)
 {
-	struct sky2_hw *hw = from_timer(hw, t, watchdog_timer);
+	struct sky2_hw *hw = timer_container_of(hw, t, watchdog_timer);
 
 	/* Check for lost IRQ once a second */
 	if (sky2_read32(hw, B0_ISRC)) {
diff --git a/drivers/net/ethernet/mellanox/mlx4/catas.c b/drivers/net/ethernet/mellanox/mlx4/catas.c
index 33ba0a5c38ac..edcc6f662618 100644
--- a/drivers/net/ethernet/mellanox/mlx4/catas.c
+++ b/drivers/net/ethernet/mellanox/mlx4/catas.c
@@ -236,7 +236,7 @@ static void dump_err_buf(struct mlx4_dev *dev)
 
 static void poll_catas(struct timer_list *t)
 {
-	struct mlx4_priv *priv = from_timer(priv, t, catas_err.timer);
+	struct mlx4_priv *priv = timer_container_of(priv, t, catas_err.timer);
 	struct mlx4_dev *dev = &priv->dev;
 	u32 slave_read;
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c b/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
index 5442a02c4097..d70351815d7c 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
@@ -278,7 +278,7 @@ static void mlx5_sync_reset_reload_work(struct work_struct *work)
 #define MLX5_RESET_POLL_INTERVAL	(HZ / 10)
 static void poll_sync_reset(struct timer_list *t)
 {
-	struct mlx5_fw_reset *fw_reset = from_timer(fw_reset, t, timer);
+	struct mlx5_fw_reset *fw_reset = timer_container_of(fw_reset, t, timer);
 	struct mlx5_core_dev *dev = fw_reset->dev;
 	u32 fatal_error;
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/health.c b/drivers/net/ethernet/mellanox/mlx5/core/health.c
index 624452ddebc0..e96eb0a8e511 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/health.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/health.c
@@ -779,7 +779,7 @@ static void mlx5_health_log_ts_update(struct work_struct *work)
 
 static void poll_health(struct timer_list *t)
 {
-	struct mlx5_core_dev *dev = from_timer(dev, t, priv.health.timer);
+	struct mlx5_core_dev *dev = timer_container_of(dev, t, priv.health.timer);
 	struct mlx5_core_health *health = &dev->priv.health;
 	struct health_buffer __iomem *h = health->health;
 	u32 fatal_error;
diff --git a/drivers/net/ethernet/micrel/ksz884x.c b/drivers/net/ethernet/micrel/ksz884x.c
index 1302aa8e0853..bdf42518d431 100644
--- a/drivers/net/ethernet/micrel/ksz884x.c
+++ b/drivers/net/ethernet/micrel/ksz884x.c
@@ -6304,7 +6304,7 @@ static void mib_read_work(struct work_struct *work)
 
 static void mib_monitor(struct timer_list *t)
 {
-	struct dev_info *hw_priv = from_timer(hw_priv, t, mib_timer_info.timer);
+	struct dev_info *hw_priv = timer_container_of(hw_priv, t, mib_timer_info.timer);
 
 	mib_read_work(&hw_priv->mib_read);
 
@@ -6331,7 +6331,7 @@ static void mib_monitor(struct timer_list *t)
  */
 static void dev_monitor(struct timer_list *t)
 {
-	struct dev_priv *priv = from_timer(priv, t, monitor_timer_info.timer);
+	struct dev_priv *priv = timer_container_of(priv, t, monitor_timer_info.timer);
 	struct net_device *dev = priv->mii_if.dev;
 	struct dev_info *hw_priv = priv->adapter;
 	struct ksz_hw *hw = &hw_priv->hw;
diff --git a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
index 7c501a758325..e611ff7fa3fa 100644
--- a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
+++ b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
@@ -3478,7 +3478,7 @@ static void myri10ge_watchdog_timer(struct timer_list *t)
 	u32 rx_pause_cnt;
 	u16 cmd;
 
-	mgp = from_timer(mgp, t, watchdog_timer);
+	mgp = timer_container_of(mgp, t, watchdog_timer);
 
 	rx_pause_cnt = ntohl(mgp->ss[0].fw_stats->dropped_pause);
 	busy_slice_cnt = 0;
diff --git a/drivers/net/ethernet/natsemi/natsemi.c b/drivers/net/ethernet/natsemi/natsemi.c
index 05606692e631..12ff5a4c6e44 100644
--- a/drivers/net/ethernet/natsemi/natsemi.c
+++ b/drivers/net/ethernet/natsemi/natsemi.c
@@ -1786,7 +1786,7 @@ static void init_registers(struct net_device *dev)
  */
 static void netdev_timer(struct timer_list *t)
 {
-	struct netdev_private *np = from_timer(np, t, timer);
+	struct netdev_private *np = timer_container_of(np, t, timer);
 	struct net_device *dev = np->dev;
 	void __iomem * ioaddr = ns_ioaddr(dev);
 	int next_tick = NATSEMI_TIMER_FREQ;
diff --git a/drivers/net/ethernet/natsemi/ns83820.c b/drivers/net/ethernet/natsemi/ns83820.c
index bf0347715a05..56d5464222d9 100644
--- a/drivers/net/ethernet/natsemi/ns83820.c
+++ b/drivers/net/ethernet/natsemi/ns83820.c
@@ -1587,7 +1587,7 @@ static void ns83820_tx_timeout(struct net_device *ndev, unsigned int txqueue)
 
 static void ns83820_tx_watch(struct timer_list *t)
 {
-	struct ns83820 *dev = from_timer(dev, t, tx_watchdog);
+	struct ns83820 *dev = timer_container_of(dev, t, tx_watchdog);
 	struct net_device *ndev = dev->ndev;
 
 #if defined(DEBUG)
diff --git a/drivers/net/ethernet/neterion/s2io.c b/drivers/net/ethernet/neterion/s2io.c
index 3e55e8dc664c..27443e346f9f 100644
--- a/drivers/net/ethernet/neterion/s2io.c
+++ b/drivers/net/ethernet/neterion/s2io.c
@@ -4195,7 +4195,7 @@ static netdev_tx_t s2io_xmit(struct sk_buff *skb, struct net_device *dev)
 static void
 s2io_alarm_handle(struct timer_list *t)
 {
-	struct s2io_nic *sp = from_timer(sp, t, alarm_timer);
+	struct s2io_nic *sp = timer_container_of(sp, t, alarm_timer);
 	struct net_device *dev = sp->dev;
 
 	s2io_handle_errors(dev);
diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
index 95514fabadf2..75bdf75c2dec 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
@@ -159,7 +159,7 @@ static int nfp_net_reconfig_wait(struct nfp_net *nn, unsigned long deadline)
 
 static void nfp_net_reconfig_timer(struct timer_list *t)
 {
-	struct nfp_net *nn = from_timer(nn, t, reconfig_timer);
+	struct nfp_net *nn = timer_container_of(nn, t, reconfig_timer);
 
 	spin_lock_bh(&nn->reconfig_lock);
 
diff --git a/drivers/net/ethernet/nvidia/forcedeth.c b/drivers/net/ethernet/nvidia/forcedeth.c
index 29cb74ccb25a..19aa1f1538aa 100644
--- a/drivers/net/ethernet/nvidia/forcedeth.c
+++ b/drivers/net/ethernet/nvidia/forcedeth.c
@@ -1891,7 +1891,7 @@ static int nv_alloc_rx_optimized(struct net_device *dev)
 /* If rx bufs are exhausted called after 50ms to attempt to refresh */
 static void nv_do_rx_refill(struct timer_list *t)
 {
-	struct fe_priv *np = from_timer(np, t, oom_kick);
+	struct fe_priv *np = timer_container_of(np, t, oom_kick);
 
 	/* Just reschedule NAPI rx processing */
 	napi_schedule(&np->napi);
@@ -4140,7 +4140,7 @@ static void nv_free_irq(struct net_device *dev)
 
 static void nv_do_nic_poll(struct timer_list *t)
 {
-	struct fe_priv *np = from_timer(np, t, nic_poll);
+	struct fe_priv *np = timer_container_of(np, t, nic_poll);
 	struct net_device *dev = np->dev;
 	u8 __iomem *base = get_hwbase(dev);
 	u32 mask = 0;
@@ -4259,7 +4259,7 @@ static void nv_do_stats_poll(struct timer_list *t)
 	__acquires(&netdev_priv(dev)->hwstats_lock)
 	__releases(&netdev_priv(dev)->hwstats_lock)
 {
-	struct fe_priv *np = from_timer(np, t, stats_poll);
+	struct fe_priv *np = timer_container_of(np, t, stats_poll);
 	struct net_device *dev = np->dev;
 
 	/* If lock is currently taken, the stats are being refreshed
diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index 1651df8a7c21..3f2739a479b0 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -1014,7 +1014,7 @@ static void pch_gbe_set_mode(struct pch_gbe_adapter *adapter, u16 speed,
  */
 static void pch_gbe_watchdog(struct timer_list *t)
 {
-	struct pch_gbe_adapter *adapter = from_timer(adapter, t,
+	struct pch_gbe_adapter *adapter = timer_container_of(adapter, t,
 						     watchdog_timer);
 	struct net_device *netdev = adapter->netdev;
 	struct pch_gbe_hw *hw = &adapter->hw;
diff --git a/drivers/net/ethernet/packetengines/hamachi.c b/drivers/net/ethernet/packetengines/hamachi.c
index 26bc8b3b1ec8..b0de7e9f12a5 100644
--- a/drivers/net/ethernet/packetengines/hamachi.c
+++ b/drivers/net/ethernet/packetengines/hamachi.c
@@ -1025,7 +1025,7 @@ static inline int hamachi_tx(struct net_device *dev)
 
 static void hamachi_timer(struct timer_list *t)
 {
-	struct hamachi_private *hmp = from_timer(hmp, t, timer);
+	struct hamachi_private *hmp = timer_container_of(hmp, t, timer);
 	struct net_device *dev = hmp->mii_if.dev;
 	void __iomem *ioaddr = hmp->base;
 	int next_tick = 10*HZ;
diff --git a/drivers/net/ethernet/packetengines/yellowfin.c b/drivers/net/ethernet/packetengines/yellowfin.c
index 21b760e65d73..1e25ac13a7d8 100644
--- a/drivers/net/ethernet/packetengines/yellowfin.c
+++ b/drivers/net/ethernet/packetengines/yellowfin.c
@@ -652,7 +652,7 @@ static int yellowfin_open(struct net_device *dev)
 
 static void yellowfin_timer(struct timer_list *t)
 {
-	struct yellowfin_private *yp = from_timer(yp, t, timer);
+	struct yellowfin_private *yp = timer_container_of(yp, t, timer);
 	struct net_device *dev = pci_get_drvdata(yp->pci_dev);
 	void __iomem *ioaddr = yp->base;
 	int next_tick = 60*HZ;
diff --git a/drivers/net/ethernet/pasemi/pasemi_mac.c b/drivers/net/ethernet/pasemi/pasemi_mac.c
index 801380729046..4e00175533e9 100644
--- a/drivers/net/ethernet/pasemi/pasemi_mac.c
+++ b/drivers/net/ethernet/pasemi/pasemi_mac.c
@@ -934,7 +934,7 @@ static irqreturn_t pasemi_mac_rx_intr(int irq, void *data)
 
 static void pasemi_mac_tx_timer(struct timer_list *t)
 {
-	struct pasemi_mac_txring *txring = from_timer(txring, t, clean_timer);
+	struct pasemi_mac_txring *txring = timer_container_of(txring, t, clean_timer);
 	struct pasemi_mac *mac = txring->mac;
 
 	pasemi_mac_clean_tx(txring);
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_dev.c b/drivers/net/ethernet/pensando/ionic/ionic_dev.c
index 57edcde9e6f8..18b9c8a810ae 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_dev.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_dev.c
@@ -13,7 +13,7 @@
 
 static void ionic_watchdog_cb(struct timer_list *t)
 {
-	struct ionic *ionic = from_timer(ionic, t, watchdog_timer);
+	struct ionic *ionic = timer_container_of(ionic, t, watchdog_timer);
 	struct ionic_lif *lif = ionic->lif;
 	struct ionic_deferred_work *work;
 	int hb;
diff --git a/drivers/net/ethernet/qlogic/qla3xxx.c b/drivers/net/ethernet/qlogic/qla3xxx.c
index bf5bf8c95c85..aee4e63b4b82 100644
--- a/drivers/net/ethernet/qlogic/qla3xxx.c
+++ b/drivers/net/ethernet/qlogic/qla3xxx.c
@@ -3735,7 +3735,7 @@ static void ql_get_board_info(struct ql3_adapter *qdev)
 
 static void ql3xxx_timer(struct timer_list *t)
 {
-	struct ql3_adapter *qdev = from_timer(qdev, t, adapter_timer);
+	struct ql3_adapter *qdev = timer_container_of(qdev, t, adapter_timer);
 	queue_delayed_work(qdev->workqueue, &qdev->link_state_work, 0);
 }
 
diff --git a/drivers/net/ethernet/realtek/atp.c b/drivers/net/ethernet/realtek/atp.c
index c73a57e4a144..0d65434982a2 100644
--- a/drivers/net/ethernet/realtek/atp.c
+++ b/drivers/net/ethernet/realtek/atp.c
@@ -717,7 +717,7 @@ static irqreturn_t atp_interrupt(int irq, void *dev_instance)
    problem where the adapter forgets its ethernet address. */
 static void atp_timed_checker(struct timer_list *t)
 {
-	struct net_local *lp = from_timer(lp, t, timer);
+	struct net_local *lp = timer_container_of(lp, t, timer);
 	struct net_device *dev = lp->dev;
 	long ioaddr = dev->base_addr;
 	int tickssofar = jiffies - lp->last_rx_time;
diff --git a/drivers/net/ethernet/rocker/rocker_ofdpa.c b/drivers/net/ethernet/rocker/rocker_ofdpa.c
index d5db26103d82..c7170b21c445 100644
--- a/drivers/net/ethernet/rocker/rocker_ofdpa.c
+++ b/drivers/net/ethernet/rocker/rocker_ofdpa.c
@@ -1982,7 +1982,7 @@ static int ofdpa_port_fdb_flush(struct ofdpa_port *ofdpa_port, int flags)
 
 static void ofdpa_fdb_cleanup(struct timer_list *t)
 {
-	struct ofdpa *ofdpa = from_timer(ofdpa, t, fdb_cleanup_timer);
+	struct ofdpa *ofdpa = timer_container_of(ofdpa, t, fdb_cleanup_timer);
 	struct ofdpa_port *ofdpa_port;
 	struct ofdpa_fdb_tbl_entry *entry;
 	struct hlist_node *tmp;
diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c b/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
index 36b63bf343a9..f0da8f118ab8 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
@@ -104,7 +104,7 @@ void sxgbe_disable_eee_mode(struct sxgbe_priv_data * const priv)
  */
 static void sxgbe_eee_ctrl_timer(struct timer_list *t)
 {
-	struct sxgbe_priv_data *priv = from_timer(priv, t, eee_ctrl_timer);
+	struct sxgbe_priv_data *priv = timer_container_of(priv, t, eee_ctrl_timer);
 
 	sxgbe_enable_eee_mode(priv);
 	mod_timer(&priv->eee_ctrl_timer, SXGBE_LPI_TIMER(eee_timer));
@@ -1012,7 +1012,7 @@ static void sxgbe_disable_mtl_engine(struct sxgbe_priv_data *priv)
  */
 static void sxgbe_tx_timer(struct timer_list *t)
 {
-	struct sxgbe_tx_queue *p = from_timer(p, t, txtimer);
+	struct sxgbe_tx_queue *p = timer_container_of(p, t, txtimer);
 	sxgbe_tx_queue_clean(p);
 }
 
diff --git a/drivers/net/ethernet/seeq/ether3.c b/drivers/net/ethernet/seeq/ether3.c
index 1d65113fab76..20dad39b5ab9 100644
--- a/drivers/net/ethernet/seeq/ether3.c
+++ b/drivers/net/ethernet/seeq/ether3.c
@@ -170,7 +170,7 @@ ether3_setbuffer(struct net_device *dev, buffer_rw_t read, int start)
  */
 static void ether3_ledoff(struct timer_list *t)
 {
-	struct dev_priv *private = from_timer(private, t, timer);
+	struct dev_priv *private = timer_container_of(private, t, timer);
 	struct net_device *dev = private->dev;
 
 	ether3_outw(priv(dev)->regs.config2 |= CFG2_CTRLO, REG_CONFIG2);
diff --git a/drivers/net/ethernet/sfc/falcon/falcon.c b/drivers/net/ethernet/sfc/falcon/falcon.c
index b865275beb66..182a393ef6bc 100644
--- a/drivers/net/ethernet/sfc/falcon/falcon.c
+++ b/drivers/net/ethernet/sfc/falcon/falcon.c
@@ -1453,7 +1453,7 @@ static void falcon_stats_complete(struct ef4_nic *efx)
 
 static void falcon_stats_timer_func(struct timer_list *t)
 {
-	struct falcon_nic_data *nic_data = from_timer(nic_data, t,
+	struct falcon_nic_data *nic_data = timer_container_of(nic_data, t,
 						      stats_timer);
 	struct ef4_nic *efx = nic_data->efx;
 
diff --git a/drivers/net/ethernet/sfc/falcon/rx.c b/drivers/net/ethernet/sfc/falcon/rx.c
index 38ad7ac07726..e788faf73945 100644
--- a/drivers/net/ethernet/sfc/falcon/rx.c
+++ b/drivers/net/ethernet/sfc/falcon/rx.c
@@ -382,7 +382,7 @@ void ef4_fast_push_rx_descriptors(struct ef4_rx_queue *rx_queue, bool atomic)
 
 void ef4_rx_slow_fill(struct timer_list *t)
 {
-	struct ef4_rx_queue *rx_queue = from_timer(rx_queue, t, slow_fill);
+	struct ef4_rx_queue *rx_queue = timer_container_of(rx_queue, t, slow_fill);
 
 	/* Post an event to cause NAPI to run and refill the queue */
 	ef4_nic_generate_fill_event(rx_queue);
diff --git a/drivers/net/ethernet/sfc/mcdi.c b/drivers/net/ethernet/sfc/mcdi.c
index dcef0588be96..5e9b8def5e42 100644
--- a/drivers/net/ethernet/sfc/mcdi.c
+++ b/drivers/net/ethernet/sfc/mcdi.c
@@ -605,7 +605,7 @@ static void efx_mcdi_ev_cpl(struct efx_nic *efx, unsigned int seqno,
 
 static void efx_mcdi_timeout_async(struct timer_list *t)
 {
-	struct efx_mcdi_iface *mcdi = from_timer(mcdi, t, async_timer);
+	struct efx_mcdi_iface *mcdi = timer_container_of(mcdi, t, async_timer);
 
 	efx_mcdi_complete_async(mcdi, true);
 }
diff --git a/drivers/net/ethernet/sfc/rx_common.c b/drivers/net/ethernet/sfc/rx_common.c
index 8eb272ba674b..d28957288413 100644
--- a/drivers/net/ethernet/sfc/rx_common.c
+++ b/drivers/net/ethernet/sfc/rx_common.c
@@ -352,7 +352,7 @@ void efx_free_rx_buffers(struct efx_rx_queue *rx_queue,
 
 void efx_rx_slow_fill(struct timer_list *t)
 {
-	struct efx_rx_queue *rx_queue = from_timer(rx_queue, t, slow_fill);
+	struct efx_rx_queue *rx_queue = timer_container_of(rx_queue, t, slow_fill);
 
 	/* Post an event to cause NAPI to run and refill the queue */
 	efx_nic_generate_fill_event(rx_queue);
diff --git a/drivers/net/ethernet/sfc/siena/mcdi.c b/drivers/net/ethernet/sfc/siena/mcdi.c
index 99ab5f294691..c8f0fb43e285 100644
--- a/drivers/net/ethernet/sfc/siena/mcdi.c
+++ b/drivers/net/ethernet/sfc/siena/mcdi.c
@@ -609,7 +609,7 @@ static void efx_mcdi_ev_cpl(struct efx_nic *efx, unsigned int seqno,
 
 static void efx_mcdi_timeout_async(struct timer_list *t)
 {
-	struct efx_mcdi_iface *mcdi = from_timer(mcdi, t, async_timer);
+	struct efx_mcdi_iface *mcdi = timer_container_of(mcdi, t, async_timer);
 
 	efx_mcdi_complete_async(mcdi, true);
 }
diff --git a/drivers/net/ethernet/sfc/siena/rx_common.c b/drivers/net/ethernet/sfc/siena/rx_common.c
index ab493e529d5c..9f97f590c2fb 100644
--- a/drivers/net/ethernet/sfc/siena/rx_common.c
+++ b/drivers/net/ethernet/sfc/siena/rx_common.c
@@ -349,7 +349,7 @@ void efx_siena_free_rx_buffers(struct efx_rx_queue *rx_queue,
 
 void efx_siena_rx_slow_fill(struct timer_list *t)
 {
-	struct efx_rx_queue *rx_queue = from_timer(rx_queue, t, slow_fill);
+	struct efx_rx_queue *rx_queue = timer_container_of(rx_queue, t, slow_fill);
 
 	/* Post an event to cause NAPI to run and refill the queue */
 	efx_nic_generate_fill_event(rx_queue);
diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
index 7196e1c607f3..39731069d99e 100644
--- a/drivers/net/ethernet/sgi/ioc3-eth.c
+++ b/drivers/net/ethernet/sgi/ioc3-eth.c
@@ -570,7 +570,7 @@ static inline void ioc3_setup_duplex(struct ioc3_private *ip)
 
 static void ioc3_timer(struct timer_list *t)
 {
-	struct ioc3_private *ip = from_timer(ip, t, ioc3_timer);
+	struct ioc3_private *ip = timer_container_of(ip, t, ioc3_timer);
 
 	/* Print the link status if it has changed */
 	mii_check_media(&ip->mii, 1, 0);
diff --git a/drivers/net/ethernet/sis/sis190.c b/drivers/net/ethernet/sis/sis190.c
index d10b14787607..15e46e6ac262 100644
--- a/drivers/net/ethernet/sis/sis190.c
+++ b/drivers/net/ethernet/sis/sis190.c
@@ -1023,7 +1023,7 @@ static void sis190_phy_task(struct work_struct *work)
 
 static void sis190_phy_timer(struct timer_list *t)
 {
-	struct sis190_private *tp = from_timer(tp, t, timer);
+	struct sis190_private *tp = timer_container_of(tp, t, timer);
 	struct net_device *dev = tp->dev;
 
 	if (likely(netif_running(dev)))
diff --git a/drivers/net/ethernet/sis/sis900.c b/drivers/net/ethernet/sis/sis900.c
index 332cbd725900..3172f898171d 100644
--- a/drivers/net/ethernet/sis/sis900.c
+++ b/drivers/net/ethernet/sis/sis900.c
@@ -1314,7 +1314,7 @@ static void sis630_set_eq(struct net_device *net_dev, u8 revision)
 
 static void sis900_timer(struct timer_list *t)
 {
-	struct sis900_private *sis_priv = from_timer(sis_priv, t, timer);
+	struct sis900_private *sis_priv = timer_container_of(sis_priv, t, timer);
 	struct net_device *net_dev = sis_priv->mii_info.dev;
 	struct mii_phy *mii_phy = sis_priv->mii;
 	static const int next_tick = 5*HZ;
diff --git a/drivers/net/ethernet/smsc/epic100.c b/drivers/net/ethernet/smsc/epic100.c
index ca0ab3a35b73..45f703fe0e5a 100644
--- a/drivers/net/ethernet/smsc/epic100.c
+++ b/drivers/net/ethernet/smsc/epic100.c
@@ -850,7 +850,7 @@ static void check_media(struct net_device *dev)
 
 static void epic_timer(struct timer_list *t)
 {
-	struct epic_private *ep = from_timer(ep, t, timer);
+	struct epic_private *ep = timer_container_of(ep, t, timer);
 	struct net_device *dev = ep->mii.dev;
 	void __iomem *ioaddr = ep->ioaddr;
 	int next_tick = 5*HZ;
diff --git a/drivers/net/ethernet/smsc/smc91c92_cs.c b/drivers/net/ethernet/smsc/smc91c92_cs.c
index 6fa957fb523b..cc0c75694351 100644
--- a/drivers/net/ethernet/smsc/smc91c92_cs.c
+++ b/drivers/net/ethernet/smsc/smc91c92_cs.c
@@ -1713,7 +1713,7 @@ static void smc_reset(struct net_device *dev)
 
 static void media_check(struct timer_list *t)
 {
-    struct smc_private *smc = from_timer(smc, t, media);
+    struct smc_private *smc = timer_container_of(smc, t, media);
     struct net_device *dev = smc->mii_if.dev;
     unsigned int ioaddr = dev->base_addr;
     u_short i, media, saved_bank;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 3a4bee029c7f..6babf2f2fcd3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -174,7 +174,7 @@ void stmmac_fpe_irq_status(struct stmmac_priv *priv)
  */
 static void stmmac_fpe_verify_timer(struct timer_list *t)
 {
-	struct stmmac_fpe_cfg *fpe_cfg = from_timer(fpe_cfg, t, verify_timer);
+	struct stmmac_fpe_cfg *fpe_cfg = timer_container_of(fpe_cfg, t, verify_timer);
 	struct stmmac_priv *priv = container_of(fpe_cfg, struct stmmac_priv,
 						fpe_cfg);
 	unsigned long flags;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 59d07d0d3369..f173a7689331 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -481,7 +481,7 @@ static void stmmac_stop_sw_lpi(struct stmmac_priv *priv)
  */
 static void stmmac_eee_ctrl_timer(struct timer_list *t)
 {
-	struct stmmac_priv *priv = from_timer(priv, t, eee_ctrl_timer);
+	struct stmmac_priv *priv = timer_container_of(priv, t, eee_ctrl_timer);
 
 	stmmac_try_to_start_sw_lpi(priv);
 }
diff --git a/drivers/net/ethernet/sun/cassini.c b/drivers/net/ethernet/sun/cassini.c
index b777e5a099eb..acfb523214b9 100644
--- a/drivers/net/ethernet/sun/cassini.c
+++ b/drivers/net/ethernet/sun/cassini.c
@@ -4021,7 +4021,7 @@ static void cas_reset_task(struct work_struct *work)
 
 static void cas_link_timer(struct timer_list *t)
 {
-	struct cas *cp = from_timer(cp, t, link_timer);
+	struct cas *cp = timer_container_of(cp, t, link_timer);
 	int mask, pending = 0, reset = 0;
 	unsigned long flags;
 
diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index 73c07f10f053..2f185827abba 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -2225,7 +2225,7 @@ static int niu_link_status(struct niu *np, int *link_up_p)
 
 static void niu_timer(struct timer_list *t)
 {
-	struct niu *np = from_timer(np, t, timer);
+	struct niu *np = timer_container_of(np, t, timer);
 	unsigned long off;
 	int err, link_up;
 
diff --git a/drivers/net/ethernet/sun/sunbmac.c b/drivers/net/ethernet/sun/sunbmac.c
index d2c82102133c..edb2fd3a6551 100644
--- a/drivers/net/ethernet/sun/sunbmac.c
+++ b/drivers/net/ethernet/sun/sunbmac.c
@@ -526,7 +526,7 @@ static int try_next_permutation(struct bigmac *bp, void __iomem *tregs)
 
 static void bigmac_timer(struct timer_list *t)
 {
-	struct bigmac *bp = from_timer(bp, t, bigmac_timer);
+	struct bigmac *bp = timer_container_of(bp, t, bigmac_timer);
 	void __iomem *tregs = bp->tregs;
 	int restart_timer = 0;
 
diff --git a/drivers/net/ethernet/sun/sungem.c b/drivers/net/ethernet/sun/sungem.c
index 06579d7b5220..8e69d917d827 100644
--- a/drivers/net/ethernet/sun/sungem.c
+++ b/drivers/net/ethernet/sun/sungem.c
@@ -1481,7 +1481,7 @@ static int gem_mdio_link_not_up(struct gem *gp)
 
 static void gem_link_timer(struct timer_list *t)
 {
-	struct gem *gp = from_timer(gp, t, link_timer);
+	struct gem *gp = timer_container_of(gp, t, link_timer);
 	struct net_device *dev = gp->dev;
 	int restart_aneg = 0;
 
diff --git a/drivers/net/ethernet/sun/sunhme.c b/drivers/net/ethernet/sun/sunhme.c
index 9a7586623318..4bc0e114d5ee 100644
--- a/drivers/net/ethernet/sun/sunhme.c
+++ b/drivers/net/ethernet/sun/sunhme.c
@@ -721,7 +721,7 @@ happy_meal_begin_auto_negotiation(struct happy_meal *hp,
 
 static void happy_meal_timer(struct timer_list *t)
 {
-	struct happy_meal *hp = from_timer(hp, t, happy_timer);
+	struct happy_meal *hp = timer_container_of(hp, t, happy_timer);
 	void __iomem *tregs = hp->tcvregs;
 	int restart_timer = 0;
 
diff --git a/drivers/net/ethernet/sun/sunvnet_common.c b/drivers/net/ethernet/sun/sunvnet_common.c
index ddc6d46a7a86..0212853c9430 100644
--- a/drivers/net/ethernet/sun/sunvnet_common.c
+++ b/drivers/net/ethernet/sun/sunvnet_common.c
@@ -1044,7 +1044,7 @@ static inline void vnet_free_skbs(struct sk_buff *skb)
 
 void sunvnet_clean_timer_expire_common(struct timer_list *t)
 {
-	struct vnet_port *port = from_timer(port, t, clean_timer);
+	struct vnet_port *port = timer_container_of(port, t, clean_timer);
 	struct sk_buff *freeskbs;
 	unsigned pending;
 
diff --git a/drivers/net/ethernet/synopsys/dwc-xlgmac-net.c b/drivers/net/ethernet/synopsys/dwc-xlgmac-net.c
index 24e4b246f25f..9fda2fabfd1e 100644
--- a/drivers/net/ethernet/synopsys/dwc-xlgmac-net.c
+++ b/drivers/net/ethernet/synopsys/dwc-xlgmac-net.c
@@ -360,7 +360,7 @@ static irqreturn_t xlgmac_dma_isr(int irq, void *data)
 
 static void xlgmac_tx_timer(struct timer_list *t)
 {
-	struct xlgmac_channel *channel = from_timer(channel, t, tx_timer);
+	struct xlgmac_channel *channel = timer_container_of(channel, t, tx_timer);
 	struct xlgmac_pdata *pdata = channel->pdata;
 	struct napi_struct *napi;
 
diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 7f77694ecfba..fbe35af615a6 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1231,7 +1231,7 @@ int cpsw_ale_rx_ratelimit_bc(struct cpsw_ale *ale, int port, unsigned int rateli
 
 static void cpsw_ale_timer(struct timer_list *t)
 {
-	struct cpsw_ale *ale = from_timer(ale, t, timer);
+	struct cpsw_ale *ale = timer_container_of(ale, t, timer);
 
 	cpsw_ale_control_set(ale, 0, ALE_AGEOUT, 1);
 
diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
index fd2b74508980..55a1a96cd834 100644
--- a/drivers/net/ethernet/ti/netcp_ethss.c
+++ b/drivers/net/ethernet/ti/netcp_ethss.c
@@ -2833,7 +2833,7 @@ static int gbe_ioctl(void *intf_priv, struct ifreq *req, int cmd)
 
 static void netcp_ethss_timer(struct timer_list *t)
 {
-	struct gbe_priv *gbe_dev = from_timer(gbe_dev, t, timer);
+	struct gbe_priv *gbe_dev = timer_container_of(gbe_dev, t, timer);
 	struct gbe_intf *gbe_intf;
 	struct gbe_slave *slave;
 
diff --git a/drivers/net/ethernet/ti/tlan.c b/drivers/net/ethernet/ti/tlan.c
index d9240fb91747..a55b0f951181 100644
--- a/drivers/net/ethernet/ti/tlan.c
+++ b/drivers/net/ethernet/ti/tlan.c
@@ -1815,7 +1815,7 @@ ThunderLAN driver timer function
 
 static void tlan_timer(struct timer_list *t)
 {
-	struct tlan_priv	*priv = from_timer(priv, t, timer);
+	struct tlan_priv	*priv = timer_container_of(priv, t, timer);
 	struct net_device	*dev = priv->dev;
 	u32		elapsed;
 	unsigned long	flags = 0;
@@ -2746,7 +2746,7 @@ static void tlan_phy_finish_auto_neg(struct net_device *dev)
 
 static void tlan_phy_monitor(struct timer_list *t)
 {
-	struct tlan_priv *priv = from_timer(priv, t, media_timer);
+	struct tlan_priv *priv = timer_container_of(priv, t, media_timer);
 	struct net_device *dev = priv->dev;
 	u16     phy;
 	u16     phy_status;
diff --git a/drivers/net/ethernet/tundra/tsi108_eth.c b/drivers/net/ethernet/tundra/tsi108_eth.c
index 7ec0e3c13d54..7e0b3d694ac0 100644
--- a/drivers/net/ethernet/tundra/tsi108_eth.c
+++ b/drivers/net/ethernet/tundra/tsi108_eth.c
@@ -1652,7 +1652,7 @@ tsi108_init_one(struct platform_device *pdev)
 
 static void tsi108_timed_checker(struct timer_list *t)
 {
-	struct tsi108_prv_data *data = from_timer(data, t, timer);
+	struct tsi108_prv_data *data = timer_container_of(data, t, timer);
 	struct net_device *dev = data->dev;
 
 	tsi108_check_phy(dev);
diff --git a/drivers/net/fddi/defza.c b/drivers/net/fddi/defza.c
index 54b7f24f3810..2098c3068d34 100644
--- a/drivers/net/fddi/defza.c
+++ b/drivers/net/fddi/defza.c
@@ -1044,7 +1044,7 @@ static irqreturn_t fza_interrupt(int irq, void *dev_id)
 
 static void fza_reset_timer(struct timer_list *t)
 {
-	struct fza_private *fp = from_timer(fp, t, reset_timer);
+	struct fza_private *fp = timer_container_of(fp, t, reset_timer);
 
 	if (!fp->timer_state) {
 		pr_err("%s: RESET timed out!\n", fp->name);
diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index b33d84ed5bbf..c5e5423e1863 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -133,7 +133,7 @@ static int encode_sixpack(unsigned char *, unsigned char *, int, unsigned char);
 
 static void sp_xmit_on_air(struct timer_list *t)
 {
-	struct sixpack *sp = from_timer(sp, t, tx_t);
+	struct sixpack *sp = timer_container_of(sp, t, tx_t);
 	int actual, when = sp->slottime;
 	static unsigned char random;
 
@@ -491,7 +491,7 @@ static inline void tnc_set_sync_state(struct sixpack *sp, int new_tnc_state)
 
 static void resync_tnc(struct timer_list *t)
 {
-	struct sixpack *sp = from_timer(sp, t, resync_t);
+	struct sixpack *sp = timer_container_of(sp, t, resync_t);
 	static char resync_cmd = 0xe8;
 
 	/* clear any data that might have been received */
diff --git a/drivers/net/hamradio/scc.c b/drivers/net/hamradio/scc.c
index f88721dec681..ae5048efde68 100644
--- a/drivers/net/hamradio/scc.c
+++ b/drivers/net/hamradio/scc.c
@@ -1127,7 +1127,7 @@ static inline int is_grouped(struct scc_channel *scc)
 
 static void t_dwait(struct timer_list *t)
 {
-	struct scc_channel *scc = from_timer(scc, t, tx_t);
+	struct scc_channel *scc = timer_container_of(scc, t, tx_t);
 	
 	if (scc->stat.tx_state == TXS_WAIT)	/* maxkeyup or idle timeout */
 	{
@@ -1169,7 +1169,7 @@ static void t_dwait(struct timer_list *t)
 
 static void t_txdelay(struct timer_list *t)
 {
-	struct scc_channel *scc = from_timer(scc, t, tx_t);
+	struct scc_channel *scc = timer_container_of(scc, t, tx_t);
 
 	scc_start_maxkeyup(scc);
 
@@ -1190,7 +1190,7 @@ static void t_txdelay(struct timer_list *t)
 
 static void t_tail(struct timer_list *t)
 {
-	struct scc_channel *scc = from_timer(scc, t, tx_t);
+	struct scc_channel *scc = timer_container_of(scc, t, tx_t);
 	unsigned long flags;
 	
 	spin_lock_irqsave(&scc->lock, flags); 
@@ -1217,7 +1217,7 @@ static void t_tail(struct timer_list *t)
 
 static void t_busy(struct timer_list *t)
 {
-	struct scc_channel *scc = from_timer(scc, t, tx_wdog);
+	struct scc_channel *scc = timer_container_of(scc, t, tx_wdog);
 
 	timer_delete(&scc->tx_t);
 	netif_stop_queue(scc->dev);	/* don't pile on the wabbit! */
@@ -1236,7 +1236,7 @@ static void t_busy(struct timer_list *t)
 
 static void t_maxkeyup(struct timer_list *t)
 {
-	struct scc_channel *scc = from_timer(scc, t, tx_wdog);
+	struct scc_channel *scc = timer_container_of(scc, t, tx_wdog);
 	unsigned long flags;
 
 	spin_lock_irqsave(&scc->lock, flags);
@@ -1270,7 +1270,7 @@ static void t_maxkeyup(struct timer_list *t)
 
 static void t_idle(struct timer_list *t)
 {
-	struct scc_channel *scc = from_timer(scc, t, tx_t);
+	struct scc_channel *scc = timer_container_of(scc, t, tx_t);
 	
 	timer_delete(&scc->tx_wdog);
 
@@ -1403,7 +1403,7 @@ static unsigned long scc_get_param(struct scc_channel *scc, unsigned int cmd)
 
 static void scc_stop_calibrate(struct timer_list *t)
 {
-	struct scc_channel *scc = from_timer(scc, t, tx_wdog);
+	struct scc_channel *scc = timer_container_of(scc, t, tx_wdog);
 	unsigned long flags;
 	
 	spin_lock_irqsave(&scc->lock, flags);
diff --git a/drivers/net/hippi/rrunner.c b/drivers/net/hippi/rrunner.c
index 6342c319c0e4..7b7e7a47a75e 100644
--- a/drivers/net/hippi/rrunner.c
+++ b/drivers/net/hippi/rrunner.c
@@ -1154,7 +1154,7 @@ static inline void rr_raz_rx(struct rr_private *rrpriv,
 
 static void rr_timer(struct timer_list *t)
 {
-	struct rr_private *rrpriv = from_timer(rrpriv, t, timer);
+	struct rr_private *rrpriv = timer_container_of(rrpriv, t, timer);
 	struct net_device *dev = pci_get_drvdata(rrpriv->pci_dev);
 	struct rr_regs __iomem *regs = rrpriv->regs;
 	unsigned long flags;
diff --git a/drivers/net/ntb_netdev.c b/drivers/net/ntb_netdev.c
index ef4204638392..fbeae05817e9 100644
--- a/drivers/net/ntb_netdev.c
+++ b/drivers/net/ntb_netdev.c
@@ -229,7 +229,7 @@ static netdev_tx_t ntb_netdev_start_xmit(struct sk_buff *skb,
 
 static void ntb_netdev_tx_timer(struct timer_list *t)
 {
-	struct ntb_netdev *dev = from_timer(dev, t, tx_timer);
+	struct ntb_netdev *dev = timer_container_of(dev, t, tx_timer);
 	struct net_device *ndev = dev->ndev;
 
 	if (ntb_transport_tx_free_entry(dev->qp) < tx_stop) {
diff --git a/drivers/net/slip/slip.c b/drivers/net/slip/slip.c
index 3cfa17cd5073..c889fb374703 100644
--- a/drivers/net/slip/slip.c
+++ b/drivers/net/slip/slip.c
@@ -1378,7 +1378,7 @@ module_exit(slip_exit);
 
 static void sl_outfill(struct timer_list *t)
 {
-	struct slip *sl = from_timer(sl, t, outfill_timer);
+	struct slip *sl = timer_container_of(sl, t, outfill_timer);
 
 	spin_lock(&sl->lock);
 
@@ -1409,7 +1409,7 @@ static void sl_outfill(struct timer_list *t)
 
 static void sl_keepalive(struct timer_list *t)
 {
-	struct slip *sl = from_timer(sl, t, keepalive_timer);
+	struct slip *sl = timer_container_of(sl, t, keepalive_timer);
 
 	spin_lock(&sl->lock);
 
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 7babd1e9a378..afd3c4a8c3ea 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -377,7 +377,7 @@ static void tun_flow_delete_by_queue(struct tun_struct *tun, u16 queue_index)
 
 static void tun_flow_cleanup(struct timer_list *t)
 {
-	struct tun_struct *tun = from_timer(tun, t, flow_gc_timer);
+	struct tun_struct *tun = timer_container_of(tun, t, flow_gc_timer);
 	unsigned long delay = tun->ageing_time;
 	unsigned long next_timer = jiffies + delay;
 	unsigned long count = 0;
diff --git a/drivers/net/usb/catc.c b/drivers/net/usb/catc.c
index fc5e441aa7c3..6759388692f8 100644
--- a/drivers/net/usb/catc.c
+++ b/drivers/net/usb/catc.c
@@ -602,7 +602,7 @@ static void catc_stats_done(struct catc *catc, struct ctrl_queue *q)
 
 static void catc_stats_timer(struct timer_list *t)
 {
-	struct catc *catc = from_timer(catc, t, timer);
+	struct catc *catc = timer_container_of(catc, t, timer);
 	int i;
 
 	for (i = 0; i < 8; i++)
diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index e4f1663b6204..7377188fb476 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -4419,7 +4419,7 @@ static const struct net_device_ops lan78xx_netdev_ops = {
 
 static void lan78xx_stat_monitor(struct timer_list *t)
 {
-	struct lan78xx_net *dev = from_timer(dev, t, stat_monitor);
+	struct lan78xx_net *dev = timer_container_of(dev, t, stat_monitor);
 
 	lan78xx_defer_kevent(dev, EVENT_STAT_UPDATE);
 }
diff --git a/drivers/net/usb/sierra_net.c b/drivers/net/usb/sierra_net.c
index dec6e82eb0e0..c30ca415d1d3 100644
--- a/drivers/net/usb/sierra_net.c
+++ b/drivers/net/usb/sierra_net.c
@@ -573,7 +573,7 @@ static void sierra_net_defer_kevent(struct usbnet *dev, int work)
  */
 static void sierra_sync_timer(struct timer_list *t)
 {
-	struct sierra_net_data *priv = from_timer(priv, t, sync_timer);
+	struct sierra_net_data *priv = timer_container_of(priv, t, sync_timer);
 	struct usbnet *dev = priv->usbnet;
 
 	dev_dbg(&dev->udev->dev, "%s", __func__);
diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index c39dfa17813a..c04e715a4c2a 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -1551,7 +1551,7 @@ static inline void usb_free_skb(struct sk_buff *skb)
 
 static void usbnet_bh (struct timer_list *t)
 {
-	struct usbnet		*dev = from_timer(dev, t, delay);
+	struct usbnet		*dev = timer_container_of(dev, t, delay);
 	struct sk_buff		*skb;
 	struct skb_data		*entry;
 
diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index 9ccc3f09f71b..2cd67b3b7975 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -2835,7 +2835,7 @@ static netdev_tx_t vxlan_xmit(struct sk_buff *skb, struct net_device *dev)
 /* Walk the forwarding table and purge stale entries */
 static void vxlan_cleanup(struct timer_list *t)
 {
-	struct vxlan_dev *vxlan = from_timer(vxlan, t, age_timer);
+	struct vxlan_dev *vxlan = timer_container_of(vxlan, t, age_timer);
 	unsigned long next_timer = jiffies + FDB_AGE_INTERVAL;
 	unsigned int h;
 
diff --git a/drivers/net/wan/hdlc_cisco.c b/drivers/net/wan/hdlc_cisco.c
index 7e653432c139..bfc978b15bc2 100644
--- a/drivers/net/wan/hdlc_cisco.c
+++ b/drivers/net/wan/hdlc_cisco.c
@@ -244,7 +244,7 @@ static int cisco_rx(struct sk_buff *skb)
 
 static void cisco_timer(struct timer_list *t)
 {
-	struct cisco_state *st = from_timer(st, t, timer);
+	struct cisco_state *st = timer_container_of(st, t, timer);
 	struct net_device *dev = st->dev;
 
 	spin_lock(&st->lock);
diff --git a/drivers/net/wan/hdlc_fr.c b/drivers/net/wan/hdlc_fr.c
index 34014f427060..08a0ba5ca471 100644
--- a/drivers/net/wan/hdlc_fr.c
+++ b/drivers/net/wan/hdlc_fr.c
@@ -581,7 +581,7 @@ static void fr_set_link_state(int reliable, struct net_device *dev)
 
 static void fr_timer(struct timer_list *t)
 {
-	struct frad_state *st = from_timer(st, t, timer);
+	struct frad_state *st = timer_container_of(st, t, timer);
 	struct net_device *dev = st->dev;
 	hdlc_device *hdlc = dev_to_hdlc(dev);
 	int i, cnt = 0, reliable;
diff --git a/drivers/net/wan/hdlc_ppp.c b/drivers/net/wan/hdlc_ppp.c
index 19921b02846d..7496a2e9a282 100644
--- a/drivers/net/wan/hdlc_ppp.c
+++ b/drivers/net/wan/hdlc_ppp.c
@@ -561,7 +561,7 @@ static int ppp_rx(struct sk_buff *skb)
 
 static void ppp_timer(struct timer_list *t)
 {
-	struct proto *proto = from_timer(proto, t, timer);
+	struct proto *proto = timer_container_of(proto, t, timer);
 	struct ppp *ppp = get_ppp(proto->dev);
 	unsigned long flags;
 
diff --git a/drivers/net/wireguard/timers.c b/drivers/net/wireguard/timers.c
index a9e0890c2f77..3061e20fcc22 100644
--- a/drivers/net/wireguard/timers.c
+++ b/drivers/net/wireguard/timers.c
@@ -40,7 +40,7 @@ static inline void mod_peer_timer(struct wg_peer *peer,
 
 static void wg_expired_retransmit_handshake(struct timer_list *timer)
 {
-	struct wg_peer *peer = from_timer(peer, timer,
+	struct wg_peer *peer = timer_container_of(peer, timer,
 					  timer_retransmit_handshake);
 
 	if (peer->timer_handshake_attempts > MAX_TIMER_HANDSHAKES) {
@@ -78,7 +78,7 @@ static void wg_expired_retransmit_handshake(struct timer_list *timer)
 
 static void wg_expired_send_keepalive(struct timer_list *timer)
 {
-	struct wg_peer *peer = from_timer(peer, timer, timer_send_keepalive);
+	struct wg_peer *peer = timer_container_of(peer, timer, timer_send_keepalive);
 
 	wg_packet_send_keepalive(peer);
 	if (peer->timer_need_another_keepalive) {
@@ -90,7 +90,7 @@ static void wg_expired_send_keepalive(struct timer_list *timer)
 
 static void wg_expired_new_handshake(struct timer_list *timer)
 {
-	struct wg_peer *peer = from_timer(peer, timer, timer_new_handshake);
+	struct wg_peer *peer = timer_container_of(peer, timer, timer_new_handshake);
 
 	pr_debug("%s: Retrying handshake with peer %llu (%pISpfsc) because we stopped hearing back after %d seconds\n",
 		 peer->device->dev->name, peer->internal_id,
@@ -104,7 +104,7 @@ static void wg_expired_new_handshake(struct timer_list *timer)
 
 static void wg_expired_zero_key_material(struct timer_list *timer)
 {
-	struct wg_peer *peer = from_timer(peer, timer, timer_zero_key_material);
+	struct wg_peer *peer = timer_container_of(peer, timer, timer_zero_key_material);
 
 	rcu_read_lock_bh();
 	if (!READ_ONCE(peer->is_dead)) {
@@ -134,7 +134,7 @@ static void wg_queued_expired_zero_key_material(struct work_struct *work)
 
 static void wg_expired_send_persistent_keepalive(struct timer_list *timer)
 {
-	struct wg_peer *peer = from_timer(peer, timer,
+	struct wg_peer *peer = timer_container_of(peer, timer,
 					  timer_persistent_keepalive);
 
 	if (likely(peer->persistent_keepalive_interval))
diff --git a/drivers/net/wireless/ath/ar5523/ar5523.c b/drivers/net/wireless/ath/ar5523/ar5523.c
index 96dc2778022a..343c9de2749c 100644
--- a/drivers/net/wireless/ath/ar5523/ar5523.c
+++ b/drivers/net/wireless/ath/ar5523/ar5523.c
@@ -902,7 +902,7 @@ static void ar5523_tx_work(struct work_struct *work)
 
 static void ar5523_tx_wd_timer(struct timer_list *t)
 {
-	struct ar5523 *ar = from_timer(ar, t, tx_wd_timer);
+	struct ar5523 *ar = timer_container_of(ar, t, tx_wd_timer);
 
 	ar5523_dbg(ar, "TX watchdog timer triggered\n");
 	ieee80211_queue_work(ar->hw, &ar->tx_wd_work);
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 83eab7479f06..47829b109192 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -257,7 +257,7 @@ static void ath10k_htt_rx_msdu_buff_replenish(struct ath10k_htt *htt)
 
 static void ath10k_htt_rx_ring_refill_retry(struct timer_list *t)
 {
-	struct ath10k_htt *htt = from_timer(htt, t, rx_ring.refill_retry_timer);
+	struct ath10k_htt *htt = timer_container_of(htt, t, rx_ring.refill_retry_timer);
 
 	ath10k_htt_rx_msdu_buff_replenish(htt);
 }
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index fb2c60ee433c..c88fb71af708 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -591,7 +591,7 @@ static void ath10k_pci_sleep(struct ath10k *ar)
 
 static void ath10k_pci_ps_timer(struct timer_list *t)
 {
-	struct ath10k_pci *ar_pci = from_timer(ar_pci, t, ps_timer);
+	struct ath10k_pci *ar_pci = timer_container_of(ar_pci, t, ps_timer);
 	struct ath10k *ar = ar_pci->ar;
 	unsigned long flags;
 
@@ -844,7 +844,7 @@ void ath10k_pci_rx_post(struct ath10k *ar)
 
 void ath10k_pci_rx_replenish_retry(struct timer_list *t)
 {
-	struct ath10k_pci *ar_pci = from_timer(ar_pci, t, rx_post_retry);
+	struct ath10k_pci *ar_pci = timer_container_of(ar_pci, t, rx_post_retry);
 	struct ath10k *ar = ar_pci->ar;
 
 	ath10k_pci_rx_post(ar);
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 7ce74b4ef201..1d77971652fa 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1447,7 +1447,7 @@ static int ath10k_sdio_set_mbox_sleep(struct ath10k *ar, bool enable_sleep)
 
 static void ath10k_sdio_sleep_timer_handler(struct timer_list *t)
 {
-	struct ath10k_sdio *ar_sdio = from_timer(ar_sdio, t, sleep_timer);
+	struct ath10k_sdio *ar_sdio = timer_container_of(ar_sdio, t, sleep_timer);
 
 	ar_sdio->mbox_state = SDIO_MBOX_REQUEST_TO_SLEEP_STATE;
 	queue_work(ar_sdio->workqueue, &ar_sdio->wr_async_work);
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 866bad2db334..522f7384c362 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -644,7 +644,7 @@ static void ath10k_snoc_htt_rx_cb(struct ath10k_ce_pipe *ce_state)
 
 static void ath10k_snoc_rx_replenish_retry(struct timer_list *t)
 {
-	struct ath10k_snoc *ar_snoc = from_timer(ar_snoc, t, rx_post_retry);
+	struct ath10k_snoc *ar_snoc = timer_container_of(ar_snoc, t, rx_post_retry);
 	struct ath10k *ar = ar_snoc->ar;
 
 	ath10k_snoc_rx_post(ar);
diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index e66e86bdec20..be1aebe48d1a 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -908,7 +908,7 @@ EXPORT_SYMBOL(ath11k_ce_rx_post_buf);
 
 void ath11k_ce_rx_replenish_retry(struct timer_list *t)
 {
-	struct ath11k_base *ab = from_timer(ab, t, rx_replenish_retry);
+	struct ath11k_base *ab = timer_container_of(ab, t, rx_replenish_retry);
 
 	ath11k_ce_rx_post_buf(ab);
 }
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 3a544e5fefca..7295020c7806 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -1117,7 +1117,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 
 static void ath11k_dp_shadow_timer_handler(struct timer_list *t)
 {
-	struct ath11k_hp_update_timer *update_timer = from_timer(update_timer,
+	struct ath11k_hp_update_timer *update_timer = timer_container_of(update_timer,
 								 t, timer);
 	struct ath11k_base *ab = update_timer->ab;
 	struct hal_srng	*srng = &ab->hal.srng_list[update_timer->ring_id];
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 218ab41c0f3c..cb2fc5a257c3 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -308,7 +308,7 @@ static u8 *ath11k_dp_rxdesc_mpdu_start_addr2(struct ath11k_base *ab,
 
 static void ath11k_dp_service_mon_ring(struct timer_list *t)
 {
-	struct ath11k_base *ab = from_timer(ab, t, mon_reap_timer);
+	struct ath11k_base *ab = timer_container_of(ab, t, mon_reap_timer);
 	int i;
 
 	for (i = 0; i < ab->hw_params.num_rxdma_per_pdev; i++)
@@ -3167,7 +3167,7 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 
 static void ath11k_dp_rx_frag_timer(struct timer_list *timer)
 {
-	struct dp_rx_tid *rx_tid = from_timer(rx_tid, timer, frag_timer);
+	struct dp_rx_tid *rx_tid = timer_container_of(rx_tid, timer, frag_timer);
 
 	spin_lock_bh(&rx_tid->ab->base_lock);
 	if (rx_tid->last_frag_no &&
diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index be0d669d31fc..45acc6fbf828 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -779,7 +779,7 @@ void ath12k_ce_rx_post_buf(struct ath12k_base *ab)
 
 void ath12k_ce_rx_replenish_retry(struct timer_list *t)
 {
-	struct ath12k_base *ab = from_timer(ab, t, rx_replenish_retry);
+	struct ath12k_base *ab = timer_container_of(ab, t, rx_replenish_retry);
 
 	ath12k_ce_rx_post_buf(ab);
 }
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 50c36e6ea102..d7077f8153e1 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1026,7 +1026,7 @@ void ath12k_dp_hal_rx_desc_init(struct ath12k_base *ab)
 
 static void ath12k_dp_service_mon_ring(struct timer_list *t)
 {
-	struct ath12k_base *ab = from_timer(ab, t, mon_reap_timer);
+	struct ath12k_base *ab = timer_container_of(ab, t, mon_reap_timer);
 	int i;
 
 	for (i = 0; i < ab->hw_params->num_rxdma_per_pdev; i++)
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 75bf4211ad42..51237c7ed9d8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2881,7 +2881,7 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
 
 static void ath12k_dp_rx_frag_timer(struct timer_list *timer)
 {
-	struct ath12k_dp_rx_tid *rx_tid = from_timer(rx_tid, timer, frag_timer);
+	struct ath12k_dp_rx_tid *rx_tid = timer_container_of(rx_tid, timer, frag_timer);
 
 	spin_lock_bh(&rx_tid->ab->base_lock);
 	if (rx_tid->last_frag_no &&
diff --git a/drivers/net/wireless/ath/ath6kl/main.c b/drivers/net/wireless/ath/ath6kl/main.c
index 867089a3c096..d62b96459751 100644
--- a/drivers/net/wireless/ath/ath6kl/main.c
+++ b/drivers/net/wireless/ath/ath6kl/main.c
@@ -503,7 +503,7 @@ void ath6kl_connect_ap_mode_sta(struct ath6kl_vif *vif, u16 aid, u8 *mac_addr,
 
 void disconnect_timer_handler(struct timer_list *t)
 {
-	struct ath6kl_vif *vif = from_timer(vif, t, disconnect_timer);
+	struct ath6kl_vif *vif = timer_container_of(vif, t, disconnect_timer);
 
 	ath6kl_init_profile_info(vif);
 	ath6kl_disconnect(vif);
diff --git a/drivers/net/wireless/ath/ath6kl/recovery.c b/drivers/net/wireless/ath/ath6kl/recovery.c
index fd2dceb8b63d..43186c193df1 100644
--- a/drivers/net/wireless/ath/ath6kl/recovery.c
+++ b/drivers/net/wireless/ath/ath6kl/recovery.c
@@ -62,7 +62,7 @@ void ath6kl_recovery_hb_event(struct ath6kl *ar, u32 cookie)
 
 static void ath6kl_recovery_hb_timer(struct timer_list *t)
 {
-	struct ath6kl *ar = from_timer(ar, t, fw_recovery.hb_timer);
+	struct ath6kl *ar = timer_container_of(ar, t, fw_recovery.hb_timer);
 	int err;
 
 	if (test_bit(RECOVERY_CLEANUP, &ar->flag) ||
diff --git a/drivers/net/wireless/ath/ath6kl/txrx.c b/drivers/net/wireless/ath/ath6kl/txrx.c
index 3a6f0b647e17..87dc2237c3ee 100644
--- a/drivers/net/wireless/ath/ath6kl/txrx.c
+++ b/drivers/net/wireless/ath/ath6kl/txrx.c
@@ -1623,7 +1623,7 @@ void ath6kl_rx(struct htc_target *target, struct htc_packet *packet)
 static void aggr_timeout(struct timer_list *t)
 {
 	u8 i, j;
-	struct aggr_info_conn *aggr_conn = from_timer(aggr_conn, t, timer);
+	struct aggr_info_conn *aggr_conn = timer_container_of(aggr_conn, t, timer);
 	struct rxtid *rxtid;
 	struct rxtid_stats *stats;
 
diff --git a/drivers/net/wireless/ath/ath6kl/wmi.c b/drivers/net/wireless/ath/ath6kl/wmi.c
index 3787b9fb0075..84317afe4651 100644
--- a/drivers/net/wireless/ath/ath6kl/wmi.c
+++ b/drivers/net/wireless/ath/ath6kl/wmi.c
@@ -1078,7 +1078,7 @@ static int ath6kl_wmi_tkip_micerr_event_rx(struct wmi *wmi, u8 *datap, int len,
 
 void ath6kl_wmi_sscan_timer(struct timer_list *t)
 {
-	struct ath6kl_vif *vif = from_timer(vif, t, sched_scan_timer);
+	struct ath6kl_vif *vif = timer_container_of(vif, t, sched_scan_timer);
 
 	cfg80211_sched_scan_results(vif->ar->wiphy, 0);
 }
diff --git a/drivers/net/wireless/ath/ath9k/channel.c b/drivers/net/wireless/ath/ath9k/channel.c
index 799be0be24f4..121e51ce1bc0 100644
--- a/drivers/net/wireless/ath/ath9k/channel.c
+++ b/drivers/net/wireless/ath/ath9k/channel.c
@@ -1040,7 +1040,7 @@ static void ath_scan_channel_start(struct ath_softc *sc)
 
 static void ath_chanctx_timer(struct timer_list *t)
 {
-	struct ath_softc *sc = from_timer(sc, t, sched.timer);
+	struct ath_softc *sc = timer_container_of(sc, t, sched.timer);
 	struct ath_common *common = ath9k_hw_common(sc->sc_ah);
 
 	ath_dbg(common, CHAN_CTX,
@@ -1051,7 +1051,7 @@ static void ath_chanctx_timer(struct timer_list *t)
 
 static void ath_offchannel_timer(struct timer_list *t)
 {
-	struct ath_softc *sc = from_timer(sc, t, offchannel.timer);
+	struct ath_softc *sc = timer_container_of(sc, t, offchannel.timer);
 	struct ath_chanctx *ctx;
 	struct ath_common *common = ath9k_hw_common(sc->sc_ah);
 
diff --git a/drivers/net/wireless/ath/ath9k/gpio.c b/drivers/net/wireless/ath/ath9k/gpio.c
index 5a26f1d05f04..8b9bde7135d4 100644
--- a/drivers/net/wireless/ath/ath9k/gpio.c
+++ b/drivers/net/wireless/ath/ath9k/gpio.c
@@ -193,7 +193,7 @@ static void ath_mci_ftp_adjust(struct ath_softc *sc)
  */
 static void ath_btcoex_period_timer(struct timer_list *t)
 {
-	struct ath_softc *sc = from_timer(sc, t, btcoex.period_timer);
+	struct ath_softc *sc = timer_container_of(sc, t, btcoex.period_timer);
 	struct ath_hw *ah = sc->sc_ah;
 	struct ath_btcoex *btcoex = &sc->btcoex;
 	enum ath_stomp_type stomp_type;
@@ -254,7 +254,7 @@ static void ath_btcoex_period_timer(struct timer_list *t)
  */
 static void ath_btcoex_no_stomp_timer(struct timer_list *t)
 {
-	struct ath_softc *sc = from_timer(sc, t, btcoex.no_stomp_timer);
+	struct ath_softc *sc = timer_container_of(sc, t, btcoex.no_stomp_timer);
 	struct ath_hw *ah = sc->sc_ah;
 	struct ath_btcoex *btcoex = &sc->btcoex;
 
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
index ce9c04e418b8..320dfbc64eab 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
@@ -760,7 +760,7 @@ static void ath9k_htc_tx_cleanup_queue(struct ath9k_htc_priv *priv,
 
 void ath9k_htc_tx_cleanup_timer(struct timer_list *t)
 {
-	struct ath9k_htc_priv *priv = from_timer(priv, t, tx.cleanup_timer);
+	struct ath9k_htc_priv *priv = timer_container_of(priv, t, tx.cleanup_timer);
 	struct ath_common *common = ath9k_hw_common(priv->ah);
 	struct ath9k_htc_tx_event *event, *tmp;
 	struct sk_buff *skb;
diff --git a/drivers/net/wireless/ath/ath9k/link.c b/drivers/net/wireless/ath/ath9k/link.c
index 7f890997bb53..5d7e3ddb6dbc 100644
--- a/drivers/net/wireless/ath/ath9k/link.c
+++ b/drivers/net/wireless/ath/ath9k/link.c
@@ -332,7 +332,7 @@ void ath_paprd_calibrate(struct work_struct *work)
  */
 void ath_ani_calibrate(struct timer_list *t)
 {
-	struct ath_common *common = from_timer(common, t, ani.timer);
+	struct ath_common *common = timer_container_of(common, t, ani.timer);
 	struct ath_softc *sc = common->priv;
 	struct ath_hw *ah = sc->sc_ah;
 	bool longcal = false;
diff --git a/drivers/net/wireless/ath/ath9k/main.c b/drivers/net/wireless/ath/ath9k/main.c
index 92fc5e3d756e..c56f4f3b8990 100644
--- a/drivers/net/wireless/ath/ath9k/main.c
+++ b/drivers/net/wireless/ath/ath9k/main.c
@@ -98,7 +98,7 @@ static bool ath9k_setpower(struct ath_softc *sc, enum ath9k_power_mode mode)
 
 void ath_ps_full_sleep(struct timer_list *t)
 {
-	struct ath_softc *sc = from_timer(sc, t, sleep_timer);
+	struct ath_softc *sc = timer_container_of(sc, t, sleep_timer);
 	struct ath_common *common = ath9k_hw_common(sc->sc_ah);
 	unsigned long flags;
 	bool reset;
diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireless/ath/wcn36xx/dxe.c
index cc2a033e87f5..0f4df5585fd9 100644
--- a/drivers/net/wireless/ath/wcn36xx/dxe.c
+++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
@@ -373,7 +373,7 @@ void wcn36xx_dxe_tx_ack_ind(struct wcn36xx *wcn, u32 status)
 
 static void wcn36xx_dxe_tx_timer(struct timer_list *t)
 {
-	struct wcn36xx *wcn = from_timer(wcn, t, tx_ack_timer);
+	struct wcn36xx *wcn = timer_container_of(wcn, t, tx_ack_timer);
 	struct ieee80211_tx_info *info;
 	unsigned long flags;
 	struct sk_buff *skb;
diff --git a/drivers/net/wireless/ath/wil6210/netdev.c b/drivers/net/wireless/ath/wil6210/netdev.c
index 59884e8e3765..dd59963cac51 100644
--- a/drivers/net/wireless/ath/wil6210/netdev.c
+++ b/drivers/net/wireless/ath/wil6210/netdev.c
@@ -227,7 +227,7 @@ static void wil_ndev_destructor(struct net_device *ndev)
 
 static void wil_connect_timer_fn(struct timer_list *t)
 {
-	struct wil6210_vif *vif = from_timer(vif, t, connect_timer);
+	struct wil6210_vif *vif = timer_container_of(vif, t, connect_timer);
 	struct wil6210_priv *wil = vif_to_wil(vif);
 	bool q;
 
@@ -243,7 +243,7 @@ static void wil_connect_timer_fn(struct timer_list *t)
 
 static void wil_scan_timer_fn(struct timer_list *t)
 {
-	struct wil6210_vif *vif = from_timer(vif, t, scan_timer);
+	struct wil6210_vif *vif = timer_container_of(vif, t, scan_timer);
 	struct wil6210_priv *wil = vif_to_wil(vif);
 
 	clear_bit(wil_status_fwready, wil->status);
@@ -253,7 +253,7 @@ static void wil_scan_timer_fn(struct timer_list *t)
 
 static void wil_p2p_discovery_timer_fn(struct timer_list *t)
 {
-	struct wil6210_vif *vif = from_timer(vif, t, p2p.discovery_timer);
+	struct wil6210_vif *vif = timer_container_of(vif, t, p2p.discovery_timer);
 	struct wil6210_priv *wil = vif_to_wil(vif);
 
 	wil_dbg_misc(wil, "p2p_discovery_timer_fn\n");
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/btcoex.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/btcoex.c
index e0de34a3e43a..34c7e04f8444 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/btcoex.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/btcoex.c
@@ -272,7 +272,7 @@ static void brcmf_btcoex_restore_part1(struct brcmf_btcoex_info *btci)
  */
 static void brcmf_btcoex_timerfunc(struct timer_list *t)
 {
-	struct brcmf_btcoex_info *bt_local = from_timer(bt_local, t, timer);
+	struct brcmf_btcoex_info *bt_local = timer_container_of(bt_local, t, timer);
 	brcmf_dbg(TRACE, "enter\n");
 
 	bt_local->timer_on = false;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 4b70845e1a26..d98323342c69 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -3556,7 +3556,7 @@ static void brcmf_cfg80211_escan_timeout_worker(struct work_struct *work)
 static void brcmf_escan_timeout(struct timer_list *t)
 {
 	struct brcmf_cfg80211_info *cfg =
-			from_timer(cfg, t, escan_timeout);
+			timer_container_of(cfg, t, escan_timeout);
 	struct brcmf_pub *drvr = cfg->pub;
 
 	if (cfg->int_escan_map || cfg->scan_request) {
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 9f1854b3d1a5..d40d2823a1e5 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -2328,7 +2328,7 @@ brcmf_pcie_fwcon_timer(struct brcmf_pciedev_info *devinfo, bool active)
 static void
 brcmf_pcie_fwcon(struct timer_list *t)
 {
-	struct brcmf_pciedev_info *devinfo = from_timer(devinfo, t, timer);
+	struct brcmf_pciedev_info *devinfo = timer_container_of(devinfo, t, timer);
 
 	if (!devinfo->console_active)
 		return;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index 93727b9a5f0d..cf26ab15ee0c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -4121,7 +4121,7 @@ brcmf_sdio_watchdog_thread(void *data)
 static void
 brcmf_sdio_watchdog(struct timer_list *t)
 {
-	struct brcmf_sdio *bus = from_timer(bus, t, timer);
+	struct brcmf_sdio *bus = timer_container_of(bus, t, timer);
 
 	if (bus->watchdog_tsk) {
 		complete(&bus->watchdog_wait);
diff --git a/drivers/net/wireless/intel/ipw2x00/libipw_crypto.c b/drivers/net/wireless/intel/ipw2x00/libipw_crypto.c
index dfcc12aa8620..2fe539d5bbf9 100644
--- a/drivers/net/wireless/intel/ipw2x00/libipw_crypto.c
+++ b/drivers/net/wireless/intel/ipw2x00/libipw_crypto.c
@@ -110,7 +110,7 @@ static void libipw_crypt_quiescing(struct libipw_crypt_info *info)
 
 static void libipw_crypt_deinit_handler(struct timer_list *t)
 {
-	struct libipw_crypt_info *info = from_timer(info, t,
+	struct libipw_crypt_info *info = timer_container_of(info, t,
 						    crypt_deinit_timer);
 	unsigned long flags;
 
diff --git a/drivers/net/wireless/intel/iwlegacy/3945-rs.c b/drivers/net/wireless/intel/iwlegacy/3945-rs.c
index df1b8ec86651..229c36116b60 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945-rs.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945-rs.c
@@ -168,7 +168,7 @@ il3945_rate_scale_flush_wins(struct il3945_rs_sta *rs_sta)
 static void
 il3945_bg_rate_scale_flush(struct timer_list *t)
 {
-	struct il3945_rs_sta *rs_sta = from_timer(rs_sta, t, rate_scale_flush);
+	struct il3945_rs_sta *rs_sta = timer_container_of(rs_sta, t, rate_scale_flush);
 	struct il_priv *il __maybe_unused = rs_sta->il;
 	int unflushed = 0;
 	unsigned long flags;
diff --git a/drivers/net/wireless/intel/iwlegacy/4965-mac.c b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
index dc8c408902e6..8e58e97a148f 100644
--- a/drivers/net/wireless/intel/iwlegacy/4965-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
@@ -4051,7 +4051,7 @@ il4965_hdl_alive(struct il_priv *il, struct il_rx_buf *rxb)
 static void
 il4965_bg_stats_periodic(struct timer_list *t)
 {
-	struct il_priv *il = from_timer(il, t, stats_periodic);
+	struct il_priv *il = timer_container_of(il, t, stats_periodic);
 
 	if (test_bit(S_EXIT_PENDING, &il->status))
 		return;
diff --git a/drivers/net/wireless/intel/iwlegacy/common.c b/drivers/net/wireless/intel/iwlegacy/common.c
index 09fb4b758704..9a86688aea67 100644
--- a/drivers/net/wireless/intel/iwlegacy/common.c
+++ b/drivers/net/wireless/intel/iwlegacy/common.c
@@ -4804,7 +4804,7 @@ il_check_stuck_queue(struct il_priv *il, int cnt)
 void
 il_bg_watchdog(struct timer_list *t)
 {
-	struct il_priv *il = from_timer(il, t, watchdog);
+	struct il_priv *il = timer_container_of(il, t, watchdog);
 	int cnt;
 	unsigned long timeout;
 
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/main.c b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
index a27a72cc017a..9360a730c0b5 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/main.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
@@ -381,7 +381,7 @@ int iwl_send_statistics_request(struct iwl_priv *priv, u8 flags, bool clear)
  */
 static void iwl_bg_statistics_periodic(struct timer_list *t)
 {
-	struct iwl_priv *priv = from_timer(priv, t, statistics_periodic);
+	struct iwl_priv *priv = timer_container_of(priv, t, statistics_periodic);
 
 	if (test_bit(STATUS_EXIT_PENDING, &priv->status))
 		return;
@@ -537,7 +537,7 @@ static void iwl_continuous_event_trace(struct iwl_priv *priv)
  */
 static void iwl_bg_ucode_trace(struct timer_list *t)
 {
-	struct iwl_priv *priv = from_timer(priv, t, ucode_trace);
+	struct iwl_priv *priv = timer_container_of(priv, t, ucode_trace);
 
 	if (test_bit(STATUS_EXIT_PENDING, &priv->status))
 		return;
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/tt.c b/drivers/net/wireless/intel/iwlwifi/dvm/tt.c
index 98f0949b3683..612be73761b5 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/tt.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/tt.c
@@ -137,7 +137,7 @@ enum iwl_antenna_ok iwl_tx_ant_restriction(struct iwl_priv *priv)
  */
 static void iwl_tt_check_exit_ct_kill(struct timer_list *t)
 {
-	struct iwl_priv *priv = from_timer(priv, t,
+	struct iwl_priv *priv = timer_container_of(priv, t,
 					   thermal_throttle.ct_kill_exit_tm);
 	struct iwl_tt_mgmt *tt = &priv->thermal_throttle;
 
@@ -187,7 +187,7 @@ static void iwl_perform_ct_kill_task(struct iwl_priv *priv,
 
 static void iwl_tt_ready_for_ct_kill(struct timer_list *t)
 {
-	struct iwl_priv *priv = from_timer(priv, t,
+	struct iwl_priv *priv = timer_container_of(priv, t,
 					   thermal_throttle.ct_kill_waiting_tm);
 	struct iwl_tt_mgmt *tt = &priv->thermal_throttle;
 
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
index ce787326aa69..4bb6e11d74ba 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
@@ -949,7 +949,7 @@ static void iwl_dbg_tlv_apply_config(struct iwl_fw_runtime *fwrt,
 static void iwl_dbg_tlv_periodic_trig_handler(struct timer_list *t)
 {
 	struct iwl_dbg_tlv_timer_node *timer_node =
-		from_timer(timer_node, t, timer);
+		timer_container_of(timer_node, t, timer);
 	struct iwl_fwrt_dump_data dump_data = {
 		.trig = (void *)timer_node->tlv->data,
 	};
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/agg.c b/drivers/net/wireless/intel/iwlwifi/mld/agg.c
index db9e0f04f4b7..301959bb269f 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/agg.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/agg.c
@@ -315,7 +315,7 @@ EXPORT_SYMBOL_IF_IWLWIFI_KUNIT(iwl_mld_reorder);
 static void iwl_mld_rx_agg_session_expired(struct timer_list *t)
 {
 	struct iwl_mld_baid_data *data =
-		from_timer(data, t, session_timer);
+		timer_container_of(data, t, session_timer);
 	struct iwl_mld_baid_data __rcu **rcu_ptr = data->rcu_ptr;
 	struct iwl_mld_baid_data *ba_data;
 	struct ieee80211_link_sta *link_sta;
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/sta.c b/drivers/net/wireless/intel/iwlwifi/mvm/sta.c
index 78fd7faaed97..728df20bf990 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/sta.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/sta.c
@@ -253,7 +253,7 @@ int iwl_mvm_sta_send_to_fw(struct iwl_mvm *mvm, struct ieee80211_sta *sta,
 static void iwl_mvm_rx_agg_session_expired(struct timer_list *t)
 {
 	struct iwl_mvm_baid_data *data =
-		from_timer(data, t, session_timer);
+		timer_container_of(data, t, session_timer);
 	struct iwl_mvm_baid_data __rcu **rcu_ptr = data->rcu_ptr;
 	struct iwl_mvm_baid_data *ba_data;
 	struct ieee80211_sta *sta;
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/tx.c b/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
index bb90bcfc6763..25bf2efb785c 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
@@ -703,7 +703,7 @@ void iwl_txq_log_scd_error(struct iwl_trans *trans, struct iwl_txq *txq)
 
 static void iwl_txq_stuck_timer(struct timer_list *t)
 {
-	struct iwl_txq *txq = from_timer(txq, t, stuck_timer);
+	struct iwl_txq *txq = timer_container_of(txq, t, stuck_timer);
 	struct iwl_trans *trans = txq->trans;
 
 	spin_lock(&txq->lock);
diff --git a/drivers/net/wireless/marvell/libertas/if_usb.c b/drivers/net/wireless/marvell/libertas/if_usb.c
index ea3cc2eaec36..b3c4040257a6 100644
--- a/drivers/net/wireless/marvell/libertas/if_usb.c
+++ b/drivers/net/wireless/marvell/libertas/if_usb.c
@@ -165,7 +165,7 @@ static void if_usb_setup_firmware(struct lbs_private *priv)
 
 static void if_usb_fw_timeo(struct timer_list *t)
 {
-	struct if_usb_card *cardp = from_timer(cardp, t, fw_timeout);
+	struct if_usb_card *cardp = timer_container_of(cardp, t, fw_timeout);
 
 	if (cardp->fwdnldover) {
 		lbs_deb_usb("Download complete, no event. Assuming success\n");
diff --git a/drivers/net/wireless/marvell/libertas/main.c b/drivers/net/wireless/marvell/libertas/main.c
index 26d13e9b3c95..01a79452c400 100644
--- a/drivers/net/wireless/marvell/libertas/main.c
+++ b/drivers/net/wireless/marvell/libertas/main.c
@@ -693,7 +693,7 @@ EXPORT_SYMBOL_GPL(lbs_resume);
  */
 static void lbs_cmd_timeout_handler(struct timer_list *t)
 {
-	struct lbs_private *priv = from_timer(priv, t, command_timer);
+	struct lbs_private *priv = timer_container_of(priv, t, command_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->driver_lock, flags);
@@ -727,7 +727,7 @@ static void lbs_cmd_timeout_handler(struct timer_list *t)
  */
 static void lbs_tx_lockup_handler(struct timer_list *t)
 {
-	struct lbs_private *priv = from_timer(priv, t, tx_lockup_timer);
+	struct lbs_private *priv = timer_container_of(priv, t, tx_lockup_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->driver_lock, flags);
diff --git a/drivers/net/wireless/marvell/libertas_tf/if_usb.c b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
index 7c413dc81f9a..5662a244f82a 100644
--- a/drivers/net/wireless/marvell/libertas_tf/if_usb.c
+++ b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
@@ -113,7 +113,7 @@ static void if_usb_setup_firmware(struct lbtf_private *priv)
 
 static void if_usb_fw_timeo(struct timer_list *t)
 {
-	struct if_usb_card *cardp = from_timer(cardp, t, fw_timeout);
+	struct if_usb_card *cardp = timer_container_of(cardp, t, fw_timeout);
 
 	lbtf_deb_enter(LBTF_DEB_USB);
 	if (!cardp->fwdnldover) {
diff --git a/drivers/net/wireless/marvell/libertas_tf/main.c b/drivers/net/wireless/marvell/libertas_tf/main.c
index a57a11be57d8..50c0f6179e2d 100644
--- a/drivers/net/wireless/marvell/libertas_tf/main.c
+++ b/drivers/net/wireless/marvell/libertas_tf/main.c
@@ -126,7 +126,7 @@ static void lbtf_cmd_work(struct work_struct *work)
  */
 static void command_timer_fn(struct timer_list *t)
 {
-	struct lbtf_private *priv = from_timer(priv, t, command_timer);
+	struct lbtf_private *priv = timer_container_of(priv, t, command_timer);
 	unsigned long flags;
 	lbtf_deb_enter(LBTF_DEB_CMD);
 
diff --git a/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c b/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
index 8aff1df09b40..354c5ce66045 100644
--- a/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
+++ b/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
@@ -300,7 +300,7 @@ static void
 mwifiex_flush_data(struct timer_list *t)
 {
 	struct reorder_tmr_cnxt *ctx =
-		from_timer(ctx, t, timer);
+		timer_container_of(ctx, t, timer);
 	int start_win, seq_num;
 
 	ctx->timer_is_set = false;
diff --git a/drivers/net/wireless/marvell/mwifiex/cmdevt.c b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
index 5573e2ded72f..062b739db1cb 100644
--- a/drivers/net/wireless/marvell/mwifiex/cmdevt.c
+++ b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
@@ -954,7 +954,7 @@ void mwifiex_process_assoc_resp(struct mwifiex_adapter *adapter)
 void
 mwifiex_cmd_timeout_func(struct timer_list *t)
 {
-	struct mwifiex_adapter *adapter = from_timer(adapter, t, cmd_timer);
+	struct mwifiex_adapter *adapter = timer_container_of(adapter, t, cmd_timer);
 	struct cmd_ctrl_node *cmd_node;
 
 	set_bit(MWIFIEX_IS_CMD_TIMEDOUT, &adapter->work_flags);
diff --git a/drivers/net/wireless/marvell/mwifiex/init.c b/drivers/net/wireless/marvell/mwifiex/init.c
index ce0d42e72e94..526d424f96cc 100644
--- a/drivers/net/wireless/marvell/mwifiex/init.c
+++ b/drivers/net/wireless/marvell/mwifiex/init.c
@@ -41,7 +41,7 @@ static int mwifiex_add_bss_prio_tbl(struct mwifiex_private *priv)
 
 static void wakeup_timer_fn(struct timer_list *t)
 {
-	struct mwifiex_adapter *adapter = from_timer(adapter, t, wakeup_timer);
+	struct mwifiex_adapter *adapter = timer_container_of(adapter, t, wakeup_timer);
 
 	mwifiex_dbg(adapter, ERROR, "Firmware wakeup failed\n");
 	adapter->hw_status = MWIFIEX_HW_STATUS_RESET;
diff --git a/drivers/net/wireless/marvell/mwifiex/tdls.c b/drivers/net/wireless/marvell/mwifiex/tdls.c
index 18e8c04d14c4..80121401111e 100644
--- a/drivers/net/wireless/marvell/mwifiex/tdls.c
+++ b/drivers/net/wireless/marvell/mwifiex/tdls.c
@@ -1415,7 +1415,7 @@ void mwifiex_auto_tdls_update_peer_signal(struct mwifiex_private *priv,
 
 void mwifiex_check_auto_tdls(struct timer_list *t)
 {
-	struct mwifiex_private *priv = from_timer(priv, t, auto_tdls_timer);
+	struct mwifiex_private *priv = timer_container_of(priv, t, auto_tdls_timer);
 	struct mwifiex_auto_tdls_peer *tdls_peer;
 	u16 reason = WLAN_REASON_TDLS_TEARDOWN_UNSPECIFIED;
 
diff --git a/drivers/net/wireless/marvell/mwifiex/usb.c b/drivers/net/wireless/marvell/mwifiex/usb.c
index 2f565397cf36..947ecb0a7b40 100644
--- a/drivers/net/wireless/marvell/mwifiex/usb.c
+++ b/drivers/net/wireless/marvell/mwifiex/usb.c
@@ -1125,7 +1125,7 @@ static void mwifiex_usb_tx_aggr_tmo(struct timer_list *t)
 	struct urb_context *urb_cnxt = NULL;
 	struct sk_buff *skb_send = NULL;
 	struct tx_aggr_tmr_cnxt *timer_context =
-		from_timer(timer_context, t, hold_timer);
+		timer_container_of(timer_context, t, hold_timer);
 	struct mwifiex_adapter *adapter = timer_context->adapter;
 	struct usb_tx_data_port *port = timer_context->port;
 	int err = 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index c54005df08ca..8a37fb37f77d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -1043,7 +1043,7 @@ void mt7615_roc_work(struct work_struct *work)
 
 void mt7615_roc_timer(struct timer_list *timer)
 {
-	struct mt7615_phy *phy = from_timer(phy, timer, roc_timer);
+	struct mt7615_phy *phy = timer_container_of(phy, timer, roc_timer);
 
 	ieee80211_queue_work(phy->mt76->hw, &phy->roc_work);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 38dd58f6e493..a50c1723ca29 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -283,7 +283,7 @@ EXPORT_SYMBOL_GPL(mt792x_tx_worker);
 
 void mt792x_roc_timer(struct timer_list *timer)
 {
-	struct mt792x_phy *phy = from_timer(phy, timer, roc_timer);
+	struct mt792x_phy *phy = timer_container_of(phy, timer, roc_timer);
 
 	ieee80211_queue_work(phy->mt76->hw, &phy->roc_work);
 }
@@ -291,7 +291,7 @@ EXPORT_SYMBOL_GPL(mt792x_roc_timer);
 
 void mt792x_csa_timer(struct timer_list *timer)
 {
-	struct mt792x_vif *mvif = from_timer(mvif, timer, csa_timer);
+	struct mt792x_vif *mvif = timer_container_of(mvif, timer, csa_timer);
 
 	ieee80211_queue_work(mvif->phy->mt76->hw, &mvif->csa_work);
 }
diff --git a/drivers/net/wireless/microchip/wilc1000/hif.c b/drivers/net/wireless/microchip/wilc1000/hif.c
index cb46a39ef757..a5a2a6ef6dea 100644
--- a/drivers/net/wireless/microchip/wilc1000/hif.c
+++ b/drivers/net/wireless/microchip/wilc1000/hif.c
@@ -953,7 +953,7 @@ static void wilc_handle_listen_state_expired(struct work_struct *work)
 
 static void listen_timer_cb(struct timer_list *t)
 {
-	struct host_if_drv *hif_drv = from_timer(hif_drv, t,
+	struct host_if_drv *hif_drv = timer_container_of(hif_drv, t,
 						      remain_on_ch_timer);
 	struct wilc_vif *vif = hif_drv->remain_on_ch_timer_vif;
 	int result;
@@ -1075,7 +1075,7 @@ static void handle_scan_complete(struct work_struct *work)
 
 static void timer_scan_cb(struct timer_list *t)
 {
-	struct host_if_drv *hif_drv = from_timer(hif_drv, t, scan_timer);
+	struct host_if_drv *hif_drv = timer_container_of(hif_drv, t, scan_timer);
 	struct wilc_vif *vif = hif_drv->scan_timer_vif;
 	struct host_if_msg *msg;
 	int result;
@@ -1091,7 +1091,7 @@ static void timer_scan_cb(struct timer_list *t)
 
 static void timer_connect_cb(struct timer_list *t)
 {
-	struct host_if_drv *hif_drv = from_timer(hif_drv, t,
+	struct host_if_drv *hif_drv = timer_container_of(hif_drv, t,
 						      connect_timer);
 	struct wilc_vif *vif = hif_drv->connect_timer_vif;
 	struct host_if_msg *msg;
@@ -1497,7 +1497,7 @@ int wilc_hif_set_cfg(struct wilc_vif *vif, struct cfg_param_attr *param)
 
 static void get_periodic_rssi(struct timer_list *t)
 {
-	struct wilc_vif *vif = from_timer(vif, t, periodic_rssi);
+	struct wilc_vif *vif = timer_container_of(vif, t, periodic_rssi);
 
 	if (!vif->hif_drv) {
 		netdev_err(vif->ndev, "%s: hif driver is NULL", __func__);
diff --git a/drivers/net/wireless/purelifi/plfxlc/usb.c b/drivers/net/wireless/purelifi/plfxlc/usb.c
index 10d2e2124ff8..1c54cb2906bf 100644
--- a/drivers/net/wireless/purelifi/plfxlc/usb.c
+++ b/drivers/net/wireless/purelifi/plfxlc/usb.c
@@ -546,7 +546,7 @@ int plfxlc_usb_wreq(struct usb_interface *ez_usb, void *buffer, int buffer_len,
 
 static void slif_data_plane_sap_timer_callb(struct timer_list *t)
 {
-	struct plfxlc_usb *usb = from_timer(usb, t, tx.tx_retry_timer);
+	struct plfxlc_usb *usb = timer_container_of(usb, t, tx.tx_retry_timer);
 
 	plfxlc_send_packet_from_data_queue(usb);
 	timer_setup(&usb->tx.tx_retry_timer,
@@ -556,7 +556,7 @@ static void slif_data_plane_sap_timer_callb(struct timer_list *t)
 
 static void sta_queue_cleanup_timer_callb(struct timer_list *t)
 {
-	struct plfxlc_usb *usb = from_timer(usb, t, sta_queue_cleanup);
+	struct plfxlc_usb *usb = timer_container_of(usb, t, sta_queue_cleanup);
 	struct plfxlc_usb_tx *tx = &usb->tx;
 	int sidx;
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/base.c b/drivers/net/wireless/realtek/rtlwifi/base.c
index 6189edc1d8d7..1b7a795841d3 100644
--- a/drivers/net/wireless/realtek/rtlwifi/base.c
+++ b/drivers/net/wireless/realtek/rtlwifi/base.c
@@ -2220,7 +2220,7 @@ static void rtl_watchdog_wq_callback(struct work_struct *work)
 
 void rtl_watch_dog_timer_callback(struct timer_list *t)
 {
-	struct rtl_priv *rtlpriv = from_timer(rtlpriv, t, works.watchdog_timer);
+	struct rtl_priv *rtlpriv = timer_container_of(rtlpriv, t, works.watchdog_timer);
 
 	queue_delayed_work(rtlpriv->works.rtl_wq,
 			   &rtlpriv->works.watchdog_wq, 0);
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c
index 5a34894a533b..ef279f5005fd 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c
@@ -1684,7 +1684,7 @@ static void rtl88e_dm_fast_ant_training(struct ieee80211_hw *hw)
 void rtl88e_dm_fast_antenna_training_callback(struct timer_list *t)
 {
 	struct rtl_priv *rtlpriv =
-		from_timer(rtlpriv, t, works.fast_antenna_training_timer);
+		timer_container_of(rtlpriv, t, works.fast_antenna_training_timer);
 	struct ieee80211_hw *hw = rtlpriv->hw;
 
 	rtl88e_dm_fast_ant_training(hw);
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
index 27f6c35ba0f9..516be255afcc 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
@@ -237,7 +237,7 @@ static void _rtl88ee_set_fw_ps_rf_off_low_power(struct ieee80211_hw *hw)
 
 void rtl88ee_fw_clk_off_timer_callback(struct timer_list *t)
 {
-	struct rtl_priv *rtlpriv = from_timer(rtlpriv, t,
+	struct rtl_priv *rtlpriv = timer_container_of(rtlpriv, t,
 					      works.fw_clockoff_timer);
 	struct ieee80211_hw *hw = rtlpriv->hw;
 
diff --git a/drivers/net/wireless/realtek/rtw88/tx.c b/drivers/net/wireless/realtek/rtw88/tx.c
index 6ed470dd6f22..d21bd5330a38 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.c
+++ b/drivers/net/wireless/realtek/rtw88/tx.c
@@ -178,7 +178,7 @@ static void rtw_tx_report_enable(struct rtw_dev *rtwdev,
 
 void rtw_tx_report_purge_timer(struct timer_list *t)
 {
-	struct rtw_dev *rtwdev = from_timer(rtwdev, t, tx_report.purge_timer);
+	struct rtw_dev *rtwdev = timer_container_of(rtwdev, t, tx_report.purge_timer);
 	struct rtw_tx_report *tx_report = &rtwdev->tx_report;
 	unsigned long flags;
 
diff --git a/drivers/net/wireless/rsi/rsi_91x_hal.c b/drivers/net/wireless/rsi/rsi_91x_hal.c
index 53827657abb2..7d26314a3e76 100644
--- a/drivers/net/wireless/rsi/rsi_91x_hal.c
+++ b/drivers/net/wireless/rsi/rsi_91x_hal.c
@@ -490,7 +490,7 @@ int rsi_prepare_beacon(struct rsi_common *common, struct sk_buff *skb)
 
 static void bl_cmd_timeout(struct timer_list *t)
 {
-	struct rsi_hw *adapter = from_timer(adapter, t, bl_cmd_timer);
+	struct rsi_hw *adapter = timer_container_of(adapter, t, bl_cmd_timer);
 
 	adapter->blcmd_timer_expired = true;
 	timer_delete(&adapter->bl_cmd_timer);
diff --git a/drivers/net/wireless/rsi/rsi_91x_mac80211.c b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
index 9db08200f4fa..0e115b428f96 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mac80211.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
@@ -1746,7 +1746,7 @@ static void rsi_resume_conn_channel(struct rsi_common *common)
 
 void rsi_roc_timeout(struct timer_list *t)
 {
-	struct rsi_common *common = from_timer(common, t, roc_timer);
+	struct rsi_common *common = timer_container_of(common, t, roc_timer);
 
 	rsi_dbg(INFO_ZONE, "Remain on channel expired\n");
 
diff --git a/drivers/net/wireless/st/cw1200/queue.c b/drivers/net/wireless/st/cw1200/queue.c
index 4fd76183c368..a933e2c7dc2c 100644
--- a/drivers/net/wireless/st/cw1200/queue.c
+++ b/drivers/net/wireless/st/cw1200/queue.c
@@ -133,7 +133,7 @@ static void cw1200_queue_gc(struct timer_list *t)
 {
 	LIST_HEAD(list);
 	struct cw1200_queue *queue =
-		from_timer(queue, t, gc);
+		timer_container_of(queue, t, gc);
 
 	spin_lock_bh(&queue->lock);
 	__cw1200_queue_gc(queue, &list, true);
diff --git a/drivers/net/wireless/st/cw1200/sta.c b/drivers/net/wireless/st/cw1200/sta.c
index 444272caf124..e633b77a8f20 100644
--- a/drivers/net/wireless/st/cw1200/sta.c
+++ b/drivers/net/wireless/st/cw1200/sta.c
@@ -2112,7 +2112,7 @@ void cw1200_multicast_stop_work(struct work_struct *work)
 
 void cw1200_mcast_timeout(struct timer_list *t)
 {
-	struct cw1200_common *priv = from_timer(priv, t, mcast_timeout);
+	struct cw1200_common *priv = timer_container_of(priv, t, mcast_timeout);
 
 	wiphy_warn(priv->hw->wiphy,
 		   "Multicast delivery timeout.\n");
diff --git a/drivers/net/wireless/ti/wlcore/main.c b/drivers/net/wireless/ti/wlcore/main.c
index ea9bc4717a85..88cab6699d58 100644
--- a/drivers/net/wireless/ti/wlcore/main.c
+++ b/drivers/net/wireless/ti/wlcore/main.c
@@ -189,7 +189,7 @@ static void wl1271_rx_streaming_disable_work(struct work_struct *work)
 
 static void wl1271_rx_streaming_timer(struct timer_list *t)
 {
-	struct wl12xx_vif *wlvif = from_timer(wlvif, t, rx_streaming_timer);
+	struct wl12xx_vif *wlvif = timer_container_of(wlvif, t, rx_streaming_timer);
 	struct wl1271 *wl = wlvif->wl;
 	ieee80211_queue_work(wl->hw, &wlvif->rx_streaming_disable_work);
 }
diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 5836995d6774..563397ba7d69 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -198,7 +198,7 @@ static void tx_add_credit(struct xenvif_queue *queue)
 
 void xenvif_tx_credit_callback(struct timer_list *t)
 {
-	struct xenvif_queue *queue = from_timer(queue, t, credit_timeout);
+	struct xenvif_queue *queue = timer_container_of(queue, t, credit_timeout);
 	tx_add_credit(queue);
 	xenvif_napi_schedule_or_enable_events(queue);
 }
diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index fc52d5c4c69b..01bf49bba4da 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -245,7 +245,7 @@ static bool xennet_can_sg(struct net_device *dev)
 
 static void rx_refill_timeout(struct timer_list *t)
 {
-	struct netfront_queue *queue = from_timer(queue, t, rx_refill_timer);
+	struct netfront_queue *queue = timer_container_of(queue, t, rx_refill_timer);
 	napi_schedule(&queue->napi);
 }
 
diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
index 43ce0c9b2355..9992177b08b2 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.c
+++ b/drivers/nfc/nfcmrvl/fw_dnld.c
@@ -119,7 +119,7 @@ static void fw_dnld_over(struct nfcmrvl_private *priv, u32 error)
 
 static void fw_dnld_timeout(struct timer_list *t)
 {
-	struct nfcmrvl_private *priv = from_timer(priv, t, fw_dnld.timer);
+	struct nfcmrvl_private *priv = timer_container_of(priv, t, fw_dnld.timer);
 
 	nfc_err(priv->dev, "FW loading timeout");
 	priv->fw_dnld.state = STATE_RESET;
diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index 34c40d10e260..14661249c690 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1233,7 +1233,7 @@ static int pn533_init_target_complete(struct pn533 *dev, struct sk_buff *resp)
 
 static void pn533_listen_mode_timer(struct timer_list *t)
 {
-	struct pn533 *dev = from_timer(dev, t, listen_timer);
+	struct pn533 *dev = timer_container_of(dev, t, listen_timer);
 
 	dev->cancel_listen = 1;
 
diff --git a/drivers/nfc/pn533/uart.c b/drivers/nfc/pn533/uart.c
index 580c9193e4a7..a081bce61c29 100644
--- a/drivers/nfc/pn533/uart.c
+++ b/drivers/nfc/pn533/uart.c
@@ -133,7 +133,7 @@ static const struct pn533_phy_ops uart_phy_ops = {
 
 static void pn532_cmd_timeout(struct timer_list *t)
 {
-	struct pn532_uart_phy *dev = from_timer(dev, t, cmd_timeout);
+	struct pn532_uart_phy *dev = timer_container_of(dev, t, cmd_timeout);
 
 	pn532_uart_send_frame(dev->priv, dev->cur_out_buf);
 }
diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index 8feac119a4bc..be4808859cfa 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -237,14 +237,14 @@ EXPORT_SYMBOL(ndlc_recv);
 
 static void ndlc_t1_timeout(struct timer_list *t)
 {
-	struct llt_ndlc *ndlc = from_timer(ndlc, t, t1_timer);
+	struct llt_ndlc *ndlc = timer_container_of(ndlc, t, t1_timer);
 
 	schedule_work(&ndlc->sm_work);
 }
 
 static void ndlc_t2_timeout(struct timer_list *t)
 {
-	struct llt_ndlc *ndlc = from_timer(ndlc, t, t2_timer);
+	struct llt_ndlc *ndlc = timer_container_of(ndlc, t, t2_timer);
 
 	schedule_work(&ndlc->sm_work);
 }
diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index 8cfe5405bae6..ff5c3d56b337 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -696,7 +696,7 @@ static void st_nci_se_wt_timeout(struct timer_list *t)
 	 */
 	/* hardware reset managed through VCC_UICC_OUT power supply */
 	u8 param = 0x01;
-	struct st_nci_info *info = from_timer(info, t, se_info.bwi_timer);
+	struct st_nci_info *info = timer_container_of(info, t, se_info.bwi_timer);
 
 	info->se_info.bwi_active = false;
 
@@ -714,7 +714,7 @@ static void st_nci_se_wt_timeout(struct timer_list *t)
 
 static void st_nci_se_activation_timeout(struct timer_list *t)
 {
-	struct st_nci_info *info = from_timer(info, t,
+	struct st_nci_info *info = timer_container_of(info, t,
 					      se_info.se_active_timer);
 
 	info->se_info.se_active = false;
diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
index 9a50f3c03bd4..0a21bc515141 100644
--- a/drivers/nfc/st21nfca/se.c
+++ b/drivers/nfc/st21nfca/se.c
@@ -280,14 +280,14 @@ static void st21nfca_se_wt_work(struct work_struct *work)
 
 static void st21nfca_se_wt_timeout(struct timer_list *t)
 {
-	struct st21nfca_hci_info *info = from_timer(info, t, se_info.bwi_timer);
+	struct st21nfca_hci_info *info = timer_container_of(info, t, se_info.bwi_timer);
 
 	schedule_work(&info->se_info.timeout_work);
 }
 
 static void st21nfca_se_activation_timeout(struct timer_list *t)
 {
-	struct st21nfca_hci_info *info = from_timer(info, t,
+	struct st21nfca_hci_info *info = timer_container_of(info, t,
 						    se_info.se_active_timer);
 
 	info->se_info.se_active = false;
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 05eccd96d34a..7b8eaefb322d 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -890,7 +890,7 @@ void nvme_mpath_update(struct nvme_ctrl *ctrl)
 
 static void nvme_anatt_timeout(struct timer_list *t)
 {
-	struct nvme_ctrl *ctrl = from_timer(ctrl, t, anatt_timer);
+	struct nvme_ctrl *ctrl = timer_container_of(ctrl, t, anatt_timer);
 
 	dev_info(ctrl->device, "ANATT timeout, resetting controller.\n");
 	nvme_reset_ctrl(ctrl);
diff --git a/drivers/parport/ieee1284.c b/drivers/parport/ieee1284.c
index 474515d27e9c..4035010249cd 100644
--- a/drivers/parport/ieee1284.c
+++ b/drivers/parport/ieee1284.c
@@ -40,7 +40,7 @@ static void parport_ieee1284_wakeup (struct parport *port)
 
 static void timeout_waiting_on_port (struct timer_list *t)
 {
-	struct parport *port = from_timer(port, t, timer);
+	struct parport *port = timer_container_of(port, t, timer);
 
 	parport_ieee1284_wakeup (port);
 }
diff --git a/drivers/pci/hotplug/cpqphp_ctrl.c b/drivers/pci/hotplug/cpqphp_ctrl.c
index 20529d1a3c44..760a5dec0431 100644
--- a/drivers/pci/hotplug/cpqphp_ctrl.c
+++ b/drivers/pci/hotplug/cpqphp_ctrl.c
@@ -1883,7 +1883,7 @@ void cpqhp_pushbutton_thread(struct timer_list *t)
 {
 	u8 hp_slot;
 	struct pci_func *func;
-	struct slot *p_slot = from_timer(p_slot, t, task_event);
+	struct slot *p_slot = timer_container_of(p_slot, t, task_event);
 	struct controller *ctrl = (struct controller *) p_slot->ctrl;
 
 	pushbutton_pending = NULL;
diff --git a/drivers/pci/hotplug/shpchp_hpc.c b/drivers/pci/hotplug/shpchp_hpc.c
index 387b85585263..183bf43510a1 100644
--- a/drivers/pci/hotplug/shpchp_hpc.c
+++ b/drivers/pci/hotplug/shpchp_hpc.c
@@ -211,7 +211,7 @@ static inline int shpc_indirect_read(struct controller *ctrl, int index,
  */
 static void int_poll_timeout(struct timer_list *t)
 {
-	struct controller *ctrl = from_timer(ctrl, t, poll_timer);
+	struct controller *ctrl = timer_container_of(ctrl, t, poll_timer);
 
 	/* Poll for interrupt events.  regs == NULL => polling */
 	shpc_isr(0, ctrl);
diff --git a/drivers/pcmcia/bcm63xx_pcmcia.c b/drivers/pcmcia/bcm63xx_pcmcia.c
index 85874b7a9f36..d3baed444646 100644
--- a/drivers/pcmcia/bcm63xx_pcmcia.c
+++ b/drivers/pcmcia/bcm63xx_pcmcia.c
@@ -268,7 +268,7 @@ static void bcm63xx_pcmcia_poll(struct timer_list *t)
 	struct bcm63xx_pcmcia_socket *skt;
 	unsigned int stat, events;
 
-	skt = from_timer(skt, t, timer);
+	skt = timer_container_of(skt, t, timer);
 
 	spin_lock_bh(&skt->lock);
 
diff --git a/drivers/pcmcia/electra_cf.c b/drivers/pcmcia/electra_cf.c
index 3bdd939dd2f4..2530079d38f4 100644
--- a/drivers/pcmcia/electra_cf.c
+++ b/drivers/pcmcia/electra_cf.c
@@ -68,7 +68,7 @@ static int electra_cf_ss_init(struct pcmcia_socket *s)
 /* the timer is primarily to kick this socket's pccardd */
 static void electra_cf_timer(struct timer_list *t)
 {
-	struct electra_cf_socket *cf = from_timer(cf, t, timer);
+	struct electra_cf_socket *cf = timer_container_of(cf, t, timer);
 	int present = electra_cf_present(cf);
 
 	if (present != cf->present) {
diff --git a/drivers/pcmcia/omap_cf.c b/drivers/pcmcia/omap_cf.c
index f0ccf479f36e..1b1dff56ec7b 100644
--- a/drivers/pcmcia/omap_cf.c
+++ b/drivers/pcmcia/omap_cf.c
@@ -77,7 +77,7 @@ static int omap_cf_ss_init(struct pcmcia_socket *s)
 /* the timer is primarily to kick this socket's pccardd */
 static void omap_cf_timer(struct timer_list *t)
 {
-	struct omap_cf_socket	*cf = from_timer(cf, t, timer);
+	struct omap_cf_socket	*cf = timer_container_of(cf, t, timer);
 	unsigned		present = omap_cf_present();
 
 	if (present != cf->present) {
diff --git a/drivers/pcmcia/pd6729.c b/drivers/pcmcia/pd6729.c
index a0a2e7f18356..5261badcd903 100644
--- a/drivers/pcmcia/pd6729.c
+++ b/drivers/pcmcia/pd6729.c
@@ -236,7 +236,7 @@ static irqreturn_t pd6729_interrupt(int irq, void *dev)
 
 static void pd6729_interrupt_wrapper(struct timer_list *t)
 {
-	struct pd6729_socket *socket = from_timer(socket, t, poll_timer);
+	struct pd6729_socket *socket = timer_container_of(socket, t, poll_timer);
 
 	pd6729_interrupt(0, (void *)socket);
 	mod_timer(&socket->poll_timer, jiffies + HZ);
diff --git a/drivers/pcmcia/soc_common.c b/drivers/pcmcia/soc_common.c
index d361124db993..87aa3f667117 100644
--- a/drivers/pcmcia/soc_common.c
+++ b/drivers/pcmcia/soc_common.c
@@ -460,7 +460,7 @@ static void soc_common_check_status(struct soc_pcmcia_socket *skt)
 /* Let's poll for events in addition to IRQs since IRQ only is unreliable... */
 static void soc_common_pcmcia_poll_event(struct timer_list *t)
 {
-	struct soc_pcmcia_socket *skt = from_timer(skt, t, poll_timer);
+	struct soc_pcmcia_socket *skt = timer_container_of(skt, t, poll_timer);
 	debug(skt, 4, "polling for events\n");
 
 	mod_timer(&skt->poll_timer, jiffies + SOC_PCMCIA_POLL_PERIOD);
diff --git a/drivers/pcmcia/yenta_socket.c b/drivers/pcmcia/yenta_socket.c
index 020ea86c24ec..372db25c1589 100644
--- a/drivers/pcmcia/yenta_socket.c
+++ b/drivers/pcmcia/yenta_socket.c
@@ -539,7 +539,7 @@ static irqreturn_t yenta_interrupt(int irq, void *dev_id)
 
 static void yenta_interrupt_wrapper(struct timer_list *t)
 {
-	struct yenta_socket *socket = from_timer(socket, t, poll_timer);
+	struct yenta_socket *socket = timer_container_of(socket, t, poll_timer);
 
 	yenta_interrupt(0, (void *)socket);
 	socket->poll_timer.expires = jiffies + HZ;
diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 5d717b1c23cf..84d7ea34481d 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -934,7 +934,7 @@ static u32 calc_avg_power(struct ips_driver *ips, u32 *array)
 
 static void monitor_timeout(struct timer_list *t)
 {
-	struct ips_driver *ips = from_timer(ips, t, timer);
+	struct ips_driver *ips = timer_container_of(ips, t, timer);
 	wake_up_process(ips->monitor);
 }
 
diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index 374ceefd6f2a..47d9891de368 100644
--- a/drivers/pps/clients/pps-gpio.c
+++ b/drivers/pps/clients/pps-gpio.c
@@ -98,7 +98,7 @@ static void pps_gpio_echo_timer_callback(struct timer_list *t)
 {
 	const struct pps_gpio_device_data *info;
 
-	info = from_timer(info, t, echo_timer);
+	info = timer_container_of(info, t, echo_timer);
 
 	gpiod_set_value(info->echo_pin, 0);
 }
diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 7945c6be1f7c..eed47dcaa3de 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1522,7 +1522,7 @@ ptp_ocp_utc_distribute(struct ptp_ocp *bp, u32 val)
 static void
 ptp_ocp_watchdog(struct timer_list *t)
 {
-	struct ptp_ocp *bp = from_timer(bp, t, watchdog);
+	struct ptp_ocp *bp = timer_container_of(bp, t, watchdog);
 	unsigned long flags;
 	u32 status, utc_offset;
 
diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index 0eeae5bcc3aa..baf1a8ca8b2b 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -72,7 +72,7 @@ static void rtc_uie_task(struct work_struct *work)
 
 static void rtc_uie_timer(struct timer_list *t)
 {
-	struct rtc_device *rtc = from_timer(rtc, t, uie_timer);
+	struct rtc_device *rtc = timer_container_of(rtc, t, uie_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&rtc->irq_lock, flags);
diff --git a/drivers/rtc/rtc-test.c b/drivers/rtc/rtc-test.c
index a9f5b9466fb5..94f995febe5b 100644
--- a/drivers/rtc/rtc-test.c
+++ b/drivers/rtc/rtc-test.c
@@ -107,7 +107,7 @@ static const struct rtc_class_ops test_rtc_ops = {
 
 static void test_rtc_alarm_handler(struct timer_list *t)
 {
-	struct rtc_test_data *rtd = from_timer(rtd, t, alarm);
+	struct rtc_test_data *rtd = timer_container_of(rtd, t, alarm);
 
 	rtc_update_irq(rtd->rtc, 1, RTC_AF | RTC_IRQF);
 }
diff --git a/drivers/s390/block/dasd.c b/drivers/s390/block/dasd.c
index cf36d3bafeca..b16efecfde4b 100644
--- a/drivers/s390/block/dasd.c
+++ b/drivers/s390/block/dasd.c
@@ -1493,7 +1493,7 @@ static void dasd_device_timeout(struct timer_list *t)
 	unsigned long flags;
 	struct dasd_device *device;
 
-	device = from_timer(device, t, timer);
+	device = timer_container_of(device, t, timer);
 	spin_lock_irqsave(get_ccwdev_lock(device->cdev), flags);
 	/* re-activate request queue */
 	dasd_device_remove_stop_bits(device, DASD_STOPPED_PENDING);
@@ -2677,7 +2677,7 @@ static void dasd_block_timeout(struct timer_list *t)
 	unsigned long flags;
 	struct dasd_block *block;
 
-	block = from_timer(block, t, timer);
+	block = timer_container_of(block, t, timer);
 	spin_lock_irqsave(get_ccwdev_lock(block->base->cdev), flags);
 	/* re-activate request queue */
 	dasd_device_remove_stop_bits(block->base, DASD_STOPPED_PENDING);
diff --git a/drivers/s390/char/con3215.c b/drivers/s390/char/con3215.c
index 6a61c0a595d9..56e43d43c713 100644
--- a/drivers/s390/char/con3215.c
+++ b/drivers/s390/char/con3215.c
@@ -284,7 +284,7 @@ static void raw3215_start_io(struct raw3215_info *raw)
  */
 static void raw3215_timeout(struct timer_list *t)
 {
-	struct raw3215_info *raw = from_timer(raw, t, timer);
+	struct raw3215_info *raw = timer_container_of(raw, t, timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(get_ccwdev_lock(raw->cdev), flags);
diff --git a/drivers/s390/char/con3270.c b/drivers/s390/char/con3270.c
index 34f3820d7f74..78893459c59c 100644
--- a/drivers/s390/char/con3270.c
+++ b/drivers/s390/char/con3270.c
@@ -524,7 +524,7 @@ static void tty3270_update_lines_all(struct tty3270 *tp, struct raw3270_request
  */
 static void tty3270_update(struct timer_list *t)
 {
-	struct tty3270 *tp = from_timer(tp, t, timer);
+	struct tty3270 *tp = timer_container_of(tp, t, timer);
 	struct raw3270_request *wrq;
 	u8 cmd = TC_WRITE;
 	int rc, len;
diff --git a/drivers/s390/char/tape_core.c b/drivers/s390/char/tape_core.c
index 48e8417a5cff..fa063e84eafc 100644
--- a/drivers/s390/char/tape_core.c
+++ b/drivers/s390/char/tape_core.c
@@ -821,7 +821,7 @@ tape_delayed_next_request(struct work_struct *work)
 
 static void tape_long_busy_timeout(struct timer_list *t)
 {
-	struct tape_device *device = from_timer(device, t, lb_timeout);
+	struct tape_device *device = timer_container_of(device, t, lb_timeout);
 	struct tape_request *request;
 
 	spin_lock_irq(get_ccwdev_lock(device->cdev));
diff --git a/drivers/s390/char/tape_std.c b/drivers/s390/char/tape_std.c
index b76038632883..ef5d34168a01 100644
--- a/drivers/s390/char/tape_std.c
+++ b/drivers/s390/char/tape_std.c
@@ -35,7 +35,7 @@
 static void
 tape_std_assign_timeout(struct timer_list *t)
 {
-	struct tape_request *	request = from_timer(request, t, timer);
+	struct tape_request *	request = timer_container_of(request, t, timer);
 	struct tape_device *	device = request->device;
 	int rc;
 
diff --git a/drivers/s390/cio/device_fsm.c b/drivers/s390/cio/device_fsm.c
index e1b1fbdabb1b..e849d3271b0e 100644
--- a/drivers/s390/cio/device_fsm.c
+++ b/drivers/s390/cio/device_fsm.c
@@ -98,7 +98,7 @@ static void ccw_timeout_log(struct ccw_device *cdev)
 void
 ccw_device_timeout(struct timer_list *t)
 {
-	struct ccw_device_private *priv = from_timer(priv, t, timer);
+	struct ccw_device_private *priv = timer_container_of(priv, t, timer);
 	struct ccw_device *cdev = priv->cdev;
 
 	spin_lock_irq(cdev->ccwlock);
diff --git a/drivers/s390/cio/eadm_sch.c b/drivers/s390/cio/eadm_sch.c
index ac382355dc04..37ea30be710c 100644
--- a/drivers/s390/cio/eadm_sch.c
+++ b/drivers/s390/cio/eadm_sch.c
@@ -98,7 +98,7 @@ static int eadm_subchannel_clear(struct subchannel *sch)
 
 static void eadm_subchannel_timeout(struct timer_list *t)
 {
-	struct eadm_private *private = from_timer(private, t, timer);
+	struct eadm_private *private = timer_container_of(private, t, timer);
 	struct subchannel *sch = private->sch;
 
 	spin_lock_irq(&sch->lock);
diff --git a/drivers/s390/crypto/ap_bus.c b/drivers/s390/crypto/ap_bus.c
index 1564cd7e3f59..09b9fe81b070 100644
--- a/drivers/s390/crypto/ap_bus.c
+++ b/drivers/s390/crypto/ap_bus.c
@@ -406,7 +406,7 @@ void ap_wait(enum ap_sm_wait wait)
  */
 void ap_request_timeout(struct timer_list *t)
 {
-	struct ap_queue *aq = from_timer(aq, t, timeout);
+	struct ap_queue *aq = timer_container_of(aq, t, timeout);
 
 	spin_lock_bh(&aq->lock);
 	ap_wait(ap_sm_event(aq, AP_SM_EVENT_TIMEOUT));
diff --git a/drivers/s390/net/fsm.c b/drivers/s390/net/fsm.c
index 5fcdce116862..6a12d2422540 100644
--- a/drivers/s390/net/fsm.c
+++ b/drivers/s390/net/fsm.c
@@ -132,7 +132,7 @@ fsm_getstate_str(fsm_instance *fi)
 static void
 fsm_expire_timer(struct timer_list *t)
 {
-	fsm_timer *this = from_timer(this, t, tl);
+	fsm_timer *this = timer_container_of(this, t, tl);
 #if FSM_TIMER_DEBUG
 	printk(KERN_DEBUG "fsm(%s): Timer %p expired\n",
 	       this->fi->name, this);
diff --git a/drivers/s390/net/qeth_core_main.c b/drivers/s390/net/qeth_core_main.c
index f5cfaebfb7c9..751952e8eb68 100644
--- a/drivers/s390/net/qeth_core_main.c
+++ b/drivers/s390/net/qeth_core_main.c
@@ -2619,7 +2619,7 @@ static struct qeth_qdio_out_q *qeth_alloc_output_queue(void)
 
 static void qeth_tx_completion_timer(struct timer_list *timer)
 {
-	struct qeth_qdio_out_q *queue = from_timer(queue, timer, timer);
+	struct qeth_qdio_out_q *queue = timer_container_of(queue, timer, timer);
 
 	napi_schedule(&queue->napi);
 	QETH_TXQ_STAT_INC(queue, completion_timer);
diff --git a/drivers/s390/scsi/zfcp_erp.c b/drivers/s390/scsi/zfcp_erp.c
index 78d52a4c55f5..ffd994416995 100644
--- a/drivers/s390/scsi/zfcp_erp.c
+++ b/drivers/s390/scsi/zfcp_erp.c
@@ -615,7 +615,7 @@ void zfcp_erp_notify(struct zfcp_erp_action *erp_action, unsigned long set_mask)
  */
 void zfcp_erp_timeout_handler(struct timer_list *t)
 {
-	struct zfcp_fsf_req *fsf_req = from_timer(fsf_req, t, timer);
+	struct zfcp_fsf_req *fsf_req = timer_container_of(fsf_req, t, timer);
 	struct zfcp_erp_action *act;
 
 	if (fsf_req->status & ZFCP_STATUS_FSFREQ_DISMISSED)
@@ -629,7 +629,7 @@ void zfcp_erp_timeout_handler(struct timer_list *t)
 
 static void zfcp_erp_memwait_handler(struct timer_list *t)
 {
-	struct zfcp_erp_action *act = from_timer(act, t, timer);
+	struct zfcp_erp_action *act = timer_container_of(act, t, timer);
 
 	zfcp_erp_notify(act, 0);
 }
diff --git a/drivers/s390/scsi/zfcp_fsf.c b/drivers/s390/scsi/zfcp_fsf.c
index d5f5f563881e..c5bba1be88f4 100644
--- a/drivers/s390/scsi/zfcp_fsf.c
+++ b/drivers/s390/scsi/zfcp_fsf.c
@@ -36,7 +36,7 @@ MODULE_PARM_DESC(ber_stop,
 
 static void zfcp_fsf_request_timeout_handler(struct timer_list *t)
 {
-	struct zfcp_fsf_req *fsf_req = from_timer(fsf_req, t, timer);
+	struct zfcp_fsf_req *fsf_req = timer_container_of(fsf_req, t, timer);
 	struct zfcp_adapter *adapter = fsf_req->adapter;
 
 	zfcp_qdio_siosl(adapter);
diff --git a/drivers/s390/scsi/zfcp_qdio.c b/drivers/s390/scsi/zfcp_qdio.c
index 0957e3f8b46e..939dcabf2ae2 100644
--- a/drivers/s390/scsi/zfcp_qdio.c
+++ b/drivers/s390/scsi/zfcp_qdio.c
@@ -102,7 +102,7 @@ static void zfcp_qdio_request_tasklet(struct tasklet_struct *tasklet)
 
 static void zfcp_qdio_request_timer(struct timer_list *timer)
 {
-	struct zfcp_qdio *qdio = from_timer(qdio, timer, request_timer);
+	struct zfcp_qdio *qdio = timer_container_of(qdio, timer, request_timer);
 
 	tasklet_schedule(&qdio->request_tasklet);
 }
diff --git a/drivers/scsi/aic7xxx/aic79xx_core.c b/drivers/scsi/aic7xxx/aic79xx_core.c
index f9372a81cd4e..6b87ea004e53 100644
--- a/drivers/scsi/aic7xxx/aic79xx_core.c
+++ b/drivers/scsi/aic7xxx/aic79xx_core.c
@@ -8784,7 +8784,7 @@ ahd_reset_channel(struct ahd_softc *ahd, char channel, int initiate_reset)
 static void
 ahd_stat_timer(struct timer_list *t)
 {
-	struct	ahd_softc *ahd = from_timer(ahd, t, stat_timer);
+	struct	ahd_softc *ahd = timer_container_of(ahd, t, stat_timer);
 	u_long	s;
 	int	enint_coal;
 
diff --git a/drivers/scsi/aic94xx/aic94xx_scb.c b/drivers/scsi/aic94xx/aic94xx_scb.c
index 68214a58b160..08c8dad9ad62 100644
--- a/drivers/scsi/aic94xx/aic94xx_scb.c
+++ b/drivers/scsi/aic94xx/aic94xx_scb.c
@@ -862,7 +862,7 @@ void asd_build_initiate_link_adm_task(struct asd_ascb *ascb, int phy_id,
  */
 void asd_ascb_timedout(struct timer_list *t)
 {
-	struct asd_ascb *ascb = from_timer(ascb, t, timer);
+	struct asd_ascb *ascb = timer_container_of(ascb, t, timer);
 	struct asd_seq_data *seq = &ascb->ha->seq;
 	unsigned long flags;
 
diff --git a/drivers/scsi/aic94xx/aic94xx_tmf.c b/drivers/scsi/aic94xx/aic94xx_tmf.c
index d45dbf98f25e..28ac92b041fe 100644
--- a/drivers/scsi/aic94xx/aic94xx_tmf.c
+++ b/drivers/scsi/aic94xx/aic94xx_tmf.c
@@ -70,7 +70,7 @@ static void asd_clear_nexus_tasklet_complete(struct asd_ascb *ascb,
 
 static void asd_clear_nexus_timedout(struct timer_list *t)
 {
-	struct asd_ascb *ascb = from_timer(ascb, t, timer);
+	struct asd_ascb *ascb = timer_container_of(ascb, t, timer);
 	struct tasklet_completion_status *tcs = ascb->uldd_task;
 
 	ASD_DPRINTK("%s: here\n", __func__);
@@ -244,7 +244,7 @@ static int asd_clear_nexus_index(struct sas_task *task)
 
 static void asd_tmf_timedout(struct timer_list *t)
 {
-	struct asd_ascb *ascb = from_timer(ascb, t, timer);
+	struct asd_ascb *ascb = timer_container_of(ascb, t, timer);
 	struct tasklet_completion_status *tcs = ascb->uldd_task;
 
 	ASD_DPRINTK("tmf timed out\n");
diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index b450b1fc6bbb..929a3d2f88cd 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -3935,7 +3935,7 @@ static int arcmsr_polling_ccbdone(struct AdapterControlBlock *acb,
 
 static void arcmsr_set_iop_datetime(struct timer_list *t)
 {
-	struct AdapterControlBlock *pacb = from_timer(pacb, t, refresh_timer);
+	struct AdapterControlBlock *pacb = timer_container_of(pacb, t, refresh_timer);
 	unsigned int next_time;
 	struct tm tm;
 
@@ -4263,7 +4263,7 @@ static void arcmsr_wait_firmware_ready(struct AdapterControlBlock *acb)
 
 static void arcmsr_request_device_map(struct timer_list *t)
 {
-	struct AdapterControlBlock *acb = from_timer(acb, t, eternal_timer);
+	struct AdapterControlBlock *acb = timer_container_of(acb, t, eternal_timer);
 	if (acb->acb_flags & (ACB_F_MSG_GET_CONFIG | ACB_F_BUS_RESET | ACB_F_ABORT)) {
 		mod_timer(&acb->eternal_timer, jiffies + msecs_to_jiffies(6 * HZ));
 	} else {
diff --git a/drivers/scsi/arm/fas216.c b/drivers/scsi/arm/fas216.c
index e0b55d869a35..b1a749ab18f8 100644
--- a/drivers/scsi/arm/fas216.c
+++ b/drivers/scsi/arm/fas216.c
@@ -2327,7 +2327,7 @@ DEF_SCSI_QCMD(fas216_noqueue_command)
  */
 static void fas216_eh_timer(struct timer_list *t)
 {
-	FAS216_Info *info = from_timer(info, t, eh_timer);
+	FAS216_Info *info = timer_container_of(info, t, eh_timer);
 
 	fas216_log(info, LOG_ERROR, "error handling timed out\n");
 
diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
index 7d1b767d87fb..dc88bc46dcc0 100644
--- a/drivers/scsi/be2iscsi/be_main.c
+++ b/drivers/scsi/be2iscsi/be_main.c
@@ -5240,7 +5240,7 @@ static void beiscsi_eqd_update_work(struct work_struct *work)
 
 static void beiscsi_hw_tpe_check(struct timer_list *t)
 {
-	struct beiscsi_hba *phba = from_timer(phba, t, hw_check);
+	struct beiscsi_hba *phba = timer_container_of(phba, t, hw_check);
 	u32 wait;
 
 	/* if not TPE, do nothing */
@@ -5257,7 +5257,7 @@ static void beiscsi_hw_tpe_check(struct timer_list *t)
 
 static void beiscsi_hw_health_check(struct timer_list *t)
 {
-	struct beiscsi_hba *phba = from_timer(phba, t, hw_check);
+	struct beiscsi_hba *phba = timer_container_of(phba, t, hw_check);
 
 	beiscsi_detect_ue(phba);
 	if (beiscsi_detect_ue(phba)) {
diff --git a/drivers/scsi/bfa/bfad.c b/drivers/scsi/bfa/bfad.c
index 695c77c5275d..0768f086451b 100644
--- a/drivers/scsi/bfa/bfad.c
+++ b/drivers/scsi/bfa/bfad.c
@@ -685,7 +685,7 @@ bfad_vport_create(struct bfad_s *bfad, u16 vf_id,
 void
 bfad_bfa_tmo(struct timer_list *t)
 {
-	struct bfad_s	      *bfad = from_timer(bfad, t, hal_tmo);
+	struct bfad_s	      *bfad = timer_container_of(bfad, t, hal_tmo);
 	unsigned long	flags;
 	struct list_head	       doneq;
 
diff --git a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
index de6574cccf58..58da993251e9 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
@@ -837,7 +837,7 @@ static int bnx2fc_net_config(struct fc_lport *lport, struct net_device *netdev)
 
 static void bnx2fc_destroy_timer(struct timer_list *t)
 {
-	struct bnx2fc_hba *hba = from_timer(hba, t, destroy_timer);
+	struct bnx2fc_hba *hba = timer_container_of(hba, t, destroy_timer);
 
 	printk(KERN_ERR PFX "ERROR:bnx2fc_destroy_timer - "
 	       "Destroy compl not received!!\n");
diff --git a/drivers/scsi/bnx2fc/bnx2fc_tgt.c b/drivers/scsi/bnx2fc/bnx2fc_tgt.c
index b8227cfef64f..77dcdfc412b1 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_tgt.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_tgt.c
@@ -30,7 +30,7 @@ static void bnx2fc_free_conn_id(struct bnx2fc_hba *hba, u32 conn_id);
 static void bnx2fc_upld_timer(struct timer_list *t)
 {
 
-	struct bnx2fc_rport *tgt = from_timer(tgt, t, upld_timer);
+	struct bnx2fc_rport *tgt = timer_container_of(tgt, t, upld_timer);
 
 	BNX2FC_TGT_DBG(tgt, "upld_timer - Upload compl not received!!\n");
 	/* fake upload completion */
@@ -43,7 +43,7 @@ static void bnx2fc_upld_timer(struct timer_list *t)
 static void bnx2fc_ofld_timer(struct timer_list *t)
 {
 
-	struct bnx2fc_rport *tgt = from_timer(tgt, t, ofld_timer);
+	struct bnx2fc_rport *tgt = timer_container_of(tgt, t, ofld_timer);
 
 	BNX2FC_TGT_DBG(tgt, "entered bnx2fc_ofld_timer\n");
 	/* NOTE: This function should never be called, as
diff --git a/drivers/scsi/bnx2i/bnx2i_hwi.c b/drivers/scsi/bnx2i/bnx2i_hwi.c
index 6c864b093ac9..40db5190a222 100644
--- a/drivers/scsi/bnx2i/bnx2i_hwi.c
+++ b/drivers/scsi/bnx2i/bnx2i_hwi.c
@@ -685,7 +685,7 @@ void bnx2i_update_iscsi_conn(struct iscsi_conn *conn)
  */
 void bnx2i_ep_ofld_timer(struct timer_list *t)
 {
-	struct bnx2i_endpoint *ep = from_timer(ep, t, ofld_timer);
+	struct bnx2i_endpoint *ep = timer_container_of(ep, t, ofld_timer);
 
 	if (ep->state == EP_STATE_OFLD_START) {
 		printk(KERN_ALERT "ofld_timer: CONN_OFLD timeout\n");
diff --git a/drivers/scsi/csiostor/csio_hw.c b/drivers/scsi/csiostor/csio_hw.c
index beded091dff1..7aa418ebfe01 100644
--- a/drivers/scsi/csiostor/csio_hw.c
+++ b/drivers/scsi/csiostor/csio_hw.c
@@ -3738,7 +3738,7 @@ csio_mberr_worker(void *data)
 static void
 csio_hw_mb_timer(struct timer_list *t)
 {
-	struct csio_mbm *mbm = from_timer(mbm, t, timer);
+	struct csio_mbm *mbm = timer_container_of(mbm, t, timer);
 	struct csio_hw *hw = mbm->hw;
 	struct csio_mb *mbp = NULL;
 
@@ -4107,7 +4107,7 @@ csio_mgmt_req_lookup(struct csio_mgmtm *mgmtm, struct csio_ioreq *io_req)
 static void
 csio_mgmt_tmo_handler(struct timer_list *t)
 {
-	struct csio_mgmtm *mgmtm = from_timer(mgmtm, t, mgmt_timer);
+	struct csio_mgmtm *mgmtm = timer_container_of(mgmtm, t, mgmt_timer);
 	struct list_head *tmp;
 	struct csio_ioreq *io_req;
 
diff --git a/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c b/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
index 461d38e2fb19..69de9657f7cb 100644
--- a/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
+++ b/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
@@ -547,7 +547,7 @@ static int act_open_rpl_status_to_errno(int status)
 
 static void act_open_retry_timer(struct timer_list *t)
 {
-	struct cxgbi_sock *csk = from_timer(csk, t, retry_timer);
+	struct cxgbi_sock *csk = timer_container_of(csk, t, retry_timer);
 	struct sk_buff *skb;
 
 	log_debug(1 << CXGBI_DBG_TOE | 1 << CXGBI_DBG_SOCK,
diff --git a/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c b/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c
index aaba294ecb58..42676627c3af 100644
--- a/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c
+++ b/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c
@@ -988,7 +988,7 @@ static int act_open_rpl_status_to_errno(int status)
 static void csk_act_open_retry_timer(struct timer_list *t)
 {
 	struct sk_buff *skb = NULL;
-	struct cxgbi_sock *csk = from_timer(csk, t, retry_timer);
+	struct cxgbi_sock *csk = timer_container_of(csk, t, retry_timer);
 	struct cxgb4_lld_info *lldi = cxgbi_cdev_priv(csk->cdev);
 	void (*send_act_open_func)(struct cxgbi_sock *, struct sk_buff *,
 				   struct l2t_entry *);
diff --git a/drivers/scsi/dc395x.c b/drivers/scsi/dc395x.c
index 8dc6be9a00c1..61bd89b7964d 100644
--- a/drivers/scsi/dc395x.c
+++ b/drivers/scsi/dc395x.c
@@ -821,7 +821,7 @@ static void waiting_process_next(struct AdapterCtlBlk *acb)
 static void waiting_timeout(struct timer_list *t)
 {
 	unsigned long flags;
-	struct AdapterCtlBlk *acb = from_timer(acb, t, waiting_timer);
+	struct AdapterCtlBlk *acb = timer_container_of(acb, t, waiting_timer);
 	dprintkdbg(DBG_1,
 		"waiting_timeout: Queue woken up by timer. acb=%p\n", acb);
 	DC395x_LOCK_IO(acb->scsi_host, flags);
diff --git a/drivers/scsi/elx/efct/efct_xport.c b/drivers/scsi/elx/efct/efct_xport.c
index 2aca60f6428e..dfe05fab7b42 100644
--- a/drivers/scsi/elx/efct/efct_xport.c
+++ b/drivers/scsi/elx/efct/efct_xport.c
@@ -180,7 +180,7 @@ efct_xport_config_stats_timer(struct efct *efct);
 static void
 efct_xport_stats_timer_cb(struct timer_list *t)
 {
-	struct efct_xport *xport = from_timer(xport, t, stats_timer);
+	struct efct_xport *xport = timer_container_of(xport, t, stats_timer);
 	struct efct *efct = xport->efct;
 
 	efct_xport_config_stats_timer(efct);
diff --git a/drivers/scsi/elx/libefc/efc_els.c b/drivers/scsi/elx/libefc/efc_els.c
index 84bc81d7ce76..1786cee08729 100644
--- a/drivers/scsi/elx/libefc/efc_els.c
+++ b/drivers/scsi/elx/libefc/efc_els.c
@@ -147,7 +147,7 @@ efc_els_retry(struct efc_els_io_req *els);
 static void
 efc_els_delay_timer_cb(struct timer_list *t)
 {
-	struct efc_els_io_req *els = from_timer(els, t, delay_timer);
+	struct efc_els_io_req *els = timer_container_of(els, t, delay_timer);
 
 	/* Retry delay timer expired, retry the ELS request */
 	efc_els_retry(els);
diff --git a/drivers/scsi/elx/libefc/efc_fabric.c b/drivers/scsi/elx/libefc/efc_fabric.c
index cf7e738c4edc..4ed9f46ded65 100644
--- a/drivers/scsi/elx/libefc/efc_fabric.c
+++ b/drivers/scsi/elx/libefc/efc_fabric.c
@@ -886,7 +886,7 @@ __efc_ns_idle(struct efc_sm_ctx *ctx, enum efc_sm_event evt, void *arg)
 static void
 gidpt_delay_timer_cb(struct timer_list *t)
 {
-	struct efc_node *node = from_timer(node, t, gidpt_delay_timer);
+	struct efc_node *node = timer_container_of(node, t, gidpt_delay_timer);
 
 	timer_delete(&node->gidpt_delay_timer);
 
diff --git a/drivers/scsi/esas2r/esas2r_main.c b/drivers/scsi/esas2r/esas2r_main.c
index 44871746944a..3f31875ff46e 100644
--- a/drivers/scsi/esas2r/esas2r_main.c
+++ b/drivers/scsi/esas2r/esas2r_main.c
@@ -1585,7 +1585,7 @@ void esas2r_kickoff_timer(struct esas2r_adapter *a)
 
 static void esas2r_timer_callback(struct timer_list *t)
 {
-	struct esas2r_adapter *a = from_timer(a, t, timer);
+	struct esas2r_adapter *a = timer_container_of(a, t, timer);
 
 	set_bit(AF2_TIMER_TICK, &a->flags2);
 
diff --git a/drivers/scsi/fcoe/fcoe_ctlr.c b/drivers/scsi/fcoe/fcoe_ctlr.c
index 56d270526c9c..8e4241c295e3 100644
--- a/drivers/scsi/fcoe/fcoe_ctlr.c
+++ b/drivers/scsi/fcoe/fcoe_ctlr.c
@@ -1773,7 +1773,7 @@ static void fcoe_ctlr_flogi_send(struct fcoe_ctlr *fip)
  */
 static void fcoe_ctlr_timeout(struct timer_list *t)
 {
-	struct fcoe_ctlr *fip = from_timer(fip, t, timer);
+	struct fcoe_ctlr *fip = timer_container_of(fip, t, timer);
 
 	schedule_work(&fip->timer_work);
 }
diff --git a/drivers/scsi/fcoe/fcoe_transport.c b/drivers/scsi/fcoe/fcoe_transport.c
index a48d24af9ac3..2f478426f16e 100644
--- a/drivers/scsi/fcoe/fcoe_transport.c
+++ b/drivers/scsi/fcoe/fcoe_transport.c
@@ -447,7 +447,7 @@ EXPORT_SYMBOL_GPL(fcoe_check_wait_queue);
  */
 void fcoe_queue_timer(struct timer_list *t)
 {
-	struct fcoe_port *port = from_timer(port, t, timer);
+	struct fcoe_port *port = timer_container_of(port, t, timer);
 
 	fcoe_check_wait_queue(port->lport, NULL);
 }
diff --git a/drivers/scsi/fnic/fdls_disc.c b/drivers/scsi/fnic/fdls_disc.c
index c2b6f4eb338e..ab5c0cf142ee 100644
--- a/drivers/scsi/fnic/fdls_disc.c
+++ b/drivers/scsi/fnic/fdls_disc.c
@@ -2074,7 +2074,7 @@ static void fdls_fdmi_register_pa(struct fnic_iport_s *iport)
 
 void fdls_fabric_timer_callback(struct timer_list *t)
 {
-	struct fnic_fdls_fabric_s *fabric = from_timer(fabric, t, retry_timer);
+	struct fnic_fdls_fabric_s *fabric = timer_container_of(fabric, t, retry_timer);
 	struct fnic_iport_s *iport =
 		container_of(fabric, struct fnic_iport_s, fabric);
 	struct fnic *fnic = iport->fnic;
@@ -2246,7 +2246,7 @@ void fdls_fabric_timer_callback(struct timer_list *t)
 
 void fdls_fdmi_timer_callback(struct timer_list *t)
 {
-	struct fnic_fdls_fabric_s *fabric = from_timer(fabric, t, fdmi_timer);
+	struct fnic_fdls_fabric_s *fabric = timer_container_of(fabric, t, fdmi_timer);
 	struct fnic_iport_s *iport =
 		container_of(fabric, struct fnic_iport_s, fabric);
 	struct fnic *fnic = iport->fnic;
@@ -2323,7 +2323,7 @@ static void fdls_send_delete_tport_msg(struct fnic_tport_s *tport)
 
 static void fdls_tport_timer_callback(struct timer_list *t)
 {
-	struct fnic_tport_s *tport = from_timer(tport, t, retry_timer);
+	struct fnic_tport_s *tport = timer_container_of(tport, t, retry_timer);
 	struct fnic_iport_s *iport = (struct fnic_iport_s *) tport->iport;
 	struct fnic *fnic = iport->fnic;
 	uint16_t oxid;
diff --git a/drivers/scsi/fnic/fip.c b/drivers/scsi/fnic/fip.c
index 6e7c0b00eb41..becdcabafd8c 100644
--- a/drivers/scsi/fnic/fip.c
+++ b/drivers/scsi/fnic/fip.c
@@ -777,7 +777,7 @@ void fnic_work_on_fip_timer(struct work_struct *work)
  */
 void fnic_handle_fip_timer(struct timer_list *t)
 {
-	struct fnic *fnic = from_timer(fnic, t, retry_fip_timer);
+	struct fnic *fnic = timer_container_of(fnic, t, retry_fip_timer);
 
 	INIT_WORK(&fnic->fip_timer_work, fnic_work_on_fip_timer);
 	queue_work(fnic_fip_queue, &fnic->fip_timer_work);
@@ -790,7 +790,7 @@ void fnic_handle_fip_timer(struct timer_list *t)
 void fnic_handle_enode_ka_timer(struct timer_list *t)
 {
 	uint8_t *frame;
-	struct fnic *fnic = from_timer(fnic, t, enode_ka_timer);
+	struct fnic *fnic = timer_container_of(fnic, t, enode_ka_timer);
 
 	struct fnic_iport_s *iport = &fnic->iport;
 	struct fip_enode_ka *penode_ka;
@@ -843,7 +843,7 @@ void fnic_handle_enode_ka_timer(struct timer_list *t)
 void fnic_handle_vn_ka_timer(struct timer_list *t)
 {
 	uint8_t *frame;
-	struct fnic *fnic = from_timer(fnic, t, vn_ka_timer);
+	struct fnic *fnic = timer_container_of(fnic, t, vn_ka_timer);
 
 	struct fnic_iport_s *iport = &fnic->iport;
 	struct fip_vn_port_ka *pvn_port_ka;
@@ -998,7 +998,7 @@ void fnic_work_on_fcs_ka_timer(struct work_struct *work)
  */
 void fnic_handle_fcs_ka_timer(struct timer_list *t)
 {
-	struct fnic *fnic = from_timer(fnic, t, fcs_ka_timer);
+	struct fnic *fnic = timer_container_of(fnic, t, fcs_ka_timer);
 
 	INIT_WORK(&fnic->fip_timer_work, fnic_work_on_fcs_ka_timer);
 	queue_work(fnic_fip_queue, &fnic->fip_timer_work);
diff --git a/drivers/scsi/fnic/fnic_main.c b/drivers/scsi/fnic/fnic_main.c
index 9a357ff42085..4cc4077ea53c 100644
--- a/drivers/scsi/fnic/fnic_main.c
+++ b/drivers/scsi/fnic/fnic_main.c
@@ -446,7 +446,7 @@ static int fnic_notify_set(struct fnic *fnic)
 
 static void fnic_notify_timer(struct timer_list *t)
 {
-	struct fnic *fnic = from_timer(fnic, t, notify_timer);
+	struct fnic *fnic = timer_container_of(fnic, t, notify_timer);
 
 	fnic_handle_link_event(fnic);
 	mod_timer(&fnic->notify_timer,
diff --git a/drivers/scsi/hisi_sas/hisi_sas_main.c b/drivers/scsi/hisi_sas/hisi_sas_main.c
index 5cb1d3db4907..894846f0f014 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_main.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_main.c
@@ -988,7 +988,7 @@ EXPORT_SYMBOL_GPL(hisi_sas_notify_phy_event);
 
 static void hisi_sas_wait_phyup_timedout(struct timer_list *t)
 {
-	struct hisi_sas_phy *phy = from_timer(phy, t, timer);
+	struct hisi_sas_phy *phy = timer_container_of(phy, t, timer);
 	struct hisi_hba *hisi_hba = phy->hisi_hba;
 	struct device *dev = hisi_hba->dev;
 	int phy_no = phy->sas_phy.id;
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
index 6621d633b2cc..a92679060ad3 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
@@ -795,7 +795,7 @@ static void phy_hard_reset_v1_hw(struct hisi_hba *hisi_hba, int phy_no)
 
 static void start_phys_v1_hw(struct timer_list *t)
 {
-	struct hisi_hba *hisi_hba = from_timer(hisi_hba, t, timer);
+	struct hisi_hba *hisi_hba = timer_container_of(hisi_hba, t, timer);
 	int i;
 
 	for (i = 0; i < hisi_hba->n_phy; i++) {
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
index a1fc400ab4c3..87cff6d7d8d5 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
@@ -1328,7 +1328,7 @@ static void init_reg_v2_hw(struct hisi_hba *hisi_hba)
 
 static void link_timeout_enable_link(struct timer_list *t)
 {
-	struct hisi_hba *hisi_hba = from_timer(hisi_hba, t, timer);
+	struct hisi_hba *hisi_hba = timer_container_of(hisi_hba, t, timer);
 	int i, reg_val;
 
 	for (i = 0; i < hisi_hba->n_phy; i++) {
@@ -1349,7 +1349,7 @@ static void link_timeout_enable_link(struct timer_list *t)
 
 static void link_timeout_disable_link(struct timer_list *t)
 {
-	struct hisi_hba *hisi_hba = from_timer(hisi_hba, t, timer);
+	struct hisi_hba *hisi_hba = timer_container_of(hisi_hba, t, timer);
 	int i, reg_val;
 
 	reg_val = hisi_sas_read32(hisi_hba, PHY_STATE);
@@ -2576,7 +2576,7 @@ static void prep_ata_v2_hw(struct hisi_hba *hisi_hba,
 
 static void hisi_sas_internal_abort_quirk_timeout(struct timer_list *t)
 {
-	struct hisi_sas_slot *slot = from_timer(slot, t, internal_abort_timer);
+	struct hisi_sas_slot *slot = timer_container_of(slot, t, internal_abort_timer);
 	struct hisi_sas_port *port = slot->port;
 	struct asd_sas_port *asd_sas_port;
 	struct asd_sas_phy *sas_phy;
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 4c493b06062a..862ab0fbc893 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1697,7 +1697,7 @@ static int ibmvfc_map_sg_data(struct scsi_cmnd *scmd,
  **/
 static void ibmvfc_timeout(struct timer_list *t)
 {
-	struct ibmvfc_event *evt = from_timer(evt, t, timer);
+	struct ibmvfc_event *evt = timer_container_of(evt, t, timer);
 	struct ibmvfc_host *vhost = evt->vhost;
 	dev_err(vhost->dev, "Command timed out (%p). Resetting connection\n", evt);
 	ibmvfc_reset_host(vhost);
@@ -4630,7 +4630,7 @@ static void ibmvfc_tgt_adisc_cancel_done(struct ibmvfc_event *evt)
  **/
 static void ibmvfc_adisc_timeout(struct timer_list *t)
 {
-	struct ibmvfc_target *tgt = from_timer(tgt, t, timer);
+	struct ibmvfc_target *tgt = timer_container_of(tgt, t, timer);
 	struct ibmvfc_host *vhost = tgt->vhost;
 	struct ibmvfc_event *evt;
 	struct ibmvfc_tmf *tmf;
diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index d65a45860b33..c9285d1faf23 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -845,7 +845,7 @@ static void ibmvscsi_reset_host(struct ibmvscsi_host_data *hostdata)
 */
 static void ibmvscsi_timeout(struct timer_list *t)
 {
-	struct srp_event_struct *evt_struct = from_timer(evt_struct, t, timer);
+	struct srp_event_struct *evt_struct = timer_container_of(evt_struct, t, timer);
 	struct ibmvscsi_host_data *hostdata = evt_struct->hostdata;
 
 	dev_err(hostdata->dev, "Command timed out (%x). Resetting connection\n",
diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
index d89135fb8faa..b29bec6abd72 100644
--- a/drivers/scsi/ipr.c
+++ b/drivers/scsi/ipr.c
@@ -2589,7 +2589,7 @@ static void ipr_process_error(struct ipr_cmnd *ipr_cmd)
  **/
 static void ipr_timeout(struct timer_list *t)
 {
-	struct ipr_cmnd *ipr_cmd = from_timer(ipr_cmd, t, timer);
+	struct ipr_cmnd *ipr_cmd = timer_container_of(ipr_cmd, t, timer);
 	unsigned long lock_flags = 0;
 	struct ipr_ioa_cfg *ioa_cfg = ipr_cmd->ioa_cfg;
 
@@ -2622,7 +2622,7 @@ static void ipr_timeout(struct timer_list *t)
  **/
 static void ipr_oper_timeout(struct timer_list *t)
 {
-	struct ipr_cmnd *ipr_cmd = from_timer(ipr_cmd, t, timer);
+	struct ipr_cmnd *ipr_cmd = timer_container_of(ipr_cmd, t, timer);
 	unsigned long lock_flags = 0;
 	struct ipr_ioa_cfg *ioa_cfg = ipr_cmd->ioa_cfg;
 
@@ -5151,7 +5151,7 @@ static void ipr_bus_reset_done(struct ipr_cmnd *ipr_cmd)
  **/
 static void ipr_abort_timeout(struct timer_list *t)
 {
-	struct ipr_cmnd *ipr_cmd = from_timer(ipr_cmd, t, timer);
+	struct ipr_cmnd *ipr_cmd = timer_container_of(ipr_cmd, t, timer);
 	struct ipr_cmnd *reset_cmd;
 	struct ipr_ioa_cfg *ioa_cfg = ipr_cmd->ioa_cfg;
 	struct ipr_cmd_pkt *cmd_pkt;
@@ -7476,7 +7476,7 @@ static int ipr_ioafp_identify_hrrq(struct ipr_cmnd *ipr_cmd)
  **/
 static void ipr_reset_timer_done(struct timer_list *t)
 {
-	struct ipr_cmnd *ipr_cmd = from_timer(ipr_cmd, t, timer);
+	struct ipr_cmnd *ipr_cmd = timer_container_of(ipr_cmd, t, timer);
 	struct ipr_ioa_cfg *ioa_cfg = ipr_cmd->ioa_cfg;
 	unsigned long lock_flags = 0;
 
diff --git a/drivers/scsi/isci/host.c b/drivers/scsi/isci/host.c
index c108b5b940c3..6d2f4c831df7 100644
--- a/drivers/scsi/isci/host.c
+++ b/drivers/scsi/isci/host.c
@@ -958,7 +958,7 @@ static enum sci_status sci_controller_start_next_phy(struct isci_host *ihost)
 
 static void phy_startup_timeout(struct timer_list *t)
 {
-	struct sci_timer *tmr = from_timer(tmr, t, timer);
+	struct sci_timer *tmr = timer_container_of(tmr, t, timer);
 	struct isci_host *ihost = container_of(tmr, typeof(*ihost), phy_timer);
 	unsigned long flags;
 	enum sci_status status;
@@ -1592,7 +1592,7 @@ static const struct sci_base_state sci_controller_state_table[] = {
 
 static void controller_timeout(struct timer_list *t)
 {
-	struct sci_timer *tmr = from_timer(tmr, t, timer);
+	struct sci_timer *tmr = timer_container_of(tmr, t, timer);
 	struct isci_host *ihost = container_of(tmr, typeof(*ihost), timer);
 	struct sci_base_state_machine *sm = &ihost->sm;
 	unsigned long flags;
@@ -1737,7 +1737,7 @@ static u8 max_spin_up(struct isci_host *ihost)
 
 static void power_control_timeout(struct timer_list *t)
 {
-	struct sci_timer *tmr = from_timer(tmr, t, timer);
+	struct sci_timer *tmr = timer_container_of(tmr, t, timer);
 	struct isci_host *ihost = container_of(tmr, typeof(*ihost), power_control.timer);
 	struct isci_phy *iphy;
 	unsigned long flags;
diff --git a/drivers/scsi/isci/phy.c b/drivers/scsi/isci/phy.c
index 743a3c64b0da..88237ec8b15f 100644
--- a/drivers/scsi/isci/phy.c
+++ b/drivers/scsi/isci/phy.c
@@ -317,7 +317,7 @@ sci_phy_link_layer_initialization(struct isci_phy *iphy,
 
 static void phy_sata_timeout(struct timer_list *t)
 {
-	struct sci_timer *tmr = from_timer(tmr, t, timer);
+	struct sci_timer *tmr = timer_container_of(tmr, t, timer);
 	struct isci_phy *iphy = container_of(tmr, typeof(*iphy), sata_timer);
 	struct isci_host *ihost = iphy->owning_port->owning_controller;
 	unsigned long flags;
diff --git a/drivers/scsi/isci/port.c b/drivers/scsi/isci/port.c
index 1609aba1c9c1..10bd2aac2cb4 100644
--- a/drivers/scsi/isci/port.c
+++ b/drivers/scsi/isci/port.c
@@ -775,7 +775,7 @@ bool sci_port_link_detected(struct isci_port *iport, struct isci_phy *iphy)
 
 static void port_timeout(struct timer_list *t)
 {
-	struct sci_timer *tmr = from_timer(tmr, t, timer);
+	struct sci_timer *tmr = timer_container_of(tmr, t, timer);
 	struct isci_port *iport = container_of(tmr, typeof(*iport), timer);
 	struct isci_host *ihost = iport->owning_controller;
 	unsigned long flags;
diff --git a/drivers/scsi/isci/port_config.c b/drivers/scsi/isci/port_config.c
index c382a257b51b..3b4820defe63 100644
--- a/drivers/scsi/isci/port_config.c
+++ b/drivers/scsi/isci/port_config.c
@@ -321,7 +321,7 @@ sci_mpc_agent_validate_phy_configuration(struct isci_host *ihost,
 static void mpc_agent_timeout(struct timer_list *t)
 {
 	u8 index;
-	struct sci_timer *tmr = from_timer(tmr, t, timer);
+	struct sci_timer *tmr = timer_container_of(tmr, t, timer);
 	struct sci_port_configuration_agent *port_agent;
 	struct isci_host *ihost;
 	unsigned long flags;
@@ -659,7 +659,7 @@ static void sci_apc_agent_link_down(
 static void apc_agent_timeout(struct timer_list *t)
 {
 	u32 index;
-	struct sci_timer *tmr = from_timer(tmr, t, timer);
+	struct sci_timer *tmr = timer_container_of(tmr, t, timer);
 	struct sci_port_configuration_agent *port_agent;
 	struct isci_host *ihost;
 	unsigned long flags;
diff --git a/drivers/scsi/libfc/fc_fcp.c b/drivers/scsi/libfc/fc_fcp.c
index e705c30b4e1b..16d0f02af1e4 100644
--- a/drivers/scsi/libfc/fc_fcp.c
+++ b/drivers/scsi/libfc/fc_fcp.c
@@ -1283,7 +1283,7 @@ static int fc_fcp_pkt_abort(struct fc_fcp_pkt *fsp)
  */
 static void fc_lun_reset_send(struct timer_list *t)
 {
-	struct fc_fcp_pkt *fsp = from_timer(fsp, t, timer);
+	struct fc_fcp_pkt *fsp = timer_container_of(fsp, t, timer);
 	struct fc_lport *lport = fsp->lp;
 
 	if (lport->tt.fcp_cmd_send(lport, fsp, fc_tm_done)) {
@@ -1416,7 +1416,7 @@ static void fc_fcp_cleanup(struct fc_lport *lport)
  */
 static void fc_fcp_timeout(struct timer_list *t)
 {
-	struct fc_fcp_pkt *fsp = from_timer(fsp, t, timer);
+	struct fc_fcp_pkt *fsp = timer_container_of(fsp, t, timer);
 	struct fc_rport *rport = fsp->rport;
 	struct fc_rport_libfc_priv *rpriv = rport->dd_data;
 
diff --git a/drivers/scsi/libiscsi.c b/drivers/scsi/libiscsi.c
index 1ddaf7228340..0d441f4cdb5d 100644
--- a/drivers/scsi/libiscsi.c
+++ b/drivers/scsi/libiscsi.c
@@ -1898,7 +1898,7 @@ EXPORT_SYMBOL_GPL(iscsi_target_alloc);
 
 static void iscsi_tmf_timedout(struct timer_list *t)
 {
-	struct iscsi_session *session = from_timer(session, t, tmf_timer);
+	struct iscsi_session *session = timer_container_of(session, t, tmf_timer);
 
 	spin_lock(&session->frwd_lock);
 	if (session->tmf_state == TMF_QUEUED) {
@@ -2240,7 +2240,7 @@ EXPORT_SYMBOL_GPL(iscsi_eh_cmd_timed_out);
 
 static void iscsi_check_transport_timeouts(struct timer_list *t)
 {
-	struct iscsi_conn *conn = from_timer(conn, t, transport_timer);
+	struct iscsi_conn *conn = timer_container_of(conn, t, transport_timer);
 	struct iscsi_session *session = conn->session;
 	unsigned long recv_timeout, next_timeout = 0, last_recv;
 
diff --git a/drivers/scsi/libsas/sas_scsi_host.c b/drivers/scsi/libsas/sas_scsi_host.c
index feb2461b90e8..928723c90b75 100644
--- a/drivers/scsi/libsas/sas_scsi_host.c
+++ b/drivers/scsi/libsas/sas_scsi_host.c
@@ -865,7 +865,7 @@ void sas_task_internal_done(struct sas_task *task)
 
 void sas_task_internal_timedout(struct timer_list *t)
 {
-	struct sas_task_slow *slow = from_timer(slow, t, timer);
+	struct sas_task_slow *slow = timer_container_of(slow, t, timer);
 	struct sas_task *task = slow->task;
 	bool is_completed = true;
 	unsigned long flags;
diff --git a/drivers/scsi/lpfc/lpfc_ct.c b/drivers/scsi/lpfc/lpfc_ct.c
index 12c67cdd7c19..0b313aaf033e 100644
--- a/drivers/scsi/lpfc/lpfc_ct.c
+++ b/drivers/scsi/lpfc/lpfc_ct.c
@@ -3433,7 +3433,7 @@ lpfc_fdmi_cmd(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp,
 void
 lpfc_delayed_disc_tmo(struct timer_list *t)
 {
-	struct lpfc_vport *vport = from_timer(vport, t, delayed_disc_tmo);
+	struct lpfc_vport *vport = timer_container_of(vport, t, delayed_disc_tmo);
 	struct lpfc_hba   *phba = vport->phba;
 	uint32_t tmo_posted;
 	unsigned long iflag;
diff --git a/drivers/scsi/lpfc/lpfc_els.c b/drivers/scsi/lpfc/lpfc_els.c
index 375a879c31f1..83eec96f1043 100644
--- a/drivers/scsi/lpfc/lpfc_els.c
+++ b/drivers/scsi/lpfc/lpfc_els.c
@@ -4378,7 +4378,7 @@ lpfc_cancel_retry_delay_tmo(struct lpfc_vport *vport, struct lpfc_nodelist *nlp)
 void
 lpfc_els_retry_delay(struct timer_list *t)
 {
-	struct lpfc_nodelist *ndlp = from_timer(ndlp, t, nlp_delayfunc);
+	struct lpfc_nodelist *ndlp = timer_container_of(ndlp, t, nlp_delayfunc);
 	struct lpfc_vport *vport = ndlp->vport;
 	struct lpfc_hba   *phba = vport->phba;
 	unsigned long flags;
@@ -9385,7 +9385,7 @@ lpfc_els_rcv_edc(struct lpfc_vport *vport, struct lpfc_iocbq *cmdiocb,
 void
 lpfc_els_timeout(struct timer_list *t)
 {
-	struct lpfc_vport *vport = from_timer(vport, t, els_tmofunc);
+	struct lpfc_vport *vport = timer_container_of(vport, t, els_tmofunc);
 	struct lpfc_hba   *phba = vport->phba;
 	uint32_t tmo_posted;
 	unsigned long iflag;
@@ -11594,7 +11594,7 @@ lpfc_issue_els_npiv_logo(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp)
 void
 lpfc_fabric_block_timeout(struct timer_list *t)
 {
-	struct lpfc_hba  *phba = from_timer(phba, t, fabric_block_timer);
+	struct lpfc_hba  *phba = timer_container_of(phba, t, fabric_block_timer);
 	unsigned long iflags;
 	uint32_t tmo_posted;
 
diff --git a/drivers/scsi/lpfc/lpfc_hbadisc.c b/drivers/scsi/lpfc/lpfc_hbadisc.c
index 179be6c5a43e..2eaf46be8bb7 100644
--- a/drivers/scsi/lpfc/lpfc_hbadisc.c
+++ b/drivers/scsi/lpfc/lpfc_hbadisc.c
@@ -6059,7 +6059,7 @@ lpfc_cleanup_discovery_resources(struct lpfc_vport *vport)
 void
 lpfc_disc_timeout(struct timer_list *t)
 {
-	struct lpfc_vport *vport = from_timer(vport, t, fc_disctmo);
+	struct lpfc_vport *vport = timer_container_of(vport, t, fc_disctmo);
 	struct lpfc_hba   *phba = vport->phba;
 	uint32_t tmo_posted;
 	unsigned long flags = 0;
diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 90021653e59e..68e6ba085b2b 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -1196,7 +1196,7 @@ lpfc_hb_timeout(struct timer_list *t)
 	uint32_t tmo_posted;
 	unsigned long iflag;
 
-	phba = from_timer(phba, t, hb_tmofunc);
+	phba = timer_container_of(phba, t, hb_tmofunc);
 
 	/* Check for heart beat timeout conditions */
 	spin_lock_irqsave(&phba->pport->work_port_lock, iflag);
@@ -1228,7 +1228,7 @@ lpfc_rrq_timeout(struct timer_list *t)
 {
 	struct lpfc_hba *phba;
 
-	phba = from_timer(phba, t, rrq_tmr);
+	phba = timer_container_of(phba, t, rrq_tmr);
 	if (test_bit(FC_UNLOADING, &phba->pport->load_flag)) {
 		clear_bit(HBA_RRQ_ACTIVE, &phba->hba_flag);
 		return;
@@ -5128,7 +5128,7 @@ lpfc_fcf_redisc_wait_start_timer(struct lpfc_hba *phba)
 static void
 lpfc_sli4_fcf_redisc_wait_tmo(struct timer_list *t)
 {
-	struct lpfc_hba *phba = from_timer(phba, t, fcf.redisc_wait);
+	struct lpfc_hba *phba = timer_container_of(phba, t, fcf.redisc_wait);
 
 	/* Don't send FCF rediscovery event if timer cancelled */
 	spin_lock_irq(&phba->hbalock);
@@ -5159,7 +5159,7 @@ lpfc_sli4_fcf_redisc_wait_tmo(struct timer_list *t)
 static void
 lpfc_vmid_poll(struct timer_list *t)
 {
-	struct lpfc_hba *phba = from_timer(phba, t, inactive_vmid_poll);
+	struct lpfc_hba *phba = timer_container_of(phba, t, inactive_vmid_poll);
 	u32 wake_up = 0;
 
 	/* check if there is a need to issue QFPA */
diff --git a/drivers/scsi/lpfc/lpfc_scsi.c b/drivers/scsi/lpfc/lpfc_scsi.c
index 9edf80b14b1a..8acb744febcd 100644
--- a/drivers/scsi/lpfc/lpfc_scsi.c
+++ b/drivers/scsi/lpfc/lpfc_scsi.c
@@ -5190,7 +5190,7 @@ void lpfc_poll_start_timer(struct lpfc_hba * phba)
  **/
 void lpfc_poll_timeout(struct timer_list *t)
 {
-	struct lpfc_hba *phba = from_timer(phba, t, fcp_poll_timer);
+	struct lpfc_hba *phba = timer_container_of(phba, t, fcp_poll_timer);
 
 	if (phba->cfg_poll & ENABLE_FCP_RING_POLLING) {
 		lpfc_sli_handle_fast_ring_event(phba,
diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 6574f9e74476..b694fe1bf714 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -3925,7 +3925,7 @@ void lpfc_poll_eratt(struct timer_list *t)
 	uint32_t eratt = 0;
 	uint64_t sli_intr, cnt;
 
-	phba = from_timer(phba, t, eratt_poll);
+	phba = timer_container_of(phba, t, eratt_poll);
 	if (!test_bit(HBA_SETUP, &phba->hba_flag))
 		return;
 
@@ -9115,7 +9115,7 @@ lpfc_sli4_hba_setup(struct lpfc_hba *phba)
 void
 lpfc_mbox_timeout(struct timer_list *t)
 {
-	struct lpfc_hba  *phba = from_timer(phba, t, sli.mbox_tmo);
+	struct lpfc_hba  *phba = timer_container_of(phba, t, sli.mbox_tmo);
 	unsigned long iflag;
 	uint32_t tmo_posted;
 
@@ -15651,7 +15651,7 @@ lpfc_sli4_intr_handler(int irq, void *dev_id)
 
 void lpfc_sli4_poll_hbtimer(struct timer_list *t)
 {
-	struct lpfc_hba *phba = from_timer(phba, t, cpuhp_poll_timer);
+	struct lpfc_hba *phba = timer_container_of(phba, t, cpuhp_poll_timer);
 	struct lpfc_queue *eq;
 
 	rcu_read_lock();
diff --git a/drivers/scsi/megaraid/megaraid_mbox.c b/drivers/scsi/megaraid/megaraid_mbox.c
index d533a8aa72cc..ce72cb04a78a 100644
--- a/drivers/scsi/megaraid/megaraid_mbox.c
+++ b/drivers/scsi/megaraid/megaraid_mbox.c
@@ -3836,7 +3836,7 @@ megaraid_sysfs_get_ldmap_done(uioc_t *uioc)
 static void
 megaraid_sysfs_get_ldmap_timeout(struct timer_list *t)
 {
-	struct uioc_timeout *timeout = from_timer(timeout, t, timer);
+	struct uioc_timeout *timeout = timer_container_of(timeout, t, timer);
 	uioc_t		*uioc = timeout->uioc;
 	adapter_t	*adapter = (adapter_t *)uioc->buf_vaddr;
 	mraid_device_t	*raid_dev = ADAP2RAIDDEV(adapter);
diff --git a/drivers/scsi/megaraid/megaraid_mm.c b/drivers/scsi/megaraid/megaraid_mm.c
index 1f2cd15e3361..d3133be36879 100644
--- a/drivers/scsi/megaraid/megaraid_mm.c
+++ b/drivers/scsi/megaraid/megaraid_mm.c
@@ -783,7 +783,7 @@ ioctl_done(uioc_t *kioc)
 static void
 lld_timedout(struct timer_list *t)
 {
-	struct uioc_timeout *timeout = from_timer(timeout, t, timer);
+	struct uioc_timeout *timeout = timer_container_of(timeout, t, timer);
 	uioc_t *kioc	= timeout->uioc;
 
 	kioc->status 	= -ETIME;
diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
index c20447b39cb9..e94bf778e83b 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -2721,7 +2721,7 @@ int megasas_sriov_start_heartbeat(struct megasas_instance *instance,
 static void megasas_sriov_heartbeat_handler(struct timer_list *t)
 {
 	struct megasas_instance *instance =
-		from_timer(instance, t, sriov_heartbeat_timer);
+		timer_container_of(instance, t, sriov_heartbeat_timer);
 
 	if (instance->hb_host_mem->HB.fwCounter !=
 	    instance->hb_host_mem->HB.driverCounter) {
diff --git a/drivers/scsi/mvsas/mv_sas.c b/drivers/scsi/mvsas/mv_sas.c
index 52ac10226cb0..6c46654b9cd9 100644
--- a/drivers/scsi/mvsas/mv_sas.c
+++ b/drivers/scsi/mvsas/mv_sas.c
@@ -1755,7 +1755,7 @@ static int mvs_handle_event(struct mvs_info *mvi, void *data, int handler)
 
 static void mvs_sig_time_out(struct timer_list *t)
 {
-	struct mvs_phy *phy = from_timer(phy, t, timer);
+	struct mvs_phy *phy = timer_container_of(phy, t, timer);
 	struct mvs_info *mvi = phy->mvi;
 	u8 phy_no;
 
diff --git a/drivers/scsi/ncr53c8xx.c b/drivers/scsi/ncr53c8xx.c
index 14ac81ec0aa0..34ba9b137789 100644
--- a/drivers/scsi/ncr53c8xx.c
+++ b/drivers/scsi/ncr53c8xx.c
@@ -7923,7 +7923,7 @@ irqreturn_t ncr53c8xx_intr(int irq, void *dev_id)
 
 static void ncr53c8xx_timeout(struct timer_list *t)
 {
-	struct ncb *np = from_timer(np, t, timer);
+	struct ncb *np = timer_container_of(np, t, timer);
 	unsigned long flags;
 	struct scsi_cmnd *done_list;
 
diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index e0aeb206df8d..33f403e307eb 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -544,7 +544,7 @@ static void pmcraid_ioa_reset(struct pmcraid_cmd *);
  */
 static void pmcraid_bist_done(struct timer_list *t)
 {
-	struct pmcraid_cmd *cmd = from_timer(cmd, t, timer);
+	struct pmcraid_cmd *cmd = timer_container_of(cmd, t, timer);
 	struct pmcraid_instance *pinstance = cmd->drv_inst;
 	unsigned long lock_flags;
 	int rc;
@@ -601,7 +601,7 @@ static void pmcraid_start_bist(struct pmcraid_cmd *cmd)
  */
 static void pmcraid_reset_alert_done(struct timer_list *t)
 {
-	struct pmcraid_cmd *cmd = from_timer(cmd, t, timer);
+	struct pmcraid_cmd *cmd = timer_container_of(cmd, t, timer);
 	struct pmcraid_instance *pinstance = cmd->drv_inst;
 	u32 status = ioread32(pinstance->ioa_status);
 	unsigned long lock_flags;
@@ -685,7 +685,7 @@ static void pmcraid_reset_alert(struct pmcraid_cmd *cmd)
  */
 static void pmcraid_timeout_handler(struct timer_list *t)
 {
-	struct pmcraid_cmd *cmd = from_timer(cmd, t, timer);
+	struct pmcraid_cmd *cmd = timer_container_of(cmd, t, timer);
 	struct pmcraid_instance *pinstance = cmd->drv_inst;
 	unsigned long lock_flags;
 
diff --git a/drivers/scsi/qla1280.c b/drivers/scsi/qla1280.c
index 078a9c80bce2..6af018f1ca22 100644
--- a/drivers/scsi/qla1280.c
+++ b/drivers/scsi/qla1280.c
@@ -721,7 +721,7 @@ enum action {
 
 static void qla1280_mailbox_timeout(struct timer_list *t)
 {
-	struct scsi_qla_host *ha = from_timer(ha, t, mailbox_timer);
+	struct scsi_qla_host *ha = timer_container_of(ha, t, mailbox_timer);
 	struct device_reg __iomem *reg;
 	reg = ha->iobase;
 
diff --git a/drivers/scsi/qla2xxx/qla_edif.c b/drivers/scsi/qla2xxx/qla_edif.c
index dcde55c8ee5d..32e9f7aefecf 100644
--- a/drivers/scsi/qla2xxx/qla_edif.c
+++ b/drivers/scsi/qla2xxx/qla_edif.c
@@ -94,7 +94,7 @@ static struct edif_list_entry *qla_edif_list_find_sa_index(fc_port_t *fcport,
 /* timeout called when no traffic and delayed rx sa_index delete */
 static void qla2x00_sa_replace_iocb_timeout(struct timer_list *t)
 {
-	struct edif_list_entry *edif_entry = from_timer(edif_entry, t, timer);
+	struct edif_list_entry *edif_entry = timer_container_of(edif_entry, t, timer);
 	fc_port_t *fcport = edif_entry->fcport;
 	struct scsi_qla_host *vha = fcport->vha;
 	struct  edif_sa_ctl *sa_ctl;
diff --git a/drivers/scsi/qla2xxx/qla_init.c b/drivers/scsi/qla2xxx/qla_init.c
index 0c2dd782b675..514934dd6f80 100644
--- a/drivers/scsi/qla2xxx/qla_init.c
+++ b/drivers/scsi/qla2xxx/qla_init.c
@@ -45,7 +45,7 @@ static void __qla24xx_handle_gpdb_event(scsi_qla_host_t *, struct event_arg *);
 void
 qla2x00_sp_timeout(struct timer_list *t)
 {
-	srb_t *sp = from_timer(sp, t, u.iocb_cmd.timer);
+	srb_t *sp = timer_container_of(sp, t, u.iocb_cmd.timer);
 	struct srb_iocb *iocb;
 	scsi_qla_host_t *vha = sp->vha;
 
diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index b44d134e7105..c028a9979e45 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -7392,7 +7392,7 @@ static void qla_wind_down_chip(scsi_qla_host_t *vha)
 void
 qla2x00_timer(struct timer_list *t)
 {
-	scsi_qla_host_t *vha = from_timer(vha, t, timer);
+	scsi_qla_host_t *vha = timer_container_of(vha, t, timer);
 	unsigned long	cpu_flags = 0;
 	int		start_dpc = 0;
 	int		index;
diff --git a/drivers/scsi/qla4xxx/ql4_os.c b/drivers/scsi/qla4xxx/ql4_os.c
index d540d66e6ffc..d4141656b204 100644
--- a/drivers/scsi/qla4xxx/ql4_os.c
+++ b/drivers/scsi/qla4xxx/ql4_os.c
@@ -4551,7 +4551,7 @@ static void qla4xxx_check_relogin_flash_ddb(struct iscsi_cls_session *cls_sess)
  **/
 static void qla4xxx_timer(struct timer_list *t)
 {
-	struct scsi_qla_host *ha = from_timer(ha, t, timer);
+	struct scsi_qla_host *ha = timer_container_of(ha, t, timer);
 	int start_dpc = 0;
 	uint16_t w;
 
diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index 88135fdb8bd1..0042f8e648d0 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -3810,7 +3810,7 @@ static void pqi_heartbeat_timer_handler(struct timer_list *t)
 {
 	int num_interrupts;
 	u32 heartbeat_count;
-	struct pqi_ctrl_info *ctrl_info = from_timer(ctrl_info, t, heartbeat_timer);
+	struct pqi_ctrl_info *ctrl_info = timer_container_of(ctrl_info, t, heartbeat_timer);
 
 	pqi_check_ctrl_health(ctrl_info);
 	if (pqi_ctrl_offline(ctrl_info))
diff --git a/drivers/scsi/sym53c8xx_2/sym_glue.c b/drivers/scsi/sym53c8xx_2/sym_glue.c
index 1a6eb72ca281..57637a81776d 100644
--- a/drivers/scsi/sym53c8xx_2/sym_glue.c
+++ b/drivers/scsi/sym53c8xx_2/sym_glue.c
@@ -545,7 +545,7 @@ static irqreturn_t sym53c8xx_intr(int irq, void *dev_id)
  */
 static void sym53c8xx_timer(struct timer_list *t)
 {
-	struct sym_hcb *np = from_timer(np, t, s.timer);
+	struct sym_hcb *np = timer_container_of(np, t, s.timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(np->s.host->host_lock, flags);
diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index da229965d98e..c4f49e20d5f3 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -39,7 +39,7 @@ static void agilent_82357a_bulk_complete(struct urb *urb)
 
 static void agilent_82357a_timeout_handler(struct timer_list *t)
 {
-	struct agilent_82357a_priv *a_priv = from_timer(a_priv, t, bulk_timer);
+	struct agilent_82357a_priv *a_priv = timer_container_of(a_priv, t, bulk_timer);
 	struct agilent_82357a_urb_ctx *context = &a_priv->context;
 
 	context->timed_out = 1;
diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 8456b97290b8..e6693046d262 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -82,7 +82,7 @@ static int pop_gpib_event_nolock(struct gpib_board *board, gpib_event_queue_t *q
 
 static void watchdog_timeout(struct timer_list *t)
 {
-	struct gpib_board *board = from_timer(board, t, timer);
+	struct gpib_board *board = timer_container_of(board, t, timer);
 
 	set_bit(TIMO_NUM, &board->status);
 	wake_up_interruptible(&board->wait);
@@ -129,7 +129,7 @@ static inline int pseudo_irq_period(void)
 
 static void pseudo_irq_handler(struct timer_list *t)
 {
-	struct gpib_pseudo_irq *pseudo_irq = from_timer(pseudo_irq, t, timer);
+	struct gpib_pseudo_irq *pseudo_irq = timer_container_of(pseudo_irq, t, timer);
 
 	if (pseudo_irq->handler)
 		pseudo_irq->handler(0, pseudo_irq->board);
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index b297261818f2..f8c762012d54 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -560,7 +560,7 @@ struct wait_info {
 
 static void wait_timeout(struct timer_list *t)
 {
-	struct wait_info *winfo = from_timer(winfo, t, timer);
+	struct wait_info *winfo = timer_container_of(winfo, t, timer);
 
 	winfo->timed_out = 1;
 	wake_up_interruptible(&winfo->board->wait);
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 9f1b9927f025..ff0931e1ce01 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -92,7 +92,7 @@ static void ni_usb_bulk_complete(struct urb *urb)
 
 static void ni_usb_timeout_handler(struct timer_list *t)
 {
-	struct ni_usb_priv *ni_priv = from_timer(ni_priv, t, bulk_timer);
+	struct ni_usb_priv *ni_priv = timer_container_of(ni_priv, t, bulk_timer);
 	struct ni_usb_urb_ctx *context = &ni_priv->context;
 
 	context->timed_out = 1;
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 2855ba2296ac..77360bfe081a 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -295,7 +295,7 @@ static irqreturn_t prp_nfb4eof_interrupt(int irq, void *dev_id)
  */
 static void prp_eof_timeout(struct timer_list *t)
 {
-	struct prp_priv *priv = from_timer(priv, t, eof_timeout_timer);
+	struct prp_priv *priv = timer_container_of(priv, t, eof_timeout_timer);
 	struct imx_media_video_dev *vdev = priv->vdev;
 	struct imx_ic_priv *ic_priv = priv->ic_priv;
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index f1d7fce8c020..a7cd3ef95fc3 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -356,7 +356,7 @@ static irqreturn_t csi_idmac_nfb4eof_interrupt(int irq, void *dev_id)
  */
 static void csi_idmac_eof_timeout(struct timer_list *t)
 {
-	struct csi_priv *priv = from_timer(priv, t, eof_timeout_timer);
+	struct csi_priv *priv = timer_container_of(priv, t, eof_timeout_timer);
 	struct imx_media_video_dev *vdev = priv->vdev;
 
 	v4l2_err(&priv->sd, "EOF timeout\n");
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 1c9e8b01d9d8..eedcf9d7357c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1130,7 +1130,7 @@ static void collect_traffic_statistics(struct adapter *padapter)
 	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8/2/1024/1024);
 }
 
-u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
+u8 traffic_status_watchdog(struct adapter *padapter, u8 timer_container_of)
 {
 	u8 bEnterPS = false;
 	u16 BusyThresholdHigh = 25;
@@ -1198,10 +1198,10 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 
 		/*  LeisurePS only work in infra mode. */
 		if (bEnterPS) {
-			if (!from_timer)
+			if (!timer_container_of)
 				LPS_Enter(padapter, "TRAFFIC_IDLE");
 		} else {
-			if (!from_timer)
+			if (!timer_container_of)
 				LPS_Leave(padapter, "TRAFFIC_BUSY");
 			else
 				rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_TRAFFIC_BUSY, 1);
@@ -1213,7 +1213,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 		if (check_fwstate(&dvobj->padapters->mlmepriv, WIFI_ASOC_STATE))
 			n_assoc_iface++;
 
-		if (!from_timer && n_assoc_iface == 0)
+		if (!timer_container_of && n_assoc_iface == 0)
 			LPS_Leave(padapter, "NON_LINKED");
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 58de0c2fdd68..6ac05fce48a2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1460,7 +1460,7 @@ void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf)
 */
 void _rtw_join_timeout_handler(struct timer_list *t)
 {
-	struct adapter *adapter = from_timer(adapter, t,
+	struct adapter *adapter = timer_container_of(adapter, t,
 						  mlmepriv.assoc_timer);
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
@@ -1504,7 +1504,7 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 */
 void rtw_scan_timeout_handler(struct timer_list *t)
 {
-	struct adapter *adapter = from_timer(adapter, t,
+	struct adapter *adapter = timer_container_of(adapter, t,
 						  mlmepriv.scan_to_timer);
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 3d36b6f005e0..6df037af304a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5088,7 +5088,7 @@ void linked_status_chk(struct adapter *padapter)
 void survey_timer_hdl(struct timer_list *t)
 {
 	struct adapter *padapter =
-		from_timer(padapter, t, mlmeextpriv.survey_timer);
+		timer_container_of(padapter, t, mlmeextpriv.survey_timer);
 	struct cmd_obj	*ph2c;
 	struct sitesurvey_parm	*psurveyPara;
 	struct cmd_priv 				*pcmdpriv = &padapter->cmdpriv;
@@ -5123,7 +5123,7 @@ void survey_timer_hdl(struct timer_list *t)
 void link_timer_hdl(struct timer_list *t)
 {
 	struct adapter *padapter =
-		from_timer(padapter, t, mlmeextpriv.link_timer);
+		timer_container_of(padapter, t, mlmeextpriv.link_timer);
 	/* static unsigned int		rx_pkt = 0; */
 	/* static u64				tx_cnt = 0; */
 	/* struct xmit_priv 	*pxmitpriv = &(padapter->xmitpriv); */
@@ -5161,7 +5161,7 @@ void link_timer_hdl(struct timer_list *t)
 
 void addba_timer_hdl(struct timer_list *t)
 {
-	struct sta_info *psta = from_timer(psta, t, addba_retry_timer);
+	struct sta_info *psta = timer_container_of(psta, t, addba_retry_timer);
 	struct ht_priv *phtpriv;
 
 	if (!psta)
@@ -5179,7 +5179,7 @@ void addba_timer_hdl(struct timer_list *t)
 void sa_query_timer_hdl(struct timer_list *t)
 {
 	struct adapter *padapter =
-		from_timer(padapter, t, mlmeextpriv.sa_query_timer);
+		timer_container_of(padapter, t, mlmeextpriv.sa_query_timer);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	/* disconnect */
 	spin_lock_bh(&pmlmepriv->lock);
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index c60e179bb2e1..293e5fa2c608 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -177,7 +177,7 @@ void rtw_ps_processor(struct adapter *padapter)
 static void pwr_state_check_handler(struct timer_list *t)
 {
 	struct pwrctrl_priv *pwrctrlpriv =
-		from_timer(pwrctrlpriv, t, pwr_state_check_timer);
+		timer_container_of(pwrctrlpriv, t, pwr_state_check_timer);
 	struct adapter *padapter = pwrctrlpriv->adapter;
 
 	rtw_ps_cmd(padapter);
@@ -677,7 +677,7 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
  */
 static void pwr_rpwm_timeout_handler(struct timer_list *t)
 {
-	struct pwrctrl_priv *pwrpriv = from_timer(pwrpriv, t, pwr_rpwm_timer);
+	struct pwrctrl_priv *pwrpriv = timer_container_of(pwrpriv, t, pwr_rpwm_timer);
 
 	if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
 		return;
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 895116e9f4e7..cb3c7b8ed20f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1908,7 +1908,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 {
 	struct recv_reorder_ctrl *preorder_ctrl =
-		from_timer(preorder_ctrl, t, reordering_ctrl_timer);
+		timer_container_of(preorder_ctrl, t, reordering_ctrl_timer);
 	struct adapter *padapter = preorder_ctrl->padapter;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
 
@@ -2087,7 +2087,7 @@ s32 rtw_recv_entry(union recv_frame *precvframe)
 static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 {
 	struct adapter *adapter =
-		from_timer(adapter, t, recvpriv.signal_stat_timer);
+		timer_container_of(adapter, t, recvpriv.signal_stat_timer);
 	struct recv_priv *recvpriv = &adapter->recvpriv;
 
 	u32 tmp_s, tmp_q;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 2080408743ef..0e90cfd472a1 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -617,7 +617,7 @@ extern void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr
 extern void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
 extern void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext);
 extern void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
-extern u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer);
+extern u8 traffic_status_watchdog(struct adapter *padapter, u8 timer_container_of);
 
 int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw, u8 *offset);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index 1904e82a24b5..fd4ae870a617 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -9,7 +9,7 @@
 static void _dynamic_check_timer_handler(struct timer_list *t)
 {
 	struct adapter *adapter =
-		from_timer(adapter, t, mlmepriv.dynamic_chk_timer);
+		timer_container_of(adapter, t, mlmepriv.dynamic_chk_timer);
 
 	rtw_dynamic_check_timer_handler(adapter);
 
@@ -19,7 +19,7 @@ static void _dynamic_check_timer_handler(struct timer_list *t)
 static void _rtw_set_scan_deny_timer_hdl(struct timer_list *t)
 {
 	struct adapter *adapter =
-		from_timer(adapter, t, mlmepriv.set_scan_deny_timer);
+		timer_container_of(adapter, t, mlmepriv.set_scan_deny_timer);
 
 	rtw_clear_scan_deny(adapter);
 }
diff --git a/drivers/target/iscsi/iscsi_target_erl0.c b/drivers/target/iscsi/iscsi_target_erl0.c
index f0d7eebfcad6..e11b84c6abe2 100644
--- a/drivers/target/iscsi/iscsi_target_erl0.c
+++ b/drivers/target/iscsi/iscsi_target_erl0.c
@@ -743,7 +743,7 @@ int iscsit_check_post_dataout(
 
 void iscsit_handle_time2retain_timeout(struct timer_list *t)
 {
-	struct iscsit_session *sess = from_timer(sess, t, time2retain_timer);
+	struct iscsit_session *sess = timer_container_of(sess, t, time2retain_timer);
 	struct iscsi_portal_group *tpg = sess->tpg;
 	struct se_portal_group *se_tpg = &tpg->tpg_se_tpg;
 
diff --git a/drivers/target/iscsi/iscsi_target_erl1.c b/drivers/target/iscsi/iscsi_target_erl1.c
index e7c3c4cdaae4..d8ca06e697d6 100644
--- a/drivers/target/iscsi/iscsi_target_erl1.c
+++ b/drivers/target/iscsi/iscsi_target_erl1.c
@@ -1094,7 +1094,7 @@ void iscsit_handle_dataout_timeout(struct timer_list *t)
 {
 	u32 pdu_length = 0, pdu_offset = 0;
 	u32 r2t_length = 0, r2t_offset = 0;
-	struct iscsit_cmd *cmd = from_timer(cmd, t, dataout_timer);
+	struct iscsit_cmd *cmd = timer_container_of(cmd, t, dataout_timer);
 	struct iscsit_conn *conn = cmd->conn;
 	struct iscsit_session *sess = NULL;
 	struct iscsi_node_attrib *na;
diff --git a/drivers/target/iscsi/iscsi_target_util.c b/drivers/target/iscsi/iscsi_target_util.c
index 0bd62ab9a1cd..a607366f9d2a 100644
--- a/drivers/target/iscsi/iscsi_target_util.c
+++ b/drivers/target/iscsi/iscsi_target_util.c
@@ -851,7 +851,7 @@ static int iscsit_add_nopin(struct iscsit_conn *conn, int want_response)
 
 void iscsit_handle_nopin_response_timeout(struct timer_list *t)
 {
-	struct iscsit_conn *conn = from_timer(conn, t, nopin_response_timer);
+	struct iscsit_conn *conn = timer_container_of(conn, t, nopin_response_timer);
 	struct iscsit_session *sess = conn->sess;
 
 	iscsit_inc_conn_usage_count(conn);
@@ -931,7 +931,7 @@ void iscsit_stop_nopin_response_timer(struct iscsit_conn *conn)
 
 void iscsit_handle_nopin_timeout(struct timer_list *t)
 {
-	struct iscsit_conn *conn = from_timer(conn, t, nopin_timer);
+	struct iscsit_conn *conn = timer_container_of(conn, t, nopin_timer);
 
 	iscsit_inc_conn_usage_count(conn);
 
@@ -998,7 +998,7 @@ void iscsit_stop_nopin_timer(struct iscsit_conn *conn)
 
 void iscsit_login_timeout(struct timer_list *t)
 {
-	struct iscsit_conn *conn = from_timer(conn, t, login_timer);
+	struct iscsit_conn *conn = timer_container_of(conn, t, login_timer);
 	struct iscsi_login *login = conn->login;
 
 	pr_debug("Entering iscsi_target_login_timeout >>>>>>>>>>>>>>>>>>>\n");
diff --git a/drivers/target/target_core_user.c b/drivers/target/target_core_user.c
index 43872ccc07cc..3fd963612775 100644
--- a/drivers/target/target_core_user.c
+++ b/drivers/target/target_core_user.c
@@ -1564,7 +1564,7 @@ static void tcmu_device_timedout(struct tcmu_dev *udev)
 
 static void tcmu_cmd_timedout(struct timer_list *t)
 {
-	struct tcmu_dev *udev = from_timer(udev, t, cmd_timer);
+	struct tcmu_dev *udev = timer_container_of(udev, t, cmd_timer);
 
 	pr_debug("%s cmd timeout has expired\n", udev->name);
 	tcmu_device_timedout(udev);
@@ -1572,7 +1572,7 @@ static void tcmu_cmd_timedout(struct timer_list *t)
 
 static void tcmu_qfull_timedout(struct timer_list *t)
 {
-	struct tcmu_dev *udev = from_timer(udev, t, qfull_timer);
+	struct tcmu_dev *udev = timer_container_of(udev, t, qfull_timer);
 
 	pr_debug("%s qfull timeout has expired\n", udev->name);
 	tcmu_device_timedout(udev);
diff --git a/drivers/tty/ipwireless/hardware.c b/drivers/tty/ipwireless/hardware.c
index c13f52337035..e18848267be4 100644
--- a/drivers/tty/ipwireless/hardware.c
+++ b/drivers/tty/ipwireless/hardware.c
@@ -1676,7 +1676,7 @@ void ipwireless_init_hardware_v2_v3(struct ipw_hardware *hw)
 
 static void ipwireless_setup_timer(struct timer_list *t)
 {
-	struct ipw_hardware *hw = from_timer(hw, t, setup_timer);
+	struct ipw_hardware *hw = timer_container_of(hw, t, setup_timer);
 
 	hw->init_loops++;
 
diff --git a/drivers/tty/mips_ejtag_fdc.c b/drivers/tty/mips_ejtag_fdc.c
index fa47bfcf9e86..9c5d4ff8875c 100644
--- a/drivers/tty/mips_ejtag_fdc.c
+++ b/drivers/tty/mips_ejtag_fdc.c
@@ -683,7 +683,7 @@ static irqreturn_t mips_ejtag_fdc_isr(int irq, void *dev_id)
  */
 static void mips_ejtag_fdc_tty_timer(struct timer_list *t)
 {
-	struct mips_ejtag_fdc_tty *priv = from_timer(priv, t, poll_timer);
+	struct mips_ejtag_fdc_tty *priv = timer_container_of(priv, t, poll_timer);
 
 	mips_ejtag_fdc_handle(priv);
 	if (!priv->removing)
diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
index 40a336ef8c7e..7fc535452c0b 100644
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -1971,7 +1971,7 @@ static void gsm_control_response(struct gsm_mux *gsm, unsigned int command,
 
 static void gsm_control_keep_alive(struct timer_list *t)
 {
-	struct gsm_mux *gsm = from_timer(gsm, t, ka_timer);
+	struct gsm_mux *gsm = timer_container_of(gsm, t, ka_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&gsm->control_lock, flags);
@@ -2028,7 +2028,7 @@ static void gsm_control_transmit(struct gsm_mux *gsm, struct gsm_control *ctrl)
 
 static void gsm_control_retransmit(struct timer_list *t)
 {
-	struct gsm_mux *gsm = from_timer(gsm, t, t2_timer);
+	struct gsm_mux *gsm = timer_container_of(gsm, t, t2_timer);
 	struct gsm_control *ctrl;
 	unsigned long flags;
 	spin_lock_irqsave(&gsm->control_lock, flags);
@@ -2229,7 +2229,7 @@ static int gsm_dlci_negotiate(struct gsm_dlci *dlci)
 
 static void gsm_dlci_t1(struct timer_list *t)
 {
-	struct gsm_dlci *dlci = from_timer(dlci, t, t1);
+	struct gsm_dlci *dlci = timer_container_of(dlci, t, t1);
 	struct gsm_mux *gsm = dlci->gsm;
 
 	switch (dlci->state) {
@@ -2489,7 +2489,7 @@ static void gsm_dlci_command(struct gsm_dlci *dlci, const u8 *data, int len)
  */
 static void gsm_kick_timer(struct timer_list *t)
 {
-	struct gsm_mux *gsm = from_timer(gsm, t, kick_timer);
+	struct gsm_mux *gsm = timer_container_of(gsm, t, kick_timer);
 	unsigned long flags;
 	int sent = 0;
 
diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 392447038bfb..8c25ef774566 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -304,7 +304,7 @@ static void aspeed_vuart_unthrottle(struct uart_port *port)
 
 static void aspeed_vuart_unthrottle_exp(struct timer_list *timer)
 {
-	struct aspeed_vuart *vuart = from_timer(vuart, timer, unthrottle_timer);
+	struct aspeed_vuart *vuart = timer_container_of(vuart, timer, unthrottle_timer);
 	struct uart_8250_port *up = vuart->port;
 
 	if (!tty_buffer_space_avail(&up->port.state->port)) {
diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index 5a56f853cf6d..a7e09fa7df94 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -206,7 +206,7 @@ static void serial_unlink_irq_chain(struct uart_8250_port *up)
  */
 static void serial8250_timeout(struct timer_list *t)
 {
-	struct uart_8250_port *up = from_timer(up, t, timer);
+	struct uart_8250_port *up = timer_container_of(up, t, timer);
 
 	up->port.handle_irq(&up->port);
 	mod_timer(&up->timer, jiffies + uart_poll_timeout(&up->port));
@@ -214,7 +214,7 @@ static void serial8250_timeout(struct timer_list *t)
 
 static void serial8250_backup_timeout(struct timer_list *t)
 {
-	struct uart_8250_port *up = from_timer(up, t, timer);
+	struct uart_8250_port *up = timer_container_of(up, t, timer);
 	unsigned int iir, ier = 0, lsr;
 	unsigned long flags;
 
diff --git a/drivers/tty/serial/altera_uart.c b/drivers/tty/serial/altera_uart.c
index 011f38681131..837991dc4db9 100644
--- a/drivers/tty/serial/altera_uart.c
+++ b/drivers/tty/serial/altera_uart.c
@@ -275,7 +275,7 @@ static irqreturn_t altera_uart_interrupt(int irq, void *data)
 
 static void altera_uart_timer(struct timer_list *t)
 {
-	struct altera_uart *pp = from_timer(pp, t, tmr);
+	struct altera_uart *pp = timer_container_of(pp, t, tmr);
 	struct uart_port *port = &pp->port;
 
 	altera_uart_interrupt(0, port);
diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 11d65097578c..6b870db7230d 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -1046,7 +1046,7 @@ static inline void pl011_dma_rx_stop(struct uart_amba_port *uap)
  */
 static void pl011_dma_rx_poll(struct timer_list *t)
 {
-	struct uart_amba_port *uap = from_timer(uap, t, dmarx.timer);
+	struct uart_amba_port *uap = timer_container_of(uap, t, dmarx.timer);
 	struct tty_port *port = &uap->port.state->port;
 	struct pl011_dmarx_data *dmarx = &uap->dmarx;
 	struct dma_chan *rxchan = uap->dmarx.chan;
diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 18dba502144d..3b4fb5f8a1d1 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -1266,7 +1266,7 @@ static int atmel_prepare_rx_dma(struct uart_port *port)
 
 static void atmel_uart_timer_callback(struct timer_list *t)
 {
-	struct atmel_uart_port *atmel_port = from_timer(atmel_port, t,
+	struct atmel_uart_port *atmel_port = timer_container_of(atmel_port, t,
 							uart_timer);
 	struct uart_port *port = &atmel_port->uart;
 
diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index fe5aed99d55a..8243f9168f4c 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -1304,7 +1304,7 @@ static irqreturn_t lpuart32_int(int irq, void *dev_id)
  */
 static void lpuart_timer_func(struct timer_list *t)
 {
-	struct lpuart_port *sport = from_timer(sport, t, lpuart_timer);
+	struct lpuart_port *sport = timer_container_of(sport, t, lpuart_timer);
 	enum dma_status dmastat;
 	struct dma_chan *chan = sport->dma_rx_chan;
 	struct circ_buf *ring = &sport->rx_ring;
diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index e4b6f1bfdc95..bd02ee898f5d 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -1165,7 +1165,7 @@ static void imx_uart_break_ctl(struct uart_port *port, int break_state)
  */
 static void imx_uart_timeout(struct timer_list *t)
 {
-	struct imx_port *sport = from_timer(sport, t, timer);
+	struct imx_port *sport = timer_container_of(sport, t, timer);
 	unsigned long flags;
 
 	if (sport->port.state) {
diff --git a/drivers/tty/serial/liteuart.c b/drivers/tty/serial/liteuart.c
index 3a0960c97c77..6429e8f11f36 100644
--- a/drivers/tty/serial/liteuart.c
+++ b/drivers/tty/serial/liteuart.c
@@ -152,7 +152,7 @@ static irqreturn_t liteuart_interrupt(int irq, void *data)
 
 static void liteuart_timer(struct timer_list *t)
 {
-	struct liteuart_port *uart = from_timer(uart, t, timer);
+	struct liteuart_port *uart = timer_container_of(uart, t, timer);
 	struct uart_port *port = &uart->port;
 
 	liteuart_interrupt(0, port);
diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index f2dd83692b2c..52ab244c2515 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -308,7 +308,7 @@ static void max3100_dowork(struct max3100_port *s)
 
 static void max3100_timeout(struct timer_list *t)
 {
-	struct max3100_port *s = from_timer(s, t, timer);
+	struct max3100_port *s = timer_container_of(s, t, timer);
 
 	max3100_dowork(s);
 	mod_timer(&s->timer, jiffies + uart_poll_timeout(&s->port));
diff --git a/drivers/tty/serial/sa1100.c b/drivers/tty/serial/sa1100.c
index 8587ebbe1073..72b1bb76415c 100644
--- a/drivers/tty/serial/sa1100.c
+++ b/drivers/tty/serial/sa1100.c
@@ -111,7 +111,7 @@ static void sa1100_mctrl_check(struct sa1100_port *sport)
  */
 static void sa1100_timeout(struct timer_list *t)
 {
-	struct sa1100_port *sport = from_timer(sport, t, timer);
+	struct sa1100_port *sport = timer_container_of(sport, t, timer);
 	unsigned long flags;
 
 	if (sport->port.state) {
diff --git a/drivers/tty/serial/sccnxp.c b/drivers/tty/serial/sccnxp.c
index 553e3c1321ca..4ceca11ce600 100644
--- a/drivers/tty/serial/sccnxp.c
+++ b/drivers/tty/serial/sccnxp.c
@@ -500,7 +500,7 @@ static void sccnxp_handle_events(struct sccnxp_port *s)
 
 static void sccnxp_timer(struct timer_list *t)
 {
-	struct sccnxp_port *s = from_timer(s, t, timer);
+	struct sccnxp_port *s = timer_container_of(s, t, timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&s->lock, flags);
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 7e7813ccda41..791e59a4e4ea 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1161,7 +1161,7 @@ static int scif_rtrg_enabled(struct uart_port *port)
 
 static void rx_fifo_timer_fn(struct timer_list *t)
 {
-	struct sci_port *s = from_timer(s, t, rx_fifo_timer);
+	struct sci_port *s = timer_container_of(s, t, rx_fifo_timer);
 	struct uart_port *port = &s->port;
 
 	dev_dbg(port->dev, "Rx timed out\n");
diff --git a/drivers/tty/synclink_gt.c b/drivers/tty/synclink_gt.c
index 4c703f42680d..3865b10d2d43 100644
--- a/drivers/tty/synclink_gt.c
+++ b/drivers/tty/synclink_gt.c
@@ -5002,7 +5002,7 @@ static int adapter_test(struct slgt_info *info)
  */
 static void tx_timeout(struct timer_list *t)
 {
-	struct slgt_info *info = from_timer(info, t, tx_timer);
+	struct slgt_info *info = timer_container_of(info, t, tx_timer);
 	unsigned long flags;
 
 	DBGINFO(("%s tx_timeout\n", info->device_name));
@@ -5026,7 +5026,7 @@ static void tx_timeout(struct timer_list *t)
  */
 static void rx_timeout(struct timer_list *t)
 {
-	struct slgt_info *info = from_timer(info, t, rx_timer);
+	struct slgt_info *info = timer_container_of(info, t, rx_timer);
 	unsigned long flags;
 
 	DBGINFO(("%s rx_timeout\n", info->device_name));
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 6853c4660e7c..a52d77ca5314 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -712,7 +712,7 @@ static void sysrq_parse_reset_sequence(struct sysrq_state *state)
 
 static void sysrq_do_reset(struct timer_list *t)
 {
-	struct sysrq_state *state = from_timer(state, t, keyreset_timer);
+	struct sysrq_state *state = timer_container_of(state, t, keyreset_timer);
 
 	state->reset_requested = true;
 
diff --git a/drivers/tty/vcc.c b/drivers/tty/vcc.c
index 7ac3048377d5..2960031ace72 100644
--- a/drivers/tty/vcc.c
+++ b/drivers/tty/vcc.c
@@ -356,7 +356,7 @@ static int vcc_ldc_read(struct vcc_port *port)
 
 static void vcc_rx_timer(struct timer_list *t)
 {
-	struct vcc_port *port = from_timer(port, t, rx_timer);
+	struct vcc_port *port = timer_container_of(port, t, rx_timer);
 	struct vio_driver_state *vio;
 	unsigned long flags;
 	int rv;
@@ -382,7 +382,7 @@ static void vcc_rx_timer(struct timer_list *t)
 
 static void vcc_tx_timer(struct timer_list *t)
 {
-	struct vcc_port *port = from_timer(port, t, tx_timer);
+	struct vcc_port *port = timer_container_of(port, t, tx_timer);
 	struct vio_vcc *pkt;
 	unsigned long flags;
 	size_t tosend = 0;
diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index c6b9ad12e8fe..c23023465dfc 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -582,7 +582,7 @@ struct cxacru_timer {
 
 static void cxacru_timeout_kill(struct timer_list *t)
 {
-	struct cxacru_timer *timer = from_timer(timer, t, timer);
+	struct cxacru_timer *timer = timer_container_of(timer, t, timer);
 
 	usb_unlink_urb(timer->urb);
 }
diff --git a/drivers/usb/atm/speedtch.c b/drivers/usb/atm/speedtch.c
index 27e3d35ee7dd..2f379479d8c4 100644
--- a/drivers/usb/atm/speedtch.c
+++ b/drivers/usb/atm/speedtch.c
@@ -559,7 +559,7 @@ static void speedtch_check_status(struct work_struct *work)
 
 static void speedtch_status_poll(struct timer_list *t)
 {
-	struct speedtch_instance_data *instance = from_timer(instance, t,
+	struct speedtch_instance_data *instance = timer_container_of(instance, t,
 						             status_check_timer);
 
 	schedule_work(&instance->status_check_work);
@@ -573,7 +573,7 @@ static void speedtch_status_poll(struct timer_list *t)
 
 static void speedtch_resubmit_int(struct timer_list *t)
 {
-	struct speedtch_instance_data *instance = from_timer(instance, t,
+	struct speedtch_instance_data *instance = timer_container_of(instance, t,
 							     resubmit_timer);
 	struct urb *int_urb = instance->int_urb;
 	int ret;
diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index a6a05e85ef8c..5f3ad9a99d9e 100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -993,7 +993,7 @@ static int usbatm_heavy_init(struct usbatm_data *instance)
 
 static void usbatm_tasklet_schedule(struct timer_list *t)
 {
-	struct usbatm_channel *channel = from_timer(channel, t, delay);
+	struct usbatm_channel *channel = timer_container_of(channel, t, delay);
 
 	tasklet_schedule(&channel->tasklet);
 }
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index a63c793bac21..c22de97432a0 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -775,7 +775,7 @@ EXPORT_SYMBOL_GPL(usb_hcd_poll_rh_status);
 /* timer callback */
 static void rh_timer_func (struct timer_list *t)
 {
-	struct usb_hcd *_hcd = from_timer(_hcd, t, rh_timer);
+	struct usb_hcd *_hcd = timer_container_of(_hcd, t, rh_timer);
 
 	usb_hcd_poll_rh_status(_hcd);
 }
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 0e1dd6ef60a7..340c23509d07 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -697,7 +697,7 @@ static void hub_resubmit_irq_urb(struct usb_hub *hub)
 
 static void hub_retry_irq_urb(struct timer_list *t)
 {
-	struct usb_hub *hub = from_timer(hub, t, irq_urb_retry);
+	struct usb_hub *hub = timer_container_of(hub, t, irq_urb_retry);
 
 	hub_resubmit_irq_urb(hub);
 }
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 60ef8092259a..30eb8506617c 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -3227,7 +3227,7 @@ static void dwc2_conn_id_status_change(struct work_struct *work)
 
 static void dwc2_wakeup_detected(struct timer_list *t)
 {
-	struct dwc2_hsotg *hsotg = from_timer(hsotg, t, wkp_timer);
+	struct dwc2_hsotg *hsotg = timer_container_of(hsotg, t, wkp_timer);
 	u32 hprt0;
 
 	dev_dbg(hsotg->dev, "%s()\n", __func__);
diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index b0098792dd22..904fe0632b34 100644
--- a/drivers/usb/dwc2/hcd_queue.c
+++ b/drivers/usb/dwc2/hcd_queue.c
@@ -1215,7 +1215,7 @@ static void dwc2_do_unreserve(struct dwc2_hsotg *hsotg, struct dwc2_qh *qh)
  */
 static void dwc2_unreserve_timer_fn(struct timer_list *t)
 {
-	struct dwc2_qh *qh = from_timer(qh, t, unreserve_timer);
+	struct dwc2_qh *qh = timer_container_of(qh, t, unreserve_timer);
 	struct dwc2_hsotg *hsotg = qh->hsotg;
 	unsigned long flags;
 
diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index aa4c61094dc6..42b94d858e37 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -1541,7 +1541,7 @@ static void at91_vbus_timer_work(struct work_struct *work)
 
 static void at91_vbus_timer(struct timer_list *t)
 {
-	struct at91_udc *udc = from_timer(udc, t, vbus_timer);
+	struct at91_udc *udc = timer_container_of(udc, t, vbus_timer);
 
 	/*
 	 * If we are polling vbus it is likely that the gpio is on an
diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 4f1b5db51dda..59e0e4f551dd 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1787,7 +1787,7 @@ static int handle_control_request(struct dummy_hcd *dum_hcd, struct urb *urb,
  */
 static enum hrtimer_restart dummy_timer(struct hrtimer *t)
 {
-	struct dummy_hcd	*dum_hcd = from_timer(dum_hcd, t, timer);
+	struct dummy_hcd	*dum_hcd = timer_container_of(dum_hcd, t, timer);
 	struct dummy		*dum = dum_hcd->dum;
 	struct urbp		*urbp, *tmp;
 	unsigned long		flags;
diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index a938b2af0944..715791737499 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1261,7 +1261,7 @@ static irqreturn_t m66592_irq(int irq, void *_m66592)
 
 static void m66592_timer(struct timer_list *t)
 {
-	struct m66592 *m66592 = from_timer(m66592, t, timer);
+	struct m66592 *m66592 = timer_container_of(m66592, t, timer);
 	unsigned long flags;
 	u16 tmp;
 
diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index c93ea210c17c..062bf2b57d2e 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -1860,7 +1860,7 @@ static irqreturn_t omap_udc_irq(int irq, void *_udc)
 
 static void pio_out_timer(struct timer_list *t)
 {
-	struct omap_ep	*ep = from_timer(ep, t, timer);
+	struct omap_ep	*ep = timer_container_of(ep, t, timer);
 	unsigned long	flags;
 	u16		stat_flg;
 
diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index 24eb1ae78e45..f5d09a91e554 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -1574,7 +1574,7 @@ static inline void clear_ep_state (struct pxa25x_udc *dev)
 
 static void udc_watchdog(struct timer_list *t)
 {
-	struct pxa25x_udc	*dev = from_timer(dev, t, timer);
+	struct pxa25x_udc	*dev = timer_container_of(dev, t, timer);
 
 	local_irq_disable();
 	if (dev->ep0state == EP0_STALL
diff --git a/drivers/usb/gadget/udc/r8a66597-udc.c b/drivers/usb/gadget/udc/r8a66597-udc.c
index 6c1d15b2250c..e5c2630e3711 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.c
+++ b/drivers/usb/gadget/udc/r8a66597-udc.c
@@ -1516,7 +1516,7 @@ static irqreturn_t r8a66597_irq(int irq, void *_r8a66597)
 
 static void r8a66597_timer(struct timer_list *t)
 {
-	struct r8a66597 *r8a66597 = from_timer(r8a66597, t, timer);
+	struct r8a66597 *r8a66597 = timer_container_of(r8a66597, t, timer);
 	unsigned long flags;
 	u16 tmp;
 
diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index 150d2542cef0..4f69c7231515 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -198,7 +198,7 @@ static void quirk_poll_work(struct work_struct *work)
 
 static void quirk_poll_timer(struct timer_list *t)
 {
-	struct ehci_platform_priv *priv = from_timer(priv, t, poll_timer);
+	struct ehci_platform_priv *priv = timer_container_of(priv, t, poll_timer);
 	struct ehci_hcd *ehci = container_of((void *)priv, struct ehci_hcd,
 					     priv);
 
diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index c7784bf8101d..5c662f8e7896 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -746,7 +746,7 @@ static int ohci_start(struct usb_hcd *hcd)
  */
 static void io_watchdog_func(struct timer_list *t)
 {
-	struct ohci_hcd	*ohci = from_timer(ohci, t, io_watchdog);
+	struct ohci_hcd	*ohci = timer_container_of(ohci, t, io_watchdog);
 	bool		takeback_all_pending = false;
 	u32		status;
 	u32		head;
diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index d75b1b9b4db0..6b7c73eff081 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -2955,7 +2955,7 @@ static irqreturn_t oxu_irq(struct usb_hcd *hcd)
 
 static void oxu_watchdog(struct timer_list *t)
 {
-	struct oxu_hcd	*oxu = from_timer(oxu, t, watchdog);
+	struct oxu_hcd	*oxu = timer_container_of(oxu, t, watchdog);
 	unsigned long flags;
 
 	spin_lock_irqsave(&oxu->lock, flags);
diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index 67e472116d11..8b71f45ef985 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -1720,7 +1720,7 @@ static void r8a66597_root_hub_control(struct r8a66597 *r8a66597, int port)
 
 static void r8a66597_interval_timer(struct timer_list *t)
 {
-	struct r8a66597_timers *timers = from_timer(timers, t, interval);
+	struct r8a66597_timers *timers = timer_container_of(timers, t, interval);
 	struct r8a66597 *r8a66597 = timers->r8a66597;
 	unsigned long flags;
 	u16 pipenum;
@@ -1744,7 +1744,7 @@ static void r8a66597_interval_timer(struct timer_list *t)
 
 static void r8a66597_td_timer(struct timer_list *t)
 {
-	struct r8a66597_timers *timers = from_timer(timers, t, td);
+	struct r8a66597_timers *timers = timer_container_of(timers, t, td);
 	struct r8a66597 *r8a66597 = timers->r8a66597;
 	unsigned long flags;
 	u16 pipenum;
@@ -1798,7 +1798,7 @@ static void r8a66597_td_timer(struct timer_list *t)
 
 static void r8a66597_timer(struct timer_list *t)
 {
-	struct r8a66597 *r8a66597 = from_timer(r8a66597, t, rh_timer);
+	struct r8a66597 *r8a66597 = timer_container_of(r8a66597, t, rh_timer);
 	unsigned long flags;
 	int port;
 
diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index 718b1b7fe366..ea3cab99c5d4 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1124,7 +1124,7 @@ sl811h_hub_descriptor (
 static void
 sl811h_timer(struct timer_list *t)
 {
-	struct sl811 	*sl811 = from_timer(sl811, t, timer);
+	struct sl811 	*sl811 = timer_container_of(sl811, t, timer);
 	unsigned long	flags;
 	u8		irqstat;
 	u8		signaling = sl811->ctrl1 & SL11H_CTL1MASK_FORCE;
diff --git a/drivers/usb/host/uhci-q.c b/drivers/usb/host/uhci-q.c
index 45a8256a665f..9480d4ff0111 100644
--- a/drivers/usb/host/uhci-q.c
+++ b/drivers/usb/host/uhci-q.c
@@ -91,7 +91,7 @@ static void uhci_urbp_wants_fsbr(struct uhci_hcd *uhci, struct urb_priv *urbp)
 
 static void uhci_fsbr_timeout(struct timer_list *t)
 {
-	struct uhci_hcd *uhci = from_timer(uhci, t, fsbr_timer);
+	struct uhci_hcd *uhci = timer_container_of(uhci, t, fsbr_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&uhci->lock, flags);
diff --git a/drivers/usb/host/xen-hcd.c b/drivers/usb/host/xen-hcd.c
index 05943f2213e4..1c2a95fe41e5 100644
--- a/drivers/usb/host/xen-hcd.c
+++ b/drivers/usb/host/xen-hcd.c
@@ -1258,7 +1258,7 @@ static void xenhcd_disconnect(struct xenbus_device *dev)
 
 static void xenhcd_watchdog(struct timer_list *timer)
 {
-	struct xenhcd_info *info = from_timer(info, timer, watchdog);
+	struct xenhcd_info *info = timer_container_of(info, timer, watchdog);
 	unsigned long flags;
 
 	spin_lock_irqsave(&info->lock, flags);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0452b8d65832..0244d2854372 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -373,7 +373,7 @@ static void compliance_mode_recovery(struct timer_list *t)
 	u32 temp;
 	int i;
 
-	xhci = from_timer(xhci, t, comp_mode_recovery_timer);
+	xhci = timer_container_of(xhci, t, comp_mode_recovery_timer);
 	rhub = &xhci->usb3_rhub;
 	hcd = rhub->hcd;
 
diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
index 2af89ee28baa..65ac91d0595a 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -1423,7 +1423,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
 
 static void isp1760_udc_vbus_poll(struct timer_list *t)
 {
-	struct isp1760_udc *udc = from_timer(udc, t, vbus_timer);
+	struct isp1760_udc *udc = timer_container_of(udc, t, vbus_timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&udc->lock, flags);
diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 853a5f082a70..63dba8e344f7 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -592,7 +592,7 @@ struct sg_timeout {
 
 static void sg_timeout(struct timer_list *t)
 {
-	struct sg_timeout *timeout = from_timer(timeout, t, timer);
+	struct sg_timeout *timeout = timer_container_of(timeout, t, timer);
 
 	usb_sg_cancel(timeout->req);
 }
diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index eebb24ab3ec8..65ab223a2939 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -123,7 +123,7 @@ static void da8xx_musb_set_vbus(struct musb *musb, int is_on)
 
 static void otg_timer(struct timer_list *t)
 {
-	struct musb		*musb = from_timer(musb, t, dev_timer);
+	struct musb		*musb = timer_container_of(musb, t, dev_timer);
 	void __iomem		*mregs = musb->mregs;
 	u8			devctl;
 	unsigned long		flags;
diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 020348a98514..3e96893bba4a 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -91,7 +91,7 @@ static void mpfs_musb_set_vbus(struct musb *musb, int is_on)
 
 static void otg_timer(struct timer_list *t)
 {
-	struct musb		*musb = from_timer(musb, t, dev_timer);
+	struct musb		*musb = timer_container_of(musb, t, dev_timer);
 	void __iomem		*mregs = musb->mregs;
 	u8			devctl;
 	unsigned long		flags;
diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index cbbb27178024..c7234b236971 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -596,7 +596,7 @@ void musb_load_testpacket(struct musb *musb)
  */
 static void musb_otg_timer_func(struct timer_list *t)
 {
-	struct musb	*musb = from_timer(musb, t, otg_timer);
+	struct musb	*musb = timer_container_of(musb, t, otg_timer);
 	unsigned long	flags;
 
 	spin_lock_irqsave(&musb->lock, flags);
diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index e5e813f97fac..12f587ab8511 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -278,7 +278,7 @@ static int dsps_check_status(struct musb *musb, void *unused)
 
 static void otg_timer(struct timer_list *t)
 {
-	struct musb *musb = from_timer(musb, t, dev_timer);
+	struct musb *musb = timer_container_of(musb, t, dev_timer);
 	struct device *dev = musb->controller;
 	unsigned long flags;
 	int err;
diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index abd2472da7f7..1d9571f24a56 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -457,7 +457,7 @@ static int tusb_musb_vbus_status(struct musb *musb)
 
 static void musb_do_idle(struct timer_list *t)
 {
-	struct musb	*musb = from_timer(musb, t, dev_timer);
+	struct musb	*musb = timer_container_of(musb, t, dev_timer);
 	unsigned long	flags;
 
 	spin_lock_irqsave(&musb->lock, flags);
diff --git a/drivers/usb/phy/phy-mv-usb.c b/drivers/usb/phy/phy-mv-usb.c
index 638fba58420c..24b8ea50fb86 100644
--- a/drivers/usb/phy/phy-mv-usb.c
+++ b/drivers/usb/phy/phy-mv-usb.c
@@ -87,7 +87,7 @@ static void mv_otg_run_state_machine(struct mv_otg *mvotg,
 
 static void mv_otg_timer_await_bcon(struct timer_list *t)
 {
-	struct mv_otg *mvotg = from_timer(mvotg, t,
+	struct mv_otg *mvotg = timer_container_of(mvotg, t,
 					  otg_ctrl.timer[A_WAIT_BCON_TIMER]);
 
 	mvotg->otg_ctrl.a_wait_bcon_timeout = 1;
diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index b97ba8ed6801..bd73857ab46f 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -1357,7 +1357,7 @@ static void garmin_unthrottle(struct tty_struct *tty)
  */
 static void timeout_handler(struct timer_list *t)
 {
-	struct garmin_data *garmin_data_p = from_timer(garmin_data_p, t, timer);
+	struct garmin_data *garmin_data_p = timer_container_of(garmin_data_p, t, timer);
 
 	/* send the next queued packet to the tty port */
 	if (garmin_data_p->mode == MODE_NATIVE)
diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 93710b762893..9e9aca271c0a 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -383,7 +383,7 @@ static void mos7840_set_led_sync(struct usb_serial_port *port, __u16 reg,
 
 static void mos7840_led_off(struct timer_list *t)
 {
-	struct moschip_port *mcs = from_timer(mcs, t, led_timer1);
+	struct moschip_port *mcs = timer_container_of(mcs, t, led_timer1);
 
 	/* Turn off LED */
 	mos7840_set_led_async(mcs, 0x0300, MODEM_CONTROL_REGISTER);
@@ -393,7 +393,7 @@ static void mos7840_led_off(struct timer_list *t)
 
 static void mos7840_led_flag_off(struct timer_list *t)
 {
-	struct moschip_port *mcs = from_timer(mcs, t, led_timer2);
+	struct moschip_port *mcs = timer_container_of(mcs, t, led_timer2);
 
 	clear_bit_unlock(MOS7840_FLAG_LED_BUSY, &mcs->flags);
 }
diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
index b387863c245f..3075097f33bc 100644
--- a/drivers/usb/storage/realtek_cr.c
+++ b/drivers/usb/storage/realtek_cr.c
@@ -754,7 +754,7 @@ static void rts51x_modi_suspend_timer(struct rts51x_chip *chip)
 
 static void rts51x_suspend_timer_fn(struct timer_list *t)
 {
-	struct rts51x_chip *chip = from_timer(chip, t, rts51x_suspend_timer);
+	struct rts51x_chip *chip = timer_container_of(chip, t, rts51x_suspend_timer);
 	struct us_data *us = chip->us;
 
 	switch (rts51x_get_stat(chip)) {
diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc_transfer.c
index 7e801fee33bf..a4f02ea3e3ef 100644
--- a/drivers/usb/usbip/vudc_transfer.c
+++ b/drivers/usb/usbip/vudc_transfer.c
@@ -301,7 +301,7 @@ static int transfer(struct vudc *udc,
 
 static void v_timer(struct timer_list *t)
 {
-	struct vudc *udc = from_timer(udc, t, tr_timer.timer);
+	struct vudc *udc = timer_container_of(udc, t, tr_timer.timer);
 	struct transfer_timer *timer = &udc->tr_timer;
 	struct urbp *urb_p, *tmp;
 	unsigned long flags;
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index c6c4753f6415..0eef8c6b98c8 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -1443,7 +1443,7 @@ static void radeon_write_pll_regs(struct radeonfb_info *rinfo, struct radeon_reg
  */
 static void radeon_lvds_timer_func(struct timer_list *t)
 {
-	struct radeonfb_info *rinfo = from_timer(rinfo, t, lvds_timer);
+	struct radeonfb_info *rinfo = timer_container_of(rinfo, t, lvds_timer);
 
 	radeon_engine_idle();
 
diff --git a/drivers/virt/vboxguest/vboxguest_core.c b/drivers/virt/vboxguest/vboxguest_core.c
index f1674f3ed923..b177a534b6a4 100644
--- a/drivers/virt/vboxguest/vboxguest_core.c
+++ b/drivers/virt/vboxguest/vboxguest_core.c
@@ -419,7 +419,7 @@ static void vbg_balloon_work(struct work_struct *work)
  */
 static void vbg_heartbeat_timer(struct timer_list *t)
 {
-	struct vbg_dev *gdev = from_timer(gdev, t, heartbeat_timer);
+	struct vbg_dev *gdev = timer_container_of(gdev, t, heartbeat_timer);
 
 	vbg_req_perform(gdev, gdev->guest_heartbeat_req);
 	mod_timer(&gdev->heartbeat_timer,
diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
index 1b47a2fc7d17..aba66b8e9d03 100644
--- a/drivers/watchdog/at91sam9_wdt.c
+++ b/drivers/watchdog/at91sam9_wdt.c
@@ -119,7 +119,7 @@ static inline void at91_wdt_reset(struct at91wdt *wdt)
  */
 static void at91_ping(struct timer_list *t)
 {
-	struct at91wdt *wdt = from_timer(wdt, t, timer);
+	struct at91wdt *wdt = timer_container_of(wdt, t, timer);
 	if (time_before(jiffies, wdt->next_heartbeat) ||
 	    !watchdog_active(&wdt->wdd)) {
 		at91_wdt_reset(wdt);
diff --git a/drivers/watchdog/bcm47xx_wdt.c b/drivers/watchdog/bcm47xx_wdt.c
index 4c0951307421..e13ec0975bef 100644
--- a/drivers/watchdog/bcm47xx_wdt.c
+++ b/drivers/watchdog/bcm47xx_wdt.c
@@ -105,7 +105,7 @@ static const struct watchdog_ops bcm47xx_wdt_hard_ops = {
 
 static void bcm47xx_wdt_soft_timer_tick(struct timer_list *t)
 {
-	struct bcm47xx_wdt *wdt = from_timer(wdt, t, soft_timer);
+	struct bcm47xx_wdt *wdt = timer_container_of(wdt, t, soft_timer);
 	u32 next_tick = min(wdt->wdd.timeout * 1000, wdt->max_timer_ms);
 
 	if (!atomic_dec_and_test(&wdt->soft_ticks)) {
diff --git a/drivers/watchdog/lpc18xx_wdt.c b/drivers/watchdog/lpc18xx_wdt.c
index 28e3fc0df4c6..f89739e4627b 100644
--- a/drivers/watchdog/lpc18xx_wdt.c
+++ b/drivers/watchdog/lpc18xx_wdt.c
@@ -77,7 +77,7 @@ static int lpc18xx_wdt_feed(struct watchdog_device *wdt_dev)
 
 static void lpc18xx_wdt_timer_feed(struct timer_list *t)
 {
-	struct lpc18xx_wdt_dev *lpc18xx_wdt = from_timer(lpc18xx_wdt, t, timer);
+	struct lpc18xx_wdt_dev *lpc18xx_wdt = timer_container_of(lpc18xx_wdt, t, timer);
 	struct watchdog_device *wdt_dev = &lpc18xx_wdt->wdt_dev;
 
 	lpc18xx_wdt_feed(wdt_dev);
diff --git a/drivers/watchdog/shwdt.c b/drivers/watchdog/shwdt.c
index 95af9ad94d16..719f100aae60 100644
--- a/drivers/watchdog/shwdt.c
+++ b/drivers/watchdog/shwdt.c
@@ -173,7 +173,7 @@ static int sh_wdt_set_heartbeat(struct watchdog_device *wdt_dev, unsigned t)
 
 static void sh_wdt_ping(struct timer_list *t)
 {
-	struct sh_wdt *wdt = from_timer(wdt, t, timer);
+	struct sh_wdt *wdt = timer_container_of(wdt, t, timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&wdt->lock, flags);
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index e01d5f29f4d2..6dd3a524cd35 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -509,7 +509,7 @@ static void add_scan(struct dlm_ls *ls, struct dlm_rsb *r)
 
 void dlm_rsb_scan(struct timer_list *timer)
 {
-	struct dlm_ls *ls = from_timer(ls, timer, ls_scan_timer);
+	struct dlm_ls *ls = timer_container_of(ls, timer, ls_scan_timer);
 	int our_nodeid = dlm_our_nodeid();
 	struct dlm_rsb *r;
 	int rv;
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 181934499624..c16419e8f5ef 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -3632,7 +3632,7 @@ int ext4_feature_set_ok(struct super_block *sb, int readonly)
  */
 static void print_daily_error_info(struct timer_list *t)
 {
-	struct ext4_sb_info *sbi = from_timer(sbi, t, s_err_report);
+	struct ext4_sb_info *sbi = timer_container_of(sbi, t, s_err_report);
 	struct super_block *sb = sbi->s_sb;
 	struct ext4_super_block *es = sbi->s_es;
 
diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
index 743a1d7633cd..f64549c5e0cb 100644
--- a/fs/jbd2/journal.c
+++ b/fs/jbd2/journal.c
@@ -134,7 +134,7 @@ static __be32 jbd2_superblock_csum(journal_t *j, journal_superblock_t *sb)
 
 static void commit_timeout(struct timer_list *t)
 {
-	journal_t *journal = from_timer(journal, t, j_commit_timer);
+	journal_t *journal = timer_container_of(journal, t, j_commit_timer);
 
 	wake_up_process(journal->j_task);
 }
diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 83970d97840b..34a075155965 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -2501,7 +2501,7 @@ static int nilfs_segctor_construct(struct nilfs_sc_info *sci, int mode)
 
 static void nilfs_construction_timeout(struct timer_list *t)
 {
-	struct nilfs_sc_info *sci = from_timer(sci, t, sc_timer);
+	struct nilfs_sc_info *sci = timer_container_of(sci, t, sc_timer);
 
 	wake_up_process(sci->sc_task);
 }
diff --git a/fs/ocfs2/cluster/tcp.c b/fs/ocfs2/cluster/tcp.c
index fce9beb214f0..8247d34994a9 100644
--- a/fs/ocfs2/cluster/tcp.c
+++ b/fs/ocfs2/cluster/tcp.c
@@ -1488,7 +1488,7 @@ static void o2net_sc_send_keep_req(struct work_struct *work)
  * where shutdown is going to be involved */
 static void o2net_idle_timer(struct timer_list *t)
 {
-	struct o2net_sock_container *sc = from_timer(sc, t, sc_idle_timeout);
+	struct o2net_sock_container *sc = timer_container_of(sc, t, sc_idle_timeout);
 	struct o2net_node *nn = o2net_nn_from_num(sc->sc_node->nd_num);
 #ifdef CONFIG_DEBUG_FS
 	unsigned long msecs = ktime_to_ms(ktime_get()) -
diff --git a/include/linux/timer.h b/include/linux/timer.h
index 5944cfb196c5..c39a0df72407 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -129,7 +129,7 @@ extern void destroy_timer_on_stack(struct timer_list *timer);
 static inline void destroy_timer_on_stack(struct timer_list *timer) { }
 #endif
 
-#define from_timer(var, callback_timer, timer_fieldname) \
+#define timer_container_of(var, callback_timer, timer_fieldname) \
 	container_of(callback_timer, typeof(*var), timer_fieldname)
 
 /**
diff --git a/kernel/kthread.c b/kernel/kthread.c
index 77c44924cf54..07370e74ebf1 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -1207,7 +1207,7 @@ EXPORT_SYMBOL_GPL(kthread_queue_work);
  */
 void kthread_delayed_work_timer_fn(struct timer_list *t)
 {
-	struct kthread_delayed_work *dwork = from_timer(dwork, t, timer);
+	struct kthread_delayed_work *dwork = timer_container_of(dwork, t, timer);
 	struct kthread_work *work = &dwork->work;
 	struct kthread_worker *worker = work->worker;
 	unsigned long flags;
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index c0cc7ae41106..7982183ef279 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -316,7 +316,7 @@ static void call_rcu_tasks_generic_timer(struct timer_list *tlp)
 	unsigned long flags;
 	bool needwake = false;
 	struct rcu_tasks *rtp;
-	struct rcu_tasks_percpu *rtpcp = from_timer(rtpcp, tlp, lazy_timer);
+	struct rcu_tasks_percpu *rtpcp = timer_container_of(rtpcp, tlp, lazy_timer);
 
 	rtp = rtpcp->rtpp;
 	raw_spin_lock_irqsave_rcu_node(rtpcp, flags);
diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
index fa269d34167a..3fffd29e1f99 100644
--- a/kernel/rcu/tree_nocb.h
+++ b/kernel/rcu/tree_nocb.h
@@ -991,7 +991,7 @@ static bool do_nocb_deferred_wakeup_common(struct rcu_data *rdp_gp,
 static void do_nocb_deferred_wakeup_timer(struct timer_list *t)
 {
 	unsigned long flags;
-	struct rcu_data *rdp = from_timer(rdp, t, nocb_timer);
+	struct rcu_data *rdp = timer_container_of(rdp, t, nocb_timer);
 
 	WARN_ON_ONCE(rdp->nocb_gp_rdp != rdp);
 	trace_rcu_nocb_wake(rcu_state.name, rdp->cpu, TPS("Timer"));
diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 1396674fa722..ad04a5c3162a 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -733,7 +733,7 @@ static int psi_rtpoll_worker(void *data)
 
 static void poll_timer_fn(struct timer_list *t)
 {
-	struct psi_group *group = from_timer(group, t, rtpoll_timer);
+	struct psi_group *group = timer_container_of(group, t, rtpoll_timer);
 
 	atomic_set(&group->rtpoll_wakeup, 1);
 	wake_up_interruptible(&group->rtpoll_wait);
diff --git a/kernel/time/sleep_timeout.c b/kernel/time/sleep_timeout.c
index bd30d354f558..4873eceb85ce 100644
--- a/kernel/time/sleep_timeout.c
+++ b/kernel/time/sleep_timeout.c
@@ -22,7 +22,7 @@ struct process_timer {
 
 static void process_timeout(struct timer_list *t)
 {
-	struct process_timer *timeout = from_timer(timeout, t, timer);
+	struct process_timer *timeout = timer_container_of(timeout, t, timer);
 
 	wake_up_process(timeout->task);
 }
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index b0e53d3e56c7..5eb43f2d213b 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2481,7 +2481,7 @@ EXPORT_SYMBOL_GPL(queue_work_node);
 
 void delayed_work_timer_fn(struct timer_list *t)
 {
-	struct delayed_work *dwork = from_timer(dwork, t, timer);
+	struct delayed_work *dwork = timer_container_of(dwork, t, timer);
 
 	/* should have been called from irqsafe timer with irq already off */
 	__queue_work(dwork->cpu, dwork->wq, &dwork->work);
@@ -2909,7 +2909,7 @@ static void set_worker_dying(struct worker *worker, struct list_head *list)
  */
 static void idle_worker_timeout(struct timer_list *t)
 {
-	struct worker_pool *pool = from_timer(pool, t, idle_timer);
+	struct worker_pool *pool = timer_container_of(pool, t, idle_timer);
 	bool do_cull = false;
 
 	if (work_pending(&pool->idle_cull_work))
@@ -3008,7 +3008,7 @@ static void send_mayday(struct work_struct *work)
 
 static void pool_mayday_timeout(struct timer_list *t)
 {
-	struct worker_pool *pool = from_timer(pool, t, mayday_timer);
+	struct worker_pool *pool = timer_container_of(pool, t, mayday_timer);
 	struct work_struct *work;
 
 	raw_spin_lock_irq(&pool->lock);
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index c81624bc3969..96c12e7cf77e 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -607,7 +607,7 @@ EXPORT_SYMBOL_GPL(wb_writeout_inc);
  */
 static void writeout_period(struct timer_list *t)
 {
-	struct wb_domain *dom = from_timer(dom, t, period_timer);
+	struct wb_domain *dom = timer_container_of(dom, t, period_timer);
 	int miss_periods = (jiffies - dom->period_time) /
 						 VM_COMPLETIONS_PERIOD_LEN;
 
@@ -2202,7 +2202,7 @@ static int dirty_writeback_centisecs_handler(const struct ctl_table *table, int
 void laptop_mode_timer_fn(struct timer_list *t)
 {
 	struct backing_dev_info *backing_dev_info =
-		from_timer(backing_dev_info, t, laptop_mode_wb_timer);
+		timer_container_of(backing_dev_info, t, laptop_mode_wb_timer);
 
 	wakeup_flusher_threads_bdi(backing_dev_info, WB_REASON_LAPTOP_TIMER);
 }
diff --git a/net/802/garp.c b/net/802/garp.c
index 27f0ab146026..2d1ffc4d9462 100644
--- a/net/802/garp.c
+++ b/net/802/garp.c
@@ -414,7 +414,7 @@ static void garp_join_timer_arm(struct garp_applicant *app)
 
 static void garp_join_timer(struct timer_list *t)
 {
-	struct garp_applicant *app = from_timer(app, t, join_timer);
+	struct garp_applicant *app = timer_container_of(app, t, join_timer);
 
 	spin_lock(&app->lock);
 	garp_gid_event(app, GARP_EVENT_TRANSMIT_PDU);
diff --git a/net/802/mrp.c b/net/802/mrp.c
index e0c96d0da8d5..23a88305f900 100644
--- a/net/802/mrp.c
+++ b/net/802/mrp.c
@@ -599,7 +599,7 @@ static void mrp_join_timer_arm(struct mrp_applicant *app)
 
 static void mrp_join_timer(struct timer_list *t)
 {
-	struct mrp_applicant *app = from_timer(app, t, join_timer);
+	struct mrp_applicant *app = timer_container_of(app, t, join_timer);
 
 	spin_lock(&app->lock);
 	mrp_mad_event(app, MRP_EVENT_TX);
@@ -621,7 +621,7 @@ static void mrp_periodic_timer_arm(struct mrp_applicant *app)
 
 static void mrp_periodic_timer(struct timer_list *t)
 {
-	struct mrp_applicant *app = from_timer(app, t, periodic_timer);
+	struct mrp_applicant *app = timer_container_of(app, t, periodic_timer);
 
 	spin_lock(&app->lock);
 	if (likely(app->active)) {
diff --git a/net/appletalk/ddp.c b/net/appletalk/ddp.c
index b068651984fe..73ea7e67f05a 100644
--- a/net/appletalk/ddp.c
+++ b/net/appletalk/ddp.c
@@ -169,7 +169,7 @@ static struct sock *atalk_find_or_insert_socket(struct sock *sk,
 
 static void atalk_destroy_timer(struct timer_list *t)
 {
-	struct sock *sk = from_timer(sk, t, sk_timer);
+	struct sock *sk = timer_container_of(sk, t, sk_timer);
 
 	if (sk_has_allocations(sk)) {
 		sk->sk_timer.expires = jiffies + SOCK_DESTROY_TIME;
diff --git a/net/atm/lec.c b/net/atm/lec.c
index ded2f0df2ee6..97c6a1b9ca89 100644
--- a/net/atm/lec.c
+++ b/net/atm/lec.c
@@ -1551,7 +1551,7 @@ static void lec_arp_expire_arp(struct timer_list *t)
 {
 	struct lec_arp_table *entry;
 
-	entry = from_timer(entry, t, timer);
+	entry = timer_container_of(entry, t, timer);
 
 	pr_debug("\n");
 	if (entry->status == ESI_ARP_PENDING) {
@@ -1572,7 +1572,7 @@ static void lec_arp_expire_arp(struct timer_list *t)
 static void lec_arp_expire_vcc(struct timer_list *t)
 {
 	unsigned long flags;
-	struct lec_arp_table *to_remove = from_timer(to_remove, t, timer);
+	struct lec_arp_table *to_remove = timer_container_of(to_remove, t, timer);
 	struct lec_priv *priv = to_remove->priv;
 
 	timer_delete(&to_remove->timer);
diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index b790bb92ed1c..6ef8b2a57a9b 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -287,7 +287,7 @@ void ax25_destroy_socket(ax25_cb *);
  */
 static void ax25_destroy_timer(struct timer_list *t)
 {
-	ax25_cb *ax25 = from_timer(ax25, t, dtimer);
+	ax25_cb *ax25 = timer_container_of(ax25, t, dtimer);
 	struct sock *sk;
 
 	sk=ax25->sk;
diff --git a/net/ax25/ax25_ds_timer.c b/net/ax25/ax25_ds_timer.c
index 8d9fba069001..0c9e7775aa54 100644
--- a/net/ax25/ax25_ds_timer.c
+++ b/net/ax25/ax25_ds_timer.c
@@ -64,7 +64,7 @@ void ax25_ds_set_timer(ax25_dev *ax25_dev)
 
 static void ax25_ds_timeout(struct timer_list *t)
 {
-	ax25_dev *ax25_dev = from_timer(ax25_dev, t, dama.slave_timer);
+	ax25_dev *ax25_dev = timer_container_of(ax25_dev, t, dama.slave_timer);
 	ax25_cb *ax25;
 
 	if (ax25_dev == NULL || !ax25_dev->dama.slave)
diff --git a/net/ax25/ax25_timer.c b/net/ax25/ax25_timer.c
index 3891a3923d6c..a69bfbc8b679 100644
--- a/net/ax25/ax25_timer.c
+++ b/net/ax25/ax25_timer.c
@@ -121,7 +121,7 @@ EXPORT_SYMBOL(ax25_display_timer);
 static void ax25_heartbeat_expiry(struct timer_list *t)
 {
 	int proto = AX25_PROTO_STD_SIMPLEX;
-	ax25_cb *ax25 = from_timer(ax25, t, timer);
+	ax25_cb *ax25 = timer_container_of(ax25, t, timer);
 
 	if (ax25->ax25_dev)
 		proto = ax25->ax25_dev->values[AX25_VALUES_PROTOCOL];
@@ -145,7 +145,7 @@ static void ax25_heartbeat_expiry(struct timer_list *t)
 
 static void ax25_t1timer_expiry(struct timer_list *t)
 {
-	ax25_cb *ax25 = from_timer(ax25, t, t1timer);
+	ax25_cb *ax25 = timer_container_of(ax25, t, t1timer);
 
 	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
 	case AX25_PROTO_STD_SIMPLEX:
@@ -164,7 +164,7 @@ static void ax25_t1timer_expiry(struct timer_list *t)
 
 static void ax25_t2timer_expiry(struct timer_list *t)
 {
-	ax25_cb *ax25 = from_timer(ax25, t, t2timer);
+	ax25_cb *ax25 = timer_container_of(ax25, t, t2timer);
 
 	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
 	case AX25_PROTO_STD_SIMPLEX:
@@ -183,7 +183,7 @@ static void ax25_t2timer_expiry(struct timer_list *t)
 
 static void ax25_t3timer_expiry(struct timer_list *t)
 {
-	ax25_cb *ax25 = from_timer(ax25, t, t3timer);
+	ax25_cb *ax25 = timer_container_of(ax25, t, t3timer);
 
 	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
 	case AX25_PROTO_STD_SIMPLEX:
@@ -204,7 +204,7 @@ static void ax25_t3timer_expiry(struct timer_list *t)
 
 static void ax25_idletimer_expiry(struct timer_list *t)
 {
-	ax25_cb *ax25 = from_timer(ax25, t, idletimer);
+	ax25_cb *ax25 = timer_container_of(ax25, t, idletimer);
 
 	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
 	case AX25_PROTO_STD_SIMPLEX:
diff --git a/net/batman-adv/tp_meter.c b/net/batman-adv/tp_meter.c
index adbadb436033..350b149e48be 100644
--- a/net/batman-adv/tp_meter.c
+++ b/net/batman-adv/tp_meter.c
@@ -485,7 +485,7 @@ static void batadv_tp_reset_sender_timer(struct batadv_tp_vars *tp_vars)
  */
 static void batadv_tp_sender_timeout(struct timer_list *t)
 {
-	struct batadv_tp_vars *tp_vars = from_timer(tp_vars, t, timer);
+	struct batadv_tp_vars *tp_vars = timer_container_of(tp_vars, t, timer);
 	struct batadv_priv *bat_priv = tp_vars->bat_priv;
 
 	if (atomic_read(&tp_vars->sending) == 0)
@@ -1101,7 +1101,7 @@ static void batadv_tp_reset_receiver_timer(struct batadv_tp_vars *tp_vars)
  */
 static void batadv_tp_receiver_shutdown(struct timer_list *t)
 {
-	struct batadv_tp_vars *tp_vars = from_timer(tp_vars, t, timer);
+	struct batadv_tp_vars *tp_vars = timer_container_of(tp_vars, t, timer);
 	struct batadv_tp_unacked *un, *safe;
 	struct batadv_priv *bat_priv;
 
diff --git a/net/bluetooth/hidp/core.c b/net/bluetooth/hidp/core.c
index fc5af8639b1e..6724adce615b 100644
--- a/net/bluetooth/hidp/core.c
+++ b/net/bluetooth/hidp/core.c
@@ -405,7 +405,7 @@ static int hidp_raw_request(struct hid_device *hid, unsigned char reportnum,
 
 static void hidp_idle_timeout(struct timer_list *t)
 {
-	struct hidp_session *session = from_timer(session, t, timer);
+	struct hidp_session *session = timer_container_of(session, t, timer);
 
 	/* The HIDP user-space API only contains calls to add and remove
 	 * devices. There is no way to forward events of any kind. Therefore,
diff --git a/net/bluetooth/rfcomm/core.c b/net/bluetooth/rfcomm/core.c
index 20ea7dba0a9a..3b8f39618d65 100644
--- a/net/bluetooth/rfcomm/core.c
+++ b/net/bluetooth/rfcomm/core.c
@@ -235,7 +235,7 @@ static int rfcomm_check_security(struct rfcomm_dlc *d)
 
 static void rfcomm_session_timeout(struct timer_list *t)
 {
-	struct rfcomm_session *s = from_timer(s, t, timer);
+	struct rfcomm_session *s = timer_container_of(s, t, timer);
 
 	BT_DBG("session %p state %ld", s, s->state);
 
@@ -260,7 +260,7 @@ static void rfcomm_session_clear_timer(struct rfcomm_session *s)
 /* ---- RFCOMM DLCs ---- */
 static void rfcomm_dlc_timeout(struct timer_list *t)
 {
-	struct rfcomm_dlc *d = from_timer(d, t, timer);
+	struct rfcomm_dlc *d = timer_container_of(d, t, timer);
 
 	BT_DBG("dlc %p state %ld", d, d->state);
 
diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index dcbf058de1e3..3e61a2798d63 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -648,7 +648,7 @@ static void br_multicast_del_mdb_entry(struct net_bridge_mdb_entry *mp)
 
 static void br_multicast_group_expired(struct timer_list *t)
 {
-	struct net_bridge_mdb_entry *mp = from_timer(mp, t, timer);
+	struct net_bridge_mdb_entry *mp = timer_container_of(mp, t, timer);
 	struct net_bridge *br = mp->br;
 
 	spin_lock(&br->multicast_lock);
@@ -856,7 +856,7 @@ static void br_multicast_find_del_pg(struct net_bridge *br,
 
 static void br_multicast_port_group_expired(struct timer_list *t)
 {
-	struct net_bridge_port_group *pg = from_timer(pg, t, timer);
+	struct net_bridge_port_group *pg = timer_container_of(pg, t, timer);
 	struct net_bridge_group_src *src_ent;
 	struct net_bridge *br = pg->key.port->br;
 	struct hlist_node *tmp;
@@ -1314,7 +1314,7 @@ struct net_bridge_mdb_entry *br_multicast_new_group(struct net_bridge *br,
 
 static void br_multicast_group_src_expired(struct timer_list *t)
 {
-	struct net_bridge_group_src *src = from_timer(src, t, timer);
+	struct net_bridge_group_src *src = timer_container_of(src, t, timer);
 	struct net_bridge_port_group *pg;
 	struct net_bridge *br = src->br;
 
@@ -1667,7 +1667,7 @@ static void br_multicast_router_expired(struct net_bridge_mcast_port *pmctx,
 
 static void br_ip4_multicast_router_expired(struct timer_list *t)
 {
-	struct net_bridge_mcast_port *pmctx = from_timer(pmctx, t,
+	struct net_bridge_mcast_port *pmctx = timer_container_of(pmctx, t,
 							 ip4_mc_router_timer);
 
 	br_multicast_router_expired(pmctx, t, &pmctx->ip4_rlist);
@@ -1676,7 +1676,7 @@ static void br_ip4_multicast_router_expired(struct timer_list *t)
 #if IS_ENABLED(CONFIG_IPV6)
 static void br_ip6_multicast_router_expired(struct timer_list *t)
 {
-	struct net_bridge_mcast_port *pmctx = from_timer(pmctx, t,
+	struct net_bridge_mcast_port *pmctx = timer_container_of(pmctx, t,
 							 ip6_mc_router_timer);
 
 	br_multicast_router_expired(pmctx, t, &pmctx->ip6_rlist);
@@ -1713,7 +1713,7 @@ static void br_multicast_local_router_expired(struct net_bridge_mcast *brmctx,
 
 static void br_ip4_multicast_local_router_expired(struct timer_list *t)
 {
-	struct net_bridge_mcast *brmctx = from_timer(brmctx, t,
+	struct net_bridge_mcast *brmctx = timer_container_of(brmctx, t,
 						     ip4_mc_router_timer);
 
 	br_multicast_local_router_expired(brmctx, t);
@@ -1722,7 +1722,7 @@ static void br_ip4_multicast_local_router_expired(struct timer_list *t)
 #if IS_ENABLED(CONFIG_IPV6)
 static void br_ip6_multicast_local_router_expired(struct timer_list *t)
 {
-	struct net_bridge_mcast *brmctx = from_timer(brmctx, t,
+	struct net_bridge_mcast *brmctx = timer_container_of(brmctx, t,
 						     ip6_mc_router_timer);
 
 	br_multicast_local_router_expired(brmctx, t);
@@ -1746,7 +1746,7 @@ static void br_multicast_querier_expired(struct net_bridge_mcast *brmctx,
 
 static void br_ip4_multicast_querier_expired(struct timer_list *t)
 {
-	struct net_bridge_mcast *brmctx = from_timer(brmctx, t,
+	struct net_bridge_mcast *brmctx = timer_container_of(brmctx, t,
 						     ip4_other_query.timer);
 
 	br_multicast_querier_expired(brmctx, &brmctx->ip4_own_query);
@@ -1755,7 +1755,7 @@ static void br_ip4_multicast_querier_expired(struct timer_list *t)
 #if IS_ENABLED(CONFIG_IPV6)
 static void br_ip6_multicast_querier_expired(struct timer_list *t)
 {
-	struct net_bridge_mcast *brmctx = from_timer(brmctx, t,
+	struct net_bridge_mcast *brmctx = timer_container_of(brmctx, t,
 						     ip6_other_query.timer);
 
 	br_multicast_querier_expired(brmctx, &brmctx->ip6_own_query);
@@ -1918,7 +1918,7 @@ br_multicast_port_query_expired(struct net_bridge_mcast_port *pmctx,
 
 static void br_ip4_multicast_port_query_expired(struct timer_list *t)
 {
-	struct net_bridge_mcast_port *pmctx = from_timer(pmctx, t,
+	struct net_bridge_mcast_port *pmctx = timer_container_of(pmctx, t,
 							 ip4_own_query.timer);
 
 	br_multicast_port_query_expired(pmctx, &pmctx->ip4_own_query);
@@ -1927,7 +1927,7 @@ static void br_ip4_multicast_port_query_expired(struct timer_list *t)
 #if IS_ENABLED(CONFIG_IPV6)
 static void br_ip6_multicast_port_query_expired(struct timer_list *t)
 {
-	struct net_bridge_mcast_port *pmctx = from_timer(pmctx, t,
+	struct net_bridge_mcast_port *pmctx = timer_container_of(pmctx, t,
 							 ip6_own_query.timer);
 
 	br_multicast_port_query_expired(pmctx, &pmctx->ip6_own_query);
@@ -1936,7 +1936,7 @@ static void br_ip6_multicast_port_query_expired(struct timer_list *t)
 
 static void br_multicast_port_group_rexmit(struct timer_list *t)
 {
-	struct net_bridge_port_group *pg = from_timer(pg, t, rexmit_timer);
+	struct net_bridge_port_group *pg = timer_container_of(pg, t, rexmit_timer);
 	struct bridge_mcast_other_query *other_query = NULL;
 	struct net_bridge *br = pg->key.port->br;
 	struct net_bridge_mcast_port *pmctx;
@@ -3995,7 +3995,7 @@ static void br_multicast_query_expired(struct net_bridge_mcast *brmctx,
 
 static void br_ip4_multicast_query_expired(struct timer_list *t)
 {
-	struct net_bridge_mcast *brmctx = from_timer(brmctx, t,
+	struct net_bridge_mcast *brmctx = timer_container_of(brmctx, t,
 						     ip4_own_query.timer);
 
 	br_multicast_query_expired(brmctx, &brmctx->ip4_own_query,
@@ -4005,7 +4005,7 @@ static void br_ip4_multicast_query_expired(struct timer_list *t)
 #if IS_ENABLED(CONFIG_IPV6)
 static void br_ip6_multicast_query_expired(struct timer_list *t)
 {
-	struct net_bridge_mcast *brmctx = from_timer(brmctx, t,
+	struct net_bridge_mcast *brmctx = timer_container_of(brmctx, t,
 						     ip6_own_query.timer);
 
 	br_multicast_query_expired(brmctx, &brmctx->ip6_own_query,
diff --git a/net/bridge/br_multicast_eht.c b/net/bridge/br_multicast_eht.c
index c126aa4e7551..46c117615f04 100644
--- a/net/bridge/br_multicast_eht.c
+++ b/net/bridge/br_multicast_eht.c
@@ -207,7 +207,7 @@ void br_multicast_eht_clean_sets(struct net_bridge_port_group *pg)
 
 static void br_multicast_eht_set_entry_expired(struct timer_list *t)
 {
-	struct net_bridge_group_eht_set_entry *set_h = from_timer(set_h, t, timer);
+	struct net_bridge_group_eht_set_entry *set_h = timer_container_of(set_h, t, timer);
 	struct net_bridge *br = set_h->br;
 
 	spin_lock(&br->multicast_lock);
@@ -223,7 +223,7 @@ static void br_multicast_eht_set_entry_expired(struct timer_list *t)
 
 static void br_multicast_eht_set_expired(struct timer_list *t)
 {
-	struct net_bridge_group_eht_set *eht_set = from_timer(eht_set, t,
+	struct net_bridge_group_eht_set *eht_set = timer_container_of(eht_set, t,
 							      timer);
 	struct net_bridge *br = eht_set->br;
 
diff --git a/net/bridge/br_stp_timer.c b/net/bridge/br_stp_timer.c
index 27bf1979b909..8e283779a4cc 100644
--- a/net/bridge/br_stp_timer.c
+++ b/net/bridge/br_stp_timer.c
@@ -29,7 +29,7 @@ static int br_is_designated_for_some_port(const struct net_bridge *br)
 
 static void br_hello_timer_expired(struct timer_list *t)
 {
-	struct net_bridge *br = from_timer(br, t, hello_timer);
+	struct net_bridge *br = timer_container_of(br, t, hello_timer);
 
 	br_debug(br, "hello timer expired\n");
 	spin_lock(&br->lock);
@@ -45,7 +45,7 @@ static void br_hello_timer_expired(struct timer_list *t)
 
 static void br_message_age_timer_expired(struct timer_list *t)
 {
-	struct net_bridge_port *p = from_timer(p, t, message_age_timer);
+	struct net_bridge_port *p = timer_container_of(p, t, message_age_timer);
 	struct net_bridge *br = p->br;
 	const bridge_id *id = &p->designated_bridge;
 	int was_root;
@@ -78,7 +78,7 @@ static void br_message_age_timer_expired(struct timer_list *t)
 
 static void br_forward_delay_timer_expired(struct timer_list *t)
 {
-	struct net_bridge_port *p = from_timer(p, t, forward_delay_timer);
+	struct net_bridge_port *p = timer_container_of(p, t, forward_delay_timer);
 	struct net_bridge *br = p->br;
 
 	br_debug(br, "port %u(%s) forward delay timer\n",
@@ -102,7 +102,7 @@ static void br_forward_delay_timer_expired(struct timer_list *t)
 
 static void br_tcn_timer_expired(struct timer_list *t)
 {
-	struct net_bridge *br = from_timer(br, t, tcn_timer);
+	struct net_bridge *br = timer_container_of(br, t, tcn_timer);
 
 	br_debug(br, "tcn timer expired\n");
 	spin_lock(&br->lock);
@@ -116,7 +116,7 @@ static void br_tcn_timer_expired(struct timer_list *t)
 
 static void br_topology_change_timer_expired(struct timer_list *t)
 {
-	struct net_bridge *br = from_timer(br, t, topology_change_timer);
+	struct net_bridge *br = timer_container_of(br, t, topology_change_timer);
 
 	br_debug(br, "topo change timer expired\n");
 	spin_lock(&br->lock);
@@ -127,7 +127,7 @@ static void br_topology_change_timer_expired(struct timer_list *t)
 
 static void br_hold_timer_expired(struct timer_list *t)
 {
-	struct net_bridge_port *p = from_timer(p, t, hold_timer);
+	struct net_bridge_port *p = timer_container_of(p, t, hold_timer);
 
 	br_debug(p->br, "port %u(%s) hold timer expired\n",
 		 (unsigned int) p->port_no, p->dev->name);
diff --git a/net/can/proc.c b/net/can/proc.c
index 25fdf060e30d..0938bf7dd646 100644
--- a/net/can/proc.c
+++ b/net/can/proc.c
@@ -114,7 +114,7 @@ static unsigned long calc_rate(unsigned long oldjif, unsigned long newjif,
 
 void can_stat_update(struct timer_list *t)
 {
-	struct net *net = from_timer(net, t, can.stattimer);
+	struct net *net = timer_container_of(net, t, can.stattimer);
 	struct can_pkg_stats *pkg_stats = net->can.pkg_stats;
 	unsigned long j = jiffies; /* snapshot */
 
diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
index 8a7ce640f74d..60d31c2feed3 100644
--- a/net/core/drop_monitor.c
+++ b/net/core/drop_monitor.c
@@ -208,7 +208,7 @@ static void send_dm_alert(struct work_struct *work)
  */
 static void sched_send_work(struct timer_list *t)
 {
-	struct per_cpu_dm_data *data = from_timer(data, t, send_timer);
+	struct per_cpu_dm_data *data = timer_container_of(data, t, send_timer);
 
 	schedule_work(&data->dm_alert_work);
 }
diff --git a/net/core/gen_estimator.c b/net/core/gen_estimator.c
index 2b821b9a8699..7d426a8e29f3 100644
--- a/net/core/gen_estimator.c
+++ b/net/core/gen_estimator.c
@@ -75,7 +75,7 @@ static void est_fetch_counters(struct net_rate_estimator *e,
 
 static void est_timer(struct timer_list *t)
 {
-	struct net_rate_estimator *est = from_timer(est, t, timer);
+	struct net_rate_estimator *est = timer_container_of(est, t, timer);
 	struct gnet_stats_basic_sync b;
 	u64 b_bytes, b_packets;
 	u64 rate, brate;
diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index a07249b59ae1..fed79161f41f 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -1031,7 +1031,7 @@ static void neigh_probe(struct neighbour *neigh)
 static void neigh_timer_handler(struct timer_list *t)
 {
 	unsigned long now, next;
-	struct neighbour *neigh = from_timer(neigh, t, timer);
+	struct neighbour *neigh = timer_container_of(neigh, t, timer);
 	unsigned int state;
 	int notify = 0;
 
@@ -1569,7 +1569,7 @@ static void neigh_managed_work(struct work_struct *work)
 
 static void neigh_proxy_process(struct timer_list *t)
 {
-	struct neigh_table *tbl = from_timer(tbl, t, proxy_timer);
+	struct neigh_table *tbl = timer_container_of(tbl, t, proxy_timer);
 	long sched_next = 0;
 	unsigned long now = jiffies;
 	struct sk_buff *skb, *n;
diff --git a/net/dccp/ccids/ccid2.c b/net/dccp/ccids/ccid2.c
index d6b30700af67..440eefa4ecc2 100644
--- a/net/dccp/ccids/ccid2.c
+++ b/net/dccp/ccids/ccid2.c
@@ -126,7 +126,7 @@ static void dccp_tasklet_schedule(struct sock *sk)
 
 static void ccid2_hc_tx_rto_expire(struct timer_list *t)
 {
-	struct ccid2_hc_tx_sock *hc = from_timer(hc, t, tx_rtotimer);
+	struct ccid2_hc_tx_sock *hc = timer_container_of(hc, t, tx_rtotimer);
 	struct sock *sk = hc->sk;
 	const bool sender_was_blocked = ccid2_cwnd_network_limited(hc);
 
diff --git a/net/dccp/ccids/ccid3.c b/net/dccp/ccids/ccid3.c
index f349d16dd8f6..758002fe63a7 100644
--- a/net/dccp/ccids/ccid3.c
+++ b/net/dccp/ccids/ccid3.c
@@ -188,7 +188,7 @@ static inline void ccid3_hc_tx_update_win_count(struct ccid3_hc_tx_sock *hc,
 
 static void ccid3_hc_tx_no_feedback_timer(struct timer_list *t)
 {
-	struct ccid3_hc_tx_sock *hc = from_timer(hc, t, tx_no_feedback_timer);
+	struct ccid3_hc_tx_sock *hc = timer_container_of(hc, t, tx_no_feedback_timer);
 	struct sock *sk = hc->sk;
 	unsigned long t_nfb = USEC_PER_SEC / 5;
 
diff --git a/net/dccp/timer.c b/net/dccp/timer.c
index 232ac4ae0a73..827eacf839a1 100644
--- a/net/dccp/timer.c
+++ b/net/dccp/timer.c
@@ -124,7 +124,7 @@ static void dccp_retransmit_timer(struct sock *sk)
 static void dccp_write_timer(struct timer_list *t)
 {
 	struct inet_connection_sock *icsk =
-			from_timer(icsk, t, icsk_retransmit_timer);
+			timer_container_of(icsk, t, icsk_retransmit_timer);
 	struct sock *sk = &icsk->icsk_inet.sk;
 	int event = 0;
 
@@ -160,7 +160,7 @@ static void dccp_write_timer(struct timer_list *t)
 
 static void dccp_keepalive_timer(struct timer_list *t)
 {
-	struct sock *sk = from_timer(sk, t, sk_timer);
+	struct sock *sk = timer_container_of(sk, t, sk_timer);
 
 	pr_err("dccp should not use a keepalive timer !\n");
 	sock_put(sk);
@@ -170,7 +170,7 @@ static void dccp_keepalive_timer(struct timer_list *t)
 static void dccp_delack_timer(struct timer_list *t)
 {
 	struct inet_connection_sock *icsk =
-			from_timer(icsk, t, icsk_delack_timer);
+			timer_container_of(icsk, t, icsk_delack_timer);
 	struct sock *sk = &icsk->icsk_inet.sk;
 
 	bh_lock_sock(sk);
@@ -235,7 +235,7 @@ static void dccp_write_xmitlet(struct tasklet_struct *t)
 
 static void dccp_write_xmit_timer(struct timer_list *t)
 {
-	struct dccp_sock *dp = from_timer(dp, t, dccps_xmit_timer);
+	struct dccp_sock *dp = timer_container_of(dp, t, dccps_xmit_timer);
 
 	dccp_write_xmitlet(&dp->dccps_xmitlet);
 }
diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index 1b1b700ec05e..523b60efd639 100644
--- a/net/hsr/hsr_device.c
+++ b/net/hsr/hsr_device.c
@@ -408,7 +408,7 @@ static void hsr_announce(struct timer_list *t)
 	struct hsr_port *master;
 	unsigned long interval;
 
-	hsr = from_timer(hsr, t, announce_timer);
+	hsr = timer_container_of(hsr, t, announce_timer);
 
 	rcu_read_lock();
 	master = hsr_port_get_hsr(hsr, HSR_PT_MASTER);
@@ -424,7 +424,7 @@ static void hsr_announce(struct timer_list *t)
  */
 static void hsr_proxy_announce(struct timer_list *t)
 {
-	struct hsr_priv *hsr = from_timer(hsr, t, announce_proxy_timer);
+	struct hsr_priv *hsr = timer_container_of(hsr, t, announce_proxy_timer);
 	struct hsr_port *interlink;
 	unsigned long interval = 0;
 	struct hsr_node *node;
diff --git a/net/hsr/hsr_framereg.c b/net/hsr/hsr_framereg.c
index 4ce471a2f387..3a2a2fa7a0a3 100644
--- a/net/hsr/hsr_framereg.c
+++ b/net/hsr/hsr_framereg.c
@@ -617,7 +617,7 @@ static struct hsr_port *get_late_port(struct hsr_priv *hsr,
  */
 void hsr_prune_nodes(struct timer_list *t)
 {
-	struct hsr_priv *hsr = from_timer(hsr, t, prune_timer);
+	struct hsr_priv *hsr = timer_container_of(hsr, t, prune_timer);
 	struct hsr_node *node;
 	struct hsr_node *tmp;
 	struct hsr_port *port;
@@ -685,7 +685,7 @@ void hsr_prune_nodes(struct timer_list *t)
 
 void hsr_prune_proxy_nodes(struct timer_list *t)
 {
-	struct hsr_priv *hsr = from_timer(hsr, t, prune_proxy_timer);
+	struct hsr_priv *hsr = timer_container_of(hsr, t, prune_proxy_timer);
 	unsigned long timestamp;
 	struct hsr_node *node;
 	struct hsr_node *tmp;
diff --git a/net/ieee802154/6lowpan/reassembly.c b/net/ieee802154/6lowpan/reassembly.c
index d4b983d17038..ddb6a5817d09 100644
--- a/net/ieee802154/6lowpan/reassembly.c
+++ b/net/ieee802154/6lowpan/reassembly.c
@@ -44,7 +44,7 @@ static void lowpan_frag_init(struct inet_frag_queue *q, const void *a)
 
 static void lowpan_frag_expire(struct timer_list *t)
 {
-	struct inet_frag_queue *frag = from_timer(frag, t, timer);
+	struct inet_frag_queue *frag = timer_container_of(frag, t, timer);
 	struct frag_queue *fq;
 	int refs = 1;
 
diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
index ca7d539b3846..d1769034b643 100644
--- a/net/ipv4/igmp.c
+++ b/net/ipv4/igmp.c
@@ -801,7 +801,7 @@ static int igmp_send_report(struct in_device *in_dev, struct ip_mc_list *pmc,
 
 static void igmp_gq_timer_expire(struct timer_list *t)
 {
-	struct in_device *in_dev = from_timer(in_dev, t, mr_gq_timer);
+	struct in_device *in_dev = timer_container_of(in_dev, t, mr_gq_timer);
 
 	in_dev->mr_gq_running = 0;
 	igmpv3_send_report(in_dev, NULL);
@@ -810,7 +810,7 @@ static void igmp_gq_timer_expire(struct timer_list *t)
 
 static void igmp_ifc_timer_expire(struct timer_list *t)
 {
-	struct in_device *in_dev = from_timer(in_dev, t, mr_ifc_timer);
+	struct in_device *in_dev = timer_container_of(in_dev, t, mr_ifc_timer);
 	u32 mr_ifc_count;
 
 	igmpv3_send_cr(in_dev);
@@ -840,7 +840,7 @@ static void igmp_ifc_event(struct in_device *in_dev)
 
 static void igmp_timer_expire(struct timer_list *t)
 {
-	struct ip_mc_list *im = from_timer(im, t, timer);
+	struct ip_mc_list *im = timer_container_of(im, t, timer);
 	struct in_device *in_dev = im->interface;
 
 	spin_lock(&im->lock);
diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index dd5cf8914a28..c437a1c2c6ac 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -1039,11 +1039,11 @@ static bool reqsk_queue_unlink(struct request_sock *req)
 
 static bool __inet_csk_reqsk_queue_drop(struct sock *sk,
 					struct request_sock *req,
-					bool from_timer)
+					bool timer_container_of)
 {
 	bool unlinked = reqsk_queue_unlink(req);
 
-	if (!from_timer && timer_delete_sync(&req->rsk_timer))
+	if (!timer_container_of && timer_delete_sync(&req->rsk_timer))
 		reqsk_put(req);
 
 	if (unlinked) {
@@ -1069,7 +1069,7 @@ EXPORT_SYMBOL(inet_csk_reqsk_queue_drop_and_put);
 
 static void reqsk_timer_handler(struct timer_list *t)
 {
-	struct request_sock *req = from_timer(req, t, rsk_timer);
+	struct request_sock *req = timer_container_of(req, t, rsk_timer);
 	struct request_sock *nreq = NULL, *oreq = req;
 	struct sock *sk_listener = req->rsk_listener;
 	struct inet_connection_sock *icsk;
diff --git a/net/ipv4/inet_timewait_sock.c b/net/ipv4/inet_timewait_sock.c
index aded4bf1bc16..2f75c2e73aac 100644
--- a/net/ipv4/inet_timewait_sock.c
+++ b/net/ipv4/inet_timewait_sock.c
@@ -170,7 +170,7 @@ EXPORT_SYMBOL_GPL(inet_twsk_hashdance_schedule);
 
 static void tw_timer_handler(struct timer_list *t)
 {
-	struct inet_timewait_sock *tw = from_timer(tw, t, tw_timer);
+	struct inet_timewait_sock *tw = timer_container_of(tw, t, tw_timer);
 
 	inet_twsk_kill(tw);
 }
diff --git a/net/ipv4/ip_fragment.c b/net/ipv4/ip_fragment.c
index 77f395b28ec7..64b3fb3208af 100644
--- a/net/ipv4/ip_fragment.c
+++ b/net/ipv4/ip_fragment.c
@@ -123,7 +123,7 @@ static bool frag_expire_skip_icmp(u32 user)
 static void ip_expire(struct timer_list *t)
 {
 	enum skb_drop_reason reason = SKB_DROP_REASON_FRAG_REASM_TIMEOUT;
-	struct inet_frag_queue *frag = from_timer(frag, t, timer);
+	struct inet_frag_queue *frag = timer_container_of(frag, t, timer);
 	const struct iphdr *iph;
 	struct sk_buff *head = NULL;
 	struct net *net;
diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index a8b04d4abcaa..5f1c7adf6680 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -775,7 +775,7 @@ static void ipmr_destroy_unres(struct mr_table *mrt, struct mfc_cache *c)
 /* Timer process for the unresolved queue. */
 static void ipmr_expire_process(struct timer_list *t)
 {
-	struct mr_table *mrt = from_timer(mrt, t, ipmr_expire_timer);
+	struct mr_table *mrt = timer_container_of(mrt, t, ipmr_expire_timer);
 	struct mr_mfc *c, *next;
 	unsigned long expires;
 	unsigned long now;
diff --git a/net/ipv4/tcp_timer.c b/net/ipv4/tcp_timer.c
index e4c616bbd727..bb37e24b97a7 100644
--- a/net/ipv4/tcp_timer.c
+++ b/net/ipv4/tcp_timer.c
@@ -359,7 +359,7 @@ void tcp_delack_timer_handler(struct sock *sk)
 static void tcp_delack_timer(struct timer_list *t)
 {
 	struct inet_connection_sock *icsk =
-			from_timer(icsk, t, icsk_delack_timer);
+			timer_container_of(icsk, t, icsk_delack_timer);
 	struct sock *sk = &icsk->icsk_inet.sk;
 
 	/* Avoid taking socket spinlock if there is no ACK to send.
@@ -726,7 +726,7 @@ void tcp_write_timer_handler(struct sock *sk)
 static void tcp_write_timer(struct timer_list *t)
 {
 	struct inet_connection_sock *icsk =
-			from_timer(icsk, t, icsk_retransmit_timer);
+			timer_container_of(icsk, t, icsk_retransmit_timer);
 	struct sock *sk = &icsk->icsk_inet.sk;
 
 	/* Avoid locking the socket when there is no pending event. */
@@ -778,7 +778,7 @@ EXPORT_IPV6_MOD_GPL(tcp_set_keepalive);
 
 static void tcp_keepalive_timer(struct timer_list *t)
 {
-	struct sock *sk = from_timer(sk, t, sk_timer);
+	struct sock *sk = timer_container_of(sk, t, sk_timer);
 	struct inet_connection_sock *icsk = inet_csk(sk);
 	struct tcp_sock *tp = tcp_sk(sk);
 	u32 elapsed;
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 9ba83f0c9928..39cfe7a8c2bc 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -4014,7 +4014,7 @@ static int addrconf_ifdown(struct net_device *dev, bool unregister)
 
 static void addrconf_rs_timer(struct timer_list *t)
 {
-	struct inet6_dev *idev = from_timer(idev, t, rs_timer);
+	struct inet6_dev *idev = timer_container_of(idev, t, rs_timer);
 	struct net_device *dev = idev->dev;
 	struct in6_addr lladdr;
 	int rtr_solicits;
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index bf727149fdec..5216b8b6314a 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -2389,7 +2389,7 @@ void fib6_run_gc(unsigned long expires, struct net *net, bool force)
 
 static void fib6_gc_timer_cb(struct timer_list *t)
 {
-	struct net *arg = from_timer(arg, t, ipv6.ip6_fib_timer);
+	struct net *arg = timer_container_of(arg, t, ipv6.ip6_fib_timer);
 
 	fib6_run_gc(0, arg, true);
 }
diff --git a/net/ipv6/ip6mr.c b/net/ipv6/ip6mr.c
index b413c9c8a21c..93eff77c621a 100644
--- a/net/ipv6/ip6mr.c
+++ b/net/ipv6/ip6mr.c
@@ -849,7 +849,7 @@ static void ipmr_do_expire_process(struct mr_table *mrt)
 
 static void ipmr_expire_process(struct timer_list *t)
 {
-	struct mr_table *mrt = from_timer(mrt, t, ipmr_expire_timer);
+	struct mr_table *mrt = timer_container_of(mrt, t, ipmr_expire_timer);
 
 	if (!spin_trylock(&mfc_unres_lock)) {
 		mod_timer(&mrt->ipmr_expire_timer, jiffies + 1);
diff --git a/net/ipv6/netfilter/nf_conntrack_reasm.c b/net/ipv6/netfilter/nf_conntrack_reasm.c
index d6bd8f7079bb..64ab23ff559b 100644
--- a/net/ipv6/netfilter/nf_conntrack_reasm.c
+++ b/net/ipv6/netfilter/nf_conntrack_reasm.c
@@ -133,7 +133,7 @@ static inline u8 ip6_frag_ecn(const struct ipv6hdr *ipv6h)
 
 static void nf_ct_frag6_expire(struct timer_list *t)
 {
-	struct inet_frag_queue *frag = from_timer(frag, t, timer);
+	struct inet_frag_queue *frag = timer_container_of(frag, t, timer);
 	struct frag_queue *fq;
 
 	fq = container_of(frag, struct frag_queue, q);
diff --git a/net/ipv6/reassembly.c b/net/ipv6/reassembly.c
index 49740898bc13..7d4bcf3fda5b 100644
--- a/net/ipv6/reassembly.c
+++ b/net/ipv6/reassembly.c
@@ -73,7 +73,7 @@ static int ip6_frag_reasm(struct frag_queue *fq, struct sk_buff *skb,
 
 static void ip6_frag_expire(struct timer_list *t)
 {
-	struct inet_frag_queue *frag = from_timer(frag, t, timer);
+	struct inet_frag_queue *frag = timer_container_of(frag, t, timer);
 	struct frag_queue *fq;
 
 	fq = container_of(frag, struct frag_queue, q);
diff --git a/net/lapb/lapb_timer.c b/net/lapb/lapb_timer.c
index 5b3f3b444d19..9fde6cf20f10 100644
--- a/net/lapb/lapb_timer.c
+++ b/net/lapb/lapb_timer.c
@@ -74,7 +74,7 @@ int lapb_t1timer_running(struct lapb_cb *lapb)
 
 static void lapb_t2timer_expiry(struct timer_list *t)
 {
-	struct lapb_cb *lapb = from_timer(lapb, t, t2timer);
+	struct lapb_cb *lapb = timer_container_of(lapb, t, t2timer);
 
 	spin_lock_bh(&lapb->lock);
 	if (timer_pending(&lapb->t2timer)) /* A new timer has been set up */
@@ -94,7 +94,7 @@ static void lapb_t2timer_expiry(struct timer_list *t)
 
 static void lapb_t1timer_expiry(struct timer_list *t)
 {
-	struct lapb_cb *lapb = from_timer(lapb, t, t1timer);
+	struct lapb_cb *lapb = timer_container_of(lapb, t, t1timer);
 
 	spin_lock_bh(&lapb->lock);
 	if (timer_pending(&lapb->t1timer)) /* A new timer has been set up */
diff --git a/net/llc/llc_c_ac.c b/net/llc/llc_c_ac.c
index 7e8fc710c590..8be393ccfc22 100644
--- a/net/llc/llc_c_ac.c
+++ b/net/llc/llc_c_ac.c
@@ -1335,28 +1335,28 @@ static void llc_conn_tmr_common_cb(struct sock *sk, u8 type)
 
 void llc_conn_pf_cycle_tmr_cb(struct timer_list *t)
 {
-	struct llc_sock *llc = from_timer(llc, t, pf_cycle_timer.timer);
+	struct llc_sock *llc = timer_container_of(llc, t, pf_cycle_timer.timer);
 
 	llc_conn_tmr_common_cb(&llc->sk, LLC_CONN_EV_TYPE_P_TMR);
 }
 
 void llc_conn_busy_tmr_cb(struct timer_list *t)
 {
-	struct llc_sock *llc = from_timer(llc, t, busy_state_timer.timer);
+	struct llc_sock *llc = timer_container_of(llc, t, busy_state_timer.timer);
 
 	llc_conn_tmr_common_cb(&llc->sk, LLC_CONN_EV_TYPE_BUSY_TMR);
 }
 
 void llc_conn_ack_tmr_cb(struct timer_list *t)
 {
-	struct llc_sock *llc = from_timer(llc, t, ack_timer.timer);
+	struct llc_sock *llc = timer_container_of(llc, t, ack_timer.timer);
 
 	llc_conn_tmr_common_cb(&llc->sk, LLC_CONN_EV_TYPE_ACK_TMR);
 }
 
 void llc_conn_rej_tmr_cb(struct timer_list *t)
 {
-	struct llc_sock *llc = from_timer(llc, t, rej_sent_timer.timer);
+	struct llc_sock *llc = timer_container_of(llc, t, rej_sent_timer.timer);
 
 	llc_conn_tmr_common_cb(&llc->sk, LLC_CONN_EV_TYPE_REJ_TMR);
 }
diff --git a/net/mac80211/agg-rx.c b/net/mac80211/agg-rx.c
index 85612234742a..e1d9e02f752b 100644
--- a/net/mac80211/agg-rx.c
+++ b/net/mac80211/agg-rx.c
@@ -143,7 +143,7 @@ EXPORT_SYMBOL(ieee80211_stop_rx_ba_session);
  */
 static void sta_rx_agg_session_timer_expired(struct timer_list *t)
 {
-	struct tid_ampdu_rx *tid_rx = from_timer(tid_rx, t, session_timer);
+	struct tid_ampdu_rx *tid_rx = timer_container_of(tid_rx, t, session_timer);
 	struct sta_info *sta = tid_rx->sta;
 	u8 tid = tid_rx->tid;
 	unsigned long timeout;
@@ -163,7 +163,7 @@ static void sta_rx_agg_session_timer_expired(struct timer_list *t)
 
 static void sta_rx_agg_reorder_timer_expired(struct timer_list *t)
 {
-	struct tid_ampdu_rx *tid_rx = from_timer(tid_rx, t, reorder_timer);
+	struct tid_ampdu_rx *tid_rx = timer_container_of(tid_rx, t, reorder_timer);
 
 	rcu_read_lock();
 	ieee80211_release_reorder_timeout(tid_rx->sta, tid_rx->tid);
diff --git a/net/mac80211/agg-tx.c b/net/mac80211/agg-tx.c
index 8dc8c3c96b96..a99b3868fea7 100644
--- a/net/mac80211/agg-tx.c
+++ b/net/mac80211/agg-tx.c
@@ -422,7 +422,7 @@ int __ieee80211_stop_tx_ba_session(struct sta_info *sta, u16 tid,
  */
 static void sta_addba_resp_timer_expired(struct timer_list *t)
 {
-	struct tid_ampdu_tx *tid_tx = from_timer(tid_tx, t, addba_resp_timer);
+	struct tid_ampdu_tx *tid_tx = timer_container_of(tid_tx, t, addba_resp_timer);
 	struct sta_info *sta = tid_tx->sta;
 	u8 tid = tid_tx->tid;
 
@@ -574,7 +574,7 @@ EXPORT_SYMBOL(ieee80211_refresh_tx_agg_session_timer);
  */
 static void sta_tx_agg_session_timer_expired(struct timer_list *t)
 {
-	struct tid_ampdu_tx *tid_tx = from_timer(tid_tx, t, session_timer);
+	struct tid_ampdu_tx *tid_tx = timer_container_of(tid_tx, t, session_timer);
 	struct sta_info *sta = tid_tx->sta;
 	u8 tid = tid_tx->tid;
 	unsigned long timeout;
diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index 4246d168374f..86ef9a858eb4 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -1681,7 +1681,7 @@ void ieee80211_ibss_work(struct ieee80211_sub_if_data *sdata)
 static void ieee80211_ibss_timer(struct timer_list *t)
 {
 	struct ieee80211_sub_if_data *sdata =
-		from_timer(sdata, t, u.ibss.timer);
+		timer_container_of(sdata, t, u.ibss.timer);
 
 	wiphy_work_queue(sdata->local->hw.wiphy, &sdata->work);
 }
diff --git a/net/mac80211/led.c b/net/mac80211/led.c
index 885fa6aa3fc1..2e10136b3e70 100644
--- a/net/mac80211/led.c
+++ b/net/mac80211/led.c
@@ -257,7 +257,7 @@ static unsigned long tpt_trig_traffic(struct ieee80211_local *local,
 
 static void tpt_trig_timer(struct timer_list *t)
 {
-	struct tpt_led_trigger *tpt_trig = from_timer(tpt_trig, t, timer);
+	struct tpt_led_trigger *tpt_trig = timer_container_of(tpt_trig, t, timer);
 	struct ieee80211_local *local = tpt_trig->local;
 	unsigned long on, off, tpt;
 	int i;
diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index 7257f5610af5..b17f5b75d699 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -39,7 +39,7 @@ void ieee80211s_stop(void)
 static void ieee80211_mesh_housekeeping_timer(struct timer_list *t)
 {
 	struct ieee80211_sub_if_data *sdata =
-		from_timer(sdata, t, u.mesh.housekeeping_timer);
+		timer_container_of(sdata, t, u.mesh.housekeeping_timer);
 	struct ieee80211_local *local = sdata->local;
 	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
 
@@ -683,7 +683,7 @@ int mesh_add_eht_oper_ie(struct ieee80211_sub_if_data *sdata, struct sk_buff *sk
 static void ieee80211_mesh_path_timer(struct timer_list *t)
 {
 	struct ieee80211_sub_if_data *sdata =
-		from_timer(sdata, t, u.mesh.mesh_path_timer);
+		timer_container_of(sdata, t, u.mesh.mesh_path_timer);
 
 	wiphy_work_queue(sdata->local->hw.wiphy, &sdata->work);
 }
@@ -691,7 +691,7 @@ static void ieee80211_mesh_path_timer(struct timer_list *t)
 static void ieee80211_mesh_path_root_timer(struct timer_list *t)
 {
 	struct ieee80211_sub_if_data *sdata =
-		from_timer(sdata, t, u.mesh.mesh_path_root_timer);
+		timer_container_of(sdata, t, u.mesh.mesh_path_root_timer);
 	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
 
 	set_bit(MESH_WORK_ROOT, &ifmsh->wrkq_flags);
diff --git a/net/mac80211/mesh_hwmp.c b/net/mac80211/mesh_hwmp.c
index c94a9c7ca960..2666ee263731 100644
--- a/net/mac80211/mesh_hwmp.c
+++ b/net/mac80211/mesh_hwmp.c
@@ -1290,7 +1290,7 @@ int mesh_nexthop_lookup(struct ieee80211_sub_if_data *sdata,
 
 void mesh_path_timer(struct timer_list *t)
 {
-	struct mesh_path *mpath = from_timer(mpath, t, timer);
+	struct mesh_path *mpath = timer_container_of(mpath, t, timer);
 	struct ieee80211_sub_if_data *sdata = mpath->sdata;
 	int ret;
 
diff --git a/net/mac80211/mesh_plink.c b/net/mac80211/mesh_plink.c
index 96e0a861886a..4fe05d640953 100644
--- a/net/mac80211/mesh_plink.c
+++ b/net/mac80211/mesh_plink.c
@@ -657,7 +657,7 @@ void mesh_neighbour_update(struct ieee80211_sub_if_data *sdata,
 
 void mesh_plink_timer(struct timer_list *t)
 {
-	struct mesh_sta *mesh = from_timer(mesh, t, plink_timer);
+	struct mesh_sta *mesh = timer_container_of(mesh, t, plink_timer);
 	struct sta_info *sta;
 	u16 reason = 0;
 	struct ieee80211_sub_if_data *sdata;
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 5d1f2d6d09ad..04f29c89bfb6 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -3383,7 +3383,7 @@ void ieee80211_dynamic_ps_enable_work(struct wiphy *wiphy,
 
 void ieee80211_dynamic_ps_timer(struct timer_list *t)
 {
-	struct ieee80211_local *local = from_timer(local, t, dynamic_ps_timer);
+	struct ieee80211_local *local = timer_container_of(local, t, dynamic_ps_timer);
 
 	wiphy_work_queue(local->hw.wiphy, &local->dynamic_ps_enable_work);
 }
@@ -8082,7 +8082,7 @@ void ieee80211_sta_rx_queued_mgmt(struct ieee80211_sub_if_data *sdata,
 static void ieee80211_sta_timer(struct timer_list *t)
 {
 	struct ieee80211_sub_if_data *sdata =
-		from_timer(sdata, t, u.mgd.timer);
+		timer_container_of(sdata, t, u.mgd.timer);
 
 	wiphy_work_queue(sdata->local->hw.wiphy, &sdata->work);
 }
@@ -8388,7 +8388,7 @@ void ieee80211_sta_work(struct ieee80211_sub_if_data *sdata)
 static void ieee80211_sta_bcn_mon_timer(struct timer_list *t)
 {
 	struct ieee80211_sub_if_data *sdata =
-		from_timer(sdata, t, u.mgd.bcn_mon_timer);
+		timer_container_of(sdata, t, u.mgd.bcn_mon_timer);
 
 	if (WARN_ON(ieee80211_vif_is_mld(&sdata->vif)))
 		return;
@@ -8408,7 +8408,7 @@ static void ieee80211_sta_bcn_mon_timer(struct timer_list *t)
 static void ieee80211_sta_conn_mon_timer(struct timer_list *t)
 {
 	struct ieee80211_sub_if_data *sdata =
-		from_timer(sdata, t, u.mgd.conn_mon_timer);
+		timer_container_of(sdata, t, u.mgd.conn_mon_timer);
 	struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
 	struct ieee80211_local *local = sdata->local;
 	struct sta_info *sta;
diff --git a/net/mac80211/ocb.c b/net/mac80211/ocb.c
index ece1e83c7b2f..a5d4358f122a 100644
--- a/net/mac80211/ocb.c
+++ b/net/mac80211/ocb.c
@@ -146,7 +146,7 @@ void ieee80211_ocb_work(struct ieee80211_sub_if_data *sdata)
 static void ieee80211_ocb_housekeeping_timer(struct timer_list *t)
 {
 	struct ieee80211_sub_if_data *sdata =
-		from_timer(sdata, t, u.ocb.housekeeping_timer);
+		timer_container_of(sdata, t, u.ocb.housekeeping_timer);
 	struct ieee80211_local *local = sdata->local;
 	struct ieee80211_if_ocb *ifocb = &sdata->u.ocb;
 
diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index 248e1f63bf73..02de319b45db 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -1549,7 +1549,7 @@ int sta_info_destroy_addr_bss(struct ieee80211_sub_if_data *sdata,
 
 static void sta_info_cleanup(struct timer_list *t)
 {
-	struct ieee80211_local *local = from_timer(local, t, sta_cleanup);
+	struct ieee80211_local *local = timer_container_of(local, t, sta_cleanup);
 	struct sta_info *sta;
 	bool timer_needed = false;
 
diff --git a/net/mptcp/pm.c b/net/mptcp/pm.c
index 31747f974941..2475b3975813 100644
--- a/net/mptcp/pm.c
+++ b/net/mptcp/pm.c
@@ -267,7 +267,7 @@ int mptcp_pm_mp_prio_send_ack(struct mptcp_sock *msk,
 
 static void mptcp_pm_add_timer(struct timer_list *timer)
 {
-	struct mptcp_pm_add_entry *entry = from_timer(entry, timer, add_timer);
+	struct mptcp_pm_add_entry *entry = timer_container_of(entry, timer, add_timer);
 	struct mptcp_sock *msk = entry->sock;
 	struct sock *sk = (struct sock *)msk;
 
diff --git a/net/mptcp/protocol.c b/net/mptcp/protocol.c
index 44f7ab463d75..d90365db63be 100644
--- a/net/mptcp/protocol.c
+++ b/net/mptcp/protocol.c
@@ -2201,7 +2201,7 @@ static int mptcp_recvmsg(struct sock *sk, struct msghdr *msg, size_t len,
 
 static void mptcp_retransmit_timer(struct timer_list *t)
 {
-	struct inet_connection_sock *icsk = from_timer(icsk, t,
+	struct inet_connection_sock *icsk = timer_container_of(icsk, t,
 						       icsk_retransmit_timer);
 	struct sock *sk = &icsk->icsk_inet.sk;
 	struct mptcp_sock *msk = mptcp_sk(sk);
@@ -2221,7 +2221,7 @@ static void mptcp_retransmit_timer(struct timer_list *t)
 
 static void mptcp_tout_timer(struct timer_list *t)
 {
-	struct sock *sk = from_timer(sk, t, sk_timer);
+	struct sock *sk = timer_container_of(sk, t, sk_timer);
 
 	mptcp_schedule_work(sk);
 	sock_put(sk);
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index b36947063783..446e4e3b9553 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -88,7 +88,7 @@ static void ncsi_report_link(struct ncsi_dev_priv *ndp, bool force_down)
 
 static void ncsi_channel_monitor(struct timer_list *t)
 {
-	struct ncsi_channel *nc = from_timer(nc, t, monitor.timer);
+	struct ncsi_channel *nc = timer_container_of(nc, t, monitor.timer);
 	struct ncsi_package *np = nc->package;
 	struct ncsi_dev_priv *ndp = np->ndp;
 	struct ncsi_channel_mode *ncm;
@@ -430,7 +430,7 @@ struct ncsi_dev *ncsi_find_dev(struct net_device *dev)
 
 static void ncsi_request_timeout(struct timer_list *t)
 {
-	struct ncsi_request *nr = from_timer(nr, t, timer);
+	struct ncsi_request *nr = timer_container_of(nr, t, timer);
 	struct ncsi_dev_priv *ndp = nr->ndp;
 	struct ncsi_cmd_pkt *cmd;
 	struct ncsi_package *np;
diff --git a/net/netfilter/ipset/ip_set_bitmap_gen.h b/net/netfilter/ipset/ip_set_bitmap_gen.h
index 6ae042f702d2..798c7993635e 100644
--- a/net/netfilter/ipset/ip_set_bitmap_gen.h
+++ b/net/netfilter/ipset/ip_set_bitmap_gen.h
@@ -264,7 +264,7 @@ mtype_list(const struct ip_set *set,
 static void
 mtype_gc(struct timer_list *t)
 {
-	struct mtype *map = from_timer(map, t, gc);
+	struct mtype *map = timer_container_of(map, t, gc);
 	struct ip_set *set = map->set;
 	void *x;
 	u32 id;
diff --git a/net/netfilter/ipset/ip_set_list_set.c b/net/netfilter/ipset/ip_set_list_set.c
index db794fe1300e..13c7a08aa868 100644
--- a/net/netfilter/ipset/ip_set_list_set.c
+++ b/net/netfilter/ipset/ip_set_list_set.c
@@ -571,7 +571,7 @@ static const struct ip_set_type_variant set_variant = {
 static void
 list_set_gc(struct timer_list *t)
 {
-	struct list_set *map = from_timer(map, t, gc);
+	struct list_set *map = timer_container_of(map, t, gc);
 	struct ip_set *set = map->set;
 
 	spin_lock_bh(&set->lock);
diff --git a/net/netfilter/ipvs/ip_vs_conn.c b/net/netfilter/ipvs/ip_vs_conn.c
index 8699944c0baf..44b2ad695c15 100644
--- a/net/netfilter/ipvs/ip_vs_conn.c
+++ b/net/netfilter/ipvs/ip_vs_conn.c
@@ -846,7 +846,7 @@ static void ip_vs_conn_del_put(struct ip_vs_conn *cp)
 
 static void ip_vs_conn_expire(struct timer_list *t)
 {
-	struct ip_vs_conn *cp = from_timer(cp, t, timer);
+	struct ip_vs_conn *cp = timer_container_of(cp, t, timer);
 	struct netns_ipvs *ipvs = cp->ipvs;
 
 	/*
diff --git a/net/netfilter/ipvs/ip_vs_ctl.c b/net/netfilter/ipvs/ip_vs_ctl.c
index 7d5b7418f8c7..fdc8ef0a0db2 100644
--- a/net/netfilter/ipvs/ip_vs_ctl.c
+++ b/net/netfilter/ipvs/ip_vs_ctl.c
@@ -1331,7 +1331,7 @@ ip_vs_del_dest(struct ip_vs_service *svc, struct ip_vs_dest_user_kern *udest)
 
 static void ip_vs_dest_trash_expire(struct timer_list *t)
 {
-	struct netns_ipvs *ipvs = from_timer(ipvs, t, dest_trash_timer);
+	struct netns_ipvs *ipvs = timer_container_of(ipvs, t, dest_trash_timer);
 	struct ip_vs_dest *dest, *next;
 	unsigned long now = jiffies;
 
diff --git a/net/netfilter/ipvs/ip_vs_lblc.c b/net/netfilter/ipvs/ip_vs_lblc.c
index 2423513d701d..f15377c4c5df 100644
--- a/net/netfilter/ipvs/ip_vs_lblc.c
+++ b/net/netfilter/ipvs/ip_vs_lblc.c
@@ -292,7 +292,7 @@ static inline void ip_vs_lblc_full_check(struct ip_vs_service *svc)
  */
 static void ip_vs_lblc_check_expire(struct timer_list *t)
 {
-	struct ip_vs_lblc_table *tbl = from_timer(tbl, t, periodic_timer);
+	struct ip_vs_lblc_table *tbl = timer_container_of(tbl, t, periodic_timer);
 	struct ip_vs_service *svc = tbl->svc;
 	unsigned long now = jiffies;
 	int goal;
diff --git a/net/netfilter/ipvs/ip_vs_lblcr.c b/net/netfilter/ipvs/ip_vs_lblcr.c
index cdb1d4bf6761..7efaf82090fd 100644
--- a/net/netfilter/ipvs/ip_vs_lblcr.c
+++ b/net/netfilter/ipvs/ip_vs_lblcr.c
@@ -456,7 +456,7 @@ static inline void ip_vs_lblcr_full_check(struct ip_vs_service *svc)
  */
 static void ip_vs_lblcr_check_expire(struct timer_list *t)
 {
-	struct ip_vs_lblcr_table *tbl = from_timer(tbl, t, periodic_timer);
+	struct ip_vs_lblcr_table *tbl = timer_container_of(tbl, t, periodic_timer);
 	struct ip_vs_service *svc = tbl->svc;
 	unsigned long now = jiffies;
 	int goal;
diff --git a/net/netfilter/nf_conntrack_expect.c b/net/netfilter/nf_conntrack_expect.c
index 21d22fa22e4e..cfc2daa3fc7f 100644
--- a/net/netfilter/nf_conntrack_expect.c
+++ b/net/netfilter/nf_conntrack_expect.c
@@ -71,7 +71,7 @@ EXPORT_SYMBOL_GPL(nf_ct_unlink_expect_report);
 
 static void nf_ct_expectation_timed_out(struct timer_list *t)
 {
-	struct nf_conntrack_expect *exp = from_timer(exp, t, timeout);
+	struct nf_conntrack_expect *exp = timer_container_of(exp, t, timeout);
 
 	spin_lock_bh(&nf_conntrack_expect_lock);
 	nf_ct_unlink_expect(exp);
diff --git a/net/netfilter/nfnetlink_log.c b/net/netfilter/nfnetlink_log.c
index 882962f3c84d..bfcb9cd335bf 100644
--- a/net/netfilter/nfnetlink_log.c
+++ b/net/netfilter/nfnetlink_log.c
@@ -390,7 +390,7 @@ __nfulnl_flush(struct nfulnl_instance *inst)
 static void
 nfulnl_timer(struct timer_list *t)
 {
-	struct nfulnl_instance *inst = from_timer(inst, t, timer);
+	struct nfulnl_instance *inst = timer_container_of(inst, t, timer);
 
 	spin_lock_bh(&inst->lock);
 	if (inst->skb)
diff --git a/net/netfilter/xt_IDLETIMER.c b/net/netfilter/xt_IDLETIMER.c
index 9f54819eb52c..7f20e517da62 100644
--- a/net/netfilter/xt_IDLETIMER.c
+++ b/net/netfilter/xt_IDLETIMER.c
@@ -100,7 +100,7 @@ static void idletimer_tg_work(struct work_struct *work)
 
 static void idletimer_tg_expired(struct timer_list *t)
 {
-	struct idletimer_tg *timer = from_timer(timer, t, timer);
+	struct idletimer_tg *timer = timer_container_of(timer, t, timer);
 
 	pr_debug("timer %s expired\n", timer->attr.attr.name);
 
diff --git a/net/netfilter/xt_LED.c b/net/netfilter/xt_LED.c
index 8a80fd76fe45..3dd733b293fe 100644
--- a/net/netfilter/xt_LED.c
+++ b/net/netfilter/xt_LED.c
@@ -72,7 +72,7 @@ led_tg(struct sk_buff *skb, const struct xt_action_param *par)
 
 static void led_timeout_callback(struct timer_list *t)
 {
-	struct xt_led_info_internal *ledinternal = from_timer(ledinternal, t,
+	struct xt_led_info_internal *ledinternal = timer_container_of(ledinternal, t,
 							      timer);
 
 	led_trigger_event(&ledinternal->netfilter_led_trigger, LED_OFF);
diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index 6ee148f0e6d0..3331669d8e33 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -240,7 +240,7 @@ void nr_destroy_socket(struct sock *);
  */
 static void nr_destroy_timer(struct timer_list *t)
 {
-	struct sock *sk = from_timer(sk, t, sk_timer);
+	struct sock *sk = timer_container_of(sk, t, sk_timer);
 	bh_lock_sock(sk);
 	sock_hold(sk);
 	nr_destroy_socket(sk);
diff --git a/net/netrom/nr_timer.c b/net/netrom/nr_timer.c
index 5e3ca068f04e..b3a62b1f3a09 100644
--- a/net/netrom/nr_timer.c
+++ b/net/netrom/nr_timer.c
@@ -111,7 +111,7 @@ int nr_t1timer_running(struct sock *sk)
 
 static void nr_heartbeat_expiry(struct timer_list *t)
 {
-	struct sock *sk = from_timer(sk, t, sk_timer);
+	struct sock *sk = timer_container_of(sk, t, sk_timer);
 	struct nr_sock *nr = nr_sk(sk);
 
 	bh_lock_sock(sk);
@@ -152,7 +152,7 @@ static void nr_heartbeat_expiry(struct timer_list *t)
 
 static void nr_t2timer_expiry(struct timer_list *t)
 {
-	struct nr_sock *nr = from_timer(nr, t, t2timer);
+	struct nr_sock *nr = timer_container_of(nr, t, t2timer);
 	struct sock *sk = &nr->sock;
 
 	bh_lock_sock(sk);
@@ -166,7 +166,7 @@ static void nr_t2timer_expiry(struct timer_list *t)
 
 static void nr_t4timer_expiry(struct timer_list *t)
 {
-	struct nr_sock *nr = from_timer(nr, t, t4timer);
+	struct nr_sock *nr = timer_container_of(nr, t, t4timer);
 	struct sock *sk = &nr->sock;
 
 	bh_lock_sock(sk);
@@ -177,7 +177,7 @@ static void nr_t4timer_expiry(struct timer_list *t)
 
 static void nr_idletimer_expiry(struct timer_list *t)
 {
-	struct nr_sock *nr = from_timer(nr, t, idletimer);
+	struct nr_sock *nr = timer_container_of(nr, t, idletimer);
 	struct sock *sk = &nr->sock;
 
 	bh_lock_sock(sk);
@@ -206,7 +206,7 @@ static void nr_idletimer_expiry(struct timer_list *t)
 
 static void nr_t1timer_expiry(struct timer_list *t)
 {
-	struct nr_sock *nr = from_timer(nr, t, t1timer);
+	struct nr_sock *nr = timer_container_of(nr, t, t1timer);
 	struct sock *sk = &nr->sock;
 
 	bh_lock_sock(sk);
diff --git a/net/nfc/core.c b/net/nfc/core.c
index 75ed8a9146ba..ae1c842f9c64 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -1010,7 +1010,7 @@ static void nfc_check_pres_work(struct work_struct *work)
 
 static void nfc_check_pres_timeout(struct timer_list *t)
 {
-	struct nfc_dev *dev = from_timer(dev, t, check_pres_timer);
+	struct nfc_dev *dev = timer_container_of(dev, t, check_pres_timer);
 
 	schedule_work(&dev->check_pres_work);
 }
diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index aa493344d93e..8618d57c23da 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -441,7 +441,7 @@ void nfc_hci_event_received(struct nfc_hci_dev *hdev, u8 pipe, u8 event,
 
 static void nfc_hci_cmd_timeout(struct timer_list *t)
 {
-	struct nfc_hci_dev *hdev = from_timer(hdev, t, cmd_timer);
+	struct nfc_hci_dev *hdev = timer_container_of(hdev, t, cmd_timer);
 
 	schedule_work(&hdev->msg_tx_work);
 }
diff --git a/net/nfc/hci/llc_shdlc.c b/net/nfc/hci/llc_shdlc.c
index ce9c683a3ead..4fc37894860c 100644
--- a/net/nfc/hci/llc_shdlc.c
+++ b/net/nfc/hci/llc_shdlc.c
@@ -564,14 +564,14 @@ static void llc_shdlc_handle_send_queue(struct llc_shdlc *shdlc)
 
 static void llc_shdlc_connect_timeout(struct timer_list *t)
 {
-	struct llc_shdlc *shdlc = from_timer(shdlc, t, connect_timer);
+	struct llc_shdlc *shdlc = timer_container_of(shdlc, t, connect_timer);
 
 	schedule_work(&shdlc->sm_work);
 }
 
 static void llc_shdlc_t1_timeout(struct timer_list *t)
 {
-	struct llc_shdlc *shdlc = from_timer(shdlc, t, t1_timer);
+	struct llc_shdlc *shdlc = timer_container_of(shdlc, t, t1_timer);
 
 	pr_debug("SoftIRQ: need to send ack\n");
 
@@ -580,7 +580,7 @@ static void llc_shdlc_t1_timeout(struct timer_list *t)
 
 static void llc_shdlc_t2_timeout(struct timer_list *t)
 {
-	struct llc_shdlc *shdlc = from_timer(shdlc, t, t2_timer);
+	struct llc_shdlc *shdlc = timer_container_of(shdlc, t, t2_timer);
 
 	pr_debug("SoftIRQ: need to retransmit\n");
 
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 27e863f96ed1..73282f5f6d83 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -243,7 +243,7 @@ static void nfc_llcp_timeout_work(struct work_struct *work)
 
 static void nfc_llcp_symm_timer(struct timer_list *t)
 {
-	struct nfc_llcp_local *local = from_timer(local, t, link_timer);
+	struct nfc_llcp_local *local = timer_container_of(local, t, link_timer);
 
 	pr_err("SYMM timeout\n");
 
@@ -286,7 +286,7 @@ static void nfc_llcp_sdreq_timeout_work(struct work_struct *work)
 
 static void nfc_llcp_sdreq_timer(struct timer_list *t)
 {
-	struct nfc_llcp_local *local = from_timer(local, t, sdreq_timer);
+	struct nfc_llcp_local *local = timer_container_of(local, t, sdreq_timer);
 
 	schedule_work(&local->sdreq_timeout_work);
 }
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 0171bf3c7016..fc921cd2cdff 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -610,7 +610,7 @@ static int nci_close_device(struct nci_dev *ndev)
 /* NCI command timer function */
 static void nci_cmd_timer(struct timer_list *t)
 {
-	struct nci_dev *ndev = from_timer(ndev, t, cmd_timer);
+	struct nci_dev *ndev = timer_container_of(ndev, t, cmd_timer);
 
 	atomic_set(&ndev->cmd_cnt, 1);
 	queue_work(ndev->cmd_wq, &ndev->cmd_work);
@@ -619,7 +619,7 @@ static void nci_cmd_timer(struct timer_list *t)
 /* NCI data exchange timer function */
 static void nci_data_timer(struct timer_list *t)
 {
-	struct nci_dev *ndev = from_timer(ndev, t, data_timer);
+	struct nci_dev *ndev = timer_container_of(ndev, t, data_timer);
 
 	set_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags);
 	queue_work(ndev->rx_wq, &ndev->rx_work);
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index d4dba06297c3..bafc1ee7ccfa 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -722,7 +722,7 @@ static void _prb_refresh_rx_retire_blk_timer(struct tpacket_kbdq_core *pkc)
 static void prb_retire_rx_blk_timer_expired(struct timer_list *t)
 {
 	struct packet_sock *po =
-		from_timer(po, t, rx_ring.prb_bdqc.retire_blk_timer);
+		timer_container_of(po, t, rx_ring.prb_bdqc.retire_blk_timer);
 	struct tpacket_kbdq_core *pkc = GET_PBDQC_FROM_RB(&po->rx_ring);
 	unsigned int frozen;
 	struct tpacket_block_desc *pbd;
diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index a4a668b88a8f..4e72b636a46a 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -345,7 +345,7 @@ void rose_destroy_socket(struct sock *);
  */
 static void rose_destroy_timer(struct timer_list *t)
 {
-	struct sock *sk = from_timer(sk, t, sk_timer);
+	struct sock *sk = timer_container_of(sk, t, sk_timer);
 
 	rose_destroy_socket(sk);
 }
diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
index 9f9629e6fdae..7746229fdc8c 100644
--- a/net/rose/rose_link.c
+++ b/net/rose/rose_link.c
@@ -78,7 +78,7 @@ static void rose_ftimer_expiry(struct timer_list *t)
 
 static void rose_t0timer_expiry(struct timer_list *t)
 {
-	struct rose_neigh *neigh = from_timer(neigh, t, t0timer);
+	struct rose_neigh *neigh = timer_container_of(neigh, t, t0timer);
 
 	rose_transmit_restart_request(neigh);
 
diff --git a/net/rose/rose_timer.c b/net/rose/rose_timer.c
index 1525773e94aa..020369c49587 100644
--- a/net/rose/rose_timer.c
+++ b/net/rose/rose_timer.c
@@ -118,7 +118,7 @@ void rose_stop_idletimer(struct sock *sk)
 
 static void rose_heartbeat_expiry(struct timer_list *t)
 {
-	struct sock *sk = from_timer(sk, t, sk_timer);
+	struct sock *sk = timer_container_of(sk, t, sk_timer);
 	struct rose_sock *rose = rose_sk(sk);
 
 	bh_lock_sock(sk);
@@ -163,7 +163,7 @@ static void rose_heartbeat_expiry(struct timer_list *t)
 
 static void rose_timer_expiry(struct timer_list *t)
 {
-	struct rose_sock *rose = from_timer(rose, t, timer);
+	struct rose_sock *rose = timer_container_of(rose, t, timer);
 	struct sock *sk = &rose->sock;
 
 	bh_lock_sock(sk);
@@ -198,7 +198,7 @@ static void rose_timer_expiry(struct timer_list *t)
 
 static void rose_idletimer_expiry(struct timer_list *t)
 {
-	struct rose_sock *rose = from_timer(rose, t, idletimer);
+	struct rose_sock *rose = timer_container_of(rose, t, idletimer);
 	struct sock *sk = &rose->sock;
 
 	bh_lock_sock(sk);
diff --git a/net/rxrpc/call_object.c b/net/rxrpc/call_object.c
index fce58be65e7c..645ac6b4a767 100644
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -64,7 +64,7 @@ void rxrpc_poke_call(struct rxrpc_call *call, enum rxrpc_call_poke_trace what)
 
 static void rxrpc_call_timer_expired(struct timer_list *t)
 {
-	struct rxrpc_call *call = from_timer(call, t, timer);
+	struct rxrpc_call *call = timer_container_of(call, t, timer);
 
 	_enter("%d", call->debug_id);
 
diff --git a/net/sched/cls_flow.c b/net/sched/cls_flow.c
index 5c2580a07530..5693b41b093f 100644
--- a/net/sched/cls_flow.c
+++ b/net/sched/cls_flow.c
@@ -345,7 +345,7 @@ TC_INDIRECT_SCOPE int flow_classify(struct sk_buff *skb,
 
 static void flow_perturbation(struct timer_list *t)
 {
-	struct flow_filter *f = from_timer(f, t, perturb_timer);
+	struct flow_filter *f = timer_container_of(f, t, perturb_timer);
 
 	get_random_bytes(&f->hashrnd, 4);
 	if (f->perturb_period)
diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index f3b8203d3e85..98f8765ec5d4 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -384,7 +384,7 @@ static int fq_pie_change(struct Qdisc *sch, struct nlattr *opt,
 
 static void fq_pie_timer(struct timer_list *t)
 {
-	struct fq_pie_sched_data *q = from_timer(q, t, adapt_timer);
+	struct fq_pie_sched_data *q = timer_container_of(q, t, adapt_timer);
 	unsigned long next, tupdate;
 	struct Qdisc *sch = q->sch;
 	spinlock_t *root_lock; /* to lock qdisc for probability calculations */
diff --git a/net/sched/sch_generic.c b/net/sched/sch_generic.c
index 514b1b6ac681..a78945a7073a 100644
--- a/net/sched/sch_generic.c
+++ b/net/sched/sch_generic.c
@@ -495,7 +495,7 @@ EXPORT_SYMBOL(netif_tx_unlock);
 
 static void dev_watchdog(struct timer_list *t)
 {
-	struct net_device *dev = from_timer(dev, t, watchdog_timer);
+	struct net_device *dev = timer_container_of(dev, t, watchdog_timer);
 	bool release = true;
 
 	spin_lock(&dev->tx_global_lock);
diff --git a/net/sched/sch_pie.c b/net/sched/sch_pie.c
index 3771d000b30d..d5caa6d5cd5b 100644
--- a/net/sched/sch_pie.c
+++ b/net/sched/sch_pie.c
@@ -424,7 +424,7 @@ EXPORT_SYMBOL_GPL(pie_calculate_probability);
 
 static void pie_timer(struct timer_list *t)
 {
-	struct pie_sched_data *q = from_timer(q, t, adapt_timer);
+	struct pie_sched_data *q = timer_container_of(q, t, adapt_timer);
 	struct Qdisc *sch = q->sch;
 	spinlock_t *root_lock;
 
diff --git a/net/sched/sch_red.c b/net/sched/sch_red.c
index 1ba3e0bba54f..339d70b4a4c5 100644
--- a/net/sched/sch_red.c
+++ b/net/sched/sch_red.c
@@ -321,7 +321,7 @@ static int __red_change(struct Qdisc *sch, struct nlattr **tb,
 
 static inline void red_adaptative_timer(struct timer_list *t)
 {
-	struct red_sched_data *q = from_timer(q, t, adapt_timer);
+	struct red_sched_data *q = timer_container_of(q, t, adapt_timer);
 	struct Qdisc *sch = q->sch;
 	spinlock_t *root_lock;
 
diff --git a/net/sched/sch_sfq.c b/net/sched/sch_sfq.c
index b912ad99aa15..a8081492d671 100644
--- a/net/sched/sch_sfq.c
+++ b/net/sched/sch_sfq.c
@@ -597,7 +597,7 @@ static void sfq_rehash(struct Qdisc *sch)
 
 static void sfq_perturbation(struct timer_list *t)
 {
-	struct sfq_sched_data *q = from_timer(q, t, perturb_timer);
+	struct sfq_sched_data *q = timer_container_of(q, t, perturb_timer);
 	struct Qdisc *sch = q->sch;
 	spinlock_t *root_lock;
 	siphash_key_t nkey;
diff --git a/net/sctp/protocol.c b/net/sctp/protocol.c
index 8c3b80c4d40b..f402f90eb6b6 100644
--- a/net/sctp/protocol.c
+++ b/net/sctp/protocol.c
@@ -631,7 +631,7 @@ static void sctp_v4_ecn_capable(struct sock *sk)
 
 static void sctp_addr_wq_timeout_handler(struct timer_list *t)
 {
-	struct net *net = from_timer(net, t, sctp.addr_wq_timer);
+	struct net *net = timer_container_of(net, t, sctp.addr_wq_timer);
 	struct sctp_sockaddr_entry *addrw, *temp;
 	struct sctp_sock *sp;
 
diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
index 3aa5da5e3bbd..6c24ac6d3bf1 100644
--- a/net/sctp/sm_sideeffect.c
+++ b/net/sctp/sm_sideeffect.c
@@ -231,7 +231,7 @@ static int sctp_gen_sack(struct sctp_association *asoc, int force,
 void sctp_generate_t3_rtx_event(struct timer_list *t)
 {
 	struct sctp_transport *transport =
-		from_timer(transport, t, T3_rtx_timer);
+		timer_container_of(transport, t, T3_rtx_timer);
 	struct sctp_association *asoc = transport->asoc;
 	struct sock *sk = asoc->base.sk;
 	struct net *net = sock_net(sk);
@@ -308,7 +308,7 @@ static void sctp_generate_timeout_event(struct sctp_association *asoc,
 static void sctp_generate_t1_cookie_event(struct timer_list *t)
 {
 	struct sctp_association *asoc =
-		from_timer(asoc, t, timers[SCTP_EVENT_TIMEOUT_T1_COOKIE]);
+		timer_container_of(asoc, t, timers[SCTP_EVENT_TIMEOUT_T1_COOKIE]);
 
 	sctp_generate_timeout_event(asoc, SCTP_EVENT_TIMEOUT_T1_COOKIE);
 }
@@ -316,7 +316,7 @@ static void sctp_generate_t1_cookie_event(struct timer_list *t)
 static void sctp_generate_t1_init_event(struct timer_list *t)
 {
 	struct sctp_association *asoc =
-		from_timer(asoc, t, timers[SCTP_EVENT_TIMEOUT_T1_INIT]);
+		timer_container_of(asoc, t, timers[SCTP_EVENT_TIMEOUT_T1_INIT]);
 
 	sctp_generate_timeout_event(asoc, SCTP_EVENT_TIMEOUT_T1_INIT);
 }
@@ -324,7 +324,7 @@ static void sctp_generate_t1_init_event(struct timer_list *t)
 static void sctp_generate_t2_shutdown_event(struct timer_list *t)
 {
 	struct sctp_association *asoc =
-		from_timer(asoc, t, timers[SCTP_EVENT_TIMEOUT_T2_SHUTDOWN]);
+		timer_container_of(asoc, t, timers[SCTP_EVENT_TIMEOUT_T2_SHUTDOWN]);
 
 	sctp_generate_timeout_event(asoc, SCTP_EVENT_TIMEOUT_T2_SHUTDOWN);
 }
@@ -332,7 +332,7 @@ static void sctp_generate_t2_shutdown_event(struct timer_list *t)
 static void sctp_generate_t4_rto_event(struct timer_list *t)
 {
 	struct sctp_association *asoc =
-		from_timer(asoc, t, timers[SCTP_EVENT_TIMEOUT_T4_RTO]);
+		timer_container_of(asoc, t, timers[SCTP_EVENT_TIMEOUT_T4_RTO]);
 
 	sctp_generate_timeout_event(asoc, SCTP_EVENT_TIMEOUT_T4_RTO);
 }
@@ -340,7 +340,7 @@ static void sctp_generate_t4_rto_event(struct timer_list *t)
 static void sctp_generate_t5_shutdown_guard_event(struct timer_list *t)
 {
 	struct sctp_association *asoc =
-		from_timer(asoc, t,
+		timer_container_of(asoc, t,
 			   timers[SCTP_EVENT_TIMEOUT_T5_SHUTDOWN_GUARD]);
 
 	sctp_generate_timeout_event(asoc,
@@ -351,7 +351,7 @@ static void sctp_generate_t5_shutdown_guard_event(struct timer_list *t)
 static void sctp_generate_autoclose_event(struct timer_list *t)
 {
 	struct sctp_association *asoc =
-		from_timer(asoc, t, timers[SCTP_EVENT_TIMEOUT_AUTOCLOSE]);
+		timer_container_of(asoc, t, timers[SCTP_EVENT_TIMEOUT_AUTOCLOSE]);
 
 	sctp_generate_timeout_event(asoc, SCTP_EVENT_TIMEOUT_AUTOCLOSE);
 }
@@ -361,7 +361,7 @@ static void sctp_generate_autoclose_event(struct timer_list *t)
  */
 void sctp_generate_heartbeat_event(struct timer_list *t)
 {
-	struct sctp_transport *transport = from_timer(transport, t, hb_timer);
+	struct sctp_transport *transport = timer_container_of(transport, t, hb_timer);
 	struct sctp_association *asoc = transport->asoc;
 	struct sock *sk = asoc->base.sk;
 	struct net *net = sock_net(sk);
@@ -407,7 +407,7 @@ void sctp_generate_heartbeat_event(struct timer_list *t)
 void sctp_generate_proto_unreach_event(struct timer_list *t)
 {
 	struct sctp_transport *transport =
-		from_timer(transport, t, proto_unreach_timer);
+		timer_container_of(transport, t, proto_unreach_timer);
 	struct sctp_association *asoc = transport->asoc;
 	struct sock *sk = asoc->base.sk;
 	struct net *net = sock_net(sk);
@@ -442,7 +442,7 @@ void sctp_generate_proto_unreach_event(struct timer_list *t)
 void sctp_generate_reconf_event(struct timer_list *t)
 {
 	struct sctp_transport *transport =
-		from_timer(transport, t, reconf_timer);
+		timer_container_of(transport, t, reconf_timer);
 	struct sctp_association *asoc = transport->asoc;
 	struct sock *sk = asoc->base.sk;
 	struct net *net = sock_net(sk);
@@ -478,7 +478,7 @@ void sctp_generate_reconf_event(struct timer_list *t)
 /* Handle the timeout of the probe timer. */
 void sctp_generate_probe_event(struct timer_list *t)
 {
-	struct sctp_transport *transport = from_timer(transport, t, probe_timer);
+	struct sctp_transport *transport = timer_container_of(transport, t, probe_timer);
 	struct sctp_association *asoc = transport->asoc;
 	struct sock *sk = asoc->base.sk;
 	struct net *net = sock_net(sk);
@@ -511,7 +511,7 @@ void sctp_generate_probe_event(struct timer_list *t)
 static void sctp_generate_sack_event(struct timer_list *t)
 {
 	struct sctp_association *asoc =
-		from_timer(asoc, t, timers[SCTP_EVENT_TIMEOUT_SACK]);
+		timer_container_of(asoc, t, timers[SCTP_EVENT_TIMEOUT_SACK]);
 
 	sctp_generate_timeout_event(asoc, SCTP_EVENT_TIMEOUT_SACK);
 }
diff --git a/net/sunrpc/svc_xprt.c b/net/sunrpc/svc_xprt.c
index ae25405d8bd2..144fdc4cd322 100644
--- a/net/sunrpc/svc_xprt.c
+++ b/net/sunrpc/svc_xprt.c
@@ -929,7 +929,7 @@ void svc_send(struct svc_rqst *rqstp)
  */
 static void svc_age_temp_xprts(struct timer_list *t)
 {
-	struct svc_serv *serv = from_timer(serv, t, sv_temptimer);
+	struct svc_serv *serv = timer_container_of(serv, t, sv_temptimer);
 	struct svc_xprt *xprt;
 	struct list_head *le, *next;
 
diff --git a/net/sunrpc/xprt.c b/net/sunrpc/xprt.c
index 0eab15465511..002380569762 100644
--- a/net/sunrpc/xprt.c
+++ b/net/sunrpc/xprt.c
@@ -854,7 +854,7 @@ xprt_schedule_autodisconnect(struct rpc_xprt *xprt)
 static void
 xprt_init_autodisconnect(struct timer_list *t)
 {
-	struct rpc_xprt *xprt = from_timer(xprt, t, timer);
+	struct rpc_xprt *xprt = timer_container_of(xprt, t, timer);
 
 	if (!RB_EMPTY_ROOT(&xprt->recv_queue))
 		return;
diff --git a/net/tipc/discover.c b/net/tipc/discover.c
index 685389d4b245..775fd4f3f072 100644
--- a/net/tipc/discover.c
+++ b/net/tipc/discover.c
@@ -292,7 +292,7 @@ void tipc_disc_remove_dest(struct tipc_discoverer *d)
  */
 static void tipc_disc_timeout(struct timer_list *t)
 {
-	struct tipc_discoverer *d = from_timer(d, t, timer);
+	struct tipc_discoverer *d = timer_container_of(d, t, timer);
 	struct tipc_net *tn = tipc_net(d->net);
 	struct tipc_media_addr maddr;
 	struct sk_buff *skb = NULL;
diff --git a/net/tipc/monitor.c b/net/tipc/monitor.c
index e2f19627e43d..2f266a064663 100644
--- a/net/tipc/monitor.c
+++ b/net/tipc/monitor.c
@@ -630,7 +630,7 @@ void tipc_mon_get_state(struct net *net, u32 addr,
 
 static void mon_timeout(struct timer_list *t)
 {
-	struct tipc_monitor *mon = from_timer(mon, t, timer);
+	struct tipc_monitor *mon = timer_container_of(mon, t, timer);
 	struct tipc_peer *self;
 	int best_member_cnt = dom_size(mon->peer_cnt) - 1;
 
diff --git a/net/tipc/node.c b/net/tipc/node.c
index ccf5e427f43e..32afc0bdfd0c 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -800,7 +800,7 @@ static bool tipc_node_cleanup(struct tipc_node *peer)
  */
 static void tipc_node_timeout(struct timer_list *t)
 {
-	struct tipc_node *n = from_timer(n, t, timer);
+	struct tipc_node *n = timer_container_of(n, t, timer);
 	struct tipc_link_entry *le;
 	struct sk_buff_head xmitq;
 	int remains = n->link_cnt;
diff --git a/net/tipc/socket.c b/net/tipc/socket.c
index 65dcbb54f55d..7c61d47ea208 100644
--- a/net/tipc/socket.c
+++ b/net/tipc/socket.c
@@ -2862,7 +2862,7 @@ static void tipc_sk_retry_connect(struct sock *sk, struct sk_buff_head *list)
 
 static void tipc_sk_timeout(struct timer_list *t)
 {
-	struct sock *sk = from_timer(sk, t, sk_timer);
+	struct sock *sk = timer_container_of(sk, t, sk_timer);
 	struct tipc_sock *tsk = tipc_sk(sk);
 	u32 pnode = tsk_peer_node(tsk);
 	struct sk_buff_head list;
diff --git a/net/tipc/subscr.c b/net/tipc/subscr.c
index 621addab2834..f8490d94e323 100644
--- a/net/tipc/subscr.c
+++ b/net/tipc/subscr.c
@@ -105,7 +105,7 @@ void tipc_sub_report_overlap(struct tipc_subscription *sub,
 
 static void tipc_sub_timeout(struct timer_list *t)
 {
-	struct tipc_subscription *sub = from_timer(sub, t, timer);
+	struct tipc_subscription *sub = timer_container_of(sub, t, timer);
 
 	spin_lock(&sub->lock);
 	tipc_sub_send_event(sub, NULL, TIPC_SUBSCR_TIMEOUT);
diff --git a/net/wireless/core.c b/net/wireless/core.c
index dcce326fdb8c..5c3c72df0591 100644
--- a/net/wireless/core.c
+++ b/net/wireless/core.c
@@ -1709,7 +1709,7 @@ EXPORT_SYMBOL_GPL(wiphy_work_flush);
 
 void wiphy_delayed_work_timer(struct timer_list *t)
 {
-	struct wiphy_delayed_work *dwork = from_timer(dwork, t, timer);
+	struct wiphy_delayed_work *dwork = timer_container_of(dwork, t, timer);
 
 	wiphy_work_queue(dwork->wiphy, &dwork->work);
 }
diff --git a/net/x25/af_x25.c b/net/x25/af_x25.c
index 8dda4178497c..1f8ae9f4a3f1 100644
--- a/net/x25/af_x25.c
+++ b/net/x25/af_x25.c
@@ -359,7 +359,7 @@ static void __x25_destroy_socket(struct sock *);
  */
 static void x25_destroy_timer(struct timer_list *t)
 {
-	struct sock *sk = from_timer(sk, t, sk_timer);
+	struct sock *sk = timer_container_of(sk, t, sk_timer);
 
 	x25_destroy_socket_from_timer(sk);
 }
diff --git a/net/x25/x25_link.c b/net/x25/x25_link.c
index 37b190499405..4608aa5b4f31 100644
--- a/net/x25/x25_link.c
+++ b/net/x25/x25_link.c
@@ -46,7 +46,7 @@ static inline void x25_start_t20timer(struct x25_neigh *nb)
 
 static void x25_t20timer_expiry(struct timer_list *t)
 {
-	struct x25_neigh *nb = from_timer(nb, t, t20timer);
+	struct x25_neigh *nb = timer_container_of(nb, t, t20timer);
 
 	x25_transmit_restart_request(nb);
 
diff --git a/net/x25/x25_timer.c b/net/x25/x25_timer.c
index e4c5ad5b070f..2ec63a1f4c6d 100644
--- a/net/x25/x25_timer.c
+++ b/net/x25/x25_timer.c
@@ -89,7 +89,7 @@ unsigned long x25_display_timer(struct sock *sk)
 
 static void x25_heartbeat_expiry(struct timer_list *t)
 {
-	struct sock *sk = from_timer(sk, t, sk_timer);
+	struct sock *sk = timer_container_of(sk, t, sk_timer);
 
 	bh_lock_sock(sk);
 	if (sock_owned_by_user(sk)) /* can currently only occur in state 3 */
@@ -156,7 +156,7 @@ static inline void x25_do_timer_expiry(struct sock * sk)
 
 static void x25_timer_expiry(struct timer_list *t)
 {
-	struct x25_sock *x25 = from_timer(x25, t, timer);
+	struct x25_sock *x25 = timer_container_of(x25, t, timer);
 	struct sock *sk = &x25->sk;
 
 	bh_lock_sock(sk);
diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index 143ac3aa7537..59d0bd5e80ec 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -353,7 +353,7 @@ static inline unsigned long make_jiffies(long secs)
 
 static void xfrm_policy_timer(struct timer_list *t)
 {
-	struct xfrm_policy *xp = from_timer(xp, t, timer);
+	struct xfrm_policy *xp = timer_container_of(xp, t, timer);
 	time64_t now = ktime_get_real_seconds();
 	time64_t next = TIME64_MAX;
 	int warn = 0;
@@ -2895,7 +2895,7 @@ static void xfrm_policy_queue_process(struct timer_list *t)
 	struct sk_buff *skb;
 	struct sock *sk;
 	struct dst_entry *dst;
-	struct xfrm_policy *pol = from_timer(pol, t, polq.hold_timer);
+	struct xfrm_policy *pol = timer_container_of(pol, t, polq.hold_timer);
 	struct net *net = xp_net(pol);
 	struct xfrm_policy_queue *pq = &pol->polq;
 	struct flowi fl;
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 341d79ecb5c2..767ec3681de4 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -2689,7 +2689,7 @@ EXPORT_SYMBOL(xfrm_state_walk_done);
 
 static void xfrm_replay_timer_handler(struct timer_list *t)
 {
-	struct xfrm_state *x = from_timer(x, t, rtimer);
+	struct xfrm_state *x = timer_container_of(x, t, rtimer);
 
 	spin_lock(&x->lock);
 
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 1de4b90fd4d1..5bf5bddfd82a 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1118,7 +1118,7 @@ struct snd_timer_system_private {
 
 static void snd_timer_s_function(struct timer_list *t)
 {
-	struct snd_timer_system_private *priv = from_timer(priv, t,
+	struct snd_timer_system_private *priv = timer_container_of(priv, t,
 								tlist);
 	struct snd_timer *timer = priv->snd_timer;
 	unsigned long jiff = jiffies;
diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 4b02ec127cc0..6c318a5903ab 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -699,7 +699,7 @@ static unsigned int loopback_jiffies_timer_pos_update
 
 static void loopback_jiffies_timer_function(struct timer_list *t)
 {
-	struct loopback_pcm *dpcm = from_timer(dpcm, t, timer);
+	struct loopback_pcm *dpcm = timer_container_of(dpcm, t, timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&dpcm->cable->lock, flags);
diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 1d923cbe8cd0..783fe3a22bc9 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -301,7 +301,7 @@ static int dummy_systimer_prepare(struct snd_pcm_substream *substream)
 
 static void dummy_systimer_callback(struct timer_list *t)
 {
-	struct dummy_systimer_pcm *dpcm = from_timer(dpcm, t, timer);
+	struct dummy_systimer_pcm *dpcm = timer_container_of(dpcm, t, timer);
 	unsigned long flags;
 	int elapsed = 0;
 
diff --git a/sound/drivers/mpu401/mpu401_uart.c b/sound/drivers/mpu401/mpu401_uart.c
index a63e7558ac07..670f8ba92c08 100644
--- a/sound/drivers/mpu401/mpu401_uart.c
+++ b/sound/drivers/mpu401/mpu401_uart.c
@@ -157,7 +157,7 @@ EXPORT_SYMBOL(snd_mpu401_uart_interrupt_tx);
  */
 static void snd_mpu401_uart_timer(struct timer_list *t)
 {
-	struct snd_mpu401 *mpu = from_timer(mpu, t, timer);
+	struct snd_mpu401 *mpu = timer_container_of(mpu, t, timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&mpu->timer_lock, flags);
diff --git a/sound/drivers/mtpav.c b/sound/drivers/mtpav.c
index dffcdf9e10d4..851f34e2cdd0 100644
--- a/sound/drivers/mtpav.c
+++ b/sound/drivers/mtpav.c
@@ -388,7 +388,7 @@ static void snd_mtpav_input_trigger(struct snd_rawmidi_substream *substream, int
 static void snd_mtpav_output_timer(struct timer_list *t)
 {
 	unsigned long flags;
-	struct mtpav *chip = from_timer(chip, t, timer);
+	struct mtpav *chip = timer_container_of(chip, t, timer);
 	int p;
 
 	spin_lock_irqsave(&chip->spinlock, flags);
diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
index 9bee454441b0..de7449cb6515 100644
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -233,7 +233,7 @@ static int opl3_get_voice(struct snd_opl3 *opl3, int instr_4op,
 void snd_opl3_timer_func(struct timer_list *t)
 {
 
-	struct snd_opl3 *opl3 = from_timer(opl3, t, tlist);
+	struct snd_opl3 *opl3 = timer_container_of(opl3, t, tlist);
 	unsigned long flags;
 	int again = 0;
 	int i;
diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 72378f354fd0..39f1e1fe4c44 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -345,7 +345,7 @@ static void timer_timeout(struct timer_list *data)
 	struct pcmtst_buf_iter *v_iter;
 	struct snd_pcm_substream *substream;
 
-	v_iter = from_timer(v_iter, data, timer_instance);
+	v_iter = timer_container_of(v_iter, data, timer_instance);
 	substream = v_iter->substream;
 
 	if (v_iter->suspend)
diff --git a/sound/drivers/serial-u16550.c b/sound/drivers/serial-u16550.c
index 1857a78f55d7..6d0656fcd574 100644
--- a/sound/drivers/serial-u16550.c
+++ b/sound/drivers/serial-u16550.c
@@ -299,7 +299,7 @@ static void snd_uart16550_buffer_timer(struct timer_list *t)
 	unsigned long flags;
 	struct snd_uart16550 *uart;
 
-	uart = from_timer(uart, t, buffer_timer);
+	uart = timer_container_of(uart, t, buffer_timer);
 	spin_lock_irqsave(&uart->open_lock, flags);
 	snd_uart16550_del_timer(uart);
 	snd_uart16550_io_loop(uart);
diff --git a/sound/i2c/other/ak4117.c b/sound/i2c/other/ak4117.c
index 657b331d7a79..cd380db195ef 100644
--- a/sound/i2c/other/ak4117.c
+++ b/sound/i2c/other/ak4117.c
@@ -504,7 +504,7 @@ int snd_ak4117_check_rate_and_errors(struct ak4117 *ak4117, unsigned int flags)
 
 static void snd_ak4117_timer(struct timer_list *t)
 {
-	struct ak4117 *chip = from_timer(chip, t, timer);
+	struct ak4117 *chip = timer_container_of(chip, t, timer);
 
 	if (chip->init)
 		return;
diff --git a/sound/isa/sb/emu8000_pcm.c b/sound/isa/sb/emu8000_pcm.c
index 016235209928..215bbcd0360e 100644
--- a/sound/isa/sb/emu8000_pcm.c
+++ b/sound/isa/sb/emu8000_pcm.c
@@ -182,7 +182,7 @@ static inline int emu8k_get_curpos(struct snd_emu8k_pcm *rec, int ch)
  */
 static void emu8k_pcm_timer_func(struct timer_list *t)
 {
-	struct snd_emu8k_pcm *rec = from_timer(rec, t, timer);
+	struct snd_emu8k_pcm *rec = timer_container_of(rec, t, timer);
 	int ptr, delta;
 
 	spin_lock(&rec->timer_lock);
diff --git a/sound/isa/sb/sb8_midi.c b/sound/isa/sb/sb8_midi.c
index d2908fc280f8..25caf23273bc 100644
--- a/sound/isa/sb/sb8_midi.c
+++ b/sound/isa/sb/sb8_midi.c
@@ -199,7 +199,7 @@ static void snd_sb8dsp_midi_output_write(struct snd_rawmidi_substream *substream
 
 static void snd_sb8dsp_midi_output_timer(struct timer_list *t)
 {
-	struct snd_sb *chip = from_timer(chip, t, midi_timer);
+	struct snd_sb *chip = timer_container_of(chip, t, midi_timer);
 	struct snd_rawmidi_substream *substream = chip->midi_substream_output;
 	unsigned long flags;
 
diff --git a/sound/isa/wavefront/wavefront_midi.c b/sound/isa/wavefront/wavefront_midi.c
index fcc2a0d67792..494b21be665c 100644
--- a/sound/isa/wavefront/wavefront_midi.c
+++ b/sound/isa/wavefront/wavefront_midi.c
@@ -352,7 +352,7 @@ static void snd_wavefront_midi_input_trigger(struct snd_rawmidi_substream *subst
 
 static void snd_wavefront_midi_output_timer(struct timer_list *t)
 {
-	snd_wavefront_midi_t *midi = from_timer(midi, t, timer);
+	snd_wavefront_midi_t *midi = timer_container_of(midi, t, timer);
 	snd_wavefront_card_t *card = midi->timer_card;
 	unsigned long flags;
 	
diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 65100f925b72..0fcb416c26cb 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -709,7 +709,7 @@ static inline unsigned int modulo_min(unsigned int a, unsigned int b,
 */
 static void snd_card_asihpi_timer_function(struct timer_list *t)
 {
-	struct snd_card_asihpi_pcm *dpcm = from_timer(dpcm, t, timer);
+	struct snd_card_asihpi_pcm *dpcm = timer_container_of(dpcm, t, timer);
 	struct snd_pcm_substream *substream = dpcm->substream;
 	struct snd_card_asihpi *card = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime;
diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
index 89e47fa14f70..56bf567d98b1 100644
--- a/sound/pci/ctxfi/cttimer.c
+++ b/sound/pci/ctxfi/cttimer.c
@@ -62,7 +62,7 @@ struct ct_timer {
 
 static void ct_systimer_callback(struct timer_list *t)
 {
-	struct ct_timer_instance *ti = from_timer(ti, t, timer);
+	struct ct_timer_instance *ti = timer_container_of(ti, t, timer);
 	struct snd_pcm_substream *substream = ti->substream;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct ct_atc_pcm *apcm = ti->apcm;
diff --git a/sound/pci/echoaudio/midi.c b/sound/pci/echoaudio/midi.c
index 2ef59184249c..c3f3c9129561 100644
--- a/sound/pci/echoaudio/midi.c
+++ b/sound/pci/echoaudio/midi.c
@@ -200,7 +200,7 @@ static int snd_echo_midi_output_open(struct snd_rawmidi_substream *substream)
 
 static void snd_echo_midi_output_write(struct timer_list *t)
 {
-	struct echoaudio *chip = from_timer(chip, t, timer);
+	struct echoaudio *chip = timer_container_of(chip, t, timer);
 	unsigned long flags;
 	int bytes, sent, time;
 	unsigned char buf[MIDI_OUT_BUFFER_SIZE - 1];
diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 49b71082c485..aef44a88d545 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -586,7 +586,7 @@ static void snd_korg1212_SendStopAndWait(struct snd_korg1212 *korg1212)
 /* timer callback for checking the ack of stop request */
 static void snd_korg1212_timer_func(struct timer_list *t)
 {
-	struct snd_korg1212 *korg1212 = from_timer(korg1212, t, timer);
+	struct snd_korg1212 *korg1212 = timer_container_of(korg1212, t, timer);
 	unsigned long flags;
 	
 	spin_lock_irqsave(&korg1212->lock, flags);
diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index dc326face54a..e4b059000def 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -1393,7 +1393,7 @@ static void snd_hdsp_midi_input_trigger(struct snd_rawmidi_substream *substream,
 
 static void snd_hdsp_midi_output_timer(struct timer_list *t)
 {
-	struct hdsp_midi *hmidi = from_timer(hmidi, t, timer);
+	struct hdsp_midi *hmidi = timer_container_of(hmidi, t, timer);
 	unsigned long flags;
 
 	snd_hdsp_midi_output_write(hmidi);
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 1935de046f00..bcf068e95fda 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -1943,7 +1943,7 @@ snd_hdspm_midi_input_trigger(struct snd_rawmidi_substream *substream, int up)
 
 static void snd_hdspm_midi_output_timer(struct timer_list *t)
 {
-	struct hdspm_midi *hmidi = from_timer(hmidi, t, timer);
+	struct hdspm_midi *hmidi = timer_container_of(hmidi, t, timer);
 	unsigned long flags;
 
 	snd_hdspm_midi_output_write(hmidi);
diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 5a93f4587356..b0f8f1d083e0 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -284,7 +284,7 @@ static void run_spu_dma(struct work_struct *work)
 
 static void aica_period_elapsed(struct timer_list *t)
 {
-	struct snd_card_aica *dreamcastcard = from_timer(dreamcastcard,
+	struct snd_card_aica *dreamcastcard = timer_container_of(dreamcastcard,
 							      t, timer);
 	struct snd_pcm_substream *substream = dreamcastcard->substream;
 	/*timer function - so cannot sleep */
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index dba78efadc85..7d1d8773c76d 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3439,7 +3439,7 @@ static irqreturn_t rt5645_irq(int irq, void *data)
 
 static void rt5645_btn_check_callback(struct timer_list *t)
 {
-	struct rt5645_priv *rt5645 = from_timer(rt5645, t, btn_check_timer);
+	struct rt5645_priv *rt5645 = timer_container_of(rt5645, t, btn_check_timer);
 
 	queue_delayed_work(system_power_efficient_wq,
 		   &rt5645->jack_detect_work, msecs_to_jiffies(5));
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index de5f87600fac..ea445a6191ed 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -209,7 +209,7 @@ static snd_pcm_uframes_t imx_rpmsg_pcm_pointer(struct snd_soc_component *compone
 static void imx_rpmsg_timer_callback(struct timer_list *t)
 {
 	struct stream_timer  *stream_timer =
-			from_timer(stream_timer, t, timer);
+			timer_container_of(stream_timer, t, timer);
 	struct snd_pcm_substream *substream = stream_timer->substream;
 	struct rpmsg_info *info = stream_timer->info;
 	struct rpmsg_msg *msg;
diff --git a/sound/synth/emux/emux_synth.c b/sound/synth/emux/emux_synth.c
index 02e2c69d7f18..cff6aba9bfc3 100644
--- a/sound/synth/emux/emux_synth.c
+++ b/sound/synth/emux/emux_synth.c
@@ -190,7 +190,7 @@ snd_emux_note_off(void *p, int note, int vel, struct snd_midi_channel *chan)
  */
 void snd_emux_timer_callback(struct timer_list *t)
 {
-	struct snd_emux *emu = from_timer(emu, t, tlist);
+	struct snd_emux *emu = timer_container_of(emu, t, tlist);
 	struct snd_emux_voice *vp;
 	unsigned long flags;
 	int ch, do_again = 0;
diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index dcdd7e9e1ae9..a231b3f51f90 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -339,7 +339,7 @@ static void snd_usbmidi_out_work(struct work_struct *work)
 /* called after transfers had been interrupted due to some USB error */
 static void snd_usbmidi_error_timer(struct timer_list *t)
 {
-	struct snd_usb_midi *umidi = from_timer(umidi, t, error_timer);
+	struct snd_usb_midi *umidi = timer_container_of(umidi, t, error_timer);
 	unsigned int i, j;
 
 	spin_lock(&umidi->disc_lock);
diff --git a/tools/sched_ext/scx_qmap.bpf.c b/tools/sched_ext/scx_qmap.bpf.c
index 26c40ca4f36c..096ef358ad67 100644
--- a/tools/sched_ext/scx_qmap.bpf.c
+++ b/tools/sched_ext/scx_qmap.bpf.c
@@ -303,7 +303,7 @@ static void update_core_sched_head_seq(struct task_struct *p)
  * non-rq-lock holding BPF programs. As demonstration, this function is called
  * from qmap_dispatch() and monitor_timerfn().
  */
-static bool dispatch_highpri(bool from_timer)
+static bool dispatch_highpri(bool timer_container_of)
 {
 	struct task_struct *p;
 	s32 this_cpu = bpf_get_smp_processor_id();
@@ -349,7 +349,7 @@ static bool dispatch_highpri(bool from_timer)
 			} else {
 				__sync_fetch_and_add(&nr_expedited_remote, 1);
 			}
-			if (from_timer)
+			if (timer_container_of)
 				__sync_fetch_and_add(&nr_expedited_from_timer, 1);
 		} else {
 			__sync_fetch_and_add(&nr_expedited_lost, 1);
-- 
2.45.2

