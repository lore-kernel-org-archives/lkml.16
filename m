Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601AE2EB5CD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433032; cv=none; b=aOVLnqHsrhRPGYxIcxM9jy/upgwEqUMKsAV8FLE8rukoWPR4cMU8z1KSQrI5KW7tk+mmo/4D43SCGNzULed8WYynX9Yx5yfl3cjtjUiTV0IxoaYLVpYww8sO4azn2Uu+3PFQv8h+A19n3wPSTcOl1gM0DjDgNrevpMvMbabXuy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433032; c=relaxed/simple;
	bh=PxV8uVE16ABO59cZv2sbLkYT2OSz4gIZFG6bkET4xxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onxl1IbP+y0qG5cY7kxaLU5A6Y5zJu8Tj/E1J+kezZSkYb51T1E/c8EciAZ/qE/fcMtmWwJmbLsQFcbblB9Hh0Zf9pjTYaduX/hk6HCnP0rnrlQpCUOl9zDTNE0Ygg/vcW6o/4plA5reJXe8EL6oTtxuwxtzUA2hXLet0Tvbjjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+UPX7Y8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+UPX7Y8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34559C4CEEF;
	Fri, 20 Jun 2025 15:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433032;
	bh=PxV8uVE16ABO59cZv2sbLkYT2OSz4gIZFG6bkET4xxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c+UPX7Y8y7agrFwSLTB/Z5E5riFd8+b39XMcNueDLWxdFy5mXGXsgJMQfA2lN+fxR
	 DrPputdojw5lMReE+9WSHGMSixf6OWWCdq5HNuIBTfVYVAfvAACZx3liCPVqoanGh5
	 PXSOu9yl7+GNBhznIa57FiDsUTOlwVeSfbZrcbUWEwY1hKS1wwyXTX4hGoioTKdgsY
	 ZFU6f46jprATJFLLHFaFpDtHYvpTPwvyDrpLW5wB/OPMMLyP1M8/k/DGkxIz4svTjJ
	 JaJyL+ZAdqs0F3tCPqifaHLtiloiiuUio7EAzPA4NXVdALwGUPvfzngxSbkmDNeacU
	 owM0DzpIwVQqw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 14/27] sched/isolation: Convert housekeeping cpumasks to rcu pointers
Date: Fri, 20 Jun 2025 17:22:55 +0200
Message-ID: <20250620152308.27492-15-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620152308.27492-1-frederic@kernel.org>
References: <20250620152308.27492-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HK_TYPE_DOMAIN's cpumask will soon be made modifyable by cpuset.
Sleepable users of housekeeping can synchronize against cpumask
modifications using the housekeeping rwsem. Other callsites need an
alternative.

Turn the housekeeping cpumasks into RCU pointers. Once a housekeeping
cpumask will be modified, the update side will wait for an RCU grace
period and propagate the change to interested subsystem when deemed
necessary.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/sched/isolation.c | 52 ++++++++++++++++++++++++++--------------
 kernel/sched/sched.h     |  1 +
 2 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 9ecf53c5328b..75505668dcb9 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -15,7 +15,7 @@ enum hk_flags {
 	HK_FLAG_KERNEL_NOISE	= BIT(HK_TYPE_KERNEL_NOISE),
 };
 
-static cpumask_var_t housekeeping_cpumasks[HK_TYPE_MAX];
+static struct cpumask __rcu *housekeeping_cpumasks[HK_TYPE_MAX];
 unsigned long housekeeping_flags;
 EXPORT_SYMBOL_GPL(housekeeping_flags);
 
@@ -37,16 +37,25 @@ void housekeeping_unlock(void)
 	percpu_up_read(&housekeeping_pcpu_lock);
 }
 
+const struct cpumask *housekeeping_cpumask(enum hk_type type)
+{
+	if (housekeeping_flags & BIT(type)) {
+		return rcu_dereference_check(housekeeping_cpumasks[type], 1);
+	}
+	return cpu_possible_mask;
+}
+EXPORT_SYMBOL_GPL(housekeeping_cpumask);
+
 int housekeeping_any_cpu(enum hk_type type)
 {
 	int cpu;
 
 	if (housekeeping_flags & BIT(type)) {
-		cpu = sched_numa_find_closest(housekeeping_cpumasks[type], smp_processor_id());
+		cpu = sched_numa_find_closest(housekeeping_cpumask(type), smp_processor_id());
 		if (cpu < nr_cpu_ids)
 			return cpu;
 
-		cpu = cpumask_any_and_distribute(housekeeping_cpumasks[type], cpu_online_mask);
+		cpu = cpumask_any_and_distribute(housekeeping_cpumask(type), cpu_online_mask);
 		if (likely(cpu < nr_cpu_ids))
 			return cpu;
 		/*
@@ -62,25 +71,17 @@ int housekeeping_any_cpu(enum hk_type type)
 }
 EXPORT_SYMBOL_GPL(housekeeping_any_cpu);
 
-const struct cpumask *housekeeping_cpumask(enum hk_type type)
-{
-	if (housekeeping_flags & BIT(type))
-		return housekeeping_cpumasks[type];
-	return cpu_possible_mask;
-}
-EXPORT_SYMBOL_GPL(housekeeping_cpumask);
-
 void housekeeping_affine(struct task_struct *t, enum hk_type type)
 {
 	if (housekeeping_flags & BIT(type))
-		set_cpus_allowed_ptr(t, housekeeping_cpumasks[type]);
+		set_cpus_allowed_ptr(t, housekeeping_cpumask(type));
 }
 EXPORT_SYMBOL_GPL(housekeeping_affine);
 
 bool housekeeping_test_cpu(int cpu, enum hk_type type)
 {
 	if (housekeeping_flags & BIT(type))
-		return cpumask_test_cpu(cpu, housekeeping_cpumasks[type]);
+		return cpumask_test_cpu(cpu, housekeeping_cpumask(type));
 	return true;
 }
 EXPORT_SYMBOL_GPL(housekeeping_test_cpu);
@@ -95,9 +96,23 @@ void __init housekeeping_init(void)
 	if (housekeeping_flags & HK_FLAG_KERNEL_NOISE)
 		sched_tick_offload_init();
 
+	/*
+	 * Realloc with a proper allocator so that any cpumask update
+	 * can indifferently free the old version with kfree().
+	 */
 	for_each_set_bit(type, &housekeeping_flags, HK_TYPE_MAX) {
+		struct cpumask *omask, *nmask = kmalloc(cpumask_size(), GFP_KERNEL);
+
+		if (WARN_ON_ONCE(!nmask))
+			return;
+
+		omask = rcu_dereference(housekeeping_cpumasks[type]);
+
 		/* We need at least one CPU to handle housekeeping work */
-		WARN_ON_ONCE(cpumask_empty(housekeeping_cpumasks[type]));
+		WARN_ON_ONCE(cpumask_empty(omask));
+		cpumask_copy(nmask, omask);
+		RCU_INIT_POINTER(housekeeping_cpumasks[type], nmask);
+		memblock_free(omask, cpumask_size());
 	}
 }
 
@@ -105,9 +120,10 @@ static void __init housekeeping_setup_type(enum hk_type type,
 					   cpumask_var_t housekeeping_staging)
 {
 
-	alloc_bootmem_cpumask_var(&housekeeping_cpumasks[type]);
-	cpumask_copy(housekeeping_cpumasks[type],
-		     housekeeping_staging);
+	struct cpumask *mask = memblock_alloc_or_panic(cpumask_size(), SMP_CACHE_BYTES);
+
+	cpumask_copy(mask, housekeeping_staging);
+	RCU_INIT_POINTER(housekeeping_cpumasks[type], mask);
 }
 
 static int __init housekeeping_setup(char *str, unsigned long flags)
@@ -160,7 +176,7 @@ static int __init housekeeping_setup(char *str, unsigned long flags)
 
 		for_each_set_bit(type, &iter_flags, HK_TYPE_MAX) {
 			if (!cpumask_equal(housekeeping_staging,
-					   housekeeping_cpumasks[type])) {
+					   housekeeping_cpumask(type))) {
 				pr_warn("Housekeeping: nohz_full= must match isolcpus=\n");
 				goto free_housekeeping_staging;
 			}
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 0cdb560ef2f3..407e7f5ad929 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -42,6 +42,7 @@
 #include <linux/ktime_api.h>
 #include <linux/lockdep_api.h>
 #include <linux/lockdep.h>
+#include <linux/memblock.h>
 #include <linux/minmax.h>
 #include <linux/mm.h>
 #include <linux/module.h>
-- 
2.48.1

