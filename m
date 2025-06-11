Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861B5183098
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638878; cv=none; b=Nf0T6wC7dkZj809Eh2YGdmTf0RosdTccS8eTY0q8qcRp8LLCUi/zNmZdik4Psppywsb9D+6hLNqy2XbqclxZmvMH2d7e9fzusTipEOyJMKwk7gbnOADA0PSdU1ENkIolB50pVWyAFbKFslCqLvqTpfmZGWlZ+CJq8TLELpbivxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638878; c=relaxed/simple;
	bh=Cf+rzbDEGsSIm5592rlYYhKmPHD1Z0k6wVWcnk84XsA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NJjZMvkS7dI6M79F5ZRCC7LY1drw6d7Qn3soUdHl6CUmMR5uxUJSn7uWQQTJ1IFo7arAPYg2Hag8bK2H1uxNa6sfJKSIl4NnBlgKxVhXBrURyEUAuRcL83cKw+cCbYeaAXwCuca0hYjNpXwM0WcUvA6hvNBMsXDv06PXg2BWjpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9V2I66+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9V2I66+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23602481460so45007085ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749638876; x=1750243676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IATbHsmqXh9ppqtYYMC8mGqTuTZe94iQ4dSNDan9JV0=;
        b=g9V2I66+L2m4yODU4Raj53x8X9FttD1cuutJxHa2c2Delv0vovIFm9c1XAN7e8WeO8
         bn+rt+if89PM12eeHWXDjCxvSe3JUHd1FSgOO1dDx7pFrza0u/z84AOJD/jAUFKBEOXp
         F1K91VK3qfMu4pIVS/GpO+nlclR9639ODTXd/HQYHn7TjpVWt2lTr/7VZK0GTziA2wI8
         I1e4wb7utNTnAnHwucHQ+8NJlaEOr/6fnR/Gw5LU/CiV5DioYeJ2Kw61vlfOKILm49R8
         uTh+NJ3hXo72NqpQFN3ja1vbzy+4ykdiQltzZado5s5AoWqHipVFAicxMq4N/o/YfloV
         Sq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749638876; x=1750243676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IATbHsmqXh9ppqtYYMC8mGqTuTZe94iQ4dSNDan9JV0=;
        b=DEV/ADDvH0ICdMrlV42pbp8uQ1Wi2GEuN3AeJu3BgrgVsIpTST6s8HyPEWQjKrpekg
         0FhGgSOIaIazNZ6P+GjtK1THghDfUVytjgYeIlfRpfsGGUm7QzA/yxM5GglvN5lLtQ6u
         wTcBP1dZxo1lfvwOXjOmkfHHsWG4hTXv0wK5ebHQr2yTQhi2iHwCAyWdw5EU29AmMCFH
         hqnM+BZUZ9euVF6Rx9RwTVdmLkVJqoGhYVpPycbqP+oTqaOEaLMrSS+65pLuNtACqCgx
         6cyVywjZ8PQazx4JqR/rb5iVF99gZmXOyNmoaQki+eEWCSBYE91dTF0bEoTFoGrN7P/v
         orIQ==
X-Gm-Message-State: AOJu0YzEdRSk6tMkIQNgY/fOAsQeezpEMSIPqEti08ufU6alQmzqNo5S
	48lhLaBmbrUnJKiIi499/8Haayv/sNqLfE5EsLz2Der2f+pjghvzTwvZHUXSEw==
X-Gm-Gg: ASbGncssyfmQ3MfHZCqdbyXRkyTC/fUxAPwECwJ37MafGlnADxlGKkQf0JRyZThQP9R
	2Db+oYd0D7GJCjK+WRU8vC4YC3C8bYw2yMTF+TNiCO5j2nO602CqShVuLhGGN68b4SeUf92oXzr
	xSiSDOoj+eK0l7QvFfGNIu5Az2JyU5WgrhF6hWfxyTmMhwwA/nhVW7mDetP1/jJ4ihHO2BMhwvY
	OqBcaDmJDQ4oX0y60Cktfk7a6zshTzIoVXRHp1fU4UqHVauiALTbiJwcuHsVxNNwmynYEol3H6o
	q51maXJXpz6kyn7MxTaG8x0wDAJ9aed3aXw2LPJKl27eUU5sHJ/a6Jw15dzm+TnS/9FsVJ6Uihr
	FwfOC
X-Google-Smtp-Source: AGHT+IG7Ts8vk8S253GfK3t0zJhYPM8IhEy9hyOq2A5wlHjtS9dgsnPqr8WB0g2fvrj/uH8aVQGkLg==
X-Received: by 2002:a17:902:c94f:b0:235:dd54:bce1 with SMTP id d9443c01a7336-23641abc5e2mr37663705ad.15.1749638875560;
        Wed, 11 Jun 2025 03:47:55 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b200a23esm1020087a91.18.2025.06.11.03.47.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Jun 2025 03:47:55 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2] mm: madvise: use per_vma lock for MADV_FREE
Date: Wed, 11 Jun 2025 22:47:45 +1200
Message-Id: <20250611104745.57405-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Barry Song <v-songbaohua@oppo.com>

MADV_FREE is another option, besides MADV_DONTNEED, for dynamic memory
freeing in user-space native or Java heap memory management. For example,
jemalloc can be configured to use MADV_FREE, and recent versions of the
Android Java heap have also increasingly adopted MADV_FREE. Supporting
per-VMA locking for MADV_FREE thus appears increasingly necessary.

We have replaced walk_page_range() with walk_page_range_vma(). Along with
the proposed madvise_lock_mode by Lorenzo, the necessary infrastructure is
now in place to begin exploring per-VMA locking support for MADV_FREE and
potentially other madvise using walk_page_range_vma().

This patch adds support for the PGWALK_VMA_RDLOCK walk_lock mode in
walk_page_range_vma(), and leverages madvise_lock_mode from
madv_behavior to select the appropriate walk_lock—either mmap_lock or
per-VMA lock—based on the context.

Because we now dynamically update the walk_ops->walk_lock field, we
must ensure this is thread-safe. The madvise_free_walk_ops is now
defined as a stack variable instead of a global constant.

Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Lokesh Gidra <lokeshgidra@google.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 -v2:
  * Collect David's acked-by and Lorenzo's reviewed-by;
  * refine changelog and code cleanup according to David and Lorenzo

 include/linux/pagewalk.h |  2 ++
 mm/madvise.c             | 25 +++++++++++++++++++------
 mm/pagewalk.c            |  5 ++++-
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index 9700a29f8afb..a4afa64ef0ab 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -14,6 +14,8 @@ enum page_walk_lock {
 	PGWALK_WRLOCK = 1,
 	/* vma is expected to be already write-locked during the walk */
 	PGWALK_WRLOCK_VERIFY = 2,
+	/* vma is expected to be already read-locked during the walk */
+	PGWALK_VMA_RDLOCK_VERIFY = 3,
 };
 
 /**
diff --git a/mm/madvise.c b/mm/madvise.c
index 790c238d04d4..267d8e4adf31 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -777,10 +777,19 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 	return 0;
 }
 
-static const struct mm_walk_ops madvise_free_walk_ops = {
-	.pmd_entry		= madvise_free_pte_range,
-	.walk_lock		= PGWALK_RDLOCK,
-};
+static inline enum page_walk_lock get_walk_lock(enum madvise_lock_mode mode)
+{
+	switch (mode) {
+	case MADVISE_VMA_READ_LOCK:
+		return PGWALK_VMA_RDLOCK_VERIFY;
+	case MADVISE_MMAP_READ_LOCK:
+		return PGWALK_RDLOCK;
+	default:
+		/* Other modes don't require fixing up the walk_lock */
+		WARN_ON_ONCE(1);
+		return PGWALK_RDLOCK;
+	}
+}
 
 static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
 			struct vm_area_struct *vma,
@@ -789,6 +798,9 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
 	struct mm_struct *mm = vma->vm_mm;
 	struct mmu_notifier_range range;
 	struct mmu_gather *tlb = madv_behavior->tlb;
+	struct mm_walk_ops walk_ops = {
+		.pmd_entry		= madvise_free_pte_range,
+	};
 
 	/* MADV_FREE works for only anon vma at the moment */
 	if (!vma_is_anonymous(vma))
@@ -808,8 +820,9 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
 
 	mmu_notifier_invalidate_range_start(&range);
 	tlb_start_vma(tlb, vma);
+	walk_ops.walk_lock = get_walk_lock(madv_behavior->lock_mode);
 	walk_page_range_vma(vma, range.start, range.end,
-			&madvise_free_walk_ops, tlb);
+			&walk_ops, tlb);
 	tlb_end_vma(tlb, vma);
 	mmu_notifier_invalidate_range_end(&range);
 	return 0;
@@ -1655,7 +1668,6 @@ static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavi
 	case MADV_WILLNEED:
 	case MADV_COLD:
 	case MADV_PAGEOUT:
-	case MADV_FREE:
 	case MADV_POPULATE_READ:
 	case MADV_POPULATE_WRITE:
 	case MADV_COLLAPSE:
@@ -1664,6 +1676,7 @@ static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavi
 		return MADVISE_MMAP_READ_LOCK;
 	case MADV_DONTNEED:
 	case MADV_DONTNEED_LOCKED:
+	case MADV_FREE:
 		return MADVISE_VMA_READ_LOCK;
 	default:
 		return MADVISE_MMAP_WRITE_LOCK;
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index e478777c86e1..74f623159f7b 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -422,7 +422,7 @@ static inline void process_mm_walk_lock(struct mm_struct *mm,
 {
 	if (walk_lock == PGWALK_RDLOCK)
 		mmap_assert_locked(mm);
-	else
+	else if (walk_lock != PGWALK_VMA_RDLOCK_VERIFY)
 		mmap_assert_write_locked(mm);
 }
 
@@ -437,6 +437,9 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
 	case PGWALK_WRLOCK_VERIFY:
 		vma_assert_write_locked(vma);
 		break;
+	case PGWALK_VMA_RDLOCK_VERIFY:
+		vma_assert_locked(vma);
+		break;
 	case PGWALK_RDLOCK:
 		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
 		break;
-- 
2.39.3 (Apple Git-146)

