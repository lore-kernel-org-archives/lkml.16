Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B20A2F5B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749110794; cv=none; b=uqU4BCBBGsfRollrThlBMzpufd3xEPz/cL9HMMbOK6FDfDyJmeV6MXGhqcyLV+KRPJJMe3ogjTXajBXkMxxHDXv+rFU4M6KMkE8z3GxbBHRn8Q3odScl/x9IT6JqUu6kuFbgraFydyumj5ObnaROJ7UjzrAVjgwjAw/Lbtq/D0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749110794; c=relaxed/simple;
	bh=8GzO08tndfv721t4McGGmGHqUx0Jo7bW0KEhTttNya0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=fp5cMEkDmfT777rus9m62O1P9wBHy4XehBk1arPnaDfeal3EupkXZg1upfn7ws4GZ9RTo91rj0iIg34torkgUosdxdZZyrcPCTv56xebIYarsKYlWVkxLDo/6bI9BUCOj/Yvefq4GNnFf86iz4aVAG5EiYuCBTjmnDw0iiAkH7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Amssj6qE; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Amssj6qE"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250605080630epoutp029a6ef996bc582742fa7dc821c4f25b3f~GFv8eyRte1890318903epoutp02a
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:06:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250605080630epoutp029a6ef996bc582742fa7dc821c4f25b3f~GFv8eyRte1890318903epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749110790;
	bh=5Fq5ho7EvwKI7nuqfXI3pZhlK+7Slkc0YlG396IIzDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Amssj6qEVeJAgxY57Lqyg7KrglOI3H9QEFSkcloS+KWsN1TSdIy+kEgpd22bMaPA6
	 uhJkIKGxXKsuBfyTdEhptXfXyqh/ZsBksDXYDo8FB6nA3ub2KfGC9o6wCxGDXO12FK
	 Ln8g567pgWnDRnYreNh8yoxc/MnB8ZXBOIFKsJu8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250605080629epcas2p2969bcac1c5d4bc57de58347b35d0e89d~GFv795vGH1407914079epcas2p2F;
	Thu,  5 Jun 2025 08:06:29 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bCcTx1FvWz2SSKp; Thu,  5 Jun
	2025 08:06:29 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250605080628epcas2p24220eeceef2ae38feeee9d2c18515800~GFv65NGmN1351013510epcas2p2L;
	Thu,  5 Jun 2025 08:06:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.95.142]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250605080628epsmtip120becc5e0bf4cd5fdf0f5fd129ce21f0~GFv615FQg0467304673epsmtip1-;
	Thu,  5 Jun 2025 08:06:28 +0000 (GMT)
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: 
Cc: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
	jaewon31.kim@gmail.com, david@redhat.com, Hyesoo Yu <hyesoo.yu@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] mm: gup: avoid CMA page pinning by retrying
 migration if no migratable page
Date: Thu,  5 Jun 2025 17:04:31 +0900
Message-ID: <20250605080436.3764686-2-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605080436.3764686-1-hyesoo.yu@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250605080628epcas2p24220eeceef2ae38feeee9d2c18515800
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250605080628epcas2p24220eeceef2ae38feeee9d2c18515800
References: <20250605080436.3764686-1-hyesoo.yu@samsung.com>
	<CGME20250605080628epcas2p24220eeceef2ae38feeee9d2c18515800@epcas2p2.samsung.com>

Commit 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
introduced an issue where CMA pages could be pinned by longterm GUP requests.
This occurs when unpinnable pages are detected but the movable_page_list is empty;
the commit would return success without retrying, allowing unpinnable
pages (such as CMA) to become pinned.

CMA pages may be temporarily off the LRU due to concurrent isolation,
for example when multiple longterm GUP requests are racing and therefore
not appear in movable_page_list. Before commit 1aaf8c, the kernel would
retry migration in such cases, which helped avoid accidental CMA pinning.

The original intent of the commit was to support longterm GUP on non-LRU
CMA pages in out-of-tree use cases such as pKVM. However, allowing this
can lead to broader CMA pinning issues.

To avoid this, the logic is restored to return -EAGAIN instead of success
when no folios could be collected but unpinnable pages were found.
This ensures that migration is retried until success, and avoids
inadvertently pinning unpinnable pages.

Fixes: 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>

---
We have confirmed that this regression causes CMA pages to be pinned
in our kernel 6.12-based environment.

In addition to CMA allocation failures, we also observed longterm GUP failures
when repeatedly accessing the same VMA. Specifically, the first longterm GUP
call would pin a CMA page, and a second call on the same region
would fail the migration because the cma page was already pinned.

After reverting commit 1aaf8c122918, the issue no longer reproduced.

Therefore, this fix is important to ensure reliable behavior of longterm GUP
and CMA-backed memory, and should be backported to stable.
---
 mm/gup.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index e065a49842a8..66193421c1d4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2300,14 +2300,12 @@ static void pofs_unpin(struct pages_or_folios *pofs)
 		unpin_user_pages(pofs->pages, pofs->nr_entries);
 }
 
-/*
- * Returns the number of collected folios. Return value is always >= 0.
- */
-static void collect_longterm_unpinnable_folios(
+static bool collect_longterm_unpinnable_folios(
 		struct list_head *movable_folio_list,
 		struct pages_or_folios *pofs)
 {
 	struct folio *prev_folio = NULL;
+	bool any_unpinnable = false;
 	bool drain_allow = true;
 	unsigned long i;
 
@@ -2321,6 +2319,8 @@ static void collect_longterm_unpinnable_folios(
 		if (folio_is_longterm_pinnable(folio))
 			continue;
 
+		any_unpinnable = true;
+
 		if (folio_is_device_coherent(folio))
 			continue;
 
@@ -2342,6 +2342,8 @@ static void collect_longterm_unpinnable_folios(
 				    NR_ISOLATED_ANON + folio_is_file_lru(folio),
 				    folio_nr_pages(folio));
 	}
+
+	return any_unpinnable;
 }
 
 /*
@@ -2417,11 +2419,25 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
 static long
 check_and_migrate_movable_pages_or_folios(struct pages_or_folios *pofs)
 {
+	bool any_unpinnable;
+
 	LIST_HEAD(movable_folio_list);
 
-	collect_longterm_unpinnable_folios(&movable_folio_list, pofs);
-	if (list_empty(&movable_folio_list))
+	any_unpinnable = collect_longterm_unpinnable_folios(&movable_folio_list, pofs);
+
+	if (list_empty(&movable_folio_list)) {
+		/*
+		 * If we find any longterm unpinnable page that we failed to
+		 * isolated for migration, it might be because someone else
+		 * concurrently isolated it. Make the caller retry until it
+		 * succeeds.
+		 */
+		if (any_unpinnable) {
+			pofs_unpin(pofs);
+			return -EAGAIN;
+		}
 		return 0;
+	}
 
 	return migrate_longterm_unpinnable_folios(&movable_folio_list, pofs);
 }
-- 
2.49.0

