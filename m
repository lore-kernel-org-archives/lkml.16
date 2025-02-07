Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CEC1DAC88
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952406; cv=none; b=TDt5Z0ktE1vWCGsDAUov44/JM+c/moXHnbEXHWLhUSb+MoUGuqQciVNzr4Ol5c4edkJ+cZGf/85hAeOiN4Wibh8EqQAyEbgv4u4ClFJ/RhXv8roeCpY1/rpF0A9RBoFupB+5ID0mVY7wh+qtATlyopMiu621txA8l3frzHePV0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952406; c=relaxed/simple;
	bh=1u6RzWVbbKQf60QiRK9xnlpmVTf34EgGKUwK+MDSDgY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HYyatdOjAygYaLtZnVPhIQnBaJXzdnvPa1vzfrjJJ9ohWxYLM7EXKgivIhzhyt2SgLSRZniHM9fjqIAiVmKMhm4a7AngqVwxqMoulS5U0TsgKjA2pIJMg43ZC5bI/ZkOFsDTllBzMSHVYSwOLFShgke00DwhfCI4ZFw9cOnaeZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DC84113E;
	Fri,  7 Feb 2025 10:20:27 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 407103F63F;
	Fri,  7 Feb 2025 10:20:01 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>,
	Babu Moger <Babu.Moger@amd.com>,
	James Morse <james.morse@arm.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v6 23/42] x86/resctrl: Add resctrl_arch_ prefix to pseudo lock functions
Date: Fri,  7 Feb 2025 18:18:04 +0000
Message-Id: <20250207181823.6378-24-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250207181823.6378-1-james.morse@arm.com>
References: <20250207181823.6378-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resctrl's pseudo lock has some copy-to-cache and measurement
functions that are micro-architecture specific.

For example, pseudo_lock_fn() is not at all portable.

Label these 'resctrl_arch_' so they stay under /arch/x86.
To expose these functions to the filesystem code they need an entry
in a header file, and can't be marked static.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
Changes since v5:
 * Expanded commit message.
---
 arch/x86/include/asm/resctrl.h            |  5 ++++
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 36 ++++++++++++-----------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 6d4c7ea2c9e3..86407dbde583 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -203,6 +203,11 @@ static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, int evtid
 static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r, int evtid,
 					     void *ctx) { };
 
+u64 resctrl_arch_get_prefetch_disable_bits(void);
+int resctrl_arch_pseudo_lock_fn(void *_rdtgrp);
+int resctrl_arch_measure_cycles_lat_fn(void *_plr);
+int resctrl_arch_measure_l2_residency(void *_plr);
+int resctrl_arch_measure_l3_residency(void *_plr);
 void resctrl_cpu_detect(struct cpuinfo_x86 *c);
 
 #else
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 42cc162f7fc9..d078b89380dd 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -61,7 +61,8 @@ static const struct class pseudo_lock_class = {
 };
 
 /**
- * get_prefetch_disable_bits - prefetch disable bits of supported platforms
+ * resctrl_arch_get_prefetch_disable_bits - prefetch disable bits of supported
+ *                                          platforms
  * @void: It takes no parameters.
  *
  * Capture the list of platforms that have been validated to support
@@ -75,13 +76,13 @@ static const struct class pseudo_lock_class = {
  * in the SDM.
  *
  * When adding a platform here also add support for its cache events to
- * measure_cycles_perf_fn()
+ * resctrl_arch_measure_l*_residency()
  *
  * Return:
  * If platform is supported, the bits to disable hardware prefetchers, 0
  * if platform is not supported.
  */
-static u64 get_prefetch_disable_bits(void)
+u64 resctrl_arch_get_prefetch_disable_bits(void)
 {
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
 	    boot_cpu_data.x86 != 6)
@@ -408,7 +409,7 @@ static void pseudo_lock_free(struct rdtgroup *rdtgrp)
 }
 
 /**
- * pseudo_lock_fn - Load kernel memory into cache
+ * resctrl_arch_pseudo_lock_fn - Load kernel memory into cache
  * @_rdtgrp: resource group to which pseudo-lock region belongs
  *
  * This is the core pseudo-locking flow.
@@ -426,7 +427,7 @@ static void pseudo_lock_free(struct rdtgroup *rdtgrp)
  *
  * Return: 0. Waiter on waitqueue will be woken on completion.
  */
-static int pseudo_lock_fn(void *_rdtgrp)
+int resctrl_arch_pseudo_lock_fn(void *_rdtgrp)
 {
 	struct rdtgroup *rdtgrp = _rdtgrp;
 	struct pseudo_lock_region *plr = rdtgrp->plr;
@@ -712,7 +713,7 @@ int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp)
 	 * Not knowing the bits to disable prefetching implies that this
 	 * platform does not support Cache Pseudo-Locking.
 	 */
-	prefetch_disable_bits = get_prefetch_disable_bits();
+	prefetch_disable_bits = resctrl_arch_get_prefetch_disable_bits();
 	if (prefetch_disable_bits == 0) {
 		rdt_last_cmd_puts("Pseudo-locking not supported\n");
 		return -EINVAL;
@@ -872,7 +873,8 @@ bool rdtgroup_pseudo_locked_in_hierarchy(struct rdt_ctrl_domain *d)
 }
 
 /**
- * measure_cycles_lat_fn - Measure cycle latency to read pseudo-locked memory
+ * resctrl_arch_measure_cycles_lat_fn - Measure cycle latency to read
+ *                                      pseudo-locked memory
  * @_plr: pseudo-lock region to measure
  *
  * There is no deterministic way to test if a memory region is cached. One
@@ -885,7 +887,7 @@ bool rdtgroup_pseudo_locked_in_hierarchy(struct rdt_ctrl_domain *d)
  *
  * Return: 0. Waiter on waitqueue will be woken on completion.
  */
-static int measure_cycles_lat_fn(void *_plr)
+int resctrl_arch_measure_cycles_lat_fn(void *_plr)
 {
 	struct pseudo_lock_region *plr = _plr;
 	u32 saved_low, saved_high;
@@ -1069,7 +1071,7 @@ static int measure_residency_fn(struct perf_event_attr *miss_attr,
 	return 0;
 }
 
-static int measure_l2_residency(void *_plr)
+int resctrl_arch_measure_l2_residency(void *_plr)
 {
 	struct pseudo_lock_region *plr = _plr;
 	struct residency_counts counts = {0};
@@ -1107,7 +1109,7 @@ static int measure_l2_residency(void *_plr)
 	return 0;
 }
 
-static int measure_l3_residency(void *_plr)
+int resctrl_arch_measure_l3_residency(void *_plr)
 {
 	struct pseudo_lock_region *plr = _plr;
 	struct residency_counts counts = {0};
@@ -1205,14 +1207,14 @@ static int pseudo_lock_measure_cycles(struct rdtgroup *rdtgrp, int sel)
 	plr->cpu = cpu;
 
 	if (sel == 1)
-		thread = kthread_run_on_cpu(measure_cycles_lat_fn, plr,
-					    cpu, "pseudo_lock_measure/%u");
+		thread = kthread_run_on_cpu(resctrl_arch_measure_cycles_lat_fn,
+					     plr, cpu, "pseudo_lock_measure/%u");
 	else if (sel == 2)
-		thread = kthread_run_on_cpu(measure_l2_residency, plr,
-					    cpu, "pseudo_lock_measure/%u");
+		thread = kthread_run_on_cpu(resctrl_arch_measure_l2_residency,
+					    plr, cpu, "pseudo_lock_measure/%u");
 	else if (sel == 3)
-		thread = kthread_run_on_cpu(measure_l3_residency, plr,
-					    cpu, "pseudo_lock_measure/%u");
+		thread = kthread_run_on_cpu(resctrl_arch_measure_l3_residency,
+					    plr, cpu, "pseudo_lock_measure/%u");
 	else
 		goto out;
 
@@ -1307,7 +1309,7 @@ int rdtgroup_pseudo_lock_create(struct rdtgroup *rdtgrp)
 
 	plr->thread_done = 0;
 
-	thread = kthread_run_on_cpu(pseudo_lock_fn, rdtgrp,
+	thread = kthread_run_on_cpu(resctrl_arch_pseudo_lock_fn, rdtgrp,
 				    plr->cpu, "pseudo_lock/%u");
 	if (IS_ERR(thread)) {
 		ret = PTR_ERR(thread);
-- 
2.39.2

