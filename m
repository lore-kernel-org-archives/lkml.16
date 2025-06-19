Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D40D218596
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319459; cv=none; b=PuOIIFUbIsPmC2igh+2arB4pL1q6cuWGB/ON2Yf4Cb9/DkQvZNwwAACy+N69VZnmAaRXpeUJ83qzG6mmnPUG8BC5faXXiknFyY0PeowdUibKlH2IuMsVp9MOh4pzwDeaHBAZSmnYFKVWdCqt4ZF8Iw1vxpU/TTfI9vlhgiOukZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319459; c=relaxed/simple;
	bh=Yl8ZMK/InaII2S7K0R9C8tOqy/Pjo3fKr59rSyEHJuY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M0DI3H7ss6kT9CDgBaPiuNWaKq/FtLQvvdC87Kao2Pe/KKgtY0nXvudd+2wW0zcz58VK4PMIMWiISjoTGkNS8MxmdWfY7g1RJRZqIm+0t7y4AUDd0wi74KkT5uNRbDBreTQglBj48jTFIUhycuY4DZz87vpNdjXmLeY5uTYvi0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TS6JyfHC; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TS6JyfHC"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750319452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JrEolSLr9rS694/buurKuGKr9Kz5LTg/bHMzqLtVbKI=;
	b=TS6JyfHCbzrj7VtKpBz2h6nit/kNbnVqVyvIuoI1fQRh+tgTp5PwxYOHlrHmeAG5oIcEji
	ZdzSeffaQx5APrc4nlE+ENAMfb3Zj0FVMBbOYQHCHMnvNq8RYbT0EVQ+BF+XGiMB2OEz7e
	LGpCYjrY/j/+DgfRmoK++1jhr5bwAvQ=
From: Ye Liu <ye.liu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ye Liu <liuye@kylinos.cn>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Rik van Riel <riel@surriel.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Harry Yoo <harry.yoo@oracle.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/rmap: Add NULL checks for rmap_walk_control callbacks
Date: Thu, 19 Jun 2025 15:50:40 +0800
Message-Id: <20250619075040.796047-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

Add NULL pointer checks for rmap_one callback in rmap_walk operations
to prevent potential NULL pointer dereferences. Also clean up some
code by removing redundant comments and caching folio_nr_pages().

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/ksm.c  |  2 +-
 mm/rmap.c | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 18b3690bb69a..22ad069d1860 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -3068,7 +3068,7 @@ void rmap_walk_ksm(struct folio *folio, struct rmap_walk_control *rwc)
 			if (rwc->invalid_vma && rwc->invalid_vma(vma, rwc->arg))
 				continue;
 
-			if (!rwc->rmap_one(folio, vma, addr, rwc->arg)) {
+			if (rwc->rmap_one && !rwc->rmap_one(folio, vma, addr, rwc->arg)) {
 				anon_vma_unlock_read(anon_vma);
 				return;
 			}
diff --git a/mm/rmap.c b/mm/rmap.c
index fb63d9256f09..17d43d104a0d 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1202,8 +1202,7 @@ int mapping_wrprotect_range(struct address_space *mapping, pgoff_t pgoff,
 	if (!mapping)
 		return 0;
 
-	__rmap_walk_file(/* folio = */NULL, mapping, pgoff, nr_pages, &rwc,
-			 /* locked = */false);
+	__rmap_walk_file(NULL, mapping, pgoff, nr_pages, &rwc, false);
 
 	return state.cleaned;
 }
@@ -2806,6 +2805,7 @@ static void rmap_walk_anon(struct folio *folio,
 	struct anon_vma *anon_vma;
 	pgoff_t pgoff_start, pgoff_end;
 	struct anon_vma_chain *avc;
+	unsigned long nr_pages;
 
 	if (locked) {
 		anon_vma = folio_anon_vma(folio);
@@ -2817,13 +2817,13 @@ static void rmap_walk_anon(struct folio *folio,
 	if (!anon_vma)
 		return;
 
+	nr_pages = folio_nr_pages(folio);
 	pgoff_start = folio_pgoff(folio);
-	pgoff_end = pgoff_start + folio_nr_pages(folio) - 1;
+	pgoff_end = pgoff_start + nr_pages - 1;
 	anon_vma_interval_tree_foreach(avc, &anon_vma->rb_root,
 			pgoff_start, pgoff_end) {
 		struct vm_area_struct *vma = avc->vma;
-		unsigned long address = vma_address(vma, pgoff_start,
-				folio_nr_pages(folio));
+		unsigned long address = vma_address(vma, pgoff_start, nr_pages);
 
 		VM_BUG_ON_VMA(address == -EFAULT, vma);
 		cond_resched();
@@ -2831,7 +2831,7 @@ static void rmap_walk_anon(struct folio *folio,
 		if (rwc->invalid_vma && rwc->invalid_vma(vma, rwc->arg))
 			continue;
 
-		if (!rwc->rmap_one(folio, vma, address, rwc->arg))
+		if (rwc->rmap_one && !rwc->rmap_one(folio, vma, address, rwc->arg))
 			break;
 		if (rwc->done && rwc->done(folio))
 			break;
@@ -2894,7 +2894,7 @@ static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
 		if (rwc->invalid_vma && rwc->invalid_vma(vma, rwc->arg))
 			continue;
 
-		if (!rwc->rmap_one(folio, vma, address, rwc->arg))
+		if (rwc->rmap_one && !rwc->rmap_one(folio, vma, address, rwc->arg))
 			goto done;
 		if (rwc->done && rwc->done(folio))
 			goto done;
-- 
2.25.1

