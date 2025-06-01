Received: from outbound.pv.icloud.com (p-west1-cluster6-host6-snip4-6.eps.apple.com [57.103.67.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBD417BD9
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748773849; cv=none; b=mToeiT0mGwrBcZl5cAJSBDP5Xv5vqN69LhUtYe1WHgSVGIh5h4wp6TT86MYB6mOVF5oSKUEPwuCNLIl1VZ6NkRB4IJeGVHqN/WJAcu1qb0y+HpP2+of4/Ohvwvupeh7ZV5pghxza5tSTVmDbg9Nj3TfVq4bnzvb1vOYdOXBcZhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748773849; c=relaxed/simple;
	bh=54QW2Pqp72E0556XnENy/LwdykaqxRDqqyViFp1dgTk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=heRVDnxw+YXMc43ngSIlHkCo1qW3vxWUMHJ+bmi4wRPZMeseI9TeX4fRgmLXtj0WfWDsPZ7gHjbpfX43Xi4fT7R7AFDOUDW19MZtt+02cqDPb4gmSUx7fAKM0H3AICdrcmGxF4birT3tHxRNsdvlyqZChF8hqa4m7UTROR8WgfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=Z8JpKT0F; arc=none smtp.client-ip=57.103.67.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="Z8JpKT0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=ePts62dk6SIVCfGxWE1N8RmUpSKvT+XKHWvpF6Tas+0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type:x-icloud-hme;
	b=Z8JpKT0FaFDU5zy+JbnbdFZQMHFroqPcEWtW22IKTR57HQ7qbnkhollrizTYDvmm6
	 YY3b83umjXWyEPokrV2FQiz4fW9hAhpYvSvVFRjZUbg3bESSt+TpC1LbjdyzKa55F4
	 7Z4StpidHgeCnDvjorAGaJIVgCbFfdc8yngldn8D4wKSuJvlvtzkFDohYGWMfceKFv
	 bvMC/QNdZd8GgI96Ym4xnRTEQ+HGoLKc/InO3qj/8kHLO3eXsSr1uzG+skTvELPZq1
	 5fqsfph3z2k7Vs7PsdR5ULjtiKOUY8NSOSY9r0QlgQ6z5CgHUOkq0p8jVAUEryKuU5
	 xfnqPCDzls4DQ==
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 01CCC18003B7;
	Sun,  1 Jun 2025 10:30:45 +0000 (UTC)
Received: from dedsec-amd0.tail874668.ts.net (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 4FA18180038B;
	Sun,  1 Jun 2025 10:30:43 +0000 (UTC)
From: Yulong Han <wheatfox17@icloud.com>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	broonie@kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yulong Han <wheatfox17@icloud.com>
Subject: [PATCH] LoongArch: Add numa_add_reserved_memblk() support in numa
Date: Sun,  1 Jun 2025 18:29:24 +0800
Message-Id: <20250601102924.2417248-1-wheatfox17@icloud.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0N0PwfQUetrud7knm1Y84oDuFzQJJjTs
X-Proofpoint-ORIG-GUID: 0N0PwfQUetrud7knm1Y84oDuFzQJJjTs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_04,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 clxscore=1011 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503310001 definitions=main-2506010088

This patch fixes the error below when compiling kernel with
loongarch's loongson3_defconfig:

drivers/acpi/numa/srat.c: In function ‘acpi_parse_cfmws’:
drivers/acpi/numa/srat.c:467:13: error: implicit declaration of function
‘numa_add_reserved_memblk’ [-Werror=implicit-function-declaration]
  467 |         if (numa_add_reserved_memblk(node, start, end) < 0) {

The error is caused by the missing the newly added 
numa_add_reserved_memblk (under include/linux/numa_memblks.h) definition
inside loongarch's numa related code.

The commit's code(style) was formatted by ./scripts/checkpatch.pl

Signed-off-by: Yulong Han <wheatfox17@icloud.com>
---
 arch/loongarch/include/asm/numa.h | 13 +++++++------
 arch/loongarch/kernel/numa.c      | 31 ++++++++++++++++++++++++++++---
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/arch/loongarch/include/asm/numa.h b/arch/loongarch/include/asm/numa.h
index b5f9de9f102e4..dc35d20914c82 100644
--- a/arch/loongarch/include/asm/numa.h
+++ b/arch/loongarch/include/asm/numa.h
@@ -28,17 +28,18 @@ struct numa_memblk {
 	int			nid;
 };
 
-#define NR_NODE_MEMBLKS		(MAX_NUMNODES*2)
+#define NR_NODE_MEMBLKS		(MAX_NUMNODES * 2)
 struct numa_meminfo {
 	int			nr_blks;
 	struct numa_memblk	blk[NR_NODE_MEMBLKS];
 };
 
-extern int __init numa_add_memblk(int nodeid, u64 start, u64 end);
+int __init numa_add_memblk(int nodeid, u64 start, u64 end);
+int __init numa_add_reserved_memblk(int nid, u64 start, u64 end);
 
-extern void __init early_numa_add_cpu(int cpuid, s16 node);
-extern void numa_add_cpu(unsigned int cpu);
-extern void numa_remove_cpu(unsigned int cpu);
+void __init early_numa_add_cpu(int cpuid, s16 node);
+void numa_add_cpu(unsigned int cpu);
+void numa_remove_cpu(unsigned int cpu);
 
 static inline void numa_clear_node(int cpu)
 {
@@ -49,7 +50,7 @@ static inline void set_cpuid_to_node(int cpuid, s16 node)
 	__cpuid_to_node[cpuid] = node;
 }
 
-extern int early_cpu_to_node(int cpu);
+int early_cpu_to_node(int cpu);
 
 #else
 
diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index 30a72fd528c0e..0185a9a609897 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -31,6 +31,7 @@ unsigned char node_distances[MAX_NUMNODES][MAX_NUMNODES];
 EXPORT_SYMBOL(node_distances);
 
 static struct numa_meminfo numa_meminfo;
+static struct numa_meminfo numa_reserved_meminfo;
 cpumask_t cpus_on_node[MAX_NUMNODES];
 cpumask_t phys_cpus_on_node[MAX_NUMNODES];
 EXPORT_SYMBOL(cpus_on_node);
@@ -136,12 +137,14 @@ void __init early_numa_add_cpu(int cpuid, s16 node)
 void numa_add_cpu(unsigned int cpu)
 {
 	int nid = cpu_to_node(cpu);
+
 	cpumask_set_cpu(cpu, &cpus_on_node[nid]);
 }
 
 void numa_remove_cpu(unsigned int cpu)
 {
 	int nid = cpu_to_node(cpu);
+
 	cpumask_clear_cpu(cpu, &cpus_on_node[nid]);
 }
 
@@ -155,7 +158,7 @@ static int __init numa_add_memblk_to(int nid, u64 start, u64 end,
 	/* whine about and ignore invalid blks */
 	if (start > end || nid < 0 || nid >= MAX_NUMNODES) {
 		pr_warn("NUMA: Warning: invalid memblk node %d [mem %#010Lx-%#010Lx]\n",
-			   nid, start, end - 1);
+			nid, start, end - 1);
 		return 0;
 	}
 
@@ -187,6 +190,28 @@ int __init numa_add_memblk(int nid, u64 start, u64 end)
 	return numa_add_memblk_to(nid, start, end, &numa_meminfo);
 }
 
+/**
+ * numa_add_reserved_memblk - Add one numa_memblk to numa_reserved_meminfo
+ * @nid: NUMA node ID of the new memblk
+ * @start: Start address of the new memblk
+ * @end: End address of the new memblk
+ *
+ * Add a new memblk to the numa_reserved_meminfo.
+ *
+ * Usage Case: numa_cleanup_meminfo() reconciles all numa_memblk instances
+ * against memblock_type information and moves any that intersect reserved
+ * ranges to numa_reserved_meminfo. However, when that information is known
+ * ahead of time, we use numa_add_reserved_memblk() to add the numa_memblk
+ * to numa_reserved_meminfo directly.
+ *
+ * RETURNS:
+ * 0 on success, -errno on failure.
+ */
+int __init numa_add_reserved_memblk(int nid, u64 start, u64 end)
+{
+	return numa_add_memblk_to(nid, start, end, &numa_reserved_meminfo);
+}
+
 static void __init node_mem_init(unsigned int node)
 {
 	unsigned long start_pfn, end_pfn;
@@ -194,7 +219,7 @@ static void __init node_mem_init(unsigned int node)
 
 	node_addrspace_offset = nid_to_addrbase(node);
 	pr_info("Node%d's addrspace_offset is 0x%lx\n",
-			node, node_addrspace_offset);
+		node, node_addrspace_offset);
 
 	get_pfn_range_for_nid(node, &start_pfn, &end_pfn);
 	pr_info("Node%d: start_pfn=0x%lx, end_pfn=0x%lx\n",
@@ -285,7 +310,7 @@ static void __init init_node_memblock(void)
 		case EFI_MEMORY_MAPPED_IO:
 		case EFI_MEMORY_MAPPED_IO_PORT_SPACE:
 			pr_info("Resvd: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx Bytes\n",
-					mem_type, mem_start, mem_size);
+				mem_type, mem_start, mem_size);
 			break;
 		}
 	}
-- 
2.39.5

