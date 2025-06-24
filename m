Received: from mta22.hihonor.com (mta22.hihonor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9083F76C61
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750737590; cv=none; b=JXJz/VqGqtCPrkRTzvzTAgmIYHiK8PszU7UH3MxWvo1Y51PoFUxHGLDCetgys67RA2BCPEJVYYF/uPTqj+Xbz9qdWEnbGJp++MSC7rJGkyw7ioxcCJVAFMTu2pdnePhxFuJVmzVs6I0ugyzcIFwzSOHBcpZArDuCmiZIcbwUoJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750737590; c=relaxed/simple;
	bh=92Tnwuqr4k+T+qCkrmDRJABms66kpCGvFOkZuN9INW4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jiBD7uLWTf730dC+OqFvDtLAqLozVmCyJpJ5b1QBHMfjWL6/WcivzhoBGRsQngiU3/Qo9DAQV8ywy3mHBMCmyoghyiZcvRcTJMT/xgNUsbp77n+BudyWDWhm+10nyKhf0ufIFbH56b4ZGCyJmO/vb2pNdc2nwEb5fHFrfb6DH+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b=iLrOmvLj; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b="iLrOmvLj"
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=To:From;
	bh=NB+vgAifhfNhXjK5PAWYKmYmRUSFZEldDBEXrTnVu/w=;
	b=iLrOmvLj4NwRaPegflY0zlQNjko/eb2BWvF9rdTjj5UrJ/AGv5vdsvbLjvKeqFZe6jhO5dLuO
	ah8XZCzKGEiUyDsPgigUpebcj2hqv+TtXE8CnemK46C6jkjCVl6KC54764VHdWxq6dcaT7IlkiC
	v1yteRM8iwnvKjNsOD+Yq/s=
Received: from w013.hihonor.com (unknown [10.68.26.19])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bRB404SKnzYl1nd;
	Tue, 24 Jun 2025 11:57:36 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Jun
 2025 11:59:40 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Jun
 2025 11:59:40 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<bintian.wang@honor.com>, <feng.han@honor.com>, <niuzhiguo84@gmail.com>,
	wangzijie <wangzijie1@honor.com>
Subject: [f2fs-dev] [PATCH v4 1/2] f2fs: convert F2FS_I_SB to sbi in f2fs_setattr()
Date: Tue, 24 Jun 2025 11:59:37 +0800
Message-ID: <20250624035938.3176350-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w010.hihonor.com (10.68.28.113) To a011.hihonor.com
 (10.68.31.243)

Introduce sbi in f2fs_setattr() and convert F2FS_I_SB to it. No logic
change, just cleanup and prepare to get CAP_BLKS_PER_SEC(sbi).

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/file.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6bd3de64f..209f43653 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1026,9 +1026,10 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *inode = d_inode(dentry);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int err;
 
-	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
+	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
 	if (unlikely(IS_IMMUTABLE(inode)))
@@ -1068,12 +1069,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
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
@@ -1083,7 +1083,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		i_uid_update(idmap, attr, inode);
 		i_gid_update(idmap, attr, inode);
 		f2fs_mark_inode_dirty_sync(inode, true);
-		f2fs_unlock_op(F2FS_I_SB(inode));
+		f2fs_unlock_op(sbi);
 	}
 
 	if (attr->ia_valid & ATTR_SIZE) {
@@ -1144,7 +1144,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	f2fs_mark_inode_dirty_sync(inode, true);
 
 	/* inode change will produce dirty node pages flushed by checkpoint */
-	f2fs_balance_fs(F2FS_I_SB(inode), true);
+	f2fs_balance_fs(sbi, true);
 
 	return err;
 }
-- 
2.25.1

