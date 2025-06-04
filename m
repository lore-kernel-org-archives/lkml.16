Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3065C1ACEAF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027427; cv=none; b=MNzuafeYH2eLuhsPvDsgeyIprKn3232FlW1/yhHbU19Z9YyYLVcZIrrqd9Lxt2kpB2BP4AT46tVok1eDtE7Sf8rGJKEyvksGS93dYf3JGk3zK71XhkGevcWMqDGniMs1mASUvnLt6LnHimBaHvypWO52Y6UFdZh7rUJqU5bf2Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027427; c=relaxed/simple;
	bh=FR/PDZpcbKETks37LYZvAODVAqnYiko/ZQvS9GhslYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MRfca6pCNjYa/lsStBtjG1bQ1QFB5en7xLSuxjVF7uz6f/wF83kkoDKJsHNwA6MLV59u9Qol2zDwgRfoGdjUVT8pyng/JJe7zR9JOh6vfhLsotxuOV6Kb/v93Eh/Dmporued8GBYKZovlOyf93sAJsHQAFD8vlUiDo/8AjC1U68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pj4hXoeo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pj4hXoeo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC2CC4CEE7;
	Wed,  4 Jun 2025 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749027426;
	bh=FR/PDZpcbKETks37LYZvAODVAqnYiko/ZQvS9GhslYc=;
	h=From:To:Cc:Subject:Date:From;
	b=pj4hXoeoQdEd279Rgc2eZYEFUm9VJtjJR4p870zHs9Pj9pwBki+w/4Y/tYA9xfqKU
	 emI03mq9MKYRuADVkQJPbpT/OOACVuYuq7Wo9aGzxhXfgxXAp1C/8gtGgp4Ajvidzk
	 vPkhJIlg1JN0dBcIgz+CPrrENDW7PKFj9O0y3piR+KkkS3qZop/bVAHrUIUdWchU3n
	 bFWnAkL91g5Gmvr8rKUFKWCNJn4HYXT8C4IAkkgin0M8awHYO5xRVIq3v9nRx8hXbY
	 jfv23XAHuYtIxJBu1mm8rZAyTri37Sug40FLHkd70aKfpkpYPM2KML1biZ9fPsGyPW
	 PUi4DiIO13jbQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH v2] f2fs: fix to zero post-eof page
Date: Wed,  4 Jun 2025 16:57:00 +0800
Message-ID: <20250604085700.2454694-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
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

The root cause is user can update post-eof page via mmap, however, f2fs missed
to zero post-eof page in below operations, so, once it expands i_size, then it
will include dummy data locates previous post-eof page, so during below
operations, we need to zero post-eof page.

Operations which can include dummy data after previous i_size after expanding
i_size:
- write
- mapwrite
- truncate
- fallocate
 * preallocate
 * zero_range
 * insert_range
 * collapse_range
- clone_range (doesn’t support in f2fs)
- copy_range (doesn’t support in f2fs)

Cc: stable@kernel.org
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- cover f2fs_zero_post_eof_page w/ invalidate_lock
 fs/f2fs/file.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6bd3de64f2a8..ee5e662d2a4c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -35,6 +35,17 @@
 #include <trace/events/f2fs.h>
 #include <uapi/linux/f2fs.h>
 
+static void f2fs_zero_post_eof_page(struct inode *inode, loff_t new_size)
+{
+	loff_t old_size = i_size_read(inode);
+
+	if (old_size > new_size)
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
+			f2fs_zero_post_eof_page(inode, old_size);
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

