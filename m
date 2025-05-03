Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AA81B043F
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746260941; cv=none; b=Nus/7h3IPSX8qMCkcwmg+M5lxMdEJaPddBVvzKWuoMDhyzaJkcupGPzpAQovzPop2xNpiZFl8kERlrxQgosTak0pna3gjYq0xPLGC0uhjHUW79lhjKbXGlvFDtmeojlUnE+wqwCGEx2hx/hjKD1BYFM0/nr7D+owtHVCd1QyxME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746260941; c=relaxed/simple;
	bh=7Fft4PNXhaRZjK3Tb7U6o0sB1Hct6cvJQOk89yjx4Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sskUWPpwr4fRnE3ouCkE2P4CnLDY/LGK7t5KHJIfgNbQu+b+/3rcZMeg3ZVeygEptnazfGmObB4BPkJWv+CO8baz8+ytyd2+2+ilXiWaOoJV/Qmd1QKr2f6U7GtlCj18cuC8gLtHYZFVG6Mxq5eHeKdfr/fg5h4NIyLlo/vXZWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eodJjv0G; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eodJjv0G"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441ab63a415so26697375e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 01:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746260932; x=1746865732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFzpYUBrvTu6uKnYlqfGFXDiWfJWEWwBOtSA8Insa7U=;
        b=eodJjv0GWjMTjFhe4e9UEj5aNLPKvxHTUY6kxR8pxObNe58s7IoKDoJFUPvcnAR8s7
         SaaIKsQRTc2YSyUrzHu+NAPveFyPYChxjSCGm/iabq6COrmpSISSE/0W5xjLpihb9cu4
         sJWSjQKZXRQtPIWpyxhMmcJtgySDOM9Sr+lGHzX/7f6/vHsAp97E/trxCSzhGI4P8B1d
         iKdxGA1GzM4XSjkptHJp8h1zroKLN8+9XncWra0e7lrtCKTDeYyLpQnZ9mPK9sX1zOB8
         nImyaCtcIz1kHZDCgw85v5fmwTe+c9alSubwuSOVl4gLia4lPNenXuizw1KvvZ3b7f0q
         HKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746260932; x=1746865732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFzpYUBrvTu6uKnYlqfGFXDiWfJWEWwBOtSA8Insa7U=;
        b=YM14rIJhNcVaa1o8HJGP8gzhCKXiOAh4TpwaCpNAyjDwfO527IATe3aJfb5jsOaAvB
         69QXLnxysBA82SSd2cmYXDVVQLw9upPaGMdZcRSuJ1SDyRf0ZB6ByZih+4SRUrewACBf
         qbJ+vDsEjnD1WU2rz9QxhXQbkXITFHT+4uVWrnh2WP5NwBF1YKYuizjVxtPeYsaPVTlU
         /TEwAjdaIOcA+xcTPZvXeqB8sxeOxeNTFvbGrFnL0AMFvNFboa9hNRheRwLsf7Cbas4u
         QFCRVb4YRdtquYpz5fNuu0z3HvDOpqbgOKYxte6X/93jt4+FNH98fhuVowfwOqkSTXbe
         phJw==
X-Gm-Message-State: AOJu0Yw3vhMOm5OKeTz6TglaqPDVTVofOQfzuEDZXYjj5M7stQi5WUUc
	VvCMr2q+VIKtD0HT7yxFuEne+LfFrSECqBUXexsCChOgbJ09usuyCEl5hDclC/0g+rXECEl0rxK
	H
X-Gm-Gg: ASbGncsPTRAoZJzqoRkEp6a5Pc9PdpmbZTXPG4tfneYYHea2it4BzOhlkFUksjoDgKE
	wh4ygJD3Qo+RKOmCI7HJKeqYooQQb/o4mAsTfomb8tYKMUSjnaTQGuZJCOVY+6sL+lO8St+iIln
	3SDdTmWRZXsAwMRSbKAyYf4LiD2i7Tp+YbfQ9vhbmqhuyyurwISv4TvQK63dQEvY7B/d6jFRDeU
	CaXh+N3qKndH69h/pNWL+ZBCyMF7+UYRWmMCxHmmb/xmO0Gyu2fB53qzaAAqvaIDY/KWz7cEQVx
	XLp9zBtG7dixetkDLEhN6Uye6MasjTfxl6SxJsbAwTTcFhtC
X-Google-Smtp-Source: AGHT+IEIL7lU8cMsD2WvJFjDtUacCvla+Ng/PqGaxjkuOzvn6hCkdmgdVUzTQ6E/3WJpcjmeX7d/cw==
X-Received: by 2002:a05:600c:524a:b0:43d:412e:8a81 with SMTP id 5b1f17b1804b1-441c1d72c41mr11714765e9.28.1746260931176;
        Sat, 03 May 2025 01:28:51 -0700 (PDT)
Received: from linux.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc441sm68633445e9.3.2025.05.03.01.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 01:28:50 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: [PATCH 1/4] Workqueue: rename system_wq to system_percpu_wq
Date: Sat,  3 May 2025 10:28:31 +0200
Message-ID: <20250503082834.49413-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250503082834.49413-1-marco.crivellari@suse.com>
References: <20250503082834.49413-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

system_wq is a per-CPU worqueue, yet nothing in its name tells
about that CPU affinity constraint, which is very often not
required by users. Make it clear with an appropriate rename.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 arch/s390/kernel/diag/diag324.c               |  4 +--
 arch/s390/kernel/hiperdispatch.c              |  2 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c             |  2 +-
 drivers/accel/ivpu/ivpu_ipc.c                 |  2 +-
 drivers/accel/ivpu/ivpu_job.c                 |  2 +-
 drivers/accel/ivpu/ivpu_mmu.c                 |  2 +-
 drivers/accel/ivpu/ivpu_pm.c                  |  2 +-
 drivers/acpi/osl.c                            |  2 +-
 drivers/base/devcoredump.c                    |  2 +-
 drivers/block/nbd.c                           |  2 +-
 drivers/block/sunvdc.c                        |  2 +-
 drivers/cxl/pci.c                             |  2 +-
 drivers/extcon/extcon-intel-int3496.c         |  4 +--
 drivers/gpio/gpiolib-cdev.c                   |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  4 +--
 drivers/gpu/drm/bridge/ite-it6505.c           |  2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c            |  2 +-
 drivers/gpu/drm/drm_probe_helper.c            |  2 +-
 drivers/gpu/drm/drm_self_refresh_helper.c     |  2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  2 +-
 drivers/gpu/drm/i915/i915_driver.c            |  2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  2 +-
 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    |  4 +--
 drivers/gpu/drm/scheduler/sched_main.c        |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  4 +--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |  6 ++---
 drivers/gpu/drm/xe/xe_pt.c                    |  2 +-
 drivers/iio/adc/pac1934.c                     |  2 +-
 drivers/input/keyboard/gpio_keys.c            |  2 +-
 drivers/input/misc/palmas-pwrbutton.c         |  2 +-
 drivers/input/mouse/synaptics_i2c.c           |  8 +++---
 drivers/leds/trigger/ledtrig-input-events.c   |  2 +-
 drivers/md/bcache/super.c                     | 20 +++++++-------
 drivers/mmc/host/mtk-sd.c                     |  4 +--
 drivers/net/ethernet/sfc/efx_channels.c       |  2 +-
 drivers/net/ethernet/sfc/siena/efx_channels.c |  2 +-
 drivers/net/phy/sfp.c                         | 12 ++++-----
 drivers/net/wireless/intel/ipw2x00/ipw2100.c  |  6 ++---
 drivers/net/wireless/intel/ipw2x00/ipw2200.c  |  2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/tdls.c |  6 ++---
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/init.c  |  2 +-
 drivers/nvdimm/security.c                     |  4 +--
 drivers/nvme/target/admin-cmd.c               |  2 +-
 drivers/nvme/target/fabrics-cmd-auth.c        |  2 +-
 drivers/pci/endpoint/pci-ep-cfs.c             |  2 +-
 drivers/phy/allwinner/phy-sun4i-usb.c         | 14 +++++-----
 .../platform/cznic/turris-omnia-mcu-gpio.c    |  2 +-
 .../surface/aggregator/ssh_packet_layer.c     |  2 +-
 .../surface/aggregator/ssh_request_layer.c    |  2 +-
 drivers/platform/x86/gpd-pocket-fan.c         |  4 +--
 .../x86/x86-android-tablets/vexia_atla10_ec.c |  2 +-
 drivers/power/supply/bq2415x_charger.c        |  2 +-
 drivers/power/supply/bq24190_charger.c        |  2 +-
 drivers/power/supply/bq27xxx_battery.c        |  6 ++---
 drivers/power/supply/rk817_charger.c          |  6 ++---
 drivers/power/supply/ucs1002_power.c          |  2 +-
 drivers/power/supply/ug3105_battery.c         |  6 ++---
 drivers/ras/cec.c                             |  2 +-
 drivers/regulator/irq_helpers.c               |  2 +-
 drivers/regulator/qcom-labibb-regulator.c     |  4 +--
 drivers/thunderbolt/tb.c                      |  2 +-
 drivers/usb/dwc3/gadget.c                     |  2 +-
 drivers/usb/host/xhci-dbgcap.c                |  8 +++---
 drivers/usb/host/xhci-ring.c                  |  2 +-
 drivers/xen/events/events_base.c              |  6 ++---
 fs/aio.c                                      |  2 +-
 fs/fs-writeback.c                             |  2 +-
 fs/fuse/dev.c                                 |  2 +-
 fs/fuse/inode.c                               |  2 +-
 fs/nfs/namespace.c                            |  2 +-
 fs/nfs/nfs4renewd.c                           |  2 +-
 include/drm/gpu_scheduler.h                   |  2 +-
 include/linux/closure.h                       |  2 +-
 include/linux/workqueue.h                     | 26 +++++++++----------
 io_uring/io_uring.c                           |  2 +-
 kernel/bpf/cgroup.c                           |  2 +-
 kernel/bpf/cpumap.c                           |  2 +-
 kernel/cgroup/cgroup.c                        |  2 +-
 kernel/module/dups.c                          |  4 +--
 kernel/rcu/tasks.h                            |  4 +--
 kernel/smp.c                                  |  2 +-
 kernel/trace/trace_events_user.c              |  2 +-
 kernel/workqueue.c                            | 10 +++----
 mm/backing-dev.c                              |  2 +-
 net/bridge/br_cfm.c                           |  6 ++---
 net/bridge/br_mrp.c                           |  8 +++---
 net/ceph/mon_client.c                         |  2 +-
 net/core/skmsg.c                              |  2 +-
 net/devlink/core.c                            |  2 +-
 net/ipv4/inet_fragment.c                      |  2 +-
 net/netfilter/nf_conntrack_ecache.c           |  2 +-
 net/openvswitch/dp_notify.c                   |  2 +-
 net/rfkill/input.c                            |  2 +-
 net/smc/smc_core.c                            |  2 +-
 net/vmw_vsock/af_vsock.c                      |  2 +-
 rust/kernel/workqueue.rs                      |  6 ++---
 sound/soc/codecs/aw88081.c                    |  2 +-
 sound/soc/codecs/aw88166.c                    |  2 +-
 sound/soc/codecs/aw88261.c                    |  2 +-
 sound/soc/codecs/aw88395/aw88395.c            |  2 +-
 sound/soc/codecs/aw88399.c                    |  2 +-
 sound/soc/codecs/cs42l43-jack.c               |  6 ++---
 sound/soc/codecs/cs42l43.c                    |  4 +--
 sound/soc/codecs/es8326.c                     | 12 ++++-----
 sound/soc/codecs/rt5663.c                     |  6 ++---
 sound/soc/intel/boards/sof_es8336.c           |  2 +-
 sound/soc/sof/intel/cnl.c                     |  2 +-
 sound/soc/sof/intel/hda-ipc.c                 |  2 +-
 110 files changed, 195 insertions(+), 195 deletions(-)

diff --git a/arch/s390/kernel/diag/diag324.c b/arch/s390/kernel/diag/diag324.c
index 7fa4c0b7eb6c..f0a8b4841fb9 100644
--- a/arch/s390/kernel/diag/diag324.c
+++ b/arch/s390/kernel/diag/diag324.c
@@ -116,7 +116,7 @@ static void pibwork_handler(struct work_struct *work)
 	mutex_lock(&pibmutex);
 	timedout = ktime_add_ns(data->expire, PIBWORK_DELAY);
 	if (ktime_before(ktime_get(), timedout)) {
-		mod_delayed_work(system_wq, &pibwork, nsecs_to_jiffies(PIBWORK_DELAY));
+		mod_delayed_work(system_percpu_wq, &pibwork, nsecs_to_jiffies(PIBWORK_DELAY));
 		goto out;
 	}
 	vfree(data->pib);
@@ -174,7 +174,7 @@ long diag324_pibbuf(unsigned long arg)
 		pib_update(data);
 		data->sequence++;
 		data->expire = ktime_add_ns(ktime_get(), tod_to_ns(data->pib->intv));
-		mod_delayed_work(system_wq, &pibwork, nsecs_to_jiffies(PIBWORK_DELAY));
+		mod_delayed_work(system_percpu_wq, &pibwork, nsecs_to_jiffies(PIBWORK_DELAY));
 		first = false;
 	}
 	rc = data->rc;
diff --git a/arch/s390/kernel/hiperdispatch.c b/arch/s390/kernel/hiperdispatch.c
index e7b66d046e8d..85b5508ab62c 100644
--- a/arch/s390/kernel/hiperdispatch.c
+++ b/arch/s390/kernel/hiperdispatch.c
@@ -191,7 +191,7 @@ int hd_enable_hiperdispatch(void)
 		return 0;
 	if (hd_online_cores <= hd_entitled_cores)
 		return 0;
-	mod_delayed_work(system_wq, &hd_capacity_work, HD_DELAY_INTERVAL * hd_delay_factor);
+	mod_delayed_work(system_percpu_wq, &hd_capacity_work, HD_DELAY_INTERVAL * hd_delay_factor);
 	hd_update_capacities();
 	return 1;
 }
diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
index 56c56012b980..62f9dd7dceed 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.c
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
@@ -630,7 +630,7 @@ bool ivpu_hw_btrs_irq_handler_lnl(struct ivpu_device *vdev, int irq)
 
 	if (REG_TEST_FLD(VPU_HW_BTRS_LNL_INTERRUPT_STAT, SURV_ERR, status)) {
 		ivpu_dbg(vdev, IRQ, "Survivability IRQ\n");
-		queue_work(system_wq, &vdev->irq_dct_work);
+		queue_work(system_percpu_wq, &vdev->irq_dct_work);
 	}
 
 	if (REG_TEST_FLD(VPU_HW_BTRS_LNL_INTERRUPT_STAT, FREQ_CHANGE, status))
diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 0e096fd9b95d..247dbb64b4d5 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -459,7 +459,7 @@ void ivpu_ipc_irq_handler(struct ivpu_device *vdev)
 		}
 	}
 
-	queue_work(system_wq, &vdev->irq_ipc_work);
+	queue_work(system_percpu_wq, &vdev->irq_ipc_work);
 }
 
 void ivpu_ipc_irq_work_fn(struct work_struct *work)
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 004059e4f1e8..f63eba4c9d9f 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -549,7 +549,7 @@ static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32
 		 * status and ensure both are handled in the same way
 		 */
 		job->file_priv->has_mmu_faults = true;
-		queue_work(system_wq, &vdev->context_abort_work);
+		queue_work(system_percpu_wq, &vdev->context_abort_work);
 		return 0;
 	}
 
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 5ea010568faa..e1baf6b64935 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -970,7 +970,7 @@ void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
 		}
 	}
 
-	queue_work(system_wq, &vdev->context_abort_work);
+	queue_work(system_percpu_wq, &vdev->context_abort_work);
 }
 
 void ivpu_mmu_evtq_dump(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index b5891e91f7ab..0c1f639931ad 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -198,7 +198,7 @@ void ivpu_start_job_timeout_detection(struct ivpu_device *vdev)
 	unsigned long timeout_ms = ivpu_tdr_timeout_ms ? ivpu_tdr_timeout_ms : vdev->timeout.tdr;
 
 	/* No-op if already queued */
-	queue_delayed_work(system_wq, &vdev->pm->job_timeout_work, msecs_to_jiffies(timeout_ms));
+	queue_delayed_work(system_percpu_wq, &vdev->pm->job_timeout_work, msecs_to_jiffies(timeout_ms));
 }
 
 void ivpu_stop_job_timeout_detection(struct ivpu_device *vdev)
diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 5ff343096ece..a79a5d47bdb8 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -398,7 +398,7 @@ static void acpi_os_drop_map_ref(struct acpi_ioremap *map)
 	list_del_rcu(&map->list);
 
 	INIT_RCU_WORK(&map->track.rwork, acpi_os_map_remove);
-	queue_rcu_work(system_wq, &map->track.rwork);
+	queue_rcu_work(system_percpu_wq, &map->track.rwork);
 }
 
 /**
diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index 03a39c417dc4..8c4844ad7c6b 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -125,7 +125,7 @@ static ssize_t devcd_data_write(struct file *filp, struct kobject *kobj,
 	mutex_lock(&devcd->mutex);
 	if (!devcd->delete_work) {
 		devcd->delete_work = true;
-		mod_delayed_work(system_wq, &devcd->del_wk, 0);
+		mod_delayed_work(system_percpu_wq, &devcd->del_wk, 0);
 	}
 	mutex_unlock(&devcd->mutex);
 
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 7bdc7eb808ea..7738fce177fa 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -311,7 +311,7 @@ static void nbd_mark_nsock_dead(struct nbd_device *nbd, struct nbd_sock *nsock,
 		if (args) {
 			INIT_WORK(&args->work, nbd_dead_link_work);
 			args->index = nbd->index;
-			queue_work(system_wq, &args->work);
+			queue_work(system_percpu_wq, &args->work);
 		}
 	}
 	if (!nsock->dead) {
diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
index b5727dea15bd..442546b05df8 100644
--- a/drivers/block/sunvdc.c
+++ b/drivers/block/sunvdc.c
@@ -1187,7 +1187,7 @@ static void vdc_ldc_reset(struct vdc_port *port)
 	}
 
 	if (port->ldc_timeout)
-		mod_delayed_work(system_wq, &port->ldc_reset_timer_work,
+		mod_delayed_work(system_percpu_wq, &port->ldc_reset_timer_work,
 			  round_jiffies(jiffies + HZ * port->ldc_timeout));
 	mod_timer(&port->vio.timer, round_jiffies(jiffies + HZ));
 	return;
diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
index 7b14a154463c..c610551b41bf 100644
--- a/drivers/cxl/pci.c
+++ b/drivers/cxl/pci.c
@@ -136,7 +136,7 @@ static irqreturn_t cxl_pci_mbox_irq(int irq, void *id)
 	if (opcode == CXL_MBOX_OP_SANITIZE) {
 		mutex_lock(&cxl_mbox->mbox_mutex);
 		if (mds->security.sanitize_node)
-			mod_delayed_work(system_wq, &mds->security.poll_dwork, 0);
+			mod_delayed_work(system_percpu_wq, &mds->security.poll_dwork, 0);
 		mutex_unlock(&cxl_mbox->mbox_mutex);
 	} else {
 		/* short-circuit the wait in __cxl_pci_mbox_send_cmd() */
diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
index ded1a85a5549..7d16d5b7d58f 100644
--- a/drivers/extcon/extcon-intel-int3496.c
+++ b/drivers/extcon/extcon-intel-int3496.c
@@ -106,7 +106,7 @@ static irqreturn_t int3496_thread_isr(int irq, void *priv)
 	struct int3496_data *data = priv;
 
 	/* Let the pin settle before processing it */
-	mod_delayed_work(system_wq, &data->work, DEBOUNCE_TIME);
+	mod_delayed_work(system_percpu_wq, &data->work, DEBOUNCE_TIME);
 
 	return IRQ_HANDLED;
 }
@@ -181,7 +181,7 @@ static int int3496_probe(struct platform_device *pdev)
 	}
 
 	/* process id-pin so that we start with the right status */
-	queue_delayed_work(system_wq, &data->work, 0);
+	queue_delayed_work(system_percpu_wq, &data->work, 0);
 	flush_delayed_work(&data->work);
 
 	platform_set_drvdata(pdev, data);
diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 107d75558b5a..3e9c037ff4cd 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -700,7 +700,7 @@ static enum hte_return process_hw_ts(struct hte_ts_data *ts, void *p)
 	if (READ_ONCE(line->sw_debounced)) {
 		line->total_discard_seq++;
 		line->last_seqno = ts->seq;
-		mod_delayed_work(system_wq, &line->work,
+		mod_delayed_work(system_percpu_wq, &line->work,
 		  usecs_to_jiffies(READ_ONCE(line->desc->debounce_period_us)));
 	} else {
 		if (unlikely(ts->seq < line->line_seqno))
@@ -841,7 +841,7 @@ static irqreturn_t debounce_irq_handler(int irq, void *p)
 {
 	struct line *line = p;
 
-	mod_delayed_work(system_wq, &line->work,
+	mod_delayed_work(system_percpu_wq, &line->work,
 		usecs_to_jiffies(READ_ONCE(line->desc->debounce_period_us)));
 
 	return IRQ_HANDLED;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a30111d2c3ea..96c659389480 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4610,7 +4610,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		}
 		/* must succeed. */
 		amdgpu_ras_resume(adev);
-		queue_delayed_work(system_wq, &adev->delayed_init_work,
+		queue_delayed_work(system_percpu_wq, &adev->delayed_init_work,
 				   msecs_to_jiffies(AMDGPU_RESUME_MS));
 	}
 
@@ -5085,7 +5085,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 	if (r)
 		goto exit;
 
-	queue_delayed_work(system_wq, &adev->delayed_init_work,
+	queue_delayed_work(system_percpu_wq, &adev->delayed_init_work,
 			   msecs_to_jiffies(AMDGPU_RESUME_MS));
 exit:
 	if (amdgpu_sriov_vf(adev)) {
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 8a607558ac89..433e6620dad8 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2082,7 +2082,7 @@ static void it6505_start_hdcp(struct it6505 *it6505)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 	it6505_reset_hdcp(it6505);
-	queue_delayed_work(system_wq, &it6505->hdcp_work,
+	queue_delayed_work(system_percpu_wq, &it6505->hdcp_work,
 			   msecs_to_jiffies(2400));
 }
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 79ab5da827e1..d798c951ddcc 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -115,7 +115,7 @@ static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
 {
 	struct tfp410 *dvi = arg;
 
-	mod_delayed_work(system_wq, &dvi->hpd_work,
+	mod_delayed_work(system_percpu_wq, &dvi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 }
 
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 7ba16323e7c2..30e8d3467c83 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -625,7 +625,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		 */
 		dev->mode_config.delayed_event = true;
 		if (dev->mode_config.poll_enabled)
-			mod_delayed_work(system_wq,
+			mod_delayed_work(system_percpu_wq,
 					 &dev->mode_config.output_poll_work,
 					 0);
 	}
diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
index dd33fec5aabd..12f5af633da3 100644
--- a/drivers/gpu/drm/drm_self_refresh_helper.c
+++ b/drivers/gpu/drm/drm_self_refresh_helper.c
@@ -217,7 +217,7 @@ void drm_self_refresh_helper_alter_state(struct drm_atomic_state *state)
 			 ewma_psr_time_read(&sr_data->exit_avg_ms)) * 2;
 		mutex_unlock(&sr_data->avg_mutex);
 
-		mod_delayed_work(system_wq, &sr_data->entry_work,
+		mod_delayed_work(system_percpu_wq, &sr_data->entry_work,
 				 msecs_to_jiffies(delay));
 	}
 }
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 01813e11e6c6..8e76ac8ee4e2 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1692,7 +1692,7 @@ static irqreturn_t hdmi_irq_thread(int irq, void *arg)
 {
 	struct hdmi_context *hdata = arg;
 
-	mod_delayed_work(system_wq, &hdata->hotplug_work,
+	mod_delayed_work(system_percpu_wq, &hdata->hotplug_work,
 			msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
 	return IRQ_HANDLED;
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index ce3cc93ea211..79b98ba4104e 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -141,7 +141,7 @@ static int i915_workqueues_init(struct drm_i915_private *dev_priv)
 	/*
 	 * The unordered i915 workqueue should be used for all work
 	 * scheduling that do not require running in order, which used
-	 * to be scheduled on the system_wq before moving to a driver
+	 * to be scheduled on the system_percpu_wq before moving to a driver
 	 * instance due deprecation of flush_scheduled_work().
 	 */
 	dev_priv->unordered_wq = alloc_workqueue("i915-unordered", 0, 0);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index ffc346379cc2..b2c194b17eae 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -264,7 +264,7 @@ struct drm_i915_private {
 	 *
 	 * This workqueue should be used for all unordered work
 	 * scheduling within i915, which used to be scheduled on the
-	 * system_wq before moving to a driver instance due
+	 * system_percpu_wq before moving to a driver instance due
 	 * deprecation of flush_scheduled_work().
 	 */
 	struct workqueue_struct *unordered_wq;
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 3d1dddb34603..b115fe655a4b 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -274,7 +274,7 @@ static irqreturn_t dw_hdmi_qp_rk3576_irq(int irq, void *dev_id)
 
 	val = HIWORD_UPDATE(RK3576_HDMI_HPD_INT_CLR, RK3576_HDMI_HPD_INT_CLR);
 	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
-	mod_delayed_work(system_wq, &hdmi->hpd_work,
+	mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
 	val = HIWORD_UPDATE(0, RK3576_HDMI_HPD_INT_MSK);
@@ -321,7 +321,7 @@ static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
 				    RK3588_HDMI0_HPD_INT_CLR);
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 
-	mod_delayed_work(system_wq, &hdmi->hpd_work,
+	mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
 	if (hdmi->port_id)
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index bfea608a7106..d3c0a1ca0b2c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1260,7 +1260,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 	sched->name = args->name;
 	sched->timeout = args->timeout;
 	sched->hang_limit = args->hang_limit;
-	sched->timeout_wq = args->timeout_wq ? args->timeout_wq : system_wq;
+	sched->timeout_wq = args->timeout_wq ? args->timeout_wq : system_percpu_wq;
 	sched->score = args->score ? args->score : &sched->_score;
 	sched->dev = args->dev;
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index b5f60b2b2d0e..57518a4ab4e1 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -985,7 +985,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 				dev_err(dev->dev,
 					"%s(0x%08x): Sync lost flood detected, recovering",
 					__func__, stat);
-				queue_work(system_wq,
+				queue_work(system_percpu_wq,
 					   &tilcdc_crtc->recover_work);
 				tilcdc_write(dev, LCDC_INT_ENABLE_CLR_REG,
 					     LCDC_SYNC_LOST);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 37238a12baa5..4ee5f4d6371e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -744,7 +744,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 
 	vc4_hdmi->scdc_enabled = true;
 
-	queue_delayed_work(system_wq, &vc4_hdmi->scrambling_work,
+	queue_delayed_work(system_percpu_wq, &vc4_hdmi->scrambling_work,
 			   msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
 }
 
@@ -793,7 +793,7 @@ static void vc4_hdmi_scrambling_wq(struct work_struct *work)
 	drm_scdc_set_high_tmds_clock_ratio(connector, true);
 	drm_scdc_set_scrambling(connector, true);
 
-	queue_delayed_work(system_wq, &vc4_hdmi->scrambling_work,
+	queue_delayed_work(system_percpu_wq, &vc4_hdmi->scrambling_work,
 			   msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 03072e094991..2b27621a36e5 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -99,7 +99,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 		invalidation_fence_signal(xe, fence);
 	}
 	if (!list_empty(&gt->tlb_invalidation.pending_fences))
-		queue_delayed_work(system_wq,
+		queue_delayed_work(system_percpu_wq,
 				   &gt->tlb_invalidation.fence_tdr,
 				   tlb_timeout_jiffies(gt));
 	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
@@ -218,7 +218,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 				      &gt->tlb_invalidation.pending_fences);
 
 			if (list_is_singular(&gt->tlb_invalidation.pending_fences))
-				queue_delayed_work(system_wq,
+				queue_delayed_work(system_percpu_wq,
 						   &gt->tlb_invalidation.fence_tdr,
 						   tlb_timeout_jiffies(gt));
 		}
@@ -512,7 +512,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	}
 
 	if (!list_empty(&gt->tlb_invalidation.pending_fences))
-		mod_delayed_work(system_wq,
+		mod_delayed_work(system_percpu_wq,
 				 &gt->tlb_invalidation.fence_tdr,
 				 tlb_timeout_jiffies(gt));
 	else
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ffaf0d02dc7d..228e25e98be1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1474,7 +1474,7 @@ static void invalidation_fence_cb(struct dma_fence *fence,
 
 	trace_xe_gt_tlb_invalidation_fence_cb(xe, &ifence->base);
 	if (!ifence->fence->error) {
-		queue_work(system_wq, &ifence->work);
+		queue_work(system_percpu_wq, &ifence->work);
 	} else {
 		ifence->base.base.error = ifence->fence->error;
 		xe_gt_tlb_invalidation_fence_signal(&ifence->base);
diff --git a/drivers/iio/adc/pac1934.c b/drivers/iio/adc/pac1934.c
index 20802b7f49ea..77f4679aadbd 100644
--- a/drivers/iio/adc/pac1934.c
+++ b/drivers/iio/adc/pac1934.c
@@ -767,7 +767,7 @@ static int pac1934_retrieve_data(struct pac1934_chip_info *info,
 		 * Re-schedule the work for the read registers on timeout
 		 * (to prevent chip registers saturation)
 		 */
-		mod_delayed_work(system_wq, &info->work_chip_rfsh,
+		mod_delayed_work(system_percpu_wq, &info->work_chip_rfsh,
 				 msecs_to_jiffies(PAC1934_MAX_RFSH_LIMIT_MS));
 	}
 
diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 5c39a217b94c..815f58e70671 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -434,7 +434,7 @@ static irqreturn_t gpio_keys_gpio_isr(int irq, void *dev_id)
 			      ms_to_ktime(bdata->software_debounce),
 			      HRTIMER_MODE_REL);
 	} else {
-		mod_delayed_work(system_wq,
+		mod_delayed_work(system_percpu_wq,
 				 &bdata->work,
 				 msecs_to_jiffies(bdata->software_debounce));
 	}
diff --git a/drivers/input/misc/palmas-pwrbutton.c b/drivers/input/misc/palmas-pwrbutton.c
index 39fc451c56e9..2d471165334a 100644
--- a/drivers/input/misc/palmas-pwrbutton.c
+++ b/drivers/input/misc/palmas-pwrbutton.c
@@ -91,7 +91,7 @@ static irqreturn_t pwron_irq(int irq, void *palmas_pwron)
 	pm_wakeup_event(input_dev->dev.parent, 0);
 	input_sync(input_dev);
 
-	mod_delayed_work(system_wq, &pwron->input_work,
+	mod_delayed_work(system_percpu_wq, &pwron->input_work,
 			 msecs_to_jiffies(PALMAS_PWR_KEY_Q_TIME_MS));
 
 	return IRQ_HANDLED;
diff --git a/drivers/input/mouse/synaptics_i2c.c b/drivers/input/mouse/synaptics_i2c.c
index a0d707e47d93..d42c562c05e3 100644
--- a/drivers/input/mouse/synaptics_i2c.c
+++ b/drivers/input/mouse/synaptics_i2c.c
@@ -372,7 +372,7 @@ static irqreturn_t synaptics_i2c_irq(int irq, void *dev_id)
 {
 	struct synaptics_i2c *touch = dev_id;
 
-	mod_delayed_work(system_wq, &touch->dwork, 0);
+	mod_delayed_work(system_percpu_wq, &touch->dwork, 0);
 
 	return IRQ_HANDLED;
 }
@@ -448,7 +448,7 @@ static void synaptics_i2c_work_handler(struct work_struct *work)
 	 * We poll the device once in THREAD_IRQ_SLEEP_SECS and
 	 * if error is detected, we try to reset and reconfigure the touchpad.
 	 */
-	mod_delayed_work(system_wq, &touch->dwork, delay);
+	mod_delayed_work(system_percpu_wq, &touch->dwork, delay);
 }
 
 static int synaptics_i2c_open(struct input_dev *input)
@@ -461,7 +461,7 @@ static int synaptics_i2c_open(struct input_dev *input)
 		return ret;
 
 	if (polling_req)
-		mod_delayed_work(system_wq, &touch->dwork,
+		mod_delayed_work(system_percpu_wq, &touch->dwork,
 				msecs_to_jiffies(NO_DATA_SLEEP_MSECS));
 
 	return 0;
@@ -620,7 +620,7 @@ static int synaptics_i2c_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	mod_delayed_work(system_wq, &touch->dwork,
+	mod_delayed_work(system_percpu_wq, &touch->dwork,
 				msecs_to_jiffies(NO_DATA_SLEEP_MSECS));
 
 	return 0;
diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
index 1c79731562c2..3c6414259c27 100644
--- a/drivers/leds/trigger/ledtrig-input-events.c
+++ b/drivers/leds/trigger/ledtrig-input-events.c
@@ -66,7 +66,7 @@ static void input_events_event(struct input_handle *handle, unsigned int type,
 
 	spin_unlock_irqrestore(&data->lock, flags);
 
-	mod_delayed_work(system_wq, &data->work, led_off_delay);
+	mod_delayed_work(system_percpu_wq, &data->work, led_off_delay);
 }
 
 static int input_events_connect(struct input_handler *handler, struct input_dev *dev,
diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index e42f1400cea9..de0a8e5f5c49 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -1388,7 +1388,7 @@ static CLOSURE_CALLBACK(cached_dev_flush)
 	bch_cache_accounting_destroy(&dc->accounting);
 	kobject_del(&d->kobj);
 
-	continue_at(cl, cached_dev_free, system_wq);
+	continue_at(cl, cached_dev_free, system_percpu_wq);
 }
 
 static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
@@ -1400,7 +1400,7 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
 	__module_get(THIS_MODULE);
 	INIT_LIST_HEAD(&dc->list);
 	closure_init(&dc->disk.cl, NULL);
-	set_closure_fn(&dc->disk.cl, cached_dev_flush, system_wq);
+	set_closure_fn(&dc->disk.cl, cached_dev_flush, system_percpu_wq);
 	kobject_init(&dc->disk.kobj, &bch_cached_dev_ktype);
 	INIT_WORK(&dc->detach, cached_dev_detach_finish);
 	sema_init(&dc->sb_write_mutex, 1);
@@ -1513,7 +1513,7 @@ static CLOSURE_CALLBACK(flash_dev_flush)
 	bcache_device_unlink(d);
 	mutex_unlock(&bch_register_lock);
 	kobject_del(&d->kobj);
-	continue_at(cl, flash_dev_free, system_wq);
+	continue_at(cl, flash_dev_free, system_percpu_wq);
 }
 
 static int flash_dev_run(struct cache_set *c, struct uuid_entry *u)
@@ -1525,7 +1525,7 @@ static int flash_dev_run(struct cache_set *c, struct uuid_entry *u)
 		goto err_ret;
 
 	closure_init(&d->cl, NULL);
-	set_closure_fn(&d->cl, flash_dev_flush, system_wq);
+	set_closure_fn(&d->cl, flash_dev_flush, system_percpu_wq);
 
 	kobject_init(&d->kobj, &bch_flash_dev_ktype);
 
@@ -1828,7 +1828,7 @@ static CLOSURE_CALLBACK(__cache_set_unregister)
 
 	mutex_unlock(&bch_register_lock);
 
-	continue_at(cl, cache_set_flush, system_wq);
+	continue_at(cl, cache_set_flush, system_percpu_wq);
 }
 
 void bch_cache_set_stop(struct cache_set *c)
@@ -1858,10 +1858,10 @@ struct cache_set *bch_cache_set_alloc(struct cache_sb *sb)
 
 	__module_get(THIS_MODULE);
 	closure_init(&c->cl, NULL);
-	set_closure_fn(&c->cl, cache_set_free, system_wq);
+	set_closure_fn(&c->cl, cache_set_free, system_percpu_wq);
 
 	closure_init(&c->caching, &c->cl);
-	set_closure_fn(&c->caching, __cache_set_unregister, system_wq);
+	set_closure_fn(&c->caching, __cache_set_unregister, system_percpu_wq);
 
 	/* Maybe create continue_at_noreturn() and use it here? */
 	closure_set_stopped(&c->cl);
@@ -2493,7 +2493,7 @@ static void register_device_async(struct async_reg_args *args)
 		INIT_DELAYED_WORK(&args->reg_work, register_cache_worker);
 
 	/* 10 jiffies is enough for a delay */
-	queue_delayed_work(system_wq, &args->reg_work, 10);
+	queue_delayed_work(system_percpu_wq, &args->reg_work, 10);
 }
 
 static void *alloc_holder_object(struct cache_sb *sb)
@@ -2874,11 +2874,11 @@ static int __init bcache_init(void)
 	/*
 	 * Let's not make this `WQ_MEM_RECLAIM` for the following reasons:
 	 *
-	 * 1. It used `system_wq` before which also does no memory reclaim.
+	 * 1. It used `system_percpu_wq` before which also does no memory reclaim.
 	 * 2. With `WQ_MEM_RECLAIM` desktop stalls, increased boot times, and
 	 *    reduced throughput can be observed.
 	 *
-	 * We still want to user our own queue to not congest the `system_wq`.
+	 * We still want to user our own queue to not congest the `system_percpu_wq`.
 	 */
 	bch_flush_wq = alloc_workqueue("bch_flush", 0, 0);
 	if (!bch_flush_wq)
diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 345ea91629e0..f99fdef0253d 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1190,7 +1190,7 @@ static void msdc_start_data(struct msdc_host *host, struct mmc_command *cmd,
 	host->data = data;
 	read = data->flags & MMC_DATA_READ;
 
-	mod_delayed_work(system_wq, &host->req_timeout, DAT_TIMEOUT);
+	mod_delayed_work(system_percpu_wq, &host->req_timeout, DAT_TIMEOUT);
 	msdc_dma_setup(host, &host->dma, data);
 	sdr_set_bits(host->base + MSDC_INTEN, data_ints_mask);
 	sdr_set_field(host->base + MSDC_DMA_CTRL, MSDC_DMA_CTRL_START, 1);
@@ -1420,7 +1420,7 @@ static void msdc_start_command(struct msdc_host *host,
 	WARN_ON(host->cmd);
 	host->cmd = cmd;
 
-	mod_delayed_work(system_wq, &host->req_timeout, DAT_TIMEOUT);
+	mod_delayed_work(system_percpu_wq, &host->req_timeout, DAT_TIMEOUT);
 	if (!msdc_cmd_is_ready(host, mrq, cmd))
 		return;
 
diff --git a/drivers/net/ethernet/sfc/efx_channels.c b/drivers/net/ethernet/sfc/efx_channels.c
index 06b4f52713ef..4fba49d4f36c 100644
--- a/drivers/net/ethernet/sfc/efx_channels.c
+++ b/drivers/net/ethernet/sfc/efx_channels.c
@@ -1281,7 +1281,7 @@ static int efx_poll(struct napi_struct *napi, int budget)
 		time = jiffies - channel->rfs_last_expiry;
 		/* Would our quota be >= 20? */
 		if (channel->rfs_filter_count * time >= 600 * HZ)
-			mod_delayed_work(system_wq, &channel->filter_work, 0);
+			mod_delayed_work(system_percpu_wq, &channel->filter_work, 0);
 #endif
 
 		/* There is no race here; although napi_disable() will
diff --git a/drivers/net/ethernet/sfc/siena/efx_channels.c b/drivers/net/ethernet/sfc/siena/efx_channels.c
index d120b3c83ac0..2039083205bb 100644
--- a/drivers/net/ethernet/sfc/siena/efx_channels.c
+++ b/drivers/net/ethernet/sfc/siena/efx_channels.c
@@ -1300,7 +1300,7 @@ static int efx_poll(struct napi_struct *napi, int budget)
 		time = jiffies - channel->rfs_last_expiry;
 		/* Would our quota be >= 20? */
 		if (channel->rfs_filter_count * time >= 600 * HZ)
-			mod_delayed_work(system_wq, &channel->filter_work, 0);
+			mod_delayed_work(system_percpu_wq, &channel->filter_work, 0);
 #endif
 
 		/* There is no race here; although napi_disable() will
diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 347c1e0e94d9..19fcff02db51 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -890,7 +890,7 @@ static void sfp_soft_start_poll(struct sfp *sfp)
 
 	if (sfp->state_soft_mask & (SFP_F_LOS | SFP_F_TX_FAULT) &&
 	    !sfp->need_poll)
-		mod_delayed_work(system_wq, &sfp->poll, poll_jiffies);
+		mod_delayed_work(system_percpu_wq, &sfp->poll, poll_jiffies);
 	mutex_unlock(&sfp->st_mutex);
 }
 
@@ -1661,7 +1661,7 @@ static void sfp_hwmon_probe(struct work_struct *work)
 	err = sfp_read(sfp, true, 0, &sfp->diag, sizeof(sfp->diag));
 	if (err < 0) {
 		if (sfp->hwmon_tries--) {
-			mod_delayed_work(system_wq, &sfp->hwmon_probe,
+			mod_delayed_work(system_percpu_wq, &sfp->hwmon_probe,
 					 T_PROBE_RETRY_SLOW);
 		} else {
 			dev_warn(sfp->dev, "hwmon probe failed: %pe\n",
@@ -1688,7 +1688,7 @@ static void sfp_hwmon_probe(struct work_struct *work)
 static int sfp_hwmon_insert(struct sfp *sfp)
 {
 	if (sfp->have_a2 && sfp->id.ext.diagmon & SFP_DIAGMON_DDM) {
-		mod_delayed_work(system_wq, &sfp->hwmon_probe, 1);
+		mod_delayed_work(system_percpu_wq, &sfp->hwmon_probe, 1);
 		sfp->hwmon_tries = R_PROBE_RETRY_SLOW;
 	}
 
@@ -2542,7 +2542,7 @@ static void sfp_sm_module(struct sfp *sfp, unsigned int event)
 		/* Force a poll to re-read the hardware signal state after
 		 * sfp_sm_mod_probe() changed state_hw_mask.
 		 */
-		mod_delayed_work(system_wq, &sfp->poll, 1);
+		mod_delayed_work(system_percpu_wq, &sfp->poll, 1);
 
 		err = sfp_hwmon_insert(sfp);
 		if (err)
@@ -2987,7 +2987,7 @@ static void sfp_poll(struct work_struct *work)
 	// it's unimportant if we race while reading this.
 	if (sfp->state_soft_mask & (SFP_F_LOS | SFP_F_TX_FAULT) ||
 	    sfp->need_poll)
-		mod_delayed_work(system_wq, &sfp->poll, poll_jiffies);
+		mod_delayed_work(system_percpu_wq, &sfp->poll, poll_jiffies);
 }
 
 static struct sfp *sfp_alloc(struct device *dev)
@@ -3157,7 +3157,7 @@ static int sfp_probe(struct platform_device *pdev)
 	}
 
 	if (sfp->need_poll)
-		mod_delayed_work(system_wq, &sfp->poll, poll_jiffies);
+		mod_delayed_work(system_percpu_wq, &sfp->poll, poll_jiffies);
 
 	/* We could have an issue in cases no Tx disable pin is available or
 	 * wired as modules using a laser as their light source will continue to
diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2100.c b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
index 215814861cbd..c7c5bc0f1650 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2100.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
@@ -2143,7 +2143,7 @@ static void isr_indicate_rf_kill(struct ipw2100_priv *priv, u32 status)
 
 	/* Make sure the RF Kill check timer is running */
 	priv->stop_rf_kill = 0;
-	mod_delayed_work(system_wq, &priv->rf_kill, round_jiffies_relative(HZ));
+	mod_delayed_work(system_percpu_wq, &priv->rf_kill, round_jiffies_relative(HZ));
 }
 
 static void ipw2100_scan_event(struct work_struct *work)
@@ -2170,7 +2170,7 @@ static void isr_scan_complete(struct ipw2100_priv *priv, u32 status)
 				      round_jiffies_relative(msecs_to_jiffies(4000)));
 	} else {
 		priv->user_requested_scan = 0;
-		mod_delayed_work(system_wq, &priv->scan_event, 0);
+		mod_delayed_work(system_percpu_wq, &priv->scan_event, 0);
 	}
 }
 
@@ -4252,7 +4252,7 @@ static int ipw_radio_kill_sw(struct ipw2100_priv *priv, int disable_radio)
 					  "disabled by HW switch\n");
 			/* Make sure the RF_KILL check timer is running */
 			priv->stop_rf_kill = 0;
-			mod_delayed_work(system_wq, &priv->rf_kill,
+			mod_delayed_work(system_percpu_wq, &priv->rf_kill,
 					 round_jiffies_relative(HZ));
 		} else
 			schedule_reset(priv);
diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2200.c b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
index 24a5624ef207..09035a77e775 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2200.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
@@ -4415,7 +4415,7 @@ static void handle_scan_event(struct ipw_priv *priv)
 				      round_jiffies_relative(msecs_to_jiffies(4000)));
 	} else {
 		priv->user_requested_scan = 0;
-		mod_delayed_work(system_wq, &priv->scan_event, 0);
+		mod_delayed_work(system_percpu_wq, &priv->scan_event, 0);
 	}
 }
 
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/tdls.c b/drivers/net/wireless/intel/iwlwifi/mvm/tdls.c
index 36379b738de1..0df31639fa5e 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/tdls.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/tdls.c
@@ -234,7 +234,7 @@ void iwl_mvm_rx_tdls_notif(struct iwl_mvm *mvm, struct iwl_rx_cmd_buffer *rxb)
 	 * Also convert TU to msec.
 	 */
 	delay = TU_TO_MS(vif->bss_conf.dtim_period * vif->bss_conf.beacon_int);
-	mod_delayed_work(system_wq, &mvm->tdls_cs.dwork,
+	mod_delayed_work(system_percpu_wq, &mvm->tdls_cs.dwork,
 			 msecs_to_jiffies(delay));
 
 	iwl_mvm_tdls_update_cs_state(mvm, IWL_MVM_TDLS_SW_ACTIVE);
@@ -548,7 +548,7 @@ iwl_mvm_tdls_channel_switch(struct ieee80211_hw *hw,
 	 */
 	delay = 2 * TU_TO_MS(vif->bss_conf.dtim_period *
 			     vif->bss_conf.beacon_int);
-	mod_delayed_work(system_wq, &mvm->tdls_cs.dwork,
+	mod_delayed_work(system_percpu_wq, &mvm->tdls_cs.dwork,
 			 msecs_to_jiffies(delay));
 	return 0;
 }
@@ -659,6 +659,6 @@ iwl_mvm_tdls_recv_channel_switch(struct ieee80211_hw *hw,
 	/* register a timeout in case we don't succeed in switching */
 	delay = vif->bss_conf.dtim_period * vif->bss_conf.beacon_int *
 		1024 / 1000;
-	mod_delayed_work(system_wq, &mvm->tdls_cs.dwork,
+	mod_delayed_work(system_percpu_wq, &mvm->tdls_cs.dwork,
 			 msecs_to_jiffies(delay));
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 14e17dc90256..cb97f69a9149 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -341,7 +341,7 @@ int mt7921_register_device(struct mt792x_dev *dev)
 	dev->mphy.hw->wiphy->available_antennas_rx = dev->mphy.chainmask;
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->mphy.chainmask;
 
-	queue_work(system_wq, &dev->init_work);
+	queue_work(system_percpu_wq, &dev->init_work);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 63cb08f4d87c..090ecd1f2a0a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -410,7 +410,7 @@ int mt7925_register_device(struct mt792x_dev *dev)
 	dev->mphy.hw->wiphy->available_antennas_rx = dev->mphy.chainmask;
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->mphy.chainmask;
 
-	queue_work(system_wq, &dev->init_work);
+	queue_work(system_percpu_wq, &dev->init_work);
 
 	return 0;
 }
diff --git a/drivers/nvdimm/security.c b/drivers/nvdimm/security.c
index a03e3c45f297..c8095cd1cf1c 100644
--- a/drivers/nvdimm/security.c
+++ b/drivers/nvdimm/security.c
@@ -427,7 +427,7 @@ static int security_overwrite(struct nvdimm *nvdimm, unsigned int keyid)
 		 * query.
 		 */
 		get_device(dev);
-		queue_delayed_work(system_wq, &nvdimm->dwork, 0);
+		queue_delayed_work(system_percpu_wq, &nvdimm->dwork, 0);
 	}
 
 	return rc;
@@ -460,7 +460,7 @@ static void __nvdimm_security_overwrite_query(struct nvdimm *nvdimm)
 
 		/* setup delayed work again */
 		tmo += 10;
-		queue_delayed_work(system_wq, &nvdimm->dwork, tmo * HZ);
+		queue_delayed_work(system_percpu_wq, &nvdimm->dwork, tmo * HZ);
 		nvdimm->sec.overwrite_tmo = min(15U * 60U, tmo);
 		return;
 	}
diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index acc138bbf8f2..af3ec44a6490 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -1613,7 +1613,7 @@ void nvmet_execute_keep_alive(struct nvmet_req *req)
 
 	pr_debug("ctrl %d update keep-alive timer for %d secs\n",
 		ctrl->cntlid, ctrl->kato);
-	mod_delayed_work(system_wq, &ctrl->ka_work, ctrl->kato * HZ);
+	mod_delayed_work(system_percpu_wq, &ctrl->ka_work, ctrl->kato * HZ);
 out:
 	nvmet_req_complete(req, status);
 }
diff --git a/drivers/nvme/target/fabrics-cmd-auth.c b/drivers/nvme/target/fabrics-cmd-auth.c
index bf01ec414c55..8f504bf891de 100644
--- a/drivers/nvme/target/fabrics-cmd-auth.c
+++ b/drivers/nvme/target/fabrics-cmd-auth.c
@@ -390,7 +390,7 @@ void nvmet_execute_auth_send(struct nvmet_req *req)
 	    req->sq->dhchap_step != NVME_AUTH_DHCHAP_MESSAGE_FAILURE2) {
 		unsigned long auth_expire_secs = ctrl->kato ? ctrl->kato : 120;
 
-		mod_delayed_work(system_wq, &req->sq->auth_expired_work,
+		mod_delayed_work(system_percpu_wq, &req->sq->auth_expired_work,
 				 auth_expire_secs * HZ);
 		goto complete;
 	}
diff --git a/drivers/pci/endpoint/pci-ep-cfs.c b/drivers/pci/endpoint/pci-ep-cfs.c
index d712c7a866d2..45462af6100d 100644
--- a/drivers/pci/endpoint/pci-ep-cfs.c
+++ b/drivers/pci/endpoint/pci-ep-cfs.c
@@ -638,7 +638,7 @@ static struct config_group *pci_epf_make(struct config_group *group,
 	kfree(epf_name);
 
 	INIT_DELAYED_WORK(&epf_group->cfs_work, pci_epf_cfs_work);
-	queue_delayed_work(system_wq, &epf_group->cfs_work,
+	queue_delayed_work(system_percpu_wq, &epf_group->cfs_work,
 			   msecs_to_jiffies(1));
 
 	return &epf_group->group;
diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 29b8fd4b9351..0f9887fda584 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -359,7 +359,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		/* Force ISCR and cable state updates */
 		data->id_det = -1;
 		data->vbus_det = -1;
-		queue_delayed_work(system_wq, &data->detect, 0);
+		queue_delayed_work(system_percpu_wq, &data->detect, 0);
 	}
 
 	return 0;
@@ -482,7 +482,7 @@ static int sun4i_usb_phy_power_on(struct phy *_phy)
 
 	/* We must report Vbus high within OTG_TIME_A_WAIT_VRISE msec. */
 	if (phy->index == 0 && sun4i_usb_phy0_poll(data))
-		mod_delayed_work(system_wq, &data->detect, DEBOUNCE_TIME);
+		mod_delayed_work(system_percpu_wq, &data->detect, DEBOUNCE_TIME);
 
 	return 0;
 }
@@ -503,7 +503,7 @@ static int sun4i_usb_phy_power_off(struct phy *_phy)
 	 * Vbus gpio to not trigger an edge irq on Vbus off, so force a rescan.
 	 */
 	if (phy->index == 0 && !sun4i_usb_phy0_poll(data))
-		mod_delayed_work(system_wq, &data->detect, POLL_TIME);
+		mod_delayed_work(system_percpu_wq, &data->detect, POLL_TIME);
 
 	return 0;
 }
@@ -542,7 +542,7 @@ static int sun4i_usb_phy_set_mode(struct phy *_phy,
 
 	data->id_det = -1; /* Force reprocessing of id */
 	data->force_session_end = true;
-	queue_delayed_work(system_wq, &data->detect, 0);
+	queue_delayed_work(system_percpu_wq, &data->detect, 0);
 
 	return 0;
 }
@@ -654,7 +654,7 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 		extcon_set_state_sync(data->extcon, EXTCON_USB, vbus_det);
 
 	if (sun4i_usb_phy0_poll(data))
-		queue_delayed_work(system_wq, &data->detect, POLL_TIME);
+		queue_delayed_work(system_percpu_wq, &data->detect, POLL_TIME);
 }
 
 static irqreturn_t sun4i_usb_phy0_id_vbus_det_irq(int irq, void *dev_id)
@@ -662,7 +662,7 @@ static irqreturn_t sun4i_usb_phy0_id_vbus_det_irq(int irq, void *dev_id)
 	struct sun4i_usb_phy_data *data = dev_id;
 
 	/* vbus or id changed, let the pins settle and then scan them */
-	mod_delayed_work(system_wq, &data->detect, DEBOUNCE_TIME);
+	mod_delayed_work(system_percpu_wq, &data->detect, DEBOUNCE_TIME);
 
 	return IRQ_HANDLED;
 }
@@ -676,7 +676,7 @@ static int sun4i_usb_phy0_vbus_notify(struct notifier_block *nb,
 
 	/* Properties on the vbus_power_supply changed, scan vbus_det */
 	if (val == PSY_EVENT_PROP_CHANGED && psy == data->vbus_power_supply)
-		mod_delayed_work(system_wq, &data->detect, DEBOUNCE_TIME);
+		mod_delayed_work(system_percpu_wq, &data->detect, DEBOUNCE_TIME);
 
 	return NOTIFY_OK;
 }
diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
index 5f35f7c5d5d7..18f7e1c41a86 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -883,7 +883,7 @@ static bool omnia_irq_read_pending_old(struct omnia_mcu *mcu,
 
 	if (status & OMNIA_STS_BUTTON_PRESSED) {
 		mcu->button_pressed_emul = true;
-		mod_delayed_work(system_wq, &mcu->button_release_emul_work,
+		mod_delayed_work(system_percpu_wq, &mcu->button_release_emul_work,
 				 msecs_to_jiffies(FRONT_BUTTON_RELEASE_DELAY_MS));
 	} else if (mcu->button_pressed_emul) {
 		status |= OMNIA_STS_BUTTON_PRESSED;
diff --git a/drivers/platform/surface/aggregator/ssh_packet_layer.c b/drivers/platform/surface/aggregator/ssh_packet_layer.c
index 6081b0146d5f..3dd22856570f 100644
--- a/drivers/platform/surface/aggregator/ssh_packet_layer.c
+++ b/drivers/platform/surface/aggregator/ssh_packet_layer.c
@@ -671,7 +671,7 @@ static void ssh_ptl_timeout_reaper_mod(struct ssh_ptl *ptl, ktime_t now,
 	/* Re-adjust / schedule reaper only if it is above resolution delta. */
 	if (ktime_before(aexp, ptl->rtx_timeout.expires)) {
 		ptl->rtx_timeout.expires = expires;
-		mod_delayed_work(system_wq, &ptl->rtx_timeout.reaper, delta);
+		mod_delayed_work(system_percpu_wq, &ptl->rtx_timeout.reaper, delta);
 	}
 
 	spin_unlock(&ptl->rtx_timeout.lock);
diff --git a/drivers/platform/surface/aggregator/ssh_request_layer.c b/drivers/platform/surface/aggregator/ssh_request_layer.c
index 879ca9ee7ff6..a356e4956562 100644
--- a/drivers/platform/surface/aggregator/ssh_request_layer.c
+++ b/drivers/platform/surface/aggregator/ssh_request_layer.c
@@ -434,7 +434,7 @@ static void ssh_rtl_timeout_reaper_mod(struct ssh_rtl *rtl, ktime_t now,
 	/* Re-adjust / schedule reaper only if it is above resolution delta. */
 	if (ktime_before(aexp, rtl->rtx_timeout.expires)) {
 		rtl->rtx_timeout.expires = expires;
-		mod_delayed_work(system_wq, &rtl->rtx_timeout.reaper, delta);
+		mod_delayed_work(system_percpu_wq, &rtl->rtx_timeout.reaper, delta);
 	}
 
 	spin_unlock(&rtl->rtx_timeout.lock);
diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
index 7a20f68ae206..c9236738f896 100644
--- a/drivers/platform/x86/gpd-pocket-fan.c
+++ b/drivers/platform/x86/gpd-pocket-fan.c
@@ -112,14 +112,14 @@ static void gpd_pocket_fan_worker(struct work_struct *work)
 	gpd_pocket_fan_set_speed(fan, speed);
 
 	/* When mostly idle (low temp/speed), slow down the poll interval. */
-	queue_delayed_work(system_wq, &fan->work,
+	queue_delayed_work(system_percpu_wq, &fan->work,
 			   msecs_to_jiffies(4000 / (speed + 1)));
 }
 
 static void gpd_pocket_fan_force_update(struct gpd_pocket_fan_data *fan)
 {
 	fan->last_speed = -1;
-	mod_delayed_work(system_wq, &fan->work, 0);
+	mod_delayed_work(system_percpu_wq, &fan->work, 0);
 }
 
 static int gpd_pocket_fan_probe(struct platform_device *pdev)
diff --git a/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
index 5d02af1c5aaa..94465a62f7e7 100644
--- a/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
+++ b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
@@ -183,7 +183,7 @@ static void atla10_ec_external_power_changed(struct power_supply *psy)
 	struct atla10_ec_data *data = power_supply_get_drvdata(psy);
 
 	/* After charger plug in/out wait 0.5s for things to stabilize */
-	mod_delayed_work(system_wq, &data->work, HZ / 2);
+	mod_delayed_work(system_percpu_wq, &data->work, HZ / 2);
 }
 
 static const enum power_supply_property atla10_ec_psy_props[] = {
diff --git a/drivers/power/supply/bq2415x_charger.c b/drivers/power/supply/bq2415x_charger.c
index 9e3b9181ee76..03837c831643 100644
--- a/drivers/power/supply/bq2415x_charger.c
+++ b/drivers/power/supply/bq2415x_charger.c
@@ -842,7 +842,7 @@ static int bq2415x_notifier_call(struct notifier_block *nb,
 	if (bq->automode < 1)
 		return NOTIFY_OK;
 
-	mod_delayed_work(system_wq, &bq->work, 0);
+	mod_delayed_work(system_percpu_wq, &bq->work, 0);
 
 	return NOTIFY_OK;
 }
diff --git a/drivers/power/supply/bq24190_charger.c b/drivers/power/supply/bq24190_charger.c
index f0d97ab45bd8..a19fca6d0a29 100644
--- a/drivers/power/supply/bq24190_charger.c
+++ b/drivers/power/supply/bq24190_charger.c
@@ -1474,7 +1474,7 @@ static void bq24190_charger_external_power_changed(struct power_supply *psy)
 	 * too low default 500mA iinlim. Delay setting the input-current-limit
 	 * for 300ms to avoid this.
 	 */
-	queue_delayed_work(system_wq, &bdi->input_current_limit_work,
+	queue_delayed_work(system_percpu_wq, &bdi->input_current_limit_work,
 			   msecs_to_jiffies(300));
 }
 
diff --git a/drivers/power/supply/bq27xxx_battery.c b/drivers/power/supply/bq27xxx_battery.c
index 2f31d750a4c1..d670ccf9661b 100644
--- a/drivers/power/supply/bq27xxx_battery.c
+++ b/drivers/power/supply/bq27xxx_battery.c
@@ -1127,7 +1127,7 @@ static int poll_interval_param_set(const char *val, const struct kernel_param *k
 
 	mutex_lock(&bq27xxx_list_lock);
 	list_for_each_entry(di, &bq27xxx_battery_devices, list)
-		mod_delayed_work(system_wq, &di->work, 0);
+		mod_delayed_work(system_percpu_wq, &di->work, 0);
 	mutex_unlock(&bq27xxx_list_lock);
 
 	return ret;
@@ -1945,7 +1945,7 @@ static void bq27xxx_battery_update_unlocked(struct bq27xxx_device_info *di)
 	di->last_update = jiffies;
 
 	if (!di->removed && poll_interval > 0)
-		mod_delayed_work(system_wq, &di->work, poll_interval * HZ);
+		mod_delayed_work(system_percpu_wq, &di->work, poll_interval * HZ);
 }
 
 void bq27xxx_battery_update(struct bq27xxx_device_info *di)
@@ -2221,7 +2221,7 @@ static void bq27xxx_external_power_changed(struct power_supply *psy)
 	struct bq27xxx_device_info *di = power_supply_get_drvdata(psy);
 
 	/* After charger plug in/out wait 0.5s for things to stabilize */
-	mod_delayed_work(system_wq, &di->work, HZ / 2);
+	mod_delayed_work(system_percpu_wq, &di->work, HZ / 2);
 }
 
 static void bq27xxx_battery_mutex_destroy(void *data)
diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index 945c7720c4ae..032b191ddbf5 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -1046,7 +1046,7 @@ static void rk817_charging_monitor(struct work_struct *work)
 	rk817_read_props(charger);
 
 	/* Run every 8 seconds like the BSP driver did. */
-	queue_delayed_work(system_wq, &charger->work, msecs_to_jiffies(8000));
+	queue_delayed_work(system_percpu_wq, &charger->work, msecs_to_jiffies(8000));
 }
 
 static void rk817_cleanup_node(void *data)
@@ -1206,7 +1206,7 @@ static int rk817_charger_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Force the first update immediately. */
-	mod_delayed_work(system_wq, &charger->work, 0);
+	mod_delayed_work(system_percpu_wq, &charger->work, 0);
 
 	return 0;
 }
@@ -1226,7 +1226,7 @@ static int __maybe_unused rk817_resume(struct device *dev)
 	struct rk817_charger *charger = dev_get_drvdata(dev);
 
 	/* force an immediate update */
-	mod_delayed_work(system_wq, &charger->work, 0);
+	mod_delayed_work(system_percpu_wq, &charger->work, 0);
 
 	return 0;
 }
diff --git a/drivers/power/supply/ucs1002_power.c b/drivers/power/supply/ucs1002_power.c
index d32a7633f9e7..fe94435340de 100644
--- a/drivers/power/supply/ucs1002_power.c
+++ b/drivers/power/supply/ucs1002_power.c
@@ -493,7 +493,7 @@ static irqreturn_t ucs1002_alert_irq(int irq, void *data)
 {
 	struct ucs1002_info *info = data;
 
-	mod_delayed_work(system_wq, &info->health_poll, 0);
+	mod_delayed_work(system_percpu_wq, &info->health_poll, 0);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/power/supply/ug3105_battery.c b/drivers/power/supply/ug3105_battery.c
index 38e23bdd4603..15b62952f953 100644
--- a/drivers/power/supply/ug3105_battery.c
+++ b/drivers/power/supply/ug3105_battery.c
@@ -276,7 +276,7 @@ static void ug3105_work(struct work_struct *work)
 out:
 	mutex_unlock(&chip->lock);
 
-	queue_delayed_work(system_wq, &chip->work,
+	queue_delayed_work(system_percpu_wq, &chip->work,
 			   (chip->poll_count <= UG3105_INIT_POLL_COUNT) ?
 					UG3105_INIT_POLL_TIME : UG3105_POLL_TIME);
 
@@ -352,7 +352,7 @@ static void ug3105_external_power_changed(struct power_supply *psy)
 	struct ug3105_chip *chip = power_supply_get_drvdata(psy);
 
 	dev_dbg(&chip->client->dev, "external power changed\n");
-	mod_delayed_work(system_wq, &chip->work, UG3105_SETTLE_TIME);
+	mod_delayed_work(system_percpu_wq, &chip->work, UG3105_SETTLE_TIME);
 }
 
 static const struct power_supply_desc ug3105_psy_desc = {
@@ -373,7 +373,7 @@ static void ug3105_init(struct ug3105_chip *chip)
 				  UG3105_MODE_RUN);
 	i2c_smbus_write_byte_data(chip->client, UG3105_REG_CTRL1,
 				  UG3105_CTRL1_RESET_COULOMB_CNT);
-	queue_delayed_work(system_wq, &chip->work, 0);
+	queue_delayed_work(system_percpu_wq, &chip->work, 0);
 	flush_delayed_work(&chip->work);
 }
 
diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index e440b15fbabc..15f7f043c8ef 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -166,7 +166,7 @@ static void cec_mod_work(unsigned long interval)
 	unsigned long iv;
 
 	iv = interval * HZ;
-	mod_delayed_work(system_wq, &cec_work, round_jiffies(iv));
+	mod_delayed_work(system_percpu_wq, &cec_work, round_jiffies(iv));
 }
 
 static void cec_work_fn(struct work_struct *work)
diff --git a/drivers/regulator/irq_helpers.c b/drivers/regulator/irq_helpers.c
index 5742faee8071..54dd19e1e94c 100644
--- a/drivers/regulator/irq_helpers.c
+++ b/drivers/regulator/irq_helpers.c
@@ -146,7 +146,7 @@ static void regulator_notifier_isr_work(struct work_struct *work)
 
 reschedule:
 	if (!d->high_prio)
-		mod_delayed_work(system_wq, &h->isr_work,
+		mod_delayed_work(system_percpu_wq, &h->isr_work,
 				 msecs_to_jiffies(tmo));
 	else
 		mod_delayed_work(system_highpri_wq, &h->isr_work,
diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index ba3f9391565f..ad65d264cfe0 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -230,7 +230,7 @@ static void qcom_labibb_ocp_recovery_worker(struct work_struct *work)
 	return;
 
 reschedule:
-	mod_delayed_work(system_wq, &vreg->ocp_recovery_work,
+	mod_delayed_work(system_percpu_wq, &vreg->ocp_recovery_work,
 			 msecs_to_jiffies(OCP_RECOVERY_INTERVAL_MS));
 }
 
@@ -510,7 +510,7 @@ static void qcom_labibb_sc_recovery_worker(struct work_struct *work)
 	 * taking action is not truly urgent anymore.
 	 */
 	vreg->sc_count++;
-	mod_delayed_work(system_wq, &vreg->sc_recovery_work,
+	mod_delayed_work(system_percpu_wq, &vreg->sc_recovery_work,
 			 msecs_to_jiffies(SC_RECOVERY_INTERVAL_MS));
 }
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 8c527af98927..e842dda55f71 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2617,7 +2617,7 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 				 * the 10s already expired and we should
 				 * give the reserved back to others).
 				 */
-				mod_delayed_work(system_wq, &group->release_work,
+				mod_delayed_work(system_percpu_wq, &group->release_work,
 					msecs_to_jiffies(TB_RELEASE_BW_TIMEOUT));
 			}
 		}
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 47e73c4ed62d..17c6fb417231 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3888,7 +3888,7 @@ static void dwc3_gadget_endpoint_stream_event(struct dwc3_ep *dep,
 	case DEPEVT_STREAM_NOSTREAM:
 		dep->flags &= ~DWC3_EP_STREAM_PRIMED;
 		if (dep->flags & DWC3_EP_FORCE_RESTART_STREAM)
-			queue_delayed_work(system_wq, &dep->nostream_work,
+			queue_delayed_work(system_percpu_wq, &dep->nostream_work,
 					   msecs_to_jiffies(100));
 		break;
 	}
diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index fd7895b24367..8b3052954530 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -365,7 +365,7 @@ int dbc_ep_queue(struct dbc_request *req)
 		ret = dbc_ep_do_queue(req);
 	spin_unlock_irqrestore(&dbc->lock, flags);
 
-	mod_delayed_work(system_wq, &dbc->event_work, 0);
+	mod_delayed_work(system_percpu_wq, &dbc->event_work, 0);
 
 	trace_xhci_dbc_queue_request(req);
 
@@ -637,7 +637,7 @@ static int xhci_dbc_start(struct xhci_dbc *dbc)
 		return ret;
 	}
 
-	return mod_delayed_work(system_wq, &dbc->event_work,
+	return mod_delayed_work(system_percpu_wq, &dbc->event_work,
 				msecs_to_jiffies(dbc->poll_interval));
 }
 
@@ -964,7 +964,7 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 		return;
 	}
 
-	mod_delayed_work(system_wq, &dbc->event_work,
+	mod_delayed_work(system_percpu_wq, &dbc->event_work,
 			 msecs_to_jiffies(poll_interval));
 }
 
@@ -1215,7 +1215,7 @@ static ssize_t dbc_poll_interval_ms_store(struct device *dev,
 
 	dbc->poll_interval = value;
 
-	mod_delayed_work(system_wq, &dbc->event_work, 0);
+	mod_delayed_work(system_percpu_wq, &dbc->event_work, 0);
 
 	return size;
 }
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5d64c297721c..79704fbbba50 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -434,7 +434,7 @@ void xhci_ring_cmd_db(struct xhci_hcd *xhci)
 
 static bool xhci_mod_cmd_timer(struct xhci_hcd *xhci)
 {
-	return mod_delayed_work(system_wq, &xhci->cmd_timer,
+	return mod_delayed_work(system_percpu_wq, &xhci->cmd_timer,
 			msecs_to_jiffies(xhci->current_cmd->timeout_ms));
 }
 
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 41309d38f78c..114c2af0857a 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -581,7 +581,7 @@ static void lateeoi_list_add(struct irq_info *info)
 					eoi_list);
 	if (!elem || info->eoi_time < elem->eoi_time) {
 		list_add(&info->eoi_list, &eoi->eoi_list);
-		mod_delayed_work_on(info->eoi_cpu, system_wq,
+		mod_delayed_work_on(info->eoi_cpu, system_percpu_wq,
 				    &eoi->delayed, delay);
 	} else {
 		list_for_each_entry_reverse(elem, &eoi->eoi_list, eoi_list) {
@@ -666,7 +666,7 @@ static void xen_irq_lateeoi_worker(struct work_struct *work)
 			break;
 
 		if (now < info->eoi_time) {
-			mod_delayed_work_on(info->eoi_cpu, system_wq,
+			mod_delayed_work_on(info->eoi_cpu, system_percpu_wq,
 					    &eoi->delayed,
 					    info->eoi_time - now);
 			break;
@@ -782,7 +782,7 @@ static void xen_free_irq(struct irq_info *info)
 
 	WARN_ON(info->refcnt > 0);
 
-	queue_rcu_work(system_wq, &info->rwork);
+	queue_rcu_work(system_percpu_wq, &info->rwork);
 }
 
 /* Not called for lateeoi events. */
diff --git a/fs/aio.c b/fs/aio.c
index 7b976b564cfc..747e9b5bba23 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -636,7 +636,7 @@ static void free_ioctx_reqs(struct percpu_ref *ref)
 
 	/* Synchronize against RCU protected table->table[] dereferences */
 	INIT_RCU_WORK(&ctx->free_rwork, free_ioctx);
-	queue_rcu_work(system_wq, &ctx->free_rwork);
+	queue_rcu_work(system_percpu_wq, &ctx->free_rwork);
 }
 
 /*
diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index cc57367fb641..cf51a265bf27 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2442,7 +2442,7 @@ static int dirtytime_interval_handler(const struct ctl_table *table, int write,
 
 	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
 	if (ret == 0 && write)
-		mod_delayed_work(system_wq, &dirtytime_work, 0);
+		mod_delayed_work(system_percpu_wq, &dirtytime_work, 0);
 	return ret;
 }
 
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 6dcbaa218b7a..64b623471a09 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -118,7 +118,7 @@ void fuse_check_timeout(struct work_struct *work)
 	    goto abort_conn;
 
 out:
-	queue_delayed_work(system_wq, &fc->timeout.work,
+	queue_delayed_work(system_percpu_wq, &fc->timeout.work,
 			   fuse_timeout_timer_freq);
 	return;
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index fd48e8d37f2e..6a608ea77d09 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1268,7 +1268,7 @@ static void set_request_timeout(struct fuse_conn *fc, unsigned int timeout)
 {
 	fc->timeout.req_timeout = secs_to_jiffies(timeout);
 	INIT_DELAYED_WORK(&fc->timeout.work, fuse_check_timeout);
-	queue_delayed_work(system_wq, &fc->timeout.work,
+	queue_delayed_work(system_percpu_wq, &fc->timeout.work,
 			   fuse_timeout_timer_freq);
 }
 
diff --git a/fs/nfs/namespace.c b/fs/nfs/namespace.c
index 973aed9cc5fe..0689369c8a63 100644
--- a/fs/nfs/namespace.c
+++ b/fs/nfs/namespace.c
@@ -336,7 +336,7 @@ static int param_set_nfs_timeout(const char *val, const struct kernel_param *kp)
 			num *= HZ;
 		*((int *)kp->arg) = num;
 		if (!list_empty(&nfs_automount_list))
-			mod_delayed_work(system_wq, &nfs_automount_task, num);
+			mod_delayed_work(system_percpu_wq, &nfs_automount_task, num);
 	} else {
 		*((int *)kp->arg) = -1*HZ;
 		cancel_delayed_work(&nfs_automount_task);
diff --git a/fs/nfs/nfs4renewd.c b/fs/nfs/nfs4renewd.c
index db3811af0796..18ae614e5a6c 100644
--- a/fs/nfs/nfs4renewd.c
+++ b/fs/nfs/nfs4renewd.c
@@ -122,7 +122,7 @@ nfs4_schedule_state_renewal(struct nfs_client *clp)
 		timeout = 5 * HZ;
 	dprintk("%s: requeueing work. Lease period = %ld\n",
 			__func__, (timeout + HZ - 1) / HZ);
-	mod_delayed_work(system_wq, &clp->cl_renewd, timeout);
+	mod_delayed_work(system_percpu_wq, &clp->cl_renewd, timeout);
 	set_bit(NFS_CS_RENEWD, &clp->cl_res_state);
 	spin_unlock(&clp->cl_lock);
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 50928a7ae98e..a89d228146ea 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -542,7 +542,7 @@ struct drm_gpu_scheduler {
  * @hang_limit: number of times to allow a job to hang before dropping it.
  *		This mechanism is DEPRECATED. Set it to 0.
  * @timeout: timeout value in jiffies for submitted jobs.
- * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is used.
+ * @timeout_wq: workqueue to use for timeout work. If NULL, the system_percpu_wq is used.
  * @score: score atomic shared with other schedulers. May be NULL.
  * @name: name (typically the driver's name). Used for debugging
  * @dev: associated device. Used for debugging
diff --git a/include/linux/closure.h b/include/linux/closure.h
index 880fe85e35e9..959b3c584254 100644
--- a/include/linux/closure.h
+++ b/include/linux/closure.h
@@ -58,7 +58,7 @@
  * bio2->bi_endio = foo_endio;
  * bio_submit(bio2);
  *
- * continue_at(cl, complete_some_read, system_wq);
+ * continue_at(cl, complete_some_read, system_percpu_wq);
  *
  * If closure's refcount started at 0, complete_some_read() could run before the
  * second bio was submitted - which is almost always not what you want! More
diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index b0dc957c3e56..39a5f1401656 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -427,15 +427,15 @@ enum wq_consts {
 /*
  * System-wide workqueues which are always present.
  *
- * system_wq is the one used by schedule[_delayed]_work[_on]().
+ * system_percpu_wq is the one used by schedule[_delayed]_work[_on]().
  * Multi-CPU multi-threaded.  There are users which expect relatively
  * short queue flush time.  Don't queue works which can run for too
  * long.
  *
- * system_highpri_wq is similar to system_wq but for work items which
+ * system_highpri_wq is similar to system_percpu_wq but for work items which
  * require WQ_HIGHPRI.
  *
- * system_long_wq is similar to system_wq but may host long running
+ * system_long_wq is similar to system_percpu_wq but may host long running
  * works.  Queue flushing might take relatively long.
  *
  * system_unbound_wq is unbound workqueue.  Workers are not bound to
@@ -443,19 +443,19 @@ enum wq_consts {
  * executed immediately as long as max_active limit is not reached and
  * resources are available.
  *
- * system_freezable_wq is equivalent to system_wq except that it's
+ * system_freezable_wq is equivalent to system_percpu_wq except that it's
  * freezable.
  *
  * *_power_efficient_wq are inclined towards saving power and converted
  * into WQ_UNBOUND variants if 'wq_power_efficient' is enabled; otherwise,
  * they are same as their non-power-efficient counterparts - e.g.
- * system_power_efficient_wq is identical to system_wq if
+ * system_power_efficient_wq is identical to system_percpu_wq if
  * 'wq_power_efficient' is disabled.  See WQ_POWER_EFFICIENT for more info.
  *
  * system_bh[_highpri]_wq are convenience interface to softirq. BH work items
  * are executed in the queueing CPU's BH context in the queueing order.
  */
-extern struct workqueue_struct *system_wq;
+extern struct workqueue_struct *system_percpu_wq;
 extern struct workqueue_struct *system_highpri_wq;
 extern struct workqueue_struct *system_long_wq;
 extern struct workqueue_struct *system_unbound_wq;
@@ -701,7 +701,7 @@ static inline bool mod_delayed_work(struct workqueue_struct *wq,
  */
 static inline bool schedule_work_on(int cpu, struct work_struct *work)
 {
-	return queue_work_on(cpu, system_wq, work);
+	return queue_work_on(cpu, system_percpu_wq, work);
 }
 
 /**
@@ -720,7 +720,7 @@ static inline bool schedule_work_on(int cpu, struct work_struct *work)
  */
 static inline bool schedule_work(struct work_struct *work)
 {
-	return queue_work(system_wq, work);
+	return queue_work(system_percpu_wq, work);
 }
 
 /**
@@ -763,15 +763,15 @@ extern void __warn_flushing_systemwide_wq(void)
 #define flush_scheduled_work()						\
 ({									\
 	__warn_flushing_systemwide_wq();				\
-	__flush_workqueue(system_wq);					\
+	__flush_workqueue(system_percpu_wq);					\
 })
 
 #define flush_workqueue(wq)						\
 ({									\
 	struct workqueue_struct *_wq = (wq);				\
 									\
-	if ((__builtin_constant_p(_wq == system_wq) &&			\
-	     _wq == system_wq) ||					\
+	if ((__builtin_constant_p(_wq == system_percpu_wq) &&			\
+	     _wq == system_percpu_wq) ||					\
 	    (__builtin_constant_p(_wq == system_highpri_wq) &&		\
 	     _wq == system_highpri_wq) ||				\
 	    (__builtin_constant_p(_wq == system_long_wq) &&		\
@@ -800,7 +800,7 @@ extern void __warn_flushing_systemwide_wq(void)
 static inline bool schedule_delayed_work_on(int cpu, struct delayed_work *dwork,
 					    unsigned long delay)
 {
-	return queue_delayed_work_on(cpu, system_wq, dwork, delay);
+	return queue_delayed_work_on(cpu, system_percpu_wq, dwork, delay);
 }
 
 /**
@@ -814,7 +814,7 @@ static inline bool schedule_delayed_work_on(int cpu, struct delayed_work *dwork,
 static inline bool schedule_delayed_work(struct delayed_work *dwork,
 					 unsigned long delay)
 {
-	return queue_delayed_work(system_wq, dwork, delay);
+	return queue_delayed_work(system_percpu_wq, dwork, delay);
 }
 
 #ifndef CONFIG_SMP
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index c6209fe44cb1..2a6ead3c7d36 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2986,7 +2986,7 @@ static __cold void io_ring_ctx_wait_and_kill(struct io_ring_ctx *ctx)
 	 * Use system_unbound_wq to avoid spawning tons of event kworkers
 	 * if we're exiting a ton of rings at the same time. It just adds
 	 * noise and overhead, there's no discernable change in runtime
-	 * over using system_wq.
+	 * over using system_percpu_wq.
 	 */
 	queue_work(iou_wq, &ctx->exit_work);
 }
diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c
index 84f58f3d028a..b8699ec4d766 100644
--- a/kernel/bpf/cgroup.c
+++ b/kernel/bpf/cgroup.c
@@ -27,7 +27,7 @@ EXPORT_SYMBOL(cgroup_bpf_enabled_key);
 /*
  * cgroup bpf destruction makes heavy use of work items and there can be a lot
  * of concurrent destructions.  Use a separate workqueue so that cgroup bpf
- * destruction work items don't end up filling up max_active of system_wq
+ * destruction work items don't end up filling up max_active of system_percpu_wq
  * which may lead to deadlock.
  */
 static struct workqueue_struct *cgroup_bpf_destroy_wq;
diff --git a/kernel/bpf/cpumap.c b/kernel/bpf/cpumap.c
index 67e8a2fc1a99..1ab8e6876618 100644
--- a/kernel/bpf/cpumap.c
+++ b/kernel/bpf/cpumap.c
@@ -551,7 +551,7 @@ static void __cpu_map_entry_replace(struct bpf_cpu_map *cmap,
 	old_rcpu = unrcu_pointer(xchg(&cmap->cpu_map[key_cpu], RCU_INITIALIZER(rcpu)));
 	if (old_rcpu) {
 		INIT_RCU_WORK(&old_rcpu->free_work, __cpu_map_entry_free);
-		queue_rcu_work(system_wq, &old_rcpu->free_work);
+		queue_rcu_work(system_percpu_wq, &old_rcpu->free_work);
 	}
 }
 
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 3caf2cd86e65..1e39355194fd 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -121,7 +121,7 @@ DEFINE_PERCPU_RWSEM(cgroup_threadgroup_rwsem);
 /*
  * cgroup destruction makes heavy use of work items and there can be a lot
  * of concurrent destructions.  Use a separate workqueue so that cgroup
- * destruction work items don't end up filling up max_active of system_wq
+ * destruction work items don't end up filling up max_active of system_percpu_wq
  * which may lead to deadlock.
  */
 static struct workqueue_struct *cgroup_destroy_wq;
diff --git a/kernel/module/dups.c b/kernel/module/dups.c
index bd2149fbe117..e72fa393a2ec 100644
--- a/kernel/module/dups.c
+++ b/kernel/module/dups.c
@@ -113,7 +113,7 @@ static void kmod_dup_request_complete(struct work_struct *work)
 	 * let this linger forever as this is just a boot optimization for
 	 * possible abuses of vmalloc() incurred by finit_module() thrashing.
 	 */
-	queue_delayed_work(system_wq, &kmod_req->delete_work, 60 * HZ);
+	queue_delayed_work(system_percpu_wq, &kmod_req->delete_work, 60 * HZ);
 }
 
 bool kmod_dup_request_exists_wait(char *module_name, bool wait, int *dup_ret)
@@ -240,7 +240,7 @@ void kmod_dup_request_announce(char *module_name, int ret)
 	 * There is no rush. But we also don't want to hold the
 	 * caller up forever or introduce any boot delays.
 	 */
-	queue_work(system_wq, &kmod_req->complete_work);
+	queue_work(system_percpu_wq, &kmod_req->complete_work);
 
 out:
 	mutex_unlock(&kmod_dup_mutex);
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index c0cc7ae41106..5fddd7168391 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -552,13 +552,13 @@ static void rcu_tasks_invoke_cbs(struct rcu_tasks *rtp, struct rcu_tasks_percpu
 		rtpcp_next = rtp->rtpcp_array[index];
 		if (rtpcp_next->cpu < smp_load_acquire(&rtp->percpu_dequeue_lim)) {
 			cpuwq = rcu_cpu_beenfullyonline(rtpcp_next->cpu) ? rtpcp_next->cpu : WORK_CPU_UNBOUND;
-			queue_work_on(cpuwq, system_wq, &rtpcp_next->rtp_work);
+			queue_work_on(cpuwq, system_percpu_wq, &rtpcp_next->rtp_work);
 			index++;
 			if (index < num_possible_cpus()) {
 				rtpcp_next = rtp->rtpcp_array[index];
 				if (rtpcp_next->cpu < smp_load_acquire(&rtp->percpu_dequeue_lim)) {
 					cpuwq = rcu_cpu_beenfullyonline(rtpcp_next->cpu) ? rtpcp_next->cpu : WORK_CPU_UNBOUND;
-					queue_work_on(cpuwq, system_wq, &rtpcp_next->rtp_work);
+					queue_work_on(cpuwq, system_percpu_wq, &rtpcp_next->rtp_work);
 				}
 			}
 		}
diff --git a/kernel/smp.c b/kernel/smp.c
index 974f3a3962e8..c3b93476d645 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -1146,7 +1146,7 @@ int smp_call_on_cpu(unsigned int cpu, int (*func)(void *), void *par, bool phys)
 	if (cpu >= nr_cpu_ids || !cpu_online(cpu))
 		return -ENXIO;
 
-	queue_work_on(cpu, system_wq, &sscs.work);
+	queue_work_on(cpu, system_percpu_wq, &sscs.work);
 	wait_for_completion(&sscs.done);
 	destroy_work_on_stack(&sscs.work);
 
diff --git a/kernel/trace/trace_events_user.c b/kernel/trace/trace_events_user.c
index af42aaa3d172..3169182229ad 100644
--- a/kernel/trace/trace_events_user.c
+++ b/kernel/trace/trace_events_user.c
@@ -835,7 +835,7 @@ void user_event_mm_remove(struct task_struct *t)
 	 * so we use a work queue after call_rcu() to run within.
 	 */
 	INIT_RCU_WORK(&mm->put_rwork, delayed_user_event_mm_put);
-	queue_rcu_work(system_wq, &mm->put_rwork);
+	queue_rcu_work(system_percpu_wq, &mm->put_rwork);
 }
 
 void user_event_mm_dup(struct task_struct *t, struct user_event_mm *old_mm)
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index cf6203282737..7ad4fecde6f4 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -503,8 +503,8 @@ static struct workqueue_attrs *ordered_wq_attrs[NR_STD_WORKER_POOLS];
  */
 static struct kthread_worker *pwq_release_worker __ro_after_init;
 
-struct workqueue_struct *system_wq __ro_after_init;
-EXPORT_SYMBOL(system_wq);
+struct workqueue_struct *system_percpu_wq __ro_after_init;
+EXPORT_SYMBOL(system_percpu_wq);
 struct workqueue_struct *system_highpri_wq __ro_after_init;
 EXPORT_SYMBOL_GPL(system_highpri_wq);
 struct workqueue_struct *system_long_wq __ro_after_init;
@@ -7656,7 +7656,7 @@ static int wq_watchdog_param_set_thresh(const char *val,
 	if (ret)
 		return ret;
 
-	if (system_wq)
+	if (system_percpu_wq)
 		wq_watchdog_set_thresh(thresh);
 	else
 		wq_watchdog_thresh = thresh;
@@ -7815,7 +7815,7 @@ void __init workqueue_init_early(void)
 		ordered_wq_attrs[i] = attrs;
 	}
 
-	system_wq = alloc_workqueue("events", 0, 0);
+	system_percpu_wq = alloc_workqueue("events", 0, 0);
 	system_highpri_wq = alloc_workqueue("events_highpri", WQ_HIGHPRI, 0);
 	system_long_wq = alloc_workqueue("events_long", 0, 0);
 	system_unbound_wq = alloc_workqueue("events_unbound", WQ_UNBOUND,
@@ -7830,7 +7830,7 @@ void __init workqueue_init_early(void)
 	system_bh_wq = alloc_workqueue("events_bh", WQ_BH, 0);
 	system_bh_highpri_wq = alloc_workqueue("events_bh_highpri",
 					       WQ_BH | WQ_HIGHPRI, 0);
-	BUG_ON(!system_wq || !system_highpri_wq || !system_long_wq ||
+	BUG_ON(!system_percpu_wq || !system_highpri_wq || !system_long_wq ||
 	       !system_unbound_wq || !system_freezable_wq ||
 	       !system_power_efficient_wq ||
 	       !system_freezable_power_efficient_wq ||
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 783904d8c5ef..784605103202 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -966,7 +966,7 @@ static int __init cgwb_init(void)
 {
 	/*
 	 * There can be many concurrent release work items overwhelming
-	 * system_wq.  Put them in a separate wq and limit concurrency.
+	 * system_percpu_wq.  Put them in a separate wq and limit concurrency.
 	 * There's no point in executing many of these in parallel.
 	 */
 	cgwb_release_wq = alloc_workqueue("cgwb_release", 0, 1);
diff --git a/net/bridge/br_cfm.c b/net/bridge/br_cfm.c
index a3c755d0a09d..c2c1c7d44c61 100644
--- a/net/bridge/br_cfm.c
+++ b/net/bridge/br_cfm.c
@@ -134,7 +134,7 @@ static void ccm_rx_timer_start(struct br_cfm_peer_mep *peer_mep)
 	 * of the configured CC 'expected_interval'
 	 * in order to detect CCM defect after 3.25 interval.
 	 */
-	queue_delayed_work(system_wq, &peer_mep->ccm_rx_dwork,
+	queue_delayed_work(system_percpu_wq, &peer_mep->ccm_rx_dwork,
 			   usecs_to_jiffies(interval_us / 4));
 }
 
@@ -285,7 +285,7 @@ static void ccm_tx_work_expired(struct work_struct *work)
 		ccm_frame_tx(skb);
 
 	interval_us = interval_to_us(mep->cc_config.exp_interval);
-	queue_delayed_work(system_wq, &mep->ccm_tx_dwork,
+	queue_delayed_work(system_percpu_wq, &mep->ccm_tx_dwork,
 			   usecs_to_jiffies(interval_us));
 }
 
@@ -809,7 +809,7 @@ int br_cfm_cc_ccm_tx(struct net_bridge *br, const u32 instance,
 	 * to send first frame immediately
 	 */
 	mep->ccm_tx_end = jiffies + usecs_to_jiffies(tx_info->period * 1000000);
-	queue_delayed_work(system_wq, &mep->ccm_tx_dwork, 0);
+	queue_delayed_work(system_percpu_wq, &mep->ccm_tx_dwork, 0);
 
 save:
 	mep->cc_ccm_tx_info = *tx_info;
diff --git a/net/bridge/br_mrp.c b/net/bridge/br_mrp.c
index fd2de35ffb3c..3c36fa24bc05 100644
--- a/net/bridge/br_mrp.c
+++ b/net/bridge/br_mrp.c
@@ -341,7 +341,7 @@ static void br_mrp_test_work_expired(struct work_struct *work)
 out:
 	rcu_read_unlock();
 
-	queue_delayed_work(system_wq, &mrp->test_work,
+	queue_delayed_work(system_percpu_wq, &mrp->test_work,
 			   usecs_to_jiffies(mrp->test_interval));
 }
 
@@ -418,7 +418,7 @@ static void br_mrp_in_test_work_expired(struct work_struct *work)
 out:
 	rcu_read_unlock();
 
-	queue_delayed_work(system_wq, &mrp->in_test_work,
+	queue_delayed_work(system_percpu_wq, &mrp->in_test_work,
 			   usecs_to_jiffies(mrp->in_test_interval));
 }
 
@@ -725,7 +725,7 @@ int br_mrp_start_test(struct net_bridge *br,
 	mrp->test_max_miss = test->max_miss;
 	mrp->test_monitor = test->monitor;
 	mrp->test_count_miss = 0;
-	queue_delayed_work(system_wq, &mrp->test_work,
+	queue_delayed_work(system_percpu_wq, &mrp->test_work,
 			   usecs_to_jiffies(test->interval));
 
 	return 0;
@@ -865,7 +865,7 @@ int br_mrp_start_in_test(struct net_bridge *br,
 	mrp->in_test_end = jiffies + usecs_to_jiffies(in_test->period);
 	mrp->in_test_max_miss = in_test->max_miss;
 	mrp->in_test_count_miss = 0;
-	queue_delayed_work(system_wq, &mrp->in_test_work,
+	queue_delayed_work(system_percpu_wq, &mrp->in_test_work,
 			   usecs_to_jiffies(in_test->interval));
 
 	return 0;
diff --git a/net/ceph/mon_client.c b/net/ceph/mon_client.c
index ab66b599ac47..c227ececa925 100644
--- a/net/ceph/mon_client.c
+++ b/net/ceph/mon_client.c
@@ -314,7 +314,7 @@ static void __schedule_delayed(struct ceph_mon_client *monc)
 		delay = CEPH_MONC_PING_INTERVAL;
 
 	dout("__schedule_delayed after %lu\n", delay);
-	mod_delayed_work(system_wq, &monc->delayed_work,
+	mod_delayed_work(system_percpu_wq, &monc->delayed_work,
 			 round_jiffies_relative(delay));
 }
 
diff --git a/net/core/skmsg.c b/net/core/skmsg.c
index 0ddc4c718833..83fc433f5461 100644
--- a/net/core/skmsg.c
+++ b/net/core/skmsg.c
@@ -855,7 +855,7 @@ void sk_psock_drop(struct sock *sk, struct sk_psock *psock)
 	sk_psock_stop(psock);
 
 	INIT_RCU_WORK(&psock->rwork, sk_psock_destroy);
-	queue_rcu_work(system_wq, &psock->rwork);
+	queue_rcu_work(system_percpu_wq, &psock->rwork);
 }
 EXPORT_SYMBOL_GPL(sk_psock_drop);
 
diff --git a/net/devlink/core.c b/net/devlink/core.c
index 7203c39532fc..58093f49c090 100644
--- a/net/devlink/core.c
+++ b/net/devlink/core.c
@@ -320,7 +320,7 @@ static void devlink_release(struct work_struct *work)
 void devlink_put(struct devlink *devlink)
 {
 	if (refcount_dec_and_test(&devlink->refcount))
-		queue_rcu_work(system_wq, &devlink->rwork);
+		queue_rcu_work(system_percpu_wq, &devlink->rwork);
 }
 
 struct devlink *devlinks_xa_find_get(struct net *net, unsigned long *indexp)
diff --git a/net/ipv4/inet_fragment.c b/net/ipv4/inet_fragment.c
index 470ab17ceb51..025895eb6ec5 100644
--- a/net/ipv4/inet_fragment.c
+++ b/net/ipv4/inet_fragment.c
@@ -183,7 +183,7 @@ static void fqdir_work_fn(struct work_struct *work)
 	rhashtable_free_and_destroy(&fqdir->rhashtable, inet_frags_free_cb, NULL);
 
 	if (llist_add(&fqdir->free_list, &fqdir_free_list))
-		queue_delayed_work(system_wq, &fqdir_free_work, HZ);
+		queue_delayed_work(system_percpu_wq, &fqdir_free_work, HZ);
 }
 
 int fqdir_init(struct fqdir **fqdirp, struct inet_frags *f, struct net *net)
diff --git a/net/netfilter/nf_conntrack_ecache.c b/net/netfilter/nf_conntrack_ecache.c
index af68c64acaab..81baf2082604 100644
--- a/net/netfilter/nf_conntrack_ecache.c
+++ b/net/netfilter/nf_conntrack_ecache.c
@@ -301,7 +301,7 @@ void nf_conntrack_ecache_work(struct net *net, enum nf_ct_ecache_state state)
 		net->ct.ecache_dwork_pending = true;
 	} else if (state == NFCT_ECACHE_DESTROY_SENT) {
 		if (!hlist_nulls_empty(&cnet->ecache.dying_list))
-			mod_delayed_work(system_wq, &cnet->ecache.dwork, 0);
+			mod_delayed_work(system_percpu_wq, &cnet->ecache.dwork, 0);
 		else
 			net->ct.ecache_dwork_pending = false;
 	}
diff --git a/net/openvswitch/dp_notify.c b/net/openvswitch/dp_notify.c
index 7af0cde8b293..a2af90ee99af 100644
--- a/net/openvswitch/dp_notify.c
+++ b/net/openvswitch/dp_notify.c
@@ -75,7 +75,7 @@ static int dp_device_event(struct notifier_block *unused, unsigned long event,
 
 		/* schedule vport destroy, dev_put and genl notification */
 		ovs_net = net_generic(dev_net(dev), ovs_net_id);
-		queue_work(system_wq, &ovs_net->dp_notify_work);
+		queue_work(system_percpu_wq, &ovs_net->dp_notify_work);
 	}
 
 	return NOTIFY_DONE;
diff --git a/net/rfkill/input.c b/net/rfkill/input.c
index 598d0a61bda7..53d286b10843 100644
--- a/net/rfkill/input.c
+++ b/net/rfkill/input.c
@@ -159,7 +159,7 @@ static void rfkill_schedule_global_op(enum rfkill_sched_op op)
 	rfkill_op_pending = true;
 	if (op == RFKILL_GLOBAL_OP_EPO && !rfkill_is_epo_lock_active()) {
 		/* bypass the limiter for EPO */
-		mod_delayed_work(system_wq, &rfkill_op_work, 0);
+		mod_delayed_work(system_percpu_wq, &rfkill_op_work, 0);
 		rfkill_last_scheduled = jiffies;
 	} else
 		rfkill_schedule_ratelimited();
diff --git a/net/smc/smc_core.c b/net/smc/smc_core.c
index ac07b963aede..ab870109f916 100644
--- a/net/smc/smc_core.c
+++ b/net/smc/smc_core.c
@@ -85,7 +85,7 @@ static void smc_lgr_schedule_free_work(struct smc_link_group *lgr)
 	 * otherwise there is a risk of out-of-sync link groups.
 	 */
 	if (!lgr->freeing) {
-		mod_delayed_work(system_wq, &lgr->free_work,
+		mod_delayed_work(system_percpu_wq, &lgr->free_work,
 				 (!lgr->is_smcd && lgr->role == SMC_CLNT) ?
 						SMC_LGR_FREE_DELAY_CLNT :
 						SMC_LGR_FREE_DELAY_SERV);
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index fc6afbc8d680..f8798d7b5de7 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -1569,7 +1569,7 @@ static int vsock_connect(struct socket *sock, struct sockaddr *addr,
 			 * reschedule it, then ungrab the socket refcount to
 			 * keep it balanced.
 			 */
-			if (mod_delayed_work(system_wq, &vsk->connect_work,
+			if (mod_delayed_work(system_percpu_wq, &vsk->connect_work,
 					     timeout))
 				sock_put(sk);
 
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index f98bd02b838f..7c7e99a8c033 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -633,15 +633,15 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     }
 }
 
-/// Returns the system work queue (`system_wq`).
+/// Returns the system work queue (`system_percpu_wq`).
 ///
 /// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU multi-threaded. There are
 /// users which expect relatively short queue flush time.
 ///
 /// Callers shouldn't queue work items which can run for too long.
 pub fn system() -> &'static Queue {
-    // SAFETY: `system_wq` is a C global, always available.
-    unsafe { Queue::from_raw(bindings::system_wq) }
+    // SAFETY: `system_percpu_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_percpu_wq) }
 }
 
 /// Returns the system high-priority work queue (`system_highpri_wq`).
diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index ad16ab6812cd..e61c58dcd606 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -779,7 +779,7 @@ static void aw88081_start(struct aw88081 *aw88081, bool sync_start)
 	if (sync_start == AW88081_SYNC_START)
 		aw88081_start_pa(aw88081);
 	else
-		queue_delayed_work(system_wq,
+		queue_delayed_work(system_percpu_wq,
 			&aw88081->start_work,
 			AW88081_START_WORK_DELAY_MS);
 }
diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 6c50c4a18b6a..c9c3ebb9a739 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -1313,7 +1313,7 @@ static void aw88166_start(struct aw88166 *aw88166, bool sync_start)
 	if (sync_start == AW88166_SYNC_START)
 		aw88166_start_pa(aw88166);
 	else
-		queue_delayed_work(system_wq,
+		queue_delayed_work(system_percpu_wq,
 			&aw88166->start_work,
 			AW88166_START_WORK_DELAY_MS);
 }
diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index fb99871578c5..c8e62af8949e 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -705,7 +705,7 @@ static void aw88261_start(struct aw88261 *aw88261, bool sync_start)
 	if (sync_start == AW88261_SYNC_START)
 		aw88261_start_pa(aw88261);
 	else
-		queue_delayed_work(system_wq,
+		queue_delayed_work(system_percpu_wq,
 			&aw88261->start_work,
 			AW88261_START_WORK_DELAY_MS);
 }
diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index aea44a199b98..c6fe69cc5e73 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -75,7 +75,7 @@ static void aw88395_start(struct aw88395 *aw88395, bool sync_start)
 	if (sync_start == AW88395_SYNC_START)
 		aw88395_start_pa(aw88395);
 	else
-		queue_delayed_work(system_wq,
+		queue_delayed_work(system_percpu_wq,
 			&aw88395->start_work,
 			AW88395_START_WORK_DELAY_MS);
 }
diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index ee3cc2a95f85..dfa8ce355e3c 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -1281,7 +1281,7 @@ static void aw88399_start(struct aw88399 *aw88399, bool sync_start)
 	if (sync_start == AW88399_SYNC_START)
 		aw88399_start_pa(aw88399);
 	else
-		queue_delayed_work(system_wq,
+		queue_delayed_work(system_percpu_wq,
 			&aw88399->start_work,
 			AW88399_START_WORK_DELAY_MS);
 }
diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index ac19a572fe70..38c73c8dcc45 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -301,7 +301,7 @@ irqreturn_t cs42l43_bias_detect_clamp(int irq, void *data)
 {
 	struct cs42l43_codec *priv = data;
 
-	queue_delayed_work(system_wq, &priv->bias_sense_timeout,
+	queue_delayed_work(system_percpu_wq, &priv->bias_sense_timeout,
 			   msecs_to_jiffies(1000));
 
 	return IRQ_HANDLED;
@@ -432,7 +432,7 @@ irqreturn_t cs42l43_button_press(int irq, void *data)
 	struct cs42l43_codec *priv = data;
 
 	// Wait for 2 full cycles of comb filter to ensure good reading
-	queue_delayed_work(system_wq, &priv->button_press_work,
+	queue_delayed_work(system_percpu_wq, &priv->button_press_work,
 			   msecs_to_jiffies(20));
 
 	return IRQ_HANDLED;
@@ -470,7 +470,7 @@ irqreturn_t cs42l43_button_release(int irq, void *data)
 {
 	struct cs42l43_codec *priv = data;
 
-	queue_work(system_wq, &priv->button_release_work);
+	queue_work(system_percpu_wq, &priv->button_release_work);
 
 	return IRQ_HANDLED;
 }
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index ea84ac64c775..105ad53bae0c 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -161,7 +161,7 @@ static void cs42l43_hp_ilimit_clear_work(struct work_struct *work)
 	priv->hp_ilimit_count--;
 
 	if (priv->hp_ilimit_count)
-		queue_delayed_work(system_wq, &priv->hp_ilimit_clear_work,
+		queue_delayed_work(system_percpu_wq, &priv->hp_ilimit_clear_work,
 				   msecs_to_jiffies(CS42L43_HP_ILIMIT_DECAY_MS));
 
 	snd_soc_dapm_mutex_unlock(dapm);
@@ -178,7 +178,7 @@ static void cs42l43_hp_ilimit_work(struct work_struct *work)
 
 	if (priv->hp_ilimit_count < CS42L43_HP_ILIMIT_MAX_COUNT) {
 		if (!priv->hp_ilimit_count)
-			queue_delayed_work(system_wq, &priv->hp_ilimit_clear_work,
+			queue_delayed_work(system_percpu_wq, &priv->hp_ilimit_clear_work,
 					   msecs_to_jiffies(CS42L43_HP_ILIMIT_DECAY_MS));
 
 		priv->hp_ilimit_count++;
diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 066d92b54312..4ba4de184d2c 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -812,12 +812,12 @@ static void es8326_jack_button_handler(struct work_struct *work)
 			press_count = 0;
 		}
 		button_to_report = cur_button;
-		queue_delayed_work(system_wq, &es8326->button_press_work,
+		queue_delayed_work(system_percpu_wq, &es8326->button_press_work,
 				   msecs_to_jiffies(35));
 	} else if (prev_button != cur_button) {
 		/* mismatch, detect again */
 		prev_button = cur_button;
-		queue_delayed_work(system_wq, &es8326->button_press_work,
+		queue_delayed_work(system_percpu_wq, &es8326->button_press_work,
 				   msecs_to_jiffies(35));
 	} else {
 		/* released or no pressed */
@@ -912,7 +912,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x1f);
 			regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x0f, 0x0d);
-			queue_delayed_work(system_wq, &es8326->jack_detect_work,
+			queue_delayed_work(system_percpu_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
 			goto exit;
@@ -923,7 +923,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			regmap_write(es8326->regmap, ES8326_INT_SOURCE,
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			es8326_enable_micbias(es8326->component);
-			queue_delayed_work(system_wq, &es8326->button_press_work, 10);
+			queue_delayed_work(system_percpu_wq, &es8326->button_press_work, 10);
 			goto exit;
 		}
 		if ((iface & ES8326_HPBUTTON_FLAG) == 0x01) {
@@ -958,10 +958,10 @@ static irqreturn_t es8326_irq(int irq, void *dev_id)
 		goto out;
 
 	if (es8326->jack->status & SND_JACK_HEADSET)
-		queue_delayed_work(system_wq, &es8326->jack_detect_work,
+		queue_delayed_work(system_percpu_wq, &es8326->jack_detect_work,
 				   msecs_to_jiffies(10));
 	else
-		queue_delayed_work(system_wq, &es8326->jack_detect_work,
+		queue_delayed_work(system_percpu_wq, &es8326->jack_detect_work,
 				   msecs_to_jiffies(300));
 
 out:
diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 45057562c0c8..44cfec76ad96 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -1859,7 +1859,7 @@ static irqreturn_t rt5663_irq(int irq, void *data)
 	dev_dbg(regmap_get_device(rt5663->regmap), "%s IRQ queue work\n",
 		__func__);
 
-	queue_delayed_work(system_wq, &rt5663->jack_detect_work,
+	queue_delayed_work(system_percpu_wq, &rt5663->jack_detect_work,
 		msecs_to_jiffies(250));
 
 	return IRQ_HANDLED;
@@ -1974,7 +1974,7 @@ static void rt5663_jack_detect_work(struct work_struct *work)
 				cancel_delayed_work_sync(
 					&rt5663->jd_unplug_work);
 			} else {
-				queue_delayed_work(system_wq,
+				queue_delayed_work(system_percpu_wq,
 					&rt5663->jd_unplug_work,
 					msecs_to_jiffies(500));
 			}
@@ -2024,7 +2024,7 @@ static void rt5663_jd_unplug_work(struct work_struct *work)
 				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 				    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 	} else {
-		queue_delayed_work(system_wq, &rt5663->jd_unplug_work,
+		queue_delayed_work(system_percpu_wq, &rt5663->jd_unplug_work,
 			msecs_to_jiffies(500));
 	}
 }
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index a0b3679b17b4..e60dd85f5552 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -163,7 +163,7 @@ static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
 
 	priv->speaker_en = !SND_SOC_DAPM_EVENT_ON(event);
 
-	queue_delayed_work(system_wq, &priv->pcm_pop_work, msecs_to_jiffies(70));
+	queue_delayed_work(system_percpu_wq, &priv->pcm_pop_work, msecs_to_jiffies(70));
 	return 0;
 }
 
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 385e5339f0a4..207eb18560dd 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -329,7 +329,7 @@ int cnl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 	 * CTX_SAVE IPC, which is sent before the DSP enters D3.
 	 */
 	if (hdr->cmd != (SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CTX_SAVE))
-		mod_delayed_work(system_wq, &hdev->d0i3_work,
+		mod_delayed_work(system_percpu_wq, &hdev->d0i3_work,
 				 msecs_to_jiffies(SOF_HDA_D0I3_WORK_DELAY_MS));
 
 	return 0;
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index f3fbf43a70c2..d8fde18145b4 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -96,7 +96,7 @@ void hda_dsp_ipc4_schedule_d0i3_work(struct sof_intel_hda_dev *hdev,
 	if (hda_dsp_ipc4_pm_msg(msg_data->primary))
 		return;
 
-	mod_delayed_work(system_wq, &hdev->d0i3_work,
+	mod_delayed_work(system_percpu_wq, &hdev->d0i3_work,
 			 msecs_to_jiffies(SOF_HDA_D0I3_WORK_DELAY_MS));
 }
 EXPORT_SYMBOL_NS(hda_dsp_ipc4_schedule_d0i3_work, "SND_SOC_SOF_INTEL_HDA_COMMON");
-- 
2.49.0

