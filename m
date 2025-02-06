Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28BC197A76
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864326; cv=none; b=gwZYmKVHqwz57MMn97ixt12lWAXNK0v8pO+YUp5rCgLh7m+Es0X5qNYqW0xPwJCi+Ne+KzGJLmkCO0aTRaE8PyLhNOo8G0bqYl1M7nGHBC4UCG+0CN9eHLRgpM8JHtIULhlr/jn7hWuzbmDgkURv4pGijgXqqF467RIyP5rv8zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864326; c=relaxed/simple;
	bh=VBi/8mcQAwpgM02efAdBc9psjgOOx0/VgpqTGmYtS9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VdYzWgTPUFPym6V7Z+mtFsKTNXfyqfUtkSaPHuEGBjx/o2+YaNl59At0igACKI+gU3426WM8Lju7B+jh7Ow6NgQnvaDbblnpumt2XUO2z44bd0XwIDgySYo37TZ4CfPgK5jHrQz5r5MUP+kqgMFxd6mFj3sDTIKhHo8ioFXY0nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=bkjS0wcU; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="bkjS0wcU"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6W4Hk0zlgTy0;
	Thu,  6 Feb 2025 17:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1738864281; x=1741456282; bh=bx9c48YPSbQcy7o1Yqg+QYNJiv2KQtoIR0U
	FiDDMyAE=; b=bkjS0wcUqOnzH780cKSUcsMyb2QrayP5uGP/qyIBcJC0PJK+m9L
	4UNerYxReCBrH/97Vem/LXrwCnu7Tr85XC+svRnPhPmbzX4ehbma/sDgGjEArv5i
	meF9YS/VhVAHbGdPYOHpERlwEMurRf6Hj8RfdUJRyCWK01eounEEHy2cJzIZE2tg
	fDZOZr9YcQ/se2uy6mnjT1jaHBQ/fNjGUEi5UyNs+iA3RZdX/U3Nz6uz4sQ4KjGv
	W13L4rZzgbzjhhAgyq1RfXNDL5XHdUe/GfeKDe9eJvdA2K4rHrqRIMOX/yEtjqau
	I3deIIHH3VeGlnJpLq0fnIqcDO6S8jJrHRA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id CJOfgJnrORcP; Thu,  6 Feb 2025 17:51:21 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl5g2tRSzlgTw4;
	Thu,  6 Feb 2025 17:51:18 +0000 (UTC)
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
Subject: [PATCH RFC 00/33] Compile-time thread-safety checking
Date: Thu,  6 Feb 2025 09:50:41 -0800
Message-ID: <20250206175114.1974171-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

As you may know the Clang compiler can perform certain thread-safety chec=
ks at
compile time. This includes checking whether locking calls in a function =
match
the function attributes and also whether annotated structure members are
protected by the synchronization objects declared with GUARDED_BY(). As o=
ne can
see this patch series includes a significant number of fixes for locking =
bugs.
All these locking bugs have been discovered by the Clang thread-safety ch=
ecker.
I think this shows that it is useful to enable compile-time thread-safety
checks.

The Clang thread-safety infrastructure is not new. Some user space code i=
n the
kernel tree already uses it. See also the header file tools/perf/util/mut=
ex.h.
There are other projects that started using this infrastructure a while a=
go,
e.g. Qemu. The header file include/qemu/clang-tsa.h was added more than t=
wo
years ago to the Qemu project.

This patch series has been posted as an RFC because at this stage my goal=
 is to
gather feedback about the following:
 - Whether or not to enable compile-time thread-safety checking in the Li=
nux
   kernel.
 - The names of the macros in header file include/linux/thread_safety.h. =
The
   proposed names come from the Clang documentation (ACQUIRE(), RELEASE()=
,
   REQUIRES(), ...). In the Qemu header file for thread-safety support th=
ese
   macros have a prefix (TSA_ =3D Thread-Safety Analysis).
 - The changes made in header file include/linux/cleanup.h that support
   annotating constructor functions with function attributes.
 - Whether or not to split the two treewide patches in this series into o=
ne
   patch per kernel driver.
 - How to merge this patch series. The second last patch in this series m=
odifies
   888 source files. If it is split into one patch per driver, this patch=
 series
   will become too large to be posted as a single patch series.

Annotating struct mutex is a first step. Once struct mutex is annotated, =
driver
contributors and/or maintainers can annotate structure members with GUARD=
ED_BY()
where this is considered useful.

There are more synchronization objects that can be annotated with thread-=
safety
attributes, e.g. spinlocks. This patch series only annotates struct mutex
because annotating other synchronization objects too would have made this=
 patch
series too large.

Thanks,

Bart.

Bart Van Assche (33):
  scsi, usb: Rename the RESERVE and RELEASE constants
  s390: Comment out the RELEASE constant
  locking: Introduce <linux/thread_safety.h>
  include/linux/cleanup.h: Support thread-safety analysis
  locking/mutex: Change the atomic_dec_and_mutex_lock() return type
  locking/mutex: Annotate struct mutex and mutex functions
  driver core: Annotate locking functions in <linux/device.h>
  kref: Add thread-safety annotations in <linux/kref.h>
  refcount: Add thread-safety annotations in <linux/refcount.h>
  treewide: Modify mutex_lock_interruptible() return value checks
  PNP: isapnp: Check the isapnp_cfg_begin() return value
  scsi: mpi3mr: Fix locking in an error path
  scsi: mpt3sas: Fix a locking bug in an error path
  ice: Split ice_dcb_rebuild()
  ice: Fix a locking bug in an error path
  net/mlx5e: Make the code easier to analyze
  Input: synaptics-rmi4 - fix a locking bug in an error path
  misc: nsm: Fix a locking bug in an error path
  drm/amdgpu: Unlock a mutex before destroying it
  drm/amdgpu: Fix a locking bug in an error path
  drm/amdgpu: Fix locking bugs in error paths
  drm: bridge: cdns-mhdp8546: Fix a locking bug in an error path
  drm: bridge: cdns-mhdp8546: Fix a locking bug in an error path
  drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()
  wifi: ath12k: Fix locking in error paths
  mctp i3c: Fix locking in error paths
  iavf: Fix a locking bug in an error path
  wifi: mt76: mt7925: Fix a locking bug in an error path
  hwmon: (it87) Check the it87_lock() return value
  drivers/net/ethernet/marvell/octeontx2/nic: Fix locking in an error
    path
  md/raid*: Fix raid*_set_queue_limits()
  treewide: Annotate all struct mutex users
  kbuild: clang: Unconditionally enable thread-safety checking

 Documentation/locking/mutex-design.rst        |   2 +-
 arch/arm64/kvm/arm.c                          |   2 +
 arch/powerpc/kernel/rtas.c                    |   1 +
 arch/powerpc/platforms/powermac/low_i2c.c     |   6 +
 arch/powerpc/platforms/pseries/papr-vpd.c     |   2 +
 arch/x86/events/core.c                        |   1 +
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c     |   1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        |   2 +
 arch/x86/kernel/cpu/sgx/encl.c                |   2 +
 arch/x86/kernel/ftrace.c                      |   2 +
 arch/x86/kernel/module.c                      |   1 +
 arch/x86/kvm/svm/sev.c                        |   6 +
 block/bdev.c                                  |   3 +
 block/blk-cgroup.c                            |   2 +
 block/ioctl.c                                 |   1 +
 drivers/accel/amdxdna/aie2_error.c            |   5 +-
 drivers/accel/qaic/qaic_control.c             |   1 +
 drivers/acpi/scan.c                           |   5 +
 drivers/ata/libata-core.c                     |  31 +++-
 drivers/ata/libata-eh.c                       |   2 +
 drivers/ata/libata.h                          |   6 +-
 drivers/base/bus.c                            |   1 +
 drivers/base/core.c                           |   7 +
 drivers/base/dd.c                             |   2 +
 drivers/base/power/clock_ops.c                |   4 +
 drivers/base/power/main.c                     |   2 +
 drivers/base/regmap/regmap-irq.c              |   2 +
 drivers/base/regmap/regmap.c                  |   2 +
 drivers/block/drbd/drbd_bitmap.c              |   2 +
 drivers/block/drbd/drbd_main.c                |   7 +
 drivers/block/drbd/drbd_nl.c                  |   1 +
 drivers/block/drbd/drbd_receiver.c            |   1 +
 drivers/block/drbd/drbd_state.c               |   4 +
 drivers/block/loop.c                          |   2 +
 drivers/block/nbd.c                           |   3 +
 drivers/block/null_blk/zoned.c                |   2 +
 drivers/block/rnbd/rnbd-clt.c                 |   2 +
 drivers/bus/fsl-mc/mc-sys.c                   |   1 +
 drivers/bus/vexpress-config.c                 |   2 +
 drivers/cdx/cdx_msi.c                         |   2 +
 drivers/char/ipmi/ipmi_msghandler.c           |   1 +
 drivers/char/misc.c                           |   2 +
 drivers/char/powernv-op-panel.c               |   2 +
 drivers/char/tpm/tpm-chip.c                   |   3 +
 drivers/char/xillybus/xillybus_core.c         |   1 +
 drivers/clk/clk.c                             |   4 +
 drivers/comedi/comedi_fops.c                  |   2 +
 drivers/comedi/drivers.c                      |   1 +
 drivers/comedi/drivers/usbduxsigma.c          |   1 +
 drivers/counter/rz-mtu3-cnt.c                 |   3 +
 drivers/cpuidle/cpuidle.c                     |   2 +
 drivers/crypto/exynos-rng.c                   |   1 +
 drivers/crypto/hisilicon/qm.c                 |   4 +
 drivers/crypto/intel/qat/qat_common/adf_cfg.c |   2 +
 .../qat/qat_common/adf_transport_debug.c      |   4 +
 drivers/cxl/core/port.c                       |   2 +
 drivers/devfreq/devfreq.c                     |   1 +
 drivers/dpll/dpll_netlink.c                   |   6 +
 drivers/firmware/arm_ffa/driver.c             |   1 +
 drivers/firmware/arm_scmi/notify.c            |   1 +
 .../firmware/arm_scmi/transports/mailbox.c    |   2 +
 drivers/firmware/arm_scmi/transports/optee.c  |   2 +
 .../firmware/qcom/qcom_qseecom_uefisecapp.c   |   2 +
 drivers/fpga/fpga-bridge.c                    |   2 +
 drivers/fpga/fpga-region.c                    |   3 +
 drivers/gpio/gpio-adnp.c                      |   2 +
 drivers/gpio/gpio-crystalcove.c               |   2 +
 drivers/gpio/gpio-dln2.c                      |   2 +
 drivers/gpio/gpio-ljca.c                      |   2 +
 drivers/gpio/gpio-max77620.c                  |   2 +
 drivers/gpio/gpio-mlxbf2.c                    |   6 +-
 drivers/gpio/gpio-pca953x.c                   |   2 +
 drivers/gpio/gpio-pcf857x.c                   |   2 +
 drivers/gpio/gpio-pmic-eic-sprd.c             |   2 +
 drivers/gpio/gpio-stmpe.c                     |   2 +
 drivers/gpio/gpio-tc3589x.c                   |   2 +
 drivers/gpio/gpio-virtio.c                    |   2 +
 drivers/gpio/gpio-wcove.c                     |   2 +
 drivers/gpu/drm/amd/amdgpu/aldebaran.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c       |   1 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    |   4 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |   4 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    |   4 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c    |   4 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c |   4 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c |   4 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c    |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h  |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c        |   3 +-
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    |   2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c         |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |   4 +
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |   5 +
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |   2 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    |   1 +
 drivers/gpu/drm/ast/ast_ddc.c                 |   2 +
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |   9 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c    |   2 +
 drivers/gpu/drm/clients/drm_log.c             |   2 +
 drivers/gpu/drm/display/drm_dp_helper.c       |   3 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c |   2 +
 drivers/gpu/drm/drm_atomic_helper.c           |   3 +
 drivers/gpu/drm/drm_auth.c                    |   2 +
 drivers/gpu/drm/drm_client_modeset.c          |   1 +
 drivers/gpu/drm/drm_color_mgmt.c              |   1 +
 drivers/gpu/drm/drm_crtc.c                    |   1 +
 drivers/gpu/drm/drm_drv.c                     |   1 +
 drivers/gpu/drm/drm_fb_helper.c               |   1 +
 drivers/gpu/drm/drm_file.c                    |   4 +
 drivers/gpu/drm/drm_gem.c                     |   4 +-
 drivers/gpu/drm/drm_mode_object.c             |   2 +
 drivers/gpu/drm/drm_modeset_lock.c            |   2 +
 drivers/gpu/drm/drm_plane.c                   |   1 +
 drivers/gpu/drm/drm_prime.c                   |   1 +
 drivers/gpu/drm/i915/display/intel_cdclk.c    |   1 +
 .../drm/i915/display/intel_display_reset.c    |   2 +
 drivers/gpu/drm/i915/display/intel_gmbus.c    |   3 +
 drivers/gpu/drm/i915/display/intel_pps.c      |   2 +
 drivers/gpu/drm/i915/display/intel_psr.c      |   3 +
 drivers/gpu/drm/i915/display/intel_tc.c       |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |   2 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   1 +
 drivers/gpu/drm/i915/gt/intel_context.h       |   4 +
 drivers/gpu/drm/i915/gt/selftest_context.c    |   1 +
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |   1 +
 drivers/gpu/drm/i915/gvt/vgpu.c               |   1 +
 drivers/gpu/drm/i915/i915_request.c           |   1 +
 drivers/gpu/drm/i915/i915_vma.c               |   3 +-
 drivers/gpu/drm/i915/intel_sbi.c              |   2 +
 drivers/gpu/drm/i915/intel_wakeref.c          |   2 +
 drivers/gpu/drm/i915/intel_wakeref.h          |   2 +
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c      |   1 +
 drivers/gpu/drm/i915/vlv_sideband.c           |   2 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   1 +
 drivers/gpu/drm/mgag200/mgag200_ddc.c         |   2 +
 drivers/gpu/drm/msm/msm_atomic.c              |   2 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   2 +
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |   2 +
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |   2 +
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c    |   1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   |   3 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  |   1 +
 drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c    |   3 +
 .../gpu/drm/nouveau/nvkm/subdev/i2c/auxch.c   |   2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c |   2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.c |   2 +
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    |  24 +--
 drivers/gpu/drm/panthor/panthor_mmu.c         |   1 +
 drivers/gpu/drm/qxl/qxl_cmd.c                 |   1 +
 drivers/gpu/drm/qxl/qxl_display.c             |   2 +
 drivers/gpu/drm/radeon/radeon_i2c.c           |   2 +
 drivers/gpu/drm/radeon/radeon_ring.c          |   3 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  |   2 +
 drivers/gpu/drm/tegra/hdmi.c                  |   2 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c           |   7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c        |   5 +
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    |   3 +
 drivers/gpu/drm/xe/xe_migrate.c               |   1 +
 drivers/gpu/drm/xe/xe_pcode.c                 |   1 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |   2 +-
 drivers/gpu/host1x/bus.c                      |   2 +
 drivers/gpu/host1x/cdma.c                     |   6 +
 drivers/gpu/host1x/context.c                  |   1 +
 drivers/gpu/host1x/mipi.c                     |   2 +
 drivers/hid/hid-wiimote.h                     |   3 +
 drivers/hv/channel.c                          |   2 +
 drivers/hwmon/abituguru.c                     |   2 +
 drivers/hwmon/abituguru3.c                    |   2 +
 drivers/hwmon/asus_rog_ryujin.c               |   4 +-
 drivers/hwmon/gigabyte_waterforce.c           |   2 +-
 drivers/hwmon/it87.c                          |   6 +-
 drivers/hwmon/lm78.c                          |   1 +
 drivers/hwmon/nct7904.c                       |   2 +
 drivers/hwmon/nzxt-kraken3.c                  |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c              |   1 +
 drivers/hwmon/w83781d.c                       |   1 +
 drivers/hwtracing/intel_th/msu.c              |   1 +
 drivers/hwtracing/stm/policy.c                |   2 +
 drivers/i2c/busses/i2c-amd-mp2-pci.c          |   2 +
 drivers/i2c/busses/i2c-xiic.c                 |   1 +
 drivers/i2c/i2c-atr.c                         |   3 +
 drivers/iio/accel/kionix-kx022a.c             |   3 +
 drivers/iio/adc/meson_saradc.c                |   2 +
 drivers/iio/buffer/industrialio-buffer-dma.c  |   2 +
 drivers/iio/industrialio-core.c               |   4 +
 drivers/iio/light/opt3001.c                   |   1 +
 drivers/infiniband/core/cma.c                 |   5 +
 drivers/infiniband/core/security.c            |   1 +
 drivers/infiniband/core/umem_odp.c            |   1 +
 drivers/infiniband/hw/hns/hns_roce_hem.c      |   2 +
 drivers/infiniband/hw/mlx4/main.c             |   2 +
 drivers/infiniband/hw/mlx5/mr.c               |   1 +
 drivers/infiniband/hw/mlx5/odp.c              |   1 +
 drivers/infiniband/hw/mlx5/umr.c              |   2 +
 drivers/infiniband/ulp/srp/ib_srp.c           |   2 +-
 drivers/infiniband/ulp/srpt/ib_srpt.c         |   4 +-
 drivers/input/input.c                         |   3 +
 drivers/input/joystick/pxrc.c                 |   2 +
 drivers/input/keyboard/adp5588-keys.c         |   2 +
 drivers/input/misc/ati_remote2.c              |   2 +
 drivers/input/misc/cm109.c                    |   2 +
 drivers/input/mouse/psmouse-base.c            |   1 +
 drivers/input/mouse/synaptics_usb.c           |   2 +
 drivers/input/rmi4/rmi_f54.c                  |   5 +-
 drivers/input/serio/i8042.c                   |   2 +
 drivers/input/serio/libps2.c                  |   2 +
 drivers/iommu/iommufd/device.c                |   2 +
 drivers/iommu/iommufd/hw_pagetable.c          |   1 +
 drivers/leds/leds-blinkm.c                    |   2 +-
 drivers/md/bcache/alloc.c                     |   2 +
 drivers/md/bcache/btree.c                     |   1 +
 drivers/md/bcache/super.c                     |   2 +
 drivers/md/dm-bufio.c                         |   2 +
 drivers/md/dm-crypt.c                         |   1 +
 drivers/md/dm-vdo/indexer/index-session.c     |   1 +
 drivers/md/dm-vdo/indexer/volume-index.c      |   3 +
 drivers/md/dm-vdo/indexer/volume.c            |   1 +
 drivers/md/dm-writecache.c                    |   6 +
 drivers/md/dm-zoned-metadata.c                |   6 +
 drivers/md/dm.c                               |   5 +
 drivers/md/md-cluster.c                       |  12 +-
 drivers/md/md.c                               |   8 +
 drivers/md/md.h                               |   9 +-
 drivers/md/raid0.c                            |   4 +-
 drivers/md/raid1.c                            |   4 +-
 drivers/md/raid10.c                           |   4 +-
 drivers/media/cec/core/cec-adap.c             |   5 +
 .../media/common/videobuf2/videobuf2-core.c   |   2 +
 .../media/common/videobuf2/videobuf2-v4l2.c   |   7 +
 drivers/media/dvb-core/dvb_frontend.c         |   1 +
 drivers/media/dvb-core/dvb_vb2.c              |   2 +
 drivers/media/dvb-frontends/bcm3510.c         |   2 +-
 drivers/media/dvb-frontends/dib0070.c         |   4 +-
 drivers/media/dvb-frontends/dib0090.c         |   8 +-
 drivers/media/dvb-frontends/dib7000m.c        |   4 +-
 drivers/media/dvb-frontends/dib7000p.c        |   4 +-
 drivers/media/dvb-frontends/dib8000.c         |  10 +-
 drivers/media/dvb-frontends/dib9000.c         |  43 +++---
 drivers/media/dvb-frontends/dibx000_common.c  |  10 +-
 drivers/media/dvb-frontends/stv090x.c         |   2 +
 drivers/media/dvb-frontends/stv0910.c         |   1 +
 drivers/media/dvb-frontends/ts2020.c          |   2 +
 drivers/media/mc/mc-device.c                  |   1 +
 drivers/media/mc/mc-entity.c                  |   1 +
 drivers/media/pci/cx18/cx18-alsa.h            |   2 +
 drivers/media/pci/ddbridge/ddbridge-core.c    |   1 +
 drivers/media/pci/ivtv/ivtv-alsa.h            |   2 +
 drivers/media/pci/ivtv/ivtv-fileops.c         |   2 +
 drivers/media/pci/ivtv/ivtv-ioctl.c           |   3 +
 drivers/media/pci/ivtv/ivtv-yuv.c             |   3 +
 drivers/media/platform/amphion/vpu_v4l2.c     |   3 +
 .../platform/chips-media/coda/coda-jpeg.c     |   1 +
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |   2 +
 .../vcodec/decoder/mtk_vcodec_dec_pm.c        |   2 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   2 +
 .../media/platform/nvidia/tegra-vde/h264.c    |   5 +
 drivers/media/platform/nvidia/tegra-vde/vde.c |   2 +
 .../platform/samsung/exynos4-is/media-dev.h   |   2 +
 .../media/platform/samsung/s5p-mfc/s5p_mfc.c  |   2 +
 drivers/media/platform/st/sti/hva/hva-hw.c    |   1 +
 drivers/media/platform/ti/omap3isp/ispvideo.c |   2 +
 .../test-drivers/vivid/vivid-kthread-cap.c    |   1 +
 drivers/media/usb/dvb-usb-v2/af9035.c         |   2 +-
 drivers/media/usb/dvb-usb-v2/anysee.c         |   2 +-
 drivers/media/usb/dvb-usb-v2/au6610.c         |   2 +-
 drivers/media/usb/dvb-usb-v2/az6007.c         |   6 +-
 drivers/media/usb/dvb-usb-v2/ce6230.c         |   2 +-
 drivers/media/usb/dvb-usb-v2/dvbsky.c         |   2 +-
 drivers/media/usb/dvb-usb-v2/ec168.c          |   2 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c        |   2 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c   |   2 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf.c       |   2 +
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c       |   2 +-
 drivers/media/usb/dvb-usb/af9005.c            |   2 +-
 drivers/media/usb/dvb-usb/az6027.c            |   2 +-
 drivers/media/usb/dvb-usb/cxusb-analog.c      |   1 +
 drivers/media/usb/dvb-usb/cxusb.c             |   3 +-
 drivers/media/usb/dvb-usb/dib0700_core.c      |  20 +--
 drivers/media/usb/dvb-usb/dibusb-common.c     |   2 +-
 drivers/media/usb/dvb-usb/digitv.c            |   2 +-
 drivers/media/usb/dvb-usb/dtv5100.c           |   2 +-
 drivers/media/usb/dvb-usb/dvb-usb-urb.c       |   3 +-
 drivers/media/usb/dvb-usb/dw2102.c            |  16 +-
 drivers/media/usb/dvb-usb/gp8psk.c            |   6 +-
 drivers/media/usb/dvb-usb/m920x.c             |   2 +-
 drivers/media/usb/dvb-usb/opera1.c            |   4 +-
 drivers/media/usb/dvb-usb/pctv452e.c          |   4 +-
 drivers/media/usb/dvb-usb/technisat-usb2.c    |  10 +-
 drivers/media/usb/dvb-usb/ttusb2.c            |   2 +-
 drivers/media/usb/dvb-usb/vp702x.c            |   5 +-
 drivers/media/usb/go7007/go7007-i2c.c         |   3 +
 drivers/media/usb/gspca/finepix.c             |   1 +
 drivers/media/usb/gspca/jl2005bcd.c           |   1 +
 drivers/media/usb/gspca/sn9c20x.c             |   1 +
 drivers/media/usb/gspca/sonixj.c              |   1 +
 drivers/media/usb/gspca/sq905.c               |   2 +
 drivers/media/usb/gspca/sq905c.c              |   1 +
 drivers/media/usb/gspca/vicam.c               |   1 +
 drivers/media/usb/gspca/zc3xx.c               |   1 +
 drivers/media/usb/hdpvr/hdpvr-video.c         |   1 +
 drivers/media/usb/pvrusb2/pvrusb2-context.c   |   2 +
 .../media/usb/ttusb-budget/dvb-ttusb-budget.c |   4 +-
 drivers/media/usb/uvc/uvc_ctrl.c              |   7 +-
 drivers/media/v4l2-core/v4l2-event.c          |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 drivers/media/v4l2-core/v4l2-mem2mem.c        |   1 +
 drivers/media/v4l2-core/v4l2-subdev.c         |   1 +
 drivers/message/fusion/mptctl.c               |  11 +-
 drivers/message/fusion/mptscsih.c             |   4 +-
 drivers/mfd/88pm860x-core.c                   |   2 +
 drivers/mfd/atc260x-core.c                    |   2 +
 drivers/mfd/kempld-core.c                     |   2 +
 drivers/mfd/lp8788-irq.c                      |   2 +
 drivers/mfd/max8925-core.c                    |   2 +
 drivers/mfd/max8997-irq.c                     |   2 +
 drivers/mfd/max8998-irq.c                     |   2 +
 drivers/mfd/mc13xxx-core.c                    |   2 +
 drivers/mfd/mt6358-irq.c                      |   2 +
 drivers/mfd/mt6397-irq.c                      |   2 +
 drivers/mfd/rc5t583-irq.c                     |   2 +
 drivers/mfd/stmfx.c                           |   2 +
 drivers/mfd/stmpe.c                           |   2 +
 drivers/mfd/tps65217.c                        |   2 +
 drivers/mfd/tps6586x.c                        |   2 +
 drivers/mfd/twl4030-irq.c                     |   2 +
 drivers/mfd/wm831x-irq.c                      |   2 +
 drivers/mfd/wm8350-irq.c                      |   2 +
 drivers/misc/cardreader/rtsx_usb.c            |   2 +
 drivers/misc/mei/client.c                     |   7 +
 drivers/misc/mei/hbm.c                        |   1 +
 drivers/misc/mei/hw-me.c                      |   9 ++
 drivers/misc/mei/hw-txe.c                     |   4 +
 drivers/misc/mei/main.c                       |   1 +
 drivers/misc/nsm.c                            |   2 +-
 drivers/misc/ntsync.c                         |   2 +
 drivers/misc/sgi-gru/grufault.c               |   3 +
 drivers/misc/sgi-gru/grumain.c                |   1 +
 drivers/misc/vmw_vmci/vmci_queue_pair.c       |   2 +
 drivers/mmc/host/vub300.c                     |   2 +
 drivers/mtd/chips/cfi_cmdset_0001.c           |   4 +
 drivers/mtd/chips/cfi_cmdset_0002.c           |   6 +
 drivers/mtd/lpddr/lpddr_cmds.c                |   4 +
 drivers/mtd/nand/ecc-mtk.c                    |   2 +
 drivers/mtd/nand/ecc-mxic.c                   |   2 +
 drivers/mtd/nand/raw/atmel/pmecc.c            |   2 +
 drivers/mtd/nand/raw/nand_base.c              |   4 +
 drivers/mtd/spi-nor/controllers/hisi-sfc.c    |   2 +
 drivers/mtd/spi-nor/core.c                    |   6 +
 drivers/net/can/softing/softing_main.c        |   1 +
 drivers/net/dsa/microchip/ksz_common.c        |   2 +
 drivers/net/dsa/microchip/ksz_common.h        |   2 +
 drivers/net/dsa/microchip/ksz_ptp.c           |   2 +
 drivers/net/dsa/mt7530-mdio.c                 |   2 +
 drivers/net/dsa/mt7530.c                      |   2 +
 drivers/net/dsa/mv88e6xxx/chip.c              |   3 +
 drivers/net/dsa/mv88e6xxx/chip.h              |   2 +
 drivers/net/dsa/mv88e6xxx/global2.c           |   2 +
 drivers/net/dsa/mv88e6xxx/pcs-6352.c          |   2 +
 drivers/net/dsa/mv88e6xxx/phy.c               |   2 +
 drivers/net/dsa/qca/ar9331.c                  |   2 +
 drivers/net/dsa/realtek/rtl83xx.c             |   2 +
 drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c   |   2 +
 .../net/ethernet/broadcom/bnx2x/bnx2x_cmn.c   |   2 +
 .../net/ethernet/broadcom/bnx2x/bnx2x_sriov.c |   2 +
 .../net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c  |   2 +
 .../net/ethernet/broadcom/bnxt/bnxt_hwrm.c    |   2 +
 drivers/net/ethernet/broadcom/tg3.c           |   1 +
 drivers/net/ethernet/davicom/dm9000.c         |   1 +
 drivers/net/ethernet/davicom/dm9051.c         |   2 +
 drivers/net/ethernet/emulex/benet/be_cmds.c   |   2 +
 .../net/ethernet/freescale/dpaa2/dpaa2-eth.c  |   2 +
 drivers/net/ethernet/hisilicon/hns3/hnae3.c   |   2 +
 .../hisilicon/hns3/hns3pf/hclge_main.c        |   1 +
 drivers/net/ethernet/intel/e1000e/82571.c     |   3 +
 drivers/net/ethernet/intel/e1000e/ich8lan.c   |   2 +
 drivers/net/ethernet/intel/iavf/iavf_main.c   |   3 +-
 drivers/net/ethernet/intel/ice/ice_common.c   |   1 +
 drivers/net/ethernet/intel/ice/ice_dcb_lib.c  |  49 +++---
 drivers/net/ethernet/intel/ice/ice_ddp.c      |   2 +
 drivers/net/ethernet/intel/ice/ice_ethtool.c  |   1 +
 drivers/net/ethernet/intel/ice/ice_main.c     |   1 +
 drivers/net/ethernet/intel/ice/ice_vf_lib.c   |   1 +
 drivers/net/ethernet/intel/idpf/idpf.h        |   2 +
 .../ethernet/marvell/octeontx2/af/rvu_nix.c   |   3 +
 .../marvell/octeontx2/af/rvu_npc_fs.c         |   1 +
 .../ethernet/marvell/octeontx2/nic/otx2_pf.c  |   2 +-
 .../net/ethernet/marvell/octeontx2/nic/rep.c  |   1 +
 .../marvell/prestera/prestera_counter.c       |   4 +
 .../ethernet/marvell/prestera/prestera_pci.c  |   2 +
 drivers/net/ethernet/mellanox/mlx4/cmd.c      |   2 +
 drivers/net/ethernet/mellanox/mlx4/port.c     |   5 +
 .../ethernet/mellanox/mlx5/core/en/mod_hdr.c  |   1 +
 .../mellanox/mlx5/core/en/reporter_rx.c       |   2 +
 .../mellanox/mlx5/core/en/tc/ct_fs_hmfs.c     |   1 +
 .../mellanox/mlx5/core/en/tc/ct_fs_smfs.c     |   1 +
 .../mellanox/mlx5/core/en/tc/int_port.c       |   1 +
 .../mellanox/mlx5/core/en/tc_tun_encap.c      |   3 +
 .../mellanox/mlx5/core/en_accel/macsec.c      |  62 +++-----
 .../net/ethernet/mellanox/mlx5/core/en_tc.c   |   1 +
 .../net/ethernet/mellanox/mlx5/core/esw/qos.c |   2 +
 .../net/ethernet/mellanox/mlx5/core/main.c    |   2 +
 .../mellanox/mlx5/core/steering/hws/bwc.c     |   2 +
 .../mlx5/core/steering/sws/dr_types.h         |   6 +
 drivers/net/ethernet/mellanox/mlxsw/i2c.c     |   4 +-
 drivers/net/ethernet/micrel/ks8851_spi.c      |   2 +
 .../ethernet/microchip/encx24j600-regmap.c    |   2 +
 .../net/ethernet/microchip/vcap/vcap_api.c    |   4 +
 .../netronome/nfp/nfpcore/nfp_cppcore.c       |   2 +
 drivers/net/ethernet/qlogic/qed/qed_ll2.c     |   1 +
 drivers/net/ethernet/qlogic/qed/qed_vf.c      |   4 +-
 drivers/net/ethernet/qlogic/qede/qede_main.c  |   7 +
 drivers/net/ethernet/sfc/ef10_sriov.c         |   1 +
 drivers/net/ethernet/sfc/efx_common.c         |   5 +
 drivers/net/ethernet/sfc/falcon/efx.c         |   2 +
 drivers/net/ethernet/sfc/mcdi_filters.c       |   1 +
 drivers/net/ethernet/sfc/siena/efx_common.c   |   3 +
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |   2 +
 drivers/net/macsec.c                          |   1 +
 drivers/net/mctp/mctp-i3c.c                   |   7 +-
 drivers/net/phy/dp83640.c                     |   2 +
 drivers/net/phy/phy-core.c                    |   3 +
 drivers/net/phy/phy_device.c                  |   1 +
 drivers/net/phy/sfp-bus.c                     |   1 +
 drivers/net/pse-pd/pse_core.c                 |   2 +-
 drivers/net/team/team_core.c                  |   2 +
 drivers/net/tun.c                             |   1 +
 drivers/net/usb/cdc_subset.c                  |   2 +-
 drivers/net/usb/hso.c                         |   2 +
 drivers/net/usb/lan78xx.c                     |   2 +
 drivers/net/wireless/ath/ath12k/core.c        |   4 +-
 drivers/net/wireless/ath/ath6kl/sdio.c        |   1 +
 drivers/net/wireless/ath/ath9k/hif_usb.c      |   1 +
 drivers/net/wireless/ath/wil6210/main.c       |   1 +
 drivers/net/wireless/ath/wil6210/p2p.c        |   2 +
 drivers/net/wireless/broadcom/b43/main.c      |   1 +
 .../net/wireless/broadcom/b43legacy/main.c    |   1 +
 .../broadcom/brcm80211/brcmfmac/fwvid.c       |   2 +
 drivers/net/wireless/intel/iwlwifi/dvm/lib.c  |   1 +
 drivers/net/wireless/intel/iwlwifi/mvm/d3.c   |   3 +
 drivers/net/wireless/intel/iwlwifi/mvm/ops.c  |   3 +
 .../wireless/intel/iwlwifi/mvm/time-event.c   |   2 +
 drivers/net/wireless/intersil/p54/p54pci.c    |   1 +
 drivers/net/wireless/intersil/p54/p54usb.c    |   3 +-
 drivers/net/wireless/marvell/mwl8k.c          |   2 +
 .../wireless/mediatek/mt76/mt7615/testmode.c  |   1 +
 .../net/wireless/mediatek/mt76/mt76_connac.h  |   2 +
 .../net/wireless/mediatek/mt76/mt7915/main.c  |   1 +
 .../wireless/mediatek/mt76/mt7915/testmode.c  |   5 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  |   6 +-
 .../net/wireless/microchip/wilc1000/wlan.c    |   2 +
 drivers/net/wireless/quantenna/qtnfmac/bus.h  |   2 +
 drivers/net/wireless/realtek/rtw88/main.c     |   1 +
 drivers/net/wireless/realtek/rtw89/core.c     |   1 +
 drivers/net/wireless/realtek/rtw89/mac80211.c |   2 +
 drivers/net/wireless/realtek/rtw89/wow.c      |   4 +
 drivers/net/wireless/realtek/rtw89/wow.h      |   2 +-
 drivers/net/wireless/rsi/rsi_91x_hal.c        |   1 +
 drivers/net/wireless/st/cw1200/pm.c           |   2 +
 drivers/net/wireless/ti/wl12xx/main.c         |   1 +
 drivers/net/wireless/ti/wlcore/main.c         |   4 +
 drivers/net/wireless/ti/wlcore/sysfs.c        |   2 +-
 drivers/net/wireless/zydas/zd1211rw/zd_usb.c  |   2 +
 drivers/nvdimm/bus.c                          |   1 +
 drivers/nvdimm/core.c                         |   2 +
 drivers/nvdimm/namespace_devs.c               |   1 +
 drivers/nvme/host/core.c                      |   2 +
 drivers/nvme/host/pci.c                       |   1 +
 drivers/nvmem/sc27xx-efuse.c                  |   2 +
 drivers/nvmem/sprd-efuse.c                    |   2 +
 drivers/of/dynamic.c                          |   4 +
 drivers/of/overlay.c                          |   2 +
 drivers/opp/core.c                            |   2 +
 drivers/pci/pci.c                             |  10 ++
 drivers/pci/pcie/bwctrl.c                     |   1 +
 drivers/pci/probe.c                           |   2 +
 drivers/pci/switch/switchtec.c                |   1 +
 drivers/pcmcia/rsrc_nonstatic.c               |   1 +
 drivers/perf/arm-cci.c                        |   1 +
 drivers/pinctrl/pinctrl-aw9523.c              |   2 +
 drivers/pinctrl/pinctrl-cy8c95x0.c            |   2 +
 drivers/pinctrl/pinctrl-mcp23s08.c            |   2 +
 drivers/pinctrl/pinctrl-stmfx.c               |   2 +
 drivers/pinctrl/pinctrl-sx150x.c              |   2 +
 drivers/platform/chrome/cros_ec_lpc_mec.c     |   2 +
 .../platform/cznic/turris-omnia-mcu-gpio.c    |   2 +
 .../platform/x86/intel/crystal_cove_charger.c |   2 +
 drivers/platform/x86/thinkpad_acpi.c          |  12 +-
 drivers/pmdomain/core.c                       |   4 +
 drivers/pmdomain/rockchip/pm-domains.c        |   2 +
 drivers/pnp/isapnp/core.c                     |  18 ++-
 drivers/power/supply/da9150-fg.c              |   2 +
 drivers/power/supply/power_supply_core.c      |   1 +
 drivers/pwm/core.c                            |   8 +
 drivers/regulator/core.c                      |   2 +
 drivers/remoteproc/mtk_scp_ipi.c              |   2 +
 drivers/s390/char/tape_std.h                  |   2 +
 drivers/scsi/aacraid/aachba.c                 |   4 +-
 drivers/scsi/aacraid/commctrl.c               |   1 +
 drivers/scsi/arm/acornscsi.c                  |   2 +-
 drivers/scsi/fnic/fnic_scsi.c                 |   1 +
 drivers/scsi/hpsa.c                           |   2 +-
 drivers/scsi/ips.c                            |   8 +-
 drivers/scsi/libfc/fc_disc.c                  |   6 +-
 drivers/scsi/libiscsi.c                       |   1 +
 drivers/scsi/megaraid.c                       |  10 +-
 drivers/scsi/megaraid/megaraid_mbox.c         |  10 +-
 drivers/scsi/megaraid/megaraid_sas.h          |   3 +-
 drivers/scsi/megaraid/megaraid_sas_base.c     |  20 ++-
 drivers/scsi/megaraid/megaraid_sas_fusion.c   |   2 +
 drivers/scsi/mpi3mr/mpi3mr_app.c              |   1 +
 drivers/scsi/mpt3sas/mpt3sas_base.c           |  12 +-
 drivers/scsi/scsi_transport_iscsi.c           |   1 +
 drivers/scsi/sg.c                             |   1 +
 drivers/scsi/smartpqi/smartpqi_init.c         |  18 +++
 drivers/siox/siox-core.c                      |   2 +
 drivers/soc/qcom/qcom_pd_mapper.c             |   1 +
 drivers/soc/tegra/pmc.c                       |   1 +
 drivers/soundwire/stream.c                    |   3 +
 drivers/spi/spi-mem.c                         |   2 +
 drivers/spi/spi.c                             |   3 +
 drivers/ssb/main.c                            |   2 +
 drivers/staging/Makefile                      |   2 +
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |   4 +-
 drivers/staging/greybus/light.c               |   2 +
 .../interface/vchiq_arm/vchiq_core.c          |   1 +
 drivers/target/iscsi/iscsi_target_tpg.c       |   1 +
 drivers/target/target_core_device.c           |   9 +-
 drivers/target/target_core_pr.c               |   6 +-
 drivers/target/target_core_spc.c              |  20 +--
 drivers/tee/amdtee/core.c                     |   1 +
 drivers/thermal/mediatek/auxadc_thermal.c     |   2 +
 drivers/thermal/tegra/soctherm.c              |   2 +
 drivers/thermal/thermal_debugfs.c             |   4 +
 drivers/tty/n_tty.c                           |   1 +
 drivers/tty/serial/sc16is7xx.c                |   2 +
 drivers/tty/tty_buffer.c                      |   2 +
 drivers/tty/tty_io.c                          |   8 +-
 drivers/tty/tty_mutex.c                       |   5 +
 drivers/ufs/core/ufshcd.c                     |   4 +
 drivers/usb/class/cdc-wdm.c                   |   6 +-
 drivers/usb/class/usblp.c                     |   5 +-
 drivers/usb/class/usbtmc.c                    |   3 +
 drivers/usb/core/devio.c                      |   7 +
 drivers/usb/core/hcd-pci.c                    |   2 +
 drivers/usb/core/hub.c                        |   7 +
 drivers/usb/core/message.c                    |   2 +-
 drivers/usb/core/sysfs.c                      |  24 +--
 drivers/usb/gadget/configfs.c                 |   6 +
 drivers/usb/gadget/function/f_fs.c            |  14 +-
 drivers/usb/gadget/function/f_mass_storage.c  |   4 +-
 drivers/usb/gadget/function/u_fs.h            |   2 +
 drivers/usb/gadget/legacy/inode.c             |  14 +-
 drivers/usb/misc/yurex.c                      |   2 +-
 drivers/usb/serial/mos7720.c                  |   2 +
 drivers/usb/serial/usb-serial.c               |   3 +
 drivers/usb/storage/debug.c                   |   4 +-
 drivers/usb/storage/transport.c               |   3 +-
 drivers/usb/storage/usb.c                     |   2 +
 drivers/usb/typec/tcpm/tcpm.c                 |  16 ++
 drivers/usb/usb-skeleton.c                    |   2 +-
 drivers/usb/usbip/stub_dev.c                  |   2 +-
 drivers/usb/usbip/stub_main.c                 |   1 +
 drivers/usb/usbip/stub_rx.c                   |   2 +-
 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c          |   2 +
 drivers/vfio/group.c                          |   1 +
 drivers/vfio/pci/mlx5/cmd.h                   |   3 +-
 drivers/vfio/pci/virtio/migrate.c             |   1 +
 drivers/vfio/vfio_iommu_type1.c               |   1 +
 drivers/vhost/vhost.c                         |   3 +
 drivers/video/fbdev/core/fb_procfs.c          |   2 +
 drivers/video/fbdev/smscufx.c                 |   1 +
 drivers/video/fbdev/udlfb.c                   |   1 +
 drivers/virt/vboxguest/vboxguest_linux.c      |   2 +
 drivers/virtio/virtio_mem.c                   |   5 +
 drivers/w1/masters/omap_hdq.c                 |   8 +-
 drivers/w1/slaves/w1_therm.c                  |   9 ++
 drivers/w1/w1.c                               |   3 +
 drivers/w1/w1_netlink.c                       |   1 +
 drivers/xen/balloon.c                         |   2 +
 drivers/xen/xen-pciback/passthrough.c         |   1 +
 drivers/xen/xen-pciback/vpci.c                |   1 +
 drivers/xen/xenbus/xenbus_comms.c             |   1 +
 drivers/xen/xenbus/xenbus_xs.c                |   4 +
 fs/affs/affs.h                                |   6 +
 fs/afs/validation.c                           |   3 +-
 fs/afs/vl_alias.c                             |   6 +-
 fs/autofs/waitq.c                             |   3 +
 fs/bcachefs/alloc_foreground.c                |   4 +
 fs/bcachefs/alloc_foreground.h                |   1 +
 fs/bcachefs/btree_locking.c                   |   1 +
 fs/bcachefs/btree_write_buffer.c              |   4 +
 fs/bcachefs/debug.c                           |   2 +
 fs/bcachefs/ec.c                              |   3 +
 fs/bcachefs/fs-ioctl.c                        |   1 +
 fs/bcachefs/fs.c                              |   4 +
 fs/bcachefs/io_write.c                        |   3 +
 fs/bcachefs/journal.c                         |   2 +
 fs/bcachefs/quota.c                           |   2 +
 fs/bcachefs/seqmutex.h                        |   4 +
 fs/btrfs/block-group.c                        |   2 +
 fs/btrfs/delayed-ref.c                        |   4 +
 fs/btrfs/delayed-ref.h                        |   1 +
 fs/btrfs/extent-tree.c                        |   1 +
 fs/btrfs/free-space-cache.c                   |   1 +
 fs/btrfs/ioctl.c                              |   2 +
 fs/btrfs/qgroup.c                             |   1 +
 fs/btrfs/scrub.c                              |   2 +
 fs/btrfs/tests/delayed-refs-tests.c           |   1 +
 fs/btrfs/tree-log.c                           |   2 +
 fs/btrfs/volumes.c                            |   4 +
 fs/btrfs/zoned.h                              |   4 +
 fs/ceph/caps.c                                |   4 +
 fs/ceph/mds_client.c                          |   1 +
 fs/coda/upcall.c                              |   1 +
 fs/dcache.c                                   |   1 +
 fs/dlm/recoverd.c                             |   2 +
 fs/ecryptfs/main.c                            |   1 +
 fs/ecryptfs/messaging.c                       |   1 +
 fs/erofs/zdata.c                              |   3 +
 fs/eventpoll.c                                |   3 +
 fs/exec.c                                     |   4 +
 fs/ext4/fast_commit.c                         |   1 +
 fs/ext4/mballoc.c                             |   2 +
 fs/f2fs/data.c                                |   1 +
 fs/fat/fatent.c                               |   2 +
 fs/fat/inode.c                                |   2 +
 fs/file.c                                     |   2 +
 fs/fsopen.c                                   |   2 +-
 fs/fuse/inode.c                               |   2 +
 fs/gfs2/rgrp.c                                |   2 +
 fs/gfs2/util.c                                |   1 +
 fs/hfs/bfind.c                                |   2 +
 fs/hfsplus/bfind.c                            |   2 +
 fs/hfsplus/extents.c                          |   2 +
 fs/hpfs/hpfs_fn.h                             |   2 +
 fs/jbd2/checkpoint.c                          |   2 +
 fs/jbd2/commit.c                              |   1 +
 fs/jbd2/journal.c                             |   5 +
 fs/jbd2/transaction.c                         |   2 +
 fs/jffs2/dir.c                                |   4 +
 fs/jffs2/fs.c                                 |   1 +
 fs/jffs2/gc.c                                 |   1 +
 fs/jffs2/nodemgmt.c                           |   2 +
 fs/jffs2/write.c                              |   2 +
 fs/jfs/namei.c                                |   1 +
 fs/kernfs/file.c                              |   9 ++
 fs/lockd/host.c                               |   1 +
 fs/lockd/svclock.c                            |   1 +
 fs/namei.c                                    |   4 +
 fs/namespace.c                                |   2 +-
 fs/netfs/write_issue.c                        |   2 +
 fs/nfsd/nfs4layouts.c                         |   2 +
 fs/nfsd/nfs4proc.c                            |   2 +
 fs/nfsd/nfs4state.c                           |  11 ++
 fs/ntfs3/frecord.c                            |   4 +-
 fs/ntfs3/inode.c                              |   1 +
 fs/ntfs3/namei.c                              |   2 +
 fs/ntfs3/ntfs_fs.h                            |   4 +
 fs/ntfs3/record.c                             |   1 +
 fs/ntfs3/xattr.c                              |   2 +
 fs/ocfs2/cluster/nodemanager.c                |   2 +
 fs/ocfs2/dlmglue.c                            |   2 +
 fs/ocfs2/inode.c                              |   2 +
 fs/ocfs2/refcounttree.c                       |   2 +
 fs/orangefs/devorangefs-req.c                 |   2 +-
 fs/orangefs/orangefs-debugfs.c                |   2 +
 fs/orangefs/waitqueue.c                       |   1 +
 fs/overlayfs/overlayfs.h                      |   3 +
 fs/pipe.c                                     |   2 +
 fs/proc/base.c                                |   2 +-
 fs/proc/proc_tty.c                            |   2 +
 fs/pstore/zone.c                              |   1 +
 fs/smb/client/cifsglob.h                      |   2 +
 fs/smb/client/connect.c                       |   3 +-
 fs/smb/client/fs_context.h                    |   2 +
 fs/smb/client/smbdirect.c                     |   2 +
 fs/smb/client/smbdirect.h                     |   2 +-
 fs/smb/server/connection.h                    |   6 +-
 fs/super.c                                    |   6 +
 fs/ubifs/compress.c                           |   2 +
 fs/ubifs/dir.c                                |   4 +
 fs/ubifs/file.c                               |   6 +
 fs/ubifs/journal.c                            |   3 +
 fs/ubifs/misc.h                               |   2 +
 fs/xfs/scrub/dirtree.c                        |   2 +
 fs/xfs/scrub/dirtree_repair.c                 |   3 +
 fs/xfs/scrub/quota.c                          |   1 +
 fs/xfs/scrub/quota_repair.c                   |   3 +
 fs/xfs/scrub/quotacheck_repair.c              |   3 +
 fs/xfs/scrub/rmap_repair.c                    |   1 +
 fs/xfs/scrub/rtrmap_repair.c                  |   1 +
 fs/xfs/xfs_dquot.c                            |   7 +
 fs/xfs/xfs_dquot.h                            |  10 +-
 fs/xfs/xfs_dquot_item.c                       |   2 +
 fs/xfs/xfs_qm.c                               |   3 +
 fs/xfs/xfs_qm_syscalls.c                      |   1 +
 fs/xfs/xfs_trans_dquot.c                      |   3 +
 include/linux/blkdev.h                        |  11 +-
 include/linux/cgroup.h                        |   2 +
 include/linux/cleanup.h                       |  34 ++++-
 include/linux/device.h                        |  13 +-
 include/linux/fb.h                            |   2 +
 include/linux/fpga/fpga-bridge.h              |   2 +-
 include/linux/fpga/fpga-mgr.h                 |   4 +-
 include/linux/fsnotify_backend.h              |   2 +
 include/linux/gameport.h                      |   1 +
 include/linux/kref.h                          |   3 +
 include/linux/memory_hotplug.h                |   2 +
 include/linux/mfd/si476x-core.h               |   2 +
 include/linux/mutex.h                         |  46 +++---
 include/linux/mutex_types.h                   |   5 +-
 include/linux/netdevice.h                     |   2 +
 include/linux/phy.h                           |   2 +
 include/linux/refcount.h                      |   5 +-
 include/linux/thread_safety.h                 | 141 ++++++++++++++++++
 include/linux/usb.h                           |   3 +-
 include/media/v4l2-ctrls.h                    |   2 +
 include/media/v4l2-subdev.h                   |   5 +
 include/net/bluetooth/l2cap.h                 |   2 +
 include/net/cfg80211.h                        |   2 +
 include/scsi/scsi_proto.h                     |   4 +-
 include/sound/emu10k1.h                       |  12 +-
 include/sound/i2c.h                           |   2 +
 include/sound/soc-card.h                      |   3 +
 include/sound/soc.h                           |  14 ++
 include/trace/events/scsi.h                   |   4 +-
 include/trace/events/target.h                 |   4 +-
 io_uring/cancel.c                             |   1 +
 io_uring/fdinfo.c                             |   1 +
 io_uring/io_uring.c                           |   5 +
 io_uring/io_uring.h                           |   2 +
 io_uring/msg_ring.c                           |   3 +
 io_uring/register.c                           |   6 +
 io_uring/rsrc.c                               |   3 +
 io_uring/sqpoll.c                             |   3 +
 io_uring/tctx.c                               |   1 +
 kernel/acct.c                                 |   3 +
 kernel/audit.c                                |   2 +
 kernel/audit_tree.c                           |   2 +
 kernel/audit_watch.c                          |   1 +
 kernel/bpf/btf.c                              |   1 +
 kernel/bpf/cgroup_iter.c                      |   2 +
 kernel/bpf/verifier.c                         |   1 +
 kernel/cgroup/cgroup-v1.c                     |   4 +
 kernel/cgroup/cgroup.c                        |  18 +++
 kernel/cgroup/cpuset.c                        |   2 +
 kernel/cpu.c                                  |   2 +
 kernel/events/callchain.c                     |   1 +
 kernel/events/core.c                          |   9 ++
 kernel/events/hw_breakpoint.c                 |   2 +
 kernel/fail_function.c                        |   2 +
 kernel/futex/core.c                           |   3 +
 kernel/irq/autoprobe.c                        |   3 +
 kernel/irq/irqdesc.c                          |   2 +
 kernel/irq/msi.c                              |   2 +
 kernel/jump_label.c                           |   2 +
 kernel/kprobes.c                              |   3 +
 kernel/locking/locktorture.c                  |   4 +
 kernel/locking/mutex.c                        |  20 ++-
 kernel/module/main.c                          |   1 +
 kernel/module/procfs.c                        |   2 +
 kernel/params.c                               |   2 +
 kernel/power/autosleep.c                      |   2 +
 kernel/power/main.c                           |   2 +
 kernel/printk/printk.c                        |   2 +
 kernel/rcu/srcutree.c                         |   4 +-
 kernel/rcu/tree_exp.h                         |   1 +
 kernel/sched/core.c                           |   1 +
 kernel/seccomp.c                              |  11 +-
 kernel/static_call_inline.c                   |   2 +
 kernel/torture.c                              |   2 +
 kernel/trace/ftrace.c                         |   7 +
 kernel/trace/ring_buffer.c                    |   2 +
 kernel/trace/rv/rv.c                          |   3 +
 kernel/trace/rv/rv_reactors.c                 |   2 +
 kernel/trace/trace.c                          |  12 ++
 kernel/trace/trace_dynevent.c                 |   2 +
 kernel/trace/trace_events.c                   |  10 ++
 kernel/trace/trace_events_trigger.c           |   2 +
 kernel/trace/trace_events_user.c              |   1 +
 kernel/trace/trace_hwlat.c                    |   2 +
 kernel/trace/trace_osnoise.c                  |   2 +
 kernel/trace/trace_printk.c                   |   8 +
 kernel/trace/trace_recursion_record.c         |   2 +
 kernel/trace/trace_stat.c                     |   2 +
 kernel/trace/trace_uprobe.c                   |   2 +
 kernel/workqueue.c                            |   2 +
 lib/Makefile                                  |   2 +
 lib/dynamic_debug.c                           |   2 +
 lib/error-inject.c                            |   2 +
 lib/kunit/platform.c                          |   1 +
 lib/once.c                                    |   2 +
 mm/damon/sysfs.c                              |   3 +
 mm/hugetlb.c                                  |   4 +
 mm/kmemleak.c                                 |   6 +-
 mm/ksm.c                                      |   1 +
 mm/oom_kill.c                                 |   1 +
 mm/page_alloc.c                               |   4 +
 mm/percpu.c                                   |   1 +
 mm/slab_common.c                              |   2 +
 mm/swap_slots.c                               |   2 +
 mm/swapfile.c                                 |   2 +
 mm/vma.c                                      |   2 +
 mm/zswap.c                                    |   2 +
 net/atm/resources.c                           |   2 +
 net/bluetooth/l2cap_core.c                    |   9 ++
 net/bluetooth/l2cap_sock.c                    |   2 +
 net/bluetooth/rfcomm/sock.c                   |   1 +
 net/bridge/netfilter/ebtables.c               |   5 +
 net/caif/caif_socket.c                        |   2 +
 net/can/j1939/main.c                          |   2 +
 net/ceph/messenger.c                          |   3 +
 net/ceph/messenger_v1.c                       |   2 +
 net/ceph/messenger_v2.c                       |  14 ++
 net/core/dev.c                                |   4 +
 net/core/drop_monitor.c                       |   2 +
 net/core/netdev-genl.c                        |   5 +
 net/core/pktgen.c                             |   1 +
 net/core/rtnetlink.c                          |  12 ++
 net/core/sock.c                               |   2 +
 net/devlink/core.c                            |   3 +
 net/devlink/devl_internal.h                   |   2 +
 net/ethtool/ioctl.c                           |   1 +
 net/ipv6/mcast.c                              |   1 +
 net/mac802154/cfg.c                           |   2 +
 net/mac802154/mib.c                           |   2 +
 net/netfilter/ipset/ip_set_core.c             |   2 +
 net/netfilter/ipvs/ip_vs_app.c                |   2 +
 net/netfilter/nf_log.c                        |   2 +
 net/netfilter/nf_tables_api.c                 |   5 +
 net/netfilter/nfnetlink.c                     |   2 +
 net/netfilter/x_tables.c                      |   8 +
 net/netfilter/xt_hashlimit.c                  |   1 +
 net/netlink/af_netlink.c                      |   2 +
 net/netlink/genetlink.c                       |   7 +
 net/openvswitch/datapath.c                    |   2 +
 net/phonet/socket.c                           |   2 +
 net/qrtr/af_qrtr.c                            |   1 +
 net/rds/ib_cm.c                               |   1 +
 net/rds/rdma_transport.c                      |   1 +
 net/rds/tcp_listen.c                          |   1 +
 net/rxrpc/af_rxrpc.c                          |   1 +
 net/rxrpc/call_object.c                       |   1 +
 net/rxrpc/recvmsg.c                           |   2 +-
 net/rxrpc/sendmsg.c                           |   5 +-
 net/sched/act_api.c                           |   1 +
 net/sched/cls_api.c                           |   1 +
 net/shaper/shaper.c                           |   2 +
 net/smc/af_smc.c                              |   1 +
 net/sunrpc/rpc_pipe.c                         |   2 +
 net/sunrpc/svc_xprt.c                         |   2 +
 net/unix/af_unix.c                            |   1 +
 net/unix/unix_bpf.c                           |   1 +
 net/wireless/nl80211.c                        |   9 ++
 samples/vfio-mdev/mtty.c                      |   1 +
 scripts/Makefile.clang                        |   3 +
 security/apparmor/apparmorfs.c                |   3 +
 security/integrity/ima/ima_fs.c               |   2 +-
 security/integrity/ima/ima_main.c             |   1 +
 security/keys/keyring.c                       |   3 +
 security/tomoyo/gc.c                          |   3 +
 sound/core/compress_offload.c                 |   3 +
 sound/core/oss/pcm_oss.c                      |   9 ++
 sound/core/pcm_native.c                       |   8 +
 sound/core/seq/oss/seq_oss.c                  |   1 +
 sound/core/seq/seq_clientmgr.c                |   2 +
 sound/core/seq/seq_memory.c                   |   1 +
 sound/core/sound.c                            |   1 +
 sound/isa/gus/gus_mem.c                       |   3 +
 sound/pci/ac97/ac97_codec.c                   |   2 +
 sound/pci/hda/hda_intel.c                     |   1 +
 sound/pci/hda/patch_realtek.c                 |   2 +
 sound/pci/hda/tas2781_hda_i2c.c               |   1 +
 sound/pci/ice1712/ak4xxx.c                    |   2 +
 sound/pci/ice1712/delta.c                     |   4 +
 sound/pci/ice1712/ews.c                       |   6 +
 sound/pci/ice1712/hoontech.c                  |   1 +
 sound/pci/ice1712/ice1712.h                   |   2 +
 sound/pci/ice1712/prodigy192.c                |   2 +
 sound/pci/ice1712/revo.c                      |   4 +
 sound/pci/oxygen/oxygen_lib.c                 |   2 +-
 sound/pci/pcxhr/pcxhr_core.c                  |   1 +
 sound/soc/codecs/rt5677.c                     |   2 +
 sound/soc/codecs/wcd-mbhc-v2.c                |   7 +-
 sound/soc/soc-dapm.c                          |   9 ++
 sound/soc/soc-pcm.c                           |  25 ++++
 sound/soc/sof/intel/hda-mlink.c               |   2 +
 sound/soc/sof/ipc3-control.c                  |   1 +
 sound/soc/sof/ipc4-control.c                  |   1 +
 sound/synth/emux/soundfont.c                  |   2 +
 virt/kvm/kvm_main.c                           |   3 +
 910 files changed, 2635 insertions(+), 422 deletions(-)
 create mode 100644 include/linux/thread_safety.h

