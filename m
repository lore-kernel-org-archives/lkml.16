Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3B3F9CB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744176509; cv=none; b=ti4fabYCrOeLuFpZnLrXQxHtfYB0PQmEHKMIo/Vg4OU9xFTYUl1lPWja8js7Uwgm3ipJuLpaajVs6wCorl+KQAnEydzWK1wF74ATXsUMfxJJhPWG2YNqt4heHSo2zLyTewSyyZ8kYtQhm/c7vL3ZJFzJkuTtGmzivDgH51EgH5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744176509; c=relaxed/simple;
	bh=IbFFdw0egMCKCtPUZ1oui8WHqhaYdV7vmsdVcu1ZpRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FUqpzVAN45IhfdH9TE0SOZ4fPFtujqpvsMaEQjOFXYSJ5/lmdKKRdxntZ2b7VJVT4IeB6peWunIWyv0JXEYnPDnue5bOK0vMBHpD3+QmTwBxj4NxXzLEM6UCF0ddxKo5oFUUXt8IhPg+f1fOVSMuivxi55XjxOAoqhtKmRxEelo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ob2FhZlU; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ob2FhZlU"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5390e11H013886;
	Wed, 9 Apr 2025 05:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=g69eVT1ol18IO6QR4WSJPXpCjVxrf+G4BquZYxF4y
	zU=; b=ob2FhZlUPXLhBUXx54RCSnK0+bfs0Scd1dDYNMZ51OG9Ajc8cnFgEtocd
	7x1QYrv3OJD6wwNXPgTNsRUtkTQRGPJDmWwfVFQswoPzjtWvYA9/drKE4ioYa8hH
	YjD887xtoTkEIbf7HilYOFU4Ch3UnhZaL7B9/1CPqVXmcMeUaDA0l2yO/O8+Xlsa
	J2moOe3TPDTyUkA8YBF9igbJZstkUREIN1bt5SwOjAvUZNYzVehxaySwRrZv+fWy
	fxvMAzrRM2krU2VVn1pb+ajwYoCdN7dnmvGNpwVwHBIlubUeINjDl029WoHJjDEe
	F+0CZ5TuWIqQSYWUbanozet8N3bNg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45w57putk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 05:28:16 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5395QNJR002530;
	Wed, 9 Apr 2025 05:28:16 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45w57putjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 05:28:16 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53955Kc9014473;
	Wed, 9 Apr 2025 05:28:14 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ufunp6g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 05:28:14 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5395SCON52756914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 05:28:12 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AC7F20040;
	Wed,  9 Apr 2025 05:28:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 759D720043;
	Wed,  9 Apr 2025 05:28:10 +0000 (GMT)
Received: from li-06431bcc-2712-11b2-a85c-a6fe68df28f9.ibm.com.com (unknown [9.124.222.191])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Apr 2025 05:28:10 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        Mike Rapoport <rppt@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>, Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH 1/2] mm/memblock: Added a New Memblock Function to Check if the Current Node's Memblock Region Intersects with a Memory Block
Date: Wed,  9 Apr 2025 10:57:56 +0530
Message-ID: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LA20b6d-QkhrqUWu8HLC1sjClDJeKaK6
X-Proofpoint-GUID: ZOWH6i46-zSl6W0_NELOitU5EhlJIuV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090020

A new function, curr_node_memblock_intersect_memory_block, has been
added to check if the current node's NID intersects with a memory block.

This function takes the start and end PFN of a memory block, along with
the node ID being registered. It then finds the memblock region of the
current node and check if the passed memory block intersects with it. If
there is an intersection, the function returns true; otherwise, itreturns
false.

There are two scenarios to consider during the search:

1. The memory block size is greater than the memblock region size.

This means that multiple memblocks can be present within a single
memory block. If the start or end of the memblock is within the
start and end of the memory block, it indicates that the memblock
is part of that memory block. Therefore, the memory block can be
added to the node where the memblock resides.

2. The memory block size is less than or equal to the memblock size

This means that multiple memory blocks can be part of a single memblock
region. If the start or end of the memory block is within the start and
end of the memblock, it indicates that the memory block is part of the
memblock. Therefore, the memory block can be added to the node where
the memblock resides.

In the current implementation, during node device initialization, to
find the memory block NID, it iterates over each PFN of the memory
block until it finds a match. On large systems, this can take a
long time.

With this function, the boot time is reduced.

Boot time without this function - 32TB RAM
==========================================
Startup finished in 1min 12.413s (kernel)

Boot time with this function -  32TB RAM
========================================
Startup finished in 18.031s (kernel)

Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 include/linux/memblock.h |  2 ++
 mm/memblock.c            | 67 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index ef5a1ecc6e59..db87f7daa46c 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -277,6 +277,8 @@ static inline bool memblock_is_driver_managed(struct memblock_region *m)
 
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
+bool curr_node_memblock_intersect_memory_block(unsigned long start_pfn,
+				unsigned long end_pfn, int curr_nid);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
 			  unsigned long *out_end_pfn, int *out_nid);
 
diff --git a/mm/memblock.c b/mm/memblock.c
index 0a53db4d9f7b..570ab7ac4dce 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -6,6 +6,8 @@
  * Copyright (C) 2001 Peter Bergner.
  */
 
+#include "linux/stddef.h"
+#include "linux/types.h"
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/init.h>
@@ -17,7 +19,7 @@
 #include <linux/seq_file.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
-
+#include <linux/minmax.h>
 #include <asm/sections.h>
 #include <linux/io.h>
 
@@ -1909,6 +1911,69 @@ bool __init_memblock memblock_is_map_memory(phys_addr_t addr)
 	return !memblock_is_nomap(&memblock.memory.regions[i]);
 }
 
+/**
+ * curr_node_memblock_intersect_memory_block:  checks if the current node's memblock
+ * region intersects with the memory block.
+ * @start_pfn: memory block start pfn
+ * @end_pfn: memory block end_pfn
+ * @curr_nid: Current node
+ *
+ * This function takes the start and end PFN of a memory block, as well as the node ID
+ * that is being registered. It then finds the memblock region of the current node and
+ * checks if the passed memory block intersects with the memblock. If there is an
+ * intersection, the function returns true; otherwise, it returns false.
+ *
+ * Return:
+ * If the current node's memblock region intersects with the memory block, it returns
+ * true; otherwise, it returns false.
+ */
+bool __init_memblock curr_node_memblock_intersect_memory_block(unsigned long start_pfn,
+						unsigned long end_pfn, int curr_nid)
+{
+	struct memblock_region *r;
+	unsigned long r_start, r_end;
+	unsigned long size = end_pfn - start_pfn;
+	unsigned long r_size = 0;
+
+	for_each_mem_region(r) {
+		r_start = PFN_DOWN(r->base);
+		r_end = PFN_DOWN(r->base + r->size);
+		r_size = r_end - r_start;
+
+		if (r->nid == curr_nid) {
+			if (size > r_size) {
+				/*
+				 * The memory block size is greater than the memblock
+				 * region size, meaning multiple memblocks can be present
+				 * within a single memory block. If the memblock's start
+				 * or end is within the memory block's start and end, It
+				 * indicates that the memblock is part of this memory block.
+				 * Therefore, the memory block can be added to the node
+				 * where the memblock resides.
+				 */
+				if (in_range(r_start, start_pfn, size) ||
+						in_range(r_end, start_pfn, size))
+					return true;
+			} else {
+				/*
+				 * The memory block size is less than or equal to the
+				 * memblock size, meaning multiple memory blocks can
+				 * be part of a single memblock region. If the memory
+				 * block's start or end is within the memblock's start
+				 * and end, it indicates that the memory block is part of
+				 * the memblock. Therefore, the memory block can be added
+				 * to the node where the memblock resides.
+				 */
+				if (in_range(start_pfn, r_start, r_size) ||
+						in_range(end_pfn, r_start, r_size))
+					return true;
+			}
+		}
+	}
+	return false;
+}
+
+
 int __init_memblock memblock_search_pfn_nid(unsigned long pfn,
 			 unsigned long *start_pfn, unsigned long *end_pfn)
 {
-- 
2.48.1

