Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D7127738
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749094001; cv=none; b=KWhSpkSmfZiBBMa83jVNE0oZZoydQyWXdg4Xx3lmlp4m5LIIeoLZ7iAEA7Dsjo09RCiboPQPoi/d1dbgUsAgSI1JOgIGOICmJXetZG86cVGTPI7er1GM9oMYdQ4wFLLWg1acCNQknVqlyiP0KWv+ZACjCu/MowTksCJ1OCDHdiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749094001; c=relaxed/simple;
	bh=amdy+vC90TIDwJevb0wzptOLcp9AWTshWlmocsdoUYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GAQVQLuNgHV3VRS67imCmjvNK8fXRZuuvCZqQL+Xcp+LAmXJCbIuVwb8FiMaAoyEXTPlrK62G6kkRKC/jOPaZjzEl2ZXFWe1lu2wSCH3/bUYphJ5pxalBDJR2VNVXYkY0im3ac164GFGQn8Y5JPaXzD8tCvenGHy2iqhrlhXrZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6p2b2BU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6p2b2BU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AB5C4CEE4;
	Thu,  5 Jun 2025 03:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749094000;
	bh=amdy+vC90TIDwJevb0wzptOLcp9AWTshWlmocsdoUYQ=;
	h=From:To:Cc:Subject:Date:From;
	b=E6p2b2BUKZU7SIgrgPzep7EcX9jhRdUs3FcEM4fasZDV1pQiXx4Vx0434z6CZPTmu
	 GJlm6QmZDi7/ZOTHRBuVwmBbdM5btAe8+oszDK63/QzXE4ZHJh6Fl+4D0sRElecgFy
	 hfPQRwjN2lWOQvQYMsLRPcJt1Z7ENBayK/Etl9HM1Dc7+GnFVpxYfQJl4/WFa9FxeP
	 zov5XBkOGapk2IWpLfbnTqJ0zJmEzjcbIO/QwnnGSXoKyJo+bWrrYWViJIVSSZZw+5
	 /jTccRoHsnrTYW233p5dg9b+YX124uZgnuoB6cQ/1LgkxEcXwljP3sD0kN8AFdyNuG
	 BZymWaQPgY6Cw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH v3] f2fs: fix to zero post-eof page
Date: Thu,  5 Jun 2025 11:26:33 +0800
Message-ID: <20250605032633.2744434-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fstest reports a f2fs bug:

generic/363 42s ... [failed, exit status 1]- output mismatch (see /share/git/fstests/results//generic/363.out.bad)
    --- tests/generic/363.out   2025-01-12 21:57:40.271440542 +0800
    +++ /share/git/fstests/results//generic/363.out.bad 2025-05-19 19:55:58.000000000 +0800
    @@ -1,2 +1,78 @@
     QA output created by 363
     fsx -q -S 0 -e 1 -N 100000
    +READ BAD DATA: offset = 0xd6fb, size = 0xf044, fname = /mnt/f2fs/junk
    +OFFSET      GOOD    BAD     RANGE
    +0x1540d     0x0000  0x2a25  0x0
    +operation# (mod 256) for the bad data may be 37
    +0x1540e     0x0000  0x2527  0x1
    ...
    (Run 'diff -u /share/git/fstests/tests/generic/363.out /share/git/fstests/results//generic/363.out.bad'  to see the entire diff)
Ran: generic/363
Failures: generic/363
Failed 1 of 1 tests

The root cause is user can update post-eof page via mmap [1], however, f2fs
missed to zero post-eof page in below operations, so, once it expands i_size,
then it will include dummy data locates previous post-eof page, so during
below operations, we need to zero post-eof page.

Operations which can include dummy data after previous i_size after expanding
i_size:
- write
- mapwrite [1]
- truncate
- fallocate
 * preallocate
 * zero_range
 * insert_range
 * collapse_range
- clone_range (doesn’t support in f2fs)
- copy_range (doesn’t support in f2fs)

[1] https://man7.org/linux/man-pages/man2/mmap.2.html 'BUG section'

Cc: stable@kernel.org
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- fix check condition in f2fs_zero_post_eof_page()
- fix wrong parameter passed from f2fs_setattr() to
- add a reference
f2fs_zero_post_eof_page()
 fs/f2fs/file.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6bd3de64f2a8..696131e655ed 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -35,6 +35,17 @@
 #include <trace/events/f2fs.h>
 #include <uapi/linux/f2fs.h>
 
+static void f2fs_zero_post_eof_page(struct inode *inode, loff_t new_size)
+{
+	loff_t old_size = i_size_read(inode);
+
+	if (old_size >= new_size)
+		return;
+
+	/* zero or drop pages only in range of [old_size, new_size] */
+	truncate_pagecache(inode, old_size);
+}
+
 static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
 {
 	struct inode *inode = file_inode(vmf->vma->vm_file);
@@ -103,8 +114,13 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
 
+	filemap_invalidate_lock(inode->i_mapping);
+	f2fs_zero_post_eof_page(inode, (folio->index + 1) << PAGE_SHIFT);
+	filemap_invalidate_unlock(inode->i_mapping);
+
 	file_update_time(vmf->vma->vm_file);
 	filemap_invalidate_lock_shared(inode->i_mapping);
+
 	folio_lock(folio);
 	if (unlikely(folio->mapping != inode->i_mapping ||
 			folio_pos(folio) > i_size_read(inode) ||
@@ -1109,6 +1125,8 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 		filemap_invalidate_lock(inode->i_mapping);
 
+		if (attr->ia_size > old_size)
+			f2fs_zero_post_eof_page(inode, attr->ia_size);
 		truncate_setsize(inode, attr->ia_size);
 
 		if (attr->ia_size <= old_size)
@@ -1227,6 +1245,10 @@ static int f2fs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
+	filemap_invalidate_lock(inode->i_mapping);
+	f2fs_zero_post_eof_page(inode, offset + len);
+	filemap_invalidate_unlock(inode->i_mapping);
+
 	pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
 	pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
 
@@ -1510,6 +1532,8 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
 
+	f2fs_zero_post_eof_page(inode, offset + len);
+
 	f2fs_lock_op(sbi);
 	f2fs_drop_extent_tree(inode);
 	truncate_pagecache(inode, offset);
@@ -1631,6 +1655,10 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 	if (ret)
 		return ret;
 
+	filemap_invalidate_lock(mapping);
+	f2fs_zero_post_eof_page(inode, offset + len);
+	filemap_invalidate_unlock(mapping);
+
 	pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
 	pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
 
@@ -1762,6 +1790,8 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 	/* avoid gc operation during block exchange */
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(mapping);
+
+	f2fs_zero_post_eof_page(inode, offset + len);
 	truncate_pagecache(inode, offset);
 
 	while (!ret && idx > pg_start) {
@@ -1819,6 +1849,10 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 	if (err)
 		return err;
 
+	filemap_invalidate_lock(inode->i_mapping);
+	f2fs_zero_post_eof_page(inode, offset + len);
+	filemap_invalidate_unlock(inode->i_mapping);
+
 	f2fs_balance_fs(sbi, true);
 
 	pg_start = ((unsigned long long)offset) >> PAGE_SHIFT;
@@ -4860,6 +4894,10 @@ static ssize_t f2fs_write_checks(struct kiocb *iocb, struct iov_iter *from)
 	err = file_modified(file);
 	if (err)
 		return err;
+
+	filemap_invalidate_lock(inode->i_mapping);
+	f2fs_zero_post_eof_page(inode, iocb->ki_pos + iov_iter_count(from));
+	filemap_invalidate_unlock(inode->i_mapping);
 	return count;
 }
 
-- 
2.49.0

