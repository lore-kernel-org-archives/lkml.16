Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628A29476
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745200722; cv=none; b=pW5uQGVqlAX+PKfSbADq9cGg7gUtPK+HnSBPYCMlivyC5UZVKP0T3Ze7+p1UVQK/jA3uzFA8CSAcoZkTPdrsH0Tu4nvo9M/3VMV3Qgvd0NxO7VI5k5hroGi0wO87Z+Xgi+sylpEdHGFaQrDQIF9JZasJEDoTVqRajyC/xfdnmYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745200722; c=relaxed/simple;
	bh=TWss7XewSvgsAiYpnIqcJjq6TfeXLZNGvwOZZ+nHeyk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QjpUIRdo10ZAvTiCG+Xnk4p7HniJgNfp1XqudnWIxoTe2CkR2XxnJBR/jltqOJaBOC+qG7x5VZxDTat561j/l4FUfDKLd+hCTBvJCZxqmXSkGHvU4NpIUYUWAZG3TaHfLXG7yf5WoVz7gtrrclmDUuD8k1E/o9z5g+q2VgBIBEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EqHxkeVb; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EqHxkeVb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745200717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ibaFym3OFtgTiKxTW+quUnMt2zax7HWkzpDLzPDX8sA=;
	b=EqHxkeVbtE6BrU3mqapnjUBCl7euFEQEvnObJEvHGjeOYPQK6VP855mW20N1Rmf/Px8/g4
	46/24G2Cg9+5fuKSAVHo1SZqfRNezURwFtwS3VLHhSr+uKhbSs8v3D00YLDAwSB43bS7SC
	0SAM64LNks5jZpNoiApP2qXNscZmXuE=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org,
	nao.horiguchi@gmail.com,
	linmiaohe@huawei.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	david@redhat.com,
	harry.yoo@oracle.com,
	riel@surriel.com,
	vbabka@suse.cz,
	liuye@kylinos.cn,
	ye.liu@linux.dev
Subject: [PATCH v3] mm/rmap: rename page__anon_vma to anon_vma for consistency
Date: Mon, 21 Apr 2025 09:58:23 +0800
Message-Id: <20250421015823.32009-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

Renamed local variable page__anon_vma in page_address_in_vma() to
anon_vma. The previous naming convention of using double underscores
(__) is unnecessary and inconsistent with typical kernel style, which uses
single underscores to denote local variables. Also updated comments to
reflect the new variable name.

Functionality unchanged.

Signed-off-by: Ye Liu <liuye@kylinos.cn>

Changes in v3:
- Rename variable from page_anon_vma to anon_vma.
---
 mm/rmap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 67bb273dfb80..447e5b57e44f 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -789,13 +789,13 @@ unsigned long page_address_in_vma(const struct folio *folio,
 		const struct page *page, const struct vm_area_struct *vma)
 {
 	if (folio_test_anon(folio)) {
-		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
+		struct anon_vma *anon_vma = folio_anon_vma(folio);
 		/*
 		 * Note: swapoff's unuse_vma() is more efficient with this
 		 * check, and needs it to match anon_vma when KSM is active.
 		 */
-		if (!vma->anon_vma || !page__anon_vma ||
-		    vma->anon_vma->root != page__anon_vma->root)
+		if (!vma->anon_vma || !anon_vma ||
+		    vma->anon_vma->root != anon_vma->root)
 			return -EFAULT;
 	} else if (!vma->vm_file) {
 		return -EFAULT;
@@ -803,7 +803,7 @@ unsigned long page_address_in_vma(const struct folio *folio,
 		return -EFAULT;
 	}
 
-	/* KSM folios don't reach here because of the !page__anon_vma check */
+	/* KSM folios don't reach here because of the !anon_vma check */
 	return vma_address(vma, page_pgoff(folio, page), 1);
 }
 
-- 
2.25.1

