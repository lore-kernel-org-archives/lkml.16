Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F491AB531
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 08:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746260933; cv=none; b=U9mAuF9eN/0qs2UH8KqeuxaAQAwmlxFqJtn0c8CgwosadmZ43TbQKaxYFNo2FXhc33RVxq/5ZmMp8NrIQ/MjUFgFfSGIYKNdIIXIAAITL/QGBheTfZMOJ4fgzg7MX6j2+1+Wg//MlUd4XI4sazVVcjF1Nl6JZf5/L8U5J5vsd+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746260933; c=relaxed/simple;
	bh=iaEObjdTT41RLL8fhb0KJROoDy/wkGUZXMyIKH+sDqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pij6soR2eoyJcjSvdKge0s/WpXteGSXL8ucmUaJArso0sulj7BuSOQ5evsD/WU4P6MK4j/8zIejGOnDsIUMe/ZjiA9n67leZwvPON9wao76lvWlwgNt8f1cPINYc89sqklajiXJX8EHJdFaZWdd2+BabJz10W8TVHqR0rZtT6XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Dqc/bdQN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Dqc/bdQN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso11131995e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 01:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746260928; x=1746865728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mm2GMgYkRvl6f8ZBK/JPVRPhxPqwP3nfgJ+d+TaZ054=;
        b=Dqc/bdQNmIkXj/rKCTXYdefIKmnI40zM1nx4//683NzQzgzK1+NYw8b96coAome7K2
         I4Vlj/TvF/FbzHGJBj2B4/YrgeXhBoFBX87vXu9UFMd+CWbisWfHJtNzAPDlPIe4j3F4
         QEMLqZsmyt5ZI0+UZcAfd0nLsKB1BDkA3/s5x73RJtkNWx5MoGQdA+gqYmGxLy0Xt5Bp
         qlSvtez5JKDUqb7+vugnzghspNzhf1ezWVaOYzHWZdEiPMv19RyF/X/EQqIVDqgjVUbS
         PdRKffGT+crpdV+pMYRYusLjcqvhwxljLxhflUV+Q52TOMNK6TmDJJieWSwN8IZ744/X
         KS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746260928; x=1746865728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mm2GMgYkRvl6f8ZBK/JPVRPhxPqwP3nfgJ+d+TaZ054=;
        b=sLeyemeEfwedbs6/VaG3uCdllH28+pjJTa1KpPyJRcTwuscocLIVe3lobuu3RT532u
         IgJtM/UlxyfUhpiSnIH/QKRiVDAboY1Uwycw78d+CfZbK3j23Mn5AP5UOZYHVq0kPvbf
         N7t9LH7eXYb9Fali9i0qAQFHyb+Bt/vvzaMZ30P0RQ/SGtHXx25HIx9u/SHcZltzxwvy
         ++M0sar9Zj1SYbEEdGb+Bb0pGIfJM/6eiCbRpQ6QxMwVwrU0fIX4GUGmpKa79fbnedN9
         fVPOIegamzq+XjFY0zI0BNPBFOk5p+OOn9iHrQwQBygoVrf2tLWvk+lEP+oTQW7bh0gM
         G7Cw==
X-Gm-Message-State: AOJu0Yz5Ui5tPEnLwiMPK91TU+EJkXWza2rjRX8kKWVW96Nc0i4M86Xq
	IUGero4asnbAlCyfcE5uSRp7/08tCkwC8HJX5nWTri7OiP7YoduaZg6YxgMQT9HrurI179zCDaJ
	8
X-Gm-Gg: ASbGncsryQqlyiykWTsHkqnpztAOtwmSFvjuk2cc8BhJJ1yOcijl10xpZLh2Pribj+p
	rquWI/yCAZm1Gs8Shkcve1I3qLK0imIAvNZiw6i/X+5o7EDShqq0tWJ8G1r+C2yYvWlMFlLj+i0
	ZNYwpplML4syeo+k400Ng33DacxOmCgqPC0HN+c5RO6NJMmamJF3ph4gGk+AtapAJ4dFaLDOBNs
	ZhVy0S1zB9pc+spcC03MmXZGChC0ddCTtp4sTp+rZTl6xWknQSRdFmIjKlAb7HaW2Opy/3xe98R
	nC4lWyoTqyICQ5roneaHuVaNhIJZksSTLg9i3RHSghXgVQvX
X-Google-Smtp-Source: AGHT+IF2okam6sefWgsaqU80FMTDWWThzFfBjQHYLW7mCsH2v7k7JJ2jGB4bL/bfuw9YQztbSdYXyQ==
X-Received: by 2002:a05:600c:5250:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-441c49237b3mr1988595e9.20.1746260928284;
        Sat, 03 May 2025 01:28:48 -0700 (PDT)
Received: from linux.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc441sm68633445e9.3.2025.05.03.01.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 01:28:47 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: [PATCH 0/4] Workqueue: rename system workqueue and add WQ_PERCPU
Date: Sat,  3 May 2025 10:28:30 +0200
Message-ID: <20250503082834.49413-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi!

This series is the follow up of the discussion from:
	"workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOUND."
	https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

1)  [P 1-2] system workqueue rename:
 
	system_wq is a per-CPU workqueue, but his name is not clear.
	system_unbound_wq is to be used when locality is not required.
	
	system_wq renamed in system_percpu_wq, while system_unbound_wq
	became system_dfl_wq.

2)  [P 3] Introduction of WQ_PERCPU.

	This patch adds a new WQ_PERCPU flag to explicitly request the legacy
	per-CPU behavior. WQ_UNBOUND will be removed once the migration is
	complete.

	Every alloc_workqueue() caller should use one among WQ_PERCPU or
	WQ_UNBOUND. This is actually enforced warning if both or none of them
	are present at the same time.

3)  [P 4] alloc_workqueue() callee should pass explicitly WQ_PERCPU.

	This patch ensures that every caller that needs per-cpu workqueue
	will explicitly require it, using the WQ_PERCPU flag.
	

Marco Crivellari (4):
  Workqueue: rename system_wq to system_percpu_wq
  Workqueue: rename system_unbound_wq to system_dfl_wq
  Workqueue: add WQ_PERCPU
  Workqueue: add WQ_PERCPU to every alloc_workqueue user

 arch/s390/kernel/diag/diag324.c               |  4 +-
 arch/s390/kernel/hiperdispatch.c              |  2 +-
 block/bio-integrity-auto.c                    |  5 ++-
 block/bio.c                                   |  3 +-
 block/blk-core.c                              |  3 +-
 block/blk-throttle.c                          |  3 +-
 block/blk-zoned.c                             |  3 +-
 crypto/cryptd.c                               |  3 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c             |  2 +-
 drivers/accel/ivpu/ivpu_ipc.c                 |  2 +-
 drivers/accel/ivpu/ivpu_job.c                 |  2 +-
 drivers/accel/ivpu/ivpu_mmu.c                 |  2 +-
 drivers/accel/ivpu/ivpu_pm.c                  |  4 +-
 drivers/acpi/ec.c                             |  3 +-
 drivers/acpi/osl.c                            |  6 +--
 drivers/acpi/scan.c                           |  2 +-
 drivers/acpi/thermal.c                        |  3 +-
 drivers/ata/libata-sff.c                      |  3 +-
 drivers/base/core.c                           |  2 +-
 drivers/base/dd.c                             |  2 +-
 drivers/base/devcoredump.c                    |  2 +-
 drivers/block/aoe/aoemain.c                   |  2 +-
 drivers/block/nbd.c                           |  2 +-
 drivers/block/rbd.c                           |  2 +-
 drivers/block/rnbd/rnbd-clt.c                 |  2 +-
 drivers/block/sunvdc.c                        |  4 +-
 drivers/block/virtio_blk.c                    |  2 +-
 drivers/block/zram/zram_drv.c                 |  2 +-
 drivers/bus/mhi/ep/main.c                     |  2 +-
 drivers/char/random.c                         |  8 ++--
 drivers/char/tpm/tpm-dev-common.c             |  3 +-
 drivers/char/xillybus/xillybus_core.c         |  2 +-
 drivers/char/xillybus/xillyusb.c              |  4 +-
 drivers/cpufreq/tegra194-cpufreq.c            |  3 +-
 drivers/crypto/atmel-i2c.c                    |  2 +-
 drivers/crypto/cavium/nitrox/nitrox_mbx.c     |  2 +-
 drivers/crypto/intel/qat/qat_common/adf_aer.c |  4 +-
 drivers/crypto/intel/qat/qat_common/adf_isr.c |  3 +-
 .../crypto/intel/qat/qat_common/adf_sriov.c   |  3 +-
 .../crypto/intel/qat/qat_common/adf_vf_isr.c  |  3 +-
 drivers/cxl/pci.c                             |  2 +-
 drivers/extcon/extcon-intel-int3496.c         |  4 +-
 drivers/firewire/core-transaction.c           |  3 +-
 drivers/firewire/ohci.c                       |  3 +-
 drivers/gpio/gpiolib-cdev.c                   |  4 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |  3 +-
 drivers/gpu/drm/bridge/ite-it6505.c           |  2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c            |  2 +-
 drivers/gpu/drm/drm_atomic_helper.c           |  6 +--
 drivers/gpu/drm/drm_probe_helper.c            |  2 +-
 drivers/gpu/drm/drm_self_refresh_helper.c     |  2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  2 +-
 .../drm/i915/display/intel_display_driver.c   |  3 +-
 .../drm/i915/display/intel_display_power.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_tc.c       |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  4 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +--
 drivers/gpu/drm/i915/i915_active.c            |  2 +-
 drivers/gpu/drm/i915/i915_driver.c            |  5 ++-
 drivers/gpu/drm/i915/i915_drv.h               |  2 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.c     |  2 +-
 drivers/gpu/drm/i915/i915_vma_resource.c      |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c          |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      |  2 +-
 .../gpu/drm/i915/selftests/i915_sw_fence.c    |  2 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |  3 +-
 drivers/gpu/drm/radeon/radeon_display.c       |  3 +-
 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    |  4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c        |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  4 +-
 drivers/gpu/drm/xe/xe_devcoredump.c           |  2 +-
 drivers/gpu/drm/xe/xe_device.c                |  4 +-
 drivers/gpu/drm/xe/xe_execlist.c              |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |  2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |  6 +--
 drivers/gpu/drm/xe/xe_guc_ct.c                |  4 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c       |  3 +-
 drivers/gpu/drm/xe/xe_oa.c                    |  2 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  2 +-
 drivers/gpu/drm/xe/xe_sriov.c                 |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  4 +-
 drivers/greybus/operation.c                   |  2 +-
 drivers/hid/hid-nintendo.c                    |  3 +-
 drivers/hte/hte.c                             |  2 +-
 drivers/hv/mshv_eventfd.c                     |  2 +-
 drivers/i3c/master.c                          |  2 +-
 drivers/iio/adc/pac1934.c                     |  2 +-
 drivers/infiniband/core/cm.c                  |  2 +-
 drivers/infiniband/core/device.c              |  4 +-
 drivers/infiniband/core/ucma.c                |  2 +-
 drivers/infiniband/hw/hfi1/init.c             |  3 +-
 drivers/infiniband/hw/hfi1/opfn.c             |  3 +-
 drivers/infiniband/hw/mlx4/cm.c               |  2 +-
 drivers/infiniband/hw/mlx5/odp.c              |  4 +-
 drivers/infiniband/sw/rdmavt/cq.c             |  3 +-
 drivers/infiniband/ulp/iser/iscsi_iser.c      |  2 +-
 drivers/infiniband/ulp/isert/ib_isert.c       |  2 +-
 drivers/infiniband/ulp/rtrs/rtrs-clt.c        |  2 +-
 drivers/infiniband/ulp/rtrs/rtrs-srv.c        |  2 +-
 drivers/input/keyboard/gpio_keys.c            |  2 +-
 drivers/input/misc/palmas-pwrbutton.c         |  2 +-
 drivers/input/mouse/psmouse-smbus.c           |  2 +-
 drivers/input/mouse/synaptics_i2c.c           |  8 ++--
 drivers/isdn/capi/kcapi.c                     |  2 +-
 drivers/leds/trigger/ledtrig-input-events.c   |  2 +-
 drivers/md/bcache/btree.c                     |  3 +-
 drivers/md/bcache/super.c                     | 30 +++++++------
 drivers/md/bcache/writeback.c                 |  2 +-
 drivers/md/dm-bufio.c                         |  3 +-
 drivers/md/dm-cache-target.c                  |  3 +-
 drivers/md/dm-clone-target.c                  |  3 +-
 drivers/md/dm-crypt.c                         |  6 ++-
 drivers/md/dm-delay.c                         |  4 +-
 drivers/md/dm-integrity.c                     | 15 ++++---
 drivers/md/dm-kcopyd.c                        |  3 +-
 drivers/md/dm-log-userspace-base.c            |  3 +-
 drivers/md/dm-mpath.c                         |  5 ++-
 drivers/md/dm-raid1.c                         |  5 ++-
 drivers/md/dm-snap-persistent.c               |  3 +-
 drivers/md/dm-stripe.c                        |  2 +-
 drivers/md/dm-verity-target.c                 |  4 +-
 drivers/md/dm-writecache.c                    |  3 +-
 drivers/md/dm.c                               |  3 +-
 drivers/md/md.c                               |  4 +-
 drivers/media/pci/ddbridge/ddbridge-core.c    |  2 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  6 ++-
 .../platform/synopsys/hdmirx/snps_hdmirx.c    |  8 ++--
 drivers/message/fusion/mptbase.c              |  7 ++-
 drivers/mmc/core/block.c                      |  3 +-
 drivers/mmc/host/mtk-sd.c                     |  4 +-
 drivers/mmc/host/omap.c                       |  2 +-
 drivers/mmc/host/sdhci.c                      |  2 +-
 drivers/net/can/spi/hi311x.c                  |  3 +-
 drivers/net/can/spi/mcp251x.c                 |  3 +-
 .../net/ethernet/cavium/liquidio/lio_core.c   |  2 +-
 .../net/ethernet/cavium/liquidio/lio_main.c   |  8 ++--
 .../ethernet/cavium/liquidio/lio_vf_main.c    |  3 +-
 .../cavium/liquidio/request_manager.c         |  2 +-
 .../cavium/liquidio/response_manager.c        |  3 +-
 .../net/ethernet/freescale/dpaa2/dpaa2-eth.c  |  2 +-
 .../hisilicon/hns3/hns3pf/hclge_main.c        |  3 +-
 drivers/net/ethernet/intel/fm10k/fm10k_main.c |  2 +-
 drivers/net/ethernet/intel/i40e/i40e_main.c   |  2 +-
 .../net/ethernet/marvell/octeontx2/af/cgx.c   |  2 +-
 .../marvell/octeontx2/af/mcs_rvu_if.c         |  2 +-
 .../ethernet/marvell/octeontx2/af/rvu_cgx.c   |  2 +-
 .../ethernet/marvell/octeontx2/af/rvu_rep.c   |  2 +-
 .../marvell/octeontx2/nic/cn10k_ipsec.c       |  3 +-
 .../ethernet/marvell/prestera/prestera_main.c |  2 +-
 .../ethernet/marvell/prestera/prestera_pci.c  |  2 +-
 drivers/net/ethernet/mellanox/mlxsw/core.c    |  4 +-
 drivers/net/ethernet/netronome/nfp/nfp_main.c |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_main.c    |  3 +-
 drivers/net/ethernet/sfc/efx_channels.c       |  2 +-
 drivers/net/ethernet/sfc/siena/efx_channels.c |  2 +-
 drivers/net/ethernet/wiznet/w5100.c           |  2 +-
 drivers/net/fjes/fjes_main.c                  |  5 ++-
 drivers/net/macvlan.c                         |  2 +-
 drivers/net/netdevsim/dev.c                   |  6 +--
 drivers/net/phy/sfp.c                         | 12 ++---
 drivers/net/wireguard/device.c                |  6 ++-
 drivers/net/wireless/ath/ath6kl/usb.c         |  2 +-
 drivers/net/wireless/intel/ipw2x00/ipw2100.c  |  6 +--
 drivers/net/wireless/intel/ipw2x00/ipw2200.c  |  2 +-
 drivers/net/wireless/intel/iwlwifi/fw/dbg.c   |  4 +-
 .../net/wireless/intel/iwlwifi/iwl-trans.h    |  2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/tdls.c |  6 +--
 .../net/wireless/marvell/libertas/if_sdio.c   |  3 +-
 .../net/wireless/marvell/libertas/if_spi.c    |  3 +-
 .../net/wireless/marvell/libertas_tf/main.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/init.c  |  2 +-
 drivers/net/wireless/quantenna/qtnfmac/core.c |  3 +-
 drivers/net/wireless/realtek/rtlwifi/base.c   |  2 +-
 drivers/net/wireless/realtek/rtw88/usb.c      |  3 +-
 drivers/net/wireless/silabs/wfx/main.c        |  2 +-
 drivers/net/wireless/st/cw1200/bh.c           |  4 +-
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c    |  3 +-
 drivers/net/wwan/wwan_hwsim.c                 |  2 +-
 drivers/nvdimm/security.c                     |  4 +-
 drivers/nvme/host/core.c                      |  8 ++--
 drivers/nvme/host/tcp.c                       |  2 +-
 drivers/nvme/target/admin-cmd.c               |  2 +-
 drivers/nvme/target/core.c                    |  5 ++-
 drivers/nvme/target/fabrics-cmd-auth.c        |  2 +-
 drivers/nvme/target/fc.c                      |  6 +--
 drivers/nvme/target/tcp.c                     |  2 +-
 drivers/pci/endpoint/functions/pci-epf-mhi.c  |  2 +-
 drivers/pci/endpoint/functions/pci-epf-ntb.c  |  5 ++-
 drivers/pci/endpoint/functions/pci-epf-test.c |  3 +-
 drivers/pci/endpoint/functions/pci-epf-vntb.c |  5 ++-
 drivers/pci/endpoint/pci-ep-cfs.c             |  2 +-
 drivers/pci/hotplug/pnv_php.c                 |  3 +-
 drivers/pci/hotplug/shpchp_core.c             |  3 +-
 drivers/phy/allwinner/phy-sun4i-usb.c         | 14 +++---
 .../platform/cznic/turris-omnia-mcu-gpio.c    |  2 +-
 .../surface/aggregator/ssh_packet_layer.c     |  2 +-
 .../surface/aggregator/ssh_request_layer.c    |  2 +-
 .../platform/surface/surface_acpi_notify.c    |  2 +-
 drivers/platform/x86/gpd-pocket-fan.c         |  4 +-
 .../x86/x86-android-tablets/vexia_atla10_ec.c |  2 +-
 drivers/power/supply/ab8500_btemp.c           |  3 +-
 drivers/power/supply/bq2415x_charger.c        |  2 +-
 drivers/power/supply/bq24190_charger.c        |  2 +-
 drivers/power/supply/bq27xxx_battery.c        |  6 +--
 drivers/power/supply/ipaq_micro_battery.c     |  3 +-
 drivers/power/supply/rk817_charger.c          |  6 +--
 drivers/power/supply/ucs1002_power.c          |  2 +-
 drivers/power/supply/ug3105_battery.c         |  6 +--
 drivers/rapidio/rio.c                         |  2 +-
 drivers/ras/cec.c                             |  2 +-
 drivers/regulator/irq_helpers.c               |  2 +-
 drivers/regulator/qcom-labibb-regulator.c     |  4 +-
 drivers/s390/char/tape_3590.c                 |  2 +-
 drivers/scsi/be2iscsi/be_main.c               |  3 +-
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c             |  2 +-
 drivers/scsi/device_handler/scsi_dh_alua.c    |  2 +-
 drivers/scsi/fcoe/fcoe.c                      |  2 +-
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c      |  3 +-
 drivers/scsi/lpfc/lpfc_init.c                 |  2 +-
 drivers/scsi/pm8001/pm8001_init.c             |  2 +-
 drivers/scsi/qedf/qedf_main.c                 | 15 ++++---
 drivers/scsi/qedi/qedi_main.c                 |  2 +-
 drivers/scsi/qla2xxx/qla_os.c                 |  4 +-
 drivers/scsi/qla2xxx/qla_target.c             |  2 +-
 drivers/scsi/qla2xxx/tcm_qla2xxx.c            |  2 +-
 drivers/scsi/qla4xxx/ql4_os.c                 |  3 +-
 drivers/scsi/scsi_transport_fc.c              |  7 +--
 drivers/scsi/scsi_transport_iscsi.c           |  2 +-
 drivers/soc/fsl/qbman/qman.c                  |  2 +-
 drivers/soc/xilinx/zynqmp_power.c             |  6 +--
 drivers/staging/greybus/sdio.c                |  2 +-
 drivers/target/sbp/sbp_target.c               |  8 ++--
 drivers/target/target_core_transport.c        |  4 +-
 drivers/target/target_core_xcopy.c            |  2 +-
 drivers/target/tcm_fc/tfc_conf.c              |  2 +-
 drivers/thunderbolt/tb.c                      |  2 +-
 drivers/tty/serial/8250/8250_dw.c             |  4 +-
 drivers/tty/tty_buffer.c                      |  8 ++--
 drivers/usb/core/hub.c                        |  2 +-
 drivers/usb/dwc3/gadget.c                     |  2 +-
 drivers/usb/gadget/function/f_hid.c           |  3 +-
 drivers/usb/host/xhci-dbgcap.c                |  8 ++--
 drivers/usb/host/xhci-ring.c                  |  2 +-
 drivers/usb/storage/uas.c                     |  2 +-
 drivers/usb/typec/anx7411.c                   |  3 +-
 drivers/vdpa/vdpa_user/vduse_dev.c            |  3 +-
 drivers/virt/acrn/irqfd.c                     |  3 +-
 drivers/virtio/virtio_balloon.c               |  3 +-
 drivers/xen/events/events_base.c              |  6 +--
 drivers/xen/privcmd.c                         |  3 +-
 fs/afs/callback.c                             |  4 +-
 fs/afs/main.c                                 |  4 +-
 fs/afs/write.c                                |  2 +-
 fs/aio.c                                      |  2 +-
 fs/bcachefs/btree_write_buffer.c              |  2 +-
 fs/bcachefs/io_read.c                         | 12 ++---
 fs/bcachefs/journal_io.c                      |  2 +-
 fs/bcachefs/super.c                           | 10 ++---
 fs/btrfs/async-thread.c                       |  3 +-
 fs/btrfs/block-group.c                        |  2 +-
 fs/btrfs/disk-io.c                            | 11 +++--
 fs/btrfs/extent_map.c                         |  2 +-
 fs/btrfs/scrub.c                              |  3 +-
 fs/btrfs/space-info.c                         |  4 +-
 fs/btrfs/zoned.c                              |  2 +-
 fs/ceph/super.c                               |  2 +-
 fs/dlm/lowcomms.c                             |  2 +-
 fs/dlm/main.c                                 |  2 +-
 fs/ext4/mballoc.c                             |  2 +-
 fs/fs-writeback.c                             |  4 +-
 fs/fuse/dev.c                                 |  2 +-
 fs/fuse/inode.c                               |  2 +-
 fs/gfs2/main.c                                |  5 ++-
 fs/gfs2/ops_fstype.c                          |  6 ++-
 fs/netfs/objects.c                            |  2 +-
 fs/netfs/read_collect.c                       |  2 +-
 fs/netfs/write_collect.c                      |  2 +-
 fs/nfs/namespace.c                            |  2 +-
 fs/nfs/nfs4renewd.c                           |  2 +-
 fs/nfsd/filecache.c                           |  2 +-
 fs/notify/mark.c                              |  4 +-
 fs/ocfs2/dlm/dlmdomain.c                      |  3 +-
 fs/ocfs2/dlmfs/dlmfs.c                        |  3 +-
 fs/quota/dquot.c                              |  2 +-
 fs/smb/client/cifsfs.c                        | 16 ++++---
 fs/smb/server/ksmbd_work.c                    |  2 +-
 fs/smb/server/transport_rdma.c                |  3 +-
 fs/super.c                                    |  3 +-
 fs/verity/verify.c                            |  2 +-
 fs/xfs/xfs_log.c                              |  3 +-
 fs/xfs/xfs_mru_cache.c                        |  3 +-
 fs/xfs/xfs_super.c                            | 15 ++++---
 include/drm/gpu_scheduler.h                   |  2 +-
 include/linux/closure.h                       |  2 +-
 include/linux/workqueue.h                     | 35 ++++++++-------
 io_uring/io_uring.c                           |  4 +-
 kernel/bpf/cgroup.c                           |  5 ++-
 kernel/bpf/cpumap.c                           |  2 +-
 kernel/bpf/helpers.c                          |  4 +-
 kernel/bpf/memalloc.c                         |  2 +-
 kernel/bpf/syscall.c                          |  2 +-
 kernel/cgroup/cgroup-v1.c                     |  2 +-
 kernel/cgroup/cgroup.c                        |  4 +-
 kernel/module/dups.c                          |  4 +-
 kernel/padata.c                               |  9 ++--
 kernel/power/main.c                           |  2 +-
 kernel/rcu/tasks.h                            |  4 +-
 kernel/rcu/tree.c                             |  4 +-
 kernel/sched/core.c                           |  4 +-
 kernel/sched/ext.c                            |  4 +-
 kernel/smp.c                                  |  2 +-
 kernel/trace/trace_events_user.c              |  2 +-
 kernel/umh.c                                  |  2 +-
 kernel/workqueue.c                            | 45 ++++++++++++-------
 mm/backing-dev.c                              |  6 +--
 mm/kfence/core.c                              |  6 +--
 mm/memcontrol.c                               |  4 +-
 mm/slub.c                                     |  3 +-
 mm/vmstat.c                                   |  3 +-
 net/bridge/br_cfm.c                           |  6 +--
 net/bridge/br_mrp.c                           |  8 ++--
 net/ceph/messenger.c                          |  3 +-
 net/ceph/mon_client.c                         |  2 +-
 net/core/link_watch.c                         |  4 +-
 net/core/skmsg.c                              |  2 +-
 net/core/sock_diag.c                          |  2 +-
 net/devlink/core.c                            |  2 +-
 net/ipv4/inet_fragment.c                      |  2 +-
 net/netfilter/nf_conntrack_ecache.c           |  2 +-
 net/openvswitch/dp_notify.c                   |  2 +-
 net/rds/ib_rdma.c                             |  3 +-
 net/rfkill/input.c                            |  2 +-
 net/rxrpc/rxperf.c                            |  2 +-
 net/smc/af_smc.c                              |  6 +--
 net/smc/smc_core.c                            |  4 +-
 net/tls/tls_device.c                          |  2 +-
 net/unix/garbage.c                            |  2 +-
 net/vmw_vsock/af_vsock.c                      |  2 +-
 net/vmw_vsock/virtio_transport.c              |  2 +-
 net/vmw_vsock/vsock_loopback.c                |  2 +-
 net/wireless/core.c                           |  4 +-
 net/wireless/sysfs.c                          |  2 +-
 rust/kernel/workqueue.rs                      | 12 ++---
 sound/soc/codecs/aw88081.c                    |  2 +-
 sound/soc/codecs/aw88166.c                    |  2 +-
 sound/soc/codecs/aw88261.c                    |  2 +-
 sound/soc/codecs/aw88395/aw88395.c            |  2 +-
 sound/soc/codecs/aw88399.c                    |  2 +-
 sound/soc/codecs/cs42l43-jack.c               |  6 +--
 sound/soc/codecs/cs42l43.c                    |  4 +-
 sound/soc/codecs/es8326.c                     | 12 ++---
 sound/soc/codecs/rt5663.c                     |  6 +--
 sound/soc/codecs/wm_adsp.c                    |  2 +-
 sound/soc/intel/boards/sof_es8336.c           |  2 +-
 sound/soc/sof/intel/cnl.c                     |  2 +-
 sound/soc/sof/intel/hda-ipc.c                 |  2 +-
 virt/kvm/eventfd.c                            |  2 +-
 369 files changed, 729 insertions(+), 601 deletions(-)

-- 
2.49.0

