Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A341879E1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749811118; cv=none; b=jMtZ7vLrXG4JuPcnodMRoS8q7gtGkuXOJBWbDhUgMV5UkqVX86PyzSlTb1g0NAxE5rajAST0tqUKpbRon1Lxd8g0Drlnr/x9z+ygfiCtxAVhQX2tDt889rDTOeje1U/gYpqOPtOomprle6auG5D4qf5nU9g/LXlbXZod/LqP1sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749811118; c=relaxed/simple;
	bh=GmyPyeWQVV5WBtGunWOAp07ZwC+/wYZ+4d1J4CFpw5c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aTf/ZoeSChg79DMZ6Z9+NP4Q+PKxhrVt0JkPcwYbnCmYrP95ZGSO1DjRP+W86ccmHbc4pG7rgmoHf565f1O2qRTVRO6vgCT9p+t/+4FdRjCvW0YN18ZAp9bkQrxMFmvzrANAnMbsA2D+Edu5Oha0GjQyfcFUZHnNwr77TNM7l0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w012.hihonor.com (unknown [10.68.27.189])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bJbRM57LHzYl4Jq;
	Fri, 13 Jun 2025 18:36:31 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 13 Jun
 2025 18:38:31 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 13 Jun
 2025 18:38:31 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<niuzhiguo84@gmail.com>, <bintian.wang@honor.com>, <feng.han@honor.com>,
	wangzijie <wangzijie1@honor.com>
Subject: [f2fs-dev] [PATCH] f2fs: avoid non-section-aligned size pinned file generation
Date: Fri, 13 Jun 2025 18:38:29 +0800
Message-ID: <20250613103829.1895191-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a011.hihonor.com
 (10.68.31.243)

To prevent non-section-aligned size pinned file generated from truncation,
add check condition in setattr. Meanwhile, clean up F2FS_I_SB.

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/file.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6bd3de64f..31ecf615b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1026,9 +1026,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *inode = d_inode(dentry);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	block_t sec_blks = CAP_BLKS_PER_SEC(sbi);
 	int err;
 
-	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
+	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
 	if (unlikely(IS_IMMUTABLE(inode)))
@@ -1047,6 +1049,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			!IS_ALIGNED(attr->ia_size,
 			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
 			return -EINVAL;
+		if (f2fs_is_pinned_file(inode) &&
+			attr->ia_size < i_size_read(inode) &&
+			!IS_ALIGNED(attr->ia_size,
+			F2FS_BLK_TO_BYTES(sec_blks)))
+			return -EINVAL;
 	}
 
 	err = setattr_prepare(idmap, dentry, attr);
@@ -1068,12 +1075,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	}
 	if (i_uid_needs_update(idmap, attr, inode) ||
 	    i_gid_needs_update(idmap, attr, inode)) {
-		f2fs_lock_op(F2FS_I_SB(inode));
+		f2fs_lock_op(sbi);
 		err = dquot_transfer(idmap, inode, attr);
 		if (err) {
-			set_sbi_flag(F2FS_I_SB(inode),
-					SBI_QUOTA_NEED_REPAIR);
-			f2fs_unlock_op(F2FS_I_SB(inode));
+			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
+			f2fs_unlock_op(sbi);
 			return err;
 		}
 		/*
@@ -1083,7 +1089,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		i_uid_update(idmap, attr, inode);
 		i_gid_update(idmap, attr, inode);
 		f2fs_mark_inode_dirty_sync(inode, true);
-		f2fs_unlock_op(F2FS_I_SB(inode));
+		f2fs_unlock_op(sbi);
 	}
 
 	if (attr->ia_valid & ATTR_SIZE) {
@@ -1144,7 +1150,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	f2fs_mark_inode_dirty_sync(inode, true);
 
 	/* inode change will produce dirty node pages flushed by checkpoint */
-	f2fs_balance_fs(F2FS_I_SB(inode), true);
+	f2fs_balance_fs(sbi, true);
 
 	return err;
 }
-- 
2.25.1

