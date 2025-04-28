Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC43427B4E8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859859; cv=none; b=CHZlXt9fBoNjKM3p92oey6NPZZ2w4UQHRg6mg03OymXtEFEfQJelt2ZVwrl+flwZno8zRyJdVKK6n6N7EFuA0JscEe02f0qeNZ6NE46K+E++RPtCVMah6QkRUm2yQOAtougZLA+ueeL1xDzZN+yZlX7CdJHNZbz4JyuJ/L0FJIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859859; c=relaxed/simple;
	bh=oo+bAkBh3Ifwd6ou7d+ukIRqcbPf0Tyy5+1iAmf93Bc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jUnE/qgxAvc+yRNOktjfDqEONdBPUGTU1f3rIxGHlCY/6bSvfIpHYTwBcVsDtTFiSRvpZaCh1j0DlRoMrSfxTv6vSfrQZsemGSlEfDINlnue2nmTQIFxnisOHHFJUvNCtv+TTh4sH/Rlsnlr52qyRO/Yu3YTf/HT4udhOpzxc8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EBFTi4Om; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EBFTi4Om"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAecjs022759;
	Mon, 28 Apr 2025 17:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=ra7a3JR6/w1bgNT/XNXzzRdtbwDX
	fRlC0bVk0TkeZsM=; b=EBFTi4Om2TCtXH/ov8+flL0qm3A7UsuuzxVVS/SoUDw4
	0vHq+ye3khas9GhfaURv4mQ09pW2BJ2NENfYE67MxLDo2ltrWrw4LokyDeok0AAL
	G/4E3Km7WyBMCbxNxTivmOacf/0rQkEeD4rt5Dl7Y/zE7+9q5NgPOCcDwg8z37eE
	F6uQ76GseljWBuaMchAtUsMahsiPIdozfhQ4mCPohLBLKT6RJUWgnehA8zDUZk5Y
	CqvOzwwzlrlrT0Ol0BHuwFyqkLOSm/D7tHAeeTg/UrKOMgXYNLcleBstPcmpWOfF
	v5DX+O+neo9V5kLadl6KriOr8/LuwOpZU/JMY5vegw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46a84s1v83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 17:03:57 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53SGm4FL006763;
	Mon, 28 Apr 2025 17:03:57 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46a84s1v80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 17:03:57 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53SF55o1016122;
	Mon, 28 Apr 2025 17:03:56 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469a707jc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 17:03:56 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53SH3sLn33817124
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 17:03:54 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FE8A2004B;
	Mon, 28 Apr 2025 17:03:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D493020040;
	Mon, 28 Apr 2025 17:03:50 +0000 (GMT)
Received: from li-06431bcc-2712-11b2-a85c-a6fe68df28f9.ibm.com.com (unknown [9.39.16.18])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 17:03:50 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v2 1/2] driver/base: Optimize memory block registration to reduce boot time
Date: Mon, 28 Apr 2025 22:33:46 +0530
Message-ID: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Mchsu4/f c=1 sm=1 tr=0 ts=680fb4fd cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=xwvsNI4MMw8m2L9-Us0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzNiBTYWx0ZWRfX9cpfZh7O2Cl+ HY9khMC2SMhjP6ioOBjFE0SmhJPvCOm+Y3evms0/+/JSFwSg+CKRMjWcZ+W69nrkmbjzfcr/z2S R+YKBYHDNdxEfezP5/aF6g2RlQcwKxR50+/8B58HTWcC25+E87Hu17FAzwupxRwzYvud/XWztTr
 dBIhBH0LPVmbkuxhKSdlhdY9V+l5NG7R1FDnVzntc+/t11+o4aJOG8hYlNoazKq100+4Tr2Z9t1 TyizbRy0pEjEeOtcJiPQkYPCc9cFiRcYCy++xumxMqNm351WmLzbFL3TP+zkj6Ce7EmA2rOYw5B a9hmO0s7rxRvPpmqbcgd3SboO26OTRmd6199LYlEgjxSYUliHT1mZ+rTvAySKhnM2nHT7LqO2OR
 0DvHNHoIU34zczpxrzCtcK/2RMkMLLIWUFsTkNpVUkqaRK6jKz45rK9PD+uF0N8R8s6aKAl5
X-Proofpoint-ORIG-GUID: KaaQPWMbq-Xf9LHlXdmB5tGKvISvZgWv
X-Proofpoint-GUID: MbgBmvYER7BBdanPS0AmUAsCQbOedb2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=952 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280136

During node device initialization, `memory blocks` are registered under
each NUMA node. The `memory blocks` to be registered are identified using
the node’s start and end PFNs, which are obtained from the node's pg_data

However, not all PFNs within this range necessarily belong to the same
node—some may belong to other nodes. Additionally, due to the
discontiguous nature of physical memory, certain sections within a
`memory block` may be absent.

As a result, `memory blocks` that fall between a node’s start and end
PFNs may span across multiple nodes, and some sections within those blocks
may be missing. `Memory blocks` have a fixed size, which is architecture
dependent.

Due to these considerations, the memory block registration is currently
performed as follows:

for_each_online_node(nid):
    start_pfn = pgdat->node_start_pfn;
    end_pfn = pgdat->node_start_pfn + node_spanned_pages;
    for_each_memory_block_between(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn))
        mem_blk = memory_block_id(pfn_to_section_nr(pfn));
        pfn_mb_start=section_nr_to_pfn(mem_blk->start_section_nr)
        pfn_mb_end = pfn_start + memory_block_pfns - 1
        for (pfn = pfn_mb_start; pfn < pfn_mb_end; pfn++):
            if (get_nid_for_pfn(pfn) != nid):
                continue;
            else
                do_register_memory_block_under_node(nid, mem_blk,
                                                        MEMINIT_EARLY);

Here, we derive the start and end PFNs from the node's pg_data, then
determine the memory blocks that may belong to the node. For each
`memory block` in this range, we inspect all PFNs it contains and check
their associated NUMA node ID. If a PFN within the block matches the
current node, the memory block is registered under that node.

If CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, get_nid_for_pfn() performs
a binary search in the `memblock regions` to determine the NUMA node ID
for a given PFN. If it is not enabled, the node ID is retrieved directly
from the struct page.

On large systems, this process can become time-consuming, especially since
we iterate over each `memory block` and all PFNs within it until a match is
found. When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, the additional
overhead of the binary search increases the execution time significantly,
potentially leading to soft lockups during boot.

In this patch, we iterate over `memblock region` to identify the
`memory blocks` that belong to the current NUMA node. `memblock regions`
are contiguous memory ranges, each associated with a single NUMA node, and
they do not span across multiple nodes.

for_each_online_node(nid):
  for_each_memory_region(r): // r => region
    if (r->nid != nid):
      continue;
    else
      for_each_memory_block_between(r->base, r->base + r->size - 1):
        do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);

We iterate over all `memblock regions` and identify those that belong to
the current NUMA node. For each `memblock region` associated with the
current node, we calculate the start and end `memory blocks` based on the
region's start and end PFNs. We then register all `memory blocks` within
that range under the current node.

Test Results on My system with 32TB RAM
=======================================
1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.

Without this patch
------------------
Startup finished in 1min 16.528s (kernel)

With this patch
---------------
Startup finished in 17.236s (kernel) - 78% Improvement

2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.

Without this patch
------------------
Startup finished in 28.320s (kernel)

With this patch
---------------
Startup finished in 15.621s (kernel) - 46% Improvement

Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---

v1->v2

Reworked the implementation according to suggestions from
Mike Rapoport[1]

[1] - https://lore.kernel.org/all/Z_j2Gv9n4DOj6LSs@kernel.org/

v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
 drivers/base/memory.c  |  4 ++--
 drivers/base/node.c    | 39 +++++++++++++++++++++++++++++++++++++++
 include/linux/memory.h |  2 ++
 include/linux/node.h   | 11 +++++------
 4 files changed, 48 insertions(+), 8 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 19469e7f88c2..7f1d266ae593 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -60,7 +60,7 @@ static inline unsigned long pfn_to_block_id(unsigned long pfn)
 	return memory_block_id(pfn_to_section_nr(pfn));
 }
 
-static inline unsigned long phys_to_block_id(unsigned long phys)
+unsigned long phys_to_block_id(unsigned long phys)
 {
 	return pfn_to_block_id(PFN_DOWN(phys));
 }
@@ -632,7 +632,7 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
  *
  * Called under device_hotplug_lock.
  */
-static struct memory_block *find_memory_block_by_id(unsigned long block_id)
+struct memory_block *find_memory_block_by_id(unsigned long block_id)
 {
 	struct memory_block *mem;
 
diff --git a/drivers/base/node.c b/drivers/base/node.c
index cd13ef287011..4869333d366d 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/swap.h>
 #include <linux/slab.h>
+#include <linux/memblock.h>
 
 static const struct bus_type node_subsys = {
 	.name = "node",
@@ -850,6 +851,44 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
 			  kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
 }
 
+/*
+ * register_memory_blocks_under_node_early : Register the memory
+ *		  blocks under the current node.
+ * @nid : Current node under registration
+ *
+ * This function iterates over all memblock regions and identifies the regions
+ * that belong to the current node. For each region which belongs to current
+ * node, it calculates the start and end memory blocks based on the region's
+ * start and end PFNs. It then registers all memory blocks within that range
+ * under the current node.
+ *
+ */
+void register_memory_blocks_under_node_early(int nid)
+{
+	struct memblock_region *r;
+	unsigned long start_block_id;
+	unsigned long end_block_id;
+	struct memory_block *mem;
+	unsigned long block_id;
+
+	for_each_mem_region(r) {
+		if (r->nid == nid) {
+			start_block_id = phys_to_block_id(r->base);
+			end_block_id = phys_to_block_id(r->base + r->size - 1);
+
+			for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
+				mem = find_memory_block_by_id(block_id);
+				if (!mem)
+					continue;
+
+				do_register_memory_block_under_node(nid, mem, MEMINIT_EARLY);
+				put_device(&mem->dev);
+			}
+
+		}
+	}
+}
+
 void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
 				       unsigned long end_pfn,
 				       enum meminit_context context)
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 12daa6ec7d09..cb8579226536 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -171,6 +171,8 @@ struct memory_group *memory_group_find_by_id(int mgid);
 typedef int (*walk_memory_groups_func_t)(struct memory_group *, void *);
 int walk_dynamic_memory_groups(int nid, walk_memory_groups_func_t func,
 			       struct memory_group *excluded, void *arg);
+unsigned long phys_to_block_id(unsigned long phys);
+struct memory_block *find_memory_block_by_id(unsigned long block_id);
 #define hotplug_memory_notifier(fn, pri) ({		\
 	static __meminitdata struct notifier_block fn##_mem_nb =\
 		{ .notifier_call = fn, .priority = pri };\
diff --git a/include/linux/node.h b/include/linux/node.h
index 2b7517892230..c5a8a7f0aac7 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -114,12 +114,16 @@ extern struct node *node_devices[];
 void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
 				       unsigned long end_pfn,
 				       enum meminit_context context);
+void register_memory_blocks_under_node_early(int nid);
 #else
 static inline void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
 						     unsigned long end_pfn,
 						     enum meminit_context context)
 {
 }
+void register_memory_blocks_under_node_early(int nid)
+{
+}
 #endif
 
 extern void unregister_node(struct node *node);
@@ -134,15 +138,10 @@ static inline int register_one_node(int nid)
 	int error = 0;
 
 	if (node_online(nid)) {
-		struct pglist_data *pgdat = NODE_DATA(nid);
-		unsigned long start_pfn = pgdat->node_start_pfn;
-		unsigned long end_pfn = start_pfn + pgdat->node_spanned_pages;
-
 		error = __register_one_node(nid);
 		if (error)
 			return error;
-		register_memory_blocks_under_node(nid, start_pfn, end_pfn,
-						  MEMINIT_EARLY);
+		register_memory_blocks_under_node_early(nid);
 	}
 
 	return error;
-- 
2.48.1

