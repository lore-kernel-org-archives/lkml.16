Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A5A19047C
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 05:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250862; cv=none; b=Eiccrje936B9S7ZrZU9YOQuP6cIcmphI+8jo1ykz3SiTLhtSNT03cjAkoPUPfzBujoaW+6ymlpv67wV3Fag2kLvKSCb2n5X0ZUcOrSDDzvRT8D6thUMwDpMseeBkz3mEmex4rtviW/prSf38xnCZhpPwHUUegiZyy6EsXlT8Jtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250862; c=relaxed/simple;
	bh=ixQqq9TOiTuGlFGWEu46HfN+LWQ7KEfmKTUV4uQs9Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PJY4kmdg7KBjJt1+vMTggtFeCrf2DIbeUsfIC/Y2lbCclYD4fCrBZkaRKPkuqaulNb1zCkvwaOaQX2YvyhE8cvfApmYkYFbGiHUkswMBToUlVC6x5zkv9pZqJXUaH3WcmUYno5d2WGVbrvqzvJx5DjT0DRlnfP2KZg6544AzjFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=IpK5r8fe; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="IpK5r8fe"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433TYHw031628;
	Sat, 3 May 2025 05:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=AP+OJZ1DEjSmaYJDlKP3dQemBQKZ
	2ZdYVOwmxHMYi/s=; b=IpK5r8fe9cxGxNpN9KU9H3YnBxcDm5AM5Z496dUzvjDY
	oqM9iI1BR/yRHKSKAzsQurpCumDpVl+bFWtKgkxruKhqNB4JYTRs+lp8+i7+7C4s
	uE4/q7+qnEVR2xl+kwVZU0zVQZVt0ipyNcxO5WIHBHmPCPLoZDMabqytk2QuCvqj
	YxqOsjIjWiOY94aYzGq0GHxs1vAWK2xOmBUq/n4Amq9G91INnFQghW4ueugvoFSO
	IKDS+zuq61fujjUE3LqrBG/Iww28/tAr9FZ7vQz8FkrS4Y8y6VqyGZeawODF/pXF
	DssBlRc0ZuhYyQSTgKN996OnH5PdrucCurqynlgCbw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46d8jr0p4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 05:40:29 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5435eTMe017865;
	Sat, 3 May 2025 05:40:29 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46d8jr0p49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 05:40:29 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54351lt2031665;
	Sat, 3 May 2025 05:40:28 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4699tun6aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 05:40:28 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5435eQah57999766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 3 May 2025 05:40:26 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFCBC20043;
	Sat,  3 May 2025 05:40:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61DF720040;
	Sat,  3 May 2025 05:40:23 +0000 (GMT)
Received: from li-06431bcc-2712-11b2-a85c-a6fe68df28f9.ibm.com.com (unknown [9.124.222.98])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  3 May 2025 05:40:23 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v3 1/3] driver/base: Optimize memory block registration to reduce boot time
Date: Sat,  3 May 2025 11:10:12 +0530
Message-ID: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=TduWtQQh c=1 sm=1 tr=0 ts=6815ac4e cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=xwvsNI4MMw8m2L9-Us0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2n7Szz-jteel8-ihGXEUnnoZJPFdNe7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NSBTYWx0ZWRfX/ETkuodmosJk ZfNvrhQhMsn3o6sqHSeyK8klY8XY12EO+nKx3AMpOgxIYcE67fhKAm07tS/fyH8WriYkMHqWr7m UZk/tXPYjPjYunW/GVo8rR6FgcGuqDZ6ka41QIdBqQHEysZmjKAz+GtJpvVHwwbCurPNUA5Oemb
 ffd1Prdq3hsPXKJANaF7vUoynbhgxZJk+Qxo/rOgIo/kzBPMlRSxOw7fCxI/t0HGkuAQbDFhZdc 6ImHg81P/EOw3Ti4Pt8khmWKqjtUgQIB4kEWtzeblXIvDlzBUmWylb5LK1sU8DSBgyc7w1M1Nnw y0QcplrCg3IUz2NWT14I4eFF8eVMnkByyn8B0rWJWC+Dch8xTNHorOB7x3TdDo1U2+aPlsNo/1E
 HKJTLFYcIvuTd+nAG67KVOgHCMFCc6khBejfpCOUGK8zj5bLa8H0OSpTXBa+G2FdyCk4Y4Iv
X-Proofpoint-ORIG-GUID: bLqejnqJVAmAZVXxKtNRoLShU1y45iyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=822 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030045

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

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---
v2 -> v3

Fixed indentation issues, made `start_block_id` and `end_block_id` constants,
and moved variable declarations to the places where they are needed.

v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
 drivers/base/memory.c  |  4 ++--
 drivers/base/node.c    | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/memory.h |  2 ++
 include/linux/node.h   | 11 +++++------
 4 files changed, 47 insertions(+), 8 deletions(-)

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
index cd13ef287011..0f8a4645b26c 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/swap.h>
 #include <linux/slab.h>
+#include <linux/memblock.h>
 
 static const struct bus_type node_subsys = {
 	.name = "node",
@@ -850,6 +851,43 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
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
+ */
+void register_memory_blocks_under_node_early(int nid)
+{
+	struct memblock_region *r;
+
+	for_each_mem_region(r) {
+		if (r->nid != nid)
+			continue;
+
+		const unsigned long start_block_id = phys_to_block_id(r->base);
+		const unsigned long end_block_id = phys_to_block_id(r->base + r->size - 1);
+		unsigned long block_id;
+
+		for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
+			struct memory_block *mem;
+
+			mem = find_memory_block_by_id(block_id);
+			if (!mem)
+				continue;
+
+			do_register_memory_block_under_node(nid, mem, MEMINIT_EARLY);
+			put_device(&mem->dev);
+		}
+
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
index 2b7517892230..93beefe8f179 100644
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
+static inline void register_memory_blocks_under_node_early(int nid)
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

