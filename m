Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232341B0F2C
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 08:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746260940; cv=none; b=OX1UwNg3UKbWYOJDKgV5Ka4QKcA1szi7+/yenGlG8uqp75apUEEZecS9GUX2ron4Qq0fQ21IJ44V8PbXyEUmF8XIOn6X+62+Y4i8FPTlaRPygUInsMUz7zgGKWvWssyoHCBaafR0lyO5NXEcTUq2DewC3u4AWTDmT4G938lPI58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746260940; c=relaxed/simple;
	bh=1hPUiF6WJcbMC0+eRxIpeVyF1+lwcsqsF/u+Eem+y6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3ETAF71PfsxAQWHEUenEZPgoul/0DjjqtlmL7OEfabOaTOQSvBcwBltlyHm4p8xO7tIEK6Gx8HdPoZGxv03o+7Q57RctlREO92xkeuaI0XP25aE6bdZPArcmbTXmJMZDqS2wvCfkUPmeVTocL2ftsX2rYwqxjBfq6cAXKbWw50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KKER364G; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KKER364G"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43690d4605dso19692305e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 01:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746260934; x=1746865734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrMBRR6Ee240l4K7GD1oxiK4+VmCoHkS9twZnfZkQ9Q=;
        b=KKER364G4aCEWdzCUB39wjUmihXP7mzvhzchrnNvK8i8vt0euI/wN18310gwMrMh+J
         6LNqdWV8eH6wTe6WlNbc8eqNlpo5KM7PKMxaHSTSun+rN4/exY+/pGI+W5pmDcDWrQ8p
         faHbckxAL/ft/TtTzsZJgjD0a/zI5/7qjfgEIKWHmlaxGghhqVKgrcSKXTdOj/1R/ep8
         PSZLF+1AbNy2+19ZR3DP/GbDwFvaj+Iv6bRqMhIK5muhKlOo1whYhgDHGTzGOlIVqCO1
         TP1jvWAP5ArMYnHAn9S2falvk6UmlGKZ3sMjq9lDP+J63+1OJXWzkadMi7fBUKnek4HJ
         yr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746260934; x=1746865734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrMBRR6Ee240l4K7GD1oxiK4+VmCoHkS9twZnfZkQ9Q=;
        b=M3jOwdYStPb2ajdij5i7xWjC0ChNHYoh1KzyWroJ6QJ/W8gHF6W0Z6MkbehBKajUuE
         yy3/qh9aD3VAymy6pkmH5xRIUe8TBR5nzxNZkpNZkR2uvaqcFbIwlMDk3PQxCs4o/0ct
         D/Kbi0oLBj5M+hCOULYDv3NB2zf4a64AStEmzqYc0c2xsDLiKfzX+sOSm+AcYONmtNqe
         jK7MQbA2ogZNMzWTJZ1fMnTr3heQum88jn15hosh3A1a6oLdOcsNHTTL9nxHdMo8tVvI
         VxwYec10TCfvDw4Z/9SLWwzHJisvUb771XLiRaxVUioXN9+8YN5d5t3WJycCeMXmcNpd
         gU7w==
X-Gm-Message-State: AOJu0YzA0OA/ZKwDQ9Jr6fF0Pj3qJPq4J5WlAVHuLYPyEOcAnhZg2Tiz
	Tso32NOy7WkhBvpCoec23O/MQo1O4Uf9K5AloUTLuPgyDGNiX17t+PurZPVIpMC/LRw+zm2Jnr2
	A
X-Gm-Gg: ASbGnctXQFBRmxxJ09WH2K2Dppaq4WsTy4FR7m7A3Le2InTsLt42Dg4wnkMkKhFxfxQ
	4xkn5K//4CwLOmvSV6EdiFHD83mwDPYkGo8VpqBvkcPq7n3/kd75qR7Zj3CPVYvwNjkFP/CJ6wB
	ujNzYVDQUs9b/V+B29775CgmR4HxjqM2Y0McX3Jo2Jp88AO7Tj+VzThwldPx3oAbTozuek2HNKf
	d1D2ixpdNAJDNiQ6gG4Kyt7MlAa4R0T8LyYLvz8eBS9cmB7SeBGXFRmYNEjTsvGCjhUq5jctP+Q
	fimrSQ1RHuYEz0QRrezTqf/s9unXLVDFntTL4RBvbj6XtXDy
X-Google-Smtp-Source: AGHT+IG+SYTVfjjsRx7iO9tyY4iy2VrD0khNfZi+WLkKyzOi2QLHX2k/20zI5M4AgsHawVHcbX28WA==
X-Received: by 2002:a05:600c:1c88:b0:440:6a1a:d8a0 with SMTP id 5b1f17b1804b1-441c48b01bamr2330855e9.7.1746260933326;
        Sat, 03 May 2025 01:28:53 -0700 (PDT)
Received: from linux.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc441sm68633445e9.3.2025.05.03.01.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 01:28:52 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: [PATCH 2/4] Workqueue: rename system_unbound_wq to system_dfl_wq
Date: Sat,  3 May 2025 10:28:32 +0200
Message-ID: <20250503082834.49413-3-marco.crivellari@suse.com>
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

system_unbound_wq should be the default workqueue so as not to
enforce locality constraints for random work whenever it's not
required.

Rename this workqueue to encourage its use by default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/accel/ivpu/ivpu_pm.c                         |  2 +-
 drivers/acpi/scan.c                                  |  2 +-
 drivers/base/dd.c                                    |  2 +-
 drivers/block/zram/zram_drv.c                        |  2 +-
 drivers/char/random.c                                |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/aldebaran.c               |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c            |  2 +-
 drivers/gpu/drm/drm_atomic_helper.c                  |  6 +++---
 drivers/gpu/drm/i915/display/intel_display_power.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_tc.c              |  4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c         |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c               |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c            |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    |  6 +++---
 drivers/gpu/drm/i915/i915_active.c                   |  2 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.c            |  2 +-
 drivers/gpu/drm/i915/i915_vma_resource.c             |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c                 |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c             |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c              |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c          |  2 +-
 drivers/gpu/drm/xe/xe_devcoredump.c                  |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c                     |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                       |  4 ++--
 drivers/gpu/drm/xe/xe_oa.c                           |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                           |  4 ++--
 drivers/hte/hte.c                                    |  2 +-
 drivers/infiniband/core/ucma.c                       |  2 +-
 drivers/infiniband/hw/mlx5/odp.c                     |  4 ++--
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c |  8 ++++----
 drivers/net/macvlan.c                                |  2 +-
 drivers/net/netdevsim/dev.c                          |  6 +++---
 drivers/net/wireless/intel/iwlwifi/fw/dbg.c          |  4 ++--
 drivers/net/wireless/intel/iwlwifi/iwl-trans.h       |  2 +-
 drivers/scsi/qla2xxx/qla_os.c                        |  2 +-
 drivers/scsi/scsi_transport_iscsi.c                  |  2 +-
 drivers/soc/xilinx/zynqmp_power.c                    |  6 +++---
 drivers/target/sbp/sbp_target.c                      |  8 ++++----
 drivers/tty/serial/8250/8250_dw.c                    |  4 ++--
 drivers/tty/tty_buffer.c                             |  8 ++++----
 fs/afs/callback.c                                    |  4 ++--
 fs/afs/write.c                                       |  2 +-
 fs/bcachefs/btree_write_buffer.c                     |  2 +-
 fs/bcachefs/io_read.c                                | 12 ++++++------
 fs/bcachefs/journal_io.c                             |  2 +-
 fs/btrfs/block-group.c                               |  2 +-
 fs/btrfs/extent_map.c                                |  2 +-
 fs/btrfs/space-info.c                                |  4 ++--
 fs/btrfs/zoned.c                                     |  2 +-
 fs/ext4/mballoc.c                                    |  2 +-
 fs/netfs/objects.c                                   |  2 +-
 fs/netfs/read_collect.c                              |  2 +-
 fs/netfs/write_collect.c                             |  2 +-
 fs/nfsd/filecache.c                                  |  2 +-
 fs/notify/mark.c                                     |  4 ++--
 fs/quota/dquot.c                                     |  2 +-
 include/linux/workqueue.h                            |  8 ++++----
 io_uring/io_uring.c                                  |  2 +-
 kernel/bpf/helpers.c                                 |  4 ++--
 kernel/bpf/memalloc.c                                |  2 +-
 kernel/bpf/syscall.c                                 |  2 +-
 kernel/padata.c                                      |  4 ++--
 kernel/sched/core.c                                  |  4 ++--
 kernel/sched/ext.c                                   |  4 ++--
 kernel/umh.c                                         |  2 +-
 kernel/workqueue.c                                   | 10 +++++-----
 mm/backing-dev.c                                     |  2 +-
 mm/kfence/core.c                                     |  6 +++---
 mm/memcontrol.c                                      |  4 ++--
 net/core/link_watch.c                                |  4 ++--
 net/unix/garbage.c                                   |  2 +-
 net/wireless/core.c                                  |  4 ++--
 net/wireless/sysfs.c                                 |  2 +-
 rust/kernel/workqueue.rs                             |  6 +++---
 sound/soc/codecs/wm_adsp.c                           |  2 +-
 76 files changed, 130 insertions(+), 130 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 0c1f639931ad..f6a5c494621e 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -181,7 +181,7 @@ void ivpu_pm_trigger_recovery(struct ivpu_device *vdev, const char *reason)
 	if (atomic_cmpxchg(&vdev->pm->reset_pending, 0, 1) == 0) {
 		ivpu_hw_diagnose_failure(vdev);
 		ivpu_hw_irq_disable(vdev); /* Disable IRQ early to protect from IRQ storm */
-		queue_work(system_unbound_wq, &vdev->pm->recovery_work);
+		queue_work(system_dfl_wq, &vdev->pm->recovery_work);
 	}
 }
 
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..14fbac0b65c8 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2389,7 +2389,7 @@ static bool acpi_scan_clear_dep_queue(struct acpi_device *adev)
 	 * initial enumeration of devices is complete, put it into the unbound
 	 * workqueue.
 	 */
-	queue_work(system_unbound_wq, &cdw->work);
+	queue_work(system_dfl_wq, &cdw->work);
 
 	return true;
 }
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index f0e4b4aba885..fc778ed5552d 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -192,7 +192,7 @@ void driver_deferred_probe_trigger(void)
 	 * Kick the re-probe thread.  It may already be scheduled, but it is
 	 * safe to kick it again.
 	 */
-	queue_work(system_unbound_wq, &deferred_probe_work);
+	queue_work(system_dfl_wq, &deferred_probe_work);
 }
 
 /**
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index fda7d8624889..c7e0fa29a572 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -975,7 +975,7 @@ static int read_from_bdev_sync(struct zram *zram, struct page *page,
 	work.entry = entry;
 
 	INIT_WORK_ONSTACK(&work.work, zram_sync_read);
-	queue_work(system_unbound_wq, &work.work);
+	queue_work(system_dfl_wq, &work.work);
 	flush_work(&work.work);
 	destroy_work_on_stack(&work.work);
 
diff --git a/drivers/char/random.c b/drivers/char/random.c
index 38f2fab29c56..97435cd6b819 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -259,8 +259,8 @@ static void crng_reseed(struct work_struct *work)
 	u8 key[CHACHA_KEY_SIZE];
 
 	/* Immediately schedule the next reseeding, so that it fires sooner rather than later. */
-	if (likely(system_unbound_wq))
-		queue_delayed_work(system_unbound_wq, &next_reseed, crng_reseed_interval());
+	if (likely(system_dfl_wq))
+		queue_delayed_work(system_dfl_wq, &next_reseed, crng_reseed_interval());
 
 	extract_entropy(key, sizeof(key));
 
@@ -739,8 +739,8 @@ static void __cold _credit_init_bits(size_t bits)
 
 	if (orig < POOL_READY_BITS && new >= POOL_READY_BITS) {
 		crng_reseed(NULL); /* Sets crng_init to CRNG_READY under base_crng.lock. */
-		if (static_key_initialized && system_unbound_wq)
-			queue_work(system_unbound_wq, &set_ready);
+		if (static_key_initialized && system_dfl_wq)
+			queue_work(system_dfl_wq, &set_ready);
 		atomic_notifier_call_chain(&random_ready_notifier, 0, NULL);
 #ifdef CONFIG_VDSO_GETRANDOM
 		WRITE_ONCE(vdso_k_rng_data->is_ready, true);
diff --git a/drivers/gpu/drm/amd/amdgpu/aldebaran.c b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
index e13fbd974141..d6acacfb6f91 100644
--- a/drivers/gpu/drm/amd/amdgpu/aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
@@ -164,7 +164,7 @@ aldebaran_mode2_perform_reset(struct amdgpu_reset_control *reset_ctl,
 	list_for_each_entry(tmp_adev, reset_device_list, reset_list) {
 		/* For XGMI run all resets in parallel to speed up the process */
 		if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
-			if (!queue_work(system_unbound_wq,
+			if (!queue_work(system_dfl_wq,
 					&tmp_adev->reset_cntl->reset_work))
 				r = -EALREADY;
 		} else
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 96c659389480..14ebfcd1636a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5762,7 +5762,7 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 		list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
 			/* For XGMI run all resets in parallel to speed up the process */
 			if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
-				if (!queue_work(system_unbound_wq,
+				if (!queue_work(system_dfl_wq,
 						&tmp_adev->xgmi_reset_work))
 					r = -EALREADY;
 			} else
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index dabfbdf6f1ce..1596b94b110d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -116,7 +116,7 @@ static int amdgpu_reset_xgmi_reset_on_init_perform_reset(
 	/* Mode1 reset needs to be triggered on all devices together */
 	list_for_each_entry(tmp_adev, reset_device_list, reset_list) {
 		/* For XGMI run all resets in parallel to speed up the process */
-		if (!queue_work(system_unbound_wq, &tmp_adev->xgmi_reset_work))
+		if (!queue_work(system_dfl_wq, &tmp_adev->xgmi_reset_work))
 			r = -EALREADY;
 		if (r) {
 			dev_err(tmp_adev->dev,
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5302ab324898..aa539f316bf8 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2100,13 +2100,13 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	 * current layout.
 	 *
 	 * NOTE: Commit work has multiple phases, first hardware commit, then
-	 * cleanup. We want them to overlap, hence need system_unbound_wq to
+	 * cleanup. We want them to overlap, hence need system_dfl_wq to
 	 * make sure work items don't artificially stall on each another.
 	 */
 
 	drm_atomic_state_get(state);
 	if (nonblock)
-		queue_work(system_unbound_wq, &state->commit_work);
+		queue_work(system_dfl_wq, &state->commit_work);
 	else
 		commit_tail(state);
 
@@ -2139,7 +2139,7 @@ EXPORT_SYMBOL(drm_atomic_helper_commit);
  *
  * Asynchronous workers need to have sufficient parallelism to be able to run
  * different atomic commits on different CRTCs in parallel. The simplest way to
- * achieve this is by running them on the &system_unbound_wq work queue. Note
+ * achieve this is by running them on the &system_dfl_wq work queue. Note
  * that drivers are not required to split up atomic commits and run an
  * individual commit in parallel - userspace is supposed to do that if it cares.
  * But it might be beneficial to do that for modesets, since those necessarily
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index f7171e6932dc..ff5166037ab5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -611,7 +611,7 @@ queue_async_put_domains_work(struct i915_power_domains *power_domains,
 						     power.domains);
 	drm_WARN_ON(display->drm, power_domains->async_put_wakeref);
 	power_domains->async_put_wakeref = wakeref;
-	drm_WARN_ON(display->drm, !queue_delayed_work(system_unbound_wq,
+	drm_WARN_ON(display->drm, !queue_delayed_work(system_dfl_wq,
 						      &power_domains->async_put_work,
 						      msecs_to_jiffies(delay_ms)));
 }
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index b8d14ed8a56e..7de1006f844d 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -1760,7 +1760,7 @@ bool intel_tc_port_link_reset(struct intel_digital_port *dig_port)
 	if (!intel_tc_port_link_needs_reset(dig_port))
 		return false;
 
-	queue_delayed_work(system_unbound_wq,
+	queue_delayed_work(system_dfl_wq,
 			   &to_tc_port(dig_port)->link_reset_work,
 			   msecs_to_jiffies(2000));
 
@@ -1842,7 +1842,7 @@ void intel_tc_port_unlock(struct intel_digital_port *dig_port)
 	struct intel_tc_port *tc = to_tc_port(dig_port);
 
 	if (!tc->link_refcount && tc->mode != TC_PORT_DISCONNECTED)
-		queue_delayed_work(system_unbound_wq, &tc->disconnect_phy_work,
+		queue_delayed_work(system_dfl_wq, &tc->disconnect_phy_work,
 				   msecs_to_jiffies(1000));
 
 	mutex_unlock(&tc->lock);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 2f6b33edb9c9..008d5909a010 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -408,7 +408,7 @@ static void __memcpy_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 
 	if (unlikely(fence->error || I915_SELFTEST_ONLY(fail_gpu_migration))) {
 		INIT_WORK(&copy_work->work, __memcpy_work);
-		queue_work(system_unbound_wq, &copy_work->work);
+		queue_work(system_dfl_wq, &copy_work->work);
 	} else {
 		init_irq_work(&copy_work->irq_work, __memcpy_irq_work);
 		irq_work_queue(&copy_work->irq_work);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 9df80c325fc1..8dbf6c82e241 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -617,7 +617,7 @@ int intel_guc_crash_process_msg(struct intel_guc *guc, u32 action)
 	else
 		guc_err(guc, "Unknown crash notification: 0x%04X\n", action);
 
-	queue_work(system_unbound_wq, &guc->dead_guc_worker);
+	queue_work(system_dfl_wq, &guc->dead_guc_worker);
 
 	return 0;
 }
@@ -639,7 +639,7 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
 		guc_err(guc, "Received early exception notification!\n");
 
 	if (msg & (INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED | INTEL_GUC_RECV_MSG_EXCEPTION))
-		queue_work(system_unbound_wq, &guc->dead_guc_worker);
+		queue_work(system_dfl_wq, &guc->dead_guc_worker);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 0d5197c0824a..2575f380d17d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -30,7 +30,7 @@ static void ct_dead_ct_worker_func(struct work_struct *w);
 	do { \
 		if (!(ct)->dead_ct_reported) { \
 			(ct)->dead_ct_reason |= 1 << CT_DEAD_##reason; \
-			queue_work(system_unbound_wq, &(ct)->dead_ct_worker); \
+			queue_work(system_dfl_wq, &(ct)->dead_ct_worker); \
 		} \
 	} while (0)
 #else
@@ -1240,7 +1240,7 @@ static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *requ
 	list_add_tail(&request->link, &ct->requests.incoming);
 	spin_unlock_irqrestore(&ct->requests.lock, flags);
 
-	queue_work(system_unbound_wq, &ct->requests.worker);
+	queue_work(system_dfl_wq, &ct->requests.worker);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index f8cb7c630d5b..54d17548d4aa 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3385,7 +3385,7 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	} else if (!intel_context_is_closed(ce) && !guc_id_pressure(guc, ce) &&
 		   delay) {
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
-		mod_delayed_work(system_unbound_wq,
+		mod_delayed_work(system_dfl_wq,
 				 &ce->guc_state.sched_disable_delay_work,
 				 msecs_to_jiffies(delay));
 	} else {
@@ -3600,7 +3600,7 @@ static void guc_context_destroy(struct kref *kref)
 	 * take the GT PM for the first time which isn't allowed from an atomic
 	 * context.
 	 */
-	queue_work(system_unbound_wq, &guc->submission_state.destroyed_worker);
+	queue_work(system_dfl_wq, &guc->submission_state.destroyed_worker);
 }
 
 static int guc_context_alloc(struct intel_context *ce)
@@ -5371,7 +5371,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 	 * A GT reset flushes this worker queue (G2H handler) so we must use
 	 * another worker to trigger a GT reset.
 	 */
-	queue_work(system_unbound_wq, &guc->submission_state.reset_fail_worker);
+	queue_work(system_dfl_wq, &guc->submission_state.reset_fail_worker);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 0dbc4e289300..4b7238db08c4 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -193,7 +193,7 @@ active_retire(struct i915_active *ref)
 		return;
 
 	if (ref->flags & I915_ACTIVE_RETIRE_SLEEPS) {
-		queue_work(system_unbound_wq, &ref->work);
+		queue_work(system_dfl_wq, &ref->work);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c b/drivers/gpu/drm/i915/i915_sw_fence_work.c
index d2e56b387993..366418108f78 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
@@ -38,7 +38,7 @@ fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 			if (test_bit(DMA_FENCE_WORK_IMM, &f->dma.flags))
 				fence_work(&f->work);
 			else
-				queue_work(system_unbound_wq, &f->work);
+				queue_work(system_dfl_wq, &f->work);
 		} else {
 			fence_complete(f);
 		}
diff --git a/drivers/gpu/drm/i915/i915_vma_resource.c b/drivers/gpu/drm/i915/i915_vma_resource.c
index 53d619ef0c3d..a8f2112ce81f 100644
--- a/drivers/gpu/drm/i915/i915_vma_resource.c
+++ b/drivers/gpu/drm/i915/i915_vma_resource.c
@@ -202,7 +202,7 @@ i915_vma_resource_fence_notify(struct i915_sw_fence *fence,
 			i915_vma_resource_unbind_work(&vma_res->work);
 		} else {
 			INIT_WORK(&vma_res->work, i915_vma_resource_unbind_work);
-			queue_work(system_unbound_wq, &vma_res->work);
+			queue_work(system_dfl_wq, &vma_res->work);
 		}
 		break;
 	case FENCE_FREE:
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index f8da693ad3ce..df854c961c6e 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -276,7 +276,7 @@ static void pxp_queue_termination(struct intel_pxp *pxp)
 	spin_lock_irq(gt->irq_lock);
 	intel_pxp_mark_termination_in_progress(pxp);
 	pxp->session_events |= PXP_TERMINATION_REQUEST;
-	queue_work(system_unbound_wq, &pxp->session_work);
+	queue_work(system_dfl_wq, &pxp->session_work);
 	spin_unlock_irq(gt->irq_lock);
 }
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
index d81750b9bdda..735325e828bc 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
@@ -48,7 +48,7 @@ void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
 		pxp->session_events |= PXP_TERMINATION_COMPLETE | PXP_EVENT_TYPE_IRQ;
 
 	if (pxp->session_events)
-		queue_work(system_unbound_wq, &pxp->session_work);
+		queue_work(system_dfl_wq, &pxp->session_work);
 }
 
 static inline void __pxp_set_interrupts(struct intel_gt *gt, u32 interrupts)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 504cb3f2054b..d179c81d8306 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2466,7 +2466,7 @@ nv50_disp_atomic_commit(struct drm_device *dev,
 	pm_runtime_get_noresume(dev->dev);
 
 	if (nonblock)
-		queue_work(system_unbound_wq, &state->commit_work);
+		queue_work(system_dfl_wq, &state->commit_work);
 	else
 		nv50_disp_atomic_commit_tail(state);
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index e3596e2b557d..a13098ec5df0 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1771,7 +1771,7 @@ static void vop_handle_vblank(struct vop *vop)
 	spin_unlock(&drm->event_lock);
 
 	if (test_and_clear_bit(VOP_PENDING_FB_UNREF, &vop->pending))
-		drm_flip_work_commit(&vop->fb_unref_work, system_unbound_wq);
+		drm_flip_work_commit(&vop->fb_unref_work, system_dfl_wq);
 }
 
 static irqreturn_t vop_isr(int irq, void *data)
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 81b9d9bb3f57..02ca9abd9e76 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -316,7 +316,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	xe_engine_snapshot_capture_for_queue(q);
 
-	queue_work(system_unbound_wq, &ss->work);
+	queue_work(system_dfl_wq, &ss->work);
 
 	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	dma_fence_end_signalling(cookie);
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 788f56b066b6..171a5796e0fb 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -416,7 +416,7 @@ static void execlist_exec_queue_kill(struct xe_exec_queue *q)
 static void execlist_exec_queue_fini(struct xe_exec_queue *q)
 {
 	INIT_WORK(&q->execlist->fini_async, execlist_exec_queue_fini_async);
-	queue_work(system_unbound_wq, &q->execlist->fini_async);
+	queue_work(system_dfl_wq, &q->execlist->fini_async);
 }
 
 static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 72ad576fc18e..4e239d8195cd 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -472,7 +472,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	spin_lock_irq(&ct->dead.lock);
 	if (ct->dead.reason) {
 		ct->dead.reason |= (1 << CT_DEAD_STATE_REARM);
-		queue_work(system_unbound_wq, &ct->dead.worker);
+		queue_work(system_dfl_wq, &ct->dead.worker);
 	}
 	spin_unlock_irq(&ct->dead.lock);
 #endif
@@ -1811,7 +1811,7 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
 
 	spin_unlock_irqrestore(&ct->dead.lock, flags);
 
-	queue_work(system_unbound_wq, &(ct)->dead.worker);
+	queue_work(system_dfl_wq, &(ct)->dead.worker);
 }
 
 static void ct_dead_print(struct xe_dead_ct *dead)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7ffc98f67e69..1878e50eb687 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -956,7 +956,7 @@ static void xe_oa_config_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	struct xe_oa_fence *ofence = container_of(cb, typeof(*ofence), cb);
 
 	INIT_DELAYED_WORK(&ofence->work, xe_oa_fence_work_fn);
-	queue_delayed_work(system_unbound_wq, &ofence->work,
+	queue_delayed_work(system_dfl_wq, &ofence->work,
 			   usecs_to_jiffies(NOA_PROGRAM_ADDITIONAL_DELAY_US));
 	dma_fence_put(fence);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 60303998bd61..3e25b71749d4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1289,7 +1289,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
 	struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
 
 	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
-	queue_work(system_unbound_wq, &vma->destroy_work);
+	queue_work(system_dfl_wq, &vma->destroy_work);
 }
 
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
@@ -1973,7 +1973,7 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
 	/* To destroy the VM we need to be able to sleep */
-	queue_work(system_unbound_wq, &vm->destroy_work);
+	queue_work(system_dfl_wq, &vm->destroy_work);
 }
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
diff --git a/drivers/hte/hte.c b/drivers/hte/hte.c
index 23a6eeb8c506..e2804636f2bd 100644
--- a/drivers/hte/hte.c
+++ b/drivers/hte/hte.c
@@ -826,7 +826,7 @@ int hte_push_ts_ns(const struct hte_chip *chip, u32 xlated_id,
 
 	ret = ei->cb(data, ei->cl_data);
 	if (ret == HTE_RUN_SECOND_CB && ei->tcb) {
-		queue_work(system_unbound_wq, &ei->cb_work);
+		queue_work(system_dfl_wq, &ei->cb_work);
 		set_bit(HTE_TS_QUEUE_WK, &ei->flags);
 	}
 
diff --git a/drivers/infiniband/core/ucma.c b/drivers/infiniband/core/ucma.c
index 6e700b974033..ccfcf8e4b712 100644
--- a/drivers/infiniband/core/ucma.c
+++ b/drivers/infiniband/core/ucma.c
@@ -361,7 +361,7 @@ static int ucma_event_handler(struct rdma_cm_id *cm_id,
 	if (event->event == RDMA_CM_EVENT_DEVICE_REMOVAL) {
 		xa_lock(&ctx_table);
 		if (xa_load(&ctx_table, ctx->id) == ctx)
-			queue_work(system_unbound_wq, &ctx->close_work);
+			queue_work(system_dfl_wq, &ctx->close_work);
 		xa_unlock(&ctx_table);
 	}
 	return 0;
diff --git a/drivers/infiniband/hw/mlx5/odp.c b/drivers/infiniband/hw/mlx5/odp.c
index 86d8fa63bf69..24efd9a2d82b 100644
--- a/drivers/infiniband/hw/mlx5/odp.c
+++ b/drivers/infiniband/hw/mlx5/odp.c
@@ -253,7 +253,7 @@ static void destroy_unused_implicit_child_mr(struct mlx5_ib_mr *mr)
 
 	/* Freeing a MR is a sleeping operation, so bounce to a work queue */
 	INIT_WORK(&mr->odp_destroy.work, free_implicit_child_mr_work);
-	queue_work(system_unbound_wq, &mr->odp_destroy.work);
+	queue_work(system_dfl_wq, &mr->odp_destroy.work);
 }
 
 static bool mlx5_ib_invalidate_range(struct mmu_interval_notifier *mni,
@@ -2062,6 +2062,6 @@ int mlx5_ib_advise_mr_prefetch(struct ib_pd *pd,
 		destroy_prefetch_work(work);
 		return rc;
 	}
-	queue_work(system_unbound_wq, &work->work);
+	queue_work(system_dfl_wq, &work->work);
 	return 0;
 }
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 3d2913de9a86..8c5142fc80ef 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -1735,7 +1735,7 @@ static void process_signal_change(struct snps_hdmirx_dev *hdmirx_dev)
 			   FIFO_UNDERFLOW_INT_EN |
 			   HDMIRX_AXI_ERROR_INT_EN, 0);
 	hdmirx_reset_dma(hdmirx_dev);
-	queue_delayed_work(system_unbound_wq,
+	queue_delayed_work(system_dfl_wq,
 			   &hdmirx_dev->delayed_work_res_change,
 			   msecs_to_jiffies(50));
 }
@@ -2190,7 +2190,7 @@ static void hdmirx_delayed_work_res_change(struct work_struct *work)
 
 		if (hdmirx_wait_signal_lock(hdmirx_dev)) {
 			hdmirx_plugout(hdmirx_dev);
-			queue_delayed_work(system_unbound_wq,
+			queue_delayed_work(system_dfl_wq,
 					   &hdmirx_dev->delayed_work_hotplug,
 					   msecs_to_jiffies(200));
 		} else {
@@ -2209,7 +2209,7 @@ static irqreturn_t hdmirx_5v_det_irq_handler(int irq, void *dev_id)
 	val = gpiod_get_value(hdmirx_dev->detect_5v_gpio);
 	v4l2_dbg(3, debug, &hdmirx_dev->v4l2_dev, "%s: 5v:%d\n", __func__, val);
 
-	queue_delayed_work(system_unbound_wq,
+	queue_delayed_work(system_dfl_wq,
 			   &hdmirx_dev->delayed_work_hotplug,
 			   msecs_to_jiffies(10));
 
@@ -2441,7 +2441,7 @@ static void hdmirx_enable_irq(struct device *dev)
 	enable_irq(hdmirx_dev->dma_irq);
 	enable_irq(hdmirx_dev->det_irq);
 
-	queue_delayed_work(system_unbound_wq,
+	queue_delayed_work(system_dfl_wq,
 			   &hdmirx_dev->delayed_work_hotplug,
 			   msecs_to_jiffies(110));
 }
diff --git a/drivers/net/macvlan.c b/drivers/net/macvlan.c
index d0dfa6bca6cc..8572748b79f6 100644
--- a/drivers/net/macvlan.c
+++ b/drivers/net/macvlan.c
@@ -369,7 +369,7 @@ static void macvlan_broadcast_enqueue(struct macvlan_port *port,
 	}
 	spin_unlock(&port->bc_queue.lock);
 
-	queue_work(system_unbound_wq, &port->bc_work);
+	queue_work(system_dfl_wq, &port->bc_work);
 
 	if (err)
 		goto free_nskb;
diff --git a/drivers/net/netdevsim/dev.c b/drivers/net/netdevsim/dev.c
index 3e0b61202f0c..0b7c945a0e96 100644
--- a/drivers/net/netdevsim/dev.c
+++ b/drivers/net/netdevsim/dev.c
@@ -836,7 +836,7 @@ static void nsim_dev_trap_report_work(struct work_struct *work)
 	nsim_dev = nsim_trap_data->nsim_dev;
 
 	if (!devl_trylock(priv_to_devlink(nsim_dev))) {
-		queue_delayed_work(system_unbound_wq,
+		queue_delayed_work(system_dfl_wq,
 				   &nsim_dev->trap_data->trap_report_dw, 1);
 		return;
 	}
@@ -852,7 +852,7 @@ static void nsim_dev_trap_report_work(struct work_struct *work)
 		cond_resched();
 	}
 	devl_unlock(priv_to_devlink(nsim_dev));
-	queue_delayed_work(system_unbound_wq,
+	queue_delayed_work(system_dfl_wq,
 			   &nsim_dev->trap_data->trap_report_dw,
 			   msecs_to_jiffies(NSIM_TRAP_REPORT_INTERVAL_MS));
 }
@@ -909,7 +909,7 @@ static int nsim_dev_traps_init(struct devlink *devlink)
 
 	INIT_DELAYED_WORK(&nsim_dev->trap_data->trap_report_dw,
 			  nsim_dev_trap_report_work);
-	queue_delayed_work(system_unbound_wq,
+	queue_delayed_work(system_dfl_wq,
 			   &nsim_dev->trap_data->trap_report_dw,
 			   msecs_to_jiffies(NSIM_TRAP_REPORT_INTERVAL_MS));
 
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/dbg.c b/drivers/net/wireless/intel/iwlwifi/fw/dbg.c
index 03f639fbf9b6..2467b5d56014 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/dbg.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/dbg.c
@@ -2950,7 +2950,7 @@ int iwl_fw_dbg_collect_desc(struct iwl_fw_runtime *fwrt,
 	IWL_WARN(fwrt, "Collecting data: trigger %d fired.\n",
 		 le32_to_cpu(desc->trig_desc.type));
 
-	queue_delayed_work(system_unbound_wq, &wk_data->wk,
+	queue_delayed_work(system_dfl_wq, &wk_data->wk,
 			   usecs_to_jiffies(delay));
 
 	return 0;
@@ -3254,7 +3254,7 @@ int iwl_fw_dbg_ini_collect(struct iwl_fw_runtime *fwrt,
 	if (sync)
 		iwl_fw_dbg_collect_sync(fwrt, idx);
 	else
-		queue_delayed_work(system_unbound_wq,
+		queue_delayed_work(system_dfl_wq,
 				   &fwrt->dump.wks[idx].wk,
 				   usecs_to_jiffies(delay));
 
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-trans.h b/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
index 25fb4c50e38b..29ff021b5779 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
@@ -1163,7 +1163,7 @@ static inline void iwl_trans_schedule_reset(struct iwl_trans *trans,
 	 */
 	trans->restart.during_reset = test_bit(STATUS_IN_SW_RESET,
 					       &trans->status);
-	queue_work(system_unbound_wq, &trans->restart.wk);
+	queue_work(system_dfl_wq, &trans->restart.wk);
 }
 
 static inline void iwl_trans_fw_error(struct iwl_trans *trans,
diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index b44d134e7105..87eeb8607b60 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -5292,7 +5292,7 @@ void qla24xx_sched_upd_fcport(fc_port_t *fcport)
 	qla2x00_set_fcport_disc_state(fcport, DSC_UPD_FCPORT);
 	spin_unlock_irqrestore(&fcport->vha->work_lock, flags);
 
-	queue_work(system_unbound_wq, &fcport->reg_work);
+	queue_work(system_dfl_wq, &fcport->reg_work);
 }
 
 static
diff --git a/drivers/scsi/scsi_transport_iscsi.c b/drivers/scsi/scsi_transport_iscsi.c
index 9c347c64c315..e2754c1cb0a5 100644
--- a/drivers/scsi/scsi_transport_iscsi.c
+++ b/drivers/scsi/scsi_transport_iscsi.c
@@ -3957,7 +3957,7 @@ iscsi_if_recv_msg(struct sk_buff *skb, struct nlmsghdr *nlh, uint32_t *group)
 			list_del_init(&session->sess_list);
 			spin_unlock_irqrestore(&sesslock, flags);
 
-			queue_work(system_unbound_wq, &session->destroy_work);
+			queue_work(system_dfl_wq, &session->destroy_work);
 		}
 		break;
 	case ISCSI_UEVENT_UNBIND_SESSION:
diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index ae59bf16659a..6145c4fe192e 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -82,7 +82,7 @@ static void subsystem_restart_event_callback(const u32 *payload, void *data)
 	memcpy(zynqmp_pm_init_restart_work->args, &payload[0],
 	       sizeof(zynqmp_pm_init_restart_work->args));
 
-	queue_work(system_unbound_wq, &zynqmp_pm_init_restart_work->callback_work);
+	queue_work(system_dfl_wq, &zynqmp_pm_init_restart_work->callback_work);
 }
 
 static void suspend_event_callback(const u32 *payload, void *data)
@@ -95,7 +95,7 @@ static void suspend_event_callback(const u32 *payload, void *data)
 	memcpy(zynqmp_pm_init_suspend_work->args, &payload[1],
 	       sizeof(zynqmp_pm_init_suspend_work->args));
 
-	queue_work(system_unbound_wq, &zynqmp_pm_init_suspend_work->callback_work);
+	queue_work(system_dfl_wq, &zynqmp_pm_init_suspend_work->callback_work);
 }
 
 static irqreturn_t zynqmp_pm_isr(int irq, void *data)
@@ -140,7 +140,7 @@ static void ipi_receive_callback(struct mbox_client *cl, void *data)
 		memcpy(zynqmp_pm_init_suspend_work->args, &payload[1],
 		       sizeof(zynqmp_pm_init_suspend_work->args));
 
-		queue_work(system_unbound_wq,
+		queue_work(system_dfl_wq,
 			   &zynqmp_pm_init_suspend_work->callback_work);
 
 		/* Send NULL message to mbox controller to ack the message */
diff --git a/drivers/target/sbp/sbp_target.c b/drivers/target/sbp/sbp_target.c
index 3b89b5a70331..b8457477cee9 100644
--- a/drivers/target/sbp/sbp_target.c
+++ b/drivers/target/sbp/sbp_target.c
@@ -730,7 +730,7 @@ static int tgt_agent_rw_orb_pointer(struct fw_card *card, int tcode, void *data,
 		pr_debug("tgt_agent ORB_POINTER write: 0x%llx\n",
 				agent->orb_pointer);
 
-		queue_work(system_unbound_wq, &agent->work);
+		queue_work(system_dfl_wq, &agent->work);
 
 		return RCODE_COMPLETE;
 
@@ -764,7 +764,7 @@ static int tgt_agent_rw_doorbell(struct fw_card *card, int tcode, void *data,
 
 		pr_debug("tgt_agent DOORBELL\n");
 
-		queue_work(system_unbound_wq, &agent->work);
+		queue_work(system_dfl_wq, &agent->work);
 
 		return RCODE_COMPLETE;
 
@@ -990,7 +990,7 @@ static void tgt_agent_fetch_work(struct work_struct *work)
 
 		if (tgt_agent_check_active(agent) && !doorbell) {
 			INIT_WORK(&req->work, tgt_agent_process_work);
-			queue_work(system_unbound_wq, &req->work);
+			queue_work(system_dfl_wq, &req->work);
 		} else {
 			/* don't process this request, just check next_ORB */
 			sbp_free_request(req);
@@ -1618,7 +1618,7 @@ static void sbp_mgt_agent_rw(struct fw_card *card,
 		agent->orb_offset = sbp2_pointer_to_addr(ptr);
 		agent->request = req;
 
-		queue_work(system_unbound_wq, &agent->work);
+		queue_work(system_dfl_wq, &agent->work);
 		rcode = RCODE_COMPLETE;
 	} else if (tcode == TCODE_READ_BLOCK_REQUEST) {
 		addr_to_sbp2_pointer(agent->orb_offset, ptr);
diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1902f29444a1..50a5ee546373 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -361,7 +361,7 @@ static int dw8250_clk_notifier_cb(struct notifier_block *nb,
 	 * deferred event handling complication.
 	 */
 	if (event == POST_RATE_CHANGE) {
-		queue_work(system_unbound_wq, &d->clk_work);
+		queue_work(system_dfl_wq, &d->clk_work);
 		return NOTIFY_OK;
 	}
 
@@ -678,7 +678,7 @@ static int dw8250_probe(struct platform_device *pdev)
 		err = clk_notifier_register(data->clk, &data->clk_notifier);
 		if (err)
 			return dev_err_probe(dev, err, "Failed to set the clock notifier\n");
-		queue_work(system_unbound_wq, &data->clk_work);
+		queue_work(system_dfl_wq, &data->clk_work);
 	}
 
 	platform_set_drvdata(pdev, data);
diff --git a/drivers/tty/tty_buffer.c b/drivers/tty/tty_buffer.c
index 79f0ff94ce00..60066ece9d96 100644
--- a/drivers/tty/tty_buffer.c
+++ b/drivers/tty/tty_buffer.c
@@ -76,7 +76,7 @@ void tty_buffer_unlock_exclusive(struct tty_port *port)
 	mutex_unlock(&buf->lock);
 
 	if (restart)
-		queue_work(system_unbound_wq, &buf->work);
+		queue_work(system_dfl_wq, &buf->work);
 }
 EXPORT_SYMBOL_GPL(tty_buffer_unlock_exclusive);
 
@@ -531,7 +531,7 @@ void tty_flip_buffer_push(struct tty_port *port)
 	struct tty_bufhead *buf = &port->buf;
 
 	tty_flip_buffer_commit(buf->tail);
-	queue_work(system_unbound_wq, &buf->work);
+	queue_work(system_dfl_wq, &buf->work);
 }
 EXPORT_SYMBOL(tty_flip_buffer_push);
 
@@ -561,7 +561,7 @@ int tty_insert_flip_string_and_push_buffer(struct tty_port *port,
 		tty_flip_buffer_commit(buf->tail);
 	spin_unlock_irqrestore(&port->lock, flags);
 
-	queue_work(system_unbound_wq, &buf->work);
+	queue_work(system_dfl_wq, &buf->work);
 
 	return size;
 }
@@ -614,7 +614,7 @@ void tty_buffer_set_lock_subclass(struct tty_port *port)
 
 bool tty_buffer_restart_work(struct tty_port *port)
 {
-	return queue_work(system_unbound_wq, &port->buf.work);
+	return queue_work(system_dfl_wq, &port->buf.work);
 }
 
 bool tty_buffer_cancel_work(struct tty_port *port)
diff --git a/fs/afs/callback.c b/fs/afs/callback.c
index 69e1dd55b160..894d2bad6b6c 100644
--- a/fs/afs/callback.c
+++ b/fs/afs/callback.c
@@ -42,7 +42,7 @@ static void afs_volume_init_callback(struct afs_volume *volume)
 	list_for_each_entry(vnode, &volume->open_mmaps, cb_mmap_link) {
 		if (vnode->cb_v_check != atomic_read(&volume->cb_v_break)) {
 			afs_clear_cb_promise(vnode, afs_cb_promise_clear_vol_init_cb);
-			queue_work(system_unbound_wq, &vnode->cb_work);
+			queue_work(system_dfl_wq, &vnode->cb_work);
 		}
 	}
 
@@ -90,7 +90,7 @@ void __afs_break_callback(struct afs_vnode *vnode, enum afs_cb_break_reason reas
 		if (reason != afs_cb_break_for_deleted &&
 		    vnode->status.type == AFS_FTYPE_FILE &&
 		    atomic_read(&vnode->cb_nr_mmap))
-			queue_work(system_unbound_wq, &vnode->cb_work);
+			queue_work(system_dfl_wq, &vnode->cb_work);
 
 		trace_afs_cb_break(&vnode->fid, vnode->cb_break, reason, true);
 	} else {
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 18b0a9f1615e..fe3421435e05 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -172,7 +172,7 @@ static void afs_issue_write_worker(struct work_struct *work)
 void afs_issue_write(struct netfs_io_subrequest *subreq)
 {
 	subreq->work.func = afs_issue_write_worker;
-	if (!queue_work(system_unbound_wq, &subreq->work))
+	if (!queue_work(system_dfl_wq, &subreq->work))
 		WARN_ON_ONCE(1);
 }
 
diff --git a/fs/bcachefs/btree_write_buffer.c b/fs/bcachefs/btree_write_buffer.c
index adbe576ec77e..8b9cd4cfd488 100644
--- a/fs/bcachefs/btree_write_buffer.c
+++ b/fs/bcachefs/btree_write_buffer.c
@@ -822,7 +822,7 @@ int bch2_journal_keys_to_write_buffer_end(struct bch_fs *c, struct journal_keys_
 
 	if (bch2_btree_write_buffer_should_flush(c) &&
 	    __bch2_write_ref_tryget(c, BCH_WRITE_REF_btree_write_buffer) &&
-	    !queue_work(system_unbound_wq, &c->btree_write_buffer.flush_work))
+	    !queue_work(system_dfl_wq, &c->btree_write_buffer.flush_work))
 		bch2_write_ref_put(c, BCH_WRITE_REF_btree_write_buffer);
 
 	if (dst->wb == &wb->flushing)
diff --git a/fs/bcachefs/io_read.c b/fs/bcachefs/io_read.c
index 417bb0c7bbfa..1b05ad45220c 100644
--- a/fs/bcachefs/io_read.c
+++ b/fs/bcachefs/io_read.c
@@ -553,7 +553,7 @@ static void bch2_rbio_error(struct bch_read_bio *rbio,
 
 	if (bch2_err_matches(ret, BCH_ERR_data_read_retry)) {
 		bch2_rbio_punt(rbio, bch2_rbio_retry,
-			       RBIO_CONTEXT_UNBOUND, system_unbound_wq);
+			       RBIO_CONTEXT_UNBOUND, system_dfl_wq);
 	} else {
 		rbio = bch2_rbio_free(rbio);
 
@@ -833,13 +833,13 @@ static void __bch2_read_endio(struct work_struct *work)
 	memalloc_nofs_restore(nofs_flags);
 	return;
 csum_err:
-	bch2_rbio_punt(rbio, bch2_read_csum_err, RBIO_CONTEXT_UNBOUND, system_unbound_wq);
+	bch2_rbio_punt(rbio, bch2_read_csum_err, RBIO_CONTEXT_UNBOUND, system_dfl_wq);
 	goto out;
 decompression_err:
-	bch2_rbio_punt(rbio, bch2_read_decompress_err, RBIO_CONTEXT_UNBOUND, system_unbound_wq);
+	bch2_rbio_punt(rbio, bch2_read_decompress_err, RBIO_CONTEXT_UNBOUND, system_dfl_wq);
 	goto out;
 decrypt_err:
-	bch2_rbio_punt(rbio, bch2_read_decrypt_err, RBIO_CONTEXT_UNBOUND, system_unbound_wq);
+	bch2_rbio_punt(rbio, bch2_read_decrypt_err, RBIO_CONTEXT_UNBOUND, system_dfl_wq);
 	goto out;
 }
 
@@ -859,7 +859,7 @@ static void bch2_read_endio(struct bio *bio)
 		rbio->bio.bi_end_io = rbio->end_io;
 
 	if (unlikely(bio->bi_status)) {
-		bch2_rbio_punt(rbio, bch2_read_io_err, RBIO_CONTEXT_UNBOUND, system_unbound_wq);
+		bch2_rbio_punt(rbio, bch2_read_io_err, RBIO_CONTEXT_UNBOUND, system_dfl_wq);
 		return;
 	}
 
@@ -878,7 +878,7 @@ static void bch2_read_endio(struct bio *bio)
 	    rbio->promote ||
 	    crc_is_compressed(rbio->pick.crc) ||
 	    bch2_csum_type_is_encryption(rbio->pick.crc.csum_type))
-		context = RBIO_CONTEXT_UNBOUND,	wq = system_unbound_wq;
+		context = RBIO_CONTEXT_UNBOUND,	wq = system_dfl_wq;
 	else if (rbio->pick.crc.csum_type)
 		context = RBIO_CONTEXT_HIGHPRI,	wq = system_highpri_wq;
 
diff --git a/fs/bcachefs/journal_io.c b/fs/bcachefs/journal_io.c
index 1b7961f4f609..298be7748e99 100644
--- a/fs/bcachefs/journal_io.c
+++ b/fs/bcachefs/journal_io.c
@@ -1256,7 +1256,7 @@ int bch2_journal_read(struct bch_fs *c,
 		    percpu_ref_tryget(&ca->io_ref[READ]))
 			closure_call(&ca->journal.read,
 				     bch2_journal_read_device,
-				     system_unbound_wq,
+				     system_dfl_wq,
 				     &jlist.cl);
 		else
 			degraded = true;
diff --git a/fs/btrfs/block-group.c b/fs/btrfs/block-group.c
index a8129f1ce78c..eb25a4acd54d 100644
--- a/fs/btrfs/block-group.c
+++ b/fs/btrfs/block-group.c
@@ -2026,7 +2026,7 @@ void btrfs_reclaim_bgs(struct btrfs_fs_info *fs_info)
 	btrfs_reclaim_sweep(fs_info);
 	spin_lock(&fs_info->unused_bgs_lock);
 	if (!list_empty(&fs_info->reclaim_bgs))
-		queue_work(system_unbound_wq, &fs_info->reclaim_bgs_work);
+		queue_work(system_dfl_wq, &fs_info->reclaim_bgs_work);
 	spin_unlock(&fs_info->unused_bgs_lock);
 }
 
diff --git a/fs/btrfs/extent_map.c b/fs/btrfs/extent_map.c
index 7f46abbd6311..812823b93b66 100644
--- a/fs/btrfs/extent_map.c
+++ b/fs/btrfs/extent_map.c
@@ -1373,7 +1373,7 @@ void btrfs_free_extent_maps(struct btrfs_fs_info *fs_info, long nr_to_scan)
 	if (atomic64_cmpxchg(&fs_info->em_shrinker_nr_to_scan, 0, nr_to_scan) != 0)
 		return;
 
-	queue_work(system_unbound_wq, &fs_info->em_shrinker_work);
+	queue_work(system_dfl_wq, &fs_info->em_shrinker_work);
 }
 
 void btrfs_init_extent_map_shrinker_work(struct btrfs_fs_info *fs_info)
diff --git a/fs/btrfs/space-info.c b/fs/btrfs/space-info.c
index ff089e3e4103..719d8d13d63e 100644
--- a/fs/btrfs/space-info.c
+++ b/fs/btrfs/space-info.c
@@ -1764,7 +1764,7 @@ static int __reserve_bytes(struct btrfs_fs_info *fs_info,
 							  space_info->flags,
 							  orig_bytes, flush,
 							  "enospc");
-				queue_work(system_unbound_wq, async_work);
+				queue_work(system_dfl_wq, async_work);
 			}
 		} else {
 			list_add_tail(&ticket.list,
@@ -1781,7 +1781,7 @@ static int __reserve_bytes(struct btrfs_fs_info *fs_info,
 		    need_preemptive_reclaim(fs_info, space_info)) {
 			trace_btrfs_trigger_flush(fs_info, space_info->flags,
 						  orig_bytes, flush, "preempt");
-			queue_work(system_unbound_wq,
+			queue_work(system_dfl_wq,
 				   &fs_info->preempt_reclaim_work);
 		}
 	}
diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index fb8b8b29c169..7ab51a1e857e 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -2429,7 +2429,7 @@ void btrfs_schedule_zone_finish_bg(struct btrfs_block_group *bg,
 	atomic_inc(&eb->refs);
 	bg->last_eb = eb;
 	INIT_WORK(&bg->zone_finish_work, btrfs_zone_finish_endio_workfn);
-	queue_work(system_unbound_wq, &bg->zone_finish_work);
+	queue_work(system_dfl_wq, &bg->zone_finish_work);
 }
 
 void btrfs_clear_data_reloc_bg(struct btrfs_block_group *bg)
diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index 0d523e9fb3d5..689950520e28 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -3927,7 +3927,7 @@ void ext4_process_freed_data(struct super_block *sb, tid_t commit_tid)
 		list_splice_tail(&freed_data_list, &sbi->s_discard_list);
 		spin_unlock(&sbi->s_md_lock);
 		if (wake)
-			queue_work(system_unbound_wq, &sbi->s_discard_work);
+			queue_work(system_dfl_wq, &sbi->s_discard_work);
 	} else {
 		list_for_each_entry_safe(entry, tmp, &freed_data_list, efd_list)
 			kmem_cache_free(ext4_free_data_cachep, entry);
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index dc6b41ef18b0..da9cf4747728 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -159,7 +159,7 @@ void netfs_put_request(struct netfs_io_request *rreq, bool was_async,
 		if (dead) {
 			if (was_async) {
 				rreq->work.func = netfs_free_request;
-				if (!queue_work(system_unbound_wq, &rreq->work))
+				if (!queue_work(system_dfl_wq, &rreq->work))
 					WARN_ON(1);
 			} else {
 				netfs_free_request(&rreq->work);
diff --git a/fs/netfs/read_collect.c b/fs/netfs/read_collect.c
index 23c75755ad4e..3f64a9f6c688 100644
--- a/fs/netfs/read_collect.c
+++ b/fs/netfs/read_collect.c
@@ -474,7 +474,7 @@ void netfs_wake_read_collector(struct netfs_io_request *rreq)
 	    !test_bit(NETFS_RREQ_RETRYING, &rreq->flags)) {
 		if (!work_pending(&rreq->work)) {
 			netfs_get_request(rreq, netfs_rreq_trace_get_work);
-			if (!queue_work(system_unbound_wq, &rreq->work))
+			if (!queue_work(system_dfl_wq, &rreq->work))
 				netfs_put_request(rreq, true, netfs_rreq_trace_put_work_nq);
 		}
 	} else {
diff --git a/fs/netfs/write_collect.c b/fs/netfs/write_collect.c
index 3fca59e6475d..7ef3859e36d0 100644
--- a/fs/netfs/write_collect.c
+++ b/fs/netfs/write_collect.c
@@ -451,7 +451,7 @@ void netfs_wake_write_collector(struct netfs_io_request *wreq, bool was_async)
 {
 	if (!work_pending(&wreq->work)) {
 		netfs_get_request(wreq, netfs_rreq_trace_get_work);
-		if (!queue_work(system_unbound_wq, &wreq->work))
+		if (!queue_work(system_dfl_wq, &wreq->work))
 			netfs_put_request(wreq, was_async, netfs_rreq_trace_put_work_nq);
 	}
 }
diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
index ab85e6a2454f..910fde3240a9 100644
--- a/fs/nfsd/filecache.c
+++ b/fs/nfsd/filecache.c
@@ -113,7 +113,7 @@ static void
 nfsd_file_schedule_laundrette(void)
 {
 	if (test_bit(NFSD_FILE_CACHE_UP, &nfsd_file_flags))
-		queue_delayed_work(system_unbound_wq, &nfsd_filecache_laundrette,
+		queue_delayed_work(system_dfl_wq, &nfsd_filecache_laundrette,
 				   NFSD_LAUNDRETTE_DELAY);
 }
 
diff --git a/fs/notify/mark.c b/fs/notify/mark.c
index 798340db69d7..55a03bb05aa1 100644
--- a/fs/notify/mark.c
+++ b/fs/notify/mark.c
@@ -428,7 +428,7 @@ void fsnotify_put_mark(struct fsnotify_mark *mark)
 		conn->destroy_next = connector_destroy_list;
 		connector_destroy_list = conn;
 		spin_unlock(&destroy_lock);
-		queue_work(system_unbound_wq, &connector_reaper_work);
+		queue_work(system_dfl_wq, &connector_reaper_work);
 	}
 	/*
 	 * Note that we didn't update flags telling whether inode cares about
@@ -439,7 +439,7 @@ void fsnotify_put_mark(struct fsnotify_mark *mark)
 	spin_lock(&destroy_lock);
 	list_add(&mark->g_list, &destroy_list);
 	spin_unlock(&destroy_lock);
-	queue_delayed_work(system_unbound_wq, &reaper_work,
+	queue_delayed_work(system_dfl_wq, &reaper_work,
 			   FSNOTIFY_REAPER_DELAY);
 }
 EXPORT_SYMBOL_GPL(fsnotify_put_mark);
diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index 825c5c2e0962..39d9756a9cef 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -881,7 +881,7 @@ void dqput(struct dquot *dquot)
 	put_releasing_dquots(dquot);
 	atomic_dec(&dquot->dq_count);
 	spin_unlock(&dq_list_lock);
-	queue_delayed_work(system_unbound_wq, &quota_release_work, 1);
+	queue_delayed_work(system_dfl_wq, &quota_release_work, 1);
 }
 EXPORT_SYMBOL(dqput);
 
diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 39a5f1401656..9dea10a09cc5 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -438,7 +438,7 @@ enum wq_consts {
  * system_long_wq is similar to system_percpu_wq but may host long running
  * works.  Queue flushing might take relatively long.
  *
- * system_unbound_wq is unbound workqueue.  Workers are not bound to
+ * system_dfl_wq is unbound workqueue.  Workers are not bound to
  * any specific CPU, not concurrency managed, and all queued works are
  * executed immediately as long as max_active limit is not reached and
  * resources are available.
@@ -458,7 +458,7 @@ enum wq_consts {
 extern struct workqueue_struct *system_percpu_wq;
 extern struct workqueue_struct *system_highpri_wq;
 extern struct workqueue_struct *system_long_wq;
-extern struct workqueue_struct *system_unbound_wq;
+extern struct workqueue_struct *system_dfl_wq;
 extern struct workqueue_struct *system_freezable_wq;
 extern struct workqueue_struct *system_power_efficient_wq;
 extern struct workqueue_struct *system_freezable_power_efficient_wq;
@@ -776,8 +776,8 @@ extern void __warn_flushing_systemwide_wq(void)
 	     _wq == system_highpri_wq) ||				\
 	    (__builtin_constant_p(_wq == system_long_wq) &&		\
 	     _wq == system_long_wq) ||					\
-	    (__builtin_constant_p(_wq == system_unbound_wq) &&		\
-	     _wq == system_unbound_wq) ||				\
+	    (__builtin_constant_p(_wq == system_dfl_wq) &&		\
+	     _wq == system_dfl_wq) ||				\
 	    (__builtin_constant_p(_wq == system_freezable_wq) &&	\
 	     _wq == system_freezable_wq) ||				\
 	    (__builtin_constant_p(_wq == system_power_efficient_wq) &&	\
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 2a6ead3c7d36..74972ecf2045 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2983,7 +2983,7 @@ static __cold void io_ring_ctx_wait_and_kill(struct io_ring_ctx *ctx)
 
 	INIT_WORK(&ctx->exit_work, io_ring_exit_work);
 	/*
-	 * Use system_unbound_wq to avoid spawning tons of event kworkers
+	 * Use system_dfl_wq to avoid spawning tons of event kworkers
 	 * if we're exiting a ton of rings at the same time. It just adds
 	 * noise and overhead, there's no discernable change in runtime
 	 * over using system_percpu_wq.
diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index e3a2662f4e33..b969ca4d7af0 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -1593,7 +1593,7 @@ void bpf_timer_cancel_and_free(void *val)
 	 * timer callback.
 	 */
 	if (this_cpu_read(hrtimer_running)) {
-		queue_work(system_unbound_wq, &t->cb.delete_work);
+		queue_work(system_dfl_wq, &t->cb.delete_work);
 		return;
 	}
 
@@ -1606,7 +1606,7 @@ void bpf_timer_cancel_and_free(void *val)
 		if (hrtimer_try_to_cancel(&t->timer) >= 0)
 			kfree_rcu(t, cb.rcu);
 		else
-			queue_work(system_unbound_wq, &t->cb.delete_work);
+			queue_work(system_dfl_wq, &t->cb.delete_work);
 	} else {
 		bpf_timer_delete_work(&t->cb.delete_work);
 	}
diff --git a/kernel/bpf/memalloc.c b/kernel/bpf/memalloc.c
index 889374722d0a..bd45dda9dc35 100644
--- a/kernel/bpf/memalloc.c
+++ b/kernel/bpf/memalloc.c
@@ -736,7 +736,7 @@ static void destroy_mem_alloc(struct bpf_mem_alloc *ma, int rcu_in_progress)
 	/* Defer barriers into worker to let the rest of map memory to be freed */
 	memset(ma, 0, sizeof(*ma));
 	INIT_WORK(&copy->work, free_mem_alloc_deferred);
-	queue_work(system_unbound_wq, &copy->work);
+	queue_work(system_dfl_wq, &copy->work);
 }
 
 void bpf_mem_alloc_destroy(struct bpf_mem_alloc *ma)
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 9794446bc8c6..bb6f85fda240 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -901,7 +901,7 @@ static void bpf_map_free_in_work(struct bpf_map *map)
 	/* Avoid spawning kworkers, since they all might contend
 	 * for the same mutex like slab_mutex.
 	 */
-	queue_work(system_unbound_wq, &map->work);
+	queue_work(system_dfl_wq, &map->work);
 }
 
 static void bpf_map_free_rcu_gp(struct rcu_head *rcu)
diff --git a/kernel/padata.c b/kernel/padata.c
index b3d4eacc4f5d..76b39fc8b326 100644
--- a/kernel/padata.c
+++ b/kernel/padata.c
@@ -551,9 +551,9 @@ void __init padata_do_multithreaded(struct padata_mt_job *job)
 			do {
 				nid = next_node_in(old_node, node_states[N_CPU]);
 			} while (!atomic_try_cmpxchg(&last_used_nid, &old_node, nid));
-			queue_work_node(nid, system_unbound_wq, &pw->pw_work);
+			queue_work_node(nid, system_dfl_wq, &pw->pw_work);
 		} else {
-			queue_work(system_unbound_wq, &pw->pw_work);
+			queue_work(system_dfl_wq, &pw->pw_work);
 		}
 
 	/* Use the current thread, which saves starting a workqueue worker. */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba0..baa096e543f1 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5772,7 +5772,7 @@ static void sched_tick_remote(struct work_struct *work)
 	os = atomic_fetch_add_unless(&twork->state, -1, TICK_SCHED_REMOTE_RUNNING);
 	WARN_ON_ONCE(os == TICK_SCHED_REMOTE_OFFLINE);
 	if (os == TICK_SCHED_REMOTE_RUNNING)
-		queue_delayed_work(system_unbound_wq, dwork, HZ);
+		queue_delayed_work(system_dfl_wq, dwork, HZ);
 }
 
 static void sched_tick_start(int cpu)
@@ -5791,7 +5791,7 @@ static void sched_tick_start(int cpu)
 	if (os == TICK_SCHED_REMOTE_OFFLINE) {
 		twork->cpu = cpu;
 		INIT_DELAYED_WORK(&twork->work, sched_tick_remote);
-		queue_delayed_work(system_unbound_wq, &twork->work, HZ);
+		queue_delayed_work(system_dfl_wq, &twork->work, HZ);
 	}
 }
 
diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 66bcd40a28ca..b1b79143e391 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -3514,7 +3514,7 @@ static void scx_watchdog_workfn(struct work_struct *work)
 
 		cond_resched();
 	}
-	queue_delayed_work(system_unbound_wq, to_delayed_work(work),
+	queue_delayed_work(system_dfl_wq, to_delayed_work(work),
 			   scx_watchdog_timeout / 2);
 }
 
@@ -5403,7 +5403,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	WRITE_ONCE(scx_watchdog_timeout, timeout);
 	WRITE_ONCE(scx_watchdog_timestamp, jiffies);
-	queue_delayed_work(system_unbound_wq, &scx_watchdog_work,
+	queue_delayed_work(system_dfl_wq, &scx_watchdog_work,
 			   scx_watchdog_timeout / 2);
 
 	/*
diff --git a/kernel/umh.c b/kernel/umh.c
index b4da45a3a7cf..cda899327952 100644
--- a/kernel/umh.c
+++ b/kernel/umh.c
@@ -430,7 +430,7 @@ int call_usermodehelper_exec(struct subprocess_info *sub_info, int wait)
 	sub_info->complete = (wait == UMH_NO_WAIT) ? NULL : &done;
 	sub_info->wait = wait;
 
-	queue_work(system_unbound_wq, &sub_info->work);
+	queue_work(system_dfl_wq, &sub_info->work);
 	if (wait == UMH_NO_WAIT)	/* task has freed sub_info */
 		goto unlock;
 
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 7ad4fecde6f4..98cbfc685f39 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -509,8 +509,8 @@ struct workqueue_struct *system_highpri_wq __ro_after_init;
 EXPORT_SYMBOL_GPL(system_highpri_wq);
 struct workqueue_struct *system_long_wq __ro_after_init;
 EXPORT_SYMBOL_GPL(system_long_wq);
-struct workqueue_struct *system_unbound_wq __ro_after_init;
-EXPORT_SYMBOL_GPL(system_unbound_wq);
+struct workqueue_struct *system_dfl_wq __ro_after_init;
+EXPORT_SYMBOL_GPL(system_dfl_wq);
 struct workqueue_struct *system_freezable_wq __ro_after_init;
 EXPORT_SYMBOL_GPL(system_freezable_wq);
 struct workqueue_struct *system_power_efficient_wq __ro_after_init;
@@ -2932,7 +2932,7 @@ static void idle_worker_timeout(struct timer_list *t)
 	raw_spin_unlock_irq(&pool->lock);
 
 	if (do_cull)
-		queue_work(system_unbound_wq, &pool->idle_cull_work);
+		queue_work(system_dfl_wq, &pool->idle_cull_work);
 }
 
 /**
@@ -7818,7 +7818,7 @@ void __init workqueue_init_early(void)
 	system_percpu_wq = alloc_workqueue("events", 0, 0);
 	system_highpri_wq = alloc_workqueue("events_highpri", WQ_HIGHPRI, 0);
 	system_long_wq = alloc_workqueue("events_long", 0, 0);
-	system_unbound_wq = alloc_workqueue("events_unbound", WQ_UNBOUND,
+	system_dfl_wq = alloc_workqueue("events_unbound", WQ_UNBOUND,
 					    WQ_MAX_ACTIVE);
 	system_freezable_wq = alloc_workqueue("events_freezable",
 					      WQ_FREEZABLE, 0);
@@ -7831,7 +7831,7 @@ void __init workqueue_init_early(void)
 	system_bh_highpri_wq = alloc_workqueue("events_bh_highpri",
 					       WQ_BH | WQ_HIGHPRI, 0);
 	BUG_ON(!system_percpu_wq || !system_highpri_wq || !system_long_wq ||
-	       !system_unbound_wq || !system_freezable_wq ||
+	       !system_dfl_wq || !system_freezable_wq ||
 	       !system_power_efficient_wq ||
 	       !system_freezable_power_efficient_wq ||
 	       !system_bh_wq || !system_bh_highpri_wq);
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 784605103202..7e672424f928 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -934,7 +934,7 @@ void wb_memcg_offline(struct mem_cgroup *memcg)
 	memcg_cgwb_list->next = NULL;	/* prevent new wb's */
 	spin_unlock_irq(&cgwb_lock);
 
-	queue_work(system_unbound_wq, &cleanup_offline_cgwbs_work);
+	queue_work(system_dfl_wq, &cleanup_offline_cgwbs_work);
 }
 
 /**
diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index 102048821c22..f26d87d59296 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -854,7 +854,7 @@ static void toggle_allocation_gate(struct work_struct *work)
 	/* Disable static key and reset timer. */
 	static_branch_disable(&kfence_allocation_key);
 #endif
-	queue_delayed_work(system_unbound_wq, &kfence_timer,
+	queue_delayed_work(system_dfl_wq, &kfence_timer,
 			   msecs_to_jiffies(kfence_sample_interval));
 }
 
@@ -900,7 +900,7 @@ static void kfence_init_enable(void)
 		atomic_notifier_chain_register(&panic_notifier_list, &kfence_check_canary_notifier);
 
 	WRITE_ONCE(kfence_enabled, true);
-	queue_delayed_work(system_unbound_wq, &kfence_timer, 0);
+	queue_delayed_work(system_dfl_wq, &kfence_timer, 0);
 
 	pr_info("initialized - using %lu bytes for %d objects at 0x%p-0x%p\n", KFENCE_POOL_SIZE,
 		CONFIG_KFENCE_NUM_OBJECTS, (void *)__kfence_pool,
@@ -996,7 +996,7 @@ static int kfence_enable_late(void)
 		return kfence_init_late();
 
 	WRITE_ONCE(kfence_enabled, true);
-	queue_delayed_work(system_unbound_wq, &kfence_timer, 0);
+	queue_delayed_work(system_dfl_wq, &kfence_timer, 0);
 	pr_info("re-enabled\n");
 	return 0;
 }
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 421740f1bcdc..c2944bc83378 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -651,7 +651,7 @@ static void flush_memcg_stats_dwork(struct work_struct *w)
 	 * in latency-sensitive paths is as cheap as possible.
 	 */
 	__mem_cgroup_flush_stats(root_mem_cgroup, true);
-	queue_delayed_work(system_unbound_wq, &stats_flush_dwork, FLUSH_TIME);
+	queue_delayed_work(system_dfl_wq, &stats_flush_dwork, FLUSH_TIME);
 }
 
 unsigned long memcg_page_state(struct mem_cgroup *memcg, int idx)
@@ -3732,7 +3732,7 @@ static int mem_cgroup_css_online(struct cgroup_subsys_state *css)
 		goto offline_kmem;
 
 	if (unlikely(mem_cgroup_is_root(memcg)) && !mem_cgroup_disabled())
-		queue_delayed_work(system_unbound_wq, &stats_flush_dwork,
+		queue_delayed_work(system_dfl_wq, &stats_flush_dwork,
 				   FLUSH_TIME);
 	lru_gen_online_memcg(memcg);
 
diff --git a/net/core/link_watch.c b/net/core/link_watch.c
index cb04ef2b9807..7c17cba6437d 100644
--- a/net/core/link_watch.c
+++ b/net/core/link_watch.c
@@ -157,9 +157,9 @@ static void linkwatch_schedule_work(int urgent)
 	 * override the existing timer.
 	 */
 	if (test_bit(LW_URGENT, &linkwatch_flags))
-		mod_delayed_work(system_unbound_wq, &linkwatch_work, 0);
+		mod_delayed_work(system_dfl_wq, &linkwatch_work, 0);
 	else
-		queue_delayed_work(system_unbound_wq, &linkwatch_work, delay);
+		queue_delayed_work(system_dfl_wq, &linkwatch_work, delay);
 }
 
 
diff --git a/net/unix/garbage.c b/net/unix/garbage.c
index 01e2b9452c75..684ab03137b6 100644
--- a/net/unix/garbage.c
+++ b/net/unix/garbage.c
@@ -592,7 +592,7 @@ static DECLARE_WORK(unix_gc_work, __unix_gc);
 void unix_gc(void)
 {
 	WRITE_ONCE(gc_in_progress, true);
-	queue_work(system_unbound_wq, &unix_gc_work);
+	queue_work(system_dfl_wq, &unix_gc_work);
 }
 
 #define UNIX_INFLIGHT_TRIGGER_GC 16000
diff --git a/net/wireless/core.c b/net/wireless/core.c
index dcce326fdb8c..ffe0f439fda8 100644
--- a/net/wireless/core.c
+++ b/net/wireless/core.c
@@ -428,7 +428,7 @@ static void cfg80211_wiphy_work(struct work_struct *work)
 	if (wk) {
 		list_del_init(&wk->entry);
 		if (!list_empty(&rdev->wiphy_work_list))
-			queue_work(system_unbound_wq, work);
+			queue_work(system_dfl_wq, work);
 		spin_unlock_irq(&rdev->wiphy_work_lock);
 
 		trace_wiphy_work_run(&rdev->wiphy, wk);
@@ -1670,7 +1670,7 @@ void wiphy_work_queue(struct wiphy *wiphy, struct wiphy_work *work)
 		list_add_tail(&work->entry, &rdev->wiphy_work_list);
 	spin_unlock_irqrestore(&rdev->wiphy_work_lock, flags);
 
-	queue_work(system_unbound_wq, &rdev->wiphy_work);
+	queue_work(system_dfl_wq, &rdev->wiphy_work);
 }
 EXPORT_SYMBOL_GPL(wiphy_work_queue);
 
diff --git a/net/wireless/sysfs.c b/net/wireless/sysfs.c
index 62f26618f674..8d142856e385 100644
--- a/net/wireless/sysfs.c
+++ b/net/wireless/sysfs.c
@@ -137,7 +137,7 @@ static int wiphy_resume(struct device *dev)
 	if (rdev->wiphy.registered && rdev->ops->resume)
 		ret = rdev_resume(rdev);
 	rdev->suspended = false;
-	queue_work(system_unbound_wq, &rdev->wiphy_work);
+	queue_work(system_dfl_wq, &rdev->wiphy_work);
 	wiphy_unlock(&rdev->wiphy);
 
 	if (ret)
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7c7e99a8c033..6f508c3e37e4 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -662,14 +662,14 @@ pub fn system_long() -> &'static Queue {
     unsafe { Queue::from_raw(bindings::system_long_wq) }
 }
 
-/// Returns the system unbound work queue (`system_unbound_wq`).
+/// Returns the system unbound work queue (`system_dfl_wq`).
 ///
 /// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
 /// are executed immediately as long as `max_active` limit is not reached and resources are
 /// available.
 pub fn system_unbound() -> &'static Queue {
-    // SAFETY: `system_unbound_wq` is a C global, always available.
-    unsafe { Queue::from_raw(bindings::system_unbound_wq) }
+    // SAFETY: `system_dfl_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
 }
 
 /// Returns the system freezable work queue (`system_freezable_wq`).
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 91c8697c29c3..c8fff8496ede 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1044,7 +1044,7 @@ int wm_adsp_early_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		queue_work(system_unbound_wq, &dsp->boot_work);
+		queue_work(system_dfl_wq, &dsp->boot_work);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		wm_adsp_power_down(dsp);
-- 
2.49.0

