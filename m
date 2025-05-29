Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321CD24EA8D
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748501408; cv=none; b=hIEFFuycyqUHkD2bn5jS149pO94jWvfPKpX5/MoSabXfN5v4oWOgJmhP5ZYk1kaCat4H+dTR84nZSnh+g8IAQRqz42bJiWOuSB2q4AU8ms1ealjsXmHkMTu0SvbQkC8JbwWhs0iwdKSDsL1ITQoNSmE+UCrvfN1/heP5da1OwXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748501408; c=relaxed/simple;
	bh=br8S5Kn+8azW5u+2mdW/6JEu6jkCJKsKla/TxQoCgqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Au5CmRycoZJ8iOhdx+OQzJ1rVc0FPN5dJRkxxymSvCEdSo57GKEVeSzA0CPB4vNYmjUx6RJ1RnhATam+J7E6a7dla06sNgqfRrG/VuKrwg/EmmWp9Hcdoa0bj4SGSrzr9XIt68IiWGqSBNCbpw6LWYtQMcsQdtYmIpheHWWX8o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=i7vWpwh1; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="i7vWpwh1"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so574129a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748501405; x=1749106205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EhxbErHQhfmCBFvt1IvVxTljfNHktGlPT+8Z9Nai5Hg=;
        b=i7vWpwh1Rzt6NOVQNSLhcLOzsz9cztVe2dTzh2w5Y7yaBRurKjGdoba9S7INAkwikX
         c82uw4jsKUdYM8ml0yhLwZnLvNS0haup8c9SiWxmXE2PZ/uvJJ5x/bACIKRFWuHo7IG+
         EIKCfxVHYQIfx4Kqcg9PQ85+/ZE/hKkUby/58qYHw3gk0pcRICAogNYbsAKmqtINCkZ+
         zup7O2ZDIstx5PwuMrd45zxeh5Klv1RKARsqDEJnQXFhpad5hmLw6uFPGrkGPwVkkTXp
         Hjbp/aII7fQi6NifBsBQWnTMz1nYl2tDeAleKW82dKaLcFxmxJMXTNCGU4HjAUB5RLIY
         JJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748501405; x=1749106205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhxbErHQhfmCBFvt1IvVxTljfNHktGlPT+8Z9Nai5Hg=;
        b=t5WhBc3uVwnnzp5lWVg/c4fmtU1xDWMSwBW+wcWMsvv8IlZGmFIfSTPPRoK/QrriiM
         SEM2Lg1BaMfj7I7PSnRdaZaL+yTeJEZDh6tjuMFN/awVab8TvrbbTnN/EmU3QSrxFv2a
         JUUb9Vv1pJeUJ/mCNVmzbJvBmHA2gMUHiycL9KX3o4zTuzUzxGSl2z7f+vKqorFbc7xg
         vvhqpmBurd5pZ6zm0hzLgoPHu+LgUQfVJc0LCAeW3lBsD9J8ijoz16wN/Oh/aTxa6J2I
         WusUthEG16WobmNfW3Rsu+XINis1q94yoM3046Yf6ZUx5M+5l32Tkb2zLScXHm4CJNYf
         6X6A==
X-Forwarded-Encrypted: i=1; AJvYcCVA34K1EVBDF9ehADJXWEmbvpvA4ME+BxmSlYNApO4JNwBYaT+AJPLQpPAAHVbrjV9hiD1wbzZCzQFwM+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxncu4rDPWDjhdTWhdIxVDjwLBwedSqdLLrcFjcH9iUIkPLw5Nu
	8chIOpoDMbkMi93OY6mA85t8hMhud7T7UEPPE5auMO0HMpxkRHHsvxvJdr3QiTIUpnI=
X-Gm-Gg: ASbGnctvJGFRF2ap/H9NS+zlQuNLctR1TRTFH1HMGXEvTFKKvUXZS+6RkGYBcASwJcw
	rRLSGMVZ4pm1r46JMloMbqn+1IVCfQxsUu7zYMYK6IRTE3qOE7fyOU+YnLCa83NsDtBZUOVhALN
	hY3XJ2o82/Xgu1boxxXUmOo+TKRF7ek9J/BlMznbKehSWiuztqzofwhxcpNjX2Qd0hVhNB0+Hua
	7ZNrlWDenENnNJZXjiAUx7Zb+5rVvuWJ5zwIX7Im3Ci7GqMIVgg3S7cAT4B4cHpj/zfcSAyI/4n
	s1r7GQzr0bdccejh6a2/dQIcuP5/GFY/QsmbnSold+brxNj5Gy9WBeKIIGePjs6Ol4+zJnU/huG
	JDoA=
X-Google-Smtp-Source: AGHT+IEWxkQzcYK340NixmCrd7XZAf4oPCftHzpnYUl/Z+UvS34DEGw2yan4eZDl+6WNoObexjUJiw==
X-Received: by 2002:a17:90b:3ec8:b0:311:f05b:869a with SMTP id 98e67ed59e1d1-311f05b87c5mr5983542a91.8.1748501405117;
        Wed, 28 May 2025 23:50:05 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3121b71ea18sm710704a91.17.2025.05.28.23.50.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 May 2025 23:50:04 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@redhat.com,
	peterx@redhat.com,
	muchun.song@linux.dev,
	lizhe.67@bytedance.com
Subject: [PATCH v5] vfio/type1: optimize vfio_pin_pages_remote() for large folios
Date: Thu, 29 May 2025 14:49:47 +0800
Message-ID: <20250529064947.38433-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

When vfio_pin_pages_remote() is called with a range of addresses that
includes large folios, the function currently performs individual
statistics counting operations for each page. This can lead to significant
performance overheads, especially when dealing with large ranges of pages.

This patch optimize this process by batching the statistics counting
operations.

The performance test results for completing the 8G VFIO IOMMU DMA mapping,
obtained through trace-cmd, are as follows. In this case, the 8G virtual
address space has been mapped to physical memory using hugetlbfs with
pagesize=2M.

Before this patch:
funcgraph_entry:      # 33813.703 us |  vfio_pin_map_dma();

After this patch:
funcgraph_entry:      # 18310.320 us |  vfio_pin_map_dma();

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
Co-developed-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
Changelogs:

v4->v5:
- Add the check of the continuity of pages

v3->v4:
- Use min_t() to obtain the step size, rather than min().
- Fix some issues in commit message and title.

v2->v3:
- Code simplification.
- Fix some issues in comments.

v1->v2:
- Fix some issues in comments and formatting.
- Consolidate vfio_find_vpfn_range() and vfio_find_vpfn().
- Move the processing logic for hugetlbfs folio into the while(true) loop
  and use a variable with a default value of 1 to indicate the number of
  consecutive pages.

v4 patch: https://lore.kernel.org/all/20250521042507.77205-1-lizhe.67@bytedance.com/
v3 patch: https://lore.kernel.org/all/20250520070020.6181-1-lizhe.67@bytedance.com/
v2 patch: https://lore.kernel.org/all/20250519070419.25827-1-lizhe.67@bytedance.com/
v1 patch: https://lore.kernel.org/all/20250513035730.96387-1-lizhe.67@bytedance.com/

 drivers/vfio/vfio_iommu_type1.c | 93 ++++++++++++++++++++++++++++-----
 1 file changed, 81 insertions(+), 12 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 0ac56072af9f..28ee4b8d39ae 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -319,7 +319,13 @@ static void vfio_dma_bitmap_free_all(struct vfio_iommu *iommu)
 /*
  * Helper Functions for host iova-pfn list
  */
-static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
+
+/*
+ * Find the highest vfio_pfn that overlapping the range
+ * [iova_start, iova_end) in rb tree.
+ */
+static struct vfio_pfn *vfio_find_vpfn_range(struct vfio_dma *dma,
+		dma_addr_t iova_start, dma_addr_t iova_end)
 {
 	struct vfio_pfn *vpfn;
 	struct rb_node *node = dma->pfn_list.rb_node;
@@ -327,9 +333,9 @@ static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
 	while (node) {
 		vpfn = rb_entry(node, struct vfio_pfn, node);
 
-		if (iova < vpfn->iova)
+		if (iova_end <= vpfn->iova)
 			node = node->rb_left;
-		else if (iova > vpfn->iova)
+		else if (iova_start > vpfn->iova)
 			node = node->rb_right;
 		else
 			return vpfn;
@@ -337,6 +343,11 @@ static struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
 	return NULL;
 }
 
+static inline struct vfio_pfn *vfio_find_vpfn(struct vfio_dma *dma, dma_addr_t iova)
+{
+	return vfio_find_vpfn_range(dma, iova, iova + PAGE_SIZE);
+}
+
 static void vfio_link_pfn(struct vfio_dma *dma,
 			  struct vfio_pfn *new)
 {
@@ -615,6 +626,56 @@ static long vaddr_get_pfns(struct mm_struct *mm, unsigned long vaddr,
 	return ret;
 }
 
+static long contig_pages(struct vfio_dma *dma,
+		struct vfio_batch *batch, dma_addr_t iova)
+{
+	struct page *page = batch->pages[batch->offset];
+	struct folio *folio = page_folio(page);
+	long idx = folio_page_idx(folio, page);
+	long max = min_t(long, batch->size, folio_nr_pages(folio) - idx);
+	long nr_pages;
+
+	for (nr_pages = 1; nr_pages < max; nr_pages++) {
+		if (batch->pages[batch->offset + nr_pages] !=
+				folio_page(folio, idx + nr_pages))
+			break;
+	}
+
+	return nr_pages;
+}
+
+static long vpfn_pages(struct vfio_dma *dma,
+		dma_addr_t iova_start, long nr_pages)
+{
+	dma_addr_t iova_end = iova_start + (nr_pages << PAGE_SHIFT);
+	struct vfio_pfn *top = vfio_find_vpfn_range(dma, iova_start, iova_end);
+	long ret = 1;
+	struct vfio_pfn *vpfn;
+	struct rb_node *prev;
+	struct rb_node *next;
+
+	if (likely(!top))
+		return 0;
+
+	prev = next = &top->node;
+
+	while ((prev = rb_prev(prev))) {
+		vpfn = rb_entry(prev, struct vfio_pfn, node);
+		if (vpfn->iova < iova_start)
+			break;
+		ret++;
+	}
+
+	while ((next = rb_next(next))) {
+		vpfn = rb_entry(next, struct vfio_pfn, node);
+		if (vpfn->iova >= iova_end)
+			break;
+		ret++;
+	}
+
+	return ret;
+}
+
 /*
  * Attempt to pin pages.  We really don't want to track all the pfns and
  * the iommu can only map chunks of consecutive pfns anyway, so get the
@@ -681,32 +742,40 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
 		 * and rsvd here, and therefore continues to use the batch.
 		 */
 		while (true) {
+			long nr_pages, acct_pages = 0;
+
 			if (pfn != *pfn_base + pinned ||
 			    rsvd != is_invalid_reserved_pfn(pfn))
 				goto out;
 
+			nr_pages = contig_pages(dma, batch, iova);
+			if (!rsvd) {
+				acct_pages = nr_pages;
+				acct_pages -= vpfn_pages(dma, iova, nr_pages);
+			}
+
 			/*
 			 * Reserved pages aren't counted against the user,
 			 * externally pinned pages are already counted against
 			 * the user.
 			 */
-			if (!rsvd && !vfio_find_vpfn(dma, iova)) {
+			if (acct_pages) {
 				if (!dma->lock_cap &&
-				    mm->locked_vm + lock_acct + 1 > limit) {
+						mm->locked_vm + lock_acct + acct_pages > limit) {
 					pr_warn("%s: RLIMIT_MEMLOCK (%ld) exceeded\n",
 						__func__, limit << PAGE_SHIFT);
 					ret = -ENOMEM;
 					goto unpin_out;
 				}
-				lock_acct++;
+				lock_acct += acct_pages;
 			}
 
-			pinned++;
-			npage--;
-			vaddr += PAGE_SIZE;
-			iova += PAGE_SIZE;
-			batch->offset++;
-			batch->size--;
+			pinned += nr_pages;
+			npage -= nr_pages;
+			vaddr += PAGE_SIZE * nr_pages;
+			iova += PAGE_SIZE * nr_pages;
+			batch->offset += nr_pages;
+			batch->size -= nr_pages;
 
 			if (!batch->size)
 				break;
-- 
2.20.1

