Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F43285CB9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848588; cv=none; b=FJUoM72wuNqmxZTRkOKLBzpHgyqHTnDXPmAtW6PoyoFJszszknG1gRMP6LApcDlLUC55ZSeNZkYVHS5AxV27JbfgNBdCrrEX2Vcsdw0KVXImFUlSCoW8o3ya8NepimjPvAyX/99iQL5zFNAHPc0GaFUSXUt31gLXcMyJmf/iSN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848588; c=relaxed/simple;
	bh=+J9hVgc4JEDgEadhJWvEvgm4cQmw+JA8jgllylJI3KM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aUobjntx8W/GlabF3I09v+aRPTneHS/L0LqUsMtP5IMQej0UpGQb0ND9ryI6065Tpk1y6wQdO9o3+bBTSBR8JG0ig6xSKBFSwhgrWDYWbR+daQxT7EShvgEWgx1btZ6eHz5im/HrgpX76chtLyZ9pdvyQ0XBITEdGw9vUWlnPLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ATbHVssL; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ATbHVssL"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so8427335e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750848582; x=1751453382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ihU9kGE5taeTJkaNmH/IEkUObnQ1MvAsLJy0oVKpX2Y=;
        b=ATbHVssLivOi7/SIILTtONVI5ZjLnsiuaM0X7EwlDQ3Bdut1mJVPOANs6DWpQDM3Gd
         4HZHUUg3bNumm+XmUARE5F3qd6K3WxIhB1jkP7OUPhALpvZJzZ49HOCl8nkr1cEka/AA
         X6X1u7TYC3v8+6khetokVr1cMcBU5csfc/QTLX/fiz3QFBo2e81iDAPXaOHnzZpalias
         JuPAovkFZAimlmDBxmq5f+0mhIT5LV/MDj1V5O995yTuUUKSSTUg+4wP9V+iTtvgORiN
         ZNcR5tBAcfu7MkxgdN+sy44DPux1V6gnAz2MPuYstaWb+WtNZjgaf5NCA1ZjnKULfFcR
         VfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848582; x=1751453382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihU9kGE5taeTJkaNmH/IEkUObnQ1MvAsLJy0oVKpX2Y=;
        b=WlZJumHxEErPGP63D4AGhePcVE/Z2hHBkgBtaFP2LwiZarVn5QlfPvqEc6roWS/uJ0
         cyvUd3nRao+gEOx4qYnBfkn9Uizy1kNMoyJ67qBgIx3z8AqDiCgIySZHTJYnSlg1O3Vb
         9W9/LJbyyo+V2ziJOnCP2Fs2s1/vlptmUxk6QA2zVmZgu+VcRTEjhLfVsLK0dxjooovE
         G6ZZQi+7CvGM7zWTW1Fu5FiMyVYNNnE4HCNWqTw7qDMJHlraDc4quNQT0DECw8fv6HBl
         qbFiz0iQNm1w56D5EfI8jwgnXYB0qk3ErdW6yV+JCmB946N2g9PwUVb5ewIWwV0BPbv8
         waqw==
X-Gm-Message-State: AOJu0YywuTyOGcsm9O6XHFM4PyuEfz/brOS19FUmOQXA2Y1OLuKWpxr0
	NhB4TPFU2I84RjhH+F3LLPp1/EJ5g4WRNFjUssEeadLHk0/Lz0DmMiy1APVBO0jhme6Ne5Ys8zP
	yhaPnBbUgjg==
X-Gm-Gg: ASbGncuyUAGpEo3wQBk7R0czeVVsV2YwFOU6rxF0lmqb13vG5Jz+/tI1eQyihXQRYhg
	KwWhzMdrWrgVUDodjrejdM7FMKJckFtGhvPVn329Z2iLlzeYyIFb3hCnobC0gWbnLhDH6KkOreq
	ZLOW3weroon7UKZn2oykixVgfiOwOUSi51FUAwWkpdnO6tY+aofVDxQstcFORIkp844S7vOniIT
	DPnaaC5dm6U/jSvERSpdN/aiTyxNJpvJRYR0QbmJxZyEqdosS6rCBfYc2bUJmBVgAJu9R/iAgOa
	46uT8AP3qSGHrUMOujs1pabx/m+TCc0Yh9Iah+mt8OYFcBwtfc/vPQ84tizQCiXj5IEfcT58ejP
	gxoB9FtkKIA==
X-Google-Smtp-Source: AGHT+IFG+R9bnkNpXj8w8gP9WgemnELx5P2KpXBTWf3EiHKcIpnCrakK78+qAfGYobyXuDkSv2rCCg==
X-Received: by 2002:a05:600c:a07:b0:453:6424:48a2 with SMTP id 5b1f17b1804b1-45381ab0482mr25671105e9.10.1750848582183;
        Wed, 25 Jun 2025 03:49:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c49fsm16195055e9.7.2025.06.25.03.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:49:41 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v1 00/10] Workqueue: replace system wq and change alloc_workqueue callers
Date: Wed, 25 Jun 2025 12:49:24 +0200
Message-ID: <20250625104934.184753-1-marco.crivellari@suse.com>
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

Below is a summary of a discussion about the Workqueue API and cpu isolation
considerations. Details and more information are available here:

        "workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOUND."
        https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an isolated
CPU where "delay" value is 0 or greater then 0:
		schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

		schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

=== Plan and future plans ===

This patchset is the first stone on a refactoring needed in order to
address the points aforementioned; it will have a positive impact also
on the cpu isolation, in the long term, moving away percpu workqueue in
favor to an unbound model.

These are the main steps:
1)  API refactoring (that this patch is introducing)
	-	Make more clear and uniform the system wq names, both per-cpu and
		unbound. This to avoid any possible confusion on what should be
		used.

	-	Introduction of WQ_PERCPU: this flag is the complement of WQ_UNBOUND,
		introduced in this patchset and used on all the callers that are not
		currently using WQ_UNBOUND.

		WQ_UNBOUND will be removed in a future release cycle.

		Most users don't need to be per-cpu, because they don't have
		locality requirements, because of that, a next future step will be
		make "unbound" the default behavior.

2)  Check who really needs to be per-cpu
	-	Remove the WQ_PERCPU flag when is not strictly required.

3)  Add a new API (prefer local cpu)
	-	There are users that don't require a local execution, like mentioned
		above; despite that, local execution yeld to performance gain.

		This new API will prefer the local execution, without requiring it.

=== Introduced Changes by this patchset ===

1)	[P 1-2-3] replace use of system_wq with system_percpu_wq per subsys:

		system_wq is a per-CPU workqueue, but his name is not clear.
		system_unbound_wq is to be used when locality is not required.

		Because of that, system_wq has been renamed in system_percpu_wq in the
		following subsystem: mm, net, fs (details on the next section).

2)	[P 4-5] replace remaining system_wq and system_unbound_wq
		
		system_unbound_wq is to be used when locality is not required.
		Because of that, system_unbound_wq has been renamed in system_dfl_wq.

        The old wq are still around, but if used in queue_work(), queue_delayed_work(),
		mod_delayed_work(), a pr_warn_once() will be printed and the wq used is
		automatically assigned to the new default (system_dfl_wq or system_percpu_wq).

3)	[P 6-7-8] add WQ_PERCPU to alloc_workqueue() users (per subsystem)

		Every alloc_workqueue() caller should use one among WQ_PERCPU or
		WQ_UNBOUND. This is actually enforced warning if both or none of them
		are present at the same time.

		These patches introduce WQ_PERCPU in the following subsystems:
		fs, net, mm (details on the next section).

		WQ_UNBOUND will be removed in a next release cycle.

4)	[P 9] add WQ_PERCPU to remaining alloc_workqueue() users 

		Every alloc_workqueue() caller should use one among WQ_PERCPU or
		WQ_UNBOUND. This is actually enforced warning if both or none of them
		are present at the same time.

		WQ_UNBOUND will be removed in a next release cycle.

5)	[P 10] upgraded WQ_UNBOUND documentation

		Added a note about the WQ_UNBOUND removal in a next release cycle.

=== For fs, mm, net Maintainers ===

If you agree with these changes, one option is pull the preparation changes from
Tejun's wq branch [1].

As an alternative, the patches can be routed through a wq branch.

The preparation changes are described in the present cover letter, under the
"main steps" section. The changes done in summary are:

- add system_percpu_wq and system_dfl_wq, for now without replace the older wq(s)
  (system_unbound_wq and system_wq).
- add WQ_PERCPU flag, currently without removing WQ_UNBOUND; it will be removed
  in a future release cycle.

You can find the aforementioned changes reading:

("Workqueue: add WQ_PERCPU, system_dfl_wq and system_percpu_wq")
https://lore.kernel.org/all/20250614133531.76742-1-marco.crivellari@suse.com/


- [1] git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git WQ_PERCPU


Marco Crivellari (10):
  Workqueue: net: replace use of system_wq with system_percpu_wq
  Workqueue: mm: replace use of system_wq with system_percpu_wq
  Workqueue: fs: replace use of system_wq with system_percpu_wq
  Workqueue: replace use of system_wq with system_percpu_wq
  Workqueue: replace use of system_unbound_wq with system_dfl_wq
  Workqueue: net: WQ_PERCPU added to alloc_workqueue users
  Workqueue: mm: WQ_PERCPU added to alloc_workqueue users
  Workqueue: fs: WQ_PERCPU added to alloc_workqueue users
  Workqueue: WQ_PERCPU added to all the remaining users
  [Doc] Workqueue: WQ_UNBOUND doc upgraded

 Documentation/core-api/workqueue.rst          |  4 ++
 arch/s390/kernel/diag/diag324.c               |  4 +-
 arch/s390/kernel/hiperdispatch.c              |  2 +-
 block/bio-integrity-auto.c                    |  5 +-
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
 drivers/acpi/osl.c                            |  6 +-
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
 drivers/char/random.c                         |  8 +--
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |  3 +-
 drivers/gpu/drm/bridge/ite-it6505.c           |  2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c            |  2 +-
 drivers/gpu/drm/drm_atomic_helper.c           |  6 +-
 drivers/gpu/drm/drm_probe_helper.c            |  2 +-
 drivers/gpu/drm/drm_self_refresh_helper.c     |  2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  2 +-
 .../drm/i915/display/intel_display_driver.c   |  3 +-
 .../drm/i915/display/intel_display_power.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_tc.c       |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  4 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +-
 drivers/gpu/drm/i915/i915_active.c            |  2 +-
 drivers/gpu/drm/i915/i915_driver.c            |  5 +-
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
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |  6 +-
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
 drivers/input/mouse/synaptics_i2c.c           |  8 +--
 drivers/isdn/capi/kcapi.c                     |  2 +-
 drivers/leds/trigger/ledtrig-input-events.c   |  2 +-
 drivers/md/bcache/btree.c                     |  3 +-
 drivers/md/bcache/super.c                     | 30 +++++-----
 drivers/md/bcache/writeback.c                 |  2 +-
 drivers/md/dm-bufio.c                         |  3 +-
 drivers/md/dm-cache-target.c                  |  3 +-
 drivers/md/dm-clone-target.c                  |  3 +-
 drivers/md/dm-crypt.c                         |  6 +-
 drivers/md/dm-delay.c                         |  4 +-
 drivers/md/dm-integrity.c                     | 15 +++--
 drivers/md/dm-kcopyd.c                        |  3 +-
 drivers/md/dm-log-userspace-base.c            |  3 +-
 drivers/md/dm-mpath.c                         |  5 +-
 drivers/md/dm-raid1.c                         |  5 +-
 drivers/md/dm-snap-persistent.c               |  3 +-
 drivers/md/dm-stripe.c                        |  2 +-
 drivers/md/dm-verity-target.c                 |  4 +-
 drivers/md/dm-writecache.c                    |  3 +-
 drivers/md/dm.c                               |  3 +-
 drivers/md/md.c                               |  4 +-
 drivers/media/pci/ddbridge/ddbridge-core.c    |  2 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  6 +-
 .../platform/synopsys/hdmirx/snps_hdmirx.c    |  8 +--
 drivers/message/fusion/mptbase.c              |  7 ++-
 drivers/mmc/core/block.c                      |  3 +-
 drivers/mmc/host/mtk-sd.c                     |  4 +-
 drivers/mmc/host/omap.c                       |  2 +-
 drivers/net/can/spi/hi311x.c                  |  3 +-
 drivers/net/can/spi/mcp251x.c                 |  3 +-
 .../net/ethernet/cavium/liquidio/lio_core.c   |  2 +-
 .../net/ethernet/cavium/liquidio/lio_main.c   |  8 ++-
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
 drivers/net/fjes/fjes_main.c                  |  5 +-
 drivers/net/macvlan.c                         |  2 +-
 drivers/net/netdevsim/dev.c                   |  6 +-
 drivers/net/phy/sfp.c                         | 12 ++--
 drivers/net/wireguard/device.c                |  6 +-
 drivers/net/wireless/ath/ath6kl/usb.c         |  2 +-
 drivers/net/wireless/intel/ipw2x00/ipw2100.c  |  6 +-
 drivers/net/wireless/intel/ipw2x00/ipw2200.c  |  2 +-
 drivers/net/wireless/intel/iwlwifi/fw/dbg.c   |  4 +-
 .../net/wireless/intel/iwlwifi/iwl-trans.h    |  2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/tdls.c |  6 +-
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
 drivers/nvme/host/tcp.c                       |  2 +
 drivers/nvme/target/admin-cmd.c               |  2 +-
 drivers/nvme/target/core.c                    |  5 +-
 drivers/nvme/target/fabrics-cmd-auth.c        |  2 +-
 drivers/nvme/target/fc.c                      |  6 +-
 drivers/nvme/target/tcp.c                     |  2 +-
 drivers/pci/endpoint/functions/pci-epf-mhi.c  |  2 +-
 drivers/pci/endpoint/functions/pci-epf-ntb.c  |  5 +-
 drivers/pci/endpoint/functions/pci-epf-test.c |  3 +-
 drivers/pci/endpoint/functions/pci-epf-vntb.c |  5 +-
 drivers/pci/endpoint/pci-ep-cfs.c             |  2 +-
 drivers/pci/hotplug/pnv_php.c                 |  3 +-
 drivers/pci/hotplug/shpchp_core.c             |  3 +-
 drivers/phy/allwinner/phy-sun4i-usb.c         | 14 ++---
 .../platform/cznic/turris-omnia-mcu-gpio.c    |  2 +-
 .../surface/aggregator/ssh_packet_layer.c     |  2 +-
 .../surface/aggregator/ssh_request_layer.c    |  2 +-
 .../platform/surface/surface_acpi_notify.c    |  2 +-
 drivers/platform/x86/gpd-pocket-fan.c         |  4 +-
 .../x86/x86-android-tablets/vexia_atla10_ec.c |  2 +-
 drivers/power/supply/ab8500_btemp.c           |  3 +-
 drivers/power/supply/bq2415x_charger.c        |  2 +-
 drivers/power/supply/bq24190_charger.c        |  2 +-
 drivers/power/supply/bq27xxx_battery.c        |  6 +-
 drivers/power/supply/ipaq_micro_battery.c     |  3 +-
 drivers/power/supply/rk817_charger.c          |  6 +-
 drivers/power/supply/ucs1002_power.c          |  2 +-
 drivers/power/supply/ug3105_battery.c         |  6 +-
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
 drivers/scsi/qedf/qedf_main.c                 | 15 +++--
 drivers/scsi/qedi/qedi_main.c                 |  2 +-
 drivers/scsi/qla2xxx/qla_os.c                 |  4 +-
 drivers/scsi/qla2xxx/qla_target.c             |  2 +-
 drivers/scsi/qla2xxx/tcm_qla2xxx.c            |  2 +-
 drivers/scsi/qla4xxx/ql4_os.c                 |  3 +-
 drivers/scsi/scsi_transport_fc.c              |  7 ++-
 drivers/scsi/scsi_transport_iscsi.c           |  2 +-
 drivers/soc/fsl/qbman/qman.c                  |  2 +-
 drivers/soc/xilinx/zynqmp_power.c             |  6 +-
 drivers/staging/greybus/sdio.c                |  2 +-
 drivers/target/sbp/sbp_target.c               |  8 +--
 drivers/target/target_core_transport.c        |  4 +-
 drivers/target/target_core_xcopy.c            |  2 +-
 drivers/target/tcm_fc/tfc_conf.c              |  2 +-
 drivers/thunderbolt/tb.c                      |  2 +-
 drivers/tty/serial/8250/8250_dw.c             |  4 +-
 drivers/tty/tty_buffer.c                      |  8 +--
 drivers/usb/core/hub.c                        |  2 +-
 drivers/usb/dwc3/gadget.c                     |  2 +-
 drivers/usb/gadget/function/f_hid.c           |  3 +-
 drivers/usb/host/xhci-dbgcap.c                |  8 +--
 drivers/usb/host/xhci-ring.c                  |  2 +-
 drivers/usb/storage/uas.c                     |  2 +-
 drivers/usb/typec/anx7411.c                   |  3 +-
 drivers/vdpa/vdpa_user/vduse_dev.c            |  3 +-
 drivers/virt/acrn/irqfd.c                     |  3 +-
 drivers/virtio/virtio_balloon.c               |  3 +-
 drivers/xen/events/events_base.c              |  6 +-
 drivers/xen/privcmd.c                         |  3 +-
 fs/afs/callback.c                             |  4 +-
 fs/afs/main.c                                 |  4 +-
 fs/afs/write.c                                |  2 +-
 fs/aio.c                                      |  2 +-
 fs/bcachefs/btree_write_buffer.c              |  2 +-
 fs/bcachefs/io_read.c                         | 12 ++--
 fs/bcachefs/journal_io.c                      |  2 +-
 fs/bcachefs/super.c                           | 10 ++--
 fs/btrfs/async-thread.c                       |  3 +-
 fs/btrfs/block-group.c                        |  2 +-
 fs/btrfs/disk-io.c                            |  2 +-
 fs/btrfs/extent_map.c                         |  2 +-
 fs/btrfs/space-info.c                         |  4 +-
 fs/btrfs/zoned.c                              |  2 +-
 fs/ceph/super.c                               |  2 +-
 fs/dlm/lowcomms.c                             |  2 +-
 fs/dlm/main.c                                 |  2 +-
 fs/ext4/mballoc.c                             |  2 +-
 fs/fs-writeback.c                             |  4 +-
 fs/fuse/dev.c                                 |  2 +-
 fs/fuse/inode.c                               |  2 +-
 fs/gfs2/main.c                                |  5 +-
 fs/gfs2/ops_fstype.c                          |  6 +-
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
 fs/smb/client/cifsfs.c                        | 16 +++--
 fs/smb/server/ksmbd_work.c                    |  2 +-
 fs/smb/server/transport_rdma.c                |  3 +-
 fs/super.c                                    |  3 +-
 fs/verity/verify.c                            |  2 +-
 fs/xfs/xfs_log.c                              |  3 +-
 fs/xfs/xfs_mru_cache.c                        |  3 +-
 fs/xfs/xfs_super.c                            | 15 ++---
 include/drm/gpu_scheduler.h                   |  2 +-
 include/linux/closure.h                       |  2 +-
 include/linux/workqueue.h                     | 60 ++++++++++++++-----
 io_uring/io_uring.c                           |  4 +-
 kernel/bpf/cgroup.c                           |  5 +-
 kernel/bpf/cpumap.c                           |  2 +-
 kernel/bpf/helpers.c                          |  4 +-
 kernel/bpf/memalloc.c                         |  2 +-
 kernel/bpf/syscall.c                          |  2 +-
 kernel/cgroup/cgroup-v1.c                     |  2 +-
 kernel/cgroup/cgroup.c                        |  4 +-
 kernel/module/dups.c                          |  4 +-
 kernel/padata.c                               |  9 +--
 kernel/power/main.c                           |  2 +-
 kernel/rcu/tasks.h                            |  4 +-
 kernel/rcu/tree.c                             |  4 +-
 kernel/sched/core.c                           |  4 +-
 kernel/sched/ext.c                            |  4 +-
 kernel/smp.c                                  |  2 +-
 kernel/trace/trace_events_user.c              |  2 +-
 kernel/umh.c                                  |  2 +-
 kernel/workqueue.c                            | 45 ++++++++++----
 mm/backing-dev.c                              |  6 +-
 mm/kfence/core.c                              |  6 +-
 mm/memcontrol.c                               |  4 +-
 mm/slub.c                                     |  3 +-
 mm/vmstat.c                                   |  3 +-
 net/bridge/br_cfm.c                           |  6 +-
 net/bridge/br_mrp.c                           |  8 +--
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
 net/smc/af_smc.c                              |  6 +-
 net/smc/smc_core.c                            |  4 +-
 net/tls/tls_device.c                          |  2 +-
 net/unix/garbage.c                            |  2 +-
 net/vmw_vsock/af_vsock.c                      |  2 +-
 net/vmw_vsock/virtio_transport.c              |  2 +-
 net/vmw_vsock/vsock_loopback.c                |  2 +-
 net/wireless/core.c                           |  4 +-
 net/wireless/sysfs.c                          |  2 +-
 rust/kernel/workqueue.rs                      | 12 ++--
 sound/soc/codecs/aw88081.c                    |  2 +-
 sound/soc/codecs/aw88166.c                    |  2 +-
 sound/soc/codecs/aw88261.c                    |  2 +-
 sound/soc/codecs/aw88395/aw88395.c            |  2 +-
 sound/soc/codecs/aw88399.c                    |  2 +-
 sound/soc/codecs/cs42l43-jack.c               |  6 +-
 sound/soc/codecs/cs42l43.c                    |  4 +-
 sound/soc/codecs/es8326.c                     | 12 ++--
 sound/soc/codecs/rt5663.c                     |  6 +-
 sound/soc/codecs/wm_adsp.c                    |  2 +-
 sound/soc/intel/boards/sof_es8336.c           |  2 +-
 sound/soc/sof/intel/cnl.c                     |  2 +-
 sound/soc/sof/intel/hda-ipc.c                 |  2 +-
 virt/kvm/eventfd.c                            |  2 +-
 367 files changed, 750 insertions(+), 587 deletions(-)

-- 
2.49.0

