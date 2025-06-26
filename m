Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3701B85FD
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928434; cv=none; b=Tfm6UjhQSF4qFixxsrNB/JVt0YxmZZiKG6ZONUK1tSt/6r/oltyQ3vcg6yTOJXbl9gZXDQCyEEBKPLGU5fSalHmQyjAokeDaZ8sgHAeT8tGNJVSUuNzNOMIFJ4jYoIobNh+F9jTvb7PDlcHHcH0VT5I6crn1lPYs6rvuRrAWR7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928434; c=relaxed/simple;
	bh=X80pBlcgAaHgql6dEaf1a0a5dI7sZMhhCboDE95iysc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dVWlNz+95rPDlgg6INCDKxKCL7Uhc0fgpqugE/DmCZIpSN5fblgdTC95dqxu1KXiRul/rjWsZy5B+9B9KYNf1PjJA/54AQqRpMDme1zzCYMEKMPo+xinWAvnGcbF9bTOxOPKrdaLgw1jVAuLtPprmqOWo4T9/wa4M1JX9Ky+5FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=t4xrwAPD; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="t4xrwAPD"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750928423; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=rqPrmNEJ3dusfEAN0LnjIzSUm4cuAkh0p1L4y60E3qk=;
	b=t4xrwAPDPNPCqDH1qFkTXvxwR2eexQdEzOvUx56jIXDX2qhyCY7DaTgZvMigqOGvNSbMiLDMXfxDQYWCAU5ziKBgssuW4E7QJrKKUGbpki1lXtWFTA1m3tWvykptJ4ckJS3/D/pKy1r7goh7tSe0BGEQjnckpHrz0qgeUP7bdHg=
Received: from x31i01179.sqa.na131.tbsite.net(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Wf9zk5V_1750928100 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Jun 2025 16:55:05 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: linux-erofs@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>
Subject: [PATCH] erofs: get rid of {get,put}_page() for ztailpacking data
Date: Thu, 26 Jun 2025 16:54:59 +0800
Message-ID: <20250626085459.339830-1-hsiangkao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compressed data for the ztailpacking feature is fetched from
the metadata inode (e.g., bd_inode), which is folio-based.

Therefore, the folio interface should be used instead.

Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/zdata.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index fe8071844724..d80e3bf4fa79 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -805,6 +805,7 @@ static int z_erofs_pcluster_begin(struct z_erofs_frontend *fe)
 	struct erofs_map_blocks *map = &fe->map;
 	struct super_block *sb = fe->inode->i_sb;
 	struct z_erofs_pcluster *pcl = NULL;
+	void *ptr;
 	int ret;
 
 	DBG_BUGON(fe->pcl);
@@ -854,15 +855,13 @@ static int z_erofs_pcluster_begin(struct z_erofs_frontend *fe)
 		/* bind cache first when cached decompression is preferred */
 		z_erofs_bind_cache(fe);
 	} else {
-		void *mptr;
-
-		mptr = erofs_read_metabuf(&map->buf, sb, map->m_pa, false);
-		if (IS_ERR(mptr)) {
-			ret = PTR_ERR(mptr);
+		ptr = erofs_read_metabuf(&map->buf, sb, map->m_pa, false);
+		if (IS_ERR(ptr)) {
+			ret = PTR_ERR(ptr);
 			erofs_err(sb, "failed to get inline data %d", ret);
 			return ret;
 		}
-		get_page(map->buf.page);
+		folio_get(page_folio(map->buf.page));
 		WRITE_ONCE(fe->pcl->compressed_bvecs[0].page, map->buf.page);
 		fe->pcl->pageofs_in = map->m_pa & ~PAGE_MASK;
 		fe->mode = Z_EROFS_PCLUSTER_FOLLOWED_NOINPLACE;
@@ -1325,9 +1324,8 @@ static int z_erofs_decompress_pcluster(struct z_erofs_backend *be, int err)
 
 	/* must handle all compressed pages before actual file pages */
 	if (pcl->from_meta) {
-		page = pcl->compressed_bvecs[0].page;
+		folio_put(page_folio(pcl->compressed_bvecs[0].page));
 		WRITE_ONCE(pcl->compressed_bvecs[0].page, NULL);
-		put_page(page);
 	} else {
 		/* managed folios are still left in compressed_bvecs[] */
 		for (i = 0; i < pclusterpages; ++i) {
-- 
2.43.5

