Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C89C19E7D1
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864447; cv=none; b=j+YBLhSHPEeC9hNs//JxiCgenUKvinwLhXatXU9BD3HHyJPVSddDPdX8c3hsw8q1aZy0nvq/ddSaLxQ6WolW+f218puLlpGtW8Lid+/0ZOtbCFcKahXJOArwFYvICs/+ueMfl822NgnThHRH73qxVdQDBqdDIjRE40q6CMrioGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864447; c=relaxed/simple;
	bh=MVPDgjbafC++u7V7yQCc0O8uGY4lhsmscd90ShMX2ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHIbgbQdP0zvnMeKEQKTlyXrj8LwfBGtRpGV58aw33KOaj1sIUifTsrp1xpDRPotWvYnvkVJnswSTRR23Trl6xFYKJhW1M4eSS3uWkRSOpKWENRfaABaV8+NxRP3mxCQrjdWZI/STqCDEqvmBAa0LWoPZGP6yTmmm3aQakgNf4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=k8ly66nQ; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="k8ly66nQ"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl8P6J2yzlgTxx;
	Thu,  6 Feb 2025 17:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864371; x=1741456372; bh=QaYiA
	sJRH5fAecxmr2GMB57SdyDXsmsKCD1Q7Z03aRA=; b=k8ly66nQX67gIxSQ1HUxx
	oO4KWEiIBcOrIuopcPNqBbrNvAvIfCHGEYsWRbelbMXYl0avFhPVBcTM7pfqZwWW
	/27UeUv2xB1r+snMKhi1blNdclvOBc9kx0GOxo7HUTe6ollLOc1ojkO8dx3mKB4r
	8AHDaQBrLsLhflNRk1qF8H+tuU5CFtkPxuhtubC2yOwuaWDyMvubwKdVHitLSqDw
	F94n11asbqsUre4hJWpk/K/ygKWpN3VCPGKcAlx36bAHhNyCDyUx/YF24QHA7OVn
	aIfrJwyTa6pUOEWLoCwXBmpn3REQncHe1r8n4g/RUEPVseTVWVqmzCMUNRLY5p5F
	g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id LGSIjkoEdxhU; Thu,  6 Feb 2025 17:52:51 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl7N5MLMzlgTxr;
	Thu,  6 Feb 2025 17:52:48 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH RFC 32/33] treewide: Annotate all struct mutex users
Date: Thu,  6 Feb 2025 09:51:13 -0800
Message-ID: <20250206175114.1974171-33-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Annotate functions with one of the following attributes as appropriate:
* ACQUIRE() if a mutex is acquired by a function.
* RELEASE() if a mutex is unlocked by a function.
* REQUIRES() if a mutex is unlocked and locked by a function.
* NO_THREAD_SAFETY_ANALYSIS if the locking pattern is too complex for the
  Clang thread-safety analyzer.

Expand local variables in mutex lock/unlock calls where necessary since t=
he
Clang thread-safety checker does not support alias analysis.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 arch/arm64/kvm/arm.c                          |  2 ++
 arch/powerpc/kernel/rtas.c                    |  1 +
 arch/powerpc/platforms/powermac/low_i2c.c     |  6 ++++
 arch/powerpc/platforms/pseries/papr-vpd.c     |  2 ++
 arch/x86/events/core.c                        |  1 +
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c     |  1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        |  2 ++
 arch/x86/kernel/cpu/sgx/encl.c                |  2 ++
 arch/x86/kernel/ftrace.c                      |  2 ++
 arch/x86/kernel/module.c                      |  1 +
 arch/x86/kvm/svm/sev.c                        |  6 ++++
 block/bdev.c                                  |  3 ++
 block/blk-cgroup.c                            |  2 ++
 block/ioctl.c                                 |  1 +
 drivers/accel/amdxdna/aie2_error.c            |  5 +--
 drivers/accel/qaic/qaic_control.c             |  1 +
 drivers/acpi/scan.c                           |  5 +++
 drivers/ata/libata-core.c                     | 31 +++++++++++++++++--
 drivers/ata/libata-eh.c                       |  2 ++
 drivers/ata/libata.h                          |  6 ++--
 drivers/base/bus.c                            |  1 +
 drivers/base/core.c                           |  7 +++++
 drivers/base/dd.c                             |  2 ++
 drivers/base/power/clock_ops.c                |  4 +++
 drivers/base/power/main.c                     |  2 ++
 drivers/base/regmap/regmap-irq.c              |  2 ++
 drivers/base/regmap/regmap.c                  |  2 ++
 drivers/block/drbd/drbd_bitmap.c              |  2 ++
 drivers/block/drbd/drbd_main.c                |  7 +++++
 drivers/block/drbd/drbd_nl.c                  |  1 +
 drivers/block/drbd/drbd_receiver.c            |  1 +
 drivers/block/drbd/drbd_state.c               |  4 +++
 drivers/block/loop.c                          |  2 ++
 drivers/block/nbd.c                           |  3 ++
 drivers/block/null_blk/zoned.c                |  2 ++
 drivers/block/rnbd/rnbd-clt.c                 |  2 ++
 drivers/bus/fsl-mc/mc-sys.c                   |  1 +
 drivers/bus/vexpress-config.c                 |  2 ++
 drivers/cdx/cdx_msi.c                         |  2 ++
 drivers/char/ipmi/ipmi_msghandler.c           |  1 +
 drivers/char/misc.c                           |  2 ++
 drivers/char/powernv-op-panel.c               |  2 ++
 drivers/char/tpm/tpm-chip.c                   |  3 ++
 drivers/char/xillybus/xillybus_core.c         |  1 +
 drivers/clk/clk.c                             |  4 +++
 drivers/comedi/comedi_fops.c                  |  2 ++
 drivers/comedi/drivers.c                      |  1 +
 drivers/comedi/drivers/usbduxsigma.c          |  1 +
 drivers/counter/rz-mtu3-cnt.c                 |  3 ++
 drivers/cpuidle/cpuidle.c                     |  2 ++
 drivers/crypto/exynos-rng.c                   |  1 +
 drivers/crypto/hisilicon/qm.c                 |  4 +++
 drivers/crypto/intel/qat/qat_common/adf_cfg.c |  2 ++
 .../qat/qat_common/adf_transport_debug.c      |  4 +++
 drivers/cxl/core/port.c                       |  2 ++
 drivers/devfreq/devfreq.c                     |  1 +
 drivers/dpll/dpll_netlink.c                   |  6 ++++
 drivers/firmware/arm_ffa/driver.c             |  1 +
 drivers/firmware/arm_scmi/notify.c            |  1 +
 .../firmware/arm_scmi/transports/mailbox.c    |  2 ++
 drivers/firmware/arm_scmi/transports/optee.c  |  2 ++
 .../firmware/qcom/qcom_qseecom_uefisecapp.c   |  2 ++
 drivers/fpga/fpga-bridge.c                    |  2 ++
 drivers/fpga/fpga-region.c                    |  3 ++
 drivers/gpio/gpio-adnp.c                      |  2 ++
 drivers/gpio/gpio-crystalcove.c               |  2 ++
 drivers/gpio/gpio-dln2.c                      |  2 ++
 drivers/gpio/gpio-ljca.c                      |  2 ++
 drivers/gpio/gpio-max77620.c                  |  2 ++
 drivers/gpio/gpio-mlxbf2.c                    |  2 ++
 drivers/gpio/gpio-pca953x.c                   |  2 ++
 drivers/gpio/gpio-pcf857x.c                   |  2 ++
 drivers/gpio/gpio-pmic-eic-sprd.c             |  2 ++
 drivers/gpio/gpio-stmpe.c                     |  2 ++
 drivers/gpio/gpio-tc3589x.c                   |  2 ++
 drivers/gpio/gpio-virtio.c                    |  2 ++
 drivers/gpio/gpio-wcove.c                     |  2 ++
 drivers/gpu/drm/amd/amdgpu/aldebaran.c        |  1 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    |  4 +++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  4 +++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    |  4 +++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c    |  4 +++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c |  4 +++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c |  4 +++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |  8 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h  |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |  1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c        |  3 +-
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    |  2 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c         |  4 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  4 +++
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |  5 +++
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  2 ++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |  2 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    |  1 +
 drivers/gpu/drm/ast/ast_ddc.c                 |  2 ++
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c    |  2 ++
 drivers/gpu/drm/clients/drm_log.c             |  2 ++
 drivers/gpu/drm/display/drm_dp_helper.c       |  3 ++
 drivers/gpu/drm/display/drm_dp_mst_topology.c |  2 ++
 drivers/gpu/drm/drm_atomic_helper.c           |  3 ++
 drivers/gpu/drm/drm_auth.c                    |  2 ++
 drivers/gpu/drm/drm_client_modeset.c          |  1 +
 drivers/gpu/drm/drm_color_mgmt.c              |  1 +
 drivers/gpu/drm/drm_crtc.c                    |  1 +
 drivers/gpu/drm/drm_drv.c                     |  1 +
 drivers/gpu/drm/drm_fb_helper.c               |  1 +
 drivers/gpu/drm/drm_file.c                    |  4 +++
 drivers/gpu/drm/drm_gem.c                     |  4 ++-
 drivers/gpu/drm/drm_mode_object.c             |  2 ++
 drivers/gpu/drm/drm_modeset_lock.c            |  2 ++
 drivers/gpu/drm/drm_plane.c                   |  1 +
 drivers/gpu/drm/drm_prime.c                   |  1 +
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  1 +
 .../drm/i915/display/intel_display_reset.c    |  2 ++
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  3 ++
 drivers/gpu/drm/i915/display/intel_pps.c      |  2 ++
 drivers/gpu/drm/i915/display/intel_psr.c      |  3 ++
 drivers/gpu/drm/i915/display/intel_tc.c       |  4 +++
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |  2 ++
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  1 +
 drivers/gpu/drm/i915/gt/intel_context.h       |  4 +++
 drivers/gpu/drm/i915/gt/selftest_context.c    |  1 +
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  1 +
 drivers/gpu/drm/i915/gvt/vgpu.c               |  1 +
 drivers/gpu/drm/i915/i915_request.c           |  1 +
 drivers/gpu/drm/i915/i915_vma.c               |  3 +-
 drivers/gpu/drm/i915/intel_sbi.c              |  2 ++
 drivers/gpu/drm/i915/intel_wakeref.c          |  2 ++
 drivers/gpu/drm/i915/intel_wakeref.h          |  2 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c      |  1 +
 drivers/gpu/drm/i915/vlv_sideband.c           |  2 ++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  1 +
 drivers/gpu/drm/mgag200/mgag200_ddc.c         |  2 ++
 drivers/gpu/drm/msm/msm_atomic.c              |  2 ++
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 ++
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |  2 ++
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |  2 ++
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c    |  1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   |  3 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  |  1 +
 drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c    |  3 ++
 .../gpu/drm/nouveau/nvkm/subdev/i2c/auxch.c   |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.c |  2 ++
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    | 24 +++++++-------
 drivers/gpu/drm/panthor/panthor_mmu.c         |  1 +
 drivers/gpu/drm/qxl/qxl_cmd.c                 |  1 +
 drivers/gpu/drm/qxl/qxl_display.c             |  2 ++
 drivers/gpu/drm/radeon/radeon_i2c.c           |  2 ++
 drivers/gpu/drm/radeon/radeon_ring.c          |  3 ++
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  |  2 ++
 drivers/gpu/drm/tegra/hdmi.c                  |  2 ++
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c           |  7 ++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c        |  5 +++
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    |  3 ++
 drivers/gpu/drm/xe/xe_migrate.c               |  1 +
 drivers/gpu/drm/xe/xe_pcode.c                 |  1 +
 drivers/gpu/host1x/bus.c                      |  2 ++
 drivers/gpu/host1x/cdma.c                     |  6 ++++
 drivers/gpu/host1x/context.c                  |  1 +
 drivers/gpu/host1x/mipi.c                     |  2 ++
 drivers/hid/hid-wiimote.h                     |  3 ++
 drivers/hv/channel.c                          |  2 ++
 drivers/hwmon/abituguru.c                     |  2 ++
 drivers/hwmon/abituguru3.c                    |  2 ++
 drivers/hwmon/it87.c                          |  2 ++
 drivers/hwmon/lm78.c                          |  1 +
 drivers/hwmon/nct7904.c                       |  2 ++
 drivers/hwmon/pmbus/pmbus_core.c              |  1 +
 drivers/hwmon/w83781d.c                       |  1 +
 drivers/hwtracing/intel_th/msu.c              |  1 +
 drivers/hwtracing/stm/policy.c                |  2 ++
 drivers/i2c/busses/i2c-amd-mp2-pci.c          |  2 ++
 drivers/i2c/busses/i2c-xiic.c                 |  1 +
 drivers/i2c/i2c-atr.c                         |  3 ++
 drivers/iio/accel/kionix-kx022a.c             |  3 ++
 drivers/iio/adc/meson_saradc.c                |  2 ++
 drivers/iio/buffer/industrialio-buffer-dma.c  |  2 ++
 drivers/iio/industrialio-core.c               |  4 +++
 drivers/iio/light/opt3001.c                   |  1 +
 drivers/infiniband/core/cma.c                 |  5 +++
 drivers/infiniband/core/security.c            |  1 +
 drivers/infiniband/core/umem_odp.c            |  1 +
 drivers/infiniband/hw/hns/hns_roce_hem.c      |  2 ++
 drivers/infiniband/hw/mlx4/main.c             |  2 ++
 drivers/infiniband/hw/mlx5/mr.c               |  1 +
 drivers/infiniband/hw/mlx5/odp.c              |  1 +
 drivers/infiniband/hw/mlx5/umr.c              |  2 ++
 drivers/input/input.c                         |  3 ++
 drivers/input/joystick/pxrc.c                 |  2 ++
 drivers/input/keyboard/adp5588-keys.c         |  2 ++
 drivers/input/misc/ati_remote2.c              |  2 ++
 drivers/input/misc/cm109.c                    |  2 ++
 drivers/input/mouse/psmouse-base.c            |  1 +
 drivers/input/mouse/synaptics_usb.c           |  2 ++
 drivers/input/serio/i8042.c                   |  2 ++
 drivers/input/serio/libps2.c                  |  2 ++
 drivers/iommu/iommufd/device.c                |  2 ++
 drivers/iommu/iommufd/hw_pagetable.c          |  1 +
 drivers/md/bcache/alloc.c                     |  2 ++
 drivers/md/bcache/btree.c                     |  1 +
 drivers/md/bcache/super.c                     |  2 ++
 drivers/md/dm-bufio.c                         |  2 ++
 drivers/md/dm-crypt.c                         |  1 +
 drivers/md/dm-vdo/indexer/index-session.c     |  1 +
 drivers/md/dm-vdo/indexer/volume-index.c      |  3 ++
 drivers/md/dm-vdo/indexer/volume.c            |  1 +
 drivers/md/dm-writecache.c                    |  6 ++++
 drivers/md/dm-zoned-metadata.c                |  6 ++++
 drivers/md/dm.c                               |  5 +++
 drivers/md/md-cluster.c                       | 12 +++++--
 drivers/md/md.c                               |  8 +++++
 drivers/md/md.h                               |  9 +++++-
 drivers/media/cec/core/cec-adap.c             |  5 +++
 .../media/common/videobuf2/videobuf2-core.c   |  2 ++
 .../media/common/videobuf2/videobuf2-v4l2.c   |  7 +++++
 drivers/media/dvb-core/dvb_frontend.c         |  1 +
 drivers/media/dvb-core/dvb_vb2.c              |  2 ++
 drivers/media/dvb-frontends/dib9000.c         |  1 +
 drivers/media/dvb-frontends/stv090x.c         |  2 ++
 drivers/media/dvb-frontends/stv0910.c         |  1 +
 drivers/media/dvb-frontends/ts2020.c          |  2 ++
 drivers/media/mc/mc-device.c                  |  1 +
 drivers/media/mc/mc-entity.c                  |  1 +
 drivers/media/pci/cx18/cx18-alsa.h            |  2 ++
 drivers/media/pci/ddbridge/ddbridge-core.c    |  1 +
 drivers/media/pci/ivtv/ivtv-alsa.h            |  2 ++
 drivers/media/pci/ivtv/ivtv-fileops.c         |  2 ++
 drivers/media/pci/ivtv/ivtv-ioctl.c           |  3 ++
 drivers/media/pci/ivtv/ivtv-yuv.c             |  3 ++
 drivers/media/platform/amphion/vpu_v4l2.c     |  3 ++
 .../platform/chips-media/coda/coda-jpeg.c     |  1 +
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |  2 ++
 .../vcodec/decoder/mtk_vcodec_dec_pm.c        |  2 ++
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  2 ++
 .../media/platform/nvidia/tegra-vde/h264.c    |  5 +++
 drivers/media/platform/nvidia/tegra-vde/vde.c |  2 ++
 .../platform/samsung/exynos4-is/media-dev.h   |  2 ++
 .../media/platform/samsung/s5p-mfc/s5p_mfc.c  |  2 ++
 drivers/media/platform/st/sti/hva/hva-hw.c    |  1 +
 drivers/media/platform/ti/omap3isp/ispvideo.c |  2 ++
 .../test-drivers/vivid/vivid-kthread-cap.c    |  1 +
 drivers/media/usb/dvb-usb-v2/mxl111sf.c       |  2 ++
 drivers/media/usb/dvb-usb/cxusb-analog.c      |  1 +
 drivers/media/usb/dvb-usb/cxusb.c             |  1 +
 drivers/media/usb/go7007/go7007-i2c.c         |  3 ++
 drivers/media/usb/gspca/finepix.c             |  1 +
 drivers/media/usb/gspca/jl2005bcd.c           |  1 +
 drivers/media/usb/gspca/sn9c20x.c             |  1 +
 drivers/media/usb/gspca/sonixj.c              |  1 +
 drivers/media/usb/gspca/sq905.c               |  2 ++
 drivers/media/usb/gspca/sq905c.c              |  1 +
 drivers/media/usb/gspca/vicam.c               |  1 +
 drivers/media/usb/gspca/zc3xx.c               |  1 +
 drivers/media/usb/hdpvr/hdpvr-video.c         |  1 +
 drivers/media/usb/pvrusb2/pvrusb2-context.c   |  2 ++
 drivers/media/usb/uvc/uvc_ctrl.c              |  1 +
 drivers/media/v4l2-core/v4l2-event.c          |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 drivers/media/v4l2-core/v4l2-mem2mem.c        |  1 +
 drivers/media/v4l2-core/v4l2-subdev.c         |  1 +
 drivers/message/fusion/mptctl.c               | 11 +++++--
 drivers/mfd/88pm860x-core.c                   |  2 ++
 drivers/mfd/atc260x-core.c                    |  2 ++
 drivers/mfd/kempld-core.c                     |  2 ++
 drivers/mfd/lp8788-irq.c                      |  2 ++
 drivers/mfd/max8925-core.c                    |  2 ++
 drivers/mfd/max8997-irq.c                     |  2 ++
 drivers/mfd/max8998-irq.c                     |  2 ++
 drivers/mfd/mc13xxx-core.c                    |  2 ++
 drivers/mfd/mt6358-irq.c                      |  2 ++
 drivers/mfd/mt6397-irq.c                      |  2 ++
 drivers/mfd/rc5t583-irq.c                     |  2 ++
 drivers/mfd/stmfx.c                           |  2 ++
 drivers/mfd/stmpe.c                           |  2 ++
 drivers/mfd/tps65217.c                        |  2 ++
 drivers/mfd/tps6586x.c                        |  2 ++
 drivers/mfd/twl4030-irq.c                     |  2 ++
 drivers/mfd/wm831x-irq.c                      |  2 ++
 drivers/mfd/wm8350-irq.c                      |  2 ++
 drivers/misc/cardreader/rtsx_usb.c            |  2 ++
 drivers/misc/mei/client.c                     |  7 +++++
 drivers/misc/mei/hbm.c                        |  1 +
 drivers/misc/mei/hw-me.c                      |  9 ++++++
 drivers/misc/mei/hw-txe.c                     |  4 +++
 drivers/misc/mei/main.c                       |  1 +
 drivers/misc/ntsync.c                         |  2 ++
 drivers/misc/sgi-gru/grufault.c               |  3 ++
 drivers/misc/sgi-gru/grumain.c                |  1 +
 drivers/misc/vmw_vmci/vmci_queue_pair.c       |  2 ++
 drivers/mmc/host/vub300.c                     |  2 ++
 drivers/mtd/chips/cfi_cmdset_0001.c           |  4 +++
 drivers/mtd/chips/cfi_cmdset_0002.c           |  6 ++++
 drivers/mtd/lpddr/lpddr_cmds.c                |  4 +++
 drivers/mtd/nand/ecc-mtk.c                    |  2 ++
 drivers/mtd/nand/ecc-mxic.c                   |  2 ++
 drivers/mtd/nand/raw/atmel/pmecc.c            |  2 ++
 drivers/mtd/nand/raw/nand_base.c              |  4 +++
 drivers/mtd/spi-nor/controllers/hisi-sfc.c    |  2 ++
 drivers/mtd/spi-nor/core.c                    |  6 ++++
 drivers/net/can/softing/softing_main.c        |  1 +
 drivers/net/dsa/microchip/ksz_common.c        |  2 ++
 drivers/net/dsa/microchip/ksz_common.h        |  2 ++
 drivers/net/dsa/microchip/ksz_ptp.c           |  2 ++
 drivers/net/dsa/mt7530-mdio.c                 |  2 ++
 drivers/net/dsa/mt7530.c                      |  2 ++
 drivers/net/dsa/mv88e6xxx/chip.c              |  3 ++
 drivers/net/dsa/mv88e6xxx/chip.h              |  2 ++
 drivers/net/dsa/mv88e6xxx/global2.c           |  2 ++
 drivers/net/dsa/mv88e6xxx/pcs-6352.c          |  2 ++
 drivers/net/dsa/mv88e6xxx/phy.c               |  2 ++
 drivers/net/dsa/qca/ar9331.c                  |  2 ++
 drivers/net/dsa/realtek/rtl83xx.c             |  2 ++
 drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c   |  2 ++
 .../net/ethernet/broadcom/bnx2x/bnx2x_cmn.c   |  2 ++
 .../net/ethernet/broadcom/bnx2x/bnx2x_sriov.c |  2 ++
 .../net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c  |  2 ++
 .../net/ethernet/broadcom/bnxt/bnxt_hwrm.c    |  2 ++
 drivers/net/ethernet/broadcom/tg3.c           |  1 +
 drivers/net/ethernet/davicom/dm9000.c         |  1 +
 drivers/net/ethernet/davicom/dm9051.c         |  2 ++
 drivers/net/ethernet/emulex/benet/be_cmds.c   |  2 ++
 .../net/ethernet/freescale/dpaa2/dpaa2-eth.c  |  2 ++
 drivers/net/ethernet/hisilicon/hns3/hnae3.c   |  2 ++
 .../hisilicon/hns3/hns3pf/hclge_main.c        |  1 +
 drivers/net/ethernet/intel/e1000e/82571.c     |  3 ++
 drivers/net/ethernet/intel/e1000e/ich8lan.c   |  2 ++
 drivers/net/ethernet/intel/iavf/iavf_main.c   |  1 +
 drivers/net/ethernet/intel/ice/ice_common.c   |  1 +
 drivers/net/ethernet/intel/ice/ice_ddp.c      |  2 ++
 drivers/net/ethernet/intel/ice/ice_ethtool.c  |  1 +
 drivers/net/ethernet/intel/ice/ice_main.c     |  1 +
 drivers/net/ethernet/intel/ice/ice_vf_lib.c   |  1 +
 drivers/net/ethernet/intel/idpf/idpf.h        |  2 ++
 .../ethernet/marvell/octeontx2/af/rvu_nix.c   |  3 ++
 .../marvell/octeontx2/af/rvu_npc_fs.c         |  1 +
 .../net/ethernet/marvell/octeontx2/nic/rep.c  |  1 +
 .../marvell/prestera/prestera_counter.c       |  4 +++
 .../ethernet/marvell/prestera/prestera_pci.c  |  2 ++
 drivers/net/ethernet/mellanox/mlx4/cmd.c      |  2 ++
 drivers/net/ethernet/mellanox/mlx4/port.c     |  5 +++
 .../ethernet/mellanox/mlx5/core/en/mod_hdr.c  |  1 +
 .../mellanox/mlx5/core/en/reporter_rx.c       |  2 ++
 .../mellanox/mlx5/core/en/tc/ct_fs_hmfs.c     |  1 +
 .../mellanox/mlx5/core/en/tc/ct_fs_smfs.c     |  1 +
 .../mellanox/mlx5/core/en/tc/int_port.c       |  1 +
 .../mellanox/mlx5/core/en/tc_tun_encap.c      |  3 ++
 .../net/ethernet/mellanox/mlx5/core/en_tc.c   |  1 +
 .../net/ethernet/mellanox/mlx5/core/esw/qos.c |  2 ++
 .../net/ethernet/mellanox/mlx5/core/main.c    |  2 ++
 .../mellanox/mlx5/core/steering/hws/bwc.c     |  2 ++
 .../mlx5/core/steering/sws/dr_types.h         |  6 ++++
 drivers/net/ethernet/micrel/ks8851_spi.c      |  2 ++
 .../ethernet/microchip/encx24j600-regmap.c    |  2 ++
 .../net/ethernet/microchip/vcap/vcap_api.c    |  4 +++
 .../netronome/nfp/nfpcore/nfp_cppcore.c       |  2 ++
 drivers/net/ethernet/qlogic/qed/qed_ll2.c     |  1 +
 drivers/net/ethernet/qlogic/qed/qed_vf.c      |  4 ++-
 drivers/net/ethernet/qlogic/qede/qede_main.c  |  7 +++++
 drivers/net/ethernet/sfc/ef10_sriov.c         |  1 +
 drivers/net/ethernet/sfc/efx_common.c         |  5 +++
 drivers/net/ethernet/sfc/falcon/efx.c         |  2 ++
 drivers/net/ethernet/sfc/mcdi_filters.c       |  1 +
 drivers/net/ethernet/sfc/siena/efx_common.c   |  3 ++
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  2 ++
 drivers/net/macsec.c                          |  1 +
 drivers/net/mctp/mctp-i3c.c                   |  2 ++
 drivers/net/phy/dp83640.c                     |  2 ++
 drivers/net/phy/phy-core.c                    |  3 ++
 drivers/net/phy/phy_device.c                  |  1 +
 drivers/net/phy/sfp-bus.c                     |  1 +
 drivers/net/pse-pd/pse_core.c                 |  2 +-
 drivers/net/team/team_core.c                  |  2 ++
 drivers/net/tun.c                             |  1 +
 drivers/net/usb/hso.c                         |  2 ++
 drivers/net/usb/lan78xx.c                     |  2 ++
 drivers/net/wireless/ath/ath6kl/sdio.c        |  1 +
 drivers/net/wireless/ath/ath9k/hif_usb.c      |  1 +
 drivers/net/wireless/ath/wil6210/main.c       |  1 +
 drivers/net/wireless/ath/wil6210/p2p.c        |  2 ++
 drivers/net/wireless/broadcom/b43/main.c      |  1 +
 .../net/wireless/broadcom/b43legacy/main.c    |  1 +
 .../broadcom/brcm80211/brcmfmac/fwvid.c       |  2 ++
 drivers/net/wireless/intel/iwlwifi/dvm/lib.c  |  1 +
 drivers/net/wireless/intel/iwlwifi/mvm/d3.c   |  3 ++
 drivers/net/wireless/intel/iwlwifi/mvm/ops.c  |  3 ++
 .../wireless/intel/iwlwifi/mvm/time-event.c   |  2 ++
 drivers/net/wireless/intersil/p54/p54pci.c    |  1 +
 drivers/net/wireless/intersil/p54/p54usb.c    |  1 +
 drivers/net/wireless/marvell/mwl8k.c          |  2 ++
 .../wireless/mediatek/mt76/mt7615/testmode.c  |  1 +
 .../net/wireless/mediatek/mt76/mt76_connac.h  |  2 ++
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  1 +
 .../wireless/mediatek/mt76/mt7915/testmode.c  |  5 +++
 .../net/wireless/microchip/wilc1000/wlan.c    |  2 ++
 drivers/net/wireless/quantenna/qtnfmac/bus.h  |  2 ++
 drivers/net/wireless/realtek/rtw88/main.c     |  1 +
 drivers/net/wireless/realtek/rtw89/core.c     |  1 +
 drivers/net/wireless/realtek/rtw89/mac80211.c |  2 ++
 drivers/net/wireless/realtek/rtw89/wow.c      |  4 +++
 drivers/net/wireless/realtek/rtw89/wow.h      |  2 +-
 drivers/net/wireless/rsi/rsi_91x_hal.c        |  1 +
 drivers/net/wireless/st/cw1200/pm.c           |  2 ++
 drivers/net/wireless/ti/wl12xx/main.c         |  1 +
 drivers/net/wireless/ti/wlcore/main.c         |  4 +++
 drivers/net/wireless/zydas/zd1211rw/zd_usb.c  |  2 ++
 drivers/nvdimm/bus.c                          |  1 +
 drivers/nvdimm/core.c                         |  2 ++
 drivers/nvdimm/namespace_devs.c               |  1 +
 drivers/nvme/host/core.c                      |  2 ++
 drivers/nvme/host/pci.c                       |  1 +
 drivers/nvmem/sc27xx-efuse.c                  |  2 ++
 drivers/nvmem/sprd-efuse.c                    |  2 ++
 drivers/of/dynamic.c                          |  4 +++
 drivers/of/overlay.c                          |  2 ++
 drivers/opp/core.c                            |  2 ++
 drivers/pci/pci.c                             | 10 ++++++
 drivers/pci/pcie/bwctrl.c                     |  1 +
 drivers/pci/probe.c                           |  2 ++
 drivers/pci/switch/switchtec.c                |  1 +
 drivers/pcmcia/rsrc_nonstatic.c               |  1 +
 drivers/perf/arm-cci.c                        |  1 +
 drivers/pinctrl/pinctrl-aw9523.c              |  2 ++
 drivers/pinctrl/pinctrl-cy8c95x0.c            |  2 ++
 drivers/pinctrl/pinctrl-mcp23s08.c            |  2 ++
 drivers/pinctrl/pinctrl-stmfx.c               |  2 ++
 drivers/pinctrl/pinctrl-sx150x.c              |  2 ++
 drivers/platform/chrome/cros_ec_lpc_mec.c     |  2 ++
 .../platform/cznic/turris-omnia-mcu-gpio.c    |  2 ++
 .../platform/x86/intel/crystal_cove_charger.c |  2 ++
 drivers/pmdomain/core.c                       |  4 +++
 drivers/pmdomain/rockchip/pm-domains.c        |  2 ++
 drivers/pnp/isapnp/core.c                     |  2 ++
 drivers/power/supply/da9150-fg.c              |  2 ++
 drivers/power/supply/power_supply_core.c      |  1 +
 drivers/pwm/core.c                            |  8 +++++
 drivers/regulator/core.c                      |  2 ++
 drivers/remoteproc/mtk_scp_ipi.c              |  2 ++
 drivers/scsi/aacraid/commctrl.c               |  1 +
 drivers/scsi/fnic/fnic_scsi.c                 |  1 +
 drivers/scsi/libfc/fc_disc.c                  |  6 +++-
 drivers/scsi/libiscsi.c                       |  1 +
 drivers/scsi/megaraid/megaraid_sas.h          |  3 +-
 drivers/scsi/megaraid/megaraid_sas_base.c     | 20 +++++++++---
 drivers/scsi/megaraid/megaraid_sas_fusion.c   |  2 ++
 drivers/scsi/scsi_transport_iscsi.c           |  1 +
 drivers/scsi/sg.c                             |  1 +
 drivers/scsi/smartpqi/smartpqi_init.c         | 18 +++++++++++
 drivers/siox/siox-core.c                      |  2 ++
 drivers/soc/qcom/qcom_pd_mapper.c             |  1 +
 drivers/soc/tegra/pmc.c                       |  1 +
 drivers/soundwire/stream.c                    |  3 ++
 drivers/spi/spi-mem.c                         |  2 ++
 drivers/spi/spi.c                             |  3 ++
 drivers/ssb/main.c                            |  2 ++
 drivers/staging/greybus/light.c               |  2 ++
 .../interface/vchiq_arm/vchiq_core.c          |  1 +
 drivers/target/iscsi/iscsi_target_tpg.c       |  1 +
 drivers/target/target_core_device.c           |  1 +
 drivers/tee/amdtee/core.c                     |  1 +
 drivers/thermal/mediatek/auxadc_thermal.c     |  2 ++
 drivers/thermal/tegra/soctherm.c              |  2 ++
 drivers/thermal/thermal_debugfs.c             |  4 +++
 drivers/tty/n_tty.c                           |  1 +
 drivers/tty/serial/sc16is7xx.c                |  2 ++
 drivers/tty/tty_buffer.c                      |  2 ++
 drivers/tty/tty_io.c                          |  2 ++
 drivers/tty/tty_mutex.c                       |  5 +++
 drivers/ufs/core/ufshcd.c                     |  4 +++
 drivers/usb/class/cdc-wdm.c                   |  3 ++
 drivers/usb/class/usblp.c                     |  3 +-
 drivers/usb/class/usbtmc.c                    |  3 ++
 drivers/usb/core/devio.c                      |  7 +++++
 drivers/usb/core/hcd-pci.c                    |  2 ++
 drivers/usb/core/hub.c                        |  7 +++++
 drivers/usb/gadget/configfs.c                 |  6 ++++
 drivers/usb/gadget/function/f_fs.c            | 14 ++++++---
 drivers/usb/gadget/function/u_fs.h            |  2 ++
 drivers/usb/gadget/legacy/inode.c             |  1 +
 drivers/usb/serial/mos7720.c                  |  2 ++
 drivers/usb/serial/usb-serial.c               |  3 ++
 drivers/usb/storage/transport.c               |  1 +
 drivers/usb/storage/usb.c                     |  2 ++
 drivers/usb/typec/tcpm/tcpm.c                 | 16 ++++++++++
 drivers/usb/usbip/stub_main.c                 |  1 +
 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c          |  2 ++
 drivers/vfio/group.c                          |  1 +
 drivers/vfio/pci/mlx5/cmd.h                   |  3 +-
 drivers/vfio/pci/virtio/migrate.c             |  1 +
 drivers/vfio/vfio_iommu_type1.c               |  1 +
 drivers/vhost/vhost.c                         |  3 ++
 drivers/video/fbdev/core/fb_procfs.c          |  2 ++
 drivers/video/fbdev/smscufx.c                 |  1 +
 drivers/video/fbdev/udlfb.c                   |  1 +
 drivers/virt/vboxguest/vboxguest_linux.c      |  2 ++
 drivers/virtio/virtio_mem.c                   |  5 +++
 drivers/w1/slaves/w1_therm.c                  |  9 ++++++
 drivers/w1/w1.c                               |  3 ++
 drivers/w1/w1_netlink.c                       |  1 +
 drivers/xen/balloon.c                         |  2 ++
 drivers/xen/xen-pciback/passthrough.c         |  1 +
 drivers/xen/xen-pciback/vpci.c                |  1 +
 drivers/xen/xenbus/xenbus_comms.c             |  1 +
 drivers/xen/xenbus/xenbus_xs.c                |  4 +++
 fs/affs/affs.h                                |  6 ++++
 fs/afs/validation.c                           |  1 +
 fs/autofs/waitq.c                             |  3 ++
 fs/bcachefs/alloc_foreground.c                |  4 +++
 fs/bcachefs/alloc_foreground.h                |  1 +
 fs/bcachefs/btree_locking.c                   |  1 +
 fs/bcachefs/btree_write_buffer.c              |  4 +++
 fs/bcachefs/debug.c                           |  2 ++
 fs/bcachefs/ec.c                              |  3 ++
 fs/bcachefs/fs-ioctl.c                        |  1 +
 fs/bcachefs/fs.c                              |  4 +++
 fs/bcachefs/io_write.c                        |  3 ++
 fs/bcachefs/journal.c                         |  2 ++
 fs/bcachefs/quota.c                           |  2 ++
 fs/bcachefs/seqmutex.h                        |  4 +++
 fs/btrfs/block-group.c                        |  2 ++
 fs/btrfs/delayed-ref.c                        |  4 +++
 fs/btrfs/delayed-ref.h                        |  1 +
 fs/btrfs/extent-tree.c                        |  1 +
 fs/btrfs/free-space-cache.c                   |  1 +
 fs/btrfs/ioctl.c                              |  2 ++
 fs/btrfs/qgroup.c                             |  1 +
 fs/btrfs/scrub.c                              |  2 ++
 fs/btrfs/tests/delayed-refs-tests.c           |  1 +
 fs/btrfs/tree-log.c                           |  2 ++
 fs/btrfs/volumes.c                            |  4 +++
 fs/btrfs/zoned.h                              |  4 +++
 fs/ceph/caps.c                                |  4 +++
 fs/ceph/mds_client.c                          |  1 +
 fs/coda/upcall.c                              |  1 +
 fs/dcache.c                                   |  1 +
 fs/dlm/recoverd.c                             |  2 ++
 fs/ecryptfs/main.c                            |  1 +
 fs/ecryptfs/messaging.c                       |  1 +
 fs/erofs/zdata.c                              |  3 ++
 fs/eventpoll.c                                |  3 ++
 fs/exec.c                                     |  4 +++
 fs/ext4/fast_commit.c                         |  1 +
 fs/ext4/mballoc.c                             |  2 ++
 fs/f2fs/data.c                                |  1 +
 fs/fat/fatent.c                               |  2 ++
 fs/fat/inode.c                                |  2 ++
 fs/file.c                                     |  2 ++
 fs/fuse/inode.c                               |  2 ++
 fs/gfs2/rgrp.c                                |  2 ++
 fs/gfs2/util.c                                |  1 +
 fs/hfs/bfind.c                                |  2 ++
 fs/hfsplus/bfind.c                            |  2 ++
 fs/hfsplus/extents.c                          |  2 ++
 fs/hpfs/hpfs_fn.h                             |  2 ++
 fs/jbd2/checkpoint.c                          |  2 ++
 fs/jbd2/commit.c                              |  1 +
 fs/jbd2/journal.c                             |  5 +++
 fs/jbd2/transaction.c                         |  2 ++
 fs/jffs2/dir.c                                |  4 +++
 fs/jffs2/fs.c                                 |  1 +
 fs/jffs2/gc.c                                 |  1 +
 fs/jffs2/nodemgmt.c                           |  2 ++
 fs/jffs2/write.c                              |  2 ++
 fs/jfs/namei.c                                |  1 +
 fs/kernfs/file.c                              |  9 ++++++
 fs/lockd/host.c                               |  1 +
 fs/lockd/svclock.c                            |  1 +
 fs/namei.c                                    |  4 +++
 fs/netfs/write_issue.c                        |  2 ++
 fs/nfsd/nfs4layouts.c                         |  2 ++
 fs/nfsd/nfs4proc.c                            |  2 ++
 fs/nfsd/nfs4state.c                           | 11 +++++++
 fs/ntfs3/frecord.c                            |  4 ++-
 fs/ntfs3/inode.c                              |  1 +
 fs/ntfs3/namei.c                              |  2 ++
 fs/ntfs3/ntfs_fs.h                            |  4 +++
 fs/ntfs3/record.c                             |  1 +
 fs/ntfs3/xattr.c                              |  2 ++
 fs/ocfs2/cluster/nodemanager.c                |  2 ++
 fs/ocfs2/dlmglue.c                            |  2 ++
 fs/ocfs2/inode.c                              |  2 ++
 fs/ocfs2/refcounttree.c                       |  2 ++
 fs/orangefs/orangefs-debugfs.c                |  2 ++
 fs/orangefs/waitqueue.c                       |  1 +
 fs/overlayfs/overlayfs.h                      |  3 ++
 fs/pipe.c                                     |  2 ++
 fs/proc/proc_tty.c                            |  2 ++
 fs/pstore/zone.c                              |  1 +
 fs/smb/client/cifsglob.h                      |  2 ++
 fs/smb/client/connect.c                       |  3 +-
 fs/smb/client/fs_context.h                    |  2 ++
 fs/smb/client/smbdirect.c                     |  2 ++
 fs/smb/client/smbdirect.h                     |  2 +-
 fs/smb/server/connection.h                    |  6 ++--
 fs/super.c                                    |  6 ++++
 fs/ubifs/compress.c                           |  2 ++
 fs/ubifs/dir.c                                |  4 +++
 fs/ubifs/file.c                               |  6 ++++
 fs/ubifs/journal.c                            |  3 ++
 fs/ubifs/misc.h                               |  2 ++
 fs/xfs/scrub/dirtree.c                        |  2 ++
 fs/xfs/scrub/dirtree_repair.c                 |  3 ++
 fs/xfs/scrub/quota.c                          |  1 +
 fs/xfs/scrub/quota_repair.c                   |  3 ++
 fs/xfs/scrub/quotacheck_repair.c              |  3 ++
 fs/xfs/scrub/rmap_repair.c                    |  1 +
 fs/xfs/scrub/rtrmap_repair.c                  |  1 +
 fs/xfs/xfs_dquot.c                            |  7 +++++
 fs/xfs/xfs_dquot.h                            | 10 ++++--
 fs/xfs/xfs_dquot_item.c                       |  2 ++
 fs/xfs/xfs_qm.c                               |  3 ++
 fs/xfs/xfs_qm_syscalls.c                      |  1 +
 fs/xfs/xfs_trans_dquot.c                      |  3 ++
 include/linux/blkdev.h                        | 11 +++++--
 include/linux/cgroup.h                        |  2 ++
 include/linux/fb.h                            |  2 ++
 include/linux/fpga/fpga-bridge.h              |  2 +-
 include/linux/fpga/fpga-mgr.h                 |  4 +--
 include/linux/fsnotify_backend.h              |  2 ++
 include/linux/gameport.h                      |  1 +
 include/linux/memory_hotplug.h                |  2 ++
 include/linux/mfd/si476x-core.h               |  2 ++
 include/linux/netdevice.h                     |  2 ++
 include/linux/phy.h                           |  2 ++
 include/linux/usb.h                           |  3 +-
 include/media/v4l2-ctrls.h                    |  2 ++
 include/media/v4l2-subdev.h                   |  5 +++
 include/net/bluetooth/l2cap.h                 |  2 ++
 include/net/cfg80211.h                        |  2 ++
 include/sound/emu10k1.h                       | 12 +++++--
 include/sound/i2c.h                           |  2 ++
 include/sound/soc-card.h                      |  3 ++
 include/sound/soc.h                           | 14 +++++++++
 io_uring/cancel.c                             |  1 +
 io_uring/fdinfo.c                             |  1 +
 io_uring/io_uring.c                           |  5 +++
 io_uring/io_uring.h                           |  2 ++
 io_uring/msg_ring.c                           |  3 ++
 io_uring/register.c                           |  6 ++++
 io_uring/rsrc.c                               |  3 ++
 io_uring/sqpoll.c                             |  3 ++
 io_uring/tctx.c                               |  1 +
 kernel/acct.c                                 |  3 ++
 kernel/audit.c                                |  2 ++
 kernel/audit_tree.c                           |  2 ++
 kernel/audit_watch.c                          |  1 +
 kernel/bpf/btf.c                              |  1 +
 kernel/bpf/cgroup_iter.c                      |  2 ++
 kernel/bpf/verifier.c                         |  1 +
 kernel/cgroup/cgroup-v1.c                     |  4 +++
 kernel/cgroup/cgroup.c                        | 18 +++++++++++
 kernel/cgroup/cpuset.c                        |  2 ++
 kernel/cpu.c                                  |  2 ++
 kernel/events/callchain.c                     |  1 +
 kernel/events/core.c                          |  9 ++++++
 kernel/events/hw_breakpoint.c                 |  2 ++
 kernel/fail_function.c                        |  2 ++
 kernel/futex/core.c                           |  3 ++
 kernel/irq/autoprobe.c                        |  3 ++
 kernel/irq/irqdesc.c                          |  2 ++
 kernel/irq/msi.c                              |  2 ++
 kernel/jump_label.c                           |  2 ++
 kernel/kprobes.c                              |  3 ++
 kernel/locking/locktorture.c                  |  4 +++
 kernel/module/main.c                          |  1 +
 kernel/module/procfs.c                        |  2 ++
 kernel/params.c                               |  2 ++
 kernel/power/autosleep.c                      |  2 ++
 kernel/power/main.c                           |  2 ++
 kernel/printk/printk.c                        |  2 ++
 kernel/rcu/srcutree.c                         |  4 ++-
 kernel/rcu/tree_exp.h                         |  1 +
 kernel/sched/core.c                           |  1 +
 kernel/seccomp.c                              |  1 +
 kernel/static_call_inline.c                   |  2 ++
 kernel/torture.c                              |  2 ++
 kernel/trace/ftrace.c                         |  7 +++++
 kernel/trace/ring_buffer.c                    |  2 ++
 kernel/trace/rv/rv.c                          |  3 ++
 kernel/trace/rv/rv_reactors.c                 |  2 ++
 kernel/trace/trace.c                          | 12 +++++++
 kernel/trace/trace_dynevent.c                 |  2 ++
 kernel/trace/trace_events.c                   | 10 ++++++
 kernel/trace/trace_events_trigger.c           |  2 ++
 kernel/trace/trace_events_user.c              |  1 +
 kernel/trace/trace_hwlat.c                    |  2 ++
 kernel/trace/trace_osnoise.c                  |  2 ++
 kernel/trace/trace_printk.c                   |  8 +++++
 kernel/trace/trace_recursion_record.c         |  2 ++
 kernel/trace/trace_stat.c                     |  2 ++
 kernel/trace/trace_uprobe.c                   |  2 ++
 kernel/workqueue.c                            |  2 ++
 lib/Makefile                                  |  2 ++
 lib/dynamic_debug.c                           |  2 ++
 lib/error-inject.c                            |  2 ++
 lib/kunit/platform.c                          |  1 +
 lib/once.c                                    |  2 ++
 mm/damon/sysfs.c                              |  3 ++
 mm/hugetlb.c                                  |  4 +++
 mm/kmemleak.c                                 |  2 ++
 mm/ksm.c                                      |  1 +
 mm/oom_kill.c                                 |  1 +
 mm/page_alloc.c                               |  4 +++
 mm/percpu.c                                   |  1 +
 mm/slab_common.c                              |  2 ++
 mm/swap_slots.c                               |  2 ++
 mm/swapfile.c                                 |  2 ++
 mm/vma.c                                      |  2 ++
 mm/zswap.c                                    |  2 ++
 net/atm/resources.c                           |  2 ++
 net/bluetooth/l2cap_core.c                    |  9 ++++++
 net/bluetooth/l2cap_sock.c                    |  2 ++
 net/bluetooth/rfcomm/sock.c                   |  1 +
 net/bridge/netfilter/ebtables.c               |  5 +++
 net/caif/caif_socket.c                        |  2 ++
 net/can/j1939/main.c                          |  2 ++
 net/ceph/messenger.c                          |  3 ++
 net/ceph/messenger_v1.c                       |  2 ++
 net/ceph/messenger_v2.c                       | 14 +++++++++
 net/core/dev.c                                |  4 +++
 net/core/drop_monitor.c                       |  2 ++
 net/core/netdev-genl.c                        |  5 +++
 net/core/pktgen.c                             |  1 +
 net/core/rtnetlink.c                          | 12 +++++++
 net/core/sock.c                               |  2 ++
 net/devlink/core.c                            |  3 ++
 net/devlink/devl_internal.h                   |  2 ++
 net/ethtool/ioctl.c                           |  1 +
 net/ipv6/mcast.c                              |  1 +
 net/mac802154/cfg.c                           |  2 ++
 net/mac802154/mib.c                           |  2 ++
 net/netfilter/ipset/ip_set_core.c             |  2 ++
 net/netfilter/ipvs/ip_vs_app.c                |  2 ++
 net/netfilter/nf_log.c                        |  2 ++
 net/netfilter/nf_tables_api.c                 |  5 +++
 net/netfilter/nfnetlink.c                     |  2 ++
 net/netfilter/x_tables.c                      |  8 +++++
 net/netfilter/xt_hashlimit.c                  |  1 +
 net/netlink/af_netlink.c                      |  2 ++
 net/netlink/genetlink.c                       |  7 +++++
 net/openvswitch/datapath.c                    |  2 ++
 net/phonet/socket.c                           |  2 ++
 net/qrtr/af_qrtr.c                            |  1 +
 net/rds/ib_cm.c                               |  1 +
 net/rds/rdma_transport.c                      |  1 +
 net/rds/tcp_listen.c                          |  1 +
 net/rxrpc/af_rxrpc.c                          |  1 +
 net/rxrpc/call_object.c                       |  1 +
 net/rxrpc/sendmsg.c                           |  3 ++
 net/sched/act_api.c                           |  1 +
 net/sched/cls_api.c                           |  1 +
 net/shaper/shaper.c                           |  2 ++
 net/smc/af_smc.c                              |  1 +
 net/sunrpc/rpc_pipe.c                         |  2 ++
 net/sunrpc/svc_xprt.c                         |  2 ++
 net/unix/af_unix.c                            |  1 +
 net/unix/unix_bpf.c                           |  1 +
 net/wireless/nl80211.c                        |  9 ++++++
 samples/vfio-mdev/mtty.c                      |  1 +
 security/apparmor/apparmorfs.c                |  3 ++
 security/integrity/ima/ima_main.c             |  1 +
 security/keys/keyring.c                       |  3 ++
 security/tomoyo/gc.c                          |  3 ++
 sound/core/compress_offload.c                 |  3 ++
 sound/core/oss/pcm_oss.c                      |  9 ++++++
 sound/core/pcm_native.c                       |  8 +++++
 sound/core/seq/oss/seq_oss.c                  |  1 +
 sound/core/seq/seq_clientmgr.c                |  2 ++
 sound/core/seq/seq_memory.c                   |  1 +
 sound/core/sound.c                            |  1 +
 sound/isa/gus/gus_mem.c                       |  3 ++
 sound/pci/ac97/ac97_codec.c                   |  2 ++
 sound/pci/hda/hda_intel.c                     |  1 +
 sound/pci/hda/patch_realtek.c                 |  2 ++
 sound/pci/hda/tas2781_hda_i2c.c               |  1 +
 sound/pci/ice1712/ak4xxx.c                    |  2 ++
 sound/pci/ice1712/delta.c                     |  4 +++
 sound/pci/ice1712/ews.c                       |  6 ++++
 sound/pci/ice1712/hoontech.c                  |  1 +
 sound/pci/ice1712/ice1712.h                   |  2 ++
 sound/pci/ice1712/prodigy192.c                |  2 ++
 sound/pci/ice1712/revo.c                      |  4 +++
 sound/pci/pcxhr/pcxhr_core.c                  |  1 +
 sound/soc/codecs/rt5677.c                     |  2 ++
 sound/soc/codecs/wcd-mbhc-v2.c                |  7 ++++-
 sound/soc/soc-dapm.c                          |  9 ++++++
 sound/soc/soc-pcm.c                           | 25 +++++++++++++++
 sound/soc/sof/intel/hda-mlink.c               |  2 ++
 sound/soc/sof/ipc3-control.c                  |  1 +
 sound/soc/sof/ipc4-control.c                  |  1 +
 sound/synth/emux/soundfont.c                  |  2 ++
 virt/kvm/kvm_main.c                           |  3 ++
 808 files changed, 2057 insertions(+), 63 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 646e806c6ca6..babbf8b464b2 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1886,6 +1886,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned i=
nt ioctl, unsigned long arg)
=20
 /* unlocks vcpus from @vcpu_lock_idx and smaller */
 static void unlock_vcpus(struct kvm *kvm, int vcpu_lock_idx)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex to be annotated */
 {
 	struct kvm_vcpu *tmp_vcpu;
=20
@@ -1904,6 +1905,7 @@ void unlock_all_vcpus(struct kvm *kvm)
=20
 /* Returns true if all vcpus were locked, false otherwise */
 bool lock_all_vcpus(struct kvm *kvm)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex to be annotated */
 {
 	struct kvm_vcpu *tmp_vcpu;
 	unsigned long c;
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index d31c9799cab2..6aec52f1e065 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1884,6 +1884,7 @@ static bool block_rtas_call(const struct rtas_funct=
ion *func, int nargs,
=20
 /* We assume to be passed big endian arguments */
 SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	const struct rtas_function *func;
 	struct pin_cookie cookie;
diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/pla=
tforms/powermac/low_i2c.c
index c097d591670e..1aa2e37c89d0 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -381,6 +381,7 @@ static void kw_i2c_timeout(struct timer_list *t)
 }
=20
 static int kw_i2c_open(struct pmac_i2c_bus *bus)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct pmac_i2c_host_kw *host =3D bus->hostdata;
 	mutex_lock(&host->mutex);
@@ -388,6 +389,7 @@ static int kw_i2c_open(struct pmac_i2c_bus *bus)
 }
=20
 static void kw_i2c_close(struct pmac_i2c_bus *bus)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct pmac_i2c_host_kw *host =3D bus->hostdata;
 	mutex_unlock(&host->mutex);
@@ -1092,6 +1094,7 @@ EXPORT_SYMBOL_GPL(pmac_low_i2c_unlock);
=20
=20
 int pmac_i2c_open(struct pmac_i2c_bus *bus, int polled)
+	TRY_ACQUIRE(0, bus->mutex)
 {
 	int rc;
=20
@@ -1109,6 +1112,7 @@ int pmac_i2c_open(struct pmac_i2c_bus *bus, int pol=
led)
 EXPORT_SYMBOL_GPL(pmac_i2c_open);
=20
 void pmac_i2c_close(struct pmac_i2c_bus *bus)
+	RELEASE(bus->mutex)
 {
 	WARN_ON(!bus->opened);
 	if (bus->close)
@@ -1232,6 +1236,7 @@ struct pmac_i2c_pf_inst
 };
=20
 static void* pmac_i2c_do_begin(struct pmf_function *func, struct pmf_arg=
s *args)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct pmac_i2c_pf_inst *inst;
 	struct pmac_i2c_bus	*bus;
@@ -1265,6 +1270,7 @@ static void* pmac_i2c_do_begin(struct pmf_function =
*func, struct pmf_args *args)
 }
=20
 static void pmac_i2c_do_end(struct pmf_function *func, void *instdata)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct pmac_i2c_pf_inst *inst =3D instdata;
=20
diff --git a/arch/powerpc/platforms/pseries/papr-vpd.c b/arch/powerpc/pla=
tforms/pseries/papr-vpd.c
index 1574176e3ffc..76ec272ff838 100644
--- a/arch/powerpc/platforms/pseries/papr-vpd.c
+++ b/arch/powerpc/platforms/pseries/papr-vpd.c
@@ -234,6 +234,7 @@ struct vpd_sequence {
  */
 static void vpd_sequence_begin(struct vpd_sequence *seq,
 			       const struct papr_location_code *loc_code)
+	ACQUIRE(rtas_ibm_get_vpd_lock)
 {
 	/*
 	 * Use a static data structure for the location code passed to
@@ -266,6 +267,7 @@ static void vpd_sequence_begin(struct vpd_sequence *s=
eq,
  * Releases resources obtained by vpd_sequence_begin().
  */
 static void vpd_sequence_end(struct vpd_sequence *seq)
+	RELEASE(rtas_ibm_get_vpd_lock)
 {
 	rtas_work_area_free(seq->params.work_area);
 	mutex_unlock(&rtas_ibm_get_vpd_lock);
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 8f218ac0d445..54baf10a4820 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -422,6 +422,7 @@ int x86_reserve_hardware(void)
 }
=20
 void x86_release_hardware(void)
+	NO_THREAD_SAFETY_ANALYSIS /* needed because of a clang bug? */
 {
 	if (atomic_dec_and_mutex_lock(&pmc_refcount, &pmc_reserve_mutex)) {
 		release_pmc_hardware();
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/=
cpu/resctrl/pseudo_lock.c
index 42cc162f7fc9..482219879239 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -1288,6 +1288,7 @@ static const struct file_operations pseudo_measure_=
fops =3D {
  * on failure. Descriptive error will be written to last_cmd_status buff=
er.
  */
 int rdtgroup_pseudo_lock_create(struct rdtgroup *rdtgrp)
+	REQUIRES(rdtgroup_mutex)
 {
 	struct pseudo_lock_region *plr =3D rdtgrp->plr;
 	struct task_struct *thread;
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu=
/resctrl/rdtgroup.c
index 6419e04d8a7b..9ee24ec5b4af 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -2470,6 +2470,7 @@ static void rdtgroup_kn_put(struct rdtgroup *rdtgrp=
, struct kernfs_node *kn)
 }
=20
 struct rdtgroup *rdtgroup_kn_lock_live(struct kernfs_node *kn)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking + returns a pointer */
 {
 	struct rdtgroup *rdtgrp =3D kernfs_to_rdtgroup(kn);
=20
@@ -2489,6 +2490,7 @@ struct rdtgroup *rdtgroup_kn_lock_live(struct kernf=
s_node *kn)
 }
=20
 void rdtgroup_kn_unlock(struct kernfs_node *kn)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the lock function */
 {
 	struct rdtgroup *rdtgrp =3D kernfs_to_rdtgroup(kn);
=20
diff --git a/arch/x86/kernel/cpu/sgx/encl.c b/arch/x86/kernel/cpu/sgx/enc=
l.c
index 279148e72459..8c2d88b1f944 100644
--- a/arch/x86/kernel/cpu/sgx/encl.c
+++ b/arch/x86/kernel/cpu/sgx/encl.c
@@ -606,6 +606,7 @@ static int sgx_encl_debug_write(struct sgx_encl *encl=
, struct sgx_encl_page *pag
 static struct sgx_encl_page *sgx_encl_reserve_page(struct sgx_encl *encl=
,
 						   unsigned long addr,
 						   unsigned long vm_flags)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking + returns a pointer */
 {
 	struct sgx_encl_page *entry;
=20
@@ -627,6 +628,7 @@ static struct sgx_encl_page *sgx_encl_reserve_page(st=
ruct sgx_encl *encl,
=20
 static int sgx_vma_access(struct vm_area_struct *vma, unsigned long addr=
,
 			  void *buf, int len, int write)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the lock function */
 {
 	struct sgx_encl *encl =3D vma->vm_private_data;
 	struct sgx_encl_page *entry =3D NULL;
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 166bc0ea3bdf..7651a3feaa99 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -40,6 +40,7 @@ static int ftrace_poke_late =3D 0;
=20
 void ftrace_arch_code_modify_prepare(void)
     __acquires(&text_mutex)
+	ACQUIRE(text_mutex)
 {
 	/*
 	 * Need to grab text_mutex to prevent a race from module loading
@@ -52,6 +53,7 @@ void ftrace_arch_code_modify_prepare(void)
=20
 void ftrace_arch_code_modify_post_process(void)
     __releases(&text_mutex)
+	RELEASE(text_mutex)
 {
 	/*
 	 * ftrace_make_{call,nop}() may be called during
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index 8984abd91c00..3c250b56033e 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -180,6 +180,7 @@ static int write_relocate_add(Elf64_Shdr *sechdrs,
 			      unsigned int relsec,
 			      struct module *me,
 			      bool apply)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret;
 	bool early =3D me->state =3D=3D MODULE_STATE_UNFORMED;
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index a2a794c32050..9acc922e6e16 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -1857,6 +1857,8 @@ static bool is_cmd_allowed_from_mirror(u32 cmd_id)
 }
=20
 static int sev_lock_two_vms(struct kvm *dst_kvm, struct kvm *src_kvm)
+	TRY_ACQUIRE(0, dst_kvm->lock)
+	TRY_ACQUIRE(0, src_kvm->lock)
 {
 	struct kvm_sev_info *dst_sev =3D &to_kvm_svm(dst_kvm)->sev_info;
 	struct kvm_sev_info *src_sev =3D &to_kvm_svm(src_kvm)->sev_info;
@@ -1892,6 +1894,8 @@ static int sev_lock_two_vms(struct kvm *dst_kvm, st=
ruct kvm *src_kvm)
 }
=20
 static void sev_unlock_two_vms(struct kvm *dst_kvm, struct kvm *src_kvm)
+	RELEASE(&dst_kvm->lock)
+	RELEASE(&src_kvm->lock)
 {
 	struct kvm_sev_info *dst_sev =3D &to_kvm_svm(dst_kvm)->sev_info;
 	struct kvm_sev_info *src_sev =3D &to_kvm_svm(src_kvm)->sev_info;
@@ -1911,6 +1915,7 @@ enum sev_migration_role {
=20
 static int sev_lock_vcpus_for_migration(struct kvm *kvm,
 					enum sev_migration_role role)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex for annotations */
 {
 	struct kvm_vcpu *vcpu;
 	unsigned long i, j;
@@ -1950,6 +1955,7 @@ static int sev_lock_vcpus_for_migration(struct kvm =
*kvm,
 }
=20
 static void sev_unlock_vcpus_for_migration(struct kvm *kvm)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex for annotations */
 {
 	struct kvm_vcpu *vcpu;
 	unsigned long i;
diff --git a/block/bdev.c b/block/bdev.c
index 9d73a8fbf7f9..1bba899f2712 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -241,6 +241,7 @@ EXPORT_SYMBOL(sync_blockdev_range);
  * Return: On success zero is returned, negative error code on failure.
  */
 int bdev_freeze(struct block_device *bdev)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex */
 {
 	int error =3D 0;
=20
@@ -277,6 +278,7 @@ EXPORT_SYMBOL(bdev_freeze);
  * Return: On success zero is returned, negative error code on failure.
  */
 int bdev_thaw(struct block_device *bdev)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex */
 {
 	int error =3D -EINVAL, nr_freeze;
=20
@@ -1194,6 +1196,7 @@ EXPORT_SYMBOL(lookup_bdev);
  * the file system.  In addition we also invalidate the block device map=
ping.
  */
 void bdev_mark_dead(struct block_device *bdev, bool surprise)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex */
 {
 	mutex_lock(&bdev->bd_holder_lock);
 	if (bdev->bd_holder_ops && bdev->bd_holder_ops->mark_dead)
diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 9ed93d91d754..5bc8e66c03f3 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -779,6 +779,7 @@ EXPORT_SYMBOL_GPL(blkg_conf_init);
  * of @ctx->input. Returns -errno on error.
  */
 int blkg_conf_open_bdev(struct blkg_conf_ctx *ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	char *input =3D ctx->input;
 	unsigned int major, minor;
@@ -956,6 +957,7 @@ EXPORT_SYMBOL_GPL(blkg_conf_prep);
 void blkg_conf_exit(struct blkg_conf_ctx *ctx)
 	__releases(&ctx->bdev->bd_queue->queue_lock)
 	__releases(&ctx->bdev->bd_queue->rq_qos_mutex)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	if (ctx->blkg) {
 		spin_unlock_irq(&bdev_get_queue(ctx->bdev)->queue_lock);
diff --git a/block/ioctl.c b/block/ioctl.c
index 6554b728bae6..597517589026 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -417,6 +417,7 @@ static int blkdev_pr_clear(struct block_device *bdev,=
 blk_mode_t mode,
=20
 static int blkdev_flushbuf(struct block_device *bdev, unsigned cmd,
 		unsigned long arg)
+	TRY_ACQUIRE(0, bdev->bd_holder_lock)
 {
 	if (!capable(CAP_SYS_ADMIN))
 		return -EACCES;
diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/a=
ie2_error.c
index b1defaa8513b..7b9c3ad96dc9 100644
--- a/drivers/accel/amdxdna/aie2_error.c
+++ b/drivers/accel/amdxdna/aie2_error.c
@@ -290,15 +290,16 @@ int aie2_error_async_events_send(struct amdxdna_dev=
_hdl *ndev)
 }
=20
 void aie2_error_async_events_free(struct amdxdna_dev_hdl *ndev)
+	REQUIRES(ndev->xdna->dev_lock)
 {
 	struct amdxdna_dev *xdna =3D ndev->xdna;
 	struct async_events *events;
=20
 	events =3D ndev->async_events;
=20
-	mutex_unlock(&xdna->dev_lock);
+	mutex_unlock(&ndev->xdna->dev_lock);
 	destroy_workqueue(events->wq);
-	mutex_lock(&xdna->dev_lock);
+	mutex_lock(&ndev->xdna->dev_lock);
=20
 	dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
 			     events->addr, DMA_FROM_DEVICE);
diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_=
control.c
index d8bdab69f800..7890cf6a785a 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -1014,6 +1014,7 @@ static int decode_message(struct qaic_device *qdev,=
 struct manage_msg *user_msg,
=20
 static void *msg_xfer(struct qaic_device *qdev, struct wrapper_list *wra=
ppers, u32 seq_num,
 		      bool ignore_signal)
+	RELEASE(qdev->cntl_mutex)
 {
 	struct xfer_queue_elem elem;
 	struct wire_msg *out_buf;
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 9f4efa8f75a6..49534e4ff395 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -50,23 +50,27 @@ static DEFINE_MUTEX(acpi_hp_context_lock);
 static u64 spcr_uart_addr;
=20
 void acpi_scan_lock_acquire(void)
+	ACQUIRE(acpi_scan_lock)
 {
 	mutex_lock(&acpi_scan_lock);
 }
 EXPORT_SYMBOL_GPL(acpi_scan_lock_acquire);
=20
 void acpi_scan_lock_release(void)
+	RELEASE(acpi_scan_lock)
 {
 	mutex_unlock(&acpi_scan_lock);
 }
 EXPORT_SYMBOL_GPL(acpi_scan_lock_release);
=20
 void acpi_lock_hp_context(void)
+	ACQUIRE(acpi_hp_context_lock)
 {
 	mutex_lock(&acpi_hp_context_lock);
 }
=20
 void acpi_unlock_hp_context(void)
+	RELEASE(acpi_hp_context_lock)
 {
 	mutex_unlock(&acpi_hp_context_lock);
 }
@@ -1867,6 +1871,7 @@ static void acpi_scan_init_status(struct acpi_devic=
e *adev)
=20
 static int acpi_add_single_object(struct acpi_device **child,
 				  acpi_handle handle, int type, bool dep_init)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct acpi_device *device;
 	bool release_dep_lock =3D false;
diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 63ec2f218431..14cfc12eb785 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -1492,6 +1492,7 @@ unsigned int ata_exec_internal(struct ata_device *d=
ev, struct ata_taskfile *tf,
 			       const u8 *cdb, enum dma_data_direction dma_dir,
 			       void *buf, unsigned int buflen,
 			       unsigned int timeout)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	struct ata_link *link =3D dev->link;
 	struct ata_port *ap =3D link->ap;
@@ -1572,11 +1573,11 @@ unsigned int ata_exec_internal(struct ata_device =
*dev, struct ata_taskfile *tf,
 		}
 	}
=20
-	ata_eh_release(ap);
+	ata_eh_release(dev->link->ap);
=20
 	rc =3D wait_for_completion_timeout(&wait, msecs_to_jiffies(timeout));
=20
-	ata_eh_acquire(ap);
+	ata_eh_acquire(dev->link->ap);
=20
 	ata_sff_flush_pio_task(ap);
=20
@@ -1702,6 +1703,7 @@ static u32 ata_pio_mask_no_iordy(const struct ata_d=
evice *adev)
  */
 unsigned int ata_do_dev_read_id(struct ata_device *dev,
 				struct ata_taskfile *tf, __le16 *id)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	return ata_exec_internal(dev, tf, NULL, DMA_FROM_DEVICE,
 				     id, sizeof(id[0]) * ATA_ID_WORDS, 0);
@@ -1731,6 +1733,7 @@ EXPORT_SYMBOL_GPL(ata_do_dev_read_id);
  */
 int ata_dev_read_id(struct ata_device *dev, unsigned int *p_class,
 		    unsigned int flags, u16 *id)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	struct ata_port *ap =3D dev->link->ap;
 	unsigned int class =3D *p_class;
@@ -1945,6 +1948,7 @@ bool ata_dev_power_init_tf(struct ata_device *dev, =
struct ata_taskfile *tf,
 }
=20
 static bool ata_dev_power_is_active(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	struct ata_taskfile tf;
 	unsigned int err_mask;
@@ -1982,6 +1986,7 @@ static bool ata_dev_power_is_active(struct ata_devi=
ce *dev)
  *	Kernel thread context (may sleep).
  */
 void ata_dev_power_set_standby(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	unsigned long ap_flags =3D dev->link->ap->flags;
 	struct ata_taskfile tf;
@@ -2029,6 +2034,7 @@ void ata_dev_power_set_standby(struct ata_device *d=
ev)
  *	Kernel thread context (may sleep).
  */
 void ata_dev_power_set_active(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	struct ata_taskfile tf;
 	unsigned int err_mask;
@@ -2073,6 +2079,7 @@ void ata_dev_power_set_active(struct ata_device *de=
v)
  */
 unsigned int ata_read_log_page(struct ata_device *dev, u8 log,
 			       u8 page, void *buf, unsigned int sectors)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	unsigned long ap_flags =3D dev->link->ap->flags;
 	struct ata_taskfile tf;
@@ -2124,6 +2131,7 @@ unsigned int ata_read_log_page(struct ata_device *d=
ev, u8 log,
 }
=20
 static int ata_log_supported(struct ata_device *dev, u8 log)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	if (dev->quirks & ATA_QUIRK_NO_LOG_DIR)
 		return 0;
@@ -2134,6 +2142,7 @@ static int ata_log_supported(struct ata_device *dev=
, u8 log)
 }
=20
 static bool ata_identify_page_supported(struct ata_device *dev, u8 page)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	unsigned int err, i;
=20
@@ -2214,6 +2223,7 @@ static inline bool ata_dev_knobble(struct ata_devic=
e *dev)
 }
=20
 static void ata_dev_config_ncq_send_recv(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	unsigned int err_mask;
=20
@@ -2238,6 +2248,7 @@ static void ata_dev_config_ncq_send_recv(struct ata=
_device *dev)
 }
=20
 static void ata_dev_config_ncq_non_data(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	unsigned int err_mask;
=20
@@ -2254,6 +2265,7 @@ static void ata_dev_config_ncq_non_data(struct ata_=
device *dev)
 }
=20
 static void ata_dev_config_ncq_prio(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	unsigned int err_mask;
=20
@@ -2300,6 +2312,7 @@ static bool ata_dev_check_adapter(struct ata_device=
 *dev,
=20
 static int ata_dev_config_ncq(struct ata_device *dev,
 			       char *desc, size_t desc_sz)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	struct ata_port *ap =3D dev->link->ap;
 	int hdepth =3D 0, ddepth =3D ata_id_queue_depth(dev->id);
@@ -2382,6 +2395,7 @@ static void ata_dev_config_sense_reporting(struct a=
ta_device *dev)
 }
=20
 static void ata_dev_config_zac(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	unsigned int err_mask;
 	u8 *identify_buf =3D dev->sector_buf;
@@ -2435,6 +2449,7 @@ static void ata_dev_config_zac(struct ata_device *d=
ev)
 }
=20
 static void ata_dev_config_trusted(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	u64 trusted_cap;
 	unsigned int err;
@@ -2471,6 +2486,7 @@ void ata_dev_cleanup_cdl_resources(struct ata_devic=
e *dev)
 }
=20
 static int ata_dev_init_cdl_resources(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	struct ata_cdl *cdl =3D dev->cdl;
 	unsigned int err_mask;
@@ -2494,6 +2510,7 @@ static int ata_dev_init_cdl_resources(struct ata_de=
vice *dev)
 }
=20
 static void ata_dev_config_cdl(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	unsigned int err_mask;
 	bool cdl_enabled;
@@ -2610,6 +2627,7 @@ static void ata_dev_config_cdl(struct ata_device *d=
ev)
 }
=20
 static int ata_dev_config_lba(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	const u16 *id =3D dev->id;
 	const char *lba_desc;
@@ -2689,6 +2707,7 @@ static void ata_dev_config_fua(struct ata_device *d=
ev)
 }
=20
 static void ata_dev_config_devslp(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	u8 *sata_setting =3D dev->sector_buf;
 	unsigned int err_mask;
@@ -2717,6 +2736,7 @@ static void ata_dev_config_devslp(struct ata_device=
 *dev)
 }
=20
 static void ata_dev_config_cpr(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	unsigned int err_mask;
 	size_t buf_len;
@@ -2801,6 +2821,7 @@ static void ata_dev_print_features(struct ata_devic=
e *dev)
  *	0 on success, -errno otherwise
  */
 int ata_dev_configure(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	struct ata_port *ap =3D dev->link->ap;
 	bool print_info =3D ata_dev_print_info(dev);
@@ -3758,6 +3779,7 @@ static int ata_dev_same_device(struct ata_device *d=
ev, unsigned int new_class,
  *	0 on success, negative errno otherwise
  */
 int ata_dev_reread_id(struct ata_device *dev, unsigned int readid_flags)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	unsigned int class =3D dev->class;
 	u16 *id =3D (void *)dev->sector_buf;
@@ -3793,6 +3815,7 @@ int ata_dev_reread_id(struct ata_device *dev, unsig=
ned int readid_flags)
  */
 int ata_dev_revalidate(struct ata_device *dev, unsigned int new_class,
 		       unsigned int readid_flags)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	u64 n_sectors =3D dev->n_sectors;
 	u64 n_native_sectors =3D dev->n_native_sectors;
@@ -4416,6 +4439,7 @@ static void ata_dev_xfermask(struct ata_device *dev=
)
  */
=20
 static unsigned int ata_dev_set_xfermode(struct ata_device *dev)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	struct ata_taskfile tf;
=20
@@ -4461,6 +4485,7 @@ static unsigned int ata_dev_set_xfermode(struct ata=
_device *dev)
  *	0 on success, AC_ERR_* mask otherwise.
  */
 unsigned int ata_dev_set_feature(struct ata_device *dev, u8 subcmd, u8 a=
ction)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	struct ata_taskfile tf;
 	unsigned int timeout =3D 0;
@@ -4497,6 +4522,7 @@ EXPORT_SYMBOL_GPL(ata_dev_set_feature);
  */
 static unsigned int ata_dev_init_params(struct ata_device *dev,
 					u16 heads, u16 sectors)
+	REQUIRES(dev->link->ap->host->eh_mutex)
 {
 	struct ata_taskfile tf;
 	unsigned int err_mask;
@@ -6549,6 +6575,7 @@ EXPORT_SYMBOL_GPL(ata_ratelimit);
  *	Might sleep.
  */
 void ata_msleep(struct ata_port *ap, unsigned int msecs)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	bool owns_eh =3D ap && ap->host->eh_owner =3D=3D current;
=20
diff --git a/drivers/ata/libata-eh.c b/drivers/ata/libata-eh.c
index 3b303d4ae37a..e2bb3b965fbd 100644
--- a/drivers/ata/libata-eh.c
+++ b/drivers/ata/libata-eh.c
@@ -2613,6 +2613,7 @@ static int ata_eh_followup_srst_needed(struct ata_l=
ink *link, int rc)
 int ata_eh_reset(struct ata_link *link, int classify,
 		 ata_prereset_fn_t prereset, ata_reset_fn_t softreset,
 		 ata_reset_fn_t hardreset, ata_postreset_fn_t postreset)
+	NO_THREAD_SAFETY_ANALYSIS /*REQUIRES(link->ap->host->eh_mutex)*/
 {
 	struct ata_port *ap =3D link->ap;
 	struct ata_link *slave =3D ap->slave_link;
@@ -3730,6 +3731,7 @@ int ata_eh_recover(struct ata_port *ap, ata_prerese=
t_fn_t prereset,
 		   ata_reset_fn_t softreset, ata_reset_fn_t hardreset,
 		   ata_postreset_fn_t postreset,
 		   struct ata_link **r_failed_link)
+	NO_THREAD_SAFETY_ANALYSIS /*REQUIRES(link->ap->host->eh_mutex)*/
 {
 	struct ata_link *link;
 	struct ata_device *dev;
diff --git a/drivers/ata/libata.h b/drivers/ata/libata.h
index 0337be4faec7..89b8ddc8ec08 100644
--- a/drivers/ata/libata.h
+++ b/drivers/ata/libata.h
@@ -157,8 +157,10 @@ int __ata_scsi_queuecmd(struct scsi_cmnd *scmd, stru=
ct ata_device *dev);
 /* libata-eh.c */
 extern unsigned int ata_internal_cmd_timeout(struct ata_device *dev, u8 =
cmd);
 extern void ata_internal_cmd_timed_out(struct ata_device *dev, u8 cmd);
-extern void ata_eh_acquire(struct ata_port *ap);
-extern void ata_eh_release(struct ata_port *ap);
+extern void ata_eh_acquire(struct ata_port *ap)
+	ACQUIRE(ap->host->eh_mutex);
+extern void ata_eh_release(struct ata_port *ap)
+	RELEASE(ap->host->eh_mutex);
 extern void ata_scsi_error(struct Scsi_Host *host);
 extern void ata_eh_fastdrain_timerfn(struct timer_list *t);
 extern void ata_qc_schedule_eh(struct ata_queued_cmd *qc);
diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 6b9e65a42cd2..2249bee87ac3 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -760,6 +760,7 @@ void bus_remove_driver(struct device_driver *drv)
 /* Helper for bus_rescan_devices's iter */
 static int __must_check bus_rescan_devices_helper(struct device *dev,
 						  void *data)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret =3D 0;
=20
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 5a1f05198114..a7e3599993fc 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -239,11 +239,13 @@ static DEFINE_MUTEX(device_links_lock);
 DEFINE_STATIC_SRCU(device_links_srcu);
=20
 static inline void device_links_write_lock(void)
+	ACQUIRE(device_links_lock)
 {
 	mutex_lock(&device_links_lock);
 }
=20
 static inline void device_links_write_unlock(void)
+	RELEASE(device_links_lock)
 {
 	mutex_unlock(&device_links_lock);
 }
@@ -1160,6 +1162,7 @@ static void __device_links_queue_sync_state(struct =
device *dev,
  */
 static void device_links_flush_sync_list(struct list_head *list,
 					 struct device *dont_lock_dev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct device *dev, *tmp;
=20
@@ -2343,16 +2346,19 @@ static struct kobject *sysfs_dev_block_kobj;
 static DEFINE_MUTEX(device_hotplug_lock);
=20
 void lock_device_hotplug(void)
+	NO_THREAD_SAFETY_ANALYSIS /* function declaration has been annotated */
 {
 	mutex_lock(&device_hotplug_lock);
 }
=20
 void unlock_device_hotplug(void)
+	NO_THREAD_SAFETY_ANALYSIS /* function declaration has been annotated */
 {
 	mutex_unlock(&device_hotplug_lock);
 }
=20
 int lock_device_hotplug_sysfs(void)
+	NO_THREAD_SAFETY_ANALYSIS /* function declaration has been annotated */
 {
 	if (mutex_trylock(&device_hotplug_lock))
 		return 0;
@@ -4763,6 +4769,7 @@ EXPORT_SYMBOL_GPL(device_change_owner);
  * device_shutdown - call ->shutdown() on each device to shutdown.
  */
 void device_shutdown(void)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct device *dev, *parent;
=20
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index f0e4b4aba885..6193ea5789ca 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1089,6 +1089,7 @@ void device_initial_probe(struct device *dev)
  * interface, @parent lock will be held as well.
  */
 static void __device_driver_lock(struct device *dev, struct device *pare=
nt)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (parent && dev->bus->need_parent_lock)
 		device_lock(parent);
@@ -1105,6 +1106,7 @@ static void __device_driver_lock(struct device *dev=
, struct device *parent)
  * USB interface, @parent lock will be released as well.
  */
 static void __device_driver_unlock(struct device *dev, struct device *pa=
rent)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	device_unlock(dev);
 	if (parent && dev->bus->need_parent_lock)
diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_op=
s.c
index e18ba676cdf6..1a042b447f4f 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -51,6 +51,7 @@ struct pm_clock_entry {
  */
 static void pm_clk_list_lock(struct pm_subsys_data *psd)
 	__acquires(&psd->lock)
+	ACQUIRE(psd->clock_mutex)
 {
 	mutex_lock(&psd->clock_mutex);
 	spin_lock_irq(&psd->lock);
@@ -63,6 +64,7 @@ static void pm_clk_list_lock(struct pm_subsys_data *psd=
)
  */
 static void pm_clk_list_unlock(struct pm_subsys_data *psd)
 	__releases(&psd->lock)
+	RELEASE(psd->clock_mutex)
 {
 	spin_unlock_irq(&psd->lock);
 	mutex_unlock(&psd->clock_mutex);
@@ -86,6 +88,7 @@ static void pm_clk_list_unlock(struct pm_subsys_data *p=
sd)
 static int pm_clk_op_lock(struct pm_subsys_data *psd, unsigned long *fla=
gs,
 			  const char *fn)
 	/* sparse annotations don't work here as exit state isn't static */
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	bool atomic_context =3D in_atomic() || irqs_disabled();
=20
@@ -129,6 +132,7 @@ static int pm_clk_op_lock(struct pm_subsys_data *psd,=
 unsigned long *flags,
  */
 static void pm_clk_op_unlock(struct pm_subsys_data *psd, unsigned long *=
flags)
 	/* sparse annotations don't work here as entry state isn't static */
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (psd->clock_op_might_sleep) {
 		mutex_unlock(&psd->clock_mutex);
diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index d497d448e4b2..c59fe19e1257 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -109,6 +109,7 @@ void device_pm_sleep_init(struct device *dev)
  * device_pm_lock - Lock the list of active devices used by the PM core.
  */
 void device_pm_lock(void)
+	ACQUIRE(dpm_list_mtx)
 {
 	mutex_lock(&dpm_list_mtx);
 }
@@ -117,6 +118,7 @@ void device_pm_lock(void)
  * device_pm_unlock - Unlock the list of active devices used by the PM c=
ore.
  */
 void device_pm_unlock(void)
+	RELEASE(dpm_list_mtx)
 {
 	mutex_unlock(&dpm_list_mtx);
 }
diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regma=
p-irq.c
index 0bcd81389a29..ddcc75251d7f 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -70,6 +70,7 @@ static bool regmap_irq_can_bulk_read_status(struct regm=
ap_irq_chip_data *data)
 }
=20
 static void regmap_irq_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct regmap_irq_chip_data *d =3D irq_data_get_irq_chip_data(data);
=20
@@ -77,6 +78,7 @@ static void regmap_irq_lock(struct irq_data *data)
 }
=20
 static void regmap_irq_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct regmap_irq_chip_data *d =3D irq_data_get_irq_chip_data(data);
 	struct regmap *map =3D d->map;
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index f2843f814675..68a91578473d 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -440,12 +440,14 @@ static void regmap_lock_unlock_none(void *__map)
 }
=20
 static void regmap_lock_mutex(void *__map)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct regmap *map =3D __map;
 	mutex_lock(&map->mutex);
 }
=20
 static void regmap_unlock_mutex(void *__map)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct regmap *map =3D __map;
 	mutex_unlock(&map->mutex);
diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_b=
itmap.c
index 85ca000a0564..da332953adec 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -122,6 +122,7 @@ static void __bm_print_lock_info(struct drbd_device *=
device, const char *func)
 }
=20
 void drbd_bm_lock(struct drbd_device *device, char *why, enum bm_flag fl=
ags)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct drbd_bitmap *b =3D device->bitmap;
 	int trylock_failed;
@@ -149,6 +150,7 @@ void drbd_bm_lock(struct drbd_device *device, char *w=
hy, enum bm_flag flags)
 }
=20
 void drbd_bm_unlock(struct drbd_device *device)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct drbd_bitmap *b =3D device->bitmap;
 	if (!b) {
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_mai=
n.c
index 5bbd312c3e14..ea19b3d5bce7 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -598,6 +598,7 @@ static void *__conn_prepare_command(struct drbd_conne=
ction *connection,
 }
=20
 void *conn_prepare_command(struct drbd_connection *connection, struct dr=
bd_socket *sock)
+	NO_THREAD_SAFETY_ANALYSIS /* returns a pointer */
 {
 	void *p;
=20
@@ -655,6 +656,7 @@ static int __conn_send_command(struct drbd_connection=
 *connection, struct drbd_s
 int conn_send_command(struct drbd_connection *connection, struct drbd_so=
cket *sock,
 		      enum drbd_packet cmd, unsigned int header_size,
 		      void *data, unsigned int size)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the mutex_lock() caller */
 {
 	int err;
=20
@@ -666,6 +668,7 @@ int conn_send_command(struct drbd_connection *connect=
ion, struct drbd_socket *so
 int drbd_send_command(struct drbd_peer_device *peer_device, struct drbd_=
socket *sock,
 		      enum drbd_packet cmd, unsigned int header_size,
 		      void *data, unsigned int size)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the mutex_lock() caller */
 {
 	int err;
=20
@@ -1649,6 +1652,7 @@ static u32 bio_flags_to_wire(struct drbd_connection=
 *connection,
  * R_PRIMARY -> Peer	(P_DATA, P_TRIM)
  */
 int drbd_send_dblock(struct drbd_peer_device *peer_device, struct drbd_r=
equest *req)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the mutex_lock() caller */
 {
 	struct drbd_device *device =3D peer_device->device;
 	struct drbd_socket *sock;
@@ -1742,6 +1746,7 @@ int drbd_send_dblock(struct drbd_peer_device *peer_=
device, struct drbd_request *
  */
 int drbd_send_block(struct drbd_peer_device *peer_device, enum drbd_pack=
et cmd,
 		    struct drbd_peer_request *peer_req)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the mutex_lock() caller */
 {
 	struct drbd_device *device =3D peer_device->device;
 	struct drbd_socket *sock;
@@ -3705,6 +3710,7 @@ int drbd_wait_misc(struct drbd_device *device, stru=
ct drbd_interval *i)
 }
=20
 void lock_all_resources(void)
+	ACQUIRE(resources_mutex)
 {
 	struct drbd_resource *resource;
 	int __maybe_unused i =3D 0;
@@ -3716,6 +3722,7 @@ void lock_all_resources(void)
 }
=20
 void unlock_all_resources(void)
+	RELEASE(resources_mutex)
 {
 	struct drbd_resource *resource;
=20
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 720fc30e2ecc..d960832cf106 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -3432,6 +3432,7 @@ int drbd_adm_dump_connections_done(struct netlink_c=
allback *cb)
 enum { SINGLE_RESOURCE, ITERATE_RESOURCES };
=20
 int drbd_adm_dump_connections(struct sk_buff *skb, struct netlink_callba=
ck *cb)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct nlattr *resource_filter;
 	struct drbd_resource *resource =3D NULL, *next_resource;
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd=
_receiver.c
index 0c9f54197768..fe94f2f23aaa 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -921,6 +921,7 @@ int drbd_connected(struct drbd_peer_device *peer_devi=
ce)
  *  -2 We do not have a network config...
  */
 static int conn_connect(struct drbd_connection *connection)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct drbd_socket sock, msock;
 	struct drbd_peer_device *peer_device;
diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_st=
ate.c
index c2b6c4d9729d..f5dace68a8e2 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -562,6 +562,7 @@ _req_st_cond(struct drbd_device *device, union drbd_s=
tate mask,
 static enum drbd_state_rv
 drbd_req_state(struct drbd_device *device, union drbd_state mask,
 	       union drbd_state val, enum chg_state_flags f)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct completion done;
 	unsigned long flags;
@@ -699,6 +700,7 @@ int drbd_request_detach_interruptible(struct drbd_dev=
ice *device)
 enum drbd_state_rv
 _drbd_request_state_holding_state_mutex(struct drbd_device *device, unio=
n drbd_state mask,
 		    union drbd_state val, enum chg_state_flags f)
+	REQUIRES(device->state_mutex)
 {
 	enum drbd_state_rv rv;
=20
@@ -2292,6 +2294,7 @@ _conn_rq_cond(struct drbd_connection *connection, u=
nion drbd_state mask, union d
 enum drbd_state_rv
 _conn_request_state(struct drbd_connection *connection, union drbd_state=
 mask, union drbd_state val,
 		    enum chg_state_flags flags)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	enum drbd_state_rv rv =3D SS_SUCCESS;
 	struct after_conn_state_chg_work *acscw;
@@ -2386,6 +2389,7 @@ _conn_request_state(struct drbd_connection *connect=
ion, union drbd_state mask, u
 enum drbd_state_rv
 conn_request_state(struct drbd_connection *connection, union drbd_state =
mask, union drbd_state val,
 		   enum chg_state_flags flags)
+	REQUIRES(connection->cstate_mutex)
 {
 	enum drbd_state_rv rv;
=20
diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index c05fe27a96b6..fbd5c8846bff 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -108,6 +108,7 @@ static DEFINE_MUTEX(loop_validate_mutex);
  * loop_configure()/loop_change_fd()/__loop_clr_fd() calls.
  */
 static int loop_global_lock_killable(struct loop_device *lo, bool global=
)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int err;
=20
@@ -129,6 +130,7 @@ static int loop_global_lock_killable(struct loop_devi=
ce *lo, bool global)
  * @global: true if @lo was about to bind another "struct loop_device", =
false otherwise
  */
 static void loop_global_unlock(struct loop_device *lo, bool global)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	mutex_unlock(&lo->lo_mutex);
 	if (global)
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 7bdc7eb808ea..e223d94f462f 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1419,6 +1419,7 @@ static void nbd_clear_sock(struct nbd_device *nbd)
 }
=20
 static void nbd_config_put(struct nbd_device *nbd)
+	NO_THREAD_SAFETY_ANALYSIS /* because of a clang bug */
 {
 	if (refcount_dec_and_mutex_lock(&nbd->config_refs,
 					&nbd->config_lock)) {
@@ -1520,6 +1521,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 }
=20
 static int nbd_start_device_ioctl(struct nbd_device *nbd)
+	REQUIRES(nbd->config_lock)
 {
 	struct nbd_config *config =3D nbd->config;
 	int ret;
@@ -1571,6 +1573,7 @@ static void nbd_set_cmd_timeout(struct nbd_device *=
nbd, u64 timeout)
 /* Must be called with config_lock held */
 static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd=
,
 		       unsigned int cmd, unsigned long arg)
+	REQUIRES(nbd->config_lock)
 {
 	struct nbd_config *config =3D nbd->config;
 	loff_t bytesize;
diff --git a/drivers/block/null_blk/zoned.c b/drivers/block/null_blk/zone=
d.c
index 0d5f9bf95229..2ca5f790c7ee 100644
--- a/drivers/block/null_blk/zoned.c
+++ b/drivers/block/null_blk/zoned.c
@@ -32,6 +32,7 @@ static inline void null_init_zone_lock(struct nullb_dev=
ice *dev,
=20
 static inline void null_lock_zone(struct nullb_device *dev,
 				  struct nullb_zone *zone)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (!dev->memory_backed)
 		spin_lock_irq(&zone->spinlock);
@@ -41,6 +42,7 @@ static inline void null_lock_zone(struct nullb_device *=
dev,
=20
 static inline void null_unlock_zone(struct nullb_device *dev,
 				    struct nullb_zone *zone)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (!dev->memory_backed)
 		spin_unlock_irq(&zone->spinlock);
diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.=
c
index 82467ecde7ec..7fb977f115f8 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -831,6 +831,7 @@ static int wait_for_rtrs_connection(struct rnbd_clt_s=
ession *sess)
 static void wait_for_rtrs_disconnection(struct rnbd_clt_session *sess)
 	__releases(&sess_lock)
 	__acquires(&sess_lock)
+	REQUIRES(sess_lock)
 {
 	DEFINE_WAIT(wait);
=20
@@ -853,6 +854,7 @@ static void wait_for_rtrs_disconnection(struct rnbd_c=
lt_session *sess)
 static struct rnbd_clt_session *__find_and_get_sess(const char *sessname=
)
 	__releases(&sess_lock)
 	__acquires(&sess_lock)
+	REQUIRES(sess_lock)
 {
 	struct rnbd_clt_session *sess, *sn;
 	int err;
diff --git a/drivers/bus/fsl-mc/mc-sys.c b/drivers/bus/fsl-mc/mc-sys.c
index f2052cd0a051..24cfdf457bb1 100644
--- a/drivers/bus/fsl-mc/mc-sys.c
+++ b/drivers/bus/fsl-mc/mc-sys.c
@@ -243,6 +243,7 @@ static int mc_polling_wait_atomic(struct fsl_mc_io *m=
c_io,
  * Returns '0' on Success; Error code otherwise.
  */
 int mc_send_command(struct fsl_mc_io *mc_io, struct fsl_mc_command *cmd)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int error;
 	enum mc_cmd_status status;
diff --git a/drivers/bus/vexpress-config.c b/drivers/bus/vexpress-config.=
c
index 64ee920721ee..99bfbafce3e8 100644
--- a/drivers/bus/vexpress-config.c
+++ b/drivers/bus/vexpress-config.c
@@ -78,11 +78,13 @@ static void vexpress_config_set_master(u32 site)
 }
=20
 static void vexpress_config_lock(void *arg)
+	ACQUIRE(vexpress_config_mutex)
 {
 	mutex_lock(&vexpress_config_mutex);
 }
=20
 static void vexpress_config_unlock(void *arg)
+	RELEASE(vexpress_config_mutex)
 {
 	mutex_unlock(&vexpress_config_mutex);
 }
diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
index 06d723978232..4e035b4e4c65 100644
--- a/drivers/cdx/cdx_msi.c
+++ b/drivers/cdx/cdx_msi.c
@@ -29,6 +29,7 @@ static void cdx_msi_write_msg(struct irq_data *irq_data=
, struct msi_msg *msg)
 }
=20
 static void cdx_msi_write_irq_lock(struct irq_data *irq_data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct msi_desc *msi_desc =3D irq_data_get_msi_desc(irq_data);
 	struct cdx_device *cdx_dev =3D to_cdx_device(msi_desc->dev);
@@ -37,6 +38,7 @@ static void cdx_msi_write_irq_lock(struct irq_data *irq=
_data)
 }
=20
 static void cdx_msi_write_irq_unlock(struct irq_data *irq_data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct msi_desc *msi_desc =3D irq_data_get_msi_desc(irq_data);
 	struct cdx_device *cdx_dev =3D to_cdx_device(msi_desc->dev);
diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi=
_msghandler.c
index 1e5313748f8b..e9472c570d79 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -3103,6 +3103,7 @@ static void ipmi_bmc_unregister(struct ipmi_smi *in=
tf)
 static int __ipmi_bmc_register(struct ipmi_smi *intf,
 			       struct ipmi_device_id *id,
 			       bool guid_set, guid_t *guid, int intf_num)
+	REQUIRES(&intf->bmc_reg_mutex)
 {
 	int               rv;
 	struct bmc_device *bmc;
diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index 2cf595d2e10b..50b42514200e 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -101,6 +101,7 @@ static void misc_minor_free(int minor)
=20
 #ifdef CONFIG_PROC_FS
 static void *misc_seq_start(struct seq_file *seq, loff_t *pos)
+	ACQUIRE(misc_mtx)
 {
 	mutex_lock(&misc_mtx);
 	return seq_list_start(&misc_list, *pos);
@@ -112,6 +113,7 @@ static void *misc_seq_next(struct seq_file *seq, void=
 *v, loff_t *pos)
 }
=20
 static void misc_seq_stop(struct seq_file *seq, void *v)
+	RELEASE(misc_mtx)
 {
 	mutex_unlock(&misc_mtx);
 }
diff --git a/drivers/char/powernv-op-panel.c b/drivers/char/powernv-op-pa=
nel.c
index 53467b0a6187..41de1373776f 100644
--- a/drivers/char/powernv-op-panel.c
+++ b/drivers/char/powernv-op-panel.c
@@ -113,6 +113,7 @@ static ssize_t oppanel_write(struct file *filp, const=
 char __user *userbuf,
 }
=20
 static int oppanel_open(struct inode *inode, struct file *filp)
+	TRY_ACQUIRE(0, oppanel_mutex)
 {
 	if (!mutex_trylock(&oppanel_mutex)) {
 		pr_debug("Device Busy\n");
@@ -122,6 +123,7 @@ static int oppanel_open(struct inode *inode, struct f=
ile *filp)
 }
=20
 static int oppanel_release(struct inode *inode, struct file *filp)
+	RELEASE(oppanel_mutex)
 {
 	mutex_unlock(&oppanel_mutex);
 	return 0;
diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
index 7df7abaf3e52..16f11bc5dd6c 100644
--- a/drivers/char/tpm/tpm-chip.c
+++ b/drivers/char/tpm/tpm-chip.c
@@ -155,6 +155,7 @@ EXPORT_SYMBOL_GPL(tpm_chip_stop);
  * Returns -ERRNO if the chip could not be got.
  */
 int tpm_try_get_ops(struct tpm_chip *chip)
+	NO_THREAD_SAFETY_ANALYSIS /* to match tpm_find_get_ops() */
 {
 	int rc =3D -EIO;
=20
@@ -190,6 +191,7 @@ EXPORT_SYMBOL_GPL(tpm_try_get_ops);
  * be kfree'd.
  */
 void tpm_put_ops(struct tpm_chip *chip)
+	NO_THREAD_SAFETY_ANALYSIS /* to match tpm_find_get_ops() */
 {
 	tpm_chip_stop(chip);
 	mutex_unlock(&chip->tpm_mutex);
@@ -241,6 +243,7 @@ EXPORT_SYMBOL_GPL(tpm_default_chip);
  * %NULL if the chip is not available.
  */
 struct tpm_chip *tpm_find_get_ops(struct tpm_chip *chip)
+	NO_THREAD_SAFETY_ANALYSIS /* returns a pointer */
 {
 	int rc;
=20
diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybu=
s/xillybus_core.c
index 11b7c4749274..f4b74cc18dbe 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -1425,6 +1425,7 @@ static ssize_t xillybus_write(struct file *filp, co=
nst char __user *userbuf,
 }
=20
 static int xillybus_open(struct inode *inode, struct file *filp)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int rc;
 	unsigned long flags;
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index cf7720b9172f..91bed1378287 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -143,6 +143,7 @@ static void clk_pm_runtime_put(struct clk_core *core)
  * Return: 0 on success, negative errno otherwise.
  */
 static int clk_pm_runtime_get_all(void)
+	TRY_ACQUIRE(0, clk_rpm_list_lock)
 {
 	int ret;
 	struct clk_core *core, *failed;
@@ -189,6 +190,7 @@ static int clk_pm_runtime_get_all(void)
  * the 'clk_rpm_list_lock'.
  */
 static void clk_pm_runtime_put_all(void)
+	RELEASE(clk_rpm_list_lock)
 {
 	struct clk_core *core;
=20
@@ -212,6 +214,7 @@ static void clk_pm_runtime_init(struct clk_core *core=
)
=20
 /***           locking             ***/
 static void clk_prepare_lock(void)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (!mutex_trylock(&prepare_lock)) {
 		if (prepare_owner =3D=3D current) {
@@ -227,6 +230,7 @@ static void clk_prepare_lock(void)
 }
=20
 static void clk_prepare_unlock(void)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	WARN_ON_ONCE(prepare_owner !=3D current);
 	WARN_ON_ONCE(prepare_refcnt =3D=3D 0);
diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index b9df9b19d4bd..6f8b71793815 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -3250,6 +3250,7 @@ EXPORT_SYMBOL_GPL(comedi_event);
=20
 /* Note: the ->mutex is pre-locked on successful return */
 struct comedi_device *comedi_alloc_board_minor(struct device *hardware_d=
evice)
+	NO_THREAD_SAFETY_ANALYSIS /* returns a pointer */
 {
 	struct comedi_device *dev;
 	struct device *csdev;
@@ -3370,6 +3371,7 @@ static void comedi_cleanup_board_minors(void)
 }
=20
 static int __init comedi_init(void)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int i;
 	int retval;
diff --git a/drivers/comedi/drivers.c b/drivers/comedi/drivers.c
index 376130bfba8a..df903728695c 100644
--- a/drivers/comedi/drivers.c
+++ b/drivers/comedi/drivers.c
@@ -1031,6 +1031,7 @@ int comedi_device_attach(struct comedi_device *dev,=
 struct comedi_devconfig *it)
  */
 int comedi_auto_config(struct device *hardware_device,
 		       struct comedi_driver *driver, unsigned long context)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct comedi_device *dev;
 	int ret;
diff --git a/drivers/comedi/drivers/usbduxsigma.c b/drivers/comedi/driver=
s/usbduxsigma.c
index 3f215ae228b2..9e0ed0d82805 100644
--- a/drivers/comedi/drivers/usbduxsigma.c
+++ b/drivers/comedi/drivers/usbduxsigma.c
@@ -823,6 +823,7 @@ static int usbduxsigma_ao_inttrig(struct comedi_devic=
e *dev,
 static int usbduxsigma_ao_cmdtest(struct comedi_device *dev,
 				  struct comedi_subdevice *s,
 				  struct comedi_cmd *cmd)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct usbduxsigma_private *devpriv =3D dev->private;
 	unsigned int tmp;
diff --git a/drivers/counter/rz-mtu3-cnt.c b/drivers/counter/rz-mtu3-cnt.=
c
index e755d54dfece..c2bf846552b2 100644
--- a/drivers/counter/rz-mtu3-cnt.c
+++ b/drivers/counter/rz-mtu3-cnt.c
@@ -124,6 +124,7 @@ static int rz_mtu3_lock_if_counter_is_valid(struct co=
unter_device *counter,
 					    struct rz_mtu3_channel *const ch,
 					    struct rz_mtu3_cnt *const priv,
 					    int id)
+	TRY_ACQUIRE(0, priv->lock)
 {
 	mutex_lock(&priv->lock);
=20
@@ -143,6 +144,7 @@ static int rz_mtu3_lock_if_counter_is_valid(struct co=
unter_device *counter,
 static int rz_mtu3_lock_if_count_is_enabled(struct rz_mtu3_channel *cons=
t ch,
 					    struct rz_mtu3_cnt *const priv,
 					    int id)
+	TRY_ACQUIRE(0, priv->lock)
 {
 	mutex_lock(&priv->lock);
=20
@@ -518,6 +520,7 @@ static int rz_mtu3_count_enable_write(struct counter_=
device *counter,
 }
=20
 static int rz_mtu3_lock_if_ch0_is_enabled(struct rz_mtu3_cnt *const priv=
)
+	TRY_ACQUIRE(0, priv->lock)
 {
 	mutex_lock(&priv->lock);
 	if (priv->ch->is_busy && !(priv->count_is_enabled[RZ_MTU3_16_BIT_MTU1_C=
H] ||
diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
index 0835da449db8..f0709bad728b 100644
--- a/drivers/cpuidle/cpuidle.c
+++ b/drivers/cpuidle/cpuidle.c
@@ -491,6 +491,7 @@ void cpuidle_uninstall_idle_handler(void)
  * cpuidle_pause_and_lock - temporarily disables CPUIDLE
  */
 void cpuidle_pause_and_lock(void)
+	ACQUIRE(cpuidle_lock)
 {
 	mutex_lock(&cpuidle_lock);
 	cpuidle_uninstall_idle_handler();
@@ -502,6 +503,7 @@ EXPORT_SYMBOL_GPL(cpuidle_pause_and_lock);
  * cpuidle_resume_and_unlock - resumes CPUIDLE operation
  */
 void cpuidle_resume_and_unlock(void)
+	RELEASE(cpuidle_lock)
 {
 	cpuidle_install_idle_handler();
 	mutex_unlock(&cpuidle_lock);
diff --git a/drivers/crypto/exynos-rng.c b/drivers/crypto/exynos-rng.c
index 2aaa98f9b44e..2ef178373acb 100644
--- a/drivers/crypto/exynos-rng.c
+++ b/drivers/crypto/exynos-rng.c
@@ -170,6 +170,7 @@ static int exynos_rng_get_random(struct exynos_rng_de=
v *rng,
=20
 /* Re-seed itself from time to time */
 static void exynos_rng_reseed(struct exynos_rng_dev *rng)
+	REQUIRES(rng->lock)
 {
 	unsigned long next_seeding =3D rng->last_seeding + \
 				     msecs_to_jiffies(EXYNOS_RNG_RESEED_TIME);
diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.=
c
index d3f5d108b898..97f74525c4ba 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -1847,6 +1847,7 @@ static int qm_set_msi_v3(struct hisi_qm *qm, bool s=
et)
 }
=20
 static int qm_set_ifc_begin_v3(struct hisi_qm *qm, enum qm_ifc_cmd cmd, =
u32 data, u32 fun_num)
+	ACQUIRE(qm->mailbox_lock)
 {
 	struct qm_mailbox mailbox;
 	u64 msg;
@@ -1859,6 +1860,7 @@ static int qm_set_ifc_begin_v3(struct hisi_qm *qm, =
enum qm_ifc_cmd cmd, u32 data
 }
=20
 static void qm_set_ifc_end_v3(struct hisi_qm *qm)
+	RELEASE(qm->mailbox_lock)
 {
 	mutex_unlock(&qm->mailbox_lock);
 }
@@ -1881,6 +1883,7 @@ static int qm_get_ifc_v3(struct hisi_qm *qm, enum q=
m_ifc_cmd *cmd, u32 *data, u3
 }
=20
 static int qm_set_ifc_begin_v4(struct hisi_qm *qm, enum qm_ifc_cmd cmd, =
u32 data, u32 fun_num)
+	ACQUIRE(qm->ifc_lock)
 {
 	uintptr_t offset;
 	u64 msg;
@@ -1899,6 +1902,7 @@ static int qm_set_ifc_begin_v4(struct hisi_qm *qm, =
enum qm_ifc_cmd cmd, u32 data
 }
=20
 static void qm_set_ifc_end_v4(struct hisi_qm *qm)
+	RELEASE(qm->ifc_lock)
 {
 	mutex_unlock(&qm->ifc_lock);
 }
diff --git a/drivers/crypto/intel/qat/qat_common/adf_cfg.c b/drivers/cryp=
to/intel/qat/qat_common/adf_cfg.c
index b0fc453fa3fb..ace8ba088a72 100644
--- a/drivers/crypto/intel/qat/qat_common/adf_cfg.c
+++ b/drivers/crypto/intel/qat/qat_common/adf_cfg.c
@@ -11,6 +11,7 @@
 static DEFINE_MUTEX(qat_cfg_read_lock);
=20
 static void *qat_dev_cfg_start(struct seq_file *sfile, loff_t *pos)
+	ACQUIRE(qat_cfg_read_lock)
 {
 	struct adf_cfg_device_data *dev_cfg =3D sfile->private;
=20
@@ -41,6 +42,7 @@ static void *qat_dev_cfg_next(struct seq_file *sfile, v=
oid *v, loff_t *pos)
 }
=20
 static void qat_dev_cfg_stop(struct seq_file *sfile, void *v)
+	RELEASE(qat_cfg_read_lock)
 {
 	mutex_unlock(&qat_cfg_read_lock);
 }
diff --git a/drivers/crypto/intel/qat/qat_common/adf_transport_debug.c b/=
drivers/crypto/intel/qat/qat_common/adf_transport_debug.c
index e2dd568b87b5..29a5e1cb66be 100644
--- a/drivers/crypto/intel/qat/qat_common/adf_transport_debug.c
+++ b/drivers/crypto/intel/qat/qat_common/adf_transport_debug.c
@@ -11,6 +11,7 @@ static DEFINE_MUTEX(ring_read_lock);
 static DEFINE_MUTEX(bank_read_lock);
=20
 static void *adf_ring_start(struct seq_file *sfile, loff_t *pos)
+	ACQUIRE(ring_read_lock)
 {
 	struct adf_etr_ring_data *ring =3D sfile->private;
=20
@@ -74,6 +75,7 @@ static int adf_ring_show(struct seq_file *sfile, void *=
v)
 }
=20
 static void adf_ring_stop(struct seq_file *sfile, void *v)
+	RELEASE(ring_read_lock)
 {
 	mutex_unlock(&ring_read_lock);
 }
@@ -117,6 +119,7 @@ void adf_ring_debugfs_rm(struct adf_etr_ring_data *ri=
ng)
 }
=20
 static void *adf_bank_start(struct seq_file *sfile, loff_t *pos)
+	ACQUIRE(bank_read_lock)
 {
 	struct adf_etr_bank_data *bank =3D sfile->private;
 	u8 num_rings_per_bank =3D GET_NUM_RINGS_PER_BANK(bank->accel_dev);
@@ -175,6 +178,7 @@ static int adf_bank_show(struct seq_file *sfile, void=
 *v)
 }
=20
 static void adf_bank_stop(struct seq_file *sfile, void *v)
+	RELEASE(bank_read_lock)
 {
 	mutex_unlock(&bank_read_lock);
 }
diff --git a/drivers/cxl/core/port.c b/drivers/cxl/core/port.c
index 78a5c2c25982..3eb0cd094b30 100644
--- a/drivers/cxl/core/port.c
+++ b/drivers/cxl/core/port.c
@@ -1082,12 +1082,14 @@ static int add_dport(struct cxl_port *port, struc=
t cxl_dport *dport)
  * port lock in that case.
  */
 static void cond_cxl_root_lock(struct cxl_port *port)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (is_cxl_root(port))
 		device_lock(&port->dev);
 }
=20
 static void cond_cxl_root_unlock(struct cxl_port *port)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (is_cxl_root(port))
 		device_unlock(&port->dev);
diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 98657d3b9435..63c7dd7d8fa8 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -290,6 +290,7 @@ static struct devfreq_governor *find_devfreq_governor=
(const char *name)
  * governor's pointer or an error pointer.
  */
 static struct devfreq_governor *try_then_request_governor(const char *na=
me)
+	REQUIRES(devfreq_list_lock)
 {
 	struct devfreq_governor *governor;
 	int err =3D 0;
diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
index c130f87147fa..73753b113883 100644
--- a/drivers/dpll/dpll_netlink.c
+++ b/drivers/dpll/dpll_netlink.c
@@ -1575,6 +1575,7 @@ int dpll_nl_device_get_dumpit(struct sk_buff *skb, =
struct netlink_callback *cb)
=20
 int dpll_pre_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
 		  struct genl_info *info)
+	TRY_ACQUIRE(0, dpll_lock)
 {
 	u32 id;
=20
@@ -1596,6 +1597,7 @@ int dpll_pre_doit(const struct genl_split_ops *ops,=
 struct sk_buff *skb,
=20
 void dpll_post_doit(const struct genl_split_ops *ops, struct sk_buff *sk=
b,
 		    struct genl_info *info)
+	RELEASE(dpll_lock)
 {
 	mutex_unlock(&dpll_lock);
 }
@@ -1603,6 +1605,7 @@ void dpll_post_doit(const struct genl_split_ops *op=
s, struct sk_buff *skb,
 int
 dpll_lock_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
 	       struct genl_info *info)
+	ACQUIRE(dpll_lock)
 {
 	mutex_lock(&dpll_lock);
=20
@@ -1612,12 +1615,14 @@ dpll_lock_doit(const struct genl_split_ops *ops, =
struct sk_buff *skb,
 void
 dpll_unlock_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
 		 struct genl_info *info)
+	RELEASE(dpll_lock)
 {
 	mutex_unlock(&dpll_lock);
 }
=20
 int dpll_pin_pre_doit(const struct genl_split_ops *ops, struct sk_buff *=
skb,
 		      struct genl_info *info)
+	TRY_ACQUIRE(0, dpll_lock)
 {
 	int ret;
=20
@@ -1644,6 +1649,7 @@ int dpll_pin_pre_doit(const struct genl_split_ops *=
ops, struct sk_buff *skb,
=20
 void dpll_pin_post_doit(const struct genl_split_ops *ops, struct sk_buff=
 *skb,
 			struct genl_info *info)
+	RELEASE(dpll_lock)
 {
 	mutex_unlock(&dpll_lock);
 }
diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa=
/driver.c
index 2c2ec3c35f15..5a39f156ba48 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -689,6 +689,7 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32=
 max_fragsize,
 }
=20
 static int ffa_memory_ops(u32 func_id, struct ffa_mem_ops_args *args)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret;
 	void *buffer;
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_sc=
mi/notify.c
index e160ecb22948..d185bd5b43d7 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1264,6 +1264,7 @@ static bool scmi_put_handler_unlocked(struct scmi_n=
otify_instance *ni,
=20
 static void scmi_put_handler(struct scmi_notify_instance *ni,
 			     struct scmi_event_handler *hndl)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	bool freed;
 	u8 protocol_id;
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/fir=
mware/arm_scmi/transports/mailbox.c
index bd041c99b92b..f7dab8c47d14 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -270,6 +270,7 @@ static int mailbox_chan_free(int id, void *p, void *d=
ata)
=20
 static int mailbox_send_message(struct scmi_chan_info *cinfo,
 				struct scmi_xfer *xfer)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct scmi_mailbox *smbox =3D cinfo->transport_info;
 	int ret;
@@ -295,6 +296,7 @@ static int mailbox_send_message(struct scmi_chan_info=
 *cinfo,
=20
 static void mailbox_mark_txdone(struct scmi_chan_info *cinfo, int ret,
 				struct scmi_xfer *__unused)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct scmi_mailbox *smbox =3D cinfo->transport_info;
=20
diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmw=
are/arm_scmi/transports/optee.c
index 3949a877e17d..14530817bf0a 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -455,6 +455,7 @@ static int scmi_optee_chan_free(int id, void *p, void=
 *data)
=20
 static int scmi_optee_send_message(struct scmi_chan_info *cinfo,
 				   struct scmi_xfer *xfer)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct scmi_optee_channel *channel =3D cinfo->transport_info;
 	int ret;
@@ -492,6 +493,7 @@ static void scmi_optee_fetch_response(struct scmi_cha=
n_info *cinfo,
=20
 static void scmi_optee_mark_txdone(struct scmi_chan_info *cinfo, int ret=
,
 				   struct scmi_xfer *__unused)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct scmi_optee_channel *channel =3D cinfo->transport_info;
=20
diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/fi=
rmware/qcom/qcom_qseecom_uefisecapp.c
index 447246bd04be..2aa3da8e4dc2 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -713,6 +713,7 @@ static int qcuefi_set_reference(struct qcuefi_client =
*qcuefi)
 }
=20
 static struct qcuefi_client *qcuefi_acquire(void)
+	NO_THREAD_SAFETY_ANALYSIS /* returns a pointer */
 {
 	mutex_lock(&__qcuefi_lock);
 	if (!__qcuefi) {
@@ -723,6 +724,7 @@ static struct qcuefi_client *qcuefi_acquire(void)
 }
=20
 static void qcuefi_release(void)
+	NO_THREAD_SAFETY_ANALYSIS /* to match qcuefi_acquire() */
 {
 	mutex_unlock(&__qcuefi_lock);
 }
diff --git a/drivers/fpga/fpga-bridge.c b/drivers/fpga/fpga-bridge.c
index 8ef395b49bf8..72e141f45bb5 100644
--- a/drivers/fpga/fpga-bridge.c
+++ b/drivers/fpga/fpga-bridge.c
@@ -57,6 +57,7 @@ EXPORT_SYMBOL_GPL(fpga_bridge_disable);
=20
 static struct fpga_bridge *__fpga_bridge_get(struct device *bridge_dev,
 					     struct fpga_image_info *info)
+	NO_THREAD_SAFETY_ANALYSIS /* TRY_ACQUIRE() does not support pointers */
 {
 	struct fpga_bridge *bridge;
=20
@@ -211,6 +212,7 @@ EXPORT_SYMBOL_GPL(fpga_bridges_disable);
  * If list is empty, do nothing.
  */
 void fpga_bridges_put(struct list_head *bridge_list)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex operation inside a loop */
 {
 	struct fpga_bridge *bridge, *next;
 	unsigned long flags;
diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
index 753cd142503e..a88bd7033380 100644
--- a/drivers/fpga/fpga-region.c
+++ b/drivers/fpga/fpga-region.c
@@ -44,6 +44,7 @@ EXPORT_SYMBOL_GPL(fpga_region_class_find);
  * * -ENODEV if can't take parent driver module refcount.
  */
 static struct fpga_region *fpga_region_get(struct fpga_region *region)
+	NO_THREAD_SAFETY_ANALYSIS /* TRY_ACQUIRE() does not support pointers */
 {
 	struct device *dev =3D &region->dev;
=20
@@ -70,6 +71,7 @@ static struct fpga_region *fpga_region_get(struct fpga_=
region *region)
  * @region: FPGA region
  */
 static void fpga_region_put(struct fpga_region *region)
+	RELEASE(region->mutex)
 {
 	struct device *dev =3D &region->dev;
=20
@@ -95,6 +97,7 @@ static void fpga_region_put(struct fpga_region *region)
  * Return: 0 for success or negative error code.
  */
 int fpga_region_program_fpga(struct fpga_region *region)
+	NO_THREAD_SAFETY_ANALYSIS /* TRY_ACQUIRE() does not support pointers */
 {
 	struct device *dev =3D &region->dev;
 	struct fpga_image_info *info =3D region->info;
diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index 6dafab0cf964..22adcfd4ddbb 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -352,6 +352,7 @@ static int adnp_irq_set_type(struct irq_data *d, unsi=
gned int type)
 }
=20
 static void adnp_irq_bus_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct adnp *adnp =3D gpiochip_get_data(gc);
@@ -360,6 +361,7 @@ static void adnp_irq_bus_lock(struct irq_data *d)
 }
=20
 static void adnp_irq_bus_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct adnp *adnp =3D gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalc=
ove.c
index 25db014494a4..7956040ee838 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -212,6 +212,7 @@ static int crystalcove_irq_type(struct irq_data *data=
, unsigned int type)
 }
=20
 static void crystalcove_bus_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct crystalcove_gpio *cg =3D gpiochip_get_data(irq_data_get_irq_chip=
_data(data));
=20
@@ -219,6 +220,7 @@ static void crystalcove_bus_lock(struct irq_data *dat=
a)
 }
=20
 static void crystalcove_bus_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct crystalcove_gpio *cg =3D gpiochip_get_data(irq_data_get_irq_chip=
_data(data));
 	irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 596da59d4b13..ef29d3a1df10 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -349,6 +349,7 @@ static int dln2_irq_set_type(struct irq_data *irqd, u=
nsigned type)
 }
=20
 static void dln2_irq_bus_lock(struct irq_data *irqd)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(irqd);
 	struct dln2_gpio *dln2 =3D gpiochip_get_data(gc);
@@ -357,6 +358,7 @@ static void dln2_irq_bus_lock(struct irq_data *irqd)
 }
=20
 static void dln2_irq_bus_unlock(struct irq_data *irqd)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(irqd);
 	struct dln2_gpio *dln2 =3D gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index 817ecb12d550..65d7a9731259 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -357,6 +357,7 @@ static int ljca_irq_set_type(struct irq_data *irqd, u=
nsigned int type)
 }
=20
 static void ljca_irq_bus_lock(struct irq_data *irqd)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(irqd);
 	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(gc);
@@ -365,6 +366,7 @@ static void ljca_irq_bus_lock(struct irq_data *irqd)
 }
=20
 static void ljca_irq_bus_unlock(struct irq_data *irqd)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(irqd);
 	struct ljca_gpio_dev *ljca_gpio =3D gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 8c2a5609161f..0fc01929cd11 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -96,6 +96,7 @@ static int max77620_gpio_set_irq_type(struct irq_data *=
data, unsigned int type)
 }
=20
 static void max77620_gpio_bus_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
 	struct max77620_gpio *gpio =3D gpiochip_get_data(chip);
@@ -104,6 +105,7 @@ static void max77620_gpio_bus_lock(struct irq_data *d=
ata)
 }
=20
 static void max77620_gpio_bus_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
 	struct max77620_gpio *gpio =3D gpiochip_get_data(chip);
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 5ae07367955f..58c19b62b5ce 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -128,6 +128,7 @@ static int mlxbf2_gpio_get_lock_res(struct platform_d=
evice *pdev)
  * mode. If the lock_active bit is already set, return an error.
  */
 static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpio_context *gs)
+	TRY_ACQUIRE(0, yu_arm_gpio_lock_param.lock)
 {
 	u32 arm_gpio_lock_val;
=20
@@ -156,6 +157,7 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpi=
o_context *gs)
 static void mlxbf2_gpio_lock_release(struct mlxbf2_gpio_context *gs)
 	__releases(&gs->gc.bgpio_lock)
 	__releases(yu_arm_gpio_lock_param.lock)
+	RELEASE(yu_arm_gpio_lock_param.lock)
 {
 	writel(YU_ARM_GPIO_LOCK_RELEASE, yu_arm_gpio_lock_param.io);
 	raw_spin_unlock(&gs->gc.bgpio_lock);
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index be4c9981ebc4..971269357a25 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -742,6 +742,7 @@ static int pca953x_irq_set_wake(struct irq_data *d, u=
nsigned int on)
 }
=20
 static void pca953x_irq_bus_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct pca953x_chip *chip =3D gpiochip_get_data(gc);
@@ -750,6 +751,7 @@ static void pca953x_irq_bus_lock(struct irq_data *d)
 }
=20
 static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct pca953x_chip *chip =3D gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 7c57eaeb0afe..a7beb36aabfa 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -241,6 +241,7 @@ static void pcf857x_irq_disable(struct irq_data *data=
)
 }
=20
 static void pcf857x_irq_bus_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct pcf857x *gpio =3D irq_data_get_irq_chip_data(data);
=20
@@ -248,6 +249,7 @@ static void pcf857x_irq_bus_lock(struct irq_data *dat=
a)
 }
=20
 static void pcf857x_irq_bus_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct pcf857x *gpio =3D irq_data_get_irq_chip_data(data);
=20
diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-e=
ic-sprd.c
index d9b228bea42e..3997e8fe50de 100644
--- a/drivers/gpio/gpio-pmic-eic-sprd.c
+++ b/drivers/gpio/gpio-pmic-eic-sprd.c
@@ -199,6 +199,7 @@ static int sprd_pmic_eic_irq_set_type(struct irq_data=
 *data,
 }
=20
 static void sprd_pmic_eic_bus_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
 	struct sprd_pmic_eic *pmic_eic =3D gpiochip_get_data(chip);
@@ -207,6 +208,7 @@ static void sprd_pmic_eic_bus_lock(struct irq_data *d=
ata)
 }
=20
 static void sprd_pmic_eic_bus_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
 	struct sprd_pmic_eic *pmic_eic =3D gpiochip_get_data(chip);
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 75a3633ceddb..68b3fb008d7c 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -167,6 +167,7 @@ static int stmpe_gpio_irq_set_type(struct irq_data *d=
, unsigned int type)
 }
=20
 static void stmpe_gpio_irq_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct stmpe_gpio *stmpe_gpio =3D gpiochip_get_data(gc);
@@ -175,6 +176,7 @@ static void stmpe_gpio_irq_lock(struct irq_data *d)
 }
=20
 static void stmpe_gpio_irq_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct stmpe_gpio *stmpe_gpio =3D gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index e62ee7e56908..043a48d6a3ac 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -183,6 +183,7 @@ static int tc3589x_gpio_irq_set_type(struct irq_data =
*d, unsigned int type)
 }
=20
 static void tc3589x_gpio_irq_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct tc3589x_gpio *tc3589x_gpio =3D gpiochip_get_data(gc);
@@ -191,6 +192,7 @@ static void tc3589x_gpio_irq_lock(struct irq_data *d)
 }
=20
 static void tc3589x_gpio_irq_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct tc3589x_gpio *tc3589x_gpio =3D gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 93544ff62513..819d6e6e8641 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -318,6 +318,7 @@ static int virtio_gpio_irq_set_type(struct irq_data *=
d, unsigned int type)
 }
=20
 static void virtio_gpio_irq_bus_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct virtio_gpio *vgpio =3D gpiochip_get_data(gc);
@@ -326,6 +327,7 @@ static void virtio_gpio_irq_bus_lock(struct irq_data =
*d)
 }
=20
 static void virtio_gpio_irq_bus_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct virtio_gpio *vgpio =3D gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 94ca9d03c094..29bc5f73c686 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -268,6 +268,7 @@ static int wcove_irq_type(struct irq_data *data, unsi=
gned int type)
 }
=20
 static void wcove_bus_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
 	struct wcove_gpio *wg =3D gpiochip_get_data(chip);
@@ -276,6 +277,7 @@ static void wcove_bus_lock(struct irq_data *data)
 }
=20
 static void wcove_bus_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
 	struct wcove_gpio *wg =3D gpiochip_get_data(chip);
diff --git a/drivers/gpu/drm/amd/amdgpu/aldebaran.c b/drivers/gpu/drm/amd=
/amdgpu/aldebaran.c
index e13fbd974141..be3e11c4559a 100644
--- a/drivers/gpu/drm/amd/amdgpu/aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
@@ -136,6 +136,7 @@ static int aldebaran_mode2_reset(struct amdgpu_device=
 *adev)
 static int
 aldebaran_mode2_perform_reset(struct amdgpu_reset_control *reset_ctl,
 			      struct amdgpu_reset_context *reset_context)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex operation inside a loop */
 {
 	struct amdgpu_device *adev =3D (struct amdgpu_device *)reset_ctl->handl=
e;
 	struct list_head *reset_device_list =3D reset_context->reset_device_lis=
t;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers=
/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 62176d607bef..58e1fb5cddda 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -43,12 +43,14 @@ enum hqd_dequeue_request_type {
=20
 static void lock_srbm(struct amdgpu_device *adev, uint32_t mec, uint32_t=
 pipe,
 			uint32_t queue, uint32_t vmid)
+	ACQUIRE(adev->srbm_mutex)
 {
 	mutex_lock(&adev->srbm_mutex);
 	nv_grbm_select(adev, mec, pipe, queue, vmid);
 }
=20
 static void unlock_srbm(struct amdgpu_device *adev)
+	RELEASE(adev->srbm_mutex)
 {
 	nv_grbm_select(adev, 0, 0, 0, 0);
 	mutex_unlock(&adev->srbm_mutex);
@@ -56,6 +58,7 @@ static void unlock_srbm(struct amdgpu_device *adev)
=20
 static void acquire_queue(struct amdgpu_device *adev, uint32_t pipe_id,
 				uint32_t queue_id)
+	ACQUIRE(adev->srbm_mutex)
 {
 	uint32_t mec =3D (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
 	uint32_t pipe =3D (pipe_id % adev->gfx.mec.num_pipe_per_mec);
@@ -73,6 +76,7 @@ static uint64_t get_queue_mask(struct amdgpu_device *ad=
ev,
 }
=20
 static void release_queue(struct amdgpu_device *adev)
+	RELEASE(adev->srbm_mutex)
 {
 	unlock_srbm(adev);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drive=
rs/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
index c718bedda0ca..301f3824de0b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -43,12 +43,14 @@ enum hqd_dequeue_request_type {
=20
 static void lock_srbm(struct amdgpu_device *adev, uint32_t mec, uint32_t=
 pipe,
 			uint32_t queue, uint32_t vmid)
+	ACQUIRE(adev->srbm_mutex)
 {
 	mutex_lock(&adev->srbm_mutex);
 	nv_grbm_select(adev, mec, pipe, queue, vmid);
 }
=20
 static void unlock_srbm(struct amdgpu_device *adev)
+	RELEASE(adev->srbm_mutex)
 {
 	nv_grbm_select(adev, 0, 0, 0, 0);
 	mutex_unlock(&adev->srbm_mutex);
@@ -56,6 +58,7 @@ static void unlock_srbm(struct amdgpu_device *adev)
=20
 static void acquire_queue(struct amdgpu_device *adev, uint32_t pipe_id,
 				uint32_t queue_id)
+	ACQUIRE(adev->srbm_mutex)
 {
 	uint32_t mec =3D (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
 	uint32_t pipe =3D (pipe_id % adev->gfx.mec.num_pipe_per_mec);
@@ -73,6 +76,7 @@ static uint64_t get_queue_mask(struct amdgpu_device *ad=
ev,
 }
=20
 static void release_queue(struct amdgpu_device *adev)
+	RELEASE(adev->srbm_mutex)
 {
 	unlock_srbm(adev);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers=
/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index a4ba49cb22db..4a8bf1d18d8f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -41,12 +41,14 @@ enum hqd_dequeue_request_type {
=20
 static void lock_srbm(struct amdgpu_device *adev, uint32_t mec, uint32_t=
 pipe,
 			uint32_t queue, uint32_t vmid)
+	ACQUIRE(adev->srbm_mutex)
 {
 	mutex_lock(&adev->srbm_mutex);
 	soc21_grbm_select(adev, mec, pipe, queue, vmid);
 }
=20
 static void unlock_srbm(struct amdgpu_device *adev)
+	RELEASE(adev->srbm_mutex)
 {
 	soc21_grbm_select(adev, 0, 0, 0, 0);
 	mutex_unlock(&adev->srbm_mutex);
@@ -54,6 +56,7 @@ static void unlock_srbm(struct amdgpu_device *adev)
=20
 static void acquire_queue(struct amdgpu_device *adev, uint32_t pipe_id,
 				uint32_t queue_id)
+	ACQUIRE(adev->srbm_mutex)
 {
 	uint32_t mec =3D (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
 	uint32_t pipe =3D (pipe_id % adev->gfx.mec.num_pipe_per_mec);
@@ -71,6 +74,7 @@ static uint64_t get_queue_mask(struct amdgpu_device *ad=
ev,
 }
=20
 static void release_queue(struct amdgpu_device *adev)
+	RELEASE(adev->srbm_mutex)
 {
 	unlock_srbm(adev);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c b/drivers=
/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
index 0dfe7093bd8a..5f9caf05c57a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
@@ -29,12 +29,14 @@
=20
 static void lock_srbm(struct amdgpu_device *adev, uint32_t mec, uint32_t=
 pipe,
 			uint32_t queue, uint32_t vmid)
+	ACQUIRE(adev->srbm_mutex)
 {
 	mutex_lock(&adev->srbm_mutex);
 	soc24_grbm_select(adev, mec, pipe, queue, vmid);
 }
=20
 static void unlock_srbm(struct amdgpu_device *adev)
+	RELEASE(adev->srbm_mutex)
 {
 	soc24_grbm_select(adev, 0, 0, 0, 0);
 	mutex_unlock(&adev->srbm_mutex);
@@ -42,6 +44,7 @@ static void unlock_srbm(struct amdgpu_device *adev)
=20
 static void acquire_queue(struct amdgpu_device *adev, uint32_t pipe_id,
 				uint32_t queue_id)
+	ACQUIRE(adev->srbm_mutex)
 {
 	uint32_t mec =3D (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
 	uint32_t pipe =3D (pipe_id % adev->gfx.mec.num_pipe_per_mec);
@@ -50,6 +53,7 @@ static void acquire_queue(struct amdgpu_device *adev, u=
int32_t pipe_id,
 }
=20
 static void release_queue(struct amdgpu_device *adev)
+	RELEASE(adev->srbm_mutex)
 {
 	unlock_srbm(adev);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
index ca4a6b82817f..68ae301f1efd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
@@ -47,6 +47,7 @@ enum {
=20
 static void lock_srbm(struct amdgpu_device *adev, uint32_t mec, uint32_t=
 pipe,
 			uint32_t queue, uint32_t vmid)
+	ACQUIRE(adev->srbm_mutex)
 {
 	uint32_t value =3D PIPEID(pipe) | MEID(mec) | VMID(vmid) | QUEUEID(queu=
e);
=20
@@ -55,6 +56,7 @@ static void lock_srbm(struct amdgpu_device *adev, uint3=
2_t mec, uint32_t pipe,
 }
=20
 static void unlock_srbm(struct amdgpu_device *adev)
+	RELEASE(adev->srbm_mutex)
 {
 	WREG32(mmSRBM_GFX_CNTL, 0);
 	mutex_unlock(&adev->srbm_mutex);
@@ -62,6 +64,7 @@ static void unlock_srbm(struct amdgpu_device *adev)
=20
 static void acquire_queue(struct amdgpu_device *adev, uint32_t pipe_id,
 				uint32_t queue_id)
+	ACQUIRE(adev->srbm_mutex)
 {
 	uint32_t mec =3D (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
 	uint32_t pipe =3D (pipe_id % adev->gfx.mec.num_pipe_per_mec);
@@ -70,6 +73,7 @@ static void acquire_queue(struct amdgpu_device *adev, u=
int32_t pipe_id,
 }
=20
 static void release_queue(struct amdgpu_device *adev)
+	RELEASE(adev->srbm_mutex)
 {
 	unlock_srbm(adev);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
index 0f3e2944edd7..f041c3db8915 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
@@ -41,6 +41,7 @@ enum hqd_dequeue_request_type {
=20
 static void lock_srbm(struct amdgpu_device *adev, uint32_t mec, uint32_t=
 pipe,
 			uint32_t queue, uint32_t vmid)
+	ACQUIRE(adev->srbm_mutex)
 {
 	uint32_t value =3D PIPEID(pipe) | MEID(mec) | VMID(vmid) | QUEUEID(queu=
e);
=20
@@ -49,6 +50,7 @@ static void lock_srbm(struct amdgpu_device *adev, uint3=
2_t mec, uint32_t pipe,
 }
=20
 static void unlock_srbm(struct amdgpu_device *adev)
+	RELEASE(adev->srbm_mutex)
 {
 	WREG32(mmSRBM_GFX_CNTL, 0);
 	mutex_unlock(&adev->srbm_mutex);
@@ -56,6 +58,7 @@ static void unlock_srbm(struct amdgpu_device *adev)
=20
 static void acquire_queue(struct amdgpu_device *adev, uint32_t pipe_id,
 				uint32_t queue_id)
+	ACQUIRE(adev->srbm_mutex)
 {
 	uint32_t mec =3D (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
 	uint32_t pipe =3D (pipe_id % adev->gfx.mec.num_pipe_per_mec);
@@ -64,6 +67,7 @@ static void acquire_queue(struct amdgpu_device *adev, u=
int32_t pipe_id,
 }
=20
 static void release_queue(struct amdgpu_device *adev)
+	RELEASE(adev->srbm_mutex)
 {
 	unlock_srbm(adev);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 441568163e20..298bc6c51076 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -49,12 +49,14 @@ enum hqd_dequeue_request_type {
=20
 static void kgd_gfx_v9_lock_srbm(struct amdgpu_device *adev, uint32_t me=
c, uint32_t pipe,
 			uint32_t queue, uint32_t vmid, uint32_t inst)
+	ACQUIRE(adev->srbm_mutex)
 {
 	mutex_lock(&adev->srbm_mutex);
 	soc15_grbm_select(adev, mec, pipe, queue, vmid, GET_INST(GC, inst));
 }
=20
 static void kgd_gfx_v9_unlock_srbm(struct amdgpu_device *adev, uint32_t =
inst)
+	RELEASE(adev->srbm_mutex)
 {
 	soc15_grbm_select(adev, 0, 0, 0, 0, GET_INST(GC, inst));
 	mutex_unlock(&adev->srbm_mutex);
@@ -62,6 +64,7 @@ static void kgd_gfx_v9_unlock_srbm(struct amdgpu_device=
 *adev, uint32_t inst)
=20
 void kgd_gfx_v9_acquire_queue(struct amdgpu_device *adev, uint32_t pipe_=
id,
 				uint32_t queue_id, uint32_t inst)
+	ACQUIRE(adev->srbm_mutex)
 {
 	uint32_t mec =3D (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
 	uint32_t pipe =3D (pipe_id % adev->gfx.mec.num_pipe_per_mec);
@@ -79,6 +82,7 @@ uint64_t kgd_gfx_v9_get_queue_mask(struct amdgpu_device=
 *adev,
 }
=20
 void kgd_gfx_v9_release_queue(struct amdgpu_device *adev, uint32_t inst)
+	RELEASE(adev->srbm_mutex)
 {
 	kgd_gfx_v9_unlock_srbm(adev, inst);
 }
@@ -925,6 +929,8 @@ void kgd_gfx_v9_set_vm_context_page_table_base(struct=
 amdgpu_device *adev,
 }
=20
 static void lock_spi_csq_mutexes(struct amdgpu_device *adev)
+	ACQUIRE(adev->srbm_mutex)
+	ACQUIRE(adev->grbm_idx_mutex)
 {
 	mutex_lock(&adev->srbm_mutex);
 	mutex_lock(&adev->grbm_idx_mutex);
@@ -932,6 +938,8 @@ static void lock_spi_csq_mutexes(struct amdgpu_device=
 *adev)
 }
=20
 static void unlock_spi_csq_mutexes(struct amdgpu_device *adev)
+	RELEASE(adev->grbm_idx_mutex)
+	RELEASE(adev->srbm_mutex)
 {
 	mutex_unlock(&adev->grbm_idx_mutex);
 	mutex_unlock(&adev->srbm_mutex);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
index 5cc5f59e3018..3344cccfe2ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -837,6 +837,7 @@ static int amdgpu_cs_bo_validate(void *param, struct =
amdgpu_bo *bo)
=20
 static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 				union drm_amdgpu_cs *cs)
+	TRY_ACQUIRE(0, p->bo_list->bo_list_mutex)
 {
 	struct amdgpu_fpriv *fpriv =3D p->filp->driver_priv;
 	struct ttm_operation_ctx ctx =3D { true, false };
@@ -1275,6 +1276,7 @@ static void amdgpu_cs_post_dependencies(struct amdg=
pu_cs_parser *p)
=20
 static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 			    union drm_amdgpu_cs *cs)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	struct amdgpu_fpriv *fpriv =3D p->filp->driver_priv;
 	struct amdgpu_job *leader =3D p->gang_leader;
@@ -1408,6 +1410,7 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_=
parser *parser)
 }
=20
 int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file =
*filp)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	struct amdgpu_device *adev =3D drm_to_adev(dev);
 	struct amdgpu_cs_parser parser;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_debugfs.c
index 49ca8c814455..6af868b801b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -71,6 +71,7 @@
  */
 static int  amdgpu_debugfs_process_reg_op(bool read, struct file *f,
 		char __user *buf, size_t size, loff_t *pos)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct amdgpu_device *adev =3D file_inode(f)->i_private;
 	ssize_t result =3D 0;
@@ -228,6 +229,7 @@ static int amdgpu_debugfs_regs2_release(struct inode =
*inode, struct file *file)
 }
=20
 static ssize_t amdgpu_debugfs_regs2_op(struct file *f, char __user *buf,=
 u32 offset, size_t size, int write_en)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct amdgpu_debugfs_regs2_data *rd =3D f->private_data;
 	struct amdgpu_device *adev =3D rd->adev;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
index d100bb7a137c..da1629efb322 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5854,6 +5854,7 @@ static int amdgpu_device_health_check(struct list_h=
ead *device_list_handle)
 int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			      struct amdgpu_job *job,
 			      struct amdgpu_reset_context *reset_context)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct list_head device_list, *device_list_handle =3D  NULL;
 	bool job_signaled =3D false;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_i2c.c
index f0765ccde668..351d8cab8428 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -38,6 +38,7 @@
=20
 /* bit banging i2c */
 static int amdgpu_i2c_pre_xfer(struct i2c_adapter *i2c_adap)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct amdgpu_i2c_chan *i2c =3D i2c_get_adapdata(i2c_adap);
 	struct amdgpu_device *adev =3D drm_to_adev(i2c->dev);
@@ -80,6 +81,7 @@ static int amdgpu_i2c_pre_xfer(struct i2c_adapter *i2c_=
adap)
 }
=20
 static void amdgpu_i2c_post_xfer(struct i2c_adapter *i2c_adap)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct amdgpu_i2c_chan *i2c =3D i2c_get_adapdata(i2c_adap);
 	struct amdgpu_device *adev =3D drm_to_adev(i2c->dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_job.c
index 100f04475943..31cc917f1651 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -50,6 +50,7 @@ static void amdgpu_job_do_core_dump(struct amdgpu_devic=
e *adev,
=20
 static void amdgpu_job_core_dump(struct amdgpu_device *adev,
 				 struct amdgpu_job *job)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct list_head device_list, *device_list_handle =3D  NULL;
 	struct amdgpu_device *tmp_adev =3D NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_mes.c
index 32b27a1658e7..1e31bba6d4bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -566,6 +566,7 @@ static int amdgpu_mes_queue_alloc_mqd(struct amdgpu_d=
evice *adev,
 static void amdgpu_mes_queue_init_mqd(struct amdgpu_device *adev,
 				     struct amdgpu_mes_queue *q,
 				     struct amdgpu_mes_queue_properties *p)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct amdgpu_mqd *mqd_mgr =3D &adev->mqds[p->queue_type];
 	struct amdgpu_mqd_prop mqd_prop =3D {0};
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_mes.h
index 2df2444ee892..28db12612729 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
@@ -521,12 +521,14 @@ int amdgpu_mes_doorbell_process_slice(struct amdgpu=
_device *adev);
  * to prevent deadlocks when an MMU notifier runs in reclaim-FS context.
  */
 static inline void amdgpu_mes_lock(struct amdgpu_mes *mes)
+	ACQUIRE(mes->mutex_hidden)
 {
 	mutex_lock(&mes->mutex_hidden);
 	mes->saved_flags =3D memalloc_noreclaim_save();
 }
=20
 static inline void amdgpu_mes_unlock(struct amdgpu_mes *mes)
+	RELEASE(mes->mutex_hidden)
 {
 	memalloc_noreclaim_restore(mes->saved_flags);
 	mutex_unlock(&mes->mutex_hidden);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_psp.c
index babe94ade247..ad2cd4d7b8bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -748,6 +748,7 @@ psp_cmd_submit_buf(struct psp_context *psp,
 }
=20
 static struct psp_gfx_cmd_resp *acquire_psp_cmd_buf(struct psp_context *=
psp)
+	ACQUIRE(psp->mutex)
 {
 	struct psp_gfx_cmd_resp *cmd =3D psp->cmd;
=20
@@ -759,6 +760,7 @@ static struct psp_gfx_cmd_resp *acquire_psp_cmd_buf(s=
truct psp_context *psp)
 }
=20
 static void release_psp_cmd_buf(struct psp_context *psp)
+	RELEASE(psp->mutex)
 {
 	mutex_unlock(&psp->mutex);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_reset.c
index dabfbdf6f1ce..0ba474497e5f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -99,6 +99,7 @@ static int amdgpu_reset_xgmi_reset_on_init_restore_hwct=
xt(
 static int amdgpu_reset_xgmi_reset_on_init_perform_reset(
 	struct amdgpu_reset_control *reset_ctl,
 	struct amdgpu_reset_context *reset_context)
+	NO_THREAD_SAFETY_ANALYSIS /* locking inside a loop */
 {
 	struct amdgpu_device *adev =3D (struct amdgpu_device *)reset_ctl->handl=
e;
 	struct list_head *reset_device_list =3D reset_context->reset_device_lis=
t;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_umsch_mm.h
index 2c771a753778..4d189e780659 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h
@@ -232,11 +232,13 @@ void amdgpu_umsch_fwlog_init(struct amdgpu_umsch_mm=
 *umsch_mm);
 	((umsch)->funcs->ring_fini ? (umsch)->funcs->ring_fini((umsch)) : 0)
=20
 static inline void amdgpu_umsch_mm_lock(struct amdgpu_umsch_mm *umsch)
+	ACQUIRE(umsch->mutex_hidden)
 {
 	mutex_lock(&umsch->mutex_hidden);
 }
=20
 static inline void amdgpu_umsch_mm_unlock(struct amdgpu_umsch_mm *umsch)
+	RELEASE(umsch->mutex_hidden)
 {
 	mutex_unlock(&umsch->mutex_hidden);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
index 5c07777d3239..98b122efacbb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2184,6 +2184,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
  * Check if it is possible to evict a VM.
  */
 bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct amdgpu_vm_bo_base *bo_base =3D bo->vm_bo;
=20
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.h
index a3e128e373bc..3966be013968 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -644,12 +644,14 @@ static inline uint64_t amdgpu_vm_tlb_seq(struct amd=
gpu_vm *vm)
  * an MMU notifier runs in reclaim-FS context.
  */
 static inline void amdgpu_vm_eviction_lock(struct amdgpu_vm *vm)
+	ACQUIRE(vm->eviction_lock)
 {
 	mutex_lock(&vm->eviction_lock);
 	vm->saved_flags =3D memalloc_noreclaim_save();
 }
=20
 static inline bool amdgpu_vm_eviction_trylock(struct amdgpu_vm *vm)
+	TRY_ACQUIRE(true, vm->eviction_lock)
 {
 	if (mutex_trylock(&vm->eviction_lock)) {
 		vm->saved_flags =3D memalloc_noreclaim_save();
@@ -659,6 +661,7 @@ static inline bool amdgpu_vm_eviction_trylock(struct =
amdgpu_vm *vm)
 }
=20
 static inline void amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
+	RELEASE(vm->eviction_lock)
 {
 	memalloc_noreclaim_restore(vm->saved_flags);
 	mutex_unlock(&vm->eviction_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_vm_pt.c
index b0bf21682115..35874fd9c982 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -494,6 +494,7 @@ static int amdgpu_vm_pt_alloc(struct amdgpu_device *a=
dev,
 			      struct amdgpu_vm *vm,
 			      struct amdgpu_vm_pt_cursor *cursor,
 			      bool immediate)
+	REQUIRES(vm->eviction_lock)
 {
 	struct amdgpu_vm_bo_base *entry =3D cursor->entry;
 	struct amdgpu_bo *pt_bo;
@@ -820,6 +821,7 @@ static void amdgpu_vm_pte_fragment(struct amdgpu_vm_u=
pdate_params *params,
 int amdgpu_vm_ptes_update(struct amdgpu_vm_update_params *params,
 			  uint64_t start, uint64_t end,
 			  uint64_t dst, uint64_t flags)
+	REQUIRES(params->vm->eviction_lock)
 {
 	struct amdgpu_device *adev =3D params->adev;
 	struct amdgpu_vm_pt_cursor cursor;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_xcp.c
index 23b6f7a4aa4a..2e67e08f8c82 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
@@ -216,6 +216,7 @@ int amdgpu_xcp_restore_partition_mode(struct amdgpu_x=
cp_mgr *xcp_mgr)
 }
=20
 int amdgpu_xcp_query_partition_mode(struct amdgpu_xcp_mgr *xcp_mgr, u32 =
flags)
+	NO_THREAD_SAFETY_ANALYSIS /* conditinal locking */
 {
 	int mode;
=20
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c b/drivers/gpu/drm/amd=
/amdgpu/jpeg_v1_0.c
index 03b8b7cd5229..4e66723d18cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
@@ -602,12 +602,13 @@ static void jpeg_v1_0_set_irq_funcs(struct amdgpu_d=
evice *adev)
 }
=20
 static void jpeg_v1_0_ring_begin_use(struct amdgpu_ring *ring)
+	ACQUIRE(ring->adev->vcn.vcn1_jpeg1_workaround)
 {
 	struct	amdgpu_device *adev =3D ring->adev;
 	bool	set_clocks =3D !cancel_delayed_work_sync(&adev->vcn.idle_work);
 	int		cnt =3D 0;
=20
-	mutex_lock(&adev->vcn.vcn1_jpeg1_workaround);
+	mutex_lock(&ring->adev->vcn.vcn1_jpeg1_workaround);
=20
 	if (amdgpu_fence_wait_empty(&adev->vcn.inst->ring_dec))
 		DRM_ERROR("JPEG dec: vcn dec ring may not be empty\n");
diff --git a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c b/drivers/gpu/drm=
/amd/amdgpu/smu_v11_0_i2c.c
index dd2d66090d23..8b3d4f0302a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
@@ -607,6 +607,7 @@ static uint32_t smu_v11_0_i2c_write_data(struct i2c_a=
dapter *control,
 }
=20
 static void lock_bus(struct i2c_adapter *i2c, unsigned int flags)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct amdgpu_smu_i2c_bus *smu_i2c =3D i2c_get_adapdata(i2c);
 	struct amdgpu_device *adev =3D smu_i2c->adev;
@@ -625,6 +626,7 @@ static int trylock_bus(struct i2c_adapter *i2c, unsig=
ned int flags)
 }
=20
 static void unlock_bus(struct i2c_adapter *i2c, unsigned int flags)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct amdgpu_smu_i2c_bus *smu_i2c =3D i2c_get_adapdata(i2c);
 	struct amdgpu_device *adev =3D smu_i2c->adev;
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/=
amdgpu/vcn_v1_0.c
index 5ea96c983517..b77a19577502 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -1867,11 +1867,12 @@ static void vcn_v1_0_idle_work_handler(struct wor=
k_struct *work)
 }
=20
 static void vcn_v1_0_ring_begin_use(struct amdgpu_ring *ring)
+	ACQUIRE(ring->adev->vcn.vcn1_jpeg1_workaround)
 {
 	struct	amdgpu_device *adev =3D ring->adev;
 	bool set_clocks =3D !cancel_delayed_work_sync(&adev->vcn.idle_work);
=20
-	mutex_lock(&adev->vcn.vcn1_jpeg1_workaround);
+	mutex_lock(&ring->adev->vcn.vcn1_jpeg1_workaround);
=20
 	if (amdgpu_fence_wait_empty(ring->adev->jpeg.inst->ring_dec))
 		DRM_ERROR("VCN dec: jpeg dec ring may not be empty\n");
@@ -1920,6 +1921,7 @@ void vcn_v1_0_set_pg_for_begin_use(struct amdgpu_ri=
ng *ring, bool set_clocks)
 }
=20
 void vcn_v1_0_ring_end_use(struct amdgpu_ring *ring)
+	RELEASE(ring->adev->vcn.vcn1_jpeg1_workaround)
 {
 	schedule_delayed_work(&ring->adev->vcn.idle_work, VCN_IDLE_TIMEOUT);
 	mutex_unlock(&ring->adev->vcn.vcn1_jpeg1_workaround);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_chardev.c
index 065d87841459..816bbaf75954 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -68,6 +68,7 @@ static const struct class kfd_class =3D {
 };
=20
 static inline struct kfd_process_device *kfd_lock_pdd_by_id(struct kfd_p=
rocess *p, __u32 gpu_id)
+	NO_THREAD_SAFETY_ANALYSIS /* returns a pointer */
 {
 	struct kfd_process_device *pdd;
=20
@@ -82,6 +83,7 @@ static inline struct kfd_process_device *kfd_lock_pdd_b=
y_id(struct kfd_process *
 }
=20
 static inline void kfd_unlock_pdd(struct kfd_process_device *pdd)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the locking function */
 {
 	mutex_unlock(&pdd->process->mutex);
 }
@@ -2749,6 +2751,7 @@ static int kfd_ioctl_criu(struct file *filep, struc=
t kfd_process *p, void *data)
=20
 static int runtime_enable(struct kfd_process *p, uint64_t r_debug,
 			bool enable_ttmp_setup)
+	REQUIRES(p->mutex)
 {
 	int i =3D 0, ret =3D 0;
=20
@@ -2817,6 +2820,7 @@ static int runtime_enable(struct kfd_process *p, ui=
nt64_t r_debug,
 }
=20
 static int runtime_disable(struct kfd_process *p)
+	REQUIRES(p->mutex)
 {
 	int i =3D 0, ret;
 	bool was_enabled =3D p->runtime_info.runtime_state =3D=3D DEBUG_RUNTIME=
_STATE_ENABLED;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/driv=
ers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index d4593374e7a1..57357f5911b3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -2383,6 +2383,8 @@ static int execute_queues_cpsch(struct device_queue=
_manager *dqm,
=20
 static int wait_on_destroy_queue(struct device_queue_manager *dqm,
 				 struct queue *q)
+	REQUIRES(dqm->lock_hidden)
+	REQUIRES(q->process->mutex)
 {
 	struct kfd_process_device *pdd =3D kfd_get_process_device_data(q->devic=
e,
 								q->process);
@@ -2412,6 +2414,7 @@ static int wait_on_destroy_queue(struct device_queu=
e_manager *dqm,
 static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 				struct qcm_process_device *qpd,
 				struct queue *q)
+	REQUIRES(q->process->mutex)
 {
 	int retval;
 	struct mqd_manager *mqd_mgr;
@@ -3545,6 +3548,7 @@ void set_queue_snapshot_entry(struct queue *q,
 }
=20
 int debug_lock_and_unmap(struct device_queue_manager *dqm)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct device *dev =3D dqm->dev->adev->dev;
 	int r;
@@ -3567,6 +3571,7 @@ int debug_lock_and_unmap(struct device_queue_manage=
r *dqm)
 }
=20
 int debug_map_and_unlock(struct device_queue_manager *dqm)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	struct device *dev =3D dqm->dev->adev->dev;
 	int r;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/driv=
ers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 09ab36f8e8c6..66a75279f094 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -344,11 +344,13 @@ get_sh_mem_bases_nybble_64(struct kfd_process_devic=
e *pdd)
  * an MMU notifier runs in reclaim-FS context.
  */
 static inline void dqm_lock(struct device_queue_manager *dqm)
+	ACQUIRE(dqm->lock_hidden)
 {
 	mutex_lock(&dqm->lock_hidden);
 	dqm->saved_flags =3D memalloc_noreclaim_save();
 }
 static inline void dqm_unlock(struct device_queue_manager *dqm)
+	RELEASE(dqm->lock_hidden)
 {
 	memalloc_noreclaim_restore(dqm->saved_flags);
 	mutex_unlock(&dqm->lock_hidden);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/a=
mdkfd/kfd_svm.h
index bddd24f04669..63331e9ef4cf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -141,12 +141,14 @@ struct svm_range {
 };
=20
 static inline void svm_range_lock(struct svm_range *prange)
+	ACQUIRE(prange->lock)
 {
 	mutex_lock(&prange->lock);
 	prange->saved_flags =3D memalloc_noreclaim_save();
=20
 }
 static inline void svm_range_unlock(struct svm_range *prange)
+	RELEASE(prange->lock)
 {
 	memalloc_noreclaim_restore(prange->saved_flags);
 	mutex_unlock(&prange->lock);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ac3fd81fecef..e2b2ed1ec452 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3042,6 +3042,7 @@ static void hpd_rx_irq_work_suspend(struct amdgpu_d=
isplay_manager *dm)
 }
=20
 static int dm_suspend(struct amdgpu_ip_block *ip_block)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct amdgpu_device *adev =3D ip_block->adev;
 	struct amdgpu_display_manager *dm =3D &adev->dm;
@@ -3233,6 +3234,7 @@ static void dm_gpureset_commit_state(struct dc_stat=
e *dc_state,
 }
=20
 static int dm_resume(struct amdgpu_ip_block *ip_block)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct amdgpu_device *adev =3D ip_block->adev;
 	struct drm_device *ddev =3D adev_to_drm(adev);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index e339c7a8d541..4a9851d302f3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -150,6 +150,7 @@ static void process_output(struct hdcp_workqueue *hdc=
p_work)
 }
=20
 static void link_lock(struct hdcp_workqueue *work, bool lock)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int i =3D 0;
=20
diff --git a/drivers/gpu/drm/ast/ast_ddc.c b/drivers/gpu/drm/ast/ast_ddc.=
c
index 29cf5d157f34..43acf96ffea7 100644
--- a/drivers/gpu/drm/ast/ast_ddc.c
+++ b/drivers/gpu/drm/ast/ast_ddc.c
@@ -70,6 +70,7 @@ static void ast_ddc_algo_bit_data_setscl(void *data, in=
t state)
 }
=20
 static int ast_ddc_algo_bit_data_pre_xfer(struct i2c_adapter *adapter)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct ast_ddc *ddc =3D i2c_get_adapdata(adapter);
 	struct ast_device *ast =3D ddc->ast;
@@ -84,6 +85,7 @@ static int ast_ddc_algo_bit_data_pre_xfer(struct i2c_ad=
apter *adapter)
 }
=20
 static void ast_ddc_algo_bit_data_post_xfer(struct i2c_adapter *adapter)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct ast_ddc *ddc =3D i2c_get_adapdata(adapter);
 	struct ast_device *ast =3D ddc->ast;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm=
/bridge/lontium-lt9611uxc.c
index f4c3ff1fdc69..fdd05e3e36f9 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -122,12 +122,14 @@ static struct lt9611uxc *bridge_to_lt9611uxc(struct=
 drm_bridge *bridge)
 }
=20
 static void lt9611uxc_lock(struct lt9611uxc *lt9611uxc)
+	ACQUIRE(lt9611uxc->ocm_lock)
 {
 	mutex_lock(&lt9611uxc->ocm_lock);
 	regmap_write(lt9611uxc->regmap, 0x80ee, 0x01);
 }
=20
 static void lt9611uxc_unlock(struct lt9611uxc *lt9611uxc)
+	RELEASE(lt9611uxc->ocm_lock)
 {
 	regmap_write(lt9611uxc->regmap, 0x80ee, 0x00);
 	msleep(50);
diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/=
drm_log.c
index 379850c83e51..e4be95012851 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -363,6 +363,7 @@ static void drm_log_write_thread(struct console *con,=
 struct nbcon_write_context
 }
=20
 static void drm_log_lock(struct console *con, unsigned long *flags)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct drm_log *dlog =3D console_to_drm_log(con);
=20
@@ -371,6 +372,7 @@ static void drm_log_lock(struct console *con, unsigne=
d long *flags)
 }
=20
 static void drm_log_unlock(struct console *con, unsigned long flags)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct drm_log *dlog =3D console_to_drm_log(con);
=20
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/di=
splay/drm_dp_helper.c
index da3c8521a7fa..5621fe8c7ac8 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2089,16 +2089,19 @@ static struct drm_dp_aux *i2c_to_aux(struct i2c_a=
dapter *i2c)
 }
=20
 static void lock_bus(struct i2c_adapter *i2c, unsigned int flags)
+	ACQUIRE(i2c_to_aux(i2c)->hw_mutex)
 {
 	mutex_lock(&i2c_to_aux(i2c)->hw_mutex);
 }
=20
 static int trylock_bus(struct i2c_adapter *i2c, unsigned int flags)
+	TRY_ACQUIRE(1, i2c_to_aux(i2c)->hw_mutex)
 {
 	return mutex_trylock(&i2c_to_aux(i2c)->hw_mutex);
 }
=20
 static void unlock_bus(struct i2c_adapter *i2c, unsigned int flags)
+	RELEASE(i2c_to_aux(i2c)->hw_mutex)
 {
 	mutex_unlock(&i2c_to_aux(i2c)->hw_mutex);
 }
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
index 06c91c5b7f7c..fe1527177614 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -1666,12 +1666,14 @@ save_port_topology_ref(struct drm_dp_mst_port *po=
rt,
=20
 static inline void
 topology_ref_history_lock(struct drm_dp_mst_topology_mgr *mgr)
+	ACQUIRE(mgr->topology_ref_history_lock)
 {
 	mutex_lock(&mgr->topology_ref_history_lock);
 }
=20
 static inline void
 topology_ref_history_unlock(struct drm_dp_mst_topology_mgr *mgr)
+	RELEASE(mgr->topology_ref_history_lock)
 {
 	mutex_unlock(&mgr->topology_ref_history_lock);
 }
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
index 5186d2114a50..8f6adf608a49 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3374,6 +3374,7 @@ EXPORT_SYMBOL(drm_atomic_helper_disable_all);
  * and it is the atomic version of drm_helper_force_disable_all().
  */
 void drm_atomic_helper_shutdown(struct drm_device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* DRM_MODESET_LOCK */
 {
 	struct drm_modeset_acquire_ctx ctx;
 	int ret;
@@ -3507,6 +3508,7 @@ EXPORT_SYMBOL(drm_atomic_helper_duplicate_state);
  * drm_atomic_helper_resume(), drm_atomic_helper_commit_duplicated_state=
()
  */
 struct drm_atomic_state *drm_atomic_helper_suspend(struct drm_device *de=
v)
+	NO_THREAD_SAFETY_ANALYSIS /* DRM_MODESET_LOCK */
 {
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_atomic_state *state;
@@ -3600,6 +3602,7 @@ EXPORT_SYMBOL(drm_atomic_helper_commit_duplicated_s=
tate);
  */
 int drm_atomic_helper_resume(struct drm_device *dev,
 			     struct drm_atomic_state *state)
+	NO_THREAD_SAFETY_ANALYSIS /* DRM_MODESET_LOCK */
 {
 	struct drm_modeset_acquire_ctx ctx;
 	int err;
diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 22aa015df387..45aee359f44d 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -448,6 +448,7 @@ EXPORT_SYMBOL(drm_master_put);
=20
 /* Used by drm_client and drm_fb_helper */
 bool drm_master_internal_acquire(struct drm_device *dev)
+	TRY_ACQUIRE(true, dev->master_mutex)
 {
 	mutex_lock(&dev->master_mutex);
 	if (dev->master) {
@@ -461,6 +462,7 @@ EXPORT_SYMBOL(drm_master_internal_acquire);
=20
 /* Used by drm_client and drm_fb_helper */
 void drm_master_internal_release(struct drm_device *dev)
+	RELEASE(dev->master_mutex)
 {
 	mutex_unlock(&dev->master_mutex);
 }
diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_c=
lient_modeset.c
index aca442c25209..90ba56141fe9 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -1214,6 +1214,7 @@ int drm_client_modeset_commit(struct drm_client_dev=
 *client)
 EXPORT_SYMBOL(drm_client_modeset_commit);
=20
 static void drm_client_modeset_dpms_legacy(struct drm_client_dev *client=
, int dpms_mode)
+	NO_THREAD_SAFETY_ANALYSIS /* DRM_MODESET_LOCK */
 {
 	struct drm_device *dev =3D client->dev;
 	struct drm_connector *connector;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color=
_mgmt.c
index 3969dc548cff..2bae9370b31f 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -358,6 +358,7 @@ static int drm_crtc_legacy_gamma_set(struct drm_crtc =
*crtc,
  */
 int drm_mode_gamma_set_ioctl(struct drm_device *dev,
 			     void *data, struct drm_file *file_priv)
+	NO_THREAD_SAFETY_ANALYSIS /* DRM_MODESET_LOCK */
 {
 	struct drm_mode_crtc_lut *crtc_lut =3D data;
 	struct drm_crtc *crtc;
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 3488ff067c69..d124f99c61bc 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -691,6 +691,7 @@ EXPORT_SYMBOL(drm_crtc_check_viewport);
  */
 int drm_mode_setcrtc(struct drm_device *dev, void *data,
 		     struct drm_file *file_priv)
+	NO_THREAD_SAFETY_ANALYSIS /* DRM_MODESET_LOCK */
 {
 	struct drm_mode_config *config =3D &dev->mode_config;
 	struct drm_mode_crtc *crtc_req =3D data;
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3cf440eee8a2..12aa56972493 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -929,6 +929,7 @@ static void remove_compat_control_link(struct drm_dev=
ice *dev)
  * 0 on success, negative error code on failure.
  */
 int drm_dev_register(struct drm_device *dev, unsigned long flags)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	const struct drm_driver *driver =3D dev->driver;
 	int ret;
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
index fb3614a7ba44..0d5ab9432f25 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1808,6 +1808,7 @@ static void drm_setup_crtcs_fb(struct drm_fb_helper=
 *fb_helper)
 /* Note: Drops fb_helper->lock before returning. */
 static int
 __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helpe=
r)
+	RELEASE(fb_helper->lock)
 {
 	struct drm_device *dev =3D fb_helper->dev;
 	struct fb_info *info;
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 2289e71e2fa2..a955be3425f7 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -355,6 +355,7 @@ int drm_open_helper(struct file *filp, struct drm_min=
or *minor)
  * 0 on success or negative errno value on failure.
  */
 int drm_open(struct inode *inode, struct file *filp)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct drm_device *dev;
 	struct drm_minor *minor;
@@ -413,6 +414,7 @@ static void drm_lastclose(struct drm_device *dev)
  * Always succeeds and returns 0.
  */
 int drm_release(struct inode *inode, struct file *filp)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct drm_file *file_priv =3D filp->private_data;
 	struct drm_minor *minor =3D file_priv->minor;
@@ -483,6 +485,7 @@ void drm_file_update_pid(struct drm_file *filp)
  * Always succeeds and returns 0.
  */
 int drm_release_noglobal(struct inode *inode, struct file *filp)
+	NO_THREAD_SAFETY_ANALYSIS /* needed because of a clang bug? */
 {
 	struct drm_file *file_priv =3D filp->private_data;
 	struct drm_minor *minor =3D file_priv->minor;
@@ -527,6 +530,7 @@ EXPORT_SYMBOL(drm_release_noglobal);
  */
 ssize_t drm_read(struct file *filp, char __user *buffer,
 		 size_t count, loff_t *offset)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct drm_file *file_priv =3D filp->private_data;
 	struct drm_device *dev =3D file_priv->minor->dev;
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ee811764c3df..1a9bd014ff2a 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -383,6 +383,7 @@ int
 drm_gem_handle_create_tail(struct drm_file *file_priv,
 			   struct drm_gem_object *obj,
 			   u32 *handlep)
+	RELEASE(obj->dev->object_name_lock)
 {
 	struct drm_device *dev =3D obj->dev;
 	u32 handle;
@@ -404,7 +405,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv=
,
 	spin_unlock(&file_priv->table_lock);
 	idr_preload_end();
=20
-	mutex_unlock(&dev->object_name_lock);
+	mutex_unlock(&obj->dev->object_name_lock);
 	if (ret < 0)
 		goto err_unref;
=20
@@ -902,6 +903,7 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *dat=
a,
 int
 drm_gem_open_ioctl(struct drm_device *dev, void *data,
 		   struct drm_file *file_priv)
+	NO_THREAD_SAFETY_ANALYSIS /* requires alias analysis */
 {
 	struct drm_gem_open *args =3D data;
 	struct drm_gem_object *obj;
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode=
_object.c
index e943205a2394..418e25185f08 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -435,6 +435,7 @@ int drm_mode_object_get_properties(struct drm_mode_ob=
ject *obj, bool atomic,
  */
 int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data=
,
 				      struct drm_file *file_priv)
+	NO_THREAD_SAFETY_ANALYSIS /* DRM_MODESET_LOCK */
 {
 	struct drm_mode_obj_get_properties *arg =3D data;
 	struct drm_mode_object *obj;
@@ -484,6 +485,7 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_mode_obj_find_prop_i=
d);
 static int set_property_legacy(struct drm_mode_object *obj,
 			       struct drm_property *prop,
 			       uint64_t prop_value)
+	NO_THREAD_SAFETY_ANALYSIS /* DRM_MODESET_LOCK */
 {
 	struct drm_device *dev =3D prop->dev;
 	struct drm_mode_object *ref;
diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_mod=
eset_lock.c
index 7694b85e75e3..f9442f9823ae 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -141,6 +141,7 @@ static void __drm_stack_depot_init(void)
  * drm_modeset_lock_all_ctx() function and pass in the context explicitl=
y.
  */
 void drm_modeset_lock_all(struct drm_device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct drm_mode_config *config =3D &dev->mode_config;
 	struct drm_modeset_acquire_ctx *ctx;
@@ -195,6 +196,7 @@ EXPORT_SYMBOL(drm_modeset_lock_all);
  * directly to the drm_modeset_drop_locks() function.
  */
 void drm_modeset_unlock_all(struct drm_device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlocking */
 {
 	struct drm_mode_config *config =3D &dev->mode_config;
 	struct drm_modeset_acquire_ctx *ctx =3D config->acquire_ctx;
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index a28b22fdd7a4..ab324a023e93 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1084,6 +1084,7 @@ static int setplane_internal(struct drm_plane *plan=
e,
 			     /* src_{x,y,w,h} values are 16.16 fixed point */
 			     uint32_t src_x, uint32_t src_y,
 			     uint32_t src_w, uint32_t src_h)
+	NO_THREAD_SAFETY_ANALYSIS /* DRM_MODESET_LOCK */
 {
 	struct drm_modeset_acquire_ctx ctx;
 	int ret;
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 32a8781cfd67..664b0c2c8c36 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -295,6 +295,7 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
 int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 			       struct drm_file *file_priv, int prime_fd,
 			       uint32_t *handle)
+	NO_THREAD_SAFETY_ANALYSIS /* requires alias analysis */
 {
 	struct dma_buf *dma_buf;
 	struct drm_gem_object *obj;
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
index c7a603589412..450d08524bc3 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2520,6 +2520,7 @@ static void intel_pcode_notify(struct intel_display=
 *display,
 static void intel_set_cdclk(struct intel_display *display,
 			    const struct intel_cdclk_config *cdclk_config,
 			    enum pipe pipe, const char *context)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex calls inside a loop */
 {
 	struct drm_i915_private *dev_priv =3D to_i915(display->drm);
 	struct intel_encoder *encoder;
diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.c b/drivers=
/gpu/drm/i915/display/intel_display_reset.c
index 093b386c95e8..73a3f3ade271 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.c
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.c
@@ -20,6 +20,7 @@ static bool gpu_reset_clobbers_display(struct drm_i915_=
private *dev_priv)
 }
=20
 void intel_display_reset_prepare(struct drm_i915_private *dev_priv)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct drm_modeset_acquire_ctx *ctx =3D &dev_priv->display.restore.rese=
t_ctx;
 	struct drm_atomic_state *state;
@@ -82,6 +83,7 @@ void intel_display_reset_prepare(struct drm_i915_privat=
e *dev_priv)
 }
=20
 void intel_display_reset_finish(struct drm_i915_private *i915)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct intel_display *display =3D &i915->display;
 	struct drm_modeset_acquire_ctx *ctx =3D &display->restore.reset_ctx;
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm=
/i915/display/intel_gmbus.c
index 807cf606e7a8..54fd5f1d6ce2 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -838,6 +838,7 @@ static const struct i2c_algorithm gmbus_algorithm =3D=
 {
=20
 static void gmbus_lock_bus(struct i2c_adapter *adapter,
 			   unsigned int flags)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct intel_gmbus *bus =3D to_intel_gmbus(adapter);
 	struct intel_display *display =3D bus->display;
@@ -847,6 +848,7 @@ static void gmbus_lock_bus(struct i2c_adapter *adapte=
r,
=20
 static int gmbus_trylock_bus(struct i2c_adapter *adapter,
 			     unsigned int flags)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct intel_gmbus *bus =3D to_intel_gmbus(adapter);
 	struct intel_display *display =3D bus->display;
@@ -856,6 +858,7 @@ static int gmbus_trylock_bus(struct i2c_adapter *adap=
ter,
=20
 static void gmbus_unlock_bus(struct i2c_adapter *adapter,
 			     unsigned int flags)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct intel_gmbus *bus =3D to_intel_gmbus(adapter);
 	struct intel_display *display =3D bus->display;
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i=
915/display/intel_pps.c
index eb35f0249f2b..9cfa2ada532d 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -63,6 +63,7 @@ static const char *pps_name(struct intel_dp *intel_dp)
 }
=20
 intel_wakeref_t intel_pps_lock(struct intel_dp *intel_dp)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct intel_display *display =3D to_intel_display(intel_dp);
 	struct drm_i915_private *dev_priv =3D to_i915(display->drm);
@@ -79,6 +80,7 @@ intel_wakeref_t intel_pps_lock(struct intel_dp *intel_d=
p)
=20
 intel_wakeref_t intel_pps_unlock(struct intel_dp *intel_dp,
 				 intel_wakeref_t wakeref)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct intel_display *display =3D to_intel_display(intel_dp);
 	struct drm_i915_private *dev_priv =3D to_i915(display->drm);
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i=
915/display/intel_psr.c
index 0b021acb330f..dc7cfeb0a4c8 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2938,6 +2938,7 @@ void intel_psr_wait_for_idle_locked(const struct in=
tel_crtc_state *new_crtc_stat
 }
=20
 static bool __psr_wait_for_idle_locked(struct intel_dp *intel_dp)
+	REQUIRES(intel_dp->psr.lock)
 {
 	struct intel_display *display =3D to_intel_display(intel_dp);
 	enum transcoder cpu_transcoder =3D intel_dp->psr.transcoder;
@@ -3567,6 +3568,7 @@ bool intel_psr_link_ok(struct intel_dp *intel_dp)
  * before it to avoid vblank evasion.
  */
 void intel_psr_lock(const struct intel_crtc_state *crtc_state)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct intel_display *display =3D to_intel_display(crtc_state);
 	struct intel_encoder *encoder;
@@ -3590,6 +3592,7 @@ void intel_psr_lock(const struct intel_crtc_state *=
crtc_state)
  * Release the PSR lock that was held during pipe update.
  */
 void intel_psr_unlock(const struct intel_crtc_state *crtc_state)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct intel_display *display =3D to_intel_display(crtc_state);
 	struct intel_encoder *encoder;
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i9=
15/display/intel_tc.c
index 13811244c82b..d81e8de5acf4 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -1773,6 +1773,7 @@ void intel_tc_port_link_cancel_reset_work(struct in=
tel_digital_port *dig_port)
=20
 static void __intel_tc_port_lock(struct intel_tc_port *tc,
 				 int required_lanes)
+	ACQUIRE(tc->lock)
 {
 	struct drm_i915_private *i915 =3D tc_to_i915(tc);
=20
@@ -1790,6 +1791,7 @@ static void __intel_tc_port_lock(struct intel_tc_po=
rt *tc,
 }
=20
 void intel_tc_port_lock(struct intel_digital_port *dig_port)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	__intel_tc_port_lock(to_tc_port(dig_port), 1);
 }
@@ -1832,6 +1834,7 @@ void intel_tc_port_suspend(struct intel_digital_por=
t *dig_port)
 }
=20
 void intel_tc_port_unlock(struct intel_digital_port *dig_port)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct intel_tc_port *tc =3D to_tc_port(dig_port);
=20
@@ -1852,6 +1855,7 @@ bool intel_tc_port_ref_held(struct intel_digital_po=
rt *dig_port)
=20
 void intel_tc_port_get_link(struct intel_digital_port *dig_port,
 			    int required_lanes)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct intel_tc_port *tc =3D to_tc_port(dig_port);
=20
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/dr=
m/i915/gem/i915_gem_context.h
index e5b0f66ea1fe..61f1dcdd7050 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -190,6 +190,7 @@ i915_gem_context_engines(struct i915_gem_context *ctx=
)
 static inline struct i915_gem_engines *
 i915_gem_context_lock_engines(struct i915_gem_context *ctx)
 	__acquires(&ctx->engines_mutex)
+	ACQUIRE(ctx->engines_mutex)
 {
 	mutex_lock(&ctx->engines_mutex);
 	return i915_gem_context_engines(ctx);
@@ -198,6 +199,7 @@ i915_gem_context_lock_engines(struct i915_gem_context=
 *ctx)
 static inline void
 i915_gem_context_unlock_engines(struct i915_gem_context *ctx)
 	__releases(&ctx->engines_mutex)
+	RELEASE(ctx->engines_mutex)
 {
 	mutex_unlock(&ctx->engines_mutex);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
index f151640c1d13..8ca9f464c87d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3081,6 +3081,7 @@ static void retire_requests(struct intel_timeline *=
tl, struct i915_request *end)
=20
 static int eb_request_add(struct i915_execbuffer *eb, struct i915_reques=
t *rq,
 			  int err, bool last_parallel)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct intel_timeline * const tl =3D i915_request_timeline(rq);
 	struct i915_sched_attr attr =3D {};
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i9=
15/gt/intel_context.h
index 9f523999acd1..8fd387bcfbd9 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -105,6 +105,7 @@ void intel_context_bind_parent_child(struct intel_con=
text *parent,
  */
 static inline int intel_context_lock_pinned(struct intel_context *ce)
 	__acquires(ce->pin_mutex)
+	TRY_ACQUIRE(0, ce->pin_mutex)
 {
 	return mutex_lock_interruptible(&ce->pin_mutex);
 }
@@ -139,6 +140,7 @@ static inline void intel_context_cancel_request(struc=
t intel_context *ce,
  */
 static inline void intel_context_unlock_pinned(struct intel_context *ce)
 	__releases(ce->pin_mutex)
+	RELEASE(ce->pin_mutex)
 {
 	mutex_unlock(&ce->pin_mutex);
 }
@@ -247,6 +249,7 @@ static inline void intel_context_put(struct intel_con=
text *ce)
 static inline struct intel_timeline *__must_check
 intel_context_timeline_lock(struct intel_context *ce)
 	__acquires(&ce->timeline->mutex)
+	NO_THREAD_SAFETY_ANALYSIS /* returns a pointer */
 {
 	struct intel_timeline *tl =3D ce->timeline;
 	int err;
@@ -266,6 +269,7 @@ intel_context_timeline_lock(struct intel_context *ce)
=20
 static inline void intel_context_timeline_unlock(struct intel_timeline *=
tl)
 	__releases(&tl->mutex)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the corresponding lock function *=
/
 {
 	mutex_unlock(&tl->mutex);
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm=
/i915/gt/selftest_context.c
index 5eb46700dc4e..6b0628caff9b 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -13,6 +13,7 @@
 #include "selftests/mock_drm.h"
=20
 static int request_sync(struct i915_request *rq)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct intel_timeline *tl =3D i915_request_timeline(rq);
 	long timeout;
diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/dr=
m/i915/gt/selftest_timeline.c
index fa36cf920bde..d8d98fe609b3 100644
--- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
@@ -856,6 +856,7 @@ static int setup_watcher(struct hwsp_watcher *w, stru=
ct intel_gt *gt,
 }
=20
 static void switch_tl_lock(struct i915_request *from, struct i915_reques=
t *to)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	/* some light mutex juggling required; think co-routines */
=20
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
index 63c751ca4119..14bacbcd7734 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -434,6 +434,7 @@ int intel_gvt_create_vgpu(struct intel_vgpu *vgpu,
  */
 void intel_gvt_reset_vgpu_locked(struct intel_vgpu *vgpu, bool dmlr,
 				 intel_engine_mask_t engine_mask)
+	REQUIRES(vgpu->vgpu_lock)
 {
 	struct intel_gvt *gvt =3D vgpu->gvt;
 	struct intel_gvt_workload_scheduler *scheduler =3D &gvt->scheduler;
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i=
915_request.c
index 8f62cfa23fb7..c5d9d8767efe 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1843,6 +1843,7 @@ void __i915_request_queue(struct i915_request *rq,
 }
=20
 void i915_request_add(struct i915_request *rq)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct intel_timeline * const tl =3D i915_request_timeline(rq);
 	struct i915_sched_attr attr =3D {};
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_=
vma.c
index 776f8cc51b2f..64e08156a71c 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -2179,7 +2179,7 @@ int i915_vma_unbind(struct i915_vma *vma)
 		/* XXX not always required: nop_clear_range */
 		wakeref =3D intel_runtime_pm_get(&vm->i915->runtime_pm);
=20
-	err =3D mutex_lock_interruptible_nested(&vma->vm->mutex, !wakeref);
+	err =3D mutex_lock_interruptible_nested(&vm->mutex, !wakeref);
 	if (err)
 		goto out_rpm;
=20
@@ -2193,6 +2193,7 @@ int i915_vma_unbind(struct i915_vma *vma)
 }
=20
 int i915_vma_unbind_async(struct i915_vma *vma, bool trylock_vm)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct drm_i915_gem_object *obj =3D vma->obj;
 	struct i915_address_space *vm =3D vma->vm;
diff --git a/drivers/gpu/drm/i915/intel_sbi.c b/drivers/gpu/drm/i915/inte=
l_sbi.c
index 41e85ac773dc..def511389ffe 100644
--- a/drivers/gpu/drm/i915/intel_sbi.c
+++ b/drivers/gpu/drm/i915/intel_sbi.c
@@ -58,11 +58,13 @@ static int intel_sbi_rw(struct drm_i915_private *i915=
, u16 reg,
 }
=20
 void intel_sbi_lock(struct drm_i915_private *i915)
+	ACQUIRE(i915->sbi_lock)
 {
 	mutex_lock(&i915->sbi_lock);
 }
=20
 void intel_sbi_unlock(struct drm_i915_private *i915)
+	RELEASE(i915->sbi_lock)
 {
 	mutex_unlock(&i915->sbi_lock);
 }
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/=
intel_wakeref.c
index 87f246047312..595ff21b2a9f 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -51,6 +51,7 @@ int __intel_wakeref_get_first(struct intel_wakeref *wf)
 }
=20
 static void ____intel_wakeref_put_last(struct intel_wakeref *wf)
+	RELEASE(wf->mutex)
 {
 	intel_wakeref_t wakeref =3D NULL;
=20
@@ -86,6 +87,7 @@ void __intel_wakeref_put_last(struct intel_wakeref *wf,=
 unsigned long flags)
 }
=20
 static void __intel_wakeref_put_work(struct work_struct *wrk)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct intel_wakeref *wf =3D container_of(wrk, typeof(*wf), work.work);
=20
diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/=
intel_wakeref.h
index 48836ef52d40..842f8bfe32e8 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.h
+++ b/drivers/gpu/drm/i915/intel_wakeref.h
@@ -204,6 +204,7 @@ intel_wakeref_might_put(struct intel_wakeref *wf)
 static inline void
 intel_wakeref_lock(struct intel_wakeref *wf)
 	__acquires(wf->mutex)
+	ACQUIRE(wf->mutex)
 {
 	mutex_lock(&wf->mutex);
 }
@@ -217,6 +218,7 @@ intel_wakeref_lock(struct intel_wakeref *wf)
 static inline void
 intel_wakeref_unlock(struct intel_wakeref *wf)
 	__releases(wf->mutex)
+	RELEASE(wf->mutex)
 {
 	mutex_unlock(&wf->mutex);
 }
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c b/drivers/gpu/drm/i=
915/pxp/intel_pxp_cmd.c
index 0eee51c4a772..2823f7cbee07 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
@@ -81,6 +81,7 @@ static u32 *pxp_emit_wait(u32 *cs)
 #define WAIT_LEN 2
=20
 static void pxp_request_commit(struct i915_request *rq)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct i915_sched_attr attr =3D { .priority =3D I915_PRIORITY_MAX };
 	struct intel_timeline * const tl =3D i915_request_timeline(rq);
diff --git a/drivers/gpu/drm/i915/vlv_sideband.c b/drivers/gpu/drm/i915/v=
lv_sideband.c
index 114ae8eb9cd5..203f4c2a3989 100644
--- a/drivers/gpu/drm/i915/vlv_sideband.c
+++ b/drivers/gpu/drm/i915/vlv_sideband.c
@@ -58,6 +58,7 @@ static void __vlv_punit_put(struct drm_i915_private *i9=
15)
 }
=20
 void vlv_iosf_sb_get(struct drm_i915_private *i915, unsigned long ports)
+	ACQUIRE(i915->vlv_iosf_sb.lock)
 {
 	if (ports & BIT(VLV_IOSF_SB_PUNIT))
 		__vlv_punit_get(i915);
@@ -66,6 +67,7 @@ void vlv_iosf_sb_get(struct drm_i915_private *i915, uns=
igned long ports)
 }
=20
 void vlv_iosf_sb_put(struct drm_i915_private *i915, unsigned long ports)
+	RELEASE(i915->vlv_iosf_sb.lock)
 {
 	mutex_unlock(&i915->vlv_iosf_sb.lock);
=20
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/=
ingenic/ingenic-drm-drv.c
index c23ee2d214de..3d4343aa7f44 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -213,6 +213,7 @@ static inline dma_addr_t dma_hwdesc_addr(const struct=
 ingenic_drm *priv,
 static int ingenic_drm_update_pixclk(struct notifier_block *nb,
 				     unsigned long action,
 				     void *data)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct ingenic_drm *priv =3D drm_nb_get_priv(nb);
=20
diff --git a/drivers/gpu/drm/mgag200/mgag200_ddc.c b/drivers/gpu/drm/mgag=
200/mgag200_ddc.c
index 6d81ea8931e8..526c15602476 100644
--- a/drivers/gpu/drm/mgag200/mgag200_ddc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_ddc.c
@@ -100,6 +100,7 @@ static int mgag200_ddc_algo_bit_data_getscl(void *dat=
a)
 }
=20
 static int mgag200_ddc_algo_bit_data_pre_xfer(struct i2c_adapter *adapte=
r)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct mgag200_ddc *ddc =3D i2c_get_adapdata(adapter);
 	struct mga_device *mdev =3D ddc->mdev;
@@ -114,6 +115,7 @@ static int mgag200_ddc_algo_bit_data_pre_xfer(struct =
i2c_adapter *adapter)
 }
=20
 static void mgag200_ddc_algo_bit_data_post_xfer(struct i2c_adapter *adap=
ter)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct mgag200_ddc *ddc =3D i2c_get_adapdata(adapter);
 	struct mga_device *mdev =3D ddc->mdev;
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_a=
tomic.c
index a7a2384044ff..66f31b42b511 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -41,6 +41,7 @@ static void vblank_put(struct msm_kms *kms, unsigned cr=
tc_mask)
 }
=20
 static void lock_crtcs(struct msm_kms *kms, unsigned int crtc_mask)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	int crtc_index;
 	struct drm_crtc *crtc;
@@ -52,6 +53,7 @@ static void lock_crtcs(struct msm_kms *kms, unsigned in=
t crtc_mask)
 }
=20
 static void unlock_crtcs(struct msm_kms *kms, unsigned int crtc_mask)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct drm_crtc *crtc;
=20
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
index 62d72b7a8d04..5a6ec419c4e0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2159,6 +2159,7 @@ nv50_disp_atomic_commit_wndw(struct drm_atomic_stat=
e *state, u32 *interlock)
=20
 static void
 nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct drm_device *dev =3D state->dev;
 	struct drm_crtc_state *new_crtc_state, *old_crtc_state;
@@ -2757,6 +2758,7 @@ nv50_display_read_hw_or_state(struct drm_device *de=
v, struct nv50_disp *disp,
 /* Read back the currently programmed display state */
 static void
 nv50_display_read_hw_state(struct nouveau_drm *drm)
+	NO_THREAD_SAFETY_ANALYSIS /* DRM_MODESET_LOCK */
 {
 	struct drm_device *dev =3D drm->dev;
 	struct drm_encoder *encoder;
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/no=
uveau/nouveau_abi16.c
index 2a0617e5fe2a..ebe0eadeba7f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -56,6 +56,7 @@ nouveau_abi16(struct drm_file *file_priv)
=20
 struct nouveau_abi16 *
 nouveau_abi16_get(struct drm_file *file_priv)
+	NO_THREAD_SAFETY_ANALYSIS /* returns a pointer */
 {
 	struct nouveau_cli *cli =3D nouveau_cli(file_priv);
 	mutex_lock(&cli->mutex);
@@ -67,6 +68,7 @@ nouveau_abi16_get(struct drm_file *file_priv)
=20
 int
 nouveau_abi16_put(struct nouveau_abi16 *abi16, int ret)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the previous function */
 {
 	struct nouveau_cli *cli =3D abi16->cli;
 	mutex_unlock(&cli->mutex);
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nou=
veau/nouveau_uvmm.h
index 9d3c348581eb..0013bd3b552d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -86,11 +86,13 @@ int nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev=
, void *data,
 			       struct drm_file *file_priv);
=20
 static inline void nouveau_uvmm_lock(struct nouveau_uvmm *uvmm)
+	ACQUIRE(uvmm->mutex)
 {
 	mutex_lock(&uvmm->mutex);
 }
=20
 static inline void nouveau_uvmm_unlock(struct nouveau_uvmm *uvmm)
+	RELEASE(uvmm->mutex)
 {
 	mutex_unlock(&uvmm->mutex);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c b/drivers/gpu/drm=
/nouveau/nvkm/core/subdev.c
index 6c20e827a069..dda2fa920fba 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
@@ -184,6 +184,7 @@ nvkm_subdev_oneinit(struct nvkm_subdev *subdev)
=20
 void
 nvkm_subdev_unref(struct nvkm_subdev *subdev)
+	NO_THREAD_SAFETY_ANALYSIS /* because of a clang bug */
 {
 	if (refcount_dec_and_mutex_lock(&subdev->use.refcount, &subdev->use.mut=
ex)) {
 		nvkm_subdev_fini(subdev, false);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/fifo/chan.c
index 7d4716dcd512..5c54691d3bdb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -70,6 +70,7 @@ nvkm_chan_cctx_bind(struct nvkm_chan *chan, struct nvkm=
_engn *engn, struct nvkm_
=20
 void
 nvkm_chan_cctx_put(struct nvkm_chan *chan, struct nvkm_cctx **pcctx)
+	NO_THREAD_SAFETY_ANALYSIS /* needed because of a clang bug? */
 {
 	struct nvkm_cctx *cctx =3D *pcctx;
=20
@@ -104,7 +105,7 @@ nvkm_chan_cctx_get(struct nvkm_chan *chan, struct nvk=
m_engn *engn, struct nvkm_c
 	if (cctx) {
 		refcount_inc(&cctx->refs);
 		*pcctx =3D cctx;
-		mutex_unlock(&chan->cgrp->mutex);
+		mutex_unlock(&cgrp->mutex);
 		return 0;
 	}
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/fifo/uchan.c
index 9e56bcc166ed..c1b109aabde5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -73,6 +73,7 @@ struct nvkm_uobj {
=20
 static int
 nvkm_uchan_object_fini_1(struct nvkm_oproxy *oproxy, bool suspend)
+	NO_THREAD_SAFETY_ANALYSIS /* needed because of a clang bug? */
 {
 	struct nvkm_uobj *uobj =3D container_of(oproxy, typeof(*uobj), oproxy);
 	struct nvkm_chan *chan =3D uobj->chan;
diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c b/drivers/gpu/drm=
/nouveau/nvkm/falcon/cmdq.c
index 211ebe7afac6..448865b9b59b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c
@@ -69,6 +69,7 @@ nvkm_falcon_cmdq_rewind(struct nvkm_falcon_cmdq *cmdq)
=20
 static int
 nvkm_falcon_cmdq_open(struct nvkm_falcon_cmdq *cmdq, u32 size)
+	TRY_ACQUIRE(0, cmdq->mutex)
 {
 	struct nvkm_falcon *falcon =3D cmdq->qmgr->falcon;
 	bool rewind =3D false;
@@ -91,6 +92,7 @@ nvkm_falcon_cmdq_open(struct nvkm_falcon_cmdq *cmdq, u3=
2 size)
=20
 static void
 nvkm_falcon_cmdq_close(struct nvkm_falcon_cmdq *cmdq)
+	RELEASE(cmdq->mutex)
 {
 	nvkm_falcon_wr32(cmdq->qmgr->falcon, cmdq->head_reg, cmdq->position);
 	mutex_unlock(&cmdq->mutex);
@@ -98,6 +100,7 @@ nvkm_falcon_cmdq_close(struct nvkm_falcon_cmdq *cmdq)
=20
 static int
 nvkm_falcon_cmdq_write(struct nvkm_falcon_cmdq *cmdq, struct nvfw_falcon=
_cmd *cmd)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	static unsigned timeout =3D 2000;
 	unsigned long end_jiffies =3D jiffies + msecs_to_jiffies(timeout);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/i2c/auxch.c
index fafc634acbf6..4d1f1c309913 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.c
@@ -106,6 +106,7 @@ nvkm_i2c_aux_monitor(struct nvkm_i2c_aux *aux, bool m=
onitor)
=20
 void
 nvkm_i2c_aux_release(struct nvkm_i2c_aux *aux)
+	RELEASE(aux->mutex)
 {
 	struct nvkm_i2c_pad *pad =3D aux->pad;
 	AUX_TRACE(aux, "release");
@@ -115,6 +116,7 @@ nvkm_i2c_aux_release(struct nvkm_i2c_aux *aux)
=20
 int
 nvkm_i2c_aux_acquire(struct nvkm_i2c_aux *aux)
+	TRY_ACQUIRE(0, aux->mutex)
 {
 	struct nvkm_i2c_pad *pad =3D aux->pad;
 	int ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/i2c/bus.c
index ed50cc3736b9..b3000d2beb59 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c
@@ -127,6 +127,7 @@ nvkm_i2c_bus_fini(struct nvkm_i2c_bus *bus)
=20
 void
 nvkm_i2c_bus_release(struct nvkm_i2c_bus *bus)
+	RELEASE(bus->mutex)
 {
 	struct nvkm_i2c_pad *pad =3D bus->pad;
 	BUS_TRACE(bus, "release");
@@ -136,6 +137,7 @@ nvkm_i2c_bus_release(struct nvkm_i2c_bus *bus)
=20
 int
 nvkm_i2c_bus_acquire(struct nvkm_i2c_bus *bus)
+	TRY_ACQUIRE(0, bus->mutex)
 {
 	struct nvkm_i2c_pad *pad =3D bus->pad;
 	int ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/i2c/pad.c
index 2c5fcb9c504b..188d181e85af 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.c
@@ -44,6 +44,7 @@ nvkm_i2c_pad_mode(struct nvkm_i2c_pad *pad, enum nvkm_i=
2c_pad_mode mode)
=20
 void
 nvkm_i2c_pad_release(struct nvkm_i2c_pad *pad)
+	RELEASE(pad->mutex)
 {
 	PAD_TRACE(pad, "release");
 	if (pad->mode =3D=3D NVKM_I2C_PAD_OFF)
@@ -53,6 +54,7 @@ nvkm_i2c_pad_release(struct nvkm_i2c_pad *pad)
=20
 int
 nvkm_i2c_pad_acquire(struct nvkm_i2c_pad *pad, enum nvkm_i2c_pad_mode mo=
de)
+	TRY_ACQUIRE(0, pad->mutex)
 {
 	PAD_TRACE(pad, "acquire");
 	mutex_lock(&pad->mutex);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers=
/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index dd5b5a17ece0..612db8a0b603 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -119,6 +119,7 @@ nv50_instobj_fast =3D {
=20
 static void
 nv50_instobj_kmap(struct nv50_instobj *iobj, struct nvkm_vmm *vmm)
+	REQUIRES(iobj->imem->base.mutex)
 {
 	struct nv50_instmem *imem =3D iobj->imem;
 	struct nv50_instobj *eobj;
@@ -134,12 +135,12 @@ nv50_instobj_kmap(struct nv50_instobj *iobj, struct=
 nvkm_vmm *vmm)
 	 * into it.  The lock has to be dropped while doing this due
 	 * to the possibility of recursion for page table allocation.
 	 */
-	mutex_unlock(&imem->base.mutex);
+	mutex_unlock(&iobj->imem->base.mutex);
 	while ((ret =3D nvkm_vmm_get(vmm, 12, size, &bar))) {
 		/* Evict unused mappings, and keep retrying until we either
 		 * succeed,or there's no more objects left on the LRU.
 		 */
-		mutex_lock(&imem->base.mutex);
+		mutex_lock(&iobj->imem->base.mutex);
 		eobj =3D list_first_entry_or_null(&imem->lru, typeof(*eobj), lru);
 		if (eobj) {
 			nvkm_debug(subdev, "evict %016llx %016llx @ %016llx\n",
@@ -152,7 +153,7 @@ nv50_instobj_kmap(struct nv50_instobj *iobj, struct n=
vkm_vmm *vmm)
 			emap =3D eobj->map;
 			eobj->map =3D NULL;
 		}
-		mutex_unlock(&imem->base.mutex);
+		mutex_unlock(&iobj->imem->base.mutex);
 		if (!eobj)
 			break;
 		iounmap(emap);
@@ -161,12 +162,12 @@ nv50_instobj_kmap(struct nv50_instobj *iobj, struct=
 nvkm_vmm *vmm)
=20
 	if (ret =3D=3D 0)
 		ret =3D nvkm_memory_map(memory, 0, vmm, bar, NULL, 0);
-	mutex_lock(&imem->base.mutex);
+	mutex_lock(&iobj->imem->base.mutex);
 	if (ret || iobj->bar) {
 		/* We either failed, or another thread beat us. */
-		mutex_unlock(&imem->base.mutex);
+		mutex_unlock(&iobj->imem->base.mutex);
 		nvkm_vmm_put(vmm, &bar);
-		mutex_lock(&imem->base.mutex);
+		mutex_lock(&iobj->imem->base.mutex);
 		return;
 	}
=20
@@ -190,6 +191,7 @@ nv50_instobj_map(struct nvkm_memory *memory, u64 offs=
et, struct nvkm_vmm *vmm,
=20
 static void
 nv50_instobj_release(struct nvkm_memory *memory)
+	NO_THREAD_SAFETY_ANALYSIS /* needed because of a clang bug? */
 {
 	struct nv50_instobj *iobj =3D nv50_instobj(memory);
 	struct nv50_instmem *imem =3D iobj->imem;
@@ -231,9 +233,9 @@ nv50_instobj_acquire(struct nvkm_memory *memory)
 	/* Take the lock, and re-check that another thread hasn't
 	 * already mapped the object in the meantime.
 	 */
-	mutex_lock(&imem->mutex);
+	mutex_lock(&iobj->imem->base.mutex);
 	if (refcount_inc_not_zero(&iobj->maps)) {
-		mutex_unlock(&imem->mutex);
+		mutex_unlock(&iobj->imem->base.mutex);
 		return iobj->map;
 	}
=20
@@ -258,7 +260,7 @@ nv50_instobj_acquire(struct nvkm_memory *memory)
 		refcount_set(&iobj->maps, 1);
 	}
=20
-	mutex_unlock(&imem->mutex);
+	mutex_unlock(&iobj->imem->base.mutex);
 	return map;
 }
=20
@@ -271,7 +273,7 @@ nv50_instobj_boot(struct nvkm_memory *memory, struct =
nvkm_vmm *vmm)
 	/* Exclude bootstrapped objects (ie. the page tables for the
 	 * instmem BAR itself) from eviction.
 	 */
-	mutex_lock(&imem->mutex);
+	mutex_lock(&iobj->imem->base.mutex);
 	if (likely(iobj->lru.next)) {
 		list_del_init(&iobj->lru);
 		iobj->lru.next =3D NULL;
@@ -279,7 +281,7 @@ nv50_instobj_boot(struct nvkm_memory *memory, struct =
nvkm_vmm *vmm)
=20
 	nv50_instobj_kmap(iobj, vmm);
 	nvkm_instmem_boot(imem);
-	mutex_unlock(&imem->mutex);
+	mutex_unlock(&iobj->imem->base.mutex);
 }
=20
 static u64
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
index c39e3eb1c15d..f59ec31e6ec8 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -813,6 +813,7 @@ int panthor_vm_active(struct panthor_vm *vm)
  * and other AS updates).
  */
 void panthor_vm_idle(struct panthor_vm *vm)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct panthor_device *ptdev =3D vm->ptdev;
=20
diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.=
c
index d6ea01f3797b..afcbaa317965 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -576,6 +576,7 @@ void qxl_surface_evict(struct qxl_device *qdev, struc=
t qxl_bo *surf, bool do_upd
 }
=20
 static int qxl_reap_surf(struct qxl_device *qdev, struct qxl_bo *surf, b=
ool stall)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	long ret;
=20
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_=
display.c
index bc24af08dfcd..e2ff1e5c8433 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -165,6 +165,7 @@ static void qxl_update_offset_props(struct qxl_device=
 *qdev)
 }
=20
 void qxl_display_read_client_monitors_config(struct qxl_device *qdev)
+	NO_THREAD_SAFETY_ANALYSIS /* DRM_MODESET_LOCK */
 {
 	struct drm_device *dev =3D &qdev->ddev;
 	struct drm_modeset_acquire_ctx ctx;
@@ -408,6 +409,7 @@ static int qxl_framebuffer_surface_dirty(struct drm_f=
ramebuffer *fb,
 					 unsigned int flags, unsigned int color,
 					 struct drm_clip_rect *clips,
 					 unsigned int num_clips)
+	NO_THREAD_SAFETY_ANALYSIS /* DRM_MODESET_LOCK */
 {
 	/* TODO: vmwgfx where this was cribbed from had locking. Why? */
 	struct qxl_device *qdev =3D to_qxl(fb->dev);
diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon=
/radeon_i2c.c
index 1f16619ed06e..55bc511d748b 100644
--- a/drivers/gpu/drm/radeon/radeon_i2c.c
+++ b/drivers/gpu/drm/radeon/radeon_i2c.c
@@ -83,6 +83,7 @@ bool radeon_ddc_probe(struct radeon_connector *radeon_c=
onnector, bool use_aux)
 /* bit banging i2c */
=20
 static int pre_xfer(struct i2c_adapter *i2c_adap)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct radeon_i2c_chan *i2c =3D i2c_get_adapdata(i2c_adap);
 	struct radeon_device *rdev =3D i2c->dev->dev_private;
@@ -153,6 +154,7 @@ static int pre_xfer(struct i2c_adapter *i2c_adap)
 }
=20
 static void post_xfer(struct i2c_adapter *i2c_adap)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct radeon_i2c_chan *i2c =3D i2c_get_adapdata(i2c_adap);
 	struct radeon_device *rdev =3D i2c->dev->dev_private;
diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeo=
n/radeon_ring.c
index 581ae20c46e4..e9642b6644af 100644
--- a/drivers/gpu/drm/radeon/radeon_ring.c
+++ b/drivers/gpu/drm/radeon/radeon_ring.c
@@ -143,6 +143,7 @@ int radeon_ring_alloc(struct radeon_device *rdev, str=
uct radeon_ring *ring, unsi
  * Returns 0 on success, error on failure.
  */
 int radeon_ring_lock(struct radeon_device *rdev, struct radeon_ring *rin=
g, unsigned ndw)
+	TRY_ACQUIRE(0, rdev->ring_lock)
 {
 	int r;
=20
@@ -199,6 +200,7 @@ void radeon_ring_commit(struct radeon_device *rdev, s=
truct radeon_ring *ring,
  */
 void radeon_ring_unlock_commit(struct radeon_device *rdev, struct radeon=
_ring *ring,
 			       bool hdp_flush)
+	RELEASE(rdev->ring_lock)
 {
 	radeon_ring_commit(rdev, ring, hdp_flush);
 	mutex_unlock(&rdev->ring_lock);
@@ -225,6 +227,7 @@ void radeon_ring_undo(struct radeon_ring *ring)
  * Call radeon_ring_undo() then unlock the ring (all asics).
  */
 void radeon_ring_unlock_undo(struct radeon_device *rdev, struct radeon_r=
ing *ring)
+	RELEASE(rdev->ring_lock)
 {
 	radeon_ring_undo(ring);
 	mutex_unlock(&rdev->ring_lock);
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/roc=
kchip/cdn-dp-core.c
index b17de83b988b..e422013de3a8 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -906,6 +906,7 @@ static int cdn_dp_audio_codec_init(struct cdn_dp_devi=
ce *dp,
 }
=20
 static int cdn_dp_request_firmware(struct cdn_dp_device *dp)
+	REQUIRES(dp->lock)
 {
 	int ret;
 	unsigned long timeout =3D jiffies + msecs_to_jiffies(CDN_FW_TIMEOUT_MS)=
;
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
index 17a98845fd31..6cd71da23798 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -283,11 +283,13 @@ static struct vop2_win *to_vop2_win(struct drm_plan=
e *p)
 }
=20
 static void vop2_lock(struct vop2 *vop2)
+	ACQUIRE(vop2->vop2_lock)
 {
 	mutex_lock(&vop2->vop2_lock);
 }
=20
 static void vop2_unlock(struct vop2 *vop2)
+	RELEASE(vop2->vop2_lock)
 {
 	mutex_unlock(&vop2->vop2_lock);
 }
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e705f8590c13..92968ae352c1 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -372,12 +372,14 @@ static const struct tmds_config tegra124_tmds_confi=
g[] =3D {
 };
=20
 static void tegra_hdmi_audio_lock(struct tegra_hdmi *hdmi)
+	ACQUIRE(hdmi->audio_lock)
 {
 	mutex_lock(&hdmi->audio_lock);
 	disable_irq(hdmi->irq);
 }
=20
 static void tegra_hdmi_audio_unlock(struct tegra_hdmi *hdmi)
+	RELEASE(hdmi->audio_lock)
 {
 	enable_irq(hdmi->irq);
 	mutex_unlock(&hdmi->audio_lock);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/tt=
m/tests/ttm_bo_test.c
index f8f20d2f6174..1c74babea1e7 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -137,6 +137,7 @@ static void ttm_bo_reserve_double_resv(struct kunit *=
test)
  * propagates that error.
  */
 static void ttm_bo_reserve_deadlock(struct kunit *test)
+	NO_THREAD_SAFETY_ANALYSIS /* intentional lock/unlock mismatch */
 {
 	struct ttm_buffer_object *bo1, *bo2;
 	struct ww_acquire_ctx ctx1, ctx2;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_cmd.c
index dd4ca6a9c690..5569e7e9d82b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
@@ -276,6 +276,7 @@ static int vmw_fifo_wait(struct vmw_private *dev_priv=
,
  */
 static void *vmw_local_fifo_reserve(struct vmw_private *dev_priv,
 				    uint32_t bytes)
+	NO_THREAD_SAFETY_ANALYSIS /* returns a pointer */
 {
 	struct vmw_fifo_state *fifo_state =3D dev_priv->fifo;
 	u32  *fifo_mem =3D dev_priv->fifo_mem;
@@ -425,6 +426,8 @@ static void vmw_fifo_slow_copy(struct vmw_fifo_state =
*fifo_state,
 }
=20
 static void vmw_local_fifo_commit(struct vmw_private *dev_priv, uint32_t=
 bytes)
+	RELEASE(dev_priv->fifo->fifo_mutex)
+	RELEASE(dev_priv->fifo->fifo_mutex)
 {
 	struct vmw_fifo_state *fifo_state =3D dev_priv->fifo;
 	uint32_t next_cmd =3D vmw_fifo_mem_read(dev_priv, SVGA_FIFO_NEXT_CMD);
@@ -466,10 +469,11 @@ static void vmw_local_fifo_commit(struct vmw_privat=
e *dev_priv, uint32_t bytes)
 	mb();
 	up_write(&fifo_state->rwsem);
 	vmw_fifo_ping_host(dev_priv, SVGA_SYNC_GENERIC);
-	mutex_unlock(&fifo_state->fifo_mutex);
+	mutex_unlock(&dev_priv->fifo->fifo_mutex);
 }
=20
 void vmw_cmd_commit(struct vmw_private *dev_priv, uint32_t bytes)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (dev_priv->cman)
 		vmw_cmdbuf_commit(dev_priv->cman, bytes, NULL, false);
@@ -485,6 +489,7 @@ void vmw_cmd_commit(struct vmw_private *dev_priv, uin=
t32_t bytes)
  * @bytes: Number of bytes to commit.
  */
 void vmw_cmd_commit_flush(struct vmw_private *dev_priv, uint32_t bytes)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (dev_priv->cman)
 		vmw_cmdbuf_commit(dev_priv->cman, bytes, NULL, true);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmw=
gfx/vmwgfx_cmdbuf.c
index 94e8982f5616..9382884053c4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
@@ -204,6 +204,7 @@ static int vmw_cmdbuf_preempt(struct vmw_cmdbuf_man *=
man, u32 context);
  * @interruptible: Whether to wait interruptible when locking.
  */
 static int vmw_cmdbuf_cur_lock(struct vmw_cmdbuf_man *man, bool interrup=
tible)
+	TRY_ACQUIRE(0, &man->cur_mutex)
 {
 	if (interruptible) {
 		if (mutex_lock_interruptible(&man->cur_mutex))
@@ -221,6 +222,7 @@ static int vmw_cmdbuf_cur_lock(struct vmw_cmdbuf_man =
*man, bool interruptible)
  * @man: The range manager.
  */
 static void vmw_cmdbuf_cur_unlock(struct vmw_cmdbuf_man *man)
+	RELEASE(&man->cur_mutex)
 {
 	mutex_unlock(&man->cur_mutex);
 }
@@ -999,6 +1001,7 @@ static void *vmw_cmdbuf_reserve_cur(struct vmw_cmdbu=
f_man *man,
 				    size_t size,
 				    int ctx_id,
 				    bool interruptible)
+	NO_THREAD_SAFETY_ANALYSIS /* returns a pointer */
 {
 	struct vmw_cmdbuf_header *cur;
 	void *ret;
@@ -1043,6 +1046,7 @@ static void *vmw_cmdbuf_reserve_cur(struct vmw_cmdb=
uf_man *man,
  */
 static void vmw_cmdbuf_commit_cur(struct vmw_cmdbuf_man *man,
 				  size_t size, bool flush)
+	RELEASE(man->cur_mutex)
 {
 	struct vmw_cmdbuf_header *cur =3D man->cur;
=20
@@ -1100,6 +1104,7 @@ void *vmw_cmdbuf_reserve(struct vmw_cmdbuf_man *man=
, size_t size,
  */
 void vmw_cmdbuf_commit(struct vmw_cmdbuf_man *man, size_t size,
 		       struct vmw_cmdbuf_header *header, bool flush)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	if (!header) {
 		vmw_cmdbuf_commit_cur(man, size, flush);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_validation.c
index e7625b3f71e0..12be07c3ef6f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -692,6 +692,7 @@ void vmw_validation_unref_lists(struct vmw_validation=
_context *ctx)
 int vmw_validation_prepare(struct vmw_validation_context *ctx,
 			   struct mutex *mutex,
 			   bool intr)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret =3D 0;
=20
@@ -743,6 +744,7 @@ int vmw_validation_prepare(struct vmw_validation_cont=
ext *ctx,
  * The caller still needs to unref resources after a call to this functi=
on.
  */
 void vmw_validation_revert(struct vmw_validation_context *ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	vmw_validation_bo_backoff(ctx);
 	vmw_validation_res_unreserve(ctx, true);
@@ -762,6 +764,7 @@ void vmw_validation_revert(struct vmw_validation_cont=
ext *ctx)
  */
 void vmw_validation_done(struct vmw_validation_context *ctx,
 			 struct vmw_fence_obj *fence)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	vmw_validation_bo_fence(ctx, fence);
 	vmw_validation_res_unreserve(ctx, false);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
index 278bc96cf593..e022018e8f0d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1308,6 +1308,7 @@ static struct dma_fence *
 __xe_migrate_update_pgtables(struct xe_migrate *m,
 			     struct xe_migrate_pt_update *pt_update,
 			     struct xe_vm_pgtable_update_ops *pt_update_ops)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	const struct xe_migrate_pt_update_ops *ops =3D pt_update->ops;
 	struct xe_tile *tile =3D m->tile;
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.=
c
index 9333ce776a6e..62ae48080bb5 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -268,6 +268,7 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile=
, u32 min_gt_freq,
  * Returns 0 on success, and -error number on failure.
  */
 int xe_pcode_ready(struct xe_device *xe, bool locked)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	u32 status, request =3D DGFX_GET_INIT_STATUS;
 	struct xe_tile *tile =3D xe_device_get_root_tile(xe);
diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 8e09d6d328d2..ac1f61b022ac 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -884,6 +884,7 @@ EXPORT_SYMBOL(host1x_client_resume);
 struct host1x_bo_mapping *host1x_bo_pin(struct device *dev, struct host1=
x_bo *bo,
 					enum dma_data_direction dir,
 					struct host1x_bo_cache *cache)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct host1x_bo_mapping *mapping;
=20
@@ -943,6 +944,7 @@ static void __host1x_bo_unpin(struct kref *ref)
 }
=20
 void host1x_bo_unpin(struct host1x_bo_mapping *mapping)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct host1x_bo_cache *cache =3D mapping->cache;
=20
diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index 407ed9b9cf64..3b491105acd1 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -184,6 +184,7 @@ static u32 host1x_pushbuffer_space(struct push_buffer=
 *pb)
  */
 unsigned int host1x_cdma_wait_locked(struct host1x_cdma *cdma,
 				     enum cdma_event event)
+	REQUIRES(cdma->lock)
 {
 	for (;;) {
 		struct push_buffer *pb =3D &cdma->push_buffer;
@@ -235,6 +236,7 @@ unsigned int host1x_cdma_wait_locked(struct host1x_cd=
ma *cdma,
 static int host1x_cdma_wait_pushbuffer_space(struct host1x *host1x,
 					     struct host1x_cdma *cdma,
 					     unsigned int needed)
+	REQUIRES(cdma->lock)
 {
 	while (true) {
 		struct push_buffer *pb =3D &cdma->push_buffer;
@@ -546,6 +548,7 @@ int host1x_cdma_deinit(struct host1x_cdma *cdma)
  * Begin a cdma submit
  */
 int host1x_cdma_begin(struct host1x_cdma *cdma, struct host1x_job *job)
+	TRY_ACQUIRE(0, cdma->lock)
 {
 	struct host1x *host1x =3D cdma_to_host1x(cdma);
=20
@@ -590,6 +593,7 @@ int host1x_cdma_begin(struct host1x_cdma *cdma, struc=
t host1x_job *job)
  * Blocks as necessary if the push buffer is full.
  */
 void host1x_cdma_push(struct host1x_cdma *cdma, u32 op1, u32 op2)
+	REQUIRES(cdma->lock)
 {
 	struct host1x *host1x =3D cdma_to_host1x(cdma);
 	struct push_buffer *pb =3D &cdma->push_buffer;
@@ -621,6 +625,7 @@ void host1x_cdma_push(struct host1x_cdma *cdma, u32 o=
p1, u32 op2)
  */
 void host1x_cdma_push_wide(struct host1x_cdma *cdma, u32 op1, u32 op2,
 			   u32 op3, u32 op4)
+	REQUIRES(cdma->lock)
 {
 	struct host1x_channel *channel =3D cdma_to_channel(cdma);
 	struct host1x *host1x =3D cdma_to_host1x(cdma);
@@ -664,6 +669,7 @@ void host1x_cdma_push_wide(struct host1x_cdma *cdma, =
u32 op1, u32 op2,
  */
 void host1x_cdma_end(struct host1x_cdma *cdma,
 		     struct host1x_job *job)
+	RELEASE(cdma->lock)
 {
 	struct host1x *host1x =3D cdma_to_host1x(cdma);
 	bool idle =3D list_empty(&cdma->sync_queue);
diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
index a6f6779662a3..5fca1b3c3672 100644
--- a/drivers/gpu/host1x/context.c
+++ b/drivers/gpu/host1x/context.c
@@ -165,6 +165,7 @@ void host1x_memory_context_get(struct host1x_memory_c=
ontext *cd)
 EXPORT_SYMBOL_GPL(host1x_memory_context_get);
=20
 void host1x_memory_context_put(struct host1x_memory_context *cd)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct host1x_memory_context_list *cdl =3D &cd->host->context_list;
=20
diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index e51b43dd15a3..253271a49c58 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -294,6 +294,7 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
 EXPORT_SYMBOL(tegra_mipi_disable);
=20
 int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
+	RELEASE(device->mipi->lock)
 {
 	struct tegra_mipi *mipi =3D device->mipi;
 	void __iomem *status_reg =3D mipi->regs + (MIPI_CAL_STATUS << 2);
@@ -312,6 +313,7 @@ int tegra_mipi_finish_calibration(struct tegra_mipi_d=
evice *device)
 EXPORT_SYMBOL(tegra_mipi_finish_calibration);
=20
 int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
+	TRY_ACQUIRE(0, device->mipi->lock)
 {
 	const struct tegra_mipi_soc *soc =3D device->mipi->soc;
 	unsigned int i;
diff --git a/drivers/hid/hid-wiimote.h b/drivers/hid/hid-wiimote.h
index 9c12f63f6dd2..066948f6ef91 100644
--- a/drivers/hid/hid-wiimote.h
+++ b/drivers/hid/hid-wiimote.h
@@ -319,11 +319,13 @@ static inline void wiimote_cmd_abort(struct wiimote=
_data *wdata)
 }
=20
 static inline int wiimote_cmd_acquire(struct wiimote_data *wdata)
+	TRY_ACQUIRE(0, wdata->state.sync)
 {
 	return mutex_lock_interruptible(&wdata->state.sync) ? -ERESTARTSYS : 0;
 }
=20
 static inline void wiimote_cmd_acquire_noint(struct wiimote_data *wdata)
+	ACQUIRE(wdata->state.sync)
 {
 	mutex_lock(&wdata->state.sync);
 }
@@ -338,6 +340,7 @@ static inline void wiimote_cmd_set(struct wiimote_dat=
a *wdata, int cmd,
 }
=20
 static inline void wiimote_cmd_release(struct wiimote_data *wdata)
+	RELEASE(wdata->state.sync)
 {
 	mutex_unlock(&wdata->state.sync);
 }
diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index fb8cd8469328..f84627d9c07b 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -229,6 +229,7 @@ static int send_modifychannel_without_ack(struct vmbu=
s_channel *channel, u32 tar
 }
=20
 static int send_modifychannel_with_ack(struct vmbus_channel *channel, u3=
2 target_vp)
+	REQUIRES(vmbus_connection.channel_mutex)
 {
 	struct vmbus_channel_modifychannel *msg;
 	struct vmbus_channel_msginfo *info;
@@ -298,6 +299,7 @@ static int send_modifychannel_with_ack(struct vmbus_c=
hannel *channel, u32 target
  * VERSION_WIN10_V4_1.
  */
 int vmbus_send_modifychannel(struct vmbus_channel *channel, u32 target_v=
p)
+	REQUIRES(vmbus_connection.channel_mutex)
 {
 	if (vmbus_proto_version >=3D VERSION_WIN10_V5_3)
 		return send_modifychannel_with_ack(channel, target_vp);
diff --git a/drivers/hwmon/abituguru.c b/drivers/hwmon/abituguru.c
index ba8c68ae4595..7949fccf4c2c 100644
--- a/drivers/hwmon/abituguru.c
+++ b/drivers/hwmon/abituguru.c
@@ -1503,6 +1503,7 @@ static struct abituguru_data *abituguru_update_devi=
ce(struct device *dev)
 }
=20
 static int abituguru_suspend(struct device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct abituguru_data *data =3D dev_get_drvdata(dev);
 	/*
@@ -1514,6 +1515,7 @@ static int abituguru_suspend(struct device *dev)
 }
=20
 static int abituguru_resume(struct device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct abituguru_data *data =3D dev_get_drvdata(dev);
 	/* See if the uGuru is still ready */
diff --git a/drivers/hwmon/abituguru3.c b/drivers/hwmon/abituguru3.c
index b70330dc2198..033a5a28b391 100644
--- a/drivers/hwmon/abituguru3.c
+++ b/drivers/hwmon/abituguru3.c
@@ -1127,6 +1127,7 @@ static struct abituguru3_data *abituguru3_update_de=
vice(struct device *dev)
 }
=20
 static int abituguru3_suspend(struct device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct abituguru3_data *data =3D dev_get_drvdata(dev);
 	/*
@@ -1138,6 +1139,7 @@ static int abituguru3_suspend(struct device *dev)
 }
=20
 static int abituguru3_resume(struct device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct abituguru3_data *data =3D dev_get_drvdata(dev);
 	mutex_unlock(&data->update_lock);
diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 8e3935089fca..281f0aef160d 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -846,6 +846,7 @@ static void it87_update_pwm_ctrl(struct it87_data *da=
ta, int nr)
 }
=20
 static int it87_lock(struct it87_data *data)
+	TRY_ACQUIRE(0, data->update_lock)
 {
 	int err;
=20
@@ -857,6 +858,7 @@ static int it87_lock(struct it87_data *data)
 }
=20
 static void it87_unlock(struct it87_data *data)
+	RELEASE(data->update_lock)
 {
 	smbus_enable(data);
 	mutex_unlock(&data->update_lock);
diff --git a/drivers/hwmon/lm78.c b/drivers/hwmon/lm78.c
index 8b53bb312069..3ede64872c38 100644
--- a/drivers/hwmon/lm78.c
+++ b/drivers/hwmon/lm78.c
@@ -570,6 +570,7 @@ static struct lm78_data *lm78_data_if_isa(void)
=20
 static int lm78_i2c_detect(struct i2c_client *client,
 			   struct i2c_board_info *info)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int i;
 	struct lm78_data *isa =3D lm78_data_if_isa();
diff --git a/drivers/hwmon/nct7904.c b/drivers/hwmon/nct7904.c
index f1e6eda949ba..33105fee353b 100644
--- a/drivers/hwmon/nct7904.c
+++ b/drivers/hwmon/nct7904.c
@@ -143,6 +143,7 @@ struct nct7904_data {
=20
 /* Access functions */
 static int nct7904_bank_lock(struct nct7904_data *data, unsigned int ban=
k)
+	ACQUIRE(data->bank_lock)
 {
 	int ret;
=20
@@ -158,6 +159,7 @@ static int nct7904_bank_lock(struct nct7904_data *dat=
a, unsigned int bank)
 }
=20
 static inline void nct7904_bank_release(struct nct7904_data *data)
+	RELEASE(data->bank_lock)
 {
 	mutex_unlock(&data->bank_lock);
 }
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
index 787683e83db6..873952c8bc88 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3840,6 +3840,7 @@ int pmbus_lock_interruptible(struct i2c_client *cli=
ent)
 EXPORT_SYMBOL_NS_GPL(pmbus_lock_interruptible, "PMBUS");
=20
 void pmbus_unlock(struct i2c_client *client)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct pmbus_data *data =3D i2c_get_clientdata(client);
=20
diff --git a/drivers/hwmon/w83781d.c b/drivers/hwmon/w83781d.c
index 076200ed2ec9..4488c9928bab 100644
--- a/drivers/hwmon/w83781d.c
+++ b/drivers/hwmon/w83781d.c
@@ -1082,6 +1082,7 @@ w83781d_create_files(struct device *dev, int kind, =
int is_isa)
 /* Return 0 if detection is successful, -ENODEV otherwise */
 static int
 w83781d_detect(struct i2c_client *client, struct i2c_board_info *info)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int val1, val2;
 	struct w83781d_data *isa =3D w83781d_data_if_isa();
diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_t=
h/msu.c
index 66123d684ac9..62ff3e269b6e 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -1589,6 +1589,7 @@ static void msc_mmap_open(struct vm_area_struct *vm=
a)
 }
=20
 static void msc_mmap_close(struct vm_area_struct *vma)
+	NO_THREAD_SAFETY_ANALYSIS /* needed because of a clang bug? */
 {
 	struct msc_iter *iter =3D vma->vm_file->private_data;
 	struct msc *msc =3D iter->msc;
diff --git a/drivers/hwtracing/stm/policy.c b/drivers/hwtracing/stm/polic=
y.c
index 42103c3a177f..84aa24b524e7 100644
--- a/drivers/hwtracing/stm/policy.c
+++ b/drivers/hwtracing/stm/policy.c
@@ -531,6 +531,7 @@ __stp_policy_node_lookup(struct stp_policy *policy, c=
har *s)
=20
 struct stp_policy_node *
 stp_policy_node_lookup(struct stm_device *stm, char *s)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking + returns a pointer */
 {
 	struct stp_policy_node *policy_node =3D NULL;
=20
@@ -550,6 +551,7 @@ stp_policy_node_lookup(struct stm_device *stm, char *=
s)
 }
=20
 void stp_policy_node_put(struct stp_policy_node *policy_node)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the above function */
 {
 	lockdep_assert_held(&stp_policy_subsys.su_mutex);
=20
diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2=
c-amd-mp2-pci.c
index 143165300949..31f96f31a211 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -17,6 +17,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
=20
 static void amd_mp2_c2p_mutex_lock(struct amd_i2c_common *i2c_common)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct amd_mp2_dev *privdata =3D i2c_common->mp2_dev;
=20
@@ -26,6 +27,7 @@ static void amd_mp2_c2p_mutex_lock(struct amd_i2c_commo=
n *i2c_common)
 }
=20
 static void amd_mp2_c2p_mutex_unlock(struct amd_i2c_common *i2c_common)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct amd_mp2_dev *privdata =3D i2c_common->mp2_dev;
=20
diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.=
c
index dc1e46d834dc..801b89004437 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1231,6 +1231,7 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
 }
=20
 static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, i=
nt num)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	bool broken_read, max_read_len, smbus_blk_read;
 	int ret, count;
diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 8fe9ddff8e96..7049b713b6a6 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -244,6 +244,7 @@ static u32 i2c_atr_functionality(struct i2c_adapter *=
adap)
 }
=20
 static void i2c_atr_lock_bus(struct i2c_adapter *adapter, unsigned int f=
lags)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct i2c_atr_chan *chan =3D adapter->algo_data;
 	struct i2c_atr *atr =3D chan->atr;
@@ -252,6 +253,7 @@ static void i2c_atr_lock_bus(struct i2c_adapter *adap=
ter, unsigned int flags)
 }
=20
 static int i2c_atr_trylock_bus(struct i2c_adapter *adapter, unsigned int=
 flags)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct i2c_atr_chan *chan =3D adapter->algo_data;
 	struct i2c_atr *atr =3D chan->atr;
@@ -260,6 +262,7 @@ static int i2c_atr_trylock_bus(struct i2c_adapter *ad=
apter, unsigned int flags)
 }
=20
 static void i2c_atr_unlock_bus(struct i2c_adapter *adapter, unsigned int=
 flags)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct i2c_atr_chan *chan =3D adapter->algo_data;
 	struct i2c_atr *atr =3D chan->atr;
diff --git a/drivers/iio/accel/kionix-kx022a.c b/drivers/iio/accel/kionix=
-kx022a.c
index 5aeb3b951ac5..aaeb080e8ea1 100644
--- a/drivers/iio/accel/kionix-kx022a.c
+++ b/drivers/iio/accel/kionix-kx022a.c
@@ -475,6 +475,7 @@ static int __kx022a_turn_on_off(struct kx022a_data *d=
ata, bool on)
 }
=20
 static int kx022a_turn_off_lock(struct kx022a_data *data)
+	TRY_ACQUIRE(0, data->mutex)
 {
 	int ret;
=20
@@ -487,6 +488,7 @@ static int kx022a_turn_off_lock(struct kx022a_data *d=
ata)
 }
=20
 static int kx022a_turn_on_unlock(struct kx022a_data *data)
+	RELEASE(data->mutex)
 {
 	int ret;
=20
@@ -1302,6 +1304,7 @@ const struct kx022a_chip_info kx134acr_chip_info =3D=
 {
 EXPORT_SYMBOL_NS_GPL(kx134acr_chip_info, "IIO_KX022A");
=20
 int kx022a_probe_internal(struct device *dev, const struct kx022a_chip_i=
nfo *chip_info)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	static const char * const regulator_names[] =3D {"io-vdd", "vdd"};
 	struct iio_trigger *indio_trig;
diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_sarad=
c.c
index 997def4a4d2f..83880f251199 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -572,6 +572,7 @@ static void meson_sar_adc_stop_sample_engine(struct i=
io_dev *indio_dev)
 }
=20
 static int meson_sar_adc_lock(struct iio_dev *indio_dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct meson_sar_adc_priv *priv =3D iio_priv(indio_dev);
 	int val, ret;
@@ -602,6 +603,7 @@ static int meson_sar_adc_lock(struct iio_dev *indio_d=
ev)
 }
=20
 static void meson_sar_adc_unlock(struct iio_dev *indio_dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct meson_sar_adc_priv *priv =3D iio_priv(indio_dev);
=20
diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/b=
uffer/industrialio-buffer-dma.c
index 7ea784304ffb..36220093595c 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -787,6 +787,7 @@ int iio_dma_buffer_enqueue_dmabuf(struct iio_buffer *=
buffer,
 EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_enqueue_dmabuf, "IIO_DMA_BUFFER");
=20
 void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct iio_dma_buffer_queue *queue =3D iio_buffer_to_queue(buffer);
=20
@@ -795,6 +796,7 @@ void iio_dma_buffer_lock_queue(struct iio_buffer *buf=
fer)
 EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_lock_queue, "IIO_DMA_BUFFER");
=20
 void iio_dma_buffer_unlock_queue(struct iio_buffer *buffer)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct iio_dma_buffer_queue *queue =3D iio_buffer_to_queue(buffer);
=20
diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-c=
ore.c
index a2117ad1337d..422a73f74a6b 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -2154,6 +2154,7 @@ EXPORT_SYMBOL_GPL(__devm_iio_device_register);
  * Returns: 0 on success, -EBUSY on failure.
  */
 int iio_device_claim_direct_mode(struct iio_dev *indio_dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct iio_dev_opaque *iio_dev_opaque =3D to_iio_dev_opaque(indio_dev);
=20
@@ -2177,6 +2178,7 @@ EXPORT_SYMBOL_GPL(iio_device_claim_direct_mode);
  * Use with iio_device_claim_direct_mode()
  */
 void iio_device_release_direct_mode(struct iio_dev *indio_dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
@@ -2194,6 +2196,7 @@ EXPORT_SYMBOL_GPL(iio_device_release_direct_mode);
  * Returns: 0 on success, -EBUSY on failure.
  */
 int iio_device_claim_buffer_mode(struct iio_dev *indio_dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct iio_dev_opaque *iio_dev_opaque =3D to_iio_dev_opaque(indio_dev);
=20
@@ -2217,6 +2220,7 @@ EXPORT_SYMBOL_GPL(iio_device_claim_buffer_mode);
  * Use with iio_device_claim_buffer_mode().
  */
 void iio_device_release_buffer_mode(struct iio_dev *indio_dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
diff --git a/drivers/iio/light/opt3001.c b/drivers/iio/light/opt3001.c
index 65b295877b41..c75ef93ef5ba 100644
--- a/drivers/iio/light/opt3001.c
+++ b/drivers/iio/light/opt3001.c
@@ -782,6 +782,7 @@ static int opt3001_configure(struct opt3001 *opt)
 }
=20
 static irqreturn_t opt3001_irq(int irq, void *_iio)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct iio_dev *iio =3D _iio;
 	struct opt3001 *opt =3D iio_priv(iio);
diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.=
c
index 91db10515d74..913cb9a99b22 100644
--- a/drivers/infiniband/core/cma.c
+++ b/drivers/infiniband/core/cma.c
@@ -1921,6 +1921,7 @@ static void cma_cancel_route(struct rdma_id_private=
 *id_priv)
 }
=20
 static void _cma_cancel_listens(struct rdma_id_private *id_priv)
+	REQUIRES(lock)
 {
 	struct rdma_id_private *dev_id_priv;
=20
@@ -2084,6 +2085,7 @@ static void _destroy_id(struct rdma_id_private *id_=
priv,
  */
 static void destroy_id_handler_unlock(struct rdma_id_private *id_priv)
 	__releases(&idprv->handler_mutex)
+	RELEASE(id_priv->handler_mutex)
 {
 	enum rdma_cm_state state;
 	unsigned long flags;
@@ -2106,6 +2108,7 @@ static void destroy_id_handler_unlock(struct rdma_i=
d_private *id_priv)
 }
=20
 void rdma_destroy_id(struct rdma_cm_id *id)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct rdma_id_private *id_priv =3D
 		container_of(id, struct rdma_id_private, id);
@@ -4708,6 +4711,7 @@ int rdma_accept_ece(struct rdma_cm_id *id, struct r=
dma_conn_param *conn_param,
 EXPORT_SYMBOL(rdma_accept_ece);
=20
 void rdma_lock_handler(struct rdma_cm_id *id)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct rdma_id_private *id_priv =3D
 		container_of(id, struct rdma_id_private, id);
@@ -4717,6 +4721,7 @@ void rdma_lock_handler(struct rdma_cm_id *id)
 EXPORT_SYMBOL(rdma_lock_handler);
=20
 void rdma_unlock_handler(struct rdma_cm_id *id)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct rdma_id_private *id_priv =3D
 		container_of(id, struct rdma_id_private, id);
diff --git a/drivers/infiniband/core/security.c b/drivers/infiniband/core=
/security.c
index 3512c2e54efc..f8e3240555e5 100644
--- a/drivers/infiniband/core/security.c
+++ b/drivers/infiniband/core/security.c
@@ -572,6 +572,7 @@ int ib_security_modify_qp(struct ib_qp *qp,
 			  struct ib_qp_attr *qp_attr,
 			  int qp_attr_mask,
 			  struct ib_udata *udata)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret =3D 0;
 	struct ib_ports_pkeys *tmp_pps;
diff --git a/drivers/infiniband/core/umem_odp.c b/drivers/infiniband/core=
/umem_odp.c
index e9fa22d31c23..bd7af14e4570 100644
--- a/drivers/infiniband/core/umem_odp.c
+++ b/drivers/infiniband/core/umem_odp.c
@@ -346,6 +346,7 @@ static int ib_umem_odp_map_dma_single_page(
 int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_=
virt,
 				 u64 bcnt, u64 access_mask, bool fault)
 			__acquires(&umem_odp->umem_mutex)
+	TRY_ACQUIRE(0, umem_odp->umem_mutex)
 {
 	struct task_struct *owning_process  =3D NULL;
 	struct mm_struct *owning_mm =3D umem_odp->umem.owning_mm;
diff --git a/drivers/infiniband/hw/hns/hns_roce_hem.c b/drivers/infiniban=
d/hw/hns/hns_roce_hem.c
index 605562122ecc..2d8eed3c8fc5 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hem.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hem.c
@@ -628,6 +628,7 @@ static void hns_roce_table_mhop_put(struct hns_roce_d=
ev *hr_dev,
 				    struct hns_roce_hem_table *table,
 				    unsigned long obj,
 				    int check_refcount)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct hns_roce_hem_index index =3D {};
 	struct hns_roce_hem_mhop mhop =3D {};
@@ -654,6 +655,7 @@ static void hns_roce_table_mhop_put(struct hns_roce_d=
ev *hr_dev,
=20
 void hns_roce_table_put(struct hns_roce_dev *hr_dev,
 			struct hns_roce_hem_table *table, unsigned long obj)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct device *dev =3D hr_dev->dev;
 	unsigned long i;
diff --git a/drivers/infiniband/hw/mlx4/main.c b/drivers/infiniband/hw/ml=
x4/main.c
index dd35e03402ab..b22e5907507e 100644
--- a/drivers/infiniband/hw/mlx4/main.c
+++ b/drivers/infiniband/hw/mlx4/main.c
@@ -1058,6 +1058,7 @@ static int mlx4_ib_SET_PORT(struct mlx4_ib_dev *dev=
, u32 port,
=20
 static int mlx4_ib_modify_port(struct ib_device *ibdev, u32 port, int ma=
sk,
 			       struct ib_port_modify *props)
+	NO_THREAD_SAFETY_ANALYSIS /* alias analysis */
 {
 	struct mlx4_ib_dev *mdev =3D to_mdev(ibdev);
 	u8 is_eth =3D mdev->dev->caps.port_type[port] =3D=3D MLX4_PORT_TYPE_ETH=
;
@@ -2274,6 +2275,7 @@ static void mlx4_ib_diag_cleanup(struct mlx4_ib_dev=
 *ibdev)
 static void mlx4_ib_update_qps(struct mlx4_ib_dev *ibdev,
 			       struct net_device *dev,
 			       int port)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	u64 new_smac =3D 0;
 	u64 release_mac =3D MLX4_IB_INVALID_MAC;
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5=
/mr.c
index bb02b6adbf2c..45f9183dc4b0 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -2018,6 +2018,7 @@ void mlx5_ib_revoke_data_direct_mrs(struct mlx5_ib_=
dev *dev)
 }
=20
 static int mlx5_revoke_mr(struct mlx5_ib_mr *mr)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct mlx5_ib_dev *dev =3D to_mdev(mr->ibmr.device);
 	struct mlx5_cache_ent *ent =3D mr->mmkey.cache_ent;
diff --git a/drivers/infiniband/hw/mlx5/odp.c b/drivers/infiniband/hw/mlx=
5/odp.c
index f1e23583e6c0..582a0450350f 100644
--- a/drivers/infiniband/hw/mlx5/odp.c
+++ b/drivers/infiniband/hw/mlx5/odp.c
@@ -681,6 +681,7 @@ void mlx5_ib_free_odp_mr(struct mlx5_ib_mr *mr)
 static int pagefault_real_mr(struct mlx5_ib_mr *mr, struct ib_umem_odp *=
odp,
 			     u64 user_va, size_t bcnt, u32 *bytes_mapped,
 			     u32 flags)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	int page_shift, ret, np;
 	bool downgrade =3D flags & MLX5_PF_FLAGS_DOWNGRADE;
diff --git a/drivers/infiniband/hw/mlx5/umr.c b/drivers/infiniband/hw/mlx=
5/umr.c
index 887fd6fa3ba9..ee7bcb147c83 100644
--- a/drivers/infiniband/hw/mlx5/umr.c
+++ b/drivers/infiniband/hw/mlx5/umr.c
@@ -462,6 +462,7 @@ int mlx5r_umr_rereg_pd_access(struct mlx5_ib_mr *mr, =
struct ib_pd *pd,
  * allocation failure is not allowed, so try smaller sizes.
  */
 static void *mlx5r_umr_alloc_xlt(size_t *nents, size_t ent_size, gfp_t g=
fp_mask)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking + returns a pointer */
 {
 	const size_t xlt_chunk_align =3D MLX5_UMR_FLEX_ALIGNMENT / ent_size;
 	size_t size;
@@ -510,6 +511,7 @@ static void *mlx5r_umr_alloc_xlt(size_t *nents, size_=
t ent_size, gfp_t gfp_mask)
 }
=20
 static void mlx5r_umr_free_xlt(void *xlt, size_t length)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	if (xlt =3D=3D xlt_emergency_page) {
 		mutex_unlock(&xlt_emergency_page_mutex);
diff --git a/drivers/input/input.c b/drivers/input/input.c
index c9e3ac64bcd0..36f1a6f2f372 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -1066,6 +1066,7 @@ static __poll_t input_proc_devices_poll(struct file=
 *file, poll_table *wait)
 }
=20
 static void *input_devices_seq_start(struct seq_file *seq, loff_t *pos)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking + returns a pointer */
 {
 	struct input_seq_state *state =3D seq->private;
 	int error;
@@ -1087,6 +1088,7 @@ static void *input_devices_seq_next(struct seq_file=
 *seq, void *v, loff_t *pos)
 }
=20
 static void input_seq_stop(struct seq_file *seq, void *v)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	struct input_seq_state *state =3D seq->private;
=20
@@ -1187,6 +1189,7 @@ static const struct proc_ops input_devices_proc_ops=
 =3D {
 };
=20
 static void *input_handlers_seq_start(struct seq_file *seq, loff_t *pos)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking + returns a pointer */
 {
 	struct input_seq_state *state =3D seq->private;
 	int error;
diff --git a/drivers/input/joystick/pxrc.c b/drivers/input/joystick/pxrc.=
c
index 52d9eab667b7..4ec4cb9ef87e 100644
--- a/drivers/input/joystick/pxrc.c
+++ b/drivers/input/joystick/pxrc.c
@@ -224,6 +224,7 @@ static int pxrc_resume(struct usb_interface *intf)
 }
=20
 static int pxrc_pre_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct pxrc *pxrc =3D usb_get_intfdata(intf);
=20
@@ -233,6 +234,7 @@ static int pxrc_pre_reset(struct usb_interface *intf)
 }
=20
 static int pxrc_post_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct pxrc *pxrc =3D usb_get_intfdata(intf);
 	int retval =3D 0;
diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboa=
rd/adp5588-keys.c
index dc734974ce06..4f05e0d2e9e0 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -342,6 +342,7 @@ static int adp5588_build_gpiomap(struct adp5588_kpad =
*kpad)
 }
=20
 static void adp5588_irq_bus_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct adp5588_kpad *kpad =3D gpiochip_get_data(gc);
@@ -350,6 +351,7 @@ static void adp5588_irq_bus_lock(struct irq_data *d)
 }
=20
 static void adp5588_irq_bus_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct adp5588_kpad *kpad =3D gpiochip_get_data(gc);
diff --git a/drivers/input/misc/ati_remote2.c b/drivers/input/misc/ati_re=
mote2.c
index e84649af801d..f4d045d92746 100644
--- a/drivers/input/misc/ati_remote2.c
+++ b/drivers/input/misc/ati_remote2.c
@@ -943,6 +943,7 @@ static int ati_remote2_reset_resume(struct usb_interf=
ace *interface)
 }
=20
 static int ati_remote2_pre_reset(struct usb_interface *interface)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct ati_remote2 *ar2;
 	struct usb_host_interface *alt =3D interface->cur_altsetting;
@@ -963,6 +964,7 @@ static int ati_remote2_pre_reset(struct usb_interface=
 *interface)
 }
=20
 static int ati_remote2_post_reset(struct usb_interface *interface)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	struct ati_remote2 *ar2;
 	struct usb_host_interface *alt =3D interface->cur_altsetting;
diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
index 0cfe5d4a573c..5084e6747612 100644
--- a/drivers/input/misc/cm109.c
+++ b/drivers/input/misc/cm109.c
@@ -835,6 +835,7 @@ static int cm109_usb_resume(struct usb_interface *int=
f)
 }
=20
 static int cm109_usb_pre_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct cm109_dev *dev =3D usb_get_intfdata(intf);
=20
@@ -853,6 +854,7 @@ static int cm109_usb_pre_reset(struct usb_interface *=
intf)
 }
=20
 static int cm109_usb_post_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct cm109_dev *dev =3D usb_get_intfdata(intf);
=20
diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psm=
ouse-base.c
index a2c9f7144864..9d29f2f83161 100644
--- a/drivers/input/mouse/psmouse-base.c
+++ b/drivers/input/mouse/psmouse-base.c
@@ -1880,6 +1880,7 @@ static ssize_t psmouse_attr_show_protocol(struct ps=
mouse *psmouse, void *data, c
 }
=20
 static ssize_t psmouse_attr_set_protocol(struct psmouse *psmouse, void *=
data, const char *buf, size_t count)
+	REQUIRES(&psmouse_mutex)
 {
 	struct serio *serio =3D psmouse->ps2dev.serio;
 	struct psmouse *parent =3D NULL;
diff --git a/drivers/input/mouse/synaptics_usb.c b/drivers/input/mouse/sy=
naptics_usb.c
index 75e45f3ae675..9b748e54286e 100644
--- a/drivers/input/mouse/synaptics_usb.c
+++ b/drivers/input/mouse/synaptics_usb.c
@@ -499,6 +499,7 @@ static int synusb_resume(struct usb_interface *intf)
 }
=20
 static int synusb_pre_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct synusb *synusb =3D usb_get_intfdata(intf);
=20
@@ -509,6 +510,7 @@ static int synusb_pre_reset(struct usb_interface *int=
f)
 }
=20
 static int synusb_post_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct synusb *synusb =3D usb_get_intfdata(intf);
 	int retval =3D 0;
diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index cab5a4c5baf5..24cb643f0bdf 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -183,12 +183,14 @@ static i8042_filter_t i8042_platform_filter;
 static void *i8042_platform_filter_context;
=20
 void i8042_lock_chip(void)
+	ACQUIRE(i8042_mutex)
 {
 	mutex_lock(&i8042_mutex);
 }
 EXPORT_SYMBOL(i8042_lock_chip);
=20
 void i8042_unlock_chip(void)
+	RELEASE(i8042_mutex)
 {
 	mutex_unlock(&i8042_mutex);
 }
diff --git a/drivers/input/serio/libps2.c b/drivers/input/serio/libps2.c
index c22ea532276e..3a92bef2ba3b 100644
--- a/drivers/input/serio/libps2.c
+++ b/drivers/input/serio/libps2.c
@@ -125,6 +125,7 @@ EXPORT_SYMBOL(ps2_sendbyte);
  * ps2_end_command() should be called.
  */
 void ps2_begin_command(struct ps2dev *ps2dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mutex *m =3D ps2dev->serio->ps2_cmd_mutex ?: &ps2dev->cmd_mutex;
=20
@@ -137,6 +138,7 @@ EXPORT_SYMBOL(ps2_begin_command);
  * @ps2dev: a PS/2 device executing the command
  */
 void ps2_end_command(struct ps2dev *ps2dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mutex *m =3D ps2dev->serio->ps2_cmd_mutex ?: &ps2dev->cmd_mutex;
=20
diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/devic=
e.c
index dfd0898fb6c1..da5325a60508 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -740,6 +740,7 @@ EXPORT_SYMBOL_NS_GPL(iommufd_device_detach, "IOMMUFD"=
);
  */
 static int iommufd_access_change_ioas(struct iommufd_access *access,
 				      struct iommufd_ioas *new_ioas)
+	REQUIRES(access->ioas_lock)
 {
 	u32 iopt_access_list_id =3D access->iopt_access_list_id;
 	struct iommufd_ioas *cur_ioas =3D access->ioas;
@@ -786,6 +787,7 @@ static int iommufd_access_change_ioas(struct iommufd_=
access *access,
 }
=20
 static int iommufd_access_change_ioas_id(struct iommufd_access *access, =
u32 id)
+	REQUIRES(access->ioas_lock)
 {
 	struct iommufd_ioas *ioas =3D iommufd_get_ioas(access->ictx, id);
 	int rc;
diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd=
/hw_pagetable.c
index 598be26a14e2..71d1f5984166 100644
--- a/drivers/iommu/iommufd/hw_pagetable.c
+++ b/drivers/iommu/iommufd/hw_pagetable.c
@@ -320,6 +320,7 @@ iommufd_viommu_alloc_hwpt_nested(struct iommufd_viomm=
u *viommu, u32 flags,
 }
=20
 int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct iommu_hwpt_alloc *cmd =3D ucmd->cmd;
 	const struct iommu_user_data user_data =3D {
diff --git a/drivers/md/bcache/alloc.c b/drivers/md/bcache/alloc.c
index 8998e61efa40..bd2d18deeaee 100644
--- a/drivers/md/bcache/alloc.c
+++ b/drivers/md/bcache/alloc.c
@@ -410,6 +410,7 @@ static int bch_allocator_thread(void *arg)
 /* Allocation */
=20
 long bch_bucket_alloc(struct cache *ca, unsigned int reserve, bool wait)
+	REQUIRES(ca->set->bucket_lock)
 {
 	DEFINE_WAIT(w);
 	struct bucket *b;
@@ -507,6 +508,7 @@ void bch_bucket_free(struct cache_set *c, struct bkey=
 *k)
=20
 int __bch_bucket_alloc_set(struct cache_set *c, unsigned int reserve,
 			   struct bkey *k, bool wait)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct cache *ca;
 	long b;
diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
index ed40d8600656..d434539a71f0 100644
--- a/drivers/md/bcache/btree.c
+++ b/drivers/md/bcache/btree.c
@@ -1362,6 +1362,7 @@ static int bch_btree_insert_node(struct btree *b, s=
truct btree_op *op,
=20
 static int btree_gc_coalesce(struct btree *b, struct btree_op *op,
 			     struct gc_stat *gc, struct gc_merge_info *r)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	unsigned int i, nodes =3D 0, keys =3D 0, blocks;
 	struct btree *new_nodes[GC_MERGE_NODES];
diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index e42f1400cea9..7f7e72ac8827 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -608,6 +608,7 @@ static void prio_io(struct cache *ca, uint64_t bucket=
, blk_opf_t opf)
 }
=20
 int bch_prio_write(struct cache *ca, bool wait)
+	REQUIRES(ca->set->bucket_lock)
 {
 	int i;
 	struct bucket *b;
@@ -1962,6 +1963,7 @@ struct cache_set *bch_cache_set_alloc(struct cache_=
sb *sb)
 }
=20
 static int run_cache_set(struct cache_set *c)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	const char *err =3D "cannot allocate memory";
 	struct cached_dev *dc, *t;
diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index aab8240429b0..1d1794fbe957 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -1020,6 +1020,7 @@ struct dm_bufio_client {
 #define dm_bufio_in_request()	(!!current->bio_list)
=20
 static void dm_bufio_lock(struct dm_bufio_client *c)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (static_branch_unlikely(&no_sleep_enabled) && c->no_sleep)
 		spin_lock_bh(&c->spinlock);
@@ -1028,6 +1029,7 @@ static void dm_bufio_lock(struct dm_bufio_client *c=
)
 }
=20
 static void dm_bufio_unlock(struct dm_bufio_client *c)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (static_branch_unlikely(&no_sleep_enabled) && c->no_sleep)
 		spin_unlock_bh(&c->spinlock);
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 02a2919f4e5a..9c6addf42bb8 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1703,6 +1703,7 @@ static void crypt_free_buffer_pages(struct crypt_co=
nfig *cc, struct bio *clone);
  * the first pass. If they are not available, we fall back to the mempoo=
l.
  */
 static struct bio *crypt_alloc_buffer(struct dm_crypt_io *io, unsigned i=
nt size)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct crypt_config *cc =3D io->cc;
 	struct bio *clone;
diff --git a/drivers/md/dm-vdo/indexer/index-session.c b/drivers/md/dm-vd=
o/indexer/index-session.c
index aee0914d604a..d689ea1a097c 100644
--- a/drivers/md/dm-vdo/indexer/index-session.c
+++ b/drivers/md/dm-vdo/indexer/index-session.c
@@ -728,6 +728,7 @@ int uds_get_index_session_stats(struct uds_index_sess=
ion *index_session,
 }
=20
 void uds_wait_cond(struct cond_var *cv, struct mutex *mutex)
+	REQUIRES(*mutex)
 {
 	DEFINE_WAIT(__wait);
=20
diff --git a/drivers/md/dm-vdo/indexer/volume-index.c b/drivers/md/dm-vdo=
/indexer/volume-index.c
index 12f954a0c532..c0ec47645510 100644
--- a/drivers/md/dm-vdo/indexer/volume-index.c
+++ b/drivers/md/dm-vdo/indexer/volume-index.c
@@ -559,6 +559,7 @@ int uds_get_volume_index_record(struct volume_index *=
volume_index,
 }
=20
 int uds_put_volume_index_record(struct volume_index_record *record, u64 =
virtual_chapter)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int result;
 	u32 address;
@@ -602,6 +603,7 @@ int uds_put_volume_index_record(struct volume_index_r=
ecord *record, u64 virtual_
 }
=20
 int uds_remove_volume_index_record(struct volume_index_record *record)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int result;
=20
@@ -708,6 +710,7 @@ void uds_set_volume_index_open_chapter(struct volume_=
index *volume_index,
=20
 int uds_set_volume_index_record_chapter(struct volume_index_record *reco=
rd,
 					u64 virtual_chapter)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	const struct volume_sub_index *sub_index =3D record->sub_index;
 	int result;
diff --git a/drivers/md/dm-vdo/indexer/volume.c b/drivers/md/dm-vdo/index=
er/volume.c
index 655453bb276b..be2344de7595 100644
--- a/drivers/md/dm-vdo/indexer/volume.c
+++ b/drivers/md/dm-vdo/indexer/volume.c
@@ -539,6 +539,7 @@ static int search_page(struct cached_page *page, cons=
t struct volume *volume,
 }
=20
 static int process_entry(struct volume *volume, struct queued_read *entr=
y)
+	REQUIRES(volume->read_threads_mutex)
 {
 	u32 page_number =3D entry->physical_page;
 	struct uds_request *request;
diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 7ce8847b3404..b1634602cfb1 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -241,11 +241,13 @@ DECLARE_DM_KCOPYD_THROTTLE_WITH_MODULE_PARM(dm_writ=
ecache_throttle,
 					    "A percentage of time allocated for data copying");
=20
 static void wc_lock(struct dm_writecache *wc)
+	ACQUIRE(wc->lock)
 {
 	mutex_lock(&wc->lock);
 }
=20
 static void wc_unlock(struct dm_writecache *wc)
+	RELEASE(wc->lock)
 {
 	mutex_unlock(&wc->lock);
 }
@@ -757,6 +759,7 @@ static void writecache_free_entry(struct dm_writecach=
e *wc, struct wc_entry *e)
 }
=20
 static void writecache_wait_on_freelist(struct dm_writecache *wc)
+	REQUIRES(wc->lock)
 {
 	DEFINE_WAIT(wait);
=20
@@ -914,6 +917,7 @@ static void writecache_discard(struct dm_writecache *=
wc, sector_t start, sector_
 }
=20
 static bool writecache_wait_for_writeback(struct dm_writecache *wc)
+	REQUIRES(wc->lock)
 {
 	if (wc->writeback_size) {
 		writecache_wait_on_freelist(wc);
@@ -1434,6 +1438,7 @@ static void writecache_bio_copy_ssd(struct dm_write=
cache *wc, struct bio *bio,
 }
=20
 static enum wc_map_op writecache_map_write(struct dm_writecache *wc, str=
uct bio *bio)
+	REQUIRES(wc->lock)
 {
 	struct wc_entry *e;
=20
@@ -1680,6 +1685,7 @@ static void writecache_copy_endio(int read_err, uns=
igned long write_err, void *p
 }
=20
 static void __writecache_endio_pmem(struct dm_writecache *wc, struct lis=
t_head *list)
+	REQUIRES(wc->lock)
 {
 	unsigned int i;
 	struct writeback_struct *wb;
diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadat=
a.c
index deff22ecccbb..7233461dd6aa 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -354,11 +354,13 @@ bool dmz_dev_is_dying(struct dmz_metadata *zmd)
  * The map lock also protects all the zone lists.
  */
 void dmz_lock_map(struct dmz_metadata *zmd)
+	ACQUIRE(zmd->map_lock)
 {
 	mutex_lock(&zmd->map_lock);
 }
=20
 void dmz_unlock_map(struct dmz_metadata *zmd)
+	RELEASE(zmd->map_lock)
 {
 	mutex_unlock(&zmd->map_lock);
 }
@@ -386,11 +388,13 @@ void dmz_unlock_metadata(struct dmz_metadata *zmd)
  * while flush is being executed.
  */
 void dmz_lock_flush(struct dmz_metadata *zmd)
+	ACQUIRE(zmd->mblk_flush_lock)
 {
 	mutex_lock(&zmd->mblk_flush_lock);
 }
=20
 void dmz_unlock_flush(struct dmz_metadata *zmd)
+	RELEASE(zmd->mblk_flush_lock)
 {
 	mutex_unlock(&zmd->mblk_flush_lock);
 }
@@ -1875,6 +1879,7 @@ static void dmz_lru_zone(struct dmz_metadata *zmd, =
struct dm_zone *zone)
  * Wait for any zone to be freed.
  */
 static void dmz_wait_for_free_zones(struct dmz_metadata *zmd)
+	REQUIRES(zmd->map_lock)
 {
 	DEFINE_WAIT(wait);
=20
@@ -1920,6 +1925,7 @@ void dmz_unlock_zone_reclaim(struct dm_zone *zone)
  * Wait for a zone reclaim to complete.
  */
 static void dmz_wait_for_reclaim(struct dmz_metadata *zmd, struct dm_zon=
e *zone)
+	REQUIRES(zmd->map_lock)
 {
 	dmz_unlock_map(zmd);
 	dmz_unlock_metadata(zmd);
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 4d1e42891d24..25b79dfe93ba 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1480,6 +1480,7 @@ static void setup_split_accounting(struct clone_inf=
o *ci, unsigned int len)
 static void alloc_multiple_bios(struct bio_list *blist, struct clone_inf=
o *ci,
 				struct dm_target *ti, unsigned int num_bios,
 				unsigned *len)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct bio *bio;
 	int try;
@@ -2519,11 +2520,13 @@ int dm_create(int minor, struct mapped_device **r=
esult)
  * All are required to hold md->type_lock.
  */
 void dm_lock_md_type(struct mapped_device *md)
+	ACQUIRE(md->type_lock)
 {
 	mutex_lock(&md->type_lock);
 }
=20
 void dm_unlock_md_type(struct mapped_device *md)
+	RELEASE(md->type_lock)
 {
 	mutex_unlock(&md->type_lock);
 }
@@ -3192,6 +3195,7 @@ EXPORT_SYMBOL_GPL(dm_internal_resume);
  */
=20
 void dm_internal_suspend_fast(struct mapped_device *md)
+	ACQUIRE(md->suspend_lock)
 {
 	mutex_lock(&md->suspend_lock);
 	if (dm_suspended_md(md) || dm_suspended_internally_md(md))
@@ -3205,6 +3209,7 @@ void dm_internal_suspend_fast(struct mapped_device =
*md)
 EXPORT_SYMBOL_GPL(dm_internal_suspend_fast);
=20
 void dm_internal_resume_fast(struct mapped_device *md)
+	RELEASE(md->suspend_lock)
 {
 	if (dm_suspended_md(md) || dm_suspended_internally_md(md))
 		goto done;
diff --git a/drivers/md/md-cluster.c b/drivers/md/md-cluster.c
index 6595f89becdb..651c66388e96 100644
--- a/drivers/md/md-cluster.c
+++ b/drivers/md/md-cluster.c
@@ -541,6 +541,7 @@ static int process_add_new_disk(struct mddev *mddev, =
struct cluster_msg *cmsg)
=20
=20
 static void process_metadata_update(struct mddev *mddev, struct cluster_=
msg *msg)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int got_lock =3D 0;
 	struct md_thread *thread;
@@ -690,6 +691,7 @@ static void recv_daemon(struct md_thread *thread)
  * node can communicate while the operation is underway.
  */
 static int lock_token(struct md_cluster_info *cinfo)
+	TRY_ACQUIRE(0, cinfo->recv_mutex)
 {
 	int error;
=20
@@ -708,6 +710,7 @@ static int lock_token(struct md_cluster_info *cinfo)
  * Sets the MD_CLUSTER_SEND_LOCK bit to lock the send channel.
  */
 static int lock_comm(struct md_cluster_info *cinfo, bool mddev_locked)
+	TRY_ACQUIRE(0, cinfo->recv_mutex)
 {
 	int rv, set_bit =3D 0;
 	struct mddev *mddev =3D cinfo->mddev;
@@ -736,6 +739,7 @@ static int lock_comm(struct md_cluster_info *cinfo, b=
ool mddev_locked)
 }
=20
 static void unlock_comm(struct md_cluster_info *cinfo)
+	RELEASE(cinfo->recv_mutex)
 {
 	WARN_ON(cinfo->token_lockres->mode !=3D DLM_LOCK_EX);
 	mutex_unlock(&cinfo->recv_mutex);
@@ -1094,6 +1098,7 @@ static int metadata_update_start(struct mddev *mdde=
v)
 }
=20
 static int metadata_update_finish(struct mddev *mddev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	struct md_cluster_info *cinfo =3D mddev->cluster_info;
 	struct cluster_msg cmsg;
@@ -1121,10 +1126,11 @@ static int metadata_update_finish(struct mddev *m=
ddev)
 }
=20
 static void metadata_update_cancel(struct mddev *mddev)
+	RELEASE(mddev->cluster_info->recv_mutex)
 {
 	struct md_cluster_info *cinfo =3D mddev->cluster_info;
 	clear_bit(MD_CLUSTER_SEND_LOCKED_ALREADY, &cinfo->state);
-	unlock_comm(cinfo);
+	unlock_comm(mddev->cluster_info);
 }
=20
 static int update_bitmap_size(struct mddev *mddev, sector_t size)
@@ -1454,6 +1460,7 @@ static int area_resyncing(struct mddev *mddev, int =
direction,
  * add_new_disk_cancel() must be called to release token lock
  */
 static int add_new_disk(struct mddev *mddev, struct md_rdev *rdev)
+	TRY_ACQUIRE(0, mddev->cluster_info->recv_mutex)
 {
 	struct md_cluster_info *cinfo =3D mddev->cluster_info;
 	struct cluster_msg cmsg;
@@ -1501,10 +1508,11 @@ static int add_new_disk(struct mddev *mddev, stru=
ct md_rdev *rdev)
 }
=20
 static void add_new_disk_cancel(struct mddev *mddev)
+	RELEASE(mddev->cluster_info->recv_mutex)
 {
 	struct md_cluster_info *cinfo =3D mddev->cluster_info;
 	clear_bit(MD_CLUSTER_SEND_LOCKED_ALREADY, &cinfo->state);
-	unlock_comm(cinfo);
+	unlock_comm(mddev->cluster_info);
 }
=20
 static int new_disk_ack(struct mddev *mddev, bool ack)
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 30b3dbbce2d2..29179f257312 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -446,6 +446,7 @@ static void md_submit_bio(struct bio *bio)
  * have been submitted are completely handled.
  */
 int mddev_suspend(struct mddev *mddev, bool interruptible)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	int err =3D 0;
=20
@@ -3561,6 +3562,7 @@ rdev_attr_show(struct kobject *kobj, struct attribu=
te *attr, char *page)
 static ssize_t
 rdev_attr_store(struct kobject *kobj, struct attribute *attr,
 	      const char *page, size_t length)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct rdev_sysfs_entry *entry =3D container_of(attr, struct rdev_sysfs=
_entry, attr);
 	struct md_rdev *rdev =3D container_of(kobj, struct md_rdev, kobj);
@@ -4877,6 +4879,7 @@ action_show(struct mddev *mddev, char *page)
  *		function return.
  */
 static void stop_sync_thread(struct mddev *mddev, bool locked)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int sync_seq =3D atomic_read(&mddev->sync_seq);
=20
@@ -4907,6 +4910,7 @@ static void stop_sync_thread(struct mddev *mddev, b=
ool locked)
 }
=20
 void md_idle_sync_thread(struct mddev *mddev)
+	REQUIRES(mddev->reconfig_mutex)
 {
 	lockdep_assert_held(&mddev->reconfig_mutex);
=20
@@ -4916,6 +4920,7 @@ void md_idle_sync_thread(struct mddev *mddev)
 EXPORT_SYMBOL_GPL(md_idle_sync_thread);
=20
 void md_frozen_sync_thread(struct mddev *mddev)
+	REQUIRES(mddev->reconfig_mutex)
 {
 	lockdep_assert_held(&mddev->reconfig_mutex);
=20
@@ -4925,6 +4930,7 @@ void md_frozen_sync_thread(struct mddev *mddev)
 EXPORT_SYMBOL_GPL(md_frozen_sync_thread);
=20
 void md_unfrozen_sync_thread(struct mddev *mddev)
+	REQUIRES(mddev->reconfig_mutex)
 {
 	lockdep_assert_held(&mddev->reconfig_mutex);
=20
@@ -6490,6 +6496,7 @@ EXPORT_SYMBOL_GPL(md_stop);
=20
 /* ensure 'mddev->pers' exist before calling md_set_readonly() */
 static int md_set_readonly(struct mddev *mddev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int err =3D 0;
 	int did_freeze =3D 0;
@@ -7685,6 +7692,7 @@ static int __md_set_array_info(struct mddev *mddev,=
 void __user *argp)
=20
 static int md_ioctl(struct block_device *bdev, blk_mode_t mode,
 			unsigned int cmd, unsigned long arg)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	int err =3D 0;
 	void __user *argp =3D (void __user *)arg;
diff --git a/drivers/md/md.h b/drivers/md/md.h
index def808064ad8..11b5542ec4d2 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -668,6 +668,7 @@ static inline bool reshape_interrupted(struct mddev *=
mddev)
 }
=20
 static inline int __must_check mddev_lock(struct mddev *mddev)
+	TRY_ACQUIRE(0, mddev->reconfig_mutex)
 {
 	return mutex_lock_interruptible(&mddev->reconfig_mutex);
 }
@@ -676,15 +677,18 @@ static inline int __must_check mddev_lock(struct md=
dev *mddev)
  * failure due to interrupts is not acceptable.
  */
 static inline void mddev_lock_nointr(struct mddev *mddev)
+	ACQUIRE(mddev->reconfig_mutex)
 {
 	mutex_lock(&mddev->reconfig_mutex);
 }
=20
 static inline int mddev_trylock(struct mddev *mddev)
+	TRY_ACQUIRE(1, mddev->reconfig_mutex)
 {
 	return mutex_trylock(&mddev->reconfig_mutex);
 }
-extern void mddev_unlock(struct mddev *mddev);
+
+void mddev_unlock(struct mddev *mddev) RELEASE(mddev->reconfig_mutex);
=20
 static inline void md_sync_acct(struct block_device *bdev, unsigned long=
 nr_sectors)
 {
@@ -949,6 +953,7 @@ static inline void mddev_check_write_zeroes(struct md=
dev *mddev, struct bio *bio
 }
=20
 static inline int mddev_suspend_and_lock(struct mddev *mddev)
+	TRY_ACQUIRE(0, mddev->reconfig_mutex)
 {
 	int ret;
=20
@@ -964,12 +969,14 @@ static inline int mddev_suspend_and_lock(struct mdd=
ev *mddev)
 }
=20
 static inline void mddev_suspend_and_lock_nointr(struct mddev *mddev)
+	ACQUIRE(mddev->reconfig_mutex)
 {
 	mddev_suspend(mddev, false);
 	mutex_lock(&mddev->reconfig_mutex);
 }
=20
 static inline void mddev_unlock_and_resume(struct mddev *mddev)
+	RELEASE(mddev->reconfig_mutex)
 {
 	mddev_unlock(mddev);
 	mddev_resume(mddev);
diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/c=
ec-adap.c
index ba6828ef540e..dfc5e6057a03 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -779,6 +779,7 @@ static void cec_wait_timeout(struct work_struct *work=
)
  */
 int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 			struct cec_fh *fh, bool block)
+	REQUIRES(adap->lock)
 {
 	struct cec_data *data;
 	bool is_raw =3D msg_is_raw(msg);
@@ -1305,6 +1306,7 @@ EXPORT_SYMBOL_GPL(cec_received_msg_ts);
 static int cec_config_log_addr(struct cec_adapter *adap,
 			       unsigned int idx,
 			       unsigned int log_addr)
+	REQUIRES(adap->lock)
 {
 	struct cec_log_addrs *las =3D &adap->log_addrs;
 	struct cec_msg msg =3D { };
@@ -1607,6 +1609,7 @@ static int cec_config_thread_func(void *arg)
  * This function is called with adap->lock held.
  */
 static void cec_claim_log_addrs(struct cec_adapter *adap, bool block)
+	REQUIRES(adap->lock)
 {
 	if (WARN_ON(adap->is_claiming_log_addrs ||
 		    adap->is_configuring || adap->is_configured))
@@ -1695,6 +1698,7 @@ int cec_adap_enable(struct cec_adapter *adap)
  * This function is called with adap->lock held.
  */
 void __cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool blo=
ck)
+	REQUIRES(adap->lock)
 {
 	bool becomes_invalid =3D phys_addr =3D=3D CEC_PHYS_ADDR_INVALID;
 	bool is_invalid =3D adap->phys_addr =3D=3D CEC_PHYS_ADDR_INVALID;
@@ -1783,6 +1787,7 @@ EXPORT_SYMBOL_GPL(cec_s_conn_info);
  */
 int __cec_s_log_addrs(struct cec_adapter *adap,
 		      struct cec_log_addrs *log_addrs, bool block)
+	REQUIRES(adap->lock)
 {
 	u16 type_mask =3D 0;
 	int err;
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
index 2df566f409b6..6f71eabfaca1 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1986,6 +1986,7 @@ EXPORT_SYMBOL_GPL(vb2_core_qbuf);
  * Will sleep if required for nonblocking =3D=3D false.
  */
 static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	/*
 	 * All operations on vb_done_list are performed under done_lock
@@ -3193,6 +3194,7 @@ struct vb2_threadio_data {
 };
=20
 static int vb2_thread(void *data)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct vb2_queue *q =3D data;
 	struct vb2_threadio_data *threadio =3D q->threadio;
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/me=
dia/common/videobuf2/videobuf2-v4l2.c
index 9201d854dbcc..fd9bf6cfd3ab 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -1150,6 +1150,7 @@ int vb2_fop_mmap(struct file *file, struct vm_area_=
struct *vma)
 EXPORT_SYMBOL_GPL(vb2_fop_mmap);
=20
 int _vb2_fop_release(struct file *file, struct mutex *lock)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct video_device *vdev =3D video_devdata(file);
=20
@@ -1176,6 +1177,7 @@ EXPORT_SYMBOL_GPL(vb2_fop_release);
=20
 ssize_t vb2_fop_write(struct file *file, const char __user *buf,
 		size_t count, loff_t *ppos)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct video_device *vdev =3D video_devdata(file);
 	struct mutex *lock =3D vdev->queue->lock ? vdev->queue->lock : vdev->lo=
ck;
@@ -1200,6 +1202,7 @@ EXPORT_SYMBOL_GPL(vb2_fop_write);
=20
 ssize_t vb2_fop_read(struct file *file, char __user *buf,
 		size_t count, loff_t *ppos)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct video_device *vdev =3D video_devdata(file);
 	struct mutex *lock =3D vdev->queue->lock ? vdev->queue->lock : vdev->lo=
ck;
@@ -1224,6 +1227,7 @@ ssize_t vb2_fop_read(struct file *file, char __user=
 *buf,
 EXPORT_SYMBOL_GPL(vb2_fop_read);
=20
 __poll_t vb2_fop_poll(struct file *file, poll_table *wait)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct video_device *vdev =3D video_devdata(file);
 	struct vb2_queue *q =3D vdev->queue;
@@ -1265,6 +1269,7 @@ EXPORT_SYMBOL_GPL(vb2_fop_get_unmapped_area);
 #endif
=20
 void vb2_video_unregister_device(struct video_device *vdev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	/* Check if vdev was ever registered at all */
 	if (!vdev || !video_is_registered(vdev))
@@ -1305,12 +1310,14 @@ EXPORT_SYMBOL_GPL(vb2_video_unregister_device);
 /* vb2_ops helpers. Only use if vq->lock is non-NULL. */
=20
 void vb2_ops_wait_prepare(struct vb2_queue *vq)
+	RELEASE(*(vq->lock))
 {
 	mutex_unlock(vq->lock);
 }
 EXPORT_SYMBOL_GPL(vb2_ops_wait_prepare);
=20
 void vb2_ops_wait_finish(struct vb2_queue *vq)
+	ACQUIRE(*(vq->lock))
 {
 	mutex_lock(vq->lock);
 }
diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-co=
re/dvb_frontend.c
index a05aa271a1ba..ddd59c547e28 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2761,6 +2761,7 @@ static __poll_t dvb_frontend_poll(struct file *file=
, struct poll_table_struct *w
 }
=20
 static int dvb_frontend_open(struct inode *inode, struct file *file)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct dvb_device *dvbdev =3D file->private_data;
 	struct dvb_frontend *fe =3D dvbdev->priv;
diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dv=
b_vb2.c
index 29edaaff7a5c..123d358c493f 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -104,6 +104,7 @@ static void _stop_streaming(struct vb2_queue *vq)
 }
=20
 static void _dmxdev_lock(struct vb2_queue *vq)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct dvb_vb2_ctx *ctx =3D vb2_get_drv_priv(vq);
=20
@@ -112,6 +113,7 @@ static void _dmxdev_lock(struct vb2_queue *vq)
 }
=20
 static void _dmxdev_unlock(struct vb2_queue *vq)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct dvb_vb2_ctx *ctx =3D vb2_get_drv_priv(vq);
=20
diff --git a/drivers/media/dvb-frontends/dib9000.c b/drivers/media/dvb-fr=
ontends/dib9000.c
index e71b3670ba1e..3bfdaf1c100b 100644
--- a/drivers/media/dvb-frontends/dib9000.c
+++ b/drivers/media/dvb-frontends/dib9000.c
@@ -1895,6 +1895,7 @@ static int dib9000_fe_get_tune_settings(struct dvb_=
frontend *fe, struct dvb_fron
=20
 static int dib9000_get_frontend(struct dvb_frontend *fe,
 				struct dtv_frontend_properties *c)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct dib9000_state *state =3D fe->demodulator_priv;
 	u8 index_frontend, sub_index_frontend;
diff --git a/drivers/media/dvb-frontends/stv090x.c b/drivers/media/dvb-fr=
ontends/stv090x.c
index f273efa330cf..e8187c13776f 100644
--- a/drivers/media/dvb-frontends/stv090x.c
+++ b/drivers/media/dvb-frontends/stv090x.c
@@ -749,6 +749,7 @@ static int stv090x_write_reg(struct stv090x_state *st=
ate, unsigned int reg, u8 d
 }
=20
 static inline void stv090x_tuner_i2c_lock(struct stv090x_state *state)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (state->config->tuner_i2c_lock)
 		state->config->tuner_i2c_lock(&state->frontend, 1);
@@ -757,6 +758,7 @@ static inline void stv090x_tuner_i2c_lock(struct stv0=
90x_state *state)
 }
=20
 static inline void stv090x_tuner_i2c_unlock(struct stv090x_state *state)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (state->config->tuner_i2c_lock)
 		state->config->tuner_i2c_lock(&state->frontend, 0);
diff --git a/drivers/media/dvb-frontends/stv0910.c b/drivers/media/dvb-fr=
ontends/stv0910.c
index 069dec75129c..645488bf0dd7 100644
--- a/drivers/media/dvb-frontends/stv0910.c
+++ b/drivers/media/dvb-frontends/stv0910.c
@@ -1216,6 +1216,7 @@ static int probe(struct stv *state)
 }
=20
 static int gate_ctrl(struct dvb_frontend *fe, int enable)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct stv *state =3D fe->demodulator_priv;
 	u8 i2crpt =3D state->i2crpt & ~0x86;
diff --git a/drivers/media/dvb-frontends/ts2020.c b/drivers/media/dvb-fro=
ntends/ts2020.c
index e25add6cc38e..3f727056d8a4 100644
--- a/drivers/media/dvb-frontends/ts2020.c
+++ b/drivers/media/dvb-frontends/ts2020.c
@@ -533,6 +533,7 @@ EXPORT_SYMBOL_GPL(ts2020_attach);
  * serialize whole open / I2C-operation / close sequence at the same.
  */
 static void ts2020_regmap_lock(void *__dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct ts2020_priv *dev =3D __dev;
=20
@@ -542,6 +543,7 @@ static void ts2020_regmap_lock(void *__dev)
 }
=20
 static void ts2020_regmap_unlock(void *__dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct ts2020_priv *dev =3D __dev;
=20
diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index c0dd4ae57227..ec714d12c849 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -433,6 +433,7 @@ static const struct media_ioctl_info ioctl_info[] =3D=
 {
=20
 static long media_device_ioctl(struct file *filp, unsigned int cmd,
 			       unsigned long __arg)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct media_devnode *devnode =3D media_devnode_data(filp);
 	struct media_device *dev =3D devnode->media_dev;
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 045590905582..8c50b6e9860f 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -193,6 +193,7 @@ void media_gobj_destroy(struct media_gobj *gobj)
=20
 int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 			   struct media_pad *pads)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct media_device *mdev =3D entity->graph_obj.mdev;
 	struct media_pad *iter;
diff --git a/drivers/media/pci/cx18/cx18-alsa.h b/drivers/media/pci/cx18/=
cx18-alsa.h
index 6d8685fe3283..8fee48127cd8 100644
--- a/drivers/media/pci/cx18/cx18-alsa.h
+++ b/drivers/media/pci/cx18/cx18-alsa.h
@@ -23,12 +23,14 @@ extern int cx18_alsa_debug;
  * need to be serialized.  Use the same lock we use for v4l2 file ops.
  */
 static inline void snd_cx18_lock(struct snd_cx18_card *cxsc)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct cx18 *cx =3D to_cx18(cxsc->v4l2_dev);
 	mutex_lock(&cx->serialize_lock);
 }
=20
 static inline void snd_cx18_unlock(struct snd_cx18_card *cxsc)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct cx18 *cx =3D to_cx18(cxsc->v4l2_dev);
 	mutex_unlock(&cx->serialize_lock);
diff --git a/drivers/media/pci/ddbridge/ddbridge-core.c b/drivers/media/p=
ci/ddbridge/ddbridge-core.c
index 40e6c873c36d..fa3fa0e050fe 100644
--- a/drivers/media/pci/ddbridge/ddbridge-core.c
+++ b/drivers/media/pci/ddbridge/ddbridge-core.c
@@ -858,6 +858,7 @@ static struct dvb_device dvbdev_ci =3D {
 /***********************************************************************=
*****/
=20
 static int locked_gate_ctrl(struct dvb_frontend *fe, int enable)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct ddb_input *input =3D fe->sec_priv;
 	struct ddb_port *port =3D input->port;
diff --git a/drivers/media/pci/ivtv/ivtv-alsa.h b/drivers/media/pci/ivtv/=
ivtv-alsa.h
index d9f685b1c57e..aacb08829a42 100644
--- a/drivers/media/pci/ivtv/ivtv-alsa.h
+++ b/drivers/media/pci/ivtv/ivtv-alsa.h
@@ -24,12 +24,14 @@ extern int ivtv_alsa_debug;
  * need to be serialized.  Use the same lock we use for v4l2 file ops.
  */
 static inline void snd_ivtv_lock(struct snd_ivtv_card *itvsc)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct ivtv *itv =3D to_ivtv(itvsc->v4l2_dev);
 	mutex_lock(&itv->serialize_lock);
 }
=20
 static inline void snd_ivtv_unlock(struct snd_ivtv_card *itvsc)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct ivtv *itv =3D to_ivtv(itvsc->v4l2_dev);
 	mutex_unlock(&itv->serialize_lock);
diff --git a/drivers/media/pci/ivtv/ivtv-fileops.c b/drivers/media/pci/iv=
tv/ivtv-fileops.c
index cfa28d035586..7f6e76419f9a 100644
--- a/drivers/media/pci/ivtv/ivtv-fileops.c
+++ b/drivers/media/pci/ivtv/ivtv-fileops.c
@@ -192,6 +192,7 @@ static void ivtv_update_pgm_info(struct ivtv *itv)
 }
=20
 static void ivtv_schedule(struct ivtv_stream *s)
+	NO_THREAD_SAFETY_ANALYSIS /* requires alias analysis */
 {
 	struct ivtv *itv =3D s->itv;
 	DEFINE_WAIT(wait);
@@ -544,6 +545,7 @@ int ivtv_start_decoding(struct ivtv_open_id *id, int =
speed)
 }
=20
 static int ivtv_schedule_dma(struct ivtv_stream *s)
+	NO_THREAD_SAFETY_ANALYSIS /* requires alias analysis */
 {
 	struct ivtv *itv =3D s->itv;
 	int got_sig;
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv=
/ivtv-ioctl.c
index 7947dcd615e8..93ea32adc997 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -119,6 +119,7 @@ void ivtv_set_osd_alpha(struct ivtv *itv)
 }
=20
 int ivtv_set_speed(struct ivtv *itv, int speed)
+	REQUIRES(itv->serialize_lock)
 {
 	u32 data[CX2341X_MBOX_MAX_DATA];
 	int single_step =3D (speed =3D=3D 1 || speed =3D=3D -1);
@@ -1110,6 +1111,7 @@ void ivtv_s_std_enc(struct ivtv *itv, v4l2_std_id s=
td)
 }
=20
 void ivtv_s_std_dec(struct ivtv *itv, v4l2_std_id std)
+	REQUIRES(itv->serialize_lock)
 {
 	struct yuv_playback_info *yi =3D &itv->yuv_info;
 	DEFINE_WAIT(wait);
@@ -1156,6 +1158,7 @@ void ivtv_s_std_dec(struct ivtv *itv, v4l2_std_id s=
td)
 }
=20
 static int ivtv_s_std(struct file *file, void *fh, v4l2_std_id std)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct ivtv *itv =3D fh2id(fh)->itv;
=20
diff --git a/drivers/media/pci/ivtv/ivtv-yuv.c b/drivers/media/pci/ivtv/i=
vtv-yuv.c
index 2d9274537725..8230c179085b 100644
--- a/drivers/media/pci/ivtv/ivtv-yuv.c
+++ b/drivers/media/pci/ivtv/ivtv-yuv.c
@@ -1136,6 +1136,7 @@ void ivtv_yuv_setup_stream_frame(struct ivtv *itv)
=20
 /* Attempt to dma a frame from a user buffer */
 int ivtv_yuv_udma_stream_frame(struct ivtv *itv, void __user *src)
+	REQUIRES(itv->serialize_lock)
 {
 	struct yuv_playback_info *yi =3D &itv->yuv_info;
 	struct ivtv_dma_frame dma_args;
@@ -1157,6 +1158,7 @@ int ivtv_yuv_udma_stream_frame(struct ivtv *itv, vo=
id __user *src)
=20
 /* IVTV_IOC_DMA_FRAME ioctl handler */
 int ivtv_yuv_prep_frame(struct ivtv *itv, struct ivtv_dma_frame *args)
+	REQUIRES(itv->serialize_lock)
 {
 	int res;
=20
@@ -1173,6 +1175,7 @@ int ivtv_yuv_prep_frame(struct ivtv *itv, struct iv=
tv_dma_frame *args)
 }
=20
 void ivtv_yuv_close(struct ivtv *itv)
+	REQUIRES(itv->serialize_lock)
 {
 	struct yuv_playback_info *yi =3D &itv->yuv_info;
 	int h_filter, v_filter_1, v_filter_2;
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/pl=
atform/amphion/vpu_v4l2.c
index 45707931bc4f..98404b04f0c4 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -25,11 +25,13 @@
 #include "vpu_helpers.h"
=20
 void vpu_inst_lock(struct vpu_inst *inst)
+	ACQUIRE(inst->lock)
 {
 	mutex_lock(&inst->lock);
 }
=20
 void vpu_inst_unlock(struct vpu_inst *inst)
+	RELEASE(inst->lock)
 {
 	mutex_unlock(&inst->lock);
 }
@@ -580,6 +582,7 @@ void vpu_vb2_buffers_return(struct vpu_inst *inst, un=
signed int type, enum vb2_b
 }
=20
 static int vpu_vb2_start_streaming(struct vb2_queue *q, unsigned int cou=
nt)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct vpu_inst *inst =3D vb2_get_drv_priv(q);
 	struct vpu_format *fmt =3D vpu_get_format(inst, q->type);
diff --git a/drivers/media/platform/chips-media/coda/coda-jpeg.c b/driver=
s/media/platform/chips-media/coda/coda-jpeg.c
index 5746892658b1..b8cbacf29363 100644
--- a/drivers/media/platform/chips-media/coda/coda-jpeg.c
+++ b/drivers/media/platform/chips-media/coda/coda-jpeg.c
@@ -1504,6 +1504,7 @@ const struct coda_context_ops coda9_jpeg_decode_ops=
 =3D {
 };
=20
 irqreturn_t coda9_jpeg_irq_handler(int irq, void *data)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	struct coda_dev *dev =3D data;
 	struct coda_ctx *ctx;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 98838217b97d..8bd955ffd2d8 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -177,11 +177,13 @@ static int vidioc_decoder_cmd(struct file *file, vo=
id *priv, struct v4l2_decoder
 }
=20
 void mtk_vdec_unlock(struct mtk_vcodec_dec_ctx *ctx)
+	RELEASE(ctx->dev->dec_mutex[ctx->hw_id])
 {
 	mutex_unlock(&ctx->dev->dec_mutex[ctx->hw_id]);
 }
=20
 void mtk_vdec_lock(struct mtk_vcodec_dec_ctx *ctx)
+	ACQUIRE(ctx->dev->dec_mutex[ctx->hw_id])
 {
 	mutex_lock(&ctx->dev->dec_mutex[ctx->hw_id]);
 }
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_pm.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm=
.c
index aefd3e9e3061..85eaf8be4180 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c
@@ -230,6 +230,7 @@ static void mtk_vcodec_dec_child_dev_off(struct mtk_v=
codec_dec_dev *vdec_dev,
 }
=20
 void mtk_vcodec_dec_enable_hardware(struct mtk_vcodec_dec_ctx *ctx, int =
hw_idx)
+	ACQUIRE(ctx->dev->dec_mutex[hw_idx])
 {
 	mutex_lock(&ctx->dev->dec_mutex[hw_idx]);
=20
@@ -246,6 +247,7 @@ void mtk_vcodec_dec_enable_hardware(struct mtk_vcodec=
_dec_ctx *ctx, int hw_idx)
 EXPORT_SYMBOL_GPL(mtk_vcodec_dec_enable_hardware);
=20
 void mtk_vcodec_dec_disable_hardware(struct mtk_vcodec_dec_ctx *ctx, int=
 hw_idx)
+	RELEASE(ctx->dev->dec_mutex[hw_idx])
 {
 	if (IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
 		mtk_vcodec_record_racing_info(ctx);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index a01dc25a7699..9bdf0f8a460b 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -1417,6 +1417,7 @@ int mtk_vcodec_enc_queue_init(void *priv, struct vb=
2_queue *src_vq,
 }
=20
 int mtk_venc_unlock(struct mtk_vcodec_enc_ctx *ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mtk_vcodec_enc_dev *dev =3D ctx->dev;
=20
@@ -1425,6 +1426,7 @@ int mtk_venc_unlock(struct mtk_vcodec_enc_ctx *ctx)
 }
=20
 int mtk_venc_lock(struct mtk_vcodec_enc_ctx *ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mtk_vcodec_enc_dev *dev =3D ctx->dev;
=20
diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/med=
ia/platform/nvidia/tegra-vde/h264.c
index 0e56a4331b0d..8a0eee735b0a 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -534,6 +534,7 @@ static int tegra_vde_decode_begin(struct tegra_vde *v=
de,
 				  struct tegra_video_frame *dpb_frames,
 				  dma_addr_t bitstream_data_addr,
 				  size_t bitstream_data_size)
+	TRY_ACQUIRE(0, vde->lock)
 {
 	struct device *dev =3D vde->dev;
 	unsigned int macroblocks_nb;
@@ -595,6 +596,7 @@ static int tegra_vde_decode_begin(struct tegra_vde *v=
de,
 }
=20
 static void tegra_vde_decode_abort(struct tegra_vde *vde)
+	RELEASE(vde->lock)
 {
 	struct device *dev =3D vde->dev;
 	int err;
@@ -619,6 +621,7 @@ static void tegra_vde_decode_abort(struct tegra_vde *=
vde)
 }
=20
 static int tegra_vde_decode_end(struct tegra_vde *vde)
+	RELEASE(vde->lock)
 {
 	unsigned int read_bytes, macroblocks_nb;
 	struct device *dev =3D vde->dev;
@@ -918,6 +921,7 @@ static int tegra_vde_h264_setup_context(struct tegra_=
ctx *ctx,
 }
=20
 int tegra_vde_h264_decode_run(struct tegra_ctx *ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct vb2_v4l2_buffer *src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	struct tegra_m2m_buffer *bitstream =3D vb_to_tegra_buf(&src->vb2_buf);
@@ -940,6 +944,7 @@ int tegra_vde_h264_decode_run(struct tegra_ctx *ctx)
 }
=20
 int tegra_vde_h264_decode_wait(struct tegra_ctx *ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	return tegra_vde_decode_end(ctx->vde);
 }
diff --git a/drivers/media/platform/nvidia/tegra-vde/vde.c b/drivers/medi=
a/platform/nvidia/tegra-vde/vde.c
index 3232392c60e2..a236166e8bb7 100644
--- a/drivers/media/platform/nvidia/tegra-vde/vde.c
+++ b/drivers/media/platform/nvidia/tegra-vde/vde.c
@@ -420,6 +420,7 @@ static void tegra_vde_shutdown(struct platform_device=
 *pdev)
 }
=20
 static __maybe_unused int tegra_vde_pm_suspend(struct device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct tegra_vde *vde =3D dev_get_drvdata(dev);
 	int err;
@@ -434,6 +435,7 @@ static __maybe_unused int tegra_vde_pm_suspend(struct=
 device *dev)
 }
=20
 static __maybe_unused int tegra_vde_pm_resume(struct device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct tegra_vde *vde =3D dev_get_drvdata(dev);
 	int err;
diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.h b/driv=
ers/media/platform/samsung/exynos4-is/media-dev.h
index a50e58ab7ef7..b40d3f6bee5e 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.h
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.h
@@ -164,11 +164,13 @@ static inline struct fimc_md *notifier_to_fimc_md(s=
truct v4l2_async_notifier *n)
 }
=20
 static inline void fimc_md_graph_lock(struct exynos_video_entity *ve)
+	ACQUIRE(ve->vdev.entity.graph_obj.mdev->graph_mutex)
 {
 	mutex_lock(&ve->vdev.entity.graph_obj.mdev->graph_mutex);
 }
=20
 static inline void fimc_md_graph_unlock(struct exynos_video_entity *ve)
+	RELEASE(ve->vdev.entity.graph_obj.mdev->graph_mutex)
 {
 	mutex_unlock(&ve->vdev.entity.graph_obj.mdev->graph_mutex);
 }
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/m=
edia/platform/samsung/s5p-mfc/s5p_mfc.c
index 5f80931f056d..d99c77dc9679 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -164,6 +164,7 @@ static void s5p_mfc_watchdog(struct timer_list *t)
 }
=20
 static void s5p_mfc_watchdog_worker(struct work_struct *work)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct s5p_mfc_dev *dev;
 	struct s5p_mfc_ctx *ctx;
@@ -955,6 +956,7 @@ static int s5p_mfc_open(struct file *file)
=20
 /* Release MFC context */
 static int s5p_mfc_release(struct file *file)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct s5p_mfc_ctx *ctx =3D fh_to_ctx(file->private_data);
 	struct s5p_mfc_dev *dev =3D ctx->dev;
diff --git a/drivers/media/platform/st/sti/hva/hva-hw.c b/drivers/media/p=
latform/st/sti/hva/hva-hw.c
index fcb18fb52fdd..816b5af35d63 100644
--- a/drivers/media/platform/st/sti/hva/hva-hw.c
+++ b/drivers/media/platform/st/sti/hva/hva-hw.c
@@ -265,6 +265,7 @@ static irqreturn_t hva_hw_err_irq_thread(int irq, voi=
d *arg)
 }
=20
 static unsigned long int hva_hw_get_ip_version(struct hva_dev *hva)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlocking */
 {
 	struct device *dev =3D hva_to_dev(hva);
 	unsigned long int version;
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/medi=
a/platform/ti/omap3isp/ispvideo.c
index 5c9aa80023fd..dfe35d4ad2bf 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -481,6 +481,7 @@ static int isp_video_start_streaming(struct vb2_queue=
 *queue,
 }
=20
 static void omap3isp_wait_prepare(struct vb2_queue *vq)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct isp_video_fh *vfh =3D vb2_get_drv_priv(vq);
 	struct isp_video *video =3D vfh->video;
@@ -489,6 +490,7 @@ static void omap3isp_wait_prepare(struct vb2_queue *v=
q)
 }
=20
 static void omap3isp_wait_finish(struct vb2_queue *vq)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct isp_video_fh *vfh =3D vb2_get_drv_priv(vq);
 	struct isp_video *video =3D vfh->video;
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drive=
rs/media/test-drivers/vivid/vivid-kthread-cap.c
index 669bd96da4c7..0c7be90e4486 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
@@ -385,6 +385,7 @@ static noinline_for_stack int vivid_copy_buffer(struc=
t vivid_dev *dev,
 }
=20
 static void vivid_fillbuff(struct vivid_dev *dev, struct vivid_buffer *b=
uf)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct vivid_dev *out_dev =3D NULL;
 	struct tpg_data *tpg =3D &dev->tpg;
diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/=
dvb-usb-v2/mxl111sf.c
index cd5861a30b6f..06339728a593 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -263,6 +263,7 @@ static int mxl111sf_power_ctrl(struct dvb_usb_device =
*d, int onoff)
 #endif
=20
 static int mxl111sf_adap_fe_init(struct dvb_frontend *fe)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct dvb_usb_device *d =3D fe_to_d(fe);
 	struct mxl111sf_state *state =3D fe_to_priv(fe);
@@ -320,6 +321,7 @@ static int mxl111sf_adap_fe_init(struct dvb_frontend =
*fe)
 }
=20
 static int mxl111sf_adap_fe_sleep(struct dvb_frontend *fe)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mxl111sf_state *state =3D fe_to_priv(fe);
 	struct mxl111sf_adap_state *adap_state =3D &state->adap_state[fe->id];
diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb=
/dvb-usb/cxusb-analog.c
index 8253046cd6e6..8b36068795f3 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -896,6 +896,7 @@ static int cxusb_medion_v_start_streaming(struct vb2_=
queue *q,
 }
=20
 static void cxusb_medion_v_stop_streaming(struct vb2_queue *q)
+	NO_THREAD_SAFETY_ANALYSIS /* requires alias analysis */
 {
 	struct dvb_usb_device *dvbdev =3D vb2_get_drv_priv(q);
 	struct cxusb_medion_dev *cxdev =3D dvbdev->priv;
diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-us=
b/cxusb.c
index 23f7931ccd95..ee6ae5c22348 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -305,6 +305,7 @@ static int _cxusb_power_ctrl(struct dvb_usb_device *d=
, int onoff)
 }
=20
 static int cxusb_power_ctrl(struct dvb_usb_device *d, int onoff)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	bool is_medion =3D d->props.devices[0].warm_ids[0] =3D=3D &cxusb_table[=
MEDION_MD95700];
 	int ret;
diff --git a/drivers/media/usb/go7007/go7007-i2c.c b/drivers/media/usb/go=
7007/go7007-i2c.c
index f6ce28a4a768..ceb4f378e973 100644
--- a/drivers/media/usb/go7007/go7007-i2c.c
+++ b/drivers/media/usb/go7007/go7007-i2c.c
@@ -36,6 +36,7 @@
 static DEFINE_MUTEX(adlink_mpg24_i2c_mutex);
=20
 static inline void adlink_mpg24_i2c_lock(struct go7007 *go)
+	ACQUIRE(adlink_mpg24_i2c_mutex)
 {
 	/* Bridge the I2C port on this GO7007 to the shared bus */
 	mutex_lock(&adlink_mpg24_i2c_mutex);
@@ -43,6 +44,7 @@ static inline void adlink_mpg24_i2c_lock(struct go7007 =
*go)
 }
=20
 static inline void adlink_mpg24_i2c_unlock(struct go7007 *go)
+	RELEASE(adlink_mpg24_i2c_mutex)
 {
 	/* Isolate the I2C port on this GO7007 from the shared bus */
 	go7007_write_addr(go, 0x3c82, 0x0000);
@@ -51,6 +53,7 @@ static inline void adlink_mpg24_i2c_unlock(struct go700=
7 *go)
=20
 static int go7007_i2c_xfer(struct go7007 *go, u16 addr, int read,
 		u16 command, int flags, u8 *data)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int i, ret =3D -EIO;
 	u16 val;
diff --git a/drivers/media/usb/gspca/finepix.c b/drivers/media/usb/gspca/=
finepix.c
index bc6133b525e3..2ad7d9d91151 100644
--- a/drivers/media/usb/gspca/finepix.c
+++ b/drivers/media/usb/gspca/finepix.c
@@ -220,6 +220,7 @@ static int sd_start(struct gspca_dev *gspca_dev)
 /* called on streamoff with alt=3D=3D0 and on disconnect */
 /* the usb_lock is held at entry - restore on exit */
 static void sd_stop0(struct gspca_dev *gspca_dev)
+	REQUIRES(gspca_dev->usb_lock)
 {
 	struct usb_fpix *dev =3D (struct usb_fpix *) gspca_dev;
=20
diff --git a/drivers/media/usb/gspca/jl2005bcd.c b/drivers/media/usb/gspc=
a/jl2005bcd.c
index a408fcc3a060..51c3338884e6 100644
--- a/drivers/media/usb/gspca/jl2005bcd.c
+++ b/drivers/media/usb/gspca/jl2005bcd.c
@@ -473,6 +473,7 @@ static int sd_start(struct gspca_dev *gspca_dev)
 /* called on streamoff with alt=3D=3D0 and on disconnect */
 /* the usb_lock is held at entry - restore on exit */
 static void sd_stop0(struct gspca_dev *gspca_dev)
+	REQUIRES(gspca_dev->usb_lock)
 {
 	struct sd *dev =3D (struct sd *) gspca_dev;
=20
diff --git a/drivers/media/usb/gspca/sn9c20x.c b/drivers/media/usb/gspca/=
sn9c20x.c
index da916127a896..2a9853092191 100644
--- a/drivers/media/usb/gspca/sn9c20x.c
+++ b/drivers/media/usb/gspca/sn9c20x.c
@@ -2081,6 +2081,7 @@ static void sd_stopN(struct gspca_dev *gspca_dev)
 /* called on streamoff with alt=3D=3D0 and on disconnect */
 /* the usb_lock is held at entry - restore on exit */
 static void sd_stop0(struct gspca_dev *gspca_dev)
+	REQUIRES(gspca_dev->usb_lock)
 {
 	struct sd *sd =3D (struct sd *) gspca_dev;
=20
diff --git a/drivers/media/usb/gspca/sonixj.c b/drivers/media/usb/gspca/s=
onixj.c
index 2e1bd2df8304..92c1ab1397b2 100644
--- a/drivers/media/usb/gspca/sonixj.c
+++ b/drivers/media/usb/gspca/sonixj.c
@@ -2558,6 +2558,7 @@ static void sd_stopN(struct gspca_dev *gspca_dev)
 /* called on streamoff with alt=3D=3D0 and on disconnect */
 /* the usb_lock is held at entry - restore on exit */
 static void sd_stop0(struct gspca_dev *gspca_dev)
+	REQUIRES(gspca_dev->usb_lock)
 {
 	struct sd *sd =3D (struct sd *) gspca_dev;
=20
diff --git a/drivers/media/usb/gspca/sq905.c b/drivers/media/usb/gspca/sq=
905.c
index 32504ebcfd4d..af659fbf4072 100644
--- a/drivers/media/usb/gspca/sq905.c
+++ b/drivers/media/usb/gspca/sq905.c
@@ -156,6 +156,7 @@ static int sq905_ack_frame(struct gspca_dev *gspca_de=
v)
  */
 static int
 sq905_read_data(struct gspca_dev *gspca_dev, u8 *data, int size, int nee=
d_lock)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret;
 	int act_len =3D 0;
@@ -300,6 +301,7 @@ static int sd_config(struct gspca_dev *gspca_dev,
 /* called on streamoff with alt=3D=3D0 and on disconnect */
 /* the usb_lock is held at entry - restore on exit */
 static void sd_stop0(struct gspca_dev *gspca_dev)
+	REQUIRES(gspca_dev->usb_lock)
 {
 	struct sd *dev =3D (struct sd *) gspca_dev;
=20
diff --git a/drivers/media/usb/gspca/sq905c.c b/drivers/media/usb/gspca/s=
q905c.c
index 6ca947aef298..bceddf488c62 100644
--- a/drivers/media/usb/gspca/sq905c.c
+++ b/drivers/media/usb/gspca/sq905c.c
@@ -231,6 +231,7 @@ static int sd_config(struct gspca_dev *gspca_dev,
 /* called on streamoff with alt=3D=3D0 and on disconnect */
 /* the usb_lock is held at entry - restore on exit */
 static void sd_stop0(struct gspca_dev *gspca_dev)
+	REQUIRES(gspca_dev->usb_lock)
 {
 	struct sd *dev =3D (struct sd *) gspca_dev;
=20
diff --git a/drivers/media/usb/gspca/vicam.c b/drivers/media/usb/gspca/vi=
cam.c
index d98343fd33fe..ccd3fbbb46ff 100644
--- a/drivers/media/usb/gspca/vicam.c
+++ b/drivers/media/usb/gspca/vicam.c
@@ -272,6 +272,7 @@ static int sd_start(struct gspca_dev *gspca_dev)
 /* called on streamoff with alt=3D=3D0 and on disconnect */
 /* the usb_lock is held at entry - restore on exit */
 static void sd_stop0(struct gspca_dev *gspca_dev)
+	REQUIRES(gspca_dev->usb_lock)
 {
 	struct sd *dev =3D (struct sd *)gspca_dev;
=20
diff --git a/drivers/media/usb/gspca/zc3xx.c b/drivers/media/usb/gspca/zc=
3xx.c
index 5bcbf0d40147..4b963339eff7 100644
--- a/drivers/media/usb/gspca/zc3xx.c
+++ b/drivers/media/usb/gspca/zc3xx.c
@@ -6846,6 +6846,7 @@ static int sd_start(struct gspca_dev *gspca_dev)
 /* called on streamoff with alt=3D=3D0 and on disconnect */
 /* the usb_lock is held at entry - restore on exit */
 static void sd_stop0(struct gspca_dev *gspca_dev)
+	REQUIRES(gspca_dev->usb_lock)
 {
 	struct sd *sd =3D (struct sd *) gspca_dev;
=20
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hd=
pvr/hdpvr-video.c
index fd7d2a9d0449..3b5fc6e55daf 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -319,6 +319,7 @@ static int hdpvr_start_streaming(struct hdpvr_device =
*dev)
=20
 /* function expects dev->io_mutex to be hold by caller */
 static int hdpvr_stop_streaming(struct hdpvr_device *dev)
+	REQUIRES(dev->io_mutex)
 {
 	int actual_length;
 	uint c =3D 0;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-context.c b/drivers/media/=
usb/pvrusb2/pvrusb2-context.c
index 73c95ba2328a..e348aceb20e6 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-context.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-context.c
@@ -248,12 +248,14 @@ static void pvr2_context_reset_input_limits(struct =
pvr2_context *mp)
=20
=20
 static void pvr2_context_enter(struct pvr2_context *mp)
+	ACQUIRE(mp->mutex)
 {
 	mutex_lock(&mp->mutex);
 }
=20
=20
 static void pvr2_context_exit(struct pvr2_context *mp)
+	RELEASE(mp->mutex)
 {
 	int destroy_flag =3D 0;
 	if (!(mp->mc_first || !mp->disconnect_flag)) {
diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
index 043dceb77754..07617b9f22c1 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1930,6 +1930,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity=
 *entity,
=20
 int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 		      struct v4l2_ext_controls *ctrls)
+	NO_THREAD_SAFETY_ANALYSIS /* RELEASE(handle->chain->ctrl_mutex) */
 {
 	struct uvc_video_chain *chain =3D handle->chain;
 	struct uvc_control *err_ctrl;
diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-co=
re/v4l2-event.c
index 3898ff7edddb..239b9ccef1ef 100644
--- a/drivers/media/v4l2-core/v4l2-event.c
+++ b/drivers/media/v4l2-core/v4l2-event.c
@@ -58,6 +58,7 @@ static int __v4l2_event_dequeue(struct v4l2_fh *fh, str=
uct v4l2_event *event)
=20
 int v4l2_event_dequeue(struct v4l2_fh *fh, struct v4l2_event *event,
 		       int nonblocking)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret;
=20
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
index 0304daa8471d..49bc238bff89 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3049,6 +3049,7 @@ EXPORT_SYMBOL(v4l_printk_ioctl);
=20
 static long __video_do_ioctl(struct file *file,
 		unsigned int cmd, void *arg)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct video_device *vfd =3D video_devdata(file);
 	struct mutex *req_queue_lock =3D NULL;
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
index eb22d6172462..97616eabfa16 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1624,6 +1624,7 @@ int v4l2_m2m_fop_mmap(struct file *file, struct vm_=
area_struct *vma)
 EXPORT_SYMBOL_GPL(v4l2_m2m_fop_mmap);
=20
 __poll_t v4l2_m2m_fop_poll(struct file *file, poll_table *wait)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct v4l2_fh *fh =3D file->private_data;
 	struct v4l2_m2m_ctx *m2m_ctx =3D fh->m2m_ctx;
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-c=
ore/v4l2-subdev.c
index cde1774c9098..e48fdb07b133 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1109,6 +1109,7 @@ static long subdev_do_ioctl(struct file *file, unsi=
gned int cmd, void *arg,
 }
=20
 static long subdev_do_ioctl_lock(struct file *file, unsigned int cmd, vo=
id *arg)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct video_device *vdev =3D video_devdata(file);
 	struct mutex *lock =3D vdev->lock;
diff --git a/drivers/message/fusion/mptctl.c b/drivers/message/fusion/mpt=
ctl.c
index 77fa55df70d0..3cec6a388dc0 100644
--- a/drivers/message/fusion/mptctl.c
+++ b/drivers/message/fusion/mptctl.c
@@ -177,6 +177,7 @@ static struct fasync_struct *async_queue=3DNULL;
  */
 static inline int
 mptctl_syscall_down(MPT_ADAPTER *ioc, int nonblock)
+	TRY_ACQUIRE(0, ioc->ioctl_cmds.mutex)
 {
 	int rc =3D 0;
=20
@@ -670,7 +671,8 @@ __mptctl_ioctl(struct file *file, unsigned int cmd, u=
nsigned long arg)
 	/* All of these commands require an interrupt or
 	 * are unknown/illegal.
 	 */
-	if ((ret =3D mptctl_syscall_down(iocp, nonblock)) !=3D 0)
+	ret =3D mptctl_syscall_down(iocp, nonblock);
+	if (ret !=3D 0)
 		return ret;
=20
 	if (cmd =3D=3D MPTFWDOWNLOAD)
@@ -1727,6 +1729,7 @@ mptctl_mpt_command (MPT_ADAPTER *ioc, unsigned long=
 arg)
  */
 static int
 mptctl_do_mpt_command (MPT_ADAPTER *ioc, struct mpt_ioctl_command karg, =
void __user *mfPtr)
+	NO_THREAD_SAFETY_ANALYSIS /* this function needs further inspection */
 {
 	MPT_FRAME_HDR	*mf =3D NULL;
 	MPIHeader_t	*hdr;
@@ -2732,7 +2735,8 @@ compat_mptfwxfer_ioctl(struct file *filp, unsigned =
int cmd,
 		return -ENODEV;
 	}
=20
-	if ((ret =3D mptctl_syscall_down(iocp, nonblock)) !=3D 0)
+	ret =3D mptctl_syscall_down(iocp, nonblock);
+	if (ret !=3D 0)
 		return ret;
=20
 	dctlprintk(iocp, printk(MYIOC_s_DEBUG_FMT "compat_mptfwxfer_ioctl() cal=
led\n",
@@ -2772,7 +2776,8 @@ compat_mpt_command(struct file *filp, unsigned int =
cmd,
 		return -ENODEV;
 	}
=20
-	if ((ret =3D mptctl_syscall_down(iocp, nonblock)) !=3D 0)
+	ret =3D mptctl_syscall_down(iocp, nonblock);
+	if (ret !=3D 0)
 		return ret;
=20
 	dctlprintk(iocp, printk(MYIOC_s_DEBUG_FMT "compat_mpt_command() called\=
n",
diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 8e68b64bd7f8..2f1a6f6ccbc9 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -481,6 +481,7 @@ static irqreturn_t pm860x_irq(int irq, void *data)
 }
=20
 static void pm860x_irq_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct pm860x_chip *chip =3D irq_data_get_irq_chip_data(data);
=20
@@ -488,6 +489,7 @@ static void pm860x_irq_lock(struct irq_data *data)
 }
=20
 static void pm860x_irq_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct pm860x_chip *chip =3D irq_data_get_irq_chip_data(data);
 	struct pm860x_irq_data *irq_data;
diff --git a/drivers/mfd/atc260x-core.c b/drivers/mfd/atc260x-core.c
index 6b6d5f1b9d76..b94f664cc7e4 100644
--- a/drivers/mfd/atc260x-core.c
+++ b/drivers/mfd/atc260x-core.c
@@ -24,6 +24,7 @@ struct atc260x_init_regs {
 };
=20
 static void regmap_lock_mutex(void *__mutex)
+	NO_THREAD_SAFETY_ANALYSIS /* needs further inspection */
 {
 	struct mutex *mutex =3D __mutex;
=20
@@ -45,6 +46,7 @@ static void regmap_lock_mutex(void *__mutex)
 }
=20
 static void regmap_unlock_mutex(void *__mutex)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the above function */
 {
 	struct mutex *mutex =3D __mutex;
=20
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index c5bfb6440a93..ddfbb18f7a2c 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -237,6 +237,7 @@ EXPORT_SYMBOL_GPL(kempld_write32);
  * @pld: kempld_device_data structure describing the PLD
  */
 void kempld_get_mutex(struct kempld_device_data *pld)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	const struct kempld_platform_data *pdata =3D dev_get_platdata(pld->dev)=
;
=20
@@ -250,6 +251,7 @@ EXPORT_SYMBOL_GPL(kempld_get_mutex);
  * @pld: kempld_device_data structure describing the PLD
  */
 void kempld_release_mutex(struct kempld_device_data *pld)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	const struct kempld_platform_data *pdata =3D dev_get_platdata(pld->dev)=
;
=20
diff --git a/drivers/mfd/lp8788-irq.c b/drivers/mfd/lp8788-irq.c
index 39006297f3d2..530851ce5f3d 100644
--- a/drivers/mfd/lp8788-irq.c
+++ b/drivers/mfd/lp8788-irq.c
@@ -74,6 +74,7 @@ static void lp8788_irq_disable(struct irq_data *data)
 }
=20
 static void lp8788_irq_bus_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct lp8788_irq_data *irqd =3D irq_data_get_irq_chip_data(data);
=20
@@ -81,6 +82,7 @@ static void lp8788_irq_bus_lock(struct irq_data *data)
 }
=20
 static void lp8788_irq_bus_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct lp8788_irq_data *irqd =3D irq_data_get_irq_chip_data(data);
 	enum lp8788_int_id irq =3D data->hwirq;
diff --git a/drivers/mfd/max8925-core.c b/drivers/mfd/max8925-core.c
index 105d79b91493..568f19b954ad 100644
--- a/drivers/mfd/max8925-core.c
+++ b/drivers/mfd/max8925-core.c
@@ -527,6 +527,7 @@ static irqreturn_t max8925_tsc_irq(int irq, void *dat=
a)
 }
=20
 static void max8925_irq_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct max8925_chip *chip =3D irq_data_get_irq_chip_data(data);
=20
@@ -534,6 +535,7 @@ static void max8925_irq_lock(struct irq_data *data)
 }
=20
 static void max8925_irq_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct max8925_chip *chip =3D irq_data_get_irq_chip_data(data);
 	struct max8925_irq_data *irq_data;
diff --git a/drivers/mfd/max8997-irq.c b/drivers/mfd/max8997-irq.c
index 93a3b1698d9c..ebd6a0f23c47 100644
--- a/drivers/mfd/max8997-irq.c
+++ b/drivers/mfd/max8997-irq.c
@@ -98,6 +98,7 @@ static const struct max8997_irq_data max8997_irqs[] =3D=
 {
 };
=20
 static void max8997_irq_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct max8997_dev *max8997 =3D irq_data_get_irq_chip_data(data);
=20
@@ -105,6 +106,7 @@ static void max8997_irq_lock(struct irq_data *data)
 }
=20
 static void max8997_irq_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct max8997_dev *max8997 =3D irq_data_get_irq_chip_data(data);
 	int i;
diff --git a/drivers/mfd/max8998-irq.c b/drivers/mfd/max8998-irq.c
index 83b6f510bc05..a2beabb9d5cf 100644
--- a/drivers/mfd/max8998-irq.c
+++ b/drivers/mfd/max8998-irq.c
@@ -98,6 +98,7 @@ irq_to_max8998_irq(struct max8998_dev *max8998, struct =
irq_data *data)
 }
=20
 static void max8998_irq_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct max8998_dev *max8998 =3D irq_data_get_irq_chip_data(data);
=20
@@ -105,6 +106,7 @@ static void max8998_irq_lock(struct irq_data *data)
 }
=20
 static void max8998_irq_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct max8998_dev *max8998 =3D irq_data_get_irq_chip_data(data);
 	int i;
diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
index 920797b806ce..0a62264ee645 100644
--- a/drivers/mfd/mc13xxx-core.c
+++ b/drivers/mfd/mc13xxx-core.c
@@ -47,6 +47,7 @@
 #define MC13XXX_ADC2		45
=20
 void mc13xxx_lock(struct mc13xxx *mc13xxx)
+	ACQUIRE(mc13xxx->lock)
 {
 	if (!mutex_trylock(&mc13xxx->lock)) {
 		dev_dbg(mc13xxx->dev, "wait for %s from %ps\n",
@@ -60,6 +61,7 @@ void mc13xxx_lock(struct mc13xxx *mc13xxx)
 EXPORT_SYMBOL(mc13xxx_lock);
=20
 void mc13xxx_unlock(struct mc13xxx *mc13xxx)
+	RELEASE(mc13xxx->lock)
 {
 	dev_dbg(mc13xxx->dev, "%s from %ps\n",
 			__func__, __builtin_return_address(0));
diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
index 49830b526ee8..e55f5021df12 100644
--- a/drivers/mfd/mt6358-irq.c
+++ b/drivers/mfd/mt6358-irq.c
@@ -91,6 +91,7 @@ static void pmic_irq_disable(struct irq_data *data)
 }
=20
 static void pmic_irq_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mt6397_chip *chip =3D irq_data_get_irq_chip_data(data);
=20
@@ -98,6 +99,7 @@ static void pmic_irq_lock(struct irq_data *data)
 }
=20
 static void pmic_irq_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	unsigned int i, top_gp, gp_offset, en_reg, int_regs, shift;
 	struct mt6397_chip *chip =3D irq_data_get_irq_chip_data(data);
diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
index 1310665200ed..a6cb40d12484 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -19,6 +19,7 @@
 #include <linux/mfd/mt6397/registers.h>
=20
 static void mt6397_irq_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mt6397_chip *mt6397 =3D irq_data_get_irq_chip_data(data);
=20
@@ -26,6 +27,7 @@ static void mt6397_irq_lock(struct irq_data *data)
 }
=20
 static void mt6397_irq_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mt6397_chip *mt6397 =3D irq_data_get_irq_chip_data(data);
=20
diff --git a/drivers/mfd/rc5t583-irq.c b/drivers/mfd/rc5t583-irq.c
index 97f52b671520..e6ceeebab642 100644
--- a/drivers/mfd/rc5t583-irq.c
+++ b/drivers/mfd/rc5t583-irq.c
@@ -138,6 +138,7 @@ static const struct rc5t583_irq_data rc5t583_irqs[RC5=
T583_MAX_IRQS] =3D {
 };
=20
 static void rc5t583_irq_lock(struct irq_data *irq_data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct rc5t583 *rc5t583 =3D irq_data_get_irq_chip_data(irq_data);
 	mutex_lock(&rc5t583->irq_lock);
@@ -196,6 +197,7 @@ static int rc5t583_irq_set_type(struct irq_data *irq_=
data, unsigned int type)
 }
=20
 static void rc5t583_irq_sync_unlock(struct irq_data *irq_data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct rc5t583 *rc5t583 =3D irq_data_get_irq_chip_data(irq_data);
 	int i;
diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index f391c2ccaa72..29893d4240c6 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -164,6 +164,7 @@ int stmfx_function_disable(struct stmfx *stmfx, u32 f=
unc)
 EXPORT_SYMBOL_GPL(stmfx_function_disable);
=20
 static void stmfx_irq_bus_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct stmfx *stmfx =3D irq_data_get_irq_chip_data(data);
=20
@@ -171,6 +172,7 @@ static void stmfx_irq_bus_lock(struct irq_data *data)
 }
=20
 static void stmfx_irq_bus_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct stmfx *stmfx =3D irq_data_get_irq_chip_data(data);
=20
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 9c3cf58457a7..7d7c916e2234 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1130,6 +1130,7 @@ static irqreturn_t stmpe_irq(int irq, void *data)
 }
=20
 static void stmpe_irq_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct stmpe *stmpe =3D irq_data_get_irq_chip_data(data);
=20
@@ -1137,6 +1138,7 @@ static void stmpe_irq_lock(struct irq_data *data)
 }
=20
 static void stmpe_irq_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct stmpe *stmpe =3D irq_data_get_irq_chip_data(data);
 	struct stmpe_variant_info *variant =3D stmpe->variant;
diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
index 029ecc32f078..56f095a36883 100644
--- a/drivers/mfd/tps65217.c
+++ b/drivers/mfd/tps65217.c
@@ -34,6 +34,7 @@ static const struct resource pb_resources[] =3D {
 };
=20
 static void tps65217_irq_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct tps65217 *tps =3D irq_data_get_irq_chip_data(data);
=20
@@ -41,6 +42,7 @@ static void tps65217_irq_lock(struct irq_data *data)
 }
=20
 static void tps65217_irq_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct tps65217 *tps =3D irq_data_get_irq_chip_data(data);
 	int ret;
diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 82714899efb2..8b61f9737a10 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -228,6 +228,7 @@ static int tps6586x_remove_subdevs(struct tps6586x *t=
ps6586x)
 }
=20
 static void tps6586x_irq_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct tps6586x *tps6586x =3D irq_data_get_irq_chip_data(data);
=20
@@ -256,6 +257,7 @@ static void tps6586x_irq_disable(struct irq_data *irq=
_data)
 }
=20
 static void tps6586x_irq_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct tps6586x *tps6586x =3D irq_data_get_irq_chip_data(data);
 	int i;
diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 87496c1cb8bc..5492af7418f7 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -464,6 +464,7 @@ static int twl4030_sih_set_type(struct irq_data *data=
, unsigned trigger)
 }
=20
 static void twl4030_sih_bus_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct sih_agent	*agent =3D irq_data_get_irq_chip_data(data);
=20
@@ -471,6 +472,7 @@ static void twl4030_sih_bus_lock(struct irq_data *dat=
a)
 }
=20
 static void twl4030_sih_bus_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct sih_agent	*agent =3D irq_data_get_irq_chip_data(data);
 	const struct sih	*sih =3D agent->sih;
diff --git a/drivers/mfd/wm831x-irq.c b/drivers/mfd/wm831x-irq.c
index f1f58e3149ae..b4a535df2d78 100644
--- a/drivers/mfd/wm831x-irq.c
+++ b/drivers/mfd/wm831x-irq.c
@@ -328,6 +328,7 @@ static inline struct wm831x_irq_data *irq_to_wm831x_i=
rq(struct wm831x *wm831x,
 }
=20
 static void wm831x_irq_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct wm831x *wm831x =3D irq_data_get_irq_chip_data(data);
=20
@@ -335,6 +336,7 @@ static void wm831x_irq_lock(struct irq_data *data)
 }
=20
 static void wm831x_irq_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct wm831x *wm831x =3D irq_data_get_irq_chip_data(data);
 	int i;
diff --git a/drivers/mfd/wm8350-irq.c b/drivers/mfd/wm8350-irq.c
index 3709ba3088c0..cd7ac13aacb1 100644
--- a/drivers/mfd/wm8350-irq.c
+++ b/drivers/mfd/wm8350-irq.c
@@ -412,6 +412,7 @@ static irqreturn_t wm8350_irq(int irq, void *irq_data=
)
 }
=20
 static void wm8350_irq_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct wm8350 *wm8350 =3D irq_data_get_irq_chip_data(data);
=20
@@ -419,6 +420,7 @@ static void wm8350_irq_lock(struct irq_data *data)
 }
=20
 static void wm8350_irq_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct wm8350 *wm8350 =3D irq_data_get_irq_chip_data(data);
 	int i;
diff --git a/drivers/misc/cardreader/rtsx_usb.c b/drivers/misc/cardreader=
/rtsx_usb.c
index e0174da5e9fc..db464375bc5f 100644
--- a/drivers/misc/cardreader/rtsx_usb.c
+++ b/drivers/misc/cardreader/rtsx_usb.c
@@ -771,6 +771,7 @@ static int rtsx_usb_reset_resume(struct usb_interface=
 *intf)
=20
=20
 static int rtsx_usb_pre_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct rtsx_ucr *ucr =3D (struct rtsx_ucr *)usb_get_intfdata(intf);
=20
@@ -779,6 +780,7 @@ static int rtsx_usb_pre_reset(struct usb_interface *i=
ntf)
 }
=20
 static int rtsx_usb_post_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct rtsx_ucr *ucr =3D (struct rtsx_ucr *)usb_get_intfdata(intf);
=20
diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
index be011cef12e5..ee4fd92a65c1 100644
--- a/drivers/misc/mei/client.c
+++ b/drivers/misc/mei/client.c
@@ -920,6 +920,7 @@ int mei_cl_irq_disconnect(struct mei_cl *cl, struct m=
ei_cl_cb *cb,
  * Return: 0 on success, <0 on failure.
  */
 static int __mei_cl_disconnect(struct mei_cl *cl)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(cl->dev->device_lock) */
 {
 	struct mei_device *dev;
 	struct mei_cl_cb *cb;
@@ -1120,6 +1121,7 @@ int mei_cl_irq_connect(struct mei_cl *cl, struct me=
i_cl_cb *cb,
  */
 int mei_cl_connect(struct mei_cl *cl, struct mei_me_client *me_cl,
 		   const struct file *fp)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(cl->dev->device_lock) */
 {
 	struct mei_device *dev;
 	struct mei_cl_cb *cb;
@@ -1520,6 +1522,7 @@ int mei_cl_irq_notify(struct mei_cl *cl, struct mei=
_cl_cb *cb,
  */
 int mei_cl_notify_request(struct mei_cl *cl,
 			  const struct file *fp, u8 request)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(cl->dev->device_lock) */
 {
 	struct mei_device *dev;
 	struct mei_cl_cb *cb;
@@ -1624,6 +1627,7 @@ void mei_cl_notify(struct mei_cl *cl)
  * Return: 0 on such and error otherwise.
  */
 int mei_cl_notify_get(struct mei_cl *cl, bool block, bool *notify_ev)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(cl->dev->device_lock) */
 {
 	struct mei_device *dev;
 	int rets;
@@ -1963,6 +1967,7 @@ int mei_cl_irq_write(struct mei_cl *cl, struct mei_=
cl_cb *cb,
  * Return: number of bytes sent on success, <0 on failure.
  */
 ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned l=
ong timeout)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(cl->dev->device_lock) */
 {
 	struct mei_device *dev;
 	struct mei_msg_data *buf;
@@ -2313,6 +2318,7 @@ static void mei_cl_dma_free(struct mei_cl *cl)
  */
 int mei_cl_dma_alloc_and_map(struct mei_cl *cl, const struct file *fp,
 			     u8 buffer_id, size_t size)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(cl->dev->device_lock) */
 {
 	struct mei_device *dev;
 	struct mei_cl_cb *cb;
@@ -2406,6 +2412,7 @@ int mei_cl_dma_alloc_and_map(struct mei_cl *cl, con=
st struct file *fp,
  * Return: 0 on such and error otherwise.
  */
 int mei_cl_dma_unmap(struct mei_cl *cl, const struct file *fp)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(cl->dev->device_lock) */
 {
 	struct mei_device *dev;
 	struct mei_cl_cb *cb;
diff --git a/drivers/misc/mei/hbm.c b/drivers/misc/mei/hbm.c
index 026b1f686c16..5b2f07406dc7 100644
--- a/drivers/misc/mei/hbm.c
+++ b/drivers/misc/mei/hbm.c
@@ -225,6 +225,7 @@ struct mei_cl *mei_hbm_cl_find_by_cmd(struct mei_devi=
ce *dev, void *buf)
  * Return: 0 on success and < 0 on failure
  */
 int mei_hbm_start_wait(struct mei_device *dev)
+	REQUIRES(dev->device_lock)
 {
 	int ret;
=20
diff --git a/drivers/misc/mei/hw-me.c b/drivers/misc/mei/hw-me.c
index d11a0740b47c..1e1ad534862c 100644
--- a/drivers/misc/mei/hw-me.c
+++ b/drivers/misc/mei/hw-me.c
@@ -475,6 +475,7 @@ static void mei_gsc_pxp_check(struct mei_device *dev)
  * Return: 0 on success, error otherwise
  */
 static int mei_me_hw_ready_wait(struct mei_device *dev)
+	REQUIRES(dev->device_lock)
 {
 	mutex_unlock(&dev->device_lock);
 	wait_event_timeout(dev->wait_hw_ready,
@@ -537,6 +538,7 @@ static void mei_me_check_fw_reset(struct mei_device *=
dev)
  * Return: 0 on success, error otherwise
  */
 static int mei_me_hw_start(struct mei_device *dev)
+	REQUIRES(dev->device_lock)
 {
 	int ret =3D mei_me_hw_ready_wait(dev);
=20
@@ -785,6 +787,7 @@ static void mei_me_pg_unset(struct mei_device *dev)
  * Return: 0 on success an error code otherwise
  */
 static int mei_me_pg_legacy_enter_sync(struct mei_device *dev)
+	REQUIRES(dev->device_lock)
 {
 	struct mei_me_hw *hw =3D to_me_hw(dev);
 	int ret;
@@ -822,6 +825,7 @@ static int mei_me_pg_legacy_enter_sync(struct mei_dev=
ice *dev)
  * Return: 0 on success an error code otherwise
  */
 static int mei_me_pg_legacy_exit_sync(struct mei_device *dev)
+	REQUIRES(dev->device_lock)
 {
 	struct mei_me_hw *hw =3D to_me_hw(dev);
 	int ret;
@@ -966,6 +970,7 @@ static u32 mei_me_d0i3_unset(struct mei_device *dev)
  * Return: 0 on success an error code otherwise
  */
 static int mei_me_d0i3_enter_sync(struct mei_device *dev)
+	REQUIRES(dev->device_lock)
 {
 	struct mei_me_hw *hw =3D to_me_hw(dev);
 	int ret;
@@ -1069,6 +1074,7 @@ static int mei_me_d0i3_enter(struct mei_device *dev=
)
  * Return: 0 on success an error code otherwise
  */
 static int mei_me_d0i3_exit_sync(struct mei_device *dev)
+	REQUIRES(dev->device_lock)
 {
 	struct mei_me_hw *hw =3D to_me_hw(dev);
 	int ret;
@@ -1199,6 +1205,7 @@ static void mei_me_pg_intr(struct mei_device *dev, =
u32 intr_source)
  * Return: 0 on success an error code otherwise
  */
 int mei_me_pg_enter_sync(struct mei_device *dev)
+	REQUIRES(dev->device_lock)
 {
 	struct mei_me_hw *hw =3D to_me_hw(dev);
=20
@@ -1216,6 +1223,7 @@ int mei_me_pg_enter_sync(struct mei_device *dev)
  * Return: 0 on success an error code otherwise
  */
 int mei_me_pg_exit_sync(struct mei_device *dev)
+	REQUIRES(dev->device_lock)
 {
 	struct mei_me_hw *hw =3D to_me_hw(dev);
=20
@@ -1234,6 +1242,7 @@ int mei_me_pg_exit_sync(struct mei_device *dev)
  * Return: 0 on success an error code otherwise
  */
 static int mei_me_hw_reset(struct mei_device *dev, bool intr_enable)
+	REQUIRES(dev->device_lock)
 {
 	struct mei_me_hw *hw =3D to_me_hw(dev);
 	int ret;
diff --git a/drivers/misc/mei/hw-txe.c b/drivers/misc/mei/hw-txe.c
index 5d0f68b95c29..3a43b41c214b 100644
--- a/drivers/misc/mei/hw-txe.c
+++ b/drivers/misc/mei/hw-txe.c
@@ -250,6 +250,7 @@ static int mei_txe_aliveness_poll(struct mei_device *=
dev, u32 expected)
  * Return: 0 on success and < 0 otherwise
  */
 static int mei_txe_aliveness_wait(struct mei_device *dev, u32 expected)
+	REQUIRES(dev->device_lock)
 {
 	struct mei_txe_hw *hw =3D to_txe_hw(dev);
 	const unsigned long timeout =3D
@@ -290,6 +291,7 @@ static int mei_txe_aliveness_wait(struct mei_device *=
dev, u32 expected)
  * Return: 0 on success and < 0 otherwise
  */
 int mei_txe_aliveness_set_sync(struct mei_device *dev, u32 req)
+	REQUIRES(dev->device_lock)
 {
 	if (mei_txe_aliveness_set(dev, req))
 		return mei_txe_aliveness_wait(dev, req);
@@ -603,6 +605,7 @@ static inline bool mei_txe_host_is_ready(struct mei_d=
evice *dev)
  * Return: 0 on success and -ETIME on timeout
  */
 static int mei_txe_readiness_wait(struct mei_device *dev)
+	REQUIRES(dev->device_lock)
 {
 	if (mei_txe_hw_is_ready(dev))
 		return 0;
@@ -910,6 +913,7 @@ static int mei_txe_hw_reset(struct mei_device *dev, b=
ool intr_enable)
  * Return: 0 on success an error code otherwise
  */
 static int mei_txe_hw_start(struct mei_device *dev)
+	REQUIRES(dev->device_lock)
 {
 	struct mei_txe_hw *hw =3D to_txe_hw(dev);
 	int ret;
diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index 1f5aaf16e300..bff07f3166b0 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -506,6 +506,7 @@ static int mei_ioctl_connect_vtag(struct file *file,
 				  const uuid_le *in_client_uuid,
 				  struct mei_client *client,
 				  u8 vtag)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(dev->device_lock) */
 {
 	struct mei_device *dev;
 	struct mei_cl *cl;
diff --git a/drivers/misc/ntsync.c b/drivers/misc/ntsync.c
index 055395cde42b..b5772f4eb66f 100644
--- a/drivers/misc/ntsync.c
+++ b/drivers/misc/ntsync.c
@@ -198,6 +198,7 @@ static void obj_unlock(struct ntsync_obj *obj)
 }
=20
 static bool ntsync_lock_obj(struct ntsync_device *dev, struct ntsync_obj=
 *obj)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	bool all;
=20
@@ -213,6 +214,7 @@ static bool ntsync_lock_obj(struct ntsync_device *dev=
, struct ntsync_obj *obj)
 }
=20
 static void ntsync_unlock_obj(struct ntsync_device *dev, struct ntsync_o=
bj *obj, bool all)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	if (all) {
 		dev_unlock_obj(dev, obj);
diff --git a/drivers/misc/sgi-gru/grufault.c b/drivers/misc/sgi-gru/grufa=
ult.c
index 3557d78ee47a..1ddaa6e29765 100644
--- a/drivers/misc/sgi-gru/grufault.c
+++ b/drivers/misc/sgi-gru/grufault.c
@@ -64,6 +64,7 @@ struct vm_area_struct *gru_find_vma(unsigned long vaddr=
)
  */
=20
 static struct gru_thread_state *gru_find_lock_gts(unsigned long vaddr)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct mm_struct *mm =3D current->mm;
 	struct vm_area_struct *vma;
@@ -81,6 +82,7 @@ static struct gru_thread_state *gru_find_lock_gts(unsig=
ned long vaddr)
 }
=20
 static struct gru_thread_state *gru_alloc_locked_gts(unsigned long vaddr=
)
+	NO_THREAD_SAFETY_ANALYSIS /* TRY_ACQUIRE() does not support pointers */
 {
 	struct mm_struct *mm =3D current->mm;
 	struct vm_area_struct *vma;
@@ -107,6 +109,7 @@ static struct gru_thread_state *gru_alloc_locked_gts(=
unsigned long vaddr)
  * Unlock a GTS that was previously locked with gru_find_lock_gts().
  */
 static void gru_unlock_gts(struct gru_thread_state *gts)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the above function */
 {
 	mutex_unlock(&gts->ts_ctxlock);
 	mmap_read_unlock(current->mm);
diff --git a/drivers/misc/sgi-gru/grumain.c b/drivers/misc/sgi-gru/grumai=
n.c
index 3036c15f3689..e30ebc1fba15 100644
--- a/drivers/misc/sgi-gru/grumain.c
+++ b/drivers/misc/sgi-gru/grumain.c
@@ -762,6 +762,7 @@ static int is_gts_stealable(struct gru_thread_state *=
gts,
=20
 static void gts_stolen(struct gru_thread_state *gts,
 		struct gru_blade_state *bs)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	if (is_kernel_context(gts)) {
 		up_write(&bs->bs_kgts_sema);
diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_v=
mci/vmci_queue_pair.c
index 73d71c4ec139..7f29f76142fa 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -608,6 +608,7 @@ static void qp_cleanup_queue_mutex(struct vmci_queue =
*produce_q,
  * be passed in to this routine.  Either will work just fine.
  */
 static void qp_acquire_queue_mutex(struct vmci_queue *queue)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (queue->kernel_if->host)
 		mutex_lock(queue->kernel_if->mutex);
@@ -619,6 +620,7 @@ static void qp_acquire_queue_mutex(struct vmci_queue =
*queue)
  * be passed in to this routine.  Either will work just fine.
  */
 static void qp_release_queue_mutex(struct vmci_queue *queue)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	if (queue->kernel_if->host)
 		mutex_unlock(queue->kernel_if->mutex);
diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index fd67c0682b38..d7aeb08ac82e 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -2393,6 +2393,7 @@ static int vub300_resume(struct usb_interface *intf=
)
 #define vub300_resume NULL
 #endif
 static int vub300_pre_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {				/* NOT irq */
 	struct vub300_mmc_host *vub300 =3D usb_get_intfdata(intf);
 	mutex_lock(&vub300->cmd_mutex);
@@ -2400,6 +2401,7 @@ static int vub300_pre_reset(struct usb_interface *i=
ntf)
 }
=20
 static int vub300_post_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {				/* NOT irq */
 	struct vub300_mmc_host *vub300 =3D usb_get_intfdata(intf);
 	/* we are sure no URBs are active - no locking needed */
diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_=
cmdset_0001.c
index c10693ba265b..344a2f5e2194 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -825,6 +825,7 @@ static int cfi_intelext_partition_fixup(struct mtd_in=
fo *mtd,
  *  *********** CHIP ACCESS FUNCTIONS ***********
  */
 static int chip_ready (struct map_info *map, struct flchip *chip, unsign=
ed long adr, int mode)
+	REQUIRES(chip->mutex)
 {
 	DECLARE_WAITQUEUE(wait, current);
 	struct cfi_private *cfi =3D map->fldrv_priv;
@@ -942,6 +943,7 @@ static int chip_ready (struct map_info *map, struct f=
lchip *chip, unsigned long
 }
=20
 static int get_chip(struct map_info *map, struct flchip *chip, unsigned =
long adr, int mode)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret;
 	DECLARE_WAITQUEUE(wait, current);
@@ -1038,6 +1040,7 @@ static int get_chip(struct map_info *map, struct fl=
chip *chip, unsigned long adr
 }
=20
 static void put_chip(struct map_info *map, struct flchip *chip, unsigned=
 long adr)
+	REQUIRES(chip->mutex)
 {
 	struct cfi_private *cfi =3D map->fldrv_priv;
=20
@@ -1290,6 +1293,7 @@ static int inval_cache_and_wait_for_operation(
 		struct map_info *map, struct flchip *chip,
 		unsigned long cmd_adr, unsigned long inval_adr, int inval_len,
 		unsigned int chip_op_time, unsigned int chip_op_time_max)
+	REQUIRES(chip->mutex)
 {
 	struct cfi_private *cfi =3D map->fldrv_priv;
 	map_word status, status_OK =3D CMD(0x80);
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
index 7c91429a670b..ebdf7a98b74b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -872,6 +872,7 @@ static int __xipram chip_good(struct map_info *map, s=
truct flchip *chip,
 }
=20
 static int get_chip(struct map_info *map, struct flchip *chip, unsigned =
long adr, int mode)
+	REQUIRES(chip->mutex)
 {
 	DECLARE_WAITQUEUE(wait, current);
 	struct cfi_private *cfi =3D map->fldrv_priv;
@@ -1645,6 +1646,7 @@ static int __xipram do_write_oneword_once(struct ma=
p_info *map,
 					  struct flchip *chip,
 					  unsigned long adr, map_word datum,
 					  int mode, struct cfi_private *cfi)
+	REQUIRES(chip->mutex)
 {
 	unsigned long timeo;
 	/*
@@ -1715,6 +1717,7 @@ static int __xipram do_write_oneword_once(struct ma=
p_info *map,
 static int __xipram do_write_oneword_start(struct map_info *map,
 					   struct flchip *chip,
 					   unsigned long adr, int mode)
+	TRY_ACQUIRE(0, chip->mutex)
 {
 	int ret;
=20
@@ -1735,6 +1738,7 @@ static int __xipram do_write_oneword_start(struct m=
ap_info *map,
 static void __xipram do_write_oneword_done(struct map_info *map,
 					   struct flchip *chip,
 					   unsigned long adr, int mode)
+	RELEASE(chip->mutex)
 {
 	if (mode =3D=3D FL_OTP_WRITE)
 		otp_exit(map, chip, adr, map_bankwidth(map));
@@ -1750,6 +1754,7 @@ static int __xipram do_write_oneword_retry(struct m=
ap_info *map,
 					   struct flchip *chip,
 					   unsigned long adr, map_word datum,
 					   int mode)
+	REQUIRES(chip->mutex)
 {
 	struct cfi_private *cfi =3D map->fldrv_priv;
 	int ret =3D 0;
@@ -1937,6 +1942,7 @@ static int cfi_amdstd_write_words(struct mtd_info *=
mtd, loff_t to, size_t len,
 static int __xipram do_write_buffer_wait(struct map_info *map,
 					 struct flchip *chip, unsigned long adr,
 					 map_word datum)
+	REQUIRES(chip->mutex)
 {
 	unsigned long timeo;
 	unsigned long u_write_timeout;
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmd=
s.c
index 14e36ae71958..fddf37415a6c 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -124,6 +124,7 @@ static void print_drs_error(unsigned int dsr)
=20
 static int wait_for_ready(struct map_info *map, struct flchip *chip,
 		unsigned int chip_op_time)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	unsigned int timeo, reset_timeo, sleep_time;
 	unsigned int dsr;
@@ -196,6 +197,7 @@ static int wait_for_ready(struct map_info *map, struc=
t flchip *chip,
 }
=20
 static int get_chip(struct map_info *map, struct flchip *chip, int mode)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret;
 	DECLARE_WAITQUEUE(wait, current);
@@ -292,6 +294,7 @@ static int get_chip(struct map_info *map, struct flch=
ip *chip, int mode)
 }
=20
 static int chip_ready(struct map_info *map, struct flchip *chip, int mod=
e)
+	REQUIRES(chip->mutex)
 {
 	struct lpddr_private *lpddr =3D map->fldrv_priv;
 	int ret =3D 0;
@@ -346,6 +349,7 @@ static int chip_ready(struct map_info *map, struct fl=
chip *chip, int mode)
 }
=20
 static void put_chip(struct map_info *map, struct flchip *chip)
+	REQUIRES(chip->mutex)
 {
 	if (chip->priv) {
 		struct flchip_shared *shared =3D chip->priv;
diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
index c75bb8b80cc1..4cc57bc50f30 100644
--- a/drivers/mtd/nand/ecc-mtk.c
+++ b/drivers/mtd/nand/ecc-mtk.c
@@ -301,6 +301,7 @@ struct mtk_ecc *of_mtk_ecc_get(struct device_node *of=
_node)
 EXPORT_SYMBOL(of_mtk_ecc_get);
=20
 int mtk_ecc_enable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
+	TRY_ACQUIRE(0, ecc->lock)
 {
 	enum mtk_ecc_operation op =3D config->op;
 	u16 reg_val;
@@ -345,6 +346,7 @@ int mtk_ecc_enable(struct mtk_ecc *ecc, struct mtk_ec=
c_config *config)
 EXPORT_SYMBOL(mtk_ecc_enable);
=20
 void mtk_ecc_disable(struct mtk_ecc *ecc)
+	RELEASE(ecc->lock)
 {
 	enum mtk_ecc_operation op =3D ECC_ENCODE;
=20
diff --git a/drivers/mtd/nand/ecc-mxic.c b/drivers/mtd/nand/ecc-mxic.c
index 56b56f726b99..325e7157dd0e 100644
--- a/drivers/mtd/nand/ecc-mxic.c
+++ b/drivers/mtd/nand/ecc-mxic.c
@@ -667,6 +667,7 @@ static int mxic_ecc_finish_io_req_external(struct nan=
d_device *nand,
 /* Pipelined ECC engine helpers */
 static int mxic_ecc_prepare_io_req_pipelined(struct nand_device *nand,
 					     struct nand_page_io_req *req)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mxic_ecc_engine *mxic =3D nand_to_mxic(nand);
 	struct mxic_ecc_ctx *ctx =3D nand_to_ecc_ctx(nand);
@@ -699,6 +700,7 @@ static int mxic_ecc_prepare_io_req_pipelined(struct n=
and_device *nand,
=20
 static int mxic_ecc_finish_io_req_pipelined(struct nand_device *nand,
 					    struct nand_page_io_req *req)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mxic_ecc_engine *mxic =3D nand_to_mxic(nand);
 	struct mxic_ecc_ctx *ctx =3D nand_to_ecc_ctx(nand);
diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/at=
mel/pmecc.c
index 3c7dee1be21d..cdbac3965a54 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.c
+++ b/drivers/mtd/nand/raw/atmel/pmecc.c
@@ -762,6 +762,7 @@ void atmel_pmecc_reset(struct atmel_pmecc *pmecc)
 EXPORT_SYMBOL_GPL(atmel_pmecc_reset);
=20
 int atmel_pmecc_enable(struct atmel_pmecc_user *user, int op)
+	TRY_ACQUIRE(0, user->pmecc->lock)
 {
 	struct atmel_pmecc *pmecc =3D user->pmecc;
 	u32 cfg;
@@ -792,6 +793,7 @@ int atmel_pmecc_enable(struct atmel_pmecc_user *user,=
 int op)
 EXPORT_SYMBOL_GPL(atmel_pmecc_enable);
=20
 void atmel_pmecc_disable(struct atmel_pmecc_user *user)
+	RELEASE(user->pmecc->lock)
 {
 	atmel_pmecc_reset(user->pmecc);
 	mutex_unlock(&user->pmecc->lock);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand=
_base.c
index 53e16d39af4b..01b8d2342363 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -207,6 +207,8 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
  * Release chip lock and wake up anyone waiting on the device.
  */
 static void nand_release_device(struct nand_chip *chip)
+	RELEASE(chip->controller->lock)
+	RELEASE(chip->lock)
 {
 	/* Release the controller and the chip */
 	mutex_unlock(&chip->controller->lock);
@@ -336,6 +338,8 @@ static int nand_isbad_bbm(struct nand_chip *chip, lof=
f_t ofs)
  * Lock the device and its controller for exclusive access
  */
 static void nand_get_device(struct nand_chip *chip)
+	ACQUIRE(chip->lock)
+	ACQUIRE(chip->controller->lock)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi=
-nor/controllers/hisi-sfc.c
index db948da2c4c5..95312947f226 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -145,6 +145,7 @@ static void hisi_spi_nor_init(struct hifmc_host *host=
)
 }
=20
 static int hisi_spi_nor_prep(struct spi_nor *nor)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct hifmc_priv *priv =3D nor->priv;
 	struct hifmc_host *host =3D priv->host;
@@ -168,6 +169,7 @@ static int hisi_spi_nor_prep(struct spi_nor *nor)
 }
=20
 static void hisi_spi_nor_unprep(struct spi_nor *nor)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct hifmc_priv *priv =3D nor->priv;
 	struct hifmc_host *host =3D priv->host;
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 19eb98bd6821..b4a83d730a4b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1283,6 +1283,7 @@ static void spi_nor_rww_end_exclusive(struct spi_no=
r *nor)
 }
=20
 int spi_nor_prep_and_lock(struct spi_nor *nor)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret;
=20
@@ -1300,6 +1301,7 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
 }
=20
 void spi_nor_unlock_and_unprep(struct spi_nor *nor)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (!spi_nor_use_parallel_locking(nor)) {
 		mutex_unlock(&nor->lock);
@@ -1360,6 +1362,7 @@ static void spi_nor_rww_end_pe(struct spi_nor *nor,=
 loff_t start, size_t len)
 }
=20
 static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, s=
ize_t len)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret;
=20
@@ -1377,6 +1380,7 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor =
*nor, loff_t start, size_t le
 }
=20
 static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t sta=
rt, size_t len)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (!spi_nor_use_parallel_locking(nor)) {
 		mutex_unlock(&nor->lock);
@@ -1439,6 +1443,7 @@ static void spi_nor_rww_end_rd(struct spi_nor *nor,=
 loff_t start, size_t len)
 }
=20
 static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, s=
ize_t len)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret;
=20
@@ -1456,6 +1461,7 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor =
*nor, loff_t start, size_t le
 }
=20
 static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t sta=
rt, size_t len)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (!spi_nor_use_parallel_locking(nor)) {
 		mutex_unlock(&nor->lock);
diff --git a/drivers/net/can/softing/softing_main.c b/drivers/net/can/sof=
ting/softing_main.c
index 278ee8722770..d0d73cd3bda9 100644
--- a/drivers/net/can/softing/softing_main.c
+++ b/drivers/net/can/softing/softing_main.c
@@ -445,6 +445,7 @@ int softing_enable_irq(struct softing *card, int enab=
le)
 }
=20
 static void softing_card_shutdown(struct softing *card)
+	NO_THREAD_SAFETY_ANALYSIS /* please fix locking in this function */
 {
 	int fw_up =3D 0;
=20
diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/mic=
rochip/ksz_common.c
index 89f0796894af..87bc7200915d 100644
--- a/drivers/net/dsa/microchip/ksz_common.c
+++ b/drivers/net/dsa/microchip/ksz_common.c
@@ -2606,6 +2606,7 @@ static void ksz_irq_unmask(struct irq_data *d)
 }
=20
 static void ksz_irq_bus_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct ksz_irq *kirq  =3D irq_data_get_irq_chip_data(d);
=20
@@ -2613,6 +2614,7 @@ static void ksz_irq_bus_lock(struct irq_data *d)
 }
=20
 static void ksz_irq_bus_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct ksz_irq *kirq  =3D irq_data_get_irq_chip_data(d);
 	struct ksz_device *dev =3D kirq->dev;
diff --git a/drivers/net/dsa/microchip/ksz_common.h b/drivers/net/dsa/mic=
rochip/ksz_common.h
index af17a9c030d4..c1ed90649a46 100644
--- a/drivers/net/dsa/microchip/ksz_common.h
+++ b/drivers/net/dsa/microchip/ksz_common.h
@@ -671,12 +671,14 @@ static inline int ksz_prmw32(struct ksz_device *dev=
, int port, int offset,
 }
=20
 static inline void ksz_regmap_lock(void *__mtx)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mutex *mtx =3D __mtx;
 	mutex_lock(mtx);
 }
=20
 static inline void ksz_regmap_unlock(void *__mtx)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mutex *mtx =3D __mtx;
 	mutex_unlock(mtx);
diff --git a/drivers/net/dsa/microchip/ksz_ptp.c b/drivers/net/dsa/microc=
hip/ksz_ptp.c
index 22fb9ef4645c..c54ba809f84b 100644
--- a/drivers/net/dsa/microchip/ksz_ptp.c
+++ b/drivers/net/dsa/microchip/ksz_ptp.c
@@ -1040,6 +1040,7 @@ static void ksz_ptp_irq_unmask(struct irq_data *d)
 }
=20
 static void ksz_ptp_irq_bus_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct ksz_irq *kirq  =3D irq_data_get_irq_chip_data(d);
=20
@@ -1047,6 +1048,7 @@ static void ksz_ptp_irq_bus_lock(struct irq_data *d=
)
 }
=20
 static void ksz_ptp_irq_bus_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct ksz_irq *kirq  =3D irq_data_get_irq_chip_data(d);
 	struct ksz_device *dev =3D kirq->dev;
diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.=
c
index 51df42ccdbe6..26174927160f 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -65,12 +65,14 @@ mt7530_regmap_read(void *context, unsigned int reg, u=
nsigned int *val)
=20
 static void
 mt7530_mdio_regmap_lock(void *mdio_lock)
+	NO_THREAD_SAFETY_ANALYSIS /* argument has type void * */
 {
 	mutex_lock_nested(mdio_lock, MDIO_MUTEX_NESTED);
 }
=20
 static void
 mt7530_mdio_regmap_unlock(void *mdio_lock)
+	NO_THREAD_SAFETY_ANALYSIS /* argument has type void * */
 {
 	mutex_unlock(mdio_lock);
 }
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 1c83af805209..c35bb3f9b34d 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -77,6 +77,7 @@ static const struct mt7530_mib_desc mt7530_mib[] =3D {
=20
 static void
 mt7530_mutex_lock(struct mt7530_priv *priv)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (priv->bus)
 		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
@@ -84,6 +85,7 @@ mt7530_mutex_lock(struct mt7530_priv *priv)
=20
 static void
 mt7530_mutex_unlock(struct mt7530_priv *priv)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (priv->bus)
 		mutex_unlock(&priv->bus->mdio_lock);
diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx=
/chip.c
index 68d1e891752b..964cd966b3b2 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -206,6 +206,7 @@ static irqreturn_t mv88e6xxx_g1_irq_thread_fn(int irq=
, void *dev_id)
 }
=20
 static void mv88e6xxx_g1_irq_bus_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mv88e6xxx_chip *chip =3D irq_data_get_irq_chip_data(d);
=20
@@ -213,6 +214,7 @@ static void mv88e6xxx_g1_irq_bus_lock(struct irq_data=
 *d)
 }
=20
 static void mv88e6xxx_g1_irq_bus_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mv88e6xxx_chip *chip =3D irq_data_get_irq_chip_data(d);
 	u16 mask =3D GENMASK(chip->g1_irq.nirqs, 0);
@@ -342,6 +344,7 @@ static int mv88e6xxx_g1_irq_setup_common(struct mv88e=
6xxx_chip *chip)
 }
=20
 static int mv88e6xxx_g1_irq_setup(struct mv88e6xxx_chip *chip)
+	REQUIRES(chip->reg_lock)
 {
 	static struct lock_class_key lock_key;
 	static struct lock_class_key request_key;
diff --git a/drivers/net/dsa/mv88e6xxx/chip.h b/drivers/net/dsa/mv88e6xxx=
/chip.h
index 86bf113c9bfa..0bf49514adc9 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.h
+++ b/drivers/net/dsa/mv88e6xxx/chip.h
@@ -830,11 +830,13 @@ int mv88e6xxx_wait_bit(struct mv88e6xxx_chip *chip,=
 int addr, int reg,
 struct mii_bus *mv88e6xxx_default_mdio_bus(struct mv88e6xxx_chip *chip);
=20
 static inline void mv88e6xxx_reg_lock(struct mv88e6xxx_chip *chip)
+	ACQUIRE(chip->reg_lock)
 {
 	mutex_lock(&chip->reg_lock);
 }
=20
 static inline void mv88e6xxx_reg_unlock(struct mv88e6xxx_chip *chip)
+	RELEASE(chip->reg_lock)
 {
 	mutex_unlock(&chip->reg_lock);
 }
diff --git a/drivers/net/dsa/mv88e6xxx/global2.c b/drivers/net/dsa/mv88e6=
xxx/global2.c
index b2b5f6ba438f..cbc8c85e45f9 100644
--- a/drivers/net/dsa/mv88e6xxx/global2.c
+++ b/drivers/net/dsa/mv88e6xxx/global2.c
@@ -1082,6 +1082,7 @@ static irqreturn_t mv88e6xxx_g2_irq_thread_fn(int i=
rq, void *dev_id)
 }
=20
 static void mv88e6xxx_g2_irq_bus_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mv88e6xxx_chip *chip =3D irq_data_get_irq_chip_data(d);
=20
@@ -1089,6 +1090,7 @@ static void mv88e6xxx_g2_irq_bus_lock(struct irq_da=
ta *d)
 }
=20
 static void mv88e6xxx_g2_irq_bus_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mv88e6xxx_chip *chip =3D irq_data_get_irq_chip_data(d);
 	int err;
diff --git a/drivers/net/dsa/mv88e6xxx/pcs-6352.c b/drivers/net/dsa/mv88e=
6xxx/pcs-6352.c
index 143fe21d1834..0608f388cd43 100644
--- a/drivers/net/dsa/mv88e6xxx/pcs-6352.c
+++ b/drivers/net/dsa/mv88e6xxx/pcs-6352.c
@@ -36,6 +36,7 @@ static struct marvell_c22_pcs *pcs_to_marvell_c22_pcs(s=
truct phylink_pcs *pcs)
 }
=20
 static int marvell_c22_pcs_set_fiber_page(struct marvell_c22_pcs *mpcs)
+	ACQUIRE(mpcs->mdio.bus->mdio_lock)
 {
 	u16 page;
 	int err;
@@ -66,6 +67,7 @@ static int marvell_c22_pcs_set_fiber_page(struct marvel=
l_c22_pcs *mpcs)
=20
 static int marvell_c22_pcs_restore_page(struct marvell_c22_pcs *mpcs,
 					int oldpage, int ret)
+	RELEASE(mpcs->mdio.bus->mdio_lock)
 {
 	int err;
=20
diff --git a/drivers/net/dsa/mv88e6xxx/phy.c b/drivers/net/dsa/mv88e6xxx/=
phy.c
index 8bb88b3d900d..1be6fbaf09e8 100644
--- a/drivers/net/dsa/mv88e6xxx/phy.c
+++ b/drivers/net/dsa/mv88e6xxx/phy.c
@@ -188,6 +188,7 @@ static void mv88e6xxx_phy_ppu_reenable_timer(struct t=
imer_list *t)
 }
=20
 static int mv88e6xxx_phy_ppu_access_get(struct mv88e6xxx_chip *chip)
+	TRY_ACQUIRE(0, chip->ppu_mutex)
 {
 	int ret;
=20
@@ -214,6 +215,7 @@ static int mv88e6xxx_phy_ppu_access_get(struct mv88e6=
xxx_chip *chip)
 }
=20
 static void mv88e6xxx_phy_ppu_access_put(struct mv88e6xxx_chip *chip)
+	RELEASE(chip->ppu_mutex)
 {
 	/* Schedule a timer to re-enable the PHY polling unit. */
 	mod_timer(&chip->ppu_timer, jiffies + msecs_to_jiffies(10));
diff --git a/drivers/net/dsa/qca/ar9331.c b/drivers/net/dsa/qca/ar9331.c
index e9f2c67bc15f..98c9f30af6ca 100644
--- a/drivers/net/dsa/qca/ar9331.c
+++ b/drivers/net/dsa/qca/ar9331.c
@@ -749,6 +749,7 @@ static void ar9331_sw_unmask_irq(struct irq_data *d)
 }
=20
 static void ar9331_sw_irq_bus_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct ar9331_sw_priv *priv =3D irq_data_get_irq_chip_data(d);
=20
@@ -756,6 +757,7 @@ static void ar9331_sw_irq_bus_lock(struct irq_data *d=
)
 }
=20
 static void ar9331_sw_irq_bus_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct ar9331_sw_priv *priv =3D irq_data_get_irq_chip_data(d);
 	struct regmap *regmap =3D priv->regmap;
diff --git a/drivers/net/dsa/realtek/rtl83xx.c b/drivers/net/dsa/realtek/=
rtl83xx.c
index 2b9bd4462714..92a0d8ef2ada 100644
--- a/drivers/net/dsa/realtek/rtl83xx.c
+++ b/drivers/net/dsa/realtek/rtl83xx.c
@@ -20,6 +20,7 @@
  * Return: nothing
  */
 void rtl83xx_lock(void *ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct realtek_priv *priv =3D ctx;
=20
@@ -37,6 +38,7 @@ EXPORT_SYMBOL_NS_GPL(rtl83xx_lock, "REALTEK_DSA");
  * Return: nothing
  */
 void rtl83xx_unlock(void *ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct realtek_priv *priv =3D ctx;
=20
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c b/drivers/net/et=
hernet/amd/xgbe/xgbe-phy-v2.c
index 268399dfcf22..b40079345487 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c
@@ -556,11 +556,13 @@ static int xgbe_phy_sfp_get_mux(struct xgbe_prv_dat=
a *pdata)
 }
=20
 static void xgbe_phy_put_comm_ownership(struct xgbe_prv_data *pdata)
+	RELEASE(xgbe_phy_comm_lock)
 {
 	mutex_unlock(&xgbe_phy_comm_lock);
 }
=20
 static int xgbe_phy_get_comm_ownership(struct xgbe_prv_data *pdata)
+	TRY_ACQUIRE(0, xgbe_phy_comm_lock)
 {
 	struct xgbe_phy_data *phy_data =3D pdata->phy_data;
 	unsigned long timeout;
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c b/drivers/ne=
t/ethernet/broadcom/bnx2x/bnx2x_cmn.c
index a8e07e51418f..7b2c94ca56ed 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
@@ -1166,6 +1166,7 @@ static irqreturn_t bnx2x_msix_fp_int(int irq, void =
*fp_cookie)
=20
 /* HW Lock for shared dual port PHYs */
 void bnx2x_acquire_phy_lock(struct bnx2x *bp)
+	ACQUIRE(bp->port.phy_mutex)
 {
 	mutex_lock(&bp->port.phy_mutex);
=20
@@ -1173,6 +1174,7 @@ void bnx2x_acquire_phy_lock(struct bnx2x *bp)
 }
=20
 void bnx2x_release_phy_lock(struct bnx2x *bp)
+	RELEASE(bp->port.phy_mutex)
 {
 	bnx2x_release_hw_lock(bp, HW_LOCK_RESOURCE_MDIO);
=20
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c b/drivers/=
net/ethernet/broadcom/bnx2x/bnx2x_sriov.c
index 12198fc3ab22..a05ad1f19a84 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c
@@ -2297,6 +2297,7 @@ int bnx2x_vf_release(struct bnx2x *bp, struct bnx2x=
_virtf *vf)
=20
 void bnx2x_lock_vf_pf_channel(struct bnx2x *bp, struct bnx2x_virtf *vf,
 			      enum channel_tlvs tlv)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	/* we don't lock the channel for unsupported tlvs */
 	if (!bnx2x_tlv_supported(tlv)) {
@@ -2317,6 +2318,7 @@ void bnx2x_lock_vf_pf_channel(struct bnx2x *bp, str=
uct bnx2x_virtf *vf,
=20
 void bnx2x_unlock_vf_pf_channel(struct bnx2x *bp, struct bnx2x_virtf *vf=
,
 				enum channel_tlvs expected_tlv)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	enum channel_tlvs current_tlv;
=20
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c b/drivers/n=
et/ethernet/broadcom/bnx2x/bnx2x_vfpf.c
index 8946a931e87e..300c8a7fdbcd 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c
@@ -39,6 +39,7 @@ static void bnx2x_add_tlv(struct bnx2x *bp, void *tlvs_=
list,
 /* Clear the mailbox and init the header of the first tlv */
 static void bnx2x_vfpf_prep(struct bnx2x *bp, struct vfpf_first_tlv *fir=
st_tlv,
 			    u16 type, u16 length)
+	ACQUIRE(bp->vf2pf_mutex)
 {
 	mutex_lock(&bp->vf2pf_mutex);
=20
@@ -58,6 +59,7 @@ static void bnx2x_vfpf_prep(struct bnx2x *bp, struct vf=
pf_first_tlv *first_tlv,
 /* releases the mailbox */
 static void bnx2x_vfpf_finalize(struct bnx2x *bp,
 				struct vfpf_first_tlv *first_tlv)
+	RELEASE(bp->vf2pf_mutex)
 {
 	DP(BNX2X_MSG_IOV, "done sending [%d] tlv over vf pf channel\n",
 	   first_tlv->tl.type);
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c b/drivers/net=
/ethernet/broadcom/bnxt/bnxt_hwrm.c
index d2fd2d04ed47..dfcdee91693f 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
@@ -368,6 +368,7 @@ static int __hwrm_to_stderr(u32 hwrm_err)
=20
 static struct bnxt_hwrm_wait_token *
 __hwrm_acquire_token(struct bnxt *bp, enum bnxt_hwrm_chnl dst)
+	NO_THREAD_SAFETY_ANALYSIS /* TRY_ACQUIRE() does not support pointers */
 {
 	struct bnxt_hwrm_wait_token *token;
=20
@@ -391,6 +392,7 @@ __hwrm_acquire_token(struct bnxt *bp, enum bnxt_hwrm_=
chnl dst)
=20
 static void
 __hwrm_release_token(struct bnxt *bp, struct bnxt_hwrm_wait_token *token=
)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the above function */
 {
 	if (token->dst =3D=3D BNXT_HWRM_CHNL_CHIMP) {
 		hlist_del_rcu(&token->node);
diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/b=
roadcom/tg3.c
index 1c94bf1db718..4a1c9dacf4dc 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -11262,6 +11262,7 @@ static int tg3_restart_hw(struct tg3 *tp, bool re=
set_phy)
 	__acquires(tp->lock)
 	__releases(tp->dev->lock)
 	__acquires(tp->dev->lock)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(tp->dev->lock) */
 {
 	int err;
=20
diff --git a/drivers/net/ethernet/davicom/dm9000.c b/drivers/net/ethernet=
/davicom/dm9000.c
index b87eaf0c250c..914a18a38082 100644
--- a/drivers/net/ethernet/davicom/dm9000.c
+++ b/drivers/net/ethernet/davicom/dm9000.c
@@ -319,6 +319,7 @@ dm9000_phy_read(struct net_device *dev, int phy_reg_u=
nused, int reg)
 static void
 dm9000_phy_write(struct net_device *dev,
 		 int phyaddr_unused, int reg, int value)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct board_info *db =3D netdev_priv(dev);
 	unsigned long flags;
diff --git a/drivers/net/ethernet/davicom/dm9051.c b/drivers/net/ethernet=
/davicom/dm9051.c
index 59ea48d4c9de..150c3f5e6d72 100644
--- a/drivers/net/ethernet/davicom/dm9051.c
+++ b/drivers/net/ethernet/davicom/dm9051.c
@@ -456,6 +456,7 @@ static int dm9051_mdio_write(struct mii_bus *bus, int=
 addr, int regnum, u16 val)
 }
=20
 static void dm9051_reg_lock_mutex(void *dbcontext)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct board_info *db =3D dbcontext;
=20
@@ -463,6 +464,7 @@ static void dm9051_reg_lock_mutex(void *dbcontext)
 }
=20
 static void dm9051_reg_unlock_mutex(void *dbcontext)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct board_info *db =3D dbcontext;
=20
diff --git a/drivers/net/ethernet/emulex/benet/be_cmds.c b/drivers/net/et=
hernet/emulex/benet/be_cmds.c
index 61adcebeef01..a1c571634b6e 100644
--- a/drivers/net/ethernet/emulex/benet/be_cmds.c
+++ b/drivers/net/ethernet/emulex/benet/be_cmds.c
@@ -864,6 +864,7 @@ static bool use_mcc(struct be_adapter *adapter)
=20
 /* Must be used only in process context */
 static int be_cmd_lock(struct be_adapter *adapter)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (use_mcc(adapter)) {
 		mutex_lock(&adapter->mcc_lock);
@@ -875,6 +876,7 @@ static int be_cmd_lock(struct be_adapter *adapter)
=20
 /* Must be used only in process context */
 static void be_cmd_unlock(struct be_adapter *adapter)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	if (use_mcc(adapter))
 		return mutex_unlock(&adapter->mcc_lock);
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c b/drivers/n=
et/ethernet/freescale/dpaa2/dpaa2-eth.c
index 29886a8ba73f..95b794a048c0 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
@@ -1120,6 +1120,7 @@ void dpaa2_eth_free_tx_fd(struct dpaa2_eth_priv *pr=
iv,
 			  struct dpaa2_eth_channel *ch,
 			  struct dpaa2_eth_fq *fq,
 			  const struct dpaa2_fd *fd, bool in_napi)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct device *dev =3D priv->net_dev->dev.parent;
 	dma_addr_t fd_addr, sg_addr;
@@ -1519,6 +1520,7 @@ static netdev_tx_t __dpaa2_eth_tx(struct sk_buff *s=
kb,
 }
=20
 static void dpaa2_eth_tx_onestep_tstamp(struct work_struct *work)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct dpaa2_eth_priv *priv =3D container_of(work, struct dpaa2_eth_pri=
v,
 						   tx_onestep_tstamp);
diff --git a/drivers/net/ethernet/hisilicon/hns3/hnae3.c b/drivers/net/et=
hernet/hisilicon/hns3/hnae3.c
index b25fb400f476..24a1cc961bee 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hnae3.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hnae3.c
@@ -44,12 +44,14 @@ static DEFINE_MUTEX(hnae3_common_lock);
 static DEFINE_MUTEX(hnae3_unload_lock);
=20
 void hnae3_acquire_unload_lock(void)
+	ACQUIRE(hnae3_unload_lock)
 {
 	mutex_lock(&hnae3_unload_lock);
 }
 EXPORT_SYMBOL(hnae3_acquire_unload_lock);
=20
 void hnae3_release_unload_lock(void)
+	RELEASE(hnae3_unload_lock)
 {
 	mutex_unlock(&hnae3_unload_lock);
 }
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/dr=
ivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 3f17b3073e50..2b25e1d0f9d2 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -8461,6 +8461,7 @@ static void hclge_reset_umv_space(struct hclge_dev =
*hdev)
 }
=20
 static bool hclge_is_umv_space_full(struct hclge_vport *vport, bool need=
_lock)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct hclge_dev *hdev =3D vport->back;
 	bool is_full;
diff --git a/drivers/net/ethernet/intel/e1000e/82571.c b/drivers/net/ethe=
rnet/intel/e1000e/82571.c
index 969f855a79ee..792f9516b5af 100644
--- a/drivers/net/ethernet/intel/e1000e/82571.c
+++ b/drivers/net/ethernet/intel/e1000e/82571.c
@@ -559,6 +559,7 @@ static DEFINE_MUTEX(swflag_mutex);
  *
  **/
 static s32 e1000_get_hw_semaphore_82574(struct e1000_hw *hw)
+	TRY_ACQUIRE(0, swflag_mutex)
 {
 	s32 ret_val;
=20
@@ -577,6 +578,7 @@ static s32 e1000_get_hw_semaphore_82574(struct e1000_=
hw *hw)
  *
  **/
 static void e1000_put_hw_semaphore_82574(struct e1000_hw *hw)
+	RELEASE(swflag_mutex)
 {
 	e1000_put_hw_semaphore_82573(hw);
 	mutex_unlock(&swflag_mutex);
@@ -940,6 +942,7 @@ static s32 e1000_set_d0_lplu_state_82571(struct e1000=
_hw *hw, bool active)
  *  This resets the hardware into a known state.
  **/
 static s32 e1000_reset_hw_82571(struct e1000_hw *hw)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	u32 ctrl, ctrl_ext, eecd, tctl;
 	s32 ret_val;
diff --git a/drivers/net/ethernet/intel/e1000e/ich8lan.c b/drivers/net/et=
hernet/intel/e1000e/ich8lan.c
index 2f9655cf5dd9..5fad4138efca 100644
--- a/drivers/net/ethernet/intel/e1000e/ich8lan.c
+++ b/drivers/net/ethernet/intel/e1000e/ich8lan.c
@@ -1788,6 +1788,7 @@ static DEFINE_MUTEX(nvm_mutex);
  *  Acquires the mutex for performing NVM operations.
  **/
 static s32 e1000_acquire_nvm_ich8lan(struct e1000_hw __always_unused *hw=
)
+	ACQUIRE(nvm_mutex)
 {
 	mutex_lock(&nvm_mutex);
=20
@@ -1801,6 +1802,7 @@ static s32 e1000_acquire_nvm_ich8lan(struct e1000_h=
w __always_unused *hw)
  *  Releases the mutex used while performing NVM operations.
  **/
 static void e1000_release_nvm_ich8lan(struct e1000_hw __always_unused *h=
w)
+	RELEASE(nvm_mutex)
 {
 	mutex_unlock(&nvm_mutex);
 }
diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/et=
hernet/intel/iavf/iavf_main.c
index 852e5b62f0a5..70ffb4a70b4a 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -1981,6 +1981,7 @@ static int iavf_reinit_interrupt_scheme(struct iavf=
_adapter *adapter, bool runni
  * Do work that needs both RTNL and crit_lock.
  **/
 static void iavf_finish_config(struct work_struct *work)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	struct iavf_adapter *adapter;
 	bool netdev_released =3D false;
diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/et=
hernet/intel/ice/ice_common.c
index 7a2a2e8da8fa..a1b16affc239 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.c
+++ b/drivers/net/ethernet/intel/ice/ice_common.c
@@ -1717,6 +1717,7 @@ ice_sq_send_cmd_retry(struct ice_hw *hw, struct ice=
_ctl_q_info *cq,
 int
 ice_aq_send_cmd(struct ice_hw *hw, struct ice_aq_desc *desc, void *buf,
 		u16 buf_size, struct ice_sq_cd *cd)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct ice_aqc_req_res *cmd =3D &desc->params.res_owner;
 	bool lock_acquired =3D false;
diff --git a/drivers/net/ethernet/intel/ice/ice_ddp.c b/drivers/net/ether=
net/intel/ice/ice_ddp.c
index 03988be03729..112322437de2 100644
--- a/drivers/net/ethernet/intel/ice/ice_ddp.c
+++ b/drivers/net/ethernet/intel/ice/ice_ddp.c
@@ -1135,6 +1135,7 @@ static enum ice_ddp_state ice_map_aq_err_to_ddp_sta=
te(enum ice_aq_err aq_err)
  */
 static int ice_acquire_global_cfg_lock(struct ice_hw *hw,
 				       enum ice_aq_res_access_type access)
+	TRY_ACQUIRE(0, ice_global_cfg_lock_sw)
 {
 	int status;
=20
@@ -1157,6 +1158,7 @@ static int ice_acquire_global_cfg_lock(struct ice_h=
w *hw,
  * This function will release the global config lock.
  */
 static void ice_release_global_cfg_lock(struct ice_hw *hw)
+	RELEASE(ice_global_cfg_lock_sw)
 {
 	mutex_unlock(&ice_global_cfg_lock_sw);
 	ice_release_res(hw, ICE_GLOBAL_CFG_LOCK_RES_ID);
diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool.c b/drivers/net/e=
thernet/intel/ice/ice_ethtool.c
index f241493a6ac8..8bf1cfe4dafc 100644
--- a/drivers/net/ethernet/intel/ice/ice_ethtool.c
+++ b/drivers/net/ethernet/intel/ice/ice_ethtool.c
@@ -3911,6 +3911,7 @@ static int ice_vsi_set_dflt_rss_lut(struct ice_vsi =
*vsi, int req_rss_size)
  * @ch: ethtool channel data structure
  */
 static int ice_set_channels(struct net_device *dev, struct ethtool_chann=
els *ch)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct ice_netdev_priv *np =3D netdev_priv(dev);
 	struct ice_vsi *vsi =3D np->vsi;
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethe=
rnet/intel/ice/ice_main.c
index c3a0fb97c5ee..0faf8e7de688 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -9338,6 +9338,7 @@ static LIST_HEAD(ice_block_cb_list);
 static int
 ice_setup_tc(struct net_device *netdev, enum tc_setup_type type,
 	     void *type_data)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct ice_netdev_priv *np =3D netdev_priv(netdev);
 	struct ice_pf *pf =3D np->vsi->back;
diff --git a/drivers/net/ethernet/intel/ice/ice_vf_lib.c b/drivers/net/et=
hernet/intel/ice/ice_vf_lib.c
index c7c0c2f50c26..6199c014bd6b 100644
--- a/drivers/net/ethernet/intel/ice/ice_vf_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
@@ -856,6 +856,7 @@ static void ice_notify_vf_reset(struct ice_vf *vf)
  * rebuild.
  */
 int ice_reset_vf(struct ice_vf *vf, u32 flags)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct ice_pf *pf =3D vf->pf;
 	struct ice_lag *lag;
diff --git a/drivers/net/ethernet/intel/idpf/idpf.h b/drivers/net/etherne=
t/intel/idpf/idpf.h
index 66544faab710..30507e95eeef 100644
--- a/drivers/net/ethernet/intel/idpf/idpf.h
+++ b/drivers/net/ethernet/intel/idpf/idpf.h
@@ -794,6 +794,7 @@ static inline u16 idpf_get_max_tx_hdr_size(struct idp=
f_adapter *adapter)
  * destruction.
  */
 static inline void idpf_vport_ctrl_lock(struct net_device *netdev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct idpf_netdev_priv *np =3D netdev_priv(netdev);
=20
@@ -805,6 +806,7 @@ static inline void idpf_vport_ctrl_lock(struct net_de=
vice *netdev)
  * @netdev: Network interface device structure
  */
 static inline void idpf_vport_ctrl_unlock(struct net_device *netdev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct idpf_netdev_priv *np =3D netdev_priv(netdev);
=20
diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c b/driver=
s/net/ethernet/marvell/octeontx2/af/rvu_nix.c
index 613655fcd34f..65b0463ead33 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
@@ -6189,6 +6189,7 @@ int rvu_nix_setup_ratelimit_aggr(struct rvu *rvu, u=
16 pcifunc,
 /* Called with mutex rsrc_lock */
 static void nix_clear_ratelimit_aggr(struct rvu *rvu, struct nix_hw *nix=
_hw,
 				     u32 leaf_prof)
+	REQUIRES(rvu->rsrc_lock)
 {
 	struct nix_cn10k_aq_enq_req aq_req;
 	struct nix_cn10k_aq_enq_rsp aq_rsp;
@@ -6415,6 +6416,7 @@ int rvu_mbox_handler_nix_mcast_grp_create(struct rv=
u *rvu,
 int rvu_mbox_handler_nix_mcast_grp_destroy(struct rvu *rvu,
 					   struct nix_mcast_grp_destroy_req *req,
 					   struct msg_rsp *rsp)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct npc_delete_flow_req uninstall_req =3D { 0 };
 	struct npc_delete_flow_rsp uninstall_rsp =3D { 0 };
@@ -6479,6 +6481,7 @@ int rvu_mbox_handler_nix_mcast_grp_destroy(struct r=
vu *rvu,
 int rvu_mbox_handler_nix_mcast_grp_update(struct rvu *rvu,
 					  struct nix_mcast_grp_update_req *req,
 					  struct nix_mcast_grp_update_rsp *rsp)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct nix_mcast_grp_destroy_req dreq =3D { 0 };
 	struct npc_mcam *mcam =3D &rvu->hw->mcam;
diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c b/dri=
vers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c
index 1b765045aa63..88de16a09c3a 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c
@@ -1600,6 +1600,7 @@ int rvu_mbox_handler_npc_delete_flow(struct rvu *rv=
u,
 static int npc_update_dmac_value(struct rvu *rvu, int npcblkaddr,
 				 struct rvu_npc_mcam_rule *rule,
 				 struct rvu_pfvf *pfvf)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(rvu->hw->mcam.lock) */
 {
 	struct npc_mcam_write_entry_req write_req =3D { 0 };
 	struct mcam_entry *entry =3D &write_req.entry_data;
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c b/drivers/n=
et/ethernet/marvell/octeontx2/nic/rep.c
index 04e08e06f30f..c487f46be0e8 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
@@ -33,6 +33,7 @@ static int rvu_rep_notify_pfvf(struct otx2_nic *priv, u=
16 event,
 			       struct rep_event *data);
=20
 static int rvu_rep_mcam_flow_init(struct rep_dev *rep)
+	NO_THREAD_SAFETY_ANALYSIS /* is there a locking bug in this function? *=
/
 {
 	struct npc_mcam_alloc_entry_req *req;
 	struct npc_mcam_alloc_entry_rsp *rsp;
diff --git a/drivers/net/ethernet/marvell/prestera/prestera_counter.c b/d=
rivers/net/ethernet/marvell/prestera/prestera_counter.c
index 4cd53a2dae46..57a3f2d9513f 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_counter.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_counter.c
@@ -48,21 +48,25 @@ prestera_counter_is_ready(struct prestera_counter_blo=
ck *block, u32 id)
 }
=20
 static void prestera_counter_lock(struct prestera_counter *counter)
+	ACQUIRE(counter->mtx)
 {
 	mutex_lock(&counter->mtx);
 }
=20
 static void prestera_counter_unlock(struct prestera_counter *counter)
+	RELEASE(counter->mtx)
 {
 	mutex_unlock(&counter->mtx);
 }
=20
 static void prestera_counter_block_lock(struct prestera_counter_block *b=
lock)
+	ACQUIRE(block->mtx)
 {
 	mutex_lock(&block->mtx);
 }
=20
 static void prestera_counter_block_unlock(struct prestera_counter_block =
*block)
+	RELEASE(block->mtx)
 {
 	mutex_unlock(&block->mtx);
 }
diff --git a/drivers/net/ethernet/marvell/prestera/prestera_pci.c b/drive=
rs/net/ethernet/marvell/prestera/prestera_pci.c
index 35857dc19542..d892ab44d1ed 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_pci.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_pci.c
@@ -359,11 +359,13 @@ static int prestera_fw_wait_reg32(struct prestera_f=
w *fw, u32 reg, u32 cmp,
 }
=20
 static void prestera_fw_cmdq_lock(struct prestera_fw *fw, u8 qid)
+	NO_THREAD_SAFETY_ANALYSIS /* array of mutexes */
 {
 	mutex_lock(&fw->cmd_queue[qid].cmd_mtx);
 }
=20
 static void prestera_fw_cmdq_unlock(struct prestera_fw *fw, u8 qid)
+	NO_THREAD_SAFETY_ANALYSIS /* array of mutexes */
 {
 	mutex_unlock(&fw->cmd_queue[qid].cmd_mtx);
 }
diff --git a/drivers/net/ethernet/mellanox/mlx4/cmd.c b/drivers/net/ether=
net/mellanox/mlx4/cmd.c
index 7f20813456e2..7bed674675e3 100644
--- a/drivers/net/ethernet/mellanox/mlx4/cmd.c
+++ b/drivers/net/ethernet/mellanox/mlx4/cmd.c
@@ -2620,6 +2620,7 @@ void mlx4_cmd_cleanup(struct mlx4_dev *dev, int cle=
anup_mask)
  * after event queue for command events has been initialized).
  */
 int mlx4_cmd_use_events(struct mlx4_dev *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct mlx4_priv *priv =3D mlx4_priv(dev);
 	int i;
@@ -2668,6 +2669,7 @@ int mlx4_cmd_use_events(struct mlx4_dev *dev)
  * Switch back to polling (used when shutting down the device)
  */
 void mlx4_cmd_use_polling(struct mlx4_dev *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct mlx4_priv *priv =3D mlx4_priv(dev);
 	int i;
diff --git a/drivers/net/ethernet/mellanox/mlx4/port.c b/drivers/net/ethe=
rnet/mellanox/mlx4/port.c
index 4e43f4a7d246..fdefa2ed82b2 100644
--- a/drivers/net/ethernet/mellanox/mlx4/port.c
+++ b/drivers/net/ethernet/mellanox/mlx4/port.c
@@ -180,6 +180,7 @@ static bool mlx4_need_mf_bond(struct mlx4_dev *dev)
 }
=20
 int __mlx4_register_mac(struct mlx4_dev *dev, u8 port, u64 mac)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct mlx4_port_info *info =3D &mlx4_priv(dev)->port[port];
 	struct mlx4_mac_table *table =3D &info->mac_table;
@@ -377,6 +378,7 @@ int mlx4_get_base_qpn(struct mlx4_dev *dev, u8 port)
 EXPORT_SYMBOL_GPL(mlx4_get_base_qpn);
=20
 void __mlx4_unregister_mac(struct mlx4_dev *dev, u8 port, u64 mac)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct mlx4_port_info *info;
 	struct mlx4_mac_table *table;
@@ -472,6 +474,7 @@ void mlx4_unregister_mac(struct mlx4_dev *dev, u8 por=
t, u64 mac)
 EXPORT_SYMBOL_GPL(mlx4_unregister_mac);
=20
 int __mlx4_replace_mac(struct mlx4_dev *dev, u8 port, int qpn, u64 new_m=
ac)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct mlx4_port_info *info =3D &mlx4_priv(dev)->port[port];
 	struct mlx4_mac_table *table =3D &info->mac_table;
@@ -576,6 +579,7 @@ EXPORT_SYMBOL_GPL(mlx4_find_cached_vlan);
=20
 int __mlx4_register_vlan(struct mlx4_dev *dev, u8 port, u16 vlan,
 				int *index)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct mlx4_vlan_table *table =3D &mlx4_priv(dev)->port[port].vlan_tabl=
e;
 	int i, err =3D 0;
@@ -760,6 +764,7 @@ int mlx4_register_vlan(struct mlx4_dev *dev, u8 port,=
 u16 vlan, int *index)
 EXPORT_SYMBOL_GPL(mlx4_register_vlan);
=20
 void __mlx4_unregister_vlan(struct mlx4_dev *dev, u8 port, u16 vlan)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct mlx4_vlan_table *table =3D &mlx4_priv(dev)->port[port].vlan_tabl=
e;
 	int index;
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/mod_hdr.c b/drive=
rs/net/ethernet/mellanox/mlx5/core/en/mod_hdr.c
index cf60f0a3ff23..1c46b264926e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/mod_hdr.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/mod_hdr.c
@@ -139,6 +139,7 @@ mlx5e_mod_hdr_attach(struct mlx5_core_dev *mdev,
 void mlx5e_mod_hdr_detach(struct mlx5_core_dev *mdev,
 			  struct mod_hdr_tbl *tbl,
 			  struct mlx5e_mod_hdr_handle *mh)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	if (!refcount_dec_and_mutex_lock(&mh->refcnt, &tbl->lock))
 		return;
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c b/d=
rivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c
index 25d751eba99b..2f9bf6512119 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c
@@ -540,11 +540,13 @@ void mlx5e_reporter_icosq_cqe_err(struct mlx5e_icos=
q *icosq)
 }
=20
 void mlx5e_reporter_icosq_suspend_recovery(struct mlx5e_channel *c)
+	ACQUIRE(c->icosq_recovery_lock)
 {
 	mutex_lock(&c->icosq_recovery_lock);
 }
=20
 void mlx5e_reporter_icosq_resume_recovery(struct mlx5e_channel *c)
+	RELEASE(c->icosq_recovery_lock)
 {
 	mutex_unlock(&c->icosq_recovery_lock);
 }
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/ct_fs_hmfs.c b=
/drivers/net/ethernet/mellanox/mlx5/core/en/tc/ct_fs_hmfs.c
index a4263137fef5..a2f451ab7f4e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/ct_fs_hmfs.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/ct_fs_hmfs.c
@@ -153,6 +153,7 @@ mlx5_ct_fs_hmfs_matcher_get(struct mlx5_ct_fs *fs, st=
ruct mlx5_flow_spec *spec,
=20
 static void
 mlx5_ct_fs_hmfs_matcher_put(struct mlx5_ct_fs *fs, struct mlx5_ct_fs_hmf=
s_matcher *hmfs_matcher)
+	NO_THREAD_SAFETY_ANALYSIS /* needed because of a clang bug? */
 {
 	struct mlx5_ct_fs_hmfs *fs_hmfs =3D mlx5_ct_fs_priv(fs);
=20
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/ct_fs_smfs.c b=
/drivers/net/ethernet/mellanox/mlx5/core/en/tc/ct_fs_smfs.c
index 0c97c5899904..62f92307a209 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/ct_fs_smfs.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/ct_fs_smfs.c
@@ -167,6 +167,7 @@ mlx5_ct_fs_smfs_matcher_get(struct mlx5_ct_fs *fs, bo=
ol nat, bool ipv4, bool tcp
=20
 static void
 mlx5_ct_fs_smfs_matcher_put(struct mlx5_ct_fs *fs, struct mlx5_ct_fs_smf=
s_matcher *smfs_matcher)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct mlx5_ct_fs_smfs *fs_smfs =3D mlx5_ct_fs_priv(fs);
=20
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/int_port.c b/d=
rivers/net/ethernet/mellanox/mlx5/core/en/tc/int_port.c
index 8afcec0c5d3c..4890b25be461 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/int_port.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/int_port.c
@@ -294,6 +294,7 @@ mlx5e_tc_int_port_get(struct mlx5e_tc_int_port_priv *=
priv,
 void
 mlx5e_tc_int_port_put(struct mlx5e_tc_int_port_priv *priv,
 		      struct mlx5e_tc_int_port *int_port)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	if (!refcount_dec_and_mutex_lock(&int_port->refcnt, &priv->int_ports_lo=
ck))
 		return;
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun_encap.c b/=
drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun_encap.c
index e7e01f3298ef..8e7b6f43b673 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun_encap.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun_encap.c
@@ -490,6 +490,7 @@ static void mlx5e_decap_dealloc(struct mlx5e_priv *pr=
iv,
 }
=20
 void mlx5e_encap_put(struct mlx5e_priv *priv, struct mlx5e_encap_entry *=
e)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct mlx5_eswitch *esw =3D priv->mdev->priv.eswitch;
=20
@@ -516,6 +517,7 @@ static void mlx5e_encap_put_locked(struct mlx5e_priv =
*priv, struct mlx5e_encap_e
 }
=20
 static void mlx5e_decap_put(struct mlx5e_priv *priv, struct mlx5e_decap_=
entry *d)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct mlx5_eswitch *esw =3D priv->mdev->priv.eswitch;
=20
@@ -1139,6 +1141,7 @@ static void mlx5e_route_dealloc(struct mlx5e_priv *=
priv,
 }
=20
 static void mlx5e_route_put(struct mlx5e_priv *priv, struct mlx5e_route_=
entry *r)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct mlx5_eswitch *esw =3D priv->mdev->priv.eswitch;
=20
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/ne=
t/ethernet/mellanox/mlx5/core/en_tc.c
index 9ba99609999f..ef0d8e259a3b 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -978,6 +978,7 @@ static struct mlx5e_hairpin_entry *mlx5e_hairpin_get(=
struct mlx5e_priv *priv,
=20
 static void mlx5e_hairpin_put(struct mlx5e_priv *priv,
 			      struct mlx5e_hairpin_entry *hpe)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct mlx5e_tc_table *tc =3D mlx5e_fs_get_tc(priv->fs);
 	/* no more hairpin flows for us, release the hairpin pair */
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c b/drivers/=
net/ethernet/mellanox/mlx5/core/esw/qos.c
index 8b7c843446e1..206756f14998 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c
@@ -20,11 +20,13 @@ struct mlx5_qos_domain {
 };
=20
 static void esw_qos_lock(struct mlx5_eswitch *esw)
+	ACQUIRE(esw->qos.domain->lock)
 {
 	mutex_lock(&esw->qos.domain->lock);
 }
=20
 static void esw_qos_unlock(struct mlx5_eswitch *esw)
+	RELEASE(esw->qos.domain->lock)
 {
 	mutex_unlock(&esw->qos.domain->lock);
 }
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net=
/ethernet/mellanox/mlx5/core/main.c
index ec956c4bcebd..abd92b179884 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
@@ -2301,6 +2301,7 @@ static struct pci_driver mlx5_core_driver =3D {
  * Return: Pointer to the associated mlx5_core_dev or NULL.
  */
 struct mlx5_core_dev *mlx5_vf_get_core_dev(struct pci_dev *pdev)
+	NO_THREAD_SAFETY_ANALYSIS /* TRY_ACQUIRE() does not support pointers */
 {
 	struct mlx5_core_dev *mdev;
=20
@@ -2326,6 +2327,7 @@ EXPORT_SYMBOL(mlx5_vf_get_core_dev);
  * access the mdev any more.
  */
 void mlx5_vf_put_core_dev(struct mlx5_core_dev *mdev)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the above function */
 {
 	mutex_unlock(&mdev->intf_state_mutex);
 }
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc.c b=
/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc.c
index 3dbd4efa21a2..8164182be354 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc.c
@@ -23,6 +23,7 @@ hws_bwc_get_queue_lock(struct mlx5hws_context *ctx, u16=
 idx)
 }
=20
 static void hws_bwc_lock_all_queues(struct mlx5hws_context *ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	u16 bwc_queues =3D mlx5hws_bwc_queues(ctx);
 	struct mutex *queue_lock; /* Protect the queue */
@@ -35,6 +36,7 @@ static void hws_bwc_lock_all_queues(struct mlx5hws_cont=
ext *ctx)
 }
=20
 static void hws_bwc_unlock_all_queues(struct mlx5hws_context *ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	u16 bwc_queues =3D mlx5hws_bwc_queues(ctx);
 	struct mutex *queue_lock; /* Protect the queue */
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_type=
s.h b/drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_types.h
index 7618c6147f86..a4298523c38c 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_types.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_types.h
@@ -1185,22 +1185,28 @@ struct mlx5dr_icm_chunk {
 };
=20
 static inline void mlx5dr_domain_nic_lock(struct mlx5dr_domain_rx_tx *ni=
c_dmn)
+	ACQUIRE(nic_dmn->mutex)
 {
 	mutex_lock(&nic_dmn->mutex);
 }
=20
 static inline void mlx5dr_domain_nic_unlock(struct mlx5dr_domain_rx_tx *=
nic_dmn)
+	RELEASE(nic_dmn->mutex)
 {
 	mutex_unlock(&nic_dmn->mutex);
 }
=20
 static inline void mlx5dr_domain_lock(struct mlx5dr_domain *dmn)
+	ACQUIRE(dmn->info.rx.mutex)
+	ACQUIRE(dmn->info.tx.mutex)
 {
 	mlx5dr_domain_nic_lock(&dmn->info.rx);
 	mlx5dr_domain_nic_lock(&dmn->info.tx);
 }
=20
 static inline void mlx5dr_domain_unlock(struct mlx5dr_domain *dmn)
+	RELEASE(dmn->info.rx.mutex)
+	RELEASE(dmn->info.tx.mutex)
 {
 	mlx5dr_domain_nic_unlock(&dmn->info.tx);
 	mlx5dr_domain_nic_unlock(&dmn->info.rx);
diff --git a/drivers/net/ethernet/micrel/ks8851_spi.c b/drivers/net/ether=
net/micrel/ks8851_spi.c
index 3062cc0f9199..59ddb851402e 100644
--- a/drivers/net/ethernet/micrel/ks8851_spi.c
+++ b/drivers/net/ethernet/micrel/ks8851_spi.c
@@ -78,6 +78,7 @@ struct ks8851_net_spi {
  * Claim chip register access lock
  */
 static void ks8851_lock_spi(struct ks8851_net *ks, unsigned long *flags)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct ks8851_net_spi *kss =3D to_ks8851_spi(ks);
=20
@@ -92,6 +93,7 @@ static void ks8851_lock_spi(struct ks8851_net *ks, unsi=
gned long *flags)
  * Release chip register access lock
  */
 static void ks8851_unlock_spi(struct ks8851_net *ks, unsigned long *flag=
s)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct ks8851_net_spi *kss =3D to_ks8851_spi(ks);
=20
diff --git a/drivers/net/ethernet/microchip/encx24j600-regmap.c b/drivers=
/net/ethernet/microchip/encx24j600-regmap.c
index 26b00e66d912..627302448b21 100644
--- a/drivers/net/ethernet/microchip/encx24j600-regmap.c
+++ b/drivers/net/ethernet/microchip/encx24j600-regmap.c
@@ -44,6 +44,7 @@ static int encx24j600_cmdn(struct encx24j600_context *c=
tx, u8 opcode,
 }
=20
 static void regmap_lock_mutex(void *context)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct encx24j600_context *ctx =3D context;
=20
@@ -51,6 +52,7 @@ static void regmap_lock_mutex(void *context)
 }
=20
 static void regmap_unlock_mutex(void *context)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct encx24j600_context *ctx =3D context;
=20
diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/net=
/ethernet/microchip/vcap/vcap_api.c
index 2687765abe52..a68cdbbf6abe 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c
@@ -937,6 +937,7 @@ static bool vcap_rule_exists(struct vcap_control *vct=
rl, u32 id)
 /* Find a rule with a provided rule id return a locked vcap */
 static struct vcap_rule_internal *
 vcap_get_locked_rule(struct vcap_control *vctrl, u32 id)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct vcap_rule_internal *ri;
 	struct vcap_admin *admin;
@@ -2432,6 +2433,7 @@ struct vcap_rule *vcap_decode_rule(struct vcap_rule=
_internal *elem)
 }
=20
 struct vcap_rule *vcap_get_rule(struct vcap_control *vctrl, u32 id)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct vcap_rule_internal *elem;
 	struct vcap_rule *rule;
@@ -2453,6 +2455,7 @@ EXPORT_SYMBOL_GPL(vcap_get_rule);
=20
 /* Update existing rule */
 int vcap_mod_rule(struct vcap_rule *rule)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct vcap_rule_internal *ri =3D to_intrule(rule);
 	struct vcap_counter ctr;
@@ -2535,6 +2538,7 @@ static int vcap_fill_rule_gap(struct vcap_rule_inte=
rnal *ri)
=20
 /* Delete rule in a VCAP instance */
 int vcap_del_rule(struct vcap_control *vctrl, struct net_device *ndev, u=
32 id)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct vcap_rule_internal *ri, *elem;
 	struct vcap_admin *admin;
diff --git a/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_cppcore.c b/d=
rivers/net/ethernet/netronome/nfp/nfpcore/nfp_cppcore.c
index 669f9f8fb507..d791ed542ec2 100644
--- a/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_cppcore.c
+++ b/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_cppcore.c
@@ -822,6 +822,7 @@ int nfp_cpp_area_cache_add(struct nfp_cpp *cpp, size_=
t size)
 static struct nfp_cpp_area_cache *
 area_cache_get(struct nfp_cpp *cpp, u32 id,
 	       u64 addr, unsigned long *offset, size_t length)
+	NO_THREAD_SAFETY_ANALYSIS /* TRY_ACQUIRE() does not support pointers */
 {
 	struct nfp_cpp_area_cache *cache;
 	int err;
@@ -903,6 +904,7 @@ area_cache_get(struct nfp_cpp *cpp, u32 id,
=20
 static void
 area_cache_put(struct nfp_cpp *cpp, struct nfp_cpp_area_cache *cache)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the above function */
 {
 	if (!cache)
 		return;
diff --git a/drivers/net/ethernet/qlogic/qed/qed_ll2.c b/drivers/net/ethe=
rnet/qlogic/qed/qed_ll2.c
index ab5ef254a748..8686715d62c4 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_ll2.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_ll2.c
@@ -252,6 +252,7 @@ static struct qed_ll2_info *__qed_ll2_handle_sanity(s=
truct qed_hwfn *p_hwfn,
 						    u8 connection_handle,
 						    bool b_lock,
 						    bool b_only_active)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct qed_ll2_info *p_ll2_conn, *p_ret =3D NULL;
=20
diff --git a/drivers/net/ethernet/qlogic/qed/qed_vf.c b/drivers/net/ether=
net/qlogic/qed/qed_vf.c
index 0e265ed1f501..b57737f740d5 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_vf.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_vf.c
@@ -11,6 +11,7 @@
 #include "qed_vf.h"
=20
 static void *qed_vf_pf_prep(struct qed_hwfn *p_hwfn, u16 type, u16 lengt=
h)
+	ACQUIRE(p_hwfn->vf_iov_info->mutex)
 {
 	struct qed_vf_iov *p_iov =3D p_hwfn->vf_iov_info;
 	void *p_tlv;
@@ -20,7 +21,7 @@ static void *qed_vf_pf_prep(struct qed_hwfn *p_hwfn, u1=
6 type, u16 length)
 	 * So, qed_vf_pf_prep() and qed_send_msg2pf()
 	 * must come in sequence.
 	 */
-	mutex_lock(&(p_iov->mutex));
+	mutex_lock(&p_hwfn->vf_iov_info->mutex);
=20
 	DP_VERBOSE(p_hwfn,
 		   QED_MSG_IOV,
@@ -45,6 +46,7 @@ static void *qed_vf_pf_prep(struct qed_hwfn *p_hwfn, u1=
6 type, u16 length)
 }
=20
 static void qed_vf_pf_req_end(struct qed_hwfn *p_hwfn, int req_status)
+	RELEASE(p_hwfn->vf_iov_info->mutex)
 {
 	union pfvf_tlvs *resp =3D p_hwfn->vf_iov_info->pf2vf_reply;
=20
diff --git a/drivers/net/ethernet/qlogic/qede/qede_main.c b/drivers/net/e=
thernet/qlogic/qede/qede_main.c
index 99df00c30b8c..7a50b3011c14 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_main.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_main.c
@@ -1056,11 +1056,13 @@ static int qede_alloc_fp_array(struct qede_dev *e=
dev)
  * are not reentrant.
  */
 void __qede_lock(struct qede_dev *edev)
+	ACQUIRE(edev->qede_lock)
 {
 	mutex_lock(&edev->qede_lock);
 }
=20
 void __qede_unlock(struct qede_dev *edev)
+	RELEASE(edev->qede_lock)
 {
 	mutex_unlock(&edev->qede_lock);
 }
@@ -1069,12 +1071,14 @@ void __qede_unlock(struct qede_dev *edev)
  * needed in addition to the internal qede lock.
  */
 static void qede_lock(struct qede_dev *edev)
+	ACQUIRE(edev->qede_lock)
 {
 	rtnl_lock();
 	__qede_lock(edev);
 }
=20
 static void qede_unlock(struct qede_dev *edev)
+	RELEASE(edev->qede_lock)
 {
 	__qede_unlock(edev);
 	rtnl_unlock();
@@ -2370,6 +2374,7 @@ enum qede_unload_mode {
=20
 static void qede_unload(struct qede_dev *edev, enum qede_unload_mode mod=
e,
 			bool is_locked)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct qed_link_params link_params;
 	int rc;
@@ -2454,6 +2459,7 @@ enum qede_load_mode {
=20
 static int qede_load(struct qede_dev *edev, enum qede_load_mode mode,
 		     bool is_locked)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct qed_link_params link_params;
 	struct ethtool_coalesce coal =3D {};
@@ -2558,6 +2564,7 @@ static int qede_load(struct qede_dev *edev, enum qe=
de_load_mode mode,
  */
 void qede_reload(struct qede_dev *edev,
 		 struct qede_reload_args *args, bool is_locked)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (!is_locked)
 		__qede_lock(edev);
diff --git a/drivers/net/ethernet/sfc/ef10_sriov.c b/drivers/net/ethernet=
/sfc/ef10_sriov.c
index 9aae0d8b713f..c179142bee1c 100644
--- a/drivers/net/ethernet/sfc/ef10_sriov.c
+++ b/drivers/net/ethernet/sfc/ef10_sriov.c
@@ -552,6 +552,7 @@ int efx_ef10_sriov_set_vf_mac(struct efx_nic *efx, in=
t vf_i, const u8 *mac)
=20
 int efx_ef10_sriov_set_vf_vlan(struct efx_nic *efx, int vf_i, u16 vlan,
 			       u8 qos)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct efx_ef10_nic_data *nic_data =3D efx->nic_data;
 	struct ef10_vf *vf;
diff --git a/drivers/net/ethernet/sfc/efx_common.c b/drivers/net/ethernet=
/sfc/efx_common.c
index c88ec3e24836..88719d34dc31 100644
--- a/drivers/net/ethernet/sfc/efx_common.c
+++ b/drivers/net/ethernet/sfc/efx_common.c
@@ -687,6 +687,8 @@ int efx_try_recovery(struct efx_nic *efx)
  * before reset.
  */
 void efx_reset_down(struct efx_nic *efx, enum reset_type method)
+	ACQUIRE(efx->mac_lock)
+	ACQUIRE(efx->net_dev->ethtool->rss_lock)
 {
 	EFX_ASSERT_RESET_SERIALISED(efx);
=20
@@ -721,6 +723,8 @@ void efx_watchdog(struct net_device *net_dev, unsigne=
d int txqueue)
  * engines are not restarted, pending a RESET_DISABLE.
  */
 int efx_reset_up(struct efx_nic *efx, enum reset_type method, bool ok)
+	RELEASE(efx->net_dev->ethtool->rss_lock)
+	RELEASE(efx->mac_lock)
 {
 	int rc;
=20
@@ -790,6 +794,7 @@ int efx_reset_up(struct efx_nic *efx, enum reset_type=
 method, bool ok)
  * Caller must hold the rtnl_lock.
  */
 int efx_reset(struct efx_nic *efx, enum reset_type method)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int rc, rc2 =3D 0;
 	bool disabled;
diff --git a/drivers/net/ethernet/sfc/falcon/efx.c b/drivers/net/ethernet=
/sfc/falcon/efx.c
index b07f7e4e2877..001341e9eb4b 100644
--- a/drivers/net/ethernet/sfc/falcon/efx.c
+++ b/drivers/net/ethernet/sfc/falcon/efx.c
@@ -2335,6 +2335,7 @@ static void ef4_unregister_netdev(struct ef4_nic *e=
fx)
 /* Tears down the entire software state and most of the hardware state
  * before reset.  */
 void ef4_reset_down(struct ef4_nic *efx, enum reset_type method)
+	ACQUIRE(&efx->mac_lock)
 {
 	EF4_ASSERT_RESET_SERIALISED(efx);
=20
@@ -2354,6 +2355,7 @@ void ef4_reset_down(struct ef4_nic *efx, enum reset=
_type method)
  * driver should be disabled. If ok is false, then the rx and tx
  * engines are not restarted, pending a RESET_DISABLE. */
 int ef4_reset_up(struct ef4_nic *efx, enum reset_type method, bool ok)
+	RELEASE(&efx->mac_lock)
 {
 	int rc;
=20
diff --git a/drivers/net/ethernet/sfc/mcdi_filters.c b/drivers/net/ethern=
et/sfc/mcdi_filters.c
index 6ef96292909a..dc4124609522 100644
--- a/drivers/net/ethernet/sfc/mcdi_filters.c
+++ b/drivers/net/ethernet/sfc/mcdi_filters.c
@@ -343,6 +343,7 @@ static int efx_mcdi_filter_pri(struct efx_mcdi_filter=
_table *table,
 static s32 efx_mcdi_filter_insert_locked(struct efx_nic *efx,
 					 struct efx_filter_spec *spec,
 					 bool replace_equal)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	DECLARE_BITMAP(mc_rem_map, EFX_EF10_FILTER_SEARCH_LIMIT);
 	struct efx_rss_context_priv *ctx =3D NULL;
diff --git a/drivers/net/ethernet/sfc/siena/efx_common.c b/drivers/net/et=
hernet/sfc/siena/efx_common.c
index a0966f879664..006277dff8a2 100644
--- a/drivers/net/ethernet/sfc/siena/efx_common.c
+++ b/drivers/net/ethernet/sfc/siena/efx_common.c
@@ -714,6 +714,7 @@ int efx_siena_try_recovery(struct efx_nic *efx)
  * before reset.
  */
 void efx_siena_reset_down(struct efx_nic *efx, enum reset_type method)
+	ACQUIRE(efx->mac_lock)
 {
 	EFX_ASSERT_RESET_SERIALISED(efx);
=20
@@ -747,6 +748,7 @@ void efx_siena_watchdog(struct net_device *net_dev, u=
nsigned int txqueue)
  * engines are not restarted, pending a RESET_DISABLE.
  */
 int efx_siena_reset_up(struct efx_nic *efx, enum reset_type method, bool=
 ok)
+	RELEASE(efx->mac_lock)
 {
 	int rc;
=20
@@ -814,6 +816,7 @@ int efx_siena_reset_up(struct efx_nic *efx, enum rese=
t_type method, bool ok)
  * Caller must hold the rtnl_lock.
  */
 int efx_siena_reset(struct efx_nic *efx, enum reset_type method)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int rc, rc2 =3D 0;
 	bool disabled;
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/e=
thernet/xilinx/xilinx_axienet.h
index a3f4f3e42587..c0b2e92b548f 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -657,12 +657,14 @@ static inline u32 axinet_ior_read_mcr(struct axiene=
t_local *lp)
 }
=20
 static inline void axienet_lock_mii(struct axienet_local *lp)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (lp->mii_bus)
 		mutex_lock(&lp->mii_bus->mdio_lock);
 }
=20
 static inline void axienet_unlock_mii(struct axienet_local *lp)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (lp->mii_bus)
 		mutex_unlock(&lp->mii_bus->mdio_lock);
diff --git a/drivers/net/macsec.c b/drivers/net/macsec.c
index 1bc1e5993f56..3662ee5f9b5c 100644
--- a/drivers/net/macsec.c
+++ b/drivers/net/macsec.c
@@ -1664,6 +1664,7 @@ static const struct nla_policy macsec_genl_offload_=
policy[NUM_MACSEC_OFFLOAD_ATT
 /* Offloads an operation to a device driver */
 static int macsec_offload(int (* const func)(struct macsec_context *),
 			  struct macsec_context *ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret;
=20
diff --git a/drivers/net/mctp/mctp-i3c.c b/drivers/net/mctp/mctp-i3c.c
index 360eb6490483..4c3f54b0724e 100644
--- a/drivers/net/mctp/mctp-i3c.c
+++ b/drivers/net/mctp/mctp-i3c.c
@@ -346,6 +346,7 @@ static void mctp_i3c_remove(struct i3c_device *i3c)
 /* Returns the device for an address, with mi->lock held */
 static struct mctp_i3c_device *
 mctp_i3c_lookup(struct mctp_i3c_bus *mbus, u64 pid)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct mctp_i3c_device *mi =3D NULL, *ret =3D NULL;
=20
@@ -361,6 +362,7 @@ mctp_i3c_lookup(struct mctp_i3c_bus *mbus, u64 pid)
 }
=20
 static void mctp_i3c_xmit(struct mctp_i3c_bus *mbus, struct sk_buff *skb=
)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct net_device_stats *stats =3D &mbus->ndev->stats;
 	struct i3c_priv_xfer xfer =3D { .rnw =3D false };
diff --git a/drivers/net/phy/dp83640.c b/drivers/net/phy/dp83640.c
index 85e231451093..74926c82dbd0 100644
--- a/drivers/net/phy/dp83640.c
+++ b/drivers/net/phy/dp83640.c
@@ -1031,6 +1031,7 @@ static int choose_this_phy(struct dp83640_clock *cl=
ock,
 }
=20
 static struct dp83640_clock *dp83640_clock_get(struct dp83640_clock *clo=
ck)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (clock)
 		mutex_lock(&clock->clock_lock);
@@ -1079,6 +1080,7 @@ static struct dp83640_clock *dp83640_clock_get_bus(=
struct mii_bus *bus)
 }
=20
 static void dp83640_clock_put(struct dp83640_clock *clock)
+	NO_THREAD_SAFETY_ANALYSIS /* to match dp83640_clock_get() */
 {
 	mutex_unlock(&clock->clock_lock);
 }
diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 6bf3ec985f3d..522c5f541793 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -1023,6 +1023,7 @@ static int __phy_write_page(struct phy_device *phyd=
ev, int page)
  * after this, irrespective of success or failure of this call.
  */
 int phy_save_page(struct phy_device *phydev)
+	ACQUIRE(phydev->mdio.bus->mdio_lock)
 {
 	phy_lock_mdio_bus(phydev);
 	return __phy_read_page(phydev);
@@ -1041,6 +1042,7 @@ EXPORT_SYMBOL_GPL(phy_save_page);
  * of success or failure of this call.
  */
 int phy_select_page(struct phy_device *phydev, int page)
+	ACQUIRE(phydev->mdio.bus->mdio_lock)
 {
 	int ret, oldpage;
=20
@@ -1075,6 +1077,7 @@ EXPORT_SYMBOL_GPL(phy_select_page);
  *   @ret.
  */
 int phy_restore_page(struct phy_device *phydev, int oldpage, int ret)
+	RELEASE(phydev->mdio.bus->mdio_lock)
 {
 	int r;
=20
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 46713d27412b..9c0f243946c6 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1824,6 +1824,7 @@ EXPORT_SYMBOL_GPL(of_phy_package_join);
  * freed. Resets the phydev->shared pointer to NULL.
  */
 void phy_package_leave(struct phy_device *phydev)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct phy_package_shared *shared =3D phydev->shared;
 	struct mii_bus *bus =3D phydev->mdio.bus;
diff --git a/drivers/net/phy/sfp-bus.c b/drivers/net/phy/sfp-bus.c
index f13c00b5b449..44edda4264ce 100644
--- a/drivers/net/phy/sfp-bus.c
+++ b/drivers/net/phy/sfp-bus.c
@@ -433,6 +433,7 @@ static struct sfp_bus *sfp_bus_get(const struct fwnod=
e_handle *fwnode)
 }
=20
 static void sfp_bus_release(struct kref *kref)
+	RELEASE(sfp_mutex)
 {
 	struct sfp_bus *bus =3D container_of(kref, struct sfp_bus, kref);
=20
diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.=
c
index 4f2a54afc4d0..2bd7cdbfd81f 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -773,7 +773,7 @@ int pse_ethtool_get_status(struct pse_control *psec,
=20
 	pcdev =3D psec->pcdev;
 	ops =3D pcdev->ops;
-	mutex_lock(&pcdev->lock);
+	mutex_lock(&psec->pcdev->lock);
 	ret =3D ops->pi_get_admin_state(pcdev, psec->id, &admin_state);
 	if (ret)
 		goto out;
diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index dc7cbd6a9798..e1f57b42043a 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -2299,6 +2299,7 @@ int team_nl_noop_doit(struct sk_buff *skb, struct g=
enl_info *info)
  * Since dev gets held here, that ensures dev won't disappear in between=
.
  */
 static struct team *team_nl_team_get(struct genl_info *info)
+	NO_THREAD_SAFETY_ANALYSIS /* TRY_ACQUIRE() doesn't support pointers */
 {
 	struct net *net =3D genl_info_net(info);
 	int ifindex;
@@ -2321,6 +2322,7 @@ static struct team *team_nl_team_get(struct genl_in=
fo *info)
 }
=20
 static void team_nl_team_put(struct team *team)
+	NO_THREAD_SAFETY_ANALYSIS /* to match the above function */
 {
 	mutex_unlock(&team->lock);
 	dev_put(team->dev);
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 28624cca91f8..3cd6895c372d 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1752,6 +1752,7 @@ static struct sk_buff *tun_build_skb(struct tun_str=
uct *tun,
 static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfi=
le,
 			    void *msg_control, struct iov_iter *from,
 			    int noblock, bool more)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct tun_pi pi =3D { 0, cpu_to_be16(ETH_P_IP) };
 	struct sk_buff *skb;
diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
index 1aeb36119d3f..0a2f74c4196d 100644
--- a/drivers/net/usb/hso.c
+++ b/drivers/net/usb/hso.c
@@ -2584,6 +2584,7 @@ static void hso_free_tiomget(struct hso_serial *ser=
ial)
=20
 /* Frees an AT channel ( goes for both mux and non-mux ) */
 static void hso_free_serial_device(struct hso_device *hso_dev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct hso_serial *serial =3D dev2ser(hso_dev);
=20
@@ -2745,6 +2746,7 @@ struct hso_device *hso_create_mux_serial_device(str=
uct usb_interface *interface,
 }
=20
 static void hso_free_shared_int(struct hso_shared_int *mux)
+	RELEASE(mux->shared_int_lock)
 {
 	usb_free_urb(mux->shared_intr_urb);
 	kfree(mux->shared_intr_buf);
diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index a91bf9c7e31d..d6ae59e9130f 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2414,6 +2414,7 @@ static void lan78xx_irq_unmask(struct irq_data *irq=
d)
 }
=20
 static void lan78xx_irq_bus_lock(struct irq_data *irqd)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct irq_domain_data *data =3D irq_data_get_irq_chip_data(irqd);
=20
@@ -2421,6 +2422,7 @@ static void lan78xx_irq_bus_lock(struct irq_data *i=
rqd)
 }
=20
 static void lan78xx_irq_bus_sync_unlock(struct irq_data *irqd)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct irq_domain_data *data =3D irq_data_get_irq_chip_data(irqd);
 	struct lan78xx_net *dev =3D
diff --git a/drivers/net/wireless/ath/ath6kl/sdio.c b/drivers/net/wireles=
s/ath/ath6kl/sdio.c
index 9ab091044706..7f4b46e70e82 100644
--- a/drivers/net/wireless/ath/ath6kl/sdio.c
+++ b/drivers/net/wireless/ath/ath6kl/sdio.c
@@ -408,6 +408,7 @@ static int ath6kl_sdio_alloc_prep_scat_req(struct ath=
6kl_sdio *ar_sdio,
=20
 static int ath6kl_sdio_read_write_sync(struct ath6kl *ar, u32 addr, u8 *=
buf,
 				       u32 len, u32 request)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct ath6kl_sdio *ar_sdio =3D ath6kl_sdio_priv(ar);
 	u8  *tbuf =3D NULL;
diff --git a/drivers/net/wireless/ath/ath9k/hif_usb.c b/drivers/net/wirel=
ess/ath/ath9k/hif_usb.c
index fe9abe8cd268..ed78d921f6b1 100644
--- a/drivers/net/wireless/ath/ath9k/hif_usb.c
+++ b/drivers/net/wireless/ath/ath9k/hif_usb.c
@@ -1151,6 +1151,7 @@ static void ath9k_hif_usb_dev_deinit(struct hif_dev=
ice_usb *hif_dev)
  * detach the device.
  */
 static void ath9k_hif_usb_firmware_fail(struct hif_device_usb *hif_dev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct device *dev =3D &hif_dev->udev->dev;
 	struct device *parent =3D dev->parent;
diff --git a/drivers/net/wireless/ath/wil6210/main.c b/drivers/net/wirele=
ss/ath/wil6210/main.c
index 94e61dbe94f8..2effccfa66f8 100644
--- a/drivers/net/wireless/ath/wil6210/main.c
+++ b/drivers/net/wireless/ath/wil6210/main.c
@@ -1452,6 +1452,7 @@ static int wil_wait_for_fw_ready(struct wil6210_pri=
v *wil)
 }
=20
 void wil_abort_scan(struct wil6210_vif *vif, bool sync)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct wil6210_priv *wil =3D vif_to_wil(vif);
 	int rc;
diff --git a/drivers/net/wireless/ath/wil6210/p2p.c b/drivers/net/wireles=
s/ath/wil6210/p2p.c
index f26bf046d889..f064e8b3144b 100644
--- a/drivers/net/wireless/ath/wil6210/p2p.c
+++ b/drivers/net/wireless/ath/wil6210/p2p.c
@@ -336,6 +336,8 @@ void wil_p2p_delayed_listen_work(struct work_struct *=
work)
 }
=20
 void wil_p2p_stop_radio_operations(struct wil6210_priv *wil)
+	REQUIRES(wil->mutex)
+	REQUIRES(wil->vif_mutex)
 {
 	struct wil6210_vif *vif =3D ndev_to_vif(wil->main_ndev);
 	struct wil_p2p_info *p2p =3D &vif->p2p;
diff --git a/drivers/net/wireless/broadcom/b43/main.c b/drivers/net/wirel=
ess/broadcom/b43/main.c
index 25b4ef9d3c9a..f0082730e867 100644
--- a/drivers/net/wireless/broadcom/b43/main.c
+++ b/drivers/net/wireless/broadcom/b43/main.c
@@ -4322,6 +4322,7 @@ static void b43_op_configure_filter(struct ieee8021=
1_hw *hw,
  * Returns the current dev. This might be different from the passed in d=
ev,
  * because the core might be gone away while we unlocked the mutex. */
 static struct b43_wldev * b43_wireless_core_stop(struct b43_wldev *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(dev->wl->mutex) */
 {
 	struct b43_wl *wl;
 	struct b43_wldev *orig_dev;
diff --git a/drivers/net/wireless/broadcom/b43legacy/main.c b/drivers/net=
/wireless/broadcom/b43legacy/main.c
index 2370a2e6a2e3..0dfcf78de907 100644
--- a/drivers/net/wireless/broadcom/b43legacy/main.c
+++ b/drivers/net/wireless/broadcom/b43legacy/main.c
@@ -2912,6 +2912,7 @@ static void b43legacy_op_configure_filter(struct ie=
ee80211_hw *hw,
=20
 /* Locking: wl->mutex */
 static void b43legacy_wireless_core_stop(struct b43legacy_wldev *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(dev->wl->mutex) */
 {
 	struct b43legacy_wl *wl =3D dev->wl;
 	unsigned long flags;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.c b/d=
rivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.c
index 41eafcda77f7..0b9e60152390 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.c
@@ -58,6 +58,8 @@ static struct brcmf_fwvid_entry fwvid_list[BRCMF_FWVEND=
OR_NUM] =3D {
=20
 #if IS_MODULE(CONFIG_BRCMFMAC)
 static int brcmf_fwvid_request_module(enum brcmf_fwvendor fwvid)
+	RELEASE(fwvid_list_lock)
+	TRY_ACQUIRE(0, fwvid_list_lock)
 {
 	int ret;
=20
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/lib.c b/drivers/net/w=
ireless/intel/iwlwifi/dvm/lib.c
index 1dc974e2c511..0d05fc53a356 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/lib.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/lib.c
@@ -1032,6 +1032,7 @@ int iwlagn_send_patterns(struct iwl_priv *priv,
 }
=20
 int iwlagn_suspend(struct iwl_priv *priv, struct cfg80211_wowlan *wowlan=
)
+	REQUIRES(priv->mutex)
 {
 	struct iwlagn_wowlan_wakeup_filter_cmd wakeup_filter_cmd;
 	struct iwl_rxon_cmd rxon;
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/d3.c b/drivers/net/wi=
reless/intel/iwlwifi/mvm/d3.c
index 129b6bdf9ef9..1523170a2a7a 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/d3.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/d3.c
@@ -2790,6 +2790,7 @@ iwl_mvm_send_wowlan_get_status(struct iwl_mvm *mvm,=
 u8 sta_id)
 static bool iwl_mvm_query_wakeup_reasons(struct iwl_mvm *mvm,
 					 struct ieee80211_vif *vif,
 					 struct iwl_wowlan_status_data *status)
+	RELEASE(mvm->mutex)
 {
 	int i;
 	bool keep =3D false;
@@ -2983,6 +2984,7 @@ struct iwl_d3_data {
 static void iwl_mvm_query_netdetect_reasons(struct iwl_mvm *mvm,
 					    struct ieee80211_vif *vif,
 					    struct iwl_d3_data *d3_data)
+	RELEASE(mvm->mutex)
 {
 	struct cfg80211_wowlan_nd_info *net_detect =3D NULL;
 	struct cfg80211_wowlan_wakeup wakeup =3D {
@@ -3135,6 +3137,7 @@ static bool
 iwl_mvm_choose_query_wakeup_reasons(struct iwl_mvm *mvm,
 				    struct ieee80211_vif *vif,
 				    struct iwl_d3_data *d3_data)
+	RELEASE(mvm->mutex)
 {
 	lockdep_assert_held(&mvm->mutex);
=20
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c b/drivers/net/w=
ireless/intel/iwlwifi/mvm/ops.c
index 984f407f7027..81b352f6c493 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
@@ -841,6 +841,7 @@ static void iwl_mvm_tx_unblock_dwork(struct work_stru=
ct *work)
 }
=20
 static void iwl_mvm_fwrt_dump_start(void *ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct iwl_mvm *mvm =3D ctx;
=20
@@ -848,6 +849,7 @@ static void iwl_mvm_fwrt_dump_start(void *ctx)
 }
=20
 static void iwl_mvm_fwrt_dump_end(void *ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct iwl_mvm *mvm =3D ctx;
=20
@@ -1683,6 +1685,7 @@ void iwl_mvm_async_handlers_purge(struct iwl_mvm *m=
vm)
  */
 static void iwl_mvm_async_handlers_by_context(struct iwl_mvm *mvm,
 					      u8 contexts)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct iwl_async_handler_entry *entry, *tmp;
 	LIST_HEAD(local_list);
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/time-event.c b/driver=
s/net/wireless/intel/iwlwifi/mvm/time-event.c
index 9216c43a35c4..6bd40535a7c8 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/time-event.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/time-event.c
@@ -46,6 +46,7 @@ void iwl_mvm_te_clear_data(struct iwl_mvm *mvm,
 }
=20
 static void iwl_mvm_cleanup_roc(struct iwl_mvm *mvm)
+	RELEASE(mvm->mutex)
 {
 	struct ieee80211_vif *bss_vif =3D iwl_mvm_get_bss_vif(mvm);
 	struct ieee80211_vif *vif =3D mvm->p2p_device_vif;
@@ -131,6 +132,7 @@ static void iwl_mvm_cleanup_roc(struct iwl_mvm *mvm)
 }
=20
 void iwl_mvm_roc_done_wk(struct work_struct *wk)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct iwl_mvm *mvm =3D container_of(wk, struct iwl_mvm, roc_done_wk);
=20
diff --git a/drivers/net/wireless/intersil/p54/p54pci.c b/drivers/net/wir=
eless/intersil/p54/p54pci.c
index 6588f5477762..f62a3b02909f 100644
--- a/drivers/net/wireless/intersil/p54/p54pci.c
+++ b/drivers/net/wireless/intersil/p54/p54pci.c
@@ -495,6 +495,7 @@ static int p54p_open(struct ieee80211_hw *dev)
=20
 static void p54p_firmware_step2(const struct firmware *fw,
 				void *context)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct p54p_priv *priv =3D context;
 	struct ieee80211_hw *dev =3D priv->common.hw;
diff --git a/drivers/net/wireless/intersil/p54/p54usb.c b/drivers/net/wir=
eless/intersil/p54/p54usb.c
index a1c056612a83..66aa5077bc36 100644
--- a/drivers/net/wireless/intersil/p54/p54usb.c
+++ b/drivers/net/wireless/intersil/p54/p54usb.c
@@ -449,6 +449,7 @@ static int p54u_bulk_msg(struct p54u_priv *priv, unsi=
gned int ep,
 }
=20
 static int p54u_device_reset(struct ieee80211_hw *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct p54u_priv *priv =3D dev->priv;
 	int ret, lock =3D (priv->intf->condition !=3D USB_INTERFACE_BINDING);
diff --git a/drivers/net/wireless/marvell/mwl8k.c b/drivers/net/wireless/=
marvell/mwl8k.c
index bab9ef37a1ab..f7bbbc697a0e 100644
--- a/drivers/net/wireless/marvell/mwl8k.c
+++ b/drivers/net/wireless/marvell/mwl8k.c
@@ -2156,6 +2156,7 @@ mwl8k_txq_xmit(struct ieee80211_hw *hw,
  * and quiesces the transmit path whenever it's taken.
  */
 static int mwl8k_fw_lock(struct ieee80211_hw *hw)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mwl8k_priv *priv =3D hw->priv;
=20
@@ -2184,6 +2185,7 @@ static int mwl8k_fw_lock(struct ieee80211_hw *hw)
 }
=20
 static void mwl8k_fw_unlock(struct ieee80211_hw *hw)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mwl8k_priv *priv =3D hw->priv;
=20
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c b/drive=
rs/net/wireless/mediatek/mt76/mt7615/testmode.c
index 03f5af84424b..47632edac73a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
@@ -131,6 +131,7 @@ mt7615_tm_reg_backup_restore(struct mt7615_phy *phy)
=20
 static void
 mt7615_tm_init(struct mt7615_phy *phy)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mt7615_dev *dev =3D phy->dev;
 	unsigned int total_flags =3D ~0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/n=
et/wireless/mediatek/mt76/mt76_connac.h
index 455979476d11..84f5a6cae670 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -392,6 +392,7 @@ mt76_connac_skip_fw_pmctrl(struct mt76_phy *phy, stru=
ct mt76_connac_pm *pm)
 static inline void
 mt76_connac_mutex_acquire(struct mt76_dev *dev, struct mt76_connac_pm *p=
m)
 	__acquires(&dev->mutex)
+	ACQUIRE(dev->mutex)
 {
 	mutex_lock(&dev->mutex);
 	mt76_connac_pm_wake(&dev->phy, pm);
@@ -400,6 +401,7 @@ mt76_connac_mutex_acquire(struct mt76_dev *dev, struc=
t mt76_connac_pm *pm)
 static inline void
 mt76_connac_mutex_release(struct mt76_dev *dev, struct mt76_connac_pm *p=
m)
 	__releases(&dev->mutex)
+	RELEASE(dev->mutex)
 {
 	mt76_connac_power_save_sched(&dev->phy, pm);
 	mutex_unlock(&dev->mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/main.c
index 3aa31c5cefa6..b869b445f534 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -203,6 +203,7 @@ static void mt7915_init_bitrate_mask(struct ieee80211=
_vif *vif)
=20
 static int mt7915_add_interface(struct ieee80211_hw *hw,
 				struct ieee80211_vif *vif)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mt7915_vif *mvif =3D (struct mt7915_vif *)vif->drv_priv;
 	struct mt7915_dev *dev =3D mt7915_hw_dev(hw);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drive=
rs/net/wireless/mediatek/mt76/mt7915/testmode.c
index d534fff5c952..f5f06dfbd70f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -425,6 +425,7 @@ mt7915_tm_init(struct mt7915_phy *phy, bool en)
=20
 static void
 mt7915_tm_update_channel(struct mt7915_phy *phy)
+	REQUIRES(phy->dev->mt76.mutex)
 {
 	mutex_unlock(&phy->dev->mt76.mutex);
 	mt76_update_channel(phy->mt76);
@@ -435,6 +436,7 @@ mt7915_tm_update_channel(struct mt7915_phy *phy)
=20
 static void
 mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
+	REQUIRES(phy->dev->mt76.mutex)
 {
 	struct mt76_testmode_data *td =3D &phy->mt76->test;
 	struct mt7915_dev *dev =3D phy->dev;
@@ -483,6 +485,7 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool =
en)
=20
 static void
 mt7915_tm_set_rx_frames(struct mt7915_phy *phy, bool en)
+	REQUIRES(phy->dev->mt76.mutex)
 {
 	mt7915_tm_set_trx(phy, TM_MAC_RX_RXV, false);
=20
@@ -510,6 +513,7 @@ mt7915_tm_rf_switch_mode(struct mt7915_dev *dev, u32 =
oper)
=20
 static int
 mt7915_tm_set_tx_cont(struct mt7915_phy *phy, bool en)
+	REQUIRES(phy->dev->mt76.mutex)
 {
 #define TX_CONT_START	0x05
 #define TX_CONT_STOP	0x06
@@ -648,6 +652,7 @@ mt7915_tm_update_params(struct mt7915_phy *phy, u32 c=
hanged)
=20
 static int
 mt7915_tm_set_state(struct mt76_phy *mphy, enum mt76_testmode_state stat=
e)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct mt76_testmode_data *td =3D &mphy->test;
 	struct mt7915_phy *phy =3D mphy->priv;
diff --git a/drivers/net/wireless/microchip/wilc1000/wlan.c b/drivers/net=
/wireless/microchip/wilc1000/wlan.c
index 9d80adc45d6b..e96dee3b1b11 100644
--- a/drivers/net/wireless/microchip/wilc1000/wlan.c
+++ b/drivers/net/wireless/microchip/wilc1000/wlan.c
@@ -766,6 +766,7 @@ static int chip_wakeup(struct wilc *wilc)
 }
=20
 static inline int acquire_bus(struct wilc *wilc, enum bus_acquire acquir=
e)
+	TRY_ACQUIRE(0, wilc->hif_cs)
 {
 	int ret =3D 0;
=20
@@ -780,6 +781,7 @@ static inline int acquire_bus(struct wilc *wilc, enum=
 bus_acquire acquire)
 }
=20
 static inline int release_bus(struct wilc *wilc, enum bus_release releas=
e)
+	RELEASE(wilc->hif_cs)
 {
 	int ret =3D 0;
=20
diff --git a/drivers/net/wireless/quantenna/qtnfmac/bus.h b/drivers/net/w=
ireless/quantenna/qtnfmac/bus.h
index 7f8646e77ee0..e0b84952c0c0 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/bus.h
+++ b/drivers/net/wireless/quantenna/qtnfmac/bus.h
@@ -141,11 +141,13 @@ static inline void qtnf_bus_data_rx_stop(struct qtn=
f_bus *bus)
 }
=20
 static __always_inline void qtnf_bus_lock(struct qtnf_bus *bus)
+	ACQUIRE(bus->bus_lock)
 {
 	mutex_lock(&bus->bus_lock);
 }
=20
 static __always_inline void qtnf_bus_unlock(struct qtnf_bus *bus)
+	RELEASE(bus->bus_lock)
 {
 	mutex_unlock(&bus->bus_lock);
 }
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wire=
less/realtek/rtw88/main.c
index 0cee0fd8c0ef..6bbcdd21bf47 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1531,6 +1531,7 @@ void rtw_power_off(struct rtw_dev *rtwdev)
 EXPORT_SYMBOL(rtw_power_off);
=20
 void rtw_core_stop(struct rtw_dev *rtwdev)
+	REQUIRES(rtwdev->mutex)
 {
 	struct rtw_coex *coex =3D &rtwdev->coex;
=20
diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wire=
less/realtek/rtw89/core.c
index 85f739f1173d..5b6649137c67 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -4582,6 +4582,7 @@ int rtw89_core_start(struct rtw89_dev *rtwdev)
 }
=20
 void rtw89_core_stop(struct rtw89_dev *rtwdev)
+	REQUIRES(rtwdev->mutex)
 {
 	struct rtw89_btc *btc =3D &rtwdev->btc;
=20
diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c b/drivers/net/=
wireless/realtek/rtw89/mac80211.c
index b3669e0074df..09a2fc36f12f 100644
--- a/drivers/net/wireless/realtek/rtw89/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
@@ -141,6 +141,7 @@ static int __rtw89_ops_add_iface_link(struct rtw89_de=
v *rtwdev,
=20
 static void __rtw89_ops_remove_iface_link(struct rtw89_dev *rtwdev,
 					  struct rtw89_vif_link *rtwvif_link)
+	REQUIRES(rtwdev->mutex)
 {
 	mutex_unlock(&rtwdev->mutex);
 	cancel_work_sync(&rtwvif_link->update_beacon_work);
@@ -1517,6 +1518,7 @@ static bool rtw89_ops_can_activate_links(struct iee=
e80211_hw *hw,
 static void __rtw89_ops_clr_vif_links(struct rtw89_dev *rtwdev,
 				      struct rtw89_vif *rtwvif,
 				      unsigned long clr_links)
+	REQUIRES(rtwdev->mutex)
 {
 	struct rtw89_vif_link *rtwvif_link;
 	unsigned int link_id;
diff --git a/drivers/net/wireless/realtek/rtw89/wow.c b/drivers/net/wirel=
ess/realtek/rtw89/wow.c
index 01754d031bb4..a1f94ff20734 100644
--- a/drivers/net/wireless/realtek/rtw89/wow.c
+++ b/drivers/net/wireless/realtek/rtw89/wow.c
@@ -596,6 +596,7 @@ static int rtw89_wow_get_aoac_rpt(struct rtw89_dev *r=
twdev, bool rx_ready)
=20
 static struct ieee80211_key_conf *rtw89_wow_gtk_rekey(struct rtw89_dev *=
rtwdev,
 						      u32 cipher, u8 keyidx, u8 *gtk)
+	REQUIRES(rtwdev->mutex)
 {
 	struct rtw89_vif_link *rtwvif_link =3D rtwdev->wow.rtwvif_link;
 	struct ieee80211_vif *wow_vif =3D rtwvif_link_to_vif(rtwvif_link);
@@ -636,6 +637,7 @@ static struct ieee80211_key_conf *rtw89_wow_gtk_rekey=
(struct rtw89_dev *rtwdev,
 }
=20
 static void rtw89_wow_update_key_info(struct rtw89_dev *rtwdev, bool rx_=
ready)
+	REQUIRES(rtwdev->mutex)
 {
 	struct rtw89_vif_link *rtwvif_link =3D rtwdev->wow.rtwvif_link;
 	struct ieee80211_vif *wow_vif =3D rtwvif_link_to_vif(rtwvif_link);
@@ -1346,6 +1348,7 @@ static int rtw89_wow_enable_trx_post(struct rtw89_d=
ev *rtwdev)
 }
=20
 static int rtw89_wow_disable_trx_pre(struct rtw89_dev *rtwdev)
+	REQUIRES(rtwdev->mutex)
 {
 	int ret;
=20
@@ -1673,6 +1676,7 @@ static int rtw89_wow_enable(struct rtw89_dev *rtwde=
v)
 }
=20
 static int rtw89_wow_disable(struct rtw89_dev *rtwdev)
+	REQUIRES(rtwdev->mutex)
 {
 	int ret;
=20
diff --git a/drivers/net/wireless/realtek/rtw89/wow.h b/drivers/net/wirel=
ess/realtek/rtw89/wow.h
index f91991e8f2e3..3f87a2ffd1ed 100644
--- a/drivers/net/wireless/realtek/rtw89/wow.h
+++ b/drivers/net/wireless/realtek/rtw89/wow.h
@@ -117,7 +117,7 @@ static inline bool rtw_wow_has_mgd_features(struct rt=
w89_dev *rtwdev)
 }
=20
 int rtw89_wow_suspend(struct rtw89_dev *rtwdev, struct cfg80211_wowlan *=
wowlan);
-int rtw89_wow_resume(struct rtw89_dev *rtwdev);
+int rtw89_wow_resume(struct rtw89_dev *rtwdev) REQUIRES(rtwdev->mutex);
 void rtw89_wow_parse_akm(struct rtw89_dev *rtwdev, struct sk_buff *skb);
 #else
 static inline
diff --git a/drivers/net/wireless/rsi/rsi_91x_hal.c b/drivers/net/wireles=
s/rsi/rsi_91x_hal.c
index 2cebe562a1f4..fd7ab68e5d95 100644
--- a/drivers/net/wireless/rsi/rsi_91x_hal.c
+++ b/drivers/net/wireless/rsi/rsi_91x_hal.c
@@ -39,6 +39,7 @@ static struct ta_metadata metadata[] =3D {{"pmemdata_du=
mmy", 0x00000000},
 };
=20
 int rsi_send_pkt_to_bus(struct rsi_common *common, struct sk_buff *skb)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct rsi_hw *adapter =3D common->priv;
 	int status;
diff --git a/drivers/net/wireless/st/cw1200/pm.c b/drivers/net/wireless/s=
t/cw1200/pm.c
index a20ab577a364..cb24177a51ad 100644
--- a/drivers/net/wireless/st/cw1200/pm.c
+++ b/drivers/net/wireless/st/cw1200/pm.c
@@ -155,6 +155,7 @@ int cw1200_can_suspend(struct cw1200_common *priv)
 EXPORT_SYMBOL_GPL(cw1200_can_suspend);
=20
 int cw1200_wow_suspend(struct ieee80211_hw *hw, struct cfg80211_wowlan *=
wowlan)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct cw1200_common *priv =3D hw->priv;
 	struct cw1200_pm_state *pm_state =3D &priv->pm_state;
@@ -300,6 +301,7 @@ int cw1200_wow_suspend(struct ieee80211_hw *hw, struc=
t cfg80211_wowlan *wowlan)
 }
=20
 int cw1200_wow_resume(struct ieee80211_hw *hw)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct cw1200_common *priv =3D hw->priv;
 	struct cw1200_pm_state *pm_state =3D &priv->pm_state;
diff --git a/drivers/net/wireless/ti/wl12xx/main.c b/drivers/net/wireless=
/ti/wl12xx/main.c
index ffbf54776330..47786790f5ae 100644
--- a/drivers/net/wireless/ti/wl12xx/main.c
+++ b/drivers/net/wireless/ti/wl12xx/main.c
@@ -1567,6 +1567,7 @@ static void wl12xx_set_tx_desc_csum(struct wl1271 *=
wl,
 }
=20
 static int wl12xx_plt_init(struct wl1271 *wl)
+	REQUIRES(wl->mutex)
 {
 	int ret;
=20
diff --git a/drivers/net/wireless/ti/wlcore/main.c b/drivers/net/wireless=
/ti/wlcore/main.c
index 8fb58a5d911c..248804a3a149 100644
--- a/drivers/net/wireless/ti/wlcore/main.c
+++ b/drivers/net/wireless/ti/wlcore/main.c
@@ -1868,6 +1868,7 @@ static int __maybe_unused wl1271_op_suspend(struct =
ieee80211_hw *hw,
 }
=20
 static int __maybe_unused wl1271_op_resume(struct ieee80211_hw *hw)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct wl1271 *wl =3D hw->priv;
 	struct wl12xx_vif *wlvif;
@@ -1978,6 +1979,7 @@ static int wl1271_op_start(struct ieee80211_hw *hw)
 }
=20
 static void wlcore_op_stop_locked(struct wl1271 *wl)
+	REQUIRES(wl->mutex)
 {
 	int i;
=20
@@ -2373,6 +2375,7 @@ static int wl12xx_init_vif_data(struct wl1271 *wl, =
struct ieee80211_vif *vif)
 }
=20
 static int wl12xx_init_fw(struct wl1271 *wl)
+	REQUIRES(wl->mutex)
 {
 	int retries =3D WL1271_BOOT_RETRIES;
 	bool booted =3D false;
@@ -2704,6 +2707,7 @@ static int wl1271_op_add_interface(struct ieee80211=
_hw *hw,
 static void __wl1271_op_remove_interface(struct wl1271 *wl,
 					 struct ieee80211_vif *vif,
 					 bool reset_tx_queues)
+	REQUIRES(wl->mutex)
 {
 	struct wl12xx_vif *wlvif =3D wl12xx_vif_to_data(vif);
 	int i, ret;
diff --git a/drivers/net/wireless/zydas/zd1211rw/zd_usb.c b/drivers/net/w=
ireless/zydas/zd1211rw/zd_usb.c
index 9ae10f65f2af..340ab10df4f0 100644
--- a/drivers/net/wireless/zydas/zd1211rw/zd_usb.c
+++ b/drivers/net/wireless/zydas/zd1211rw/zd_usb.c
@@ -1486,6 +1486,7 @@ static void zd_usb_stop(struct zd_usb *usb)
 }
=20
 static int pre_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct ieee80211_hw *hw =3D usb_get_intfdata(intf);
 	struct zd_mac *mac;
@@ -1506,6 +1507,7 @@ static int pre_reset(struct usb_interface *intf)
 }
=20
 static int post_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct ieee80211_hw *hw =3D usb_get_intfdata(intf);
 	struct zd_mac *mac;
diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
index 0ccf4a9e523a..0e126a5cc13a 100644
--- a/drivers/nvdimm/bus.c
+++ b/drivers/nvdimm/bus.c
@@ -933,6 +933,7 @@ u32 nd_cmd_out_size(struct nvdimm *nvdimm, int cmd,
 EXPORT_SYMBOL_GPL(nd_cmd_out_size);
=20
 void wait_nvdimm_bus_probe_idle(struct device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct nvdimm_bus *nvdimm_bus =3D walk_to_nvdimm_bus(dev);
=20
diff --git a/drivers/nvdimm/core.c b/drivers/nvdimm/core.c
index eaa796629c27..0ee4a4820d55 100644
--- a/drivers/nvdimm/core.c
+++ b/drivers/nvdimm/core.c
@@ -20,6 +20,7 @@ LIST_HEAD(nvdimm_bus_list);
 DEFINE_MUTEX(nvdimm_bus_list_mutex);
=20
 void nvdimm_bus_lock(struct device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct nvdimm_bus *nvdimm_bus =3D walk_to_nvdimm_bus(dev);
=20
@@ -30,6 +31,7 @@ void nvdimm_bus_lock(struct device *dev)
 EXPORT_SYMBOL(nvdimm_bus_lock);
=20
 void nvdimm_bus_unlock(struct device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct nvdimm_bus *nvdimm_bus =3D walk_to_nvdimm_bus(dev);
=20
diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_d=
evs.c
index 55cfbf1e0a95..12436ed4a80c 100644
--- a/drivers/nvdimm/namespace_devs.c
+++ b/drivers/nvdimm/namespace_devs.c
@@ -2036,6 +2036,7 @@ static struct device **scan_labels(struct nd_region=
 *nd_region)
 }
=20
 static struct device **create_namespaces(struct nd_region *nd_region)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex not a member of an argument */
 {
 	struct nd_mapping *nd_mapping;
 	struct device **devs;
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 40046770f1bf..651c6355f938 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1211,6 +1211,7 @@ u32 nvme_command_effects(struct nvme_ctrl *ctrl, st=
ruct nvme_ns *ns, u8 opcode)
 EXPORT_SYMBOL_NS_GPL(nvme_command_effects, "NVME_TARGET_PASSTHRU");
=20
 u32 nvme_passthru_start(struct nvme_ctrl *ctrl, struct nvme_ns *ns, u8 o=
pcode)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	u32 effects =3D nvme_command_effects(ctrl, ns, opcode);
=20
@@ -1232,6 +1233,7 @@ EXPORT_SYMBOL_NS_GPL(nvme_passthru_start, "NVME_TAR=
GET_PASSTHRU");
=20
 void nvme_passthru_end(struct nvme_ctrl *ctrl, struct nvme_ns *ns, u32 e=
ffects,
 		       struct nvme_command *cmd, int status)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	if (effects & NVME_CMD_EFFECTS_CSE_MASK) {
 		nvme_unfreeze(ctrl);
diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 278bed4e35bb..24953882a7fb 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1720,6 +1720,7 @@ static void nvme_init_queue(struct nvme_queue *nvme=
q, u16 qid)
  * Try getting shutdown_lock while setting up IO queues.
  */
 static int nvme_setup_io_queues_trylock(struct nvme_dev *dev)
+	TRY_ACQUIRE(0, dev->shutdown_lock)
 {
 	/*
 	 * Give up if the lock is being held by nvme_dev_disable.
diff --git a/drivers/nvmem/sc27xx-efuse.c b/drivers/nvmem/sc27xx-efuse.c
index 4e2ffefac96c..79eb3059c3ed 100644
--- a/drivers/nvmem/sc27xx-efuse.c
+++ b/drivers/nvmem/sc27xx-efuse.c
@@ -81,6 +81,7 @@ static const struct sc27xx_efuse_variant_data sc2730_ed=
ata =3D {
  * the multiple subsystems.
  */
 static int sc27xx_efuse_lock(struct sc27xx_efuse *efuse)
+	TRY_ACQUIRE(0, efuse->mutex)
 {
 	int ret;
=20
@@ -98,6 +99,7 @@ static int sc27xx_efuse_lock(struct sc27xx_efuse *efuse=
)
 }
=20
 static void sc27xx_efuse_unlock(struct sc27xx_efuse *efuse)
+	RELEASE(efuse->mutex)
 {
 	hwspin_unlock_raw(efuse->hwlock);
 	mutex_unlock(&efuse->mutex);
diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
index 1a7e4e5d8b86..90f58f378460 100644
--- a/drivers/nvmem/sprd-efuse.c
+++ b/drivers/nvmem/sprd-efuse.c
@@ -81,6 +81,7 @@ static const struct sprd_efuse_variant_data ums312_data=
 =3D {
  * the multiple subsystems.
  */
 static int sprd_efuse_lock(struct sprd_efuse *efuse)
+	TRY_ACQUIRE(0, efuse->mutex)
 {
 	int ret;
=20
@@ -98,6 +99,7 @@ static int sprd_efuse_lock(struct sprd_efuse *efuse)
 }
=20
 static void sprd_efuse_unlock(struct sprd_efuse *efuse)
+	RELEASE(efuse->mutex)
 {
 	hwspin_unlock_raw(efuse->hwlock);
 	mutex_unlock(&efuse->mutex);
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 0aba760f7577..80e528829af2 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -726,6 +726,7 @@ int __of_changeset_apply_entries(struct of_changeset =
*ocs, int *ret_revert)
  * final notification error is reported.
  */
 int __of_changeset_apply_notify(struct of_changeset *ocs)
+	REQUIRES(of_mutex)
 {
 	struct of_changeset_entry *ce;
 	int ret =3D 0, ret_tmp;
@@ -754,6 +755,7 @@ int __of_changeset_apply_notify(struct of_changeset *=
ocs)
  * is unknown if an apply error occurs.
  */
 static int __of_changeset_apply(struct of_changeset *ocs)
+	REQUIRES(of_mutex)
 {
 	int ret, ret_revert =3D 0;
=20
@@ -827,6 +829,7 @@ int __of_changeset_revert_entries(struct of_changeset=
 *ocs, int *ret_apply)
  * final notification error is reported.
  */
 int __of_changeset_revert_notify(struct of_changeset *ocs)
+	REQUIRES(of_mutex)
 {
 	struct of_changeset_entry *ce;
 	int ret =3D 0, ret_tmp;
@@ -847,6 +850,7 @@ int __of_changeset_revert_notify(struct of_changeset =
*ocs)
 }
=20
 static int __of_changeset_revert(struct of_changeset *ocs)
+	REQUIRES(of_mutex)
 {
 	int ret, ret_reply;
=20
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 434f6dd6a86c..dfbbe62b97f6 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -110,11 +110,13 @@ static int build_changeset_next_level(struct overla=
y_changeset *ovcs,
 static DEFINE_MUTEX(of_overlay_phandle_mutex);
=20
 void of_overlay_mutex_lock(void)
+	ACQUIRE(of_overlay_phandle_mutex)
 {
 	mutex_lock(&of_overlay_phandle_mutex);
 }
=20
 void of_overlay_mutex_unlock(void)
+	RELEASE(of_overlay_phandle_mutex)
 {
 	mutex_unlock(&of_overlay_phandle_mutex);
 }
diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 73e9a3b2f29b..efcc65159939 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1655,6 +1655,7 @@ struct opp_table *dev_pm_opp_get_opp_table(struct d=
evice *dev)
 EXPORT_SYMBOL_GPL(dev_pm_opp_get_opp_table);
=20
 static void _opp_table_kref_release(struct kref *kref)
+	RELEASE(opp_table_lock)
 {
 	struct opp_table *opp_table =3D container_of(kref, struct opp_table, kr=
ef);
 	struct opp_device *opp_dev, *temp;
@@ -1712,6 +1713,7 @@ void _opp_free(struct dev_pm_opp *opp)
 }
=20
 static void _opp_kref_release(struct kref *kref)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct dev_pm_opp *opp =3D container_of(kref, struct dev_pm_opp, kref);
 	struct opp_table *opp_table =3D opp->opp_table;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 869d204a70a3..8b56c7e962cf 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5117,6 +5117,7 @@ static int cxl_reset_bus_function(struct pci_dev *d=
ev, bool probe)
 }
=20
 void pci_dev_lock(struct pci_dev *dev)
+	ACQUIRE(dev->dev.mutex)
 {
 	/* block PM suspend, driver probe, etc. */
 	device_lock(&dev->dev);
@@ -5126,6 +5127,7 @@ EXPORT_SYMBOL_GPL(pci_dev_lock);
=20
 /* Return 1 on successful lock, 0 on contention */
 int pci_dev_trylock(struct pci_dev *dev)
+	TRY_ACQUIRE(1, dev->dev.mutex)
 {
 	if (device_trylock(&dev->dev)) {
 		if (pci_cfg_access_trylock(dev))
@@ -5138,6 +5140,7 @@ int pci_dev_trylock(struct pci_dev *dev)
 EXPORT_SYMBOL_GPL(pci_dev_trylock);
=20
 void pci_dev_unlock(struct pci_dev *dev)
+	RELEASE(dev->dev.mutex)
 {
 	pci_cfg_access_unlock(dev);
 	device_unlock(&dev->dev);
@@ -5306,6 +5309,7 @@ void pci_init_reset_methods(struct pci_dev *dev)
  * device doesn't support resetting a single function.
  */
 int pci_reset_function(struct pci_dev *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct pci_dev *bridge;
 	int rc;
@@ -5415,6 +5419,7 @@ static bool pci_bus_resettable(struct pci_bus *bus)
=20
 /* Lock devices from the top of the tree down */
 static void pci_bus_lock(struct pci_bus *bus)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct pci_dev *dev;
=20
@@ -5429,6 +5434,7 @@ static void pci_bus_lock(struct pci_bus *bus)
=20
 /* Unlock devices from the bottom of the tree up */
 static void pci_bus_unlock(struct pci_bus *bus)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	struct pci_dev *dev;
=20
@@ -5443,6 +5449,7 @@ static void pci_bus_unlock(struct pci_bus *bus)
=20
 /* Return 1 on successful lock, 0 on contention */
 static int pci_bus_trylock(struct pci_bus *bus)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct pci_dev *dev;
=20
@@ -5491,6 +5498,7 @@ static bool pci_slot_resettable(struct pci_slot *sl=
ot)
=20
 /* Lock devices from the top of the tree down */
 static void pci_slot_lock(struct pci_slot *slot)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct pci_dev *dev;
=20
@@ -5506,6 +5514,7 @@ static void pci_slot_lock(struct pci_slot *slot)
=20
 /* Unlock devices from the bottom of the tree up */
 static void pci_slot_unlock(struct pci_slot *slot)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	struct pci_dev *dev;
=20
@@ -5520,6 +5529,7 @@ static void pci_slot_unlock(struct pci_slot *slot)
=20
 /* Return 1 on successful lock, 0 on contention */
 static int pci_slot_trylock(struct pci_slot *slot)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct pci_dev *dev;
=20
diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 0a5e7efbce2c..fe6d9862d8d7 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -160,6 +160,7 @@ static int pcie_bwctrl_change_speed(struct pci_dev *p=
ort, u16 target_speed, bool
  */
 int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed=
_req,
 			  bool use_lt)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct pci_bus *bus =3D port->subordinate;
 	u16 target_speed;
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index b6536ed599c3..c43e16e074aa 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3399,12 +3399,14 @@ EXPORT_SYMBOL_GPL(pci_rescan_bus);
 static DEFINE_MUTEX(pci_rescan_remove_lock);
=20
 void pci_lock_rescan_remove(void)
+	ACQUIRE(pci_rescan_remove_lock)
 {
 	mutex_lock(&pci_rescan_remove_lock);
 }
 EXPORT_SYMBOL_GPL(pci_lock_rescan_remove);
=20
 void pci_unlock_rescan_remove(void)
+	RELEASE(pci_rescan_remove_lock)
 {
 	mutex_unlock(&pci_rescan_remove_lock);
 }
diff --git a/drivers/pci/switch/switchtec.c b/drivers/pci/switch/switchte=
c.c
index b14dfab04d84..27a68b7c3890 100644
--- a/drivers/pci/switch/switchtec.c
+++ b/drivers/pci/switch/switchtec.c
@@ -493,6 +493,7 @@ static int switchtec_dev_release(struct inode *inode,=
 struct file *filp)
 }
=20
 static int lock_mutex_and_test_alive(struct switchtec_dev *stdev)
+	TRY_ACQUIRE(0, stdev->mrpc_mutex)
 {
 	if (mutex_lock_interruptible(&stdev->mrpc_mutex))
 		return -EINTR;
diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonsta=
tic.c
index bf9d070a4496..e3b29115b4f6 100644
--- a/drivers/pcmcia/rsrc_nonstatic.c
+++ b/drivers/pcmcia/rsrc_nonstatic.c
@@ -262,6 +262,7 @@ static void do_io_probe(struct pcmcia_socket *s, unsi=
gned int base,
  */
 static int readable(struct pcmcia_socket *s, struct resource *res,
 		    unsigned int *count)
+	REQUIRES(s->ops_mutex)
 {
 	int ret =3D -EINVAL;
=20
diff --git a/drivers/perf/arm-cci.c b/drivers/perf/arm-cci.c
index 1cc3214d6b6d..6e6b8f02e68d 100644
--- a/drivers/perf/arm-cci.c
+++ b/drivers/perf/arm-cci.c
@@ -1068,6 +1068,7 @@ static void cci_pmu_put_hw(struct cci_pmu *cci_pmu)
 }
=20
 static void hw_perf_event_destroy(struct perf_event *event)
+	NO_THREAD_SAFETY_ANALYSIS /* needed because of a clang bug? */
 {
 	struct cci_pmu *cci_pmu =3D to_cci_pmu(event->pmu);
 	atomic_t *active_events =3D &cci_pmu->active_events;
diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-a=
w9523.c
index 9bf53de20be8..b4ed8ba45f4f 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -495,6 +495,7 @@ static irqreturn_t aw9523_irq_thread_func(int irq, vo=
id *dev_id)
  * @d: irq data
  */
 static void aw9523_irq_bus_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct aw9523 *awi =3D gpiochip_get_data(irq_data_get_irq_chip_data(d))=
;
=20
@@ -510,6 +511,7 @@ static void aw9523_irq_bus_lock(struct irq_data *d)
  * hardware, then unlocks the bus.
  */
 static void aw9523_irq_bus_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct aw9523 *awi =3D gpiochip_get_data(irq_data_get_irq_chip_data(d))=
;
=20
diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl=
-cy8c95x0.c
index 0d6c2027d4c1..bcb38bff5cae 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -963,6 +963,7 @@ static void cy8c95x0_irq_unmask(struct irq_data *d)
 }
=20
 static void cy8c95x0_irq_bus_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct cy8c95x0_pinctrl *chip =3D gpiochip_get_data(gc);
@@ -971,6 +972,7 @@ static void cy8c95x0_irq_bus_lock(struct irq_data *d)
 }
=20
 static void cy8c95x0_irq_bus_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct cy8c95x0_pinctrl *chip =3D gpiochip_get_data(gc);
diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
index b96e6368a956..3121776531e6 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -528,6 +528,7 @@ static int mcp23s08_irq_set_type(struct irq_data *dat=
a, unsigned int type)
 }
=20
 static void mcp23s08_irq_bus_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
 	struct mcp23s08 *mcp =3D gpiochip_get_data(gc);
@@ -537,6 +538,7 @@ static void mcp23s08_irq_bus_lock(struct irq_data *da=
ta)
 }
=20
 static void mcp23s08_irq_bus_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
 	struct mcp23s08 *mcp =3D gpiochip_get_data(gc);
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-st=
mfx.c
index aae01120dc52..62a4af0897b4 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -480,6 +480,7 @@ static int stmfx_pinctrl_irq_set_type(struct irq_data=
 *data, unsigned int type)
 }
=20
 static void stmfx_pinctrl_irq_bus_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct gpio_chip *gpio_chip =3D irq_data_get_irq_chip_data(data);
 	struct stmfx_pinctrl *pctl =3D gpiochip_get_data(gpio_chip);
@@ -488,6 +489,7 @@ static void stmfx_pinctrl_irq_bus_lock(struct irq_dat=
a *data)
 }
=20
 static void stmfx_pinctrl_irq_bus_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct gpio_chip *gpio_chip =3D irq_data_get_irq_chip_data(data);
 	struct stmfx_pinctrl *pctl =3D gpiochip_get_data(gpio_chip);
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-s=
x150x.c
index 98262b8ce43a..a96555814128 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -561,6 +561,7 @@ static irqreturn_t sx150x_irq_thread_fn(int irq, void=
 *dev_id)
 }
=20
 static void sx150x_irq_bus_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct sx150x_pinctrl *pctl =3D gpiochip_get_data(gc);
@@ -569,6 +570,7 @@ static void sx150x_irq_bus_lock(struct irq_data *d)
 }
=20
 static void sx150x_irq_bus_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct sx150x_pinctrl *pctl =3D gpiochip_get_data(gc);
diff --git a/drivers/platform/chrome/cros_ec_lpc_mec.c b/drivers/platform=
/chrome/cros_ec_lpc_mec.c
index a56584171168..db30a10c1e3a 100644
--- a/drivers/platform/chrome/cros_ec_lpc_mec.c
+++ b/drivers/platform/chrome/cros_ec_lpc_mec.c
@@ -32,6 +32,7 @@ static u16 mec_emi_base, mec_emi_end;
  * @return: Negative error code, or zero for success
  */
 static int cros_ec_lpc_mec_lock(void)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	bool success;
=20
@@ -54,6 +55,7 @@ static int cros_ec_lpc_mec_lock(void)
  * @return: Negative error code, or zero for success
  */
 static int cros_ec_lpc_mec_unlock(void)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	bool success;
=20
diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/pla=
tform/cznic/turris-omnia-mcu-gpio.c
index 5f35f7c5d5d7..c7c4a89fb7d9 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -611,6 +611,7 @@ static int omnia_irq_set_type(struct irq_data *d, uns=
igned int type)
 }
=20
 static void omnia_irq_bus_lock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct omnia_mcu *mcu =3D gpiochip_get_data(gc);
@@ -671,6 +672,7 @@ static void omnia_mask_deinterleave(const u8 *src, un=
signed long *rising,
 }
=20
 static void omnia_irq_bus_sync_unlock(struct irq_data *d)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct omnia_mcu *mcu =3D gpiochip_get_data(gc);
diff --git a/drivers/platform/x86/intel/crystal_cove_charger.c b/drivers/=
platform/x86/intel/crystal_cove_charger.c
index e4299cfa2205..b3ce0ce35e8b 100644
--- a/drivers/platform/x86/intel/crystal_cove_charger.c
+++ b/drivers/platform/x86/intel/crystal_cove_charger.c
@@ -44,6 +44,7 @@ static irqreturn_t crystal_cove_charger_irq(int irq, vo=
id *data)
 }
=20
 static void crystal_cove_charger_irq_bus_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct crystal_cove_charger_data *charger =3D irq_data_get_irq_chip_dat=
a(data);
=20
@@ -51,6 +52,7 @@ static void crystal_cove_charger_irq_bus_lock(struct ir=
q_data *data)
 }
=20
 static void crystal_cove_charger_irq_bus_sync_unlock(struct irq_data *da=
ta)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct crystal_cove_charger_data *charger =3D irq_data_get_irq_chip_dat=
a(data);
=20
diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 6c94137865c9..1f3d60db63d4 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -52,22 +52,26 @@ struct genpd_lock_ops {
 };
=20
 static void genpd_lock_mtx(struct generic_pm_domain *genpd)
+	ACQUIRE(genpd->mlock)
 {
 	mutex_lock(&genpd->mlock);
 }
=20
 static void genpd_lock_nested_mtx(struct generic_pm_domain *genpd,
 					int depth)
+	ACQUIRE(genpd->mlock)
 {
 	mutex_lock_nested(&genpd->mlock, depth);
 }
=20
 static int genpd_lock_interruptible_mtx(struct generic_pm_domain *genpd)
+	TRY_ACQUIRE(0, genpd->mlock)
 {
 	return mutex_lock_interruptible(&genpd->mlock);
 }
=20
 static void genpd_unlock_mtx(struct generic_pm_domain *genpd)
+	RELEASE(genpd->mlock)
 {
 	return mutex_unlock(&genpd->mlock);
 }
diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
index cb0f93800138..0ea40df640dd 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -217,6 +217,7 @@ static struct rockchip_pmu *dmc_pmu;
  * Caller must unblock PMU transitions via rockchip_pmu_unblock().
  */
 int rockchip_pmu_block(void)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct rockchip_pmu *pmu;
 	struct generic_pm_domain *genpd;
@@ -280,6 +281,7 @@ EXPORT_SYMBOL_GPL(rockchip_pmu_block);
=20
 /* Unblock PMU transitions. */
 void rockchip_pmu_unblock(void)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct rockchip_pmu *pmu;
 	struct generic_pm_domain *genpd;
diff --git a/drivers/pnp/isapnp/core.c b/drivers/pnp/isapnp/core.c
index 261bf85b0200..99c392141255 100644
--- a/drivers/pnp/isapnp/core.c
+++ b/drivers/pnp/isapnp/core.c
@@ -802,6 +802,7 @@ int isapnp_present(void)
 }
=20
 int isapnp_cfg_begin(int csn, int logdev)
+	TRY_ACQUIRE(0, isapnp_cfg_mutex)
 {
 	if (csn < 1 || csn > isapnp_csn_count || logdev > 10)
 		return -EINVAL;
@@ -829,6 +830,7 @@ int isapnp_cfg_begin(int csn, int logdev)
 }
=20
 int isapnp_cfg_end(void)
+	RELEASE(isapnp_cfg_mutex)
 {
 	isapnp_wait();
 	mutex_unlock(&isapnp_cfg_mutex);
diff --git a/drivers/power/supply/da9150-fg.c b/drivers/power/supply/da91=
50-fg.c
index 652c1f213af1..5f282557e695 100644
--- a/drivers/power/supply/da9150-fg.c
+++ b/drivers/power/supply/da9150-fg.c
@@ -123,6 +123,7 @@ static void da9150_fg_write_attr(struct da9150_fg *fg=
, u8 code, u8 size,
=20
 /* Trigger QIF Sync to update QIF readable data */
 static void da9150_fg_read_sync_start(struct da9150_fg *fg)
+	ACQUIRE(fg->io_lock)
 {
 	int i =3D 0;
 	u32 res =3D 0;
@@ -155,6 +156,7 @@ static void da9150_fg_read_sync_start(struct da9150_f=
g *fg)
  * attributes required have been accessed.
  */
 static inline void da9150_fg_read_sync_end(struct da9150_fg *fg)
+	RELEASE(fg->io_lock)
 {
 	mutex_unlock(&fg->io_lock);
 }
diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/sup=
ply/power_supply_core.c
index d0bb52a7a036..a95c5a7718b8 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -173,6 +173,7 @@ EXPORT_SYMBOL_GPL(power_supply_changed);
  * Avoid that by waiting on parent's mutex.
  */
 static void power_supply_deferred_register_work(struct work_struct *work=
)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct power_supply *psy =3D container_of(work, struct power_supply,
 						deferred_register_work.work);
diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index ccd54c089bab..47a4e78081e7 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -32,6 +32,7 @@ static DEFINE_MUTEX(pwm_lock);
 static DEFINE_IDR(pwm_chips);
=20
 static void pwmchip_lock(struct pwm_chip *chip)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (chip->atomic)
 		spin_lock(&chip->atomic_lock);
@@ -40,6 +41,7 @@ static void pwmchip_lock(struct pwm_chip *chip)
 }
=20
 static void pwmchip_unlock(struct pwm_chip *chip)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (chip->atomic)
 		spin_unlock(&chip->atomic_lock);
@@ -1385,6 +1387,7 @@ ATTRIBUTE_GROUPS(pwm_chip);
 static struct pwm_export *pwm_class_get_state(struct device *pwmchip_dev=
,
 					      struct pwm_device *pwm,
 					      struct pwm_state *state)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct device *pwm_dev;
 	struct pwm_export *export;
@@ -1408,6 +1411,7 @@ static struct pwm_export *pwm_class_get_state(struc=
t device *pwmchip_dev,
 static int pwm_class_apply_state(struct pwm_export *export,
 				 struct pwm_device *pwm,
 				 struct pwm_state *state)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	int ret =3D pwm_apply_might_sleep(pwm, state);
=20
@@ -1418,6 +1422,7 @@ static int pwm_class_apply_state(struct pwm_export =
*export,
 }
=20
 static int pwm_class_resume_npwm(struct device *pwmchip_dev, unsigned in=
t npwm)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct pwm_chip *chip =3D pwmchip_from_dev(pwmchip_dev);
 	unsigned int i;
@@ -1449,6 +1454,7 @@ static int pwm_class_resume_npwm(struct device *pwm=
chip_dev, unsigned int npwm)
 }
=20
 static int pwm_class_suspend(struct device *pwmchip_dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct pwm_chip *chip =3D pwmchip_from_dev(pwmchip_dev);
 	unsigned int i;
@@ -2230,6 +2236,7 @@ static void pwm_dbg_show(struct pwm_chip *chip, str=
uct seq_file *s)
 }
=20
 static void *pwm_seq_start(struct seq_file *s, loff_t *pos)
+	ACQUIRE(pwm_lock)
 {
 	unsigned long id =3D *pos;
 	void *ret;
@@ -2255,6 +2262,7 @@ static void *pwm_seq_next(struct seq_file *s, void =
*v, loff_t *pos)
 }
=20
 static void pwm_seq_stop(struct seq_file *s, void *v)
+	RELEASE(pwm_lock)
 {
 	mutex_unlock(&pwm_lock);
 }
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 89578b91c468..09f1072fddb1 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -6331,6 +6331,7 @@ static int regulator_summary_lock_all(struct ww_acq=
uire_ctx *ww_ctx,
 }
=20
 static void regulator_summary_lock(struct ww_acquire_ctx *ww_ctx)
+	ACQUIRE(regulator_list_mutex)
 {
 	struct regulator_dev *new_contended_rdev =3D NULL;
 	struct regulator_dev *old_contended_rdev =3D NULL;
@@ -6361,6 +6362,7 @@ static void regulator_summary_lock(struct ww_acquir=
e_ctx *ww_ctx)
 }
=20
 static void regulator_summary_unlock(struct ww_acquire_ctx *ww_ctx)
+	RELEASE(regulator_list_mutex)
 {
 	class_for_each_device(&regulator_class, NULL, NULL,
 			      regulator_summary_unlock_one);
diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_sc=
p_ipi.c
index c068227e251e..f24b409d0128 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -117,6 +117,7 @@ EXPORT_SYMBOL_GPL(scp_memcpy_aligned);
  * Note: This should not be used by drivers other than mtk_scp.
  */
 void scp_ipi_lock(struct mtk_scp *scp, u32 id)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex array */
 {
 	if (WARN_ON(id >=3D SCP_IPI_MAX))
 		return;
@@ -133,6 +134,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_lock);
  * Note: This should not be used by drivers other than mtk_scp.
  */
 void scp_ipi_unlock(struct mtk_scp *scp, u32 id)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex array */
 {
 	if (WARN_ON(id >=3D SCP_IPI_MAX))
 		return;
diff --git a/drivers/scsi/aacraid/commctrl.c b/drivers/scsi/aacraid/commc=
trl.c
index 68240d6f27ab..c932d17e33eb 100644
--- a/drivers/scsi/aacraid/commctrl.c
+++ b/drivers/scsi/aacraid/commctrl.c
@@ -1043,6 +1043,7 @@ struct aac_reset_iop {
 };
=20
 static int aac_send_reset_adapter(struct aac_dev *dev, void __user *arg)
+	REQUIRES(dev->ioctl_mutex)
 {
 	struct aac_reset_iop reset;
 	int retval;
diff --git a/drivers/scsi/fnic/fnic_scsi.c b/drivers/scsi/fnic/fnic_scsi.=
c
index 7133b254cbe4..4b397af20fb2 100644
--- a/drivers/scsi/fnic/fnic_scsi.c
+++ b/drivers/scsi/fnic/fnic_scsi.c
@@ -2535,6 +2535,7 @@ static int fnic_clean_pending_aborts(struct fnic *f=
nic,
  * on the LUN.
  */
 int fnic_device_reset(struct scsi_cmnd *sc)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct request *rq =3D scsi_cmd_to_rq(sc);
 	struct fnic *fnic;
diff --git a/drivers/scsi/libfc/fc_disc.c b/drivers/scsi/libfc/fc_disc.c
index 60d621ad0024..d5d8f0740cd5 100644
--- a/drivers/scsi/libfc/fc_disc.c
+++ b/drivers/scsi/libfc/fc_disc.c
@@ -37,7 +37,7 @@
 #define FC_DISC_RETRY_LIMIT	3	/* max retries */
 #define FC_DISC_RETRY_DELAY	500UL	/* (msecs) delay */
=20
-static void fc_disc_gpn_ft_req(struct fc_disc *);
+static void fc_disc_gpn_ft_req(struct fc_disc *disc) REQUIRES(disc->disc=
_mutex);
 static void fc_disc_gpn_ft_resp(struct fc_seq *, struct fc_frame *, void=
 *);
 static void fc_disc_done(struct fc_disc *, enum fc_disc_event);
 static void fc_disc_timeout(struct work_struct *);
@@ -200,6 +200,7 @@ static void fc_disc_recv_req(struct fc_lport *lport, =
struct fc_frame *fp)
  * @disc: The discovery object to be restarted
  */
 static void fc_disc_restart(struct fc_disc *disc)
+	REQUIRES(disc->disc_mutex)
 {
 	lockdep_assert_held(&disc->disc_mutex);
=20
@@ -250,6 +251,7 @@ static void fc_disc_start(void (*disc_callback)(struc=
t fc_lport *,
  * @event: The discovery completion status
  */
 static void fc_disc_done(struct fc_disc *disc, enum fc_disc_event event)
+	REQUIRES(disc->disc_mutex)
 {
 	struct fc_lport *lport =3D fc_disc_lport(disc);
 	struct fc_rport_priv *rdata;
@@ -294,6 +296,7 @@ static void fc_disc_done(struct fc_disc *disc, enum f=
c_disc_event event)
  * @fp:	  The error code encoded as a frame pointer
  */
 static void fc_disc_error(struct fc_disc *disc, struct fc_frame *fp)
+	REQUIRES(disc->disc_mutex)
 {
 	struct fc_lport *lport =3D fc_disc_lport(disc);
 	unsigned long delay =3D 0;
@@ -374,6 +377,7 @@ static void fc_disc_gpn_ft_req(struct fc_disc *disc)
  * Goes through the list of IDs and names resulting from a request.
  */
 static int fc_disc_gpn_ft_parse(struct fc_disc *disc, void *buf, size_t =
len)
+	REQUIRES(disc->disc_mutex)
 {
 	struct fc_lport *lport;
 	struct fc_gpn_ft_resp *np;
diff --git a/drivers/scsi/libiscsi.c b/drivers/scsi/libiscsi.c
index 2b1bf990a9dc..71f1f4bb1d65 100644
--- a/drivers/scsi/libiscsi.c
+++ b/drivers/scsi/libiscsi.c
@@ -1914,6 +1914,7 @@ static int iscsi_exec_task_mgmt_fn(struct iscsi_con=
n *conn,
 				   struct iscsi_tm *hdr, int age,
 				   int timeout)
 	__must_hold(&session->frwd_lock)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(conn->session->frwd_lock) */
 {
 	struct iscsi_session *session =3D conn->session;
=20
diff --git a/drivers/scsi/megaraid/megaraid_sas.h b/drivers/scsi/megaraid=
/megaraid_sas.h
index 088cc40ae866..cccec5cce928 100644
--- a/drivers/scsi/megaraid/megaraid_sas.h
+++ b/drivers/scsi/megaraid/megaraid_sas.h
@@ -2696,7 +2696,8 @@ __le16 get_updated_dev_handle(struct megasas_instan=
ce *instance,
 			      struct MR_DRV_RAID_MAP_ALL *drv_map);
 void mr_update_load_balance_params(struct MR_DRV_RAID_MAP_ALL *map,
 	struct LD_LOAD_BALANCE_INFO *lbInfo);
-int megasas_get_ctrl_info(struct megasas_instance *instance);
+int megasas_get_ctrl_info(struct megasas_instance *instance)
+	REQUIRES(instance->reset_mutex);
 /* PD sequence */
 int
 megasas_sync_pd_seq_num(struct megasas_instance *instance, bool pend);
diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/meg=
araid/megaraid_sas_base.c
index d85f990aec88..1031e04a2092 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -132,14 +132,16 @@ MODULE_AUTHOR("megaraidlinux.pdl@broadcom.com");
 MODULE_DESCRIPTION("Broadcom MegaRAID SAS Driver");
=20
 int megasas_transition_to_ready(struct megasas_instance *instance, int o=
cr);
-static int megasas_get_pd_list(struct megasas_instance *instance);
+static int megasas_get_pd_list(struct megasas_instance *instance)
+	REQUIRES(instance->reset_mutex);
 static int megasas_ld_list_query(struct megasas_instance *instance,
-				 u8 query_type);
+				 u8 query_type) REQUIRES(instance->reset_mutex);
 static int megasas_issue_init_mfi(struct megasas_instance *instance);
 static int megasas_register_aen(struct megasas_instance *instance,
 				u32 seq_num, u32 class_locale_word);
 static void megasas_get_pd_info(struct megasas_instance *instance,
-				struct scsi_device *sdev);
+				struct scsi_device *sdev)
+	REQUIRES(instance->reset_mutex);
 static void
 megasas_set_ld_removed_by_fw(struct megasas_instance *instance);
=20
@@ -229,7 +231,8 @@ megasas_adp_reset_gen2(struct megasas_instance *insta=
nce,
 		       struct megasas_register_set __iomem *reg_set);
 static irqreturn_t megasas_isr(int irq, void *devp);
 static u32
-megasas_init_adapter_mfi(struct megasas_instance *instance);
+megasas_init_adapter_mfi(struct megasas_instance *instance)
+	REQUIRES(instance->reset_mutex);
 u32
 megasas_build_and_issue_cmd(struct megasas_instance *instance,
 			    struct scsi_cmnd *scmd);
@@ -4751,6 +4754,7 @@ megasas_get_pd_list(struct megasas_instance *instan=
ce)
  */
 static int
 megasas_get_ld_list(struct megasas_instance *instance)
+	REQUIRES(instance->reset_mutex)
 {
 	int ret =3D 0, ld_index =3D 0, ids =3D 0;
 	struct megasas_cmd *cmd;
@@ -4990,6 +4994,7 @@ megasas_ld_list_query(struct megasas_instance *inst=
ance, u8 query_type)
 static int
 megasas_host_device_list_query(struct megasas_instance *instance,
 			       bool is_probe)
+	REQUIRES(instance->reset_mutex)
 {
 	int ret, i, target_id;
 	struct megasas_cmd *cmd;
@@ -5176,6 +5181,7 @@ static void megasas_update_ext_vd_details(struct me=
gasas_instance *instance)
  * Status:			 MFI_STAT_OK- Command successful
  */
 void megasas_get_snapdump_properties(struct megasas_instance *instance)
+	REQUIRES(instance->reset_mutex)
 {
 	int ret =3D 0;
 	struct megasas_cmd *cmd;
@@ -5871,6 +5877,7 @@ static void megasas_setup_reply_map(struct megasas_=
instance *instance)
  */
 static
 int megasas_get_device_list(struct megasas_instance *instance)
+	REQUIRES(instance->reset_mutex)
 {
 	if (instance->enable_fw_dev_list) {
 		if (megasas_host_device_list_query(instance, true))
@@ -6010,6 +6017,7 @@ megasas_alloc_irq_vectors(struct megasas_instance *=
instance)
  */
=20
 static int megasas_init_fw(struct megasas_instance *instance)
+	REQUIRES(instance->reset_mutex)
 {
 	u32 max_sectors_1;
 	u32 max_sectors_2, tmp_sectors, msix_enable;
@@ -6793,6 +6801,7 @@ megasas_register_aen(struct megasas_instance *insta=
nce, u32 seq_num,
 int
 megasas_get_target_prop(struct megasas_instance *instance,
 			struct scsi_device *sdev)
+	REQUIRES(instance->reset_mutex)
 {
 	int ret;
 	struct megasas_cmd *cmd;
@@ -7454,6 +7463,7 @@ static inline void megasas_init_ctrl_params(struct =
megasas_instance *instance)
  */
 static int megasas_probe_one(struct pci_dev *pdev,
 			     const struct pci_device_id *id)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	int rval, pos;
 	struct Scsi_Host *host;
@@ -7778,6 +7788,7 @@ megasas_suspend(struct device *dev)
  */
 static int __maybe_unused
 megasas_resume(struct device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	int rval;
 	struct Scsi_Host *host;
@@ -8754,6 +8765,7 @@ static inline void megasas_remove_scsi_device(struc=
t scsi_device *sdev)
 static
 int megasas_update_device_list(struct megasas_instance *instance,
 			       int event_type)
+	REQUIRES(instance->reset_mutex)
 {
 	int dcmd_ret;
=20
diff --git a/drivers/scsi/megaraid/megaraid_sas_fusion.c b/drivers/scsi/m=
egaraid/megaraid_sas_fusion.c
index 1eec23da28e2..2a715978683b 100644
--- a/drivers/scsi/megaraid/megaraid_sas_fusion.c
+++ b/drivers/scsi/megaraid/megaraid_sas_fusion.c
@@ -1794,6 +1794,7 @@ static inline void megasas_free_ioc_init_cmd(struct=
 megasas_instance *instance)
  */
 static u32
 megasas_init_adapter_fusion(struct megasas_instance *instance)
+	REQUIRES(instance->reset_mutex)
 {
 	struct fusion_context *fusion;
 	u32 scratch_pad_1;
@@ -4529,6 +4530,7 @@ static int
 megasas_issue_tm(struct megasas_instance *instance, u16 device_handle,
 	uint channel, uint id, u16 smid_task, u8 type,
 	struct MR_PRIV_DEVICE *mr_device_priv_data)
+	REQUIRES(instance->reset_mutex)
 {
 	struct MR_TASK_MANAGE_REQUEST *mr_request;
 	struct MPI2_SCSI_TASK_MANAGE_REQUEST *mpi_request;
diff --git a/drivers/scsi/scsi_transport_iscsi.c b/drivers/scsi/scsi_tran=
sport_iscsi.c
index 9c347c64c315..09d262f735dc 100644
--- a/drivers/scsi/scsi_transport_iscsi.c
+++ b/drivers/scsi/scsi_transport_iscsi.c
@@ -2241,6 +2241,7 @@ static void iscsi_ep_disconnect(struct iscsi_cls_co=
nn *conn, bool is_active)
 static void iscsi_if_disconnect_bound_ep(struct iscsi_cls_conn *conn,
 					 struct iscsi_endpoint *ep,
 					 bool is_active)
+	REQUIRES(conn->ep_mutex)
 {
 	/* Check if this was a conn error and the kernel took ownership */
 	spin_lock_irq(&conn->lock);
diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index effb7e768165..338a9a6acfd9 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -244,6 +244,7 @@ static int sg_allow_access(struct file *filp, unsigne=
d char *cmd)
=20
 static int
 open_wait(Sg_device *sdp, int flags)
+	REQUIRES(sdp->open_rel_lock)
 {
 	int retval =3D 0;
=20
diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpq=
i/smartpqi_init.c
index 0da7be40c925..3589907b9bdc 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -303,12 +303,14 @@ static inline void pqi_save_fw_triage_setting(struc=
t pqi_ctrl_info *ctrl_info, b
 }
=20
 static inline void pqi_ctrl_block_scan(struct pqi_ctrl_info *ctrl_info)
+	ACQUIRE(ctrl_info->scan_mutex)
 {
 	ctrl_info->scan_blocked =3D true;
 	mutex_lock(&ctrl_info->scan_mutex);
 }
=20
 static inline void pqi_ctrl_unblock_scan(struct pqi_ctrl_info *ctrl_info=
)
+	RELEASE(ctrl_info->scan_mutex)
 {
 	ctrl_info->scan_blocked =3D false;
 	mutex_unlock(&ctrl_info->scan_mutex);
@@ -320,11 +322,13 @@ static inline bool pqi_ctrl_scan_blocked(struct pqi=
_ctrl_info *ctrl_info)
 }
=20
 static inline void pqi_ctrl_block_device_reset(struct pqi_ctrl_info *ctr=
l_info)
+	ACQUIRE(ctrl_info->lun_reset_mutex)
 {
 	mutex_lock(&ctrl_info->lun_reset_mutex);
 }
=20
 static inline void pqi_ctrl_unblock_device_reset(struct pqi_ctrl_info *c=
trl_info)
+	RELEASE(ctrl_info->lun_reset_mutex)
 {
 	mutex_unlock(&ctrl_info->lun_reset_mutex);
 }
@@ -427,11 +431,13 @@ static inline bool pqi_device_offline(struct pqi_sc=
si_dev *device)
 }
=20
 static inline void pqi_ctrl_ofa_start(struct pqi_ctrl_info *ctrl_info)
+	ACQUIRE(ctrl_info->ofa_mutex)
 {
 	mutex_lock(&ctrl_info->ofa_mutex);
 }
=20
 static inline void pqi_ctrl_ofa_done(struct pqi_ctrl_info *ctrl_info)
+	RELEASE(ctrl_info->ofa_mutex)
 {
 	mutex_unlock(&ctrl_info->ofa_mutex);
 }
@@ -2187,6 +2193,7 @@ static inline bool pqi_volume_rescan_needed(struct =
pqi_scsi_dev *device)
=20
 static void pqi_update_device_list(struct pqi_ctrl_info *ctrl_info,
 	struct pqi_scsi_dev *new_device_list[], unsigned int num_new_devices)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int rc;
 	unsigned int i;
@@ -3614,6 +3621,7 @@ static enum pqi_soft_reset_status pqi_poll_for_soft=
_reset_status(
 }
=20
 static void pqi_process_soft_reset(struct pqi_ctrl_info *ctrl_info)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int rc;
 	unsigned int delay_secs;
@@ -3669,6 +3677,7 @@ static void pqi_process_soft_reset(struct pqi_ctrl_=
info *ctrl_info)
 }
=20
 static void pqi_ofa_memory_alloc_worker(struct work_struct *work)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct pqi_ctrl_info *ctrl_info;
=20
@@ -3695,6 +3704,7 @@ static void pqi_ofa_quiesce_worker(struct work_stru=
ct *work)
=20
 static bool pqi_ofa_process_event(struct pqi_ctrl_info *ctrl_info,
 	struct pqi_event *event)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	bool ack_event;
=20
@@ -3759,6 +3769,7 @@ static void pqi_disable_raid_bypass(struct pqi_ctrl=
_info *ctrl_info)
 }
=20
 static void pqi_event_worker(struct work_struct *work)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	unsigned int i;
 	bool rescan_needed;
@@ -8547,6 +8558,7 @@ static void pqi_reinit_queues(struct pqi_ctrl_info =
*ctrl_info)
 }
=20
 static int pqi_ctrl_init_resume(struct pqi_ctrl_info *ctrl_info)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int rc;
=20
@@ -8882,6 +8894,7 @@ static void pqi_remove_ctrl(struct pqi_ctrl_info *c=
trl_info)
 }
=20
 static void pqi_ofa_ctrl_quiesce(struct pqi_ctrl_info *ctrl_info)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	pqi_ctrl_block_scan(ctrl_info);
 	pqi_scsi_block_requests(ctrl_info);
@@ -8892,6 +8905,7 @@ static void pqi_ofa_ctrl_quiesce(struct pqi_ctrl_in=
fo *ctrl_info)
 }
=20
 static void pqi_ofa_ctrl_unquiesce(struct pqi_ctrl_info *ctrl_info)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	pqi_start_heartbeat_timer(ctrl_info);
 	pqi_ctrl_unblock_requests(ctrl_info);
@@ -9313,6 +9327,7 @@ static void pqi_crash_if_pending_command(struct pqi=
_ctrl_info *ctrl_info)
 }
=20
 static void pqi_shutdown(struct pci_dev *pci_dev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int rc;
 	struct pqi_ctrl_info *ctrl_info;
@@ -9407,6 +9422,7 @@ static inline enum bmic_flush_cache_shutdown_event =
pqi_get_flush_cache_shutdown_
 }
=20
 static int pqi_suspend_or_freeze(struct device *dev, bool suspend)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct pci_dev *pci_dev;
 	struct pqi_ctrl_info *ctrl_info;
@@ -9445,6 +9461,7 @@ static __maybe_unused int pqi_suspend(struct device=
 *dev)
 }
=20
 static int pqi_resume_or_restore(struct device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int rc;
 	struct pci_dev *pci_dev;
@@ -9473,6 +9490,7 @@ static int pqi_freeze(struct device *dev)
 }
=20
 static int pqi_thaw(struct device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int rc;
 	struct pci_dev *pci_dev;
diff --git a/drivers/siox/siox-core.c b/drivers/siox/siox-core.c
index f98f5a27e659..6264baa79735 100644
--- a/drivers/siox/siox-core.c
+++ b/drivers/siox/siox-core.c
@@ -39,11 +39,13 @@
 static bool siox_is_registered;
=20
 static void siox_master_lock(struct siox_master *smaster)
+	ACQUIRE(smaster->lock)
 {
 	mutex_lock(&smaster->lock);
 }
=20
 static void siox_master_unlock(struct siox_master *smaster)
+	RELEASE(smaster->lock)
 {
 	mutex_unlock(&smaster->lock);
 }
diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd=
_mapper.c
index 154ca5beb471..1dc805d31a44 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -665,6 +665,7 @@ static int qcom_pdm_probe(struct auxiliary_device *au=
xdev,
 }
=20
 static void qcom_pdm_remove(struct auxiliary_device *auxdev)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct qcom_pdm_data *data;
=20
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index a08c377933c5..6b41161ca6bb 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2511,6 +2511,7 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc=
)
=20
 static int tegra_pmc_clk_notify_cb(struct notifier_block *nb,
 				   unsigned long action, void *ptr)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct tegra_pmc *pmc =3D container_of(nb, struct tegra_pmc, clk_nb);
 	struct clk_notifier_data *data =3D ptr;
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index e9df503332bb..442d7eee968d 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -811,6 +811,7 @@ static int sdw_ml_sync_bank_switch(struct sdw_bus *bu=
s, bool multi_link)
 }
=20
 static int do_bank_switch(struct sdw_stream_runtime *stream)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct sdw_master_runtime *m_rt;
 	const struct sdw_master_ops *ops;
@@ -1357,6 +1358,7 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct =
sdw_slave *slave,
  * expected that a global lock is held before acquiring bus_lock.
  */
 static void sdw_acquire_bus_lock(struct sdw_stream_runtime *stream)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct sdw_master_runtime *m_rt;
 	struct sdw_bus *bus;
@@ -1379,6 +1381,7 @@ static void sdw_acquire_bus_lock(struct sdw_stream_=
runtime *stream)
  * expected that a global lock is held before releasing bus_lock.
  */
 static void sdw_release_bus_lock(struct sdw_stream_runtime *stream)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct sdw_master_runtime *m_rt;
 	struct sdw_bus *bus;
diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index a9f0f47f4759..635ea7eb50e7 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -273,6 +273,7 @@ bool spi_mem_supports_op(struct spi_mem *mem, const s=
truct spi_mem_op *op)
 EXPORT_SYMBOL_GPL(spi_mem_supports_op);
=20
 static int spi_mem_access_start(struct spi_mem *mem)
+	NO_THREAD_SAFETY_ANALYSIS /* requires alias analysis */
 {
 	struct spi_controller *ctlr =3D mem->spi->controller;
=20
@@ -300,6 +301,7 @@ static int spi_mem_access_start(struct spi_mem *mem)
 }
=20
 static void spi_mem_access_end(struct spi_mem *mem)
+	NO_THREAD_SAFETY_ANALYSIS /* requires alias analysis */
 {
 	struct spi_controller *ctlr =3D mem->spi->controller;
=20
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index a7a4647717d4..fc65a43b40c8 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -4627,6 +4627,7 @@ EXPORT_SYMBOL_GPL(spi_sync_locked);
  * Return: always zero.
  */
 int spi_bus_lock(struct spi_controller *ctlr)
+	ACQUIRE(ctlr->bus_lock_mutex)
 {
 	unsigned long flags;
=20
@@ -4656,6 +4657,7 @@ EXPORT_SYMBOL_GPL(spi_bus_lock);
  * Return: always zero.
  */
 int spi_bus_unlock(struct spi_controller *ctlr)
+	RELEASE(ctlr->bus_lock_mutex)
 {
 	ctlr->bus_lock_flag =3D 0;
=20
@@ -4693,6 +4695,7 @@ static u8	*buf;
 int spi_write_then_read(struct spi_device *spi,
 		const void *txbuf, unsigned n_tx,
 		void *rxbuf, unsigned n_rx)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	static DEFINE_MUTEX(lock);
=20
diff --git a/drivers/ssb/main.c b/drivers/ssb/main.c
index aa6165e3db4a..39cfeca88f8d 100644
--- a/drivers/ssb/main.c
+++ b/drivers/ssb/main.c
@@ -399,6 +399,7 @@ static const struct bus_type ssb_bustype =3D {
 };
=20
 static void ssb_buses_lock(void)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	/* See the comment at the ssb_is_early_boot definition */
 	if (!ssb_is_early_boot)
@@ -406,6 +407,7 @@ static void ssb_buses_lock(void)
 }
=20
 static void ssb_buses_unlock(void)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	/* See the comment at the ssb_is_early_boot definition */
 	if (!ssb_is_early_boot)
diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/li=
ght.c
index e509fdc715db..1c8757c9b665 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -156,11 +156,13 @@ static int gb_lights_color_set(struct gb_channel *c=
hannel, u32 color);
 static int gb_lights_fade_set(struct gb_channel *channel);
=20
 static void led_lock(struct led_classdev *cdev)
+	ACQUIRE(cdev->led_access)
 {
 	mutex_lock(&cdev->led_access);
 }
=20
 static void led_unlock(struct led_classdev *cdev)
+	RELEASE(cdev->led_access)
 {
 	mutex_unlock(&cdev->led_access);
 }
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 8d5795db4f39..1ba7bbc2a3e9 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -942,6 +942,7 @@ queue_message(struct vchiq_state *state, struct vchiq=
_service *service,
 	      ssize_t (*copy_callback)(void *context, void *dest,
 				       size_t offset, size_t maxsize),
 	      void *context, size_t size, int flags)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct vchiq_shared_state *local;
 	struct vchiq_service_quota *quota =3D NULL;
diff --git a/drivers/target/iscsi/iscsi_target_tpg.c b/drivers/target/isc=
si/iscsi_target_tpg.c
index bf06cfdfb012..e689f85564ec 100644
--- a/drivers/target/iscsi/iscsi_target_tpg.c
+++ b/drivers/target/iscsi/iscsi_target_tpg.c
@@ -162,6 +162,7 @@ int iscsit_get_tpg(
 }
=20
 void iscsit_put_tpg(struct iscsi_portal_group *tpg)
+	RELEASE(tpg->tpg_access_lock)
 {
 	mutex_unlock(&tpg->tpg_access_lock);
 }
diff --git a/drivers/target/target_core_device.c b/drivers/target/target_=
core_device.c
index cc2da086f96e..fdf42ca84c49 100644
--- a/drivers/target/target_core_device.c
+++ b/drivers/target/target_core_device.c
@@ -844,6 +844,7 @@ struct devices_idr_iter {
=20
 static int target_devices_idr_iter(int id, void *p, void *data)
 	 __must_hold(&device_mutex)
+	REQUIRES(device_mutex)
 {
 	struct devices_idr_iter *iter =3D data;
 	struct se_device *dev =3D p;
diff --git a/drivers/tee/amdtee/core.c b/drivers/tee/amdtee/core.c
index e487231d25dc..264e5a9502c7 100644
--- a/drivers/tee/amdtee/core.c
+++ b/drivers/tee/amdtee/core.c
@@ -218,6 +218,7 @@ static int copy_ta_binary(struct tee_context *ctx, vo=
id *ptr, void **ta,
=20
 /* mutex must be held by caller */
 static void destroy_session(struct kref *ref)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct amdtee_session *sess =3D container_of(ref, struct amdtee_session=
,
 						   refcount);
diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/=
mediatek/auxadc_thermal.c
index 9ee2e7283435..a8669f6a44e4 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -778,6 +778,7 @@ static int raw_to_mcelsius_v3(struct mtk_thermal *mt,=
 int sensno, s32 raw)
  * PTPCORESEL register to access it.
  */
 static void mtk_thermal_get_bank(struct mtk_thermal_bank *bank)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct mtk_thermal *mt =3D bank->mt;
 	u32 val;
@@ -799,6 +800,7 @@ static void mtk_thermal_get_bank(struct mtk_thermal_b=
ank *bank)
  * release a bank previously taken with mtk_thermal_get_bank,
  */
 static void mtk_thermal_put_bank(struct mtk_thermal_bank *bank)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	struct mtk_thermal *mt =3D bank->mt;
=20
diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soc=
therm.c
index 2c5ddf0db40c..95649a4e4afa 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -1082,6 +1082,7 @@ static irqreturn_t soctherm_edp_isr(int irq, void *=
arg)
  * a particular over-current interrupt request.
  */
 static void soctherm_oc_irq_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct soctherm_oc_irq_chip_data *d =3D irq_data_get_irq_chip_data(data=
);
=20
@@ -1096,6 +1097,7 @@ static void soctherm_oc_irq_lock(struct irq_data *d=
ata)
  * with a particular over-current interrupt request.
  */
 static void soctherm_oc_irq_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct soctherm_oc_irq_chip_data *d =3D irq_data_get_irq_chip_data(data=
);
=20
diff --git a/drivers/thermal/thermal_debugfs.c b/drivers/thermal/thermal_=
debugfs.c
index c800504c3cfe..335ca79275c0 100644
--- a/drivers/thermal/thermal_debugfs.c
+++ b/drivers/thermal/thermal_debugfs.c
@@ -288,6 +288,7 @@ static void thermal_debugfs_cdev_clear(struct cdev_de=
bugfs *cdev_dbg)
 }
=20
 static void *cdev_seq_start(struct seq_file *s, loff_t *pos)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct thermal_debugfs *thermal_dbg =3D s->private;
=20
@@ -304,6 +305,7 @@ static void *cdev_seq_next(struct seq_file *s, void *=
v, loff_t *pos)
 }
=20
 static void cdev_seq_stop(struct seq_file *s, void *v)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct thermal_debugfs *thermal_dbg =3D s->private;
=20
@@ -759,6 +761,7 @@ void thermal_debug_update_trip_stats(struct thermal_z=
one_device *tz)
 }
=20
 static void *tze_seq_start(struct seq_file *s, loff_t *pos)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct thermal_debugfs *thermal_dbg =3D s->private;
 	struct tz_debugfs *tz_dbg =3D &thermal_dbg->tz_dbg;
@@ -777,6 +780,7 @@ static void *tze_seq_next(struct seq_file *s, void *v=
, loff_t *pos)
 }
=20
 static void tze_seq_stop(struct seq_file *s, void *v)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct thermal_debugfs *thermal_dbg =3D s->private;
=20
diff --git a/drivers/tty/n_tty.c b/drivers/tty/n_tty.c
index 5e9ca4376d68..3650b8e07563 100644
--- a/drivers/tty/n_tty.c
+++ b/drivers/tty/n_tty.c
@@ -2156,6 +2156,7 @@ static int job_control(struct tty_struct *tty, stru=
ct file *file)
  */
 static ssize_t n_tty_read(struct tty_struct *tty, struct file *file, u8 =
*kbuf,
 			  size_t nr, void **cookie, unsigned long offset)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct n_tty_data *ldata =3D tty->disc_data;
 	u8 *kb =3D kbuf;
diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7x=
x.c
index 7b51cdc274fd..683f198573e2 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -433,6 +433,7 @@ static void sc16is7xx_power(struct uart_port *port, i=
nt on)
  * context.
  */
 static void sc16is7xx_efr_lock(struct uart_port *port)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct sc16is7xx_one *one =3D to_sc16is7xx_one(port, port);
=20
@@ -449,6 +450,7 @@ static void sc16is7xx_efr_lock(struct uart_port *port=
)
 }
=20
 static void sc16is7xx_efr_unlock(struct uart_port *port)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct sc16is7xx_one *one =3D to_sc16is7xx_one(port, port);
=20
diff --git a/drivers/tty/tty_buffer.c b/drivers/tty/tty_buffer.c
index 79f0ff94ce00..6c4a214b9cc7 100644
--- a/drivers/tty/tty_buffer.c
+++ b/drivers/tty/tty_buffer.c
@@ -51,6 +51,7 @@
  * See also tty_buffer_unlock_exclusive().
  */
 void tty_buffer_lock_exclusive(struct tty_port *port)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct tty_bufhead *buf =3D &port->buf;
=20
@@ -68,6 +69,7 @@ EXPORT_SYMBOL_GPL(tty_buffer_lock_exclusive);
  * See also tty_buffer_lock_exclusive().
  */
 void tty_buffer_unlock_exclusive(struct tty_port *port)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct tty_bufhead *buf =3D &port->buf;
 	bool restart =3D buf->head->commit !=3D buf->head->read;
diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 6f152d483123..96b230e03027 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -938,12 +938,14 @@ static ssize_t tty_read(struct kiocb *iocb, struct =
iov_iter *to)
 }
=20
 void tty_write_unlock(struct tty_struct *tty)
+	RELEASE(tty->atomic_write_lock)
 {
 	mutex_unlock(&tty->atomic_write_lock);
 	wake_up_interruptible_poll(&tty->write_wait, EPOLLOUT);
 }
=20
 int tty_write_lock(struct tty_struct *tty, bool ndelay)
+	TRY_ACQUIRE(0, tty->atomic_write_lock)
 {
 	if (!mutex_trylock(&tty->atomic_write_lock)) {
 		if (ndelay)
diff --git a/drivers/tty/tty_mutex.c b/drivers/tty/tty_mutex.c
index 784e46a0a3b1..b784a95b4c7d 100644
--- a/drivers/tty/tty_mutex.c
+++ b/drivers/tty/tty_mutex.c
@@ -13,6 +13,7 @@
  */
=20
 void tty_lock(struct tty_struct *tty)
+	ACQUIRE(tty->legacy_mutex)
 {
 	tty_kref_get(tty);
 	mutex_lock(&tty->legacy_mutex);
@@ -20,6 +21,7 @@ void tty_lock(struct tty_struct *tty)
 EXPORT_SYMBOL(tty_lock);
=20
 int tty_lock_interruptible(struct tty_struct *tty)
+	TRY_ACQUIRE(0, tty->legacy_mutex)
 {
 	int ret;
=20
@@ -31,6 +33,7 @@ int tty_lock_interruptible(struct tty_struct *tty)
 }
=20
 void tty_unlock(struct tty_struct *tty)
+	RELEASE(tty->legacy_mutex)
 {
 	mutex_unlock(&tty->legacy_mutex);
 	tty_kref_put(tty);
@@ -38,12 +41,14 @@ void tty_unlock(struct tty_struct *tty)
 EXPORT_SYMBOL(tty_unlock);
=20
 void tty_lock_slave(struct tty_struct *tty)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (tty && tty !=3D tty->link)
 		tty_lock(tty);
 }
=20
 void tty_unlock_slave(struct tty_struct *tty)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (tty && tty !=3D tty->link)
 		tty_unlock(tty);
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index cd404ade48dc..4b0f13169239 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1361,6 +1361,7 @@ static int ufshcd_scale_gear(struct ufs_hba *hba, b=
ool scale_up)
  * Return: 0 upon success; -EBUSY upon timeout.
  */
 static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba, u64 timeout=
_us)
+	TRY_ACQUIRE(0, hba->wb_mutex)
 {
 	int ret =3D 0;
 	/*
@@ -1388,6 +1389,7 @@ static int ufshcd_clock_scaling_prepare(struct ufs_=
hba *hba, u64 timeout_us)
 }
=20
 static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err,=
 bool scale_up)
+	RELEASE(hba->wb_mutex)
 {
 	up_write(&hba->clk_scaling_lock);
=20
@@ -3221,6 +3223,7 @@ static int ufshcd_wait_for_dev_cmd(struct ufs_hba *=
hba,
 }
=20
 static void ufshcd_dev_man_lock(struct ufs_hba *hba)
+	ACQUIRE(hba->dev_cmd.lock)
 {
 	ufshcd_hold(hba);
 	mutex_lock(&hba->dev_cmd.lock);
@@ -3228,6 +3231,7 @@ static void ufshcd_dev_man_lock(struct ufs_hba *hba=
)
 }
=20
 static void ufshcd_dev_man_unlock(struct ufs_hba *hba)
+	RELEASE(hba->dev_cmd.lock)
 {
 	up_read(&hba->clk_scaling_lock);
 	mutex_unlock(&hba->dev_cmd.lock);
diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 0f77547438d3..edd65ea39b9a 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -1244,6 +1244,7 @@ static void wdm_disconnect(struct usb_interface *in=
tf)
=20
 #ifdef CONFIG_PM
 static int wdm_suspend(struct usb_interface *intf, pm_message_t message)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct wdm_device *desc =3D wdm_find_device(intf);
 	int rv =3D 0;
@@ -1310,6 +1311,7 @@ static int wdm_resume(struct usb_interface *intf)
 #endif
=20
 static int wdm_pre_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct wdm_device *desc =3D wdm_find_device(intf);
=20
@@ -1335,6 +1337,7 @@ static int wdm_pre_reset(struct usb_interface *intf=
)
 }
=20
 static int wdm_post_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct wdm_device *desc =3D wdm_find_device(intf);
 	int rv;
diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index c197e81e0307..6e8f506e9047 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -232,7 +232,8 @@ static const struct quirk_printer_struct quirk_printe=
rs[] =3D {
=20
 static int usblp_wwait(struct usblp *usblp, int nonblock);
 static int usblp_wtest(struct usblp *usblp, int nonblock);
-static int usblp_rwait_and_lock(struct usblp *usblp, int nonblock);
+static int usblp_rwait_and_lock(struct usblp *usblp, int nonblock)
+	TRY_ACQUIRE(0, usblp->mut);
 static int usblp_rtest(struct usblp *usblp, int nonblock);
 static int usblp_submit_read(struct usblp *usblp);
 static int usblp_select_alts(struct usblp *usblp);
diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 34e46ef308ab..cf3f0a42733c 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -599,6 +599,7 @@ static int usbtmc_ioctl_get_srq_stb(struct usbtmc_fil=
e_data *file_data,
=20
 static int usbtmc488_ioctl_wait_srq(struct usbtmc_file_data *file_data,
 				    __u32 __user *arg)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct usbtmc_device_data *data =3D file_data->data;
 	struct device *dev =3D &data->intf->dev;
@@ -2548,6 +2549,7 @@ static int usbtmc_resume(struct usb_interface *intf=
)
 }
=20
 static int usbtmc_pre_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct usbtmc_device_data *data  =3D usb_get_intfdata(intf);
 	struct list_head *elem;
@@ -2570,6 +2572,7 @@ static int usbtmc_pre_reset(struct usb_interface *i=
ntf)
 }
=20
 static int usbtmc_post_reset(struct usb_interface *intf)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct usbtmc_device_data *data  =3D usb_get_intfdata(intf);
=20
diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index f6ce6e26e0d4..219463cdc653 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1168,6 +1168,7 @@ static int usbfs_start_wait_urb(struct urb *urb, in=
t timeout,
=20
 static int do_proc_control(struct usb_dev_state *ps,
 		struct usbdevfs_ctrltransfer *ctrl)
+	NO_THREAD_SAFETY_ANALYSIS /* requires alias analysis */
 {
 	struct usb_device *dev =3D ps->dev;
 	unsigned int tmo;
@@ -1282,6 +1283,7 @@ static int proc_control(struct usb_dev_state *ps, v=
oid __user *arg)
=20
 static int do_proc_bulk(struct usb_dev_state *ps,
 		struct usbdevfs_bulktransfer *bulk)
+	NO_THREAD_SAFETY_ANALYSIS /* requires alias analysis */
 {
 	struct usb_device *dev =3D ps->dev;
 	unsigned int tmo, len1, len2, pipe;
@@ -2079,6 +2081,7 @@ static int processcompl(struct async *as, void __us=
er * __user *arg)
 }
=20
 static struct async *reap_as(struct usb_dev_state *ps)
+	NO_THREAD_SAFETY_ANALYSIS /* REQUIRES(ps->dev->dev.mutex) */
 {
 	DECLARE_WAITQUEUE(wait, current);
 	struct async *as =3D NULL;
@@ -2102,6 +2105,7 @@ static struct async *reap_as(struct usb_dev_state *=
ps)
 }
=20
 static int proc_reapurb(struct usb_dev_state *ps, void __user *arg)
+	REQUIRES(ps->dev->dev.mutex)
 {
 	struct async *as =3D reap_as(ps);
=20
@@ -2247,6 +2251,7 @@ static int processcompl_compat(struct async *as, vo=
id __user * __user *arg)
 }
=20
 static int proc_reapurb_compat(struct usb_dev_state *ps, void __user *ar=
g)
+	REQUIRES(ps->dev->dev.mutex)
 {
 	struct async *as =3D reap_as(ps);
=20
@@ -2579,6 +2584,7 @@ static int proc_allow_suspend(struct usb_dev_state =
*ps)
 }
=20
 static int proc_wait_for_resume(struct usb_dev_state *ps)
+	REQUIRES(ps->dev->dev.mutex)
 {
 	int ret;
=20
@@ -2599,6 +2605,7 @@ static int proc_wait_for_resume(struct usb_dev_stat=
e *ps)
  */
 static long usbdev_do_ioctl(struct file *file, unsigned int cmd,
 				void __user *p)
+	NO_THREAD_SAFETY_ANALYSIS /* requires alias analysis */
 {
 	struct usb_dev_state *ps =3D file->private_data;
 	struct inode *inode =3D file_inode(file);
diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 56b534f59907..2ffaef3811fa 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -83,6 +83,7 @@ static void for_each_companion(struct pci_dev *pdev, st=
ruct usb_hcd *hcd,
  */
 static void ehci_pre_add(struct pci_dev *pdev, struct usb_hcd *hcd,
 		struct pci_dev *companion, struct usb_hcd *companion_hcd)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct usb_device *udev;
=20
@@ -100,6 +101,7 @@ static void ehci_pre_add(struct pci_dev *pdev, struct=
 usb_hcd *hcd,
  */
 static void ehci_post_add(struct pci_dev *pdev, struct usb_hcd *hcd,
 		struct pci_dev *companion, struct usb_hcd *companion_hcd)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional unlock */
 {
 	struct usb_device *udev;
=20
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index c3f839637cb5..c2a81837f17e 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1075,6 +1075,7 @@ static void hub_init_func2(struct work_struct *ws);
 static void hub_init_func3(struct work_struct *ws);
=20
 static void hub_activate(struct usb_hub *hub, enum hub_activation_type t=
ype)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct usb_device *hdev =3D hub->hdev;
 	struct usb_hcd *hcd;
@@ -3205,6 +3206,7 @@ int usb_port_is_power_on(struct usb_hub *hub, unsig=
ned int portstatus)
=20
 static void usb_lock_port(struct usb_port *port_dev)
 		__acquires(&port_dev->status_lock)
+	ACQUIRE(port_dev->status_lock)
 {
 	mutex_lock(&port_dev->status_lock);
 	__acquire(&port_dev->status_lock);
@@ -3212,6 +3214,7 @@ static void usb_lock_port(struct usb_port *port_dev=
)
=20
 static void usb_unlock_port(struct usb_port *port_dev)
 		__releases(&port_dev->status_lock)
+	RELEASE(port_dev->status_lock)
 {
 	mutex_unlock(&port_dev->status_lock);
 	__release(&port_dev->status_lock);
@@ -3857,6 +3860,7 @@ int usb_remote_wakeup(struct usb_device *udev)
 static int hub_handle_remote_wakeup(struct usb_hub *hub, unsigned int po=
rt,
 		u16 portstatus, u16 portchange)
 		__must_hold(&port_dev->status_lock)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is in an array member */
 {
 	struct usb_port *port_dev =3D hub->ports[port - 1];
 	struct usb_device *hdev;
@@ -5345,6 +5349,7 @@ static int descriptors_changed(struct usb_device *u=
dev,
=20
 static void hub_port_connect(struct usb_hub *hub, int port1, u16 portsta=
tus,
 		u16 portchange)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is in an array member */
 {
 	int status =3D -ENODEV;
 	int i;
@@ -5593,6 +5598,7 @@ static void hub_port_connect(struct usb_hub *hub, i=
nt port1, u16 portstatus,
 static void hub_port_connect_change(struct usb_hub *hub, int port1,
 					u16 portstatus, u16 portchange)
 		__must_hold(&port_dev->status_lock)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is in an array member */
 {
 	struct usb_port *port_dev =3D hub->ports[port1 - 1];
 	struct usb_device *udev =3D port_dev->child;
@@ -5701,6 +5707,7 @@ static void port_over_current_notify(struct usb_por=
t *port_dev)
=20
 static void port_event(struct usb_hub *hub, int port1)
 		__must_hold(&port_dev->status_lock)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is in an array member */
 {
 	int connect_change;
 	struct usb_port *port_dev =3D hub->ports[port1 - 1];
diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.=
c
index fba2a56dae97..09601dcfd2de 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1286,6 +1286,7 @@ static ssize_t ext_prop_type_show(struct config_ite=
m *item, char *page)
=20
 static ssize_t ext_prop_type_store(struct config_item *item,
 				   const char *page, size_t len)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct usb_os_desc_ext_prop *ext_prop =3D to_usb_os_desc_ext_prop(item)=
;
 	struct usb_os_desc *desc =3D to_usb_os_desc(ext_prop->item.ci_parent);
@@ -1339,6 +1340,7 @@ static ssize_t ext_prop_data_show(struct config_ite=
m *item, char *page)
=20
 static ssize_t ext_prop_data_store(struct config_item *item,
 				   const char *page, size_t len)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct usb_os_desc_ext_prop *ext_prop =3D to_usb_os_desc_ext_prop(item)=
;
 	struct usb_os_desc *desc =3D to_usb_os_desc(ext_prop->item.ci_parent);
@@ -1394,6 +1396,7 @@ static struct configfs_item_operations ext_prop_ops=
 =3D {
 static struct config_item *ext_prop_make(
 		struct config_group *group,
 		const char *name)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct usb_os_desc_ext_prop *ext_prop;
 	struct config_item_type *ext_prop_type;
@@ -1437,6 +1440,7 @@ static struct config_item *ext_prop_make(
 }
=20
 static void ext_prop_drop(struct config_group *group, struct config_item=
 *item)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct usb_os_desc_ext_prop *ext_prop =3D to_usb_os_desc_ext_prop(item)=
;
 	struct usb_os_desc *desc =3D to_usb_os_desc(&group->cg_item);
@@ -1466,6 +1470,7 @@ static ssize_t interf_grp_compatible_id_show(struct=
 config_item *item,
=20
 static ssize_t interf_grp_compatible_id_store(struct config_item *item,
 					      const char *page, size_t len)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct usb_os_desc *desc =3D to_usb_os_desc(item);
 	int l;
@@ -1492,6 +1497,7 @@ static ssize_t interf_grp_sub_compatible_id_show(st=
ruct config_item *item,
=20
 static ssize_t interf_grp_sub_compatible_id_store(struct config_item *it=
em,
 						  const char *page, size_t len)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct usb_os_desc *desc =3D to_usb_os_desc(item);
 	int l;
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/func=
tion/f_fs.c
index 2dea9e42a0f8..7d1ec569ab99 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -64,7 +64,8 @@ static void ffs_data_closed(struct ffs_data *ffs);
=20
 /* Called with ffs->mutex held; take over ownership of data. */
 static int __must_check
-__ffs_data_got_descs(struct ffs_data *ffs, char *data, size_t len);
+__ffs_data_got_descs(struct ffs_data *ffs, char *data, size_t len)
+	REQUIRES(ffs->mutex);
 static int __must_check
 __ffs_data_got_strings(struct ffs_data *ffs, char *data, size_t len);
=20
@@ -293,7 +294,8 @@ static void ffs_closed(struct ffs_data *ffs);
 /* Misc helper functions ***********************************************=
*****/
=20
 static int ffs_mutex_lock(struct mutex *mutex, unsigned nonblock)
-	__attribute__((warn_unused_result, nonnull));
+	__attribute__((warn_unused_result, nonnull))
+	TRY_ACQUIRE(0, *mutex);
 static char *ffs_prepare_buffer(const char __user *buf, size_t len)
 	__attribute__((warn_unused_result, nonnull));
=20
@@ -375,7 +377,7 @@ static ssize_t ffs_ep0_write(struct file *file, const=
 char __user *buf,
=20
 	/* Acquire mutex */
 	ret =3D ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
-	if (ret < 0)
+	if (ret)
 		return ret;
=20
 	/* Check state */
@@ -505,6 +507,7 @@ static ssize_t ffs_ep0_write(struct file *file, const=
 char __user *buf,
 static ssize_t __ffs_ep0_read_events(struct ffs_data *ffs, char __user *=
buf,
 				     size_t n)
 	__releases(&ffs->ev.waitq.lock)
+	RELEASE(ffs->mutex)
 {
 	/*
 	 * n cannot be bigger than ffs->ev.count, which cannot be bigger than
@@ -550,7 +553,7 @@ static ssize_t ffs_ep0_read(struct file *file, char _=
_user *buf,
=20
 	/* Acquire mutex */
 	ret =3D ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
-	if (ret < 0)
+	if (ret)
 		return ret;
=20
 	/* Check state */
@@ -687,7 +690,7 @@ static __poll_t ffs_ep0_poll(struct file *file, poll_=
table *wait)
 	poll_wait(file, &ffs->ev.waitq, wait);
=20
 	ret =3D ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
-	if (ret < 0)
+	if (ret)
 		return mask;
=20
 	switch (ffs->state) {
@@ -3487,6 +3490,7 @@ static int __ffs_func_bind_do_os_desc(enum ffs_os_d=
esc_type type,
=20
 static inline struct f_fs_opts *ffs_do_functionfs_bind(struct usb_functi=
on *f,
 						struct usb_configuration *c)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct ffs_function *func =3D ffs_func_from_usb(f);
 	struct f_fs_opts *ffs_opts =3D
diff --git a/drivers/usb/gadget/function/u_fs.h b/drivers/usb/gadget/func=
tion/u_fs.h
index 4b3365f23fd7..4092b1d2ecf6 100644
--- a/drivers/usb/gadget/function/u_fs.h
+++ b/drivers/usb/gadget/function/u_fs.h
@@ -54,11 +54,13 @@ struct ffs_dev {
 extern struct mutex ffs_lock;
=20
 static inline void ffs_dev_lock(void)
+	ACQUIRE(ffs_lock)
 {
 	mutex_lock(&ffs_lock);
 }
=20
 static inline void ffs_dev_unlock(void)
+	RELEASE(ffs_lock)
 {
 	mutex_unlock(&ffs_lock);
 }
diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legac=
y/inode.c
index c4c9ad6d8596..077063f4e0a3 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -296,6 +296,7 @@ static void epio_complete (struct usb_ep *ep, struct =
usb_request *req)
  */
 static int
 get_ready_ep (unsigned f_flags, struct ep_data *epdata, bool is_write)
+	TRY_ACQUIRE(0, epdata->lock)
 {
 	int	val;
=20
diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index e59bfa7c8030..bb61072f8238 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -269,6 +269,7 @@ static void destroy_mos_parport(struct kref *kref)
  * our release function can return.
  */
 static int parport_prologue(struct parport *pp)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mos7715_parport *mos_parport;
=20
@@ -304,6 +305,7 @@ static int parport_prologue(struct parport *pp)
  * synchronous messages to the device.
  */
 static inline void parport_epilogue(struct parport *pp)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct mos7715_parport *mos_parport =3D pp->private_data;
 	mutex_unlock(&mos_parport->serial->disc_mutex);
diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-ser=
ial.c
index 7266558d823a..26594fe793d9 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -59,6 +59,7 @@ static LIST_HEAD(usb_serial_driver_list);
  * and its refcount incremented.  Otherwise return NULL.
  */
 struct usb_serial_port *usb_serial_port_get_by_minor(unsigned minor)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct usb_serial *serial;
 	struct usb_serial_port *port;
@@ -212,6 +213,7 @@ void usb_serial_put(struct usb_serial *serial)
  * in serial_cleanup().
  */
 static int serial_install(struct tty_driver *driver, struct tty_struct *=
tty)
+	NO_THREAD_SAFETY_ANALYSIS /* see also usb_serial_port_get_by_minor() */
 {
 	int idx =3D tty->index;
 	struct usb_serial *serial;
@@ -544,6 +546,7 @@ static int serial_break(struct tty_struct *tty, int b=
reak_state)
 }
=20
 static int serial_proc_show(struct seq_file *m, void *v)
+	NO_THREAD_SAFETY_ANALYSIS /* see also usb_serial_port_get_by_minor() */
 {
 	struct usb_serial *serial;
 	struct usb_serial_port *port;
diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transp=
ort.c
index 52b85acaf756..eb920b83663a 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -602,6 +602,7 @@ static void last_sector_hacks(struct us_data *us, str=
uct scsi_cmnd *srb)
  * the device and receive the response.
  */
 void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us=
)
+	REQUIRES(us->dev_mutex)
 {
 	int need_auto_sense;
 	int result;
diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index d36f3b6992bb..26b6da805312 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -305,6 +305,7 @@ EXPORT_SYMBOL_GPL(usb_stor_reset_resume);
  */
=20
 int usb_stor_pre_reset(struct usb_interface *iface)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct us_data *us =3D usb_get_intfdata(iface);
=20
@@ -315,6 +316,7 @@ int usb_stor_pre_reset(struct usb_interface *iface)
 EXPORT_SYMBOL_GPL(usb_stor_pre_reset);
=20
 int usb_stor_post_reset(struct usb_interface *iface)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	struct us_data *us =3D usb_get_intfdata(iface);
=20
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
index 47be450d2be3..eda6fcdafc0a 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -971,6 +971,7 @@ static void tcpm_ams_finish(struct tcpm_port *port)
 static int tcpm_pd_transmit(struct tcpm_port *port,
 			    enum tcpm_transmit_type tx_sop_type,
 			    const struct pd_message *msg)
+	REQUIRES(port->lock)
 {
 	unsigned long time_left;
 	int ret;
@@ -1248,6 +1249,7 @@ static u32 tcpm_forge_legacy_pdo(struct tcpm_port *=
port, u32 pdo, enum typec_rol
 }
=20
 static int tcpm_pd_send_revision(struct tcpm_port *port)
+	REQUIRES(port->lock)
 {
 	struct pd_message msg;
 	u32 rmdo;
@@ -1266,6 +1268,7 @@ static int tcpm_pd_send_revision(struct tcpm_port *=
port)
 }
=20
 static int tcpm_pd_send_source_caps(struct tcpm_port *port)
+	REQUIRES(port->lock)
 {
 	struct pd_message msg;
 	u32 pdo;
@@ -1303,6 +1306,7 @@ static int tcpm_pd_send_source_caps(struct tcpm_por=
t *port)
 }
=20
 static int tcpm_pd_send_sink_caps(struct tcpm_port *port)
+	REQUIRES(port->lock)
 {
 	struct pd_message msg;
 	u32 pdo;
@@ -1483,6 +1487,7 @@ static bool tcpm_ams_interruptible(struct tcpm_port=
 *port)
 }
=20
 static int tcpm_ams_start(struct tcpm_port *port, enum tcpm_ams ams)
+	REQUIRES(port->lock)
 {
 	int ret =3D 0;
=20
@@ -1922,6 +1927,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, str=
uct typec_altmode *adev,
 			enum adev_actions *adev_action,
 			enum tcpm_transmit_type rx_sop_type,
 			enum tcpm_transmit_type *response_tx_sop_type)
+	REQUIRES(port->lock)
 {
 	struct typec_port *typec =3D port->typec_port;
 	struct typec_altmode *pdev, *pdev_prime;
@@ -2287,6 +2293,7 @@ static void tcpm_pd_handle_msg(struct tcpm_port *po=
rt,
 static void tcpm_handle_vdm_request(struct tcpm_port *port,
 				    const __le32 *payload, int cnt,
 				    enum tcpm_transmit_type rx_sop_type)
+	REQUIRES(port->lock)
 {
 	enum adev_actions adev_action =3D ADEV_NONE;
 	struct typec_altmode *adev;
@@ -2485,6 +2492,7 @@ static unsigned int vdm_ready_timeout(u32 vdm_hdr)
 }
=20
 static void vdm_run_state_machine(struct tcpm_port *port)
+	REQUIRES(port->lock)
 {
 	struct pd_message msg;
 	int i, res =3D 0;
@@ -2936,6 +2944,7 @@ static int tcpm_pd_send_control(struct tcpm_port *p=
ort,
=20
 static void tcpm_handle_alert(struct tcpm_port *port, const __le32 *payl=
oad,
 			      int cnt)
+	REQUIRES(port->lock)
 {
 	u32 p0 =3D le32_to_cpu(payload[0]);
 	unsigned int type =3D usb_pd_ado_type(p0);
@@ -3103,6 +3112,7 @@ static int tcpm_register_sink_caps(struct tcpm_port=
 *port)
 static void tcpm_pd_data_request(struct tcpm_port *port,
 				 const struct pd_message *msg,
 				 enum tcpm_transmit_type rx_sop_type)
+	REQUIRES(port->lock)
 {
 	enum pd_data_msg_type type =3D pd_header_type_le(msg->header);
 	unsigned int cnt =3D pd_header_cnt_le(msg->header);
@@ -3303,6 +3313,7 @@ static void tcpm_pps_complete(struct tcpm_port *por=
t, int result)
 static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 				 const struct pd_message *msg,
 				 enum tcpm_transmit_type rx_sop_type)
+	REQUIRES(port->lock)
 {
 	enum pd_ctrl_msg_type type =3D pd_header_type_le(msg->header);
 	enum tcpm_state next_state;
@@ -3744,6 +3755,7 @@ EXPORT_SYMBOL_GPL(tcpm_pd_receive);
 static int tcpm_pd_send_control(struct tcpm_port *port,
 				enum pd_ctrl_msg_type type,
 				enum tcpm_transmit_type tx_sop_type)
+	REQUIRES(port->lock)
 {
 	struct pd_message msg;
=20
@@ -3784,6 +3796,7 @@ static int tcpm_pd_send_control(struct tcpm_port *p=
ort,
  * false otherwise.
  */
 static bool tcpm_send_queued_message(struct tcpm_port *port)
+	REQUIRES(port->lock)
 {
 	enum pd_msg_request queued_message;
 	int ret;
@@ -4134,6 +4147,7 @@ static int tcpm_pd_build_request(struct tcpm_port *=
port, u32 *rdo)
 }
=20
 static int tcpm_pd_send_request(struct tcpm_port *port)
+	REQUIRES(port->lock)
 {
 	struct pd_message msg;
 	int ret;
@@ -4221,6 +4235,7 @@ static int tcpm_pd_build_pps_request(struct tcpm_po=
rt *port, u32 *rdo)
 }
=20
 static int tcpm_pd_send_pps_request(struct tcpm_port *port)
+	REQUIRES(port->lock)
 {
 	struct pd_message msg;
 	int ret;
@@ -4666,6 +4681,7 @@ static void tcpm_set_initial_svdm_version(struct tc=
pm_port *port)
 }
=20
 static void run_state_machine(struct tcpm_port *port)
+	REQUIRES(port->lock)
 {
 	int ret;
 	enum typec_pwr_opmode opmode;
diff --git a/drivers/usb/usbip/stub_main.c b/drivers/usb/usbip/stub_main.=
c
index 79110a69d697..34849b0673b4 100644
--- a/drivers/usb/usbip/stub_main.c
+++ b/drivers/usb/usbip/stub_main.c
@@ -197,6 +197,7 @@ static ssize_t match_busid_store(struct device_driver=
 *dev, const char *buf,
 static DRIVER_ATTR_RW(match_busid);
=20
 static int do_rebind(char *busid, struct bus_id_priv *busid_priv)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int ret =3D 0;
=20
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c b/drivers/vdpa/vdpa_sim=
/vdpa_sim_blk.c
index b137f3679343..05586de07cfb 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
@@ -65,12 +65,14 @@ static void *shared_buffer;
 static DEFINE_MUTEX(shared_buffer_mutex);
=20
 static void vdpasim_blk_buffer_lock(struct vdpasim_blk *blk)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (blk->shared_backend)
 		mutex_lock(&shared_buffer_mutex);
 }
=20
 static void vdpasim_blk_buffer_unlock(struct vdpasim_blk *blk)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	if (blk->shared_backend)
 		mutex_unlock(&shared_buffer_mutex);
diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 49559605177e..1a7838cc28e2 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -723,6 +723,7 @@ int vfio_device_set_group(struct vfio_device *device,
 }
=20
 void vfio_device_remove_group(struct vfio_device *device)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct vfio_group *group =3D device->group;
 	struct iommu_group *iommu_group;
diff --git a/drivers/vfio/pci/mlx5/cmd.h b/drivers/vfio/pci/mlx5/cmd.h
index df421dc6de04..d67dbdf9d033 100644
--- a/drivers/vfio/pci/mlx5/cmd.h
+++ b/drivers/vfio/pci/mlx5/cmd.h
@@ -226,7 +226,8 @@ mlx5vf_get_data_buffer(struct mlx5_vf_migration_file =
*migf,
 void mlx5vf_put_data_buffer(struct mlx5_vhca_data_buffer *buf);
 struct page *mlx5vf_get_migration_page(struct mlx5_vhca_data_buffer *buf=
,
 				       unsigned long offset);
-void mlx5vf_state_mutex_unlock(struct mlx5vf_pci_core_device *mvdev);
+void mlx5vf_state_mutex_unlock(struct mlx5vf_pci_core_device *mvdev)
+	RELEASE(mvdev->state_mutex);
 void mlx5vf_disable_fds(struct mlx5vf_pci_core_device *mvdev,
 			enum mlx5_vf_migf_state *last_save_state);
 void mlx5vf_mig_file_cleanup_cb(struct work_struct *_work);
diff --git a/drivers/vfio/pci/virtio/migrate.c b/drivers/vfio/pci/virtio/=
migrate.c
index ba92bb4e9af9..f4a2ca215f41 100644
--- a/drivers/vfio/pci/virtio/migrate.c
+++ b/drivers/vfio/pci/virtio/migrate.c
@@ -253,6 +253,7 @@ static void virtiovf_disable_fds(struct virtiovf_pci_=
core_device *virtvdev)
  * handle a 'deferred_reset' if exists.
  */
 static void virtiovf_state_mutex_unlock(struct virtiovf_pci_core_device =
*virtvdev)
+	RELEASE(virtvdev->state_mutex)
 {
 again:
 	spin_lock(&virtvdev->reset_lock);
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_ty=
pe1.c
index 50ebc9593c9d..23251cf33371 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -1237,6 +1237,7 @@ static int verify_bitmap_size(uint64_t npages, uint=
64_t bitmap_size)
  */
 static void vfio_notify_dma_unmap(struct vfio_iommu *iommu,
 				  struct vfio_dma *dma)
+	REQUIRES(iommu->lock)
 {
 	struct vfio_device *device;
=20
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 9ac25d08f473..e06055ed53a2 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -270,6 +270,7 @@ EXPORT_SYMBOL_GPL(vhost_vq_work_queue);
  * The worker's flush_mutex must be held.
  */
 static void __vhost_worker_flush(struct vhost_worker *worker)
+	REQUIRES(worker->mutex)
 {
 	struct vhost_flush_struct flush;
=20
@@ -1333,6 +1334,7 @@ static inline int vhost_put_used_idx(struct vhost_v=
irtqueue *vq)
 	vhost_get_user(vq, x, ptr, VHOST_ADDR_USED)
=20
 static void vhost_dev_lock_vqs(struct vhost_dev *d)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int i =3D 0;
 	for (i =3D 0; i < d->nvqs; ++i)
@@ -1340,6 +1342,7 @@ static void vhost_dev_lock_vqs(struct vhost_dev *d)
 }
=20
 static void vhost_dev_unlock_vqs(struct vhost_dev *d)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int i =3D 0;
 	for (i =3D 0; i < d->nvqs; ++i)
diff --git a/drivers/video/fbdev/core/fb_procfs.c b/drivers/video/fbdev/c=
ore/fb_procfs.c
index 59641142f8aa..a134b54a8b7a 100644
--- a/drivers/video/fbdev/core/fb_procfs.c
+++ b/drivers/video/fbdev/core/fb_procfs.c
@@ -7,6 +7,7 @@
 static struct proc_dir_entry *fb_proc_dir_entry;
=20
 static void *fb_seq_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(registration_lock)
 {
 	mutex_lock(&registration_lock);
=20
@@ -14,6 +15,7 @@ static void *fb_seq_start(struct seq_file *m, loff_t *p=
os)
 }
=20
 static void fb_seq_stop(struct seq_file *m, void *v)
+	RELEASE(registration_lock)
 {
 	mutex_unlock(&registration_lock);
 }
diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.=
c
index 5f0dd01fd834..8bc3cbf5a558 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -1452,6 +1452,7 @@ static int ufx_read_edid(struct ufx_data *dev, u8 *=
edid, int edid_len)
  * Returns 0 if successful */
 static int ufx_setup_modes(struct ufx_data *dev, struct fb_info *info,
 	char *default_edid, size_t default_edid_size)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	const struct fb_videomode *default_vmode =3D NULL;
 	u8 *edid;
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index acadf0eb450c..d7bf8092fc91 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1241,6 +1241,7 @@ static int dlfb_realloc_framebuffer(struct dlfb_dat=
a *dlfb, struct fb_info *info
 static int dlfb_setup_modes(struct dlfb_data *dlfb,
 			   struct fb_info *info,
 			   char *default_edid, size_t default_edid_size)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	char *edid;
 	int i, result =3D 0, tries =3D 3;
diff --git a/drivers/virt/vboxguest/vboxguest_linux.c b/drivers/virt/vbox=
guest/vboxguest_linux.c
index 8c92ea5b7305..3b458239a9a6 100644
--- a/drivers/virt/vboxguest/vboxguest_linux.c
+++ b/drivers/virt/vboxguest/vboxguest_linux.c
@@ -432,6 +432,7 @@ static void vbg_pci_remove(struct pci_dev *pci)
 }
=20
 struct vbg_dev *vbg_get_gdev(void)
+	NO_THREAD_SAFETY_ANALYSIS /* TRY_ACQUIRE() does not support pointers */
 {
 	mutex_lock(&vbg_gdev_mutex);
=20
@@ -449,6 +450,7 @@ struct vbg_dev *vbg_get_gdev(void)
 EXPORT_SYMBOL(vbg_get_gdev);
=20
 void vbg_put_gdev(struct vbg_dev *gdev)
+	NO_THREAD_SAFETY_ANALYSIS /* see also vbg_get_gdev() */
 {
 	WARN_ON(gdev !=3D vbg_gdev);
 	mutex_unlock(&vbg_gdev_mutex);
diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 8a294b9cbcf6..46ba9a376783 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -787,6 +787,7 @@ static int virtio_mem_sbm_offline_and_remove_mb(struc=
t virtio_mem *vm,
  */
 static int virtio_mem_sbm_try_remove_unplugged_mb(struct virtio_mem *vm,
 						  unsigned long mb_id)
+	REQUIRES(vm->hotplug_mutex)
 {
 	int rc;
=20
@@ -989,6 +990,7 @@ static void virtio_mem_bbm_notify_cancel_offline(stru=
ct virtio_mem *vm,
  */
 static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 					 unsigned long action, void *arg)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex for clang */
 {
 	struct virtio_mem *vm =3D container_of(nb, struct virtio_mem,
 					     memory_notifier);
@@ -1938,6 +1940,7 @@ static int virtio_mem_plug_request(struct virtio_me=
m *vm, uint64_t diff)
 static int virtio_mem_sbm_unplug_any_sb_offline(struct virtio_mem *vm,
 						unsigned long mb_id,
 						uint64_t *nb_sb)
+	REQUIRES(vm->hotplug_mutex)
 {
 	int rc;
=20
@@ -2024,6 +2027,7 @@ static int virtio_mem_sbm_unplug_sb_online(struct v=
irtio_mem *vm,
 static int virtio_mem_sbm_unplug_any_sb_online(struct virtio_mem *vm,
 					       unsigned long mb_id,
 					       uint64_t *nb_sb)
+	REQUIRES(vm->hotplug_mutex)
 {
 	int rc, sb_id;
=20
@@ -2079,6 +2083,7 @@ static int virtio_mem_sbm_unplug_any_sb_online(stru=
ct virtio_mem *vm,
 static int virtio_mem_sbm_unplug_any_sb(struct virtio_mem *vm,
 					unsigned long mb_id,
 					uint64_t *nb_sb)
+	REQUIRES(vm->hotplug_mutex)
 {
 	const int old_state =3D virtio_mem_sbm_get_mb_state(vm, mb_id);
=20
diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index c85e80c7e130..c6153bc57b9c 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -865,6 +865,7 @@ static struct w1_therm_family_converter *device_famil=
y(struct w1_slave *sl)
  * Return: true is mutex is acquired and lock, false otherwise
  */
 static inline bool bus_mutex_lock(struct mutex *lock)
+	TRY_ACQUIRE(true, *lock)
 {
 	int max_trying =3D W1_THERM_MAX_TRY;
=20
@@ -1111,6 +1112,7 @@ static int w1_poll_completion(struct w1_master *dev=
_master, int tout_ms)
 }
=20
 static int convert_t(struct w1_slave *sl, struct therm_info *info)
+	NO_THREAD_SAFETY_ANALYSIS /* because of a clang bug */
 {
 	struct w1_master *dev_master =3D sl->master;
 	int max_trying =3D W1_THERM_MAX_TRY;
@@ -1210,6 +1212,7 @@ static int convert_t(struct w1_slave *sl, struct th=
erm_info *info)
 }
=20
 static int conv_time_measure(struct w1_slave *sl, int *conv_time)
+	NO_THREAD_SAFETY_ANALYSIS /* because of a clang bug */
 {
 	struct therm_info inf,
 		*info =3D &inf;
@@ -1280,6 +1283,7 @@ static int conv_time_measure(struct w1_slave *sl, i=
nt *conv_time)
 }
=20
 static int read_scratchpad(struct w1_slave *sl, struct therm_info *info)
+	NO_THREAD_SAFETY_ANALYSIS /* because of a clang bug */
 {
 	struct w1_master *dev_master =3D sl->master;
 	int max_trying =3D W1_THERM_MAX_TRY;
@@ -1334,6 +1338,7 @@ static int read_scratchpad(struct w1_slave *sl, str=
uct therm_info *info)
 }
=20
 static int write_scratchpad(struct w1_slave *sl, const u8 *data, u8 nb_b=
ytes)
+	NO_THREAD_SAFETY_ANALYSIS /* because of a clang bug */
 {
 	struct w1_master *dev_master =3D sl->master;
 	int max_trying =3D W1_THERM_MAX_TRY;
@@ -1367,6 +1372,7 @@ static int write_scratchpad(struct w1_slave *sl, co=
nst u8 *data, u8 nb_bytes)
 }
=20
 static int copy_scratchpad(struct w1_slave *sl)
+	NO_THREAD_SAFETY_ANALYSIS /* because of a clang bug */
 {
 	struct w1_master *dev_master =3D sl->master;
 	int max_trying =3D W1_THERM_MAX_TRY;
@@ -1421,6 +1427,7 @@ static int copy_scratchpad(struct w1_slave *sl)
 }
=20
 static int recall_eeprom(struct w1_slave *sl)
+	NO_THREAD_SAFETY_ANALYSIS /* because of a clang bug */
 {
 	struct w1_master *dev_master =3D sl->master;
 	int max_trying =3D W1_THERM_MAX_TRY;
@@ -1456,6 +1463,7 @@ static int recall_eeprom(struct w1_slave *sl)
 }
=20
 static int read_powermode(struct w1_slave *sl)
+	NO_THREAD_SAFETY_ANALYSIS /* because of a clang bug */
 {
 	struct w1_master *dev_master =3D sl->master;
 	int max_trying =3D W1_THERM_MAX_TRY;
@@ -1494,6 +1502,7 @@ static int read_powermode(struct w1_slave *sl)
 }
=20
 static int trigger_bulk_read(struct w1_master *dev_master)
+	NO_THREAD_SAFETY_ANALYSIS /* because of a clang bug */
 {
 	struct w1_slave *sl =3D NULL; /* used to iterate through slaves */
 	int max_trying =3D W1_THERM_MAX_TRY;
diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index 29f200bbab41..d5a5ebc237ed 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -709,6 +709,7 @@ static int __w1_attach_slave_device(struct w1_slave *=
sl)
 }
=20
 int w1_attach_slave_device(struct w1_master *dev, struct w1_reg_num *rn)
+	REQUIRES(dev->mutex)
 {
 	struct w1_slave *sl;
 	struct w1_family *f;
@@ -939,6 +940,7 @@ static int w1_addr_crc_is_valid(struct w1_master *dev=
, u64 rn)
 }
=20
 void w1_slave_found(struct w1_master *dev, u64 rn)
+	REQUIRES(dev->mutex)
 {
 	struct w1_slave *sl;
 	struct w1_reg_num *tmp;
@@ -1125,6 +1127,7 @@ static void w1_search_process(struct w1_master *dev=
, u8 search_type)
  * Return: 1 if there were commands to executed 0 otherwise
  */
 int w1_process_callbacks(struct w1_master *dev)
+	REQUIRES(dev->list_mutex)
 {
 	int ret =3D 0;
 	struct w1_async_cmd *async_cmd, *async_n;
diff --git a/drivers/w1/w1_netlink.c b/drivers/w1/w1_netlink.c
index 691978cddab7..12e00577124b 100644
--- a/drivers/w1/w1_netlink.c
+++ b/drivers/w1/w1_netlink.c
@@ -348,6 +348,7 @@ static int w1_process_command_addremove(struct w1_mas=
ter *dev,
=20
 static int w1_process_command_master(struct w1_master *dev,
 	struct w1_netlink_cmd *req_cmd)
+	REQUIRES(dev->bus_mutex)
 {
 	int err =3D -EINVAL;
=20
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 163f7f1d70f1..8ceb5cfb0db1 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -258,6 +258,7 @@ static struct resource *additional_memory_resource(ph=
ys_addr_t size)
 }
=20
 static enum bp_state reserve_additional_memory(void)
+	REQUIRES(balloon_mutex)
 {
 	long credit;
 	struct resource *resource;
@@ -569,6 +570,7 @@ void balloon_set_new_target(unsigned long target)
 EXPORT_SYMBOL_GPL(balloon_set_new_target);
=20
 static int add_ballooned_pages(unsigned int nr_pages)
+	REQUIRES(balloon_mutex)
 {
 	enum bp_state st;
=20
diff --git a/drivers/xen/xen-pciback/passthrough.c b/drivers/xen/xen-pcib=
ack/passthrough.c
index 66e9b814cc86..1b0f98a5d47a 100644
--- a/drivers/xen/xen-pciback/passthrough.c
+++ b/drivers/xen/xen-pciback/passthrough.c
@@ -71,6 +71,7 @@ static int __xen_pcibk_add_pci_dev(struct xen_pcibk_dev=
ice *pdev,
=20
 static void __xen_pcibk_release_pci_dev(struct xen_pcibk_device *pdev,
 					struct pci_dev *dev, bool lock)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct passthrough_dev_data *dev_data =3D pdev->pci_dev_data;
 	struct pci_dev_entry *dev_entry, *t;
diff --git a/drivers/xen/xen-pciback/vpci.c b/drivers/xen/xen-pciback/vpc=
i.c
index cc7450f2b2a9..1b8b9894601b 100644
--- a/drivers/xen/xen-pciback/vpci.c
+++ b/drivers/xen/xen-pciback/vpci.c
@@ -149,6 +149,7 @@ static int __xen_pcibk_add_pci_dev(struct xen_pcibk_d=
evice *pdev,
=20
 static void __xen_pcibk_release_pci_dev(struct xen_pcibk_device *pdev,
 					struct pci_dev *dev, bool lock)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	int slot;
 	struct vpci_dev_data *vpci_dev =3D pdev->pci_dev_data;
diff --git a/drivers/xen/xenbus/xenbus_comms.c b/drivers/xen/xenbus/xenbu=
s_comms.c
index e5fda0256feb..39bd06f7e104 100644
--- a/drivers/xen/xenbus/xenbus_comms.c
+++ b/drivers/xen/xenbus/xenbus_comms.c
@@ -203,6 +203,7 @@ static int xb_read(void *data, unsigned int len)
 }
=20
 static int process_msg(void)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	static struct {
 		struct xsd_sockmsg msg;
diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_x=
s.c
index d32c726f7a12..00c1b71069c3 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -793,6 +793,7 @@ int register_xenbus_watch(struct xenbus_watch *watch)
 EXPORT_SYMBOL_GPL(register_xenbus_watch);
=20
 void unregister_xenbus_watch(struct xenbus_watch *watch)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct xs_watch_event *event, *tmp;
 	char token[sizeof(watch) * 2 + 1];
@@ -837,6 +838,7 @@ void unregister_xenbus_watch(struct xenbus_watch *wat=
ch)
 EXPORT_SYMBOL_GPL(unregister_xenbus_watch);
=20
 void xs_suspend(void)
+	ACQUIRE(xs_response_mutex)
 {
 	xs_suspend_enter();
=20
@@ -845,6 +847,7 @@ void xs_suspend(void)
 }
=20
 void xs_resume(void)
+	RELEASE(xs_response_mutex)
 {
 	struct xenbus_watch *watch;
 	char token[sizeof(watch) * 2 + 1];
@@ -865,6 +868,7 @@ void xs_resume(void)
 }
=20
 void xs_suspend_cancel(void)
+	RELEASE(xs_response_mutex)
 {
 	up_write(&xs_watch_rwsem);
 	mutex_unlock(&xs_response_mutex);
diff --git a/fs/affs/affs.h b/fs/affs/affs.h
index e8c2c4535cb3..d560619c233b 100644
--- a/fs/affs/affs.h
+++ b/fs/affs/affs.h
@@ -297,31 +297,37 @@ affs_adjust_bitmapchecksum(struct buffer_head *bh, =
u32 val)
=20
 static inline void
 affs_lock_link(struct inode *inode)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	mutex_lock(&AFFS_I(inode)->i_link_lock);
 }
 static inline void
 affs_unlock_link(struct inode *inode)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	mutex_unlock(&AFFS_I(inode)->i_link_lock);
 }
 static inline void
 affs_lock_dir(struct inode *inode)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	mutex_lock_nested(&AFFS_I(inode)->i_hash_lock, SINGLE_DEPTH_NESTING);
 }
 static inline void
 affs_unlock_dir(struct inode *inode)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	mutex_unlock(&AFFS_I(inode)->i_hash_lock);
 }
 static inline void
 affs_lock_ext(struct inode *inode)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	mutex_lock(&AFFS_I(inode)->i_ext_lock);
 }
 static inline void
 affs_unlock_ext(struct inode *inode)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of an argument */
 {
 	mutex_unlock(&AFFS_I(inode)->i_ext_lock);
 }
diff --git a/fs/afs/validation.c b/fs/afs/validation.c
index f7ff7a5b1b99..94b494408fb4 100644
--- a/fs/afs/validation.c
+++ b/fs/afs/validation.c
@@ -389,6 +389,7 @@ static void afs_zap_data(struct afs_vnode *vnode)
  *   - dentry metadata changed (security changes)
  */
 int afs_validate(struct afs_vnode *vnode, struct key *key)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct afs_volume *volume =3D vnode->volume;
 	unsigned int cb_ro_snapshot, cb_scrub;
diff --git a/fs/autofs/waitq.c b/fs/autofs/waitq.c
index 33dd4660d82f..a254192b3c0d 100644
--- a/fs/autofs/waitq.c
+++ b/fs/autofs/waitq.c
@@ -79,6 +79,7 @@ static int autofs_write(struct autofs_sb_info *sbi,
 static void autofs_notify_daemon(struct autofs_sb_info *sbi,
 				 struct autofs_wait_queue *wq,
 				 int type)
+	RELEASE(sbi->wq_mutex)
 {
 	union {
 		struct autofs_packet_hdr hdr;
@@ -203,6 +204,7 @@ static int validate_request(struct autofs_wait_queue =
**wait,
 			    struct autofs_sb_info *sbi,
 			    const struct qstr *qstr,
 			    const struct path *path, enum autofs_notify notify)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex */
 {
 	struct dentry *dentry =3D path->dentry;
 	struct autofs_wait_queue *wq;
@@ -302,6 +304,7 @@ static int validate_request(struct autofs_wait_queue =
**wait,
=20
 int autofs_wait(struct autofs_sb_info *sbi,
 		 const struct path *path, enum autofs_notify notify)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex */
 {
 	struct dentry *dentry =3D path->dentry;
 	struct autofs_wait_queue *wq;
diff --git a/fs/bcachefs/alloc_foreground.c b/fs/bcachefs/alloc_foregroun=
d.c
index 6df41c331a52..d25aed94ad1f 100644
--- a/fs/bcachefs/alloc_foreground.c
+++ b/fs/bcachefs/alloc_foreground.c
@@ -37,6 +37,7 @@
=20
 static void bch2_trans_mutex_lock_norelock(struct btree_trans *trans,
 					   struct mutex *lock)
+	ACQUIRE(*lock)
 {
 	if (!mutex_trylock(lock)) {
 		bch2_trans_unlock(trans);
@@ -1209,6 +1210,7 @@ static bool try_decrease_writepoints(struct btree_t=
rans *trans, unsigned old_nr)
=20
 static struct write_point *writepoint_find(struct btree_trans *trans,
 					   unsigned long write_point)
+	NO_THREAD_SAFETY_ANALYSIS /* conditional locking */
 {
 	struct bch_fs *c =3D trans->c;
 	struct write_point *wp, *oldest;
@@ -1302,6 +1304,7 @@ int bch2_alloc_sectors_start_trans(struct btree_tra=
ns *trans,
 			     enum bch_write_flags flags,
 			     struct closure *cl,
 			     struct write_point **wp_ret)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct bch_fs *c =3D trans->c;
 	struct write_point *wp;
@@ -1455,6 +1458,7 @@ void bch2_alloc_sectors_append_ptrs(struct bch_fs *=
c, struct write_point *wp,
  * as allocated out of @ob
  */
 void bch2_alloc_sectors_done(struct bch_fs *c, struct write_point *wp)
+	RELEASE(wp->lock)
 {
 	bch2_alloc_sectors_done_inlined(c, wp);
 }
diff --git a/fs/bcachefs/alloc_foreground.h b/fs/bcachefs/alloc_foregroun=
d.h
index f25481a0d1a0..7b7802a632f9 100644
--- a/fs/bcachefs/alloc_foreground.h
+++ b/fs/bcachefs/alloc_foreground.h
@@ -87,6 +87,7 @@ static inline void bch2_open_buckets_put(struct bch_fs =
*c,
 }
=20
 static inline void bch2_alloc_sectors_done_inlined(struct bch_fs *c, str=
uct write_point *wp)
+	RELEASE(wp->lock)
 {
 	struct open_buckets ptrs =3D { .nr =3D 0 }, keep =3D { .nr =3D 0 };
 	struct open_bucket *ob;
diff --git a/fs/bcachefs/btree_locking.c b/fs/bcachefs/btree_locking.c
index 10b805a60f52..c84824243822 100644
--- a/fs/bcachefs/btree_locking.c
+++ b/fs/bcachefs/btree_locking.c
@@ -829,6 +829,7 @@ void bch2_trans_unlock_write(struct btree_trans *tran=
s)
=20
 int __bch2_trans_mutex_lock(struct btree_trans *trans,
 			    struct mutex *lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int ret =3D drop_locks_do(trans, (mutex_lock(lock), 0));
=20
diff --git a/fs/bcachefs/btree_write_buffer.c b/fs/bcachefs/btree_write_b=
uffer.c
index b56c4987b8c9..67a6a8097c5b 100644
--- a/fs/bcachefs/btree_write_buffer.c
+++ b/fs/bcachefs/btree_write_buffer.c
@@ -503,6 +503,7 @@ static int bch2_journal_keys_to_write_buffer(struct b=
ch_fs *c, struct journal_bu
 }
=20
 static int fetch_wb_keys_from_journal(struct bch_fs *c, u64 max_seq)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct journal *j =3D &c->journal;
 	struct journal_buf *buf;
@@ -702,6 +703,7 @@ int bch2_accounting_key_to_wb_slowpath(struct bch_fs =
*c, enum btree_id btree,
 int bch2_journal_key_to_wb_slowpath(struct bch_fs *c,
 			     struct journal_keys_to_wb *dst,
 			     enum btree_id btree, struct bkey_i *k)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct btree_write_buffer *wb =3D &c->btree_write_buffer;
 	int ret;
@@ -738,6 +740,7 @@ int bch2_journal_key_to_wb_slowpath(struct bch_fs *c,
 }
=20
 void bch2_journal_keys_to_write_buffer_start(struct bch_fs *c, struct jo=
urnal_keys_to_wb *dst, u64 seq)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct btree_write_buffer *wb =3D &c->btree_write_buffer;
=20
@@ -774,6 +777,7 @@ void bch2_journal_keys_to_write_buffer_start(struct b=
ch_fs *c, struct journal_ke
 }
=20
 int bch2_journal_keys_to_write_buffer_end(struct bch_fs *c, struct journ=
al_keys_to_wb *dst)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct btree_write_buffer *wb =3D &c->btree_write_buffer;
 	unsigned live_accounting_keys =3D 0;
diff --git a/fs/bcachefs/debug.c b/fs/bcachefs/debug.c
index 55333e82d1fe..478f9a3dab2d 100644
--- a/fs/bcachefs/debug.c
+++ b/fs/bcachefs/debug.c
@@ -579,6 +579,7 @@ static int list_ptr_order_cmp(const struct list_head =
*l, const struct list_head
=20
 static ssize_t bch2_btree_transactions_read(struct file *file, char __us=
er *buf,
 					    size_t size, loff_t *ppos)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct dump_iter *i =3D file->private_data;
 	struct bch_fs *c =3D i->c;
@@ -813,6 +814,7 @@ static const struct file_operations btree_transaction=
_stats_op =3D {
=20
 /* walk btree transactions until we find a deadlock and print it */
 static void btree_deadlock_to_text(struct printbuf *out, struct bch_fs *=
c)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct btree_trans *trans;
 	ulong iter =3D 0;
diff --git a/fs/bcachefs/ec.c b/fs/bcachefs/ec.c
index d2a5e76e6479..5f404cc718a6 100644
--- a/fs/bcachefs/ec.c
+++ b/fs/bcachefs/ec.c
@@ -1790,6 +1790,7 @@ static struct ec_stripe_head *
 ec_new_stripe_head_alloc(struct bch_fs *c, unsigned disk_label,
 			 unsigned algo, unsigned redundancy,
 			 enum bch_watermark watermark)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ec_stripe_head *h;
=20
@@ -1810,6 +1811,7 @@ ec_new_stripe_head_alloc(struct bch_fs *c, unsigned=
 disk_label,
 }
=20
 void bch2_ec_stripe_head_put(struct bch_fs *c, struct ec_stripe_head *h)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (h->s &&
 	    h->s->allocated &&
@@ -1826,6 +1828,7 @@ __bch2_ec_stripe_head_get(struct btree_trans *trans=
,
 			  unsigned algo,
 			  unsigned redundancy,
 			  enum bch_watermark watermark)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct bch_fs *c =3D trans->c;
 	struct ec_stripe_head *h;
diff --git a/fs/bcachefs/fs-ioctl.c b/fs/bcachefs/fs-ioctl.c
index 15725b4ce393..4f20d2bd38e7 100644
--- a/fs/bcachefs/fs-ioctl.c
+++ b/fs/bcachefs/fs-ioctl.c
@@ -209,6 +209,7 @@ static int bch2_ioc_reinherit_attrs(struct bch_fs *c,
 				    struct file *file,
 				    struct bch_inode_info *src,
 				    const char __user *name)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct bch_hash_info hash =3D bch2_hash_info_init(c, &src->ei_inode);
 	struct bch_inode_info *dst;
diff --git a/fs/bcachefs/fs.c b/fs/bcachefs/fs.c
index 90ade8f648d9..6593955c578c 100644
--- a/fs/bcachefs/fs.c
+++ b/fs/bcachefs/fs.c
@@ -515,6 +515,7 @@ __bch2_create(struct mnt_idmap *idmap,
 	      struct bch_inode_info *dir, struct dentry *dentry,
 	      umode_t mode, dev_t rdev, subvol_inum snapshot_src,
 	      unsigned flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct bch_fs *c =3D dir->v.i_sb->s_fs_info;
 	struct btree_trans *trans;
@@ -753,6 +754,7 @@ static int __bch2_link(struct bch_fs *c,
=20
 static int bch2_link(struct dentry *old_dentry, struct inode *vdir,
 		     struct dentry *dentry)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct bch_fs *c =3D vdir->i_sb->s_fs_info;
 	struct bch_inode_info *dir =3D to_bch_ei(vdir);
@@ -774,6 +776,7 @@ static int bch2_link(struct dentry *old_dentry, struc=
t inode *vdir,
=20
 int __bch2_unlink(struct inode *vdir, struct dentry *dentry,
 		  bool deleting_snapshot)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct bch_fs *c =3D vdir->i_sb->s_fs_info;
 	struct bch_inode_info *dir =3D to_bch_ei(vdir);
@@ -868,6 +871,7 @@ static int bch2_rename2(struct mnt_idmap *idmap,
 			struct inode *src_vdir, struct dentry *src_dentry,
 			struct inode *dst_vdir, struct dentry *dst_dentry,
 			unsigned flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct bch_fs *c =3D src_vdir->i_sb->s_fs_info;
 	struct bch_inode_info *src_dir =3D to_bch_ei(src_vdir);
diff --git a/fs/bcachefs/io_write.c b/fs/bcachefs/io_write.c
index dd508d93e9fc..3a4edae7eba1 100644
--- a/fs/bcachefs/io_write.c
+++ b/fs/bcachefs/io_write.c
@@ -106,6 +106,7 @@ void bch2_bio_free_pages_pool(struct bch_fs *c, struc=
t bio *bio)
 }
=20
 static struct page *__bio_alloc_page_pool(struct bch_fs *c, bool *using_=
mempool)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct page *page;
=20
@@ -127,6 +128,7 @@ static struct page *__bio_alloc_page_pool(struct bch_=
fs *c, bool *using_mempool)
=20
 void bch2_bio_alloc_pages_pool(struct bch_fs *c, struct bio *bio,
 			       size_t size)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	bool using_mempool =3D false;
=20
@@ -1415,6 +1417,7 @@ static void bch2_nocow_write(struct bch_write_op *o=
p)
 }
=20
 static void __bch2_write(struct bch_write_op *op)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct bch_fs *c =3D op->c;
 	struct write_point *wp =3D NULL;
diff --git a/fs/bcachefs/journal.c b/fs/bcachefs/journal.c
index cb2c3722f674..5c0c6bda6c57 100644
--- a/fs/bcachefs/journal.c
+++ b/fs/bcachefs/journal.c
@@ -952,6 +952,7 @@ void bch2_journal_block(struct journal *j)
=20
 static struct journal_buf *__bch2_next_write_buffer_flush_journal_buf(st=
ruct journal *j,
 						u64 max_seq, bool *blocked)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct journal_buf *ret =3D NULL;
=20
@@ -1009,6 +1010,7 @@ struct journal_buf *bch2_next_write_buffer_flush_jo=
urnal_buf(struct journal *j,
=20
 static int __bch2_set_nr_journal_buckets(struct bch_dev *ca, unsigned nr=
,
 					 bool new_fs, struct closure *cl)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct bch_fs *c =3D ca->fs;
 	struct journal_device *ja =3D &ca->journal;
diff --git a/fs/bcachefs/quota.c b/fs/bcachefs/quota.c
index 8b857fc33244..cdcea4526fbe 100644
--- a/fs/bcachefs/quota.c
+++ b/fs/bcachefs/quota.c
@@ -276,6 +276,7 @@ static int bch2_quota_check_limit(struct bch_fs *c,
 int bch2_quota_acct(struct bch_fs *c, struct bch_qid qid,
 		    enum quota_counters counter, s64 v,
 		    enum quota_acct_mode mode)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	unsigned qtypes =3D enabled_qtypes(c);
 	struct bch_memquota_type *q;
@@ -327,6 +328,7 @@ int bch2_quota_transfer(struct bch_fs *c, unsigned qt=
ypes,
 			struct bch_qid dst,
 			struct bch_qid src, u64 space,
 			enum quota_acct_mode mode)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct bch_memquota_type *q;
 	struct bch_memquota *src_q[3], *dst_q[3];
diff --git a/fs/bcachefs/seqmutex.h b/fs/bcachefs/seqmutex.h
index c4b3d8d3f414..aa0638d0d306 100644
--- a/fs/bcachefs/seqmutex.h
+++ b/fs/bcachefs/seqmutex.h
@@ -12,17 +12,20 @@ struct seqmutex {
 #define seqmutex_init(_lock)	mutex_init(&(_lock)->lock)
=20
 static inline bool seqmutex_trylock(struct seqmutex *lock)
+	TRY_ACQUIRE(1, lock->lock)
 {
 	return mutex_trylock(&lock->lock);
 }
=20
 static inline void seqmutex_lock(struct seqmutex *lock)
+	ACQUIRE(lock->lock)
 {
 	mutex_lock(&lock->lock);
 	lock->seq++;
 }
=20
 static inline u32 seqmutex_unlock(struct seqmutex *lock)
+	RELEASE(lock->lock)
 {
 	u32 seq =3D lock->seq;
 	mutex_unlock(&lock->lock);
@@ -30,6 +33,7 @@ static inline u32 seqmutex_unlock(struct seqmutex *lock=
)
 }
=20
 static inline bool seqmutex_relock(struct seqmutex *lock, u32 seq)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (lock->seq !=3D seq || !mutex_trylock(&lock->lock))
 		return false;
diff --git a/fs/btrfs/block-group.c b/fs/btrfs/block-group.c
index c0a8f7d92acc..efaaf59e1811 100644
--- a/fs/btrfs/block-group.c
+++ b/fs/btrfs/block-group.c
@@ -698,6 +698,7 @@ static int load_block_group_size_class(struct btrfs_c=
aching_control *caching_ctl
 }
=20
 static int load_extent_tree_free(struct btrfs_caching_control *caching_c=
tl)
+	REQUIRES(caching_ctl->mutex)
 {
 	struct btrfs_block_group *block_group =3D caching_ctl->block_group;
 	struct btrfs_fs_info *fs_info =3D block_group->fs_info;
@@ -2928,6 +2929,7 @@ struct btrfs_block_group *btrfs_make_block_group(st=
ruct btrfs_trans_handle *tran
  */
 int btrfs_inc_block_group_ro(struct btrfs_block_group *cache,
 			     bool do_chunk_alloc)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex for clang */
 {
 	struct btrfs_fs_info *fs_info =3D cache->fs_info;
 	struct btrfs_trans_handle *trans;
diff --git a/fs/btrfs/delayed-ref.c b/fs/btrfs/delayed-ref.c
index 98c5b61dabe8..9e2c504ad7ab 100644
--- a/fs/btrfs/delayed-ref.c
+++ b/fs/btrfs/delayed-ref.c
@@ -351,6 +351,7 @@ static struct btrfs_delayed_ref_head *find_first_ref_=
head(
=20
 static bool btrfs_delayed_ref_lock(struct btrfs_delayed_ref_root *delaye=
d_refs,
 				   struct btrfs_delayed_ref_head *head)
+	TRY_ACQUIRE(true, head->mutex)
 {
 	lockdep_assert_held(&delayed_refs->lock);
 	if (mutex_trylock(&head->mutex))
@@ -478,6 +479,7 @@ int btrfs_check_delayed_seq(struct btrfs_fs_info *fs_=
info, u64 seq)
 struct btrfs_delayed_ref_head *btrfs_select_ref_head(
 		const struct btrfs_fs_info *fs_info,
 		struct btrfs_delayed_ref_root *delayed_refs)
+	NO_THREAD_SAFETY_ANALYSIS /* TRY_ACQUIRE() does not support pointers */
 {
 	struct btrfs_delayed_ref_head *head;
 	unsigned long start_index;
@@ -525,6 +527,7 @@ struct btrfs_delayed_ref_head *btrfs_select_ref_head(
=20
 void btrfs_unselect_ref_head(struct btrfs_delayed_ref_root *delayed_refs=
,
 			     struct btrfs_delayed_ref_head *head)
+	RELEASE(head->mutex)
 {
 	spin_lock(&delayed_refs->lock);
 	head->processing =3D false;
@@ -1251,6 +1254,7 @@ bool btrfs_find_delayed_tree_ref(struct btrfs_delay=
ed_ref_head *head,
 }
=20
 void btrfs_destroy_delayed_refs(struct btrfs_transaction *trans)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex for clang */
 {
 	struct btrfs_delayed_ref_root *delayed_refs =3D &trans->delayed_refs;
 	struct btrfs_fs_info *fs_info =3D trans->fs_info;
diff --git a/fs/btrfs/delayed-ref.h b/fs/btrfs/delayed-ref.h
index a35067cebb97..cf19f7f68581 100644
--- a/fs/btrfs/delayed-ref.h
+++ b/fs/btrfs/delayed-ref.h
@@ -390,6 +390,7 @@ btrfs_find_delayed_ref_head(const struct btrfs_fs_inf=
o *fs_info,
 			    struct btrfs_delayed_ref_root *delayed_refs,
 			    u64 bytenr);
 static inline void btrfs_delayed_ref_unlock(struct btrfs_delayed_ref_hea=
d *head)
+	RELEASE(head->mutex)
 {
 	mutex_unlock(&head->mutex);
 }
diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
index 3014a1a23efd..002ece8d1d71 100644
--- a/fs/btrfs/extent-tree.c
+++ b/fs/btrfs/extent-tree.c
@@ -1860,6 +1860,7 @@ u64 btrfs_cleanup_ref_head_accounting(struct btrfs_=
fs_info *fs_info,
 static int cleanup_ref_head(struct btrfs_trans_handle *trans,
 			    struct btrfs_delayed_ref_head *head,
 			    u64 *bytes_released)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex for clang */
 {
=20
 	struct btrfs_fs_info *fs_info =3D trans->fs_info;
diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
index d42b6f882f57..8beb3685a172 100644
--- a/fs/btrfs/free-space-cache.c
+++ b/fs/btrfs/free-space-cache.c
@@ -296,6 +296,7 @@ int btrfs_remove_free_space_inode(struct btrfs_trans_=
handle *trans,
 int btrfs_truncate_free_space_cache(struct btrfs_trans_handle *trans,
 				    struct btrfs_block_group *block_group,
 				    struct inode *vfs_inode)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex for clang */
 {
 	struct btrfs_truncate_control control =3D {
 		.inode =3D BTRFS_I(vfs_inode),
diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 6c18bad53cd3..405e005da13d 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -3456,6 +3456,7 @@ void btrfs_update_ioctl_balance_args(struct btrfs_f=
s_info *fs_info,
  * as exclusive ops are blocked. In case of failure return an error code=
.
  */
 static int btrfs_try_lock_balance(struct btrfs_fs_info *fs_info, bool *e=
xcl_acquired)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int ret;
=20
@@ -3511,6 +3512,7 @@ static int btrfs_try_lock_balance(struct btrfs_fs_i=
nfo *fs_info, bool *excl_acqu
 }
=20
 static long btrfs_ioctl_balance(struct file *file, void __user *arg)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct btrfs_root *root =3D BTRFS_I(file_inode(file))->root;
 	struct btrfs_fs_info *fs_info =3D root->fs_info;
diff --git a/fs/btrfs/qgroup.c b/fs/btrfs/qgroup.c
index b90fabe302e6..8ba62891de5c 100644
--- a/fs/btrfs/qgroup.c
+++ b/fs/btrfs/qgroup.c
@@ -3316,6 +3316,7 @@ static int qgroup_snapshot_quick_inherit(struct btr=
fs_fs_info *fs_info,
 int btrfs_qgroup_inherit(struct btrfs_trans_handle *trans, u64 srcid,
 			 u64 objectid, u64 inode_rootid,
 			 struct btrfs_qgroup_inherit *inherit)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int ret =3D 0;
 	u64 *i_qgroups;
diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
index 531312efee8d..c8cd19fe1d46 100644
--- a/fs/btrfs/scrub.c
+++ b/fs/btrfs/scrub.c
@@ -289,6 +289,7 @@ static void wait_scrub_stripe_io(struct scrub_stripe =
*stripe)
 static void scrub_put_ctx(struct scrub_ctx *sctx);
=20
 static void __scrub_blocked_if_needed(struct btrfs_fs_info *fs_info)
+	REQUIRES(fs_info->scrub_lock)
 {
 	while (atomic_read(&fs_info->scrub_pause_req)) {
 		mutex_unlock(&fs_info->scrub_lock);
@@ -2858,6 +2859,7 @@ static noinline_for_stack int scrub_supers(struct s=
crub_ctx *sctx,
 }
=20
 static void scrub_workers_put(struct btrfs_fs_info *fs_info)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	if (refcount_dec_and_mutex_lock(&fs_info->scrub_workers_refcnt,
 					&fs_info->scrub_lock)) {
diff --git a/fs/btrfs/tests/delayed-refs-tests.c b/fs/btrfs/tests/delayed=
-refs-tests.c
index 6558508c2ddf..ca76806a818a 100644
--- a/fs/btrfs/tests/delayed-refs-tests.c
+++ b/fs/btrfs/tests/delayed-refs-tests.c
@@ -42,6 +42,7 @@ static enum btrfs_ref_type ref_type_from_disk_ref_type(=
u8 type)
=20
 static void delete_delayed_ref_head(struct btrfs_trans_handle *trans,
 				    struct btrfs_delayed_ref_head *head)
+	NO_THREAD_SAFETY_ANALYSIS /* callers too complex */
 {
 	struct btrfs_fs_info *fs_info =3D trans->fs_info;
 	struct btrfs_delayed_ref_root *delayed_refs =3D
diff --git a/fs/btrfs/tree-log.c b/fs/btrfs/tree-log.c
index 955d1677e865..94e733e62ac2 100644
--- a/fs/btrfs/tree-log.c
+++ b/fs/btrfs/tree-log.c
@@ -2798,6 +2798,7 @@ static int update_log_root(struct btrfs_trans_handl=
e *trans,
 }
=20
 static void wait_log_commit(struct btrfs_root *root, int transid)
+	REQUIRES(root->log_mutex)
 {
 	DEFINE_WAIT(wait);
 	int index =3D transid % 2;
@@ -2823,6 +2824,7 @@ static void wait_log_commit(struct btrfs_root *root=
, int transid)
 }
=20
 static void wait_for_writer(struct btrfs_root *root)
+	REQUIRES(root->log_mutex)
 {
 	DEFINE_WAIT(wait);
=20
diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 0a0776489055..0c7a8e6d2837 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -2776,6 +2776,7 @@ static int btrfs_finish_sprout(struct btrfs_trans_h=
andle *trans)
 }
=20
 int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *dev=
ice_path)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct btrfs_root *root =3D fs_info->dev_root;
 	struct btrfs_trans_handle *trans;
@@ -3324,6 +3325,7 @@ static int remove_chunk_item(struct btrfs_trans_han=
dle *trans,
 }
=20
 int btrfs_remove_chunk(struct btrfs_trans_handle *trans, u64 chunk_offse=
t)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct btrfs_fs_info *fs_info =3D trans->fs_info;
 	struct btrfs_chunk_map *map;
@@ -3559,6 +3561,7 @@ int btrfs_relocate_chunk(struct btrfs_fs_info *fs_i=
nfo, u64 chunk_offset)
 }
=20
 static int btrfs_relocate_sys_chunks(struct btrfs_fs_info *fs_info)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct btrfs_root *chunk_root =3D fs_info->chunk_root;
 	struct btrfs_path *path;
@@ -4533,6 +4536,7 @@ static void describe_balance_start_or_resume(struct=
 btrfs_fs_info *fs_info)
 int btrfs_balance(struct btrfs_fs_info *fs_info,
 		  struct btrfs_balance_control *bctl,
 		  struct btrfs_ioctl_balance_args *bargs)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	u64 meta_target, data_target;
 	u64 allowed;
diff --git a/fs/btrfs/zoned.h b/fs/btrfs/zoned.h
index 9672bf4c3335..7f048469f1be 100644
--- a/fs/btrfs/zoned.h
+++ b/fs/btrfs/zoned.h
@@ -364,6 +364,7 @@ static inline bool btrfs_can_zone_reset(struct btrfs_=
device *device,
 }
=20
 static inline void btrfs_zoned_meta_io_lock(struct btrfs_fs_info *fs_inf=
o)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (!btrfs_is_zoned(fs_info))
 		return;
@@ -371,6 +372,7 @@ static inline void btrfs_zoned_meta_io_lock(struct bt=
rfs_fs_info *fs_info)
 }
=20
 static inline void btrfs_zoned_meta_io_unlock(struct btrfs_fs_info *fs_i=
nfo)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (!btrfs_is_zoned(fs_info))
 		return;
@@ -391,6 +393,7 @@ static inline void btrfs_clear_treelog_bg(struct btrf=
s_block_group *bg)
 }
=20
 static inline void btrfs_zoned_data_reloc_lock(struct btrfs_inode *inode=
)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct btrfs_root *root =3D inode->root;
=20
@@ -399,6 +402,7 @@ static inline void btrfs_zoned_data_reloc_lock(struct=
 btrfs_inode *inode)
 }
=20
 static inline void btrfs_zoned_data_reloc_unlock(struct btrfs_inode *ino=
de)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct btrfs_root *root =3D inode->root;
=20
diff --git a/fs/ceph/caps.c b/fs/ceph/caps.c
index a8d8b56cf9d2..53772f293001 100644
--- a/fs/ceph/caps.c
+++ b/fs/ceph/caps.c
@@ -202,6 +202,7 @@ static void __ceph_unreserve_caps(struct ceph_mds_cli=
ent *mdsc, int nr_caps)
  */
 int ceph_reserve_caps(struct ceph_mds_client *mdsc,
 		      struct ceph_cap_reservation *ctx, int need)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ceph_client *cl =3D mdsc->fsc->client;
 	int i, j;
@@ -3489,6 +3490,7 @@ static void handle_cap_grant(struct inode *inode,
 			     struct cap_extra_info *extra_info)
 	__releases(ci->i_ceph_lock)
 	__releases(session->s_mdsc->snap_rwsem)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ceph_client *cl =3D ceph_inode_to_client(inode);
 	struct ceph_inode_info *ci =3D ceph_inode(inode);
@@ -4064,6 +4066,7 @@ static bool handle_cap_trunc(struct inode *inode,
 static void handle_cap_export(struct inode *inode, struct ceph_mds_caps =
*ex,
 			      struct ceph_mds_cap_peer *ph,
 			      struct ceph_mds_session *session)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ceph_mds_client *mdsc =3D ceph_inode_to_fs_client(inode)->mdsc;
 	struct ceph_client *cl =3D mdsc->fsc->client;
@@ -4326,6 +4329,7 @@ static int parse_fscrypt_fields(void **p, void *end=
,
  */
 void ceph_handle_caps(struct ceph_mds_session *session,
 		      struct ceph_msg *msg)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ceph_mds_client *mdsc =3D session->s_mdsc;
 	struct ceph_client *cl =3D mdsc->fsc->client;
diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index 54b3421501e9..257b13a1aeb3 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -5006,6 +5006,7 @@ static void send_mds_reconnect(struct ceph_mds_clie=
nt *mdsc,
 static void check_new_map(struct ceph_mds_client *mdsc,
 			  struct ceph_mdsmap *newmap,
 			  struct ceph_mdsmap *oldmap)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int i, j, err;
 	int oldstate, newstate;
diff --git a/fs/coda/upcall.c b/fs/coda/upcall.c
index cd6a3721f6f6..362024e61491 100644
--- a/fs/coda/upcall.c
+++ b/fs/coda/upcall.c
@@ -650,6 +650,7 @@ static void coda_unblock_signals(sigset_t *old)
=20
 static inline void coda_waitfor_upcall(struct venus_comm *vcp,
 				       struct upc_req *req)
+	REQUIRES(vcp->vc_mutex)
 {
 	DECLARE_WAITQUEUE(wait, current);
 	unsigned long timeout =3D jiffies + coda_timeout * HZ;
diff --git a/fs/dcache.c b/fs/dcache.c
index 9cc0d47da321..77e3383095be 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -2949,6 +2949,7 @@ struct dentry *d_ancestor(struct dentry *p1, struct=
 dentry *p2)
  * remember to update this too...
  */
 static int __d_unalias(struct dentry *dentry, struct dentry *alias)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct mutex *m1 =3D NULL;
 	struct rw_semaphore *m2 =3D NULL;
diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index 12272a8f6d75..e701595e40c8 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -456,12 +456,14 @@ void dlm_recoverd_stop(struct dlm_ls *ls)
 }
=20
 void dlm_recoverd_suspend(struct dlm_ls *ls)
+	ACQUIRE(ls->ls_recoverd_active)
 {
 	wake_up(&ls->ls_wait_general);
 	mutex_lock(&ls->ls_recoverd_active);
 }
=20
 void dlm_recoverd_resume(struct dlm_ls *ls)
+	RELEASE(ls->ls_recoverd_active)
 {
 	mutex_unlock(&ls->ls_recoverd_active);
 }
diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index 8dd1d7189c3b..8a6789978f93 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -140,6 +140,7 @@ int ecryptfs_get_lower_file(struct dentry *dentry, st=
ruct inode *inode)
 }
=20
 void ecryptfs_put_lower_file(struct inode *inode)
+	NO_THREAD_SAFETY_ANALYSIS /* needed because of a clang bug? */
 {
 	struct ecryptfs_inode_info *inode_info;
=20
diff --git a/fs/ecryptfs/messaging.c b/fs/ecryptfs/messaging.c
index 6318f3500e5c..45acf865fd52 100644
--- a/fs/ecryptfs/messaging.c
+++ b/fs/ecryptfs/messaging.c
@@ -36,6 +36,7 @@ static struct ecryptfs_msg_ctx *ecryptfs_msg_ctx_arr;
  * held.
  */
 static int ecryptfs_acquire_free_msg_ctx(struct ecryptfs_msg_ctx **msg_c=
tx)
+	TRY_ACQUIRE(0, (*msg_ctx)->mux)
 {
 	struct list_head *p;
 	int rc;
diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 29f8963bb523..d2db179e4e28 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -707,6 +707,7 @@ static bool z_erofs_get_pcluster(struct z_erofs_pclus=
ter *pcl)
 }
=20
 static int z_erofs_register_pcluster(struct z_erofs_frontend *fe)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct erofs_map_blocks *map =3D &fe->map;
 	struct super_block *sb =3D fe->inode->i_sb;
@@ -776,6 +777,7 @@ static int z_erofs_register_pcluster(struct z_erofs_f=
rontend *fe)
 }
=20
 static int z_erofs_pcluster_begin(struct z_erofs_frontend *fe)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct erofs_map_blocks *map =3D &fe->map;
 	struct super_block *sb =3D fe->inode->i_sb;
@@ -935,6 +937,7 @@ static void z_erofs_put_pcluster(struct erofs_sb_info=
 *sbi,
 }
=20
 static void z_erofs_pcluster_end(struct z_erofs_frontend *fe)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct z_erofs_pcluster *pcl =3D fe->pcl;
=20
diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 7c0980db77b3..f475671475e5 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -1651,6 +1651,7 @@ static int attach_epitem(struct file *file, struct =
epitem *epi)
  */
 static int ep_insert(struct eventpoll *ep, const struct epoll_event *eve=
nt,
 		     struct file *tfile, int fd, int full_check)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int error, pwake =3D 0;
 	__poll_t revents;
@@ -2276,6 +2277,7 @@ static inline void ep_take_care_of_epollwakeup(stru=
ct epoll_event *epev)
=20
 static inline int epoll_mutex_lock(struct mutex *mutex, int depth,
 				   bool nonblock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (!nonblock) {
 		mutex_lock_nested(mutex, depth);
@@ -2288,6 +2290,7 @@ static inline int epoll_mutex_lock(struct mutex *mu=
tex, int depth,
=20
 int do_epoll_ctl(int epfd, int op, int fd, struct epoll_event *epds,
 		 bool nonblock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int error;
 	int full_check =3D 0;
diff --git a/fs/exec.c b/fs/exec.c
index 506cd411f4ac..441c0ae2cc02 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1207,6 +1207,7 @@ void __set_task_comm(struct task_struct *tsk, const=
 char *buf, bool exec)
  * (after exec_mmap()) by search_binary_handler (see below).
  */
 int begin_new_exec(struct linux_binprm * bprm)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct task_struct *me =3D current;
 	int retval;
@@ -1433,6 +1434,7 @@ void would_dump(struct linux_binprm *bprm, struct f=
ile *file)
 EXPORT_SYMBOL(would_dump);
=20
 void setup_new_exec(struct linux_binprm * bprm)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	/* Setup things that can depend upon the personality */
 	struct task_struct *me =3D current;
@@ -1468,6 +1470,7 @@ EXPORT_SYMBOL(finalize_exec);
  * and unlock.
  */
 static int prepare_bprm_creds(struct linux_binprm *bprm)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (mutex_lock_interruptible(&current->signal->cred_guard_mutex))
 		return -ERESTARTNOINTR;
@@ -1490,6 +1493,7 @@ static void do_close_execat(struct file *file)
 }
=20
 static void free_bprm(struct linux_binprm *bprm)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (bprm->mm) {
 		acct_arg_size(bprm, 0);
diff --git a/fs/ext4/fast_commit.c b/fs/ext4/fast_commit.c
index da4263a14a20..e49478643218 100644
--- a/fs/ext4/fast_commit.c
+++ b/fs/ext4/fast_commit.c
@@ -418,6 +418,7 @@ struct __track_dentry_update_args {
 /* __track_fn for directory entry updates. Called with ei->i_fc_lock. */
 static int __track_dentry_update(handle_t *handle, struct inode *inode,
 				 void *arg, bool update)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ext4_fc_dentry_update *node;
 	struct ext4_inode_info *ei =3D EXT4_I(inode);
diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index b25a27c86696..b3ae56e46586 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -5735,6 +5735,7 @@ static inline void ext4_mb_show_ac(struct ext4_allo=
cation_context *ac)
  * One can tune this size via /sys/fs/ext4/<partition>/mb_stream_req
  */
 static void ext4_mb_group_or_file(struct ext4_allocation_context *ac)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ext4_sb_info *sbi =3D EXT4_SB(ac->ac_sb);
 	int bsbits =3D ac->ac_sb->s_blocksize_bits;
@@ -5971,6 +5972,7 @@ static void ext4_mb_add_n_trim(struct ext4_allocati=
on_context *ac)
  * release all resource we used in allocation
  */
 static void ext4_mb_release_context(struct ext4_allocation_context *ac)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ext4_sb_info *sbi =3D EXT4_SB(ac->ac_sb);
 	struct ext4_prealloc_space *pa =3D ac->ac_pa;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index de4da6d9cd93..eb896c9dea09 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3259,6 +3259,7 @@ static inline bool __should_serialize_io(struct ino=
de *inode,
 static int __f2fs_write_data_pages(struct address_space *mapping,
 						struct writeback_control *wbc,
 						enum iostat_type io_type)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct inode *inode =3D mapping->host;
 	struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
diff --git a/fs/fat/fatent.c b/fs/fat/fatent.c
index 1db348f8f887..21baa8497370 100644
--- a/fs/fat/fatent.c
+++ b/fs/fat/fatent.c
@@ -277,11 +277,13 @@ static const struct fatent_operations fat32_ops =3D=
 {
 };
=20
 static inline void lock_fat(struct msdos_sb_info *sbi)
+	ACQUIRE(sbi->fat_lock)
 {
 	mutex_lock(&sbi->fat_lock);
 }
=20
 static inline void unlock_fat(struct msdos_sb_info *sbi)
+	RELEASE(sbi->fat_lock)
 {
 	mutex_unlock(&sbi->fat_lock);
 }
diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index 3852bb66358c..7fa7f2b51ec9 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -577,12 +577,14 @@ int fat_fill_inode(struct inode *inode, struct msdo=
s_dir_entry *de)
 }
=20
 static inline void fat_lock_build_inode(struct msdos_sb_info *sbi)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (sbi->options.nfs =3D=3D FAT_NFS_NOSTALE_RO)
 		mutex_lock(&sbi->nfs_build_inode_lock);
 }
=20
 static inline void fat_unlock_build_inode(struct msdos_sb_info *sbi)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (sbi->options.nfs =3D=3D FAT_NFS_NOSTALE_RO)
 		mutex_unlock(&sbi->nfs_build_inode_lock);
diff --git a/fs/file.c b/fs/file.c
index d868cdb95d1e..631067b95467 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -1183,6 +1183,7 @@ static inline bool file_needs_f_pos_lock(struct fil=
e *file)
 }
=20
 struct fd fdget_pos(unsigned int fd)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct fd f =3D fdget(fd);
 	struct file *file =3D fd_file(f);
@@ -1195,6 +1196,7 @@ struct fd fdget_pos(unsigned int fd)
 }
=20
 void __f_unlock_pos(struct file *f)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(&f->f_pos_lock);
 }
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index e9db2cb8c150..6e8ef72b0727 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -580,6 +580,7 @@ int fuse_reverse_inval_inode(struct fuse_conn *fc, u6=
4 nodeid,
 }
=20
 bool fuse_lock_inode(struct inode *inode)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	bool locked =3D false;
=20
@@ -592,6 +593,7 @@ bool fuse_lock_inode(struct inode *inode)
 }
=20
 void fuse_unlock_inode(struct inode *inode, bool locked)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (locked)
 		mutex_unlock(&get_fuse_inode(inode)->mutex);
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index b14e54b38ee8..4f4d3584e67a 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2760,11 +2760,13 @@ void gfs2_rlist_free(struct gfs2_rgrp_list *rlist=
)
 }
=20
 void rgrp_lock_local(struct gfs2_rgrpd *rgd)
+	ACQUIRE(rgd->rd_mutex)
 {
 	mutex_lock(&rgd->rd_mutex);
 }
=20
 void rgrp_unlock_local(struct gfs2_rgrpd *rgd)
+	RELEASE(rgd->rd_mutex)
 {
 	mutex_unlock(&rgd->rd_mutex);
 }
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 13be8d1d228b..1b3c2896442e 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -116,6 +116,7 @@ void gfs2_freeze_unlock(struct gfs2_sbd *sdp)
 }
=20
 static void signal_our_withdraw(struct gfs2_sbd *sdp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct gfs2_glock *live_gl =3D sdp->sd_live_gh.gh_gl;
 	struct inode *inode;
diff --git a/fs/hfs/bfind.c b/fs/hfs/bfind.c
index ef9498a6e88a..162ea3a68138 100644
--- a/fs/hfs/bfind.c
+++ b/fs/hfs/bfind.c
@@ -13,6 +13,7 @@
 #include "btree.h"
=20
 int hfs_find_init(struct hfs_btree *tree, struct hfs_find_data *fd)
+	TRY_ACQUIRE(0, tree->tree_lock)
 {
 	void *ptr;
=20
@@ -42,6 +43,7 @@ int hfs_find_init(struct hfs_btree *tree, struct hfs_fi=
nd_data *fd)
 }
=20
 void hfs_find_exit(struct hfs_find_data *fd)
+	RELEASE(fd->tree->tree_lock)
 {
 	hfs_bnode_put(fd->bnode);
 	kfree(fd->search_key);
diff --git a/fs/hfsplus/bfind.c b/fs/hfsplus/bfind.c
index 901e83d65d20..53d108b6328a 100644
--- a/fs/hfsplus/bfind.c
+++ b/fs/hfsplus/bfind.c
@@ -13,6 +13,7 @@
 #include "hfsplus_fs.h"
=20
 int hfs_find_init(struct hfs_btree *tree, struct hfs_find_data *fd)
+	TRY_ACQUIRE(0, tree->tree_lock)
 {
 	void *ptr;
=20
@@ -31,6 +32,7 @@ int hfs_find_init(struct hfs_btree *tree, struct hfs_fi=
nd_data *fd)
 }
=20
 void hfs_find_exit(struct hfs_find_data *fd)
+	RELEASE(fd->tree->tree_lock)
 {
 	hfs_bnode_put(fd->bnode);
 	kfree(fd->search_key);
diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
index a6d61685ae79..bd7c6ca0e739 100644
--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -395,6 +395,7 @@ static int hfsplus_free_extents(struct super_block *s=
b,
=20
 int hfsplus_free_fork(struct super_block *sb, u32 cnid,
 		struct hfsplus_fork_raw *fork, int type)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct hfs_find_data fd;
 	hfsplus_extent_rec ext_entry;
@@ -542,6 +543,7 @@ int hfsplus_file_extend(struct inode *inode, bool zer=
oout)
 }
=20
 void hfsplus_file_truncate(struct inode *inode)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct super_block *sb =3D inode->i_sb;
 	struct hfsplus_inode_info *hip =3D HFSPLUS_I(inode);
diff --git a/fs/hpfs/hpfs_fn.h b/fs/hpfs/hpfs_fn.h
index 237c1c23e855..26427e681c24 100644
--- a/fs/hpfs/hpfs_fn.h
+++ b/fs/hpfs/hpfs_fn.h
@@ -361,12 +361,14 @@ static inline time32_t local_get_seconds(struct sup=
er_block *s)
  * review and HPFS is not performance-sensitive anyway.
  */
 static inline void hpfs_lock(struct super_block *s)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct hpfs_sb_info *sbi =3D hpfs_sb(s);
 	mutex_lock(&sbi->hpfs_mutex);
 }
=20
 static inline void hpfs_unlock(struct super_block *s)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct hpfs_sb_info *sbi =3D hpfs_sb(s);
 	mutex_unlock(&sbi->hpfs_mutex);
diff --git a/fs/jbd2/checkpoint.c b/fs/jbd2/checkpoint.c
index b3971e91e8eb..2ae513397500 100644
--- a/fs/jbd2/checkpoint.c
+++ b/fs/jbd2/checkpoint.c
@@ -49,6 +49,7 @@ static inline void __buffer_unlink(struct journal_head =
*jh)
 void __jbd2_log_wait_for_space(journal_t *journal)
 __acquires(&journal->j_state_lock)
 __releases(&journal->j_state_lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int nblocks, space_left;
 	/* assert_spin_locked(&journal->j_state_lock); */
@@ -152,6 +153,7 @@ __flush_batch(journal_t *journal, int *batch_count)
  * Called with j_checkpoint_mutex held.
  */
 int jbd2_log_do_checkpoint(journal_t *journal)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct journal_head	*jh;
 	struct buffer_head	*bh;
diff --git a/fs/jbd2/commit.c b/fs/jbd2/commit.c
index e8e80761ac73..e4b0599b3acb 100644
--- a/fs/jbd2/commit.c
+++ b/fs/jbd2/commit.c
@@ -346,6 +346,7 @@ static void jbd2_block_tag_csum_set(journal_t *j, jou=
rnal_block_tag_t *tag,
  * function is called by the journal thread to begin a complete commit.
  */
 void jbd2_journal_commit_transaction(journal_t *journal)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct transaction_stats_s stats;
 	transaction_t *commit_transaction;
diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
index d8084b31b361..026ddf873c13 100644
--- a/fs/jbd2/journal.c
+++ b/fs/jbd2/journal.c
@@ -1088,6 +1088,7 @@ int __jbd2_update_log_tail(journal_t *journal, tid_=
t tid, unsigned long block)
  * with other threads updating log tail.
  */
 void jbd2_update_log_tail(journal_t *journal, tid_t tid, unsigned long b=
lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_lock_io(&journal->j_checkpoint_mutex);
 	if (tid_gt(tid, journal->j_tail_sequence))
@@ -1696,6 +1697,7 @@ journal_t *jbd2_journal_init_inode(struct inode *in=
ode)
  */
=20
 static int journal_reset(journal_t *journal)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	journal_superblock_t *sb =3D journal->j_superblock;
 	unsigned long long first, last;
@@ -2110,6 +2112,7 @@ int jbd2_journal_load(journal_t *journal)
  * Return <0 if we couldn't clean up the journal.
  */
 int jbd2_journal_destroy(journal_t *journal)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err =3D 0;
=20
@@ -2396,6 +2399,7 @@ EXPORT_SYMBOL(jbd2_journal_clear_features);
  *	JBD2_JOURNAL_FLUSH_ZEROOUT: issues zeroouts for the journal blocks
  */
 int jbd2_journal_flush(journal_t *journal, unsigned int flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err =3D 0;
 	transaction_t *transaction =3D NULL;
@@ -2479,6 +2483,7 @@ int jbd2_journal_flush(journal_t *journal, unsigned=
 int flags)
  */
=20
 int jbd2_journal_wipe(journal_t *journal, int write)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err;
=20
diff --git a/fs/jbd2/transaction.c b/fs/jbd2/transaction.c
index 66513c18ca29..37e00e637e22 100644
--- a/fs/jbd2/transaction.c
+++ b/fs/jbd2/transaction.c
@@ -861,6 +861,7 @@ void jbd2_journal_wait_updates(journal_t *journal)
  * The journal lock should not be held on entry.
  */
 void jbd2_journal_lock_updates(journal_t *journal)
+	ACQUIRE(journal->j_barrier)
 {
 	jbd2_might_wait_for_commit(journal);
=20
@@ -898,6 +899,7 @@ void jbd2_journal_lock_updates(journal_t *journal)
  * Should be called without the journal lock held.
  */
 void jbd2_journal_unlock_updates (journal_t *journal)
+	RELEASE(journal->j_barrier)
 {
 	J_ASSERT(journal->j_barrier_count !=3D 0);
=20
diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index 2b2938970da3..f44b8e85c0d9 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -162,6 +162,7 @@ static int jffs2_readdir(struct file *file, struct di=
r_context *ctx)
=20
 static int jffs2_create(struct mnt_idmap *idmap, struct inode *dir_i,
 			struct dentry *dentry, umode_t mode, bool excl)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct jffs2_raw_inode *ri;
 	struct jffs2_inode_info *f, *dir_f;
@@ -284,6 +285,7 @@ static int jffs2_link (struct dentry *old_dentry, str=
uct inode *dir_i, struct de
=20
 static int jffs2_symlink (struct mnt_idmap *idmap, struct inode *dir_i,
 			  struct dentry *dentry, const char *target)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct jffs2_inode_info *f, *dir_f;
 	struct jffs2_sb_info *c;
@@ -448,6 +450,7 @@ static int jffs2_symlink (struct mnt_idmap *idmap, st=
ruct inode *dir_i,
=20
 static int jffs2_mkdir (struct mnt_idmap *idmap, struct inode *dir_i,
 		        struct dentry *dentry, umode_t mode)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct jffs2_inode_info *f, *dir_f;
 	struct jffs2_sb_info *c;
@@ -622,6 +625,7 @@ static int jffs2_rmdir (struct inode *dir_i, struct d=
entry *dentry)
=20
 static int jffs2_mknod (struct mnt_idmap *idmap, struct inode *dir_i,
 		        struct dentry *dentry, umode_t mode, dev_t rdev)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct jffs2_inode_info *f, *dir_f;
 	struct jffs2_sb_info *c;
diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index d175cccb7c55..6d832fe7f73f 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -421,6 +421,7 @@ int jffs2_do_remount_fs(struct super_block *sb, struc=
t fs_context *fc)
 /* jffs2_new_inode: allocate a new inode and inocache, add it to the has=
h,
    fill in the raw_inode while you're at it. */
 struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct=
 jffs2_raw_inode *ri)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct inode *inode;
 	struct super_block *sb =3D dir_i->i_sb;
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 1b833bbffcf5..8e1909d7c292 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -1164,6 +1164,7 @@ static int jffs2_garbage_collect_hole(struct jffs2_=
sb_info *c, struct jffs2_eras
 static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct j=
ffs2_eraseblock *orig_jeb,
 				       struct jffs2_inode_info *f, struct jffs2_full_dnode *fn,
 				       uint32_t start, uint32_t end)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct inode *inode =3D OFNI_EDONI_2SFFJ(f);
 	struct jffs2_full_dnode *new_fn;
diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 3fb9f9807b66..bd945e7a069e 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -77,6 +77,7 @@ static int jffs2_do_reserve_space(struct jffs2_sb_info =
*c,  uint32_t minsize,
=20
 int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 			uint32_t *len, int prio, uint32_t sumsize)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int ret =3D -EAGAIN;
 	int blocksneeded =3D c->resv_blocks_write;
@@ -561,6 +562,7 @@ struct jffs2_raw_node_ref *jffs2_add_physical_node_re=
f(struct jffs2_sb_info *c,
=20
=20
 void jffs2_complete_reservation(struct jffs2_sb_info *c)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	jffs2_dbg(1, "jffs2_complete_reservation()\n");
 	spin_lock(&c->erase_completion_lock);
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index cda9a361368e..a69f371fe0d4 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -60,6 +60,7 @@ struct jffs2_full_dnode *jffs2_write_dnode(struct jffs2=
_sb_info *c, struct jffs2
 					   struct jffs2_raw_inode *ri, const unsigned char *data,
 					   uint32_t datalen, int alloc_mode)
=20
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct jffs2_full_dnode *fn;
 	size_t retlen;
@@ -205,6 +206,7 @@ struct jffs2_full_dnode *jffs2_write_dnode(struct jff=
s2_sb_info *c, struct jffs2
 struct jffs2_full_dirent *jffs2_write_dirent(struct jffs2_sb_info *c, st=
ruct jffs2_inode_info *f,
 					     struct jffs2_raw_dirent *rd, const unsigned char *name,
 					     uint32_t namelen, int alloc_mode)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct jffs2_full_dirent *fd;
 	size_t retlen;
diff --git a/fs/jfs/namei.c b/fs/jfs/namei.c
index fc8ede43afde..a6e76fcb31ed 100644
--- a/fs/jfs/namei.c
+++ b/fs/jfs/namei.c
@@ -1068,6 +1068,7 @@ static int jfs_symlink(struct mnt_idmap *idmap, str=
uct inode *dip,
 static int jfs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 		      struct dentry *old_dentry, struct inode *new_dir,
 		      struct dentry *new_dentry, unsigned int flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct btstack btstack;
 	ino_t ino;
diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index 0eb320617d7b..c7747366e5d2 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -48,6 +48,7 @@ static inline struct mutex *kernfs_open_file_mutex_ptr(=
struct kernfs_node *kn)
 }
=20
 static inline struct mutex *kernfs_open_file_mutex_lock(struct kernfs_no=
de *kn)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct mutex *lock;
=20
@@ -143,6 +144,7 @@ static void kernfs_seq_stop_active(struct seq_file *s=
f, void *v)
 }
=20
 static void *kernfs_seq_start(struct seq_file *sf, loff_t *ppos)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct kernfs_open_file *of =3D sf->private;
 	const struct kernfs_ops *ops;
@@ -188,6 +190,7 @@ static void *kernfs_seq_next(struct seq_file *sf, voi=
d *v, loff_t *ppos)
 }
=20
 static void kernfs_seq_stop(struct seq_file *sf, void *v)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct kernfs_open_file *of =3D sf->private;
=20
@@ -219,6 +222,7 @@ static const struct seq_operations kernfs_seq_ops =3D=
 {
  * bin files.
  */
 static ssize_t kernfs_file_read_iter(struct kiocb *iocb, struct iov_iter=
 *iter)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct kernfs_open_file *of =3D kernfs_of(iocb->ki_filp);
 	ssize_t len =3D min_t(size_t, iov_iter_count(iter), PAGE_SIZE);
@@ -291,6 +295,7 @@ static ssize_t kernfs_fop_read_iter(struct kiocb *ioc=
b, struct iov_iter *iter)
  * back.
  */
 static ssize_t kernfs_fop_write_iter(struct kiocb *iocb, struct iov_iter=
 *iter)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct kernfs_open_file *of =3D kernfs_of(iocb->ki_filp);
 	ssize_t len =3D iov_iter_count(iter);
@@ -513,6 +518,7 @@ static int kernfs_fop_mmap(struct file *file, struct =
vm_area_struct *vma)
  */
 static int kernfs_get_open_node(struct kernfs_node *kn,
 				struct kernfs_open_file *of)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct kernfs_open_node *on;
 	struct mutex *mutex;
@@ -558,6 +564,7 @@ static int kernfs_get_open_node(struct kernfs_node *k=
n,
 static void kernfs_unlink_open_file(struct kernfs_node *kn,
 				    struct kernfs_open_file *of,
 				    bool open_failed)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct kernfs_open_node *on;
 	struct mutex *mutex;
@@ -750,6 +757,7 @@ static void kernfs_release_file(struct kernfs_node *k=
n,
 }
=20
 static int kernfs_fop_release(struct inode *inode, struct file *filp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct kernfs_node *kn =3D inode->i_private;
 	struct kernfs_open_file *of =3D kernfs_of(filp);
@@ -790,6 +798,7 @@ bool kernfs_should_drain_open_files(struct kernfs_nod=
e *kn)
 }
=20
 void kernfs_drain_open_files(struct kernfs_node *kn)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct kernfs_open_node *on;
 	struct kernfs_open_file *of;
diff --git a/fs/lockd/host.c b/fs/lockd/host.c
index 5e6877c37f73..fc5d51810075 100644
--- a/fs/lockd/host.c
+++ b/fs/lockd/host.c
@@ -288,6 +288,7 @@ struct nlm_host *nlmclnt_lookup_host(const struct soc=
kaddr *sap,
  *
  */
 void nlmclnt_release_host(struct nlm_host *host)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	if (host =3D=3D NULL)
 		return;
diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
index c1315df4b350..aa1e8926c952 100644
--- a/fs/lockd/svclock.c
+++ b/fs/lockd/svclock.c
@@ -290,6 +290,7 @@ static int nlmsvc_unlink_block(struct nlm_block *bloc=
k)
 }
=20
 static void nlmsvc_free_block(struct kref *kref)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nlm_block *block =3D container_of(kref, struct nlm_block, b_coun=
t);
 	struct nlm_file		*file =3D block->b_file;
diff --git a/fs/namei.c b/fs/namei.c
index 3ab9440c5b93..8bd2a45a9206 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3177,6 +3177,7 @@ static inline int may_create(struct mnt_idmap *idma=
p,
=20
 // p1 !=3D p2, both are on the same filesystem, ->s_vfs_rename_mutex is =
held
 static struct dentry *lock_two_directories(struct dentry *p1, struct den=
try *p2)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct dentry *p =3D p1, *q =3D p2, *r;
=20
@@ -3212,6 +3213,7 @@ static struct dentry *lock_two_directories(struct d=
entry *p1, struct dentry *p2)
  * p1 and p2 should be directories on the same fs.
  */
 struct dentry *lock_rename(struct dentry *p1, struct dentry *p2)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (p1 =3D=3D p2) {
 		inode_lock_nested(p1->d_inode, I_MUTEX_PARENT);
@@ -3227,6 +3229,7 @@ EXPORT_SYMBOL(lock_rename);
  * c1 and p2 should be on the same fs.
  */
 struct dentry *lock_rename_child(struct dentry *c1, struct dentry *p2)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (READ_ONCE(c1->d_parent) =3D=3D p2) {
 		/*
@@ -3266,6 +3269,7 @@ struct dentry *lock_rename_child(struct dentry *c1,=
 struct dentry *p2)
 EXPORT_SYMBOL(lock_rename_child);
=20
 void unlock_rename(struct dentry *p1, struct dentry *p2)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	inode_unlock(p1->d_inode);
 	if (p1 !=3D p2) {
diff --git a/fs/netfs/write_issue.c b/fs/netfs/write_issue.c
index 69727411683e..ac50e4caad14 100644
--- a/fs/netfs/write_issue.c
+++ b/fs/netfs/write_issue.c
@@ -616,6 +616,7 @@ EXPORT_SYMBOL(netfs_writepages);
  * Begin a write operation for writing through the pagecache.
  */
 struct netfs_io_request *netfs_begin_writethrough(struct kiocb *iocb, si=
ze_t len)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct netfs_io_request *wreq =3D NULL;
 	struct netfs_inode *ictx =3D netfs_inode(file_inode(iocb->ki_filp));
@@ -674,6 +675,7 @@ int netfs_advance_writethrough(struct netfs_io_reques=
t *wreq, struct writeback_c
  */
 int netfs_end_writethrough(struct netfs_io_request *wreq, struct writeba=
ck_control *wbc,
 			   struct folio *writethrough_cache)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct netfs_inode *ictx =3D netfs_inode(wreq->inode);
 	int ret;
diff --git a/fs/nfsd/nfs4layouts.c b/fs/nfsd/nfs4layouts.c
index fbfddd3c4c94..a42a0f26b83a 100644
--- a/fs/nfsd/nfs4layouts.c
+++ b/fs/nfsd/nfs4layouts.c
@@ -280,6 +280,7 @@ __be32
 nfsd4_preprocess_layout_stateid(struct svc_rqst *rqstp,
 		struct nfsd4_compound_state *cstate, stateid_t *stateid,
 		bool create, u32 layout_type, struct nfs4_layout_stateid **lsp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nfs4_layout_stateid *ls;
 	struct nfs4_stid *stid;
@@ -504,6 +505,7 @@ __be32
 nfsd4_return_file_layouts(struct svc_rqst *rqstp,
 		struct nfsd4_compound_state *cstate,
 		struct nfsd4_layoutreturn *lrp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nfs4_layout_stateid *ls;
 	struct nfs4_layout *lp, *n;
diff --git a/fs/nfsd/nfs4proc.c b/fs/nfsd/nfs4proc.c
index f6e06c779d09..9029afd63409 100644
--- a/fs/nfsd/nfs4proc.c
+++ b/fs/nfsd/nfs4proc.c
@@ -2377,6 +2377,7 @@ nfsd4_getdeviceinfo_release(union nfsd4_op_u *u)
 static __be32
 nfsd4_layoutget(struct svc_rqst *rqstp,
 		struct nfsd4_compound_state *cstate, union nfsd4_op_u *u)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nfsd4_layoutget *lgp =3D &u->layoutget;
 	struct svc_fh *current_fh =3D &cstate->current_fh;
@@ -2463,6 +2464,7 @@ nfsd4_layoutget_release(union nfsd4_op_u *u)
 static __be32
 nfsd4_layoutcommit(struct svc_rqst *rqstp,
 		struct nfsd4_compound_state *cstate, union nfsd4_op_u *u)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nfsd4_layoutcommit *lcp =3D &u->layoutcommit;
 	const struct nfsd4_layout_seg *seg =3D &lcp->lc_seg;
diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index b7a0cfd05401..1e4613c3aede 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -5040,6 +5040,7 @@ nfsd4_verify_open_stid(struct nfs4_stid *s)
 /* Lock the stateid st_mutex, and deal with races with CLOSE */
 static __be32
 nfsd4_lock_ol_stateid(struct nfs4_ol_stateid *stp)
+	TRY_ACQUIRE(nfs_ok, stp->st_mutex)
 {
 	__be32 ret;
=20
@@ -5114,6 +5115,7 @@ find_or_alloc_open_stateowner(unsigned int strhashv=
al, struct nfsd4_open *open,
=20
 static struct nfs4_ol_stateid *
 init_open_stateid(struct nfs4_file *fp, struct nfsd4_open *open)
+	NO_THREAD_SAFETY_ANALYSIS
 {
=20
 	struct nfs4_openowner *oo =3D open->op_openowner;
@@ -6267,6 +6269,7 @@ static bool open_xor_delegation(struct nfsd4_open *=
open)
  */
 __be32
 nfsd4_process_open2(struct svc_rqst *rqstp, struct svc_fh *current_fh, s=
truct nfsd4_open *open)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nfsd4_compoundres *resp =3D rqstp->rq_resp;
 	struct nfs4_client *cl =3D open->op_openowner->oo_owner.so_client;
@@ -7411,6 +7414,7 @@ setlkflg (int type)
 }
=20
 static __be32 nfs4_seqid_op_checks(struct nfsd4_compound_state *cstate, =
stateid_t *stateid, u32 seqid, struct nfs4_ol_stateid *stp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct svc_fh *current_fh =3D &cstate->current_fh;
 	struct nfs4_stateowner *sop =3D stp->st_stateowner;
@@ -7479,6 +7483,7 @@ nfs4_preprocess_seqid_op(struct nfsd4_compound_stat=
e *cstate, u32 seqid,
=20
 static __be32 nfs4_preprocess_confirmed_seqid_op(struct nfsd4_compound_s=
tate *cstate, u32 seqid,
 						 stateid_t *stateid, struct nfs4_ol_stateid **stpp, struct nfsd_ne=
t *nn)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	__be32 status;
 	struct nfs4_openowner *oo;
@@ -7501,6 +7506,7 @@ static __be32 nfs4_preprocess_confirmed_seqid_op(st=
ruct nfsd4_compound_state *cs
 __be32
 nfsd4_open_confirm(struct svc_rqst *rqstp, struct nfsd4_compound_state *=
cstate,
 		   union nfsd4_op_u *u)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nfsd4_open_confirm *oc =3D &u->open_confirm;
 	__be32 status;
@@ -7568,6 +7574,7 @@ static inline void nfs4_stateid_downgrade(struct nf=
s4_ol_stateid *stp, u32 to_ac
 __be32
 nfsd4_open_downgrade(struct svc_rqst *rqstp,
 		     struct nfsd4_compound_state *cstate, union nfsd4_op_u *u)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nfsd4_open_downgrade *od =3D &u->open_downgrade;
 	__be32 status;
@@ -7640,6 +7647,7 @@ static bool nfsd4_close_open_stateid(struct nfs4_ol=
_stateid *s)
 __be32
 nfsd4_close(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 		union nfsd4_op_u *u)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nfsd4_close *close =3D &u->close;
 	__be32 status;
@@ -7961,6 +7969,7 @@ static struct nfs4_ol_stateid *
 init_lock_stateid(struct nfs4_ol_stateid *stp, struct nfs4_lockowner *lo=
,
 		  struct nfs4_file *fp, struct inode *inode,
 		  struct nfs4_ol_stateid *open_stp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nfs4_client *clp =3D lo->lo_owner.so_client;
 	struct nfs4_ol_stateid *retstp;
@@ -8103,6 +8112,7 @@ lookup_or_create_lock_state(struct nfsd4_compound_s=
tate *cstate,
 __be32
 nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 	   union nfsd4_op_u *u)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nfsd4_lock *lock =3D &u->lock;
 	struct nfs4_openowner *open_sop =3D NULL;
@@ -8446,6 +8456,7 @@ void nfsd4_lockt_release(union nfsd4_op_u *u)
 __be32
 nfsd4_locku(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 	    union nfsd4_op_u *u)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nfsd4_locku *locku =3D &u->locku;
 	struct nfs4_ol_stateid *stp;
diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 5df6a0b5add9..0e9a2c921606 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3130,6 +3130,7 @@ bool ni_is_dirty(struct inode *inode)
  */
 static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO=
 *dup,
 			     int sync)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ATTRIB *attr;
 	struct mft_inode *mi;
@@ -3242,7 +3243,8 @@ static bool ni_update_parent(struct ntfs_inode *ni,=
 struct NTFS_DUP_INFO *dup,
 /*
  * ni_write_inode - Write MFT base record and all subrecords to disk.
  */
-int ni_write_inode(struct inode *inode, int sync, const char *hint)
+int ni_write_inode(struct inode *inode, int sync,
+		   const char *hint) NO_THREAD_SAFETY_ANALYSIS
 {
 	int err =3D 0, err2;
 	struct ntfs_inode *ni =3D ntfs_i(inode);
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index a1e11228dafd..abd416d13528 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1191,6 +1191,7 @@ int ntfs_create_inode(struct mnt_idmap *idmap, stru=
ct inode *dir,
 		      struct dentry *dentry, const struct cpu_str *uni,
 		      umode_t mode, dev_t dev, const char *symname, u32 size,
 		      struct ntfs_fnd *fnd)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err;
 	struct super_block *sb =3D dir->i_sb;
diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
index abf7e81584a9..09c71147c1bd 100644
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@ -125,6 +125,7 @@ static int ntfs_mknod(struct mnt_idmap *idmap, struct=
 inode *dir,
  * ntfs_link - inode_operations::link
  */
 static int ntfs_link(struct dentry *ode, struct inode *dir, struct dentr=
y *de)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err;
 	struct inode *inode =3D d_inode(ode);
@@ -234,6 +235,7 @@ static int ntfs_rmdir(struct inode *dir, struct dentr=
y *dentry)
 static int ntfs_rename(struct mnt_idmap *idmap, struct inode *dir,
 		       struct dentry *dentry, struct inode *new_dir,
 		       struct dentry *new_dentry, u32 flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err;
 	struct super_block *sb =3D dir->i_sb;
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 382820464dee..e31ac95c31aa 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -1107,21 +1107,25 @@ static inline void mi_clear(struct mft_inode *mi)
 }
=20
 static inline void ni_lock(struct ntfs_inode *ni)
+	ACQUIRE(ni->ni_lock)
 {
 	mutex_lock_nested(&ni->ni_lock, NTFS_INODE_MUTEX_NORMAL);
 }
=20
 static inline void ni_lock_dir(struct ntfs_inode *ni)
+	ACQUIRE(ni->ni_lock)
 {
 	mutex_lock_nested(&ni->ni_lock, NTFS_INODE_MUTEX_PARENT);
 }
=20
 static inline void ni_lock_dir2(struct ntfs_inode *ni)
+	ACQUIRE(ni->ni_lock)
 {
 	mutex_lock_nested(&ni->ni_lock, NTFS_INODE_MUTEX_PARENT2);
 }
=20
 static inline void ni_unlock(struct ntfs_inode *ni)
+	RELEASE(ni->ni_lock)
 {
 	mutex_unlock(&ni->ni_lock);
 }
diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index 714c7ecedca8..8333c5cc8923 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -113,6 +113,7 @@ int mi_init(struct mft_inode *mi, struct ntfs_sb_info=
 *sbi, CLST rno)
  * mi_read - Read MFT data.
  */
 int mi_read(struct mft_inode *mi, bool is_mft)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err;
 	struct MFT_REC *rec =3D mi->mrec;
diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index e0055dcf8fe3..a66d0222ede1 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -250,6 +250,7 @@ static ssize_t ntfs_list_ea(struct ntfs_inode *ni, ch=
ar *buffer,
=20
 static int ntfs_get_ea(struct inode *inode, const char *name, size_t nam=
e_len,
 		       void *buffer, size_t size, size_t *required)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ntfs_inode *ni =3D ntfs_i(inode);
 	const struct EA_INFO *info;
@@ -314,6 +315,7 @@ static noinline int ntfs_set_ea(struct inode *inode, =
const char *name,
 				size_t name_len, const void *value,
 				size_t val_size, int flags, bool locked,
 				__le16 *ea_size)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ntfs_inode *ni =3D ntfs_i(inode);
 	struct ntfs_sb_info *sbi =3D ni->mi.sbi;
diff --git a/fs/ocfs2/cluster/nodemanager.c b/fs/ocfs2/cluster/nodemanage=
r.c
index 2f61d39e4e50..2e5ceb6742b8 100644
--- a/fs/ocfs2/cluster/nodemanager.c
+++ b/fs/ocfs2/cluster/nodemanager.c
@@ -762,11 +762,13 @@ static struct o2nm_cluster_group o2nm_cluster_group=
 =3D {
 };
=20
 static inline void o2nm_lock_subsystem(void)
+	ACQUIRE(o2nm_cluster_group.cs_subsys.su_mutex)
 {
 	mutex_lock(&o2nm_cluster_group.cs_subsys.su_mutex);
 }
=20
 static inline void o2nm_unlock_subsystem(void)
+	RELEASE(o2nm_cluster_group.cs_subsys.su_mutex)
 {
 	mutex_unlock(&o2nm_cluster_group.cs_subsys.su_mutex);
 }
diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
index 92a6149da9c1..3b9082ee8eab 100644
--- a/fs/ocfs2/dlmglue.c
+++ b/fs/ocfs2/dlmglue.c
@@ -696,6 +696,7 @@ static void ocfs2_nfs_sync_lock_init(struct ocfs2_sup=
er *osb)
 }
=20
 void ocfs2_trim_fs_lock_res_init(struct ocfs2_super *osb)
+	ACQUIRE(osb->obs_trim_fs_mutex)
 {
 	struct ocfs2_lock_res *lockres =3D &osb->osb_trim_fs_lockres;
=20
@@ -709,6 +710,7 @@ void ocfs2_trim_fs_lock_res_init(struct ocfs2_super *=
osb)
 }
=20
 void ocfs2_trim_fs_lock_res_uninit(struct ocfs2_super *osb)
+	RELEASE(osb->obs_trim_fs_mutex)
 {
 	struct ocfs2_lock_res *lockres =3D &osb->osb_trim_fs_lockres;
=20
diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 12e5d1f73325..f6f538875f5f 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -1661,6 +1661,7 @@ __releases(&oi->ip_lock)
 }
=20
 static void ocfs2_inode_cache_io_lock(struct ocfs2_caching_info *ci)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ocfs2_inode_info *oi =3D cache_info_to_inode(ci);
=20
@@ -1668,6 +1669,7 @@ static void ocfs2_inode_cache_io_lock(struct ocfs2_=
caching_info *ci)
 }
=20
 static void ocfs2_inode_cache_io_unlock(struct ocfs2_caching_info *ci)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ocfs2_inode_info *oi =3D cache_info_to_inode(ci);
=20
diff --git a/fs/ocfs2/refcounttree.c b/fs/ocfs2/refcounttree.c
index 8f732742b26e..fa79196ed861 100644
--- a/fs/ocfs2/refcounttree.c
+++ b/fs/ocfs2/refcounttree.c
@@ -169,6 +169,7 @@ __releases(&rf->rf_lock)
 }
=20
 static void ocfs2_refcount_cache_io_lock(struct ocfs2_caching_info *ci)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ocfs2_refcount_tree *rf =3D cache_info_to_refcount(ci);
=20
@@ -176,6 +177,7 @@ static void ocfs2_refcount_cache_io_lock(struct ocfs2=
_caching_info *ci)
 }
=20
 static void ocfs2_refcount_cache_io_unlock(struct ocfs2_caching_info *ci=
)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ocfs2_refcount_tree *rf =3D cache_info_to_refcount(ci);
=20
diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugf=
s.c
index f52073022fae..a41f7eeee582 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -252,6 +252,7 @@ static int orangefs_debug_help_open(struct inode *ino=
de, struct file *file)
  * time we get to start (pos =3D 1), we're done.
  */
 static void *help_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(orangefs_help_file_lock)
 {
 	void *payload =3D NULL;
=20
@@ -274,6 +275,7 @@ static void *help_next(struct seq_file *m, void *v, l=
off_t *pos)
 }
=20
 static void help_stop(struct seq_file *m, void *p)
+	RELEASE(orangefs_help_file_lock)
 {
 	gossip_debug(GOSSIP_DEBUGFS_DEBUG, "help_stop: start\n");
 	mutex_unlock(&orangefs_help_file_lock);
diff --git a/fs/orangefs/waitqueue.c b/fs/orangefs/waitqueue.c
index beafc33d57be..388ef2c7135d 100644
--- a/fs/orangefs/waitqueue.c
+++ b/fs/orangefs/waitqueue.c
@@ -65,6 +65,7 @@ void purge_waiting_ops(void)
 int service_operation(struct orangefs_kernel_op_s *op,
 		      const char *op_name,
 		      int flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	long timeout =3D MAX_SCHEDULE_TIMEOUT;
 	int ret =3D 0;
diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 0021e2025020..9cdf189aeb0a 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -641,16 +641,19 @@ static inline unsigned int ovl_xino_bits(struct ovl=
_fs *ofs)
 }
=20
 static inline void ovl_inode_lock(struct inode *inode)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_lock(&OVL_I(inode)->lock);
 }
=20
 static inline int ovl_inode_lock_interruptible(struct inode *inode)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	return mutex_lock_interruptible(&OVL_I(inode)->lock);
 }
=20
 static inline void ovl_inode_unlock(struct inode *inode)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(&OVL_I(inode)->lock);
 }
diff --git a/fs/pipe.c b/fs/pipe.c
index 94b59045ab44..44dd3b0a4d6e 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -87,6 +87,7 @@ static int pipe_lock_cmp_fn(const struct lockdep_map *a=
,
 #endif
=20
 void pipe_lock(struct pipe_inode_info *pipe)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (pipe->files)
 		mutex_lock(&pipe->mutex);
@@ -94,6 +95,7 @@ void pipe_lock(struct pipe_inode_info *pipe)
 EXPORT_SYMBOL(pipe_lock);
=20
 void pipe_unlock(struct pipe_inode_info *pipe)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (pipe->files)
 		mutex_unlock(&pipe->mutex);
diff --git a/fs/proc/proc_tty.c b/fs/proc/proc_tty.c
index 5c6a5ceab2f1..3732064beb2e 100644
--- a/fs/proc/proc_tty.c
+++ b/fs/proc/proc_tty.c
@@ -102,6 +102,7 @@ static int show_tty_driver(struct seq_file *m, void *=
v)
=20
 /* iterator */
 static void *t_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(tty_mutex)
 {
 	mutex_lock(&tty_mutex);
 	return seq_list_start(&tty_drivers, *pos);
@@ -113,6 +114,7 @@ static void *t_next(struct seq_file *m, void *v, loff=
_t *pos)
 }
=20
 static void t_stop(struct seq_file *m, void *v)
+	RELEASE(tty_mutex)
 {
 	mutex_unlock(&tty_mutex);
 }
diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index ceb5639a0629..7cba01dfbd3a 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -1297,6 +1297,7 @@ static int psz_alloc_zones(struct psz_context *cxt)
  * Return: 0 on success, others on failure.
  */
 int register_pstore_zone(struct pstore_zone_info *info)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err =3D -EINVAL;
 	struct psz_context *cxt =3D &pstore_zone_cxt;
diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index a68434ad744a..af5e01c7f606 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -860,6 +860,7 @@ static inline bool is_smb1(struct TCP_Server_Info *se=
rver)
 }
=20
 static inline void cifs_server_lock(struct TCP_Server_Info *server)
+	ACQUIRE(server->_srv_mutex)
 {
 	unsigned int nofs_flag =3D memalloc_nofs_save();
=20
@@ -868,6 +869,7 @@ static inline void cifs_server_lock(struct TCP_Server=
_Info *server)
 }
=20
 static inline void cifs_server_unlock(struct TCP_Server_Info *server)
+	RELEASE(server->_srv_mutex)
 {
 	unsigned int nofs_flag =3D server->nofs_flag;
=20
diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
index f917de020dd5..96bcd841e554 100644
--- a/fs/smb/client/connect.c
+++ b/fs/smb/client/connect.c
@@ -940,6 +940,7 @@ cifs_enable_signing(struct TCP_Server_Info *server, b=
ool mnt_sign_required)
=20
 static noinline_for_stack void
 clean_demultiplex_info(struct TCP_Server_Info *server)
+	REQUIRES(server->_srv_mutex)
 {
 	int length;
=20
@@ -1137,9 +1138,9 @@ smb2_add_credits_from_hdr(char *buffer, struct TCP_=
Server_Info *server)
 	}
 }
=20
-
 static int
 cifs_demultiplex_thread(void *p)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int i, num_mids, length;
 	struct TCP_Server_Info *server =3D p;
diff --git a/fs/smb/client/fs_context.h b/fs/smb/client/fs_context.h
index 881bfc08667e..0f315e213bd6 100644
--- a/fs/smb/client/fs_context.h
+++ b/fs/smb/client/fs_context.h
@@ -345,11 +345,13 @@ extern char *cifs_sanitize_prepath(char *prepath, g=
fp_t gfp);
 extern struct mutex cifs_mount_mutex;
=20
 static inline void cifs_mount_lock(void)
+	ACQUIRE(cifs_mount_mutex)
 {
 	mutex_lock(&cifs_mount_mutex);
 }
=20
 static inline void cifs_mount_unlock(void)
+	RELEASE(cifs_mount_mutex)
 {
 	mutex_unlock(&cifs_mount_mutex);
 }
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index b0b7254661e9..bab01426472d 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1380,6 +1380,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
  * return value: 0 on success, or actual error code
  */
 int smbd_reconnect(struct TCP_Server_Info *server)
+	REQUIRES(server->_srv_mutex)
 {
 	log_rdma_event(INFO, "reconnecting rdma session\n");
=20
@@ -1488,6 +1489,7 @@ static int allocate_caches_and_workqueue(struct smb=
d_connection *info)
 /* Create a SMBD connection, called by upper layer */
 static struct smbd_connection *_smbd_get_connection(
 	struct TCP_Server_Info *server, struct sockaddr *dstaddr, int port)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int rc;
 	struct smbd_connection *info;
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index c08e3665150d..f9644c59800c 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -269,7 +269,7 @@ struct smbd_connection *smbd_get_connection(
 /* Reconnect SMBDirect session */
 int smbd_reconnect(struct TCP_Server_Info *server);
 /* Destroy SMBDirect session */
-void smbd_destroy(struct TCP_Server_Info *server);
+void smbd_destroy(struct TCP_Server_Info *server) REQUIRES(server->_srv_=
mutex);
=20
 /* Interface for carrying upper layer I/O through send/recv */
 int smbd_recv(struct smbd_connection *info, struct msghdr *msg);
diff --git a/fs/smb/server/connection.h b/fs/smb/server/connection.h
index b379ae4fdcdf..4145a43602cb 100644
--- a/fs/smb/server/connection.h
+++ b/fs/smb/server/connection.h
@@ -166,8 +166,10 @@ void ksmbd_conn_init_server_callbacks(struct ksmbd_c=
onn_ops *ops);
 int ksmbd_conn_handler_loop(void *p);
 int ksmbd_conn_transport_init(void);
 void ksmbd_conn_transport_destroy(void);
-void ksmbd_conn_lock(struct ksmbd_conn *conn);
-void ksmbd_conn_unlock(struct ksmbd_conn *conn);
+void ksmbd_conn_lock(struct ksmbd_conn *conn)
+	ACQUIRE(conn->srv_mutex);
+void ksmbd_conn_unlock(struct ksmbd_conn *conn)
+	RELEASE(conn->srv_mutex);
=20
 /*
  * WARNING
diff --git a/fs/super.c b/fs/super.c
index 5a7db4a556e3..11db4053825c 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1372,6 +1372,7 @@ EXPORT_SYMBOL(sget_dev);
  */
 static struct super_block *bdev_super_lock(struct block_device *bdev, bo=
ol excl)
 	__releases(&bdev->bd_holder_lock)
+	RELEASE(bdev->bd_holder_lock)
 {
 	struct super_block *sb =3D bdev->bd_holder;
 	bool locked;
@@ -1407,6 +1408,7 @@ static struct super_block *bdev_super_lock(struct b=
lock_device *bdev, bool excl)
 }
=20
 static void fs_bdev_mark_dead(struct block_device *bdev, bool surprise)
+	RELEASE(bdev->bd_holder_lock)
 {
 	struct super_block *sb;
=20
@@ -1425,6 +1427,7 @@ static void fs_bdev_mark_dead(struct block_device *=
bdev, bool surprise)
 }
=20
 static void fs_bdev_sync(struct block_device *bdev)
+	RELEASE(bdev->bd_holder_lock)
 {
 	struct super_block *sb;
=20
@@ -1437,6 +1440,7 @@ static void fs_bdev_sync(struct block_device *bdev)
 }
=20
 static struct super_block *get_bdev_super(struct block_device *bdev)
+	RELEASE(bdev->bd_holder_lock)
 {
 	bool active =3D false;
 	struct super_block *sb;
@@ -1467,6 +1471,7 @@ static struct super_block *get_bdev_super(struct bl=
ock_device *bdev)
  *         failed a negative error code is returned.
  */
 static int fs_bdev_freeze(struct block_device *bdev)
+	RELEASE(bdev->bd_holder_lock)
 {
 	struct super_block *sb;
 	int error =3D 0;
@@ -1507,6 +1512,7 @@ static int fs_bdev_freeze(struct block_device *bdev=
)
  *         freeze or might be frozen from other block devices).
  */
 static int fs_bdev_thaw(struct block_device *bdev)
+	RELEASE(bdev->bd_holder_lock)
 {
 	struct super_block *sb;
 	int error;
diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 0b48cbab8a3d..a6e6230e513a 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -101,6 +101,7 @@ struct ubifs_compressor *ubifs_compressors[UBIFS_COMP=
R_TYPES_CNT];
  */
 void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
 		    int in_len, void *out_buf, int *out_len, int *compr_type)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err;
 	struct ubifs_compressor *compr =3D ubifs_compressors[*compr_type];
@@ -154,6 +155,7 @@ void ubifs_compress(const struct ubifs_info *c, const=
 void *in_buf,
  */
 int ubifs_decompress(const struct ubifs_info *c, const void *in_buf,
 		     int in_len, void *out_buf, int *out_len, int compr_type)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err;
 	struct ubifs_compressor *compr;
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index fda82f3e16e8..ddddb996d565 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -424,6 +424,7 @@ static struct inode *create_whiteout(struct inode *di=
r, struct dentry *dentry)
  * wrapper function.
  */
 static void lock_2_inodes(struct inode *inode1, struct inode *inode2)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_lock_nested(&ubifs_inode(inode1)->ui_mutex, WB_MUTEX_1);
 	mutex_lock_nested(&ubifs_inode(inode2)->ui_mutex, WB_MUTEX_2);
@@ -435,6 +436,7 @@ static void lock_2_inodes(struct inode *inode1, struc=
t inode *inode2)
  * @inode2: second inode
  */
 static void unlock_2_inodes(struct inode *inode1, struct inode *inode2)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(&ubifs_inode(inode2)->ui_mutex);
 	mutex_unlock(&ubifs_inode(inode1)->ui_mutex);
@@ -1289,6 +1291,7 @@ static int ubifs_symlink(struct mnt_idmap *idmap, s=
truct inode *dir,
  */
 static void lock_4_inodes(struct inode *inode1, struct inode *inode2,
 			  struct inode *inode3, struct inode *inode4)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_lock_nested(&ubifs_inode(inode1)->ui_mutex, WB_MUTEX_1);
 	if (inode2 !=3D inode1)
@@ -1308,6 +1311,7 @@ static void lock_4_inodes(struct inode *inode1, str=
uct inode *inode2,
  */
 static void unlock_4_inodes(struct inode *inode1, struct inode *inode2,
 			    struct inode *inode3, struct inode *inode4)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (inode4)
 		mutex_unlock(&ubifs_inode(inode4)->ui_mutex);
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 5130123005e4..a9d9807f5311 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -212,6 +212,7 @@ static void release_existing_page_budget(struct ubifs=
_info *c)
=20
 static int write_begin_slow(struct address_space *mapping,
 			    loff_t pos, unsigned len, struct folio **foliop)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct inode *inode =3D mapping->host;
 	struct ubifs_info *c =3D inode->i_sb->s_fs_info;
@@ -318,6 +319,7 @@ static int write_begin_slow(struct address_space *map=
ping,
  */
 static int allocate_budget(struct ubifs_info *c, struct folio *folio,
 			   struct ubifs_inode *ui, int appending)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ubifs_budget_req req =3D { .fast =3D 1 };
=20
@@ -415,6 +417,7 @@ static int allocate_budget(struct ubifs_info *c, stru=
ct folio *folio,
 static int ubifs_write_begin(struct file *file, struct address_space *ma=
pping,
 			     loff_t pos, unsigned len,
 			     struct folio **foliop, void **fsdata)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct inode *inode =3D mapping->host;
 	struct ubifs_info *c =3D inode->i_sb->s_fs_info;
@@ -508,6 +511,7 @@ static int ubifs_write_begin(struct file *file, struc=
t address_space *mapping,
  */
 static void cancel_budget(struct ubifs_info *c, struct folio *folio,
 			  struct ubifs_inode *ui, int appending)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (appending) {
 		if (!ui->dirty)
@@ -525,6 +529,7 @@ static void cancel_budget(struct ubifs_info *c, struc=
t folio *folio,
 static int ubifs_write_end(struct file *file, struct address_space *mapp=
ing,
 			   loff_t pos, unsigned len, unsigned copied,
 			   struct folio *folio, void *fsdata)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct inode *inode =3D mapping->host;
 	struct ubifs_inode *ui =3D ubifs_inode(inode);
@@ -820,6 +825,7 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, s=
truct bu_info *bu,
  * Returns: %1 if a bulk-read is done and %0 otherwise.
  */
 static int ubifs_bulk_read(struct folio *folio)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct inode *inode =3D folio->mapping->host;
 	struct ubifs_info *c =3D inode->i_sb->s_fs_info;
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 36ba79fbd2ff..cd300897c90d 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -96,6 +96,7 @@ static void ubifs_add_auth_dirt(struct ubifs_info *c, i=
nt lnum)
  * be done, and other negative error codes in case of other failures.
  */
 static int reserve_space(struct ubifs_info *c, int jhead, int len)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err =3D 0, err1, retries =3D 0, avail, lnum, offs, squeeze;
 	struct ubifs_wbuf *wbuf =3D &c->jheads[jhead].wbuf;
@@ -520,6 +521,7 @@ static int make_reservation(struct ubifs_info *c, int=
 jhead, int len)
  * 'make_reservation()' invocation.
  */
 static inline void release_head(struct ubifs_info *c, int jhead)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(&c->jheads[jhead].wbuf.io_mutex);
 }
@@ -853,6 +855,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const stru=
ct inode *dir,
  */
 int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode=
,
 			 const union ubifs_key *key, const void *buf, int len)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ubifs_data_node *data;
 	int err, lnum, offs, compr_type, out_len, compr_len, auth_len;
diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
index 615878e884ba..464470a17b87 100644
--- a/fs/ubifs/misc.h
+++ b/fs/ubifs/misc.h
@@ -240,6 +240,7 @@ static inline int ubifs_tnc_lookup(struct ubifs_info =
*c,
  * 'ubifs_release_lprops()'.
  */
 static inline void ubifs_get_lprops(struct ubifs_info *c)
+	ACQUIRE(c->lp_mutex)
 {
 	mutex_lock(&c->lp_mutex);
 }
@@ -252,6 +253,7 @@ static inline void ubifs_get_lprops(struct ubifs_info=
 *c)
  * unlock lprops.
  */
 static inline void ubifs_release_lprops(struct ubifs_info *c)
+	RELEASE(c->lp_mutex)
 {
 	ubifs_assert(c, mutex_is_locked(&c->lp_mutex));
 	ubifs_assert(c, c->lst.empty_lebs >=3D 0 &&
diff --git a/fs/xfs/scrub/dirtree.c b/fs/xfs/scrub/dirtree.c
index 3a9cdf8738b6..f66b5f692152 100644
--- a/fs/xfs/scrub/dirtree.c
+++ b/fs/xfs/scrub/dirtree.c
@@ -515,6 +515,7 @@ STATIC int
 xchk_dirpath_walk_upwards(
 	struct xchk_dirtree	*dl,
 	struct xchk_dirpath	*path)
+	REQUIRES(dl->lock)
 {
 	struct xfs_scrub	*sc =3D dl->sc;
 	bool			is_metadir;
@@ -786,6 +787,7 @@ xchk_dirtree_load_path(
 int
 xchk_dirtree_find_paths_to_root(
 	struct xchk_dirtree	*dl)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xfs_scrub	*sc =3D dl->sc;
 	struct xchk_dirpath	*path;
diff --git a/fs/xfs/scrub/dirtree_repair.c b/fs/xfs/scrub/dirtree_repair.=
c
index 5c04e70ba951..007a4cada880 100644
--- a/fs/xfs/scrub/dirtree_repair.c
+++ b/fs/xfs/scrub/dirtree_repair.c
@@ -503,6 +503,7 @@ STATIC int
 xrep_dirtree_delete_path(
 	struct xchk_dirtree		*dl,
 	struct xchk_dirpath		*path)
+	REQUIRES(dl->lock)
 {
 	struct xchk_dirpath_step	step;
 	struct xfs_scrub		*sc =3D dl->sc;
@@ -720,6 +721,7 @@ xrep_dirtree_adopt(
 STATIC int
 xrep_dirtree_move_to_orphanage(
 	struct xchk_dirtree		*dl)
+	REQUIRES(dl->lock)
 {
 	struct xfs_scrub		*sc =3D dl->sc;
 	int				error;
@@ -757,6 +759,7 @@ STATIC int
 xrep_dirtree_fix_problems(
 	struct xchk_dirtree		*dl,
 	struct xchk_dirtree_outcomes	*oc)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xchk_dirpath		*path;
 	int				error;
diff --git a/fs/xfs/scrub/quota.c b/fs/xfs/scrub/quota.c
index 58d6d4ed2853..542742b2a7fb 100644
--- a/fs/xfs/scrub/quota.c
+++ b/fs/xfs/scrub/quota.c
@@ -140,6 +140,7 @@ STATIC int
 xchk_quota_item(
 	struct xchk_quota_info	*sqi,
 	struct xfs_dquot	*dq)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xfs_scrub	*sc =3D sqi->sc;
 	struct xfs_mount	*mp =3D sc->mp;
diff --git a/fs/xfs/scrub/quota_repair.c b/fs/xfs/scrub/quota_repair.c
index 8f4c8d41f308..3e501740af01 100644
--- a/fs/xfs/scrub/quota_repair.c
+++ b/fs/xfs/scrub/quota_repair.c
@@ -170,6 +170,8 @@ STATIC int
 xrep_quota_item(
 	struct xrep_quota_info	*rqi,
 	struct xfs_dquot	*dq)
+	REQUIRES(dq->q_qlock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xfs_scrub	*sc =3D rqi->sc;
 	struct xfs_mount	*mp =3D sc->mp;
@@ -504,6 +506,7 @@ STATIC int
 xrep_quota_problems(
 	struct xfs_scrub	*sc,
 	xfs_dqtype_t		dqtype)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xchk_dqiter	cursor =3D { };
 	struct xrep_quota_info	rqi =3D { .sc =3D sc };
diff --git a/fs/xfs/scrub/quotacheck_repair.c b/fs/xfs/scrub/quotacheck_r=
epair.c
index dd8554c755b5..ac73ad8f03c8 100644
--- a/fs/xfs/scrub/quotacheck_repair.c
+++ b/fs/xfs/scrub/quotacheck_repair.c
@@ -45,6 +45,8 @@ xqcheck_commit_dquot(
 	struct xqcheck		*xqc,
 	xfs_dqtype_t		dqtype,
 	struct xfs_dquot	*dq)
+	REQUIRES(dq->q_qlock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xqcheck_dquot	xcdq;
 	struct xfarray		*counts =3D xqcheck_counters_for(xqc, dqtype);
@@ -140,6 +142,7 @@ STATIC int
 xqcheck_commit_dqtype(
 	struct xqcheck		*xqc,
 	unsigned int		dqtype)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xchk_dqiter	cursor =3D { };
 	struct xqcheck_dquot	xcdq;
diff --git a/fs/xfs/scrub/rmap_repair.c b/fs/xfs/scrub/rmap_repair.c
index f5f73078ffe2..6aaaf15f40df 100644
--- a/fs/xfs/scrub/rmap_repair.c
+++ b/fs/xfs/scrub/rmap_repair.c
@@ -1606,6 +1606,7 @@ xrep_rmapbt_live_update(
 	struct notifier_block		*nb,
 	unsigned long			action,
 	void				*data)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xfs_rmap_update_params	*p =3D data;
 	struct xrep_rmap		*rr;
diff --git a/fs/xfs/scrub/rtrmap_repair.c b/fs/xfs/scrub/rtrmap_repair.c
index f2fdd7a9fc24..7f112516dc6e 100644
--- a/fs/xfs/scrub/rtrmap_repair.c
+++ b/fs/xfs/scrub/rtrmap_repair.c
@@ -862,6 +862,7 @@ xrep_rtrmapbt_live_update(
 	struct notifier_block		*nb,
 	unsigned long			action,
 	void				*data)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xfs_rmap_update_params	*p =3D data;
 	struct xrep_rtrmap		*rr;
diff --git a/fs/xfs/xfs_dquot.c b/fs/xfs/xfs_dquot.c
index edbc521870a1..bdec1c207161 100644
--- a/fs/xfs/xfs_dquot.c
+++ b/fs/xfs/xfs_dquot.c
@@ -804,6 +804,7 @@ xfs_qm_dqget_cache_lookup(
 	struct xfs_quotainfo	*qi,
 	struct radix_tree_root	*tree,
 	xfs_dqid_t		id)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xfs_dquot	*dqp;
=20
@@ -852,6 +853,7 @@ xfs_qm_dqget_cache_insert(
 	struct radix_tree_root	*tree,
 	xfs_dqid_t		id,
 	struct xfs_dquot	*dqp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	unsigned int		nofs_flags;
 	int			error;
@@ -1000,6 +1002,7 @@ xfs_qm_dqget_inode(
 	xfs_dqtype_t		type,
 	bool			can_alloc,
 	struct xfs_dquot	**O_dqpp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xfs_mount	*mp =3D ip->i_mount;
 	struct xfs_quotainfo	*qi =3D mp->m_quotainfo;
@@ -1118,6 +1121,7 @@ xfs_qm_dqget_next(
 void
 xfs_qm_dqput(
 	struct xfs_dquot	*dqp)
+	RELEASE(dqp->q_qlock)
 {
 	ASSERT(dqp->q_nrefs > 0);
 	ASSERT(XFS_DQ_IS_LOCKED(dqp));
@@ -1141,6 +1145,7 @@ xfs_qm_dqput(
 void
 xfs_qm_dqrele(
 	struct xfs_dquot	*dqp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (!dqp)
 		return;
@@ -1484,6 +1489,7 @@ void
 xfs_dqlock2(
 	struct xfs_dquot	*d1,
 	struct xfs_dquot	*d2)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (d1 && d2) {
 		ASSERT(d1 !=3D d2);
@@ -1519,6 +1525,7 @@ xfs_dqtrx_cmp(
 void
 xfs_dqlockn(
 	struct xfs_dqtrx	*q)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	unsigned int		i;
=20
diff --git a/fs/xfs/xfs_dquot.h b/fs/xfs/xfs_dquot.h
index 61217adf5ba5..0156dfc1a955 100644
--- a/fs/xfs/xfs_dquot.h
+++ b/fs/xfs/xfs_dquot.h
@@ -122,16 +122,19 @@ static inline void xfs_dqfunlock(struct xfs_dquot *=
dqp)
 }
=20
 static inline int xfs_dqlock_nowait(struct xfs_dquot *dqp)
+	TRY_ACQUIRE(0, dqp->q_qlock)
 {
 	return mutex_trylock(&dqp->q_qlock);
 }
=20
 static inline void xfs_dqlock(struct xfs_dquot *dqp)
+	ACQUIRE(dqp->q_qlock)
 {
 	mutex_lock(&dqp->q_qlock);
 }
=20
 static inline void xfs_dqunlock(struct xfs_dquot *dqp)
+	RELEASE(dqp->q_qlock)
 {
 	mutex_unlock(&dqp->q_qlock);
 }
@@ -235,8 +238,11 @@ int		xfs_qm_dqget_uncached(struct xfs_mount *mp,
 				struct xfs_dquot **dqpp);
 void		xfs_qm_dqput(struct xfs_dquot *dqp);
=20
-void		xfs_dqlock2(struct xfs_dquot *, struct xfs_dquot *);
-void		xfs_dqlockn(struct xfs_dqtrx *q);
+void		xfs_dqlock2(struct xfs_dquot *d1, struct xfs_dquot *d2)
+	ACQUIRE(d1->q_qlock)
+	ACQUIRE(d2->q_qlock);
+void		xfs_dqlockn(struct xfs_dqtrx *q)
+	ACQUIRE(q[0].qt_dquot->q_qlock);
=20
 void		xfs_dquot_set_prealloc_limits(struct xfs_dquot *);
=20
diff --git a/fs/xfs/xfs_dquot_item.c b/fs/xfs/xfs_dquot_item.c
index 271b195ebb93..9039825a0dda 100644
--- a/fs/xfs/xfs_dquot_item.c
+++ b/fs/xfs/xfs_dquot_item.c
@@ -122,6 +122,7 @@ xfs_qm_dquot_logitem_push(
 	struct list_head	*buffer_list)
 		__releases(&lip->li_ailp->ail_lock)
 		__acquires(&lip->li_ailp->ail_lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xfs_dq_logitem	*qlip =3D DQUOT_ITEM(lip);
 	struct xfs_dquot	*dqp =3D qlip->qli_dquot;
@@ -184,6 +185,7 @@ xfs_qm_dquot_logitem_push(
 STATIC void
 xfs_qm_dquot_logitem_release(
 	struct xfs_log_item	*lip)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xfs_dquot	*dqp =3D DQUOT_ITEM(lip)->qli_dquot;
=20
diff --git a/fs/xfs/xfs_qm.c b/fs/xfs/xfs_qm.c
index e1ba5af6250f..c3b6c1aa98f1 100644
--- a/fs/xfs/xfs_qm.c
+++ b/fs/xfs/xfs_qm.c
@@ -293,6 +293,7 @@ xfs_qm_dqattach_one(
 	xfs_dqtype_t		type,
 	bool			doalloc,
 	struct xfs_dquot	**IO_idqpp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xfs_dquot	*dqp;
 	int			error;
@@ -461,6 +462,7 @@ xfs_qm_dquot_isolate(
 	struct list_lru_one	*lru,
 	void			*arg)
 		__releases(&lru->lock) __acquires(&lru->lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xfs_dquot	*dqp =3D container_of(item,
 						struct xfs_dquot, q_lru);
@@ -1949,6 +1951,7 @@ xfs_qm_vop_dqalloc(
 	struct xfs_dquot	**O_udqpp,
 	struct xfs_dquot	**O_gdqpp,
 	struct xfs_dquot	**O_pdqpp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xfs_mount	*mp =3D ip->i_mount;
 	struct inode		*inode =3D VFS_I(ip);
diff --git a/fs/xfs/xfs_qm_syscalls.c b/fs/xfs/xfs_qm_syscalls.c
index 0c78f30fa4a3..a7402599b442 100644
--- a/fs/xfs/xfs_qm_syscalls.c
+++ b/fs/xfs/xfs_qm_syscalls.c
@@ -274,6 +274,7 @@ xfs_qm_scall_setqlim(
 	xfs_dqid_t		id,
 	xfs_dqtype_t		type,
 	struct qc_dqblk		*newlim)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xfs_quotainfo	*q =3D mp->m_quotainfo;
 	struct xfs_dquot	*dqp;
diff --git a/fs/xfs/xfs_trans_dquot.c b/fs/xfs/xfs_trans_dquot.c
index 765456bf3428..0a18b22ef303 100644
--- a/fs/xfs/xfs_trans_dquot.c
+++ b/fs/xfs/xfs_trans_dquot.c
@@ -389,6 +389,7 @@ STATIC void
 xfs_trans_dqlockedjoin(
 	struct xfs_trans	*tp,
 	struct xfs_dqtrx	*q)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	unsigned int		i;
 	ASSERT(q[0].qt_dquot !=3D NULL);
@@ -475,6 +476,7 @@ xfs_trans_apply_dquot_deltas_hook(
 void
 xfs_trans_apply_dquot_deltas(
 	struct xfs_trans	*tp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int			i, j;
 	struct xfs_dquot	*dqp;
@@ -662,6 +664,7 @@ void
 xfs_trans_unreserve_and_mod_dquots(
 	struct xfs_trans	*tp,
 	bool			already_locked)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int			i, j;
 	struct xfs_dquot	*dqp;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 248416ecd01c..0d011270e642 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -945,15 +945,19 @@ static inline unsigned int blk_boundary_sectors_lef=
t(sector_t offset,
  */
 static inline struct queue_limits
 queue_limits_start_update(struct request_queue *q)
+	ACQUIRE(q->limits_lock)
 {
 	mutex_lock(&q->limits_lock);
 	return q->limits;
 }
 int queue_limits_commit_update_frozen(struct request_queue *q,
-		struct queue_limits *lim);
+		struct queue_limits *lim)
+	RELEASE(q->limits_lock);
 int queue_limits_commit_update(struct request_queue *q,
-		struct queue_limits *lim);
-int queue_limits_set(struct request_queue *q, struct queue_limits *lim);
+		struct queue_limits *lim)
+	RELEASE(q->limits_lock);
+int queue_limits_set(struct request_queue *q, struct queue_limits *lim)
+	EXCLUDES(q->limits_lock);
 int blk_validate_limits(struct queue_limits *lim);
=20
 /**
@@ -965,6 +969,7 @@ int blk_validate_limits(struct queue_limits *lim);
  * starting update.
  */
 static inline void queue_limits_cancel_update(struct request_queue *q)
+	RELEASE(q->limits_lock)
 {
 	mutex_unlock(&q->limits_lock);
 }
diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
index f8ef47f8a634..470f96e8996a 100644
--- a/include/linux/cgroup.h
+++ b/include/linux/cgroup.h
@@ -364,11 +364,13 @@ static inline void cgroup_put(struct cgroup *cgrp)
 extern struct mutex cgroup_mutex;
=20
 static inline void cgroup_lock(void)
+	ACQUIRE(cgroup_mutex)
 {
 	mutex_lock(&cgroup_mutex);
 }
=20
 static inline void cgroup_unlock(void)
+	RELEASE(cgroup_mutex)
 {
 	mutex_unlock(&cgroup_mutex);
 }
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 5ba187e08cf7..07178e3d3722 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -622,11 +622,13 @@ extern int fb_get_options(const char *name, char **=
option);
 extern int fb_new_modelist(struct fb_info *info);
=20
 static inline void lock_fb_info(struct fb_info *info)
+	ACQUIRE(info->lock)
 {
 	mutex_lock(&info->lock);
 }
=20
 static inline void unlock_fb_info(struct fb_info *info)
+	RELEASE(info->lock)
 {
 	mutex_unlock(&info->lock);
 }
diff --git a/include/linux/fpga/fpga-bridge.h b/include/linux/fpga/fpga-b=
ridge.h
index 94c4edd047e5..38b43f61e438 100644
--- a/include/linux/fpga/fpga-bridge.h
+++ b/include/linux/fpga/fpga-bridge.h
@@ -67,7 +67,7 @@ struct fpga_bridge *of_fpga_bridge_get(struct device_no=
de *node,
 				       struct fpga_image_info *info);
 struct fpga_bridge *fpga_bridge_get(struct device *dev,
 				    struct fpga_image_info *info);
-void fpga_bridge_put(struct fpga_bridge *bridge);
+void fpga_bridge_put(struct fpga_bridge *bridge) RELEASE(bridge->mutex);
 int fpga_bridge_enable(struct fpga_bridge *bridge);
 int fpga_bridge_disable(struct fpga_bridge *bridge);
=20
diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.=
h
index 0d4fe068f3d8..7eb764d4ffed 100644
--- a/include/linux/fpga/fpga-mgr.h
+++ b/include/linux/fpga/fpga-mgr.h
@@ -223,8 +223,8 @@ void fpga_image_info_free(struct fpga_image_info *inf=
o);
=20
 int fpga_mgr_load(struct fpga_manager *mgr, struct fpga_image_info *info=
);
=20
-int fpga_mgr_lock(struct fpga_manager *mgr);
-void fpga_mgr_unlock(struct fpga_manager *mgr);
+int fpga_mgr_lock(struct fpga_manager *mgr) TRY_ACQUIRE(0, mgr->ref_mute=
x);
+void fpga_mgr_unlock(struct fpga_manager *mgr) RELEASE(mgr->ref_mutex);
=20
 struct fpga_manager *of_fpga_mgr_get(struct device_node *node);
=20
diff --git a/include/linux/fsnotify_backend.h b/include/linux/fsnotify_ba=
ckend.h
index 0d24a21a8e60..53faf37d2e31 100644
--- a/include/linux/fsnotify_backend.h
+++ b/include/linux/fsnotify_backend.h
@@ -274,12 +274,14 @@ struct fsnotify_group {
  * evictable marks of the same group that is allocating a new mark.
  */
 static inline void fsnotify_group_lock(struct fsnotify_group *group)
+	ACQUIRE(group->mark_mutex)
 {
 	mutex_lock(&group->mark_mutex);
 	group->owner_flags =3D memalloc_nofs_save();
 }
=20
 static inline void fsnotify_group_unlock(struct fsnotify_group *group)
+	RELEASE(group->mark_mutex)
 {
 	memalloc_nofs_restore(group->owner_flags);
 	mutex_unlock(&group->mark_mutex);
diff --git a/include/linux/gameport.h b/include/linux/gameport.h
index 86d62fdafd7a..13aa672d9ea7 100644
--- a/include/linux/gameport.h
+++ b/include/linux/gameport.h
@@ -135,6 +135,7 @@ static inline int gameport_pin_driver(struct gameport=
 *gameport)
 }
=20
 static inline void gameport_unpin_driver(struct gameport *gameport)
+	RELEASE(gameport->drv_mutex)
 {
 	mutex_unlock(&gameport->drv_mutex);
 }
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplu=
g.h
index eaac5ae8c05c..22d32f1e69d6 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -178,11 +178,13 @@ void mem_hotplug_done(void);
=20
 /* See kswapd_is_running() */
 static inline void pgdat_kswapd_lock(pg_data_t *pgdat)
+	ACQUIRE(pgdat->kswapd_lock)
 {
 	mutex_lock(&pgdat->kswapd_lock);
 }
=20
 static inline void pgdat_kswapd_unlock(pg_data_t *pgdat)
+	RELEASE(pgdat->kswapd_lock)
 {
 	mutex_unlock(&pgdat->kswapd_lock);
 }
diff --git a/include/linux/mfd/si476x-core.h b/include/linux/mfd/si476x-c=
ore.h
index dd95c37ca134..f0ba5b365ce0 100644
--- a/include/linux/mfd/si476x-core.h
+++ b/include/linux/mfd/si476x-core.h
@@ -168,6 +168,7 @@ static inline struct si476x_core *i2c_mfd_cell_to_cor=
e(struct device *dev)
  * to it.
  */
 static inline void si476x_core_lock(struct si476x_core *core)
+	ACQUIRE(core->cmd_lock)
 {
 	mutex_lock(&core->cmd_lock);
 }
@@ -177,6 +178,7 @@ static inline void si476x_core_lock(struct si476x_cor=
e *core)
  * exclusive access to it.
  */
 static inline void si476x_core_unlock(struct si476x_core *core)
+	RELEASE(core->cmd_lock)
 {
 	mutex_unlock(&core->cmd_lock);
 }
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 2a59034a5fa2..ae9278326d75 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -2696,11 +2696,13 @@ void netif_queue_set_napi(struct net_device *dev,=
 unsigned int queue_index,
 			  struct napi_struct *napi);
=20
 static inline void netdev_lock(struct net_device *dev)
+	ACQUIRE(dev->lock)
 {
 	mutex_lock(&dev->lock);
 }
=20
 static inline void netdev_unlock(struct net_device *dev)
+	RELEASE(dev->lock)
 {
 	mutex_unlock(&dev->lock);
 }
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 19f076a71f94..10ee6af78230 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1964,11 +1964,13 @@ static inline const char *phydev_name(const struc=
t phy_device *phydev)
 }
=20
 static inline void phy_lock_mdio_bus(struct phy_device *phydev)
+	ACQUIRE(phydev->mdio.bus->mdio_lock)
 {
 	mutex_lock(&phydev->mdio.bus->mdio_lock);
 }
=20
 static inline void phy_unlock_mdio_bus(struct phy_device *phydev)
+	RELEASE(phydev->mdio.bus->mdio_lock)
 {
 	mutex_unlock(&phydev->mdio.bus->mdio_lock);
 }
diff --git a/include/linux/usb.h b/include/linux/usb.h
index cfa8005e24f9..9717b546f3a4 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -772,7 +772,8 @@ extern struct usb_device *usb_hub_find_child(struct u=
sb_device *hdev,
 #define usb_lock_device_interruptible(udev)	device_lock_interruptible(&(=
udev)->dev)
 #define usb_trylock_device(udev)		device_trylock(&(udev)->dev)
 extern int usb_lock_device_for_reset(struct usb_device *udev,
-				     const struct usb_interface *iface);
+				     const struct usb_interface *iface)
+	TRY_ACQUIRE(0, udev->dev.mutex);
=20
 /* USB port reset for device reinitialization */
 extern int usb_reset_device(struct usb_device *dev);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..6bd0f81f8264 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -568,6 +568,7 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler =
*hdl);
  * @ctrl:	The control to lock.
  */
 static inline void v4l2_ctrl_lock(struct v4l2_ctrl *ctrl)
+	ACQUIRE(ctrl->handler->lock)
 {
 	mutex_lock(ctrl->handler->lock);
 }
@@ -578,6 +579,7 @@ static inline void v4l2_ctrl_lock(struct v4l2_ctrl *c=
trl)
  * @ctrl:	The control to unlock.
  */
 static inline void v4l2_ctrl_unlock(struct v4l2_ctrl *ctrl)
+	RELEASE(ctrl->handler->lock)
 {
 	mutex_unlock(ctrl->handler->lock);
 }
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 2f2200875b03..dd9804db27fb 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1759,6 +1759,7 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev =
*sd, int enable);
  * The state must be unlocked with v4l2_subdev_unlock_state() after use.
  */
 static inline void v4l2_subdev_lock_state(struct v4l2_subdev_state *stat=
e)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_lock(state->lock);
 }
@@ -1770,6 +1771,7 @@ static inline void v4l2_subdev_lock_state(struct v4=
l2_subdev_state *state)
  * Unlocks the given subdev state.
  */
 static inline void v4l2_subdev_unlock_state(struct v4l2_subdev_state *st=
ate)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(state->lock);
 }
@@ -1790,6 +1792,7 @@ static inline void v4l2_subdev_unlock_state(struct =
v4l2_subdev_state *state)
  */
 static inline void v4l2_subdev_lock_states(struct v4l2_subdev_state *sta=
te1,
 					   struct v4l2_subdev_state *state2)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_lock(state1->lock);
 	if (state1->lock !=3D state2->lock)
@@ -1808,6 +1811,7 @@ static inline void v4l2_subdev_lock_states(struct v=
4l2_subdev_state *state1,
  */
 static inline void v4l2_subdev_unlock_states(struct v4l2_subdev_state *s=
tate1,
 					     struct v4l2_subdev_state *state2)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(state1->lock);
 	if (state1->lock !=3D state2->lock)
@@ -1867,6 +1871,7 @@ v4l2_subdev_get_locked_active_state(struct v4l2_sub=
dev *sd)
  */
 static inline struct v4l2_subdev_state *
 v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (sd->active_state)
 		v4l2_subdev_lock_state(sd->active_state);
diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.=
h
index d9c767cf773d..60f9feb2bea6 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -823,11 +823,13 @@ struct l2cap_chan *l2cap_chan_hold_unless_zero(stru=
ct l2cap_chan *c);
 void l2cap_chan_put(struct l2cap_chan *c);
=20
 static inline void l2cap_chan_lock(struct l2cap_chan *chan)
+	ACQUIRE(chan->lock)
 {
 	mutex_lock_nested(&chan->lock, atomic_read(&chan->nesting));
 }
=20
 static inline void l2cap_chan_unlock(struct l2cap_chan *chan)
+	RELEASE(chan->lock)
 {
 	mutex_unlock(&chan->lock);
 }
diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 363d7dd2255a..290133e521d9 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -6042,6 +6042,7 @@ struct cfg80211_cqm_config;
  */
 static inline void wiphy_lock(struct wiphy *wiphy)
 	__acquires(&wiphy->mtx)
+	ACQUIRE(wiphy->mtx)
 {
 	mutex_lock(&wiphy->mtx);
 	__acquire(&wiphy->mtx);
@@ -6053,6 +6054,7 @@ static inline void wiphy_lock(struct wiphy *wiphy)
  */
 static inline void wiphy_unlock(struct wiphy *wiphy)
 	__releases(&wiphy->mtx)
+	RELEASE(wiphy->mtx)
 {
 	__release(&wiphy->mtx);
 	mutex_unlock(&wiphy->mtx);
diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 38db50b280eb..5b5095096c6d 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1842,8 +1842,16 @@ unsigned int snd_emu10k1_ptr20_read(struct snd_emu=
10k1 * emu, unsigned int reg,
 void snd_emu10k1_ptr20_write(struct snd_emu10k1 *emu, unsigned int reg, =
unsigned int chn, unsigned int data);
 int snd_emu10k1_spi_write(struct snd_emu10k1 * emu, unsigned int data);
 int snd_emu10k1_i2c_write(struct snd_emu10k1 *emu, u32 reg, u32 value);
-static inline void snd_emu1010_fpga_lock(struct snd_emu10k1 *emu) { mute=
x_lock(&emu->emu1010.lock); };
-static inline void snd_emu1010_fpga_unlock(struct snd_emu10k1 *emu) { mu=
tex_unlock(&emu->emu1010.lock); };
+static inline void snd_emu1010_fpga_lock(struct snd_emu10k1 *emu)
+	ACQUIRE(emu->emu1010.lock)
+{
+	mutex_lock(&emu->emu1010.lock);
+}
+static inline void snd_emu1010_fpga_unlock(struct snd_emu10k1 *emu)
+	RELEASE(emu->emu1010.lock)
+{
+	mutex_unlock(&emu->emu1010.lock);
+}
 void snd_emu1010_fpga_write_lock(struct snd_emu10k1 *emu, u32 reg, u32 v=
alue);
 void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value)=
;
 void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value)=
;
diff --git a/include/sound/i2c.h b/include/sound/i2c.h
index 6f0162ae9d68..855e3d8d0906 100644
--- a/include/sound/i2c.h
+++ b/include/sound/i2c.h
@@ -66,6 +66,7 @@ int snd_i2c_device_create(struct snd_i2c_bus *bus, cons=
t char *name,
 int snd_i2c_device_free(struct snd_i2c_device *device);
=20
 static inline void snd_i2c_lock(struct snd_i2c_bus *bus)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (bus->master)
 		mutex_lock(&bus->master->lock_mutex);
@@ -74,6 +75,7 @@ static inline void snd_i2c_lock(struct snd_i2c_bus *bus=
)
 }
=20
 static inline void snd_i2c_unlock(struct snd_i2c_bus *bus)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (bus->master)
 		mutex_unlock(&bus->master->lock_mutex);
diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index ecc02e955279..12b28e179da2 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -14,16 +14,19 @@ enum snd_soc_card_subclass {
 };
=20
 static inline void snd_soc_card_mutex_lock_root(struct snd_soc_card *car=
d)
+	ACQUIRE(card->mutex)
 {
 	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_ROOT);
 }
=20
 static inline void snd_soc_card_mutex_lock(struct snd_soc_card *card)
+	ACQUIRE(card->mutex)
 {
 	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
 }
=20
 static inline void snd_soc_card_mutex_unlock(struct snd_soc_card *card)
+	RELEASE(card->mutex)
 {
 	mutex_unlock(&card->mutex);
 }
diff --git a/include/sound/soc.h b/include/sound/soc.h
index fcdb5adfcd5e..6739fddaf407 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1503,41 +1503,49 @@ enum snd_soc_dapm_subclass {
 };
=20
 static inline void _snd_soc_dapm_mutex_lock_root_c(struct snd_soc_card *=
card)
+	ACQUIRE(card->dapm_mutex)
 {
 	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_ROOT);
 }
=20
 static inline void _snd_soc_dapm_mutex_lock_c(struct snd_soc_card *card)
+	ACQUIRE(card->dapm_mutex)
 {
 	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
 }
=20
 static inline void _snd_soc_dapm_mutex_unlock_c(struct snd_soc_card *car=
d)
+	RELEASE(card->dapm_mutex)
 {
 	mutex_unlock(&card->dapm_mutex);
 }
=20
 static inline void _snd_soc_dapm_mutex_assert_held_c(struct snd_soc_card=
 *card)
+	REQUIRES(card->dapm_mutex)
 {
 	lockdep_assert_held(&card->dapm_mutex);
 }
=20
 static inline void _snd_soc_dapm_mutex_lock_root_d(struct snd_soc_dapm_c=
ontext *dapm)
+	ACQUIRE(dapm->card->dapm_mutex)
 {
 	_snd_soc_dapm_mutex_lock_root_c(dapm->card);
 }
=20
 static inline void _snd_soc_dapm_mutex_lock_d(struct snd_soc_dapm_contex=
t *dapm)
+	ACQUIRE(dapm->card->dapm_mutex)
 {
 	_snd_soc_dapm_mutex_lock_c(dapm->card);
 }
=20
 static inline void _snd_soc_dapm_mutex_unlock_d(struct snd_soc_dapm_cont=
ext *dapm)
+	RELEASE(dapm->card->dapm_mutex)
 {
 	_snd_soc_dapm_mutex_unlock_c(dapm->card);
 }
=20
 static inline void _snd_soc_dapm_mutex_assert_held_d(struct snd_soc_dapm=
_context *dapm)
+	REQUIRES(dapm->card->dapm_mutex)
 {
 	_snd_soc_dapm_mutex_assert_held_c(dapm->card);
 }
@@ -1559,31 +1567,37 @@ static inline void _snd_soc_dapm_mutex_assert_hel=
d_d(struct snd_soc_dapm_context
  *	PCM helper functions
  */
 static inline void _snd_soc_dpcm_mutex_lock_c(struct snd_soc_card *card)
+	ACQUIRE(card->pcm_mutex)
 {
 	mutex_lock_nested(&card->pcm_mutex, card->pcm_subclass);
 }
=20
 static inline void _snd_soc_dpcm_mutex_unlock_c(struct snd_soc_card *car=
d)
+	RELEASE(card->pcm_mutex)
 {
 	mutex_unlock(&card->pcm_mutex);
 }
=20
 static inline void _snd_soc_dpcm_mutex_assert_held_c(struct snd_soc_card=
 *card)
+	REQUIRES(card->pcm_mutex)
 {
 	lockdep_assert_held(&card->pcm_mutex);
 }
=20
 static inline void _snd_soc_dpcm_mutex_lock_r(struct snd_soc_pcm_runtime=
 *rtd)
+	ACQUIRE(rtd->card->pcm_mutex)
 {
 	_snd_soc_dpcm_mutex_lock_c(rtd->card);
 }
=20
 static inline void _snd_soc_dpcm_mutex_unlock_r(struct snd_soc_pcm_runti=
me *rtd)
+	RELEASE(rtd->card->pcm_mutex)
 {
 	_snd_soc_dpcm_mutex_unlock_c(rtd->card);
 }
=20
 static inline void _snd_soc_dpcm_mutex_assert_held_r(struct snd_soc_pcm_=
runtime *rtd)
+	REQUIRES(rtd->card->pcm_mutex)
 {
 	_snd_soc_dpcm_mutex_assert_held_c(rtd->card);
 }
diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 484193567839..2f8390315958 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -255,6 +255,7 @@ static int __io_sync_cancel(struct io_uring_task *tct=
x,
=20
 int io_sync_cancel(struct io_ring_ctx *ctx, void __user *arg)
 	__must_hold(&ctx->uring_lock)
+	REQUIRES(ctx->uring_lock)
 {
 	struct io_cancel_data cd =3D {
 		.ctx	=3D ctx,
diff --git a/io_uring/fdinfo.c b/io_uring/fdinfo.c
index f60d0a9d505e..01c881634c43 100644
--- a/io_uring/fdinfo.c
+++ b/io_uring/fdinfo.c
@@ -91,6 +91,7 @@ static inline void napi_show_fdinfo(struct io_ring_ctx =
*ctx,
  * anything else to get an extra reference.
  */
 __cold void io_uring_show_fdinfo(struct seq_file *m, struct file *file)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct io_ring_ctx *ctx =3D file->private_data;
 	struct io_overflow_cqe *ocqe;
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index ceacf6230e34..0bf2363de74b 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -616,6 +616,7 @@ static void io_cq_unlock_post(struct io_ring_ctx *ctx=
)
 }
=20
 static void __io_cqring_overflow_flush(struct io_ring_ctx *ctx, bool dyi=
ng)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	size_t cqe_size =3D sizeof(struct io_uring_cqe);
=20
@@ -1022,6 +1023,7 @@ static inline struct io_kiocb *io_req_find_next(str=
uct io_kiocb *req)
 }
=20
 static void ctx_flush_and_put(struct io_ring_ctx *ctx, struct io_tw_stat=
e *ts)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (!ctx)
 		return;
@@ -1041,6 +1043,7 @@ static void ctx_flush_and_put(struct io_ring_ctx *c=
tx, struct io_tw_state *ts)
 struct llist_node *io_handle_tw_list(struct llist_node *node,
 				     unsigned int *count,
 				     unsigned int max_entries)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct io_ring_ctx *ctx =3D NULL;
 	struct io_tw_state ts =3D { };
@@ -1509,6 +1512,7 @@ static __cold void io_iopoll_try_reap_events(struct=
 io_ring_ctx *ctx)
 }
=20
 static int io_iopoll_check(struct io_ring_ctx *ctx, long min)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	unsigned int nr_events =3D 0;
 	unsigned long check_cq;
@@ -1594,6 +1598,7 @@ void io_req_task_complete(struct io_kiocb *req, str=
uct io_tw_state *ts)
  * accessing the kiocb cookie.
  */
 static void io_iopoll_req_issued(struct io_kiocb *req, unsigned int issu=
e_flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct io_ring_ctx *ctx =3D req->ctx;
 	const bool needs_lock =3D issue_flags & IO_URING_F_UNLOCKED;
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index ab619e63ef39..40bd341907d3 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -254,6 +254,7 @@ static inline void io_put_file(struct io_kiocb *req)
=20
 static inline void io_ring_submit_unlock(struct io_ring_ctx *ctx,
 					 unsigned issue_flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	lockdep_assert_held(&ctx->uring_lock);
 	if (unlikely(issue_flags & IO_URING_F_UNLOCKED))
@@ -262,6 +263,7 @@ static inline void io_ring_submit_unlock(struct io_ri=
ng_ctx *ctx,
=20
 static inline void io_ring_submit_lock(struct io_ring_ctx *ctx,
 				       unsigned issue_flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	/*
 	 * "Normal" inline submissions always hold the uring_lock, since we
diff --git a/io_uring/msg_ring.c b/io_uring/msg_ring.c
index 7e6f68e911f1..2f7575fd39bf 100644
--- a/io_uring/msg_ring.c
+++ b/io_uring/msg_ring.c
@@ -34,12 +34,14 @@ struct io_msg {
 };
=20
 static void io_double_unlock_ctx(struct io_ring_ctx *octx)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(&octx->uring_lock);
 }
=20
 static int io_double_lock_ctx(struct io_ring_ctx *octx,
 			      unsigned int issue_flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	/*
 	 * To ensure proper ordering between the two ctxs, we can only
@@ -135,6 +137,7 @@ static int io_msg_data_remote(struct io_ring_ctx *tar=
get_ctx,
=20
 static int __io_msg_ring_data(struct io_ring_ctx *target_ctx,
 			      struct io_msg *msg, unsigned int issue_flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	u32 flags =3D 0;
 	int ret;
diff --git a/io_uring/register.c b/io_uring/register.c
index 9a4d2fbce4ae..6f1f0786d370 100644
--- a/io_uring/register.c
+++ b/io_uring/register.c
@@ -202,6 +202,7 @@ static int io_register_enable_rings(struct io_ring_ct=
x *ctx)
=20
 static __cold int __io_register_iowq_aff(struct io_ring_ctx *ctx,
 					 cpumask_var_t new_mask)
+	REQUIRES(ctx->uring_lock)
 {
 	int ret;
=20
@@ -218,6 +219,7 @@ static __cold int __io_register_iowq_aff(struct io_ri=
ng_ctx *ctx,
=20
 static __cold int io_register_iowq_aff(struct io_ring_ctx *ctx,
 				       void __user *arg, unsigned len)
+	REQUIRES(ctx->uring_lock)
 {
 	cpumask_var_t new_mask;
 	int ret;
@@ -249,6 +251,7 @@ static __cold int io_register_iowq_aff(struct io_ring=
_ctx *ctx,
 }
=20
 static __cold int io_unregister_iowq_aff(struct io_ring_ctx *ctx)
+	REQUIRES(ctx->uring_lock)
 {
 	return __io_register_iowq_aff(ctx, NULL);
 }
@@ -256,6 +259,7 @@ static __cold int io_unregister_iowq_aff(struct io_ri=
ng_ctx *ctx)
 static __cold int io_register_iowq_max_workers(struct io_ring_ctx *ctx,
 					       void __user *arg)
 	__must_hold(&ctx->uring_lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct io_tctx_node *node;
 	struct io_uring_task *tctx =3D NULL;
@@ -395,6 +399,7 @@ static void io_register_free_rings(struct io_ring_ctx=
 *ctx,
 			 IORING_SETUP_CQE32 | IORING_SETUP_NO_MMAP)
=20
 static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user=
 *arg)
+	REQUIRES(ctx->uring_lock)
 {
 	struct io_uring_region_desc rd;
 	struct io_ring_ctx_rings o =3D { }, n =3D { }, *to_free =3D NULL;
@@ -629,6 +634,7 @@ static int __io_uring_register(struct io_ring_ctx *ct=
x, unsigned opcode,
 			       void __user *arg, unsigned nr_args)
 	__releases(ctx->uring_lock)
 	__acquires(ctx->uring_lock)
+	REQUIRES(ctx->uring_lock)
 {
 	int ret;
=20
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index af39b69eb4fd..c7d2b2301741 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -921,6 +921,7 @@ int io_import_fixed(int ddir, struct iov_iter *iter,
=20
 /* Lock two rings at once. The rings must be different! */
 static void lock_two_rings(struct io_ring_ctx *ctx1, struct io_ring_ctx =
*ctx2)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (ctx1 > ctx2)
 		swap(ctx1, ctx2);
@@ -931,6 +932,7 @@ static void lock_two_rings(struct io_ring_ctx *ctx1, =
struct io_ring_ctx *ctx2)
 /* Both rings are locked by the caller. */
 static int io_clone_buffers(struct io_ring_ctx *ctx, struct io_ring_ctx =
*src_ctx,
 			    struct io_uring_clone_buffers *arg)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct io_rsrc_data data;
 	int i, ret, off, nr;
@@ -1045,6 +1047,7 @@ static int io_clone_buffers(struct io_ring_ctx *ctx=
, struct io_ring_ctx *src_ctx
  * Since the memory is already accounted once, don't account it again.
  */
 int io_register_clone_buffers(struct io_ring_ctx *ctx, void __user *arg)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct io_uring_clone_buffers buf;
 	struct io_ring_ctx *src_ctx;
diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
index d037cc68e9d3..80e8bcb355b9 100644
--- a/io_uring/sqpoll.c
+++ b/io_uring/sqpoll.c
@@ -29,6 +29,7 @@ enum {
=20
 void io_sq_thread_unpark(struct io_sq_data *sqd)
 	__releases(&sqd->lock)
+	RELEASE(sqd->lock)
 {
 	WARN_ON_ONCE(sqd->thread =3D=3D current);
=20
@@ -45,6 +46,7 @@ void io_sq_thread_unpark(struct io_sq_data *sqd)
=20
 void io_sq_thread_park(struct io_sq_data *sqd)
 	__acquires(&sqd->lock)
+	ACQUIRE(sqd->lock)
 {
 	WARN_ON_ONCE(data_race(sqd->thread) =3D=3D current);
=20
@@ -199,6 +201,7 @@ static int __io_sq_thread(struct io_ring_ctx *ctx, bo=
ol cap_entries)
 }
=20
 static bool io_sqd_handle_event(struct io_sq_data *sqd)
+	REQUIRES(sqd->lock)
 {
 	bool did_sig =3D false;
 	struct ksignal ksig;
diff --git a/io_uring/tctx.c b/io_uring/tctx.c
index adc6e42c14df..4bb6bd7bdb9f 100644
--- a/io_uring/tctx.c
+++ b/io_uring/tctx.c
@@ -264,6 +264,7 @@ static int io_ring_add_registered_fd(struct io_uring_=
task *tctx, int fd,
  */
 int io_ringfd_register(struct io_ring_ctx *ctx, void __user *__arg,
 		       unsigned nr_args)
+	REQUIRES(ctx->uring_lock)
 {
 	struct io_uring_rsrc_update __user *arg =3D __arg;
 	struct io_uring_rsrc_update reg;
diff --git a/kernel/acct.c b/kernel/acct.c
index 31222e8cd534..7cadc7705afa 100644
--- a/kernel/acct.c
+++ b/kernel/acct.c
@@ -160,6 +160,7 @@ static inline struct bsd_acct_struct *to_acct(struct =
fs_pin *p)
 }
=20
 static struct bsd_acct_struct *acct_get(struct pid_namespace *ns)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct bsd_acct_struct *res;
 again:
@@ -186,6 +187,7 @@ static struct bsd_acct_struct *acct_get(struct pid_na=
mespace *ns)
 }
=20
 static void acct_pin_kill(struct fs_pin *pin)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct bsd_acct_struct *acct =3D to_acct(pin);
 	mutex_lock(&acct->lock);
@@ -590,6 +592,7 @@ void acct_collect(long exitcode, int group_dead)
 }
=20
 static void slow_acct_process(struct pid_namespace *ns)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	for ( ; ns; ns =3D ns->parent) {
 		struct bsd_acct_struct *acct =3D acct_get(ns);
diff --git a/kernel/audit.c b/kernel/audit.c
index 5f5bf85bcc90..d89496adba89 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -230,6 +230,7 @@ int auditd_test_task(struct task_struct *task)
  * audit_ctl_lock - Take the audit control lock
  */
 void audit_ctl_lock(void)
+	ACQUIRE(audit_cmd_mutex.lock)
 {
 	mutex_lock(&audit_cmd_mutex.lock);
 	audit_cmd_mutex.owner =3D current;
@@ -239,6 +240,7 @@ void audit_ctl_lock(void)
  * audit_ctl_unlock - Drop the audit control lock
  */
 void audit_ctl_unlock(void)
+	RELEASE(audit_cmd_mutex.lock)
 {
 	audit_cmd_mutex.owner =3D NULL;
 	mutex_unlock(&audit_cmd_mutex.lock);
diff --git a/kernel/audit_tree.c b/kernel/audit_tree.c
index f2f38903b2fe..83ef4a849dd0 100644
--- a/kernel/audit_tree.c
+++ b/kernel/audit_tree.c
@@ -395,6 +395,7 @@ static void untag_chunk(struct audit_chunk *chunk, st=
ruct fsnotify_mark *mark)
=20
 /* Call with group->mark_mutex held, releases it */
 static int create_chunk(struct inode *inode, struct audit_tree *tree)
+	RELEASE(audit_tree_group->mark_mutex)
 {
 	struct fsnotify_mark *mark;
 	struct audit_chunk *chunk =3D alloc_chunk(1);
@@ -798,6 +799,7 @@ static int audit_launch_prune(void)
=20
 /* called with audit_filter_mutex */
 int audit_add_tree_rule(struct audit_krule *rule)
+	REQUIRES(audit_filter_mutex)
 {
 	struct audit_tree *seed =3D rule->tree, *tree;
 	struct path path;
diff --git a/kernel/audit_watch.c b/kernel/audit_watch.c
index 7f358740e958..1a55d9160bc4 100644
--- a/kernel/audit_watch.c
+++ b/kernel/audit_watch.c
@@ -398,6 +398,7 @@ static void audit_add_to_parent(struct audit_krule *k=
rule,
 /* Find a matching watch entry, or add this one.
  * Caller must hold audit_filter_mutex. */
 int audit_add_watch(struct audit_krule *krule, struct list_head **list)
+	REQUIRES(audit_filter_mutex)
 {
 	struct audit_watch *watch =3D krule->watch;
 	struct audit_parent *parent;
diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 9de6acddd479..3f96cc1efd8c 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -9095,6 +9095,7 @@ bpf_core_find_cands(struct bpf_core_ctx *ctx, u32 l=
ocal_type_id)
=20
 int bpf_core_apply(struct bpf_core_ctx *ctx, const struct bpf_core_relo =
*relo,
 		   int relo_idx, void *insn)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	bool need_cands =3D relo->kind !=3D BPF_CORE_TYPE_ID_LOCAL;
 	struct bpf_core_cand_list cands =3D {};
diff --git a/kernel/bpf/cgroup_iter.c b/kernel/bpf/cgroup_iter.c
index f04a468cf6a7..96d9fc0ceed6 100644
--- a/kernel/bpf/cgroup_iter.c
+++ b/kernel/bpf/cgroup_iter.c
@@ -55,6 +55,7 @@ struct cgroup_iter_priv {
 };
=20
 static void *cgroup_iter_seq_start(struct seq_file *seq, loff_t *pos)
+	ACQUIRE(cgroup_mutex)
 {
 	struct cgroup_iter_priv *p =3D seq->private;
=20
@@ -86,6 +87,7 @@ static int __cgroup_iter_seq_show(struct seq_file *seq,
 				  struct cgroup_subsys_state *css, int in_stop);
=20
 static void cgroup_iter_seq_stop(struct seq_file *seq, void *v)
+	RELEASE(cgroup_mutex)
 {
 	struct cgroup_iter_priv *p =3D seq->private;
=20
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 9971c03adfd5..08e611cb10df 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -23022,6 +23022,7 @@ static int process_fd_array(struct bpf_verifier_e=
nv *env, union bpf_attr *attr,
 }
=20
 int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uat=
tr, __u32 uattr_size)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	u64 start_time =3D ktime_get_ns();
 	struct bpf_verifier_env *env;
diff --git a/kernel/cgroup/cgroup-v1.c b/kernel/cgroup/cgroup-v1.c
index e28d5f0d20ed..7d92de469667 100644
--- a/kernel/cgroup/cgroup-v1.c
+++ b/kernel/cgroup/cgroup-v1.c
@@ -391,6 +391,7 @@ static int pidlist_array_load(struct cgroup *cgrp, en=
um cgroup_filetype type,
  */
=20
 static void *cgroup_pidlist_start(struct seq_file *s, loff_t *pos)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	/*
 	 * Initially we receive a position value that corresponds to
@@ -452,6 +453,7 @@ static void *cgroup_pidlist_start(struct seq_file *s,=
 loff_t *pos)
 }
=20
 static void cgroup_pidlist_stop(struct seq_file *s, void *v)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct kernfs_open_file *of =3D s->private;
 	struct cgroup_file_ctx *ctx =3D of->priv;
@@ -1078,6 +1080,7 @@ static int check_cgroupfs_options(struct fs_context=
 *fc)
 }
=20
 int cgroup1_reconfigure(struct fs_context *fc)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cgroup_fs_context *ctx =3D cgroup_fc2context(fc);
 	struct kernfs_root *kf_root =3D kernfs_root_from_sb(fc->root->d_sb);
@@ -1242,6 +1245,7 @@ static int cgroup1_root_to_use(struct fs_context *f=
c)
 }
=20
 int cgroup1_get_tree(struct fs_context *fc)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cgroup_fs_context *ctx =3D cgroup_fc2context(fc);
 	int ret;
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index d9061bd55436..33f39b2ab34e 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -1319,6 +1319,7 @@ void cgroup_free_root(struct cgroup_root *root)
 }
=20
 static void cgroup_destroy_root(struct cgroup_root *root)
+	RELEASE(cgroup_mutex)
 {
 	struct cgroup *cgrp =3D &root->cgrp;
 	struct cgrp_cset_link *link, *tmp_link;
@@ -1606,6 +1607,7 @@ static u16 cgroup_calc_subtree_ss_mask(u16 subtree_=
control, u16 this_ss_mask)
  * cgroup, it should pin it before invoking this function.
  */
 void cgroup_kn_unlock(struct kernfs_node *kn)
+	RELEASE(cgroup_mutex)
 {
 	struct cgroup *cgrp;
=20
@@ -1638,6 +1640,7 @@ void cgroup_kn_unlock(struct kernfs_node *kn)
  * including self-removal.
  */
 struct cgroup *cgroup_kn_lock_live(struct kernfs_node *kn, bool drain_of=
fline)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cgroup *cgrp;
=20
@@ -3104,6 +3107,7 @@ static int cgroup_update_dfl_csses(struct cgroup *c=
grp)
  */
 void cgroup_lock_and_drain_offline(struct cgroup *cgrp)
 	__acquires(&cgroup_mutex)
+	ACQUIRE(cgroup_mutex)
 {
 	struct cgroup *dsct;
 	struct cgroup_subsys_state *d_css;
@@ -3391,6 +3395,7 @@ static int cgroup_vet_subtree_control_enable(struct=
 cgroup *cgrp, u16 enable)
 static ssize_t cgroup_subtree_control_write(struct kernfs_open_file *of,
 					    char *buf, size_t nbytes,
 					    loff_t off)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	u16 enable =3D 0, disable =3D 0;
 	struct cgroup *cgrp, *child;
@@ -3557,6 +3562,7 @@ static int cgroup_type_show(struct seq_file *seq, v=
oid *v)
=20
 static ssize_t cgroup_type_write(struct kernfs_open_file *of, char *buf,
 				 size_t nbytes, loff_t off)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cgroup *cgrp;
 	int ret;
@@ -3592,6 +3598,7 @@ static int cgroup_max_descendants_show(struct seq_f=
ile *seq, void *v)
=20
 static ssize_t cgroup_max_descendants_write(struct kernfs_open_file *of,
 					   char *buf, size_t nbytes, loff_t off)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cgroup *cgrp;
 	int descendants;
@@ -3635,6 +3642,7 @@ static int cgroup_max_depth_show(struct seq_file *s=
eq, void *v)
=20
 static ssize_t cgroup_max_depth_write(struct kernfs_open_file *of,
 				      char *buf, size_t nbytes, loff_t off)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cgroup *cgrp;
 	ssize_t ret;
@@ -3822,6 +3830,7 @@ static int cgroup_cpu_pressure_show(struct seq_file=
 *seq, void *v)
=20
 static ssize_t pressure_write(struct kernfs_open_file *of, char *buf,
 			      size_t nbytes, enum psi_res res)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cgroup_file_ctx *ctx =3D of->priv;
 	struct psi_trigger *new;
@@ -3905,6 +3914,7 @@ static int cgroup_pressure_show(struct seq_file *se=
q, void *v)
 static ssize_t cgroup_pressure_write(struct kernfs_open_file *of,
 				     char *buf, size_t nbytes,
 				     loff_t off)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	ssize_t ret;
 	int enable;
@@ -3982,6 +3992,7 @@ static int cgroup_freeze_show(struct seq_file *seq,=
 void *v)
=20
 static ssize_t cgroup_freeze_write(struct kernfs_open_file *of,
 				   char *buf, size_t nbytes, loff_t off)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cgroup *cgrp;
 	ssize_t ret;
@@ -4048,6 +4059,7 @@ static void cgroup_kill(struct cgroup *cgrp)
=20
 static ssize_t cgroup_kill_write(struct kernfs_open_file *of, char *buf,
 				 size_t nbytes, loff_t off)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	ssize_t ret =3D 0;
 	int kill;
@@ -5189,6 +5201,7 @@ static int cgroup_attach_permissions(struct cgroup =
*src_cgrp,
=20
 static ssize_t __cgroup_procs_write(struct kernfs_open_file *of, char *b=
uf,
 				    bool threadgroup)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cgroup_file_ctx *ctx =3D of->priv;
 	struct cgroup *src_cgrp, *dst_cgrp;
@@ -5398,6 +5411,7 @@ static struct cftype cgroup_psi_files[] =3D {
  * steps to the already complex sequence.
  */
 static void css_free_rwork_fn(struct work_struct *work)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cgroup_subsys_state *css =3D container_of(to_rcu_work(work),
 				struct cgroup_subsys_state, destroy_rwork);
@@ -5811,6 +5825,7 @@ static bool cgroup_check_hierarchy_limits(struct cg=
roup *parent)
 }
=20
 int cgroup_mkdir(struct kernfs_node *parent_kn, const char *name, umode_=
t mode)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cgroup *parent, *cgrp;
 	int ret;
@@ -6038,6 +6053,7 @@ static int cgroup_destroy_locked(struct cgroup *cgr=
p)
 };
=20
 int cgroup_rmdir(struct kernfs_node *kn)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cgroup *cgrp;
 	int ret =3D 0;
@@ -6474,6 +6490,7 @@ static struct cgroup *cgroup_get_from_file(struct f=
ile *f)
  */
 static int cgroup_css_set_fork(struct kernel_clone_args *kargs)
 	__acquires(&cgroup_mutex) __acquires(&cgroup_threadgroup_rwsem)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int ret;
 	struct cgroup *dst_cgrp =3D NULL;
@@ -6573,6 +6590,7 @@ static int cgroup_css_set_fork(struct kernel_clone_=
args *kargs)
  */
 static void cgroup_css_set_put_fork(struct kernel_clone_args *kargs)
 	__releases(&cgroup_threadgroup_rwsem) __releases(&cgroup_mutex)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cgroup *cgrp =3D kargs->cgrp;
 	struct css_set *cset =3D kargs->cset;
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 0f910c828973..89f7e396b7c4 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -232,11 +232,13 @@ static struct cpuset top_cpuset =3D {
 static DEFINE_MUTEX(cpuset_mutex);
=20
 void cpuset_lock(void)
+	ACQUIRE(cpuset_mutex)
 {
 	mutex_lock(&cpuset_mutex);
 }
=20
 void cpuset_unlock(void)
+	RELEASE(cpuset_mutex)
 {
 	mutex_unlock(&cpuset_mutex);
 }
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 07455d25329c..8c4b372e5d8e 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -464,11 +464,13 @@ EXPORT_SYMBOL_GPL(cpuhp_tasks_frozen);
  * attempting to serialize the updates to cpu_online_mask & cpu_present_=
mask.
  */
 void cpu_maps_update_begin(void)
+	ACQUIRE(cpu_add_remove_lock)
 {
 	mutex_lock(&cpu_add_remove_lock);
 }
=20
 void cpu_maps_update_done(void)
+	RELEASE(cpu_add_remove_lock)
 {
 	mutex_unlock(&cpu_add_remove_lock);
 }
diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
index 8a47e52a454f..1478ea88fe74 100644
--- a/kernel/events/callchain.c
+++ b/kernel/events/callchain.c
@@ -143,6 +143,7 @@ int get_callchain_buffers(int event_max_stack)
 }
=20
 void put_callchain_buffers(void)
+	NO_THREAD_SAFETY_ANALYSIS /* needed because of a clang bug? */
 {
 	if (atomic_dec_and_mutex_lock(&nr_callchain_events, &callchain_mutex)) =
{
 		release_callchain_buffers();
diff --git a/kernel/events/core.c b/kernel/events/core.c
index bcb09e011e9e..32cc2a748813 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1298,6 +1298,7 @@ static void put_ctx(struct perf_event_context *ctx)
  */
 static struct perf_event_context *
 perf_event_ctx_lock_nested(struct perf_event *event, int nesting)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct perf_event_context *ctx;
=20
@@ -1328,6 +1329,7 @@ perf_event_ctx_lock(struct perf_event *event)
=20
 static void perf_event_ctx_unlock(struct perf_event *event,
 				  struct perf_event_context *ctx)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(&ctx->mutex);
 	put_ctx(ctx);
@@ -6407,6 +6409,7 @@ static void perf_pmu_output_stop(struct perf_event =
*event);
  * to detach all events redirecting to us.
  */
 static void perf_mmap_close(struct vm_area_struct *vma)
+	NO_THREAD_SAFETY_ANALYSIS /* needed because of a clang bug? */
 {
 	struct perf_event *event =3D vma->vm_file->private_data;
 	struct perf_buffer *rb =3D ring_buffer_get(event);
@@ -6598,6 +6601,7 @@ static int map_range(struct perf_buffer *rb, struct=
 vm_area_struct *vma)
 }
=20
 static int perf_mmap(struct file *file, struct vm_area_struct *vma)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct perf_event *event =3D file->private_data;
 	unsigned long user_locked, user_lock_limit;
@@ -11258,6 +11262,7 @@ perf_event_set_addr_filter(struct perf_event *eve=
nt, char *filter_str)
 }
=20
 static int perf_event_set_filter(struct perf_event *event, void __user *=
arg)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int ret =3D -EINVAL;
 	char *filter_str;
@@ -12592,6 +12597,8 @@ static int perf_copy_attr(struct perf_event_attr =
__user *uattr,
 }
=20
 static void mutex_lock_double(struct mutex *a, struct mutex *b)
+	ACQUIRE(*a)
+	ACQUIRE(*b)
 {
 	if (b < a)
 		swap(a, b);
@@ -12602,6 +12609,7 @@ static void mutex_lock_double(struct mutex *a, st=
ruct mutex *b)
=20
 static int
 perf_event_set_output(struct perf_event *event, struct perf_event *outpu=
t_event)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct perf_buffer *rb =3D NULL;
 	int ret =3D -EINVAL;
@@ -13394,6 +13402,7 @@ static void sync_child_event(struct perf_event *c=
hild_event)
=20
 static void
 perf_event_exit_event(struct perf_event *event, struct perf_event_contex=
t *ctx)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct perf_event *parent_event =3D event->parent;
 	unsigned long detach_flags =3D 0;
diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.=
c
index bc4a61029b6d..1a0b8b472a4e 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -113,6 +113,7 @@ static inline struct mutex *get_task_bps_mutex(struct=
 perf_event *bp)
 }
=20
 static struct mutex *bp_constraints_lock(struct perf_event *bp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct mutex *tsk_mtx =3D get_task_bps_mutex(bp);
=20
@@ -137,6 +138,7 @@ static struct mutex *bp_constraints_lock(struct perf_=
event *bp)
 }
=20
 static void bp_constraints_unlock(struct mutex *tsk_mtx)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (tsk_mtx) {
 		percpu_up_read(&bp_cpuinfo_sem);
diff --git a/kernel/fail_function.c b/kernel/fail_function.c
index d971a0189319..3a8376647730 100644
--- a/kernel/fail_function.c
+++ b/kernel/fail_function.c
@@ -181,12 +181,14 @@ static int fei_kprobe_handler(struct kprobe *kp, st=
ruct pt_regs *regs)
 NOKPROBE_SYMBOL(fei_kprobe_handler)
=20
 static void *fei_seq_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(fei_lock)
 {
 	mutex_lock(&fei_lock);
 	return seq_list_start(&fei_attr_list, *pos);
 }
=20
 static void fei_seq_stop(struct seq_file *m, void *v)
+	RELEASE(fei_lock)
 {
 	mutex_unlock(&fei_lock);
 }
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index ebdd76b4ecbb..628d26f206c5 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1052,6 +1052,7 @@ static void futex_cleanup(struct task_struct *tsk)
  * block forever, but there is nothing which can be done about that.
  */
 void futex_exit_recursive(struct task_struct *tsk)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	/* If the state is FUTEX_STATE_EXITING then futex_exit_mutex is held */
 	if (tsk->futex_state =3D=3D FUTEX_STATE_EXITING)
@@ -1060,6 +1061,7 @@ void futex_exit_recursive(struct task_struct *tsk)
 }
=20
 static void futex_cleanup_begin(struct task_struct *tsk)
+	ACQUIRE(tsk->futex_exit_mutex)
 {
 	/*
 	 * Prevent various race issues against a concurrent incoming waiter
@@ -1086,6 +1088,7 @@ static void futex_cleanup_begin(struct task_struct =
*tsk)
 }
=20
 static void futex_cleanup_end(struct task_struct *tsk, int state)
+	RELEASE(tsk->futex_exit_mutex)
 {
 	/*
 	 * Lockless store. The only side effect is that an observer might
diff --git a/kernel/irq/autoprobe.c b/kernel/irq/autoprobe.c
index ae60cae24e9a..c447722388d2 100644
--- a/kernel/irq/autoprobe.c
+++ b/kernel/irq/autoprobe.c
@@ -28,6 +28,7 @@ static DEFINE_MUTEX(probing_active);
  *
  */
 unsigned long probe_irq_on(void)
+	ACQUIRE(probing_active)
 {
 	struct irq_desc *desc;
 	unsigned long mask =3D 0;
@@ -115,6 +116,7 @@ EXPORT_SYMBOL(probe_irq_on);
  *	them all to a known state.
  */
 unsigned int probe_irq_mask(unsigned long val)
+	RELEASE(probing_active)
 {
 	unsigned int mask =3D 0;
 	struct irq_desc *desc;
@@ -155,6 +157,7 @@ EXPORT_SYMBOL(probe_irq_mask);
  *	results of this are non-optimal.
  */
 int probe_irq_off(unsigned long val)
+	RELEASE(probing_active)
 {
 	int i, irq_found =3D 0, nr_of_irqs =3D 0;
 	struct irq_desc *desc;
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 287830739783..95c46b0abb50 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -455,11 +455,13 @@ EXPORT_SYMBOL_GPL(irq_to_desc);
 #endif
=20
 void irq_lock_sparse(void)
+	ACQUIRE(sparse_irq_lock)
 {
 	mutex_lock(&sparse_irq_lock);
 }
=20
 void irq_unlock_sparse(void)
+	RELEASE(sparse_irq_lock)
 {
 	mutex_unlock(&sparse_irq_lock);
 }
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 396a067a8a56..9012ff076b71 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -346,6 +346,7 @@ int msi_setup_device_data(struct device *dev)
  * @dev:	Device to operate on
  */
 void msi_lock_descs(struct device *dev)
+	ACQUIRE(dev->msi.data->mutex)
 {
 	mutex_lock(&dev->msi.data->mutex);
 }
@@ -356,6 +357,7 @@ EXPORT_SYMBOL_GPL(msi_lock_descs);
  * @dev:	Device to operate on
  */
 void msi_unlock_descs(struct device *dev)
+	RELEASE(dev->msi.data->mutex)
 {
 	/* Invalidate the index which was cached by the iterator */
 	dev->msi.data->__iter_idx =3D MSI_XA_MAX_INDEX;
diff --git a/kernel/jump_label.c b/kernel/jump_label.c
index 93a822d3c468..79bc65bf4b73 100644
--- a/kernel/jump_label.c
+++ b/kernel/jump_label.c
@@ -23,11 +23,13 @@
 static DEFINE_MUTEX(jump_label_mutex);
=20
 void jump_label_lock(void)
+	ACQUIRE(jump_label_mutex)
 {
 	mutex_lock(&jump_label_mutex);
 }
=20
 void jump_label_unlock(void)
+	RELEASE(jump_label_mutex)
 {
 	mutex_unlock(&jump_label_mutex);
 }
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 88aeac84e4c0..5ae4a8e253d9 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -637,6 +637,7 @@ static void kprobe_optimizer(struct work_struct *work=
)
 }
=20
 static void wait_for_kprobe_optimizer_locked(void)
+	REQUIRES(kprobe_mutex)
 {
 	lockdep_assert_held(&kprobe_mutex);
=20
@@ -2807,6 +2808,7 @@ DEFINE_SEQ_ATTRIBUTE(kprobes);
=20
 /* kprobes/blacklist -- shows which functions can not be probed */
 static void *kprobe_blacklist_seq_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(kprobe_mutex)
 {
 	mutex_lock(&kprobe_mutex);
 	return seq_list_start(&kprobe_blacklist, *pos);
@@ -2836,6 +2838,7 @@ static int kprobe_blacklist_seq_show(struct seq_fil=
e *m, void *v)
 }
=20
 static void kprobe_blacklist_seq_stop(struct seq_file *f, void *v)
+	RELEASE(kprobe_mutex)
 {
 	mutex_unlock(&kprobe_mutex);
 }
diff --git a/kernel/locking/locktorture.c b/kernel/locking/locktorture.c
index cc33470f4de9..1f200c0f65db 100644
--- a/kernel/locking/locktorture.c
+++ b/kernel/locking/locktorture.c
@@ -485,6 +485,7 @@ static void torture_mutex_init(void)
=20
 static int torture_mutex_nested_lock(int tid __maybe_unused,
 				     u32 lockset)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int i;
=20
@@ -496,6 +497,7 @@ static int torture_mutex_nested_lock(int tid __maybe_=
unused,
=20
 static int torture_mutex_lock(int tid __maybe_unused)
 __acquires(torture_mutex)
+	ACQUIRE(torture_mutex)
 {
 	mutex_lock(&torture_mutex);
 	return 0;
@@ -512,12 +514,14 @@ static void torture_mutex_delay(struct torture_rand=
om_state *trsp)
=20
 static void torture_mutex_unlock(int tid __maybe_unused)
 __releases(torture_mutex)
+	RELEASE(torture_mutex)
 {
 	mutex_unlock(&torture_mutex);
 }
=20
 static void torture_mutex_nested_unlock(int tid __maybe_unused,
 					u32 lockset)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int i;
=20
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 1fb9ad289a6f..8dc5c4797a2f 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3122,6 +3122,7 @@ static bool finished_loading(const char *name)
 /* Must be called with module_mutex held */
 static int module_patient_check_exists(const char *name,
 				       enum fail_dup_mod_reason reason)
+	REQUIRES(module_mutex)
 {
 	struct module *old;
 	int err =3D 0;
diff --git a/kernel/module/procfs.c b/kernel/module/procfs.c
index 0a4841e88adb..baa6a4262188 100644
--- a/kernel/module/procfs.c
+++ b/kernel/module/procfs.c
@@ -47,6 +47,7 @@ static inline void print_unload_info(struct seq_file *m=
, struct module *mod)
=20
 /* Called by the /proc file system to return a list of modules. */
 static void *m_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(module_mutex)
 {
 	mutex_lock(&module_mutex);
 	return seq_list_start(&modules, *pos);
@@ -58,6 +59,7 @@ static void *m_next(struct seq_file *m, void *p, loff_t=
 *pos)
 }
=20
 static void m_stop(struct seq_file *m, void *p)
+	RELEASE(module_mutex)
 {
 	mutex_unlock(&module_mutex);
 }
diff --git a/kernel/params.c b/kernel/params.c
index 0074d29c9b80..1afe9417f93e 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -603,11 +603,13 @@ static ssize_t param_attr_store(const struct module=
_attribute *mattr,
=20
 #ifdef CONFIG_SYSFS
 void kernel_param_lock(struct module *mod)
+	ACQUIRE(KPARAM_MUTEX(mod))
 {
 	mutex_lock(KPARAM_MUTEX(mod));
 }
=20
 void kernel_param_unlock(struct module *mod)
+	RELEASE(KPARAM_MUTEX(mod))
 {
 	mutex_unlock(KPARAM_MUTEX(mod));
 }
diff --git a/kernel/power/autosleep.c b/kernel/power/autosleep.c
index 865df641b97c..8a787643cd4c 100644
--- a/kernel/power/autosleep.c
+++ b/kernel/power/autosleep.c
@@ -77,11 +77,13 @@ suspend_state_t pm_autosleep_state(void)
 }
=20
 int pm_autosleep_lock(void)
+	TRY_ACQUIRE(0, autosleep_lock)
 {
 	return mutex_lock_interruptible(&autosleep_lock);
 }
=20
 void pm_autosleep_unlock(void)
+	RELEASE(autosleep_lock)
 {
 	mutex_unlock(&autosleep_lock);
 }
diff --git a/kernel/power/main.c b/kernel/power/main.c
index 6254814d4817..2f83cf14ff49 100644
--- a/kernel/power/main.c
+++ b/kernel/power/main.c
@@ -50,6 +50,7 @@ void pm_restrict_gfp_mask(void)
 }
=20
 unsigned int lock_system_sleep(void)
+	ACQUIRE(system_transition_mutex)
 {
 	unsigned int flags =3D current->flags;
 	current->flags |=3D PF_NOFREEZE;
@@ -59,6 +60,7 @@ unsigned int lock_system_sleep(void)
 EXPORT_SYMBOL_GPL(lock_system_sleep);
=20
 void unlock_system_sleep(unsigned int flags)
+	RELEASE(system_transition_mutex)
 {
 	if (!(flags & PF_NOFREEZE))
 		current->flags &=3D ~PF_NOFREEZE;
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 07668433644b..db78210f5c76 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -244,6 +244,7 @@ int devkmsg_sysctl_set_loglvl(const struct ctl_table =
*table, int write,
  * For console list or console->flags updates
  */
 void console_list_lock(void)
+	ACQUIRE(console_mutex)
 {
 	/*
 	 * In unregister_console() and console_force_preferred_locked(),
@@ -268,6 +269,7 @@ EXPORT_SYMBOL(console_list_lock);
  * Counterpart to console_list_lock()
  */
 void console_list_unlock(void)
+	RELEASE(console_mutex)
 {
 	mutex_unlock(&console_mutex);
 }
diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index b83c74c4dcc0..dbac7c6ae04c 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -872,6 +872,7 @@ static void srcu_schedule_cbs_snp(struct srcu_struct =
*ssp, struct srcu_node *snp
  * array to have a finite number of elements.
  */
 static void srcu_gp_end(struct srcu_struct *ssp)
+	RELEASE(ssp->srcu_sup->srcu_gp_mutex)
 {
 	unsigned long cbdelay =3D 1;
 	bool cbs;
@@ -902,7 +903,7 @@ static void srcu_gp_end(struct srcu_struct *ssp)
 	if (ULONG_CMP_LT(sup->srcu_gp_seq_needed_exp, gpseq))
 		WRITE_ONCE(sup->srcu_gp_seq_needed_exp, gpseq);
 	spin_unlock_irq_rcu_node(sup);
-	mutex_unlock(&sup->srcu_gp_mutex);
+	mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
 	/* A new grace period can start at this point.  But only one. */
=20
 	/* Initiate callback invocation as needed. */
@@ -1685,6 +1686,7 @@ EXPORT_SYMBOL_GPL(srcu_batches_completed);
  * completed in that state.
  */
 static void srcu_advance_state(struct srcu_struct *ssp)
+	NO_THREAD_SAFETY_ANALYSIS /* too complex for clang */
 {
 	int idx;
=20
diff --git a/kernel/rcu/tree_exp.h b/kernel/rcu/tree_exp.h
index 77efed89c79e..3cda44bc0236 100644
--- a/kernel/rcu/tree_exp.h
+++ b/kernel/rcu/tree_exp.h
@@ -290,6 +290,7 @@ static bool sync_exp_work_done(unsigned long s)
  * expedited grace period.
  */
 static bool exp_funnel_lock(unsigned long s)
+	TRY_ACQUIRE(false, rcu_state.exp_mutex)
 {
 	struct rcu_data *rdp =3D per_cpu_ptr(&rcu_data, raw_smp_processor_id())=
;
 	struct rcu_node *rnp =3D rdp->mynode;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 165c90ba64ea..a3a430ff8173 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -461,6 +461,7 @@ void sched_core_get(void)
 }
=20
 static void __sched_core_put(struct work_struct *work)
+	NO_THREAD_SAFETY_ANALYSIS /* needed because of a clang bug? */
 {
 	if (atomic_dec_and_mutex_lock(&sched_core_count, &sched_core_mutex)) {
 		__sched_core_disable();
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 84c9b42f11ef..ab14b2cb9428 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1918,6 +1918,7 @@ static bool has_duplicate_listener(struct seccomp_f=
ilter *new_child)
  */
 static long seccomp_set_mode_filter(unsigned int flags,
 				    const char __user *filter)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	const unsigned long seccomp_mode =3D SECCOMP_MODE_FILTER;
 	struct seccomp_filter *prepared =3D NULL;
diff --git a/kernel/static_call_inline.c b/kernel/static_call_inline.c
index bb7d066a7c39..a09f0c394b6e 100644
--- a/kernel/static_call_inline.c
+++ b/kernel/static_call_inline.c
@@ -32,11 +32,13 @@ void static_call_force_reinit(void)
 static DEFINE_MUTEX(static_call_mutex);
=20
 static void static_call_lock(void)
+	ACQUIRE(static_call_mutex)
 {
 	mutex_lock(&static_call_mutex);
 }
=20
 static void static_call_unlock(void)
+	RELEASE(static_call_mutex)
 {
 	mutex_unlock(&static_call_mutex);
 }
diff --git a/kernel/torture.c b/kernel/torture.c
index dede150aef01..f189f6edca03 100644
--- a/kernel/torture.c
+++ b/kernel/torture.c
@@ -809,6 +809,7 @@ torture_print_module_parms(void)
  * the test is currently runnable.  If there is no such flag, pass in NU=
LL.
  */
 bool torture_init_begin(char *ttype, int v)
+	TRY_ACQUIRE(true, fullstop_mutex)
 {
 	mutex_lock(&fullstop_mutex);
 	if (torture_type !=3D NULL) {
@@ -830,6 +831,7 @@ EXPORT_SYMBOL_GPL(torture_init_begin);
  * Tell the torture module that initialization is complete.
  */
 void torture_init_end(void)
+	RELEASE(fullstop_mutex)
 {
 	mutex_unlock(&fullstop_mutex);
 	register_reboot_notifier(&torture_shutdown_nb);
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 728ecda6e8d4..87b2116a2d18 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -4139,6 +4139,7 @@ static void reset_iter_read(struct ftrace_iterator =
*iter)
 }
=20
 static void *t_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(ftrace_lock)
 {
 	struct ftrace_iterator *iter =3D m->private;
 	void *p =3D NULL;
@@ -4194,6 +4195,7 @@ static void *t_start(struct seq_file *m, loff_t *po=
s)
 }
=20
 static void t_stop(struct seq_file *m, void *p)
+	RELEASE(ftrace_lock)
 {
 	mutex_unlock(&ftrace_lock);
 }
@@ -6561,6 +6563,7 @@ g_next(struct seq_file *m, void *v, loff_t *pos)
 }
=20
 static void *g_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(graph_lock)
 {
 	struct ftrace_graph_data *fgd =3D m->private;
=20
@@ -6583,6 +6586,7 @@ static void *g_start(struct seq_file *m, loff_t *po=
s)
 }
=20
 static void g_stop(struct seq_file *m, void *p)
+	RELEASE(graph_lock)
 {
 	mutex_unlock(&graph_lock);
 }
@@ -8112,6 +8116,7 @@ static void ftrace_pid_reset(struct trace_array *tr=
, int type)
=20
 static void *fpid_start(struct seq_file *m, loff_t *pos)
 	__acquires(RCU)
+	ACQUIRE(ftrace_lock)
 {
 	struct trace_pid_list *pid_list;
 	struct trace_array *tr =3D m->private;
@@ -8141,6 +8146,7 @@ static void *fpid_next(struct seq_file *m, void *v,=
 loff_t *pos)
=20
 static void fpid_stop(struct seq_file *m, void *p)
 	__releases(RCU)
+	RELEASE(ftrace_lock)
 {
 	rcu_read_unlock_sched();
 	mutex_unlock(&ftrace_lock);
@@ -8165,6 +8171,7 @@ static const struct seq_operations ftrace_pid_sops =
=3D {
=20
 static void *fnpid_start(struct seq_file *m, loff_t *pos)
 	__acquires(RCU)
+	ACQUIRE(ftrace_lock)
 {
 	struct trace_pid_list *pid_list;
 	struct trace_array *tr =3D m->private;
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index b8e0ae15ca5b..f9089aa17844 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6890,6 +6890,7 @@ static void rb_setup_ids_meta_page(struct ring_buff=
er_per_cpu *cpu_buffer,
=20
 static struct ring_buffer_per_cpu *
 rb_get_mapped_buffer(struct trace_buffer *buffer, int cpu)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
=20
@@ -6909,6 +6910,7 @@ rb_get_mapped_buffer(struct trace_buffer *buffer, i=
nt cpu)
 }
=20
 static void rb_put_mapped_buffer(struct ring_buffer_per_cpu *cpu_buffer)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(&cpu_buffer->mapping_lock);
 }
diff --git a/kernel/trace/rv/rv.c b/kernel/trace/rv/rv.c
index 8657fc8806e7..d52ee98240ea 100644
--- a/kernel/trace/rv/rv.c
+++ b/kernel/trace/rv/rv.c
@@ -386,6 +386,7 @@ static int monitors_show(struct seq_file *m, void *p)
  * operation.
  */
 static void monitors_stop(struct seq_file *m, void *p)
+	RELEASE(rv_interface_lock)
 {
 	mutex_unlock(&rv_interface_lock);
 }
@@ -394,6 +395,7 @@ static void monitors_stop(struct seq_file *m, void *p=
)
  * Available monitor seq functions.
  */
 static void *available_monitors_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(rv_interface_lock)
 {
 	mutex_lock(&rv_interface_lock);
 	return seq_list_start(&rv_monitors_list, *pos);
@@ -422,6 +424,7 @@ static void *enabled_monitors_next(struct seq_file *m=
, void *p, loff_t *pos)
 }
=20
 static void *enabled_monitors_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(rv_interface_lock)
 {
 	struct rv_monitor_def *m_def;
 	loff_t l;
diff --git a/kernel/trace/rv/rv_reactors.c b/kernel/trace/rv/rv_reactors.=
c
index 7b49cbe388d4..7caed32dbb72 100644
--- a/kernel/trace/rv/rv_reactors.c
+++ b/kernel/trace/rv/rv_reactors.c
@@ -93,11 +93,13 @@ static int reactors_show(struct seq_file *m, void *p)
 }
=20
 static void reactors_stop(struct seq_file *m, void *p)
+	RELEASE(rv_interface_lock)
 {
 	mutex_unlock(&rv_interface_lock);
 }
=20
 static void *reactors_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(rv_interface_lock)
 {
 	mutex_lock(&rv_interface_lock);
 	return seq_list_start(&rv_reactors_list, *pos);
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 1496a5ac33ae..e41c4b34e77b 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -917,6 +917,7 @@ static DECLARE_RWSEM(all_cpu_access_lock);
 static DEFINE_PER_CPU(struct mutex, cpu_access_lock);
=20
 static inline void trace_access_lock(int cpu)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (cpu =3D=3D RING_BUFFER_ALL_CPUS) {
 		/* gain it for accessing the whole ring buffer. */
@@ -933,6 +934,7 @@ static inline void trace_access_lock(int cpu)
 }
=20
 static inline void trace_access_unlock(int cpu)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (cpu =3D=3D RING_BUFFER_ALL_CPUS) {
 		up_write(&all_cpu_access_lock);
@@ -955,12 +957,14 @@ static inline void trace_access_lock_init(void)
 static DEFINE_MUTEX(access_lock);
=20
 static inline void trace_access_lock(int cpu)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	(void)cpu;
 	mutex_lock(&access_lock);
 }
=20
 static inline void trace_access_unlock(int cpu)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	(void)cpu;
 	mutex_unlock(&access_lock);
@@ -4885,6 +4889,7 @@ t_next(struct seq_file *m, void *v, loff_t *pos)
 }
=20
 static void *t_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(trace_types_lock)
 {
 	struct trace_array *tr =3D m->private;
 	struct tracer *t;
@@ -4900,6 +4905,7 @@ static void *t_start(struct seq_file *m, loff_t *po=
s)
 }
=20
 static void t_stop(struct seq_file *m, void *p)
+	RELEASE(trace_types_lock)
 {
 	mutex_unlock(&trace_types_lock);
 }
@@ -5705,6 +5711,7 @@ static void *eval_map_next(struct seq_file *m, void=
 *v, loff_t *pos)
 }
=20
 static void *eval_map_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(trace_eval_mutex)
 {
 	union trace_eval_map_item *v;
 	loff_t l =3D 0;
@@ -5723,6 +5730,7 @@ static void *eval_map_start(struct seq_file *m, lof=
f_t *pos)
 }
=20
 static void eval_map_stop(struct seq_file *m, void *v)
+	RELEASE(trace_eval_mutex)
 {
 	mutex_unlock(&trace_eval_mutex);
 }
@@ -6440,6 +6448,7 @@ tracing_poll_pipe(struct file *filp, poll_table *po=
ll_table)
=20
 /* Must be called with iter->mutex held. */
 static int tracing_wait_pipe(struct file *filp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct trace_iterator *iter =3D filp->private_data;
 	int ret;
@@ -7497,6 +7506,7 @@ static const struct file_operations snapshot_raw_fo=
ps =3D {
  */
 static ssize_t
 trace_min_max_write(struct file *filp, const char __user *ubuf, size_t c=
nt, loff_t *ppos)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct trace_min_max_param *param =3D filp->private_data;
 	u64 val;
@@ -7733,6 +7743,7 @@ static void clear_tracing_err_log(struct trace_arra=
y *tr)
 }
=20
 static void *tracing_err_log_seq_start(struct seq_file *m, loff_t *pos)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct trace_array *tr =3D m->private;
=20
@@ -7749,6 +7760,7 @@ static void *tracing_err_log_seq_next(struct seq_fi=
le *m, void *v, loff_t *pos)
 }
=20
 static void tracing_err_log_seq_stop(struct seq_file *m, void *v)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(&tracing_err_log_lock);
 }
diff --git a/kernel/trace/trace_dynevent.c b/kernel/trace/trace_dynevent.=
c
index a322e4f249a5..12f7251d5be4 100644
--- a/kernel/trace/trace_dynevent.c
+++ b/kernel/trace/trace_dynevent.c
@@ -141,6 +141,7 @@ static int create_dyn_event(const char *raw_command)
 LIST_HEAD(dyn_event_list);
=20
 void *dyn_event_seq_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(event_mutex)
 {
 	mutex_lock(&event_mutex);
 	return seq_list_start(&dyn_event_list, *pos);
@@ -152,6 +153,7 @@ void *dyn_event_seq_next(struct seq_file *m, void *v,=
 loff_t *pos)
 }
=20
 void dyn_event_seq_stop(struct seq_file *m, void *v)
+	RELEASE(event_mutex)
 {
 	mutex_unlock(&event_mutex);
 }
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 4cb275316e51..0a8caf906210 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -1534,6 +1534,7 @@ t_next(struct seq_file *m, void *v, loff_t *pos)
 }
=20
 static void *t_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(event_mutex)
 {
 	struct trace_event_file *file;
 	struct trace_array *tr =3D m->private;
@@ -1595,6 +1596,7 @@ s_next(struct seq_file *m, void *v, loff_t *pos)
 }
=20
 static void *s_start(struct seq_file *m, loff_t *pos)
+	NO_THREAD_SAFETY_ANALYSIS /* TRY_ACQUIRE() does not support pointers */
 {
 	struct trace_array *tr =3D m->private;
 	struct set_event_iter *iter;
@@ -1630,6 +1632,7 @@ static int t_show(struct seq_file *m, void *v)
 }
=20
 static void t_stop(struct seq_file *m, void *p)
+	RELEASE(event_mutex)
 {
 	mutex_unlock(&event_mutex);
 }
@@ -1668,6 +1671,7 @@ static int s_show(struct seq_file *m, void *v)
 #endif
=20
 static void s_stop(struct seq_file *m, void *p)
+	RELEASE(event_mutex)
 {
 	kfree(p);
 	t_stop(m, NULL);
@@ -1701,6 +1705,7 @@ np_next(struct seq_file *m, void *v, loff_t *pos)
=20
 static void *__start(struct seq_file *m, loff_t *pos, int type)
 	__acquires(RCU)
+	ACQUIRE(event_mutex)
 {
 	struct trace_pid_list *pid_list;
 	struct trace_array *tr =3D m->private;
@@ -1727,18 +1732,21 @@ static void *__start(struct seq_file *m, loff_t *=
pos, int type)
=20
 static void *p_start(struct seq_file *m, loff_t *pos)
 	__acquires(RCU)
+	ACQUIRE(event_mutex)
 {
 	return __start(m, pos, TRACE_PIDS);
 }
=20
 static void *np_start(struct seq_file *m, loff_t *pos)
 	__acquires(RCU)
+	ACQUIRE(event_mutex)
 {
 	return __start(m, pos, TRACE_NO_PIDS);
 }
=20
 static void p_stop(struct seq_file *m, void *p)
 	__releases(RCU)
+	RELEASE(event_mutex)
 {
 	rcu_read_unlock_sched();
 	mutex_unlock(&event_mutex);
@@ -1994,6 +2002,7 @@ static int f_show(struct seq_file *m, void *v)
 }
=20
 static void *f_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(event_mutex)
 {
 	struct trace_event_file *file;
 	void *p =3D (void *)FORMAT_HEADER;
@@ -2012,6 +2021,7 @@ static void *f_start(struct seq_file *m, loff_t *po=
s)
 }
=20
 static void f_stop(struct seq_file *m, void *p)
+	RELEASE(event_mutex)
 {
 	mutex_unlock(&event_mutex);
 }
diff --git a/kernel/trace/trace_events_trigger.c b/kernel/trace/trace_eve=
nts_trigger.c
index d45448947094..be8a81db3382 100644
--- a/kernel/trace/trace_events_trigger.c
+++ b/kernel/trace/trace_events_trigger.c
@@ -154,6 +154,7 @@ static bool check_user_trigger(struct trace_event_fil=
e *file)
 }
=20
 static void *trigger_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(event_mutex)
 {
 	struct trace_event_file *event_file;
=20
@@ -170,6 +171,7 @@ static void *trigger_start(struct seq_file *m, loff_t=
 *pos)
 }
=20
 static void trigger_stop(struct seq_file *m, void *t)
+	RELEASE(event_mutex)
 {
 	mutex_unlock(&event_mutex);
 }
diff --git a/kernel/trace/trace_events_user.c b/kernel/trace/trace_events=
_user.c
index 97325fbd6283..bf70d3ef6a34 100644
--- a/kernel/trace/trace_events_user.c
+++ b/kernel/trace/trace_events_user.c
@@ -260,6 +260,7 @@ static void delayed_destroy_user_event(struct work_st=
ruct *work)
 }
=20
 static void user_event_put(struct user_event *user, bool locked)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	bool delete;
=20
diff --git a/kernel/trace/trace_hwlat.c b/kernel/trace/trace_hwlat.c
index b65353ec2837..059d60e0574f 100644
--- a/kernel/trace/trace_hwlat.c
+++ b/kernel/trace/trace_hwlat.c
@@ -604,6 +604,7 @@ static int start_per_cpu_kthreads(struct trace_array =
*tr)
 }
=20
 static void *s_mode_start(struct seq_file *s, loff_t *pos)
+	ACQUIRE(hwlat_data.lock)
 {
 	int mode =3D *pos;
=20
@@ -642,6 +643,7 @@ static int s_mode_show(struct seq_file *s, void *v)
 }
=20
 static void s_mode_stop(struct seq_file *s, void *v)
+	RELEASE(hwlat_data.lock)
 {
 	seq_puts(s, "\n");
 	mutex_unlock(&hwlat_data.lock);
diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
index f3a2722ee4c0..bf9eda568ad5 100644
--- a/kernel/trace/trace_osnoise.c
+++ b/kernel/trace/trace_osnoise.c
@@ -2153,6 +2153,7 @@ static void osnoise_init_hotplug_support(void)
  * seq file functions for the osnoise/options file.
  */
 static void *s_options_start(struct seq_file *s, loff_t *pos)
+	ACQUIRE(interface_lock)
 {
 	int option =3D *pos;
=20
@@ -2200,6 +2201,7 @@ static int s_options_show(struct seq_file *s, void =
*v)
 }
=20
 static void s_options_stop(struct seq_file *s, void *v)
+	RELEASE(interface_lock)
 {
 	seq_puts(s, "\n");
 	mutex_unlock(&interface_lock);
diff --git a/kernel/trace/trace_printk.c b/kernel/trace/trace_printk.c
index 29f6e95439b6..03360d1d90f4 100644
--- a/kernel/trace/trace_printk.c
+++ b/kernel/trace/trace_printk.c
@@ -160,11 +160,13 @@ find_next_mod_format(int start_index, void *v, cons=
t char **fmt, loff_t *pos)
 }
=20
 static void format_mod_start(void)
+	ACQUIRE(btrace_mutex)
 {
 	mutex_lock(&btrace_mutex);
 }
=20
 static void format_mod_stop(void)
+	RELEASE(btrace_mutex)
 {
 	mutex_unlock(&btrace_mutex);
 }
@@ -297,6 +299,9 @@ static const char **find_next(void *v, loff_t *pos)
=20
 static void *
 t_start(struct seq_file *m, loff_t *pos)
+#ifdef CONFIG_MODULES
+	ACQUIRE(btrace_mutex)
+#endif
 {
 	format_mod_start();
 	return find_next(NULL, pos);
@@ -346,6 +351,9 @@ static int t_show(struct seq_file *m, void *v)
 }
=20
 static void t_stop(struct seq_file *m, void *p)
+#ifdef CONFIG_MODULES
+	RELEASE(btrace_mutex)
+#endif
 {
 	format_mod_stop();
 }
diff --git a/kernel/trace/trace_recursion_record.c b/kernel/trace/trace_r=
ecursion_record.c
index a520b11afb0d..fb7dcb6e3f6e 100644
--- a/kernel/trace/trace_recursion_record.c
+++ b/kernel/trace/trace_recursion_record.c
@@ -119,6 +119,7 @@ static DEFINE_MUTEX(recursed_function_lock);
 static struct trace_seq *tseq;
=20
 static void *recursed_function_seq_start(struct seq_file *m, loff_t *pos=
)
+	ACQUIRE(recursed_function_lock)
 {
 	void *ret =3D NULL;
 	int index;
@@ -150,6 +151,7 @@ static void *recursed_function_seq_next(struct seq_fi=
le *m, void *v, loff_t *pos
 }
=20
 static void recursed_function_seq_stop(struct seq_file *m, void *v)
+	RELEASE(recursed_function_lock)
 {
 	kfree(tseq);
 	mutex_unlock(&recursed_function_lock);
diff --git a/kernel/trace/trace_stat.c b/kernel/trace/trace_stat.c
index b3b5586f104d..22c026d00c78 100644
--- a/kernel/trace/trace_stat.c
+++ b/kernel/trace/trace_stat.c
@@ -166,6 +166,7 @@ static int stat_seq_init(struct stat_session *session=
)
=20
=20
 static void *stat_seq_start(struct seq_file *s, loff_t *pos)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct stat_session *session =3D s->private;
 	struct rb_node *node;
@@ -203,6 +204,7 @@ static void *stat_seq_next(struct seq_file *s, void *=
p, loff_t *pos)
 }
=20
 static void stat_seq_stop(struct seq_file *s, void *p)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct stat_session *session =3D s->private;
 	mutex_unlock(&session->stat_mutex);
diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index ccc762fbb69c..d0db6c858e88 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -940,6 +940,7 @@ static void uprobe_buffer_disable(void)
 }
=20
 static struct uprobe_cpu_buffer *uprobe_buffer_get(void)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct uprobe_cpu_buffer *ucb;
 	int cpu;
@@ -957,6 +958,7 @@ static struct uprobe_cpu_buffer *uprobe_buffer_get(vo=
id)
 }
=20
 static void uprobe_buffer_put(struct uprobe_cpu_buffer *ucb)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (!ucb)
 		return;
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 3c2c45313c88..f308d79725ce 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5173,11 +5173,13 @@ static struct pool_workqueue *alloc_unbound_pwq(s=
truct workqueue_struct *wq,
 }
=20
 static void apply_wqattrs_lock(void)
+	ACQUIRE(wq_pool_mutex)
 {
 	mutex_lock(&wq_pool_mutex);
 }
=20
 static void apply_wqattrs_unlock(void)
+	RELEASE(wq_pool_mutex)
 {
 	mutex_unlock(&wq_pool_mutex);
 }
diff --git a/lib/Makefile b/lib/Makefile
index d5cfc7afbbb8..397062672e0d 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -131,6 +131,8 @@ endif
=20
 obj-$(CONFIG_DEBUG_INFO_REDUCED) +=3D debug_info.o
 CFLAGS_debug_info.o +=3D $(call cc-option, -femit-struct-debug-detailed=3D=
any)
+CFLAGS_locking-selftest.o +=3D -Wno-thread-safety-analysis
+CFLAGS_test_lockup.o +=3D -Wno-thread-safety-analysis
=20
 obj-y +=3D math/ crypto/
=20
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a007952f7f2..168d59ef68b3 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1074,6 +1074,7 @@ static struct _ddebug *ddebug_iter_next(struct ddeb=
ug_iter *iter)
  * seeks the seq_file's iterator to the given position.
  */
 static void *ddebug_proc_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(ddebug_lock)
 {
 	struct ddebug_iter *iter =3D m->private;
 	struct _ddebug *dp;
@@ -1166,6 +1167,7 @@ static int ddebug_proc_show(struct seq_file *m, voi=
d *p)
  * call from userspace.  Drops ddebug_lock.
  */
 static void ddebug_proc_stop(struct seq_file *m, void *p)
+	RELEASE(ddebug_lock)
 {
 	mutex_unlock(&ddebug_lock);
 }
diff --git a/lib/error-inject.c b/lib/error-inject.c
index 887acd9a6ea6..de2d36c9a6ee 100644
--- a/lib/error-inject.c
+++ b/lib/error-inject.c
@@ -163,12 +163,14 @@ static __init int module_ei_init(void)
  * error injection.
  */
 static void *ei_seq_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(ei_mutex)
 {
 	mutex_lock(&ei_mutex);
 	return seq_list_start(&error_injection_list, *pos);
 }
=20
 static void ei_seq_stop(struct seq_file *m, void *v)
+	RELEASE(ei_mutex)
 {
 	mutex_unlock(&ei_mutex);
 }
diff --git a/lib/kunit/platform.c b/lib/kunit/platform.c
index 0b518de26065..fcf7ef34107c 100644
--- a/lib/kunit/platform.c
+++ b/lib/kunit/platform.c
@@ -203,6 +203,7 @@ static void kunit_platform_device_probe_nb_remove(voi=
d *nb)
 int kunit_platform_device_prepare_wait_for_probe(struct kunit *test,
 						 struct platform_device *pdev,
 						 struct completion *x)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct device *dev =3D &pdev->dev;
 	struct kunit_platform_device_probe_nb *knb;
diff --git a/lib/once.c b/lib/once.c
index 2c306f0e891e..cc7f5a497bf8 100644
--- a/lib/once.c
+++ b/lib/once.c
@@ -71,6 +71,7 @@ static DEFINE_MUTEX(once_mutex);
=20
 bool __do_once_sleepable_start(bool *done)
 	__acquires(once_mutex)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_lock(&once_mutex);
 	if (*done) {
@@ -90,6 +91,7 @@ EXPORT_SYMBOL(__do_once_sleepable_start);
 void __do_once_sleepable_done(bool *done, struct static_key_true *once_k=
ey,
 			 struct module *mod)
 	__releases(once_mutex)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	*done =3D true;
 	mutex_unlock(&once_mutex);
diff --git a/mm/damon/sysfs.c b/mm/damon/sysfs.c
index deeab04d3b46..a89032518a75 100644
--- a/mm/damon/sysfs.c
+++ b/mm/damon/sysfs.c
@@ -1182,6 +1182,7 @@ static int damon_sysfs_add_targets(struct damon_ctx=
 *ctx,
 }
=20
 static void damon_sysfs_before_terminate(struct damon_ctx *ctx)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct damon_target *t, *next;
=20
@@ -1318,6 +1319,7 @@ static int damon_sysfs_upd_schemes_effective_quotas=
(void *data)
  */
 static int damon_sysfs_cmd_request_callback(struct damon_ctx *c, bool ac=
tive,
 		bool after_aggregation)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct damon_sysfs_kdamond *kdamond;
 	int err =3D 0;
@@ -1501,6 +1503,7 @@ static int damon_sysfs_update_schemes_tried_regions=
(
  */
 static int damon_sysfs_handle_cmd(enum damon_sysfs_cmd cmd,
 		struct damon_sysfs_kdamond *kdamond)
+	REQUIRES(damon_sysfs_lock)
 {
 	bool need_wait =3D true;
=20
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 65068671e460..2e659e5736fd 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5820,6 +5820,7 @@ static void unmap_ref_private(struct mm_struct *mm,=
 struct vm_area_struct *vma,
  */
 static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 		       struct vm_fault *vmf)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct vm_area_struct *vma =3D vmf->vma;
 	struct mm_struct *mm =3D vma->vm_mm;
@@ -6060,6 +6061,7 @@ int hugetlb_add_to_page_cache(struct folio *folio, =
struct address_space *mapping
 static inline vm_fault_t hugetlb_handle_userfault(struct vm_fault *vmf,
 						  struct address_space *mapping,
 						  unsigned long reason)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	u32 hash;
=20
@@ -6093,6 +6095,7 @@ static bool hugetlb_pte_stable(struct hstate *h, st=
ruct mm_struct *mm, unsigned
=20
 static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 			struct vm_fault *vmf)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct vm_area_struct *vma =3D vmf->vma;
 	struct mm_struct *mm =3D vma->vm_mm;
@@ -6334,6 +6337,7 @@ u32 hugetlb_fault_mutex_hash(struct address_space *=
mapping, pgoff_t idx)
=20
 vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vm=
a,
 			unsigned long address, unsigned int flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	vm_fault_t ret;
 	u32 hash;
diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 9f81f4f30fca..a54a91832301 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1910,6 +1910,7 @@ static void stop_scan_thread(void)
  * a memory scanning when the pos argument points to the first position.
  */
 static void *kmemleak_seq_start(struct seq_file *seq, loff_t *pos)
+	TRY_ACQUIRE(0, scan_mutex)
 {
 	struct kmemleak_object *object;
 	loff_t n =3D *pos;
@@ -1958,6 +1959,7 @@ static void *kmemleak_seq_next(struct seq_file *seq=
, void *v, loff_t *pos)
  * Decrement the use_count of the last object required, if any.
  */
 static void kmemleak_seq_stop(struct seq_file *seq, void *v)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (!IS_ERR(v)) {
 		/*
diff --git a/mm/ksm.c b/mm/ksm.c
index 8be2b144fefd..2aba983d1b7c 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -3134,6 +3134,7 @@ void folio_migrate_ksm(struct folio *newfolio, stru=
ct folio *folio)
=20
 #ifdef CONFIG_MEMORY_HOTREMOVE
 static void wait_while_offlining(void)
+	REQUIRES(ksm_thread_mutex)
 {
 	while (ksm_run & KSM_RUN_OFFLINE) {
 		mutex_unlock(&ksm_thread_mutex);
diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 1cf121ad7085..1e49b99709f3 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -820,6 +820,7 @@ void oom_killer_enable(void)
  * disabled.
  */
 bool oom_killer_disable(signed long timeout)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	signed long ret;
=20
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 579789600a3c..56078ea8916c 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2443,6 +2443,7 @@ void drain_local_pages(struct zone *zone)
  * optimizing racy check.
  */
 static void __drain_all_pages(struct zone *zone, bool force_all_cpus)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int cpu;
=20
@@ -3574,6 +3575,7 @@ __alloc_pages_cpuset_fallback(gfp_t gfp_mask, unsig=
ned int order,
 static inline struct page *
 __alloc_pages_may_oom(gfp_t gfp_mask, unsigned int order,
 	const struct alloc_context *ac, unsigned long *did_some_progress)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct oom_control oc =3D {
 		.zonelist =3D ac->zonelist,
@@ -6690,6 +6692,7 @@ EXPORT_SYMBOL(free_contig_range);
  * Must be paired with a call to zone_pcp_enable().
  */
 void zone_pcp_disable(struct zone *zone)
+	ACQUIRE(pcp_batch_high_lock)
 {
 	mutex_lock(&pcp_batch_high_lock);
 	__zone_set_pageset_high_and_batch(zone, 0, 0, 1);
@@ -6697,6 +6700,7 @@ void zone_pcp_disable(struct zone *zone)
 }
=20
 void zone_pcp_enable(struct zone *zone)
+	RELEASE(pcp_batch_high_lock)
 {
 	__zone_set_pageset_high_and_batch(zone, zone->pageset_high_min,
 		zone->pageset_high_max, zone->pageset_batch);
diff --git a/mm/percpu.c b/mm/percpu.c
index ac61e3fc5f15..223831b52801 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1729,6 +1729,7 @@ static void pcpu_alloc_tag_free_hook(struct pcpu_ch=
unk *chunk, int off, size_t s
  */
 void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserve=
d,
 				 gfp_t gfp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	gfp_t pcpu_gfp;
 	bool is_atomic;
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 4030907b6b7d..580a367d9f37 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1091,6 +1091,7 @@ static void print_slabinfo_header(struct seq_file *=
m)
 }
=20
 static void *slab_start(struct seq_file *m, loff_t *pos)
+	ACQUIRE(slab_mutex)
 {
 	mutex_lock(&slab_mutex);
 	return seq_list_start(&slab_caches, *pos);
@@ -1102,6 +1103,7 @@ static void *slab_next(struct seq_file *m, void *p,=
 loff_t *pos)
 }
=20
 static void slab_stop(struct seq_file *m, void *p)
+	RELEASE(slab_mutex)
 {
 	mutex_unlock(&slab_mutex);
 }
diff --git a/mm/swap_slots.c b/mm/swap_slots.c
index 9c7c171df7ba..96135222f81a 100644
--- a/mm/swap_slots.c
+++ b/mm/swap_slots.c
@@ -64,6 +64,7 @@ static void reactivate_swap_slots_cache(void)
=20
 /* Must not be called with cpu hot plug lock */
 void disable_swap_slots_cache_lock(void)
+	ACQUIRE(swap_slots_cache_enable_mutex)
 {
 	mutex_lock(&swap_slots_cache_enable_mutex);
 	swap_slot_cache_enabled =3D false;
@@ -81,6 +82,7 @@ static void __reenable_swap_slots_cache(void)
 }
=20
 void reenable_swap_slots_cache_unlock(void)
+	RELEASE(swap_slots_cache_enable_mutex)
 {
 	__reenable_swap_slots_cache();
 	mutex_unlock(&swap_slots_cache_enable_mutex);
diff --git a/mm/swapfile.c b/mm/swapfile.c
index ba19430dd4ea..3e7857df7819 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2828,6 +2828,7 @@ static __poll_t swaps_poll(struct file *file, poll_=
table *wait)
=20
 /* iterator */
 static void *swap_start(struct seq_file *swap, loff_t *pos)
+	ACQUIRE(swapon_mutex)
 {
 	struct swap_info_struct *si;
 	int type;
@@ -2869,6 +2870,7 @@ static void *swap_next(struct seq_file *swap, void =
*v, loff_t *pos)
 }
=20
 static void swap_stop(struct seq_file *swap, void *v)
+	RELEASE(swapon_mutex)
 {
 	mutex_unlock(&swapon_mutex);
 }
diff --git a/mm/vma.c b/mm/vma.c
index af1d549b179c..75d1bc1e0f88 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2047,6 +2047,7 @@ static void vm_lock_mapping(struct mm_struct *mm, s=
truct address_space *mapping)
  * mm_take_all_locks() can fail if it's interrupted by signals.
  */
 int mm_take_all_locks(struct mm_struct *mm)
+	ACQUIRE(mm_all_locks_mutex)
 {
 	struct vm_area_struct *vma;
 	struct anon_vma_chain *avc;
@@ -2143,6 +2144,7 @@ static void vm_unlock_mapping(struct address_space =
*mapping)
  * mm_drop_all_locks() returns.
  */
 void mm_drop_all_locks(struct mm_struct *mm)
+	RELEASE(mm_all_locks_mutex)
 {
 	struct vm_area_struct *vma;
 	struct anon_vma_chain *avc;
diff --git a/mm/zswap.c b/mm/zswap.c
index 6504174fbc6a..8887c3c98397 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -897,6 +897,7 @@ static int zswap_cpu_comp_dead(unsigned int cpu, stru=
ct hlist_node *node)
 }
=20
 static struct crypto_acomp_ctx *acomp_ctx_get_cpu_lock(struct zswap_pool=
 *pool)
+	NO_THREAD_SAFETY_ANALYSIS /* mutex is not a member of any argument */
 {
 	struct crypto_acomp_ctx *acomp_ctx;
=20
@@ -917,6 +918,7 @@ static struct crypto_acomp_ctx *acomp_ctx_get_cpu_loc=
k(struct zswap_pool *pool)
 }
=20
 static void acomp_ctx_put_unlock(struct crypto_acomp_ctx *acomp_ctx)
+	NO_THREAD_SAFETY_ANALYSIS /* to match acomp_ctx_get_cpu_lock() */
 {
 	mutex_unlock(&acomp_ctx->mutex);
 }
diff --git a/net/atm/resources.c b/net/atm/resources.c
index 995d29e7fb13..50f199e7ffec 100644
--- a/net/atm/resources.c
+++ b/net/atm/resources.c
@@ -402,12 +402,14 @@ int atm_dev_ioctl(unsigned int cmd, void __user *bu=
f, int __user *sioc_len,
=20
 #ifdef CONFIG_PROC_FS
 void *atm_dev_seq_start(struct seq_file *seq, loff_t *pos)
+	ACQUIRE(atm_dev_mutex)
 {
 	mutex_lock(&atm_dev_mutex);
 	return seq_list_start_head(&atm_devs, *pos);
 }
=20
 void atm_dev_seq_stop(struct seq_file *seq, void *v)
+	RELEASE(atm_dev_mutex)
 {
 	mutex_unlock(&atm_dev_mutex);
 }
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 27b4c4a2ba1f..5a523ea20e05 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -116,6 +116,7 @@ static struct l2cap_chan *__l2cap_get_chan_by_scid(st=
ruct l2cap_conn *conn,
  */
 static struct l2cap_chan *l2cap_get_chan_by_scid(struct l2cap_conn *conn=
,
 						 u16 cid)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct l2cap_chan *c;
=20
@@ -137,6 +138,7 @@ static struct l2cap_chan *l2cap_get_chan_by_scid(stru=
ct l2cap_conn *conn,
  */
 static struct l2cap_chan *l2cap_get_chan_by_dcid(struct l2cap_conn *conn=
,
 						 u16 cid)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct l2cap_chan *c;
=20
@@ -3933,6 +3935,7 @@ static inline int l2cap_command_rej(struct l2cap_co=
nn *conn,
=20
 static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr =
*cmd,
 			  u8 *data, u8 rsp_code)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct l2cap_conn_req *req =3D (struct l2cap_conn_req *) data;
 	struct l2cap_conn_rsp rsp;
@@ -4204,6 +4207,7 @@ static void cmd_reject_invalid_cid(struct l2cap_con=
n *conn, u8 ident,
 static inline int l2cap_config_req(struct l2cap_conn *conn,
 				   struct l2cap_cmd_hdr *cmd, u16 cmd_len,
 				   u8 *data)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct l2cap_conf_req *req =3D (struct l2cap_conf_req *) data;
 	u16 dcid, flags;
@@ -4313,6 +4317,7 @@ static inline int l2cap_config_req(struct l2cap_con=
n *conn,
 static inline int l2cap_config_rsp(struct l2cap_conn *conn,
 				   struct l2cap_cmd_hdr *cmd, u16 cmd_len,
 				   u8 *data)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct l2cap_conf_rsp *rsp =3D (struct l2cap_conf_rsp *)data;
 	u16 scid, flags, result;
@@ -4420,6 +4425,7 @@ static inline int l2cap_config_rsp(struct l2cap_con=
n *conn,
 static inline int l2cap_disconnect_req(struct l2cap_conn *conn,
 				       struct l2cap_cmd_hdr *cmd, u16 cmd_len,
 				       u8 *data)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct l2cap_disconn_req *req =3D (struct l2cap_disconn_req *) data;
 	struct l2cap_disconn_rsp rsp;
@@ -4463,6 +4469,7 @@ static inline int l2cap_disconnect_req(struct l2cap=
_conn *conn,
 static inline int l2cap_disconnect_rsp(struct l2cap_conn *conn,
 				       struct l2cap_cmd_hdr *cmd, u16 cmd_len,
 				       u8 *data)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct l2cap_disconn_rsp *rsp =3D (struct l2cap_disconn_rsp *) data;
 	u16 dcid, scid;
@@ -4950,6 +4957,7 @@ static int l2cap_le_connect_req(struct l2cap_conn *=
conn,
 static inline int l2cap_le_credits(struct l2cap_conn *conn,
 				   struct l2cap_cmd_hdr *cmd, u16 cmd_len,
 				   u8 *data)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct l2cap_le_credits *pkt;
 	struct l2cap_chan *chan;
@@ -6673,6 +6681,7 @@ static int l2cap_ecred_data_rcv(struct l2cap_chan *=
chan, struct sk_buff *skb)
=20
 static void l2cap_data_channel(struct l2cap_conn *conn, u16 cid,
 			       struct sk_buff *skb)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct l2cap_chan *chan;
=20
diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index 46ea0bee2259..c2b5064c9547 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1298,6 +1298,7 @@ static int __l2cap_wait_ack(struct sock *sk, struct=
 l2cap_chan *chan)
 }
=20
 static int l2cap_sock_shutdown(struct socket *sock, int how)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct sock *sk =3D sock->sk;
 	struct l2cap_chan *chan;
@@ -1627,6 +1628,7 @@ static void l2cap_sock_state_change_cb(struct l2cap=
_chan *chan, int state,
 static struct sk_buff *l2cap_sock_alloc_skb_cb(struct l2cap_chan *chan,
 					       unsigned long hdr_len,
 					       unsigned long len, int nb)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct sock *sk =3D chan->data;
 	struct sk_buff *skb;
diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
index 913402806fa0..26e069997934 100644
--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -62,6 +62,7 @@ static void rfcomm_sk_data_ready(struct rfcomm_dlc *d, =
struct sk_buff *skb)
 }
=20
 static void rfcomm_sk_state_change(struct rfcomm_dlc *d, int err)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct sock *sk =3D d->owner, *parent;
=20
diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtab=
les.c
index 3e67d4aff419..772aae14d977 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -320,6 +320,7 @@ unsigned int ebt_do_table(void *priv, struct sk_buff =
*skb,
 static inline void *
 find_inlist_lock_noload(struct net *net, const char *name, int *error,
 			struct mutex *mutex)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ebt_pernet *ebt_net =3D net_generic(net, ebt_pernet_id);
 	struct ebt_template *tmpl;
@@ -1007,6 +1008,7 @@ static void get_counters(const struct ebt_counter *=
oldcounters,
=20
 static int do_replace_finish(struct net *net, struct ebt_replace *repl,
 			      struct ebt_table_info *newinfo)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int ret;
 	struct ebt_counter *counterstmp =3D NULL;
@@ -1378,6 +1380,7 @@ void ebt_unregister_table(struct net *net, const ch=
ar *name)
 static int do_update_counters(struct net *net, const char *name,
 			      struct ebt_counter __user *counters,
 			      unsigned int num_counters, unsigned int len)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int i, ret;
 	struct ebt_counter *tmp;
@@ -2371,6 +2374,7 @@ static int compat_update_counters(struct net *net, =
sockptr_t arg,
=20
 static int compat_do_ebt_get_ctl(struct sock *sk, int cmd,
 		void __user *user, int *len)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int ret;
 	struct compat_ebt_replace tmp;
@@ -2443,6 +2447,7 @@ static int compat_do_ebt_get_ctl(struct sock *sk, i=
nt cmd,
 #endif
=20
 static int do_ebt_get_ctl(struct sock *sk, int cmd, void __user *user, i=
nt *len)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct net *net =3D sock_net(sk);
 	struct ebt_replace tmp;
diff --git a/net/caif/caif_socket.c b/net/caif/caif_socket.c
index 039dfbd367c9..b83dbc9c1d19 100644
--- a/net/caif/caif_socket.c
+++ b/net/caif/caif_socket.c
@@ -86,6 +86,7 @@ static void set_tx_flow_on(struct caifsock *cf_sk)
 }
=20
 static void caif_read_lock(struct sock *sk)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct caifsock *cf_sk;
 	cf_sk =3D container_of(sk, struct caifsock, sk);
@@ -93,6 +94,7 @@ static void caif_read_lock(struct sock *sk)
 }
=20
 static void caif_read_unlock(struct sock *sk)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct caifsock *cf_sk;
 	cf_sk =3D container_of(sk, struct caifsock, sk);
diff --git a/net/can/j1939/main.c b/net/can/j1939/main.c
index 7e8a20f2fc42..4f649050c0eb 100644
--- a/net/can/j1939/main.c
+++ b/net/can/j1939/main.c
@@ -209,6 +209,7 @@ static void j1939_can_rx_unregister(struct j1939_priv=
 *priv)
=20
 static void __j1939_rx_release(struct kref *kref)
 	__releases(&j1939_netdev_lock)
+	RELEASE(j1939_netdev_lock)
 {
 	struct j1939_priv *priv =3D container_of(kref, struct j1939_priv,
 					       rx_kref);
@@ -228,6 +229,7 @@ static inline struct j1939_priv *j1939_ndev_to_priv(s=
truct net_device *ndev)
 }
=20
 static struct j1939_priv *j1939_priv_get_by_ndev_locked(struct net_devic=
e *ndev)
+	REQUIRES(j1939_netdev_lock)
 {
 	struct j1939_priv *priv;
=20
diff --git a/net/ceph/messenger.c b/net/ceph/messenger.c
index d1b5705dc0c6..c173ae8d1f58 100644
--- a/net/ceph/messenger.c
+++ b/net/ceph/messenger.c
@@ -1399,6 +1399,7 @@ int ceph_parse_ips(const char *c, const char *end,
  * may deadlock.
  */
 void ceph_con_process_message(struct ceph_connection *con)
+	REQUIRES(con->mutex)
 {
 	struct ceph_msg *msg =3D con->in_msg;
=20
@@ -1517,6 +1518,7 @@ static bool con_backoff(struct ceph_connection *con=
)
 /* Finish fault handling; con->mutex must *not* be held here */
=20
 static void con_fault_finish(struct ceph_connection *con)
+	EXCLUDES(con->mutex)
 {
 	dout("%s %p\n", __func__, con);
=20
@@ -2064,6 +2066,7 @@ static int ceph_alloc_middle(struct ceph_connection=
 *con, struct ceph_msg *msg)
  */
 int ceph_con_in_msg_alloc(struct ceph_connection *con,
 			  struct ceph_msg_header *hdr, int *skip)
+	REQUIRES(con->mutex)
 {
 	int middle_len =3D le32_to_cpu(hdr->middle_len);
 	struct ceph_msg *msg;
diff --git a/net/ceph/messenger_v1.c b/net/ceph/messenger_v1.c
index 0cb61c76b9b8..cdfb19a39df2 100644
--- a/net/ceph/messenger_v1.c
+++ b/net/ceph/messenger_v1.c
@@ -742,6 +742,7 @@ static int process_banner(struct ceph_connection *con=
)
 }
=20
 static int process_connect(struct ceph_connection *con)
+	REQUIRES(con->mutex)
 {
 	u64 sup_feat =3D from_msgr(con->msgr)->supported_features;
 	u64 req_feat =3D from_msgr(con->msgr)->required_features;
@@ -1324,6 +1325,7 @@ static int read_keepalive_ack(struct ceph_connectio=
n *con)
  * Read what we can from the socket.
  */
 int ceph_con_v1_try_read(struct ceph_connection *con)
+	REQUIRES(con->mutex)
 {
 	int ret =3D -1;
=20
diff --git a/net/ceph/messenger_v2.c b/net/ceph/messenger_v2.c
index bd608ffa0627..9c1b1d7ce74e 100644
--- a/net/ceph/messenger_v2.c
+++ b/net/ceph/messenger_v2.c
@@ -1385,6 +1385,7 @@ static int prepare_hello(struct ceph_connection *co=
n)
 #define AUTH_BUF_LEN	(512 - CEPH_CRC_LEN - CEPH_PREAMBLE_PLAIN_LEN)
=20
 static int prepare_auth_request(struct ceph_connection *con)
+	REQUIRES(con->mutex)
 {
 	void *authorizer, *authorizer_copy;
 	int ctrl_len, authorizer_len;
@@ -1422,6 +1423,7 @@ static int prepare_auth_request(struct ceph_connect=
ion *con)
=20
 static int prepare_auth_request_more(struct ceph_connection *con,
 				     void *reply, int reply_len)
+	REQUIRES(con->mutex)
 {
 	int ctrl_len, authorizer_len;
 	void *authorizer;
@@ -2219,6 +2221,7 @@ static int process_banner_payload(struct ceph_conne=
ction *con)
 }
=20
 static int process_hello(struct ceph_connection *con, void *p, void *end=
)
+	REQUIRES(con->mutex)
 {
 	struct ceph_entity_addr *my_addr =3D &con->msgr->inst.addr;
 	struct ceph_entity_addr addr_for_me;
@@ -2287,6 +2290,7 @@ static int process_hello(struct ceph_connection *co=
n, void *p, void *end)
=20
 static int process_auth_bad_method(struct ceph_connection *con,
 				   void *p, void *end)
+	REQUIRES(con->mutex)
 {
 	int allowed_protos[8], allowed_modes[8];
 	int allowed_proto_cnt, allowed_mode_cnt;
@@ -2349,6 +2353,7 @@ static int process_auth_bad_method(struct ceph_conn=
ection *con,
=20
 static int process_auth_reply_more(struct ceph_connection *con,
 				   void *p, void *end)
+	REQUIRES(con->mutex)
 {
 	int payload_len;
 	int ret;
@@ -2385,6 +2390,7 @@ static int process_auth_reply_more(struct ceph_conn=
ection *con,
  * objects, so do it by hand.
  */
 static int process_auth_done(struct ceph_connection *con, void *p, void =
*end)
+	REQUIRES(con->mutex)
 {
 	u8 session_key_buf[CEPH_KEY_LEN + 16];
 	u8 con_secret_buf[CEPH_MAX_CON_SECRET_LEN + 16];
@@ -2702,6 +2708,7 @@ static int process_session_retry_global(struct ceph=
_connection *con,
=20
 static int process_session_reset(struct ceph_connection *con,
 				 void *p, void *end)
+	REQUIRES(con->mutex)
 {
 	bool full;
 	int ret;
@@ -2790,6 +2797,7 @@ static int process_ack(struct ceph_connection *con,=
 void *p, void *end)
 }
=20
 static int process_control(struct ceph_connection *con, void *p, void *e=
nd)
+	REQUIRES(con->mutex)
 {
 	int tag =3D con->v2.in_desc.fd_tag;
 	int ret;
@@ -2917,6 +2925,7 @@ static int process_message(struct ceph_connection *=
con)
 }
=20
 static int __handle_control(struct ceph_connection *con, void *p)
+	REQUIRES(con->mutex)
 {
 	void *end =3D p + con->v2.in_desc.fd_lens[0];
 	struct ceph_msg *msg;
@@ -2957,6 +2966,7 @@ static int __handle_control(struct ceph_connection =
*con, void *p)
 }
=20
 static int handle_preamble(struct ceph_connection *con)
+	REQUIRES(con->mutex)
 {
 	struct ceph_frame_desc *desc =3D &con->v2.in_desc;
 	int ret;
@@ -2993,6 +3003,7 @@ static int handle_preamble(struct ceph_connection *=
con)
 }
=20
 static int handle_control(struct ceph_connection *con)
+	REQUIRES(con->mutex)
 {
 	int ctrl_len =3D con->v2.in_desc.fd_lens[0];
 	void *buf;
@@ -3019,6 +3030,7 @@ static int handle_control(struct ceph_connection *c=
on)
 }
=20
 static int handle_control_remainder(struct ceph_connection *con)
+	REQUIRES(con->mutex)
 {
 	int ret;
=20
@@ -3084,6 +3096,7 @@ static void finish_skip(struct ceph_connection *con=
)
 }
=20
 static int populate_in_iter(struct ceph_connection *con)
+	REQUIRES(con->mutex)
 {
 	int ret;
=20
@@ -3153,6 +3166,7 @@ static int populate_in_iter(struct ceph_connection =
*con)
 }
=20
 int ceph_con_v2_try_read(struct ceph_connection *con)
+	REQUIRES(con->mutex)
 {
 	int ret;
=20
diff --git a/net/core/dev.c b/net/core/dev.c
index c0021cbd28fc..1bad0eed5fb0 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -797,6 +797,7 @@ netdev_napi_by_id(struct net *net, unsigned int napi_=
id)
  */
 struct napi_struct *
 netdev_napi_by_id_lock(struct net *net, unsigned int napi_id)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct napi_struct *napi;
 	struct net_device *dev;
@@ -1024,6 +1025,7 @@ struct net_device *dev_get_by_napi_id(unsigned int =
napi_id)
  * using a lockless lookup helper. Lock prevents the instance from going=
 away.
  */
 struct net_device *__netdev_put_lock(struct net_device *dev)
+	NO_THREAD_SAFETY_ANALYSIS /* TRY_ACQUIRE() does not support pointers */
 {
 	netdev_lock(dev);
 	if (dev->reg_state > NETREG_REGISTERED) {
@@ -1060,6 +1062,7 @@ struct net_device *netdev_get_by_index_lock(struct =
net *net, int ifindex)
 struct net_device *
 netdev_xa_find_lock(struct net *net, struct net_device *dev,
 		    unsigned long *index)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (dev)
 		netdev_unlock(dev);
@@ -6186,6 +6189,7 @@ static struct flush_backlogs *flush_backlogs_fallba=
ck;
 static DEFINE_MUTEX(flush_backlogs_mutex);
=20
 static void flush_all_backlogs(void)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct flush_backlogs *ptr =3D flush_backlogs_alloc();
 	unsigned int cpu;
diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
index 6efd4cccc9dd..0947be1c2763 100644
--- a/net/core/drop_monitor.c
+++ b/net/core/drop_monitor.c
@@ -1642,6 +1642,7 @@ static const struct genl_small_ops dropmon_ops[] =3D=
 {
=20
 static int net_dm_nl_pre_doit(const struct genl_split_ops *ops,
 			      struct sk_buff *skb, struct genl_info *info)
+	ACQUIRE(net_dm_mutex)
 {
 	mutex_lock(&net_dm_mutex);
=20
@@ -1650,6 +1651,7 @@ static int net_dm_nl_pre_doit(const struct genl_spl=
it_ops *ops,
=20
 static void net_dm_nl_post_doit(const struct genl_split_ops *ops,
 				struct sk_buff *skb, struct genl_info *info)
+	RELEASE(net_dm_mutex)
 {
 	mutex_unlock(&net_dm_mutex);
 }
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 715f85c6b62e..77034e48b0d4 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -214,6 +214,7 @@ netdev_nl_napi_fill_one(struct sk_buff *rsp, struct n=
api_struct *napi,
 }
=20
 int netdev_nl_napi_get_doit(struct sk_buff *skb, struct genl_info *info)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct napi_struct *napi;
 	struct sk_buff *rsp;
@@ -285,6 +286,7 @@ netdev_nl_napi_dump_one(struct net_device *netdev, st=
ruct sk_buff *rsp,
 }
=20
 int netdev_nl_napi_get_dumpit(struct sk_buff *skb, struct netlink_callba=
ck *cb)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct netdev_nl_dump_ctx *ctx =3D netdev_dump_ctx(cb);
 	const struct genl_info *info =3D genl_info_dump(cb);
@@ -342,6 +344,7 @@ netdev_nl_napi_set_config(struct napi_struct *napi, s=
truct genl_info *info)
 }
=20
 int netdev_nl_napi_set_doit(struct sk_buff *skb, struct genl_info *info)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct napi_struct *napi;
 	unsigned int napi_id;
@@ -443,6 +446,7 @@ netdev_nl_queue_fill(struct sk_buff *rsp, struct net_=
device *netdev, u32 q_idx,
 }
=20
 int netdev_nl_queue_get_doit(struct sk_buff *skb, struct genl_info *info=
)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	u32 q_id, q_type, ifindex;
 	struct net_device *netdev;
@@ -511,6 +515,7 @@ netdev_nl_queue_dump_one(struct net_device *netdev, s=
truct sk_buff *rsp,
 }
=20
 int netdev_nl_queue_get_dumpit(struct sk_buff *skb, struct netlink_callb=
ack *cb)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct netdev_nl_dump_ctx *ctx =3D netdev_dump_ctx(cb);
 	const struct genl_info *info =3D genl_info_dump(cb);
diff --git a/net/core/pktgen.c b/net/core/pktgen.c
index 82b6a2c3c141..0414c95335c8 100644
--- a/net/core/pktgen.c
+++ b/net/core/pktgen.c
@@ -3221,6 +3221,7 @@ static int thread_is_running(const struct pktgen_th=
read *t)
 }
=20
 static int pktgen_wait_thread_run(struct pktgen_thread *t)
+	REQUIRES(pktgen_thread_lock)
 {
 	while (thread_is_running(t)) {
=20
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index 1f4d4b5570ab..633c210066a7 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -75,12 +75,14 @@ struct rtnl_link {
 static DEFINE_MUTEX(rtnl_mutex);
=20
 void rtnl_lock(void)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_lock(&rtnl_mutex);
 }
 EXPORT_SYMBOL(rtnl_lock);
=20
 int rtnl_lock_killable(void)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	return mutex_lock_killable(&rtnl_mutex);
 }
@@ -96,6 +98,7 @@ void rtnl_kfree_skbs(struct sk_buff *head, struct sk_bu=
ff *tail)
 EXPORT_SYMBOL(rtnl_kfree_skbs);
=20
 void __rtnl_unlock(void)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct sk_buff *head =3D defer_kfree_skb_list;
=20
@@ -165,6 +168,7 @@ int rtnl_is_locked(void)
 EXPORT_SYMBOL(rtnl_is_locked);
=20
 bool refcount_dec_and_rtnl_lock(refcount_t *r)
+	TRY_ACQUIRE(true, rtnl_mutex)
 {
 	return refcount_dec_and_mutex_lock(r, &rtnl_mutex);
 }
@@ -180,6 +184,7 @@ EXPORT_SYMBOL(lockdep_rtnl_is_held);
=20
 #ifdef CONFIG_DEBUG_NET_SMALL_RTNL
 void __rtnl_net_lock(struct net *net)
+	ACQUIRE(net->rtnl_mutex)
 {
 	ASSERT_RTNL();
=20
@@ -188,6 +193,7 @@ void __rtnl_net_lock(struct net *net)
 EXPORT_SYMBOL(__rtnl_net_lock);
=20
 void __rtnl_net_unlock(struct net *net)
+	RELEASE(net->rtnl_mutex)
 {
 	ASSERT_RTNL();
=20
@@ -196,6 +202,7 @@ void __rtnl_net_unlock(struct net *net)
 EXPORT_SYMBOL(__rtnl_net_unlock);
=20
 void rtnl_net_lock(struct net *net)
+	ACQUIRE(net->rtnl_mutex)
 {
 	rtnl_lock();
 	__rtnl_net_lock(net);
@@ -203,6 +210,7 @@ void rtnl_net_lock(struct net *net)
 EXPORT_SYMBOL(rtnl_net_lock);
=20
 void rtnl_net_unlock(struct net *net)
+	RELEASE(net->rtnl_mutex)
 {
 	__rtnl_net_unlock(net);
 	rtnl_unlock();
@@ -210,6 +218,7 @@ void rtnl_net_unlock(struct net *net)
 EXPORT_SYMBOL(rtnl_net_unlock);
=20
 int rtnl_net_trylock(struct net *net)
+	TRY_ACQUIRE(1, net->rtnl_mutex)
 {
 	int ret =3D rtnl_trylock();
=20
@@ -221,6 +230,7 @@ int rtnl_net_trylock(struct net *net)
 EXPORT_SYMBOL(rtnl_net_trylock);
=20
 int rtnl_net_lock_killable(struct net *net)
+	TRY_ACQUIRE(0, net->rtnl_mutex)
 {
 	int ret =3D rtnl_lock_killable();
=20
@@ -329,6 +339,7 @@ static void rtnl_nets_add(struct rtnl_nets *rtnl_nets=
, struct net *net)
 }
=20
 static void rtnl_nets_lock(struct rtnl_nets *rtnl_nets)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int i;
=20
@@ -339,6 +350,7 @@ static void rtnl_nets_lock(struct rtnl_nets *rtnl_net=
s)
 }
=20
 static void rtnl_nets_unlock(struct rtnl_nets *rtnl_nets)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int i;
=20
diff --git a/net/core/sock.c b/net/core/sock.c
index eae2ae70a2e0..db0de206134e 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -4143,6 +4143,7 @@ EXPORT_SYMBOL(sock_load_diag_module);
 #ifdef CONFIG_PROC_FS
 static void *proto_seq_start(struct seq_file *seq, loff_t *pos)
 	__acquires(proto_list_mutex)
+	ACQUIRE(proto_list_mutex)
 {
 	mutex_lock(&proto_list_mutex);
 	return seq_list_start_head(&proto_list, *pos);
@@ -4155,6 +4156,7 @@ static void *proto_seq_next(struct seq_file *seq, v=
oid *v, loff_t *pos)
=20
 static void proto_seq_stop(struct seq_file *seq, void *v)
 	__releases(proto_list_mutex)
+	RELEASE(proto_list_mutex)
 {
 	mutex_unlock(&proto_list_mutex);
 }
diff --git a/net/devlink/core.c b/net/devlink/core.c
index f49cd83f1955..ac20168317cb 100644
--- a/net/devlink/core.c
+++ b/net/devlink/core.c
@@ -272,18 +272,21 @@ EXPORT_SYMBOL_GPL(devl_lock_is_held);
 #endif
=20
 void devl_lock(struct devlink *devlink)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_lock(&devlink->lock);
 }
 EXPORT_SYMBOL_GPL(devl_lock);
=20
 int devl_trylock(struct devlink *devlink)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	return mutex_trylock(&devlink->lock);
 }
 EXPORT_SYMBOL_GPL(devl_trylock);
=20
 void devl_unlock(struct devlink *devlink)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(&devlink->lock);
 }
diff --git a/net/devlink/devl_internal.h b/net/devlink/devl_internal.h
index 14eaad9cfe35..3470bbb4e850 100644
--- a/net/devlink/devl_internal.h
+++ b/net/devlink/devl_internal.h
@@ -103,6 +103,7 @@ static inline bool devl_is_registered(struct devlink =
*devlink)
 }
=20
 static inline void devl_dev_lock(struct devlink *devlink, bool dev_lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (dev_lock)
 		device_lock(devlink->dev);
@@ -110,6 +111,7 @@ static inline void devl_dev_lock(struct devlink *devl=
ink, bool dev_lock)
 }
=20
 static inline void devl_dev_unlock(struct devlink *devlink, bool dev_loc=
k)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	devl_unlock(devlink);
 	if (dev_lock)
diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
index 34bee42e1247..be53962fe4ae 100644
--- a/net/ethtool/ioctl.c
+++ b/net/ethtool/ioctl.c
@@ -1347,6 +1347,7 @@ ethtool_rxfh_ctx_alloc(const struct ethtool_ops *op=
s,
=20
 static noinline_for_stack int ethtool_set_rxfh(struct net_device *dev,
 					       void __user *useraddr)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	u32 rss_cfg_offset =3D offsetof(struct ethtool_rxfh, rss_config[0]);
 	const struct ethtool_ops *ops =3D dev->ethtool_ops;
diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
index 9dfdb40988b0..2336fef5e096 100644
--- a/net/ipv6/mcast.c
+++ b/net/ipv6/mcast.c
@@ -2632,6 +2632,7 @@ static void igmp6_join_group(struct ifmcaddr6 *ma)
=20
 static int ip6_mc_leave_src(struct sock *sk, struct ipv6_mc_socklist *im=
l,
 			    struct inet6_dev *idev)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ip6_sf_socklist *psl;
 	int err;
diff --git a/net/mac802154/cfg.c b/net/mac802154/cfg.c
index ef7f23af043f..1070209ca29b 100644
--- a/net/mac802154/cfg.c
+++ b/net/mac802154/cfg.c
@@ -503,6 +503,7 @@ ieee802154_get_llsec_table(struct wpan_phy *wpan_phy,
 static void
 ieee802154_lock_llsec_table(struct wpan_phy *wpan_phy,
 			    struct wpan_dev *wpan_dev)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct net_device *dev =3D wpan_dev->netdev;
 	struct ieee802154_sub_if_data *sdata =3D IEEE802154_DEV_TO_SUB_IF(dev);
@@ -513,6 +514,7 @@ ieee802154_lock_llsec_table(struct wpan_phy *wpan_phy=
,
 static void
 ieee802154_unlock_llsec_table(struct wpan_phy *wpan_phy,
 			      struct wpan_dev *wpan_dev)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct net_device *dev =3D wpan_dev->netdev;
 	struct ieee802154_sub_if_data *sdata =3D IEEE802154_DEV_TO_SUB_IF(dev);
diff --git a/net/mac802154/mib.c b/net/mac802154/mib.c
index 81666e1d779d..ba2e974a4747 100644
--- a/net/mac802154/mib.c
+++ b/net/mac802154/mib.c
@@ -191,6 +191,7 @@ int mac802154_del_seclevel(struct net_device *dev,
 }
=20
 void mac802154_lock_table(struct net_device *dev)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ieee802154_sub_if_data *sdata =3D IEEE802154_DEV_TO_SUB_IF(dev);
=20
@@ -210,6 +211,7 @@ void mac802154_get_table(struct net_device *dev,
 }
=20
 void mac802154_unlock_table(struct net_device *dev)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ieee802154_sub_if_data *sdata =3D IEEE802154_DEV_TO_SUB_IF(dev);
=20
diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_s=
et_core.c
index cc20e6d56807..47b01fd794a5 100644
--- a/net/netfilter/ipset/ip_set_core.c
+++ b/net/netfilter/ipset/ip_set_core.c
@@ -72,12 +72,14 @@ MODULE_ALIAS_NFNL_SUBSYS(NFNL_SUBSYS_IPSET);
=20
 static void
 ip_set_type_lock(void)
+	ACQUIRE(ip_set_type_mutex)
 {
 	mutex_lock(&ip_set_type_mutex);
 }
=20
 static void
 ip_set_type_unlock(void)
+	RELEASE(ip_set_type_mutex)
 {
 	mutex_unlock(&ip_set_type_mutex);
 }
diff --git a/net/netfilter/ipvs/ip_vs_app.c b/net/netfilter/ipvs/ip_vs_ap=
p.c
index fdacbc3c15be..220a9479e807 100644
--- a/net/netfilter/ipvs/ip_vs_app.c
+++ b/net/netfilter/ipvs/ip_vs_app.c
@@ -531,6 +531,7 @@ static struct ip_vs_app *ip_vs_app_idx(struct netns_i=
pvs *ipvs, loff_t pos)
 }
=20
 static void *ip_vs_app_seq_start(struct seq_file *seq, loff_t *pos)
+	ACQUIRE(__ip_vs_app_mutex)
 {
 	struct net *net =3D seq_file_net(seq);
 	struct netns_ipvs *ipvs =3D net_ipvs(net);
@@ -568,6 +569,7 @@ static void *ip_vs_app_seq_next(struct seq_file *seq,=
 void *v, loff_t *pos)
 }
=20
 static void ip_vs_app_seq_stop(struct seq_file *seq, void *v)
+	RELEASE(__ip_vs_app_mutex)
 {
 	mutex_unlock(&__ip_vs_app_mutex);
 }
diff --git a/net/netfilter/nf_log.c b/net/netfilter/nf_log.c
index 6dd0de33eebd..c2166058eef8 100644
--- a/net/netfilter/nf_log.c
+++ b/net/netfilter/nf_log.c
@@ -320,6 +320,7 @@ EXPORT_SYMBOL_GPL(nf_log_buf_close);
=20
 #ifdef CONFIG_PROC_FS
 static void *seq_start(struct seq_file *seq, loff_t *pos)
+	ACQUIRE(nf_log_mutex)
 {
 	struct net *net =3D seq_file_net(seq);
=20
@@ -344,6 +345,7 @@ static void *seq_next(struct seq_file *s, void *v, lo=
ff_t *pos)
 }
=20
 static void seq_stop(struct seq_file *s, void *v)
+	RELEASE(nf_log_mutex)
 {
 	mutex_unlock(&nf_log_mutex);
 }
diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.=
c
index a34de9c17cf1..f7587dfc9bc2 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -10460,6 +10460,7 @@ static void nf_tables_module_autoload_cleanup(str=
uct net *net)
 }
=20
 static void nf_tables_commit_release(struct net *net)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nftables_pernet *nft_net =3D nft_pernet(net);
 	struct nft_trans *trans;
@@ -10636,6 +10637,7 @@ static void nft_gc_seq_end(struct nftables_pernet=
 *nft_net, unsigned int gc_seq)
 }
=20
 static int nf_tables_commit(struct net *net, struct sk_buff *skb)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nftables_pernet *nft_net =3D nft_pernet(net);
 	const struct nlmsghdr *nlh =3D nlmsg_hdr(skb);
@@ -10949,6 +10951,7 @@ static int nf_tables_commit(struct net *net, stru=
ct sk_buff *skb)
 }
=20
 static void nf_tables_module_autoload(struct net *net)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nftables_pernet *nft_net =3D nft_pernet(net);
 	struct nft_module_request *req, *next;
@@ -11232,6 +11235,7 @@ static int __nf_tables_abort(struct net *net, enu=
m nfnl_abort_action action)
=20
 static int nf_tables_abort(struct net *net, struct sk_buff *skb,
 			   enum nfnl_abort_action action)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nftables_pernet *nft_net =3D nft_pernet(net);
 	unsigned int gc_seq;
@@ -11257,6 +11261,7 @@ static int nf_tables_abort(struct net *net, struc=
t sk_buff *skb,
 }
=20
 static bool nf_tables_valid_genid(struct net *net, u32 genid)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nftables_pernet *nft_net =3D nft_pernet(net);
 	bool genid_ok;
diff --git a/net/netfilter/nfnetlink.c b/net/netfilter/nfnetlink.c
index e598a2a252b0..d1fc9338a08f 100644
--- a/net/netfilter/nfnetlink.c
+++ b/net/netfilter/nfnetlink.c
@@ -94,12 +94,14 @@ static struct nfnl_net *nfnl_pernet(struct net *net)
 }
=20
 void nfnl_lock(__u8 subsys_id)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_lock(&table[subsys_id].mutex);
 }
 EXPORT_SYMBOL_GPL(nfnl_lock);
=20
 void nfnl_unlock(__u8 subsys_id)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(&table[subsys_id].mutex);
 }
diff --git a/net/netfilter/x_tables.c b/net/netfilter/x_tables.c
index 709840612f0d..220e6d929172 100644
--- a/net/netfilter/x_tables.c
+++ b/net/netfilter/x_tables.c
@@ -1234,6 +1234,7 @@ EXPORT_SYMBOL(xt_find_table);
 /* Find table by name, grabs mutex & ref.  Returns ERR_PTR on error. */
 struct xt_table *xt_find_table_lock(struct net *net, u_int8_t af,
 				    const char *name)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct xt_pernet *xt_net =3D net_generic(net, xt_pernet_id);
 	struct module *owner =3D NULL;
@@ -1298,6 +1299,7 @@ struct xt_table *xt_request_find_table_lock(struct =
net *net, u_int8_t af,
 EXPORT_SYMBOL_GPL(xt_request_find_table_lock);
=20
 void xt_table_unlock(struct xt_table *table)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(&xt[table->af].mutex);
 }
@@ -1305,12 +1307,14 @@ EXPORT_SYMBOL_GPL(xt_table_unlock);
=20
 #ifdef CONFIG_NETFILTER_XTABLES_COMPAT
 void xt_compat_lock(u_int8_t af)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_lock(&xt[af].compat_mutex);
 }
 EXPORT_SYMBOL_GPL(xt_compat_lock);
=20
 void xt_compat_unlock(u_int8_t af)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(&xt[af].compat_mutex);
 }
@@ -1517,6 +1521,7 @@ EXPORT_SYMBOL_GPL(xt_unregister_table);
=20
 #ifdef CONFIG_PROC_FS
 static void *xt_table_seq_start(struct seq_file *seq, loff_t *pos)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	u8 af =3D (unsigned long)pde_data(file_inode(seq->file));
 	struct net *net =3D seq_file_net(seq);
@@ -1540,6 +1545,7 @@ static void *xt_table_seq_next(struct seq_file *seq=
, void *v, loff_t *pos)
 }
=20
 static void xt_table_seq_stop(struct seq_file *seq, void *v)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	u_int8_t af =3D (unsigned long)pde_data(file_inode(seq->file));
=20
@@ -1580,6 +1586,7 @@ enum {
=20
 static void *xt_mttg_seq_next(struct seq_file *seq, void *v, loff_t *ppo=
s,
     bool is_target)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	static const uint8_t next_class[] =3D {
 		[MTTG_TRAV_NFP_UNSPEC] =3D MTTG_TRAV_NFP_SPEC,
@@ -1633,6 +1640,7 @@ static void *xt_mttg_seq_start(struct seq_file *seq=
, loff_t *pos,
 }
=20
 static void xt_mttg_seq_stop(struct seq_file *seq, void *v)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	uint8_t nfproto =3D (unsigned long)pde_data(file_inode(seq->file));
 	struct nf_mttg_trav *trav =3D seq->private;
diff --git a/net/netfilter/xt_hashlimit.c b/net/netfilter/xt_hashlimit.c
index fa02aab56724..4d48cc462f07 100644
--- a/net/netfilter/xt_hashlimit.c
+++ b/net/netfilter/xt_hashlimit.c
@@ -424,6 +424,7 @@ static struct xt_hashlimit_htable *htable_find_get(st=
ruct net *net,
 }
=20
 static void htable_put(struct xt_hashlimit_htable *hinfo)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	if (refcount_dec_and_mutex_lock(&hinfo->use, &hashlimit_mutex)) {
 		hlist_del(&hinfo->node);
diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 85311226183a..3edc8a261bf9 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -2249,6 +2249,7 @@ static int netlink_dump_done(struct netlink_sock *n=
lk, struct sk_buff *skb,
 }
=20
 static int netlink_dump(struct sock *sk, bool lock_taken)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct netlink_sock *nlk =3D nlk_sk(sk);
 	struct netlink_ext_ack extack =3D {};
@@ -2379,6 +2380,7 @@ static int netlink_dump(struct sock *sk, bool lock_=
taken)
 int __netlink_dump_start(struct sock *ssk, struct sk_buff *skb,
 			 const struct nlmsghdr *nlh,
 			 struct netlink_dump_control *control)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct netlink_callback *cb;
 	struct netlink_sock *nlk;
diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index 104732d34543..746c0faaafd3 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -31,36 +31,42 @@ atomic_t genl_sk_destructing_cnt =3D ATOMIC_INIT(0);
 DECLARE_WAIT_QUEUE_HEAD(genl_sk_destructing_waitq);
=20
 void genl_lock(void)
+	ACQUIRE(genl_mutex)
 {
 	mutex_lock(&genl_mutex);
 }
 EXPORT_SYMBOL(genl_lock);
=20
 void genl_unlock(void)
+	RELEASE(genl_mutex)
 {
 	mutex_unlock(&genl_mutex);
 }
 EXPORT_SYMBOL(genl_unlock);
=20
 static void genl_lock_all(void)
+	ACQUIRE(genl_mutex)
 {
 	down_write(&cb_lock);
 	genl_lock();
 }
=20
 static void genl_unlock_all(void)
+	RELEASE(genl_mutex)
 {
 	genl_unlock();
 	up_write(&cb_lock);
 }
=20
 static void genl_op_lock(const struct genl_family *family)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (!family->parallel_ops)
 		genl_lock();
 }
=20
 static void genl_op_unlock(const struct genl_family *family)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (!family->parallel_ops)
 		genl_unlock();
@@ -1427,6 +1433,7 @@ static const struct nla_policy ctrl_policy_family[]=
 =3D {
 };
=20
 static int ctrl_getfamily(struct sk_buff *skb, struct genl_info *info)
+	REQUIRES(genl_mutex)
 {
 	struct sk_buff *msg;
 	const struct genl_family *res =3D NULL;
diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index 225f6048867f..dfa184cf347b 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -104,11 +104,13 @@ static void ovs_notify(struct genl_family *family,
 static DEFINE_MUTEX(ovs_mutex);
=20
 void ovs_lock(void)
+	ACQUIRE(ovs_mutex)
 {
 	mutex_lock(&ovs_mutex);
 }
=20
 void ovs_unlock(void)
+	RELEASE(ovs_mutex)
 {
 	mutex_unlock(&ovs_mutex);
 }
diff --git a/net/phonet/socket.c b/net/phonet/socket.c
index 5ce0b3ee5def..c85fc6b32412 100644
--- a/net/phonet/socket.c
+++ b/net/phonet/socket.c
@@ -721,6 +721,7 @@ static struct sock **pn_res_get_next(struct seq_file =
*seq, struct sock **sk)
=20
 static void *pn_res_seq_start(struct seq_file *seq, loff_t *pos)
 	__acquires(resource_mutex)
+	ACQUIRE(resource_mutex)
 {
 	mutex_lock(&resource_mutex);
 	return *pos ? pn_res_get_idx(seq, *pos - 1) : SEQ_START_TOKEN;
@@ -740,6 +741,7 @@ static void *pn_res_seq_next(struct seq_file *seq, vo=
id *v, loff_t *pos)
=20
 static void pn_res_seq_stop(struct seq_file *seq, void *v)
 	__releases(resource_mutex)
+	RELEASE(resource_mutex)
 {
 	mutex_unlock(&resource_mutex);
 }
diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 00c51cf693f3..7669f5a0829d 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -166,6 +166,7 @@ static void qrtr_port_put(struct qrtr_sock *ipc);
  * kref_put_mutex.  As such, the node mutex is expected to be locked on =
call.
  */
 static void __qrtr_node_release(struct kref *kref)
+	RELEASE(qrtr_node_lock)
 {
 	struct qrtr_node *node =3D container_of(kref, struct qrtr_node, ref);
 	struct radix_tree_iter iter;
diff --git a/net/rds/ib_cm.c b/net/rds/ib_cm.c
index 26b069e1999d..8f641339383b 100644
--- a/net/rds/ib_cm.c
+++ b/net/rds/ib_cm.c
@@ -781,6 +781,7 @@ static u32 __rds_find_ifindex(struct net *net, const =
struct in6_addr *addr)
=20
 int rds_ib_cm_handle_connect(struct rdma_cm_id *cm_id,
 			     struct rdma_cm_event *event, bool isv6)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	__be64 lguid =3D cm_id->route.path_rec->sgid.global.interface_id;
 	__be64 fguid =3D cm_id->route.path_rec->dgid.global.interface_id;
diff --git a/net/rds/rdma_transport.c b/net/rds/rdma_transport.c
index b15cf316b23a..06fe949e3bb0 100644
--- a/net/rds/rdma_transport.c
+++ b/net/rds/rdma_transport.c
@@ -49,6 +49,7 @@ static struct rdma_cm_id *rds6_rdma_listen_id;
 static int rds_rdma_cm_event_handler_cmn(struct rdma_cm_id *cm_id,
 					 struct rdma_cm_event *event,
 					 bool isv6)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	/* this can be null in the listening path */
 	struct rds_connection *conn =3D cm_id->context;
diff --git a/net/rds/tcp_listen.c b/net/rds/tcp_listen.c
index d89bd8d0c354..e2a77b73d524 100644
--- a/net/rds/tcp_listen.c
+++ b/net/rds/tcp_listen.c
@@ -96,6 +96,7 @@ struct rds_tcp_connection *rds_tcp_accept_one_path(stru=
ct rds_connection *conn)
 }
=20
 int rds_tcp_accept_one(struct socket *sock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct socket *new_sock =3D NULL;
 	struct rds_connection *conn;
diff --git a/net/rxrpc/af_rxrpc.c b/net/rxrpc/af_rxrpc.c
index 86873399f7d5..359461e83c19 100644
--- a/net/rxrpc/af_rxrpc.c
+++ b/net/rxrpc/af_rxrpc.c
@@ -337,6 +337,7 @@ struct rxrpc_call *rxrpc_kernel_begin_call(struct soc=
ket *sock,
 					   bool upgrade,
 					   enum rxrpc_interruptibility interruptibility,
 					   unsigned int debug_id)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct rxrpc_conn_parameters cp;
 	struct rxrpc_call_params p;
diff --git a/net/rxrpc/call_object.c b/net/rxrpc/call_object.c
index 5a543c3f6fb0..f7f6fdcf70eb 100644
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -325,6 +325,7 @@ struct rxrpc_call *rxrpc_new_client_call(struct rxrpc=
_sock *rx,
 					 unsigned int debug_id)
 	__releases(&rx->sk.sk_lock.slock)
 	__acquires(&call->user_mutex)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct rxrpc_call *call, *xcall;
 	struct rxrpc_net *rxnet;
diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index 216d9db6b9ac..fab096feb270 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -322,6 +322,7 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 			   struct msghdr *msg, size_t len,
 			   rxrpc_notify_end_tx_t notify_end_tx,
 			   bool *_dropped_lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct rxrpc_txbuf *txb;
 	struct sock *sk =3D &rx->sk;
@@ -660,6 +661,7 @@ rxrpc_new_client_call_for_sendmsg(struct rxrpc_sock *=
rx, struct msghdr *msg,
  */
 int rxrpc_do_sendmsg(struct rxrpc_sock *rx, struct msghdr *msg, size_t l=
en)
 	__releases(&rx->sk.sk_lock.slock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct rxrpc_call *call;
 	bool dropped_lock =3D false;
@@ -800,6 +802,7 @@ int rxrpc_do_sendmsg(struct rxrpc_sock *rx, struct ms=
ghdr *msg, size_t len)
 int rxrpc_kernel_send_data(struct socket *sock, struct rxrpc_call *call,
 			   struct msghdr *msg, size_t len,
 			   rxrpc_notify_end_tx_t notify_end_tx)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	bool dropped_lock =3D false;
 	int ret;
diff --git a/net/sched/act_api.c b/net/sched/act_api.c
index 839790043256..a4677be2e717 100644
--- a/net/sched/act_api.c
+++ b/net/sched/act_api.c
@@ -371,6 +371,7 @@ static void tcf_action_cleanup(struct tc_action *p)
 }
=20
 static int __tcf_action_put(struct tc_action *p, bool bind)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	struct tcf_idrinfo *idrinfo =3D p->idrinfo;
=20
diff --git a/net/sched/cls_api.c b/net/sched/cls_api.c
index 8e47e5355be6..24d9146a6eed 100644
--- a/net/sched/cls_api.c
+++ b/net/sched/cls_api.c
@@ -1311,6 +1311,7 @@ static struct tcf_block *__tcf_block_find(struct ne=
t *net, struct Qdisc *q,
=20
 static void __tcf_block_put(struct tcf_block *block, struct Qdisc *q,
 			    struct tcf_block_ext_info *ei, bool rtnl_held)
+	NO_THREAD_SAFETY_ANALYSIS /* clang bug? */
 {
 	if (refcount_dec_and_mutex_lock(&block->refcnt, &block->lock)) {
 		/* Flushing/putting all chains will cause the block to be
diff --git a/net/shaper/shaper.c b/net/shaper/shaper.c
index 7101a48bce54..1420cb6a6700 100644
--- a/net/shaper/shaper.c
+++ b/net/shaper/shaper.c
@@ -37,6 +37,7 @@ static struct net_shaper_binding *net_shaper_binding_fr=
om_ctx(void *ctx)
 }
=20
 static void net_shaper_lock(struct net_shaper_binding *binding)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	switch (binding->type) {
 	case NET_SHAPER_BINDING_TYPE_NETDEV:
@@ -46,6 +47,7 @@ static void net_shaper_lock(struct net_shaper_binding *=
binding)
 }
=20
 static void net_shaper_unlock(struct net_shaper_binding *binding)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	switch (binding->type) {
 	case NET_SHAPER_BINDING_TYPE_NETDEV:
diff --git a/net/smc/af_smc.c b/net/smc/af_smc.c
index ca6984541edb..7946c3f564a2 100644
--- a/net/smc/af_smc.c
+++ b/net/smc/af_smc.c
@@ -2420,6 +2420,7 @@ static int smc_listen_rdma_finish(struct smc_sock *=
new_smc,
=20
 /* setup for connection of server */
 static void smc_listen_work(struct work_struct *work)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct smc_sock *new_smc =3D container_of(work, struct smc_sock,
 						smc_listen_work);
diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
index eadc00410ebc..4cb846f4d3ae 100644
--- a/net/sunrpc/rpc_pipe.c
+++ b/net/sunrpc/rpc_pipe.c
@@ -1221,6 +1221,7 @@ void rpc_pipefs_exit_net(struct net *net)
  * will be completed.
  */
 struct super_block *rpc_get_sb_net(const struct net *net)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct sunrpc_net *sn =3D net_generic(net, sunrpc_net_id);
=20
@@ -1233,6 +1234,7 @@ struct super_block *rpc_get_sb_net(const struct net=
 *net)
 EXPORT_SYMBOL_GPL(rpc_get_sb_net);
=20
 void rpc_put_sb_net(const struct net *net)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct sunrpc_net *sn =3D net_generic(net, sunrpc_net_id);
=20
diff --git a/net/sunrpc/svc_xprt.c b/net/sunrpc/svc_xprt.c
index ae25405d8bd2..ec07bf77b20e 100644
--- a/net/sunrpc/svc_xprt.c
+++ b/net/sunrpc/svc_xprt.c
@@ -1400,6 +1400,7 @@ EXPORT_SYMBOL_GPL(svc_xprt_names);
 /*----------------------------------------------------------------------=
------*/
=20
 static void *svc_pool_stats_start(struct seq_file *m, loff_t *pos)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	unsigned int pidx =3D (unsigned int)*pos;
 	struct svc_info *si =3D m->private;
@@ -1440,6 +1441,7 @@ static void *svc_pool_stats_next(struct seq_file *m=
, void *p, loff_t *pos)
 }
=20
 static void svc_pool_stats_stop(struct seq_file *m, void *p)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct svc_info *si =3D m->private;
=20
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 34945de1fb1f..a66fc1d182e9 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -2407,6 +2407,7 @@ static void unix_copy_addr(struct msghdr *msg, stru=
ct sock *sk)
=20
 int __unix_dgram_recvmsg(struct sock *sk, struct msghdr *msg, size_t siz=
e,
 			 int flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct scm_cookie scm;
 	struct socket *sock =3D sk->sk_socket;
diff --git a/net/unix/unix_bpf.c b/net/unix/unix_bpf.c
index bca2d86ba97d..c4dc195029f0 100644
--- a/net/unix/unix_bpf.c
+++ b/net/unix/unix_bpf.c
@@ -14,6 +14,7 @@
=20
 static int unix_msg_wait_data(struct sock *sk, struct sk_psock *psock,
 			      long timeo)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	DEFINE_WAIT_FUNC(wait, woken_wake_function);
 	struct unix_sock *u =3D unix_sk(sk);
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d7d3da0f6833..96fa14a7de53 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1003,6 +1003,7 @@ static int nl80211_prepare_wdev_dump(struct netlink=
_callback *cb,
 				     struct cfg80211_registered_device **rdev,
 				     struct wireless_dev **wdev,
 				     struct nlattr **attrbuf)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err;
=20
@@ -4526,6 +4527,7 @@ static int nl80211_new_interface(struct sk_buff *sk=
b, struct genl_info *info)
 }
=20
 static int nl80211_del_interface(struct sk_buff *skb, struct genl_info *=
info)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cfg80211_registered_device *rdev =3D info->user_ptr[0];
 	struct wireless_dev *wdev =3D info->user_ptr[1];
@@ -6923,6 +6925,7 @@ static int nl80211_send_station(struct sk_buff *msg=
, u32 cmd, u32 portid,
=20
 static int nl80211_dump_station(struct sk_buff *skb,
 				struct netlink_callback *cb)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct station_info sinfo;
 	struct cfg80211_registered_device *rdev;
@@ -7920,6 +7923,7 @@ static int nl80211_send_mpath(struct sk_buff *msg, =
u32 portid, u32 seq,
=20
 static int nl80211_dump_mpath(struct sk_buff *skb,
 			      struct netlink_callback *cb)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct mpath_info pinfo;
 	struct cfg80211_registered_device *rdev;
@@ -8120,6 +8124,7 @@ static int nl80211_get_mpp(struct sk_buff *skb, str=
uct genl_info *info)
=20
 static int nl80211_dump_mpp(struct sk_buff *skb,
 			    struct netlink_callback *cb)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct mpath_info pinfo;
 	struct cfg80211_registered_device *rdev;
@@ -10589,6 +10594,7 @@ static int nl80211_send_bss(struct sk_buff *msg, =
struct netlink_callback *cb,
 }
=20
 static int nl80211_dump_scan(struct sk_buff *skb, struct netlink_callbac=
k *cb)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cfg80211_registered_device *rdev;
 	struct cfg80211_internal_bss *scan;
@@ -10729,6 +10735,7 @@ static int nl80211_send_survey(struct sk_buff *ms=
g, u32 portid, u32 seq,
 }
=20
 static int nl80211_dump_survey(struct sk_buff *skb, struct netlink_callb=
ack *cb)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct nlattr **attrbuf;
 	struct survey_info survey;
@@ -16649,6 +16656,7 @@ static u32 nl80211_internal_flags[] =3D {
 static int nl80211_pre_doit(const struct genl_split_ops *ops,
 			    struct sk_buff *skb,
 			    struct genl_info *info)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct cfg80211_registered_device *rdev =3D NULL;
 	struct wireless_dev *wdev =3D NULL;
@@ -16751,6 +16759,7 @@ static int nl80211_pre_doit(const struct genl_spl=
it_ops *ops,
 static void nl80211_post_doit(const struct genl_split_ops *ops,
 			      struct sk_buff *skb,
 			      struct genl_info *info)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	u32 internal_flags =3D nl80211_internal_flags[ops->internal_flags];
=20
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 59eefe2fed10..b59e91fc20c7 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -805,6 +805,7 @@ static void mtty_disable_files(struct mdev_state *mde=
v_state)
 }
=20
 static void mtty_state_mutex_unlock(struct mdev_state *mdev_state)
+	RELEASE(&mdev_state->state_mutex)
 {
 again:
 	mutex_lock(&mdev_state->reset_mutex);
diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorf=
s.c
index c07d150685d7..857daa85bb85 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -2084,6 +2084,7 @@ int __aafs_ns_mkdir(struct aa_ns *ns, struct dentry=
 *parent, const char *name,
  * NOTE: will not unlock root->lock
  */
 static struct aa_ns *__next_ns(struct aa_ns *root, struct aa_ns *ns)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct aa_ns *parent, *next;
=20
@@ -2205,6 +2206,7 @@ static struct aa_profile *next_profile(struct aa_ns=
 *root,
  * acquires first ns->lock
  */
 static void *p_start(struct seq_file *f, loff_t *pos)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct aa_profile *profile =3D NULL;
 	struct aa_ns *root =3D aa_get_current_ns();
@@ -2249,6 +2251,7 @@ static void *p_next(struct seq_file *f, void *p, lo=
ff_t *pos)
  * Release all locking done by p_start/p_next on namespace tree
  */
 static void p_stop(struct seq_file *f, void *p)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct aa_profile *profile =3D p;
 	struct aa_ns *root =3D f->private, *ns;
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/i=
ma_main.c
index 9f9897a7c217..2f86b16b5fc8 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -604,6 +604,7 @@ static int ima_file_check(struct file *file, int mask=
)
=20
 static int __ima_inode_hash(struct inode *inode, struct file *file, char=
 *buf,
 			    size_t buf_size)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct ima_iint_cache *iint =3D NULL, tmp_iint;
 	int rc, hash_algo;
diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index f331725d5a37..115a878d2126 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -1240,6 +1240,7 @@ int __key_link_lock(struct key *keyring,
 		    const struct keyring_index_key *index_key)
 	__acquires(&keyring->sem)
 	__acquires(&keyring_serialise_link_lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (keyring->type !=3D &key_type_keyring)
 		return -ENOTDIR;
@@ -1263,6 +1264,7 @@ int __key_move_lock(struct key *l_keyring, struct k=
ey *u_keyring,
 	__acquires(&l_keyring->sem)
 	__acquires(&u_keyring->sem)
 	__acquires(&keyring_serialise_link_lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (l_keyring->type !=3D &key_type_keyring ||
 	    u_keyring->type !=3D &key_type_keyring)
@@ -1387,6 +1389,7 @@ void __key_link_end(struct key *keyring,
 		    struct assoc_array_edit *edit)
 	__releases(&keyring->sem)
 	__releases(&keyring_serialise_link_lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	BUG_ON(index_key->type =3D=3D NULL);
 	kenter("%d,%s,", keyring->serial, index_key->type->name);
diff --git a/security/tomoyo/gc.c b/security/tomoyo/gc.c
index 026e29ea3796..518ff4a91f5d 100644
--- a/security/tomoyo/gc.c
+++ b/security/tomoyo/gc.c
@@ -385,6 +385,7 @@ static inline void tomoyo_del_number_group(struct lis=
t_head *element)
  */
 static void tomoyo_try_to_gc(const enum tomoyo_policy_id type,
 			     struct list_head *element)
+	REQUIRES(&tomoyo_policy_lock)
 {
 	/*
 	 * __list_del_entry() guarantees that the list element became no longer
@@ -484,6 +485,7 @@ static void tomoyo_try_to_gc(const enum tomoyo_policy=
_id type,
  */
 static void tomoyo_collect_member(const enum tomoyo_policy_id id,
 				  struct list_head *member_list)
+	REQUIRES(&tomoyo_policy_lock)
 {
 	struct tomoyo_acl_head *member;
 	struct tomoyo_acl_head *tmp;
@@ -504,6 +506,7 @@ static void tomoyo_collect_member(const enum tomoyo_p=
olicy_id id,
  * Returns nothing.
  */
 static void tomoyo_collect_acl(struct list_head *list)
+	REQUIRES(&tomoyo_policy_lock)
 {
 	struct tomoyo_acl_info *acl;
 	struct tomoyo_acl_info *tmp;
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.=
c
index 840bb9cfe789..02b89894874f 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -869,6 +869,7 @@ int snd_compr_stop_error(struct snd_compr_stream *str=
eam,
 EXPORT_SYMBOL_GPL(snd_compr_stop_error);
=20
 static int snd_compress_wait_for_drain(struct snd_compr_stream *stream)
+	REQUIRES(stream->device->lock)
 {
 	int ret;
=20
@@ -904,6 +905,7 @@ static int snd_compress_wait_for_drain(struct snd_com=
pr_stream *stream)
 }
=20
 static int snd_compr_drain(struct snd_compr_stream *stream)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int retval;
=20
@@ -956,6 +958,7 @@ static int snd_compr_next_track(struct snd_compr_stre=
am *stream)
 }
=20
 static int snd_compr_partial_drain(struct snd_compr_stream *stream)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int retval;
=20
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 4683b9139c56..55e6dbdcc7e7 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -816,6 +816,7 @@ static int choose_rate(struct snd_pcm_substream *subs=
tream,
=20
 /* parameter locking: returns immediately if tried during streaming */
 static int lock_params(struct snd_pcm_runtime *runtime)
+	TRY_ACQUIRE(0, runtime->oss.params_lock)
 {
 	if (mutex_lock_interruptible(&runtime->oss.params_lock))
 		return -ERESTARTSYS;
@@ -827,6 +828,7 @@ static int lock_params(struct snd_pcm_runtime *runtim=
e)
 }
=20
 static void unlock_params(struct snd_pcm_runtime *runtime)
+	RELEASE(runtime->oss.params_lock)
 {
 	mutex_unlock(&runtime->oss.params_lock);
 }
@@ -1222,6 +1224,7 @@ static int snd_pcm_oss_capture_position_fixup(struc=
t snd_pcm_substream *substrea
 }
=20
 snd_pcm_sframes_t snd_pcm_oss_write3(struct snd_pcm_substream *substream=
, const char *ptr, snd_pcm_uframes_t frames, int in_kernel)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_pcm_runtime *runtime =3D substream->runtime;
 	int ret;
@@ -1253,6 +1256,7 @@ snd_pcm_sframes_t snd_pcm_oss_write3(struct snd_pcm=
_substream *substream, const
 }
=20
 snd_pcm_sframes_t snd_pcm_oss_read3(struct snd_pcm_substream *substream,=
 char *ptr, snd_pcm_uframes_t frames, int in_kernel)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_pcm_runtime *runtime =3D substream->runtime;
 	snd_pcm_sframes_t delay;
@@ -1743,6 +1747,7 @@ static int snd_pcm_oss_sync(struct snd_pcm_oss_file=
 *pcm_oss_file)
 }
=20
 static int snd_pcm_oss_set_rate(struct snd_pcm_oss_file *pcm_oss_file, i=
nt rate)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int idx;
=20
@@ -1782,6 +1787,7 @@ static int snd_pcm_oss_get_rate(struct snd_pcm_oss_=
file *pcm_oss_file)
 }
=20
 static int snd_pcm_oss_set_channels(struct snd_pcm_oss_file *pcm_oss_fil=
e, unsigned int channels)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int idx;
 	if (channels < 1)
@@ -1875,6 +1881,7 @@ static int snd_pcm_oss_get_formats(struct snd_pcm_o=
ss_file *pcm_oss_file)
 }
=20
 static int snd_pcm_oss_set_format(struct snd_pcm_oss_file *pcm_oss_file,=
 int format)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int formats, idx;
 	int err;
@@ -1937,6 +1944,7 @@ static int snd_pcm_oss_set_subdivide1(struct snd_pc=
m_substream *substream, int s
 }
=20
 static int snd_pcm_oss_set_subdivide(struct snd_pcm_oss_file *pcm_oss_fi=
le, int subdivide)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err =3D -EINVAL, idx;
=20
@@ -1980,6 +1988,7 @@ static int snd_pcm_oss_set_fragment1(struct snd_pcm=
_substream *substream, unsign
 }
=20
 static int snd_pcm_oss_set_fragment(struct snd_pcm_oss_file *pcm_oss_fil=
e, unsigned int val)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int err =3D -EINVAL, idx;
=20
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6c2b6a62d9d2..793e5cb74d9a 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -85,6 +85,7 @@ void snd_pcm_group_init(struct snd_pcm_group *group)
 /* define group lock helpers */
 #define DEFINE_PCM_GROUP_LOCK(action, mutex_action) \
 static void snd_pcm_group_ ## action(struct snd_pcm_group *group, bool n=
onatomic) \
+	NO_THREAD_SAFETY_ANALYSIS\
 { \
 	if (nonatomic) \
 		mutex_ ## mutex_action(&group->mutex); \
@@ -139,6 +140,7 @@ void snd_pcm_stream_lock_irq(struct snd_pcm_substream=
 *substream)
 EXPORT_SYMBOL_GPL(snd_pcm_stream_lock_irq);
=20
 static void snd_pcm_stream_lock_nested(struct snd_pcm_substream *substre=
am)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_pcm_group *group =3D &substream->self_group;
=20
@@ -162,6 +164,7 @@ void snd_pcm_stream_unlock_irq(struct snd_pcm_substre=
am *substream)
 EXPORT_SYMBOL_GPL(snd_pcm_stream_unlock_irq);
=20
 unsigned long _snd_pcm_stream_lock_irqsave(struct snd_pcm_substream *sub=
stream)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	unsigned long flags =3D 0;
 	if (substream->pcm->nonatomic)
@@ -173,6 +176,7 @@ unsigned long _snd_pcm_stream_lock_irqsave(struct snd=
_pcm_substream *substream)
 EXPORT_SYMBOL_GPL(_snd_pcm_stream_lock_irqsave);
=20
 unsigned long _snd_pcm_stream_lock_irqsave_nested(struct snd_pcm_substre=
am *substream)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	unsigned long flags =3D 0;
 	if (substream->pcm->nonatomic)
@@ -194,6 +198,7 @@ EXPORT_SYMBOL_GPL(_snd_pcm_stream_lock_irqsave_nested=
);
  */
 void snd_pcm_stream_unlock_irqrestore(struct snd_pcm_substream *substrea=
m,
 				      unsigned long flags)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (substream->pcm->nonatomic)
 		mutex_unlock(&substream->self_group.mutex);
@@ -709,6 +714,7 @@ static int snd_pcm_hw_params_choose(struct snd_pcm_su=
bstream *pcm,
  * block the further r/w operations
  */
 static int snd_pcm_buffer_access_lock(struct snd_pcm_runtime *runtime)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (!atomic_dec_unless_positive(&runtime->buffer_accessing))
 		return -EBUSY;
@@ -718,6 +724,7 @@ static int snd_pcm_buffer_access_lock(struct snd_pcm_=
runtime *runtime)
=20
 /* release buffer_mutex and clear r/w access flag */
 static void snd_pcm_buffer_access_unlock(struct snd_pcm_runtime *runtime=
)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(&runtime->buffer_mutex);
 	atomic_inc(&runtime->buffer_accessing);
@@ -1225,6 +1232,7 @@ static int snd_pcm_action_group(const struct action=
_ops *ops,
 				struct snd_pcm_substream *substream,
 				snd_pcm_state_t state,
 				bool stream_lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_pcm_substream *s =3D NULL;
 	struct snd_pcm_substream *s1;
diff --git a/sound/core/seq/oss/seq_oss.c b/sound/core/seq/oss/seq_oss.c
index 77c1214acd90..e1f30acb00f5 100644
--- a/sound/core/seq/oss/seq_oss.c
+++ b/sound/core/seq/oss/seq_oss.c
@@ -170,6 +170,7 @@ odev_write(struct file *file, const char __user *buf,=
 size_t count, loff_t *offs
=20
 static long
 odev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct seq_oss_devinfo *dp;
 	long rc;
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmg=
r.c
index 073b56dc2225..eb392eff3543 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -173,6 +173,7 @@ struct snd_seq_client *snd_seq_client_use_ptr(int cli=
entid)
  * Unlock via snd_seq_client_ioctl_unlock() below
  */
 bool snd_seq_client_ioctl_lock(int clientid)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_seq_client *client;
=20
@@ -187,6 +188,7 @@ EXPORT_SYMBOL_GPL(snd_seq_client_ioctl_lock);
=20
 /* Unlock and unref the given client; for OSS sequencer use only */
 void snd_seq_client_ioctl_unlock(int clientid)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_seq_client *client;
=20
diff --git a/sound/core/seq/seq_memory.c b/sound/core/seq/seq_memory.c
index 20155e3e87c6..f748c2de9313 100644
--- a/sound/core/seq/seq_memory.c
+++ b/sound/core/seq/seq_memory.c
@@ -268,6 +268,7 @@ static int snd_seq_cell_alloc(struct snd_seq_pool *po=
ol,
 			      struct snd_seq_event_cell **cellp,
 			      int nonblock, struct file *file,
 			      struct mutex *mutexp)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_seq_event_cell *cell;
 	unsigned long flags;
diff --git a/sound/core/sound.c b/sound/core/sound.c
index 6531a67f13b3..01d9699eb7bc 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -117,6 +117,7 @@ EXPORT_SYMBOL(snd_lookup_minor_data);
=20
 #ifdef CONFIG_MODULES
 static struct snd_minor *autoload_device(unsigned int minor)
+	REQUIRES(sound_mutex)
 {
 	int dev;
 	mutex_unlock(&sound_mutex); /* release lock temporarily */
diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
index 054058779db6..7bb60fe6bf93 100644
--- a/sound/isa/gus/gus_mem.c
+++ b/sound/isa/gus/gus_mem.c
@@ -16,6 +16,7 @@ static void snd_gf1_mem_info_read(struct snd_info_entry=
 *entry,
 #endif
=20
 void snd_gf1_mem_lock(struct snd_gf1_mem * alloc, int xup)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (!xup) {
 		mutex_lock(&alloc->memory_mutex);
@@ -27,6 +28,7 @@ void snd_gf1_mem_lock(struct snd_gf1_mem * alloc, int x=
up)
 static struct snd_gf1_mem_block *
 snd_gf1_mem_xalloc(struct snd_gf1_mem *alloc, struct snd_gf1_mem_block *=
block,
 		   const char *name)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_gf1_mem_block *pblock, *nblock;
=20
@@ -68,6 +70,7 @@ snd_gf1_mem_xalloc(struct snd_gf1_mem *alloc, struct sn=
d_gf1_mem_block *block,
 }
=20
 int snd_gf1_mem_xfree(struct snd_gf1_mem * alloc, struct snd_gf1_mem_blo=
ck * block)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (block->share) {	/* ok.. shared block */
 		block->share--;
diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index 6e710dce5c60..acad9004b7b7 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -494,6 +494,7 @@ static int snd_ac97_put_enum_double(struct snd_kcontr=
ol *kcontrol,
=20
 /* save/restore ac97 v2.3 paging */
 static int snd_ac97_page_save(struct snd_ac97 *ac97, int reg, struct snd=
_kcontrol *kcontrol)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int page_save =3D -1;
 	if ((kcontrol->private_value & (1<<25)) &&
@@ -508,6 +509,7 @@ static int snd_ac97_page_save(struct snd_ac97 *ac97, =
int reg, struct snd_kcontro
 }
=20
 static void snd_ac97_page_restore(struct snd_ac97 *ac97, int page_save)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (page_save >=3D 0) {
 		snd_ac97_update_bits(ac97, AC97_INT_PAGING, AC97_PAGE_MASK, page_save)=
;
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 7d7f9aac50a9..a5e0da162dcf 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2360,6 +2360,7 @@ static int azx_probe_continue(struct azx *chip)
 }
=20
 static void azx_remove(struct pci_dev *pci)
+	REQUIRES(pci->dev.mutex)
 {
 	struct snd_card *card =3D pci_get_drvdata(pci);
 	struct azx *chip;
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.=
c
index 8192be394d0d..7fd8fa5a9222 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -143,6 +143,7 @@ struct alc_spec {
  */
=20
 static void coef_mutex_lock(struct hda_codec *codec)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct alc_spec *spec =3D codec->spec;
=20
@@ -151,6 +152,7 @@ static void coef_mutex_lock(struct hda_codec *codec)
 }
=20
 static void coef_mutex_unlock(struct hda_codec *codec)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct alc_spec *spec =3D codec->spec;
=20
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_=
i2c.c
index 0e42b87dadb8..4dd9aa0867de 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -654,6 +654,7 @@ static void tas2781_hda_remove_controls(struct tas278=
1_hda *tas_hda)
 }
=20
 static void tasdev_fw_ready(const struct firmware *fmw, void *context)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct tasdevice_priv *tas_priv =3D context;
 	struct tas2781_hda *tas_hda =3D dev_get_drvdata(tas_priv->dev);
diff --git a/sound/pci/ice1712/ak4xxx.c b/sound/pci/ice1712/ak4xxx.c
index cad33a2f26bc..20936f4cbae6 100644
--- a/sound/pci/ice1712/ak4xxx.c
+++ b/sound/pci/ice1712/ak4xxx.c
@@ -22,6 +22,7 @@ MODULE_DESCRIPTION("ICEnsemble ICE17xx <-> AK4xxx AD/DA=
 chip interface");
 MODULE_LICENSE("GPL");
=20
 static void snd_ice1712_akm4xxx_lock(struct snd_akm4xxx *ak, int chip)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_ice1712 *ice =3D ak->private_data[0];
=20
@@ -29,6 +30,7 @@ static void snd_ice1712_akm4xxx_lock(struct snd_akm4xxx=
 *ak, int chip)
 }
=20
 static void snd_ice1712_akm4xxx_unlock(struct snd_akm4xxx *ak, int chip)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_ice1712 *ice =3D ak->private_data[0];
=20
diff --git a/sound/pci/ice1712/delta.c b/sound/pci/ice1712/delta.c
index 08adf4dd1303..60e667c285ab 100644
--- a/sound/pci/ice1712/delta.c
+++ b/sound/pci/ice1712/delta.c
@@ -245,6 +245,7 @@ static int delta_spdif_stream_put(struct snd_ice1712 =
*ice, struct snd_ctl_elem_v
  * AK4524 on Delta 44 and 66 to choose the chip mask
  */
 static void delta_ak4524_lock(struct snd_akm4xxx *ak, int chip)
+	NO_THREAD_SAFETY_ANALYSIS
 {
         struct snd_ak4xxx_private *priv =3D (void *)ak->private_value[0]=
;
         struct snd_ice1712 *ice =3D ak->private_data[0];
@@ -259,6 +260,7 @@ static void delta_ak4524_lock(struct snd_akm4xxx *ak,=
 int chip)
  * AK4524 on Delta1010LT to choose the chip address
  */
 static void delta1010lt_ak4524_lock(struct snd_akm4xxx *ak, int chip)
+	NO_THREAD_SAFETY_ANALYSIS
 {
         struct snd_ak4xxx_private *priv =3D (void *)ak->private_value[0]=
;
         struct snd_ice1712 *ice =3D ak->private_data[0];
@@ -272,6 +274,7 @@ static void delta1010lt_ak4524_lock(struct snd_akm4xx=
x *ak, int chip)
  * AK4524 on Delta66 rev E to choose the chip address
  */
 static void delta66e_ak4524_lock(struct snd_akm4xxx *ak, int chip)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_ak4xxx_private *priv =3D (void *)ak->private_value[0];
 	struct snd_ice1712 *ice =3D ak->private_data[0];
@@ -286,6 +289,7 @@ static void delta66e_ak4524_lock(struct snd_akm4xxx *=
ak, int chip)
  * AK4528 on VX442 to choose the chip mask
  */
 static void vx442_ak4524_lock(struct snd_akm4xxx *ak, int chip)
+	NO_THREAD_SAFETY_ANALYSIS
 {
         struct snd_ak4xxx_private *priv =3D (void *)ak->private_value[0]=
;
         struct snd_ice1712 *ice =3D ak->private_data[0];
diff --git a/sound/pci/ice1712/ews.c b/sound/pci/ice1712/ews.c
index 8bb86b3c894e..08f5a3853f05 100644
--- a/sound/pci/ice1712/ews.c
+++ b/sound/pci/ice1712/ews.c
@@ -75,6 +75,7 @@ static int ewx_i2c_getdata(struct snd_i2c_bus *bus, int=
 ack)
 }
=20
 static void ewx_i2c_start(struct snd_i2c_bus *bus)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_ice1712 *ice =3D bus->private_data;
 	unsigned char mask;
@@ -94,6 +95,7 @@ static void ewx_i2c_start(struct snd_i2c_bus *bus)
 }
=20
 static void ewx_i2c_stop(struct snd_i2c_bus *bus)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_ice1712 *ice =3D bus->private_data;
 	snd_ice1712_restore_gpio_status(ice);
@@ -156,6 +158,7 @@ static int snd_ice1712_ews88mt_chip_select(struct snd=
_ice1712 *ice, int chip_mas
=20
 /* start callback for EWS88MT, needs to select a certain chip mask */
 static void ews88mt_ak4524_lock(struct snd_akm4xxx *ak, int chip)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_ice1712 *ice =3D ak->private_data[0];
 	unsigned char tmp;
@@ -173,6 +176,7 @@ static void ews88mt_ak4524_lock(struct snd_akm4xxx *a=
k, int chip)
=20
 /* stop callback for EWS88MT, needs to deselect chip mask */
 static void ews88mt_ak4524_unlock(struct snd_akm4xxx *ak, int chip)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_ice1712 *ice =3D ak->private_data[0];
 	snd_ice1712_restore_gpio_status(ice);
@@ -182,6 +186,7 @@ static void ews88mt_ak4524_unlock(struct snd_akm4xxx =
*ak, int chip)
=20
 /* start callback for EWX24/96 */
 static void ewx2496_ak4524_lock(struct snd_akm4xxx *ak, int chip)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_ice1712 *ice =3D ak->private_data[0];
 	unsigned char tmp;
@@ -197,6 +202,7 @@ static void ewx2496_ak4524_lock(struct snd_akm4xxx *a=
k, int chip)
=20
 /* start callback for DMX 6fire */
 static void dmx6fire_ak4524_lock(struct snd_akm4xxx *ak, int chip)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_ak4xxx_private *priv =3D (void *)ak->private_value[0];
 	struct snd_ice1712 *ice =3D ak->private_data[0];
diff --git a/sound/pci/ice1712/hoontech.c b/sound/pci/ice1712/hoontech.c
index 46daeea8dc66..76637ad016ed 100644
--- a/sound/pci/ice1712/hoontech.c
+++ b/sound/pci/ice1712/hoontech.c
@@ -260,6 +260,7 @@ static int snd_ice1712_staudio_init(struct snd_ice171=
2 *ice)
=20
 /* start callback for STDSP24 with modified hardware */
 static void stdsp24_ak4524_lock(struct snd_akm4xxx *ak, int chip)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_ice1712 *ice =3D ak->private_data[0];
 	unsigned char tmp;
diff --git a/sound/pci/ice1712/ice1712.h b/sound/pci/ice1712/ice1712.h
index cd02710d8271..bc93f521ce25 100644
--- a/sound/pci/ice1712/ice1712.h
+++ b/sound/pci/ice1712/ice1712.h
@@ -423,6 +423,7 @@ static inline unsigned int snd_ice1712_gpio_read(stru=
ct snd_ice1712 *ice)
  * restore!
  */
 static inline void snd_ice1712_save_gpio_status(struct snd_ice1712 *ice)
+	ACQUIRE(ice->gpio_mutex)
 {
 	mutex_lock(&ice->gpio_mutex);
 	ice->gpio.saved[0] =3D ice->gpio.direction;
@@ -430,6 +431,7 @@ static inline void snd_ice1712_save_gpio_status(struc=
t snd_ice1712 *ice)
 }
=20
 static inline void snd_ice1712_restore_gpio_status(struct snd_ice1712 *i=
ce)
+	RELEASE(ice->gpio_mutex)
 {
 	ice->gpio.set_dir(ice, ice->gpio.saved[0]);
 	ice->gpio.set_mask(ice, ice->gpio.saved[1]);
diff --git a/sound/pci/ice1712/prodigy192.c b/sound/pci/ice1712/prodigy19=
2.c
index a12dafbf53ab..2fcfd8c42ad9 100644
--- a/sound/pci/ice1712/prodigy192.c
+++ b/sound/pci/ice1712/prodigy192.c
@@ -474,6 +474,7 @@ static unsigned char read_data(struct snd_ice1712 *ic=
e, unsigned int gpio,
  * 4wire ak4114 protocol - starting sequence
  */
 static unsigned int prodigy192_4wire_start(struct snd_ice1712 *ice)
+	ACQUIRE(ice->gpio_mutex)
 {
 	unsigned int tmp;
=20
@@ -491,6 +492,7 @@ static unsigned int prodigy192_4wire_start(struct snd=
_ice1712 *ice)
  * 4wire ak4114 protocol - final sequence
  */
 static void prodigy192_4wire_finish(struct snd_ice1712 *ice, unsigned in=
t tmp)
+	RELEASE(ice->gpio_mutex)
 {
 	tmp |=3D VT1724_PRODIGY192_CS; /* raise chip select */
 	snd_ice1712_gpio_write(ice, tmp);
diff --git a/sound/pci/ice1712/revo.c b/sound/pci/ice1712/revo.c
index bcf114152dfd..6b6b5fc524a5 100644
--- a/sound/pci/ice1712/revo.c
+++ b/sound/pci/ice1712/revo.c
@@ -79,12 +79,14 @@ static void revo_set_rate_val(struct snd_akm4xxx *ak,=
 unsigned int rate)
  */
=20
 static void revo_i2c_start(struct snd_i2c_bus *bus)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_ice1712 *ice =3D bus->private_data;
 	snd_ice1712_save_gpio_status(ice);
 }
=20
 static void revo_i2c_stop(struct snd_i2c_bus *bus)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_ice1712 *ice =3D bus->private_data;
 	snd_ice1712_restore_gpio_status(ice);
@@ -406,6 +408,7 @@ static unsigned char read_data(struct snd_ice1712 *ic=
e, unsigned int gpio,
 }
=20
 static unsigned int ap192_4wire_start(struct snd_ice1712 *ice)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	unsigned int tmp;
=20
@@ -420,6 +423,7 @@ static unsigned int ap192_4wire_start(struct snd_ice1=
712 *ice)
 }
=20
 static void ap192_4wire_finish(struct snd_ice1712 *ice, unsigned int tmp=
)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	tmp |=3D VT1724_REVO_CS3;
 	tmp |=3D VT1724_REVO_CS0;
diff --git a/sound/pci/pcxhr/pcxhr_core.c b/sound/pci/pcxhr/pcxhr_core.c
index 23f253effb4f..b25622146ae7 100644
--- a/sound/pci/pcxhr/pcxhr_core.c
+++ b/sound/pci/pcxhr/pcxhr_core.c
@@ -1147,6 +1147,7 @@ static u_int64_t pcxhr_stream_read_position(struct =
pcxhr_mgr *mgr,
 static void pcxhr_update_timer_pos(struct pcxhr_mgr *mgr,
 				   struct pcxhr_stream *stream,
 				   int samples_to_add)
+	REQUIRES(mgr->lock)
 {
 	if (stream->substream &&
 	    (stream->status =3D=3D PCXHR_STREAM_STATUS_RUNNING)) {
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 0e70a3ab42b5..197d38973fe5 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5402,6 +5402,7 @@ static void rt5677_resume_irq_check(struct work_str=
uct *work)
 }
=20
 static void rt5677_irq_bus_lock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct rt5677_priv *rt5677 =3D irq_data_get_irq_chip_data(data);
=20
@@ -5409,6 +5410,7 @@ static void rt5677_irq_bus_lock(struct irq_data *da=
ta)
 }
=20
 static void rt5677_irq_bus_sync_unlock(struct irq_data *data)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct rt5677_priv *rt5677 =3D irq_data_get_irq_chip_data(data);
=20
diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v=
2.c
index d589a212b768..f16a20ef2215 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -404,8 +404,8 @@ static void wcd_mbhc_report_plug_insertion(struct wcd=
_mbhc *mbhc,
=20
 static void wcd_mbhc_report_plug(struct wcd_mbhc *mbhc, int insertion,
 				 enum snd_jack_types jack_type)
+	REQUIRES(mbhc->lock)
 {
-
 	WARN_ON(!mutex_is_locked(&mbhc->lock));
=20
 	if (!insertion) /* Report removal */
@@ -417,6 +417,7 @@ static void wcd_mbhc_report_plug(struct wcd_mbhc *mbh=
c, int insertion,
=20
 static void wcd_cancel_hs_detect_plug(struct wcd_mbhc *mbhc,
 				      struct work_struct *work)
+	REQUIRES(mbhc->lock)
 {
 	mbhc->hs_detect_work_stop =3D true;
 	mutex_unlock(&mbhc->lock);
@@ -425,6 +426,7 @@ static void wcd_cancel_hs_detect_plug(struct wcd_mbhc=
 *mbhc,
 }
=20
 static void wcd_mbhc_cancel_pending_work(struct wcd_mbhc *mbhc)
+	REQUIRES(mbhc->lock)
 {
 	/* cancel pending button press */
 	wcd_cancel_btn_work(mbhc);
@@ -433,6 +435,7 @@ static void wcd_mbhc_cancel_pending_work(struct wcd_m=
bhc *mbhc)
 }
=20
 static void wcd_mbhc_elec_hs_report_unplug(struct wcd_mbhc *mbhc)
+	REQUIRES(mbhc->lock)
 {
 	wcd_mbhc_cancel_pending_work(mbhc);
 	/* Report extension cable */
@@ -486,6 +489,7 @@ static void wcd_mbhc_find_plug_and_report(struct wcd_=
mbhc *mbhc,
=20
 static void wcd_schedule_hs_detect_plug(struct wcd_mbhc *mbhc,
 					    struct work_struct *work)
+	REQUIRES(mbhc->lock)
 {
 	WARN_ON(!mutex_is_locked(&mbhc->lock));
 	mbhc->hs_detect_work_stop =3D false;
@@ -493,6 +497,7 @@ static void wcd_schedule_hs_detect_plug(struct wcd_mb=
hc *mbhc,
 }
=20
 static void wcd_mbhc_adc_detect_plug_type(struct wcd_mbhc *mbhc)
+	REQUIRES(mbhc->lock)
 {
 	struct snd_soc_component *component =3D mbhc->component;
=20
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b5116b700d73..8b5e02e5df4b 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -149,6 +149,7 @@ static int dapm_down_seq[] =3D {
 };
=20
 static void dapm_assert_locked(struct snd_soc_dapm_context *dapm)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (snd_soc_card_is_instantiated(dapm->card))
 		snd_soc_dapm_mutex_assert_held(dapm);
@@ -607,6 +608,7 @@ struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_da=
pm(
 EXPORT_SYMBOL_GPL(snd_soc_dapm_kcontrol_dapm);
=20
 static void dapm_reset(struct snd_soc_card *card)
+	REQUIRES(card->dapm_mutex)
 {
 	struct snd_soc_dapm_widget *w;
=20
@@ -1953,6 +1955,7 @@ static bool dapm_idle_bias_off(struct snd_soc_dapm_=
context *dapm)
  *  o DAC to ADC (loopback).
  */
 static int dapm_power_widgets(struct snd_soc_card *card, int event)
+	REQUIRES(card->dapm_mutex)
 {
 	struct snd_soc_dapm_widget *w;
 	struct snd_soc_dapm_context *d;
@@ -2334,6 +2337,7 @@ static void soc_dapm_connect_path(struct snd_soc_da=
pm_path *path,
 /* test and update the power status of a mux widget */
 static int soc_dapm_mux_update_power(struct snd_soc_card *card,
 				 struct snd_kcontrol *kcontrol, int mux, struct soc_enum *e)
+	REQUIRES(card->dapm_mutex)
 {
 	struct snd_soc_dapm_path *path;
 	int found =3D 0;
@@ -2381,6 +2385,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_mux_update_power);
 static int soc_dapm_mixer_update_power(struct snd_soc_card *card,
 				       struct snd_kcontrol *kcontrol,
 				       int connect, int rconnect)
+	REQUIRES(card->dapm_mutex)
 {
 	struct snd_soc_dapm_path *path;
 	int found =3D 0;
@@ -2682,6 +2687,7 @@ static int snd_soc_dapm_set_pin(struct snd_soc_dapm=
_context *dapm,
  * Returns 0 for success.
  */
 int snd_soc_dapm_sync_unlocked(struct snd_soc_dapm_context *dapm)
+	REQUIRES(dapm->card->dapm_mutex)
 {
 	/*
 	 * Suppress early reports (eg, jacks syncing their state) to avoid
@@ -4521,6 +4527,7 @@ void snd_soc_dapm_connect_dai_link_widgets(struct s=
nd_soc_card *card)
=20
 static void soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int s=
tream,
 	int event)
+	REQUIRES(rtd->card->dapm_mutex)
 {
 	struct snd_soc_dai *dai;
 	int i;
@@ -4544,6 +4551,7 @@ static void soc_dapm_stream_event(struct snd_soc_pc=
m_runtime *rtd, int stream,
  */
 void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stre=
am,
 			      int event)
+	REQUIRES(rtd->card->dapm_mutex)
 {
 	struct snd_soc_card *card =3D rtd->card;
=20
@@ -4553,6 +4561,7 @@ void snd_soc_dapm_stream_event(struct snd_soc_pcm_r=
untime *rtd, int stream,
 }
=20
 void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int strea=
m)
+	REQUIRES(rtd->card->dapm_mutex)
 {
 	if (stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
 		if (snd_soc_runtime_ignore_pmdown_time(rtd)) {
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 88b3ad5a2552..d8ec4e8e05aa 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -371,6 +371,7 @@ static void dpcm_set_be_update_state(struct snd_soc_p=
cm_runtime *be,
  */
 void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
 			    int stream, int action)
+	REQUIRES(rtd->card->pcm_mutex)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_dai *dai;
@@ -418,6 +419,7 @@ bool snd_soc_runtime_ignore_pmdown_time(struct snd_so=
c_pcm_runtime *rtd)
 /* DPCM stream event, send event to FE and all active BEs. */
 int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
 	int event)
+	REQUIRES(fe->card->pcm_mutex)
 {
 	struct snd_soc_dpcm *dpcm;
=20
@@ -772,6 +774,7 @@ static int soc_pcm_components_close(struct snd_pcm_su=
bstream *substream,
=20
 static int soc_pcm_clean(struct snd_soc_pcm_runtime *rtd,
 			 struct snd_pcm_substream *substream, int rollback)
+	REQUIRES(rtd->card->pcm_mutex)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_dai *dai;
@@ -812,6 +815,7 @@ static int soc_pcm_clean(struct snd_soc_pcm_runtime *=
rtd,
  */
 static int __soc_pcm_close(struct snd_soc_pcm_runtime *rtd,
 			   struct snd_pcm_substream *substream)
+	REQUIRES(rtd->card->pcm_mutex)
 {
 	return soc_pcm_clean(rtd, substream, 0);
 }
@@ -872,6 +876,7 @@ static int soc_hw_sanity_check(struct snd_pcm_substre=
am *substream)
  */
 static int __soc_pcm_open(struct snd_soc_pcm_runtime *rtd,
 			  struct snd_pcm_substream *substream)
+	REQUIRES(rtd->card->pcm_mutex)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_dai *dai;
@@ -951,6 +956,7 @@ static int soc_pcm_open(struct snd_pcm_substream *sub=
stream)
  */
 static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
 			     struct snd_pcm_substream *substream)
+	REQUIRES(rtd->card->pcm_mutex)
 {
 	struct snd_soc_dai *dai;
 	int i, ret =3D 0;
@@ -1026,6 +1032,7 @@ static void soc_pcm_codec_params_fixup(struct snd_p=
cm_hw_params *params,
=20
 static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_pcm_substream *substream, int rollback)
+	REQUIRES(rtd->card->pcm_mutex)
 {
 	struct snd_soc_dai *dai;
 	int i;
@@ -1065,6 +1072,7 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runt=
ime *rtd,
  */
 static int __soc_pcm_hw_free(struct snd_soc_pcm_runtime *rtd,
 			     struct snd_pcm_substream *substream)
+	REQUIRES(rtd->card->pcm_mutex)
 {
 	return soc_pcm_hw_clean(rtd, substream, 0);
 }
@@ -1089,6 +1097,7 @@ static int soc_pcm_hw_free(struct snd_pcm_substream=
 *substream)
 static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 			       struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
+	REQUIRES(rtd->card->pcm_mutex)
 {
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
@@ -1317,6 +1326,7 @@ static snd_pcm_uframes_t soc_pcm_pointer(struct snd=
_pcm_substream *substream)
 /* connect a FE and BE */
 static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
+	REQUIRES(fe->card->pcm_mutex)
 {
 	struct snd_pcm_substream *fe_substream;
 	struct snd_pcm_substream *be_substream;
@@ -1396,6 +1406,7 @@ static void dpcm_be_reparent(struct snd_soc_pcm_run=
time *fe,
=20
 /* disconnect a BE and FE */
 void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
+	REQUIRES(fe->card->pcm_mutex)
 {
 	struct snd_soc_dpcm *dpcm, *d;
 	struct snd_pcm_substream *substream =3D snd_soc_dpcm_get_substream(fe, =
stream);
@@ -1579,6 +1590,7 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runt=
ime *fe, int stream,
=20
 static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 	struct snd_soc_dapm_widget_list **list_)
+	REQUIRES(fe->card->pcm_mutex)
 {
 	struct snd_soc_card *card =3D fe->card;
 	struct snd_soc_dapm_widget_list *list =3D *list_;
@@ -1649,6 +1661,7 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtim=
e *fe, int stream,
  */
 int dpcm_process_paths(struct snd_soc_pcm_runtime *fe,
 	int stream, struct snd_soc_dapm_widget_list **list, int new)
+	REQUIRES(fe->card->pcm_mutex)
 {
 	if (new)
 		return dpcm_add_paths(fe, stream, list);
@@ -1666,6 +1679,7 @@ void dpcm_clear_pending_state(struct snd_soc_pcm_ru=
ntime *fe, int stream)
=20
 void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
 		      int do_hw_free, struct snd_soc_dpcm *last)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_soc_dpcm *dpcm;
=20
@@ -1709,6 +1723,7 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *f=
e, int stream,
 }
=20
 int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_pcm_substream *fe_substream =3D snd_soc_dpcm_get_substream(f=
e, stream);
 	struct snd_soc_pcm_runtime *be;
@@ -1982,6 +1997,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_subst=
ream *fe_substream,
 }
=20
 static int dpcm_fe_dai_startup(struct snd_pcm_substream *fe_substream)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_soc_pcm_runtime *fe =3D snd_soc_substream_to_rtd(fe_substrea=
m);
 	int stream =3D fe_substream->stream, ret =3D 0;
@@ -2019,6 +2035,7 @@ static int dpcm_fe_dai_startup(struct snd_pcm_subst=
ream *fe_substream)
 }
=20
 static int dpcm_fe_dai_shutdown(struct snd_pcm_substream *substream)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_soc_pcm_runtime *fe =3D snd_soc_substream_to_rtd(substream);
 	int stream =3D substream->stream;
@@ -2044,6 +2061,7 @@ static int dpcm_fe_dai_shutdown(struct snd_pcm_subs=
tream *substream)
 }
=20
 void dpcm_be_dai_hw_free(struct snd_soc_pcm_runtime *fe, int stream)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_soc_dpcm *dpcm;
=20
@@ -2109,6 +2127,7 @@ static int dpcm_fe_dai_hw_free(struct snd_pcm_subst=
ream *substream)
 }
=20
 int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_soc_pcm_runtime *be;
 	struct snd_pcm_substream *be_substream;
@@ -2518,6 +2537,7 @@ static int dpcm_fe_dai_trigger(struct snd_pcm_subst=
ream *substream, int cmd)
 }
=20
 int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_soc_dpcm *dpcm;
 	int ret =3D 0;
@@ -2607,6 +2627,7 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_subst=
ream *substream)
 }
=20
 static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int =
stream)
+	REQUIRES(fe->card->pcm_mutex)
 {
 	int err;
=20
@@ -2626,6 +2647,7 @@ static int dpcm_run_update_shutdown(struct snd_soc_=
pcm_runtime *fe, int stream)
 }
=20
 static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int s=
tream)
+	REQUIRES(fe->card->pcm_mutex)
 {
 	struct snd_soc_dpcm *dpcm;
 	int ret =3D 0;
@@ -2699,6 +2721,7 @@ static int dpcm_run_update_startup(struct snd_soc_p=
cm_runtime *fe, int stream)
 }
=20
 static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, in=
t new)
+	REQUIRES(fe->card->pcm_mutex)
 {
 	struct snd_soc_dapm_widget_list *list;
 	int stream;
@@ -2761,6 +2784,7 @@ static int soc_dpcm_fe_runtime_update(struct snd_so=
c_pcm_runtime *fe, int new)
  * any DAI links.
  */
 int snd_soc_dpcm_runtime_update(struct snd_soc_card *card)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_soc_pcm_runtime *fe;
 	int ret =3D 0;
@@ -2787,6 +2811,7 @@ int snd_soc_dpcm_runtime_update(struct snd_soc_card=
 *card)
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
=20
 static void dpcm_fe_dai_cleanup(struct snd_pcm_substream *fe_substream)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_soc_pcm_runtime *fe =3D snd_soc_substream_to_rtd(fe_substrea=
m);
 	struct snd_soc_dpcm *dpcm;
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-ml=
ink.c
index fe627bcb0531..6c157af2f940 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -670,6 +670,7 @@ EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_check_cmdsync_unloc=
ked, "SND_SOC_SOF_HDA_MLINK
=20
 static int hdac_bus_eml_power_up_base(struct hdac_bus *bus, bool alt, in=
t elid, int sublink,
 				      bool eml_lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct hdac_ext2_link *h2link;
 	struct hdac_ext_link *hlink;
@@ -718,6 +719,7 @@ EXPORT_SYMBOL_NS(hdac_bus_eml_power_up_unlocked, "SND=
_SOC_SOF_HDA_MLINK");
=20
 static int hdac_bus_eml_power_down_base(struct hdac_bus *bus, bool alt, =
int elid, int sublink,
 					bool eml_lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct hdac_ext2_link *h2link;
 	struct hdac_ext_link *hlink;
diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index 2b1befad6d5c..d8094682607c 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -14,6 +14,7 @@
 /* IPC set()/get() for kcontrols. */
 static int sof_ipc3_set_get_kcontrol_data(struct snd_sof_control *scontr=
ol,
 					  bool set, bool lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct snd_sof_dev *sdev =3D snd_soc_component_get_drvdata(scontrol->sc=
omp);
 	struct sof_ipc_ctrl_data *cdata =3D scontrol->ipc_control_data;
diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 576f407cd456..89d21f4d197b 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -14,6 +14,7 @@
=20
 static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontr=
ol,
 					  bool set, bool lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct sof_ipc4_control_data *cdata =3D scontrol->ipc_control_data;
 	struct snd_soc_component *scomp =3D scontrol->scomp;
diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index b38a4e231790..66330f96b97b 100644
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -65,6 +65,7 @@ static void snd_sf_clear(struct snd_sf_list *sflist);
  */
 static void
 lock_preset(struct snd_sf_list *sflist)
+	ACQUIRE(sflist->presets_mutex)
 {
 	unsigned long flags;
 	mutex_lock(&sflist->presets_mutex);
@@ -79,6 +80,7 @@ lock_preset(struct snd_sf_list *sflist)
  */
 static void
 unlock_preset(struct snd_sf_list *sflist)
+	RELEASE(sflist->presets_mutex)
 {
 	unsigned long flags;
 	spin_lock_irqsave(&sflist->lock, flags);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index faf10671eed2..a59c1e02f89d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1553,6 +1553,7 @@ static int check_memory_region_flags(struct kvm *kv=
m,
 }
=20
 static void kvm_swap_active_memslots(struct kvm *kvm, int as_id)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct kvm_memslots *slots =3D kvm_get_inactive_memslots(kvm, as_id);
=20
@@ -1738,6 +1739,7 @@ static void kvm_copy_memslot(struct kvm_memory_slot=
 *dest,
 static void kvm_invalidate_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *old,
 				   struct kvm_memory_slot *invalid_slot)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	/*
 	 * Mark the current slot INVALID.  As with all memslot modifications,
@@ -1827,6 +1829,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 			   struct kvm_memory_slot *old,
 			   struct kvm_memory_slot *new,
 			   enum kvm_mr_change change)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	struct kvm_memory_slot *invalid_slot;
 	int r;
