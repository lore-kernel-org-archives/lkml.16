Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7DA221281
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 20:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749499256; cv=none; b=LdO/5d5OtIY74evqy9XZlOQ+y6VuUjHwCH/z2myhjbdbG16zWqtJJSzrkH6en/+oQvTRtmR9uSL44lbBl+JV3v/BM84yzt2Oy5DU0mp4Mo0RkmOERuWujIiuLEPpEJ5Js0ixt0B09XlE4S8wPy/96Hh68bWpTkRcFPOd9IAg5tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749499256; c=relaxed/simple;
	bh=kXfXXQuZy3Q2a6PJsLDR0HH0HOWqYg4BhOnbE4nBfzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YEqRiIcH9kwLqT2rxqs3+uov4AEr+qC6+GkDIcGYik8CXS42xXG27aCGwU21UqSCH6TmCgAi5YaU1OAIep182s6Q1newRVa3UfU8vgIaf/cr5pMVGtb5PJ1RvGOxgLmkGarntJsF4pI0AENWtGw6AbVToxJKLq1M5ddi5WLMZwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dC/6i3Qd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dC/6i3Qd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575DBC4CEEF;
	Mon,  9 Jun 2025 20:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749499255;
	bh=kXfXXQuZy3Q2a6PJsLDR0HH0HOWqYg4BhOnbE4nBfzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dC/6i3QdlnobUADLR23jkzeDlz9A6Soy9CnntKUIo92Wq1Q+zZoR+o+JXyK48Zxdv
	 Eh4WCJ56JfeHljelt19WAAJhIIyMKqSQaGys0GoGNhph2XufAuahIbzfmZMcmJxV04
	 4AZ06fGy/bDA73HNAbEm1gIEcIM0v45/uHQq4koCt0vea6c1EZPYnnImPwAX8FumLC
	 4jmlZ2RTPbyHHk51PIlkX6mfn0RQOB3NzQa1n+3+1XxGgS5ENUy6HFj0aP+msKK8Lg
	 8xmpnn1mDFxQMBwrK9Iq6XYT0fRMHeqoBjEE8myYXf1IKjtk4c5FwtrU0mRJ3wvuK9
	 o4fonEAjGs+UQ==
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
Subject: [RFC PATCH 3/3] Revert "mm: make alloc_demote_folio externally invokable for migration"
Date: Mon,  9 Jun 2025 13:00:48 -0700
Message-Id: <20250609200048.50914-4-sj@kernel.org>
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

This reverts commit a00ce85af2a1be494d3b0c9457e8e81cdcce2a89.

Commit a00ce85af2a1 ("mm: make alloc_demote_folio externally invokable
for migration") was made to let DAMOS_MIGRATE_{HOT,COLD} call the
function.  But a previous commit made DAMOS_MIGRATE_{HOT,COLD} call
alloc_migration_target() instead.  Hence there are no more callers of
the function outside of vmscan.c.  Revert the commit to make the
function static again.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/internal.h | 1 -
 mm/vmscan.c   | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index b76b5162314a..12470ee5f05b 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1227,7 +1227,6 @@ extern unsigned long  __must_check vm_mmap_pgoff(struct file *, unsigned long,
         unsigned long, unsigned long);
 
 extern void set_pageblock_order(void);
-struct folio *alloc_demote_folio(struct folio *src, unsigned long private);
 unsigned long reclaim_pages(struct list_head *folio_list);
 unsigned int reclaim_clean_pages_from_list(struct zone *zone,
 					    struct list_head *folio_list);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6bebc91cbf2f..620dce753b64 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1006,7 +1006,8 @@ static void folio_check_dirty_writeback(struct folio *folio,
 		mapping->a_ops->is_dirty_writeback(folio, dirty, writeback);
 }
 
-struct folio *alloc_demote_folio(struct folio *src, unsigned long private)
+static struct folio *alloc_demote_folio(struct folio *src,
+		unsigned long private)
 {
 	struct folio *dst;
 	nodemask_t *allowed_mask;
-- 
2.39.5
