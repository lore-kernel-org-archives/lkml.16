Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B3C19259E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889637; cv=none; b=Icc9Fq+6VfAyyL/4zHbI3Q7WVZyj5R2KNOvPkLCTrtvsxfKxNRHN0F8PQWt5LheQjlrJlfq1f73+tchQ2Lv2chLeJxmo5gd6RrGGrV48cqyM2xSLB5mmZ2XIMxr+GC1nF7FEDdstsZrmEdOLMSKXOD4SRe3GkAKIXEd7Nq5D+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889637; c=relaxed/simple;
	bh=u0l4uLMQ+KcSF+QP1qmOgkoOupad7chjHTQ6d8B2s6s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lxzTofmAawLsxEnp3UrtVafnigxWYA76VvVpCHGyinUdnm+d3tpoayyfQJM6o+MoiaFm8QoXbF6rbRvxLCtvqmS4MzRXB27iOMedmYAM6k6j5aUnPGS/ha7hsNL+1Ru4e/ZedV21QI6mukpnf+riO8gEA/MnIaPg34theRtSPOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Zmj8P5Dm5zLpdR;
	Tue, 29 Apr 2025 09:16:53 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id D9A901401E0;
	Tue, 29 Apr 2025 09:20:25 +0800 (CST)
Received: from huawei.com (10.67.174.162) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 29 Apr
 2025 09:20:25 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <xiang@kernel.org>, <chao@kernel.org>, <zbestahu@gmail.com>,
	<jefflexu@linux.alibaba.com>
CC: <dhavale@google.com>, <linux-erofs@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH] erofs: encode file handle with the internal helpers
Date: Tue, 29 Apr 2025 01:11:39 +0000
Message-ID: <20250429011139.686847-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.22.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemo500009.china.huawei.com (7.202.194.199)

In erofs, the inode number has the location information of
files. The default encode_fh uses the ino32, this will lack
of some information when the file is too big. So we need
the internal helpers to encode filehandle.

Since i_generation in EROFS is not used, here we only encode
the nid into file handle when it is exported. So it is easy
to parse the dentry from file handle.

It is easy to reproduce test:
  1. prepare an erofs image with nid bigger than UINT_MAX
  2. mount -t erofs foo.img /mnt/erofs
  3. set exportfs with configuration: /mnt/erofs *(rw,sync,
     no_root_squash)
  4. mount -t nfs $IP:/mnt/erofs /mnt/nfs
  5. md5sum /mnt/nfs/foo # foo is the file which nid bigger
     than UINT_MAX.
For overlayfs case, the under filesystem's file handle is
encoded in ovl_fb.fid, it is same as NFS's case.

Fixes: 3e917cc305c6 ("erofs: make filesystem exportable")
Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/erofs/super.c | 51 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index cadec6b1b554..8f787c47e04d 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -511,24 +511,59 @@ static int erofs_fc_parse_param(struct fs_context *fc,
 	return 0;
 }
 
-static struct inode *erofs_nfs_get_inode(struct super_block *sb,
-					 u64 ino, u32 generation)
+static int erofs_encode_fh(struct inode *inode, u32 *fh, int *max_len,
+			   struct inode *parent)
 {
-	return erofs_iget(sb, ino);
+	int len = parent ? 4 : 2;
+	erofs_nid_t nid;
+
+	if (*max_len < len) {
+		*max_len = len;
+		return FILEID_INVALID;
+	}
+
+	nid = EROFS_I(inode)->nid;
+	fh[0] = (u32)(nid >> 32);
+	fh[1] = (u32)(nid & 0xffffffff);
+
+	if (parent) {
+		nid = EROFS_I(parent)->nid;
+
+		fh[2] = (u32)(nid >> 32);
+		fh[3] = (u32)(nid & 0xffffffff);
+	}
+
+	*max_len = len;
+	return parent ? FILEID_INO64_GEN_PARENT : FILEID_INO64_GEN;
 }
 
 static struct dentry *erofs_fh_to_dentry(struct super_block *sb,
 		struct fid *fid, int fh_len, int fh_type)
 {
-	return generic_fh_to_dentry(sb, fid, fh_len, fh_type,
-				    erofs_nfs_get_inode);
+	erofs_nid_t nid;
+
+	if ((fh_type != FILEID_INO64_GEN &&
+	     fh_type != FILEID_INO64_GEN_PARENT) || fh_len < 2)
+		return NULL;
+
+	nid = (u64) fid->raw[0] << 32;
+	nid |= (u64) fid->raw[1];
+
+	return d_obtain_alias(erofs_iget(sb, nid));
 }
 
 static struct dentry *erofs_fh_to_parent(struct super_block *sb,
 		struct fid *fid, int fh_len, int fh_type)
 {
-	return generic_fh_to_parent(sb, fid, fh_len, fh_type,
-				    erofs_nfs_get_inode);
+	erofs_nid_t nid;
+
+	if (fh_type != FILEID_INO64_GEN_PARENT || fh_len < 4)
+		return NULL;
+
+	nid = (u64) fid->raw[2] << 32;
+	nid |= (u64) fid->raw[3];
+
+	return d_obtain_alias(erofs_iget(sb, nid));
 }
 
 static struct dentry *erofs_get_parent(struct dentry *child)
@@ -544,7 +579,7 @@ static struct dentry *erofs_get_parent(struct dentry *child)
 }
 
 static const struct export_operations erofs_export_ops = {
-	.encode_fh = generic_encode_ino32_fh,
+	.encode_fh = erofs_encode_fh,
 	.fh_to_dentry = erofs_fh_to_dentry,
 	.fh_to_parent = erofs_fh_to_parent,
 	.get_parent = erofs_get_parent,
-- 
2.22.0

