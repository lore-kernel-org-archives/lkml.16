Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66081C8630
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744243245; cv=none; b=QVeTmFd4we/06TZJBgsACU8xYawJ0eg0RcmTEb8F25PZNZNQB+Fkgzl65Cyef1F/EVjY7o6prw+L7HH9+H2XPBqoP9esGTwgv5K2325uRiYkQ6oXCWDYbvcKOesaEsR422QMkV5njiVXtVa8x4qRdEuwi+WYj5iOWrn6z8Q8Tz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744243245; c=relaxed/simple;
	bh=dkT2xHQjKC605c81qGII2JAGaeNQ/xG5ym+UekI2lR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MmyHfXzDNqlod7jmrg6P5ImYRYMSB97zToFHKm14op/BoSc++E0vBTksw9D6ijxIzdvxGQtfJj1waBjQDS+YvL56heywNrsK0y9OS8PfXI+bl5tiAp1WTHZYpyMH/x9gA/DFj8ImNddYHXuQ256OOAK1/Mcj0/dNguxy6mDTEtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVCCyujV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVCCyujV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9BEC4CEE2;
	Thu, 10 Apr 2025 00:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744243245;
	bh=dkT2xHQjKC605c81qGII2JAGaeNQ/xG5ym+UekI2lR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XVCCyujVyhZO/6pZC6zQJ8ACzYqibNmVtsKHhsxECVQir4MCa5NxyDzEA3buXH9sq
	 T1bxafDXAjcsepzIcZ5rk4/LbsMa/E9DQ2fOgJ4iU5Lwu1Ju6gO/IObVbOqj9My6ij
	 GCgWZiNBm7zdRH2YMCUB1+LBE4LX+WHA07OhorwmzjxHWSNSWIdSCmzUn9pjQCg492
	 7DzRbIG0rmangBqkPo4NtTI8gsy6wPweAHqwFywW2Zq+ev09CexT7dLdwnoPq6jHnh
	 ErQ4hx+2CY1/izeEfR/V8vp5+2OP+Rp52t3fNdqfJXdE7ZJZE71A+3YyTY4+eHCDLv
	 aTTzaygJw3kgg==
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
Subject: [PATCH v3 2/4] mm/madvise: batch tlb flushes for MADV_FREE
Date: Wed,  9 Apr 2025 17:00:20 -0700
Message-Id: <20250410000022.1901-3-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410000022.1901-1-sj@kernel.org>
References: <20250410000022.1901-1-sj@kernel.org>
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

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/madvise.c | 57 ++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 26fa868b41af..951038a9f36f 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -799,12 +799,13 @@ static const struct mm_walk_ops madvise_free_walk_ops = {
 	.walk_lock		= PGWALK_RDLOCK,
 };
 
-static int madvise_free_single_vma(struct vm_area_struct *vma,
+static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
+			struct vm_area_struct *vma,
 			unsigned long start_addr, unsigned long end_addr)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct mmu_notifier_range range;
-	struct mmu_gather tlb;
+	struct mmu_gather *tlb = madv_behavior->tlb;
 
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
 
@@ -954,7 +952,7 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
 	if (behavior == MADV_DONTNEED || behavior == MADV_DONTNEED_LOCKED)
 		return madvise_dontneed_single_vma(vma, start, end);
 	else if (behavior == MADV_FREE)
-		return madvise_free_single_vma(vma, start, end);
+		return madvise_free_single_vma(madv_behavior, vma, start, end);
 	else
 		return -EINVAL;
 }
@@ -1627,6 +1625,29 @@ static void madvise_unlock(struct mm_struct *mm, int behavior)
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
@@ -1783,14 +1804,20 @@ static int madvise_do_behavior(struct mm_struct *mm,
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
@@ -1807,13 +1834,18 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
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
@@ -1842,14 +1874,17 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
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
