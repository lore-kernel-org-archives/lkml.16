Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76264F50F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749094483; cv=none; b=cU2NQRRwSsuOQnFpLlWjQtTSutixrcqIzhK+nT8z3uwBIx5CgYz+toYBN1jROf+lK4xWlqWlHhfuG8G0+kF0vQv6a/nfRUVAqplbzlgu3ytg/JaAwbJ/DZEHbhtfnYyV9RlRTp7c8EIZ2ItmBZTAW28NbMRXqiYN1ZimOiTVMP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749094483; c=relaxed/simple;
	bh=R6w5sj1lKu/GwSbX5lVh87DxEfzB2g4m0wZ4NqXxpeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=HKvpWmzsBQF0U0HmBTFx+3foIwScbLmlztT1fNpxSLCeUdkmvbg1fqzTfMlf9jNb10ia7aJz64iXs7qfRHU8jdowS4JGsA2GGL5l7trZf8NY0K3vM3xwpCjwgwmiHK5o8IkTJ1vwAMGTHycCfg14KJfa1TGPdAySkvinCJ585wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mt+ACr1G; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mt+ACr1G"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250605033432epoutp04cca239dc42bb4a86f8bb59c8ef9a2710~GCCfPAGdd0824608246epoutp04q
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:34:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250605033432epoutp04cca239dc42bb4a86f8bb59c8ef9a2710~GCCfPAGdd0824608246epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749094472;
	bh=g6o6qJ3bpotp0kNCLPXcpLOpBMROr4ERR72mZ9YdQXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mt+ACr1GsUUPlgD0psZld3Oq9L94O+sSGzHLEP1GD45PAJmkg6T9WZ+BpkLdTYlaV
	 bF14XckCTKXCajy77TIAR7Q42P0IeFJGJrCGE7o7Ai1EkfjI8WQ3haSVW6MW49kIHe
	 Yh4aEF12Yeqe8w6yf7mXTgrbYNE3rWFtRmZCuz5s=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250605033431epcas2p37c0ff62ab63566682186cb4a2b2d6ef7~GCCewSTFy1644316443epcas2p3w;
	Thu,  5 Jun 2025 03:34:31 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.69]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bCVS71YRMz2SSKY; Thu,  5 Jun
	2025 03:34:31 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250605033430epcas2p37db099e1ff4f2225c2059e08bbaa97c9~GCCdsRLEL1118511185epcas2p3p;
	Thu,  5 Jun 2025 03:34:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.95.142]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250605033430epsmtip10e9fd67e05088f8fecad5e423c1b6dc0~GCCdozjHz2503425034epsmtip18;
	Thu,  5 Jun 2025 03:34:30 +0000 (GMT)
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: 
Cc: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
	jaewon31.kim@gmail.com, david@redhat.com, Hyesoo Yu <hyesoo.yu@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mm: gup: clean up stale logic in
 migrate_longterm_unpinnable_folio()
Date: Thu,  5 Jun 2025 12:32:06 +0900
Message-ID: <20250605033210.3184521-2-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605033210.3184521-1-hyesoo.yu@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250605033430epcas2p37db099e1ff4f2225c2059e08bbaa97c9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250605033430epcas2p37db099e1ff4f2225c2059e08bbaa97c9
References: <20250605033210.3184521-1-hyesoo.yu@samsung.com>
	<CGME20250605033430epcas2p37db099e1ff4f2225c2059e08bbaa97c9@epcas2p3.samsung.com>

migrate_longterm_unpinnable_folio() always receives a non-empty
movable_folio_list. Thus, list_empty() check can be safely removed.

Also, pofs entries are fully unpinned before migration is attempted.
The err label contained unnecessary unpinning logic for pofs, which
is now removed.

No functional change intended.

Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
---
 mm/gup.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index e065a49842a8..68d91b000199 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2353,7 +2353,12 @@ static int
 migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
 				   struct pages_or_folios *pofs)
 {
-	int ret;
+	struct migration_target_control mtc = {
+		.gfp_mask = GFP_USER | __GFP_NOWARN,
+		.reason = MR_LONGTERM_PIN,
+		.nid = NUMA_NO_NODE,
+	};
+	int ret = -EAGAIN;
 	unsigned long i;
 
 	for (i = 0; i < pofs->nr_entries; i++) {
@@ -2370,6 +2375,7 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
 			gup_put_folio(folio, 1, FOLL_PIN);
 
 			if (migrate_device_coherent_folio(folio)) {
+				pofs_unpin(pofs);
 				ret = -EBUSY;
 				goto err;
 			}
@@ -2388,27 +2394,11 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
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
-- 
2.49.0

