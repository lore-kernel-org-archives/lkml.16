Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FAA2B9AA
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746640425; cv=none; b=AxmRnrKW9BLUTSbaszFSQDOLTcP/GA6m54Jkg0TKxb26gPVdgD1O3yKv/8GiKnyfGXBj+b53byC0Uw6+kJUe7XJUXmh98MVb+8//v5151k+SZ1SMoMT+/jDnOD5nDlV5dseluOr/IcckesVMVyB7SSCuvCrtPZXOD8PVQEvC1yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746640425; c=relaxed/simple;
	bh=RsaEcqXPTxHpKv3vzO5oL5mgM877L3WWzCkJWBPBXsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pBS8jaQGpyXwcXYfRyaE5/boFwlhJsTfKsE1iFtVa7SYJDd2lFbW+mXsaHLZxUlw2InlGbHSavqRg+6uq2pVBGP8Z1qpYZZ4+vfRmPyJwVNwOErir5EpIcXcNL2zQ+VlKXGzRkWoG5fYqaMOymMVaThKQ+gt8TEaWrko1SRt2Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkI5k7Gi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkI5k7Gi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5510C4CEE2;
	Wed,  7 May 2025 17:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746640423;
	bh=RsaEcqXPTxHpKv3vzO5oL5mgM877L3WWzCkJWBPBXsY=;
	h=From:To:Cc:Subject:Date:From;
	b=FkI5k7Gia5IAO41EiF5DBghOPS//afApMqwz+C67MrrMT7EHAXx7HksRSBG0SD0Wo
	 OIp4W1xLpbuxf+4N3yvUijdo57Pu+A8f9kEK76rs76sN2ZncpsVCCWOXB5MzlO/bRm
	 qQu3ebGntSw2W6c1cWOwkNdT8N/136/dCSWswaGk/ESLsTUo65hDFcOnkKekWxC6Jd
	 yk7pUYff2loHtWqunRad5BJ546a9WpOgD7fE7ZPXwxaFnxY+XF/CEs712BN4CTrbDp
	 ZC36bMg86TvC4mRfs5hJeNAgXpzlwX7p4GHc0HQRDe3hoMkEZYcDsUAx6c2jMQNzFR
	 jS6JgWGzGpbgg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH -v2 00/10] timers: Simple cleanup of the timer API namespace
Date: Wed,  7 May 2025 19:53:28 +0200
Message-ID: <20250507175338.672442-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in -v3:

  - Picked up review tags
  - Rebased to v6.15-rc5

Changes in -v2:

  - Exclude the 6 APIs that need further work, keep 9 APIs/symbols
  - timer_init_on_stack_key() -> timer_init_key_on_stack()
  - Fixes
  - Rebase to v6.15-rc2

Continue the simplified timer API namespace cleanup that begun with:

  8fa7292fee5c treewide: Switch/rename to timer_delete[_sync]()

The Git tree for these changes can be found in my tree at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.timers/core

Light testing done so far.

Thanks,

	Ingo

================>
Ingo Molnar (10):
  rust: Rename timer_container_of() to hrtimer_container_of()
  timers: Rename init_timer_key() => timer_init_key()
  timers: Rename init_timer_on_stack_key() => timer_init_key_on_stack()
  timers: Rename __init_timer() => __timer_init()
  timers: Rename __init_timer_on_stack() => __timer_init_on_stack()
  timers: Rename NEXT_TIMER_MAX_DELTA => TIMER_NEXT_MAX_DELTA
  timers: Rename init_timers() => timers_init()
  treewide, timers: Rename try_to_del_timer_sync() => timer_delete_sync_try()
  treewide, timers: Rename destroy_timer_on_stack() => timer_destroy_on_stack()
  treewide, timers: Rename from_timer() => timer_container_of()

 arch/alpha/kernel/srmcons.c                        |  2 +-
 arch/powerpc/kvm/booke.c                           | 10 ++---
 arch/powerpc/platforms/powermac/low_i2c.c          |  2 +-
 arch/sh/drivers/heartbeat.c                        |  2 +-
 arch/sh/drivers/pci/common.c                       |  4 +-
 arch/sh/drivers/push-switch.c                      |  2 +-
 arch/sparc/kernel/viohs.c                          |  2 +-
 arch/um/drivers/vector_kern.c                      |  2 +-
 arch/x86/kernel/apic/vector.c                      |  2 +-
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
 drivers/atm/idt77252.c                             |  4 +-
 drivers/atm/lanai.c                                |  2 +-
 drivers/auxdisplay/line-display.c                  |  2 +-
 drivers/base/power/main.c                          |  4 +-
 drivers/base/power/wakeup.c                        |  2 +-
 drivers/block/aoe/aoecmd.c                         |  2 +-
 drivers/block/aoe/aoedev.c                         |  2 +-
 drivers/block/drbd/drbd_main.c                     |  2 +-
 drivers/block/drbd/drbd_req.c                      |  2 +-
 drivers/block/drbd/drbd_worker.c                   |  4 +-
 drivers/block/swim3.c                              |  8 ++--
 drivers/bluetooth/bluecard_cs.c                    |  2 +-
 drivers/bluetooth/btnxpuart.c                      |  2 +-
 drivers/bluetooth/hci_bcsp.c                       |  2 +-
 drivers/bluetooth/hci_h5.c                         |  2 +-
 drivers/bluetooth/hci_qca.c                        |  4 +-
 drivers/bus/mhi/host/pci_generic.c                 |  2 +-
 drivers/char/hw_random/xgene-rng.c                 |  2 +-
 drivers/char/ipmi/bt-bmc.c                         |  2 +-
 drivers/char/ipmi/ipmi_si_intf.c                   |  2 +-
 drivers/char/ipmi/ipmi_ssif.c                      |  4 +-
 drivers/char/ipmi/ssif_bmc.c                       |  2 +-
 drivers/char/random.c                              |  6 +--
 drivers/char/tpm/tpm-dev-common.c                  |  2 +-
 drivers/comedi/drivers/comedi_test.c               |  4 +-
 drivers/comedi/drivers/das16.c                     |  2 +-
 drivers/comedi/drivers/jr3_pci.c                   |  2 +-
 drivers/cpufreq/powernv-cpufreq.c                  |  2 +-
 drivers/crypto/axis/artpec6_crypto.c               |  2 +-
 drivers/dma-buf/st-dma-fence.c                     |  4 +-
 drivers/dma/imx-dma.c                              |  2 +-
 drivers/dma/ioat/dma.c                             |  2 +-
 drivers/firewire/core-transaction.c                |  4 +-
 drivers/firmware/psci/psci_checker.c               |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |  2 +-
 drivers/gpu/drm/bridge/tda998x_drv.c               |  2 +-
 drivers/gpu/drm/drm_vblank.c                       |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  2 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |  4 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  2 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |  2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |  4 +-
 drivers/gpu/drm/i915/i915_sw_fence.c               |  2 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |  2 +-
 drivers/gpu/drm/i915/selftests/lib_sw_fence.c      |  4 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |  4 +-
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
 drivers/hsi/clients/ssi_protocol.c                 |  6 +--
 drivers/hwmon/npcm750-pwm-fan.c                    |  2 +-
 drivers/hwmon/pwm-fan.c                            |  2 +-
 drivers/i2c/busses/i2c-img-scb.c                   |  2 +-
 drivers/iio/common/ssp_sensors/ssp_dev.c           |  2 +-
 drivers/infiniband/hw/cxgb4/cm.c                   |  2 +-
 drivers/infiniband/hw/hfi1/aspm.c                  |  2 +-
 drivers/infiniband/hw/hfi1/chip.c                  |  4 +-
 drivers/infiniband/hw/hfi1/driver.c                |  2 +-
 drivers/infiniband/hw/hfi1/mad.c                   |  2 +-
 drivers/infiniband/hw/hfi1/sdma.c                  |  2 +-
 drivers/infiniband/hw/hfi1/tid_rdma.c              |  4 +-
 drivers/infiniband/hw/hfi1/verbs.c                 |  2 +-
 drivers/infiniband/hw/irdma/cm.c                   |  2 +-
 drivers/infiniband/hw/irdma/utils.c                |  4 +-
 drivers/infiniband/hw/mlx5/mr.c                    |  2 +-
 drivers/infiniband/hw/mthca/mthca_catas.c          |  2 +-
 drivers/infiniband/hw/qib/qib_driver.c             |  2 +-
 drivers/infiniband/hw/qib/qib_iba6120.c            |  4 +-
 drivers/infiniband/hw/qib/qib_iba7220.c            |  4 +-
 drivers/infiniband/hw/qib/qib_iba7322.c            |  4 +-
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
 drivers/irqchip/irq-riscv-imsic-state.c            |  2 +-
 drivers/isdn/hardware/mISDN/hfcpci.c               |  2 +-
 drivers/isdn/hardware/mISDN/mISDNipac.c            |  2 +-
 drivers/isdn/hardware/mISDN/mISDNisar.c            |  2 +-
 drivers/isdn/hardware/mISDN/w6692.c                |  2 +-
 drivers/isdn/mISDN/dsp_tones.c                     |  2 +-
 drivers/isdn/mISDN/fsm.c                           |  2 +-
 drivers/isdn/mISDN/l1oip_core.c                    |  4 +-
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
 drivers/md/dm-writecache.c                         |  4 +-
 drivers/md/md.c                                    |  2 +-
 drivers/media/common/saa7146/saa7146_fops.c        |  2 +-
 drivers/media/common/saa7146/saa7146_vbi.c         |  2 +-
 drivers/media/dvb-core/dmxdev.c                    |  2 +-
 drivers/media/i2c/tc358743.c                       |  2 +-
 drivers/media/i2c/tvaudio.c                        |  2 +-
 drivers/media/pci/bt8xx/bttv-driver.c              |  2 +-
 drivers/media/pci/bt8xx/bttv-input.c               |  4 +-
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
 drivers/media/rc/img-ir/img-ir-hw.c                |  4 +-
 drivers/media/rc/img-ir/img-ir-raw.c               |  2 +-
 drivers/media/rc/imon.c                            |  2 +-
 drivers/media/rc/ir-mce_kbd-decoder.c              |  2 +-
 drivers/media/rc/rc-ir-raw.c                       |  2 +-
 drivers/media/rc/rc-main.c                         |  4 +-
 drivers/media/usb/au0828/au0828-dvb.c              |  2 +-
 drivers/media/usb/au0828/au0828-video.c            |  4 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            | 12 +++---
 drivers/media/usb/s2255/s2255drv.c                 |  2 +-
 drivers/memory/tegra/tegra210-emc-core.c           |  4 +-
 drivers/memstick/core/ms_block.c                   |  2 +-
 drivers/memstick/host/jmb38x_ms.c                  |  2 +-
 drivers/memstick/host/r592.c                       |  2 +-
 drivers/memstick/host/tifm_ms.c                    |  2 +-
 drivers/misc/bcm-vk/bcm_vk_tty.c                   |  2 +-
 drivers/misc/cardreader/rtsx_usb.c                 |  2 +-
 drivers/misc/sgi-xp/xpc_main.c                     |  2 +-
 drivers/misc/sgi-xp/xpc_partition.c                |  4 +-
 drivers/mmc/core/host.c                            |  2 +-
 drivers/mmc/host/atmel-mci.c                       |  4 +-
 drivers/mmc/host/dw_mmc.c                          |  6 +--
 drivers/mmc/host/jz4740_mmc.c                      |  2 +-
 drivers/mmc/host/meson-mx-sdio.c                   |  2 +-
 drivers/mmc/host/mvsdio.c                          |  2 +-
 drivers/mmc/host/mxcmmc.c                          |  2 +-
 drivers/mmc/host/omap.c                            |  6 +--
 drivers/mmc/host/sdhci.c                           |  4 +-
 drivers/mmc/host/tifm_sd.c                         |  2 +-
 drivers/mmc/host/via-sdmmc.c                       |  2 +-
 drivers/mmc/host/vub300.c                          |  4 +-
 drivers/mmc/host/wbsd.c                            |  2 +-
 drivers/most/most_usb.c                            |  2 +-
 drivers/mtd/sm_ftl.c                               |  2 +-
 drivers/net/arcnet/arcnet.c                        |  2 +-
 drivers/net/can/grcan.c                            |  4 +-
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
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c           |  4 +-
 drivers/net/ethernet/apple/bmac.c                  |  2 +-
 drivers/net/ethernet/apple/mace.c                  |  2 +-
 drivers/net/ethernet/aquantia/atlantic/aq_nic.c    |  4 +-
 drivers/net/ethernet/atheros/ag71xx.c              |  2 +-
 drivers/net/ethernet/atheros/atl1c/atl1c_main.c    |  2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_main.c    |  2 +-
 drivers/net/ethernet/atheros/atlx/atl1.c           |  2 +-
 drivers/net/ethernet/atheros/atlx/atl2.c           |  4 +-
 drivers/net/ethernet/broadcom/b44.c                |  2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.c       |  4 +-
 drivers/net/ethernet/broadcom/bnx2.c               |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c   |  2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |  2 +-
 drivers/net/ethernet/broadcom/tg3.c                |  2 +-
 drivers/net/ethernet/brocade/bna/bnad.c            | 12 +++---
 drivers/net/ethernet/chelsio/cxgb/sge.c            |  6 +--
 drivers/net/ethernet/chelsio/cxgb3/sge.c           |  4 +-
 .../net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c   |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c           |  4 +-
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c         |  4 +-
 drivers/net/ethernet/cisco/enic/enic_clsf.c        |  2 +-
 drivers/net/ethernet/cisco/enic/enic_main.c        |  2 +-
 drivers/net/ethernet/dec/tulip/de2104x.c           |  4 +-
 drivers/net/ethernet/dec/tulip/dmfe.c              |  2 +-
 drivers/net/ethernet/dec/tulip/interrupt.c         |  2 +-
 drivers/net/ethernet/dec/tulip/pnic.c              |  2 +-
 drivers/net/ethernet/dec/tulip/pnic2.c             |  2 +-
 drivers/net/ethernet/dec/tulip/timer.c             |  4 +-
 drivers/net/ethernet/dec/tulip/tulip_core.c        |  2 +-
 drivers/net/ethernet/dec/tulip/uli526x.c           |  2 +-
 drivers/net/ethernet/dec/tulip/winbond-840.c       |  2 +-
 drivers/net/ethernet/dlink/dl2k.c                  |  2 +-
 drivers/net/ethernet/fealnx.c                      |  4 +-
 drivers/net/ethernet/google/gve/gve_main.c         |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c      |  2 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |  2 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |  2 +-
 drivers/net/ethernet/intel/e100.c                  |  2 +-
 drivers/net/ethernet/intel/e1000e/netdev.c         |  4 +-
 drivers/net/ethernet/intel/fm10k/fm10k_pci.c       |  2 +-
 drivers/net/ethernet/intel/i40e/i40e_main.c        |  2 +-
 drivers/net/ethernet/intel/ice/ice_main.c          |  2 +-
 drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c |  2 +-
 drivers/net/ethernet/intel/igb/igb_main.c          |  4 +-
 drivers/net/ethernet/intel/igbvf/netdev.c          |  2 +-
 drivers/net/ethernet/intel/igc/igc_main.c          |  4 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c      |  2 +-
 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c  |  2 +-
 drivers/net/ethernet/korina.c                      |  2 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c         |  4 +-
 drivers/net/ethernet/marvell/pxa168_eth.c          |  2 +-
 drivers/net/ethernet/marvell/skge.c                |  2 +-
 drivers/net/ethernet/marvell/sky2.c                |  2 +-
 drivers/net/ethernet/mellanox/mlx4/catas.c         |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/health.c   |  2 +-
 drivers/net/ethernet/micrel/ksz884x.c              |  4 +-
 drivers/net/ethernet/myricom/myri10ge/myri10ge.c   |  2 +-
 drivers/net/ethernet/natsemi/natsemi.c             |  2 +-
 drivers/net/ethernet/natsemi/ns83820.c             |  2 +-
 drivers/net/ethernet/neterion/s2io.c               |  2 +-
 .../net/ethernet/netronome/nfp/nfp_net_common.c    |  2 +-
 drivers/net/ethernet/nvidia/forcedeth.c            |  6 +--
 .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   |  2 +-
 drivers/net/ethernet/packetengines/hamachi.c       |  2 +-
 drivers/net/ethernet/packetengines/yellowfin.c     |  2 +-
 drivers/net/ethernet/pasemi/pasemi_mac.c           |  2 +-
 drivers/net/ethernet/pensando/ionic/ionic_dev.c    |  2 +-
 drivers/net/ethernet/qlogic/qla3xxx.c              |  2 +-
 drivers/net/ethernet/realtek/atp.c                 |  2 +-
 drivers/net/ethernet/rocker/rocker_ofdpa.c         |  2 +-
 drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c    |  4 +-
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
 drivers/net/ethernet/ti/tlan.c                     |  4 +-
 drivers/net/ethernet/tundra/tsi108_eth.c           |  2 +-
 drivers/net/fddi/defza.c                           |  2 +-
 drivers/net/hamradio/6pack.c                       |  4 +-
 drivers/net/hamradio/scc.c                         | 14 +++----
 drivers/net/hippi/rrunner.c                        |  2 +-
 drivers/net/ntb_netdev.c                           |  2 +-
 drivers/net/slip/slip.c                            |  4 +-
 drivers/net/tun.c                                  |  2 +-
 drivers/net/usb/catc.c                             |  2 +-
 drivers/net/usb/lan78xx.c                          |  2 +-
 drivers/net/usb/sierra_net.c                       |  2 +-
 drivers/net/usb/usbnet.c                           |  2 +-
 drivers/net/vxlan/vxlan_core.c                     |  2 +-
 drivers/net/wan/hdlc_cisco.c                       |  2 +-
 drivers/net/wan/hdlc_fr.c                          |  2 +-
 drivers/net/wan/hdlc_ppp.c                         |  2 +-
 drivers/net/wireguard/timers.c                     | 10 ++---
 drivers/net/wireless/ath/ar5523/ar5523.c           |  2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c           |  2 +-
 drivers/net/wireless/ath/ath10k/pci.c              |  4 +-
 drivers/net/wireless/ath/ath10k/sdio.c             |  2 +-
 drivers/net/wireless/ath/ath10k/snoc.c             |  2 +-
 drivers/net/wireless/ath/ath11k/ce.c               |  2 +-
 drivers/net/wireless/ath/ath11k/dp.c               |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c            |  4 +-
 drivers/net/wireless/ath/ath12k/ce.c               |  2 +-
 drivers/net/wireless/ath/ath12k/dp.c               |  2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |  2 +-
 drivers/net/wireless/ath/ath6kl/main.c             |  2 +-
 drivers/net/wireless/ath/ath6kl/recovery.c         |  2 +-
 drivers/net/wireless/ath/ath6kl/txrx.c             |  2 +-
 drivers/net/wireless/ath/ath6kl/wmi.c              |  2 +-
 drivers/net/wireless/ath/ath9k/channel.c           |  4 +-
 drivers/net/wireless/ath/ath9k/gpio.c              |  4 +-
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c      |  2 +-
 drivers/net/wireless/ath/ath9k/link.c              |  2 +-
 drivers/net/wireless/ath/ath9k/main.c              |  2 +-
 drivers/net/wireless/ath/wcn36xx/dxe.c             |  2 +-
 drivers/net/wireless/ath/wil6210/netdev.c          |  6 +--
 .../wireless/broadcom/brcm80211/brcmfmac/btcoex.c  |  2 +-
 .../broadcom/brcm80211/brcmfmac/cfg80211.c         |  2 +-
 .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    |  2 +-
 .../wireless/broadcom/brcm80211/brcmfmac/sdio.c    |  2 +-
 drivers/net/wireless/intel/ipw2x00/libipw_crypto.c |  2 +-
 drivers/net/wireless/intel/iwlegacy/3945-rs.c      |  2 +-
 drivers/net/wireless/intel/iwlegacy/4965-mac.c     |  2 +-
 drivers/net/wireless/intel/iwlegacy/common.c       |  2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/main.c      |  4 +-
 drivers/net/wireless/intel/iwlwifi/dvm/tt.c        |  4 +-
 drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c   |  2 +-
 drivers/net/wireless/intel/iwlwifi/mld/agg.c       |  2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/sta.c       |  2 +-
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c       |  2 +-
 drivers/net/wireless/marvell/libertas/if_usb.c     |  2 +-
 drivers/net/wireless/marvell/libertas/main.c       |  4 +-
 drivers/net/wireless/marvell/libertas_tf/if_usb.c  |  2 +-
 drivers/net/wireless/marvell/libertas_tf/main.c    |  2 +-
 .../net/wireless/marvell/mwifiex/11n_rxreorder.c   |  2 +-
 drivers/net/wireless/marvell/mwifiex/cmdevt.c      |  2 +-
 drivers/net/wireless/marvell/mwifiex/init.c        |  2 +-
 drivers/net/wireless/marvell/mwifiex/tdls.c        |  2 +-
 drivers/net/wireless/marvell/mwifiex/usb.c         |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/main.c   |  2 +-
 drivers/net/wireless/mediatek/mt76/mt792x_core.c   |  4 +-
 drivers/net/wireless/microchip/wilc1000/hif.c      |  8 ++--
 drivers/net/wireless/purelifi/plfxlc/usb.c         |  4 +-
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
 drivers/nfc/st-nci/ndlc.c                          |  4 +-
 drivers/nfc/st-nci/se.c                            |  4 +-
 drivers/nfc/st21nfca/se.c                          |  4 +-
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
 drivers/s390/block/dasd.c                          |  4 +-
 drivers/s390/char/con3215.c                        |  2 +-
 drivers/s390/char/con3270.c                        |  2 +-
 drivers/s390/char/tape_core.c                      |  2 +-
 drivers/s390/char/tape_std.c                       |  2 +-
 drivers/s390/cio/device_fsm.c                      |  2 +-
 drivers/s390/cio/eadm_sch.c                        |  2 +-
 drivers/s390/crypto/ap_bus.c                       |  2 +-
 drivers/s390/net/fsm.c                             |  2 +-
 drivers/s390/net/qeth_core_main.c                  |  2 +-
 drivers/s390/scsi/zfcp_erp.c                       |  4 +-
 drivers/s390/scsi/zfcp_fsf.c                       |  2 +-
 drivers/s390/scsi/zfcp_qdio.c                      |  2 +-
 drivers/scsi/aic7xxx/aic79xx_core.c                |  2 +-
 drivers/scsi/aic94xx/aic94xx_scb.c                 |  2 +-
 drivers/scsi/aic94xx/aic94xx_tmf.c                 |  4 +-
 drivers/scsi/arcmsr/arcmsr_hba.c                   |  4 +-
 drivers/scsi/arm/fas216.c                          |  2 +-
 drivers/scsi/be2iscsi/be_main.c                    |  4 +-
 drivers/scsi/bfa/bfad.c                            |  2 +-
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c                  |  2 +-
 drivers/scsi/bnx2fc/bnx2fc_tgt.c                   |  4 +-
 drivers/scsi/bnx2i/bnx2i_hwi.c                     |  2 +-
 drivers/scsi/csiostor/csio_hw.c                    |  4 +-
 drivers/scsi/cxgbi/cxgb3i/cxgb3i.c                 |  2 +-
 drivers/scsi/cxgbi/cxgb4i/cxgb4i.c                 |  2 +-
 drivers/scsi/dc395x.c                              |  2 +-
 drivers/scsi/elx/efct/efct_xport.c                 |  2 +-
 drivers/scsi/elx/libefc/efc_els.c                  |  2 +-
 drivers/scsi/elx/libefc/efc_fabric.c               |  2 +-
 drivers/scsi/esas2r/esas2r_main.c                  |  2 +-
 drivers/scsi/fcoe/fcoe_ctlr.c                      |  2 +-
 drivers/scsi/fcoe/fcoe_transport.c                 |  2 +-
 drivers/scsi/fnic/fdls_disc.c                      |  6 +--
 drivers/scsi/fnic/fip.c                            |  8 ++--
 drivers/scsi/fnic/fnic_main.c                      |  2 +-
 drivers/scsi/hisi_sas/hisi_sas_main.c              |  2 +-
 drivers/scsi/hisi_sas/hisi_sas_v1_hw.c             |  2 +-
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c             |  6 +--
 drivers/scsi/ibmvscsi/ibmvfc.c                     |  4 +-
 drivers/scsi/ibmvscsi/ibmvscsi.c                   |  2 +-
 drivers/scsi/ipr.c                                 |  8 ++--
 drivers/scsi/isci/host.c                           |  6 +--
 drivers/scsi/isci/phy.c                            |  2 +-
 drivers/scsi/isci/port.c                           |  2 +-
 drivers/scsi/isci/port_config.c                    |  4 +-
 drivers/scsi/libfc/fc_fcp.c                        |  4 +-
 drivers/scsi/libiscsi.c                            |  4 +-
 drivers/scsi/libsas/sas_scsi_host.c                |  2 +-
 drivers/scsi/lpfc/lpfc_ct.c                        |  2 +-
 drivers/scsi/lpfc/lpfc_els.c                       |  6 +--
 drivers/scsi/lpfc/lpfc_hbadisc.c                   |  2 +-
 drivers/scsi/lpfc/lpfc_init.c                      |  8 ++--
 drivers/scsi/lpfc/lpfc_scsi.c                      |  2 +-
 drivers/scsi/lpfc/lpfc_sli.c                       |  6 +--
 drivers/scsi/megaraid/megaraid_mbox.c              |  4 +-
 drivers/scsi/megaraid/megaraid_mm.c                |  4 +-
 drivers/scsi/megaraid/megaraid_sas_base.c          |  2 +-
 drivers/scsi/mvsas/mv_sas.c                        |  2 +-
 drivers/scsi/ncr53c8xx.c                           |  2 +-
 drivers/scsi/pmcraid.c                             |  6 +--
 drivers/scsi/qla1280.c                             |  2 +-
 drivers/scsi/qla2xxx/qla_edif.c                    |  2 +-
 drivers/scsi/qla2xxx/qla_init.c                    |  2 +-
 drivers/scsi/qla2xxx/qla_os.c                      |  2 +-
 drivers/scsi/qla4xxx/ql4_os.c                      |  2 +-
 drivers/scsi/smartpqi/smartpqi_init.c              |  2 +-
 drivers/scsi/sym53c8xx_2/sym_glue.c                |  2 +-
 .../staging/gpib/agilent_82357a/agilent_82357a.c   |  2 +-
 drivers/staging/gpib/common/gpib_os.c              |  4 +-
 drivers/staging/gpib/common/iblib.c                |  4 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c          |  2 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c        |  2 +-
 drivers/staging/media/imx/imx-media-csi.c          |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c           |  8 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme.c          |  4 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c      |  8 ++--
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c       |  4 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c          |  4 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h   |  2 +-
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c      |  4 +-
 drivers/target/iscsi/iscsi_target_erl0.c           |  2 +-
 drivers/target/iscsi/iscsi_target_erl1.c           |  2 +-
 drivers/target/iscsi/iscsi_target_util.c           |  6 +--
 drivers/target/target_core_user.c                  |  4 +-
 drivers/tty/ipwireless/hardware.c                  |  2 +-
 drivers/tty/mips_ejtag_fdc.c                       |  2 +-
 drivers/tty/n_gsm.c                                |  8 ++--
 drivers/tty/serial/8250/8250_aspeed_vuart.c        |  2 +-
 drivers/tty/serial/8250/8250_core.c                |  4 +-
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
 drivers/tty/synclink_gt.c                          |  4 +-
 drivers/tty/sysrq.c                                |  2 +-
 drivers/tty/vcc.c                                  |  4 +-
 drivers/usb/atm/cxacru.c                           |  4 +-
 drivers/usb/atm/speedtch.c                         |  4 +-
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
 drivers/usb/host/r8a66597-hcd.c                    |  6 +--
 drivers/usb/host/sl811-hcd.c                       |  2 +-
 drivers/usb/host/uhci-q.c                          |  2 +-
 drivers/usb/host/xen-hcd.c                         |  2 +-
 drivers/usb/host/xhci.c                            |  2 +-
 drivers/usb/isp1760/isp1760-udc.c                  |  2 +-
 drivers/usb/misc/usbtest.c                         |  4 +-
 drivers/usb/musb/da8xx.c                           |  2 +-
 drivers/usb/musb/mpfs.c                            |  2 +-
 drivers/usb/musb/musb_core.c                       |  2 +-
 drivers/usb/musb/musb_dsps.c                       |  2 +-
 drivers/usb/musb/tusb6010.c                        |  2 +-
 drivers/usb/phy/phy-mv-usb.c                       |  2 +-
 drivers/usb/serial/garmin_gps.c                    |  2 +-
 drivers/usb/serial/mos7840.c                       |  4 +-
 drivers/usb/storage/realtek_cr.c                   |  2 +-
 drivers/usb/usbip/vudc_transfer.c                  |  2 +-
 drivers/video/fbdev/aty/radeon_base.c              |  2 +-
 drivers/virt/vboxguest/vboxguest_core.c            |  2 +-
 drivers/watchdog/at91sam9_wdt.c                    |  2 +-
 drivers/watchdog/bcm47xx_wdt.c                     |  2 +-
 drivers/watchdog/lpc18xx_wdt.c                     |  2 +-
 drivers/watchdog/shwdt.c                           |  2 +-
 fs/bcachefs/clock.c                                |  2 +-
 fs/dlm/lock.c                                      |  2 +-
 fs/ext4/super.c                                    |  2 +-
 fs/jbd2/journal.c                                  |  2 +-
 fs/nilfs2/segment.c                                |  2 +-
 fs/ocfs2/cluster/tcp.c                             |  2 +-
 include/linux/timer.h                              | 42 ++++++++++-----------
 include/linux/workqueue.h                          |  4 +-
 init/main.c                                        |  2 +-
 kernel/kcsan/kcsan_test.c                          |  2 +-
 kernel/kthread.c                                   |  2 +-
 kernel/rcu/rcutorture.c                            |  2 +-
 kernel/rcu/tasks.h                                 |  2 +-
 kernel/rcu/tree_nocb.h                             |  2 +-
 kernel/sched/psi.c                                 |  2 +-
 kernel/time/sleep_timeout.c                        |  4 +-
 kernel/time/timer.c                                | 36 +++++++++---------
 kernel/workqueue.c                                 |  8 ++--
 mm/page-writeback.c                                |  4 +-
 net/802/garp.c                                     |  2 +-
 net/802/mrp.c                                      |  4 +-
 net/appletalk/ddp.c                                |  2 +-
 net/atm/lec.c                                      |  4 +-
 net/ax25/af_ax25.c                                 |  2 +-
 net/ax25/ax25_ds_timer.c                           |  2 +-
 net/ax25/ax25_timer.c                              | 10 ++---
 net/batman-adv/tp_meter.c                          |  4 +-
 net/bluetooth/hidp/core.c                          |  2 +-
 net/bluetooth/rfcomm/core.c                        |  4 +-
 net/bridge/br_multicast.c                          | 44 +++++++++++-----------
 net/bridge/br_multicast_eht.c                      |  4 +-
 net/bridge/br_stp_timer.c                          | 12 +++---
 net/can/proc.c                                     |  2 +-
 net/core/drop_monitor.c                            |  2 +-
 net/core/gen_estimator.c                           |  2 +-
 net/core/neighbour.c                               |  4 +-
 net/dccp/ccids/ccid2.c                             |  2 +-
 net/dccp/ccids/ccid3.c                             |  2 +-
 net/dccp/timer.c                                   |  8 ++--
 net/hsr/hsr_device.c                               |  4 +-
 net/hsr/hsr_framereg.c                             |  4 +-
 net/ieee802154/6lowpan/reassembly.c                |  2 +-
 net/ipv4/igmp.c                                    |  6 +--
 net/ipv4/inet_connection_sock.c                    |  6 +--
 net/ipv4/inet_timewait_sock.c                      |  2 +-
 net/ipv4/ip_fragment.c                             |  2 +-
 net/ipv4/ipmr.c                                    |  2 +-
 net/ipv4/tcp_timer.c                               |  6 +--
 net/ipv6/addrconf.c                                |  2 +-
 net/ipv6/ip6_fib.c                                 |  2 +-
 net/ipv6/ip6mr.c                                   |  2 +-
 net/ipv6/netfilter/nf_conntrack_reasm.c            |  2 +-
 net/ipv6/reassembly.c                              |  2 +-
 net/lapb/lapb_timer.c                              |  4 +-
 net/llc/llc_c_ac.c                                 |  8 ++--
 net/mac80211/agg-rx.c                              |  4 +-
 net/mac80211/agg-tx.c                              |  4 +-
 net/mac80211/ibss.c                                |  2 +-
 net/mac80211/led.c                                 |  2 +-
 net/mac80211/mesh.c                                |  6 +--
 net/mac80211/mesh_hwmp.c                           |  2 +-
 net/mac80211/mesh_plink.c                          |  2 +-
 net/mac80211/mlme.c                                |  8 ++--
 net/mac80211/ocb.c                                 |  2 +-
 net/mac80211/sta_info.c                            |  2 +-
 net/mptcp/pm.c                                     |  2 +-
 net/mptcp/protocol.c                               |  4 +-
 net/ncsi/ncsi-manage.c                             |  4 +-
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
 net/netrom/nr_timer.c                              | 10 ++---
 net/nfc/core.c                                     |  2 +-
 net/nfc/hci/core.c                                 |  2 +-
 net/nfc/hci/llc_shdlc.c                            |  6 +--
 net/nfc/llcp_core.c                                |  4 +-
 net/nfc/nci/core.c                                 |  4 +-
 net/packet/af_packet.c                             |  2 +-
 net/rose/af_rose.c                                 |  2 +-
 net/rose/rose_link.c                               |  2 +-
 net/rose/rose_timer.c                              |  6 +--
 net/rxrpc/call_object.c                            |  2 +-
 net/sched/cls_flow.c                               |  2 +-
 net/sched/sch_fq_pie.c                             |  2 +-
 net/sched/sch_generic.c                            |  2 +-
 net/sched/sch_pie.c                                |  2 +-
 net/sched/sch_red.c                                |  2 +-
 net/sched/sch_sfq.c                                |  2 +-
 net/sctp/protocol.c                                |  2 +-
 net/sctp/sm_sideeffect.c                           | 24 ++++++------
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
 net/x25/x25_timer.c                                |  4 +-
 net/xfrm/xfrm_policy.c                             |  4 +-
 net/xfrm/xfrm_state.c                              |  2 +-
 rust/kernel/time/hrtimer.rs                        |  4 +-
 rust/kernel/time/hrtimer/arc.rs                    |  2 +-
 rust/kernel/time/hrtimer/pin.rs                    |  2 +-
 rust/kernel/time/hrtimer/pin_mut.rs                |  2 +-
 rust/kernel/time/hrtimer/tbox.rs                   |  2 +-
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
 sound/pci/ctxfi/cttimer.c                          |  4 +-
 sound/pci/echoaudio/midi.c                         |  2 +-
 sound/pci/korg1212/korg1212.c                      |  2 +-
 sound/pci/rme9652/hdsp.c                           |  2 +-
 sound/pci/rme9652/hdspm.c                          |  2 +-
 sound/sh/aica.c                                    |  2 +-
 sound/soc/codecs/rt5645.c                          |  2 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |  2 +-
 sound/synth/emux/emux_synth.c                      |  2 +-
 sound/usb/midi.c                                   |  2 +-
 712 files changed, 1007 insertions(+), 1007 deletions(-)

-- 
2.45.2

