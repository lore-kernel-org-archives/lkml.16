Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521DB1A00E7
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665456; cv=none; b=CnHHtFC4q6f3xjS22bi7SLARwSJj16hSX6LjJXZ3DVh18ttgoHD7kmCY4aqCz0rByeFVkixXZSXSNKTe/bBDSrEmSWjqcH2pfrjzHxYfVS1rc12TVRbfqcMfLHeySw6tH8UAVlKLLzjDJZGi5v7ii1pdNzi2J8H+0hudFlx48lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665456; c=relaxed/simple;
	bh=SAmtISNFsB3kD3CbeQ8hCFr0V88YIwyytAzVCIv9GXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I9lnfzVd0FpjLu8EWTFk4DSzB/NclaMSztki5sYtWHXO2Q4kpfLTwiQweWm0vQMgm9pNPmcTHMlYKafsNdDHIVNGR3V+ZwtROLB8VkTF3wxDpu39YcyUhGogFSwEBd1SEyEmA8Qbbv2pdfw3ySqgCeNN0c7v7udEsGeiiULQk9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=XxsLu8t7; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="XxsLu8t7"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MMbiim001960;
	Mon, 23 Jun 2025 07:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=YPdulDJST/MYB5N+2axWZHF9joXKWut0/gJi/Y3I0
	go=; b=XxsLu8t72mJNfQdazIxSKQoyPHZVBT24zRMn8yEEi12uW8eDgccR/EiBZ
	5/DXATKJhavhmHD6Aj7fT4hRAH8iKike9cL2X+uQvnyuLRW9qtogXSG9zkhsc6dS
	qTXrnb29zvfhzJVWU1ENOf/LZFl6JMhouIKhOabMlG+zWBVXVRTnIW5dlkorUVkD
	/ksPocdXYvzwqLT+JzFXty0/Olt+aT3BiQTU3yQSbrrHK3T1c0ra4hKPFmAargIs
	UiHoYuucS0gdOPVSZCWaNLMfexxd4LqIlkHGXscfThzaUCJvOhEk32jkxhFg+amq
	0Hi6oCcsMt5nqi864Z0r7tHM87Qcg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8j01se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 07:57:25 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55N3cJR3030546;
	Mon, 23 Jun 2025 07:57:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e7eyn7gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 07:57:24 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55N7vMus56689148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 07:57:22 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EE702004B;
	Mon, 23 Jun 2025 07:57:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D9C220043;
	Mon, 23 Jun 2025 07:57:22 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Jun 2025 07:57:22 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id BEF46E073A; Mon, 23 Jun 2025 09:57:21 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mm/vmalloc: leave lazy MMU mode on PTE mapping error
Date: Mon, 23 Jun 2025 09:57:21 +0200
Message-ID: <20250623075721.2817094-1-agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NSBTYWx0ZWRfX8n+4OSozYeGt e/rF1JCdvt0BW7YfVYoxd95A0fljuJoMXxAFsbu7fZeg5qayarmR7Wca7dxusgiPKjjUH8F9rOp b9BuRscKDcbt26pOiAz43hW0RC+GbWKs5nclFuUNIlNzyw/hUmwWm6SLZbwmAhAKdJNV6s8BThi
 lLdyBhldtGDpUi9kqzTlj6+rUggRC6Kb+TRE01hhVEOOzHQRDtTKgeJF38rM+FH3EziSGjPrXpN M0kxkIS/ExhGj8ikPCDhYYMsl3/iwIyXuUYKwy+aVGtwmEcBbniurPeJuxDt+S6DlEWX8vLsEoY 6LOAio9co02q+UH8ZcdBeAUoud+jD6AA+zlEKT37CESBJ3jXJ/Zhk1rITypXkzyfoPuSwffWcYK
 7WYotWWlIYGio2+PPHHVd9WOlvq/abp3ICEe97SZ/m3tKX/7m46hXLa+jkEOq717J+GIRphJ
X-Proofpoint-GUID: x-Tuc_yaAqSuHokEPm-6FAbJSnQsjEl5
X-Proofpoint-ORIG-GUID: x-Tuc_yaAqSuHokEPm-6FAbJSnQsjEl5
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=685908e5 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=VnNF1IyMAAAA:8 a=68ZgUnyOPooGnTEZb0UA:9
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=785 clxscore=1011
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230045

Function vmap_pages_pte_range() enters the lazy MMU mode,
but fails to leave it in case an error is encountered.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202506132017.T1l1l6ME-lkp@intel.com/
Fixes: 44562c71e2cf ("mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes")
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 mm/vmalloc.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ab986dd09b6a..6dbcdceecae1 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -514,6 +514,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
 		pgtbl_mod_mask *mask)
 {
+	int err = 0;
 	pte_t *pte;
 
 	/*
@@ -530,12 +531,18 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 	do {
 		struct page *page = pages[*nr];
 
-		if (WARN_ON(!pte_none(ptep_get(pte))))
-			return -EBUSY;
-		if (WARN_ON(!page))
-			return -ENOMEM;
-		if (WARN_ON(!pfn_valid(page_to_pfn(page))))
-			return -EINVAL;
+		if (WARN_ON(!pte_none(ptep_get(pte)))) {
+			err = -EBUSY;
+			break;
+		}
+		if (WARN_ON(!page)) {
+			err = -ENOMEM;
+			break;
+		}
+		if (WARN_ON(!pfn_valid(page_to_pfn(page)))) {
+			err = -EINVAL;
+			break;
+		}
 
 		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
 		(*nr)++;
@@ -543,7 +550,8 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 
 	arch_leave_lazy_mmu_mode();
 	*mask |= PGTBL_PTE_MODIFIED;
-	return 0;
+
+	return err;
 }
 
 static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
-- 
2.48.1

