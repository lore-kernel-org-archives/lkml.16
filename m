Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B3B20C480
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750229004; cv=none; b=EDQo8C0QOOhnbPsIlTZRvFbcL0Gzdsgj7fqnP3GjLUarVU4ixyl14c+txMzSJiAqMt0jFClGrGVvyUif07IaUriq0syVi7Dm52G3HgnCByWtEq7egQQsgKwdDekFpOSPt+8mf9OyNuPjdX47D7owrYw0cIbvpPHVMh/18MbwSxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750229004; c=relaxed/simple;
	bh=FecHHn9Ge9Ka0drph2qhmaJY1nY6nkX2Nuo2c8xyuk0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NeY6sv+A8EPfwQ5jQVkFQaO78EM6NLbfEHC02rDo+qebnaYv+LPpyCPlGPI/u/bm+T4PvM4+6wjDWc1i7RnWlbGedMjSSjTFfTGuBnXFLP5DSaL9MGPzlcGtkOGEEpGNqu4f3B5eIHWwdCf31gOy/7rGhtRcjzBFue9p6luY3jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w001.hihonor.com (unknown [10.68.25.235])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bMYzS4NcpzYlqL6;
	Wed, 18 Jun 2025 14:41:08 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 18 Jun
 2025 14:43:21 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 18 Jun
 2025 14:43:20 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<bintian.wang@honor.com>, <feng.han@honor.com>, <niuzhiguo84@gmail.com>,
	wangzijie <wangzijie1@honor.com>
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: cleanup F2FS_I_SB in f2fs_setattr()
Date: Wed, 18 Jun 2025 14:43:03 +0800
Message-ID: <20250618064303.2477852-2-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250618064303.2477852-1-wangzijie1@honor.com>
References: <20250618064303.2477852-1-wangzijie1@honor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To a011.hihonor.com
 (10.68.31.243)

After introduce sbi in f2fs_setattr(), cleanup F2FS_I_SB. No logic change.

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/file.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9e0f1c98f..4809f0fd6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1029,7 +1029,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int err;
 
-	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
+	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
 	if (unlikely(IS_IMMUTABLE(inode)))
@@ -1080,12 +1080,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
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
@@ -1095,7 +1094,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		i_uid_update(idmap, attr, inode);
 		i_gid_update(idmap, attr, inode);
 		f2fs_mark_inode_dirty_sync(inode, true);
-		f2fs_unlock_op(F2FS_I_SB(inode));
+		f2fs_unlock_op(sbi);
 	}
 
 	if (attr->ia_valid & ATTR_SIZE) {
@@ -1156,7 +1155,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	f2fs_mark_inode_dirty_sync(inode, true);
 
 	/* inode change will produce dirty node pages flushed by checkpoint */
-	f2fs_balance_fs(F2FS_I_SB(inode), true);
+	f2fs_balance_fs(sbi, true);
 
 	return err;
 }
-- 
2.25.1

