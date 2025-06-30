Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [118.143.206.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D40286D49
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.143.206.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288285; cv=none; b=o+p7u8ZdOt+RZT9d9Ciukn0VQH/RJWi7YXfuGHeFI6j6J8oEyk5J7GvXxIHtp0cCQAHso8YwPj8+/CCFFzj2vv45x1bYv51yM6hKhIc0BOyBP5rq89RMqPUX4hL9eI37mTHG7UQ2LD8z0y9gDQKB3sk0U4U3WngJ/HtUojhqS8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288285; c=relaxed/simple;
	bh=tHwFfULSraB0b5DiWBq9fo+pcEY0DVMjEA1kIHbbQiA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fwhLsq5Mi2BG1QUqB2T+WdtuCr9/qPg13k3GyU+pvqbvWawiKd0SGfK6l7QaZtFX5m23SHeEmSRpfqrycC5W1LWbGXTzjesfs3REtGlTWwqMyz8danV3ry7efLju5DtDITRF0LYBGQnyb3pPlohLWcOr4Ww6iElbDdTYcx9XwHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=118.143.206.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: 5LBxny4CRvOsaSC/c5fhuw==
X-CSE-MsgGUID: GT6SKkc9Sr6P7+8g5QAp1g==
X-IronPort-AV: E=Sophos;i="6.16,277,1744041600"; 
   d="scan'208";a="119068307"
From: Jianan Huang <huangjianan@xiaomi.com>
To: <linux-f2fs-devel@lists.sourceforge.net>, <chao@kernel.org>,
	<jaegeuk@kernel.org>
CC: <wanghui33@xiaomi.com>, <linux-kernel@vger.kernel.org>, Jianan Huang
	<huangjianan@xiaomi.com>, Sheng Yong <shengyong1@xiaomi.com>
Subject: [PATCH v4] f2fs: avoid splitting bio when reading multiple pages
Date: Mon, 30 Jun 2025 20:57:53 +0800
Message-ID: <20250630125753.650630-1-huangjianan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJ-MBX17.mioffice.cn (10.237.8.137) To YZ-MBX05.mioffice.cn
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
Changes since v3:
- Keep max_nr_pages unchanged across multiple reads.
Changes since v2:
- Initialize index only for compressed files.
Changes since v1:
- Use aligned nr_pages instead of nr_cpages to pre-allocate bvecs.

 fs/f2fs/data.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 31e892842625..40292e4ad341 100644
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
-- 
2.43.0

