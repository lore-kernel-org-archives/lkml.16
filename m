Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3462320E33F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744243248; cv=none; b=tcvpGOwR1QVEiTNMX2a/YoGIdgekIIBJXPhm6WHQATcOHMPzU/b8S7Aepr6d6BgTvUapqWUW3lJCTPaGHi56tiiC38M5eODdNA1JzUWVubG0h/eAppRgE802e7tEWNvsfdmt3mQVhjNcDOe4OUWE6fYiXsnE4x0RAtDHPosRyvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744243248; c=relaxed/simple;
	bh=IBkUpUZBg5kO3BQ+hDKIWhFYAjVEYGs2Rh96p5apXwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M7BtdhwHdaLgwWSBDwwVgjM3dGCSCOIMUL90A5EUD93XlotCVU771WYwki8TjFCCJz/sKzprR24Lbq7dMbOg6l8nTboMlVNrpw+4Et7Sw9FuhcqpToqFknDZljrx+bEhDdKdaoyNm5k0TEZgGXFxVJmXjXjnjA9na6KE7VUbjC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p5ZwDjtQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p5ZwDjtQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D35C4CEE2;
	Thu, 10 Apr 2025 00:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744243247;
	bh=IBkUpUZBg5kO3BQ+hDKIWhFYAjVEYGs2Rh96p5apXwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p5ZwDjtQl7XjSSd/tBnBXVz/IgfOj5bqgDwup5g/5OnK0V1fqHV9yeOmYqgy9veSb
	 ZpNwByXJQujyZip8zr1DoR/ZHd+HpFty7hMsE4jMhdq3cIyC1Jt8OYGDF0bo5WGmGW
	 ifHjdOMJ+X0M9gtLiKBJtbUM1OHY8XIOlF0qKrA2PHE2iYNkGtzInWpS6u7jyIyWSQ
	 os3jZt8ZpgHsdvTyFx0fBR45miXYCPZztnUe8dqHlRMzbyxZkDVEp3mzFPRvVGc52H
	 CqbeEfMTrHzUzFQINzi7d+202l1tmBjXoC89Zu7pQiKeNfZQhNBGZUhC4l3e6V+qx5
	 xSVaOkY+ReVHQ==
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
Subject: [PATCH v3 4/4] mm/madvise: batch tlb flushes for MADV_DONTNEED[_LOCKED]
Date: Wed,  9 Apr 2025 17:00:22 -0700
Message-Id: <20250410000022.1901-5-sj@kernel.org>
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

MADV_DONTNEED[_LOCKED] handling for [process_]madvise() flushes tlb for
each vma of each address range.  Update the logic to do tlb flushes in a
batched way.  Initialize an mmu_gather object from do_madvise() and
vector_madvise(), which are the entry level functions for
[process_]madvise(), respectively.  And pass those objects to the
function for per-vma work, via madvise_behavior struct.  Make the
per-vma logic not flushes tlb on their own but just saves the tlb
entries to the received mmu_gather object.  For this internal logic
change, make zap_page_range_single_batched() non-static and use it
directly from madvise_dontneed_single_vma().  Finally, the entry level
functions flush the tlb entries that gathered for the entire user
request, at once.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/internal.h |  3 +++
 mm/madvise.c  | 11 ++++++++---
 mm/memory.c   |  4 ++--
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index ef92e88738fe..c5f9dd007215 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -435,6 +435,9 @@ void unmap_page_range(struct mmu_gather *tlb,
 			     struct vm_area_struct *vma,
 			     unsigned long addr, unsigned long end,
 			     struct zap_details *details);
+void zap_page_range_single_batched(struct mmu_gather *tlb,
+		struct vm_area_struct *vma, unsigned long addr,
+		unsigned long size, struct zap_details *details);
 int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
 			   gfp_t gfp);
 
diff --git a/mm/madvise.c b/mm/madvise.c
index 951038a9f36f..8433ac9b27e0 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -851,7 +851,8 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
  * An interface that causes the system to free clean pages and flush
  * dirty pages is already available as msync(MS_INVALIDATE).
  */
-static long madvise_dontneed_single_vma(struct vm_area_struct *vma,
+static long madvise_dontneed_single_vma(struct madvise_behavior *madv_behavior,
+					struct vm_area_struct *vma,
 					unsigned long start, unsigned long end)
 {
 	struct zap_details details = {
@@ -859,7 +860,8 @@ static long madvise_dontneed_single_vma(struct vm_area_struct *vma,
 		.even_cows = true,
 	};
 
-	zap_page_range_single(vma, start, end - start, &details);
+	zap_page_range_single_batched(
+			madv_behavior->tlb, vma, start, end - start, &details);
 	return 0;
 }
 
@@ -950,7 +952,8 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
 	}
 
 	if (behavior == MADV_DONTNEED || behavior == MADV_DONTNEED_LOCKED)
-		return madvise_dontneed_single_vma(vma, start, end);
+		return madvise_dontneed_single_vma(
+				madv_behavior, vma, start, end);
 	else if (behavior == MADV_FREE)
 		return madvise_free_single_vma(madv_behavior, vma, start, end);
 	else
@@ -1628,6 +1631,8 @@ static void madvise_unlock(struct mm_struct *mm, int behavior)
 static bool madvise_batch_tlb_flush(int behavior)
 {
 	switch (behavior) {
+	case MADV_DONTNEED:
+	case MADV_DONTNEED_LOCKED:
 	case MADV_FREE:
 		return true;
 	default:
diff --git a/mm/memory.c b/mm/memory.c
index 690695643dfb..559f3e194438 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1998,7 +1998,7 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
 	mmu_notifier_invalidate_range_end(&range);
 }
 
-/*
+/**
  * zap_page_range_single_batched - remove user pages in a given range
  * @tlb: pointer to the caller's struct mmu_gather
  * @vma: vm_area_struct holding the applicable pages
@@ -2009,7 +2009,7 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
  * @tlb shouldn't be NULL.  The range must fit into one VMA.  If @vma is for
  * hugetlb, @tlb is flushed and re-initialized by this function.
  */
-static void zap_page_range_single_batched(struct mmu_gather *tlb,
+void zap_page_range_single_batched(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, unsigned long address,
 		unsigned long size, struct zap_details *details)
 {
-- 
2.39.5
