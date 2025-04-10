Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A4713AC1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744243245; cv=none; b=fNZSZ6uxwKky2iAnLwXVVjo6UWwB82e4KyykNMM9Zx+7QWWMeC52/JB6YpL+zGR98TtTToAHSLSexxo3j82Q9ATS9cqUetABWAXubJOHhtJNLpsvmvwTGO943jIfYCim9Q8BXUEtcKLn61IBytYKRIVM05uew8G+d2J24MAf+Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744243245; c=relaxed/simple;
	bh=xd4mck/AQ5TPoldc/O3PgGKXoydGwIPm1O/sUKAmeLg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oDfJr8Lf0haYqfHXK2PnwprRwsVtl9QFFrMObqmschJge8zIOluRyLzkUwoPeok9gbYPVUendhy/yLNcpET+9bjb0b2XrKwqk89JEP0fgAr7OnZJ7mLDHkOcEHyfA23J+4I9GSCWCWPH2k79mjgO7+KfI0Yc45YtrMDU19zprvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9oAE4TY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9oAE4TY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D10C4CEE3;
	Thu, 10 Apr 2025 00:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744243244;
	bh=xd4mck/AQ5TPoldc/O3PgGKXoydGwIPm1O/sUKAmeLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b9oAE4TYiYRGl4iNGjv4aMkqQaxVmLxLLE3yT1rh0/X9MYBtai3P6dP8ovYbsONvV
	 IqD+wwLVuqQS8znqCewXXKH1QX2vPh1PW+UxXocMW6E7i6RJ6QVVT68DCkB/haYNQj
	 4e6B56AbGvGkI8wUxg9aTkC0RzZZuh+hWfJrenp6gZvixz/xdA+hm/vpQJ1iXO95tC
	 XZqQgPb4Hp4beOK9e1xTDr0UM+cPPL+zoG1CEjDWvdYpawa0AC9bnB3GHfGeE4aX6b
	 xGUZqOJmPmbptvnzMqOqiw/igLJR1gCriDFUnSvifui/dOmOLMuC7TKVj9w60/HWZ0
	 yFMxgiCdFX76w==
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
Subject: [PATCH v3 1/4] mm/madvise: define and use madvise_behavior struct for madvise_do_behavior()
Date: Wed,  9 Apr 2025 17:00:19 -0700
Message-Id: <20250410000022.1901-2-sj@kernel.org>
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

To implement batched tlb flushes for MADV_DONTNEED[_LOCKED] and
MADV_FREE, an mmu_gather object in addition to the behavior integer need
to be passed to the internal logics.  Using a struct can make it easy
without increasing the number of parameters of all code paths towards
the internal logic.  Define a struct for the purpose and use it on the
code path that starts from madvise_do_behavior() and ends on
madvise_dontneed_free().  Note that this changes madvise_walk_vmas()
visitor type signature, too.  Specifically, it changes its 'arg' type
from 'unsigned long' to the new struct pointer.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/madvise.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index b17f684322ad..26fa868b41af 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -48,6 +48,11 @@ struct madvise_walk_private {
 	bool pageout;
 };
 
+struct madvise_behavior {
+	int behavior;
+	struct mmu_gather *tlb;
+};
+
 /*
  * Any behaviour which results in changes to the vma->vm_flags needs to
  * take mmap_lock for writing. Others, which simply traverse vmas, need
@@ -893,8 +898,9 @@ static bool madvise_dontneed_free_valid_vma(struct vm_area_struct *vma,
 static long madvise_dontneed_free(struct vm_area_struct *vma,
 				  struct vm_area_struct **prev,
 				  unsigned long start, unsigned long end,
-				  int behavior)
+				  struct madvise_behavior *madv_behavior)
 {
+	int behavior = madv_behavior->behavior;
 	struct mm_struct *mm = vma->vm_mm;
 
 	*prev = vma;
@@ -1249,8 +1255,10 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
 static int madvise_vma_behavior(struct vm_area_struct *vma,
 				struct vm_area_struct **prev,
 				unsigned long start, unsigned long end,
-				unsigned long behavior)
+				void *behavior_arg)
 {
+	struct madvise_behavior *arg = behavior_arg;
+	int behavior = arg->behavior;
 	int error;
 	struct anon_vma_name *anon_name;
 	unsigned long new_flags = vma->vm_flags;
@@ -1270,7 +1278,7 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 	case MADV_FREE:
 	case MADV_DONTNEED:
 	case MADV_DONTNEED_LOCKED:
-		return madvise_dontneed_free(vma, prev, start, end, behavior);
+		return madvise_dontneed_free(vma, prev, start, end, arg);
 	case MADV_NORMAL:
 		new_flags = new_flags & ~VM_RAND_READ & ~VM_SEQ_READ;
 		break;
@@ -1487,10 +1495,10 @@ static bool process_madvise_remote_valid(int behavior)
  */
 static
 int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
-		      unsigned long end, unsigned long arg,
+		      unsigned long end, void *arg,
 		      int (*visit)(struct vm_area_struct *vma,
 				   struct vm_area_struct **prev, unsigned long start,
-				   unsigned long end, unsigned long arg))
+				   unsigned long end, void *arg))
 {
 	struct vm_area_struct *vma;
 	struct vm_area_struct *prev;
@@ -1548,7 +1556,7 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 static int madvise_vma_anon_name(struct vm_area_struct *vma,
 				 struct vm_area_struct **prev,
 				 unsigned long start, unsigned long end,
-				 unsigned long anon_name)
+				 void *anon_name)
 {
 	int error;
 
@@ -1557,7 +1565,7 @@ static int madvise_vma_anon_name(struct vm_area_struct *vma,
 		return -EBADF;
 
 	error = madvise_update_vma(vma, prev, start, end, vma->vm_flags,
-				   (struct anon_vma_name *)anon_name);
+				   anon_name);
 
 	/*
 	 * madvise() returns EAGAIN if kernel resources, such as
@@ -1589,7 +1597,7 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 	if (end == start)
 		return 0;
 
-	return madvise_walk_vmas(mm, start, end, (unsigned long)anon_name,
+	return madvise_walk_vmas(mm, start, end, anon_name,
 				 madvise_vma_anon_name);
 }
 #endif /* CONFIG_ANON_VMA_NAME */
@@ -1677,8 +1685,10 @@ static bool is_madvise_populate(int behavior)
 }
 
 static int madvise_do_behavior(struct mm_struct *mm,
-		unsigned long start, size_t len_in, int behavior)
+		unsigned long start, size_t len_in,
+		struct madvise_behavior *madv_behavior)
 {
+	int behavior = madv_behavior->behavior;
 	struct blk_plug plug;
 	unsigned long end;
 	int error;
@@ -1692,7 +1702,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
 	if (is_madvise_populate(behavior))
 		error = madvise_populate(mm, start, end, behavior);
 	else
-		error = madvise_walk_vmas(mm, start, end, behavior,
+		error = madvise_walk_vmas(mm, start, end, madv_behavior,
 					  madvise_vma_behavior);
 	blk_finish_plug(&plug);
 	return error;
@@ -1773,13 +1783,14 @@ static int madvise_do_behavior(struct mm_struct *mm,
 int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int behavior)
 {
 	int error;
+	struct madvise_behavior madv_behavior = {.behavior = behavior};
 
 	if (madvise_should_skip(start, len_in, behavior, &error))
 		return error;
 	error = madvise_lock(mm, behavior);
 	if (error)
 		return error;
-	error = madvise_do_behavior(mm, start, len_in, behavior);
+	error = madvise_do_behavior(mm, start, len_in, &madv_behavior);
 	madvise_unlock(mm, behavior);
 
 	return error;
@@ -1796,6 +1807,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 {
 	ssize_t ret = 0;
 	size_t total_len;
+	struct madvise_behavior madv_behavior = {.behavior = behavior};
 
 	total_len = iov_iter_count(iter);
 
@@ -1811,7 +1823,8 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 		if (madvise_should_skip(start, len_in, behavior, &error))
 			ret = error;
 		else
-			ret = madvise_do_behavior(mm, start, len_in, behavior);
+			ret = madvise_do_behavior(mm, start, len_in,
+					&madv_behavior);
 		/*
 		 * An madvise operation is attempting to restart the syscall,
 		 * but we cannot proceed as it would not be correct to repeat
-- 
2.39.5
