Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FD02D5C89
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848601; cv=none; b=H6TznftOj47Q0lDKgP/t+U/jq9JBPfV7wN2xRFT4pIdq0TvkUpQDRBEqdj8pApp2bZQQPJ8duw8wGqfZWJAC7YAnx2usA/NKS/MBUbOXFigjHmy9RxPPXv/edEbZ3dDEHMAxeUJjJHNYj2VmFgxDXwiGcjRuD8wEdoOcbpvPyHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848601; c=relaxed/simple;
	bh=71eiIh0VppRmOygt5AKldKGo0G4mOUrkTklpo5oDEkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ImK/N2bGNJpAQQs9rQAqJUkIQjncLehjKGEz6Lcu3STxukTweo5y9bvSepMP1eB5XZ4Et+ml7ZIvKFzpP7KMLz+UqXFSClJ3H3S0+K6tIaR3l8na21lvhQ7Kv/HHHI6jbmJtifVuwRqB9wkLx0hhb16ylBv+pBM+mZqT1MWfHbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Wmeq0Ox2; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Wmeq0Ox2"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-3a510432236so4741816f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750848593; x=1751453393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKnb5nKtO8765ZeyvXqRy6unrxnVHO9Pa/v2PFLruMk=;
        b=Wmeq0Ox2Xu1LeCJHDrZ7YjsWlXzXgcZS7+iTd2jVXpMikpxAbKr+8J6fEU0aYDsrTs
         P9w2Uu0D8QBqpbGiChNenVwh7wQs9o9ZjKCSje85pN8LGnUMLS1aXGcJrOpZYWfvuNnS
         m2rucDMtfxdLYRIQWzsMV9kzRQTxC8Xlv/UPttu951h94ZsOJIkb0aauEAlVz5kI96r9
         l6lbR/OWJQuSgLcjxOibhRJEe+ocmF1dDG24u+9iWuncTpJ8/ibCMXGeV1qFKMhxB4MO
         /W6FL8Wv9CG8x/RRVf/YC87XuTLGL5aPNuEkkJHbGDAwuhyn6JP1gcsKnzhUyQOPRkb3
         oIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848593; x=1751453393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKnb5nKtO8765ZeyvXqRy6unrxnVHO9Pa/v2PFLruMk=;
        b=QmqZ1G5a0HxtSZlfjdgXZeA1noOylK8kghJoORWnXP0SmHltrPfrIhzHlzk1jEPj/E
         OzyhBw/p2X2OMbctKlEnOkcyZ8knFrfXTAS7wFsee/Pb4fh6QKQyhLhBVnJ40qaP6QM4
         H20gaWv/QEjYCaxNZoY3HGuw57UNGIzsSMSKDo6kNM6ZmQSjymtZGnrqd7NDBTUIcaTz
         5D6C5IR0NORd0PjT7stGnlK4ZBqMMvSDMoi/ruO9HYjJv/eJ4KbxjjnRE9NiOAqZta7E
         hAy6gls+1cC8hMfGpLD7y0SS9DE1cI6hHttH3bzzd1RUlG1U5MauO+WmUGc363fCHucS
         AZgQ==
X-Gm-Message-State: AOJu0YxXm4zBnPfdssbueTlVMDA7gRucYQJa+dbyyR2xppkVvStclgkK
	9C2tmKs7rTeMMuO8yoIGxx+2U87LZ5ua4T5yK19kqe6SuldTz97P8mXj+DgOaL++ZosqfhOo4FN
	4NPZ0EXLjqA==
X-Gm-Gg: ASbGncvayto3GMIh6ieJrCsV7+MgCQNhkVEbI/w1DjTB6fQtrM7EN0NA389O7G4/0yj
	0cI9A/e4vXAAlEO0JmS8VcZ1/328rOBVep9uVdT5W3neRkghgPzsJJJdxS0lqTDBONyf2zFYqZ+
	oON8CUZKpUUDWovnyPjVfqWiwTtzK3xr30QlLhf8BEej4ncKrytTTCm835RtHT6JC6kAmGqc2Pv
	fpHekOgyhkaB7zlxYglaTHtC0wBTiP82Wbtv1XYAw2VRi/5yc4pNg0G6OyHP8jHiVeHXxgo0wQv
	Y+KT7hD/dfp5XxYyHH/Pg34PlYwcrJPSXDiyPhpAn3Ys/X3nOIr55KaeRzYyQilB+tcQE8j5arU
	xo3nebiFFxw==
X-Google-Smtp-Source: AGHT+IFE/DmGDwHhsjqqk/6mDrIKJ63wiy1BbujDKtyK/7wBNYATs6BPCE4jwXRNsVX2UBLBJiMv9A==
X-Received: by 2002:a05:6000:4028:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a6ed64417cmr1686180f8f.32.1750848592002;
        Wed, 25 Jun 2025 03:49:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c49fsm16195055e9.7.2025.06.25.03.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:49:51 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v1 09/10] Workqueue: WQ_PERCPU added to all the remaining users
Date: Wed, 25 Jun 2025 12:49:33 +0200
Message-ID: <20250625104934.184753-10-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625104934.184753-1-marco.crivellari@suse.com>
References: <20250625104934.184753-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistentcy cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This patch adds a new WQ_PERCPU flag to explicitly request the use of
the per-CPU behavior. Both flags coexist for one release cycle to allow
callers to transition their calls.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

All existing users have been updated accordingly.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 block/bio-integrity-auto.c                    |  5 ++-
 block/bio.c                                   |  3 +-
 block/blk-core.c                              |  3 +-
 block/blk-throttle.c                          |  3 +-
 block/blk-zoned.c                             |  3 +-
 crypto/cryptd.c                               |  3 +-
 drivers/acpi/ec.c                             |  3 +-
 drivers/acpi/osl.c                            |  4 +-
 drivers/acpi/thermal.c                        |  3 +-
 drivers/ata/libata-sff.c                      |  3 +-
 drivers/base/core.c                           |  2 +-
 drivers/block/aoe/aoemain.c                   |  2 +-
 drivers/block/rbd.c                           |  2 +-
 drivers/block/rnbd/rnbd-clt.c                 |  2 +-
 drivers/block/sunvdc.c                        |  2 +-
 drivers/block/virtio_blk.c                    |  2 +-
 drivers/bus/mhi/ep/main.c                     |  2 +-
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
 drivers/firewire/core-transaction.c           |  3 +-
 drivers/firewire/ohci.c                       |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |  3 +-
 .../drm/i915/display/intel_display_driver.c   |  3 +-
 drivers/gpu/drm/i915/i915_driver.c            |  3 +-
 .../gpu/drm/i915/selftests/i915_sw_fence.c    |  2 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |  3 +-
 drivers/gpu/drm/radeon/radeon_display.c       |  3 +-
 drivers/gpu/drm/xe/xe_device.c                |  4 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c       |  3 +-
 drivers/gpu/drm/xe/xe_sriov.c                 |  2 +-
 drivers/greybus/operation.c                   |  2 +-
 drivers/hid/hid-nintendo.c                    |  3 +-
 drivers/hv/mshv_eventfd.c                     |  2 +-
 drivers/i3c/master.c                          |  2 +-
 drivers/infiniband/core/cm.c                  |  2 +-
 drivers/infiniband/core/device.c              |  4 +-
 drivers/infiniband/hw/hfi1/init.c             |  3 +-
 drivers/infiniband/hw/hfi1/opfn.c             |  3 +-
 drivers/infiniband/hw/mlx4/cm.c               |  2 +-
 drivers/infiniband/sw/rdmavt/cq.c             |  3 +-
 drivers/infiniband/ulp/iser/iscsi_iser.c      |  2 +-
 drivers/infiniband/ulp/isert/ib_isert.c       |  2 +-
 drivers/infiniband/ulp/rtrs/rtrs-clt.c        |  2 +-
 drivers/infiniband/ulp/rtrs/rtrs-srv.c        |  2 +-
 drivers/input/mouse/psmouse-smbus.c           |  2 +-
 drivers/isdn/capi/kcapi.c                     |  2 +-
 drivers/md/bcache/btree.c                     |  3 +-
 drivers/md/bcache/super.c                     | 10 +++--
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
 drivers/message/fusion/mptbase.c              |  7 +++-
 drivers/mmc/core/block.c                      |  3 +-
 drivers/mmc/host/omap.c                       |  2 +-
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
 drivers/net/ethernet/wiznet/w5100.c           |  2 +-
 drivers/net/fjes/fjes_main.c                  |  5 ++-
 drivers/net/wireguard/device.c                |  6 ++-
 drivers/net/wireless/ath/ath6kl/usb.c         |  2 +-
 .../net/wireless/marvell/libertas/if_sdio.c   |  3 +-
 .../net/wireless/marvell/libertas/if_spi.c    |  3 +-
 .../net/wireless/marvell/libertas_tf/main.c   |  2 +-
 drivers/net/wireless/quantenna/qtnfmac/core.c |  3 +-
 drivers/net/wireless/realtek/rtlwifi/base.c   |  2 +-
 drivers/net/wireless/realtek/rtw88/usb.c      |  3 +-
 drivers/net/wireless/silabs/wfx/main.c        |  2 +-
 drivers/net/wireless/st/cw1200/bh.c           |  4 +-
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c    |  3 +-
 drivers/net/wwan/wwan_hwsim.c                 |  2 +-
 drivers/nvme/host/tcp.c                       |  2 +
 drivers/nvme/target/core.c                    |  5 ++-
 drivers/nvme/target/fc.c                      |  6 +--
 drivers/nvme/target/tcp.c                     |  2 +-
 drivers/pci/endpoint/functions/pci-epf-mhi.c  |  2 +-
 drivers/pci/endpoint/functions/pci-epf-ntb.c  |  5 ++-
 drivers/pci/endpoint/functions/pci-epf-test.c |  3 +-
 drivers/pci/endpoint/functions/pci-epf-vntb.c |  5 ++-
 drivers/pci/hotplug/pnv_php.c                 |  3 +-
 drivers/pci/hotplug/shpchp_core.c             |  3 +-
 .../platform/surface/surface_acpi_notify.c    |  2 +-
 drivers/power/supply/ab8500_btemp.c           |  3 +-
 drivers/power/supply/ipaq_micro_battery.c     |  3 +-
 drivers/rapidio/rio.c                         |  2 +-
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
 drivers/scsi/qla2xxx/qla_os.c                 |  2 +-
 drivers/scsi/qla2xxx/qla_target.c             |  2 +-
 drivers/scsi/qla2xxx/tcm_qla2xxx.c            |  2 +-
 drivers/scsi/qla4xxx/ql4_os.c                 |  3 +-
 drivers/scsi/scsi_transport_fc.c              |  7 ++--
 drivers/soc/fsl/qbman/qman.c                  |  2 +-
 drivers/staging/greybus/sdio.c                |  2 +-
 drivers/target/target_core_transport.c        |  4 +-
 drivers/target/target_core_xcopy.c            |  2 +-
 drivers/target/tcm_fc/tfc_conf.c              |  2 +-
 drivers/usb/core/hub.c                        |  2 +-
 drivers/usb/gadget/function/f_hid.c           |  3 +-
 drivers/usb/storage/uas.c                     |  2 +-
 drivers/usb/typec/anx7411.c                   |  3 +-
 drivers/vdpa/vdpa_user/vduse_dev.c            |  3 +-
 drivers/virt/acrn/irqfd.c                     |  3 +-
 drivers/virtio/virtio_balloon.c               |  3 +-
 drivers/xen/privcmd.c                         |  3 +-
 include/linux/workqueue.h                     |  4 +-
 kernel/bpf/cgroup.c                           |  3 +-
 kernel/cgroup/cgroup-v1.c                     |  2 +-
 kernel/cgroup/cgroup.c                        |  2 +-
 kernel/padata.c                               |  5 ++-
 kernel/power/main.c                           |  2 +-
 kernel/rcu/tree.c                             |  4 +-
 kernel/workqueue.c                            | 41 ++++++++++++++-----
 virt/kvm/eventfd.c                            |  2 +-
 168 files changed, 333 insertions(+), 221 deletions(-)

diff --git a/block/bio-integrity-auto.c b/block/bio-integrity-auto.c
index e524c609be50..b23432f19a1e 100644
--- a/block/bio-integrity-auto.c
+++ b/block/bio-integrity-auto.c
@@ -182,8 +182,9 @@ static int __init blk_integrity_auto_init(void)
 	 * kintegrityd won't block much but may burn a lot of CPU cycles.
 	 * Make it highpri CPU intensive wq with max concurrency of 1.
 	 */
-	kintegrityd_wq = alloc_workqueue("kintegrityd", WQ_MEM_RECLAIM |
-					 WQ_HIGHPRI | WQ_CPU_INTENSIVE, 1);
+	kintegrityd_wq = alloc_workqueue("kintegrityd",
+					 WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_CPU_INTENSIVE | WQ_PERCPU,
+					 1);
 	if (!kintegrityd_wq)
 		panic("Failed to create kintegrityd\n");
 	return 0;
diff --git a/block/bio.c b/block/bio.c
index 4e6c85a33d74..b2a782465cec 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1715,7 +1715,8 @@ int bioset_init(struct bio_set *bs,
 
 	if (flags & BIOSET_NEED_RESCUER) {
 		bs->rescue_workqueue = alloc_workqueue("bioset",
-							WQ_MEM_RECLAIM, 0);
+							WQ_MEM_RECLAIM | WQ_PERCPU,
+							0);
 		if (!bs->rescue_workqueue)
 			goto bad;
 	}
diff --git a/block/blk-core.c b/block/blk-core.c
index e8cc270a453f..d2d7d54a4db8 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1272,7 +1272,8 @@ int __init blk_dev_init(void)
 
 	/* used for unplugging and affects IO latency/throughput - HIGHPRI */
 	kblockd_workqueue = alloc_workqueue("kblockd",
-					    WQ_MEM_RECLAIM | WQ_HIGHPRI, 0);
+					    WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_PERCPU,
+					    0);
 	if (!kblockd_workqueue)
 		panic("Failed to create kblockd\n");
 
diff --git a/block/blk-throttle.c b/block/blk-throttle.c
index d6dd2e047874..a6dd9f0d631f 100644
--- a/block/blk-throttle.c
+++ b/block/blk-throttle.c
@@ -1719,7 +1719,8 @@ void blk_throtl_exit(struct gendisk *disk)
 
 static int __init throtl_init(void)
 {
-	kthrotld_workqueue = alloc_workqueue("kthrotld", WQ_MEM_RECLAIM, 0);
+	kthrotld_workqueue = alloc_workqueue("kthrotld",
+					     WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!kthrotld_workqueue)
 		panic("Failed to create kthrotld\n");
 
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 0c77244a35c9..1d614b715158 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -1362,7 +1362,8 @@ static int disk_alloc_zone_resources(struct gendisk *disk,
 		goto free_hash;
 
 	disk->zone_wplugs_wq =
-		alloc_workqueue("%s_zwplugs", WQ_MEM_RECLAIM | WQ_HIGHPRI,
+		alloc_workqueue("%s_zwplugs",
+				WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_PERCPU,
 				pool_size, disk->disk_name);
 	if (!disk->zone_wplugs_wq)
 		goto destroy_pool;
diff --git a/crypto/cryptd.c b/crypto/cryptd.c
index 31d022d47f7a..eaf970086f8d 100644
--- a/crypto/cryptd.c
+++ b/crypto/cryptd.c
@@ -1109,7 +1109,8 @@ static int __init cryptd_init(void)
 {
 	int err;
 
-	cryptd_wq = alloc_workqueue("cryptd", WQ_MEM_RECLAIM | WQ_CPU_INTENSIVE,
+	cryptd_wq = alloc_workqueue("cryptd",
+				    WQ_MEM_RECLAIM | WQ_CPU_INTENSIVE | WQ_PERCPU,
 				    1);
 	if (!cryptd_wq)
 		return -ENOMEM;
diff --git a/drivers/acpi/ec.c b/drivers/acpi/ec.c
index 8db09d81918f..f2b72bf8fa65 100644
--- a/drivers/acpi/ec.c
+++ b/drivers/acpi/ec.c
@@ -2273,7 +2273,8 @@ static int acpi_ec_init_workqueues(void)
 		ec_wq = alloc_ordered_workqueue("kec", 0);
 
 	if (!ec_query_wq)
-		ec_query_wq = alloc_workqueue("kec_query", 0, ec_max_queries);
+		ec_query_wq = alloc_workqueue("kec_query", WQ_PERCPU,
+					      ec_max_queries);
 
 	if (!ec_wq || !ec_query_wq) {
 		acpi_ec_destroy_workqueues();
diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index a79a5d47bdb8..05393a7315fe 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -1694,8 +1694,8 @@ acpi_status __init acpi_os_initialize(void)
 
 acpi_status __init acpi_os_initialize1(void)
 {
-	kacpid_wq = alloc_workqueue("kacpid", 0, 1);
-	kacpi_notify_wq = alloc_workqueue("kacpi_notify", 0, 0);
+	kacpid_wq = alloc_workqueue("kacpid", WQ_PERCPU, 1);
+	kacpi_notify_wq = alloc_workqueue("kacpi_notify", WQ_PERCPU, 0);
 	kacpi_hotplug_wq = alloc_ordered_workqueue("kacpi_hotplug", 0);
 	BUG_ON(!kacpid_wq);
 	BUG_ON(!kacpi_notify_wq);
diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index 0c874186f8ae..9f5a2f288d32 100644
--- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -1060,7 +1060,8 @@ static int __init acpi_thermal_init(void)
 	}
 
 	acpi_thermal_pm_queue = alloc_workqueue("acpi_thermal_pm",
-						WQ_HIGHPRI | WQ_MEM_RECLAIM, 0);
+						WQ_HIGHPRI | WQ_MEM_RECLAIM | WQ_PERCPU,
+						0);
 	if (!acpi_thermal_pm_queue)
 		return -ENODEV;
 
diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index 5a46c066abc3..ae6879fa868d 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -3199,7 +3199,8 @@ void ata_sff_port_init(struct ata_port *ap)
 
 int __init ata_sff_init(void)
 {
-	ata_sff_wq = alloc_workqueue("ata_sff", WQ_MEM_RECLAIM, WQ_MAX_ACTIVE);
+	ata_sff_wq = alloc_workqueue("ata_sff", WQ_MEM_RECLAIM | WQ_PERCPU,
+				     WQ_MAX_ACTIVE);
 	if (!ata_sff_wq)
 		return -ENOMEM;
 
diff --git a/drivers/base/core.c b/drivers/base/core.c
index d2f9d3a59d6b..fa43d02c56c1 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4115,7 +4115,7 @@ int __init devices_init(void)
 	sysfs_dev_char_kobj = kobject_create_and_add("char", dev_kobj);
 	if (!sysfs_dev_char_kobj)
 		goto char_kobj_err;
-	device_link_wq = alloc_workqueue("device_link_wq", 0, 0);
+	device_link_wq = alloc_workqueue("device_link_wq", WQ_PERCPU, 0);
 	if (!device_link_wq)
 		goto wq_err;
 
diff --git a/drivers/block/aoe/aoemain.c b/drivers/block/aoe/aoemain.c
index cdf6e4041bb9..3b21750038ee 100644
--- a/drivers/block/aoe/aoemain.c
+++ b/drivers/block/aoe/aoemain.c
@@ -44,7 +44,7 @@ aoe_init(void)
 {
 	int ret;
 
-	aoe_wq = alloc_workqueue("aoe_wq", 0, 0);
+	aoe_wq = alloc_workqueue("aoe_wq", WQ_PERCPU, 0);
 	if (!aoe_wq)
 		return -ENOMEM;
 
diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index faafd7ff43d6..af0e21149dbc 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -7389,7 +7389,7 @@ static int __init rbd_init(void)
 	 * The number of active work items is limited by the number of
 	 * rbd devices * queue depth, so leave @max_active at default.
 	 */
-	rbd_wq = alloc_workqueue(RBD_DRV_NAME, WQ_MEM_RECLAIM, 0);
+	rbd_wq = alloc_workqueue(RBD_DRV_NAME, WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!rbd_wq) {
 		rc = -ENOMEM;
 		goto err_out_slab;
diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index 15627417f12e..b3a0470f9e80 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -1809,7 +1809,7 @@ static int __init rnbd_client_init(void)
 		unregister_blkdev(rnbd_client_major, "rnbd");
 		return err;
 	}
-	rnbd_clt_wq = alloc_workqueue("rnbd_clt_wq", 0, 0);
+	rnbd_clt_wq = alloc_workqueue("rnbd_clt_wq", WQ_PERCPU, 0);
 	if (!rnbd_clt_wq) {
 		pr_err("Failed to load module, alloc_workqueue failed.\n");
 		rnbd_clt_destroy_sysfs_files();
diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
index 442546b05df8..851763e5dd18 100644
--- a/drivers/block/sunvdc.c
+++ b/drivers/block/sunvdc.c
@@ -1215,7 +1215,7 @@ static int __init vdc_init(void)
 {
 	int err;
 
-	sunvdc_wq = alloc_workqueue("sunvdc", 0, 0);
+	sunvdc_wq = alloc_workqueue("sunvdc", WQ_PERCPU, 0);
 	if (!sunvdc_wq)
 		return -ENOMEM;
 
diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 7cffea01d868..a5a48f976a20 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1683,7 +1683,7 @@ static int __init virtio_blk_init(void)
 {
 	int error;
 
-	virtblk_wq = alloc_workqueue("virtio-blk", 0, 0);
+	virtblk_wq = alloc_workqueue("virtio-blk", WQ_PERCPU, 0);
 	if (!virtblk_wq)
 		return -ENOMEM;
 
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index b3eafcf2a2c5..bee0b794c3e3 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1507,7 +1507,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	INIT_WORK(&mhi_cntrl->cmd_ring_work, mhi_ep_cmd_ring_worker);
 	INIT_WORK(&mhi_cntrl->ch_ring_work, mhi_ep_ch_ring_worker);
 
-	mhi_cntrl->wq = alloc_workqueue("mhi_ep_wq", 0, 0);
+	mhi_cntrl->wq = alloc_workqueue("mhi_ep_wq", WQ_PERCPU, 0);
 	if (!mhi_cntrl->wq) {
 		ret = -ENOMEM;
 		goto err_destroy_ring_item_cache;
diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-dev-common.c
index 11deaf538e87..2b46db0fd4b3 100644
--- a/drivers/char/tpm/tpm-dev-common.c
+++ b/drivers/char/tpm/tpm-dev-common.c
@@ -275,7 +275,8 @@ void tpm_common_release(struct file *file, struct file_priv *priv)
 
 int __init tpm_dev_common_init(void)
 {
-	tpm_dev_wq = alloc_workqueue("tpm_dev_wq", WQ_MEM_RECLAIM, 0);
+	tpm_dev_wq = alloc_workqueue("tpm_dev_wq", WQ_MEM_RECLAIM | WQ_PERCPU,
+				     0);
 
 	return !tpm_dev_wq ? -ENOMEM : 0;
 }
diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
index 11b7c4749274..3ecd589a22b1 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -1974,7 +1974,7 @@ EXPORT_SYMBOL(xillybus_endpoint_remove);
 
 static int __init xillybus_init(void)
 {
-	xillybus_wq = alloc_workqueue(xillyname, 0, 0);
+	xillybus_wq = alloc_workqueue(xillyname, WQ_PERCPU, 0);
 	if (!xillybus_wq)
 		return -ENOMEM;
 
diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 45771b1a3716..2a29e2be0296 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -2163,7 +2163,7 @@ static int xillyusb_probe(struct usb_interface *interface,
 	spin_lock_init(&xdev->error_lock);
 	xdev->in_counter = 0;
 	xdev->in_bytes_left = 0;
-	xdev->workq = alloc_workqueue(xillyname, WQ_HIGHPRI, 0);
+	xdev->workq = alloc_workqueue(xillyname, WQ_HIGHPRI | WQ_PERCPU, 0);
 
 	if (!xdev->workq) {
 		dev_err(&interface->dev, "Failed to allocate work queue\n");
@@ -2275,7 +2275,7 @@ static int __init xillyusb_init(void)
 {
 	int rc = 0;
 
-	wakeup_wq = alloc_workqueue(xillyname, 0, 0);
+	wakeup_wq = alloc_workqueue(xillyname, WQ_PERCPU, 0);
 	if (!wakeup_wq)
 		return -ENOMEM;
 
diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
index 9b4f516f313e..695599e1001f 100644
--- a/drivers/cpufreq/tegra194-cpufreq.c
+++ b/drivers/cpufreq/tegra194-cpufreq.c
@@ -750,7 +750,8 @@ static int tegra194_cpufreq_probe(struct platform_device *pdev)
 	if (IS_ERR(bpmp))
 		return PTR_ERR(bpmp);
 
-	read_counters_wq = alloc_workqueue("read_counters_wq", __WQ_LEGACY, 1);
+	read_counters_wq = alloc_workqueue("read_counters_wq",
+					   __WQ_LEGACY | WQ_PERCPU, 1);
 	if (!read_counters_wq) {
 		dev_err(&pdev->dev, "fail to create_workqueue\n");
 		err = -EINVAL;
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index a895e4289efa..9688d116d07e 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -402,7 +402,7 @@ EXPORT_SYMBOL(atmel_i2c_probe);
 
 static int __init atmel_i2c_init(void)
 {
-	atmel_wq = alloc_workqueue("atmel_wq", 0, 0);
+	atmel_wq = alloc_workqueue("atmel_wq", WQ_PERCPU, 0);
 	return atmel_wq ? 0 : -ENOMEM;
 }
 
diff --git a/drivers/crypto/cavium/nitrox/nitrox_mbx.c b/drivers/crypto/cavium/nitrox/nitrox_mbx.c
index d4e06999af9b..a6a76e50ba84 100644
--- a/drivers/crypto/cavium/nitrox/nitrox_mbx.c
+++ b/drivers/crypto/cavium/nitrox/nitrox_mbx.c
@@ -192,7 +192,7 @@ int nitrox_mbox_init(struct nitrox_device *ndev)
 	}
 
 	/* allocate pf2vf response workqueue */
-	ndev->iov.pf2vf_wq = alloc_workqueue("nitrox_pf2vf", 0, 0);
+	ndev->iov.pf2vf_wq = alloc_workqueue("nitrox_pf2vf", WQ_PERCPU, 0);
 	if (!ndev->iov.pf2vf_wq) {
 		kfree(ndev->iov.vfdev);
 		ndev->iov.vfdev = NULL;
diff --git a/drivers/crypto/intel/qat/qat_common/adf_aer.c b/drivers/crypto/intel/qat/qat_common/adf_aer.c
index 4cb8bd83f570..fabd852f1708 100644
--- a/drivers/crypto/intel/qat/qat_common/adf_aer.c
+++ b/drivers/crypto/intel/qat/qat_common/adf_aer.c
@@ -276,11 +276,11 @@ int adf_notify_fatal_error(struct adf_accel_dev *accel_dev)
 int adf_init_aer(void)
 {
 	device_reset_wq = alloc_workqueue("qat_device_reset_wq",
-					  WQ_MEM_RECLAIM, 0);
+					  WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!device_reset_wq)
 		return -EFAULT;
 
-	device_sriov_wq = alloc_workqueue("qat_device_sriov_wq", 0, 0);
+	device_sriov_wq = alloc_workqueue("qat_device_sriov_wq", WQ_PERCPU, 0);
 	if (!device_sriov_wq) {
 		destroy_workqueue(device_reset_wq);
 		device_reset_wq = NULL;
diff --git a/drivers/crypto/intel/qat/qat_common/adf_isr.c b/drivers/crypto/intel/qat/qat_common/adf_isr.c
index cae1aee5479a..7381e0570540 100644
--- a/drivers/crypto/intel/qat/qat_common/adf_isr.c
+++ b/drivers/crypto/intel/qat/qat_common/adf_isr.c
@@ -384,7 +384,8 @@ EXPORT_SYMBOL_GPL(adf_isr_resource_alloc);
  */
 int __init adf_init_misc_wq(void)
 {
-	adf_misc_wq = alloc_workqueue("qat_misc_wq", WQ_MEM_RECLAIM, 0);
+	adf_misc_wq = alloc_workqueue("qat_misc_wq",
+				      WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 
 	return !adf_misc_wq ? -ENOMEM : 0;
 }
diff --git a/drivers/crypto/intel/qat/qat_common/adf_sriov.c b/drivers/crypto/intel/qat/qat_common/adf_sriov.c
index c75d0b6cb0ad..0afa8d42c220 100644
--- a/drivers/crypto/intel/qat/qat_common/adf_sriov.c
+++ b/drivers/crypto/intel/qat/qat_common/adf_sriov.c
@@ -300,7 +300,8 @@ EXPORT_SYMBOL_GPL(adf_sriov_configure);
 int __init adf_init_pf_wq(void)
 {
 	/* Workqueue for PF2VF responses */
-	pf2vf_resp_wq = alloc_workqueue("qat_pf2vf_resp_wq", WQ_MEM_RECLAIM, 0);
+	pf2vf_resp_wq = alloc_workqueue("qat_pf2vf_resp_wq",
+					WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 
 	return !pf2vf_resp_wq ? -ENOMEM : 0;
 }
diff --git a/drivers/crypto/intel/qat/qat_common/adf_vf_isr.c b/drivers/crypto/intel/qat/qat_common/adf_vf_isr.c
index a4636ec9f9ca..d0fef20a3df4 100644
--- a/drivers/crypto/intel/qat/qat_common/adf_vf_isr.c
+++ b/drivers/crypto/intel/qat/qat_common/adf_vf_isr.c
@@ -299,7 +299,8 @@ EXPORT_SYMBOL_GPL(adf_flush_vf_wq);
  */
 int __init adf_init_vf_wq(void)
 {
-	adf_vf_stop_wq = alloc_workqueue("adf_vf_stop_wq", WQ_MEM_RECLAIM, 0);
+	adf_vf_stop_wq = alloc_workqueue("adf_vf_stop_wq",
+					 WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 
 	return !adf_vf_stop_wq ? -EFAULT : 0;
 }
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index b0f9ef6ac6df..f07b8a13a201 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -1327,7 +1327,8 @@ static int __init fw_core_init(void)
 {
 	int ret;
 
-	fw_workqueue = alloc_workqueue("firewire", WQ_MEM_RECLAIM, 0);
+	fw_workqueue = alloc_workqueue("firewire", WQ_MEM_RECLAIM | WQ_PERCPU,
+				       0);
 	if (!fw_workqueue)
 		return -ENOMEM;
 
diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index edaedd156a6d..2b721cca366c 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -3941,7 +3941,8 @@ static struct pci_driver fw_ohci_pci_driver = {
 
 static int __init fw_ohci_init(void)
 {
-	selfid_workqueue = alloc_workqueue(KBUILD_MODNAME, WQ_MEM_RECLAIM, 0);
+	selfid_workqueue = alloc_workqueue(KBUILD_MODNAME,
+					   WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!selfid_workqueue)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 7c0c24732481..2cb9088f67cc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -690,7 +690,8 @@ void kfd_procfs_del_queue(struct queue *q)
 int kfd_process_create_wq(void)
 {
 	if (!kfd_process_wq)
-		kfd_process_wq = alloc_workqueue("kfd_process_wq", 0, 0);
+		kfd_process_wq = alloc_workqueue("kfd_process_wq", WQ_PERCPU,
+						 0);
 	if (!kfd_restore_wq)
 		kfd_restore_wq = alloc_ordered_workqueue("kfd_restore_wq",
 							 WQ_FREEZABLE);
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 0b97b66de577..bc06ea7c4eb1 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2659,7 +2659,8 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 	if (platform->pdata.intp_irq) {
 		INIT_WORK(&platform->work, anx7625_work_func);
 		platform->workqueue = alloc_workqueue("anx7625_work",
-						      WQ_FREEZABLE | WQ_MEM_RECLAIM, 1);
+						      WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
+						      1);
 		if (!platform->workqueue) {
 			DRM_DEV_ERROR(dev, "fail to create work queue\n");
 			ret = -ENOMEM;
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 31740a677dd8..ccfdbe26232c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -243,7 +243,8 @@ int intel_display_driver_probe_noirq(struct intel_display *display)
 	display->wq.modeset = alloc_ordered_workqueue("i915_modeset", 0);
 	display->wq.flip = alloc_workqueue("i915_flip", WQ_HIGHPRI |
 						WQ_UNBOUND, WQ_UNBOUND_MAX_ACTIVE);
-	display->wq.cleanup = alloc_workqueue("i915_cleanup", WQ_HIGHPRI, 0);
+	display->wq.cleanup = alloc_workqueue("i915_cleanup", WQ_HIGHPRI |
+						WQ_PERCPU, 0);
 
 	intel_mode_config_init(display);
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 79b98ba4104e..32edb27f6af6 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -144,7 +144,8 @@ static int i915_workqueues_init(struct drm_i915_private *dev_priv)
 	 * to be scheduled on the system_percpu_wq before moving to a driver
 	 * instance due deprecation of flush_scheduled_work().
 	 */
-	dev_priv->unordered_wq = alloc_workqueue("i915-unordered", 0, 0);
+	dev_priv->unordered_wq = alloc_workqueue("i915-unordered", WQ_PERCPU,
+						 0);
 	if (dev_priv->unordered_wq == NULL)
 		goto out_free_dp_wq;
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
index 8f5ce71fa453..b81d65c77458 100644
--- a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
@@ -526,7 +526,7 @@ static int test_ipc(void *arg)
 	struct workqueue_struct *wq;
 	int ret = 0;
 
-	wq = alloc_workqueue("i1915-selftest", 0, 0);
+	wq = alloc_workqueue("i1915-selftest", WQ_PERCPU, 0);
 	if (wq == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index a77e5b26542c..a55f24240fe0 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -214,7 +214,7 @@ struct drm_i915_private *mock_gem_device(void)
 	if (!i915->wq)
 		goto err_drv;
 
-	i915->unordered_wq = alloc_workqueue("mock-unordered", 0, 0);
+	i915->unordered_wq = alloc_workqueue("mock-unordered", WQ_PERCPU, 0);
 	if (!i915->unordered_wq)
 		goto err_wq;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index e154d08857c5..6fefe051993c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -626,7 +626,7 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	struct drm_device *dev = drm->dev;
 	int ret;
 
-	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
+	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", WQ_PERCPU,
 					WQ_MAX_ACTIVE);
 	if (!drm->sched_wq)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index d326e55d2d24..85b25bffefd8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -415,7 +415,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	int ret;
 
 	if (!wq) {
-		wq = alloc_workqueue("nouveau_sched_wq_%d", 0, WQ_MAX_ACTIVE,
+		wq = alloc_workqueue("nouveau_sched_wq_%d", WQ_PERCPU,
+				     WQ_MAX_ACTIVE,
 				     current->pid);
 		if (!wq)
 			return -ENOMEM;
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 8f5f8abcb1b4..d18aeeb38085 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -687,7 +687,8 @@ static void radeon_crtc_init(struct drm_device *dev, int index)
 	if (radeon_crtc == NULL)
 		return;
 
-	radeon_crtc->flip_queue = alloc_workqueue("radeon-crtc", WQ_HIGHPRI, 0);
+	radeon_crtc->flip_queue = alloc_workqueue("radeon-crtc",
+						  WQ_HIGHPRI | WQ_PERCPU, 0);
 	if (!radeon_crtc->flip_queue) {
 		kfree(radeon_crtc);
 		return;
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 00191227bc95..52b4f0dd827c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -475,8 +475,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
 						       WQ_MEM_RECLAIM);
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
-	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
-	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", 0, 0);
+	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
+	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU, 0);
 	if (!xe->ordered_wq || !xe->unordered_wq ||
 	    !xe->preempt_fence_wq || !xe->destroy_wq) {
 		/*
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5fcb2b4c2c13..9c625c191be2 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -246,7 +246,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
-	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_PERCPU, WQ_MEM_RECLAIM);
 
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 2d68c5b5262a..fae2bab4c25e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -57,7 +57,8 @@ hw_engine_group_alloc(struct xe_device *xe)
 	if (!group)
 		return ERR_PTR(-ENOMEM);
 
-	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
+	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", WQ_PERCPU,
+					   0);
 	if (!group->resume_wq)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index a0eab44c0e76..6e6eb437a802 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -119,7 +119,7 @@ int xe_sriov_init(struct xe_device *xe)
 		xe_sriov_vf_init_early(xe);
 
 	xe_assert(xe, !xe->sriov.wq);
-	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
+	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", WQ_PERCPU, 0);
 	if (!xe->sriov.wq)
 		return -ENOMEM;
 
diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index f6beeebf974c..3f3c07fb62aa 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -1237,7 +1237,7 @@ int __init gb_operation_init(void)
 		goto err_destroy_message_cache;
 
 	gb_operation_completion_wq = alloc_workqueue("greybus_completion",
-						     0, 0);
+						     WQ_PERCPU, 0);
 	if (!gb_operation_completion_wq)
 		goto err_destroy_operation_cache;
 
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 839d5bcd72b1..b7b981fce6a1 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2647,7 +2647,8 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	init_waitqueue_head(&ctlr->wait);
 	spin_lock_init(&ctlr->lock);
 	ctlr->rumble_queue = alloc_workqueue("hid-nintendo-rumble_wq",
-					     WQ_FREEZABLE | WQ_MEM_RECLAIM, 0);
+					     WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
+					     0);
 	if (!ctlr->rumble_queue) {
 		ret = -ENOMEM;
 		goto err;
diff --git a/drivers/hv/mshv_eventfd.c b/drivers/hv/mshv_eventfd.c
index 8dd22be2ca0b..91386f236e25 100644
--- a/drivers/hv/mshv_eventfd.c
+++ b/drivers/hv/mshv_eventfd.c
@@ -592,7 +592,7 @@ static void mshv_irqfd_release(struct mshv_partition *pt)
 
 int mshv_irqfd_wq_init(void)
 {
-	irqfd_cleanup_wq = alloc_workqueue("mshv-irqfd-cleanup", 0, 0);
+	irqfd_cleanup_wq = alloc_workqueue("mshv-irqfd-cleanup", WQ_PERCPU, 0);
 	if (!irqfd_cleanup_wq)
 		return -ENOMEM;
 
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index fd81871609d9..58c8713f0040 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2851,7 +2851,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 	if (ret)
 		goto err_put_dev;
 
-	master->wq = alloc_workqueue("%s", 0, 0, dev_name(parent));
+	master->wq = alloc_workqueue("%s", WQ_PERCPU, 0, dev_name(parent));
 	if (!master->wq) {
 		ret = -ENOMEM;
 		goto err_put_dev;
diff --git a/drivers/infiniband/core/cm.c b/drivers/infiniband/core/cm.c
index 142170473e75..5956cd8291a1 100644
--- a/drivers/infiniband/core/cm.c
+++ b/drivers/infiniband/core/cm.c
@@ -4521,7 +4521,7 @@ static int __init ib_cm_init(void)
 	get_random_bytes(&cm.random_id_operand, sizeof cm.random_id_operand);
 	INIT_LIST_HEAD(&cm.timewait_list);
 
-	cm.wq = alloc_workqueue("ib_cm", 0, 1);
+	cm.wq = alloc_workqueue("ib_cm", WQ_PERCPU, 1);
 	if (!cm.wq) {
 		ret = -ENOMEM;
 		goto error2;
diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/device.c
index b4e3e4beb7f4..e9b536983b3b 100644
--- a/drivers/infiniband/core/device.c
+++ b/drivers/infiniband/core/device.c
@@ -2976,7 +2976,7 @@ static int __init ib_core_init(void)
 {
 	int ret = -ENOMEM;
 
-	ib_wq = alloc_workqueue("infiniband", 0, 0);
+	ib_wq = alloc_workqueue("infiniband", WQ_PERCPU, 0);
 	if (!ib_wq)
 		return -ENOMEM;
 
@@ -2986,7 +2986,7 @@ static int __init ib_core_init(void)
 		goto err;
 
 	ib_comp_wq = alloc_workqueue("ib-comp-wq",
-			WQ_HIGHPRI | WQ_MEM_RECLAIM | WQ_SYSFS, 0);
+			WQ_HIGHPRI | WQ_MEM_RECLAIM | WQ_SYSFS | WQ_PERCPU, 0);
 	if (!ib_comp_wq)
 		goto err_unbound;
 
diff --git a/drivers/infiniband/hw/hfi1/init.c b/drivers/infiniband/hw/hfi1/init.c
index b35f92e7d865..0d7797495ddf 100644
--- a/drivers/infiniband/hw/hfi1/init.c
+++ b/drivers/infiniband/hw/hfi1/init.c
@@ -745,8 +745,7 @@ static int create_workqueues(struct hfi1_devdata *dd)
 			ppd->hfi1_wq =
 				alloc_workqueue(
 				    "hfi%d_%d",
-				    WQ_SYSFS | WQ_HIGHPRI | WQ_CPU_INTENSIVE |
-				    WQ_MEM_RECLAIM,
+				    WQ_SYSFS | WQ_HIGHPRI | WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM | WQ_PERCPU,
 				    HFI1_MAX_ACTIVE_WORKQUEUE_ENTRIES,
 				    dd->unit, pidx);
 			if (!ppd->hfi1_wq)
diff --git a/drivers/infiniband/hw/hfi1/opfn.c b/drivers/infiniband/hw/hfi1/opfn.c
index 370a5a8eaa71..68c1cdbc90c1 100644
--- a/drivers/infiniband/hw/hfi1/opfn.c
+++ b/drivers/infiniband/hw/hfi1/opfn.c
@@ -305,8 +305,7 @@ void opfn_trigger_conn_request(struct rvt_qp *qp, u32 bth1)
 int opfn_init(void)
 {
 	opfn_wq = alloc_workqueue("hfi_opfn",
-				  WQ_SYSFS | WQ_HIGHPRI | WQ_CPU_INTENSIVE |
-				  WQ_MEM_RECLAIM,
+				  WQ_SYSFS | WQ_HIGHPRI | WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM | WQ_PERCPU,
 				  HFI1_MAX_ACTIVE_WORKQUEUE_ENTRIES);
 	if (!opfn_wq)
 		return -ENOMEM;
diff --git a/drivers/infiniband/hw/mlx4/cm.c b/drivers/infiniband/hw/mlx4/cm.c
index 12b481d138cf..03aacd526860 100644
--- a/drivers/infiniband/hw/mlx4/cm.c
+++ b/drivers/infiniband/hw/mlx4/cm.c
@@ -591,7 +591,7 @@ void mlx4_ib_cm_paravirt_clean(struct mlx4_ib_dev *dev, int slave)
 
 int mlx4_ib_cm_init(void)
 {
-	cm_wq = alloc_workqueue("mlx4_ib_cm", 0, 0);
+	cm_wq = alloc_workqueue("mlx4_ib_cm", WQ_PERCPU, 0);
 	if (!cm_wq)
 		return -ENOMEM;
 
diff --git a/drivers/infiniband/sw/rdmavt/cq.c b/drivers/infiniband/sw/rdmavt/cq.c
index 0ca2743f1075..e7835ca70e2b 100644
--- a/drivers/infiniband/sw/rdmavt/cq.c
+++ b/drivers/infiniband/sw/rdmavt/cq.c
@@ -518,7 +518,8 @@ int rvt_poll_cq(struct ib_cq *ibcq, int num_entries, struct ib_wc *entry)
  */
 int rvt_driver_cq_init(void)
 {
-	comp_vector_wq = alloc_workqueue("%s", WQ_HIGHPRI | WQ_CPU_INTENSIVE,
+	comp_vector_wq = alloc_workqueue("%s",
+					 WQ_HIGHPRI | WQ_CPU_INTENSIVE | WQ_PERCPU,
 					 0, "rdmavt_cq");
 	if (!comp_vector_wq)
 		return -ENOMEM;
diff --git a/drivers/infiniband/ulp/iser/iscsi_iser.c b/drivers/infiniband/ulp/iser/iscsi_iser.c
index a5be6f1ba12b..eb99c0f65ca9 100644
--- a/drivers/infiniband/ulp/iser/iscsi_iser.c
+++ b/drivers/infiniband/ulp/iser/iscsi_iser.c
@@ -1033,7 +1033,7 @@ static int __init iser_init(void)
 	mutex_init(&ig.connlist_mutex);
 	INIT_LIST_HEAD(&ig.connlist);
 
-	release_wq = alloc_workqueue("release workqueue", 0, 0);
+	release_wq = alloc_workqueue("release workqueue", WQ_PERCPU, 0);
 	if (!release_wq) {
 		iser_err("failed to allocate release workqueue\n");
 		err = -ENOMEM;
diff --git a/drivers/infiniband/ulp/isert/ib_isert.c b/drivers/infiniband/ulp/isert/ib_isert.c
index 42977a5326ee..af811d060cc8 100644
--- a/drivers/infiniband/ulp/isert/ib_isert.c
+++ b/drivers/infiniband/ulp/isert/ib_isert.c
@@ -2613,7 +2613,7 @@ static struct iscsit_transport iser_target_transport = {
 
 static int __init isert_init(void)
 {
-	isert_login_wq = alloc_workqueue("isert_login_wq", 0, 0);
+	isert_login_wq = alloc_workqueue("isert_login_wq", WQ_PERCPU, 0);
 	if (!isert_login_wq) {
 		isert_err("Unable to allocate isert_login_wq\n");
 		return -ENOMEM;
diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
index 71387811b281..40fd2b695160 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
@@ -3187,7 +3187,7 @@ static int __init rtrs_client_init(void)
 		pr_err("Failed to create rtrs-client dev class\n");
 		return ret;
 	}
-	rtrs_wq = alloc_workqueue("rtrs_client_wq", 0, 0);
+	rtrs_wq = alloc_workqueue("rtrs_client_wq", WQ_PERCPU, 0);
 	if (!rtrs_wq) {
 		class_unregister(&rtrs_clt_dev_class);
 		return -ENOMEM;
diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv.c b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
index ef4abdea3c2d..780a98b2ded9 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-srv.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
@@ -2321,7 +2321,7 @@ static int __init rtrs_server_init(void)
 	if (err)
 		goto out_err;
 
-	rtrs_wq = alloc_workqueue("rtrs_server_wq", 0, 0);
+	rtrs_wq = alloc_workqueue("rtrs_server_wq", WQ_PERCPU, 0);
 	if (!rtrs_wq) {
 		err = -ENOMEM;
 		goto out_dev_class;
diff --git a/drivers/input/mouse/psmouse-smbus.c b/drivers/input/mouse/psmouse-smbus.c
index 93420f07b7d0..5d6a4909ccbf 100644
--- a/drivers/input/mouse/psmouse-smbus.c
+++ b/drivers/input/mouse/psmouse-smbus.c
@@ -299,7 +299,7 @@ int __init psmouse_smbus_module_init(void)
 {
 	int error;
 
-	psmouse_smbus_wq = alloc_workqueue("psmouse-smbus", 0, 0);
+	psmouse_smbus_wq = alloc_workqueue("psmouse-smbus", WQ_PERCPU, 0);
 	if (!psmouse_smbus_wq)
 		return -ENOMEM;
 
diff --git a/drivers/isdn/capi/kcapi.c b/drivers/isdn/capi/kcapi.c
index c5d13bdc239b..e8f7e52354bc 100644
--- a/drivers/isdn/capi/kcapi.c
+++ b/drivers/isdn/capi/kcapi.c
@@ -907,7 +907,7 @@ int __init kcapi_init(void)
 {
 	int err;
 
-	kcapi_wq = alloc_workqueue("kcapi", 0, 0);
+	kcapi_wq = alloc_workqueue("kcapi", WQ_PERCPU, 0);
 	if (!kcapi_wq)
 		return -ENOMEM;
 
diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
index ed40d8600656..1d2213944441 100644
--- a/drivers/md/bcache/btree.c
+++ b/drivers/md/bcache/btree.c
@@ -2836,7 +2836,8 @@ void bch_btree_exit(void)
 
 int __init bch_btree_init(void)
 {
-	btree_io_wq = alloc_workqueue("bch_btree_io", WQ_MEM_RECLAIM, 0);
+	btree_io_wq = alloc_workqueue("bch_btree_io",
+				      WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!btree_io_wq)
 		return -ENOMEM;
 
diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index de0a8e5f5c49..481d61a67032 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -1933,7 +1933,8 @@ struct cache_set *bch_cache_set_alloc(struct cache_sb *sb)
 	if (!c->uuids)
 		goto err;
 
-	c->moving_gc_wq = alloc_workqueue("bcache_gc", WQ_MEM_RECLAIM, 0);
+	c->moving_gc_wq = alloc_workqueue("bcache_gc",
+					  WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!c->moving_gc_wq)
 		goto err;
 
@@ -2867,7 +2868,7 @@ static int __init bcache_init(void)
 	if (bch_btree_init())
 		goto err;
 
-	bcache_wq = alloc_workqueue("bcache", WQ_MEM_RECLAIM, 0);
+	bcache_wq = alloc_workqueue("bcache", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!bcache_wq)
 		goto err;
 
@@ -2880,11 +2881,12 @@ static int __init bcache_init(void)
 	 *
 	 * We still want to user our own queue to not congest the `system_percpu_wq`.
 	 */
-	bch_flush_wq = alloc_workqueue("bch_flush", 0, 0);
+	bch_flush_wq = alloc_workqueue("bch_flush", WQ_PERCPU, 0);
 	if (!bch_flush_wq)
 		goto err;
 
-	bch_journal_wq = alloc_workqueue("bch_journal", WQ_MEM_RECLAIM, 0);
+	bch_journal_wq = alloc_workqueue("bch_journal",
+					 WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!bch_journal_wq)
 		goto err;
 
diff --git a/drivers/md/bcache/writeback.c b/drivers/md/bcache/writeback.c
index 453efbbdc8ee..01969ec07c1a 100644
--- a/drivers/md/bcache/writeback.c
+++ b/drivers/md/bcache/writeback.c
@@ -1079,7 +1079,7 @@ void bch_cached_dev_writeback_init(struct cached_dev *dc)
 int bch_cached_dev_writeback_start(struct cached_dev *dc)
 {
 	dc->writeback_write_wq = alloc_workqueue("bcache_writeback_wq",
-						WQ_MEM_RECLAIM, 0);
+						WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!dc->writeback_write_wq)
 		return -ENOMEM;
 
diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index 9c8ed65cd87e..6c6ee8d62485 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -2933,7 +2933,8 @@ static int __init dm_bufio_init(void)
 	__cache_size_refresh();
 	mutex_unlock(&dm_bufio_clients_lock);
 
-	dm_bufio_wq = alloc_workqueue("dm_bufio_cache", WQ_MEM_RECLAIM, 0);
+	dm_bufio_wq = alloc_workqueue("dm_bufio_cache",
+				      WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!dm_bufio_wq)
 		return -ENOMEM;
 
diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index a10d75a562db..7bad7cc87d37 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -2533,7 +2533,8 @@ static int cache_create(struct cache_args *ca, struct cache **result)
 		goto bad;
 	}
 
-	cache->wq = alloc_workqueue("dm-" DM_MSG_PREFIX, WQ_MEM_RECLAIM, 0);
+	cache->wq = alloc_workqueue("dm-" DM_MSG_PREFIX,
+				    WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!cache->wq) {
 		*error = "could not create workqueue for metadata object";
 		goto bad;
diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index e956d980672c..b25845e36274 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -1877,7 +1877,8 @@ static int clone_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	clone->hydration_offset = 0;
 	atomic_set(&clone->hydrations_in_flight, 0);
 
-	clone->wq = alloc_workqueue("dm-" DM_MSG_PREFIX, WQ_MEM_RECLAIM, 0);
+	clone->wq = alloc_workqueue("dm-" DM_MSG_PREFIX,
+				    WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!clone->wq) {
 		ti->error = "Failed to allocate workqueue";
 		r = -ENOMEM;
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 9dfdb63220d7..518a8ba49a76 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -3420,7 +3420,9 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	if (test_bit(DM_CRYPT_HIGH_PRIORITY, &cc->flags))
 		common_wq_flags |= WQ_HIGHPRI;
 
-	cc->io_queue = alloc_workqueue("kcryptd_io-%s-%d", common_wq_flags, 1, devname, wq_id);
+	cc->io_queue = alloc_workqueue("kcryptd_io-%s-%d",
+				       common_wq_flags | WQ_PERCPU, 1,
+				       devname, wq_id);
 	if (!cc->io_queue) {
 		ti->error = "Couldn't create kcryptd io queue";
 		goto bad;
@@ -3428,7 +3430,7 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 
 	if (test_bit(DM_CRYPT_SAME_CPU, &cc->flags)) {
 		cc->crypt_queue = alloc_workqueue("kcryptd-%s-%d",
-						  common_wq_flags | WQ_CPU_INTENSIVE,
+						  common_wq_flags | WQ_CPU_INTENSIVE | WQ_PERCPU,
 						  1, devname, wq_id);
 	} else {
 		/*
diff --git a/drivers/md/dm-delay.c b/drivers/md/dm-delay.c
index d4cf0ac2a7aa..a6e6c485f01f 100644
--- a/drivers/md/dm-delay.c
+++ b/drivers/md/dm-delay.c
@@ -279,7 +279,9 @@ static int delay_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	} else {
 		timer_setup(&dc->delay_timer, handle_delayed_timer, 0);
 		INIT_WORK(&dc->flush_expired_bios, flush_expired_bios);
-		dc->kdelayd_wq = alloc_workqueue("kdelayd", WQ_MEM_RECLAIM, 0);
+		dc->kdelayd_wq = alloc_workqueue("kdelayd",
+						 WQ_MEM_RECLAIM | WQ_PERCPU,
+						 0);
 		if (!dc->kdelayd_wq) {
 			ret = -EINVAL;
 			DMERR("Couldn't start kdelayd");
diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 2a283feb3319..3420a5a06d02 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -4818,7 +4818,8 @@ static int dm_integrity_ctr(struct dm_target *ti, unsigned int argc, char **argv
 	}
 
 	ic->metadata_wq = alloc_workqueue("dm-integrity-metadata",
-					  WQ_MEM_RECLAIM, METADATA_WORKQUEUE_MAX_ACTIVE);
+					  WQ_MEM_RECLAIM | WQ_PERCPU,
+					  METADATA_WORKQUEUE_MAX_ACTIVE);
 	if (!ic->metadata_wq) {
 		ti->error = "Cannot allocate workqueue";
 		r = -ENOMEM;
@@ -4836,7 +4837,8 @@ static int dm_integrity_ctr(struct dm_target *ti, unsigned int argc, char **argv
 		goto bad;
 	}
 
-	ic->offload_wq = alloc_workqueue("dm-integrity-offload", WQ_MEM_RECLAIM,
+	ic->offload_wq = alloc_workqueue("dm-integrity-offload",
+					  WQ_MEM_RECLAIM | WQ_PERCPU,
 					  METADATA_WORKQUEUE_MAX_ACTIVE);
 	if (!ic->offload_wq) {
 		ti->error = "Cannot allocate workqueue";
@@ -4844,7 +4846,8 @@ static int dm_integrity_ctr(struct dm_target *ti, unsigned int argc, char **argv
 		goto bad;
 	}
 
-	ic->commit_wq = alloc_workqueue("dm-integrity-commit", WQ_MEM_RECLAIM, 1);
+	ic->commit_wq = alloc_workqueue("dm-integrity-commit",
+					WQ_MEM_RECLAIM | WQ_PERCPU, 1);
 	if (!ic->commit_wq) {
 		ti->error = "Cannot allocate workqueue";
 		r = -ENOMEM;
@@ -4853,7 +4856,8 @@ static int dm_integrity_ctr(struct dm_target *ti, unsigned int argc, char **argv
 	INIT_WORK(&ic->commit_work, integrity_commit);
 
 	if (ic->mode == 'J' || ic->mode == 'B') {
-		ic->writer_wq = alloc_workqueue("dm-integrity-writer", WQ_MEM_RECLAIM, 1);
+		ic->writer_wq = alloc_workqueue("dm-integrity-writer",
+						WQ_MEM_RECLAIM | WQ_PERCPU, 1);
 		if (!ic->writer_wq) {
 			ti->error = "Cannot allocate workqueue";
 			r = -ENOMEM;
@@ -5025,7 +5029,8 @@ static int dm_integrity_ctr(struct dm_target *ti, unsigned int argc, char **argv
 	}
 
 	if (ic->internal_hash) {
-		ic->recalc_wq = alloc_workqueue("dm-integrity-recalc", WQ_MEM_RECLAIM, 1);
+		ic->recalc_wq = alloc_workqueue("dm-integrity-recalc",
+						WQ_MEM_RECLAIM | WQ_PERCPU, 1);
 		if (!ic->recalc_wq) {
 			ti->error = "Cannot allocate workqueue";
 			r = -ENOMEM;
diff --git a/drivers/md/dm-kcopyd.c b/drivers/md/dm-kcopyd.c
index 6ea75436a433..cec9a60227b6 100644
--- a/drivers/md/dm-kcopyd.c
+++ b/drivers/md/dm-kcopyd.c
@@ -934,7 +934,8 @@ struct dm_kcopyd_client *dm_kcopyd_client_create(struct dm_kcopyd_throttle *thro
 		goto bad_slab;
 
 	INIT_WORK(&kc->kcopyd_work, do_work);
-	kc->kcopyd_wq = alloc_workqueue("kcopyd", WQ_MEM_RECLAIM, 0);
+	kc->kcopyd_wq = alloc_workqueue("kcopyd", WQ_MEM_RECLAIM | WQ_PERCPU,
+					0);
 	if (!kc->kcopyd_wq) {
 		r = -ENOMEM;
 		goto bad_workqueue;
diff --git a/drivers/md/dm-log-userspace-base.c b/drivers/md/dm-log-userspace-base.c
index 9fbb4b48fb2b..607436804a8b 100644
--- a/drivers/md/dm-log-userspace-base.c
+++ b/drivers/md/dm-log-userspace-base.c
@@ -299,7 +299,8 @@ static int userspace_ctr(struct dm_dirty_log *log, struct dm_target *ti,
 	}
 
 	if (lc->integrated_flush) {
-		lc->dmlog_wq = alloc_workqueue("dmlogd", WQ_MEM_RECLAIM, 0);
+		lc->dmlog_wq = alloc_workqueue("dmlogd",
+					       WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 		if (!lc->dmlog_wq) {
 			DMERR("couldn't start dmlogd");
 			r = -ENOMEM;
diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index 6c98f4ae5ea9..a0f6de8040c5 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -2205,7 +2205,8 @@ static int __init dm_multipath_init(void)
 {
 	int r = -ENOMEM;
 
-	kmultipathd = alloc_workqueue("kmpathd", WQ_MEM_RECLAIM, 0);
+	kmultipathd = alloc_workqueue("kmpathd", WQ_MEM_RECLAIM | WQ_PERCPU,
+				      0);
 	if (!kmultipathd) {
 		DMERR("failed to create workqueue kmpathd");
 		goto bad_alloc_kmultipathd;
@@ -2224,7 +2225,7 @@ static int __init dm_multipath_init(void)
 		goto bad_alloc_kmpath_handlerd;
 	}
 
-	dm_mpath_wq = alloc_workqueue("dm_mpath_wq", 0, 0);
+	dm_mpath_wq = alloc_workqueue("dm_mpath_wq", WQ_PERCPU, 0);
 	if (!dm_mpath_wq) {
 		DMERR("failed to create workqueue dm_mpath_wq");
 		goto bad_alloc_dm_mpath_wq;
diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
index 9e615b4f1f5e..3e773591d1c6 100644
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@ -1129,7 +1129,8 @@ static int mirror_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	ti->num_discard_bios = 1;
 	ti->per_io_data_size = sizeof(struct dm_raid1_bio_record);
 
-	ms->kmirrord_wq = alloc_workqueue("kmirrord", WQ_MEM_RECLAIM, 0);
+	ms->kmirrord_wq = alloc_workqueue("kmirrord",
+					  WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!ms->kmirrord_wq) {
 		DMERR("couldn't start kmirrord");
 		r = -ENOMEM;
@@ -1501,7 +1502,7 @@ static int __init dm_mirror_init(void)
 {
 	int r;
 
-	dm_raid1_wq = alloc_workqueue("dm_raid1_wq", 0, 0);
+	dm_raid1_wq = alloc_workqueue("dm_raid1_wq", WQ_PERCPU, 0);
 	if (!dm_raid1_wq) {
 		DMERR("Failed to alloc workqueue");
 		return -ENOMEM;
diff --git a/drivers/md/dm-snap-persistent.c b/drivers/md/dm-snap-persistent.c
index 568d10842b1f..0e13d60bfdd1 100644
--- a/drivers/md/dm-snap-persistent.c
+++ b/drivers/md/dm-snap-persistent.c
@@ -871,7 +871,8 @@ static int persistent_ctr(struct dm_exception_store *store, char *options)
 	atomic_set(&ps->pending_count, 0);
 	ps->callbacks = NULL;
 
-	ps->metadata_wq = alloc_workqueue("ksnaphd", WQ_MEM_RECLAIM, 0);
+	ps->metadata_wq = alloc_workqueue("ksnaphd",
+					  WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!ps->metadata_wq) {
 		DMERR("couldn't start header metadata update thread");
 		r = -ENOMEM;
diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
index a1b7535c508a..4241992228a6 100644
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@ -485,7 +485,7 @@ int __init dm_stripe_init(void)
 {
 	int r;
 
-	dm_stripe_wq = alloc_workqueue("dm_stripe_wq", 0, 0);
+	dm_stripe_wq = alloc_workqueue("dm_stripe_wq", WQ_PERCPU, 0);
 	if (!dm_stripe_wq)
 		return -ENOMEM;
 	r = dm_register_target(&stripe_target);
diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index 3c427f18a04b..50e59a161486 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -1665,7 +1665,9 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	 * will fall-back to using it for error handling (or if the bufio cache
 	 * doesn't have required hashes).
 	 */
-	v->verify_wq = alloc_workqueue("kverityd", WQ_MEM_RECLAIM | WQ_HIGHPRI, 0);
+	v->verify_wq = alloc_workqueue("kverityd",
+				       WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_PERCPU,
+				       0);
 	if (!v->verify_wq) {
 		ti->error = "Cannot allocate workqueue";
 		r = -ENOMEM;
diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index d6a04a57472d..8a50e7e88f2e 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -2276,7 +2276,8 @@ static int writecache_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		goto bad;
 	}
 
-	wc->writeback_wq = alloc_workqueue("writecache-writeback", WQ_MEM_RECLAIM, 1);
+	wc->writeback_wq = alloc_workqueue("writecache-writeback",
+					   WQ_MEM_RECLAIM | WQ_PERCPU, 1);
 	if (!wc->writeback_wq) {
 		r = -ENOMEM;
 		ti->error = "Could not allocate writeback workqueue";
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 5ab7574c0c76..84b2746d7672 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -2344,7 +2344,8 @@ static struct mapped_device *alloc_dev(int minor)
 
 	format_dev_t(md->name, MKDEV(_major, minor));
 
-	md->wq = alloc_workqueue("kdmflush/%s", WQ_MEM_RECLAIM, 0, md->name);
+	md->wq = alloc_workqueue("kdmflush/%s", WQ_MEM_RECLAIM | WQ_PERCPU, 0,
+				 md->name);
 	if (!md->wq)
 		goto bad;
 
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 9daa78c5fe33..1f0b047618f7 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -9929,11 +9929,11 @@ static int __init md_init(void)
 {
 	int ret = -ENOMEM;
 
-	md_wq = alloc_workqueue("md", WQ_MEM_RECLAIM, 0);
+	md_wq = alloc_workqueue("md", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!md_wq)
 		goto err_wq;
 
-	md_misc_wq = alloc_workqueue("md_misc", 0, 0);
+	md_misc_wq = alloc_workqueue("md_misc", WQ_PERCPU, 0);
 	if (!md_misc_wq)
 		goto err_misc_wq;
 
diff --git a/drivers/media/pci/ddbridge/ddbridge-core.c b/drivers/media/pci/ddbridge/ddbridge-core.c
index 40e6c873c36d..d240e291ba4f 100644
--- a/drivers/media/pci/ddbridge/ddbridge-core.c
+++ b/drivers/media/pci/ddbridge/ddbridge-core.c
@@ -3430,7 +3430,7 @@ int ddb_init_ddbridge(void)
 
 	if (ddb_class_create() < 0)
 		return -1;
-	ddb_wq = alloc_workqueue("ddbridge", 0, 0);
+	ddb_wq = alloc_workqueue("ddbridge", WQ_PERCPU, 0);
 	if (!ddb_wq)
 		return ddb_exit_ddbridge(1, -1);
 
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index f571f561f070..fa6af1cc5eba 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -274,14 +274,16 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_free_mutex;
 	}
 
-	mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME, WQ_FREEZABLE, 0);
+	mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME,
+				      WQ_FREEZABLE | WQ_PERCPU, 0);
 	if (!mdp->job_wq) {
 		dev_err(dev, "Unable to create job workqueue\n");
 		ret = -ENOMEM;
 		goto err_deinit_comp;
 	}
 
-	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock", WQ_FREEZABLE,
+	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock",
+					WQ_FREEZABLE | WQ_PERCPU,
 					0);
 	if (!mdp->clock_wq) {
 		dev_err(dev, "Unable to create clock workqueue\n");
diff --git a/drivers/message/fusion/mptbase.c b/drivers/message/fusion/mptbase.c
index 738bc4e60a18..e60a8d3947c9 100644
--- a/drivers/message/fusion/mptbase.c
+++ b/drivers/message/fusion/mptbase.c
@@ -1857,7 +1857,8 @@ mpt_attach(struct pci_dev *pdev, const struct pci_device_id *id)
 	INIT_DELAYED_WORK(&ioc->fault_reset_work, mpt_fault_reset_work);
 
 	ioc->reset_work_q =
-		alloc_workqueue("mpt_poll_%d", WQ_MEM_RECLAIM, 0, ioc->id);
+		alloc_workqueue("mpt_poll_%d", WQ_MEM_RECLAIM | WQ_PERCPU, 0,
+				ioc->id);
 	if (!ioc->reset_work_q) {
 		printk(MYIOC_s_ERR_FMT "Insufficient memory to add adapter!\n",
 		    ioc->name);
@@ -1984,7 +1985,9 @@ mpt_attach(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	INIT_LIST_HEAD(&ioc->fw_event_list);
 	spin_lock_init(&ioc->fw_event_lock);
-	ioc->fw_event_q = alloc_workqueue("mpt/%d", WQ_MEM_RECLAIM, 0, ioc->id);
+	ioc->fw_event_q = alloc_workqueue("mpt/%d",
+					  WQ_MEM_RECLAIM | WQ_PERCPU, 0,
+					  ioc->id);
 	if (!ioc->fw_event_q) {
 		printk(MYIOC_s_ERR_FMT "Insufficient memory to add adapter!\n",
 		    ioc->name);
diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index 4830628510e6..744444fc26db 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -3325,7 +3325,8 @@ static int mmc_blk_probe(struct mmc_card *card)
 	mmc_fixup_device(card, mmc_blk_fixups);
 
 	card->complete_wq = alloc_workqueue("mmc_complete",
-					WQ_MEM_RECLAIM | WQ_HIGHPRI, 0);
+					WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_PERCPU,
+					0);
 	if (!card->complete_wq) {
 		pr_err("Failed to create mmc completion workqueue");
 		return -ENOMEM;
diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index c50617d03709..ec890aa0c7b2 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -1483,7 +1483,7 @@ static int mmc_omap_probe(struct platform_device *pdev)
 	host->nr_slots = pdata->nr_slots;
 	host->reg_shift = (mmc_omap7xx() ? 1 : 2);
 
-	host->mmc_omap_wq = alloc_workqueue("mmc_omap", 0, 0);
+	host->mmc_omap_wq = alloc_workqueue("mmc_omap", WQ_PERCPU, 0);
 	if (!host->mmc_omap_wq) {
 		ret = -ENOMEM;
 		goto err_plat_cleanup;
diff --git a/drivers/net/can/spi/hi311x.c b/drivers/net/can/spi/hi311x.c
index 09ae218315d7..96f23311b4ee 100644
--- a/drivers/net/can/spi/hi311x.c
+++ b/drivers/net/can/spi/hi311x.c
@@ -770,7 +770,8 @@ static int hi3110_open(struct net_device *net)
 		goto out_close;
 	}
 
-	priv->wq = alloc_workqueue("hi3110_wq", WQ_FREEZABLE | WQ_MEM_RECLAIM,
+	priv->wq = alloc_workqueue("hi3110_wq",
+				   WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
 				   0);
 	if (!priv->wq) {
 		ret = -ENOMEM;
diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251x.c
index ec5c64006a16..ec8c9193c4e4 100644
--- a/drivers/net/can/spi/mcp251x.c
+++ b/drivers/net/can/spi/mcp251x.c
@@ -1365,7 +1365,8 @@ static int mcp251x_can_probe(struct spi_device *spi)
 	if (ret)
 		goto out_clk;
 
-	priv->wq = alloc_workqueue("mcp251x_wq", WQ_FREEZABLE | WQ_MEM_RECLAIM,
+	priv->wq = alloc_workqueue("mcp251x_wq",
+				   WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
 				   0);
 	if (!priv->wq) {
 		ret = -ENOMEM;
diff --git a/drivers/net/ethernet/cavium/liquidio/lio_core.c b/drivers/net/ethernet/cavium/liquidio/lio_core.c
index 674c54831875..215dac201b4a 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_core.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_core.c
@@ -472,7 +472,7 @@ int setup_rx_oom_poll_fn(struct net_device *netdev)
 		q_no = lio->linfo.rxpciq[q].s.q_no;
 		wq = &lio->rxq_status_wq[q_no];
 		wq->wq = alloc_workqueue("rxq-oom-status",
-					 WQ_MEM_RECLAIM, 0);
+					 WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 		if (!wq->wq) {
 			dev_err(&oct->pci_dev->dev, "unable to create cavium rxq oom status wq\n");
 			return -ENOMEM;
diff --git a/drivers/net/ethernet/cavium/liquidio/lio_main.c b/drivers/net/ethernet/cavium/liquidio/lio_main.c
index 1d79f6eaa41f..8e2fcec26ea1 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_main.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_main.c
@@ -526,7 +526,8 @@ static inline int setup_link_status_change_wq(struct net_device *netdev)
 	struct octeon_device *oct = lio->oct_dev;
 
 	lio->link_status_wq.wq = alloc_workqueue("link-status",
-						 WQ_MEM_RECLAIM, 0);
+						 WQ_MEM_RECLAIM | WQ_PERCPU,
+						 0);
 	if (!lio->link_status_wq.wq) {
 		dev_err(&oct->pci_dev->dev, "unable to create cavium link status wq\n");
 		return -1;
@@ -659,7 +660,8 @@ static inline int setup_sync_octeon_time_wq(struct net_device *netdev)
 	struct octeon_device *oct = lio->oct_dev;
 
 	lio->sync_octeon_time_wq.wq =
-		alloc_workqueue("update-octeon-time", WQ_MEM_RECLAIM, 0);
+		alloc_workqueue("update-octeon-time",
+				WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!lio->sync_octeon_time_wq.wq) {
 		dev_err(&oct->pci_dev->dev, "Unable to create wq to update octeon time\n");
 		return -1;
@@ -1734,7 +1736,7 @@ static inline int setup_tx_poll_fn(struct net_device *netdev)
 	struct octeon_device *oct = lio->oct_dev;
 
 	lio->txq_status_wq.wq = alloc_workqueue("txq-status",
-						WQ_MEM_RECLAIM, 0);
+						WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!lio->txq_status_wq.wq) {
 		dev_err(&oct->pci_dev->dev, "unable to create cavium txq status wq\n");
 		return -1;
diff --git a/drivers/net/ethernet/cavium/liquidio/lio_vf_main.c b/drivers/net/ethernet/cavium/liquidio/lio_vf_main.c
index 62c2eadc33e3..3230dff5ba05 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_vf_main.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_vf_main.c
@@ -304,7 +304,8 @@ static int setup_link_status_change_wq(struct net_device *netdev)
 	struct octeon_device *oct = lio->oct_dev;
 
 	lio->link_status_wq.wq = alloc_workqueue("link-status",
-						 WQ_MEM_RECLAIM, 0);
+						 WQ_MEM_RECLAIM | WQ_PERCPU,
+						 0);
 	if (!lio->link_status_wq.wq) {
 		dev_err(&oct->pci_dev->dev, "unable to create cavium link status wq\n");
 		return -1;
diff --git a/drivers/net/ethernet/cavium/liquidio/request_manager.c b/drivers/net/ethernet/cavium/liquidio/request_manager.c
index de8a6ce86ad7..8b8e9953c4ee 100644
--- a/drivers/net/ethernet/cavium/liquidio/request_manager.c
+++ b/drivers/net/ethernet/cavium/liquidio/request_manager.c
@@ -132,7 +132,7 @@ int octeon_init_instr_queue(struct octeon_device *oct,
 	oct->fn_list.setup_iq_regs(oct, iq_no);
 
 	oct->check_db_wq[iq_no].wq = alloc_workqueue("check_iq_db",
-						     WQ_MEM_RECLAIM,
+						     WQ_MEM_RECLAIM | WQ_PERCPU,
 						     0);
 	if (!oct->check_db_wq[iq_no].wq) {
 		vfree(iq->request_list);
diff --git a/drivers/net/ethernet/cavium/liquidio/response_manager.c b/drivers/net/ethernet/cavium/liquidio/response_manager.c
index 861050966e18..de1a8335b545 100644
--- a/drivers/net/ethernet/cavium/liquidio/response_manager.c
+++ b/drivers/net/ethernet/cavium/liquidio/response_manager.c
@@ -39,7 +39,8 @@ int octeon_setup_response_list(struct octeon_device *oct)
 	}
 	spin_lock_init(&oct->cmd_resp_wqlock);
 
-	oct->dma_comp_wq.wq = alloc_workqueue("dma-comp", WQ_MEM_RECLAIM, 0);
+	oct->dma_comp_wq.wq = alloc_workqueue("dma-comp",
+					      WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!oct->dma_comp_wq.wq) {
 		dev_err(&oct->pci_dev->dev, "failed to create wq thread\n");
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
index 29886a8ba73f..c689993a3cb0 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
@@ -4844,7 +4844,7 @@ static int dpaa2_eth_probe(struct fsl_mc_device *dpni_dev)
 	priv->tx_tstamp_type = HWTSTAMP_TX_OFF;
 	priv->rx_tstamp = false;
 
-	priv->dpaa2_ptp_wq = alloc_workqueue("dpaa2_ptp_wq", 0, 0);
+	priv->dpaa2_ptp_wq = alloc_workqueue("dpaa2_ptp_wq", WQ_PERCPU, 0);
 	if (!priv->dpaa2_ptp_wq) {
 		err = -ENOMEM;
 		goto err_wq_alloc;
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 3e28a08934ab..b3c06bb3d6be 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -12906,7 +12906,8 @@ static int __init hclge_init(void)
 {
 	pr_info("%s is initializing\n", HCLGE_NAME);
 
-	hclge_wq = alloc_workqueue("%s", WQ_UNBOUND, 0, HCLGE_NAME);
+	hclge_wq = alloc_workqueue("%s", WQ_UNBOUND, 0,
+				   HCLGE_NAME);
 	if (!hclge_wq) {
 		pr_err("%s: failed to create workqueue\n", HCLGE_NAME);
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/intel/fm10k/fm10k_main.c b/drivers/net/ethernet/intel/fm10k/fm10k_main.c
index 142f07ca8bc0..b8c15b837fda 100644
--- a/drivers/net/ethernet/intel/fm10k/fm10k_main.c
+++ b/drivers/net/ethernet/intel/fm10k/fm10k_main.c
@@ -37,7 +37,7 @@ static int __init fm10k_init_module(void)
 	pr_info("%s\n", fm10k_copyright);
 
 	/* create driver workqueue */
-	fm10k_workqueue = alloc_workqueue("%s", WQ_MEM_RECLAIM, 0,
+	fm10k_workqueue = alloc_workqueue("%s", WQ_MEM_RECLAIM | WQ_PERCPU, 0,
 					  fm10k_driver_name);
 	if (!fm10k_workqueue)
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/intel/i40e/i40e_main.c b/drivers/net/ethernet/intel/i40e/i40e_main.c
index 120d68654e3f..73d9416803f7 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_main.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_main.c
@@ -16690,7 +16690,7 @@ static int __init i40e_init_module(void)
 	 * since we need to be able to guarantee forward progress even under
 	 * memory pressure.
 	 */
-	i40e_wq = alloc_workqueue("%s", 0, 0, i40e_driver_name);
+	i40e_wq = alloc_workqueue("%s", WQ_PERCPU, 0, i40e_driver_name);
 	if (!i40e_wq) {
 		pr_err("%s: Failed to create workqueue\n", i40e_driver_name);
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/marvell/octeontx2/af/cgx.c b/drivers/net/ethernet/marvell/octeontx2/af/cgx.c
index 0b27a695008b..524ff869a91b 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/cgx.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/cgx.c
@@ -1955,7 +1955,7 @@ static int cgx_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* init wq for processing linkup requests */
 	INIT_WORK(&cgx->cgx_cmd_work, cgx_lmac_linkup_work);
-	cgx->cgx_cmd_workq = alloc_workqueue("cgx_cmd_workq", 0, 0);
+	cgx->cgx_cmd_workq = alloc_workqueue("cgx_cmd_workq", WQ_PERCPU, 0);
 	if (!cgx->cgx_cmd_workq) {
 		dev_err(dev, "alloc workqueue failed for cgx cmd");
 		err = -ENOMEM;
diff --git a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
index 655dd4726d36..2b0cf25ba517 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
@@ -911,7 +911,7 @@ int rvu_mcs_init(struct rvu *rvu)
 	/* Initialize the wq for handling mcs interrupts */
 	INIT_LIST_HEAD(&rvu->mcs_intrq_head);
 	INIT_WORK(&rvu->mcs_intr_work, mcs_intr_handler_task);
-	rvu->mcs_intr_wq = alloc_workqueue("mcs_intr_wq", 0, 0);
+	rvu->mcs_intr_wq = alloc_workqueue("mcs_intr_wq", WQ_PERCPU, 0);
 	if (!rvu->mcs_intr_wq) {
 		dev_err(rvu->dev, "mcs alloc workqueue failed\n");
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c
index 992fa0b82e8d..ddae82ee8ccc 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c
@@ -313,7 +313,7 @@ static int cgx_lmac_event_handler_init(struct rvu *rvu)
 	spin_lock_init(&rvu->cgx_evq_lock);
 	INIT_LIST_HEAD(&rvu->cgx_evq_head);
 	INIT_WORK(&rvu->cgx_evh_work, cgx_evhandler_task);
-	rvu->cgx_evh_wq = alloc_workqueue("rvu_evh_wq", 0, 0);
+	rvu->cgx_evh_wq = alloc_workqueue("rvu_evh_wq", WQ_PERCPU, 0);
 	if (!rvu->cgx_evh_wq) {
 		dev_err(rvu->dev, "alloc workqueue failed");
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_rep.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_rep.c
index 052ae5923e3a..258557978ab2 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_rep.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_rep.c
@@ -375,7 +375,7 @@ int rvu_rep_install_mcam_rules(struct rvu *rvu)
 	spin_lock_init(&rvu->rep_evtq_lock);
 	INIT_LIST_HEAD(&rvu->rep_evtq_head);
 	INIT_WORK(&rvu->rep_evt_work, rvu_rep_wq_handler);
-	rvu->rep_evt_wq = alloc_workqueue("rep_evt_wq", 0, 0);
+	rvu->rep_evt_wq = alloc_workqueue("rep_evt_wq", WQ_PERCPU, 0);
 	if (!rvu->rep_evt_wq) {
 		dev_err(rvu->dev, "REP workqueue allocation failed\n");
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c b/drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c
index fc59e50bafce..0fdc12b345be 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c
@@ -798,7 +798,8 @@ int cn10k_ipsec_init(struct net_device *netdev)
 	pf->ipsec.sa_size = sa_size;
 
 	INIT_WORK(&pf->ipsec.sa_work, cn10k_ipsec_sa_wq_handler);
-	pf->ipsec.sa_workq = alloc_workqueue("cn10k_ipsec_sa_workq", 0, 0);
+	pf->ipsec.sa_workq = alloc_workqueue("cn10k_ipsec_sa_workq",
+					     WQ_PERCPU, 0);
 	if (!pf->ipsec.sa_workq) {
 		netdev_err(pf->netdev, "SA alloc workqueue failed\n");
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/marvell/prestera/prestera_main.c b/drivers/net/ethernet/marvell/prestera/prestera_main.c
index 71ffb55d1fc4..65e7ef033bde 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_main.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_main.c
@@ -1500,7 +1500,7 @@ EXPORT_SYMBOL(prestera_device_unregister);
 
 static int __init prestera_module_init(void)
 {
-	prestera_wq = alloc_workqueue("prestera", 0, 0);
+	prestera_wq = alloc_workqueue("prestera", WQ_PERCPU, 0);
 	if (!prestera_wq)
 		return -ENOMEM;
 
diff --git a/drivers/net/ethernet/marvell/prestera/prestera_pci.c b/drivers/net/ethernet/marvell/prestera/prestera_pci.c
index 35857dc19542..982a477ebb7f 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_pci.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_pci.c
@@ -898,7 +898,7 @@ static int prestera_pci_probe(struct pci_dev *pdev,
 
 	dev_info(fw->dev.dev, "Prestera FW is ready\n");
 
-	fw->wq = alloc_workqueue("prestera_fw_wq", WQ_HIGHPRI, 1);
+	fw->wq = alloc_workqueue("prestera_fw_wq", WQ_HIGHPRI | WQ_PERCPU, 1);
 	if (!fw->wq) {
 		err = -ENOMEM;
 		goto err_wq_alloc;
diff --git a/drivers/net/ethernet/mellanox/mlxsw/core.c b/drivers/net/ethernet/mellanox/mlxsw/core.c
index 2bb2b77351bd..8a5d47a846c6 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/core.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/core.c
@@ -886,7 +886,7 @@ static int mlxsw_emad_init(struct mlxsw_core *mlxsw_core)
 	if (!(mlxsw_core->bus->features & MLXSW_BUS_F_TXRX))
 		return 0;
 
-	emad_wq = alloc_workqueue("mlxsw_core_emad", 0, 0);
+	emad_wq = alloc_workqueue("mlxsw_core_emad", WQ_PERCPU, 0);
 	if (!emad_wq)
 		return -ENOMEM;
 	mlxsw_core->emad_wq = emad_wq;
@@ -3381,7 +3381,7 @@ static int __init mlxsw_core_module_init(void)
 	if (err)
 		return err;
 
-	mlxsw_wq = alloc_workqueue(mlxsw_core_driver_name, 0, 0);
+	mlxsw_wq = alloc_workqueue(mlxsw_core_driver_name, WQ_PERCPU, 0);
 	if (!mlxsw_wq) {
 		err = -ENOMEM;
 		goto err_alloc_workqueue;
diff --git a/drivers/net/ethernet/netronome/nfp/nfp_main.c b/drivers/net/ethernet/netronome/nfp/nfp_main.c
index 71301dbd8fb5..48390b2fd44d 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_main.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_main.c
@@ -797,7 +797,7 @@ static int nfp_pci_probe(struct pci_dev *pdev,
 	pf->pdev = pdev;
 	pf->dev_info = dev_info;
 
-	pf->wq = alloc_workqueue("nfp-%s", 0, 2, pci_name(pdev));
+	pf->wq = alloc_workqueue("nfp-%s", WQ_PERCPU, 2, pci_name(pdev));
 	if (!pf->wq) {
 		err = -ENOMEM;
 		goto err_pci_priv_unset;
diff --git a/drivers/net/ethernet/qlogic/qed/qed_main.c b/drivers/net/ethernet/qlogic/qed/qed_main.c
index 886061d7351a..d4685ad4b169 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_main.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_main.c
@@ -1214,7 +1214,8 @@ static int qed_slowpath_wq_start(struct qed_dev *cdev)
 		hwfn = &cdev->hwfns[i];
 
 		hwfn->slowpath_wq = alloc_workqueue("slowpath-%02x:%02x.%02x",
-					 0, 0, cdev->pdev->bus->number,
+					 WQ_PERCPU, 0,
+					 cdev->pdev->bus->number,
 					 PCI_SLOT(cdev->pdev->devfn),
 					 hwfn->abs_pf_id);
 
diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/wiznet/w5100.c
index b77f096eaf99..c5424d882135 100644
--- a/drivers/net/ethernet/wiznet/w5100.c
+++ b/drivers/net/ethernet/wiznet/w5100.c
@@ -1142,7 +1142,7 @@ int w5100_probe(struct device *dev, const struct w5100_ops *ops,
 	if (err < 0)
 		goto err_register;
 
-	priv->xfer_wq = alloc_workqueue("%s", WQ_MEM_RECLAIM, 0,
+	priv->xfer_wq = alloc_workqueue("%s", WQ_MEM_RECLAIM | WQ_PERCPU, 0,
 					netdev_name(ndev));
 	if (!priv->xfer_wq) {
 		err = -ENOMEM;
diff --git a/drivers/net/fjes/fjes_main.c b/drivers/net/fjes/fjes_main.c
index 4a4ed2ccf72f..b63965d9a1ba 100644
--- a/drivers/net/fjes/fjes_main.c
+++ b/drivers/net/fjes/fjes_main.c
@@ -1364,14 +1364,15 @@ static int fjes_probe(struct platform_device *plat_dev)
 	adapter->force_reset = false;
 	adapter->open_guard = false;
 
-	adapter->txrx_wq = alloc_workqueue(DRV_NAME "/txrx", WQ_MEM_RECLAIM, 0);
+	adapter->txrx_wq = alloc_workqueue(DRV_NAME "/txrx",
+					   WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (unlikely(!adapter->txrx_wq)) {
 		err = -ENOMEM;
 		goto err_free_netdev;
 	}
 
 	adapter->control_wq = alloc_workqueue(DRV_NAME "/control",
-					      WQ_MEM_RECLAIM, 0);
+					      WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (unlikely(!adapter->control_wq)) {
 		err = -ENOMEM;
 		goto err_free_txrx_wq;
diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index 3ffeeba5dccf..f6cc68e433ee 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -333,7 +333,8 @@ static int wg_newlink(struct net_device *dev,
 		goto err_free_peer_hashtable;
 
 	wg->handshake_receive_wq = alloc_workqueue("wg-kex-%s",
-			WQ_CPU_INTENSIVE | WQ_FREEZABLE, 0, dev->name);
+			WQ_CPU_INTENSIVE | WQ_FREEZABLE | WQ_PERCPU, 0,
+			dev->name);
 	if (!wg->handshake_receive_wq)
 		goto err_free_index_hashtable;
 
@@ -343,7 +344,8 @@ static int wg_newlink(struct net_device *dev,
 		goto err_destroy_handshake_receive;
 
 	wg->packet_crypt_wq = alloc_workqueue("wg-crypt-%s",
-			WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM, 0, dev->name);
+			WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM | WQ_PERCPU, 0,
+			dev->name);
 	if (!wg->packet_crypt_wq)
 		goto err_destroy_handshake_send;
 
diff --git a/drivers/net/wireless/ath/ath6kl/usb.c b/drivers/net/wireless/ath/ath6kl/usb.c
index 5220809841a6..e281bfe40fa7 100644
--- a/drivers/net/wireless/ath/ath6kl/usb.c
+++ b/drivers/net/wireless/ath/ath6kl/usb.c
@@ -637,7 +637,7 @@ static struct ath6kl_usb *ath6kl_usb_create(struct usb_interface *interface)
 	ar_usb = kzalloc(sizeof(struct ath6kl_usb), GFP_KERNEL);
 	if (ar_usb == NULL)
 		return NULL;
-	ar_usb->wq = alloc_workqueue("ath6kl_wq", 0, 0);
+	ar_usb->wq = alloc_workqueue("ath6kl_wq", WQ_PERCPU, 0);
 	if (!ar_usb->wq) {
 		kfree(ar_usb);
 		return NULL;
diff --git a/drivers/net/wireless/marvell/libertas/if_sdio.c b/drivers/net/wireless/marvell/libertas/if_sdio.c
index 524034699972..1e29e80cad61 100644
--- a/drivers/net/wireless/marvell/libertas/if_sdio.c
+++ b/drivers/net/wireless/marvell/libertas/if_sdio.c
@@ -1181,7 +1181,8 @@ static int if_sdio_probe(struct sdio_func *func,
 	spin_lock_init(&card->lock);
 	INIT_LIST_HEAD(&card->packets);
 
-	card->workqueue = alloc_workqueue("libertas_sdio", WQ_MEM_RECLAIM, 0);
+	card->workqueue = alloc_workqueue("libertas_sdio",
+					  WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (unlikely(!card->workqueue)) {
 		ret = -ENOMEM;
 		goto err_queue;
diff --git a/drivers/net/wireless/marvell/libertas/if_spi.c b/drivers/net/wireless/marvell/libertas/if_spi.c
index b722a6587fd3..699bae8971f8 100644
--- a/drivers/net/wireless/marvell/libertas/if_spi.c
+++ b/drivers/net/wireless/marvell/libertas/if_spi.c
@@ -1153,7 +1153,8 @@ static int if_spi_probe(struct spi_device *spi)
 	priv->fw_ready = 1;
 
 	/* Initialize interrupt handling stuff. */
-	card->workqueue = alloc_workqueue("libertas_spi", WQ_MEM_RECLAIM, 0);
+	card->workqueue = alloc_workqueue("libertas_spi",
+					  WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!card->workqueue) {
 		err = -ENOMEM;
 		goto remove_card;
diff --git a/drivers/net/wireless/marvell/libertas_tf/main.c b/drivers/net/wireless/marvell/libertas_tf/main.c
index a57a11be57d8..1fc4b8c6e079 100644
--- a/drivers/net/wireless/marvell/libertas_tf/main.c
+++ b/drivers/net/wireless/marvell/libertas_tf/main.c
@@ -708,7 +708,7 @@ EXPORT_SYMBOL_GPL(lbtf_bcn_sent);
 static int __init lbtf_init_module(void)
 {
 	lbtf_deb_enter(LBTF_DEB_MAIN);
-	lbtf_wq = alloc_workqueue("libertastf", WQ_MEM_RECLAIM, 0);
+	lbtf_wq = alloc_workqueue("libertastf", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (lbtf_wq == NULL) {
 		printk(KERN_ERR "libertastf: couldn't create workqueue\n");
 		return -ENOMEM;
diff --git a/drivers/net/wireless/quantenna/qtnfmac/core.c b/drivers/net/wireless/quantenna/qtnfmac/core.c
index 825b05dd3271..38af6cdc2843 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/core.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/core.c
@@ -714,7 +714,8 @@ int qtnf_core_attach(struct qtnf_bus *bus)
 		goto error;
 	}
 
-	bus->hprio_workqueue = alloc_workqueue("QTNF_HPRI", WQ_HIGHPRI, 0);
+	bus->hprio_workqueue = alloc_workqueue("QTNF_HPRI",
+					       WQ_HIGHPRI | WQ_PERCPU, 0);
 	if (!bus->hprio_workqueue) {
 		pr_err("failed to alloc high prio workqueue\n");
 		ret = -ENOMEM;
diff --git a/drivers/net/wireless/realtek/rtlwifi/base.c b/drivers/net/wireless/realtek/rtlwifi/base.c
index 6189edc1d8d7..30d295f65602 100644
--- a/drivers/net/wireless/realtek/rtlwifi/base.c
+++ b/drivers/net/wireless/realtek/rtlwifi/base.c
@@ -445,7 +445,7 @@ static int _rtl_init_deferred_work(struct ieee80211_hw *hw)
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
 	struct workqueue_struct *wq;
 
-	wq = alloc_workqueue("%s", 0, 0, rtlpriv->cfg->name);
+	wq = alloc_workqueue("%s", WQ_PERCPU, 0, rtlpriv->cfg->name);
 	if (!wq)
 		return -ENOMEM;
 
diff --git a/drivers/net/wireless/realtek/rtw88/usb.c b/drivers/net/wireless/realtek/rtw88/usb.c
index c8092fa0d9f1..8338bfa0522e 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.c
+++ b/drivers/net/wireless/realtek/rtw88/usb.c
@@ -909,7 +909,8 @@ static int rtw_usb_init_rx(struct rtw_dev *rtwdev)
 	struct sk_buff *rx_skb;
 	int i;
 
-	rtwusb->rxwq = alloc_workqueue("rtw88_usb: rx wq", WQ_BH, 0);
+	rtwusb->rxwq = alloc_workqueue("rtw88_usb: rx wq", WQ_BH | WQ_PERCPU,
+				       0);
 	if (!rtwusb->rxwq) {
 		rtw_err(rtwdev, "failed to create RX work queue\n");
 		return -ENOMEM;
diff --git a/drivers/net/wireless/silabs/wfx/main.c b/drivers/net/wireless/silabs/wfx/main.c
index a61128debbad..dda36e41eed1 100644
--- a/drivers/net/wireless/silabs/wfx/main.c
+++ b/drivers/net/wireless/silabs/wfx/main.c
@@ -364,7 +364,7 @@ int wfx_probe(struct wfx_dev *wdev)
 	wdev->pdata.gpio_wakeup = NULL;
 	wdev->poll_irq = true;
 
-	wdev->bh_wq = alloc_workqueue("wfx_bh_wq", WQ_HIGHPRI, 0);
+	wdev->bh_wq = alloc_workqueue("wfx_bh_wq", WQ_HIGHPRI | WQ_PERCPU, 0);
 	if (!wdev->bh_wq)
 		return -ENOMEM;
 
diff --git a/drivers/net/wireless/st/cw1200/bh.c b/drivers/net/wireless/st/cw1200/bh.c
index 3b4ded2ac801..3f07f4e1deee 100644
--- a/drivers/net/wireless/st/cw1200/bh.c
+++ b/drivers/net/wireless/st/cw1200/bh.c
@@ -54,8 +54,8 @@ int cw1200_register_bh(struct cw1200_common *priv)
 	int err = 0;
 	/* Realtime workqueue */
 	priv->bh_workqueue = alloc_workqueue("cw1200_bh",
-				WQ_MEM_RECLAIM | WQ_HIGHPRI
-				| WQ_CPU_INTENSIVE, 1);
+				WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_CPU_INTENSIVE | WQ_PERCPU,
+				1);
 
 	if (!priv->bh_workqueue)
 		return -ENOMEM;
diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
index 6a7a26085fc7..2310493203d3 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
@@ -1085,7 +1085,8 @@ static void t7xx_dpmaif_bat_release_work(struct work_struct *work)
 int t7xx_dpmaif_bat_rel_wq_alloc(struct dpmaif_ctrl *dpmaif_ctrl)
 {
 	dpmaif_ctrl->bat_release_wq = alloc_workqueue("dpmaif_bat_release_work_queue",
-						      WQ_MEM_RECLAIM, 1);
+						      WQ_MEM_RECLAIM | WQ_PERCPU,
+						      1);
 	if (!dpmaif_ctrl->bat_release_wq)
 		return -ENOMEM;
 
diff --git a/drivers/net/wwan/wwan_hwsim.c b/drivers/net/wwan/wwan_hwsim.c
index b02befd1b6fb..733688cd4607 100644
--- a/drivers/net/wwan/wwan_hwsim.c
+++ b/drivers/net/wwan/wwan_hwsim.c
@@ -509,7 +509,7 @@ static int __init wwan_hwsim_init(void)
 	if (wwan_hwsim_devsnum < 0 || wwan_hwsim_devsnum > 128)
 		return -EINVAL;
 
-	wwan_wq = alloc_workqueue("wwan_wq", 0, 0);
+	wwan_wq = alloc_workqueue("wwan_wq", WQ_PERCPU, 0);
 	if (!wwan_wq)
 		return -ENOMEM;
 
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 26c459f0198d..4cfdb56ed930 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -3022,6 +3022,8 @@ static int __init nvme_tcp_init_module(void)
 
 	if (wq_unbound)
 		wq_flags |= WQ_UNBOUND;
+	else
+		wq_flags |= WQ_PERCPU;
 
 	nvme_tcp_wq = alloc_workqueue("nvme_tcp_wq", wq_flags, 0);
 	if (!nvme_tcp_wq)
diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 71f8d06998d6..9b0ea6b98a3d 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -1896,12 +1896,13 @@ static int __init nvmet_init(void)
 	if (!nvmet_bvec_cache)
 		return -ENOMEM;
 
-	zbd_wq = alloc_workqueue("nvmet-zbd-wq", WQ_MEM_RECLAIM, 0);
+	zbd_wq = alloc_workqueue("nvmet-zbd-wq", WQ_MEM_RECLAIM | WQ_PERCPU,
+				 0);
 	if (!zbd_wq)
 		goto out_destroy_bvec_cache;
 
 	buffered_io_wq = alloc_workqueue("nvmet-buffered-io-wq",
-			WQ_MEM_RECLAIM, 0);
+			WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!buffered_io_wq)
 		goto out_free_zbd_work_queue;
 
diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 7318b736d414..29462766773a 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -795,9 +795,9 @@ nvmet_fc_alloc_target_queue(struct nvmet_fc_tgt_assoc *assoc,
 	if (!queue)
 		return NULL;
 
-	queue->work_q = alloc_workqueue("ntfc%d.%d.%d", 0, 0,
-				assoc->tgtport->fc_target_port.port_num,
-				assoc->a_id, qid);
+	queue->work_q = alloc_workqueue("ntfc%d.%d.%d", WQ_PERCPU, 0,
+					assoc->tgtport->fc_target_port.port_num,
+					assoc->a_id, qid);
 	if (!queue->work_q)
 		goto out_free_queue;
 
diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index f2d0c920269b..cf9435c5fa6c 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -2233,7 +2233,7 @@ static int __init nvmet_tcp_init(void)
 	int ret;
 
 	nvmet_tcp_wq = alloc_workqueue("nvmet_tcp_wq",
-				WQ_MEM_RECLAIM | WQ_HIGHPRI, 0);
+				WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_PERCPU, 0);
 	if (!nvmet_tcp_wq)
 		return -ENOMEM;
 
diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 6643a88c7a0c..27de533f0571 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -686,7 +686,7 @@ static int pci_epf_mhi_dma_init(struct pci_epf_mhi *epf_mhi)
 		goto err_release_tx;
 	}
 
-	epf_mhi->dma_wq = alloc_workqueue("pci_epf_mhi_dma_wq", 0, 0);
+	epf_mhi->dma_wq = alloc_workqueue("pci_epf_mhi_dma_wq", WQ_PERCPU, 0);
 	if (!epf_mhi->dma_wq) {
 		ret = -ENOMEM;
 		goto err_release_rx;
diff --git a/drivers/pci/endpoint/functions/pci-epf-ntb.c b/drivers/pci/endpoint/functions/pci-epf-ntb.c
index e01a98e74d21..5e4ae7ef6f05 100644
--- a/drivers/pci/endpoint/functions/pci-epf-ntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-ntb.c
@@ -2124,8 +2124,9 @@ static int __init epf_ntb_init(void)
 {
 	int ret;
 
-	kpcintb_workqueue = alloc_workqueue("kpcintb", WQ_MEM_RECLAIM |
-					    WQ_HIGHPRI, 0);
+	kpcintb_workqueue = alloc_workqueue("kpcintb",
+					    WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_PERCPU,
+					    0);
 	ret = pci_epf_register_driver(&epf_ntb_driver);
 	if (ret) {
 		destroy_workqueue(kpcintb_workqueue);
diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 50eb4106369f..416d792c03b2 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -1036,7 +1036,8 @@ static int __init pci_epf_test_init(void)
 	int ret;
 
 	kpcitest_workqueue = alloc_workqueue("kpcitest",
-					     WQ_MEM_RECLAIM | WQ_HIGHPRI, 0);
+					     WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_PERCPU,
+					     0);
 	if (!kpcitest_workqueue) {
 		pr_err("Failed to allocate the kpcitest work queue\n");
 		return -ENOMEM;
diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
index 874cb097b093..7ef693f38c30 100644
--- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
@@ -1434,8 +1434,9 @@ static int __init epf_ntb_init(void)
 {
 	int ret;
 
-	kpcintb_workqueue = alloc_workqueue("kpcintb", WQ_MEM_RECLAIM |
-					    WQ_HIGHPRI, 0);
+	kpcintb_workqueue = alloc_workqueue("kpcintb",
+					    WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_PERCPU,
+					    0);
 	ret = pci_epf_register_driver(&epf_ntb_driver);
 	if (ret) {
 		destroy_workqueue(kpcintb_workqueue);
diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 573a41869c15..4fe2bb1b7768 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -844,7 +844,8 @@ static void pnv_php_init_irq(struct pnv_php_slot *php_slot, int irq)
 	int ret;
 
 	/* Allocate workqueue */
-	php_slot->wq = alloc_workqueue("pciehp-%s", 0, 0, php_slot->name);
+	php_slot->wq = alloc_workqueue("pciehp-%s", WQ_PERCPU, 0,
+				       php_slot->name);
 	if (!php_slot->wq) {
 		SLOT_WARN(php_slot, "Cannot alloc workqueue\n");
 		pnv_php_disable_irq(php_slot, true);
diff --git a/drivers/pci/hotplug/shpchp_core.c b/drivers/pci/hotplug/shpchp_core.c
index 0c341453afc6..56308515ecba 100644
--- a/drivers/pci/hotplug/shpchp_core.c
+++ b/drivers/pci/hotplug/shpchp_core.c
@@ -80,7 +80,8 @@ static int init_slots(struct controller *ctrl)
 		slot->device = ctrl->slot_device_offset + i;
 		slot->number = ctrl->first_slot + (ctrl->slot_num_inc * i);
 
-		slot->wq = alloc_workqueue("shpchp-%d", 0, 0, slot->number);
+		slot->wq = alloc_workqueue("shpchp-%d", WQ_PERCPU, 0,
+					   slot->number);
 		if (!slot->wq) {
 			retval = -ENOMEM;
 			goto error_slot;
diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
index 3b30cfe3466b..a9dcb0bbe90e 100644
--- a/drivers/platform/surface/surface_acpi_notify.c
+++ b/drivers/platform/surface/surface_acpi_notify.c
@@ -862,7 +862,7 @@ static int __init san_init(void)
 {
 	int ret;
 
-	san_wq = alloc_workqueue("san_wq", 0, 0);
+	san_wq = alloc_workqueue("san_wq", WQ_PERCPU, 0);
 	if (!san_wq)
 		return -ENOMEM;
 	ret = platform_driver_register(&surface_acpi_notify);
diff --git a/drivers/power/supply/ab8500_btemp.c b/drivers/power/supply/ab8500_btemp.c
index b00c84fbc33c..e5202a7b6209 100644
--- a/drivers/power/supply/ab8500_btemp.c
+++ b/drivers/power/supply/ab8500_btemp.c
@@ -667,7 +667,8 @@ static int ab8500_btemp_bind(struct device *dev, struct device *master,
 
 	/* Create a work queue for the btemp */
 	di->btemp_wq =
-		alloc_workqueue("ab8500_btemp_wq", WQ_MEM_RECLAIM, 0);
+		alloc_workqueue("ab8500_btemp_wq", WQ_MEM_RECLAIM | WQ_PERCPU,
+				0);
 	if (di->btemp_wq == NULL) {
 		dev_err(dev, "failed to create work queue\n");
 		return -ENOMEM;
diff --git a/drivers/power/supply/ipaq_micro_battery.c b/drivers/power/supply/ipaq_micro_battery.c
index 7e0568a5353f..ff8573a5ca6d 100644
--- a/drivers/power/supply/ipaq_micro_battery.c
+++ b/drivers/power/supply/ipaq_micro_battery.c
@@ -232,7 +232,8 @@ static int micro_batt_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mb->micro = dev_get_drvdata(pdev->dev.parent);
-	mb->wq = alloc_workqueue("ipaq-battery-wq", WQ_MEM_RECLAIM, 0);
+	mb->wq = alloc_workqueue("ipaq-battery-wq",
+				 WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!mb->wq)
 		return -ENOMEM;
 
diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index 9544b8ee0c96..8b7fbfbbe70e 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -2097,7 +2097,7 @@ int rio_init_mports(void)
 	 * TODO: Implement restart of discovery process for all or
 	 * individual discovering mports.
 	 */
-	rio_wq = alloc_workqueue("riodisc", 0, 0);
+	rio_wq = alloc_workqueue("riodisc", WQ_PERCPU, 0);
 	if (!rio_wq) {
 		pr_err("RIO: unable allocate rio_wq\n");
 		goto no_disc;
diff --git a/drivers/s390/char/tape_3590.c b/drivers/s390/char/tape_3590.c
index 0d484fe43d7e..aee11fece701 100644
--- a/drivers/s390/char/tape_3590.c
+++ b/drivers/s390/char/tape_3590.c
@@ -1670,7 +1670,7 @@ tape_3590_init(void)
 
 	DBF_EVENT(3, "3590 init\n");
 
-	tape_3590_wq = alloc_workqueue("tape_3590", 0, 0);
+	tape_3590_wq = alloc_workqueue("tape_3590", WQ_PERCPU, 0);
 	if (!tape_3590_wq)
 		return -ENOMEM;
 
diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
index 7d1b767d87fb..1a3ba0293716 100644
--- a/drivers/scsi/be2iscsi/be_main.c
+++ b/drivers/scsi/be2iscsi/be_main.c
@@ -5633,7 +5633,8 @@ static int beiscsi_dev_probe(struct pci_dev *pcidev,
 
 	phba->ctrl.mcc_alloc_index = phba->ctrl.mcc_free_index = 0;
 
-	phba->wq = alloc_workqueue("beiscsi_%02x_wq", WQ_MEM_RECLAIM, 1,
+	phba->wq = alloc_workqueue("beiscsi_%02x_wq",
+				   WQ_MEM_RECLAIM | WQ_PERCPU, 1,
 				   phba->shost->host_no);
 	if (!phba->wq) {
 		beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
diff --git a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
index de6574cccf58..3a9c429d1eb6 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
@@ -2695,7 +2695,7 @@ static int __init bnx2fc_mod_init(void)
 	if (rc)
 		goto detach_ft;
 
-	bnx2fc_wq = alloc_workqueue("bnx2fc", 0, 0);
+	bnx2fc_wq = alloc_workqueue("bnx2fc", WQ_PERCPU, 0);
 	if (!bnx2fc_wq) {
 		rc = -ENOMEM;
 		goto release_bt;
diff --git a/drivers/scsi/device_handler/scsi_dh_alua.c b/drivers/scsi/device_handler/scsi_dh_alua.c
index 1bf5948d1188..6fd89ae33059 100644
--- a/drivers/scsi/device_handler/scsi_dh_alua.c
+++ b/drivers/scsi/device_handler/scsi_dh_alua.c
@@ -1300,7 +1300,7 @@ static int __init alua_init(void)
 {
 	int r;
 
-	kaluad_wq = alloc_workqueue("kaluad", WQ_MEM_RECLAIM, 0);
+	kaluad_wq = alloc_workqueue("kaluad", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!kaluad_wq)
 		return -ENOMEM;
 
diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
index b911fdb387f3..0f749ae781d6 100644
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -2458,7 +2458,7 @@ static int __init fcoe_init(void)
 	unsigned int cpu;
 	int rc = 0;
 
-	fcoe_wq = alloc_workqueue("fcoe", 0, 0);
+	fcoe_wq = alloc_workqueue("fcoe", WQ_PERCPU, 0);
 	if (!fcoe_wq)
 		return -ENOMEM;
 
diff --git a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
index 9e42230e42b8..cde265752e0d 100644
--- a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
+++ b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
@@ -3533,7 +3533,8 @@ static int ibmvscsis_probe(struct vio_dev *vdev,
 	init_completion(&vscsi->wait_idle);
 	init_completion(&vscsi->unconfig);
 
-	vscsi->work_q = alloc_workqueue("ibmvscsis%s", WQ_MEM_RECLAIM, 1,
+	vscsi->work_q = alloc_workqueue("ibmvscsis%s",
+					WQ_MEM_RECLAIM | WQ_PERCPU, 1,
 					dev_name(&vdev->dev));
 	if (!vscsi->work_q) {
 		rc = -ENOMEM;
diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 90021653e59e..becd7f081e5f 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -7938,7 +7938,7 @@ lpfc_sli4_driver_resource_setup(struct lpfc_hba *phba)
 	/* Allocate all driver workqueues here */
 
 	/* The lpfc_wq workqueue for deferred irq use */
-	phba->wq = alloc_workqueue("lpfc_wq", WQ_MEM_RECLAIM, 0);
+	phba->wq = alloc_workqueue("lpfc_wq", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!phba->wq)
 		return -ENOMEM;
 
diff --git a/drivers/scsi/pm8001/pm8001_init.c b/drivers/scsi/pm8001/pm8001_init.c
index 599410bcdfea..9f00fc10dbaf 100644
--- a/drivers/scsi/pm8001/pm8001_init.c
+++ b/drivers/scsi/pm8001/pm8001_init.c
@@ -1533,7 +1533,7 @@ static int __init pm8001_init(void)
 	if (pm8001_use_tasklet && !pm8001_use_msix)
 		pm8001_use_tasklet = false;
 
-	pm8001_wq = alloc_workqueue("pm80xx", 0, 0);
+	pm8001_wq = alloc_workqueue("pm80xx", WQ_PERCPU, 0);
 	if (!pm8001_wq)
 		goto err;
 
diff --git a/drivers/scsi/qedf/qedf_main.c b/drivers/scsi/qedf/qedf_main.c
index 436bd29d5eba..df016beaa789 100644
--- a/drivers/scsi/qedf/qedf_main.c
+++ b/drivers/scsi/qedf/qedf_main.c
@@ -3374,7 +3374,8 @@ static int __qedf_probe(struct pci_dev *pdev, int mode)
 	QEDF_INFO(&(qedf->dbg_ctx), QEDF_LOG_INFO, "qedf->io_mempool=%p.\n",
 	    qedf->io_mempool);
 
-	qedf->link_update_wq = alloc_workqueue("qedf_%u_link", WQ_MEM_RECLAIM,
+	qedf->link_update_wq = alloc_workqueue("qedf_%u_link",
+					       WQ_MEM_RECLAIM | WQ_PERCPU,
 					       1, qedf->lport->host->host_no);
 	INIT_DELAYED_WORK(&qedf->link_update, qedf_handle_link_update);
 	INIT_DELAYED_WORK(&qedf->link_recovery, qedf_link_recovery);
@@ -3585,7 +3586,8 @@ static int __qedf_probe(struct pci_dev *pdev, int mode)
 	ether_addr_copy(params.ll2_mac_address, qedf->mac);
 
 	/* Start LL2 processing thread */
-	qedf->ll2_recv_wq = alloc_workqueue("qedf_%d_ll2", WQ_MEM_RECLAIM, 1,
+	qedf->ll2_recv_wq = alloc_workqueue("qedf_%d_ll2",
+					    WQ_MEM_RECLAIM | WQ_PERCPU, 1,
 					    host->host_no);
 	if (!qedf->ll2_recv_wq) {
 		QEDF_ERR(&(qedf->dbg_ctx), "Failed to LL2 workqueue.\n");
@@ -3628,7 +3630,8 @@ static int __qedf_probe(struct pci_dev *pdev, int mode)
 	}
 
 	qedf->timer_work_queue = alloc_workqueue("qedf_%u_timer",
-				WQ_MEM_RECLAIM, 1, qedf->lport->host->host_no);
+				WQ_MEM_RECLAIM | WQ_PERCPU, 1,
+				qedf->lport->host->host_no);
 	if (!qedf->timer_work_queue) {
 		QEDF_ERR(&(qedf->dbg_ctx), "Failed to start timer "
 			  "workqueue.\n");
@@ -3641,7 +3644,8 @@ static int __qedf_probe(struct pci_dev *pdev, int mode)
 		sprintf(host_buf, "qedf_%u_dpc",
 		    qedf->lport->host->host_no);
 		qedf->dpc_wq =
-			alloc_workqueue("%s", WQ_MEM_RECLAIM, 1, host_buf);
+			alloc_workqueue("%s", WQ_MEM_RECLAIM | WQ_PERCPU, 1,
+					host_buf);
 	}
 	INIT_DELAYED_WORK(&qedf->recovery_work, qedf_recovery_handler);
 
@@ -4177,7 +4181,8 @@ static int __init qedf_init(void)
 		goto err3;
 	}
 
-	qedf_io_wq = alloc_workqueue("%s", WQ_MEM_RECLAIM, 1, "qedf_io_wq");
+	qedf_io_wq = alloc_workqueue("%s", WQ_MEM_RECLAIM | WQ_PERCPU, 1,
+				     "qedf_io_wq");
 	if (!qedf_io_wq) {
 		QEDF_ERR(NULL, "Could not create qedf_io_wq.\n");
 		goto err4;
diff --git a/drivers/scsi/qedi/qedi_main.c b/drivers/scsi/qedi/qedi_main.c
index e87885cc701c..4cccb62639e0 100644
--- a/drivers/scsi/qedi/qedi_main.c
+++ b/drivers/scsi/qedi/qedi_main.c
@@ -2776,7 +2776,7 @@ static int __qedi_probe(struct pci_dev *pdev, int mode)
 		}
 
 		qedi->offload_thread = alloc_workqueue("qedi_ofld%d",
-						       WQ_MEM_RECLAIM,
+						       WQ_MEM_RECLAIM | WQ_PERCPU,
 						       1, qedi->shost->host_no);
 		if (!qedi->offload_thread) {
 			QEDI_ERR(&qedi->dbg_ctx,
diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index 87eeb8607b60..cecbeb16f54e 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -3409,7 +3409,7 @@ qla2x00_probe_one(struct pci_dev *pdev, const struct pci_device_id *id)
 	    "req->req_q_in=%p req->req_q_out=%p rsp->rsp_q_in=%p rsp->rsp_q_out=%p.\n",
 	    req->req_q_in, req->req_q_out, rsp->rsp_q_in, rsp->rsp_q_out);
 
-	ha->wq = alloc_workqueue("qla2xxx_wq", WQ_MEM_RECLAIM, 0);
+	ha->wq = alloc_workqueue("qla2xxx_wq", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (unlikely(!ha->wq)) {
 		ret = -ENOMEM;
 		goto probe_failed;
diff --git a/drivers/scsi/qla2xxx/qla_target.c b/drivers/scsi/qla2xxx/qla_target.c
index 11eadb3bd36e..5ebe89d548a8 100644
--- a/drivers/scsi/qla2xxx/qla_target.c
+++ b/drivers/scsi/qla2xxx/qla_target.c
@@ -7300,7 +7300,7 @@ int __init qlt_init(void)
 		goto out_plogi_cachep;
 	}
 
-	qla_tgt_wq = alloc_workqueue("qla_tgt_wq", 0, 0);
+	qla_tgt_wq = alloc_workqueue("qla_tgt_wq", WQ_PERCPU, 0);
 	if (!qla_tgt_wq) {
 		ql_log(ql_log_fatal, NULL, 0xe06f,
 		    "alloc_workqueue for qla_tgt_wq failed\n");
diff --git a/drivers/scsi/qla2xxx/tcm_qla2xxx.c b/drivers/scsi/qla2xxx/tcm_qla2xxx.c
index ceaf1c7b1d17..79374bf5548d 100644
--- a/drivers/scsi/qla2xxx/tcm_qla2xxx.c
+++ b/drivers/scsi/qla2xxx/tcm_qla2xxx.c
@@ -1884,7 +1884,7 @@ static int tcm_qla2xxx_register_configfs(void)
 		goto out_fabric;
 
 	tcm_qla2xxx_free_wq = alloc_workqueue("tcm_qla2xxx_free",
-						WQ_MEM_RECLAIM, 0);
+						WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!tcm_qla2xxx_free_wq) {
 		ret = -ENOMEM;
 		goto out_fabric_npiv;
diff --git a/drivers/scsi/qla4xxx/ql4_os.c b/drivers/scsi/qla4xxx/ql4_os.c
index d540d66e6ffc..7ab3b27c8793 100644
--- a/drivers/scsi/qla4xxx/ql4_os.c
+++ b/drivers/scsi/qla4xxx/ql4_os.c
@@ -8815,7 +8815,8 @@ static int qla4xxx_probe_adapter(struct pci_dev *pdev,
 	}
 	INIT_WORK(&ha->dpc_work, qla4xxx_do_dpc);
 
-	ha->task_wq = alloc_workqueue("qla4xxx_%lu_task", WQ_MEM_RECLAIM, 1,
+	ha->task_wq = alloc_workqueue("qla4xxx_%lu_task",
+				      WQ_MEM_RECLAIM | WQ_PERCPU, 1,
 				      ha->host_no);
 	if (!ha->task_wq) {
 		ql4_printk(KERN_WARNING, ha, "Unable to start task thread!\n");
diff --git a/drivers/scsi/scsi_transport_fc.c b/drivers/scsi/scsi_transport_fc.c
index 082f76e76721..e750682893b6 100644
--- a/drivers/scsi/scsi_transport_fc.c
+++ b/drivers/scsi/scsi_transport_fc.c
@@ -441,13 +441,14 @@ static int fc_host_setup(struct transport_container *tc, struct device *dev,
 	fc_host->next_vport_number = 0;
 	fc_host->npiv_vports_inuse = 0;
 
-	fc_host->work_q = alloc_workqueue("fc_wq_%d", 0, 0, shost->host_no);
+	fc_host->work_q = alloc_workqueue("fc_wq_%d", WQ_PERCPU, 0,
+					  shost->host_no);
 	if (!fc_host->work_q)
 		return -ENOMEM;
 
 	fc_host->dev_loss_tmo = fc_dev_loss_tmo;
-	fc_host->devloss_work_q = alloc_workqueue("fc_dl_%d", 0, 0,
-					shost->host_no);
+	fc_host->devloss_work_q = alloc_workqueue("fc_dl_%d", WQ_PERCPU, 0,
+						  shost->host_no);
 	if (!fc_host->devloss_work_q) {
 		destroy_workqueue(fc_host->work_q);
 		fc_host->work_q = NULL;
diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 4dc8aba33d9b..a4890542b933 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1073,7 +1073,7 @@ EXPORT_SYMBOL(qman_portal_set_iperiod);
 
 int qman_wq_alloc(void)
 {
-	qm_portal_wq = alloc_workqueue("qman_portal_wq", 0, 1);
+	qm_portal_wq = alloc_workqueue("qman_portal_wq", WQ_PERCPU, 1);
 	if (!qm_portal_wq)
 		return -ENOMEM;
 	return 0;
diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdio.c
index 5326ea372b24..12c36a5e1d8c 100644
--- a/drivers/staging/greybus/sdio.c
+++ b/drivers/staging/greybus/sdio.c
@@ -806,7 +806,7 @@ static int gb_sdio_probe(struct gbphy_device *gbphy_dev,
 
 	mutex_init(&host->lock);
 	spin_lock_init(&host->xfer);
-	host->mrq_workqueue = alloc_workqueue("mmc-%s", 0, 1,
+	host->mrq_workqueue = alloc_workqueue("mmc-%s", WQ_PERCPU, 1,
 					      dev_name(&gbphy_dev->dev));
 	if (!host->mrq_workqueue) {
 		ret = -ENOMEM;
diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index 05d29201b730..cb0758a19973 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -126,12 +126,12 @@ int init_se_kmem_caches(void)
 	}
 
 	target_completion_wq = alloc_workqueue("target_completion",
-					       WQ_MEM_RECLAIM, 0);
+					       WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!target_completion_wq)
 		goto out_free_lba_map_mem_cache;
 
 	target_submission_wq = alloc_workqueue("target_submission",
-					       WQ_MEM_RECLAIM, 0);
+					       WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!target_submission_wq)
 		goto out_free_completion_wq;
 
diff --git a/drivers/target/target_core_xcopy.c b/drivers/target/target_core_xcopy.c
index 877ce58c0a70..93534a6e14b7 100644
--- a/drivers/target/target_core_xcopy.c
+++ b/drivers/target/target_core_xcopy.c
@@ -462,7 +462,7 @@ static const struct target_core_fabric_ops xcopy_pt_tfo = {
 
 int target_xcopy_setup_pt(void)
 {
-	xcopy_wq = alloc_workqueue("xcopy_wq", WQ_MEM_RECLAIM, 0);
+	xcopy_wq = alloc_workqueue("xcopy_wq", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!xcopy_wq) {
 		pr_err("Unable to allocate xcopy_wq\n");
 		return -ENOMEM;
diff --git a/drivers/target/tcm_fc/tfc_conf.c b/drivers/target/tcm_fc/tfc_conf.c
index 639fc358ed0f..f686d95d3273 100644
--- a/drivers/target/tcm_fc/tfc_conf.c
+++ b/drivers/target/tcm_fc/tfc_conf.c
@@ -250,7 +250,7 @@ static struct se_portal_group *ft_add_tpg(struct se_wwn *wwn, const char *name)
 	tpg->lport_wwn = ft_wwn;
 	INIT_LIST_HEAD(&tpg->lun_list);
 
-	wq = alloc_workqueue("tcm_fc", 0, 1);
+	wq = alloc_workqueue("tcm_fc", WQ_PERCPU, 1);
 	if (!wq) {
 		kfree(tpg);
 		return NULL;
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 0e1dd6ef60a7..c06357d31ce7 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -6038,7 +6038,7 @@ int usb_hub_init(void)
 	 * device was gone before the EHCI controller had handed its port
 	 * over to the companion full-speed controller.
 	 */
-	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE, 0);
+	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE | WQ_PERCPU, 0);
 	if (hub_wq)
 		return 0;
 
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 740311c4fa24..637ee8de8c00 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1254,8 +1254,7 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 
 	INIT_WORK(&hidg->work, get_report_workqueue_handler);
 	hidg->workqueue = alloc_workqueue("report_work",
-					  WQ_FREEZABLE |
-					  WQ_MEM_RECLAIM,
+					  WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
 					  1);
 
 	if (!hidg->workqueue) {
diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 4ed0dc19afe0..0657f5f7a51f 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -1265,7 +1265,7 @@ static int __init uas_init(void)
 {
 	int rv;
 
-	workqueue = alloc_workqueue("uas", WQ_MEM_RECLAIM, 0);
+	workqueue = alloc_workqueue("uas", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!workqueue)
 		return -ENOMEM;
 
diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index 0ae0a5ee3fae..2e8ae1d2faf9 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1516,8 +1516,7 @@ static int anx7411_i2c_probe(struct i2c_client *client)
 
 	INIT_WORK(&plat->work, anx7411_work_func);
 	plat->workqueue = alloc_workqueue("anx7411_work",
-					  WQ_FREEZABLE |
-					  WQ_MEM_RECLAIM,
+					  WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
 					  1);
 	if (!plat->workqueue) {
 		dev_err(dev, "fail to create work queue\n");
diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index 6a9a37351310..958a1454de2c 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -2172,7 +2172,8 @@ static int vduse_init(void)
 	if (!vduse_irq_wq)
 		goto err_wq;
 
-	vduse_irq_bound_wq = alloc_workqueue("vduse-irq-bound", WQ_HIGHPRI, 0);
+	vduse_irq_bound_wq = alloc_workqueue("vduse-irq-bound",
+					     WQ_HIGHPRI | WQ_PERCPU, 0);
 	if (!vduse_irq_bound_wq)
 		goto err_bound_wq;
 
diff --git a/drivers/virt/acrn/irqfd.c b/drivers/virt/acrn/irqfd.c
index b7da24ca1475..7dfc2b3d39cb 100644
--- a/drivers/virt/acrn/irqfd.c
+++ b/drivers/virt/acrn/irqfd.c
@@ -208,7 +208,8 @@ int acrn_irqfd_init(struct acrn_vm *vm)
 {
 	INIT_LIST_HEAD(&vm->irqfds);
 	mutex_init(&vm->irqfds_lock);
-	vm->irqfd_wq = alloc_workqueue("acrn_irqfd-%u", 0, 0, vm->vmid);
+	vm->irqfd_wq = alloc_workqueue("acrn_irqfd-%u", WQ_PERCPU, 0,
+				       vm->vmid);
 	if (!vm->irqfd_wq)
 		return -ENOMEM;
 
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 89da052f4f68..d26fd2d910ac 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -987,7 +987,8 @@ static int virtballoon_probe(struct virtio_device *vdev)
 			goto out_del_vqs;
 		}
 		vb->balloon_wq = alloc_workqueue("balloon-wq",
-					WQ_FREEZABLE | WQ_CPU_INTENSIVE, 0);
+					WQ_FREEZABLE | WQ_CPU_INTENSIVE | WQ_PERCPU,
+					0);
 		if (!vb->balloon_wq) {
 			err = -ENOMEM;
 			goto out_del_vqs;
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 13a10f3294a8..db29356cb92e 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -1093,7 +1093,8 @@ static long privcmd_ioctl_irqfd(struct file *file, void __user *udata)
 
 static int privcmd_irqfd_init(void)
 {
-	irqfd_cleanup_wq = alloc_workqueue("privcmd-irqfd-cleanup", 0, 0);
+	irqfd_cleanup_wq = alloc_workqueue("privcmd-irqfd-cleanup", WQ_PERCPU,
+					   0);
 	if (!irqfd_cleanup_wq)
 		return -ENOMEM;
 
diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 90258f228ea5..904f33655cff 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -409,7 +409,7 @@ enum wq_flags {
 	__WQ_LEGACY		= 1 << 18, /* internal: create*_workqueue() */
 
 	/* BH wq only allows the following flags */
-	__WQ_BH_ALLOWS		= WQ_BH | WQ_HIGHPRI,
+	__WQ_BH_ALLOWS		= WQ_BH | WQ_HIGHPRI | WQ_PERCPU,
 };
 
 enum wq_consts {
@@ -568,7 +568,7 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
 	alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
 
 #define create_workqueue(name)						\
-	alloc_workqueue("%s", __WQ_LEGACY | WQ_MEM_RECLAIM, 1, (name))
+	alloc_workqueue("%s", __WQ_LEGACY | WQ_MEM_RECLAIM | WQ_PERCPU, 1, (name))
 #define create_freezable_workqueue(name)				\
 	alloc_workqueue("%s", __WQ_LEGACY | WQ_FREEZABLE | WQ_UNBOUND |	\
 			WQ_MEM_RECLAIM, 1, (name))
diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c
index b8699ec4d766..f3da9400c178 100644
--- a/kernel/bpf/cgroup.c
+++ b/kernel/bpf/cgroup.c
@@ -34,7 +34,8 @@ static struct workqueue_struct *cgroup_bpf_destroy_wq;
 
 static int __init cgroup_bpf_wq_init(void)
 {
-	cgroup_bpf_destroy_wq = alloc_workqueue("cgroup_bpf_destroy", 0, 1);
+	cgroup_bpf_destroy_wq = alloc_workqueue("cgroup_bpf_destroy",
+						WQ_PERCPU, 1);
 	if (!cgroup_bpf_destroy_wq)
 		panic("Failed to alloc workqueue for cgroup bpf destroy.\n");
 	return 0;
diff --git a/kernel/cgroup/cgroup-v1.c b/kernel/cgroup/cgroup-v1.c
index fa24c032ed6f..779d586e191c 100644
--- a/kernel/cgroup/cgroup-v1.c
+++ b/kernel/cgroup/cgroup-v1.c
@@ -1321,7 +1321,7 @@ static int __init cgroup1_wq_init(void)
 	 * Cap @max_active to 1 too.
 	 */
 	cgroup_pidlist_destroy_wq = alloc_workqueue("cgroup_pidlist_destroy",
-						    0, 1);
+						    WQ_PERCPU, 1);
 	BUG_ON(!cgroup_pidlist_destroy_wq);
 	return 0;
 }
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 1e39355194fd..54a66cf0cef9 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -6281,7 +6281,7 @@ static int __init cgroup_wq_init(void)
 	 * We would prefer to do this in cgroup_init() above, but that
 	 * is called before init_workqueues(): so leave this until after.
 	 */
-	cgroup_destroy_wq = alloc_workqueue("cgroup_destroy", 0, 1);
+	cgroup_destroy_wq = alloc_workqueue("cgroup_destroy", WQ_PERCPU, 1);
 	BUG_ON(!cgroup_destroy_wq);
 	return 0;
 }
diff --git a/kernel/padata.c b/kernel/padata.c
index 76b39fc8b326..26cc9b748b3d 100644
--- a/kernel/padata.c
+++ b/kernel/padata.c
@@ -1030,8 +1030,9 @@ struct padata_instance *padata_alloc(const char *name)
 
 	cpus_read_lock();
 
-	pinst->serial_wq = alloc_workqueue("%s_serial", WQ_MEM_RECLAIM |
-					   WQ_CPU_INTENSIVE, 1, name);
+	pinst->serial_wq = alloc_workqueue("%s_serial",
+					   WQ_MEM_RECLAIM | WQ_CPU_INTENSIVE | WQ_PERCPU,
+					   1, name);
 	if (!pinst->serial_wq)
 		goto err_put_cpus;
 
diff --git a/kernel/power/main.c b/kernel/power/main.c
index 6254814d4817..eb55ef540032 100644
--- a/kernel/power/main.c
+++ b/kernel/power/main.c
@@ -1012,7 +1012,7 @@ EXPORT_SYMBOL_GPL(pm_wq);
 
 static int __init pm_start_workqueue(void)
 {
-	pm_wq = alloc_workqueue("pm", WQ_FREEZABLE, 0);
+	pm_wq = alloc_workqueue("pm", WQ_FREEZABLE | WQ_PERCPU, 0);
 
 	return pm_wq ? 0 : -ENOMEM;
 }
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 659f83e71048..e763c3d1e851 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -4829,10 +4829,10 @@ void __init rcu_init(void)
 	rcutree_online_cpu(cpu);
 
 	/* Create workqueue for Tree SRCU and for expedited GPs. */
-	rcu_gp_wq = alloc_workqueue("rcu_gp", WQ_MEM_RECLAIM, 0);
+	rcu_gp_wq = alloc_workqueue("rcu_gp", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	WARN_ON(!rcu_gp_wq);
 
-	sync_wq = alloc_workqueue("sync_wq", WQ_MEM_RECLAIM, 0);
+	sync_wq = alloc_workqueue("sync_wq", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	WARN_ON(!sync_wq);
 
 	/* Fill in default value for rcutree.qovld boot parameter. */
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 89839eebb359..c2593868c5f1 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5675,8 +5675,26 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 	}
 
 	/* see the comment above the definition of WQ_POWER_EFFICIENT */
-	if ((flags & WQ_POWER_EFFICIENT) && wq_power_efficient)
-		flags |= WQ_UNBOUND;
+	if (flags & WQ_POWER_EFFICIENT) {
+		if (wq_power_efficient)
+			flags |= WQ_UNBOUND;
+		else
+			flags |= WQ_PERCPU;
+	}
+
+	/* one among WQ_UNBOUND and WQ_PERCPU should always be present */
+	if ((flags & WQ_UNBOUND) && (flags & WQ_PERCPU)) {
+		pr_warn_once("WQ_UNBOUND is the complement of the new WQ_PERCPU, "
+		"only one of them should be present. Fall back to the old behavior, removing WQ_UNBOUND.\n");
+
+		flags &= (~WQ_UNBOUND);
+	}
+
+	if (!(flags & WQ_PERCPU) && !(flags & WQ_UNBOUND)) {
+		pr_warn_once("One between WQ_PERCPU and WQ_UNBOUND should be present. WQ_PERCPU will be added to keep the old behavior.\n");
+
+		flags |= WQ_PERCPU;
+	}
 
 	/* allocate wq and format name */
 	if (flags & WQ_UNBOUND)
@@ -7819,22 +7837,23 @@ void __init workqueue_init_early(void)
 		ordered_wq_attrs[i] = attrs;
 	}
 
-	system_wq = alloc_workqueue("events", 0, 0);
-	system_percpu_wq = alloc_workqueue("events", 0, 0);
-	system_highpri_wq = alloc_workqueue("events_highpri", WQ_HIGHPRI, 0);
-	system_long_wq = alloc_workqueue("events_long", 0, 0);
+	system_wq = alloc_workqueue("events", WQ_PERCPU, 0);
+	system_percpu_wq = alloc_workqueue("events", WQ_PERCPU, 0);
+	system_highpri_wq = alloc_workqueue("events_highpri",
+					    WQ_HIGHPRI | WQ_PERCPU, 0);
+	system_long_wq = alloc_workqueue("events_long", WQ_PERCPU, 0);
 	system_unbound_wq = alloc_workqueue("events_unbound", WQ_UNBOUND, WQ_MAX_ACTIVE);
 	system_dfl_wq = alloc_workqueue("events_unbound", WQ_UNBOUND, WQ_MAX_ACTIVE);
 	system_freezable_wq = alloc_workqueue("events_freezable",
-					      WQ_FREEZABLE, 0);
+					      WQ_FREEZABLE | WQ_PERCPU, 0);
 	system_power_efficient_wq = alloc_workqueue("events_power_efficient",
 					      WQ_POWER_EFFICIENT, 0);
 	system_freezable_power_efficient_wq = alloc_workqueue("events_freezable_pwr_efficient",
-					      WQ_FREEZABLE | WQ_POWER_EFFICIENT,
-					      0);
-	system_bh_wq = alloc_workqueue("events_bh", WQ_BH, 0);
+					      WQ_FREEZABLE | WQ_POWER_EFFICIENT, 0);
+	system_bh_wq = alloc_workqueue("events_bh", WQ_BH | WQ_PERCPU, 0);
 	system_bh_highpri_wq = alloc_workqueue("events_bh_highpri",
-					       WQ_BH | WQ_HIGHPRI, 0);
+					WQ_BH | WQ_HIGHPRI | WQ_PERCPU, 0);
+
 	BUG_ON(!system_wq || !system_percpu_wq || !system_highpri_wq || !system_long_wq ||
 	       !system_unbound_wq || !system_dfl_wq || !system_freezable_wq ||
 	       !system_power_efficient_wq ||
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 11e5d1e3f12e..4f0bdd67edb2 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -662,7 +662,7 @@ bool kvm_notify_irqfd_resampler(struct kvm *kvm,
  */
 int kvm_irqfd_init(void)
 {
-	irqfd_cleanup_wq = alloc_workqueue("kvm-irqfd-cleanup", 0, 0);
+	irqfd_cleanup_wq = alloc_workqueue("kvm-irqfd-cleanup", WQ_PERCPU, 0);
 	if (!irqfd_cleanup_wq)
 		return -ENOMEM;
 
-- 
2.49.0

