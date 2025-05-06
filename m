Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3B626B956
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527067; cv=none; b=K8BnNI+JDNuH82cq2q60N2ilSeiMb8zpQC0GL8jTU9CLqXSuoNlCCOlRSXEMNKuDleslEpxYcn99WwZButyI9czqCVNwRHtHy7GvqVrohffo00CmqdaGe0dwDWqB/iPBoHwWO+TMyDrsQC+8YwOdOQHiCZYZykxJcH/FOjblP7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527067; c=relaxed/simple;
	bh=dDdXzFYjbgqP4CK2I4LRvHZilWDZtx2zws9/9E2m+n4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T6cq/lXgHTeivuhv5KTpGiBwoVFfvDi9CGWNqTM9VUb+mISmmb+jVU0VgFL0kVH83AaHvkzjLXlHXfNO6arF8gHUHyXkNOfOCdSSJetfSD+ONfAk1tLNgPlXuys73Woxtfxd9VnGGbiLhe77FH95JSEKctQbY5KW/OF9k0D33y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=lWhqYa8n; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="lWhqYa8n"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746527054; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=6hlGv60zt643L8hENoGWYQs5XN30zIHiFR6c1sWi65I=;
	b=lWhqYa8ncKCalAHEcjIS6Ltr2rjL6ql33COYezqD4kPhKUPRohKLA2vSupCu50qWAWMVHtOc7sivw8sL6MGqDApZ0oB7jc7hlO2KWgw1gI7jPera72BzEt43YgqtmaT1pD+sGSDpI0aJI7T64/MM3avJr7dCQuJcmt/EoL1pIvY=
Received: from x31i01179.sqa.na131.tbsite.net(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WZSt-3o_1746526730 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 06 May 2025 18:18:56 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: linux-erofs@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>
Subject: [PATCH] erofs: ensure the extra temporary copy is valid for shortened bvecs
Date: Tue,  6 May 2025 18:18:50 +0800
Message-ID: <20250506101850.191506-1-hsiangkao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When compressed data deduplication is enabled, multiple logical extents
may reference the same compressed physical cluster.

The previous commit 94c43de73521 ("erofs: fix wrong primary bvec
selection on deduplicated extents") already avoids using shortened
bvecs.  However, in such cases, the extra temporary buffers also
need to be preserved for later use in z_erofs_fill_other_copies() to
to prevent data corruption.

IOWs, extra temporary buffers have to be retained not only due to
varying start relative offsets (`pageofs_out`, as indicated by
`pcl->multibases`) but also because of shortened bvecs.

android.hardware.graphics.composer@2.1.so : 270696 bytes
   0:        0..  204185 |  204185 :  628019200.. 628084736 |   65536
-> 1:   204185..  225536 |   21351 :  544063488.. 544129024 |   65536
   2:   225536..  270696 |   45160 :          0..         0 |       0

com.android.vndk.v28.apex : 93814897 bytes
...
   364: 53869896..54095257 |  225361 :  543997952.. 544063488 |   65536
-> 365: 54095257..54309344 |  214087 :  544063488.. 544129024 |   65536
   366: 54309344..54514557 |  205213 :  544129024.. 544194560 |   65536
...

Both 204185 and 54095257 have the same start relative offset of 3481,
but the logical page 55 of `android.hardware.graphics.composer@2.1.so`
ranges from 225280 to 229632, forming a shortened bvec [225280, 225536)
that cannot be used for decompressing the range from 54095257 to
54309344 of `com.android.vndk.v28.apex`.

Since `pcl->multibases` is already meaningless, just mark `keepxcpy`
on demand for simplicity.

Again, this issue can only lead to data corruption if `-Ededupe` is on.

Fixes: 94c43de73521 ("erofs: fix wrong primary bvec selection on deduplicated extents")
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/zdata.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 5c061aaeeb45..b8e6b76c23d5 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -79,9 +79,6 @@ struct z_erofs_pcluster {
 	/* L: whether partial decompression or not */
 	bool partial;
 
-	/* L: indicate several pageofs_outs or not */
-	bool multibases;
-
 	/* L: whether extra buffer allocations are best-effort */
 	bool besteffort;
 
@@ -1046,8 +1043,6 @@ static int z_erofs_scan_folio(struct z_erofs_frontend *f,
 				break;
 
 			erofs_onlinefolio_split(folio);
-			if (f->pcl->pageofs_out != (map->m_la & ~PAGE_MASK))
-				f->pcl->multibases = true;
 			if (f->pcl->length < offset + end - map->m_la) {
 				f->pcl->length = offset + end - map->m_la;
 				f->pcl->pageofs_out = map->m_la & ~PAGE_MASK;
@@ -1093,7 +1088,6 @@ struct z_erofs_backend {
 	struct page *onstack_pages[Z_EROFS_ONSTACK_PAGES];
 	struct super_block *sb;
 	struct z_erofs_pcluster *pcl;
-
 	/* pages with the longest decompressed length for deduplication */
 	struct page **decompressed_pages;
 	/* pages to keep the compressed data */
@@ -1102,6 +1096,8 @@ struct z_erofs_backend {
 	struct list_head decompressed_secondary_bvecs;
 	struct page **pagepool;
 	unsigned int onstack_used, nr_pages;
+	/* indicate if temporary copies should be preserved for later use */
+	bool keepxcpy;
 };
 
 struct z_erofs_bvec_item {
@@ -1112,18 +1108,20 @@ struct z_erofs_bvec_item {
 static void z_erofs_do_decompressed_bvec(struct z_erofs_backend *be,
 					 struct z_erofs_bvec *bvec)
 {
+	int poff = bvec->offset + be->pcl->pageofs_out;
 	struct z_erofs_bvec_item *item;
-	unsigned int pgnr;
-
-	if (!((bvec->offset + be->pcl->pageofs_out) & ~PAGE_MASK) &&
-	    (bvec->end == PAGE_SIZE ||
-	     bvec->offset + bvec->end == be->pcl->length)) {
-		pgnr = (bvec->offset + be->pcl->pageofs_out) >> PAGE_SHIFT;
-		DBG_BUGON(pgnr >= be->nr_pages);
-		if (!be->decompressed_pages[pgnr]) {
-			be->decompressed_pages[pgnr] = bvec->page;
+	struct page **page;
+
+	if (!(poff & ~PAGE_MASK) && (bvec->end == PAGE_SIZE ||
+			bvec->offset + bvec->end == be->pcl->length)) {
+		DBG_BUGON((poff >> PAGE_SHIFT) >= be->nr_pages);
+		page = be->decompressed_pages + (poff >> PAGE_SHIFT);
+		if (!*page) {
+			*page = bvec->page;
 			return;
 		}
+	} else {
+		be->keepxcpy = true;
 	}
 
 	/* (cold path) one pcluster is requested multiple times */
@@ -1289,7 +1287,7 @@ static int z_erofs_decompress_pcluster(struct z_erofs_backend *be, int err)
 					.alg = pcl->algorithmformat,
 					.inplace_io = overlapped,
 					.partial_decoding = pcl->partial,
-					.fillgaps = pcl->multibases,
+					.fillgaps = be->keepxcpy,
 					.gfp = pcl->besteffort ? GFP_KERNEL :
 						GFP_NOWAIT | __GFP_NORETRY
 				 }, be->pagepool);
@@ -1346,7 +1344,6 @@ static int z_erofs_decompress_pcluster(struct z_erofs_backend *be, int err)
 
 	pcl->length = 0;
 	pcl->partial = true;
-	pcl->multibases = false;
 	pcl->besteffort = false;
 	pcl->bvset.nextpage = NULL;
 	pcl->vcnt = 0;
-- 
2.43.5

