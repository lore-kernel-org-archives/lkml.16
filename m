Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9082356DB
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747808655; cv=none; b=Y+0piYfzS5ACJVPe3p1+r4LDZwVnAFBgC121/6Vahbdag6ymMTwlRt010ISHf9q8z2ahnpUtf7aUrX2qX7ymGCKAHUbq8DpPoTQbZwsONK0+/icsOpQvMvmX7WyFJ6Wy6QNPfGZA0MF88i8gvAo+a/tJFKGnagO6rsqu5WanzbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747808655; c=relaxed/simple;
	bh=KWJtTLrAUMHCEg+eR7U5ahOPzGqD4xEpJn0kY1SlmNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f58QOGi3GWjDwmQ3ESwuClUXKtaLSmjvW64xueghwBrmODTnrfyG19m4V3ZbD8cuKgKyg1h2rJd1G5A0kXxWQZUABmGRhs47OGLTsm5HR+JgFHukf7PBcuIuP8KMPshFTTW3Rtz9vijHJXT37J6jzY9iUobj/wxoeSNZ4EdJqPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ktb1rYQd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ktb1rYQd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B82C4CEE4;
	Wed, 21 May 2025 06:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747808655;
	bh=KWJtTLrAUMHCEg+eR7U5ahOPzGqD4xEpJn0kY1SlmNY=;
	h=From:To:Cc:Subject:Date:From;
	b=Ktb1rYQd6oqVdANjHbI9HrRY0EBKiMlLNQnyIkvcJzQtjwFpcZzjiedq768eksrvi
	 eFH2OihsH8OACNtzpD9n84LZMxjyImDTK/BPm193X0y7Z746frRDi6+W6U7KqacFVY
	 w2aCtpKxHv4Xymo4eYQkzVqFn85L4XGL1Z8MY7hi2mvy60WRhnkcZBP3qb0HTHaicY
	 kQxP0GPUHyojlaq4HDjsYqdAOYITmOxyO/i7eCVkon1jDfZF49lqSYUN2MQCkxkNxK
	 3L7eTOWpDmdU/L+mECOi14AN25Vy+KQ9gQwKMq1n+ellAz8TRLhdHv5EqBFCy0EbB8
	 mi8tpuLXWwDGA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH] f2fs: fix to zero post-eof page
Date: Wed, 21 May 2025 14:24:03 +0800
Message-ID: <20250521062403.742048-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
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
 fs/f2fs/file.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6bd3de64f2a8..c7c66e591ebc 100644
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
@@ -105,6 +116,9 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	file_update_time(vmf->vma->vm_file);
 	filemap_invalidate_lock_shared(inode->i_mapping);
+
+	f2fs_zero_post_eof_page(inode, (folio->index + 1) << PAGE_SHIFT);
+
 	folio_lock(folio);
 	if (unlikely(folio->mapping != inode->i_mapping ||
 			folio_pos(folio) > i_size_read(inode) ||
@@ -1109,6 +1123,8 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 		filemap_invalidate_lock(inode->i_mapping);
 
+		if (attr->ia_size > old_size)
+			f2fs_zero_post_eof_page(inode, old_size);
 		truncate_setsize(inode, attr->ia_size);
 
 		if (attr->ia_size <= old_size)
@@ -1227,6 +1243,8 @@ static int f2fs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
+	f2fs_zero_post_eof_page(inode, offset + len);
+
 	pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
 	pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
 
@@ -1542,6 +1560,8 @@ static int f2fs_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
+	f2fs_zero_post_eof_page(inode, offset + len);
+
 	ret = f2fs_do_collapse(inode, offset, len);
 	if (ret)
 		return ret;
@@ -1631,6 +1651,8 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 	if (ret)
 		return ret;
 
+	f2fs_zero_post_eof_page(inode, offset + len);
+
 	pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
 	pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
 
@@ -1754,6 +1776,8 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
+	f2fs_zero_post_eof_page(inode, offset + len);
+
 	pg_start = offset >> PAGE_SHIFT;
 	pg_end = (offset + len) >> PAGE_SHIFT;
 	delta = pg_end - pg_start;
@@ -1819,6 +1843,8 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 	if (err)
 		return err;
 
+	f2fs_zero_post_eof_page(inode, offset + len);
+
 	f2fs_balance_fs(sbi, true);
 
 	pg_start = ((unsigned long long)offset) >> PAGE_SHIFT;
@@ -4860,6 +4886,8 @@ static ssize_t f2fs_write_checks(struct kiocb *iocb, struct iov_iter *from)
 	err = file_modified(file);
 	if (err)
 		return err;
+
+	f2fs_zero_post_eof_page(inode, iocb->ki_pos + iov_iter_count(from));
 	return count;
 }
 
-- 
2.49.0

