Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8518319DF48
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 21:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743800829; cv=none; b=jxfktDmtLK+z1AjD24CLl3wPj4HaVuV/eATMmXEjuHaadsG5oYWUcQ4gVTNKZGFhZX2FWK7qI4wboCOIV0EJjR8xo9OqbPKNxzCVJWoKttkTTc86pRvsGk4LJpYzHWqDxxGI6kzsGubV31rdPf3bR9+iNOAfEP+17V7qe6Ptr0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743800829; c=relaxed/simple;
	bh=x25eIUo6VkYoCUtqxJ6hHhPHU0LH2iMLq4u6rDb9zDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ah+XThd89s+TgoAee3+M7GrJo1xChwXj1PD7Gh9+vnvdSPEzicqdV9Q+eay1czcFd5ydxfFXtza3sxw56hbXEZwgUnnoLesyxnwhkK261Px0cBk9+S58l4PbZL/SFtc1Tw0IL+j5/9JJbRWe+sBJfU7SxjjG02Roa6iQvHEPzbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjPrYRhr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjPrYRhr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE601C4CEDD;
	Fri,  4 Apr 2025 21:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743800828;
	bh=x25eIUo6VkYoCUtqxJ6hHhPHU0LH2iMLq4u6rDb9zDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HjPrYRhr9Z7oTIv0r/O7mTYr2szq9bcvmUiqSzHwAamexSCI1B7OB5tAvTdgqr0XR
	 r4iSWr7knMRVGPyCELhZTjQ0tUwZ11hqg76RYMy9LVzWdswC/c+ylC/P0JHcQLFSDG
	 E9IbbpFZufhnMH1G0a39KdFFJVp0bjta7evjxrdnBXqW8BEwyzF9j3iAN/GWwG/zLI
	 hdo8SNtiKK2HZYRGX+Be77WnsEYlwaiUr8SVsIX8mJXlP0+UJhNsbTxNvLmdTrhcQT
	 GO/1FlgMgpcnvX1R5vu+kp5GhVqW6w9Hn4uaLTZGaIXSyzda+5QCKU7+A7trNNM8sZ
	 PN6QwXfiSmTqw==
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
Subject: [PATCH v2 2/4] mm/madvise: batch tlb flushes for MADV_FREE
Date: Fri,  4 Apr 2025 14:06:58 -0700
Message-Id: <20250404210700.2156-3-sj@kernel.org>
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

MADV_FREE handling for [process_]madvise() flushes tlb for each vma of
each address range.  Update the logic to do tlb flushes in a batched
way.  Initialize an mmu_gather object from do_madvise() and
vector_madvise(), which are the entry level functions for
[process_]madvise(), respectively.  And pass those objects to the
function for per-vma work, via madvise_behavior struct.  Make the
per-vma logic not flushes tlb on their own but just saves the tlb
entries to the received mmu_gather object.  Finally, the entry level
functions flush the tlb entries that gathered for the entire user
request, at once.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/madvise.c | 59 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 8bcfdd995d18..564095e381b2 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -799,12 +799,13 @@ static const struct mm_walk_ops madvise_free_walk_ops = {
 	.walk_lock		= PGWALK_RDLOCK,
 };
 
-static int madvise_free_single_vma(struct vm_area_struct *vma,
-			unsigned long start_addr, unsigned long end_addr)
+static int madvise_free_single_vma(
+		struct madvise_behavior *behavior, struct vm_area_struct *vma,
+		unsigned long start_addr, unsigned long end_addr)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct mmu_notifier_range range;
-	struct mmu_gather tlb;
+	struct mmu_gather *tlb = behavior->tlb;
 
 	/* MADV_FREE works for only anon vma at the moment */
 	if (!vma_is_anonymous(vma))
@@ -820,17 +821,14 @@ static int madvise_free_single_vma(struct vm_area_struct *vma,
 				range.start, range.end);
 
 	lru_add_drain();
-	tlb_gather_mmu(&tlb, mm);
 	update_hiwater_rss(mm);
 
 	mmu_notifier_invalidate_range_start(&range);
-	tlb_start_vma(&tlb, vma);
+	tlb_start_vma(tlb, vma);
 	walk_page_range(vma->vm_mm, range.start, range.end,
-			&madvise_free_walk_ops, &tlb);
-	tlb_end_vma(&tlb, vma);
+			&madvise_free_walk_ops, tlb);
+	tlb_end_vma(tlb, vma);
 	mmu_notifier_invalidate_range_end(&range);
-	tlb_finish_mmu(&tlb);
-
 	return 0;
 }
 
@@ -953,7 +951,7 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
 	if (action == MADV_DONTNEED || action == MADV_DONTNEED_LOCKED)
 		return madvise_dontneed_single_vma(vma, start, end);
 	else if (action == MADV_FREE)
-		return madvise_free_single_vma(vma, start, end);
+		return madvise_free_single_vma(behavior, vma, start, end);
 	else
 		return -EINVAL;
 }
@@ -1626,6 +1624,29 @@ static void madvise_unlock(struct mm_struct *mm, int behavior)
 		mmap_read_unlock(mm);
 }
 
+static bool madvise_batch_tlb_flush(int behavior)
+{
+	switch (behavior) {
+	case MADV_FREE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static void madvise_init_tlb(struct madvise_behavior *madv_behavior,
+		struct mm_struct *mm)
+{
+	if (madvise_batch_tlb_flush(madv_behavior->behavior))
+		tlb_gather_mmu(madv_behavior->tlb, mm);
+}
+
+static void madvise_finish_tlb(struct madvise_behavior *madv_behavior)
+{
+	if (madvise_batch_tlb_flush(madv_behavior->behavior))
+		tlb_finish_mmu(madv_behavior->tlb);
+}
+
 static bool is_valid_madvise(unsigned long start, size_t len_in, int behavior)
 {
 	size_t len;
@@ -1782,14 +1803,20 @@ static int madvise_do_behavior(struct mm_struct *mm,
 int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int behavior)
 {
 	int error;
-	struct madvise_behavior madv_behavior = {.behavior = behavior};
+	struct mmu_gather tlb;
+	struct madvise_behavior madv_behavior = {
+		.behavior = behavior,
+		.tlb = &tlb,
+	};
 
 	if (madvise_should_skip(start, len_in, behavior, &error))
 		return error;
 	error = madvise_lock(mm, behavior);
 	if (error)
 		return error;
+	madvise_init_tlb(&madv_behavior, mm);
 	error = madvise_do_behavior(mm, start, len_in, &madv_behavior);
+	madvise_finish_tlb(&madv_behavior);
 	madvise_unlock(mm, behavior);
 
 	return error;
@@ -1806,13 +1833,18 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 {
 	ssize_t ret = 0;
 	size_t total_len;
-	struct madvise_behavior madv_behavior = {.behavior = behavior};
+	struct mmu_gather tlb;
+	struct madvise_behavior madv_behavior = {
+		.behavior = behavior,
+		.tlb = &tlb,
+	};
 
 	total_len = iov_iter_count(iter);
 
 	ret = madvise_lock(mm, behavior);
 	if (ret)
 		return ret;
+	madvise_init_tlb(&madv_behavior, mm);
 
 	while (iov_iter_count(iter)) {
 		unsigned long start = (unsigned long)iter_iov_addr(iter);
@@ -1841,14 +1873,17 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 			}
 
 			/* Drop and reacquire lock to unwind race. */
+			madvise_finish_tlb(&madv_behavior);
 			madvise_unlock(mm, behavior);
 			madvise_lock(mm, behavior);
+			madvise_init_tlb(&madv_behavior, mm);
 			continue;
 		}
 		if (ret < 0)
 			break;
 		iov_iter_advance(iter, iter_iov_len(iter));
 	}
+	madvise_finish_tlb(&madv_behavior);
 	madvise_unlock(mm, behavior);
 
 	ret = (total_len - iov_iter_count(iter)) ? : ret;
-- 
2.39.5
