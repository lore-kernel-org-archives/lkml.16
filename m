Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [118.143.206.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175631F3B8A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.143.206.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834181; cv=none; b=uhpce6/4woBvju8caAWni+fh+cqQVdjD690ow2ziRCjjriSa+AwRN3neSxcAJVYOWTdpzIiq7wQHq8+S2kNqrmVTkyq4moSRAmeoutSCatRevprNBx+4sbRmToJ/wfD3iTaddQpYCaB4XfJx/ylM4Pry6n4kGm7ZxZwJT2Svlzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834181; c=relaxed/simple;
	bh=g84O1o5hFU3l3xduZF6PY/IbjbIYklm6i3ld7YRDi8g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QOntm+Gy/t4zTPSGCY5SYo8KI/15zVJkf8TtWZ1x7cBZ5MNLdL06/NUY0Y0njzJjTc4kqpL+XXh+lRjbqtpUcAzSAYjGwn91YCBkk+SKsivwumjInIZJFljmVUJs7Xio8Bp/ioyxgm9IpHKzClkzc1knBrckUZCikSsCSTb0jR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=118.143.206.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: vX/1TlSMQvSPkzc97lpYvg==
X-CSE-MsgGUID: hWu1/TpcR9mXYFu/+Y9UMA==
X-IronPort-AV: E=Sophos;i="6.16,264,1744041600"; 
   d="scan'208";a="118524165"
From: Jianan Huang <huangjianan@xiaomi.com>
To: <linux-f2fs-devel@lists.sourceforge.net>, <chao@kernel.org>,
	<jaegeuk@kernel.org>
CC: <wanghui33@xiaomi.com>, <linux-kernel@vger.kernel.org>, Jianan Huang
	<huangjianan@xiaomi.com>, Sheng Yong <shengyong1@xiaomi.com>
Subject: [PATCH v3] f2fs: avoid splitting bio when reading multiple pages
Date: Wed, 25 Jun 2025 14:49:27 +0800
Message-ID: <20250625064927.516586-1-huangjianan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJ-MBX04.mioffice.cn (10.237.8.124) To YZ-MBX05.mioffice.cn
 (10.237.88.125)

When fewer pages are read, nr_pages may be smaller than nr_cpages. Due
to the nr_vecs limit, the compressed pages will be split into multiple
bios and then merged at the block level. In this case, nr_cpages should
be used to pre-allocate bvecs.
To handle this case, align max_nr_pages to cluster_size, which should be
enough for all compressed pages.

Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
Changes since v2:
- Initialize index only for compressed files.
Changes since v1:
- Use aligned nr_pages instead of nr_cpages to pre-allocate bvecs.

 fs/f2fs/data.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 31e892842625..d071d9f6a811 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2303,7 +2303,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		}
 
 		if (!bio) {
-			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
+			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages - i,
 					f2fs_ra_op_flags(rac),
 					folio->index, for_write);
 			if (IS_ERR(bio)) {
@@ -2376,6 +2376,14 @@ static int f2fs_mpage_readpages(struct inode *inode,
 	unsigned max_nr_pages = nr_pages;
 	int ret = 0;
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (f2fs_compressed_file(inode)) {
+		index = rac ? readahead_index(rac) : folio->index;
+		max_nr_pages = round_up(index + nr_pages, cc.cluster_size) -
+				round_down(index, cc.cluster_size);
+	}
+#endif
+
 	map.m_pblk = 0;
 	map.m_lblk = 0;
 	map.m_len = 0;
@@ -2385,7 +2393,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 	map.m_seg_type = NO_CHECK_TYPE;
 	map.m_may_create = false;
 
-	for (; nr_pages; nr_pages--) {
+	for (; nr_pages; nr_pages--, max_nr_pages--) {
 		if (rac) {
 			folio = readahead_folio(rac);
 			prefetchw(&folio->flags);
-- 
2.43.0

