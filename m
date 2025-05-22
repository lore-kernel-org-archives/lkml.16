Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69552686AF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905483; cv=none; b=VBvkC76/2T1RpfBOaFV5sG+ejvWnbVB67iK1Gp53AzmTNgDfkxjv3l7S45m7q+dgl/RFezJsLorb8WKK5RBGV4YuxEUr1ffRhdhNpUTQiI1ZTw1OT5+iOW5O8DLWCxPhP/gZ/jpr3dz8IJMh91qWJMb/o1N6iol80xBrE+OY8mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905483; c=relaxed/simple;
	bh=6kRRkCpruYG0GxeQkAQzDxagzYgGihbcs669u1bEpLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b/kCJaK++x9FUP32pWPlpSqu65IRbRKPnI/yahNHy2HWJBJgZ06LZvYtpd8yjuxut3637hmef55//FJprCbc4xs1nTU1+SmOSncdUkpukk912+5OliM/JuInssMerjZNaQNT4NNN2sh+3gFUQGI1Ws5q2OU9w6zyzflkVZJ5+QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Pak1SCnU; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Pak1SCnU"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LMchwQ006712;
	Thu, 22 May 2025 09:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=lBDpZiO1yUtTyxHpkb7qLwmM8OHE
	SiXqRzpIRSysli4=; b=Pak1SCnUm0vn0lkHVGST3stHug/QlC/W5UgToDDithnx
	LjYQWC7TAmuErqikGcEzGCSgiyMbd+JVbIYfu1vig2Y0WMuAASW2f6nkOylZr+Ra
	MJ+cuJgQ7EXvQQBfPAcKHFLJHvtT6G1bCpcoGiH9R5f6a4Z59OIBAVMH4QdL2+OO
	+wE46HsMV8HK+OU/pvqzFTAG9XD+5dqbGB/DECuzAlSYUARiH76wjPDpIFUZaNlP
	v5v6mDiawoxd35J6roGkmWG6ZOsvzmv/z/NkZzLefiwsEl9NlTot215kVSRT/eF+
	0ijRo/TvJCEkOoIrBB/6ZztM0nQgzx2ii+XIOUAeAw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sg234s8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:17:39 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54M9GImx022491;
	Thu, 22 May 2025 09:17:39 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sg234s8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:17:39 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54M5KKEo020708;
	Thu, 22 May 2025 09:17:38 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46rwkq0rga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:17:38 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54M9Ha4K15008102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 09:17:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D03A220043;
	Thu, 22 May 2025 09:17:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3A5320040;
	Thu, 22 May 2025 09:17:34 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 May 2025 09:17:34 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v5 1/4] drivers/base/node: Optimize memory block registration to reduce boot time
Date: Thu, 22 May 2025 04:17:28 -0500
Message-ID: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: LUMnjde9qio-gsYLBeN9QusqwaycjVgV
X-Authority-Analysis: v=2.4 cv=RPmzH5i+ c=1 sm=1 tr=0 ts=682eebb4 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Ikd4Dj_1AAAA:8 a=RTzChAaceUBdyRMociwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA5MSBTYWx0ZWRfX9I2IoEh8COtq ceA2mGtdJIY0N6Co1krUNfXzLWyxSjBEWDQMdD/Y/34Gv8mL7lk7E/QfAbDyKFGKF+UUIaeFOXw nFNBiXfLGdBm4NIx4SrsNCOShpav0LwKP2XQKm8ahuS5NsWFenNVlkY3mZzHV/J16YWADrxq3Tg
 pUzJLTZk6hTF42jso9glAlblMRX+p5dDhYTpUDV8ARjitWz/x7LtD4JY95vpoSCUDp8g5UySwX7 xd/EyslJ3iBSg4hAJ6gmLz+5Z3u+Ftfur/P0j7dQUTh7C6V2RuQwuBlGU7TAYS2EXzFW25P8zmE 5NXTqBAqQ90ysk35COzpoIAwlmagDVCKgdUivZ8zPvr0Lo4MFASHy+SCuRdKvFDKDbeI/9vtshK
 UCTq7qAPP7XKJMXjTTPmmrKYUyw747rYiqzdbyEgFK2ONku3h8kgBvENCkrzNeGKry2iMyIe
X-Proofpoint-GUID: QUqjqLTmuIxyIVezXSYGb6VrCDuUMpdD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220091

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

for_each_memory_region(r): // r => region
  if (!node_online(r->nid)):
    continue;
  else
    for_each_memory_block_between(r->base, r->base + r->size - 1):
      do_register_memory_block_under_node(r->nid, mem_blk, MEMINIT_EARLY);

We iterate over all memblock regions, and if the node associated with the
region is online, we calculate the start and end memory blocks based on the
region's start and end PFNs. We then register all the memory blocks within
that range under the region node.

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

Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---
v4 -> v5

1. Moved all helpers(memory_block_id(), pfn_to_block_id(), and phys_to_block_id())
   into memory.h and exported sections_per_block.
2. register_memory_blocks_early() moved out of for_each_online_node().
   Now we iterate over all memory regions at once and register the
   memory blocks.

   Tested corner cases where memory blocks span across multiple memblock regions; it
   is working fine.

   #cd /sys/devices/system/node/
   # find node1/  |grep memory0
   node1/memory0
   # find node0/  |grep memory0
   node0/memory0
   # find node0/  |grep memory0
   node2/memory0
   # cat node0/memory0/valid_zones
   none

V4 - https://lore.kernel.org/all/f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com/
V3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
 drivers/base/memory.c  | 21 ++++----------------
 drivers/base/node.c    | 45 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/memory.h | 19 +++++++++++++++++-
 include/linux/node.h   |  3 +++
 4 files changed, 68 insertions(+), 20 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 19469e7f88c2..39fcc075a36f 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -22,6 +22,7 @@
 #include <linux/stat.h>
 #include <linux/slab.h>
 #include <linux/xarray.h>
+#include <linux/export.h>
 
 #include <linux/atomic.h>
 #include <linux/uaccess.h>
@@ -48,22 +49,8 @@ int mhp_online_type_from_str(const char *str)
 
 #define to_memory_block(dev) container_of(dev, struct memory_block, dev)
 
-static int sections_per_block;
-
-static inline unsigned long memory_block_id(unsigned long section_nr)
-{
-	return section_nr / sections_per_block;
-}
-
-static inline unsigned long pfn_to_block_id(unsigned long pfn)
-{
-	return memory_block_id(pfn_to_section_nr(pfn));
-}
-
-static inline unsigned long phys_to_block_id(unsigned long phys)
-{
-	return pfn_to_block_id(PFN_DOWN(phys));
-}
+int sections_per_block;
+EXPORT_SYMBOL(sections_per_block);
 
 static int memory_subsys_online(struct device *dev);
 static int memory_subsys_offline(struct device *dev);
@@ -632,7 +619,7 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
  *
  * Called under device_hotplug_lock.
  */
-static struct memory_block *find_memory_block_by_id(unsigned long block_id)
+struct memory_block *find_memory_block_by_id(unsigned long block_id)
 {
 	struct memory_block *mem;
 
diff --git a/drivers/base/node.c b/drivers/base/node.c
index cd13ef287011..e8b6f6b9ce51 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/swap.h>
 #include <linux/slab.h>
+#include <linux/memblock.h>
 
 static const struct bus_type node_subsys = {
 	.name = "node",
@@ -850,6 +851,41 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
 			  kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
 }
 
+/*
+ * register_memory_blocks_under_node_early : Register the memory blocks
+ *                 under the nodes.
+ *
+ * This function iterates over all memblock regions, and if the node associated with
+ * the region is online, calculates the start and end memory blocks based on the
+ * region's start and end PFNs. Then, registers all the memory blocks within that
+ * range under the region node.
+ */
+static void register_memory_blocks_under_node_early(void)
+{
+	struct memblock_region *r;
+
+	for_each_mem_region(r) {
+		const unsigned long start_block_id = phys_to_block_id(r->base);
+		const unsigned long end_block_id = phys_to_block_id(r->base + r->size - 1);
+		unsigned long block_id;
+
+		if (!node_online(r->nid))
+			continue;
+
+		for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
+			struct memory_block *mem;
+
+			mem = find_memory_block_by_id(block_id);
+			if (!mem)
+				continue;
+
+			do_register_memory_block_under_node(r->nid, mem, MEMINIT_EARLY);
+			put_device(&mem->dev);
+		}
+
+	}
+}
+
 void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
 				       unsigned long end_pfn,
 				       enum meminit_context context)
@@ -971,11 +1007,16 @@ void __init node_dev_init(void)
 
 	/*
 	 * Create all node devices, which will properly link the node
-	 * to applicable memory block devices and already created cpu devices.
+	 * to already created cpu devices.
 	 */
 	for_each_online_node(i) {
-		ret = register_one_node(i);
+		ret =  __register_one_node(i);
 		if (ret)
 			panic("%s() failed to add node: %d\n", __func__, ret);
 	}
+
+	/*
+	 * Link the node to memory block devices
+	 */
+	register_memory_blocks_under_node_early();
 }
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 12daa6ec7d09..2a61088e17ad 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -171,12 +171,30 @@ struct memory_group *memory_group_find_by_id(int mgid);
 typedef int (*walk_memory_groups_func_t)(struct memory_group *, void *);
 int walk_dynamic_memory_groups(int nid, walk_memory_groups_func_t func,
 			       struct memory_group *excluded, void *arg);
+struct memory_block *find_memory_block_by_id(unsigned long block_id);
 #define hotplug_memory_notifier(fn, pri) ({		\
 	static __meminitdata struct notifier_block fn##_mem_nb =\
 		{ .notifier_call = fn, .priority = pri };\
 	register_memory_notifier(&fn##_mem_nb);			\
 })
 
+extern int sections_per_block;
+
+static inline unsigned long memory_block_id(unsigned long section_nr)
+{
+	return section_nr / sections_per_block;
+}
+
+static inline unsigned long pfn_to_block_id(unsigned long pfn)
+{
+	return memory_block_id(pfn_to_section_nr(pfn));
+}
+
+static inline unsigned long phys_to_block_id(unsigned long phys)
+{
+	return pfn_to_block_id(PFN_DOWN(phys));
+}
+
 #ifdef CONFIG_NUMA
 void memory_block_add_nid(struct memory_block *mem, int nid,
 			  enum meminit_context context);
@@ -188,5 +206,4 @@ void memory_block_add_nid(struct memory_block *mem, int nid,
  * can sleep.
  */
 extern struct mutex text_mutex;
-
 #endif /* _LINUX_MEMORY_H_ */
diff --git a/include/linux/node.h b/include/linux/node.h
index 2b7517892230..5c763253c42c 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -120,6 +120,9 @@ static inline void register_memory_blocks_under_node(int nid, unsigned long star
 						     enum meminit_context context)
 {
 }
+static inline void register_memory_blocks_under_node_early(void)
+{
+}
 #endif
 
 extern void unregister_node(struct node *node);
-- 
2.43.5

