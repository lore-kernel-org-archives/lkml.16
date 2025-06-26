Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C69219E0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750898288; cv=none; b=qLdiYbQQwxLvitRMyqiS5FcYoJqpvvWXnmob5TNYmVg5YSWZRh00O6TPsgy+335rBrK8ACnwhip+ALvtMrzrRhDy1UDcJFvvxHJNBdCMQG/Df15SjsTFQdfG5GmNvq/Eu1geT27VxICwKNQH8L8DJ04COly7cZu5EU7sDYmWgT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750898288; c=relaxed/simple;
	bh=wi+ThvIukbEf31mphAv9NNJBeU0b2BVVKThx+fZedG8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kJlqh3QBET5MXnrryUcZq0reVTup9Ncby018Zzr2Tds9tFdl122Dl0bf0OIk1UkwHe2rgsKRoYkP0Pc0LNBJC8Nsxa3zbrC8OycEJAuDPCzISPrVXV5RmX/5kPItsQcyFA7j/JI6AD5Itwz6VsNAX5dZV+EmJ0MIYMqoyxMvvRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201622.home.langchao.com
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id 202506260836458200;
        Thu, 26 Jun 2025 08:36:45 +0800
Received: from localhost.localdomain (10.94.7.185) by
 jtjnmail201622.home.langchao.com (10.100.2.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 26 Jun 2025 08:36:45 +0800
From: Bo Liu <liubo03@inspur.com>
To: <phillip@squashfs.org.uk>
CC: <linux-kernel@vger.kernel.org>, Bo Liu <liubo03@inspur.com>
Subject: [PATCH] Squashfs: add page cache share support
Date: Wed, 25 Jun 2025 20:36:44 -0400
Message-ID: <20250626003644.3675-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: Jtjnmail201618.home.langchao.com (10.100.2.18) To
 jtjnmail201622.home.langchao.com (10.100.2.22)
tUid: 2025626083645b2edb95f0e79552780102684ddf4a6c3
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

Last year, Hongzhen Luo submitted the page cache sharing feature
for the EROFS file system, highlighting that in container scenarios,
different images mounted at separate mount points cause identical files
to maintain duplicate page caches. This issue also exists in the SquashFS
file system, so we added support for page cache sharing on SquashFS.

To enable page cache sharing, the extended attribute of each file must
be configured. This involves calculating the file's MD5 value and setting
it via the setfattr command.
    # md5sum $file
    # setfattr -n "trusted.md5sum" -v "$hash" $file

A 300MB file was packaged into two separate images, which were mounted at different mount points.
fio was used to read the file contents, comparing the system page cache size with and without the
page cache sharing feature enabled.

|---------------|-------------------------|--------------------------|
|               | enable page cache share | disable page cache share |
|---------------|-------------------------|--------------------------|
|page cache size|          501MiB         |         1052MiB          |
|---------------|-------------------------|--------------------------|

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 fs/squashfs/Kconfig           |  10 +++
 fs/squashfs/Makefile          |   1 +
 fs/squashfs/inode.c           |  10 ++-
 fs/squashfs/pagecache_share.c | 159 ++++++++++++++++++++++++++++++++++
 fs/squashfs/pagecache_share.h |  22 +++++
 fs/squashfs/squashfs.h        |   2 +
 fs/squashfs/squashfs_fs_i.h   |   5 ++
 fs/squashfs/super.c           |  45 +++++++++-
 8 files changed, 252 insertions(+), 2 deletions(-)
 create mode 100644 fs/squashfs/pagecache_share.c
 create mode 100644 fs/squashfs/pagecache_share.h

diff --git a/fs/squashfs/Kconfig b/fs/squashfs/Kconfig
index a9602aae21ef..eb9eed538d0f 100644
--- a/fs/squashfs/Kconfig
+++ b/fs/squashfs/Kconfig
@@ -285,3 +285,13 @@ config SQUASHFS_FRAGMENT_CACHE_SIZE
 
 	  Note there must be at least one cached fragment.  Anything
 	  much more than three will probably not make much difference.
+
+config SQUASHFS_PAGE_CACHE_SHARE
+	bool "SQUASHFS page cache share support"
+	depends on SQUASHFS
+	default n
+	help
+	 Saying Y here includes support for permiting SQUASHFS to share
+	 page cache for files with same fingerprints.
+
+	 If unsure, say N.
diff --git a/fs/squashfs/Makefile b/fs/squashfs/Makefile
index 477c89a519ee..568e851871ca 100644
--- a/fs/squashfs/Makefile
+++ b/fs/squashfs/Makefile
@@ -17,3 +17,4 @@ squashfs-$(CONFIG_SQUASHFS_LZO) += lzo_wrapper.o
 squashfs-$(CONFIG_SQUASHFS_XZ) += xz_wrapper.o
 squashfs-$(CONFIG_SQUASHFS_ZLIB) += zlib_wrapper.o
 squashfs-$(CONFIG_SQUASHFS_ZSTD) += zstd_wrapper.o
+squashfs-$(CONFIG_SQUASHFS_PAGE_CACHE_SHARE) += pagecache_share.o
diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
index d5918eba27e3..e8ea4dcf3bb8 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -35,6 +35,7 @@
 #include "squashfs_fs_i.h"
 #include "squashfs.h"
 #include "xattr.h"
+#include "pagecache_share.h"
 
 /*
  * Initialise VFS inode with the base inode information common to all
@@ -90,8 +91,15 @@ struct inode *squashfs_iget(struct super_block *sb, long long ino,
 		iget_failed(inode);
 		return ERR_PTR(err);
 	}
-
 	unlock_new_inode(inode);
+
+#ifdef CONFIG_SQUASHFS_PAGE_CACHE_SHARE
+		if ((inode->i_mode & S_IFMT) == S_IFREG) {
+			if (squashfs_pcs_fill_inode(inode) > 0)
+				inode->i_fop = &squashfs_pcs_file_fops;
+		}
+#endif
+
 	return inode;
 }
 
diff --git a/fs/squashfs/pagecache_share.c b/fs/squashfs/pagecache_share.c
new file mode 100644
index 000000000000..9b3dcc05948e
--- /dev/null
+++ b/fs/squashfs/pagecache_share.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024, Inspur
+ */
+#include <linux/xarray.h>
+#include <linux/mutex.h>
+#include <linux/xxhash.h>
+#include <linux/slab.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/mm.h>
+#include <linux/xattr.h>
+#include <linux/uio.h>
+#include <uapi/linux/fcntl.h>
+#include "squashfs_fs_i.h"
+#include "xattr.h"
+#include "pagecache_share.h"
+#include "squashfs.h"
+
+#define PCS_FPRT_NAME  "md5sum"
+#define PCS_FPRT_MAXLEN 64
+
+static struct vfsmount *squashfs_pcs_mnt;
+
+int squashfs_pcs_init_mnt(void)
+{
+	struct vfsmount *mnt;
+
+	mnt = kern_mount(&squashfs_anon_fs_type);
+	if (IS_ERR(mnt))
+		return PTR_ERR(mnt);
+	squashfs_pcs_mnt = mnt;
+	return 0;
+}
+
+void squashfs_pcs_mnt_exit(void)
+{
+	kern_unmount(squashfs_pcs_mnt);
+	squashfs_pcs_mnt = NULL;
+}
+
+static int squashfs_pcs_eq(struct inode *inode, void *data)
+{
+	return *(unsigned long *)(inode->i_private) == *(unsigned long *)data ? 1 : 0;
+}
+
+static int squashfs_pcs_inode_set(struct inode *inode, void *data)
+{
+	inode->i_private = kmalloc(sizeof(unsigned long), GFP_KERNEL);
+	*(unsigned long *)(inode->i_private) = *(unsigned long *)data;
+	return 0;
+}
+
+int squashfs_pcs_fill_inode(struct inode *inode)
+{
+	struct squashfs_inode_info *sqi = squashfs_i(inode);
+	struct super_block *sb = inode->i_sb;
+	struct inode *ano_inode;
+	char fprt[PCS_FPRT_MAXLEN];
+	int fprt_len;
+	const struct xattr_handler *handler = sb->s_xattr[1];
+
+	fprt_len = handler->get(handler, NULL, inode, PCS_FPRT_NAME,
+				     fprt, PCS_FPRT_MAXLEN);
+	if (fprt_len < 0 || fprt_len > PCS_FPRT_MAXLEN)
+		return -EINVAL;
+
+	sqi->fprt_hash = xxh32(fprt, fprt_len, 0);
+	ano_inode = iget5_locked(squashfs_pcs_mnt->mnt_sb,
+				 sqi->fprt_hash, squashfs_pcs_eq,
+				 squashfs_pcs_inode_set, &sqi->fprt_hash);
+	if (IS_ERR(ano_inode))
+		return -ENOMEM;
+
+	if (ano_inode->i_state & I_NEW) {
+		ano_inode->i_mapping = inode->i_mapping;
+		ano_inode->i_size = inode->i_size;
+		ano_inode->i_data.a_ops = &squashfs_aops;
+		unlock_new_inode(ano_inode);
+	}
+	sqi->pcs_inode = ano_inode;
+	return fprt_len;
+}
+
+static int squashfs_pcs_file_open(struct inode *inode, struct file *file)
+{
+	struct squashfs_inode_info *sqi = squashfs_i(inode);
+	struct inode *pcs_inode;
+	struct file *ano_file;
+
+	pcs_inode = sqi->pcs_inode;
+	if (!pcs_inode)
+		return -EINVAL;
+
+	ano_file = alloc_file_pseudo(pcs_inode, squashfs_pcs_mnt,
+				     "[squashfs_pcs_f]", O_RDONLY,
+				     &generic_ro_fops);
+	if (!ano_file)
+		return -ENOMEM;
+
+	file_ra_state_init(&ano_file->f_ra, file->f_mapping);
+	file->private_data = (void *)ano_file;
+	ano_file->private_data = squashfs_i(inode);
+	return 0;
+}
+
+static int squashfs_pcs_file_release(struct inode *inode, struct file *file)
+{
+	if (!file->private_data)
+		return -EINVAL;
+	fput((struct file *)file->private_data);
+	file->private_data = NULL;
+
+	return 0;
+}
+
+static ssize_t squashfs_pcs_file_read_iter(struct kiocb *iocb,
+					   struct iov_iter *iter)
+{
+	size_t count = iov_iter_count(iter);
+	struct file *backing_file = iocb->ki_filp->private_data;
+	struct kiocb dedup_iocb;
+	ssize_t nread;
+
+	if (!count)
+		return 0;
+
+	kiocb_clone(&dedup_iocb, iocb, backing_file);
+	nread = filemap_read(&dedup_iocb, iter, 0);
+	iocb->ki_pos = dedup_iocb.ki_pos;
+	touch_atime(&iocb->ki_filp->f_path);
+
+	return nread;
+}
+
+const struct vm_operations_struct squashfs_file_vm_ops = {
+	.fault		= filemap_fault,
+	.map_pages	= filemap_map_pages,
+	.page_mkwrite	= filemap_page_mkwrite,
+};
+
+static int squashfs_pcs_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct file *ano_file = file->private_data;
+
+	vma_set_file(vma, ano_file);
+	vma->vm_ops = &squashfs_file_vm_ops;
+	return 0;
+}
+
+const struct file_operations squashfs_pcs_file_fops = {
+	.open = squashfs_pcs_file_open,
+	.llseek = generic_file_llseek,
+	.read_iter = squashfs_pcs_file_read_iter,
+	.mmap = squashfs_pcs_mmap,
+	.release = squashfs_pcs_file_release,
+	.get_unmapped_area = thp_get_unmapped_area,
+	.splice_read = filemap_splice_read,
+};
diff --git a/fs/squashfs/pagecache_share.h b/fs/squashfs/pagecache_share.h
new file mode 100644
index 000000000000..fa3638de98dd
--- /dev/null
+++ b/fs/squashfs/pagecache_share.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2024, Inspur
+ */
+#ifndef __SQUASHFS_PAGECACHE_SHARE_H
+#define __SQUASHFS_PAGECACHE_SHARE_H
+
+#include <linux/mutex.h>
+#include <linux/fs.h>
+#include <linux/mount.h>
+#include <linux/rwlock.h>
+#include <linux/mutex.h>
+
+int squashfs_pcs_fill_inode(struct inode *inode);
+int sqyashfs_pcs_remove(struct inode *inode);
+int squashfs_pcs_init_mnt(void);
+void squashfs_pcs_mnt_exit(void);
+
+extern const struct file_operations squashfs_pcs_file_fops;
+extern const struct vm_operations_struct generic_file_vm_ops;
+#endif
+
diff --git a/fs/squashfs/squashfs.h b/fs/squashfs/squashfs.h
index 218868b20f16..f27fa8efb1b9 100644
--- a/fs/squashfs/squashfs.h
+++ b/fs/squashfs/squashfs.h
@@ -117,3 +117,5 @@ extern const struct inode_operations squashfs_symlink_inode_ops;
 
 /* xattr.c */
 extern const struct xattr_handler * const squashfs_xattr_handlers[];
+
+extern struct file_system_type squashfs_anon_fs_type;
diff --git a/fs/squashfs/squashfs_fs_i.h b/fs/squashfs/squashfs_fs_i.h
index 2c82d6f2a456..a1e57f597bbf 100644
--- a/fs/squashfs/squashfs_fs_i.h
+++ b/fs/squashfs/squashfs_fs_i.h
@@ -30,6 +30,11 @@ struct squashfs_inode_info {
 			int		parent;
 		};
 	};
+
+#ifdef CONFIG_SQUASHFS_PAGE_CACHE_SHARE
+	unsigned long fprt_hash;
+	struct inode *pcs_inode;
+#endif
 	struct inode	vfs_inode;
 };
 
diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
index 992ea0e37257..8aedb49b4ea2 100644
--- a/fs/squashfs/super.c
+++ b/fs/squashfs/super.c
@@ -29,6 +29,7 @@
 #include <linux/module.h>
 #include <linux/magic.h>
 #include <linux/xattr.h>
+#include <linux/pseudo_fs.h>
 
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
@@ -36,6 +37,7 @@
 #include "squashfs.h"
 #include "decompressor.h"
 #include "xattr.h"
+#include "pagecache_share.h"
 
 static struct file_system_type squashfs_fs_type;
 static const struct super_operations squashfs_super_ops;
@@ -654,6 +656,15 @@ static int __init init_squashfs_fs(void)
 		return err;
 	}
 
+#ifdef CONFIG_SQUASHFS_PAGE_CACHE_SHARE
+	err = squashfs_pcs_init_mnt();
+	if (err) {
+		destroy_inodecache();
+		unregister_filesystem(&squashfs_fs_type);
+		return err;
+	}
+#endif
+
 	pr_info("version 4.0 (2009/01/31) Phillip Lougher\n");
 
 	return 0;
@@ -662,6 +673,9 @@ static int __init init_squashfs_fs(void)
 
 static void __exit exit_squashfs_fs(void)
 {
+#ifdef CONFIG_SQUASHFS_PAGE_CACHE_SHARE
+	squashfs_pcs_mnt_exit();
+#endif
 	unregister_filesystem(&squashfs_fs_type);
 	destroy_inodecache();
 }
@@ -675,7 +689,6 @@ static struct inode *squashfs_alloc_inode(struct super_block *sb)
 	return ei ? &ei->vfs_inode : NULL;
 }
 
-
 static void squashfs_free_inode(struct inode *inode)
 {
 	kmem_cache_free(squashfs_inode_cachep, squashfs_i(inode));
@@ -698,6 +711,36 @@ static const struct super_operations squashfs_super_ops = {
 	.put_super = squashfs_put_super,
 	.show_options = squashfs_show_options,
 };
+#ifdef CONFIG_SQUASHFS_PAGE_CACHE_SHARE
+static void squashfs_free_anon_inode(struct inode *inode)
+{
+	kfree(inode->i_private);
+	iput(inode);
+}
+#endif
+
+static const struct super_operations squashfs_anon_sops = {
+	.statfs = simple_statfs,
+#ifdef CONFIG_SQUASHFS_PAGE_CACHE_SHARE
+	.free_inode = squashfs_free_anon_inode,
+#endif
+};
+
+static int squashfs_anon_init_fs_context(struct fs_context *fc)
+{
+	struct pseudo_fs_context *ctx = init_pseudo(fc, SQUASHFS_MAGIC);
+
+	if (ctx)
+		ctx->ops = &squashfs_anon_sops;
+	return ctx ? 0 : -ENOMEM;
+}
+
+struct file_system_type squashfs_anon_fs_type = {
+	.owner = THIS_MODULE,
+	.name = "pseudo_squashfs",
+	.init_fs_context = squashfs_anon_init_fs_context,
+	.kill_sb = kill_anon_super,
+};
 
 module_init(init_squashfs_fs);
 module_exit(exit_squashfs_fs);
-- 
2.31.1

