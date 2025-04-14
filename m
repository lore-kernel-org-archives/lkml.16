Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B5D1A0739
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626187; cv=none; b=r5McICMnwM5Qa9vKFMpIT7U7Bbzjvp2ookF1kMVmf9oEHbOia0zRugPMLSF/8OmZ03gsStnFnXrU9nIf+vDbkqSkkIEALkvQJ19OCqtyz6D3jGHPNtRpCqifAm0C9CewF3cUqKgCR3fq5wnhRJK5uyAUIyk0KMSM4g0BS7Cil9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626187; c=relaxed/simple;
	bh=nHODq+b7a36Ems7psXMSTTivnFdtb5oxfG8BFX4Phr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a/Y917sXzgJJ7lBAqLxNAPFtxdeBOF0j+zk4o5higkLR1tnMqHd2N3bQ1FYv+9Z3KgGf1+69L78qawpDVU8Rw+g1XT1KVh/3kz3WvWFoNYzOgcN7YDaPskFLXYvAHfg0r+pML8GcGxdtQsA8rHQkrBl/iOCkZZgx93OojV9s5Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qsx711FA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qsx711FA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAF4C4CEE2;
	Mon, 14 Apr 2025 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626187;
	bh=nHODq+b7a36Ems7psXMSTTivnFdtb5oxfG8BFX4Phr8=;
	h=From:To:Cc:Subject:Date:From;
	b=Qsx711FAZ8vY4v2b9LBlPA3Ti6IHmY6LbhmM0azeuP9pT0tFwwrzcKZt8hwihamB/
	 5ifNbCPlwzXUMq9PYmUDj9Up+HA8fE6wXVaso+70rLGQ8SAUdiWyjE/8B/lIE/HiTn
	 d1+1LV7oCdcoY7mZNb99+bKgFf9JBxLtsyeIdtXmALzAqIYzZ4GTYh4xRI76ywYSc8
	 emOa0EgIw+esGQHVJxL2tG22PJ9Iec3e95p/o1Lx7gJhcjcV3ag8JqYHCmzyjs+Sgd
	 hKYCfU87dxfl7uusxrS5Q3QMSuTaXvzHOlnxL6PYeYDoPWGXk2Zn3a07Gp05AzrwZy
	 Gln0DeGl+XdQw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 00/17] timers: Complete the timer_*() API renames
Date: Mon, 14 Apr 2025 12:22:34 +0200
Message-ID: <20250414102301.332225-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete the timer API namespace cleanup that begun with:

  8fa7292fee5c treewide: Switch/rename to timer_delete[_sync]()

The best way to view this series is to look at the right side
column of this table of renames, in order of API appearance
in <linux/timer.h>:

       add_timer_global()                  =>          timer_add_global()
       add_timer_local()                   =>          timer_add_local()
       from_timer()                        =>          timer_container_of()
       mod_timer_pending()                 =>          timer_mod_pending()
       timer_delete()              ... [unchanged] ... timer_delete()
       timer_reduce()              ... [unchanged] ... timer_reduce()
       timer_shutdown()            ... [unchanged] ... timer_shutdown()
       timer_shutdown_sync()       ... [unchanged] ... timer_shutdown_sync()
       try_to_del_timer_sync()             =>          timer_delete_sync_try()
       add_timer()                         =>          timer_add()
       add_timer_on()                      =>          timer_add_on()
       mod_timer()                         =>          timer_mod()
       timer_delete_sync()         ... [unchanged] ... timer_delete_sync()
       timer_setup_on_stack()      ... [unchanged] ... timer_setup_on_stack()
       destroy_timer_on_stack()            =>          timer_destroy_on_stack()
       timer_pending()             ... [unchanged] ... timer_pending()
       timer_setup()               ... [unchanged] ... timer_setup()
       init_timer_key()                    =>          timer_init_key()
       init_timer_on_stack_key()           =>          timer_init_on_stack_key()

       __init_timer()                      =>          __timer_init()
       __init_timer_on_stack()             =>          __timer_init_on_stack()

       NEXT_TIMER_MAX_DELTA                =>          TIMER_NEXT_MAX_DELTA

       init_timers()                       =>          timers_init()
       timers_dead_cpu()           ... [unchanged] ... timers_dead_cpu()
       timers_prepare_cpu()        ... [unchanged] ... timers_prepare_cpu()

... and to compare it with the hodgepodge of names on the left side.
It's a lot more organized at a glance.

There's two preparatory commits that move existing names out of
the way, plus the 15 renames, scripted.

Note that the -next cross section of this series is large:

   981 files changed, 3126 insertions(+), 3126 deletions(-)

So if/once the changes are acceptable, to reduce churn in -next and in
maintainer trees my plan would be to send this to Linus at the end of
the next merge window, shortly before v6.16-rc1, regenerated against
Linus's latest tree, similarly to how 8fa7292fee5c was handled.

Note that the conversion was done based on sed, not Coccinelle, which
makes sure names in comments and documentation are covered as well,
at the expense of a higher risk of false-positive conversions and
other mistakes.

The Git tree for these changes can be found in my tree at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.timers/core

Light testing done so far.

Thanks,

	Ingo

================>
Ingo Molnar (17):
  rust: Rename timer_container_of() to hrtimer_container_of()
  scsi: bfa: Rename 'timer_mod' to 'timer_module'
  treewide, timers: Rename add_timer_global() => timer_add_global()
  treewide, timers: Rename add_timer_local() => timer_add_local()
  treewide, timers: Rename from_timer() => timer_container_of()
  treewide, timers: Rename mod_timer_pending() => timer_mod_pending()
  treewide, timers: Rename try_to_del_timer_sync() => timer_delete_sync_try()
  treewide, timers: Rename add_timer() => timer_add()
  treewide, timers: Rename add_timer_on() => timer_add_on()
  treewide, timers: Rename mod_timer() => timer_mod()
  treewide, timers: Rename destroy_timer_on_stack() => timer_destroy_on_stack()
  treewide, timers: Rename init_timer_key() => timer_init_key()
  treewide, timers: Rename init_timer_on_stack_key() => timer_init_on_stack_key()
  treewide, timers: Rename __init_timer() => __timer_init()
  treewide, timers: Rename __init_timer_on_stack() => __timer_init_on_stack()
  treewide, timers: Rename NEXT_TIMER_MAX_DELTA => TIMER_NEXT_MAX_DELTA
  treewide, timers: Rename init_timers() => timers_init()

 .../RCU/Design/Requirements/Requirements.rst       |   2 +-
 Documentation/RCU/rcu_dereference.rst              |   2 +-
 Documentation/core-api/local_ops.rst               |   4 +-
 Documentation/kernel-hacking/locking.rst           |   4 +-
 Documentation/scsi/ChangeLog.lpfc                  |   6 +-
 Documentation/trace/ftrace.rst                     |   4 +-
 .../translations/it_IT/kernel-hacking/locking.rst  |   4 +-
 .../translations/zh_CN/core-api/local_ops.rst      |   4 +-
 arch/alpha/kernel/process.c                        |   2 +-
 arch/alpha/kernel/srmcons.c                        |   6 +-
 arch/arm/mach-footbridge/dc21285.c                 |   4 +-
 arch/arm/mach-omap1/pm.c                           |   2 +-
 arch/arm/mach-pxa/sharpsl_pm.c                     |   6 +-
 arch/arm/mach-s3c/s3c64xx.c                        |   4 +-
 arch/arm/mach-s3c/s3c64xx.h                        |   6 +-
 arch/m68k/amiga/amisound.c                         |   2 +-
 arch/m68k/mac/macboing.c                           |   6 +-
 arch/mips/sgi-ip22/ip22-reset.c                    |   8 +-
 arch/mips/sgi-ip32/ip32-reset.c                    |   4 +-
 arch/powerpc/kvm/booke.c                           |  12 +--
 arch/powerpc/mm/book3s64/hash_utils.c              |   4 +-
 arch/powerpc/platforms/cell/spufs/sched.c          |   8 +-
 arch/powerpc/platforms/powermac/low_i2c.c          |   8 +-
 arch/s390/kernel/lgr.c                             |   2 +-
 arch/s390/kernel/time.c                            |   6 +-
 arch/s390/kernel/topology.c                        |   4 +-
 arch/s390/lib/test_unwind.c                        |   2 +-
 arch/s390/mm/cmm.c                                 |   2 +-
 arch/sh/boards/mach-highlander/psw.c               |   2 +-
 arch/sh/boards/mach-landisk/psw.c                  |   2 +-
 arch/sh/drivers/heartbeat.c                        |   6 +-
 arch/sh/drivers/pci/common.c                       |   6 +-
 arch/sh/drivers/pci/pci-sh7780.c                   |   2 +-
 arch/sh/drivers/push-switch.c                      |   2 +-
 arch/sparc/kernel/irq.h                            |   2 +-
 arch/sparc/kernel/led.c                            |   2 +-
 arch/sparc/kernel/leon_kernel.c                    |   2 +-
 arch/sparc/kernel/sun4d_irq.c                      |   2 +-
 arch/sparc/kernel/sun4m_irq.c                      |   2 +-
 arch/sparc/kernel/time_32.c                        |   2 +-
 arch/sparc/kernel/viohs.c                          |   4 +-
 arch/um/drivers/vector_kern.c                      |   6 +-
 arch/x86/kernel/apic/vector.c                      |   6 +-
 arch/x86/kernel/cpu/mce/core.c                     |   2 +-
 arch/x86/kernel/tsc_sync.c                         |   4 +-
 arch/x86/kvm/cpuid.c                               |   4 +-
 arch/x86/kvm/lapic.c                               |  18 ++--
 arch/x86/kvm/lapic.h                               |   4 +-
 arch/x86/kvm/xen.c                                 |   4 +-
 arch/xtensa/platforms/iss/console.c                |   4 +-
 arch/xtensa/platforms/iss/network.c                |   6 +-
 arch/xtensa/platforms/xt2000/setup.c               |   4 +-
 block/blk-core.c                                   |   2 +-
 block/blk-iocost.c                                 |   2 +-
 block/blk-iolatency.c                              |   4 +-
 block/blk-mq.c                                     |   2 +-
 block/blk-stat.c                                   |   2 +-
 block/blk-stat.h                                   |   4 +-
 block/blk-throttle.c                               |   4 +-
 block/blk-timeout.c                                |   2 +-
 block/kyber-iosched.c                              |   2 +-
 drivers/accel/qaic/qaic_timesync.c                 |  12 +--
 drivers/accessibility/speakup/main.c               |   4 +-
 drivers/accessibility/speakup/synth.c              |   2 +-
 drivers/acpi/apei/ghes.c                           |   4 +-
 drivers/ata/libahci.c                              |   6 +-
 drivers/ata/libata-eh.c                            |   6 +-
 drivers/atm/idt77105.c                             |   8 +-
 drivers/atm/idt77252.c                             |  18 ++--
 drivers/atm/iphase.c                               |   6 +-
 drivers/atm/lanai.c                                |   6 +-
 drivers/atm/nicstar.c                              |   4 +-
 drivers/atm/suni.c                                 |   4 +-
 drivers/auxdisplay/line-display.c                  |   4 +-
 drivers/auxdisplay/panel.c                         |   4 +-
 drivers/base/power/main.c                          |   8 +-
 drivers/base/power/wakeup.c                        |   4 +-
 drivers/block/amiflop.c                            |  14 +--
 drivers/block/aoe/aoecmd.c                         |   4 +-
 drivers/block/aoe/aoedev.c                         |   6 +-
 drivers/block/aoe/aoemain.c                        |   2 +-
 drivers/block/ataflop.c                            |  14 +--
 drivers/block/drbd/drbd_main.c                     |   4 +-
 drivers/block/drbd/drbd_nl.c                       |   4 +-
 drivers/block/drbd/drbd_receiver.c                 |   4 +-
 drivers/block/drbd/drbd_req.c                      |   4 +-
 drivers/block/drbd/drbd_state.c                    |   4 +-
 drivers/block/drbd/drbd_worker.c                   |  14 +--
 drivers/block/floppy.c                             |   2 +-
 drivers/block/sunvdc.c                             |   2 +-
 drivers/block/swim3.c                              |  10 +-
 drivers/bluetooth/bluecard_cs.c                    |   6 +-
 drivers/bluetooth/btnxpuart.c                      |   4 +-
 drivers/bluetooth/hci_bcsp.c                       |   4 +-
 drivers/bluetooth/hci_h5.c                         |  10 +-
 drivers/bluetooth/hci_qca.c                        |  12 +--
 drivers/bus/mhi/host/pci_generic.c                 |  12 +--
 drivers/char/dtlk.c                                |   2 +-
 drivers/char/hangcheck-timer.c                     |   4 +-
 drivers/char/hw_random/xgene-rng.c                 |   4 +-
 drivers/char/ipmi/bt-bmc.c                         |   6 +-
 drivers/char/ipmi/ipmi_msghandler.c                |   6 +-
 drivers/char/ipmi/ipmi_si_intf.c                   |   4 +-
 drivers/char/ipmi/ipmi_ssif.c                      |  14 +--
 drivers/char/ipmi/kcs_bmc_aspeed.c                 |   4 +-
 drivers/char/ipmi/ssif_bmc.c                       |   4 +-
 drivers/char/nwbutton.c                            |   2 +-
 drivers/char/random.c                              |  10 +-
 drivers/char/tlclk.c                               |   2 +-
 drivers/char/tpm/tpm-dev-common.c                  |   6 +-
 drivers/clocksource/timer-ti-32k.c                 |   4 +-
 drivers/clocksource/timer-ti-dm.c                  |   6 +-
 drivers/comedi/drivers/addi_apci_3120.c            |  20 ++--
 drivers/comedi/drivers/addi_apci_3501.c            |   2 +-
 drivers/comedi/drivers/comedi_test.c               |  12 +--
 drivers/comedi/drivers/das16.c                     |   6 +-
 drivers/comedi/drivers/jr3_pci.c                   |   6 +-
 drivers/counter/rz-mtu3-cnt.c                      |  16 ++--
 drivers/cpufreq/powernv-cpufreq.c                  |   6 +-
 drivers/crypto/axis/artpec6_crypto.c               |   4 +-
 drivers/dma-buf/st-dma-fence.c                     |   6 +-
 drivers/dma/imx-dma.c                              |   4 +-
 drivers/dma/ioat/dma.c                             |  20 ++--
 drivers/firewire/core-transaction.c                |   6 +-
 drivers/firmware/psci/psci_checker.c               |   4 +-
 drivers/fpga/dfl-n3000-nios.c                      |  20 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |   4 +-
 drivers/gpu/drm/bridge/tda998x_drv.c               |   4 +-
 drivers/gpu/drm/drm_vblank.c                       |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |   6 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |   6 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   6 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |   6 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |   2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |   6 +-
 drivers/gpu/drm/i915/i915_sw_fence.c               |   4 +-
 drivers/gpu/drm/i915/i915_utils.c                  |   2 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |   4 +-
 drivers/gpu/drm/i915/selftests/lib_sw_fence.c      |   6 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   4 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   4 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   4 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   4 +-
 drivers/gpu/drm/msm/msm_io_utils.c                 |   4 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |   2 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |   6 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |   4 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |   4 +-
 drivers/gpu/drm/vgem/vgem_fence.c                  |   4 +-
 drivers/gpu/drm/xe/xe_execlist.c                   |   4 +-
 drivers/greybus/operation.c                        |   4 +-
 drivers/hid/hid-apple.c                            |   6 +-
 drivers/hid/hid-appleir.c                          |   6 +-
 drivers/hid/hid-appletb-kbd.c                      |   8 +-
 drivers/hid/hid-letsketch.c                        |   4 +-
 drivers/hid/hid-magicmouse.c                       |   6 +-
 drivers/hid/hid-multitouch.c                       |   4 +-
 drivers/hid/hid-nvidia-shield.c                    |   2 +-
 drivers/hid/hid-prodikeys.c                        |   4 +-
 drivers/hid/hid-sony.c                             |   6 +-
 drivers/hid/hid-uclogic-core.c                     |   4 +-
 drivers/hid/hid-wiimote-core.c                     |   8 +-
 drivers/hid/usbhid/hid-core.c                      |   4 +-
 drivers/hid/wacom_wac.c                            |   4 +-
 drivers/hsi/clients/ssi_protocol.c                 |  20 ++--
 drivers/hte/hte-tegra194-test.c                    |   4 +-
 drivers/hwmon/npcm750-pwm-fan.c                    |   6 +-
 drivers/hwmon/pwm-fan.c                            |   6 +-
 drivers/i2c/busses/i2c-img-scb.c                   |   8 +-
 drivers/iio/common/ssp_sensors/ssp_dev.c           |   6 +-
 drivers/infiniband/hw/cxgb4/cm.c                   |   4 +-
 drivers/infiniband/hw/hfi1/aspm.c                  |   4 +-
 drivers/infiniband/hw/hfi1/chip.c                  |  14 +--
 drivers/infiniband/hw/hfi1/driver.c                |   6 +-
 drivers/infiniband/hw/hfi1/mad.c                   |   4 +-
 drivers/infiniband/hw/hfi1/sdma.c                  |   4 +-
 drivers/infiniband/hw/hfi1/tid_rdma.c              |  12 +--
 drivers/infiniband/hw/hfi1/verbs.c                 |   6 +-
 drivers/infiniband/hw/irdma/cm.c                   |   6 +-
 drivers/infiniband/hw/irdma/utils.c                |  10 +-
 drivers/infiniband/hw/mlx5/mr.c                    |   4 +-
 drivers/infiniband/hw/mthca/mthca_catas.c          |   6 +-
 drivers/infiniband/hw/qib/qib_driver.c             |   8 +-
 drivers/infiniband/hw/qib/qib_iba6120.c            |  16 ++--
 drivers/infiniband/hw/qib/qib_iba7220.c            |  12 +--
 drivers/infiniband/hw/qib/qib_iba7322.c            |  12 +--
 drivers/infiniband/hw/qib/qib_init.c               |   8 +-
 drivers/infiniband/hw/qib/qib_intr.c               |   4 +-
 drivers/infiniband/hw/qib/qib_mad.c                |   6 +-
 drivers/infiniband/hw/qib/qib_sd7220.c             |  10 +-
 drivers/infiniband/hw/qib/qib_tx.c                 |   8 +-
 drivers/infiniband/hw/qib/qib_verbs.c              |   6 +-
 drivers/infiniband/sw/rdmavt/qp.c                  |   4 +-
 drivers/infiniband/sw/rxe/rxe_comp.c               |   6 +-
 drivers/infiniband/sw/rxe/rxe_req.c                |   4 +-
 drivers/input/ff-memless.c                         |   4 +-
 drivers/input/gameport/gameport.c                  |   6 +-
 drivers/input/input.c                              |   6 +-
 drivers/input/joystick/db9.c                       |   6 +-
 drivers/input/joystick/gamecon.c                   |   6 +-
 drivers/input/joystick/n64joy.c                    |   4 +-
 drivers/input/joystick/turbografx.c                |   6 +-
 drivers/input/keyboard/imx_keypad.c                |   8 +-
 drivers/input/keyboard/locomokbd.c                 |   4 +-
 drivers/input/keyboard/omap-keypad.c               |   2 +-
 drivers/input/keyboard/snvs_pwrkey.c               |   6 +-
 drivers/input/keyboard/tegra-kbc.c                 |   6 +-
 drivers/input/misc/nxp-bbnsm-pwrkey.c              |   6 +-
 drivers/input/mouse/alps.c                         |   4 +-
 drivers/input/mouse/byd.c                          |   4 +-
 drivers/input/serio/hil_mlc.c                      |   6 +-
 drivers/input/serio/hp_sdc.c                       |   4 +-
 drivers/input/touchscreen/ad7877.c                 |   4 +-
 drivers/input/touchscreen/ad7879.c                 |   4 +-
 drivers/input/touchscreen/bu21029_ts.c             |   4 +-
 drivers/input/touchscreen/exc3000.c                |   4 +-
 drivers/input/touchscreen/sx8654.c                 |   4 +-
 drivers/input/touchscreen/tsc200x-core.c           |   4 +-
 drivers/iommu/dma-iommu.c                          |   4 +-
 drivers/irqchip/irq-riscv-imsic-state.c            |   4 +-
 drivers/isdn/hardware/mISDN/hfcpci.c               |   8 +-
 drivers/isdn/hardware/mISDN/mISDNipac.c            |   4 +-
 drivers/isdn/hardware/mISDN/mISDNisar.c            |   4 +-
 drivers/isdn/hardware/mISDN/w6692.c                |   4 +-
 drivers/isdn/mISDN/dsp_cmx.c                       |   2 +-
 drivers/isdn/mISDN/dsp_core.c                      |   2 +-
 drivers/isdn/mISDN/dsp_tones.c                     |   6 +-
 drivers/isdn/mISDN/fsm.c                           |   6 +-
 drivers/isdn/mISDN/l1oip_core.c                    |  10 +-
 drivers/isdn/mISDN/timerdev.c                      |   4 +-
 drivers/leds/flash/leds-rt8515.c                   |   4 +-
 drivers/leds/flash/leds-sgm3140.c                  |   4 +-
 drivers/leds/led-core.c                            |   6 +-
 drivers/leds/leds-netxbig.c                        |   4 +-
 drivers/leds/trigger/ledtrig-activity.c            |   4 +-
 drivers/leds/trigger/ledtrig-heartbeat.c           |   4 +-
 drivers/leds/trigger/ledtrig-pattern.c             |   6 +-
 drivers/leds/trigger/ledtrig-transient.c           |   4 +-
 drivers/macintosh/smu.c                            |   2 +-
 drivers/mailbox/mailbox-altera.c                   |   6 +-
 drivers/md/bcache/stats.c                          |   6 +-
 drivers/md/dm-delay.c                              |   2 +-
 drivers/md/dm-integrity.c                          |   4 +-
 drivers/md/dm-mpath.c                              |   4 +-
 drivers/md/dm-raid1.c                              |   4 +-
 drivers/md/dm-vdo/dedupe.c                         |   4 +-
 drivers/md/dm-writecache.c                         |  10 +-
 drivers/md/md.c                                    |   6 +-
 drivers/media/common/saa7146/saa7146_fops.c        |   2 +-
 drivers/media/common/saa7146/saa7146_vbi.c         |   4 +-
 drivers/media/common/saa7146/saa7146_video.c       |   2 +-
 drivers/media/dvb-core/dmxdev.c                    |   4 +-
 drivers/media/i2c/tc358743.c                       |   6 +-
 drivers/media/i2c/tvaudio.c                        |   6 +-
 drivers/media/pci/bt8xx/bttv-driver.c              |   2 +-
 drivers/media/pci/bt8xx/bttv-input.c               |  10 +-
 drivers/media/pci/bt8xx/bttv-risc.c                |   2 +-
 drivers/media/pci/cx18/cx18-fileops.c              |   2 +-
 drivers/media/pci/cx18/cx18-mailbox.c              |   2 +-
 drivers/media/pci/cx18/cx18-streams.c              |   2 +-
 drivers/media/pci/ivtv/ivtv-irq.c                  |   8 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c |   4 +-
 drivers/media/pci/saa7134/saa7134-core.c           |   2 +-
 drivers/media/pci/saa7134/saa7134-input.c          |   6 +-
 drivers/media/pci/saa7134/saa7134-ts.c             |   2 +-
 drivers/media/pci/saa7134/saa7134-vbi.c            |   2 +-
 drivers/media/pci/saa7134/saa7134-video.c          |   2 +-
 drivers/media/pci/tw686x/tw686x-audio.c            |   2 +-
 drivers/media/pci/tw686x/tw686x-core.c             |   4 +-
 drivers/media/pci/tw686x/tw686x-video.c            |   2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |   6 +-
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |   6 +-
 drivers/media/radio/radio-cadet.c                  |   6 +-
 drivers/media/rc/ene_ir.c                          |   4 +-
 drivers/media/rc/igorplugusb.c                     |   4 +-
 drivers/media/rc/img-ir/img-ir-hw.c                |   8 +-
 drivers/media/rc/img-ir/img-ir-raw.c               |   4 +-
 drivers/media/rc/imon.c                            |   4 +-
 drivers/media/rc/ir-mce_kbd-decoder.c              |   4 +-
 drivers/media/rc/rc-ir-raw.c                       |   6 +-
 drivers/media/rc/rc-main.c                         |  12 +--
 drivers/media/rc/serial_ir.c                       |   2 +-
 drivers/media/usb/au0828/au0828-dvb.c              |   4 +-
 drivers/media/usb/au0828/au0828-video.c            |  20 ++--
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |  22 ++---
 drivers/media/usb/s2255/s2255drv.c                 |   4 +-
 drivers/memory/tegra/tegra210-emc-core.c           |  12 +--
 drivers/memstick/core/ms_block.c                   |   4 +-
 drivers/memstick/host/jmb38x_ms.c                  |   4 +-
 drivers/memstick/host/r592.c                       |   4 +-
 drivers/memstick/host/tifm_ms.c                    |   4 +-
 drivers/misc/bcm-vk/bcm_vk_tty.c                   |   6 +-
 drivers/misc/cardreader/rtsx_usb.c                 |   4 +-
 drivers/misc/sgi-xp/xpc.h                          |   2 +-
 drivers/misc/sgi-xp/xpc_main.c                     |   4 +-
 drivers/misc/sgi-xp/xpc_partition.c                |   6 +-
 drivers/mmc/core/host.c                            |   4 +-
 drivers/mmc/host/atmel-mci.c                       |  10 +-
 drivers/mmc/host/dw_mmc.c                          |  12 +--
 drivers/mmc/host/jz4740_mmc.c                      |   6 +-
 drivers/mmc/host/meson-mx-sdio.c                   |   4 +-
 drivers/mmc/host/mvsdio.c                          |   4 +-
 drivers/mmc/host/mxcmmc.c                          |   4 +-
 drivers/mmc/host/omap.c                            |  12 +--
 drivers/mmc/host/sdhci.c                           |   8 +-
 drivers/mmc/host/tifm_sd.c                         |   4 +-
 drivers/mmc/host/via-sdmmc.c                       |   4 +-
 drivers/mmc/host/vub300.c                          |  22 ++---
 drivers/mmc/host/wbsd.c                            |   4 +-
 drivers/most/most_usb.c                            |   6 +-
 drivers/mtd/sm_ftl.c                               |   4 +-
 drivers/net/arcnet/arcnet.c                        |   6 +-
 drivers/net/can/grcan.c                            |   6 +-
 drivers/net/can/kvaser_pciefd.c                    |   8 +-
 drivers/net/can/sja1000/peak_pcmcia.c              |   6 +-
 drivers/net/can/usb/peak_usb/pcan_usb.c            |   4 +-
 drivers/net/dsa/mv88e6xxx/phy.c                    |   4 +-
 drivers/net/dsa/sja1105/sja1105_ptp.c              |   2 +-
 drivers/net/eql.c                                  |   6 +-
 drivers/net/ethernet/3com/3c515.c                  |   6 +-
 drivers/net/ethernet/3com/3c574_cs.c               |   8 +-
 drivers/net/ethernet/3com/3c589_cs.c               |   8 +-
 drivers/net/ethernet/3com/3c59x.c                  |  10 +-
 drivers/net/ethernet/8390/axnet_cs.c               |   8 +-
 drivers/net/ethernet/8390/pcnet_cs.c               |   8 +-
 drivers/net/ethernet/agere/et131x.c                |   6 +-
 drivers/net/ethernet/amazon/ena/ena_netdev.c       |   8 +-
 drivers/net/ethernet/amd/a2065.c                   |   4 +-
 drivers/net/ethernet/amd/amd8111e.c                |   8 +-
 drivers/net/ethernet/amd/declance.c                |   4 +-
 drivers/net/ethernet/amd/pcnet32.c                 |   6 +-
 drivers/net/ethernet/amd/pds_core/main.c           |   8 +-
 drivers/net/ethernet/amd/sunlance.c                |   4 +-
 drivers/net/ethernet/amd/xgbe/xgbe-dev.c           |   2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c           |  10 +-
 drivers/net/ethernet/apple/bmac.c                  |   4 +-
 drivers/net/ethernet/apple/mace.c                  |   4 +-
 drivers/net/ethernet/aquantia/atlantic/aq_nic.c    |  10 +-
 drivers/net/ethernet/atheros/ag71xx.c              |   4 +-
 drivers/net/ethernet/atheros/atl1c/atl1c_main.c    |   2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_main.c    |   2 +-
 drivers/net/ethernet/atheros/atlx/atl1.c           |   4 +-
 drivers/net/ethernet/atheros/atlx/atl2.c           |  10 +-
 drivers/net/ethernet/broadcom/b44.c                |   8 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.c       |  10 +-
 drivers/net/ethernet/broadcom/bnx2.c               |  10 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c    |   2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c   |   4 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |   6 +-
 drivers/net/ethernet/broadcom/tg3.c                |   6 +-
 drivers/net/ethernet/brocade/bna/bfa_ioc.c         |  20 ++--
 drivers/net/ethernet/brocade/bna/bnad.c            |  22 ++---
 drivers/net/ethernet/chelsio/cxgb/sge.c            |  16 ++--
 drivers/net/ethernet/chelsio/cxgb3/sge.c           |  12 +--
 .../net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c   |   6 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c           |  12 +--
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c         |  12 +--
 drivers/net/ethernet/cisco/enic/enic_clsf.c        |   4 +-
 drivers/net/ethernet/cisco/enic/enic_clsf.h        |   2 +-
 drivers/net/ethernet/cisco/enic/enic_main.c        |   6 +-
 drivers/net/ethernet/dec/tulip/21142.c             |   8 +-
 drivers/net/ethernet/dec/tulip/de2104x.c           |  20 ++--
 drivers/net/ethernet/dec/tulip/dmfe.c              |  10 +-
 drivers/net/ethernet/dec/tulip/interrupt.c         |   8 +-
 drivers/net/ethernet/dec/tulip/pnic.c              |   4 +-
 drivers/net/ethernet/dec/tulip/pnic2.c             |  10 +-
 drivers/net/ethernet/dec/tulip/timer.c             |  14 +--
 drivers/net/ethernet/dec/tulip/tulip_core.c        |   4 +-
 drivers/net/ethernet/dec/tulip/uli526x.c           |   8 +-
 drivers/net/ethernet/dec/tulip/winbond-840.c       |   8 +-
 drivers/net/ethernet/dlink/dl2k.c                  |   8 +-
 drivers/net/ethernet/fealnx.c                      |  10 +-
 drivers/net/ethernet/google/gve/gve_ethtool.c      |   2 +-
 drivers/net/ethernet/google/gve/gve_main.c         |   6 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c      |   6 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |   6 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |   4 +-
 drivers/net/ethernet/intel/e100.c                  |   8 +-
 drivers/net/ethernet/intel/e1000e/netdev.c         |  16 ++--
 drivers/net/ethernet/intel/fm10k/fm10k_pci.c       |   8 +-
 drivers/net/ethernet/intel/i40e/i40e_main.c        |  10 +-
 drivers/net/ethernet/intel/ice/ice_main.c          |  14 +--
 drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c |   4 +-
 drivers/net/ethernet/intel/igb/igb_main.c          |  18 ++--
 drivers/net/ethernet/intel/igbvf/netdev.c          |  10 +-
 drivers/net/ethernet/intel/igc/igc_main.c          |  18 ++--
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c      |   6 +-
 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c  |   6 +-
 drivers/net/ethernet/korina.c                      |   6 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c         |  12 +--
 drivers/net/ethernet/marvell/pxa168_eth.c          |   4 +-
 drivers/net/ethernet/marvell/skge.c                |   8 +-
 drivers/net/ethernet/marvell/sky2.c                |   6 +-
 drivers/net/ethernet/mellanox/mlx4/catas.c         |   6 +-
 drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c |   6 +-
 drivers/net/ethernet/mellanox/mlx5/core/health.c   |   6 +-
 drivers/net/ethernet/micrel/ksz884x.c              |  10 +-
 drivers/net/ethernet/myricom/myri10ge/myri10ge.c   |   6 +-
 drivers/net/ethernet/natsemi/natsemi.c             |  12 +--
 drivers/net/ethernet/natsemi/ns83820.c             |   6 +-
 drivers/net/ethernet/neterion/s2io.c               |   6 +-
 .../net/ethernet/netronome/nfp/nfp_net_common.c    |   4 +-
 drivers/net/ethernet/nvidia/forcedeth.c            |  34 +++----
 .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   |   6 +-
 drivers/net/ethernet/packetengines/hamachi.c       |   6 +-
 drivers/net/ethernet/packetengines/yellowfin.c     |   6 +-
 drivers/net/ethernet/pasemi/pasemi_mac.c           |   8 +-
 .../net/ethernet/pensando/ionic/ionic_bus_pci.c    |   4 +-
 drivers/net/ethernet/pensando/ionic/ionic_dev.c    |   4 +-
 drivers/net/ethernet/pensando/ionic/ionic_lif.c    |   2 +-
 drivers/net/ethernet/qlogic/qla3xxx.c              |   8 +-
 drivers/net/ethernet/realtek/atp.c                 |   8 +-
 drivers/net/ethernet/rocker/rocker_ofdpa.c         |   8 +-
 drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c    |  14 +--
 drivers/net/ethernet/seeq/ether3.c                 |   4 +-
 drivers/net/ethernet/sfc/falcon/efx.c              |   2 +-
 drivers/net/ethernet/sfc/falcon/falcon.c           |   4 +-
 drivers/net/ethernet/sfc/falcon/rx.c               |   2 +-
 drivers/net/ethernet/sfc/mcdi.c                    |   6 +-
 drivers/net/ethernet/sfc/rx_common.c               |   4 +-
 drivers/net/ethernet/sfc/siena/mcdi.c              |   6 +-
 drivers/net/ethernet/sfc/siena/rx_common.c         |   4 +-
 drivers/net/ethernet/sgi/ioc3-eth.c                |   6 +-
 drivers/net/ethernet/sis/sis190.c                  |   8 +-
 drivers/net/ethernet/sis/sis900.c                  |   6 +-
 drivers/net/ethernet/smsc/epic100.c                |   6 +-
 drivers/net/ethernet/smsc/smc91c92_cs.c            |   8 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c   |   6 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   4 +-
 drivers/net/ethernet/sun/cassini.c                 |  12 +--
 drivers/net/ethernet/sun/niu.c                     |  12 +--
 drivers/net/ethernet/sun/sunbmac.c                 |   6 +-
 drivers/net/ethernet/sun/sungem.c                  |   8 +-
 drivers/net/ethernet/sun/sunhme.c                  |   6 +-
 drivers/net/ethernet/sun/sunvnet_common.c          |   8 +-
 drivers/net/ethernet/synopsys/dwc-xlgmac-hw.c      |   2 +-
 drivers/net/ethernet/synopsys/dwc-xlgmac-net.c     |   2 +-
 drivers/net/ethernet/ti/cpsw_ale.c                 |   6 +-
 drivers/net/ethernet/ti/netcp_ethss.c              |   6 +-
 drivers/net/ethernet/ti/tlan.c                     |  18 ++--
 drivers/net/ethernet/tundra/tsi108_eth.c           |   6 +-
 drivers/net/fddi/defza.c                           |   6 +-
 drivers/net/hamradio/6pack.c                       |  12 +--
 drivers/net/hamradio/scc.c                         |  22 ++---
 drivers/net/hamradio/yam.c                         |   4 +-
 drivers/net/hippi/rrunner.c                        |   6 +-
 drivers/net/ntb_netdev.c                           |   6 +-
 drivers/net/phy/phylink.c                          |   6 +-
 drivers/net/slip/slip.c                            |  20 ++--
 drivers/net/tun.c                                  |   8 +-
 drivers/net/usb/catc.c                             |   6 +-
 drivers/net/usb/lan78xx.c                          |  10 +-
 drivers/net/usb/sierra_net.c                       |   4 +-
 drivers/net/usb/usbnet.c                           |   6 +-
 drivers/net/vxlan/vxlan_core.c                     |   8 +-
 drivers/net/wan/hdlc_cisco.c                       |   6 +-
 drivers/net/wan/hdlc_fr.c                          |   6 +-
 drivers/net/wan/hdlc_ppp.c                         |  10 +-
 drivers/net/wireguard/timers.c                     |  12 +--
 drivers/net/wireless/ath/ar5523/ar5523.c           |   6 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c           |   6 +-
 drivers/net/wireless/ath/ath10k/pci.c              |   8 +-
 drivers/net/wireless/ath/ath10k/sdio.c             |   4 +-
 drivers/net/wireless/ath/ath10k/snoc.c             |   4 +-
 drivers/net/wireless/ath/ath11k/ce.c               |   6 +-
 drivers/net/wireless/ath/ath11k/dp.c               |   6 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c            |  10 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c            |   2 +-
 drivers/net/wireless/ath/ath11k/mac.c              |   2 +-
 drivers/net/wireless/ath/ath12k/ce.c               |   6 +-
 drivers/net/wireless/ath/ath12k/dp.c               |   4 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |   4 +-
 drivers/net/wireless/ath/ath6kl/cfg80211.c         |   2 +-
 drivers/net/wireless/ath/ath6kl/main.c             |   2 +-
 drivers/net/wireless/ath/ath6kl/recovery.c         |  10 +-
 drivers/net/wireless/ath/ath6kl/txrx.c             |   6 +-
 drivers/net/wireless/ath/ath6kl/wmi.c              |   4 +-
 drivers/net/wireless/ath/ath9k/channel.c           |  12 +--
 drivers/net/wireless/ath/ath9k/gpio.c              |  10 +-
 drivers/net/wireless/ath/ath9k/htc_drv_main.c      |   6 +-
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c      |   4 +-
 drivers/net/wireless/ath/ath9k/link.c              |   6 +-
 drivers/net/wireless/ath/ath9k/main.c              |   4 +-
 drivers/net/wireless/ath/wcn36xx/dxe.c             |   4 +-
 drivers/net/wireless/ath/wil6210/cfg80211.c        |   6 +-
 drivers/net/wireless/ath/wil6210/netdev.c          |   6 +-
 drivers/net/wireless/ath/wil6210/p2p.c             |   4 +-
 drivers/net/wireless/atmel/at76c50x-usb.c          |   4 +-
 .../wireless/broadcom/brcm80211/brcmfmac/btcoex.c  |   8 +-
 .../broadcom/brcm80211/brcmfmac/cfg80211.c         |   4 +-
 .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    |   8 +-
 .../wireless/broadcom/brcm80211/brcmfmac/sdio.c    |   8 +-
 drivers/net/wireless/intel/ipw2x00/libipw_crypto.c |   6 +-
 drivers/net/wireless/intel/iwlegacy/3945-rs.c      |   6 +-
 drivers/net/wireless/intel/iwlegacy/4965-mac.c     |   4 +-
 drivers/net/wireless/intel/iwlegacy/common.c       |   6 +-
 drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c   |   2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/main.c      |   8 +-
 drivers/net/wireless/intel/iwlwifi/dvm/rx.c        |   2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/tt.c        |  10 +-
 drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c   |   6 +-
 drivers/net/wireless/intel/iwlwifi/mld/agg.c       |   6 +-
 drivers/net/wireless/intel/iwlwifi/mvm/sta.c       |   6 +-
 drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c  |   4 +-
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c       |  10 +-
 drivers/net/wireless/marvell/libertas/cmd.c        |   2 +-
 drivers/net/wireless/marvell/libertas/if_usb.c     |   4 +-
 drivers/net/wireless/marvell/libertas/main.c       |   6 +-
 drivers/net/wireless/marvell/libertas_tf/cmd.c     |   2 +-
 drivers/net/wireless/marvell/libertas_tf/if_usb.c  |   4 +-
 drivers/net/wireless/marvell/libertas_tf/main.c    |   2 +-
 .../net/wireless/marvell/mwifiex/11n_rxreorder.c   |   4 +-
 drivers/net/wireless/marvell/mwifiex/cmdevt.c      |   4 +-
 drivers/net/wireless/marvell/mwifiex/init.c        |   2 +-
 drivers/net/wireless/marvell/mwifiex/main.c        |   2 +-
 drivers/net/wireless/marvell/mwifiex/tdls.c        |   6 +-
 drivers/net/wireless/marvell/mwifiex/usb.c         |   8 +-
 drivers/net/wireless/mediatek/mt76/mt7615/main.c   |   2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c    |   2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/main.c   |   4 +-
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c    |   2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c    |   2 +-
 drivers/net/wireless/mediatek/mt76/mt792x_core.c   |   4 +-
 drivers/net/wireless/microchip/wilc1000/cfg80211.c |   2 +-
 drivers/net/wireless/microchip/wilc1000/hif.c      |  16 ++--
 drivers/net/wireless/purelifi/plfxlc/usb.c         |  12 +--
 drivers/net/wireless/realtek/rtlwifi/base.c        |   4 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/dm.c    |   4 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/hw.c    |   8 +-
 .../net/wireless/realtek/rtlwifi/rtl8192ee/hw.c    |   6 +-
 .../net/wireless/realtek/rtlwifi/rtl8723be/hw.c    |   6 +-
 .../net/wireless/realtek/rtlwifi/rtl8821ae/hw.c    |   6 +-
 drivers/net/wireless/realtek/rtw88/tx.c            |   4 +-
 drivers/net/wireless/rsi/rsi_91x_hal.c             |   4 +-
 drivers/net/wireless/rsi/rsi_91x_mac80211.c        |   4 +-
 drivers/net/wireless/st/cw1200/pm.c                |   2 +-
 drivers/net/wireless/st/cw1200/queue.c             |   6 +-
 drivers/net/wireless/st/cw1200/sta.c               |   4 +-
 drivers/net/wireless/ti/wlcore/main.c              |   4 +-
 drivers/net/wireless/ti/wlcore/tx.c                |   2 +-
 drivers/net/xen-netback/netback.c                  |   4 +-
 drivers/net/xen-netback/xenbus.c                   |   2 +-
 drivers/net/xen-netfront.c                         |   4 +-
 drivers/nfc/nfcmrvl/fw_dnld.c                      |   4 +-
 drivers/nfc/pn533/pn533.c                          |   6 +-
 drivers/nfc/pn533/uart.c                           |   4 +-
 drivers/nfc/st-nci/ndlc.c                          |  12 +--
 drivers/nfc/st-nci/se.c                            |  12 +--
 drivers/nfc/st21nfca/core.c                        |   2 +-
 drivers/nfc/st21nfca/se.c                          |  10 +-
 drivers/nvme/host/multipath.c                      |   4 +-
 drivers/parport/ieee1284.c                         |   4 +-
 drivers/pci/hotplug/cpqphp_ctrl.c                  |   6 +-
 drivers/pci/hotplug/shpchp_hpc.c                   |   4 +-
 drivers/pcmcia/bcm63xx_pcmcia.c                    |   6 +-
 drivers/pcmcia/electra_cf.c                        |   4 +-
 drivers/pcmcia/i82365.c                            |   4 +-
 drivers/pcmcia/omap_cf.c                           |   6 +-
 drivers/pcmcia/pd6729.c                            |   6 +-
 drivers/pcmcia/soc_common.c                        |   4 +-
 drivers/pcmcia/tcic.c                              |   2 +-
 drivers/pcmcia/yenta_socket.c                      |   6 +-
 drivers/platform/mellanox/mlxbf-tmfifo.c           |   4 +-
 drivers/platform/x86/intel_ips.c                   |   4 +-
 drivers/platform/x86/sony-laptop.c                 |   4 +-
 drivers/pps/clients/pps-gpio.c                     |   6 +-
 drivers/pps/clients/pps-ktimer.c                   |   4 +-
 drivers/pps/generators/pps_gen-dummy.c             |   2 +-
 drivers/ptp/ptp_ocp.c                              |   6 +-
 drivers/rtc/dev.c                                  |   4 +-
 drivers/rtc/rtc-test.c                             |   6 +-
 drivers/s390/block/dasd.c                          |   8 +-
 drivers/s390/char/con3215.c                        |   6 +-
 drivers/s390/char/con3270.c                        |   4 +-
 drivers/s390/char/sclp.c                           |   6 +-
 drivers/s390/char/sclp_con.c                       |   2 +-
 drivers/s390/char/sclp_tty.c                       |   2 +-
 drivers/s390/char/sclp_vt220.c                     |   2 +-
 drivers/s390/char/tape_core.c                      |   4 +-
 drivers/s390/char/tape_std.c                       |   4 +-
 drivers/s390/cio/device.c                          |   4 +-
 drivers/s390/cio/device_fsm.c                      |   4 +-
 drivers/s390/cio/eadm_sch.c                        |   4 +-
 drivers/s390/crypto/ap_bus.c                       |   6 +-
 drivers/s390/crypto/ap_queue.c                     |   4 +-
 drivers/s390/net/fsm.c                             |   6 +-
 drivers/s390/net/qeth_core_main.c                  |   2 +-
 drivers/s390/scsi/zfcp_erp.c                       |   6 +-
 drivers/s390/scsi/zfcp_fsf.c                       |   6 +-
 drivers/s390/scsi/zfcp_qdio.c                      |   2 +-
 drivers/scsi/aic7xxx/aic79xx_core.c                |   4 +-
 drivers/scsi/aic94xx/aic94xx_hwi.c                 |   2 +-
 drivers/scsi/aic94xx/aic94xx_scb.c                 |   2 +-
 drivers/scsi/aic94xx/aic94xx_tmf.c                 |   6 +-
 drivers/scsi/arcmsr/arcmsr_hba.c                   |  18 ++--
 drivers/scsi/arm/fas216.c                          |   6 +-
 drivers/scsi/be2iscsi/be_main.c                    |  10 +-
 drivers/scsi/bfa/bfa.h                             |   2 +-
 drivers/scsi/bfa/bfa_core.c                        |   4 +-
 drivers/scsi/bfa/bfa_ioc.c                         |  20 ++--
 drivers/scsi/bfa/bfa_ioc.h                         |  10 +-
 drivers/scsi/bfa/bfa_modules.h                     |   2 +-
 drivers/scsi/bfa/bfad.c                            |   8 +-
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c                  |   4 +-
 drivers/scsi/bnx2fc/bnx2fc_tgt.c                   |   8 +-
 drivers/scsi/bnx2i/bnx2i_hwi.c                     |   2 +-
 drivers/scsi/bnx2i/bnx2i_iscsi.c                   |   8 +-
 drivers/scsi/csiostor/csio_hw.c                    |   6 +-
 drivers/scsi/csiostor/csio_mb.c                    |   2 +-
 drivers/scsi/cxgbi/cxgb3i/cxgb3i.c                 |   4 +-
 drivers/scsi/cxgbi/cxgb4i/cxgb4i.c                 |   4 +-
 drivers/scsi/dc395x.c                              |   6 +-
 drivers/scsi/elx/efct/efct_xport.c                 |   4 +-
 drivers/scsi/elx/libefc/efc_els.c                  |   4 +-
 drivers/scsi/elx/libefc/efc_fabric.c               |   4 +-
 drivers/scsi/esas2r/esas2r_main.c                  |   4 +-
 drivers/scsi/fcoe/fcoe_ctlr.c                      |  14 +--
 drivers/scsi/fcoe/fcoe_transport.c                 |   4 +-
 drivers/scsi/fnic/fdls_disc.c                      |  16 ++--
 drivers/scsi/fnic/fip.c                            |  30 +++---
 drivers/scsi/fnic/fnic_main.c                      |   6 +-
 drivers/scsi/hisi_sas/hisi_sas_main.c              |   4 +-
 drivers/scsi/hisi_sas/hisi_sas_v1_hw.c             |   4 +-
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c             |  14 +--
 drivers/scsi/ibmvscsi/ibmvfc.c                     |  10 +-
 drivers/scsi/ibmvscsi/ibmvscsi.c                   |   4 +-
 drivers/scsi/ipr.c                                 |  16 ++--
 drivers/scsi/isci/host.c                           |   6 +-
 drivers/scsi/isci/isci.h                           |   2 +-
 drivers/scsi/isci/phy.c                            |   2 +-
 drivers/scsi/isci/port.c                           |   2 +-
 drivers/scsi/isci/port_config.c                    |   4 +-
 drivers/scsi/libfc/fc_fcp.c                        |   6 +-
 drivers/scsi/libiscsi.c                            |  12 +--
 drivers/scsi/libsas/sas_expander.c                 |   2 +-
 drivers/scsi/libsas/sas_scsi_host.c                |   6 +-
 drivers/scsi/lpfc/lpfc_ct.c                        |   2 +-
 drivers/scsi/lpfc/lpfc_els.c                       |  20 ++--
 drivers/scsi/lpfc/lpfc_hbadisc.c                   |   4 +-
 drivers/scsi/lpfc/lpfc_init.c                      |  26 +++---
 drivers/scsi/lpfc/lpfc_nportdisc.c                 |  14 +--
 drivers/scsi/lpfc/lpfc_scsi.c                      |   4 +-
 drivers/scsi/lpfc/lpfc_sli.c                       |  26 +++---
 drivers/scsi/lpfc/lpfc_vmid.c                      |   2 +-
 drivers/scsi/megaraid/megaraid_mbox.c              |   6 +-
 drivers/scsi/megaraid/megaraid_mm.c                |   6 +-
 drivers/scsi/megaraid/megaraid_sas_base.c          |   6 +-
 drivers/scsi/mvsas/mv_sas.c                        |   4 +-
 drivers/scsi/ncr53c8xx.c                           |   4 +-
 drivers/scsi/pmcraid.c                             |  18 ++--
 drivers/scsi/qla1280.c                             |   4 +-
 drivers/scsi/qla2xxx/qla_edif.c                    |   4 +-
 drivers/scsi/qla2xxx/qla_init.c                    |   2 +-
 drivers/scsi/qla2xxx/qla_iocb.c                    |   2 +-
 drivers/scsi/qla2xxx/qla_os.c                      |   6 +-
 drivers/scsi/qla4xxx/ql4_os.c                      |   8 +-
 drivers/scsi/smartpqi/smartpqi_init.c              |   6 +-
 drivers/scsi/sym53c8xx_2/sym_glue.c                |   4 +-
 .../staging/gpib/agilent_82357a/agilent_82357a.c   |   6 +-
 drivers/staging/gpib/common/gpib_os.c              |  10 +-
 drivers/staging/gpib/common/iblib.c                |   6 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c          |   6 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c        |   6 +-
 drivers/staging/media/imx/imx-media-csi.c          |   6 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c           |   8 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c          |   4 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c      |   8 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c       |   4 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c          |   4 +-
 .../rtl8723bs/include/osdep_service_linux.h        |   2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h   |   2 +-
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c      |   4 +-
 drivers/target/iscsi/iscsi_target_erl0.c           |   4 +-
 drivers/target/iscsi/iscsi_target_erl1.c           |   6 +-
 drivers/target/iscsi/iscsi_target_util.c           |  14 +--
 drivers/target/target_core_user.c                  |   8 +-
 drivers/tty/ipwireless/hardware.c                  |   4 +-
 drivers/tty/mips_ejtag_fdc.c                       |   8 +-
 drivers/tty/moxa.c                                 |   4 +-
 drivers/tty/n_gsm.c                                |  32 +++----
 drivers/tty/serial/8250/8250_aspeed_vuart.c        |   6 +-
 drivers/tty/serial/8250/8250_core.c                |  12 +--
 drivers/tty/serial/altera_uart.c                   |   6 +-
 drivers/tty/serial/amba-pl011.c                    |   8 +-
 drivers/tty/serial/atmel_serial.c                  |   8 +-
 drivers/tty/serial/fsl_lpuart.c                    |   8 +-
 drivers/tty/serial/imx.c                           |   6 +-
 drivers/tty/serial/liteuart.c                      |   6 +-
 drivers/tty/serial/max3100.c                       |   6 +-
 drivers/tty/serial/mux.c                           |   4 +-
 drivers/tty/serial/sa1100.c                        |   6 +-
 drivers/tty/serial/sccnxp.c                        |   6 +-
 drivers/tty/serial/sh-sci.c                        |   4 +-
 drivers/tty/synclink_gt.c                          |   8 +-
 drivers/tty/sysrq.c                                |   4 +-
 drivers/tty/vcc.c                                  |   8 +-
 drivers/tty/vt/keyboard.c                          |   2 +-
 drivers/tty/vt/vt.c                                |   8 +-
 drivers/usb/atm/cxacru.c                           |   6 +-
 drivers/usb/atm/speedtch.c                         |  12 +--
 drivers/usb/atm/usbatm.c                           |   6 +-
 drivers/usb/chipidea/otg_fsm.c                     |   2 +-
 drivers/usb/core/hcd.c                             |  10 +-
 drivers/usb/core/hub.c                             |   4 +-
 drivers/usb/dwc2/core_intr.c                       |   2 +-
 drivers/usb/dwc2/hcd.c                             |   6 +-
 drivers/usb/dwc2/hcd_queue.c                       |   4 +-
 drivers/usb/fotg210/fotg210-hcd.c                  |   4 +-
 drivers/usb/gadget/legacy/zero.c                   |   2 +-
 drivers/usb/gadget/udc/at91_udc.c                  |   6 +-
 drivers/usb/gadget/udc/dummy_hcd.c                 |   4 +-
 drivers/usb/gadget/udc/m66592-udc.c                |  10 +-
 drivers/usb/gadget/udc/omap_udc.c                  |   6 +-
 drivers/usb/gadget/udc/pxa25x_udc.c                |   2 +-
 drivers/usb/gadget/udc/pxa25x_udc.h                |   2 +-
 drivers/usb/gadget/udc/r8a66597-udc.c              |  10 +-
 drivers/usb/gadget/udc/snps_udc_core.c             |  26 +++---
 drivers/usb/host/ehci-hcd.c                        |   2 +-
 drivers/usb/host/ehci-hub.c                        |   4 +-
 drivers/usb/host/ehci-platform.c                   |   6 +-
 drivers/usb/host/isp116x-hcd.c                     |   2 +-
 drivers/usb/host/ohci-hcd.c                        |   6 +-
 drivers/usb/host/oxu210hp-hcd.c                    |   8 +-
 drivers/usb/host/r8a66597-hcd.c                    |  14 +--
 drivers/usb/host/sl811-hcd.c                       |   6 +-
 drivers/usb/host/uhci-hcd.c                        |   4 +-
 drivers/usb/host/uhci-hub.c                        |   2 +-
 drivers/usb/host/uhci-q.c                          |   6 +-
 drivers/usb/host/xen-hcd.c                         |   4 +-
 drivers/usb/host/xhci-hub.c                        |   2 +-
 drivers/usb/host/xhci-ring.c                       |   2 +-
 drivers/usb/host/xhci.c                            |   6 +-
 drivers/usb/isp1760/isp1760-hcd.c                  |   6 +-
 drivers/usb/isp1760/isp1760-udc.c                  |   6 +-
 drivers/usb/misc/usbtest.c                         |   6 +-
 drivers/usb/musb/da8xx.c                           |  12 +--
 drivers/usb/musb/mpfs.c                            |  12 +--
 drivers/usb/musb/musb_core.c                       |   6 +-
 drivers/usb/musb/musb_dsps.c                       |   4 +-
 drivers/usb/musb/musb_virthub.c                    |   2 +-
 drivers/usb/musb/tusb6010.c                        |   4 +-
 drivers/usb/phy/phy-fsl-usb.c                      |   2 +-
 drivers/usb/phy/phy-mv-usb.c                       |   4 +-
 drivers/usb/serial/garmin_gps.c                    |   4 +-
 drivers/usb/serial/mos7840.c                       |   8 +-
 drivers/usb/storage/realtek_cr.c                   |   4 +-
 drivers/usb/usbip/vudc_transfer.c                  |   6 +-
 drivers/video/fbdev/aty/radeon_backlight.c         |   4 +-
 drivers/video/fbdev/aty/radeon_base.c              |   6 +-
 drivers/video/fbdev/omap/hwa742.c                  |   2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c         |   2 +-
 drivers/video/fbdev/pxa3xx-gcu.c                   |   2 +-
 drivers/virt/vboxguest/vboxguest_core.c            |   6 +-
 drivers/watchdog/alim7101_wdt.c                    |   4 +-
 drivers/watchdog/at91sam9_wdt.c                    |   6 +-
 drivers/watchdog/bcm47xx_wdt.c                     |   4 +-
 drivers/watchdog/cpwd.c                            |   2 +-
 drivers/watchdog/lpc18xx_wdt.c                     |   4 +-
 drivers/watchdog/machzwd.c                         |   4 +-
 drivers/watchdog/mixcomwd.c                        |   4 +-
 drivers/watchdog/mtx-1_wdt.c                       |   4 +-
 drivers/watchdog/pcwd.c                            |   4 +-
 drivers/watchdog/pika_wdt.c                        |   4 +-
 drivers/watchdog/rdc321x_wdt.c                     |   4 +-
 drivers/watchdog/sbc60xxwdt.c                      |   4 +-
 drivers/watchdog/sc520_wdt.c                       |   4 +-
 drivers/watchdog/shwdt.c                           |   6 +-
 drivers/watchdog/via_wdt.c                         |   6 +-
 drivers/watchdog/w83877f_wdt.c                     |   4 +-
 drivers/xen/grant-table.c                          |   4 +-
 fs/afs/server.c                                    |   2 +-
 fs/bcachefs/clock.c                                |   4 +-
 fs/btrfs/zstd.c                                    |   4 +-
 fs/dlm/lock.c                                      |   6 +-
 fs/ext4/super.c                                    |   8 +-
 fs/jbd2/journal.c                                  |   2 +-
 fs/jbd2/transaction.c                              |   2 +-
 fs/lockd/svclock.c                                 |   2 +-
 fs/nilfs2/segment.c                                |   6 +-
 fs/ocfs2/cluster/tcp.c                             |   4 +-
 fs/pstore/platform.c                               |   2 +-
 fs/timerfd.c                                       |   2 +-
 include/clocksource/timer-ti-dm.h                  |   2 +-
 include/linux/hrtimer.h                            |  24 ++---
 include/linux/timer.h                              |  58 ++++++------
 include/linux/torture.h                            |   2 +-
 include/linux/usb/otg-fsm.h                        |   6 +-
 include/linux/workqueue.h                          |   4 +-
 include/net/cfg80211.h                             |   4 +-
 include/rdma/rdmavt_qp.h                           |   2 +-
 include/trace/events/rxrpc.h                       |  16 ++--
 include/trace/events/timer.h                       |  14 +--
 init/main.c                                        |   2 +-
 io_uring/rw.c                                      |   2 +-
 io_uring/timeout.c                                 |   8 +-
 io_uring/timeout.h                                 |   2 +-
 kernel/bpf/helpers.c                               |   2 +-
 kernel/events/uprobes.c                            |   2 +-
 kernel/irq/spurious.c                              |   4 +-
 kernel/kcsan/kcsan_test.c                          |   4 +-
 kernel/kthread.c                                   |   4 +-
 kernel/rcu/rcutorture.c                            |   4 +-
 kernel/rcu/tasks.h                                 |  10 +-
 kernel/rcu/tree_nocb.h                             |   8 +-
 kernel/sched/core.c                                |   2 +-
 kernel/sched/psi.c                                 |   4 +-
 kernel/time/clocksource.c                          |   4 +-
 kernel/time/hrtimer.c                              |  34 +++----
 kernel/time/posix-timers.c                         |   2 +-
 kernel/time/sleep_timeout.c                        |  12 +--
 kernel/time/timer.c                                | 102 ++++++++++-----------
 kernel/torture.c                                   |   2 +-
 kernel/workqueue.c                                 |  28 +++---
 lib/test_ref_tracker.c                             |   2 +-
 mm/oom_kill.c                                      |   2 +-
 mm/page-writeback.c                                |  10 +-
 net/802/garp.c                                     |   4 +-
 net/802/mrp.c                                      |   8 +-
 net/appletalk/aarp.c                               |  10 +-
 net/appletalk/ddp.c                                |   6 +-
 net/atm/clip.c                                     |   4 +-
 net/atm/lec.c                                      |  12 +--
 net/atm/mpc.c                                      |   2 +-
 net/ax25/af_ax25.c                                 |   4 +-
 net/ax25/ax25_ds_timer.c                           |   4 +-
 net/ax25/ax25_timer.c                              |  20 ++--
 net/batman-adv/tp_meter.c                          |   8 +-
 net/bluetooth/hidp/core.c                          |   4 +-
 net/bluetooth/rfcomm/core.c                        |   8 +-
 net/bridge/br_mdb.c                                |  14 +--
 net/bridge/br_multicast.c                          | 102 ++++++++++-----------
 net/bridge/br_multicast_eht.c                      |  10 +-
 net/bridge/br_stp.c                                |  16 ++--
 net/bridge/br_stp_if.c                             |   4 +-
 net/bridge/br_stp_timer.c                          |  18 ++--
 net/can/af_can.c                                   |   2 +-
 net/can/proc.c                                     |   4 +-
 net/core/drop_monitor.c                            |  10 +-
 net/core/gen_estimator.c                           |   6 +-
 net/core/neighbour.c                               |  12 +--
 net/core/sock.c                                    |   2 +-
 net/dccp/ccids/ccid2.c                             |   2 +-
 net/dccp/ccids/ccid3.c                             |   2 +-
 net/dccp/timer.c                                   |   8 +-
 net/hsr/hsr_device.c                               |  16 ++--
 net/hsr/hsr_framereg.c                             |   8 +-
 net/ieee802154/6lowpan/reassembly.c                |   2 +-
 net/ipv4/igmp.c                                    |  14 +--
 net/ipv4/inet_connection_sock.c                    |  10 +-
 net/ipv4/inet_fragment.c                           |   2 +-
 net/ipv4/inet_timewait_sock.c                      |   8 +-
 net/ipv4/ip_fragment.c                             |   4 +-
 net/ipv4/ipmr.c                                    |   8 +-
 net/ipv4/tcp.c                                     |   4 +-
 net/ipv4/tcp_minisocks.c                           |   2 +-
 net/ipv4/tcp_timer.c                               |   6 +-
 net/ipv6/addrconf.c                                |   4 +-
 net/ipv6/ip6_fib.c                                 |  10 +-
 net/ipv6/ip6_flowlabel.c                           |   4 +-
 net/ipv6/ip6mr.c                                   |   6 +-
 net/ipv6/netfilter/nf_conntrack_reasm.c            |   2 +-
 net/ipv6/reassembly.c                              |   2 +-
 net/lapb/lapb_timer.c                              |   8 +-
 net/llc/llc_c_ac.c                                 |  20 ++--
 net/mac80211/agg-rx.c                              |   8 +-
 net/mac80211/agg-tx.c                              |  10 +-
 net/mac80211/ibss.c                                |   8 +-
 net/mac80211/led.c                                 |   6 +-
 net/mac80211/mesh.c                                |  10 +-
 net/mac80211/mesh_hwmp.c                           |   6 +-
 net/mac80211/mesh_plink.c                          |   6 +-
 net/mac80211/mlme.c                                |  26 +++---
 net/mac80211/ocb.c                                 |   4 +-
 net/mac80211/offchannel.c                          |   2 +-
 net/mac80211/rx.c                                  |   6 +-
 net/mac80211/sta_info.c                            |   4 +-
 net/mac80211/status.c                              |   4 +-
 net/mac80211/tx.c                                  |   4 +-
 net/mac80211/util.c                                |   2 +-
 net/mctp/af_mctp.c                                 |   2 +-
 net/mptcp/pm.c                                     |  20 ++--
 net/mptcp/protocol.c                               |   4 +-
 net/ncsi/ncsi-cmd.c                                |   2 +-
 net/ncsi/ncsi-manage.c                             |   8 +-
 net/netfilter/ipset/ip_set_bitmap_gen.h            |   6 +-
 net/netfilter/ipset/ip_set_list_set.c              |   6 +-
 net/netfilter/ipvs/ip_vs_conn.c                    |   8 +-
 net/netfilter/ipvs/ip_vs_ctl.c                     |   6 +-
 net/netfilter/ipvs/ip_vs_lblc.c                    |   6 +-
 net/netfilter/ipvs/ip_vs_lblcr.c                   |   6 +-
 net/netfilter/nf_conntrack_expect.c                |   4 +-
 net/netfilter/nf_conntrack_h323_main.c             |   2 +-
 net/netfilter/nf_conntrack_netlink.c               |   2 +-
 net/netfilter/nf_conntrack_sip.c                   |   2 +-
 net/netfilter/nfnetlink_log.c                      |   4 +-
 net/netfilter/xt_IDLETIMER.c                       |  14 +--
 net/netfilter/xt_LED.c                             |   4 +-
 net/netrom/af_netrom.c                             |   4 +-
 net/netrom/nr_loopback.c                           |   4 +-
 net/netrom/nr_timer.c                              |  10 +-
 net/nfc/core.c                                     |   8 +-
 net/nfc/hci/core.c                                 |   4 +-
 net/nfc/hci/llc_shdlc.c                            |  14 +--
 net/nfc/llcp_commands.c                            |   2 +-
 net/nfc/llcp_core.c                                |  10 +-
 net/nfc/nci/core.c                                 |   8 +-
 net/packet/af_packet.c                             |   4 +-
 net/rose/af_rose.c                                 |   4 +-
 net/rose/rose_link.c                               |   6 +-
 net/rose/rose_loopback.c                           |   4 +-
 net/rose/rose_timer.c                              |   6 +-
 net/rxrpc/ar-internal.h                            |   4 +-
 net/rxrpc/call_event.c                             |   2 +-
 net/rxrpc/call_object.c                            |   2 +-
 net/rxrpc/input.c                                  |   4 +-
 net/rxrpc/input_rack.c                             |  10 +-
 net/rxrpc/output.c                                 |   2 +-
 net/sched/cls_flow.c                               |   6 +-
 net/sched/sch_fq_pie.c                             |   6 +-
 net/sched/sch_generic.c                            |   6 +-
 net/sched/sch_pie.c                                |   6 +-
 net/sched/sch_red.c                                |   6 +-
 net/sched/sch_sfq.c                                |   6 +-
 net/sctp/associola.c                               |   2 +-
 net/sctp/input.c                                   |   2 +-
 net/sctp/output.c                                  |   2 +-
 net/sctp/outqueue.c                                |   2 +-
 net/sctp/protocol.c                                |   6 +-
 net/sctp/sm_sideeffect.c                           |  42 ++++-----
 net/sctp/transport.c                               |  12 +--
 net/sunrpc/svc_xprt.c                              |   8 +-
 net/sunrpc/xprt.c                                  |   6 +-
 net/tipc/discover.c                                |  12 +--
 net/tipc/monitor.c                                 |   6 +-
 net/tipc/node.c                                    |   8 +-
 net/tipc/socket.c                                  |   2 +-
 net/tipc/subscr.c                                  |   4 +-
 net/wireless/core.c                                |   4 +-
 net/x25/af_x25.c                                   |   4 +-
 net/x25/x25_link.c                                 |   4 +-
 net/x25/x25_timer.c                                |  14 +--
 net/xfrm/xfrm_policy.c                             |  14 +--
 net/xfrm/xfrm_replay.c                             |   6 +-
 net/xfrm/xfrm_state.c                              |   4 +-
 rust/kernel/time/hrtimer.rs                        |  36 ++++----
 rust/kernel/time/hrtimer/arc.rs                    |   2 +-
 rust/kernel/time/hrtimer/pin.rs                    |   2 +-
 rust/kernel/time/hrtimer/pin_mut.rs                |   2 +-
 rust/kernel/time/hrtimer/tbox.rs                   |   2 +-
 samples/connector/cn_test.c                        |   4 +-
 samples/ftrace/sample-trace-array.c                |   4 +-
 security/keys/gc.c                                 |   2 +-
 sound/core/timer.c                                 |   4 +-
 sound/drivers/aloop.c                              |   4 +-
 sound/drivers/dummy.c                              |   4 +-
 sound/drivers/mpu401/mpu401_uart.c                 |   6 +-
 sound/drivers/mtpav.c                              |   6 +-
 sound/drivers/opl3/opl3_midi.c                     |   6 +-
 sound/drivers/pcmtest.c                            |   6 +-
 sound/drivers/serial-u16550.c                      |   4 +-
 sound/i2c/other/ak4117.c                           |   6 +-
 sound/isa/sb/emu8000_pcm.c                         |   6 +-
 sound/isa/sb/sb8_midi.c                            |   6 +-
 sound/isa/wavefront/wavefront_midi.c               |   6 +-
 sound/pci/asihpi/asihpi.c                          |   6 +-
 sound/pci/ctxfi/cttimer.c                          |   8 +-
 sound/pci/echoaudio/midi.c                         |   4 +-
 sound/pci/korg1212/korg1212.c                      |   6 +-
 sound/pci/rme9652/hdsp.c                           |   6 +-
 sound/pci/rme9652/hdspm.c                          |   6 +-
 sound/sh/aica.c                                    |   8 +-
 sound/soc/codecs/rt5645.c                          |   4 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |   4 +-
 sound/soc/ti/ams-delta.c                           |   2 +-
 sound/synth/emux/emux_synth.c                      |   6 +-
 sound/usb/midi.c                                   |   6 +-
 tools/sched_ext/scx_qmap.bpf.c                     |   4 +-
 tools/testing/selftests/bpf/progs/test_vmlinux.c   |   4 +-
 981 files changed, 3126 insertions(+), 3126 deletions(-)

-- 
2.45.2

