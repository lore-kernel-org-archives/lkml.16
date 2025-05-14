Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8A01F8676
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223853; cv=none; b=TqiWwOgnOS7N045n2LZEzzAXOJmiC66TUyvlPDv8+Svitw145lnrjTK3Ab9QBTwmk1tfEXJ0SO28QdWICn3fwo3wwIKtILxTY7jF7pPeHqdDUcPV9G6qZFJkkuHR6N0D4bsDCx5g+5cTq8cH1l9FOMWwv/pQjqNSPWKIl9N3S+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223853; c=relaxed/simple;
	bh=7o2UTN2Hk2J5TcPymHM0vTaw+1G2DDoWlH6zf9b+SbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ep+53mjfEMWodgr/dSsPXTogz/MoEwM4t+pA3r5aEGH2thtcLi3HhHv/ICBabLWh6c9M8Lc3P8L0EwD/HHtBhMeSfYIBM7Wymuei7MSHW6Hcwn1w/rb53o3oxvRnyZg/nnPuU437iM9Sh4nXF1fMrXlIo8lzeKQMnaKlOBHStN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=dj06PK2Y; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="dj06PK2Y"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747223840; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=X6Xt+gme88eWtaAzO7wjB1rqU85g/KZnskzOAk8sCIk=;
	b=dj06PK2Y7bIXqgY7FIWGT0u93ysUnZDrD/04/DptaMqj7nA+YIBVhYG5rJTxz1Iv3qMmx8BOVK0AxtaXCxazW80j6a6JTQeuZipT/o3kCwmKh+Y9KOalHLyzv5K4OSzVU3An86HEpBU6oYVnbM+nihIXVCa57tBZ0Retob0c4gY=
Received: from x31i01179.sqa.na131.tbsite.net(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Walx0ZR_1747223834 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 May 2025 19:57:19 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: linux-erofs@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>
Subject: [PATCH] erofs: refine readahead tracepoint
Date: Wed, 14 May 2025 19:57:13 +0800
Message-ID: <20250514115713.2719705-1-hsiangkao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 - trace_erofs_readpages => trace_erofs_readahead;

 - Rename a redundant statement `nrpages = readahead_count(rac);`;

 - Move the tracepoint to the beginning of z_erofs_readahead().

Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/zdata.c             | 5 ++---
 include/trace/events/erofs.h | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index b8e6b76c23d5..29541e0787b8 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1855,13 +1855,12 @@ static void z_erofs_readahead(struct readahead_control *rac)
 {
 	struct inode *const inode = rac->mapping->host;
 	Z_EROFS_DEFINE_FRONTEND(f, inode, readahead_pos(rac));
-	struct folio *head = NULL, *folio;
 	unsigned int nrpages = readahead_count(rac);
+	struct folio *head = NULL, *folio;
 	int err;
 
+	trace_erofs_readahead(inode, readahead_index(rac), nrpages, false);
 	z_erofs_pcluster_readmore(&f, rac, true);
-	nrpages = readahead_count(rac);
-	trace_erofs_readpages(inode, readahead_index(rac), nrpages, false);
 	while ((folio = readahead_folio(rac))) {
 		folio->private = head;
 		head = folio;
diff --git a/include/trace/events/erofs.h b/include/trace/events/erofs.h
index c69c7b1e41d1..644d4cbd3d80 100644
--- a/include/trace/events/erofs.h
+++ b/include/trace/events/erofs.h
@@ -113,7 +113,7 @@ TRACE_EVENT(erofs_read_folio,
 		__entry->raw)
 );
 
-TRACE_EVENT(erofs_readpages,
+TRACE_EVENT(erofs_readahead,
 
 	TP_PROTO(struct inode *inode, pgoff_t start, unsigned int nrpage,
 		bool raw),
@@ -138,7 +138,7 @@ TRACE_EVENT(erofs_readpages,
 
 	TP_printk("dev = (%d,%d), nid = %llu, start = %lu nrpage = %u raw = %d",
 		show_dev_nid(__entry),
-		(unsigned long)__entry->start,
+		(unsigned long)__entry->start,`
 		__entry->nrpage,
 		__entry->raw)
 );
-- 
2.43.5

