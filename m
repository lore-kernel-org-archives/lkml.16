Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8761B81DC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323008; cv=none; b=se/2M65wYqVD8AbNAgy55dpKank9KTZNyQYYCmo6aqW717IAhi6uz1UflX6iBGs0gZGdMn/h1jLViDUA0Cw0ybpj9U9adP4/MtkXFD3JcupJ3IIwjiSu/SW/AqdM+S0YNg0nmdNbVh6OY1gjMQFguqWKX9UMzgTA/GB3UeDm6dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323008; c=relaxed/simple;
	bh=AXrhhHlWNAtGFoAIFWHnKBM9EQYCCzf/HjO5YRahPEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ik9rsiEq54YOQuphGoMnzWzKOAbpsqQD4NoSGpaMRkafh0yMxFKZ1gAMTeO1WeGqF/uryoR0pnxPkyZhwO2w1IUaXUtR/fYyxQRB+olPkhDIB2ZSQl8FJ+tSTzdtZv9AWzK7GKHvuy/R0oN8hCroa2/8C+muvHG/AEvFpYlD0hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pL2hMj4b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pL2hMj4b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9036C4CEE9;
	Tue, 22 Apr 2025 11:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745323007;
	bh=AXrhhHlWNAtGFoAIFWHnKBM9EQYCCzf/HjO5YRahPEc=;
	h=From:To:Cc:Subject:Date:From;
	b=pL2hMj4bs9wyntPdv5CpWVUNCVU23EW1Xe09MhmfHX8gvM0iAQzfxfYYkYIW3SbHJ
	 nhfjDdF+rtCOkIUkTvYPcuzUzeMovLzGeNAmEtJGnb4FDWv6HcjVqSw1Nkz6lm/sP5
	 ZnU5yj0RqhBDe9f1Fm+cWanKLMXVJ6EtjPm3dP0c9kFvyTmCWuX/9OsRBdz5oVOs5j
	 79t7e+9R7zcuIV5DH1H/FggKStsjUrcchTG8MgfdjiG8CcxOvF0qe0GTDPCxxgHCMY
	 NfwGlz1ye957hTAgkhgZYYX/N+DcZgDZvOZ4rH1k7cdEJ/t7RG+3D66zU6EQaZJ3J9
	 vPIo/ZuUKeC8Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] f2fs: fix to bail out in get_new_segment()
Date: Tue, 22 Apr 2025 19:56:38 +0800
Message-ID: <20250422115638.123455-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

------------[ cut here ]------------
WARNING: CPU: 3 PID: 579 at fs/f2fs/segment.c:2832 new_curseg+0x5e8/0x6dc
pc : new_curseg+0x5e8/0x6dc
Call trace:
 new_curseg+0x5e8/0x6dc
 f2fs_allocate_data_block+0xa54/0xe28
 do_write_page+0x6c/0x194
 f2fs_do_write_node_page+0x38/0x78
 __write_node_page+0x248/0x6d4
 f2fs_sync_node_pages+0x524/0x72c
 f2fs_write_checkpoint+0x4bc/0x9b0
 __checkpoint_and_complete_reqs+0x80/0x244
 issue_checkpoint_thread+0x8c/0xec
 kthread+0x114/0x1bc
 ret_from_fork+0x10/0x20

get_new_segment() detects inconsistent status in between free_segmap
and free_secmap, let's record such error into super block, and bail
out get_new_segment() instead of continue using the segment.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c       | 6 +++++-
 include/linux/f2fs_fs.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 34382447f717..037d06d58fda 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2842,7 +2842,11 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 	}
 got_it:
 	/* set it as dirty segment in free segmap */
-	f2fs_bug_on(sbi, test_bit(segno, free_i->free_segmap));
+	if (test_bit(segno, free_i->free_segmap)) {
+		ret = -EFSCORRUPTED;
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_CORRUPTED_FREE_BITMAP);
+		goto out_unlock;
+	}
 
 	/* no free section in conventional device or conventional zone */
 	if (new_sec && pinning &&
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index c24f8bc01045..5206d63b3386 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -78,6 +78,7 @@ enum stop_cp_reason {
 	STOP_CP_REASON_UPDATE_INODE,
 	STOP_CP_REASON_FLUSH_FAIL,
 	STOP_CP_REASON_NO_SEGMENT,
+	STOP_CP_REASON_CORRUPTED_FREE_BITMAP,
 	STOP_CP_REASON_MAX,
 };
 
-- 
2.49.0

