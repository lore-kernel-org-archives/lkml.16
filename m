Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789A624B28
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610301; cv=none; b=H16IUxcQ4Ip3gnz0LG5LSpWK73lq8J+oNFnuccgHdNgMJexkit2xqMbLXm8tYWZb9XTIEaKs4sqm/5dF2G9nCoAPD2K7WAp18j+pv4paODDP6OfJoWgYOFE4cjWtR8k5C0spkYZ0WA7ah09cRSGTJ+put4rUF2/OS6Yd8oXH3Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610301; c=relaxed/simple;
	bh=K9X9Nn/7fufwUGnClucrIwI28bxVDHFEpQ+W4zTrDek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gy7UnsyFs2SBxtpFwX8BqFFyBLwMOpUeWMO0IK8vmhd8mZ0/WwVdxBeYVDSXOVjFpM12E3dW6JGI/EX2cVWDNnGTulcEzcmIyrFsk6JTiEzz5Npu+H04vgaGXw+TBGpEtmC2IY6FGFpv2pVCXY95ZDRh05EaRCo2AnYjr/t/mWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VtYv1Tn+; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VtYv1Tn+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746610295; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=XmgMg6STtlyinvSAL5WS1Sr98izqTtA9oefqvb3PDJw=;
	b=VtYv1Tn+xj27V3HA/bTINb5xGD/kYwuRJtWBHUcGB2X1Ot1P99eTvORe3twKSTcdklPuY3NQSQxyTi8X9+Pf7BGrhPpCcYE87T3finWyQTGzz1z2RZHZsyO3JBHxNMhvMrCGlx5WEylrFzqVfAd6q2kRN2VXGnQYQExaS+XXKi0=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WZpDwwa_1746609976 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 07 May 2025 17:26:17 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	willy@infradead.org,
	david@redhat.com
Cc: hannes@cmpxchg.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	ziy@nvidia.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mm: khugepaged: convert set_huge_pmd() to take a folio
Date: Wed,  7 May 2025 17:26:12 +0800
Message-ID: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've already gotten the stable locked folio in collapse_pte_mapped_thp(),
so just use folio for set_huge_pmd() to set the PMD entry, which is more
straightforward.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/khugepaged.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b04b6a770afe..0215ef6095d9 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1467,7 +1467,7 @@ static void collect_mm_slot(struct khugepaged_mm_slot *mm_slot)
 #ifdef CONFIG_SHMEM
 /* hpage must be locked, and mmap_lock must be held */
 static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
-			pmd_t *pmdp, struct page *hpage)
+			pmd_t *pmdp, struct folio *folio)
 {
 	struct vm_fault vmf = {
 		.vma = vma,
@@ -1476,13 +1476,13 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
 		.pmd = pmdp,
 	};
 
-	VM_BUG_ON(!PageTransHuge(hpage));
+	VM_BUG_ON(!folio_test_large(folio));
 	mmap_assert_locked(vma->vm_mm);
 
-	if (do_set_pmd(&vmf, hpage))
+	if (do_set_pmd(&vmf, &folio->page))
 		return SCAN_FAIL;
 
-	get_page(hpage);
+	folio_get(folio);
 	return SCAN_SUCCEED;
 }
 
@@ -1689,7 +1689,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 maybe_install_pmd:
 	/* step 5: install pmd entry */
 	result = install_pmd
-			? set_huge_pmd(vma, haddr, pmd, &folio->page)
+			? set_huge_pmd(vma, haddr, pmd, folio)
 			: SCAN_SUCCEED;
 	goto drop_folio;
 abort:
-- 
2.43.5

