Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E696A2C179F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926451; cv=none; b=IbdDIHNtggFBfc7W39nmVpFtKA4ex1Rjmzl2zaFKNhG5eZFo0YMvAIauKDaPJknkWfau/EuCUqnM5we2oIRssXwiMTxtj+84x/t4n7pD0g9p9oRaoOl52t4YZfiLzVkApv5PdszVwUE+1TLYAtfD/2g3OzqP798ch4ByvrDuiw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926451; c=relaxed/simple;
	bh=KWEB8PMtnhPIlHb205F+2wsaPBR3GxRNp19huh8bJYo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=laIYN9QcK62GvQSE5lkYo5gMNMSyR0n3bcRksIf6/r5ARmUkmBVah/HNGt9TWynKgt89b+KhCSaBZ3LXhFW9DBDE7UIE+LA+VmeCbAX85TLno0u67k7Bb+lU9k4FxhDjz6RBH8wjkIwN6Qu1MHQO+Mr/4z1rUINiWC/P9i+pCBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8AxbeImuRBoaNHJAA--.33962S3;
	Tue, 29 Apr 2025 19:33:58 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMDx_MQmuRBoUcadAA--.896S2;
	Tue, 29 Apr 2025 19:33:58 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	wanghongliang@loongson.cn,
	yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH] LoongArch:support CONFIG_SCHED_MC
Date: Tue, 29 Apr 2025 19:33:56 +0800
Message-Id: <20250429113356.17929-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDx_MQmuRBoUcadAA--.896S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Ww1kXFWDGrW5Jr13uryDurX_yoW7Wr43pr
	nruFyrGrW8WFn3A3yYq3yrur95urn7Gry2qa13KFyfAFsrXw1UJr1vqFZxXF1UG395XrWS
	gr98GFWFgay8X3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUUUUU==

From: wanghongliang <wanghongliang@loongson.cn>

In order to achieve more reasonable load balancing behavior,
support for SCHED_MC has been added.
The LLC distribution of Loongarch now is consistent with numa-node,
the balancing domain of SCHED_MC can effectively reduce the situation
where processes are awakened to smt_slibing

Co-developed-by: wanghongliang <wanghongliang@loongson.cn>
Signed-off-by: wanghongliang <wanghongliang@loongson.cn>
Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 arch/loongarch/Kconfig                |  9 ++++++
 arch/loongarch/include/asm/smp.h      |  1 +
 arch/loongarch/include/asm/topology.h |  8 +++++
 arch/loongarch/kernel/smp.c           | 46 +++++++++++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 1a2cf012b..72a142a85 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -493,6 +493,15 @@ config NR_CPUS
 	  This allows you to specify the maximum number of CPUs which this
 	  kernel will support.
 
+config SCHED_MC
+	def_bool y
+	prompt "Multi-core scheduler support"
+	depends on SMP
+	help
+	  Multi-core scheduler support improves the CPU scheduler's decision
+	  making when dealing with multi-core CPU chips at a cost of slightly
+	  increased overhead in some places. If unsure say N here.
+
 config NUMA
 	bool "NUMA Support"
 	select SMP
diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index b87d1d5e5..13955d726 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -26,6 +26,7 @@ extern int num_processors;
 extern int disabled_cpus;
 extern cpumask_t cpu_sibling_map[];
 extern cpumask_t cpu_core_map[];
+extern cpumask_t cpu_llc_shared_map[];
 extern cpumask_t cpu_foreign_map[];
 
 void loongson_smp_setup(void);
diff --git a/arch/loongarch/include/asm/topology.h b/arch/loongarch/include/asm/topology.h
index 50273c918..dfaf45d57 100644
--- a/arch/loongarch/include/asm/topology.h
+++ b/arch/loongarch/include/asm/topology.h
@@ -36,6 +36,14 @@ void numa_set_distance(int from, int to, int distance);
 #define topology_sibling_cpumask(cpu)		(&cpu_sibling_map[cpu])
 #endif
 
+/*
+ * return cpus that shares the last level cache.
+ */
+static inline const struct cpumask *cpu_coregroup_mask(int cpu)
+{
+	return &cpu_llc_shared_map[cpu];
+}
+
 #include <asm-generic/topology.h>
 
 static inline void arch_fix_phys_package_id(int num, u32 slot) { }
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 4b24589c0..7b9e996a1 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -50,6 +50,9 @@ EXPORT_SYMBOL(cpu_sibling_map);
 cpumask_t cpu_core_map[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(cpu_core_map);
 
+cpumask_t cpu_llc_shared_map[NR_CPUS] __read_mostly;
+EXPORT_SYMBOL(cpu_llc_shared_map);
+
 static DECLARE_COMPLETION(cpu_starting);
 static DECLARE_COMPLETION(cpu_running);
 
@@ -66,6 +69,10 @@ static cpumask_t cpu_sibling_setup_map;
 /* representing cpus for which core maps can be computed */
 static cpumask_t cpu_core_setup_map;
 
+/* representing cpus for which llc sibling maps can be computed */
+static cpumask_t cpu_llc_shared_setup_map;
+
+
 struct secondary_data cpuboot_data;
 static DEFINE_PER_CPU(int, cpu_state);
 
@@ -102,6 +109,42 @@ static inline void set_cpu_core_map(int cpu)
 	}
 }
 
+static inline bool cpus_are_shared_llc(int cpua, int cpub)
+{
+	if (cpu_to_node(cpua) != cpu_to_node(cpub))
+		return false;
+
+	return true;
+}
+
+static inline void set_cpu_llc_shared_map(int cpu)
+{
+	int i;
+
+	cpumask_set_cpu(cpu, &cpu_llc_shared_setup_map);
+
+	for_each_cpu(i, &cpu_llc_shared_setup_map) {
+		if (cpus_are_shared_llc(cpu, i)) {
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
+		if (cpus_are_shared_llc(cpu, i)) {
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
@@ -406,6 +449,7 @@ int loongson_cpu_disable(void)
 #endif
 	set_cpu_online(cpu, false);
 	clear_cpu_sibling_map(cpu);
+	clear_cpu_llc_shared_map(cpu);
 	calculate_cpu_foreign_map();
 	local_irq_save(flags);
 	irq_migrate_all_off_this_cpu();
@@ -573,6 +617,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	loongson_prepare_cpus(max_cpus);
 	set_cpu_sibling_map(0);
 	set_cpu_core_map(0);
+	set_cpu_llc_shared_map(0);
 	calculate_cpu_foreign_map();
 #ifndef CONFIG_HOTPLUG_CPU
 	init_cpu_present(cpu_possible_mask);
@@ -614,6 +659,7 @@ asmlinkage void start_secondary(void)
 
 	set_cpu_sibling_map(cpu);
 	set_cpu_core_map(cpu);
+	set_cpu_llc_shared_map(cpu);
 
 	notify_cpu_starting(cpu);
 
-- 
2.43.0

