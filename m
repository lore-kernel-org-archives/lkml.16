Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24E0220F3F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 20:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749499254; cv=none; b=F3C4b54tV4f0dt46k+9m2yGa+H126DW8cEbBh0fJ+ZYuzkanx79slqDQtwa2+MS1cXuG5uo38oqy2tbwun+srpmFd/pZ+y2kYpTzBqXT3InlfBCiQgwZUPCtw9PyjuX1bTiyNM0y40vtzN+TBp9c7gMVOR2JXvu38UmDTBM3i/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749499254; c=relaxed/simple;
	bh=L6hbnI31264eoN57CA+wuQ9nzeSgAHueWnj1w5Hosxw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RNKBfHeYAkNUEaIJ/RxCLGkRNLRHL+yGaooVP0jZ0qRKfAICcE2O06OPiWF1cL+jGZT4X2OC3EoNx0N8o5aMT4hcXbduQg1v9cqDsf2XnkVMz4cGuGsYSQY2iXngDCvoO2VH3BT9IvQ5incw+jBjwdCxl6wCRA/MTA9otSt1unU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVpBFWRg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVpBFWRg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4790CC4CEF0;
	Mon,  9 Jun 2025 20:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749499254;
	bh=L6hbnI31264eoN57CA+wuQ9nzeSgAHueWnj1w5Hosxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UVpBFWRgJj3ZYaTUXGGUODCbgXZHtDyo4JRY07CXgW7sJCiiqORGaAiL13Juv/HE1
	 ptbNcx5kDhFgNwloqTfG2gs7Klr701oqQd6UGYQgv450uBsriOZ3EsXDAkakbYYVUD
	 3QZymycC/375xe698z0NBWts7twIcZ1iDeViP4pidCcz00go8m6dT+VvEvl9SO/uhx
	 ngs9+M+OLH+4FL3tWLyThmsXjGPQbnUmxoRT9+ZF3ruVaNXQzWwUEs4jIj6eTkdZfz
	 zTyR6JxQy7zz/+QiR9dFhPTUK2zZ1ICtM3I6PCzrdxya/dXE8X3HorUba1jQ7v63DK
	 rcLIPnKP1XtAg==
From: SeongJae Park <sj@kernel.org>
To: 
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Wang <wangchuanguo@inspur.com>,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 2/3] Revert "mm: rename alloc_demote_folio to alloc_migrate_folio"
Date: Mon,  9 Jun 2025 13:00:47 -0700
Message-Id: <20250609200048.50914-3-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609200048.50914-1-sj@kernel.org>
References: <20250609200048.50914-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 8f75267d22bdf8e3baf70f2fa7092d8c2f58da71.

Commit 8f75267d22bd ("mm: rename alloc_demote_folio to
alloc_migrate_folio") was to reflect the fact the function is called for
not only demotion, but also general migrations from
DAMOS_MIGRATE_{HOT,COLD}.  The previous commit made the DAMOS actions to
not use alloc_migrate_folio(), though.  So, demote_folio_list() is the
only caller of alloc_migrate_folio(), and the name could now be rather
confusing.  Revert the renaming commit.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/internal.h | 2 +-
 mm/vmscan.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 71eaea2db9b0..b76b5162314a 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1227,7 +1227,7 @@ extern unsigned long  __must_check vm_mmap_pgoff(struct file *, unsigned long,
         unsigned long, unsigned long);
 
 extern void set_pageblock_order(void);
-struct folio *alloc_migrate_folio(struct folio *src, unsigned long private);
+struct folio *alloc_demote_folio(struct folio *src, unsigned long private);
 unsigned long reclaim_pages(struct list_head *folio_list);
 unsigned int reclaim_clean_pages_from_list(struct zone *zone,
 					    struct list_head *folio_list);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index a93a1ba9009e..6bebc91cbf2f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1006,7 +1006,7 @@ static void folio_check_dirty_writeback(struct folio *folio,
 		mapping->a_ops->is_dirty_writeback(folio, dirty, writeback);
 }
 
-struct folio *alloc_migrate_folio(struct folio *src, unsigned long private)
+struct folio *alloc_demote_folio(struct folio *src, unsigned long private)
 {
 	struct folio *dst;
 	nodemask_t *allowed_mask;
@@ -1069,7 +1069,7 @@ static unsigned int demote_folio_list(struct list_head *demote_folios,
 	node_get_allowed_targets(pgdat, &allowed_mask);
 
 	/* Demotion ignores all cpuset and mempolicy settings */
-	migrate_pages(demote_folios, alloc_migrate_folio, NULL,
+	migrate_pages(demote_folios, alloc_demote_folio, NULL,
 		      (unsigned long)&mtc, MIGRATE_ASYNC, MR_DEMOTION,
 		      &nr_succeeded);
 
-- 
2.39.5
