Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823421FECB1
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383642; cv=none; b=ADBTV9utayfeAEFJPrwnZPu8nygJqD5mvaA17tarj4dmkAyWJyy071IEir8LyUkGahW6ekEYD5qyJatQzHoVtqHjl9qwnflsspdHaAUF5JhbGAcHfViz43W9Qyg80p5MLO+eHgTPIzNQ1+dMiCD+6xsNzq576aDVPICQmgpRmWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383642; c=relaxed/simple;
	bh=EdACkA6mjQfWqmwa0qBv7PZgBBiq5HlPdqFD9DoELZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nQTkb5lC50wsQIzgpnHjWbSRznJ8kz9ggJlFnTnbI0bFtVtld2J53RHPeAlSCHEwnA4wz90w7gV5RD1xkENlulTvtFQfLxvDbYGB2RqtpPxLsJq4Y5Az8+QmDE9EHlIrMnDJEk1p3nmuWQs46VZeLwWTC7QM7kTBkn6xqJbZqgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MwU/y4Le; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MwU/y4Le"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G5ugQC016684;
	Fri, 16 May 2025 08:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=FOj3ZuKq9IsMVvh7KnBX3N/X5goe
	E4AUqmzTk5UGGOk=; b=MwU/y4LegwOn7dPzjcyB6ZL808IFDp+H2OyTstklEb6R
	s0MuUXG7EN6ahZ70U6VCrY2C4UUHgOi/wfc/PDBGjDXeZkGp9lvRePY+gjLuwQMW
	waTCJ1wrc1cCkhvby5aKsQypFtvAY0DbOrLPhuRa4/d6T94p3FWmTftqo7ejnGLN
	i5DjIjoMgvIa0vZjQNHPF/KY6WZhYfF7k+7OaPu5a5dDw1Z64IePCZ3pIVCCeYh1
	idUPsZ5UDQ7JdXG3uvtO6XjLtVQvCd3S2yxz7dHr60mgh9PPCsNCWRR6TdPwOxRn
	vTyfF7ws5Xp1jpuixfF92oOtGIPYUaw4o92jlg35OA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46nd4gwx2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:20:22 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54G8KMF6002161;
	Fri, 16 May 2025 08:20:22 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46nd4gwx2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:20:22 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54G67NZr026961;
	Fri, 16 May 2025 08:20:21 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfppkgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:20:20 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54G8KJUh12845374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 08:20:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35C29201EC;
	Fri, 16 May 2025 08:20:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84C40201EB;
	Fri, 16 May 2025 08:20:16 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 May 2025 08:20:16 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v4 1/4] driver/base: Optimize memory block registration to reduce boot time
Date: Fri, 16 May 2025 03:19:51 -0500
Message-ID: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YaEPSMFhGaqrhoP7AYdtJuhUOShA-B-k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA3NSBTYWx0ZWRfX4N8W5Hn80c4q +rt+XQQFB8STwM/tahFyINsYT9jyyQYm6+5ekiV0zZZrQsOnQWKVhovz5Qc0BgsRL6lDIhHoYCP QavMbl/DEoQfg7pKlEz0PVdt7gJSE3CCbVFH0/B3pFuZvyt8mKliio90mGY4XS0i0KUYyYaND0M
 oPYLgfFSPsblwVT7j7nsiMPZOlsZhQ/fDMovDSjKA/WhbYSxGb0kN4aHMBvz5jioZhO8+7PgImO fIWBZaBv9W76uZAe+dRzFKXBcFAE1208BOqMA+vtOx/F6tdBaXIsggnxfZNXYHsneGSI1jyZf+s q5QuT7pUbsUcs8fwbIlbjGZIpjxzdpp10cn8uqLKN/7dtIiGy2XTtE6KpVuaCl0gaWNM3Ue3ii0
 7UfQTs5c72SsrwF54wtsJzSzQQeyerJGxqwbgdB7D21K9Dra+fJjTpryPLiQkwrduI7Hmf3q
X-Proofpoint-ORIG-GUID: b7KtB8zcfvcAoUdxdkNwzOGEEsKnEdW9
X-Authority-Analysis: v=2.4 cv=OsNPyz/t c=1 sm=1 tr=0 ts=6826f546 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8
 a=jP_1eRF1Qyl1rAf-Wa8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_03,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160075

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
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---
v3 -> v4

Addressed Mike's comment by making node_dev_init() call __register_one_node().

V3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
 drivers/base/memory.c  |  4 ++--
 drivers/base/node.c    | 41 ++++++++++++++++++++++++++++++++++++++++-
 include/linux/memory.h |  2 ++
 include/linux/node.h   |  3 +++
 4 files changed, 47 insertions(+), 3 deletions(-)

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
index cd13ef287011..f8cafd8c8fb1 100644
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
+static void register_memory_blocks_under_node_early(int nid)
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
@@ -974,8 +1012,9 @@ void __init node_dev_init(void)
 	 * to applicable memory block devices and already created cpu devices.
 	 */
 	for_each_online_node(i) {
-		ret = register_one_node(i);
+		ret =  __register_one_node(i);
 		if (ret)
 			panic("%s() failed to add node: %d\n", __func__, ret);
+		register_memory_blocks_under_node_early(i);
 	}
 }
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
index 2b7517892230..806e62638cbe 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -120,6 +120,9 @@ static inline void register_memory_blocks_under_node(int nid, unsigned long star
 						     enum meminit_context context)
 {
 }
+static inline void register_memory_blocks_under_node_early(int nid)
+{
+}
 #endif
 
 extern void unregister_node(struct node *node);
-- 
2.43.5

