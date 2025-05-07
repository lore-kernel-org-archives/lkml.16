Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C385210186
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603287; cv=none; b=GiFXAhNCMjBHU5koomJxf/aeeTHJCrXLd8SoqV9OJrsvP/FkDbkZB6VUZBn37/jjSvQSp43WbLrZ3H8vgyn6AbJ75P8T9unLQJHLgZCwFmv4c4Weiyl/9vPzbWjV5b3WQyYRot2DlLuB3qtHJF394O6N8XQpvyIBxcr0c9QMiBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603287; c=relaxed/simple;
	bh=pOF4/KiGX1fGTlJv6ObAnOUE2nT3wOC88EZ/k8ydyY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vCMRlIUjnU66A5LjXW8vpPu1PhvsDwGEsLrgioa3mDFB1Xs76esuDYYI6T1wsgQX4K2n0xdbBT+d0P9LQHaCdKnk9fSyhCuZYOKHOih97WvEkzQHUawbm5TWpuCg3CWVxiTgVzA/nYJ7W7ug9lqurIB4L37aupK9hFkOcU3WvWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8BxJHASDRto_+LXAA--.26279S3;
	Wed, 07 May 2025 15:34:42 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMAxTsUNDRto5Hi5AA--.50042S2;
	Wed, 07 May 2025 15:34:41 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Increase max supported CPUs up to 2048
Date: Wed,  7 May 2025 15:34:28 +0800
Message-ID: <20250507073428.216090-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxTsUNDRto5Hi5AA--.50042S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCryfKw17ZrW5JrWxKFykJFc_yoWrAry7pF
	yqkr95JFWxWF4fArWkt3s8Wrn8J3Z7Cw4aq3W3uas7AF42qw4UXrs5Jr98ZFyUXa95JrWI
	9ws3G3WagF48Z3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_
	ZF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07jhdb8UUUUU=

Increase max supported CPUs up to 2048, including:
1. Increase CSR.CPUID register's effective width;
2. Define MAX_CORE_PIC (a.k.a. max physical ID) to 2048;
3. Allow NR_CPUS (a.k.a. max logical ID) to be as large as 2048;
4. Introduce acpi_numa_x2apic_affinity_init() to handle ACPI SRAT
   for CPUID >= 256.

Note: The reason of increasing to 2048 rather than 4096/8192 is because
      the IPI hardware can only support 2048 as a maximum.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Kconfig                 |  6 ++--
 arch/loongarch/include/asm/acpi.h      |  2 +-
 arch/loongarch/include/asm/loongarch.h |  4 +--
 arch/loongarch/kernel/acpi.c           | 41 ++++++++++++++++++++++----
 4 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 38706186cf13..0c356de91bc4 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -496,10 +496,10 @@ config HOTPLUG_CPU
 	  Say N if you want to disable CPU hotplug.
 
 config NR_CPUS
-	int "Maximum number of CPUs (2-256)"
-	range 2 256
+	int "Maximum number of CPUs (2-2048)"
+	range 2 2048
+	default "2048"
 	depends on SMP
-	default "64"
 	help
 	  This allows you to specify the maximum number of CPUs which this
 	  kernel will support.
diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
index 313f66f7913a..7376840fa9f7 100644
--- a/arch/loongarch/include/asm/acpi.h
+++ b/arch/loongarch/include/asm/acpi.h
@@ -33,7 +33,7 @@ static inline bool acpi_has_cpu_in_madt(void)
 	return true;
 }
 
-#define MAX_CORE_PIC 256
+#define MAX_CORE_PIC 2048
 
 extern struct list_head acpi_wakeup_device_list;
 extern struct acpi_madt_core_pic acpi_core_pic[MAX_CORE_PIC];
diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 52651aa0e583..d84dac88a584 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -411,8 +411,8 @@
 
 /* Config CSR registers */
 #define LOONGARCH_CSR_CPUID		0x20	/* CPU core id */
-#define  CSR_CPUID_COREID_WIDTH		9
-#define  CSR_CPUID_COREID		_ULCAST_(0x1ff)
+#define  CSR_CPUID_COREID_WIDTH		11
+#define  CSR_CPUID_COREID		_ULCAST_(0x7ff)
 
 #define LOONGARCH_CSR_PRCFG1		0x21	/* Config1 */
 #define  CSR_CONF1_VSMAX_SHIFT		12
diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
index 1120ac2824f6..fba4bb93e1bd 100644
--- a/arch/loongarch/kernel/acpi.c
+++ b/arch/loongarch/kernel/acpi.c
@@ -244,11 +244,6 @@ void __init acpi_boot_table_init(void)
 
 #ifdef CONFIG_ACPI_NUMA
 
-static __init int setup_node(int pxm)
-{
-	return acpi_map_pxm_to_node(pxm);
-}
-
 void __init numa_set_distance(int from, int to, int distance)
 {
 	if ((u8)distance != distance || (from == to && distance != LOCAL_DISTANCE)) {
@@ -280,7 +275,41 @@ acpi_numa_processor_affinity_init(struct acpi_srat_cpu_affinity *pa)
 		pxm |= (pa->proximity_domain_hi[1] << 16);
 		pxm |= (pa->proximity_domain_hi[2] << 24);
 	}
-	node = setup_node(pxm);
+	node = acpi_map_pxm_to_node(pxm);
+	if (node < 0) {
+		pr_err("SRAT: Too many proximity domains %x\n", pxm);
+		bad_srat();
+		return;
+	}
+
+	if (pa->apic_id >= CONFIG_NR_CPUS) {
+		pr_info("SRAT: PXM %u -> CPU 0x%02x -> Node %u skipped apicid that is too big\n",
+				pxm, pa->apic_id, node);
+		return;
+	}
+
+	early_numa_add_cpu(pa->apic_id, node);
+
+	set_cpuid_to_node(pa->apic_id, node);
+	node_set(node, numa_nodes_parsed);
+	pr_info("SRAT: PXM %u -> CPU 0x%02x -> Node %u\n", pxm, pa->apic_id, node);
+}
+
+void __init
+acpi_numa_x2apic_affinity_init(struct acpi_srat_x2apic_cpu_affinity *pa)
+{
+	int pxm, node;
+
+	if (srat_disabled())
+		return;
+	if (pa->header.length < sizeof(struct acpi_srat_x2apic_cpu_affinity)) {
+		bad_srat();
+		return;
+	}
+	if ((pa->flags & ACPI_SRAT_CPU_ENABLED) == 0)
+		return;
+	pxm = pa->proximity_domain;
+	node = acpi_map_pxm_to_node(pxm);
 	if (node < 0) {
 		pr_err("SRAT: Too many proximity domains %x\n", pxm);
 		bad_srat();
-- 
2.47.1

