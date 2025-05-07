Received: from mailout2.w2.samsung.com (mailout2.w2.samsung.com [211.189.100.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FC028BAB9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.189.100.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632999; cv=none; b=rNpuCvXmwRpqovTdXY+nYjFF+KM5Z3LAzzpVkvd/PamWkgPMGdTYcR3jj/dkF46XjRNyFu+qmCGobRmii4CF4StyXbuR6T4XxUqQVFF1ogv6EGyJYPdo/lHuyo7CQ2V7pCSIDmKU7RvMODy5TnSf39bE6z9VSXeWukwFVRB9nk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632999; c=relaxed/simple;
	bh=7qMS0G4P8XbQnWTLpz6Fg+1x73Q8J5lis1GctczeeYM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=uosnhcL2ISZwLYUpRyzNdjY2ELbe+3hSaBtTisAudv/6+ygjtXiBe3SqYwBE6tjpNBTRWEmrhKg8Rq4vr4DjswwaA6bOKJN5cyqfY6wsR8URUJZKRq4ymdA2mYSwR3KPA5XSZKcPsjS1cS6w8fc7V3LcLHXQ9qPMpWMCo4kJWIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com; spf=pass smtp.mailfrom=partner.samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=kS9hR/1n; arc=none smtp.client-ip=211.189.100.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kS9hR/1n"
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
	by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id 20250507154120usoutp02cc4e156032c988706f016037a202c050~9SPyT-3Kj3209032090usoutp02a;
	Wed,  7 May 2025 15:41:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com 20250507154120usoutp02cc4e156032c988706f016037a202c050~9SPyT-3Kj3209032090usoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746632480;
	bh=hc+JDAxWJqxTVS0Piq38MQtlRJPigv+YF9g8CSFOUDQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=kS9hR/1nqEqKMG7i+c+x8/F+8/45QoTs3L0/bLHmu0LqgS6qetL9qVQKwZwddRm3w
	 SIKnLyfzLRU6TN9mYgA1qKeRDUOLaHnywaWBSGr40qAQfRjvpSeXZ79warjMGy7LQU
	 lk6oLzS0oqAKhuUfvdH21WWZAceZJawujJIbkI54=
Received: from ussmtxp2.samsung.com (u137.gpu85.samsung.co.kr
	[203.254.195.137]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250507154119uscas1p17799fe7589e4f1bd53d2d3dc7f44cb8c~9SPx9Egkc0743107431uscas1p15;
	Wed,  7 May 2025 15:41:19 +0000 (GMT)
Received: from ATXPVPPTAGT03.sarc.samsung.com (unknown [105.148.161.7]) by
	ussmtxp2.samsung.com (KnoxPortal) with ESMTP id
	20250507154119ussmtxp2d8b6bd9d41695fad000afb019916d048~9SPxz6JPl3069130691ussmtxp2A;
	Wed,  7 May 2025 15:41:19 +0000 (GMT)
Received: from pps.filterd (ATXPVPPTAGT03.sarc.samsung.com [127.0.0.1]) by
	ATXPVPPTAGT03.sarc.samsung.com (8.18.1.2/8.18.1.2) with ESMTP id
	547DqSQp050757; Wed, 7 May 2025 10:41:19 -0500
Received: from webmail.sarc.samsung.com ([172.30.39.9]) by
	ATXPVPPTAGT03.sarc.samsung.com (PPS) with ESMTP id 46df5wb1w4-2; Wed, 07 May
	2025 10:41:18 -0500
Received: from au1-swbuild-p19.eng.sarc.samsung.com (105.148.41.22) by
	au1ppexchange01.sarc.samsung.com (105.148.32.81) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.1544.4; Wed, 7 May 2025 10:41:18 -0500
From: Pantelis Antoniou <p.antoniou@partner.samsung.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>
CC: <linux-kernel@vger.kernel.org>, Artem Krupotkin <artem.k@samsung.com>,
	Charles Briere <c.briere@samsung.com>, Wade Farnsworth
	<wade.farnsworth@siemens.com>
Subject: [PATCH 1/1] Fix zero copy I/O on __get_user_pages allocated pages
Date: Wed, 7 May 2025 10:41:05 -0500
Message-ID: <20250507154105.763088-2-p.antoniou@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250507154105.763088-1-p.antoniou@partner.samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: au1ppexchange01.sarc.samsung.com (105.148.32.81) To
	au1ppexchange01.sarc.samsung.com (105.148.32.81)
X-CFilter-Loop: Reflected
X-Proofpoint-GUID: df5ZmTvursoOaGiSxmNgop8Kuw9CmcPr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0NyBTYWx0ZWRfX/26APqKlix9D
	Seq9W2AsXKxxG4W1jE4HnYhTC8Em7iOtdVZrs5SGDc4zvLYVFYBXfDNW2hJ9ppXtGh7KLzGai8L
	Wrg7LZ/BMAJ+BvNgGfUDP5KAIP+dISkQH/HuG0O8YTQDtj5fEmFHk8KyMz7/O4leicHKPDIzy7t
	zomoqoiHox63lBSm8V3OUKmDp9YSOr2m+AqMm8uyJU5k5DMAQC755NU5BVs1wqKymQTsA1EnqfB
	sXE4jqI3k40K3X2RG8Jgd3/6xgYlprFjyCwJfyBToXXog9rlyTtVFVW5+HfNHI3WTopiHe62LAE
	/9+p4tmdRSfhMofiAThd2U4X+Id9u+90SJbUXOQE78Cz4qwxJ77wYw6geFZrUoz6eiAhxoI92L7
	2kzMqO4H
X-Proofpoint-ORIG-GUID: df5ZmTvursoOaGiSxmNgop8Kuw9CmcPr
X-Proofpoint-Virus-Version: vendor=baseguard
	engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
	definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam
	score=0 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0
	lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
	mlxlogscore=509 adultscore=0 suspectscore=0 classifier=spam adjust=0
	reason=mlx scancount=1 engine=8.12.0-2504070000 definitions=main-2505070147
X-CMS-MailID: 20250507154119uscas1p17799fe7589e4f1bd53d2d3dc7f44cb8c
X-CMS-RootMailID: 20250507154119uscas1p17799fe7589e4f1bd53d2d3dc7f44cb8c
References: <20250507154105.763088-1-p.antoniou@partner.samsung.com>
	<CGME20250507154119uscas1p17799fe7589e4f1bd53d2d3dc7f44cb8c@uscas1p1.samsung.com>

Recent updates to net filesystems enabled zero copy operations,
which require getting a user space page pinned.

This does not work for pages that were allocated via __get_user_pages
and then mapped to user-space via remap_pfn_rage.

remap_pfn_range_internal() will turn on VM_IO | VM_PFNMAP vma bits.
VM_PFNMAP in particular mark the pages as not having struct_page
associated with them, which is not the case for __get_user_pages()

This in turn makes any attempt to lock a page fail, and breaking
I/O from that address range.

This patch address it by special casing pages in those VMAs and not
calling vm_normal_page() for them.

Signed-off-by: Pantelis Antoniou <p.antoniou@partner.samsung.com>
---
 mm/gup.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 84461d384ae2..e185c18c0c81 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -833,6 +833,20 @@ static inline bool can_follow_write_pte(pte_t pte, struct page *page,
 	return !userfaultfd_pte_wp(vma, pte);
 }
 
+static struct page *gup_normal_page(struct vm_area_struct *vma,
+		unsigned long address, pte_t pte)
+{
+	unsigned long pfn;
+
+	if (vma->vm_flags & (VM_MIXEDMAP | VM_PFNMAP)) {
+		pfn = pte_pfn(pte);
+		if (!pfn_valid(pfn) || is_zero_pfn(pfn) || pfn > highest_memmap_pfn)
+			return NULL;
+		return pfn_to_page(pfn);
+	}
+	return vm_normal_page(vma, address, pte);
+}
+
 static struct page *follow_page_pte(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmd, unsigned int flags,
 		struct dev_pagemap **pgmap)
@@ -858,7 +872,9 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 	if (pte_protnone(pte) && !gup_can_follow_protnone(vma, flags))
 		goto no_page;
 
-	page = vm_normal_page(vma, address, pte);
+	page = gup_normal_page(vma, address, pte);
+	if (page && (vma->vm_flags & (VM_MIXEDMAP | VM_PFNMAP)))
+		(void)follow_pfn_pte(vma, address, ptep, flags);
 
 	/*
 	 * We only care about anon pages in can_follow_write_pte() and don't
@@ -1130,7 +1146,7 @@ static int get_gate_page(struct mm_struct *mm, unsigned long address,
 	*vma = get_gate_vma(mm);
 	if (!page)
 		goto out;
-	*page = vm_normal_page(*vma, address, entry);
+	*page = gup_normal_page(*vma, address, entry);
 	if (!*page) {
 		if ((gup_flags & FOLL_DUMP) || !is_zero_pfn(pte_pfn(entry)))
 			goto unmap;
@@ -1271,8 +1287,6 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
 	int foreign = (gup_flags & FOLL_REMOTE);
 	bool vma_anon = vma_is_anonymous(vma);
 
-	if (vm_flags & (VM_IO | VM_PFNMAP))
-		return -EFAULT;
 
 	if ((gup_flags & FOLL_ANON) && !vma_anon)
 		return -EFAULT;
-- 
2.25.1

