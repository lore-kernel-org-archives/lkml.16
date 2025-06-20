Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0586D2D5422
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432997; cv=none; b=TJcmBrqCe7YLuwmgIFeo5pVNnZvkQa4Uy6tK7lQFpxZKrFtMw8Y8jkIBX7aXxZE8VJHlFmbmp4y/Ckb7xlaWhb9XJ9WPPcq0gU2RnVOIZpV2Mws1a7YtYCzRkNNO3aW1qEbBc6SYspQZKdExY4yFD6n/URZFcplfOJMUW4oyzbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432997; c=relaxed/simple;
	bh=TBtcOpkcjcgReECVhMix4kGzTvhmxxJWRFsSJZ944+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gyx7yGqB4MfmB5CEcwTleRI4gOggL3yKpY5qUqgLf4fzI+SYcO/DDfxZcWBSGzLdPNclN4QMJqRkgwS9P8l7eBGeW+dfm6f70tsZgZ+TtOJHYRD7bt+9Aa5kDYH+LqzQ5BjvlIhNQeuR0a0VwNMnxFU2cqsn49HdxZJxjmtPNcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdbEulxw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdbEulxw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE7BC4CEF0;
	Fri, 20 Jun 2025 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750432996;
	bh=TBtcOpkcjcgReECVhMix4kGzTvhmxxJWRFsSJZ944+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UdbEulxwOe4Prc2pFVwWjt23Mv4Y/vBiRWMW8hpM9ieWR5FKP0rS1QuQLn8uhHbfJ
	 QBPi/ZVmsBGXoWIfcLVUXbryy+9hemov/Z7DQNjxykbtD87TCT+XGk5MXH+ZFEr3OU
	 CA2TeLHzzaFJGz842TbIo2jcQFb4M2dTc4e3K+u/gnx5se5SBT3PqpA8i+bMpQHhk4
	 TqtB3lj23wg76WNSpEMJ5WYs1kILPlCfYpDgiwHiEk4WnKgoa4B5hSrJoCWiR+XX+E
	 ztFZagfIrHZFaPxUMpDVSq0zem+8P4N/y2cIqKgFqOIvh3dwh0ioduYk9k5uP7ycAx
	 fDumS2gJUgp5Q==
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
Subject: [PATCH 01/27] sched/isolation: Remove housekeeping static key
Date: Fri, 20 Jun 2025 17:22:42 +0200
Message-ID: <20250620152308.27492-2-frederic@kernel.org>
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

The housekeeping static key in its current use is mostly irrelevant.
Most of the time, a housekeeping function call had already been issued
before the static call got a chance to be evaluated, defeating the
initial call optimization purpose.

housekeeping_cpu() is the sole correct user performing the static call
before the actual slow-path function call. But it's seldom used in
fast-path.

Finally the static call prevents from synchronizing correctly against
dynamic updates of the housekeeping cpumasks through cpusets.

Get away with a simple flag test instead.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/sched/isolation.h | 25 +++++----
 kernel/sched/isolation.c        | 90 ++++++++++++++-------------------
 2 files changed, 55 insertions(+), 60 deletions(-)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index d8501f4709b5..f98ba0d71c52 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -25,12 +25,22 @@ enum hk_type {
 };
 
 #ifdef CONFIG_CPU_ISOLATION
-DECLARE_STATIC_KEY_FALSE(housekeeping_overridden);
+extern unsigned long housekeeping_flags;
+
 extern int housekeeping_any_cpu(enum hk_type type);
 extern const struct cpumask *housekeeping_cpumask(enum hk_type type);
 extern bool housekeeping_enabled(enum hk_type type);
 extern void housekeeping_affine(struct task_struct *t, enum hk_type type);
 extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
+
+static inline bool housekeeping_cpu(int cpu, enum hk_type type)
+{
+	if (housekeeping_flags & BIT(type))
+		return housekeeping_test_cpu(cpu, type);
+	else
+		return true;
+}
+
 extern void __init housekeeping_init(void);
 
 #else
@@ -58,17 +68,14 @@ static inline bool housekeeping_test_cpu(int cpu, enum hk_type type)
 	return true;
 }
 
+static inline bool housekeeping_cpu(int cpu, enum hk_type type)
+{
+	return true;
+}
+
 static inline void housekeeping_init(void) { }
 #endif /* CONFIG_CPU_ISOLATION */
 
-static inline bool housekeeping_cpu(int cpu, enum hk_type type)
-{
-#ifdef CONFIG_CPU_ISOLATION
-	if (static_branch_unlikely(&housekeeping_overridden))
-		return housekeeping_test_cpu(cpu, type);
-#endif
-	return true;
-}
 
 static inline bool cpu_is_isolated(int cpu)
 {
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 93b038d48900..83cec3853864 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -14,19 +14,13 @@ enum hk_flags {
 	HK_FLAG_KERNEL_NOISE	= BIT(HK_TYPE_KERNEL_NOISE),
 };
 
-DEFINE_STATIC_KEY_FALSE(housekeeping_overridden);
-EXPORT_SYMBOL_GPL(housekeeping_overridden);
-
-struct housekeeping {
-	cpumask_var_t cpumasks[HK_TYPE_MAX];
-	unsigned long flags;
-};
-
-static struct housekeeping housekeeping;
+static cpumask_var_t housekeeping_cpumasks[HK_TYPE_MAX];
+unsigned long housekeeping_flags;
+EXPORT_SYMBOL_GPL(housekeeping_flags);
 
 bool housekeeping_enabled(enum hk_type type)
 {
-	return !!(housekeeping.flags & BIT(type));
+	return !!(housekeeping_flags & BIT(type));
 }
 EXPORT_SYMBOL_GPL(housekeeping_enabled);
 
@@ -34,50 +28,46 @@ int housekeeping_any_cpu(enum hk_type type)
 {
 	int cpu;
 
-	if (static_branch_unlikely(&housekeeping_overridden)) {
-		if (housekeeping.flags & BIT(type)) {
-			cpu = sched_numa_find_closest(housekeeping.cpumasks[type], smp_processor_id());
-			if (cpu < nr_cpu_ids)
-				return cpu;
+	if (housekeeping_flags & BIT(type)) {
+		cpu = sched_numa_find_closest(housekeeping_cpumasks[type], smp_processor_id());
+		if (cpu < nr_cpu_ids)
+			return cpu;
 
-			cpu = cpumask_any_and_distribute(housekeeping.cpumasks[type], cpu_online_mask);
-			if (likely(cpu < nr_cpu_ids))
-				return cpu;
-			/*
-			 * Unless we have another problem this can only happen
-			 * at boot time before start_secondary() brings the 1st
-			 * housekeeping CPU up.
-			 */
-			WARN_ON_ONCE(system_state == SYSTEM_RUNNING ||
-				     type != HK_TYPE_TIMER);
-		}
+		cpu = cpumask_any_and_distribute(housekeeping_cpumasks[type], cpu_online_mask);
+		if (likely(cpu < nr_cpu_ids))
+			return cpu;
+		/*
+		 * Unless we have another problem this can only happen
+		 * at boot time before start_secondary() brings the 1st
+		 * housekeeping CPU up.
+		 */
+		WARN_ON_ONCE(system_state == SYSTEM_RUNNING ||
+			     type != HK_TYPE_TIMER);
 	}
+
 	return smp_processor_id();
 }
 EXPORT_SYMBOL_GPL(housekeeping_any_cpu);
 
 const struct cpumask *housekeeping_cpumask(enum hk_type type)
 {
-	if (static_branch_unlikely(&housekeeping_overridden))
-		if (housekeeping.flags & BIT(type))
-			return housekeeping.cpumasks[type];
+	if (housekeeping_flags & BIT(type))
+		return housekeeping_cpumasks[type];
 	return cpu_possible_mask;
 }
 EXPORT_SYMBOL_GPL(housekeeping_cpumask);
 
 void housekeeping_affine(struct task_struct *t, enum hk_type type)
 {
-	if (static_branch_unlikely(&housekeeping_overridden))
-		if (housekeeping.flags & BIT(type))
-			set_cpus_allowed_ptr(t, housekeeping.cpumasks[type]);
+	if (housekeeping_flags & BIT(type))
+		set_cpus_allowed_ptr(t, housekeeping_cpumasks[type]);
 }
 EXPORT_SYMBOL_GPL(housekeeping_affine);
 
 bool housekeeping_test_cpu(int cpu, enum hk_type type)
 {
-	if (static_branch_unlikely(&housekeeping_overridden))
-		if (housekeeping.flags & BIT(type))
-			return cpumask_test_cpu(cpu, housekeeping.cpumasks[type]);
+	if (housekeeping_flags & BIT(type))
+		return cpumask_test_cpu(cpu, housekeeping_cpumasks[type]);
 	return true;
 }
 EXPORT_SYMBOL_GPL(housekeeping_test_cpu);
@@ -86,17 +76,15 @@ void __init housekeeping_init(void)
 {
 	enum hk_type type;
 
-	if (!housekeeping.flags)
+	if (!housekeeping_flags)
 		return;
 
-	static_branch_enable(&housekeeping_overridden);
-
-	if (housekeeping.flags & HK_FLAG_KERNEL_NOISE)
+	if (housekeeping_flags & HK_FLAG_KERNEL_NOISE)
 		sched_tick_offload_init();
 
-	for_each_set_bit(type, &housekeeping.flags, HK_TYPE_MAX) {
+	for_each_set_bit(type, &housekeeping_flags, HK_TYPE_MAX) {
 		/* We need at least one CPU to handle housekeeping work */
-		WARN_ON_ONCE(cpumask_empty(housekeeping.cpumasks[type]));
+		WARN_ON_ONCE(cpumask_empty(housekeeping_cpumasks[type]));
 	}
 }
 
@@ -104,8 +92,8 @@ static void __init housekeeping_setup_type(enum hk_type type,
 					   cpumask_var_t housekeeping_staging)
 {
 
-	alloc_bootmem_cpumask_var(&housekeeping.cpumasks[type]);
-	cpumask_copy(housekeeping.cpumasks[type],
+	alloc_bootmem_cpumask_var(&housekeeping_cpumasks[type]);
+	cpumask_copy(housekeeping_cpumasks[type],
 		     housekeeping_staging);
 }
 
@@ -115,7 +103,7 @@ static int __init housekeeping_setup(char *str, unsigned long flags)
 	unsigned int first_cpu;
 	int err = 0;
 
-	if ((flags & HK_FLAG_KERNEL_NOISE) && !(housekeeping.flags & HK_FLAG_KERNEL_NOISE)) {
+	if ((flags & HK_FLAG_KERNEL_NOISE) && !(housekeeping_flags & HK_FLAG_KERNEL_NOISE)) {
 		if (!IS_ENABLED(CONFIG_NO_HZ_FULL)) {
 			pr_warn("Housekeeping: nohz unsupported."
 				" Build with CONFIG_NO_HZ_FULL\n");
@@ -137,7 +125,7 @@ static int __init housekeeping_setup(char *str, unsigned long flags)
 	if (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) {
 		__cpumask_set_cpu(smp_processor_id(), housekeeping_staging);
 		__cpumask_clear_cpu(smp_processor_id(), non_housekeeping_mask);
-		if (!housekeeping.flags) {
+		if (!housekeeping_flags) {
 			pr_warn("Housekeeping: must include one present CPU, "
 				"using boot CPU:%d\n", smp_processor_id());
 		}
@@ -146,7 +134,7 @@ static int __init housekeeping_setup(char *str, unsigned long flags)
 	if (cpumask_empty(non_housekeeping_mask))
 		goto free_housekeeping_staging;
 
-	if (!housekeeping.flags) {
+	if (!housekeeping_flags) {
 		/* First setup call ("nohz_full=" or "isolcpus=") */
 		enum hk_type type;
 
@@ -155,26 +143,26 @@ static int __init housekeeping_setup(char *str, unsigned long flags)
 	} else {
 		/* Second setup call ("nohz_full=" after "isolcpus=" or the reverse) */
 		enum hk_type type;
-		unsigned long iter_flags = flags & housekeeping.flags;
+		unsigned long iter_flags = flags & housekeeping_flags;
 
 		for_each_set_bit(type, &iter_flags, HK_TYPE_MAX) {
 			if (!cpumask_equal(housekeeping_staging,
-					   housekeeping.cpumasks[type])) {
+					   housekeeping_cpumasks[type])) {
 				pr_warn("Housekeeping: nohz_full= must match isolcpus=\n");
 				goto free_housekeeping_staging;
 			}
 		}
 
-		iter_flags = flags & ~housekeeping.flags;
+		iter_flags = flags & ~housekeeping_flags;
 
 		for_each_set_bit(type, &iter_flags, HK_TYPE_MAX)
 			housekeeping_setup_type(type, housekeeping_staging);
 	}
 
-	if ((flags & HK_FLAG_KERNEL_NOISE) && !(housekeeping.flags & HK_FLAG_KERNEL_NOISE))
+	if ((flags & HK_FLAG_KERNEL_NOISE) && !(housekeeping_flags & HK_FLAG_KERNEL_NOISE))
 		tick_nohz_full_setup(non_housekeeping_mask);
 
-	housekeeping.flags |= flags;
+	housekeeping_flags |= flags;
 	err = 1;
 
 free_housekeeping_staging:
-- 
2.48.1

