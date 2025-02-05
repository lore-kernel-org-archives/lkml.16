Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF3223CE
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 21:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738791620; cv=none; b=bKXPU9BOv63A5gFZWUNUAhDcPxvIKjP1DSH7oTqtj/NI0TJnfeaJ1VBMxkMvN16i9CmH3zgN2fT9xmfLZFpxgPeZVQm2Y0WHBTMd37F850wTFjQuCvCHa+SZOBws2vf7Q1UiIwULaYIw5UK7EGYNSTl8R8nXW/HpwLYoSfkM8gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738791620; c=relaxed/simple;
	bh=hCmtyZG5wKHm5C3H2TnU//Dp8nTojDg4JmoDtBSEWWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P+y6IO1a+tIvYN3wduirrgZ6XIggEBtRrmM4dSle833HaGNPVfDiZlLBnJqLGyzssYzwjdTmnBKzLt8rTh9WrNCWOoOs/Cz6t+B1H6UVsjqWmT3om+zEz4oO8KIUHFEIbmOjfQ31MeyV6IsHy8hv7WriEm5Kk0W+oa1TEI/O6No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5U5xFly; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5U5xFly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0497C4CED1;
	Wed,  5 Feb 2025 21:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738791620;
	bh=hCmtyZG5wKHm5C3H2TnU//Dp8nTojDg4JmoDtBSEWWE=;
	h=From:To:Cc:Subject:Date:From;
	b=a5U5xFlykrMhzv6xknoC+kWmdsa8Olj2Z3cPDjI1yXSjrA1zwtBy4VjILKTfQPwz7
	 7Na2qCWADG7CyVdx8wZPxF8W9St3Yqg9Jw35Fp0vVnR5iicg5+sGjXUKFtI83CpCpm
	 YIUU4TWGDfYdGFdcKzteChi9aVFJ9/BkmjAH741ZoMDz230GVWwqoaQUEfhkJnC9R9
	 NfV/luLVONB3yUjvNaTMCwaX5QlN9fQWt6njevjxB034klzaY0k8eBVFwxCM3sontM
	 VJoujdV6E76luIWcW9QEpfmwzx91o+zDngcm2NlzsvmqpU2IzOUAAc2fJTITzrbUx1
	 8hHJonrp0vnvA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [PATCH] f2fs: add ioctl to get IO priority hint
Date: Wed,  5 Feb 2025 21:40:14 +0000
Message-ID: <20250205214014.3270585-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds an ioctl to give a per-file priority hint to attach
REQ_PRIO.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c            |  6 ++++++
 fs/f2fs/f2fs.h            |  7 +++++++
 fs/f2fs/file.c            | 20 ++++++++++++++++++++
 include/uapi/linux/f2fs.h |  1 +
 4 files changed, 34 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 07b46b444d31..24c5cb1f5ada 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -413,6 +413,7 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 {
 	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
+	struct folio *fio_folio = page_folio(fio->page);
 	unsigned int fua_flag, meta_flag, io_flag;
 	blk_opf_t op_flags = 0;
 
@@ -438,6 +439,11 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 		op_flags |= REQ_META;
 	if (BIT(fio->temp) & fua_flag)
 		op_flags |= REQ_FUA;
+
+	if (fio->type == DATA &&
+	    F2FS_I(fio_folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
+		op_flags |= REQ_PRIO;
+
 	return op_flags;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bd0d8138b71d..c0a5f0df8781 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -816,6 +816,12 @@ enum {
 	FI_MAX,			/* max flag, never be used */
 };
 
+/* used for f2fs_inode_info->ioprio_hint. */
+enum {
+	F2FS_IOPRIO_WRITE = 1,	/* high write priority */
+	F2FS_IOPRIO_MAX,
+};
+
 struct f2fs_inode_info {
 	struct inode vfs_inode;		/* serve a vfs inode */
 	unsigned long i_flags;		/* keep an inode flags for ioctl */
@@ -830,6 +836,7 @@ struct f2fs_inode_info {
 
 	/* Use below internally in f2fs*/
 	unsigned long flags[BITS_TO_LONGS(FI_MAX)];	/* use to pass per-file flags */
+	unsigned int ioprio_hint;	/* hint for IO priority */
 	struct f2fs_rwsem i_sem;	/* protect fi info */
 	atomic_t dirty_pages;		/* # of dirty pages */
 	f2fs_hash_t chash;		/* hash value of given file name */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 642b8d85a035..2f93a27d2f45 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3503,6 +3503,23 @@ static int f2fs_ioc_get_dev_alias_file(struct file *filp, unsigned long arg)
 			(u32 __user *)arg);
 }
 
+static int f2fs_ioc_io_prio(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	__u32 level;
+
+	if (get_user(level, (__u32 __user *)arg))
+		return -EFAULT;
+
+	if (!S_ISREG(inode->i_mode) || level >= F2FS_IOPRIO_MAX)
+		return -EINVAL;
+
+	inode_lock(inode);
+	F2FS_I(inode)->ioprio_hint = level;
+	inode_unlock(inode);
+	return 0;
+}
+
 int f2fs_precache_extents(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
@@ -4606,6 +4623,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_compress_file(filp);
 	case F2FS_IOC_GET_DEV_ALIAS_FILE:
 		return f2fs_ioc_get_dev_alias_file(filp, arg);
+	case F2FS_IOC_IO_PRIO:
+		return f2fs_ioc_io_prio(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -5321,6 +5340,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_DECOMPRESS_FILE:
 	case F2FS_IOC_COMPRESS_FILE:
 	case F2FS_IOC_GET_DEV_ALIAS_FILE:
+	case F2FS_IOC_IO_PRIO:
 		break;
 	default:
 		return -ENOIOCTLCMD;
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index cd38a7c166e6..fb2f85b3c540 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -46,6 +46,7 @@
 #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
 #define F2FS_IOC_DONATE_RANGE		_IOW(F2FS_IOCTL_MAGIC, 27,	\
 						struct f2fs_donate_range)
+#define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 28, __u32)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
-- 
2.48.1.362.g079036d154-goog

