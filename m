Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AE2201013
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612481; cv=none; b=fR7ms4ig7YldsJRPlzYLgCofaCqqoyL0rdFjv4OjRvxhoBPd6TeVF40jPLJ4bNiABocSOUAiddV1vhGCSSRAB2dFi/8H8IUgu8z1P6hL9xS2Mg1YPsk/OHlmKsranBGZXp2xUXJnkXF4Dbz15j66fIWHX3/4KujcBbmeSi7vkYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612481; c=relaxed/simple;
	bh=U0/nZAubY8+r5O3G6691e1aNV1onsOPcC+SLvzROEtA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CdpAB7x2/kGJM+18u0TWEWNkhH607dhrwjwarpd/9zghZoI7hJ+VnMm043VGEO8lb5/osDrW6mQblQPeUKQKO4VQkpBl7ELGrAwKwc4YLfu2oLLug8nI90p/J45XNGj1SCN6uoYWqicYc69aIh7RCCTxt5L3JNBDDRFxMNiRXhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8BxJHD9MBtorwvYAA--.26554S3;
	Wed, 07 May 2025 18:07:57 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMCxLcX8MBtoJMW5AA--.9644S2;
	Wed, 07 May 2025 18:07:56 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Hongliang Wang <wanghongliang@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V3] LoongArch: Add SCHED_MC (Multi-core scheduler) support
Date: Wed,  7 May 2025 18:07:55 +0800
Message-Id: <20250507100755.9129-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxLcX8MBtoJMW5AA--.9644S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Ww1kAr18tFWUGFWkWw1UXFc_yoW7Ww15pr
	nruFyrGr48WFnxA39Yq3yruryrWrn7Gr4Sqw43KFWfAFsrXw1UJr1vqF9rXFyUC39YqFWS
	gr98GayFga4UXacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UUUUU==

In order to achieve more reasonable load balancing behavior, add
SCHED_MC (Multi-core scheduler) support.

The LLC distribution of LoongArch now is consistent with NUMA node,
the balancing domain of SCHED_MC can effectively reduce the situation
where processes are awakened to smt_sibling.

Co-developed-by: Hongliang Wang <wanghongliang@loongson.cn>
Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Kconfig                |  9 +++++++
 arch/loongarch/include/asm/smp.h      |  1 +
 arch/loongarch/include/asm/topology.h |  8 ++++++
 arch/loongarch/kernel/smp.c           | 38 +++++++++++++++++++++++++++
 4 files changed, 56 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 1a2cf012b8f2..609b15a26621 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -456,6 +456,15 @@ config SCHED_SMT
 	  Improves scheduler's performance when there are multiple
 	  threads in one physical core.
 
+config SCHED_MC
+	bool "Multi-core scheduler support"
+	depends on SMP
+	default y
+	help
+	  Multi-core scheduler support improves the CPU scheduler's decision
+	  making when dealing with multi-core CPU chips at a cost of slightly
+	  increased overhead in some places.
+
 config SMP
 	bool "Multi-Processing support"
 	help
diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index b87d1d5e5890..ad0bd234a0f1 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -25,6 +25,7 @@ extern int smp_num_siblings;
 extern int num_processors;
 extern int disabled_cpus;
 extern cpumask_t cpu_sibling_map[];
+extern cpumask_t cpu_llc_shared_map[];
 extern cpumask_t cpu_core_map[];
 extern cpumask_t cpu_foreign_map[];
 
diff --git a/arch/loongarch/include/asm/topology.h b/arch/loongarch/include/asm/topology.h
index 50273c9187d0..6726298a85ec 100644
--- a/arch/loongarch/include/asm/topology.h
+++ b/arch/loongarch/include/asm/topology.h
@@ -36,6 +36,14 @@ void numa_set_distance(int from, int to, int distance);
 #define topology_sibling_cpumask(cpu)		(&cpu_sibling_map[cpu])
 #endif
 
+/*
+ * Return cpus that shares the last level cache.
+ */
+static inline const struct cpumask *cpu_coregroup_mask(int cpu)
+{
+	return &cpu_llc_shared_map[cpu];
+}
+
 #include <asm-generic/topology.h>
 
 static inline void arch_fix_phys_package_id(int num, u32 slot) { }
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 4b24589c0b56..46036d98da75 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -46,6 +46,10 @@ EXPORT_SYMBOL(__cpu_logical_map);
 cpumask_t cpu_sibling_map[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(cpu_sibling_map);
 
+/* Representing the last level cache shared map of each logical CPU */
+cpumask_t cpu_llc_shared_map[NR_CPUS] __read_mostly;
+EXPORT_SYMBOL(cpu_llc_shared_map);
+
 /* Representing the core map of multi-core chips of each logical CPU */
 cpumask_t cpu_core_map[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(cpu_core_map);
@@ -63,6 +67,9 @@ EXPORT_SYMBOL(cpu_foreign_map);
 /* representing cpus for which sibling maps can be computed */
 static cpumask_t cpu_sibling_setup_map;
 
+/* representing cpus for which llc shared maps can be computed */
+static cpumask_t cpu_llc_shared_setup_map;
+
 /* representing cpus for which core maps can be computed */
 static cpumask_t cpu_core_setup_map;
 
@@ -102,6 +109,34 @@ static inline void set_cpu_core_map(int cpu)
 	}
 }
 
+static inline void set_cpu_llc_shared_map(int cpu)
+{
+	int i;
+
+	cpumask_set_cpu(cpu, &cpu_llc_shared_setup_map);
+
+	for_each_cpu(i, &cpu_llc_shared_setup_map) {
+		if (cpu_to_node(cpu) == cpu_to_node(i)) {
+			cpumask_set_cpu(i, &cpu_llc_shared_map[cpu]);
+			cpumask_set_cpu(cpu, &cpu_llc_shared_map[i]);
+		}
+	}
+}
+
+static inline void clear_cpu_llc_shared_map(int cpu)
+{
+	int i;
+
+	for_each_cpu(i, &cpu_llc_shared_setup_map) {
+		if (cpu_to_node(cpu) == cpu_to_node(i)) {
+			cpumask_clear_cpu(i, &cpu_llc_shared_map[cpu]);
+			cpumask_clear_cpu(cpu, &cpu_llc_shared_map[i]);
+		}
+	}
+
+	cpumask_clear_cpu(cpu, &cpu_llc_shared_setup_map);
+}
+
 static inline void set_cpu_sibling_map(int cpu)
 {
 	int i;
@@ -406,6 +441,7 @@ int loongson_cpu_disable(void)
 #endif
 	set_cpu_online(cpu, false);
 	clear_cpu_sibling_map(cpu);
+	clear_cpu_llc_shared_map(cpu);
 	calculate_cpu_foreign_map();
 	local_irq_save(flags);
 	irq_migrate_all_off_this_cpu();
@@ -572,6 +608,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	current_thread_info()->cpu = 0;
 	loongson_prepare_cpus(max_cpus);
 	set_cpu_sibling_map(0);
+	set_cpu_llc_shared_map(0);
 	set_cpu_core_map(0);
 	calculate_cpu_foreign_map();
 #ifndef CONFIG_HOTPLUG_CPU
@@ -613,6 +650,7 @@ asmlinkage void start_secondary(void)
 	loongson_init_secondary();
 
 	set_cpu_sibling_map(cpu);
+	set_cpu_llc_shared_map(cpu);
 	set_cpu_core_map(cpu);
 
 	notify_cpu_starting(cpu);
-- 
2.20.1

