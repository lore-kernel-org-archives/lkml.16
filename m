Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2C722069F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 21:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743800831; cv=none; b=YDMzE8oIcb3ykgh06tPNJ31LY1nKQVYAN59wPplNtVwkTo8k5fXI7rKTwywslovBYe/d0aUmMhQgZzKm9cqehhCs9wcokKxIxO1wZW5g4tx/gAAZ56I8nw+l0qtcT2hoU/YMQmdaGxB/pfT53ivKQ+b/cxlGOGCla7F9O51ecwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743800831; c=relaxed/simple;
	bh=PmO0QX64UlqAoz84TozSVHOKpk+4GGuBfZEHaifqBDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EMNpQeat3bRKi8uawtIgeNY3QW7e1tY1ha2v2gUcNYcgit2ndaUfEDkCDKglDfeTfe6afIs88+w34OJyVU7wEXtWA06tIhpc9BJADa6+5RdpZQQcntYS81InQQ1OOFRkFnCb6QR0dalwod+8hkCBPVu6ZQDXxTzNH8ANzF8VvI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tfe5O0hn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfe5O0hn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF3BC4CEDD;
	Fri,  4 Apr 2025 21:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743800831;
	bh=PmO0QX64UlqAoz84TozSVHOKpk+4GGuBfZEHaifqBDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tfe5O0hnRe939EEJfRxDNGiQ2pY/sppUaKc+3ycE4PVz3K9kjCVQqNYTL2cUilCYI
	 aOrXiWURyiVn/Su/0TO9rfP1GBglrQs9yjvvDxZxFQPWwtgiLTozL5CMbvStwljFzi
	 8AETsR/AgF2+QXn/dN3hkJP+Cjdr7wf77DY8hfk6iOcWfh5suzQ5VqVkMhZxbynnO5
	 zs0vUjCSXYyCbmTtu3R9xs1Eg4sVBkMnRhRAEJyY02L7Z3YkAF6i9HPOJr5tl6HVU5
	 sg0H9Y220WDutkwLm9uznN13Hk0Ei6e/kFjPaXS0LC/URd8bnydmoD1GLapOGrNtft
	 L0meA5IVAPO3w==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R.Howlett" <howlett@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Rik van Riel <riel@surriel.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 4/4] mm/madvise: batch tlb flushes for MADV_DONTNEED[_LOCKED]
Date: Fri,  4 Apr 2025 14:07:00 -0700
Message-Id: <20250404210700.2156-5-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404210700.2156-1-sj@kernel.org>
References: <20250404210700.2156-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Batch tlb flushes for MADV_DONTNEED[_LOCKED] for better efficiency, in a
way that very similar to the tlb flushes batching for MADV_FREE.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/internal.h | 3 +++
 mm/madvise.c  | 9 ++++++---
 mm/memory.c   | 4 ++--
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index e9695baa5922..be0c46837e22 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -435,6 +435,9 @@ void unmap_page_range(struct mmu_gather *tlb,
 			     struct vm_area_struct *vma,
 			     unsigned long addr, unsigned long end,
 			     struct zap_details *details);
+void notify_unmap_single_vma(struct mmu_gather *tlb,
+		struct vm_area_struct *vma, unsigned long addr,
+		unsigned long size, struct zap_details *details);
 int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
 			   gfp_t gfp);
 
diff --git a/mm/madvise.c b/mm/madvise.c
index 564095e381b2..c7ac32b4a371 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -851,7 +851,8 @@ static int madvise_free_single_vma(
  * An interface that causes the system to free clean pages and flush
  * dirty pages is already available as msync(MS_INVALIDATE).
  */
-static long madvise_dontneed_single_vma(struct vm_area_struct *vma,
+static long madvise_dontneed_single_vma(struct madvise_behavior *behavior,
+					struct vm_area_struct *vma,
 					unsigned long start, unsigned long end)
 {
 	struct zap_details details = {
@@ -859,7 +860,7 @@ static long madvise_dontneed_single_vma(struct vm_area_struct *vma,
 		.even_cows = true,
 	};
 
-	zap_page_range_single(vma, start, end - start, &details);
+	notify_unmap_single_vma(behavior->tlb, vma, start, end - start, &details);
 	return 0;
 }
 
@@ -949,7 +950,7 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
 	}
 
 	if (action == MADV_DONTNEED || action == MADV_DONTNEED_LOCKED)
-		return madvise_dontneed_single_vma(vma, start, end);
+		return madvise_dontneed_single_vma(behavior, vma, start, end);
 	else if (action == MADV_FREE)
 		return madvise_free_single_vma(behavior, vma, start, end);
 	else
@@ -1627,6 +1628,8 @@ static void madvise_unlock(struct mm_struct *mm, int behavior)
 static bool madvise_batch_tlb_flush(int behavior)
 {
 	switch (behavior) {
+	case MADV_DONTNEED:
+	case MADV_DONTNEED_LOCKED:
 	case MADV_FREE:
 		return true;
 	default:
diff --git a/mm/memory.c b/mm/memory.c
index 8c9bbb1a008c..6a01b73aa111 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1989,7 +1989,7 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
 	mmu_notifier_invalidate_range_end(&range);
 }
 
-/*
+/**
  * notify_unmap_single_vma - remove user pages in a given range
  * @tlb: pointer to the caller's struct mmu_gather
  * @vma: vm_area_struct holding the applicable pages
@@ -2000,7 +2000,7 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
  * @tlb shouldn't be NULL.  The range must fit into one VMA.  If @vma is for
  * hugetlb, @tlb is flushed and re-initialized by this function.
  */
-static void notify_unmap_single_vma(struct mmu_gather *tlb,
+void notify_unmap_single_vma(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, unsigned long address,
 		unsigned long size, struct zap_details *details)
 {
-- 
2.39.5
