Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9474C24EF7E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689462; cv=none; b=RGNoOWLunAP2bnBuXNcTxZ+OIPY2szE8I9M/2zYcTXsOxrm4wT3Fy7Jp9pRDn8pSs8lVqHv0ufl7I0HnzYhkjh/gmbkfsFAqhOns3kLCysSjA9/yCVklH7ppNc7hs5af//MlBa0hsx3txjNIfa4fZiF8sCmNWT+tkmX/t2U3RcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689462; c=relaxed/simple;
	bh=1/FHrGbArHQB4bn9C3gSAyqpKuikoeX7ogwqjyXM3LA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MGnr6qge1TNWcPJLutbBTmZ6aXr4aA0FxGoXsnANaF84aHn6agy3ZoEE48py7e+1T442zWtnTo6/XjBqq9QDZp9lhkC/lz2RRU413kEjzdRRL7yY1yYtguF3IIBq5RhbwHQ5w/jKYiXp18Hy9x7QWwxpd0c+3PsUwxRGt7adY2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WvCsux6R; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WvCsux6R"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5333k0Qh006951;
	Thu, 3 Apr 2025 14:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=z3Ll7BaePbzKlsIQORJqYY/wT4JT
	vpd+uyOY2GQT5No=; b=WvCsux6RWqZNE8pUXQa6Jh9SPvVxHZ+64qYnxy6Xte0n
	uxPtxJasofpQrmzADTE5JpGrDNBEkSxo7JvL4aI4KxfVOHonWyN9Kii7TBlev667
	bAIeB3HQ4pegpvMrCf1B67A6Uv0UFQOGlIIvCd91ucPh+3jruN9JoF4oihlhxJR9
	ar40vd+B7ZornfVTmLHmk7tUQB7P9f1oTgaRCnNblm/y8eQp54Edo0H+YW6Nfzgr
	nHNVstJs+xTIt4Qvfh68Dw4UL1lSWDDDOnybMyhy0V2SLZGlETH5pCQLbEvTiwf+
	S/rIlD1L3fpjYv1lOPlXspg3z1SuHu6XI28BBYo8vg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45sjq9tqyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 14:10:40 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 533Dgn8P003008;
	Thu, 3 Apr 2025 14:10:40 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45sjq9tqyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 14:10:40 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 533D7GJp019413;
	Thu, 3 Apr 2025 14:10:39 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45pu6tddk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 14:10:39 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 533EAbGf36962770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Apr 2025 14:10:37 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7082C20043;
	Thu,  3 Apr 2025 14:10:37 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B93B2004F;
	Thu,  3 Apr 2025 14:10:35 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Apr 2025 14:10:35 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        Gregory Price <gourry@gourry.net>,
        Matthew Wilcox <willy@infradead.org>, Yu Zhao <yuzhao@google.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-kernel@vger.kernel.org,
        aneesh.kumar@kernel.org, David Hildenbrand <david@redhat.com>,
        Huang Ying <ying.huang@linux.alibaba.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Donet Tom <donettom@linux.ibm.com>
Subject: [RFC PATCH v2]  mm/swap.c: Enable promotion of unmapped MGLRU page cache pages
Date: Thu,  3 Apr 2025 09:10:32 -0500
Message-ID: <20250403141032.22743-1-donettom@linux.ibm.com>
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
X-Proofpoint-GUID: oeQiQzqlA6q0-_K7b8-6wh1G8cwGgXGA
X-Proofpoint-ORIG-GUID: tFHv-EUWfygQXmd0IHosonsCST40ypKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_06,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 mlxscore=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504030064

This patch is based on patch [1], which introduced support for
promoting unmapped normal LRU page cache pages. Here, we extend
the functionality to support promotion of MGLRU page cache pages.

An MGLRU page cache page is eligible for promotion when:

1. Memory Tiering and pagecache_promotion_enabled are enabled
2. It resides in a lower memory tier.
3. It is referenced.
4. It is part of the working set.
5. folio reference count is maximun (LRU_REFS_MASK).

When a page is accessed through a file descriptor, folio_inc_refs()
is invoked. The first access will set the folio’s referenced flag,
and subsequent accesses will increment the reference count in the
folio flag (reference counter size in folio flags is 2 bits). Once
the referenced flag is set, and the folio’s reference count reaches
the maximum value (LRU_REFS_MASK), the working set flag will be set
as well.

If a folio has both the referenced and working set flags set, and its
reference count equals LRU_REFS_MASK, it becomes a good candidate for
promotion. These pages will be added to the promotion list. The
per-process task task_numa_promotion_work() takes the pages from the
promotion list and promotes them to a higher memory tier.

In the MGLRU, for folios accessed through a file descriptor, if the
folio’s referenced and working set flags are set, and the folio's
reference count is equal to LRU_REFS_MASK, the folio is lazily
promoted to the second oldest generation in the eviction path. When
folio_inc_gen() does this, it clears the LRU_REFS_FLAGS so that
lru_gen_inc_refs() can start over.

Test process:
We measured the read time in below scenarios for both LRU and MGLRU.
Scenario 1: Pages are on Lower tier + promotion off
Scenario 2: Pages are on Lower tier + promotion on
Scenario 3: Pages are on higher tier

Test Results MGLRU
----------------------------------------------------------------
Pages on higher   | Pages Lower tier |  Pages on Lower Tier    |
   Tier           |  promotion off   |   Promotion On          |
----------------------------------------------------------------
  0.48s           |    1.6s          |During Promotion - 3.3s  |
                  |                  |After Promotion  - 0.48s |
                  |                  |                         |
----------------------------------------------------------------

Test Results LRU
----------------------------------------------------------------
Pages on higher   | Pages Lower tier |  Pages on Lower Tier    |
   Tier           |  promotion off   |   Promotion On          |
----------------------------------------------------------------
   0.48s          |    1.6s          |During Promotion - 3.3s  |
                  |                  |After Promotion  - 0.48s |
                  |                  |                         |
----------------------------------------------------------------

MGLRU and LRU are showing similar performance benefit.

[1] https://lore.kernel.org/all/20250107000346.1338481-1-gourry@gourry.net/

Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
v1->v2

In V1, the folios that were part of the memcg and the active MGLRU list
were being promoted. However, in MGLRU, file pages accessed through
file descriptors are moved to the second oldest generation. This second
oldest generation may not necessarily be part of the active list.
Furthermore, this movement to the second oldest generation only happens
in the eviction path, so if the system is not under memory pressure,
this movement will not occur. As a result, hot pages can be present in
any generation. If the reference count is at its maximum and the
referenced and working set flags are set, the page becomes a candidate
for promotion.

v1 - https://lore.kernel.org/all/20250115120625.3785-1-donettom@linux.ibm.com/
---
 mm/swap.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/swap.c b/mm/swap.c
index b2341bc18452..f3c19d563556 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -399,8 +399,13 @@ static void lru_gen_inc_refs(struct folio *folio)
 
 	do {
 		if ((old_flags & LRU_REFS_MASK) == LRU_REFS_MASK) {
-			if (!folio_test_workingset(folio))
+			if (!folio_test_workingset(folio)) {
 				folio_set_workingset(folio);
+			} else if (!folio_test_isolated(folio) &&
+				  (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
+				   numa_pagecache_promotion_enabled) {
+				promotion_candidate(folio);
+			}
 			return;
 		}
 
-- 
2.43.5

