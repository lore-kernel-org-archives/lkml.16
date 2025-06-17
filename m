Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D55EACD
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750132644; cv=none; b=IjhX5ti3mSerPSfH4lkcNe61IRN7r2ZyidOWATNZkZzRTJc7HFhN/q21HJY3QBFvQnlcKsdUcJ2wl9FuHRMplKXr/iGsSBQ3JV1XIlS7/rLWgaDYbpFv4BweDma0QGERQNubp70vjSF5dsIZnqReJlRLE0tilrX9Xn5ILr0bwhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750132644; c=relaxed/simple;
	bh=4pHZpWI97lvBsIVoj+U83JBi5PomkEODSsQhRGN+v/E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DuIkYiam8mFHUEzG/6IB0UY7tH4QaEAGjHhRZHs+k/4odpgLDL3Ooa3AFs+zVwlzDnKSciqyskGG+6uR5Y6wi+q7YGEM8x3d9TTAifYDaFrXunYFTd4UxLwf/zBQuJU0q9yufXFIpt57KgEf78G29BvHicC3U7ql5SxaaJc4HRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w013.hihonor.com (unknown [10.68.26.19])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bLtLG1szQzYkxrF;
	Tue, 17 Jun 2025 11:55:02 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Jun
 2025 11:57:14 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Jun
 2025 11:57:13 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<bintian.wang@honor.com>, <feng.han@honor.com>, <niuzhiguo84@gmail.com>,
	wangzijie <wangzijie1@honor.com>
Subject: [f2fs-dev] [PATCH 1/2] f2fs: avoid non-section-aligned size pinned file generation
Date: Tue, 17 Jun 2025 11:57:10 +0800
Message-ID: <20250617035711.2342823-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w011.hihonor.com (10.68.20.122) To a011.hihonor.com
 (10.68.31.243)

To prevent non-section-aligned size pinned file generated from truncation,
add check condition in setattr.

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6bd3de64f..72f7d1b4a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1026,6 +1026,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *inode = d_inode(dentry);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int err;
 
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
@@ -1047,6 +1048,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			!IS_ALIGNED(attr->ia_size,
 			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
 			return -EINVAL;
+		if (f2fs_is_pinned_file(inode) &&
+			attr->ia_size < i_size_read(inode) &&
+			!IS_ALIGNED(attr->ia_size,
+			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
+			return -EINVAL;
 	}
 
 	err = setattr_prepare(idmap, dentry, attr);
-- 
2.25.1

