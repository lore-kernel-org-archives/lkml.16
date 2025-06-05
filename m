Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75530442C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749094484; cv=none; b=iKUm0Jao2OKDHrqhU4a1E0qq/cQ7+xhcOJDtopvvJen6Bf0sNzypixMtgUSVn8GoBN1X5+kDzlbeCuyj5JiyYNf1QMWpmxXPw2p/hrKmXe19Y+Q3dcwJ7ntbvGmvv2sA0oRseRYEb1WGWIPL28837V2vXrOeBhgq6g8KCfwhpJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749094484; c=relaxed/simple;
	bh=XKbBjgv1nA4UEPj3gGSGrM4V+S6Sm1iCRCdlo6IWiqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=r5roSp81xFF4UrxACFbbXHk5MYNr6rS4KWNrl+YsToVTXC5SYiIXfBqm4cly9bxN4mukU/BkZlCyqEmTHcr6LxZyx37BKTCY4DzTB6UaSzSDAusjnrFaqUb4131GKodum4BVl8oRj5YJ0kJqDU3Dh4Suxw0wGwdMqnLz8tk8tFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OP97vsE5; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OP97vsE5"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250605033433epoutp014fa7d0df91bba09a2ab0b153dccf66c3~GCCgYy2KT2228122281epoutp010
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:34:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250605033433epoutp014fa7d0df91bba09a2ab0b153dccf66c3~GCCgYy2KT2228122281epoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749094473;
	bh=Vc8zTvJQzMXjROytgiQ4wLokBHguz3GHnutGwCHuygk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OP97vsE5LsLamLP9C97rWIKRGVLslDZzJ1I7X6JOMZ59Jqg6IMFCaY8NA+Eynri/O
	 S7LXFxS/PbzOuBO46na7q8UvUDKrpqQiDxoIoVMx8Ptw5uyXt472Pq3ki+NSiSQ6bZ
	 5GYbiZgv1nBMWn01A6WcyQmV0vO+jXG6OkrQ7CEQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250605033433epcas2p10450c216ecac4bae502143e408f9e61b~GCCf5XQ6C1696116961epcas2p1b;
	Thu,  5 Jun 2025 03:34:33 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.101]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bCVS853Y9z6B9m5; Thu,  5 Jun
	2025 03:34:32 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250605033432epcas2p4c024a9d05246b18c217f3562b3f53551~GCCfHZFVE3146031460epcas2p4j;
	Thu,  5 Jun 2025 03:34:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.95.142]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250605033432epsmtip19ff455cb5c97d9e76a5b57caec500d79~GCCfBhtQC2776827768epsmtip1k;
	Thu,  5 Jun 2025 03:34:32 +0000 (GMT)
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: 
Cc: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
	jaewon31.kim@gmail.com, david@redhat.com, Hyesoo Yu <hyesoo.yu@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mm: gup: avoid CMA page pinning by retrying
 migration if no migratable page
Date: Thu,  5 Jun 2025 12:32:07 +0900
Message-ID: <20250605033210.3184521-3-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605033210.3184521-1-hyesoo.yu@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250605033432epcas2p4c024a9d05246b18c217f3562b3f53551
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250605033432epcas2p4c024a9d05246b18c217f3562b3f53551
References: <20250605033210.3184521-1-hyesoo.yu@samsung.com>
	<CGME20250605033432epcas2p4c024a9d05246b18c217f3562b3f53551@epcas2p4.samsung.com>

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
Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
---
 mm/gup.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 68d91b000199..a25c8c894882 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2300,15 +2300,13 @@ static void pofs_unpin(struct pages_or_folios *pofs)
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
 	bool drain_allow = true;
+	bool any_unpinnable = false;
 	unsigned long i;
 
 	for (i = 0; i < pofs->nr_entries; i++) {
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
@@ -2407,11 +2409,25 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
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

