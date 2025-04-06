Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A5420322
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 11:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743937286; cv=none; b=NozgY391crklKQin8RlzGwol1rlDn/vlztwTlxVvWai3K0336BrAa8z0pQcWECIyFM3u7KJ2s+3eMKGmZoJuXJlQTWiSTFZEg/TCoKou4+LhWarEpgMJy5xw63S4+op6n9jBaiU2phNBVBX/Y2Qj/SPGXSB96ID0euDa6aZgXFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743937286; c=relaxed/simple;
	bh=5uBZBYRDMgy08XIcXK+bFsUwI+39VqcmcmDNetC6tVU=;
	h=From:To:Cc:Subject:Message-ID:Content-Type:MIME-Version:Date; b=HU1skgBTQPL3/l0/fe9XXfHq55NVoNHMSac1t6b0YggUM85HCyz+xX61Pv8beCn+J9IIuSpxmBYhU42lD6aA6dralcNgCOs80OPSGaQExrv4PyP4tIKV7v5csONGYXbWPVIj/8bXbfAJ/+b5Bz6rVSv40NJicp/B/s8QAYPduqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yR3q83zF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M2FQqdny; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yR3q83zF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M2FQqdny"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743937262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cXhrV/0S2dnlXhJVuM/JwQ54lnYccoLg7FR0bEngNAY=;
	b=yR3q83zF7OvSCQRYFz9+09G4WQadrGxvooAPKk/adBGNIVTtp5x0mhkrDdg43LZVGdQudl
	ct+c5Jnt+F7DU14CJ4aPQLR973GX0weo1iVanUrBI446/gnwUDMDZDq5odVf8FytTUwlBb
	ZTON3B6y6o+IGVma3vYFkIRA5cMB0D6Krzo3wNypYglemYOV+4qeITLK5PYEorlbclf+oW
	SO8inQwmpGfCg4vepmPJ5NnmDTXtI50iz8AUS5pKSJqvZtgNWllL0skFehdmdX02vnHQsd
	f89mtVYwz9+dB2+6rij6dFtCrmPdUdJ6YC2CwcH35eaDrWXpfS8S6sNYwYOlfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743937262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cXhrV/0S2dnlXhJVuM/JwQ54lnYccoLg7FR0bEngNAY=;
	b=M2FQqdnybm/19vOeHH4A4FOgZdhl4g50kGDegZcepZA6Q9+yrp/AM8Kn5/WjQ5pUP+z9NF
	ay8GlQQiBSUSq+AA==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] timers/cleanups for 6.15-rc1
Message-ID: <174393725364.2346949.10226564772591697824.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun,  6 Apr 2025 13:01:01 +0200 (CEST)

Linus,

please pull the latest timers/cleanups branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-cleanups-=
2025-04-06

up to:  244132c4e577: tracing/timers: Rename the hrtimer_init event to hrtime=
r_setup


A set of final cleanups for the timer subsystem:

  1) Convert all del_timer[_sync]() instances over to the new
     timer_delete[_sync]() API and remove the legacy wrappers.

     Conversion was done with coccinelle plus some manual fixups as
     coccinelle chokes on scoped_guard().

  2) The final cleanup of the hrtimer_init() to hrtimer_setup() conversion.

     This has been delayed to the end of the merge window, so that all
     patches which have been merged through other trees are in mainline and
     all new users are catched.

Doing this right before rc1 ensures that new code which is merged post rc1
is not introducing new instances of the original functionality.

Note: There is a trivial merge conflict in drivers/input as the input
      tree got merged late. Either variant is correct as they just differ
      in formatting.

Thanks,

	tglx

------------------>
Nam Cao (9):
      hrtimers: Delete hrtimer_init()
      hrtimers: Switch to use __htimer_setup()
      hrtimers: Merge __hrtimer_init() into __hrtimer_setup()
      hrtimers: Make callback function pointer private
      hrtimers: Remove unnecessary NULL check in hrtimer_start_range_ns()
      hrtimers: Rename __hrtimer_init_sleeper() to __hrtimer_setup_sleeper()
      hrtimers: Rename debug_init() to debug_setup()
      hrtimers: Rename debug_init_on_stack() to debug_setup_on_stack()
      tracing/timers: Rename the hrtimer_init event to hrtimer_setup

Thomas Gleixner (2):
      treewide: Switch/rename to timer_delete[_sync]()
      treewide: Convert new and leftover hrtimer_init() users


 Documentation/trace/ftrace.rst                     |  4 +-
 arch/alpha/kernel/srmcons.c                        |  2 +-
 arch/arm/mach-footbridge/dc21285.c                 |  2 +-
 arch/arm/mach-pxa/sharpsl_pm.c                     |  4 +-
 arch/m68k/amiga/amisound.c                         |  2 +-
 arch/m68k/mac/macboing.c                           |  4 +-
 arch/mips/sgi-ip22/ip22-reset.c                    |  2 +-
 arch/powerpc/kvm/booke.c                           |  4 +-
 arch/powerpc/platforms/cell/spufs/sched.c          |  6 +-
 arch/powerpc/platforms/powermac/low_i2c.c          |  2 +-
 arch/s390/kernel/time.c                            |  2 +-
 arch/s390/mm/cmm.c                                 |  6 +-
 arch/sh/drivers/pci/common.c                       |  4 +-
 arch/sparc/kernel/led.c                            |  4 +-
 arch/um/drivers/vector_kern.c                      |  2 +-
 arch/x86/kernel/cpu/mce/core.c                     |  6 +-
 arch/x86/kvm/xen.c                                 |  4 +-
 arch/xtensa/platforms/iss/console.c                |  2 +-
 arch/xtensa/platforms/iss/network.c                |  2 +-
 block/blk-core.c                                   |  2 +-
 block/blk-stat.c                                   |  2 +-
 block/blk-stat.h                                   |  2 +-
 block/blk-throttle.c                               |  4 +-
 drivers/accel/qaic/qaic_timesync.c                 |  2 +-
 drivers/accessibility/speakup/main.c               | 18 +++---
 drivers/accessibility/speakup/synth.c              |  2 +-
 drivers/ata/libata-eh.c                            |  2 +-
 drivers/atm/idt77105.c                             |  4 +-
 drivers/atm/iphase.c                               |  2 +-
 drivers/atm/lanai.c                                |  2 +-
 drivers/atm/nicstar.c                              |  2 +-
 drivers/atm/suni.c                                 |  2 +-
 drivers/auxdisplay/line-display.c                  |  8 +--
 drivers/auxdisplay/panel.c                         |  4 +-
 drivers/base/devcoredump.c                         |  2 +-
 drivers/base/power/main.c                          |  2 +-
 drivers/base/power/wakeup.c                        |  6 +-
 drivers/block/amiflop.c                            | 10 +--
 drivers/block/aoe/aoedev.c                         |  2 +-
 drivers/block/aoe/aoemain.c                        |  2 +-
 drivers/block/ataflop.c                            | 12 ++--
 drivers/block/drbd/drbd_main.c                     |  2 +-
 drivers/block/drbd/drbd_nl.c                       |  2 +-
 drivers/block/drbd/drbd_receiver.c                 |  2 +-
 drivers/block/floppy.c                             |  8 +--
 drivers/block/sunvdc.c                             |  2 +-
 drivers/block/swim3.c                              | 10 +--
 drivers/bluetooth/bluecard_cs.c                    |  4 +-
 drivers/bluetooth/hci_bcsp.c                       |  2 +-
 drivers/bluetooth/hci_h5.c                         |  6 +-
 drivers/bluetooth/hci_qca.c                        | 10 +--
 drivers/bus/mhi/host/pci_generic.c                 |  8 +--
 drivers/char/dtlk.c                                |  6 +-
 drivers/char/hangcheck-timer.c                     |  2 +-
 drivers/char/hw_random/xgene-rng.c                 |  2 +-
 drivers/char/ipmi/bt-bmc.c                         |  2 +-
 drivers/char/ipmi/ipmi_msghandler.c                |  2 +-
 drivers/char/ipmi/ipmi_si_intf.c                   |  4 +-
 drivers/char/ipmi/ipmi_ssif.c                      |  6 +-
 drivers/char/ipmi/kcs_bmc_aspeed.c                 |  4 +-
 drivers/char/ipmi/ssif_bmc.c                       |  2 +-
 drivers/char/random.c                              |  2 +-
 drivers/char/tlclk.c                               |  4 +-
 drivers/char/tpm/tpm-dev-common.c                  |  4 +-
 drivers/comedi/drivers/comedi_test.c               | 12 ++--
 drivers/comedi/drivers/das16.c                     |  4 +-
 drivers/comedi/drivers/jr3_pci.c                   |  2 +-
 drivers/cpufreq/powernv-cpufreq.c                  |  4 +-
 drivers/crypto/axis/artpec6_crypto.c               |  4 +-
 drivers/dma-buf/st-dma-fence.c                     |  2 +-
 drivers/dma/imx-dma.c                              |  4 +-
 drivers/dma/ioat/dma.c                             |  2 +-
 drivers/dma/ioat/init.c                            |  4 +-
 drivers/firewire/core-transaction.c                |  2 +-
 drivers/firmware/psci/psci_checker.c               |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |  2 +-
 drivers/gpu/drm/bridge/tda998x_drv.c               |  2 +-
 drivers/gpu/drm/drm_vblank.c                       |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  2 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |  2 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  6 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  2 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |  4 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |  4 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |  2 +-
 drivers/gpu/drm/i915/i915_utils.c                  |  2 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |  2 +-
 drivers/gpu/drm/i915/selftests/lib_sw_fence.c      |  2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  4 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |  2 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |  2 +-
 drivers/gpu/drm/vgem/vgem_fence.c                  |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c                   |  2 +-
 drivers/greybus/operation.c                        |  2 +-
 drivers/hid/hid-apple.c                            |  4 +-
 drivers/hid/hid-appleir.c                          |  2 +-
 drivers/hid/hid-appletb-kbd.c                      |  2 +-
 drivers/hid/hid-magicmouse.c                       |  4 +-
 drivers/hid/hid-multitouch.c                       |  4 +-
 drivers/hid/hid-nvidia-shield.c                    |  2 +-
 drivers/hid/hid-prodikeys.c                        |  2 +-
 drivers/hid/hid-sony.c                             |  2 +-
 drivers/hid/hid-uclogic-core.c                     |  2 +-
 drivers/hid/hid-wiimote-core.c                     |  2 +-
 drivers/hid/usbhid/hid-core.c                      |  4 +-
 drivers/hid/wacom_sys.c                            |  2 +-
 drivers/hsi/clients/ssi_protocol.c                 | 18 +++---
 drivers/hte/hte-tegra194-test.c                    |  2 +-
 drivers/hwmon/pwm-fan.c                            |  2 +-
 drivers/i2c/busses/i2c-img-scb.c                   |  2 +-
 drivers/iio/common/ssp_sensors/ssp_dev.c           |  4 +-
 drivers/infiniband/hw/cxgb4/cm.c                   |  2 +-
 drivers/infiniband/hw/hfi1/aspm.c                  |  2 +-
 drivers/infiniband/hw/hfi1/chip.c                  |  4 +-
 drivers/infiniband/hw/hfi1/driver.c                |  2 +-
 drivers/infiniband/hw/hfi1/init.c                  |  2 +-
 drivers/infiniband/hw/hfi1/sdma.c                  |  2 +-
 drivers/infiniband/hw/hfi1/tid_rdma.c              |  8 +--
 drivers/infiniband/hw/hfi1/verbs.c                 |  2 +-
 drivers/infiniband/hw/irdma/cm.c                   |  2 +-
 drivers/infiniband/hw/irdma/utils.c                |  4 +-
 drivers/infiniband/hw/mlx5/mr.c                    |  2 +-
 drivers/infiniband/hw/mthca/mthca_catas.c          |  2 +-
 drivers/infiniband/hw/qib/qib_driver.c             |  2 +-
 drivers/infiniband/hw/qib/qib_iba7220.c            |  4 +-
 drivers/infiniband/hw/qib/qib_iba7322.c            |  4 +-
 drivers/infiniband/hw/qib/qib_init.c               | 10 +--
 drivers/infiniband/hw/qib/qib_mad.c                |  2 +-
 drivers/infiniband/hw/qib/qib_sd7220.c             |  2 +-
 drivers/infiniband/hw/qib/qib_verbs.c              |  2 +-
 drivers/infiniband/sw/rdmavt/qp.c                  |  8 +--
 drivers/infiniband/sw/rxe/rxe_qp.c                 |  4 +-
 drivers/input/ff-memless.c                         |  4 +-
 drivers/input/gameport/gameport.c                  |  4 +-
 drivers/input/input.c                              |  4 +-
 drivers/input/joystick/db9.c                       |  2 +-
 drivers/input/joystick/gamecon.c                   |  2 +-
 drivers/input/joystick/n64joy.c                    |  2 +-
 drivers/input/joystick/turbografx.c                |  2 +-
 drivers/input/joystick/walkera0701.c               |  3 +-
 drivers/input/keyboard/gpio_keys.c                 | 10 ++-
 drivers/input/keyboard/imx_keypad.c                |  2 +-
 drivers/input/keyboard/snvs_pwrkey.c               |  2 +-
 drivers/input/keyboard/tegra-kbc.c                 |  4 +-
 drivers/input/mouse/alps.c                         |  2 +-
 drivers/input/mouse/byd.c                          |  2 +-
 drivers/input/serio/hil_mlc.c                      |  2 +-
 drivers/input/serio/hp_sdc.c                       |  2 +-
 drivers/input/touchscreen/ad7877.c                 |  2 +-
 drivers/input/touchscreen/ad7879.c                 |  2 +-
 drivers/input/touchscreen/bu21029_ts.c             |  2 +-
 drivers/input/touchscreen/exc3000.c                |  2 +-
 drivers/input/touchscreen/sx8654.c                 |  2 +-
 drivers/input/touchscreen/tsc200x-core.c           |  4 +-
 drivers/iommu/dma-iommu.c                          |  2 +-
 drivers/isdn/hardware/mISDN/hfcmulti.c             |  6 +-
 drivers/isdn/hardware/mISDN/hfcpci.c               | 14 ++---
 drivers/isdn/hardware/mISDN/mISDNipac.c            | 10 +--
 drivers/isdn/hardware/mISDN/mISDNisar.c            |  6 +-
 drivers/isdn/hardware/mISDN/w6692.c                |  8 +--
 drivers/isdn/mISDN/dsp_core.c                      |  6 +-
 drivers/isdn/mISDN/dsp_tones.c                     |  4 +-
 drivers/isdn/mISDN/fsm.c                           |  4 +-
 drivers/leds/flash/leds-rt8515.c                   |  4 +-
 drivers/leds/flash/leds-sgm3140.c                  |  6 +-
 drivers/leds/led-core.c                            |  4 +-
 drivers/leds/trigger/ledtrig-pattern.c             |  2 +-
 drivers/leds/trigger/ledtrig-transient.c           |  2 +-
 drivers/macintosh/adbhid.c                         |  2 +-
 drivers/mailbox/mailbox-altera.c                   |  2 +-
 drivers/md/bcache/stats.c                          |  2 +-
 drivers/md/dm-integrity.c                          |  4 +-
 drivers/md/dm-mpath.c                              |  2 +-
 drivers/md/dm-raid1.c                              |  2 +-
 drivers/md/dm-vdo/dedupe.c                         |  2 +-
 drivers/md/dm-writecache.c                         |  6 +-
 drivers/md/md.c                                    |  4 +-
 drivers/media/common/saa7146/saa7146_fops.c        |  2 +-
 drivers/media/common/saa7146/saa7146_vbi.c         |  4 +-
 drivers/media/common/saa7146/saa7146_video.c       |  2 +-
 drivers/media/dvb-core/dmxdev.c                    |  6 +-
 drivers/media/i2c/tc358743.c                       |  4 +-
 drivers/media/i2c/tvaudio.c                        |  4 +-
 drivers/media/pci/bt8xx/bttv-driver.c              |  2 +-
 drivers/media/pci/bt8xx/bttv-input.c               |  4 +-
 drivers/media/pci/bt8xx/bttv-risc.c                |  2 +-
 drivers/media/pci/ivtv/ivtv-irq.c                  |  6 +-
 drivers/media/pci/ivtv/ivtv-streams.c              |  4 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c |  2 +-
 drivers/media/pci/saa7134/saa7134-core.c           | 10 +--
 drivers/media/pci/saa7134/saa7134-input.c          |  2 +-
 drivers/media/pci/saa7134/saa7134-ts.c             |  2 +-
 drivers/media/pci/saa7134/saa7134-vbi.c            |  2 +-
 drivers/media/pci/saa7134/saa7134-video.c          |  2 +-
 drivers/media/pci/tw686x/tw686x-core.c             |  2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |  6 +-
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |  2 +-
 drivers/media/radio/radio-cadet.c                  |  2 +-
 drivers/media/rc/ene_ir.c                          |  2 +-
 drivers/media/rc/igorplugusb.c                     |  4 +-
 drivers/media/rc/img-ir/img-ir-hw.c                |  4 +-
 drivers/media/rc/img-ir/img-ir-raw.c               |  2 +-
 drivers/media/rc/imon.c                            |  2 +-
 drivers/media/rc/ir-mce_kbd-decoder.c              |  4 +-
 drivers/media/rc/rc-ir-raw.c                       |  2 +-
 drivers/media/rc/rc-main.c                         |  6 +-
 drivers/media/rc/serial_ir.c                       |  2 +-
 drivers/media/usb/au0828/au0828-dvb.c              |  4 +-
 drivers/media/usb/au0828/au0828-video.c            | 12 ++--
 drivers/media/usb/pvrusb2/pvrusb2-encoder.c        |  2 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            | 16 ++---
 drivers/memory/tegra/tegra210-emc-core.c           |  4 +-
 drivers/memstick/core/ms_block.c                   |  4 +-
 drivers/memstick/host/jmb38x_ms.c                  |  2 +-
 drivers/memstick/host/r592.c                       |  4 +-
 drivers/memstick/host/tifm_ms.c                    |  4 +-
 drivers/misc/bcm-vk/bcm_vk_tty.c                   |  4 +-
 drivers/misc/cardreader/rtsx_usb.c                 |  2 +-
 drivers/misc/sgi-xp/xpc_main.c                     |  2 +-
 drivers/misc/sgi-xp/xpc_partition.c                |  2 +-
 drivers/mmc/core/host.c                            |  4 +-
 drivers/mmc/host/atmel-mci.c                       |  8 +--
 drivers/mmc/host/dw_mmc.c                          | 16 ++---
 drivers/mmc/host/jz4740_mmc.c                      |  4 +-
 drivers/mmc/host/meson-mx-sdio.c                   |  4 +-
 drivers/mmc/host/mvsdio.c                          |  4 +-
 drivers/mmc/host/mxcmmc.c                          |  4 +-
 drivers/mmc/host/omap.c                            | 10 +--
 drivers/mmc/host/sdhci.c                           |  8 +--
 drivers/mmc/host/tifm_sd.c                         |  2 +-
 drivers/mmc/host/via-sdmmc.c                       |  4 +-
 drivers/mmc/host/vub300.c                          |  6 +-
 drivers/mmc/host/wbsd.c                            |  2 +-
 drivers/most/most_usb.c                            |  4 +-
 drivers/mtd/sm_ftl.c                               |  4 +-
 drivers/net/arcnet/arcnet.c                        |  2 +-
 drivers/net/can/grcan.c                            | 12 ++--
 drivers/net/can/kvaser_pciefd.c                    |  6 +-
 drivers/net/can/sja1000/peak_pcmcia.c              |  2 +-
 drivers/net/dsa/mv88e6xxx/phy.c                    |  4 +-
 drivers/net/dsa/sja1105/sja1105_ptp.c              |  4 +-
 drivers/net/eql.c                                  |  2 +-
 drivers/net/ethernet/3com/3c515.c                  |  2 +-
 drivers/net/ethernet/3com/3c574_cs.c               |  2 +-
 drivers/net/ethernet/3com/3c589_cs.c               |  2 +-
 drivers/net/ethernet/3com/3c59x.c                  |  2 +-
 drivers/net/ethernet/8390/axnet_cs.c               |  2 +-
 drivers/net/ethernet/8390/pcnet_cs.c               |  2 +-
 drivers/net/ethernet/agere/et131x.c                |  2 +-
 drivers/net/ethernet/amazon/ena/ena_netdev.c       |  6 +-
 drivers/net/ethernet/amd/a2065.c                   |  2 +-
 drivers/net/ethernet/amd/amd8111e.c                |  4 +-
 drivers/net/ethernet/amd/declance.c                |  2 +-
 drivers/net/ethernet/amd/pcnet32.c                 |  2 +-
 drivers/net/ethernet/amd/sunlance.c                |  2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c           |  4 +-
 drivers/net/ethernet/apple/bmac.c                  |  6 +-
 drivers/net/ethernet/apple/mace.c                  |  4 +-
 drivers/net/ethernet/aquantia/atlantic/aq_nic.c    |  4 +-
 drivers/net/ethernet/atheros/ag71xx.c              |  2 +-
 drivers/net/ethernet/atheros/atl1c/atl1c_main.c    |  2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_main.c    |  2 +-
 drivers/net/ethernet/atheros/atlx/atl1.c           |  2 +-
 drivers/net/ethernet/atheros/atlx/atl2.c           |  8 +--
 drivers/net/ethernet/broadcom/b44.c                |  4 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.c       |  6 +-
 drivers/net/ethernet/broadcom/bnx2.c               | 10 +--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c    |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c   |  2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |  2 +-
 drivers/net/ethernet/broadcom/tg3.c                |  2 +-
 drivers/net/ethernet/brocade/bna/bfa_ioc.c         | 26 ++++----
 drivers/net/ethernet/brocade/bna/bnad.c            | 16 ++---
 drivers/net/ethernet/brocade/bna/bnad_ethtool.c    |  2 +-
 drivers/net/ethernet/chelsio/cxgb/sge.c            |  4 +-
 drivers/net/ethernet/chelsio/cxgb3/sge.c           |  4 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c           |  4 +-
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c         |  4 +-
 drivers/net/ethernet/cisco/enic/enic_clsf.h        |  2 +-
 drivers/net/ethernet/cisco/enic/enic_main.c        |  2 +-
 drivers/net/ethernet/dec/tulip/21142.c             |  4 +-
 drivers/net/ethernet/dec/tulip/de2104x.c           |  6 +-
 drivers/net/ethernet/dec/tulip/dmfe.c              |  2 +-
 drivers/net/ethernet/dec/tulip/interrupt.c         |  4 +-
 drivers/net/ethernet/dec/tulip/pnic2.c             |  6 +-
 drivers/net/ethernet/dec/tulip/tulip_core.c        |  4 +-
 drivers/net/ethernet/dec/tulip/uli526x.c           |  2 +-
 drivers/net/ethernet/dec/tulip/winbond-840.c       |  4 +-
 drivers/net/ethernet/dlink/dl2k.c                  |  4 +-
 drivers/net/ethernet/fealnx.c                      |  4 +-
 drivers/net/ethernet/google/gve/gve_ethtool.c      |  2 +-
 drivers/net/ethernet/google/gve/gve_main.c         |  4 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c      |  2 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |  2 +-
 drivers/net/ethernet/intel/e100.c                  |  4 +-
 drivers/net/ethernet/intel/e1000e/netdev.c         |  8 +--
 drivers/net/ethernet/intel/fm10k/fm10k_pci.c       |  2 +-
 drivers/net/ethernet/intel/i40e/i40e_main.c        |  4 +-
 drivers/net/ethernet/intel/ice/ice_main.c          |  2 +-
 drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c |  4 +-
 drivers/net/ethernet/intel/igb/igb_main.c          |  8 +--
 drivers/net/ethernet/intel/igbvf/netdev.c          |  4 +-
 drivers/net/ethernet/intel/igc/igc_main.c          |  8 +--
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c      |  2 +-
 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c  |  2 +-
 drivers/net/ethernet/korina.c                      |  2 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c         |  6 +-
 drivers/net/ethernet/marvell/pxa168_eth.c          |  2 +-
 drivers/net/ethernet/marvell/skge.c                |  2 +-
 drivers/net/ethernet/marvell/sky2.c                |  2 +-
 drivers/net/ethernet/mellanox/mlx4/catas.c         |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/health.c   |  2 +-
 drivers/net/ethernet/micrel/ksz884x.c              |  2 +-
 drivers/net/ethernet/myricom/myri10ge/myri10ge.c   |  2 +-
 drivers/net/ethernet/natsemi/natsemi.c             |  4 +-
 drivers/net/ethernet/natsemi/ns83820.c             |  2 +-
 drivers/net/ethernet/neterion/s2io.c               |  2 +-
 .../net/ethernet/netronome/nfp/nfp_net_common.c    |  2 +-
 drivers/net/ethernet/nvidia/forcedeth.c            |  6 +-
 .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   |  2 +-
 drivers/net/ethernet/packetengines/hamachi.c       |  2 +-
 drivers/net/ethernet/packetengines/yellowfin.c     |  2 +-
 drivers/net/ethernet/pasemi/pasemi_mac.c           |  2 +-
 .../net/ethernet/pensando/ionic/ionic_bus_pci.c    |  2 +-
 drivers/net/ethernet/qlogic/qla3xxx.c              |  2 +-
 drivers/net/ethernet/realtek/atp.c                 |  2 +-
 drivers/net/ethernet/rocker/rocker_ofdpa.c         |  2 +-
 drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c    |  6 +-
 drivers/net/ethernet/seeq/ether3.c                 |  6 +-
 drivers/net/ethernet/sfc/falcon/falcon.c           |  2 +-
 drivers/net/ethernet/sfc/falcon/rx.c               |  2 +-
 drivers/net/ethernet/sfc/mcdi.c                    |  4 +-
 drivers/net/ethernet/sfc/rx_common.c               |  2 +-
 drivers/net/ethernet/sfc/siena/mcdi.c              |  4 +-
 drivers/net/ethernet/sfc/siena/rx_common.c         |  2 +-
 drivers/net/ethernet/sgi/ioc3-eth.c                |  8 +--
 drivers/net/ethernet/sis/sis190.c                  |  4 +-
 drivers/net/ethernet/sis/sis900.c                  |  2 +-
 drivers/net/ethernet/smsc/epic100.c                |  2 +-
 drivers/net/ethernet/smsc/smc91c92_cs.c            |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  6 +-
 drivers/net/ethernet/sun/cassini.c                 |  2 +-
 drivers/net/ethernet/sun/ldmvsw.c                  |  6 +-
 drivers/net/ethernet/sun/niu.c                     |  6 +-
 drivers/net/ethernet/sun/sunbmac.c                 |  2 +-
 drivers/net/ethernet/sun/sungem.c                  |  8 +--
 drivers/net/ethernet/sun/sunhme.c                  |  6 +-
 drivers/net/ethernet/sun/sunvnet.c                 |  2 +-
 drivers/net/ethernet/sun/sunvnet_common.c          |  6 +-
 drivers/net/ethernet/synopsys/dwc-xlgmac-net.c     |  2 +-
 drivers/net/ethernet/ti/cpsw_ale.c                 |  2 +-
 drivers/net/ethernet/ti/netcp_ethss.c              |  2 +-
 drivers/net/ethernet/ti/tlan.c                     |  4 +-
 drivers/net/ethernet/tundra/tsi108_eth.c           |  2 +-
 drivers/net/fddi/defza.c                           | 10 +--
 drivers/net/hamradio/6pack.c                       |  6 +-
 drivers/net/hamradio/scc.c                         | 26 ++++----
 drivers/net/hamradio/yam.c                         |  2 +-
 drivers/net/hippi/rrunner.c                        |  2 +-
 drivers/net/netdevsim/netdev.c                     |  4 +-
 drivers/net/ntb_netdev.c                           |  2 +-
 drivers/net/phy/phylink.c                          |  4 +-
 drivers/net/slip/slip.c                            | 14 ++---
 drivers/net/tun.c                                  |  2 +-
 drivers/net/usb/catc.c                             |  2 +-
 drivers/net/usb/lan78xx.c                          |  6 +-
 drivers/net/usb/sierra_net.c                       |  2 +-
 drivers/net/usb/usbnet.c                           |  6 +-
 drivers/net/vxlan/vxlan_core.c                     |  2 +-
 drivers/net/wan/hdlc_cisco.c                       |  2 +-
 drivers/net/wan/hdlc_fr.c                          |  2 +-
 drivers/net/wan/hdlc_ppp.c                         |  2 +-
 drivers/net/wireguard/device.c                     |  2 +-
 drivers/net/wireguard/timers.c                     |  8 +--
 drivers/net/wireless/ath/ar5523/ar5523.c           |  4 +-
 drivers/net/wireless/ath/ath10k/debug.c            |  2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c           |  2 +-
 drivers/net/wireless/ath/ath10k/pci.c              |  4 +-
 drivers/net/wireless/ath/ath10k/sdio.c             |  2 +-
 drivers/net/wireless/ath/ath10k/snoc.c             |  2 +-
 drivers/net/wireless/ath/ath11k/ahb.c              |  2 +-
 drivers/net/wireless/ath/ath11k/dp.c               |  4 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c            |  8 +--
 drivers/net/wireless/ath/ath12k/dp.c               |  2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |  4 +-
 drivers/net/wireless/ath/ath6kl/cfg80211.c         |  6 +-
 drivers/net/wireless/ath/ath6kl/init.c             |  2 +-
 drivers/net/wireless/ath/ath6kl/main.c             |  2 +-
 drivers/net/wireless/ath/ath6kl/recovery.c         |  4 +-
 drivers/net/wireless/ath/ath6kl/txrx.c             |  2 +-
 drivers/net/wireless/ath/ath9k/channel.c           |  2 +-
 drivers/net/wireless/ath/ath9k/gpio.c              |  8 +--
 drivers/net/wireless/ath/ath9k/htc_drv_main.c      |  6 +-
 drivers/net/wireless/ath/ath9k/init.c              |  2 +-
 drivers/net/wireless/ath/ath9k/link.c              |  2 +-
 drivers/net/wireless/ath/ath9k/main.c              | 10 +--
 drivers/net/wireless/ath/ath9k/pci.c               |  2 +-
 drivers/net/wireless/ath/wcn36xx/dxe.c             |  4 +-
 drivers/net/wireless/ath/wil6210/cfg80211.c        |  2 +-
 drivers/net/wireless/ath/wil6210/main.c            |  6 +-
 drivers/net/wireless/ath/wil6210/netdev.c          |  6 +-
 drivers/net/wireless/ath/wil6210/p2p.c             |  2 +-
 drivers/net/wireless/ath/wil6210/wmi.c             |  6 +-
 drivers/net/wireless/atmel/at76c50x-usb.c          |  2 +-
 .../wireless/broadcom/brcm80211/brcmfmac/btcoex.c  |  4 +-
 .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    |  2 +-
 .../wireless/broadcom/brcm80211/brcmfmac/sdio.c    |  2 +-
 drivers/net/wireless/intel/ipw2x00/libipw_crypto.c |  2 +-
 drivers/net/wireless/intel/iwlegacy/3945-mac.c     |  2 +-
 drivers/net/wireless/intel/iwlegacy/3945-rs.c      |  2 +-
 drivers/net/wireless/intel/iwlegacy/4965-mac.c     |  4 +-
 drivers/net/wireless/intel/iwlegacy/common.c       |  2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c   |  2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/main.c      |  4 +-
 drivers/net/wireless/intel/iwlwifi/dvm/tt.c        | 10 +--
 drivers/net/wireless/intel/iwlwifi/pcie/rx.c       |  2 +-
 drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c  |  2 +-
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c       |  6 +-
 drivers/net/wireless/marvell/libertas/cmdresp.c    |  2 +-
 drivers/net/wireless/marvell/libertas/if_usb.c     |  2 +-
 drivers/net/wireless/marvell/libertas/main.c       | 12 ++--
 drivers/net/wireless/marvell/libertas_tf/cmd.c     |  2 +-
 drivers/net/wireless/marvell/libertas_tf/if_usb.c  |  2 +-
 drivers/net/wireless/marvell/libertas_tf/main.c    |  4 +-
 .../net/wireless/marvell/mwifiex/11n_rxreorder.c   |  2 +-
 drivers/net/wireless/marvell/mwifiex/cmdevt.c      |  2 +-
 drivers/net/wireless/marvell/mwifiex/init.c        |  4 +-
 drivers/net/wireless/marvell/mwifiex/main.c        |  2 +-
 drivers/net/wireless/marvell/mwifiex/pcie.c        |  4 +-
 drivers/net/wireless/marvell/mwifiex/sta_event.c   |  4 +-
 drivers/net/wireless/marvell/mwifiex/tdls.c        |  2 +-
 drivers/net/wireless/marvell/mwifiex/usb.c         |  6 +-
 drivers/net/wireless/mediatek/mt76/mt7615/main.c   |  4 +-
 .../net/wireless/mediatek/mt76/mt7615/pci_mac.c    |  4 +-
 drivers/net/wireless/mediatek/mt76/mt7615/usb.c    |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/main.c   |  6 +-
 drivers/net/wireless/mediatek/mt76/mt7925/main.c   |  4 +-
 drivers/net/wireless/mediatek/mt76/mt792x_core.c   |  2 +-
 drivers/net/wireless/microchip/wilc1000/hif.c      | 18 +++---
 drivers/net/wireless/purelifi/plfxlc/usb.c         |  4 +-
 drivers/net/wireless/realtek/rtlwifi/base.c        |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/sw.c    |  4 +-
 drivers/net/wireless/rsi/rsi_91x_hal.c             |  4 +-
 drivers/net/wireless/rsi/rsi_91x_mac80211.c        |  6 +-
 drivers/net/wireless/st/cw1200/main.c              |  2 +-
 drivers/net/wireless/st/cw1200/pm.c                |  2 +-
 drivers/net/wireless/st/cw1200/queue.c             |  2 +-
 drivers/net/wireless/st/cw1200/sta.c               |  6 +-
 drivers/net/wireless/ti/wlcore/main.c              |  4 +-
 drivers/net/xen-netback/interface.c                |  2 +-
 drivers/net/xen-netfront.c                         |  2 +-
 drivers/nfc/nfcmrvl/fw_dnld.c                      |  6 +-
 drivers/nfc/pn533/pn533.c                          |  4 +-
 drivers/nfc/pn533/uart.c                           |  2 +-
 drivers/nfc/st-nci/ndlc.c                          | 12 ++--
 drivers/nfc/st-nci/se.c                            | 10 +--
 drivers/nfc/st21nfca/core.c                        |  4 +-
 drivers/nfc/st21nfca/se.c                          |  6 +-
 drivers/nvme/host/multipath.c                      |  4 +-
 drivers/parport/ieee1284.c                         |  2 +-
 drivers/pci/hotplug/cpqphp_ctrl.c                  |  2 +-
 drivers/pci/hotplug/shpchp_hpc.c                   |  2 +-
 drivers/pcmcia/i82365.c                            |  2 +-
 drivers/pcmcia/soc_common.c                        |  4 +-
 drivers/pcmcia/tcic.c                              |  2 +-
 drivers/platform/mellanox/mlxbf-tmfifo.c           |  2 +-
 drivers/platform/x86/intel_ips.c                   |  2 +-
 drivers/platform/x86/sony-laptop.c                 |  2 +-
 drivers/pps/clients/pps-gpio.c                     |  2 +-
 drivers/pps/clients/pps-ktimer.c                   |  2 +-
 drivers/pps/generators/pps_gen-dummy.c             |  4 +-
 drivers/pps/generators/pps_gen_tio.c               |  4 +-
 drivers/ptp/ptp_ocp.c                              |  2 +-
 drivers/rtc/dev.c                                  |  2 +-
 drivers/rtc/rtc-test.c                             |  4 +-
 drivers/s390/block/dasd.c                          |  8 +--
 drivers/s390/char/con3270.c                        |  4 +-
 drivers/s390/char/sclp.c                           | 12 ++--
 drivers/s390/char/sclp_con.c                       |  2 +-
 drivers/s390/char/sclp_vt220.c                     |  4 +-
 drivers/s390/char/tape_core.c                      |  2 +-
 drivers/s390/char/tape_std.c                       |  2 +-
 drivers/s390/cio/device_fsm.c                      |  2 +-
 drivers/s390/cio/eadm_sch.c                        |  2 +-
 drivers/s390/crypto/ap_queue.c                     |  2 +-
 drivers/s390/net/fsm.c                             |  4 +-
 drivers/s390/net/qeth_core_main.c                  |  2 +-
 drivers/s390/scsi/zfcp_fsf.c                       |  4 +-
 drivers/s390/scsi/zfcp_qdio.c                      |  2 +-
 drivers/scsi/aic7xxx/aic79xx_core.c                |  4 +-
 drivers/scsi/aic94xx/aic94xx_hwi.c                 |  2 +-
 drivers/scsi/aic94xx/aic94xx_init.c                |  2 +-
 drivers/scsi/aic94xx/aic94xx_tmf.c                 |  6 +-
 drivers/scsi/arcmsr/arcmsr_hba.c                   | 20 +++---
 drivers/scsi/arm/fas216.c                          |  6 +-
 drivers/scsi/be2iscsi/be_main.c                    |  4 +-
 drivers/scsi/bfa/bfad.c                            | 10 +--
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c                  |  4 +-
 drivers/scsi/bnx2fc/bnx2fc_tgt.c                   |  4 +-
 drivers/scsi/bnx2i/bnx2i_iscsi.c                   |  8 +--
 drivers/scsi/csiostor/csio_hw.c                    |  4 +-
 drivers/scsi/csiostor/csio_mb.c                    |  4 +-
 drivers/scsi/cxgbi/cxgb3i/cxgb3i.c                 |  2 +-
 drivers/scsi/cxgbi/cxgb4i/cxgb4i.c                 |  2 +-
 drivers/scsi/dc395x.c                              | 12 ++--
 drivers/scsi/elx/efct/efct_driver.c                |  2 +-
 drivers/scsi/elx/efct/efct_xport.c                 |  2 +-
 drivers/scsi/elx/libefc/efc_fabric.c               |  2 +-
 drivers/scsi/elx/libefc/efc_node.c                 |  2 +-
 drivers/scsi/esas2r/esas2r_init.c                  |  2 +-
 drivers/scsi/fcoe/fcoe.c                           |  2 +-
 drivers/scsi/fcoe/fcoe_ctlr.c                      |  4 +-
 drivers/scsi/fnic/fdls_disc.c                      | 12 ++--
 drivers/scsi/fnic/fip.c                            | 12 ++--
 drivers/scsi/fnic/fnic_main.c                      | 12 ++--
 drivers/scsi/hisi_sas/hisi_sas_main.c              |  6 +-
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c             | 14 ++---
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c             |  4 +-
 drivers/scsi/ibmvscsi/ibmvfc.c                     | 16 ++---
 drivers/scsi/ibmvscsi/ibmvscsi.c                   |  6 +-
 drivers/scsi/ipr.c                                 | 12 ++--
 drivers/scsi/isci/host.c                           | 12 ++--
 drivers/scsi/isci/isci.h                           |  8 +--
 drivers/scsi/libfc/fc_fcp.c                        |  4 +-
 drivers/scsi/libiscsi.c                            |  6 +-
 drivers/scsi/libsas/sas_expander.c                 |  2 +-
 drivers/scsi/libsas/sas_scsi_host.c                |  8 +--
 drivers/scsi/lpfc/lpfc_attr.c                      |  2 +-
 drivers/scsi/lpfc/lpfc_els.c                       |  4 +-
 drivers/scsi/lpfc/lpfc_hbadisc.c                   |  8 +--
 drivers/scsi/lpfc/lpfc_init.c                      | 20 +++---
 drivers/scsi/lpfc/lpfc_scsi.c                      |  2 +-
 drivers/scsi/lpfc/lpfc_sli.c                       | 10 +--
 drivers/scsi/megaraid/megaraid_mbox.c              |  2 +-
 drivers/scsi/megaraid/megaraid_mm.c                |  2 +-
 drivers/scsi/megaraid/megaraid_sas_base.c          | 10 +--
 drivers/scsi/megaraid/megaraid_sas_fusion.c        |  2 +-
 drivers/scsi/mvsas/mv_sas.c                        |  2 +-
 drivers/scsi/pmcraid.c                             |  6 +-
 drivers/scsi/qla1280.c                             |  2 +-
 drivers/scsi/qla2xxx/qla_init.c                    |  2 +-
 drivers/scsi/qla2xxx/qla_iocb.c                    |  4 +-
 drivers/scsi/qla2xxx/qla_mid.c                     |  2 +-
 drivers/scsi/qla2xxx/qla_os.c                      |  2 +-
 drivers/scsi/qla4xxx/ql4_os.c                      |  2 +-
 drivers/scsi/smartpqi/smartpqi_init.c              |  2 +-
 drivers/scsi/sym53c8xx_2/sym_glue.c                |  2 +-
 .../staging/gpib/agilent_82357a/agilent_82357a.c   |  4 +-
 drivers/staging/gpib/common/gpib_os.c              |  4 +-
 drivers/staging/gpib/common/iblib.c                |  2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c          |  8 +--
 drivers/staging/media/imx/imx-ic-prpencvf.c        |  2 +-
 drivers/staging/media/imx/imx-media-csi.c          |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c           |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c          |  4 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c      | 22 +++----
 drivers/staging/rtl8723bs/core/rtw_recv.c          |  2 +-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c       |  6 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c           |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c        | 12 ++--
 drivers/target/iscsi/iscsi_target_erl0.c           |  2 +-
 drivers/target/iscsi/iscsi_target_erl1.c           |  2 +-
 drivers/target/iscsi/iscsi_target_util.c           |  4 +-
 drivers/target/target_core_user.c                  |  8 +--
 drivers/tty/ipwireless/hardware.c                  |  4 +-
 drivers/tty/mips_ejtag_fdc.c                       |  4 +-
 drivers/tty/moxa.c                                 |  2 +-
 drivers/tty/n_gsm.c                                | 14 ++---
 drivers/tty/serial/8250/8250_aspeed_vuart.c        |  2 +-
 drivers/tty/serial/8250/8250_core.c                |  2 +-
 drivers/tty/serial/altera_uart.c                   |  2 +-
 drivers/tty/serial/amba-pl011.c                    |  4 +-
 drivers/tty/serial/atmel_serial.c                  |  2 +-
 drivers/tty/serial/fsl_lpuart.c                    |  6 +-
 drivers/tty/serial/imx.c                           |  4 +-
 drivers/tty/serial/liteuart.c                      |  4 +-
 drivers/tty/serial/max3100.c                       |  4 +-
 drivers/tty/serial/mux.c                           |  2 +-
 drivers/tty/serial/sa1100.c                        |  4 +-
 drivers/tty/serial/sccnxp.c                        |  2 +-
 drivers/tty/serial/sh-sci.c                        |  2 +-
 drivers/tty/synclink_gt.c                          |  8 +--
 drivers/tty/sysrq.c                                |  4 +-
 drivers/tty/vcc.c                                  |  6 +-
 drivers/tty/vt/keyboard.c                          |  2 +-
 drivers/tty/vt/vt.c                                |  4 +-
 drivers/usb/atm/cxacru.c                           |  2 +-
 drivers/usb/atm/speedtch.c                         |  8 +--
 drivers/usb/atm/usbatm.c                           |  4 +-
 drivers/usb/core/hcd.c                             |  6 +-
 drivers/usb/core/hub.c                             |  2 +-
 drivers/usb/dwc2/hcd.c                             |  2 +-
 drivers/usb/dwc2/hcd_queue.c                       |  4 +-
 drivers/usb/gadget/legacy/zero.c                   |  4 +-
 drivers/usb/gadget/udc/omap_udc.c                  |  2 +-
 drivers/usb/gadget/udc/pxa25x_udc.c                |  8 +--
 drivers/usb/gadget/udc/r8a66597-udc.c              |  2 +-
 drivers/usb/gadget/udc/snps_udc_core.c             |  4 +-
 drivers/usb/host/ehci-platform.c                   |  2 +-
 drivers/usb/host/isp1362-hcd.c                     |  2 +-
 drivers/usb/host/ohci-hcd.c                        |  2 +-
 drivers/usb/host/ohci-hub.c                        |  2 +-
 drivers/usb/host/oxu210hp-hcd.c                    |  6 +-
 drivers/usb/host/r8a66597-hcd.c                    |  2 +-
 drivers/usb/host/sl811-hcd.c                       |  2 +-
 drivers/usb/host/uhci-hcd.c                        |  2 +-
 drivers/usb/host/uhci-q.c                          |  2 +-
 drivers/usb/host/xen-hcd.c                         |  4 +-
 drivers/usb/host/xhci-hub.c                        |  2 +-
 drivers/usb/host/xhci-mtk.c                        |  4 +-
 drivers/usb/host/xhci.c                            | 14 ++---
 drivers/usb/isp1760/isp1760-hcd.c                  |  2 +-
 drivers/usb/isp1760/isp1760-udc.c                  |  4 +-
 drivers/usb/misc/usbtest.c                         |  2 +-
 drivers/usb/musb/da8xx.c                           |  6 +-
 drivers/usb/musb/mpfs.c                            |  4 +-
 drivers/usb/musb/musb_core.c                       |  4 +-
 drivers/usb/musb/musb_dsps.c                       |  8 +--
 drivers/usb/musb/tusb6010.c                        |  8 +--
 drivers/usb/phy/phy-mv-usb.c                       |  2 +-
 drivers/usb/storage/realtek_cr.c                   |  2 +-
 drivers/video/fbdev/aty/radeon_backlight.c         |  2 +-
 drivers/video/fbdev/aty/radeon_base.c              |  4 +-
 drivers/video/fbdev/aty/radeon_pm.c                |  2 +-
 drivers/video/fbdev/omap/hwa742.c                  |  2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c         |  2 +-
 drivers/virt/vboxguest/vboxguest_core.c            |  2 +-
 drivers/watchdog/alim7101_wdt.c                    |  4 +-
 drivers/watchdog/at91sam9_wdt.c                    |  4 +-
 drivers/watchdog/bcm47xx_wdt.c                     |  4 +-
 drivers/watchdog/cpwd.c                            |  4 +-
 drivers/watchdog/lpc18xx_wdt.c                     |  4 +-
 drivers/watchdog/machzwd.c                         |  4 +-
 drivers/watchdog/mixcomwd.c                        |  4 +-
 drivers/watchdog/pcwd.c                            |  2 +-
 drivers/watchdog/pika_wdt.c                        |  2 +-
 drivers/watchdog/sbc60xxwdt.c                      |  4 +-
 drivers/watchdog/sc520_wdt.c                       |  2 +-
 drivers/watchdog/shwdt.c                           |  2 +-
 drivers/watchdog/via_wdt.c                         |  2 +-
 drivers/watchdog/w83877f_wdt.c                     |  4 +-
 fs/afs/fs_probe.c                                  |  2 +-
 fs/afs/server.c                                    |  2 +-
 fs/bcachefs/clock.c                                |  2 +-
 fs/btrfs/zstd.c                                    |  2 +-
 fs/ext4/super.c                                    |  2 +-
 fs/jbd2/journal.c                                  |  4 +-
 fs/jffs2/wbuf.c                                    |  2 +-
 fs/nilfs2/segment.c                                |  2 +-
 fs/ocfs2/cluster/tcp.c                             |  2 +-
 fs/pstore/platform.c                               |  2 +-
 include/linux/hrtimer.h                            |  2 -
 include/linux/hrtimer_types.h                      |  4 +-
 include/linux/timer.h                              | 36 +----------
 include/net/sctp/sctp.h                            |  2 +-
 include/trace/events/timer.h                       |  8 +--
 kernel/cgroup/cgroup.c                             |  2 +-
 kernel/kcsan/kcsan_test.c                          |  2 +-
 kernel/kthread.c                                   |  4 +-
 kernel/rcu/rcutorture.c                            |  2 +-
 kernel/rcu/srcutree.c                              |  2 +-
 kernel/rcu/tasks.h                                 |  2 +-
 kernel/rcu/tree_nocb.h                             |  4 +-
 kernel/sched/psi.c                                 |  2 +-
 kernel/time/clocksource.c                          |  2 +-
 kernel/time/hrtimer.c                              | 71 ++++++--------------=
--
 kernel/time/sleep_timeout.c                        |  2 +-
 kernel/time/timer.c                                |  8 +--
 kernel/time/timer_list.c                           |  2 +-
 kernel/workqueue.c                                 | 14 ++---
 mm/backing-dev.c                                   |  2 +-
 mm/page-writeback.c                                |  4 +-
 net/appletalk/aarp.c                               |  4 +-
 net/atm/clip.c                                     |  2 +-
 net/atm/lec.c                                      | 26 ++++----
 net/atm/mpc.c                                      |  4 +-
 net/ax25/af_ax25.c                                 | 10 +--
 net/ax25/ax25_ds_timer.c                           |  2 +-
 net/ax25/ax25_subr.c                               | 10 +--
 net/ax25/ax25_timer.c                              | 14 ++---
 net/batman-adv/tp_meter.c                          |  6 +-
 net/bluetooth/hidp/core.c                          |  2 +-
 net/bluetooth/rfcomm/core.c                        |  4 +-
 net/bridge/br_mdb.c                                |  6 +-
 net/bridge/br_multicast.c                          | 44 +++++++-------
 net/bridge/br_stp.c                                | 14 ++---
 net/bridge/br_stp_if.c                             | 12 ++--
 net/can/af_can.c                                   |  2 +-
 net/core/drop_monitor.c                            |  8 +--
 net/core/gen_estimator.c                           |  2 +-
 net/core/neighbour.c                               | 10 +--
 net/core/sock.c                                    |  4 +-
 net/ipv4/igmp.c                                    | 10 +--
 net/ipv4/inet_fragment.c                           |  6 +-
 net/ipv4/ipmr.c                                    |  2 +-
 net/ipv6/addrconf.c                                |  2 +-
 net/ipv6/ip6_fib.c                                 |  4 +-
 net/ipv6/ip6_flowlabel.c                           |  2 +-
 net/ipv6/ip6mr.c                                   |  2 +-
 net/lapb/lapb_iface.c                              |  4 +-
 net/lapb/lapb_timer.c                              |  8 +--
 net/llc/llc_c_ac.c                                 | 18 +++---
 net/llc/llc_conn.c                                 | 16 ++---
 net/mac80211/agg-rx.c                              |  4 +-
 net/mac80211/agg-tx.c                              |  6 +-
 net/mac80211/ibss.c                                |  2 +-
 net/mac80211/iface.c                               |  2 +-
 net/mac80211/led.c                                 |  2 +-
 net/mac80211/mesh.c                                |  8 +--
 net/mac80211/mesh_plink.c                          | 12 ++--
 net/mac80211/mlme.c                                | 16 ++---
 net/mac80211/ocb.c                                 |  2 +-
 net/mac80211/offchannel.c                          |  6 +-
 net/mac80211/pm.c                                  |  4 +-
 net/mac80211/rx.c                                  |  2 +-
 net/mac80211/sta_info.c                            |  2 +-
 net/mctp/af_mctp.c                                 |  2 +-
 net/mptcp/pm.c                                     |  2 +-
 net/ncsi/ncsi-manage.c                             |  4 +-
 net/netfilter/ipset/ip_set_bitmap_gen.h            |  2 +-
 net/netfilter/ipvs/ip_vs_conn.c                    |  6 +-
 net/netfilter/ipvs/ip_vs_ctl.c                     |  2 +-
 net/netfilter/nf_conntrack_expect.c                | 10 +--
 net/netfilter/nf_conntrack_netlink.c               |  4 +-
 net/netfilter/nfnetlink_log.c                      |  2 +-
 net/netrom/nr_loopback.c                           |  2 +-
 net/nfc/core.c                                     |  6 +-
 net/nfc/hci/core.c                                 |  4 +-
 net/nfc/hci/llc_shdlc.c                            |  8 +--
 net/nfc/llcp_core.c                                |  6 +-
 net/nfc/nci/core.c                                 |  6 +-
 net/nfc/nci/data.c                                 |  2 +-
 net/nfc/nci/rsp.c                                  |  2 +-
 net/packet/af_packet.c                             |  2 +-
 net/rose/rose_link.c                               |  8 +--
 net/rose/rose_loopback.c                           |  2 +-
 net/rose/rose_route.c                              |  4 +-
 net/rxrpc/call_event.c                             |  2 +-
 net/rxrpc/call_object.c                            |  4 +-
 net/rxrpc/conn_client.c                            |  2 +-
 net/rxrpc/conn_object.c                            |  8 +--
 net/rxrpc/net_ns.c                                 |  4 +-
 net/sched/sch_fq_pie.c                             |  2 +-
 net/sched/sch_generic.c                            |  2 +-
 net/sched/sch_pie.c                                |  2 +-
 net/sched/sch_red.c                                |  4 +-
 net/sched/sch_sfq.c                                |  4 +-
 net/sctp/associola.c                               |  4 +-
 net/sctp/input.c                                   |  2 +-
 net/sctp/output.c                                  |  2 +-
 net/sctp/outqueue.c                                |  5 +-
 net/sctp/protocol.c                                |  2 +-
 net/sctp/sm_sideeffect.c                           |  6 +-
 net/sctp/stream.c                                  |  6 +-
 net/sctp/transport.c                               | 12 ++--
 net/sunrpc/xprt.c                                  |  4 +-
 net/tipc/node.c                                    |  2 +-
 net/tipc/subscr.c                                  |  2 +-
 net/wireless/core.c                                |  6 +-
 net/x25/x25_link.c                                 |  2 +-
 net/x25/x25_timer.c                                |  4 +-
 net/xfrm/xfrm_policy.c                             | 10 +--
 net/xfrm/xfrm_state.c                              |  2 +-
 samples/connector/cn_test.c                        |  2 +-
 samples/ftrace/sample-trace-array.c                |  2 +-
 sound/core/timer.c                                 |  4 +-
 sound/drivers/aloop.c                              |  4 +-
 sound/drivers/dummy.c                              |  2 +-
 sound/drivers/mpu401/mpu401_uart.c                 |  2 +-
 sound/drivers/mtpav.c                              |  2 +-
 sound/drivers/opl3/opl3_seq.c                      |  2 +-
 sound/drivers/serial-u16550.c                      |  2 +-
 sound/i2c/other/ak4117.c                           |  2 +-
 sound/isa/sb/emu8000_pcm.c                         |  2 +-
 sound/isa/sb/sb8_midi.c                            |  4 +-
 sound/isa/wavefront/wavefront_midi.c               |  4 +-
 sound/pci/asihpi/asihpi.c                          |  2 +-
 sound/pci/ctxfi/cttimer.c                          |  2 +-
 sound/pci/echoaudio/midi.c                         |  2 +-
 sound/pci/rme9652/hdsp.c                           |  2 +-
 sound/pci/rme9652/hdspm.c                          |  2 +-
 sound/sh/aica.c                                    |  2 +-
 sound/soc/codecs/rt5645.c                          |  4 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |  4 +-
 sound/soc/ti/ams-delta.c                           |  2 +-
 sound/usb/midi.c                                   |  2 +-
 tools/perf/tests/shell/trace_btf_enum.sh           |  2 +-
 797 files changed, 1651 insertions(+), 1722 deletions(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index 2b74f96d09d5..c9e88bf65709 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -3077,7 +3077,7 @@ Notice that we lost the sys_nanosleep.
   # cat set_ftrace_filter
   hrtimer_run_queues
   hrtimer_run_pending
-  hrtimer_init
+  hrtimer_setup
   hrtimer_cancel
   hrtimer_try_to_cancel
   hrtimer_forward
@@ -3115,7 +3115,7 @@ Again, now we want to append.
   # cat set_ftrace_filter
   hrtimer_run_queues
   hrtimer_run_pending
-  hrtimer_init
+  hrtimer_setup
   hrtimer_cancel
   hrtimer_try_to_cancel
   hrtimer_forward
diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
index b9cd364e814e..a89ce84371f9 100644
--- a/arch/alpha/kernel/srmcons.c
+++ b/arch/alpha/kernel/srmcons.c
@@ -177,7 +177,7 @@ srmcons_close(struct tty_struct *tty, struct file *filp)
=20
 	if (tty->count =3D=3D 1) {
 		port->tty =3D NULL;
-		del_timer(&srmconsp->timer);
+		timer_delete(&srmconsp->timer);
 	}
=20
 	spin_unlock_irqrestore(&port->lock, flags);
diff --git a/arch/arm/mach-footbridge/dc21285.c b/arch/arm/mach-footbridge/dc=
21285.c
index f8920d0010de..6521ab3d24fa 100644
--- a/arch/arm/mach-footbridge/dc21285.c
+++ b/arch/arm/mach-footbridge/dc21285.c
@@ -135,7 +135,7 @@ static struct timer_list perr_timer;
=20
 static void dc21285_enable_error(struct timer_list *timer)
 {
-	del_timer(timer);
+	timer_delete(timer);
=20
 	if (timer =3D=3D &serr_timer)
 		enable_irq(IRQ_PCI_SERR);
diff --git a/arch/arm/mach-pxa/sharpsl_pm.c b/arch/arm/mach-pxa/sharpsl_pm.c
index dd930e3a61a4..71b282b146d0 100644
--- a/arch/arm/mach-pxa/sharpsl_pm.c
+++ b/arch/arm/mach-pxa/sharpsl_pm.c
@@ -913,8 +913,8 @@ static void sharpsl_pm_remove(struct platform_device *pde=
v)
 	if (sharpsl_pm.machinfo->exit)
 		sharpsl_pm.machinfo->exit();
=20
-	del_timer_sync(&sharpsl_pm.chrg_full_timer);
-	del_timer_sync(&sharpsl_pm.ac_timer);
+	timer_delete_sync(&sharpsl_pm.chrg_full_timer);
+	timer_delete_sync(&sharpsl_pm.ac_timer);
 }
=20
 static struct platform_driver sharpsl_pm_driver =3D {
diff --git a/arch/m68k/amiga/amisound.c b/arch/m68k/amiga/amisound.c
index 714fe8ec6afa..5fd93dfab809 100644
--- a/arch/m68k/amiga/amisound.c
+++ b/arch/m68k/amiga/amisound.c
@@ -78,7 +78,7 @@ void amiga_mksound( unsigned int hz, unsigned int ticks )
 		return;
=20
 	local_irq_save(flags);
-	del_timer( &sound_timer );
+	timer_delete(&sound_timer);
=20
 	if (hz > 20 && hz < 32767) {
 		unsigned long period =3D (clock_constant / hz);
diff --git a/arch/m68k/mac/macboing.c b/arch/m68k/mac/macboing.c
index faea2265a540..6312d5b600a5 100644
--- a/arch/m68k/mac/macboing.c
+++ b/arch/m68k/mac/macboing.c
@@ -183,7 +183,7 @@ void mac_mksound( unsigned int freq, unsigned int length )
=20
 	local_irq_save(flags);
=20
-	del_timer( &mac_sound_timer );
+	timer_delete(&mac_sound_timer);
=20
 	for ( i =3D 0; i < 0x800; i++ )
 		mac_asc_regs[ i ] =3D 0;
@@ -277,7 +277,7 @@ static void mac_quadra_ring_bell(struct timer_list *unuse=
d)
=20
 	local_irq_save(flags);
=20
-	del_timer( &mac_sound_timer );
+	timer_delete(&mac_sound_timer);
=20
 	if ( mac_bell_duration-- > 0 )
 	{
diff --git a/arch/mips/sgi-ip22/ip22-reset.c b/arch/mips/sgi-ip22/ip22-reset.c
index 8f0861c58080..8539f562f5b8 100644
--- a/arch/mips/sgi-ip22/ip22-reset.c
+++ b/arch/mips/sgi-ip22/ip22-reset.c
@@ -98,7 +98,7 @@ static void blink_timeout(struct timer_list *unused)
=20
 static void debounce(struct timer_list *unused)
 {
-	del_timer(&debounce_timer);
+	timer_delete(&debounce_timer);
 	if (sgint->istat1 & SGINT_ISTAT1_PWR) {
 		/* Interrupt still being sent. */
 		debounce_timer.expires =3D jiffies + (HZ / 20); /* 0.05s	*/
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 6a5be025a8af..6a4805968966 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -622,7 +622,7 @@ static void arm_next_watchdog(struct kvm_vcpu *vcpu)
 	if (nr_jiffies < NEXT_TIMER_MAX_DELTA)
 		mod_timer(&vcpu->arch.wdt_timer, jiffies + nr_jiffies);
 	else
-		del_timer(&vcpu->arch.wdt_timer);
+		timer_delete(&vcpu->arch.wdt_timer);
 	spin_unlock_irqrestore(&vcpu->arch.wdt_lock, flags);
 }
=20
@@ -1441,7 +1441,7 @@ int kvmppc_subarch_vcpu_init(struct kvm_vcpu *vcpu)
=20
 void kvmppc_subarch_vcpu_uninit(struct kvm_vcpu *vcpu)
 {
-	del_timer_sync(&vcpu->arch.wdt_timer);
+	timer_delete_sync(&vcpu->arch.wdt_timer);
 }
=20
 int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *reg=
s)
diff --git a/arch/powerpc/platforms/cell/spufs/sched.c b/arch/powerpc/platfor=
ms/cell/spufs/sched.c
index 610ca8570682..8e7ed010bfde 100644
--- a/arch/powerpc/platforms/cell/spufs/sched.c
+++ b/arch/powerpc/platforms/cell/spufs/sched.c
@@ -508,7 +508,7 @@ static void __spu_del_from_rq(struct spu_context *ctx)
=20
 	if (!list_empty(&ctx->rq)) {
 		if (!--spu_prio->nr_waiting)
-			del_timer(&spusched_timer);
+			timer_delete(&spusched_timer);
 		list_del_init(&ctx->rq);
=20
 		if (list_empty(&spu_prio->runq[prio]))
@@ -1126,8 +1126,8 @@ void spu_sched_exit(void)
=20
 	remove_proc_entry("spu_loadavg", NULL);
=20
-	del_timer_sync(&spusched_timer);
-	del_timer_sync(&spuloadavg_timer);
+	timer_delete_sync(&spusched_timer);
+	timer_delete_sync(&spuloadavg_timer);
 	kthread_stop(spusched_task);
=20
 	for (node =3D 0; node < MAX_NUMNODES; node++) {
diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platfor=
ms/powermac/low_i2c.c
index c097d591670e..a0ae58636e10 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -347,7 +347,7 @@ static irqreturn_t kw_i2c_irq(int irq, void *dev_id)
 	unsigned long flags;
=20
 	spin_lock_irqsave(&host->lock, flags);
-	del_timer(&host->timeout_timer);
+	timer_delete(&host->timeout_timer);
 	kw_i2c_handle_interrupt(host, kw_read_reg(reg_isr));
 	if (host->state !=3D state_idle) {
 		host->timeout_timer.expires =3D jiffies + KW_POLL_TIMEOUT;
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index c900deddd36d..fed17d407a44 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -680,7 +680,7 @@ static void stp_work_fn(struct work_struct *work)
=20
 	if (!stp_online) {
 		chsc_sstpc(stp_page, STP_OP_CTRL, 0x0000, NULL);
-		del_timer_sync(&stp_timer);
+		timer_delete_sync(&stp_timer);
 		goto out_unlock;
 	}
=20
diff --git a/arch/s390/mm/cmm.c b/arch/s390/mm/cmm.c
index 39f44b6256e0..e2a6eb92420f 100644
--- a/arch/s390/mm/cmm.c
+++ b/arch/s390/mm/cmm.c
@@ -201,7 +201,7 @@ static void cmm_set_timer(void)
 {
 	if (cmm_timed_pages_target <=3D 0 || cmm_timeout_seconds <=3D 0) {
 		if (timer_pending(&cmm_timer))
-			del_timer(&cmm_timer);
+			timer_delete(&cmm_timer);
 		return;
 	}
 	mod_timer(&cmm_timer, jiffies + secs_to_jiffies(cmm_timeout_seconds));
@@ -424,7 +424,7 @@ static int __init cmm_init(void)
 #endif
 	unregister_sysctl_table(cmm_sysctl_header);
 out_sysctl:
-	del_timer_sync(&cmm_timer);
+	timer_delete_sync(&cmm_timer);
 	return rc;
 }
 module_init(cmm_init);
@@ -437,7 +437,7 @@ static void __exit cmm_exit(void)
 #endif
 	unregister_oom_notifier(&cmm_oom_nb);
 	kthread_stop(cmm_thread_ptr);
-	del_timer_sync(&cmm_timer);
+	timer_delete_sync(&cmm_timer);
 	cmm_free_pages(cmm_pages, &cmm_pages, &cmm_page_list);
 	cmm_free_pages(cmm_timed_pages, &cmm_timed_pages, &cmm_timed_page_list);
 }
diff --git a/arch/sh/drivers/pci/common.c b/arch/sh/drivers/pci/common.c
index ab9e791070b4..5442475d132e 100644
--- a/arch/sh/drivers/pci/common.c
+++ b/arch/sh/drivers/pci/common.c
@@ -90,7 +90,7 @@ static void pcibios_enable_err(struct timer_list *t)
 {
 	struct pci_channel *hose =3D from_timer(hose, t, err_timer);
=20
-	del_timer(&hose->err_timer);
+	timer_delete(&hose->err_timer);
 	printk(KERN_DEBUG "PCI: re-enabling error IRQ.\n");
 	enable_irq(hose->err_irq);
 }
@@ -99,7 +99,7 @@ static void pcibios_enable_serr(struct timer_list *t)
 {
 	struct pci_channel *hose =3D from_timer(hose, t, serr_timer);
=20
-	del_timer(&hose->serr_timer);
+	timer_delete(&hose->serr_timer);
 	printk(KERN_DEBUG "PCI: re-enabling system error IRQ.\n");
 	enable_irq(hose->serr_irq);
 }
diff --git a/arch/sparc/kernel/led.c b/arch/sparc/kernel/led.c
index ab657b359789..f4fb82b019bb 100644
--- a/arch/sparc/kernel/led.c
+++ b/arch/sparc/kernel/led.c
@@ -84,7 +84,7 @@ static ssize_t led_proc_write(struct file *file, const char=
 __user *buffer,
 	/* before we change anything we want to stop any running timers,
 	 * otherwise calls such as on will have no persistent effect
 	 */
-	del_timer_sync(&led_blink_timer);
+	timer_delete_sync(&led_blink_timer);
=20
 	if (!strcmp(buf, "on")) {
 		auxio_set_led(AUXIO_LED_ON);
@@ -134,7 +134,7 @@ static int __init led_init(void)
 static void __exit led_exit(void)
 {
 	remove_proc_entry("led", NULL);
-	del_timer_sync(&led_blink_timer);
+	timer_delete_sync(&led_blink_timer);
 }
=20
 module_init(led_init);
diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index 85b129e2b70b..b97bb52dd562 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -1112,7 +1112,7 @@ static int vector_net_close(struct net_device *dev)
 	struct vector_private *vp =3D netdev_priv(dev);
=20
 	netif_stop_queue(dev);
-	del_timer(&vp->tl);
+	timer_delete(&vp->tl);
=20
 	vp->opened =3D false;
=20
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 1f14c3308b6b..f6fd71b64b66 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1786,13 +1786,13 @@ void mce_timer_kick(bool storm)
 		__this_cpu_write(mce_next_interval, check_interval * HZ);
 }
=20
-/* Must not be called in IRQ context where del_timer_sync() can deadlock */
+/* Must not be called in IRQ context where timer_delete_sync() can deadlock =
*/
 static void mce_timer_delete_all(void)
 {
 	int cpu;
=20
 	for_each_online_cpu(cpu)
-		del_timer_sync(&per_cpu(mce_timer, cpu));
+		timer_delete_sync(&per_cpu(mce_timer, cpu));
 }
=20
 static void __mcheck_cpu_mce_banks_init(void)
@@ -2820,7 +2820,7 @@ static int mce_cpu_pre_down(unsigned int cpu)
 	struct timer_list *t =3D this_cpu_ptr(&mce_timer);
=20
 	mce_disable_cpu();
-	del_timer_sync(t);
+	timer_delete_sync(t);
 	mce_threshold_remove_device(cpu);
 	mce_device_remove(cpu);
 	return 0;
diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index bd21e9c335ad..38b33cdd4232 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -1553,7 +1553,7 @@ static bool kvm_xen_schedop_poll(struct kvm_vcpu *vcpu,=
 bool longmode,
 		kvm_vcpu_halt(vcpu);
=20
 		if (sched_poll.timeout)
-			del_timer(&vcpu->arch.xen.poll_timer);
+			timer_delete(&vcpu->arch.xen.poll_timer);
=20
 		kvm_set_mp_state(vcpu, KVM_MP_STATE_RUNNABLE);
 	}
@@ -2308,7 +2308,7 @@ void kvm_xen_destroy_vcpu(struct kvm_vcpu *vcpu)
 	kvm_gpc_deactivate(&vcpu->arch.xen.vcpu_info_cache);
 	kvm_gpc_deactivate(&vcpu->arch.xen.vcpu_time_info_cache);
=20
-	del_timer_sync(&vcpu->arch.xen.poll_timer);
+	timer_delete_sync(&vcpu->arch.xen.poll_timer);
 }
=20
 void kvm_xen_init_vm(struct kvm *kvm)
diff --git a/arch/xtensa/platforms/iss/console.c b/arch/xtensa/platforms/iss/=
console.c
index abec44b687df..8b95221375a8 100644
--- a/arch/xtensa/platforms/iss/console.c
+++ b/arch/xtensa/platforms/iss/console.c
@@ -48,7 +48,7 @@ static int rs_open(struct tty_struct *tty, struct file * fi=
lp)
 static void rs_close(struct tty_struct *tty, struct file * filp)
 {
 	if (tty->count =3D=3D 1)
-		del_timer_sync(&serial_timer);
+		timer_delete_sync(&serial_timer);
 }
=20
=20
diff --git a/arch/xtensa/platforms/iss/network.c b/arch/xtensa/platforms/iss/=
network.c
index e89f27f2bb18..c6d8c62695e1 100644
--- a/arch/xtensa/platforms/iss/network.c
+++ b/arch/xtensa/platforms/iss/network.c
@@ -375,7 +375,7 @@ static int iss_net_close(struct net_device *dev)
 	struct iss_net_private *lp =3D netdev_priv(dev);
=20
 	netif_stop_queue(dev);
-	del_timer_sync(&lp->timer);
+	timer_delete_sync(&lp->timer);
 	lp->tp.net_ops->close(lp);
=20
 	return 0;
diff --git a/block/blk-core.c b/block/blk-core.c
index 4623de79effa..e8cc270a453f 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -219,7 +219,7 @@ EXPORT_SYMBOL_GPL(blk_status_to_str);
  */
 void blk_sync_queue(struct request_queue *q)
 {
-	del_timer_sync(&q->timeout);
+	timer_delete_sync(&q->timeout);
 	cancel_work_sync(&q->timeout_work);
 }
 EXPORT_SYMBOL(blk_sync_queue);
diff --git a/block/blk-stat.c b/block/blk-stat.c
index eaf60097bbe1..46449da856f8 100644
--- a/block/blk-stat.c
+++ b/block/blk-stat.c
@@ -162,7 +162,7 @@ void blk_stat_remove_callback(struct request_queue *q,
 		blk_queue_flag_clear(QUEUE_FLAG_STATS, q);
 	spin_unlock_irqrestore(&q->stats->lock, flags);
=20
-	del_timer_sync(&cb->timer);
+	timer_delete_sync(&cb->timer);
 }
=20
 static void blk_stat_free_callback_rcu(struct rcu_head *head)
diff --git a/block/blk-stat.h b/block/blk-stat.h
index 5d7f18ba436d..9e05bf18d1be 100644
--- a/block/blk-stat.h
+++ b/block/blk-stat.h
@@ -148,7 +148,7 @@ static inline void blk_stat_activate_nsecs(struct blk_sta=
t_callback *cb,
=20
 static inline void blk_stat_deactivate(struct blk_stat_callback *cb)
 {
-	del_timer_sync(&cb->timer);
+	timer_delete_sync(&cb->timer);
 }
=20
 /**
diff --git a/block/blk-throttle.c b/block/blk-throttle.c
index 91dab43c65ab..d6dd2e047874 100644
--- a/block/blk-throttle.c
+++ b/block/blk-throttle.c
@@ -333,7 +333,7 @@ static void throtl_pd_free(struct blkg_policy_data *pd)
 {
 	struct throtl_grp *tg =3D pd_to_tg(pd);
=20
-	del_timer_sync(&tg->service_queue.pending_timer);
+	timer_delete_sync(&tg->service_queue.pending_timer);
 	blkg_rwstat_exit(&tg->stat_bytes);
 	blkg_rwstat_exit(&tg->stat_ios);
 	kfree(tg);
@@ -1711,7 +1711,7 @@ void blk_throtl_exit(struct gendisk *disk)
 	if (!blk_throtl_activated(q))
 		return;
=20
-	del_timer_sync(&q->td->service_queue.pending_timer);
+	timer_delete_sync(&q->td->service_queue.pending_timer);
 	throtl_shutdown_wq(q);
 	blkcg_deactivate_policy(disk, &blkcg_policy_throtl);
 	kfree(q->td);
diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_tim=
esync.c
index 2473c66309d4..972833fabcfc 100644
--- a/drivers/accel/qaic/qaic_timesync.c
+++ b/drivers/accel/qaic/qaic_timesync.c
@@ -221,7 +221,7 @@ static void qaic_timesync_remove(struct mhi_device *mhi_d=
ev)
 {
 	struct mqts_dev *mqtsdev =3D dev_get_drvdata(&mhi_dev->dev);
=20
-	del_timer_sync(&mqtsdev->timer);
+	timer_delete_sync(&mqtsdev->timer);
 	mhi_unprepare_from_transfer(mqtsdev->mhi_dev);
 	kfree(mqtsdev->sync_msg);
 	kfree(mqtsdev);
diff --git a/drivers/accessibility/speakup/main.c b/drivers/accessibility/spe=
akup/main.c
index f677ad2177c2..e68cf1d83787 100644
--- a/drivers/accessibility/speakup/main.c
+++ b/drivers/accessibility/speakup/main.c
@@ -1172,13 +1172,13 @@ static void do_handle_shift(struct vc_data *vc, u_cha=
r value, char up_flag)
 	if (cursor_track =3D=3D read_all_mode) {
 		switch (value) {
 		case KVAL(K_SHIFT):
-			del_timer(&cursor_timer);
+			timer_delete(&cursor_timer);
 			spk_shut_up &=3D 0xfe;
 			spk_do_flush();
 			read_all_doc(vc);
 			break;
 		case KVAL(K_CTRL):
-			del_timer(&cursor_timer);
+			timer_delete(&cursor_timer);
 			cursor_track =3D prev_cursor_track;
 			spk_shut_up &=3D 0xfe;
 			spk_do_flush();
@@ -1399,7 +1399,7 @@ static void start_read_all_timer(struct vc_data *vc, en=
um read_all_command comma
=20
 static void kbd_fakekey2(struct vc_data *vc, enum read_all_command command)
 {
-	del_timer(&cursor_timer);
+	timer_delete(&cursor_timer);
 	speakup_fake_down_arrow();
 	start_read_all_timer(vc, command);
 }
@@ -1415,7 +1415,7 @@ static void read_all_doc(struct vc_data *vc)
 	cursor_track =3D read_all_mode;
 	spk_reset_index_count(0);
 	if (get_sentence_buf(vc, 0) =3D=3D -1) {
-		del_timer(&cursor_timer);
+		timer_delete(&cursor_timer);
 		if (!in_keyboard_notifier)
 			speakup_fake_down_arrow();
 		start_read_all_timer(vc, RA_DOWN_ARROW);
@@ -1428,7 +1428,7 @@ static void read_all_doc(struct vc_data *vc)
=20
 static void stop_read_all(struct vc_data *vc)
 {
-	del_timer(&cursor_timer);
+	timer_delete(&cursor_timer);
 	cursor_track =3D prev_cursor_track;
 	spk_shut_up &=3D 0xfe;
 	spk_do_flush();
@@ -1528,7 +1528,7 @@ static int pre_handle_cursor(struct vc_data *vc, u_char=
 value, char up_flag)
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
 			return NOTIFY_STOP;
 		}
-		del_timer(&cursor_timer);
+		timer_delete(&cursor_timer);
 		spk_shut_up &=3D 0xfe;
 		spk_do_flush();
 		start_read_all_timer(vc, value + 1);
@@ -1692,7 +1692,7 @@ static void cursor_done(struct timer_list *unused)
 	struct vc_data *vc =3D vc_cons[cursor_con].d;
 	unsigned long flags;
=20
-	del_timer(&cursor_timer);
+	timer_delete(&cursor_timer);
 	spin_lock_irqsave(&speakup_info.spinlock, flags);
 	if (cursor_con !=3D fg_console) {
 		is_cursor =3D 0;
@@ -2333,7 +2333,7 @@ static void __exit speakup_exit(void)
 	speakup_unregister_devsynth();
 	speakup_cancel_selection();
 	speakup_cancel_paste();
-	del_timer_sync(&cursor_timer);
+	timer_delete_sync(&cursor_timer);
 	kthread_stop(speakup_task);
 	speakup_task =3D NULL;
 	mutex_lock(&spk_mutex);
@@ -2437,7 +2437,7 @@ static int __init speakup_init(void)
=20
 error_vtnotifier:
 	unregister_keyboard_notifier(&keyboard_notifier_block);
-	del_timer(&cursor_timer);
+	timer_delete(&cursor_timer);
=20
 error_kbdnotifier:
 	speakup_unregister_devsynth();
diff --git a/drivers/accessibility/speakup/synth.c b/drivers/accessibility/sp=
eakup/synth.c
index 85062e605d79..d8addbf3ad0d 100644
--- a/drivers/accessibility/speakup/synth.c
+++ b/drivers/accessibility/speakup/synth.c
@@ -521,7 +521,7 @@ void synth_release(void)
 	spin_lock_irqsave(&speakup_info.spinlock, flags);
 	pr_info("releasing synth %s\n", synth->name);
 	synth->alive =3D 0;
-	del_timer(&thread_timer);
+	timer_delete(&thread_timer);
 	spin_unlock_irqrestore(&speakup_info.spinlock, flags);
 	if (synth->attributes.name)
 		sysfs_remove_group(speakup_kobj, &synth->attributes);
diff --git a/drivers/ata/libata-eh.c b/drivers/ata/libata-eh.c
index 16cd676eae1f..b990c1ee0b12 100644
--- a/drivers/ata/libata-eh.c
+++ b/drivers/ata/libata-eh.c
@@ -700,7 +700,7 @@ void ata_scsi_port_error_handler(struct Scsi_Host *host, =
struct ata_port *ap)
 	ata_eh_acquire(ap);
  repeat:
 	/* kill fast drain timer */
-	del_timer_sync(&ap->fastdrain_timer);
+	timer_delete_sync(&ap->fastdrain_timer);
=20
 	/* process port resume request */
 	ata_eh_handle_port_resume(ap);
diff --git a/drivers/atm/idt77105.c b/drivers/atm/idt77105.c
index fcd70e094a2e..e6a300203e6c 100644
--- a/drivers/atm/idt77105.c
+++ b/drivers/atm/idt77105.c
@@ -366,8 +366,8 @@ EXPORT_SYMBOL(idt77105_init);
 static void __exit idt77105_exit(void)
 {
 	/* turn off timers */
-	del_timer_sync(&stats_timer);
-	del_timer_sync(&restart_timer);
+	timer_delete_sync(&stats_timer);
+	timer_delete_sync(&restart_timer);
 }
=20
 module_exit(idt77105_exit);
diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c
index d213adcefe33..301e697e22ad 100644
--- a/drivers/atm/iphase.c
+++ b/drivers/atm/iphase.c
@@ -3283,7 +3283,7 @@ static void __exit ia_module_exit(void)
 {
 	pci_unregister_driver(&ia_driver);
=20
-	del_timer_sync(&ia_timer);
+	timer_delete_sync(&ia_timer);
 }
=20
 module_init(ia_module_init);
diff --git a/drivers/atm/lanai.c b/drivers/atm/lanai.c
index 32d7aa141d96..00fe25b5b6a3 100644
--- a/drivers/atm/lanai.c
+++ b/drivers/atm/lanai.c
@@ -1792,7 +1792,7 @@ static inline void lanai_timed_poll_start(struct lanai_=
dev *lanai)
=20
 static inline void lanai_timed_poll_stop(struct lanai_dev *lanai)
 {
-	del_timer_sync(&lanai->timer);
+	timer_delete_sync(&lanai->timer);
 }
=20
 /* -------------------- INTERRUPT SERVICE: */
diff --git a/drivers/atm/nicstar.c b/drivers/atm/nicstar.c
index 27153d6bc781..45952cfea06b 100644
--- a/drivers/atm/nicstar.c
+++ b/drivers/atm/nicstar.c
@@ -300,7 +300,7 @@ static void __exit nicstar_cleanup(void)
 {
 	XPRINTK("nicstar: nicstar_cleanup() called.\n");
=20
-	del_timer_sync(&ns_timer);
+	timer_delete_sync(&ns_timer);
=20
 	pci_unregister_driver(&nicstar_driver);
=20
diff --git a/drivers/atm/suni.c b/drivers/atm/suni.c
index 32802ea9521c..7d0fa729c2fe 100644
--- a/drivers/atm/suni.c
+++ b/drivers/atm/suni.c
@@ -347,7 +347,7 @@ static int suni_stop(struct atm_dev *dev)
 	for (walk =3D &sunis; *walk !=3D PRIV(dev);
 	    walk =3D &PRIV((*walk)->dev)->next);
 	*walk =3D PRIV((*walk)->dev)->next;
-	if (!sunis) del_timer_sync(&poll_timer);
+	if (!sunis) timer_delete_sync(&poll_timer);
 	spin_unlock_irqrestore(&sunis_lock,flags);
 	kfree(PRIV(dev));
=20
diff --git a/drivers/auxdisplay/line-display.c b/drivers/auxdisplay/line-disp=
lay.c
index fcec77f100ce..b6808c4f89b6 100644
--- a/drivers/auxdisplay/line-display.c
+++ b/drivers/auxdisplay/line-display.c
@@ -84,7 +84,7 @@ static int linedisp_display(struct linedisp *linedisp, cons=
t char *msg,
 	char *new_msg;
=20
 	/* stop the scroll timer */
-	del_timer_sync(&linedisp->timer);
+	timer_delete_sync(&linedisp->timer);
=20
 	if (count =3D=3D -1)
 		count =3D strlen(msg);
@@ -183,7 +183,7 @@ static ssize_t scroll_step_ms_store(struct device *dev,
=20
 	linedisp->scroll_rate =3D msecs_to_jiffies(ms);
 	if (linedisp->message && linedisp->message_len > linedisp->num_chars) {
-		del_timer_sync(&linedisp->timer);
+		timer_delete_sync(&linedisp->timer);
 		if (linedisp->scroll_rate)
 			linedisp_scroll(&linedisp->timer);
 	}
@@ -376,7 +376,7 @@ int linedisp_register(struct linedisp *linedisp, struct d=
evice *parent,
 out_del_dev:
 	device_del(&linedisp->dev);
 out_del_timer:
-	del_timer_sync(&linedisp->timer);
+	timer_delete_sync(&linedisp->timer);
 out_put_device:
 	put_device(&linedisp->dev);
 	return err;
@@ -391,7 +391,7 @@ EXPORT_SYMBOL_NS_GPL(linedisp_register, "LINEDISP");
 void linedisp_unregister(struct linedisp *linedisp)
 {
 	device_del(&linedisp->dev);
-	del_timer_sync(&linedisp->timer);
+	timer_delete_sync(&linedisp->timer);
 	put_device(&linedisp->dev);
 }
 EXPORT_SYMBOL_NS_GPL(linedisp_unregister, "LINEDISP");
diff --git a/drivers/auxdisplay/panel.c b/drivers/auxdisplay/panel.c
index 91ccb9789d43..958c0e31e84a 100644
--- a/drivers/auxdisplay/panel.c
+++ b/drivers/auxdisplay/panel.c
@@ -1654,7 +1654,7 @@ static void panel_attach(struct parport *port)
=20
 err_lcd_unreg:
 	if (scan_timer.function)
-		del_timer_sync(&scan_timer);
+		timer_delete_sync(&scan_timer);
 	if (lcd.enabled)
 		charlcd_unregister(lcd.charlcd);
 err_unreg_device:
@@ -1675,7 +1675,7 @@ static void panel_detach(struct parport *port)
 		return;
 	}
 	if (scan_timer.function)
-		del_timer_sync(&scan_timer);
+		timer_delete_sync(&scan_timer);
=20
 	if (keypad.enabled) {
 		misc_deregister(&keypad_dev);
diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index 64840e5d5fcc..03a39c417dc4 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -41,7 +41,7 @@ struct devcd_entry {
 	 *                                             devcd_data_write()
 	 *                                               mod_delayed_work()
 	 *                                                 try_to_grab_pending()
-	 *                                                   del_timer()
+	 *                                                   timer_delete()
 	 *                                                     debug_assert_init()
 	 *       INIT_DELAYED_WORK()
 	 *       schedule_delayed_work()
diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index ac2a197c1234..c8b0a9e29ed8 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -559,7 +559,7 @@ static void dpm_watchdog_clear(struct dpm_watchdog *wd)
 {
 	struct timer_list *timer =3D &wd->timer;
=20
-	del_timer_sync(timer);
+	timer_delete_sync(timer);
 	destroy_timer_on_stack(timer);
 }
 #else
diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
index 752b417e8129..63bf914a4d44 100644
--- a/drivers/base/power/wakeup.c
+++ b/drivers/base/power/wakeup.c
@@ -197,7 +197,7 @@ void wakeup_source_remove(struct wakeup_source *ws)
 	raw_spin_unlock_irqrestore(&events_lock, flags);
 	synchronize_srcu(&wakeup_srcu);
=20
-	del_timer_sync(&ws->timer);
+	timer_delete_sync(&ws->timer);
 	/*
 	 * Clear timer.function to make wakeup_source_not_registered() treat
 	 * this wakeup source as not registered.
@@ -613,7 +613,7 @@ void __pm_stay_awake(struct wakeup_source *ws)
 	spin_lock_irqsave(&ws->lock, flags);
=20
 	wakeup_source_report_event(ws, false);
-	del_timer(&ws->timer);
+	timer_delete(&ws->timer);
 	ws->timer_expires =3D 0;
=20
 	spin_unlock_irqrestore(&ws->lock, flags);
@@ -693,7 +693,7 @@ static void wakeup_source_deactivate(struct wakeup_source=
 *ws)
 		ws->max_time =3D duration;
=20
 	ws->last_time =3D now;
-	del_timer(&ws->timer);
+	timer_delete(&ws->timer);
 	ws->timer_expires =3D 0;
=20
 	if (ws->autosleep_enabled)
diff --git a/drivers/block/amiflop.c b/drivers/block/amiflop.c
index 9edd4468f755..6357d86eafdc 100644
--- a/drivers/block/amiflop.c
+++ b/drivers/block/amiflop.c
@@ -457,7 +457,7 @@ static int fd_motor_on(int nr)
 {
 	nr &=3D 3;
=20
-	del_timer(motor_off_timer + nr);
+	timer_delete(motor_off_timer + nr);
=20
 	if (!unit[nr].motor) {
 		unit[nr].motor =3D 1;
@@ -1393,7 +1393,7 @@ static int non_int_flush_track (unsigned long nr)
=20
 	nr&=3D3;
 	writefromint =3D 0;
-	del_timer(&post_write_timer);
+	timer_delete(&post_write_timer);
 	get_fdc(nr);
 	if (!fd_motor_on(nr)) {
 		writepending =3D 0;
@@ -1435,7 +1435,7 @@ static int get_track(int drive, int track)
 	}
=20
 	if (unit[drive].dirty =3D=3D 1) {
-		del_timer (flush_track_timer + drive);
+		timer_delete(flush_track_timer + drive);
 		non_int_flush_track (drive);
 	}
 	errcnt =3D 0;
@@ -1591,7 +1591,7 @@ static int fd_locked_ioctl(struct block_device *bdev, b=
lk_mode_t mode,
 	case FDDEFPRM:
 		return -EINVAL;
 	case FDFLUSH: /* unconditionally, even if not needed */
-		del_timer (flush_track_timer + drive);
+		timer_delete(flush_track_timer + drive);
 		non_int_flush_track(drive);
 		break;
 #ifdef RAW_IOCTL
@@ -1714,7 +1714,7 @@ static void floppy_release(struct gendisk *disk)
=20
 	mutex_lock(&amiflop_mutex);
 	if (unit[drive].dirty =3D=3D 1) {
-		del_timer (flush_track_timer + drive);
+		timer_delete(flush_track_timer + drive);
 		non_int_flush_track (drive);
 	}
  =20
diff --git a/drivers/block/aoe/aoedev.c b/drivers/block/aoe/aoedev.c
index 4db7f6ce8ade..141b2a0e03f2 100644
--- a/drivers/block/aoe/aoedev.c
+++ b/drivers/block/aoe/aoedev.c
@@ -274,7 +274,7 @@ freedev(struct aoedev *d)
 	if (!freeing)
 		return;
=20
-	del_timer_sync(&d->timer);
+	timer_delete_sync(&d->timer);
 	if (d->gd) {
 		aoedisk_rm_debugfs(d);
 		del_gendisk(d->gd);
diff --git a/drivers/block/aoe/aoemain.c b/drivers/block/aoe/aoemain.c
index 6238c4c87cfc..cdf6e4041bb9 100644
--- a/drivers/block/aoe/aoemain.c
+++ b/drivers/block/aoe/aoemain.c
@@ -28,7 +28,7 @@ static void discover_timer(struct timer_list *t)
 static void __exit
 aoe_exit(void)
 {
-	del_timer_sync(&timer);
+	timer_delete_sync(&timer);
=20
 	aoenet_exit();
 	unregister_blkdev(AOE_MAJOR, DEVICE_NAME);
diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
index a81ade622a01..7fe14266c12c 100644
--- a/drivers/block/ataflop.c
+++ b/drivers/block/ataflop.c
@@ -494,7 +494,7 @@ static inline void start_timeout(void)
=20
 static inline void stop_timeout(void)
 {
-	del_timer(&timeout_timer);
+	timer_delete(&timeout_timer);
 }
=20
 /* Select the side to use. */
@@ -784,7 +784,7 @@ static int do_format(int drive, int type, struct atari_fo=
rmat_descr *desc)
 	   contents become invalid! */
 	BufferDrive =3D -1;
 	/* stop deselect timer */
-	del_timer( &motor_off_timer );
+	timer_delete(&motor_off_timer);
=20
 	FILL( 60 * (nsect / 9), 0x4e );
 	for( sect =3D 0; sect < nsect; ++sect ) {
@@ -1138,7 +1138,7 @@ static void fd_rwsec_done( int status )
 	DPRINT(("fd_rwsec_done()\n"));
=20
 	if (read_track) {
-		del_timer(&readtrack_timer);
+		timer_delete(&readtrack_timer);
 		if (!MultReadInProgress)
 			return;
 		MultReadInProgress =3D 0;
@@ -1356,7 +1356,7 @@ static void fd_times_out(struct timer_list *unused)
 	/* If the timeout occurred while the readtrack_check timer was
 	 * active, we need to cancel it, else bad things will happen */
 	if (UseTrackbuffer)
-		del_timer( &readtrack_timer );
+		timer_delete(&readtrack_timer);
 	FDC_WRITE( FDCREG_CMD, FDCCMD_FORCI );
 	udelay( 25 );
 =09
@@ -1566,7 +1566,7 @@ static blk_status_t ataflop_queue_rq(struct blk_mq_hw_c=
tx *hctx,
 	}
=20
 	/* stop deselect timer */
-	del_timer( &motor_off_timer );
+	timer_delete(&motor_off_timer);
 	=09
 	ReqCnt =3D 0;
 	ReqCmd =3D rq_data_dir(fd_request);
@@ -2055,7 +2055,7 @@ static void atari_floppy_cleanup(void)
 		blk_mq_free_tag_set(&unit[i].tag_set);
 	}
=20
-	del_timer_sync(&fd_timer);
+	timer_delete_sync(&fd_timer);
 	atari_stram_free(DMABuffer);
 }
=20
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 5bbd312c3e14..ced2cc5f46f2 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -3034,7 +3034,7 @@ void drbd_md_sync(struct drbd_device *device)
 	BUILD_BUG_ON(UI_SIZE !=3D 4);
 	BUILD_BUG_ON(sizeof(struct meta_data_on_disk) !=3D 4096);
=20
-	del_timer(&device->md_sync_timer);
+	timer_delete(&device->md_sync_timer);
 	/* timer may be rearmed by drbd_md_mark_dirty() now. */
 	if (!test_and_clear_bit(MD_DIRTY, &device->flags))
 		return;
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 720fc30e2ecc..e09930c2b226 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1033,7 +1033,7 @@ drbd_determine_dev_size(struct drbd_device *device, enu=
m dds_flags flags, struct
 		/* We do some synchronous IO below, which may take some time.
 		 * Clear the timer, to avoid scary "timer expired!" messages,
 		 * "Superblock" is written out at least twice below, anyways. */
-		del_timer(&device->md_sync_timer);
+		timer_delete(&device->md_sync_timer);
=20
 		/* We won't change the "al-extents" setting, we just may need
 		 * to move the on-disk location of the activity log ringbuffer.
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_rec=
eiver.c
index 0c9f54197768..e5a2e5f7887b 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -5187,7 +5187,7 @@ static int drbd_disconnected(struct drbd_peer_device *p=
eer_device)
 	atomic_set(&device->rs_pending_cnt, 0);
 	wake_up(&device->misc_wait);
=20
-	del_timer_sync(&device->resync_timer);
+	timer_delete_sync(&device->resync_timer);
 	resync_timer_fn(&device->resync_timer);
=20
 	/* wait for all w_e_end_data_req, w_e_end_rsdata_req, w_send_barrier,
diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index abf0486f0d4f..e97432032f01 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -937,7 +937,7 @@ static void floppy_off(unsigned int drive)
 	if (!(fdc_state[fdc].dor & (0x10 << UNIT(drive))))
 		return;
=20
-	del_timer(motor_off_timer + drive);
+	timer_delete(motor_off_timer + drive);
=20
 	/* make spindle stop in a position which minimizes spinup time
 	 * next time */
@@ -1918,7 +1918,7 @@ static int start_motor(void (*function)(void))
 		mask &=3D ~(0x10 << UNIT(current_drive));
=20
 	/* starts motor and selects floppy */
-	del_timer(motor_off_timer + current_drive);
+	timer_delete(motor_off_timer + current_drive);
 	set_dor(current_fdc, mask, data);
=20
 	/* wait_for_completion also schedules reset if needed. */
@@ -4762,7 +4762,7 @@ static int __init do_floppy_init(void)
 	for (drive =3D 0; drive < N_DRIVE; drive++) {
 		if (!disks[drive][0])
 			break;
-		del_timer_sync(&motor_off_timer[drive]);
+		timer_delete_sync(&motor_off_timer[drive]);
 		put_disk(disks[drive][0]);
 		blk_mq_free_tag_set(&tag_sets[drive]);
 	}
@@ -4983,7 +4983,7 @@ static void __exit floppy_module_exit(void)
 	destroy_workqueue(floppy_wq);
=20
 	for (drive =3D 0; drive < N_DRIVE; drive++) {
-		del_timer_sync(&motor_off_timer[drive]);
+		timer_delete_sync(&motor_off_timer[drive]);
=20
 		if (floppy_available(drive)) {
 			for (i =3D 0; i < ARRAY_SIZE(floppy_type); i++) {
diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
index 2b33fb5b949b..b5727dea15bd 100644
--- a/drivers/block/sunvdc.c
+++ b/drivers/block/sunvdc.c
@@ -1070,7 +1070,7 @@ static void vdc_port_remove(struct vio_dev *vdev)
=20
 		flush_work(&port->ldc_reset_work);
 		cancel_delayed_work_sync(&port->ldc_reset_timer_work);
-		del_timer_sync(&port->vio.timer);
+		timer_delete_sync(&port->vio.timer);
=20
 		del_gendisk(port->disk);
 		put_disk(port->disk);
diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
index 3aedcb5add61..ee6cade70222 100644
--- a/drivers/block/swim3.c
+++ b/drivers/block/swim3.c
@@ -362,7 +362,7 @@ static void set_timeout(struct floppy_state *fs, int ntic=
ks,
 			void (*proc)(struct timer_list *t))
 {
 	if (fs->timeout_pending)
-		del_timer(&fs->timeout);
+		timer_delete(&fs->timeout);
 	fs->timeout.expires =3D jiffies + nticks;
 	fs->timeout.function =3D proc;
 	add_timer(&fs->timeout);
@@ -677,7 +677,7 @@ static irqreturn_t swim3_interrupt(int irq, void *dev_id)
 			out_8(&sw->control_bic, DO_ACTION | WRITE_SECTORS);
 			out_8(&sw->select, RELAX);
 			out_8(&sw->intr_enable, 0);
-			del_timer(&fs->timeout);
+			timer_delete(&fs->timeout);
 			fs->timeout_pending =3D 0;
 			if (sw->ctrack =3D=3D 0xff) {
 				swim3_err("%s", "Seen sector but cyl=3Dff?\n");
@@ -706,7 +706,7 @@ static irqreturn_t swim3_interrupt(int irq, void *dev_id)
 			out_8(&sw->control_bic, DO_SEEK);
 			out_8(&sw->select, RELAX);
 			out_8(&sw->intr_enable, 0);
-			del_timer(&fs->timeout);
+			timer_delete(&fs->timeout);
 			fs->timeout_pending =3D 0;
 			if (fs->state =3D=3D seeking)
 				++fs->retries;
@@ -716,7 +716,7 @@ static irqreturn_t swim3_interrupt(int irq, void *dev_id)
 		break;
 	case settling:
 		out_8(&sw->intr_enable, 0);
-		del_timer(&fs->timeout);
+		timer_delete(&fs->timeout);
 		fs->timeout_pending =3D 0;
 		act(fs);
 		break;
@@ -726,7 +726,7 @@ static irqreturn_t swim3_interrupt(int irq, void *dev_id)
 		out_8(&sw->intr_enable, 0);
 		out_8(&sw->control_bic, WRITE_SECTORS | DO_ACTION);
 		out_8(&sw->select, RELAX);
-		del_timer(&fs->timeout);
+		timer_delete(&fs->timeout);
 		fs->timeout_pending =3D 0;
 		dr =3D fs->dma;
 		cp =3D fs->dma_cmd;
diff --git a/drivers/bluetooth/bluecard_cs.c b/drivers/bluetooth/bluecard_cs.c
index 36eabf61717f..1c7f89e134b3 100644
--- a/drivers/bluetooth/bluecard_cs.c
+++ b/drivers/bluetooth/bluecard_cs.c
@@ -638,7 +638,7 @@ static int bluecard_hci_close(struct hci_dev *hdev)
 	bluecard_hci_flush(hdev);
=20
 	/* Stop LED timer */
-	del_timer_sync(&(info->timer));
+	timer_delete_sync(&(info->timer));
=20
 	/* Disable power LED */
 	outb(0x00, iobase + 0x30);
@@ -885,7 +885,7 @@ static void bluecard_release(struct pcmcia_device *link)
=20
 	bluecard_close(info);
=20
-	del_timer_sync(&(info->timer));
+	timer_delete_sync(&(info->timer));
=20
 	pcmcia_disable_device(link);
 }
diff --git a/drivers/bluetooth/hci_bcsp.c b/drivers/bluetooth/hci_bcsp.c
index 76878119d910..610d0e3c36d4 100644
--- a/drivers/bluetooth/hci_bcsp.c
+++ b/drivers/bluetooth/hci_bcsp.c
@@ -382,7 +382,7 @@ static void bcsp_pkt_cull(struct bcsp_struct *bcsp)
 	}
=20
 	if (skb_queue_empty(&bcsp->unack))
-		del_timer(&bcsp->tbcsp);
+		timer_delete(&bcsp->tbcsp);
=20
 	spin_unlock_irqrestore(&bcsp->unack.lock, flags);
=20
diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index c0436881a533..edafa228bf83 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -197,7 +197,7 @@ static void h5_peer_reset(struct hci_uart *hu)
=20
 	h5->state =3D H5_UNINITIALIZED;
=20
-	del_timer(&h5->timer);
+	timer_delete(&h5->timer);
=20
 	skb_queue_purge(&h5->rel);
 	skb_queue_purge(&h5->unrel);
@@ -254,7 +254,7 @@ static int h5_close(struct hci_uart *hu)
 {
 	struct h5 *h5 =3D hu->priv;
=20
-	del_timer_sync(&h5->timer);
+	timer_delete_sync(&h5->timer);
=20
 	skb_queue_purge(&h5->unack);
 	skb_queue_purge(&h5->rel);
@@ -318,7 +318,7 @@ static void h5_pkt_cull(struct h5 *h5)
 	}
=20
 	if (skb_queue_empty(&h5->unack))
-		del_timer(&h5->timer);
+		timer_delete(&h5->timer);
=20
 unlock:
 	spin_unlock_irqrestore(&h5->unack.lock, flags);
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index f2558506a02c..e00590ba24fd 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -867,7 +867,7 @@ static void device_woke_up(struct hci_uart *hu)
 			skb_queue_tail(&qca->txq, skb);
=20
 		/* Switch timers and change state to HCI_IBS_TX_AWAKE */
-		del_timer(&qca->wake_retrans_timer);
+		timer_delete(&qca->wake_retrans_timer);
 		idle_delay =3D msecs_to_jiffies(qca->tx_idle_delay);
 		mod_timer(&qca->tx_idle_timer, jiffies + idle_delay);
 		qca->tx_ibs_state =3D HCI_IBS_TX_AWAKE;
@@ -2239,8 +2239,8 @@ static int qca_power_off(struct hci_dev *hdev)
 	hu->hdev->hw_error =3D NULL;
 	hu->hdev->reset =3D NULL;
=20
-	del_timer_sync(&qca->wake_retrans_timer);
-	del_timer_sync(&qca->tx_idle_timer);
+	timer_delete_sync(&qca->wake_retrans_timer);
+	timer_delete_sync(&qca->tx_idle_timer);
=20
 	/* Stop sending shutdown command if soc crashes. */
 	if (soc_type !=3D QCA_ROME
@@ -2629,10 +2629,10 @@ static int __maybe_unused qca_suspend(struct device *=
dev)
=20
 	switch (qca->tx_ibs_state) {
 	case HCI_IBS_TX_WAKING:
-		del_timer(&qca->wake_retrans_timer);
+		timer_delete(&qca->wake_retrans_timer);
 		fallthrough;
 	case HCI_IBS_TX_AWAKE:
-		del_timer(&qca->tx_idle_timer);
+		timer_delete(&qca->tx_idle_timer);
=20
 		serdev_device_write_flush(hu->serdev);
 		cmd =3D HCI_IBS_SLEEP_IND;
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_ge=
neric.c
index 474f1359c997..03aa88795209 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1096,7 +1096,7 @@ static void mhi_pci_recovery_work(struct work_struct *w=
ork)
=20
 	dev_warn(&pdev->dev, "device recovery started\n");
=20
-	del_timer(&mhi_pdev->health_check_timer);
+	timer_delete(&mhi_pdev->health_check_timer);
 	pm_runtime_forbid(&pdev->dev);
=20
 	/* Clean up MHI state */
@@ -1293,7 +1293,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev =3D pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl =3D &mhi_pdev->mhi_cntrl;
=20
-	del_timer_sync(&mhi_pdev->health_check_timer);
+	timer_delete_sync(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
=20
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
@@ -1321,7 +1321,7 @@ static void mhi_pci_reset_prepare(struct pci_dev *pdev)
=20
 	dev_info(&pdev->dev, "reset\n");
=20
-	del_timer(&mhi_pdev->health_check_timer);
+	timer_delete(&mhi_pdev->health_check_timer);
=20
 	/* Clean up MHI state */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
@@ -1431,7 +1431,7 @@ static int  __maybe_unused mhi_pci_runtime_suspend(stru=
ct device *dev)
 	if (test_and_set_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
 		return 0;
=20
-	del_timer(&mhi_pdev->health_check_timer);
+	timer_delete(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
=20
 	if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
diff --git a/drivers/char/dtlk.c b/drivers/char/dtlk.c
index 27f5f9d19531..16618079298a 100644
--- a/drivers/char/dtlk.c
+++ b/drivers/char/dtlk.c
@@ -243,11 +243,11 @@ static __poll_t dtlk_poll(struct file *file, poll_table=
 * wait)
 	poll_wait(file, &dtlk_process_list, wait);
=20
 	if (dtlk_has_indexing && dtlk_readable()) {
-	        del_timer(&dtlk_timer);
+	        timer_delete(&dtlk_timer);
 		mask =3D EPOLLIN | EPOLLRDNORM;
 	}
 	if (dtlk_writeable()) {
-	        del_timer(&dtlk_timer);
+	        timer_delete(&dtlk_timer);
 		mask |=3D EPOLLOUT | EPOLLWRNORM;
 	}
 	/* there are no exception conditions */
@@ -322,7 +322,7 @@ static int dtlk_release(struct inode *inode, struct file =
*file)
 	}
 	TRACE_RET;
 =09
-	del_timer_sync(&dtlk_timer);
+	timer_delete_sync(&dtlk_timer);
=20
 	return 0;
 }
diff --git a/drivers/char/hangcheck-timer.c b/drivers/char/hangcheck-timer.c
index 4181bcc1c796..497fc167cb8c 100644
--- a/drivers/char/hangcheck-timer.c
+++ b/drivers/char/hangcheck-timer.c
@@ -167,7 +167,7 @@ static int __init hangcheck_init(void)
=20
 static void __exit hangcheck_exit(void)
 {
-	del_timer_sync(&hangcheck_ticktock);
+	timer_delete_sync(&hangcheck_ticktock);
         printk("Hangcheck: Stopped hangcheck timer.\n");
 }
=20
diff --git a/drivers/char/hw_random/xgene-rng.c b/drivers/char/hw_random/xgen=
e-rng.c
index 39acaa503fec..a1a751074f7e 100644
--- a/drivers/char/hw_random/xgene-rng.c
+++ b/drivers/char/hw_random/xgene-rng.c
@@ -93,7 +93,7 @@ static void xgene_rng_expired_timer(struct timer_list *t)
 	/* Clear failure counter as timer expired */
 	disable_irq(ctx->irq);
 	ctx->failure_cnt =3D 0;
-	del_timer(&ctx->failure_timer);
+	timer_delete(&ctx->failure_timer);
 	enable_irq(ctx->irq);
 }
=20
diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index 009e32033b17..77146b5c762b 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -465,7 +465,7 @@ static void bt_bmc_remove(struct platform_device *pdev)
=20
 	misc_deregister(&bt_bmc->miscdev);
 	if (bt_bmc->irq < 0)
-		del_timer_sync(&bt_bmc->poll_timer);
+		timer_delete_sync(&bt_bmc->poll_timer);
 }
=20
 static const struct of_device_id bt_bmc_match[] =3D {
diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msg=
handler.c
index 1e5313748f8b..3ba9d7e9a6c7 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -5538,7 +5538,7 @@ static void __exit cleanup_ipmi(void)
 		 * here.
 		 */
 		atomic_set(&stop_operation, 1);
-		del_timer_sync(&ipmi_timer);
+		timer_delete_sync(&ipmi_timer);
=20
 		initialized =3D false;
=20
diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_int=
f.c
index eea23a3b966e..12b0b77eb1cc 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -859,7 +859,7 @@ static enum si_sm_result smi_event_handler(struct smi_inf=
o *smi_info,
=20
 	if (si_sm_result =3D=3D SI_SM_IDLE && smi_info->timer_running) {
 		/* Ok it if fails, the timer will just go off. */
-		if (del_timer(&smi_info->si_timer))
+		if (timer_delete(&smi_info->si_timer))
 			smi_info->timer_running =3D false;
 	}
=20
@@ -1839,7 +1839,7 @@ static inline void stop_timer_and_thread(struct smi_inf=
o *smi_info)
 	}
=20
 	smi_info->timer_can_start =3D false;
-	del_timer_sync(&smi_info->si_timer);
+	timer_delete_sync(&smi_info->si_timer);
 }
=20
 static struct smi_info *find_dup_si(struct smi_info *info)
diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
index 506d9988721e..0b45b07dec22 100644
--- a/drivers/char/ipmi/ipmi_ssif.c
+++ b/drivers/char/ipmi/ipmi_ssif.c
@@ -599,7 +599,7 @@ static void ssif_alert(struct i2c_client *client, enum i2=
c_alert_protocol type,
 	flags =3D ipmi_ssif_lock_cond(ssif_info, &oflags);
 	if (ssif_info->waiting_alert) {
 		ssif_info->waiting_alert =3D false;
-		del_timer(&ssif_info->retry_timer);
+		timer_delete(&ssif_info->retry_timer);
 		do_get =3D true;
 	} else if (ssif_info->curr_msg) {
 		ssif_info->got_alert =3D true;
@@ -1268,8 +1268,8 @@ static void shutdown_ssif(void *send_info)
 		schedule_timeout(1);
=20
 	ssif_info->stopping =3D true;
-	del_timer_sync(&ssif_info->watch_timer);
-	del_timer_sync(&ssif_info->retry_timer);
+	timer_delete_sync(&ssif_info->watch_timer);
+	timer_delete_sync(&ssif_info->retry_timer);
 	if (ssif_info->thread) {
 		complete(&ssif_info->wake_thread);
 		kthread_stop(ssif_info->thread);
diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_a=
speed.c
index c03bc1ec593a..a13a3470c17a 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -428,7 +428,7 @@ static void aspeed_kcs_irq_mask_update(struct kcs_bmc_dev=
ice *kcs_bmc, u8 mask,
 			if (rc =3D=3D -ETIMEDOUT)
 				mod_timer(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
 		} else {
-			del_timer(&priv->obe.timer);
+			timer_delete(&priv->obe.timer);
 		}
 	}
=20
@@ -655,7 +655,7 @@ static void aspeed_kcs_remove(struct platform_device *pde=
v)
 	spin_lock_irq(&priv->obe.lock);
 	priv->obe.remove =3D true;
 	spin_unlock_irq(&priv->obe.lock);
-	del_timer_sync(&priv->obe.timer);
+	timer_delete_sync(&priv->obe.timer);
 }
=20
 static const struct of_device_id ast_kcs_bmc_match[] =3D {
diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
index 310f17dd9511..e4bd74585d4d 100644
--- a/drivers/char/ipmi/ssif_bmc.c
+++ b/drivers/char/ipmi/ssif_bmc.c
@@ -209,7 +209,7 @@ static ssize_t ssif_bmc_write(struct file *file, const ch=
ar __user *buf, size_t
 	if (ret)
 		goto exit;
=20
-	del_timer(&ssif_bmc->response_timer);
+	timer_delete(&ssif_bmc->response_timer);
 	ssif_bmc->response_timer_inited =3D false;
=20
 	memcpy(&ssif_bmc->response, &msg, count);
diff --git a/drivers/char/random.c b/drivers/char/random.c
index 92cbd24a36d8..38f2fab29c56 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1352,7 +1352,7 @@ static void __cold try_to_generate_entropy(void)
 	}
 	mix_pool_bytes(&stack->entropy, sizeof(stack->entropy));
=20
-	del_timer_sync(&stack->timer);
+	timer_delete_sync(&stack->timer);
 	destroy_timer_on_stack(&stack->timer);
 }
=20
diff --git a/drivers/char/tlclk.c b/drivers/char/tlclk.c
index 6c1d94eda5a2..b381ea7e85d2 100644
--- a/drivers/char/tlclk.c
+++ b/drivers/char/tlclk.c
@@ -838,7 +838,7 @@ static void __exit tlclk_cleanup(void)
 	unregister_chrdev(tlclk_major, "telco_clock");
=20
 	release_region(TLCLK_BASE, 8);
-	del_timer_sync(&switchover_timer);
+	timer_delete_sync(&switchover_timer);
 	kfree(alarm_events);
=20
 }
@@ -856,7 +856,7 @@ static void switchover_timeout(struct timer_list *unused)
 	}
=20
 	/* Alarm processing is done, wake up read task */
-	del_timer(&switchover_timer);
+	timer_delete(&switchover_timer);
 	got_event =3D 1;
 	wake_up(&wq);
 }
diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-dev-com=
mon.c
index 48ff87444f85..11deaf538e87 100644
--- a/drivers/char/tpm/tpm-dev-common.c
+++ b/drivers/char/tpm/tpm-dev-common.c
@@ -160,7 +160,7 @@ ssize_t tpm_common_read(struct file *file, char __user *b=
uf,
 out:
 	if (!priv->response_length) {
 		*off =3D 0;
-		del_timer_sync(&priv->user_read_timer);
+		timer_delete_sync(&priv->user_read_timer);
 		flush_work(&priv->timeout_work);
 	}
 	mutex_unlock(&priv->buffer_mutex);
@@ -267,7 +267,7 @@ __poll_t tpm_common_poll(struct file *file, poll_table *w=
ait)
 void tpm_common_release(struct file *file, struct file_priv *priv)
 {
 	flush_work(&priv->async_work);
-	del_timer_sync(&priv->user_read_timer);
+	timer_delete_sync(&priv->user_read_timer);
 	flush_work(&priv->timeout_work);
 	file->private_data =3D NULL;
 	priv->response_length =3D 0;
diff --git a/drivers/comedi/drivers/comedi_test.c b/drivers/comedi/drivers/co=
medi_test.c
index 05ae9122823f..da17d891f0e5 100644
--- a/drivers/comedi/drivers/comedi_test.c
+++ b/drivers/comedi/drivers/comedi_test.c
@@ -418,9 +418,9 @@ static int waveform_ai_cancel(struct comedi_device *dev,
 	spin_unlock_bh(&dev->spinlock);
 	if (in_softirq()) {
 		/* Assume we were called from the timer routine itself. */
-		del_timer(&devpriv->ai_timer);
+		timer_delete(&devpriv->ai_timer);
 	} else {
-		del_timer_sync(&devpriv->ai_timer);
+		timer_delete_sync(&devpriv->ai_timer);
 	}
 	return 0;
 }
@@ -628,9 +628,9 @@ static int waveform_ao_cancel(struct comedi_device *dev,
 	spin_unlock_bh(&dev->spinlock);
 	if (in_softirq()) {
 		/* Assume we were called from the timer routine itself. */
-		del_timer(&devpriv->ao_timer);
+		timer_delete(&devpriv->ao_timer);
 	} else {
-		del_timer_sync(&devpriv->ao_timer);
+		timer_delete_sync(&devpriv->ao_timer);
 	}
 	return 0;
 }
@@ -791,8 +791,8 @@ static void waveform_detach(struct comedi_device *dev)
 	struct waveform_private *devpriv =3D dev->private;
=20
 	if (devpriv) {
-		del_timer_sync(&devpriv->ai_timer);
-		del_timer_sync(&devpriv->ao_timer);
+		timer_delete_sync(&devpriv->ai_timer);
+		timer_delete_sync(&devpriv->ao_timer);
 	}
 }
=20
diff --git a/drivers/comedi/drivers/das16.c b/drivers/comedi/drivers/das16.c
index 4ed56a02150e..f5ca6c0d4d0c 100644
--- a/drivers/comedi/drivers/das16.c
+++ b/drivers/comedi/drivers/das16.c
@@ -775,7 +775,7 @@ static int das16_cancel(struct comedi_device *dev, struct=
 comedi_subdevice *s)
 	/*  disable SW timer */
 	if (devpriv->timer_running) {
 		devpriv->timer_running =3D 0;
-		del_timer(&devpriv->timer);
+		timer_delete(&devpriv->timer);
 	}
=20
 	if (devpriv->can_burst)
@@ -940,7 +940,7 @@ static void das16_free_dma(struct comedi_device *dev)
 	struct das16_private_struct *devpriv =3D dev->private;
=20
 	if (devpriv) {
-		del_timer_sync(&devpriv->timer);
+		timer_delete_sync(&devpriv->timer);
 		comedi_isadma_free(devpriv->dma);
 	}
 }
diff --git a/drivers/comedi/drivers/jr3_pci.c b/drivers/comedi/drivers/jr3_pc=
i.c
index 951c23fa0369..cdc842b32bab 100644
--- a/drivers/comedi/drivers/jr3_pci.c
+++ b/drivers/comedi/drivers/jr3_pci.c
@@ -758,7 +758,7 @@ static void jr3_pci_detach(struct comedi_device *dev)
 	struct jr3_pci_dev_private *devpriv =3D dev->private;
=20
 	if (devpriv)
-		del_timer_sync(&devpriv->timer);
+		timer_delete_sync(&devpriv->timer);
=20
 	comedi_pci_detach(dev);
 }
diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpuf=
req.c
index 6094c530bf57..afe5abf89d33 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -802,7 +802,7 @@ static int powernv_cpufreq_target_index(struct cpufreq_po=
licy *policy,
 	if (gpstate_idx !=3D new_index)
 		queue_gpstate_timer(gpstates);
 	else
-		del_timer_sync(&gpstates->timer);
+		timer_delete_sync(&gpstates->timer);
=20
 gpstates_done:
 	freq_data.gpstate_id =3D idx_to_pstate(gpstate_idx);
@@ -880,7 +880,7 @@ static void powernv_cpufreq_cpu_exit(struct cpufreq_polic=
y *policy)
 	freq_data.gpstate_id =3D idx_to_pstate(powernv_pstate_info.min);
 	smp_call_function_single(policy->cpu, set_pstate, &freq_data, 1);
 	if (gpstates)
-		del_timer_sync(&gpstates->timer);
+		timer_delete_sync(&gpstates->timer);
=20
 	kfree(policy->driver_data);
 }
diff --git a/drivers/crypto/axis/artpec6_crypto.c b/drivers/crypto/axis/artpe=
c6_crypto.c
index 500b08e42282..f8d50bd227a6 100644
--- a/drivers/crypto/axis/artpec6_crypto.c
+++ b/drivers/crypto/axis/artpec6_crypto.c
@@ -2067,7 +2067,7 @@ static void artpec6_crypto_process_queue(struct artpec6=
_crypto *ac,
 	if (ac->pending_count)
 		mod_timer(&ac->timer, jiffies + msecs_to_jiffies(100));
 	else
-		del_timer(&ac->timer);
+		timer_delete(&ac->timer);
 }
=20
 static void artpec6_crypto_timeout(struct timer_list *t)
@@ -2963,7 +2963,7 @@ static void artpec6_crypto_remove(struct platform_devic=
e *pdev)
 	tasklet_disable(&ac->task);
 	devm_free_irq(&pdev->dev, irq, ac);
 	tasklet_kill(&ac->task);
-	del_timer_sync(&ac->timer);
+	timer_delete_sync(&ac->timer);
=20
 	artpec6_crypto_disable_hw(ac);
=20
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index cf2ce3744ce6..9f80a45498f0 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -412,7 +412,7 @@ static int test_wait_timeout(void *arg)
=20
 	err =3D 0;
 err_free:
-	del_timer_sync(&wt.timer);
+	timer_delete_sync(&wt.timer);
 	destroy_timer_on_stack(&wt.timer);
 	dma_fence_signal(wt.f);
 	dma_fence_put(wt.f);
diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index de8d7070904e..b96cc0a83872 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -324,7 +324,7 @@ static void imxdma_disable_hw(struct imxdma_channel *imxd=
mac)
 	dev_dbg(imxdma->dev, "%s channel %d\n", __func__, channel);
=20
 	if (imxdma_hw_chain(imxdmac))
-		del_timer(&imxdmac->watchdog);
+		timer_delete(&imxdmac->watchdog);
=20
 	local_irq_save(flags);
 	imx_dmav1_writel(imxdma, imx_dmav1_readl(imxdma, DMA_DIMR) |
@@ -454,7 +454,7 @@ static void dma_irq_handle_channel(struct imxdma_channel =
*imxdmac)
 		}
=20
 		if (imxdma_hw_chain(imxdmac)) {
-			del_timer(&imxdmac->watchdog);
+			timer_delete(&imxdmac->watchdog);
 			return;
 		}
 	}
diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
index 79d8957f9e60..06a813cc7641 100644
--- a/drivers/dma/ioat/dma.c
+++ b/drivers/dma/ioat/dma.c
@@ -159,7 +159,7 @@ void ioat_stop(struct ioatdma_chan *ioat_chan)
 	}
=20
 	/* flush inflight timers */
-	del_timer_sync(&ioat_chan->timer);
+	timer_delete_sync(&ioat_chan->timer);
=20
 	/* flush inflight tasklet runs */
 	tasklet_kill(&ioat_chan->cleanup_task);
diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
index cc9ddd6c325b..02f68b328511 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -1224,12 +1224,12 @@ static void ioat_shutdown(struct pci_dev *pdev)
 		set_bit(IOAT_CHAN_DOWN, &ioat_chan->state);
 		spin_unlock_bh(&ioat_chan->prep_lock);
 		/*
-		 * Synchronization rule for del_timer_sync():
+		 * Synchronization rule for timer_delete_sync():
 		 *  - The caller must not hold locks which would prevent
 		 *    completion of the timer's handler.
 		 * So prep_lock cannot be held before calling it.
 		 */
-		del_timer_sync(&ioat_chan->timer);
+		timer_delete_sync(&ioat_chan->timer);
=20
 		/* this should quiesce then reset */
 		ioat_reset_hw(ioat_chan);
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-tran=
saction.c
index e141d24a7644..b0f9ef6ac6df 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -39,7 +39,7 @@
 static int try_cancel_split_timeout(struct fw_transaction *t)
 {
 	if (t->is_split_transaction)
-		return del_timer(&t->split_timeout_timer);
+		return timer_delete(&t->split_timeout_timer);
 	else
 		return 1;
 }
diff --git a/drivers/firmware/psci/psci_checker.c b/drivers/firmware/psci/psc=
i_checker.c
index 116eb465cdb4..b662b7e28b80 100644
--- a/drivers/firmware/psci/psci_checker.c
+++ b/drivers/firmware/psci/psci_checker.c
@@ -342,7 +342,7 @@ static int suspend_test_thread(void *arg)
 	 * Disable the timer to make sure that the timer will not trigger
 	 * later.
 	 */
-	del_timer(&wakeup_timer);
+	timer_delete(&wakeup_timer);
 	destroy_timer_on_stack(&wakeup_timer);
=20
 	if (atomic_dec_return_relaxed(&nb_active_threads) =3D=3D 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_fence.c
index 2f24a6aa13bf..5f5c00ace96b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -280,7 +280,7 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
=20
 	} while (atomic_cmpxchg(&drv->last_seq, last_seq, seq) !=3D last_seq);
=20
-	if (del_timer(&ring->fence_drv.fallback_timer) &&
+	if (timer_delete(&ring->fence_drv.fallback_timer) &&
 	    seq !=3D ring->fence_drv.sync_seq)
 		amdgpu_fence_schedule_fallback(ring);
=20
@@ -618,7 +618,7 @@ void amdgpu_fence_driver_hw_fini(struct amdgpu_device *ad=
ev)
 			amdgpu_irq_put(adev, ring->fence_drv.irq_src,
 				       ring->fence_drv.irq_type);
=20
-		del_timer_sync(&ring->fence_drv.fallback_timer);
+		timer_delete_sync(&ring->fence_drv.fallback_timer);
 	}
 }
=20
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/am=
dgpu/amdgpu_mes.c
index 85f774063f9b..fb212f0a1136 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1239,7 +1239,7 @@ void amdgpu_mes_remove_ring(struct amdgpu_device *adev,
 		return;
=20
 	amdgpu_mes_remove_hw_queue(adev, ring->hw_queue_id);
-	del_timer_sync(&ring->fence_drv.fallback_timer);
+	timer_delete_sync(&ring->fence_drv.fallback_timer);
 	amdgpu_ring_fini(ring);
 	kfree(ring);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_ring_mux.c
index 1c66da1c3fb4..03ed14663107 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
@@ -124,7 +124,7 @@ static void amdgpu_mux_resubmit_chunks(struct amdgpu_ring=
_mux *mux)
 		}
 	}
=20
-	del_timer(&mux->resubmit_timer);
+	timer_delete(&mux->resubmit_timer);
 	mux->s_resubmit =3D false;
 }
=20
diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/td=
a998x_drv.c
index ebc758c72891..20658258fb51 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -1763,7 +1763,7 @@ static void tda998x_destroy(struct device *dev)
 	if (priv->hdmi->irq)
 		free_irq(priv->hdmi->irq, priv);
=20
-	del_timer_sync(&priv->edid_delay_timer);
+	timer_delete_sync(&priv->edid_delay_timer);
 	cancel_work_sync(&priv->detect_work);
=20
 	i2c_unregister_device(priv->cec);
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 94e45ed6869d..78958ddf8485 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -508,7 +508,7 @@ static void drm_vblank_init_release(struct drm_device *de=
v, void *ptr)
 		    drm_core_check_feature(dev, DRIVER_MODESET));
=20
 	drm_vblank_destroy_worker(vblank);
-	del_timer_sync(&vblank->disable_timer);
+	timer_delete_sync(&vblank->disable_timer);
 }
=20
 /**
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exyno=
s/exynos_drm_vidi.c
index fd388b1dbe68..08cf79a62025 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -427,7 +427,7 @@ static void vidi_unbind(struct device *dev, struct device=
 *master, void *data)
 {
 	struct vidi_context *ctx =3D dev_get_drvdata(dev);
=20
-	del_timer_sync(&ctx->timer);
+	timer_delete_sync(&ctx->timer);
 }
=20
 static const struct component_ops vidi_component_ops =3D {
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index e163649816d5..77cfcf37ddd2 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -254,7 +254,7 @@ static int gud_usb_bulk(struct gud_device *gdrm, size_t l=
en)
=20
 	usb_sg_wait(&ctx.sgr);
=20
-	if (!del_timer_sync(&ctx.timer))
+	if (!timer_delete_sync(&ctx.timer))
 		ret =3D -ETIMEDOUT;
 	else if (ctx.sgr.status < 0)
 		ret =3D ctx.sgr.status;
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/g=
pu/drm/i915/gt/intel_execlists_submission.c
index 4a80ffa1b962..03baa7fa0a27 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2502,7 +2502,7 @@ static void execlists_irq_handler(struct intel_engine_c=
s *engine, u16 iir)
 			   ENGINE_READ_FW(engine, RING_EXECLIST_STATUS_HI));
 		ENGINE_TRACE(engine, "semaphore yield: %08x\n",
 			     engine->execlists.yield);
-		if (del_timer(&engine->execlists.timer))
+		if (timer_delete(&engine->execlists.timer))
 			tasklet =3D true;
 	}
=20
@@ -3370,8 +3370,8 @@ static void execlists_set_default_submission(struct int=
el_engine_cs *engine)
 static void execlists_shutdown(struct intel_engine_cs *engine)
 {
 	/* Synchronise with residual timers and any softirq they raise */
-	del_timer_sync(&engine->execlists.timer);
-	del_timer_sync(&engine->execlists.preempt);
+	timer_delete_sync(&engine->execlists.timer);
+	timer_delete_sync(&engine->execlists.preempt);
 	tasklet_kill(&engine->sched_engine->tasklet);
 }
=20
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/in=
tel_rps.c
index 2cfaedb04876..64e9317f58fb 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -161,7 +161,7 @@ static void rps_start_timer(struct intel_rps *rps)
=20
 static void rps_stop_timer(struct intel_rps *rps)
 {
-	del_timer_sync(&rps->timer);
+	timer_delete_sync(&rps->timer);
 	rps->pm_timestamp =3D ktime_sub(ktime_get(), rps->pm_timestamp);
 	cancel_work_sync(&rps->work);
 }
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/=
mock_engine.c
index c0637bf799a3..64315b714743 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -297,7 +297,7 @@ static void mock_reset_cancel(struct intel_engine_cs *eng=
ine)
 	struct i915_request *rq;
 	unsigned long flags;
=20
-	del_timer_sync(&mock->hw_delay);
+	timer_delete_sync(&mock->hw_delay);
=20
 	spin_lock_irqsave(&engine->sched_engine->lock, flags);
=20
@@ -432,7 +432,7 @@ void mock_engine_flush(struct intel_engine_cs *engine)
 		container_of(engine, typeof(*mock), base);
 	struct i915_request *request, *rn;
=20
-	del_timer_sync(&mock->hw_delay);
+	timer_delete_sync(&mock->hw_delay);
=20
 	spin_lock_irq(&mock->hw_lock);
 	list_for_each_entry_safe(request, rn, &mock->hw_queue, mock.link)
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i=
915/gt/selftest_execlists.c
index d7717de17ecc..0454eb1814bb 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -1198,7 +1198,7 @@ static int live_timeslice_rewind(void *arg)
 		ENGINE_TRACE(engine, "forcing tasklet for rewind\n");
 		while (i915_request_is_active(rq[A2])) { /* semaphore yield! */
 			/* Wait for the timeslice to kick in */
-			del_timer(&engine->execlists.timer);
+			timer_delete(&engine->execlists.timer);
 			tasklet_hi_schedule(&engine->sched_engine->tasklet);
 			intel_engine_flush_submission(engine);
 		}
@@ -2357,7 +2357,7 @@ static int __cancel_fail(struct live_preempt_cancel *ar=
g)
 	/* force preempt reset [failure] */
 	while (!engine->execlists.pending[0])
 		intel_engine_flush_submission(engine);
-	del_timer_sync(&engine->execlists.preempt);
+	timer_delete_sync(&engine->execlists.preempt);
 	intel_engine_flush_submission(engine);
=20
 	cancel_reset_timeout(engine);
diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i91=
5/gt/selftest_migrate.c
index 1bf7b88d9a9d..401bee030dbc 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -660,7 +660,7 @@ static int live_emit_pte_full_ring(void *arg)
=20
 out_rq:
 	i915_request_add(rq); /* GEM_BUG_ON(rq->reserved_space > ring->space)? */
-	del_timer_sync(&st.timer);
+	timer_delete_sync(&st.timer);
 	destroy_timer_on_stack(&st.timer);
 out_unpin:
 	intel_context_unpin(ce);
diff --git a/drivers/gpu/drm/i915/i915_utils.c b/drivers/gpu/drm/i915/i915_ut=
ils.c
index 2576f8f6c0f6..b60c28fbd207 100644
--- a/drivers/gpu/drm/i915/i915_utils.c
+++ b/drivers/gpu/drm/i915/i915_utils.c
@@ -52,7 +52,7 @@ void cancel_timer(struct timer_list *t)
 	if (!timer_active(t))
 		return;
=20
-	del_timer(t);
+	timer_delete(t);
 	WRITE_ONCE(t->expires, 0);
 }
=20
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/inte=
l_wakeref.c
index 87f246047312..07e81be4d392 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -163,7 +163,7 @@ void intel_wakeref_auto(struct intel_wakeref_auto *wf, un=
signed long timeout)
 	unsigned long flags;
=20
 	if (!timeout) {
-		if (del_timer_sync(&wf->timer))
+		if (timer_delete_sync(&wf->timer))
 			wakeref_auto_timeout(&wf->timer);
 		return;
 	}
diff --git a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c b/drivers/gpu/drm/=
i915/selftests/lib_sw_fence.c
index bf2752cc1e0b..d5ecc68155da 100644
--- a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
+++ b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
@@ -74,7 +74,7 @@ void timed_fence_init(struct timed_fence *tf, unsigned long=
 expires)
=20
 void timed_fence_fini(struct timed_fence *tf)
 {
-	if (del_timer_sync(&tf->timer))
+	if (timer_delete_sync(&tf->timer))
 		i915_sw_fence_commit(&tf->fence);
=20
 	destroy_timer_on_stack(&tf->timer);
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk=
_dp.c
index ccdc57cef3ea..fed3307d3374 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2847,7 +2847,7 @@ static void mtk_dp_remove(struct platform_device *pdev)
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	if (mtk_dp->data->bridge_type !=3D DRM_MODE_CONNECTOR_eDP)
-		del_timer_sync(&mtk_dp->debounce_timer);
+		timer_delete_sync(&mtk_dp->debounce_timer);
 	platform_device_unregister(mtk_dp->phy_dev);
 	if (mtk_dp->audio_pdev)
 		platform_device_unregister(mtk_dp->audio_pdev);
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adre=
no/a5xx_gpu.c
index 71dca78cd7a5..650e5bac225f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1253,7 +1253,7 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
 		gpu_read(gpu, REG_A5XX_CP_IB2_BUFSZ));
=20
 	/* Turn off the hangcheck timer to keep it from bothering us */
-	del_timer(&gpu->hangcheck_timer);
+	timer_delete(&gpu->hangcheck_timer);
=20
 	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/=
adreno/a5xx_preempt.c
index 0469fea55010..36f72c43eae8 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -182,7 +182,7 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
 		return;
=20
 	/* Delete the preemption watchdog timer */
-	del_timer(&a5xx_gpu->preempt_timer);
+	timer_delete(&a5xx_gpu->preempt_timer);
=20
 	/*
 	 * The hardware should be setting CP_CONTEXT_SWITCH_CNTL to zero before
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adre=
no/a6xx_gmu.c
index 38c94915d4c9..c8711938a5f4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -28,7 +28,7 @@ static void a6xx_gmu_fault(struct a6xx_gmu *gmu)
 	gmu->hung =3D true;
=20
 	/* Turn off the hangcheck timer while we are resetting */
-	del_timer(&gpu->hangcheck_timer);
+	timer_delete(&gpu->hangcheck_timer);
=20
 	/* Queue the GPU handler because we need to treat this as a recovery */
 	kthread_queue_work(gpu->worker, &gpu->recover_work);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adre=
no/a6xx_gpu.c
index 1820c167fcee..06465bc2d0b4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1706,7 +1706,7 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 		gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE));
=20
 	/* Turn off the hangcheck timer to keep it from bothering us */
-	del_timer(&gpu->hangcheck_timer);
+	timer_delete(&gpu->hangcheck_timer);
=20
 	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
@@ -1726,7 +1726,7 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *=
gpu)
 	 */
 	if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
 		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
-		del_timer(&gpu->hangcheck_timer);
+		timer_delete(&gpu->hangcheck_timer);
=20
 		kthread_queue_work(gpu->worker, &gpu->recover_work);
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/=
adreno/a6xx_preempt.c
index 2fd4e39f618f..9b5e27d2373c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -146,7 +146,7 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 		return;
=20
 	/* Delete the preemption watchdog timer */
-	del_timer(&a6xx_gpu->preempt_timer);
+	timer_delete(&a6xx_gpu->preempt_timer);
=20
 	/*
 	 * The hardware should be setting the stop bit of CP_CONTEXT_SWITCH_CNTL
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/ad=
reno/adreno_gpu.c
index 7156cda07b03..26db1f4b5fb9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -292,7 +292,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned lo=
ng iova, int flags,
=20
 	if (do_devcoredump) {
 		/* Turn off the hangcheck timer to keep it from bothering us */
-		del_timer(&gpu->hangcheck_timer);
+		timer_delete(&gpu->hangcheck_timer);
=20
 		gpu->fault_info.ttbr0 =3D info->ttbr0;
 		gpu->fault_info.iova  =3D iova;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/ms=
m/disp/dpu1/dpu_encoder.c
index 284e69bb47c1..8610bbf2b87c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1410,7 +1410,7 @@ static void dpu_encoder_virt_atomic_disable(struct drm_=
encoder *drm_enc,
 	/* after phys waits for frame-done, should be no more frames pending */
 	if (atomic_xchg(&dpu_enc->frame_done_timeout_ms, 0)) {
 		DPU_ERROR("enc%d timeout pending\n", drm_enc->base.id);
-		del_timer_sync(&dpu_enc->frame_done_timer);
+		timer_delete_sync(&dpu_enc->frame_done_timer);
 	}
=20
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_STOP);
@@ -1582,7 +1582,7 @@ void dpu_encoder_frame_done_callback(
=20
 		if (!dpu_enc->frame_busy_mask[0]) {
 			atomic_set(&dpu_enc->frame_done_timeout_ms, 0);
-			del_timer(&dpu_enc->frame_done_timer);
+			timer_delete(&dpu_enc->frame_done_timer);
=20
 			dpu_encoder_resource_control(drm_enc,
 					DPU_ENC_RC_EVENT_FRAME_DONE);
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/=
dsi.c
index 59d20eb8a7e0..9b9cc593790c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -452,7 +452,7 @@ static irqreturn_t omap_dsi_irq_handler(int irq, void *ar=
g)
=20
 #ifdef DSI_CATCH_MISSING_TE
 	if (irqstatus & DSI_IRQ_TE_TRIGGER)
-		del_timer(&dsi->te_timer);
+		timer_delete(&dsi->te_timer);
 #endif
=20
 	/* make a copy and unlock, so that isrs can unregister
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index fb450b6a4d44..7125773889f1 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -1043,7 +1043,7 @@ static void vc4_bo_cache_destroy(struct drm_device *dev=
, void *unused)
 	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
 	int i;
=20
-	del_timer(&vc4->bo_cache.time_timer);
+	timer_delete(&vc4->bo_cache.time_timer);
 	cancel_work_sync(&vc4->bo_cache.time_work);
=20
 	vc4_bo_cache_purge(dev);
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fe=
nce.c
index e15754178395..37bb1fb58cf9 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -49,7 +49,7 @@ static void vgem_fence_release(struct dma_fence *base)
 {
 	struct vgem_fence *fence =3D container_of(base, typeof(*fence), base);
=20
-	del_timer_sync(&fence->timer);
+	timer_delete_sync(&fence->timer);
 	dma_fence_free(&fence->base);
 }
=20
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlis=
t.c
index 9fbed1a2fcc6..788f56b066b6 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -297,7 +297,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct x=
e_device *xe,
=20
 void xe_execlist_port_destroy(struct xe_execlist_port *port)
 {
-	del_timer(&port->irq_fail);
+	timer_delete(&port->irq_fail);
=20
 	/* Prevent an interrupt while we're destroying */
 	spin_lock_irq(&gt_to_xe(port->hwe->gt)->irq.lock);
diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 8459e9bc0749..f6beeebf974c 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -279,7 +279,7 @@ static void gb_operation_work(struct work_struct *work)
 	if (gb_operation_is_incoming(operation)) {
 		gb_operation_request_handle(operation);
 	} else {
-		ret =3D del_timer_sync(&operation->timer);
+		ret =3D timer_delete_sync(&operation->timer);
 		if (!ret) {
 			/* Cancel request message if scheduled by timeout. */
 			if (gb_operation_result(operation) =3D=3D -ETIMEDOUT)
diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index d900dd05c335..ed34f5cd5a91 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -950,7 +950,7 @@ static int apple_probe(struct hid_device *hdev,
 	return 0;
=20
 out_err:
-	del_timer_sync(&asc->battery_timer);
+	timer_delete_sync(&asc->battery_timer);
 	hid_hw_stop(hdev);
 	return ret;
 }
@@ -959,7 +959,7 @@ static void apple_remove(struct hid_device *hdev)
 {
 	struct apple_sc *asc =3D hid_get_drvdata(hdev);
=20
-	del_timer_sync(&asc->battery_timer);
+	timer_delete_sync(&asc->battery_timer);
=20
 	hid_hw_stop(hdev);
 }
diff --git a/drivers/hid/hid-appleir.c b/drivers/hid/hid-appleir.c
index c45e5aa569d2..bb7db9ae41c2 100644
--- a/drivers/hid/hid-appleir.c
+++ b/drivers/hid/hid-appleir.c
@@ -319,7 +319,7 @@ static void appleir_remove(struct hid_device *hid)
 {
 	struct appleir *appleir =3D hid_get_drvdata(hid);
 	hid_hw_stop(hid);
-	del_timer_sync(&appleir->key_up_timer);
+	timer_delete_sync(&appleir->key_up_timer);
 }
=20
 static const struct hid_device_id appleir_devices[] =3D {
diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index d4b95aa3eecb..029ccbaa1d12 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -448,7 +448,7 @@ static void appletb_kbd_remove(struct hid_device *hdev)
 	appletb_kbd_set_mode(kbd, APPLETB_KBD_MODE_OFF);
=20
 	input_unregister_handler(&kbd->inp_handler);
-	del_timer_sync(&kbd->inactivity_timer);
+	timer_delete_sync(&kbd->inactivity_timer);
=20
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index a76f17158539..adfa329e917b 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -915,7 +915,7 @@ static int magicmouse_probe(struct hid_device *hdev,
=20
 	return 0;
 err_stop_hw:
-	del_timer_sync(&msc->battery_timer);
+	timer_delete_sync(&msc->battery_timer);
 	hid_hw_stop(hdev);
 	return ret;
 }
@@ -926,7 +926,7 @@ static void magicmouse_remove(struct hid_device *hdev)
=20
 	if (msc) {
 		cancel_delayed_work_sync(&msc->work);
-		del_timer_sync(&msc->battery_timer);
+		timer_delete_sync(&msc->battery_timer);
 	}
=20
 	hid_hw_stop(hdev);
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e50887a6d22c..7ac8e16e6158 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1299,7 +1299,7 @@ static void mt_touch_report(struct hid_device *hid,
 			mod_timer(&td->release_timer,
 				  jiffies + msecs_to_jiffies(100));
 		else
-			del_timer(&td->release_timer);
+			timer_delete(&td->release_timer);
 	}
=20
 	clear_bit_unlock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags);
@@ -1881,7 +1881,7 @@ static void mt_remove(struct hid_device *hdev)
 {
 	struct mt_device *td =3D hid_get_drvdata(hdev);
=20
-	del_timer_sync(&td->release_timer);
+	timer_delete_sync(&td->release_timer);
=20
 	sysfs_remove_group(&hdev->dev.kobj, &mt_attribute_group);
 	hid_hw_stop(hdev);
diff --git a/drivers/hid/hid-nvidia-shield.c b/drivers/hid/hid-nvidia-shield.c
index ff9078ad1961..b0c40a245bf8 100644
--- a/drivers/hid/hid-nvidia-shield.c
+++ b/drivers/hid/hid-nvidia-shield.c
@@ -1102,7 +1102,7 @@ static void shield_remove(struct hid_device *hdev)
=20
 	hid_hw_close(hdev);
 	thunderstrike_destroy(ts);
-	del_timer_sync(&ts->psy_stats_timer);
+	timer_delete_sync(&ts->psy_stats_timer);
 	cancel_work_sync(&ts->hostcmd_req_work);
 	hid_hw_stop(hdev);
 }
diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
index 3d08c190a935..c6b922c2adba 100644
--- a/drivers/hid/hid-prodikeys.c
+++ b/drivers/hid/hid-prodikeys.c
@@ -254,7 +254,7 @@ static void stop_sustain_timers(struct pcmidi_snd *pm)
 	for (i =3D 0; i < PCMIDI_SUSTAINED_MAX; i++) {
 		pms =3D &pm->sustained_notes[i];
 		pms->in_use =3D 1;
-		del_timer_sync(&pms->timer);
+		timer_delete_sync(&pms->timer);
 	}
 }
=20
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 5258b45684e8..a2be652b7bbd 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -2164,7 +2164,7 @@ static void sony_remove(struct hid_device *hdev)
 	struct sony_sc *sc =3D hid_get_drvdata(hdev);
=20
 	if (sc->quirks & (GHL_GUITAR_PS3WIIU | GHL_GUITAR_PS4)) {
-		del_timer_sync(&sc->ghl_poke_timer);
+		timer_delete_sync(&sc->ghl_poke_timer);
 		usb_free_urb(sc->ghl_urb);
 	}
=20
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index d8008933c052..a367df6ea01f 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -474,7 +474,7 @@ static void uclogic_remove(struct hid_device *hdev)
 {
 	struct uclogic_drvdata *drvdata =3D hid_get_drvdata(hdev);
=20
-	del_timer_sync(&drvdata->inrange_timer);
+	timer_delete_sync(&drvdata->inrange_timer);
 	hid_hw_stop(hdev);
 	kfree(drvdata->desc_ptr);
 	uclogic_params_cleanup(&drvdata->params);
diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 26167cfb696f..8080083121d3 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -1171,7 +1171,7 @@ static void wiimote_init_hotplug(struct wiimote_data *w=
data)
 		wiimote_cmd_release(wdata);
=20
 		/* delete MP hotplug timer */
-		del_timer_sync(&wdata->timer);
+		timer_delete_sync(&wdata->timer);
 	} else {
 		/* reschedule MP hotplug timer */
 		if (!(flags & WIIPROTO_FLAG_BUILTIN_MP) &&
diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 44c2351b870f..7d9297fad90e 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1462,13 +1462,13 @@ static void usbhid_disconnect(struct usb_interface *i=
ntf)
=20
 static void hid_cancel_delayed_stuff(struct usbhid_device *usbhid)
 {
-	del_timer_sync(&usbhid->io_retry);
+	timer_delete_sync(&usbhid->io_retry);
 	cancel_work_sync(&usbhid->reset_work);
 }
=20
 static void hid_cease_io(struct usbhid_device *usbhid)
 {
-	del_timer_sync(&usbhid->io_retry);
+	timer_delete_sync(&usbhid->io_retry);
 	usb_kill_urb(usbhid->urbin);
 	usb_kill_urb(usbhid->urbctrl);
 	usb_kill_urb(usbhid->urbout);
diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 97393a3083ca..1556d4287fa5 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2896,7 +2896,7 @@ static void wacom_remove(struct hid_device *hdev)
 	cancel_work_sync(&wacom->battery_work);
 	cancel_work_sync(&wacom->remote_work);
 	cancel_work_sync(&wacom->mode_change_work);
-	del_timer_sync(&wacom->idleprox_timer);
+	timer_delete_sync(&wacom->idleprox_timer);
 	if (hdev->bus =3D=3D BUS_BLUETOOTH)
 		device_remove_file(&hdev->dev, &dev_attr_speed);
=20
diff --git a/drivers/hsi/clients/ssi_protocol.c b/drivers/hsi/clients/ssi_pro=
tocol.c
index 6105ea9a6c6a..cbc5e72857de 100644
--- a/drivers/hsi/clients/ssi_protocol.c
+++ b/drivers/hsi/clients/ssi_protocol.c
@@ -281,9 +281,9 @@ static void ssip_set_rxstate(struct ssi_protocol *ssi, un=
signed int state)
 	ssi->recv_state =3D state;
 	switch (state) {
 	case RECV_IDLE:
-		del_timer(&ssi->rx_wd);
+		timer_delete(&ssi->rx_wd);
 		if (ssi->send_state =3D=3D SEND_IDLE)
-			del_timer(&ssi->keep_alive);
+			timer_delete(&ssi->keep_alive);
 		break;
 	case RECV_READY:
 		/* CMT speech workaround */
@@ -306,9 +306,9 @@ static void ssip_set_txstate(struct ssi_protocol *ssi, un=
signed int state)
 	switch (state) {
 	case SEND_IDLE:
 	case SEND_READY:
-		del_timer(&ssi->tx_wd);
+		timer_delete(&ssi->tx_wd);
 		if (ssi->recv_state =3D=3D RECV_IDLE)
-			del_timer(&ssi->keep_alive);
+			timer_delete(&ssi->keep_alive);
 		break;
 	case WAIT4READY:
 	case SENDING:
@@ -398,9 +398,9 @@ static void ssip_reset(struct hsi_client *cl)
 	if (test_and_clear_bit(SSIP_WAKETEST_FLAG, &ssi->flags))
 		ssi_waketest(cl, 0); /* FIXME: To be removed */
 	spin_lock_bh(&ssi->lock);
-	del_timer(&ssi->rx_wd);
-	del_timer(&ssi->tx_wd);
-	del_timer(&ssi->keep_alive);
+	timer_delete(&ssi->rx_wd);
+	timer_delete(&ssi->tx_wd);
+	timer_delete(&ssi->keep_alive);
 	cancel_work_sync(&ssi->work);
 	ssi->main_state =3D 0;
 	ssi->send_state =3D 0;
@@ -648,7 +648,7 @@ static void ssip_rx_data_complete(struct hsi_msg *msg)
 		ssip_error(cl);
 		return;
 	}
-	del_timer(&ssi->rx_wd); /* FIXME: Revisit */
+	timer_delete(&ssi->rx_wd); /* FIXME: Revisit */
 	skb =3D msg->context;
 	ssip_pn_rx(skb);
 	hsi_free_msg(msg);
@@ -731,7 +731,7 @@ static void ssip_rx_waketest(struct hsi_client *cl, u32 c=
md)
=20
 	spin_lock_bh(&ssi->lock);
 	ssi->main_state =3D ACTIVE;
-	del_timer(&ssi->tx_wd); /* Stop boot handshake timer */
+	timer_delete(&ssi->tx_wd); /* Stop boot handshake timer */
 	spin_unlock_bh(&ssi->lock);
=20
 	dev_notice(&cl->device, "WAKELINES TEST %s\n",
diff --git a/drivers/hte/hte-tegra194-test.c b/drivers/hte/hte-tegra194-test.c
index f890b79723af..94e931f45305 100644
--- a/drivers/hte/hte-tegra194-test.c
+++ b/drivers/hte/hte-tegra194-test.c
@@ -221,7 +221,7 @@ static void tegra_hte_test_remove(struct platform_device =
*pdev)
 	free_irq(hte.gpio_in_irq, &hte);
 	gpiod_put(hte.gpio_in);
 	gpiod_put(hte.gpio_out);
-	del_timer_sync(&hte.timer);
+	timer_delete_sync(&hte.timer);
 }
=20
 static struct platform_driver tegra_hte_test_driver =3D {
diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 579d31bb9ac7..d506a5e7e033 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -483,7 +483,7 @@ static void pwm_fan_cleanup(void *__ctx)
 {
 	struct pwm_fan_ctx *ctx =3D __ctx;
=20
-	del_timer_sync(&ctx->rpm_timer);
+	timer_delete_sync(&ctx->rpm_timer);
 	/* Switch off everything */
 	ctx->enable_mode =3D pwm_disable_reg_disable;
 	pwm_fan_power_off(ctx, true);
diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-sc=
b.c
index 02f75cf310aa..5d8b82ae6fd6 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1122,7 +1122,7 @@ static int img_i2c_xfer(struct i2c_adapter *adap, struc=
t i2c_msg *msgs,
=20
 		time_left =3D wait_for_completion_timeout(&i2c->msg_complete,
 						      IMG_I2C_TIMEOUT);
-		del_timer_sync(&i2c->check_timer);
+		timer_delete_sync(&i2c->check_timer);
=20
 		if (time_left =3D=3D 0)
 			i2c->msg_status =3D -ETIMEDOUT;
diff --git a/drivers/iio/common/ssp_sensors/ssp_dev.c b/drivers/iio/common/ss=
p_sensors/ssp_dev.c
index 65f8a2b13cfd..22ea10eb48ae 100644
--- a/drivers/iio/common/ssp_sensors/ssp_dev.c
+++ b/drivers/iio/common/ssp_sensors/ssp_dev.c
@@ -190,7 +190,7 @@ static void ssp_enable_wdt_timer(struct ssp_data *data)
=20
 static void ssp_disable_wdt_timer(struct ssp_data *data)
 {
-	del_timer_sync(&data->wdt_timer);
+	timer_delete_sync(&data->wdt_timer);
 	cancel_work_sync(&data->work_wdt);
 }
=20
@@ -589,7 +589,7 @@ static void ssp_remove(struct spi_device *spi)
=20
 	free_irq(data->spi->irq, data);
=20
-	del_timer_sync(&data->wdt_timer);
+	timer_delete_sync(&data->wdt_timer);
 	cancel_work_sync(&data->work_wdt);
=20
 	mutex_destroy(&data->comm_lock);
diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/c=
m.c
index 8d753e6e0c71..e02721a9e288 100644
--- a/drivers/infiniband/hw/cxgb4/cm.c
+++ b/drivers/infiniband/hw/cxgb4/cm.c
@@ -191,7 +191,7 @@ static void start_ep_timer(struct c4iw_ep *ep)
 static int stop_ep_timer(struct c4iw_ep *ep)
 {
 	pr_debug("ep %p stopping\n", ep);
-	del_timer_sync(&ep->timer);
+	timer_delete_sync(&ep->timer);
 	if (!test_and_set_bit(TIMEOUT, &ep->com.flags)) {
 		c4iw_put_ep(&ep->com);
 		return 0;
diff --git a/drivers/infiniband/hw/hfi1/aspm.c b/drivers/infiniband/hw/hfi1/a=
spm.c
index a3c53be4072c..9b508eaf441d 100644
--- a/drivers/infiniband/hw/hfi1/aspm.c
+++ b/drivers/infiniband/hw/hfi1/aspm.c
@@ -191,7 +191,7 @@ void aspm_disable_all(struct hfi1_devdata *dd)
 	for (i =3D 0; i < dd->first_dyn_alloc_ctxt; i++) {
 		rcd =3D hfi1_rcd_get_by_index(dd, i);
 		if (rcd) {
-			del_timer_sync(&rcd->aspm_timer);
+			timer_delete_sync(&rcd->aspm_timer);
 			spin_lock_irqsave(&rcd->aspm_lock, flags);
 			rcd->aspm_intr_enable =3D false;
 			spin_unlock_irqrestore(&rcd->aspm_lock, flags);
diff --git a/drivers/infiniband/hw/hfi1/chip.c b/drivers/infiniband/hw/hfi1/c=
hip.c
index 368b6be3226f..e908f529335d 100644
--- a/drivers/infiniband/hw/hfi1/chip.c
+++ b/drivers/infiniband/hw/hfi1/chip.c
@@ -5576,7 +5576,7 @@ static int init_rcverr(struct hfi1_devdata *dd)
 static void free_rcverr(struct hfi1_devdata *dd)
 {
 	if (dd->rcverr_timer.function)
-		del_timer_sync(&dd->rcverr_timer);
+		timer_delete_sync(&dd->rcverr_timer);
 }
=20
 static void handle_rxe_err(struct hfi1_devdata *dd, u32 unused, u64 reg)
@@ -12308,7 +12308,7 @@ static void free_cntrs(struct hfi1_devdata *dd)
 	int i;
=20
 	if (dd->synth_stats_timer.function)
-		del_timer_sync(&dd->synth_stats_timer);
+		timer_delete_sync(&dd->synth_stats_timer);
 	cancel_work_sync(&dd->update_cntr_work);
 	ppd =3D (struct hfi1_pportdata *)(dd + 1);
 	for (i =3D 0; i < dd->num_pports; i++, ppd++) {
diff --git a/drivers/infiniband/hw/hfi1/driver.c b/drivers/infiniband/hw/hfi1=
/driver.c
index 50826e7cdb7e..3da90f2eb8e7 100644
--- a/drivers/infiniband/hw/hfi1/driver.c
+++ b/drivers/infiniband/hw/hfi1/driver.c
@@ -1303,7 +1303,7 @@ void shutdown_led_override(struct hfi1_pportdata *ppd)
 	 */
 	smp_rmb();
 	if (atomic_read(&ppd->led_override_timer_active)) {
-		del_timer_sync(&ppd->led_override_timer);
+		timer_delete_sync(&ppd->led_override_timer);
 		atomic_set(&ppd->led_override_timer_active, 0);
 		/* Ensure the atomic_set is visible to all CPUs */
 		smp_wmb();
diff --git a/drivers/infiniband/hw/hfi1/init.c b/drivers/infiniband/hw/hfi1/i=
nit.c
index d6fbd9c2b8b4..b35f92e7d865 100644
--- a/drivers/infiniband/hw/hfi1/init.c
+++ b/drivers/infiniband/hw/hfi1/init.c
@@ -985,7 +985,7 @@ static void stop_timers(struct hfi1_devdata *dd)
 	for (pidx =3D 0; pidx < dd->num_pports; ++pidx) {
 		ppd =3D dd->pport + pidx;
 		if (ppd->led_override_timer.function) {
-			del_timer_sync(&ppd->led_override_timer);
+			timer_delete_sync(&ppd->led_override_timer);
 			atomic_set(&ppd->led_override_timer_active, 0);
 		}
 	}
diff --git a/drivers/infiniband/hw/hfi1/sdma.c b/drivers/infiniband/hw/hfi1/s=
dma.c
index b67d23b1f286..0d2b39b7c8b5 100644
--- a/drivers/infiniband/hw/hfi1/sdma.c
+++ b/drivers/infiniband/hw/hfi1/sdma.c
@@ -1575,7 +1575,7 @@ void sdma_exit(struct hfi1_devdata *dd)
 				   sde->this_idx);
 		sdma_process_event(sde, sdma_event_e00_go_hw_down);
=20
-		del_timer_sync(&sde->err_progress_check_timer);
+		timer_delete_sync(&sde->err_progress_check_timer);
=20
 		/*
 		 * This waits for the state machine to exit so it is not
diff --git a/drivers/infiniband/hw/hfi1/tid_rdma.c b/drivers/infiniband/hw/hf=
i1/tid_rdma.c
index c465966a1d9c..78bf4a48c035 100644
--- a/drivers/infiniband/hw/hfi1/tid_rdma.c
+++ b/drivers/infiniband/hw/hfi1/tid_rdma.c
@@ -3965,7 +3965,7 @@ static int hfi1_stop_tid_reap_timer(struct rvt_qp *qp)
=20
 	lockdep_assert_held(&qp->s_lock);
 	if (qpriv->s_flags & HFI1_R_TID_RSC_TIMER) {
-		rval =3D del_timer(&qpriv->s_tid_timer);
+		rval =3D timer_delete(&qpriv->s_tid_timer);
 		qpriv->s_flags &=3D ~HFI1_R_TID_RSC_TIMER;
 	}
 	return rval;
@@ -3975,7 +3975,7 @@ void hfi1_del_tid_reap_timer(struct rvt_qp *qp)
 {
 	struct hfi1_qp_priv *qpriv =3D qp->priv;
=20
-	del_timer_sync(&qpriv->s_tid_timer);
+	timer_delete_sync(&qpriv->s_tid_timer);
 	qpriv->s_flags &=3D ~HFI1_R_TID_RSC_TIMER;
 }
=20
@@ -4781,7 +4781,7 @@ static int hfi1_stop_tid_retry_timer(struct rvt_qp *qp)
=20
 	lockdep_assert_held(&qp->s_lock);
 	if (priv->s_flags & HFI1_S_TID_RETRY_TIMER) {
-		rval =3D del_timer(&priv->s_tid_retry_timer);
+		rval =3D timer_delete(&priv->s_tid_retry_timer);
 		priv->s_flags &=3D ~HFI1_S_TID_RETRY_TIMER;
 	}
 	return rval;
@@ -4791,7 +4791,7 @@ void hfi1_del_tid_retry_timer(struct rvt_qp *qp)
 {
 	struct hfi1_qp_priv *priv =3D qp->priv;
=20
-	del_timer_sync(&priv->s_tid_retry_timer);
+	timer_delete_sync(&priv->s_tid_retry_timer);
 	priv->s_flags &=3D ~HFI1_S_TID_RETRY_TIMER;
 }
=20
diff --git a/drivers/infiniband/hw/hfi1/verbs.c b/drivers/infiniband/hw/hfi1/=
verbs.c
index 33af2196ef31..49e0f79b950c 100644
--- a/drivers/infiniband/hw/hfi1/verbs.c
+++ b/drivers/infiniband/hw/hfi1/verbs.c
@@ -1900,7 +1900,7 @@ void hfi1_unregister_ib_device(struct hfi1_devdata *dd)
 	if (!list_empty(&dev->memwait))
 		dd_dev_err(dd, "memwait list not empty!\n");
=20
-	del_timer_sync(&dev->mem_timer);
+	timer_delete_sync(&dev->mem_timer);
 	verbs_txreq_exit(dev);
=20
 	kfree(dev_cntr_descs);
diff --git a/drivers/infiniband/hw/irdma/cm.c b/drivers/infiniband/hw/irdma/c=
m.c
index ce8d821bdad8..23207f13ac1b 100644
--- a/drivers/infiniband/hw/irdma/cm.c
+++ b/drivers/infiniband/hw/irdma/cm.c
@@ -3303,7 +3303,7 @@ void irdma_cleanup_cm_core(struct irdma_cm_core *cm_cor=
e)
 	if (!cm_core)
 		return;
=20
-	del_timer_sync(&cm_core->tcp_timer);
+	timer_delete_sync(&cm_core->tcp_timer);
=20
 	destroy_workqueue(cm_core->event_wq);
 	cm_core->dev->ws_reset(&cm_core->iwdev->vsi);
diff --git a/drivers/infiniband/hw/irdma/utils.c b/drivers/infiniband/hw/irdm=
a/utils.c
index e73b14fd95ef..d66b4f7a84ec 100644
--- a/drivers/infiniband/hw/irdma/utils.c
+++ b/drivers/infiniband/hw/irdma/utils.c
@@ -963,7 +963,7 @@ void irdma_terminate_del_timer(struct irdma_sc_qp *qp)
 	int ret;
=20
 	iwqp =3D qp->qp_uk.back_qp;
-	ret =3D del_timer(&iwqp->terminate_timer);
+	ret =3D timer_delete(&iwqp->terminate_timer);
 	if (ret)
 		irdma_qp_rem_ref(&iwqp->ibqp);
 }
@@ -1570,7 +1570,7 @@ void irdma_hw_stats_stop_timer(struct irdma_sc_vsi *vsi)
 {
 	struct irdma_vsi_pestat *devstat =3D vsi->pestat;
=20
-	del_timer_sync(&devstat->stats_timer);
+	timer_delete_sync(&devstat->stats_timer);
 }
=20
 /**
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index b7c8c926c578..5fbebafc8774 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -1026,7 +1026,7 @@ void mlx5_mkey_cache_cleanup(struct mlx5_ib_dev *dev)
 	mlx5r_destroy_cache_entries(dev);
=20
 	destroy_workqueue(dev->cache.wq);
-	del_timer_sync(&dev->delay_timer);
+	timer_delete_sync(&dev->delay_timer);
 }
=20
 struct ib_mr *mlx5_ib_get_dma_mr(struct ib_pd *pd, int acc)
diff --git a/drivers/infiniband/hw/mthca/mthca_catas.c b/drivers/infiniband/h=
w/mthca/mthca_catas.c
index ffb98eaaf1c2..6eabef9aa211 100644
--- a/drivers/infiniband/hw/mthca/mthca_catas.c
+++ b/drivers/infiniband/hw/mthca/mthca_catas.c
@@ -171,7 +171,7 @@ void mthca_start_catas_poll(struct mthca_dev *dev)
=20
 void mthca_stop_catas_poll(struct mthca_dev *dev)
 {
-	del_timer_sync(&dev->catas_err.timer);
+	timer_delete_sync(&dev->catas_err.timer);
=20
 	if (dev->catas_err.map)
 		iounmap(dev->catas_err.map);
diff --git a/drivers/infiniband/hw/qib/qib_driver.c b/drivers/infiniband/hw/q=
ib/qib_driver.c
index 4fcbef99e400..bdd724add147 100644
--- a/drivers/infiniband/hw/qib/qib_driver.c
+++ b/drivers/infiniband/hw/qib/qib_driver.c
@@ -768,7 +768,7 @@ int qib_reset_device(int unit)
 		ppd =3D dd->pport + pidx;
 		if (atomic_read(&ppd->led_override_timer_active)) {
 			/* Need to stop LED timer, _then_ shut off LEDs */
-			del_timer_sync(&ppd->led_override_timer);
+			timer_delete_sync(&ppd->led_override_timer);
 			atomic_set(&ppd->led_override_timer_active, 0);
 		}
=20
diff --git a/drivers/infiniband/hw/qib/qib_iba7220.c b/drivers/infiniband/hw/=
qib/qib_iba7220.c
index 78dfe98ebcf7..302c0d19f57d 100644
--- a/drivers/infiniband/hw/qib/qib_iba7220.c
+++ b/drivers/infiniband/hw/qib/qib_iba7220.c
@@ -1656,7 +1656,7 @@ static void qib_7220_quiet_serdes(struct qib_pportdata =
*ppd)
=20
 	ppd->cpspec->chase_end =3D 0;
 	if (ppd->cpspec->chase_timer.function) /* if initted */
-		del_timer_sync(&ppd->cpspec->chase_timer);
+		timer_delete_sync(&ppd->cpspec->chase_timer);
=20
 	if (ppd->cpspec->ibsymdelta || ppd->cpspec->iblnkerrdelta ||
 	    ppd->cpspec->ibdeltainprog) {
@@ -2605,7 +2605,7 @@ static int qib_7220_set_ib_cfg(struct qib_pportdata *pp=
d, int which, u32 val)
 			 * wait forpending timer, but don't clear .data (ppd)!
 			 */
 			if (ppd->cpspec->chase_timer.expires) {
-				del_timer_sync(&ppd->cpspec->chase_timer);
+				timer_delete_sync(&ppd->cpspec->chase_timer);
 				ppd->cpspec->chase_timer.expires =3D 0;
 			}
 			break;
diff --git a/drivers/infiniband/hw/qib/qib_iba7322.c b/drivers/infiniband/hw/=
qib/qib_iba7322.c
index 9db29916e35a..7b4bf06c3b38 100644
--- a/drivers/infiniband/hw/qib/qib_iba7322.c
+++ b/drivers/infiniband/hw/qib/qib_iba7322.c
@@ -2512,7 +2512,7 @@ static void qib_7322_mini_quiet_serdes(struct qib_pport=
data *ppd)
=20
 	ppd->cpspec->chase_end =3D 0;
 	if (ppd->cpspec->chase_timer.function) /* if initted */
-		del_timer_sync(&ppd->cpspec->chase_timer);
+		timer_delete_sync(&ppd->cpspec->chase_timer);
=20
 	/*
 	 * Despite the name, actually disables IBC as well. Do it when
@@ -4239,7 +4239,7 @@ static int qib_7322_set_ib_cfg(struct qib_pportdata *pp=
d, int which, u32 val)
 			 * wait forpending timer, but don't clear .data (ppd)!
 			 */
 			if (ppd->cpspec->chase_timer.expires) {
-				del_timer_sync(&ppd->cpspec->chase_timer);
+				timer_delete_sync(&ppd->cpspec->chase_timer);
 				ppd->cpspec->chase_timer.expires =3D 0;
 			}
 			break;
diff --git a/drivers/infiniband/hw/qib/qib_init.c b/drivers/infiniband/hw/qib=
/qib_init.c
index 4100656fe9a3..33c23adec101 100644
--- a/drivers/infiniband/hw/qib/qib_init.c
+++ b/drivers/infiniband/hw/qib/qib_init.c
@@ -796,19 +796,19 @@ static void qib_stop_timers(struct qib_devdata *dd)
 	int pidx;
=20
 	if (dd->stats_timer.function)
-		del_timer_sync(&dd->stats_timer);
+		timer_delete_sync(&dd->stats_timer);
 	if (dd->intrchk_timer.function)
-		del_timer_sync(&dd->intrchk_timer);
+		timer_delete_sync(&dd->intrchk_timer);
 	for (pidx =3D 0; pidx < dd->num_pports; ++pidx) {
 		ppd =3D dd->pport + pidx;
 		if (ppd->hol_timer.function)
-			del_timer_sync(&ppd->hol_timer);
+			timer_delete_sync(&ppd->hol_timer);
 		if (ppd->led_override_timer.function) {
-			del_timer_sync(&ppd->led_override_timer);
+			timer_delete_sync(&ppd->led_override_timer);
 			atomic_set(&ppd->led_override_timer_active, 0);
 		}
 		if (ppd->symerr_clear_timer.function)
-			del_timer_sync(&ppd->symerr_clear_timer);
+			timer_delete_sync(&ppd->symerr_clear_timer);
 	}
 }
=20
diff --git a/drivers/infiniband/hw/qib/qib_mad.c b/drivers/infiniband/hw/qib/=
qib_mad.c
index ef02f2bfddb2..568deb77ab4d 100644
--- a/drivers/infiniband/hw/qib/qib_mad.c
+++ b/drivers/infiniband/hw/qib/qib_mad.c
@@ -2441,7 +2441,7 @@ void qib_notify_free_mad_agent(struct rvt_dev_info *rdi=
, int port_idx)
 					      struct qib_devdata, verbs_dev);
=20
 	if (dd->pport[port_idx].cong_stats.timer.function)
-		del_timer_sync(&dd->pport[port_idx].cong_stats.timer);
+		timer_delete_sync(&dd->pport[port_idx].cong_stats.timer);
=20
 	if (dd->pport[port_idx].ibport_data.smi_ah)
 		rdma_destroy_ah(&dd->pport[port_idx].ibport_data.smi_ah->ibah,
diff --git a/drivers/infiniband/hw/qib/qib_sd7220.c b/drivers/infiniband/hw/q=
ib/qib_sd7220.c
index 1dc3ccf0cf1f..c4ee120ac7fb 100644
--- a/drivers/infiniband/hw/qib/qib_sd7220.c
+++ b/drivers/infiniband/hw/qib/qib_sd7220.c
@@ -1375,7 +1375,7 @@ void toggle_7220_rclkrls(struct qib_devdata *dd)
 void shutdown_7220_relock_poll(struct qib_devdata *dd)
 {
 	if (dd->cspec->relock_timer_active)
-		del_timer_sync(&dd->cspec->relock_timer);
+		timer_delete_sync(&dd->cspec->relock_timer);
 }
=20
 static unsigned qib_relock_by_timer =3D 1;
diff --git a/drivers/infiniband/hw/qib/qib_verbs.c b/drivers/infiniband/hw/qi=
b/qib_verbs.c
index 5fcb41970ad9..9832567a8bb8 100644
--- a/drivers/infiniband/hw/qib/qib_verbs.c
+++ b/drivers/infiniband/hw/qib/qib_verbs.c
@@ -1655,7 +1655,7 @@ void qib_unregister_ib_device(struct qib_devdata *dd)
 	if (!list_empty(&dev->memwait))
 		qib_dev_err(dd, "memwait list not empty!\n");
=20
-	del_timer_sync(&dev->mem_timer);
+	timer_delete_sync(&dev->mem_timer);
 	while (!list_empty(&dev->txreq_free)) {
 		struct list_head *l =3D dev->txreq_free.next;
 		struct qib_verbs_txreq *tx;
diff --git a/drivers/infiniband/sw/rdmavt/qp.c b/drivers/infiniband/sw/rdmavt=
/qp.c
index 614009fb9632..583debe4b9a2 100644
--- a/drivers/infiniband/sw/rdmavt/qp.c
+++ b/drivers/infiniband/sw/rdmavt/qp.c
@@ -1297,7 +1297,7 @@ int rvt_error_qp(struct rvt_qp *qp, enum ib_wc_status e=
rr)
=20
 	if (qp->s_flags & (RVT_S_TIMER | RVT_S_WAIT_RNR)) {
 		qp->s_flags &=3D ~(RVT_S_TIMER | RVT_S_WAIT_RNR);
-		del_timer(&qp->s_timer);
+		timer_delete(&qp->s_timer);
 	}
=20
 	if (qp->s_flags & RVT_S_ANY_WAIT_SEND)
@@ -2546,7 +2546,7 @@ void rvt_stop_rc_timers(struct rvt_qp *qp)
 	/* Remove QP from all timers */
 	if (qp->s_flags & (RVT_S_TIMER | RVT_S_WAIT_RNR)) {
 		qp->s_flags &=3D ~(RVT_S_TIMER | RVT_S_WAIT_RNR);
-		del_timer(&qp->s_timer);
+		timer_delete(&qp->s_timer);
 		hrtimer_try_to_cancel(&qp->s_rnr_timer);
 	}
 }
@@ -2575,7 +2575,7 @@ static void rvt_stop_rnr_timer(struct rvt_qp *qp)
  */
 void rvt_del_timers_sync(struct rvt_qp *qp)
 {
-	del_timer_sync(&qp->s_timer);
+	timer_delete_sync(&qp->s_timer);
 	hrtimer_cancel(&qp->s_rnr_timer);
 }
 EXPORT_SYMBOL(rvt_del_timers_sync);
@@ -2596,7 +2596,7 @@ static void rvt_rc_timeout(struct timer_list *t)
=20
 		qp->s_flags &=3D ~RVT_S_TIMER;
 		rvp->n_rc_timeouts++;
-		del_timer(&qp->s_timer);
+		timer_delete(&qp->s_timer);
 		trace_rvt_rc_timeout(qp, qp->s_last_psn + 1);
 		if (rdi->driver_f.notify_restart_rc)
 			rdi->driver_f.notify_restart_rc(qp,
diff --git a/drivers/infiniband/sw/rxe/rxe_qp.c b/drivers/infiniband/sw/rxe/r=
xe_qp.c
index 91d329e90308..7975fb0e2782 100644
--- a/drivers/infiniband/sw/rxe/rxe_qp.c
+++ b/drivers/infiniband/sw/rxe/rxe_qp.c
@@ -812,8 +812,8 @@ static void rxe_qp_do_cleanup(struct work_struct *work)
 	qp->qp_timeout_jiffies =3D 0;
=20
 	if (qp_type(qp) =3D=3D IB_QPT_RC) {
-		del_timer_sync(&qp->retrans_timer);
-		del_timer_sync(&qp->rnr_nak_timer);
+		timer_delete_sync(&qp->retrans_timer);
+		timer_delete_sync(&qp->rnr_nak_timer);
 	}
=20
 	if (qp->recv_task.func)
diff --git a/drivers/input/ff-memless.c b/drivers/input/ff-memless.c
index e9120ba6bae0..009822fa61b8 100644
--- a/drivers/input/ff-memless.c
+++ b/drivers/input/ff-memless.c
@@ -136,7 +136,7 @@ static void ml_schedule_timer(struct ml_device *ml)
=20
 	if (!events) {
 		pr_debug("no actions\n");
-		del_timer(&ml->timer);
+		timer_delete(&ml->timer);
 	} else {
 		pr_debug("timer set\n");
 		mod_timer(&ml->timer, earliest);
@@ -489,7 +489,7 @@ static void ml_ff_destroy(struct ff_device *ff)
 	 * do not actually stop the timer, and therefore we should
 	 * do it here.
 	 */
-	del_timer_sync(&ml->timer);
+	timer_delete_sync(&ml->timer);
=20
 	kfree(ml->private);
 }
diff --git a/drivers/input/gameport/gameport.c b/drivers/input/gameport/gamep=
ort.c
index 10cc95867415..ae51f108bfae 100644
--- a/drivers/input/gameport/gameport.c
+++ b/drivers/input/gameport/gameport.c
@@ -191,7 +191,7 @@ void gameport_stop_polling(struct gameport *gameport)
 	spin_lock(&gameport->timer_lock);
=20
 	if (!--gameport->poll_cnt)
-		del_timer(&gameport->poll_timer);
+		timer_delete(&gameport->poll_timer);
=20
 	spin_unlock(&gameport->timer_lock);
 }
@@ -847,7 +847,7 @@ EXPORT_SYMBOL(gameport_open);
=20
 void gameport_close(struct gameport *gameport)
 {
-	del_timer_sync(&gameport->poll_timer);
+	timer_delete_sync(&gameport->poll_timer);
 	gameport->poll_handler =3D NULL;
 	gameport->poll_interval =3D 0;
 	gameport_set_drv(gameport, NULL);
diff --git a/drivers/input/input.c b/drivers/input/input.c
index c9e3ac64bcd0..ec4346f20efd 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -96,7 +96,7 @@ static void input_start_autorepeat(struct input_dev *dev, i=
nt code)
=20
 static void input_stop_autorepeat(struct input_dev *dev)
 {
-	del_timer(&dev->timer);
+	timer_delete(&dev->timer);
 }
=20
 /*
@@ -2223,7 +2223,7 @@ static void __input_unregister_device(struct input_dev =
*dev)
 			handle->handler->disconnect(handle);
 		WARN_ON(!list_empty(&dev->h_list));
=20
-		del_timer_sync(&dev->timer);
+		timer_delete_sync(&dev->timer);
 		list_del_init(&dev->node);
=20
 		input_wakeup_procfs_readers();
diff --git a/drivers/input/joystick/db9.c b/drivers/input/joystick/db9.c
index a9f1946cf0d6..d7a253835889 100644
--- a/drivers/input/joystick/db9.c
+++ b/drivers/input/joystick/db9.c
@@ -531,7 +531,7 @@ static void db9_close(struct input_dev *dev)
 	guard(mutex)(&db9->mutex);
=20
 	if (!--db9->used) {
-		del_timer_sync(&db9->timer);
+		timer_delete_sync(&db9->timer);
 		parport_write_control(port, 0x00);
 		parport_data_forward(port);
 		parport_release(db9->pd);
diff --git a/drivers/input/joystick/gamecon.c b/drivers/input/joystick/gameco=
n.c
index b53cafd7a5ee..9fc629ad58b8 100644
--- a/drivers/input/joystick/gamecon.c
+++ b/drivers/input/joystick/gamecon.c
@@ -786,7 +786,7 @@ static void gc_close(struct input_dev *dev)
 	guard(mutex)(&gc->mutex);
=20
 	if (!--gc->used) {
-		del_timer_sync(&gc->timer);
+		timer_delete_sync(&gc->timer);
 		parport_write_control(gc->pd->port, 0x00);
 		parport_release(gc->pd);
 	}
diff --git a/drivers/input/joystick/n64joy.c b/drivers/input/joystick/n64joy.c
index c344dbc0c493..94d2f4e96fe6 100644
--- a/drivers/input/joystick/n64joy.c
+++ b/drivers/input/joystick/n64joy.c
@@ -216,7 +216,7 @@ static void n64joy_close(struct input_dev *dev)
 	guard(mutex)(&priv->n64joy_mutex);
=20
 	if (!--priv->n64joy_opened)
-		del_timer_sync(&priv->timer);
+		timer_delete_sync(&priv->timer);
 }
=20
 static const u64 __initconst scandata[] ____cacheline_aligned =3D {
diff --git a/drivers/input/joystick/turbografx.c b/drivers/input/joystick/tur=
bografx.c
index db696ba61a3b..aa3e7d471b96 100644
--- a/drivers/input/joystick/turbografx.c
+++ b/drivers/input/joystick/turbografx.c
@@ -124,7 +124,7 @@ static void tgfx_close(struct input_dev *dev)
 	guard(mutex)(&tgfx->sem);
=20
 	if (!--tgfx->used) {
-		del_timer_sync(&tgfx->timer);
+		timer_delete_sync(&tgfx->timer);
 		parport_write_control(tgfx->pd->port, 0x00);
 		parport_release(tgfx->pd);
 	}
diff --git a/drivers/input/joystick/walkera0701.c b/drivers/input/joystick/wa=
lkera0701.c
index 59eea813f258..15370fb82317 100644
--- a/drivers/input/joystick/walkera0701.c
+++ b/drivers/input/joystick/walkera0701.c
@@ -232,8 +232,7 @@ static void walkera0701_attach(struct parport *pp)
 		goto err_unregister_device;
 	}
=20
-	hrtimer_init(&w->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	w->timer.function =3D timer_handler;
+	hrtimer_setup(&w->timer, timer_handler, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
=20
 	w->input_dev =3D input_allocate_device();
 	if (!w->input_dev) {
diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio=
_keys.c
index 5eef66516e37..5c39a217b94c 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -590,9 +590,8 @@ static int gpio_keys_setup_key(struct platform_device *pd=
ev,
=20
 		INIT_DELAYED_WORK(&bdata->work, gpio_keys_gpio_work_func);
=20
-		hrtimer_init(&bdata->debounce_timer,
-			     CLOCK_REALTIME, HRTIMER_MODE_REL);
-		bdata->debounce_timer.function =3D gpio_keys_debounce_timer;
+		hrtimer_setup(&bdata->debounce_timer, gpio_keys_debounce_timer,
+			      CLOCK_REALTIME, HRTIMER_MODE_REL);
=20
 		isr =3D gpio_keys_gpio_isr;
 		irqflags =3D IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
@@ -628,9 +627,8 @@ static int gpio_keys_setup_key(struct platform_device *pd=
ev,
 		}
=20
 		bdata->release_delay =3D button->debounce_interval;
-		hrtimer_init(&bdata->release_timer,
-			     CLOCK_REALTIME, HRTIMER_MODE_REL_HARD);
-		bdata->release_timer.function =3D gpio_keys_irq_timer;
+		hrtimer_setup(&bdata->release_timer, gpio_keys_irq_timer,
+			      CLOCK_REALTIME, HRTIMER_MODE_REL_HARD);
=20
 		isr =3D gpio_keys_irq_isr;
 		irqflags =3D 0;
diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx=
_keypad.c
index b92268ddfd84..3cd47fa44efc 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -370,7 +370,7 @@ static void imx_keypad_close(struct input_dev *dev)
 	/* Mark keypad as being inactive */
 	keypad->enabled =3D false;
 	synchronize_irq(keypad->irq);
-	del_timer_sync(&keypad->check_matrix_timer);
+	timer_delete_sync(&keypad->check_matrix_timer);
=20
 	imx_keypad_inhibit(keypad);
=20
diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/sn=
vs_pwrkey.c
index f7b5f1e25c80..bbf409dda89f 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -104,7 +104,7 @@ static void imx_snvs_pwrkey_act(void *pdata)
 {
 	struct pwrkey_drv_data *pd =3D pdata;
=20
-	del_timer_sync(&pd->check_timer);
+	timer_delete_sync(&pd->check_timer);
 }
=20
 static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegr=
a-kbc.c
index 6776dd94ce76..32a676f0de53 100644
--- a/drivers/input/keyboard/tegra-kbc.c
+++ b/drivers/input/keyboard/tegra-kbc.c
@@ -416,7 +416,7 @@ static void tegra_kbc_stop(struct tegra_kbc *kbc)
 	}
=20
 	disable_irq(kbc->irq);
-	del_timer_sync(&kbc->timer);
+	timer_delete_sync(&kbc->timer);
=20
 	clk_disable_unprepare(kbc->clk);
 }
@@ -703,7 +703,7 @@ static int tegra_kbc_suspend(struct device *dev)
=20
 	if (device_may_wakeup(&pdev->dev)) {
 		disable_irq(kbc->irq);
-		del_timer_sync(&kbc->timer);
+		timer_delete_sync(&kbc->timer);
 		tegra_kbc_set_fifo_interrupt(kbc, false);
=20
 		/* Forcefully clear the interrupt status */
diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 0728b5c08f02..0bd7b09b0aa3 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -1519,7 +1519,7 @@ static psmouse_ret_t alps_handle_interleaved_ps2(struct=
 psmouse *psmouse)
 		return PSMOUSE_GOOD_DATA;
 	}
=20
-	del_timer(&priv->timer);
+	timer_delete(&priv->timer);
=20
 	if (psmouse->packet[6] & 0x80) {
=20
diff --git a/drivers/input/mouse/byd.c b/drivers/input/mouse/byd.c
index 654b38d249f3..4ee084e00a7c 100644
--- a/drivers/input/mouse/byd.c
+++ b/drivers/input/mouse/byd.c
@@ -425,7 +425,7 @@ static void byd_disconnect(struct psmouse *psmouse)
 	struct byd_data *priv =3D psmouse->private;
=20
 	if (priv) {
-		del_timer(&priv->timer);
+		timer_delete(&priv->timer);
 		kfree(psmouse->private);
 		psmouse->private =3D NULL;
 	}
diff --git a/drivers/input/serio/hil_mlc.c b/drivers/input/serio/hil_mlc.c
index d36e89d6fc54..94e8bcbbf94d 100644
--- a/drivers/input/serio/hil_mlc.c
+++ b/drivers/input/serio/hil_mlc.c
@@ -1017,7 +1017,7 @@ static int __init hil_mlc_init(void)
=20
 static void __exit hil_mlc_exit(void)
 {
-	del_timer_sync(&hil_mlcs_kicker);
+	timer_delete_sync(&hil_mlcs_kicker);
 	tasklet_kill(&hil_mlcs_tasklet);
 }
=20
diff --git a/drivers/input/serio/hp_sdc.c b/drivers/input/serio/hp_sdc.c
index 13eacf6ab431..0eec4c5585cb 100644
--- a/drivers/input/serio/hp_sdc.c
+++ b/drivers/input/serio/hp_sdc.c
@@ -980,7 +980,7 @@ static void hp_sdc_exit(void)
 	free_irq(hp_sdc.irq, &hp_sdc);
 	write_unlock_irq(&hp_sdc.lock);
=20
-	del_timer_sync(&hp_sdc.kicker);
+	timer_delete_sync(&hp_sdc.kicker);
=20
 	tasklet_kill(&hp_sdc.task);
=20
diff --git a/drivers/input/touchscreen/ad7877.c b/drivers/input/touchscreen/a=
d7877.c
index a0598e9c7aff..8d8392ce7005 100644
--- a/drivers/input/touchscreen/ad7877.c
+++ b/drivers/input/touchscreen/ad7877.c
@@ -415,7 +415,7 @@ static void ad7877_disable(void *data)
 		ts->disabled =3D true;
 		disable_irq(ts->spi->irq);
=20
-		if (del_timer_sync(&ts->timer))
+		if (timer_delete_sync(&ts->timer))
 			ad7877_ts_event_release(ts);
 	}
=20
diff --git a/drivers/input/touchscreen/ad7879.c b/drivers/input/touchscreen/a=
d7879.c
index e5d69bf2276e..f661e199b63c 100644
--- a/drivers/input/touchscreen/ad7879.c
+++ b/drivers/input/touchscreen/ad7879.c
@@ -273,7 +273,7 @@ static void __ad7879_disable(struct ad7879 *ts)
 		AD7879_PM(AD7879_PM_SHUTDOWN);
 	disable_irq(ts->irq);
=20
-	if (del_timer_sync(&ts->timer))
+	if (timer_delete_sync(&ts->timer))
 		ad7879_ts_event_release(ts);
=20
 	ad7879_write(ts, AD7879_REG_CTRL2, reg);
diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscre=
en/bu21029_ts.c
index 686d0a6b1570..3c997fba7048 100644
--- a/drivers/input/touchscreen/bu21029_ts.c
+++ b/drivers/input/touchscreen/bu21029_ts.c
@@ -325,7 +325,7 @@ static void bu21029_stop_chip(struct input_dev *dev)
 	struct bu21029_ts_data *bu21029 =3D input_get_drvdata(dev);
=20
 	disable_irq(bu21029->client->irq);
-	del_timer_sync(&bu21029->timer);
+	timer_delete_sync(&bu21029->timer);
=20
 	bu21029_put_chip_in_reset(bu21029);
 	regulator_disable(bu21029->vdd);
diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/=
exc3000.c
index fdda8412b164..9a5977d8cad2 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -174,7 +174,7 @@ static int exc3000_handle_mt_event(struct exc3000_data *d=
ata)
 	/*
 	 * We read full state successfully, no contacts will be "stuck".
 	 */
-	del_timer_sync(&data->timer);
+	timer_delete_sync(&data->timer);
=20
 	while (total_slots > 0) {
 		int slots =3D min(total_slots, EXC3000_SLOTS_PER_FRAME);
diff --git a/drivers/input/touchscreen/sx8654.c b/drivers/input/touchscreen/s=
x8654.c
index f5c5881cef6b..e59b8d0ed19e 100644
--- a/drivers/input/touchscreen/sx8654.c
+++ b/drivers/input/touchscreen/sx8654.c
@@ -290,7 +290,7 @@ static void sx8654_close(struct input_dev *dev)
 	disable_irq(client->irq);
=20
 	if (!sx8654->data->has_irq_penrelease)
-		del_timer_sync(&sx8654->timer);
+		timer_delete_sync(&sx8654->timer);
=20
 	/* enable manual mode mode */
 	error =3D i2c_smbus_write_byte(client, sx8654->data->cmd_manual);
diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchsc=
reen/tsc200x-core.c
index df39dee13e1c..252a93753ee5 100644
--- a/drivers/input/touchscreen/tsc200x-core.c
+++ b/drivers/input/touchscreen/tsc200x-core.c
@@ -229,7 +229,7 @@ static void __tsc200x_disable(struct tsc200x *ts)
=20
 	guard(disable_irq)(&ts->irq);
=20
-	del_timer_sync(&ts->penup_timer);
+	timer_delete_sync(&ts->penup_timer);
 	cancel_delayed_work_sync(&ts->esd_work);
 }
=20
@@ -388,7 +388,7 @@ static void tsc200x_esd_work(struct work_struct *work)
 		dev_info(ts->dev, "TSC200X not responding - resetting\n");
=20
 		scoped_guard(disable_irq, &ts->irq) {
-			del_timer_sync(&ts->penup_timer);
+			timer_delete_sync(&ts->penup_timer);
 			tsc200x_update_pen_state(ts, 0, 0, 0);
 			tsc200x_reset(ts);
 		}
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 6054d0ab8023..cb7e29dcac15 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -271,7 +271,7 @@ static void iommu_dma_free_fq(struct iommu_dma_cookie *co=
okie)
 	if (!cookie->fq_domain)
 		return;
=20
-	del_timer_sync(&cookie->fq_timer);
+	timer_delete_sync(&cookie->fq_timer);
 	if (cookie->options.qt =3D=3D IOMMU_DMA_OPTS_SINGLE_QUEUE)
 		iommu_dma_free_fq_single(cookie->single_fq);
 	else
diff --git a/drivers/isdn/hardware/mISDN/hfcmulti.c b/drivers/isdn/hardware/m=
ISDN/hfcmulti.c
index 45ff0e198f8f..f6c27ca92c01 100644
--- a/drivers/isdn/hardware/mISDN/hfcmulti.c
+++ b/drivers/isdn/hardware/mISDN/hfcmulti.c
@@ -3249,7 +3249,7 @@ hfcm_l1callback(struct dchannel *dch, u_int cmd)
 		}
 		test_and_clear_bit(FLG_TX_BUSY, &dch->Flags);
 		if (test_and_clear_bit(FLG_BUSY_TIMER, &dch->Flags))
-			del_timer(&dch->timer);
+			timer_delete(&dch->timer);
 		spin_unlock_irqrestore(&hc->lock, flags);
 		__skb_queue_purge(&free_queue);
 		break;
@@ -3394,7 +3394,7 @@ handle_dmsg(struct mISDNchannel *ch, struct sk_buff *sk=
b)
 			}
 			test_and_clear_bit(FLG_TX_BUSY, &dch->Flags);
 			if (test_and_clear_bit(FLG_BUSY_TIMER, &dch->Flags))
-				del_timer(&dch->timer);
+				timer_delete(&dch->timer);
 #ifdef FIXME
 			if (test_and_clear_bit(FLG_L1_BUSY, &dch->Flags))
 				dchannel_sched_event(&hc->dch, D_CLEARBUSY);
@@ -4522,7 +4522,7 @@ release_port(struct hfc_multi *hc, struct dchannel *dch)
 	spin_lock_irqsave(&hc->lock, flags);
=20
 	if (dch->timer.function) {
-		del_timer(&dch->timer);
+		timer_delete(&dch->timer);
 		dch->timer.function =3D NULL;
 	}
=20
diff --git a/drivers/isdn/hardware/mISDN/hfcpci.c b/drivers/isdn/hardware/mIS=
DN/hfcpci.c
index ce7bccc9faa3..e3870d942699 100644
--- a/drivers/isdn/hardware/mISDN/hfcpci.c
+++ b/drivers/isdn/hardware/mISDN/hfcpci.c
@@ -158,7 +158,7 @@ release_io_hfcpci(struct hfc_pci *hc)
 {
 	/* disable memory mapped ports + busmaster */
 	pci_write_config_word(hc->pdev, PCI_COMMAND, 0);
-	del_timer(&hc->hw.timer);
+	timer_delete(&hc->hw.timer);
 	dma_free_coherent(&hc->pdev->dev, 0x8000, hc->hw.fifos,
 			  hc->hw.dmahandle);
 	iounmap(hc->hw.pci_io);
@@ -1087,7 +1087,7 @@ hfc_l1callback(struct dchannel *dch, u_int cmd)
 		}
 		test_and_clear_bit(FLG_TX_BUSY, &dch->Flags);
 		if (test_and_clear_bit(FLG_BUSY_TIMER, &dch->Flags))
-			del_timer(&dch->timer);
+			timer_delete(&dch->timer);
 		break;
 	case HW_POWERUP_REQ:
 		Write_hfc(hc, HFCPCI_STATES, HFCPCI_DO_ACTION);
@@ -1216,7 +1216,7 @@ hfcpci_int(int intno, void *dev_id)
 		receive_dmsg(hc);
 	if (val & 0x04) {	/* D tx */
 		if (test_and_clear_bit(FLG_BUSY_TIMER, &hc->dch.Flags))
-			del_timer(&hc->dch.timer);
+			timer_delete(&hc->dch.timer);
 		tx_dirq(&hc->dch);
 	}
 	spin_unlock(&hc->lock);
@@ -1635,7 +1635,7 @@ hfcpci_l2l1D(struct mISDNchannel *ch, struct sk_buff *s=
kb)
 			}
 			test_and_clear_bit(FLG_TX_BUSY, &dch->Flags);
 			if (test_and_clear_bit(FLG_BUSY_TIMER, &dch->Flags))
-				del_timer(&dch->timer);
+				timer_delete(&dch->timer);
 #ifdef FIXME
 			if (test_and_clear_bit(FLG_L1_BUSY, &dch->Flags))
 				dchannel_sched_event(&hc->dch, D_CLEARBUSY);
@@ -2064,7 +2064,7 @@ release_card(struct hfc_pci *hc) {
 	mode_hfcpci(&hc->bch[0], 1, ISDN_P_NONE);
 	mode_hfcpci(&hc->bch[1], 2, ISDN_P_NONE);
 	if (hc->dch.timer.function !=3D NULL) {
-		del_timer(&hc->dch.timer);
+		timer_delete(&hc->dch.timer);
 		hc->dch.timer.function =3D NULL;
 	}
 	spin_unlock_irqrestore(&hc->lock, flags);
@@ -2342,7 +2342,7 @@ HFC_init(void)
 	err =3D pci_register_driver(&hfc_driver);
 	if (err) {
 		if (timer_pending(&hfc_tl))
-			del_timer(&hfc_tl);
+			timer_delete(&hfc_tl);
 	}
=20
 	return err;
@@ -2351,7 +2351,7 @@ HFC_init(void)
 static void __exit
 HFC_cleanup(void)
 {
-	del_timer_sync(&hfc_tl);
+	timer_delete_sync(&hfc_tl);
=20
 	pci_unregister_driver(&hfc_driver);
 }
diff --git a/drivers/isdn/hardware/mISDN/mISDNipac.c b/drivers/isdn/hardware/=
mISDN/mISDNipac.c
index d0b7271fbda1..165a63994f04 100644
--- a/drivers/isdn/hardware/mISDN/mISDNipac.c
+++ b/drivers/isdn/hardware/mISDN/mISDNipac.c
@@ -158,7 +158,7 @@ isac_fill_fifo(struct isac_hw *isac)
 	WriteISAC(isac, ISAC_CMDR, more ? 0x8 : 0xa);
 	if (test_and_set_bit(FLG_BUSY_TIMER, &isac->dch.Flags)) {
 		pr_debug("%s: %s dbusytimer running\n", isac->name, __func__);
-		del_timer(&isac->dch.timer);
+		timer_delete(&isac->dch.timer);
 	}
 	isac->dch.timer.expires =3D jiffies + ((DBUSY_TIMER_VALUE * HZ)/1000);
 	add_timer(&isac->dch.timer);
@@ -206,7 +206,7 @@ static void
 isac_xpr_irq(struct isac_hw *isac)
 {
 	if (test_and_clear_bit(FLG_BUSY_TIMER, &isac->dch.Flags))
-		del_timer(&isac->dch.timer);
+		timer_delete(&isac->dch.timer);
 	if (isac->dch.tx_skb && isac->dch.tx_idx < isac->dch.tx_skb->len) {
 		isac_fill_fifo(isac);
 	} else {
@@ -220,7 +220,7 @@ static void
 isac_retransmit(struct isac_hw *isac)
 {
 	if (test_and_clear_bit(FLG_BUSY_TIMER, &isac->dch.Flags))
-		del_timer(&isac->dch.timer);
+		timer_delete(&isac->dch.timer);
 	if (test_bit(FLG_TX_BUSY, &isac->dch.Flags)) {
 		/* Restart frame */
 		isac->dch.tx_idx =3D 0;
@@ -665,7 +665,7 @@ isac_l1cmd(struct dchannel *dch, u32 cmd)
 		}
 		test_and_clear_bit(FLG_TX_BUSY, &dch->Flags);
 		if (test_and_clear_bit(FLG_BUSY_TIMER, &dch->Flags))
-			del_timer(&dch->timer);
+			timer_delete(&dch->timer);
 		break;
 	case HW_POWERUP_REQ:
 		spin_lock_irqsave(isac->hwlock, flags);
@@ -698,7 +698,7 @@ isac_release(struct isac_hw *isac)
 	else if (isac->type !=3D 0)
 		WriteISAC(isac, ISAC_MASK, 0xff);
 	if (isac->dch.timer.function !=3D NULL) {
-		del_timer(&isac->dch.timer);
+		timer_delete(&isac->dch.timer);
 		isac->dch.timer.function =3D NULL;
 	}
 	kfree(isac->mon_rx);
diff --git a/drivers/isdn/hardware/mISDN/mISDNisar.c b/drivers/isdn/hardware/=
mISDN/mISDNisar.c
index b3e03c410544..e48f89cbecf8 100644
--- a/drivers/isdn/hardware/mISDN/mISDNisar.c
+++ b/drivers/isdn/hardware/mISDN/mISDNisar.c
@@ -930,7 +930,7 @@ isar_pump_statev_fax(struct isar_ch *ch, u8 devt) {
 				/* 1s (200 ms) Flags before data */
 				if (test_and_set_bit(FLG_FTI_RUN,
 						     &ch->bch.Flags))
-					del_timer(&ch->ftimer);
+					timer_delete(&ch->ftimer);
 				ch->ftimer.expires =3D
 					jiffies + ((delay * HZ) / 1000);
 				test_and_set_bit(FLG_LL_CONN,
@@ -1603,8 +1603,8 @@ free_isar(struct isar_hw *isar)
 {
 	modeisar(&isar->ch[0], ISDN_P_NONE);
 	modeisar(&isar->ch[1], ISDN_P_NONE);
-	del_timer(&isar->ch[0].ftimer);
-	del_timer(&isar->ch[1].ftimer);
+	timer_delete(&isar->ch[0].ftimer);
+	timer_delete(&isar->ch[1].ftimer);
 	test_and_clear_bit(FLG_INITIALIZED, &isar->ch[0].bch.Flags);
 	test_and_clear_bit(FLG_INITIALIZED, &isar->ch[1].bch.Flags);
 }
diff --git a/drivers/isdn/hardware/mISDN/w6692.c b/drivers/isdn/hardware/mISD=
N/w6692.c
index ee69212ac351..da933f4bdf4e 100644
--- a/drivers/isdn/hardware/mISDN/w6692.c
+++ b/drivers/isdn/hardware/mISDN/w6692.c
@@ -294,7 +294,7 @@ W6692_fill_Dfifo(struct w6692_hw *card)
 	WriteW6692(card, W_D_CMDR, cmd);
 	if (test_and_set_bit(FLG_BUSY_TIMER, &dch->Flags)) {
 		pr_debug("%s: fill_Dfifo dbusytimer running\n", card->name);
-		del_timer(&dch->timer);
+		timer_delete(&dch->timer);
 	}
 	dch->timer.expires =3D jiffies + ((DBUSY_TIMER_VALUE * HZ) / 1000);
 	add_timer(&dch->timer);
@@ -311,7 +311,7 @@ d_retransmit(struct w6692_hw *card)
 	struct dchannel *dch =3D &card->dch;
=20
 	if (test_and_clear_bit(FLG_BUSY_TIMER, &dch->Flags))
-		del_timer(&dch->timer);
+		timer_delete(&dch->timer);
 #ifdef FIXME
 	if (test_and_clear_bit(FLG_L1_BUSY, &dch->Flags))
 		dchannel_sched_event(dch, D_CLEARBUSY);
@@ -372,7 +372,7 @@ handle_rxD(struct w6692_hw *card) {
 static void
 handle_txD(struct w6692_hw *card) {
 	if (test_and_clear_bit(FLG_BUSY_TIMER, &card->dch.Flags))
-		del_timer(&card->dch.timer);
+		timer_delete(&card->dch.timer);
 	if (card->dch.tx_skb && card->dch.tx_idx < card->dch.tx_skb->len) {
 		W6692_fill_Dfifo(card);
 	} else {
@@ -1130,7 +1130,7 @@ w6692_l1callback(struct dchannel *dch, u32 cmd)
 		}
 		test_and_clear_bit(FLG_TX_BUSY, &dch->Flags);
 		if (test_and_clear_bit(FLG_BUSY_TIMER, &dch->Flags))
-			del_timer(&dch->timer);
+			timer_delete(&dch->timer);
 		break;
 	case HW_POWERUP_REQ:
 		spin_lock_irqsave(&card->lock, flags);
diff --git a/drivers/isdn/mISDN/dsp_core.c b/drivers/isdn/mISDN/dsp_core.c
index 753232e9fc36..d0aa415a6b09 100644
--- a/drivers/isdn/mISDN/dsp_core.c
+++ b/drivers/isdn/mISDN/dsp_core.c
@@ -928,7 +928,7 @@ dsp_function(struct mISDNchannel *ch,  struct sk_buff *sk=
b)
 		dsp->tone.hardware =3D 0;
 		dsp->tone.software =3D 0;
 		if (timer_pending(&dsp->tone.tl))
-			del_timer(&dsp->tone.tl);
+			timer_delete(&dsp->tone.tl);
 		if (dsp->conf)
 			dsp_cmx_conf(dsp, 0); /* dsp_cmx_hardware will also be
 						 called here */
@@ -975,7 +975,7 @@ dsp_ctrl(struct mISDNchannel *ch, u_int cmd, void *arg)
 		cancel_work_sync(&dsp->workq);
 		spin_lock_irqsave(&dsp_lock, flags);
 		if (timer_pending(&dsp->tone.tl))
-			del_timer(&dsp->tone.tl);
+			timer_delete(&dsp->tone.tl);
 		skb_queue_purge(&dsp->sendq);
 		if (dsp_debug & DEBUG_DSP_CTRL)
 			printk(KERN_DEBUG "%s: releasing member %s\n",
@@ -1209,7 +1209,7 @@ static void __exit dsp_cleanup(void)
 {
 	mISDN_unregister_Bprotocol(&DSP);
=20
-	del_timer_sync(&dsp_spl_tl);
+	timer_delete_sync(&dsp_spl_tl);
=20
 	if (!list_empty(&dsp_ilist)) {
 		printk(KERN_ERR "mISDN_dsp: Audio DSP object inst list not "
diff --git a/drivers/isdn/mISDN/dsp_tones.c b/drivers/isdn/mISDN/dsp_tones.c
index 8389e2105cdc..456b313bfa76 100644
--- a/drivers/isdn/mISDN/dsp_tones.c
+++ b/drivers/isdn/mISDN/dsp_tones.c
@@ -505,7 +505,7 @@ dsp_tone(struct dsp *dsp, int tone)
 	/* we turn off the tone */
 	if (!tone) {
 		if (dsp->features.hfc_loops && timer_pending(&tonet->tl))
-			del_timer(&tonet->tl);
+			timer_delete(&tonet->tl);
 		if (dsp->features.hfc_loops)
 			dsp_tone_hw_message(dsp, NULL, 0);
 		tonet->tone =3D 0;
@@ -539,7 +539,7 @@ dsp_tone(struct dsp *dsp, int tone)
 		dsp_tone_hw_message(dsp, pat->data[0], *(pat->siz[0]));
 		/* set timer */
 		if (timer_pending(&tonet->tl))
-			del_timer(&tonet->tl);
+			timer_delete(&tonet->tl);
 		tonet->tl.expires =3D jiffies + (pat->seq[0] * HZ) / 8000;
 		add_timer(&tonet->tl);
 	} else {
diff --git a/drivers/isdn/mISDN/fsm.c b/drivers/isdn/mISDN/fsm.c
index 7c5c2ca6c6d8..5ed0a6110687 100644
--- a/drivers/isdn/mISDN/fsm.c
+++ b/drivers/isdn/mISDN/fsm.c
@@ -123,7 +123,7 @@ mISDN_FsmDelTimer(struct FsmTimer *ft, int where)
 		ft->fi->printdebug(ft->fi, "mISDN_FsmDelTimer %lx %d",
 				   (long) ft, where);
 #endif
-	del_timer(&ft->tl);
+	timer_delete(&ft->tl);
 }
 EXPORT_SYMBOL(mISDN_FsmDelTimer);
=20
@@ -167,7 +167,7 @@ mISDN_FsmRestartTimer(struct FsmTimer *ft,
 #endif
=20
 	if (timer_pending(&ft->tl))
-		del_timer(&ft->tl);
+		timer_delete(&ft->tl);
 	ft->event =3D event;
 	ft->arg =3D arg;
 	ft->tl.expires =3D jiffies + (millisec * HZ) / 1000;
diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt851=
5.c
index 6b051f182b72..32ba397a33d2 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -127,7 +127,7 @@ static int rt8515_led_flash_strobe_set(struct led_classde=
v_flash *fled,
 		mod_timer(&rt->powerdown_timer,
 			  jiffies + usecs_to_jiffies(timeout->val));
 	} else {
-		del_timer_sync(&rt->powerdown_timer);
+		timer_delete_sync(&rt->powerdown_timer);
 		/* Turn the LED off */
 		rt8515_gpio_led_off(rt);
 	}
@@ -372,7 +372,7 @@ static void rt8515_remove(struct platform_device *pdev)
 	struct rt8515 *rt =3D platform_get_drvdata(pdev);
=20
 	rt8515_v4l2_flash_release(rt);
-	del_timer_sync(&rt->powerdown_timer);
+	timer_delete_sync(&rt->powerdown_timer);
 	mutex_destroy(&rt->lock);
 }
=20
diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3=
140.c
index 3c01739c0b46..48fb8a9ec703 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -55,7 +55,7 @@ static int sgm3140_strobe_set(struct led_classdev_flash *fl=
ed_cdev, bool state)
 		mod_timer(&priv->powerdown_timer,
 			  jiffies + usecs_to_jiffies(priv->timeout));
 	} else {
-		del_timer_sync(&priv->powerdown_timer);
+		timer_delete_sync(&priv->powerdown_timer);
 		gpiod_set_value_cansleep(priv->enable_gpio, 0);
 		gpiod_set_value_cansleep(priv->flash_gpio, 0);
 		ret =3D regulator_disable(priv->vin_regulator);
@@ -117,7 +117,7 @@ static int sgm3140_brightness_set(struct led_classdev *le=
d_cdev,
 		gpiod_set_value_cansleep(priv->flash_gpio, 0);
 		gpiod_set_value_cansleep(priv->enable_gpio, 1);
 	} else {
-		del_timer_sync(&priv->powerdown_timer);
+		timer_delete_sync(&priv->powerdown_timer);
 		gpiod_set_value_cansleep(priv->flash_gpio, 0);
 		gpiod_set_value_cansleep(priv->enable_gpio, 0);
 		ret =3D regulator_disable(priv->vin_regulator);
@@ -285,7 +285,7 @@ static void sgm3140_remove(struct platform_device *pdev)
 {
 	struct sgm3140 *priv =3D platform_get_drvdata(pdev);
=20
-	del_timer_sync(&priv->powerdown_timer);
+	timer_delete_sync(&priv->powerdown_timer);
=20
 	v4l2_flash_release(priv->v4l2_flash);
 }
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index e3d8ddcff567..907fc703e0c5 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -245,7 +245,7 @@ void led_blink_set(struct led_classdev *led_cdev,
 		   unsigned long *delay_on,
 		   unsigned long *delay_off)
 {
-	del_timer_sync(&led_cdev->blink_timer);
+	timer_delete_sync(&led_cdev->blink_timer);
=20
 	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
 	clear_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags);
@@ -294,7 +294,7 @@ EXPORT_SYMBOL_GPL(led_blink_set_nosleep);
=20
 void led_stop_software_blink(struct led_classdev *led_cdev)
 {
-	del_timer_sync(&led_cdev->blink_timer);
+	timer_delete_sync(&led_cdev->blink_timer);
 	led_cdev->blink_delay_on =3D 0;
 	led_cdev->blink_delay_off =3D 0;
 	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/le=
dtrig-pattern.c
index a594bd5e2233..06d052957d37 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -94,7 +94,7 @@ static void pattern_trig_timer_cancel(struct pattern_trig_d=
ata *data)
 	if (data->type =3D=3D PATTERN_TYPE_HR)
 		hrtimer_cancel(&data->hrtimer);
 	else
-		del_timer_sync(&data->timer);
+		timer_delete_sync(&data->timer);
 }
=20
 static void pattern_trig_timer_restart(struct pattern_trig_data *data,
diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/=
ledtrig-transient.c
index f111fa7635e5..e103c7ed830b 100644
--- a/drivers/leds/trigger/ledtrig-transient.c
+++ b/drivers/leds/trigger/ledtrig-transient.c
@@ -66,7 +66,7 @@ static ssize_t transient_activate_store(struct device *dev,
=20
 	/* cancel the running timer */
 	if (state =3D=3D 0 && transient_data->activate =3D=3D 1) {
-		del_timer(&transient_data->timer);
+		timer_delete(&transient_data->timer);
 		transient_data->activate =3D state;
 		led_set_brightness_nosleep(led_cdev,
 					transient_data->restore_state);
diff --git a/drivers/macintosh/adbhid.c b/drivers/macintosh/adbhid.c
index b2fe7a3dc471..c5aabf238d0a 100644
--- a/drivers/macintosh/adbhid.c
+++ b/drivers/macintosh/adbhid.c
@@ -724,7 +724,7 @@ adb_message_handler(struct notifier_block *this, unsigned=
 long code, void *x)
 			int i;
 			for (i =3D 1; i < 16; i++) {
 				if (adbhid[i])
-					del_timer_sync(&adbhid[i]->input->timer);
+					timer_delete_sync(&adbhid[i]->input->timer);
 			}
 		}
=20
diff --git a/drivers/mailbox/mailbox-altera.c b/drivers/mailbox/mailbox-alter=
a.c
index afb320e9d69c..748128661892 100644
--- a/drivers/mailbox/mailbox-altera.c
+++ b/drivers/mailbox/mailbox-altera.c
@@ -270,7 +270,7 @@ static void altera_mbox_shutdown(struct mbox_chan *chan)
 		writel_relaxed(~0, mbox->mbox_base + MAILBOX_INTMASK_REG);
 		free_irq(mbox->irq, chan);
 	} else if (!mbox->is_sender) {
-		del_timer_sync(&mbox->rxpoll_timer);
+		timer_delete_sync(&mbox->rxpoll_timer);
 	}
 }
=20
diff --git a/drivers/md/bcache/stats.c b/drivers/md/bcache/stats.c
index 68b02216033d..d39dec34b7a3 100644
--- a/drivers/md/bcache/stats.c
+++ b/drivers/md/bcache/stats.c
@@ -123,7 +123,7 @@ void bch_cache_accounting_destroy(struct cache_accounting=
 *acc)
 	kobject_put(&acc->day.kobj);
=20
 	atomic_set(&acc->closing, 1);
-	if (del_timer_sync(&acc->timer))
+	if (timer_delete_sync(&acc->timer))
 		closure_return(&acc->cl);
 }
=20
diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 8b219b1199b4..2a283feb3319 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -2707,7 +2707,7 @@ static void integrity_commit(struct work_struct *w)
 	unsigned int i, j, n;
 	struct bio *flushes;
=20
-	del_timer(&ic->autocommit_timer);
+	timer_delete(&ic->autocommit_timer);
=20
 	if (ic->mode =3D=3D 'I')
 		return;
@@ -3606,7 +3606,7 @@ static void dm_integrity_postsuspend(struct dm_target *=
ti)
=20
 	WARN_ON(unregister_reboot_notifier(&ic->reboot_notifier));
=20
-	del_timer_sync(&ic->autocommit_timer);
+	timer_delete_sync(&ic->autocommit_timer);
=20
 	if (ic->recalc_wq)
 		drain_workqueue(ic->recalc_wq);
diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index 637977acc3dc..6c98f4ae5ea9 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -815,7 +815,7 @@ static void enable_nopath_timeout(struct multipath *m)
=20
 static void disable_nopath_timeout(struct multipath *m)
 {
-	del_timer_sync(&m->nopath_timer);
+	timer_delete_sync(&m->nopath_timer);
 }
=20
 /*
diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
index 8c6f1f7e6456..9e615b4f1f5e 100644
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@ -1182,7 +1182,7 @@ static void mirror_dtr(struct dm_target *ti)
 {
 	struct mirror_set *ms =3D ti->private;
=20
-	del_timer_sync(&ms->timer);
+	timer_delete_sync(&ms->timer);
 	flush_workqueue(ms->kmirrord_wq);
 	flush_work(&ms->trigger_event);
 	dm_kcopyd_client_destroy(ms->kcopyd_client);
diff --git a/drivers/md/dm-vdo/dedupe.c b/drivers/md/dm-vdo/dedupe.c
index 5c49d49e023c..3c58b941e067 100644
--- a/drivers/md/dm-vdo/dedupe.c
+++ b/drivers/md/dm-vdo/dedupe.c
@@ -2261,7 +2261,7 @@ static void check_for_drain_complete(struct hash_zone *=
zone)
 	if ((atomic_read(&zone->timer_state) =3D=3D DEDUPE_QUERY_TIMER_IDLE) ||
 	    change_timer_state(zone, DEDUPE_QUERY_TIMER_RUNNING,
 			       DEDUPE_QUERY_TIMER_IDLE)) {
-		del_timer_sync(&zone->timer);
+		timer_delete_sync(&zone->timer);
 	} else {
 		/*
 		 * There is an in flight time-out, which must get processed before we can =
continue.
diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 7ce8847b3404..d6a04a57472d 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -797,7 +797,7 @@ static void writecache_flush(struct dm_writecache *wc)
 	bool need_flush_after_free;
=20
 	wc->uncommitted_blocks =3D 0;
-	del_timer(&wc->autocommit_timer);
+	timer_delete(&wc->autocommit_timer);
=20
 	if (list_empty(&wc->lru))
 		return;
@@ -927,8 +927,8 @@ static void writecache_suspend(struct dm_target *ti)
 	struct dm_writecache *wc =3D ti->private;
 	bool flush_on_suspend;
=20
-	del_timer_sync(&wc->autocommit_timer);
-	del_timer_sync(&wc->max_age_timer);
+	timer_delete_sync(&wc->autocommit_timer);
+	timer_delete_sync(&wc->max_age_timer);
=20
 	wc_lock(wc);
 	writecache_flush(wc);
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 438e71e45c16..9daa78c5fe33 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -4064,7 +4064,7 @@ level_store(struct mddev *mddev, const char *buf, size_=
t len)
 		 * it must always be in_sync
 		 */
 		mddev->in_sync =3D 1;
-		del_timer_sync(&mddev->safemode_timer);
+		timer_delete_sync(&mddev->safemode_timer);
 	}
 	pers->run(mddev);
 	set_bit(MD_SB_CHANGE_DEVS, &mddev->sb_flags);
@@ -6405,7 +6405,7 @@ static void md_clean(struct mddev *mddev)
=20
 static void __md_stop_writes(struct mddev *mddev)
 {
-	del_timer_sync(&mddev->safemode_timer);
+	timer_delete_sync(&mddev->safemode_timer);
=20
 	if (mddev->pers && mddev->pers->quiesce) {
 		mddev->pers->quiesce(mddev, 1);
diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/comm=
on/saa7146/saa7146_fops.c
index a7047e548245..2952678cce45 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -147,7 +147,7 @@ void saa7146_buffer_next(struct saa7146_dev *dev,
 			printk("vdma%d.num_line_byte: 0x%08x\n", 1,saa7146_read(dev,NUM_LINE_BYTE=
1));
 */
 		}
-		del_timer(&q->timeout);
+		timer_delete(&q->timeout);
 	}
 }
=20
diff --git a/drivers/media/common/saa7146/saa7146_vbi.c b/drivers/media/commo=
n/saa7146/saa7146_vbi.c
index a1854b3dd004..6c324a683be9 100644
--- a/drivers/media/common/saa7146/saa7146_vbi.c
+++ b/drivers/media/common/saa7146/saa7146_vbi.c
@@ -322,8 +322,8 @@ static void vbi_stop(struct saa7146_dev *dev)
 	/* shut down dma 3 transfers */
 	saa7146_write(dev, MC1, MASK_20);
=20
-	del_timer(&vv->vbi_dmaq.timeout);
-	del_timer(&vv->vbi_read_timeout);
+	timer_delete(&vv->vbi_dmaq.timeout);
+	timer_delete(&vv->vbi_read_timeout);
=20
 	spin_unlock_irqrestore(&dev->slock, flags);
 }
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/com=
mon/saa7146/saa7146_video.c
index 94e1cd4eaedb..733e18001d0d 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -668,7 +668,7 @@ static void stop_streaming(struct vb2_queue *q)
 	struct saa7146_dev *dev =3D vb2_get_drv_priv(q);
 	struct saa7146_dmaqueue *dq =3D &dev->vv_data->video_dmaq;
=20
-	del_timer(&dq->timeout);
+	timer_delete(&dq->timeout);
 	video_end(dev);
 	return_buffers(q, VB2_BUF_STATE_ERROR);
 }
diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 6063782e937a..1e985f943944 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -365,7 +365,7 @@ static void dvb_dmxdev_filter_timer(struct dmxdev_filter =
*dmxdevfilter)
 {
 	struct dmx_sct_filter_params *para =3D &dmxdevfilter->params.sec;
=20
-	del_timer(&dmxdevfilter->timer);
+	timer_delete(&dmxdevfilter->timer);
 	if (para->timeout) {
 		dmxdevfilter->timer.expires =3D
 		    jiffies + 1 + (HZ / 2 + HZ * para->timeout) / 1000;
@@ -391,7 +391,7 @@ static int dvb_dmxdev_section_callback(const u8 *buffer1,=
 size_t buffer1_len,
 		spin_unlock(&dmxdevfilter->dev->lock);
 		return 0;
 	}
-	del_timer(&dmxdevfilter->timer);
+	timer_delete(&dmxdevfilter->timer);
 	dprintk("section callback %*ph\n", 6, buffer1);
 	if (dvb_vb2_is_streaming(&dmxdevfilter->vb2_ctx)) {
 		ret =3D dvb_vb2_fill_buffer(&dmxdevfilter->vb2_ctx,
@@ -482,7 +482,7 @@ static int dvb_dmxdev_feed_stop(struct dmxdev_filter *dmx=
devfilter)
=20
 	switch (dmxdevfilter->type) {
 	case DMXDEV_TYPE_SEC:
-		del_timer(&dmxdevfilter->timer);
+		timer_delete(&dmxdevfilter->timer);
 		dmxdevfilter->feed.sec->stop_filtering(dmxdevfilter->feed.sec);
 		break;
 	case DMXDEV_TYPE_PES:
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index c50d4e85dfd1..2d5f42f11158 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -2201,7 +2201,7 @@ static int tc358743_probe(struct i2c_client *client)
 err_work_queues:
 	cec_unregister_adapter(state->cec_adap);
 	if (!state->i2c_client->irq) {
-		del_timer(&state->timer);
+		timer_delete(&state->timer);
 		flush_work(&state->work_i2c_poll);
 	}
 	cancel_delayed_work(&state->delayed_work_enable_hotplug);
@@ -2218,7 +2218,7 @@ static void tc358743_remove(struct i2c_client *client)
 	struct tc358743_state *state =3D to_state(sd);
=20
 	if (!state->i2c_client->irq) {
-		del_timer_sync(&state->timer);
+		timer_delete_sync(&state->timer);
 		flush_work(&state->work_i2c_poll);
 	}
 	cancel_delayed_work_sync(&state->delayed_work_enable_hotplug);
diff --git a/drivers/media/i2c/tvaudio.c b/drivers/media/i2c/tvaudio.c
index 654725dfafac..42115118a0bd 100644
--- a/drivers/media/i2c/tvaudio.c
+++ b/drivers/media/i2c/tvaudio.c
@@ -1787,7 +1787,7 @@ static int tvaudio_s_radio(struct v4l2_subdev *sd)
 	struct CHIPSTATE *chip =3D to_state(sd);
=20
 	chip->radio =3D 1;
-	/* del_timer(&chip->wt); */
+	/* timer_delete(&chip->wt); */
 	return 0;
 }
=20
@@ -2071,7 +2071,7 @@ static void tvaudio_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
 	struct CHIPSTATE *chip =3D to_state(sd);
=20
-	del_timer_sync(&chip->wt);
+	timer_delete_sync(&chip->wt);
 	if (chip->thread) {
 		/* shutdown async thread */
 		kthread_stop(chip->thread);
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/=
bttv-driver.c
index 2782832f5eb8..377a7e7f0499 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -3491,7 +3491,7 @@ static void bttv_remove(struct pci_dev *pci_dev)
=20
 	/* free resources */
 	free_irq(btv->c.pci->irq,btv);
-	del_timer_sync(&btv->timeout);
+	timer_delete_sync(&btv->timeout);
 	iounmap(btv->bt848_mmio);
 	release_mem_region(pci_resource_start(btv->c.pci,0),
 			   pci_resource_len(btv->c.pci,0));
diff --git a/drivers/media/pci/bt8xx/bttv-input.c b/drivers/media/pci/bt8xx/b=
ttv-input.c
index 41226f1d0e5b..9eb7a5356b4c 100644
--- a/drivers/media/pci/bt8xx/bttv-input.c
+++ b/drivers/media/pci/bt8xx/bttv-input.c
@@ -304,12 +304,12 @@ static void bttv_ir_start(struct bttv_ir *ir)
 static void bttv_ir_stop(struct bttv *btv)
 {
 	if (btv->remote->polling)
-		del_timer_sync(&btv->remote->timer);
+		timer_delete_sync(&btv->remote->timer);
=20
 	if (btv->remote->rc5_gpio) {
 		u32 gpio;
=20
-		del_timer_sync(&btv->remote->timer);
+		timer_delete_sync(&btv->remote->timer);
=20
 		gpio =3D bttv_gpio_read(&btv->c);
 		bttv_gpio_write(&btv->c, gpio & ~(1 << 4));
diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bt=
tv-risc.c
index 241a696e374a..79581cd7bd59 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -376,7 +376,7 @@ static void bttv_set_irq_timer(struct bttv *btv)
 	if (btv->curr.frame_irq || btv->loop_irq || btv->cvbi)
 		mod_timer(&btv->timeout, jiffies + BTTV_TIMEOUT);
 	else
-		del_timer(&btv->timeout);
+		timer_delete(&btv->timeout);
 }
=20
 static int bttv_set_capture_control(struct bttv *btv, int start_capture)
diff --git a/drivers/media/pci/ivtv/ivtv-irq.c b/drivers/media/pci/ivtv/ivtv-=
irq.c
index b7aaa8b4a784..b3b670b6ef70 100644
--- a/drivers/media/pci/ivtv/ivtv-irq.c
+++ b/drivers/media/pci/ivtv/ivtv-irq.c
@@ -532,7 +532,7 @@ static void ivtv_irq_dma_read(struct ivtv *itv)
=20
 	IVTV_DEBUG_HI_IRQ("DEC DMA READ\n");
=20
-	del_timer(&itv->dma_timer);
+	timer_delete(&itv->dma_timer);
=20
 	if (!test_bit(IVTV_F_I_UDMA, &itv->i_flags) && itv->cur_dma_stream < 0)
 		return;
@@ -597,7 +597,7 @@ static void ivtv_irq_enc_dma_complete(struct ivtv *itv)
 	ivtv_api_get_data(&itv->enc_mbox, IVTV_MBOX_DMA_END, 2, data);
 	IVTV_DEBUG_HI_IRQ("ENC DMA COMPLETE %x %d (%d)\n", data[0], data[1], itv->c=
ur_dma_stream);
=20
-	del_timer(&itv->dma_timer);
+	timer_delete(&itv->dma_timer);
=20
 	if (itv->cur_dma_stream < 0)
 		return;
@@ -670,7 +670,7 @@ static void ivtv_irq_dma_err(struct ivtv *itv)
 	u32 data[CX2341X_MBOX_MAX_DATA];
 	u32 status;
=20
-	del_timer(&itv->dma_timer);
+	timer_delete(&itv->dma_timer);
=20
 	ivtv_api_get_data(&itv->enc_mbox, IVTV_MBOX_DMA_END, 2, data);
 	status =3D read_reg(IVTV_REG_DMASTATUS);
diff --git a/drivers/media/pci/ivtv/ivtv-streams.c b/drivers/media/pci/ivtv/i=
vtv-streams.c
index af9e6235c74d..ac085925d3cb 100644
--- a/drivers/media/pci/ivtv/ivtv-streams.c
+++ b/drivers/media/pci/ivtv/ivtv-streams.c
@@ -891,7 +891,7 @@ int ivtv_stop_v4l2_encode_stream(struct ivtv_stream *s, i=
nt gop_end)
=20
 	/* Set the following Interrupt mask bits for capture */
 	ivtv_set_irq_mask(itv, IVTV_IRQ_MASK_CAPTURE);
-	del_timer(&itv->dma_timer);
+	timer_delete(&itv->dma_timer);
=20
 	/* event notification (off) */
 	if (test_and_clear_bit(IVTV_F_I_DIG_RST, &itv->i_flags)) {
@@ -956,7 +956,7 @@ int ivtv_stop_v4l2_decode_stream(struct ivtv_stream *s, i=
nt flags, u64 pts)
 	ivtv_vapi(itv, CX2341X_DEC_SET_EVENT_NOTIFICATION, 4, 0, 0, IVTV_IRQ_DEC_AU=
D_MODE_CHG, -1);
=20
 	ivtv_set_irq_mask(itv, IVTV_IRQ_MASK_DECODE);
-	del_timer(&itv->dma_timer);
+	timer_delete(&itv->dma_timer);
=20
 	clear_bit(IVTV_F_S_NEEDS_DATA, &s->s_flags);
 	clear_bit(IVTV_F_S_STREAMING, &s->s_flags);
diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/med=
ia/pci/netup_unidvb/netup_unidvb_core.c
index 557985ba25db..16338d13d9c8 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -698,7 +698,7 @@ static void netup_unidvb_dma_fini(struct netup_unidvb_dev=
 *ndev, int num)
 	netup_unidvb_dma_enable(dma, 0);
 	msleep(50);
 	cancel_work_sync(&dma->work);
-	del_timer_sync(&dma->timeout);
+	timer_delete_sync(&dma->timeout);
 }
=20
 static int netup_unidvb_dma_setup(struct netup_unidvb_dev *ndev)
diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa=
7134/saa7134-core.c
index ea0585e43abb..84295bdb8ce4 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -322,7 +322,7 @@ void saa7134_buffer_next(struct saa7134_dev *dev,
 		/* nothing to do -- just stop DMA */
 		core_dbg("buffer_next %p\n", NULL);
 		saa7134_set_dmabits(dev);
-		del_timer(&q->timeout);
+		timer_delete(&q->timeout);
 	}
 }
=20
@@ -364,7 +364,7 @@ void saa7134_stop_streaming(struct saa7134_dev *dev, stru=
ct saa7134_dmaqueue *q)
 		tmp =3D NULL;
 	}
 	spin_unlock_irqrestore(&dev->slock, flags);
-	saa7134_buffer_timeout(&q->timeout); /* also calls del_timer(&q->timeout) */
+	saa7134_buffer_timeout(&q->timeout); /* also calls timer_delete(&q->timeout=
) */
 }
 EXPORT_SYMBOL_GPL(saa7134_stop_streaming);
=20
@@ -1390,9 +1390,9 @@ static int __maybe_unused saa7134_suspend(struct device=
 *dev_d)
 	/* Disable timeout timers - if we have active buffers, we will
 	   fill them on resume*/
=20
-	del_timer(&dev->video_q.timeout);
-	del_timer(&dev->vbi_q.timeout);
-	del_timer(&dev->ts_q.timeout);
+	timer_delete(&dev->video_q.timeout);
+	timer_delete(&dev->vbi_q.timeout);
+	timer_delete(&dev->ts_q.timeout);
=20
 	if (dev->remote && dev->remote->dev->users)
 		saa7134_ir_close(dev->remote->dev);
diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/sa=
a7134/saa7134-input.c
index 8610eb473b39..d7d97c7d4a2b 100644
--- a/drivers/media/pci/saa7134/saa7134-input.c
+++ b/drivers/media/pci/saa7134/saa7134-input.c
@@ -496,7 +496,7 @@ void saa7134_ir_close(struct rc_dev *rc)
 	struct saa7134_card_ir *ir =3D dev->remote;
=20
 	if (ir->polling)
-		del_timer_sync(&ir->timer);
+		timer_delete_sync(&ir->timer);
=20
 	ir->running =3D false;
 }
diff --git a/drivers/media/pci/saa7134/saa7134-ts.c b/drivers/media/pci/saa71=
34/saa7134-ts.c
index ec699ea14799..1b44033067c5 100644
--- a/drivers/media/pci/saa7134/saa7134-ts.c
+++ b/drivers/media/pci/saa7134/saa7134-ts.c
@@ -298,7 +298,7 @@ int saa7134_ts_start(struct saa7134_dev *dev)
=20
 int saa7134_ts_fini(struct saa7134_dev *dev)
 {
-	del_timer_sync(&dev->ts_q.timeout);
+	timer_delete_sync(&dev->ts_q.timeout);
 	saa7134_pgtable_free(dev->pci, &dev->ts_q.pt);
 	return 0;
 }
diff --git a/drivers/media/pci/saa7134/saa7134-vbi.c b/drivers/media/pci/saa7=
134/saa7134-vbi.c
index efa6e4fa423a..28bf77449bdb 100644
--- a/drivers/media/pci/saa7134/saa7134-vbi.c
+++ b/drivers/media/pci/saa7134/saa7134-vbi.c
@@ -183,7 +183,7 @@ int saa7134_vbi_init1(struct saa7134_dev *dev)
 int saa7134_vbi_fini(struct saa7134_dev *dev)
 {
 	/* nothing */
-	del_timer_sync(&dev->vbi_q.timeout);
+	timer_delete_sync(&dev->vbi_q.timeout);
 	return 0;
 }
=20
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/sa=
a7134/saa7134-video.c
index 43e7b006eb59..c88939bce56b 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -1741,7 +1741,7 @@ int saa7134_video_init1(struct saa7134_dev *dev)
=20
 void saa7134_video_fini(struct saa7134_dev *dev)
 {
-	del_timer_sync(&dev->video_q.timeout);
+	timer_delete_sync(&dev->video_q.timeout);
 	/* free stuff */
 	saa7134_pgtable_free(dev->pci, &dev->video_q.pt);
 	saa7134_pgtable_free(dev->pci, &dev->vbi_q.pt);
diff --git a/drivers/media/pci/tw686x/tw686x-core.c b/drivers/media/pci/tw686=
x/tw686x-core.c
index c53099c958ca..80bd268926cc 100644
--- a/drivers/media/pci/tw686x/tw686x-core.c
+++ b/drivers/media/pci/tw686x/tw686x-core.c
@@ -373,7 +373,7 @@ static void tw686x_remove(struct pci_dev *pci_dev)
=20
 	tw686x_video_free(dev);
 	tw686x_audio_free(dev);
-	del_timer_sync(&dev->dma_delay_timer);
+	timer_delete_sync(&dev->dma_delay_timer);
=20
 	pci_iounmap(pci_dev, dev->mmio);
 	pci_release_regions(pci_dev);
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media=
/platform/samsung/s5p-mfc/s5p_mfc.c
index 5f80931f056d..c8e0ee383af3 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -935,7 +935,7 @@ static int s5p_mfc_open(struct file *file)
 	if (dev->num_inst =3D=3D 1) {
 		if (s5p_mfc_power_off(dev) < 0)
 			mfc_err("power off failed\n");
-		del_timer_sync(&dev->watchdog_timer);
+		timer_delete_sync(&dev->watchdog_timer);
 	}
 err_ctrls_setup:
 	s5p_mfc_dec_ctrls_delete(ctx);
@@ -985,7 +985,7 @@ static int s5p_mfc_release(struct file *file)
 		if (dev->num_inst =3D=3D 0) {
 			mfc_debug(2, "Last instance\n");
 			s5p_mfc_deinit_hw(dev);
-			del_timer_sync(&dev->watchdog_timer);
+			timer_delete_sync(&dev->watchdog_timer);
 			s5p_mfc_clock_off(dev);
 			if (s5p_mfc_power_off(dev) < 0)
 				mfc_err("Power off failed\n");
@@ -1461,7 +1461,7 @@ static void s5p_mfc_remove(struct platform_device *pdev)
 	}
 	mutex_unlock(&dev->mfc_mutex);
=20
-	del_timer_sync(&dev->watchdog_timer);
+	timer_delete_sync(&dev->watchdog_timer);
 	flush_work(&dev->watchdog_work);
=20
 	video_unregister_device(dev->vfd_enc);
diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drive=
rs/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index d151d2ed1f64..87a817dda4a9 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -351,7 +351,7 @@ static int c8sectpfe_stop_feed(struct dvb_demux_feed *dvb=
dmxfeed)
 		dev_dbg(fei->dev, "%s:%d global_feed_count=3D%d\n"
 			, __func__, __LINE__, fei->global_feed_count);
=20
-		del_timer(&fei->timer);
+		timer_delete(&fei->timer);
 	}
=20
 	mutex_unlock(&fei->lock);
diff --git a/drivers/media/radio/radio-cadet.c b/drivers/media/radio/radio-ca=
det.c
index a5db9b4dc3de..2ddf1dfa0522 100644
--- a/drivers/media/radio/radio-cadet.c
+++ b/drivers/media/radio/radio-cadet.c
@@ -471,7 +471,7 @@ static int cadet_release(struct file *file)
=20
 	mutex_lock(&dev->lock);
 	if (v4l2_fh_is_singular_file(file) && dev->rdsstat) {
-		del_timer_sync(&dev->readtimer);
+		timer_delete_sync(&dev->readtimer);
 		dev->rdsstat =3D 0;
 	}
 	v4l2_fh_release(file);
diff --git a/drivers/media/rc/ene_ir.c b/drivers/media/rc/ene_ir.c
index 67722e2e47ff..9435cba3f4d9 100644
--- a/drivers/media/rc/ene_ir.c
+++ b/drivers/media/rc/ene_ir.c
@@ -1104,7 +1104,7 @@ static void ene_remove(struct pnp_dev *pnp_dev)
 	unsigned long flags;
=20
 	rc_unregister_device(dev->rdev);
-	del_timer_sync(&dev->tx_sim_timer);
+	timer_delete_sync(&dev->tx_sim_timer);
 	spin_lock_irqsave(&dev->hw_lock, flags);
 	ene_rx_disable(dev);
 	ene_rx_restore_hw_buffer(dev);
diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index 1464ef9c55bc..bfe86588c69b 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -223,7 +223,7 @@ static int igorplugusb_probe(struct usb_interface *intf,
 	return 0;
 fail:
 	usb_poison_urb(ir->urb);
-	del_timer(&ir->timer);
+	timer_delete(&ir->timer);
 	usb_unpoison_urb(ir->urb);
 	usb_free_urb(ir->urb);
 	rc_free_device(ir->rc);
@@ -238,7 +238,7 @@ static void igorplugusb_disconnect(struct usb_interface *=
intf)
=20
 	rc_unregister_device(ir->rc);
 	usb_poison_urb(ir->urb);
-	del_timer_sync(&ir->timer);
+	timer_delete_sync(&ir->timer);
 	usb_set_intfdata(intf, NULL);
 	usb_unpoison_urb(ir->urb);
 	usb_free_urb(ir->urb);
diff --git a/drivers/media/rc/img-ir/img-ir-hw.c b/drivers/media/rc/img-ir/im=
g-ir-hw.c
index 5da7479c1793..da89ddf771c3 100644
--- a/drivers/media/rc/img-ir/img-ir-hw.c
+++ b/drivers/media/rc/img-ir/img-ir-hw.c
@@ -556,8 +556,8 @@ static void img_ir_set_decoder(struct img_ir_priv *priv,
 	 * acquires the lock and we don't want to deadlock waiting for it.
 	 */
 	spin_unlock_irq(&priv->lock);
-	del_timer_sync(&hw->end_timer);
-	del_timer_sync(&hw->suspend_timer);
+	timer_delete_sync(&hw->end_timer);
+	timer_delete_sync(&hw->suspend_timer);
 	spin_lock_irq(&priv->lock);
=20
 	hw->stopping =3D false;
diff --git a/drivers/media/rc/img-ir/img-ir-raw.c b/drivers/media/rc/img-ir/i=
mg-ir-raw.c
index 8b0bdd9603b3..669f3309e237 100644
--- a/drivers/media/rc/img-ir/img-ir-raw.c
+++ b/drivers/media/rc/img-ir/img-ir-raw.c
@@ -147,5 +147,5 @@ void img_ir_remove_raw(struct img_ir_priv *priv)
=20
 	rc_unregister_device(rdev);
=20
-	del_timer_sync(&raw->timer);
+	timer_delete_sync(&raw->timer);
 }
diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 8f1361bcce3a..cb6f36ebe5c8 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -2534,7 +2534,7 @@ static void imon_disconnect(struct usb_interface *inter=
face)
 		ictx->dev_present_intf1 =3D false;
 		usb_kill_urb(ictx->rx_urb_intf1);
 		if (ictx->display_type =3D=3D IMON_DISPLAY_TYPE_VGA) {
-			del_timer_sync(&ictx->ttimer);
+			timer_delete_sync(&ictx->ttimer);
 			input_unregister_device(ictx->touch);
 		}
 		usb_put_dev(ictx->usbdev_intf1);
diff --git a/drivers/media/rc/ir-mce_kbd-decoder.c b/drivers/media/rc/ir-mce_=
kbd-decoder.c
index 66e8feb9a569..817030fb50c9 100644
--- a/drivers/media/rc/ir-mce_kbd-decoder.c
+++ b/drivers/media/rc/ir-mce_kbd-decoder.c
@@ -324,7 +324,7 @@ static int ir_mce_kbd_decode(struct rc_dev *dev, struct i=
r_raw_event ev)
 					msecs_to_jiffies(100);
 				mod_timer(&data->rx_timeout, jiffies + delay);
 			} else {
-				del_timer(&data->rx_timeout);
+				timer_delete(&data->rx_timeout);
 			}
 			/* Pass data to keyboard buffer parser */
 			ir_mce_kbd_process_keyboard_data(dev, scancode);
@@ -372,7 +372,7 @@ static int ir_mce_kbd_unregister(struct rc_dev *dev)
 {
 	struct mce_kbd_dec *mce_kbd =3D &dev->raw->mce_kbd;
=20
-	del_timer_sync(&mce_kbd->rx_timeout);
+	timer_delete_sync(&mce_kbd->rx_timeout);
=20
 	return 0;
 }
diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index 16e33d7eaaa2..aa4ac43c66fa 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -662,7 +662,7 @@ void ir_raw_event_unregister(struct rc_dev *dev)
 		return;
=20
 	kthread_stop(dev->raw->thread);
-	del_timer_sync(&dev->raw->edge_handle);
+	timer_delete_sync(&dev->raw->edge_handle);
=20
 	mutex_lock(&ir_raw_handler_lock);
 	list_del(&dev->raw->list);
diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index a4c539b17cf3..e46358fb8ac0 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -639,7 +639,7 @@ static void ir_do_keyup(struct rc_dev *dev, bool sync)
 		return;
=20
 	dev_dbg(&dev->dev, "keyup key 0x%04x\n", dev->last_keycode);
-	del_timer(&dev->timer_repeat);
+	timer_delete(&dev->timer_repeat);
 	input_report_key(dev->input_dev, dev->last_keycode, 0);
 	led_trigger_event(led_feedback, LED_OFF);
 	if (sync)
@@ -2021,8 +2021,8 @@ void rc_unregister_device(struct rc_dev *dev)
 	if (dev->driver_type =3D=3D RC_DRIVER_IR_RAW)
 		ir_raw_event_unregister(dev);
=20
-	del_timer_sync(&dev->timer_keyup);
-	del_timer_sync(&dev->timer_repeat);
+	timer_delete_sync(&dev->timer_keyup);
+	timer_delete_sync(&dev->timer_repeat);
=20
 	mutex_lock(&dev->lock);
 	if (dev->users && dev->close)
diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
index fc5fd3927177..992fff82b524 100644
--- a/drivers/media/rc/serial_ir.c
+++ b/drivers/media/rc/serial_ir.c
@@ -798,7 +798,7 @@ static int __init serial_ir_init_module(void)
=20
 static void __exit serial_ir_exit_module(void)
 {
-	del_timer_sync(&serial_ir.timeout_timer);
+	timer_delete_sync(&serial_ir.timeout_timer);
 	serial_ir_exit();
 }
=20
diff --git a/drivers/media/usb/au0828/au0828-dvb.c b/drivers/media/usb/au0828=
/au0828-dvb.c
index 09f9948c6f8e..3666f4452d11 100644
--- a/drivers/media/usb/au0828/au0828-dvb.c
+++ b/drivers/media/usb/au0828/au0828-dvb.c
@@ -143,7 +143,7 @@ static void urb_completion(struct urb *purb)
 		 */
 		dprintk(1, "%s cancelling bulk timeout\n", __func__);
 		dev->bulk_timeout_running =3D 0;
-		del_timer(&dev->bulk_timeout);
+		timer_delete(&dev->bulk_timeout);
 	}
=20
 	/* Feed the transport payload into the kernel demux */
@@ -168,7 +168,7 @@ static int stop_urb_transfer(struct au0828_dev *dev)
=20
 	if (dev->bulk_timeout_running =3D=3D 1) {
 		dev->bulk_timeout_running =3D 0;
-		del_timer(&dev->bulk_timeout);
+		timer_delete(&dev->bulk_timeout);
 	}
=20
 	dev->urb_streaming =3D false;
diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au08=
28/au0828-video.c
index e9cd2a335f7f..33d1fad0f7b8 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -857,7 +857,7 @@ static void au0828_stop_streaming(struct vb2_queue *vq)
 	}
=20
 	dev->vid_timeout_running =3D 0;
-	del_timer_sync(&dev->vid_timeout);
+	timer_delete_sync(&dev->vid_timeout);
=20
 	spin_lock_irqsave(&dev->slock, flags);
 	if (dev->isoc_ctl.buf !=3D NULL) {
@@ -905,7 +905,7 @@ void au0828_stop_vbi_streaming(struct vb2_queue *vq)
 	spin_unlock_irqrestore(&dev->slock, flags);
=20
 	dev->vbi_timeout_running =3D 0;
-	del_timer_sync(&dev->vbi_timeout);
+	timer_delete_sync(&dev->vbi_timeout);
 }
=20
 static const struct vb2_ops au0828_video_qops =3D {
@@ -1040,12 +1040,12 @@ static int au0828_v4l2_close(struct file *filp)
 	if (vdev->vfl_type =3D=3D VFL_TYPE_VIDEO && dev->vid_timeout_running) {
 		/* Cancel timeout thread in case they didn't call streamoff */
 		dev->vid_timeout_running =3D 0;
-		del_timer_sync(&dev->vid_timeout);
+		timer_delete_sync(&dev->vid_timeout);
 	} else if (vdev->vfl_type =3D=3D VFL_TYPE_VBI &&
 			dev->vbi_timeout_running) {
 		/* Cancel timeout thread in case they didn't call streamoff */
 		dev->vbi_timeout_running =3D 0;
-		del_timer_sync(&dev->vbi_timeout);
+		timer_delete_sync(&dev->vbi_timeout);
 	}
=20
 	if (test_bit(DEV_DISCONNECTED, &dev->dev_state))
@@ -1694,9 +1694,9 @@ void au0828_v4l2_suspend(struct au0828_dev *dev)
 	}
=20
 	if (dev->vid_timeout_running)
-		del_timer_sync(&dev->vid_timeout);
+		timer_delete_sync(&dev->vid_timeout);
 	if (dev->vbi_timeout_running)
-		del_timer_sync(&dev->vbi_timeout);
+		timer_delete_sync(&dev->vbi_timeout);
 }
=20
 void au0828_v4l2_resume(struct au0828_dev *dev)
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c b/drivers/media/usb/=
pvrusb2/pvrusb2-encoder.c
index c8102772344b..a5eabac1ec6e 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
@@ -257,7 +257,7 @@ rdData[0]);
 			ret =3D -EBUSY;
 		}
 		if (ret) {
-			del_timer_sync(&hdw->encoder_run_timer);
+			timer_delete_sync(&hdw->encoder_run_timer);
 			hdw->state_encoder_ok =3D 0;
 			pvr2_trace(PVR2_TRACE_STBITS,
 				   "State bit %s <-- %s",
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvru=
sb2/pvrusb2-hdw.c
index 29cc207194b9..9a583eeaa329 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -1527,7 +1527,7 @@ int pvr2_upload_firmware2(struct pvr2_hdw *hdw)
=20
 	/* Encoder is about to be reset so note that as far as we're
 	   concerned now, the encoder has never been run. */
-	del_timer_sync(&hdw->encoder_run_timer);
+	timer_delete_sync(&hdw->encoder_run_timer);
 	if (hdw->state_encoder_runok) {
 		hdw->state_encoder_runok =3D 0;
 		trace_stbit("state_encoder_runok",hdw->state_encoder_runok);
@@ -3724,7 +3724,7 @@ status);
 	hdw->cmd_debug_state =3D 5;
=20
 	/* Stop timer */
-	del_timer_sync(&timer.timer);
+	timer_delete_sync(&timer.timer);
=20
 	hdw->cmd_debug_state =3D 6;
 	status =3D 0;
@@ -4248,7 +4248,7 @@ static int state_eval_encoder_config(struct pvr2_hdw *h=
dw)
 		hdw->state_encoder_waitok =3D 0;
 		trace_stbit("state_encoder_waitok",hdw->state_encoder_waitok);
 		/* paranoia - solve race if timer just completed */
-		del_timer_sync(&hdw->encoder_wait_timer);
+		timer_delete_sync(&hdw->encoder_wait_timer);
 	} else {
 		if (!hdw->state_pathway_ok ||
 		    (hdw->pathway_state !=3D PVR2_PATHWAY_ANALOG) ||
@@ -4261,7 +4261,7 @@ static int state_eval_encoder_config(struct pvr2_hdw *h=
dw)
 			   anything has happened that might have disturbed
 			   the encoder.  This should be a rare case. */
 			if (timer_pending(&hdw->encoder_wait_timer)) {
-				del_timer_sync(&hdw->encoder_wait_timer);
+				timer_delete_sync(&hdw->encoder_wait_timer);
 			}
 			if (hdw->state_encoder_waitok) {
 				/* Must clear the state - therefore we did
@@ -4399,7 +4399,7 @@ static int state_eval_encoder_run(struct pvr2_hdw *hdw)
 	if (hdw->state_encoder_run) {
 		if (!state_check_disable_encoder_run(hdw)) return 0;
 		if (hdw->state_encoder_ok) {
-			del_timer_sync(&hdw->encoder_run_timer);
+			timer_delete_sync(&hdw->encoder_run_timer);
 			if (pvr2_encoder_stop(hdw) < 0) return !0;
 		}
 		hdw->state_encoder_run =3D 0;
@@ -4479,11 +4479,11 @@ static int state_eval_decoder_run(struct pvr2_hdw *hd=
w)
 		hdw->state_decoder_quiescent =3D 0;
 		hdw->state_decoder_run =3D 0;
 		/* paranoia - solve race if timer(s) just completed */
-		del_timer_sync(&hdw->quiescent_timer);
+		timer_delete_sync(&hdw->quiescent_timer);
 		/* Kill the stabilization timer, in case we're killing the
 		   encoder before the previous stabilization interval has
 		   been properly timed. */
-		del_timer_sync(&hdw->decoder_stabilization_timer);
+		timer_delete_sync(&hdw->decoder_stabilization_timer);
 		hdw->state_decoder_ready =3D 0;
 	} else {
 		if (!hdw->state_decoder_quiescent) {
@@ -4517,7 +4517,7 @@ static int state_eval_decoder_run(struct pvr2_hdw *hdw)
 		    !hdw->state_pipeline_config ||
 		    !hdw->state_encoder_config ||
 		    !hdw->state_encoder_ok) return 0;
-		del_timer_sync(&hdw->quiescent_timer);
+		timer_delete_sync(&hdw->quiescent_timer);
 		if (hdw->flag_decoder_missed) return 0;
 		if (pvr2_decoder_enable(hdw,!0) < 0) return 0;
 		hdw->state_decoder_quiescent =3D 0;
diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/=
tegra210-emc-core.c
index 2d5d8245a1d3..e63f62690571 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -583,7 +583,7 @@ static void tegra210_emc_training_start(struct tegra210_e=
mc *emc)
=20
 static void tegra210_emc_training_stop(struct tegra210_emc *emc)
 {
-	del_timer(&emc->training);
+	timer_delete(&emc->training);
 }
=20
 static unsigned int tegra210_emc_get_temperature(struct tegra210_emc *emc)
@@ -666,7 +666,7 @@ static void tegra210_emc_poll_refresh(struct timer_list *=
timer)
 static void tegra210_emc_poll_refresh_stop(struct tegra210_emc *emc)
 {
 	atomic_set(&emc->refresh_poll, 0);
-	del_timer_sync(&emc->refresh_timer);
+	timer_delete_sync(&emc->refresh_timer);
 }
=20
 static void tegra210_emc_poll_refresh_start(struct tegra210_emc *emc)
diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_bloc=
k.c
index f4398383ae06..7dc2c9987982 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1510,7 +1510,7 @@ static void msb_cache_discard(struct msb_data *msb)
 	if (msb->cache_block_lba =3D=3D MS_BLOCK_INVALID)
 		return;
=20
-	del_timer_sync(&msb->cache_flush_timer);
+	timer_delete_sync(&msb->cache_flush_timer);
=20
 	dbg_verbose("Discarding the write cache");
 	msb->cache_block_lba =3D MS_BLOCK_INVALID;
@@ -2027,7 +2027,7 @@ static void msb_stop(struct memstick_dev *card)
 	msb->io_queue_stopped =3D true;
 	spin_unlock_irqrestore(&msb->q_lock, flags);
=20
-	del_timer_sync(&msb->cache_flush_timer);
+	timer_delete_sync(&msb->cache_flush_timer);
 	flush_workqueue(msb->io_queue);
=20
 	spin_lock_irqsave(&msb->q_lock, flags);
diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x=
_ms.c
index e77eb8b0eb12..a5a9bb3f16be 100644
--- a/drivers/memstick/host/jmb38x_ms.c
+++ b/drivers/memstick/host/jmb38x_ms.c
@@ -469,7 +469,7 @@ static void jmb38x_ms_complete_cmd(struct memstick_host *=
msh, int last)
 	unsigned int t_val =3D 0;
 	int rc;
=20
-	del_timer(&host->timer);
+	timer_delete(&host->timer);
=20
 	dev_dbg(&msh->dev, "c control %08x\n",
 		readl(host->addr + HOST_CONTROL));
diff --git a/drivers/memstick/host/r592.c b/drivers/memstick/host/r592.c
index 544a31ff46e5..488ef8eecb26 100644
--- a/drivers/memstick/host/r592.c
+++ b/drivers/memstick/host/r592.c
@@ -827,7 +827,7 @@ static void r592_remove(struct pci_dev *pdev)
 	/* Stop the processing thread.
 	That ensures that we won't take any more requests */
 	kthread_stop(dev->io_thread);
-	del_timer_sync(&dev->detect_timer);
+	timer_delete_sync(&dev->detect_timer);
 	r592_enable_device(dev, false);
=20
 	while (!error && dev->req) {
@@ -854,7 +854,7 @@ static int r592_suspend(struct device *core_dev)
=20
 	r592_clear_interrupts(dev);
 	memstick_suspend_host(dev->host);
-	del_timer_sync(&dev->detect_timer);
+	timer_delete_sync(&dev->detect_timer);
 	return 0;
 }
=20
diff --git a/drivers/memstick/host/tifm_ms.c b/drivers/memstick/host/tifm_ms.c
index c272453670be..676348eee015 100644
--- a/drivers/memstick/host/tifm_ms.c
+++ b/drivers/memstick/host/tifm_ms.c
@@ -337,7 +337,7 @@ static void tifm_ms_complete_cmd(struct tifm_ms *host)
 	struct memstick_host *msh =3D tifm_get_drvdata(sock);
 	int rc;
=20
-	del_timer(&host->timer);
+	timer_delete(&host->timer);
=20
 	host->req->int_reg =3D readl(sock->addr + SOCK_MS_STATUS) & 0xff;
 	host->req->int_reg =3D (host->req->int_reg & 1)
@@ -600,7 +600,7 @@ static void tifm_ms_remove(struct tifm_dev *sock)
 	spin_lock_irqsave(&sock->lock, flags);
 	host->eject =3D 1;
 	if (host->req) {
-		del_timer(&host->timer);
+		timer_delete(&host->timer);
 		writel(TIFM_FIFO_INT_SETALL,
 		       sock->addr + SOCK_DMA_FIFO_INT_ENABLE_CLEAR);
 		writel(TIFM_DMA_RESET, sock->addr + SOCK_DMA_CONTROL);
diff --git a/drivers/misc/bcm-vk/bcm_vk_tty.c b/drivers/misc/bcm-vk/bcm_vk_tt=
y.c
index 59bab76ff0a9..44a2dd80054d 100644
--- a/drivers/misc/bcm-vk/bcm_vk_tty.c
+++ b/drivers/misc/bcm-vk/bcm_vk_tty.c
@@ -177,7 +177,7 @@ static void bcm_vk_tty_close(struct tty_struct *tty, stru=
ct file *file)
 	vk->tty[tty->index].is_opened =3D false;
=20
 	if (tty->count =3D=3D 1)
-		del_timer_sync(&vk->serial_timer);
+		timer_delete_sync(&vk->serial_timer);
 }
=20
 static void bcm_vk_tty_doorbell(struct bcm_vk *vk, u32 db_val)
@@ -304,7 +304,7 @@ void bcm_vk_tty_exit(struct bcm_vk *vk)
 {
 	int i;
=20
-	del_timer_sync(&vk->serial_timer);
+	timer_delete_sync(&vk->serial_timer);
 	for (i =3D 0; i < BCM_VK_NUM_TTY; ++i) {
 		tty_port_unregister_device(&vk->tty[i].port,
 					   vk->tty_drv,
diff --git a/drivers/misc/cardreader/rtsx_usb.c b/drivers/misc/cardreader/rts=
x_usb.c
index 77b0490a1b38..7314c8d9ae75 100644
--- a/drivers/misc/cardreader/rtsx_usb.c
+++ b/drivers/misc/cardreader/rtsx_usb.c
@@ -53,7 +53,7 @@ static int rtsx_usb_bulk_transfer_sglist(struct rtsx_ucr *u=
cr,
 	ucr->sg_timer.expires =3D jiffies + msecs_to_jiffies(timeout);
 	add_timer(&ucr->sg_timer);
 	usb_sg_wait(&ucr->current_sg);
-	if (!del_timer_sync(&ucr->sg_timer))
+	if (!timer_delete_sync(&ucr->sg_timer))
 		ret =3D -ETIMEDOUT;
 	else
 		ret =3D ucr->current_sg.status;
diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
index 7a3c34306de9..697a008c14d3 100644
--- a/drivers/misc/sgi-xp/xpc_main.c
+++ b/drivers/misc/sgi-xp/xpc_main.c
@@ -202,7 +202,7 @@ xpc_start_hb_beater(void)
 static void
 xpc_stop_hb_beater(void)
 {
-	del_timer_sync(&xpc_hb_timer);
+	timer_delete_sync(&xpc_hb_timer);
 	xpc_arch_ops.heartbeat_exit();
 }
=20
diff --git a/drivers/misc/sgi-xp/xpc_partition.c b/drivers/misc/sgi-xp/xpc_pa=
rtition.c
index 1999d02923de..d0467010558c 100644
--- a/drivers/misc/sgi-xp/xpc_partition.c
+++ b/drivers/misc/sgi-xp/xpc_partition.c
@@ -291,7 +291,7 @@ static int __xpc_partition_disengaged(struct xpc_partitio=
n *part,
=20
 		/* Cancel the timer function if not called from it */
 		if (!from_timer)
-			del_timer_sync(&part->disengage_timer);
+			timer_delete_sync(&part->disengage_timer);
=20
 		DBUG_ON(part->act_state !=3D XPC_P_AS_DEACTIVATING &&
 			part->act_state !=3D XPC_P_AS_INACTIVE);
diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index bdb22998357e..dacb5bd9bb71 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -147,13 +147,13 @@ void mmc_retune_disable(struct mmc_host *host)
 {
 	mmc_retune_unpause(host);
 	host->can_retune =3D 0;
-	del_timer_sync(&host->retune_timer);
+	timer_delete_sync(&host->retune_timer);
 	mmc_retune_clear(host);
 }
=20
 void mmc_retune_timer_stop(struct mmc_host *host)
 {
-	del_timer_sync(&host->retune_timer);
+	timer_delete_sync(&host->retune_timer);
 }
 EXPORT_SYMBOL(mmc_retune_timer_stop);
=20
diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index 24fffc702a94..14e981b834b6 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -1592,7 +1592,7 @@ static void atmci_request_end(struct atmel_mci *host, s=
truct mmc_request *mrq)
=20
 	WARN_ON(host->cmd || host->data);
=20
-	del_timer(&host->timer);
+	timer_delete(&host->timer);
=20
 	/*
 	 * Update the MMC clock rate if necessary. This may be
@@ -2357,7 +2357,7 @@ static void atmci_cleanup_slot(struct atmel_mci_slot *s=
lot,
=20
 	if (slot->detect_pin) {
 		free_irq(gpiod_to_irq(slot->detect_pin), slot);
-		del_timer_sync(&slot->detect_timer);
+		timer_delete_sync(&slot->detect_timer);
 	}
=20
 	slot->host->slot[id] =3D NULL;
@@ -2585,7 +2585,7 @@ static int atmci_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
=20
-	del_timer_sync(&host->timer);
+	timer_delete_sync(&host->timer);
 	if (!IS_ERR(host->dma.chan))
 		dma_release_channel(host->dma.chan);
 err_dma_probe_defer:
@@ -2613,7 +2613,7 @@ static void atmci_remove(struct platform_device *pdev)
 	atmci_writel(host, ATMCI_CR, ATMCI_CR_MCIDIS);
 	atmci_readl(host, ATMCI_SR);
=20
-	del_timer_sync(&host->timer);
+	timer_delete_sync(&host->timer);
 	if (!IS_ERR(host->dma.chan))
 		dma_release_channel(host->dma.chan);
=20
diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index bb596d169420..578290015e5b 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -2040,10 +2040,10 @@ static bool dw_mci_clear_pending_cmd_complete(struct =
dw_mci *host)
 	 * Really be certain that the timer has stopped.  This is a bit of
 	 * paranoia and could only really happen if we had really bad
 	 * interrupt latency and the interrupt routine and timeout were
-	 * running concurrently so that the del_timer() in the interrupt
+	 * running concurrently so that the timer_delete() in the interrupt
 	 * handler couldn't run.
 	 */
-	WARN_ON(del_timer_sync(&host->cto_timer));
+	WARN_ON(timer_delete_sync(&host->cto_timer));
 	clear_bit(EVENT_CMD_COMPLETE, &host->pending_events);
=20
 	return true;
@@ -2055,7 +2055,7 @@ static bool dw_mci_clear_pending_data_complete(struct d=
w_mci *host)
 		return false;
=20
 	/* Extra paranoia just like dw_mci_clear_pending_cmd_complete() */
-	WARN_ON(del_timer_sync(&host->dto_timer));
+	WARN_ON(timer_delete_sync(&host->dto_timer));
 	clear_bit(EVENT_DATA_COMPLETE, &host->pending_events);
=20
 	return true;
@@ -2788,7 +2788,7 @@ static void dw_mci_write_data_pio(struct dw_mci *host)
=20
 static void dw_mci_cmd_interrupt(struct dw_mci *host, u32 status)
 {
-	del_timer(&host->cto_timer);
+	timer_delete(&host->cto_timer);
=20
 	if (!host->cmd_status)
 		host->cmd_status =3D status;
@@ -2832,13 +2832,13 @@ static irqreturn_t dw_mci_interrupt(int irq, void *de=
v_id)
 			dw_mci_cmd_interrupt(host, pending);
 			spin_unlock(&host->irq_lock);
=20
-			del_timer(&host->cmd11_timer);
+			timer_delete(&host->cmd11_timer);
 		}
=20
 		if (pending & DW_MCI_CMD_ERROR_FLAGS) {
 			spin_lock(&host->irq_lock);
=20
-			del_timer(&host->cto_timer);
+			timer_delete(&host->cto_timer);
 			mci_writel(host, RINTSTS, DW_MCI_CMD_ERROR_FLAGS);
 			host->cmd_status =3D pending;
 			smp_wmb(); /* drain writebuffer */
@@ -2851,7 +2851,7 @@ static irqreturn_t dw_mci_interrupt(int irq, void *dev_=
id)
 			spin_lock(&host->irq_lock);
=20
 			if (host->quirks & DW_MMC_QUIRK_EXTENDED_TMOUT)
-				del_timer(&host->dto_timer);
+				timer_delete(&host->dto_timer);
=20
 			/* if there is an error report DATA_ERROR */
 			mci_writel(host, RINTSTS, DW_MCI_DATA_ERROR_FLAGS);
@@ -2872,7 +2872,7 @@ static irqreturn_t dw_mci_interrupt(int irq, void *dev_=
id)
 		if (pending & SDMMC_INT_DATA_OVER) {
 			spin_lock(&host->irq_lock);
=20
-			del_timer(&host->dto_timer);
+			timer_delete(&host->dto_timer);
=20
 			mci_writel(host, RINTSTS, SDMMC_INT_DATA_OVER);
 			if (!host->data_status)
diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index 596012d5afac..bd1662e275d4 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -862,7 +862,7 @@ static irqreturn_t jz_mmc_irq(int irq, void *devid)
=20
 	if (host->req && cmd && irq_reg) {
 		if (test_and_clear_bit(0, &host->waiting)) {
-			del_timer(&host->timeout_timer);
+			timer_delete(&host->timeout_timer);
=20
 			if (status & JZ_MMC_STATUS_TIMEOUT_RES) {
 				cmd->error =3D -ETIMEDOUT;
@@ -1162,7 +1162,7 @@ static void jz4740_mmc_remove(struct platform_device *p=
dev)
 {
 	struct jz4740_mmc_host *host =3D platform_get_drvdata(pdev);
=20
-	del_timer_sync(&host->timeout_timer);
+	timer_delete_sync(&host->timeout_timer);
 	jz4740_mmc_set_irq_enabled(host, 0xff, false);
 	jz4740_mmc_reset(host);
=20
diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdi=
o.c
index ad351805eed4..e0ae5a0c9670 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -446,7 +446,7 @@ static irqreturn_t meson_mx_mmc_irq_thread(int irq, void =
*irq_data)
 	if (WARN_ON(!cmd))
 		return IRQ_HANDLED;
=20
-	del_timer_sync(&host->cmd_timeout);
+	timer_delete_sync(&host->cmd_timeout);
=20
 	if (cmd->data) {
 		dma_unmap_sg(mmc_dev(host->mmc), cmd->data->sg,
@@ -733,7 +733,7 @@ static void meson_mx_mmc_remove(struct platform_device *p=
dev)
 	struct meson_mx_mmc_host *host =3D platform_get_drvdata(pdev);
 	struct device *slot_dev =3D mmc_dev(host->mmc);
=20
-	del_timer_sync(&host->cmd_timeout);
+	timer_delete_sync(&host->cmd_timeout);
=20
 	mmc_remove_host(host->mmc);
=20
diff --git a/drivers/mmc/host/mvsdio.c b/drivers/mmc/host/mvsdio.c
index b92f3ba38663..912ffacbad88 100644
--- a/drivers/mmc/host/mvsdio.c
+++ b/drivers/mmc/host/mvsdio.c
@@ -464,7 +464,7 @@ static irqreturn_t mvsd_irq(int irq, void *dev)
 		struct mmc_command *cmd =3D mrq->cmd;
 		u32 err_status =3D 0;
=20
-		del_timer(&host->timer);
+		timer_delete(&host->timer);
 		host->mrq =3D NULL;
=20
 		host->intr_en &=3D MVSD_NOR_CARD_INT;
@@ -803,7 +803,7 @@ static void mvsd_remove(struct platform_device *pdev)
 	struct mvsd_host *host =3D mmc_priv(mmc);
=20
 	mmc_remove_host(mmc);
-	del_timer_sync(&host->timer);
+	timer_delete_sync(&host->timer);
 	mvsd_power_down(host);
=20
 	if (!IS_ERR(host->clk))
diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index 0a9affd12532..95d8d40a06a8 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -352,7 +352,7 @@ static void mxcmci_dma_callback(void *data)
 	struct mxcmci_host *host =3D data;
 	u32 stat;
=20
-	del_timer(&host->watchdog);
+	timer_delete(&host->watchdog);
=20
 	stat =3D mxcmci_readl(host, MMC_REG_STATUS);
=20
@@ -737,7 +737,7 @@ static irqreturn_t mxcmci_irq(int irq, void *devid)
 		mxcmci_cmd_done(host, stat);
=20
 	if (mxcmci_use_dma(host) && (stat & STATUS_WRITE_OP_DONE)) {
-		del_timer(&host->watchdog);
+		timer_delete(&host->watchdog);
 		mxcmci_data_done(host, stat);
 	}
=20
diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 3cdb2fc44965..c50617d03709 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -214,7 +214,7 @@ static void mmc_omap_select_slot(struct mmc_omap_slot *sl=
ot, int claimed)
 	host->mmc =3D slot->mmc;
 	spin_unlock_irqrestore(&host->slot_lock, flags);
 no_claim:
-	del_timer(&host->clk_timer);
+	timer_delete(&host->clk_timer);
 	if (host->current_slot !=3D slot || !claimed)
 		mmc_omap_fclk_offdelay(host->current_slot);
=20
@@ -273,7 +273,7 @@ static void mmc_omap_release_slot(struct mmc_omap_slot *s=
lot, int clk_enabled)
 		/* Keeps clock running for at least 8 cycles on valid freq */
 		mod_timer(&host->clk_timer, jiffies  + HZ/10);
 	else {
-		del_timer(&host->clk_timer);
+		timer_delete(&host->clk_timer);
 		mmc_omap_fclk_offdelay(slot);
 		mmc_omap_fclk_enable(host, 0);
 	}
@@ -564,7 +564,7 @@ mmc_omap_cmd_done(struct mmc_omap_host *host, struct mmc_=
command *cmd)
 {
 	host->cmd =3D NULL;
=20
-	del_timer(&host->cmd_abort_timer);
+	timer_delete(&host->cmd_abort_timer);
=20
 	if (cmd->flags & MMC_RSP_PRESENT) {
 		if (cmd->flags & MMC_RSP_136) {
@@ -836,7 +836,7 @@ static irqreturn_t mmc_omap_irq(int irq, void *dev_id)
 	}
=20
 	if (cmd_error && host->data) {
-		del_timer(&host->cmd_abort_timer);
+		timer_delete(&host->cmd_abort_timer);
 		host->abort =3D 1;
 		OMAP_MMC_WRITE(host, IE, 0);
 		disable_irq_nosync(host->irq);
@@ -1365,7 +1365,7 @@ static void mmc_omap_remove_slot(struct mmc_omap_slot *=
slot)
 		device_remove_file(&mmc->class_dev, &dev_attr_cover_switch);
=20
 	cancel_work_sync(&slot->cover_bh_work);
-	del_timer_sync(&slot->cover_timer);
+	timer_delete_sync(&slot->cover_timer);
 	flush_workqueue(slot->host->mmc_omap_wq);
=20
 	mmc_remove_host(mmc);
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 5f91b44891f9..5f78be7ae16d 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -517,9 +517,9 @@ EXPORT_SYMBOL_GPL(sdhci_mod_timer);
 static void sdhci_del_timer(struct sdhci_host *host, struct mmc_request *mrq)
 {
 	if (sdhci_data_line_cmd(mrq->cmd))
-		del_timer(&host->data_timer);
+		timer_delete(&host->data_timer);
 	else
-		del_timer(&host->timer);
+		timer_delete(&host->timer);
 }
=20
 static inline bool sdhci_has_requests(struct sdhci_host *host)
@@ -4976,8 +4976,8 @@ void sdhci_remove_host(struct sdhci_host *host, int dea=
d)
 	sdhci_writel(host, 0, SDHCI_SIGNAL_ENABLE);
 	free_irq(host->irq, host);
=20
-	del_timer_sync(&host->timer);
-	del_timer_sync(&host->data_timer);
+	timer_delete_sync(&host->timer);
+	timer_delete_sync(&host->data_timer);
=20
 	destroy_workqueue(host->complete_wq);
=20
diff --git a/drivers/mmc/host/tifm_sd.c b/drivers/mmc/host/tifm_sd.c
index aea14bf3e2e8..713223f2d377 100644
--- a/drivers/mmc/host/tifm_sd.c
+++ b/drivers/mmc/host/tifm_sd.c
@@ -735,7 +735,7 @@ static void tifm_sd_end_cmd(struct work_struct *t)
=20
 	spin_lock_irqsave(&sock->lock, flags);
=20
-	del_timer(&host->timer);
+	timer_delete(&host->timer);
 	mrq =3D host->req;
 	host->req =3D NULL;
=20
diff --git a/drivers/mmc/host/via-sdmmc.c b/drivers/mmc/host/via-sdmmc.c
index f77457105ec3..909d80a02824 100644
--- a/drivers/mmc/host/via-sdmmc.c
+++ b/drivers/mmc/host/via-sdmmc.c
@@ -971,7 +971,7 @@ static void via_sdc_finish_bh_work(struct work_struct *t)
=20
 	spin_lock_irqsave(&host->lock, flags);
=20
-	del_timer(&host->timer);
+	timer_delete(&host->timer);
 	mrq =3D host->mrq;
 	host->mrq =3D NULL;
 	host->cmd =3D NULL;
@@ -1202,7 +1202,7 @@ static void via_sd_remove(struct pci_dev *pcidev)
=20
 	free_irq(pcidev->irq, sdhost);
=20
-	del_timer_sync(&sdhost->timer);
+	timer_delete_sync(&sdhost->timer);
=20
 	cancel_work_sync(&sdhost->finish_bh_work);
=20
diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index fd67c0682b38..dd71e5b8e1a5 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -1452,7 +1452,7 @@ static int __command_read_data(struct vub300_mmc_host *=
vub300,
 						  (linear_length / 16384));
 			add_timer(&vub300->sg_transfer_timer);
 			usb_sg_wait(&vub300->sg_request);
-			del_timer(&vub300->sg_transfer_timer);
+			timer_delete(&vub300->sg_transfer_timer);
 			if (vub300->sg_request.status < 0) {
 				cmd->error =3D vub300->sg_request.status;
 				data->bytes_xfered =3D 0;
@@ -1572,7 +1572,7 @@ static int __command_write_data(struct vub300_mmc_host =
*vub300,
 			if (cmd->error) {
 				data->bytes_xfered =3D 0;
 			} else {
-				del_timer(&vub300->sg_transfer_timer);
+				timer_delete(&vub300->sg_transfer_timer);
 				if (vub300->sg_request.status < 0) {
 					cmd->error =3D vub300->sg_request.status;
 					data->bytes_xfered =3D 0;
@@ -2339,7 +2339,7 @@ static int vub300_probe(struct usb_interface *interface,
=20
 	return 0;
 error6:
-	del_timer_sync(&vub300->inactivity_timer);
+	timer_delete_sync(&vub300->inactivity_timer);
 error5:
 	mmc_free_host(mmc);
 	/*
diff --git a/drivers/mmc/host/wbsd.c b/drivers/mmc/host/wbsd.c
index 8b268e8a0ec9..d5974b355a5a 100644
--- a/drivers/mmc/host/wbsd.c
+++ b/drivers/mmc/host/wbsd.c
@@ -1261,7 +1261,7 @@ static void wbsd_free_mmc(struct device *dev)
 	host =3D mmc_priv(mmc);
 	BUG_ON(host =3D=3D NULL);
=20
-	del_timer_sync(&host->ignore_timer);
+	timer_delete_sync(&host->ignore_timer);
=20
 	mmc_free_host(mmc);
 }
diff --git a/drivers/most/most_usb.c b/drivers/most/most_usb.c
index 485d5ca39951..2199ba821922 100644
--- a/drivers/most/most_usb.c
+++ b/drivers/most/most_usb.c
@@ -257,7 +257,7 @@ static int hdm_poison_channel(struct most_interface *ifac=
e, int channel)
 		mdev->padding_active[channel] =3D false;
=20
 	if (mdev->conf[channel].data_type =3D=3D MOST_CH_ASYNC) {
-		del_timer_sync(&mdev->link_stat_timer);
+		timer_delete_sync(&mdev->link_stat_timer);
 		cancel_work_sync(&mdev->poll_work_obj);
 	}
 	mutex_unlock(&mdev->io_mutex);
@@ -1115,7 +1115,7 @@ static void hdm_disconnect(struct usb_interface *interf=
ace)
 	mdev->usb_device =3D NULL;
 	mutex_unlock(&mdev->io_mutex);
=20
-	del_timer_sync(&mdev->link_stat_timer);
+	timer_delete_sync(&mdev->link_stat_timer);
 	cancel_work_sync(&mdev->poll_work_obj);
=20
 	if (mdev->dci)
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index b5b3c4c44a94..d28d4f1790f5 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -1067,7 +1067,7 @@ static int sm_write(struct mtd_blktrans_dev *dev,
 	sm_break_offset(ftl, sec_no << 9, &zone_num, &block, &boffset);
=20
 	/* No need in flush thread running now */
-	del_timer(&ftl->timer);
+	timer_delete(&ftl->timer);
 	mutex_lock(&ftl->mutex);
=20
 	zone =3D sm_get_zone(ftl, zone_num);
@@ -1111,7 +1111,7 @@ static void sm_release(struct mtd_blktrans_dev *dev)
 {
 	struct sm_ftl *ftl =3D dev->priv;
=20
-	del_timer_sync(&ftl->timer);
+	timer_delete_sync(&ftl->timer);
 	cancel_work_sync(&ftl->flush_work);
 	mutex_lock(&ftl->mutex);
 	sm_cache_flush(ftl);
diff --git a/drivers/net/arcnet/arcnet.c b/drivers/net/arcnet/arcnet.c
index 530c15d6a5eb..602e6e1adf00 100644
--- a/drivers/net/arcnet/arcnet.c
+++ b/drivers/net/arcnet/arcnet.c
@@ -616,7 +616,7 @@ int arcnet_close(struct net_device *dev)
 	struct arcnet_local *lp =3D netdev_priv(dev);
=20
 	arcnet_led_event(dev, ARCNET_LED_EVENT_STOP);
-	del_timer_sync(&lp->timer);
+	timer_delete_sync(&lp->timer);
=20
 	netif_stop_queue(dev);
 	netif_carrier_off(dev);
diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
index 21a61b86f67d..adf3970f070f 100644
--- a/drivers/net/can/grcan.c
+++ b/drivers/net/can/grcan.c
@@ -778,7 +778,7 @@ static irqreturn_t grcan_interrupt(int irq, void *dev_id)
 	 */
 	if (priv->need_txbug_workaround &&
 	    (sources & (GRCAN_IRQ_TX | GRCAN_IRQ_TXLOSS))) {
-		del_timer(&priv->hang_timer);
+		timer_delete(&priv->hang_timer);
 	}
=20
 	/* Frame(s) received or transmitted */
@@ -817,8 +817,8 @@ static void grcan_running_reset(struct timer_list *t)
 	spin_lock_irqsave(&priv->lock, flags);
=20
 	priv->resetting =3D false;
-	del_timer(&priv->hang_timer);
-	del_timer(&priv->rr_timer);
+	timer_delete(&priv->hang_timer);
+	timer_delete(&priv->rr_timer);
=20
 	if (!priv->closing) {
 		/* Save and reset - config register preserved by grcan_reset */
@@ -1108,8 +1108,8 @@ static int grcan_close(struct net_device *dev)
 	priv->closing =3D true;
 	if (priv->need_txbug_workaround) {
 		spin_unlock_irqrestore(&priv->lock, flags);
-		del_timer_sync(&priv->hang_timer);
-		del_timer_sync(&priv->rr_timer);
+		timer_delete_sync(&priv->hang_timer);
+		timer_delete_sync(&priv->rr_timer);
 		spin_lock_irqsave(&priv->lock, flags);
 	}
 	netif_stop_queue(dev);
@@ -1147,7 +1147,7 @@ static void grcan_transmit_catch_up(struct net_device *=
dev)
 		 * so prevent a running reset while catching up
 		 */
 		if (priv->need_txbug_workaround)
-			del_timer(&priv->hang_timer);
+			timer_delete(&priv->hang_timer);
 	}
=20
 	spin_unlock_irqrestore(&priv->lock, flags);
diff --git a/drivers/net/can/kvaser_pciefd.c b/drivers/net/can/kvaser_pciefd.c
index fa04a7ced02b..cf0d51805272 100644
--- a/drivers/net/can/kvaser_pciefd.c
+++ b/drivers/net/can/kvaser_pciefd.c
@@ -631,7 +631,7 @@ static int kvaser_pciefd_bus_on(struct kvaser_pciefd_can =
*can)
 	u32 mode;
 	unsigned long irq;
=20
-	del_timer(&can->bec_poll_timer);
+	timer_delete(&can->bec_poll_timer);
 	if (!completion_done(&can->flush_comp))
 		kvaser_pciefd_start_controller_flush(can);
=20
@@ -742,7 +742,7 @@ static int kvaser_pciefd_stop(struct net_device *netdev)
 		ret =3D -ETIMEDOUT;
 	} else {
 		iowrite32(0, can->reg_base + KVASER_PCIEFD_KCAN_IEN_REG);
-		del_timer(&can->bec_poll_timer);
+		timer_delete(&can->bec_poll_timer);
 	}
 	can->can.state =3D CAN_STATE_STOPPED;
 	close_candev(netdev);
@@ -1854,7 +1854,7 @@ static void kvaser_pciefd_remove_all_ctrls(struct kvase=
r_pciefd *pcie)
 		if (can) {
 			iowrite32(0, can->reg_base + KVASER_PCIEFD_KCAN_IEN_REG);
 			unregister_candev(can->can.dev);
-			del_timer(&can->bec_poll_timer);
+			timer_delete(&can->bec_poll_timer);
 			kvaser_pciefd_pwm_stop(can);
 			free_candev(can->can.dev);
 		}
diff --git a/drivers/net/can/sja1000/peak_pcmcia.c b/drivers/net/can/sja1000/=
peak_pcmcia.c
index ebd5941c3f53..6c7b1c58f85f 100644
--- a/drivers/net/can/sja1000/peak_pcmcia.c
+++ b/drivers/net/can/sja1000/peak_pcmcia.c
@@ -167,7 +167,7 @@ static void pcan_start_led_timer(struct pcan_pccard *card)
  */
 static void pcan_stop_led_timer(struct pcan_pccard *card)
 {
-	del_timer_sync(&card->led_timer);
+	timer_delete_sync(&card->led_timer);
 }
=20
 /*
diff --git a/drivers/net/dsa/mv88e6xxx/phy.c b/drivers/net/dsa/mv88e6xxx/phy.c
index ee9e5d7e5277..b6d249eb64e7 100644
--- a/drivers/net/dsa/mv88e6xxx/phy.c
+++ b/drivers/net/dsa/mv88e6xxx/phy.c
@@ -206,7 +206,7 @@ static int mv88e6xxx_phy_ppu_access_get(struct mv88e6xxx_=
chip *chip)
 		}
 		chip->ppu_disabled =3D 1;
 	} else {
-		del_timer(&chip->ppu_timer);
+		timer_delete(&chip->ppu_timer);
 		ret =3D 0;
 	}
=20
@@ -230,7 +230,7 @@ static void mv88e6xxx_phy_ppu_state_init(struct mv88e6xxx=
_chip *chip)
 static void mv88e6xxx_phy_ppu_state_destroy(struct mv88e6xxx_chip *chip)
 {
 	mutex_lock(&chip->ppu_mutex);
-	del_timer_sync(&chip->ppu_timer);
+	timer_delete_sync(&chip->ppu_timer);
 	cancel_work_sync(&chip->ppu_work);
 	mutex_unlock(&chip->ppu_mutex);
 }
diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/=
sja1105_ptp.c
index 08b45fdd1d24..198e787e8560 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.c
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
@@ -842,7 +842,7 @@ static int sja1105_extts_enable(struct sja1105_private *p=
riv,
 	if (on)
 		sja1105_ptp_extts_setup_timer(&priv->ptp_data);
 	else
-		del_timer_sync(&priv->ptp_data.extts_timer);
+		timer_delete_sync(&priv->ptp_data.extts_timer);
=20
 	return 0;
 }
@@ -939,7 +939,7 @@ void sja1105_ptp_clock_unregister(struct dsa_switch *ds)
 	if (IS_ERR_OR_NULL(ptp_data->clock))
 		return;
=20
-	del_timer_sync(&ptp_data->extts_timer);
+	timer_delete_sync(&ptp_data->extts_timer);
 	ptp_cancel_worker_sync(ptp_data->clock);
 	skb_queue_purge(&ptp_data->skb_txtstamp_queue);
 	skb_queue_purge(&ptp_data->skb_rxtstamp_queue);
diff --git a/drivers/net/eql.c b/drivers/net/eql.c
index 3c2efda916f1..5889759b8d83 100644
--- a/drivers/net/eql.c
+++ b/drivers/net/eql.c
@@ -254,7 +254,7 @@ static int eql_close(struct net_device *dev)
 	 *	at the data structure it scans every so often...
 	 */
=20
-	del_timer_sync(&eql->timer);
+	timer_delete_sync(&eql->timer);
=20
 	eql_kill_slave_queue(&eql->queue);
=20
diff --git a/drivers/net/ethernet/3com/3c515.c b/drivers/net/ethernet/3com/3c=
515.c
index 4725a8cfd695..8ba2ed87fe7c 100644
--- a/drivers/net/ethernet/3com/3c515.c
+++ b/drivers/net/ethernet/3com/3c515.c
@@ -1414,7 +1414,7 @@ static int corkscrew_close(struct net_device *dev)
 			dev->name, rx_nocopy, rx_copy, queued_packet);
 	}
=20
-	del_timer_sync(&vp->timer);
+	timer_delete_sync(&vp->timer);
=20
 	/* Turn off statistics ASAP.  We update lp->stats below. */
 	outw(StatsDisable, ioaddr + EL3_CMD);
diff --git a/drivers/net/ethernet/3com/3c574_cs.c b/drivers/net/ethernet/3com=
/3c574_cs.c
index dc3b7c960611..b295d528a237 100644
--- a/drivers/net/ethernet/3com/3c574_cs.c
+++ b/drivers/net/ethernet/3com/3c574_cs.c
@@ -1140,7 +1140,7 @@ static int el3_close(struct net_device *dev)
=20
 	link->open--;
 	netif_stop_queue(dev);
-	del_timer_sync(&lp->media);
+	timer_delete_sync(&lp->media);
=20
 	return 0;
 }
diff --git a/drivers/net/ethernet/3com/3c589_cs.c b/drivers/net/ethernet/3com=
/3c589_cs.c
index be58dac0502a..ff331a3bde73 100644
--- a/drivers/net/ethernet/3com/3c589_cs.c
+++ b/drivers/net/ethernet/3com/3c589_cs.c
@@ -946,7 +946,7 @@ static int el3_close(struct net_device *dev)
=20
 	link->open--;
 	netif_stop_queue(dev);
-	del_timer_sync(&lp->media);
+	timer_delete_sync(&lp->media);
=20
 	return 0;
 }
diff --git a/drivers/net/ethernet/3com/3c59x.c b/drivers/net/ethernet/3com/3c=
59x.c
index 790270912913..1a10f5dbc4d7 100644
--- a/drivers/net/ethernet/3com/3c59x.c
+++ b/drivers/net/ethernet/3com/3c59x.c
@@ -2691,7 +2691,7 @@ vortex_down(struct net_device *dev, int final_down)
 	netdev_reset_queue(dev);
 	netif_stop_queue(dev);
=20
-	del_timer_sync(&vp->timer);
+	timer_delete_sync(&vp->timer);
=20
 	/* Turn off statistics ASAP.  We update dev->stats below. */
 	iowrite16(StatsDisable, ioaddr + EL3_CMD);
diff --git a/drivers/net/ethernet/8390/axnet_cs.c b/drivers/net/ethernet/8390=
/axnet_cs.c
index fea489af72fb..e5be5044e1d4 100644
--- a/drivers/net/ethernet/8390/axnet_cs.c
+++ b/drivers/net/ethernet/8390/axnet_cs.c
@@ -504,7 +504,7 @@ static int axnet_close(struct net_device *dev)
    =20
     link->open--;
     netif_stop_queue(dev);
-    del_timer_sync(&info->watchdog);
+    timer_delete_sync(&info->watchdog);
=20
     return 0;
 } /* axnet_close */
diff --git a/drivers/net/ethernet/8390/pcnet_cs.c b/drivers/net/ethernet/8390=
/pcnet_cs.c
index 780fb4afb6af..a326f25dda09 100644
--- a/drivers/net/ethernet/8390/pcnet_cs.c
+++ b/drivers/net/ethernet/8390/pcnet_cs.c
@@ -947,7 +947,7 @@ static int pcnet_close(struct net_device *dev)
=20
     link->open--;
     netif_stop_queue(dev);
-    del_timer_sync(&info->watchdog);
+    timer_delete_sync(&info->watchdog);
=20
     return 0;
 } /* pcnet_close */
diff --git a/drivers/net/ethernet/agere/et131x.c b/drivers/net/ethernet/agere=
/et131x.c
index b325e0cef120..b398adacda91 100644
--- a/drivers/net/ethernet/agere/et131x.c
+++ b/drivers/net/ethernet/agere/et131x.c
@@ -3639,7 +3639,7 @@ static int et131x_close(struct net_device *netdev)
 	free_irq(adapter->pdev->irq, netdev);
=20
 	/* Stop the error timer */
-	return del_timer_sync(&adapter->error_timer);
+	return timer_delete_sync(&adapter->error_timer);
 }
=20
 /* et131x_set_packet_filter - Configures the Rx Packet filtering */
diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ether=
net/amazon/ena/ena_netdev.c
index 70fa3adb4934..897720fdf5d8 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -3245,7 +3245,7 @@ static int ena_destroy_device(struct ena_adapter *adapt=
er, bool graceful)
=20
 	netif_carrier_off(netdev);
=20
-	del_timer_sync(&adapter->timer_service);
+	timer_delete_sync(&adapter->timer_service);
=20
 	dev_up =3D test_bit(ENA_FLAG_DEV_UP, &adapter->flags);
 	adapter->dev_up_before_reset =3D dev_up;
@@ -4065,7 +4065,7 @@ static int ena_probe(struct pci_dev *pdev, const struct=
 pci_device_id *ent)
 	ena_free_mgmnt_irq(adapter);
 	ena_disable_msix(adapter);
 err_worker_destroy:
-	del_timer(&adapter->timer_service);
+	timer_delete(&adapter->timer_service);
 err_device_destroy:
 	ena_com_delete_host_info(ena_dev);
 	ena_com_admin_destroy(ena_dev);
@@ -4104,7 +4104,7 @@ static void __ena_shutoff(struct pci_dev *pdev, bool sh=
utdown)
 	/* Make sure timer and reset routine won't be called after
 	 * freeing device resources.
 	 */
-	del_timer_sync(&adapter->timer_service);
+	timer_delete_sync(&adapter->timer_service);
 	cancel_work_sync(&adapter->reset_task);
=20
 	rtnl_lock(); /* lock released inside the below if-else block */
diff --git a/drivers/net/ethernet/amd/a2065.c b/drivers/net/ethernet/amd/a206=
5.c
index 1ca26a8c40eb..b923ad9e1581 100644
--- a/drivers/net/ethernet/amd/a2065.c
+++ b/drivers/net/ethernet/amd/a2065.c
@@ -486,7 +486,7 @@ static int lance_close(struct net_device *dev)
 	volatile struct lance_regs *ll =3D lp->ll;
=20
 	netif_stop_queue(dev);
-	del_timer_sync(&lp->multicast_timer);
+	timer_delete_sync(&lp->multicast_timer);
=20
 	/* Stop the card */
 	ll->rap =3D LE_CSR0;
diff --git a/drivers/net/ethernet/amd/amd8111e.c b/drivers/net/ethernet/amd/a=
md8111e.c
index f64f96fa17cf..86522e8574cb 100644
--- a/drivers/net/ethernet/amd/amd8111e.c
+++ b/drivers/net/ethernet/amd/amd8111e.c
@@ -1173,7 +1173,7 @@ static int amd8111e_close(struct net_device *dev)
=20
 	/* Delete ipg timer */
 	if (lp->options & OPTION_DYN_IPG_ENABLE)
-		del_timer_sync(&lp->ipg_data.ipg_timer);
+		timer_delete_sync(&lp->ipg_data.ipg_timer);
=20
 	spin_unlock_irq(&lp->lock);
 	free_irq(dev->irq, dev);
@@ -1598,7 +1598,7 @@ static int __maybe_unused amd8111e_suspend(struct devic=
e *dev_d)
 	/* stop chip */
 	spin_lock_irq(&lp->lock);
 	if (lp->options & OPTION_DYN_IPG_ENABLE)
-		del_timer_sync(&lp->ipg_data.ipg_timer);
+		timer_delete_sync(&lp->ipg_data.ipg_timer);
 	amd8111e_stop_chip(lp);
 	spin_unlock_irq(&lp->lock);
=20
diff --git a/drivers/net/ethernet/amd/declance.c b/drivers/net/ethernet/amd/d=
eclance.c
index ec8df05e7bf6..b072ca5930fc 100644
--- a/drivers/net/ethernet/amd/declance.c
+++ b/drivers/net/ethernet/amd/declance.c
@@ -842,7 +842,7 @@ static int lance_close(struct net_device *dev)
 	volatile struct lance_regs *ll =3D lp->ll;
=20
 	netif_stop_queue(dev);
-	del_timer_sync(&lp->multicast_timer);
+	timer_delete_sync(&lp->multicast_timer);
=20
 	/* Stop the card */
 	writereg(&ll->rap, LE_CSR0);
diff --git a/drivers/net/ethernet/amd/pcnet32.c b/drivers/net/ethernet/amd/pc=
net32.c
index c6bd803f5b0c..e5adafecc686 100644
--- a/drivers/net/ethernet/amd/pcnet32.c
+++ b/drivers/net/ethernet/amd/pcnet32.c
@@ -2630,7 +2630,7 @@ static int pcnet32_close(struct net_device *dev)
 	struct pcnet32_private *lp =3D netdev_priv(dev);
 	unsigned long flags;
=20
-	del_timer_sync(&lp->watchdog_timer);
+	timer_delete_sync(&lp->watchdog_timer);
=20
 	netif_stop_queue(dev);
 	napi_disable(&lp->napi);
diff --git a/drivers/net/ethernet/amd/sunlance.c b/drivers/net/ethernet/amd/s=
unlance.c
index 0f98b92408ed..3cd31855a5f6 100644
--- a/drivers/net/ethernet/amd/sunlance.c
+++ b/drivers/net/ethernet/amd/sunlance.c
@@ -963,7 +963,7 @@ static int lance_close(struct net_device *dev)
 	struct lance_private *lp =3D netdev_priv(dev);
=20
 	netif_stop_queue(dev);
-	del_timer_sync(&lp->multicast_timer);
+	timer_delete_sync(&lp->multicast_timer);
=20
 	STOP_LANCE(lp);
=20
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-drv.c b/drivers/net/ethernet/=
amd/xgbe/xgbe-drv.c
index 5475867708f4..d84a310dfcd4 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
@@ -728,7 +728,7 @@ static void xgbe_stop_timers(struct xgbe_prv_data *pdata)
 	struct xgbe_channel *channel;
 	unsigned int i;
=20
-	del_timer_sync(&pdata->service_timer);
+	timer_delete_sync(&pdata->service_timer);
=20
 	for (i =3D 0; i < pdata->channel_count; i++) {
 		channel =3D pdata->channel[i];
@@ -736,7 +736,7 @@ static void xgbe_stop_timers(struct xgbe_prv_data *pdata)
 			break;
=20
 		/* Deactivate the Tx timer */
-		del_timer_sync(&channel->tx_timer);
+		timer_delete_sync(&channel->tx_timer);
 		channel->tx_timer_active =3D 0;
 	}
 }
diff --git a/drivers/net/ethernet/apple/bmac.c b/drivers/net/ethernet/apple/b=
mac.c
index 785f4b4ff758..b9fdd61f1fdb 100644
--- a/drivers/net/ethernet/apple/bmac.c
+++ b/drivers/net/ethernet/apple/bmac.c
@@ -461,7 +461,7 @@ static int bmac_suspend(struct macio_dev *mdev, pm_messag=
e_t state)
 	/* prolly should wait for dma to finish & turn off the chip */
 	spin_lock_irqsave(&bp->lock, flags);
 	if (bp->timeout_active) {
-		del_timer(&bp->tx_timeout);
+		timer_delete(&bp->tx_timeout);
 		bp->timeout_active =3D 0;
 	}
 	disable_irq(dev->irq);
@@ -546,7 +546,7 @@ static inline void bmac_set_timeout(struct net_device *de=
v)
=20
 	spin_lock_irqsave(&bp->lock, flags);
 	if (bp->timeout_active)
-		del_timer(&bp->tx_timeout);
+		timer_delete(&bp->tx_timeout);
 	bp->tx_timeout.expires =3D jiffies + TX_TIMEOUT;
 	add_timer(&bp->tx_timeout);
 	bp->timeout_active =3D 1;
@@ -755,7 +755,7 @@ static irqreturn_t bmac_txdma_intr(int irq, void *dev_id)
 		XXDEBUG(("bmac_txdma_intr\n"));
 	}
=20
-	/*     del_timer(&bp->tx_timeout); */
+	/*     timer_delete(&bp->tx_timeout); */
 	/*     bp->timeout_active =3D 0; */
=20
 	while (1) {
diff --git a/drivers/net/ethernet/apple/mace.c b/drivers/net/ethernet/apple/m=
ace.c
index e6350971c707..1fed112f4e68 100644
--- a/drivers/net/ethernet/apple/mace.c
+++ b/drivers/net/ethernet/apple/mace.c
@@ -523,7 +523,7 @@ static inline void mace_set_timeout(struct net_device *de=
v)
     struct mace_data *mp =3D netdev_priv(dev);
=20
     if (mp->timeout_active)
-	del_timer(&mp->tx_timeout);
+	timer_delete(&mp->tx_timeout);
     mp->tx_timeout.expires =3D jiffies + TX_TIMEOUT;
     add_timer(&mp->tx_timeout);
     mp->timeout_active =3D 1;
@@ -676,7 +676,7 @@ static irqreturn_t mace_interrupt(int irq, void *dev_id)
=20
     i =3D mp->tx_empty;
     while (in_8(&mb->pr) & XMTSV) {
-	del_timer(&mp->tx_timeout);
+	timer_delete(&mp->tx_timeout);
 	mp->timeout_active =3D 0;
 	/*
 	 * Clear any interrupt indication associated with this status
diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c b/drivers/net/et=
hernet/aquantia/atlantic/aq_nic.c
index 71e50fc65c14..bf3aa46887a1 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
@@ -1389,13 +1389,13 @@ int aq_nic_stop(struct aq_nic_s *self)
 	netif_tx_disable(self->ndev);
 	netif_carrier_off(self->ndev);
=20
-	del_timer_sync(&self->service_timer);
+	timer_delete_sync(&self->service_timer);
 	cancel_work_sync(&self->service_task);
=20
 	self->aq_hw_ops->hw_irq_disable(self->aq_hw, AQ_CFG_IRQ_MASK);
=20
 	if (self->aq_nic_cfg.is_polling)
-		del_timer_sync(&self->polling_timer);
+		timer_delete_sync(&self->polling_timer);
 	else
 		aq_pci_func_free_irqs(self);
=20
diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/ath=
eros/ag71xx.c
index 3d4c3d8698e2..67b654889cae 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1391,7 +1391,7 @@ static void ag71xx_hw_disable(struct ag71xx *ag)
 	ag71xx_dma_reset(ag);
=20
 	napi_disable(&ag->napi);
-	del_timer_sync(&ag->oom_timer);
+	timer_delete_sync(&ag->oom_timer);
=20
 	ag71xx_rings_cleanup(ag);
 }
diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c b/drivers/net/et=
hernet/atheros/atl1c/atl1c_main.c
index c571614b1d50..82137f9deae9 100644
--- a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
+++ b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
@@ -357,7 +357,7 @@ static void atl1c_common_task(struct work_struct *work)
=20
 static void atl1c_del_timer(struct atl1c_adapter *adapter)
 {
-	del_timer_sync(&adapter->phy_config_timer);
+	timer_delete_sync(&adapter->phy_config_timer);
 }
=20
=20
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c b/drivers/net/et=
hernet/atheros/atl1e/atl1e_main.c
index 9b778b34b67e..f664a0edbc49 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
@@ -232,7 +232,7 @@ static void atl1e_link_chg_event(struct atl1e_adapter *ad=
apter)
=20
 static void atl1e_del_timer(struct atl1e_adapter *adapter)
 {
-	del_timer_sync(&adapter->phy_config_timer);
+	timer_delete_sync(&adapter->phy_config_timer);
 }
=20
 static void atl1e_cancel_work(struct atl1e_adapter *adapter)
diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/=
atheros/atlx/atl1.c
index 3afd3627ce48..38cd84b7677c 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -2641,7 +2641,7 @@ static void atl1_down(struct atl1_adapter *adapter)
=20
 	napi_disable(&adapter->napi);
 	netif_stop_queue(netdev);
-	del_timer_sync(&adapter->phy_config_timer);
+	timer_delete_sync(&adapter->phy_config_timer);
 	adapter->phy_timer_pending =3D false;
=20
 	atlx_irq_disable(adapter);
diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/=
atheros/atlx/atl2.c
index fa9a4919f25d..88f65f8cf4d3 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -752,8 +752,8 @@ static void atl2_down(struct atl2_adapter *adapter)
=20
 	atl2_irq_disable(adapter);
=20
-	del_timer_sync(&adapter->watchdog_timer);
-	del_timer_sync(&adapter->phy_config_timer);
+	timer_delete_sync(&adapter->watchdog_timer);
+	timer_delete_sync(&adapter->phy_config_timer);
 	clear_bit(0, &adapter->cfg_phy);
=20
 	netif_carrier_off(netdev);
@@ -1468,8 +1468,8 @@ static void atl2_remove(struct pci_dev *pdev)
 	 * explicitly disable watchdog tasks from being rescheduled  */
 	set_bit(__ATL2_DOWN, &adapter->flags);
=20
-	del_timer_sync(&adapter->watchdog_timer);
-	del_timer_sync(&adapter->phy_config_timer);
+	timer_delete_sync(&adapter->watchdog_timer);
+	timer_delete_sync(&adapter->phy_config_timer);
 	cancel_work_sync(&adapter->reset_task);
 	cancel_work_sync(&adapter->link_chg_task);
=20
diff --git a/drivers/net/ethernet/broadcom/b44.c b/drivers/net/ethernet/broad=
com/b44.c
index e5809ad5eb82..c91884373429 100644
--- a/drivers/net/ethernet/broadcom/b44.c
+++ b/drivers/net/ethernet/broadcom/b44.c
@@ -1628,7 +1628,7 @@ static int b44_close(struct net_device *dev)
=20
 	napi_disable(&bp->napi);
=20
-	del_timer_sync(&bp->timer);
+	timer_delete_sync(&bp->timer);
=20
 	spin_lock_irq(&bp->lock);
=20
@@ -2473,7 +2473,7 @@ static int b44_suspend(struct ssb_device *sdev, pm_mess=
age_t state)
 	if (!netif_running(dev))
 		return 0;
=20
-	del_timer_sync(&bp->timer);
+	timer_delete_sync(&bp->timer);
=20
 	spin_lock_irq(&bp->lock);
=20
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ether=
net/broadcom/bcm63xx_enet.c
index 65e3a0656a4c..19611bdd86e6 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -1195,7 +1195,7 @@ static int bcm_enet_stop(struct net_device *dev)
 	napi_disable(&priv->napi);
 	if (priv->has_phy)
 		phy_stop(dev->phydev);
-	del_timer_sync(&priv->rx_timeout);
+	timer_delete_sync(&priv->rx_timeout);
=20
 	/* mask all interrupts */
 	enet_writel(priv, 0, ENET_IRMASK_REG);
@@ -2346,10 +2346,10 @@ static int bcm_enetsw_stop(struct net_device *dev)
 	priv =3D netdev_priv(dev);
 	kdev =3D &priv->pdev->dev;
=20
-	del_timer_sync(&priv->swphy_poll);
+	timer_delete_sync(&priv->swphy_poll);
 	netif_stop_queue(dev);
 	napi_disable(&priv->napi);
-	del_timer_sync(&priv->rx_timeout);
+	timer_delete_sync(&priv->rx_timeout);
=20
 	/* mask all interrupts */
 	enet_dmac_writel(priv, 0, ENETDMAC_IRMASK, priv->rx_chan);
diff --git a/drivers/net/ethernet/broadcom/bnx2.c b/drivers/net/ethernet/broa=
dcom/bnx2.c
index 6ec773e61182..ec0c9584f3bb 100644
--- a/drivers/net/ethernet/broadcom/bnx2.c
+++ b/drivers/net/ethernet/broadcom/bnx2.c
@@ -6400,7 +6400,7 @@ bnx2_open(struct net_device *dev)
 				rc =3D bnx2_request_irq(bp);
=20
 			if (rc) {
-				del_timer_sync(&bp->timer);
+				timer_delete_sync(&bp->timer);
 				goto open_err;
 			}
 			bnx2_enable_int(bp);
@@ -6752,7 +6752,7 @@ bnx2_close(struct net_device *dev)
 	bnx2_disable_int_sync(bp);
 	bnx2_napi_disable(bp);
 	netif_tx_disable(dev);
-	del_timer_sync(&bp->timer);
+	timer_delete_sync(&bp->timer);
 	bnx2_shutdown_chip(bp);
 	bnx2_free_irq(bp);
 	bnx2_free_skbs(bp);
@@ -8602,7 +8602,7 @@ bnx2_remove_one(struct pci_dev *pdev)
=20
 	unregister_netdev(dev);
=20
-	del_timer_sync(&bp->timer);
+	timer_delete_sync(&bp->timer);
 	cancel_work_sync(&bp->reset_task);
=20
 	pci_iounmap(bp->pdev, bp->regview);
@@ -8629,7 +8629,7 @@ bnx2_suspend(struct device *device)
 		cancel_work_sync(&bp->reset_task);
 		bnx2_netif_stop(bp, true);
 		netif_device_detach(dev);
-		del_timer_sync(&bp->timer);
+		timer_delete_sync(&bp->timer);
 		bnx2_shutdown_chip(bp);
 		__bnx2_free_irq(bp);
 		bnx2_free_skbs(bp);
@@ -8687,7 +8687,7 @@ static pci_ers_result_t bnx2_io_error_detected(struct p=
ci_dev *pdev,
=20
 	if (netif_running(dev)) {
 		bnx2_netif_stop(bp, true);
-		del_timer_sync(&bp->timer);
+		timer_delete_sync(&bp->timer);
 		bnx2_reset_nic(bp, BNX2_DRV_MSG_CODE_RESET);
 	}
=20
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c b/drivers/net/et=
hernet/broadcom/bnx2x/bnx2x_cmn.c
index a8e07e51418f..e59530357e2c 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
@@ -3059,7 +3059,7 @@ int bnx2x_nic_unload(struct bnx2x *bp, int unload_mode,=
 bool keep_link)
=20
 	bp->rx_mode =3D BNX2X_RX_MODE_NONE;
=20
-	del_timer_sync(&bp->timer);
+	timer_delete_sync(&bp->timer);
=20
 	if (IS_PF(bp) && !BP_NOMCP(bp)) {
 		/* Set ALWAYS_ALIVE bit in shmem */
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/e=
thernet/broadcom/bnx2x/bnx2x_main.c
index 678829646cec..f522ca8ff66b 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -14140,7 +14140,7 @@ static int bnx2x_eeh_nic_unload(struct bnx2x *bp)
 	bnx2x_tx_disable(bp);
 	netdev_reset_tc(bp->dev);
=20
-	del_timer_sync(&bp->timer);
+	timer_delete_sync(&bp->timer);
 	cancel_delayed_work_sync(&bp->sp_task);
 	cancel_delayed_work_sync(&bp->period_task);
=20
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet=
/broadcom/bnxt/bnxt.c
index 28ee12186c37..8725e1e13908 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -12958,7 +12958,7 @@ static void __bnxt_close_nic(struct bnxt *bp, bool ir=
q_re_init,
=20
 	bnxt_debug_dev_exit(bp);
 	bnxt_disable_napi(bp);
-	del_timer_sync(&bp->timer);
+	timer_delete_sync(&bp->timer);
 	bnxt_free_skbs(bp);
=20
 	/* Save ring stats before shutdown */
diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broad=
com/tg3.c
index d9d675f1ebfe..d1f541af4e3b 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -11252,7 +11252,7 @@ static void tg3_timer_start(struct tg3 *tp)
=20
 static void tg3_timer_stop(struct tg3 *tp)
 {
-	del_timer_sync(&tp->timer);
+	timer_delete_sync(&tp->timer);
 }
=20
 /* Restart hardware after configuration changes, self-test, etc.
diff --git a/drivers/net/ethernet/brocade/bna/bfa_ioc.c b/drivers/net/etherne=
t/brocade/bna/bfa_ioc.c
index 9c80ab07a735..92c7639d1fc7 100644
--- a/drivers/net/ethernet/brocade/bna/bfa_ioc.c
+++ b/drivers/net/ethernet/brocade/bna/bfa_ioc.c
@@ -314,13 +314,13 @@ bfa_ioc_sm_getattr(struct bfa_ioc *ioc, enum ioc_event =
event)
 {
 	switch (event) {
 	case IOC_E_FWRSP_GETATTR:
-		del_timer(&ioc->ioc_timer);
+		timer_delete(&ioc->ioc_timer);
 		bfa_fsm_set_state(ioc, bfa_ioc_sm_op);
 		break;
=20
 	case IOC_E_PFFAILED:
 	case IOC_E_HWERROR:
-		del_timer(&ioc->ioc_timer);
+		timer_delete(&ioc->ioc_timer);
 		fallthrough;
 	case IOC_E_TIMEOUT:
 		ioc->cbfn->enable_cbfn(ioc->bfa, BFA_STATUS_IOC_FAILURE);
@@ -330,7 +330,7 @@ bfa_ioc_sm_getattr(struct bfa_ioc *ioc, enum ioc_event ev=
ent)
 		break;
=20
 	case IOC_E_DISABLE:
-		del_timer(&ioc->ioc_timer);
+		timer_delete(&ioc->ioc_timer);
 		bfa_fsm_set_state(ioc, bfa_ioc_sm_disabling);
 		break;
=20
@@ -659,13 +659,13 @@ bfa_iocpf_sm_mismatch(struct bfa_iocpf *iocpf, enum ioc=
pf_event event)
 		break;
=20
 	case IOCPF_E_DISABLE:
-		del_timer(&ioc->iocpf_timer);
+		timer_delete(&ioc->iocpf_timer);
 		bfa_fsm_set_state(iocpf, bfa_iocpf_sm_reset);
 		bfa_ioc_pf_disabled(ioc);
 		break;
=20
 	case IOCPF_E_STOP:
-		del_timer(&ioc->iocpf_timer);
+		timer_delete(&ioc->iocpf_timer);
 		bfa_fsm_set_state(iocpf, bfa_iocpf_sm_reset);
 		break;
=20
@@ -741,7 +741,7 @@ bfa_iocpf_sm_hwinit(struct bfa_iocpf *iocpf, enum iocpf_e=
vent event)
 		break;
=20
 	case IOCPF_E_DISABLE:
-		del_timer(&ioc->iocpf_timer);
+		timer_delete(&ioc->iocpf_timer);
 		bfa_ioc_sync_leave(ioc);
 		bfa_nw_ioc_hw_sem_release(ioc);
 		bfa_fsm_set_state(iocpf, bfa_iocpf_sm_disabled);
@@ -774,13 +774,13 @@ bfa_iocpf_sm_enabling(struct bfa_iocpf *iocpf, enum ioc=
pf_event event)
=20
 	switch (event) {
 	case IOCPF_E_FWRSP_ENABLE:
-		del_timer(&ioc->iocpf_timer);
+		timer_delete(&ioc->iocpf_timer);
 		bfa_nw_ioc_hw_sem_release(ioc);
 		bfa_fsm_set_state(iocpf, bfa_iocpf_sm_ready);
 		break;
=20
 	case IOCPF_E_INITFAIL:
-		del_timer(&ioc->iocpf_timer);
+		timer_delete(&ioc->iocpf_timer);
 		fallthrough;
=20
 	case IOCPF_E_TIMEOUT:
@@ -791,7 +791,7 @@ bfa_iocpf_sm_enabling(struct bfa_iocpf *iocpf, enum iocpf=
_event event)
 		break;
=20
 	case IOCPF_E_DISABLE:
-		del_timer(&ioc->iocpf_timer);
+		timer_delete(&ioc->iocpf_timer);
 		bfa_nw_ioc_hw_sem_release(ioc);
 		bfa_fsm_set_state(iocpf, bfa_iocpf_sm_disabling);
 		break;
@@ -844,12 +844,12 @@ bfa_iocpf_sm_disabling(struct bfa_iocpf *iocpf, enum io=
cpf_event event)
=20
 	switch (event) {
 	case IOCPF_E_FWRSP_DISABLE:
-		del_timer(&ioc->iocpf_timer);
+		timer_delete(&ioc->iocpf_timer);
 		bfa_fsm_set_state(iocpf, bfa_iocpf_sm_disabling_sync);
 		break;
=20
 	case IOCPF_E_FAIL:
-		del_timer(&ioc->iocpf_timer);
+		timer_delete(&ioc->iocpf_timer);
 		fallthrough;
=20
 	case IOCPF_E_TIMEOUT:
@@ -1210,7 +1210,7 @@ bfa_nw_ioc_hw_sem_release(struct bfa_ioc *ioc)
 static void
 bfa_ioc_hw_sem_get_cancel(struct bfa_ioc *ioc)
 {
-	del_timer(&ioc->sem_timer);
+	timer_delete(&ioc->sem_timer);
 }
=20
 /* Initialize LPU local memory (aka secondary memory / SRAM) */
@@ -1982,7 +1982,7 @@ bfa_ioc_hb_monitor(struct bfa_ioc *ioc)
 static void
 bfa_ioc_hb_stop(struct bfa_ioc *ioc)
 {
-	del_timer(&ioc->hb_timer);
+	timer_delete(&ioc->hb_timer);
 }
=20
 /* Initiate a full firmware download. */
diff --git a/drivers/net/ethernet/brocade/bna/bnad.c b/drivers/net/ethernet/b=
rocade/bna/bnad.c
index 3b9107003b00..a03eff3d4425 100644
--- a/drivers/net/ethernet/brocade/bna/bnad.c
+++ b/drivers/net/ethernet/brocade/bna/bnad.c
@@ -1837,7 +1837,7 @@ bnad_stats_timer_stop(struct bnad *bnad)
 		to_del =3D 1;
 	spin_unlock_irqrestore(&bnad->bna_lock, flags);
 	if (to_del)
-		del_timer_sync(&bnad->stats_timer);
+		timer_delete_sync(&bnad->stats_timer);
 }
=20
 /* Utilities */
@@ -2160,7 +2160,7 @@ bnad_destroy_rx(struct bnad *bnad, u32 rx_id)
 		}
 		spin_unlock_irqrestore(&bnad->bna_lock, flags);
 		if (to_del)
-			del_timer_sync(&bnad->dim_timer);
+			timer_delete_sync(&bnad->dim_timer);
 	}
=20
 	init_completion(&bnad->bnad_completions.rx_comp);
@@ -3726,9 +3726,9 @@ bnad_pci_probe(struct pci_dev *pdev,
 	bnad_res_free(bnad, &bnad->mod_res_info[0], BNA_MOD_RES_T_MAX);
 disable_ioceth:
 	bnad_ioceth_disable(bnad);
-	del_timer_sync(&bnad->bna.ioceth.ioc.ioc_timer);
-	del_timer_sync(&bnad->bna.ioceth.ioc.sem_timer);
-	del_timer_sync(&bnad->bna.ioceth.ioc.hb_timer);
+	timer_delete_sync(&bnad->bna.ioceth.ioc.ioc_timer);
+	timer_delete_sync(&bnad->bna.ioceth.ioc.sem_timer);
+	timer_delete_sync(&bnad->bna.ioceth.ioc.hb_timer);
 	spin_lock_irqsave(&bnad->bna_lock, flags);
 	bna_uninit(bna);
 	spin_unlock_irqrestore(&bnad->bna_lock, flags);
@@ -3769,9 +3769,9 @@ bnad_pci_remove(struct pci_dev *pdev)
=20
 	mutex_lock(&bnad->conf_mutex);
 	bnad_ioceth_disable(bnad);
-	del_timer_sync(&bnad->bna.ioceth.ioc.ioc_timer);
-	del_timer_sync(&bnad->bna.ioceth.ioc.sem_timer);
-	del_timer_sync(&bnad->bna.ioceth.ioc.hb_timer);
+	timer_delete_sync(&bnad->bna.ioceth.ioc.ioc_timer);
+	timer_delete_sync(&bnad->bna.ioceth.ioc.sem_timer);
+	timer_delete_sync(&bnad->bna.ioceth.ioc.hb_timer);
 	spin_lock_irqsave(&bnad->bna_lock, flags);
 	bna_uninit(bna);
 	spin_unlock_irqrestore(&bnad->bna_lock, flags);
diff --git a/drivers/net/ethernet/brocade/bna/bnad_ethtool.c b/drivers/net/et=
hernet/brocade/bna/bnad_ethtool.c
index d1ad6c9f8140..216e25f26dbb 100644
--- a/drivers/net/ethernet/brocade/bna/bnad_ethtool.c
+++ b/drivers/net/ethernet/brocade/bna/bnad_ethtool.c
@@ -373,7 +373,7 @@ static int bnad_set_coalesce(struct net_device *netdev,
 			}
 			spin_unlock_irqrestore(&bnad->bna_lock, flags);
 			if (to_del)
-				del_timer_sync(&bnad->dim_timer);
+				timer_delete_sync(&bnad->dim_timer);
 			spin_lock_irqsave(&bnad->bna_lock, flags);
 			bnad_rx_coalescing_timeo_set(bnad);
 		}
diff --git a/drivers/net/ethernet/chelsio/cxgb/sge.c b/drivers/net/ethernet/c=
helsio/cxgb/sge.c
index 861edff5ed89..a10923c7e25c 100644
--- a/drivers/net/ethernet/chelsio/cxgb/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb/sge.c
@@ -1984,9 +1984,9 @@ void t1_sge_stop(struct sge *sge)
 	readl(sge->adapter->regs + A_SG_CONTROL); /* flush */
=20
 	if (is_T2(sge->adapter))
-		del_timer_sync(&sge->espibug_timer);
+		timer_delete_sync(&sge->espibug_timer);
=20
-	del_timer_sync(&sge->tx_reclaim_timer);
+	timer_delete_sync(&sge->tx_reclaim_timer);
 	if (sge->tx_sched)
 		tx_sched_stop(sge);
=20
diff --git a/drivers/net/ethernet/chelsio/cxgb3/sge.c b/drivers/net/ethernet/=
chelsio/cxgb3/sge.c
index 6268f96cb4aa..bd5c3b3fa5e3 100644
--- a/drivers/net/ethernet/chelsio/cxgb3/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/sge.c
@@ -3223,9 +3223,9 @@ void t3_stop_sge_timers(struct adapter *adap)
 		struct sge_qset *q =3D &adap->sge.qs[i];
=20
 		if (q->tx_reclaim_timer.function)
-			del_timer_sync(&q->tx_reclaim_timer);
+			timer_delete_sync(&q->tx_reclaim_timer);
 		if (q->rx_reclaim_timer.function)
-			del_timer_sync(&q->rx_reclaim_timer);
+			timer_delete_sync(&q->rx_reclaim_timer);
 	}
 }
=20
diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/=
chelsio/cxgb4/sge.c
index a7d76a8ed050..f991a28a71c3 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -4996,9 +4996,9 @@ void t4_sge_stop(struct adapter *adap)
 	struct sge *s =3D &adap->sge;
=20
 	if (s->rx_timer.function)
-		del_timer_sync(&s->rx_timer);
+		timer_delete_sync(&s->rx_timer);
 	if (s->tx_timer.function)
-		del_timer_sync(&s->tx_timer);
+		timer_delete_sync(&s->tx_timer);
=20
 	if (is_offload(adap)) {
 		struct sge_uld_txq_info *txq_info;
diff --git a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c b/drivers/net/etherne=
t/chelsio/cxgb4vf/sge.c
index 5b1d746e6563..f42af01f4114 100644
--- a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
@@ -2609,9 +2609,9 @@ void t4vf_sge_stop(struct adapter *adapter)
 	struct sge *s =3D &adapter->sge;
=20
 	if (s->rx_timer.function)
-		del_timer_sync(&s->rx_timer);
+		timer_delete_sync(&s->rx_timer);
 	if (s->tx_timer.function)
-		del_timer_sync(&s->tx_timer);
+		timer_delete_sync(&s->tx_timer);
 }
=20
 /**
diff --git a/drivers/net/ethernet/cisco/enic/enic_clsf.h b/drivers/net/ethern=
et/cisco/enic/enic_clsf.h
index 8c4ce50da6e1..5f5284102fb0 100644
--- a/drivers/net/ethernet/cisco/enic/enic_clsf.h
+++ b/drivers/net/ethernet/cisco/enic/enic_clsf.h
@@ -26,7 +26,7 @@ static inline void enic_rfs_timer_start(struct enic *enic)
=20
 static inline void enic_rfs_timer_stop(struct enic *enic)
 {
-	del_timer_sync(&enic->rfs_h.rfs_may_expire);
+	timer_delete_sync(&enic->rfs_h.rfs_may_expire);
 }
 #else
 static inline void enic_rfs_timer_start(struct enic *enic) {}
diff --git a/drivers/net/ethernet/cisco/enic/enic_main.c b/drivers/net/ethern=
et/cisco/enic/enic_main.c
index 54aa3953bf7b..c753c35b26eb 100644
--- a/drivers/net/ethernet/cisco/enic/enic_main.c
+++ b/drivers/net/ethernet/cisco/enic/enic_main.c
@@ -1787,7 +1787,7 @@ static int enic_stop(struct net_device *netdev)
=20
 	enic_synchronize_irqs(enic);
=20
-	del_timer_sync(&enic->notify_timer);
+	timer_delete_sync(&enic->notify_timer);
 	enic_rfs_flw_tbl_free(enic);
=20
 	enic_dev_disable(enic);
diff --git a/drivers/net/ethernet/dec/tulip/21142.c b/drivers/net/ethernet/de=
c/tulip/21142.c
index 369858272650..76767dec216d 100644
--- a/drivers/net/ethernet/dec/tulip/21142.c
+++ b/drivers/net/ethernet/dec/tulip/21142.c
@@ -216,7 +216,7 @@ void t21142_lnk_change(struct net_device *dev, int csr5)
 		    (csr12 & 2) =3D=3D 2) ||
 		   (tp->nway && (csr5 & (TPLnkFail)))) {
 		/* Link blew? Maybe restart NWay. */
-		del_timer_sync(&tp->timer);
+		timer_delete_sync(&tp->timer);
 		t21142_start_nway(dev);
 		tp->timer.expires =3D RUN_AT(3*HZ);
 		add_timer(&tp->timer);
@@ -226,7 +226,7 @@ void t21142_lnk_change(struct net_device *dev, int csr5)
 				 medianame[dev->if_port],
 				 (csr12 & 2) ? "failed" : "good");
 		if ((csr12 & 2)  &&  ! tp->medialock) {
-			del_timer_sync(&tp->timer);
+			timer_delete_sync(&tp->timer);
 			t21142_start_nway(dev);
 			tp->timer.expires =3D RUN_AT(3*HZ);
 			add_timer(&tp->timer);
diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/=
dec/tulip/de2104x.c
index 0a161a4db242..f9339d0772b5 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -1428,7 +1428,7 @@ static int de_close (struct net_device *dev)
=20
 	netif_dbg(de, ifdown, dev, "disabling interface\n");
=20
-	del_timer_sync(&de->media_timer);
+	timer_delete_sync(&de->media_timer);
=20
 	spin_lock_irqsave(&de->lock, flags);
 	de_stop_hw(de);
@@ -1452,7 +1452,7 @@ static void de_tx_timeout (struct net_device *dev, unsi=
gned int txqueue)
 		   dr32(MacStatus), dr32(MacMode), dr32(SIAStatus),
 		   de->rx_tail, de->tx_head, de->tx_tail);
=20
-	del_timer_sync(&de->media_timer);
+	timer_delete_sync(&de->media_timer);
=20
 	disable_irq(irq);
 	spin_lock_irq(&de->lock);
@@ -2126,7 +2126,7 @@ static int __maybe_unused de_suspend(struct device *dev=
_d)
 	if (netif_running (dev)) {
 		const int irq =3D pdev->irq;
=20
-		del_timer_sync(&de->media_timer);
+		timer_delete_sync(&de->media_timer);
=20
 		disable_irq(irq);
 		spin_lock_irq(&de->lock);
diff --git a/drivers/net/ethernet/dec/tulip/dmfe.c b/drivers/net/ethernet/dec=
/tulip/dmfe.c
index 3188ba7b450f..ae34b95ed676 100644
--- a/drivers/net/ethernet/dec/tulip/dmfe.c
+++ b/drivers/net/ethernet/dec/tulip/dmfe.c
@@ -745,7 +745,7 @@ static int dmfe_stop(struct net_device *dev)
 	netif_stop_queue(dev);
=20
 	/* deleted timer */
-	del_timer_sync(&db->timer);
+	timer_delete_sync(&db->timer);
=20
 	/* Reset & stop DM910X board */
 	dw32(DCR0, DM910X_RESET);
diff --git a/drivers/net/ethernet/dec/tulip/interrupt.c b/drivers/net/etherne=
t/dec/tulip/interrupt.c
index 54560f9a1651..2d926a26fbb9 100644
--- a/drivers/net/ethernet/dec/tulip/interrupt.c
+++ b/drivers/net/ethernet/dec/tulip/interrupt.c
@@ -699,8 +699,8 @@ irqreturn_t tulip_interrupt(int irq, void *dev_instance)
 				tulip_start_rxtx(tp);
 			}
 			/*
-			 * NB: t21142_lnk_change() does a del_timer_sync(), so be careful if this
-			 * call is ever done under the spinlock
+			 * NB: t21142_lnk_change() does a timer_delete_sync(), so be careful
+			 * if this call is ever done under the spinlock
 			 */
 			if (csr5 & (TPLnkPass | TPLnkFail | 0x08000000)) {
 				if (tp->link_change)
diff --git a/drivers/net/ethernet/dec/tulip/pnic2.c b/drivers/net/ethernet/de=
c/tulip/pnic2.c
index 72a09156b48b..2e3bdc0fcdc0 100644
--- a/drivers/net/ethernet/dec/tulip/pnic2.c
+++ b/drivers/net/ethernet/dec/tulip/pnic2.c
@@ -323,7 +323,7 @@ void pnic2_lnk_change(struct net_device *dev, int csr5)
 		if (tulip_debug > 2)
 			netdev_dbg(dev, "Ugh! Link blew?\n");
=20
-		del_timer_sync(&tp->timer);
+		timer_delete_sync(&tp->timer);
 		pnic2_start_nway(dev);
 		tp->timer.expires =3D RUN_AT(3*HZ);
 		add_timer(&tp->timer);
@@ -348,7 +348,7 @@ void pnic2_lnk_change(struct net_device *dev, int csr5)
=20
                 /* if failed then try doing an nway to get in sync */
 		if ((csr12 & 2)  &&  ! tp->medialock) {
-			del_timer_sync(&tp->timer);
+			timer_delete_sync(&tp->timer);
 			pnic2_start_nway(dev);
 			tp->timer.expires =3D RUN_AT(3*HZ);
 			add_timer(&tp->timer);
@@ -372,7 +372,7 @@ void pnic2_lnk_change(struct net_device *dev, int csr5)
=20
                 /* if failed, try doing an nway to get in sync */
 		if ((csr12 & 4)  &&  ! tp->medialock) {
-			del_timer_sync(&tp->timer);
+			timer_delete_sync(&tp->timer);
 			pnic2_start_nway(dev);
 			tp->timer.expires =3D RUN_AT(3*HZ);
 			add_timer(&tp->timer);
diff --git a/drivers/net/ethernet/dec/tulip/tulip_core.c b/drivers/net/ethern=
et/dec/tulip/tulip_core.c
index 75eac18ff246..c8c53121557f 100644
--- a/drivers/net/ethernet/dec/tulip/tulip_core.c
+++ b/drivers/net/ethernet/dec/tulip/tulip_core.c
@@ -747,9 +747,9 @@ static void tulip_down (struct net_device *dev)
 	napi_disable(&tp->napi);
 #endif
=20
-	del_timer_sync (&tp->timer);
+	timer_delete_sync(&tp->timer);
 #ifdef CONFIG_TULIP_NAPI
-	del_timer_sync (&tp->oom_timer);
+	timer_delete_sync(&tp->oom_timer);
 #endif
 	spin_lock_irqsave (&tp->lock, flags);
=20
diff --git a/drivers/net/ethernet/dec/tulip/uli526x.c b/drivers/net/ethernet/=
dec/tulip/uli526x.c
index ff080ab0f116..3f1bd670700b 100644
--- a/drivers/net/ethernet/dec/tulip/uli526x.c
+++ b/drivers/net/ethernet/dec/tulip/uli526x.c
@@ -656,7 +656,7 @@ static int uli526x_stop(struct net_device *dev)
 	netif_stop_queue(dev);
=20
 	/* deleted timer */
-	del_timer_sync(&db->timer);
+	timer_delete_sync(&db->timer);
=20
 	/* Reset & stop ULI526X board */
 	uw32(DCR0, ULI526X_RESET);
diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ether=
net/dec/tulip/winbond-840.c
index 37fba39c0056..5930cdec6f2f 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -1509,7 +1509,7 @@ static int netdev_close(struct net_device *dev)
 	}
 #endif /* __i386__ debugging only */
=20
-	del_timer_sync(&np->timer);
+	timer_delete_sync(&np->timer);
=20
 	free_rxtx_rings(np);
 	free_ringdesc(np);
@@ -1560,7 +1560,7 @@ static int __maybe_unused w840_suspend(struct device *d=
ev_d)
=20
 	rtnl_lock();
 	if (netif_running (dev)) {
-		del_timer_sync(&np->timer);
+		timer_delete_sync(&np->timer);
=20
 		spin_lock_irq(&np->lock);
 		netif_device_detach(dev);
diff --git a/drivers/net/ethernet/dlink/dl2k.c b/drivers/net/ethernet/dlink/d=
l2k.c
index d0ea92607870..d88fbecdab4b 100644
--- a/drivers/net/ethernet/dlink/dl2k.c
+++ b/drivers/net/ethernet/dlink/dl2k.c
@@ -1778,7 +1778,7 @@ rio_close (struct net_device *dev)
 	rio_hw_stop(dev);
=20
 	free_irq(pdev->irq, dev);
-	del_timer_sync (&np->timer);
+	timer_delete_sync(&np->timer);
=20
 	free_list(dev);
=20
@@ -1818,7 +1818,7 @@ static int rio_suspend(struct device *device)
 		return 0;
=20
 	netif_device_detach(dev);
-	del_timer_sync(&np->timer);
+	timer_delete_sync(&np->timer);
 	rio_hw_stop(dev);
=20
 	return 0;
diff --git a/drivers/net/ethernet/fealnx.c b/drivers/net/ethernet/fealnx.c
index ed18450fd2cc..670b68201376 100644
--- a/drivers/net/ethernet/fealnx.c
+++ b/drivers/net/ethernet/fealnx.c
@@ -1900,8 +1900,8 @@ static int netdev_close(struct net_device *dev)
 	/* Stop the chip's Tx and Rx processes. */
 	stop_nic_rxtx(ioaddr, 0);
=20
-	del_timer_sync(&np->timer);
-	del_timer_sync(&np->reset_timer);
+	timer_delete_sync(&np->timer);
+	timer_delete_sync(&np->reset_timer);
=20
 	free_irq(np->pci_dev->irq, dev);
=20
diff --git a/drivers/net/ethernet/google/gve/gve_ethtool.c b/drivers/net/ethe=
rnet/google/gve/gve_ethtool.c
index 4dea1fdce748..eae1a7595a69 100644
--- a/drivers/net/ethernet/google/gve/gve_ethtool.c
+++ b/drivers/net/ethernet/google/gve/gve_ethtool.c
@@ -705,7 +705,7 @@ static int gve_set_priv_flags(struct net_device *netdev, =
u32 flags)
=20
 		memset(priv->stats_report->stats, 0, (tx_stats_num + rx_stats_num) *
 				   sizeof(struct stats));
-		del_timer_sync(&priv->stats_report_timer);
+		timer_delete_sync(&priv->stats_report_timer);
 	}
 	return 0;
 }
diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/etherne=
t/google/gve/gve_main.c
index f9a73c956861..c3791cf23c87 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -302,7 +302,7 @@ static void gve_free_stats_report(struct gve_priv *priv)
 	if (!priv->stats_report)
 		return;
=20
-	del_timer_sync(&priv->stats_report_timer);
+	timer_delete_sync(&priv->stats_report_timer);
 	dma_free_coherent(&priv->pdev->dev, priv->stats_report_len,
 			  priv->stats_report, priv->stats_report_bus);
 	priv->stats_report =3D NULL;
@@ -1408,7 +1408,7 @@ static int gve_queues_stop(struct gve_priv *priv)
 			goto err;
 		gve_clear_device_rings_ok(priv);
 	}
-	del_timer_sync(&priv->stats_report_timer);
+	timer_delete_sync(&priv->stats_report_timer);
=20
 	gve_unreg_xdp_info(priv);
=20
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_enet.c b/drivers/net/ethe=
rnet/hisilicon/hns/hns_enet.c
index 42bb341fd80b..d98f8d3ce7c8 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
@@ -1402,7 +1402,7 @@ static void hns_nic_net_down(struct net_device *ndev)
 	if (test_and_set_bit(NIC_STATE_DOWN, &priv->state))
 		return;
=20
-	(void)del_timer_sync(&priv->service_timer);
+	(void) timer_delete_sync(&priv->service_timer);
 	netif_tx_stop_all_queues(ndev);
 	netif_carrier_off(ndev);
 	netif_tx_disable(ndev);
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/driver=
s/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 92f9b8ec76d9..3e28a08934ab 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -11492,7 +11492,7 @@ static void hclge_state_uninit(struct hclge_dev *hdev)
 	set_bit(HCLGE_STATE_REMOVING, &hdev->state);
=20
 	if (hdev->reset_timer.function)
-		del_timer_sync(&hdev->reset_timer);
+		timer_delete_sync(&hdev->reset_timer);
 	if (hdev->service_task.work.func)
 		cancel_delayed_work_sync(&hdev->service_task);
 }
diff --git a/drivers/net/ethernet/intel/e100.c b/drivers/net/ethernet/intel/e=
100.c
index 3a5bbda235cb..c0ead54ea186 100644
--- a/drivers/net/ethernet/intel/e100.c
+++ b/drivers/net/ethernet/intel/e100.c
@@ -2293,7 +2293,7 @@ static int e100_up(struct nic *nic)
 	return 0;
=20
 err_no_irq:
-	del_timer_sync(&nic->watchdog);
+	timer_delete_sync(&nic->watchdog);
 err_clean_cbs:
 	e100_clean_cbs(nic);
 err_rx_clean_list:
@@ -2308,7 +2308,7 @@ static void e100_down(struct nic *nic)
 	netif_stop_queue(nic->netdev);
 	e100_hw_reset(nic);
 	free_irq(nic->pdev->irq, nic->netdev);
-	del_timer_sync(&nic->watchdog);
+	timer_delete_sync(&nic->watchdog);
 	netif_carrier_off(nic->netdev);
 	e100_clean_cbs(nic);
 	e100_rx_clean_list(nic);
diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/etherne=
t/intel/e1000e/netdev.c
index 286155efcedf..8ebcb6a7d608 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -4287,8 +4287,8 @@ void e1000e_down(struct e1000_adapter *adapter, bool re=
set)
=20
 	napi_synchronize(&adapter->napi);
=20
-	del_timer_sync(&adapter->watchdog_timer);
-	del_timer_sync(&adapter->phy_info_timer);
+	timer_delete_sync(&adapter->watchdog_timer);
+	timer_delete_sync(&adapter->phy_info_timer);
=20
 	spin_lock(&adapter->stats64_lock);
 	e1000e_update_stats(adapter);
@@ -7741,8 +7741,8 @@ static void e1000_remove(struct pci_dev *pdev)
 	 * from being rescheduled.
 	 */
 	set_bit(__E1000_DOWN, &adapter->state);
-	del_timer_sync(&adapter->watchdog_timer);
-	del_timer_sync(&adapter->phy_info_timer);
+	timer_delete_sync(&adapter->watchdog_timer);
+	timer_delete_sync(&adapter->phy_info_timer);
=20
 	cancel_work_sync(&adapter->reset_task);
 	cancel_work_sync(&adapter->watchdog_task);
diff --git a/drivers/net/ethernet/intel/fm10k/fm10k_pci.c b/drivers/net/ether=
net/intel/fm10k/fm10k_pci.c
index 92de609b7218..21267ab603ef 100644
--- a/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
+++ b/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
@@ -2245,7 +2245,7 @@ static void fm10k_remove(struct pci_dev *pdev)
 	struct fm10k_intfc *interface =3D pci_get_drvdata(pdev);
 	struct net_device *netdev =3D interface->netdev;
=20
-	del_timer_sync(&interface->service_timer);
+	timer_delete_sync(&interface->service_timer);
=20
 	fm10k_stop_service_event(interface);
 	fm10k_stop_macvlan_task(interface);
diff --git a/drivers/net/ethernet/intel/i40e/i40e_main.c b/drivers/net/ethern=
et/intel/i40e/i40e_main.c
index 65a702668e21..120d68654e3f 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_main.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_main.c
@@ -16382,7 +16382,7 @@ static int i40e_io_suspend(struct i40e_pf *pf)
 	set_bit(__I40E_DOWN, pf->state);
=20
 	/* Ensure service task will not be running */
-	del_timer_sync(&pf->service_timer);
+	timer_delete_sync(&pf->service_timer);
 	cancel_work_sync(&pf->service_task);
=20
 	/* Client close must be called explicitly here because the timer
@@ -16581,7 +16581,7 @@ static void i40e_shutdown(struct pci_dev *pdev)
 	set_bit(__I40E_SUSPENDED, pf->state);
 	set_bit(__I40E_DOWN, pf->state);
=20
-	del_timer_sync(&pf->service_timer);
+	timer_delete_sync(&pf->service_timer);
 	cancel_work_sync(&pf->service_task);
 	i40e_cloud_filter_exit(pf);
 	i40e_fdir_teardown(pf);
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet=
/intel/ice/ice_main.c
index 049edeb60104..d390157b59fe 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -1717,7 +1717,7 @@ static int ice_service_task_stop(struct ice_pf *pf)
 	ret =3D test_and_set_bit(ICE_SERVICE_DIS, pf->state);
=20
 	if (pf->serv_tmr.function)
-		del_timer_sync(&pf->serv_tmr);
+		timer_delete_sync(&pf->serv_tmr);
 	if (pf->serv_task.func)
 		cancel_work_sync(&pf->serv_task);
=20
diff --git a/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c b/drivers/net=
/ethernet/intel/ice/ice_virtchnl_fdir.c
index 9be4bd717512..7752920d7a8e 100644
--- a/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c
+++ b/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c
@@ -1521,7 +1521,7 @@ ice_vc_fdir_irq_handler(struct ice_vsi *ctrl_vsi,
 	memcpy(&ctx_done->rx_desc, rx_desc, sizeof(*rx_desc));
 	spin_unlock_irqrestore(&fdir->ctx_lock, flags);
=20
-	ret =3D del_timer(&ctx_irq->rx_tmr);
+	ret =3D timer_delete(&ctx_irq->rx_tmr);
 	if (!ret)
 		dev_err(dev, "VF %d: Unexpected inactive timer!\n", vf->vf_id);
=20
@@ -1916,7 +1916,7 @@ static void ice_vc_fdir_clear_irq_ctx(struct ice_vf *vf)
 	struct ice_vf_fdir_ctx *ctx =3D &vf->fdir.ctx_irq;
 	unsigned long flags;
=20
-	del_timer(&ctx->rx_tmr);
+	timer_delete(&ctx->rx_tmr);
 	spin_lock_irqsave(&vf->fdir.ctx_lock, flags);
 	ctx->flags &=3D ~ICE_VF_FDIR_CTX_VALID;
 	spin_unlock_irqrestore(&vf->fdir.ctx_lock, flags);
diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet=
/intel/igb/igb_main.c
index d368b753a467..c646c71915f0 100644
--- a/drivers/net/ethernet/intel/igb/igb_main.c
+++ b/drivers/net/ethernet/intel/igb/igb_main.c
@@ -2185,8 +2185,8 @@ void igb_down(struct igb_adapter *adapter)
 		}
 	}
=20
-	del_timer_sync(&adapter->watchdog_timer);
-	del_timer_sync(&adapter->phy_info_timer);
+	timer_delete_sync(&adapter->watchdog_timer);
+	timer_delete_sync(&adapter->phy_info_timer);
=20
 	/* record the stats before reset*/
 	spin_lock(&adapter->stats64_lock);
@@ -3860,8 +3860,8 @@ static void igb_remove(struct pci_dev *pdev)
 	 * disable watchdog from being rescheduled.
 	 */
 	set_bit(__IGB_DOWN, &adapter->state);
-	del_timer_sync(&adapter->watchdog_timer);
-	del_timer_sync(&adapter->phy_info_timer);
+	timer_delete_sync(&adapter->watchdog_timer);
+	timer_delete_sync(&adapter->phy_info_timer);
=20
 	cancel_work_sync(&adapter->reset_task);
 	cancel_work_sync(&adapter->watchdog_task);
diff --git a/drivers/net/ethernet/intel/igbvf/netdev.c b/drivers/net/ethernet=
/intel/igbvf/netdev.c
index 02044aa2181b..beb01248600f 100644
--- a/drivers/net/ethernet/intel/igbvf/netdev.c
+++ b/drivers/net/ethernet/intel/igbvf/netdev.c
@@ -1592,7 +1592,7 @@ void igbvf_down(struct igbvf_adapter *adapter)
=20
 	igbvf_irq_disable(adapter);
=20
-	del_timer_sync(&adapter->watchdog_timer);
+	timer_delete_sync(&adapter->watchdog_timer);
=20
 	/* record the stats before reset*/
 	igbvf_update_stats(adapter);
@@ -2912,7 +2912,7 @@ static void igbvf_remove(struct pci_dev *pdev)
 	 * disable it from being rescheduled.
 	 */
 	set_bit(__IGBVF_DOWN, &adapter->state);
-	del_timer_sync(&adapter->watchdog_timer);
+	timer_delete_sync(&adapter->watchdog_timer);
=20
 	cancel_work_sync(&adapter->reset_task);
 	cancel_work_sync(&adapter->watchdog_task);
diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet=
/intel/igc/igc_main.c
index 156d123c0e21..f1330379e6bb 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -5291,8 +5291,8 @@ void igc_down(struct igc_adapter *adapter)
 		}
 	}
=20
-	del_timer_sync(&adapter->watchdog_timer);
-	del_timer_sync(&adapter->phy_info_timer);
+	timer_delete_sync(&adapter->watchdog_timer);
+	timer_delete_sync(&adapter->phy_info_timer);
=20
 	/* record the stats before reset*/
 	spin_lock(&adapter->stats64_lock);
@@ -7272,8 +7272,8 @@ static void igc_remove(struct pci_dev *pdev)
=20
 	set_bit(__IGC_DOWN, &adapter->state);
=20
-	del_timer_sync(&adapter->watchdog_timer);
-	del_timer_sync(&adapter->phy_info_timer);
+	timer_delete_sync(&adapter->watchdog_timer);
+	timer_delete_sync(&adapter->phy_info_timer);
=20
 	cancel_work_sync(&adapter->reset_task);
 	cancel_work_sync(&adapter->watchdog_task);
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethe=
rnet/intel/ixgbe/ixgbe_main.c
index 481f917f7ed2..a2718218963e 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -6538,7 +6538,7 @@ void ixgbe_down(struct ixgbe_adapter *adapter)
 	adapter->flags2 &=3D ~IXGBE_FLAG2_FDIR_REQUIRES_REINIT;
 	adapter->flags &=3D ~IXGBE_FLAG_NEED_LINK_UPDATE;
=20
-	del_timer_sync(&adapter->service_timer);
+	timer_delete_sync(&adapter->service_timer);
=20
 	if (adapter->num_vfs) {
 		/* Clear EITR Select mapping */
diff --git a/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c b/drivers/net/=
ethernet/intel/ixgbevf/ixgbevf_main.c
index 6442f115a262..a217c5c04804 100644
--- a/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c
+++ b/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c
@@ -2514,7 +2514,7 @@ void ixgbevf_down(struct ixgbevf_adapter *adapter)
=20
 	ixgbevf_napi_disable_all(adapter);
=20
-	del_timer_sync(&adapter->service_timer);
+	timer_delete_sync(&adapter->service_timer);
=20
 	/* disable transmits in the hardware now that interrupts are off */
 	for (i =3D 0; i < adapter->num_tx_queues; i++) {
diff --git a/drivers/net/ethernet/korina.c b/drivers/net/ethernet/korina.c
index 87c7e6251a4f..1e2ac1a5f099 100644
--- a/drivers/net/ethernet/korina.c
+++ b/drivers/net/ethernet/korina.c
@@ -1239,7 +1239,7 @@ static int korina_close(struct net_device *dev)
 	struct korina_private *lp =3D netdev_priv(dev);
 	u32 tmp;
=20
-	del_timer(&lp->media_check_timer);
+	timer_delete(&lp->media_check_timer);
=20
 	/* Disable interrupts */
 	disable_irq(lp->rx_irq);
diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/etherne=
t/marvell/mv643xx_eth.c
index 67a6ff07c83d..8cc888bf6094 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2247,7 +2247,7 @@ static int mv643xx_eth_poll(struct napi_struct *napi, i=
nt budget)
=20
 	if (unlikely(mp->oom)) {
 		mp->oom =3D 0;
-		del_timer(&mp->rx_oom);
+		timer_delete(&mp->rx_oom);
 	}
=20
 	work_done =3D 0;
@@ -2521,7 +2521,7 @@ static int mv643xx_eth_stop(struct net_device *dev)
=20
 	napi_disable(&mp->napi);
=20
-	del_timer_sync(&mp->rx_oom);
+	timer_delete_sync(&mp->rx_oom);
=20
 	netif_carrier_off(dev);
 	if (dev->phydev)
@@ -2531,7 +2531,7 @@ static int mv643xx_eth_stop(struct net_device *dev)
 	port_reset(mp);
 	mv643xx_eth_get_stats(dev);
 	mib_counters_update(mp);
-	del_timer_sync(&mp->mib_counters_timer);
+	timer_delete_sync(&mp->mib_counters_timer);
=20
 	for (i =3D 0; i < mp->rxq_count; i++)
 		rxq_deinit(mp->rxq + i);
diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet=
/marvell/pxa168_eth.c
index 2bf426cea6dd..72c1967768f4 100644
--- a/drivers/net/ethernet/marvell/pxa168_eth.c
+++ b/drivers/net/ethernet/marvell/pxa168_eth.c
@@ -1175,7 +1175,7 @@ static int pxa168_eth_stop(struct net_device *dev)
 	/* Write to ICR to clear interrupts. */
 	wrl(pep, INT_W_CLEAR, 0);
 	napi_disable(&pep->napi);
-	del_timer_sync(&pep->timeout);
+	timer_delete_sync(&pep->timeout);
 	netif_carrier_off(dev);
 	free_irq(dev->irq, dev);
 	rxq_deinit(dev);
diff --git a/drivers/net/ethernet/marvell/skge.c b/drivers/net/ethernet/marve=
ll/skge.c
index a1bada9eaaf6..b2081d6e34f0 100644
--- a/drivers/net/ethernet/marvell/skge.c
+++ b/drivers/net/ethernet/marvell/skge.c
@@ -2662,7 +2662,7 @@ static int skge_down(struct net_device *dev)
 	netif_tx_disable(dev);
=20
 	if (is_genesis(hw) && hw->phy_type =3D=3D SK_PHY_XMAC)
-		del_timer_sync(&skge->link_timer);
+		timer_delete_sync(&skge->link_timer);
=20
 	napi_disable(&skge->napi);
 	netif_carrier_off(dev);
diff --git a/drivers/net/ethernet/marvell/sky2.c b/drivers/net/ethernet/marve=
ll/sky2.c
index d7121c836508..e2a9aae8bc9b 100644
--- a/drivers/net/ethernet/marvell/sky2.c
+++ b/drivers/net/ethernet/marvell/sky2.c
@@ -5052,7 +5052,7 @@ static int sky2_suspend(struct device *dev)
 	if (!hw)
 		return 0;
=20
-	del_timer_sync(&hw->watchdog_timer);
+	timer_delete_sync(&hw->watchdog_timer);
 	cancel_work_sync(&hw->restart_work);
=20
 	rtnl_lock();
diff --git a/drivers/net/ethernet/mellanox/mlx4/catas.c b/drivers/net/etherne=
t/mellanox/mlx4/catas.c
index 0d8a362c2673..33ba0a5c38ac 100644
--- a/drivers/net/ethernet/mellanox/mlx4/catas.c
+++ b/drivers/net/ethernet/mellanox/mlx4/catas.c
@@ -305,7 +305,7 @@ void mlx4_stop_catas_poll(struct mlx4_dev *dev)
 {
 	struct mlx4_priv *priv =3D mlx4_priv(dev);
=20
-	del_timer_sync(&priv->catas_err.timer);
+	timer_delete_sync(&priv->catas_err.timer);
=20
 	if (priv->catas_err.map) {
 		iounmap(priv->catas_err.map);
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c b/drivers/net=
/ethernet/mellanox/mlx5/core/fw_reset.c
index 6830a49fe682..5442a02c4097 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
@@ -246,7 +246,7 @@ static void mlx5_stop_sync_reset_poll(struct mlx5_core_de=
v *dev)
 {
 	struct mlx5_fw_reset *fw_reset =3D dev->priv.fw_reset;
=20
-	del_timer_sync(&fw_reset->timer);
+	timer_delete_sync(&fw_reset->timer);
 }
=20
 static int mlx5_sync_reset_clear_reset_requested(struct mlx5_core_dev *dev, =
bool poll_health)
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/health.c b/drivers/net/e=
thernet/mellanox/mlx5/core/health.c
index 91613d5a36cd..624452ddebc0 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/health.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/health.c
@@ -847,7 +847,7 @@ void mlx5_stop_health_poll(struct mlx5_core_dev *dev, boo=
l disable_health)
 	if (disable_health)
 		set_bit(MLX5_DROP_HEALTH_WORK, &health->flags);
=20
-	del_timer_sync(&health->timer);
+	timer_delete_sync(&health->timer);
 }
=20
 void mlx5_start_health_fw_log_up(struct mlx5_core_dev *dev)
diff --git a/drivers/net/ethernet/micrel/ksz884x.c b/drivers/net/ethernet/mic=
rel/ksz884x.c
index dc1d9f774565..1302aa8e0853 100644
--- a/drivers/net/ethernet/micrel/ksz884x.c
+++ b/drivers/net/ethernet/micrel/ksz884x.c
@@ -3951,7 +3951,7 @@ static void ksz_stop_timer(struct ksz_timer_info *info)
 {
 	if (info->max) {
 		info->max =3D 0;
-		del_timer_sync(&info->timer);
+		timer_delete_sync(&info->timer);
 	}
 }
=20
diff --git a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c b/drivers/net/e=
thernet/myricom/myri10ge/myri10ge.c
index b7d9657a7af3..7c501a758325 100644
--- a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
+++ b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
@@ -2482,7 +2482,7 @@ static int myri10ge_close(struct net_device *dev)
 	if (mgp->ss[0].tx.req_bytes =3D=3D NULL)
 		return 0;
=20
-	del_timer_sync(&mgp->watchdog_timer);
+	timer_delete_sync(&mgp->watchdog_timer);
 	mgp->running =3D MYRI10GE_ETH_STOPPING;
 	for (i =3D 0; i < mgp->num_slices; i++)
 		napi_disable(&mgp->ss[i].napi);
diff --git a/drivers/net/ethernet/natsemi/natsemi.c b/drivers/net/ethernet/na=
tsemi/natsemi.c
index ad0c14849115..05606692e631 100644
--- a/drivers/net/ethernet/natsemi/natsemi.c
+++ b/drivers/net/ethernet/natsemi/natsemi.c
@@ -3179,7 +3179,7 @@ static int netdev_close(struct net_device *dev)
 	 * the final WOL settings?
 	 */
=20
-	del_timer_sync(&np->timer);
+	timer_delete_sync(&np->timer);
 	disable_irq(irq);
 	spin_lock_irq(&np->lock);
 	natsemi_irq_disable(dev);
@@ -3278,7 +3278,7 @@ static int __maybe_unused natsemi_suspend(struct device=
 *dev_d)
 	if (netif_running (dev)) {
 		const int irq =3D np->pci_dev->irq;
=20
-		del_timer_sync(&np->timer);
+		timer_delete_sync(&np->timer);
=20
 		disable_irq(irq);
 		spin_lock_irq(&np->lock);
diff --git a/drivers/net/ethernet/natsemi/ns83820.c b/drivers/net/ethernet/na=
tsemi/ns83820.c
index bea969dfa536..bf0347715a05 100644
--- a/drivers/net/ethernet/natsemi/ns83820.c
+++ b/drivers/net/ethernet/natsemi/ns83820.c
@@ -1527,7 +1527,7 @@ static int ns83820_stop(struct net_device *ndev)
 	struct ns83820 *dev =3D PRIV(ndev);
=20
 	/* FIXME: protect against interrupt handler? */
-	del_timer_sync(&dev->tx_watchdog);
+	timer_delete_sync(&dev->tx_watchdog);
=20
 	ns83820_disable_interrupts(dev);
=20
diff --git a/drivers/net/ethernet/neterion/s2io.c b/drivers/net/ethernet/nete=
rion/s2io.c
index f8016dc25e0a..3e55e8dc664c 100644
--- a/drivers/net/ethernet/neterion/s2io.c
+++ b/drivers/net/ethernet/neterion/s2io.c
@@ -7019,7 +7019,7 @@ static void do_s2io_card_down(struct s2io_nic *sp, int =
do_io)
 	if (!is_s2io_card_up(sp))
 		return;
=20
-	del_timer_sync(&sp->alarm_timer);
+	timer_delete_sync(&sp->alarm_timer);
 	/* If s2io_set_link task is executing, wait till it completes. */
 	while (test_and_set_bit(__S2IO_STATE_LINK_TASK, &(sp->state)))
 		msleep(50);
diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c b/drivers/ne=
t/ethernet/netronome/nfp/nfp_net_common.c
index abba165738a3..95514fabadf2 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
@@ -227,7 +227,7 @@ static void nfp_net_reconfig_sync_enter(struct nfp_net *n=
n)
 	spin_unlock_bh(&nn->reconfig_lock);
=20
 	if (cancelled_timer) {
-		del_timer_sync(&nn->reconfig_timer);
+		timer_delete_sync(&nn->reconfig_timer);
 		nfp_net_reconfig_wait(nn, nn->reconfig_timer.expires);
 	}
=20
diff --git a/drivers/net/ethernet/nvidia/forcedeth.c b/drivers/net/ethernet/n=
vidia/forcedeth.c
index 499e5e39d513..29cb74ccb25a 100644
--- a/drivers/net/ethernet/nvidia/forcedeth.c
+++ b/drivers/net/ethernet/nvidia/forcedeth.c
@@ -5623,9 +5623,9 @@ static int nv_close(struct net_device *dev)
 	napi_disable(&np->napi);
 	synchronize_irq(np->pci_dev->irq);
=20
-	del_timer_sync(&np->oom_kick);
-	del_timer_sync(&np->nic_poll);
-	del_timer_sync(&np->stats_poll);
+	timer_delete_sync(&np->oom_kick);
+	timer_delete_sync(&np->nic_poll);
+	timer_delete_sync(&np->stats_poll);
=20
 	netif_stop_queue(dev);
 	spin_lock_irq(&np->lock);
diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/n=
et/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index 4ac29cd59f2b..1651df8a7c21 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -1916,7 +1916,7 @@ void pch_gbe_down(struct pch_gbe_adapter *adapter)
 	pch_gbe_irq_disable(adapter);
 	pch_gbe_free_irq(adapter);
=20
-	del_timer_sync(&adapter->watchdog_timer);
+	timer_delete_sync(&adapter->watchdog_timer);
=20
 	netdev->tx_queue_len =3D adapter->tx_queue_len;
 	netif_carrier_off(netdev);
diff --git a/drivers/net/ethernet/packetengines/hamachi.c b/drivers/net/ether=
net/packetengines/hamachi.c
index a36d422b5173..26bc8b3b1ec8 100644
--- a/drivers/net/ethernet/packetengines/hamachi.c
+++ b/drivers/net/ethernet/packetengines/hamachi.c
@@ -1712,7 +1712,7 @@ static int hamachi_close(struct net_device *dev)
=20
 	free_irq(hmp->pci_dev->irq, dev);
=20
-	del_timer_sync(&hmp->timer);
+	timer_delete_sync(&hmp->timer);
=20
 	/* Free all the skbuffs in the Rx queue. */
 	for (i =3D 0; i < RX_RING_SIZE; i++) {
diff --git a/drivers/net/ethernet/packetengines/yellowfin.c b/drivers/net/eth=
ernet/packetengines/yellowfin.c
index c0515dc63246..21b760e65d73 100644
--- a/drivers/net/ethernet/packetengines/yellowfin.c
+++ b/drivers/net/ethernet/packetengines/yellowfin.c
@@ -1222,7 +1222,7 @@ static int yellowfin_close(struct net_device *dev)
 	iowrite32(0x80000000, ioaddr + RxCtrl);
 	iowrite32(0x80000000, ioaddr + TxCtrl);
=20
-	del_timer(&yp->timer);
+	timer_delete(&yp->timer);
=20
 #if defined(__i386__)
 	if (yellowfin_debug > 2) {
diff --git a/drivers/net/ethernet/pasemi/pasemi_mac.c b/drivers/net/ethernet/=
pasemi/pasemi_mac.c
index cb4e12df7719..801380729046 100644
--- a/drivers/net/ethernet/pasemi/pasemi_mac.c
+++ b/drivers/net/ethernet/pasemi/pasemi_mac.c
@@ -1288,7 +1288,7 @@ static int pasemi_mac_close(struct net_device *dev)
 		phy_disconnect(dev->phydev);
 	}
=20
-	del_timer_sync(&mac->tx->clean_timer);
+	timer_delete_sync(&mac->tx->clean_timer);
=20
 	netif_stop_queue(dev);
 	napi_disable(&mac->napi);
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/drivers/ne=
t/ethernet/pensando/ionic/ionic_bus_pci.c
index f5dc876eb500..4c377bdc62c8 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
@@ -441,7 +441,7 @@ static void ionic_reset_prepare(struct pci_dev *pdev)
=20
 	set_bit(IONIC_LIF_F_FW_RESET, lif->state);
=20
-	del_timer_sync(&ionic->watchdog_timer);
+	timer_delete_sync(&ionic->watchdog_timer);
 	cancel_work_sync(&lif->deferred.work);
=20
 	mutex_lock(&lif->queue_lock);
diff --git a/drivers/net/ethernet/qlogic/qla3xxx.c b/drivers/net/ethernet/qlo=
gic/qla3xxx.c
index fc78bc959ded..bf5bf8c95c85 100644
--- a/drivers/net/ethernet/qlogic/qla3xxx.c
+++ b/drivers/net/ethernet/qlogic/qla3xxx.c
@@ -3420,7 +3420,7 @@ static int ql_adapter_down(struct ql3_adapter *qdev, in=
t do_reset)
 		pci_disable_msi(qdev->pdev);
 	}
=20
-	del_timer_sync(&qdev->adapter_timer);
+	timer_delete_sync(&qdev->adapter_timer);
=20
 	napi_disable(&qdev->napi);
=20
diff --git a/drivers/net/ethernet/realtek/atp.c b/drivers/net/ethernet/realte=
k/atp.c
index 6cbcb3164367..c73a57e4a144 100644
--- a/drivers/net/ethernet/realtek/atp.c
+++ b/drivers/net/ethernet/realtek/atp.c
@@ -832,7 +832,7 @@ net_close(struct net_device *dev)
=20
 	netif_stop_queue(dev);
=20
-	del_timer_sync(&lp->timer);
+	timer_delete_sync(&lp->timer);
=20
 	/* Flush the Tx and disable Rx here. */
 	lp->addr_mode =3D CMR2h_OFF;
diff --git a/drivers/net/ethernet/rocker/rocker_ofdpa.c b/drivers/net/etherne=
t/rocker/rocker_ofdpa.c
index 826990459fa4..d5db26103d82 100644
--- a/drivers/net/ethernet/rocker/rocker_ofdpa.c
+++ b/drivers/net/ethernet/rocker/rocker_ofdpa.c
@@ -2386,7 +2386,7 @@ static void ofdpa_fini(struct rocker *rocker)
 	struct hlist_node *tmp;
 	int bkt;
=20
-	del_timer_sync(&ofdpa->fdb_cleanup_timer);
+	timer_delete_sync(&ofdpa->fdb_cleanup_timer);
 	flush_workqueue(rocker->rocker_owq);
=20
 	spin_lock_irqsave(&ofdpa->flow_tbl_lock, flags);
diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c b/drivers/net/et=
hernet/samsung/sxgbe/sxgbe_main.c
index 12c8396b6942..36b63bf343a9 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
@@ -91,7 +91,7 @@ void sxgbe_disable_eee_mode(struct sxgbe_priv_data * const =
priv)
 {
 	/* Exit and disable EEE in case of we are in LPI state. */
 	priv->hw->mac->reset_eee_mode(priv->ioaddr);
-	del_timer_sync(&priv->eee_ctrl_timer);
+	timer_delete_sync(&priv->eee_ctrl_timer);
 	priv->tx_path_in_lpi_mode =3D false;
 }
=20
@@ -1044,7 +1044,7 @@ static void sxgbe_tx_del_timer(struct sxgbe_priv_data *=
priv)
=20
 	SXGBE_FOR_EACH_QUEUE(SXGBE_TX_QUEUES, queue_num) {
 		struct sxgbe_tx_queue *p =3D priv->txq[queue_num];
-		del_timer_sync(&p->txtimer);
+		timer_delete_sync(&p->txtimer);
 	}
 }
=20
@@ -1208,7 +1208,7 @@ static int sxgbe_release(struct net_device *dev)
 	struct sxgbe_priv_data *priv =3D netdev_priv(dev);
=20
 	if (priv->eee_enabled)
-		del_timer_sync(&priv->eee_ctrl_timer);
+		timer_delete_sync(&priv->eee_ctrl_timer);
=20
 	/* Stop and disconnect the PHY */
 	if (dev->phydev) {
diff --git a/drivers/net/ethernet/seeq/ether3.c b/drivers/net/ethernet/seeq/e=
ther3.c
index 9319a2675e7b..1d65113fab76 100644
--- a/drivers/net/ethernet/seeq/ether3.c
+++ b/drivers/net/ethernet/seeq/ether3.c
@@ -181,7 +181,7 @@ static void ether3_ledoff(struct timer_list *t)
  */
 static inline void ether3_ledon(struct net_device *dev)
 {
-	del_timer(&priv(dev)->timer);
+	timer_delete(&priv(dev)->timer);
 	priv(dev)->timer.expires =3D jiffies + HZ / 50; /* leave on for 1/50th seco=
nd */
 	add_timer(&priv(dev)->timer);
 	if (priv(dev)->regs.config2 & CFG2_CTRLO)
@@ -454,7 +454,7 @@ static void ether3_timeout(struct net_device *dev, unsign=
ed int txqueue)
 {
 	unsigned long flags;
=20
-	del_timer(&priv(dev)->timer);
+	timer_delete(&priv(dev)->timer);
=20
 	local_irq_save(flags);
 	printk(KERN_ERR "%s: transmit timed out, network cable problem?\n", dev->na=
me);
@@ -851,7 +851,7 @@ static void ether3_remove(struct expansion_card *ec)
 	ecard_set_drvdata(ec, NULL);
=20
 	unregister_netdev(dev);
-	del_timer_sync(&priv(dev)->timer);
+	timer_delete_sync(&priv(dev)->timer);
 	free_netdev(dev);
 	ecard_release_resources(ec);
 }
diff --git a/drivers/net/ethernet/sfc/falcon/falcon.c b/drivers/net/ethernet/=
sfc/falcon/falcon.c
index 4af56333ea49..b865275beb66 100644
--- a/drivers/net/ethernet/sfc/falcon/falcon.c
+++ b/drivers/net/ethernet/sfc/falcon/falcon.c
@@ -2657,7 +2657,7 @@ void falcon_stop_nic_stats(struct ef4_nic *efx)
 	++nic_data->stats_disable_count;
 	spin_unlock_bh(&efx->stats_lock);
=20
-	del_timer_sync(&nic_data->stats_timer);
+	timer_delete_sync(&nic_data->stats_timer);
=20
 	/* Wait enough time for the most recent transfer to
 	 * complete. */
diff --git a/drivers/net/ethernet/sfc/falcon/rx.c b/drivers/net/ethernet/sfc/=
falcon/rx.c
index 6bbdb5d2eebf..38ad7ac07726 100644
--- a/drivers/net/ethernet/sfc/falcon/rx.c
+++ b/drivers/net/ethernet/sfc/falcon/rx.c
@@ -791,7 +791,7 @@ void ef4_fini_rx_queue(struct ef4_rx_queue *rx_queue)
 	netif_dbg(rx_queue->efx, drv, rx_queue->efx->net_dev,
 		  "shutting down RX queue %d\n", ef4_rx_queue_index(rx_queue));
=20
-	del_timer_sync(&rx_queue->slow_fill);
+	timer_delete_sync(&rx_queue->slow_fill);
=20
 	/* Release RX buffers from the current read ptr to the write ptr */
 	if (rx_queue->buffer) {
diff --git a/drivers/net/ethernet/sfc/mcdi.c b/drivers/net/ethernet/sfc/mcdi.c
index dbd2ee915838..dcef0588be96 100644
--- a/drivers/net/ethernet/sfc/mcdi.c
+++ b/drivers/net/ethernet/sfc/mcdi.c
@@ -530,7 +530,7 @@ static bool efx_mcdi_complete_async(struct efx_mcdi_iface=
 *mcdi, bool timeout)
 	 * of it aborting the next request.
 	 */
 	if (!timeout)
-		del_timer_sync(&mcdi->async_timer);
+		timer_delete_sync(&mcdi->async_timer);
=20
 	spin_lock(&mcdi->async_lock);
 	async =3D list_first_entry(&mcdi->async_list,
@@ -1122,7 +1122,7 @@ void efx_mcdi_flush_async(struct efx_nic *efx)
 	/* We must be in poll or fail mode so no more requests can be queued */
 	BUG_ON(mcdi->mode =3D=3D MCDI_MODE_EVENTS);
=20
-	del_timer_sync(&mcdi->async_timer);
+	timer_delete_sync(&mcdi->async_timer);
=20
 	/* If a request is still running, make sure we give the MC
 	 * time to complete it so that the response won't overwrite our
diff --git a/drivers/net/ethernet/sfc/rx_common.c b/drivers/net/ethernet/sfc/=
rx_common.c
index 4cc83203e188..8eb272ba674b 100644
--- a/drivers/net/ethernet/sfc/rx_common.c
+++ b/drivers/net/ethernet/sfc/rx_common.c
@@ -285,7 +285,7 @@ void efx_fini_rx_queue(struct efx_rx_queue *rx_queue)
 	netif_dbg(rx_queue->efx, drv, rx_queue->efx->net_dev,
 		  "shutting down RX queue %d\n", efx_rx_queue_index(rx_queue));
=20
-	del_timer_sync(&rx_queue->slow_fill);
+	timer_delete_sync(&rx_queue->slow_fill);
 	if (rx_queue->grant_credits)
 		flush_work(&rx_queue->grant_work);
=20
diff --git a/drivers/net/ethernet/sfc/siena/mcdi.c b/drivers/net/ethernet/sfc=
/siena/mcdi.c
index 3f7899daa86a..99ab5f294691 100644
--- a/drivers/net/ethernet/sfc/siena/mcdi.c
+++ b/drivers/net/ethernet/sfc/siena/mcdi.c
@@ -534,7 +534,7 @@ static bool efx_mcdi_complete_async(struct efx_mcdi_iface=
 *mcdi, bool timeout)
 	 * of it aborting the next request.
 	 */
 	if (!timeout)
-		del_timer_sync(&mcdi->async_timer);
+		timer_delete_sync(&mcdi->async_timer);
=20
 	spin_lock(&mcdi->async_lock);
 	async =3D list_first_entry(&mcdi->async_list,
@@ -1145,7 +1145,7 @@ void efx_siena_mcdi_flush_async(struct efx_nic *efx)
 	/* We must be in poll or fail mode so no more requests can be queued */
 	BUG_ON(mcdi->mode =3D=3D MCDI_MODE_EVENTS);
=20
-	del_timer_sync(&mcdi->async_timer);
+	timer_delete_sync(&mcdi->async_timer);
=20
 	/* If a request is still running, make sure we give the MC
 	 * time to complete it so that the response won't overwrite our
diff --git a/drivers/net/ethernet/sfc/siena/rx_common.c b/drivers/net/etherne=
t/sfc/siena/rx_common.c
index 2839d0e0a9c1..ab493e529d5c 100644
--- a/drivers/net/ethernet/sfc/siena/rx_common.c
+++ b/drivers/net/ethernet/sfc/siena/rx_common.c
@@ -284,7 +284,7 @@ void efx_siena_fini_rx_queue(struct efx_rx_queue *rx_queu=
e)
 	netif_dbg(rx_queue->efx, drv, rx_queue->efx->net_dev,
 		  "shutting down RX queue %d\n", efx_rx_queue_index(rx_queue));
=20
-	del_timer_sync(&rx_queue->slow_fill);
+	timer_delete_sync(&rx_queue->slow_fill);
=20
 	/* Release RX buffers from the current read ptr to the write ptr */
 	if (rx_queue->buffer) {
diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/i=
oc3-eth.c
index 4535579018c9..7196e1c607f3 100644
--- a/drivers/net/ethernet/sgi/ioc3-eth.c
+++ b/drivers/net/ethernet/sgi/ioc3-eth.c
@@ -718,7 +718,7 @@ static void ioc3_init(struct net_device *dev)
 	struct ioc3_private *ip =3D netdev_priv(dev);
 	struct ioc3_ethregs *regs =3D ip->regs;
=20
-	del_timer_sync(&ip->ioc3_timer);	/* Kill if running	*/
+	timer_delete_sync(&ip->ioc3_timer);	/* Kill if running	*/
=20
 	writel(EMCR_RST, &regs->emcr);		/* Reset		*/
 	readl(&regs->emcr);			/* Flush WB		*/
@@ -801,7 +801,7 @@ static int ioc3_close(struct net_device *dev)
 {
 	struct ioc3_private *ip =3D netdev_priv(dev);
=20
-	del_timer_sync(&ip->ioc3_timer);
+	timer_delete_sync(&ip->ioc3_timer);
=20
 	netif_stop_queue(dev);
=20
@@ -950,7 +950,7 @@ static int ioc3eth_probe(struct platform_device *pdev)
 	return 0;
=20
 out_stop:
-	del_timer_sync(&ip->ioc3_timer);
+	timer_delete_sync(&ip->ioc3_timer);
 	if (ip->rxr)
 		dma_free_coherent(ip->dma_dev, RX_RING_SIZE, ip->rxr,
 				  ip->rxr_dma);
@@ -971,7 +971,7 @@ static void ioc3eth_remove(struct platform_device *pdev)
 	dma_free_coherent(ip->dma_dev, TX_RING_SIZE + SZ_16K - 1, ip->tx_ring, ip->=
txr_dma);
=20
 	unregister_netdev(dev);
-	del_timer_sync(&ip->ioc3_timer);
+	timer_delete_sync(&ip->ioc3_timer);
 	free_netdev(dev);
 }
=20
diff --git a/drivers/net/ethernet/sis/sis190.c b/drivers/net/ethernet/sis/sis=
190.c
index dda4e488c77a..d10b14787607 100644
--- a/drivers/net/ethernet/sis/sis190.c
+++ b/drivers/net/ethernet/sis/sis190.c
@@ -758,7 +758,7 @@ static irqreturn_t sis190_irq(int irq, void *__dev)
=20
 	if (status & LinkChange) {
 		netif_info(tp, intr, dev, "link change\n");
-		del_timer(&tp->timer);
+		timer_delete(&tp->timer);
 		schedule_work(&tp->phy_task);
 	}
=20
@@ -1034,7 +1034,7 @@ static inline void sis190_delete_timer(struct net_devic=
e *dev)
 {
 	struct sis190_private *tp =3D netdev_priv(dev);
=20
-	del_timer_sync(&tp->timer);
+	timer_delete_sync(&tp->timer);
 }
=20
 static inline void sis190_request_timer(struct net_device *dev)
diff --git a/drivers/net/ethernet/sis/sis900.c b/drivers/net/ethernet/sis/sis=
900.c
index 85b850372efe..332cbd725900 100644
--- a/drivers/net/ethernet/sis/sis900.c
+++ b/drivers/net/ethernet/sis/sis900.c
@@ -1983,7 +1983,7 @@ static int sis900_close(struct net_device *net_dev)
 	/* Stop the chip's Tx and Rx Status Machine */
 	sw32(cr, RxDIS | TxDIS | sr32(cr));
=20
-	del_timer(&sis_priv->timer);
+	timer_delete(&sis_priv->timer);
=20
 	free_irq(pdev->irq, net_dev);
=20
diff --git a/drivers/net/ethernet/smsc/epic100.c b/drivers/net/ethernet/smsc/=
epic100.c
index 013e90d69182..ca0ab3a35b73 100644
--- a/drivers/net/ethernet/smsc/epic100.c
+++ b/drivers/net/ethernet/smsc/epic100.c
@@ -1292,7 +1292,7 @@ static int epic_close(struct net_device *dev)
 		netdev_dbg(dev, "Shutting down ethercard, status was %2.2x.\n",
 			   er32(INTSTAT));
=20
-	del_timer_sync(&ep->timer);
+	timer_delete_sync(&ep->timer);
=20
 	epic_disable_int(dev, ep);
=20
diff --git a/drivers/net/ethernet/smsc/smc91c92_cs.c b/drivers/net/ethernet/s=
msc/smc91c92_cs.c
index 86e3ec25df07..6fa957fb523b 100644
--- a/drivers/net/ethernet/smsc/smc91c92_cs.c
+++ b/drivers/net/ethernet/smsc/smc91c92_cs.c
@@ -1105,7 +1105,7 @@ static int smc_close(struct net_device *dev)
     outw(CTL_POWERDOWN, ioaddr + CONTROL );
=20
     link->open--;
-    del_timer_sync(&smc->media);
+    timer_delete_sync(&smc->media);
=20
     return 0;
 } /* smc_close */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/=
ethernet/stmicro/stmmac/stmmac_main.c
index 279532609707..59d07d0d3369 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -467,7 +467,7 @@ static void stmmac_try_to_start_sw_lpi(struct stmmac_priv=
 *priv)
  */
 static void stmmac_stop_sw_lpi(struct stmmac_priv *priv)
 {
-	del_timer_sync(&priv->eee_ctrl_timer);
+	timer_delete_sync(&priv->eee_ctrl_timer);
 	stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_DISABLE, false, 0);
 	priv->tx_path_in_lpi_mode =3D false;
 }
@@ -1082,7 +1082,7 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_co=
nfig *config)
=20
 	netdev_dbg(priv->dev, "disable EEE\n");
 	priv->eee_sw_timer_en =3D false;
-	del_timer_sync(&priv->eee_ctrl_timer);
+	timer_delete_sync(&priv->eee_ctrl_timer);
 	stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_DISABLE, false, 0);
 	priv->tx_path_in_lpi_mode =3D false;
=20
@@ -7842,7 +7842,7 @@ int stmmac_suspend(struct device *dev)
=20
 	if (priv->eee_sw_timer_en) {
 		priv->tx_path_in_lpi_mode =3D false;
-		del_timer_sync(&priv->eee_ctrl_timer);
+		timer_delete_sync(&priv->eee_ctrl_timer);
 	}
=20
 	/* Stop TX/RX DMA */
diff --git a/drivers/net/ethernet/sun/cassini.c b/drivers/net/ethernet/sun/ca=
ssini.c
index b8948d5b779a..b777e5a099eb 100644
--- a/drivers/net/ethernet/sun/cassini.c
+++ b/drivers/net/ethernet/sun/cassini.c
@@ -3779,7 +3779,7 @@ static void cas_shutdown(struct cas *cp)
 	/* Make us not-running to avoid timers respawning */
 	cp->hw_running =3D 0;
=20
-	del_timer_sync(&cp->link_timer);
+	timer_delete_sync(&cp->link_timer);
=20
 	/* Stop the reset task */
 #if 0
diff --git a/drivers/net/ethernet/sun/ldmvsw.c b/drivers/net/ethernet/sun/ldm=
vsw.c
index a9a6670b5ff1..6fc37ab27f7b 100644
--- a/drivers/net/ethernet/sun/ldmvsw.c
+++ b/drivers/net/ethernet/sun/ldmvsw.c
@@ -390,7 +390,7 @@ static int vsw_port_probe(struct vio_dev *vdev, const str=
uct vio_device_id *id)
 	return 0;
=20
 err_out_del_timer:
-	del_timer_sync(&port->clean_timer);
+	timer_delete_sync(&port->clean_timer);
 	list_del_rcu(&port->list);
 	synchronize_rcu();
 	netif_napi_del(&port->napi);
@@ -408,8 +408,8 @@ static void vsw_port_remove(struct vio_dev *vdev)
 	unsigned long flags;
=20
 	if (port) {
-		del_timer_sync(&port->vio.timer);
-		del_timer_sync(&port->clean_timer);
+		timer_delete_sync(&port->vio.timer);
+		timer_delete_sync(&port->clean_timer);
=20
 		napi_disable(&port->napi);
 		unregister_netdev(port->dev);
diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index 72177fea1cfb..73c07f10f053 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -6165,7 +6165,7 @@ static void niu_full_shutdown(struct niu *np, struct ne=
t_device *dev)
 	niu_disable_napi(np);
 	netif_tx_stop_all_queues(dev);
=20
-	del_timer_sync(&np->timer);
+	timer_delete_sync(&np->timer);
=20
 	spin_lock_irq(&np->lock);
=20
@@ -6511,7 +6511,7 @@ static void niu_reset_task(struct work_struct *work)
=20
 	spin_unlock_irqrestore(&np->lock, flags);
=20
-	del_timer_sync(&np->timer);
+	timer_delete_sync(&np->timer);
=20
 	niu_netif_stop(np);
=20
@@ -9914,7 +9914,7 @@ static int __maybe_unused niu_suspend(struct device *de=
v_d)
 	flush_work(&np->reset_task);
 	niu_netif_stop(np);
=20
-	del_timer_sync(&np->timer);
+	timer_delete_sync(&np->timer);
=20
 	spin_lock_irqsave(&np->lock, flags);
 	niu_enable_interrupts(np, 0);
diff --git a/drivers/net/ethernet/sun/sunbmac.c b/drivers/net/ethernet/sun/su=
nbmac.c
index bbb3a6ca19ed..d2c82102133c 100644
--- a/drivers/net/ethernet/sun/sunbmac.c
+++ b/drivers/net/ethernet/sun/sunbmac.c
@@ -931,7 +931,7 @@ static int bigmac_close(struct net_device *dev)
 {
 	struct bigmac *bp =3D netdev_priv(dev);
=20
-	del_timer(&bp->bigmac_timer);
+	timer_delete(&bp->bigmac_timer);
 	bp->timer_state =3D asleep;
 	bp->timer_ticks =3D 0;
=20
diff --git a/drivers/net/ethernet/sun/sungem.c b/drivers/net/ethernet/sun/sun=
gem.c
index 3e5f9b17c777..06579d7b5220 100644
--- a/drivers/net/ethernet/sun/sungem.c
+++ b/drivers/net/ethernet/sun/sungem.c
@@ -2180,7 +2180,7 @@ static void gem_do_stop(struct net_device *dev, int wol)
 	gem_disable_ints(gp);
=20
 	/* Stop the link timer */
-	del_timer_sync(&gp->link_timer);
+	timer_delete_sync(&gp->link_timer);
=20
 	/* We cannot cancel the reset task while holding the
 	 * rtnl lock, we'd get an A->B / B->A deadlock stituation
@@ -2230,7 +2230,7 @@ static void gem_reset_task(struct work_struct *work)
 	}
=20
 	/* Stop the link timer */
-	del_timer_sync(&gp->link_timer);
+	timer_delete_sync(&gp->link_timer);
=20
 	/* Stop NAPI and tx */
 	gem_netif_stop(gp);
@@ -2610,7 +2610,7 @@ static int gem_set_link_ksettings(struct net_device *de=
v,
=20
 	/* Apply settings and restart link process. */
 	if (netif_device_present(gp->dev)) {
-		del_timer_sync(&gp->link_timer);
+		timer_delete_sync(&gp->link_timer);
 		gem_begin_auto_negotiation(gp, cmd);
 	}
=20
@@ -2626,7 +2626,7 @@ static int gem_nway_reset(struct net_device *dev)
=20
 	/* Restart link process  */
 	if (netif_device_present(gp->dev)) {
-		del_timer_sync(&gp->link_timer);
+		timer_delete_sync(&gp->link_timer);
 		gem_begin_auto_negotiation(gp, NULL);
 	}
=20
diff --git a/drivers/net/ethernet/sun/sunhme.c b/drivers/net/ethernet/sun/sun=
hme.c
index 50ace461a1af..9a7586623318 100644
--- a/drivers/net/ethernet/sun/sunhme.c
+++ b/drivers/net/ethernet/sun/sunhme.c
@@ -1265,7 +1265,7 @@ static int happy_meal_init(struct happy_meal *hp)
 	u32 regtmp, rxcfg;
=20
 	/* If auto-negotiation timer is running, kill it. */
-	del_timer(&hp->happy_timer);
+	timer_delete(&hp->happy_timer);
=20
 	HMD("happy_flags[%08x]\n", hp->happy_flags);
 	if (!(hp->happy_flags & HFLAG_INIT)) {
@@ -1922,7 +1922,7 @@ static int happy_meal_close(struct net_device *dev)
 	happy_meal_clean_rings(hp);
=20
 	/* If auto-negotiation timer is running, kill it. */
-	del_timer(&hp->happy_timer);
+	timer_delete(&hp->happy_timer);
=20
 	spin_unlock_irq(&hp->happy_lock);
=20
@@ -2184,7 +2184,7 @@ static int hme_set_link_ksettings(struct net_device *de=
v,
=20
 	/* Ok, do it to it. */
 	spin_lock_irq(&hp->happy_lock);
-	del_timer(&hp->happy_timer);
+	timer_delete(&hp->happy_timer);
 	happy_meal_begin_auto_negotiation(hp, hp->tcvregs, cmd);
 	spin_unlock_irq(&hp->happy_lock);
=20
diff --git a/drivers/net/ethernet/sun/sunvnet.c b/drivers/net/ethernet/sun/su=
nvnet.c
index 1e887d951a04..a2a3e94da4b8 100644
--- a/drivers/net/ethernet/sun/sunvnet.c
+++ b/drivers/net/ethernet/sun/sunvnet.c
@@ -505,7 +505,7 @@ static void vnet_port_remove(struct vio_dev *vdev)
 	struct vnet_port *port =3D dev_get_drvdata(&vdev->dev);
=20
 	if (port) {
-		del_timer_sync(&port->vio.timer);
+		timer_delete_sync(&port->vio.timer);
=20
 		napi_disable(&port->napi);
=20
diff --git a/drivers/net/ethernet/sun/sunvnet_common.c b/drivers/net/ethernet=
/sun/sunvnet_common.c
index 1cacb2a0ee03..ddc6d46a7a86 100644
--- a/drivers/net/ethernet/sun/sunvnet_common.c
+++ b/drivers/net/ethernet/sun/sunvnet_common.c
@@ -1058,7 +1058,7 @@ void sunvnet_clean_timer_expire_common(struct timer_lis=
t *t)
 		(void)mod_timer(&port->clean_timer,
 				jiffies + VNET_CLEAN_TIMEOUT);
 	 else
-		del_timer(&port->clean_timer);
+		timer_delete(&port->clean_timer);
 }
 EXPORT_SYMBOL_GPL(sunvnet_clean_timer_expire_common);
=20
@@ -1513,7 +1513,7 @@ sunvnet_start_xmit_common(struct sk_buff *skb, struct n=
et_device *dev,
 		(void)mod_timer(&port->clean_timer,
 				jiffies + VNET_CLEAN_TIMEOUT);
 	else if (port)
-		del_timer(&port->clean_timer);
+		timer_delete(&port->clean_timer);
 	rcu_read_unlock();
 	dev_kfree_skb(skb);
 	vnet_free_skbs(freeskbs);
@@ -1707,7 +1707,7 @@ EXPORT_SYMBOL_GPL(sunvnet_port_free_tx_bufs_common);
=20
 void vnet_port_reset(struct vnet_port *port)
 {
-	del_timer(&port->clean_timer);
+	timer_delete(&port->clean_timer);
 	sunvnet_port_free_tx_bufs_common(port);
 	port->rmtu =3D 0;
 	port->tso =3D (port->vsw =3D=3D 0);  /* no tso in vsw, misbehaves in bridge=
 */
diff --git a/drivers/net/ethernet/synopsys/dwc-xlgmac-net.c b/drivers/net/eth=
ernet/synopsys/dwc-xlgmac-net.c
index d1793b6154c7..24e4b246f25f 100644
--- a/drivers/net/ethernet/synopsys/dwc-xlgmac-net.c
+++ b/drivers/net/ethernet/synopsys/dwc-xlgmac-net.c
@@ -405,7 +405,7 @@ static void xlgmac_stop_timers(struct xlgmac_pdata *pdata)
 		if (!channel->tx_ring)
 			break;
=20
-		del_timer_sync(&channel->tx_timer);
+		timer_delete_sync(&channel->tx_timer);
 	}
 }
=20
diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cps=
w_ale.c
index 5cc72a91f220..7f77694ecfba 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1287,7 +1287,7 @@ static void cpsw_ale_aging_stop(struct cpsw_ale *ale)
 		return;
 	}
=20
-	del_timer_sync(&ale->timer);
+	timer_delete_sync(&ale->timer);
 }
=20
 void cpsw_ale_start(struct cpsw_ale *ale)
diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/=
netcp_ethss.c
index 63e686f0b119..fd2b74508980 100644
--- a/drivers/net/ethernet/ti/netcp_ethss.c
+++ b/drivers/net/ethernet/ti/netcp_ethss.c
@@ -3796,7 +3796,7 @@ static int gbe_remove(struct netcp_device *netcp_device=
, void *inst_priv)
 {
 	struct gbe_priv *gbe_dev =3D inst_priv;
=20
-	del_timer_sync(&gbe_dev->timer);
+	timer_delete_sync(&gbe_dev->timer);
 	cpts_release(gbe_dev->cpts);
 	cpsw_ale_stop(gbe_dev->ale);
 	netcp_txpipe_close(&gbe_dev->tx_pipe);
diff --git a/drivers/net/ethernet/ti/tlan.c b/drivers/net/ethernet/ti/tlan.c
index b3da76efa8f5..d9240fb91747 100644
--- a/drivers/net/ethernet/ti/tlan.c
+++ b/drivers/net/ethernet/ti/tlan.c
@@ -332,13 +332,13 @@ static void tlan_stop(struct net_device *dev)
 {
 	struct tlan_priv *priv =3D netdev_priv(dev);
=20
-	del_timer_sync(&priv->media_timer);
+	timer_delete_sync(&priv->media_timer);
 	tlan_read_and_clear_stats(dev, TLAN_RECORD);
 	outl(TLAN_HC_AD_RST, dev->base_addr + TLAN_HOST_CMD);
 	/* Reset and power down phy */
 	tlan_reset_adapter(dev);
 	if (priv->timer.function !=3D NULL) {
-		del_timer_sync(&priv->timer);
+		timer_delete_sync(&priv->timer);
 		priv->timer.function =3D NULL;
 	}
 }
diff --git a/drivers/net/ethernet/tundra/tsi108_eth.c b/drivers/net/ethernet/=
tundra/tsi108_eth.c
index c6957e3b7f0f..7ec0e3c13d54 100644
--- a/drivers/net/ethernet/tundra/tsi108_eth.c
+++ b/drivers/net/ethernet/tundra/tsi108_eth.c
@@ -1379,7 +1379,7 @@ static int tsi108_close(struct net_device *dev)
 	netif_stop_queue(dev);
 	napi_disable(&data->napi);
=20
-	del_timer_sync(&data->timer);
+	timer_delete_sync(&data->timer);
=20
 	tsi108_stop_ethernet(dev);
 	tsi108_kill_phy(dev);
diff --git a/drivers/net/fddi/defza.c b/drivers/net/fddi/defza.c
index f5c25acaa577..54b7f24f3810 100644
--- a/drivers/net/fddi/defza.c
+++ b/drivers/net/fddi/defza.c
@@ -983,7 +983,7 @@ static irqreturn_t fza_interrupt(int irq, void *dev_id)
=20
 		case FZA_STATE_UNINITIALIZED:
 			netif_carrier_off(dev);
-			del_timer_sync(&fp->reset_timer);
+			timer_delete_sync(&fp->reset_timer);
 			fp->ring_cmd_index =3D 0;
 			fp->ring_uns_index =3D 0;
 			fp->ring_rmc_tx_index =3D 0;
@@ -1017,7 +1017,7 @@ static irqreturn_t fza_interrupt(int irq, void *dev_id)
 			fp->queue_active =3D 0;
 			netif_stop_queue(dev);
 			pr_debug("%s: queue stopped\n", fp->name);
-			del_timer_sync(&fp->reset_timer);
+			timer_delete_sync(&fp->reset_timer);
 			pr_warn("%s: halted, reason: %x\n", fp->name,
 				FZA_STATUS_GET_HALT(status));
 			fza_regs_dump(fp);
@@ -1227,7 +1227,7 @@ static int fza_close(struct net_device *dev)
 	netif_stop_queue(dev);
 	pr_debug("%s: queue stopped\n", fp->name);
=20
-	del_timer_sync(&fp->reset_timer);
+	timer_delete_sync(&fp->reset_timer);
 	spin_lock_irqsave(&fp->lock, flags);
 	fp->state =3D FZA_STATE_UNINITIALIZED;
 	fp->state_chg_flag =3D 0;
@@ -1493,7 +1493,7 @@ static int fza_probe(struct device *bdev)
 	return 0;
=20
 err_out_irq:
-	del_timer_sync(&fp->reset_timer);
+	timer_delete_sync(&fp->reset_timer);
 	fza_do_shutdown(fp);
 	free_irq(dev->irq, dev);
=20
@@ -1520,7 +1520,7 @@ static int fza_remove(struct device *bdev)
=20
 	unregister_netdev(dev);
=20
-	del_timer_sync(&fp->reset_timer);
+	timer_delete_sync(&fp->reset_timer);
 	fza_do_shutdown(fp);
 	free_irq(dev->irq, dev);
=20
diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 3bf6785f9057..b33d84ed5bbf 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -660,8 +660,8 @@ static void sixpack_close(struct tty_struct *tty)
=20
 	unregister_netdev(sp->dev);
=20
-	del_timer_sync(&sp->tx_t);
-	del_timer_sync(&sp->resync_t);
+	timer_delete_sync(&sp->tx_t);
+	timer_delete_sync(&sp->resync_t);
=20
 	/* Free all 6pack frame buffers after unreg. */
 	kfree(sp->xbuff);
@@ -937,7 +937,7 @@ sixpack_decode(struct sixpack *sp, const u8 *pre_rbuff, s=
ize_t count)
 		inbyte =3D pre_rbuff[count1];
 		if (inbyte =3D=3D SIXP_FOUND_TNC) {
 			tnc_set_sync_state(sp, TNC_IN_SYNC);
-			del_timer(&sp->resync_t);
+			timer_delete(&sp->resync_t);
 		}
 		if ((inbyte & SIXP_PRIO_CMD_MASK) !=3D 0)
 			decode_prio_command(sp, inbyte);
diff --git a/drivers/net/hamradio/scc.c b/drivers/net/hamradio/scc.c
index c71e52249289..f88721dec681 100644
--- a/drivers/net/hamradio/scc.c
+++ b/drivers/net/hamradio/scc.c
@@ -794,8 +794,8 @@ static inline void init_brg(struct scc_channel *scc)
 =20
 static void init_channel(struct scc_channel *scc)
 {
-	del_timer(&scc->tx_t);
-	del_timer(&scc->tx_wdog);
+	timer_delete(&scc->tx_t);
+	timer_delete(&scc->tx_wdog);
=20
 	disable_irq(scc->irq);
=20
@@ -999,7 +999,7 @@ static void __scc_start_tx_timer(struct scc_channel *scc,
 				 void (*handler)(struct timer_list *t),
 				 unsigned long when)
 {
-	del_timer(&scc->tx_t);
+	timer_delete(&scc->tx_t);
=20
 	if (when =3D=3D 0)
 	{
@@ -1029,7 +1029,7 @@ static void scc_start_defer(struct scc_channel *scc)
 	unsigned long flags;
 =09
 	spin_lock_irqsave(&scc->lock, flags);
-	del_timer(&scc->tx_wdog);
+	timer_delete(&scc->tx_wdog);
 =09
 	if (scc->kiss.maxdefer !=3D 0 && scc->kiss.maxdefer !=3D TIMER_OFF)
 	{
@@ -1045,7 +1045,7 @@ static void scc_start_maxkeyup(struct scc_channel *scc)
 	unsigned long flags;
 =09
 	spin_lock_irqsave(&scc->lock, flags);
-	del_timer(&scc->tx_wdog);
+	timer_delete(&scc->tx_wdog);
 =09
 	if (scc->kiss.maxkeyup !=3D 0 && scc->kiss.maxkeyup !=3D TIMER_OFF)
 	{
@@ -1194,7 +1194,7 @@ static void t_tail(struct timer_list *t)
 	unsigned long flags;
 =09
 	spin_lock_irqsave(&scc->lock, flags);=20
-	del_timer(&scc->tx_wdog);
+	timer_delete(&scc->tx_wdog);
 	scc_key_trx(scc, TX_OFF);
 	spin_unlock_irqrestore(&scc->lock, flags);
=20
@@ -1219,7 +1219,7 @@ static void t_busy(struct timer_list *t)
 {
 	struct scc_channel *scc =3D from_timer(scc, t, tx_wdog);
=20
-	del_timer(&scc->tx_t);
+	timer_delete(&scc->tx_t);
 	netif_stop_queue(scc->dev);	/* don't pile on the wabbit! */
=20
 	scc_discard_buffers(scc);
@@ -1248,7 +1248,7 @@ static void t_maxkeyup(struct timer_list *t)
 	netif_stop_queue(scc->dev);
 	scc_discard_buffers(scc);
=20
-	del_timer(&scc->tx_t);
+	timer_delete(&scc->tx_t);
=20
 	cl(scc, R1, TxINT_ENAB);	/* force an ABORT, but don't */
 	cl(scc, R15, TxUIE);		/* count it. */
@@ -1272,7 +1272,7 @@ static void t_idle(struct timer_list *t)
 {
 	struct scc_channel *scc =3D from_timer(scc, t, tx_t);
 =09
-	del_timer(&scc->tx_wdog);
+	timer_delete(&scc->tx_wdog);
=20
 	scc_key_trx(scc, TX_OFF);
 	if(scc->kiss.mintime)
@@ -1407,7 +1407,7 @@ static void scc_stop_calibrate(struct timer_list *t)
 	unsigned long flags;
 =09
 	spin_lock_irqsave(&scc->lock, flags);
-	del_timer(&scc->tx_wdog);
+	timer_delete(&scc->tx_wdog);
 	scc_key_trx(scc, TX_OFF);
 	wr(scc, R6, 0);
 	wr(scc, R7, FLAG);
@@ -1428,7 +1428,7 @@ scc_start_calibrate(struct scc_channel *scc, int durati=
on, unsigned char pattern
 	netif_stop_queue(scc->dev);
 	scc_discard_buffers(scc);
=20
-	del_timer(&scc->tx_wdog);
+	timer_delete(&scc->tx_wdog);
=20
 	scc->tx_wdog.function =3D scc_stop_calibrate;
 	scc->tx_wdog.expires =3D jiffies + HZ*duration;
@@ -1609,8 +1609,8 @@ static int scc_net_close(struct net_device *dev)
 	wr(scc,R3,0);
 	spin_unlock_irqrestore(&scc->lock, flags);
=20
-	del_timer_sync(&scc->tx_t);
-	del_timer_sync(&scc->tx_wdog);
+	timer_delete_sync(&scc->tx_t);
+	timer_delete_sync(&scc->tx_wdog);
 =09
 	scc_discard_buffers(scc);
=20
diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index 2ed2f836f09a..f29997b20fd7 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -1158,7 +1158,7 @@ static void __exit yam_cleanup_driver(void)
 	struct yam_mcs *p;
 	int i;
=20
-	del_timer_sync(&yam_timer);
+	timer_delete_sync(&yam_timer);
 	for (i =3D 0; i < NR_PORTS; i++) {
 		struct net_device *dev =3D yam_devs[i];
 		if (dev) {
diff --git a/drivers/net/hippi/rrunner.c b/drivers/net/hippi/rrunner.c
index aa8f828a0ae7..6342c319c0e4 100644
--- a/drivers/net/hippi/rrunner.c
+++ b/drivers/net/hippi/rrunner.c
@@ -1357,7 +1357,7 @@ static int rr_close(struct net_device *dev)
 	rrpriv->fw_running =3D 0;
=20
 	spin_unlock_irqrestore(&rrpriv->lock, flags);
-	del_timer_sync(&rrpriv->timer);
+	timer_delete_sync(&rrpriv->timer);
 	spin_lock_irqsave(&rrpriv->lock, flags);
=20
 	writel(0, &regs->TxPi);
diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
index ddda0c1e7a6d..0e0321a7ddd7 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -441,8 +441,8 @@ static enum hrtimer_restart nsim_napi_schedule(struct hrt=
imer *timer)
=20
 static void nsim_rq_timer_init(struct nsim_rq *rq)
 {
-	hrtimer_init(&rq->napi_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	rq->napi_timer.function =3D nsim_napi_schedule;
+	hrtimer_setup(&rq->napi_timer, nsim_napi_schedule, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
 }
=20
 static void nsim_enable_napi(struct netdevsim *ns)
diff --git a/drivers/net/ntb_netdev.c b/drivers/net/ntb_netdev.c
index ef6df0e37bea..ef4204638392 100644
--- a/drivers/net/ntb_netdev.c
+++ b/drivers/net/ntb_netdev.c
@@ -291,7 +291,7 @@ static int ntb_netdev_close(struct net_device *ndev)
 	while ((skb =3D ntb_transport_rx_remove(dev->qp, &len)))
 		dev_kfree_skb(skb);
=20
-	del_timer_sync(&dev->tx_timer);
+	timer_delete_sync(&dev->tx_timer);
=20
 	return 0;
 }
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 69ca765485db..b68369e2342b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -952,7 +952,7 @@ static unsigned int phylink_inband_caps(struct phylink *p=
l,
 static void phylink_pcs_poll_stop(struct phylink *pl)
 {
 	if (pl->cfg_link_an_mode =3D=3D MLO_AN_INBAND)
-		del_timer(&pl->link_poll);
+		timer_delete(&pl->link_poll);
 }
=20
 static void phylink_pcs_poll_start(struct phylink *pl)
@@ -2448,7 +2448,7 @@ void phylink_stop(struct phylink *pl)
 		sfp_upstream_stop(pl->sfp_bus);
 	if (pl->phydev)
 		phy_stop(pl->phydev);
-	del_timer_sync(&pl->link_poll);
+	timer_delete_sync(&pl->link_poll);
 	if (pl->link_irq) {
 		free_irq(pl->link_irq, pl);
 		pl->link_irq =3D 0;
diff --git a/drivers/net/slip/slip.c b/drivers/net/slip/slip.c
index fb362ee248ff..3cfa17cd5073 100644
--- a/drivers/net/slip/slip.c
+++ b/drivers/net/slip/slip.c
@@ -899,8 +899,8 @@ static void slip_close(struct tty_struct *tty)
=20
 	/* VSV =3D very important to remove timers */
 #ifdef CONFIG_SLIP_SMART
-	del_timer_sync(&sl->keepalive_timer);
-	del_timer_sync(&sl->outfill_timer);
+	timer_delete_sync(&sl->keepalive_timer);
+	timer_delete_sync(&sl->outfill_timer);
 #endif
 	/* Flush network side */
 	unregister_netdev(sl->dev);
@@ -1137,7 +1137,7 @@ static int slip_ioctl(struct tty_struct *tty, unsigned =
int cmd,
 					jiffies + sl->keepalive * HZ);
 			set_bit(SLF_KEEPTEST, &sl->flags);
 		} else
-			del_timer(&sl->keepalive_timer);
+			timer_delete(&sl->keepalive_timer);
 		spin_unlock_bh(&sl->lock);
 		return 0;
=20
@@ -1162,7 +1162,7 @@ static int slip_ioctl(struct tty_struct *tty, unsigned =
int cmd,
 						jiffies + sl->outfill * HZ);
 			set_bit(SLF_OUTWAIT, &sl->flags);
 		} else
-			del_timer(&sl->outfill_timer);
+			timer_delete(&sl->outfill_timer);
 		spin_unlock_bh(&sl->lock);
 		return 0;
=20
@@ -1217,7 +1217,7 @@ static int sl_siocdevprivate(struct net_device *dev, st=
ruct ifreq *rq,
 						jiffies + sl->keepalive * HZ);
 			set_bit(SLF_KEEPTEST, &sl->flags);
 		} else
-			del_timer(&sl->keepalive_timer);
+			timer_delete(&sl->keepalive_timer);
 		break;
=20
 	case SIOCGKEEPALIVE:
@@ -1235,7 +1235,7 @@ static int sl_siocdevprivate(struct net_device *dev, st=
ruct ifreq *rq,
 						jiffies + sl->outfill * HZ);
 			set_bit(SLF_OUTWAIT, &sl->flags);
 		} else
-			del_timer(&sl->outfill_timer);
+			timer_delete(&sl->outfill_timer);
 		break;
=20
 	case SIOCGOUTFILL:
@@ -1421,7 +1421,7 @@ static void sl_keepalive(struct timer_list *t)
 			/* keepalive still high :(, we must hangup */
 			if (sl->outfill)
 				/* outfill timer must be deleted too */
-				(void)del_timer(&sl->outfill_timer);
+				(void) timer_delete(&sl->outfill_timer);
 			printk(KERN_DEBUG "%s: no packets received during keepalive timeout, hang=
up.\n", sl->dev->name);
 			/* this must hangup tty & close slip */
 			tty_hangup(sl->tty);
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index f75f912a0225..7babd1e9a378 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1295,7 +1295,7 @@ static void tun_flow_init(struct tun_struct *tun)
=20
 static void tun_flow_uninit(struct tun_struct *tun)
 {
-	del_timer_sync(&tun->flow_gc_timer);
+	timer_delete_sync(&tun->flow_gc_timer);
 	tun_flow_flush(tun);
 }
=20
diff --git a/drivers/net/usb/catc.c b/drivers/net/usb/catc.c
index ff439ef535ac..fc5e441aa7c3 100644
--- a/drivers/net/usb/catc.c
+++ b/drivers/net/usb/catc.c
@@ -738,7 +738,7 @@ static int catc_stop(struct net_device *netdev)
 	netif_stop_queue(netdev);
=20
 	if (!catc->is_f5u011)
-		del_timer_sync(&catc->timer);
+		timer_delete_sync(&catc->timer);
=20
 	usb_kill_urb(catc->rx_urb);
 	usb_kill_urb(catc->tx_urb);
diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 137adf6d5b08..e4f1663b6204 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1661,7 +1661,7 @@ static int lan78xx_link_reset(struct lan78xx_net *dev)
 		if (ret < 0)
 			return ret;
=20
-		del_timer(&dev->stat_monitor);
+		timer_delete(&dev->stat_monitor);
 	} else if (link && !dev->link_on) {
 		dev->link_on =3D true;
=20
@@ -3304,7 +3304,7 @@ static int lan78xx_stop(struct net_device *net)
 	mutex_lock(&dev->dev_mutex);
=20
 	if (timer_pending(&dev->stat_monitor))
-		del_timer_sync(&dev->stat_monitor);
+		timer_delete_sync(&dev->stat_monitor);
=20
 	clear_bit(EVENT_DEV_OPEN, &dev->flags);
 	netif_stop_queue(net);
@@ -4938,7 +4938,7 @@ static int lan78xx_suspend(struct usb_interface *intf, =
pm_message_t message)
 		/* reattach */
 		netif_device_attach(dev->net);
=20
-		del_timer(&dev->stat_monitor);
+		timer_delete(&dev->stat_monitor);
=20
 		if (PMSG_IS_AUTO(message)) {
 			ret =3D lan78xx_set_auto_suspend(dev);
diff --git a/drivers/net/usb/sierra_net.c b/drivers/net/usb/sierra_net.c
index 3d239b8d1a1b..dec6e82eb0e0 100644
--- a/drivers/net/usb/sierra_net.c
+++ b/drivers/net/usb/sierra_net.c
@@ -522,7 +522,7 @@ static void sierra_net_kevent(struct work_struct *work)
 						" stopping sync timer",
 						hh.msgspecific.byte);
 				/* Got sync resp - stop timer & clear mask */
-				del_timer_sync(&priv->sync_timer);
+				timer_delete_sync(&priv->sync_timer);
 				clear_bit(SIERRA_NET_TIMER_EXPIRY,
 					  &priv->kevent_flags);
 				break;
diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 724b93aa4f7e..c39dfa17813a 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -860,7 +860,7 @@ int usbnet_stop (struct net_device *net)
=20
 	/* deferred work (timer, softirq, task) must also stop */
 	dev->flags =3D 0;
-	del_timer_sync(&dev->delay);
+	timer_delete_sync(&dev->delay);
 	tasklet_kill(&dev->bh);
 	cancel_work_sync(&dev->kevent);
=20
@@ -869,7 +869,7 @@ int usbnet_stop (struct net_device *net)
 	 * we have a flag
 	 */
 	tasklet_kill(&dev->bh);
-	del_timer_sync(&dev->delay);
+	timer_delete_sync(&dev->delay);
 	cancel_work_sync(&dev->kevent);
=20
 	if (!pm)
@@ -1882,7 +1882,7 @@ usbnet_probe (struct usb_interface *udev, const struct =
usb_device_id *prod)
 	 */
 	usbnet_mark_going_away(dev);
 	cancel_work_sync(&dev->kevent);
-	del_timer_sync(&dev->delay);
+	timer_delete_sync(&dev->delay);
 	free_netdev(net);
 out:
 	return status;
diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index 8c49e903cb3a..9ccc3f09f71b 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -3193,7 +3193,7 @@ static int vxlan_stop(struct net_device *dev)
=20
 	vxlan_multicast_leave(vxlan);
=20
-	del_timer_sync(&vxlan->age_timer);
+	timer_delete_sync(&vxlan->age_timer);
=20
 	vxlan_flush(vxlan, &desc);
 	vxlan_sock_release(vxlan);
diff --git a/drivers/net/wan/hdlc_cisco.c b/drivers/net/wan/hdlc_cisco.c
index cdebe65a7e2d..7e653432c139 100644
--- a/drivers/net/wan/hdlc_cisco.c
+++ b/drivers/net/wan/hdlc_cisco.c
@@ -285,7 +285,7 @@ static void cisco_stop(struct net_device *dev)
 	struct cisco_state *st =3D state(hdlc);
 	unsigned long flags;
=20
-	del_timer_sync(&st->timer);
+	timer_delete_sync(&st->timer);
=20
 	spin_lock_irqsave(&st->lock, flags);
 	netif_dormant_on(dev);
diff --git a/drivers/net/wan/hdlc_fr.c b/drivers/net/wan/hdlc_fr.c
index 81e72bc1891f..34014f427060 100644
--- a/drivers/net/wan/hdlc_fr.c
+++ b/drivers/net/wan/hdlc_fr.c
@@ -1025,7 +1025,7 @@ static void fr_stop(struct net_device *dev)
 	printk(KERN_DEBUG "fr_stop\n");
 #endif
 	if (state(hdlc)->settings.lmi !=3D LMI_NONE)
-		del_timer_sync(&state(hdlc)->timer);
+		timer_delete_sync(&state(hdlc)->timer);
 	fr_set_link_state(0, dev);
 }
=20
diff --git a/drivers/net/wan/hdlc_ppp.c b/drivers/net/wan/hdlc_ppp.c
index 37a3c989cba1..19921b02846d 100644
--- a/drivers/net/wan/hdlc_ppp.c
+++ b/drivers/net/wan/hdlc_ppp.c
@@ -358,7 +358,7 @@ static void ppp_cp_event(struct net_device *dev, u16 pid,=
 u16 event, u8 code,
 		}
 	}
 	if (old_state !=3D CLOSED && proto->state =3D=3D CLOSED)
-		del_timer(&proto->timer);
+		timer_delete(&proto->timer);
=20
 #if DEBUG_STATE
 	printk(KERN_DEBUG "%s: %s ppp_cp_event(%s) ... %s\n", dev->name,
diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index c496d35b266d..3ffeeba5dccf 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -81,7 +81,7 @@ static int wg_pm_notification(struct notifier_block *nb, un=
signed long action, v
 	list_for_each_entry(wg, &device_list, device_list) {
 		mutex_lock(&wg->device_update_lock);
 		list_for_each_entry(peer, &wg->peer_list, peer_list) {
-			del_timer(&peer->timer_zero_key_material);
+			timer_delete(&peer->timer_zero_key_material);
 			wg_noise_handshake_clear(&peer->handshake);
 			wg_noise_keypairs_clear(&peer->keypairs);
 		}
diff --git a/drivers/net/wireguard/timers.c b/drivers/net/wireguard/timers.c
index 968bdb4df0b3..a9e0890c2f77 100644
--- a/drivers/net/wireguard/timers.c
+++ b/drivers/net/wireguard/timers.c
@@ -48,7 +48,7 @@ static void wg_expired_retransmit_handshake(struct timer_li=
st *timer)
 			 peer->device->dev->name, peer->internal_id,
 			 &peer->endpoint.addr, (int)MAX_TIMER_HANDSHAKES + 2);
=20
-		del_timer(&peer->timer_send_keepalive);
+		timer_delete(&peer->timer_send_keepalive);
 		/* We drop all packets without a keypair and don't try again,
 		 * if we try unsuccessfully for too long to make a handshake.
 		 */
@@ -167,7 +167,7 @@ void wg_timers_data_received(struct wg_peer *peer)
  */
 void wg_timers_any_authenticated_packet_sent(struct wg_peer *peer)
 {
-	del_timer(&peer->timer_send_keepalive);
+	timer_delete(&peer->timer_send_keepalive);
 }
=20
 /* Should be called after any type of authenticated packet is received, whet=
her
@@ -175,7 +175,7 @@ void wg_timers_any_authenticated_packet_sent(struct wg_pe=
er *peer)
  */
 void wg_timers_any_authenticated_packet_received(struct wg_peer *peer)
 {
-	del_timer(&peer->timer_new_handshake);
+	timer_delete(&peer->timer_new_handshake);
 }
=20
 /* Should be called after a handshake initiation message is sent. */
@@ -191,7 +191,7 @@ void wg_timers_handshake_initiated(struct wg_peer *peer)
  */
 void wg_timers_handshake_complete(struct wg_peer *peer)
 {
-	del_timer(&peer->timer_retransmit_handshake);
+	timer_delete(&peer->timer_retransmit_handshake);
 	peer->timer_handshake_attempts =3D 0;
 	peer->sent_lastminute_handshake =3D false;
 	ktime_get_real_ts64(&peer->walltime_last_handshake);
diff --git a/drivers/net/wireless/ath/ar5523/ar5523.c b/drivers/net/wireless/=
ath/ar5523/ar5523.c
index 156f3650c006..96dc2778022a 100644
--- a/drivers/net/wireless/ath/ar5523/ar5523.c
+++ b/drivers/net/wireless/ath/ar5523/ar5523.c
@@ -733,7 +733,7 @@ static void ar5523_data_tx_pkt_put(struct ar5523 *ar)
 {
 	atomic_dec(&ar->tx_nr_total);
 	if (!atomic_dec_return(&ar->tx_nr_pending)) {
-		del_timer(&ar->tx_wd_timer);
+		timer_delete(&ar->tx_wd_timer);
 		wake_up(&ar->tx_flush_waitq);
 	}
=20
@@ -1076,7 +1076,7 @@ static void ar5523_stop(struct ieee80211_hw *hw, bool s=
uspend)
=20
 	ar5523_cmd_write(ar, WDCMSG_TARGET_STOP, NULL, 0, 0);
=20
-	del_timer_sync(&ar->tx_wd_timer);
+	timer_delete_sync(&ar->tx_wd_timer);
 	cancel_work_sync(&ar->tx_wd_work);
 	cancel_work_sync(&ar->rx_refill_work);
 	ar5523_cancel_rx_bufs(ar);
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/a=
th/ath10k/debug.c
index 35bfe7232e95..a0c1afeda4dd 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1751,7 +1751,7 @@ void ath10k_debug_stop(struct ath10k *ar)
=20
 	/* Must not use _sync to avoid deadlock, we do that in
 	 * ath10k_debug_destroy(). The check for htt_stats_mask is to avoid
-	 * warning from del_timer().
+	 * warning from timer_delete().
 	 */
 	if (ar->debug.htt_stats_mask !=3D 0)
 		cancel_delayed_work(&ar->debug.htt_stats_dwork);
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/=
ath/ath10k/htt_rx.c
index 7d28ae5453cf..83eab7479f06 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -287,7 +287,7 @@ void ath10k_htt_rx_free(struct ath10k_htt *htt)
 	if (htt->ar->bus_param.dev_type =3D=3D ATH10K_DEV_TYPE_HL)
 		return;
=20
-	del_timer_sync(&htt->rx_ring.refill_retry_timer);
+	timer_delete_sync(&htt->rx_ring.refill_retry_timer);
=20
 	skb_queue_purge(&htt->rx_msdus_q);
 	skb_queue_purge(&htt->rx_in_ord_compl_q);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath=
/ath10k/pci.c
index c52a16f8078f..fb2c60ee433c 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -619,7 +619,7 @@ static void ath10k_pci_sleep_sync(struct ath10k *ar)
 		return;
 	}
=20
-	del_timer_sync(&ar_pci->ps_timer);
+	timer_delete_sync(&ar_pci->ps_timer);
=20
 	spin_lock_irqsave(&ar_pci->ps_lock, flags);
 	WARN_ON(ar_pci->ps_wake_refcount > 0);
@@ -1817,7 +1817,7 @@ static void ath10k_pci_rx_retry_sync(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci =3D ath10k_pci_priv(ar);
=20
-	del_timer_sync(&ar_pci->rx_post_retry);
+	timer_delete_sync(&ar_pci->rx_post_retry);
 }
=20
 int ath10k_pci_hif_map_service_to_pipe(struct ath10k *ar, u16 service_id,
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/at=
h/ath10k/sdio.c
index 6805357ee29e..7ce74b4ef201 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1621,7 +1621,7 @@ static void ath10k_sdio_hif_power_down(struct ath10k *a=
r)
=20
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power off\n");
=20
-	del_timer_sync(&ar_sdio->sleep_timer);
+	timer_delete_sync(&ar_sdio->sleep_timer);
 	ath10k_sdio_set_mbox_sleep(ar, true);
=20
 	/* Disable the card */
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/at=
h/ath10k/snoc.c
index d436a874cd5a..866bad2db334 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -911,7 +911,7 @@ static void ath10k_snoc_buffer_cleanup(struct ath10k *ar)
 	struct ath10k_snoc_pipe *pipe_info;
 	int pipe_num;
=20
-	del_timer_sync(&ar_snoc->rx_post_retry);
+	timer_delete_sync(&ar_snoc->rx_post_retry);
 	for (pipe_num =3D 0; pipe_num < CE_COUNT; pipe_num++) {
 		pipe_info =3D &ar_snoc->pipe_info[pipe_num];
 		ath10k_snoc_rx_pipe_cleanup(pipe_info);
diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath=
/ath11k/ahb.c
index eedba3766ba2..2f862f8f10ca 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -397,7 +397,7 @@ static void ath11k_ahb_stop(struct ath11k_base *ab)
 		ath11k_ahb_ce_irqs_disable(ab);
 	ath11k_ahb_sync_ce_irqs(ab);
 	ath11k_ahb_kill_tasklets(ab);
-	del_timer_sync(&ab->rx_replenish_retry);
+	timer_delete_sync(&ab->rx_replenish_retry);
 	ath11k_ce_cleanup_pipes(ab);
 }
=20
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/=
ath11k/dp.c
index f124b7329e1a..3a544e5fefca 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -875,7 +875,7 @@ void ath11k_dp_pdev_free(struct ath11k_base *ab)
 	struct ath11k *ar;
 	int i;
=20
-	del_timer_sync(&ab->mon_reap_timer);
+	timer_delete_sync(&ab->mon_reap_timer);
=20
 	for (i =3D 0; i < ab->num_radios; i++) {
 		ar =3D ab->pdevs[i].ar;
@@ -1170,7 +1170,7 @@ void ath11k_dp_shadow_stop_timer(struct ath11k_base *ab,
 	if (!update_timer->init)
 		return;
=20
-	del_timer_sync(&update_timer->timer);
+	timer_delete_sync(&update_timer->timer);
 }
=20
 void ath11k_dp_shadow_init_timer(struct ath11k_base *ab,
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/a=
th/ath11k/dp_rx.c
index f2bdbac2a0b7..218ab41c0f3c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -906,7 +906,7 @@ void ath11k_peer_frags_flush(struct ath11k *ar, struct at=
h11k_peer *peer)
 		rx_tid =3D &peer->rx_tid[i];
=20
 		spin_unlock_bh(&ar->ab->base_lock);
-		del_timer_sync(&rx_tid->frag_timer);
+		timer_delete_sync(&rx_tid->frag_timer);
 		spin_lock_bh(&ar->ab->base_lock);
=20
 		ath11k_dp_rx_frags_cleanup(rx_tid, true);
@@ -927,7 +927,7 @@ void ath11k_peer_rx_tid_cleanup(struct ath11k *ar, struct=
 ath11k_peer *peer)
 		ath11k_dp_rx_frags_cleanup(rx_tid, true);
=20
 		spin_unlock_bh(&ar->ab->base_lock);
-		del_timer_sync(&rx_tid->frag_timer);
+		timer_delete_sync(&rx_tid->frag_timer);
 		spin_lock_bh(&ar->ab->base_lock);
 	}
 }
@@ -3710,7 +3710,7 @@ static int ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
 	}
=20
 	spin_unlock_bh(&ab->base_lock);
-	del_timer_sync(&rx_tid->frag_timer);
+	timer_delete_sync(&rx_tid->frag_timer);
 	spin_lock_bh(&ab->base_lock);
=20
 	peer =3D ath11k_peer_find_by_id(ab, peer_id);
@@ -5781,7 +5781,7 @@ int ath11k_dp_rx_pktlog_stop(struct ath11k_base *ab, bo=
ol stop_timer)
 	int ret;
=20
 	if (stop_timer)
-		del_timer_sync(&ab->mon_reap_timer);
+		timer_delete_sync(&ab->mon_reap_timer);
=20
 	/* reap all the monitor related rings */
 	ret =3D ath11k_dp_purge_mon_ring(ab);
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/=
ath12k/dp.c
index b1f27c3ac723..50c36e6ea102 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -985,7 +985,7 @@ void ath12k_dp_pdev_free(struct ath12k_base *ab)
 	if (!ab->mon_reap_timer.function)
 		return;
=20
-	del_timer_sync(&ab->mon_reap_timer);
+	timer_delete_sync(&ab->mon_reap_timer);
=20
 	for (i =3D 0; i < ab->num_radios; i++)
 		ath12k_dp_rx_pdev_free(ab, i);
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/a=
th/ath12k/dp_rx.c
index ff6a709b5042..75bf4211ad42 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -895,7 +895,7 @@ void ath12k_dp_rx_peer_tid_cleanup(struct ath12k *ar, str=
uct ath12k_peer *peer)
 		ath12k_dp_rx_frags_cleanup(rx_tid, true);
=20
 		spin_unlock_bh(&ar->ab->base_lock);
-		del_timer_sync(&rx_tid->frag_timer);
+		timer_delete_sync(&rx_tid->frag_timer);
 		spin_lock_bh(&ar->ab->base_lock);
 	}
 }
@@ -3451,7 +3451,7 @@ static int ath12k_dp_rx_frag_h_mpdu(struct ath12k *ar,
 	}
=20
 	spin_unlock_bh(&ab->base_lock);
-	del_timer_sync(&rx_tid->frag_timer);
+	timer_delete_sync(&rx_tid->frag_timer);
 	spin_lock_bh(&ab->base_lock);
=20
 	peer =3D ath12k_peer_find_by_id(ab, peer_id);
diff --git a/drivers/net/wireless/ath/ath6kl/cfg80211.c b/drivers/net/wireles=
s/ath/ath6kl/cfg80211.c
index 72ce321f2a77..8c2e8081112e 100644
--- a/drivers/net/wireless/ath/ath6kl/cfg80211.c
+++ b/drivers/net/wireless/ath/ath6kl/cfg80211.c
@@ -149,7 +149,7 @@ static bool __ath6kl_cfg80211_sscan_stop(struct ath6kl_vi=
f *vif)
 	if (!test_and_clear_bit(SCHED_SCANNING, &vif->flags))
 		return false;
=20
-	del_timer_sync(&vif->sched_scan_timer);
+	timer_delete_sync(&vif->sched_scan_timer);
=20
 	if (ar->state =3D=3D ATH6KL_STATE_RECOVERY)
 		return true;
@@ -1200,7 +1200,7 @@ static int ath6kl_cfg80211_add_key(struct wiphy *wiphy,=
 struct net_device *ndev,
 	if (((vif->auth_mode =3D=3D WPA_PSK_AUTH) ||
 	     (vif->auth_mode =3D=3D WPA2_PSK_AUTH)) &&
 	    (key_usage & GROUP_USAGE))
-		del_timer(&vif->disconnect_timer);
+		timer_delete(&vif->disconnect_timer);
=20
 	ath6kl_dbg(ATH6KL_DBG_WLAN_CFG,
 		   "%s: index %d, key_len %d, key_type 0x%x, key_usage 0x%x, seq_len %d\n",
@@ -3612,7 +3612,7 @@ void ath6kl_cfg80211_vif_stop(struct ath6kl_vif *vif, b=
ool wmi_ready)
 		discon_issued =3D test_bit(CONNECTED, &vif->flags) ||
 				test_bit(CONNECT_PEND, &vif->flags);
 		ath6kl_disconnect(vif);
-		del_timer(&vif->disconnect_timer);
+		timer_delete(&vif->disconnect_timer);
=20
 		if (discon_issued)
 			ath6kl_disconnect_event(vif, DISCONNECT_CMD,
diff --git a/drivers/net/wireless/ath/ath6kl/init.c b/drivers/net/wireless/at=
h/ath6kl/init.c
index 15f455adb860..9b100ee2ebc3 100644
--- a/drivers/net/wireless/ath/ath6kl/init.c
+++ b/drivers/net/wireless/ath/ath6kl/init.c
@@ -1915,7 +1915,7 @@ void ath6kl_stop_txrx(struct ath6kl *ar)
 	clear_bit(WMI_READY, &ar->flag);
=20
 	if (ar->fw_recovery.enable)
-		del_timer_sync(&ar->fw_recovery.hb_timer);
+		timer_delete_sync(&ar->fw_recovery.hb_timer);
=20
 	/*
 	 * After wmi_shudown all WMI events will be dropped. We
diff --git a/drivers/net/wireless/ath/ath6kl/main.c b/drivers/net/wireless/at=
h/ath6kl/main.c
index 8f9fe23e9755..867089a3c096 100644
--- a/drivers/net/wireless/ath/ath6kl/main.c
+++ b/drivers/net/wireless/ath/ath6kl/main.c
@@ -1027,7 +1027,7 @@ void ath6kl_disconnect_event(struct ath6kl_vif *vif, u8=
 reason, u8 *bssid,
=20
 	aggr_reset_state(vif->aggr_cntxt->aggr_conn);
=20
-	del_timer(&vif->disconnect_timer);
+	timer_delete(&vif->disconnect_timer);
=20
 	ath6kl_dbg(ATH6KL_DBG_WLAN_CFG, "disconnect reason is %d\n", reason);
=20
diff --git a/drivers/net/wireless/ath/ath6kl/recovery.c b/drivers/net/wireles=
s/ath/ath6kl/recovery.c
index c09e40c9010f..fd2dceb8b63d 100644
--- a/drivers/net/wireless/ath/ath6kl/recovery.c
+++ b/drivers/net/wireless/ath/ath6kl/recovery.c
@@ -25,7 +25,7 @@ static void ath6kl_recovery_work(struct work_struct *work)
=20
 	ar->state =3D ATH6KL_STATE_RECOVERY;
=20
-	del_timer_sync(&ar->fw_recovery.hb_timer);
+	timer_delete_sync(&ar->fw_recovery.hb_timer);
=20
 	ath6kl_init_hw_restart(ar);
=20
@@ -119,7 +119,7 @@ void ath6kl_recovery_cleanup(struct ath6kl *ar)
=20
 	set_bit(RECOVERY_CLEANUP, &ar->flag);
=20
-	del_timer_sync(&ar->fw_recovery.hb_timer);
+	timer_delete_sync(&ar->fw_recovery.hb_timer);
 	cancel_work_sync(&ar->fw_recovery.recovery_work);
 }
=20
diff --git a/drivers/net/wireless/ath/ath6kl/txrx.c b/drivers/net/wireless/at=
h/ath6kl/txrx.c
index 80e66acc5cf6..3a6f0b647e17 100644
--- a/drivers/net/wireless/ath/ath6kl/txrx.c
+++ b/drivers/net/wireless/ath/ath6kl/txrx.c
@@ -1827,7 +1827,7 @@ void aggr_reset_state(struct aggr_info_conn *aggr_conn)
 		return;
=20
 	if (aggr_conn->timer_scheduled) {
-		del_timer(&aggr_conn->timer);
+		timer_delete(&aggr_conn->timer);
 		aggr_conn->timer_scheduled =3D false;
 	}
=20
diff --git a/drivers/net/wireless/ath/ath9k/channel.c b/drivers/net/wireless/=
ath/ath9k/channel.c
index bae24e3d3168..799be0be24f4 100644
--- a/drivers/net/wireless/ath/ath9k/channel.c
+++ b/drivers/net/wireless/ath/ath9k/channel.c
@@ -1556,7 +1556,7 @@ void ath9k_p2p_ps_timer(void *priv)
 	struct ath_node *an;
 	u32 tsf;
=20
-	del_timer_sync(&sc->sched.timer);
+	timer_delete_sync(&sc->sched.timer);
 	ath9k_hw_gen_timer_stop(sc->sc_ah, sc->p2p_ps_timer);
 	ath_chanctx_event(sc, NULL, ATH_CHANCTX_EVENT_TSF_TIMER);
=20
diff --git a/drivers/net/wireless/ath/ath9k/gpio.c b/drivers/net/wireless/ath=
/ath9k/gpio.c
index b457e52dd365..5a26f1d05f04 100644
--- a/drivers/net/wireless/ath/ath9k/gpio.c
+++ b/drivers/net/wireless/ath/ath9k/gpio.c
@@ -305,7 +305,7 @@ void ath9k_btcoex_timer_resume(struct ath_softc *sc)
 	ath_dbg(ath9k_hw_common(ah), BTCOEX, "Starting btcoex timers\n");
=20
 	/* make sure duty cycle timer is also stopped when resuming */
-	del_timer_sync(&btcoex->no_stomp_timer);
+	timer_delete_sync(&btcoex->no_stomp_timer);
=20
 	btcoex->bt_priority_cnt =3D 0;
 	btcoex->bt_priority_time =3D jiffies;
@@ -329,15 +329,15 @@ void ath9k_btcoex_timer_pause(struct ath_softc *sc)
=20
 	ath_dbg(ath9k_hw_common(ah), BTCOEX, "Stopping btcoex timers\n");
=20
-	del_timer_sync(&btcoex->period_timer);
-	del_timer_sync(&btcoex->no_stomp_timer);
+	timer_delete_sync(&btcoex->period_timer);
+	timer_delete_sync(&btcoex->no_stomp_timer);
 }
=20
 void ath9k_btcoex_stop_gen_timer(struct ath_softc *sc)
 {
 	struct ath_btcoex *btcoex =3D &sc->btcoex;
=20
-	del_timer_sync(&btcoex->no_stomp_timer);
+	timer_delete_sync(&btcoex->no_stomp_timer);
 }
=20
 u16 ath9k_btcoex_aggr_limit(struct ath_softc *sc, u32 max_4ms_framelen)
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wire=
less/ath/ath9k/htc_drv_main.c
index 57094bd45d98..19600018e562 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -198,7 +198,7 @@ void ath9k_htc_reset(struct ath9k_htc_priv *priv)
 	ath9k_htc_stop_ani(priv);
 	ieee80211_stop_queues(priv->hw);
=20
-	del_timer_sync(&priv->tx.cleanup_timer);
+	timer_delete_sync(&priv->tx.cleanup_timer);
 	ath9k_htc_tx_drain(priv);
=20
 	WMI_CMD(WMI_DISABLE_INTR_CMDID);
@@ -260,7 +260,7 @@ static int ath9k_htc_set_channel(struct ath9k_htc_priv *p=
riv,
 	ath9k_htc_ps_wakeup(priv);
=20
 	ath9k_htc_stop_ani(priv);
-	del_timer_sync(&priv->tx.cleanup_timer);
+	timer_delete_sync(&priv->tx.cleanup_timer);
 	ath9k_htc_tx_drain(priv);
=20
 	WMI_CMD(WMI_DISABLE_INTR_CMDID);
@@ -997,7 +997,7 @@ static void ath9k_htc_stop(struct ieee80211_hw *hw, bool =
suspend)
=20
 	tasklet_kill(&priv->rx_tasklet);
=20
-	del_timer_sync(&priv->tx.cleanup_timer);
+	timer_delete_sync(&priv->tx.cleanup_timer);
 	ath9k_htc_tx_drain(priv);
 	ath9k_wmi_event_drain(priv);
=20
diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath=
/ath9k/init.c
index 01e0dffbf57e..ee951493e993 100644
--- a/drivers/net/wireless/ath/ath9k/init.c
+++ b/drivers/net/wireless/ath/ath9k/init.c
@@ -1099,7 +1099,7 @@ static void ath9k_deinit_softc(struct ath_softc *sc)
 		if (ATH_TXQ_SETUP(sc, i))
 			ath_tx_cleanupq(sc, &sc->tx.txq[i]);
=20
-	del_timer_sync(&sc->sleep_timer);
+	timer_delete_sync(&sc->sleep_timer);
 	ath9k_hw_deinit(sc->sc_ah);
 	if (sc->dfs_detector !=3D NULL)
 		sc->dfs_detector->exit(sc->dfs_detector);
diff --git a/drivers/net/wireless/ath/ath9k/link.c b/drivers/net/wireless/ath=
/ath9k/link.c
index d078a59d7d3c..7f890997bb53 100644
--- a/drivers/net/wireless/ath/ath9k/link.c
+++ b/drivers/net/wireless/ath/ath9k/link.c
@@ -472,7 +472,7 @@ void ath_stop_ani(struct ath_softc *sc)
 	struct ath_common *common =3D ath9k_hw_common(sc->sc_ah);
=20
 	ath_dbg(common, ANI, "Stopping ANI\n");
-	del_timer_sync(&common->ani.timer);
+	timer_delete_sync(&common->ani.timer);
 }
=20
 void ath_check_ani(struct ath_softc *sc)
diff --git a/drivers/net/wireless/ath/ath9k/main.c b/drivers/net/wireless/ath=
/ath9k/main.c
index a70c94564814..92fc5e3d756e 100644
--- a/drivers/net/wireless/ath/ath9k/main.c
+++ b/drivers/net/wireless/ath/ath9k/main.c
@@ -123,7 +123,7 @@ void ath9k_ps_wakeup(struct ath_softc *sc)
 	if (++sc->ps_usecount !=3D 1)
 		goto unlock;
=20
-	del_timer_sync(&sc->sleep_timer);
+	timer_delete_sync(&sc->sleep_timer);
 	power_mode =3D sc->sc_ah->power_mode;
 	ath9k_hw_setpower(sc->sc_ah, ATH9K_PM_AWAKE);
=20
@@ -2418,7 +2418,7 @@ static void ath9k_cancel_pending_offchannel(struct ath_=
softc *sc)
 		ath_dbg(common, CHAN_CTX,
 			"%s: Aborting RoC\n", __func__);
=20
-		del_timer_sync(&sc->offchannel.timer);
+		timer_delete_sync(&sc->offchannel.timer);
 		if (sc->offchannel.state >=3D ATH_OFFCHANNEL_ROC_START)
 			ath_roc_complete(sc, ATH_ROC_COMPLETE_ABORT);
 	}
@@ -2427,7 +2427,7 @@ static void ath9k_cancel_pending_offchannel(struct ath_=
softc *sc)
 		ath_dbg(common, CHAN_CTX,
 			"%s: Aborting HW scan\n", __func__);
=20
-		del_timer_sync(&sc->offchannel.timer);
+		timer_delete_sync(&sc->offchannel.timer);
 		ath_scan_complete(sc, true);
 	}
 }
@@ -2476,7 +2476,7 @@ static void ath9k_cancel_hw_scan(struct ieee80211_hw *h=
w,
 	ath_dbg(common, CHAN_CTX, "Cancel HW scan on vif: %pM\n", vif->addr);
=20
 	mutex_lock(&sc->mutex);
-	del_timer_sync(&sc->offchannel.timer);
+	timer_delete_sync(&sc->offchannel.timer);
 	ath_scan_complete(sc, true);
 	mutex_unlock(&sc->mutex);
 }
@@ -2526,7 +2526,7 @@ static int ath9k_cancel_remain_on_channel(struct ieee80=
211_hw *hw,
 	mutex_lock(&sc->mutex);
=20
 	ath_dbg(common, CHAN_CTX, "Cancel RoC\n");
-	del_timer_sync(&sc->offchannel.timer);
+	timer_delete_sync(&sc->offchannel.timer);
=20
 	if (sc->offchannel.roc_vif) {
 		if (sc->offchannel.state >=3D ATH_OFFCHANNEL_ROC_START)
diff --git a/drivers/net/wireless/ath/ath9k/pci.c b/drivers/net/wireless/ath/=
ath9k/pci.c
index 1ff53520f0a3..27d4034c814e 100644
--- a/drivers/net/wireless/ath/ath9k/pci.c
+++ b/drivers/net/wireless/ath/ath9k/pci.c
@@ -1029,7 +1029,7 @@ static int ath_pci_suspend(struct device *device)
 	 */
 	ath9k_stop_btcoex(sc);
 	ath9k_hw_disable(sc->sc_ah);
-	del_timer_sync(&sc->sleep_timer);
+	timer_delete_sync(&sc->sleep_timer);
 	ath9k_hw_setpower(sc->sc_ah, ATH9K_PM_FULL_SLEEP);
=20
 	return 0;
diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireless/at=
h/wcn36xx/dxe.c
index d405a4c34059..cc2a033e87f5 100644
--- a/drivers/net/wireless/ath/wcn36xx/dxe.c
+++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
@@ -350,7 +350,7 @@ void wcn36xx_dxe_tx_ack_ind(struct wcn36xx *wcn, u32 stat=
us)
 	spin_lock_irqsave(&wcn->dxe_lock, flags);
 	skb =3D wcn->tx_ack_skb;
 	wcn->tx_ack_skb =3D NULL;
-	del_timer(&wcn->tx_ack_timer);
+	timer_delete(&wcn->tx_ack_timer);
 	spin_unlock_irqrestore(&wcn->dxe_lock, flags);
=20
 	if (!skb) {
@@ -1055,7 +1055,7 @@ void wcn36xx_dxe_deinit(struct wcn36xx *wcn)
=20
 	free_irq(wcn->tx_irq, wcn);
 	free_irq(wcn->rx_irq, wcn);
-	del_timer(&wcn->tx_ack_timer);
+	timer_delete(&wcn->tx_ack_timer);
=20
 	if (wcn->tx_ack_skb) {
 		ieee80211_tx_status_irqsafe(wcn->hw, wcn->tx_ack_skb);
diff --git a/drivers/net/wireless/ath/wil6210/cfg80211.c b/drivers/net/wirele=
ss/ath/wil6210/cfg80211.c
index a1a0a9223e74..5473c01cbe66 100644
--- a/drivers/net/wireless/ath/wil6210/cfg80211.c
+++ b/drivers/net/wireless/ath/wil6210/cfg80211.c
@@ -1017,7 +1017,7 @@ static int wil_cfg80211_scan(struct wiphy *wiphy,
=20
 out_restore:
 	if (rc) {
-		del_timer_sync(&vif->scan_timer);
+		timer_delete_sync(&vif->scan_timer);
 		if (vif->mid =3D=3D 0)
 			wil->radio_wdev =3D wil->main_ndev->ieee80211_ptr;
 		vif->scan_request =3D NULL;
diff --git a/drivers/net/wireless/ath/wil6210/main.c b/drivers/net/wireless/a=
th/wil6210/main.c
index 94e61dbe94f8..44c24c6c8360 100644
--- a/drivers/net/wireless/ath/wil6210/main.c
+++ b/drivers/net/wireless/ath/wil6210/main.c
@@ -798,7 +798,7 @@ void wil6210_disconnect(struct wil6210_vif *vif, const u8=
 *bssid,
=20
 	wil_dbg_misc(wil, "disconnecting\n");
=20
-	del_timer_sync(&vif->connect_timer);
+	timer_delete_sync(&vif->connect_timer);
 	_wil6210_disconnect(vif, bssid, reason_code);
 }
=20
@@ -818,7 +818,7 @@ void wil6210_disconnect_complete(struct wil6210_vif *vif,=
 const u8 *bssid,
=20
 	wil_dbg_misc(wil, "got disconnect\n");
=20
-	del_timer_sync(&vif->connect_timer);
+	timer_delete_sync(&vif->connect_timer);
 	_wil6210_disconnect_complete(vif, bssid, reason_code);
 }
=20
@@ -1465,7 +1465,7 @@ void wil_abort_scan(struct wil6210_vif *vif, bool sync)
 		return;
=20
 	wil_dbg_misc(wil, "Abort scan_request 0x%p\n", vif->scan_request);
-	del_timer_sync(&vif->scan_timer);
+	timer_delete_sync(&vif->scan_timer);
 	mutex_unlock(&wil->vif_mutex);
 	rc =3D wmi_abort_scan(vif);
 	if (!rc && sync)
diff --git a/drivers/net/wireless/ath/wil6210/netdev.c b/drivers/net/wireless=
/ath/wil6210/netdev.c
index d5d364683c0e..59884e8e3765 100644
--- a/drivers/net/wireless/ath/wil6210/netdev.c
+++ b/drivers/net/wireless/ath/wil6210/netdev.c
@@ -200,8 +200,8 @@ static void wil_dev_setup(struct net_device *dev)
=20
 static void wil_vif_deinit(struct wil6210_vif *vif)
 {
-	del_timer_sync(&vif->scan_timer);
-	del_timer_sync(&vif->p2p.discovery_timer);
+	timer_delete_sync(&vif->scan_timer);
+	timer_delete_sync(&vif->p2p.discovery_timer);
 	cancel_work_sync(&vif->disconnect_worker);
 	cancel_work_sync(&vif->p2p.discovery_expired_work);
 	cancel_work_sync(&vif->p2p.delayed_listen_work);
@@ -533,7 +533,7 @@ void wil_vif_remove(struct wil6210_priv *wil, u8 mid)
 	mutex_unlock(&wil->vif_mutex);
=20
 	flush_work(&wil->wmi_event_worker);
-	del_timer_sync(&vif->connect_timer);
+	timer_delete_sync(&vif->connect_timer);
 	cancel_work_sync(&vif->disconnect_worker);
 	wil_probe_client_flush(vif);
 	cancel_work_sync(&vif->probe_client_worker);
diff --git a/drivers/net/wireless/ath/wil6210/p2p.c b/drivers/net/wireless/at=
h/wil6210/p2p.c
index f26bf046d889..f20caf1a3905 100644
--- a/drivers/net/wireless/ath/wil6210/p2p.c
+++ b/drivers/net/wireless/ath/wil6210/p2p.c
@@ -184,7 +184,7 @@ u8 wil_p2p_stop_discovery(struct wil6210_vif *vif)
 			/* discovery not really started, only pending */
 			p2p->pending_listen_wdev =3D NULL;
 		} else {
-			del_timer_sync(&p2p->discovery_timer);
+			timer_delete_sync(&p2p->discovery_timer);
 			wmi_stop_discovery(vif);
 		}
 		p2p->discovery_started =3D 0;
diff --git a/drivers/net/wireless/ath/wil6210/wmi.c b/drivers/net/wireless/at=
h/wil6210/wmi.c
index 8ff69dc72fb9..74edd007cd8d 100644
--- a/drivers/net/wireless/ath/wil6210/wmi.c
+++ b/drivers/net/wireless/ath/wil6210/wmi.c
@@ -933,7 +933,7 @@ static void wmi_evt_scan_complete(struct wil6210_vif *vif=
, int id,
 		wil_dbg_wmi(wil, "SCAN_COMPLETE(0x%08x)\n", status);
 		wil_dbg_misc(wil, "Complete scan_request 0x%p aborted %d\n",
 			     vif->scan_request, info.aborted);
-		del_timer_sync(&vif->scan_timer);
+		timer_delete_sync(&vif->scan_timer);
 		cfg80211_scan_done(vif->scan_request, &info);
 		if (vif->mid =3D=3D 0)
 			wil->radio_wdev =3D wil->main_ndev->ieee80211_ptr;
@@ -1023,7 +1023,7 @@ static void wmi_evt_connect(struct wil6210_vif *vif, in=
t id, void *d, int len)
 			mutex_unlock(&wil->mutex);
 			return;
 		}
-		del_timer_sync(&vif->connect_timer);
+		timer_delete_sync(&vif->connect_timer);
 	} else if ((wdev->iftype =3D=3D NL80211_IFTYPE_AP) ||
 		   (wdev->iftype =3D=3D NL80211_IFTYPE_P2P_GO)) {
 		if (wil->sta[evt->cid].status !=3D wil_sta_unused) {
@@ -1814,7 +1814,7 @@ wmi_evt_reassoc_status(struct wil6210_vif *vif, int id,=
 void *d, int len)
 	wil->sta[cid].stats.ft_roams++;
 	ether_addr_copy(wil->sta[cid].addr, vif->bss->bssid);
 	mutex_unlock(&wil->mutex);
-	del_timer_sync(&vif->connect_timer);
+	timer_delete_sync(&vif->connect_timer);
=20
 	cfg80211_ref_bss(wiphy, vif->bss);
 	freq =3D ieee80211_channel_to_frequency(ch, NL80211_BAND_60GHZ);
diff --git a/drivers/net/wireless/atmel/at76c50x-usb.c b/drivers/net/wireless=
/atmel/at76c50x-usb.c
index 504e05ea30f2..4f01189b7c4b 100644
--- a/drivers/net/wireless/atmel/at76c50x-usb.c
+++ b/drivers/net/wireless/atmel/at76c50x-usb.c
@@ -2417,7 +2417,7 @@ static void at76_delete_device(struct at76_priv *priv)
=20
 	kfree(priv->bulk_out_buffer);
=20
-	del_timer_sync(&ledtrig_tx_timer);
+	timer_delete_sync(&ledtrig_tx_timer);
=20
 	kfree_skb(priv->rx_skb);
=20
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/btcoex.c b/driv=
ers/net/wireless/broadcom/brcm80211/brcmfmac/btcoex.c
index 1e8495f50c16..e0de34a3e43a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/btcoex.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/btcoex.c
@@ -289,7 +289,7 @@ static void brcmf_btcoex_handler(struct work_struct *work)
 	btci =3D container_of(work, struct brcmf_btcoex_info, work);
 	if (btci->timer_on) {
 		btci->timer_on =3D false;
-		del_timer_sync(&btci->timer);
+		timer_delete_sync(&btci->timer);
 	}
=20
 	switch (btci->bt_state) {
@@ -428,7 +428,7 @@ static void brcmf_btcoex_dhcp_end(struct brcmf_btcoex_inf=
o *btci)
 	if (btci->timer_on) {
 		brcmf_dbg(INFO, "disable BT DHCP Timer\n");
 		btci->timer_on =3D false;
-		del_timer_sync(&btci->timer);
+		timer_delete_sync(&btci->timer);
=20
 		/* schedule worker if transition to IDLE is needed */
 		if (btci->bt_state !=3D BRCMF_BT_DHCP_IDLE) {
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/driver=
s/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index d2caa80e9412..9f1854b3d1a5 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -2304,7 +2304,7 @@ brcmf_pcie_fwcon_timer(struct brcmf_pciedev_info *devin=
fo, bool active)
 {
 	if (!active) {
 		if (devinfo->console_active) {
-			del_timer_sync(&devinfo->timer);
+			timer_delete_sync(&devinfo->timer);
 			devinfo->console_active =3D false;
 		}
 		return;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/driver=
s/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index b1727f35217b..93727b9a5f0d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -4611,7 +4611,7 @@ void brcmf_sdio_wd_timer(struct brcmf_sdio *bus, bool a=
ctive)
 {
 	/* Totally stop the timer */
 	if (!active && bus->wd_active) {
-		del_timer_sync(&bus->timer);
+		timer_delete_sync(&bus->timer);
 		bus->wd_active =3D false;
 		return;
 	}
diff --git a/drivers/net/wireless/intel/ipw2x00/libipw_crypto.c b/drivers/net=
/wireless/intel/ipw2x00/libipw_crypto.c
index 32639e0e8430..dfcc12aa8620 100644
--- a/drivers/net/wireless/intel/ipw2x00/libipw_crypto.c
+++ b/drivers/net/wireless/intel/ipw2x00/libipw_crypto.c
@@ -59,7 +59,7 @@ void libipw_crypt_info_free(struct libipw_crypt_info *info)
 	int i;
=20
         libipw_crypt_quiescing(info);
-        del_timer_sync(&info->crypt_deinit_timer);
+        timer_delete_sync(&info->crypt_deinit_timer);
         libipw_crypt_deinit_entries(info, 1);
=20
         for (i =3D 0; i < NUM_WEP_KEYS; i++) {
diff --git a/drivers/net/wireless/intel/iwlegacy/3945-mac.c b/drivers/net/wir=
eless/intel/iwlegacy/3945-mac.c
index 4013443698a2..104748fcdc33 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
@@ -2188,7 +2188,7 @@ __il3945_down(struct il_priv *il)
=20
 	/* Stop TX queues watchdog. We need to have S_EXIT_PENDING bit set
 	 * to prevent rearm timer */
-	del_timer_sync(&il->watchdog);
+	timer_delete_sync(&il->watchdog);
=20
 	/* Station information will now be cleared in device */
 	il_clear_ucode_stations(il);
diff --git a/drivers/net/wireless/intel/iwlegacy/3945-rs.c b/drivers/net/wire=
less/intel/iwlegacy/3945-rs.c
index 0eaad980c85c..df1b8ec86651 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945-rs.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945-rs.c
@@ -413,7 +413,7 @@ il3945_rs_free_sta(void *il_priv, struct ieee80211_sta *s=
ta, void *il_sta)
 	 * to use il_priv to print out debugging) since it may not be fully
 	 * initialized at this point.
 	 */
-	del_timer_sync(&rs_sta->rate_scale_flush);
+	timer_delete_sync(&rs_sta->rate_scale_flush);
 }
=20
 /*
diff --git a/drivers/net/wireless/intel/iwlegacy/4965-mac.c b/drivers/net/wir=
eless/intel/iwlegacy/4965-mac.c
index 05c4af41bdb9..dc8c408902e6 100644
--- a/drivers/net/wireless/intel/iwlegacy/4965-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
@@ -5350,7 +5350,7 @@ __il4965_down(struct il_priv *il)
=20
 	/* Stop TX queues watchdog. We need to have S_EXIT_PENDING bit set
 	 * to prevent rearm timer */
-	del_timer_sync(&il->watchdog);
+	timer_delete_sync(&il->watchdog);
=20
 	il_clear_ucode_stations(il);
=20
@@ -6243,7 +6243,7 @@ il4965_cancel_deferred_work(struct il_priv *il)
=20
 	il_cancel_scan_deferred_work(il);
=20
-	del_timer_sync(&il->stats_periodic);
+	timer_delete_sync(&il->stats_periodic);
 }
=20
 static void
diff --git a/drivers/net/wireless/intel/iwlegacy/common.c b/drivers/net/wirel=
ess/intel/iwlegacy/common.c
index af4f42534ea0..09fb4b758704 100644
--- a/drivers/net/wireless/intel/iwlegacy/common.c
+++ b/drivers/net/wireless/intel/iwlegacy/common.c
@@ -4842,7 +4842,7 @@ il_setup_watchdog(struct il_priv *il)
 		mod_timer(&il->watchdog,
 			  jiffies + msecs_to_jiffies(IL_WD_TICK(timeout)));
 	else
-		del_timer(&il->watchdog);
+		timer_delete(&il->watchdog);
 }
 EXPORT_SYMBOL(il_setup_watchdog);
=20
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c b/drivers/net/w=
ireless/intel/iwlwifi/dvm/debugfs.c
index b246dbd371b3..2ed4b6e798ab 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c
@@ -1870,7 +1870,7 @@ static ssize_t iwl_dbgfs_ucode_tracing_write(struct fil=
e *file,
 		}
 	} else {
 		priv->event_log.ucode_trace =3D false;
-		del_timer_sync(&priv->ucode_trace);
+		timer_delete_sync(&priv->ucode_trace);
 	}
=20
 	return count;
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/main.c b/drivers/net/wire=
less/intel/iwlwifi/dvm/main.c
index 30789ba06d9d..a27a72cc017a 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/main.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
@@ -1082,8 +1082,8 @@ void iwl_cancel_deferred_work(struct iwl_priv *priv)
 	cancel_work_sync(&priv->bt_full_concurrency);
 	cancel_work_sync(&priv->bt_runtime_config);
=20
-	del_timer_sync(&priv->statistics_periodic);
-	del_timer_sync(&priv->ucode_trace);
+	timer_delete_sync(&priv->statistics_periodic);
+	timer_delete_sync(&priv->ucode_trace);
 }
=20
 static int iwl_init_drv(struct iwl_priv *priv)
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/tt.c b/drivers/net/wirele=
ss/intel/iwlwifi/dvm/tt.c
index e1d78550e443..98f0949b3683 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/tt.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/tt.c
@@ -257,7 +257,7 @@ static void iwl_legacy_tt_handler(struct iwl_priv *priv, =
s32 temp, bool force)
 	tt->tt_previous_temp =3D temp;
 #endif
 	/* stop ct_kill_waiting_tm timer */
-	del_timer_sync(&priv->thermal_throttle.ct_kill_waiting_tm);
+	timer_delete_sync(&priv->thermal_throttle.ct_kill_waiting_tm);
 	if (tt->state !=3D old_state) {
 		switch (tt->state) {
 		case IWL_TI_0:
@@ -378,7 +378,7 @@ static void iwl_advance_tt_handler(struct iwl_priv *priv,=
 s32 temp, bool force)
 		}
 	}
 	/* stop ct_kill_waiting_tm timer */
-	del_timer_sync(&priv->thermal_throttle.ct_kill_waiting_tm);
+	timer_delete_sync(&priv->thermal_throttle.ct_kill_waiting_tm);
 	if (changed) {
 		if (tt->state >=3D IWL_TI_1) {
 			/* force PI =3D IWL_POWER_INDEX_5 in the case of TI > 0 */
@@ -506,7 +506,7 @@ static void iwl_bg_ct_exit(struct work_struct *work)
 		return;
=20
 	/* stop ct_kill_exit_tm timer */
-	del_timer_sync(&priv->thermal_throttle.ct_kill_exit_tm);
+	timer_delete_sync(&priv->thermal_throttle.ct_kill_exit_tm);
=20
 	if (tt->state =3D=3D IWL_TI_CT_KILL) {
 		IWL_ERR(priv,
@@ -640,9 +640,9 @@ void iwl_tt_exit(struct iwl_priv *priv)
 	struct iwl_tt_mgmt *tt =3D &priv->thermal_throttle;
=20
 	/* stop ct_kill_exit_tm timer if activated */
-	del_timer_sync(&priv->thermal_throttle.ct_kill_exit_tm);
+	timer_delete_sync(&priv->thermal_throttle.ct_kill_exit_tm);
 	/* stop ct_kill_waiting_tm timer if activated */
-	del_timer_sync(&priv->thermal_throttle.ct_kill_waiting_tm);
+	timer_delete_sync(&priv->thermal_throttle.ct_kill_waiting_tm);
 	cancel_work_sync(&priv->tt_work);
 	cancel_work_sync(&priv->ct_enter);
 	cancel_work_sync(&priv->ct_exit);
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c b/drivers/net/wirel=
ess/intel/iwlwifi/pcie/rx.c
index 4a442d03d8d2..4a4f8de4efe2 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
@@ -1697,7 +1697,7 @@ static void iwl_pcie_irq_handle_error(struct iwl_trans =
*trans)
 	for (i =3D 0; i < trans->trans_cfg->base_params->num_of_queues; i++) {
 		if (!trans_pcie->txqs.txq[i])
 			continue;
-		del_timer(&trans_pcie->txqs.txq[i]->stuck_timer);
+		timer_delete(&trans_pcie->txqs.txq[i]->stuck_timer);
 	}
=20
 	/* The STATUS_FW_ERROR bit is set in this function. This must happen
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c b/drivers/net/=
wireless/intel/iwlwifi/pcie/tx-gen2.c
index 401919f9fe88..71227fd3dac0 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c
@@ -911,7 +911,7 @@ static void iwl_txq_gen2_free(struct iwl_trans *trans, in=
t txq_id)
 			kfree_sensitive(txq->entries[i].cmd);
 			kfree_sensitive(txq->entries[i].free_buf);
 		}
-	del_timer_sync(&txq->stuck_timer);
+	timer_delete_sync(&txq->stuck_timer);
=20
 	iwl_txq_gen2_free_memory(trans, txq);
=20
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/tx.c b/drivers/net/wirel=
ess/intel/iwlwifi/pcie/tx.c
index 7c1dd5cc084a..bb90bcfc6763 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
@@ -469,7 +469,7 @@ static void iwl_pcie_txq_free(struct iwl_trans *trans, in=
t txq_id)
 	kfree(txq->entries);
 	txq->entries =3D NULL;
=20
-	del_timer_sync(&txq->stuck_timer);
+	timer_delete_sync(&txq->stuck_timer);
=20
 	/* 0-fill queue descriptor structure */
 	memset(txq, 0, sizeof(*txq));
@@ -1054,7 +1054,7 @@ static void iwl_txq_progress(struct iwl_txq *txq)
 	 * since we're making progress on this queue
 	 */
 	if (txq->read_ptr =3D=3D txq->write_ptr)
-		del_timer(&txq->stuck_timer);
+		timer_delete(&txq->stuck_timer);
 	else
 		mod_timer(&txq->stuck_timer, jiffies + txq->wd_timeout);
 }
@@ -2529,7 +2529,7 @@ void iwl_pcie_freeze_txq_timer(struct iwl_trans *trans,
 			/* remember how long until the timer fires */
 			txq->frozen_expiry_remainder =3D
 				txq->stuck_timer.expires - now;
-			del_timer(&txq->stuck_timer);
+			timer_delete(&txq->stuck_timer);
 			goto next_queue;
 		}
=20
diff --git a/drivers/net/wireless/marvell/libertas/cmdresp.c b/drivers/net/wi=
reless/marvell/libertas/cmdresp.c
index 8393f396eebe..9742d3dba31c 100644
--- a/drivers/net/wireless/marvell/libertas/cmdresp.c
+++ b/drivers/net/wireless/marvell/libertas/cmdresp.c
@@ -119,7 +119,7 @@ int lbs_process_command_response(struct lbs_private *priv=
, u8 *data, u32 len)
 	}
=20
 	/* Now we got response from FW, cancel the command timer */
-	del_timer(&priv->command_timer);
+	timer_delete(&priv->command_timer);
 	priv->cmd_timed_out =3D 0;
=20
 	if (respcmd =3D=3D CMD_RET(CMD_802_11_PS_MODE)) {
diff --git a/drivers/net/wireless/marvell/libertas/if_usb.c b/drivers/net/wir=
eless/marvell/libertas/if_usb.c
index 2240b4db8c03..ea3cc2eaec36 100644
--- a/drivers/net/wireless/marvell/libertas/if_usb.c
+++ b/drivers/net/wireless/marvell/libertas/if_usb.c
@@ -897,7 +897,7 @@ static void if_usb_prog_firmware(struct lbs_private *priv=
, int ret,
 	/* ... and wait for the process to complete */
 	wait_event_interruptible(cardp->fw_wq, cardp->surprise_removed || cardp->fw=
dnldover);
=20
-	del_timer_sync(&cardp->fw_timeout);
+	timer_delete_sync(&cardp->fw_timeout);
 	usb_kill_urb(cardp->rx_urb);
=20
 	if (!cardp->fwdnldover) {
diff --git a/drivers/net/wireless/marvell/libertas/main.c b/drivers/net/wirel=
ess/marvell/libertas/main.c
index 017e5c6bbade..26d13e9b3c95 100644
--- a/drivers/net/wireless/marvell/libertas/main.c
+++ b/drivers/net/wireless/marvell/libertas/main.c
@@ -202,7 +202,7 @@ int lbs_stop_iface(struct lbs_private *priv)
 	spin_unlock_irqrestore(&priv->driver_lock, flags);
=20
 	cancel_work_sync(&priv->mcast_work);
-	del_timer_sync(&priv->tx_lockup_timer);
+	timer_delete_sync(&priv->tx_lockup_timer);
=20
 	/* Disable command processing, and wait for all commands to complete */
 	lbs_deb_main("waiting for commands to complete\n");
@@ -250,7 +250,7 @@ void lbs_host_to_card_done(struct lbs_private *priv)
 	unsigned long flags;
=20
 	spin_lock_irqsave(&priv->driver_lock, flags);
-	del_timer(&priv->tx_lockup_timer);
+	timer_delete(&priv->tx_lockup_timer);
=20
 	priv->dnld_sent =3D DNLD_RES_RECEIVED;
=20
@@ -594,8 +594,8 @@ static int lbs_thread(void *data)
 		spin_unlock_irq(&priv->driver_lock);
 	}
=20
-	del_timer(&priv->command_timer);
-	del_timer(&priv->tx_lockup_timer);
+	timer_delete(&priv->command_timer);
+	timer_delete(&priv->tx_lockup_timer);
=20
 	return 0;
 }
@@ -798,8 +798,8 @@ static void lbs_free_adapter(struct lbs_private *priv)
 {
 	lbs_free_cmd_buffer(priv);
 	kfifo_free(&priv->event_fifo);
-	del_timer(&priv->command_timer);
-	del_timer(&priv->tx_lockup_timer);
+	timer_delete(&priv->command_timer);
+	timer_delete(&priv->tx_lockup_timer);
 }
=20
 static const struct net_device_ops lbs_netdev_ops =3D {
diff --git a/drivers/net/wireless/marvell/libertas_tf/cmd.c b/drivers/net/wir=
eless/marvell/libertas_tf/cmd.c
index efb98304555a..7fc1bdb6c458 100644
--- a/drivers/net/wireless/marvell/libertas_tf/cmd.c
+++ b/drivers/net/wireless/marvell/libertas_tf/cmd.c
@@ -757,7 +757,7 @@ int lbtf_process_rx_command(struct lbtf_private *priv)
 	}
=20
 	/* Now we got response from FW, cancel the command timer */
-	del_timer(&priv->command_timer);
+	timer_delete(&priv->command_timer);
 	priv->cmd_timed_out =3D 0;
 	if (priv->nr_retries)
 		priv->nr_retries =3D 0;
diff --git a/drivers/net/wireless/marvell/libertas_tf/if_usb.c b/drivers/net/=
wireless/marvell/libertas_tf/if_usb.c
index 1750f5e93de2..7c413dc81f9a 100644
--- a/drivers/net/wireless/marvell/libertas_tf/if_usb.c
+++ b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
@@ -875,7 +875,7 @@ static int if_usb_prog_firmware(struct lbtf_private *priv)
 	wait_event_interruptible(cardp->fw_wq, cardp->priv->surpriseremoved ||
 					       cardp->fwdnldover);
=20
-	del_timer_sync(&cardp->fw_timeout);
+	timer_delete_sync(&cardp->fw_timeout);
 	usb_kill_urb(cardp->rx_urb);
=20
 	if (!cardp->fwdnldover) {
diff --git a/drivers/net/wireless/marvell/libertas_tf/main.c b/drivers/net/wi=
reless/marvell/libertas_tf/main.c
index b47a832b9ae2..a57a11be57d8 100644
--- a/drivers/net/wireless/marvell/libertas_tf/main.c
+++ b/drivers/net/wireless/marvell/libertas_tf/main.c
@@ -174,7 +174,7 @@ static void lbtf_free_adapter(struct lbtf_private *priv)
 {
 	lbtf_deb_enter(LBTF_DEB_MAIN);
 	lbtf_free_cmd_buffer(priv);
-	del_timer(&priv->command_timer);
+	timer_delete(&priv->command_timer);
 	lbtf_deb_leave(LBTF_DEB_MAIN);
 }
=20
@@ -642,7 +642,7 @@ int lbtf_remove_card(struct lbtf_private *priv)
 	lbtf_deb_enter(LBTF_DEB_MAIN);
=20
 	priv->surpriseremoved =3D 1;
-	del_timer(&priv->command_timer);
+	timer_delete(&priv->command_timer);
 	lbtf_free_adapter(priv);
 	priv->hw =3D NULL;
 	ieee80211_unregister_hw(hw);
diff --git a/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c b/drivers/n=
et/wireless/marvell/mwifiex/11n_rxreorder.c
index cb948ca34373..8aff1df09b40 100644
--- a/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
+++ b/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
@@ -206,7 +206,7 @@ mwifiex_del_rx_reorder_entry(struct mwifiex_private *priv,
 	start_win =3D (tbl->start_win + tbl->win_size) & (MAX_TID_VALUE - 1);
 	mwifiex_11n_dispatch_pkt_until_start_win(priv, tbl, start_win);
=20
-	del_timer_sync(&tbl->timer_context.timer);
+	timer_delete_sync(&tbl->timer_context.timer);
 	tbl->timer_context.timer_is_set =3D false;
=20
 	spin_lock_bh(&priv->rx_reorder_tbl_lock);
diff --git a/drivers/net/wireless/marvell/mwifiex/cmdevt.c b/drivers/net/wire=
less/marvell/mwifiex/cmdevt.c
index b30ed321c625..5573e2ded72f 100644
--- a/drivers/net/wireless/marvell/mwifiex/cmdevt.c
+++ b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
@@ -836,7 +836,7 @@ int mwifiex_process_cmdresp(struct mwifiex_adapter *adapt=
er)
 		return -1;
 	}
 	/* Now we got response from FW, cancel the command timer */
-	del_timer_sync(&adapter->cmd_timer);
+	timer_delete_sync(&adapter->cmd_timer);
 	clear_bit(MWIFIEX_IS_CMD_TIMEDOUT, &adapter->work_flags);
=20
 	if (adapter->curr_cmd->cmd_flag & CMD_F_HOSTCMD) {
diff --git a/drivers/net/wireless/marvell/mwifiex/init.c b/drivers/net/wirele=
ss/marvell/mwifiex/init.c
index 8b61e45cd667..ce0d42e72e94 100644
--- a/drivers/net/wireless/marvell/mwifiex/init.c
+++ b/drivers/net/wireless/marvell/mwifiex/init.c
@@ -390,7 +390,7 @@ static void mwifiex_invalidate_lists(struct mwifiex_adapt=
er *adapter)
 static void
 mwifiex_adapter_cleanup(struct mwifiex_adapter *adapter)
 {
-	del_timer(&adapter->wakeup_timer);
+	timer_delete(&adapter->wakeup_timer);
 	cancel_delayed_work_sync(&adapter->devdump_work);
 	mwifiex_cancel_all_pending_cmd(adapter);
 	wake_up_interruptible(&adapter->cmd_wait_q.wait);
@@ -613,7 +613,7 @@ mwifiex_shutdown_drv(struct mwifiex_adapter *adapter)
 	if (adapter->curr_cmd) {
 		mwifiex_dbg(adapter, WARN,
 			    "curr_cmd is still in processing\n");
-		del_timer_sync(&adapter->cmd_timer);
+		timer_delete_sync(&adapter->cmd_timer);
 		mwifiex_recycle_cmd_node(adapter, adapter->curr_cmd);
 		adapter->curr_cmd =3D NULL;
 	}
diff --git a/drivers/net/wireless/marvell/mwifiex/main.c b/drivers/net/wirele=
ss/marvell/mwifiex/main.c
index b07cb302a00c..0e1f53940401 100644
--- a/drivers/net/wireless/marvell/mwifiex/main.c
+++ b/drivers/net/wireless/marvell/mwifiex/main.c
@@ -307,7 +307,7 @@ int mwifiex_main_process(struct mwifiex_adapter *adapter)
 		if (IS_CARD_RX_RCVD(adapter)) {
 			adapter->data_received =3D false;
 			adapter->pm_wakeup_fw_try =3D false;
-			del_timer(&adapter->wakeup_timer);
+			timer_delete(&adapter->wakeup_timer);
 			if (adapter->ps_state =3D=3D PS_STATE_SLEEP)
 				adapter->ps_state =3D PS_STATE_AWAKE;
 		} else {
diff --git a/drivers/net/wireless/marvell/mwifiex/pcie.c b/drivers/net/wirele=
ss/marvell/mwifiex/pcie.c
index e11458fd4d50..dd2a42e732f2 100644
--- a/drivers/net/wireless/marvell/mwifiex/pcie.c
+++ b/drivers/net/wireless/marvell/mwifiex/pcie.c
@@ -2437,7 +2437,7 @@ static void mwifiex_interrupt_status(struct mwifiex_ada=
pter *adapter,
 		 */
 		adapter->ps_state =3D PS_STATE_AWAKE;
 		adapter->pm_wakeup_fw_try =3D false;
-		del_timer(&adapter->wakeup_timer);
+		timer_delete(&adapter->wakeup_timer);
 	}
=20
 	spin_lock_irqsave(&adapter->int_lock, flags);
@@ -2527,7 +2527,7 @@ static int mwifiex_process_int_status(struct mwifiex_ad=
apter *adapter)
 				    adapter->ps_state =3D=3D PS_STATE_SLEEP) {
 					adapter->ps_state =3D PS_STATE_AWAKE;
 					adapter->pm_wakeup_fw_try =3D false;
-					del_timer(&adapter->wakeup_timer);
+					timer_delete(&adapter->wakeup_timer);
 				}
 			}
 		}
diff --git a/drivers/net/wireless/marvell/mwifiex/sta_event.c b/drivers/net/w=
ireless/marvell/mwifiex/sta_event.c
index 400348abeee5..fecd88967ceb 100644
--- a/drivers/net/wireless/marvell/mwifiex/sta_event.c
+++ b/drivers/net/wireless/marvell/mwifiex/sta_event.c
@@ -789,7 +789,7 @@ int mwifiex_process_sta_event(struct mwifiex_private *pri=
v)
 					adapter->ps_state =3D PS_STATE_AWAKE;
 					adapter->pm_wakeup_card_req =3D false;
 					adapter->pm_wakeup_fw_try =3D false;
-					del_timer(&adapter->wakeup_timer);
+					timer_delete(&adapter->wakeup_timer);
 					break;
 				}
 				if (!mwifiex_send_null_packet
@@ -804,7 +804,7 @@ int mwifiex_process_sta_event(struct mwifiex_private *pri=
v)
 		adapter->ps_state =3D PS_STATE_AWAKE;
 		adapter->pm_wakeup_card_req =3D false;
 		adapter->pm_wakeup_fw_try =3D false;
-		del_timer(&adapter->wakeup_timer);
+		timer_delete(&adapter->wakeup_timer);
=20
 		break;
=20
diff --git a/drivers/net/wireless/marvell/mwifiex/tdls.c b/drivers/net/wirele=
ss/marvell/mwifiex/tdls.c
index 0a5f340876c3..18e8c04d14c4 100644
--- a/drivers/net/wireless/marvell/mwifiex/tdls.c
+++ b/drivers/net/wireless/marvell/mwifiex/tdls.c
@@ -1490,7 +1490,7 @@ void mwifiex_clean_auto_tdls(struct mwifiex_private *pr=
iv)
 	    priv->adapter->auto_tdls &&
 	    priv->bss_type =3D=3D MWIFIEX_BSS_TYPE_STA) {
 		priv->auto_tdls_timer_active =3D false;
-		del_timer(&priv->auto_tdls_timer);
+		timer_delete(&priv->auto_tdls_timer);
 		mwifiex_flush_auto_tdls_list(priv);
 	}
 }
diff --git a/drivers/net/wireless/marvell/mwifiex/usb.c b/drivers/net/wireles=
s/marvell/mwifiex/usb.c
index 3034c4405cb5..2f565397cf36 100644
--- a/drivers/net/wireless/marvell/mwifiex/usb.c
+++ b/drivers/net/wireless/marvell/mwifiex/usb.c
@@ -877,7 +877,7 @@ static int mwifiex_usb_prepare_tx_aggr_skb(struct mwifiex=
_adapter *adapter,
 	 * write complete, delete the tx_aggr timer
 	 */
 	if (port->tx_aggr.timer_cnxt.is_hold_timer_set) {
-		del_timer(&port->tx_aggr.timer_cnxt.hold_timer);
+		timer_delete(&port->tx_aggr.timer_cnxt.hold_timer);
 		port->tx_aggr.timer_cnxt.is_hold_timer_set =3D false;
 		port->tx_aggr.timer_cnxt.hold_tmo_msecs =3D 0;
 	}
@@ -1354,7 +1354,7 @@ static void mwifiex_usb_cleanup_tx_aggr(struct mwifiex_=
adapter *adapter)
 				mwifiex_write_data_complete(adapter, skb_tmp,
 							    0, -1);
 		if (port->tx_aggr.timer_cnxt.hold_timer.function)
-			del_timer_sync(&port->tx_aggr.timer_cnxt.hold_timer);
+			timer_delete_sync(&port->tx_aggr.timer_cnxt.hold_timer);
 		port->tx_aggr.timer_cnxt.is_hold_timer_set =3D false;
 		port->tx_aggr.timer_cnxt.hold_tmo_msecs =3D 0;
 	}
@@ -1557,7 +1557,7 @@ static int mwifiex_pm_wakeup_card(struct mwifiex_adapte=
r *adapter)
 {
 	/* Simulation of HS_AWAKE event */
 	adapter->pm_wakeup_fw_try =3D false;
-	del_timer(&adapter->wakeup_timer);
+	timer_delete(&adapter->wakeup_timer);
 	adapter->pm_wakeup_card_req =3D false;
 	adapter->ps_state =3D PS_STATE_AWAKE;
=20
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/w=
ireless/mediatek/mt76/mt7615/main.c
index 2e7b05eeef7a..c54005df08ca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -97,7 +97,7 @@ static void mt7615_stop(struct ieee80211_hw *hw, bool suspe=
nd)
 	struct mt7615_phy *phy =3D mt7615_hw_phy(hw);
=20
 	cancel_delayed_work_sync(&phy->mt76->mac_work);
-	del_timer_sync(&phy->roc_timer);
+	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
=20
 	cancel_delayed_work_sync(&dev->pm.ps_work);
@@ -1194,7 +1194,7 @@ static int mt7615_cancel_remain_on_channel(struct ieee8=
0211_hw *hw,
 	if (!test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		return 0;
=20
-	del_timer_sync(&phy->roc_timer);
+	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
=20
 	mt7615_mutex_acquire(phy->dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/pci_mac.c
index c2e4e6aabd9f..b795d11d943d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
@@ -220,12 +220,12 @@ void mt7615_mac_reset_work(struct work_struct *work)
 	set_bit(MT76_MCU_RESET, &dev->mphy.state);
 	wake_up(&dev->mt76.mcu.wait);
 	cancel_delayed_work_sync(&dev->mphy.mac_work);
-	del_timer_sync(&dev->phy.roc_timer);
+	timer_delete_sync(&dev->phy.roc_timer);
 	cancel_work_sync(&dev->phy.roc_work);
 	if (phy2) {
 		set_bit(MT76_RESET, &phy2->mt76->state);
 		cancel_delayed_work_sync(&phy2->mt76->mac_work);
-		del_timer_sync(&phy2->roc_timer);
+		timer_delete_sync(&phy2->roc_timer);
 		cancel_work_sync(&phy2->roc_work);
 	}
=20
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c b/drivers/net/wi=
reless/mediatek/mt76/mt7615/usb.c
index 4aa9fa1c4a23..d96e06b4fee1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
@@ -85,7 +85,7 @@ static void mt7663u_stop(struct ieee80211_hw *hw, bool susp=
end)
 	struct mt7615_dev *dev =3D hw->priv;
=20
 	clear_bit(MT76_STATE_RUNNING, &dev->mphy.state);
-	del_timer_sync(&phy->roc_timer);
+	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
 	cancel_delayed_work_sync(&phy->scan_work);
 	cancel_delayed_work_sync(&phy->mt76->mac_work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/w=
ireless/mediatek/mt76/mt7921/main.c
index 78b77a54d195..826c48a2ee69 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -364,7 +364,7 @@ void mt7921_roc_abort_sync(struct mt792x_dev *dev)
 {
 	struct mt792x_phy *phy =3D &dev->phy;
=20
-	del_timer_sync(&phy->roc_timer);
+	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
 	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		ieee80211_iterate_interfaces(mt76_hw(dev),
@@ -395,7 +395,7 @@ static int mt7921_abort_roc(struct mt792x_phy *phy, struc=
t mt792x_vif *vif)
 {
 	int err =3D 0;
=20
-	del_timer_sync(&phy->roc_timer);
+	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
=20
 	mt792x_mutex_acquire(phy->dev);
@@ -1476,7 +1476,7 @@ static void mt7921_abort_channel_switch(struct ieee8021=
1_hw *hw,
 {
 	struct mt792x_vif *mvif =3D (struct mt792x_vif *)vif->drv_priv;
=20
-	del_timer_sync(&mvif->csa_timer);
+	timer_delete_sync(&mvif->csa_timer);
 	cancel_work_sync(&mvif->csa_work);
 }
=20
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/w=
ireless/mediatek/mt76/mt7925/main.c
index e79364ac129e..66f327781947 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -453,7 +453,7 @@ void mt7925_roc_abort_sync(struct mt792x_dev *dev)
 {
 	struct mt792x_phy *phy =3D &dev->phy;
=20
-	del_timer_sync(&phy->roc_timer);
+	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
 	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		ieee80211_iterate_interfaces(mt76_hw(dev),
@@ -485,7 +485,7 @@ static int mt7925_abort_roc(struct mt792x_phy *phy,
 {
 	int err =3D 0;
=20
-	del_timer_sync(&phy->roc_timer);
+	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
=20
 	mt792x_mutex_acquire(phy->dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/w=
ireless/mediatek/mt76/mt792x_core.c
index 0f7806f6338d..38dd58f6e493 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -340,7 +340,7 @@ void mt792x_unassign_vif_chanctx(struct ieee80211_hw *hw,
 	mutex_unlock(&dev->mt76.mutex);
=20
 	if (vif->bss_conf.csa_active) {
-		del_timer_sync(&mvif->csa_timer);
+		timer_delete_sync(&mvif->csa_timer);
 		cancel_work_sync(&mvif->csa_work);
 	}
 }
diff --git a/drivers/net/wireless/microchip/wilc1000/hif.c b/drivers/net/wire=
less/microchip/wilc1000/hif.c
index bba53307b960..cb46a39ef757 100644
--- a/drivers/net/wireless/microchip/wilc1000/hif.c
+++ b/drivers/net/wireless/microchip/wilc1000/hif.c
@@ -643,7 +643,7 @@ static inline void host_int_parse_assoc_resp_info(struct =
wilc_vif *vif,
 		}
 	}
=20
-	del_timer(&hif_drv->connect_timer);
+	timer_delete(&hif_drv->connect_timer);
 	conn_info->conn_result(CONN_DISCONN_EVENT_CONN_RESP, mac_status,
 			       hif_drv->conn_info.priv);
=20
@@ -669,7 +669,7 @@ void wilc_handle_disconnect(struct wilc_vif *vif)
 	struct host_if_drv *hif_drv =3D vif->hif_drv;
=20
 	if (hif_drv->usr_scan_req.scan_result) {
-		del_timer(&hif_drv->scan_timer);
+		timer_delete(&hif_drv->scan_timer);
 		handle_scan_done(vif, SCAN_EVENT_ABORTED);
 	}
=20
@@ -713,7 +713,7 @@ static void handle_rcvd_gnrl_async_info(struct work_struc=
t *work)
 		if (hif_drv->hif_state =3D=3D HOST_IF_CONNECTED) {
 			wilc_handle_disconnect(vif);
 		} else if (hif_drv->usr_scan_req.scan_result) {
-			del_timer(&hif_drv->scan_timer);
+			timer_delete(&hif_drv->scan_timer);
 			handle_scan_done(vif, SCAN_EVENT_ABORTED);
 		}
 	}
@@ -746,7 +746,7 @@ int wilc_disconnect(struct wilc_vif *vif)
 	conn_info =3D &hif_drv->conn_info;
=20
 	if (scan_req->scan_result) {
-		del_timer(&hif_drv->scan_timer);
+		timer_delete(&hif_drv->scan_timer);
 		scan_req->scan_result(SCAN_EVENT_ABORTED, NULL, scan_req->priv);
 		scan_req->scan_result =3D NULL;
 	}
@@ -754,7 +754,7 @@ int wilc_disconnect(struct wilc_vif *vif)
 	if (conn_info->conn_result) {
 		if (hif_drv->hif_state =3D=3D HOST_IF_WAITING_CONN_RESP ||
 		    hif_drv->hif_state =3D=3D HOST_IF_EXTERNAL_AUTH)
-			del_timer(&hif_drv->connect_timer);
+			timer_delete(&hif_drv->connect_timer);
=20
 		conn_info->conn_result(CONN_DISCONN_EVENT_DISCONN_NOTIF, 0,
 				       conn_info->priv);
@@ -959,7 +959,7 @@ static void listen_timer_cb(struct timer_list *t)
 	int result;
 	struct host_if_msg *msg;
=20
-	del_timer(&vif->hif_drv->remain_on_ch_timer);
+	timer_delete(&vif->hif_drv->remain_on_ch_timer);
=20
 	msg =3D wilc_alloc_work(vif, wilc_handle_listen_state_expired, false);
 	if (IS_ERR(msg))
@@ -1066,7 +1066,7 @@ static void handle_scan_complete(struct work_struct *wo=
rk)
 {
 	struct host_if_msg *msg =3D container_of(work, struct host_if_msg, work);
=20
-	del_timer(&msg->vif->hif_drv->scan_timer);
+	timer_delete(&msg->vif->hif_drv->scan_timer);
=20
 	handle_scan_done(msg->vif, SCAN_EVENT_DONE);
=20
@@ -1551,7 +1551,7 @@ int wilc_deinit(struct wilc_vif *vif)
=20
 	timer_shutdown_sync(&hif_drv->scan_timer);
 	timer_shutdown_sync(&hif_drv->connect_timer);
-	del_timer_sync(&vif->periodic_rssi);
+	timer_delete_sync(&vif->periodic_rssi);
 	timer_shutdown_sync(&hif_drv->remain_on_ch_timer);
=20
 	if (hif_drv->usr_scan_req.scan_result) {
@@ -1718,7 +1718,7 @@ int wilc_listen_state_expired(struct wilc_vif *vif, u64=
 cookie)
 		return -EFAULT;
 	}
=20
-	del_timer(&vif->hif_drv->remain_on_ch_timer);
+	timer_delete(&vif->hif_drv->remain_on_ch_timer);
=20
 	return wilc_handle_roc_expired(vif, cookie);
 }
diff --git a/drivers/net/wireless/purelifi/plfxlc/usb.c b/drivers/net/wireles=
s/purelifi/plfxlc/usb.c
index 56d1139ba8bc..10d2e2124ff8 100644
--- a/drivers/net/wireless/purelifi/plfxlc/usb.c
+++ b/drivers/net/wireless/purelifi/plfxlc/usb.c
@@ -714,8 +714,8 @@ static void disconnect(struct usb_interface *intf)
 	mac =3D plfxlc_hw_mac(hw);
 	usb =3D &mac->chip.usb;
=20
-	del_timer_sync(&usb->tx.tx_retry_timer);
-	del_timer_sync(&usb->sta_queue_cleanup);
+	timer_delete_sync(&usb->tx.tx_retry_timer);
+	timer_delete_sync(&usb->sta_queue_cleanup);
=20
 	ieee80211_unregister_hw(hw);
=20
diff --git a/drivers/net/wireless/realtek/rtlwifi/base.c b/drivers/net/wirele=
ss/realtek/rtlwifi/base.c
index ff61867d142f..6189edc1d8d7 100644
--- a/drivers/net/wireless/realtek/rtlwifi/base.c
+++ b/drivers/net/wireless/realtek/rtlwifi/base.c
@@ -473,7 +473,7 @@ void rtl_deinit_deferred_work(struct ieee80211_hw *hw, bo=
ol ips_wq)
 {
 	struct rtl_priv *rtlpriv =3D rtl_priv(hw);
=20
-	del_timer_sync(&rtlpriv->works.watchdog_timer);
+	timer_delete_sync(&rtlpriv->works.watchdog_timer);
=20
 	cancel_delayed_work_sync(&rtlpriv->works.watchdog_wq);
 	if (ips_wq)
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/sw.c b/drivers/ne=
t/wireless/realtek/rtlwifi/rtl8188ee/sw.c
index 35875cda30fc..2ad4523d1bef 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/sw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/sw.c
@@ -179,9 +179,9 @@ static void rtl88e_deinit_sw_vars(struct ieee80211_hw *hw)
 	}
=20
 	if (rtlpriv->psc.low_power_enable)
-		del_timer_sync(&rtlpriv->works.fw_clockoff_timer);
+		timer_delete_sync(&rtlpriv->works.fw_clockoff_timer);
=20
-	del_timer_sync(&rtlpriv->works.fast_antenna_training_timer);
+	timer_delete_sync(&rtlpriv->works.fast_antenna_training_timer);
 }
=20
 /* get bt coexist status */
diff --git a/drivers/net/wireless/rsi/rsi_91x_hal.c b/drivers/net/wireless/rs=
i/rsi_91x_hal.c
index 2cebe562a1f4..53827657abb2 100644
--- a/drivers/net/wireless/rsi/rsi_91x_hal.c
+++ b/drivers/net/wireless/rsi/rsi_91x_hal.c
@@ -493,7 +493,7 @@ static void bl_cmd_timeout(struct timer_list *t)
 	struct rsi_hw *adapter =3D from_timer(adapter, t, bl_cmd_timer);
=20
 	adapter->blcmd_timer_expired =3D true;
-	del_timer(&adapter->bl_cmd_timer);
+	timer_delete(&adapter->bl_cmd_timer);
 }
=20
 static int bl_start_cmd_timer(struct rsi_hw *adapter, u32 timeout)
@@ -511,7 +511,7 @@ static int bl_stop_cmd_timer(struct rsi_hw *adapter)
 {
 	adapter->blcmd_timer_expired =3D false;
 	if (timer_pending(&adapter->bl_cmd_timer))
-		del_timer(&adapter->bl_cmd_timer);
+		timer_delete(&adapter->bl_cmd_timer);
=20
 	return 0;
 }
diff --git a/drivers/net/wireless/rsi/rsi_91x_mac80211.c b/drivers/net/wirele=
ss/rsi/rsi_91x_mac80211.c
index 3425a473b9a1..9db08200f4fa 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mac80211.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
@@ -1754,7 +1754,7 @@ void rsi_roc_timeout(struct timer_list *t)
 	ieee80211_remain_on_channel_expired(common->priv->hw);
=20
 	if (timer_pending(&common->roc_timer))
-		del_timer(&common->roc_timer);
+		timer_delete(&common->roc_timer);
=20
 	rsi_resume_conn_channel(common);
 	mutex_unlock(&common->mutex);
@@ -1776,7 +1776,7 @@ static int rsi_mac80211_roc(struct ieee80211_hw *hw, st=
ruct ieee80211_vif *vif,
=20
 	if (timer_pending(&common->roc_timer)) {
 		rsi_dbg(INFO_ZONE, "Stop on-going ROC\n");
-		del_timer(&common->roc_timer);
+		timer_delete(&common->roc_timer);
 	}
 	common->roc_timer.expires =3D msecs_to_jiffies(duration) + jiffies;
 	add_timer(&common->roc_timer);
@@ -1820,7 +1820,7 @@ static int rsi_mac80211_cancel_roc(struct ieee80211_hw =
*hw,
 		return 0;
 	}
=20
-	del_timer(&common->roc_timer);
+	timer_delete(&common->roc_timer);
=20
 	rsi_resume_conn_channel(common);
 	mutex_unlock(&common->mutex);
diff --git a/drivers/net/wireless/st/cw1200/main.c b/drivers/net/wireless/st/=
cw1200/main.c
index a54a7b86864f..5d569eeb353f 100644
--- a/drivers/net/wireless/st/cw1200/main.c
+++ b/drivers/net/wireless/st/cw1200/main.c
@@ -458,7 +458,7 @@ static void cw1200_unregister_common(struct ieee80211_hw =
*dev)
=20
 	ieee80211_unregister_hw(dev);
=20
-	del_timer_sync(&priv->mcast_timeout);
+	timer_delete_sync(&priv->mcast_timeout);
 	cw1200_unregister_bh(priv);
=20
 	cw1200_debug_release(priv);
diff --git a/drivers/net/wireless/st/cw1200/pm.c b/drivers/net/wireless/st/cw=
1200/pm.c
index a20ab577a364..2002e3f9fe45 100644
--- a/drivers/net/wireless/st/cw1200/pm.c
+++ b/drivers/net/wireless/st/cw1200/pm.c
@@ -105,7 +105,7 @@ int cw1200_pm_init(struct cw1200_pm_state *pm,
=20
 void cw1200_pm_deinit(struct cw1200_pm_state *pm)
 {
-	del_timer_sync(&pm->stay_awake);
+	timer_delete_sync(&pm->stay_awake);
 }
=20
 void cw1200_pm_stay_awake(struct cw1200_pm_state *pm,
diff --git a/drivers/net/wireless/st/cw1200/queue.c b/drivers/net/wireless/st=
/cw1200/queue.c
index 259739e53fc1..4fd76183c368 100644
--- a/drivers/net/wireless/st/cw1200/queue.c
+++ b/drivers/net/wireless/st/cw1200/queue.c
@@ -244,7 +244,7 @@ void cw1200_queue_stats_deinit(struct cw1200_queue_stats =
*stats)
 void cw1200_queue_deinit(struct cw1200_queue *queue)
 {
 	cw1200_queue_clear(queue);
-	del_timer_sync(&queue->gc);
+	timer_delete_sync(&queue->gc);
 	INIT_LIST_HEAD(&queue->free_pool);
 	kfree(queue->pool);
 	kfree(queue->link_map_cache);
diff --git a/drivers/net/wireless/st/cw1200/sta.c b/drivers/net/wireless/st/c=
w1200/sta.c
index c259da8161e4..444272caf124 100644
--- a/drivers/net/wireless/st/cw1200/sta.c
+++ b/drivers/net/wireless/st/cw1200/sta.c
@@ -113,7 +113,7 @@ void cw1200_stop(struct ieee80211_hw *dev, bool suspend)
 	cancel_work_sync(&priv->unjoin_work);
 	cancel_delayed_work_sync(&priv->link_id_gc_work);
 	flush_workqueue(priv->workqueue);
-	del_timer_sync(&priv->mcast_timeout);
+	timer_delete_sync(&priv->mcast_timeout);
 	mutex_lock(&priv->conf_mutex);
 	priv->mode =3D NL80211_IFTYPE_UNSPECIFIED;
 	priv->listening =3D false;
@@ -2102,7 +2102,7 @@ void cw1200_multicast_stop_work(struct work_struct *wor=
k)
 		container_of(work, struct cw1200_common, multicast_stop_work);
=20
 	if (priv->aid0_bit_set) {
-		del_timer_sync(&priv->mcast_timeout);
+		timer_delete_sync(&priv->mcast_timeout);
 		wsm_lock_tx(priv);
 		priv->aid0_bit_set =3D false;
 		cw1200_set_tim_impl(priv, false);
@@ -2170,7 +2170,7 @@ void cw1200_suspend_resume(struct cw1200_common *priv,
 		}
 		spin_unlock_bh(&priv->ps_state_lock);
 		if (cancel_tmo)
-			del_timer_sync(&priv->mcast_timeout);
+			timer_delete_sync(&priv->mcast_timeout);
 	} else {
 		spin_lock_bh(&priv->ps_state_lock);
 		cw1200_ps_notify(priv, arg->link_id, arg->stop);
diff --git a/drivers/net/wireless/ti/wlcore/main.c b/drivers/net/wireless/ti/=
wlcore/main.c
index 8fb58a5d911c..ea9bc4717a85 100644
--- a/drivers/net/wireless/ti/wlcore/main.c
+++ b/drivers/net/wireless/ti/wlcore/main.c
@@ -117,7 +117,7 @@ int wl1271_recalc_rx_streaming(struct wl1271 *wl, struct =
wl12xx_vif *wlvif)
 	else {
 		ret =3D wl1271_set_rx_streaming(wl, wlvif, false);
 		/* don't cancel_work_sync since we might deadlock */
-		del_timer_sync(&wlvif->rx_streaming_timer);
+		timer_delete_sync(&wlvif->rx_streaming_timer);
 	}
 out:
 	return ret;
@@ -2841,7 +2841,7 @@ static void __wl1271_op_remove_interface(struct wl1271 =
*wl,
 unlock:
 	mutex_unlock(&wl->mutex);
=20
-	del_timer_sync(&wlvif->rx_streaming_timer);
+	timer_delete_sync(&wlvif->rx_streaming_timer);
 	cancel_work_sync(&wlvif->rx_streaming_enable_work);
 	cancel_work_sync(&wlvif->rx_streaming_disable_work);
 	cancel_work_sync(&wlvif->rc_update_work);
diff --git a/drivers/net/xen-netback/interface.c b/drivers/net/xen-netback/in=
terface.c
index 325fcb3d1075..a0a438881388 100644
--- a/drivers/net/xen-netback/interface.c
+++ b/drivers/net/xen-netback/interface.c
@@ -329,7 +329,7 @@ static void xenvif_down(struct xenvif *vif)
 		if (queue->tx_irq !=3D queue->rx_irq)
 			disable_irq(queue->rx_irq);
 		napi_disable(&queue->napi);
-		del_timer_sync(&queue->credit_timeout);
+		timer_delete_sync(&queue->credit_timeout);
 	}
 }
=20
diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 63fe51d0e64d..fc52d5c4c69b 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1819,7 +1819,7 @@ static void xennet_disconnect_backend(struct netfront_i=
nfo *info)
 	for (i =3D 0; i < num_queues && info->queues; ++i) {
 		struct netfront_queue *queue =3D &info->queues[i];
=20
-		del_timer_sync(&queue->rx_refill_timer);
+		timer_delete_sync(&queue->rx_refill_timer);
=20
 		if (queue->tx_irq && (queue->tx_irq =3D=3D queue->rx_irq))
 			unbind_from_irqhandler(queue->tx_irq, queue);
diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
index 93094418fd24..43ce0c9b2355 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.c
+++ b/drivers/nfc/nfcmrvl/fw_dnld.c
@@ -102,10 +102,10 @@ static void fw_dnld_over(struct nfcmrvl_private *priv, =
u32 error)
 	atomic_set(&priv->ndev->cmd_cnt, 0);
=20
 	if (timer_pending(&priv->ndev->cmd_timer))
-		del_timer_sync(&priv->ndev->cmd_timer);
+		timer_delete_sync(&priv->ndev->cmd_timer);
=20
 	if (timer_pending(&priv->fw_dnld.timer))
-		del_timer_sync(&priv->fw_dnld.timer);
+		timer_delete_sync(&priv->fw_dnld.timer);
=20
 	nfc_info(priv->dev, "FW loading over (%d)]\n", error);
=20
@@ -464,7 +464,7 @@ void nfcmrvl_fw_dnld_recv_frame(struct nfcmrvl_private *p=
riv,
 {
 	/* Discard command timer */
 	if (timer_pending(&priv->ndev->cmd_timer))
-		del_timer_sync(&priv->ndev->cmd_timer);
+		timer_delete_sync(&priv->ndev->cmd_timer);
=20
 	/* Allow next command */
 	atomic_set(&priv->ndev->cmd_cnt, 1);
diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index e2bc67300a91..34c40d10e260 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1515,7 +1515,7 @@ static int pn533_poll_complete(struct pn533 *dev, void =
*arg,
 	cur_mod =3D dev->poll_mod_active[dev->poll_mod_curr];
=20
 	if (cur_mod->len =3D=3D 0) { /* Target mode */
-		del_timer(&dev->listen_timer);
+		timer_delete(&dev->listen_timer);
 		rc =3D pn533_init_target_complete(dev, resp);
 		goto done;
 	}
@@ -1749,7 +1749,7 @@ static void pn533_stop_poll(struct nfc_dev *nfc_dev)
 {
 	struct pn533 *dev =3D nfc_get_drvdata(nfc_dev);
=20
-	del_timer(&dev->listen_timer);
+	timer_delete(&dev->listen_timer);
=20
 	if (!dev->poll_mod_count) {
 		dev_dbg(dev->dev,
diff --git a/drivers/nfc/pn533/uart.c b/drivers/nfc/pn533/uart.c
index cfbbe0713317..580c9193e4a7 100644
--- a/drivers/nfc/pn533/uart.c
+++ b/drivers/nfc/pn533/uart.c
@@ -209,7 +209,7 @@ static size_t pn532_receive_buf(struct serdev_device *ser=
dev,
 	struct pn532_uart_phy *dev =3D serdev_device_get_drvdata(serdev);
 	size_t i;
=20
-	del_timer(&dev->cmd_timeout);
+	timer_delete(&dev->cmd_timeout);
 	for (i =3D 0; i < count; i++) {
 		skb_put_u8(dev->recv_skb, *data++);
 		if (!pn532_uart_rx_is_frame(dev->recv_skb))
diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index d2aa9f766738..8feac119a4bc 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -161,8 +161,8 @@ static void llt_ndlc_rcv_queue(struct llt_ndlc *ndlc)
 			case PCB_SYNC_ACK:
 				skb =3D skb_dequeue(&ndlc->ack_pending_q);
 				kfree_skb(skb);
-				del_timer_sync(&ndlc->t1_timer);
-				del_timer_sync(&ndlc->t2_timer);
+				timer_delete_sync(&ndlc->t1_timer);
+				timer_delete_sync(&ndlc->t2_timer);
 				ndlc->t2_active =3D false;
 				ndlc->t1_active =3D false;
 				break;
@@ -213,8 +213,8 @@ static void llt_ndlc_sm_work(struct work_struct *work)
 		pr_debug("Handle T2(recv DATA) elapsed (T2 now inactive)\n");
 		ndlc->t2_active =3D false;
 		ndlc->t1_active =3D false;
-		del_timer_sync(&ndlc->t1_timer);
-		del_timer_sync(&ndlc->t2_timer);
+		timer_delete_sync(&ndlc->t1_timer);
+		timer_delete_sync(&ndlc->t2_timer);
 		ndlc_close(ndlc);
 		ndlc->hard_fault =3D -EREMOTEIO;
 	}
@@ -283,8 +283,8 @@ EXPORT_SYMBOL(ndlc_probe);
 void ndlc_remove(struct llt_ndlc *ndlc)
 {
 	/* cancel timers */
-	del_timer_sync(&ndlc->t1_timer);
-	del_timer_sync(&ndlc->t2_timer);
+	timer_delete_sync(&ndlc->t1_timer);
+	timer_delete_sync(&ndlc->t2_timer);
 	ndlc->t2_active =3D false;
 	ndlc->t1_active =3D false;
 	/* cancel work */
diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index b2f1ced8e6dd..8cfe5405bae6 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -257,7 +257,7 @@ static void st_nci_hci_admin_event_received(struct nci_de=
v *ndev,
 	case ST_NCI_EVT_HOT_PLUG:
 		if (info->se_info.se_active) {
 			if (!ST_NCI_EVT_HOT_PLUG_IS_INHIBITED(skb)) {
-				del_timer_sync(&info->se_info.se_active_timer);
+				timer_delete_sync(&info->se_info.se_active_timer);
 				info->se_info.se_active =3D false;
 				complete(&info->se_info.req_completion);
 			} else {
@@ -282,7 +282,7 @@ static int st_nci_hci_apdu_reader_event_received(struct n=
ci_dev *ndev,
=20
 	switch (event) {
 	case ST_NCI_EVT_TRANSMIT_DATA:
-		del_timer_sync(&info->se_info.bwi_timer);
+		timer_delete_sync(&info->se_info.bwi_timer);
 		info->se_info.bwi_active =3D false;
 		info->se_info.cb(info->se_info.cb_context,
 				 skb->data, skb->len, 0);
@@ -415,7 +415,7 @@ void st_nci_hci_cmd_received(struct nci_dev *ndev, u8 pip=
e, u8 cmd,
=20
 		if (ndev->hci_dev->count_pipes =3D=3D
 		    ndev->hci_dev->expected_pipes) {
-			del_timer_sync(&info->se_info.se_active_timer);
+			timer_delete_sync(&info->se_info.se_active_timer);
 			info->se_info.se_active =3D false;
 			ndev->hci_dev->count_pipes =3D 0;
 			complete(&info->se_info.req_completion);
@@ -751,9 +751,9 @@ void st_nci_se_deinit(struct nci_dev *ndev)
 	struct st_nci_info *info =3D nci_get_drvdata(ndev);
=20
 	if (info->se_info.bwi_active)
-		del_timer_sync(&info->se_info.bwi_timer);
+		timer_delete_sync(&info->se_info.bwi_timer);
 	if (info->se_info.se_active)
-		del_timer_sync(&info->se_info.se_active_timer);
+		timer_delete_sync(&info->se_info.se_active_timer);
=20
 	info->se_info.se_active =3D false;
 	info->se_info.bwi_active =3D false;
diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index 161caf2675cf..bec6f607c32c 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -844,7 +844,7 @@ static void st21nfca_hci_cmd_received(struct nfc_hci_dev =
*hdev, u8 pipe, u8 cmd,
 			info->se_info.count_pipes++;
=20
 		if (info->se_info.count_pipes =3D=3D info->se_info.expected_pipes) {
-			del_timer_sync(&info->se_info.se_active_timer);
+			timer_delete_sync(&info->se_info.se_active_timer);
 			info->se_info.se_active =3D false;
 			info->se_info.count_pipes =3D 0;
 			complete(&info->se_info.req_completion);
@@ -864,7 +864,7 @@ static int st21nfca_admin_event_received(struct nfc_hci_d=
ev *hdev, u8 event,
 	case ST21NFCA_EVT_HOT_PLUG:
 		if (info->se_info.se_active) {
 			if (!ST21NFCA_EVT_HOT_PLUG_IS_INHIBITED(skb)) {
-				del_timer_sync(&info->se_info.se_active_timer);
+				timer_delete_sync(&info->se_info.se_active_timer);
 				info->se_info.se_active =3D false;
 				complete(&info->se_info.req_completion);
 			} else {
diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
index dae288bebcb5..9a50f3c03bd4 100644
--- a/drivers/nfc/st21nfca/se.c
+++ b/drivers/nfc/st21nfca/se.c
@@ -380,7 +380,7 @@ int st21nfca_apdu_reader_event_received(struct nfc_hci_de=
v *hdev,
=20
 	switch (event) {
 	case ST21NFCA_EVT_TRANSMIT_DATA:
-		del_timer_sync(&info->se_info.bwi_timer);
+		timer_delete_sync(&info->se_info.bwi_timer);
 		cancel_work_sync(&info->se_info.timeout_work);
 		info->se_info.bwi_active =3D false;
 		r =3D nfc_hci_send_event(hdev, ST21NFCA_DEVICE_MGNT_GATE,
@@ -435,9 +435,9 @@ void st21nfca_se_deinit(struct nfc_hci_dev *hdev)
 	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
=20
 	if (info->se_info.bwi_active)
-		del_timer_sync(&info->se_info.bwi_timer);
+		timer_delete_sync(&info->se_info.bwi_timer);
 	if (info->se_info.se_active)
-		del_timer_sync(&info->se_info.se_active_timer);
+		timer_delete_sync(&info->se_info.se_active_timer);
=20
 	cancel_work_sync(&info->se_info.timeout_work);
 	info->se_info.bwi_active =3D false;
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 6b12ca80aa27..89be5911b25d 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -860,7 +860,7 @@ static int nvme_read_ana_log(struct nvme_ctrl *ctrl)
 	if (nr_change_groups)
 		mod_timer(&ctrl->anatt_timer, ctrl->anatt * HZ * 2 + jiffies);
 	else
-		del_timer_sync(&ctrl->anatt_timer);
+		timer_delete_sync(&ctrl->anatt_timer);
 out_unlock:
 	mutex_unlock(&ctrl->ana_lock);
 	return error;
@@ -900,7 +900,7 @@ void nvme_mpath_stop(struct nvme_ctrl *ctrl)
 {
 	if (!nvme_ctrl_use_ana(ctrl))
 		return;
-	del_timer_sync(&ctrl->anatt_timer);
+	timer_delete_sync(&ctrl->anatt_timer);
 	cancel_work_sync(&ctrl->ana_work);
 }
=20
diff --git a/drivers/parport/ieee1284.c b/drivers/parport/ieee1284.c
index 4547ac44c8d4..474515d27e9c 100644
--- a/drivers/parport/ieee1284.c
+++ b/drivers/parport/ieee1284.c
@@ -73,7 +73,7 @@ int parport_wait_event (struct parport *port, signed long t=
imeout)
 	timer_setup(&port->timer, timeout_waiting_on_port, 0);
 	mod_timer(&port->timer, jiffies + timeout);
 	ret =3D down_interruptible (&port->physport->ieee1284.irq);
-	if (!del_timer_sync(&port->timer) && !ret)
+	if (!timer_delete_sync(&port->timer) && !ret)
 		/* Timed out. */
 		ret =3D 1;
=20
diff --git a/drivers/pci/hotplug/cpqphp_ctrl.c b/drivers/pci/hotplug/cpqphp_c=
trl.c
index c01968ef0bd7..20529d1a3c44 100644
--- a/drivers/pci/hotplug/cpqphp_ctrl.c
+++ b/drivers/pci/hotplug/cpqphp_ctrl.c
@@ -1794,7 +1794,7 @@ static void interrupt_event_handler(struct controller *=
ctrl)
 				} else if (ctrl->event_queue[loop].event_type =3D=3D
 					   INT_BUTTON_CANCEL) {
 					dbg("button cancel\n");
-					del_timer(&p_slot->task_event);
+					timer_delete(&p_slot->task_event);
=20
 					mutex_lock(&ctrl->crit_sect);
=20
diff --git a/drivers/pci/hotplug/shpchp_hpc.c b/drivers/pci/hotplug/shpchp_hp=
c.c
index bfbec7c1a6b1..387b85585263 100644
--- a/drivers/pci/hotplug/shpchp_hpc.c
+++ b/drivers/pci/hotplug/shpchp_hpc.c
@@ -564,7 +564,7 @@ void shpchp_release_ctlr(struct controller *ctrl)
 	shpc_writel(ctrl, SERR_INTR_ENABLE, serr_int);
=20
 	if (shpchp_poll_mode)
-		del_timer(&ctrl->poll_timer);
+		timer_delete(&ctrl->poll_timer);
 	else {
 		free_irq(ctrl->pci_dev->irq, ctrl);
 		pci_disable_msi(ctrl->pci_dev);
diff --git a/drivers/pcmcia/i82365.c b/drivers/pcmcia/i82365.c
index 86a357837a7b..1e464b951ed2 100644
--- a/drivers/pcmcia/i82365.c
+++ b/drivers/pcmcia/i82365.c
@@ -1324,7 +1324,7 @@ static void __exit exit_i82365(void)
     }
     platform_device_unregister(i82365_device);
     if (poll_interval !=3D 0)
-	del_timer_sync(&poll_timer);
+	timer_delete_sync(&poll_timer);
     if (grab_irq !=3D 0)
 	free_irq(cs_irq, pcic_interrupt);
     for (i =3D 0; i < sockets; i++) {
diff --git a/drivers/pcmcia/soc_common.c b/drivers/pcmcia/soc_common.c
index 1deb9960db34..d361124db993 100644
--- a/drivers/pcmcia/soc_common.c
+++ b/drivers/pcmcia/soc_common.c
@@ -766,7 +766,7 @@ EXPORT_SYMBOL(soc_pcmcia_init_one);
=20
 void soc_pcmcia_remove_one(struct soc_pcmcia_socket *skt)
 {
-	del_timer_sync(&skt->poll_timer);
+	timer_delete_sync(&skt->poll_timer);
=20
 	pcmcia_unregister_socket(&skt->socket);
=20
@@ -865,7 +865,7 @@ int soc_pcmcia_add_one(struct soc_pcmcia_socket *skt)
 	return ret;
=20
  out_err_8:
-	del_timer_sync(&skt->poll_timer);
+	timer_delete_sync(&skt->poll_timer);
 	pcmcia_unregister_socket(&skt->socket);
=20
  out_err_7:
diff --git a/drivers/pcmcia/tcic.c b/drivers/pcmcia/tcic.c
index 5ef888688e23..060aed0edc65 100644
--- a/drivers/pcmcia/tcic.c
+++ b/drivers/pcmcia/tcic.c
@@ -509,7 +509,7 @@ static void __exit exit_tcic(void)
 {
     int i;
=20
-    del_timer_sync(&poll_timer);
+    timer_delete_sync(&poll_timer);
     if (cs_irq !=3D 0) {
 	tcic_aux_setw(TCIC_AUX_SYSCFG, TCIC_SYSCFG_AUTOBUSY|0x0a00);
 	free_irq(cs_irq, tcic_interrupt);
diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mell=
anox/mlxbf-tmfifo.c
index 300cdaa75a17..aae99adb29eb 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -1320,7 +1320,7 @@ static void mlxbf_tmfifo_cleanup(struct mlxbf_tmfifo *f=
ifo)
 	int i;
=20
 	fifo->is_ready =3D false;
-	del_timer_sync(&fifo->timer);
+	timer_delete_sync(&fifo->timer);
 	mlxbf_tmfifo_disable_irqs(fifo);
 	cancel_work_sync(&fifo->work);
 	for (i =3D 0; i < MLXBF_TMFIFO_VDEV_MAX; i++)
diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ip=
s.c
index 79a7b68c7373..5d717b1c23cf 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1108,7 +1108,7 @@ static int ips_monitor(void *data)
 			last_sample_period =3D 1;
 	} while (!kthread_should_stop());
=20
-	del_timer_sync(&ips->timer);
+	timer_delete_sync(&ips->timer);
=20
 	dev_dbg(ips->dev, "ips-monitor thread stopped\n");
=20
diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-l=
aptop.c
index 3197aaa69da7..b52390fbd743 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -538,7 +538,7 @@ static void sony_laptop_remove_input(void)
 	if (!atomic_dec_and_test(&sony_laptop_input.users))
 		return;
=20
-	del_timer_sync(&sony_laptop_input.release_key_timer);
+	timer_delete_sync(&sony_laptop_input.release_key_timer);
=20
 	/*
 	 * Generate key-up events for remaining keys. Note that we don't
diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index 75c1bae30a7c..374ceefd6f2a 100644
--- a/drivers/pps/clients/pps-gpio.c
+++ b/drivers/pps/clients/pps-gpio.c
@@ -229,7 +229,7 @@ static void pps_gpio_remove(struct platform_device *pdev)
 	struct pps_gpio_device_data *data =3D platform_get_drvdata(pdev);
=20
 	pps_unregister_source(data->pps);
-	del_timer_sync(&data->echo_timer);
+	timer_delete_sync(&data->echo_timer);
 	/* reset echo pin in any case */
 	gpiod_set_value(data->echo_pin, 0);
 	dev_info(&pdev->dev, "removed IRQ %d as PPS source\n", data->irq);
diff --git a/drivers/pps/clients/pps-ktimer.c b/drivers/pps/clients/pps-ktime=
r.c
index 2f465549b843..121bd29d863d 100644
--- a/drivers/pps/clients/pps-ktimer.c
+++ b/drivers/pps/clients/pps-ktimer.c
@@ -58,7 +58,7 @@ static void __exit pps_ktimer_exit(void)
 {
 	dev_dbg(&pps->dev, "ktimer PPS source unregistered\n");
=20
-	del_timer_sync(&ktimer);
+	timer_delete_sync(&ktimer);
 	pps_unregister_source(pps);
 }
=20
diff --git a/drivers/pps/generators/pps_gen-dummy.c b/drivers/pps/generators/=
pps_gen-dummy.c
index 55de4aecf35e..547fa7fe29f4 100644
--- a/drivers/pps/generators/pps_gen-dummy.c
+++ b/drivers/pps/generators/pps_gen-dummy.c
@@ -52,7 +52,7 @@ static int pps_gen_dummy_enable(struct pps_gen_device *pps_=
gen, bool enable)
 	if (enable)
 		mod_timer(&ktimer, jiffies + get_random_delay());
 	else
-		del_timer_sync(&ktimer);
+		timer_delete_sync(&ktimer);
=20
 	return 0;
 }
@@ -73,7 +73,7 @@ static const struct pps_gen_source_info pps_gen_dummy_info =
=3D {
=20
 static void __exit pps_gen_dummy_exit(void)
 {
-	del_timer_sync(&ktimer);
+	timer_delete_sync(&ktimer);
 	pps_gen_unregister_source(pps_gen);
 }
=20
diff --git a/drivers/pps/generators/pps_gen_tio.c b/drivers/pps/generators/pp=
s_gen_tio.c
index 6c46b46c66cd..1d5ffe055463 100644
--- a/drivers/pps/generators/pps_gen_tio.c
+++ b/drivers/pps/generators/pps_gen_tio.c
@@ -227,8 +227,8 @@ static int pps_gen_tio_probe(struct platform_device *pdev)
 		return PTR_ERR(tio->base);
=20
 	pps_tio_disable(tio);
-	hrtimer_init(&tio->timer, CLOCK_REALTIME, HRTIMER_MODE_ABS);
-	tio->timer.function =3D hrtimer_callback;
+	hrtimer_setup(&tio->timer, hrtimer_callback, CLOCK_REALTIME,
+		      HRTIMER_MODE_ABS);
 	spin_lock_init(&tio->lock);
 	platform_set_drvdata(pdev, &tio);
=20
diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index b25635c5c745..7945c6be1f7c 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -4499,7 +4499,7 @@ ptp_ocp_detach(struct ptp_ocp *bp)
 	ptp_ocp_detach_sysfs(bp);
 	ptp_ocp_attr_group_del(bp);
 	if (timer_pending(&bp->watchdog))
-		del_timer_sync(&bp->watchdog);
+		timer_delete_sync(&bp->watchdog);
 	if (bp->ts0)
 		ptp_ocp_unregister_ext(bp->ts0);
 	if (bp->ts1)
diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index c4a3ab53dcd4..0eeae5bcc3aa 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -90,7 +90,7 @@ static int clear_uie(struct rtc_device *rtc)
 		rtc->stop_uie_polling =3D 1;
 		if (rtc->uie_timer_active) {
 			spin_unlock_irq(&rtc->irq_lock);
-			del_timer_sync(&rtc->uie_timer);
+			timer_delete_sync(&rtc->uie_timer);
 			spin_lock_irq(&rtc->irq_lock);
 			rtc->uie_timer_active =3D 0;
 		}
diff --git a/drivers/rtc/rtc-test.c b/drivers/rtc/rtc-test.c
index a68b8c884102..a9f5b9466fb5 100644
--- a/drivers/rtc/rtc-test.c
+++ b/drivers/rtc/rtc-test.c
@@ -44,7 +44,7 @@ static int test_rtc_set_alarm(struct device *dev, struct rt=
c_wkalrm *alrm)
 	timeout =3D rtc_tm_to_time64(&alrm->time) - ktime_get_real_seconds();
 	timeout -=3D rtd->offset;
=20
-	del_timer(&rtd->alarm);
+	timer_delete(&rtd->alarm);
=20
 	expires =3D jiffies + timeout * HZ;
 	if (expires > U32_MAX)
@@ -86,7 +86,7 @@ static int test_rtc_alarm_irq_enable(struct device *dev, un=
signed int enable)
 	if (enable)
 		add_timer(&rtd->alarm);
 	else
-		del_timer(&rtd->alarm);
+		timer_delete(&rtd->alarm);
=20
 	return 0;
 }
diff --git a/drivers/s390/block/dasd.c b/drivers/s390/block/dasd.c
index 31bfb49588c2..cf36d3bafeca 100644
--- a/drivers/s390/block/dasd.c
+++ b/drivers/s390/block/dasd.c
@@ -1507,7 +1507,7 @@ static void dasd_device_timeout(struct timer_list *t)
 void dasd_device_set_timer(struct dasd_device *device, int expires)
 {
 	if (expires =3D=3D 0)
-		del_timer(&device->timer);
+		timer_delete(&device->timer);
 	else
 		mod_timer(&device->timer, jiffies + expires);
 }
@@ -1518,7 +1518,7 @@ EXPORT_SYMBOL(dasd_device_set_timer);
  */
 void dasd_device_clear_timer(struct dasd_device *device)
 {
-	del_timer(&device->timer);
+	timer_delete(&device->timer);
 }
 EXPORT_SYMBOL(dasd_device_clear_timer);
=20
@@ -2692,7 +2692,7 @@ static void dasd_block_timeout(struct timer_list *t)
 void dasd_block_set_timer(struct dasd_block *block, int expires)
 {
 	if (expires =3D=3D 0)
-		del_timer(&block->timer);
+		timer_delete(&block->timer);
 	else
 		mod_timer(&block->timer, jiffies + expires);
 }
@@ -2703,7 +2703,7 @@ EXPORT_SYMBOL(dasd_block_set_timer);
  */
 void dasd_block_clear_timer(struct dasd_block *block)
 {
-	del_timer(&block->timer);
+	timer_delete(&block->timer);
 }
 EXPORT_SYMBOL(dasd_block_clear_timer);
=20
diff --git a/drivers/s390/char/con3270.c b/drivers/s390/char/con3270.c
index 1a3190848670..34f3820d7f74 100644
--- a/drivers/s390/char/con3270.c
+++ b/drivers/s390/char/con3270.c
@@ -793,7 +793,7 @@ static void tty3270_deactivate(struct raw3270_view *view)
 {
 	struct tty3270 *tp =3D container_of(view, struct tty3270, view);
=20
-	del_timer(&tp->timer);
+	timer_delete(&tp->timer);
 }
=20
 static void tty3270_irq(struct tty3270 *tp, struct raw3270_request *rq, stru=
ct irb *irb)
@@ -1060,7 +1060,7 @@ static void tty3270_free(struct raw3270_view *view)
 {
 	struct tty3270 *tp =3D container_of(view, struct tty3270, view);
=20
-	del_timer_sync(&tp->timer);
+	timer_delete_sync(&tp->timer);
 	tty3270_free_screen(tp->screen, tp->allocated_lines);
 	free_page((unsigned long)tp->converted_line);
 	kfree(tp->input);
diff --git a/drivers/s390/char/sclp.c b/drivers/s390/char/sclp.c
index 45bd001206a2..840be75e75d4 100644
--- a/drivers/s390/char/sclp.c
+++ b/drivers/s390/char/sclp.c
@@ -261,7 +261,7 @@ __sclp_queue_read_req(void)
 static inline void
 __sclp_set_request_timer(unsigned long time, void (*cb)(struct timer_list *))
 {
-	del_timer(&sclp_request_timer);
+	timer_delete(&sclp_request_timer);
 	sclp_request_timer.function =3D cb;
 	sclp_request_timer.expires =3D jiffies + time;
 	add_timer(&sclp_request_timer);
@@ -407,7 +407,7 @@ __sclp_start_request(struct sclp_req *req)
=20
 	if (sclp_running_state !=3D sclp_running_state_idle)
 		return 0;
-	del_timer(&sclp_request_timer);
+	timer_delete(&sclp_request_timer);
 	rc =3D sclp_service_call_trace(req->command, req->sccb);
 	req->start_count++;
=20
@@ -442,7 +442,7 @@ sclp_process_queue(void)
 		spin_unlock_irqrestore(&sclp_lock, flags);
 		return;
 	}
-	del_timer(&sclp_request_timer);
+	timer_delete(&sclp_request_timer);
 	while (!list_empty(&sclp_req_queue)) {
 		req =3D list_entry(sclp_req_queue.next, struct sclp_req, list);
 		rc =3D __sclp_start_request(req);
@@ -662,7 +662,7 @@ static void sclp_interrupt_handler(struct ext_code ext_co=
de,
 			!ok_response(finished_sccb, active_cmd));
=20
 	if (finished_sccb) {
-		del_timer(&sclp_request_timer);
+		timer_delete(&sclp_request_timer);
 		sclp_running_state =3D sclp_running_state_reset_pending;
 		req =3D __sclp_find_req(finished_sccb);
 		if (req) {
@@ -739,7 +739,7 @@ sclp_sync_wait(void)
 	/* Loop until driver state indicates finished request */
 	while (sclp_running_state !=3D sclp_running_state_idle) {
 		/* Check for expired request timer */
-		if (get_tod_clock_fast() > timeout && del_timer(&sclp_request_timer))
+		if (get_tod_clock_fast() > timeout && timer_delete(&sclp_request_timer))
 			sclp_request_timer.function(&sclp_request_timer);
 		cpu_relax();
 	}
@@ -1165,7 +1165,7 @@ sclp_check_interface(void)
 		 * with IRQs enabled. */
 		irq_subclass_unregister(IRQ_SUBCLASS_SERVICE_SIGNAL);
 		spin_lock_irqsave(&sclp_lock, flags);
-		del_timer(&sclp_request_timer);
+		timer_delete(&sclp_request_timer);
 		rc =3D -EBUSY;
 		if (sclp_init_req.status =3D=3D SCLP_REQ_DONE) {
 			if (sccb->header.response_code =3D=3D 0x20) {
diff --git a/drivers/s390/char/sclp_con.c b/drivers/s390/char/sclp_con.c
index 6a030ba38bf3..d8544c485808 100644
--- a/drivers/s390/char/sclp_con.c
+++ b/drivers/s390/char/sclp_con.c
@@ -109,7 +109,7 @@ static void sclp_console_sync_queue(void)
 	unsigned long flags;
=20
 	spin_lock_irqsave(&sclp_con_lock, flags);
-	del_timer(&sclp_con_timer);
+	timer_delete(&sclp_con_timer);
 	while (sclp_con_queue_running) {
 		spin_unlock_irqrestore(&sclp_con_lock, flags);
 		sclp_sync_wait();
diff --git a/drivers/s390/char/sclp_vt220.c b/drivers/s390/char/sclp_vt220.c
index 33b9c968dbcb..62979adcb381 100644
--- a/drivers/s390/char/sclp_vt220.c
+++ b/drivers/s390/char/sclp_vt220.c
@@ -231,7 +231,7 @@ sclp_vt220_emit_current(void)
 			list_add_tail(&sclp_vt220_current_request->list,
 				      &sclp_vt220_outqueue);
 			sclp_vt220_current_request =3D NULL;
-			del_timer(&sclp_vt220_timer);
+			timer_delete(&sclp_vt220_timer);
 		}
 		sclp_vt220_flush_later =3D 0;
 	}
@@ -798,7 +798,7 @@ sclp_vt220_notify(struct notifier_block *self,
 	sclp_vt220_emit_current();
=20
 	spin_lock_irqsave(&sclp_vt220_lock, flags);
-	del_timer(&sclp_vt220_timer);
+	timer_delete(&sclp_vt220_timer);
 	while (sclp_vt220_queue_running) {
 		spin_unlock_irqrestore(&sclp_vt220_lock, flags);
 		sclp_sync_wait();
diff --git a/drivers/s390/char/tape_core.c b/drivers/s390/char/tape_core.c
index ce8a440598a8..48e8417a5cff 100644
--- a/drivers/s390/char/tape_core.c
+++ b/drivers/s390/char/tape_core.c
@@ -1108,7 +1108,7 @@ __tape_do_irq (struct ccw_device *cdev, unsigned long i=
ntparm, struct irb *irb)
 				 struct tape_request, list);
 		if (req->status =3D=3D TAPE_REQUEST_LONG_BUSY) {
 			DBF_EVENT(3, "(%08x): del timer\n", device->cdev_id);
-			if (del_timer(&device->lb_timeout)) {
+			if (timer_delete(&device->lb_timeout)) {
 				tape_put_device(device);
 				__tape_start_next_request(device);
 			}
diff --git a/drivers/s390/char/tape_std.c b/drivers/s390/char/tape_std.c
index f7e75d9fedf6..b76038632883 100644
--- a/drivers/s390/char/tape_std.c
+++ b/drivers/s390/char/tape_std.c
@@ -73,7 +73,7 @@ tape_std_assign(struct tape_device *device)
=20
 	rc =3D tape_do_io_interruptible(device, request);
=20
-	del_timer_sync(&request->timer);
+	timer_delete_sync(&request->timer);
=20
 	if (rc !=3D 0) {
 		DBF_EVENT(3, "%08x: assign failed - device might be busy\n",
diff --git a/drivers/s390/cio/device_fsm.c b/drivers/s390/cio/device_fsm.c
index 42791fa0b80e..e1b1fbdabb1b 100644
--- a/drivers/s390/cio/device_fsm.c
+++ b/drivers/s390/cio/device_fsm.c
@@ -115,7 +115,7 @@ void
 ccw_device_set_timeout(struct ccw_device *cdev, int expires)
 {
 	if (expires =3D=3D 0)
-		del_timer(&cdev->private->timer);
+		timer_delete(&cdev->private->timer);
 	else
 		mod_timer(&cdev->private->timer, jiffies + expires);
 }
diff --git a/drivers/s390/cio/eadm_sch.c b/drivers/s390/cio/eadm_sch.c
index 165de1552301..ac382355dc04 100644
--- a/drivers/s390/cio/eadm_sch.c
+++ b/drivers/s390/cio/eadm_sch.c
@@ -114,7 +114,7 @@ static void eadm_subchannel_set_timeout(struct subchannel=
 *sch, int expires)
 	struct eadm_private *private =3D get_eadm_private(sch);
=20
 	if (expires =3D=3D 0)
-		del_timer(&private->timer);
+		timer_delete(&private->timer);
 	else
 		mod_timer(&private->timer, jiffies + expires);
 }
diff --git a/drivers/s390/crypto/ap_queue.c b/drivers/s390/crypto/ap_queue.c
index 9a0e6e4d8a5e..4088fda07197 100644
--- a/drivers/s390/crypto/ap_queue.c
+++ b/drivers/s390/crypto/ap_queue.c
@@ -1289,7 +1289,7 @@ void ap_queue_prepare_remove(struct ap_queue *aq)
 	/* move queue device state to SHUTDOWN in progress */
 	aq->dev_state =3D AP_DEV_STATE_SHUTDOWN;
 	spin_unlock_bh(&aq->lock);
-	del_timer_sync(&aq->timeout);
+	timer_delete_sync(&aq->timeout);
 }
=20
 void ap_queue_remove(struct ap_queue *aq)
diff --git a/drivers/s390/net/fsm.c b/drivers/s390/net/fsm.c
index 8672d225ba77..5fcdce116862 100644
--- a/drivers/s390/net/fsm.c
+++ b/drivers/s390/net/fsm.c
@@ -158,7 +158,7 @@ fsm_deltimer(fsm_timer *this)
 	printk(KERN_DEBUG "fsm(%s): Delete timer %p\n", this->fi->name,
 		this);
 #endif
-	del_timer(&this->tl);
+	timer_delete(&this->tl);
 }
=20
 int
@@ -188,7 +188,7 @@ fsm_modtimer(fsm_timer *this, int millisec, int event, vo=
id *arg)
 		this->fi->name, this, millisec);
 #endif
=20
-	del_timer(&this->tl);
+	timer_delete(&this->tl);
 	timer_setup(&this->tl, fsm_expire_timer, 0);
 	this->expire_event =3D event;
 	this->event_arg =3D arg;
diff --git a/drivers/s390/net/qeth_core_main.c b/drivers/s390/net/qeth_core_m=
ain.c
index 20328d695ef9..f5cfaebfb7c9 100644
--- a/drivers/s390/net/qeth_core_main.c
+++ b/drivers/s390/net/qeth_core_main.c
@@ -7088,7 +7088,7 @@ int qeth_stop(struct net_device *dev)
 	netif_tx_disable(dev);
=20
 	qeth_for_each_output_queue(card, queue, i) {
-		del_timer_sync(&queue->timer);
+		timer_delete_sync(&queue->timer);
 		/* Queues may get re-allocated, so remove the NAPIs. */
 		netif_napi_del(&queue->napi);
 	}
diff --git a/drivers/s390/scsi/zfcp_fsf.c b/drivers/s390/scsi/zfcp_fsf.c
index 99d6b3f8692b..d5f5f563881e 100644
--- a/drivers/s390/scsi/zfcp_fsf.c
+++ b/drivers/s390/scsi/zfcp_fsf.c
@@ -458,7 +458,7 @@ static void zfcp_fsf_req_complete(struct zfcp_fsf_req *re=
q)
 		return;
 	}
=20
-	del_timer_sync(&req->timer);
+	timer_delete_sync(&req->timer);
 	zfcp_fsf_protstatus_eval(req);
 	zfcp_fsf_fsfstatus_eval(req);
 	req->handler(req);
@@ -891,7 +891,7 @@ static int zfcp_fsf_req_send(struct zfcp_fsf_req *req)
 	req->qdio_req.qdio_outb_usage =3D atomic_read(&qdio->req_q_free);
 	req->issued =3D get_tod_clock();
 	if (zfcp_qdio_send(qdio, &req->qdio_req)) {
-		del_timer_sync(&req->timer);
+		timer_delete_sync(&req->timer);
=20
 		/* lookup request again, list might have changed */
 		if (zfcp_reqlist_find_rm(adapter->req_list, req_id) =3D=3D NULL)
diff --git a/drivers/s390/scsi/zfcp_qdio.c b/drivers/s390/scsi/zfcp_qdio.c
index 8cbc5e1711af..0957e3f8b46e 100644
--- a/drivers/s390/scsi/zfcp_qdio.c
+++ b/drivers/s390/scsi/zfcp_qdio.c
@@ -408,7 +408,7 @@ void zfcp_qdio_close(struct zfcp_qdio *qdio)
=20
 	tasklet_disable(&qdio->irq_tasklet);
 	tasklet_disable(&qdio->request_tasklet);
-	del_timer_sync(&qdio->request_timer);
+	timer_delete_sync(&qdio->request_timer);
 	qdio_stop_irq(adapter->ccw_device);
 	qdio_shutdown(adapter->ccw_device, QDIO_FLAG_CLEANUP_USING_CLEAR);
=20
diff --git a/drivers/scsi/aic7xxx/aic79xx_core.c b/drivers/scsi/aic7xxx/aic79=
xx_core.c
index 3e3100dbfda3..f9372a81cd4e 100644
--- a/drivers/scsi/aic7xxx/aic79xx_core.c
+++ b/drivers/scsi/aic7xxx/aic79xx_core.c
@@ -6181,7 +6181,7 @@ ahd_shutdown(void *arg)
 	/*
 	 * Stop periodic timer callbacks.
 	 */
-	del_timer_sync(&ahd->stat_timer);
+	timer_delete_sync(&ahd->stat_timer);
=20
 	/* This will reset most registers to 0, but not all */
 	ahd_reset(ahd, /*reinit*/FALSE);
@@ -6975,7 +6975,7 @@ static const char *termstat_strings[] =3D {
 static void
 ahd_timer_reset(struct timer_list *timer, int usec)
 {
-	del_timer(timer);
+	timer_delete(timer);
 	timer->expires =3D jiffies + (usec * HZ)/1000000;
 	add_timer(timer);
 }
diff --git a/drivers/scsi/aic94xx/aic94xx_hwi.c b/drivers/scsi/aic94xx/aic94x=
x_hwi.c
index 9dda296c0152..e74393357025 100644
--- a/drivers/scsi/aic94xx/aic94xx_hwi.c
+++ b/drivers/scsi/aic94xx/aic94xx_hwi.c
@@ -731,7 +731,7 @@ static void asd_dl_tasklet_handler(unsigned long data)
 			goto next_1;
 		} else if (ascb->scb->header.opcode =3D=3D EMPTY_SCB) {
 			goto out;
-		} else if (!ascb->uldd_timer && !del_timer(&ascb->timer)) {
+		} else if (!ascb->uldd_timer && !timer_delete(&ascb->timer)) {
 			goto next_1;
 		}
 		spin_lock_irqsave(&seq->pend_q_lock, flags);
diff --git a/drivers/scsi/aic94xx/aic94xx_init.c b/drivers/scsi/aic94xx/aic94=
xx_init.c
index 538a5867e8ab..adf3d9145606 100644
--- a/drivers/scsi/aic94xx/aic94xx_init.c
+++ b/drivers/scsi/aic94xx/aic94xx_init.c
@@ -851,7 +851,7 @@ static void asd_free_queues(struct asd_ha_struct *asd_ha)
 		 * times out.  Apparently we don't wait for the CONTROL PHY
 		 * to complete, so it doesn't matter if we kill the timer.
 		 */
-		del_timer_sync(&ascb->timer);
+		timer_delete_sync(&ascb->timer);
 		WARN_ON(ascb->scb->header.opcode !=3D CONTROL_PHY);
=20
 		list_del_init(pos);
diff --git a/drivers/scsi/aic94xx/aic94xx_tmf.c b/drivers/scsi/aic94xx/aic94x=
x_tmf.c
index 27d32b8c2987..d45dbf98f25e 100644
--- a/drivers/scsi/aic94xx/aic94xx_tmf.c
+++ b/drivers/scsi/aic94xx/aic94xx_tmf.c
@@ -31,7 +31,7 @@ static int asd_enqueue_internal(struct asd_ascb *ascb,
=20
 	res =3D asd_post_ascb_list(ascb->ha, ascb, 1);
 	if (unlikely(res))
-		del_timer(&ascb->timer);
+		timer_delete(&ascb->timer);
 	return res;
 }
=20
@@ -58,7 +58,7 @@ static void asd_clear_nexus_tasklet_complete(struct asd_asc=
b *ascb,
 {
 	struct tasklet_completion_status *tcs =3D ascb->uldd_task;
 	ASD_DPRINTK("%s: here\n", __func__);
-	if (!del_timer(&ascb->timer)) {
+	if (!timer_delete(&ascb->timer)) {
 		ASD_DPRINTK("%s: couldn't delete timer\n", __func__);
 		return;
 	}
@@ -303,7 +303,7 @@ static void asd_tmf_tasklet_complete(struct asd_ascb *asc=
b,
 {
 	struct tasklet_completion_status *tcs;
=20
-	if (!del_timer(&ascb->timer))
+	if (!timer_delete(&ascb->timer))
 		return;
=20
 	tcs =3D ascb->uldd_task;
diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hb=
a.c
index 221a520e8a9b..b450b1fc6bbb 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -1161,8 +1161,8 @@ static int arcmsr_probe(struct pci_dev *pdev, const str=
uct pci_device_id *id)
 	return 0;
 out_free_sysfs:
 	if (set_date_time)
-		del_timer_sync(&acb->refresh_timer);
-	del_timer_sync(&acb->eternal_timer);
+		timer_delete_sync(&acb->refresh_timer);
+	timer_delete_sync(&acb->eternal_timer);
 	flush_work(&acb->arcmsr_do_message_isr_bh);
 	arcmsr_stop_adapter_bgrb(acb);
 	arcmsr_flush_adapter_cache(acb);
@@ -1204,9 +1204,9 @@ static int __maybe_unused arcmsr_suspend(struct device =
*dev)
=20
 	arcmsr_disable_outbound_ints(acb);
 	arcmsr_free_irq(pdev, acb);
-	del_timer_sync(&acb->eternal_timer);
+	timer_delete_sync(&acb->eternal_timer);
 	if (set_date_time)
-		del_timer_sync(&acb->refresh_timer);
+		timer_delete_sync(&acb->refresh_timer);
 	flush_work(&acb->arcmsr_do_message_isr_bh);
 	arcmsr_stop_adapter_bgrb(acb);
 	arcmsr_flush_adapter_cache(acb);
@@ -1685,9 +1685,9 @@ static void arcmsr_free_pcidev(struct AdapterControlBlo=
ck *acb)
 	arcmsr_free_sysfs_attr(acb);
 	scsi_remove_host(host);
 	flush_work(&acb->arcmsr_do_message_isr_bh);
-	del_timer_sync(&acb->eternal_timer);
+	timer_delete_sync(&acb->eternal_timer);
 	if (set_date_time)
-		del_timer_sync(&acb->refresh_timer);
+		timer_delete_sync(&acb->refresh_timer);
 	pdev =3D acb->pdev;
 	arcmsr_free_irq(pdev, acb);
 	arcmsr_free_ccb_pool(acb);
@@ -1718,9 +1718,9 @@ static void arcmsr_remove(struct pci_dev *pdev)
 	arcmsr_free_sysfs_attr(acb);
 	scsi_remove_host(host);
 	flush_work(&acb->arcmsr_do_message_isr_bh);
-	del_timer_sync(&acb->eternal_timer);
+	timer_delete_sync(&acb->eternal_timer);
 	if (set_date_time)
-		del_timer_sync(&acb->refresh_timer);
+		timer_delete_sync(&acb->refresh_timer);
 	arcmsr_disable_outbound_ints(acb);
 	arcmsr_stop_adapter_bgrb(acb);
 	arcmsr_flush_adapter_cache(acb);=09
@@ -1765,9 +1765,9 @@ static void arcmsr_shutdown(struct pci_dev *pdev)
 		(struct AdapterControlBlock *)host->hostdata;
 	if (acb->acb_flags & ACB_F_ADAPTER_REMOVED)
 		return;
-	del_timer_sync(&acb->eternal_timer);
+	timer_delete_sync(&acb->eternal_timer);
 	if (set_date_time)
-		del_timer_sync(&acb->refresh_timer);
+		timer_delete_sync(&acb->refresh_timer);
 	arcmsr_disable_outbound_ints(acb);
 	arcmsr_free_irq(pdev, acb);
 	flush_work(&acb->arcmsr_do_message_isr_bh);
diff --git a/drivers/scsi/arm/fas216.c b/drivers/scsi/arm/fas216.c
index 4ce0b2d73614..e0b55d869a35 100644
--- a/drivers/scsi/arm/fas216.c
+++ b/drivers/scsi/arm/fas216.c
@@ -2331,7 +2331,7 @@ static void fas216_eh_timer(struct timer_list *t)
=20
 	fas216_log(info, LOG_ERROR, "error handling timed out\n");
=20
-	del_timer(&info->eh_timer);
+	timer_delete(&info->eh_timer);
=20
 	if (info->rst_bus_status =3D=3D 0)
 		info->rst_bus_status =3D -1;
@@ -2532,7 +2532,7 @@ int fas216_eh_device_reset(struct scsi_cmnd *SCpnt)
 		 */
 		wait_event(info->eh_wait, info->rst_dev_status);
=20
-		del_timer_sync(&info->eh_timer);
+		timer_delete_sync(&info->eh_timer);
 		spin_lock_irqsave(&info->host_lock, flags);
 		info->rstSCpnt =3D NULL;
=20
@@ -2622,7 +2622,7 @@ int fas216_eh_bus_reset(struct scsi_cmnd *SCpnt)
 	 * Wait one second for the interrupt.
 	 */
 	wait_event(info->eh_wait, info->rst_bus_status);
-	del_timer_sync(&info->eh_timer);
+	timer_delete_sync(&info->eh_timer);
=20
 	fas216_log(info, LOG_ERROR, "bus reset complete: %s\n",
 		   info->rst_bus_status =3D=3D 1 ? "success" : "failed");
diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
index a8b399ed98fc..7d1b767d87fb 100644
--- a/drivers/scsi/be2iscsi/be_main.c
+++ b/drivers/scsi/be2iscsi/be_main.c
@@ -5448,7 +5448,7 @@ static pci_ers_result_t beiscsi_eeh_err_detected(struct=
 pci_dev *pdev,
 		    "BM_%d : EEH error detected\n");
=20
 	/* first stop UE detection when PCI error detected */
-	del_timer_sync(&phba->hw_check);
+	timer_delete_sync(&phba->hw_check);
 	cancel_delayed_work_sync(&phba->recover_port);
=20
 	/* sessions are no longer valid, so first fail the sessions */
@@ -5746,7 +5746,7 @@ static void beiscsi_remove(struct pci_dev *pcidev)
 	}
=20
 	/* first stop UE detection before unloading */
-	del_timer_sync(&phba->hw_check);
+	timer_delete_sync(&phba->hw_check);
 	cancel_delayed_work_sync(&phba->recover_port);
 	cancel_work_sync(&phba->sess_work);
=20
diff --git a/drivers/scsi/bfa/bfad.c b/drivers/scsi/bfa/bfad.c
index f015c53de0d4..598f2fc93ef2 100644
--- a/drivers/scsi/bfa/bfad.c
+++ b/drivers/scsi/bfa/bfad.c
@@ -327,7 +327,7 @@ bfad_sm_failed(struct bfad_s *bfad, enum bfad_sm_event ev=
ent)
 	case BFAD_E_EXIT_COMP:
 		bfa_sm_set_state(bfad, bfad_sm_uninit);
 		bfad_remove_intr(bfad);
-		del_timer_sync(&bfad->hal_tmo);
+		timer_delete_sync(&bfad->hal_tmo);
 		break;
=20
 	default:
@@ -376,7 +376,7 @@ bfad_sm_stopping(struct bfad_s *bfad, enum bfad_sm_event =
event)
 	case BFAD_E_EXIT_COMP:
 		bfa_sm_set_state(bfad, bfad_sm_uninit);
 		bfad_remove_intr(bfad);
-		del_timer_sync(&bfad->hal_tmo);
+		timer_delete_sync(&bfad->hal_tmo);
 		bfad_im_probe_undo(bfad);
 		bfad->bfad_flags &=3D ~BFAD_FC4_PROBE_DONE;
 		bfad_uncfg_pport(bfad);
@@ -1421,7 +1421,7 @@ bfad_pci_error_detected(struct pci_dev *pdev, pci_chann=
el_state_t state)
 		/* Suspend/fail all bfa operations */
 		bfa_ioc_suspend(&bfad->bfa.ioc);
 		spin_unlock_irqrestore(&bfad->bfad_lock, flags);
-		del_timer_sync(&bfad->hal_tmo);
+		timer_delete_sync(&bfad->hal_tmo);
 		ret =3D PCI_ERS_RESULT_CAN_RECOVER;
 		break;
 	case pci_channel_io_frozen: /* fatal error */
@@ -1435,7 +1435,7 @@ bfad_pci_error_detected(struct pci_dev *pdev, pci_chann=
el_state_t state)
 		wait_for_completion(&bfad->comp);
=20
 		bfad_remove_intr(bfad);
-		del_timer_sync(&bfad->hal_tmo);
+		timer_delete_sync(&bfad->hal_tmo);
 		pci_disable_device(pdev);
 		ret =3D PCI_ERS_RESULT_NEED_RESET;
 		break;
@@ -1566,7 +1566,7 @@ bfad_pci_mmio_enabled(struct pci_dev *pdev)
 	wait_for_completion(&bfad->comp);
=20
 	bfad_remove_intr(bfad);
-	del_timer_sync(&bfad->hal_tmo);
+	timer_delete_sync(&bfad->hal_tmo);
 	pci_disable_device(pdev);
=20
 	return PCI_ERS_RESULT_NEED_RESET;
diff --git a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c b/drivers/scsi/bnx2fc/bnx2fc_f=
coe.c
index 5ac20c93637c..de6574cccf58 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
@@ -1599,7 +1599,7 @@ static void bnx2fc_interface_cleanup(struct bnx2fc_inte=
rface *interface)
 	struct bnx2fc_hba *hba =3D interface->hba;
=20
 	/* Stop the transmit retry timer */
-	del_timer_sync(&port->timer);
+	timer_delete_sync(&port->timer);
=20
 	/* Free existing transmit skbs */
 	fcoe_clean_pending_queue(lport);
@@ -1938,7 +1938,7 @@ static void bnx2fc_fw_destroy(struct bnx2fc_hba *hba)
 			if (signal_pending(current))
 				flush_signals(current);
=20
-			del_timer_sync(&hba->destroy_timer);
+			timer_delete_sync(&hba->destroy_timer);
 		}
 		bnx2fc_unbind_adapter_devices(hba);
 	}
diff --git a/drivers/scsi/bnx2fc/bnx2fc_tgt.c b/drivers/scsi/bnx2fc/bnx2fc_tg=
t.c
index eb3209103312..b8227cfef64f 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_tgt.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_tgt.c
@@ -74,7 +74,7 @@ static void bnx2fc_ofld_wait(struct bnx2fc_rport *tgt)
 				  &tgt->flags)));
 	if (signal_pending(current))
 		flush_signals(current);
-	del_timer_sync(&tgt->ofld_timer);
+	timer_delete_sync(&tgt->ofld_timer);
 }
=20
 static void bnx2fc_offload_session(struct fcoe_port *port,
@@ -283,7 +283,7 @@ static void bnx2fc_upld_wait(struct bnx2fc_rport *tgt)
 				  &tgt->flags)));
 	if (signal_pending(current))
 		flush_signals(current);
-	del_timer_sync(&tgt->upld_timer);
+	timer_delete_sync(&tgt->upld_timer);
 }
=20
 static void bnx2fc_upload_session(struct fcoe_port *port,
diff --git a/drivers/scsi/bnx2i/bnx2i_iscsi.c b/drivers/scsi/bnx2i/bnx2i_iscs=
i.c
index 9971f32a663c..6c80e5b514fd 100644
--- a/drivers/scsi/bnx2i/bnx2i_iscsi.c
+++ b/drivers/scsi/bnx2i/bnx2i_iscsi.c
@@ -1626,7 +1626,7 @@ static int bnx2i_conn_start(struct iscsi_cls_conn *cls_=
conn)
=20
 	if (signal_pending(current))
 		flush_signals(current);
-	del_timer_sync(&bnx2i_conn->ep->ofld_timer);
+	timer_delete_sync(&bnx2i_conn->ep->ofld_timer);
=20
 	iscsi_conn_start(cls_conn);
 	return 0;
@@ -1749,7 +1749,7 @@ static int bnx2i_tear_down_conn(struct bnx2i_hba *hba,
=20
 	if (signal_pending(current))
 		flush_signals(current);
-	del_timer_sync(&ep->ofld_timer);
+	timer_delete_sync(&ep->ofld_timer);
=20
 	bnx2i_ep_destroy_list_del(hba, ep);
=20
@@ -1861,7 +1861,7 @@ static struct iscsi_endpoint *bnx2i_ep_connect(struct S=
csi_Host *shost,
=20
 	if (signal_pending(current))
 		flush_signals(current);
-	del_timer_sync(&bnx2i_ep->ofld_timer);
+	timer_delete_sync(&bnx2i_ep->ofld_timer);
=20
 	bnx2i_ep_ofld_list_del(hba, bnx2i_ep);
=20
@@ -2100,7 +2100,7 @@ int bnx2i_hw_ep_disconnect(struct bnx2i_endpoint *bnx2i=
_ep)
=20
 	if (signal_pending(current))
 		flush_signals(current);
-	del_timer_sync(&bnx2i_ep->ofld_timer);
+	timer_delete_sync(&bnx2i_ep->ofld_timer);
=20
 destroy_conn:
 	bnx2i_ep_active_list_del(hba, bnx2i_ep);
diff --git a/drivers/scsi/csiostor/csio_hw.c b/drivers/scsi/csiostor/csio_hw.c
index e43c5413ce29..beded091dff1 100644
--- a/drivers/scsi/csiostor/csio_hw.c
+++ b/drivers/scsi/csiostor/csio_hw.c
@@ -3701,7 +3701,7 @@ csio_mberr_worker(void *data)
 	struct csio_mb *mbp_next;
 	int rv;
=20
-	del_timer_sync(&mbm->timer);
+	timer_delete_sync(&mbm->timer);
=20
 	spin_lock_irq(&hw->lock);
 	if (list_empty(&mbm->cbfn_q)) {
@@ -4210,7 +4210,7 @@ csio_mgmtm_init(struct csio_mgmtm *mgmtm, struct csio_h=
w *hw)
 static void
 csio_mgmtm_exit(struct csio_mgmtm *mgmtm)
 {
-	del_timer_sync(&mgmtm->mgmt_timer);
+	timer_delete_sync(&mgmtm->mgmt_timer);
 }
=20
=20
diff --git a/drivers/scsi/csiostor/csio_mb.c b/drivers/scsi/csiostor/csio_mb.c
index 94810b19e747..c7b4c464f6b8 100644
--- a/drivers/scsi/csiostor/csio_mb.c
+++ b/drivers/scsi/csiostor/csio_mb.c
@@ -1619,7 +1619,7 @@ csio_mb_cancel_all(struct csio_hw *hw, struct list_head=
 *cbfn_q)
 		mbp =3D mbm->mcurrent;
=20
 		/* Stop mailbox completion timer */
-		del_timer_sync(&mbm->timer);
+		timer_delete_sync(&mbm->timer);
=20
 		/* Add completion to tail of cbfn queue */
 		list_add_tail(&mbp->list, cbfn_q);
@@ -1682,7 +1682,7 @@ csio_mbm_init(struct csio_mbm *mbm, struct csio_hw *hw,
 void
 csio_mbm_exit(struct csio_mbm *mbm)
 {
-	del_timer_sync(&mbm->timer);
+	timer_delete_sync(&mbm->timer);
=20
 	CSIO_DB_ASSERT(mbm->mcurrent =3D=3D NULL);
 	CSIO_DB_ASSERT(list_empty(&mbm->req_q));
diff --git a/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c b/drivers/scsi/cxgbi/cxgb3i/c=
xgb3i.c
index ec6530240707..461d38e2fb19 100644
--- a/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
+++ b/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
@@ -495,7 +495,7 @@ static int do_act_establish(struct t3cdev *tdev, struct s=
k_buff *skb, void *ctx)
=20
 	spin_lock_bh(&csk->lock);
 	if (csk->retry_timer.function) {
-		del_timer(&csk->retry_timer);
+		timer_delete(&csk->retry_timer);
 		csk->retry_timer.function =3D NULL;
 	}
=20
diff --git a/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c b/drivers/scsi/cxgbi/cxgb4i/c=
xgb4i.c
index c07d2e3b4bcf..aaba294ecb58 100644
--- a/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c
+++ b/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c
@@ -930,7 +930,7 @@ static void do_act_establish(struct cxgbi_device *cdev, s=
truct sk_buff *skb)
 			csk, csk->state, csk->flags, csk->tid);
=20
 	if (csk->retry_timer.function) {
-		del_timer(&csk->retry_timer);
+		timer_delete(&csk->retry_timer);
 		csk->retry_timer.function =3D NULL;
 	}
=20
diff --git a/drivers/scsi/dc395x.c b/drivers/scsi/dc395x.c
index e71de2419758..8dc6be9a00c1 100644
--- a/drivers/scsi/dc395x.c
+++ b/drivers/scsi/dc395x.c
@@ -765,7 +765,7 @@ static void waiting_process_next(struct AdapterCtlBlk *ac=
b)
 		return;
=20
 	if (timer_pending(&acb->waiting_timer))
-		del_timer(&acb->waiting_timer);
+		timer_delete(&acb->waiting_timer);
=20
 	if (list_empty(dcb_list_head))
 		return;
@@ -1153,7 +1153,7 @@ static int __dc395x_eh_bus_reset(struct scsi_cmnd *cmd)
 		cmd, cmd->device->id, (u8)cmd->device->lun, cmd);
=20
 	if (timer_pending(&acb->waiting_timer))
-		del_timer(&acb->waiting_timer);
+		timer_delete(&acb->waiting_timer);
=20
 	/*
 	 * disable interrupt   =20
@@ -1561,7 +1561,7 @@ static void dc395x_handle_interrupt(struct AdapterCtlBl=
k *acb,
 	/*dprintkl(KERN_DEBUG, "handle_interrupt: intstatus =3D 0x%02x ", scsi_ints=
tatus); */
=20
 	if (timer_pending(&acb->selto_timer))
-		del_timer(&acb->selto_timer);
+		timer_delete(&acb->selto_timer);
=20
 	if (scsi_intstatus & (INT_SELTIMEOUT | INT_DISCONNECT)) {
 		disconnect(acb);	/* bus free interrupt  */
@@ -3454,7 +3454,7 @@ static void scsi_reset_detect(struct AdapterCtlBlk *acb)
 	dprintkl(KERN_INFO, "scsi_reset_detect: acb=3D%p\n", acb);
 	/* delay half a second */
 	if (timer_pending(&acb->waiting_timer))
-		del_timer(&acb->waiting_timer);
+		timer_delete(&acb->waiting_timer);
=20
 	DC395x_write8(acb, TRM_S1040_SCSI_CONTROL, DO_RSTMODULE);
 	DC395x_write8(acb, TRM_S1040_DMA_CONTROL, DMARESETMODULE);
@@ -4415,9 +4415,9 @@ static void adapter_uninit(struct AdapterCtlBlk *acb)
=20
 	/* remove timers */
 	if (timer_pending(&acb->waiting_timer))
-		del_timer(&acb->waiting_timer);
+		timer_delete(&acb->waiting_timer);
 	if (timer_pending(&acb->selto_timer))
-		del_timer(&acb->selto_timer);
+		timer_delete(&acb->selto_timer);
=20
 	adapter_uninit_chip(acb);
 	adapter_remove_and_free_all_devices(acb);
diff --git a/drivers/scsi/elx/efct/efct_driver.c b/drivers/scsi/elx/efct/efct=
_driver.c
index 59f277593785..1bd42f7db177 100644
--- a/drivers/scsi/elx/efct/efct_driver.c
+++ b/drivers/scsi/elx/efct/efct_driver.c
@@ -310,7 +310,7 @@ efct_fw_reset(struct efct *efct)
 	 * during attach.
 	 */
 	if (timer_pending(&efct->xport->stats_timer))
-		del_timer(&efct->xport->stats_timer);
+		timer_delete(&efct->xport->stats_timer);
=20
 	if (efct_hw_reset(&efct->hw, EFCT_HW_RESET_FIRMWARE)) {
 		efc_log_info(efct, "failed to reset firmware\n");
diff --git a/drivers/scsi/elx/efct/efct_xport.c b/drivers/scsi/elx/efct/efct_=
xport.c
index cf4dced20b8b..2aca60f6428e 100644
--- a/drivers/scsi/elx/efct/efct_xport.c
+++ b/drivers/scsi/elx/efct/efct_xport.c
@@ -508,7 +508,7 @@ efct_xport_detach(struct efct_xport *xport)
=20
 	/*Shutdown FC Statistics timer*/
 	if (timer_pending(&xport->stats_timer))
-		del_timer(&xport->stats_timer);
+		timer_delete(&xport->stats_timer);
=20
 	efct_hw_teardown(&efct->hw);
=20
diff --git a/drivers/scsi/elx/libefc/efc_fabric.c b/drivers/scsi/elx/libefc/e=
fc_fabric.c
index 9661eea93aa1..cf7e738c4edc 100644
--- a/drivers/scsi/elx/libefc/efc_fabric.c
+++ b/drivers/scsi/elx/libefc/efc_fabric.c
@@ -888,7 +888,7 @@ gidpt_delay_timer_cb(struct timer_list *t)
 {
 	struct efc_node *node =3D from_timer(node, t, gidpt_delay_timer);
=20
-	del_timer(&node->gidpt_delay_timer);
+	timer_delete(&node->gidpt_delay_timer);
=20
 	efc_node_post_event(node, EFC_EVT_GIDPT_DELAY_EXPIRED, NULL);
 }
diff --git a/drivers/scsi/elx/libefc/efc_node.c b/drivers/scsi/elx/libefc/efc=
_node.c
index a1b4ce6a27b4..f17e052fe537 100644
--- a/drivers/scsi/elx/libefc/efc_node.c
+++ b/drivers/scsi/elx/libefc/efc_node.c
@@ -149,7 +149,7 @@ efc_node_free(struct efc_node *node)
=20
 	/* if the gidpt_delay_timer is still running, then delete it */
 	if (timer_pending(&node->gidpt_delay_timer))
-		del_timer(&node->gidpt_delay_timer);
+		timer_delete(&node->gidpt_delay_timer);
=20
 	xa_erase(&nport->lookup, node->rnode.fc_id);
=20
diff --git a/drivers/scsi/esas2r/esas2r_init.c b/drivers/scsi/esas2r/esas2r_i=
nit.c
index 0cea5f3d1a08..04a07fe57be2 100644
--- a/drivers/scsi/esas2r/esas2r_init.c
+++ b/drivers/scsi/esas2r/esas2r_init.c
@@ -439,7 +439,7 @@ static void esas2r_adapter_power_down(struct esas2r_adapt=
er *a,
 	if ((test_bit(AF2_INIT_DONE, &a->flags2))
 	    &&  (!test_bit(AF_DEGRADED_MODE, &a->flags))) {
 		if (!power_management) {
-			del_timer_sync(&a->timer);
+			timer_delete_sync(&a->timer);
 			tasklet_kill(&a->tasklet);
 		}
 		esas2r_power_down(a);
diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
index 038e38578676..b911fdb387f3 100644
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -1013,7 +1013,7 @@ static void fcoe_if_destroy(struct fc_lport *lport)
 	fc_lport_destroy(lport);
=20
 	/* Stop the transmit retry timer */
-	del_timer_sync(&port->timer);
+	timer_delete_sync(&port->timer);
=20
 	/* Free existing transmit skbs */
 	fcoe_clean_pending_queue(lport);
diff --git a/drivers/scsi/fcoe/fcoe_ctlr.c b/drivers/scsi/fcoe/fcoe_ctlr.c
index 5c8d1ba3f8f3..56d270526c9c 100644
--- a/drivers/scsi/fcoe/fcoe_ctlr.c
+++ b/drivers/scsi/fcoe/fcoe_ctlr.c
@@ -302,7 +302,7 @@ void fcoe_ctlr_destroy(struct fcoe_ctlr *fip)
 	fcoe_ctlr_set_state(fip, FIP_ST_DISABLED);
 	fcoe_ctlr_reset_fcfs(fip);
 	mutex_unlock(&fip->ctlr_mutex);
-	del_timer_sync(&fip->timer);
+	timer_delete_sync(&fip->timer);
 	cancel_work_sync(&fip->timer_work);
 }
 EXPORT_SYMBOL(fcoe_ctlr_destroy);
@@ -478,7 +478,7 @@ EXPORT_SYMBOL(fcoe_ctlr_link_up);
 static void fcoe_ctlr_reset(struct fcoe_ctlr *fip)
 {
 	fcoe_ctlr_reset_fcfs(fip);
-	del_timer(&fip->timer);
+	timer_delete(&fip->timer);
 	fip->ctlr_ka_time =3D 0;
 	fip->port_ka_time =3D 0;
 	fip->sol_time =3D 0;
diff --git a/drivers/scsi/fnic/fdls_disc.c b/drivers/scsi/fnic/fdls_disc.c
index 4c6bbf417a9a..c2b6f4eb338e 100644
--- a/drivers/scsi/fnic/fdls_disc.c
+++ b/drivers/scsi/fnic/fdls_disc.c
@@ -394,7 +394,7 @@ void fnic_del_fabric_timer_sync(struct fnic *fnic)
 {
 	fnic->iport.fabric.del_timer_inprogress =3D 1;
 	spin_unlock_irqrestore(&fnic->fnic_lock, fnic->lock_flags);
-	del_timer_sync(&fnic->iport.fabric.retry_timer);
+	timer_delete_sync(&fnic->iport.fabric.retry_timer);
 	spin_lock_irqsave(&fnic->fnic_lock, fnic->lock_flags);
 	fnic->iport.fabric.del_timer_inprogress =3D 0;
 }
@@ -404,7 +404,7 @@ void fnic_del_tport_timer_sync(struct fnic *fnic,
 {
 	tport->del_timer_inprogress =3D 1;
 	spin_unlock_irqrestore(&fnic->fnic_lock, fnic->lock_flags);
-	del_timer_sync(&tport->retry_timer);
+	timer_delete_sync(&tport->retry_timer);
 	spin_lock_irqsave(&fnic->fnic_lock, fnic->lock_flags);
 	tport->del_timer_inprogress =3D 0;
 }
@@ -3617,7 +3617,7 @@ static void fdls_process_fdmi_plogi_rsp(struct fnic_ipo=
rt_s *iport,
 	fdls_free_oxid(iport, oxid, &iport->active_oxid_fdmi_plogi);
=20
 	if (ntoh24(fchdr->fh_s_id) =3D=3D FC_FID_MGMT_SERV) {
-		del_timer_sync(&iport->fabric.fdmi_timer);
+		timer_delete_sync(&iport->fabric.fdmi_timer);
 		iport->fabric.fdmi_pending =3D 0;
 		switch (plogi_rsp->els.fl_cmd) {
 		case ELS_LS_ACC:
@@ -3686,7 +3686,7 @@ static void fdls_process_fdmi_reg_ack(struct fnic_iport=
_s *iport,
 		 iport->fcid);
=20
 	if (!iport->fabric.fdmi_pending) {
-		del_timer_sync(&iport->fabric.fdmi_timer);
+		timer_delete_sync(&iport->fabric.fdmi_timer);
 		FNIC_FCS_DBG(KERN_INFO, fnic->host, fnic->fnic_num,
 					 "iport fcid: 0x%x: Canceling FDMI timer\n",
 					 iport->fcid);
@@ -3728,7 +3728,7 @@ static void fdls_process_fdmi_abts_rsp(struct fnic_ipor=
t_s *iport,
 		break;
 	}
=20
-	del_timer_sync(&iport->fabric.fdmi_timer);
+	timer_delete_sync(&iport->fabric.fdmi_timer);
 	iport->fabric.fdmi_pending &=3D ~FDLS_FDMI_ABORT_PENDING;
=20
 	fdls_send_fdmi_plogi(iport);
@@ -4971,7 +4971,7 @@ void fnic_fdls_link_down(struct fnic_iport_s *iport)
 	}
=20
 	if ((fnic_fdmi_support =3D=3D 1) && (iport->fabric.fdmi_pending > 0)) {
-		del_timer_sync(&iport->fabric.fdmi_timer);
+		timer_delete_sync(&iport->fabric.fdmi_timer);
 		iport->fabric.fdmi_pending =3D 0;
 	}
=20
diff --git a/drivers/scsi/fnic/fip.c b/drivers/scsi/fnic/fip.c
index 7bb85949033f..6e7c0b00eb41 100644
--- a/drivers/scsi/fnic/fip.c
+++ b/drivers/scsi/fnic/fip.c
@@ -319,7 +319,7 @@ void fnic_fcoe_fip_discovery_resp(struct fnic *fnic, stru=
ct fip_header *fiph)
 						  round_jiffies(fcs_ka_tov));
 				} else {
 					if (timer_pending(&fnic->fcs_ka_timer))
-						del_timer_sync(&fnic->fcs_ka_timer);
+						timer_delete_sync(&fnic->fcs_ka_timer);
 				}
=20
 				if (fka_has_changed) {
@@ -497,7 +497,7 @@ void fnic_fcoe_process_flogi_resp(struct fnic *fnic, stru=
ct fip_header *fiph)
=20
 		oxid =3D FNIC_STD_GET_OX_ID(fchdr);
 		fdls_free_oxid(iport, oxid, &iport->active_oxid_fabric_req);
-		del_timer_sync(&fnic->retry_fip_timer);
+		timer_delete_sync(&fnic->retry_fip_timer);
=20
 		if ((be16_to_cpu(flogi_rsp->fip.fip_dl_len) =3D=3D FIP_FLOGI_LEN)
 		    && (flogi_rsp->rsp_desc.flogi.els.fl_cmd =3D=3D ELS_LS_ACC)) {
@@ -580,10 +580,10 @@ void fnic_common_fip_cleanup(struct fnic *fnic)
=20
 	iport->fip.state =3D FDLS_FIP_INIT;
=20
-	del_timer_sync(&fnic->retry_fip_timer);
-	del_timer_sync(&fnic->fcs_ka_timer);
-	del_timer_sync(&fnic->enode_ka_timer);
-	del_timer_sync(&fnic->vn_ka_timer);
+	timer_delete_sync(&fnic->retry_fip_timer);
+	timer_delete_sync(&fnic->fcs_ka_timer);
+	timer_delete_sync(&fnic->enode_ka_timer);
+	timer_delete_sync(&fnic->vn_ka_timer);
=20
 	if (!is_zero_ether_addr(iport->fpma))
 		vnic_dev_del_addr(fnic->vdev, iport->fpma);
diff --git a/drivers/scsi/fnic/fnic_main.c b/drivers/scsi/fnic/fnic_main.c
index 3dd06376e97b..9a357ff42085 100644
--- a/drivers/scsi/fnic/fnic_main.c
+++ b/drivers/scsi/fnic/fnic_main.c
@@ -1149,20 +1149,20 @@ static void fnic_remove(struct pci_dev *pdev)
 	fnic_scsi_unload(fnic);
=20
 	if (vnic_dev_get_intr_mode(fnic->vdev) =3D=3D VNIC_DEV_INTR_MODE_MSI)
-		del_timer_sync(&fnic->notify_timer);
+		timer_delete_sync(&fnic->notify_timer);
=20
 	if (fnic->config.flags & VFCF_FIP_CAPABLE) {
-		del_timer_sync(&fnic->retry_fip_timer);
-		del_timer_sync(&fnic->fcs_ka_timer);
-		del_timer_sync(&fnic->enode_ka_timer);
-		del_timer_sync(&fnic->vn_ka_timer);
+		timer_delete_sync(&fnic->retry_fip_timer);
+		timer_delete_sync(&fnic->fcs_ka_timer);
+		timer_delete_sync(&fnic->enode_ka_timer);
+		timer_delete_sync(&fnic->vn_ka_timer);
=20
 		fnic_free_txq(&fnic->fip_frame_queue);
 		fnic_fcoe_reset_vlans(fnic);
 	}
=20
 	if ((fnic_fdmi_support =3D=3D 1) && (fnic->iport.fabric.fdmi_pending > 0))
-		del_timer_sync(&fnic->iport.fabric.fdmi_timer);
+		timer_delete_sync(&fnic->iport.fabric.fdmi_timer);
=20
 	fnic_stats_debugfs_remove(fnic);
=20
diff --git a/drivers/scsi/hisi_sas/hisi_sas_main.c b/drivers/scsi/hisi_sas/hi=
si_sas_main.c
index 3596414d970b..5cb1d3db4907 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_main.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_main.c
@@ -1548,7 +1548,7 @@ void hisi_sas_controller_reset_prepare(struct hisi_hba =
*hisi_hba)
 	 * which is also only used for v1/v2 hw to skip it for v3 hw
 	 */
 	if (hisi_hba->hw->sht)
-		del_timer_sync(&hisi_hba->timer);
+		timer_delete_sync(&hisi_hba->timer);
=20
 	set_bit(HISI_SAS_REJECT_CMD_BIT, &hisi_hba->flags);
 }
@@ -2363,7 +2363,7 @@ void hisi_sas_free(struct hisi_hba *hisi_hba)
 	for (i =3D 0; i < hisi_hba->n_phy; i++) {
 		struct hisi_sas_phy *phy =3D &hisi_hba->phy[i];
=20
-		del_timer_sync(&phy->timer);
+		timer_delete_sync(&phy->timer);
 	}
=20
 	if (hisi_hba->wq)
@@ -2625,7 +2625,7 @@ void hisi_sas_remove(struct platform_device *pdev)
 	struct hisi_hba *hisi_hba =3D sha->lldd_ha;
 	struct Scsi_Host *shost =3D sha->shost;
=20
-	del_timer_sync(&hisi_hba->timer);
+	timer_delete_sync(&hisi_hba->timer);
=20
 	sas_unregister_ha(sha);
 	sas_remove_host(shost);
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c b/drivers/scsi/hisi_sas/h=
isi_sas_v2_hw.c
index 04ee02797ca3..a1fc400ab4c3 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
@@ -2372,18 +2372,18 @@ static void slot_complete_v2_hw(struct hisi_hba *hisi=
_hba,
 	case STAT_IO_COMPLETE:
 		/* internal abort command complete */
 		ts->stat =3D TMF_RESP_FUNC_SUCC;
-		del_timer_sync(&slot->internal_abort_timer);
+		timer_delete_sync(&slot->internal_abort_timer);
 		goto out;
 	case STAT_IO_NO_DEVICE:
 		ts->stat =3D TMF_RESP_FUNC_COMPLETE;
-		del_timer_sync(&slot->internal_abort_timer);
+		timer_delete_sync(&slot->internal_abort_timer);
 		goto out;
 	case STAT_IO_NOT_VALID:
 		/* abort single io, controller don't find
 		 * the io need to abort
 		 */
 		ts->stat =3D TMF_RESP_FUNC_FAILED;
-		del_timer_sync(&slot->internal_abort_timer);
+		timer_delete_sync(&slot->internal_abort_timer);
 		goto out;
 	default:
 		break;
@@ -2654,7 +2654,7 @@ static int phy_up_v2_hw(int phy_no, struct hisi_hba *hi=
si_hba)
 	if (is_sata_phy_v2_hw(hisi_hba, phy_no))
 		goto end;
=20
-	del_timer(&phy->timer);
+	timer_delete(&phy->timer);
=20
 	if (phy_no =3D=3D 8) {
 		u32 port_state =3D hisi_sas_read32(hisi_hba, PORT_STATE);
@@ -2730,7 +2730,7 @@ static int phy_down_v2_hw(int phy_no, struct hisi_hba *=
hisi_hba)
 	struct hisi_sas_port *port =3D phy->port;
 	struct device *dev =3D hisi_hba->dev;
=20
-	del_timer(&phy->timer);
+	timer_delete(&phy->timer);
 	hisi_sas_phy_write32(hisi_hba, phy_no, PHYCTRL_NOT_RDY_MSK, 1);
=20
 	phy_state =3D hisi_sas_read32(hisi_hba, PHY_STATE);
@@ -2744,7 +2744,7 @@ static int phy_down_v2_hw(int phy_no, struct hisi_hba *=
hisi_hba)
 	if (port && !get_wideport_bitmap_v2_hw(hisi_hba, port->id))
 		if (!check_any_wideports_v2_hw(hisi_hba) &&
 				timer_pending(&hisi_hba->timer))
-			del_timer(&hisi_hba->timer);
+			timer_delete(&hisi_hba->timer);
=20
 	txid_auto =3D hisi_sas_phy_read32(hisi_hba, phy_no, TXID_AUTO);
 	hisi_sas_phy_write32(hisi_hba, phy_no, TXID_AUTO,
@@ -3204,7 +3204,7 @@ static irqreturn_t sata_int_v2_hw(int irq_no, void *p)
 	u8 attached_sas_addr[SAS_ADDR_SIZE] =3D {0};
 	int phy_no, offset;
=20
-	del_timer(&phy->timer);
+	timer_delete(&phy->timer);
=20
 	phy_no =3D sas_phy->id;
 	initial_fis =3D &hisi_hba->initial_fis[phy_no];
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c b/drivers/scsi/hisi_sas/h=
isi_sas_v3_hw.c
index 095bbf80c34e..2684d6482067 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
@@ -1609,7 +1609,7 @@ static irqreturn_t phy_up_v3_hw(int phy_no, struct hisi=
_hba *hisi_hba)
 	phy->port_id =3D port_id;
 	spin_lock(&phy->lock);
 	/* Delete timer and set phy_attached atomically */
-	del_timer(&phy->timer);
+	timer_delete(&phy->timer);
 	phy->phy_attached =3D 1;
 	spin_unlock(&phy->lock);
=20
@@ -1643,7 +1643,7 @@ static irqreturn_t phy_down_v3_hw(int phy_no, struct hi=
si_hba *hisi_hba)
=20
 	atomic_inc(&phy->down_cnt);
=20
-	del_timer(&phy->timer);
+	timer_delete(&phy->timer);
 	hisi_sas_phy_write32(hisi_hba, phy_no, PHYCTRL_NOT_RDY_MSK, 1);
=20
 	phy_state =3D hisi_sas_read32(hisi_hba, PHY_STATE);
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 773ec2f31bc4..4c493b06062a 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1110,7 +1110,7 @@ static void ibmvfc_fail_request(struct ibmvfc_event *ev=
t, int error_code)
 	} else
 		evt->xfer_iu->mad_common.status =3D cpu_to_be16(IBMVFC_MAD_DRIVER_FAILED);
=20
-	del_timer(&evt->timer);
+	timer_delete(&evt->timer);
 }
=20
 /**
@@ -1754,7 +1754,7 @@ static int ibmvfc_send_event(struct ibmvfc_event *evt,
 		atomic_set(&evt->active, 0);
 		list_del(&evt->queue_list);
 		spin_unlock_irqrestore(&evt->queue->l_lock, flags);
-		del_timer(&evt->timer);
+		timer_delete(&evt->timer);
=20
 		/* If send_crq returns H_CLOSED, return SCSI_MLQUEUE_HOST_BUSY.
 		 * Firmware will send a CRQ with a transport event (0xFF) to
@@ -3832,7 +3832,7 @@ static void ibmvfc_tasklet(void *data)
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
=20
 	list_for_each_entry_safe(evt, temp, &evt_doneq, queue_list) {
-		del_timer(&evt->timer);
+		timer_delete(&evt->timer);
 		list_del(&evt->queue_list);
 		ibmvfc_trc_end(evt);
 		evt->done(evt);
@@ -3938,7 +3938,7 @@ static void ibmvfc_drain_sub_crq(struct ibmvfc_queue *s=
crq)
 	spin_unlock_irqrestore(scrq->q_lock, flags);
=20
 	list_for_each_entry_safe(evt, temp, &evt_doneq, queue_list) {
-		del_timer(&evt->timer);
+		timer_delete(&evt->timer);
 		list_del(&evt->queue_list);
 		ibmvfc_trc_end(evt);
 		evt->done(evt);
@@ -4542,7 +4542,7 @@ static void ibmvfc_tgt_adisc_done(struct ibmvfc_event *=
evt)
=20
 	vhost->discovery_threads--;
 	ibmvfc_set_tgt_action(tgt, IBMVFC_TGT_ACTION_NONE);
-	del_timer(&tgt->timer);
+	timer_delete(&tgt->timer);
=20
 	switch (status) {
 	case IBMVFC_MAD_SUCCESS:
@@ -4741,7 +4741,7 @@ static void ibmvfc_tgt_adisc(struct ibmvfc_target *tgt)
 	ibmvfc_set_tgt_action(tgt, IBMVFC_TGT_ACTION_INIT_WAIT);
 	if (ibmvfc_send_event(evt, vhost, IBMVFC_ADISC_PLUS_CANCEL_TIMEOUT)) {
 		vhost->discovery_threads--;
-		del_timer(&tgt->timer);
+		timer_delete(&tgt->timer);
 		ibmvfc_set_tgt_action(tgt, IBMVFC_TGT_ACTION_NONE);
 		kref_put(&tgt->kref, ibmvfc_release_tgt);
 	} else
@@ -5519,7 +5519,7 @@ static void ibmvfc_tgt_add_rport(struct ibmvfc_target *=
tgt)
 		ibmvfc_set_tgt_action(tgt, IBMVFC_TGT_ACTION_DELETED_RPORT);
 		spin_unlock_irqrestore(vhost->host->host_lock, flags);
 		fc_remote_port_delete(rport);
-		del_timer_sync(&tgt->timer);
+		timer_delete_sync(&tgt->timer);
 		kref_put(&tgt->kref, ibmvfc_release_tgt);
 		return;
 	} else if (rport && tgt->action =3D=3D IBMVFC_TGT_ACTION_DEL_AND_LOGOUT_RPO=
RT) {
@@ -5672,7 +5672,7 @@ static void ibmvfc_do_work(struct ibmvfc_host *vhost)
 				spin_unlock_irqrestore(vhost->host->host_lock, flags);
 				if (rport)
 					fc_remote_port_delete(rport);
-				del_timer_sync(&tgt->timer);
+				timer_delete_sync(&tgt->timer);
 				kref_put(&tgt->kref, ibmvfc_release_tgt);
 				return;
 			} else if (tgt->action =3D=3D IBMVFC_TGT_ACTION_DEL_AND_LOGOUT_RPORT) {
diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscs=
i.c
index 16a1aac11911..d65a45860b33 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -789,7 +789,7 @@ static void purge_requests(struct ibmvscsi_host_data *hos=
tdata, int error_code)
 	while (!list_empty(&hostdata->sent)) {
 		evt =3D list_first_entry(&hostdata->sent, struct srp_event_struct, list);
 		list_del(&evt->list);
-		del_timer(&evt->timer);
+		timer_delete(&evt->timer);
=20
 		spin_unlock_irqrestore(hostdata->host->host_lock, flags);
 		if (evt->cmnd) {
@@ -944,7 +944,7 @@ static int ibmvscsi_send_srp_event(struct srp_event_struc=
t *evt_struct,
 			       be64_to_cpu(crq_as_u64[1]));
 	if (rc !=3D 0) {
 		list_del(&evt_struct->list);
-		del_timer(&evt_struct->timer);
+		timer_delete(&evt_struct->timer);
=20
 		/* If send_crq returns H_CLOSED, return SCSI_MLQUEUE_HOST_BUSY.
 		 * Firmware will send a CRQ with a transport event (0xFF) to
@@ -1840,7 +1840,7 @@ static void ibmvscsi_handle_crq(struct viosrp_crq *crq,
 		atomic_add(be32_to_cpu(evt_struct->xfer_iu->srp.rsp.req_lim_delta),
 			   &hostdata->request_limit);
=20
-	del_timer(&evt_struct->timer);
+	timer_delete(&evt_struct->timer);
=20
 	if ((crq->status !=3D VIOSRP_OK && crq->status !=3D VIOSRP_OK2) && evt_stru=
ct->cmnd)
 		evt_struct->cmnd->result =3D DID_ERROR << 16;
diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
index 3bfafd43e42a..d89135fb8faa 100644
--- a/drivers/scsi/ipr.c
+++ b/drivers/scsi/ipr.c
@@ -873,7 +873,7 @@ static void ipr_fail_all_ops(struct ipr_ioa_cfg *ioa_cfg)
=20
 			ipr_trc_hook(ipr_cmd, IPR_TRACE_FINISH,
 				     IPR_IOASC_IOA_WAS_RESET);
-			del_timer(&ipr_cmd->timer);
+			timer_delete(&ipr_cmd->timer);
 			ipr_cmd->done(ipr_cmd);
 		}
 		spin_unlock(&hrrq->_lock);
@@ -5347,7 +5347,7 @@ static irqreturn_t ipr_handle_other_interrupt(struct ip=
r_ioa_cfg *ioa_cfg,
 				writel(IPR_PCII_IPL_STAGE_CHANGE, ioa_cfg->regs.clr_interrupt_reg);
 				int_reg =3D readl(ioa_cfg->regs.sense_interrupt_reg) & ~int_mask_reg;
 				list_del(&ioa_cfg->reset_cmd->queue);
-				del_timer(&ioa_cfg->reset_cmd->timer);
+				timer_delete(&ioa_cfg->reset_cmd->timer);
 				ipr_reset_ioa_job(ioa_cfg->reset_cmd);
 				return IRQ_HANDLED;
 			}
@@ -5362,7 +5362,7 @@ static irqreturn_t ipr_handle_other_interrupt(struct ip=
r_ioa_cfg *ioa_cfg,
 		int_reg =3D readl(ioa_cfg->regs.sense_interrupt_reg);
=20
 		list_del(&ioa_cfg->reset_cmd->queue);
-		del_timer(&ioa_cfg->reset_cmd->timer);
+		timer_delete(&ioa_cfg->reset_cmd->timer);
 		ipr_reset_ioa_job(ioa_cfg->reset_cmd);
 	} else if ((int_reg & IPR_PCII_HRRQ_UPDATED) =3D=3D int_reg) {
 		if (ioa_cfg->clear_isr) {
@@ -5481,7 +5481,7 @@ static int ipr_iopoll(struct irq_poll *iop, int budget)
=20
 	list_for_each_entry_safe(ipr_cmd, temp, &doneq, queue) {
 		list_del(&ipr_cmd->queue);
-		del_timer(&ipr_cmd->timer);
+		timer_delete(&ipr_cmd->timer);
 		ipr_cmd->fast_done(ipr_cmd);
 	}
=20
@@ -5550,7 +5550,7 @@ static irqreturn_t ipr_isr(int irq, void *devp)
 	spin_unlock_irqrestore(hrrq->lock, hrrq_flags);
 	list_for_each_entry_safe(ipr_cmd, temp, &doneq, queue) {
 		list_del(&ipr_cmd->queue);
-		del_timer(&ipr_cmd->timer);
+		timer_delete(&ipr_cmd->timer);
 		ipr_cmd->fast_done(ipr_cmd);
 	}
 	return rc;
@@ -5600,7 +5600,7 @@ static irqreturn_t ipr_isr_mhrrq(int irq, void *devp)
=20
 	list_for_each_entry_safe(ipr_cmd, temp, &doneq, queue) {
 		list_del(&ipr_cmd->queue);
-		del_timer(&ipr_cmd->timer);
+		timer_delete(&ipr_cmd->timer);
 		ipr_cmd->fast_done(ipr_cmd);
 	}
 	return rc;
diff --git a/drivers/scsi/isci/host.c b/drivers/scsi/isci/host.c
index 35589b6af90d..c108b5b940c3 100644
--- a/drivers/scsi/isci/host.c
+++ b/drivers/scsi/isci/host.c
@@ -1271,22 +1271,22 @@ void isci_host_deinit(struct isci_host *ihost)
 	/* Cancel any/all outstanding port timers */
 	for (i =3D 0; i < ihost->logical_port_entries; i++) {
 		struct isci_port *iport =3D &ihost->ports[i];
-		del_timer_sync(&iport->timer.timer);
+		timer_delete_sync(&iport->timer.timer);
 	}
=20
 	/* Cancel any/all outstanding phy timers */
 	for (i =3D 0; i < SCI_MAX_PHYS; i++) {
 		struct isci_phy *iphy =3D &ihost->phys[i];
-		del_timer_sync(&iphy->sata_timer.timer);
+		timer_delete_sync(&iphy->sata_timer.timer);
 	}
=20
-	del_timer_sync(&ihost->port_agent.timer.timer);
+	timer_delete_sync(&ihost->port_agent.timer.timer);
=20
-	del_timer_sync(&ihost->power_control.timer.timer);
+	timer_delete_sync(&ihost->power_control.timer.timer);
=20
-	del_timer_sync(&ihost->timer.timer);
+	timer_delete_sync(&ihost->timer.timer);
=20
-	del_timer_sync(&ihost->phy_timer.timer);
+	timer_delete_sync(&ihost->phy_timer.timer);
 }
=20
 static void __iomem *scu_base(struct isci_host *isci_host)
diff --git a/drivers/scsi/isci/isci.h b/drivers/scsi/isci/isci.h
index f6a8fe206415..d827e49c1d55 100644
--- a/drivers/scsi/isci/isci.h
+++ b/drivers/scsi/isci/isci.h
@@ -481,9 +481,9 @@ irqreturn_t isci_error_isr(int vec, void *data);
=20
 /*
  * Each timer is associated with a cancellation flag that is set when
- * del_timer() is called and checked in the timer callback function. This
- * is needed since del_timer_sync() cannot be called with sci_lock held.
- * For deinit however, del_timer_sync() is used without holding the lock.
+ * timer_delete() is called and checked in the timer callback function. This
+ * is needed since timer_delete_sync() cannot be called with sci_lock held.
+ * For deinit however, timer_delete_sync() is used without holding the lock.
  */
 struct sci_timer {
 	struct timer_list	timer;
@@ -506,7 +506,7 @@ static inline void sci_mod_timer(struct sci_timer *tmr, u=
nsigned long msec)
 static inline void sci_del_timer(struct sci_timer *tmr)
 {
 	tmr->cancel =3D true;
-	del_timer(&tmr->timer);
+	timer_delete(&tmr->timer);
 }
=20
 struct sci_base_state_machine {
diff --git a/drivers/scsi/libfc/fc_fcp.c b/drivers/scsi/libfc/fc_fcp.c
index fd1ef06655cb..e705c30b4e1b 100644
--- a/drivers/scsi/libfc/fc_fcp.c
+++ b/drivers/scsi/libfc/fc_fcp.c
@@ -1329,7 +1329,7 @@ static int fc_lun_reset(struct fc_lport *lport, struct =
fc_fcp_pkt *fsp,
 	fsp->state |=3D FC_SRB_COMPL;
 	spin_unlock_bh(&fsp->scsi_pkt_lock);
=20
-	del_timer_sync(&fsp->timer);
+	timer_delete_sync(&fsp->timer);
=20
 	spin_lock_bh(&fsp->scsi_pkt_lock);
 	if (fsp->seq_ptr) {
@@ -1961,7 +1961,7 @@ static void fc_io_compl(struct fc_fcp_pkt *fsp)
 	fsp->state |=3D FC_SRB_COMPL;
 	if (!(fsp->state & FC_SRB_FCP_PROCESSING_TMO)) {
 		spin_unlock_bh(&fsp->scsi_pkt_lock);
-		del_timer_sync(&fsp->timer);
+		timer_delete_sync(&fsp->timer);
 		spin_lock_bh(&fsp->scsi_pkt_lock);
 	}
=20
diff --git a/drivers/scsi/libiscsi.c b/drivers/scsi/libiscsi.c
index 2b1bf990a9dc..1ddaf7228340 100644
--- a/drivers/scsi/libiscsi.c
+++ b/drivers/scsi/libiscsi.c
@@ -1945,7 +1945,7 @@ static int iscsi_exec_task_mgmt_fn(struct iscsi_conn *c=
onn,
 				 session->tmf_state !=3D TMF_QUEUED);
 	if (signal_pending(current))
 		flush_signals(current);
-	del_timer_sync(&session->tmf_timer);
+	timer_delete_sync(&session->tmf_timer);
=20
 	mutex_lock(&session->eh_mutex);
 	spin_lock_bh(&session->frwd_lock);
@@ -3247,7 +3247,7 @@ void iscsi_conn_teardown(struct iscsi_cls_conn *cls_con=
n)
=20
 	iscsi_remove_conn(cls_conn);
=20
-	del_timer_sync(&conn->transport_timer);
+	timer_delete_sync(&conn->transport_timer);
=20
 	mutex_lock(&session->eh_mutex);
 	spin_lock_bh(&session->frwd_lock);
@@ -3411,7 +3411,7 @@ void iscsi_conn_stop(struct iscsi_cls_conn *cls_conn, i=
nt flag)
 	conn->stop_stage =3D flag;
 	spin_unlock_bh(&session->frwd_lock);
=20
-	del_timer_sync(&conn->transport_timer);
+	timer_delete_sync(&conn->transport_timer);
 	iscsi_suspend_tx(conn);
=20
 	spin_lock_bh(&session->frwd_lock);
diff --git a/drivers/scsi/libsas/sas_expander.c b/drivers/scsi/libsas/sas_exp=
ander.c
index 2b8004eb6f1b..869b5d4db44c 100644
--- a/drivers/scsi/libsas/sas_expander.c
+++ b/drivers/scsi/libsas/sas_expander.c
@@ -89,7 +89,7 @@ static int smp_execute_task_sg(struct domain_device *dev,
 		res =3D i->dft->lldd_execute_task(task, GFP_KERNEL);
=20
 		if (res) {
-			del_timer_sync(&task->slow_task->timer);
+			timer_delete_sync(&task->slow_task->timer);
 			pr_notice("executing SMP task failed:%d\n", res);
 			break;
 		}
diff --git a/drivers/scsi/libsas/sas_scsi_host.c b/drivers/scsi/libsas/sas_sc=
si_host.c
index 55ce7892f217..feb2461b90e8 100644
--- a/drivers/scsi/libsas/sas_scsi_host.c
+++ b/drivers/scsi/libsas/sas_scsi_host.c
@@ -859,7 +859,7 @@ EXPORT_SYMBOL_GPL(sas_bios_param);
=20
 void sas_task_internal_done(struct sas_task *task)
 {
-	del_timer(&task->slow_task->timer);
+	timer_delete(&task->slow_task->timer);
 	complete(&task->slow_task->completion);
 }
=20
@@ -911,7 +911,7 @@ static int sas_execute_internal_abort(struct domain_devic=
e *device,
=20
 		res =3D i->dft->lldd_execute_task(task, GFP_KERNEL);
 		if (res) {
-			del_timer_sync(&task->slow_task->timer);
+			timer_delete_sync(&task->slow_task->timer);
 			pr_err("Executing internal abort failed %016llx (%d)\n",
 			       SAS_ADDR(device->sas_addr), res);
 			break;
@@ -1010,7 +1010,7 @@ int sas_execute_tmf(struct domain_device *device, void =
*parameter,
=20
 		res =3D i->dft->lldd_execute_task(task, GFP_KERNEL);
 		if (res) {
-			del_timer_sync(&task->slow_task->timer);
+			timer_delete_sync(&task->slow_task->timer);
 			pr_err("executing TMF task failed %016llx (%d)\n",
 			       SAS_ADDR(device->sas_addr), res);
 			break;
@@ -1180,7 +1180,7 @@ void sas_task_abort(struct sas_task *task)
=20
 		if (!slow)
 			return;
-		if (!del_timer(&slow->timer))
+		if (!timer_delete(&slow->timer))
 			return;
 		slow->timer.function(&slow->timer);
 		return;
diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_attr.c
index 0d0213bba35d..397216ff2c7e 100644
--- a/drivers/scsi/lpfc/lpfc_attr.c
+++ b/drivers/scsi/lpfc/lpfc_attr.c
@@ -2578,7 +2578,7 @@ lpfc_poll_store(struct device *dev, struct device_attri=
bute *attr,
 	    (old_val & DISABLE_FCP_RING_INT))
 	{
 		spin_unlock_irq(&phba->hbalock);
-		del_timer(&phba->fcp_poll_timer);
+		timer_delete(&phba->fcp_poll_timer);
 		spin_lock_irq(&phba->hbalock);
 		if (lpfc_readl(phba->HCregaddr, &creg_val)) {
 			spin_unlock_irq(&phba->hbalock);
diff --git a/drivers/scsi/lpfc/lpfc_els.c b/drivers/scsi/lpfc/lpfc_els.c
index e08b48b1b655..375a879c31f1 100644
--- a/drivers/scsi/lpfc/lpfc_els.c
+++ b/drivers/scsi/lpfc/lpfc_els.c
@@ -4333,7 +4333,7 @@ lpfc_cancel_retry_delay_tmo(struct lpfc_vport *vport, s=
truct lpfc_nodelist *nlp)
=20
 	if (!test_and_clear_bit(NLP_DELAY_TMO, &nlp->nlp_flag))
 		return;
-	del_timer_sync(&nlp->nlp_delayfunc);
+	timer_delete_sync(&nlp->nlp_delayfunc);
 	nlp->nlp_last_elscmd =3D 0;
 	if (!list_empty(&nlp->els_retry_evt.evt_listp)) {
 		list_del_init(&nlp->els_retry_evt.evt_listp);
@@ -4431,7 +4431,7 @@ lpfc_els_retry_delay_handler(struct lpfc_nodelist *ndlp)
 	 * firing and before processing the timer, cancel the
 	 * nlp_delayfunc.
 	 */
-	del_timer_sync(&ndlp->nlp_delayfunc);
+	timer_delete_sync(&ndlp->nlp_delayfunc);
 	retry =3D ndlp->nlp_retry;
 	ndlp->nlp_retry =3D 0;
=20
diff --git a/drivers/scsi/lpfc/lpfc_hbadisc.c b/drivers/scsi/lpfc/lpfc_hbadis=
c.c
index 8ca590e8469b..179be6c5a43e 100644
--- a/drivers/scsi/lpfc/lpfc_hbadisc.c
+++ b/drivers/scsi/lpfc/lpfc_hbadisc.c
@@ -1228,7 +1228,7 @@ lpfc_linkdown_port(struct lpfc_vport *vport)
=20
 	/* Stop delayed Nport discovery */
 	clear_bit(FC_DISC_DELAYED, &vport->fc_flag);
-	del_timer_sync(&vport->delayed_disc_tmo);
+	timer_delete_sync(&vport->delayed_disc_tmo);
=20
 	if (phba->sli_rev =3D=3D LPFC_SLI_REV4 &&
 	    vport->port_type =3D=3D LPFC_PHYSICAL_PORT &&
@@ -1418,7 +1418,7 @@ lpfc_linkup(struct lpfc_hba *phba)
=20
 	/* Unblock fabric iocbs if they are blocked */
 	clear_bit(FABRIC_COMANDS_BLOCKED, &phba->bit_flags);
-	del_timer_sync(&phba->fabric_block_timer);
+	timer_delete_sync(&phba->fabric_block_timer);
=20
 	vports =3D lpfc_create_vport_work_array(phba);
 	if (vports !=3D NULL)
@@ -5010,7 +5010,7 @@ lpfc_can_disctmo(struct lpfc_vport *vport)
 	if (test_bit(FC_DISC_TMO, &vport->fc_flag) ||
 	    timer_pending(&vport->fc_disctmo)) {
 		clear_bit(FC_DISC_TMO, &vport->fc_flag);
-		del_timer_sync(&vport->fc_disctmo);
+		timer_delete_sync(&vport->fc_disctmo);
 		spin_lock_irqsave(&vport->work_port_lock, iflags);
 		vport->work_port_events &=3D ~WORKER_DISC_TMO;
 		spin_unlock_irqrestore(&vport->work_port_lock, iflags);
@@ -5501,7 +5501,7 @@ lpfc_cleanup_node(struct lpfc_vport *vport, struct lpfc=
_nodelist *ndlp)
 	clear_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
=20
 	ndlp->nlp_last_elscmd =3D 0;
-	del_timer_sync(&ndlp->nlp_delayfunc);
+	timer_delete_sync(&ndlp->nlp_delayfunc);
=20
 	list_del_init(&ndlp->els_retry_evt.evt_listp);
 	list_del_init(&ndlp->dev_loss_evt.evt_listp);
diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 7238608ca49f..90021653e59e 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -3120,8 +3120,8 @@ lpfc_cleanup(struct lpfc_vport *vport)
 void
 lpfc_stop_vport_timers(struct lpfc_vport *vport)
 {
-	del_timer_sync(&vport->els_tmofunc);
-	del_timer_sync(&vport->delayed_disc_tmo);
+	timer_delete_sync(&vport->els_tmofunc);
+	timer_delete_sync(&vport->delayed_disc_tmo);
 	lpfc_can_disctmo(vport);
 	return;
 }
@@ -3140,7 +3140,7 @@ __lpfc_sli4_stop_fcf_redisc_wait_timer(struct lpfc_hba =
*phba)
 	phba->fcf.fcf_flag &=3D ~FCF_REDISC_PEND;
=20
 	/* Now, try to stop the timer */
-	del_timer(&phba->fcf.redisc_wait);
+	timer_delete(&phba->fcf.redisc_wait);
 }
=20
 /**
@@ -3302,12 +3302,12 @@ lpfc_stop_hba_timers(struct lpfc_hba *phba)
 		lpfc_stop_vport_timers(phba->pport);
 	cancel_delayed_work_sync(&phba->eq_delay_work);
 	cancel_delayed_work_sync(&phba->idle_stat_delay_work);
-	del_timer_sync(&phba->sli.mbox_tmo);
-	del_timer_sync(&phba->fabric_block_timer);
-	del_timer_sync(&phba->eratt_poll);
-	del_timer_sync(&phba->hb_tmofunc);
+	timer_delete_sync(&phba->sli.mbox_tmo);
+	timer_delete_sync(&phba->fabric_block_timer);
+	timer_delete_sync(&phba->eratt_poll);
+	timer_delete_sync(&phba->hb_tmofunc);
 	if (phba->sli_rev =3D=3D LPFC_SLI_REV4) {
-		del_timer_sync(&phba->rrq_tmr);
+		timer_delete_sync(&phba->rrq_tmr);
 		clear_bit(HBA_RRQ_ACTIVE, &phba->hba_flag);
 	}
 	clear_bit(HBA_HBEAT_INP, &phba->hba_flag);
@@ -3316,7 +3316,7 @@ lpfc_stop_hba_timers(struct lpfc_hba *phba)
 	switch (phba->pci_dev_grp) {
 	case LPFC_PCI_DEV_LP:
 		/* Stop any LightPulse device specific driver timers */
-		del_timer_sync(&phba->fcp_poll_timer);
+		timer_delete_sync(&phba->fcp_poll_timer);
 		break;
 	case LPFC_PCI_DEV_OC:
 		/* Stop any OneConnect device specific driver timers */
@@ -12761,7 +12761,7 @@ static void __lpfc_cpuhp_remove(struct lpfc_hba *phba)
 	 * timer. Wait for the poll timer to retire.
 	 */
 	synchronize_rcu();
-	del_timer_sync(&phba->cpuhp_poll_timer);
+	timer_delete_sync(&phba->cpuhp_poll_timer);
 }
=20
 static void lpfc_cpuhp_remove(struct lpfc_hba *phba)
diff --git a/drivers/scsi/lpfc/lpfc_scsi.c b/drivers/scsi/lpfc/lpfc_scsi.c
index f0158fc00f78..9edf80b14b1a 100644
--- a/drivers/scsi/lpfc/lpfc_scsi.c
+++ b/drivers/scsi/lpfc/lpfc_scsi.c
@@ -5488,7 +5488,7 @@ void lpfc_vmid_vport_cleanup(struct lpfc_vport *vport)
 	struct lpfc_vmid *cur;
=20
 	if (vport->port_type =3D=3D LPFC_PHYSICAL_PORT)
-		del_timer_sync(&vport->phba->inactive_vmid_poll);
+		timer_delete_sync(&vport->phba->inactive_vmid_poll);
=20
 	kfree(vport->qfpa_res);
 	kfree(vport->vmid_priority.vmid_range);
diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 4e0d48fcb204..6574f9e74476 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -5041,7 +5041,7 @@ lpfc_sli_brdkill(struct lpfc_hba *phba)
 			return 1;
 	}
=20
-	del_timer_sync(&psli->mbox_tmo);
+	timer_delete_sync(&psli->mbox_tmo);
 	if (ha_copy & HA_ERATT) {
 		writel(HA_ERATT, phba->HAregaddr);
 		phba->pport->stopped =3D 1;
@@ -12076,7 +12076,7 @@ lpfc_sli_hba_down(struct lpfc_hba *phba)
 	local_bh_enable();
=20
 	/* Return any active mbox cmds */
-	del_timer_sync(&psli->mbox_tmo);
+	timer_delete_sync(&psli->mbox_tmo);
=20
 	spin_lock_irqsave(&phba->pport->work_port_lock, flags);
 	phba->pport->work_port_events &=3D ~WORKER_MBOX_TMO;
@@ -13802,7 +13802,7 @@ lpfc_sli_sp_intr_handler(int irq, void *dev_id)
 				phba->sli.mbox_active =3D NULL;
 				spin_unlock_irqrestore(&phba->hbalock, iflag);
 				phba->last_completion_time =3D jiffies;
-				del_timer(&phba->sli.mbox_tmo);
+				timer_delete(&phba->sli.mbox_tmo);
 				if (pmb->mbox_cmpl) {
 					lpfc_sli_pcimem_bcopy(mbox, pmbox,
 							MAILBOX_CMD_SIZE);
@@ -14302,7 +14302,7 @@ lpfc_sli4_sp_handle_mbox_event(struct lpfc_hba *phba,=
 struct lpfc_mcqe *mcqe)
=20
 	/* Reset heartbeat timer */
 	phba->last_completion_time =3D jiffies;
-	del_timer(&phba->sli.mbox_tmo);
+	timer_delete(&phba->sli.mbox_tmo);
=20
 	/* Move mbox data to caller's mailbox region, do endian swapping */
 	if (pmb->mbox_cmpl && mbox)
@@ -15689,7 +15689,7 @@ static inline void lpfc_sli4_remove_from_poll_list(st=
ruct lpfc_queue *eq)
 	synchronize_rcu();
=20
 	if (list_empty(&phba->poll_list))
-		del_timer_sync(&phba->cpuhp_poll_timer);
+		timer_delete_sync(&phba->cpuhp_poll_timer);
 }
=20
 void lpfc_sli4_cleanup_poll_list(struct lpfc_hba *phba)
diff --git a/drivers/scsi/megaraid/megaraid_mbox.c b/drivers/scsi/megaraid/me=
garaid_mbox.c
index 3ba837b3093f..d533a8aa72cc 100644
--- a/drivers/scsi/megaraid/megaraid_mbox.c
+++ b/drivers/scsi/megaraid/megaraid_mbox.c
@@ -3951,7 +3951,7 @@ megaraid_sysfs_get_ldmap(adapter_t *adapter)
 	}
=20
=20
-	del_timer_sync(&timeout.timer);
+	timer_delete_sync(&timeout.timer);
 	destroy_timer_on_stack(&timeout.timer);
=20
 	mutex_unlock(&raid_dev->sysfs_mtx);
diff --git a/drivers/scsi/megaraid/megaraid_mm.c b/drivers/scsi/megaraid/mega=
raid_mm.c
index c509440bd161..1f2cd15e3361 100644
--- a/drivers/scsi/megaraid/megaraid_mm.c
+++ b/drivers/scsi/megaraid/megaraid_mm.c
@@ -703,7 +703,7 @@ lld_ioctl(mraid_mmadp_t *adp, uioc_t *kioc)
 	 */
 	wait_event(wait_q, (kioc->status !=3D -ENODATA));
 	if (timeout.timer.function) {
-		del_timer_sync(&timeout.timer);
+		timer_delete_sync(&timeout.timer);
 		destroy_timer_on_stack(&timeout.timer);
 	}
=20
diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megarai=
d/megaraid_sas_base.c
index 28c75865967a..c20447b39cb9 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -6521,7 +6521,7 @@ static int megasas_init_fw(struct megasas_instance *ins=
tance)
=20
 fail_start_watchdog:
 	if (instance->requestorId && !instance->skip_heartbeat_timer_del)
-		del_timer_sync(&instance->sriov_heartbeat_timer);
+		timer_delete_sync(&instance->sriov_heartbeat_timer);
 fail_get_ld_pd_list:
 	instance->instancet->disable_intr(instance);
 	megasas_destroy_irqs(instance);
@@ -7603,7 +7603,7 @@ static int megasas_probe_one(struct pci_dev *pdev,
 	megasas_mgmt_info.instance[megasas_mgmt_info.max_index] =3D NULL;
=20
 	if (instance->requestorId && !instance->skip_heartbeat_timer_del)
-		del_timer_sync(&instance->sriov_heartbeat_timer);
+		timer_delete_sync(&instance->sriov_heartbeat_timer);
=20
 	instance->instancet->disable_intr(instance);
 	megasas_destroy_irqs(instance);
@@ -7743,7 +7743,7 @@ megasas_suspend(struct device *dev)
=20
 	/* Shutdown SR-IOV heartbeat timer */
 	if (instance->requestorId && !instance->skip_heartbeat_timer_del)
-		del_timer_sync(&instance->sriov_heartbeat_timer);
+		timer_delete_sync(&instance->sriov_heartbeat_timer);
=20
 	/* Stop the FW fault detection watchdog */
 	if (instance->adapter_type !=3D MFI_SERIES)
@@ -7907,7 +7907,7 @@ megasas_resume(struct device *dev)
=20
 fail_start_watchdog:
 	if (instance->requestorId && !instance->skip_heartbeat_timer_del)
-		del_timer_sync(&instance->sriov_heartbeat_timer);
+		timer_delete_sync(&instance->sriov_heartbeat_timer);
 fail_init_mfi:
 	megasas_free_ctrl_dma_buffers(instance);
 	megasas_free_ctrl_mem(instance);
@@ -7971,7 +7971,7 @@ static void megasas_detach_one(struct pci_dev *pdev)
=20
 	/* Shutdown SR-IOV heartbeat timer */
 	if (instance->requestorId && !instance->skip_heartbeat_timer_del)
-		del_timer_sync(&instance->sriov_heartbeat_timer);
+		timer_delete_sync(&instance->sriov_heartbeat_timer);
=20
 	/* Stop the FW fault detection watchdog */
 	if (instance->adapter_type !=3D MFI_SERIES)
diff --git a/drivers/scsi/megaraid/megaraid_sas_fusion.c b/drivers/scsi/megar=
aid/megaraid_sas_fusion.c
index 1eec23da28e2..721860cb1ef6 100644
--- a/drivers/scsi/megaraid/megaraid_sas_fusion.c
+++ b/drivers/scsi/megaraid/megaraid_sas_fusion.c
@@ -4969,7 +4969,7 @@ int megasas_reset_fusion(struct Scsi_Host *shost, int r=
eason)
 	}
=20
 	if (instance->requestorId && !instance->skip_heartbeat_timer_del)
-		del_timer_sync(&instance->sriov_heartbeat_timer);
+		timer_delete_sync(&instance->sriov_heartbeat_timer);
 	set_bit(MEGASAS_FUSION_IN_RESET, &instance->reset_flags);
 	set_bit(MEGASAS_FUSION_OCR_NOT_POSSIBLE, &instance->reset_flags);
 	atomic_set(&instance->adprecovery, MEGASAS_ADPRESET_SM_POLLING);
diff --git a/drivers/scsi/mvsas/mv_sas.c b/drivers/scsi/mvsas/mv_sas.c
index c4592de4fefc..52ac10226cb0 100644
--- a/drivers/scsi/mvsas/mv_sas.c
+++ b/drivers/scsi/mvsas/mv_sas.c
@@ -976,7 +976,7 @@ static u32 mvs_is_sig_fis_received(u32 irq_status)
 static void mvs_sig_remove_timer(struct mvs_phy *phy)
 {
 	if (phy->timer.function)
-		del_timer(&phy->timer);
+		timer_delete(&phy->timer);
 	phy->timer.function =3D NULL;
 }
=20
diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index 3ba53916fd86..e0aeb206df8d 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -495,7 +495,7 @@ static void pmcraid_clr_trans_op(
 	}
=20
 	if (pinstance->reset_cmd !=3D NULL) {
-		del_timer(&pinstance->reset_cmd->timer);
+		timer_delete(&pinstance->reset_cmd->timer);
 		spin_lock_irqsave(
 			pinstance->host->host_lock, lock_flags);
 		pinstance->reset_cmd->cmd_done(pinstance->reset_cmd);
@@ -1999,7 +1999,7 @@ static void pmcraid_fail_outstanding_cmds(struct pmcrai=
d_instance *pinstance)
 			cpu_to_le32(PMCRAID_DRIVER_ILID);
=20
 		/* In case the command timer is still running */
-		del_timer(&cmd->timer);
+		timer_delete(&cmd->timer);
=20
 		/* If this is an IO command, complete it by invoking scsi_done
 		 * function. If this is one of the internal commands other
@@ -3982,7 +3982,7 @@ static void pmcraid_tasklet_function(unsigned long inst=
ance)
 		list_del(&cmd->free_list);
 		spin_unlock_irqrestore(&pinstance->pending_pool_lock,
 					pending_lock_flags);
-		del_timer(&cmd->timer);
+		timer_delete(&cmd->timer);
 		atomic_dec(&pinstance->outstanding_cmds);
=20
 		if (cmd->cmd_done =3D=3D pmcraid_ioa_reset) {
diff --git a/drivers/scsi/qla1280.c b/drivers/scsi/qla1280.c
index 47d74f881948..078a9c80bce2 100644
--- a/drivers/scsi/qla1280.c
+++ b/drivers/scsi/qla1280.c
@@ -2454,7 +2454,7 @@ qla1280_mailbox_command(struct scsi_qla_host *ha, uint8=
_t mr, uint16_t *mb)
 	qla1280_debounce_register(&reg->istatus);
=20
 	wait_for_completion(&wait);
-	del_timer_sync(&ha->mailbox_timer);
+	timer_delete_sync(&ha->mailbox_timer);
=20
 	spin_lock_irq(ha->host->host_lock);
=20
diff --git a/drivers/scsi/qla2xxx/qla_init.c b/drivers/scsi/qla2xxx/qla_init.c
index 79cdfec2bca3..0c2dd782b675 100644
--- a/drivers/scsi/qla2xxx/qla_init.c
+++ b/drivers/scsi/qla2xxx/qla_init.c
@@ -67,7 +67,7 @@ void qla2x00_sp_free(srb_t *sp)
 {
 	struct srb_iocb *iocb =3D &sp->u.iocb_cmd;
=20
-	del_timer(&iocb->timer);
+	timer_delete(&iocb->timer);
 	qla2x00_rel_sp(sp);
 }
=20
diff --git a/drivers/scsi/qla2xxx/qla_iocb.c b/drivers/scsi/qla2xxx/qla_iocb.c
index 0b41e8a06602..3224044f1775 100644
--- a/drivers/scsi/qla2xxx/qla_iocb.c
+++ b/drivers/scsi/qla2xxx/qla_iocb.c
@@ -2572,7 +2572,7 @@ qla24xx_tm_iocb(srb_t *sp, struct tsk_mgmt_entry *tsk)
 static void
 qla2x00_async_done(struct srb *sp, int res)
 {
-	if (del_timer(&sp->u.iocb_cmd.timer)) {
+	if (timer_delete(&sp->u.iocb_cmd.timer)) {
 		/*
 		 * Successfully cancelled the timeout handler
 		 * ref: TMR
@@ -2645,7 +2645,7 @@ static void qla2x00_els_dcmd_sp_free(srb_t *sp)
 		    elsio->u.els_logo.els_logo_pyld,
 		    elsio->u.els_logo.els_logo_pyld_dma);
=20
-	del_timer(&elsio->timer);
+	timer_delete(&elsio->timer);
 	qla2x00_rel_sp(sp);
 }
=20
diff --git a/drivers/scsi/qla2xxx/qla_mid.c b/drivers/scsi/qla2xxx/qla_mid.c
index 79879c4743e6..8b71ac0b1d99 100644
--- a/drivers/scsi/qla2xxx/qla_mid.c
+++ b/drivers/scsi/qla2xxx/qla_mid.c
@@ -20,7 +20,7 @@ void
 qla2x00_vp_stop_timer(scsi_qla_host_t *vha)
 {
 	if (vha->vp_idx && vha->timer_active) {
-		del_timer_sync(&vha->timer);
+		timer_delete_sync(&vha->timer);
 		vha->timer_active =3D 0;
 	}
 }
diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index 6b9b8218b512..b44d134e7105 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -401,7 +401,7 @@ qla2x00_restart_timer(scsi_qla_host_t *vha, unsigned long=
 interval)
 static __inline__ void
 qla2x00_stop_timer(scsi_qla_host_t *vha)
 {
-	del_timer_sync(&vha->timer);
+	timer_delete_sync(&vha->timer);
 	vha->timer_active =3D 0;
 }
=20
diff --git a/drivers/scsi/qla4xxx/ql4_os.c b/drivers/scsi/qla4xxx/ql4_os.c
index 6b0e6b4cd8af..d540d66e6ffc 100644
--- a/drivers/scsi/qla4xxx/ql4_os.c
+++ b/drivers/scsi/qla4xxx/ql4_os.c
@@ -4021,7 +4021,7 @@ static void qla4xxx_start_timer(struct scsi_qla_host *h=
a,
=20
 static void qla4xxx_stop_timer(struct scsi_qla_host *ha)
 {
-	del_timer_sync(&ha->timer);
+	timer_delete_sync(&ha->timer);
 	ha->timer_active =3D 0;
 }
=20
diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/sm=
artpqi_init.c
index 0da7be40c925..88135fdb8bd1 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -3853,7 +3853,7 @@ static void pqi_start_heartbeat_timer(struct pqi_ctrl_i=
nfo *ctrl_info)
=20
 static inline void pqi_stop_heartbeat_timer(struct pqi_ctrl_info *ctrl_info)
 {
-	del_timer_sync(&ctrl_info->heartbeat_timer);
+	timer_delete_sync(&ctrl_info->heartbeat_timer);
 }
=20
 static void pqi_ofa_capture_event_payload(struct pqi_ctrl_info *ctrl_info,
diff --git a/drivers/scsi/sym53c8xx_2/sym_glue.c b/drivers/scsi/sym53c8xx_2/s=
ym_glue.c
index 212d89d0d23e..1a6eb72ca281 100644
--- a/drivers/scsi/sym53c8xx_2/sym_glue.c
+++ b/drivers/scsi/sym53c8xx_2/sym_glue.c
@@ -1657,7 +1657,7 @@ static int sym_detach(struct Scsi_Host *shost, struct p=
ci_dev *pdev)
 	struct sym_hcb *np =3D sym_get_hcb(shost);
 	printk("%s: detaching ...\n", sym_name(np));
=20
-	del_timer_sync(&np->s.timer);
+	timer_delete_sync(&np->s.timer);
=20
 	/*
 	 * Reset NCR chip.
diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/s=
taging/gpib/agilent_82357a/agilent_82357a.c
index 67bf125645c0..da229965d98e 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -102,7 +102,7 @@ static int agilent_82357a_send_bulk_msg(struct agilent_82=
357a_priv *a_priv, void
 cleanup:
 	if (timeout_msecs) {
 		if (timer_pending(&a_priv->bulk_timer))
-			del_timer_sync(&a_priv->bulk_timer);
+			timer_delete_sync(&a_priv->bulk_timer);
 	}
 	mutex_lock(&a_priv->bulk_alloc_lock);
 	if (a_priv->bulk_urb) {
@@ -169,7 +169,7 @@ static int agilent_82357a_receive_bulk_msg(struct agilent=
_82357a_priv *a_priv, v
 	*actual_data_length =3D a_priv->bulk_urb->actual_length;
 cleanup:
 	if (timeout_msecs)
-		del_timer_sync(&a_priv->bulk_timer);
+		timer_delete_sync(&a_priv->bulk_timer);
=20
 	mutex_lock(&a_priv->bulk_alloc_lock);
 	if (a_priv->bulk_urb) {
diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/com=
mon/gpib_os.c
index cb77fe0a4b9a..8456b97290b8 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -109,7 +109,7 @@ void os_remove_timer(struct gpib_board *board)
 /* Removes the timeout task */
 {
 	if (timer_pending(&board->timer))
-		del_timer_sync(&board->timer);
+		timer_delete_sync(&board->timer);
 }
=20
 int io_timed_out(struct gpib_board *board)
@@ -163,7 +163,7 @@ void gpib_free_pseudo_irq(struct gpib_board *board)
 {
 	atomic_set(&board->pseudo_irq.active, 0);
=20
-	del_timer_sync(&board->pseudo_irq.timer);
+	timer_delete_sync(&board->pseudo_irq.timer);
 	board->pseudo_irq.handler =3D NULL;
 }
 EXPORT_SYMBOL(gpib_free_pseudo_irq);
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/commo=
n/iblib.c
index 6cca8a49e839..b297261818f2 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -610,7 +610,7 @@ static void start_wait_timer(struct wait_info *winfo)
=20
 static void remove_wait_timer(struct wait_info *winfo)
 {
-	del_timer_sync(&winfo->timer);
+	timer_delete_sync(&winfo->timer);
 	destroy_timer_on_stack(&winfo->timer);
 }
=20
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib=
/ni_usb/ni_usb_gpib.c
index 14f7049a8e5e..9f1b9927f025 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -136,7 +136,7 @@ static int ni_usb_nonblocking_send_bulk_msg(struct ni_usb=
_priv *ni_priv, void *d
=20
 	retval =3D usb_submit_urb(ni_priv->bulk_urb, GFP_KERNEL);
 	if (retval) {
-		del_timer_sync(&ni_priv->bulk_timer);
+		timer_delete_sync(&ni_priv->bulk_timer);
 		usb_free_urb(ni_priv->bulk_urb);
 		ni_priv->bulk_urb =3D NULL;
 		dev_err(&usb_dev->dev, "failed to submit bulk out urb, retval=3D%i\n",
@@ -154,7 +154,7 @@ static int ni_usb_nonblocking_send_bulk_msg(struct ni_usb=
_priv *ni_priv, void *d
 		retval =3D ni_priv->bulk_urb->status;
 	}
=20
-	del_timer_sync(&ni_priv->bulk_timer);
+	timer_delete_sync(&ni_priv->bulk_timer);
 	*actual_data_length =3D ni_priv->bulk_urb->actual_length;
 	mutex_lock(&ni_priv->bulk_transfer_lock);
 	usb_free_urb(ni_priv->bulk_urb);
@@ -222,7 +222,7 @@ static int ni_usb_nonblocking_receive_bulk_msg(struct ni_=
usb_priv *ni_priv,
=20
 	retval =3D usb_submit_urb(ni_priv->bulk_urb, GFP_KERNEL);
 	if (retval) {
-		del_timer_sync(&ni_priv->bulk_timer);
+		timer_delete_sync(&ni_priv->bulk_timer);
 		usb_free_urb(ni_priv->bulk_urb);
 		ni_priv->bulk_urb =3D NULL;
 		dev_err(&usb_dev->dev, "failed to submit bulk in urb, retval=3D%i\n", retv=
al);
@@ -256,7 +256,7 @@ static int ni_usb_nonblocking_receive_bulk_msg(struct ni_=
usb_priv *ni_priv,
 		if (ni_priv->bulk_urb->status)
 			retval =3D ni_priv->bulk_urb->status;
 	}
-	del_timer_sync(&ni_priv->bulk_timer);
+	timer_delete_sync(&ni_priv->bulk_timer);
 	*actual_data_length =3D ni_priv->bulk_urb->actual_length;
 	mutex_lock(&ni_priv->bulk_transfer_lock);
 	usb_free_urb(ni_priv->bulk_urb);
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/me=
dia/imx/imx-ic-prpencvf.c
index 17fd980c9d3c..2855ba2296ac 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -781,7 +781,7 @@ static void prp_stop(struct prp_priv *priv)
 	imx_media_free_dma_buf(ic_priv->ipu_dev, &priv->underrun_buf);
=20
 	/* cancel the EOF timeout timer */
-	del_timer_sync(&priv->eof_timeout_timer);
+	timer_delete_sync(&priv->eof_timeout_timer);
=20
 	prp_put_ipu_resources(priv);
 }
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/medi=
a/imx/imx-media-csi.c
index 3edbc57be2ca..f1d7fce8c020 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -695,7 +695,7 @@ static void csi_idmac_stop(struct csi_priv *priv)
 	imx_media_free_dma_buf(priv->dev, &priv->underrun_buf);
=20
 	/* cancel the EOF timeout timer */
-	del_timer_sync(&priv->eof_timeout_timer);
+	timer_delete_sync(&priv->eof_timeout_timer);
=20
 	csi_idmac_put_ipu_resources(priv);
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl87=
23bs/core/rtw_cmd.c
index 64ce33c6fba1..1c9e8b01d9d8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1846,7 +1846,7 @@ void rtw_createbss_cmd_callback(struct adapter *padapte=
r, struct cmd_obj *pcmd)
 	if (pcmd->res !=3D H2C_SUCCESS)
 		_set_timer(&pmlmepriv->assoc_timer, 1);
=20
-	del_timer_sync(&pmlmepriv->assoc_timer);
+	timer_delete_sync(&pmlmepriv->assoc_timer);
=20
 	spin_lock_bh(&pmlmepriv->lock);
=20
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8=
723bs/core/rtw_mlme.c
index 5ded183aa08c..58de0c2fdd68 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -681,7 +681,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapte=
r, u8 *pbuf)
=20
 	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)) {
 		spin_unlock_bh(&pmlmepriv->lock);
-		del_timer_sync(&pmlmepriv->scan_to_timer);
+		timer_delete_sync(&pmlmepriv->scan_to_timer);
 		spin_lock_bh(&pmlmepriv->lock);
 		_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
 	}
@@ -1166,7 +1166,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adapte=
r, u8 *pbuf)
=20
 			spin_unlock_bh(&pmlmepriv->lock);
 			/* s5. Cancel assoc_timer */
-			del_timer_sync(&pmlmepriv->assoc_timer);
+			timer_delete_sync(&pmlmepriv->assoc_timer);
 			spin_lock_bh(&pmlmepriv->lock);
 		} else {
 			spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/=
rtl8723bs/core/rtw_mlme_ext.c
index 952ce6dd5af9..3d36b6f005e0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -412,9 +412,9 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 		return;
=20
 	if (padapter->bDriverStopped) {
-		del_timer_sync(&pmlmeext->survey_timer);
-		del_timer_sync(&pmlmeext->link_timer);
-		/* del_timer_sync(&pmlmeext->ADDBA_timer); */
+		timer_delete_sync(&pmlmeext->survey_timer);
+		timer_delete_sync(&pmlmeext->link_timer);
+		/* timer_delete_sync(&pmlmeext->ADDBA_timer); */
 	}
 }
=20
@@ -1390,7 +1390,7 @@ unsigned int OnAssocRsp(struct adapter *padapter, union=
 recv_frame *precv_frame)
 	if (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)
 		return _SUCCESS;
=20
-	del_timer_sync(&pmlmeext->link_timer);
+	timer_delete_sync(&pmlmeext->link_timer);
=20
 	/* status */
 	status =3D le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + 2));
@@ -1862,7 +1862,7 @@ unsigned int OnAction_sa_query(struct adapter *padapter=
, union recv_frame *precv
 		break;
=20
 	case 1: /* SA Query rsp */
-		del_timer_sync(&pmlmeext->sa_query_timer);
+		timer_delete_sync(&pmlmeext->sa_query_timer);
 		break;
 	default:
 		break;
@@ -4185,7 +4185,7 @@ void start_clnt_auth(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext =3D &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo =3D &(pmlmeext->mlmext_info);
=20
-	del_timer_sync(&pmlmeext->link_timer);
+	timer_delete_sync(&pmlmeext->link_timer);
=20
 	pmlmeinfo->state &=3D (~WIFI_FW_AUTH_NULL);
 	pmlmeinfo->state |=3D WIFI_FW_AUTH_STATE;
@@ -4210,7 +4210,7 @@ void start_clnt_assoc(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext =3D &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo =3D &(pmlmeext->mlmext_info);
=20
-	del_timer_sync(&pmlmeext->link_timer);
+	timer_delete_sync(&pmlmeext->link_timer);
=20
 	pmlmeinfo->state &=3D (~(WIFI_FW_AUTH_NULL | WIFI_FW_AUTH_STATE));
 	pmlmeinfo->state |=3D (WIFI_FW_AUTH_SUCCESS | WIFI_FW_ASSOC_STATE);
@@ -4792,7 +4792,7 @@ static void rtw_mlmeext_disconnect(struct adapter *pada=
pter)
=20
 	flush_all_cam_entry(padapter);
=20
-	del_timer_sync(&pmlmeext->link_timer);
+	timer_delete_sync(&pmlmeext->link_timer);
=20
 	/* pmlmepriv->LinkDetectInfo.TrafficBusyState =3D false; */
 	pmlmepriv->LinkDetectInfo.TrafficTransitionCount =3D 0;
@@ -5268,7 +5268,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 		/* rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain));=
 */
=20
 		/* cancel link timer */
-		del_timer_sync(&pmlmeext->link_timer);
+		timer_delete_sync(&pmlmeext->link_timer);
=20
 		/* clear CAM */
 		flush_all_cam_entry(padapter);
@@ -5312,7 +5312,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		/* clear CAM */
 		flush_all_cam_entry(padapter);
=20
-		del_timer_sync(&pmlmeext->link_timer);
+		timer_delete_sync(&pmlmeext->link_timer);
=20
 		/* set MSR to nolink -> infra. mode */
 		/* Set_MSR(padapter, _HW_STATE_NOLINK_); */
@@ -5425,7 +5425,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	set_channel_bwmode(padapter, ch, offset, bw);
=20
 	/* cancel link timer */
-	del_timer_sync(&pmlmeext->link_timer);
+	timer_delete_sync(&pmlmeext->link_timer);
=20
 	start_clnt_join(padapter);
=20
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8=
723bs/core/rtw_recv.c
index a389ba5ecc6f..895116e9f4e7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1893,7 +1893,7 @@ static int recv_indicatepkt_reorder(struct adapter *pad=
apter, union recv_frame *
 		spin_unlock_bh(&ppending_recvframe_queue->lock);
 	} else {
 		spin_unlock_bh(&ppending_recvframe_queue->lock);
-		del_timer_sync(&preorder_ctrl->reordering_ctrl_timer);
+		timer_delete_sync(&preorder_ctrl->reordering_ctrl_timer);
 	}
=20
 	return _SUCCESS;
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/r=
tl8723bs/core/rtw_sta_mgt.c
index 1b72f2196a1c..1d2b53c76afc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -158,7 +158,7 @@ u32 _rtw_free_sta_priv(struct	sta_priv *pstapriv)
=20
 				for (i =3D 0; i < 16 ; i++) {
 					preorder_ctrl =3D &psta->recvreorder_ctrl[i];
-					del_timer_sync(&preorder_ctrl->reordering_ctrl_timer);
+					timer_delete_sync(&preorder_ctrl->reordering_ctrl_timer);
 				}
 			}
 		}
@@ -343,7 +343,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta=
_info *psta)
 	/* _rtw_init_sta_xmit_priv(&psta->sta_xmitpriv); */
 	/* _rtw_init_sta_recv_priv(&psta->sta_recvpriv); */
=20
-	del_timer_sync(&psta->addba_retry_timer);
+	timer_delete_sync(&psta->addba_retry_timer);
=20
 	/* for A-MPDU Rx reordering buffer control, cancel reordering_ctrl_timer */
 	for (i =3D 0; i < 16 ; i++) {
@@ -354,7 +354,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta=
_info *psta)
=20
 		preorder_ctrl =3D &psta->recvreorder_ctrl[i];
=20
-		del_timer_sync(&preorder_ctrl->reordering_ctrl_timer);
+		timer_delete_sync(&preorder_ctrl->reordering_ctrl_timer);
=20
 		ppending_recvframe_queue =3D &preorder_ctrl->pending_recvframe_queue;
=20
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl87=
23bs/hal/sdio_ops.c
index 21e9f1858745..8736c124f857 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -871,7 +871,7 @@ void sd_int_dpc(struct adapter *adapter)
 	}
=20
 	if (hal->sdio_hisr & SDIO_HISR_CPWM1) {
-		del_timer_sync(&(pwrctl->pwr_rpwm_timer));
+		timer_delete_sync(&(pwrctl->pwr_rpwm_timer));
=20
 		SdioLocalCmd52Read1Byte(adapter, SDIO_REG_HCPWM1_8723B);
=20
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rt=
l8723bs/os_dep/os_intfs.c
index de48c3454ab3..0248dff8f2aa 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -697,18 +697,18 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
=20
 void rtw_cancel_all_timer(struct adapter *padapter)
 {
-	del_timer_sync(&padapter->mlmepriv.assoc_timer);
+	timer_delete_sync(&padapter->mlmepriv.assoc_timer);
=20
-	del_timer_sync(&padapter->mlmepriv.scan_to_timer);
+	timer_delete_sync(&padapter->mlmepriv.scan_to_timer);
=20
-	del_timer_sync(&padapter->mlmepriv.dynamic_chk_timer);
+	timer_delete_sync(&padapter->mlmepriv.dynamic_chk_timer);
=20
-	del_timer_sync(&(adapter_to_pwrctl(padapter)->pwr_state_check_timer));
+	timer_delete_sync(&(adapter_to_pwrctl(padapter)->pwr_state_check_timer));
=20
-	del_timer_sync(&padapter->mlmepriv.set_scan_deny_timer);
+	timer_delete_sync(&padapter->mlmepriv.set_scan_deny_timer);
 	rtw_clear_scan_deny(padapter);
=20
-	del_timer_sync(&padapter->recvpriv.signal_stat_timer);
+	timer_delete_sync(&padapter->recvpriv.signal_stat_timer);
=20
 	/* cancel dm timer */
 	rtw_hal_dm_deinit(padapter);
diff --git a/drivers/target/iscsi/iscsi_target_erl0.c b/drivers/target/iscsi/=
iscsi_target_erl0.c
index 07e9cf431edd..f0d7eebfcad6 100644
--- a/drivers/target/iscsi/iscsi_target_erl0.c
+++ b/drivers/target/iscsi/iscsi_target_erl0.c
@@ -810,7 +810,7 @@ int iscsit_stop_time2retain_timer(struct iscsit_session *=
sess)
 	sess->time2retain_timer_flags |=3D ISCSI_TF_STOP;
 	spin_unlock(&se_tpg->session_lock);
=20
-	del_timer_sync(&sess->time2retain_timer);
+	timer_delete_sync(&sess->time2retain_timer);
=20
 	spin_lock(&se_tpg->session_lock);
 	sess->time2retain_timer_flags &=3D ~ISCSI_TF_RUNNING;
diff --git a/drivers/target/iscsi/iscsi_target_erl1.c b/drivers/target/iscsi/=
iscsi_target_erl1.c
index d9a6242264b7..e7c3c4cdaae4 100644
--- a/drivers/target/iscsi/iscsi_target_erl1.c
+++ b/drivers/target/iscsi/iscsi_target_erl1.c
@@ -1227,7 +1227,7 @@ void iscsit_stop_dataout_timer(struct iscsit_cmd *cmd)
 	cmd->dataout_timer_flags |=3D ISCSI_TF_STOP;
 	spin_unlock_bh(&cmd->dataout_timeout_lock);
=20
-	del_timer_sync(&cmd->dataout_timer);
+	timer_delete_sync(&cmd->dataout_timer);
=20
 	spin_lock_bh(&cmd->dataout_timeout_lock);
 	cmd->dataout_timer_flags &=3D ~ISCSI_TF_RUNNING;
diff --git a/drivers/target/iscsi/iscsi_target_util.c b/drivers/target/iscsi/=
iscsi_target_util.c
index ed2dadb21f75..0bd62ab9a1cd 100644
--- a/drivers/target/iscsi/iscsi_target_util.c
+++ b/drivers/target/iscsi/iscsi_target_util.c
@@ -922,7 +922,7 @@ void iscsit_stop_nopin_response_timer(struct iscsit_conn =
*conn)
 	conn->nopin_response_timer_flags |=3D ISCSI_TF_STOP;
 	spin_unlock_bh(&conn->nopin_timer_lock);
=20
-	del_timer_sync(&conn->nopin_response_timer);
+	timer_delete_sync(&conn->nopin_response_timer);
=20
 	spin_lock_bh(&conn->nopin_timer_lock);
 	conn->nopin_response_timer_flags &=3D ~ISCSI_TF_RUNNING;
@@ -989,7 +989,7 @@ void iscsit_stop_nopin_timer(struct iscsit_conn *conn)
 	conn->nopin_timer_flags |=3D ISCSI_TF_STOP;
 	spin_unlock_bh(&conn->nopin_timer_lock);
=20
-	del_timer_sync(&conn->nopin_timer);
+	timer_delete_sync(&conn->nopin_timer);
=20
 	spin_lock_bh(&conn->nopin_timer_lock);
 	conn->nopin_timer_flags &=3D ~ISCSI_TF_RUNNING;
diff --git a/drivers/target/target_core_user.c b/drivers/target/target_core_u=
ser.c
index 0f5d820af119..43872ccc07cc 100644
--- a/drivers/target/target_core_user.c
+++ b/drivers/target/target_core_user.c
@@ -1232,7 +1232,7 @@ static void tcmu_set_next_deadline(struct list_head *qu=
eue,
 		cmd =3D list_first_entry(queue, struct tcmu_cmd, queue_entry);
 		mod_timer(timer, cmd->deadline);
 	} else
-		del_timer(timer);
+		timer_delete(timer);
 }
=20
 static int
@@ -2321,8 +2321,8 @@ static void tcmu_destroy_device(struct se_device *dev)
 {
 	struct tcmu_dev *udev =3D TCMU_DEV(dev);
=20
-	del_timer_sync(&udev->cmd_timer);
-	del_timer_sync(&udev->qfull_timer);
+	timer_delete_sync(&udev->cmd_timer);
+	timer_delete_sync(&udev->qfull_timer);
=20
 	mutex_lock(&root_udev_mutex);
 	list_del(&udev->node);
@@ -2408,7 +2408,7 @@ static void tcmu_reset_ring(struct tcmu_dev *udev, u8 e=
rr_level)
 	tcmu_flush_dcache_range(mb, sizeof(*mb));
 	clear_bit(TCMU_DEV_BIT_BROKEN, &udev->flags);
=20
-	del_timer(&udev->cmd_timer);
+	timer_delete(&udev->cmd_timer);
=20
 	/*
 	 * ring is empty and qfull queue never contains aborted commands.
diff --git a/drivers/tty/ipwireless/hardware.c b/drivers/tty/ipwireless/hardw=
are.c
index 001ec318a918..c13f52337035 100644
--- a/drivers/tty/ipwireless/hardware.c
+++ b/drivers/tty/ipwireless/hardware.c
@@ -1496,7 +1496,7 @@ static void __handle_setup_get_version_rsp(struct ipw_h=
ardware *hw)
 static void handle_setup_get_version_rsp(struct ipw_hardware *hw,
 		unsigned char vers_no)
 {
-	del_timer(&hw->setup_timer);
+	timer_delete(&hw->setup_timer);
 	hw->initializing =3D 0;
 	printk(KERN_INFO IPWIRELESS_PCCARD_NAME ": card is ready.\n");
=20
@@ -1721,7 +1721,7 @@ void ipwireless_stop_interrupts(struct ipw_hardware *hw)
 	if (!hw->shutting_down) {
 		/* Tell everyone we are going down. */
 		hw->shutting_down =3D 1;
-		del_timer(&hw->setup_timer);
+		timer_delete(&hw->setup_timer);
=20
 		/* Prevent the hardware from sending any more interrupts */
 		do_close_hardware(hw);
diff --git a/drivers/tty/mips_ejtag_fdc.c b/drivers/tty/mips_ejtag_fdc.c
index 58b28be63c79..fa47bfcf9e86 100644
--- a/drivers/tty/mips_ejtag_fdc.c
+++ b/drivers/tty/mips_ejtag_fdc.c
@@ -1031,7 +1031,7 @@ static int mips_ejtag_fdc_tty_probe(struct mips_cdmm_de=
vice *dev)
 		raw_spin_unlock_irq(&priv->lock);
 	} else {
 		priv->removing =3D true;
-		del_timer_sync(&priv->poll_timer);
+		timer_delete_sync(&priv->poll_timer);
 	}
 	kthread_stop(priv->thread);
 err_destroy_ports:
@@ -1061,7 +1061,7 @@ static int mips_ejtag_fdc_tty_cpu_down(struct mips_cdmm=
_device *dev)
 		raw_spin_unlock_irq(&priv->lock);
 	} else {
 		priv->removing =3D true;
-		del_timer_sync(&priv->poll_timer);
+		timer_delete_sync(&priv->poll_timer);
 	}
 	kthread_stop(priv->thread);
=20
diff --git a/drivers/tty/moxa.c b/drivers/tty/moxa.c
index 1348e2214b81..329b30fac8fc 100644
--- a/drivers/tty/moxa.c
+++ b/drivers/tty/moxa.c
@@ -1187,7 +1187,7 @@ static void __exit moxa_exit(void)
 {
 	pci_unregister_driver(&moxa_pci_driver);
=20
-	del_timer_sync(&moxaTimer);
+	timer_delete_sync(&moxaTimer);
=20
 	tty_unregister_driver(moxaDriver);
 	tty_driver_kref_put(moxaDriver);
diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
index 363afe11974f..40a336ef8c7e 100644
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -1941,7 +1941,7 @@ static void gsm_control_response(struct gsm_mux *gsm, u=
nsigned int command,
 	/* Does the reply match our command */
 	if (ctrl !=3D NULL && (command =3D=3D ctrl->cmd || command =3D=3D CMD_NSC))=
 {
 		/* Our command was replied to, kill the retry timer */
-		del_timer(&gsm->t2_timer);
+		timer_delete(&gsm->t2_timer);
 		gsm->pending_cmd =3D NULL;
 		/* Rejected by the other end */
 		if (command =3D=3D CMD_NSC)
@@ -2131,7 +2131,7 @@ static int gsm_control_wait(struct gsm_mux *gsm, struct=
 gsm_control *control)
=20
 static void gsm_dlci_close(struct gsm_dlci *dlci)
 {
-	del_timer(&dlci->t1);
+	timer_delete(&dlci->t1);
 	if (debug & DBG_ERRORS)
 		pr_debug("DLCI %d goes closed.\n", dlci->addr);
 	dlci->state =3D DLCI_CLOSED;
@@ -2144,7 +2144,7 @@ static void gsm_dlci_close(struct gsm_dlci *dlci)
 		tty_port_set_initialized(&dlci->port, false);
 		wake_up_interruptible(&dlci->port.open_wait);
 	} else {
-		del_timer(&dlci->gsm->ka_timer);
+		timer_delete(&dlci->gsm->ka_timer);
 		dlci->gsm->dead =3D true;
 	}
 	/* A DLCI 0 close is a MUX termination so we need to kick that
@@ -2166,7 +2166,7 @@ static void gsm_dlci_open(struct gsm_dlci *dlci)
=20
 	/* Note that SABM UA .. SABM UA first UA lost can mean that we go
 	   open -> open */
-	del_timer(&dlci->t1);
+	timer_delete(&dlci->t1);
 	/* This will let a tty open continue */
 	dlci->state =3D DLCI_OPEN;
 	dlci->constipated =3D false;
@@ -3144,9 +3144,9 @@ static void gsm_cleanup_mux(struct gsm_mux *gsm, bool d=
isc)
 	}
=20
 	/* Finish outstanding timers, making sure they are done */
-	del_timer_sync(&gsm->kick_timer);
-	del_timer_sync(&gsm->t2_timer);
-	del_timer_sync(&gsm->ka_timer);
+	timer_delete_sync(&gsm->kick_timer);
+	timer_delete_sync(&gsm->t2_timer);
+	timer_delete_sync(&gsm->ka_timer);
=20
 	/* Finish writing to ldisc */
 	flush_work(&gsm->tx_work);
diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial=
/8250/8250_aspeed_vuart.c
index e5da9ce26006..392447038bfb 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -550,7 +550,7 @@ static void aspeed_vuart_remove(struct platform_device *p=
dev)
 {
 	struct aspeed_vuart *vuart =3D platform_get_drvdata(pdev);
=20
-	del_timer_sync(&vuart->unthrottle_timer);
+	timer_delete_sync(&vuart->unthrottle_timer);
 	aspeed_vuart_set_enabled(vuart, false);
 	serial8250_unregister_port(vuart->line);
 	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/82=
50_core.c
index 6f676bb37ac3..5a56f853cf6d 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -298,7 +298,7 @@ static void univ8250_release_irq(struct uart_8250_port *u=
p)
 {
 	struct uart_port *port =3D &up->port;
=20
-	del_timer_sync(&up->timer);
+	timer_delete_sync(&up->timer);
 	up->timer.function =3D serial8250_timeout;
 	if (port->irq)
 		serial_unlink_irq_chain(up);
diff --git a/drivers/tty/serial/altera_uart.c b/drivers/tty/serial/altera_uar=
t.c
index 1759137121cc..011f38681131 100644
--- a/drivers/tty/serial/altera_uart.c
+++ b/drivers/tty/serial/altera_uart.c
@@ -339,7 +339,7 @@ static void altera_uart_shutdown(struct uart_port *port)
 	if (port->irq)
 		free_irq(port->irq, port);
 	else
-		del_timer_sync(&pp->tmr);
+		timer_delete_sync(&pp->tmr);
 }
=20
 static const char *altera_uart_type(struct uart_port *port)
diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index dc092204b472..11d65097578c 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -1084,7 +1084,7 @@ static void pl011_dma_rx_poll(struct timer_list *t)
=20
 		uap->dmarx.running =3D false;
 		dmaengine_terminate_all(rxchan);
-		del_timer(&uap->dmarx.timer);
+		timer_delete(&uap->dmarx.timer);
 	} else {
 		mod_timer(&uap->dmarx.timer,
 			  jiffies + msecs_to_jiffies(uap->dmarx.poll_rate));
@@ -1199,7 +1199,7 @@ static void pl011_dma_shutdown(struct uart_amba_port *u=
ap)
 		pl011_dmabuf_free(uap->dmarx.chan, &uap->dmarx.dbuf_a, DMA_FROM_DEVICE);
 		pl011_dmabuf_free(uap->dmarx.chan, &uap->dmarx.dbuf_b, DMA_FROM_DEVICE);
 		if (uap->dmarx.poll_rate)
-			del_timer_sync(&uap->dmarx.timer);
+			timer_delete_sync(&uap->dmarx.timer);
 		uap->using_rx_dma =3D false;
 	}
 }
diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_ser=
ial.c
index 8918fbd4bddd..18dba502144d 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -2017,7 +2017,7 @@ static void atmel_shutdown(struct uart_port *port)
 	 * Prevent any tasklets being scheduled during
 	 * cleanup
 	 */
-	del_timer_sync(&atmel_port->uart_timer);
+	timer_delete_sync(&atmel_port->uart_timer);
=20
 	/* Make sure that no interrupt is on the fly */
 	synchronize_irq(port->irq);
diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index 4470966b826c..fe5aed99d55a 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -1433,7 +1433,7 @@ static void lpuart_dma_rx_free(struct uart_port *port)
=20
 	dmaengine_terminate_sync(chan);
 	if (!sport->dma_idle_int)
-		del_timer_sync(&sport->lpuart_timer);
+		timer_delete_sync(&sport->lpuart_timer);
=20
 	dma_unmap_sg(chan->device->dev, &sport->rx_sgl, 1, DMA_FROM_DEVICE);
 	kfree(sport->rx_ring.buf);
@@ -2071,7 +2071,7 @@ lpuart_set_termios(struct uart_port *port, struct kterm=
ios *termios,
 	 * baud rate and restart Rx DMA path.
 	 *
 	 * Since timer function acqures port->lock, need to stop before
-	 * acquring same lock because otherwise del_timer_sync() can deadlock.
+	 * acquring same lock because otherwise timer_delete_sync() can deadlock.
 	 */
 	if (old && sport->lpuart_dma_rx_use)
 		lpuart_dma_rx_free(port);
@@ -2316,7 +2316,7 @@ lpuart32_set_termios(struct uart_port *port, struct kte=
rmios *termios,
 	 * baud rate and restart Rx DMA path.
 	 *
 	 * Since timer function acqures port->lock, need to stop before
-	 * acquring same lock because otherwise del_timer_sync() can deadlock.
+	 * acquring same lock because otherwise timer_delete_sync() can deadlock.
 	 */
 	if (old && sport->lpuart_dma_rx_use)
 		lpuart_dma_rx_free(port);
diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 19c819705bf9..e4b6f1bfdc95 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -1619,7 +1619,7 @@ static void imx_uart_shutdown(struct uart_port *port)
 	/*
 	 * Stop our timer.
 	 */
-	del_timer_sync(&sport->timer);
+	timer_delete_sync(&sport->timer);
=20
 	/*
 	 * Disable all interrupts, port and break condition.
@@ -1752,7 +1752,7 @@ imx_uart_set_termios(struct uart_port *port, struct kte=
rmios *termios,
 		old_csize =3D CS8;
 	}
=20
-	del_timer_sync(&sport->timer);
+	timer_delete_sync(&sport->timer);
=20
 	/*
 	 * Ask the core to calculate the divisor for us.
diff --git a/drivers/tty/serial/liteuart.c b/drivers/tty/serial/liteuart.c
index 6c13cf1ab646..3a0960c97c77 100644
--- a/drivers/tty/serial/liteuart.c
+++ b/drivers/tty/serial/liteuart.c
@@ -96,7 +96,7 @@ static void liteuart_stop_rx(struct uart_port *port)
 	struct liteuart_port *uart =3D to_liteuart_port(port);
=20
 	/* just delete timer */
-	del_timer(&uart->timer);
+	timer_delete(&uart->timer);
 }
=20
 static void liteuart_rx_chars(struct uart_port *port)
@@ -220,7 +220,7 @@ static void liteuart_shutdown(struct uart_port *port)
 	if (port->irq)
 		free_irq(port->irq, port);
 	else
-		del_timer_sync(&uart->timer);
+		timer_delete_sync(&uart->timer);
 }
=20
 static void liteuart_set_termios(struct uart_port *port, struct ktermios *ne=
w,
diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index cde5f1c86353..f2dd83692b2c 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -506,7 +506,7 @@ max3100_set_termios(struct uart_port *port, struct ktermi=
os *termios,
 			MAX3100_STATUS_PE | MAX3100_STATUS_FE |
 			MAX3100_STATUS_OE;
=20
-	del_timer_sync(&s->timer);
+	timer_delete_sync(&s->timer);
 	uart_update_timeout(port, termios->c_cflag, baud);
=20
 	spin_lock(&s->conf_lock);
@@ -532,7 +532,7 @@ static void max3100_shutdown(struct uart_port *port)
=20
 	s->force_end_work =3D 1;
=20
-	del_timer_sync(&s->timer);
+	timer_delete_sync(&s->timer);
=20
 	if (s->workqueue) {
 		destroy_workqueue(s->workqueue);
diff --git a/drivers/tty/serial/mux.c b/drivers/tty/serial/mux.c
index 85ce1e9af44a..b417faead20f 100644
--- a/drivers/tty/serial/mux.c
+++ b/drivers/tty/serial/mux.c
@@ -563,7 +563,7 @@ static void __exit mux_exit(void)
 {
 	/* Delete the Mux timer. */
 	if(port_cnt > 0) {
-		del_timer_sync(&mux_timer);
+		timer_delete_sync(&mux_timer);
 #ifdef CONFIG_SERIAL_MUX_CONSOLE
 		unregister_console(&mux_console);
 #endif
diff --git a/drivers/tty/serial/sa1100.c b/drivers/tty/serial/sa1100.c
index 3c34027687d2..8587ebbe1073 100644
--- a/drivers/tty/serial/sa1100.c
+++ b/drivers/tty/serial/sa1100.c
@@ -369,7 +369,7 @@ static void sa1100_shutdown(struct uart_port *port)
 	/*
 	 * Stop our timer.
 	 */
-	del_timer_sync(&sport->timer);
+	timer_delete_sync(&sport->timer);
=20
 	/*
 	 * Free the interrupt
@@ -421,7 +421,7 @@ sa1100_set_termios(struct uart_port *port, struct ktermio=
s *termios,
 	baud =3D uart_get_baud_rate(port, termios, old, 0, port->uartclk/16);=20
 	quot =3D uart_get_divisor(port, baud);
=20
-	del_timer_sync(&sport->timer);
+	timer_delete_sync(&sport->timer);
=20
 	uart_port_lock_irqsave(&sport->port, &flags);
=20
diff --git a/drivers/tty/serial/sccnxp.c b/drivers/tty/serial/sccnxp.c
index 4c851dae6624..553e3c1321ca 100644
--- a/drivers/tty/serial/sccnxp.c
+++ b/drivers/tty/serial/sccnxp.c
@@ -1033,7 +1033,7 @@ static void sccnxp_remove(struct platform_device *pdev)
 	if (!s->poll)
 		devm_free_irq(&pdev->dev, s->irq, s);
 	else
-		del_timer_sync(&s->timer);
+		timer_delete_sync(&s->timer);
=20
 	for (i =3D 0; i < s->uart.nr; i++)
 		uart_remove_one_port(&s->uart, &s->port[i]);
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 1c8480d0338e..7e7813ccda41 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2337,7 +2337,7 @@ static void sci_shutdown(struct uart_port *port)
 #endif
=20
 	if (s->rx_trigger > 1 && s->rx_fifo_timeout > 0)
-		del_timer_sync(&s->rx_fifo_timer);
+		timer_delete_sync(&s->rx_fifo_timer);
 	sci_free_irq(s);
 	sci_free_dma(port);
 }
diff --git a/drivers/tty/synclink_gt.c b/drivers/tty/synclink_gt.c
index bd8d92ee7c53..4c703f42680d 100644
--- a/drivers/tty/synclink_gt.c
+++ b/drivers/tty/synclink_gt.c
@@ -2220,7 +2220,7 @@ static void isr_txeom(struct slgt_info *info, unsigned =
short status)
 		}
 		info->tx_active =3D false;
=20
-		del_timer(&info->tx_timer);
+		timer_delete(&info->tx_timer);
=20
 		if (info->params.mode !=3D MGSL_MODE_ASYNC && info->drop_rts_on_tx_done) {
 			info->signals &=3D ~SerialSignal_RTS;
@@ -2375,8 +2375,8 @@ static void shutdown(struct slgt_info *info)
 	wake_up_interruptible(&info->status_event_wait_q);
 	wake_up_interruptible(&info->event_wait_q);
=20
-	del_timer_sync(&info->tx_timer);
-	del_timer_sync(&info->rx_timer);
+	timer_delete_sync(&info->tx_timer);
+	timer_delete_sync(&info->rx_timer);
=20
 	kfree(info->tx_buf);
 	info->tx_buf =3D NULL;
@@ -3955,7 +3955,7 @@ static void tx_stop(struct slgt_info *info)
 {
 	unsigned short val;
=20
-	del_timer(&info->tx_timer);
+	timer_delete(&info->tx_timer);
=20
 	tdma_reset(info);
=20
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index f85ce02e4725..6853c4660e7c 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -743,7 +743,7 @@ static void sysrq_detect_reset_sequence(struct sysrq_stat=
e *state,
 		 */
 		if (value && state->reset_seq_cnt) {
 			state->reset_canceled =3D true;
-			del_timer(&state->keyreset_timer);
+			timer_delete(&state->keyreset_timer);
 		}
 	} else if (value =3D=3D 0) {
 		/*
@@ -751,7 +751,7 @@ static void sysrq_detect_reset_sequence(struct sysrq_stat=
e *state,
 		 * to be pressed and held for the reset timeout
 		 * to hold.
 		 */
-		del_timer(&state->keyreset_timer);
+		timer_delete(&state->keyreset_timer);
=20
 		if (--state->reset_seq_cnt =3D=3D 0)
 			state->reset_canceled =3D false;
diff --git a/drivers/tty/vcc.c b/drivers/tty/vcc.c
index 5b625f20233b..7ac3048377d5 100644
--- a/drivers/tty/vcc.c
+++ b/drivers/tty/vcc.c
@@ -683,8 +683,8 @@ static void vcc_remove(struct vio_dev *vdev)
 {
 	struct vcc_port *port =3D dev_get_drvdata(&vdev->dev);
=20
-	del_timer_sync(&port->rx_timer);
-	del_timer_sync(&port->tx_timer);
+	timer_delete_sync(&port->rx_timer);
+	timer_delete_sync(&port->tx_timer);
=20
 	/* If there's a process with the device open, do a synchronous
 	 * hangup of the TTY. This *may* cause the process to call close
@@ -700,7 +700,7 @@ static void vcc_remove(struct vio_dev *vdev)
=20
 	tty_unregister_device(vcc_tty_driver, port->index);
=20
-	del_timer_sync(&port->vio.timer);
+	timer_delete_sync(&port->vio.timer);
 	vio_ldc_free(&port->vio);
 	sysfs_remove_group(&vdev->dev.kobj, &vcc_attribute_group);
 	dev_set_drvdata(&vdev->dev, NULL);
diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
index 804355da46f5..ae92e6a50a65 100644
--- a/drivers/tty/vt/keyboard.c
+++ b/drivers/tty/vt/keyboard.c
@@ -275,7 +275,7 @@ static DEFINE_TIMER(kd_mksound_timer, kd_nosound);
=20
 void kd_mksound(unsigned int hz, unsigned int ticks)
 {
-	del_timer_sync(&kd_mksound_timer);
+	timer_delete_sync(&kd_mksound_timer);
=20
 	input_handler_for_each_handle(&kbd_handler, &hz, kd_sound_helper);
=20
diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index be5564ed8c01..f5642b3038e4 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4501,7 +4501,7 @@ void do_blank_screen(int entering_gfx)
 	}
=20
 	hide_cursor(vc);
-	del_timer_sync(&console_timer);
+	timer_delete_sync(&console_timer);
 	blank_timer_expired =3D 0;
=20
 	save_screen(vc);
@@ -4606,7 +4606,7 @@ void poke_blanked_console(void)
 	/* This isn't perfectly race free, but a race here would be mostly harmless,
 	 * at worst, we'll do a spurious blank and it's unlikely
 	 */
-	del_timer(&console_timer);
+	timer_delete(&console_timer);
 	blank_timer_expired =3D 0;
=20
 	if (ignore_poke || !vc_cons[fg_console].d || vc_cons[fg_console].d->vc_mode=
 =3D=3D KD_GRAPHICS)
diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index 47d06af33747..c6b9ad12e8fe 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -597,7 +597,7 @@ static int cxacru_start_wait_urb(struct urb *urb, struct =
completion *done,
 	timer_setup_on_stack(&timer.timer, cxacru_timeout_kill, 0);
 	mod_timer(&timer.timer, jiffies + msecs_to_jiffies(CMD_TIMEOUT));
 	wait_for_completion(done);
-	del_timer_sync(&timer.timer);
+	timer_delete_sync(&timer.timer);
 	destroy_timer_on_stack(&timer.timer);
=20
 	if (actual_length)
diff --git a/drivers/usb/atm/speedtch.c b/drivers/usb/atm/speedtch.c
index 973548b5c15c..27e3d35ee7dd 100644
--- a/drivers/usb/atm/speedtch.c
+++ b/drivers/usb/atm/speedtch.c
@@ -612,7 +612,7 @@ static void speedtch_handle_int(struct urb *int_urb)
 	}
=20
 	if ((count =3D=3D 6) && !memcmp(up_int, instance->int_data, 6)) {
-		del_timer(&instance->status_check_timer);
+		timer_delete(&instance->status_check_timer);
 		atm_info(usbatm, "DSL line goes up\n");
 	} else if ((count =3D=3D 6) && !memcmp(down_int, instance->int_data, 6)) {
 		atm_info(usbatm, "DSL line goes down\n");
@@ -688,7 +688,7 @@ static void speedtch_atm_stop(struct usbatm_data *usbatm,=
 struct atm_dev *atm_de
=20
 	atm_dbg(usbatm, "%s entered\n", __func__);
=20
-	del_timer_sync(&instance->status_check_timer);
+	timer_delete_sync(&instance->status_check_timer);
=20
 	/*
 	 * Since resubmit_timer and int_urb can schedule themselves and
@@ -697,14 +697,14 @@ static void speedtch_atm_stop(struct usbatm_data *usbat=
m, struct atm_dev *atm_de
 	instance->int_urb =3D NULL; /* signal shutdown */
 	mb();
 	usb_kill_urb(int_urb);
-	del_timer_sync(&instance->resubmit_timer);
+	timer_delete_sync(&instance->resubmit_timer);
 	/*
 	 * At this point, speedtch_handle_int and speedtch_resubmit_int
 	 * can run or be running, but instance->int_urb =3D=3D NULL means that
 	 * they will not reschedule
 	 */
 	usb_kill_urb(int_urb);
-	del_timer_sync(&instance->resubmit_timer);
+	timer_delete_sync(&instance->resubmit_timer);
 	usb_free_urb(int_urb);
=20
 	flush_work(&instance->status_check_work);
diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index d1e622bb1406..a6a05e85ef8c 100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -1237,8 +1237,8 @@ void usbatm_usb_disconnect(struct usb_interface *intf)
 	for (i =3D 0; i < num_rcv_urbs + num_snd_urbs; i++)
 		usb_kill_urb(instance->urbs[i]);
=20
-	del_timer_sync(&instance->rx_channel.delay);
-	del_timer_sync(&instance->tx_channel.delay);
+	timer_delete_sync(&instance->rx_channel.delay);
+	timer_delete_sync(&instance->tx_channel.delay);
=20
 	/* turn usbatm_[rt]x_process into something close to a no-op */
 	/* no need to take the spinlock */
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 46026b331267..a63c793bac21 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -842,7 +842,7 @@ static int usb_rh_urb_dequeue(struct usb_hcd *hcd, struct=
 urb *urb, int status)
=20
 	} else {				/* Status URB */
 		if (!hcd->uses_new_polling)
-			del_timer (&hcd->rh_timer);
+			timer_delete(&hcd->rh_timer);
 		if (urb =3D=3D hcd->status_urb) {
 			hcd->status_urb =3D NULL;
 			usb_hcd_unlink_urb_from_ep(hcd, urb);
@@ -2768,14 +2768,14 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
 {
 	hcd->rh_pollable =3D 0;
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
-	del_timer_sync(&hcd->rh_timer);
+	timer_delete_sync(&hcd->rh_timer);
=20
 	hcd->driver->stop(hcd);
 	hcd->state =3D HC_STATE_HALT;
=20
 	/* In case the HCD restarted the timer, stop it again. */
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
-	del_timer_sync(&hcd->rh_timer);
+	timer_delete_sync(&hcd->rh_timer);
 }
=20
 /**
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 8c7f9cc785bb..0e1dd6ef60a7 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1385,7 +1385,7 @@ static void hub_quiesce(struct usb_hub *hub, enum hub_q=
uiescing_type type)
 	}
=20
 	/* Stop hub_wq and related activity */
-	del_timer_sync(&hub->irq_urb_retry);
+	timer_delete_sync(&hub->irq_urb_retry);
 	usb_kill_urb(hub->urb);
 	if (hub->has_indicators)
 		cancel_delayed_work_sync(&hub->leds);
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 869245238d6c..60ef8092259a 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5081,7 +5081,7 @@ static void dwc2_hcd_free(struct dwc2_hsotg *hsotg)
=20
 	cancel_work_sync(&hsotg->phy_reset_work);
=20
-	del_timer(&hsotg->wkp_timer);
+	timer_delete(&hsotg->wkp_timer);
 }
=20
 static void dwc2_hcd_release(struct dwc2_hsotg *hsotg)
diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index 2a542a99ec44..b0098792dd22 100644
--- a/drivers/usb/dwc2/hcd_queue.c
+++ b/drivers/usb/dwc2/hcd_queue.c
@@ -1302,7 +1302,7 @@ static int dwc2_schedule_periodic(struct dwc2_hsotg *hs=
otg, struct dwc2_qh *qh)
 	}
=20
 	/* Cancel pending unreserve; if canceled OK, unreserve was pending */
-	if (del_timer(&qh->unreserve_timer))
+	if (timer_delete(&qh->unreserve_timer))
 		WARN_ON(!qh->unreserve_pending);
=20
 	/*
@@ -1614,7 +1614,7 @@ struct dwc2_qh *dwc2_hcd_qh_create(struct dwc2_hsotg *h=
sotg,
 void dwc2_hcd_qh_free(struct dwc2_hsotg *hsotg, struct dwc2_qh *qh)
 {
 	/* Make sure any unreserve work is finished. */
-	if (del_timer_sync(&qh->unreserve_timer)) {
+	if (timer_delete_sync(&qh->unreserve_timer)) {
 		unsigned long flags;
=20
 		spin_lock_irqsave(&hsotg->lock, flags);
diff --git a/drivers/usb/gadget/legacy/zero.c b/drivers/usb/gadget/legacy/zer=
o.c
index e25e0d8dd387..a05785bdeb30 100644
--- a/drivers/usb/gadget/legacy/zero.c
+++ b/drivers/usb/gadget/legacy/zero.c
@@ -194,7 +194,7 @@ static void zero_suspend(struct usb_composite_dev *cdev)
 static void zero_resume(struct usb_composite_dev *cdev)
 {
 	DBG(cdev, "%s\n", __func__);
-	del_timer(&autoresume_timer);
+	timer_delete(&autoresume_timer);
 }
=20
 /*-------------------------------------------------------------------------*/
@@ -398,7 +398,7 @@ static int zero_bind(struct usb_composite_dev *cdev)
=20
 static int zero_unbind(struct usb_composite_dev *cdev)
 {
-	del_timer_sync(&autoresume_timer);
+	timer_delete_sync(&autoresume_timer);
 	if (!IS_ERR_OR_NULL(func_ss))
 		usb_put_function(func_ss);
 	usb_put_function_instance(func_inst_ss);
diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_=
udc.c
index 8902abe3ca76..c93ea210c17c 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -252,7 +252,7 @@ static int omap_ep_disable(struct usb_ep *_ep)
 	ep->has_dma =3D 0;
 	omap_writew(UDC_SET_HALT, UDC_CTRL);
 	list_del_init(&ep->iso);
-	del_timer(&ep->timer);
+	timer_delete(&ep->timer);
=20
 	spin_unlock_irqrestore(&ep->udc->lock, flags);
=20
diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa=
25x_udc.c
index 1e9998024aaa..24eb1ae78e45 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -1503,7 +1503,7 @@ reset_gadget(struct pxa25x_udc *dev, struct usb_gadget_=
driver *driver)
 		ep->stopped =3D 1;
 		nuke(ep, -ESHUTDOWN);
 	}
-	del_timer_sync(&dev->timer);
+	timer_delete_sync(&dev->timer);
=20
 	/* report reset; the driver is already quiesced */
 	if (driver)
@@ -1530,7 +1530,7 @@ stop_activity(struct pxa25x_udc *dev, struct usb_gadget=
_driver *driver)
 		ep->stopped =3D 1;
 		nuke(ep, -ESHUTDOWN);
 	}
-	del_timer_sync(&dev->timer);
+	timer_delete_sync(&dev->timer);
=20
 	/* report disconnect; the driver is already quiesced */
 	if (driver)
@@ -1607,14 +1607,14 @@ static void handle_ep0 (struct pxa25x_udc *dev)
 	if (udccs0 & UDCCS0_SST) {
 		nuke(ep, -EPIPE);
 		udc_ep0_set_UDCCS(dev, UDCCS0_SST);
-		del_timer(&dev->timer);
+		timer_delete(&dev->timer);
 		ep0_idle(dev);
 	}
=20
 	/* previous request unfinished?  non-error iff back-to-back ... */
 	if ((udccs0 & UDCCS0_SA) !=3D 0 && dev->ep0state !=3D EP0_IDLE) {
 		nuke(ep, 0);
-		del_timer(&dev->timer);
+		timer_delete(&dev->timer);
 		ep0_idle(dev);
 	}
=20
diff --git a/drivers/usb/gadget/udc/r8a66597-udc.c b/drivers/usb/gadget/udc/r=
8a66597-udc.c
index ff6f846b1d41..6c1d15b2250c 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.c
+++ b/drivers/usb/gadget/udc/r8a66597-udc.c
@@ -1810,7 +1810,7 @@ static void r8a66597_remove(struct platform_device *pde=
v)
 	struct r8a66597		*r8a66597 =3D platform_get_drvdata(pdev);
=20
 	usb_del_gadget_udc(&r8a66597->gadget);
-	del_timer_sync(&r8a66597->timer);
+	timer_delete_sync(&r8a66597->timer);
 	r8a66597_free_request(&r8a66597->ep[0].ep, r8a66597->ep0_req);
=20
 	if (r8a66597->pdata->on_chip) {
diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/=
snps_udc_core.c
index 1f8a99d2a643..373942ceb076 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -3035,12 +3035,12 @@ void udc_remove(struct udc *dev)
 	stop_timer++;
 	if (timer_pending(&udc_timer))
 		wait_for_completion(&on_exit);
-	del_timer_sync(&udc_timer);
+	timer_delete_sync(&udc_timer);
 	/* remove pollstall timer */
 	stop_pollstall_timer++;
 	if (timer_pending(&udc_pollstall_timer))
 		wait_for_completion(&on_pollstall_exit);
-	del_timer_sync(&udc_pollstall_timer);
+	timer_delete_sync(&udc_pollstall_timer);
 	udc =3D NULL;
 }
 EXPORT_SYMBOL_GPL(udc_remove);
diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platfor=
m.c
index cdf41886e8ca..150d2542cef0 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -224,7 +224,7 @@ static void quirk_poll_init(struct ehci_platform_priv *pr=
iv)
=20
 static void quirk_poll_end(struct ehci_platform_priv *priv)
 {
-	del_timer_sync(&priv->poll_timer);
+	timer_delete_sync(&priv->poll_timer);
 	cancel_delayed_work(&priv->poll_work);
 }
=20
diff --git a/drivers/usb/host/isp1362-hcd.c b/drivers/usb/host/isp1362-hcd.c
index 2d3a082cb52f..954fc5ad565b 100644
--- a/drivers/usb/host/isp1362-hcd.c
+++ b/drivers/usb/host/isp1362-hcd.c
@@ -2357,7 +2357,7 @@ static void isp1362_hc_stop(struct usb_hcd *hcd)
=20
 	pr_debug("%s:\n", __func__);
=20
-	del_timer_sync(&hcd->rh_timer);
+	timer_delete_sync(&hcd->rh_timer);
=20
 	spin_lock_irqsave(&isp1362_hcd->lock, flags);
=20
diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index 9b24181fee60..c7784bf8101d 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -1003,7 +1003,7 @@ static void ohci_stop (struct usb_hcd *hcd)
=20
 	if (quirk_nec(ohci))
 		flush_work(&ohci->nec_work);
-	del_timer_sync(&ohci->io_watchdog);
+	timer_delete_sync(&ohci->io_watchdog);
 	ohci->prev_frame_no =3D IO_WATCHDOG_OFF;
=20
 	ohci_writel (ohci, OHCI_INTR_MIE, &ohci->regs->intrdisable);
diff --git a/drivers/usb/host/ohci-hub.c b/drivers/usb/host/ohci-hub.c
index 90cee192e96d..b3d734ab6201 100644
--- a/drivers/usb/host/ohci-hub.c
+++ b/drivers/usb/host/ohci-hub.c
@@ -315,7 +315,7 @@ static int ohci_bus_suspend (struct usb_hcd *hcd)
 	spin_unlock_irq (&ohci->lock);
=20
 	if (rc =3D=3D 0) {
-		del_timer_sync(&ohci->io_watchdog);
+		timer_delete_sync(&ohci->io_watchdog);
 		ohci->prev_frame_no =3D IO_WATCHDOG_OFF;
 	}
 	return rc;
diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index fce800ba4c61..d75b1b9b4db0 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -1127,7 +1127,7 @@ static void ehci_mem_cleanup(struct oxu_hcd *oxu)
 		qh_put(oxu->async);
 	oxu->async =3D NULL;
=20
-	del_timer(&oxu->urb_timer);
+	timer_delete(&oxu->urb_timer);
=20
 	oxu->periodic =3D NULL;
=20
@@ -3154,7 +3154,7 @@ static void oxu_stop(struct usb_hcd *hcd)
 	ehci_port_power(oxu, 0);
=20
 	/* no more interrupts ... */
-	del_timer_sync(&oxu->watchdog);
+	timer_delete_sync(&oxu->watchdog);
=20
 	spin_lock_irq(&oxu->lock);
 	if (HC_IS_RUNNING(hcd->state))
@@ -3887,7 +3887,7 @@ static int oxu_bus_suspend(struct usb_hcd *hcd)
=20
 	spin_unlock_irq(&oxu->lock);
 	/* turn off now-idle HC */
-	del_timer_sync(&oxu->watchdog);
+	timer_delete_sync(&oxu->watchdog);
 	spin_lock_irq(&oxu->lock);
 	ehci_halt(oxu);
 	hcd->state =3D HC_STATE_SUSPENDED;
diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index a44992e2561b..67e472116d11 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -2384,7 +2384,7 @@ static void r8a66597_remove(struct platform_device *pde=
v)
 	struct r8a66597		*r8a66597 =3D platform_get_drvdata(pdev);
 	struct usb_hcd		*hcd =3D r8a66597_to_hcd(r8a66597);
=20
-	del_timer_sync(&r8a66597->rh_timer);
+	timer_delete_sync(&r8a66597->rh_timer);
 	usb_remove_hcd(hcd);
 	iounmap(r8a66597->reg);
 	if (r8a66597->pdata->on_chip)
diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index fa2e4badd288..718b1b7fe366 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1515,7 +1515,7 @@ sl811h_stop(struct usb_hcd *hcd)
 	struct sl811	*sl811 =3D hcd_to_sl811(hcd);
 	unsigned long	flags;
=20
-	del_timer_sync(&hcd->rh_timer);
+	timer_delete_sync(&hcd->rh_timer);
=20
 	spin_lock_irqsave(&sl811->lock, flags);
 	port_power(sl811, 0);
diff --git a/drivers/usb/host/uhci-hcd.c b/drivers/usb/host/uhci-hcd.c
index fd2408b553cf..14e6dfef16c6 100644
--- a/drivers/usb/host/uhci-hcd.c
+++ b/drivers/usb/host/uhci-hcd.c
@@ -716,7 +716,7 @@ static void uhci_stop(struct usb_hcd *hcd)
 	spin_unlock_irq(&uhci->lock);
 	synchronize_irq(hcd->irq);
=20
-	del_timer_sync(&uhci->fsbr_timer);
+	timer_delete_sync(&uhci->fsbr_timer);
 	release_uhci(uhci);
 }
=20
diff --git a/drivers/usb/host/uhci-q.c b/drivers/usb/host/uhci-q.c
index 35fcb826152c..45a8256a665f 100644
--- a/drivers/usb/host/uhci-q.c
+++ b/drivers/usb/host/uhci-q.c
@@ -84,7 +84,7 @@ static void uhci_urbp_wants_fsbr(struct uhci_hcd *uhci, str=
uct urb_priv *urbp)
 			uhci_fsbr_on(uhci);
 		else if (uhci->fsbr_expiring) {
 			uhci->fsbr_expiring =3D 0;
-			del_timer(&uhci->fsbr_timer);
+			timer_delete(&uhci->fsbr_timer);
 		}
 	}
 }
diff --git a/drivers/usb/host/xen-hcd.c b/drivers/usb/host/xen-hcd.c
index 46fdab940092..05943f2213e4 100644
--- a/drivers/usb/host/xen-hcd.c
+++ b/drivers/usb/host/xen-hcd.c
@@ -327,7 +327,7 @@ static int xenhcd_bus_suspend(struct usb_hcd *hcd)
 	}
 	spin_unlock_irq(&info->lock);
=20
-	del_timer_sync(&info->watchdog);
+	timer_delete_sync(&info->watchdog);
=20
 	return ret;
 }
@@ -1307,7 +1307,7 @@ static void xenhcd_stop(struct usb_hcd *hcd)
 {
 	struct xenhcd_info *info =3D xenhcd_hcd_to_info(hcd);
=20
-	del_timer_sync(&info->watchdog);
+	timer_delete_sync(&info->watchdog);
 	spin_lock_irq(&info->lock);
 	/* cancel all urbs */
 	hcd->state =3D HC_STATE_HALT;
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 69c278b64084..c0f226584a40 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -926,7 +926,7 @@ static void xhci_del_comp_mod_timer(struct xhci_hcd *xhci=
, u32 status,
 	if ((xhci->port_status_u0 !=3D all_ports_seen_u0) && port_in_u0) {
 		xhci->port_status_u0 |=3D 1 << wIndex;
 		if (xhci->port_status_u0 =3D=3D all_ports_seen_u0) {
-			del_timer_sync(&xhci->comp_mode_recovery_timer);
+			timer_delete_sync(&xhci->comp_mode_recovery_timer);
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"All USB3 ports have entered U0 already!");
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 904831344440..208558cf822d 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -746,10 +746,10 @@ static int __maybe_unused xhci_mtk_suspend(struct devic=
e *dev)
=20
 	xhci_dbg(xhci, "%s: stop port polling\n", __func__);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
-	del_timer_sync(&hcd->rh_timer);
+	timer_delete_sync(&hcd->rh_timer);
 	if (shared_hcd) {
 		clear_bit(HCD_FLAG_POLL_RH, &shared_hcd->flags);
-		del_timer_sync(&shared_hcd->rh_timer);
+		timer_delete_sync(&shared_hcd->rh_timer);
 	}
=20
 	ret =3D xhci_mtk_host_disable(mtk);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 83a4adf57bae..0452b8d65832 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -627,7 +627,7 @@ void xhci_stop(struct usb_hcd *hcd)
 	/* Deleting Compliance Mode Recovery Timer */
 	if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 			(!(xhci_all_ports_seen_u0(xhci)))) {
-		del_timer_sync(&xhci->comp_mode_recovery_timer);
+		timer_delete_sync(&xhci->comp_mode_recovery_timer);
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"%s: compliance mode recovery timer deleted",
 				__func__);
@@ -672,11 +672,11 @@ void xhci_shutdown(struct usb_hcd *hcd)
 	xhci_dbg(xhci, "%s: stopping usb%d port polling.\n",
 			__func__, hcd->self.busnum);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
-	del_timer_sync(&hcd->rh_timer);
+	timer_delete_sync(&hcd->rh_timer);
=20
 	if (xhci->shared_hcd) {
 		clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-		del_timer_sync(&xhci->shared_hcd->rh_timer);
+		timer_delete_sync(&xhci->shared_hcd->rh_timer);
 	}
=20
 	spin_lock_irq(&xhci->lock);
@@ -908,10 +908,10 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 	xhci_dbg(xhci, "%s: stopping usb%d port polling.\n",
 		 __func__, hcd->self.busnum);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
-	del_timer_sync(&hcd->rh_timer);
+	timer_delete_sync(&hcd->rh_timer);
 	if (xhci->shared_hcd) {
 		clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-		del_timer_sync(&xhci->shared_hcd->rh_timer);
+		timer_delete_sync(&xhci->shared_hcd->rh_timer);
 	}
=20
 	if (xhci->quirks & XHCI_SUSPEND_DELAY)
@@ -978,7 +978,7 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 	 */
 	if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 			(!(xhci_all_ports_seen_u0(xhci)))) {
-		del_timer_sync(&xhci->comp_mode_recovery_timer);
+		timer_delete_sync(&xhci->comp_mode_recovery_timer);
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"%s: compliance mode recovery timer deleted",
 				__func__);
@@ -1071,7 +1071,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost,=
 bool is_auto_resume)
 	if (power_lost) {
 		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 				!(xhci_all_ports_seen_u0(xhci))) {
-			del_timer_sync(&xhci->comp_mode_recovery_timer);
+			timer_delete_sync(&xhci->comp_mode_recovery_timer);
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"Compliance Mode Recovery Timer deleted!");
 		}
diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-=
hcd.c
index add2d2e3b61b..8dcd9cc22413 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -2458,7 +2458,7 @@ static void isp1760_stop(struct usb_hcd *hcd)
 {
 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
=20
-	del_timer(&errata2_timer);
+	timer_delete(&errata2_timer);
=20
 	isp1760_hub_control(hcd, ClearPortFeature, USB_PORT_FEAT_POWER,	1,
 			NULL, 0);
diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-=
udc.c
index 5cafd23345ca..2af89ee28baa 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -1145,7 +1145,7 @@ static void isp1760_udc_disconnect(struct isp1760_udc *=
udc)
 	if (udc->driver->disconnect)
 		udc->driver->disconnect(&udc->gadget);
=20
-	del_timer(&udc->vbus_timer);
+	timer_delete(&udc->vbus_timer);
=20
 	/* TODO Reset all endpoints ? */
 }
@@ -1314,7 +1314,7 @@ static int isp1760_udc_stop(struct usb_gadget *gadget)
=20
 	dev_dbg(udc->isp->dev, "%s\n", __func__);
=20
-	del_timer_sync(&udc->vbus_timer);
+	timer_delete_sync(&udc->vbus_timer);
=20
 	isp1760_reg_write(udc->regs, mode_reg, 0);
=20
diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 8d379ae835bc..853a5f082a70 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -626,7 +626,7 @@ static int perform_sglist(
 		mod_timer(&timeout.timer, jiffies +
 				msecs_to_jiffies(SIMPLE_IO_TIMEOUT));
 		usb_sg_wait(req);
-		if (!del_timer_sync(&timeout.timer))
+		if (!timer_delete_sync(&timeout.timer))
 			retval =3D -ETIMEDOUT;
 		else
 			retval =3D req->status;
diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index 26fd71a5f9b2..eebb24ab3ec8 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -204,7 +204,7 @@ static void __maybe_unused da8xx_musb_try_idle(struct mus=
b *musb, unsigned long
 				musb->xceiv->otg->state =3D=3D OTG_STATE_A_WAIT_BCON)) {
 		dev_dbg(musb->controller, "%s active, deleting timer\n",
 			usb_otg_state_string(musb->xceiv->otg->state));
-		del_timer(&musb->dev_timer);
+		timer_delete(&musb->dev_timer);
 		last_timer =3D jiffies;
 		return;
 	}
@@ -290,7 +290,7 @@ static irqreturn_t da8xx_musb_interrupt(int irq, void *hc=
i)
 			MUSB_HST_MODE(musb);
 			musb->xceiv->otg->state =3D OTG_STATE_A_WAIT_VRISE;
 			portstate(musb->port1_status |=3D USB_PORT_STAT_POWER);
-			del_timer(&musb->dev_timer);
+			timer_delete(&musb->dev_timer);
 		} else if (!(musb->int_usb & MUSB_INTR_BABBLE)) {
 			/*
 			 * When babble condition happens, drvvbus interrupt
@@ -419,7 +419,7 @@ static int da8xx_musb_exit(struct musb *musb)
 {
 	struct da8xx_glue *glue =3D dev_get_drvdata(musb->controller->parent);
=20
-	del_timer_sync(&musb->dev_timer);
+	timer_delete_sync(&musb->dev_timer);
=20
 	phy_power_off(glue->phy);
 	phy_exit(glue->phy);
diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 71e4271cba75..020348a98514 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -165,7 +165,7 @@ static void __maybe_unused mpfs_musb_try_idle(struct musb=
 *musb, unsigned long t
 				musb->xceiv->otg->state =3D=3D OTG_STATE_A_WAIT_BCON)) {
 		dev_dbg(musb->controller, "%s active, deleting timer\n",
 			usb_otg_state_string(musb->xceiv->otg->state));
-		del_timer(&musb->dev_timer);
+		timer_delete(&musb->dev_timer);
 		last_timer =3D jiffies;
 		return;
 	}
@@ -232,7 +232,7 @@ static int mpfs_musb_init(struct musb *musb)
=20
 static int mpfs_musb_exit(struct musb *musb)
 {
-	del_timer_sync(&musb->dev_timer);
+	timer_delete_sync(&musb->dev_timer);
=20
 	return 0;
 }
diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 96fa700eaed1..cbbb27178024 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -921,7 +921,7 @@ static void musb_handle_intr_connect(struct musb *musb, u=
8 devctl, u8 int_usb)
 		musb_set_state(musb, OTG_STATE_B_HOST);
 		if (musb->hcd)
 			musb->hcd->self.is_b_host =3D 1;
-		del_timer(&musb->otg_timer);
+		timer_delete(&musb->otg_timer);
 		break;
 	default:
 		if ((devctl & MUSB_DEVCTL_VBUS)
@@ -1015,7 +1015,7 @@ static void musb_handle_intr_reset(struct musb *musb)
 				+ msecs_to_jiffies(TA_WAIT_BCON(musb)));
 			break;
 		case OTG_STATE_A_PERIPHERAL:
-			del_timer(&musb->otg_timer);
+			timer_delete(&musb->otg_timer);
 			musb_g_reset(musb);
 			break;
 		case OTG_STATE_B_WAIT_ACON:
diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index f877faf5a930..e5e813f97fac 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -201,7 +201,7 @@ static void dsps_musb_disable(struct musb *musb)
 	musb_writel(reg_base, wrp->coreintr_clear, wrp->usb_bitmap);
 	musb_writel(reg_base, wrp->epintr_clear,
 			 wrp->txep_bitmap | wrp->rxep_bitmap);
-	del_timer_sync(&musb->dev_timer);
+	timer_delete_sync(&musb->dev_timer);
 }
=20
 /* Caller must take musb->lock */
@@ -215,7 +215,7 @@ static int dsps_check_status(struct musb *musb, void *unu=
sed)
 	int skip_session =3D 0;
=20
 	if (glue->vbus_irq)
-		del_timer(&musb->dev_timer);
+		timer_delete(&musb->dev_timer);
=20
 	/*
 	 * We poll because DSPS IP's won't expose several OTG-critical
@@ -499,7 +499,7 @@ static int dsps_musb_exit(struct musb *musb)
 	struct device *dev =3D musb->controller;
 	struct dsps_glue *glue =3D dev_get_drvdata(dev->parent);
=20
-	del_timer_sync(&musb->dev_timer);
+	timer_delete_sync(&musb->dev_timer);
 	phy_power_off(musb->phy);
 	phy_exit(musb->phy);
 	debugfs_remove_recursive(glue->dbgfs_root);
@@ -983,7 +983,7 @@ static int dsps_suspend(struct device *dev)
 		return ret;
 	}
=20
-	del_timer_sync(&musb->dev_timer);
+	timer_delete_sync(&musb->dev_timer);
=20
 	mbase =3D musb->ctrl_base;
 	glue->context.control =3D musb_readl(mbase, wrp->control);
diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index 90b760a95e4e..abd2472da7f7 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -525,7 +525,7 @@ static void tusb_musb_try_idle(struct musb *musb, unsigne=
d long timeout)
 			&& (musb->xceiv->otg->state =3D=3D OTG_STATE_A_WAIT_BCON))) {
 		dev_dbg(musb->controller, "%s active, deleting timer\n",
 			usb_otg_state_string(musb->xceiv->otg->state));
-		del_timer(&musb->dev_timer);
+		timer_delete(&musb->dev_timer);
 		last_timer =3D jiffies;
 		return;
 	}
@@ -875,7 +875,7 @@ static irqreturn_t tusb_musb_interrupt(int irq, void *__h=
ci)
 	}
=20
 	if (int_src & TUSB_INT_SRC_USB_IP_CONN)
-		del_timer(&musb->dev_timer);
+		timer_delete(&musb->dev_timer);
=20
 	/* OTG state change reports (annoyingly) not issued by Mentor core */
 	if (int_src & (TUSB_INT_SRC_VBUS_SENSE_CHNG
@@ -984,7 +984,7 @@ static void tusb_musb_disable(struct musb *musb)
 	musb_writel(tbase, TUSB_DMA_INT_MASK, 0x7fffffff);
 	musb_writel(tbase, TUSB_GPIO_INT_MASK, 0x1ff);
=20
-	del_timer(&musb->dev_timer);
+	timer_delete(&musb->dev_timer);
=20
 	if (is_dma_capable() && !dma_off) {
 		printk(KERN_WARNING "%s %s: dma still active\n",
@@ -1174,7 +1174,7 @@ static int tusb_musb_exit(struct musb *musb)
 {
 	struct tusb6010_glue *glue =3D dev_get_drvdata(musb->controller->parent);
=20
-	del_timer_sync(&musb->dev_timer);
+	timer_delete_sync(&musb->dev_timer);
 	the_musb =3D NULL;
=20
 	gpiod_set_value(glue->enable, 0);
diff --git a/drivers/usb/phy/phy-mv-usb.c b/drivers/usb/phy/phy-mv-usb.c
index 30d6c8840a5e..638fba58420c 100644
--- a/drivers/usb/phy/phy-mv-usb.c
+++ b/drivers/usb/phy/phy-mv-usb.c
@@ -110,7 +110,7 @@ static int mv_otg_cancel_timer(struct mv_otg *mvotg, unsi=
gned int id)
 	timer =3D &mvotg->otg_ctrl.timer[id];
=20
 	if (timer_pending(timer))
-		del_timer(timer);
+		timer_delete(timer);
=20
 	return 0;
 }
diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_c=
r.c
index 4e516b445136..b387863c245f 100644
--- a/drivers/usb/storage/realtek_cr.c
+++ b/drivers/usb/storage/realtek_cr.c
@@ -934,7 +934,7 @@ static void realtek_cr_destructor(void *extra)
=20
 #ifdef CONFIG_REALTEK_AUTOPM
 	if (ss_en) {
-		del_timer(&chip->rts51x_suspend_timer);
+		timer_delete(&chip->rts51x_suspend_timer);
 		chip->timer_expires =3D 0;
 	}
 #endif
diff --git a/drivers/video/fbdev/aty/radeon_backlight.c b/drivers/video/fbdev=
/aty/radeon_backlight.c
index 9e41d2a18649..bf764c92bcf1 100644
--- a/drivers/video/fbdev/aty/radeon_backlight.c
+++ b/drivers/video/fbdev/aty/radeon_backlight.c
@@ -59,7 +59,7 @@ static int radeon_bl_update_status(struct backlight_device =
*bd)
 	 */
 	level =3D backlight_get_brightness(bd);
=20
-	del_timer_sync(&rinfo->lvds_timer);
+	timer_delete_sync(&rinfo->lvds_timer);
 	radeon_engine_idle();
=20
 	lvds_gen_cntl =3D INREG(LVDS_GEN_CNTL);
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/=
radeon_base.c
index d866608da8d1..c6c4753f6415 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -1082,7 +1082,7 @@ int radeon_screen_blank(struct radeonfb_info *rinfo, in=
t blank, int mode_switch)
 		}
 		break;
 	case MT_LCD:
-		del_timer_sync(&rinfo->lvds_timer);
+		timer_delete_sync(&rinfo->lvds_timer);
 		val =3D INREG(LVDS_GEN_CNTL);
 		if (unblank) {
 			u32 target_val =3D (val & ~LVDS_DISPLAY_DIS) | LVDS_BLON | LVDS_ON
@@ -2516,7 +2516,7 @@ static void radeonfb_pci_unregister(struct pci_dev *pde=
v)
 	if (rinfo->mon2_EDID)
 		sysfs_remove_bin_file(&rinfo->pdev->dev.kobj, &edid2_attr);
=20
-	del_timer_sync(&rinfo->lvds_timer);
+	timer_delete_sync(&rinfo->lvds_timer);
 	arch_phys_wc_del(rinfo->wc_cookie);
         radeonfb_bl_exit(rinfo);
 	unregister_framebuffer(info);
diff --git a/drivers/video/fbdev/aty/radeon_pm.c b/drivers/video/fbdev/aty/ra=
deon_pm.c
index 97a5972f5b1f..5ff4a964055a 100644
--- a/drivers/video/fbdev/aty/radeon_pm.c
+++ b/drivers/video/fbdev/aty/radeon_pm.c
@@ -2650,7 +2650,7 @@ static int radeonfb_pci_suspend_late(struct device *dev=
, pm_message_t mesg)
 	/* Sleep */
 	rinfo->asleep =3D 1;
 	rinfo->lock_blank =3D 1;
-	del_timer_sync(&rinfo->lvds_timer);
+	timer_delete_sync(&rinfo->lvds_timer);
=20
 #ifdef CONFIG_PPC_PMAC
 	/* On powermac, we have hooks to properly suspend/resume AGP now,
diff --git a/drivers/video/fbdev/omap/hwa742.c b/drivers/video/fbdev/omap/hwa=
742.c
index 161fc65d6b57..64e76e1f5388 100644
--- a/drivers/video/fbdev/omap/hwa742.c
+++ b/drivers/video/fbdev/omap/hwa742.c
@@ -597,7 +597,7 @@ static int hwa742_set_update_mode(enum omapfb_update_mode=
 mode)
 		break;
 	case OMAPFB_AUTO_UPDATE:
 		hwa742.stop_auto_update =3D 1;
-		del_timer_sync(&hwa742.auto_update_timer);
+		timer_delete_sync(&hwa742.auto_update_timer);
 		break;
 	case OMAPFB_UPDATE_DISABLED:
 		break;
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev=
/omap2/omapfb/dss/dsi.c
index 1f3434c040c1..370e8623754e 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -835,7 +835,7 @@ static irqreturn_t omap_dsi_irq_handler(int irq, void *ar=
g)
=20
 #ifdef DSI_CATCH_MISSING_TE
 	if (irqstatus & DSI_IRQ_TE_TRIGGER)
-		del_timer(&dsi->te_timer);
+		timer_delete(&dsi->te_timer);
 #endif
=20
 	/* make a copy and unlock, so that isrs can unregister
diff --git a/drivers/virt/vboxguest/vboxguest_core.c b/drivers/virt/vboxguest=
/vboxguest_core.c
index c6e9855998ab..f1674f3ed923 100644
--- a/drivers/virt/vboxguest/vboxguest_core.c
+++ b/drivers/virt/vboxguest/vboxguest_core.c
@@ -495,7 +495,7 @@ static int vbg_heartbeat_init(struct vbg_dev *gdev)
  */
 static void vbg_heartbeat_exit(struct vbg_dev *gdev)
 {
-	del_timer_sync(&gdev->heartbeat_timer);
+	timer_delete_sync(&gdev->heartbeat_timer);
 	vbg_heartbeat_host_config(gdev, false);
 	vbg_req_free(gdev->guest_heartbeat_req,
 		     sizeof(*gdev->guest_heartbeat_req));
diff --git a/drivers/watchdog/alim7101_wdt.c b/drivers/watchdog/alim7101_wdt.c
index 9c7cf939ba3d..03a559b41f5b 100644
--- a/drivers/watchdog/alim7101_wdt.c
+++ b/drivers/watchdog/alim7101_wdt.c
@@ -166,7 +166,7 @@ static void wdt_startup(void)
 static void wdt_turnoff(void)
 {
 	/* Stop the timer */
-	del_timer_sync(&timer);
+	timer_delete_sync(&timer);
 	wdt_change(WDT_DISABLE);
 	pr_info("Watchdog timer is now disabled...\n");
 }
@@ -223,7 +223,7 @@ static int fop_close(struct inode *inode, struct file *fi=
le)
 	if (wdt_expect_close =3D=3D 42)
 		wdt_turnoff();
 	else {
-		/* wim: shouldn't there be a: del_timer(&timer); */
+		/* wim: shouldn't there be a: timer_delete(&timer); */
 		pr_crit("device file closed unexpectedly. Will not stop the WDT!\n");
 	}
 	clear_bit(0, &wdt_is_open);
diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
index 7be70b98d091..1b47a2fc7d17 100644
--- a/drivers/watchdog/at91sam9_wdt.c
+++ b/drivers/watchdog/at91sam9_wdt.c
@@ -242,7 +242,7 @@ static int at91_wdt_init(struct platform_device *pdev, st=
ruct at91wdt *wdt)
 	return 0;
=20
 out_stop_timer:
-	del_timer(&wdt->timer);
+	timer_delete(&wdt->timer);
 	return err;
 }
=20
@@ -378,7 +378,7 @@ static void at91wdt_remove(struct platform_device *pdev)
 	watchdog_unregister_device(&wdt->wdd);
=20
 	pr_warn("I quit now, hardware will probably reboot!\n");
-	del_timer(&wdt->timer);
+	timer_delete(&wdt->timer);
 }
=20
 #if defined(CONFIG_OF)
diff --git a/drivers/watchdog/bcm47xx_wdt.c b/drivers/watchdog/bcm47xx_wdt.c
index 06a54c7de40b..4c0951307421 100644
--- a/drivers/watchdog/bcm47xx_wdt.c
+++ b/drivers/watchdog/bcm47xx_wdt.c
@@ -139,7 +139,7 @@ static int bcm47xx_wdt_soft_stop(struct watchdog_device *=
wdd)
 {
 	struct bcm47xx_wdt *wdt =3D bcm47xx_wdt_get(wdd);
=20
-	del_timer_sync(&wdt->soft_timer);
+	timer_delete_sync(&wdt->soft_timer);
 	wdt->timer_set(wdt, 0);
=20
 	return 0;
@@ -213,7 +213,7 @@ static int bcm47xx_wdt_probe(struct platform_device *pdev)
=20
 err_timer:
 	if (soft)
-		del_timer_sync(&wdt->soft_timer);
+		timer_delete_sync(&wdt->soft_timer);
=20
 	return ret;
 }
diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
index 4fb92c9e046a..13a4d47e68cd 100644
--- a/drivers/watchdog/cpwd.c
+++ b/drivers/watchdog/cpwd.c
@@ -240,7 +240,7 @@ static void cpwd_brokentimer(struct timer_list *unused)
 	 * were called directly instead of by kernel timer
 	 */
 	if (timer_pending(&cpwd_timer))
-		del_timer(&cpwd_timer);
+		timer_delete(&cpwd_timer);
=20
 	for (id =3D 0; id < WD_NUMDEVS; id++) {
 		if (p->devs[id].runstatus & WD_STAT_BSTOP) {
@@ -629,7 +629,7 @@ static void cpwd_remove(struct platform_device *op)
 	}
=20
 	if (p->broken)
-		del_timer_sync(&cpwd_timer);
+		timer_delete_sync(&cpwd_timer);
=20
 	if (p->initialized)
 		free_irq(p->irq, p);
diff --git a/drivers/watchdog/lpc18xx_wdt.c b/drivers/watchdog/lpc18xx_wdt.c
index f19580e1b318..28e3fc0df4c6 100644
--- a/drivers/watchdog/lpc18xx_wdt.c
+++ b/drivers/watchdog/lpc18xx_wdt.c
@@ -135,7 +135,7 @@ static int lpc18xx_wdt_start(struct watchdog_device *wdt_=
dev)
 	unsigned int val;
=20
 	if (timer_pending(&lpc18xx_wdt->timer))
-		del_timer(&lpc18xx_wdt->timer);
+		timer_delete(&lpc18xx_wdt->timer);
=20
 	val =3D readl(lpc18xx_wdt->base + LPC18XX_WDT_MOD);
 	val |=3D LPC18XX_WDT_MOD_WDEN;
@@ -266,7 +266,7 @@ static void lpc18xx_wdt_remove(struct platform_device *pd=
ev)
 	struct lpc18xx_wdt_dev *lpc18xx_wdt =3D platform_get_drvdata(pdev);
=20
 	dev_warn(&pdev->dev, "I quit now, hardware will probably reboot!\n");
-	del_timer_sync(&lpc18xx_wdt->timer);
+	timer_delete_sync(&lpc18xx_wdt->timer);
 }
=20
 static const struct of_device_id lpc18xx_wdt_match[] =3D {
diff --git a/drivers/watchdog/machzwd.c b/drivers/watchdog/machzwd.c
index 73d641486909..0ae8e5bc10ae 100644
--- a/drivers/watchdog/machzwd.c
+++ b/drivers/watchdog/machzwd.c
@@ -189,7 +189,7 @@ static void zf_timer_off(void)
 	unsigned long flags;
=20
 	/* stop internal ping */
-	del_timer_sync(&zf_timer);
+	timer_delete_sync(&zf_timer);
=20
 	spin_lock_irqsave(&zf_port_lock, flags);
 	/* stop watchdog timer */
@@ -337,7 +337,7 @@ static int zf_close(struct inode *inode, struct file *fil=
e)
 	if (zf_expect_close =3D=3D 42)
 		zf_timer_off();
 	else {
-		del_timer(&zf_timer);
+		timer_delete(&zf_timer);
 		pr_err("device file closed unexpectedly. Will not stop the WDT!\n");
 	}
 	clear_bit(0, &zf_is_open);
diff --git a/drivers/watchdog/mixcomwd.c b/drivers/watchdog/mixcomwd.c
index 70d9cf84c342..1ecd5c48a005 100644
--- a/drivers/watchdog/mixcomwd.c
+++ b/drivers/watchdog/mixcomwd.c
@@ -141,7 +141,7 @@ static int mixcomwd_open(struct inode *inode, struct file=
 *file)
 		__module_get(THIS_MODULE);
 	else {
 		if (mixcomwd_timer_alive) {
-			del_timer(&mixcomwd_timer);
+			timer_delete(&mixcomwd_timer);
 			mixcomwd_timer_alive =3D 0;
 		}
 	}
@@ -295,7 +295,7 @@ static void __exit mixcomwd_exit(void)
 	if (!nowayout) {
 		if (mixcomwd_timer_alive) {
 			pr_warn("I quit now, hardware will probably reboot!\n");
-			del_timer_sync(&mixcomwd_timer);
+			timer_delete_sync(&mixcomwd_timer);
 			mixcomwd_timer_alive =3D 0;
 		}
 	}
diff --git a/drivers/watchdog/pcwd.c b/drivers/watchdog/pcwd.c
index 31d3dcbf815e..d4ea7d6ccd6a 100644
--- a/drivers/watchdog/pcwd.c
+++ b/drivers/watchdog/pcwd.c
@@ -432,7 +432,7 @@ static int pcwd_stop(void)
 	int stat_reg;
=20
 	/* Stop the timer */
-	del_timer(&pcwd_private.timer);
+	timer_delete(&pcwd_private.timer);
=20
 	/*  Disable the board  */
 	if (pcwd_private.revision =3D=3D PCWD_REVISION_C) {
diff --git a/drivers/watchdog/pika_wdt.c b/drivers/watchdog/pika_wdt.c
index 393aa4b1bc13..87b8988d2520 100644
--- a/drivers/watchdog/pika_wdt.c
+++ b/drivers/watchdog/pika_wdt.c
@@ -129,7 +129,7 @@ static int pikawdt_release(struct inode *inode, struct fi=
le *file)
 {
 	/* stop internal ping */
 	if (!pikawdt_private.expect_close)
-		del_timer(&pikawdt_private.timer);
+		timer_delete(&pikawdt_private.timer);
=20
 	clear_bit(0, &pikawdt_private.open);
 	pikawdt_private.expect_close =3D 0;
diff --git a/drivers/watchdog/sbc60xxwdt.c b/drivers/watchdog/sbc60xxwdt.c
index e9bf12918ed8..03eaf48c8f0f 100644
--- a/drivers/watchdog/sbc60xxwdt.c
+++ b/drivers/watchdog/sbc60xxwdt.c
@@ -146,7 +146,7 @@ static void wdt_startup(void)
 static void wdt_turnoff(void)
 {
 	/* Stop the timer */
-	del_timer_sync(&timer);
+	timer_delete_sync(&timer);
 	inb_p(wdt_stop);
 	pr_info("Watchdog timer is now disabled...\n");
 }
@@ -210,7 +210,7 @@ static int fop_close(struct inode *inode, struct file *fi=
le)
 	if (wdt_expect_close =3D=3D 42)
 		wdt_turnoff();
 	else {
-		del_timer(&timer);
+		timer_delete(&timer);
 		pr_crit("device file closed unexpectedly. Will not stop the WDT!\n");
 	}
 	clear_bit(0, &wdt_is_open);
diff --git a/drivers/watchdog/sc520_wdt.c b/drivers/watchdog/sc520_wdt.c
index e849e1af267b..005f62e4a4fb 100644
--- a/drivers/watchdog/sc520_wdt.c
+++ b/drivers/watchdog/sc520_wdt.c
@@ -186,7 +186,7 @@ static int wdt_startup(void)
 static int wdt_turnoff(void)
 {
 	/* Stop the timer */
-	del_timer_sync(&timer);
+	timer_delete_sync(&timer);
=20
 	/* Stop the watchdog */
 	wdt_config(0);
diff --git a/drivers/watchdog/shwdt.c b/drivers/watchdog/shwdt.c
index 7f0150c39421..95af9ad94d16 100644
--- a/drivers/watchdog/shwdt.c
+++ b/drivers/watchdog/shwdt.c
@@ -129,7 +129,7 @@ static int sh_wdt_stop(struct watchdog_device *wdt_dev)
=20
 	spin_lock_irqsave(&wdt->lock, flags);
=20
-	del_timer(&wdt->timer);
+	timer_delete(&wdt->timer);
=20
 	csr =3D sh_wdt_read_csr();
 	csr &=3D ~WTCSR_TME;
diff --git a/drivers/watchdog/via_wdt.c b/drivers/watchdog/via_wdt.c
index eeb39f96e72e..d647923d68fe 100644
--- a/drivers/watchdog/via_wdt.c
+++ b/drivers/watchdog/via_wdt.c
@@ -233,7 +233,7 @@ static int wdt_probe(struct pci_dev *pdev,
 static void wdt_remove(struct pci_dev *pdev)
 {
 	watchdog_unregister_device(&wdt_dev);
-	del_timer_sync(&timer);
+	timer_delete_sync(&timer);
 	iounmap(wdt_mem);
 	release_mem_region(mmio, VIA_WDT_MMIO_LEN);
 	release_resource(&wdt_res);
diff --git a/drivers/watchdog/w83877f_wdt.c b/drivers/watchdog/w83877f_wdt.c
index 1937084c182c..53db59ef774b 100644
--- a/drivers/watchdog/w83877f_wdt.c
+++ b/drivers/watchdog/w83877f_wdt.c
@@ -166,7 +166,7 @@ static void wdt_startup(void)
 static void wdt_turnoff(void)
 {
 	/* Stop the timer */
-	del_timer_sync(&timer);
+	timer_delete_sync(&timer);
=20
 	wdt_change(WDT_DISABLE);
=20
@@ -228,7 +228,7 @@ static int fop_close(struct inode *inode, struct file *fi=
le)
 	if (wdt_expect_close =3D=3D 42)
 		wdt_turnoff();
 	else {
-		del_timer(&timer);
+		timer_delete(&timer);
 		pr_crit("device file closed unexpectedly. Will not stop the WDT!\n");
 	}
 	clear_bit(0, &wdt_is_open);
diff --git a/fs/afs/fs_probe.c b/fs/afs/fs_probe.c
index 07a8bfbdd9b9..e0030ac74ea0 100644
--- a/fs/afs/fs_probe.c
+++ b/fs/afs/fs_probe.c
@@ -534,6 +534,6 @@ int afs_wait_for_one_fs_probe(struct afs_server *server, =
struct afs_endpoint_sta
  */
 void afs_fs_probe_cleanup(struct afs_net *net)
 {
-	if (del_timer_sync(&net->fs_probe_timer))
+	if (timer_delete_sync(&net->fs_probe_timer))
 		afs_dec_servers_outstanding(net);
 }
diff --git a/fs/afs/server.c b/fs/afs/server.c
index c530d1ca15df..8755f2703815 100644
--- a/fs/afs/server.c
+++ b/fs/afs/server.c
@@ -318,7 +318,7 @@ struct afs_server *afs_use_server(struct afs_server *serv=
er, bool activate,
 	a =3D atomic_inc_return(&server->active);
 	if (a =3D=3D 1 && activate &&
 	    !test_bit(AFS_SERVER_FL_EXPIRED, &server->flags))
-		del_timer(&server->timer);
+		timer_delete(&server->timer);
=20
 	trace_afs_server(server->debug_id, r + 1, a, reason);
 	return server;
diff --git a/fs/bcachefs/clock.c b/fs/bcachefs/clock.c
index 1f8e035d7119..d6dd12d74d4f 100644
--- a/fs/bcachefs/clock.c
+++ b/fs/bcachefs/clock.c
@@ -121,7 +121,7 @@ void bch2_kthread_io_clock_wait(struct io_clock *clock,
 	} while (0);
=20
 	__set_current_state(TASK_RUNNING);
-	del_timer_sync(&wait.cpu_timer);
+	timer_delete_sync(&wait.cpu_timer);
 	destroy_timer_on_stack(&wait.cpu_timer);
 	bch2_io_timer_del(clock, &wait.io_timer);
 }
diff --git a/fs/btrfs/zstd.c b/fs/btrfs/zstd.c
index cd5f38d6fbaa..3541efa765c7 100644
--- a/fs/btrfs/zstd.c
+++ b/fs/btrfs/zstd.c
@@ -225,7 +225,7 @@ void zstd_cleanup_workspace_manager(void)
 	}
 	spin_unlock_bh(&wsm.lock);
=20
-	del_timer_sync(&wsm.timer);
+	timer_delete_sync(&wsm.timer);
 }
=20
 /*
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 8122d4ffb3b5..181934499624 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -5680,7 +5680,7 @@ failed_mount8: __maybe_unused
 	/* flush s_sb_upd_work before sbi destroy */
 	flush_work(&sbi->s_sb_upd_work);
 	ext4_stop_mmpd(sbi);
-	del_timer_sync(&sbi->s_err_report);
+	timer_delete_sync(&sbi->s_err_report);
 	ext4_group_desc_free(sbi);
 failed_mount:
 #if IS_ENABLED(CONFIG_UNICODE)
diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
index a5ccba25ff47..743a1d7633cd 100644
--- a/fs/jbd2/journal.c
+++ b/fs/jbd2/journal.c
@@ -197,7 +197,7 @@ static int kjournald2(void *arg)
 	if (journal->j_commit_sequence !=3D journal->j_commit_request) {
 		jbd2_debug(1, "OK, requests differ\n");
 		write_unlock(&journal->j_state_lock);
-		del_timer_sync(&journal->j_commit_timer);
+		timer_delete_sync(&journal->j_commit_timer);
 		jbd2_journal_commit_transaction(journal);
 		write_lock(&journal->j_state_lock);
 		goto loop;
@@ -246,7 +246,7 @@ static int kjournald2(void *arg)
 	goto loop;
=20
 end_loop:
-	del_timer_sync(&journal->j_commit_timer);
+	timer_delete_sync(&journal->j_commit_timer);
 	journal->j_task =3D NULL;
 	wake_up(&journal->j_wait_done_commit);
 	jbd2_debug(1, "Journal thread exiting.\n");
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 4061e0ba7010..bb815a002984 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -584,7 +584,7 @@ static int __jffs2_flush_wbuf(struct jffs2_sb_info *c, in=
t pad)
 	size_t retlen;
=20
 	/* Nothing to do if not write-buffering the flash. In particular, we should=
n't
-	   del_timer() the timer we never initialised. */
+	   call timer_delete() on the timer we never initialised. */
 	if (!jffs2_is_writebuffered(c))
 		return 0;
=20
diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 3a202e51b360..83970d97840b 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -2424,7 +2424,7 @@ static void nilfs_segctor_accept(struct nilfs_sc_info *=
sci)
 	 * the area protected by sc_state_lock.
 	 */
 	if (thread_is_alive)
-		del_timer_sync(&sci->sc_timer);
+		timer_delete_sync(&sci->sc_timer);
 }
=20
 /**
diff --git a/fs/ocfs2/cluster/tcp.c b/fs/ocfs2/cluster/tcp.c
index 0f46b22561d6..fce9beb214f0 100644
--- a/fs/ocfs2/cluster/tcp.c
+++ b/fs/ocfs2/cluster/tcp.c
@@ -724,7 +724,7 @@ static void o2net_shutdown_sc(struct work_struct *work)
 	if (o2net_unregister_callbacks(sc->sc_sock->sk, sc)) {
 		/* we shouldn't flush as we're in the thread, the
 		 * races with pending sc work structs are harmless */
-		del_timer_sync(&sc->sc_idle_timeout);
+		timer_delete_sync(&sc->sc_idle_timeout);
 		o2net_sc_cancel_delayed_work(sc, &sc->sc_keepalive_work);
 		sc_put(sc);
 		kernel_sock_shutdown(sc->sc_sock, SHUT_RDWR);
diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 557cf9d40177..f8b9c9c73997 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -563,7 +563,7 @@ void pstore_unregister(struct pstore_info *psi)
 		pstore_unregister_kmsg();
=20
 	/* Stop timer and make sure all work has finished. */
-	del_timer_sync(&pstore_timer);
+	timer_delete_sync(&pstore_timer);
 	flush_work(&pstore_work);
=20
 	/* Remove all backend records from filesystem tree. */
diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index 88e078871158..1adcba3ddd76 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -231,8 +231,6 @@ static inline enum hrtimer_restart hrtimer_dummy_timeout(=
struct hrtimer *unused)
 /* Exported timer functions: */
=20
 /* Initialize timers: */
-extern void hrtimer_init(struct hrtimer *timer, clockid_t which_clock,
-			 enum hrtimer_mode mode);
 extern void hrtimer_setup(struct hrtimer *timer, enum hrtimer_restart (*func=
tion)(struct hrtimer *),
 			  clockid_t clock_id, enum hrtimer_mode mode);
 extern void hrtimer_setup_on_stack(struct hrtimer *timer,
diff --git a/include/linux/hrtimer_types.h b/include/linux/hrtimer_types.h
index ad66a3081735..8fbbb6bdf7a1 100644
--- a/include/linux/hrtimer_types.h
+++ b/include/linux/hrtimer_types.h
@@ -34,12 +34,12 @@ enum hrtimer_restart {
  * @is_hard:	Set if hrtimer will be expired in hard interrupt context
  *		even on RT.
  *
- * The hrtimer structure must be initialized by hrtimer_init()
+ * The hrtimer structure must be initialized by hrtimer_setup()
  */
 struct hrtimer {
 	struct timerqueue_node		node;
 	ktime_t				_softexpires;
-	enum hrtimer_restart		(*function)(struct hrtimer *);
+	enum hrtimer_restart		(*__private function)(struct hrtimer *);
 	struct hrtimer_clock_base	*base;
 	u8				state;
 	u8				is_rel;
diff --git a/include/linux/timer.h b/include/linux/timer.h
index e67ecd1cbc97..10596d7c3a34 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -30,7 +30,7 @@
  *
  * @TIMER_IRQSAFE: An irqsafe timer is executed with IRQ disabled and
  * it's safe to wait for the completion of the running instance from
- * IRQ handlers, for example, by calling del_timer_sync().
+ * IRQ handlers, for example, by calling timer_delete_sync().
  *
  * Note: The irq disabled callback execution is a special case for
  * workqueue locking issues. It's not meant for executing random crap
@@ -168,40 +168,6 @@ extern int timer_delete(struct timer_list *timer);
 extern int timer_shutdown_sync(struct timer_list *timer);
 extern int timer_shutdown(struct timer_list *timer);
=20
-/**
- * del_timer_sync - Delete a pending timer and wait for a running callback
- * @timer:	The timer to be deleted
- *
- * See timer_delete_sync() for detailed explanation.
- *
- * Do not use in new code. Use timer_delete_sync() instead.
- *
- * Returns:
- * * %0	- The timer was not pending
- * * %1	- The timer was pending and deactivated
- */
-static inline int del_timer_sync(struct timer_list *timer)
-{
-	return timer_delete_sync(timer);
-}
-
-/**
- * del_timer - Delete a pending timer
- * @timer:	The timer to be deleted
- *
- * See timer_delete() for detailed explanation.
- *
- * Do not use in new code. Use timer_delete() instead.
- *
- * Returns:
- * * %0	- The timer was not pending
- * * %1	- The timer was pending and deactivated
- */
-static inline int del_timer(struct timer_list *timer)
-{
-	return timer_delete(timer);
-}
-
 extern void init_timers(void);
 struct hrtimer;
 extern enum hrtimer_restart it_real_fn(struct hrtimer *);
diff --git a/include/net/sctp/sctp.h b/include/net/sctp/sctp.h
index 84e6b9fd5610..d8da764cf6de 100644
--- a/include/net/sctp/sctp.h
+++ b/include/net/sctp/sctp.h
@@ -636,7 +636,7 @@ static inline void sctp_transport_pl_reset(struct sctp_tr=
ansport *t)
 		}
 	} else {
 		if (t->pl.state !=3D SCTP_PL_DISABLED) {
-			if (del_timer(&t->probe_timer))
+			if (timer_delete(&t->probe_timer))
 				sctp_transport_put(t);
 			t->pl.state =3D SCTP_PL_DISABLED;
 		}
diff --git a/include/trace/events/timer.h b/include/trace/events/timer.h
index 1ef58a04fc57..1641ae3e6ca0 100644
--- a/include/trace/events/timer.h
+++ b/include/trace/events/timer.h
@@ -185,12 +185,12 @@ TRACE_EVENT(timer_base_idle,
 		{ HRTIMER_MODE_REL_PINNED_HARD,	"REL|PINNED|HARD" })
=20
 /**
- * hrtimer_init - called when the hrtimer is initialized
+ * hrtimer_setup - called when the hrtimer is initialized
  * @hrtimer:	pointer to struct hrtimer
  * @clockid:	the hrtimers clock
  * @mode:	the hrtimers mode
  */
-TRACE_EVENT(hrtimer_init,
+TRACE_EVENT(hrtimer_setup,
=20
 	TP_PROTO(struct hrtimer *hrtimer, clockid_t clockid,
 		 enum hrtimer_mode mode),
@@ -235,7 +235,7 @@ TRACE_EVENT(hrtimer_start,
=20
 	TP_fast_assign(
 		__entry->hrtimer	=3D hrtimer;
-		__entry->function	=3D hrtimer->function;
+		__entry->function	=3D ACCESS_PRIVATE(hrtimer, function);
 		__entry->expires	=3D hrtimer_get_expires(hrtimer);
 		__entry->softexpires	=3D hrtimer_get_softexpires(hrtimer);
 		__entry->mode		=3D mode;
@@ -271,7 +271,7 @@ TRACE_EVENT(hrtimer_expire_entry,
 	TP_fast_assign(
 		__entry->hrtimer	=3D hrtimer;
 		__entry->now		=3D *now;
-		__entry->function	=3D hrtimer->function;
+		__entry->function	=3D ACCESS_PRIVATE(hrtimer, function);
 	),
=20
 	TP_printk("hrtimer=3D%p function=3D%ps now=3D%llu",
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index ac2db99941ca..27f08aa17b56 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -1695,7 +1695,7 @@ static void cgroup_rm_file(struct cgroup *cgrp, const s=
truct cftype *cft)
 		cfile->kn =3D NULL;
 		spin_unlock_irq(&cgroup_file_kn_lock);
=20
-		del_timer_sync(&cfile->notify_timer);
+		timer_delete_sync(&cfile->notify_timer);
 	}
=20
 	kernfs_remove_by_name(cgrp->kn, cgroup_file_name(cgrp, cft, name));
diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
index 117d9d4d3c3b..6ce73cceaf53 100644
--- a/kernel/kcsan/kcsan_test.c
+++ b/kernel/kcsan/kcsan_test.c
@@ -1500,7 +1500,7 @@ static int access_thread(void *arg)
 				func();
 		}
 	} while (!torture_must_stop());
-	del_timer_sync(&timer);
+	timer_delete_sync(&timer);
 	destroy_timer_on_stack(&timer);
=20
 	torture_kthread_stopping("access_thread");
diff --git a/kernel/kthread.c b/kernel/kthread.c
index 5dc5b0d7238e..77c44924cf54 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -1362,14 +1362,14 @@ static void kthread_cancel_delayed_work_timer(struct =
kthread_work *work,
 	struct kthread_worker *worker =3D work->worker;
=20
 	/*
-	 * del_timer_sync() must be called to make sure that the timer
+	 * timer_delete_sync() must be called to make sure that the timer
 	 * callback is not running. The lock must be temporary released
 	 * to avoid a deadlock with the callback. In the meantime,
 	 * any queuing is blocked by setting the canceling counter.
 	 */
 	work->canceling++;
 	raw_spin_unlock_irqrestore(&worker->lock, *flags);
-	del_timer_sync(&dwork->timer);
+	timer_delete_sync(&dwork->timer);
 	raw_spin_lock_irqsave(&worker->lock, *flags);
 	work->canceling--;
 }
diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 65095664f5c5..4fa7772be183 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -2324,7 +2324,7 @@ rcu_torture_reader(void *arg)
 		stutter_wait("rcu_torture_reader");
 	} while (!torture_must_stop());
 	if (irqreader && cur_ops->irq_capable) {
-		del_timer_sync(&t);
+		timer_delete_sync(&t);
 		destroy_timer_on_stack(&t);
 	}
 	tick_dep_clear_task(current, TICK_DEP_BIT_RCU);
diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index d2a694944553..9a59b071501b 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -690,7 +690,7 @@ void cleanup_srcu_struct(struct srcu_struct *ssp)
 	for_each_possible_cpu(cpu) {
 		struct srcu_data *sdp =3D per_cpu_ptr(ssp->sda, cpu);
=20
-		del_timer_sync(&sdp->delay_work);
+		timer_delete_sync(&sdp->delay_work);
 		flush_work(&sdp->work);
 		if (WARN_ON(rcu_segcblist_n_cbs(&sdp->srcu_cblist)))
 			return; /* Forgot srcu_barrier(), so just leak it! */
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 466668eb4fad..c0cc7ae41106 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1086,7 +1086,7 @@ static void rcu_tasks_postscan(struct list_head *hop)
 	}
=20
 	if (!IS_ENABLED(CONFIG_TINY_RCU))
-		del_timer_sync(&tasks_rcu_exit_srcu_stall_timer);
+		timer_delete_sync(&tasks_rcu_exit_srcu_stall_timer);
 }
=20
 /* See if tasks are still holding out, complain if so. */
diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
index 5ff3bc56ff51..fa269d34167a 100644
--- a/kernel/rcu/tree_nocb.h
+++ b/kernel/rcu/tree_nocb.h
@@ -206,7 +206,7 @@ static bool __wake_nocb_gp(struct rcu_data *rdp_gp,
=20
 	if (rdp_gp->nocb_defer_wakeup > RCU_NOCB_WAKE_NOT) {
 		WRITE_ONCE(rdp_gp->nocb_defer_wakeup, RCU_NOCB_WAKE_NOT);
-		del_timer(&rdp_gp->nocb_timer);
+		timer_delete(&rdp_gp->nocb_timer);
 	}
=20
 	if (force || READ_ONCE(rdp_gp->nocb_gp_sleep)) {
@@ -822,7 +822,7 @@ static void nocb_gp_wait(struct rcu_data *my_rdp)
=20
 		if (my_rdp->nocb_defer_wakeup > RCU_NOCB_WAKE_NOT) {
 			WRITE_ONCE(my_rdp->nocb_defer_wakeup, RCU_NOCB_WAKE_NOT);
-			del_timer(&my_rdp->nocb_timer);
+			timer_delete(&my_rdp->nocb_timer);
 		}
 		WRITE_ONCE(my_rdp->nocb_gp_sleep, true);
 		raw_spin_unlock_irqrestore(&my_rdp->nocb_gp_lock, flags);
diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index bb56805e3d47..1396674fa722 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1440,7 +1440,7 @@ void psi_trigger_destroy(struct psi_trigger *t)
 						group->rtpoll_task,
 						lockdep_is_held(&group->rtpoll_trigger_lock));
 				rcu_assign_pointer(group->rtpoll_task, NULL);
-				del_timer(&group->rtpoll_timer);
+				timer_delete(&group->rtpoll_timer);
 			}
 		}
 		mutex_unlock(&group->rtpoll_trigger_lock);
diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index e0eeacbe2521..bb48498ebb5a 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -619,7 +619,7 @@ static inline void clocksource_stop_watchdog(void)
 {
 	if (!watchdog_running || (watchdog && !list_empty(&watchdog_list)))
 		return;
-	del_timer(&watchdog_timer);
+	timer_delete(&watchdog_timer);
 	watchdog_running =3D 0;
 }
=20
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 22376a1a75b9..517ee2590a29 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -465,19 +465,17 @@ static inline void debug_hrtimer_activate(struct hrtime=
r *timer,
 static inline void debug_hrtimer_deactivate(struct hrtimer *timer) { }
 #endif
=20
-static inline void
-debug_init(struct hrtimer *timer, clockid_t clockid,
-	   enum hrtimer_mode mode)
+static inline void debug_setup(struct hrtimer *timer, clockid_t clockid, enu=
m hrtimer_mode mode)
 {
 	debug_hrtimer_init(timer);
-	trace_hrtimer_init(timer, clockid, mode);
+	trace_hrtimer_setup(timer, clockid, mode);
 }
=20
-static inline void debug_init_on_stack(struct hrtimer *timer, clockid_t cloc=
kid,
-				       enum hrtimer_mode mode)
+static inline void debug_setup_on_stack(struct hrtimer *timer, clockid_t clo=
ckid,
+					enum hrtimer_mode mode)
 {
 	debug_hrtimer_init_on_stack(timer);
-	trace_hrtimer_init(timer, clockid, mode);
+	trace_hrtimer_setup(timer, clockid, mode);
 }
=20
 static inline void debug_activate(struct hrtimer *timer,
@@ -1316,8 +1314,6 @@ void hrtimer_start_range_ns(struct hrtimer *timer, ktim=
e_t tim,
 	struct hrtimer_clock_base *base;
 	unsigned long flags;
=20
-	if (WARN_ON_ONCE(!timer->function))
-		return;
 	/*
 	 * Check whether the HRTIMER_MODE_SOFT bit and hrtimer.is_soft
 	 * match on CONFIG_PREEMPT_RT =3D n. With PREEMPT_RT check the hard
@@ -1429,7 +1425,7 @@ static __always_inline bool is_migration_base(struct hr=
timer_clock_base *base)
  * running.
  *
  * This prevents priority inversion: if the soft irq thread is preempted
- * in the middle of a timer callback, then calling del_timer_sync() can
+ * in the middle of a timer callback, then calling hrtimer_cancel() can
  * lead to two issues:
  *
  *  - If the caller is on a remote CPU then it has to spin wait for the timer
@@ -1592,8 +1588,9 @@ static inline int hrtimer_clockid_to_base(clockid_t clo=
ck_id)
 	}
 }
=20
-static void __hrtimer_init(struct hrtimer *timer, clockid_t clock_id,
-			   enum hrtimer_mode mode)
+static void __hrtimer_setup(struct hrtimer *timer,
+			    enum hrtimer_restart (*function)(struct hrtimer *),
+			    clockid_t clock_id, enum hrtimer_mode mode)
 {
 	bool softtimer =3D !!(mode & HRTIMER_MODE_SOFT);
 	struct hrtimer_cpu_base *cpu_base;
@@ -1626,39 +1623,12 @@ static void __hrtimer_init(struct hrtimer *timer, clo=
ckid_t clock_id,
 	timer->is_hard =3D !!(mode & HRTIMER_MODE_HARD);
 	timer->base =3D &cpu_base->clock_base[base];
 	timerqueue_init(&timer->node);
-}
-
-static void __hrtimer_setup(struct hrtimer *timer,
-			    enum hrtimer_restart (*function)(struct hrtimer *),
-			    clockid_t clock_id, enum hrtimer_mode mode)
-{
-	__hrtimer_init(timer, clock_id, mode);
=20
 	if (WARN_ON_ONCE(!function))
-		timer->function =3D hrtimer_dummy_timeout;
+		ACCESS_PRIVATE(timer, function) =3D hrtimer_dummy_timeout;
 	else
-		timer->function =3D function;
-}
-
-/**
- * hrtimer_init - initialize a timer to the given clock
- * @timer:	the timer to be initialized
- * @clock_id:	the clock to be used
- * @mode:       The modes which are relevant for initialization:
- *              HRTIMER_MODE_ABS, HRTIMER_MODE_REL, HRTIMER_MODE_ABS_SOFT,
- *              HRTIMER_MODE_REL_SOFT
- *
- *              The PINNED variants of the above can be handed in,
- *              but the PINNED bit is ignored as pinning happens
- *              when the hrtimer is started
- */
-void hrtimer_init(struct hrtimer *timer, clockid_t clock_id,
-		  enum hrtimer_mode mode)
-{
-	debug_init(timer, clock_id, mode);
-	__hrtimer_init(timer, clock_id, mode);
+		ACCESS_PRIVATE(timer, function) =3D function;
 }
-EXPORT_SYMBOL_GPL(hrtimer_init);
=20
 /**
  * hrtimer_setup - initialize a timer to the given clock
@@ -1676,7 +1646,7 @@ EXPORT_SYMBOL_GPL(hrtimer_init);
 void hrtimer_setup(struct hrtimer *timer, enum hrtimer_restart (*function)(s=
truct hrtimer *),
 		   clockid_t clock_id, enum hrtimer_mode mode)
 {
-	debug_init(timer, clock_id, mode);
+	debug_setup(timer, clock_id, mode);
 	__hrtimer_setup(timer, function, clock_id, mode);
 }
 EXPORT_SYMBOL_GPL(hrtimer_setup);
@@ -1695,7 +1665,7 @@ void hrtimer_setup_on_stack(struct hrtimer *timer,
 			    enum hrtimer_restart (*function)(struct hrtimer *),
 			    clockid_t clock_id, enum hrtimer_mode mode)
 {
-	debug_init_on_stack(timer, clock_id, mode);
+	debug_setup_on_stack(timer, clock_id, mode);
 	__hrtimer_setup(timer, function, clock_id, mode);
 }
 EXPORT_SYMBOL_GPL(hrtimer_setup_on_stack);
@@ -1769,7 +1739,7 @@ static void __run_hrtimer(struct hrtimer_cpu_base *cpu_=
base,
 	raw_write_seqcount_barrier(&base->seq);
=20
 	__remove_hrtimer(timer, base, HRTIMER_STATE_INACTIVE, 0);
-	fn =3D timer->function;
+	fn =3D ACCESS_PRIVATE(timer, function);
=20
 	/*
 	 * Clear the 'is relative' flag for the TIME_LOW_RES case. If the
@@ -2044,7 +2014,7 @@ void hrtimer_sleeper_start_expires(struct hrtimer_sleep=
er *sl,
 	 * Make the enqueue delivery mode check work on RT. If the sleeper
 	 * was initialized for hard interrupt delivery, force the mode bit.
 	 * This is a special case for hrtimer_sleepers because
-	 * __hrtimer_init_sleeper() determines the delivery mode on RT so the
+	 * __hrtimer_setup_sleeper() determines the delivery mode on RT so the
 	 * fiddling with this decision is avoided at the call sites.
 	 */
 	if (IS_ENABLED(CONFIG_PREEMPT_RT) && sl->timer.is_hard)
@@ -2054,8 +2024,8 @@ void hrtimer_sleeper_start_expires(struct hrtimer_sleep=
er *sl,
 }
 EXPORT_SYMBOL_GPL(hrtimer_sleeper_start_expires);
=20
-static void __hrtimer_init_sleeper(struct hrtimer_sleeper *sl,
-				   clockid_t clock_id, enum hrtimer_mode mode)
+static void __hrtimer_setup_sleeper(struct hrtimer_sleeper *sl,
+				    clockid_t clock_id, enum hrtimer_mode mode)
 {
 	/*
 	 * On PREEMPT_RT enabled kernels hrtimers which are not explicitly
@@ -2081,8 +2051,7 @@ static void __hrtimer_init_sleeper(struct hrtimer_sleep=
er *sl,
 			mode |=3D HRTIMER_MODE_HARD;
 	}
=20
-	__hrtimer_init(&sl->timer, clock_id, mode);
-	sl->timer.function =3D hrtimer_wakeup;
+	__hrtimer_setup(&sl->timer, hrtimer_wakeup, clock_id, mode);
 	sl->task =3D current;
 }
=20
@@ -2095,8 +2064,8 @@ static void __hrtimer_init_sleeper(struct hrtimer_sleep=
er *sl,
 void hrtimer_setup_sleeper_on_stack(struct hrtimer_sleeper *sl,
 				    clockid_t clock_id, enum hrtimer_mode mode)
 {
-	debug_init_on_stack(&sl->timer, clock_id, mode);
-	__hrtimer_init_sleeper(sl, clock_id, mode);
+	debug_setup_on_stack(&sl->timer, clock_id, mode);
+	__hrtimer_setup_sleeper(sl, clock_id, mode);
 }
 EXPORT_SYMBOL_GPL(hrtimer_setup_sleeper_on_stack);
=20
diff --git a/kernel/time/sleep_timeout.c b/kernel/time/sleep_timeout.c
index dfe939f6e4ec..c0e960a5de39 100644
--- a/kernel/time/sleep_timeout.c
+++ b/kernel/time/sleep_timeout.c
@@ -97,7 +97,7 @@ signed long __sched schedule_timeout(signed long timeout)
 	timer.timer.expires =3D expire;
 	add_timer(&timer.timer);
 	schedule();
-	del_timer_sync(&timer.timer);
+	timer_delete_sync(&timer.timer);
=20
 	/* Remove the timer from the object tracker */
 	destroy_timer_on_stack(&timer.timer);
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index c8f776dc6ee0..4d915c0a263c 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -744,7 +744,7 @@ static bool timer_fixup_init(void *addr, enum debug_obj_s=
tate state)
=20
 	switch (state) {
 	case ODEBUG_STATE_ACTIVE:
-		del_timer_sync(timer);
+		timer_delete_sync(timer);
 		debug_object_init(timer, &timer_debug_descr);
 		return true;
 	default:
@@ -790,7 +790,7 @@ static bool timer_fixup_free(void *addr, enum debug_obj_s=
tate state)
=20
 	switch (state) {
 	case ODEBUG_STATE_ACTIVE:
-		del_timer_sync(timer);
+		timer_delete_sync(timer);
 		debug_object_free(timer, &timer_debug_descr);
 		return true;
 	default:
@@ -1212,10 +1212,10 @@ EXPORT_SYMBOL(mod_timer_pending);
  *
  * mod_timer(timer, expires) is equivalent to:
  *
- *     del_timer(timer); timer->expires =3D expires; add_timer(timer);
+ *     timer_delete(timer); timer->expires =3D expires; add_timer(timer);
  *
  * mod_timer() is more efficient than the above open coded sequence. In
- * case that the timer is inactive, the del_timer() part is a NOP. The
+ * case that the timer is inactive, the timer_delete() part is a NOP. The
  * timer is in any case activated with the new expiry time @expires.
  *
  * Note that if there are multiple unserialized concurrent users of the
diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
index cfbb46cc4e76..b03d0ada6469 100644
--- a/kernel/time/timer_list.c
+++ b/kernel/time/timer_list.c
@@ -46,7 +46,7 @@ static void
 print_timer(struct seq_file *m, struct hrtimer *taddr, struct hrtimer *timer,
 	    int idx, u64 now)
 {
-	SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, timer->function);
+	SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, ACCESS_PRIVATE(timer, function=
));
 	SEQ_printf(m, ", S:%02x", timer->state);
 	SEQ_printf(m, "\n");
 	SEQ_printf(m, " # expires at %Lu-%Lu nsecs [in %Ld to %Ld nsecs]\n",
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index bfe030b443e2..cf6203282737 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2057,11 +2057,11 @@ static int try_to_grab_pending(struct work_struct *wo=
rk, u32 cflags,
 		struct delayed_work *dwork =3D to_delayed_work(work);
=20
 		/*
-		 * dwork->timer is irqsafe.  If del_timer() fails, it's
+		 * dwork->timer is irqsafe.  If timer_delete() fails, it's
 		 * guaranteed that the timer is not queued anywhere and not
 		 * running on the local CPU.
 		 */
-		if (likely(del_timer(&dwork->timer)))
+		if (likely(timer_delete(&dwork->timer)))
 			return 1;
 	}
=20
@@ -3069,7 +3069,7 @@ __acquires(&pool->lock)
 			break;
 	}
=20
-	del_timer_sync(&pool->mayday_timer);
+	timer_delete_sync(&pool->mayday_timer);
 	raw_spin_lock_irq(&pool->lock);
 	/*
 	 * This is necessary even after a new worker was just successfully
@@ -4281,7 +4281,7 @@ EXPORT_SYMBOL_GPL(flush_work);
 bool flush_delayed_work(struct delayed_work *dwork)
 {
 	local_irq_disable();
-	if (del_timer_sync(&dwork->timer))
+	if (timer_delete_sync(&dwork->timer))
 		__queue_work(dwork->cpu, dwork->wq, &dwork->work);
 	local_irq_enable();
 	return flush_work(&dwork->work);
@@ -4984,9 +4984,9 @@ static void put_unbound_pool(struct worker_pool *pool)
 	reap_dying_workers(&cull_list);
=20
 	/* shut down the timers */
-	del_timer_sync(&pool->idle_timer);
+	timer_delete_sync(&pool->idle_timer);
 	cancel_work_sync(&pool->idle_cull_work);
-	del_timer_sync(&pool->mayday_timer);
+	timer_delete_sync(&pool->mayday_timer);
=20
 	/* RCU protected to allow dereferences from get_work_pool() */
 	call_rcu(&pool->rcu, rcu_free_pool);
@@ -7637,7 +7637,7 @@ notrace void wq_watchdog_touch(int cpu)
 static void wq_watchdog_set_thresh(unsigned long thresh)
 {
 	wq_watchdog_thresh =3D 0;
-	del_timer_sync(&wq_watchdog_timer);
+	timer_delete_sync(&wq_watchdog_timer);
=20
 	if (thresh) {
 		wq_watchdog_thresh =3D thresh;
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index e61bbb1bd622..783904d8c5ef 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -1151,7 +1151,7 @@ static void bdi_remove_from_list(struct backing_dev_inf=
o *bdi)
=20
 void bdi_unregister(struct backing_dev_info *bdi)
 {
-	del_timer_sync(&bdi->laptop_mode_wb_timer);
+	timer_delete_sync(&bdi->laptop_mode_wb_timer);
=20
 	/* make sure nobody finds us on the bdi_list anymore */
 	bdi_remove_from_list(bdi);
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 18456ddd463b..c81624bc3969 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -640,7 +640,7 @@ int wb_domain_init(struct wb_domain *dom, gfp_t gfp)
 #ifdef CONFIG_CGROUP_WRITEBACK
 void wb_domain_exit(struct wb_domain *dom)
 {
-	del_timer_sync(&dom->period_timer);
+	timer_delete_sync(&dom->period_timer);
 	fprop_global_destroy(&dom->completions);
 }
 #endif
@@ -2229,7 +2229,7 @@ void laptop_sync_completion(void)
 	rcu_read_lock();
=20
 	list_for_each_entry_rcu(bdi, &bdi_list, bdi_list)
-		del_timer(&bdi->laptop_mode_wb_timer);
+		timer_delete(&bdi->laptop_mode_wb_timer);
=20
 	rcu_read_unlock();
 }
diff --git a/net/appletalk/aarp.c b/net/appletalk/aarp.c
index 05cbb3c227c5..9c787e2e4b17 100644
--- a/net/appletalk/aarp.c
+++ b/net/appletalk/aarp.c
@@ -856,7 +856,7 @@ int __init aarp_proto_init(void)
 	add_timer(&aarp_timer);
 	rc =3D register_netdevice_notifier(&aarp_notifier);
 	if (rc) {
-		del_timer_sync(&aarp_timer);
+		timer_delete_sync(&aarp_timer);
 		unregister_snap_client(aarp_dl);
 	}
 	return rc;
@@ -1011,7 +1011,7 @@ const struct seq_operations aarp_seq_ops =3D {
 /* General module cleanup. Called from cleanup_module() in ddp.c. */
 void aarp_cleanup_module(void)
 {
-	del_timer_sync(&aarp_timer);
+	timer_delete_sync(&aarp_timer);
 	unregister_netdevice_notifier(&aarp_notifier);
 	unregister_snap_client(aarp_dl);
 	aarp_purge();
diff --git a/net/atm/clip.c b/net/atm/clip.c
index 42b910cb4e8e..61b5b700817d 100644
--- a/net/atm/clip.c
+++ b/net/atm/clip.c
@@ -904,7 +904,7 @@ static void atm_clip_exit_noproc(void)
 	/* First, stop the idle timer, so it stops banging
 	 * on the table.
 	 */
-	del_timer_sync(&idle_timer);
+	timer_delete_sync(&idle_timer);
=20
 	dev =3D clip_devs;
 	while (dev) {
diff --git a/net/atm/lec.c b/net/atm/lec.c
index a948dd47c3f3..ded2f0df2ee6 100644
--- a/net/atm/lec.c
+++ b/net/atm/lec.c
@@ -1302,7 +1302,7 @@ lec_arp_remove(struct lec_priv *priv, struct lec_arp_ta=
ble *to_remove)
 		return -1;
=20
 	hlist_del(&to_remove->next);
-	del_timer(&to_remove->timer);
+	timer_delete(&to_remove->timer);
=20
 	/*
 	 * If this is the only MAC connected to this VCC,
@@ -1482,7 +1482,7 @@ static void lec_arp_destroy(struct lec_priv *priv)
=20
 	hlist_for_each_entry_safe(entry, next,
 				  &priv->lec_arp_empty_ones, next) {
-		del_timer_sync(&entry->timer);
+		timer_delete_sync(&entry->timer);
 		lec_arp_clear_vccs(entry);
 		hlist_del(&entry->next);
 		lec_arp_put(entry);
@@ -1491,7 +1491,7 @@ static void lec_arp_destroy(struct lec_priv *priv)
=20
 	hlist_for_each_entry_safe(entry, next,
 				  &priv->lec_no_forward, next) {
-		del_timer_sync(&entry->timer);
+		timer_delete_sync(&entry->timer);
 		lec_arp_clear_vccs(entry);
 		hlist_del(&entry->next);
 		lec_arp_put(entry);
@@ -1575,7 +1575,7 @@ static void lec_arp_expire_vcc(struct timer_list *t)
 	struct lec_arp_table *to_remove =3D from_timer(to_remove, t, timer);
 	struct lec_priv *priv =3D to_remove->priv;
=20
-	del_timer(&to_remove->timer);
+	timer_delete(&to_remove->timer);
=20
 	pr_debug("%p %p: vpi:%d vci:%d\n",
 		 to_remove, priv,
@@ -1843,16 +1843,16 @@ lec_arp_update(struct lec_priv *priv, const unsigned =
char *mac_addr,
 					  &priv->lec_arp_empty_ones, next) {
 			if (memcmp(entry->atm_addr, atm_addr, ATM_ESA_LEN) =3D=3D 0) {
 				hlist_del(&entry->next);
-				del_timer(&entry->timer);
+				timer_delete(&entry->timer);
 				tmp =3D lec_arp_find(priv, mac_addr);
 				if (tmp) {
-					del_timer(&tmp->timer);
+					timer_delete(&tmp->timer);
 					tmp->status =3D ESI_FORWARD_DIRECT;
 					memcpy(tmp->atm_addr, atm_addr, ATM_ESA_LEN);
 					tmp->vcc =3D entry->vcc;
 					tmp->old_push =3D entry->old_push;
 					tmp->last_used =3D jiffies;
-					del_timer(&entry->timer);
+					timer_delete(&entry->timer);
 					lec_arp_put(entry);
 					entry =3D tmp;
 				} else {
@@ -1883,7 +1883,7 @@ lec_arp_update(struct lec_priv *priv, const unsigned ch=
ar *mac_addr,
 		/* Temporary, changes before end of function */
 	}
 	memcpy(entry->atm_addr, atm_addr, ATM_ESA_LEN);
-	del_timer(&entry->timer);
+	timer_delete(&entry->timer);
 	for (i =3D 0; i < LEC_ARP_TABLE_SIZE; i++) {
 		hlist_for_each_entry(tmp,
 				     &priv->lec_arp_tables[i], next) {
@@ -1946,7 +1946,7 @@ lec_vcc_added(struct lec_priv *priv, const struct atmle=
c_ioc *ioc_data,
 		entry =3D make_entry(priv, bus_mac);
 		if (entry =3D=3D NULL)
 			goto out;
-		del_timer(&entry->timer);
+		timer_delete(&entry->timer);
 		memcpy(entry->atm_addr, ioc_data->atm_addr, ATM_ESA_LEN);
 		entry->recv_vcc =3D vcc;
 		entry->old_recv_push =3D old_push;
@@ -1988,7 +1988,7 @@ lec_vcc_added(struct lec_priv *priv, const struct atmle=
c_ioc *ioc_data,
 					 entry->recv_vcc ? entry->recv_vcc->
 					 vci : 0);
 				found_entry =3D 1;
-				del_timer(&entry->timer);
+				timer_delete(&entry->timer);
 				entry->vcc =3D vcc;
 				entry->old_push =3D old_push;
 				if (entry->status =3D=3D ESI_VC_PENDING) {
@@ -2172,7 +2172,7 @@ static void lec_vcc_close(struct lec_priv *priv, struct=
 atm_vcc *vcc)
 				  &priv->lec_arp_empty_ones, next) {
 		if (entry->vcc =3D=3D vcc) {
 			lec_arp_clear_vccs(entry);
-			del_timer(&entry->timer);
+			timer_delete(&entry->timer);
 			hlist_del(&entry->next);
 			lec_arp_put(entry);
 		}
@@ -2182,7 +2182,7 @@ static void lec_vcc_close(struct lec_priv *priv, struct=
 atm_vcc *vcc)
 				  &priv->lec_no_forward, next) {
 		if (entry->recv_vcc =3D=3D vcc) {
 			lec_arp_clear_vccs(entry);
-			del_timer(&entry->timer);
+			timer_delete(&entry->timer);
 			hlist_del(&entry->next);
 			lec_arp_put(entry);
 		}
@@ -2215,7 +2215,7 @@ lec_arp_check_empties(struct lec_priv *priv,
 	hlist_for_each_entry_safe(entry, next,
 				  &priv->lec_arp_empty_ones, next) {
 		if (vcc =3D=3D entry->vcc) {
-			del_timer(&entry->timer);
+			timer_delete(&entry->timer);
 			ether_addr_copy(entry->mac_addr, src);
 			entry->status =3D ESI_FORWARD_DIRECT;
 			entry->last_used =3D jiffies;
diff --git a/net/atm/mpc.c b/net/atm/mpc.c
index 12da0269275c..f6b447bba329 100644
--- a/net/atm/mpc.c
+++ b/net/atm/mpc.c
@@ -804,7 +804,7 @@ static int atm_mpoa_mpoad_attach(struct atm_vcc *vcc, int=
 arg)
 		/* This lets us now how our LECs are doing */
 		err =3D register_netdevice_notifier(&mpoa_notifier);
 		if (err < 0) {
-			del_timer(&mpc_timer);
+			timer_delete(&mpc_timer);
 			return err;
 		}
 	}
@@ -1495,7 +1495,7 @@ static void __exit atm_mpoa_cleanup(void)
=20
 	mpc_proc_clean();
=20
-	del_timer_sync(&mpc_timer);
+	timer_delete_sync(&mpc_timer);
 	unregister_netdevice_notifier(&mpoa_notifier);
 	deregister_atm_ioctl(&atm_ioctl_ops);
=20
diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 3ee7dba34310..b790bb92ed1c 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1071,11 +1071,11 @@ static int ax25_release(struct socket *sock)
 	}
 	if (ax25_dev) {
 		if (!ax25_dev->device_up) {
-			del_timer_sync(&ax25->timer);
-			del_timer_sync(&ax25->t1timer);
-			del_timer_sync(&ax25->t2timer);
-			del_timer_sync(&ax25->t3timer);
-			del_timer_sync(&ax25->idletimer);
+			timer_delete_sync(&ax25->timer);
+			timer_delete_sync(&ax25->t1timer);
+			timer_delete_sync(&ax25->t2timer);
+			timer_delete_sync(&ax25->t3timer);
+			timer_delete_sync(&ax25->idletimer);
 		}
 		netdev_put(ax25_dev->dev, &ax25->dev_tracker);
 		ax25_dev_put(ax25_dev);
diff --git a/net/ax25/ax25_ds_timer.c b/net/ax25/ax25_ds_timer.c
index c4f8adbf8144..8d9fba069001 100644
--- a/net/ax25/ax25_ds_timer.c
+++ b/net/ax25/ax25_ds_timer.c
@@ -44,7 +44,7 @@ void ax25_ds_setup_timer(ax25_dev *ax25_dev)
 void ax25_ds_del_timer(ax25_dev *ax25_dev)
 {
 	if (ax25_dev)
-		del_timer(&ax25_dev->dama.slave_timer);
+		timer_delete(&ax25_dev->dama.slave_timer);
 }
=20
 void ax25_ds_set_timer(ax25_dev *ax25_dev)
diff --git a/net/ax25/ax25_subr.c b/net/ax25/ax25_subr.c
index 9ff98f46dc6b..bff4b203a893 100644
--- a/net/ax25/ax25_subr.c
+++ b/net/ax25/ax25_subr.c
@@ -262,11 +262,11 @@ void ax25_disconnect(ax25_cb *ax25, int reason)
 	ax25_clear_queues(ax25);
=20
 	if (reason =3D=3D ENETUNREACH) {
-		del_timer_sync(&ax25->timer);
-		del_timer_sync(&ax25->t1timer);
-		del_timer_sync(&ax25->t2timer);
-		del_timer_sync(&ax25->t3timer);
-		del_timer_sync(&ax25->idletimer);
+		timer_delete_sync(&ax25->timer);
+		timer_delete_sync(&ax25->t1timer);
+		timer_delete_sync(&ax25->t2timer);
+		timer_delete_sync(&ax25->t3timer);
+		timer_delete_sync(&ax25->idletimer);
 	} else {
 		if (ax25->sk && !sock_flag(ax25->sk, SOCK_DESTROY))
 			ax25_stop_heartbeat(ax25);
diff --git a/net/ax25/ax25_timer.c b/net/ax25/ax25_timer.c
index 9f7cb0a7c73f..3891a3923d6c 100644
--- a/net/ax25/ax25_timer.c
+++ b/net/ax25/ax25_timer.c
@@ -65,7 +65,7 @@ void ax25_start_t3timer(ax25_cb *ax25)
 	if (ax25->t3 > 0)
 		mod_timer(&ax25->t3timer, jiffies + ax25->t3);
 	else
-		del_timer(&ax25->t3timer);
+		timer_delete(&ax25->t3timer);
 }
=20
 void ax25_start_idletimer(ax25_cb *ax25)
@@ -73,32 +73,32 @@ void ax25_start_idletimer(ax25_cb *ax25)
 	if (ax25->idle > 0)
 		mod_timer(&ax25->idletimer, jiffies + ax25->idle);
 	else
-		del_timer(&ax25->idletimer);
+		timer_delete(&ax25->idletimer);
 }
=20
 void ax25_stop_heartbeat(ax25_cb *ax25)
 {
-	del_timer(&ax25->timer);
+	timer_delete(&ax25->timer);
 }
=20
 void ax25_stop_t1timer(ax25_cb *ax25)
 {
-	del_timer(&ax25->t1timer);
+	timer_delete(&ax25->t1timer);
 }
=20
 void ax25_stop_t2timer(ax25_cb *ax25)
 {
-	del_timer(&ax25->t2timer);
+	timer_delete(&ax25->t2timer);
 }
=20
 void ax25_stop_t3timer(ax25_cb *ax25)
 {
-	del_timer(&ax25->t3timer);
+	timer_delete(&ax25->t3timer);
 }
=20
 void ax25_stop_idletimer(ax25_cb *ax25)
 {
-	del_timer(&ax25->idletimer);
+	timer_delete(&ax25->idletimer);
 }
=20
 int ax25_t1timer_running(ax25_cb *ax25)
diff --git a/net/batman-adv/tp_meter.c b/net/batman-adv/tp_meter.c
index 9fb14e40e156..adbadb436033 100644
--- a/net/batman-adv/tp_meter.c
+++ b/net/batman-adv/tp_meter.c
@@ -384,13 +384,13 @@ static void batadv_tp_sender_cleanup(struct batadv_priv=
 *bat_priv,
 	atomic_dec(&tp_vars->bat_priv->tp_num);
=20
 	/* kill the timer and remove its reference */
-	del_timer_sync(&tp_vars->timer);
+	timer_delete_sync(&tp_vars->timer);
 	/* the worker might have rearmed itself therefore we kill it again. Note
 	 * that if the worker should run again before invoking the following
-	 * del_timer(), it would not re-arm itself once again because the status
+	 * timer_delete(), it would not re-arm itself once again because the status
 	 * is OFF now
 	 */
-	del_timer(&tp_vars->timer);
+	timer_delete(&tp_vars->timer);
 	batadv_tp_vars_put(tp_vars);
 }
=20
diff --git a/net/bluetooth/hidp/core.c b/net/bluetooth/hidp/core.c
index 707f229f896a..fc5af8639b1e 100644
--- a/net/bluetooth/hidp/core.c
+++ b/net/bluetooth/hidp/core.c
@@ -433,7 +433,7 @@ static void hidp_set_timer(struct hidp_session *session)
 static void hidp_del_timer(struct hidp_session *session)
 {
 	if (session->idle_to > 0)
-		del_timer_sync(&session->timer);
+		timer_delete_sync(&session->timer);
 }
=20
 static void hidp_process_report(struct hidp_session *session, int type,
diff --git a/net/bluetooth/rfcomm/core.c b/net/bluetooth/rfcomm/core.c
index ad5177e3a69b..20ea7dba0a9a 100644
--- a/net/bluetooth/rfcomm/core.c
+++ b/net/bluetooth/rfcomm/core.c
@@ -254,7 +254,7 @@ static void rfcomm_session_clear_timer(struct rfcomm_sess=
ion *s)
 {
 	BT_DBG("session %p state %ld", s, s->state);
=20
-	del_timer_sync(&s->timer);
+	timer_delete_sync(&s->timer);
 }
=20
 /* ---- RFCOMM DLCs ---- */
@@ -281,7 +281,7 @@ static void rfcomm_dlc_clear_timer(struct rfcomm_dlc *d)
 {
 	BT_DBG("dlc %p state %ld", d, d->state);
=20
-	if (del_timer(&d->timer))
+	if (timer_delete(&d->timer))
 		rfcomm_dlc_put(d);
 }
=20
diff --git a/net/bridge/br_mdb.c b/net/bridge/br_mdb.c
index 7e1ad229e133..722203b98ff7 100644
--- a/net/bridge/br_mdb.c
+++ b/net/bridge/br_mdb.c
@@ -732,7 +732,7 @@ static int br_mdb_replace_group_sg(const struct br_mdb_co=
nfig *cfg,
 		mod_timer(&pg->timer,
 			  now + brmctx->multicast_membership_interval);
 	else
-		del_timer(&pg->timer);
+		timer_delete(&pg->timer);
=20
 	br_mdb_notify(cfg->br->dev, mp, pg, RTM_NEWMDB);
=20
@@ -853,7 +853,7 @@ static int br_mdb_add_group_src(const struct br_mdb_confi=
g *cfg,
 	    cfg->entry->state =3D=3D MDB_TEMPORARY)
 		mod_timer(&ent->timer, now + br_multicast_gmi(brmctx));
 	else
-		del_timer(&ent->timer);
+		timer_delete(&ent->timer);
=20
 	/* Install a (S, G) forwarding entry for the source. */
 	err =3D br_mdb_add_group_src_fwd(cfg, &src->addr, brmctx, extack);
@@ -953,7 +953,7 @@ static int br_mdb_replace_group_star_g(const struct br_md=
b_config *cfg,
 		mod_timer(&pg->timer,
 			  now + brmctx->multicast_membership_interval);
 	else
-		del_timer(&pg->timer);
+		timer_delete(&pg->timer);
=20
 	br_mdb_notify(cfg->br->dev, mp, pg, RTM_NEWMDB);
=20
diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index b2ae0d2434d2..dcbf058de1e3 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -546,7 +546,7 @@ static void br_multicast_fwd_src_add(struct net_bridge_gr=
oup_src *src)
 		return;
=20
 	/* the kernel is now responsible for removing this S,G */
-	del_timer(&sg->timer);
+	timer_delete(&sg->timer);
 	star_mp =3D br_mdb_ip_get(src->br, &src->pg->key.addr);
 	if (!star_mp)
 		return;
@@ -2015,9 +2015,9 @@ void br_multicast_port_ctx_init(struct net_bridge_port =
*port,
 void br_multicast_port_ctx_deinit(struct net_bridge_mcast_port *pmctx)
 {
 #if IS_ENABLED(CONFIG_IPV6)
-	del_timer_sync(&pmctx->ip6_mc_router_timer);
+	timer_delete_sync(&pmctx->ip6_mc_router_timer);
 #endif
-	del_timer_sync(&pmctx->ip4_mc_router_timer);
+	timer_delete_sync(&pmctx->ip4_mc_router_timer);
 }
=20
 int br_multicast_add_port(struct net_bridge_port *port)
@@ -2062,7 +2062,7 @@ static void br_multicast_enable(struct bridge_mcast_own=
_query *query)
 	query->startup_sent =3D 0;
=20
 	if (try_to_del_timer_sync(&query->timer) >=3D 0 ||
-	    del_timer(&query->timer))
+	    timer_delete(&query->timer))
 		mod_timer(&query->timer, jiffies);
 }
=20
@@ -2127,12 +2127,12 @@ static void __br_multicast_disable_port_ctx(struct ne=
t_bridge_mcast_port *pmctx)
 			br_multicast_find_del_pg(pmctx->port->br, pg);
=20
 	del |=3D br_ip4_multicast_rport_del(pmctx);
-	del_timer(&pmctx->ip4_mc_router_timer);
-	del_timer(&pmctx->ip4_own_query.timer);
+	timer_delete(&pmctx->ip4_mc_router_timer);
+	timer_delete(&pmctx->ip4_own_query.timer);
 	del |=3D br_ip6_multicast_rport_del(pmctx);
 #if IS_ENABLED(CONFIG_IPV6)
-	del_timer(&pmctx->ip6_mc_router_timer);
-	del_timer(&pmctx->ip6_own_query.timer);
+	timer_delete(&pmctx->ip6_mc_router_timer);
+	timer_delete(&pmctx->ip6_own_query.timer);
 #endif
 	br_multicast_rport_del_notify(pmctx, del);
 }
@@ -4199,15 +4199,15 @@ void br_multicast_open(struct net_bridge *br)
=20
 static void __br_multicast_stop(struct net_bridge_mcast *brmctx)
 {
-	del_timer_sync(&brmctx->ip4_mc_router_timer);
-	del_timer_sync(&brmctx->ip4_other_query.timer);
-	del_timer_sync(&brmctx->ip4_other_query.delay_timer);
-	del_timer_sync(&brmctx->ip4_own_query.timer);
+	timer_delete_sync(&brmctx->ip4_mc_router_timer);
+	timer_delete_sync(&brmctx->ip4_other_query.timer);
+	timer_delete_sync(&brmctx->ip4_other_query.delay_timer);
+	timer_delete_sync(&brmctx->ip4_own_query.timer);
 #if IS_ENABLED(CONFIG_IPV6)
-	del_timer_sync(&brmctx->ip6_mc_router_timer);
-	del_timer_sync(&brmctx->ip6_other_query.timer);
-	del_timer_sync(&brmctx->ip6_other_query.delay_timer);
-	del_timer_sync(&brmctx->ip6_own_query.timer);
+	timer_delete_sync(&brmctx->ip6_mc_router_timer);
+	timer_delete_sync(&brmctx->ip6_other_query.timer);
+	timer_delete_sync(&brmctx->ip6_other_query.delay_timer);
+	timer_delete_sync(&brmctx->ip6_own_query.timer);
 #endif
 }
=20
@@ -4384,9 +4384,9 @@ int br_multicast_set_router(struct net_bridge_mcast *br=
mctx, unsigned long val)
 	case MDB_RTR_TYPE_DISABLED:
 	case MDB_RTR_TYPE_PERM:
 		br_mc_router_state_change(brmctx->br, val =3D=3D MDB_RTR_TYPE_PERM);
-		del_timer(&brmctx->ip4_mc_router_timer);
+		timer_delete(&brmctx->ip4_mc_router_timer);
 #if IS_ENABLED(CONFIG_IPV6)
-		del_timer(&brmctx->ip6_mc_router_timer);
+		timer_delete(&brmctx->ip6_mc_router_timer);
 #endif
 		brmctx->multicast_router =3D val;
 		err =3D 0;
@@ -4455,10 +4455,10 @@ int br_multicast_set_port_router(struct net_bridge_mc=
ast_port *pmctx,
 	case MDB_RTR_TYPE_DISABLED:
 		pmctx->multicast_router =3D MDB_RTR_TYPE_DISABLED;
 		del |=3D br_ip4_multicast_rport_del(pmctx);
-		del_timer(&pmctx->ip4_mc_router_timer);
+		timer_delete(&pmctx->ip4_mc_router_timer);
 		del |=3D br_ip6_multicast_rport_del(pmctx);
 #if IS_ENABLED(CONFIG_IPV6)
-		del_timer(&pmctx->ip6_mc_router_timer);
+		timer_delete(&pmctx->ip6_mc_router_timer);
 #endif
 		br_multicast_rport_del_notify(pmctx, del);
 		break;
@@ -4470,10 +4470,10 @@ int br_multicast_set_port_router(struct net_bridge_mc=
ast_port *pmctx,
 		break;
 	case MDB_RTR_TYPE_PERM:
 		pmctx->multicast_router =3D MDB_RTR_TYPE_PERM;
-		del_timer(&pmctx->ip4_mc_router_timer);
+		timer_delete(&pmctx->ip4_mc_router_timer);
 		br_ip4_multicast_add_router(brmctx, pmctx);
 #if IS_ENABLED(CONFIG_IPV6)
-		del_timer(&pmctx->ip6_mc_router_timer);
+		timer_delete(&pmctx->ip6_mc_router_timer);
 #endif
 		br_ip6_multicast_add_router(brmctx, pmctx);
 		break;
diff --git a/net/bridge/br_stp.c b/net/bridge/br_stp.c
index 7d27b2e6038f..024210f95468 100644
--- a/net/bridge/br_stp.c
+++ b/net/bridge/br_stp.c
@@ -198,7 +198,7 @@ void br_become_root_bridge(struct net_bridge *br)
 	br->hello_time =3D br->bridge_hello_time;
 	br->forward_delay =3D br->bridge_forward_delay;
 	br_topology_change_detection(br);
-	del_timer(&br->tcn_timer);
+	timer_delete(&br->tcn_timer);
=20
 	if (br->dev->flags & IFF_UP) {
 		br_config_bpdu_generation(br);
@@ -363,7 +363,7 @@ static int br_supersedes_port_info(const struct net_bridg=
e_port *p,
 static void br_topology_change_acknowledged(struct net_bridge *br)
 {
 	br->topology_change_detected =3D 0;
-	del_timer(&br->tcn_timer);
+	timer_delete(&br->tcn_timer);
 }
=20
 /* called under bridge lock */
@@ -439,7 +439,7 @@ static void br_make_blocking(struct net_bridge_port *p)
 		br_set_state(p, BR_STATE_BLOCKING);
 		br_ifinfo_notify(RTM_NEWLINK, NULL, p);
=20
-		del_timer(&p->forward_delay_timer);
+		timer_delete(&p->forward_delay_timer);
 	}
 }
=20
@@ -454,7 +454,7 @@ static void br_make_forwarding(struct net_bridge_port *p)
 	if (br->stp_enabled =3D=3D BR_NO_STP || br->forward_delay =3D=3D 0) {
 		br_set_state(p, BR_STATE_FORWARDING);
 		br_topology_change_detection(br);
-		del_timer(&p->forward_delay_timer);
+		timer_delete(&p->forward_delay_timer);
 	} else if (br->stp_enabled =3D=3D BR_KERNEL_STP)
 		br_set_state(p, BR_STATE_LISTENING);
 	else
@@ -483,7 +483,7 @@ void br_port_state_selection(struct net_bridge *br)
 				p->topology_change_ack =3D 0;
 				br_make_forwarding(p);
 			} else if (br_is_designated_port(p)) {
-				del_timer(&p->message_age_timer);
+				timer_delete(&p->message_age_timer);
 				br_make_forwarding(p);
 			} else {
 				p->config_pending =3D 0;
@@ -533,9 +533,9 @@ void br_received_config_bpdu(struct net_bridge_port *p,
 		br_port_state_selection(br);
=20
 		if (!br_is_root_bridge(br) && was_root) {
-			del_timer(&br->hello_timer);
+			timer_delete(&br->hello_timer);
 			if (br->topology_change_detected) {
-				del_timer(&br->topology_change_timer);
+				timer_delete(&br->topology_change_timer);
 				br_transmit_tcn(br);
=20
 				mod_timer(&br->tcn_timer,
diff --git a/net/bridge/br_stp_if.c b/net/bridge/br_stp_if.c
index 75204d36d7f9..c20a41bf253b 100644
--- a/net/bridge/br_stp_if.c
+++ b/net/bridge/br_stp_if.c
@@ -81,9 +81,9 @@ void br_stp_disable_bridge(struct net_bridge *br)
 	br->topology_change_detected =3D 0;
 	spin_unlock_bh(&br->lock);
=20
-	del_timer_sync(&br->hello_timer);
-	del_timer_sync(&br->topology_change_timer);
-	del_timer_sync(&br->tcn_timer);
+	timer_delete_sync(&br->hello_timer);
+	timer_delete_sync(&br->topology_change_timer);
+	timer_delete_sync(&br->tcn_timer);
 	cancel_delayed_work_sync(&br->gc_work);
 }
=20
@@ -109,9 +109,9 @@ void br_stp_disable_port(struct net_bridge_port *p)
=20
 	br_ifinfo_notify(RTM_NEWLINK, NULL, p);
=20
-	del_timer(&p->message_age_timer);
-	del_timer(&p->forward_delay_timer);
-	del_timer(&p->hold_timer);
+	timer_delete(&p->message_age_timer);
+	timer_delete(&p->forward_delay_timer);
+	timer_delete(&p->hold_timer);
=20
 	if (!rcu_access_pointer(p->backup_port))
 		br_fdb_delete_by_port(br, p, 0, 0);
diff --git a/net/can/af_can.c b/net/can/af_can.c
index 4c059e41c831..4aab7033c933 100644
--- a/net/can/af_can.c
+++ b/net/can/af_can.c
@@ -825,7 +825,7 @@ static void can_pernet_exit(struct net *net)
 	if (IS_ENABLED(CONFIG_PROC_FS)) {
 		can_remove_proc(net);
 		if (stats_timer)
-			del_timer_sync(&net->can.stattimer);
+			timer_delete_sync(&net->can.stattimer);
 	}
=20
 	kfree(net->can.rx_alldev_list);
diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
index 212f0a048cab..8a7ce640f74d 100644
--- a/net/core/drop_monitor.c
+++ b/net/core/drop_monitor.c
@@ -1088,7 +1088,7 @@ static int net_dm_hw_monitor_start(struct netlink_ext_a=
ck *extack)
 		struct per_cpu_dm_data *hw_data =3D &per_cpu(dm_hw_cpu_data, cpu);
 		struct sk_buff *skb;
=20
-		del_timer_sync(&hw_data->send_timer);
+		timer_delete_sync(&hw_data->send_timer);
 		cancel_work_sync(&hw_data->dm_alert_work);
 		while ((skb =3D __skb_dequeue(&hw_data->drop_queue))) {
 			struct devlink_trap_metadata *hw_metadata;
@@ -1122,7 +1122,7 @@ static void net_dm_hw_monitor_stop(struct netlink_ext_a=
ck *extack)
 		struct per_cpu_dm_data *hw_data =3D &per_cpu(dm_hw_cpu_data, cpu);
 		struct sk_buff *skb;
=20
-		del_timer_sync(&hw_data->send_timer);
+		timer_delete_sync(&hw_data->send_timer);
 		cancel_work_sync(&hw_data->dm_alert_work);
 		while ((skb =3D __skb_dequeue(&hw_data->drop_queue))) {
 			struct devlink_trap_metadata *hw_metadata;
@@ -1183,7 +1183,7 @@ static int net_dm_trace_on_set(struct netlink_ext_ack *=
extack)
 		struct per_cpu_dm_data *data =3D &per_cpu(dm_cpu_data, cpu);
 		struct sk_buff *skb;
=20
-		del_timer_sync(&data->send_timer);
+		timer_delete_sync(&data->send_timer);
 		cancel_work_sync(&data->dm_alert_work);
 		while ((skb =3D __skb_dequeue(&data->drop_queue)))
 			consume_skb(skb);
@@ -1211,7 +1211,7 @@ static void net_dm_trace_off_set(void)
 		struct per_cpu_dm_data *data =3D &per_cpu(dm_cpu_data, cpu);
 		struct sk_buff *skb;
=20
-		del_timer_sync(&data->send_timer);
+		timer_delete_sync(&data->send_timer);
 		cancel_work_sync(&data->dm_alert_work);
 		while ((skb =3D __skb_dequeue(&data->drop_queue)))
 			consume_skb(skb);
diff --git a/net/core/gen_estimator.c b/net/core/gen_estimator.c
index 412816076b8b..2b821b9a8699 100644
--- a/net/core/gen_estimator.c
+++ b/net/core/gen_estimator.c
@@ -177,7 +177,7 @@ int gen_new_estimator(struct gnet_stats_basic_sync *bstat=
s,
 		spin_lock_bh(lock);
 	old =3D rcu_dereference_protected(*rate_est, 1);
 	if (old) {
-		del_timer_sync(&old->timer);
+		timer_delete_sync(&old->timer);
 		est->avbps =3D old->avbps;
 		est->avpps =3D old->avpps;
 	}
diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index 0738aa6cca25..a07249b59ae1 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -309,7 +309,7 @@ static void neigh_add_timer(struct neighbour *n, unsigned=
 long when)
 static int neigh_del_timer(struct neighbour *n)
 {
 	if ((n->nud_state & NUD_IN_TIMER) &&
-	    del_timer(&n->timer)) {
+	    timer_delete(&n->timer)) {
 		neigh_release(n);
 		return 1;
 	}
@@ -427,7 +427,7 @@ static int __neigh_ifdown(struct neigh_table *tbl, struct=
 net_device *dev,
 	pneigh_queue_purge(&tbl->proxy_queue, dev ? dev_net(dev) : NULL,
 			   tbl->family);
 	if (skb_queue_empty_lockless(&tbl->proxy_queue))
-		del_timer_sync(&tbl->proxy_timer);
+		timer_delete_sync(&tbl->proxy_timer);
 	return 0;
 }
=20
@@ -1597,7 +1597,7 @@ static void neigh_proxy_process(struct timer_list *t)
 		} else if (!sched_next || tdif < sched_next)
 			sched_next =3D tdif;
 	}
-	del_timer(&tbl->proxy_timer);
+	timer_delete(&tbl->proxy_timer);
 	if (sched_next)
 		mod_timer(&tbl->proxy_timer, jiffies + sched_next);
 	spin_unlock(&tbl->proxy_queue.lock);
@@ -1628,7 +1628,7 @@ void pneigh_enqueue(struct neigh_table *tbl, struct nei=
gh_parms *p,
 	NEIGH_CB(skb)->flags |=3D LOCALLY_ENQUEUED;
=20
 	spin_lock(&tbl->proxy_queue.lock);
-	if (del_timer(&tbl->proxy_timer)) {
+	if (timer_delete(&tbl->proxy_timer)) {
 		if (time_before(tbl->proxy_timer.expires, sched_next))
 			sched_next =3D tbl->proxy_timer.expires;
 	}
@@ -1786,7 +1786,7 @@ int neigh_table_clear(int index, struct neigh_table *tb=
l)
 	/* It is not clean... Fix it to unload IPv6 module safely */
 	cancel_delayed_work_sync(&tbl->managed_work);
 	cancel_delayed_work_sync(&tbl->gc_work);
-	del_timer_sync(&tbl->proxy_timer);
+	timer_delete_sync(&tbl->proxy_timer);
 	pneigh_queue_purge(&tbl->proxy_queue, NULL, tbl->family);
 	neigh_ifdown(tbl, NULL);
 	if (atomic_read(&tbl->entries))
diff --git a/net/core/sock.c b/net/core/sock.c
index 323892066def..f67a3c5b0988 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -3598,14 +3598,14 @@ EXPORT_SYMBOL(sk_reset_timer);
=20
 void sk_stop_timer(struct sock *sk, struct timer_list* timer)
 {
-	if (del_timer(timer))
+	if (timer_delete(timer))
 		__sock_put(sk);
 }
 EXPORT_SYMBOL(sk_stop_timer);
=20
 void sk_stop_timer_sync(struct sock *sk, struct timer_list *timer)
 {
-	if (del_timer_sync(timer))
+	if (timer_delete_sync(timer))
 		__sock_put(sk);
 }
 EXPORT_SYMBOL(sk_stop_timer_sync);
diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
index 2c394c364cb9..ca7d539b3846 100644
--- a/net/ipv4/igmp.c
+++ b/net/ipv4/igmp.c
@@ -205,7 +205,7 @@ static void ip_sf_list_clear_all(struct ip_sf_list *psf)
 static void igmp_stop_timer(struct ip_mc_list *im)
 {
 	spin_lock_bh(&im->lock);
-	if (del_timer(&im->timer))
+	if (timer_delete(&im->timer))
 		refcount_dec(&im->refcnt);
 	im->tm_running =3D 0;
 	im->reporter =3D 0;
@@ -251,7 +251,7 @@ static void igmp_mod_timer(struct ip_mc_list *im, int max=
_delay)
 {
 	spin_lock_bh(&im->lock);
 	im->unsolicit_count =3D 0;
-	if (del_timer(&im->timer)) {
+	if (timer_delete(&im->timer)) {
 		if ((long)(im->timer.expires-jiffies) < max_delay) {
 			add_timer(&im->timer);
 			im->tm_running =3D 1;
@@ -974,7 +974,7 @@ static bool igmp_heard_query(struct in_device *in_dev, st=
ruct sk_buff *skb,
 		}
 		/* cancel the interface change timer */
 		WRITE_ONCE(in_dev->mr_ifc_count, 0);
-		if (del_timer(&in_dev->mr_ifc_timer))
+		if (timer_delete(&in_dev->mr_ifc_timer))
 			__in_dev_put(in_dev);
 		/* clear deleted report items */
 		igmpv3_clear_delrec(in_dev);
@@ -1830,10 +1830,10 @@ void ip_mc_down(struct in_device *in_dev)
=20
 #ifdef CONFIG_IP_MULTICAST
 	WRITE_ONCE(in_dev->mr_ifc_count, 0);
-	if (del_timer(&in_dev->mr_ifc_timer))
+	if (timer_delete(&in_dev->mr_ifc_timer))
 		__in_dev_put(in_dev);
 	in_dev->mr_gq_running =3D 0;
-	if (del_timer(&in_dev->mr_gq_timer))
+	if (timer_delete(&in_dev->mr_gq_timer))
 		__in_dev_put(in_dev);
 #endif
=20
diff --git a/net/ipv4/inet_fragment.c b/net/ipv4/inet_fragment.c
index 19fae4811ab2..470ab17ceb51 100644
--- a/net/ipv4/inet_fragment.c
+++ b/net/ipv4/inet_fragment.c
@@ -133,7 +133,7 @@ static void inet_frags_free_cb(void *ptr, void *arg)
 	struct inet_frag_queue *fq =3D ptr;
 	int count;
=20
-	count =3D del_timer_sync(&fq->timer) ? 1 : 0;
+	count =3D timer_delete_sync(&fq->timer) ? 1 : 0;
=20
 	spin_lock_bh(&fq->lock);
 	fq->flags |=3D INET_FRAG_DROP;
@@ -227,7 +227,7 @@ EXPORT_SYMBOL(fqdir_exit);
=20
 void inet_frag_kill(struct inet_frag_queue *fq, int *refs)
 {
-	if (del_timer(&fq->timer))
+	if (timer_delete(&fq->timer))
 		(*refs)++;
=20
 	if (!(fq->flags & INET_FRAG_COMPLETE)) {
@@ -297,7 +297,7 @@ void inet_frag_destroy(struct inet_frag_queue *q)
 	reason =3D (q->flags & INET_FRAG_DROP) ?
 			SKB_DROP_REASON_FRAG_REASM_TIMEOUT :
 			SKB_CONSUMED;
-	WARN_ON(del_timer(&q->timer) !=3D 0);
+	WARN_ON(timer_delete(&q->timer) !=3D 0);
=20
 	/* Release all fragment data. */
 	fqdir =3D q->fqdir;
diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index b81c8131e23f..a8b04d4abcaa 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -1289,7 +1289,7 @@ static int ipmr_mfc_add(struct net *net, struct mr_tabl=
e *mrt,
 		}
 	}
 	if (list_empty(&mrt->mfc_unres_queue))
-		del_timer(&mrt->ipmr_expire_timer);
+		timer_delete(&mrt->ipmr_expire_timer);
 	spin_unlock_bh(&mfc_unres_lock);
=20
 	if (found) {
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index c3b908fccbc1..2cffb8f4a2bc 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -313,7 +313,7 @@ static inline bool addrconf_link_ready(const struct net_d=
evice *dev)
=20
 static void addrconf_del_rs_timer(struct inet6_dev *idev)
 {
-	if (del_timer(&idev->rs_timer))
+	if (timer_delete(&idev->rs_timer))
 		__in6_dev_put(idev);
 }
=20
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index c134ba202c4c..bf727149fdec 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -2383,7 +2383,7 @@ void fib6_run_gc(unsigned long expires, struct net *net=
, bool force)
 			  round_jiffies(now
 					+ net->ipv6.sysctl.ip6_rt_gc_interval));
 	else
-		del_timer(&net->ipv6.ip6_fib_timer);
+		timer_delete(&net->ipv6.ip6_fib_timer);
 	spin_unlock_bh(&net->ipv6.fib6_gc_lock);
 }
=20
@@ -2470,7 +2470,7 @@ static void fib6_net_exit(struct net *net)
 {
 	unsigned int i;
=20
-	del_timer_sync(&net->ipv6.ip6_fib_timer);
+	timer_delete_sync(&net->ipv6.ip6_fib_timer);
=20
 	for (i =3D 0; i < FIB6_TABLE_HASHSZ; i++) {
 		struct hlist_head *head =3D &net->ipv6.fib_table_hash[i];
diff --git a/net/ipv6/ip6_flowlabel.c b/net/ipv6/ip6_flowlabel.c
index eca07e10e21f..a3ff575798dd 100644
--- a/net/ipv6/ip6_flowlabel.c
+++ b/net/ipv6/ip6_flowlabel.c
@@ -907,6 +907,6 @@ int ip6_flowlabel_init(void)
 void ip6_flowlabel_cleanup(void)
 {
 	static_key_deferred_flush(&ipv6_flowlabel_exclusive);
-	del_timer(&ip6_fl_gc_timer);
+	timer_delete(&ip6_fl_gc_timer);
 	unregister_pernet_subsys(&ip6_flowlabel_net_ops);
 }
diff --git a/net/ipv6/ip6mr.c b/net/ipv6/ip6mr.c
index e8ade93a0f0e..b413c9c8a21c 100644
--- a/net/ipv6/ip6mr.c
+++ b/net/ipv6/ip6mr.c
@@ -1526,7 +1526,7 @@ static int ip6mr_mfc_add(struct net *net, struct mr_tab=
le *mrt,
 		}
 	}
 	if (list_empty(&mrt->mfc_unres_queue))
-		del_timer(&mrt->ipmr_expire_timer);
+		timer_delete(&mrt->ipmr_expire_timer);
 	spin_unlock_bh(&mfc_unres_lock);
=20
 	if (found) {
diff --git a/net/lapb/lapb_iface.c b/net/lapb/lapb_iface.c
index 0971ca48ba15..a0596e1f91da 100644
--- a/net/lapb/lapb_iface.c
+++ b/net/lapb/lapb_iface.c
@@ -194,8 +194,8 @@ int lapb_unregister(struct net_device *dev)
 	spin_unlock_bh(&lapb->lock);
=20
 	/* Wait for running timers to stop */
-	del_timer_sync(&lapb->t1timer);
-	del_timer_sync(&lapb->t2timer);
+	timer_delete_sync(&lapb->t1timer);
+	timer_delete_sync(&lapb->t2timer);
=20
 	__lapb_remove_cb(lapb);
=20
diff --git a/net/lapb/lapb_timer.c b/net/lapb/lapb_timer.c
index 5be68869064d..5b3f3b444d19 100644
--- a/net/lapb/lapb_timer.c
+++ b/net/lapb/lapb_timer.c
@@ -35,7 +35,7 @@ static void lapb_t2timer_expiry(struct timer_list *);
=20
 void lapb_start_t1timer(struct lapb_cb *lapb)
 {
-	del_timer(&lapb->t1timer);
+	timer_delete(&lapb->t1timer);
=20
 	lapb->t1timer.function =3D lapb_t1timer_expiry;
 	lapb->t1timer.expires  =3D jiffies + lapb->t1;
@@ -46,7 +46,7 @@ void lapb_start_t1timer(struct lapb_cb *lapb)
=20
 void lapb_start_t2timer(struct lapb_cb *lapb)
 {
-	del_timer(&lapb->t2timer);
+	timer_delete(&lapb->t2timer);
=20
 	lapb->t2timer.function =3D lapb_t2timer_expiry;
 	lapb->t2timer.expires  =3D jiffies + lapb->t2;
@@ -58,13 +58,13 @@ void lapb_start_t2timer(struct lapb_cb *lapb)
 void lapb_stop_t1timer(struct lapb_cb *lapb)
 {
 	lapb->t1timer_running =3D false;
-	del_timer(&lapb->t1timer);
+	timer_delete(&lapb->t1timer);
 }
=20
 void lapb_stop_t2timer(struct lapb_cb *lapb)
 {
 	lapb->t2timer_running =3D false;
-	del_timer(&lapb->t2timer);
+	timer_delete(&lapb->t2timer);
 }
=20
 int lapb_t1timer_running(struct lapb_cb *lapb)
diff --git a/net/llc/llc_c_ac.c b/net/llc/llc_c_ac.c
index 40ca3c1e42a2..7e8fc710c590 100644
--- a/net/llc/llc_c_ac.c
+++ b/net/llc/llc_c_ac.c
@@ -51,7 +51,7 @@ int llc_conn_ac_clear_remote_busy(struct sock *sk, struct s=
k_buff *skb)
 		struct llc_pdu_sn *pdu =3D llc_pdu_sn_hdr(skb);
=20
 		llc->remote_busy_flag =3D 0;
-		del_timer(&llc->busy_state_timer.timer);
+		timer_delete(&llc->busy_state_timer.timer);
 		nr =3D LLC_I_GET_NR(pdu);
 		llc_conn_resend_i_pdu_as_cmd(sk, nr, 0);
 	}
@@ -191,7 +191,7 @@ int llc_conn_ac_stop_rej_tmr_if_data_flag_eq_2(struct soc=
k *sk,
 	struct llc_sock *llc =3D llc_sk(sk);
=20
 	if (llc->data_flag =3D=3D 2)
-		del_timer(&llc->rej_sent_timer.timer);
+		timer_delete(&llc->rej_sent_timer.timer);
 	return 0;
 }
=20
@@ -1111,9 +1111,9 @@ int llc_conn_ac_stop_other_timers(struct sock *sk, stru=
ct sk_buff *skb)
 {
 	struct llc_sock *llc =3D llc_sk(sk);
=20
-	del_timer(&llc->rej_sent_timer.timer);
-	del_timer(&llc->pf_cycle_timer.timer);
-	del_timer(&llc->busy_state_timer.timer);
+	timer_delete(&llc->rej_sent_timer.timer);
+	timer_delete(&llc->pf_cycle_timer.timer);
+	timer_delete(&llc->busy_state_timer.timer);
 	llc->ack_must_be_send =3D 0;
 	llc->ack_pf =3D 0;
 	return 0;
@@ -1149,7 +1149,7 @@ int llc_conn_ac_start_ack_tmr_if_not_running(struct soc=
k *sk,
=20
 int llc_conn_ac_stop_ack_timer(struct sock *sk, struct sk_buff *skb)
 {
-	del_timer(&llc_sk(sk)->ack_timer.timer);
+	timer_delete(&llc_sk(sk)->ack_timer.timer);
 	return 0;
 }
=20
@@ -1157,14 +1157,14 @@ int llc_conn_ac_stop_p_timer(struct sock *sk, struct =
sk_buff *skb)
 {
 	struct llc_sock *llc =3D llc_sk(sk);
=20
-	del_timer(&llc->pf_cycle_timer.timer);
+	timer_delete(&llc->pf_cycle_timer.timer);
 	llc_conn_set_p_flag(sk, 0);
 	return 0;
 }
=20
 int llc_conn_ac_stop_rej_timer(struct sock *sk, struct sk_buff *skb)
 {
-	del_timer(&llc_sk(sk)->rej_sent_timer.timer);
+	timer_delete(&llc_sk(sk)->rej_sent_timer.timer);
 	return 0;
 }
=20
@@ -1180,7 +1180,7 @@ int llc_conn_ac_upd_nr_received(struct sock *sk, struct=
 sk_buff *skb)
 	/* On loopback we don't queue I frames in unack_pdu_q queue. */
 	if (acked > 0 || (llc->dev->flags & IFF_LOOPBACK)) {
 		llc->retry_count =3D 0;
-		del_timer(&llc->ack_timer.timer);
+		timer_delete(&llc->ack_timer.timer);
 		if (llc->failed_data_req) {
 			/* already, we did not accept data from upper layer
 			 * (tx_window full or unacceptable state). Now, we
diff --git a/net/llc/llc_conn.c b/net/llc/llc_conn.c
index afc6974eafda..5c0ac243b248 100644
--- a/net/llc/llc_conn.c
+++ b/net/llc/llc_conn.c
@@ -949,15 +949,15 @@ void llc_sk_stop_all_timers(struct sock *sk, bool sync)
 	struct llc_sock *llc =3D llc_sk(sk);
=20
 	if (sync) {
-		del_timer_sync(&llc->pf_cycle_timer.timer);
-		del_timer_sync(&llc->ack_timer.timer);
-		del_timer_sync(&llc->rej_sent_timer.timer);
-		del_timer_sync(&llc->busy_state_timer.timer);
+		timer_delete_sync(&llc->pf_cycle_timer.timer);
+		timer_delete_sync(&llc->ack_timer.timer);
+		timer_delete_sync(&llc->rej_sent_timer.timer);
+		timer_delete_sync(&llc->busy_state_timer.timer);
 	} else {
-		del_timer(&llc->pf_cycle_timer.timer);
-		del_timer(&llc->ack_timer.timer);
-		del_timer(&llc->rej_sent_timer.timer);
-		del_timer(&llc->busy_state_timer.timer);
+		timer_delete(&llc->pf_cycle_timer.timer);
+		timer_delete(&llc->ack_timer.timer);
+		timer_delete(&llc->rej_sent_timer.timer);
+		timer_delete(&llc->busy_state_timer.timer);
 	}
=20
 	llc->ack_must_be_send =3D 0;
diff --git a/net/mac80211/agg-rx.c b/net/mac80211/agg-rx.c
index aeb99d102c6e..85612234742a 100644
--- a/net/mac80211/agg-rx.c
+++ b/net/mac80211/agg-rx.c
@@ -103,13 +103,13 @@ void __ieee80211_stop_rx_ba_session(struct sta_info *st=
a, u16 tid,
 	if (!tid_rx)
 		return;
=20
-	del_timer_sync(&tid_rx->session_timer);
+	timer_delete_sync(&tid_rx->session_timer);
=20
 	/* make sure ieee80211_sta_reorder_release() doesn't re-arm the timer */
 	spin_lock_bh(&tid_rx->reorder_lock);
 	tid_rx->removed =3D true;
 	spin_unlock_bh(&tid_rx->reorder_lock);
-	del_timer_sync(&tid_rx->reorder_timer);
+	timer_delete_sync(&tid_rx->reorder_timer);
=20
 	call_rcu(&tid_rx->rcu_head, ieee80211_free_tid_rx);
 }
diff --git a/net/mac80211/agg-tx.c b/net/mac80211/agg-tx.c
index 63a5e48291ac..8dc8c3c96b96 100644
--- a/net/mac80211/agg-tx.c
+++ b/net/mac80211/agg-tx.c
@@ -362,8 +362,8 @@ int __ieee80211_stop_tx_ba_session(struct sta_info *sta, =
u16 tid,
 	ht_dbg(sta->sdata, "Tx BA session stop requested for %pM tid %u\n",
 	       sta->sta.addr, tid);
=20
-	del_timer_sync(&tid_tx->addba_resp_timer);
-	del_timer_sync(&tid_tx->session_timer);
+	timer_delete_sync(&tid_tx->addba_resp_timer);
+	timer_delete_sync(&tid_tx->session_timer);
=20
 	/*
 	 * After this packets are no longer handed right through
@@ -1002,7 +1002,7 @@ void ieee80211_process_addba_resp(struct ieee80211_loca=
l *local,
 		return;
 	}
=20
-	del_timer_sync(&tid_tx->addba_resp_timer);
+	timer_delete_sync(&tid_tx->addba_resp_timer);
=20
 	ht_dbg(sta->sdata, "switched off addBA timer for %pM tid %d\n",
 	       sta->sta.addr, tid);
diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index 05a945df3259..4246d168374f 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -1844,7 +1844,7 @@ int ieee80211_ibss_leave(struct ieee80211_sub_if_data *=
sdata)
=20
 	skb_queue_purge(&sdata->skb_queue);
=20
-	del_timer_sync(&sdata->u.ibss.timer);
+	timer_delete_sync(&sdata->u.ibss.timer);
=20
 	return 0;
 }
diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index b0423046028c..f0f4a250b10e 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -526,7 +526,7 @@ static void ieee80211_do_stop(struct ieee80211_sub_if_dat=
a *sdata, bool going_do
 		netif_addr_unlock_bh(sdata->dev);
 	}
=20
-	del_timer_sync(&local->dynamic_ps_timer);
+	timer_delete_sync(&local->dynamic_ps_timer);
 	wiphy_work_cancel(local->hw.wiphy, &local->dynamic_ps_enable_work);
=20
 	WARN(ieee80211_vif_is_mld(&sdata->vif),
diff --git a/net/mac80211/led.c b/net/mac80211/led.c
index 2dc732147e85..885fa6aa3fc1 100644
--- a/net/mac80211/led.c
+++ b/net/mac80211/led.c
@@ -342,7 +342,7 @@ static void ieee80211_stop_tpt_led_trig(struct ieee80211_=
local *local)
 		return;
=20
 	tpt_trig->running =3D false;
-	del_timer_sync(&tpt_trig->timer);
+	timer_delete_sync(&tpt_trig->timer);
=20
 	led_trigger_event(&local->tpt_led, LED_OFF);
 }
diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index 974081324aa4..7257f5610af5 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -706,7 +706,7 @@ void ieee80211_mesh_root_setup(struct ieee80211_if_mesh *=
ifmsh)
 	else {
 		clear_bit(MESH_WORK_ROOT, &ifmsh->wrkq_flags);
 		/* stop running timer */
-		del_timer_sync(&ifmsh->mesh_path_root_timer);
+		timer_delete_sync(&ifmsh->mesh_path_root_timer);
 	}
 }
=20
@@ -1241,9 +1241,9 @@ void ieee80211_stop_mesh(struct ieee80211_sub_if_data *=
sdata)
 	local->total_ps_buffered -=3D skb_queue_len(&ifmsh->ps.bc_buf);
 	skb_queue_purge(&ifmsh->ps.bc_buf);
=20
-	del_timer_sync(&sdata->u.mesh.housekeeping_timer);
-	del_timer_sync(&sdata->u.mesh.mesh_path_root_timer);
-	del_timer_sync(&sdata->u.mesh.mesh_path_timer);
+	timer_delete_sync(&sdata->u.mesh.housekeeping_timer);
+	timer_delete_sync(&sdata->u.mesh.mesh_path_root_timer);
+	timer_delete_sync(&sdata->u.mesh.mesh_path_timer);
=20
 	/* clear any mesh work (for next join) we may have accrued */
 	ifmsh->wrkq_flags =3D 0;
diff --git a/net/mac80211/mesh_plink.c b/net/mac80211/mesh_plink.c
index 5a0156e11c91..96e0a861886a 100644
--- a/net/mac80211/mesh_plink.c
+++ b/net/mac80211/mesh_plink.c
@@ -417,7 +417,7 @@ u64 mesh_plink_deactivate(struct sta_info *sta)
 	}
 	spin_unlock_bh(&sta->mesh->plink_lock);
 	if (!sdata->u.mesh.user_mpm)
-		del_timer_sync(&sta->mesh->plink_timer);
+		timer_delete_sync(&sta->mesh->plink_timer);
 	mesh_path_flush_by_nexthop(sta);
=20
 	/* make sure no readers can access nexthop sta from here on */
@@ -666,7 +666,7 @@ void mesh_plink_timer(struct timer_list *t)
=20
 	/*
 	 * This STA is valid because sta_info_destroy() will
-	 * del_timer_sync() this timer after having made sure
+	 * timer_delete_sync() this timer after having made sure
 	 * it cannot be re-added (by deleting the plink.)
 	 */
 	sta =3D mesh->plink_sta;
@@ -689,7 +689,7 @@ void mesh_plink_timer(struct timer_list *t)
 		return;
 	}
=20
-	/* del_timer() and handler may race when entering these states */
+	/* timer_delete() and handler may race when entering these states */
 	if (sta->mesh->plink_state =3D=3D NL80211_PLINK_LISTEN ||
 	    sta->mesh->plink_state =3D=3D NL80211_PLINK_ESTAB) {
 		mpl_dbg(sta->sdata,
@@ -735,7 +735,7 @@ void mesh_plink_timer(struct timer_list *t)
 		break;
 	case NL80211_PLINK_HOLDING:
 		/* holding timer */
-		del_timer(&sta->mesh->plink_timer);
+		timer_delete(&sta->mesh->plink_timer);
 		mesh_plink_fsm_restart(sta);
 		break;
 	default:
@@ -848,7 +848,7 @@ static u64 mesh_plink_establish(struct ieee80211_sub_if_d=
ata *sdata,
 	struct mesh_config *mshcfg =3D &sdata->u.mesh.mshcfg;
 	u64 changed =3D 0;
=20
-	del_timer(&sta->mesh->plink_timer);
+	timer_delete(&sta->mesh->plink_timer);
 	sta->mesh->plink_state =3D NL80211_PLINK_ESTAB;
 	changed |=3D mesh_plink_inc_estab_count(sdata);
 	changed |=3D mesh_set_ht_prot_mode(sdata);
@@ -975,7 +975,7 @@ static u64 mesh_plink_fsm(struct ieee80211_sub_if_data *s=
data,
 	case NL80211_PLINK_HOLDING:
 		switch (event) {
 		case CLS_ACPT:
-			del_timer(&sta->mesh->plink_timer);
+			timer_delete(&sta->mesh->plink_timer);
 			mesh_plink_fsm_restart(sta);
 			break;
 		case OPN_ACPT:
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index c010bb3d24e3..5d1f2d6d09ad 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -3194,7 +3194,7 @@ static void ieee80211_change_ps(struct ieee80211_local =
*local)
 	} else if (conf->flags & IEEE80211_CONF_PS) {
 		conf->flags &=3D ~IEEE80211_CONF_PS;
 		ieee80211_hw_config(local, IEEE80211_CONF_CHANGE_PS);
-		del_timer_sync(&local->dynamic_ps_timer);
+		timer_delete_sync(&local->dynamic_ps_timer);
 		wiphy_work_cancel(local->hw.wiphy,
 				  &local->dynamic_ps_enable_work);
 	}
@@ -4069,7 +4069,7 @@ static void ieee80211_set_disassoc(struct ieee80211_sub=
_if_data *sdata,
=20
 	sdata->deflink.ap_power_level =3D IEEE80211_UNSET_POWER_LEVEL;
=20
-	del_timer_sync(&local->dynamic_ps_timer);
+	timer_delete_sync(&local->dynamic_ps_timer);
 	wiphy_work_cancel(local->hw.wiphy, &local->dynamic_ps_enable_work);
=20
 	/* Disable ARP filtering */
@@ -4097,9 +4097,9 @@ static void ieee80211_set_disassoc(struct ieee80211_sub=
_if_data *sdata,
 	/* disassociated - set to defaults now */
 	ieee80211_set_wmm_default(&sdata->deflink, false, false);
=20
-	del_timer_sync(&sdata->u.mgd.conn_mon_timer);
-	del_timer_sync(&sdata->u.mgd.bcn_mon_timer);
-	del_timer_sync(&sdata->u.mgd.timer);
+	timer_delete_sync(&sdata->u.mgd.conn_mon_timer);
+	timer_delete_sync(&sdata->u.mgd.bcn_mon_timer);
+	timer_delete_sync(&sdata->u.mgd.timer);
=20
 	sdata->vif.bss_conf.dtim_period =3D 0;
 	sdata->vif.bss_conf.beacon_rate =3D NULL;
@@ -4589,7 +4589,7 @@ static void ieee80211_destroy_auth_data(struct ieee8021=
1_sub_if_data *sdata,
 		 * running is the timeout for the authentication response which
 		 * which is not relevant anymore.
 		 */
-		del_timer_sync(&sdata->u.mgd.timer);
+		timer_delete_sync(&sdata->u.mgd.timer);
 		sta_info_destroy_addr(sdata, auth_data->ap_addr);
=20
 		/* other links are destroyed */
@@ -4628,7 +4628,7 @@ static void ieee80211_destroy_assoc_data(struct ieee802=
11_sub_if_data *sdata,
 		 * running is the timeout for the association response which
 		 * which is not relevant anymore.
 		 */
-		del_timer_sync(&sdata->u.mgd.timer);
+		timer_delete_sync(&sdata->u.mgd.timer);
 		sta_info_destroy_addr(sdata, assoc_data->ap_addr);
=20
 		eth_zero_addr(sdata->deflink.u.mgd.bssid);
@@ -9852,7 +9852,7 @@ void ieee80211_mgd_stop(struct ieee80211_sub_if_data *s=
data)
 	ifmgd->assoc_req_ies =3D NULL;
 	ifmgd->assoc_req_ies_len =3D 0;
 	spin_unlock_bh(&ifmgd->teardown_lock);
-	del_timer_sync(&ifmgd->timer);
+	timer_delete_sync(&ifmgd->timer);
 }
=20
 void ieee80211_cqm_rssi_notify(struct ieee80211_vif *vif,
diff --git a/net/mac80211/ocb.c b/net/mac80211/ocb.c
index 6218abc3e441..ece1e83c7b2f 100644
--- a/net/mac80211/ocb.c
+++ b/net/mac80211/ocb.c
@@ -230,7 +230,7 @@ int ieee80211_ocb_leave(struct ieee80211_sub_if_data *sda=
ta)
=20
 	skb_queue_purge(&sdata->skb_queue);
=20
-	del_timer_sync(&sdata->u.ocb.housekeeping_timer);
+	timer_delete_sync(&sdata->u.ocb.housekeeping_timer);
 	/* If the timer fired while we waited for it, it will have
 	 * requeued the work. Now the work will be running again
 	 * but will not rearm the timer again because it checks
diff --git a/net/mac80211/offchannel.c b/net/mac80211/offchannel.c
index 29fab7ae47b4..2b9abc27462e 100644
--- a/net/mac80211/offchannel.c
+++ b/net/mac80211/offchannel.c
@@ -30,9 +30,9 @@ static void ieee80211_offchannel_ps_enable(struct ieee80211=
_sub_if_data *sdata)
=20
 	/* FIXME: what to do when local->pspolling is true? */
=20
-	del_timer_sync(&local->dynamic_ps_timer);
-	del_timer_sync(&ifmgd->bcn_mon_timer);
-	del_timer_sync(&ifmgd->conn_mon_timer);
+	timer_delete_sync(&local->dynamic_ps_timer);
+	timer_delete_sync(&ifmgd->bcn_mon_timer);
+	timer_delete_sync(&ifmgd->conn_mon_timer);
=20
 	wiphy_work_cancel(local->hw.wiphy, &local->dynamic_ps_enable_work);
=20
diff --git a/net/mac80211/pm.c b/net/mac80211/pm.c
index 7be52345f218..a9cc832240a5 100644
--- a/net/mac80211/pm.c
+++ b/net/mac80211/pm.c
@@ -69,14 +69,14 @@ int __ieee80211_suspend(struct ieee80211_hw *hw, struct c=
fg80211_wowlan *wowlan)
 	flush_workqueue(local->workqueue);
=20
 	/* Don't try to run timers while suspended. */
-	del_timer_sync(&local->sta_cleanup);
+	timer_delete_sync(&local->sta_cleanup);
=20
 	 /*
 	 * Note that this particular timer doesn't need to be
 	 * restarted at resume.
 	 */
 	wiphy_work_cancel(local->hw.wiphy, &local->dynamic_ps_enable_work);
-	del_timer_sync(&local->dynamic_ps_timer);
+	timer_delete_sync(&local->dynamic_ps_timer);
=20
 	local->wowlan =3D wowlan;
 	if (local->wowlan) {
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index f7f89cd1b7d7..09beb65d6108 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -1242,7 +1242,7 @@ static void ieee80211_sta_reorder_release(struct ieee80=
211_sub_if_data *sdata,
 				  tid_agg_rx->reorder_time[j] + 1 +
 				  HT_RX_REORDER_BUF_TIMEOUT);
 	} else {
-		del_timer(&tid_agg_rx->reorder_timer);
+		timer_delete(&tid_agg_rx->reorder_timer);
 	}
 }
=20
diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index 30cdc783999d..248e1f63bf73 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -1592,7 +1592,7 @@ int sta_info_init(struct ieee80211_local *local)
=20
 void sta_info_stop(struct ieee80211_local *local)
 {
-	del_timer_sync(&local->sta_cleanup);
+	timer_delete_sync(&local->sta_cleanup);
 	rhltable_destroy(&local->sta_hash);
 	rhltable_destroy(&local->link_sta_hash);
 }
diff --git a/net/mctp/af_mctp.c b/net/mctp/af_mctp.c
index f6de136008f6..dd895617defd 100644
--- a/net/mctp/af_mctp.c
+++ b/net/mctp/af_mctp.c
@@ -663,7 +663,7 @@ static void mctp_sk_unhash(struct sock *sk)
 	 * keys), stop any pending expiry events. the timer cannot be re-queued
 	 * as the sk is no longer observable
 	 */
-	del_timer_sync(&msk->key_expiry);
+	timer_delete_sync(&msk->key_expiry);
 }
=20
 static void mctp_sk_destruct(struct sock *sk)
diff --git a/net/mptcp/pm.c b/net/mptcp/pm.c
index 18b19dbccbba..31747f974941 100644
--- a/net/mptcp/pm.c
+++ b/net/mptcp/pm.c
@@ -327,7 +327,7 @@ mptcp_pm_del_add_timer(struct mptcp_sock *msk,
 		list_del(&entry->list);
 	spin_unlock_bh(&msk->pm.lock);
=20
-	/* no lock, because sk_stop_timer_sync() is calling del_timer_sync() */
+	/* no lock, because sk_stop_timer_sync() is calling timer_delete_sync() */
 	if (add_timer)
 		sk_stop_timer_sync(sk, add_timer);
=20
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 7891a537bddd..b36947063783 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -189,7 +189,7 @@ void ncsi_stop_channel_monitor(struct ncsi_channel *nc)
 	nc->monitor.enabled =3D false;
 	spin_unlock_irqrestore(&nc->lock, flags);
=20
-	del_timer_sync(&nc->monitor.timer);
+	timer_delete_sync(&nc->monitor.timer);
 }
=20
 struct ncsi_channel *ncsi_find_channel(struct ncsi_package *np,
@@ -396,7 +396,7 @@ void ncsi_free_request(struct ncsi_request *nr)
=20
 	if (nr->enabled) {
 		nr->enabled =3D false;
-		del_timer_sync(&nr->timer);
+		timer_delete_sync(&nr->timer);
 	}
=20
 	spin_lock_irqsave(&ndp->lock, flags);
diff --git a/net/netfilter/ipset/ip_set_bitmap_gen.h b/net/netfilter/ipset/ip=
_set_bitmap_gen.h
index cb48a2b9cb9f..6ae042f702d2 100644
--- a/net/netfilter/ipset/ip_set_bitmap_gen.h
+++ b/net/netfilter/ipset/ip_set_bitmap_gen.h
@@ -294,7 +294,7 @@ mtype_cancel_gc(struct ip_set *set)
 	struct mtype *map =3D set->data;
=20
 	if (SET_WITH_TIMEOUT(set))
-		del_timer_sync(&map->gc);
+		timer_delete_sync(&map->gc);
 }
=20
 static const struct ip_set_type_variant mtype =3D {
diff --git a/net/netfilter/ipvs/ip_vs_conn.c b/net/netfilter/ipvs/ip_vs_conn.c
index 20a1727e2457..8699944c0baf 100644
--- a/net/netfilter/ipvs/ip_vs_conn.c
+++ b/net/netfilter/ipvs/ip_vs_conn.c
@@ -822,7 +822,7 @@ static void ip_vs_conn_rcu_free(struct rcu_head *head)
 /* Try to delete connection while not holding reference */
 static void ip_vs_conn_del(struct ip_vs_conn *cp)
 {
-	if (del_timer(&cp->timer)) {
+	if (timer_delete(&cp->timer)) {
 		/* Drop cp->control chain too */
 		if (cp->control)
 			cp->timeout =3D 0;
@@ -833,7 +833,7 @@ static void ip_vs_conn_del(struct ip_vs_conn *cp)
 /* Try to delete connection while holding reference */
 static void ip_vs_conn_del_put(struct ip_vs_conn *cp)
 {
-	if (del_timer(&cp->timer)) {
+	if (timer_delete(&cp->timer)) {
 		/* Drop cp->control chain too */
 		if (cp->control)
 			cp->timeout =3D 0;
@@ -860,7 +860,7 @@ static void ip_vs_conn_expire(struct timer_list *t)
 		struct ip_vs_conn *ct =3D cp->control;
=20
 		/* delete the timer if it is activated by other users */
-		del_timer(&cp->timer);
+		timer_delete(&cp->timer);
=20
 		/* does anybody control me? */
 		if (ct) {
diff --git a/net/netfilter/ipvs/ip_vs_ctl.c b/net/netfilter/ipvs/ip_vs_ctl.c
index 0633276d96bf..7d5b7418f8c7 100644
--- a/net/netfilter/ipvs/ip_vs_ctl.c
+++ b/net/netfilter/ipvs/ip_vs_ctl.c
@@ -848,7 +848,7 @@ static void ip_vs_trash_cleanup(struct netns_ipvs *ipvs)
 {
 	struct ip_vs_dest *dest, *nxt;
=20
-	del_timer_sync(&ipvs->dest_trash_timer);
+	timer_delete_sync(&ipvs->dest_trash_timer);
 	/* No need to use dest_trash_lock */
 	list_for_each_entry_safe(dest, nxt, &ipvs->dest_trash, t_list) {
 		list_del(&dest->t_list);
diff --git a/net/netfilter/nf_conntrack_expect.c b/net/netfilter/nf_conntrack=
_expect.c
index 21fa550966f0..21d22fa22e4e 100644
--- a/net/netfilter/nf_conntrack_expect.c
+++ b/net/netfilter/nf_conntrack_expect.c
@@ -118,7 +118,7 @@ nf_ct_exp_equal(const struct nf_conntrack_tuple *tuple,
=20
 bool nf_ct_remove_expect(struct nf_conntrack_expect *exp)
 {
-	if (del_timer(&exp->timeout)) {
+	if (timer_delete(&exp->timeout)) {
 		nf_ct_unlink_expect(exp);
 		nf_ct_expect_put(exp);
 		return true;
@@ -214,11 +214,11 @@ nf_ct_find_expectation(struct net *net,
 	if (exp->flags & NF_CT_EXPECT_PERMANENT || !unlink) {
 		refcount_inc(&exp->use);
 		return exp;
-	} else if (del_timer(&exp->timeout)) {
+	} else if (timer_delete(&exp->timeout)) {
 		nf_ct_unlink_expect(exp);
 		return exp;
 	}
-	/* Undo exp->master refcnt increase, if del_timer() failed */
+	/* Undo exp->master refcnt increase, if timer_delete() failed */
 	nf_ct_put(exp->master);
=20
 	return NULL;
@@ -520,7 +520,7 @@ void nf_ct_expect_iterate_destroy(bool (*iter)(struct nf_=
conntrack_expect *e, vo
 		hlist_for_each_entry_safe(exp, next,
 					  &nf_ct_expect_hash[i],
 					  hnode) {
-			if (iter(exp, data) && del_timer(&exp->timeout)) {
+			if (iter(exp, data) && timer_delete(&exp->timeout)) {
 				nf_ct_unlink_expect(exp);
 				nf_ct_expect_put(exp);
 			}
@@ -550,7 +550,7 @@ void nf_ct_expect_iterate_net(struct net *net,
 			if (!net_eq(nf_ct_exp_net(exp), net))
 				continue;
=20
-			if (iter(exp, data) && del_timer(&exp->timeout)) {
+			if (iter(exp, data) && timer_delete(&exp->timeout)) {
 				nf_ct_unlink_expect_report(exp, portid, report);
 				nf_ct_expect_put(exp);
 			}
diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrac=
k_netlink.c
index db23876a6016..2cc0fde23344 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -3448,7 +3448,7 @@ static int ctnetlink_del_expect(struct sk_buff *skb,
=20
 		/* after list removal, usage count =3D=3D 1 */
 		spin_lock_bh(&nf_conntrack_expect_lock);
-		if (del_timer(&exp->timeout)) {
+		if (timer_delete(&exp->timeout)) {
 			nf_ct_unlink_expect_report(exp, NETLINK_CB(skb).portid,
 						   nlmsg_report(info->nlh));
 			nf_ct_expect_put(exp);
@@ -3477,7 +3477,7 @@ ctnetlink_change_expect(struct nf_conntrack_expect *x,
 			const struct nlattr * const cda[])
 {
 	if (cda[CTA_EXPECT_TIMEOUT]) {
-		if (!del_timer(&x->timeout))
+		if (!timer_delete(&x->timeout))
 			return -ETIME;
=20
 		x->timeout.expires =3D jiffies +
diff --git a/net/netfilter/nfnetlink_log.c b/net/netfilter/nfnetlink_log.c
index 134e05d31061..882962f3c84d 100644
--- a/net/netfilter/nfnetlink_log.c
+++ b/net/netfilter/nfnetlink_log.c
@@ -381,7 +381,7 @@ static void
 __nfulnl_flush(struct nfulnl_instance *inst)
 {
 	/* timer holds a reference */
-	if (del_timer(&inst->timer))
+	if (timer_delete(&inst->timer))
 		instance_put(inst);
 	if (inst->skb)
 		__nfulnl_send(inst);
diff --git a/net/netrom/nr_loopback.c b/net/netrom/nr_loopback.c
index 511819fbfa67..7a9d765b30c0 100644
--- a/net/netrom/nr_loopback.c
+++ b/net/netrom/nr_loopback.c
@@ -68,6 +68,6 @@ static void nr_loopback_timer(struct timer_list *unused)
=20
 void nr_loopback_clear(void)
 {
-	del_timer_sync(&loopback_timer);
+	timer_delete_sync(&loopback_timer);
 	skb_queue_purge(&loopback_queue);
 }
diff --git a/net/nfc/core.c b/net/nfc/core.c
index e58dc6405054..75ed8a9146ba 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -464,7 +464,7 @@ int nfc_deactivate_target(struct nfc_dev *dev, u32 target=
_idx, u8 mode)
 	}
=20
 	if (dev->ops->check_presence)
-		del_timer_sync(&dev->check_pres_timer);
+		timer_delete_sync(&dev->check_pres_timer);
=20
 	dev->ops->deactivate_target(dev, dev->active_target, mode);
 	dev->active_target =3D NULL;
@@ -509,7 +509,7 @@ int nfc_data_exchange(struct nfc_dev *dev, u32 target_idx=
, struct sk_buff *skb,
 		}
=20
 		if (dev->ops->check_presence)
-			del_timer_sync(&dev->check_pres_timer);
+			timer_delete_sync(&dev->check_pres_timer);
=20
 		rc =3D dev->ops->im_transceive(dev, dev->active_target, skb, cb,
 					     cb_context);
@@ -1172,7 +1172,7 @@ void nfc_unregister_device(struct nfc_dev *dev)
 	device_unlock(&dev->dev);
=20
 	if (dev->ops->check_presence) {
-		del_timer_sync(&dev->check_pres_timer);
+		timer_delete_sync(&dev->check_pres_timer);
 		cancel_work_sync(&dev->check_pres_work);
 	}
=20
diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index ceb87db57cdb..aa493344d93e 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -148,7 +148,7 @@ static void nfc_hci_msg_rx_work(struct work_struct *work)
 static void __nfc_hci_cmd_completion(struct nfc_hci_dev *hdev, int err,
 				     struct sk_buff *skb)
 {
-	del_timer_sync(&hdev->cmd_timer);
+	timer_delete_sync(&hdev->cmd_timer);
=20
 	if (hdev->cmd_pending_msg->cb)
 		hdev->cmd_pending_msg->cb(hdev->cmd_pending_msg->cb_context,
@@ -1046,7 +1046,7 @@ void nfc_hci_unregister_device(struct nfc_hci_dev *hdev)
=20
 	mutex_unlock(&hdev->msg_tx_mutex);
=20
-	del_timer_sync(&hdev->cmd_timer);
+	timer_delete_sync(&hdev->cmd_timer);
 	cancel_work_sync(&hdev->msg_tx_work);
=20
 	cancel_work_sync(&hdev->msg_rx_work);
diff --git a/net/nfc/hci/llc_shdlc.c b/net/nfc/hci/llc_shdlc.c
index e90f70385813..ce9c683a3ead 100644
--- a/net/nfc/hci/llc_shdlc.c
+++ b/net/nfc/hci/llc_shdlc.c
@@ -198,7 +198,7 @@ static void llc_shdlc_reset_t2(struct llc_shdlc *shdlc, i=
nt y_nr)
=20
 	if (skb_queue_empty(&shdlc->ack_pending_q)) {
 		if (shdlc->t2_active) {
-			del_timer_sync(&shdlc->t2_timer);
+			timer_delete_sync(&shdlc->t2_timer);
 			shdlc->t2_active =3D false;
=20
 			pr_debug("All sent frames acked. Stopped T2(retransmit)\n");
@@ -289,7 +289,7 @@ static void llc_shdlc_rcv_rej(struct llc_shdlc *shdlc, in=
t y_nr)
=20
 	if (llc_shdlc_x_lteq_y_lt_z(shdlc->dnr, y_nr, shdlc->ns)) {
 		if (shdlc->t2_active) {
-			del_timer_sync(&shdlc->t2_timer);
+			timer_delete_sync(&shdlc->t2_timer);
 			shdlc->t2_active =3D false;
 			pr_debug("Stopped T2(retransmit)\n");
 		}
@@ -342,7 +342,7 @@ static void llc_shdlc_connect_complete(struct llc_shdlc *=
shdlc, int r)
 {
 	pr_debug("result=3D%d\n", r);
=20
-	del_timer_sync(&shdlc->connect_timer);
+	timer_delete_sync(&shdlc->connect_timer);
=20
 	if (r =3D=3D 0) {
 		shdlc->ns =3D 0;
@@ -526,7 +526,7 @@ static void llc_shdlc_handle_send_queue(struct llc_shdlc =
*shdlc)
 	       (shdlc->rnr =3D=3D false)) {
=20
 		if (shdlc->t1_active) {
-			del_timer_sync(&shdlc->t1_timer);
+			timer_delete_sync(&shdlc->t1_timer);
 			shdlc->t1_active =3D false;
 			pr_debug("Stopped T1(send ack)\n");
 		}
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 18be13fb9b75..27e863f96ed1 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -160,14 +160,14 @@ static struct nfc_llcp_local *nfc_llcp_local_get(struct=
 nfc_llcp_local *local)
 static void local_cleanup(struct nfc_llcp_local *local)
 {
 	nfc_llcp_socket_release(local, false, ENXIO);
-	del_timer_sync(&local->link_timer);
+	timer_delete_sync(&local->link_timer);
 	skb_queue_purge(&local->tx_queue);
 	cancel_work_sync(&local->tx_work);
 	cancel_work_sync(&local->rx_work);
 	cancel_work_sync(&local->timeout_work);
 	kfree_skb(local->rx_pending);
 	local->rx_pending =3D NULL;
-	del_timer_sync(&local->sdreq_timer);
+	timer_delete_sync(&local->sdreq_timer);
 	cancel_work_sync(&local->sdreq_timeout_work);
 	nfc_llcp_free_sdp_tlv_list(&local->pending_sdreqs);
 }
@@ -1536,7 +1536,7 @@ static void nfc_llcp_rx_work(struct work_struct *work)
 static void __nfc_llcp_recv(struct nfc_llcp_local *local, struct sk_buff *sk=
b)
 {
 	local->rx_pending =3D skb;
-	del_timer(&local->link_timer);
+	timer_delete(&local->link_timer);
 	schedule_work(&local->rx_work);
 }
=20
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 1ec5955fe469..0171bf3c7016 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -565,8 +565,8 @@ static int nci_close_device(struct nci_dev *ndev)
 		 * there is a queued/running cmd_work
 		 */
 		flush_workqueue(ndev->cmd_wq);
-		del_timer_sync(&ndev->cmd_timer);
-		del_timer_sync(&ndev->data_timer);
+		timer_delete_sync(&ndev->cmd_timer);
+		timer_delete_sync(&ndev->data_timer);
 		mutex_unlock(&ndev->req_lock);
 		return 0;
 	}
@@ -597,7 +597,7 @@ static int nci_close_device(struct nci_dev *ndev)
 	/* Flush cmd wq */
 	flush_workqueue(ndev->cmd_wq);
=20
-	del_timer_sync(&ndev->cmd_timer);
+	timer_delete_sync(&ndev->cmd_timer);
=20
 	/* Clear flags except NCI_UNREG */
 	ndev->flags &=3D BIT(NCI_UNREG);
diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 3d36ea5701f0..78f4131af3cf 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -42,7 +42,7 @@ void nci_data_exchange_complete(struct nci_dev *ndev, struc=
t sk_buff *skb,
 	pr_debug("len %d, err %d\n", skb ? skb->len : 0, err);
=20
 	/* data exchange is complete, stop the data timer */
-	del_timer_sync(&ndev->data_timer);
+	timer_delete_sync(&ndev->data_timer);
 	clear_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags);
=20
 	if (cb) {
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index b911ab78bed9..9eeb862825c5 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -347,7 +347,7 @@ void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff =
*skb)
 	__u16 rsp_opcode =3D nci_opcode(skb->data);
=20
 	/* we got a rsp, stop the cmd timer */
-	del_timer(&ndev->cmd_timer);
+	timer_delete(&ndev->cmd_timer);
=20
 	pr_debug("NCI RX: MT=3Drsp, PBF=3D%d, GID=3D0x%x, OID=3D0x%x, plen=3D%d\n",
 		 nci_pbf(skb->data),
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 3e9ddf72cd03..d4dba06297c3 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -581,7 +581,7 @@ static __be16 vlan_get_protocol_dgram(const struct sk_buf=
f *skb)
=20
 static void prb_del_retire_blk_timer(struct tpacket_kbdq_core *pkc)
 {
-	del_timer_sync(&pkc->retire_blk_timer);
+	timer_delete_sync(&pkc->retire_blk_timer);
 }
=20
 static void prb_shutdown_retire_blk_timer(struct packet_sock *po,
diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
index 0f77ae8ef944..9f9629e6fdae 100644
--- a/net/rose/rose_link.c
+++ b/net/rose/rose_link.c
@@ -32,7 +32,7 @@ static void rose_transmit_restart_request(struct rose_neigh=
 *neigh);
=20
 void rose_start_ftimer(struct rose_neigh *neigh)
 {
-	del_timer(&neigh->ftimer);
+	timer_delete(&neigh->ftimer);
=20
 	neigh->ftimer.function =3D rose_ftimer_expiry;
 	neigh->ftimer.expires  =3D
@@ -43,7 +43,7 @@ void rose_start_ftimer(struct rose_neigh *neigh)
=20
 static void rose_start_t0timer(struct rose_neigh *neigh)
 {
-	del_timer(&neigh->t0timer);
+	timer_delete(&neigh->t0timer);
=20
 	neigh->t0timer.function =3D rose_t0timer_expiry;
 	neigh->t0timer.expires  =3D
@@ -54,12 +54,12 @@ static void rose_start_t0timer(struct rose_neigh *neigh)
=20
 void rose_stop_ftimer(struct rose_neigh *neigh)
 {
-	del_timer(&neigh->ftimer);
+	timer_delete(&neigh->ftimer);
 }
=20
 void rose_stop_t0timer(struct rose_neigh *neigh)
 {
-	del_timer(&neigh->t0timer);
+	timer_delete(&neigh->t0timer);
 }
=20
 int rose_ftimer_running(struct rose_neigh *neigh)
diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 036d92c0ad79..b538e39b3df5 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -124,7 +124,7 @@ void __exit rose_loopback_clear(void)
 {
 	struct sk_buff *skb;
=20
-	del_timer(&loopback_timer);
+	timer_delete(&loopback_timer);
=20
 	while ((skb =3D skb_dequeue(&loopback_queue)) !=3D NULL) {
 		skb->sk =3D NULL;
diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index fee772b4637c..2dd6bd3a3011 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -227,8 +227,8 @@ static void rose_remove_neigh(struct rose_neigh *rose_nei=
gh)
 {
 	struct rose_neigh *s;
=20
-	del_timer_sync(&rose_neigh->ftimer);
-	del_timer_sync(&rose_neigh->t0timer);
+	timer_delete_sync(&rose_neigh->ftimer);
+	timer_delete_sync(&rose_neigh->t0timer);
=20
 	skb_queue_purge(&rose_neigh->queue);
=20
diff --git a/net/rxrpc/call_event.c b/net/rxrpc/call_event.c
index 8e477f7f8850..fec59d9338b9 100644
--- a/net/rxrpc/call_event.c
+++ b/net/rxrpc/call_event.c
@@ -469,7 +469,7 @@ bool rxrpc_input_call_event(struct rxrpc_call *call)
=20
 out:
 	if (__rxrpc_call_is_complete(call)) {
-		del_timer_sync(&call->timer);
+		timer_delete_sync(&call->timer);
 		if (!test_bit(RXRPC_CALL_DISCONNECTED, &call->flags))
 			rxrpc_disconnect_call(call);
 		if (call->security)
diff --git a/net/rxrpc/call_object.c b/net/rxrpc/call_object.c
index c4c8b46a68c6..fce58be65e7c 100644
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -688,7 +688,7 @@ static void rxrpc_destroy_call(struct work_struct *work)
 {
 	struct rxrpc_call *call =3D container_of(work, struct rxrpc_call, destroyer=
);
=20
-	del_timer_sync(&call->timer);
+	timer_delete_sync(&call->timer);
=20
 	rxrpc_cleanup_tx_buffers(call);
 	rxrpc_cleanup_rx_buffers(call);
@@ -711,7 +711,7 @@ void rxrpc_cleanup_call(struct rxrpc_call *call)
 	ASSERTCMP(__rxrpc_call_state(call), =3D=3D, RXRPC_CALL_COMPLETE);
 	ASSERT(test_bit(RXRPC_CALL_RELEASED, &call->flags));
=20
-	del_timer(&call->timer);
+	timer_delete(&call->timer);
=20
 	if (rcu_read_lock_held())
 		/* Can't use the rxrpc workqueue as we need to cancel/flush
diff --git a/net/rxrpc/conn_client.c b/net/rxrpc/conn_client.c
index db0099197890..63bbcc567f59 100644
--- a/net/rxrpc/conn_client.c
+++ b/net/rxrpc/conn_client.c
@@ -818,7 +818,7 @@ void rxrpc_clean_up_local_conns(struct rxrpc_local *local)
=20
 	local->kill_all_client_conns =3D true;
=20
-	del_timer_sync(&local->client_conn_reap_timer);
+	timer_delete_sync(&local->client_conn_reap_timer);
=20
 	while ((conn =3D list_first_entry_or_null(&local->idle_client_conns,
 						struct rxrpc_connection, cache_link))) {
diff --git a/net/rxrpc/conn_object.c b/net/rxrpc/conn_object.c
index 2f1fd1e2e7e4..8ac22dde8b39 100644
--- a/net/rxrpc/conn_object.c
+++ b/net/rxrpc/conn_object.c
@@ -314,9 +314,9 @@ static void rxrpc_clean_up_connection(struct work_struct =
*work)
 	       !conn->channels[3].call);
 	ASSERT(list_empty(&conn->cache_link));
=20
-	del_timer_sync(&conn->timer);
+	timer_delete_sync(&conn->timer);
 	cancel_work_sync(&conn->processor); /* Processing may restart the timer */
-	del_timer_sync(&conn->timer);
+	timer_delete_sync(&conn->timer);
=20
 	write_lock(&rxnet->conn_lock);
 	list_del_init(&conn->proc_link);
@@ -365,7 +365,7 @@ void rxrpc_put_connection(struct rxrpc_connection *conn,
 	dead =3D __refcount_dec_and_test(&conn->ref, &r);
 	trace_rxrpc_conn(debug_id, r - 1, why);
 	if (dead) {
-		del_timer(&conn->timer);
+		timer_delete(&conn->timer);
 		cancel_work(&conn->processor);
=20
 		if (in_softirq() || work_busy(&conn->processor) ||
@@ -470,7 +470,7 @@ void rxrpc_destroy_all_connections(struct rxrpc_net *rxne=
t)
=20
 	atomic_dec(&rxnet->nr_conns);
=20
-	del_timer_sync(&rxnet->service_conn_reap_timer);
+	timer_delete_sync(&rxnet->service_conn_reap_timer);
 	rxrpc_queue_work(&rxnet->service_conn_reaper);
 	flush_workqueue(rxrpc_workqueue);
=20
diff --git a/net/rxrpc/net_ns.c b/net/rxrpc/net_ns.c
index a4c135d0fbcc..9a9834145e81 100644
--- a/net/rxrpc/net_ns.c
+++ b/net/rxrpc/net_ns.c
@@ -105,10 +105,10 @@ static __net_exit void rxrpc_exit_net(struct net *net)
 	struct rxrpc_net *rxnet =3D rxrpc_net(net);
=20
 	rxnet->live =3D false;
-	del_timer_sync(&rxnet->peer_keepalive_timer);
+	timer_delete_sync(&rxnet->peer_keepalive_timer);
 	cancel_work_sync(&rxnet->peer_keepalive_work);
 	/* Remove the timer again as the worker may have restarted it. */
-	del_timer_sync(&rxnet->peer_keepalive_timer);
+	timer_delete_sync(&rxnet->peer_keepalive_timer);
 	rxrpc_destroy_all_calls(rxnet);
 	rxrpc_destroy_all_connections(rxnet);
 	rxrpc_destroy_all_peers(rxnet);
diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index 93c36afbf576..f3b8203d3e85 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -555,7 +555,7 @@ static void fq_pie_destroy(struct Qdisc *sch)
=20
 	tcf_block_put(q->block);
 	q->p_params.tupdate =3D 0;
-	del_timer_sync(&q->adapt_timer);
+	timer_delete_sync(&q->adapt_timer);
 	kvfree(q->flows);
 }
=20
diff --git a/net/sched/sch_generic.c b/net/sched/sch_generic.c
index 14ab2f4c190a..514b1b6ac681 100644
--- a/net/sched/sch_generic.c
+++ b/net/sched/sch_generic.c
@@ -567,7 +567,7 @@ EXPORT_SYMBOL_GPL(netdev_watchdog_up);
 static void netdev_watchdog_down(struct net_device *dev)
 {
 	netif_tx_lock_bh(dev);
-	if (del_timer(&dev->watchdog_timer))
+	if (timer_delete(&dev->watchdog_timer))
 		netdev_put(dev, &dev->watchdog_dev_tracker);
 	netif_tx_unlock_bh(dev);
 }
diff --git a/net/sched/sch_pie.c b/net/sched/sch_pie.c
index bb1fa9aa530b..3771d000b30d 100644
--- a/net/sched/sch_pie.c
+++ b/net/sched/sch_pie.c
@@ -545,7 +545,7 @@ static void pie_destroy(struct Qdisc *sch)
 	struct pie_sched_data *q =3D qdisc_priv(sch);
=20
 	q->params.tupdate =3D 0;
-	del_timer_sync(&q->adapt_timer);
+	timer_delete_sync(&q->adapt_timer);
 }
=20
 static struct Qdisc_ops pie_qdisc_ops __read_mostly =3D {
diff --git a/net/sched/sch_red.c b/net/sched/sch_red.c
index ef8a2afed26b..1ba3e0bba54f 100644
--- a/net/sched/sch_red.c
+++ b/net/sched/sch_red.c
@@ -218,7 +218,7 @@ static void red_destroy(struct Qdisc *sch)
=20
 	tcf_qevent_destroy(&q->qe_mark, sch);
 	tcf_qevent_destroy(&q->qe_early_drop, sch);
-	del_timer_sync(&q->adapt_timer);
+	timer_delete_sync(&q->adapt_timer);
 	red_offload(sch, false);
 	qdisc_put(q->qdisc);
 }
@@ -297,7 +297,7 @@ static int __red_change(struct Qdisc *sch, struct nlattr =
**tb,
 		      max_P);
 	red_set_vars(&q->vars);
=20
-	del_timer(&q->adapt_timer);
+	timer_delete(&q->adapt_timer);
 	if (ctl->flags & TC_RED_ADAPTATIVE)
 		mod_timer(&q->adapt_timer, jiffies + HZ/2);
=20
diff --git a/net/sched/sch_sfq.c b/net/sched/sch_sfq.c
index 65d5b59da583..9ed197e96396 100644
--- a/net/sched/sch_sfq.c
+++ b/net/sched/sch_sfq.c
@@ -696,7 +696,7 @@ static int sfq_change(struct Qdisc *sch, struct nlattr *o=
pt,
 	rtnl_kfree_skbs(to_free, tail);
 	qdisc_tree_reduce_backlog(sch, qlen - sch->q.qlen, dropped);
=20
-	del_timer(&q->perturb_timer);
+	timer_delete(&q->perturb_timer);
 	if (q->perturb_period) {
 		mod_timer(&q->perturb_timer, jiffies + q->perturb_period);
 		get_random_bytes(&q->perturbation, sizeof(q->perturbation));
@@ -722,7 +722,7 @@ static void sfq_destroy(struct Qdisc *sch)
=20
 	tcf_block_put(q->block);
 	WRITE_ONCE(q->perturb_period, 0);
-	del_timer_sync(&q->perturb_timer);
+	timer_delete_sync(&q->perturb_timer);
 	sfq_free(q->ht);
 	sfq_free(q->slots);
 	kfree(q->red_parms);
diff --git a/net/sctp/associola.c b/net/sctp/associola.c
index 0b0794f164cf..760152e751c7 100644
--- a/net/sctp/associola.c
+++ b/net/sctp/associola.c
@@ -362,7 +362,7 @@ void sctp_association_free(struct sctp_association *asoc)
 	 * on our state.
 	 */
 	for (i =3D SCTP_EVENT_TIMEOUT_NONE; i < SCTP_NUM_TIMEOUT_TYPES; ++i) {
-		if (del_timer(&asoc->timers[i]))
+		if (timer_delete(&asoc->timers[i]))
 			sctp_association_put(asoc);
 	}
=20
@@ -1521,7 +1521,7 @@ void sctp_assoc_rwnd_increase(struct sctp_association *=
asoc, unsigned int len)
=20
 		/* Stop the SACK timer.  */
 		timer =3D &asoc->timers[SCTP_EVENT_TIMEOUT_SACK];
-		if (del_timer(timer))
+		if (timer_delete(timer))
 			sctp_association_put(asoc);
 	}
 }
diff --git a/net/sctp/input.c b/net/sctp/input.c
index a8a254a5008e..0c0d2757f6f8 100644
--- a/net/sctp/input.c
+++ b/net/sctp/input.c
@@ -446,7 +446,7 @@ void sctp_icmp_proto_unreachable(struct sock *sk,
 		pr_debug("%s: unrecognized next header type "
 			 "encountered!\n", __func__);
=20
-		if (del_timer(&t->proto_unreach_timer))
+		if (timer_delete(&t->proto_unreach_timer))
 			sctp_transport_put(t);
=20
 		sctp_do_sm(net, SCTP_EVENT_T_OTHER,
diff --git a/net/sctp/output.c b/net/sctp/output.c
index a63df055ac57..23e96305cad7 100644
--- a/net/sctp/output.c
+++ b/net/sctp/output.c
@@ -312,7 +312,7 @@ static enum sctp_xmit sctp_packet_bundle_sack(struct sctp=
_packet *pkt,
 					       SCTP_MIB_OUTCTRLCHUNKS);
 				asoc->stats.octrlchunks++;
 				asoc->peer.sack_needed =3D 0;
-				if (del_timer(timer))
+				if (timer_delete(timer))
 					sctp_association_put(asoc);
 			}
 		}
diff --git a/net/sctp/outqueue.c b/net/sctp/outqueue.c
index 0dc6b8ab9963..f6b8c13dafa4 100644
--- a/net/sctp/outqueue.c
+++ b/net/sctp/outqueue.c
@@ -1630,8 +1630,7 @@ static void sctp_check_transmitted(struct sctp_outq *q,
 			 * as the receiver acknowledged any data.
 			 */
 			if (asoc->state =3D=3D SCTP_STATE_SHUTDOWN_PENDING &&
-			    del_timer(&asoc->timers
-				[SCTP_EVENT_TIMEOUT_T5_SHUTDOWN_GUARD]))
+			    timer_delete(&asoc->timers[SCTP_EVENT_TIMEOUT_T5_SHUTDOWN_GUARD]))
 					sctp_association_put(asoc);
=20
 			/* Mark the destination transport address as
@@ -1688,7 +1687,7 @@ static void sctp_check_transmitted(struct sctp_outq *q,
 		 * address.
 		 */
 		if (!transport->flight_size) {
-			if (del_timer(&transport->T3_rtx_timer))
+			if (timer_delete(&transport->T3_rtx_timer))
 				sctp_transport_put(transport);
 		} else if (restart_timer) {
 			if (!mod_timer(&transport->T3_rtx_timer,
diff --git a/net/sctp/protocol.c b/net/sctp/protocol.c
index 5407a3922101..8c3b80c4d40b 100644
--- a/net/sctp/protocol.c
+++ b/net/sctp/protocol.c
@@ -695,7 +695,7 @@ static void sctp_free_addr_wq(struct net *net)
 	struct sctp_sockaddr_entry *temp;
=20
 	spin_lock_bh(&net->sctp.addr_wq_lock);
-	del_timer(&net->sctp.addr_wq_timer);
+	timer_delete(&net->sctp.addr_wq_timer);
 	list_for_each_entry_safe(addrw, temp, &net->sctp.addr_waitq, list) {
 		list_del(&addrw->list);
 		kfree(addrw);
diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
index 23d6633966b1..3aa5da5e3bbd 100644
--- a/net/sctp/sm_sideeffect.c
+++ b/net/sctp/sm_sideeffect.c
@@ -734,7 +734,7 @@ static void sctp_cmd_hb_timers_stop(struct sctp_cmd_seq *=
cmds,
=20
 	list_for_each_entry(t, &asoc->peer.transport_addr_list,
 			transports) {
-		if (del_timer(&t->hb_timer))
+		if (timer_delete(&t->hb_timer))
 			sctp_transport_put(t);
 	}
 }
@@ -747,7 +747,7 @@ static void sctp_cmd_t3_rtx_timers_stop(struct sctp_cmd_s=
eq *cmds,
=20
 	list_for_each_entry(t, &asoc->peer.transport_addr_list,
 			transports) {
-		if (del_timer(&t->T3_rtx_timer))
+		if (timer_delete(&t->T3_rtx_timer))
 			sctp_transport_put(t);
 	}
 }
@@ -1557,7 +1557,7 @@ static int sctp_cmd_interpreter(enum sctp_event_type ev=
ent_type,
=20
 		case SCTP_CMD_TIMER_STOP:
 			timer =3D &asoc->timers[cmd->obj.to];
-			if (del_timer(timer))
+			if (timer_delete(timer))
 				sctp_association_put(asoc);
 			break;
=20
diff --git a/net/sctp/stream.c b/net/sctp/stream.c
index bfcff6d6a438..f205556c5b24 100644
--- a/net/sctp/stream.c
+++ b/net/sctp/stream.c
@@ -576,7 +576,7 @@ struct sctp_chunk *sctp_process_strreset_outreq(
 			struct sctp_transport *t;
=20
 			t =3D asoc->strreset_chunk->transport;
-			if (del_timer(&t->reconf_timer))
+			if (timer_delete(&t->reconf_timer))
 				sctp_transport_put(t);
=20
 			sctp_chunk_put(asoc->strreset_chunk);
@@ -825,7 +825,7 @@ struct sctp_chunk *sctp_process_strreset_addstrm_out(
 			struct sctp_transport *t;
=20
 			t =3D asoc->strreset_chunk->transport;
-			if (del_timer(&t->reconf_timer))
+			if (timer_delete(&t->reconf_timer))
 				sctp_transport_put(t);
=20
 			sctp_chunk_put(asoc->strreset_chunk);
@@ -1076,7 +1076,7 @@ struct sctp_chunk *sctp_process_strreset_resp(
 	/* remove everything for this reconf request */
 	if (!asoc->strreset_outstanding) {
 		t =3D asoc->strreset_chunk->transport;
-		if (del_timer(&t->reconf_timer))
+		if (timer_delete(&t->reconf_timer))
 			sctp_transport_put(t);
=20
 		sctp_chunk_put(asoc->strreset_chunk);
diff --git a/net/sctp/transport.c b/net/sctp/transport.c
index 2abe45af98e7..59675f6d9e7d 100644
--- a/net/sctp/transport.c
+++ b/net/sctp/transport.c
@@ -118,7 +118,7 @@ struct sctp_transport *sctp_transport_new(struct net *net,
 void sctp_transport_free(struct sctp_transport *transport)
 {
 	/* Try to delete the heartbeat timer.  */
-	if (del_timer(&transport->hb_timer))
+	if (timer_delete(&transport->hb_timer))
 		sctp_transport_put(transport);
=20
 	/* Delete the T3_rtx timer if it's active.
@@ -126,17 +126,17 @@ void sctp_transport_free(struct sctp_transport *transpo=
rt)
 	 * structure hang around in memory since we know
 	 * the transport is going away.
 	 */
-	if (del_timer(&transport->T3_rtx_timer))
+	if (timer_delete(&transport->T3_rtx_timer))
 		sctp_transport_put(transport);
=20
-	if (del_timer(&transport->reconf_timer))
+	if (timer_delete(&transport->reconf_timer))
 		sctp_transport_put(transport);
=20
-	if (del_timer(&transport->probe_timer))
+	if (timer_delete(&transport->probe_timer))
 		sctp_transport_put(transport);
=20
 	/* Delete the ICMP proto unreachable timer if it's active. */
-	if (del_timer(&transport->proto_unreach_timer))
+	if (timer_delete(&transport->proto_unreach_timer))
 		sctp_transport_put(transport);
=20
 	sctp_transport_put(transport);
@@ -829,7 +829,7 @@ void sctp_transport_reset(struct sctp_transport *t)
 void sctp_transport_immediate_rtx(struct sctp_transport *t)
 {
 	/* Stop pending T3_rtx_timer */
-	if (del_timer(&t->T3_rtx_timer))
+	if (timer_delete(&t->T3_rtx_timer))
 		sctp_transport_put(t);
=20
 	sctp_retransmit(&t->asoc->outqueue, t, SCTP_RTXR_T3_RTX);
diff --git a/net/sunrpc/xprt.c b/net/sunrpc/xprt.c
index 09f245cda526..0eab15465511 100644
--- a/net/sunrpc/xprt.c
+++ b/net/sunrpc/xprt.c
@@ -1167,7 +1167,7 @@ xprt_request_enqueue_receive(struct rpc_task *task)
 	spin_unlock(&xprt->queue_lock);
=20
 	/* Turn off autodisconnect */
-	del_timer_sync(&xprt->timer);
+	timer_delete_sync(&xprt->timer);
 	return 0;
 }
=20
@@ -2138,7 +2138,7 @@ static void xprt_destroy(struct rpc_xprt *xprt)
 	 * can only run *before* del_time_sync(), never after.
 	 */
 	spin_lock(&xprt->transport_lock);
-	del_timer_sync(&xprt->timer);
+	timer_delete_sync(&xprt->timer);
 	spin_unlock(&xprt->transport_lock);
=20
 	/*
diff --git a/net/tipc/node.c b/net/tipc/node.c
index 500320e5ca47..ccf5e427f43e 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -638,7 +638,7 @@ static void tipc_node_delete(struct tipc_node *node)
 	trace_tipc_node_delete(node, true, " ");
 	tipc_node_delete_from_list(node);
=20
-	del_timer_sync(&node->timer);
+	timer_delete_sync(&node->timer);
 	tipc_node_put(node);
 }
=20
diff --git a/net/tipc/subscr.c b/net/tipc/subscr.c
index 05d49ad81290..621addab2834 100644
--- a/net/tipc/subscr.c
+++ b/net/tipc/subscr.c
@@ -177,7 +177,7 @@ void tipc_sub_unsubscribe(struct tipc_subscription *sub)
 {
 	tipc_nametbl_unsubscribe(sub);
 	if (sub->evt.s.timeout !=3D TIPC_WAIT_FOREVER)
-		del_timer_sync(&sub->timer);
+		timer_delete_sync(&sub->timer);
 	list_del(&sub->sub_list);
 	tipc_sub_put(sub);
 }
diff --git a/net/wireless/core.c b/net/wireless/core.c
index 9e6b31903121..dcce326fdb8c 100644
--- a/net/wireless/core.c
+++ b/net/wireless/core.c
@@ -1722,7 +1722,7 @@ void wiphy_delayed_work_queue(struct wiphy *wiphy,
 	trace_wiphy_delayed_work_queue(wiphy, &dwork->work, delay);
=20
 	if (!delay) {
-		del_timer(&dwork->timer);
+		timer_delete(&dwork->timer);
 		wiphy_work_queue(wiphy, &dwork->work);
 		return;
 	}
@@ -1737,7 +1737,7 @@ void wiphy_delayed_work_cancel(struct wiphy *wiphy,
 {
 	lockdep_assert_held(&wiphy->mtx);
=20
-	del_timer_sync(&dwork->timer);
+	timer_delete_sync(&dwork->timer);
 	wiphy_work_cancel(wiphy, &dwork->work);
 }
 EXPORT_SYMBOL_GPL(wiphy_delayed_work_cancel);
@@ -1747,7 +1747,7 @@ void wiphy_delayed_work_flush(struct wiphy *wiphy,
 {
 	lockdep_assert_held(&wiphy->mtx);
=20
-	del_timer_sync(&dwork->timer);
+	timer_delete_sync(&dwork->timer);
 	wiphy_work_flush(wiphy, &dwork->work);
 }
 EXPORT_SYMBOL_GPL(wiphy_delayed_work_flush);
diff --git a/net/x25/x25_link.c b/net/x25/x25_link.c
index 5460b9146dd8..37b190499405 100644
--- a/net/x25/x25_link.c
+++ b/net/x25/x25_link.c
@@ -55,7 +55,7 @@ static void x25_t20timer_expiry(struct timer_list *t)
=20
 static inline void x25_stop_t20timer(struct x25_neigh *nb)
 {
-	del_timer(&nb->t20timer);
+	timer_delete(&nb->t20timer);
 }
=20
 /*
diff --git a/net/x25/x25_timer.c b/net/x25/x25_timer.c
index 9376365cdcc9..e4c5ad5b070f 100644
--- a/net/x25/x25_timer.c
+++ b/net/x25/x25_timer.c
@@ -41,7 +41,7 @@ void x25_start_heartbeat(struct sock *sk)
=20
 void x25_stop_heartbeat(struct sock *sk)
 {
-	del_timer(&sk->sk_timer);
+	timer_delete(&sk->sk_timer);
 }
=20
 void x25_start_t2timer(struct sock *sk)
@@ -74,7 +74,7 @@ void x25_start_t23timer(struct sock *sk)
=20
 void x25_stop_timer(struct sock *sk)
 {
-	del_timer(&x25_sk(sk)->timer);
+	timer_delete(&x25_sk(sk)->timer);
 }
=20
 unsigned long x25_display_timer(struct sock *sk)
diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index 30970d40a454..143ac3aa7537 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -462,7 +462,7 @@ void xfrm_policy_destroy(struct xfrm_policy *policy)
 {
 	BUG_ON(!policy->walk.dead);
=20
-	if (del_timer(&policy->timer) || del_timer(&policy->polq.hold_timer))
+	if (timer_delete(&policy->timer) || timer_delete(&policy->polq.hold_timer))
 		BUG();
=20
 	xfrm_dev_policy_free(policy);
@@ -487,11 +487,11 @@ static void xfrm_policy_kill(struct xfrm_policy *policy)
=20
 	atomic_inc(&policy->genid);
=20
-	if (del_timer(&policy->polq.hold_timer))
+	if (timer_delete(&policy->polq.hold_timer))
 		xfrm_pol_put(policy);
 	skb_queue_purge(&policy->polq.hold_queue);
=20
-	if (del_timer(&policy->timer))
+	if (timer_delete(&policy->timer))
 		xfrm_pol_put(policy);
=20
 	/* XXX: Flush state cache */
@@ -1469,7 +1469,7 @@ static void xfrm_policy_requeue(struct xfrm_policy *old,
=20
 	spin_lock_bh(&pq->hold_queue.lock);
 	skb_queue_splice_init(&pq->hold_queue, &list);
-	if (del_timer(&pq->hold_timer))
+	if (timer_delete(&pq->hold_timer))
 		xfrm_pol_put(old);
 	spin_unlock_bh(&pq->hold_queue.lock);
=20
@@ -3004,7 +3004,7 @@ static int xdst_queue_output(struct net *net, struct so=
ck *sk, struct sk_buff *s
=20
 	sched_next =3D jiffies + pq->timeout;
=20
-	if (del_timer(&pq->hold_timer)) {
+	if (timer_delete(&pq->hold_timer)) {
 		if (time_before(pq->hold_timer.expires, sched_next))
 			sched_next =3D pq->hold_timer.expires;
 		xfrm_pol_put(pol);
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index d896c3fefb07..341d79ecb5c2 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -598,7 +598,7 @@ static void ___xfrm_state_destroy(struct xfrm_state *x)
 	if (x->mode_cbs && x->mode_cbs->destroy_state)
 		x->mode_cbs->destroy_state(x);
 	hrtimer_cancel(&x->mtimer);
-	del_timer_sync(&x->rtimer);
+	timer_delete_sync(&x->rtimer);
 	kfree(x->aead);
 	kfree(x->aalg);
 	kfree(x->ealg);
diff --git a/samples/connector/cn_test.c b/samples/connector/cn_test.c
index 0958a171d048..73d50b4aebb6 100644
--- a/samples/connector/cn_test.c
+++ b/samples/connector/cn_test.c
@@ -172,7 +172,7 @@ static int cn_test_init(void)
=20
 static void cn_test_fini(void)
 {
-	del_timer_sync(&cn_test_timer);
+	timer_delete_sync(&cn_test_timer);
 	cn_del_callback(&cn_test_id);
 	cn_test_id.val--;
 	cn_del_callback(&cn_test_id);
diff --git a/samples/ftrace/sample-trace-array.c b/samples/ftrace/sample-trac=
e-array.c
index d0ee9001c7b3..dac67c367457 100644
--- a/samples/ftrace/sample-trace-array.c
+++ b/samples/ftrace/sample-trace-array.c
@@ -82,7 +82,7 @@ static int simple_thread(void *arg)
 	while (!kthread_should_stop())
 		simple_thread_func(count++);
=20
-	del_timer(&mytimer);
+	timer_delete(&mytimer);
 	cancel_work_sync(&trace_work);
=20
 	/*
diff --git a/sound/core/timer.c b/sound/core/timer.c
index d774b9b71ce2..1de4b90fd4d1 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1152,7 +1152,7 @@ static int snd_timer_s_stop(struct snd_timer * timer)
 	unsigned long jiff;
=20
 	priv =3D (struct snd_timer_system_private *) timer->private_data;
-	del_timer(&priv->tlist);
+	timer_delete(&priv->tlist);
 	jiff =3D jiffies;
 	if (time_before(jiff, priv->last_expires))
 		timer->sticks =3D priv->last_expires - jiff;
@@ -1167,7 +1167,7 @@ static int snd_timer_s_close(struct snd_timer *timer)
 	struct snd_timer_system_private *priv;
=20
 	priv =3D (struct snd_timer_system_private *)timer->private_data;
-	del_timer_sync(&priv->tlist);
+	timer_delete_sync(&priv->tlist);
 	return 0;
 }
=20
diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index eb8a68a06c4d..4b02ec127cc0 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -261,7 +261,7 @@ static int loopback_snd_timer_start(struct loopback_pcm *=
dpcm)
 /* call in cable->lock */
 static inline int loopback_jiffies_timer_stop(struct loopback_pcm *dpcm)
 {
-	del_timer(&dpcm->timer);
+	timer_delete(&dpcm->timer);
 	dpcm->timer.expires =3D 0;
=20
 	return 0;
@@ -292,7 +292,7 @@ static int loopback_snd_timer_stop(struct loopback_pcm *d=
pcm)
=20
 static inline int loopback_jiffies_timer_stop_sync(struct loopback_pcm *dpcm)
 {
-	del_timer_sync(&dpcm->timer);
+	timer_delete_sync(&dpcm->timer);
=20
 	return 0;
 }
diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index c1a3efb633c5..1d923cbe8cd0 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -279,7 +279,7 @@ static int dummy_systimer_stop(struct snd_pcm_substream *=
substream)
 {
 	struct dummy_systimer_pcm *dpcm =3D substream->runtime->private_data;
 	spin_lock(&dpcm->lock);
-	del_timer(&dpcm->timer);
+	timer_delete(&dpcm->timer);
 	spin_unlock(&dpcm->lock);
 	return 0;
 }
diff --git a/sound/drivers/mpu401/mpu401_uart.c b/sound/drivers/mpu401/mpu401=
_uart.c
index 8e3318e17717..a63e7558ac07 100644
--- a/sound/drivers/mpu401/mpu401_uart.c
+++ b/sound/drivers/mpu401/mpu401_uart.c
@@ -197,7 +197,7 @@ static void snd_mpu401_uart_remove_timer (struct snd_mpu4=
01 *mpu, int input)
 		mpu->timer_invoked &=3D input ? ~MPU401_MODE_INPUT_TIMER :
 			~MPU401_MODE_OUTPUT_TIMER;
 		if (! mpu->timer_invoked)
-			del_timer(&mpu->timer);
+			timer_delete(&mpu->timer);
 	}
 	spin_unlock_irqrestore (&mpu->timer_lock, flags);
 }
diff --git a/sound/drivers/mtpav.c b/sound/drivers/mtpav.c
index 946184a2a758..dffcdf9e10d4 100644
--- a/sound/drivers/mtpav.c
+++ b/sound/drivers/mtpav.c
@@ -412,7 +412,7 @@ static void snd_mtpav_add_output_timer(struct mtpav *chip)
 /* spinlock held! */
 static void snd_mtpav_remove_output_timer(struct mtpav *chip)
 {
-	del_timer(&chip->timer);
+	timer_delete(&chip->timer);
 }
=20
 /*
diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index 75de1299c3dc..9fc78b7fb780 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -74,7 +74,7 @@ void snd_opl3_synth_cleanup(struct snd_opl3 * opl3)
 	/* Stop system timer */
 	spin_lock_irqsave(&opl3->sys_timer_lock, flags);
 	if (opl3->sys_timer_status) {
-		del_timer(&opl3->tlist);
+		timer_delete(&opl3->tlist);
 		opl3->sys_timer_status =3D 0;
 	}
 	spin_unlock_irqrestore(&opl3->sys_timer_lock, flags);
diff --git a/sound/drivers/serial-u16550.c b/sound/drivers/serial-u16550.c
index f66e01624c68..1857a78f55d7 100644
--- a/sound/drivers/serial-u16550.c
+++ b/sound/drivers/serial-u16550.c
@@ -166,7 +166,7 @@ static inline void snd_uart16550_add_timer(struct snd_uar=
t16550 *uart)
 static inline void snd_uart16550_del_timer(struct snd_uart16550 *uart)
 {
 	if (uart->timer_running) {
-		del_timer(&uart->buffer_timer);
+		timer_delete(&uart->buffer_timer);
 		uart->timer_running =3D 0;
 	}
 }
diff --git a/sound/i2c/other/ak4117.c b/sound/i2c/other/ak4117.c
index 165fdda8fda5..657b331d7a79 100644
--- a/sound/i2c/other/ak4117.c
+++ b/sound/i2c/other/ak4117.c
@@ -99,7 +99,7 @@ void snd_ak4117_reinit(struct ak4117 *chip)
 {
 	unsigned char old =3D chip->regmap[AK4117_REG_PWRDN], reg;
=20
-	del_timer(&chip->timer);
+	timer_delete(&chip->timer);
 	chip->init =3D 1;
 	/* bring the chip to reset state and powerdown state */
 	reg_write(chip, AK4117_REG_PWRDN, 0);
diff --git a/sound/isa/sb/emu8000_pcm.c b/sound/isa/sb/emu8000_pcm.c
index 9234d4fe8ada..016235209928 100644
--- a/sound/isa/sb/emu8000_pcm.c
+++ b/sound/isa/sb/emu8000_pcm.c
@@ -364,7 +364,7 @@ static void stop_voice(struct snd_emu8k_pcm *rec, int ch)
 	/* stop timer */
 	spin_lock_irqsave(&rec->timer_lock, flags);
 	if (rec->timer_running) {
-		del_timer(&rec->timer);
+		timer_delete(&rec->timer);
 		rec->timer_running =3D 0;
 	}
 	spin_unlock_irqrestore(&rec->timer_lock, flags);
diff --git a/sound/isa/sb/sb8_midi.c b/sound/isa/sb/sb8_midi.c
index 618366d5d984..d2908fc280f8 100644
--- a/sound/isa/sb/sb8_midi.c
+++ b/sound/isa/sb/sb8_midi.c
@@ -125,7 +125,7 @@ static int snd_sb8dsp_midi_output_close(struct snd_rawmid=
i_substream *substream)
 	struct snd_sb *chip;
=20
 	chip =3D substream->rmidi->private_data;
-	del_timer_sync(&chip->midi_timer);
+	timer_delete_sync(&chip->midi_timer);
 	spin_lock_irqsave(&chip->open_lock, flags);
 	chip->open &=3D ~(SB_OPEN_MIDI_OUTPUT | SB_OPEN_MIDI_OUTPUT_TRIGGER);
 	chip->midi_substream_output =3D NULL;
@@ -174,7 +174,7 @@ static void snd_sb8dsp_midi_output_write(struct snd_rawmi=
di_substream *substream
 		spin_lock_irqsave(&chip->open_lock, flags);
 		if (snd_rawmidi_transmit_peek(substream, &byte, 1) !=3D 1) {
 			chip->open &=3D ~SB_OPEN_MIDI_OUTPUT_TRIGGER;
-			del_timer(&chip->midi_timer);
+			timer_delete(&chip->midi_timer);
 			spin_unlock_irqrestore(&chip->open_lock, flags);
 			break;
 		}
diff --git a/sound/isa/wavefront/wavefront_midi.c b/sound/isa/wavefront/wavef=
ront_midi.c
index ead8cbe638de..fcc2a0d67792 100644
--- a/sound/isa/wavefront/wavefront_midi.c
+++ b/sound/isa/wavefront/wavefront_midi.c
@@ -157,7 +157,7 @@ static void snd_wavefront_midi_output_write(snd_wavefront=
_card_t *card)
 			} else {
 				if (midi->istimer) {
 					if (--midi->istimer <=3D 0)
-						del_timer(&midi->timer);
+						timer_delete(&midi->timer);
 				}
 				midi->mode[midi->output_mpu] &=3D ~MPU401_MODE_OUTPUT_TRIGGER;
 				spin_unlock_irqrestore (&midi->virtual, flags);
@@ -212,7 +212,7 @@ static void snd_wavefront_midi_output_write(snd_wavefront=
_card_t *card)
 			      __timer:
 				if (midi->istimer) {
 					if (--midi->istimer <=3D 0)
-						del_timer(&midi->timer);
+						timer_delete(&midi->timer);
 				}
 				midi->mode[mpu] &=3D ~MPU401_MODE_OUTPUT_TRIGGER;
 				spin_unlock_irqrestore (&midi->virtual, flags);
diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 5a84591b13fc..65100f925b72 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -518,7 +518,7 @@ static void snd_card_asihpi_pcm_timer_stop(struct snd_pcm=
_substream *substream)
 	struct snd_card_asihpi_pcm *dpcm =3D runtime->private_data;
=20
 	dpcm->respawn_timer =3D 0;
-	del_timer(&dpcm->timer);
+	timer_delete(&dpcm->timer);
 }
=20
 static void snd_card_asihpi_pcm_int_start(struct snd_pcm_substream *substrea=
m)
diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
index 0bb447ccd77c..89e47fa14f70 100644
--- a/sound/pci/ctxfi/cttimer.c
+++ b/sound/pci/ctxfi/cttimer.c
@@ -112,7 +112,7 @@ static void ct_systimer_stop(struct ct_timer_instance *ti)
=20
 	spin_lock_irqsave(&ti->lock, flags);
 	ti->running =3D 0;
-	del_timer(&ti->timer);
+	timer_delete(&ti->timer);
 	spin_unlock_irqrestore(&ti->lock, flags);
 }
=20
diff --git a/sound/pci/echoaudio/midi.c b/sound/pci/echoaudio/midi.c
index 47b2c023ee3d..2ef59184249c 100644
--- a/sound/pci/echoaudio/midi.c
+++ b/sound/pci/echoaudio/midi.c
@@ -264,7 +264,7 @@ static void snd_echo_midi_output_trigger(struct snd_rawmi=
di_substream *substream
 		if (chip->tinuse) {
 			chip->tinuse =3D 0;
 			spin_unlock_irq(&chip->lock);
-			del_timer_sync(&chip->timer);
+			timer_delete_sync(&chip->timer);
 			dev_dbg(chip->card->dev, "Timer removed\n");
 			return;
 		}
diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index fd3dfbad397a..dc326face54a 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -1427,7 +1427,7 @@ static void snd_hdsp_midi_output_trigger(struct snd_raw=
midi_substream *substream
 		}
 	} else {
 		if (hmidi->istimer && --hmidi->istimer <=3D 0)
-			del_timer (&hmidi->timer);
+			timer_delete(&hmidi->timer);
 	}
 	spin_unlock_irqrestore (&hmidi->lock, flags);
 	if (up)
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index f89718b19d23..1935de046f00 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -1978,7 +1978,7 @@ snd_hdspm_midi_output_trigger(struct snd_rawmidi_substr=
eam *substream, int up)
 		}
 	} else {
 		if (hmidi->istimer && --hmidi->istimer <=3D 0)
-			del_timer (&hmidi->timer);
+			timer_delete(&hmidi->timer);
 	}
 	spin_unlock_irqrestore (&hmidi->lock, flags);
 	if (up)
diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 39bf51ff43a1..5a93f4587356 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -354,7 +354,7 @@ static int snd_aicapcm_pcm_sync_stop(struct snd_pcm_subst=
ream *substream)
 {
 	struct snd_card_aica *dreamcastcard =3D substream->pcm->private_data;
=20
-	del_timer_sync(&dreamcastcard->timer);
+	timer_delete_sync(&dreamcastcard->timer);
 	cancel_work_sync(&dreamcastcard->spu_dma_work);
 	return 0;
 }
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 343e3bcef0ca..dba78efadc85 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -4286,7 +4286,7 @@ static void rt5645_i2c_remove(struct i2c_client *i2c)
 	 * Since the rt5645_btn_check_callback() can queue jack_detect_work,
 	 * the timer need to be delted first
 	 */
-	del_timer_sync(&rt5645->btn_check_timer);
+	timer_delete_sync(&rt5645->btn_check_timer);
=20
 	cancel_delayed_work_sync(&rt5645->jack_detect_work);
 	cancel_delayed_work_sync(&rt5645->rcclock_work);
@@ -4318,7 +4318,7 @@ static int rt5645_sys_suspend(struct device *dev)
 {
 	struct rt5645_priv *rt5645 =3D dev_get_drvdata(dev);
=20
-	del_timer_sync(&rt5645->btn_check_timer);
+	timer_delete_sync(&rt5645->btn_check_timer);
 	cancel_delayed_work_sync(&rt5645->jack_detect_work);
 	cancel_delayed_work_sync(&rt5645->rcclock_work);
=20
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 1daf0be3d100..de5f87600fac 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -301,7 +301,7 @@ static int imx_rpmsg_pcm_close(struct snd_soc_component *=
component,
=20
 	info->send_message(msg, info);
=20
-	del_timer(&info->stream_timer[substream->stream].timer);
+	timer_delete(&info->stream_timer[substream->stream].timer);
=20
 	rtd->dai_link->ignore_suspend =3D 0;
=20
@@ -452,7 +452,7 @@ static int imx_rpmsg_terminate_all(struct snd_soc_compone=
nt *component,
 		info->msg[RX_POINTER].r_msg.param.buffer_offset =3D 0;
 	}
=20
-	del_timer(&info->stream_timer[substream->stream].timer);
+	timer_delete(&info->stream_timer[substream->stream].timer);
=20
 	return imx_rpmsg_insert_workqueue(substream, msg, info);
 }
diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 8a4423646aea..9b8cb80ec81a 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -303,7 +303,7 @@ static void cx81801_close(struct tty_struct *tty)
 	struct snd_soc_component *component =3D tty->disc_data;
 	struct snd_soc_dapm_context *dapm;
=20
-	del_timer_sync(&cx81801_timer);
+	timer_delete_sync(&cx81801_timer);
=20
 	/* Prevent the hook switch from further changing the DAPM pins */
 	INIT_LIST_HEAD(&ams_delta_hook_switch.pins);
diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 826ac870f246..dcdd7e9e1ae9 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1553,7 +1553,7 @@ void snd_usbmidi_disconnect(struct list_head *p)
 	spin_unlock_irq(&umidi->disc_lock);
 	up_write(&umidi->disc_rwsem);
=20
-	del_timer_sync(&umidi->error_timer);
+	timer_delete_sync(&umidi->error_timer);
=20
 	for (i =3D 0; i < MIDI_MAX_ENDPOINTS; ++i) {
 		struct snd_usb_midi_endpoint *ep =3D &umidi->endpoints[i];
diff --git a/tools/perf/tests/shell/trace_btf_enum.sh b/tools/perf/tests/shel=
l/trace_btf_enum.sh
index 60b3fa254cf6..f0b49f7fb57d 100755
--- a/tools/perf/tests/shell/trace_btf_enum.sh
+++ b/tools/perf/tests/shell/trace_btf_enum.sh
@@ -6,7 +6,7 @@ err=3D0
 set -e
=20
 syscall=3D"landlock_add_rule"
-non_syscall=3D"timer:hrtimer_init,timer:hrtimer_start"
+non_syscall=3D"timer:hrtimer_setup,timer:hrtimer_start"
=20
 TESTPROG=3D"perf test -w landlock"
=20

