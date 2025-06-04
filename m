Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7123817A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030770; cv=none; b=N7EHLG4m5wcIhaNAEut7rcxEid5qQ5n1zSzuwX4kKtYuJvLp7X3MRVKjSW/l73nhYJCyt48HzaVyvLGKlJ5W+PtDIJ644J2Pm3TT4OGVUmzIV5d7KckAzXrtlrmNNBz488SYy8TuKdEbHKodFRAmM68EBWx08c6qYsAFIA1EBys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030770; c=relaxed/simple;
	bh=5CUfTXSZL28fjRaCIudb0p1svpbj3kaP7AIJ7fQDE0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=tT8KtHStMKVffc7akt9lpQ2frwFtCWXfGnfeGvgAEDwWR2+BAygCSIX/1jgO4BJqauD74Vb6SaIlcTiB6UzLu4XtaDzWoqrtxeQf0wJ0HBHp7TkSxYvyNimc7gOF1JpEFAVbLu4Hlaxp1jA+SSNyo5L5dsOuL2PxgB3VEW+GzRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ImtRb+zp; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ImtRb+zp"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250604095244epoutp018816ec6e455f3d76e74242448d46247d~FzjauxIS51454014540epoutp01V
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:52:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250604095244epoutp018816ec6e455f3d76e74242448d46247d~FzjauxIS51454014540epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749030764;
	bh=U1e46riN5AgpP+BOTQu5flAeRIz4W1sPhNu7S+rH/Xc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ImtRb+zpcTMnsRvuuzyfk526/bW3kQ2JGKPv1K68ZjiQfP9ijKsgYMyhYY/xP+Zja
	 p+vfBn2xmL1OcA/NxgRmDLlBcBYHlLmf5bgrj9JHsdM3MSYQdwNEAq4YMu1XcnqPtR
	 MPlodIS0MMYSqMTVXEOIUi5BKmQztnWCV8CHVSEg=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250604095244epcas2p2f47d4a9682f3931646c1fc0d7b5af49f~FzjaQ3bMI0398503985epcas2p2P;
	Wed,  4 Jun 2025 09:52:44 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.97]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bC2tz2pn2z3hhTC; Wed,  4 Jun
	2025 09:52:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250604095242epcas2p17032a1133b03be2d24c8ebcff94d1d55~FzjZMA2Cy0178901789epcas2p1N;
	Wed,  4 Jun 2025 09:52:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.95.142]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250604095242epsmtip255f2c31e21b6ff74081e2097b3e4fd75~FzjZGKufv3057430574epsmtip2z;
	Wed,  4 Jun 2025 09:52:42 +0000 (GMT)
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: 
Cc: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
	jaewon31.kim@gmail.com, david@redhat.com, Hyesoo Yu <hyesoo.yu@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mm: gup: fail migration when no migratable page to prevent
 CMA pinning
Date: Wed,  4 Jun 2025 18:50:46 +0900
Message-ID: <20250604095049.4052078-1-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250604095242epcas2p17032a1133b03be2d24c8ebcff94d1d55
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250604095242epcas2p17032a1133b03be2d24c8ebcff94d1d55
References: <CGME20250604095242epcas2p17032a1133b03be2d24c8ebcff94d1d55@epcas2p1.samsung.com>

Commit 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
caused CMA pages to become pinned in some cases when handling longterm GUP.
This happened because migration would return success immediately if no pages
were in the movable_page_list, without retrying.

However, CMA pages can be temporarily off the LRU (e.g., in pagevecs), and
therefore not appear in movable_page_list, even though they can be migrated
later. Before commit 1aaf8c, the kernel would retry migration in such cases,
which helped avoid accidental CMA pinning.

The commit 1aaf8c aimed to support an out-of-tree use case (like pKVM), where
longterm GUP was applied to non-LRU CMA pages. But allowing CMA pinning
in general for this corner case could lead to more fragmentation and
reliability issues. So this patch prevents that.

Instead of retrying, this patch explicitly fails the migration attempt
(-EBUSY) if no movable pages are found and unpinnable pages remain.
This avoids infinite loops and gives user a clear signal to retry,
rather then spinning inside kernel.

Fixes: 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
---
 mm/gup.c | 49 ++++++++++++++++++++++++++-----------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index e065a49842a8..446938aedcc9 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2303,12 +2303,13 @@ static void pofs_unpin(struct pages_or_folios *pofs)
 /*
  * Returns the number of collected folios. Return value is always >= 0.
  */
-static void collect_longterm_unpinnable_folios(
+static bool collect_longterm_unpinnable_folios(
 		struct list_head *movable_folio_list,
 		struct pages_or_folios *pofs)
 {
 	struct folio *prev_folio = NULL;
 	bool drain_allow = true;
+	bool any_unpinnable = false;
 	unsigned long i;
 
 	for (i = 0; i < pofs->nr_entries; i++) {
@@ -2321,6 +2322,8 @@ static void collect_longterm_unpinnable_folios(
 		if (folio_is_longterm_pinnable(folio))
 			continue;
 
+		any_unpinnable = true;
+
 		if (folio_is_device_coherent(folio))
 			continue;
 
@@ -2342,6 +2345,8 @@ static void collect_longterm_unpinnable_folios(
 				    NR_ISOLATED_ANON + folio_is_file_lru(folio),
 				    folio_nr_pages(folio));
 	}
+
+	return any_unpinnable;
 }
 
 /*
@@ -2353,8 +2358,13 @@ static int
 migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
 				   struct pages_or_folios *pofs)
 {
-	int ret;
+	int ret = -EAGAIN;
 	unsigned long i;
+	struct migration_target_control mtc = {
+		.nid = NUMA_NO_NODE,
+		.gfp_mask = GFP_USER | __GFP_NOWARN,
+		.reason = MR_LONGTERM_PIN,
+	};
 
 	for (i = 0; i < pofs->nr_entries; i++) {
 		struct folio *folio = pofs_get_folio(pofs, i);
@@ -2370,6 +2380,7 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
 			gup_put_folio(folio, 1, FOLL_PIN);
 
 			if (migrate_device_coherent_folio(folio)) {
+				pofs_unpin(pofs);
 				ret = -EBUSY;
 				goto err;
 			}
@@ -2388,27 +2399,11 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
 		pofs_clear_entry(pofs, i);
 	}
 
-	if (!list_empty(movable_folio_list)) {
-		struct migration_target_control mtc = {
-			.nid = NUMA_NO_NODE,
-			.gfp_mask = GFP_USER | __GFP_NOWARN,
-			.reason = MR_LONGTERM_PIN,
-		};
-
-		if (migrate_pages(movable_folio_list, alloc_migration_target,
-				  NULL, (unsigned long)&mtc, MIGRATE_SYNC,
-				  MR_LONGTERM_PIN, NULL)) {
-			ret = -ENOMEM;
-			goto err;
-		}
-	}
-
-	putback_movable_pages(movable_folio_list);
-
-	return -EAGAIN;
+	if (migrate_pages(movable_folio_list, alloc_migration_target, NULL,
+			  (unsigned long)&mtc, MIGRATE_SYNC, MR_LONGTERM_PIN, NULL))
+		ret = -ENOMEM;
 
 err:
-	pofs_unpin(pofs);
 	putback_movable_pages(movable_folio_list);
 
 	return ret;
@@ -2417,11 +2412,19 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
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
+		if (any_unpinnable) {
+			pofs_unpin(pofs);
+			return -EBUSY;
+		}
 		return 0;
+	}
 
 	return migrate_longterm_unpinnable_folios(&movable_folio_list, pofs);
 }
-- 
2.49.0

