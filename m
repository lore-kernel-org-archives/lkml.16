Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3B61D618C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744176524; cv=none; b=BYhkdxo0FxKHMN9eMRGCWxiYEfWXyDFfZJQcZxmvdPGB7Bu5+COoRLJuKBcFwMDIJV8iV0UqXQWbiV7Cz6wd8+mtCd8pblFWnz8jxmQXCx7vt8ulJJM2/X7/7ut6tMICRrqI6S/kYV8pyQFh7Y2yLXT8C7Xd2N0loJnDi0ElewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744176524; c=relaxed/simple;
	bh=JkaqqWCnFYXe5SAwVs+npWhNz3KK6mXarJAQsKdmSjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4DFHf0xRNbF9r1vvTDs6XcvyF/zZh5UyrjI2UrBtUU8gmZX6MXQYMedxcQ+cGaf2ulZj8wHcmOEG2TeSIMpNwawPl1HtQc124yvzmPtfLlpSQ0ImVyvOtHcecrzGhD3/bZRZs9LmwHyDXiklHoDcCVdX0+cV3cFQP8WthRwmTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=H3KiNLX1; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="H3KiNLX1"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538KcVLP027006;
	Wed, 9 Apr 2025 05:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=dwIbZ0LqbhKGSw+74
	bPco8HMjKMniHym4BVUXiLuv18=; b=H3KiNLX18fFxHRerwlzFS6VeHoxNMVAEN
	r40TsXAEsZbcz7Muqmfq6I0IW9Cx1YDEnHPVVtsXhrYfXwJTkRxI9FNYuWGhfBFs
	WhCZDw5G1VFfOjZrDYkYODOXKeHsryP/TpI/nIODDZRncARyM0m+/lsA4dLnzoxp
	26oLGRy6OoSu40Jd6nlfPr/fVrIItjnxSBcqBIU1le1Pt5c+b4S9BOf/EJ67ZTZd
	Yj4hMgLj61hE/7zdVtGn9O2CNVxHLpdad5VF3QZf7iT8z1Gp0dtWQCOclWijJdTH
	17QkJqCQN9Zysh/6H9tSK8/YBf7pRO8jTbcBloH3WrY3aNdIvyaYQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45wb10hmxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 05:28:26 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5395I3Wj013565;
	Wed, 9 Apr 2025 05:28:24 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45wb10hmxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 05:28:24 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5393anJE024600;
	Wed, 9 Apr 2025 05:28:23 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45ueutedq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 05:28:23 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5395SLZm46596408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 05:28:22 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF09220043;
	Wed,  9 Apr 2025 05:28:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77E4C20040;
	Wed,  9 Apr 2025 05:28:19 +0000 (GMT)
Received: from li-06431bcc-2712-11b2-a85c-a6fe68df28f9.ibm.com.com (unknown [9.124.222.191])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Apr 2025 05:28:19 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        Mike Rapoport <rppt@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>, Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH 2/2] base/node: Use curr_node_memblock_intersect_memory_block to Get Memory Block NID if CONFIG_DEFERRED_STRUCT_PAGE_INIT is Set
Date: Wed,  9 Apr 2025 10:57:57 +0530
Message-ID: <d10d1a9f11e9f8752c7ec5ff5bb262b3f6c6bb85.1744175097.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
References: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: j6B9c9fIlRxrvGkW0a-38NnVoFd4pqcE
X-Proofpoint-GUID: eWJIEeHJG3nrurHzIH6sZcbV_KNPBBHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090020

In the current implementation, when CONFIG_DEFERRED_STRUCT_PAGE_INIT is
set, we iterate over all PFNs in the memory block and use
early_pfn_to_nid to find the NID until a match is found.

This patch we are using curr_node_memblock_intersect_memory_block() to
check if the current node's memblock intersects with the memory block
passed when CONFIG_DEFERRED_STRUCT_PAGE_INIT is set. If an intersection
is found, the memory block is added to the current node.

If CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set, the existing mechanism
for finding the NID will continue to be used.

Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 drivers/base/node.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index cd13ef287011..5c5dd02b8bdd 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -20,6 +20,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/swap.h>
 #include <linux/slab.h>
+#include <linux/memblock.h>
+
 
 static const struct bus_type node_subsys = {
 	.name = "node",
@@ -782,16 +784,19 @@ static void do_register_memory_block_under_node(int nid,
 				    ret);
 }
 
-/* register memory section under specified node if it spans that node */
-static int register_mem_block_under_node_early(struct memory_block *mem_blk,
-					       void *arg)
+static int register_mem_block_early_if_dfer_page_init(struct memory_block *mem_blk,
+				unsigned long start_pfn, unsigned long end_pfn, int nid)
 {
-	unsigned long memory_block_pfns = memory_block_size_bytes() / PAGE_SIZE;
-	unsigned long start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
-	unsigned long end_pfn = start_pfn + memory_block_pfns - 1;
-	int nid = *(int *)arg;
-	unsigned long pfn;
 
+	if (curr_node_memblock_intersect_memory_block(start_pfn, end_pfn, nid))
+		do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
+	return 0;
+}
+
+static int register_mem_block_early__normal(struct memory_block *mem_blk,
+				unsigned long start_pfn, unsigned long end_pfn, int nid)
+{
+	unsigned long pfn;
 	for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
 		int page_nid;
 
@@ -821,6 +826,22 @@ static int register_mem_block_under_node_early(struct memory_block *mem_blk,
 	/* mem section does not span the specified node */
 	return 0;
 }
+/* register memory section under specified node if it spans that node */
+static int register_mem_block_under_node_early(struct memory_block *mem_blk,
+					       void *arg)
+{
+	unsigned long memory_block_pfns = memory_block_size_bytes() / PAGE_SIZE;
+	unsigned long start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
+	unsigned long end_pfn = start_pfn + memory_block_pfns - 1;
+	int nid = *(int *)arg;
+
+#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
+	if (system_state < SYSTEM_RUNNING)
+		return register_mem_block_early_if_dfer_page_init(mem_blk, start_pfn, end_pfn, nid);
+#endif
+	return register_mem_block_early__normal(mem_blk, start_pfn, end_pfn, nid);
+
+}
 
 /*
  * During hotplug we know that all pages in the memory block belong to the same
-- 
2.48.1

