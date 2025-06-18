Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [207.226.244.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09543275845
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.226.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234638; cv=none; b=YizQ9on/7G3kBbvrbb0BkS64ILJkDQ54uNgC99BDFy9kLCInUGgcsv/+mcpznzC9wK135nF+IGaKFhiXVcFtVC6mAq+9P3xLfpjEQ3jr46asmZInpaCNqASYPegBwnQlXxMJ2NOkVqjhn0z1q6fLRTmfIzBVYBZ35rJ8UJ67x1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234638; c=relaxed/simple;
	bh=EBnCU2zN1GbWQLHQD+wTE1l4uOCXyOUFHwg6wJDuMlo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hO5DDzqdLS3qwNst4/AFNSFlYLEBUX2HZM4/veCEqd0oRUIEH29Q1hx2I3RrfnbbTaAG0khG83qtaic7GBNwJnCqD0fxTxVeEQURK2hwrCam/afYwfA+EDEcM70DR1OQ4xdk+1cB/l3B6IYB4sKroH8VRbz6dFMY+bH1Kle4g6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=207.226.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: 4R/02tS0QtCl8GseCaL78w==
X-CSE-MsgGUID: 5UFOyZgdShC6js6sQsxUPA==
X-IronPort-AV: E=Sophos;i="6.16,245,1744041600"; 
   d="scan'208";a="143507967"
From: Jianan Huang <huangjianan@xiaomi.com>
To: <linux-f2fs-devel@lists.sourceforge.net>, <chao@kernel.org>,
	<jaegeuk@kernel.org>
CC: <wanghui33@xiaomi.com>, <linux-kernel@vger.kernel.org>, Jianan Huang
	<huangjianan@xiaomi.com>, Sheng Yong <shengyong1@xiaomi.com>
Subject: [PATCH v2] f2fs: avoid splitting bio when reading multiple pages
Date: Wed, 18 Jun 2025 16:17:05 +0800
Message-ID: <20250618081705.260239-1-huangjianan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617055542.218681-1-huangjianan@xiaomi.com>
References: <20250617055542.218681-1-huangjianan@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJ-MBX06.mioffice.cn (10.237.8.126) To YZ-MBX05.mioffice.cn
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
Changes since v1:
- Use aligned nr_pages instead of nr_cpages to pre-allocate bvecs.

 fs/f2fs/data.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 31e892842625..2d948586fea0 100644
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
@@ -2370,12 +2370,18 @@ static int f2fs_mpage_readpages(struct inode *inode,
 		.nr_cpages = 0,
 	};
 	pgoff_t nc_cluster_idx = NULL_CLUSTER;
-	pgoff_t index;
+	pgoff_t index = rac ? readahead_index(rac) : folio->index;
 #endif
 	unsigned nr_pages = rac ? readahead_count(rac) : 1;
 	unsigned max_nr_pages = nr_pages;
 	int ret = 0;
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (f2fs_compressed_file(inode))
+		max_nr_pages = round_up(index + nr_pages, cc.cluster_size) -
+				round_down(index, cc.cluster_size);
+#endif
+
 	map.m_pblk = 0;
 	map.m_lblk = 0;
 	map.m_len = 0;
@@ -2385,7 +2391,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 	map.m_seg_type = NO_CHECK_TYPE;
 	map.m_may_create = false;
 
-	for (; nr_pages; nr_pages--) {
+	for (; nr_pages; nr_pages--, max_nr_pages--) {
 		if (rac) {
 			folio = readahead_folio(rac);
 			prefetchw(&folio->flags);
-- 
2.43.0

